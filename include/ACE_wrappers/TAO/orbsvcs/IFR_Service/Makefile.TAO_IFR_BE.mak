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
!MESSAGE NMAKE /f "Makefile.TAO_IFR_BE.mak" CFG="Win64 Debug"
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
INTDIR=Debug\TAO_IFR_BE\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_IFR_BEd.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\TAO_IDL\fe" -I"..\..\TAO_IDL\include" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_IFR_BE_BUILD_DLL -f "Makefile.TAO_IFR_BE.dep" "be_global.cpp" "be_init.cpp" "be_produce.cpp" "be_util.cpp" "ifr_adding_visitor.cpp" "ifr_adding_visitor_exception.cpp" "ifr_adding_visitor_operation.cpp" "ifr_adding_visitor_structure.cpp" "ifr_adding_visitor_union.cpp" "ifr_removing_visitor.cpp" "ifr_visitor.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_IFR_BEd.pdb"
	-@del /f/q "..\..\..\lib\TAO_IFR_BEd.dll"
	-@del /f/q "$(OUTDIR)\TAO_IFR_BEd.lib"
	-@del /f/q "$(OUTDIR)\TAO_IFR_BEd.exp"
	-@del /f/q "$(OUTDIR)\TAO_IFR_BEd.ilk"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\TAO_IFR_BE\$(NULL)" mkdir "Debug\TAO_IFR_BE"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /I "..\..\TAO_IDL\fe" /I "..\..\TAO_IDL\include" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_IFR_BE_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_IFR_Clientd.lib TAO_IDL_FEd.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\..\lib\TAO_IFR_BEd.pdb" /machine:IA64 /out:"..\..\..\lib\TAO_IFR_BEd.dll" /implib:"$(OUTDIR)\TAO_IFR_BEd.lib"
LINK32_OBJS= \
	"$(INTDIR)\be_global.obj" \
	"$(INTDIR)\be_init.obj" \
	"$(INTDIR)\be_produce.obj" \
	"$(INTDIR)\be_util.obj" \
	"$(INTDIR)\ifr_adding_visitor.obj" \
	"$(INTDIR)\ifr_adding_visitor_exception.obj" \
	"$(INTDIR)\ifr_adding_visitor_operation.obj" \
	"$(INTDIR)\ifr_adding_visitor_structure.obj" \
	"$(INTDIR)\ifr_adding_visitor_union.obj" \
	"$(INTDIR)\ifr_removing_visitor.obj" \
	"$(INTDIR)\ifr_visitor.obj"

"..\..\..\lib\TAO_IFR_BEd.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_IFR_BEd.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_IFR_BEd.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\TAO_IFR_BE\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_IFR_BE.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\TAO_IDL\fe" -I"..\..\TAO_IDL\include" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_IFR_BE_BUILD_DLL -f "Makefile.TAO_IFR_BE.dep" "be_global.cpp" "be_init.cpp" "be_produce.cpp" "be_util.cpp" "ifr_adding_visitor.cpp" "ifr_adding_visitor_exception.cpp" "ifr_adding_visitor_operation.cpp" "ifr_adding_visitor_structure.cpp" "ifr_adding_visitor_union.cpp" "ifr_removing_visitor.cpp" "ifr_visitor.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\TAO_IFR_BE.dll"
	-@del /f/q "$(OUTDIR)\TAO_IFR_BE.lib"
	-@del /f/q "$(OUTDIR)\TAO_IFR_BE.exp"
	-@del /f/q "$(OUTDIR)\TAO_IFR_BE.ilk"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\TAO_IFR_BE\$(NULL)" mkdir "Release\TAO_IFR_BE"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\TAO_IDL\fe" /I "..\..\TAO_IDL\include" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_IFR_BE_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_IFR_Client.lib TAO_IDL_FE.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\..\lib\TAO_IFR_BE.dll" /implib:"$(OUTDIR)\TAO_IFR_BE.lib"
LINK32_OBJS= \
	"$(INTDIR)\be_global.obj" \
	"$(INTDIR)\be_init.obj" \
	"$(INTDIR)\be_produce.obj" \
	"$(INTDIR)\be_util.obj" \
	"$(INTDIR)\ifr_adding_visitor.obj" \
	"$(INTDIR)\ifr_adding_visitor_exception.obj" \
	"$(INTDIR)\ifr_adding_visitor_operation.obj" \
	"$(INTDIR)\ifr_adding_visitor_structure.obj" \
	"$(INTDIR)\ifr_adding_visitor_union.obj" \
	"$(INTDIR)\ifr_removing_visitor.obj" \
	"$(INTDIR)\ifr_visitor.obj"

"..\..\..\lib\TAO_IFR_BE.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_IFR_BE.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_IFR_BE.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\TAO_IFR_BE\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_IFR_BEsd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\TAO_IDL\fe" -I"..\..\TAO_IDL\include" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.TAO_IFR_BE.dep" "be_global.cpp" "be_init.cpp" "be_produce.cpp" "be_util.cpp" "ifr_adding_visitor.cpp" "ifr_adding_visitor_exception.cpp" "ifr_adding_visitor_operation.cpp" "ifr_adding_visitor_structure.cpp" "ifr_adding_visitor_union.cpp" "ifr_removing_visitor.cpp" "ifr_visitor.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_IFR_BEsd.lib"
	-@del /f/q "$(OUTDIR)\TAO_IFR_BEsd.exp"
	-@del /f/q "$(OUTDIR)\TAO_IFR_BEsd.ilk"
	-@del /f/q "..\..\..\lib\TAO_IFR_BEsd.pdb"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\TAO_IFR_BE\$(NULL)" mkdir "Static_Debug\TAO_IFR_BE"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\TAO_IFR_BEsd.pdb" /I "..\..\.." /I "..\.." /I "..\..\TAO_IDL\fe" /I "..\..\TAO_IDL\include" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_IFR_BEsd.lib"
LINK32_OBJS= \
	"$(INTDIR)\be_global.obj" \
	"$(INTDIR)\be_init.obj" \
	"$(INTDIR)\be_produce.obj" \
	"$(INTDIR)\be_util.obj" \
	"$(INTDIR)\ifr_adding_visitor.obj" \
	"$(INTDIR)\ifr_adding_visitor_exception.obj" \
	"$(INTDIR)\ifr_adding_visitor_operation.obj" \
	"$(INTDIR)\ifr_adding_visitor_structure.obj" \
	"$(INTDIR)\ifr_adding_visitor_union.obj" \
	"$(INTDIR)\ifr_removing_visitor.obj" \
	"$(INTDIR)\ifr_visitor.obj"

"$(OUTDIR)\TAO_IFR_BEsd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_IFR_BEsd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_IFR_BEsd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\TAO_IFR_BE\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_IFR_BEs.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\TAO_IDL\fe" -I"..\..\TAO_IDL\include" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.TAO_IFR_BE.dep" "be_global.cpp" "be_init.cpp" "be_produce.cpp" "be_util.cpp" "ifr_adding_visitor.cpp" "ifr_adding_visitor_exception.cpp" "ifr_adding_visitor_operation.cpp" "ifr_adding_visitor_structure.cpp" "ifr_adding_visitor_union.cpp" "ifr_removing_visitor.cpp" "ifr_visitor.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_IFR_BEs.lib"
	-@del /f/q "$(OUTDIR)\TAO_IFR_BEs.exp"
	-@del /f/q "$(OUTDIR)\TAO_IFR_BEs.ilk"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\TAO_IFR_BE\$(NULL)" mkdir "Static_Release\TAO_IFR_BE"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\TAO_IDL\fe" /I "..\..\TAO_IDL\include" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_IFR_BEs.lib"
LINK32_OBJS= \
	"$(INTDIR)\be_global.obj" \
	"$(INTDIR)\be_init.obj" \
	"$(INTDIR)\be_produce.obj" \
	"$(INTDIR)\be_util.obj" \
	"$(INTDIR)\ifr_adding_visitor.obj" \
	"$(INTDIR)\ifr_adding_visitor_exception.obj" \
	"$(INTDIR)\ifr_adding_visitor_operation.obj" \
	"$(INTDIR)\ifr_adding_visitor_structure.obj" \
	"$(INTDIR)\ifr_adding_visitor_union.obj" \
	"$(INTDIR)\ifr_removing_visitor.obj" \
	"$(INTDIR)\ifr_visitor.obj"

"$(OUTDIR)\TAO_IFR_BEs.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_IFR_BEs.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_IFR_BEs.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.TAO_IFR_BE.dep")
!INCLUDE "Makefile.TAO_IFR_BE.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="be_global.cpp"

"$(INTDIR)\be_global.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\be_global.obj" $(SOURCE)

SOURCE="be_init.cpp"

"$(INTDIR)\be_init.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\be_init.obj" $(SOURCE)

SOURCE="be_produce.cpp"

"$(INTDIR)\be_produce.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\be_produce.obj" $(SOURCE)

SOURCE="be_util.cpp"

"$(INTDIR)\be_util.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\be_util.obj" $(SOURCE)

SOURCE="ifr_adding_visitor.cpp"

"$(INTDIR)\ifr_adding_visitor.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ifr_adding_visitor.obj" $(SOURCE)

SOURCE="ifr_adding_visitor_exception.cpp"

"$(INTDIR)\ifr_adding_visitor_exception.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ifr_adding_visitor_exception.obj" $(SOURCE)

SOURCE="ifr_adding_visitor_operation.cpp"

"$(INTDIR)\ifr_adding_visitor_operation.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ifr_adding_visitor_operation.obj" $(SOURCE)

SOURCE="ifr_adding_visitor_structure.cpp"

"$(INTDIR)\ifr_adding_visitor_structure.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ifr_adding_visitor_structure.obj" $(SOURCE)

SOURCE="ifr_adding_visitor_union.cpp"

"$(INTDIR)\ifr_adding_visitor_union.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ifr_adding_visitor_union.obj" $(SOURCE)

SOURCE="ifr_removing_visitor.cpp"

"$(INTDIR)\ifr_removing_visitor.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ifr_removing_visitor.obj" $(SOURCE)

SOURCE="ifr_visitor.cpp"

"$(INTDIR)\ifr_visitor.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ifr_visitor.obj" $(SOURCE)

!IF  "$(CFG)" == "Win64 Debug"
!ELSEIF  "$(CFG)" == "Win64 Release"
!ELSEIF  "$(CFG)" == "Win64 Static Debug"
!ELSEIF  "$(CFG)" == "Win64 Static Release"
!ENDIF


!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.TAO_IFR_BE.dep")
	@echo Using "Makefile.TAO_IFR_BE.dep"
!ELSE
	@echo Warning: cannot find "Makefile.TAO_IFR_BE.dep"
!ENDIF
!ENDIF

