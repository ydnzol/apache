# Microsoft Developer Studio Generated NMAKE File, Based on mod_proxy_ftp.dsp
!IF "$(CFG)" == ""
CFG=mod_proxy_ftp - Win32 Release
!MESSAGE No configuration specified. Defaulting to mod_proxy_ftp - Win32 Release.
!ENDIF 

!IF "$(CFG)" != "mod_proxy_ftp - Win32 Release" && "$(CFG)" != "mod_proxy_ftp - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "mod_proxy_ftp.mak" CFG="mod_proxy_ftp - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "mod_proxy_ftp - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "mod_proxy_ftp - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "mod_proxy_ftp - Win32 Release"

OUTDIR=.\Release
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\Release
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : ".\mod_proxy_ftp.rc" "$(OUTDIR)\mod_proxy_ftp.so"

!ELSE 

ALL : "mod_proxy - Win32 Release" "libhttpd - Win32 Release" "libaprutil - Win32 Release" "libapr - Win32 Release" ".\mod_proxy_ftp.rc" "$(OUTDIR)\mod_proxy_ftp.so"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"libapr - Win32 ReleaseCLEAN" "libaprutil - Win32 ReleaseCLEAN" "libhttpd - Win32 ReleaseCLEAN" "mod_proxy - Win32 ReleaseCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\mod_proxy_ftp.idb"
	-@erase "$(INTDIR)\proxy_ftp.obj"
	-@erase "$(OUTDIR)\mod_proxy_ftp.exp"
	-@erase "$(OUTDIR)\mod_proxy_ftp.lib"
	-@erase "$(OUTDIR)\mod_proxy_ftp.map"
	-@erase "$(OUTDIR)\mod_proxy_ftp.so"
	-@erase ".\mod_proxy_ftp.rc"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /O2 /I "../../include" /I "../../srclib/apr/include" /I "../../srclib/apr-util/include" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\mod_proxy_ftp" /FD /c 

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
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\mod_proxy_ftp.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib ws2_32.lib mswsock.lib /nologo /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\mod_proxy_ftp.pdb" /map:"$(INTDIR)\mod_proxy_ftp.map" /machine:I386 /out:"$(OUTDIR)\mod_proxy_ftp.so" /implib:"$(OUTDIR)\mod_proxy_ftp.lib" /base:@..\..\os\win32\BaseAddr.ref,mod_proxy_ftp 
LINK32_OBJS= \
	"$(INTDIR)\proxy_ftp.obj" \
	"..\..\srclib\apr\Release\libapr.lib" \
	"..\..\srclib\apr-util\Release\libaprutil.lib" \
	"..\..\Release\libhttpd.lib" \
	"$(OUTDIR)\mod_proxy.lib"

"$(OUTDIR)\mod_proxy_ftp.so" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "mod_proxy_ftp - Win32 Debug"

OUTDIR=.\Debug
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\Debug
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : ".\mod_proxy_ftp.rc" "$(OUTDIR)\mod_proxy_ftp.so"

!ELSE 

ALL : "mod_proxy - Win32 Debug" "libhttpd - Win32 Debug" "libaprutil - Win32 Debug" "libapr - Win32 Debug" ".\mod_proxy_ftp.rc" "$(OUTDIR)\mod_proxy_ftp.so"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"libapr - Win32 DebugCLEAN" "libaprutil - Win32 DebugCLEAN" "libhttpd - Win32 DebugCLEAN" "mod_proxy - Win32 DebugCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\mod_proxy_ftp.idb"
	-@erase "$(INTDIR)\proxy_ftp.obj"
	-@erase "$(OUTDIR)\mod_proxy_ftp.exp"
	-@erase "$(OUTDIR)\mod_proxy_ftp.lib"
	-@erase "$(OUTDIR)\mod_proxy_ftp.map"
	-@erase "$(OUTDIR)\mod_proxy_ftp.pdb"
	-@erase "$(OUTDIR)\mod_proxy_ftp.so"
	-@erase ".\mod_proxy_ftp.rc"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /Zi /Od /I "../../include" /I "../../srclib/apr/include" /I "../../srclib/apr-util/include" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\mod_proxy_ftp" /FD /c 

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
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\mod_proxy_ftp.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib ws2_32.lib mswsock.lib /nologo /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\mod_proxy_ftp.pdb" /map:"$(INTDIR)\mod_proxy_ftp.map" /debug /machine:I386 /out:"$(OUTDIR)\mod_proxy_ftp.so" /implib:"$(OUTDIR)\mod_proxy_ftp.lib" /base:@..\..\os\win32\BaseAddr.ref,mod_proxy_ftp 
LINK32_OBJS= \
	"$(INTDIR)\proxy_ftp.obj" \
	"..\..\srclib\apr\Debug\libapr.lib" \
	"..\..\srclib\apr-util\Debug\libaprutil.lib" \
	"..\..\Debug\libhttpd.lib" \
	"$(OUTDIR)\mod_proxy.lib"

"$(OUTDIR)\mod_proxy_ftp.so" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("mod_proxy_ftp.dep")
!INCLUDE "mod_proxy_ftp.dep"
!ELSE 
!MESSAGE Warning: cannot find "mod_proxy_ftp.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "mod_proxy_ftp - Win32 Release" || "$(CFG)" == "mod_proxy_ftp - Win32 Debug"
SOURCE=.\proxy_ftp.c

"$(INTDIR)\proxy_ftp.obj" : $(SOURCE) "$(INTDIR)"


!IF  "$(CFG)" == "mod_proxy_ftp - Win32 Release"

"libapr - Win32 Release" : 
   cd ".\..\..\srclib\apr"
   $(MAKE) /$(MAKEFLAGS) /F ".\libapr.mak" CFG="libapr - Win32 Release" 
   cd "..\..\modules\proxy"

"libapr - Win32 ReleaseCLEAN" : 
   cd ".\..\..\srclib\apr"
   $(MAKE) /$(MAKEFLAGS) /F ".\libapr.mak" CFG="libapr - Win32 Release" RECURSE=1 CLEAN 
   cd "..\..\modules\proxy"

!ELSEIF  "$(CFG)" == "mod_proxy_ftp - Win32 Debug"

"libapr - Win32 Debug" : 
   cd ".\..\..\srclib\apr"
   $(MAKE) /$(MAKEFLAGS) /F ".\libapr.mak" CFG="libapr - Win32 Debug" 
   cd "..\..\modules\proxy"

"libapr - Win32 DebugCLEAN" : 
   cd ".\..\..\srclib\apr"
   $(MAKE) /$(MAKEFLAGS) /F ".\libapr.mak" CFG="libapr - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\..\modules\proxy"

!ENDIF 

!IF  "$(CFG)" == "mod_proxy_ftp - Win32 Release"

"libaprutil - Win32 Release" : 
   cd ".\..\..\srclib\apr-util"
   $(MAKE) /$(MAKEFLAGS) /F ".\libaprutil.mak" CFG="libaprutil - Win32 Release" 
   cd "..\..\modules\proxy"

"libaprutil - Win32 ReleaseCLEAN" : 
   cd ".\..\..\srclib\apr-util"
   $(MAKE) /$(MAKEFLAGS) /F ".\libaprutil.mak" CFG="libaprutil - Win32 Release" RECURSE=1 CLEAN 
   cd "..\..\modules\proxy"

!ELSEIF  "$(CFG)" == "mod_proxy_ftp - Win32 Debug"

"libaprutil - Win32 Debug" : 
   cd ".\..\..\srclib\apr-util"
   $(MAKE) /$(MAKEFLAGS) /F ".\libaprutil.mak" CFG="libaprutil - Win32 Debug" 
   cd "..\..\modules\proxy"

"libaprutil - Win32 DebugCLEAN" : 
   cd ".\..\..\srclib\apr-util"
   $(MAKE) /$(MAKEFLAGS) /F ".\libaprutil.mak" CFG="libaprutil - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\..\modules\proxy"

!ENDIF 

!IF  "$(CFG)" == "mod_proxy_ftp - Win32 Release"

"libhttpd - Win32 Release" : 
   cd ".\..\.."
   $(MAKE) /$(MAKEFLAGS) /F ".\libhttpd.mak" CFG="libhttpd - Win32 Release" 
   cd ".\modules\proxy"

"libhttpd - Win32 ReleaseCLEAN" : 
   cd ".\..\.."
   $(MAKE) /$(MAKEFLAGS) /F ".\libhttpd.mak" CFG="libhttpd - Win32 Release" RECURSE=1 CLEAN 
   cd ".\modules\proxy"

!ELSEIF  "$(CFG)" == "mod_proxy_ftp - Win32 Debug"

"libhttpd - Win32 Debug" : 
   cd ".\..\.."
   $(MAKE) /$(MAKEFLAGS) /F ".\libhttpd.mak" CFG="libhttpd - Win32 Debug" 
   cd ".\modules\proxy"

"libhttpd - Win32 DebugCLEAN" : 
   cd ".\..\.."
   $(MAKE) /$(MAKEFLAGS) /F ".\libhttpd.mak" CFG="libhttpd - Win32 Debug" RECURSE=1 CLEAN 
   cd ".\modules\proxy"

!ENDIF 

!IF  "$(CFG)" == "mod_proxy_ftp - Win32 Release"

"mod_proxy - Win32 Release" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\mod_proxy.mak" CFG="mod_proxy - Win32 Release" 
   cd "."

"mod_proxy - Win32 ReleaseCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\mod_proxy.mak" CFG="mod_proxy - Win32 Release" RECURSE=1 CLEAN 
   cd "."

!ELSEIF  "$(CFG)" == "mod_proxy_ftp - Win32 Debug"

"mod_proxy - Win32 Debug" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\mod_proxy.mak" CFG="mod_proxy - Win32 Debug" 
   cd "."

"mod_proxy - Win32 DebugCLEAN" : 
   cd "."
   $(MAKE) /$(MAKEFLAGS) /F ".\mod_proxy.mak" CFG="mod_proxy - Win32 Debug" RECURSE=1 CLEAN 
   cd "."

!ENDIF 

SOURCE=..\..\build\win32\win32ver.awk

!IF  "$(CFG)" == "mod_proxy_ftp - Win32 Release"

InputPath=..\..\build\win32\win32ver.awk

".\mod_proxy_ftp.rc" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	<<tempfile.bat 
	@echo off 
	awk -f ../../build/win32/win32ver.awk mod_proxy_ftp  "proxy_ftp_module for Apache" ../../include/ap_release.h > .\mod_proxy_ftp.rc
<< 
	

!ELSEIF  "$(CFG)" == "mod_proxy_ftp - Win32 Debug"

InputPath=..\..\build\win32\win32ver.awk

".\mod_proxy_ftp.rc" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	<<tempfile.bat 
	@echo off 
	awk -f ../../build/win32/win32ver.awk mod_proxy_ftp  "proxy_ftp_module for Apache" ../../include/ap_release.h > .\mod_proxy_ftp.rc
<< 
	

!ENDIF 


!ENDIF 

