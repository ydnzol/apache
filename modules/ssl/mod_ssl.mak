# Microsoft Developer Studio Generated NMAKE File, Based on mod_ssl.dsp
!IF "$(CFG)" == ""
CFG=mod_ssl - Win32 Release
!MESSAGE No configuration specified. Defaulting to mod_ssl - Win32 Release.
!ENDIF 

!IF "$(CFG)" != "mod_ssl - Win32 Release" && "$(CFG)" != "mod_ssl - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "mod_ssl.mak" CFG="mod_ssl - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "mod_ssl - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "mod_ssl - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "mod_ssl - Win32 Release"

OUTDIR=.\Release
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\Release
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\mod_ssl.so"

!ELSE 

ALL : "libhttpd - Win32 Release" "libaprutil - Win32 Release" "libapr - Win32 Release" "$(OUTDIR)\mod_ssl.so"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"libapr - Win32 ReleaseCLEAN" "libaprutil - Win32 ReleaseCLEAN" "libhttpd - Win32 ReleaseCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\mod_ssl.idb"
	-@erase "$(INTDIR)\mod_ssl.obj"
	-@erase "$(INTDIR)\mod_ssl.res"
	-@erase "$(INTDIR)\ssl_engine_config.obj"
	-@erase "$(INTDIR)\ssl_engine_dh.obj"
	-@erase "$(INTDIR)\ssl_engine_init.obj"
	-@erase "$(INTDIR)\ssl_engine_io.obj"
	-@erase "$(INTDIR)\ssl_engine_kernel.obj"
	-@erase "$(INTDIR)\ssl_engine_log.obj"
	-@erase "$(INTDIR)\ssl_engine_mutex.obj"
	-@erase "$(INTDIR)\ssl_engine_pphrase.obj"
	-@erase "$(INTDIR)\ssl_engine_rand.obj"
	-@erase "$(INTDIR)\ssl_engine_vars.obj"
	-@erase "$(INTDIR)\ssl_expr.obj"
	-@erase "$(INTDIR)\ssl_expr_eval.obj"
	-@erase "$(INTDIR)\ssl_expr_parse.obj"
	-@erase "$(INTDIR)\ssl_expr_scan.obj"
	-@erase "$(INTDIR)\ssl_scache.obj"
	-@erase "$(INTDIR)\ssl_scache_dbm.obj"
	-@erase "$(INTDIR)\ssl_scache_shmcb.obj"
	-@erase "$(INTDIR)\ssl_scache_shmht.obj"
	-@erase "$(INTDIR)\ssl_util.obj"
	-@erase "$(INTDIR)\ssl_util_ssl.obj"
	-@erase "$(INTDIR)\ssl_util_table.obj"
	-@erase "$(OUTDIR)\mod_ssl.exp"
	-@erase "$(OUTDIR)\mod_ssl.lib"
	-@erase "$(OUTDIR)\mod_ssl.map"
	-@erase "$(OUTDIR)\mod_ssl.so"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /O2 /I "../../include" /I "../../srclib/apr/include" /I "../../srclib/apr-util/include" /I "../../srclib/openssl/inc32/openssl" /I "../../srclib/openssl/inc32" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "WIN32_LEAN_AND_MEAN" /D "NO_IDEA" /D "NO_RC5" /D "NO_MDC2" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\mod_ssl" /FD /c 

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

MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\mod_ssl.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\mod_ssl.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib wsock32.lib ws2_32.lib advapi32.lib gdi32.lib ssleay32.lib libeay32.lib /nologo /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\mod_ssl.pdb" /map:"$(INTDIR)\mod_ssl.map" /machine:I386 /out:"$(OUTDIR)\mod_ssl.so" /implib:"$(OUTDIR)\mod_ssl.lib" /libpath:"../../srclib/openssl/out32dll" /libpath:"../../srclib/openssl/out32" /base:@..\..\os\win32\BaseAddr.ref,mod_ssl 
LINK32_OBJS= \
	"$(INTDIR)\mod_ssl.obj" \
	"$(INTDIR)\ssl_engine_config.obj" \
	"$(INTDIR)\ssl_engine_dh.obj" \
	"$(INTDIR)\ssl_engine_init.obj" \
	"$(INTDIR)\ssl_engine_io.obj" \
	"$(INTDIR)\ssl_engine_kernel.obj" \
	"$(INTDIR)\ssl_engine_log.obj" \
	"$(INTDIR)\ssl_engine_mutex.obj" \
	"$(INTDIR)\ssl_engine_pphrase.obj" \
	"$(INTDIR)\ssl_engine_rand.obj" \
	"$(INTDIR)\ssl_engine_vars.obj" \
	"$(INTDIR)\ssl_expr.obj" \
	"$(INTDIR)\ssl_expr_eval.obj" \
	"$(INTDIR)\ssl_expr_parse.obj" \
	"$(INTDIR)\ssl_expr_scan.obj" \
	"$(INTDIR)\ssl_scache.obj" \
	"$(INTDIR)\ssl_scache_dbm.obj" \
	"$(INTDIR)\ssl_scache_shmcb.obj" \
	"$(INTDIR)\ssl_scache_shmht.obj" \
	"$(INTDIR)\ssl_util.obj" \
	"$(INTDIR)\ssl_util_ssl.obj" \
	"$(INTDIR)\ssl_util_table.obj" \
	"$(INTDIR)\mod_ssl.res" \
	"..\..\srclib\apr\Release\libapr.lib" \
	"..\..\srclib\apr-util\Release\libaprutil.lib" \
	"..\..\Release\libhttpd.lib"

"$(OUTDIR)\mod_ssl.so" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "mod_ssl - Win32 Debug"

OUTDIR=.\Debug
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\Debug
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : ".\ssl_expr_parse.h" ".\ssl_expr_parse.c" "$(OUTDIR)\mod_ssl.so"

!ELSE 

ALL : "libhttpd - Win32 Debug" "libaprutil - Win32 Debug" "libapr - Win32 Debug" ".\ssl_expr_parse.h" ".\ssl_expr_parse.c" "$(OUTDIR)\mod_ssl.so"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"libapr - Win32 DebugCLEAN" "libaprutil - Win32 DebugCLEAN" "libhttpd - Win32 DebugCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\mod_ssl.idb"
	-@erase "$(INTDIR)\mod_ssl.obj"
	-@erase "$(INTDIR)\mod_ssl.res"
	-@erase "$(INTDIR)\ssl_engine_config.obj"
	-@erase "$(INTDIR)\ssl_engine_dh.obj"
	-@erase "$(INTDIR)\ssl_engine_init.obj"
	-@erase "$(INTDIR)\ssl_engine_io.obj"
	-@erase "$(INTDIR)\ssl_engine_kernel.obj"
	-@erase "$(INTDIR)\ssl_engine_log.obj"
	-@erase "$(INTDIR)\ssl_engine_mutex.obj"
	-@erase "$(INTDIR)\ssl_engine_pphrase.obj"
	-@erase "$(INTDIR)\ssl_engine_rand.obj"
	-@erase "$(INTDIR)\ssl_engine_vars.obj"
	-@erase "$(INTDIR)\ssl_expr.obj"
	-@erase "$(INTDIR)\ssl_expr_eval.obj"
	-@erase "$(INTDIR)\ssl_expr_parse.obj"
	-@erase "$(INTDIR)\ssl_expr_scan.obj"
	-@erase "$(INTDIR)\ssl_scache.obj"
	-@erase "$(INTDIR)\ssl_scache_dbm.obj"
	-@erase "$(INTDIR)\ssl_scache_shmcb.obj"
	-@erase "$(INTDIR)\ssl_scache_shmht.obj"
	-@erase "$(INTDIR)\ssl_util.obj"
	-@erase "$(INTDIR)\ssl_util_ssl.obj"
	-@erase "$(INTDIR)\ssl_util_table.obj"
	-@erase "$(OUTDIR)\mod_ssl.exp"
	-@erase "$(OUTDIR)\mod_ssl.lib"
	-@erase "$(OUTDIR)\mod_ssl.map"
	-@erase "$(OUTDIR)\mod_ssl.pdb"
	-@erase "$(OUTDIR)\mod_ssl.so"
	-@erase "ssl_expr_parse.c"
	-@erase "ssl_expr_parse.h"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /Zi /Od /I "../../include" /I "../../srclib/apr/include" /I "../../srclib/apr-util/include" /I "../../srclib/openssl/inc32/openssl" /I "../../srclib/openssl/inc32" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "WIN32_LEAN_AND_MEAN" /D "NO_IDEA" /D "NO_RC5" /D "NO_MDC2" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\mod_ssl" /FD /c 

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

MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\mod_ssl.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\mod_ssl.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib wsock32.lib ws2_32.lib advapi32.lib gdi32.lib ssleay32.lib libeay32.lib /nologo /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\mod_ssl.pdb" /map:"$(INTDIR)\mod_ssl.map" /debug /machine:I386 /out:"$(OUTDIR)\mod_ssl.so" /implib:"$(OUTDIR)\mod_ssl.lib" /libpath:"../../srclib/openssl/out32dll.dbg" /libpath:"../../srclib/openssl/out32.dbg" /base:@..\..\os\win32\BaseAddr.ref,mod_ssl 
LINK32_OBJS= \
	"$(INTDIR)\mod_ssl.obj" \
	"$(INTDIR)\ssl_engine_config.obj" \
	"$(INTDIR)\ssl_engine_dh.obj" \
	"$(INTDIR)\ssl_engine_init.obj" \
	"$(INTDIR)\ssl_engine_io.obj" \
	"$(INTDIR)\ssl_engine_kernel.obj" \
	"$(INTDIR)\ssl_engine_log.obj" \
	"$(INTDIR)\ssl_engine_mutex.obj" \
	"$(INTDIR)\ssl_engine_pphrase.obj" \
	"$(INTDIR)\ssl_engine_rand.obj" \
	"$(INTDIR)\ssl_engine_vars.obj" \
	"$(INTDIR)\ssl_expr.obj" \
	"$(INTDIR)\ssl_expr_eval.obj" \
	"$(INTDIR)\ssl_expr_parse.obj" \
	"$(INTDIR)\ssl_expr_scan.obj" \
	"$(INTDIR)\ssl_scache.obj" \
	"$(INTDIR)\ssl_scache_dbm.obj" \
	"$(INTDIR)\ssl_scache_shmcb.obj" \
	"$(INTDIR)\ssl_scache_shmht.obj" \
	"$(INTDIR)\ssl_util.obj" \
	"$(INTDIR)\ssl_util_ssl.obj" \
	"$(INTDIR)\ssl_util_table.obj" \
	"$(INTDIR)\mod_ssl.res" \
	"..\..\srclib\apr\Debug\libapr.lib" \
	"..\..\srclib\apr-util\Debug\libaprutil.lib" \
	"..\..\Debug\libhttpd.lib"

"$(OUTDIR)\mod_ssl.so" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("mod_ssl.dep")
!INCLUDE "mod_ssl.dep"
!ELSE 
!MESSAGE Warning: cannot find "mod_ssl.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "mod_ssl - Win32 Release" || "$(CFG)" == "mod_ssl - Win32 Debug"
SOURCE=.\mod_ssl.c

"$(INTDIR)\mod_ssl.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\ssl_engine_config.c

"$(INTDIR)\ssl_engine_config.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\ssl_engine_dh.c

"$(INTDIR)\ssl_engine_dh.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\ssl_engine_init.c

"$(INTDIR)\ssl_engine_init.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\ssl_engine_io.c

"$(INTDIR)\ssl_engine_io.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\ssl_engine_kernel.c

"$(INTDIR)\ssl_engine_kernel.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\ssl_engine_log.c

"$(INTDIR)\ssl_engine_log.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\ssl_engine_mutex.c

"$(INTDIR)\ssl_engine_mutex.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\ssl_engine_pphrase.c

"$(INTDIR)\ssl_engine_pphrase.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\ssl_engine_rand.c

"$(INTDIR)\ssl_engine_rand.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\ssl_engine_vars.c

"$(INTDIR)\ssl_engine_vars.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\ssl_expr.c

"$(INTDIR)\ssl_expr.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\ssl_expr_eval.c

"$(INTDIR)\ssl_expr_eval.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\ssl_expr_parse.c

"$(INTDIR)\ssl_expr_parse.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\ssl_expr_scan.c

"$(INTDIR)\ssl_expr_scan.obj" : $(SOURCE) "$(INTDIR)" ".\ssl_expr_parse.h"


SOURCE=.\ssl_scache.c

"$(INTDIR)\ssl_scache.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\ssl_scache_dbm.c

"$(INTDIR)\ssl_scache_dbm.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\ssl_scache_shmcb.c

"$(INTDIR)\ssl_scache_shmcb.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\ssl_scache_shmht.c

"$(INTDIR)\ssl_scache_shmht.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\ssl_util.c

"$(INTDIR)\ssl_util.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\ssl_util_ssl.c

"$(INTDIR)\ssl_util_ssl.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\ssl_util_table.c

"$(INTDIR)\ssl_util_table.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\ssl_expr_parse.y

!IF  "$(CFG)" == "mod_ssl - Win32 Release"

InputPath=.\ssl_expr_parse.y

".\ssl_expr_parse.c"	".\ssl_expr_parse.h" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	<<tempfile.bat 
	@echo off 
	bison -y -d ssl_expr_parse.y 
	sed -e "s;yy;ssl_expr_yy;g" -e  "/#if defined(c_plusplus) || defined(__cplusplus)/,/#endif/d" <y.tab.c  >ssl_expr_parse.c 
	del y.tab.c 
	sed -e "s;yy;ssl_expr_yy;g" <y.tab.h >ssl_expr_parse.h 
	del y.tab.h
<< 
	

!ELSEIF  "$(CFG)" == "mod_ssl - Win32 Debug"

InputPath=.\ssl_expr_parse.y

".\ssl_expr_parse.c"	".\ssl_expr_parse.h" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	<<tempfile.bat 
	@echo off 
	bison -y -d ssl_expr_parse.y 
	sed -e "s;yy;ssl_expr_yy;g" -e  "/#if defined(c_plusplus) || defined(__cplusplus)/,/#endif/d" <y.tab.c  >ssl_expr_parse.c 
	del y.tab.c 
	sed -e "s;yy;ssl_expr_yy;g" <y.tab.h >ssl_expr_parse.h 
	del y.tab.h
<< 
	

!ENDIF 

SOURCE=.\ssl_expr_scan.l

!IF  "$(CFG)" == "mod_ssl - Win32 Release"

InputPath=.\ssl_expr_scan.l

".\ssl_expr_scan.c" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	<<tempfile.bat 
	@echo off 
	flex -Pssl_expr_yy -s -B ssl_expr_scan.l 
	sed -e "/$$Header:/d" <lex.ssl_expr_yy.c >ssl_expr_scan.c 
	del lex.ssl_expr_yy.c 
<< 
	

!ELSEIF  "$(CFG)" == "mod_ssl - Win32 Debug"

InputPath=.\ssl_expr_scan.l

".\ssl_expr_scan.c" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	<<tempfile.bat 
	@echo off 
	flex -Pssl_expr_yy -s -B ssl_expr_scan.l 
	sed -e "/$$Header:/d" <lex.ssl_expr_yy.c >ssl_expr_scan.c 
	del lex.ssl_expr_yy.c 
<< 
	

!ENDIF 

!IF  "$(CFG)" == "mod_ssl - Win32 Release"

"libapr - Win32 Release" : 
   cd ".\..\..\srclib\apr"
   $(MAKE) /$(MAKEFLAGS) /F ".\libapr.mak" CFG="libapr - Win32 Release" 
   cd "..\..\modules\ssl"

"libapr - Win32 ReleaseCLEAN" : 
   cd ".\..\..\srclib\apr"
   $(MAKE) /$(MAKEFLAGS) /F ".\libapr.mak" CFG="libapr - Win32 Release" RECURSE=1 CLEAN 
   cd "..\..\modules\ssl"

!ELSEIF  "$(CFG)" == "mod_ssl - Win32 Debug"

"libapr - Win32 Debug" : 
   cd ".\..\..\srclib\apr"
   $(MAKE) /$(MAKEFLAGS) /F ".\libapr.mak" CFG="libapr - Win32 Debug" 
   cd "..\..\modules\ssl"

"libapr - Win32 DebugCLEAN" : 
   cd ".\..\..\srclib\apr"
   $(MAKE) /$(MAKEFLAGS) /F ".\libapr.mak" CFG="libapr - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\..\modules\ssl"

!ENDIF 

!IF  "$(CFG)" == "mod_ssl - Win32 Release"

"libaprutil - Win32 Release" : 
   cd ".\..\..\srclib\apr-util"
   $(MAKE) /$(MAKEFLAGS) /F ".\libaprutil.mak" CFG="libaprutil - Win32 Release" 
   cd "..\..\modules\ssl"

"libaprutil - Win32 ReleaseCLEAN" : 
   cd ".\..\..\srclib\apr-util"
   $(MAKE) /$(MAKEFLAGS) /F ".\libaprutil.mak" CFG="libaprutil - Win32 Release" RECURSE=1 CLEAN 
   cd "..\..\modules\ssl"

!ELSEIF  "$(CFG)" == "mod_ssl - Win32 Debug"

"libaprutil - Win32 Debug" : 
   cd ".\..\..\srclib\apr-util"
   $(MAKE) /$(MAKEFLAGS) /F ".\libaprutil.mak" CFG="libaprutil - Win32 Debug" 
   cd "..\..\modules\ssl"

"libaprutil - Win32 DebugCLEAN" : 
   cd ".\..\..\srclib\apr-util"
   $(MAKE) /$(MAKEFLAGS) /F ".\libaprutil.mak" CFG="libaprutil - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\..\modules\ssl"

!ENDIF 

!IF  "$(CFG)" == "mod_ssl - Win32 Release"

"libhttpd - Win32 Release" : 
   cd ".\..\.."
   $(MAKE) /$(MAKEFLAGS) /F ".\libhttpd.mak" CFG="libhttpd - Win32 Release" 
   cd ".\modules\ssl"

"libhttpd - Win32 ReleaseCLEAN" : 
   cd ".\..\.."
   $(MAKE) /$(MAKEFLAGS) /F ".\libhttpd.mak" CFG="libhttpd - Win32 Release" RECURSE=1 CLEAN 
   cd ".\modules\ssl"

!ELSEIF  "$(CFG)" == "mod_ssl - Win32 Debug"

"libhttpd - Win32 Debug" : 
   cd ".\..\.."
   $(MAKE) /$(MAKEFLAGS) /F ".\libhttpd.mak" CFG="libhttpd - Win32 Debug" 
   cd ".\modules\ssl"

"libhttpd - Win32 DebugCLEAN" : 
   cd ".\..\.."
   $(MAKE) /$(MAKEFLAGS) /F ".\libhttpd.mak" CFG="libhttpd - Win32 Debug" RECURSE=1 CLEAN 
   cd ".\modules\ssl"

!ENDIF 

SOURCE=.\mod_ssl.rc

"$(INTDIR)\mod_ssl.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


SOURCE=..\..\build\win32\win32ver.awk

!IF  "$(CFG)" == "mod_ssl - Win32 Release"

InputPath=..\..\build\win32\win32ver.awk

".\mod_ssl.rc" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	<<tempfile.bat 
	@echo off 
	awk -f ../../build/win32/win32ver.awk mod_ssl  "ssl_module for Apache" ../../include/ap_release.h > .\mod_ssl.rc
<< 
	

!ELSEIF  "$(CFG)" == "mod_ssl - Win32 Debug"

InputPath=..\..\build\win32\win32ver.awk

".\mod_ssl.rc" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	<<tempfile.bat 
	@echo off 
	awk -f ../../build/win32/win32ver.awk mod_ssl  "ssl_module for Apache" ../../include/ap_release.h > .\mod_ssl.rc
<< 
	

!ENDIF 


!ENDIF 

