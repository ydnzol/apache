/* ====================================================================
 * The Apache Software License, Version 1.1
 *
 * Copyright (c) 2000-2002 The Apache Software Foundation.  All rights
 * reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in
 *    the documentation and/or other materials provided with the
 *    distribution.
 *
 * 3. The end-user documentation included with the redistribution,
 *    if any, must include the following acknowledgment:
 *       "This product includes software developed by the
 *        Apache Software Foundation (http://www.apache.org/)."
 *    Alternately, this acknowledgment may appear in the software itself,
 *    if and wherever such third-party acknowledgments normally appear.
 *
 * 4. The names "Apache" and "Apache Software Foundation" must
 *    not be used to endorse or promote products derived from this
 *    software without prior written permission. For written
 *    permission, please contact apache@apache.org.
 *
 * 5. Products derived from this software may not be called "Apache",
 *    nor may "Apache" appear in their name, without prior written
 *    permission of the Apache Software Foundation.
 *
 * THIS SOFTWARE IS PROVIDED ``AS IS'' AND ANY EXPRESSED OR IMPLIED
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED.  IN NO EVENT SHALL THE APACHE SOFTWARE FOUNDATION OR
 * ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
 * USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
 * OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals on behalf of the Apache Software Foundation.  For more
 * information on the Apache Software Foundation, please see
 * <http://www.apache.org/>.
 */

#include "apr_general.h"
#include "apr_rmm.h"
#include "apr_errno.h"
#include "apr_lib.h"
#include "apr_strings.h"

typedef struct rmm_block_t {
    apr_size_t size;
    apr_rmm_off_t prev;
    apr_rmm_off_t next;
} rmm_block_t;

/* Always at our apr_rmm_off(0):
 */
typedef struct rmm_hdr_block_t {
    apr_size_t abssize;
    apr_rmm_off_t /* rmm_block_t */ firstused;
    apr_rmm_off_t /* rmm_block_t */ firstfree;
} rmm_hdr_block_t;

struct apr_rmm_t {
    apr_pool_t *p;
    rmm_hdr_block_t *base;
    apr_size_t size;
    apr_anylock_t lock;
};

static apr_rmm_off_t find_block_by_offset(apr_rmm_t *rmm, apr_rmm_off_t next, 
                                          apr_rmm_off_t find, int includes)
{
    apr_rmm_off_t prev = 0;

    while (next) {
        struct rmm_block_t *blk = (rmm_block_t*)((char*)rmm->base + next);

        if (find == next)
            return next;

        /* Overshot? */
        if (find < next)
            return includes ? prev : 0;

        prev = next;
        next = blk->next;
    }
    return includes ? prev : 0;
}

static apr_rmm_off_t find_block_of_size(apr_rmm_t *rmm, apr_size_t size)
{
    apr_rmm_off_t next = rmm->base->firstfree;
    apr_rmm_off_t best = 0;
    apr_rmm_off_t bestsize = 0;

    while (next) {
        struct rmm_block_t *blk = (rmm_block_t*)((char*)rmm->base + next);

        if (blk->size == size)
            return next;

        if (blk->size >= size) {
            /* XXX: sub optimal algorithm 
             * We need the most thorough best-fit logic, since we can
             * never grow our rmm, we are SOL when we hit the wall.
             */
            if (!bestsize || (blk->size < bestsize)) {
                bestsize = blk->size;
                best = next;
            }
        }

        next = blk->next;
    }

    if (bestsize - size > sizeof(struct rmm_block_t*)) {
        struct rmm_block_t *blk = (rmm_block_t*)((char*)rmm->base + best);
        struct rmm_block_t *new = (rmm_block_t*)((char*)rmm->base + best + size);

        new->size = blk->size - size;
        new->next = blk->next;
        new->prev = best;

        blk->size = size;
        blk->next = best + size;

        if (new->next) {
            blk = (rmm_block_t*)((char*)rmm->base + blk->next);
            blk->prev = best + size;
        }
    }

    if (best) {
        return best;
    }
     
    return 0;
}

static void move_block(apr_rmm_t *rmm, apr_rmm_off_t this, int free)
{   
    struct rmm_block_t *blk = (rmm_block_t*)((char*)rmm->base + this);

    /* close the gap */
    if (blk->prev) {
        struct rmm_block_t *prev = (rmm_block_t*)((char*)rmm->base + blk->prev);
        prev->next = blk->next;
    }
    else {
        if (free) {
            rmm->base->firstused = blk->next;
        }
        else {
            rmm->base->firstfree = blk->next;
        }
    }
    if (blk->next) {
        struct rmm_block_t *next = (rmm_block_t*)((char*)rmm->base + blk->next);
        next->prev = blk->prev;
    }

    /* now find it in the other list, pushing it to the head if required */
    if (free) {
        blk->prev = find_block_by_offset(rmm, rmm->base->firstfree, this, 1);
        if (!blk->prev) {
            blk->next = rmm->base->firstfree;
            rmm->base->firstfree = this;
        }
    }
    else {
        blk->prev = find_block_by_offset(rmm, rmm->base->firstused, this, 1);
        if (!blk->prev) {
            blk->next = rmm->base->firstused;
            rmm->base->firstused = this;
        }
    }

    /* and open it up */
    if (blk->prev) {
        struct rmm_block_t *prev = (rmm_block_t*)((char*)rmm->base + blk->prev);
        if (free && (blk->prev + prev->size == this)) {
            /* Collapse us into our predecessor */
            prev->size += blk->size;
            this = blk->prev;
            blk = prev;
        }
        else {
            blk->next = prev->next;
            prev->next = this;
        }
    }

    if (blk->next) {
        struct rmm_block_t *next = (rmm_block_t*)((char*)rmm->base + blk->next);
        if (free && (this + blk->size == blk->next)) {
            /* Collapse us into our successor */
            blk->size += next->size;
            blk->next = next->next;
            if (blk->next) {
                next = (rmm_block_t*)((char*)rmm->base + blk->next);
                next->prev = this;
            }
        }
        else {
            next->prev = this;
        }
    }
}

APU_DECLARE(apr_status_t) apr_rmm_init(apr_rmm_t **rmm, apr_anylock_t *lock, 
                                       void *base, apr_size_t size,
                                       apr_pool_t *p)
{
    apr_status_t rv;
    rmm_block_t *blk;
    apr_anylock_t nulllock;
    
    if (!lock) {
        nulllock.type = apr_anylock_none;
        nulllock.lock.pm = NULL;
        lock = &nulllock;
    }
    if ((rv = APR_ANYLOCK_LOCK(lock)) != APR_SUCCESS)
        return rv;

    (*rmm) = (apr_rmm_t *)apr_pcalloc(p, sizeof(apr_rmm_t));
    (*rmm)->p = p;
    (*rmm)->base = base;
    (*rmm)->size = size;
    (*rmm)->lock = *lock;

    (*rmm)->base->abssize = size;
    (*rmm)->base->firstused = 0;
    (*rmm)->base->firstfree = sizeof(rmm_hdr_block_t);

    blk = (rmm_block_t *)((char*)base + (*rmm)->base->firstfree);

    blk->size = size - (*rmm)->base->firstfree;
    blk->prev = 0;
    blk->next = 0;

    APR_ANYLOCK_UNLOCK(lock);
    return APR_SUCCESS;
}

APU_DECLARE(apr_status_t) apr_rmm_destroy(apr_rmm_t *rmm)
{
    apr_status_t rv;
    rmm_block_t *blk;

    if ((rv = APR_ANYLOCK_LOCK(&rmm->lock)) != APR_SUCCESS) {
        return rv;
    }
    /* Blast it all --- no going back :) */
    if (rmm->base->firstused) {
        apr_rmm_off_t this = rmm->base->firstused;
        do {
            blk = (rmm_block_t *)((char*)rmm->base + this);
            this = blk->next;
            blk->next = blk->prev = 0;
        } while (this);
        rmm->base->firstused = 0;
    }
    if (rmm->base->firstfree) {
        apr_rmm_off_t this = rmm->base->firstfree;
        do {
            blk = (rmm_block_t *)((char*)rmm->base + this);
            this = blk->next;
            blk->next = blk->prev = 0;
        } while (this);
        rmm->base->firstfree = 0;
    }
    rmm->base->abssize = 0;
    rmm->size = 0;

    APR_ANYLOCK_UNLOCK(&rmm->lock);
    return APR_SUCCESS;
}

APU_DECLARE(apr_status_t) apr_rmm_attach(apr_rmm_t **rmm, apr_anylock_t *lock,
                                         void *base, apr_pool_t *p)
{
    apr_anylock_t nulllock;

    if (!lock) {
        nulllock.type = apr_anylock_none;
        nulllock.lock.pm = NULL;
        lock = &nulllock;
    }

    /* sanity would be good here */
    (*rmm) = (apr_rmm_t *)apr_pcalloc(p, sizeof(apr_rmm_t));
    (*rmm)->p = p;
    (*rmm)->base = base;
    (*rmm)->size = (*rmm)->base->abssize;
    (*rmm)->lock = *lock;
    return APR_SUCCESS;
}

APU_DECLARE(apr_status_t) apr_rmm_detach(apr_rmm_t *rmm) 
{
    /* A noop until we introduce locked/refcounts */
    return APR_SUCCESS;
}

union grainbit {
    long l;
    long *pl;
};

static const apr_size_t grain = sizeof(union grainbit);

APU_DECLARE(apr_rmm_off_t) apr_rmm_malloc(apr_rmm_t *rmm, apr_size_t reqsize)
{
    apr_status_t rv;
    apr_rmm_off_t this;
    
    reqsize = (1 + (reqsize - 1) / grain) * grain;

    if ((rv = APR_ANYLOCK_LOCK(&rmm->lock)) != APR_SUCCESS)
        return rv;

    this = find_block_of_size(rmm, reqsize + sizeof(rmm_block_t));

    if (this) {
        move_block(rmm, this, 0);
        this += sizeof(rmm_block_t);
    }

    APR_ANYLOCK_UNLOCK(&rmm->lock);
    return this;
}

APU_DECLARE(apr_rmm_off_t) apr_rmm_calloc(apr_rmm_t *rmm, apr_size_t reqsize)
{
    apr_status_t rv;
    apr_rmm_off_t this;
        
    reqsize = (1 + (reqsize - 1) / grain) * grain;

    if ((rv = APR_ANYLOCK_LOCK(&rmm->lock)) != APR_SUCCESS)
        return rv;

    this = find_block_of_size(rmm, reqsize + sizeof(rmm_block_t));

    if (this) {
        move_block(rmm, this, 0);
        this += sizeof(rmm_block_t);
        memset((char*)rmm->base + this, 0, reqsize);
    }

    APR_ANYLOCK_UNLOCK(&rmm->lock);
    return this;
}

APU_DECLARE(apr_rmm_off_t) apr_rmm_realloc(apr_rmm_t *rmm, void *entity,
                                           apr_size_t reqsize)
{
    apr_rmm_off_t this;
    apr_rmm_off_t old;

    if (!entity) {
        return apr_rmm_malloc(rmm, reqsize);
    }

    reqsize = (1 + (reqsize - 1) / grain) * grain;
    old = apr_rmm_offset_get(rmm, entity);

    if ((this = apr_rmm_malloc(rmm, reqsize)) < 0) {
        return this;
    }

    if (old >= 0) {
        memcpy(apr_rmm_addr_get(rmm, this),
               apr_rmm_addr_get(rmm, old), reqsize);
        apr_rmm_free(rmm, old);
    }

    return this;
}

APU_DECLARE(apr_status_t) apr_rmm_free(apr_rmm_t *rmm, apr_rmm_off_t this)
{
    apr_status_t rv;
    struct rmm_block_t *blk;

    /* A little sanity check is always healthy, especially here.
     * If we really cared, we could make this compile-time
     */
    if (this < sizeof(rmm_hdr_block_t) + sizeof(rmm_block_t)) {
        return APR_EINVAL;
    }

    this -= sizeof(rmm_block_t);

    blk = (rmm_block_t*)((char*)rmm->base + this);

    if ((rv = APR_ANYLOCK_LOCK(&rmm->lock)) != APR_SUCCESS) {
        return rv;
    }
    if (blk->prev) {
        struct rmm_block_t *prev = (rmm_block_t*)((char*)rmm->base + blk->prev);
        if (prev->next != this) {
            APR_ANYLOCK_UNLOCK(&rmm->lock);
            return APR_EINVAL;
        }
    }
    else {
        if (rmm->base->firstused != this) {
            APR_ANYLOCK_UNLOCK(&rmm->lock);
            return APR_EINVAL;
        }
    }

    if (blk->next) {
        struct rmm_block_t *next = (rmm_block_t*)((char*)rmm->base + blk->next);
        if (next->prev != this) {
            APR_ANYLOCK_UNLOCK(&rmm->lock);
            return APR_EINVAL;
        }
    }

    /* Ok, it remained [apparently] sane, so unlink it
     */
    move_block(rmm, this, 1);
    
    APR_ANYLOCK_UNLOCK(&rmm->lock);
    return APR_SUCCESS;
}

APU_DECLARE(void *) apr_rmm_addr_get(apr_rmm_t *rmm, apr_rmm_off_t entity) 
{
    /* debug-sanity checking here would be good
     */
    return (void*)((char*)rmm->base + entity);
}

APU_DECLARE(apr_rmm_off_t) apr_rmm_offset_get(apr_rmm_t *rmm, void* entity)
{
    /* debug, or always, sanity checking here would be good
     * since the primitive is apr_rmm_off_t, I don't mind penalizing
     * inverse conversions for safety, unless someone can prove that
     * there is no choice in some cases.
     */
    return ((char*)entity - (char*)rmm->base);
}

APU_DECLARE(apr_size_t) apr_rmm_overhead_get(int n) 
{
    return sizeof(rmm_hdr_block_t) + n * sizeof(rmm_block_t);
}
