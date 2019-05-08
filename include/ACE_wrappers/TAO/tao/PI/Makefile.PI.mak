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
!MESSAGE NMAKE /f "Makefile.PI.mak" CFG="Win64 Debug"
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
INTDIR=Debug\PI\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_PId.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_PI_BUILD_DLL -f "Makefile.PI.dep" "ClientRequestDetails.cpp" "ClientRequestInfo.cpp" "ClientRequestInterceptor_Adapter_Impl.cpp" "ClientRequestInterceptor_Factory_Impl.cpp" "DLL_Resident_ORB_Initializer.cpp" "ORBInitializer_Registry_Impl.cpp" "ORBInitInfo.cpp" "PI.cpp" "PI_ORBInitializer.cpp" "PI_PolicyFactory.cpp" "PICurrent.cpp" "PICurrent_Impl.cpp" "PICurrent_Loader.cpp" "PolicyFactory_Loader.cpp" "PolicyFactory_Registry.cpp" "PolicyFactoryA.cpp" "PolicyFactoryC.cpp" "ProcessingModePolicy.cpp" "RequestInfo_Util.cpp" "RequestInterceptor_Adapter_Impl.cpp" "PI_includeC.cpp" "ORBInitInfoC.cpp" "ORBInitializerC.cpp" "ClientRequestInterceptorC.cpp" "ClientRequestInfoC.cpp" "RequestInfoC.cpp" "PIForwardRequestC.cpp" "PICurrentC.cpp" "ProcessingModePolicyC.cpp" "InterceptorC.cpp" "InvalidSlotC.cpp" "ClientRequestInfoA.cpp" "ClientRequestInterceptorA.cpp" "InterceptorA.cpp" "InvalidSlotA.cpp" "ORBInitializerA.cpp" "PICurrentA.cpp" "PIForwardRequestA.cpp" "ProcessingModePolicyA.cpp" "RequestInfoA.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_PId.pdb"
	-@del /f/q "..\..\..\lib\TAO_PId.dll"
	-@del /f/q "$(OUTDIR)\TAO_PId.lib"
	-@del /f/q "$(OUTDIR)\TAO_PId.exp"
	-@del /f/q "$(OUTDIR)\TAO_PId.ilk"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\PI\$(NULL)" mkdir "Debug\PI"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_PI_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_CodecFactoryd.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\..\lib\TAO_PId.pdb" /machine:IA64 /out:"..\..\..\lib\TAO_PId.dll" /implib:"$(OUTDIR)\TAO_PId.lib"
LINK32_OBJS= \
	"$(INTDIR)\TAO_PI.res" \
	"$(INTDIR)\ClientRequestDetails.obj" \
	"$(INTDIR)\ClientRequestInfo.obj" \
	"$(INTDIR)\ClientRequestInterceptor_Adapter_Impl.obj" \
	"$(INTDIR)\ClientRequestInterceptor_Factory_Impl.obj" \
	"$(INTDIR)\DLL_Resident_ORB_Initializer.obj" \
	"$(INTDIR)\ORBInitializer_Registry_Impl.obj" \
	"$(INTDIR)\ORBInitInfo.obj" \
	"$(INTDIR)\PI.obj" \
	"$(INTDIR)\PI_ORBInitializer.obj" \
	"$(INTDIR)\PI_PolicyFactory.obj" \
	"$(INTDIR)\PICurrent.obj" \
	"$(INTDIR)\PICurrent_Impl.obj" \
	"$(INTDIR)\PICurrent_Loader.obj" \
	"$(INTDIR)\PolicyFactory_Loader.obj" \
	"$(INTDIR)\PolicyFactory_Registry.obj" \
	"$(INTDIR)\PolicyFactoryA.obj" \
	"$(INTDIR)\PolicyFactoryC.obj" \
	"$(INTDIR)\ProcessingModePolicy.obj" \
	"$(INTDIR)\RequestInfo_Util.obj" \
	"$(INTDIR)\RequestInterceptor_Adapter_Impl.obj" \
	"$(INTDIR)\PI_includeC.obj" \
	"$(INTDIR)\ORBInitInfoC.obj" \
	"$(INTDIR)\ORBInitializerC.obj" \
	"$(INTDIR)\ClientRequestInterceptorC.obj" \
	"$(INTDIR)\ClientRequestInfoC.obj" \
	"$(INTDIR)\RequestInfoC.obj" \
	"$(INTDIR)\PIForwardRequestC.obj" \
	"$(INTDIR)\PICurrentC.obj" \
	"$(INTDIR)\ProcessingModePolicyC.obj" \
	"$(INTDIR)\InterceptorC.obj" \
	"$(INTDIR)\InvalidSlotC.obj" \
	"$(INTDIR)\ClientRequestInfoA.obj" \
	"$(INTDIR)\ClientRequestInterceptorA.obj" \
	"$(INTDIR)\InterceptorA.obj" \
	"$(INTDIR)\InvalidSlotA.obj" \
	"$(INTDIR)\ORBInitializerA.obj" \
	"$(INTDIR)\PICurrentA.obj" \
	"$(INTDIR)\PIForwardRequestA.obj" \
	"$(INTDIR)\ProcessingModePolicyA.obj" \
	"$(INTDIR)\RequestInfoA.obj"

"..\..\..\lib\TAO_PId.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_PId.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_PId.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\PI\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_PI.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_PI_BUILD_DLL -f "Makefile.PI.dep" "ClientRequestDetails.cpp" "ClientRequestInfo.cpp" "ClientRequestInterceptor_Adapter_Impl.cpp" "ClientRequestInterceptor_Factory_Impl.cpp" "DLL_Resident_ORB_Initializer.cpp" "ORBInitializer_Registry_Impl.cpp" "ORBInitInfo.cpp" "PI.cpp" "PI_ORBInitializer.cpp" "PI_PolicyFactory.cpp" "PICurrent.cpp" "PICurrent_Impl.cpp" "PICurrent_Loader.cpp" "PolicyFactory_Loader.cpp" "PolicyFactory_Registry.cpp" "PolicyFactoryA.cpp" "PolicyFactoryC.cpp" "ProcessingModePolicy.cpp" "RequestInfo_Util.cpp" "RequestInterceptor_Adapter_Impl.cpp" "PI_includeC.cpp" "ORBInitInfoC.cpp" "ORBInitializerC.cpp" "ClientRequestInterceptorC.cpp" "ClientRequestInfoC.cpp" "RequestInfoC.cpp" "PIForwardRequestC.cpp" "PICurrentC.cpp" "ProcessingModePolicyC.cpp" "InterceptorC.cpp" "InvalidSlotC.cpp" "ClientRequestInfoA.cpp" "ClientRequestInterceptorA.cpp" "InterceptorA.cpp" "InvalidSlotA.cpp" "ORBInitializerA.cpp" "PICurrentA.cpp" "PIForwardRequestA.cpp" "ProcessingModePolicyA.cpp" "RequestInfoA.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\TAO_PI.dll"
	-@del /f/q "$(OUTDIR)\TAO_PI.lib"
	-@del /f/q "$(OUTDIR)\TAO_PI.exp"
	-@del /f/q "$(OUTDIR)\TAO_PI.ilk"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\PI\$(NULL)" mkdir "Release\PI"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_PI_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_CodecFactory.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\..\lib\TAO_PI.dll" /implib:"$(OUTDIR)\TAO_PI.lib"
LINK32_OBJS= \
	"$(INTDIR)\TAO_PI.res" \
	"$(INTDIR)\ClientRequestDetails.obj" \
	"$(INTDIR)\ClientRequestInfo.obj" \
	"$(INTDIR)\ClientRequestInterceptor_Adapter_Impl.obj" \
	"$(INTDIR)\ClientRequestInterceptor_Factory_Impl.obj" \
	"$(INTDIR)\DLL_Resident_ORB_Initializer.obj" \
	"$(INTDIR)\ORBInitializer_Registry_Impl.obj" \
	"$(INTDIR)\ORBInitInfo.obj" \
	"$(INTDIR)\PI.obj" \
	"$(INTDIR)\PI_ORBInitializer.obj" \
	"$(INTDIR)\PI_PolicyFactory.obj" \
	"$(INTDIR)\PICurrent.obj" \
	"$(INTDIR)\PICurrent_Impl.obj" \
	"$(INTDIR)\PICurrent_Loader.obj" \
	"$(INTDIR)\PolicyFactory_Loader.obj" \
	"$(INTDIR)\PolicyFactory_Registry.obj" \
	"$(INTDIR)\PolicyFactoryA.obj" \
	"$(INTDIR)\PolicyFactoryC.obj" \
	"$(INTDIR)\ProcessingModePolicy.obj" \
	"$(INTDIR)\RequestInfo_Util.obj" \
	"$(INTDIR)\RequestInterceptor_Adapter_Impl.obj" \
	"$(INTDIR)\PI_includeC.obj" \
	"$(INTDIR)\ORBInitInfoC.obj" \
	"$(INTDIR)\ORBInitializerC.obj" \
	"$(INTDIR)\ClientRequestInterceptorC.obj" \
	"$(INTDIR)\ClientRequestInfoC.obj" \
	"$(INTDIR)\RequestInfoC.obj" \
	"$(INTDIR)\PIForwardRequestC.obj" \
	"$(INTDIR)\PICurrentC.obj" \
	"$(INTDIR)\ProcessingModePolicyC.obj" \
	"$(INTDIR)\InterceptorC.obj" \
	"$(INTDIR)\InvalidSlotC.obj" \
	"$(INTDIR)\ClientRequestInfoA.obj" \
	"$(INTDIR)\ClientRequestInterceptorA.obj" \
	"$(INTDIR)\InterceptorA.obj" \
	"$(INTDIR)\InvalidSlotA.obj" \
	"$(INTDIR)\ORBInitializerA.obj" \
	"$(INTDIR)\PICurrentA.obj" \
	"$(INTDIR)\PIForwardRequestA.obj" \
	"$(INTDIR)\ProcessingModePolicyA.obj" \
	"$(INTDIR)\RequestInfoA.obj"

"..\..\..\lib\TAO_PI.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_PI.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_PI.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\PI\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_PIsd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.PI.dep" "ClientRequestDetails.cpp" "ClientRequestInfo.cpp" "ClientRequestInterceptor_Adapter_Impl.cpp" "ClientRequestInterceptor_Factory_Impl.cpp" "DLL_Resident_ORB_Initializer.cpp" "ORBInitializer_Registry_Impl.cpp" "ORBInitInfo.cpp" "PI.cpp" "PI_ORBInitializer.cpp" "PI_PolicyFactory.cpp" "PICurrent.cpp" "PICurrent_Impl.cpp" "PICurrent_Loader.cpp" "PolicyFactory_Loader.cpp" "PolicyFactory_Registry.cpp" "PolicyFactoryA.cpp" "PolicyFactoryC.cpp" "ProcessingModePolicy.cpp" "RequestInfo_Util.cpp" "RequestInterceptor_Adapter_Impl.cpp" "PI_includeC.cpp" "ORBInitInfoC.cpp" "ORBInitializerC.cpp" "ClientRequestInterceptorC.cpp" "ClientRequestInfoC.cpp" "RequestInfoC.cpp" "PIForwardRequestC.cpp" "PICurrentC.cpp" "ProcessingModePolicyC.cpp" "InterceptorC.cpp" "InvalidSlotC.cpp" "ClientRequestInfoA.cpp" "ClientRequestInterceptorA.cpp" "InterceptorA.cpp" "InvalidSlotA.cpp" "ORBInitializerA.cpp" "PICurrentA.cpp" "PIForwardRequestA.cpp" "ProcessingModePolicyA.cpp" "RequestInfoA.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_PIsd.lib"
	-@del /f/q "$(OUTDIR)\TAO_PIsd.exp"
	-@del /f/q "$(OUTDIR)\TAO_PIsd.ilk"
	-@del /f/q "..\..\..\lib\TAO_PIsd.pdb"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\PI\$(NULL)" mkdir "Static_Debug\PI"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\TAO_PIsd.pdb" /I "..\..\.." /I "..\.." /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_PIsd.lib"
LINK32_OBJS= \
	"$(INTDIR)\ClientRequestDetails.obj" \
	"$(INTDIR)\ClientRequestInfo.obj" \
	"$(INTDIR)\ClientRequestInterceptor_Adapter_Impl.obj" \
	"$(INTDIR)\ClientRequestInterceptor_Factory_Impl.obj" \
	"$(INTDIR)\DLL_Resident_ORB_Initializer.obj" \
	"$(INTDIR)\ORBInitializer_Registry_Impl.obj" \
	"$(INTDIR)\ORBInitInfo.obj" \
	"$(INTDIR)\PI.obj" \
	"$(INTDIR)\PI_ORBInitializer.obj" \
	"$(INTDIR)\PI_PolicyFactory.obj" \
	"$(INTDIR)\PICurrent.obj" \
	"$(INTDIR)\PICurrent_Impl.obj" \
	"$(INTDIR)\PICurrent_Loader.obj" \
	"$(INTDIR)\PolicyFactory_Loader.obj" \
	"$(INTDIR)\PolicyFactory_Registry.obj" \
	"$(INTDIR)\PolicyFactoryA.obj" \
	"$(INTDIR)\PolicyFactoryC.obj" \
	"$(INTDIR)\ProcessingModePolicy.obj" \
	"$(INTDIR)\RequestInfo_Util.obj" \
	"$(INTDIR)\RequestInterceptor_Adapter_Impl.obj" \
	"$(INTDIR)\PI_includeC.obj" \
	"$(INTDIR)\ORBInitInfoC.obj" \
	"$(INTDIR)\ORBInitializerC.obj" \
	"$(INTDIR)\ClientRequestInterceptorC.obj" \
	"$(INTDIR)\ClientRequestInfoC.obj" \
	"$(INTDIR)\RequestInfoC.obj" \
	"$(INTDIR)\PIForwardRequestC.obj" \
	"$(INTDIR)\PICurrentC.obj" \
	"$(INTDIR)\ProcessingModePolicyC.obj" \
	"$(INTDIR)\InterceptorC.obj" \
	"$(INTDIR)\InvalidSlotC.obj" \
	"$(INTDIR)\ClientRequestInfoA.obj" \
	"$(INTDIR)\ClientRequestInterceptorA.obj" \
	"$(INTDIR)\InterceptorA.obj" \
	"$(INTDIR)\InvalidSlotA.obj" \
	"$(INTDIR)\ORBInitializerA.obj" \
	"$(INTDIR)\PICurrentA.obj" \
	"$(INTDIR)\PIForwardRequestA.obj" \
	"$(INTDIR)\ProcessingModePolicyA.obj" \
	"$(INTDIR)\RequestInfoA.obj"

"$(OUTDIR)\TAO_PIsd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_PIsd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_PIsd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\PI\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_PIs.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.PI.dep" "ClientRequestDetails.cpp" "ClientRequestInfo.cpp" "ClientRequestInterceptor_Adapter_Impl.cpp" "ClientRequestInterceptor_Factory_Impl.cpp" "DLL_Resident_ORB_Initializer.cpp" "ORBInitializer_Registry_Impl.cpp" "ORBInitInfo.cpp" "PI.cpp" "PI_ORBInitializer.cpp" "PI_PolicyFactory.cpp" "PICurrent.cpp" "PICurrent_Impl.cpp" "PICurrent_Loader.cpp" "PolicyFactory_Loader.cpp" "PolicyFactory_Registry.cpp" "PolicyFactoryA.cpp" "PolicyFactoryC.cpp" "ProcessingModePolicy.cpp" "RequestInfo_Util.cpp" "RequestInterceptor_Adapter_Impl.cpp" "PI_includeC.cpp" "ORBInitInfoC.cpp" "ORBInitializerC.cpp" "ClientRequestInterceptorC.cpp" "ClientRequestInfoC.cpp" "RequestInfoC.cpp" "PIForwardRequestC.cpp" "PICurrentC.cpp" "ProcessingModePolicyC.cpp" "InterceptorC.cpp" "InvalidSlotC.cpp" "ClientRequestInfoA.cpp" "ClientRequestInterceptorA.cpp" "InterceptorA.cpp" "InvalidSlotA.cpp" "ORBInitializerA.cpp" "PICurrentA.cpp" "PIForwardRequestA.cpp" "ProcessingModePolicyA.cpp" "RequestInfoA.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_PIs.lib"
	-@del /f/q "$(OUTDIR)\TAO_PIs.exp"
	-@del /f/q "$(OUTDIR)\TAO_PIs.ilk"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\PI\$(NULL)" mkdir "Static_Release\PI"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_PIs.lib"
LINK32_OBJS= \
	"$(INTDIR)\ClientRequestDetails.obj" \
	"$(INTDIR)\ClientRequestInfo.obj" \
	"$(INTDIR)\ClientRequestInterceptor_Adapter_Impl.obj" \
	"$(INTDIR)\ClientRequestInterceptor_Factory_Impl.obj" \
	"$(INTDIR)\DLL_Resident_ORB_Initializer.obj" \
	"$(INTDIR)\ORBInitializer_Registry_Impl.obj" \
	"$(INTDIR)\ORBInitInfo.obj" \
	"$(INTDIR)\PI.obj" \
	"$(INTDIR)\PI_ORBInitializer.obj" \
	"$(INTDIR)\PI_PolicyFactory.obj" \
	"$(INTDIR)\PICurrent.obj" \
	"$(INTDIR)\PICurrent_Impl.obj" \
	"$(INTDIR)\PICurrent_Loader.obj" \
	"$(INTDIR)\PolicyFactory_Loader.obj" \
	"$(INTDIR)\PolicyFactory_Registry.obj" \
	"$(INTDIR)\PolicyFactoryA.obj" \
	"$(INTDIR)\PolicyFactoryC.obj" \
	"$(INTDIR)\ProcessingModePolicy.obj" \
	"$(INTDIR)\RequestInfo_Util.obj" \
	"$(INTDIR)\RequestInterceptor_Adapter_Impl.obj" \
	"$(INTDIR)\PI_includeC.obj" \
	"$(INTDIR)\ORBInitInfoC.obj" \
	"$(INTDIR)\ORBInitializerC.obj" \
	"$(INTDIR)\ClientRequestInterceptorC.obj" \
	"$(INTDIR)\ClientRequestInfoC.obj" \
	"$(INTDIR)\RequestInfoC.obj" \
	"$(INTDIR)\PIForwardRequestC.obj" \
	"$(INTDIR)\PICurrentC.obj" \
	"$(INTDIR)\ProcessingModePolicyC.obj" \
	"$(INTDIR)\InterceptorC.obj" \
	"$(INTDIR)\InvalidSlotC.obj" \
	"$(INTDIR)\ClientRequestInfoA.obj" \
	"$(INTDIR)\ClientRequestInterceptorA.obj" \
	"$(INTDIR)\InterceptorA.obj" \
	"$(INTDIR)\InvalidSlotA.obj" \
	"$(INTDIR)\ORBInitializerA.obj" \
	"$(INTDIR)\PICurrentA.obj" \
	"$(INTDIR)\PIForwardRequestA.obj" \
	"$(INTDIR)\ProcessingModePolicyA.obj" \
	"$(INTDIR)\RequestInfoA.obj"

"$(OUTDIR)\TAO_PIs.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_PIs.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_PIs.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.PI.dep")
!INCLUDE "Makefile.PI.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="ClientRequestDetails.cpp"

"$(INTDIR)\ClientRequestDetails.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ClientRequestDetails.obj" $(SOURCE)

SOURCE="ClientRequestInfo.cpp"

"$(INTDIR)\ClientRequestInfo.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ClientRequestInfo.obj" $(SOURCE)

SOURCE="ClientRequestInterceptor_Adapter_Impl.cpp"

"$(INTDIR)\ClientRequestInterceptor_Adapter_Impl.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ClientRequestInterceptor_Adapter_Impl.obj" $(SOURCE)

SOURCE="ClientRequestInterceptor_Factory_Impl.cpp"

"$(INTDIR)\ClientRequestInterceptor_Factory_Impl.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ClientRequestInterceptor_Factory_Impl.obj" $(SOURCE)

SOURCE="DLL_Resident_ORB_Initializer.cpp"

"$(INTDIR)\DLL_Resident_ORB_Initializer.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\DLL_Resident_ORB_Initializer.obj" $(SOURCE)

SOURCE="ORBInitializer_Registry_Impl.cpp"

"$(INTDIR)\ORBInitializer_Registry_Impl.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ORBInitializer_Registry_Impl.obj" $(SOURCE)

SOURCE="ORBInitInfo.cpp"

"$(INTDIR)\ORBInitInfo.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ORBInitInfo.obj" $(SOURCE)

SOURCE="PI.cpp"

"$(INTDIR)\PI.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PI.obj" $(SOURCE)

SOURCE="PI_ORBInitializer.cpp"

"$(INTDIR)\PI_ORBInitializer.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PI_ORBInitializer.obj" $(SOURCE)

SOURCE="PI_PolicyFactory.cpp"

"$(INTDIR)\PI_PolicyFactory.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PI_PolicyFactory.obj" $(SOURCE)

SOURCE="PICurrent.cpp"

"$(INTDIR)\PICurrent.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PICurrent.obj" $(SOURCE)

SOURCE="PICurrent_Impl.cpp"

"$(INTDIR)\PICurrent_Impl.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PICurrent_Impl.obj" $(SOURCE)

SOURCE="PICurrent_Loader.cpp"

"$(INTDIR)\PICurrent_Loader.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PICurrent_Loader.obj" $(SOURCE)

SOURCE="PolicyFactory_Loader.cpp"

"$(INTDIR)\PolicyFactory_Loader.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PolicyFactory_Loader.obj" $(SOURCE)

SOURCE="PolicyFactory_Registry.cpp"

"$(INTDIR)\PolicyFactory_Registry.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PolicyFactory_Registry.obj" $(SOURCE)

SOURCE="PolicyFactoryA.cpp"

"$(INTDIR)\PolicyFactoryA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PolicyFactoryA.obj" $(SOURCE)

SOURCE="PolicyFactoryC.cpp"

"$(INTDIR)\PolicyFactoryC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PolicyFactoryC.obj" $(SOURCE)

SOURCE="ProcessingModePolicy.cpp"

"$(INTDIR)\ProcessingModePolicy.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ProcessingModePolicy.obj" $(SOURCE)

SOURCE="RequestInfo_Util.cpp"

"$(INTDIR)\RequestInfo_Util.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RequestInfo_Util.obj" $(SOURCE)

SOURCE="RequestInterceptor_Adapter_Impl.cpp"

"$(INTDIR)\RequestInterceptor_Adapter_Impl.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RequestInterceptor_Adapter_Impl.obj" $(SOURCE)

SOURCE="PI_includeC.cpp"

"$(INTDIR)\PI_includeC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PI_includeC.obj" $(SOURCE)

SOURCE="ORBInitInfoC.cpp"

"$(INTDIR)\ORBInitInfoC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ORBInitInfoC.obj" $(SOURCE)

SOURCE="ORBInitializerC.cpp"

"$(INTDIR)\ORBInitializerC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ORBInitializerC.obj" $(SOURCE)

SOURCE="ClientRequestInterceptorC.cpp"

"$(INTDIR)\ClientRequestInterceptorC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ClientRequestInterceptorC.obj" $(SOURCE)

SOURCE="ClientRequestInfoC.cpp"

"$(INTDIR)\ClientRequestInfoC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ClientRequestInfoC.obj" $(SOURCE)

SOURCE="RequestInfoC.cpp"

"$(INTDIR)\RequestInfoC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RequestInfoC.obj" $(SOURCE)

SOURCE="PIForwardRequestC.cpp"

"$(INTDIR)\PIForwardRequestC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PIForwardRequestC.obj" $(SOURCE)

SOURCE="PICurrentC.cpp"

"$(INTDIR)\PICurrentC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PICurrentC.obj" $(SOURCE)

SOURCE="ProcessingModePolicyC.cpp"

"$(INTDIR)\ProcessingModePolicyC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ProcessingModePolicyC.obj" $(SOURCE)

SOURCE="InterceptorC.cpp"

"$(INTDIR)\InterceptorC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\InterceptorC.obj" $(SOURCE)

SOURCE="InvalidSlotC.cpp"

"$(INTDIR)\InvalidSlotC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\InvalidSlotC.obj" $(SOURCE)

SOURCE="ClientRequestInfoA.cpp"

"$(INTDIR)\ClientRequestInfoA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ClientRequestInfoA.obj" $(SOURCE)

SOURCE="ClientRequestInterceptorA.cpp"

"$(INTDIR)\ClientRequestInterceptorA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ClientRequestInterceptorA.obj" $(SOURCE)

SOURCE="InterceptorA.cpp"

"$(INTDIR)\InterceptorA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\InterceptorA.obj" $(SOURCE)

SOURCE="InvalidSlotA.cpp"

"$(INTDIR)\InvalidSlotA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\InvalidSlotA.obj" $(SOURCE)

SOURCE="ORBInitializerA.cpp"

"$(INTDIR)\ORBInitializerA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ORBInitializerA.obj" $(SOURCE)

SOURCE="PICurrentA.cpp"

"$(INTDIR)\PICurrentA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PICurrentA.obj" $(SOURCE)

SOURCE="PIForwardRequestA.cpp"

"$(INTDIR)\PIForwardRequestA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PIForwardRequestA.obj" $(SOURCE)

SOURCE="ProcessingModePolicyA.cpp"

"$(INTDIR)\ProcessingModePolicyA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ProcessingModePolicyA.obj" $(SOURCE)

SOURCE="RequestInfoA.cpp"

"$(INTDIR)\RequestInfoA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RequestInfoA.obj" $(SOURCE)

!IF  "$(CFG)" == "Win64 Debug"
!ELSEIF  "$(CFG)" == "Win64 Release"
!ELSEIF  "$(CFG)" == "Win64 Static Debug"
!ELSEIF  "$(CFG)" == "Win64 Static Release"
!ENDIF

SOURCE="TAO_PI.rc"

"$(INTDIR)\TAO_PI.res" : $(SOURCE)
	$(RSC) /l 0x409 /fo"$(INTDIR)\TAO_PI.res" /d NDEBUG /d WIN64 /d _CRT_SECURE_NO_WARNINGS /d _CRT_SECURE_NO_DEPRECATE /d _CRT_NONSTDC_NO_DEPRECATE /i "..\..\.." /i "..\.." $(SOURCE)



!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.PI.dep")
	@echo Using "Makefile.PI.dep"
!ELSE
	@echo Warning: cannot find "Makefile.PI.dep"
!ENDIF
!ENDIF

