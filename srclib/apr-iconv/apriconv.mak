# Microsoft Developer Studio Generated NMAKE File, Based on apriconv.dsp
!IF "$(CFG)" == ""
CFG=apriconv - Win32 Debug
!MESSAGE No configuration specified. Defaulting to apriconv - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "apriconv - Win32 Release" && "$(CFG)" != "apriconv - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "apriconv.mak" CFG="apriconv - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "apriconv - Win32 Release" (based on "Win32 (x86) Static Library")
!MESSAGE "apriconv - Win32 Debug" (based on "Win32 (x86) Static Library")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "apriconv - Win32 Release"

OUTDIR=.\LibR
INTDIR=.\LibR
# Begin Custom Macros
OutDir=.\LibR
# End Custom Macros

ALL : "$(OUTDIR)\apriconv.lib"


CLEAN :
	-@erase "$(INTDIR)\apriconv.idb"
	-@erase "$(INTDIR)\iconv.obj"
	-@erase "$(INTDIR)\iconv_ces.obj"
	-@erase "$(INTDIR)\iconv_ces_euc.obj"
	-@erase "$(INTDIR)\iconv_ces_iso2022.obj"
	-@erase "$(INTDIR)\iconv_int.obj"
	-@erase "$(INTDIR)\iconv_module.obj"
	-@erase "$(INTDIR)\iconv_uc.obj"
	-@erase "$(OUTDIR)\apriconv.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /O2 /I "../apr/include" /I "include" /D "NDEBUG" /D "APR_DECLARE_STATIC" /D "API_DECLARE_STATIC" /D "WIN32" /D "_WINDOWS" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\apriconv" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\apriconv.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\apriconv.lib" 
LIB32_OBJS= \
	"$(INTDIR)\iconv.obj" \
	"$(INTDIR)\iconv_ces.obj" \
	"$(INTDIR)\iconv_ces_euc.obj" \
	"$(INTDIR)\iconv_ces_iso2022.obj" \
	"$(INTDIR)\iconv_int.obj" \
	"$(INTDIR)\iconv_module.obj" \
	"$(INTDIR)\iconv_uc.obj"

"$(OUTDIR)\apriconv.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ELSEIF  "$(CFG)" == "apriconv - Win32 Debug"

OUTDIR=.\LibD
INTDIR=.\LibD
# Begin Custom Macros
OutDir=.\LibD
# End Custom Macros

ALL : "$(OUTDIR)\apriconv.lib"


CLEAN :
	-@erase "$(INTDIR)\apriconv.idb"
	-@erase "$(INTDIR)\apriconv.pdb"
	-@erase "$(INTDIR)\iconv.obj"
	-@erase "$(INTDIR)\iconv_ces.obj"
	-@erase "$(INTDIR)\iconv_ces_euc.obj"
	-@erase "$(INTDIR)\iconv_ces_iso2022.obj"
	-@erase "$(INTDIR)\iconv_int.obj"
	-@erase "$(INTDIR)\iconv_module.obj"
	-@erase "$(INTDIR)\iconv_uc.obj"
	-@erase "$(OUTDIR)\apriconv.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /GX /Zi /Od /I "../apr/include" /I "include" /D "_DEBUG" /D "APR_DECLARE_STATIC" /D "API_DECLARE_STATIC" /D "WIN32" /D "_WINDOWS" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\apriconv" /FD /c 

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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\apriconv.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\apriconv.lib" 
LIB32_OBJS= \
	"$(INTDIR)\iconv.obj" \
	"$(INTDIR)\iconv_ces.obj" \
	"$(INTDIR)\iconv_ces_euc.obj" \
	"$(INTDIR)\iconv_ces_iso2022.obj" \
	"$(INTDIR)\iconv_int.obj" \
	"$(INTDIR)\iconv_module.obj" \
	"$(INTDIR)\iconv_uc.obj"

"$(OUTDIR)\apriconv.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("apriconv.dep")
!INCLUDE "apriconv.dep"
!ELSE 
!MESSAGE Warning: cannot find "apriconv.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "apriconv - Win32 Release" || "$(CFG)" == "apriconv - Win32 Debug"
SOURCE=.\lib\iconv.c

"$(INTDIR)\iconv.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\lib\iconv_ces.c

"$(INTDIR)\iconv_ces.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\lib\iconv_ces_euc.c

"$(INTDIR)\iconv_ces_euc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\lib\iconv_ces_iso2022.c

"$(INTDIR)\iconv_ces_iso2022.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\lib\iconv_int.c

"$(INTDIR)\iconv_int.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\lib\iconv_module.c

"$(INTDIR)\iconv_module.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=.\lib\iconv_uc.c

"$(INTDIR)\iconv_uc.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)



!ENDIF 

