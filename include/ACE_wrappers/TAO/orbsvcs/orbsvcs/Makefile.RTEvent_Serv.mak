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
!MESSAGE NMAKE /f "Makefile.RTEvent_Serv.mak" CFG="Win64 Debug"
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
INTDIR=Debug\RTEvent_Serv\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_RTEvent_Servd.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_RTEVENT_SERV_BUILD_DLL -f "Makefile.RTEvent_Serv.dep" "Event\ECG_Adapters.cpp" "Event\ECG_CDR_Message_Receiver.cpp" "Event\ECG_CDR_Message_Sender.cpp" "Event\ECG_Complex_Address_Server.cpp" "Event\ECG_Mcast_EH.cpp" "Event\ECG_Mcast_Gateway.cpp" "Event\ECG_Simple_Address_Server.cpp" "Event\ECG_Simple_Mcast_EH.cpp" "Event\ECG_UDP_EH.cpp" "Event\ECG_UDP_Out_Endpoint.cpp" "Event\ECG_UDP_Receiver.cpp" "Event\ECG_UDP_Sender.cpp" "Event\ECG_ConsumerEC_Control.cpp" "Event\ECG_Reactive_ConsumerEC_Control.cpp" "Event\ECG_Reconnect_ConsumerEC_Control.cpp" "Event\EC_And_Filter.cpp" "Event\EC_Basic_Factory.cpp" "Event\EC_Basic_Filter_Builder.cpp" "Event\EC_Bitmask_Filter.cpp" "Event\EC_Channel_Destroyer.cpp" "Event\EC_Conjunction_Filter.cpp" "Event\EC_ConsumerAdmin.cpp" "Event\EC_ConsumerControl.cpp" "Event\EC_Default_Factory.cpp" "Event\EC_Default_ProxyConsumer.cpp" "Event\EC_Default_ProxySupplier.cpp" "Event\EC_Disjunction_Filter.cpp" "Event\EC_Dispatching.cpp" "Event\EC_Dispatching_Task.cpp" "Event\EC_Event_Channel.cpp" "Event\EC_Event_Channel_Base.cpp" "Event\EC_Factory.cpp" "Event\EC_Filter.cpp" "Event\EC_Filter_Builder.cpp" "Event\EC_Gateway.cpp" "Event\EC_Gateway_IIOP.cpp" "Event\EC_Gateway_IIOP_Factory.cpp" "Event\EC_Group_Scheduling.cpp" "Event\EC_Lifetime_Utils.cpp" "Event\EC_Masked_Type_Filter.cpp" "Event\EC_MT_Dispatching.cpp" "Event\EC_Negation_Filter.cpp" "Event\EC_Null_Factory.cpp" "Event\EC_Null_Scheduling.cpp" "Event\EC_ObserverStrategy.cpp" "Event\EC_Per_Supplier_Filter.cpp" "Event\EC_Prefix_Filter_Builder.cpp" "Event\EC_ProxyConsumer.cpp" "Event\EC_ProxySupplier.cpp" "Event\EC_Proxy_Disconnector.cpp" "Event\EC_QOS_Info.cpp" "Event\EC_Reactive_ConsumerControl.cpp" "Event\EC_Reactive_Dispatching.cpp" "Event\EC_Reactive_SupplierControl.cpp" "Event\EC_Reactive_Timeout_Generator.cpp" "Event\EC_Scheduling_Strategy.cpp" "Event\EC_SupplierAdmin.cpp" "Event\EC_SupplierControl.cpp" "Event\EC_Supplier_Filter.cpp" "Event\EC_Supplier_Filter_Builder.cpp" "Event\EC_Timeout_Filter.cpp" "Event\EC_Timeout_Generator.cpp" "Event\EC_Trivial_Supplier_Filter.cpp" "Event\EC_Type_Filter.cpp" "Event\EC_UDP_Admin.cpp" "Event\EC_TPC_Dispatching.cpp" "Event\EC_TPC_Dispatching_Task.cpp" "Event\EC_TPC_Factory.cpp" "Event\EC_TPC_ProxyConsumer.cpp" "Event\EC_TPC_ProxySupplier.cpp" "Event\EC_Thread_Flags.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_RTEvent_Servd.pdb"
	-@del /f/q "..\..\..\lib\TAO_RTEvent_Servd.dll"
	-@del /f/q "$(OUTDIR)\TAO_RTEvent_Servd.lib"
	-@del /f/q "$(OUTDIR)\TAO_RTEvent_Servd.exp"
	-@del /f/q "$(OUTDIR)\TAO_RTEvent_Servd.ilk"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\RTEvent_Serv\$(NULL)" mkdir "Debug\RTEvent_Serv"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_RTEVENT_SERV_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_Valuetyped.lib TAO_PortableServerd.lib TAO_CodecFactoryd.lib TAO_PId.lib TAO_Messagingd.lib TAO_Svc_Utilsd.lib TAO_RTEventd.lib TAO_RTEvent_Skeld.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\..\lib\TAO_RTEvent_Servd.pdb" /machine:IA64 /out:"..\..\..\lib\TAO_RTEvent_Servd.dll" /implib:"$(OUTDIR)\TAO_RTEvent_Servd.lib"
LINK32_OBJS= \
	"$(INTDIR)\RTEvent_Serv.res" \
	"$(INTDIR)\Event\ECG_Adapters.obj" \
	"$(INTDIR)\Event\ECG_CDR_Message_Receiver.obj" \
	"$(INTDIR)\Event\ECG_CDR_Message_Sender.obj" \
	"$(INTDIR)\Event\ECG_Complex_Address_Server.obj" \
	"$(INTDIR)\Event\ECG_Mcast_EH.obj" \
	"$(INTDIR)\Event\ECG_Mcast_Gateway.obj" \
	"$(INTDIR)\Event\ECG_Simple_Address_Server.obj" \
	"$(INTDIR)\Event\ECG_Simple_Mcast_EH.obj" \
	"$(INTDIR)\Event\ECG_UDP_EH.obj" \
	"$(INTDIR)\Event\ECG_UDP_Out_Endpoint.obj" \
	"$(INTDIR)\Event\ECG_UDP_Receiver.obj" \
	"$(INTDIR)\Event\ECG_UDP_Sender.obj" \
	"$(INTDIR)\Event\ECG_ConsumerEC_Control.obj" \
	"$(INTDIR)\Event\ECG_Reactive_ConsumerEC_Control.obj" \
	"$(INTDIR)\Event\ECG_Reconnect_ConsumerEC_Control.obj" \
	"$(INTDIR)\Event\EC_And_Filter.obj" \
	"$(INTDIR)\Event\EC_Basic_Factory.obj" \
	"$(INTDIR)\Event\EC_Basic_Filter_Builder.obj" \
	"$(INTDIR)\Event\EC_Bitmask_Filter.obj" \
	"$(INTDIR)\Event\EC_Channel_Destroyer.obj" \
	"$(INTDIR)\Event\EC_Conjunction_Filter.obj" \
	"$(INTDIR)\Event\EC_ConsumerAdmin.obj" \
	"$(INTDIR)\Event\EC_ConsumerControl.obj" \
	"$(INTDIR)\Event\EC_Default_Factory.obj" \
	"$(INTDIR)\Event\EC_Default_ProxyConsumer.obj" \
	"$(INTDIR)\Event\EC_Default_ProxySupplier.obj" \
	"$(INTDIR)\Event\EC_Disjunction_Filter.obj" \
	"$(INTDIR)\Event\EC_Dispatching.obj" \
	"$(INTDIR)\Event\EC_Dispatching_Task.obj" \
	"$(INTDIR)\Event\EC_Event_Channel.obj" \
	"$(INTDIR)\Event\EC_Event_Channel_Base.obj" \
	"$(INTDIR)\Event\EC_Factory.obj" \
	"$(INTDIR)\Event\EC_Filter.obj" \
	"$(INTDIR)\Event\EC_Filter_Builder.obj" \
	"$(INTDIR)\Event\EC_Gateway.obj" \
	"$(INTDIR)\Event\EC_Gateway_IIOP.obj" \
	"$(INTDIR)\Event\EC_Gateway_IIOP_Factory.obj" \
	"$(INTDIR)\Event\EC_Group_Scheduling.obj" \
	"$(INTDIR)\Event\EC_Lifetime_Utils.obj" \
	"$(INTDIR)\Event\EC_Masked_Type_Filter.obj" \
	"$(INTDIR)\Event\EC_MT_Dispatching.obj" \
	"$(INTDIR)\Event\EC_Negation_Filter.obj" \
	"$(INTDIR)\Event\EC_Null_Factory.obj" \
	"$(INTDIR)\Event\EC_Null_Scheduling.obj" \
	"$(INTDIR)\Event\EC_ObserverStrategy.obj" \
	"$(INTDIR)\Event\EC_Per_Supplier_Filter.obj" \
	"$(INTDIR)\Event\EC_Prefix_Filter_Builder.obj" \
	"$(INTDIR)\Event\EC_ProxyConsumer.obj" \
	"$(INTDIR)\Event\EC_ProxySupplier.obj" \
	"$(INTDIR)\Event\EC_Proxy_Disconnector.obj" \
	"$(INTDIR)\Event\EC_QOS_Info.obj" \
	"$(INTDIR)\Event\EC_Reactive_ConsumerControl.obj" \
	"$(INTDIR)\Event\EC_Reactive_Dispatching.obj" \
	"$(INTDIR)\Event\EC_Reactive_SupplierControl.obj" \
	"$(INTDIR)\Event\EC_Reactive_Timeout_Generator.obj" \
	"$(INTDIR)\Event\EC_Scheduling_Strategy.obj" \
	"$(INTDIR)\Event\EC_SupplierAdmin.obj" \
	"$(INTDIR)\Event\EC_SupplierControl.obj" \
	"$(INTDIR)\Event\EC_Supplier_Filter.obj" \
	"$(INTDIR)\Event\EC_Supplier_Filter_Builder.obj" \
	"$(INTDIR)\Event\EC_Timeout_Filter.obj" \
	"$(INTDIR)\Event\EC_Timeout_Generator.obj" \
	"$(INTDIR)\Event\EC_Trivial_Supplier_Filter.obj" \
	"$(INTDIR)\Event\EC_Type_Filter.obj" \
	"$(INTDIR)\Event\EC_UDP_Admin.obj" \
	"$(INTDIR)\Event\EC_TPC_Dispatching.obj" \
	"$(INTDIR)\Event\EC_TPC_Dispatching_Task.obj" \
	"$(INTDIR)\Event\EC_TPC_Factory.obj" \
	"$(INTDIR)\Event\EC_TPC_ProxyConsumer.obj" \
	"$(INTDIR)\Event\EC_TPC_ProxySupplier.obj" \
	"$(INTDIR)\Event\EC_Thread_Flags.obj"

"..\..\..\lib\TAO_RTEvent_Servd.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_RTEvent_Servd.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_RTEvent_Servd.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\RTEvent_Serv\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_RTEvent_Serv.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_RTEVENT_SERV_BUILD_DLL -f "Makefile.RTEvent_Serv.dep" "Event\ECG_Adapters.cpp" "Event\ECG_CDR_Message_Receiver.cpp" "Event\ECG_CDR_Message_Sender.cpp" "Event\ECG_Complex_Address_Server.cpp" "Event\ECG_Mcast_EH.cpp" "Event\ECG_Mcast_Gateway.cpp" "Event\ECG_Simple_Address_Server.cpp" "Event\ECG_Simple_Mcast_EH.cpp" "Event\ECG_UDP_EH.cpp" "Event\ECG_UDP_Out_Endpoint.cpp" "Event\ECG_UDP_Receiver.cpp" "Event\ECG_UDP_Sender.cpp" "Event\ECG_ConsumerEC_Control.cpp" "Event\ECG_Reactive_ConsumerEC_Control.cpp" "Event\ECG_Reconnect_ConsumerEC_Control.cpp" "Event\EC_And_Filter.cpp" "Event\EC_Basic_Factory.cpp" "Event\EC_Basic_Filter_Builder.cpp" "Event\EC_Bitmask_Filter.cpp" "Event\EC_Channel_Destroyer.cpp" "Event\EC_Conjunction_Filter.cpp" "Event\EC_ConsumerAdmin.cpp" "Event\EC_ConsumerControl.cpp" "Event\EC_Default_Factory.cpp" "Event\EC_Default_ProxyConsumer.cpp" "Event\EC_Default_ProxySupplier.cpp" "Event\EC_Disjunction_Filter.cpp" "Event\EC_Dispatching.cpp" "Event\EC_Dispatching_Task.cpp" "Event\EC_Event_Channel.cpp" "Event\EC_Event_Channel_Base.cpp" "Event\EC_Factory.cpp" "Event\EC_Filter.cpp" "Event\EC_Filter_Builder.cpp" "Event\EC_Gateway.cpp" "Event\EC_Gateway_IIOP.cpp" "Event\EC_Gateway_IIOP_Factory.cpp" "Event\EC_Group_Scheduling.cpp" "Event\EC_Lifetime_Utils.cpp" "Event\EC_Masked_Type_Filter.cpp" "Event\EC_MT_Dispatching.cpp" "Event\EC_Negation_Filter.cpp" "Event\EC_Null_Factory.cpp" "Event\EC_Null_Scheduling.cpp" "Event\EC_ObserverStrategy.cpp" "Event\EC_Per_Supplier_Filter.cpp" "Event\EC_Prefix_Filter_Builder.cpp" "Event\EC_ProxyConsumer.cpp" "Event\EC_ProxySupplier.cpp" "Event\EC_Proxy_Disconnector.cpp" "Event\EC_QOS_Info.cpp" "Event\EC_Reactive_ConsumerControl.cpp" "Event\EC_Reactive_Dispatching.cpp" "Event\EC_Reactive_SupplierControl.cpp" "Event\EC_Reactive_Timeout_Generator.cpp" "Event\EC_Scheduling_Strategy.cpp" "Event\EC_SupplierAdmin.cpp" "Event\EC_SupplierControl.cpp" "Event\EC_Supplier_Filter.cpp" "Event\EC_Supplier_Filter_Builder.cpp" "Event\EC_Timeout_Filter.cpp" "Event\EC_Timeout_Generator.cpp" "Event\EC_Trivial_Supplier_Filter.cpp" "Event\EC_Type_Filter.cpp" "Event\EC_UDP_Admin.cpp" "Event\EC_TPC_Dispatching.cpp" "Event\EC_TPC_Dispatching_Task.cpp" "Event\EC_TPC_Factory.cpp" "Event\EC_TPC_ProxyConsumer.cpp" "Event\EC_TPC_ProxySupplier.cpp" "Event\EC_Thread_Flags.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\TAO_RTEvent_Serv.dll"
	-@del /f/q "$(OUTDIR)\TAO_RTEvent_Serv.lib"
	-@del /f/q "$(OUTDIR)\TAO_RTEvent_Serv.exp"
	-@del /f/q "$(OUTDIR)\TAO_RTEvent_Serv.ilk"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\RTEvent_Serv\$(NULL)" mkdir "Release\RTEvent_Serv"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_RTEVENT_SERV_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_Valuetype.lib TAO_PortableServer.lib TAO_CodecFactory.lib TAO_PI.lib TAO_Messaging.lib TAO_Svc_Utils.lib TAO_RTEvent.lib TAO_RTEvent_Skel.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\..\lib\TAO_RTEvent_Serv.dll" /implib:"$(OUTDIR)\TAO_RTEvent_Serv.lib"
LINK32_OBJS= \
	"$(INTDIR)\RTEvent_Serv.res" \
	"$(INTDIR)\Event\ECG_Adapters.obj" \
	"$(INTDIR)\Event\ECG_CDR_Message_Receiver.obj" \
	"$(INTDIR)\Event\ECG_CDR_Message_Sender.obj" \
	"$(INTDIR)\Event\ECG_Complex_Address_Server.obj" \
	"$(INTDIR)\Event\ECG_Mcast_EH.obj" \
	"$(INTDIR)\Event\ECG_Mcast_Gateway.obj" \
	"$(INTDIR)\Event\ECG_Simple_Address_Server.obj" \
	"$(INTDIR)\Event\ECG_Simple_Mcast_EH.obj" \
	"$(INTDIR)\Event\ECG_UDP_EH.obj" \
	"$(INTDIR)\Event\ECG_UDP_Out_Endpoint.obj" \
	"$(INTDIR)\Event\ECG_UDP_Receiver.obj" \
	"$(INTDIR)\Event\ECG_UDP_Sender.obj" \
	"$(INTDIR)\Event\ECG_ConsumerEC_Control.obj" \
	"$(INTDIR)\Event\ECG_Reactive_ConsumerEC_Control.obj" \
	"$(INTDIR)\Event\ECG_Reconnect_ConsumerEC_Control.obj" \
	"$(INTDIR)\Event\EC_And_Filter.obj" \
	"$(INTDIR)\Event\EC_Basic_Factory.obj" \
	"$(INTDIR)\Event\EC_Basic_Filter_Builder.obj" \
	"$(INTDIR)\Event\EC_Bitmask_Filter.obj" \
	"$(INTDIR)\Event\EC_Channel_Destroyer.obj" \
	"$(INTDIR)\Event\EC_Conjunction_Filter.obj" \
	"$(INTDIR)\Event\EC_ConsumerAdmin.obj" \
	"$(INTDIR)\Event\EC_ConsumerControl.obj" \
	"$(INTDIR)\Event\EC_Default_Factory.obj" \
	"$(INTDIR)\Event\EC_Default_ProxyConsumer.obj" \
	"$(INTDIR)\Event\EC_Default_ProxySupplier.obj" \
	"$(INTDIR)\Event\EC_Disjunction_Filter.obj" \
	"$(INTDIR)\Event\EC_Dispatching.obj" \
	"$(INTDIR)\Event\EC_Dispatching_Task.obj" \
	"$(INTDIR)\Event\EC_Event_Channel.obj" \
	"$(INTDIR)\Event\EC_Event_Channel_Base.obj" \
	"$(INTDIR)\Event\EC_Factory.obj" \
	"$(INTDIR)\Event\EC_Filter.obj" \
	"$(INTDIR)\Event\EC_Filter_Builder.obj" \
	"$(INTDIR)\Event\EC_Gateway.obj" \
	"$(INTDIR)\Event\EC_Gateway_IIOP.obj" \
	"$(INTDIR)\Event\EC_Gateway_IIOP_Factory.obj" \
	"$(INTDIR)\Event\EC_Group_Scheduling.obj" \
	"$(INTDIR)\Event\EC_Lifetime_Utils.obj" \
	"$(INTDIR)\Event\EC_Masked_Type_Filter.obj" \
	"$(INTDIR)\Event\EC_MT_Dispatching.obj" \
	"$(INTDIR)\Event\EC_Negation_Filter.obj" \
	"$(INTDIR)\Event\EC_Null_Factory.obj" \
	"$(INTDIR)\Event\EC_Null_Scheduling.obj" \
	"$(INTDIR)\Event\EC_ObserverStrategy.obj" \
	"$(INTDIR)\Event\EC_Per_Supplier_Filter.obj" \
	"$(INTDIR)\Event\EC_Prefix_Filter_Builder.obj" \
	"$(INTDIR)\Event\EC_ProxyConsumer.obj" \
	"$(INTDIR)\Event\EC_ProxySupplier.obj" \
	"$(INTDIR)\Event\EC_Proxy_Disconnector.obj" \
	"$(INTDIR)\Event\EC_QOS_Info.obj" \
	"$(INTDIR)\Event\EC_Reactive_ConsumerControl.obj" \
	"$(INTDIR)\Event\EC_Reactive_Dispatching.obj" \
	"$(INTDIR)\Event\EC_Reactive_SupplierControl.obj" \
	"$(INTDIR)\Event\EC_Reactive_Timeout_Generator.obj" \
	"$(INTDIR)\Event\EC_Scheduling_Strategy.obj" \
	"$(INTDIR)\Event\EC_SupplierAdmin.obj" \
	"$(INTDIR)\Event\EC_SupplierControl.obj" \
	"$(INTDIR)\Event\EC_Supplier_Filter.obj" \
	"$(INTDIR)\Event\EC_Supplier_Filter_Builder.obj" \
	"$(INTDIR)\Event\EC_Timeout_Filter.obj" \
	"$(INTDIR)\Event\EC_Timeout_Generator.obj" \
	"$(INTDIR)\Event\EC_Trivial_Supplier_Filter.obj" \
	"$(INTDIR)\Event\EC_Type_Filter.obj" \
	"$(INTDIR)\Event\EC_UDP_Admin.obj" \
	"$(INTDIR)\Event\EC_TPC_Dispatching.obj" \
	"$(INTDIR)\Event\EC_TPC_Dispatching_Task.obj" \
	"$(INTDIR)\Event\EC_TPC_Factory.obj" \
	"$(INTDIR)\Event\EC_TPC_ProxyConsumer.obj" \
	"$(INTDIR)\Event\EC_TPC_ProxySupplier.obj" \
	"$(INTDIR)\Event\EC_Thread_Flags.obj"

"..\..\..\lib\TAO_RTEvent_Serv.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_RTEvent_Serv.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_RTEvent_Serv.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\RTEvent_Serv\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_RTEvent_Servsd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.RTEvent_Serv.dep" "Event\ECG_Adapters.cpp" "Event\ECG_CDR_Message_Receiver.cpp" "Event\ECG_CDR_Message_Sender.cpp" "Event\ECG_Complex_Address_Server.cpp" "Event\ECG_Mcast_EH.cpp" "Event\ECG_Mcast_Gateway.cpp" "Event\ECG_Simple_Address_Server.cpp" "Event\ECG_Simple_Mcast_EH.cpp" "Event\ECG_UDP_EH.cpp" "Event\ECG_UDP_Out_Endpoint.cpp" "Event\ECG_UDP_Receiver.cpp" "Event\ECG_UDP_Sender.cpp" "Event\ECG_ConsumerEC_Control.cpp" "Event\ECG_Reactive_ConsumerEC_Control.cpp" "Event\ECG_Reconnect_ConsumerEC_Control.cpp" "Event\EC_And_Filter.cpp" "Event\EC_Basic_Factory.cpp" "Event\EC_Basic_Filter_Builder.cpp" "Event\EC_Bitmask_Filter.cpp" "Event\EC_Channel_Destroyer.cpp" "Event\EC_Conjunction_Filter.cpp" "Event\EC_ConsumerAdmin.cpp" "Event\EC_ConsumerControl.cpp" "Event\EC_Default_Factory.cpp" "Event\EC_Default_ProxyConsumer.cpp" "Event\EC_Default_ProxySupplier.cpp" "Event\EC_Disjunction_Filter.cpp" "Event\EC_Dispatching.cpp" "Event\EC_Dispatching_Task.cpp" "Event\EC_Event_Channel.cpp" "Event\EC_Event_Channel_Base.cpp" "Event\EC_Factory.cpp" "Event\EC_Filter.cpp" "Event\EC_Filter_Builder.cpp" "Event\EC_Gateway.cpp" "Event\EC_Gateway_IIOP.cpp" "Event\EC_Gateway_IIOP_Factory.cpp" "Event\EC_Group_Scheduling.cpp" "Event\EC_Lifetime_Utils.cpp" "Event\EC_Masked_Type_Filter.cpp" "Event\EC_MT_Dispatching.cpp" "Event\EC_Negation_Filter.cpp" "Event\EC_Null_Factory.cpp" "Event\EC_Null_Scheduling.cpp" "Event\EC_ObserverStrategy.cpp" "Event\EC_Per_Supplier_Filter.cpp" "Event\EC_Prefix_Filter_Builder.cpp" "Event\EC_ProxyConsumer.cpp" "Event\EC_ProxySupplier.cpp" "Event\EC_Proxy_Disconnector.cpp" "Event\EC_QOS_Info.cpp" "Event\EC_Reactive_ConsumerControl.cpp" "Event\EC_Reactive_Dispatching.cpp" "Event\EC_Reactive_SupplierControl.cpp" "Event\EC_Reactive_Timeout_Generator.cpp" "Event\EC_Scheduling_Strategy.cpp" "Event\EC_SupplierAdmin.cpp" "Event\EC_SupplierControl.cpp" "Event\EC_Supplier_Filter.cpp" "Event\EC_Supplier_Filter_Builder.cpp" "Event\EC_Timeout_Filter.cpp" "Event\EC_Timeout_Generator.cpp" "Event\EC_Trivial_Supplier_Filter.cpp" "Event\EC_Type_Filter.cpp" "Event\EC_UDP_Admin.cpp" "Event\EC_TPC_Dispatching.cpp" "Event\EC_TPC_Dispatching_Task.cpp" "Event\EC_TPC_Factory.cpp" "Event\EC_TPC_ProxyConsumer.cpp" "Event\EC_TPC_ProxySupplier.cpp" "Event\EC_Thread_Flags.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_RTEvent_Servsd.lib"
	-@del /f/q "$(OUTDIR)\TAO_RTEvent_Servsd.exp"
	-@del /f/q "$(OUTDIR)\TAO_RTEvent_Servsd.ilk"
	-@del /f/q "..\..\..\lib\TAO_RTEvent_Servsd.pdb"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\RTEvent_Serv\$(NULL)" mkdir "Static_Debug\RTEvent_Serv"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\TAO_RTEvent_Servsd.pdb" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_RTEvent_Servsd.lib"
LINK32_OBJS= \
	"$(INTDIR)\Event\ECG_Adapters.obj" \
	"$(INTDIR)\Event\ECG_CDR_Message_Receiver.obj" \
	"$(INTDIR)\Event\ECG_CDR_Message_Sender.obj" \
	"$(INTDIR)\Event\ECG_Complex_Address_Server.obj" \
	"$(INTDIR)\Event\ECG_Mcast_EH.obj" \
	"$(INTDIR)\Event\ECG_Mcast_Gateway.obj" \
	"$(INTDIR)\Event\ECG_Simple_Address_Server.obj" \
	"$(INTDIR)\Event\ECG_Simple_Mcast_EH.obj" \
	"$(INTDIR)\Event\ECG_UDP_EH.obj" \
	"$(INTDIR)\Event\ECG_UDP_Out_Endpoint.obj" \
	"$(INTDIR)\Event\ECG_UDP_Receiver.obj" \
	"$(INTDIR)\Event\ECG_UDP_Sender.obj" \
	"$(INTDIR)\Event\ECG_ConsumerEC_Control.obj" \
	"$(INTDIR)\Event\ECG_Reactive_ConsumerEC_Control.obj" \
	"$(INTDIR)\Event\ECG_Reconnect_ConsumerEC_Control.obj" \
	"$(INTDIR)\Event\EC_And_Filter.obj" \
	"$(INTDIR)\Event\EC_Basic_Factory.obj" \
	"$(INTDIR)\Event\EC_Basic_Filter_Builder.obj" \
	"$(INTDIR)\Event\EC_Bitmask_Filter.obj" \
	"$(INTDIR)\Event\EC_Channel_Destroyer.obj" \
	"$(INTDIR)\Event\EC_Conjunction_Filter.obj" \
	"$(INTDIR)\Event\EC_ConsumerAdmin.obj" \
	"$(INTDIR)\Event\EC_ConsumerControl.obj" \
	"$(INTDIR)\Event\EC_Default_Factory.obj" \
	"$(INTDIR)\Event\EC_Default_ProxyConsumer.obj" \
	"$(INTDIR)\Event\EC_Default_ProxySupplier.obj" \
	"$(INTDIR)\Event\EC_Disjunction_Filter.obj" \
	"$(INTDIR)\Event\EC_Dispatching.obj" \
	"$(INTDIR)\Event\EC_Dispatching_Task.obj" \
	"$(INTDIR)\Event\EC_Event_Channel.obj" \
	"$(INTDIR)\Event\EC_Event_Channel_Base.obj" \
	"$(INTDIR)\Event\EC_Factory.obj" \
	"$(INTDIR)\Event\EC_Filter.obj" \
	"$(INTDIR)\Event\EC_Filter_Builder.obj" \
	"$(INTDIR)\Event\EC_Gateway.obj" \
	"$(INTDIR)\Event\EC_Gateway_IIOP.obj" \
	"$(INTDIR)\Event\EC_Gateway_IIOP_Factory.obj" \
	"$(INTDIR)\Event\EC_Group_Scheduling.obj" \
	"$(INTDIR)\Event\EC_Lifetime_Utils.obj" \
	"$(INTDIR)\Event\EC_Masked_Type_Filter.obj" \
	"$(INTDIR)\Event\EC_MT_Dispatching.obj" \
	"$(INTDIR)\Event\EC_Negation_Filter.obj" \
	"$(INTDIR)\Event\EC_Null_Factory.obj" \
	"$(INTDIR)\Event\EC_Null_Scheduling.obj" \
	"$(INTDIR)\Event\EC_ObserverStrategy.obj" \
	"$(INTDIR)\Event\EC_Per_Supplier_Filter.obj" \
	"$(INTDIR)\Event\EC_Prefix_Filter_Builder.obj" \
	"$(INTDIR)\Event\EC_ProxyConsumer.obj" \
	"$(INTDIR)\Event\EC_ProxySupplier.obj" \
	"$(INTDIR)\Event\EC_Proxy_Disconnector.obj" \
	"$(INTDIR)\Event\EC_QOS_Info.obj" \
	"$(INTDIR)\Event\EC_Reactive_ConsumerControl.obj" \
	"$(INTDIR)\Event\EC_Reactive_Dispatching.obj" \
	"$(INTDIR)\Event\EC_Reactive_SupplierControl.obj" \
	"$(INTDIR)\Event\EC_Reactive_Timeout_Generator.obj" \
	"$(INTDIR)\Event\EC_Scheduling_Strategy.obj" \
	"$(INTDIR)\Event\EC_SupplierAdmin.obj" \
	"$(INTDIR)\Event\EC_SupplierControl.obj" \
	"$(INTDIR)\Event\EC_Supplier_Filter.obj" \
	"$(INTDIR)\Event\EC_Supplier_Filter_Builder.obj" \
	"$(INTDIR)\Event\EC_Timeout_Filter.obj" \
	"$(INTDIR)\Event\EC_Timeout_Generator.obj" \
	"$(INTDIR)\Event\EC_Trivial_Supplier_Filter.obj" \
	"$(INTDIR)\Event\EC_Type_Filter.obj" \
	"$(INTDIR)\Event\EC_UDP_Admin.obj" \
	"$(INTDIR)\Event\EC_TPC_Dispatching.obj" \
	"$(INTDIR)\Event\EC_TPC_Dispatching_Task.obj" \
	"$(INTDIR)\Event\EC_TPC_Factory.obj" \
	"$(INTDIR)\Event\EC_TPC_ProxyConsumer.obj" \
	"$(INTDIR)\Event\EC_TPC_ProxySupplier.obj" \
	"$(INTDIR)\Event\EC_Thread_Flags.obj"

"$(OUTDIR)\TAO_RTEvent_Servsd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_RTEvent_Servsd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_RTEvent_Servsd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\RTEvent_Serv\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_RTEvent_Servs.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.RTEvent_Serv.dep" "Event\ECG_Adapters.cpp" "Event\ECG_CDR_Message_Receiver.cpp" "Event\ECG_CDR_Message_Sender.cpp" "Event\ECG_Complex_Address_Server.cpp" "Event\ECG_Mcast_EH.cpp" "Event\ECG_Mcast_Gateway.cpp" "Event\ECG_Simple_Address_Server.cpp" "Event\ECG_Simple_Mcast_EH.cpp" "Event\ECG_UDP_EH.cpp" "Event\ECG_UDP_Out_Endpoint.cpp" "Event\ECG_UDP_Receiver.cpp" "Event\ECG_UDP_Sender.cpp" "Event\ECG_ConsumerEC_Control.cpp" "Event\ECG_Reactive_ConsumerEC_Control.cpp" "Event\ECG_Reconnect_ConsumerEC_Control.cpp" "Event\EC_And_Filter.cpp" "Event\EC_Basic_Factory.cpp" "Event\EC_Basic_Filter_Builder.cpp" "Event\EC_Bitmask_Filter.cpp" "Event\EC_Channel_Destroyer.cpp" "Event\EC_Conjunction_Filter.cpp" "Event\EC_ConsumerAdmin.cpp" "Event\EC_ConsumerControl.cpp" "Event\EC_Default_Factory.cpp" "Event\EC_Default_ProxyConsumer.cpp" "Event\EC_Default_ProxySupplier.cpp" "Event\EC_Disjunction_Filter.cpp" "Event\EC_Dispatching.cpp" "Event\EC_Dispatching_Task.cpp" "Event\EC_Event_Channel.cpp" "Event\EC_Event_Channel_Base.cpp" "Event\EC_Factory.cpp" "Event\EC_Filter.cpp" "Event\EC_Filter_Builder.cpp" "Event\EC_Gateway.cpp" "Event\EC_Gateway_IIOP.cpp" "Event\EC_Gateway_IIOP_Factory.cpp" "Event\EC_Group_Scheduling.cpp" "Event\EC_Lifetime_Utils.cpp" "Event\EC_Masked_Type_Filter.cpp" "Event\EC_MT_Dispatching.cpp" "Event\EC_Negation_Filter.cpp" "Event\EC_Null_Factory.cpp" "Event\EC_Null_Scheduling.cpp" "Event\EC_ObserverStrategy.cpp" "Event\EC_Per_Supplier_Filter.cpp" "Event\EC_Prefix_Filter_Builder.cpp" "Event\EC_ProxyConsumer.cpp" "Event\EC_ProxySupplier.cpp" "Event\EC_Proxy_Disconnector.cpp" "Event\EC_QOS_Info.cpp" "Event\EC_Reactive_ConsumerControl.cpp" "Event\EC_Reactive_Dispatching.cpp" "Event\EC_Reactive_SupplierControl.cpp" "Event\EC_Reactive_Timeout_Generator.cpp" "Event\EC_Scheduling_Strategy.cpp" "Event\EC_SupplierAdmin.cpp" "Event\EC_SupplierControl.cpp" "Event\EC_Supplier_Filter.cpp" "Event\EC_Supplier_Filter_Builder.cpp" "Event\EC_Timeout_Filter.cpp" "Event\EC_Timeout_Generator.cpp" "Event\EC_Trivial_Supplier_Filter.cpp" "Event\EC_Type_Filter.cpp" "Event\EC_UDP_Admin.cpp" "Event\EC_TPC_Dispatching.cpp" "Event\EC_TPC_Dispatching_Task.cpp" "Event\EC_TPC_Factory.cpp" "Event\EC_TPC_ProxyConsumer.cpp" "Event\EC_TPC_ProxySupplier.cpp" "Event\EC_Thread_Flags.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_RTEvent_Servs.lib"
	-@del /f/q "$(OUTDIR)\TAO_RTEvent_Servs.exp"
	-@del /f/q "$(OUTDIR)\TAO_RTEvent_Servs.ilk"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\RTEvent_Serv\$(NULL)" mkdir "Static_Release\RTEvent_Serv"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_RTEvent_Servs.lib"
LINK32_OBJS= \
	"$(INTDIR)\Event\ECG_Adapters.obj" \
	"$(INTDIR)\Event\ECG_CDR_Message_Receiver.obj" \
	"$(INTDIR)\Event\ECG_CDR_Message_Sender.obj" \
	"$(INTDIR)\Event\ECG_Complex_Address_Server.obj" \
	"$(INTDIR)\Event\ECG_Mcast_EH.obj" \
	"$(INTDIR)\Event\ECG_Mcast_Gateway.obj" \
	"$(INTDIR)\Event\ECG_Simple_Address_Server.obj" \
	"$(INTDIR)\Event\ECG_Simple_Mcast_EH.obj" \
	"$(INTDIR)\Event\ECG_UDP_EH.obj" \
	"$(INTDIR)\Event\ECG_UDP_Out_Endpoint.obj" \
	"$(INTDIR)\Event\ECG_UDP_Receiver.obj" \
	"$(INTDIR)\Event\ECG_UDP_Sender.obj" \
	"$(INTDIR)\Event\ECG_ConsumerEC_Control.obj" \
	"$(INTDIR)\Event\ECG_Reactive_ConsumerEC_Control.obj" \
	"$(INTDIR)\Event\ECG_Reconnect_ConsumerEC_Control.obj" \
	"$(INTDIR)\Event\EC_And_Filter.obj" \
	"$(INTDIR)\Event\EC_Basic_Factory.obj" \
	"$(INTDIR)\Event\EC_Basic_Filter_Builder.obj" \
	"$(INTDIR)\Event\EC_Bitmask_Filter.obj" \
	"$(INTDIR)\Event\EC_Channel_Destroyer.obj" \
	"$(INTDIR)\Event\EC_Conjunction_Filter.obj" \
	"$(INTDIR)\Event\EC_ConsumerAdmin.obj" \
	"$(INTDIR)\Event\EC_ConsumerControl.obj" \
	"$(INTDIR)\Event\EC_Default_Factory.obj" \
	"$(INTDIR)\Event\EC_Default_ProxyConsumer.obj" \
	"$(INTDIR)\Event\EC_Default_ProxySupplier.obj" \
	"$(INTDIR)\Event\EC_Disjunction_Filter.obj" \
	"$(INTDIR)\Event\EC_Dispatching.obj" \
	"$(INTDIR)\Event\EC_Dispatching_Task.obj" \
	"$(INTDIR)\Event\EC_Event_Channel.obj" \
	"$(INTDIR)\Event\EC_Event_Channel_Base.obj" \
	"$(INTDIR)\Event\EC_Factory.obj" \
	"$(INTDIR)\Event\EC_Filter.obj" \
	"$(INTDIR)\Event\EC_Filter_Builder.obj" \
	"$(INTDIR)\Event\EC_Gateway.obj" \
	"$(INTDIR)\Event\EC_Gateway_IIOP.obj" \
	"$(INTDIR)\Event\EC_Gateway_IIOP_Factory.obj" \
	"$(INTDIR)\Event\EC_Group_Scheduling.obj" \
	"$(INTDIR)\Event\EC_Lifetime_Utils.obj" \
	"$(INTDIR)\Event\EC_Masked_Type_Filter.obj" \
	"$(INTDIR)\Event\EC_MT_Dispatching.obj" \
	"$(INTDIR)\Event\EC_Negation_Filter.obj" \
	"$(INTDIR)\Event\EC_Null_Factory.obj" \
	"$(INTDIR)\Event\EC_Null_Scheduling.obj" \
	"$(INTDIR)\Event\EC_ObserverStrategy.obj" \
	"$(INTDIR)\Event\EC_Per_Supplier_Filter.obj" \
	"$(INTDIR)\Event\EC_Prefix_Filter_Builder.obj" \
	"$(INTDIR)\Event\EC_ProxyConsumer.obj" \
	"$(INTDIR)\Event\EC_ProxySupplier.obj" \
	"$(INTDIR)\Event\EC_Proxy_Disconnector.obj" \
	"$(INTDIR)\Event\EC_QOS_Info.obj" \
	"$(INTDIR)\Event\EC_Reactive_ConsumerControl.obj" \
	"$(INTDIR)\Event\EC_Reactive_Dispatching.obj" \
	"$(INTDIR)\Event\EC_Reactive_SupplierControl.obj" \
	"$(INTDIR)\Event\EC_Reactive_Timeout_Generator.obj" \
	"$(INTDIR)\Event\EC_Scheduling_Strategy.obj" \
	"$(INTDIR)\Event\EC_SupplierAdmin.obj" \
	"$(INTDIR)\Event\EC_SupplierControl.obj" \
	"$(INTDIR)\Event\EC_Supplier_Filter.obj" \
	"$(INTDIR)\Event\EC_Supplier_Filter_Builder.obj" \
	"$(INTDIR)\Event\EC_Timeout_Filter.obj" \
	"$(INTDIR)\Event\EC_Timeout_Generator.obj" \
	"$(INTDIR)\Event\EC_Trivial_Supplier_Filter.obj" \
	"$(INTDIR)\Event\EC_Type_Filter.obj" \
	"$(INTDIR)\Event\EC_UDP_Admin.obj" \
	"$(INTDIR)\Event\EC_TPC_Dispatching.obj" \
	"$(INTDIR)\Event\EC_TPC_Dispatching_Task.obj" \
	"$(INTDIR)\Event\EC_TPC_Factory.obj" \
	"$(INTDIR)\Event\EC_TPC_ProxyConsumer.obj" \
	"$(INTDIR)\Event\EC_TPC_ProxySupplier.obj" \
	"$(INTDIR)\Event\EC_Thread_Flags.obj"

"$(OUTDIR)\TAO_RTEvent_Servs.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_RTEvent_Servs.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_RTEvent_Servs.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.RTEvent_Serv.dep")
!INCLUDE "Makefile.RTEvent_Serv.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="Event\ECG_Adapters.cpp"

"$(INTDIR)\Event\ECG_Adapters.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\ECG_Adapters.obj" $(SOURCE)

SOURCE="Event\ECG_CDR_Message_Receiver.cpp"

"$(INTDIR)\Event\ECG_CDR_Message_Receiver.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\ECG_CDR_Message_Receiver.obj" $(SOURCE)

SOURCE="Event\ECG_CDR_Message_Sender.cpp"

"$(INTDIR)\Event\ECG_CDR_Message_Sender.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\ECG_CDR_Message_Sender.obj" $(SOURCE)

SOURCE="Event\ECG_Complex_Address_Server.cpp"

"$(INTDIR)\Event\ECG_Complex_Address_Server.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\ECG_Complex_Address_Server.obj" $(SOURCE)

SOURCE="Event\ECG_Mcast_EH.cpp"

"$(INTDIR)\Event\ECG_Mcast_EH.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\ECG_Mcast_EH.obj" $(SOURCE)

SOURCE="Event\ECG_Mcast_Gateway.cpp"

"$(INTDIR)\Event\ECG_Mcast_Gateway.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\ECG_Mcast_Gateway.obj" $(SOURCE)

SOURCE="Event\ECG_Simple_Address_Server.cpp"

"$(INTDIR)\Event\ECG_Simple_Address_Server.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\ECG_Simple_Address_Server.obj" $(SOURCE)

SOURCE="Event\ECG_Simple_Mcast_EH.cpp"

"$(INTDIR)\Event\ECG_Simple_Mcast_EH.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\ECG_Simple_Mcast_EH.obj" $(SOURCE)

SOURCE="Event\ECG_UDP_EH.cpp"

"$(INTDIR)\Event\ECG_UDP_EH.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\ECG_UDP_EH.obj" $(SOURCE)

SOURCE="Event\ECG_UDP_Out_Endpoint.cpp"

"$(INTDIR)\Event\ECG_UDP_Out_Endpoint.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\ECG_UDP_Out_Endpoint.obj" $(SOURCE)

SOURCE="Event\ECG_UDP_Receiver.cpp"

"$(INTDIR)\Event\ECG_UDP_Receiver.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\ECG_UDP_Receiver.obj" $(SOURCE)

SOURCE="Event\ECG_UDP_Sender.cpp"

"$(INTDIR)\Event\ECG_UDP_Sender.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\ECG_UDP_Sender.obj" $(SOURCE)

SOURCE="Event\ECG_ConsumerEC_Control.cpp"

"$(INTDIR)\Event\ECG_ConsumerEC_Control.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\ECG_ConsumerEC_Control.obj" $(SOURCE)

SOURCE="Event\ECG_Reactive_ConsumerEC_Control.cpp"

"$(INTDIR)\Event\ECG_Reactive_ConsumerEC_Control.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\ECG_Reactive_ConsumerEC_Control.obj" $(SOURCE)

SOURCE="Event\ECG_Reconnect_ConsumerEC_Control.cpp"

"$(INTDIR)\Event\ECG_Reconnect_ConsumerEC_Control.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\ECG_Reconnect_ConsumerEC_Control.obj" $(SOURCE)

SOURCE="Event\EC_And_Filter.cpp"

"$(INTDIR)\Event\EC_And_Filter.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_And_Filter.obj" $(SOURCE)

SOURCE="Event\EC_Basic_Factory.cpp"

"$(INTDIR)\Event\EC_Basic_Factory.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_Basic_Factory.obj" $(SOURCE)

SOURCE="Event\EC_Basic_Filter_Builder.cpp"

"$(INTDIR)\Event\EC_Basic_Filter_Builder.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_Basic_Filter_Builder.obj" $(SOURCE)

SOURCE="Event\EC_Bitmask_Filter.cpp"

"$(INTDIR)\Event\EC_Bitmask_Filter.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_Bitmask_Filter.obj" $(SOURCE)

SOURCE="Event\EC_Channel_Destroyer.cpp"

"$(INTDIR)\Event\EC_Channel_Destroyer.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_Channel_Destroyer.obj" $(SOURCE)

SOURCE="Event\EC_Conjunction_Filter.cpp"

"$(INTDIR)\Event\EC_Conjunction_Filter.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_Conjunction_Filter.obj" $(SOURCE)

SOURCE="Event\EC_ConsumerAdmin.cpp"

"$(INTDIR)\Event\EC_ConsumerAdmin.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_ConsumerAdmin.obj" $(SOURCE)

SOURCE="Event\EC_ConsumerControl.cpp"

"$(INTDIR)\Event\EC_ConsumerControl.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_ConsumerControl.obj" $(SOURCE)

SOURCE="Event\EC_Default_Factory.cpp"

"$(INTDIR)\Event\EC_Default_Factory.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_Default_Factory.obj" $(SOURCE)

SOURCE="Event\EC_Default_ProxyConsumer.cpp"

"$(INTDIR)\Event\EC_Default_ProxyConsumer.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_Default_ProxyConsumer.obj" $(SOURCE)

SOURCE="Event\EC_Default_ProxySupplier.cpp"

"$(INTDIR)\Event\EC_Default_ProxySupplier.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_Default_ProxySupplier.obj" $(SOURCE)

SOURCE="Event\EC_Disjunction_Filter.cpp"

"$(INTDIR)\Event\EC_Disjunction_Filter.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_Disjunction_Filter.obj" $(SOURCE)

SOURCE="Event\EC_Dispatching.cpp"

"$(INTDIR)\Event\EC_Dispatching.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_Dispatching.obj" $(SOURCE)

SOURCE="Event\EC_Dispatching_Task.cpp"

"$(INTDIR)\Event\EC_Dispatching_Task.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_Dispatching_Task.obj" $(SOURCE)

SOURCE="Event\EC_Event_Channel.cpp"

"$(INTDIR)\Event\EC_Event_Channel.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_Event_Channel.obj" $(SOURCE)

SOURCE="Event\EC_Event_Channel_Base.cpp"

"$(INTDIR)\Event\EC_Event_Channel_Base.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_Event_Channel_Base.obj" $(SOURCE)

SOURCE="Event\EC_Factory.cpp"

"$(INTDIR)\Event\EC_Factory.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_Factory.obj" $(SOURCE)

SOURCE="Event\EC_Filter.cpp"

"$(INTDIR)\Event\EC_Filter.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_Filter.obj" $(SOURCE)

SOURCE="Event\EC_Filter_Builder.cpp"

"$(INTDIR)\Event\EC_Filter_Builder.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_Filter_Builder.obj" $(SOURCE)

SOURCE="Event\EC_Gateway.cpp"

"$(INTDIR)\Event\EC_Gateway.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_Gateway.obj" $(SOURCE)

SOURCE="Event\EC_Gateway_IIOP.cpp"

"$(INTDIR)\Event\EC_Gateway_IIOP.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_Gateway_IIOP.obj" $(SOURCE)

SOURCE="Event\EC_Gateway_IIOP_Factory.cpp"

"$(INTDIR)\Event\EC_Gateway_IIOP_Factory.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_Gateway_IIOP_Factory.obj" $(SOURCE)

SOURCE="Event\EC_Group_Scheduling.cpp"

"$(INTDIR)\Event\EC_Group_Scheduling.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_Group_Scheduling.obj" $(SOURCE)

SOURCE="Event\EC_Lifetime_Utils.cpp"

"$(INTDIR)\Event\EC_Lifetime_Utils.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_Lifetime_Utils.obj" $(SOURCE)

SOURCE="Event\EC_Masked_Type_Filter.cpp"

"$(INTDIR)\Event\EC_Masked_Type_Filter.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_Masked_Type_Filter.obj" $(SOURCE)

SOURCE="Event\EC_MT_Dispatching.cpp"

"$(INTDIR)\Event\EC_MT_Dispatching.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_MT_Dispatching.obj" $(SOURCE)

SOURCE="Event\EC_Negation_Filter.cpp"

"$(INTDIR)\Event\EC_Negation_Filter.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_Negation_Filter.obj" $(SOURCE)

SOURCE="Event\EC_Null_Factory.cpp"

"$(INTDIR)\Event\EC_Null_Factory.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_Null_Factory.obj" $(SOURCE)

SOURCE="Event\EC_Null_Scheduling.cpp"

"$(INTDIR)\Event\EC_Null_Scheduling.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_Null_Scheduling.obj" $(SOURCE)

SOURCE="Event\EC_ObserverStrategy.cpp"

"$(INTDIR)\Event\EC_ObserverStrategy.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_ObserverStrategy.obj" $(SOURCE)

SOURCE="Event\EC_Per_Supplier_Filter.cpp"

"$(INTDIR)\Event\EC_Per_Supplier_Filter.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_Per_Supplier_Filter.obj" $(SOURCE)

SOURCE="Event\EC_Prefix_Filter_Builder.cpp"

"$(INTDIR)\Event\EC_Prefix_Filter_Builder.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_Prefix_Filter_Builder.obj" $(SOURCE)

SOURCE="Event\EC_ProxyConsumer.cpp"

"$(INTDIR)\Event\EC_ProxyConsumer.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_ProxyConsumer.obj" $(SOURCE)

SOURCE="Event\EC_ProxySupplier.cpp"

"$(INTDIR)\Event\EC_ProxySupplier.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_ProxySupplier.obj" $(SOURCE)

SOURCE="Event\EC_Proxy_Disconnector.cpp"

"$(INTDIR)\Event\EC_Proxy_Disconnector.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_Proxy_Disconnector.obj" $(SOURCE)

SOURCE="Event\EC_QOS_Info.cpp"

"$(INTDIR)\Event\EC_QOS_Info.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_QOS_Info.obj" $(SOURCE)

SOURCE="Event\EC_Reactive_ConsumerControl.cpp"

"$(INTDIR)\Event\EC_Reactive_ConsumerControl.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_Reactive_ConsumerControl.obj" $(SOURCE)

SOURCE="Event\EC_Reactive_Dispatching.cpp"

"$(INTDIR)\Event\EC_Reactive_Dispatching.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_Reactive_Dispatching.obj" $(SOURCE)

SOURCE="Event\EC_Reactive_SupplierControl.cpp"

"$(INTDIR)\Event\EC_Reactive_SupplierControl.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_Reactive_SupplierControl.obj" $(SOURCE)

SOURCE="Event\EC_Reactive_Timeout_Generator.cpp"

"$(INTDIR)\Event\EC_Reactive_Timeout_Generator.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_Reactive_Timeout_Generator.obj" $(SOURCE)

SOURCE="Event\EC_Scheduling_Strategy.cpp"

"$(INTDIR)\Event\EC_Scheduling_Strategy.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_Scheduling_Strategy.obj" $(SOURCE)

SOURCE="Event\EC_SupplierAdmin.cpp"

"$(INTDIR)\Event\EC_SupplierAdmin.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_SupplierAdmin.obj" $(SOURCE)

SOURCE="Event\EC_SupplierControl.cpp"

"$(INTDIR)\Event\EC_SupplierControl.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_SupplierControl.obj" $(SOURCE)

SOURCE="Event\EC_Supplier_Filter.cpp"

"$(INTDIR)\Event\EC_Supplier_Filter.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_Supplier_Filter.obj" $(SOURCE)

SOURCE="Event\EC_Supplier_Filter_Builder.cpp"

"$(INTDIR)\Event\EC_Supplier_Filter_Builder.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_Supplier_Filter_Builder.obj" $(SOURCE)

SOURCE="Event\EC_Timeout_Filter.cpp"

"$(INTDIR)\Event\EC_Timeout_Filter.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_Timeout_Filter.obj" $(SOURCE)

SOURCE="Event\EC_Timeout_Generator.cpp"

"$(INTDIR)\Event\EC_Timeout_Generator.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_Timeout_Generator.obj" $(SOURCE)

SOURCE="Event\EC_Trivial_Supplier_Filter.cpp"

"$(INTDIR)\Event\EC_Trivial_Supplier_Filter.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_Trivial_Supplier_Filter.obj" $(SOURCE)

SOURCE="Event\EC_Type_Filter.cpp"

"$(INTDIR)\Event\EC_Type_Filter.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_Type_Filter.obj" $(SOURCE)

SOURCE="Event\EC_UDP_Admin.cpp"

"$(INTDIR)\Event\EC_UDP_Admin.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_UDP_Admin.obj" $(SOURCE)

SOURCE="Event\EC_TPC_Dispatching.cpp"

"$(INTDIR)\Event\EC_TPC_Dispatching.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_TPC_Dispatching.obj" $(SOURCE)

SOURCE="Event\EC_TPC_Dispatching_Task.cpp"

"$(INTDIR)\Event\EC_TPC_Dispatching_Task.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_TPC_Dispatching_Task.obj" $(SOURCE)

SOURCE="Event\EC_TPC_Factory.cpp"

"$(INTDIR)\Event\EC_TPC_Factory.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_TPC_Factory.obj" $(SOURCE)

SOURCE="Event\EC_TPC_ProxyConsumer.cpp"

"$(INTDIR)\Event\EC_TPC_ProxyConsumer.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_TPC_ProxyConsumer.obj" $(SOURCE)

SOURCE="Event\EC_TPC_ProxySupplier.cpp"

"$(INTDIR)\Event\EC_TPC_ProxySupplier.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_TPC_ProxySupplier.obj" $(SOURCE)

SOURCE="Event\EC_Thread_Flags.cpp"

"$(INTDIR)\Event\EC_Thread_Flags.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_Thread_Flags.obj" $(SOURCE)

!IF  "$(CFG)" == "Win64 Debug"
!ELSEIF  "$(CFG)" == "Win64 Release"
!ELSEIF  "$(CFG)" == "Win64 Static Debug"
!ELSEIF  "$(CFG)" == "Win64 Static Release"
!ENDIF

SOURCE="RTEvent_Serv.rc"

"$(INTDIR)\RTEvent_Serv.res" : $(SOURCE)
	$(RSC) /l 0x409 /fo"$(INTDIR)\RTEvent_Serv.res" /d NDEBUG /d WIN64 /d _CRT_SECURE_NO_WARNINGS /d _CRT_SECURE_NO_DEPRECATE /d _CRT_NONSTDC_NO_DEPRECATE /i "..\..\.." /i "..\.." /i "..\..\orbsvcs" $(SOURCE)



!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.RTEvent_Serv.dep")
	@echo Using "Makefile.RTEvent_Serv.dep"
!ELSE
	@echo Warning: cannot find "Makefile.RTEvent_Serv.dep"
!ENDIF
!ENDIF

