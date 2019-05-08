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
!MESSAGE NMAKE /f "Makefile.TAO.mak" CFG="Win64 Debug"
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

OUTDIR=..\..\lib
INTDIR=Debug\TAO\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\lib\TAOd.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\.." -I".." -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_VALUETYPE_OUT_INDIRECTION -DTAO_BUILD_DLL -f "Makefile.TAO.dep" "Dynamic_Adapter.cpp" "Policy_Manager.cpp" "Abstract_Servant_Base.cpp" "Acceptor_Filter.cpp" "Acceptor_Registry.cpp" "Adapter.cpp" "Adapter_Factory.cpp" "Adapter_Registry.cpp" "AnyTypeCode_Adapter.cpp" "Argument.cpp" "Asynch_Queued_Message.cpp" "Asynch_Reply_Dispatcher_Base.cpp" "Base_Transport_Property.cpp" "BiDir_Adapter.cpp" "Bind_Dispatcher_Guard.cpp" "Block_Flushing_Strategy.cpp" "Blocked_Connect_Strategy.cpp" "BooleanSeqC.cpp" "CDR.cpp" "CharSeqC.cpp" "Cleanup_Func_Registry.cpp" "Client_Strategy_Factory.cpp" "ClientRequestInterceptor_Adapter_Factory.cpp" "ClientRequestInterceptor_Adapter.cpp" "Codeset_Manager.cpp" "Codeset_Manager_Factory_Base.cpp" "Codeset_Translator_Base.cpp" "Collocated_Invocation.cpp" "Collocation_Proxy_Broker.cpp" "Collocation_Resolver.cpp" "Connect_Strategy.cpp" "Connection_Handler.cpp" "Connection_Purging_Strategy.cpp" "Connector_Registry.cpp" "CONV_FRAMEC.cpp" "CORBA_String.cpp" "CORBALOC_Parser.cpp" "CORBANAME_Parser.cpp" "CurrentC.cpp" "debug.cpp" "default_client.cpp" "Default_Collocation_Resolver.cpp" "Default_Endpoint_Selector_Factory.cpp" "default_resource.cpp" "default_server.cpp" "Default_Stub_Factory.cpp" "Default_Thread_Lane_Resources_Manager.cpp" "DLL_Parser.cpp" "DoubleSeqC.cpp" "Endpoint.cpp" "Endpoint_Selector_Factory.cpp" "Environment.cpp" "Exception.cpp" "Exclusive_TMS.cpp" "Fault_Tolerance_Service.cpp" "FILE_Parser.cpp" "FloatSeqC.cpp" "Flushing_Strategy.cpp" "GIOP_Fragmentation_Strategy.cpp" "GIOP_Message_Base.cpp" "GIOP_Message_Generator_Parser.cpp" "GIOP_Message_Generator_Parser_10.cpp" "GIOP_Message_Generator_Parser_11.cpp" "GIOP_Message_Generator_Parser_12.cpp" "GIOP_Message_Generator_Parser_Impl.cpp" "GIOP_Message_Locate_Header.cpp" "GIOP_Message_State.cpp" "GIOP_Message_Version.cpp" "GIOPC.cpp" "HTTP_Client.cpp" "HTTP_Handler.cpp" "HTTP_Parser.cpp" "IFR_Client_Adapter.cpp" "IIOP_Acceptor.cpp" "IIOP_Connection_Handler.cpp" "IIOP_Connector.cpp" "IIOP_Endpoint.cpp" "IIOP_EndpointsC.cpp" "IIOP_Factory.cpp" "IIOP_Profile.cpp" "IIOP_Transport.cpp" "IIOPC.cpp" "Incoming_Message_Queue.cpp" "Incoming_Message_Stack.cpp" "Invocation_Adapter.cpp" "Invocation_Base.cpp" "Invocation_Endpoint_Selectors.cpp" "IOPC.cpp" "IOR_Parser.cpp" "IORInterceptor_Adapter.cpp" "IORInterceptor_Adapter_Factory.cpp" "Leader_Follower.cpp" "Leader_Follower_Flushing_Strategy.cpp" "LF_CH_Event.cpp" "LF_Connect_Strategy.cpp" "LF_Event.cpp" "LF_Event_Binder.cpp" "LF_Event_Loop_Thread_Helper.cpp" "LF_Follower.cpp" "LF_Follower_Auto_Adder.cpp" "LF_Follower_Auto_Ptr.cpp" "LF_Invocation_Event.cpp" "LF_Multi_Event.cpp" "LF_Strategy.cpp" "LF_Strategy_Complete.cpp" "LocalObject.cpp" "LocateRequest_Invocation.cpp" "LocateRequest_Invocation_Adapter.cpp" "LongDoubleSeqC.cpp" "LongLongSeqC.cpp" "LongSeqC.cpp" "LRU_Connection_Purging_Strategy.cpp" "MCAST_Parser.cpp" "Messaging_PolicyValueC.cpp" "Messaging_SyncScopeC.cpp" "MMAP_Allocator.cpp" "MProfile.cpp" "Muxed_TMS.cpp" "New_Leader_Generator.cpp" "NVList_Adapter.cpp" "Null_Fragmentation_Strategy.cpp" "Object.cpp" "Object_KeyC.cpp" "Object_Loader.cpp" "Object_Proxy_Broker.cpp" "Object_Ref_Table.cpp" "ObjectIdListC.cpp" "ObjectKey_Table.cpp" "OctetSeqC.cpp" "On_Demand_Fragmentation_Strategy.cpp" "operation_details.cpp" "ORB.cpp" "ORBInitializer_Registry.cpp" "ORBInitializer_Registry_Adapter.cpp" "orb_typesC.cpp" "ORB_Core.cpp" "ORB_Core_Auto_Ptr.cpp" "ORB_Core_TSS_Resources.cpp" "ORB_Table.cpp" "ParameterModeC.cpp" "params.cpp" "Parser_Registry.cpp" "PI_ForwardC.cpp" "Pluggable_Messaging_Utils.cpp" "Policy_Current.cpp" "Policy_CurrentC.cpp" "Policy_Current_Impl.cpp" "Policy_ForwardC.cpp" "Policy_ManagerC.cpp" "Policy_Set.cpp" "Policy_Validator.cpp" "PolicyC.cpp" "PolicyFactory_Registry_Adapter.cpp" "PolicyFactory_Registry_Factory.cpp" "PortableInterceptorC.cpp" "Principal.cpp" "Profile.cpp" "Profile_Transport_Resolver.cpp" "Protocol_Factory.cpp" "Protocols_Hooks.cpp" "Network_Priority_Protocols_Hooks.cpp" "Queued_Data.cpp" "Queued_Message.cpp" "Reactive_Connect_Strategy.cpp" "Reactive_Flushing_Strategy.cpp" "Refcounted_ObjectKey.cpp" "Remote_Invocation.cpp" "Remote_Object_Proxy_Broker.cpp" "Reply_Dispatcher.cpp" "Request_Dispatcher.cpp" "RequestInterceptor_Adapter.cpp" "Resource_Factory.cpp" "Resume_Handle.cpp" "Resume_Handle_Deferred.cpp" "Server_Strategy_Factory.cpp" "ServerRequestInterceptor_Adapter.cpp" "ServerRequestInterceptor_Adapter_Factory.cpp" "Service_Callbacks.cpp" "Service_Context.cpp" "Service_Context_Handler.cpp" "Service_Context_Handler_Registry.cpp" "Services_Activate.cpp" "ServicesC.cpp" "ShortSeqC.cpp" "String_Alloc.cpp" "StringSeqC.cpp" "Stub.cpp" "Stub_Factory.cpp" "Synch_Invocation.cpp" "Synch_Queued_Message.cpp" "Synch_Reply_Dispatcher.cpp" "SystemException.cpp" "Tagged_Components.cpp" "Tagged_Profile.cpp" "TAO_Internal.cpp" "TAO_Server_Request.cpp" "TAO_Singleton_Manager.cpp" "TAOC.cpp" "target_specification.cpp" "Thread_Lane_Resources.cpp" "Thread_Lane_Resources_Manager.cpp" "Thread_Per_Connection_Handler.cpp" "TimeBaseC.cpp" "Transport.cpp" "Transport_Acceptor.cpp" "Transport_Connector.cpp" "Transport_Descriptor_Interface.cpp" "Transport_Mux_Strategy.cpp" "Transport_Queueing_Strategies.cpp" "Transport_Selection_Guard.cpp" "Transport_Timer.cpp" "TSS_Resources.cpp" "TypeCodeFactory_Adapter.cpp" "Typecode_typesC.cpp" "ULongLongSeqC.cpp" "ULongSeqC.cpp" "UserException.cpp" "UShortSeqC.cpp" "Valuetype_Adapter.cpp" "Valuetype_Adapter_Factory.cpp" "Wait_On_Leader_Follower.cpp" "Wait_On_LF_No_Upcall.cpp" "Wait_On_Reactor.cpp" "Wait_On_Read.cpp" "Wait_Strategy.cpp" "WCharSeqC.cpp" "WrongTransactionC.cpp" "WStringSeqC.cpp" "GUIResource_Factory.cpp" "ZIOP_Adapter.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAOd.pdb"
	-@del /f/q "..\..\lib\TAOd.dll"
	-@del /f/q "$(OUTDIR)\TAOd.lib"
	-@del /f/q "$(OUTDIR)\TAOd.exp"
	-@del /f/q "$(OUTDIR)\TAOd.ilk"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\TAO\$(NULL)" mkdir "Debug\TAO"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\.." /I ".." /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_VALUETYPE_OUT_INDIRECTION /D TAO_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib /libpath:"." /libpath:"..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\lib\TAOd.pdb" /machine:IA64 /out:"..\..\lib\TAOd.dll" /implib:"$(OUTDIR)\TAOd.lib"
LINK32_OBJS= \
	"$(INTDIR)\tao.res" \
	"$(INTDIR)\Dynamic_Adapter.obj" \
	"$(INTDIR)\Policy_Manager.obj" \
	"$(INTDIR)\Abstract_Servant_Base.obj" \
	"$(INTDIR)\Acceptor_Filter.obj" \
	"$(INTDIR)\Acceptor_Registry.obj" \
	"$(INTDIR)\Adapter.obj" \
	"$(INTDIR)\Adapter_Factory.obj" \
	"$(INTDIR)\Adapter_Registry.obj" \
	"$(INTDIR)\AnyTypeCode_Adapter.obj" \
	"$(INTDIR)\Argument.obj" \
	"$(INTDIR)\Asynch_Queued_Message.obj" \
	"$(INTDIR)\Asynch_Reply_Dispatcher_Base.obj" \
	"$(INTDIR)\Base_Transport_Property.obj" \
	"$(INTDIR)\BiDir_Adapter.obj" \
	"$(INTDIR)\Bind_Dispatcher_Guard.obj" \
	"$(INTDIR)\Block_Flushing_Strategy.obj" \
	"$(INTDIR)\Blocked_Connect_Strategy.obj" \
	"$(INTDIR)\BooleanSeqC.obj" \
	"$(INTDIR)\CDR.obj" \
	"$(INTDIR)\CharSeqC.obj" \
	"$(INTDIR)\Cleanup_Func_Registry.obj" \
	"$(INTDIR)\Client_Strategy_Factory.obj" \
	"$(INTDIR)\ClientRequestInterceptor_Adapter_Factory.obj" \
	"$(INTDIR)\ClientRequestInterceptor_Adapter.obj" \
	"$(INTDIR)\Codeset_Manager.obj" \
	"$(INTDIR)\Codeset_Manager_Factory_Base.obj" \
	"$(INTDIR)\Codeset_Translator_Base.obj" \
	"$(INTDIR)\Collocated_Invocation.obj" \
	"$(INTDIR)\Collocation_Proxy_Broker.obj" \
	"$(INTDIR)\Collocation_Resolver.obj" \
	"$(INTDIR)\Connect_Strategy.obj" \
	"$(INTDIR)\Connection_Handler.obj" \
	"$(INTDIR)\Connection_Purging_Strategy.obj" \
	"$(INTDIR)\Connector_Registry.obj" \
	"$(INTDIR)\CONV_FRAMEC.obj" \
	"$(INTDIR)\CORBA_String.obj" \
	"$(INTDIR)\CORBALOC_Parser.obj" \
	"$(INTDIR)\CORBANAME_Parser.obj" \
	"$(INTDIR)\CurrentC.obj" \
	"$(INTDIR)\debug.obj" \
	"$(INTDIR)\default_client.obj" \
	"$(INTDIR)\Default_Collocation_Resolver.obj" \
	"$(INTDIR)\Default_Endpoint_Selector_Factory.obj" \
	"$(INTDIR)\default_resource.obj" \
	"$(INTDIR)\default_server.obj" \
	"$(INTDIR)\Default_Stub_Factory.obj" \
	"$(INTDIR)\Default_Thread_Lane_Resources_Manager.obj" \
	"$(INTDIR)\DLL_Parser.obj" \
	"$(INTDIR)\DoubleSeqC.obj" \
	"$(INTDIR)\Endpoint.obj" \
	"$(INTDIR)\Endpoint_Selector_Factory.obj" \
	"$(INTDIR)\Environment.obj" \
	"$(INTDIR)\Exception.obj" \
	"$(INTDIR)\Exclusive_TMS.obj" \
	"$(INTDIR)\Fault_Tolerance_Service.obj" \
	"$(INTDIR)\FILE_Parser.obj" \
	"$(INTDIR)\FloatSeqC.obj" \
	"$(INTDIR)\Flushing_Strategy.obj" \
	"$(INTDIR)\GIOP_Fragmentation_Strategy.obj" \
	"$(INTDIR)\GIOP_Message_Base.obj" \
	"$(INTDIR)\GIOP_Message_Generator_Parser.obj" \
	"$(INTDIR)\GIOP_Message_Generator_Parser_10.obj" \
	"$(INTDIR)\GIOP_Message_Generator_Parser_11.obj" \
	"$(INTDIR)\GIOP_Message_Generator_Parser_12.obj" \
	"$(INTDIR)\GIOP_Message_Generator_Parser_Impl.obj" \
	"$(INTDIR)\GIOP_Message_Locate_Header.obj" \
	"$(INTDIR)\GIOP_Message_State.obj" \
	"$(INTDIR)\GIOP_Message_Version.obj" \
	"$(INTDIR)\GIOPC.obj" \
	"$(INTDIR)\HTTP_Client.obj" \
	"$(INTDIR)\HTTP_Handler.obj" \
	"$(INTDIR)\HTTP_Parser.obj" \
	"$(INTDIR)\IFR_Client_Adapter.obj" \
	"$(INTDIR)\IIOP_Acceptor.obj" \
	"$(INTDIR)\IIOP_Connection_Handler.obj" \
	"$(INTDIR)\IIOP_Connector.obj" \
	"$(INTDIR)\IIOP_Endpoint.obj" \
	"$(INTDIR)\IIOP_EndpointsC.obj" \
	"$(INTDIR)\IIOP_Factory.obj" \
	"$(INTDIR)\IIOP_Profile.obj" \
	"$(INTDIR)\IIOP_Transport.obj" \
	"$(INTDIR)\IIOPC.obj" \
	"$(INTDIR)\Incoming_Message_Queue.obj" \
	"$(INTDIR)\Incoming_Message_Stack.obj" \
	"$(INTDIR)\Invocation_Adapter.obj" \
	"$(INTDIR)\Invocation_Base.obj" \
	"$(INTDIR)\Invocation_Endpoint_Selectors.obj" \
	"$(INTDIR)\IOPC.obj" \
	"$(INTDIR)\IOR_Parser.obj" \
	"$(INTDIR)\IORInterceptor_Adapter.obj" \
	"$(INTDIR)\IORInterceptor_Adapter_Factory.obj" \
	"$(INTDIR)\Leader_Follower.obj" \
	"$(INTDIR)\Leader_Follower_Flushing_Strategy.obj" \
	"$(INTDIR)\LF_CH_Event.obj" \
	"$(INTDIR)\LF_Connect_Strategy.obj" \
	"$(INTDIR)\LF_Event.obj" \
	"$(INTDIR)\LF_Event_Binder.obj" \
	"$(INTDIR)\LF_Event_Loop_Thread_Helper.obj" \
	"$(INTDIR)\LF_Follower.obj" \
	"$(INTDIR)\LF_Follower_Auto_Adder.obj" \
	"$(INTDIR)\LF_Follower_Auto_Ptr.obj" \
	"$(INTDIR)\LF_Invocation_Event.obj" \
	"$(INTDIR)\LF_Multi_Event.obj" \
	"$(INTDIR)\LF_Strategy.obj" \
	"$(INTDIR)\LF_Strategy_Complete.obj" \
	"$(INTDIR)\LocalObject.obj" \
	"$(INTDIR)\LocateRequest_Invocation.obj" \
	"$(INTDIR)\LocateRequest_Invocation_Adapter.obj" \
	"$(INTDIR)\LongDoubleSeqC.obj" \
	"$(INTDIR)\LongLongSeqC.obj" \
	"$(INTDIR)\LongSeqC.obj" \
	"$(INTDIR)\LRU_Connection_Purging_Strategy.obj" \
	"$(INTDIR)\MCAST_Parser.obj" \
	"$(INTDIR)\Messaging_PolicyValueC.obj" \
	"$(INTDIR)\Messaging_SyncScopeC.obj" \
	"$(INTDIR)\MMAP_Allocator.obj" \
	"$(INTDIR)\MProfile.obj" \
	"$(INTDIR)\Muxed_TMS.obj" \
	"$(INTDIR)\New_Leader_Generator.obj" \
	"$(INTDIR)\NVList_Adapter.obj" \
	"$(INTDIR)\Null_Fragmentation_Strategy.obj" \
	"$(INTDIR)\Object.obj" \
	"$(INTDIR)\Object_KeyC.obj" \
	"$(INTDIR)\Object_Loader.obj" \
	"$(INTDIR)\Object_Proxy_Broker.obj" \
	"$(INTDIR)\Object_Ref_Table.obj" \
	"$(INTDIR)\ObjectIdListC.obj" \
	"$(INTDIR)\ObjectKey_Table.obj" \
	"$(INTDIR)\OctetSeqC.obj" \
	"$(INTDIR)\On_Demand_Fragmentation_Strategy.obj" \
	"$(INTDIR)\operation_details.obj" \
	"$(INTDIR)\ORB.obj" \
	"$(INTDIR)\ORBInitializer_Registry.obj" \
	"$(INTDIR)\ORBInitializer_Registry_Adapter.obj" \
	"$(INTDIR)\orb_typesC.obj" \
	"$(INTDIR)\ORB_Core.obj" \
	"$(INTDIR)\ORB_Core_Auto_Ptr.obj" \
	"$(INTDIR)\ORB_Core_TSS_Resources.obj" \
	"$(INTDIR)\ORB_Table.obj" \
	"$(INTDIR)\ParameterModeC.obj" \
	"$(INTDIR)\params.obj" \
	"$(INTDIR)\Parser_Registry.obj" \
	"$(INTDIR)\PI_ForwardC.obj" \
	"$(INTDIR)\Pluggable_Messaging_Utils.obj" \
	"$(INTDIR)\Policy_Current.obj" \
	"$(INTDIR)\Policy_CurrentC.obj" \
	"$(INTDIR)\Policy_Current_Impl.obj" \
	"$(INTDIR)\Policy_ForwardC.obj" \
	"$(INTDIR)\Policy_ManagerC.obj" \
	"$(INTDIR)\Policy_Set.obj" \
	"$(INTDIR)\Policy_Validator.obj" \
	"$(INTDIR)\PolicyC.obj" \
	"$(INTDIR)\PolicyFactory_Registry_Adapter.obj" \
	"$(INTDIR)\PolicyFactory_Registry_Factory.obj" \
	"$(INTDIR)\PortableInterceptorC.obj" \
	"$(INTDIR)\Principal.obj" \
	"$(INTDIR)\Profile.obj" \
	"$(INTDIR)\Profile_Transport_Resolver.obj" \
	"$(INTDIR)\Protocol_Factory.obj" \
	"$(INTDIR)\Protocols_Hooks.obj" \
	"$(INTDIR)\Network_Priority_Protocols_Hooks.obj" \
	"$(INTDIR)\Queued_Data.obj" \
	"$(INTDIR)\Queued_Message.obj" \
	"$(INTDIR)\Reactive_Connect_Strategy.obj" \
	"$(INTDIR)\Reactive_Flushing_Strategy.obj" \
	"$(INTDIR)\Refcounted_ObjectKey.obj" \
	"$(INTDIR)\Remote_Invocation.obj" \
	"$(INTDIR)\Remote_Object_Proxy_Broker.obj" \
	"$(INTDIR)\Reply_Dispatcher.obj" \
	"$(INTDIR)\Request_Dispatcher.obj" \
	"$(INTDIR)\RequestInterceptor_Adapter.obj" \
	"$(INTDIR)\Resource_Factory.obj" \
	"$(INTDIR)\Resume_Handle.obj" \
	"$(INTDIR)\Resume_Handle_Deferred.obj" \
	"$(INTDIR)\Server_Strategy_Factory.obj" \
	"$(INTDIR)\ServerRequestInterceptor_Adapter.obj" \
	"$(INTDIR)\ServerRequestInterceptor_Adapter_Factory.obj" \
	"$(INTDIR)\Service_Callbacks.obj" \
	"$(INTDIR)\Service_Context.obj" \
	"$(INTDIR)\Service_Context_Handler.obj" \
	"$(INTDIR)\Service_Context_Handler_Registry.obj" \
	"$(INTDIR)\Services_Activate.obj" \
	"$(INTDIR)\ServicesC.obj" \
	"$(INTDIR)\ShortSeqC.obj" \
	"$(INTDIR)\String_Alloc.obj" \
	"$(INTDIR)\StringSeqC.obj" \
	"$(INTDIR)\Stub.obj" \
	"$(INTDIR)\Stub_Factory.obj" \
	"$(INTDIR)\Synch_Invocation.obj" \
	"$(INTDIR)\Synch_Queued_Message.obj" \
	"$(INTDIR)\Synch_Reply_Dispatcher.obj" \
	"$(INTDIR)\SystemException.obj" \
	"$(INTDIR)\Tagged_Components.obj" \
	"$(INTDIR)\Tagged_Profile.obj" \
	"$(INTDIR)\TAO_Internal.obj" \
	"$(INTDIR)\TAO_Server_Request.obj" \
	"$(INTDIR)\TAO_Singleton_Manager.obj" \
	"$(INTDIR)\TAOC.obj" \
	"$(INTDIR)\target_specification.obj" \
	"$(INTDIR)\Thread_Lane_Resources.obj" \
	"$(INTDIR)\Thread_Lane_Resources_Manager.obj" \
	"$(INTDIR)\Thread_Per_Connection_Handler.obj" \
	"$(INTDIR)\TimeBaseC.obj" \
	"$(INTDIR)\Transport.obj" \
	"$(INTDIR)\Transport_Acceptor.obj" \
	"$(INTDIR)\Transport_Connector.obj" \
	"$(INTDIR)\Transport_Descriptor_Interface.obj" \
	"$(INTDIR)\Transport_Mux_Strategy.obj" \
	"$(INTDIR)\Transport_Queueing_Strategies.obj" \
	"$(INTDIR)\Transport_Selection_Guard.obj" \
	"$(INTDIR)\Transport_Timer.obj" \
	"$(INTDIR)\TSS_Resources.obj" \
	"$(INTDIR)\TypeCodeFactory_Adapter.obj" \
	"$(INTDIR)\Typecode_typesC.obj" \
	"$(INTDIR)\ULongLongSeqC.obj" \
	"$(INTDIR)\ULongSeqC.obj" \
	"$(INTDIR)\UserException.obj" \
	"$(INTDIR)\UShortSeqC.obj" \
	"$(INTDIR)\Valuetype_Adapter.obj" \
	"$(INTDIR)\Valuetype_Adapter_Factory.obj" \
	"$(INTDIR)\Wait_On_Leader_Follower.obj" \
	"$(INTDIR)\Wait_On_LF_No_Upcall.obj" \
	"$(INTDIR)\Wait_On_Reactor.obj" \
	"$(INTDIR)\Wait_On_Read.obj" \
	"$(INTDIR)\Wait_Strategy.obj" \
	"$(INTDIR)\WCharSeqC.obj" \
	"$(INTDIR)\WrongTransactionC.obj" \
	"$(INTDIR)\WStringSeqC.obj" \
	"$(INTDIR)\GUIResource_Factory.obj" \
	"$(INTDIR)\ZIOP_Adapter.obj"

"..\..\lib\TAOd.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\lib\TAOd.dll.manifest" mt.exe -manifest "..\..\lib\TAOd.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\lib
INTDIR=Release\TAO\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\lib\TAO.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\.." -I".." -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_VALUETYPE_OUT_INDIRECTION -DTAO_BUILD_DLL -f "Makefile.TAO.dep" "Dynamic_Adapter.cpp" "Policy_Manager.cpp" "Abstract_Servant_Base.cpp" "Acceptor_Filter.cpp" "Acceptor_Registry.cpp" "Adapter.cpp" "Adapter_Factory.cpp" "Adapter_Registry.cpp" "AnyTypeCode_Adapter.cpp" "Argument.cpp" "Asynch_Queued_Message.cpp" "Asynch_Reply_Dispatcher_Base.cpp" "Base_Transport_Property.cpp" "BiDir_Adapter.cpp" "Bind_Dispatcher_Guard.cpp" "Block_Flushing_Strategy.cpp" "Blocked_Connect_Strategy.cpp" "BooleanSeqC.cpp" "CDR.cpp" "CharSeqC.cpp" "Cleanup_Func_Registry.cpp" "Client_Strategy_Factory.cpp" "ClientRequestInterceptor_Adapter_Factory.cpp" "ClientRequestInterceptor_Adapter.cpp" "Codeset_Manager.cpp" "Codeset_Manager_Factory_Base.cpp" "Codeset_Translator_Base.cpp" "Collocated_Invocation.cpp" "Collocation_Proxy_Broker.cpp" "Collocation_Resolver.cpp" "Connect_Strategy.cpp" "Connection_Handler.cpp" "Connection_Purging_Strategy.cpp" "Connector_Registry.cpp" "CONV_FRAMEC.cpp" "CORBA_String.cpp" "CORBALOC_Parser.cpp" "CORBANAME_Parser.cpp" "CurrentC.cpp" "debug.cpp" "default_client.cpp" "Default_Collocation_Resolver.cpp" "Default_Endpoint_Selector_Factory.cpp" "default_resource.cpp" "default_server.cpp" "Default_Stub_Factory.cpp" "Default_Thread_Lane_Resources_Manager.cpp" "DLL_Parser.cpp" "DoubleSeqC.cpp" "Endpoint.cpp" "Endpoint_Selector_Factory.cpp" "Environment.cpp" "Exception.cpp" "Exclusive_TMS.cpp" "Fault_Tolerance_Service.cpp" "FILE_Parser.cpp" "FloatSeqC.cpp" "Flushing_Strategy.cpp" "GIOP_Fragmentation_Strategy.cpp" "GIOP_Message_Base.cpp" "GIOP_Message_Generator_Parser.cpp" "GIOP_Message_Generator_Parser_10.cpp" "GIOP_Message_Generator_Parser_11.cpp" "GIOP_Message_Generator_Parser_12.cpp" "GIOP_Message_Generator_Parser_Impl.cpp" "GIOP_Message_Locate_Header.cpp" "GIOP_Message_State.cpp" "GIOP_Message_Version.cpp" "GIOPC.cpp" "HTTP_Client.cpp" "HTTP_Handler.cpp" "HTTP_Parser.cpp" "IFR_Client_Adapter.cpp" "IIOP_Acceptor.cpp" "IIOP_Connection_Handler.cpp" "IIOP_Connector.cpp" "IIOP_Endpoint.cpp" "IIOP_EndpointsC.cpp" "IIOP_Factory.cpp" "IIOP_Profile.cpp" "IIOP_Transport.cpp" "IIOPC.cpp" "Incoming_Message_Queue.cpp" "Incoming_Message_Stack.cpp" "Invocation_Adapter.cpp" "Invocation_Base.cpp" "Invocation_Endpoint_Selectors.cpp" "IOPC.cpp" "IOR_Parser.cpp" "IORInterceptor_Adapter.cpp" "IORInterceptor_Adapter_Factory.cpp" "Leader_Follower.cpp" "Leader_Follower_Flushing_Strategy.cpp" "LF_CH_Event.cpp" "LF_Connect_Strategy.cpp" "LF_Event.cpp" "LF_Event_Binder.cpp" "LF_Event_Loop_Thread_Helper.cpp" "LF_Follower.cpp" "LF_Follower_Auto_Adder.cpp" "LF_Follower_Auto_Ptr.cpp" "LF_Invocation_Event.cpp" "LF_Multi_Event.cpp" "LF_Strategy.cpp" "LF_Strategy_Complete.cpp" "LocalObject.cpp" "LocateRequest_Invocation.cpp" "LocateRequest_Invocation_Adapter.cpp" "LongDoubleSeqC.cpp" "LongLongSeqC.cpp" "LongSeqC.cpp" "LRU_Connection_Purging_Strategy.cpp" "MCAST_Parser.cpp" "Messaging_PolicyValueC.cpp" "Messaging_SyncScopeC.cpp" "MMAP_Allocator.cpp" "MProfile.cpp" "Muxed_TMS.cpp" "New_Leader_Generator.cpp" "NVList_Adapter.cpp" "Null_Fragmentation_Strategy.cpp" "Object.cpp" "Object_KeyC.cpp" "Object_Loader.cpp" "Object_Proxy_Broker.cpp" "Object_Ref_Table.cpp" "ObjectIdListC.cpp" "ObjectKey_Table.cpp" "OctetSeqC.cpp" "On_Demand_Fragmentation_Strategy.cpp" "operation_details.cpp" "ORB.cpp" "ORBInitializer_Registry.cpp" "ORBInitializer_Registry_Adapter.cpp" "orb_typesC.cpp" "ORB_Core.cpp" "ORB_Core_Auto_Ptr.cpp" "ORB_Core_TSS_Resources.cpp" "ORB_Table.cpp" "ParameterModeC.cpp" "params.cpp" "Parser_Registry.cpp" "PI_ForwardC.cpp" "Pluggable_Messaging_Utils.cpp" "Policy_Current.cpp" "Policy_CurrentC.cpp" "Policy_Current_Impl.cpp" "Policy_ForwardC.cpp" "Policy_ManagerC.cpp" "Policy_Set.cpp" "Policy_Validator.cpp" "PolicyC.cpp" "PolicyFactory_Registry_Adapter.cpp" "PolicyFactory_Registry_Factory.cpp" "PortableInterceptorC.cpp" "Principal.cpp" "Profile.cpp" "Profile_Transport_Resolver.cpp" "Protocol_Factory.cpp" "Protocols_Hooks.cpp" "Network_Priority_Protocols_Hooks.cpp" "Queued_Data.cpp" "Queued_Message.cpp" "Reactive_Connect_Strategy.cpp" "Reactive_Flushing_Strategy.cpp" "Refcounted_ObjectKey.cpp" "Remote_Invocation.cpp" "Remote_Object_Proxy_Broker.cpp" "Reply_Dispatcher.cpp" "Request_Dispatcher.cpp" "RequestInterceptor_Adapter.cpp" "Resource_Factory.cpp" "Resume_Handle.cpp" "Resume_Handle_Deferred.cpp" "Server_Strategy_Factory.cpp" "ServerRequestInterceptor_Adapter.cpp" "ServerRequestInterceptor_Adapter_Factory.cpp" "Service_Callbacks.cpp" "Service_Context.cpp" "Service_Context_Handler.cpp" "Service_Context_Handler_Registry.cpp" "Services_Activate.cpp" "ServicesC.cpp" "ShortSeqC.cpp" "String_Alloc.cpp" "StringSeqC.cpp" "Stub.cpp" "Stub_Factory.cpp" "Synch_Invocation.cpp" "Synch_Queued_Message.cpp" "Synch_Reply_Dispatcher.cpp" "SystemException.cpp" "Tagged_Components.cpp" "Tagged_Profile.cpp" "TAO_Internal.cpp" "TAO_Server_Request.cpp" "TAO_Singleton_Manager.cpp" "TAOC.cpp" "target_specification.cpp" "Thread_Lane_Resources.cpp" "Thread_Lane_Resources_Manager.cpp" "Thread_Per_Connection_Handler.cpp" "TimeBaseC.cpp" "Transport.cpp" "Transport_Acceptor.cpp" "Transport_Connector.cpp" "Transport_Descriptor_Interface.cpp" "Transport_Mux_Strategy.cpp" "Transport_Queueing_Strategies.cpp" "Transport_Selection_Guard.cpp" "Transport_Timer.cpp" "TSS_Resources.cpp" "TypeCodeFactory_Adapter.cpp" "Typecode_typesC.cpp" "ULongLongSeqC.cpp" "ULongSeqC.cpp" "UserException.cpp" "UShortSeqC.cpp" "Valuetype_Adapter.cpp" "Valuetype_Adapter_Factory.cpp" "Wait_On_Leader_Follower.cpp" "Wait_On_LF_No_Upcall.cpp" "Wait_On_Reactor.cpp" "Wait_On_Read.cpp" "Wait_Strategy.cpp" "WCharSeqC.cpp" "WrongTransactionC.cpp" "WStringSeqC.cpp" "GUIResource_Factory.cpp" "ZIOP_Adapter.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\lib\TAO.dll"
	-@del /f/q "$(OUTDIR)\TAO.lib"
	-@del /f/q "$(OUTDIR)\TAO.exp"
	-@del /f/q "$(OUTDIR)\TAO.ilk"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\TAO\$(NULL)" mkdir "Release\TAO"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\.." /I ".." /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_VALUETYPE_OUT_INDIRECTION /D TAO_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib /libpath:"." /libpath:"..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\lib\TAO.dll" /implib:"$(OUTDIR)\TAO.lib"
LINK32_OBJS= \
	"$(INTDIR)\tao.res" \
	"$(INTDIR)\Dynamic_Adapter.obj" \
	"$(INTDIR)\Policy_Manager.obj" \
	"$(INTDIR)\Abstract_Servant_Base.obj" \
	"$(INTDIR)\Acceptor_Filter.obj" \
	"$(INTDIR)\Acceptor_Registry.obj" \
	"$(INTDIR)\Adapter.obj" \
	"$(INTDIR)\Adapter_Factory.obj" \
	"$(INTDIR)\Adapter_Registry.obj" \
	"$(INTDIR)\AnyTypeCode_Adapter.obj" \
	"$(INTDIR)\Argument.obj" \
	"$(INTDIR)\Asynch_Queued_Message.obj" \
	"$(INTDIR)\Asynch_Reply_Dispatcher_Base.obj" \
	"$(INTDIR)\Base_Transport_Property.obj" \
	"$(INTDIR)\BiDir_Adapter.obj" \
	"$(INTDIR)\Bind_Dispatcher_Guard.obj" \
	"$(INTDIR)\Block_Flushing_Strategy.obj" \
	"$(INTDIR)\Blocked_Connect_Strategy.obj" \
	"$(INTDIR)\BooleanSeqC.obj" \
	"$(INTDIR)\CDR.obj" \
	"$(INTDIR)\CharSeqC.obj" \
	"$(INTDIR)\Cleanup_Func_Registry.obj" \
	"$(INTDIR)\Client_Strategy_Factory.obj" \
	"$(INTDIR)\ClientRequestInterceptor_Adapter_Factory.obj" \
	"$(INTDIR)\ClientRequestInterceptor_Adapter.obj" \
	"$(INTDIR)\Codeset_Manager.obj" \
	"$(INTDIR)\Codeset_Manager_Factory_Base.obj" \
	"$(INTDIR)\Codeset_Translator_Base.obj" \
	"$(INTDIR)\Collocated_Invocation.obj" \
	"$(INTDIR)\Collocation_Proxy_Broker.obj" \
	"$(INTDIR)\Collocation_Resolver.obj" \
	"$(INTDIR)\Connect_Strategy.obj" \
	"$(INTDIR)\Connection_Handler.obj" \
	"$(INTDIR)\Connection_Purging_Strategy.obj" \
	"$(INTDIR)\Connector_Registry.obj" \
	"$(INTDIR)\CONV_FRAMEC.obj" \
	"$(INTDIR)\CORBA_String.obj" \
	"$(INTDIR)\CORBALOC_Parser.obj" \
	"$(INTDIR)\CORBANAME_Parser.obj" \
	"$(INTDIR)\CurrentC.obj" \
	"$(INTDIR)\debug.obj" \
	"$(INTDIR)\default_client.obj" \
	"$(INTDIR)\Default_Collocation_Resolver.obj" \
	"$(INTDIR)\Default_Endpoint_Selector_Factory.obj" \
	"$(INTDIR)\default_resource.obj" \
	"$(INTDIR)\default_server.obj" \
	"$(INTDIR)\Default_Stub_Factory.obj" \
	"$(INTDIR)\Default_Thread_Lane_Resources_Manager.obj" \
	"$(INTDIR)\DLL_Parser.obj" \
	"$(INTDIR)\DoubleSeqC.obj" \
	"$(INTDIR)\Endpoint.obj" \
	"$(INTDIR)\Endpoint_Selector_Factory.obj" \
	"$(INTDIR)\Environment.obj" \
	"$(INTDIR)\Exception.obj" \
	"$(INTDIR)\Exclusive_TMS.obj" \
	"$(INTDIR)\Fault_Tolerance_Service.obj" \
	"$(INTDIR)\FILE_Parser.obj" \
	"$(INTDIR)\FloatSeqC.obj" \
	"$(INTDIR)\Flushing_Strategy.obj" \
	"$(INTDIR)\GIOP_Fragmentation_Strategy.obj" \
	"$(INTDIR)\GIOP_Message_Base.obj" \
	"$(INTDIR)\GIOP_Message_Generator_Parser.obj" \
	"$(INTDIR)\GIOP_Message_Generator_Parser_10.obj" \
	"$(INTDIR)\GIOP_Message_Generator_Parser_11.obj" \
	"$(INTDIR)\GIOP_Message_Generator_Parser_12.obj" \
	"$(INTDIR)\GIOP_Message_Generator_Parser_Impl.obj" \
	"$(INTDIR)\GIOP_Message_Locate_Header.obj" \
	"$(INTDIR)\GIOP_Message_State.obj" \
	"$(INTDIR)\GIOP_Message_Version.obj" \
	"$(INTDIR)\GIOPC.obj" \
	"$(INTDIR)\HTTP_Client.obj" \
	"$(INTDIR)\HTTP_Handler.obj" \
	"$(INTDIR)\HTTP_Parser.obj" \
	"$(INTDIR)\IFR_Client_Adapter.obj" \
	"$(INTDIR)\IIOP_Acceptor.obj" \
	"$(INTDIR)\IIOP_Connection_Handler.obj" \
	"$(INTDIR)\IIOP_Connector.obj" \
	"$(INTDIR)\IIOP_Endpoint.obj" \
	"$(INTDIR)\IIOP_EndpointsC.obj" \
	"$(INTDIR)\IIOP_Factory.obj" \
	"$(INTDIR)\IIOP_Profile.obj" \
	"$(INTDIR)\IIOP_Transport.obj" \
	"$(INTDIR)\IIOPC.obj" \
	"$(INTDIR)\Incoming_Message_Queue.obj" \
	"$(INTDIR)\Incoming_Message_Stack.obj" \
	"$(INTDIR)\Invocation_Adapter.obj" \
	"$(INTDIR)\Invocation_Base.obj" \
	"$(INTDIR)\Invocation_Endpoint_Selectors.obj" \
	"$(INTDIR)\IOPC.obj" \
	"$(INTDIR)\IOR_Parser.obj" \
	"$(INTDIR)\IORInterceptor_Adapter.obj" \
	"$(INTDIR)\IORInterceptor_Adapter_Factory.obj" \
	"$(INTDIR)\Leader_Follower.obj" \
	"$(INTDIR)\Leader_Follower_Flushing_Strategy.obj" \
	"$(INTDIR)\LF_CH_Event.obj" \
	"$(INTDIR)\LF_Connect_Strategy.obj" \
	"$(INTDIR)\LF_Event.obj" \
	"$(INTDIR)\LF_Event_Binder.obj" \
	"$(INTDIR)\LF_Event_Loop_Thread_Helper.obj" \
	"$(INTDIR)\LF_Follower.obj" \
	"$(INTDIR)\LF_Follower_Auto_Adder.obj" \
	"$(INTDIR)\LF_Follower_Auto_Ptr.obj" \
	"$(INTDIR)\LF_Invocation_Event.obj" \
	"$(INTDIR)\LF_Multi_Event.obj" \
	"$(INTDIR)\LF_Strategy.obj" \
	"$(INTDIR)\LF_Strategy_Complete.obj" \
	"$(INTDIR)\LocalObject.obj" \
	"$(INTDIR)\LocateRequest_Invocation.obj" \
	"$(INTDIR)\LocateRequest_Invocation_Adapter.obj" \
	"$(INTDIR)\LongDoubleSeqC.obj" \
	"$(INTDIR)\LongLongSeqC.obj" \
	"$(INTDIR)\LongSeqC.obj" \
	"$(INTDIR)\LRU_Connection_Purging_Strategy.obj" \
	"$(INTDIR)\MCAST_Parser.obj" \
	"$(INTDIR)\Messaging_PolicyValueC.obj" \
	"$(INTDIR)\Messaging_SyncScopeC.obj" \
	"$(INTDIR)\MMAP_Allocator.obj" \
	"$(INTDIR)\MProfile.obj" \
	"$(INTDIR)\Muxed_TMS.obj" \
	"$(INTDIR)\New_Leader_Generator.obj" \
	"$(INTDIR)\NVList_Adapter.obj" \
	"$(INTDIR)\Null_Fragmentation_Strategy.obj" \
	"$(INTDIR)\Object.obj" \
	"$(INTDIR)\Object_KeyC.obj" \
	"$(INTDIR)\Object_Loader.obj" \
	"$(INTDIR)\Object_Proxy_Broker.obj" \
	"$(INTDIR)\Object_Ref_Table.obj" \
	"$(INTDIR)\ObjectIdListC.obj" \
	"$(INTDIR)\ObjectKey_Table.obj" \
	"$(INTDIR)\OctetSeqC.obj" \
	"$(INTDIR)\On_Demand_Fragmentation_Strategy.obj" \
	"$(INTDIR)\operation_details.obj" \
	"$(INTDIR)\ORB.obj" \
	"$(INTDIR)\ORBInitializer_Registry.obj" \
	"$(INTDIR)\ORBInitializer_Registry_Adapter.obj" \
	"$(INTDIR)\orb_typesC.obj" \
	"$(INTDIR)\ORB_Core.obj" \
	"$(INTDIR)\ORB_Core_Auto_Ptr.obj" \
	"$(INTDIR)\ORB_Core_TSS_Resources.obj" \
	"$(INTDIR)\ORB_Table.obj" \
	"$(INTDIR)\ParameterModeC.obj" \
	"$(INTDIR)\params.obj" \
	"$(INTDIR)\Parser_Registry.obj" \
	"$(INTDIR)\PI_ForwardC.obj" \
	"$(INTDIR)\Pluggable_Messaging_Utils.obj" \
	"$(INTDIR)\Policy_Current.obj" \
	"$(INTDIR)\Policy_CurrentC.obj" \
	"$(INTDIR)\Policy_Current_Impl.obj" \
	"$(INTDIR)\Policy_ForwardC.obj" \
	"$(INTDIR)\Policy_ManagerC.obj" \
	"$(INTDIR)\Policy_Set.obj" \
	"$(INTDIR)\Policy_Validator.obj" \
	"$(INTDIR)\PolicyC.obj" \
	"$(INTDIR)\PolicyFactory_Registry_Adapter.obj" \
	"$(INTDIR)\PolicyFactory_Registry_Factory.obj" \
	"$(INTDIR)\PortableInterceptorC.obj" \
	"$(INTDIR)\Principal.obj" \
	"$(INTDIR)\Profile.obj" \
	"$(INTDIR)\Profile_Transport_Resolver.obj" \
	"$(INTDIR)\Protocol_Factory.obj" \
	"$(INTDIR)\Protocols_Hooks.obj" \
	"$(INTDIR)\Network_Priority_Protocols_Hooks.obj" \
	"$(INTDIR)\Queued_Data.obj" \
	"$(INTDIR)\Queued_Message.obj" \
	"$(INTDIR)\Reactive_Connect_Strategy.obj" \
	"$(INTDIR)\Reactive_Flushing_Strategy.obj" \
	"$(INTDIR)\Refcounted_ObjectKey.obj" \
	"$(INTDIR)\Remote_Invocation.obj" \
	"$(INTDIR)\Remote_Object_Proxy_Broker.obj" \
	"$(INTDIR)\Reply_Dispatcher.obj" \
	"$(INTDIR)\Request_Dispatcher.obj" \
	"$(INTDIR)\RequestInterceptor_Adapter.obj" \
	"$(INTDIR)\Resource_Factory.obj" \
	"$(INTDIR)\Resume_Handle.obj" \
	"$(INTDIR)\Resume_Handle_Deferred.obj" \
	"$(INTDIR)\Server_Strategy_Factory.obj" \
	"$(INTDIR)\ServerRequestInterceptor_Adapter.obj" \
	"$(INTDIR)\ServerRequestInterceptor_Adapter_Factory.obj" \
	"$(INTDIR)\Service_Callbacks.obj" \
	"$(INTDIR)\Service_Context.obj" \
	"$(INTDIR)\Service_Context_Handler.obj" \
	"$(INTDIR)\Service_Context_Handler_Registry.obj" \
	"$(INTDIR)\Services_Activate.obj" \
	"$(INTDIR)\ServicesC.obj" \
	"$(INTDIR)\ShortSeqC.obj" \
	"$(INTDIR)\String_Alloc.obj" \
	"$(INTDIR)\StringSeqC.obj" \
	"$(INTDIR)\Stub.obj" \
	"$(INTDIR)\Stub_Factory.obj" \
	"$(INTDIR)\Synch_Invocation.obj" \
	"$(INTDIR)\Synch_Queued_Message.obj" \
	"$(INTDIR)\Synch_Reply_Dispatcher.obj" \
	"$(INTDIR)\SystemException.obj" \
	"$(INTDIR)\Tagged_Components.obj" \
	"$(INTDIR)\Tagged_Profile.obj" \
	"$(INTDIR)\TAO_Internal.obj" \
	"$(INTDIR)\TAO_Server_Request.obj" \
	"$(INTDIR)\TAO_Singleton_Manager.obj" \
	"$(INTDIR)\TAOC.obj" \
	"$(INTDIR)\target_specification.obj" \
	"$(INTDIR)\Thread_Lane_Resources.obj" \
	"$(INTDIR)\Thread_Lane_Resources_Manager.obj" \
	"$(INTDIR)\Thread_Per_Connection_Handler.obj" \
	"$(INTDIR)\TimeBaseC.obj" \
	"$(INTDIR)\Transport.obj" \
	"$(INTDIR)\Transport_Acceptor.obj" \
	"$(INTDIR)\Transport_Connector.obj" \
	"$(INTDIR)\Transport_Descriptor_Interface.obj" \
	"$(INTDIR)\Transport_Mux_Strategy.obj" \
	"$(INTDIR)\Transport_Queueing_Strategies.obj" \
	"$(INTDIR)\Transport_Selection_Guard.obj" \
	"$(INTDIR)\Transport_Timer.obj" \
	"$(INTDIR)\TSS_Resources.obj" \
	"$(INTDIR)\TypeCodeFactory_Adapter.obj" \
	"$(INTDIR)\Typecode_typesC.obj" \
	"$(INTDIR)\ULongLongSeqC.obj" \
	"$(INTDIR)\ULongSeqC.obj" \
	"$(INTDIR)\UserException.obj" \
	"$(INTDIR)\UShortSeqC.obj" \
	"$(INTDIR)\Valuetype_Adapter.obj" \
	"$(INTDIR)\Valuetype_Adapter_Factory.obj" \
	"$(INTDIR)\Wait_On_Leader_Follower.obj" \
	"$(INTDIR)\Wait_On_LF_No_Upcall.obj" \
	"$(INTDIR)\Wait_On_Reactor.obj" \
	"$(INTDIR)\Wait_On_Read.obj" \
	"$(INTDIR)\Wait_Strategy.obj" \
	"$(INTDIR)\WCharSeqC.obj" \
	"$(INTDIR)\WrongTransactionC.obj" \
	"$(INTDIR)\WStringSeqC.obj" \
	"$(INTDIR)\GUIResource_Factory.obj" \
	"$(INTDIR)\ZIOP_Adapter.obj"

"..\..\lib\TAO.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\lib\TAO.dll.manifest" mt.exe -manifest "..\..\lib\TAO.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\lib
INTDIR=Static_Debug\TAO\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAOsd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\.." -I".." -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_VALUETYPE_OUT_INDIRECTION -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.TAO.dep" "Dynamic_Adapter.cpp" "Policy_Manager.cpp" "Abstract_Servant_Base.cpp" "Acceptor_Filter.cpp" "Acceptor_Registry.cpp" "Adapter.cpp" "Adapter_Factory.cpp" "Adapter_Registry.cpp" "AnyTypeCode_Adapter.cpp" "Argument.cpp" "Asynch_Queued_Message.cpp" "Asynch_Reply_Dispatcher_Base.cpp" "Base_Transport_Property.cpp" "BiDir_Adapter.cpp" "Bind_Dispatcher_Guard.cpp" "Block_Flushing_Strategy.cpp" "Blocked_Connect_Strategy.cpp" "BooleanSeqC.cpp" "CDR.cpp" "CharSeqC.cpp" "Cleanup_Func_Registry.cpp" "Client_Strategy_Factory.cpp" "ClientRequestInterceptor_Adapter_Factory.cpp" "ClientRequestInterceptor_Adapter.cpp" "Codeset_Manager.cpp" "Codeset_Manager_Factory_Base.cpp" "Codeset_Translator_Base.cpp" "Collocated_Invocation.cpp" "Collocation_Proxy_Broker.cpp" "Collocation_Resolver.cpp" "Connect_Strategy.cpp" "Connection_Handler.cpp" "Connection_Purging_Strategy.cpp" "Connector_Registry.cpp" "CONV_FRAMEC.cpp" "CORBA_String.cpp" "CORBALOC_Parser.cpp" "CORBANAME_Parser.cpp" "CurrentC.cpp" "debug.cpp" "default_client.cpp" "Default_Collocation_Resolver.cpp" "Default_Endpoint_Selector_Factory.cpp" "default_resource.cpp" "default_server.cpp" "Default_Stub_Factory.cpp" "Default_Thread_Lane_Resources_Manager.cpp" "DLL_Parser.cpp" "DoubleSeqC.cpp" "Endpoint.cpp" "Endpoint_Selector_Factory.cpp" "Environment.cpp" "Exception.cpp" "Exclusive_TMS.cpp" "Fault_Tolerance_Service.cpp" "FILE_Parser.cpp" "FloatSeqC.cpp" "Flushing_Strategy.cpp" "GIOP_Fragmentation_Strategy.cpp" "GIOP_Message_Base.cpp" "GIOP_Message_Generator_Parser.cpp" "GIOP_Message_Generator_Parser_10.cpp" "GIOP_Message_Generator_Parser_11.cpp" "GIOP_Message_Generator_Parser_12.cpp" "GIOP_Message_Generator_Parser_Impl.cpp" "GIOP_Message_Locate_Header.cpp" "GIOP_Message_State.cpp" "GIOP_Message_Version.cpp" "GIOPC.cpp" "HTTP_Client.cpp" "HTTP_Handler.cpp" "HTTP_Parser.cpp" "IFR_Client_Adapter.cpp" "IIOP_Acceptor.cpp" "IIOP_Connection_Handler.cpp" "IIOP_Connector.cpp" "IIOP_Endpoint.cpp" "IIOP_EndpointsC.cpp" "IIOP_Factory.cpp" "IIOP_Profile.cpp" "IIOP_Transport.cpp" "IIOPC.cpp" "Incoming_Message_Queue.cpp" "Incoming_Message_Stack.cpp" "Invocation_Adapter.cpp" "Invocation_Base.cpp" "Invocation_Endpoint_Selectors.cpp" "IOPC.cpp" "IOR_Parser.cpp" "IORInterceptor_Adapter.cpp" "IORInterceptor_Adapter_Factory.cpp" "Leader_Follower.cpp" "Leader_Follower_Flushing_Strategy.cpp" "LF_CH_Event.cpp" "LF_Connect_Strategy.cpp" "LF_Event.cpp" "LF_Event_Binder.cpp" "LF_Event_Loop_Thread_Helper.cpp" "LF_Follower.cpp" "LF_Follower_Auto_Adder.cpp" "LF_Follower_Auto_Ptr.cpp" "LF_Invocation_Event.cpp" "LF_Multi_Event.cpp" "LF_Strategy.cpp" "LF_Strategy_Complete.cpp" "LocalObject.cpp" "LocateRequest_Invocation.cpp" "LocateRequest_Invocation_Adapter.cpp" "LongDoubleSeqC.cpp" "LongLongSeqC.cpp" "LongSeqC.cpp" "LRU_Connection_Purging_Strategy.cpp" "MCAST_Parser.cpp" "Messaging_PolicyValueC.cpp" "Messaging_SyncScopeC.cpp" "MMAP_Allocator.cpp" "MProfile.cpp" "Muxed_TMS.cpp" "New_Leader_Generator.cpp" "NVList_Adapter.cpp" "Null_Fragmentation_Strategy.cpp" "Object.cpp" "Object_KeyC.cpp" "Object_Loader.cpp" "Object_Proxy_Broker.cpp" "Object_Ref_Table.cpp" "ObjectIdListC.cpp" "ObjectKey_Table.cpp" "OctetSeqC.cpp" "On_Demand_Fragmentation_Strategy.cpp" "operation_details.cpp" "ORB.cpp" "ORBInitializer_Registry.cpp" "ORBInitializer_Registry_Adapter.cpp" "orb_typesC.cpp" "ORB_Core.cpp" "ORB_Core_Auto_Ptr.cpp" "ORB_Core_TSS_Resources.cpp" "ORB_Table.cpp" "ParameterModeC.cpp" "params.cpp" "Parser_Registry.cpp" "PI_ForwardC.cpp" "Pluggable_Messaging_Utils.cpp" "Policy_Current.cpp" "Policy_CurrentC.cpp" "Policy_Current_Impl.cpp" "Policy_ForwardC.cpp" "Policy_ManagerC.cpp" "Policy_Set.cpp" "Policy_Validator.cpp" "PolicyC.cpp" "PolicyFactory_Registry_Adapter.cpp" "PolicyFactory_Registry_Factory.cpp" "PortableInterceptorC.cpp" "Principal.cpp" "Profile.cpp" "Profile_Transport_Resolver.cpp" "Protocol_Factory.cpp" "Protocols_Hooks.cpp" "Network_Priority_Protocols_Hooks.cpp" "Queued_Data.cpp" "Queued_Message.cpp" "Reactive_Connect_Strategy.cpp" "Reactive_Flushing_Strategy.cpp" "Refcounted_ObjectKey.cpp" "Remote_Invocation.cpp" "Remote_Object_Proxy_Broker.cpp" "Reply_Dispatcher.cpp" "Request_Dispatcher.cpp" "RequestInterceptor_Adapter.cpp" "Resource_Factory.cpp" "Resume_Handle.cpp" "Resume_Handle_Deferred.cpp" "Server_Strategy_Factory.cpp" "ServerRequestInterceptor_Adapter.cpp" "ServerRequestInterceptor_Adapter_Factory.cpp" "Service_Callbacks.cpp" "Service_Context.cpp" "Service_Context_Handler.cpp" "Service_Context_Handler_Registry.cpp" "Services_Activate.cpp" "ServicesC.cpp" "ShortSeqC.cpp" "String_Alloc.cpp" "StringSeqC.cpp" "Stub.cpp" "Stub_Factory.cpp" "Synch_Invocation.cpp" "Synch_Queued_Message.cpp" "Synch_Reply_Dispatcher.cpp" "SystemException.cpp" "Tagged_Components.cpp" "Tagged_Profile.cpp" "TAO_Internal.cpp" "TAO_Server_Request.cpp" "TAO_Singleton_Manager.cpp" "TAOC.cpp" "target_specification.cpp" "Thread_Lane_Resources.cpp" "Thread_Lane_Resources_Manager.cpp" "Thread_Per_Connection_Handler.cpp" "TimeBaseC.cpp" "Transport.cpp" "Transport_Acceptor.cpp" "Transport_Connector.cpp" "Transport_Descriptor_Interface.cpp" "Transport_Mux_Strategy.cpp" "Transport_Queueing_Strategies.cpp" "Transport_Selection_Guard.cpp" "Transport_Timer.cpp" "TSS_Resources.cpp" "TypeCodeFactory_Adapter.cpp" "Typecode_typesC.cpp" "ULongLongSeqC.cpp" "ULongSeqC.cpp" "UserException.cpp" "UShortSeqC.cpp" "Valuetype_Adapter.cpp" "Valuetype_Adapter_Factory.cpp" "Wait_On_Leader_Follower.cpp" "Wait_On_LF_No_Upcall.cpp" "Wait_On_Reactor.cpp" "Wait_On_Read.cpp" "Wait_Strategy.cpp" "WCharSeqC.cpp" "WrongTransactionC.cpp" "WStringSeqC.cpp" "GUIResource_Factory.cpp" "ZIOP_Adapter.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAOsd.lib"
	-@del /f/q "$(OUTDIR)\TAOsd.exp"
	-@del /f/q "$(OUTDIR)\TAOsd.ilk"
	-@del /f/q "..\..\lib\TAOsd.pdb"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\TAO\$(NULL)" mkdir "Static_Debug\TAO"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\lib\TAOsd.pdb" /I "..\.." /I ".." /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_VALUETYPE_OUT_INDIRECTION /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\lib\TAOsd.lib"
LINK32_OBJS= \
	"$(INTDIR)\Dynamic_Adapter.obj" \
	"$(INTDIR)\Policy_Manager.obj" \
	"$(INTDIR)\Abstract_Servant_Base.obj" \
	"$(INTDIR)\Acceptor_Filter.obj" \
	"$(INTDIR)\Acceptor_Registry.obj" \
	"$(INTDIR)\Adapter.obj" \
	"$(INTDIR)\Adapter_Factory.obj" \
	"$(INTDIR)\Adapter_Registry.obj" \
	"$(INTDIR)\AnyTypeCode_Adapter.obj" \
	"$(INTDIR)\Argument.obj" \
	"$(INTDIR)\Asynch_Queued_Message.obj" \
	"$(INTDIR)\Asynch_Reply_Dispatcher_Base.obj" \
	"$(INTDIR)\Base_Transport_Property.obj" \
	"$(INTDIR)\BiDir_Adapter.obj" \
	"$(INTDIR)\Bind_Dispatcher_Guard.obj" \
	"$(INTDIR)\Block_Flushing_Strategy.obj" \
	"$(INTDIR)\Blocked_Connect_Strategy.obj" \
	"$(INTDIR)\BooleanSeqC.obj" \
	"$(INTDIR)\CDR.obj" \
	"$(INTDIR)\CharSeqC.obj" \
	"$(INTDIR)\Cleanup_Func_Registry.obj" \
	"$(INTDIR)\Client_Strategy_Factory.obj" \
	"$(INTDIR)\ClientRequestInterceptor_Adapter_Factory.obj" \
	"$(INTDIR)\ClientRequestInterceptor_Adapter.obj" \
	"$(INTDIR)\Codeset_Manager.obj" \
	"$(INTDIR)\Codeset_Manager_Factory_Base.obj" \
	"$(INTDIR)\Codeset_Translator_Base.obj" \
	"$(INTDIR)\Collocated_Invocation.obj" \
	"$(INTDIR)\Collocation_Proxy_Broker.obj" \
	"$(INTDIR)\Collocation_Resolver.obj" \
	"$(INTDIR)\Connect_Strategy.obj" \
	"$(INTDIR)\Connection_Handler.obj" \
	"$(INTDIR)\Connection_Purging_Strategy.obj" \
	"$(INTDIR)\Connector_Registry.obj" \
	"$(INTDIR)\CONV_FRAMEC.obj" \
	"$(INTDIR)\CORBA_String.obj" \
	"$(INTDIR)\CORBALOC_Parser.obj" \
	"$(INTDIR)\CORBANAME_Parser.obj" \
	"$(INTDIR)\CurrentC.obj" \
	"$(INTDIR)\debug.obj" \
	"$(INTDIR)\default_client.obj" \
	"$(INTDIR)\Default_Collocation_Resolver.obj" \
	"$(INTDIR)\Default_Endpoint_Selector_Factory.obj" \
	"$(INTDIR)\default_resource.obj" \
	"$(INTDIR)\default_server.obj" \
	"$(INTDIR)\Default_Stub_Factory.obj" \
	"$(INTDIR)\Default_Thread_Lane_Resources_Manager.obj" \
	"$(INTDIR)\DLL_Parser.obj" \
	"$(INTDIR)\DoubleSeqC.obj" \
	"$(INTDIR)\Endpoint.obj" \
	"$(INTDIR)\Endpoint_Selector_Factory.obj" \
	"$(INTDIR)\Environment.obj" \
	"$(INTDIR)\Exception.obj" \
	"$(INTDIR)\Exclusive_TMS.obj" \
	"$(INTDIR)\Fault_Tolerance_Service.obj" \
	"$(INTDIR)\FILE_Parser.obj" \
	"$(INTDIR)\FloatSeqC.obj" \
	"$(INTDIR)\Flushing_Strategy.obj" \
	"$(INTDIR)\GIOP_Fragmentation_Strategy.obj" \
	"$(INTDIR)\GIOP_Message_Base.obj" \
	"$(INTDIR)\GIOP_Message_Generator_Parser.obj" \
	"$(INTDIR)\GIOP_Message_Generator_Parser_10.obj" \
	"$(INTDIR)\GIOP_Message_Generator_Parser_11.obj" \
	"$(INTDIR)\GIOP_Message_Generator_Parser_12.obj" \
	"$(INTDIR)\GIOP_Message_Generator_Parser_Impl.obj" \
	"$(INTDIR)\GIOP_Message_Locate_Header.obj" \
	"$(INTDIR)\GIOP_Message_State.obj" \
	"$(INTDIR)\GIOP_Message_Version.obj" \
	"$(INTDIR)\GIOPC.obj" \
	"$(INTDIR)\HTTP_Client.obj" \
	"$(INTDIR)\HTTP_Handler.obj" \
	"$(INTDIR)\HTTP_Parser.obj" \
	"$(INTDIR)\IFR_Client_Adapter.obj" \
	"$(INTDIR)\IIOP_Acceptor.obj" \
	"$(INTDIR)\IIOP_Connection_Handler.obj" \
	"$(INTDIR)\IIOP_Connector.obj" \
	"$(INTDIR)\IIOP_Endpoint.obj" \
	"$(INTDIR)\IIOP_EndpointsC.obj" \
	"$(INTDIR)\IIOP_Factory.obj" \
	"$(INTDIR)\IIOP_Profile.obj" \
	"$(INTDIR)\IIOP_Transport.obj" \
	"$(INTDIR)\IIOPC.obj" \
	"$(INTDIR)\Incoming_Message_Queue.obj" \
	"$(INTDIR)\Incoming_Message_Stack.obj" \
	"$(INTDIR)\Invocation_Adapter.obj" \
	"$(INTDIR)\Invocation_Base.obj" \
	"$(INTDIR)\Invocation_Endpoint_Selectors.obj" \
	"$(INTDIR)\IOPC.obj" \
	"$(INTDIR)\IOR_Parser.obj" \
	"$(INTDIR)\IORInterceptor_Adapter.obj" \
	"$(INTDIR)\IORInterceptor_Adapter_Factory.obj" \
	"$(INTDIR)\Leader_Follower.obj" \
	"$(INTDIR)\Leader_Follower_Flushing_Strategy.obj" \
	"$(INTDIR)\LF_CH_Event.obj" \
	"$(INTDIR)\LF_Connect_Strategy.obj" \
	"$(INTDIR)\LF_Event.obj" \
	"$(INTDIR)\LF_Event_Binder.obj" \
	"$(INTDIR)\LF_Event_Loop_Thread_Helper.obj" \
	"$(INTDIR)\LF_Follower.obj" \
	"$(INTDIR)\LF_Follower_Auto_Adder.obj" \
	"$(INTDIR)\LF_Follower_Auto_Ptr.obj" \
	"$(INTDIR)\LF_Invocation_Event.obj" \
	"$(INTDIR)\LF_Multi_Event.obj" \
	"$(INTDIR)\LF_Strategy.obj" \
	"$(INTDIR)\LF_Strategy_Complete.obj" \
	"$(INTDIR)\LocalObject.obj" \
	"$(INTDIR)\LocateRequest_Invocation.obj" \
	"$(INTDIR)\LocateRequest_Invocation_Adapter.obj" \
	"$(INTDIR)\LongDoubleSeqC.obj" \
	"$(INTDIR)\LongLongSeqC.obj" \
	"$(INTDIR)\LongSeqC.obj" \
	"$(INTDIR)\LRU_Connection_Purging_Strategy.obj" \
	"$(INTDIR)\MCAST_Parser.obj" \
	"$(INTDIR)\Messaging_PolicyValueC.obj" \
	"$(INTDIR)\Messaging_SyncScopeC.obj" \
	"$(INTDIR)\MMAP_Allocator.obj" \
	"$(INTDIR)\MProfile.obj" \
	"$(INTDIR)\Muxed_TMS.obj" \
	"$(INTDIR)\New_Leader_Generator.obj" \
	"$(INTDIR)\NVList_Adapter.obj" \
	"$(INTDIR)\Null_Fragmentation_Strategy.obj" \
	"$(INTDIR)\Object.obj" \
	"$(INTDIR)\Object_KeyC.obj" \
	"$(INTDIR)\Object_Loader.obj" \
	"$(INTDIR)\Object_Proxy_Broker.obj" \
	"$(INTDIR)\Object_Ref_Table.obj" \
	"$(INTDIR)\ObjectIdListC.obj" \
	"$(INTDIR)\ObjectKey_Table.obj" \
	"$(INTDIR)\OctetSeqC.obj" \
	"$(INTDIR)\On_Demand_Fragmentation_Strategy.obj" \
	"$(INTDIR)\operation_details.obj" \
	"$(INTDIR)\ORB.obj" \
	"$(INTDIR)\ORBInitializer_Registry.obj" \
	"$(INTDIR)\ORBInitializer_Registry_Adapter.obj" \
	"$(INTDIR)\orb_typesC.obj" \
	"$(INTDIR)\ORB_Core.obj" \
	"$(INTDIR)\ORB_Core_Auto_Ptr.obj" \
	"$(INTDIR)\ORB_Core_TSS_Resources.obj" \
	"$(INTDIR)\ORB_Table.obj" \
	"$(INTDIR)\ParameterModeC.obj" \
	"$(INTDIR)\params.obj" \
	"$(INTDIR)\Parser_Registry.obj" \
	"$(INTDIR)\PI_ForwardC.obj" \
	"$(INTDIR)\Pluggable_Messaging_Utils.obj" \
	"$(INTDIR)\Policy_Current.obj" \
	"$(INTDIR)\Policy_CurrentC.obj" \
	"$(INTDIR)\Policy_Current_Impl.obj" \
	"$(INTDIR)\Policy_ForwardC.obj" \
	"$(INTDIR)\Policy_ManagerC.obj" \
	"$(INTDIR)\Policy_Set.obj" \
	"$(INTDIR)\Policy_Validator.obj" \
	"$(INTDIR)\PolicyC.obj" \
	"$(INTDIR)\PolicyFactory_Registry_Adapter.obj" \
	"$(INTDIR)\PolicyFactory_Registry_Factory.obj" \
	"$(INTDIR)\PortableInterceptorC.obj" \
	"$(INTDIR)\Principal.obj" \
	"$(INTDIR)\Profile.obj" \
	"$(INTDIR)\Profile_Transport_Resolver.obj" \
	"$(INTDIR)\Protocol_Factory.obj" \
	"$(INTDIR)\Protocols_Hooks.obj" \
	"$(INTDIR)\Network_Priority_Protocols_Hooks.obj" \
	"$(INTDIR)\Queued_Data.obj" \
	"$(INTDIR)\Queued_Message.obj" \
	"$(INTDIR)\Reactive_Connect_Strategy.obj" \
	"$(INTDIR)\Reactive_Flushing_Strategy.obj" \
	"$(INTDIR)\Refcounted_ObjectKey.obj" \
	"$(INTDIR)\Remote_Invocation.obj" \
	"$(INTDIR)\Remote_Object_Proxy_Broker.obj" \
	"$(INTDIR)\Reply_Dispatcher.obj" \
	"$(INTDIR)\Request_Dispatcher.obj" \
	"$(INTDIR)\RequestInterceptor_Adapter.obj" \
	"$(INTDIR)\Resource_Factory.obj" \
	"$(INTDIR)\Resume_Handle.obj" \
	"$(INTDIR)\Resume_Handle_Deferred.obj" \
	"$(INTDIR)\Server_Strategy_Factory.obj" \
	"$(INTDIR)\ServerRequestInterceptor_Adapter.obj" \
	"$(INTDIR)\ServerRequestInterceptor_Adapter_Factory.obj" \
	"$(INTDIR)\Service_Callbacks.obj" \
	"$(INTDIR)\Service_Context.obj" \
	"$(INTDIR)\Service_Context_Handler.obj" \
	"$(INTDIR)\Service_Context_Handler_Registry.obj" \
	"$(INTDIR)\Services_Activate.obj" \
	"$(INTDIR)\ServicesC.obj" \
	"$(INTDIR)\ShortSeqC.obj" \
	"$(INTDIR)\String_Alloc.obj" \
	"$(INTDIR)\StringSeqC.obj" \
	"$(INTDIR)\Stub.obj" \
	"$(INTDIR)\Stub_Factory.obj" \
	"$(INTDIR)\Synch_Invocation.obj" \
	"$(INTDIR)\Synch_Queued_Message.obj" \
	"$(INTDIR)\Synch_Reply_Dispatcher.obj" \
	"$(INTDIR)\SystemException.obj" \
	"$(INTDIR)\Tagged_Components.obj" \
	"$(INTDIR)\Tagged_Profile.obj" \
	"$(INTDIR)\TAO_Internal.obj" \
	"$(INTDIR)\TAO_Server_Request.obj" \
	"$(INTDIR)\TAO_Singleton_Manager.obj" \
	"$(INTDIR)\TAOC.obj" \
	"$(INTDIR)\target_specification.obj" \
	"$(INTDIR)\Thread_Lane_Resources.obj" \
	"$(INTDIR)\Thread_Lane_Resources_Manager.obj" \
	"$(INTDIR)\Thread_Per_Connection_Handler.obj" \
	"$(INTDIR)\TimeBaseC.obj" \
	"$(INTDIR)\Transport.obj" \
	"$(INTDIR)\Transport_Acceptor.obj" \
	"$(INTDIR)\Transport_Connector.obj" \
	"$(INTDIR)\Transport_Descriptor_Interface.obj" \
	"$(INTDIR)\Transport_Mux_Strategy.obj" \
	"$(INTDIR)\Transport_Queueing_Strategies.obj" \
	"$(INTDIR)\Transport_Selection_Guard.obj" \
	"$(INTDIR)\Transport_Timer.obj" \
	"$(INTDIR)\TSS_Resources.obj" \
	"$(INTDIR)\TypeCodeFactory_Adapter.obj" \
	"$(INTDIR)\Typecode_typesC.obj" \
	"$(INTDIR)\ULongLongSeqC.obj" \
	"$(INTDIR)\ULongSeqC.obj" \
	"$(INTDIR)\UserException.obj" \
	"$(INTDIR)\UShortSeqC.obj" \
	"$(INTDIR)\Valuetype_Adapter.obj" \
	"$(INTDIR)\Valuetype_Adapter_Factory.obj" \
	"$(INTDIR)\Wait_On_Leader_Follower.obj" \
	"$(INTDIR)\Wait_On_LF_No_Upcall.obj" \
	"$(INTDIR)\Wait_On_Reactor.obj" \
	"$(INTDIR)\Wait_On_Read.obj" \
	"$(INTDIR)\Wait_Strategy.obj" \
	"$(INTDIR)\WCharSeqC.obj" \
	"$(INTDIR)\WrongTransactionC.obj" \
	"$(INTDIR)\WStringSeqC.obj" \
	"$(INTDIR)\GUIResource_Factory.obj" \
	"$(INTDIR)\ZIOP_Adapter.obj"

"$(OUTDIR)\TAOsd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAOsd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAOsd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\lib
INTDIR=Static_Release\TAO\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAOs.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\.." -I".." -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_VALUETYPE_OUT_INDIRECTION -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.TAO.dep" "Dynamic_Adapter.cpp" "Policy_Manager.cpp" "Abstract_Servant_Base.cpp" "Acceptor_Filter.cpp" "Acceptor_Registry.cpp" "Adapter.cpp" "Adapter_Factory.cpp" "Adapter_Registry.cpp" "AnyTypeCode_Adapter.cpp" "Argument.cpp" "Asynch_Queued_Message.cpp" "Asynch_Reply_Dispatcher_Base.cpp" "Base_Transport_Property.cpp" "BiDir_Adapter.cpp" "Bind_Dispatcher_Guard.cpp" "Block_Flushing_Strategy.cpp" "Blocked_Connect_Strategy.cpp" "BooleanSeqC.cpp" "CDR.cpp" "CharSeqC.cpp" "Cleanup_Func_Registry.cpp" "Client_Strategy_Factory.cpp" "ClientRequestInterceptor_Adapter_Factory.cpp" "ClientRequestInterceptor_Adapter.cpp" "Codeset_Manager.cpp" "Codeset_Manager_Factory_Base.cpp" "Codeset_Translator_Base.cpp" "Collocated_Invocation.cpp" "Collocation_Proxy_Broker.cpp" "Collocation_Resolver.cpp" "Connect_Strategy.cpp" "Connection_Handler.cpp" "Connection_Purging_Strategy.cpp" "Connector_Registry.cpp" "CONV_FRAMEC.cpp" "CORBA_String.cpp" "CORBALOC_Parser.cpp" "CORBANAME_Parser.cpp" "CurrentC.cpp" "debug.cpp" "default_client.cpp" "Default_Collocation_Resolver.cpp" "Default_Endpoint_Selector_Factory.cpp" "default_resource.cpp" "default_server.cpp" "Default_Stub_Factory.cpp" "Default_Thread_Lane_Resources_Manager.cpp" "DLL_Parser.cpp" "DoubleSeqC.cpp" "Endpoint.cpp" "Endpoint_Selector_Factory.cpp" "Environment.cpp" "Exception.cpp" "Exclusive_TMS.cpp" "Fault_Tolerance_Service.cpp" "FILE_Parser.cpp" "FloatSeqC.cpp" "Flushing_Strategy.cpp" "GIOP_Fragmentation_Strategy.cpp" "GIOP_Message_Base.cpp" "GIOP_Message_Generator_Parser.cpp" "GIOP_Message_Generator_Parser_10.cpp" "GIOP_Message_Generator_Parser_11.cpp" "GIOP_Message_Generator_Parser_12.cpp" "GIOP_Message_Generator_Parser_Impl.cpp" "GIOP_Message_Locate_Header.cpp" "GIOP_Message_State.cpp" "GIOP_Message_Version.cpp" "GIOPC.cpp" "HTTP_Client.cpp" "HTTP_Handler.cpp" "HTTP_Parser.cpp" "IFR_Client_Adapter.cpp" "IIOP_Acceptor.cpp" "IIOP_Connection_Handler.cpp" "IIOP_Connector.cpp" "IIOP_Endpoint.cpp" "IIOP_EndpointsC.cpp" "IIOP_Factory.cpp" "IIOP_Profile.cpp" "IIOP_Transport.cpp" "IIOPC.cpp" "Incoming_Message_Queue.cpp" "Incoming_Message_Stack.cpp" "Invocation_Adapter.cpp" "Invocation_Base.cpp" "Invocation_Endpoint_Selectors.cpp" "IOPC.cpp" "IOR_Parser.cpp" "IORInterceptor_Adapter.cpp" "IORInterceptor_Adapter_Factory.cpp" "Leader_Follower.cpp" "Leader_Follower_Flushing_Strategy.cpp" "LF_CH_Event.cpp" "LF_Connect_Strategy.cpp" "LF_Event.cpp" "LF_Event_Binder.cpp" "LF_Event_Loop_Thread_Helper.cpp" "LF_Follower.cpp" "LF_Follower_Auto_Adder.cpp" "LF_Follower_Auto_Ptr.cpp" "LF_Invocation_Event.cpp" "LF_Multi_Event.cpp" "LF_Strategy.cpp" "LF_Strategy_Complete.cpp" "LocalObject.cpp" "LocateRequest_Invocation.cpp" "LocateRequest_Invocation_Adapter.cpp" "LongDoubleSeqC.cpp" "LongLongSeqC.cpp" "LongSeqC.cpp" "LRU_Connection_Purging_Strategy.cpp" "MCAST_Parser.cpp" "Messaging_PolicyValueC.cpp" "Messaging_SyncScopeC.cpp" "MMAP_Allocator.cpp" "MProfile.cpp" "Muxed_TMS.cpp" "New_Leader_Generator.cpp" "NVList_Adapter.cpp" "Null_Fragmentation_Strategy.cpp" "Object.cpp" "Object_KeyC.cpp" "Object_Loader.cpp" "Object_Proxy_Broker.cpp" "Object_Ref_Table.cpp" "ObjectIdListC.cpp" "ObjectKey_Table.cpp" "OctetSeqC.cpp" "On_Demand_Fragmentation_Strategy.cpp" "operation_details.cpp" "ORB.cpp" "ORBInitializer_Registry.cpp" "ORBInitializer_Registry_Adapter.cpp" "orb_typesC.cpp" "ORB_Core.cpp" "ORB_Core_Auto_Ptr.cpp" "ORB_Core_TSS_Resources.cpp" "ORB_Table.cpp" "ParameterModeC.cpp" "params.cpp" "Parser_Registry.cpp" "PI_ForwardC.cpp" "Pluggable_Messaging_Utils.cpp" "Policy_Current.cpp" "Policy_CurrentC.cpp" "Policy_Current_Impl.cpp" "Policy_ForwardC.cpp" "Policy_ManagerC.cpp" "Policy_Set.cpp" "Policy_Validator.cpp" "PolicyC.cpp" "PolicyFactory_Registry_Adapter.cpp" "PolicyFactory_Registry_Factory.cpp" "PortableInterceptorC.cpp" "Principal.cpp" "Profile.cpp" "Profile_Transport_Resolver.cpp" "Protocol_Factory.cpp" "Protocols_Hooks.cpp" "Network_Priority_Protocols_Hooks.cpp" "Queued_Data.cpp" "Queued_Message.cpp" "Reactive_Connect_Strategy.cpp" "Reactive_Flushing_Strategy.cpp" "Refcounted_ObjectKey.cpp" "Remote_Invocation.cpp" "Remote_Object_Proxy_Broker.cpp" "Reply_Dispatcher.cpp" "Request_Dispatcher.cpp" "RequestInterceptor_Adapter.cpp" "Resource_Factory.cpp" "Resume_Handle.cpp" "Resume_Handle_Deferred.cpp" "Server_Strategy_Factory.cpp" "ServerRequestInterceptor_Adapter.cpp" "ServerRequestInterceptor_Adapter_Factory.cpp" "Service_Callbacks.cpp" "Service_Context.cpp" "Service_Context_Handler.cpp" "Service_Context_Handler_Registry.cpp" "Services_Activate.cpp" "ServicesC.cpp" "ShortSeqC.cpp" "String_Alloc.cpp" "StringSeqC.cpp" "Stub.cpp" "Stub_Factory.cpp" "Synch_Invocation.cpp" "Synch_Queued_Message.cpp" "Synch_Reply_Dispatcher.cpp" "SystemException.cpp" "Tagged_Components.cpp" "Tagged_Profile.cpp" "TAO_Internal.cpp" "TAO_Server_Request.cpp" "TAO_Singleton_Manager.cpp" "TAOC.cpp" "target_specification.cpp" "Thread_Lane_Resources.cpp" "Thread_Lane_Resources_Manager.cpp" "Thread_Per_Connection_Handler.cpp" "TimeBaseC.cpp" "Transport.cpp" "Transport_Acceptor.cpp" "Transport_Connector.cpp" "Transport_Descriptor_Interface.cpp" "Transport_Mux_Strategy.cpp" "Transport_Queueing_Strategies.cpp" "Transport_Selection_Guard.cpp" "Transport_Timer.cpp" "TSS_Resources.cpp" "TypeCodeFactory_Adapter.cpp" "Typecode_typesC.cpp" "ULongLongSeqC.cpp" "ULongSeqC.cpp" "UserException.cpp" "UShortSeqC.cpp" "Valuetype_Adapter.cpp" "Valuetype_Adapter_Factory.cpp" "Wait_On_Leader_Follower.cpp" "Wait_On_LF_No_Upcall.cpp" "Wait_On_Reactor.cpp" "Wait_On_Read.cpp" "Wait_Strategy.cpp" "WCharSeqC.cpp" "WrongTransactionC.cpp" "WStringSeqC.cpp" "GUIResource_Factory.cpp" "ZIOP_Adapter.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAOs.lib"
	-@del /f/q "$(OUTDIR)\TAOs.exp"
	-@del /f/q "$(OUTDIR)\TAOs.ilk"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\TAO\$(NULL)" mkdir "Static_Release\TAO"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\.." /I ".." /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_VALUETYPE_OUT_INDIRECTION /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\lib\TAOs.lib"
LINK32_OBJS= \
	"$(INTDIR)\Dynamic_Adapter.obj" \
	"$(INTDIR)\Policy_Manager.obj" \
	"$(INTDIR)\Abstract_Servant_Base.obj" \
	"$(INTDIR)\Acceptor_Filter.obj" \
	"$(INTDIR)\Acceptor_Registry.obj" \
	"$(INTDIR)\Adapter.obj" \
	"$(INTDIR)\Adapter_Factory.obj" \
	"$(INTDIR)\Adapter_Registry.obj" \
	"$(INTDIR)\AnyTypeCode_Adapter.obj" \
	"$(INTDIR)\Argument.obj" \
	"$(INTDIR)\Asynch_Queued_Message.obj" \
	"$(INTDIR)\Asynch_Reply_Dispatcher_Base.obj" \
	"$(INTDIR)\Base_Transport_Property.obj" \
	"$(INTDIR)\BiDir_Adapter.obj" \
	"$(INTDIR)\Bind_Dispatcher_Guard.obj" \
	"$(INTDIR)\Block_Flushing_Strategy.obj" \
	"$(INTDIR)\Blocked_Connect_Strategy.obj" \
	"$(INTDIR)\BooleanSeqC.obj" \
	"$(INTDIR)\CDR.obj" \
	"$(INTDIR)\CharSeqC.obj" \
	"$(INTDIR)\Cleanup_Func_Registry.obj" \
	"$(INTDIR)\Client_Strategy_Factory.obj" \
	"$(INTDIR)\ClientRequestInterceptor_Adapter_Factory.obj" \
	"$(INTDIR)\ClientRequestInterceptor_Adapter.obj" \
	"$(INTDIR)\Codeset_Manager.obj" \
	"$(INTDIR)\Codeset_Manager_Factory_Base.obj" \
	"$(INTDIR)\Codeset_Translator_Base.obj" \
	"$(INTDIR)\Collocated_Invocation.obj" \
	"$(INTDIR)\Collocation_Proxy_Broker.obj" \
	"$(INTDIR)\Collocation_Resolver.obj" \
	"$(INTDIR)\Connect_Strategy.obj" \
	"$(INTDIR)\Connection_Handler.obj" \
	"$(INTDIR)\Connection_Purging_Strategy.obj" \
	"$(INTDIR)\Connector_Registry.obj" \
	"$(INTDIR)\CONV_FRAMEC.obj" \
	"$(INTDIR)\CORBA_String.obj" \
	"$(INTDIR)\CORBALOC_Parser.obj" \
	"$(INTDIR)\CORBANAME_Parser.obj" \
	"$(INTDIR)\CurrentC.obj" \
	"$(INTDIR)\debug.obj" \
	"$(INTDIR)\default_client.obj" \
	"$(INTDIR)\Default_Collocation_Resolver.obj" \
	"$(INTDIR)\Default_Endpoint_Selector_Factory.obj" \
	"$(INTDIR)\default_resource.obj" \
	"$(INTDIR)\default_server.obj" \
	"$(INTDIR)\Default_Stub_Factory.obj" \
	"$(INTDIR)\Default_Thread_Lane_Resources_Manager.obj" \
	"$(INTDIR)\DLL_Parser.obj" \
	"$(INTDIR)\DoubleSeqC.obj" \
	"$(INTDIR)\Endpoint.obj" \
	"$(INTDIR)\Endpoint_Selector_Factory.obj" \
	"$(INTDIR)\Environment.obj" \
	"$(INTDIR)\Exception.obj" \
	"$(INTDIR)\Exclusive_TMS.obj" \
	"$(INTDIR)\Fault_Tolerance_Service.obj" \
	"$(INTDIR)\FILE_Parser.obj" \
	"$(INTDIR)\FloatSeqC.obj" \
	"$(INTDIR)\Flushing_Strategy.obj" \
	"$(INTDIR)\GIOP_Fragmentation_Strategy.obj" \
	"$(INTDIR)\GIOP_Message_Base.obj" \
	"$(INTDIR)\GIOP_Message_Generator_Parser.obj" \
	"$(INTDIR)\GIOP_Message_Generator_Parser_10.obj" \
	"$(INTDIR)\GIOP_Message_Generator_Parser_11.obj" \
	"$(INTDIR)\GIOP_Message_Generator_Parser_12.obj" \
	"$(INTDIR)\GIOP_Message_Generator_Parser_Impl.obj" \
	"$(INTDIR)\GIOP_Message_Locate_Header.obj" \
	"$(INTDIR)\GIOP_Message_State.obj" \
	"$(INTDIR)\GIOP_Message_Version.obj" \
	"$(INTDIR)\GIOPC.obj" \
	"$(INTDIR)\HTTP_Client.obj" \
	"$(INTDIR)\HTTP_Handler.obj" \
	"$(INTDIR)\HTTP_Parser.obj" \
	"$(INTDIR)\IFR_Client_Adapter.obj" \
	"$(INTDIR)\IIOP_Acceptor.obj" \
	"$(INTDIR)\IIOP_Connection_Handler.obj" \
	"$(INTDIR)\IIOP_Connector.obj" \
	"$(INTDIR)\IIOP_Endpoint.obj" \
	"$(INTDIR)\IIOP_EndpointsC.obj" \
	"$(INTDIR)\IIOP_Factory.obj" \
	"$(INTDIR)\IIOP_Profile.obj" \
	"$(INTDIR)\IIOP_Transport.obj" \
	"$(INTDIR)\IIOPC.obj" \
	"$(INTDIR)\Incoming_Message_Queue.obj" \
	"$(INTDIR)\Incoming_Message_Stack.obj" \
	"$(INTDIR)\Invocation_Adapter.obj" \
	"$(INTDIR)\Invocation_Base.obj" \
	"$(INTDIR)\Invocation_Endpoint_Selectors.obj" \
	"$(INTDIR)\IOPC.obj" \
	"$(INTDIR)\IOR_Parser.obj" \
	"$(INTDIR)\IORInterceptor_Adapter.obj" \
	"$(INTDIR)\IORInterceptor_Adapter_Factory.obj" \
	"$(INTDIR)\Leader_Follower.obj" \
	"$(INTDIR)\Leader_Follower_Flushing_Strategy.obj" \
	"$(INTDIR)\LF_CH_Event.obj" \
	"$(INTDIR)\LF_Connect_Strategy.obj" \
	"$(INTDIR)\LF_Event.obj" \
	"$(INTDIR)\LF_Event_Binder.obj" \
	"$(INTDIR)\LF_Event_Loop_Thread_Helper.obj" \
	"$(INTDIR)\LF_Follower.obj" \
	"$(INTDIR)\LF_Follower_Auto_Adder.obj" \
	"$(INTDIR)\LF_Follower_Auto_Ptr.obj" \
	"$(INTDIR)\LF_Invocation_Event.obj" \
	"$(INTDIR)\LF_Multi_Event.obj" \
	"$(INTDIR)\LF_Strategy.obj" \
	"$(INTDIR)\LF_Strategy_Complete.obj" \
	"$(INTDIR)\LocalObject.obj" \
	"$(INTDIR)\LocateRequest_Invocation.obj" \
	"$(INTDIR)\LocateRequest_Invocation_Adapter.obj" \
	"$(INTDIR)\LongDoubleSeqC.obj" \
	"$(INTDIR)\LongLongSeqC.obj" \
	"$(INTDIR)\LongSeqC.obj" \
	"$(INTDIR)\LRU_Connection_Purging_Strategy.obj" \
	"$(INTDIR)\MCAST_Parser.obj" \
	"$(INTDIR)\Messaging_PolicyValueC.obj" \
	"$(INTDIR)\Messaging_SyncScopeC.obj" \
	"$(INTDIR)\MMAP_Allocator.obj" \
	"$(INTDIR)\MProfile.obj" \
	"$(INTDIR)\Muxed_TMS.obj" \
	"$(INTDIR)\New_Leader_Generator.obj" \
	"$(INTDIR)\NVList_Adapter.obj" \
	"$(INTDIR)\Null_Fragmentation_Strategy.obj" \
	"$(INTDIR)\Object.obj" \
	"$(INTDIR)\Object_KeyC.obj" \
	"$(INTDIR)\Object_Loader.obj" \
	"$(INTDIR)\Object_Proxy_Broker.obj" \
	"$(INTDIR)\Object_Ref_Table.obj" \
	"$(INTDIR)\ObjectIdListC.obj" \
	"$(INTDIR)\ObjectKey_Table.obj" \
	"$(INTDIR)\OctetSeqC.obj" \
	"$(INTDIR)\On_Demand_Fragmentation_Strategy.obj" \
	"$(INTDIR)\operation_details.obj" \
	"$(INTDIR)\ORB.obj" \
	"$(INTDIR)\ORBInitializer_Registry.obj" \
	"$(INTDIR)\ORBInitializer_Registry_Adapter.obj" \
	"$(INTDIR)\orb_typesC.obj" \
	"$(INTDIR)\ORB_Core.obj" \
	"$(INTDIR)\ORB_Core_Auto_Ptr.obj" \
	"$(INTDIR)\ORB_Core_TSS_Resources.obj" \
	"$(INTDIR)\ORB_Table.obj" \
	"$(INTDIR)\ParameterModeC.obj" \
	"$(INTDIR)\params.obj" \
	"$(INTDIR)\Parser_Registry.obj" \
	"$(INTDIR)\PI_ForwardC.obj" \
	"$(INTDIR)\Pluggable_Messaging_Utils.obj" \
	"$(INTDIR)\Policy_Current.obj" \
	"$(INTDIR)\Policy_CurrentC.obj" \
	"$(INTDIR)\Policy_Current_Impl.obj" \
	"$(INTDIR)\Policy_ForwardC.obj" \
	"$(INTDIR)\Policy_ManagerC.obj" \
	"$(INTDIR)\Policy_Set.obj" \
	"$(INTDIR)\Policy_Validator.obj" \
	"$(INTDIR)\PolicyC.obj" \
	"$(INTDIR)\PolicyFactory_Registry_Adapter.obj" \
	"$(INTDIR)\PolicyFactory_Registry_Factory.obj" \
	"$(INTDIR)\PortableInterceptorC.obj" \
	"$(INTDIR)\Principal.obj" \
	"$(INTDIR)\Profile.obj" \
	"$(INTDIR)\Profile_Transport_Resolver.obj" \
	"$(INTDIR)\Protocol_Factory.obj" \
	"$(INTDIR)\Protocols_Hooks.obj" \
	"$(INTDIR)\Network_Priority_Protocols_Hooks.obj" \
	"$(INTDIR)\Queued_Data.obj" \
	"$(INTDIR)\Queued_Message.obj" \
	"$(INTDIR)\Reactive_Connect_Strategy.obj" \
	"$(INTDIR)\Reactive_Flushing_Strategy.obj" \
	"$(INTDIR)\Refcounted_ObjectKey.obj" \
	"$(INTDIR)\Remote_Invocation.obj" \
	"$(INTDIR)\Remote_Object_Proxy_Broker.obj" \
	"$(INTDIR)\Reply_Dispatcher.obj" \
	"$(INTDIR)\Request_Dispatcher.obj" \
	"$(INTDIR)\RequestInterceptor_Adapter.obj" \
	"$(INTDIR)\Resource_Factory.obj" \
	"$(INTDIR)\Resume_Handle.obj" \
	"$(INTDIR)\Resume_Handle_Deferred.obj" \
	"$(INTDIR)\Server_Strategy_Factory.obj" \
	"$(INTDIR)\ServerRequestInterceptor_Adapter.obj" \
	"$(INTDIR)\ServerRequestInterceptor_Adapter_Factory.obj" \
	"$(INTDIR)\Service_Callbacks.obj" \
	"$(INTDIR)\Service_Context.obj" \
	"$(INTDIR)\Service_Context_Handler.obj" \
	"$(INTDIR)\Service_Context_Handler_Registry.obj" \
	"$(INTDIR)\Services_Activate.obj" \
	"$(INTDIR)\ServicesC.obj" \
	"$(INTDIR)\ShortSeqC.obj" \
	"$(INTDIR)\String_Alloc.obj" \
	"$(INTDIR)\StringSeqC.obj" \
	"$(INTDIR)\Stub.obj" \
	"$(INTDIR)\Stub_Factory.obj" \
	"$(INTDIR)\Synch_Invocation.obj" \
	"$(INTDIR)\Synch_Queued_Message.obj" \
	"$(INTDIR)\Synch_Reply_Dispatcher.obj" \
	"$(INTDIR)\SystemException.obj" \
	"$(INTDIR)\Tagged_Components.obj" \
	"$(INTDIR)\Tagged_Profile.obj" \
	"$(INTDIR)\TAO_Internal.obj" \
	"$(INTDIR)\TAO_Server_Request.obj" \
	"$(INTDIR)\TAO_Singleton_Manager.obj" \
	"$(INTDIR)\TAOC.obj" \
	"$(INTDIR)\target_specification.obj" \
	"$(INTDIR)\Thread_Lane_Resources.obj" \
	"$(INTDIR)\Thread_Lane_Resources_Manager.obj" \
	"$(INTDIR)\Thread_Per_Connection_Handler.obj" \
	"$(INTDIR)\TimeBaseC.obj" \
	"$(INTDIR)\Transport.obj" \
	"$(INTDIR)\Transport_Acceptor.obj" \
	"$(INTDIR)\Transport_Connector.obj" \
	"$(INTDIR)\Transport_Descriptor_Interface.obj" \
	"$(INTDIR)\Transport_Mux_Strategy.obj" \
	"$(INTDIR)\Transport_Queueing_Strategies.obj" \
	"$(INTDIR)\Transport_Selection_Guard.obj" \
	"$(INTDIR)\Transport_Timer.obj" \
	"$(INTDIR)\TSS_Resources.obj" \
	"$(INTDIR)\TypeCodeFactory_Adapter.obj" \
	"$(INTDIR)\Typecode_typesC.obj" \
	"$(INTDIR)\ULongLongSeqC.obj" \
	"$(INTDIR)\ULongSeqC.obj" \
	"$(INTDIR)\UserException.obj" \
	"$(INTDIR)\UShortSeqC.obj" \
	"$(INTDIR)\Valuetype_Adapter.obj" \
	"$(INTDIR)\Valuetype_Adapter_Factory.obj" \
	"$(INTDIR)\Wait_On_Leader_Follower.obj" \
	"$(INTDIR)\Wait_On_LF_No_Upcall.obj" \
	"$(INTDIR)\Wait_On_Reactor.obj" \
	"$(INTDIR)\Wait_On_Read.obj" \
	"$(INTDIR)\Wait_Strategy.obj" \
	"$(INTDIR)\WCharSeqC.obj" \
	"$(INTDIR)\WrongTransactionC.obj" \
	"$(INTDIR)\WStringSeqC.obj" \
	"$(INTDIR)\GUIResource_Factory.obj" \
	"$(INTDIR)\ZIOP_Adapter.obj"

"$(OUTDIR)\TAOs.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAOs.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAOs.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.TAO.dep")
!INCLUDE "Makefile.TAO.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="Dynamic_Adapter.cpp"

"$(INTDIR)\Dynamic_Adapter.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Dynamic_Adapter.obj" $(SOURCE)

SOURCE="Policy_Manager.cpp"

"$(INTDIR)\Policy_Manager.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Policy_Manager.obj" $(SOURCE)

SOURCE="Abstract_Servant_Base.cpp"

"$(INTDIR)\Abstract_Servant_Base.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Abstract_Servant_Base.obj" $(SOURCE)

SOURCE="Acceptor_Filter.cpp"

"$(INTDIR)\Acceptor_Filter.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Acceptor_Filter.obj" $(SOURCE)

SOURCE="Acceptor_Registry.cpp"

"$(INTDIR)\Acceptor_Registry.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Acceptor_Registry.obj" $(SOURCE)

SOURCE="Adapter.cpp"

"$(INTDIR)\Adapter.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Adapter.obj" $(SOURCE)

SOURCE="Adapter_Factory.cpp"

"$(INTDIR)\Adapter_Factory.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Adapter_Factory.obj" $(SOURCE)

SOURCE="Adapter_Registry.cpp"

"$(INTDIR)\Adapter_Registry.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Adapter_Registry.obj" $(SOURCE)

SOURCE="AnyTypeCode_Adapter.cpp"

"$(INTDIR)\AnyTypeCode_Adapter.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\AnyTypeCode_Adapter.obj" $(SOURCE)

SOURCE="Argument.cpp"

"$(INTDIR)\Argument.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Argument.obj" $(SOURCE)

SOURCE="Asynch_Queued_Message.cpp"

"$(INTDIR)\Asynch_Queued_Message.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Asynch_Queued_Message.obj" $(SOURCE)

SOURCE="Asynch_Reply_Dispatcher_Base.cpp"

"$(INTDIR)\Asynch_Reply_Dispatcher_Base.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Asynch_Reply_Dispatcher_Base.obj" $(SOURCE)

SOURCE="Base_Transport_Property.cpp"

"$(INTDIR)\Base_Transport_Property.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Base_Transport_Property.obj" $(SOURCE)

SOURCE="BiDir_Adapter.cpp"

"$(INTDIR)\BiDir_Adapter.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\BiDir_Adapter.obj" $(SOURCE)

SOURCE="Bind_Dispatcher_Guard.cpp"

"$(INTDIR)\Bind_Dispatcher_Guard.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Bind_Dispatcher_Guard.obj" $(SOURCE)

SOURCE="Block_Flushing_Strategy.cpp"

"$(INTDIR)\Block_Flushing_Strategy.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Block_Flushing_Strategy.obj" $(SOURCE)

SOURCE="Blocked_Connect_Strategy.cpp"

"$(INTDIR)\Blocked_Connect_Strategy.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Blocked_Connect_Strategy.obj" $(SOURCE)

SOURCE="BooleanSeqC.cpp"

"$(INTDIR)\BooleanSeqC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\BooleanSeqC.obj" $(SOURCE)

SOURCE="CDR.cpp"

"$(INTDIR)\CDR.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\CDR.obj" $(SOURCE)

SOURCE="CharSeqC.cpp"

"$(INTDIR)\CharSeqC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\CharSeqC.obj" $(SOURCE)

SOURCE="Cleanup_Func_Registry.cpp"

"$(INTDIR)\Cleanup_Func_Registry.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Cleanup_Func_Registry.obj" $(SOURCE)

SOURCE="Client_Strategy_Factory.cpp"

"$(INTDIR)\Client_Strategy_Factory.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Client_Strategy_Factory.obj" $(SOURCE)

SOURCE="ClientRequestInterceptor_Adapter_Factory.cpp"

"$(INTDIR)\ClientRequestInterceptor_Adapter_Factory.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ClientRequestInterceptor_Adapter_Factory.obj" $(SOURCE)

SOURCE="ClientRequestInterceptor_Adapter.cpp"

"$(INTDIR)\ClientRequestInterceptor_Adapter.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ClientRequestInterceptor_Adapter.obj" $(SOURCE)

SOURCE="Codeset_Manager.cpp"

"$(INTDIR)\Codeset_Manager.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Codeset_Manager.obj" $(SOURCE)

SOURCE="Codeset_Manager_Factory_Base.cpp"

"$(INTDIR)\Codeset_Manager_Factory_Base.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Codeset_Manager_Factory_Base.obj" $(SOURCE)

SOURCE="Codeset_Translator_Base.cpp"

"$(INTDIR)\Codeset_Translator_Base.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Codeset_Translator_Base.obj" $(SOURCE)

SOURCE="Collocated_Invocation.cpp"

"$(INTDIR)\Collocated_Invocation.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Collocated_Invocation.obj" $(SOURCE)

SOURCE="Collocation_Proxy_Broker.cpp"

"$(INTDIR)\Collocation_Proxy_Broker.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Collocation_Proxy_Broker.obj" $(SOURCE)

SOURCE="Collocation_Resolver.cpp"

"$(INTDIR)\Collocation_Resolver.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Collocation_Resolver.obj" $(SOURCE)

SOURCE="Connect_Strategy.cpp"

"$(INTDIR)\Connect_Strategy.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Connect_Strategy.obj" $(SOURCE)

SOURCE="Connection_Handler.cpp"

"$(INTDIR)\Connection_Handler.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Connection_Handler.obj" $(SOURCE)

SOURCE="Connection_Purging_Strategy.cpp"

"$(INTDIR)\Connection_Purging_Strategy.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Connection_Purging_Strategy.obj" $(SOURCE)

SOURCE="Connector_Registry.cpp"

"$(INTDIR)\Connector_Registry.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Connector_Registry.obj" $(SOURCE)

SOURCE="CONV_FRAMEC.cpp"

"$(INTDIR)\CONV_FRAMEC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\CONV_FRAMEC.obj" $(SOURCE)

SOURCE="CORBA_String.cpp"

"$(INTDIR)\CORBA_String.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\CORBA_String.obj" $(SOURCE)

SOURCE="CORBALOC_Parser.cpp"

"$(INTDIR)\CORBALOC_Parser.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\CORBALOC_Parser.obj" $(SOURCE)

SOURCE="CORBANAME_Parser.cpp"

"$(INTDIR)\CORBANAME_Parser.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\CORBANAME_Parser.obj" $(SOURCE)

SOURCE="CurrentC.cpp"

"$(INTDIR)\CurrentC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\CurrentC.obj" $(SOURCE)

SOURCE="debug.cpp"

"$(INTDIR)\debug.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\debug.obj" $(SOURCE)

SOURCE="default_client.cpp"

"$(INTDIR)\default_client.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\default_client.obj" $(SOURCE)

SOURCE="Default_Collocation_Resolver.cpp"

"$(INTDIR)\Default_Collocation_Resolver.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Default_Collocation_Resolver.obj" $(SOURCE)

SOURCE="Default_Endpoint_Selector_Factory.cpp"

"$(INTDIR)\Default_Endpoint_Selector_Factory.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Default_Endpoint_Selector_Factory.obj" $(SOURCE)

SOURCE="default_resource.cpp"

"$(INTDIR)\default_resource.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\default_resource.obj" $(SOURCE)

SOURCE="default_server.cpp"

"$(INTDIR)\default_server.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\default_server.obj" $(SOURCE)

SOURCE="Default_Stub_Factory.cpp"

"$(INTDIR)\Default_Stub_Factory.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Default_Stub_Factory.obj" $(SOURCE)

SOURCE="Default_Thread_Lane_Resources_Manager.cpp"

"$(INTDIR)\Default_Thread_Lane_Resources_Manager.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Default_Thread_Lane_Resources_Manager.obj" $(SOURCE)

SOURCE="DLL_Parser.cpp"

"$(INTDIR)\DLL_Parser.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\DLL_Parser.obj" $(SOURCE)

SOURCE="DoubleSeqC.cpp"

"$(INTDIR)\DoubleSeqC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\DoubleSeqC.obj" $(SOURCE)

SOURCE="Endpoint.cpp"

"$(INTDIR)\Endpoint.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Endpoint.obj" $(SOURCE)

SOURCE="Endpoint_Selector_Factory.cpp"

"$(INTDIR)\Endpoint_Selector_Factory.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Endpoint_Selector_Factory.obj" $(SOURCE)

SOURCE="Environment.cpp"

"$(INTDIR)\Environment.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Environment.obj" $(SOURCE)

SOURCE="Exception.cpp"

"$(INTDIR)\Exception.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Exception.obj" $(SOURCE)

SOURCE="Exclusive_TMS.cpp"

"$(INTDIR)\Exclusive_TMS.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Exclusive_TMS.obj" $(SOURCE)

SOURCE="Fault_Tolerance_Service.cpp"

"$(INTDIR)\Fault_Tolerance_Service.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Fault_Tolerance_Service.obj" $(SOURCE)

SOURCE="FILE_Parser.cpp"

"$(INTDIR)\FILE_Parser.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FILE_Parser.obj" $(SOURCE)

SOURCE="FloatSeqC.cpp"

"$(INTDIR)\FloatSeqC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FloatSeqC.obj" $(SOURCE)

SOURCE="Flushing_Strategy.cpp"

"$(INTDIR)\Flushing_Strategy.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Flushing_Strategy.obj" $(SOURCE)

SOURCE="GIOP_Fragmentation_Strategy.cpp"

"$(INTDIR)\GIOP_Fragmentation_Strategy.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\GIOP_Fragmentation_Strategy.obj" $(SOURCE)

SOURCE="GIOP_Message_Base.cpp"

"$(INTDIR)\GIOP_Message_Base.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\GIOP_Message_Base.obj" $(SOURCE)

SOURCE="GIOP_Message_Generator_Parser.cpp"

"$(INTDIR)\GIOP_Message_Generator_Parser.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\GIOP_Message_Generator_Parser.obj" $(SOURCE)

SOURCE="GIOP_Message_Generator_Parser_10.cpp"

"$(INTDIR)\GIOP_Message_Generator_Parser_10.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\GIOP_Message_Generator_Parser_10.obj" $(SOURCE)

SOURCE="GIOP_Message_Generator_Parser_11.cpp"

"$(INTDIR)\GIOP_Message_Generator_Parser_11.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\GIOP_Message_Generator_Parser_11.obj" $(SOURCE)

SOURCE="GIOP_Message_Generator_Parser_12.cpp"

"$(INTDIR)\GIOP_Message_Generator_Parser_12.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\GIOP_Message_Generator_Parser_12.obj" $(SOURCE)

SOURCE="GIOP_Message_Generator_Parser_Impl.cpp"

"$(INTDIR)\GIOP_Message_Generator_Parser_Impl.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\GIOP_Message_Generator_Parser_Impl.obj" $(SOURCE)

SOURCE="GIOP_Message_Locate_Header.cpp"

"$(INTDIR)\GIOP_Message_Locate_Header.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\GIOP_Message_Locate_Header.obj" $(SOURCE)

SOURCE="GIOP_Message_State.cpp"

"$(INTDIR)\GIOP_Message_State.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\GIOP_Message_State.obj" $(SOURCE)

SOURCE="GIOP_Message_Version.cpp"

"$(INTDIR)\GIOP_Message_Version.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\GIOP_Message_Version.obj" $(SOURCE)

SOURCE="GIOPC.cpp"

"$(INTDIR)\GIOPC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\GIOPC.obj" $(SOURCE)

SOURCE="HTTP_Client.cpp"

"$(INTDIR)\HTTP_Client.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\HTTP_Client.obj" $(SOURCE)

SOURCE="HTTP_Handler.cpp"

"$(INTDIR)\HTTP_Handler.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\HTTP_Handler.obj" $(SOURCE)

SOURCE="HTTP_Parser.cpp"

"$(INTDIR)\HTTP_Parser.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\HTTP_Parser.obj" $(SOURCE)

SOURCE="IFR_Client_Adapter.cpp"

"$(INTDIR)\IFR_Client_Adapter.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IFR_Client_Adapter.obj" $(SOURCE)

SOURCE="IIOP_Acceptor.cpp"

"$(INTDIR)\IIOP_Acceptor.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IIOP_Acceptor.obj" $(SOURCE)

SOURCE="IIOP_Connection_Handler.cpp"

"$(INTDIR)\IIOP_Connection_Handler.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IIOP_Connection_Handler.obj" $(SOURCE)

SOURCE="IIOP_Connector.cpp"

"$(INTDIR)\IIOP_Connector.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IIOP_Connector.obj" $(SOURCE)

SOURCE="IIOP_Endpoint.cpp"

"$(INTDIR)\IIOP_Endpoint.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IIOP_Endpoint.obj" $(SOURCE)

SOURCE="IIOP_EndpointsC.cpp"

"$(INTDIR)\IIOP_EndpointsC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IIOP_EndpointsC.obj" $(SOURCE)

SOURCE="IIOP_Factory.cpp"

"$(INTDIR)\IIOP_Factory.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IIOP_Factory.obj" $(SOURCE)

SOURCE="IIOP_Profile.cpp"

"$(INTDIR)\IIOP_Profile.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IIOP_Profile.obj" $(SOURCE)

SOURCE="IIOP_Transport.cpp"

"$(INTDIR)\IIOP_Transport.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IIOP_Transport.obj" $(SOURCE)

SOURCE="IIOPC.cpp"

"$(INTDIR)\IIOPC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IIOPC.obj" $(SOURCE)

SOURCE="Incoming_Message_Queue.cpp"

"$(INTDIR)\Incoming_Message_Queue.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Incoming_Message_Queue.obj" $(SOURCE)

SOURCE="Incoming_Message_Stack.cpp"

"$(INTDIR)\Incoming_Message_Stack.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Incoming_Message_Stack.obj" $(SOURCE)

SOURCE="Invocation_Adapter.cpp"

"$(INTDIR)\Invocation_Adapter.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Invocation_Adapter.obj" $(SOURCE)

SOURCE="Invocation_Base.cpp"

"$(INTDIR)\Invocation_Base.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Invocation_Base.obj" $(SOURCE)

SOURCE="Invocation_Endpoint_Selectors.cpp"

"$(INTDIR)\Invocation_Endpoint_Selectors.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Invocation_Endpoint_Selectors.obj" $(SOURCE)

SOURCE="IOPC.cpp"

"$(INTDIR)\IOPC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IOPC.obj" $(SOURCE)

SOURCE="IOR_Parser.cpp"

"$(INTDIR)\IOR_Parser.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IOR_Parser.obj" $(SOURCE)

SOURCE="IORInterceptor_Adapter.cpp"

"$(INTDIR)\IORInterceptor_Adapter.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IORInterceptor_Adapter.obj" $(SOURCE)

SOURCE="IORInterceptor_Adapter_Factory.cpp"

"$(INTDIR)\IORInterceptor_Adapter_Factory.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IORInterceptor_Adapter_Factory.obj" $(SOURCE)

SOURCE="Leader_Follower.cpp"

"$(INTDIR)\Leader_Follower.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Leader_Follower.obj" $(SOURCE)

SOURCE="Leader_Follower_Flushing_Strategy.cpp"

"$(INTDIR)\Leader_Follower_Flushing_Strategy.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Leader_Follower_Flushing_Strategy.obj" $(SOURCE)

SOURCE="LF_CH_Event.cpp"

"$(INTDIR)\LF_CH_Event.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LF_CH_Event.obj" $(SOURCE)

SOURCE="LF_Connect_Strategy.cpp"

"$(INTDIR)\LF_Connect_Strategy.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LF_Connect_Strategy.obj" $(SOURCE)

SOURCE="LF_Event.cpp"

"$(INTDIR)\LF_Event.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LF_Event.obj" $(SOURCE)

SOURCE="LF_Event_Binder.cpp"

"$(INTDIR)\LF_Event_Binder.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LF_Event_Binder.obj" $(SOURCE)

SOURCE="LF_Event_Loop_Thread_Helper.cpp"

"$(INTDIR)\LF_Event_Loop_Thread_Helper.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LF_Event_Loop_Thread_Helper.obj" $(SOURCE)

SOURCE="LF_Follower.cpp"

"$(INTDIR)\LF_Follower.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LF_Follower.obj" $(SOURCE)

SOURCE="LF_Follower_Auto_Adder.cpp"

"$(INTDIR)\LF_Follower_Auto_Adder.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LF_Follower_Auto_Adder.obj" $(SOURCE)

SOURCE="LF_Follower_Auto_Ptr.cpp"

"$(INTDIR)\LF_Follower_Auto_Ptr.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LF_Follower_Auto_Ptr.obj" $(SOURCE)

SOURCE="LF_Invocation_Event.cpp"

"$(INTDIR)\LF_Invocation_Event.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LF_Invocation_Event.obj" $(SOURCE)

SOURCE="LF_Multi_Event.cpp"

"$(INTDIR)\LF_Multi_Event.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LF_Multi_Event.obj" $(SOURCE)

SOURCE="LF_Strategy.cpp"

"$(INTDIR)\LF_Strategy.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LF_Strategy.obj" $(SOURCE)

SOURCE="LF_Strategy_Complete.cpp"

"$(INTDIR)\LF_Strategy_Complete.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LF_Strategy_Complete.obj" $(SOURCE)

SOURCE="LocalObject.cpp"

"$(INTDIR)\LocalObject.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LocalObject.obj" $(SOURCE)

SOURCE="LocateRequest_Invocation.cpp"

"$(INTDIR)\LocateRequest_Invocation.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LocateRequest_Invocation.obj" $(SOURCE)

SOURCE="LocateRequest_Invocation_Adapter.cpp"

"$(INTDIR)\LocateRequest_Invocation_Adapter.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LocateRequest_Invocation_Adapter.obj" $(SOURCE)

SOURCE="LongDoubleSeqC.cpp"

"$(INTDIR)\LongDoubleSeqC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LongDoubleSeqC.obj" $(SOURCE)

SOURCE="LongLongSeqC.cpp"

"$(INTDIR)\LongLongSeqC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LongLongSeqC.obj" $(SOURCE)

SOURCE="LongSeqC.cpp"

"$(INTDIR)\LongSeqC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LongSeqC.obj" $(SOURCE)

SOURCE="LRU_Connection_Purging_Strategy.cpp"

"$(INTDIR)\LRU_Connection_Purging_Strategy.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LRU_Connection_Purging_Strategy.obj" $(SOURCE)

SOURCE="MCAST_Parser.cpp"

"$(INTDIR)\MCAST_Parser.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\MCAST_Parser.obj" $(SOURCE)

SOURCE="Messaging_PolicyValueC.cpp"

"$(INTDIR)\Messaging_PolicyValueC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Messaging_PolicyValueC.obj" $(SOURCE)

SOURCE="Messaging_SyncScopeC.cpp"

"$(INTDIR)\Messaging_SyncScopeC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Messaging_SyncScopeC.obj" $(SOURCE)

SOURCE="MMAP_Allocator.cpp"

"$(INTDIR)\MMAP_Allocator.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\MMAP_Allocator.obj" $(SOURCE)

SOURCE="MProfile.cpp"

"$(INTDIR)\MProfile.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\MProfile.obj" $(SOURCE)

SOURCE="Muxed_TMS.cpp"

"$(INTDIR)\Muxed_TMS.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Muxed_TMS.obj" $(SOURCE)

SOURCE="New_Leader_Generator.cpp"

"$(INTDIR)\New_Leader_Generator.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\New_Leader_Generator.obj" $(SOURCE)

SOURCE="NVList_Adapter.cpp"

"$(INTDIR)\NVList_Adapter.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\NVList_Adapter.obj" $(SOURCE)

SOURCE="Null_Fragmentation_Strategy.cpp"

"$(INTDIR)\Null_Fragmentation_Strategy.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Null_Fragmentation_Strategy.obj" $(SOURCE)

SOURCE="Object.cpp"

"$(INTDIR)\Object.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Object.obj" $(SOURCE)

SOURCE="Object_KeyC.cpp"

"$(INTDIR)\Object_KeyC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Object_KeyC.obj" $(SOURCE)

SOURCE="Object_Loader.cpp"

"$(INTDIR)\Object_Loader.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Object_Loader.obj" $(SOURCE)

SOURCE="Object_Proxy_Broker.cpp"

"$(INTDIR)\Object_Proxy_Broker.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Object_Proxy_Broker.obj" $(SOURCE)

SOURCE="Object_Ref_Table.cpp"

"$(INTDIR)\Object_Ref_Table.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Object_Ref_Table.obj" $(SOURCE)

SOURCE="ObjectIdListC.cpp"

"$(INTDIR)\ObjectIdListC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ObjectIdListC.obj" $(SOURCE)

SOURCE="ObjectKey_Table.cpp"

"$(INTDIR)\ObjectKey_Table.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ObjectKey_Table.obj" $(SOURCE)

SOURCE="OctetSeqC.cpp"

"$(INTDIR)\OctetSeqC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\OctetSeqC.obj" $(SOURCE)

SOURCE="On_Demand_Fragmentation_Strategy.cpp"

"$(INTDIR)\On_Demand_Fragmentation_Strategy.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\On_Demand_Fragmentation_Strategy.obj" $(SOURCE)

SOURCE="operation_details.cpp"

"$(INTDIR)\operation_details.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\operation_details.obj" $(SOURCE)

SOURCE="ORB.cpp"

"$(INTDIR)\ORB.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ORB.obj" $(SOURCE)

SOURCE="ORBInitializer_Registry.cpp"

"$(INTDIR)\ORBInitializer_Registry.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ORBInitializer_Registry.obj" $(SOURCE)

SOURCE="ORBInitializer_Registry_Adapter.cpp"

"$(INTDIR)\ORBInitializer_Registry_Adapter.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ORBInitializer_Registry_Adapter.obj" $(SOURCE)

SOURCE="orb_typesC.cpp"

"$(INTDIR)\orb_typesC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\orb_typesC.obj" $(SOURCE)

SOURCE="ORB_Core.cpp"

"$(INTDIR)\ORB_Core.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ORB_Core.obj" $(SOURCE)

SOURCE="ORB_Core_Auto_Ptr.cpp"

"$(INTDIR)\ORB_Core_Auto_Ptr.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ORB_Core_Auto_Ptr.obj" $(SOURCE)

SOURCE="ORB_Core_TSS_Resources.cpp"

"$(INTDIR)\ORB_Core_TSS_Resources.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ORB_Core_TSS_Resources.obj" $(SOURCE)

SOURCE="ORB_Table.cpp"

"$(INTDIR)\ORB_Table.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ORB_Table.obj" $(SOURCE)

SOURCE="ParameterModeC.cpp"

"$(INTDIR)\ParameterModeC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ParameterModeC.obj" $(SOURCE)

SOURCE="params.cpp"

"$(INTDIR)\params.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\params.obj" $(SOURCE)

SOURCE="Parser_Registry.cpp"

"$(INTDIR)\Parser_Registry.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Parser_Registry.obj" $(SOURCE)

SOURCE="PI_ForwardC.cpp"

"$(INTDIR)\PI_ForwardC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PI_ForwardC.obj" $(SOURCE)

SOURCE="Pluggable_Messaging_Utils.cpp"

"$(INTDIR)\Pluggable_Messaging_Utils.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Pluggable_Messaging_Utils.obj" $(SOURCE)

SOURCE="Policy_Current.cpp"

"$(INTDIR)\Policy_Current.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Policy_Current.obj" $(SOURCE)

SOURCE="Policy_CurrentC.cpp"

"$(INTDIR)\Policy_CurrentC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Policy_CurrentC.obj" $(SOURCE)

SOURCE="Policy_Current_Impl.cpp"

"$(INTDIR)\Policy_Current_Impl.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Policy_Current_Impl.obj" $(SOURCE)

SOURCE="Policy_ForwardC.cpp"

"$(INTDIR)\Policy_ForwardC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Policy_ForwardC.obj" $(SOURCE)

SOURCE="Policy_ManagerC.cpp"

"$(INTDIR)\Policy_ManagerC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Policy_ManagerC.obj" $(SOURCE)

SOURCE="Policy_Set.cpp"

"$(INTDIR)\Policy_Set.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Policy_Set.obj" $(SOURCE)

SOURCE="Policy_Validator.cpp"

"$(INTDIR)\Policy_Validator.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Policy_Validator.obj" $(SOURCE)

SOURCE="PolicyC.cpp"

"$(INTDIR)\PolicyC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PolicyC.obj" $(SOURCE)

SOURCE="PolicyFactory_Registry_Adapter.cpp"

"$(INTDIR)\PolicyFactory_Registry_Adapter.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PolicyFactory_Registry_Adapter.obj" $(SOURCE)

SOURCE="PolicyFactory_Registry_Factory.cpp"

"$(INTDIR)\PolicyFactory_Registry_Factory.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PolicyFactory_Registry_Factory.obj" $(SOURCE)

SOURCE="PortableInterceptorC.cpp"

"$(INTDIR)\PortableInterceptorC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PortableInterceptorC.obj" $(SOURCE)

SOURCE="Principal.cpp"

"$(INTDIR)\Principal.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Principal.obj" $(SOURCE)

SOURCE="Profile.cpp"

"$(INTDIR)\Profile.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Profile.obj" $(SOURCE)

SOURCE="Profile_Transport_Resolver.cpp"

"$(INTDIR)\Profile_Transport_Resolver.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Profile_Transport_Resolver.obj" $(SOURCE)

SOURCE="Protocol_Factory.cpp"

"$(INTDIR)\Protocol_Factory.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Protocol_Factory.obj" $(SOURCE)

SOURCE="Protocols_Hooks.cpp"

"$(INTDIR)\Protocols_Hooks.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Protocols_Hooks.obj" $(SOURCE)

SOURCE="Network_Priority_Protocols_Hooks.cpp"

"$(INTDIR)\Network_Priority_Protocols_Hooks.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Network_Priority_Protocols_Hooks.obj" $(SOURCE)

SOURCE="Queued_Data.cpp"

"$(INTDIR)\Queued_Data.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Queued_Data.obj" $(SOURCE)

SOURCE="Queued_Message.cpp"

"$(INTDIR)\Queued_Message.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Queued_Message.obj" $(SOURCE)

SOURCE="Reactive_Connect_Strategy.cpp"

"$(INTDIR)\Reactive_Connect_Strategy.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Reactive_Connect_Strategy.obj" $(SOURCE)

SOURCE="Reactive_Flushing_Strategy.cpp"

"$(INTDIR)\Reactive_Flushing_Strategy.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Reactive_Flushing_Strategy.obj" $(SOURCE)

SOURCE="Refcounted_ObjectKey.cpp"

"$(INTDIR)\Refcounted_ObjectKey.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Refcounted_ObjectKey.obj" $(SOURCE)

SOURCE="Remote_Invocation.cpp"

"$(INTDIR)\Remote_Invocation.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Remote_Invocation.obj" $(SOURCE)

SOURCE="Remote_Object_Proxy_Broker.cpp"

"$(INTDIR)\Remote_Object_Proxy_Broker.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Remote_Object_Proxy_Broker.obj" $(SOURCE)

SOURCE="Reply_Dispatcher.cpp"

"$(INTDIR)\Reply_Dispatcher.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Reply_Dispatcher.obj" $(SOURCE)

SOURCE="Request_Dispatcher.cpp"

"$(INTDIR)\Request_Dispatcher.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Request_Dispatcher.obj" $(SOURCE)

SOURCE="RequestInterceptor_Adapter.cpp"

"$(INTDIR)\RequestInterceptor_Adapter.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RequestInterceptor_Adapter.obj" $(SOURCE)

SOURCE="Resource_Factory.cpp"

"$(INTDIR)\Resource_Factory.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Resource_Factory.obj" $(SOURCE)

SOURCE="Resume_Handle.cpp"

"$(INTDIR)\Resume_Handle.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Resume_Handle.obj" $(SOURCE)

SOURCE="Resume_Handle_Deferred.cpp"

"$(INTDIR)\Resume_Handle_Deferred.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Resume_Handle_Deferred.obj" $(SOURCE)

SOURCE="Server_Strategy_Factory.cpp"

"$(INTDIR)\Server_Strategy_Factory.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Server_Strategy_Factory.obj" $(SOURCE)

SOURCE="ServerRequestInterceptor_Adapter.cpp"

"$(INTDIR)\ServerRequestInterceptor_Adapter.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ServerRequestInterceptor_Adapter.obj" $(SOURCE)

SOURCE="ServerRequestInterceptor_Adapter_Factory.cpp"

"$(INTDIR)\ServerRequestInterceptor_Adapter_Factory.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ServerRequestInterceptor_Adapter_Factory.obj" $(SOURCE)

SOURCE="Service_Callbacks.cpp"

"$(INTDIR)\Service_Callbacks.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Service_Callbacks.obj" $(SOURCE)

SOURCE="Service_Context.cpp"

"$(INTDIR)\Service_Context.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Service_Context.obj" $(SOURCE)

SOURCE="Service_Context_Handler.cpp"

"$(INTDIR)\Service_Context_Handler.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Service_Context_Handler.obj" $(SOURCE)

SOURCE="Service_Context_Handler_Registry.cpp"

"$(INTDIR)\Service_Context_Handler_Registry.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Service_Context_Handler_Registry.obj" $(SOURCE)

SOURCE="Services_Activate.cpp"

"$(INTDIR)\Services_Activate.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Services_Activate.obj" $(SOURCE)

SOURCE="ServicesC.cpp"

"$(INTDIR)\ServicesC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ServicesC.obj" $(SOURCE)

SOURCE="ShortSeqC.cpp"

"$(INTDIR)\ShortSeqC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ShortSeqC.obj" $(SOURCE)

SOURCE="String_Alloc.cpp"

"$(INTDIR)\String_Alloc.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\String_Alloc.obj" $(SOURCE)

SOURCE="StringSeqC.cpp"

"$(INTDIR)\StringSeqC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\StringSeqC.obj" $(SOURCE)

SOURCE="Stub.cpp"

"$(INTDIR)\Stub.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Stub.obj" $(SOURCE)

SOURCE="Stub_Factory.cpp"

"$(INTDIR)\Stub_Factory.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Stub_Factory.obj" $(SOURCE)

SOURCE="Synch_Invocation.cpp"

"$(INTDIR)\Synch_Invocation.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Synch_Invocation.obj" $(SOURCE)

SOURCE="Synch_Queued_Message.cpp"

"$(INTDIR)\Synch_Queued_Message.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Synch_Queued_Message.obj" $(SOURCE)

SOURCE="Synch_Reply_Dispatcher.cpp"

"$(INTDIR)\Synch_Reply_Dispatcher.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Synch_Reply_Dispatcher.obj" $(SOURCE)

SOURCE="SystemException.cpp"

"$(INTDIR)\SystemException.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\SystemException.obj" $(SOURCE)

SOURCE="Tagged_Components.cpp"

"$(INTDIR)\Tagged_Components.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Tagged_Components.obj" $(SOURCE)

SOURCE="Tagged_Profile.cpp"

"$(INTDIR)\Tagged_Profile.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Tagged_Profile.obj" $(SOURCE)

SOURCE="TAO_Internal.cpp"

"$(INTDIR)\TAO_Internal.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\TAO_Internal.obj" $(SOURCE)

SOURCE="TAO_Server_Request.cpp"

"$(INTDIR)\TAO_Server_Request.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\TAO_Server_Request.obj" $(SOURCE)

SOURCE="TAO_Singleton_Manager.cpp"

"$(INTDIR)\TAO_Singleton_Manager.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\TAO_Singleton_Manager.obj" $(SOURCE)

SOURCE="TAOC.cpp"

"$(INTDIR)\TAOC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\TAOC.obj" $(SOURCE)

SOURCE="target_specification.cpp"

"$(INTDIR)\target_specification.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\target_specification.obj" $(SOURCE)

SOURCE="Thread_Lane_Resources.cpp"

"$(INTDIR)\Thread_Lane_Resources.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Thread_Lane_Resources.obj" $(SOURCE)

SOURCE="Thread_Lane_Resources_Manager.cpp"

"$(INTDIR)\Thread_Lane_Resources_Manager.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Thread_Lane_Resources_Manager.obj" $(SOURCE)

SOURCE="Thread_Per_Connection_Handler.cpp"

"$(INTDIR)\Thread_Per_Connection_Handler.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Thread_Per_Connection_Handler.obj" $(SOURCE)

SOURCE="TimeBaseC.cpp"

"$(INTDIR)\TimeBaseC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\TimeBaseC.obj" $(SOURCE)

SOURCE="Transport.cpp"

"$(INTDIR)\Transport.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Transport.obj" $(SOURCE)

SOURCE="Transport_Acceptor.cpp"

"$(INTDIR)\Transport_Acceptor.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Transport_Acceptor.obj" $(SOURCE)

SOURCE="Transport_Connector.cpp"

"$(INTDIR)\Transport_Connector.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Transport_Connector.obj" $(SOURCE)

SOURCE="Transport_Descriptor_Interface.cpp"

"$(INTDIR)\Transport_Descriptor_Interface.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Transport_Descriptor_Interface.obj" $(SOURCE)

SOURCE="Transport_Mux_Strategy.cpp"

"$(INTDIR)\Transport_Mux_Strategy.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Transport_Mux_Strategy.obj" $(SOURCE)

SOURCE="Transport_Queueing_Strategies.cpp"

"$(INTDIR)\Transport_Queueing_Strategies.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Transport_Queueing_Strategies.obj" $(SOURCE)

SOURCE="Transport_Selection_Guard.cpp"

"$(INTDIR)\Transport_Selection_Guard.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Transport_Selection_Guard.obj" $(SOURCE)

SOURCE="Transport_Timer.cpp"

"$(INTDIR)\Transport_Timer.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Transport_Timer.obj" $(SOURCE)

SOURCE="TSS_Resources.cpp"

"$(INTDIR)\TSS_Resources.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\TSS_Resources.obj" $(SOURCE)

SOURCE="TypeCodeFactory_Adapter.cpp"

"$(INTDIR)\TypeCodeFactory_Adapter.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\TypeCodeFactory_Adapter.obj" $(SOURCE)

SOURCE="Typecode_typesC.cpp"

"$(INTDIR)\Typecode_typesC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Typecode_typesC.obj" $(SOURCE)

SOURCE="ULongLongSeqC.cpp"

"$(INTDIR)\ULongLongSeqC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ULongLongSeqC.obj" $(SOURCE)

SOURCE="ULongSeqC.cpp"

"$(INTDIR)\ULongSeqC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ULongSeqC.obj" $(SOURCE)

SOURCE="UserException.cpp"

"$(INTDIR)\UserException.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\UserException.obj" $(SOURCE)

SOURCE="UShortSeqC.cpp"

"$(INTDIR)\UShortSeqC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\UShortSeqC.obj" $(SOURCE)

SOURCE="Valuetype_Adapter.cpp"

"$(INTDIR)\Valuetype_Adapter.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Valuetype_Adapter.obj" $(SOURCE)

SOURCE="Valuetype_Adapter_Factory.cpp"

"$(INTDIR)\Valuetype_Adapter_Factory.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Valuetype_Adapter_Factory.obj" $(SOURCE)

SOURCE="Wait_On_Leader_Follower.cpp"

"$(INTDIR)\Wait_On_Leader_Follower.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Wait_On_Leader_Follower.obj" $(SOURCE)

SOURCE="Wait_On_LF_No_Upcall.cpp"

"$(INTDIR)\Wait_On_LF_No_Upcall.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Wait_On_LF_No_Upcall.obj" $(SOURCE)

SOURCE="Wait_On_Reactor.cpp"

"$(INTDIR)\Wait_On_Reactor.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Wait_On_Reactor.obj" $(SOURCE)

SOURCE="Wait_On_Read.cpp"

"$(INTDIR)\Wait_On_Read.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Wait_On_Read.obj" $(SOURCE)

SOURCE="Wait_Strategy.cpp"

"$(INTDIR)\Wait_Strategy.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Wait_Strategy.obj" $(SOURCE)

SOURCE="WCharSeqC.cpp"

"$(INTDIR)\WCharSeqC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\WCharSeqC.obj" $(SOURCE)

SOURCE="WrongTransactionC.cpp"

"$(INTDIR)\WrongTransactionC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\WrongTransactionC.obj" $(SOURCE)

SOURCE="WStringSeqC.cpp"

"$(INTDIR)\WStringSeqC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\WStringSeqC.obj" $(SOURCE)

SOURCE="GUIResource_Factory.cpp"

"$(INTDIR)\GUIResource_Factory.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\GUIResource_Factory.obj" $(SOURCE)

SOURCE="ZIOP_Adapter.cpp"

"$(INTDIR)\ZIOP_Adapter.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ZIOP_Adapter.obj" $(SOURCE)

!IF  "$(CFG)" == "Win64 Debug"
!ELSEIF  "$(CFG)" == "Win64 Release"
!ELSEIF  "$(CFG)" == "Win64 Static Debug"
!ELSEIF  "$(CFG)" == "Win64 Static Release"
!ENDIF

SOURCE="tao.rc"

"$(INTDIR)\tao.res" : $(SOURCE)
	$(RSC) /l 0x409 /fo"$(INTDIR)\tao.res" /d NDEBUG /d WIN64 /d _CRT_SECURE_NO_WARNINGS /d _CRT_SECURE_NO_DEPRECATE /d _CRT_NONSTDC_NO_DEPRECATE /d TAO_HAS_VALUETYPE_OUT_INDIRECTION /i "..\.." /i ".." $(SOURCE)



!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.TAO.dep")
	@echo Using "Makefile.TAO.dep"
!ELSE
	@echo Warning: cannot find "Makefile.TAO.dep"
!ENDIF
!ENDIF

