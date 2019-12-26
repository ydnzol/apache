# Microsoft Developer Studio Generated NMAKE File, Based on util_ldap.dsp
!IF "$(CFG)" == ""
CFG=util_ldap - Win32 Release
!MESSAGE No configuration specified. Defaulting to util_ldap - Win32 Release.
!ENDIF 

!IF "$(CFG)" != "util_ldap - Win32 Release" && "$(CFG)" != "util_ldap - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "util_ldap.mak" CFG="util_ldap - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "util_ldap - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "util_ldap - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "util_ldap - Win32 Release"

OUTDIR=.\Release
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\Release
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\util_ldap.so"

!ELSE 

ALL : "libhttpd - Win32 Release" "libaprutil - Win32 Release" "libapr - Win32 Release" "$(OUTDIR)\util_ldap.so"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"libapr - Win32 ReleaseCLEAN" "libaprutil - Win32 ReleaseCLEAN" "libhttpd - Win32 ReleaseCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\util_ldap.idb"
	-@erase "$(INTDIR)\util_ldap.obj"
	-@erase "$(INTDIR)\util_ldap.res"
	-@erase "$(INTDIR)\util_ldap_cache.obj"
	-@erase "$(INTDIR)\util_ldap_cache_mgr.obj"
	-@erase "$(OUTDIR)\util_ldap.exp"
	-@erase "$(OUTDIR)\util_ldap.lib"
	-@erase "$(OUTDIR)\util_ldap.map"
	-@erase "$(OUTDIR)\util_ldap.so"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /O2 /I "../../include" /I "../../srclib/apr/include" /I "../../srclib/apr-util/include" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "LDAP_DECLARE_EXPORT" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\util_ldap" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\util_ldap.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\util_ldap.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib wldap32.lib /nologo /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\util_ldap.pdb" /map:"$(INTDIR)\util_ldap.map" /machine:I386 /out:"$(OUTDIR)\util_ldap.so" /implib:"$(OUTDIR)\util_ldap.lib" /base:@..\..\os\win32\BaseAddr.ref,util_ldap 
LINK32_OBJS= \
	"$(INTDIR)\util_ldap.obj" \
	"$(INTDIR)\util_ldap_cache.obj" \
	"$(INTDIR)\util_ldap_cache_mgr.obj" \
	"$(INTDIR)\util_ldap.res" \
	"..\..\srclib\apr\Release\libapr.lib" \
	"..\..\srclib\apr-util\Release\libaprutil.lib" \
	"..\..\Release\libhttpd.lib"

"$(OUTDIR)\util_ldap.so" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "util_ldap - Win32 Debug"

OUTDIR=.\Debug
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\Debug
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\util_ldap.so"

!ELSE 

ALL : "libhttpd - Win32 Debug" "libaprutil - Win32 Debug" "libapr - Win32 Debug" "$(OUTDIR)\util_ldap.so"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"libapr - Win32 DebugCLEAN" "libaprutil - Win32 DebugCLEAN" "libhttpd - Win32 DebugCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\util_ldap.idb"
	-@erase "$(INTDIR)\util_ldap.obj"
	-@erase "$(INTDIR)\util_ldap.res"
	-@erase "$(INTDIR)\util_ldap_cache.obj"
	-@erase "$(INTDIR)\util_ldap_cache_mgr.obj"
	-@erase "$(OUTDIR)\util_ldap.exp"
	-@erase "$(OUTDIR)\util_ldap.lib"
	-@erase "$(OUTDIR)\util_ldap.map"
	-@erase "$(OUTDIR)\util_ldap.pdb"
	-@erase "$(OUTDIR)\util_ldap.so"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /Zi /Od /I "../../include" /I "../../srclib/apr/include" /I "../../srclib/apr-util/include" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "LDAP_DECLARE_EXPORT" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\util_ldap" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\util_ldap.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\util_ldap.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib wldap32.lib /nologo /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\util_ldap.pdb" /map:"$(INTDIR)\util_ldap.map" /debug /machine:I386 /out:"$(OUTDIR)\util_ldap.so" /implib:"$(OUTDIR)\util_ldap.lib" /base:@..\..\os\win32\BaseAddr.ref,util_ldap 
LINK32_OBJS= \
	"$(INTDIR)\util_ldap.obj" \
	"$(INTDIR)\util_ldap_cache.obj" \
	"$(INTDIR)\util_ldap_cache_mgr.obj" \
	"$(INTDIR)\util_ldap.res" \
	"..\..\srclib\apr\Debug\libapr.lib" \
	"..\..\srclib\apr-util\Debug\libaprutil.lib" \
	"..\..\Debug\libhttpd.lib"

"$(OUTDIR)\util_ldap.so" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("util_ldap.dep")
!INCLUDE "util_ldap.dep"
!ELSE 
!MESSAGE Warning: cannot find "util_ldap.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "util_ldap - Win32 Release" || "$(CFG)" == "util_ldap - Win32 Debug"

!IF  "$(CFG)" == "util_ldap - Win32 Release"

"libapr - Win32 Release" : 
   cd ".\..\..\srclib\apr"
   $(MAKE) /$(MAKEFLAGS) /F ".\libapr.mak" CFG="libapr - Win32 Release" 
   cd "..\..\modules\experimental"

"libapr - Win32 ReleaseCLEAN" : 
   cd ".\..\..\srclib\apr"
   $(MAKE) /$(MAKEFLAGS) /F ".\libapr.mak" CFG="libapr - Win32 Release" RECURSE=1 CLEAN 
   cd "..\..\modules\experimental"

!ELSEIF  "$(CFG)" == "util_ldap - Win32 Debug"

"libapr - Win32 Debug" : 
   cd ".\..\..\srclib\apr"
   $(MAKE) /$(MAKEFLAGS) /F ".\libapr.mak" CFG="libapr - Win32 Debug" 
   cd "..\..\modules\experimental"

"libapr - Win32 DebugCLEAN" : 
   cd ".\..\..\srclib\apr"
   $(MAKE) /$(MAKEFLAGS) /F ".\libapr.mak" CFG="libapr - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\..\modules\experimental"

!ENDIF 

!IF  "$(CFG)" == "util_ldap - Win32 Release"

"libaprutil - Win32 Release" : 
   cd ".\..\..\srclib\apr-util"
   $(MAKE) /$(MAKEFLAGS) /F ".\libaprutil.mak" CFG="libaprutil - Win32 Release" 
   cd "..\..\modules\experimental"

"libaprutil - Win32 ReleaseCLEAN" : 
   cd ".\..\..\srclib\apr-util"
   $(MAKE) /$(MAKEFLAGS) /F ".\libaprutil.mak" CFG="libaprutil - Win32 Release" RECURSE=1 CLEAN 
   cd "..\..\modules\experimental"

!ELSEIF  "$(CFG)" == "util_ldap - Win32 Debug"

"libaprutil - Win32 Debug" : 
   cd ".\..\..\srclib\apr-util"
   $(MAKE) /$(MAKEFLAGS) /F ".\libaprutil.mak" CFG="libaprutil - Win32 Debug" 
   cd "..\..\modules\experimental"

"libaprutil - Win32 DebugCLEAN" : 
   cd ".\..\..\srclib\apr-util"
   $(MAKE) /$(MAKEFLAGS) /F ".\libaprutil.mak" CFG="libaprutil - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\..\modules\experimental"

!ENDIF 

!IF  "$(CFG)" == "util_ldap - Win32 Release"

"libhttpd - Win32 Release" : 
   cd ".\..\.."
   $(MAKE) /$(MAKEFLAGS) /F ".\libhttpd.mak" CFG="libhttpd - Win32 Release" 
   cd ".\modules\experimental"

"libhttpd - Win32 ReleaseCLEAN" : 
   cd ".\..\.."
   $(MAKE) /$(MAKEFLAGS) /F ".\libhttpd.mak" CFG="libhttpd - Win32 Release" RECURSE=1 CLEAN 
   cd ".\modules\experimental"

!ELSEIF  "$(CFG)" == "util_ldap - Win32 Debug"

"libhttpd - Win32 Debug" : 
   cd ".\..\.."
   $(MAKE) /$(MAKEFLAGS) /F ".\libhttpd.mak" CFG="libhttpd - Win32 Debug" 
   cd ".\modules\experimental"

"libhttpd - Win32 DebugCLEAN" : 
   cd ".\..\.."
   $(MAKE) /$(MAKEFLAGS) /F ".\libhttpd.mak" CFG="libhttpd - Win32 Debug" RECURSE=1 CLEAN 
   cd ".\modules\experimental"

!ENDIF 

SOURCE=.\util_ldap.c

"$(INTDIR)\util_ldap.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\util_ldap.rc

"$(INTDIR)\util_ldap.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


SOURCE=.\util_ldap_cache.c

"$(INTDIR)\util_ldap_cache.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\util_ldap_cache_mgr.c

"$(INTDIR)\util_ldap_cache_mgr.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=..\..\build\win32\win32ver.awk

!IF  "$(CFG)" == "util_ldap - Win32 Release"

InputPath=..\..\build\win32\win32ver.awk

".\util_ldap.rc" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	<<tempfile.bat 
	@echo off 
	awk -f ../../build/win32/win32ver.awk util_ldap "LDAP Utility Module for Apache" ../../include/ap_release.h > .\util_ldap.rc
<< 
	

!ELSEIF  "$(CFG)" == "util_ldap - Win32 Debug"

InputPath=..\..\build\win32\win32ver.awk

".\util_ldap.rc" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	<<tempfile.bat 
	@echo off 
	awk -f ../../build/win32/win32ver.awk util_ldap "LDAP Utility Module for Apache" ../../include/ap_release.h > .\util_ldap.rc
<< 
	

!ENDIF 


!ENDIF 

