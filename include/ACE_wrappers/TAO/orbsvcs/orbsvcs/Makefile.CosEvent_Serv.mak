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
!MESSAGE NMAKE /f "Makefile.CosEvent_Serv.mak" CFG="Win64 Debug"
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
INTDIR=Debug\CosEvent_Serv\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_CosEvent_Servd.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -DTAO_EVENT_SERV_BUILD_DLL -f "Makefile.CosEvent_Serv.dep" "CosEvent\CEC_TypedEvent.cpp" "CosEvent\CEC_TypedEventChannel.cpp" "CosEvent\CEC_TypedProxyPushConsumer.cpp" "CosEvent\CEC_TypedConsumerAdmin.cpp" "CosEvent\CEC_TypedSupplierAdmin.cpp" "CosEvent\CEC_DynamicImplementation.cpp" "CosEvent\CEC_ConsumerAdmin.cpp" "CosEvent\CEC_ConsumerControl.cpp" "CosEvent\CEC_Default_Factory.cpp" "CosEvent\CEC_Dispatching.cpp" "CosEvent\CEC_Dispatching_Task.cpp" "CosEvent\CEC_EventChannel.cpp" "CosEvent\CEC_Event_Loader.cpp" "CosEvent\CEC_Factory.cpp" "CosEvent\CEC_MT_Dispatching.cpp" "CosEvent\CEC_ProxyPullConsumer.cpp" "CosEvent\CEC_ProxyPullSupplier.cpp" "CosEvent\CEC_ProxyPushConsumer.cpp" "CosEvent\CEC_ProxyPushSupplier.cpp" "CosEvent\CEC_Pulling_Strategy.cpp" "CosEvent\CEC_Reactive_ConsumerControl.cpp" "CosEvent\CEC_Reactive_Pulling_Strategy.cpp" "CosEvent\CEC_Reactive_SupplierControl.cpp" "CosEvent\CEC_SupplierAdmin.cpp" "CosEvent\CEC_SupplierControl.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_CosEvent_Servd.pdb"
	-@del /f/q "..\..\..\lib\TAO_CosEvent_Servd.dll"
	-@del /f/q "$(OUTDIR)\TAO_CosEvent_Servd.lib"
	-@del /f/q "$(OUTDIR)\TAO_CosEvent_Servd.exp"
	-@del /f/q "$(OUTDIR)\TAO_CosEvent_Servd.ilk"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\CosEvent_Serv\$(NULL)" mkdir "Debug\CosEvent_Serv"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D TAO_EVENT_SERV_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_CosEventd.lib TAO_PortableServerd.lib TAO_CosEvent_Skeld.lib TAO_Valuetyped.lib TAO_CodecFactoryd.lib TAO_PId.lib TAO_Messagingd.lib TAO_DynamicInterfaced.lib TAO_IFR_Clientd.lib TAO_CosNamingd.lib TAO_Svc_Utilsd.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\..\lib\TAO_CosEvent_Servd.pdb" /machine:IA64 /out:"..\..\..\lib\TAO_CosEvent_Servd.dll" /implib:"$(OUTDIR)\TAO_CosEvent_Servd.lib"
LINK32_OBJS= \
	"$(INTDIR)\CosEvent_Serv.res" \
	"$(INTDIR)\CosEvent\CEC_TypedEvent.obj" \
	"$(INTDIR)\CosEvent\CEC_TypedEventChannel.obj" \
	"$(INTDIR)\CosEvent\CEC_TypedProxyPushConsumer.obj" \
	"$(INTDIR)\CosEvent\CEC_TypedConsumerAdmin.obj" \
	"$(INTDIR)\CosEvent\CEC_TypedSupplierAdmin.obj" \
	"$(INTDIR)\CosEvent\CEC_DynamicImplementation.obj" \
	"$(INTDIR)\CosEvent\CEC_ConsumerAdmin.obj" \
	"$(INTDIR)\CosEvent\CEC_ConsumerControl.obj" \
	"$(INTDIR)\CosEvent\CEC_Default_Factory.obj" \
	"$(INTDIR)\CosEvent\CEC_Dispatching.obj" \
	"$(INTDIR)\CosEvent\CEC_Dispatching_Task.obj" \
	"$(INTDIR)\CosEvent\CEC_EventChannel.obj" \
	"$(INTDIR)\CosEvent\CEC_Event_Loader.obj" \
	"$(INTDIR)\CosEvent\CEC_Factory.obj" \
	"$(INTDIR)\CosEvent\CEC_MT_Dispatching.obj" \
	"$(INTDIR)\CosEvent\CEC_ProxyPullConsumer.obj" \
	"$(INTDIR)\CosEvent\CEC_ProxyPullSupplier.obj" \
	"$(INTDIR)\CosEvent\CEC_ProxyPushConsumer.obj" \
	"$(INTDIR)\CosEvent\CEC_ProxyPushSupplier.obj" \
	"$(INTDIR)\CosEvent\CEC_Pulling_Strategy.obj" \
	"$(INTDIR)\CosEvent\CEC_Reactive_ConsumerControl.obj" \
	"$(INTDIR)\CosEvent\CEC_Reactive_Pulling_Strategy.obj" \
	"$(INTDIR)\CosEvent\CEC_Reactive_SupplierControl.obj" \
	"$(INTDIR)\CosEvent\CEC_SupplierAdmin.obj" \
	"$(INTDIR)\CosEvent\CEC_SupplierControl.obj"

"..\..\..\lib\TAO_CosEvent_Servd.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_CosEvent_Servd.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_CosEvent_Servd.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\CosEvent_Serv\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_CosEvent_Serv.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -DTAO_EVENT_SERV_BUILD_DLL -f "Makefile.CosEvent_Serv.dep" "CosEvent\CEC_TypedEvent.cpp" "CosEvent\CEC_TypedEventChannel.cpp" "CosEvent\CEC_TypedProxyPushConsumer.cpp" "CosEvent\CEC_TypedConsumerAdmin.cpp" "CosEvent\CEC_TypedSupplierAdmin.cpp" "CosEvent\CEC_DynamicImplementation.cpp" "CosEvent\CEC_ConsumerAdmin.cpp" "CosEvent\CEC_ConsumerControl.cpp" "CosEvent\CEC_Default_Factory.cpp" "CosEvent\CEC_Dispatching.cpp" "CosEvent\CEC_Dispatching_Task.cpp" "CosEvent\CEC_EventChannel.cpp" "CosEvent\CEC_Event_Loader.cpp" "CosEvent\CEC_Factory.cpp" "CosEvent\CEC_MT_Dispatching.cpp" "CosEvent\CEC_ProxyPullConsumer.cpp" "CosEvent\CEC_ProxyPullSupplier.cpp" "CosEvent\CEC_ProxyPushConsumer.cpp" "CosEvent\CEC_ProxyPushSupplier.cpp" "CosEvent\CEC_Pulling_Strategy.cpp" "CosEvent\CEC_Reactive_ConsumerControl.cpp" "CosEvent\CEC_Reactive_Pulling_Strategy.cpp" "CosEvent\CEC_Reactive_SupplierControl.cpp" "CosEvent\CEC_SupplierAdmin.cpp" "CosEvent\CEC_SupplierControl.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\TAO_CosEvent_Serv.dll"
	-@del /f/q "$(OUTDIR)\TAO_CosEvent_Serv.lib"
	-@del /f/q "$(OUTDIR)\TAO_CosEvent_Serv.exp"
	-@del /f/q "$(OUTDIR)\TAO_CosEvent_Serv.ilk"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\CosEvent_Serv\$(NULL)" mkdir "Release\CosEvent_Serv"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D TAO_EVENT_SERV_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_CosEvent.lib TAO_PortableServer.lib TAO_CosEvent_Skel.lib TAO_Valuetype.lib TAO_CodecFactory.lib TAO_PI.lib TAO_Messaging.lib TAO_DynamicInterface.lib TAO_IFR_Client.lib TAO_CosNaming.lib TAO_Svc_Utils.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\..\lib\TAO_CosEvent_Serv.dll" /implib:"$(OUTDIR)\TAO_CosEvent_Serv.lib"
LINK32_OBJS= \
	"$(INTDIR)\CosEvent_Serv.res" \
	"$(INTDIR)\CosEvent\CEC_TypedEvent.obj" \
	"$(INTDIR)\CosEvent\CEC_TypedEventChannel.obj" \
	"$(INTDIR)\CosEvent\CEC_TypedProxyPushConsumer.obj" \
	"$(INTDIR)\CosEvent\CEC_TypedConsumerAdmin.obj" \
	"$(INTDIR)\CosEvent\CEC_TypedSupplierAdmin.obj" \
	"$(INTDIR)\CosEvent\CEC_DynamicImplementation.obj" \
	"$(INTDIR)\CosEvent\CEC_ConsumerAdmin.obj" \
	"$(INTDIR)\CosEvent\CEC_ConsumerControl.obj" \
	"$(INTDIR)\CosEvent\CEC_Default_Factory.obj" \
	"$(INTDIR)\CosEvent\CEC_Dispatching.obj" \
	"$(INTDIR)\CosEvent\CEC_Dispatching_Task.obj" \
	"$(INTDIR)\CosEvent\CEC_EventChannel.obj" \
	"$(INTDIR)\CosEvent\CEC_Event_Loader.obj" \
	"$(INTDIR)\CosEvent\CEC_Factory.obj" \
	"$(INTDIR)\CosEvent\CEC_MT_Dispatching.obj" \
	"$(INTDIR)\CosEvent\CEC_ProxyPullConsumer.obj" \
	"$(INTDIR)\CosEvent\CEC_ProxyPullSupplier.obj" \
	"$(INTDIR)\CosEvent\CEC_ProxyPushConsumer.obj" \
	"$(INTDIR)\CosEvent\CEC_ProxyPushSupplier.obj" \
	"$(INTDIR)\CosEvent\CEC_Pulling_Strategy.obj" \
	"$(INTDIR)\CosEvent\CEC_Reactive_ConsumerControl.obj" \
	"$(INTDIR)\CosEvent\CEC_Reactive_Pulling_Strategy.obj" \
	"$(INTDIR)\CosEvent\CEC_Reactive_SupplierControl.obj" \
	"$(INTDIR)\CosEvent\CEC_SupplierAdmin.obj" \
	"$(INTDIR)\CosEvent\CEC_SupplierControl.obj"

"..\..\..\lib\TAO_CosEvent_Serv.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_CosEvent_Serv.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_CosEvent_Serv.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\CosEvent_Serv\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_CosEvent_Servsd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.CosEvent_Serv.dep" "CosEvent\CEC_TypedEvent.cpp" "CosEvent\CEC_TypedEventChannel.cpp" "CosEvent\CEC_TypedProxyPushConsumer.cpp" "CosEvent\CEC_TypedConsumerAdmin.cpp" "CosEvent\CEC_TypedSupplierAdmin.cpp" "CosEvent\CEC_DynamicImplementation.cpp" "CosEvent\CEC_ConsumerAdmin.cpp" "CosEvent\CEC_ConsumerControl.cpp" "CosEvent\CEC_Default_Factory.cpp" "CosEvent\CEC_Dispatching.cpp" "CosEvent\CEC_Dispatching_Task.cpp" "CosEvent\CEC_EventChannel.cpp" "CosEvent\CEC_Event_Loader.cpp" "CosEvent\CEC_Factory.cpp" "CosEvent\CEC_MT_Dispatching.cpp" "CosEvent\CEC_ProxyPullConsumer.cpp" "CosEvent\CEC_ProxyPullSupplier.cpp" "CosEvent\CEC_ProxyPushConsumer.cpp" "CosEvent\CEC_ProxyPushSupplier.cpp" "CosEvent\CEC_Pulling_Strategy.cpp" "CosEvent\CEC_Reactive_ConsumerControl.cpp" "CosEvent\CEC_Reactive_Pulling_Strategy.cpp" "CosEvent\CEC_Reactive_SupplierControl.cpp" "CosEvent\CEC_SupplierAdmin.cpp" "CosEvent\CEC_SupplierControl.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_CosEvent_Servsd.lib"
	-@del /f/q "$(OUTDIR)\TAO_CosEvent_Servsd.exp"
	-@del /f/q "$(OUTDIR)\TAO_CosEvent_Servsd.ilk"
	-@del /f/q "..\..\..\lib\TAO_CosEvent_Servsd.pdb"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\CosEvent_Serv\$(NULL)" mkdir "Static_Debug\CosEvent_Serv"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\TAO_CosEvent_Servsd.pdb" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_CosEvent_Servsd.lib"
LINK32_OBJS= \
	"$(INTDIR)\CosEvent\CEC_TypedEvent.obj" \
	"$(INTDIR)\CosEvent\CEC_TypedEventChannel.obj" \
	"$(INTDIR)\CosEvent\CEC_TypedProxyPushConsumer.obj" \
	"$(INTDIR)\CosEvent\CEC_TypedConsumerAdmin.obj" \
	"$(INTDIR)\CosEvent\CEC_TypedSupplierAdmin.obj" \
	"$(INTDIR)\CosEvent\CEC_DynamicImplementation.obj" \
	"$(INTDIR)\CosEvent\CEC_ConsumerAdmin.obj" \
	"$(INTDIR)\CosEvent\CEC_ConsumerControl.obj" \
	"$(INTDIR)\CosEvent\CEC_Default_Factory.obj" \
	"$(INTDIR)\CosEvent\CEC_Dispatching.obj" \
	"$(INTDIR)\CosEvent\CEC_Dispatching_Task.obj" \
	"$(INTDIR)\CosEvent\CEC_EventChannel.obj" \
	"$(INTDIR)\CosEvent\CEC_Event_Loader.obj" \
	"$(INTDIR)\CosEvent\CEC_Factory.obj" \
	"$(INTDIR)\CosEvent\CEC_MT_Dispatching.obj" \
	"$(INTDIR)\CosEvent\CEC_ProxyPullConsumer.obj" \
	"$(INTDIR)\CosEvent\CEC_ProxyPullSupplier.obj" \
	"$(INTDIR)\CosEvent\CEC_ProxyPushConsumer.obj" \
	"$(INTDIR)\CosEvent\CEC_ProxyPushSupplier.obj" \
	"$(INTDIR)\CosEvent\CEC_Pulling_Strategy.obj" \
	"$(INTDIR)\CosEvent\CEC_Reactive_ConsumerControl.obj" \
	"$(INTDIR)\CosEvent\CEC_Reactive_Pulling_Strategy.obj" \
	"$(INTDIR)\CosEvent\CEC_Reactive_SupplierControl.obj" \
	"$(INTDIR)\CosEvent\CEC_SupplierAdmin.obj" \
	"$(INTDIR)\CosEvent\CEC_SupplierControl.obj"

"$(OUTDIR)\TAO_CosEvent_Servsd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_CosEvent_Servsd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_CosEvent_Servsd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\CosEvent_Serv\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_CosEvent_Servs.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.CosEvent_Serv.dep" "CosEvent\CEC_TypedEvent.cpp" "CosEvent\CEC_TypedEventChannel.cpp" "CosEvent\CEC_TypedProxyPushConsumer.cpp" "CosEvent\CEC_TypedConsumerAdmin.cpp" "CosEvent\CEC_TypedSupplierAdmin.cpp" "CosEvent\CEC_DynamicImplementation.cpp" "CosEvent\CEC_ConsumerAdmin.cpp" "CosEvent\CEC_ConsumerControl.cpp" "CosEvent\CEC_Default_Factory.cpp" "CosEvent\CEC_Dispatching.cpp" "CosEvent\CEC_Dispatching_Task.cpp" "CosEvent\CEC_EventChannel.cpp" "CosEvent\CEC_Event_Loader.cpp" "CosEvent\CEC_Factory.cpp" "CosEvent\CEC_MT_Dispatching.cpp" "CosEvent\CEC_ProxyPullConsumer.cpp" "CosEvent\CEC_ProxyPullSupplier.cpp" "CosEvent\CEC_ProxyPushConsumer.cpp" "CosEvent\CEC_ProxyPushSupplier.cpp" "CosEvent\CEC_Pulling_Strategy.cpp" "CosEvent\CEC_Reactive_ConsumerControl.cpp" "CosEvent\CEC_Reactive_Pulling_Strategy.cpp" "CosEvent\CEC_Reactive_SupplierControl.cpp" "CosEvent\CEC_SupplierAdmin.cpp" "CosEvent\CEC_SupplierControl.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_CosEvent_Servs.lib"
	-@del /f/q "$(OUTDIR)\TAO_CosEvent_Servs.exp"
	-@del /f/q "$(OUTDIR)\TAO_CosEvent_Servs.ilk"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\CosEvent_Serv\$(NULL)" mkdir "Static_Release\CosEvent_Serv"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_CosEvent_Servs.lib"
LINK32_OBJS= \
	"$(INTDIR)\CosEvent\CEC_TypedEvent.obj" \
	"$(INTDIR)\CosEvent\CEC_TypedEventChannel.obj" \
	"$(INTDIR)\CosEvent\CEC_TypedProxyPushConsumer.obj" \
	"$(INTDIR)\CosEvent\CEC_TypedConsumerAdmin.obj" \
	"$(INTDIR)\CosEvent\CEC_TypedSupplierAdmin.obj" \
	"$(INTDIR)\CosEvent\CEC_DynamicImplementation.obj" \
	"$(INTDIR)\CosEvent\CEC_ConsumerAdmin.obj" \
	"$(INTDIR)\CosEvent\CEC_ConsumerControl.obj" \
	"$(INTDIR)\CosEvent\CEC_Default_Factory.obj" \
	"$(INTDIR)\CosEvent\CEC_Dispatching.obj" \
	"$(INTDIR)\CosEvent\CEC_Dispatching_Task.obj" \
	"$(INTDIR)\CosEvent\CEC_EventChannel.obj" \
	"$(INTDIR)\CosEvent\CEC_Event_Loader.obj" \
	"$(INTDIR)\CosEvent\CEC_Factory.obj" \
	"$(INTDIR)\CosEvent\CEC_MT_Dispatching.obj" \
	"$(INTDIR)\CosEvent\CEC_ProxyPullConsumer.obj" \
	"$(INTDIR)\CosEvent\CEC_ProxyPullSupplier.obj" \
	"$(INTDIR)\CosEvent\CEC_ProxyPushConsumer.obj" \
	"$(INTDIR)\CosEvent\CEC_ProxyPushSupplier.obj" \
	"$(INTDIR)\CosEvent\CEC_Pulling_Strategy.obj" \
	"$(INTDIR)\CosEvent\CEC_Reactive_ConsumerControl.obj" \
	"$(INTDIR)\CosEvent\CEC_Reactive_Pulling_Strategy.obj" \
	"$(INTDIR)\CosEvent\CEC_Reactive_SupplierControl.obj" \
	"$(INTDIR)\CosEvent\CEC_SupplierAdmin.obj" \
	"$(INTDIR)\CosEvent\CEC_SupplierControl.obj"

"$(OUTDIR)\TAO_CosEvent_Servs.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_CosEvent_Servs.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_CosEvent_Servs.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.CosEvent_Serv.dep")
!INCLUDE "Makefile.CosEvent_Serv.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="CosEvent\CEC_TypedEvent.cpp"

"$(INTDIR)\CosEvent\CEC_TypedEvent.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\CosEvent\$(NULL)" mkdir "$(INTDIR)\CosEvent\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\CosEvent\CEC_TypedEvent.obj" $(SOURCE)

SOURCE="CosEvent\CEC_TypedEventChannel.cpp"

"$(INTDIR)\CosEvent\CEC_TypedEventChannel.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\CosEvent\$(NULL)" mkdir "$(INTDIR)\CosEvent\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\CosEvent\CEC_TypedEventChannel.obj" $(SOURCE)

SOURCE="CosEvent\CEC_TypedProxyPushConsumer.cpp"

"$(INTDIR)\CosEvent\CEC_TypedProxyPushConsumer.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\CosEvent\$(NULL)" mkdir "$(INTDIR)\CosEvent\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\CosEvent\CEC_TypedProxyPushConsumer.obj" $(SOURCE)

SOURCE="CosEvent\CEC_TypedConsumerAdmin.cpp"

"$(INTDIR)\CosEvent\CEC_TypedConsumerAdmin.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\CosEvent\$(NULL)" mkdir "$(INTDIR)\CosEvent\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\CosEvent\CEC_TypedConsumerAdmin.obj" $(SOURCE)

SOURCE="CosEvent\CEC_TypedSupplierAdmin.cpp"

"$(INTDIR)\CosEvent\CEC_TypedSupplierAdmin.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\CosEvent\$(NULL)" mkdir "$(INTDIR)\CosEvent\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\CosEvent\CEC_TypedSupplierAdmin.obj" $(SOURCE)

SOURCE="CosEvent\CEC_DynamicImplementation.cpp"

"$(INTDIR)\CosEvent\CEC_DynamicImplementation.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\CosEvent\$(NULL)" mkdir "$(INTDIR)\CosEvent\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\CosEvent\CEC_DynamicImplementation.obj" $(SOURCE)

SOURCE="CosEvent\CEC_ConsumerAdmin.cpp"

"$(INTDIR)\CosEvent\CEC_ConsumerAdmin.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\CosEvent\$(NULL)" mkdir "$(INTDIR)\CosEvent\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\CosEvent\CEC_ConsumerAdmin.obj" $(SOURCE)

SOURCE="CosEvent\CEC_ConsumerControl.cpp"

"$(INTDIR)\CosEvent\CEC_ConsumerControl.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\CosEvent\$(NULL)" mkdir "$(INTDIR)\CosEvent\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\CosEvent\CEC_ConsumerControl.obj" $(SOURCE)

SOURCE="CosEvent\CEC_Default_Factory.cpp"

"$(INTDIR)\CosEvent\CEC_Default_Factory.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\CosEvent\$(NULL)" mkdir "$(INTDIR)\CosEvent\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\CosEvent\CEC_Default_Factory.obj" $(SOURCE)

SOURCE="CosEvent\CEC_Dispatching.cpp"

"$(INTDIR)\CosEvent\CEC_Dispatching.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\CosEvent\$(NULL)" mkdir "$(INTDIR)\CosEvent\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\CosEvent\CEC_Dispatching.obj" $(SOURCE)

SOURCE="CosEvent\CEC_Dispatching_Task.cpp"

"$(INTDIR)\CosEvent\CEC_Dispatching_Task.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\CosEvent\$(NULL)" mkdir "$(INTDIR)\CosEvent\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\CosEvent\CEC_Dispatching_Task.obj" $(SOURCE)

SOURCE="CosEvent\CEC_EventChannel.cpp"

"$(INTDIR)\CosEvent\CEC_EventChannel.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\CosEvent\$(NULL)" mkdir "$(INTDIR)\CosEvent\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\CosEvent\CEC_EventChannel.obj" $(SOURCE)

SOURCE="CosEvent\CEC_Event_Loader.cpp"

"$(INTDIR)\CosEvent\CEC_Event_Loader.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\CosEvent\$(NULL)" mkdir "$(INTDIR)\CosEvent\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\CosEvent\CEC_Event_Loader.obj" $(SOURCE)

SOURCE="CosEvent\CEC_Factory.cpp"

"$(INTDIR)\CosEvent\CEC_Factory.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\CosEvent\$(NULL)" mkdir "$(INTDIR)\CosEvent\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\CosEvent\CEC_Factory.obj" $(SOURCE)

SOURCE="CosEvent\CEC_MT_Dispatching.cpp"

"$(INTDIR)\CosEvent\CEC_MT_Dispatching.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\CosEvent\$(NULL)" mkdir "$(INTDIR)\CosEvent\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\CosEvent\CEC_MT_Dispatching.obj" $(SOURCE)

SOURCE="CosEvent\CEC_ProxyPullConsumer.cpp"

"$(INTDIR)\CosEvent\CEC_ProxyPullConsumer.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\CosEvent\$(NULL)" mkdir "$(INTDIR)\CosEvent\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\CosEvent\CEC_ProxyPullConsumer.obj" $(SOURCE)

SOURCE="CosEvent\CEC_ProxyPullSupplier.cpp"

"$(INTDIR)\CosEvent\CEC_ProxyPullSupplier.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\CosEvent\$(NULL)" mkdir "$(INTDIR)\CosEvent\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\CosEvent\CEC_ProxyPullSupplier.obj" $(SOURCE)

SOURCE="CosEvent\CEC_ProxyPushConsumer.cpp"

"$(INTDIR)\CosEvent\CEC_ProxyPushConsumer.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\CosEvent\$(NULL)" mkdir "$(INTDIR)\CosEvent\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\CosEvent\CEC_ProxyPushConsumer.obj" $(SOURCE)

SOURCE="CosEvent\CEC_ProxyPushSupplier.cpp"

"$(INTDIR)\CosEvent\CEC_ProxyPushSupplier.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\CosEvent\$(NULL)" mkdir "$(INTDIR)\CosEvent\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\CosEvent\CEC_ProxyPushSupplier.obj" $(SOURCE)

SOURCE="CosEvent\CEC_Pulling_Strategy.cpp"

"$(INTDIR)\CosEvent\CEC_Pulling_Strategy.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\CosEvent\$(NULL)" mkdir "$(INTDIR)\CosEvent\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\CosEvent\CEC_Pulling_Strategy.obj" $(SOURCE)

SOURCE="CosEvent\CEC_Reactive_ConsumerControl.cpp"

"$(INTDIR)\CosEvent\CEC_Reactive_ConsumerControl.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\CosEvent\$(NULL)" mkdir "$(INTDIR)\CosEvent\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\CosEvent\CEC_Reactive_ConsumerControl.obj" $(SOURCE)

SOURCE="CosEvent\CEC_Reactive_Pulling_Strategy.cpp"

"$(INTDIR)\CosEvent\CEC_Reactive_Pulling_Strategy.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\CosEvent\$(NULL)" mkdir "$(INTDIR)\CosEvent\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\CosEvent\CEC_Reactive_Pulling_Strategy.obj" $(SOURCE)

SOURCE="CosEvent\CEC_Reactive_SupplierControl.cpp"

"$(INTDIR)\CosEvent\CEC_Reactive_SupplierControl.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\CosEvent\$(NULL)" mkdir "$(INTDIR)\CosEvent\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\CosEvent\CEC_Reactive_SupplierControl.obj" $(SOURCE)

SOURCE="CosEvent\CEC_SupplierAdmin.cpp"

"$(INTDIR)\CosEvent\CEC_SupplierAdmin.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\CosEvent\$(NULL)" mkdir "$(INTDIR)\CosEvent\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\CosEvent\CEC_SupplierAdmin.obj" $(SOURCE)

SOURCE="CosEvent\CEC_SupplierControl.cpp"

"$(INTDIR)\CosEvent\CEC_SupplierControl.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\CosEvent\$(NULL)" mkdir "$(INTDIR)\CosEvent\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\CosEvent\CEC_SupplierControl.obj" $(SOURCE)

!IF  "$(CFG)" == "Win64 Debug"
!ELSEIF  "$(CFG)" == "Win64 Release"
!ELSEIF  "$(CFG)" == "Win64 Static Debug"
!ELSEIF  "$(CFG)" == "Win64 Static Release"
!ENDIF

SOURCE="CosEvent_Serv.rc"

"$(INTDIR)\CosEvent_Serv.res" : $(SOURCE)
	$(RSC) /l 0x409 /fo"$(INTDIR)\CosEvent_Serv.res" /d NDEBUG /d WIN64 /d _CRT_SECURE_NO_WARNINGS /d _CRT_SECURE_NO_DEPRECATE /d _CRT_NONSTDC_NO_DEPRECATE /d TAO_HAS_TYPED_EVENT_CHANNEL /i "..\..\.." /i "..\.." /i "..\..\orbsvcs" $(SOURCE)



!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.CosEvent_Serv.dep")
	@echo Using "Makefile.CosEvent_Serv.dep"
!ELSE
	@echo Warning: cannot find "Makefile.CosEvent_Serv.dep"
!ENDIF
!ENDIF

