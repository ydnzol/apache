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

#include "threadproc.h"
#include "apr_strings.h"
#include "apr_portable.h"
#include "apr_signal.h"

APR_DECLARE(apr_status_t) apr_procattr_create(apr_procattr_t **new,
                                              apr_pool_t *pool)
{
    (*new) = (apr_procattr_t *)apr_pcalloc(pool, sizeof(apr_procattr_t));

    if ((*new) == NULL) {
        return APR_ENOMEM;
    }
    (*new)->pool = pool;
    (*new)->cmdtype = APR_PROGRAM;
    return APR_SUCCESS;
}

APR_DECLARE(apr_status_t) apr_procattr_io_set(apr_procattr_t *attr,
                                              apr_int32_t in,
                                              apr_int32_t out,
                                              apr_int32_t err)
{
    apr_status_t status;
    if (in != 0) {
        if ((status = apr_file_pipe_create(&attr->child_in, &attr->parent_in,
                                           attr->pool)) != APR_SUCCESS) {
            return status;
        }

        switch (in) {
        case APR_FULL_BLOCK:
            break;
        case APR_PARENT_BLOCK:
            apr_file_pipe_timeout_set(attr->child_in, 0);
            break;
        case APR_CHILD_BLOCK:
            apr_file_pipe_timeout_set(attr->parent_in, 0);
            break;
        default:
            apr_file_pipe_timeout_set(attr->child_in, 0);
            apr_file_pipe_timeout_set(attr->parent_in, 0);
        }
    }

    if (out) {
        if ((status = apr_file_pipe_create(&attr->parent_out, &attr->child_out,
                                           attr->pool)) != APR_SUCCESS) {
            return status;
        }

        switch (out) {
        case APR_FULL_BLOCK:
            break;
        case APR_PARENT_BLOCK:
            apr_file_pipe_timeout_set(attr->child_out, 0);
            break;
        case APR_CHILD_BLOCK:
            apr_file_pipe_timeout_set(attr->parent_out, 0);
            break;
        default:
            apr_file_pipe_timeout_set(attr->child_out, 0);
            apr_file_pipe_timeout_set(attr->parent_out, 0);
        }
    }

    if (err) {
        if ((status = apr_file_pipe_create(&attr->parent_err, &attr->child_err,
                                           attr->pool)) != APR_SUCCESS) {
            return status;
        }

        switch (err) {
        case APR_FULL_BLOCK:
            break;
        case APR_PARENT_BLOCK:
            apr_file_pipe_timeout_set(attr->child_err, 0);
            break;
        case APR_CHILD_BLOCK:
            apr_file_pipe_timeout_set(attr->parent_err, 0);
            break;
        default:
            apr_file_pipe_timeout_set(attr->child_err, 0);
            apr_file_pipe_timeout_set(attr->parent_err, 0);
        }
    }

    return APR_SUCCESS;
}


APR_DECLARE(apr_status_t) apr_procattr_child_in_set(apr_procattr_t *attr,
                                                    apr_file_t *child_in,
                                                    apr_file_t *parent_in)
{
    if (attr->child_in == NULL && attr->parent_in == NULL)
        apr_file_pipe_create(&attr->child_in, &attr->parent_in, attr->pool);

    if (child_in != NULL)
        apr_file_dup2(attr->child_in, child_in, attr->pool);

    if (parent_in != NULL)
        apr_file_dup2(attr->parent_in, parent_in, attr->pool);

    return APR_SUCCESS;
}


APR_DECLARE(apr_status_t) apr_procattr_child_out_set(apr_procattr_t *attr,
                                                     apr_file_t *child_out,
                                                     apr_file_t *parent_out)
{
    if (attr->child_out == NULL && attr->parent_out == NULL)
        apr_file_pipe_create(&attr->child_out, &attr->parent_out, attr->pool);

    if (child_out != NULL)
        apr_file_dup2(attr->child_out, child_out, attr->pool);

    if (parent_out != NULL)
        apr_file_dup2(attr->parent_out, parent_out, attr->pool);

    return APR_SUCCESS;
}


APR_DECLARE(apr_status_t) apr_procattr_child_err_set(apr_procattr_t *attr,
                                                     apr_file_t *child_err,
                                                     apr_file_t *parent_err)
{
    if (attr->child_err == NULL && attr->parent_err == NULL)
        apr_file_pipe_create(&attr->child_err, &attr->parent_err, attr->pool);

    if (child_err != NULL)
        apr_file_dup2(attr->child_err, child_err, attr->pool);

    if (parent_err != NULL)
        apr_file_dup2(attr->parent_err, parent_err, attr->pool);

    return APR_SUCCESS;
}


APR_DECLARE(apr_status_t) apr_procattr_dir_set(apr_procattr_t *attr,
                                               const char *dir)
{
    attr->currdir = apr_pstrdup(attr->pool, dir);
    if (attr->currdir) {
        return APR_SUCCESS;
    }

    return APR_ENOMEM;
}

APR_DECLARE(apr_status_t) apr_procattr_cmdtype_set(apr_procattr_t *attr,
                                                   apr_cmdtype_e cmd)
{
    attr->cmdtype = cmd;
    return APR_SUCCESS;
}

APR_DECLARE(apr_status_t) apr_procattr_detach_set(apr_procattr_t *attr,
                                                  apr_int32_t detach)
{
    attr->detached = detach;
    return APR_SUCCESS;
}

APR_DECLARE(apr_status_t) apr_proc_fork(apr_proc_t *proc, apr_pool_t *pool)
{
    int pid;

    if ((pid = fork()) < 0) {
        return errno;
    }
    else if (pid == 0) {
        proc->pid = pid;
        proc->in = NULL;
        proc->out = NULL;
        proc->err = NULL;

        return APR_INCHILD;
    }

    proc->pid = pid;
    proc->in = NULL;
    proc->out = NULL;
    proc->err = NULL;

    return APR_INPARENT;
}

static apr_status_t limit_proc(apr_procattr_t *attr)
{
#if APR_HAVE_STRUCT_RLIMIT && APR_HAVE_SETRLIMIT
#ifdef RLIMIT_CPU
    if (attr->limit_cpu != NULL) {
        if ((setrlimit(RLIMIT_CPU, attr->limit_cpu)) != 0) {
            return errno;
        }
    }
#endif
#ifdef RLIMIT_NPROC
    if (attr->limit_nproc != NULL) {
        if ((setrlimit(RLIMIT_NPROC, attr->limit_nproc)) != 0) {
            return errno;
        }
    }
#endif
#ifdef RLIMIT_NOFILE
    if (attr->limit_nofile != NULL) {
        if ((setrlimit(RLIMIT_NOFILE, attr->limit_nofile)) != 0) {
            return errno;
        }
    }
#endif
#if defined(RLIMIT_AS)
    if (attr->limit_mem != NULL) {
        if ((setrlimit(RLIMIT_AS, attr->limit_mem)) != 0) {
            return errno;
        }
    }
#elif defined(RLIMIT_DATA)
    if (attr->limit_mem != NULL) {
        if ((setrlimit(RLIMIT_DATA, attr->limit_mem)) != 0) {
            return errno;
        }
    }
#elif defined(RLIMIT_VMEM)
    if (attr->limit_mem != NULL) {
        if ((setrlimit(RLIMIT_VMEM, attr->limit_mem)) != 0) {
            return errno;
        }
    }
#endif
#else
    /*
     * Maybe make a note in error_log that setrlimit isn't supported??
     */

#endif
    return APR_SUCCESS;
}

APR_DECLARE(apr_status_t) apr_proc_create(apr_proc_t *new,
                                          const char *progname,
                                          const char * const *args,
                                          const char * const *env,
                                          apr_procattr_t *attr,
                                          apr_pool_t *pool)
{
    int i;
    const char **newargs;

    new->in = attr->parent_in;
    new->err = attr->parent_err;
    new->out = attr->parent_out;

    if ((new->pid = fork()) < 0) {
        return errno;
    }
    else if (new->pid == 0) {
        int status;
        /* child process */

        /*
         * If we do exec cleanup before the dup2() calls to set up pipes
         * on 0-2, we accidentally close the pipes used by programs like
         * mod_cgid.
         *
         * If we do exec cleanup after the dup2() calls, cleanup can accidentally
         * close our pipes which replaced any files which previously had
         * descriptors 0-2.
         *
         * The solution is to kill the cleanup for the pipes, then do
         * exec cleanup, then do the dup2() calls.
         */

        if (attr->child_in) {
            apr_pool_cleanup_kill(apr_file_pool_get(attr->child_in),
                                  attr->child_in, apr_unix_file_cleanup);
        }

        if (attr->child_out) {
            apr_pool_cleanup_kill(apr_file_pool_get(attr->child_out),
                                  attr->child_out, apr_unix_file_cleanup);
        }

        if (attr->child_err) {
            apr_pool_cleanup_kill(apr_file_pool_get(attr->child_err),
                                  attr->child_err, apr_unix_file_cleanup);
        }

        apr_pool_cleanup_for_exec();

        if (attr->child_in) {
            apr_file_close(attr->parent_in);
            dup2(attr->child_in->filedes, STDIN_FILENO);
            apr_file_close(attr->child_in);
        }

        if (attr->child_out) {
            apr_file_close(attr->parent_out);
            dup2(attr->child_out->filedes, STDOUT_FILENO);
            apr_file_close(attr->child_out);
        }

        if (attr->child_err) {
            apr_file_close(attr->parent_err);
            dup2(attr->child_err->filedes, STDERR_FILENO);
            apr_file_close(attr->child_err);
        }

        apr_signal(SIGCHLD, SIG_DFL); /* not sure if this is needed or not */

        if (attr->currdir != NULL) {
            if (chdir(attr->currdir) == -1) {
                exit(-1);   /* We have big problems, the child should exit. */
            }
        }

        if ((status = limit_proc(attr)) != APR_SUCCESS) {
            return status;
        }

        if (attr->cmdtype == APR_SHELLCMD) {
            i = 0;
            while (args[i]) {
                i++;
            }

            newargs = (const char **)apr_palloc(pool, sizeof (char *) * (i + 3));
            newargs[0] = SHELL_PATH;
            newargs[1] = "-c";

            i = 0;
            while (args[i]) {
                newargs[i + 2] = args[i];
                i++;
            }

            newargs[i + 2] = NULL;

            if (attr->detached) {
                apr_proc_detach(APR_PROC_DETACH_DAEMONIZE);
            }

            execve(SHELL_PATH, (char * const *) newargs, (char * const *)env);
        }
        else if (attr->cmdtype == APR_PROGRAM) {
            if (attr->detached) {
                apr_proc_detach(APR_PROC_DETACH_DAEMONIZE);
            }

            execve(progname, (char * const *)args, (char * const *)env);
        }
        else if (attr->cmdtype == APR_PROGRAM_ENV) {
            if (attr->detached) {
                apr_proc_detach(APR_PROC_DETACH_DAEMONIZE);
            }

            execv(progname, (char * const *)args);
        }
        else {
            /* APR_PROGRAM_PATH */
            if (attr->detached) {
                apr_proc_detach(APR_PROC_DETACH_DAEMONIZE);
            }

            execvp(progname, (char * const *)args);
        }
        exit(-1);  /* if we get here, there is a problem, so exit with an
                    * error code. */
    }

    /* Parent process */
    if (attr->child_in) {
        apr_file_close(attr->child_in);
    }

    if (attr->child_out) {
        apr_file_close(attr->child_out);
    }

    if (attr->child_err) {
        apr_file_close(attr->child_err);
    }

    return APR_SUCCESS;
}

APR_DECLARE(apr_status_t) apr_proc_wait_all_procs(apr_proc_t *proc,
                                                  int *exitcode,
                                                  apr_exit_why_e *exitwhy,
                                                  apr_wait_how_e waithow,
                                                  apr_pool_t *p)
{
    proc->pid = -1;
    return apr_proc_wait(proc, exitcode, exitwhy, waithow);
}

APR_DECLARE(apr_status_t) apr_proc_wait(apr_proc_t *proc,
                                        int *exitcode, apr_exit_why_e *exitwhy,
                                        apr_wait_how_e waithow)
{
    pid_t pstatus;
    int waitpid_options = WUNTRACED;
    int exit_int;
    int ignore;
    apr_exit_why_e ignorewhy;

    if (exitcode == NULL) {
        exitcode = &ignore;
    }

    if (exitwhy == NULL) {
        exitwhy = &ignorewhy;
    }

    if (waithow != APR_WAIT) {
        waitpid_options |= WNOHANG;
    }

    if ((pstatus = waitpid(proc->pid, &exit_int, waitpid_options)) > 0) {
        proc->pid = pstatus;

        if (WIFEXITED(exit_int)) {
            *exitwhy = APR_PROC_EXIT;
            *exitcode = WEXITSTATUS(exit_int);
        }
        else if (WIFSIGNALED(exit_int)) {
            *exitwhy = APR_PROC_SIGNAL;

#ifdef WCOREDUMP
            if (WCOREDUMP(exit_int)) {
                *exitwhy |= APR_PROC_SIGNAL_CORE;
            }
#endif

            *exitcode = WTERMSIG(exit_int);
        }
        else {
            /* unexpected condition */
            return APR_EGENERAL;
        }

        return APR_CHILD_DONE;
    }
    else if (pstatus == 0) {
        return APR_CHILD_NOTDONE;
    }

    return errno;
}

APR_DECLARE(apr_status_t) apr_procattr_limit_set(apr_procattr_t *attr,
                                                 apr_int32_t what,
                                                 struct rlimit *limit)
{
    switch(what) {
        case APR_LIMIT_CPU:
#ifdef RLIMIT_CPU
            attr->limit_cpu = limit;
            break;
#else
            return APR_ENOTIMPL;
#endif

        case APR_LIMIT_MEM:
#if defined (RLIMIT_DATA) || defined (RLIMIT_VMEM) || defined(RLIMIT_AS)
            attr->limit_mem = limit;
            break;
#else
            return APR_ENOTIMPL;
#endif

        case APR_LIMIT_NPROC:
#ifdef RLIMIT_NPROC
            attr->limit_nproc = limit;
            break;
#else
            return APR_ENOTIMPL;
#endif

        case APR_LIMIT_NOFILE:
#ifdef RLIMIT_NOFILE
            attr->limit_nofile = limit;
            break;
#else
            return APR_ENOTIMPL;
#endif

    }

    return APR_SUCCESS;
}
