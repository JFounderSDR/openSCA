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
!MESSAGE NMAKE /f "Makefile.CosNotification_Serv.mak" CFG="Win64 Debug"
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
INTDIR=Debug\CosNotification_Serv\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_CosNotification_Servd.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -DTAO_NOTIFY_SERV_BUILD_DLL -f "Makefile.CosNotification_Serv.dep" "Notify\Admin.cpp" "Notify\AdminProperties.cpp" "Notify\Bit_Vector.cpp" "Notify\Buffering_Strategy.cpp" "Notify\Builder.cpp" "Notify\Consumer.cpp" "Notify\ConsumerAdmin.cpp" "Notify\CosNotify_Initializer.cpp" "Notify\CosNotify_Service.cpp" "Notify\Default_Factory.cpp" "Notify\Delivery_Request.cpp" "Notify\ETCL_Filter.cpp" "Notify\ETCL_FilterFactory.cpp" "Notify\Event.cpp" "Notify\EventChannel.cpp" "Notify\EventChannelFactory.cpp" "Notify\EventType.cpp" "Notify\EventTypeSeq.cpp" "Notify\Event_Manager.cpp" "Notify\Event_Persistence_Factory.cpp" "Notify\FilterAdmin.cpp" "Notify\Validate_Client_Task.cpp" "Notify\ID_Factory.cpp" "Notify\Method_Request.cpp" "Notify\Method_Request_Dispatch.cpp" "Notify\Method_Request_Event.cpp" "Notify\Method_Request_Lookup.cpp" "Notify\Method_Request_Shutdown.cpp" "Notify\Method_Request_Updates.cpp" "Notify\Name_Value_Pair.cpp" "Notify\Notify_Constraint_Interpreter.cpp" "Notify\Notify_Constraint_Visitors.cpp" "Notify\Notify_Default_Collection_Factory.cpp" "Notify\Notify_Default_CO_Factory.cpp" "Notify\Notify_Default_EMO_Factory.cpp" "Notify\Notify_Default_POA_Factory.cpp" "Notify\Notify_EventChannelFactory_i.cpp" "Notify\Object.cpp" "Notify\Peer.cpp" "Notify\Persistent_File_Allocator.cpp" "Notify\POA_Helper.cpp" "Notify\Properties.cpp" "Notify\PropertySeq.cpp" "Notify\Property_Boolean.cpp" "Notify\Proxy.cpp" "Notify\ProxyConsumer.cpp" "Notify\ProxySupplier.cpp" "Notify\QoSProperties.cpp" "Notify\Random_File.cpp" "Notify\Reactive_Task.cpp" "Notify\Refcountable.cpp" "Notify\Reconnection_Registry.cpp" "Notify\Routing_Slip.cpp" "Notify\Routing_Slip_Persistence_Manager.cpp" "Notify\Routing_Slip_Queue.cpp" "Notify\Service.cpp" "Notify\Subscription_Change_Worker.cpp" "Notify\Supplier.cpp" "Notify\SupplierAdmin.cpp" "Notify\Standard_Event_Persistence.cpp" "Notify\ThreadPool_Task.cpp" "Notify\Timer_Queue.cpp" "Notify\Timer_Reactor.cpp" "Notify\Topology_Loader.cpp" "Notify\Topology_Object.cpp" "Notify\Topology_Saver.cpp" "Notify\Worker_Task.cpp" "Notify\Any\AnyEvent.cpp" "Notify\Any\CosEC_ProxyPushConsumer.cpp" "Notify\Any\CosEC_ProxyPushSupplier.cpp" "Notify\Any\ProxyPushConsumer.cpp" "Notify\Any\ProxyPushSupplier.cpp" "Notify\Any\PushConsumer.cpp" "Notify\Any\PushSupplier.cpp" "Notify\Sequence\SequenceProxyPushConsumer.cpp" "Notify\Sequence\SequenceProxyPushSupplier.cpp" "Notify\Sequence\SequencePushConsumer.cpp" "Notify\Sequence\SequencePushSupplier.cpp" "Notify\Structured\StructuredEvent.cpp" "Notify\Structured\StructuredProxyPushConsumer.cpp" "Notify\Structured\StructuredProxyPushSupplier.cpp" "Notify\Structured\StructuredPushConsumer.cpp" "Notify\Structured\StructuredPushSupplier.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_Servd.pdb"
	-@del /f/q "..\..\..\lib\TAO_CosNotification_Servd.dll"
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_Servd.lib"
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_Servd.exp"
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_Servd.ilk"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\CosNotification_Serv\$(NULL)" mkdir "Debug\CosNotification_Serv"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D TAO_NOTIFY_SERV_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_PortableServerd.lib TAO_Svc_Utilsd.lib TAO_CosEventd.lib TAO_CosNotificationd.lib TAO_CosEvent_Skeld.lib TAO_CosNotification_Skeld.lib TAO_Valuetyped.lib TAO_DynamicAnyd.lib ACE_ETCLd.lib TAO_ETCLd.lib ACE_ETCL_Parserd.lib TAO_CodecFactoryd.lib TAO_PId.lib TAO_Messagingd.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\..\lib\TAO_CosNotification_Servd.pdb" /machine:IA64 /out:"..\..\..\lib\TAO_CosNotification_Servd.dll" /implib:"$(OUTDIR)\TAO_CosNotification_Servd.lib"
LINK32_OBJS= \
	"$(INTDIR)\CosNotification_Serv.res" \
	"$(INTDIR)\Notify\Admin.obj" \
	"$(INTDIR)\Notify\AdminProperties.obj" \
	"$(INTDIR)\Notify\Bit_Vector.obj" \
	"$(INTDIR)\Notify\Buffering_Strategy.obj" \
	"$(INTDIR)\Notify\Builder.obj" \
	"$(INTDIR)\Notify\Consumer.obj" \
	"$(INTDIR)\Notify\ConsumerAdmin.obj" \
	"$(INTDIR)\Notify\CosNotify_Initializer.obj" \
	"$(INTDIR)\Notify\CosNotify_Service.obj" \
	"$(INTDIR)\Notify\Default_Factory.obj" \
	"$(INTDIR)\Notify\Delivery_Request.obj" \
	"$(INTDIR)\Notify\ETCL_Filter.obj" \
	"$(INTDIR)\Notify\ETCL_FilterFactory.obj" \
	"$(INTDIR)\Notify\Event.obj" \
	"$(INTDIR)\Notify\EventChannel.obj" \
	"$(INTDIR)\Notify\EventChannelFactory.obj" \
	"$(INTDIR)\Notify\EventType.obj" \
	"$(INTDIR)\Notify\EventTypeSeq.obj" \
	"$(INTDIR)\Notify\Event_Manager.obj" \
	"$(INTDIR)\Notify\Event_Persistence_Factory.obj" \
	"$(INTDIR)\Notify\FilterAdmin.obj" \
	"$(INTDIR)\Notify\Validate_Client_Task.obj" \
	"$(INTDIR)\Notify\ID_Factory.obj" \
	"$(INTDIR)\Notify\Method_Request.obj" \
	"$(INTDIR)\Notify\Method_Request_Dispatch.obj" \
	"$(INTDIR)\Notify\Method_Request_Event.obj" \
	"$(INTDIR)\Notify\Method_Request_Lookup.obj" \
	"$(INTDIR)\Notify\Method_Request_Shutdown.obj" \
	"$(INTDIR)\Notify\Method_Request_Updates.obj" \
	"$(INTDIR)\Notify\Name_Value_Pair.obj" \
	"$(INTDIR)\Notify\Notify_Constraint_Interpreter.obj" \
	"$(INTDIR)\Notify\Notify_Constraint_Visitors.obj" \
	"$(INTDIR)\Notify\Notify_Default_Collection_Factory.obj" \
	"$(INTDIR)\Notify\Notify_Default_CO_Factory.obj" \
	"$(INTDIR)\Notify\Notify_Default_EMO_Factory.obj" \
	"$(INTDIR)\Notify\Notify_Default_POA_Factory.obj" \
	"$(INTDIR)\Notify\Notify_EventChannelFactory_i.obj" \
	"$(INTDIR)\Notify\Object.obj" \
	"$(INTDIR)\Notify\Peer.obj" \
	"$(INTDIR)\Notify\Persistent_File_Allocator.obj" \
	"$(INTDIR)\Notify\POA_Helper.obj" \
	"$(INTDIR)\Notify\Properties.obj" \
	"$(INTDIR)\Notify\PropertySeq.obj" \
	"$(INTDIR)\Notify\Property_Boolean.obj" \
	"$(INTDIR)\Notify\Proxy.obj" \
	"$(INTDIR)\Notify\ProxyConsumer.obj" \
	"$(INTDIR)\Notify\ProxySupplier.obj" \
	"$(INTDIR)\Notify\QoSProperties.obj" \
	"$(INTDIR)\Notify\Random_File.obj" \
	"$(INTDIR)\Notify\Reactive_Task.obj" \
	"$(INTDIR)\Notify\Refcountable.obj" \
	"$(INTDIR)\Notify\Reconnection_Registry.obj" \
	"$(INTDIR)\Notify\Routing_Slip.obj" \
	"$(INTDIR)\Notify\Routing_Slip_Persistence_Manager.obj" \
	"$(INTDIR)\Notify\Routing_Slip_Queue.obj" \
	"$(INTDIR)\Notify\Service.obj" \
	"$(INTDIR)\Notify\Subscription_Change_Worker.obj" \
	"$(INTDIR)\Notify\Supplier.obj" \
	"$(INTDIR)\Notify\SupplierAdmin.obj" \
	"$(INTDIR)\Notify\Standard_Event_Persistence.obj" \
	"$(INTDIR)\Notify\ThreadPool_Task.obj" \
	"$(INTDIR)\Notify\Timer_Queue.obj" \
	"$(INTDIR)\Notify\Timer_Reactor.obj" \
	"$(INTDIR)\Notify\Topology_Loader.obj" \
	"$(INTDIR)\Notify\Topology_Object.obj" \
	"$(INTDIR)\Notify\Topology_Saver.obj" \
	"$(INTDIR)\Notify\Worker_Task.obj" \
	"$(INTDIR)\Notify\Any\AnyEvent.obj" \
	"$(INTDIR)\Notify\Any\CosEC_ProxyPushConsumer.obj" \
	"$(INTDIR)\Notify\Any\CosEC_ProxyPushSupplier.obj" \
	"$(INTDIR)\Notify\Any\ProxyPushConsumer.obj" \
	"$(INTDIR)\Notify\Any\ProxyPushSupplier.obj" \
	"$(INTDIR)\Notify\Any\PushConsumer.obj" \
	"$(INTDIR)\Notify\Any\PushSupplier.obj" \
	"$(INTDIR)\Notify\Sequence\SequenceProxyPushConsumer.obj" \
	"$(INTDIR)\Notify\Sequence\SequenceProxyPushSupplier.obj" \
	"$(INTDIR)\Notify\Sequence\SequencePushConsumer.obj" \
	"$(INTDIR)\Notify\Sequence\SequencePushSupplier.obj" \
	"$(INTDIR)\Notify\Structured\StructuredEvent.obj" \
	"$(INTDIR)\Notify\Structured\StructuredProxyPushConsumer.obj" \
	"$(INTDIR)\Notify\Structured\StructuredProxyPushSupplier.obj" \
	"$(INTDIR)\Notify\Structured\StructuredPushConsumer.obj" \
	"$(INTDIR)\Notify\Structured\StructuredPushSupplier.obj"

"..\..\..\lib\TAO_CosNotification_Servd.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_CosNotification_Servd.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_CosNotification_Servd.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\CosNotification_Serv\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_CosNotification_Serv.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -DTAO_NOTIFY_SERV_BUILD_DLL -f "Makefile.CosNotification_Serv.dep" "Notify\Admin.cpp" "Notify\AdminProperties.cpp" "Notify\Bit_Vector.cpp" "Notify\Buffering_Strategy.cpp" "Notify\Builder.cpp" "Notify\Consumer.cpp" "Notify\ConsumerAdmin.cpp" "Notify\CosNotify_Initializer.cpp" "Notify\CosNotify_Service.cpp" "Notify\Default_Factory.cpp" "Notify\Delivery_Request.cpp" "Notify\ETCL_Filter.cpp" "Notify\ETCL_FilterFactory.cpp" "Notify\Event.cpp" "Notify\EventChannel.cpp" "Notify\EventChannelFactory.cpp" "Notify\EventType.cpp" "Notify\EventTypeSeq.cpp" "Notify\Event_Manager.cpp" "Notify\Event_Persistence_Factory.cpp" "Notify\FilterAdmin.cpp" "Notify\Validate_Client_Task.cpp" "Notify\ID_Factory.cpp" "Notify\Method_Request.cpp" "Notify\Method_Request_Dispatch.cpp" "Notify\Method_Request_Event.cpp" "Notify\Method_Request_Lookup.cpp" "Notify\Method_Request_Shutdown.cpp" "Notify\Method_Request_Updates.cpp" "Notify\Name_Value_Pair.cpp" "Notify\Notify_Constraint_Interpreter.cpp" "Notify\Notify_Constraint_Visitors.cpp" "Notify\Notify_Default_Collection_Factory.cpp" "Notify\Notify_Default_CO_Factory.cpp" "Notify\Notify_Default_EMO_Factory.cpp" "Notify\Notify_Default_POA_Factory.cpp" "Notify\Notify_EventChannelFactory_i.cpp" "Notify\Object.cpp" "Notify\Peer.cpp" "Notify\Persistent_File_Allocator.cpp" "Notify\POA_Helper.cpp" "Notify\Properties.cpp" "Notify\PropertySeq.cpp" "Notify\Property_Boolean.cpp" "Notify\Proxy.cpp" "Notify\ProxyConsumer.cpp" "Notify\ProxySupplier.cpp" "Notify\QoSProperties.cpp" "Notify\Random_File.cpp" "Notify\Reactive_Task.cpp" "Notify\Refcountable.cpp" "Notify\Reconnection_Registry.cpp" "Notify\Routing_Slip.cpp" "Notify\Routing_Slip_Persistence_Manager.cpp" "Notify\Routing_Slip_Queue.cpp" "Notify\Service.cpp" "Notify\Subscription_Change_Worker.cpp" "Notify\Supplier.cpp" "Notify\SupplierAdmin.cpp" "Notify\Standard_Event_Persistence.cpp" "Notify\ThreadPool_Task.cpp" "Notify\Timer_Queue.cpp" "Notify\Timer_Reactor.cpp" "Notify\Topology_Loader.cpp" "Notify\Topology_Object.cpp" "Notify\Topology_Saver.cpp" "Notify\Worker_Task.cpp" "Notify\Any\AnyEvent.cpp" "Notify\Any\CosEC_ProxyPushConsumer.cpp" "Notify\Any\CosEC_ProxyPushSupplier.cpp" "Notify\Any\ProxyPushConsumer.cpp" "Notify\Any\ProxyPushSupplier.cpp" "Notify\Any\PushConsumer.cpp" "Notify\Any\PushSupplier.cpp" "Notify\Sequence\SequenceProxyPushConsumer.cpp" "Notify\Sequence\SequenceProxyPushSupplier.cpp" "Notify\Sequence\SequencePushConsumer.cpp" "Notify\Sequence\SequencePushSupplier.cpp" "Notify\Structured\StructuredEvent.cpp" "Notify\Structured\StructuredProxyPushConsumer.cpp" "Notify\Structured\StructuredProxyPushSupplier.cpp" "Notify\Structured\StructuredPushConsumer.cpp" "Notify\Structured\StructuredPushSupplier.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\TAO_CosNotification_Serv.dll"
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_Serv.lib"
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_Serv.exp"
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_Serv.ilk"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\CosNotification_Serv\$(NULL)" mkdir "Release\CosNotification_Serv"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D TAO_NOTIFY_SERV_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_PortableServer.lib TAO_Svc_Utils.lib TAO_CosEvent.lib TAO_CosNotification.lib TAO_CosEvent_Skel.lib TAO_CosNotification_Skel.lib TAO_Valuetype.lib TAO_DynamicAny.lib ACE_ETCL.lib TAO_ETCL.lib ACE_ETCL_Parser.lib TAO_CodecFactory.lib TAO_PI.lib TAO_Messaging.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\..\lib\TAO_CosNotification_Serv.dll" /implib:"$(OUTDIR)\TAO_CosNotification_Serv.lib"
LINK32_OBJS= \
	"$(INTDIR)\CosNotification_Serv.res" \
	"$(INTDIR)\Notify\Admin.obj" \
	"$(INTDIR)\Notify\AdminProperties.obj" \
	"$(INTDIR)\Notify\Bit_Vector.obj" \
	"$(INTDIR)\Notify\Buffering_Strategy.obj" \
	"$(INTDIR)\Notify\Builder.obj" \
	"$(INTDIR)\Notify\Consumer.obj" \
	"$(INTDIR)\Notify\ConsumerAdmin.obj" \
	"$(INTDIR)\Notify\CosNotify_Initializer.obj" \
	"$(INTDIR)\Notify\CosNotify_Service.obj" \
	"$(INTDIR)\Notify\Default_Factory.obj" \
	"$(INTDIR)\Notify\Delivery_Request.obj" \
	"$(INTDIR)\Notify\ETCL_Filter.obj" \
	"$(INTDIR)\Notify\ETCL_FilterFactory.obj" \
	"$(INTDIR)\Notify\Event.obj" \
	"$(INTDIR)\Notify\EventChannel.obj" \
	"$(INTDIR)\Notify\EventChannelFactory.obj" \
	"$(INTDIR)\Notify\EventType.obj" \
	"$(INTDIR)\Notify\EventTypeSeq.obj" \
	"$(INTDIR)\Notify\Event_Manager.obj" \
	"$(INTDIR)\Notify\Event_Persistence_Factory.obj" \
	"$(INTDIR)\Notify\FilterAdmin.obj" \
	"$(INTDIR)\Notify\Validate_Client_Task.obj" \
	"$(INTDIR)\Notify\ID_Factory.obj" \
	"$(INTDIR)\Notify\Method_Request.obj" \
	"$(INTDIR)\Notify\Method_Request_Dispatch.obj" \
	"$(INTDIR)\Notify\Method_Request_Event.obj" \
	"$(INTDIR)\Notify\Method_Request_Lookup.obj" \
	"$(INTDIR)\Notify\Method_Request_Shutdown.obj" \
	"$(INTDIR)\Notify\Method_Request_Updates.obj" \
	"$(INTDIR)\Notify\Name_Value_Pair.obj" \
	"$(INTDIR)\Notify\Notify_Constraint_Interpreter.obj" \
	"$(INTDIR)\Notify\Notify_Constraint_Visitors.obj" \
	"$(INTDIR)\Notify\Notify_Default_Collection_Factory.obj" \
	"$(INTDIR)\Notify\Notify_Default_CO_Factory.obj" \
	"$(INTDIR)\Notify\Notify_Default_EMO_Factory.obj" \
	"$(INTDIR)\Notify\Notify_Default_POA_Factory.obj" \
	"$(INTDIR)\Notify\Notify_EventChannelFactory_i.obj" \
	"$(INTDIR)\Notify\Object.obj" \
	"$(INTDIR)\Notify\Peer.obj" \
	"$(INTDIR)\Notify\Persistent_File_Allocator.obj" \
	"$(INTDIR)\Notify\POA_Helper.obj" \
	"$(INTDIR)\Notify\Properties.obj" \
	"$(INTDIR)\Notify\PropertySeq.obj" \
	"$(INTDIR)\Notify\Property_Boolean.obj" \
	"$(INTDIR)\Notify\Proxy.obj" \
	"$(INTDIR)\Notify\ProxyConsumer.obj" \
	"$(INTDIR)\Notify\ProxySupplier.obj" \
	"$(INTDIR)\Notify\QoSProperties.obj" \
	"$(INTDIR)\Notify\Random_File.obj" \
	"$(INTDIR)\Notify\Reactive_Task.obj" \
	"$(INTDIR)\Notify\Refcountable.obj" \
	"$(INTDIR)\Notify\Reconnection_Registry.obj" \
	"$(INTDIR)\Notify\Routing_Slip.obj" \
	"$(INTDIR)\Notify\Routing_Slip_Persistence_Manager.obj" \
	"$(INTDIR)\Notify\Routing_Slip_Queue.obj" \
	"$(INTDIR)\Notify\Service.obj" \
	"$(INTDIR)\Notify\Subscription_Change_Worker.obj" \
	"$(INTDIR)\Notify\Supplier.obj" \
	"$(INTDIR)\Notify\SupplierAdmin.obj" \
	"$(INTDIR)\Notify\Standard_Event_Persistence.obj" \
	"$(INTDIR)\Notify\ThreadPool_Task.obj" \
	"$(INTDIR)\Notify\Timer_Queue.obj" \
	"$(INTDIR)\Notify\Timer_Reactor.obj" \
	"$(INTDIR)\Notify\Topology_Loader.obj" \
	"$(INTDIR)\Notify\Topology_Object.obj" \
	"$(INTDIR)\Notify\Topology_Saver.obj" \
	"$(INTDIR)\Notify\Worker_Task.obj" \
	"$(INTDIR)\Notify\Any\AnyEvent.obj" \
	"$(INTDIR)\Notify\Any\CosEC_ProxyPushConsumer.obj" \
	"$(INTDIR)\Notify\Any\CosEC_ProxyPushSupplier.obj" \
	"$(INTDIR)\Notify\Any\ProxyPushConsumer.obj" \
	"$(INTDIR)\Notify\Any\ProxyPushSupplier.obj" \
	"$(INTDIR)\Notify\Any\PushConsumer.obj" \
	"$(INTDIR)\Notify\Any\PushSupplier.obj" \
	"$(INTDIR)\Notify\Sequence\SequenceProxyPushConsumer.obj" \
	"$(INTDIR)\Notify\Sequence\SequenceProxyPushSupplier.obj" \
	"$(INTDIR)\Notify\Sequence\SequencePushConsumer.obj" \
	"$(INTDIR)\Notify\Sequence\SequencePushSupplier.obj" \
	"$(INTDIR)\Notify\Structured\StructuredEvent.obj" \
	"$(INTDIR)\Notify\Structured\StructuredProxyPushConsumer.obj" \
	"$(INTDIR)\Notify\Structured\StructuredProxyPushSupplier.obj" \
	"$(INTDIR)\Notify\Structured\StructuredPushConsumer.obj" \
	"$(INTDIR)\Notify\Structured\StructuredPushSupplier.obj"

"..\..\..\lib\TAO_CosNotification_Serv.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_CosNotification_Serv.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_CosNotification_Serv.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\CosNotification_Serv\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_CosNotification_Servsd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.CosNotification_Serv.dep" "Notify\Admin.cpp" "Notify\AdminProperties.cpp" "Notify\Bit_Vector.cpp" "Notify\Buffering_Strategy.cpp" "Notify\Builder.cpp" "Notify\Consumer.cpp" "Notify\ConsumerAdmin.cpp" "Notify\CosNotify_Initializer.cpp" "Notify\CosNotify_Service.cpp" "Notify\Default_Factory.cpp" "Notify\Delivery_Request.cpp" "Notify\ETCL_Filter.cpp" "Notify\ETCL_FilterFactory.cpp" "Notify\Event.cpp" "Notify\EventChannel.cpp" "Notify\EventChannelFactory.cpp" "Notify\EventType.cpp" "Notify\EventTypeSeq.cpp" "Notify\Event_Manager.cpp" "Notify\Event_Persistence_Factory.cpp" "Notify\FilterAdmin.cpp" "Notify\Validate_Client_Task.cpp" "Notify\ID_Factory.cpp" "Notify\Method_Request.cpp" "Notify\Method_Request_Dispatch.cpp" "Notify\Method_Request_Event.cpp" "Notify\Method_Request_Lookup.cpp" "Notify\Method_Request_Shutdown.cpp" "Notify\Method_Request_Updates.cpp" "Notify\Name_Value_Pair.cpp" "Notify\Notify_Constraint_Interpreter.cpp" "Notify\Notify_Constraint_Visitors.cpp" "Notify\Notify_Default_Collection_Factory.cpp" "Notify\Notify_Default_CO_Factory.cpp" "Notify\Notify_Default_EMO_Factory.cpp" "Notify\Notify_Default_POA_Factory.cpp" "Notify\Notify_EventChannelFactory_i.cpp" "Notify\Object.cpp" "Notify\Peer.cpp" "Notify\Persistent_File_Allocator.cpp" "Notify\POA_Helper.cpp" "Notify\Properties.cpp" "Notify\PropertySeq.cpp" "Notify\Property_Boolean.cpp" "Notify\Proxy.cpp" "Notify\ProxyConsumer.cpp" "Notify\ProxySupplier.cpp" "Notify\QoSProperties.cpp" "Notify\Random_File.cpp" "Notify\Reactive_Task.cpp" "Notify\Refcountable.cpp" "Notify\Reconnection_Registry.cpp" "Notify\Routing_Slip.cpp" "Notify\Routing_Slip_Persistence_Manager.cpp" "Notify\Routing_Slip_Queue.cpp" "Notify\Service.cpp" "Notify\Subscription_Change_Worker.cpp" "Notify\Supplier.cpp" "Notify\SupplierAdmin.cpp" "Notify\Standard_Event_Persistence.cpp" "Notify\ThreadPool_Task.cpp" "Notify\Timer_Queue.cpp" "Notify\Timer_Reactor.cpp" "Notify\Topology_Loader.cpp" "Notify\Topology_Object.cpp" "Notify\Topology_Saver.cpp" "Notify\Worker_Task.cpp" "Notify\Any\AnyEvent.cpp" "Notify\Any\CosEC_ProxyPushConsumer.cpp" "Notify\Any\CosEC_ProxyPushSupplier.cpp" "Notify\Any\ProxyPushConsumer.cpp" "Notify\Any\ProxyPushSupplier.cpp" "Notify\Any\PushConsumer.cpp" "Notify\Any\PushSupplier.cpp" "Notify\Sequence\SequenceProxyPushConsumer.cpp" "Notify\Sequence\SequenceProxyPushSupplier.cpp" "Notify\Sequence\SequencePushConsumer.cpp" "Notify\Sequence\SequencePushSupplier.cpp" "Notify\Structured\StructuredEvent.cpp" "Notify\Structured\StructuredProxyPushConsumer.cpp" "Notify\Structured\StructuredProxyPushSupplier.cpp" "Notify\Structured\StructuredPushConsumer.cpp" "Notify\Structured\StructuredPushSupplier.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_Servsd.lib"
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_Servsd.exp"
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_Servsd.ilk"
	-@del /f/q "..\..\..\lib\TAO_CosNotification_Servsd.pdb"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\CosNotification_Serv\$(NULL)" mkdir "Static_Debug\CosNotification_Serv"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\TAO_CosNotification_Servsd.pdb" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_CosNotification_Servsd.lib"
LINK32_OBJS= \
	"$(INTDIR)\Notify\Admin.obj" \
	"$(INTDIR)\Notify\AdminProperties.obj" \
	"$(INTDIR)\Notify\Bit_Vector.obj" \
	"$(INTDIR)\Notify\Buffering_Strategy.obj" \
	"$(INTDIR)\Notify\Builder.obj" \
	"$(INTDIR)\Notify\Consumer.obj" \
	"$(INTDIR)\Notify\ConsumerAdmin.obj" \
	"$(INTDIR)\Notify\CosNotify_Initializer.obj" \
	"$(INTDIR)\Notify\CosNotify_Service.obj" \
	"$(INTDIR)\Notify\Default_Factory.obj" \
	"$(INTDIR)\Notify\Delivery_Request.obj" \
	"$(INTDIR)\Notify\ETCL_Filter.obj" \
	"$(INTDIR)\Notify\ETCL_FilterFactory.obj" \
	"$(INTDIR)\Notify\Event.obj" \
	"$(INTDIR)\Notify\EventChannel.obj" \
	"$(INTDIR)\Notify\EventChannelFactory.obj" \
	"$(INTDIR)\Notify\EventType.obj" \
	"$(INTDIR)\Notify\EventTypeSeq.obj" \
	"$(INTDIR)\Notify\Event_Manager.obj" \
	"$(INTDIR)\Notify\Event_Persistence_Factory.obj" \
	"$(INTDIR)\Notify\FilterAdmin.obj" \
	"$(INTDIR)\Notify\Validate_Client_Task.obj" \
	"$(INTDIR)\Notify\ID_Factory.obj" \
	"$(INTDIR)\Notify\Method_Request.obj" \
	"$(INTDIR)\Notify\Method_Request_Dispatch.obj" \
	"$(INTDIR)\Notify\Method_Request_Event.obj" \
	"$(INTDIR)\Notify\Method_Request_Lookup.obj" \
	"$(INTDIR)\Notify\Method_Request_Shutdown.obj" \
	"$(INTDIR)\Notify\Method_Request_Updates.obj" \
	"$(INTDIR)\Notify\Name_Value_Pair.obj" \
	"$(INTDIR)\Notify\Notify_Constraint_Interpreter.obj" \
	"$(INTDIR)\Notify\Notify_Constraint_Visitors.obj" \
	"$(INTDIR)\Notify\Notify_Default_Collection_Factory.obj" \
	"$(INTDIR)\Notify\Notify_Default_CO_Factory.obj" \
	"$(INTDIR)\Notify\Notify_Default_EMO_Factory.obj" \
	"$(INTDIR)\Notify\Notify_Default_POA_Factory.obj" \
	"$(INTDIR)\Notify\Notify_EventChannelFactory_i.obj" \
	"$(INTDIR)\Notify\Object.obj" \
	"$(INTDIR)\Notify\Peer.obj" \
	"$(INTDIR)\Notify\Persistent_File_Allocator.obj" \
	"$(INTDIR)\Notify\POA_Helper.obj" \
	"$(INTDIR)\Notify\Properties.obj" \
	"$(INTDIR)\Notify\PropertySeq.obj" \
	"$(INTDIR)\Notify\Property_Boolean.obj" \
	"$(INTDIR)\Notify\Proxy.obj" \
	"$(INTDIR)\Notify\ProxyConsumer.obj" \
	"$(INTDIR)\Notify\ProxySupplier.obj" \
	"$(INTDIR)\Notify\QoSProperties.obj" \
	"$(INTDIR)\Notify\Random_File.obj" \
	"$(INTDIR)\Notify\Reactive_Task.obj" \
	"$(INTDIR)\Notify\Refcountable.obj" \
	"$(INTDIR)\Notify\Reconnection_Registry.obj" \
	"$(INTDIR)\Notify\Routing_Slip.obj" \
	"$(INTDIR)\Notify\Routing_Slip_Persistence_Manager.obj" \
	"$(INTDIR)\Notify\Routing_Slip_Queue.obj" \
	"$(INTDIR)\Notify\Service.obj" \
	"$(INTDIR)\Notify\Subscription_Change_Worker.obj" \
	"$(INTDIR)\Notify\Supplier.obj" \
	"$(INTDIR)\Notify\SupplierAdmin.obj" \
	"$(INTDIR)\Notify\Standard_Event_Persistence.obj" \
	"$(INTDIR)\Notify\ThreadPool_Task.obj" \
	"$(INTDIR)\Notify\Timer_Queue.obj" \
	"$(INTDIR)\Notify\Timer_Reactor.obj" \
	"$(INTDIR)\Notify\Topology_Loader.obj" \
	"$(INTDIR)\Notify\Topology_Object.obj" \
	"$(INTDIR)\Notify\Topology_Saver.obj" \
	"$(INTDIR)\Notify\Worker_Task.obj" \
	"$(INTDIR)\Notify\Any\AnyEvent.obj" \
	"$(INTDIR)\Notify\Any\CosEC_ProxyPushConsumer.obj" \
	"$(INTDIR)\Notify\Any\CosEC_ProxyPushSupplier.obj" \
	"$(INTDIR)\Notify\Any\ProxyPushConsumer.obj" \
	"$(INTDIR)\Notify\Any\ProxyPushSupplier.obj" \
	"$(INTDIR)\Notify\Any\PushConsumer.obj" \
	"$(INTDIR)\Notify\Any\PushSupplier.obj" \
	"$(INTDIR)\Notify\Sequence\SequenceProxyPushConsumer.obj" \
	"$(INTDIR)\Notify\Sequence\SequenceProxyPushSupplier.obj" \
	"$(INTDIR)\Notify\Sequence\SequencePushConsumer.obj" \
	"$(INTDIR)\Notify\Sequence\SequencePushSupplier.obj" \
	"$(INTDIR)\Notify\Structured\StructuredEvent.obj" \
	"$(INTDIR)\Notify\Structured\StructuredProxyPushConsumer.obj" \
	"$(INTDIR)\Notify\Structured\StructuredProxyPushSupplier.obj" \
	"$(INTDIR)\Notify\Structured\StructuredPushConsumer.obj" \
	"$(INTDIR)\Notify\Structured\StructuredPushSupplier.obj"

"$(OUTDIR)\TAO_CosNotification_Servsd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_CosNotification_Servsd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_CosNotification_Servsd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\CosNotification_Serv\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_CosNotification_Servs.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.CosNotification_Serv.dep" "Notify\Admin.cpp" "Notify\AdminProperties.cpp" "Notify\Bit_Vector.cpp" "Notify\Buffering_Strategy.cpp" "Notify\Builder.cpp" "Notify\Consumer.cpp" "Notify\ConsumerAdmin.cpp" "Notify\CosNotify_Initializer.cpp" "Notify\CosNotify_Service.cpp" "Notify\Default_Factory.cpp" "Notify\Delivery_Request.cpp" "Notify\ETCL_Filter.cpp" "Notify\ETCL_FilterFactory.cpp" "Notify\Event.cpp" "Notify\EventChannel.cpp" "Notify\EventChannelFactory.cpp" "Notify\EventType.cpp" "Notify\EventTypeSeq.cpp" "Notify\Event_Manager.cpp" "Notify\Event_Persistence_Factory.cpp" "Notify\FilterAdmin.cpp" "Notify\Validate_Client_Task.cpp" "Notify\ID_Factory.cpp" "Notify\Method_Request.cpp" "Notify\Method_Request_Dispatch.cpp" "Notify\Method_Request_Event.cpp" "Notify\Method_Request_Lookup.cpp" "Notify\Method_Request_Shutdown.cpp" "Notify\Method_Request_Updates.cpp" "Notify\Name_Value_Pair.cpp" "Notify\Notify_Constraint_Interpreter.cpp" "Notify\Notify_Constraint_Visitors.cpp" "Notify\Notify_Default_Collection_Factory.cpp" "Notify\Notify_Default_CO_Factory.cpp" "Notify\Notify_Default_EMO_Factory.cpp" "Notify\Notify_Default_POA_Factory.cpp" "Notify\Notify_EventChannelFactory_i.cpp" "Notify\Object.cpp" "Notify\Peer.cpp" "Notify\Persistent_File_Allocator.cpp" "Notify\POA_Helper.cpp" "Notify\Properties.cpp" "Notify\PropertySeq.cpp" "Notify\Property_Boolean.cpp" "Notify\Proxy.cpp" "Notify\ProxyConsumer.cpp" "Notify\ProxySupplier.cpp" "Notify\QoSProperties.cpp" "Notify\Random_File.cpp" "Notify\Reactive_Task.cpp" "Notify\Refcountable.cpp" "Notify\Reconnection_Registry.cpp" "Notify\Routing_Slip.cpp" "Notify\Routing_Slip_Persistence_Manager.cpp" "Notify\Routing_Slip_Queue.cpp" "Notify\Service.cpp" "Notify\Subscription_Change_Worker.cpp" "Notify\Supplier.cpp" "Notify\SupplierAdmin.cpp" "Notify\Standard_Event_Persistence.cpp" "Notify\ThreadPool_Task.cpp" "Notify\Timer_Queue.cpp" "Notify\Timer_Reactor.cpp" "Notify\Topology_Loader.cpp" "Notify\Topology_Object.cpp" "Notify\Topology_Saver.cpp" "Notify\Worker_Task.cpp" "Notify\Any\AnyEvent.cpp" "Notify\Any\CosEC_ProxyPushConsumer.cpp" "Notify\Any\CosEC_ProxyPushSupplier.cpp" "Notify\Any\ProxyPushConsumer.cpp" "Notify\Any\ProxyPushSupplier.cpp" "Notify\Any\PushConsumer.cpp" "Notify\Any\PushSupplier.cpp" "Notify\Sequence\SequenceProxyPushConsumer.cpp" "Notify\Sequence\SequenceProxyPushSupplier.cpp" "Notify\Sequence\SequencePushConsumer.cpp" "Notify\Sequence\SequencePushSupplier.cpp" "Notify\Structured\StructuredEvent.cpp" "Notify\Structured\StructuredProxyPushConsumer.cpp" "Notify\Structured\StructuredProxyPushSupplier.cpp" "Notify\Structured\StructuredPushConsumer.cpp" "Notify\Structured\StructuredPushSupplier.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_Servs.lib"
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_Servs.exp"
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_Servs.ilk"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\CosNotification_Serv\$(NULL)" mkdir "Static_Release\CosNotification_Serv"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_CosNotification_Servs.lib"
LINK32_OBJS= \
	"$(INTDIR)\Notify\Admin.obj" \
	"$(INTDIR)\Notify\AdminProperties.obj" \
	"$(INTDIR)\Notify\Bit_Vector.obj" \
	"$(INTDIR)\Notify\Buffering_Strategy.obj" \
	"$(INTDIR)\Notify\Builder.obj" \
	"$(INTDIR)\Notify\Consumer.obj" \
	"$(INTDIR)\Notify\ConsumerAdmin.obj" \
	"$(INTDIR)\Notify\CosNotify_Initializer.obj" \
	"$(INTDIR)\Notify\CosNotify_Service.obj" \
	"$(INTDIR)\Notify\Default_Factory.obj" \
	"$(INTDIR)\Notify\Delivery_Request.obj" \
	"$(INTDIR)\Notify\ETCL_Filter.obj" \
	"$(INTDIR)\Notify\ETCL_FilterFactory.obj" \
	"$(INTDIR)\Notify\Event.obj" \
	"$(INTDIR)\Notify\EventChannel.obj" \
	"$(INTDIR)\Notify\EventChannelFactory.obj" \
	"$(INTDIR)\Notify\EventType.obj" \
	"$(INTDIR)\Notify\EventTypeSeq.obj" \
	"$(INTDIR)\Notify\Event_Manager.obj" \
	"$(INTDIR)\Notify\Event_Persistence_Factory.obj" \
	"$(INTDIR)\Notify\FilterAdmin.obj" \
	"$(INTDIR)\Notify\Validate_Client_Task.obj" \
	"$(INTDIR)\Notify\ID_Factory.obj" \
	"$(INTDIR)\Notify\Method_Request.obj" \
	"$(INTDIR)\Notify\Method_Request_Dispatch.obj" \
	"$(INTDIR)\Notify\Method_Request_Event.obj" \
	"$(INTDIR)\Notify\Method_Request_Lookup.obj" \
	"$(INTDIR)\Notify\Method_Request_Shutdown.obj" \
	"$(INTDIR)\Notify\Method_Request_Updates.obj" \
	"$(INTDIR)\Notify\Name_Value_Pair.obj" \
	"$(INTDIR)\Notify\Notify_Constraint_Interpreter.obj" \
	"$(INTDIR)\Notify\Notify_Constraint_Visitors.obj" \
	"$(INTDIR)\Notify\Notify_Default_Collection_Factory.obj" \
	"$(INTDIR)\Notify\Notify_Default_CO_Factory.obj" \
	"$(INTDIR)\Notify\Notify_Default_EMO_Factory.obj" \
	"$(INTDIR)\Notify\Notify_Default_POA_Factory.obj" \
	"$(INTDIR)\Notify\Notify_EventChannelFactory_i.obj" \
	"$(INTDIR)\Notify\Object.obj" \
	"$(INTDIR)\Notify\Peer.obj" \
	"$(INTDIR)\Notify\Persistent_File_Allocator.obj" \
	"$(INTDIR)\Notify\POA_Helper.obj" \
	"$(INTDIR)\Notify\Properties.obj" \
	"$(INTDIR)\Notify\PropertySeq.obj" \
	"$(INTDIR)\Notify\Property_Boolean.obj" \
	"$(INTDIR)\Notify\Proxy.obj" \
	"$(INTDIR)\Notify\ProxyConsumer.obj" \
	"$(INTDIR)\Notify\ProxySupplier.obj" \
	"$(INTDIR)\Notify\QoSProperties.obj" \
	"$(INTDIR)\Notify\Random_File.obj" \
	"$(INTDIR)\Notify\Reactive_Task.obj" \
	"$(INTDIR)\Notify\Refcountable.obj" \
	"$(INTDIR)\Notify\Reconnection_Registry.obj" \
	"$(INTDIR)\Notify\Routing_Slip.obj" \
	"$(INTDIR)\Notify\Routing_Slip_Persistence_Manager.obj" \
	"$(INTDIR)\Notify\Routing_Slip_Queue.obj" \
	"$(INTDIR)\Notify\Service.obj" \
	"$(INTDIR)\Notify\Subscription_Change_Worker.obj" \
	"$(INTDIR)\Notify\Supplier.obj" \
	"$(INTDIR)\Notify\SupplierAdmin.obj" \
	"$(INTDIR)\Notify\Standard_Event_Persistence.obj" \
	"$(INTDIR)\Notify\ThreadPool_Task.obj" \
	"$(INTDIR)\Notify\Timer_Queue.obj" \
	"$(INTDIR)\Notify\Timer_Reactor.obj" \
	"$(INTDIR)\Notify\Topology_Loader.obj" \
	"$(INTDIR)\Notify\Topology_Object.obj" \
	"$(INTDIR)\Notify\Topology_Saver.obj" \
	"$(INTDIR)\Notify\Worker_Task.obj" \
	"$(INTDIR)\Notify\Any\AnyEvent.obj" \
	"$(INTDIR)\Notify\Any\CosEC_ProxyPushConsumer.obj" \
	"$(INTDIR)\Notify\Any\CosEC_ProxyPushSupplier.obj" \
	"$(INTDIR)\Notify\Any\ProxyPushConsumer.obj" \
	"$(INTDIR)\Notify\Any\ProxyPushSupplier.obj" \
	"$(INTDIR)\Notify\Any\PushConsumer.obj" \
	"$(INTDIR)\Notify\Any\PushSupplier.obj" \
	"$(INTDIR)\Notify\Sequence\SequenceProxyPushConsumer.obj" \
	"$(INTDIR)\Notify\Sequence\SequenceProxyPushSupplier.obj" \
	"$(INTDIR)\Notify\Sequence\SequencePushConsumer.obj" \
	"$(INTDIR)\Notify\Sequence\SequencePushSupplier.obj" \
	"$(INTDIR)\Notify\Structured\StructuredEvent.obj" \
	"$(INTDIR)\Notify\Structured\StructuredProxyPushConsumer.obj" \
	"$(INTDIR)\Notify\Structured\StructuredProxyPushSupplier.obj" \
	"$(INTDIR)\Notify\Structured\StructuredPushConsumer.obj" \
	"$(INTDIR)\Notify\Structured\StructuredPushSupplier.obj"

"$(OUTDIR)\TAO_CosNotification_Servs.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_CosNotification_Servs.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_CosNotification_Servs.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.CosNotification_Serv.dep")
!INCLUDE "Makefile.CosNotification_Serv.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="Notify\Admin.cpp"

"$(INTDIR)\Notify\Admin.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Admin.obj" $(SOURCE)

SOURCE="Notify\AdminProperties.cpp"

"$(INTDIR)\Notify\AdminProperties.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\AdminProperties.obj" $(SOURCE)

SOURCE="Notify\Bit_Vector.cpp"

"$(INTDIR)\Notify\Bit_Vector.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Bit_Vector.obj" $(SOURCE)

SOURCE="Notify\Buffering_Strategy.cpp"

"$(INTDIR)\Notify\Buffering_Strategy.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Buffering_Strategy.obj" $(SOURCE)

SOURCE="Notify\Builder.cpp"

"$(INTDIR)\Notify\Builder.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Builder.obj" $(SOURCE)

SOURCE="Notify\Consumer.cpp"

"$(INTDIR)\Notify\Consumer.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Consumer.obj" $(SOURCE)

SOURCE="Notify\ConsumerAdmin.cpp"

"$(INTDIR)\Notify\ConsumerAdmin.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\ConsumerAdmin.obj" $(SOURCE)

SOURCE="Notify\CosNotify_Initializer.cpp"

"$(INTDIR)\Notify\CosNotify_Initializer.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\CosNotify_Initializer.obj" $(SOURCE)

SOURCE="Notify\CosNotify_Service.cpp"

"$(INTDIR)\Notify\CosNotify_Service.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\CosNotify_Service.obj" $(SOURCE)

SOURCE="Notify\Default_Factory.cpp"

"$(INTDIR)\Notify\Default_Factory.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Default_Factory.obj" $(SOURCE)

SOURCE="Notify\Delivery_Request.cpp"

"$(INTDIR)\Notify\Delivery_Request.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Delivery_Request.obj" $(SOURCE)

SOURCE="Notify\ETCL_Filter.cpp"

"$(INTDIR)\Notify\ETCL_Filter.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\ETCL_Filter.obj" $(SOURCE)

SOURCE="Notify\ETCL_FilterFactory.cpp"

"$(INTDIR)\Notify\ETCL_FilterFactory.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\ETCL_FilterFactory.obj" $(SOURCE)

SOURCE="Notify\Event.cpp"

"$(INTDIR)\Notify\Event.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Event.obj" $(SOURCE)

SOURCE="Notify\EventChannel.cpp"

"$(INTDIR)\Notify\EventChannel.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\EventChannel.obj" $(SOURCE)

SOURCE="Notify\EventChannelFactory.cpp"

"$(INTDIR)\Notify\EventChannelFactory.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\EventChannelFactory.obj" $(SOURCE)

SOURCE="Notify\EventType.cpp"

"$(INTDIR)\Notify\EventType.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\EventType.obj" $(SOURCE)

SOURCE="Notify\EventTypeSeq.cpp"

"$(INTDIR)\Notify\EventTypeSeq.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\EventTypeSeq.obj" $(SOURCE)

SOURCE="Notify\Event_Manager.cpp"

"$(INTDIR)\Notify\Event_Manager.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Event_Manager.obj" $(SOURCE)

SOURCE="Notify\Event_Persistence_Factory.cpp"

"$(INTDIR)\Notify\Event_Persistence_Factory.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Event_Persistence_Factory.obj" $(SOURCE)

SOURCE="Notify\FilterAdmin.cpp"

"$(INTDIR)\Notify\FilterAdmin.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\FilterAdmin.obj" $(SOURCE)

SOURCE="Notify\Validate_Client_Task.cpp"

"$(INTDIR)\Notify\Validate_Client_Task.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Validate_Client_Task.obj" $(SOURCE)

SOURCE="Notify\ID_Factory.cpp"

"$(INTDIR)\Notify\ID_Factory.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\ID_Factory.obj" $(SOURCE)

SOURCE="Notify\Method_Request.cpp"

"$(INTDIR)\Notify\Method_Request.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Method_Request.obj" $(SOURCE)

SOURCE="Notify\Method_Request_Dispatch.cpp"

"$(INTDIR)\Notify\Method_Request_Dispatch.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Method_Request_Dispatch.obj" $(SOURCE)

SOURCE="Notify\Method_Request_Event.cpp"

"$(INTDIR)\Notify\Method_Request_Event.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Method_Request_Event.obj" $(SOURCE)

SOURCE="Notify\Method_Request_Lookup.cpp"

"$(INTDIR)\Notify\Method_Request_Lookup.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Method_Request_Lookup.obj" $(SOURCE)

SOURCE="Notify\Method_Request_Shutdown.cpp"

"$(INTDIR)\Notify\Method_Request_Shutdown.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Method_Request_Shutdown.obj" $(SOURCE)

SOURCE="Notify\Method_Request_Updates.cpp"

"$(INTDIR)\Notify\Method_Request_Updates.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Method_Request_Updates.obj" $(SOURCE)

SOURCE="Notify\Name_Value_Pair.cpp"

"$(INTDIR)\Notify\Name_Value_Pair.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Name_Value_Pair.obj" $(SOURCE)

SOURCE="Notify\Notify_Constraint_Interpreter.cpp"

"$(INTDIR)\Notify\Notify_Constraint_Interpreter.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Notify_Constraint_Interpreter.obj" $(SOURCE)

SOURCE="Notify\Notify_Constraint_Visitors.cpp"

"$(INTDIR)\Notify\Notify_Constraint_Visitors.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Notify_Constraint_Visitors.obj" $(SOURCE)

SOURCE="Notify\Notify_Default_Collection_Factory.cpp"

"$(INTDIR)\Notify\Notify_Default_Collection_Factory.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Notify_Default_Collection_Factory.obj" $(SOURCE)

SOURCE="Notify\Notify_Default_CO_Factory.cpp"

"$(INTDIR)\Notify\Notify_Default_CO_Factory.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Notify_Default_CO_Factory.obj" $(SOURCE)

SOURCE="Notify\Notify_Default_EMO_Factory.cpp"

"$(INTDIR)\Notify\Notify_Default_EMO_Factory.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Notify_Default_EMO_Factory.obj" $(SOURCE)

SOURCE="Notify\Notify_Default_POA_Factory.cpp"

"$(INTDIR)\Notify\Notify_Default_POA_Factory.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Notify_Default_POA_Factory.obj" $(SOURCE)

SOURCE="Notify\Notify_EventChannelFactory_i.cpp"

"$(INTDIR)\Notify\Notify_EventChannelFactory_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Notify_EventChannelFactory_i.obj" $(SOURCE)

SOURCE="Notify\Object.cpp"

"$(INTDIR)\Notify\Object.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Object.obj" $(SOURCE)

SOURCE="Notify\Peer.cpp"

"$(INTDIR)\Notify\Peer.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Peer.obj" $(SOURCE)

SOURCE="Notify\Persistent_File_Allocator.cpp"

"$(INTDIR)\Notify\Persistent_File_Allocator.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Persistent_File_Allocator.obj" $(SOURCE)

SOURCE="Notify\POA_Helper.cpp"

"$(INTDIR)\Notify\POA_Helper.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\POA_Helper.obj" $(SOURCE)

SOURCE="Notify\Properties.cpp"

"$(INTDIR)\Notify\Properties.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Properties.obj" $(SOURCE)

SOURCE="Notify\PropertySeq.cpp"

"$(INTDIR)\Notify\PropertySeq.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\PropertySeq.obj" $(SOURCE)

SOURCE="Notify\Property_Boolean.cpp"

"$(INTDIR)\Notify\Property_Boolean.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Property_Boolean.obj" $(SOURCE)

SOURCE="Notify\Proxy.cpp"

"$(INTDIR)\Notify\Proxy.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Proxy.obj" $(SOURCE)

SOURCE="Notify\ProxyConsumer.cpp"

"$(INTDIR)\Notify\ProxyConsumer.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\ProxyConsumer.obj" $(SOURCE)

SOURCE="Notify\ProxySupplier.cpp"

"$(INTDIR)\Notify\ProxySupplier.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\ProxySupplier.obj" $(SOURCE)

SOURCE="Notify\QoSProperties.cpp"

"$(INTDIR)\Notify\QoSProperties.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\QoSProperties.obj" $(SOURCE)

SOURCE="Notify\Random_File.cpp"

"$(INTDIR)\Notify\Random_File.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Random_File.obj" $(SOURCE)

SOURCE="Notify\Reactive_Task.cpp"

"$(INTDIR)\Notify\Reactive_Task.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Reactive_Task.obj" $(SOURCE)

SOURCE="Notify\Refcountable.cpp"

"$(INTDIR)\Notify\Refcountable.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Refcountable.obj" $(SOURCE)

SOURCE="Notify\Reconnection_Registry.cpp"

"$(INTDIR)\Notify\Reconnection_Registry.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Reconnection_Registry.obj" $(SOURCE)

SOURCE="Notify\Routing_Slip.cpp"

"$(INTDIR)\Notify\Routing_Slip.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Routing_Slip.obj" $(SOURCE)

SOURCE="Notify\Routing_Slip_Persistence_Manager.cpp"

"$(INTDIR)\Notify\Routing_Slip_Persistence_Manager.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Routing_Slip_Persistence_Manager.obj" $(SOURCE)

SOURCE="Notify\Routing_Slip_Queue.cpp"

"$(INTDIR)\Notify\Routing_Slip_Queue.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Routing_Slip_Queue.obj" $(SOURCE)

SOURCE="Notify\Service.cpp"

"$(INTDIR)\Notify\Service.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Service.obj" $(SOURCE)

SOURCE="Notify\Subscription_Change_Worker.cpp"

"$(INTDIR)\Notify\Subscription_Change_Worker.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Subscription_Change_Worker.obj" $(SOURCE)

SOURCE="Notify\Supplier.cpp"

"$(INTDIR)\Notify\Supplier.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Supplier.obj" $(SOURCE)

SOURCE="Notify\SupplierAdmin.cpp"

"$(INTDIR)\Notify\SupplierAdmin.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\SupplierAdmin.obj" $(SOURCE)

SOURCE="Notify\Standard_Event_Persistence.cpp"

"$(INTDIR)\Notify\Standard_Event_Persistence.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Standard_Event_Persistence.obj" $(SOURCE)

SOURCE="Notify\ThreadPool_Task.cpp"

"$(INTDIR)\Notify\ThreadPool_Task.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\ThreadPool_Task.obj" $(SOURCE)

SOURCE="Notify\Timer_Queue.cpp"

"$(INTDIR)\Notify\Timer_Queue.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Timer_Queue.obj" $(SOURCE)

SOURCE="Notify\Timer_Reactor.cpp"

"$(INTDIR)\Notify\Timer_Reactor.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Timer_Reactor.obj" $(SOURCE)

SOURCE="Notify\Topology_Loader.cpp"

"$(INTDIR)\Notify\Topology_Loader.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Topology_Loader.obj" $(SOURCE)

SOURCE="Notify\Topology_Object.cpp"

"$(INTDIR)\Notify\Topology_Object.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Topology_Object.obj" $(SOURCE)

SOURCE="Notify\Topology_Saver.cpp"

"$(INTDIR)\Notify\Topology_Saver.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Topology_Saver.obj" $(SOURCE)

SOURCE="Notify\Worker_Task.cpp"

"$(INTDIR)\Notify\Worker_Task.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Worker_Task.obj" $(SOURCE)

SOURCE="Notify\Any\AnyEvent.cpp"

"$(INTDIR)\Notify\Any\AnyEvent.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\Any\$(NULL)" mkdir "$(INTDIR)\Notify\Any\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Any\AnyEvent.obj" $(SOURCE)

SOURCE="Notify\Any\CosEC_ProxyPushConsumer.cpp"

"$(INTDIR)\Notify\Any\CosEC_ProxyPushConsumer.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\Any\$(NULL)" mkdir "$(INTDIR)\Notify\Any\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Any\CosEC_ProxyPushConsumer.obj" $(SOURCE)

SOURCE="Notify\Any\CosEC_ProxyPushSupplier.cpp"

"$(INTDIR)\Notify\Any\CosEC_ProxyPushSupplier.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\Any\$(NULL)" mkdir "$(INTDIR)\Notify\Any\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Any\CosEC_ProxyPushSupplier.obj" $(SOURCE)

SOURCE="Notify\Any\ProxyPushConsumer.cpp"

"$(INTDIR)\Notify\Any\ProxyPushConsumer.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\Any\$(NULL)" mkdir "$(INTDIR)\Notify\Any\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Any\ProxyPushConsumer.obj" $(SOURCE)

SOURCE="Notify\Any\ProxyPushSupplier.cpp"

"$(INTDIR)\Notify\Any\ProxyPushSupplier.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\Any\$(NULL)" mkdir "$(INTDIR)\Notify\Any\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Any\ProxyPushSupplier.obj" $(SOURCE)

SOURCE="Notify\Any\PushConsumer.cpp"

"$(INTDIR)\Notify\Any\PushConsumer.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\Any\$(NULL)" mkdir "$(INTDIR)\Notify\Any\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Any\PushConsumer.obj" $(SOURCE)

SOURCE="Notify\Any\PushSupplier.cpp"

"$(INTDIR)\Notify\Any\PushSupplier.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\Any\$(NULL)" mkdir "$(INTDIR)\Notify\Any\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Any\PushSupplier.obj" $(SOURCE)

SOURCE="Notify\Sequence\SequenceProxyPushConsumer.cpp"

"$(INTDIR)\Notify\Sequence\SequenceProxyPushConsumer.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\Sequence\$(NULL)" mkdir "$(INTDIR)\Notify\Sequence\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Sequence\SequenceProxyPushConsumer.obj" $(SOURCE)

SOURCE="Notify\Sequence\SequenceProxyPushSupplier.cpp"

"$(INTDIR)\Notify\Sequence\SequenceProxyPushSupplier.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\Sequence\$(NULL)" mkdir "$(INTDIR)\Notify\Sequence\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Sequence\SequenceProxyPushSupplier.obj" $(SOURCE)

SOURCE="Notify\Sequence\SequencePushConsumer.cpp"

"$(INTDIR)\Notify\Sequence\SequencePushConsumer.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\Sequence\$(NULL)" mkdir "$(INTDIR)\Notify\Sequence\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Sequence\SequencePushConsumer.obj" $(SOURCE)

SOURCE="Notify\Sequence\SequencePushSupplier.cpp"

"$(INTDIR)\Notify\Sequence\SequencePushSupplier.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\Sequence\$(NULL)" mkdir "$(INTDIR)\Notify\Sequence\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Sequence\SequencePushSupplier.obj" $(SOURCE)

SOURCE="Notify\Structured\StructuredEvent.cpp"

"$(INTDIR)\Notify\Structured\StructuredEvent.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\Structured\$(NULL)" mkdir "$(INTDIR)\Notify\Structured\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Structured\StructuredEvent.obj" $(SOURCE)

SOURCE="Notify\Structured\StructuredProxyPushConsumer.cpp"

"$(INTDIR)\Notify\Structured\StructuredProxyPushConsumer.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\Structured\$(NULL)" mkdir "$(INTDIR)\Notify\Structured\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Structured\StructuredProxyPushConsumer.obj" $(SOURCE)

SOURCE="Notify\Structured\StructuredProxyPushSupplier.cpp"

"$(INTDIR)\Notify\Structured\StructuredProxyPushSupplier.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\Structured\$(NULL)" mkdir "$(INTDIR)\Notify\Structured\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Structured\StructuredProxyPushSupplier.obj" $(SOURCE)

SOURCE="Notify\Structured\StructuredPushConsumer.cpp"

"$(INTDIR)\Notify\Structured\StructuredPushConsumer.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\Structured\$(NULL)" mkdir "$(INTDIR)\Notify\Structured\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Structured\StructuredPushConsumer.obj" $(SOURCE)

SOURCE="Notify\Structured\StructuredPushSupplier.cpp"

"$(INTDIR)\Notify\Structured\StructuredPushSupplier.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\Structured\$(NULL)" mkdir "$(INTDIR)\Notify\Structured\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Structured\StructuredPushSupplier.obj" $(SOURCE)

!IF  "$(CFG)" == "Win64 Debug"
!ELSEIF  "$(CFG)" == "Win64 Release"
!ELSEIF  "$(CFG)" == "Win64 Static Debug"
!ELSEIF  "$(CFG)" == "Win64 Static Release"
!ENDIF

SOURCE="CosNotification_Serv.rc"

"$(INTDIR)\CosNotification_Serv.res" : $(SOURCE)
	$(RSC) /l 0x409 /fo"$(INTDIR)\CosNotification_Serv.res" /d NDEBUG /d WIN64 /d _CRT_SECURE_NO_WARNINGS /d _CRT_SECURE_NO_DEPRECATE /d _CRT_NONSTDC_NO_DEPRECATE /d TAO_HAS_TYPED_EVENT_CHANNEL /i "..\..\.." /i "..\.." /i "..\..\orbsvcs" $(SOURCE)



!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.CosNotification_Serv.dep")
	@echo Using "Makefile.CosNotification_Serv.dep"
!ELSE
	@echo Warning: cannot find "Makefile.CosNotification_Serv.dep"
!ENDIF
!ENDIF

