# Microsoft Developer Studio Generated NMAKE File, Based on aprutil.dsp
!IF "$(CFG)" == ""
CFG=aprutil - Win32 Debug
!MESSAGE No configuration specified. Defaulting to aprutil - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "aprutil - Win32 Release" && "$(CFG)" != "aprutil - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "aprutil.mak" CFG="aprutil - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "aprutil - Win32 Release" (based on "Win32 (x86) Static Library")
!MESSAGE "aprutil - Win32 Debug" (based on "Win32 (x86) Static Library")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "aprutil - Win32 Release"

OUTDIR=.\LibR
INTDIR=.\LibR
# Begin Custom Macros
OutDir=.\LibR
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\aprutil.lib"

!ELSE 

ALL : "xml - Win32 Release" "gen_uri_delims - Win32 Release" "$(OUTDIR)\aprutil.lib"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"gen_uri_delims - Win32 ReleaseCLEAN" "xml - Win32 ReleaseCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\apr_base64.obj"
	-@erase "$(INTDIR)\apr_brigade.obj"
	-@erase "$(INTDIR)\apr_buckets.obj"
	-@erase "$(INTDIR)\apr_buckets_alloc.obj"
	-@erase "$(INTDIR)\apr_buckets_eos.obj"
	-@erase "$(INTDIR)\apr_buckets_file.obj"
	-@erase "$(INTDIR)\apr_buckets_flush.obj"
	-@erase "$(INTDIR)\apr_buckets_heap.obj"
	-@erase "$(INTDIR)\apr_buckets_mmap.obj"
	-@erase "$(INTDIR)\apr_buckets_pipe.obj"
	-@erase "$(INTDIR)\apr_buckets_pool.obj"
	-@erase "$(INTDIR)\apr_buckets_refcount.obj"
	-@erase "$(INTDIR)\apr_buckets_simple.obj"
	-@erase "$(INTDIR)\apr_buckets_socket.obj"
	-@erase "$(INTDIR)\apr_date.obj"
	-@erase "$(INTDIR)\apr_dbm.obj"
	-@erase "$(INTDIR)\apr_dbm_berkeleydb.obj"
	-@erase "$(INTDIR)\apr_dbm_gdbm.obj"
	-@erase "$(INTDIR)\apr_dbm_sdbm.obj"
	-@erase "$(INTDIR)\apr_hooks.obj"
	-@erase "$(INTDIR)\apr_md4.obj"
	-@erase "$(INTDIR)\apr_md5.obj"
	-@erase "$(INTDIR)\apr_rmm.obj"
	-@erase "$(INTDIR)\apr_sha1.obj"
	-@erase "$(INTDIR)\apr_strmatch.obj"
	-@erase "$(INTDIR)\apr_uri.obj"
	-@erase "$(INTDIR)\apr_xml.obj"
	-@erase "$(INTDIR)\aprutil.idb"
	-@erase "$(INTDIR)\getuuid.obj"
	-@erase "$(INTDIR)\sdbm.obj"
	-@erase "$(INTDIR)\sdbm_hash.obj"
	-@erase "$(INTDIR)\sdbm_lock.obj"
	-@erase "$(INTDIR)\sdbm_pair.obj"
	-@erase "$(INTDIR)\uuid.obj"
	-@erase "$(INTDIR)\xlate.obj"
	-@erase "$(OUTDIR)\aprutil.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /O2 /I "./include" /I "../apr/include" /I "./include/private" /I "../apr-iconv/include" /I "./dbm/sdbm" /I "./xml/expat/lib" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "APR_DECLARE_STATIC" /D "APU_DECLARE_STATIC" /D "API_DECLARE_STATIC" /D "APU_USE_SDBM" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\aprutil" /FD /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\aprutil.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\aprutil.lib" 
LIB32_OBJS= \
	"$(INTDIR)\apr_brigade.obj" \
	"$(INTDIR)\apr_buckets.obj" \
	"$(INTDIR)\apr_buckets_alloc.obj" \
	"$(INTDIR)\apr_buckets_eos.obj" \
	"$(INTDIR)\apr_buckets_file.obj" \
	"$(INTDIR)\apr_buckets_flush.obj" \
	"$(INTDIR)\apr_buckets_heap.obj" \
	"$(INTDIR)\apr_buckets_mmap.obj" \
	"$(INTDIR)\apr_buckets_pipe.obj" \
	"$(INTDIR)\apr_buckets_pool.obj" \
	"$(INTDIR)\apr_buckets_refcount.obj" \
	"$(INTDIR)\apr_buckets_simple.obj" \
	"$(INTDIR)\apr_buckets_socket.obj" \
	"$(INTDIR)\apr_md4.obj" \
	"$(INTDIR)\apr_md5.obj" \
	"$(INTDIR)\apr_sha1.obj" \
	"$(INTDIR)\getuuid.obj" \
	"$(INTDIR)\uuid.obj" \
	"$(INTDIR)\apr_dbm.obj" \
	"$(INTDIR)\apr_dbm_berkeleydb.obj" \
	"$(INTDIR)\apr_dbm_gdbm.obj" \
	"$(INTDIR)\apr_dbm_sdbm.obj" \
	"$(INTDIR)\apr_base64.obj" \
	"$(INTDIR)\apr_hooks.obj" \
	"$(INTDIR)\apr_date.obj" \
	"$(INTDIR)\apr_rmm.obj" \
	"$(INTDIR)\sdbm.obj" \
	"$(INTDIR)\sdbm_hash.obj" \
	"$(INTDIR)\sdbm_lock.obj" \
	"$(INTDIR)\sdbm_pair.obj" \
	"$(INTDIR)\apr_strmatch.obj" \
	"$(INTDIR)\apr_uri.obj" \
	"$(INTDIR)\xlate.obj" \
	"$(INTDIR)\apr_xml.obj" \
	".\xml\expat\lib\LibR\xml.lib"

"$(OUTDIR)\aprutil.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ELSEIF  "$(CFG)" == "aprutil - Win32 Debug"

OUTDIR=.\LibD
INTDIR=.\LibD
# Begin Custom Macros
OutDir=.\LibD
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : ".\uri\uri_delims.h" ".\include\private\apu_select_dbm.h" ".\include\private\apu_config.h" ".\include\apu.h" "$(OUTDIR)\aprutil.lib"

!ELSE 

ALL : "xml - Win32 Debug" "gen_uri_delims - Win32 Debug" ".\uri\uri_delims.h" ".\include\private\apu_select_dbm.h" ".\include\private\apu_config.h" ".\include\apu.h" "$(OUTDIR)\aprutil.lib"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"gen_uri_delims - Win32 DebugCLEAN" "xml - Win32 DebugCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\apr_base64.obj"
	-@erase "$(INTDIR)\apr_brigade.obj"
	-@erase "$(INTDIR)\apr_buckets.obj"
	-@erase "$(INTDIR)\apr_buckets_alloc.obj"
	-@erase "$(INTDIR)\apr_buckets_eos.obj"
	-@erase "$(INTDIR)\apr_buckets_file.obj"
	-@erase "$(INTDIR)\apr_buckets_flush.obj"
	-@erase "$(INTDIR)\apr_buckets_heap.obj"
	-@erase "$(INTDIR)\apr_buckets_mmap.obj"
	-@erase "$(INTDIR)\apr_buckets_pipe.obj"
	-@erase "$(INTDIR)\apr_buckets_pool.obj"
	-@erase "$(INTDIR)\apr_buckets_refcount.obj"
	-@erase "$(INTDIR)\apr_buckets_simple.obj"
	-@erase "$(INTDIR)\apr_buckets_socket.obj"
	-@erase "$(INTDIR)\apr_date.obj"
	-@erase "$(INTDIR)\apr_dbm.obj"
	-@erase "$(INTDIR)\apr_dbm_berkeleydb.obj"
	-@erase "$(INTDIR)\apr_dbm_gdbm.obj"
	-@erase "$(INTDIR)\apr_dbm_sdbm.obj"
	-@erase "$(INTDIR)\apr_hooks.obj"
	-@erase "$(INTDIR)\apr_md4.obj"
	-@erase "$(INTDIR)\apr_md5.obj"
	-@erase "$(INTDIR)\apr_rmm.obj"
	-@erase "$(INTDIR)\apr_sha1.obj"
	-@erase "$(INTDIR)\apr_strmatch.obj"
	-@erase "$(INTDIR)\apr_uri.obj"
	-@erase "$(INTDIR)\apr_xml.obj"
	-@erase "$(INTDIR)\aprutil.idb"
	-@erase "$(INTDIR)\aprutil.pdb"
	-@erase "$(INTDIR)\getuuid.obj"
	-@erase "$(INTDIR)\sdbm.obj"
	-@erase "$(INTDIR)\sdbm_hash.obj"
	-@erase "$(INTDIR)\sdbm_lock.obj"
	-@erase "$(INTDIR)\sdbm_pair.obj"
	-@erase "$(INTDIR)\uuid.obj"
	-@erase "$(INTDIR)\xlate.obj"
	-@erase "$(OUTDIR)\aprutil.lib"
	-@erase ".\include\apu.h"
	-@erase ".\include\private\apu_config.h"
	-@erase ".\include\private\apu_select_dbm.h"
	-@erase ".\uri\uri_delims.h"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /Zi /Od /I "./include" /I "../apr/include" /I "./include/private" /I "../apr-iconv/include" /I "./dbm/sdbm" /I "./xml/expat/lib" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "APR_DECLARE_STATIC" /D "APU_DECLARE_STATIC" /D "API_DECLARE_STATIC" /D "APU_USE_SDBM" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\aprutil" /FD /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\aprutil.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\aprutil.lib" 
LIB32_OBJS= \
	"$(INTDIR)\apr_brigade.obj" \
	"$(INTDIR)\apr_buckets.obj" \
	"$(INTDIR)\apr_buckets_alloc.obj" \
	"$(INTDIR)\apr_buckets_eos.obj" \
	"$(INTDIR)\apr_buckets_file.obj" \
	"$(INTDIR)\apr_buckets_flush.obj" \
	"$(INTDIR)\apr_buckets_heap.obj" \
	"$(INTDIR)\apr_buckets_mmap.obj" \
	"$(INTDIR)\apr_buckets_pipe.obj" \
	"$(INTDIR)\apr_buckets_pool.obj" \
	"$(INTDIR)\apr_buckets_refcount.obj" \
	"$(INTDIR)\apr_buckets_simple.obj" \
	"$(INTDIR)\apr_buckets_socket.obj" \
	"$(INTDIR)\apr_md4.obj" \
	"$(INTDIR)\apr_md5.obj" \
	"$(INTDIR)\apr_sha1.obj" \
	"$(INTDIR)\getuuid.obj" \
	"$(INTDIR)\uuid.obj" \
	"$(INTDIR)\apr_dbm.obj" \
	"$(INTDIR)\apr_dbm_berkeleydb.obj" \
	"$(INTDIR)\apr_dbm_gdbm.obj" \
	"$(INTDIR)\apr_dbm_sdbm.obj" \
	"$(INTDIR)\apr_base64.obj" \
	"$(INTDIR)\apr_hooks.obj" \
	"$(INTDIR)\apr_date.obj" \
	"$(INTDIR)\apr_rmm.obj" \
	"$(INTDIR)\sdbm.obj" \
	"$(INTDIR)\sdbm_hash.obj" \
	"$(INTDIR)\sdbm_lock.obj" \
	"$(INTDIR)\sdbm_pair.obj" \
	"$(INTDIR)\apr_strmatch.obj" \
	"$(INTDIR)\apr_uri.obj" \
	"$(INTDIR)\xlate.obj" \
	"$(INTDIR)\apr_xml.obj" \
	".\xml\expat\lib\LibD\xml.lib"

"$(OUTDIR)\aprutil.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("aprutil.dep")
!INCLUDE "aprutil.dep"
!ELSE 
!MESSAGE Warning: cannot find "aprutil.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "aprutil - Win32 Release" || "$(CFG)" == "aprutil - Win32 Debug"
SOURCE=.\buckets\apr_brigade.c

"$(INTDIR)\apr_brigade.obj" : $(SOURCE) "$(INTDIR)" ".\include\apu.h"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\buckets\apr_buckets.c

"$(INTDIR)\apr_buckets.obj" : $(SOURCE) "$(INTDIR)" ".\include\apu.h"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\buckets\apr_buckets_alloc.c

"$(INTDIR)\apr_buckets_alloc.obj" : $(SOURCE) "$(INTDIR)" ".\include\apu.h"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\buckets\apr_buckets_eos.c

"$(INTDIR)\apr_buckets_eos.obj" : $(SOURCE) "$(INTDIR)" ".\include\apu.h"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\buckets\apr_buckets_file.c

"$(INTDIR)\apr_buckets_file.obj" : $(SOURCE) "$(INTDIR)" ".\include\apu.h"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\buckets\apr_buckets_flush.c

"$(INTDIR)\apr_buckets_flush.obj" : $(SOURCE) "$(INTDIR)" ".\include\apu.h"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\buckets\apr_buckets_heap.c

"$(INTDIR)\apr_buckets_heap.obj" : $(SOURCE) "$(INTDIR)" ".\include\apu.h"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\buckets\apr_buckets_mmap.c

"$(INTDIR)\apr_buckets_mmap.obj" : $(SOURCE) "$(INTDIR)" ".\include\apu.h"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\buckets\apr_buckets_pipe.c

"$(INTDIR)\apr_buckets_pipe.obj" : $(SOURCE) "$(INTDIR)" ".\include\apu.h"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\buckets\apr_buckets_pool.c

"$(INTDIR)\apr_buckets_pool.obj" : $(SOURCE) "$(INTDIR)" ".\include\apu.h"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\buckets\apr_buckets_refcount.c

"$(INTDIR)\apr_buckets_refcount.obj" : $(SOURCE) "$(INTDIR)" ".\include\apu.h"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\buckets\apr_buckets_simple.c

"$(INTDIR)\apr_buckets_simple.obj" : $(SOURCE) "$(INTDIR)" ".\include\apu.h"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\buckets\apr_buckets_socket.c

"$(INTDIR)\apr_buckets_socket.obj" : $(SOURCE) "$(INTDIR)" ".\include\apu.h"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\crypto\apr_md4.c

"$(INTDIR)\apr_md4.obj" : $(SOURCE) "$(INTDIR)" ".\include\apu.h"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\crypto\apr_md5.c

"$(INTDIR)\apr_md5.obj" : $(SOURCE) "$(INTDIR)" ".\include\apu.h"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\crypto\apr_sha1.c

"$(INTDIR)\apr_sha1.obj" : $(SOURCE) "$(INTDIR)" ".\include\apu.h"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\crypto\getuuid.c

"$(INTDIR)\getuuid.obj" : $(SOURCE) "$(INTDIR)" ".\include\apu.h"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\crypto\uuid.c

"$(INTDIR)\uuid.obj" : $(SOURCE) "$(INTDIR)" ".\include\apu.h"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\dbm\apr_dbm.c

"$(INTDIR)\apr_dbm.obj" : $(SOURCE) "$(INTDIR)" ".\include\apu.h" ".\include\private\apu_select_dbm.h"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\dbm\apr_dbm_berkeleydb.c

"$(INTDIR)\apr_dbm_berkeleydb.obj" : $(SOURCE) "$(INTDIR)" ".\include\apu.h" ".\include\private\apu_select_dbm.h"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\dbm\apr_dbm_gdbm.c

"$(INTDIR)\apr_dbm_gdbm.obj" : $(SOURCE) "$(INTDIR)" ".\include\apu.h" ".\include\private\apu_select_dbm.h"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\dbm\apr_dbm_sdbm.c

"$(INTDIR)\apr_dbm_sdbm.obj" : $(SOURCE) "$(INTDIR)" ".\include\apu.h" ".\include\private\apu_select_dbm.h"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\encoding\apr_base64.c

"$(INTDIR)\apr_base64.obj" : $(SOURCE) "$(INTDIR)" ".\include\apu.h"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\hooks\apr_hooks.c

"$(INTDIR)\apr_hooks.obj" : $(SOURCE) "$(INTDIR)" ".\include\apu.h"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\ldap\apr_ldap_compat.c
SOURCE=.\misc\apr_date.c

"$(INTDIR)\apr_date.obj" : $(SOURCE) "$(INTDIR)" ".\include\apu.h"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\misc\apr_rmm.c

"$(INTDIR)\apr_rmm.obj" : $(SOURCE) "$(INTDIR)" ".\include\apu.h"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\dbm\sdbm\sdbm.c

"$(INTDIR)\sdbm.obj" : $(SOURCE) "$(INTDIR)" ".\include\apu.h"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\dbm\sdbm\sdbm_hash.c

"$(INTDIR)\sdbm_hash.obj" : $(SOURCE) "$(INTDIR)" ".\include\apu.h"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\dbm\sdbm\sdbm_lock.c

"$(INTDIR)\sdbm_lock.obj" : $(SOURCE) "$(INTDIR)" ".\include\apu.h"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\dbm\sdbm\sdbm_pair.c

"$(INTDIR)\sdbm_pair.obj" : $(SOURCE) "$(INTDIR)" ".\include\apu.h"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\strmatch\apr_strmatch.c

"$(INTDIR)\apr_strmatch.obj" : $(SOURCE) "$(INTDIR)" ".\include\apu.h"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\uri\apr_uri.c

"$(INTDIR)\apr_uri.obj" : $(SOURCE) "$(INTDIR)" ".\include\apu.h" ".\uri\uri_delims.h"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\xlate\xlate.c

"$(INTDIR)\xlate.obj" : $(SOURCE) "$(INTDIR)" ".\include\apu.h" ".\include\private\apu_config.h"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\xml\apr_xml.c

"$(INTDIR)\apr_xml.obj" : $(SOURCE) "$(INTDIR)" ".\include\private\apu_config.h" ".\include\apu.h"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\include\apr_ldap.hw

!IF  "$(CFG)" == "aprutil - Win32 Release"

!ELSEIF  "$(CFG)" == "aprutil - Win32 Debug"

!ENDIF 

SOURCE=.\include\apu.hw

!IF  "$(CFG)" == "aprutil - Win32 Release"

InputPath=.\include\apu.hw

".\include\apu.h" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	<<tempfile.bat 
	@echo off 
	type .\include\apu.hw > .\include\apu.h
<< 
	

!ELSEIF  "$(CFG)" == "aprutil - Win32 Debug"

InputPath=.\include\apu.hw

".\include\apu.h" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	<<tempfile.bat 
	@echo off 
	type .\include\apu.hw > .\include\apu.h
<< 
	

!ENDIF 

SOURCE=.\include\private\apu_config.hw

!IF  "$(CFG)" == "aprutil - Win32 Release"

InputPath=.\include\private\apu_config.hw

".\include\private\apu_config.h" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	<<tempfile.bat 
	@echo off 
	type .\include\private\apu_config.hw > .\include\private\apu_config.h
<< 
	

!ELSEIF  "$(CFG)" == "aprutil - Win32 Debug"

InputPath=.\include\private\apu_config.hw

".\include\private\apu_config.h" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	<<tempfile.bat 
	@echo off 
	type .\include\private\apu_config.hw > .\include\private\apu_config.h
<< 
	

!ENDIF 

SOURCE=.\include\private\apu_select_dbm.hw

!IF  "$(CFG)" == "aprutil - Win32 Release"

InputPath=.\include\private\apu_select_dbm.hw

".\include\private\apu_select_dbm.h" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	<<tempfile.bat 
	@echo off 
	type .\include\private\apu_select_dbm.hw > .\include\private\apu_select_dbm.h
<< 
	

!ELSEIF  "$(CFG)" == "aprutil - Win32 Debug"

InputPath=.\include\private\apu_select_dbm.hw

".\include\private\apu_select_dbm.h" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	<<tempfile.bat 
	@echo off 
	type .\include\private\apu_select_dbm.hw > .\include\private\apu_select_dbm.h
<< 
	

!ENDIF 

SOURCE=.\uri\gen_uri_delims.exe

!IF  "$(CFG)" == "aprutil - Win32 Release"

InputPath=.\uri\gen_uri_delims.exe

".\uri\uri_delims.h" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	<<tempfile.bat 
	@echo off 
	.\uri\gen_uri_delims.exe >.\uri\uri_delims.h 
<< 
	

!ELSEIF  "$(CFG)" == "aprutil - Win32 Debug"

InputPath=.\uri\gen_uri_delims.exe

".\uri\uri_delims.h" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	<<tempfile.bat 
	@echo off 
	.\uri\gen_uri_delims.exe >.\uri\uri_delims.h 
<< 
	

!ENDIF 

!IF  "$(CFG)" == "aprutil - Win32 Release"

"gen_uri_delims - Win32 Release" : 
   cd ".\uri"
   $(MAKE) /$(MAKEFLAGS) /F ".\gen_uri_delims.mak" CFG="gen_uri_delims - Win32 Release" 
   cd ".."

"gen_uri_delims - Win32 ReleaseCLEAN" : 
   cd ".\uri"
   $(MAKE) /$(MAKEFLAGS) /F ".\gen_uri_delims.mak" CFG="gen_uri_delims - Win32 Release" RECURSE=1 CLEAN 
   cd ".."

!ELSEIF  "$(CFG)" == "aprutil - Win32 Debug"

"gen_uri_delims - Win32 Debug" : 
   cd ".\uri"
   $(MAKE) /$(MAKEFLAGS) /F ".\gen_uri_delims.mak" CFG="gen_uri_delims - Win32 Debug" 
   cd ".."

"gen_uri_delims - Win32 DebugCLEAN" : 
   cd ".\uri"
   $(MAKE) /$(MAKEFLAGS) /F ".\gen_uri_delims.mak" CFG="gen_uri_delims - Win32 Debug" RECURSE=1 CLEAN 
   cd ".."

!ENDIF 

!IF  "$(CFG)" == "aprutil - Win32 Release"

"xml - Win32 Release" : 
   cd ".\xml\expat\lib"
   $(MAKE) /$(MAKEFLAGS) /F ".\xml.mak" CFG="xml - Win32 Release" 
   cd "..\..\.."

"xml - Win32 ReleaseCLEAN" : 
   cd ".\xml\expat\lib"
   $(MAKE) /$(MAKEFLAGS) /F ".\xml.mak" CFG="xml - Win32 Release" RECURSE=1 CLEAN 
   cd "..\..\.."

!ELSEIF  "$(CFG)" == "aprutil - Win32 Debug"

"xml - Win32 Debug" : 
   cd ".\xml\expat\lib"
   $(MAKE) /$(MAKEFLAGS) /F ".\xml.mak" CFG="xml - Win32 Debug" 
   cd "..\..\.."

"xml - Win32 DebugCLEAN" : 
   cd ".\xml\expat\lib"
   $(MAKE) /$(MAKEFLAGS) /F ".\xml.mak" CFG="xml - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\..\.."

!ENDIF 


!ENDIF 

