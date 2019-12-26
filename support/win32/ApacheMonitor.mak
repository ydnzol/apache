# Microsoft Developer Studio Generated NMAKE File, Based on ApacheMonitor.dsp
!IF "$(CFG)" == ""
CFG=ApacheMonitor - Win32 Debug
!MESSAGE No configuration specified. Defaulting to ApacheMonitor - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "ApacheMonitor - Win32 Release" && "$(CFG)" != "ApacheMonitor - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "ApacheMonitor.mak" CFG="ApacheMonitor - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "ApacheMonitor - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "ApacheMonitor - Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "ApacheMonitor - Win32 Release"

OUTDIR=.\Release
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\Release
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\ApacheMonitor.exe"

!ELSE 

ALL : "aprutil - Win32 Release" "apr - Win32 Release" "$(OUTDIR)\ApacheMonitor.exe"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"apr - Win32 ReleaseCLEAN" "aprutil - Win32 ReleaseCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\ApacheMonitor.idb"
	-@erase "$(INTDIR)\ApacheMonitor.obj"
	-@erase "$(INTDIR)\ApacheMonitorVer.res"
	-@erase "$(OUTDIR)\ApacheMonitor.exe"
	-@erase "$(OUTDIR)\ApacheMonitor.map"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "STRICT" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\ApacheMonitor" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\ApacheMonitorVer.res" /i ".\\" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\ApacheMonitor.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib comctl32.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\ApacheMonitor.pdb" /map:"$(INTDIR)\ApacheMonitor.map" /machine:I386 /out:"$(OUTDIR)\ApacheMonitor.exe" 
LINK32_OBJS= \
	"$(INTDIR)\ApacheMonitor.obj" \
	"$(INTDIR)\ApacheMonitorVer.res" \
	"..\..\srclib\apr\LibR\apr.lib" \
	"..\..\srclib\apr-util\LibR\aprutil.lib"

"$(OUTDIR)\ApacheMonitor.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "ApacheMonitor - Win32 Debug"

OUTDIR=.\Debug
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\Debug
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\ApacheMonitor.exe"

!ELSE 

ALL : "aprutil - Win32 Debug" "apr - Win32 Debug" "$(OUTDIR)\ApacheMonitor.exe"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"apr - Win32 DebugCLEAN" "aprutil - Win32 DebugCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\ApacheMonitor.idb"
	-@erase "$(INTDIR)\ApacheMonitor.obj"
	-@erase "$(INTDIR)\ApacheMonitorVer.res"
	-@erase "$(OUTDIR)\ApacheMonitor.exe"
	-@erase "$(OUTDIR)\ApacheMonitor.map"
	-@erase "$(OUTDIR)\ApacheMonitor.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "STRICT" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\ApacheMonitor" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\ApacheMonitorVer.res" /i ".\\" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\ApacheMonitor.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib comctl32.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\ApacheMonitor.pdb" /map:"$(INTDIR)\ApacheMonitor.map" /debug /machine:I386 /out:"$(OUTDIR)\ApacheMonitor.exe" 
LINK32_OBJS= \
	"$(INTDIR)\ApacheMonitor.obj" \
	"$(INTDIR)\ApacheMonitorVer.res" \
	"..\..\srclib\apr\LibD\apr.lib" \
	"..\..\srclib\apr-util\LibD\aprutil.lib"

"$(OUTDIR)\ApacheMonitor.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("ApacheMonitor.dep")
!INCLUDE "ApacheMonitor.dep"
!ELSE 
!MESSAGE Warning: cannot find "ApacheMonitor.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "ApacheMonitor - Win32 Release" || "$(CFG)" == "ApacheMonitor - Win32 Debug"
SOURCE=.\ApacheMonitor.rc

!IF  "$(CFG)" == "ApacheMonitor - Win32 Release"

"apr - Win32 Release" : 
   cd ".\..\..\srclib\apr"
   $(MAKE) /$(MAKEFLAGS) /F ".\apr.mak" CFG="apr - Win32 Release" 
   cd "..\..\support\win32"

"apr - Win32 ReleaseCLEAN" : 
   cd ".\..\..\srclib\apr"
   $(MAKE) /$(MAKEFLAGS) /F ".\apr.mak" CFG="apr - Win32 Release" RECURSE=1 CLEAN 
   cd "..\..\support\win32"

!ELSEIF  "$(CFG)" == "ApacheMonitor - Win32 Debug"

"apr - Win32 Debug" : 
   cd ".\..\..\srclib\apr"
   $(MAKE) /$(MAKEFLAGS) /F ".\apr.mak" CFG="apr - Win32 Debug" 
   cd "..\..\support\win32"

"apr - Win32 DebugCLEAN" : 
   cd ".\..\..\srclib\apr"
   $(MAKE) /$(MAKEFLAGS) /F ".\apr.mak" CFG="apr - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\..\support\win32"

!ENDIF 

!IF  "$(CFG)" == "ApacheMonitor - Win32 Release"

"aprutil - Win32 Release" : 
   cd ".\..\..\srclib\apr-util"
   $(MAKE) /$(MAKEFLAGS) /F ".\aprutil.mak" CFG="aprutil - Win32 Release" 
   cd "..\..\support\win32"

"aprutil - Win32 ReleaseCLEAN" : 
   cd ".\..\..\srclib\apr-util"
   $(MAKE) /$(MAKEFLAGS) /F ".\aprutil.mak" CFG="aprutil - Win32 Release" RECURSE=1 CLEAN 
   cd "..\..\support\win32"

!ELSEIF  "$(CFG)" == "ApacheMonitor - Win32 Debug"

"aprutil - Win32 Debug" : 
   cd ".\..\..\srclib\apr-util"
   $(MAKE) /$(MAKEFLAGS) /F ".\aprutil.mak" CFG="aprutil - Win32 Debug" 
   cd "..\..\support\win32"

"aprutil - Win32 DebugCLEAN" : 
   cd ".\..\..\srclib\apr-util"
   $(MAKE) /$(MAKEFLAGS) /F ".\aprutil.mak" CFG="aprutil - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\..\support\win32"

!ENDIF 

SOURCE=.\ApacheMonitor.c

"$(INTDIR)\ApacheMonitor.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\ApacheMonitorVer.rc

"$(INTDIR)\ApacheMonitorVer.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


SOURCE=..\..\build\win32\win32ver.awk

!IF  "$(CFG)" == "ApacheMonitor - Win32 Release"

InputPath=..\..\build\win32\win32ver.awk
USERDEP__WIN32="..\..\include\ap_release.h"	".\ApacheMonitor.rc"	

".\ApacheMonitorVer.rc" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)" $(USERDEP__WIN32)
	<<tempfile.bat 
	@echo off 
	echo /* This file is autogenerated from ApacheMonitor.rc > ApacheMonitorVer.rc 
	echo  * DO NOT EDIT! >> ApacheMonitorVer.rc 
	echo  */ >> ApacheMonitorVer.rc 
	type ApacheMonitor.rc >> ApacheMonitorVer.rc 
	awk -f ../../build/win32/win32ver.awk ApacheMonitor  "Apache HTTP Server Monitor" ../../include/ap_release.h >> ApacheMonitorVer.rc 
<< 
	

!ELSEIF  "$(CFG)" == "ApacheMonitor - Win32 Debug"

InputPath=..\..\build\win32\win32ver.awk
USERDEP__WIN32="..\..\include\ap_release.h"	".\ApacheMonitor.rc"	

".\ApacheMonitorVer.rc" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)" $(USERDEP__WIN32)
	<<tempfile.bat 
	@echo off 
	echo /* This file is autogenerated from ApacheMonitor.rc > ApacheMonitorVer.rc 
	echo  * DO NOT EDIT! >> ApacheMonitorVer.rc 
	echo  */ >> ApacheMonitorVer.rc 
	type ApacheMonitor.rc >> ApacheMonitorVer.rc 
	awk -f ../../build/win32/win32ver.awk ApacheMonitor  "Apache HTTP Server Monitor" ../../include/ap_release.h >> ApacheMonitorVer.rc 
<< 
	

!ENDIF 


!ENDIF 

