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
!MESSAGE NMAKE /f "Makefile.Valuetype.mak" CFG="Win64 Debug"
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
INTDIR=Debug\Valuetype\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_Valuetyped.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_VALUETYPE_OUT_INDIRECTION -DTAO_VALUETYPE_BUILD_DLL -f "Makefile.Valuetype.dep" "AbstractBase.cpp" "AbstractBase_Invocation_Adapter.cpp" "ValueBase.cpp" "ValueFactory.cpp" "ValueFactory_Map.cpp" "Valuetype_Adapter_Factory_Impl.cpp" "Valuetype_Adapter_Impl.cpp" "StringValueC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_Valuetyped.pdb"
	-@del /f/q "..\..\..\lib\TAO_Valuetyped.dll"
	-@del /f/q "$(OUTDIR)\TAO_Valuetyped.lib"
	-@del /f/q "$(OUTDIR)\TAO_Valuetyped.exp"
	-@del /f/q "$(OUTDIR)\TAO_Valuetyped.ilk"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\Valuetype\$(NULL)" mkdir "Debug\Valuetype"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_VALUETYPE_OUT_INDIRECTION /D TAO_VALUETYPE_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\..\lib\TAO_Valuetyped.pdb" /machine:IA64 /out:"..\..\..\lib\TAO_Valuetyped.dll" /implib:"$(OUTDIR)\TAO_Valuetyped.lib"
LINK32_OBJS= \
	"$(INTDIR)\TAO_Valuetype.res" \
	"$(INTDIR)\AbstractBase.obj" \
	"$(INTDIR)\AbstractBase_Invocation_Adapter.obj" \
	"$(INTDIR)\ValueBase.obj" \
	"$(INTDIR)\ValueFactory.obj" \
	"$(INTDIR)\ValueFactory_Map.obj" \
	"$(INTDIR)\Valuetype_Adapter_Factory_Impl.obj" \
	"$(INTDIR)\Valuetype_Adapter_Impl.obj" \
	"$(INTDIR)\StringValueC.obj"

"..\..\..\lib\TAO_Valuetyped.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_Valuetyped.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_Valuetyped.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\Valuetype\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_Valuetype.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_VALUETYPE_OUT_INDIRECTION -DTAO_VALUETYPE_BUILD_DLL -f "Makefile.Valuetype.dep" "AbstractBase.cpp" "AbstractBase_Invocation_Adapter.cpp" "ValueBase.cpp" "ValueFactory.cpp" "ValueFactory_Map.cpp" "Valuetype_Adapter_Factory_Impl.cpp" "Valuetype_Adapter_Impl.cpp" "StringValueC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\TAO_Valuetype.dll"
	-@del /f/q "$(OUTDIR)\TAO_Valuetype.lib"
	-@del /f/q "$(OUTDIR)\TAO_Valuetype.exp"
	-@del /f/q "$(OUTDIR)\TAO_Valuetype.ilk"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\Valuetype\$(NULL)" mkdir "Release\Valuetype"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_VALUETYPE_OUT_INDIRECTION /D TAO_VALUETYPE_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\..\lib\TAO_Valuetype.dll" /implib:"$(OUTDIR)\TAO_Valuetype.lib"
LINK32_OBJS= \
	"$(INTDIR)\TAO_Valuetype.res" \
	"$(INTDIR)\AbstractBase.obj" \
	"$(INTDIR)\AbstractBase_Invocation_Adapter.obj" \
	"$(INTDIR)\ValueBase.obj" \
	"$(INTDIR)\ValueFactory.obj" \
	"$(INTDIR)\ValueFactory_Map.obj" \
	"$(INTDIR)\Valuetype_Adapter_Factory_Impl.obj" \
	"$(INTDIR)\Valuetype_Adapter_Impl.obj" \
	"$(INTDIR)\StringValueC.obj"

"..\..\..\lib\TAO_Valuetype.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_Valuetype.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_Valuetype.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\Valuetype\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_Valuetypesd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_VALUETYPE_OUT_INDIRECTION -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.Valuetype.dep" "AbstractBase.cpp" "AbstractBase_Invocation_Adapter.cpp" "ValueBase.cpp" "ValueFactory.cpp" "ValueFactory_Map.cpp" "Valuetype_Adapter_Factory_Impl.cpp" "Valuetype_Adapter_Impl.cpp" "StringValueC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_Valuetypesd.lib"
	-@del /f/q "$(OUTDIR)\TAO_Valuetypesd.exp"
	-@del /f/q "$(OUTDIR)\TAO_Valuetypesd.ilk"
	-@del /f/q "..\..\..\lib\TAO_Valuetypesd.pdb"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\Valuetype\$(NULL)" mkdir "Static_Debug\Valuetype"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\TAO_Valuetypesd.pdb" /I "..\..\.." /I "..\.." /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_VALUETYPE_OUT_INDIRECTION /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_Valuetypesd.lib"
LINK32_OBJS= \
	"$(INTDIR)\AbstractBase.obj" \
	"$(INTDIR)\AbstractBase_Invocation_Adapter.obj" \
	"$(INTDIR)\ValueBase.obj" \
	"$(INTDIR)\ValueFactory.obj" \
	"$(INTDIR)\ValueFactory_Map.obj" \
	"$(INTDIR)\Valuetype_Adapter_Factory_Impl.obj" \
	"$(INTDIR)\Valuetype_Adapter_Impl.obj" \
	"$(INTDIR)\StringValueC.obj"

"$(OUTDIR)\TAO_Valuetypesd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_Valuetypesd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_Valuetypesd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\Valuetype\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_Valuetypes.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_VALUETYPE_OUT_INDIRECTION -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.Valuetype.dep" "AbstractBase.cpp" "AbstractBase_Invocation_Adapter.cpp" "ValueBase.cpp" "ValueFactory.cpp" "ValueFactory_Map.cpp" "Valuetype_Adapter_Factory_Impl.cpp" "Valuetype_Adapter_Impl.cpp" "StringValueC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_Valuetypes.lib"
	-@del /f/q "$(OUTDIR)\TAO_Valuetypes.exp"
	-@del /f/q "$(OUTDIR)\TAO_Valuetypes.ilk"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\Valuetype\$(NULL)" mkdir "Static_Release\Valuetype"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_VALUETYPE_OUT_INDIRECTION /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_Valuetypes.lib"
LINK32_OBJS= \
	"$(INTDIR)\AbstractBase.obj" \
	"$(INTDIR)\AbstractBase_Invocation_Adapter.obj" \
	"$(INTDIR)\ValueBase.obj" \
	"$(INTDIR)\ValueFactory.obj" \
	"$(INTDIR)\ValueFactory_Map.obj" \
	"$(INTDIR)\Valuetype_Adapter_Factory_Impl.obj" \
	"$(INTDIR)\Valuetype_Adapter_Impl.obj" \
	"$(INTDIR)\StringValueC.obj"

"$(OUTDIR)\TAO_Valuetypes.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_Valuetypes.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_Valuetypes.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.Valuetype.dep")
!INCLUDE "Makefile.Valuetype.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="AbstractBase.cpp"

"$(INTDIR)\AbstractBase.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\AbstractBase.obj" $(SOURCE)

SOURCE="AbstractBase_Invocation_Adapter.cpp"

"$(INTDIR)\AbstractBase_Invocation_Adapter.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\AbstractBase_Invocation_Adapter.obj" $(SOURCE)

SOURCE="ValueBase.cpp"

"$(INTDIR)\ValueBase.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ValueBase.obj" $(SOURCE)

SOURCE="ValueFactory.cpp"

"$(INTDIR)\ValueFactory.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ValueFactory.obj" $(SOURCE)

SOURCE="ValueFactory_Map.cpp"

"$(INTDIR)\ValueFactory_Map.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ValueFactory_Map.obj" $(SOURCE)

SOURCE="Valuetype_Adapter_Factory_Impl.cpp"

"$(INTDIR)\Valuetype_Adapter_Factory_Impl.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Valuetype_Adapter_Factory_Impl.obj" $(SOURCE)

SOURCE="Valuetype_Adapter_Impl.cpp"

"$(INTDIR)\Valuetype_Adapter_Impl.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Valuetype_Adapter_Impl.obj" $(SOURCE)

SOURCE="StringValueC.cpp"

"$(INTDIR)\StringValueC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\StringValueC.obj" $(SOURCE)

!IF  "$(CFG)" == "Win64 Debug"
!ELSEIF  "$(CFG)" == "Win64 Release"
!ELSEIF  "$(CFG)" == "Win64 Static Debug"
!ELSEIF  "$(CFG)" == "Win64 Static Release"
!ENDIF

SOURCE="TAO_Valuetype.rc"

"$(INTDIR)\TAO_Valuetype.res" : $(SOURCE)
	$(RSC) /l 0x409 /fo"$(INTDIR)\TAO_Valuetype.res" /d NDEBUG /d WIN64 /d _CRT_SECURE_NO_WARNINGS /d _CRT_SECURE_NO_DEPRECATE /d _CRT_NONSTDC_NO_DEPRECATE /d TAO_HAS_VALUETYPE_OUT_INDIRECTION /i "..\..\.." /i "..\.." $(SOURCE)



!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.Valuetype.dep")
	@echo Using "Makefile.Valuetype.dep"
!ELSE
	@echo Warning: cannot find "Makefile.Valuetype.dep"
!ENDIF
!ENDIF

