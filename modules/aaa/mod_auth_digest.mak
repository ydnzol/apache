# Microsoft Developer Studio Generated NMAKE File, Based on mod_auth_digest.dsp
!IF "$(CFG)" == ""
CFG=mod_auth_digest - Win32 Debug
!MESSAGE No configuration specified. Defaulting to mod_auth_digest - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "mod_auth_digest - Win32 Release" && "$(CFG)" != "mod_auth_digest - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "mod_auth_digest.mak" CFG="mod_auth_digest - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "mod_auth_digest - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "mod_auth_digest - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "mod_auth_digest - Win32 Release"

OUTDIR=.\Release
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\Release
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\mod_auth_digest.so"

!ELSE 

ALL : "libhttpd - Win32 Release" "libaprutil - Win32 Release" "libapr - Win32 Release" "$(OUTDIR)\mod_auth_digest.so"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"libapr - Win32 ReleaseCLEAN" "libaprutil - Win32 ReleaseCLEAN" "libhttpd - Win32 ReleaseCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\mod_auth_digest.idb"
	-@erase "$(INTDIR)\mod_auth_digest.obj"
	-@erase "$(INTDIR)\mod_auth_digest.res"
	-@erase "$(OUTDIR)\mod_auth_digest.exp"
	-@erase "$(OUTDIR)\mod_auth_digest.lib"
	-@erase "$(OUTDIR)\mod_auth_digest.map"
	-@erase "$(OUTDIR)\mod_auth_digest.so"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /O2 /I "../../include" /I "../../srclib/apr/include" /I "../../srclib/apr-util/include" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\mod_auth_digest" /FD /c 

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
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o /win32 "NUL" 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\mod_auth_digest.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\mod_auth_digest.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib /nologo /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\mod_auth_digest.pdb" /map:"$(INTDIR)\mod_auth_digest.map" /machine:I386 /out:"$(OUTDIR)\mod_auth_digest.so" /implib:"$(OUTDIR)\mod_auth_digest.lib" /base:@..\..\os\win32\BaseAddr.ref,mod_auth_digest 
LINK32_OBJS= \
	"$(INTDIR)\mod_auth_digest.obj" \
	"$(INTDIR)\mod_auth_digest.res" \
	"..\..\srclib\apr\Release\libapr.lib" \
	"..\..\srclib\apr-util\Release\libaprutil.lib" \
	"..\..\Release\libhttpd.lib"

"$(OUTDIR)\mod_auth_digest.so" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "mod_auth_digest - Win32 Debug"

OUTDIR=.\Debug
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\Debug
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\mod_auth_digest.so"

!ELSE 

ALL : "libhttpd - Win32 Debug" "libaprutil - Win32 Debug" "libapr - Win32 Debug" "$(OUTDIR)\mod_auth_digest.so"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"libapr - Win32 DebugCLEAN" "libaprutil - Win32 DebugCLEAN" "libhttpd - Win32 DebugCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\mod_auth_digest.idb"
	-@erase "$(INTDIR)\mod_auth_digest.obj"
	-@erase "$(INTDIR)\mod_auth_digest.res"
	-@erase "$(OUTDIR)\mod_auth_digest.exp"
	-@erase "$(OUTDIR)\mod_auth_digest.lib"
	-@erase "$(OUTDIR)\mod_auth_digest.map"
	-@erase "$(OUTDIR)\mod_auth_digest.pdb"
	-@erase "$(OUTDIR)\mod_auth_digest.so"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /Zi /Od /I "../../include" /I "../../srclib/apr/include" /I "../../srclib/apr-util/include" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\mod_auth_digest" /FD /c 

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
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o /win32 "NUL" 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\mod_auth_digest.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\mod_auth_digest.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib /nologo /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\mod_auth_digest.pdb" /map:"$(INTDIR)\mod_auth_digest.map" /debug /machine:I386 /out:"$(OUTDIR)\mod_auth_digest.so" /implib:"$(OUTDIR)\mod_auth_digest.lib" /base:@..\..\os\win32\BaseAddr.ref,mod_auth_digest 
LINK32_OBJS= \
	"$(INTDIR)\mod_auth_digest.obj" \
	"$(INTDIR)\mod_auth_digest.res" \
	"..\..\srclib\apr\Debug\libapr.lib" \
	"..\..\srclib\apr-util\Debug\libaprutil.lib" \
	"..\..\Debug\libhttpd.lib"

"$(OUTDIR)\mod_auth_digest.so" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("mod_auth_digest.dep")
!INCLUDE "mod_auth_digest.dep"
!ELSE 
!MESSAGE Warning: cannot find "mod_auth_digest.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "mod_auth_digest - Win32 Release" || "$(CFG)" == "mod_auth_digest - Win32 Debug"

!IF  "$(CFG)" == "mod_auth_digest - Win32 Release"

"libapr - Win32 Release" : 
   cd ".\..\..\srclib\apr"
   $(MAKE) /$(MAKEFLAGS) /F ".\libapr.mak" CFG="libapr - Win32 Release" 
   cd "..\..\modules\aaa"

"libapr - Win32 ReleaseCLEAN" : 
   cd ".\..\..\srclib\apr"
   $(MAKE) /$(MAKEFLAGS) /F ".\libapr.mak" CFG="libapr - Win32 Release" RECURSE=1 CLEAN 
   cd "..\..\modules\aaa"

!ELSEIF  "$(CFG)" == "mod_auth_digest - Win32 Debug"

"libapr - Win32 Debug" : 
   cd ".\..\..\srclib\apr"
   $(MAKE) /$(MAKEFLAGS) /F ".\libapr.mak" CFG="libapr - Win32 Debug" 
   cd "..\..\modules\aaa"

"libapr - Win32 DebugCLEAN" : 
   cd ".\..\..\srclib\apr"
   $(MAKE) /$(MAKEFLAGS) /F ".\libapr.mak" CFG="libapr - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\..\modules\aaa"

!ENDIF 

!IF  "$(CFG)" == "mod_auth_digest - Win32 Release"

"libaprutil - Win32 Release" : 
   cd ".\..\..\srclib\apr-util"
   $(MAKE) /$(MAKEFLAGS) /F ".\libaprutil.mak" CFG="libaprutil - Win32 Release" 
   cd "..\..\modules\aaa"

"libaprutil - Win32 ReleaseCLEAN" : 
   cd ".\..\..\srclib\apr-util"
   $(MAKE) /$(MAKEFLAGS) /F ".\libaprutil.mak" CFG="libaprutil - Win32 Release" RECURSE=1 CLEAN 
   cd "..\..\modules\aaa"

!ELSEIF  "$(CFG)" == "mod_auth_digest - Win32 Debug"

"libaprutil - Win32 Debug" : 
   cd ".\..\..\srclib\apr-util"
   $(MAKE) /$(MAKEFLAGS) /F ".\libaprutil.mak" CFG="libaprutil - Win32 Debug" 
   cd "..\..\modules\aaa"

"libaprutil - Win32 DebugCLEAN" : 
   cd ".\..\..\srclib\apr-util"
   $(MAKE) /$(MAKEFLAGS) /F ".\libaprutil.mak" CFG="libaprutil - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\..\modules\aaa"

!ENDIF 

!IF  "$(CFG)" == "mod_auth_digest - Win32 Release"

"libhttpd - Win32 Release" : 
   cd ".\..\.."
   $(MAKE) /$(MAKEFLAGS) /F ".\libhttpd.mak" CFG="libhttpd - Win32 Release" 
   cd ".\modules\aaa"

"libhttpd - Win32 ReleaseCLEAN" : 
   cd ".\..\.."
   $(MAKE) /$(MAKEFLAGS) /F ".\libhttpd.mak" CFG="libhttpd - Win32 Release" RECURSE=1 CLEAN 
   cd ".\modules\aaa"

!ELSEIF  "$(CFG)" == "mod_auth_digest - Win32 Debug"

"libhttpd - Win32 Debug" : 
   cd ".\..\.."
   $(MAKE) /$(MAKEFLAGS) /F ".\libhttpd.mak" CFG="libhttpd - Win32 Debug" 
   cd ".\modules\aaa"

"libhttpd - Win32 DebugCLEAN" : 
   cd ".\..\.."
   $(MAKE) /$(MAKEFLAGS) /F ".\libhttpd.mak" CFG="libhttpd - Win32 Debug" RECURSE=1 CLEAN 
   cd ".\modules\aaa"

!ENDIF 

SOURCE=.\mod_auth_digest.c

"$(INTDIR)\mod_auth_digest.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\mod_auth_digest.rc

"$(INTDIR)\mod_auth_digest.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


SOURCE=..\..\build\win32\win32ver.awk

!IF  "$(CFG)" == "mod_auth_digest - Win32 Release"

InputPath=..\..\build\win32\win32ver.awk

".\mod_auth_digest.rc" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	<<tempfile.bat 
	@echo off 
	awk -f ../../build/win32/win32ver.awk mod_auth_digest  "auth_digest_module for Apache" ../../include/ap_release.h > .\mod_auth_digest.rc
<< 
	

!ELSEIF  "$(CFG)" == "mod_auth_digest - Win32 Debug"

InputPath=..\..\build\win32\win32ver.awk

".\mod_auth_digest.rc" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	<<tempfile.bat 
	@echo off 
	awk -f ../../build/win32/win32ver.awk mod_auth_digest  "auth_digest_module for Apache" ../../include/ap_release.h > .\mod_auth_digest.rc
<< 
	

!ENDIF 


!ENDIF 

