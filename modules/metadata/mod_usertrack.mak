# Microsoft Developer Studio Generated NMAKE File, Based on mod_usertrack.dsp
!IF "$(CFG)" == ""
CFG=mod_usertrack - Win32 Release
!MESSAGE No configuration specified. Defaulting to mod_usertrack - Win32 Release.
!ENDIF 

!IF "$(CFG)" != "mod_usertrack - Win32 Release" && "$(CFG)" != "mod_usertrack - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "mod_usertrack.mak" CFG="mod_usertrack - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "mod_usertrack - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "mod_usertrack - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "mod_usertrack - Win32 Release"

OUTDIR=.\Release
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\Release
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\mod_usertrack.so"

!ELSE 

ALL : "libhttpd - Win32 Release" "libaprutil - Win32 Release" "libapr - Win32 Release" "$(OUTDIR)\mod_usertrack.so"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"libapr - Win32 ReleaseCLEAN" "libaprutil - Win32 ReleaseCLEAN" "libhttpd - Win32 ReleaseCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\mod_usertrack.idb"
	-@erase "$(INTDIR)\mod_usertrack.obj"
	-@erase "$(INTDIR)\mod_usertrack.res"
	-@erase "$(OUTDIR)\mod_usertrack.exp"
	-@erase "$(OUTDIR)\mod_usertrack.lib"
	-@erase "$(OUTDIR)\mod_usertrack.map"
	-@erase "$(OUTDIR)\mod_usertrack.so"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /O2 /I "../../include" /I "../../srclib/apr/include" /I "../../srclib/apr-util/include" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\mod_usertrack" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\mod_usertrack.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\mod_usertrack.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib /nologo /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\mod_usertrack.pdb" /map:"$(INTDIR)\mod_usertrack.map" /machine:I386 /out:"$(OUTDIR)\mod_usertrack.so" /implib:"$(OUTDIR)\mod_usertrack.lib" /base:@..\..\os\win32\BaseAddr.ref,mod_usertrack 
LINK32_OBJS= \
	"$(INTDIR)\mod_usertrack.obj" \
	"$(INTDIR)\mod_usertrack.res" \
	"..\..\srclib\apr\Release\libapr.lib" \
	"..\..\srclib\apr-util\Release\libaprutil.lib" \
	"..\..\Release\libhttpd.lib"

"$(OUTDIR)\mod_usertrack.so" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "mod_usertrack - Win32 Debug"

OUTDIR=.\Debug
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\Debug
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\mod_usertrack.so"

!ELSE 

ALL : "libhttpd - Win32 Debug" "libaprutil - Win32 Debug" "libapr - Win32 Debug" "$(OUTDIR)\mod_usertrack.so"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"libapr - Win32 DebugCLEAN" "libaprutil - Win32 DebugCLEAN" "libhttpd - Win32 DebugCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\mod_usertrack.idb"
	-@erase "$(INTDIR)\mod_usertrack.obj"
	-@erase "$(INTDIR)\mod_usertrack.res"
	-@erase "$(OUTDIR)\mod_usertrack.exp"
	-@erase "$(OUTDIR)\mod_usertrack.lib"
	-@erase "$(OUTDIR)\mod_usertrack.map"
	-@erase "$(OUTDIR)\mod_usertrack.pdb"
	-@erase "$(OUTDIR)\mod_usertrack.so"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /Zi /Od /I "../../include" /I "../../srclib/apr/include" /I "../../srclib/apr-util/include" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\mod_usertrack" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\mod_usertrack.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\mod_usertrack.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib /nologo /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\mod_usertrack.pdb" /map:"$(INTDIR)\mod_usertrack.map" /debug /machine:I386 /out:"$(OUTDIR)\mod_usertrack.so" /implib:"$(OUTDIR)\mod_usertrack.lib" /base:@..\..\os\win32\BaseAddr.ref,mod_usertrack 
LINK32_OBJS= \
	"$(INTDIR)\mod_usertrack.obj" \
	"$(INTDIR)\mod_usertrack.res" \
	"..\..\srclib\apr\Debug\libapr.lib" \
	"..\..\srclib\apr-util\Debug\libaprutil.lib" \
	"..\..\Debug\libhttpd.lib"

"$(OUTDIR)\mod_usertrack.so" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("mod_usertrack.dep")
!INCLUDE "mod_usertrack.dep"
!ELSE 
!MESSAGE Warning: cannot find "mod_usertrack.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "mod_usertrack - Win32 Release" || "$(CFG)" == "mod_usertrack - Win32 Debug"

!IF  "$(CFG)" == "mod_usertrack - Win32 Release"

"libapr - Win32 Release" : 
   cd ".\..\..\srclib\apr"
   $(MAKE) /$(MAKEFLAGS) /F ".\libapr.mak" CFG="libapr - Win32 Release" 
   cd "..\..\modules\metadata"

"libapr - Win32 ReleaseCLEAN" : 
   cd ".\..\..\srclib\apr"
   $(MAKE) /$(MAKEFLAGS) /F ".\libapr.mak" CFG="libapr - Win32 Release" RECURSE=1 CLEAN 
   cd "..\..\modules\metadata"

!ELSEIF  "$(CFG)" == "mod_usertrack - Win32 Debug"

"libapr - Win32 Debug" : 
   cd ".\..\..\srclib\apr"
   $(MAKE) /$(MAKEFLAGS) /F ".\libapr.mak" CFG="libapr - Win32 Debug" 
   cd "..\..\modules\metadata"

"libapr - Win32 DebugCLEAN" : 
   cd ".\..\..\srclib\apr"
   $(MAKE) /$(MAKEFLAGS) /F ".\libapr.mak" CFG="libapr - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\..\modules\metadata"

!ENDIF 

!IF  "$(CFG)" == "mod_usertrack - Win32 Release"

"libaprutil - Win32 Release" : 
   cd ".\..\..\srclib\apr-util"
   $(MAKE) /$(MAKEFLAGS) /F ".\libaprutil.mak" CFG="libaprutil - Win32 Release" 
   cd "..\..\modules\metadata"

"libaprutil - Win32 ReleaseCLEAN" : 
   cd ".\..\..\srclib\apr-util"
   $(MAKE) /$(MAKEFLAGS) /F ".\libaprutil.mak" CFG="libaprutil - Win32 Release" RECURSE=1 CLEAN 
   cd "..\..\modules\metadata"

!ELSEIF  "$(CFG)" == "mod_usertrack - Win32 Debug"

"libaprutil - Win32 Debug" : 
   cd ".\..\..\srclib\apr-util"
   $(MAKE) /$(MAKEFLAGS) /F ".\libaprutil.mak" CFG="libaprutil - Win32 Debug" 
   cd "..\..\modules\metadata"

"libaprutil - Win32 DebugCLEAN" : 
   cd ".\..\..\srclib\apr-util"
   $(MAKE) /$(MAKEFLAGS) /F ".\libaprutil.mak" CFG="libaprutil - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\..\modules\metadata"

!ENDIF 

!IF  "$(CFG)" == "mod_usertrack - Win32 Release"

"libhttpd - Win32 Release" : 
   cd ".\..\.."
   $(MAKE) /$(MAKEFLAGS) /F ".\libhttpd.mak" CFG="libhttpd - Win32 Release" 
   cd ".\modules\metadata"

"libhttpd - Win32 ReleaseCLEAN" : 
   cd ".\..\.."
   $(MAKE) /$(MAKEFLAGS) /F ".\libhttpd.mak" CFG="libhttpd - Win32 Release" RECURSE=1 CLEAN 
   cd ".\modules\metadata"

!ELSEIF  "$(CFG)" == "mod_usertrack - Win32 Debug"

"libhttpd - Win32 Debug" : 
   cd ".\..\.."
   $(MAKE) /$(MAKEFLAGS) /F ".\libhttpd.mak" CFG="libhttpd - Win32 Debug" 
   cd ".\modules\metadata"

"libhttpd - Win32 DebugCLEAN" : 
   cd ".\..\.."
   $(MAKE) /$(MAKEFLAGS) /F ".\libhttpd.mak" CFG="libhttpd - Win32 Debug" RECURSE=1 CLEAN 
   cd ".\modules\metadata"

!ENDIF 

SOURCE=.\mod_usertrack.c

"$(INTDIR)\mod_usertrack.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\mod_usertrack.rc

"$(INTDIR)\mod_usertrack.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


SOURCE=..\..\build\win32\win32ver.awk

!IF  "$(CFG)" == "mod_usertrack - Win32 Release"

InputPath=..\..\build\win32\win32ver.awk

".\mod_usertrack.rc" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	<<tempfile.bat 
	@echo off 
	awk -f ../../build/win32/win32ver.awk mod_usertrack  "usertrack_module for Apache" ../../include/ap_release.h  > .\mod_usertrack.rc
<< 
	

!ELSEIF  "$(CFG)" == "mod_usertrack - Win32 Debug"

InputPath=..\..\build\win32\win32ver.awk

".\mod_usertrack.rc" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	<<tempfile.bat 
	@echo off 
	awk -f ../../build/win32/win32ver.awk mod_usertrack  "usertrack_module for Apache" ../../include/ap_release.h  > .\mod_usertrack.rc
<< 
	

!ENDIF 


!ENDIF 

