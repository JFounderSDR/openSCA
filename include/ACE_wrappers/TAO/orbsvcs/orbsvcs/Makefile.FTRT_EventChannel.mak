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
!MESSAGE NMAKE /f "Makefile.FTRT_EventChannel.mak" CFG="Win64 Debug"
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
INTDIR=Debug\FTRT_EventChannel\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_FTRT_EventChanneld.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_FTRTEC_BUILD_DLL -f "Makefile.FTRT_EventChannel.dep" "FtRtEvent\EventChannel\Set_Update_Interceptor.cpp" "FtRtEvent\EventChannel\FTEC_Factory.cpp" "FtRtEvent\EventChannel\FTEC_ConsumerAdmin.cpp" "FtRtEvent\EventChannel\Dynamic_Bitset.cpp" "FtRtEvent\EventChannel\create_persistent_poa.cpp" "FtRtEvent\EventChannel\FTEC_Event_Channel.cpp" "FtRtEvent\EventChannel\Fault_Detector_Loader.cpp" "FtRtEvent\EventChannel\Replication_Strategy.cpp" "FtRtEvent\EventChannel\FTEC_Become_Primary_Listener.cpp" "FtRtEvent\EventChannel\ProxySupplierStateWorker.cpp" "FtRtEvent\EventChannel\FTEC_Group_Manager.cpp" "FtRtEvent\EventChannel\IOGR_Maker.cpp" "FtRtEvent\EventChannel\SCTP_Fault_Detector.cpp" "FtRtEvent\EventChannel\UpdateableHandler.cpp" "FtRtEvent\EventChannel\FTEC_ORBInitializer.cpp" "FtRtEvent\EventChannel\FTEC_ProxyConsumer.cpp" "FtRtEvent\EventChannel\ObjectGroupManagerHandler.cpp" "FtRtEvent\EventChannel\FT_ProxyAdmin_Base.cpp" "FtRtEvent\EventChannel\ProxyConsumerStateWorker.cpp" "FtRtEvent\EventChannel\AMI_Primary_Replication_Strategy.cpp" "FtRtEvent\EventChannel\FTEC_ProxySupplier.cpp" "FtRtEvent\EventChannel\Fault_Detector.cpp" "FtRtEvent\EventChannel\ForwardCtrlServerInterceptor.cpp" "FtRtEvent\EventChannel\Basic_Replication_Strategy.cpp" "FtRtEvent\EventChannel\Replication_Service.cpp" "FtRtEvent\EventChannel\Request_Context_Repository.cpp" "FtRtEvent\EventChannel\AMI_Replication_Strategy.cpp" "FtRtEvent\EventChannel\FtEventServiceInterceptor.cpp" "FtRtEvent\EventChannel\FTEC_SupplierAdmin.cpp" "FtRtEvent\EventChannel\Update_Manager.cpp" "FtRtEvent\EventChannel\FTEC_Event_Channel_Impl.cpp" "FtRtEvent\EventChannel\GroupInfoPublisher.cpp" "FtRtEvent\EventChannel\Identification_Service.cpp" "FtRtEvent\EventChannel\replace_key.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_FTRT_EventChanneld.pdb"
	-@del /f/q "..\..\..\lib\TAO_FTRT_EventChanneld.dll"
	-@del /f/q "$(OUTDIR)\TAO_FTRT_EventChanneld.lib"
	-@del /f/q "$(OUTDIR)\TAO_FTRT_EventChanneld.exp"
	-@del /f/q "$(OUTDIR)\TAO_FTRT_EventChanneld.ilk"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\FTRT_EventChannel\$(NULL)" mkdir "Debug\FTRT_EventChannel"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_FTRTEC_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_IORManipd.lib TAO_PortableServerd.lib TAO_CosNamingd.lib TAO_Valuetyped.lib TAO_CodecFactoryd.lib TAO_PId.lib TAO_Messagingd.lib TAO_PortableGroupd.lib TAO_FTORB_Utilsd.lib TAO_Svc_Utilsd.lib TAO_RTEventd.lib TAO_RTEvent_Skeld.lib TAO_RTEvent_Servd.lib TAO_PI_Serverd.lib TAO_FtRtEventd.lib TAO_Utilsd.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\..\lib\TAO_FTRT_EventChanneld.pdb" /machine:IA64 /out:"..\..\..\lib\TAO_FTRT_EventChanneld.dll" /implib:"$(OUTDIR)\TAO_FTRT_EventChanneld.lib"
LINK32_OBJS= \
	"$(INTDIR)\FtRtEvent\EventChannel\Set_Update_Interceptor.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\FTEC_Factory.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\FTEC_ConsumerAdmin.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\Dynamic_Bitset.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\create_persistent_poa.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\FTEC_Event_Channel.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\Fault_Detector_Loader.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\Replication_Strategy.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\FTEC_Become_Primary_Listener.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\ProxySupplierStateWorker.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\FTEC_Group_Manager.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\IOGR_Maker.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\SCTP_Fault_Detector.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\UpdateableHandler.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\FTEC_ORBInitializer.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\FTEC_ProxyConsumer.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\ObjectGroupManagerHandler.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\FT_ProxyAdmin_Base.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\ProxyConsumerStateWorker.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\AMI_Primary_Replication_Strategy.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\FTEC_ProxySupplier.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\Fault_Detector.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\ForwardCtrlServerInterceptor.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\Basic_Replication_Strategy.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\Replication_Service.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\Request_Context_Repository.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\AMI_Replication_Strategy.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\FtEventServiceInterceptor.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\FTEC_SupplierAdmin.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\Update_Manager.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\FTEC_Event_Channel_Impl.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\GroupInfoPublisher.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\Identification_Service.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\replace_key.obj"

"..\..\..\lib\TAO_FTRT_EventChanneld.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_FTRT_EventChanneld.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_FTRT_EventChanneld.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\FTRT_EventChannel\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_FTRT_EventChannel.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_FTRTEC_BUILD_DLL -f "Makefile.FTRT_EventChannel.dep" "FtRtEvent\EventChannel\Set_Update_Interceptor.cpp" "FtRtEvent\EventChannel\FTEC_Factory.cpp" "FtRtEvent\EventChannel\FTEC_ConsumerAdmin.cpp" "FtRtEvent\EventChannel\Dynamic_Bitset.cpp" "FtRtEvent\EventChannel\create_persistent_poa.cpp" "FtRtEvent\EventChannel\FTEC_Event_Channel.cpp" "FtRtEvent\EventChannel\Fault_Detector_Loader.cpp" "FtRtEvent\EventChannel\Replication_Strategy.cpp" "FtRtEvent\EventChannel\FTEC_Become_Primary_Listener.cpp" "FtRtEvent\EventChannel\ProxySupplierStateWorker.cpp" "FtRtEvent\EventChannel\FTEC_Group_Manager.cpp" "FtRtEvent\EventChannel\IOGR_Maker.cpp" "FtRtEvent\EventChannel\SCTP_Fault_Detector.cpp" "FtRtEvent\EventChannel\UpdateableHandler.cpp" "FtRtEvent\EventChannel\FTEC_ORBInitializer.cpp" "FtRtEvent\EventChannel\FTEC_ProxyConsumer.cpp" "FtRtEvent\EventChannel\ObjectGroupManagerHandler.cpp" "FtRtEvent\EventChannel\FT_ProxyAdmin_Base.cpp" "FtRtEvent\EventChannel\ProxyConsumerStateWorker.cpp" "FtRtEvent\EventChannel\AMI_Primary_Replication_Strategy.cpp" "FtRtEvent\EventChannel\FTEC_ProxySupplier.cpp" "FtRtEvent\EventChannel\Fault_Detector.cpp" "FtRtEvent\EventChannel\ForwardCtrlServerInterceptor.cpp" "FtRtEvent\EventChannel\Basic_Replication_Strategy.cpp" "FtRtEvent\EventChannel\Replication_Service.cpp" "FtRtEvent\EventChannel\Request_Context_Repository.cpp" "FtRtEvent\EventChannel\AMI_Replication_Strategy.cpp" "FtRtEvent\EventChannel\FtEventServiceInterceptor.cpp" "FtRtEvent\EventChannel\FTEC_SupplierAdmin.cpp" "FtRtEvent\EventChannel\Update_Manager.cpp" "FtRtEvent\EventChannel\FTEC_Event_Channel_Impl.cpp" "FtRtEvent\EventChannel\GroupInfoPublisher.cpp" "FtRtEvent\EventChannel\Identification_Service.cpp" "FtRtEvent\EventChannel\replace_key.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\TAO_FTRT_EventChannel.dll"
	-@del /f/q "$(OUTDIR)\TAO_FTRT_EventChannel.lib"
	-@del /f/q "$(OUTDIR)\TAO_FTRT_EventChannel.exp"
	-@del /f/q "$(OUTDIR)\TAO_FTRT_EventChannel.ilk"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\FTRT_EventChannel\$(NULL)" mkdir "Release\FTRT_EventChannel"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_FTRTEC_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_IORManip.lib TAO_PortableServer.lib TAO_CosNaming.lib TAO_Valuetype.lib TAO_CodecFactory.lib TAO_PI.lib TAO_Messaging.lib TAO_PortableGroup.lib TAO_FTORB_Utils.lib TAO_Svc_Utils.lib TAO_RTEvent.lib TAO_RTEvent_Skel.lib TAO_RTEvent_Serv.lib TAO_PI_Server.lib TAO_FtRtEvent.lib TAO_Utils.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\..\lib\TAO_FTRT_EventChannel.dll" /implib:"$(OUTDIR)\TAO_FTRT_EventChannel.lib"
LINK32_OBJS= \
	"$(INTDIR)\FtRtEvent\EventChannel\Set_Update_Interceptor.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\FTEC_Factory.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\FTEC_ConsumerAdmin.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\Dynamic_Bitset.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\create_persistent_poa.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\FTEC_Event_Channel.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\Fault_Detector_Loader.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\Replication_Strategy.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\FTEC_Become_Primary_Listener.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\ProxySupplierStateWorker.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\FTEC_Group_Manager.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\IOGR_Maker.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\SCTP_Fault_Detector.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\UpdateableHandler.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\FTEC_ORBInitializer.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\FTEC_ProxyConsumer.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\ObjectGroupManagerHandler.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\FT_ProxyAdmin_Base.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\ProxyConsumerStateWorker.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\AMI_Primary_Replication_Strategy.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\FTEC_ProxySupplier.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\Fault_Detector.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\ForwardCtrlServerInterceptor.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\Basic_Replication_Strategy.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\Replication_Service.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\Request_Context_Repository.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\AMI_Replication_Strategy.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\FtEventServiceInterceptor.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\FTEC_SupplierAdmin.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\Update_Manager.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\FTEC_Event_Channel_Impl.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\GroupInfoPublisher.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\Identification_Service.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\replace_key.obj"

"..\..\..\lib\TAO_FTRT_EventChannel.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_FTRT_EventChannel.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_FTRT_EventChannel.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\FTRT_EventChannel\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_FTRT_EventChannelsd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.FTRT_EventChannel.dep" "FtRtEvent\EventChannel\Set_Update_Interceptor.cpp" "FtRtEvent\EventChannel\FTEC_Factory.cpp" "FtRtEvent\EventChannel\FTEC_ConsumerAdmin.cpp" "FtRtEvent\EventChannel\Dynamic_Bitset.cpp" "FtRtEvent\EventChannel\create_persistent_poa.cpp" "FtRtEvent\EventChannel\FTEC_Event_Channel.cpp" "FtRtEvent\EventChannel\Fault_Detector_Loader.cpp" "FtRtEvent\EventChannel\Replication_Strategy.cpp" "FtRtEvent\EventChannel\FTEC_Become_Primary_Listener.cpp" "FtRtEvent\EventChannel\ProxySupplierStateWorker.cpp" "FtRtEvent\EventChannel\FTEC_Group_Manager.cpp" "FtRtEvent\EventChannel\IOGR_Maker.cpp" "FtRtEvent\EventChannel\SCTP_Fault_Detector.cpp" "FtRtEvent\EventChannel\UpdateableHandler.cpp" "FtRtEvent\EventChannel\FTEC_ORBInitializer.cpp" "FtRtEvent\EventChannel\FTEC_ProxyConsumer.cpp" "FtRtEvent\EventChannel\ObjectGroupManagerHandler.cpp" "FtRtEvent\EventChannel\FT_ProxyAdmin_Base.cpp" "FtRtEvent\EventChannel\ProxyConsumerStateWorker.cpp" "FtRtEvent\EventChannel\AMI_Primary_Replication_Strategy.cpp" "FtRtEvent\EventChannel\FTEC_ProxySupplier.cpp" "FtRtEvent\EventChannel\Fault_Detector.cpp" "FtRtEvent\EventChannel\ForwardCtrlServerInterceptor.cpp" "FtRtEvent\EventChannel\Basic_Replication_Strategy.cpp" "FtRtEvent\EventChannel\Replication_Service.cpp" "FtRtEvent\EventChannel\Request_Context_Repository.cpp" "FtRtEvent\EventChannel\AMI_Replication_Strategy.cpp" "FtRtEvent\EventChannel\FtEventServiceInterceptor.cpp" "FtRtEvent\EventChannel\FTEC_SupplierAdmin.cpp" "FtRtEvent\EventChannel\Update_Manager.cpp" "FtRtEvent\EventChannel\FTEC_Event_Channel_Impl.cpp" "FtRtEvent\EventChannel\GroupInfoPublisher.cpp" "FtRtEvent\EventChannel\Identification_Service.cpp" "FtRtEvent\EventChannel\replace_key.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_FTRT_EventChannelsd.lib"
	-@del /f/q "$(OUTDIR)\TAO_FTRT_EventChannelsd.exp"
	-@del /f/q "$(OUTDIR)\TAO_FTRT_EventChannelsd.ilk"
	-@del /f/q "..\..\..\lib\TAO_FTRT_EventChannelsd.pdb"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\FTRT_EventChannel\$(NULL)" mkdir "Static_Debug\FTRT_EventChannel"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\TAO_FTRT_EventChannelsd.pdb" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_FTRT_EventChannelsd.lib"
LINK32_OBJS= \
	"$(INTDIR)\FtRtEvent\EventChannel\Set_Update_Interceptor.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\FTEC_Factory.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\FTEC_ConsumerAdmin.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\Dynamic_Bitset.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\create_persistent_poa.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\FTEC_Event_Channel.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\Fault_Detector_Loader.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\Replication_Strategy.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\FTEC_Become_Primary_Listener.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\ProxySupplierStateWorker.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\FTEC_Group_Manager.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\IOGR_Maker.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\SCTP_Fault_Detector.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\UpdateableHandler.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\FTEC_ORBInitializer.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\FTEC_ProxyConsumer.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\ObjectGroupManagerHandler.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\FT_ProxyAdmin_Base.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\ProxyConsumerStateWorker.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\AMI_Primary_Replication_Strategy.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\FTEC_ProxySupplier.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\Fault_Detector.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\ForwardCtrlServerInterceptor.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\Basic_Replication_Strategy.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\Replication_Service.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\Request_Context_Repository.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\AMI_Replication_Strategy.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\FtEventServiceInterceptor.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\FTEC_SupplierAdmin.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\Update_Manager.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\FTEC_Event_Channel_Impl.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\GroupInfoPublisher.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\Identification_Service.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\replace_key.obj"

"$(OUTDIR)\TAO_FTRT_EventChannelsd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_FTRT_EventChannelsd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_FTRT_EventChannelsd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\FTRT_EventChannel\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_FTRT_EventChannels.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.FTRT_EventChannel.dep" "FtRtEvent\EventChannel\Set_Update_Interceptor.cpp" "FtRtEvent\EventChannel\FTEC_Factory.cpp" "FtRtEvent\EventChannel\FTEC_ConsumerAdmin.cpp" "FtRtEvent\EventChannel\Dynamic_Bitset.cpp" "FtRtEvent\EventChannel\create_persistent_poa.cpp" "FtRtEvent\EventChannel\FTEC_Event_Channel.cpp" "FtRtEvent\EventChannel\Fault_Detector_Loader.cpp" "FtRtEvent\EventChannel\Replication_Strategy.cpp" "FtRtEvent\EventChannel\FTEC_Become_Primary_Listener.cpp" "FtRtEvent\EventChannel\ProxySupplierStateWorker.cpp" "FtRtEvent\EventChannel\FTEC_Group_Manager.cpp" "FtRtEvent\EventChannel\IOGR_Maker.cpp" "FtRtEvent\EventChannel\SCTP_Fault_Detector.cpp" "FtRtEvent\EventChannel\UpdateableHandler.cpp" "FtRtEvent\EventChannel\FTEC_ORBInitializer.cpp" "FtRtEvent\EventChannel\FTEC_ProxyConsumer.cpp" "FtRtEvent\EventChannel\ObjectGroupManagerHandler.cpp" "FtRtEvent\EventChannel\FT_ProxyAdmin_Base.cpp" "FtRtEvent\EventChannel\ProxyConsumerStateWorker.cpp" "FtRtEvent\EventChannel\AMI_Primary_Replication_Strategy.cpp" "FtRtEvent\EventChannel\FTEC_ProxySupplier.cpp" "FtRtEvent\EventChannel\Fault_Detector.cpp" "FtRtEvent\EventChannel\ForwardCtrlServerInterceptor.cpp" "FtRtEvent\EventChannel\Basic_Replication_Strategy.cpp" "FtRtEvent\EventChannel\Replication_Service.cpp" "FtRtEvent\EventChannel\Request_Context_Repository.cpp" "FtRtEvent\EventChannel\AMI_Replication_Strategy.cpp" "FtRtEvent\EventChannel\FtEventServiceInterceptor.cpp" "FtRtEvent\EventChannel\FTEC_SupplierAdmin.cpp" "FtRtEvent\EventChannel\Update_Manager.cpp" "FtRtEvent\EventChannel\FTEC_Event_Channel_Impl.cpp" "FtRtEvent\EventChannel\GroupInfoPublisher.cpp" "FtRtEvent\EventChannel\Identification_Service.cpp" "FtRtEvent\EventChannel\replace_key.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_FTRT_EventChannels.lib"
	-@del /f/q "$(OUTDIR)\TAO_FTRT_EventChannels.exp"
	-@del /f/q "$(OUTDIR)\TAO_FTRT_EventChannels.ilk"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\FTRT_EventChannel\$(NULL)" mkdir "Static_Release\FTRT_EventChannel"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_FTRT_EventChannels.lib"
LINK32_OBJS= \
	"$(INTDIR)\FtRtEvent\EventChannel\Set_Update_Interceptor.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\FTEC_Factory.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\FTEC_ConsumerAdmin.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\Dynamic_Bitset.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\create_persistent_poa.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\FTEC_Event_Channel.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\Fault_Detector_Loader.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\Replication_Strategy.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\FTEC_Become_Primary_Listener.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\ProxySupplierStateWorker.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\FTEC_Group_Manager.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\IOGR_Maker.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\SCTP_Fault_Detector.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\UpdateableHandler.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\FTEC_ORBInitializer.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\FTEC_ProxyConsumer.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\ObjectGroupManagerHandler.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\FT_ProxyAdmin_Base.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\ProxyConsumerStateWorker.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\AMI_Primary_Replication_Strategy.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\FTEC_ProxySupplier.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\Fault_Detector.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\ForwardCtrlServerInterceptor.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\Basic_Replication_Strategy.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\Replication_Service.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\Request_Context_Repository.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\AMI_Replication_Strategy.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\FtEventServiceInterceptor.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\FTEC_SupplierAdmin.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\Update_Manager.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\FTEC_Event_Channel_Impl.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\GroupInfoPublisher.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\Identification_Service.obj" \
	"$(INTDIR)\FtRtEvent\EventChannel\replace_key.obj"

"$(OUTDIR)\TAO_FTRT_EventChannels.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_FTRT_EventChannels.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_FTRT_EventChannels.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.FTRT_EventChannel.dep")
!INCLUDE "Makefile.FTRT_EventChannel.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="FtRtEvent\EventChannel\Set_Update_Interceptor.cpp"

"$(INTDIR)\FtRtEvent\EventChannel\Set_Update_Interceptor.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\FtRtEvent\EventChannel\$(NULL)" mkdir "$(INTDIR)\FtRtEvent\EventChannel\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FtRtEvent\EventChannel\Set_Update_Interceptor.obj" $(SOURCE)

SOURCE="FtRtEvent\EventChannel\FTEC_Factory.cpp"

"$(INTDIR)\FtRtEvent\EventChannel\FTEC_Factory.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\FtRtEvent\EventChannel\$(NULL)" mkdir "$(INTDIR)\FtRtEvent\EventChannel\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FtRtEvent\EventChannel\FTEC_Factory.obj" $(SOURCE)

SOURCE="FtRtEvent\EventChannel\FTEC_ConsumerAdmin.cpp"

"$(INTDIR)\FtRtEvent\EventChannel\FTEC_ConsumerAdmin.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\FtRtEvent\EventChannel\$(NULL)" mkdir "$(INTDIR)\FtRtEvent\EventChannel\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FtRtEvent\EventChannel\FTEC_ConsumerAdmin.obj" $(SOURCE)

SOURCE="FtRtEvent\EventChannel\Dynamic_Bitset.cpp"

"$(INTDIR)\FtRtEvent\EventChannel\Dynamic_Bitset.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\FtRtEvent\EventChannel\$(NULL)" mkdir "$(INTDIR)\FtRtEvent\EventChannel\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FtRtEvent\EventChannel\Dynamic_Bitset.obj" $(SOURCE)

SOURCE="FtRtEvent\EventChannel\create_persistent_poa.cpp"

"$(INTDIR)\FtRtEvent\EventChannel\create_persistent_poa.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\FtRtEvent\EventChannel\$(NULL)" mkdir "$(INTDIR)\FtRtEvent\EventChannel\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FtRtEvent\EventChannel\create_persistent_poa.obj" $(SOURCE)

SOURCE="FtRtEvent\EventChannel\FTEC_Event_Channel.cpp"

"$(INTDIR)\FtRtEvent\EventChannel\FTEC_Event_Channel.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\FtRtEvent\EventChannel\$(NULL)" mkdir "$(INTDIR)\FtRtEvent\EventChannel\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FtRtEvent\EventChannel\FTEC_Event_Channel.obj" $(SOURCE)

SOURCE="FtRtEvent\EventChannel\Fault_Detector_Loader.cpp"

"$(INTDIR)\FtRtEvent\EventChannel\Fault_Detector_Loader.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\FtRtEvent\EventChannel\$(NULL)" mkdir "$(INTDIR)\FtRtEvent\EventChannel\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FtRtEvent\EventChannel\Fault_Detector_Loader.obj" $(SOURCE)

SOURCE="FtRtEvent\EventChannel\Replication_Strategy.cpp"

"$(INTDIR)\FtRtEvent\EventChannel\Replication_Strategy.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\FtRtEvent\EventChannel\$(NULL)" mkdir "$(INTDIR)\FtRtEvent\EventChannel\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FtRtEvent\EventChannel\Replication_Strategy.obj" $(SOURCE)

SOURCE="FtRtEvent\EventChannel\FTEC_Become_Primary_Listener.cpp"

"$(INTDIR)\FtRtEvent\EventChannel\FTEC_Become_Primary_Listener.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\FtRtEvent\EventChannel\$(NULL)" mkdir "$(INTDIR)\FtRtEvent\EventChannel\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FtRtEvent\EventChannel\FTEC_Become_Primary_Listener.obj" $(SOURCE)

SOURCE="FtRtEvent\EventChannel\ProxySupplierStateWorker.cpp"

"$(INTDIR)\FtRtEvent\EventChannel\ProxySupplierStateWorker.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\FtRtEvent\EventChannel\$(NULL)" mkdir "$(INTDIR)\FtRtEvent\EventChannel\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FtRtEvent\EventChannel\ProxySupplierStateWorker.obj" $(SOURCE)

SOURCE="FtRtEvent\EventChannel\FTEC_Group_Manager.cpp"

"$(INTDIR)\FtRtEvent\EventChannel\FTEC_Group_Manager.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\FtRtEvent\EventChannel\$(NULL)" mkdir "$(INTDIR)\FtRtEvent\EventChannel\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FtRtEvent\EventChannel\FTEC_Group_Manager.obj" $(SOURCE)

SOURCE="FtRtEvent\EventChannel\IOGR_Maker.cpp"

"$(INTDIR)\FtRtEvent\EventChannel\IOGR_Maker.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\FtRtEvent\EventChannel\$(NULL)" mkdir "$(INTDIR)\FtRtEvent\EventChannel\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FtRtEvent\EventChannel\IOGR_Maker.obj" $(SOURCE)

SOURCE="FtRtEvent\EventChannel\SCTP_Fault_Detector.cpp"

"$(INTDIR)\FtRtEvent\EventChannel\SCTP_Fault_Detector.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\FtRtEvent\EventChannel\$(NULL)" mkdir "$(INTDIR)\FtRtEvent\EventChannel\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FtRtEvent\EventChannel\SCTP_Fault_Detector.obj" $(SOURCE)

SOURCE="FtRtEvent\EventChannel\UpdateableHandler.cpp"

"$(INTDIR)\FtRtEvent\EventChannel\UpdateableHandler.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\FtRtEvent\EventChannel\$(NULL)" mkdir "$(INTDIR)\FtRtEvent\EventChannel\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FtRtEvent\EventChannel\UpdateableHandler.obj" $(SOURCE)

SOURCE="FtRtEvent\EventChannel\FTEC_ORBInitializer.cpp"

"$(INTDIR)\FtRtEvent\EventChannel\FTEC_ORBInitializer.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\FtRtEvent\EventChannel\$(NULL)" mkdir "$(INTDIR)\FtRtEvent\EventChannel\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FtRtEvent\EventChannel\FTEC_ORBInitializer.obj" $(SOURCE)

SOURCE="FtRtEvent\EventChannel\FTEC_ProxyConsumer.cpp"

"$(INTDIR)\FtRtEvent\EventChannel\FTEC_ProxyConsumer.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\FtRtEvent\EventChannel\$(NULL)" mkdir "$(INTDIR)\FtRtEvent\EventChannel\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FtRtEvent\EventChannel\FTEC_ProxyConsumer.obj" $(SOURCE)

SOURCE="FtRtEvent\EventChannel\ObjectGroupManagerHandler.cpp"

"$(INTDIR)\FtRtEvent\EventChannel\ObjectGroupManagerHandler.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\FtRtEvent\EventChannel\$(NULL)" mkdir "$(INTDIR)\FtRtEvent\EventChannel\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FtRtEvent\EventChannel\ObjectGroupManagerHandler.obj" $(SOURCE)

SOURCE="FtRtEvent\EventChannel\FT_ProxyAdmin_Base.cpp"

"$(INTDIR)\FtRtEvent\EventChannel\FT_ProxyAdmin_Base.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\FtRtEvent\EventChannel\$(NULL)" mkdir "$(INTDIR)\FtRtEvent\EventChannel\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FtRtEvent\EventChannel\FT_ProxyAdmin_Base.obj" $(SOURCE)

SOURCE="FtRtEvent\EventChannel\ProxyConsumerStateWorker.cpp"

"$(INTDIR)\FtRtEvent\EventChannel\ProxyConsumerStateWorker.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\FtRtEvent\EventChannel\$(NULL)" mkdir "$(INTDIR)\FtRtEvent\EventChannel\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FtRtEvent\EventChannel\ProxyConsumerStateWorker.obj" $(SOURCE)

SOURCE="FtRtEvent\EventChannel\AMI_Primary_Replication_Strategy.cpp"

"$(INTDIR)\FtRtEvent\EventChannel\AMI_Primary_Replication_Strategy.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\FtRtEvent\EventChannel\$(NULL)" mkdir "$(INTDIR)\FtRtEvent\EventChannel\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FtRtEvent\EventChannel\AMI_Primary_Replication_Strategy.obj" $(SOURCE)

SOURCE="FtRtEvent\EventChannel\FTEC_ProxySupplier.cpp"

"$(INTDIR)\FtRtEvent\EventChannel\FTEC_ProxySupplier.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\FtRtEvent\EventChannel\$(NULL)" mkdir "$(INTDIR)\FtRtEvent\EventChannel\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FtRtEvent\EventChannel\FTEC_ProxySupplier.obj" $(SOURCE)

SOURCE="FtRtEvent\EventChannel\Fault_Detector.cpp"

"$(INTDIR)\FtRtEvent\EventChannel\Fault_Detector.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\FtRtEvent\EventChannel\$(NULL)" mkdir "$(INTDIR)\FtRtEvent\EventChannel\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FtRtEvent\EventChannel\Fault_Detector.obj" $(SOURCE)

SOURCE="FtRtEvent\EventChannel\ForwardCtrlServerInterceptor.cpp"

"$(INTDIR)\FtRtEvent\EventChannel\ForwardCtrlServerInterceptor.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\FtRtEvent\EventChannel\$(NULL)" mkdir "$(INTDIR)\FtRtEvent\EventChannel\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FtRtEvent\EventChannel\ForwardCtrlServerInterceptor.obj" $(SOURCE)

SOURCE="FtRtEvent\EventChannel\Basic_Replication_Strategy.cpp"

"$(INTDIR)\FtRtEvent\EventChannel\Basic_Replication_Strategy.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\FtRtEvent\EventChannel\$(NULL)" mkdir "$(INTDIR)\FtRtEvent\EventChannel\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FtRtEvent\EventChannel\Basic_Replication_Strategy.obj" $(SOURCE)

SOURCE="FtRtEvent\EventChannel\Replication_Service.cpp"

"$(INTDIR)\FtRtEvent\EventChannel\Replication_Service.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\FtRtEvent\EventChannel\$(NULL)" mkdir "$(INTDIR)\FtRtEvent\EventChannel\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FtRtEvent\EventChannel\Replication_Service.obj" $(SOURCE)

SOURCE="FtRtEvent\EventChannel\Request_Context_Repository.cpp"

"$(INTDIR)\FtRtEvent\EventChannel\Request_Context_Repository.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\FtRtEvent\EventChannel\$(NULL)" mkdir "$(INTDIR)\FtRtEvent\EventChannel\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FtRtEvent\EventChannel\Request_Context_Repository.obj" $(SOURCE)

SOURCE="FtRtEvent\EventChannel\AMI_Replication_Strategy.cpp"

"$(INTDIR)\FtRtEvent\EventChannel\AMI_Replication_Strategy.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\FtRtEvent\EventChannel\$(NULL)" mkdir "$(INTDIR)\FtRtEvent\EventChannel\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FtRtEvent\EventChannel\AMI_Replication_Strategy.obj" $(SOURCE)

SOURCE="FtRtEvent\EventChannel\FtEventServiceInterceptor.cpp"

"$(INTDIR)\FtRtEvent\EventChannel\FtEventServiceInterceptor.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\FtRtEvent\EventChannel\$(NULL)" mkdir "$(INTDIR)\FtRtEvent\EventChannel\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FtRtEvent\EventChannel\FtEventServiceInterceptor.obj" $(SOURCE)

SOURCE="FtRtEvent\EventChannel\FTEC_SupplierAdmin.cpp"

"$(INTDIR)\FtRtEvent\EventChannel\FTEC_SupplierAdmin.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\FtRtEvent\EventChannel\$(NULL)" mkdir "$(INTDIR)\FtRtEvent\EventChannel\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FtRtEvent\EventChannel\FTEC_SupplierAdmin.obj" $(SOURCE)

SOURCE="FtRtEvent\EventChannel\Update_Manager.cpp"

"$(INTDIR)\FtRtEvent\EventChannel\Update_Manager.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\FtRtEvent\EventChannel\$(NULL)" mkdir "$(INTDIR)\FtRtEvent\EventChannel\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FtRtEvent\EventChannel\Update_Manager.obj" $(SOURCE)

SOURCE="FtRtEvent\EventChannel\FTEC_Event_Channel_Impl.cpp"

"$(INTDIR)\FtRtEvent\EventChannel\FTEC_Event_Channel_Impl.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\FtRtEvent\EventChannel\$(NULL)" mkdir "$(INTDIR)\FtRtEvent\EventChannel\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FtRtEvent\EventChannel\FTEC_Event_Channel_Impl.obj" $(SOURCE)

SOURCE="FtRtEvent\EventChannel\GroupInfoPublisher.cpp"

"$(INTDIR)\FtRtEvent\EventChannel\GroupInfoPublisher.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\FtRtEvent\EventChannel\$(NULL)" mkdir "$(INTDIR)\FtRtEvent\EventChannel\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FtRtEvent\EventChannel\GroupInfoPublisher.obj" $(SOURCE)

SOURCE="FtRtEvent\EventChannel\Identification_Service.cpp"

"$(INTDIR)\FtRtEvent\EventChannel\Identification_Service.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\FtRtEvent\EventChannel\$(NULL)" mkdir "$(INTDIR)\FtRtEvent\EventChannel\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FtRtEvent\EventChannel\Identification_Service.obj" $(SOURCE)

SOURCE="FtRtEvent\EventChannel\replace_key.cpp"

"$(INTDIR)\FtRtEvent\EventChannel\replace_key.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\FtRtEvent\EventChannel\$(NULL)" mkdir "$(INTDIR)\FtRtEvent\EventChannel\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FtRtEvent\EventChannel\replace_key.obj" $(SOURCE)

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
!IF EXISTS("Makefile.FTRT_EventChannel.dep")
	@echo Using "Makefile.FTRT_EventChannel.dep"
!ELSE
	@echo Warning: cannot find "Makefile.FTRT_EventChannel.dep"
!ENDIF
!ENDIF

