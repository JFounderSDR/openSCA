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
!MESSAGE NMAKE /f "Makefile.IFRService.mak" CFG="Win64 Debug"
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
INTDIR=Debug\IFRService\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_IFRServiced.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_IFRSERVICE_BUILD_DLL -f "Makefile.IFRService.dep" "IFRService\AbstractInterfaceDef_i.cpp" "IFRService\AliasDef_i.cpp" "IFRService\ArrayDef_i.cpp" "IFRService\AttributeDef_i.cpp" "IFRService\ComponentContainer_i.cpp" "IFRService\ComponentDef_i.cpp" "IFRService\ComponentModuleDef_i.cpp" "IFRService\ComponentRepository_i.cpp" "IFRService\ConstantDef_i.cpp" "IFRService\ConsumesDef_i.cpp" "IFRService\Contained_i.cpp" "IFRService\Container_i.cpp" "IFRService\EmitsDef_i.cpp" "IFRService\EnumDef_i.cpp" "IFRService\EventDef_i.cpp" "IFRService\EventPortDef_i.cpp" "IFRService\ExceptionDef_i.cpp" "IFRService\ExtAbstractInterfaceDef_i.cpp" "IFRService\ExtAttributeDef_i.cpp" "IFRService\ExtInterfaceDef_i.cpp" "IFRService\ExtLocalInterfaceDef_i.cpp" "IFRService\ExtValueDef_i.cpp" "IFRService\FactoryDef_i.cpp" "IFRService\FinderDef_i.cpp" "IFRService\FixedDef_i.cpp" "IFRService\HomeDef_i.cpp" "IFRService\IDLType_i.cpp" "IFRService\InterfaceAttrExtension_i.cpp" "IFRService\InterfaceDef_i.cpp" "IFRService\IRObject_i.cpp" "IFRService\LocalInterfaceDef_i.cpp" "IFRService\ModuleDef_i.cpp" "IFRService\NativeDef_i.cpp" "IFRService\OperationDef_i.cpp" "IFRService\PrimitiveDef_i.cpp" "IFRService\ProvidesDef_i.cpp" "IFRService\PublishesDef_i.cpp" "IFRService\RecursDef_i.cpp" "IFRService\Repository_i.cpp" "IFRService\SequenceDef_i.cpp" "IFRService\StringDef_i.cpp" "IFRService\StructDef_i.cpp" "IFRService\TypedefDef_i.cpp" "IFRService\UnionDef_i.cpp" "IFRService\UsesDef_i.cpp" "IFRService\ValueBoxDef_i.cpp" "IFRService\ValueDef_i.cpp" "IFRService\ValueMemberDef_i.cpp" "IFRService\WstringDef_i.cpp" "IFRService\IFR_Service_Loader.cpp" "IFRService\IFR_Service_Utils.cpp" "IFRService\Options.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_IFRServiced.pdb"
	-@del /f/q "..\..\..\lib\TAO_IFRServiced.dll"
	-@del /f/q "$(OUTDIR)\TAO_IFRServiced.lib"
	-@del /f/q "$(OUTDIR)\TAO_IFRServiced.exp"
	-@del /f/q "$(OUTDIR)\TAO_IFRServiced.ilk"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\IFRService\$(NULL)" mkdir "Debug\IFRService"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_IFRSERVICE_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_IFR_Clientd.lib TAO_TypeCodeFactoryd.lib TAO_PortableServerd.lib TAO_Svc_Utilsd.lib TAO_IORTabled.lib TAO_IFR_Client_skeld.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\..\lib\TAO_IFRServiced.pdb" /machine:IA64 /out:"..\..\..\lib\TAO_IFRServiced.dll" /implib:"$(OUTDIR)\TAO_IFRServiced.lib"
LINK32_OBJS= \
	"$(INTDIR)\IFRService.res" \
	"$(INTDIR)\IFRService\AbstractInterfaceDef_i.obj" \
	"$(INTDIR)\IFRService\AliasDef_i.obj" \
	"$(INTDIR)\IFRService\ArrayDef_i.obj" \
	"$(INTDIR)\IFRService\AttributeDef_i.obj" \
	"$(INTDIR)\IFRService\ComponentContainer_i.obj" \
	"$(INTDIR)\IFRService\ComponentDef_i.obj" \
	"$(INTDIR)\IFRService\ComponentModuleDef_i.obj" \
	"$(INTDIR)\IFRService\ComponentRepository_i.obj" \
	"$(INTDIR)\IFRService\ConstantDef_i.obj" \
	"$(INTDIR)\IFRService\ConsumesDef_i.obj" \
	"$(INTDIR)\IFRService\Contained_i.obj" \
	"$(INTDIR)\IFRService\Container_i.obj" \
	"$(INTDIR)\IFRService\EmitsDef_i.obj" \
	"$(INTDIR)\IFRService\EnumDef_i.obj" \
	"$(INTDIR)\IFRService\EventDef_i.obj" \
	"$(INTDIR)\IFRService\EventPortDef_i.obj" \
	"$(INTDIR)\IFRService\ExceptionDef_i.obj" \
	"$(INTDIR)\IFRService\ExtAbstractInterfaceDef_i.obj" \
	"$(INTDIR)\IFRService\ExtAttributeDef_i.obj" \
	"$(INTDIR)\IFRService\ExtInterfaceDef_i.obj" \
	"$(INTDIR)\IFRService\ExtLocalInterfaceDef_i.obj" \
	"$(INTDIR)\IFRService\ExtValueDef_i.obj" \
	"$(INTDIR)\IFRService\FactoryDef_i.obj" \
	"$(INTDIR)\IFRService\FinderDef_i.obj" \
	"$(INTDIR)\IFRService\FixedDef_i.obj" \
	"$(INTDIR)\IFRService\HomeDef_i.obj" \
	"$(INTDIR)\IFRService\IDLType_i.obj" \
	"$(INTDIR)\IFRService\InterfaceAttrExtension_i.obj" \
	"$(INTDIR)\IFRService\InterfaceDef_i.obj" \
	"$(INTDIR)\IFRService\IRObject_i.obj" \
	"$(INTDIR)\IFRService\LocalInterfaceDef_i.obj" \
	"$(INTDIR)\IFRService\ModuleDef_i.obj" \
	"$(INTDIR)\IFRService\NativeDef_i.obj" \
	"$(INTDIR)\IFRService\OperationDef_i.obj" \
	"$(INTDIR)\IFRService\PrimitiveDef_i.obj" \
	"$(INTDIR)\IFRService\ProvidesDef_i.obj" \
	"$(INTDIR)\IFRService\PublishesDef_i.obj" \
	"$(INTDIR)\IFRService\RecursDef_i.obj" \
	"$(INTDIR)\IFRService\Repository_i.obj" \
	"$(INTDIR)\IFRService\SequenceDef_i.obj" \
	"$(INTDIR)\IFRService\StringDef_i.obj" \
	"$(INTDIR)\IFRService\StructDef_i.obj" \
	"$(INTDIR)\IFRService\TypedefDef_i.obj" \
	"$(INTDIR)\IFRService\UnionDef_i.obj" \
	"$(INTDIR)\IFRService\UsesDef_i.obj" \
	"$(INTDIR)\IFRService\ValueBoxDef_i.obj" \
	"$(INTDIR)\IFRService\ValueDef_i.obj" \
	"$(INTDIR)\IFRService\ValueMemberDef_i.obj" \
	"$(INTDIR)\IFRService\WstringDef_i.obj" \
	"$(INTDIR)\IFRService\IFR_Service_Loader.obj" \
	"$(INTDIR)\IFRService\IFR_Service_Utils.obj" \
	"$(INTDIR)\IFRService\Options.obj"

"..\..\..\lib\TAO_IFRServiced.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_IFRServiced.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_IFRServiced.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\IFRService\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_IFRService.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_IFRSERVICE_BUILD_DLL -f "Makefile.IFRService.dep" "IFRService\AbstractInterfaceDef_i.cpp" "IFRService\AliasDef_i.cpp" "IFRService\ArrayDef_i.cpp" "IFRService\AttributeDef_i.cpp" "IFRService\ComponentContainer_i.cpp" "IFRService\ComponentDef_i.cpp" "IFRService\ComponentModuleDef_i.cpp" "IFRService\ComponentRepository_i.cpp" "IFRService\ConstantDef_i.cpp" "IFRService\ConsumesDef_i.cpp" "IFRService\Contained_i.cpp" "IFRService\Container_i.cpp" "IFRService\EmitsDef_i.cpp" "IFRService\EnumDef_i.cpp" "IFRService\EventDef_i.cpp" "IFRService\EventPortDef_i.cpp" "IFRService\ExceptionDef_i.cpp" "IFRService\ExtAbstractInterfaceDef_i.cpp" "IFRService\ExtAttributeDef_i.cpp" "IFRService\ExtInterfaceDef_i.cpp" "IFRService\ExtLocalInterfaceDef_i.cpp" "IFRService\ExtValueDef_i.cpp" "IFRService\FactoryDef_i.cpp" "IFRService\FinderDef_i.cpp" "IFRService\FixedDef_i.cpp" "IFRService\HomeDef_i.cpp" "IFRService\IDLType_i.cpp" "IFRService\InterfaceAttrExtension_i.cpp" "IFRService\InterfaceDef_i.cpp" "IFRService\IRObject_i.cpp" "IFRService\LocalInterfaceDef_i.cpp" "IFRService\ModuleDef_i.cpp" "IFRService\NativeDef_i.cpp" "IFRService\OperationDef_i.cpp" "IFRService\PrimitiveDef_i.cpp" "IFRService\ProvidesDef_i.cpp" "IFRService\PublishesDef_i.cpp" "IFRService\RecursDef_i.cpp" "IFRService\Repository_i.cpp" "IFRService\SequenceDef_i.cpp" "IFRService\StringDef_i.cpp" "IFRService\StructDef_i.cpp" "IFRService\TypedefDef_i.cpp" "IFRService\UnionDef_i.cpp" "IFRService\UsesDef_i.cpp" "IFRService\ValueBoxDef_i.cpp" "IFRService\ValueDef_i.cpp" "IFRService\ValueMemberDef_i.cpp" "IFRService\WstringDef_i.cpp" "IFRService\IFR_Service_Loader.cpp" "IFRService\IFR_Service_Utils.cpp" "IFRService\Options.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\TAO_IFRService.dll"
	-@del /f/q "$(OUTDIR)\TAO_IFRService.lib"
	-@del /f/q "$(OUTDIR)\TAO_IFRService.exp"
	-@del /f/q "$(OUTDIR)\TAO_IFRService.ilk"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\IFRService\$(NULL)" mkdir "Release\IFRService"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_IFRSERVICE_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_IFR_Client.lib TAO_TypeCodeFactory.lib TAO_PortableServer.lib TAO_Svc_Utils.lib TAO_IORTable.lib TAO_IFR_Client_skel.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\..\lib\TAO_IFRService.dll" /implib:"$(OUTDIR)\TAO_IFRService.lib"
LINK32_OBJS= \
	"$(INTDIR)\IFRService.res" \
	"$(INTDIR)\IFRService\AbstractInterfaceDef_i.obj" \
	"$(INTDIR)\IFRService\AliasDef_i.obj" \
	"$(INTDIR)\IFRService\ArrayDef_i.obj" \
	"$(INTDIR)\IFRService\AttributeDef_i.obj" \
	"$(INTDIR)\IFRService\ComponentContainer_i.obj" \
	"$(INTDIR)\IFRService\ComponentDef_i.obj" \
	"$(INTDIR)\IFRService\ComponentModuleDef_i.obj" \
	"$(INTDIR)\IFRService\ComponentRepository_i.obj" \
	"$(INTDIR)\IFRService\ConstantDef_i.obj" \
	"$(INTDIR)\IFRService\ConsumesDef_i.obj" \
	"$(INTDIR)\IFRService\Contained_i.obj" \
	"$(INTDIR)\IFRService\Container_i.obj" \
	"$(INTDIR)\IFRService\EmitsDef_i.obj" \
	"$(INTDIR)\IFRService\EnumDef_i.obj" \
	"$(INTDIR)\IFRService\EventDef_i.obj" \
	"$(INTDIR)\IFRService\EventPortDef_i.obj" \
	"$(INTDIR)\IFRService\ExceptionDef_i.obj" \
	"$(INTDIR)\IFRService\ExtAbstractInterfaceDef_i.obj" \
	"$(INTDIR)\IFRService\ExtAttributeDef_i.obj" \
	"$(INTDIR)\IFRService\ExtInterfaceDef_i.obj" \
	"$(INTDIR)\IFRService\ExtLocalInterfaceDef_i.obj" \
	"$(INTDIR)\IFRService\ExtValueDef_i.obj" \
	"$(INTDIR)\IFRService\FactoryDef_i.obj" \
	"$(INTDIR)\IFRService\FinderDef_i.obj" \
	"$(INTDIR)\IFRService\FixedDef_i.obj" \
	"$(INTDIR)\IFRService\HomeDef_i.obj" \
	"$(INTDIR)\IFRService\IDLType_i.obj" \
	"$(INTDIR)\IFRService\InterfaceAttrExtension_i.obj" \
	"$(INTDIR)\IFRService\InterfaceDef_i.obj" \
	"$(INTDIR)\IFRService\IRObject_i.obj" \
	"$(INTDIR)\IFRService\LocalInterfaceDef_i.obj" \
	"$(INTDIR)\IFRService\ModuleDef_i.obj" \
	"$(INTDIR)\IFRService\NativeDef_i.obj" \
	"$(INTDIR)\IFRService\OperationDef_i.obj" \
	"$(INTDIR)\IFRService\PrimitiveDef_i.obj" \
	"$(INTDIR)\IFRService\ProvidesDef_i.obj" \
	"$(INTDIR)\IFRService\PublishesDef_i.obj" \
	"$(INTDIR)\IFRService\RecursDef_i.obj" \
	"$(INTDIR)\IFRService\Repository_i.obj" \
	"$(INTDIR)\IFRService\SequenceDef_i.obj" \
	"$(INTDIR)\IFRService\StringDef_i.obj" \
	"$(INTDIR)\IFRService\StructDef_i.obj" \
	"$(INTDIR)\IFRService\TypedefDef_i.obj" \
	"$(INTDIR)\IFRService\UnionDef_i.obj" \
	"$(INTDIR)\IFRService\UsesDef_i.obj" \
	"$(INTDIR)\IFRService\ValueBoxDef_i.obj" \
	"$(INTDIR)\IFRService\ValueDef_i.obj" \
	"$(INTDIR)\IFRService\ValueMemberDef_i.obj" \
	"$(INTDIR)\IFRService\WstringDef_i.obj" \
	"$(INTDIR)\IFRService\IFR_Service_Loader.obj" \
	"$(INTDIR)\IFRService\IFR_Service_Utils.obj" \
	"$(INTDIR)\IFRService\Options.obj"

"..\..\..\lib\TAO_IFRService.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_IFRService.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_IFRService.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\IFRService\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_IFRServicesd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.IFRService.dep" "IFRService\AbstractInterfaceDef_i.cpp" "IFRService\AliasDef_i.cpp" "IFRService\ArrayDef_i.cpp" "IFRService\AttributeDef_i.cpp" "IFRService\ComponentContainer_i.cpp" "IFRService\ComponentDef_i.cpp" "IFRService\ComponentModuleDef_i.cpp" "IFRService\ComponentRepository_i.cpp" "IFRService\ConstantDef_i.cpp" "IFRService\ConsumesDef_i.cpp" "IFRService\Contained_i.cpp" "IFRService\Container_i.cpp" "IFRService\EmitsDef_i.cpp" "IFRService\EnumDef_i.cpp" "IFRService\EventDef_i.cpp" "IFRService\EventPortDef_i.cpp" "IFRService\ExceptionDef_i.cpp" "IFRService\ExtAbstractInterfaceDef_i.cpp" "IFRService\ExtAttributeDef_i.cpp" "IFRService\ExtInterfaceDef_i.cpp" "IFRService\ExtLocalInterfaceDef_i.cpp" "IFRService\ExtValueDef_i.cpp" "IFRService\FactoryDef_i.cpp" "IFRService\FinderDef_i.cpp" "IFRService\FixedDef_i.cpp" "IFRService\HomeDef_i.cpp" "IFRService\IDLType_i.cpp" "IFRService\InterfaceAttrExtension_i.cpp" "IFRService\InterfaceDef_i.cpp" "IFRService\IRObject_i.cpp" "IFRService\LocalInterfaceDef_i.cpp" "IFRService\ModuleDef_i.cpp" "IFRService\NativeDef_i.cpp" "IFRService\OperationDef_i.cpp" "IFRService\PrimitiveDef_i.cpp" "IFRService\ProvidesDef_i.cpp" "IFRService\PublishesDef_i.cpp" "IFRService\RecursDef_i.cpp" "IFRService\Repository_i.cpp" "IFRService\SequenceDef_i.cpp" "IFRService\StringDef_i.cpp" "IFRService\StructDef_i.cpp" "IFRService\TypedefDef_i.cpp" "IFRService\UnionDef_i.cpp" "IFRService\UsesDef_i.cpp" "IFRService\ValueBoxDef_i.cpp" "IFRService\ValueDef_i.cpp" "IFRService\ValueMemberDef_i.cpp" "IFRService\WstringDef_i.cpp" "IFRService\IFR_Service_Loader.cpp" "IFRService\IFR_Service_Utils.cpp" "IFRService\Options.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_IFRServicesd.lib"
	-@del /f/q "$(OUTDIR)\TAO_IFRServicesd.exp"
	-@del /f/q "$(OUTDIR)\TAO_IFRServicesd.ilk"
	-@del /f/q "..\..\..\lib\TAO_IFRServicesd.pdb"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\IFRService\$(NULL)" mkdir "Static_Debug\IFRService"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\TAO_IFRServicesd.pdb" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_IFRServicesd.lib"
LINK32_OBJS= \
	"$(INTDIR)\IFRService\AbstractInterfaceDef_i.obj" \
	"$(INTDIR)\IFRService\AliasDef_i.obj" \
	"$(INTDIR)\IFRService\ArrayDef_i.obj" \
	"$(INTDIR)\IFRService\AttributeDef_i.obj" \
	"$(INTDIR)\IFRService\ComponentContainer_i.obj" \
	"$(INTDIR)\IFRService\ComponentDef_i.obj" \
	"$(INTDIR)\IFRService\ComponentModuleDef_i.obj" \
	"$(INTDIR)\IFRService\ComponentRepository_i.obj" \
	"$(INTDIR)\IFRService\ConstantDef_i.obj" \
	"$(INTDIR)\IFRService\ConsumesDef_i.obj" \
	"$(INTDIR)\IFRService\Contained_i.obj" \
	"$(INTDIR)\IFRService\Container_i.obj" \
	"$(INTDIR)\IFRService\EmitsDef_i.obj" \
	"$(INTDIR)\IFRService\EnumDef_i.obj" \
	"$(INTDIR)\IFRService\EventDef_i.obj" \
	"$(INTDIR)\IFRService\EventPortDef_i.obj" \
	"$(INTDIR)\IFRService\ExceptionDef_i.obj" \
	"$(INTDIR)\IFRService\ExtAbstractInterfaceDef_i.obj" \
	"$(INTDIR)\IFRService\ExtAttributeDef_i.obj" \
	"$(INTDIR)\IFRService\ExtInterfaceDef_i.obj" \
	"$(INTDIR)\IFRService\ExtLocalInterfaceDef_i.obj" \
	"$(INTDIR)\IFRService\ExtValueDef_i.obj" \
	"$(INTDIR)\IFRService\FactoryDef_i.obj" \
	"$(INTDIR)\IFRService\FinderDef_i.obj" \
	"$(INTDIR)\IFRService\FixedDef_i.obj" \
	"$(INTDIR)\IFRService\HomeDef_i.obj" \
	"$(INTDIR)\IFRService\IDLType_i.obj" \
	"$(INTDIR)\IFRService\InterfaceAttrExtension_i.obj" \
	"$(INTDIR)\IFRService\InterfaceDef_i.obj" \
	"$(INTDIR)\IFRService\IRObject_i.obj" \
	"$(INTDIR)\IFRService\LocalInterfaceDef_i.obj" \
	"$(INTDIR)\IFRService\ModuleDef_i.obj" \
	"$(INTDIR)\IFRService\NativeDef_i.obj" \
	"$(INTDIR)\IFRService\OperationDef_i.obj" \
	"$(INTDIR)\IFRService\PrimitiveDef_i.obj" \
	"$(INTDIR)\IFRService\ProvidesDef_i.obj" \
	"$(INTDIR)\IFRService\PublishesDef_i.obj" \
	"$(INTDIR)\IFRService\RecursDef_i.obj" \
	"$(INTDIR)\IFRService\Repository_i.obj" \
	"$(INTDIR)\IFRService\SequenceDef_i.obj" \
	"$(INTDIR)\IFRService\StringDef_i.obj" \
	"$(INTDIR)\IFRService\StructDef_i.obj" \
	"$(INTDIR)\IFRService\TypedefDef_i.obj" \
	"$(INTDIR)\IFRService\UnionDef_i.obj" \
	"$(INTDIR)\IFRService\UsesDef_i.obj" \
	"$(INTDIR)\IFRService\ValueBoxDef_i.obj" \
	"$(INTDIR)\IFRService\ValueDef_i.obj" \
	"$(INTDIR)\IFRService\ValueMemberDef_i.obj" \
	"$(INTDIR)\IFRService\WstringDef_i.obj" \
	"$(INTDIR)\IFRService\IFR_Service_Loader.obj" \
	"$(INTDIR)\IFRService\IFR_Service_Utils.obj" \
	"$(INTDIR)\IFRService\Options.obj"

"$(OUTDIR)\TAO_IFRServicesd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_IFRServicesd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_IFRServicesd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\IFRService\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_IFRServices.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.IFRService.dep" "IFRService\AbstractInterfaceDef_i.cpp" "IFRService\AliasDef_i.cpp" "IFRService\ArrayDef_i.cpp" "IFRService\AttributeDef_i.cpp" "IFRService\ComponentContainer_i.cpp" "IFRService\ComponentDef_i.cpp" "IFRService\ComponentModuleDef_i.cpp" "IFRService\ComponentRepository_i.cpp" "IFRService\ConstantDef_i.cpp" "IFRService\ConsumesDef_i.cpp" "IFRService\Contained_i.cpp" "IFRService\Container_i.cpp" "IFRService\EmitsDef_i.cpp" "IFRService\EnumDef_i.cpp" "IFRService\EventDef_i.cpp" "IFRService\EventPortDef_i.cpp" "IFRService\ExceptionDef_i.cpp" "IFRService\ExtAbstractInterfaceDef_i.cpp" "IFRService\ExtAttributeDef_i.cpp" "IFRService\ExtInterfaceDef_i.cpp" "IFRService\ExtLocalInterfaceDef_i.cpp" "IFRService\ExtValueDef_i.cpp" "IFRService\FactoryDef_i.cpp" "IFRService\FinderDef_i.cpp" "IFRService\FixedDef_i.cpp" "IFRService\HomeDef_i.cpp" "IFRService\IDLType_i.cpp" "IFRService\InterfaceAttrExtension_i.cpp" "IFRService\InterfaceDef_i.cpp" "IFRService\IRObject_i.cpp" "IFRService\LocalInterfaceDef_i.cpp" "IFRService\ModuleDef_i.cpp" "IFRService\NativeDef_i.cpp" "IFRService\OperationDef_i.cpp" "IFRService\PrimitiveDef_i.cpp" "IFRService\ProvidesDef_i.cpp" "IFRService\PublishesDef_i.cpp" "IFRService\RecursDef_i.cpp" "IFRService\Repository_i.cpp" "IFRService\SequenceDef_i.cpp" "IFRService\StringDef_i.cpp" "IFRService\StructDef_i.cpp" "IFRService\TypedefDef_i.cpp" "IFRService\UnionDef_i.cpp" "IFRService\UsesDef_i.cpp" "IFRService\ValueBoxDef_i.cpp" "IFRService\ValueDef_i.cpp" "IFRService\ValueMemberDef_i.cpp" "IFRService\WstringDef_i.cpp" "IFRService\IFR_Service_Loader.cpp" "IFRService\IFR_Service_Utils.cpp" "IFRService\Options.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_IFRServices.lib"
	-@del /f/q "$(OUTDIR)\TAO_IFRServices.exp"
	-@del /f/q "$(OUTDIR)\TAO_IFRServices.ilk"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\IFRService\$(NULL)" mkdir "Static_Release\IFRService"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_IFRServices.lib"
LINK32_OBJS= \
	"$(INTDIR)\IFRService\AbstractInterfaceDef_i.obj" \
	"$(INTDIR)\IFRService\AliasDef_i.obj" \
	"$(INTDIR)\IFRService\ArrayDef_i.obj" \
	"$(INTDIR)\IFRService\AttributeDef_i.obj" \
	"$(INTDIR)\IFRService\ComponentContainer_i.obj" \
	"$(INTDIR)\IFRService\ComponentDef_i.obj" \
	"$(INTDIR)\IFRService\ComponentModuleDef_i.obj" \
	"$(INTDIR)\IFRService\ComponentRepository_i.obj" \
	"$(INTDIR)\IFRService\ConstantDef_i.obj" \
	"$(INTDIR)\IFRService\ConsumesDef_i.obj" \
	"$(INTDIR)\IFRService\Contained_i.obj" \
	"$(INTDIR)\IFRService\Container_i.obj" \
	"$(INTDIR)\IFRService\EmitsDef_i.obj" \
	"$(INTDIR)\IFRService\EnumDef_i.obj" \
	"$(INTDIR)\IFRService\EventDef_i.obj" \
	"$(INTDIR)\IFRService\EventPortDef_i.obj" \
	"$(INTDIR)\IFRService\ExceptionDef_i.obj" \
	"$(INTDIR)\IFRService\ExtAbstractInterfaceDef_i.obj" \
	"$(INTDIR)\IFRService\ExtAttributeDef_i.obj" \
	"$(INTDIR)\IFRService\ExtInterfaceDef_i.obj" \
	"$(INTDIR)\IFRService\ExtLocalInterfaceDef_i.obj" \
	"$(INTDIR)\IFRService\ExtValueDef_i.obj" \
	"$(INTDIR)\IFRService\FactoryDef_i.obj" \
	"$(INTDIR)\IFRService\FinderDef_i.obj" \
	"$(INTDIR)\IFRService\FixedDef_i.obj" \
	"$(INTDIR)\IFRService\HomeDef_i.obj" \
	"$(INTDIR)\IFRService\IDLType_i.obj" \
	"$(INTDIR)\IFRService\InterfaceAttrExtension_i.obj" \
	"$(INTDIR)\IFRService\InterfaceDef_i.obj" \
	"$(INTDIR)\IFRService\IRObject_i.obj" \
	"$(INTDIR)\IFRService\LocalInterfaceDef_i.obj" \
	"$(INTDIR)\IFRService\ModuleDef_i.obj" \
	"$(INTDIR)\IFRService\NativeDef_i.obj" \
	"$(INTDIR)\IFRService\OperationDef_i.obj" \
	"$(INTDIR)\IFRService\PrimitiveDef_i.obj" \
	"$(INTDIR)\IFRService\ProvidesDef_i.obj" \
	"$(INTDIR)\IFRService\PublishesDef_i.obj" \
	"$(INTDIR)\IFRService\RecursDef_i.obj" \
	"$(INTDIR)\IFRService\Repository_i.obj" \
	"$(INTDIR)\IFRService\SequenceDef_i.obj" \
	"$(INTDIR)\IFRService\StringDef_i.obj" \
	"$(INTDIR)\IFRService\StructDef_i.obj" \
	"$(INTDIR)\IFRService\TypedefDef_i.obj" \
	"$(INTDIR)\IFRService\UnionDef_i.obj" \
	"$(INTDIR)\IFRService\UsesDef_i.obj" \
	"$(INTDIR)\IFRService\ValueBoxDef_i.obj" \
	"$(INTDIR)\IFRService\ValueDef_i.obj" \
	"$(INTDIR)\IFRService\ValueMemberDef_i.obj" \
	"$(INTDIR)\IFRService\WstringDef_i.obj" \
	"$(INTDIR)\IFRService\IFR_Service_Loader.obj" \
	"$(INTDIR)\IFRService\IFR_Service_Utils.obj" \
	"$(INTDIR)\IFRService\Options.obj"

"$(OUTDIR)\TAO_IFRServices.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_IFRServices.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_IFRServices.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.IFRService.dep")
!INCLUDE "Makefile.IFRService.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="IFRService\AbstractInterfaceDef_i.cpp"

"$(INTDIR)\IFRService\AbstractInterfaceDef_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\AbstractInterfaceDef_i.obj" $(SOURCE)

SOURCE="IFRService\AliasDef_i.cpp"

"$(INTDIR)\IFRService\AliasDef_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\AliasDef_i.obj" $(SOURCE)

SOURCE="IFRService\ArrayDef_i.cpp"

"$(INTDIR)\IFRService\ArrayDef_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\ArrayDef_i.obj" $(SOURCE)

SOURCE="IFRService\AttributeDef_i.cpp"

"$(INTDIR)\IFRService\AttributeDef_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\AttributeDef_i.obj" $(SOURCE)

SOURCE="IFRService\ComponentContainer_i.cpp"

"$(INTDIR)\IFRService\ComponentContainer_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\ComponentContainer_i.obj" $(SOURCE)

SOURCE="IFRService\ComponentDef_i.cpp"

"$(INTDIR)\IFRService\ComponentDef_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\ComponentDef_i.obj" $(SOURCE)

SOURCE="IFRService\ComponentModuleDef_i.cpp"

"$(INTDIR)\IFRService\ComponentModuleDef_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\ComponentModuleDef_i.obj" $(SOURCE)

SOURCE="IFRService\ComponentRepository_i.cpp"

"$(INTDIR)\IFRService\ComponentRepository_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\ComponentRepository_i.obj" $(SOURCE)

SOURCE="IFRService\ConstantDef_i.cpp"

"$(INTDIR)\IFRService\ConstantDef_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\ConstantDef_i.obj" $(SOURCE)

SOURCE="IFRService\ConsumesDef_i.cpp"

"$(INTDIR)\IFRService\ConsumesDef_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\ConsumesDef_i.obj" $(SOURCE)

SOURCE="IFRService\Contained_i.cpp"

"$(INTDIR)\IFRService\Contained_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\Contained_i.obj" $(SOURCE)

SOURCE="IFRService\Container_i.cpp"

"$(INTDIR)\IFRService\Container_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\Container_i.obj" $(SOURCE)

SOURCE="IFRService\EmitsDef_i.cpp"

"$(INTDIR)\IFRService\EmitsDef_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\EmitsDef_i.obj" $(SOURCE)

SOURCE="IFRService\EnumDef_i.cpp"

"$(INTDIR)\IFRService\EnumDef_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\EnumDef_i.obj" $(SOURCE)

SOURCE="IFRService\EventDef_i.cpp"

"$(INTDIR)\IFRService\EventDef_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\EventDef_i.obj" $(SOURCE)

SOURCE="IFRService\EventPortDef_i.cpp"

"$(INTDIR)\IFRService\EventPortDef_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\EventPortDef_i.obj" $(SOURCE)

SOURCE="IFRService\ExceptionDef_i.cpp"

"$(INTDIR)\IFRService\ExceptionDef_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\ExceptionDef_i.obj" $(SOURCE)

SOURCE="IFRService\ExtAbstractInterfaceDef_i.cpp"

"$(INTDIR)\IFRService\ExtAbstractInterfaceDef_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\ExtAbstractInterfaceDef_i.obj" $(SOURCE)

SOURCE="IFRService\ExtAttributeDef_i.cpp"

"$(INTDIR)\IFRService\ExtAttributeDef_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\ExtAttributeDef_i.obj" $(SOURCE)

SOURCE="IFRService\ExtInterfaceDef_i.cpp"

"$(INTDIR)\IFRService\ExtInterfaceDef_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\ExtInterfaceDef_i.obj" $(SOURCE)

SOURCE="IFRService\ExtLocalInterfaceDef_i.cpp"

"$(INTDIR)\IFRService\ExtLocalInterfaceDef_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\ExtLocalInterfaceDef_i.obj" $(SOURCE)

SOURCE="IFRService\ExtValueDef_i.cpp"

"$(INTDIR)\IFRService\ExtValueDef_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\ExtValueDef_i.obj" $(SOURCE)

SOURCE="IFRService\FactoryDef_i.cpp"

"$(INTDIR)\IFRService\FactoryDef_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\FactoryDef_i.obj" $(SOURCE)

SOURCE="IFRService\FinderDef_i.cpp"

"$(INTDIR)\IFRService\FinderDef_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\FinderDef_i.obj" $(SOURCE)

SOURCE="IFRService\FixedDef_i.cpp"

"$(INTDIR)\IFRService\FixedDef_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\FixedDef_i.obj" $(SOURCE)

SOURCE="IFRService\HomeDef_i.cpp"

"$(INTDIR)\IFRService\HomeDef_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\HomeDef_i.obj" $(SOURCE)

SOURCE="IFRService\IDLType_i.cpp"

"$(INTDIR)\IFRService\IDLType_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\IDLType_i.obj" $(SOURCE)

SOURCE="IFRService\InterfaceAttrExtension_i.cpp"

"$(INTDIR)\IFRService\InterfaceAttrExtension_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\InterfaceAttrExtension_i.obj" $(SOURCE)

SOURCE="IFRService\InterfaceDef_i.cpp"

"$(INTDIR)\IFRService\InterfaceDef_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\InterfaceDef_i.obj" $(SOURCE)

SOURCE="IFRService\IRObject_i.cpp"

"$(INTDIR)\IFRService\IRObject_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\IRObject_i.obj" $(SOURCE)

SOURCE="IFRService\LocalInterfaceDef_i.cpp"

"$(INTDIR)\IFRService\LocalInterfaceDef_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\LocalInterfaceDef_i.obj" $(SOURCE)

SOURCE="IFRService\ModuleDef_i.cpp"

"$(INTDIR)\IFRService\ModuleDef_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\ModuleDef_i.obj" $(SOURCE)

SOURCE="IFRService\NativeDef_i.cpp"

"$(INTDIR)\IFRService\NativeDef_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\NativeDef_i.obj" $(SOURCE)

SOURCE="IFRService\OperationDef_i.cpp"

"$(INTDIR)\IFRService\OperationDef_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\OperationDef_i.obj" $(SOURCE)

SOURCE="IFRService\PrimitiveDef_i.cpp"

"$(INTDIR)\IFRService\PrimitiveDef_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\PrimitiveDef_i.obj" $(SOURCE)

SOURCE="IFRService\ProvidesDef_i.cpp"

"$(INTDIR)\IFRService\ProvidesDef_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\ProvidesDef_i.obj" $(SOURCE)

SOURCE="IFRService\PublishesDef_i.cpp"

"$(INTDIR)\IFRService\PublishesDef_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\PublishesDef_i.obj" $(SOURCE)

SOURCE="IFRService\RecursDef_i.cpp"

"$(INTDIR)\IFRService\RecursDef_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\RecursDef_i.obj" $(SOURCE)

SOURCE="IFRService\Repository_i.cpp"

"$(INTDIR)\IFRService\Repository_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\Repository_i.obj" $(SOURCE)

SOURCE="IFRService\SequenceDef_i.cpp"

"$(INTDIR)\IFRService\SequenceDef_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\SequenceDef_i.obj" $(SOURCE)

SOURCE="IFRService\StringDef_i.cpp"

"$(INTDIR)\IFRService\StringDef_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\StringDef_i.obj" $(SOURCE)

SOURCE="IFRService\StructDef_i.cpp"

"$(INTDIR)\IFRService\StructDef_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\StructDef_i.obj" $(SOURCE)

SOURCE="IFRService\TypedefDef_i.cpp"

"$(INTDIR)\IFRService\TypedefDef_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\TypedefDef_i.obj" $(SOURCE)

SOURCE="IFRService\UnionDef_i.cpp"

"$(INTDIR)\IFRService\UnionDef_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\UnionDef_i.obj" $(SOURCE)

SOURCE="IFRService\UsesDef_i.cpp"

"$(INTDIR)\IFRService\UsesDef_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\UsesDef_i.obj" $(SOURCE)

SOURCE="IFRService\ValueBoxDef_i.cpp"

"$(INTDIR)\IFRService\ValueBoxDef_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\ValueBoxDef_i.obj" $(SOURCE)

SOURCE="IFRService\ValueDef_i.cpp"

"$(INTDIR)\IFRService\ValueDef_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\ValueDef_i.obj" $(SOURCE)

SOURCE="IFRService\ValueMemberDef_i.cpp"

"$(INTDIR)\IFRService\ValueMemberDef_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\ValueMemberDef_i.obj" $(SOURCE)

SOURCE="IFRService\WstringDef_i.cpp"

"$(INTDIR)\IFRService\WstringDef_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\WstringDef_i.obj" $(SOURCE)

SOURCE="IFRService\IFR_Service_Loader.cpp"

"$(INTDIR)\IFRService\IFR_Service_Loader.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\IFR_Service_Loader.obj" $(SOURCE)

SOURCE="IFRService\IFR_Service_Utils.cpp"

"$(INTDIR)\IFRService\IFR_Service_Utils.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\IFR_Service_Utils.obj" $(SOURCE)

SOURCE="IFRService\Options.cpp"

"$(INTDIR)\IFRService\Options.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\IFRService\$(NULL)" mkdir "$(INTDIR)\IFRService\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFRService\Options.obj" $(SOURCE)

!IF  "$(CFG)" == "Win64 Debug"
!ELSEIF  "$(CFG)" == "Win64 Release"
!ELSEIF  "$(CFG)" == "Win64 Static Debug"
!ELSEIF  "$(CFG)" == "Win64 Static Release"
!ENDIF

SOURCE="IFRService.rc"

"$(INTDIR)\IFRService.res" : $(SOURCE)
	$(RSC) /l 0x409 /fo"$(INTDIR)\IFRService.res" /d NDEBUG /d WIN64 /d _CRT_SECURE_NO_WARNINGS /d _CRT_SECURE_NO_DEPRECATE /d _CRT_NONSTDC_NO_DEPRECATE /i "..\..\.." /i "..\.." /i "..\..\orbsvcs" $(SOURCE)



!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.IFRService.dep")
	@echo Using "Makefile.IFRService.dep"
!ELSE
	@echo Warning: cannot find "Makefile.IFRService.dep"
!ENDIF
!ENDIF

