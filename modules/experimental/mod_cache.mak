# Microsoft Developer Studio Generated NMAKE File, Based on mod_cache.dsp
!IF "$(CFG)" == ""
CFG=mod_cache - Win32 Debug
!MESSAGE No configuration specified. Defaulting to mod_cache - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "mod_cache - Win32 Release" && "$(CFG)" != "mod_cache - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "mod_cache.mak" CFG="mod_cache - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "mod_cache - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "mod_cache - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "mod_cache - Win32 Release"

OUTDIR=.\Release
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\Release
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\mod_cache.so"

!ELSE 

ALL : "libhttpd - Win32 Release" "libaprutil - Win32 Release" "libapr - Win32 Release" "$(OUTDIR)\mod_cache.so"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"libapr - Win32 ReleaseCLEAN" "libaprutil - Win32 ReleaseCLEAN" "libhttpd - Win32 ReleaseCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\cache_cache.obj"
	-@erase "$(INTDIR)\cache_hash.obj"
	-@erase "$(INTDIR)\cache_pqueue.obj"
	-@erase "$(INTDIR)\cache_storage.obj"
	-@erase "$(INTDIR)\cache_util.obj"
	-@erase "$(INTDIR)\mod_cache.idb"
	-@erase "$(INTDIR)\mod_cache.obj"
	-@erase "$(OUTDIR)\mod_cache.exp"
	-@erase "$(OUTDIR)\mod_cache.lib"
	-@erase "$(OUTDIR)\mod_cache.map"
	-@erase "$(OUTDIR)\mod_cache.so"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /O2 /I "../../srclib/apr-util/include" /I "../../srclib/apr/include" /I "../../include" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "CACHE_DECLARE_EXPORT" /D "MOD_CACHE_EXPORTS" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\mod_cache" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\mod_cache.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib /nologo /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\mod_cache.pdb" /map:"$(INTDIR)\mod_cache.map" /machine:I386 /out:"$(OUTDIR)\mod_cache.so" /implib:"$(OUTDIR)\mod_cache.lib" /base:@..\..\os\win32\BaseAddr.ref,mod_cache 
LINK32_OBJS= \
	"$(INTDIR)\cache_cache.obj" \
	"$(INTDIR)\cache_hash.obj" \
	"$(INTDIR)\cache_pqueue.obj" \
	"$(INTDIR)\cache_storage.obj" \
	"$(INTDIR)\cache_util.obj" \
	"$(INTDIR)\mod_cache.obj" \
	"..\..\srclib\apr\Release\libapr.lib" \
	"..\..\srclib\apr-util\Release\libaprutil.lib" \
	"..\..\Release\libhttpd.lib"

"$(OUTDIR)\mod_cache.so" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "mod_cache - Win32 Debug"

OUTDIR=.\Debug
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\Debug
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\mod_cache.so"

!ELSE 

ALL : "libhttpd - Win32 Debug" "libaprutil - Win32 Debug" "libapr - Win32 Debug" "$(OUTDIR)\mod_cache.so"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"libapr - Win32 DebugCLEAN" "libaprutil - Win32 DebugCLEAN" "libhttpd - Win32 DebugCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\cache_cache.obj"
	-@erase "$(INTDIR)\cache_hash.obj"
	-@erase "$(INTDIR)\cache_pqueue.obj"
	-@erase "$(INTDIR)\cache_storage.obj"
	-@erase "$(INTDIR)\cache_util.obj"
	-@erase "$(INTDIR)\mod_cache.idb"
	-@erase "$(INTDIR)\mod_cache.obj"
	-@erase "$(OUTDIR)\mod_cache.exp"
	-@erase "$(OUTDIR)\mod_cache.lib"
	-@erase "$(OUTDIR)\mod_cache.map"
	-@erase "$(OUTDIR)\mod_cache.pdb"
	-@erase "$(OUTDIR)\mod_cache.so"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /Zi /Od /I "../../srclib/apr-util/include" /I "../../srclib/apr/include" /I "../../include" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "CACHE_DECLARE_EXPORT" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\mod_cache" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\mod_cache.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib /nologo /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\mod_cache.pdb" /map:"$(INTDIR)\mod_cache.map" /debug /machine:I386 /out:"$(OUTDIR)\mod_cache.so" /implib:"$(OUTDIR)\mod_cache.lib" /base:@..\..\os\win32\BaseAddr.ref,mod_cache 
LINK32_OBJS= \
	"$(INTDIR)\cache_cache.obj" \
	"$(INTDIR)\cache_hash.obj" \
	"$(INTDIR)\cache_pqueue.obj" \
	"$(INTDIR)\cache_storage.obj" \
	"$(INTDIR)\cache_util.obj" \
	"$(INTDIR)\mod_cache.obj" \
	"..\..\srclib\apr\Debug\libapr.lib" \
	"..\..\srclib\apr-util\Debug\libaprutil.lib" \
	"..\..\Debug\libhttpd.lib"

"$(OUTDIR)\mod_cache.so" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("mod_cache.dep")
!INCLUDE "mod_cache.dep"
!ELSE 
!MESSAGE Warning: cannot find "mod_cache.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "mod_cache - Win32 Release" || "$(CFG)" == "mod_cache - Win32 Debug"
SOURCE=.\cache_cache.c

"$(INTDIR)\cache_cache.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\cache_hash.c

"$(INTDIR)\cache_hash.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\cache_pqueue.c

"$(INTDIR)\cache_pqueue.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\cache_storage.c

"$(INTDIR)\cache_storage.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\cache_util.c

"$(INTDIR)\cache_util.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\mod_cache.c

"$(INTDIR)\mod_cache.obj" : $(SOURCE) "$(INTDIR)"


!IF  "$(CFG)" == "mod_cache - Win32 Release"

"libapr - Win32 Release" : 
   cd ".\..\..\srclib\apr"
   $(MAKE) /$(MAKEFLAGS) /F ".\libapr.mak" CFG="libapr - Win32 Release" 
   cd "..\..\modules\experimental"

"libapr - Win32 ReleaseCLEAN" : 
   cd ".\..\..\srclib\apr"
   $(MAKE) /$(MAKEFLAGS) /F ".\libapr.mak" CFG="libapr - Win32 Release" RECURSE=1 CLEAN 
   cd "..\..\modules\experimental"

!ELSEIF  "$(CFG)" == "mod_cache - Win32 Debug"

"libapr - Win32 Debug" : 
   cd ".\..\..\srclib\apr"
   $(MAKE) /$(MAKEFLAGS) /F ".\libapr.mak" CFG="libapr - Win32 Debug" 
   cd "..\..\modules\experimental"

"libapr - Win32 DebugCLEAN" : 
   cd ".\..\..\srclib\apr"
   $(MAKE) /$(MAKEFLAGS) /F ".\libapr.mak" CFG="libapr - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\..\modules\experimental"

!ENDIF 

!IF  "$(CFG)" == "mod_cache - Win32 Release"

"libaprutil - Win32 Release" : 
   cd ".\..\..\srclib\apr-util"
   $(MAKE) /$(MAKEFLAGS) /F ".\libaprutil.mak" CFG="libaprutil - Win32 Release" 
   cd "..\..\modules\experimental"

"libaprutil - Win32 ReleaseCLEAN" : 
   cd ".\..\..\srclib\apr-util"
   $(MAKE) /$(MAKEFLAGS) /F ".\libaprutil.mak" CFG="libaprutil - Win32 Release" RECURSE=1 CLEAN 
   cd "..\..\modules\experimental"

!ELSEIF  "$(CFG)" == "mod_cache - Win32 Debug"

"libaprutil - Win32 Debug" : 
   cd ".\..\..\srclib\apr-util"
   $(MAKE) /$(MAKEFLAGS) /F ".\libaprutil.mak" CFG="libaprutil - Win32 Debug" 
   cd "..\..\modules\experimental"

"libaprutil - Win32 DebugCLEAN" : 
   cd ".\..\..\srclib\apr-util"
   $(MAKE) /$(MAKEFLAGS) /F ".\libaprutil.mak" CFG="libaprutil - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\..\modules\experimental"

!ENDIF 

!IF  "$(CFG)" == "mod_cache - Win32 Release"

"libhttpd - Win32 Release" : 
   cd ".\..\.."
   $(MAKE) /$(MAKEFLAGS) /F ".\libhttpd.mak" CFG="libhttpd - Win32 Release" 
   cd ".\modules\experimental"

"libhttpd - Win32 ReleaseCLEAN" : 
   cd ".\..\.."
   $(MAKE) /$(MAKEFLAGS) /F ".\libhttpd.mak" CFG="libhttpd - Win32 Release" RECURSE=1 CLEAN 
   cd ".\modules\experimental"

!ELSEIF  "$(CFG)" == "mod_cache - Win32 Debug"

"libhttpd - Win32 Debug" : 
   cd ".\..\.."
   $(MAKE) /$(MAKEFLAGS) /F ".\libhttpd.mak" CFG="libhttpd - Win32 Debug" 
   cd ".\modules\experimental"

"libhttpd - Win32 DebugCLEAN" : 
   cd ".\..\.."
   $(MAKE) /$(MAKEFLAGS) /F ".\libhttpd.mak" CFG="libhttpd - Win32 Debug" RECURSE=1 CLEAN 
   cd ".\modules\experimental"

!ENDIF 


!ENDIF 

