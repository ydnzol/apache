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

#ifndef APR_FILE_INFO_H
#define APR_FILE_INFO_H

#include "apr.h"
#include "apr_user.h"
#include "apr_pools.h"
#include "apr_time.h"
#include "apr_errno.h"

#if APR_HAVE_SYS_UIO_H
#include <sys/uio.h>
#endif

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */
/**
 * @file apr_file_info.h
 * @brief APR File handling
 */
/**
 * @defgroup APR_File_Handle File Handling Functions
 * @ingroup APR
 * @{
 */

typedef enum {
    APR_NOFILE = 0,     /**< the file exists, but APR doesn't know its type */
    APR_REG,            /**< a regular file */
    APR_DIR,            /**< a directory */
    APR_CHR,            /**< a character device */
    APR_BLK,            /**< a block device */
    APR_PIPE,           /**< a FIFO / pipe */
    APR_LNK,            /**< a symbolic link */
    APR_SOCK            /**< a [unix domain] socket */
} apr_filetype_e; 

/**
 * @defgroup APR_file_handle_permission File Permissions flags 
 * @{
 */

#define APR_UREAD       0x0400 /**< Read by user */
#define APR_UWRITE      0x0200 /**< Write by user */
#define APR_UEXECUTE    0x0100 /**< Execute by user */

#define APR_GREAD       0x0040 /**< Read by group */
#define APR_GWRITE      0x0020 /**< Write by group */
#define APR_GEXECUTE    0x0010 /**< Execute by group */

#define APR_WREAD       0x0004 /**< Read by others */
#define APR_WWRITE      0x0002 /**< Write by others */
#define APR_WEXECUTE    0x0001 /**< Execute by others */

#define APR_OS_DEFAULT  0x0FFF /**< use OS's default permissions */

/* additional permission flags for apr_file_copy  and apr_file_append */
#define APR_FILE_SOURCE_PERMS 0x1000 /**< Copy source file's permissions */

/** @} */


/**
 * Structure for referencing directories.
 * @defvar apr_dir_t
 */
typedef struct apr_dir_t          apr_dir_t;
/**
 * Structure for determining file permissions.
 * @defvar apr_fileperms_t
 */
typedef apr_int32_t               apr_fileperms_t;
#if (defined WIN32) || (defined NETWARE)
/**
 * Structure for determining the inode of the file.
 * @defvar apr_ino_t
 */
typedef apr_uint64_t              apr_ino_t;
/**
 * Structure for determining the device the file is on.
 */
typedef apr_uint32_t              apr_dev_t;
#else
/** The inode of the file. */
typedef ino_t                     apr_ino_t;
/**
 * Structure for determining the device the file is on.
 */
typedef dev_t                     apr_dev_t;
#endif

/**
 * @defgroup APR_File_Info Stat Functions
 * @{
 */
typedef struct apr_finfo_t        apr_finfo_t;

#define APR_FINFO_LINK   0x00000001 /**< Stat the link not the file itself if it is a link */
#define APR_FINFO_MTIME  0x00000010 /**< Modification Time */
#define APR_FINFO_CTIME  0x00000020 /**< Creation Time */
#define APR_FINFO_ATIME  0x00000040 /**< Access Time */
#define APR_FINFO_SIZE   0x00000100 /**< Size of the file */
#define APR_FINFO_CSIZE  0x00000200 /**< Storage size consumed by the file */
#define APR_FINFO_DEV    0x00001000
#define APR_FINFO_INODE  0x00002000
#define APR_FINFO_NLINK  0x00004000
#define APR_FINFO_TYPE   0x00008000
#define APR_FINFO_USER   0x00010000 
#define APR_FINFO_GROUP  0x00020000 
#define APR_FINFO_UPROT  0x00100000 
#define APR_FINFO_GPROT  0x00200000
#define APR_FINFO_WPROT  0x00400000
#define APR_FINFO_ICASE  0x01000000  /**<  if dev is case insensitive */
#define APR_FINFO_NAME   0x02000000  /**<  ->name in proper case */

#define APR_FINFO_MIN    0x00008170  /**<  type, mtime, ctime, atime, size */
#define APR_FINFO_IDENT  0x00003000  /**<  dev and inode */
#define APR_FINFO_OWNER  0x00030000  /**<  user and group */
#define APR_FINFO_PROT   0x00700000  /**<  all protections */
#define APR_FINFO_NORM   0x0073b170  /**<  an atomic unix apr_stat() */
#define APR_FINFO_DIRENT 0x02000000  /**<  an atomic unix apr_dir_read() */

/**
 * The file information structure.  This is analogous to the POSIX
 * stat structure.
 */
struct apr_finfo_t {
    /** Allocates memory and closes lingering handles in the specified pool */
    apr_pool_t *pool;
    /** The bitmask describing valid fields of this apr_finfo_t structure 
     *  including all available 'wanted' fields and potentially more */
    apr_int32_t valid;
    /** The access permissions of the file.  Mimics Unix access rights. */
    apr_fileperms_t protection;
    /** The type of file.  One of APR_NOFILE, APR_REG, APR_DIR, APR_CHR, 
     *  APR_BLK, APR_PIPE, APR_LNK, APR_SOCK 
     */
    apr_filetype_e filetype;
    /** The user id that owns the file */
    apr_uid_t user;
    /** The group id that owns the file */
    apr_gid_t group;
    /** The inode of the file. */
    apr_ino_t inode;
    /** The id of the device the file is on. */
    apr_dev_t device;
    /** The number of hard links to the file. */
    apr_int32_t nlink;
    /** The size of the file */
    apr_off_t size;
    /** The storage size consumed by the file */
    apr_off_t csize;
    /** The time the file was last accessed */
    apr_time_t atime;
    /** The time the file was last modified */
    apr_time_t mtime;
    /** The time the file was last changed */
    apr_time_t ctime;
    /** The full pathname of the file */
    const char *fname;
    /** The file's name (no path) in filesystem case */
    const char *name;
    /** The file's handle, if accessed (can be submitted to apr_duphandle) */
    struct apr_file_t *filehand;
};

/**
 * get the specified file's stats.  The file is specified by filename, 
 * instead of using a pre-opened file.
 * @param finfo Where to store the information about the file, which is
 * never touched if the call fails.
 * @param fname The name of the file to stat.
 * @param wanted The desired apr_finfo_t fields, as a bit flag of APR_FINFO_ values 
 * @param cont the pool to use to allocate the new file. 
 */ 
APR_DECLARE(apr_status_t) apr_stat(apr_finfo_t *finfo, const char *fname,
                                   apr_int32_t wanted, apr_pool_t *cont);

/**
 * get the specified file's stats.  The file is specified by filename, 
 * instead of using a pre-opened file.  If the file is a symlink, this function
 * will get the stats for the symlink not the file the symlink refers to.
 * @param finfo Where to store the information about the file, which is
 * never touched if the call fails.
 * @param fname The name of the file to stat.
 * @param wanted The desired apr_finfo_t fields, as a bit flag of APR_FINFO_ values 
 * @param cont the pool to use to allocate the new file. 
 * @deprecated This function is depreciated, it's equivilant to calling apr_stat with 
 * the wanted flag value APR_FINFO_LINK
 */ 
APR_DECLARE(apr_status_t) apr_lstat(apr_finfo_t *finfo, const char *fname,
                                    apr_int32_t wanted, apr_pool_t *cont);
/** @} */
/**
 * @defgroup APR_DIRECTORY Directory Manipulation Functions
 * @{
 */

/**
 * Open the specified directory.
 * @param new_dir The opened directory descriptor.
 * @param dirname The full path to the directory (use / on all systems)
 * @param cont The pool to use.
 */                        
APR_DECLARE(apr_status_t) apr_dir_open(apr_dir_t **new_dir, 
                                       const char *dirname, 
                                       apr_pool_t *cont);

/**
 * close the specified directory. 
 * @param thedir the directory descriptor to close.
 */                        
APR_DECLARE(apr_status_t) apr_dir_close(apr_dir_t *thedir);

/**
 * Read the next entry from the specified directory. 
 * @param finfo the file info structure and filled in by apr_dir_read
 * @param wanted The desired apr_finfo_t fields, as a bit flag of APR_FINFO_ values 
 * @param thedir the directory descriptor returned from apr_dir_open
 * @remark All systems return . and .. as the first two files.
 */                        
APR_DECLARE(apr_status_t) apr_dir_read(apr_finfo_t *finfo, apr_int32_t wanted,
                                       apr_dir_t *thedir);

/**
 * Rewind the directory to the first entry.
 * @param thedir the directory descriptor to rewind.
 */                        
APR_DECLARE(apr_status_t) apr_dir_rewind(apr_dir_t *thedir);
/** @} */

/**
 * @defgroup apr_filepath FilePath Manipulation operations 
 * @{
 */

/** Cause apr_filepath_merge to fail if addpath is above rootpath */
#define APR_FILEPATH_NOTABOVEROOT   0x01

/** internal: Only meaningful with APR_FILEPATH_NOTABOVEROOT */
#define APR_FILEPATH_SECUREROOTTEST 0x02

/** Cause apr_filepath_merge to fail if addpath is above rootpath,
 * even given a rootpath /foo/bar and an addpath ../bar/bash
 */
#define APR_FILEPATH_SECUREROOT     0x03

/** Fail apr_filepath_merge if the merged path is relative */
#define APR_FILEPATH_NOTRELATIVE    0x04

/** Fail apr_filepath_merge if the merged path is absolute */
#define APR_FILEPATH_NOTABSOLUTE    0x08

/** Return the file system's native path format (e.g. path delimiters
 * of ':' on MacOS9, '\' on Win32, etc.) */
#define APR_FILEPATH_NATIVE         0x10

/** Resolve the true case of existing directories and file elements
 * of addpath, (resolving any aliases on Win32) and append a proper 
 * trailing slash if a directory
 */
#define APR_FILEPATH_TRUENAME       0x20
/** @} */
/**
 * Extract the rootpath from the given filepath
 * @ingroup apr_filepath
 * @param rootpath the root file path returned with APR_SUCCESS or APR_EINCOMPLETE
 * @param filepath the pathname to parse for its root component
 * @param flags the desired rules to apply, from
 * <PRE>
 *      APR_FILEPATH_NATIVE    Use native path seperators (e.g. '\' on Win32)
 *      APR_FILEPATH_TRUENAME  Tests that the root exists, and makes it proper
 * </PRE>
 * @param p the pool to allocate the new path string from
 * @deffunc apr_status_t apr_filepath_root(const char **rootpath, const char **inpath, apr_int32_t flags, apr_pool_t *p)
 * @remark on return, filepath points to the first non-root character in the
 * given filepath.  In the simplest example, given a filepath of "/foo", 
 * returns the rootpath of "/" and filepath points at "foo".  This is far 
 * more complex on other platforms, which will canonicalize the root form
 * to a consistant format, given the APR_FILEPATH_TRUENAME flag, and also
 * test for the validity of that root (e.g., that a drive d:/ or network 
 * share //machine/foovol/). 
 * The function returns APR_ERELATIVE if filepath isn't rooted (an
 * error), APR_EINCOMPLETE if the root path is ambigious (but potentially
 * legitimate, e.g. "/" on Windows is incomplete because it doesn't specify
 * the drive letter), or APR_EBADPATH if the root is simply invalid.
 * APR_SUCCESS is returned if filepath is an absolute path.
 */
APR_DECLARE(apr_status_t) apr_filepath_root(const char **rootpath, 
                                            const char **filepath, 
                                            apr_int32_t flags,
                                            apr_pool_t *p);

/**
 * Merge additional file path onto the previously processed rootpath
 * @ingroup apr_filepath
 * @param newpath the merged paths returned
 * @param rootpath the root file path (NULL uses the current working path)
 * @param addpath the path to add to the root path
 * @param flags the desired APR_FILEPATH_ rules to apply when merging
 * @param p the pool to allocate the new path string from
 * @deffunc apr_status_t apr_filepath_merge(char **newpath, const char *rootpath, const char *addpath, apr_int32_t flags, apr_pool_t *p)
 */                        
APR_DECLARE(apr_status_t) apr_filepath_merge(char **newpath, 
                                             const char *rootpath,
                                             const char *addpath, 
                                             apr_int32_t flags,
                                             apr_pool_t *p);

/**
 * Return the default file path (for relative file names)
 * @ingroup apr_filepath
 * @param path the default path string returned
 * @param flags optional flag APR_FILEPATH_NATIVE to retrieve the
 *              default file path in os-native format.
 * @param p the pool to allocate the default path string from
 * @deffunc apr_status_t apr_filepath_get(char **path, apr_int32_t flags, apr_pool_t *p)
 */
APR_DECLARE(apr_status_t) apr_filepath_get(char **path, apr_int32_t flags,
                                           apr_pool_t *p);

/**
 * Set the default file path (for relative file names)
 * @ingroup apr_filepath
 * @param path the default path returned
 * @param p the pool to allocate any working storage
 * @deffunc apr_status_t apr_filepath_get(char **defpath, apr_pool_t *p)
 */
APR_DECLARE(apr_status_t) apr_filepath_set(const char *path, apr_pool_t *p);

/** @} */

#ifdef __cplusplus
}
#endif

#endif  /* ! APR_FILE_INFO_H */


