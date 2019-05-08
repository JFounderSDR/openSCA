# Microsoft Developer Studio Generated NMAKE File
!IF "$(CFG)" == ""
CFG=Win64 Debug
!MESSAGE No configuration specified. Defaulting to Win64 Debug.
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release"
!ELSE
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE
!MESSAGE NMAKE /f "Makefile.DynamicAny.mak" CFG="Win64 Debug"
!MESSAGE
!MESSAGE Possible choices for configuration are:
!MESSAGE
!MESSAGE "Win64 Debug" (based on "Win64 (IA64) Dynamic-Link Library")
!MESSAGE "Win64 Release" (based on "Win64 (IA64) Dynamic-Link Library")
!MESSAGE "Win64 Static Debug" (based on "Win64 (IA64) Static Library")
!MESSAGE "Win64 Static Release" (based on "Win64 (IA64) Static Library")
!MESSAGE
!ERROR An invalid configuration was specified.
!ENDIF

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE
NULL=nul
!ENDIF

!IF "$(DEPGEN)" == ""
!IF EXISTS("$(MPC_ROOT)/depgen.pl")
DEPGEN=perl $(MPC_ROOT)/depgen.pl -i -t nmake
!ELSEIF EXISTS("$(DEPGEN_ROOT)/depgen.pl")
DEPGEN=perl $(DEPGEN_ROOT)/depgen.pl -i -t nmake
!ELSEIF EXISTS("$(ACE_ROOT)/bin/depgen.pl")
DEPGEN=perl $(ACE_ROOT)/bin/depgen.pl -i -t nmake
!ENDIF
!ENDIF

GENERATED_DIRTY =

!IF  "$(CFG)" == "Win64 Debug"

OUTDIR=..\..\..\lib
INTDIR=Debug\DynamicAny\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_DynamicAnyd.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_DYNAMICANY_BUILD_DLL -f "Makefile.DynamicAny.dep" "DynamicAny.cpp" "DynamicAnyC.cpp" "DynAny_i.cpp" "DynArray_i.cpp" "DynCommon.cpp" "DynEnum_i.cpp" "DynSequence_i.cpp" "DynStruct_i.cpp" "DynUnion_i.cpp" "DynValue_i.cpp" "DynValueBox_i.cpp" "DynValueCommon_i.cpp" "DynAnyFactory.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_DynamicAnyd.pdb"
	-@del /f/q "..\..\..\lib\TAO_DynamicAnyd.dll"
	-@del /f/q "$(OUTDIR)\TAO_DynamicAnyd.lib"
	-@del /f/q "$(OUTDIR)\TAO_DynamicAnyd.exp"
	-@del /f/q "$(OUTDIR)\TAO_DynamicAnyd.ilk"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\DynamicAny\$(NULL)" mkdir "Debug\DynamicAny"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_DYNAMICANY_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_Valuetyped.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\..\lib\TAO_DynamicAnyd.pdb" /machine:IA64 /out:"..\..\..\lib\TAO_DynamicAnyd.dll" /implib:"$(OUTDIR)\TAO_DynamicAnyd.lib"
LINK32_OBJS= \
	"$(INTDIR)\TAO_DynamicAny.res" \
	"$(INTDIR)\DynamicAny.obj" \
	"$(INTDIR)\DynamicAnyC.obj" \
	"$(INTDIR)\DynAny_i.obj" \
	"$(INTDIR)\DynArray_i.obj" \
	"$(INTDIR)\DynCommon.obj" \
	"$(INTDIR)\DynEnum_i.obj" \
	"$(INTDIR)\DynSequence_i.obj" \
	"$(INTDIR)\DynStruct_i.obj" \
	"$(INTDIR)\DynUnion_i.obj" \
	"$(INTDIR)\DynValue_i.obj" \
	"$(INTDIR)\DynValueBox_i.obj" \
	"$(INTDIR)\DynValueCommon_i.obj" \
	"$(INTDIR)\DynAnyFactory.obj"

"..\..\..\lib\TAO_DynamicAnyd.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_DynamicAnyd.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_DynamicAnyd.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\DynamicAny\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_DynamicAny.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_DYNAMICANY_BUILD_DLL -f "Makefile.DynamicAny.dep" "DynamicAny.cpp" "DynamicAnyC.cpp" "DynAny_i.cpp" "DynArray_i.cpp" "DynCommon.cpp" "DynEnum_i.cpp" "DynSequence_i.cpp" "DynStruct_i.cpp" "DynUnion_i.cpp" "DynValue_i.cpp" "DynValueBox_i.cpp" "DynValueCommon_i.cpp" "DynAnyFactory.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\TAO_DynamicAny.dll"
	-@del /f/q "$(OUTDIR)\TAO_DynamicAny.lib"
	-@del /f/q "$(OUTDIR)\TAO_DynamicAny.exp"
	-@del /f/q "$(OUTDIR)\TAO_DynamicAny.ilk"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\DynamicAny\$(NULL)" mkdir "Release\DynamicAny"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_DYNAMICANY_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_Valuetype.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\..\lib\TAO_DynamicAny.dll" /implib:"$(OUTDIR)\TAO_DynamicAny.lib"
LINK32_OBJS= \
	"$(INTDIR)\TAO_DynamicAny.res" \
	"$(INTDIR)\DynamicAny.obj" \
	"$(INTDIR)\DynamicAnyC.obj" \
	"$(INTDIR)\DynAny_i.obj" \
	"$(INTDIR)\DynArray_i.obj" \
	"$(INTDIR)\DynCommon.obj" \
	"$(INTDIR)\DynEnum_i.obj" \
	"$(INTDIR)\DynSequence_i.obj" \
	"$(INTDIR)\DynStruct_i.obj" \
	"$(INTDIR)\DynUnion_i.obj" \
	"$(INTDIR)\DynValue_i.obj" \
	"$(INTDIR)\DynValueBox_i.obj" \
	"$(INTDIR)\DynValueCommon_i.obj" \
	"$(INTDIR)\DynAnyFactory.obj"

"..\..\..\lib\TAO_DynamicAny.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_DynamicAny.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_DynamicAny.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\DynamicAny\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_DynamicAnysd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.DynamicAny.dep" "DynamicAny.cpp" "DynamicAnyC.cpp" "DynAny_i.cpp" "DynArray_i.cpp" "DynCommon.cpp" "DynEnum_i.cpp" "DynSequence_i.cpp" "DynStruct_i.cpp" "DynUnion_i.cpp" "DynValue_i.cpp" "DynValueBox_i.cpp" "DynValueCommon_i.cpp" "DynAnyFactory.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_DynamicAnysd.lib"
	-@del /f/q "$(OUTDIR)\TAO_DynamicAnysd.exp"
	-@del /f/q "$(OUTDIR)\TAO_DynamicAnysd.ilk"
	-@del /f/q "..\..\..\lib\TAO_DynamicAnysd.pdb"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\DynamicAny\$(NULL)" mkdir "Static_Debug\DynamicAny"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\TAO_DynamicAnysd.pdb" /I "..\..\.." /I "..\.." /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_DynamicAnysd.lib"
LINK32_OBJS= \
	"$(INTDIR)\DynamicAny.obj" \
	"$(INTDIR)\DynamicAnyC.obj" \
	"$(INTDIR)\DynAny_i.obj" \
	"$(INTDIR)\DynArray_i.obj" \
	"$(INTDIR)\DynCommon.obj" \
	"$(INTDIR)\DynEnum_i.obj" \
	"$(INTDIR)\DynSequence_i.obj" \
	"$(INTDIR)\DynStruct_i.obj" \
	"$(INTDIR)\DynUnion_i.obj" \
	"$(INTDIR)\DynValue_i.obj" \
	"$(INTDIR)\DynValueBox_i.obj" \
	"$(INTDIR)\DynValueCommon_i.obj" \
	"$(INTDIR)\DynAnyFactory.obj"

"$(OUTDIR)\TAO_DynamicAnysd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_DynamicAnysd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_DynamicAnysd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\DynamicAny\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_DynamicAnys.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.DynamicAny.dep" "DynamicAny.cpp" "DynamicAnyC.cpp" "DynAny_i.cpp" "DynArray_i.cpp" "DynCommon.cpp" "DynEnum_i.cpp" "DynSequence_i.cpp" "DynStruct_i.cpp" "DynUnion_i.cpp" "DynValue_i.cpp" "DynValueBox_i.cpp" "DynValueCommon_i.cpp" "DynAnyFactory.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_DynamicAnys.lib"
	-@del /f/q "$(OUTDIR)\TAO_DynamicAnys.exp"
	-@del /f/q "$(OUTDIR)\TAO_DynamicAnys.ilk"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\DynamicAny\$(NULL)" mkdir "Static_Release\DynamicAny"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_DynamicAnys.lib"
LINK32_OBJS= \
	"$(INTDIR)\DynamicAny.obj" \
	"$(INTDIR)\DynamicAnyC.obj" \
	"$(INTDIR)\DynAny_i.obj" \
	"$(INTDIR)\DynArray_i.obj" \
	"$(INTDIR)\DynCommon.obj" \
	"$(INTDIR)\DynEnum_i.obj" \
	"$(INTDIR)\DynSequence_i.obj" \
	"$(INTDIR)\DynStruct_i.obj" \
	"$(INTDIR)\DynUnion_i.obj" \
	"$(INTDIR)\DynValue_i.obj" \
	"$(INTDIR)\DynValueBox_i.obj" \
	"$(INTDIR)\DynValueCommon_i.obj" \
	"$(INTDIR)\DynAnyFactory.obj"

"$(OUTDIR)\TAO_DynamicAnys.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_DynamicAnys.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_DynamicAnys.lib.manifest" -outputresource:$@;2

!ENDIF

CLEAN :
	-@del /f/s/q "$(INTDIR)"

"$(OUTDIR)" :
	if not exist "$(OUTDIR)\$(NULL)" mkdir "$(OUTDIR)"

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

!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.DynamicAny.dep")
!INCLUDE "Makefile.DynamicAny.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="DynamicAny.cpp"

"$(INTDIR)\DynamicAny.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\DynamicAny.obj" $(SOURCE)

SOURCE="DynamicAnyC.cpp"

"$(INTDIR)\DynamicAnyC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\DynamicAnyC.obj" $(SOURCE)

SOURCE="DynAny_i.cpp"

"$(INTDIR)\DynAny_i.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\DynAny_i.obj" $(SOURCE)

SOURCE="DynArray_i.cpp"

"$(INTDIR)\DynArray_i.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\DynArray_i.obj" $(SOURCE)

SOURCE="DynCommon.cpp"

"$(INTDIR)\DynCommon.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\DynCommon.obj" $(SOURCE)

SOURCE="DynEnum_i.cpp"

"$(INTDIR)\DynEnum_i.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\DynEnum_i.obj" $(SOURCE)

SOURCE="DynSequence_i.cpp"

"$(INTDIR)\DynSequence_i.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\DynSequence_i.obj" $(SOURCE)

SOURCE="DynStruct_i.cpp"

"$(INTDIR)\DynStruct_i.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\DynStruct_i.obj" $(SOURCE)

SOURCE="DynUnion_i.cpp"

"$(INTDIR)\DynUnion_i.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\DynUnion_i.obj" $(SOURCE)

SOURCE="DynValue_i.cpp"

"$(INTDIR)\DynValue_i.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\DynValue_i.obj" $(SOURCE)

SOURCE="DynValueBox_i.cpp"

"$(INTDIR)\DynValueBox_i.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\DynValueBox_i.obj" $(SOURCE)

SOURCE="DynValueCommon_i.cpp"

"$(INTDIR)\DynValueCommon_i.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\DynValueCommon_i.obj" $(SOURCE)

SOURCE="DynAnyFactory.cpp"

"$(INTDIR)\DynAnyFactory.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\DynAnyFactory.obj" $(SOURCE)

!IF  "$(CFG)" == "Win64 Debug"
!ELSEIF  "$(CFG)" == "Win64 Release"
!ELSEIF  "$(CFG)" == "Win64 Static Debug"
!ELSEIF  "$(CFG)" == "Win64 Static Release"
!ENDIF

SOURCE="TAO_DynamicAny.rc"

"$(INTDIR)\TAO_DynamicAny.res" : $(SOURCE)
	$(RSC) /l 0x409 /fo"$(INTDIR)\TAO_DynamicAny.res" /d NDEBUG /d WIN64 /d _CRT_SECURE_NO_WARNINGS /d _CRT_SECURE_NO_DEPRECATE /d _CRT_NONSTDC_NO_DEPRECATE /i "..\..\.." /i "..\.." $(SOURCE)



!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.DynamicAny.dep")
	@echo Using "Makefile.DynamicAny.dep"
!ELSE
	@echo Warning: cannot find "Makefile.DynamicAny.dep"
!ENDIF
!ENDIF

