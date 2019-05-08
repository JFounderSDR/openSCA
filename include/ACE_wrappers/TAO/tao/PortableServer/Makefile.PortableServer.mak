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
!MESSAGE NMAKE /f "Makefile.PortableServer.mak" CFG="Win64 Debug"
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
INTDIR=Debug\PortableServer\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_PortableServerd.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_VALUETYPE_OUT_INDIRECTION -DTAO_PORTABLESERVER_BUILD_DLL -f "Makefile.PortableServer.dep" "Acceptor_Filter_Factory.cpp" "Active_Object_Map.cpp" "Active_Object_Map_Entry.cpp" "Active_Policy_Strategies.cpp" "Adapter_Activator.cpp" "Collocated_Arguments_Converter.cpp" "Collocated_Object_Proxy_Broker.cpp" "Creation_Time.cpp" "Default_Acceptor_Filter.cpp" "Default_Policy_Validator.cpp" "Default_Servant_Dispatcher.cpp" "Direct_Collocation_Upcall_Wrapper.cpp" "IdAssignmentPolicy.cpp" "IdAssignmentStrategy.cpp" "IdAssignmentStrategyFactoryImpl.cpp" "IdAssignmentStrategySystem.cpp" "IdAssignmentStrategyUser.cpp" "IdUniquenessPolicy.cpp" "IdUniquenessStrategyFactoryImpl.cpp" "IdUniquenessStrategyMultiple.cpp" "IdUniquenessStrategyUnique.cpp" "IdUniquenessStrategyUniqueFactoryImpl.cpp" "ImplicitActivationPolicy.cpp" "ImplicitActivationStrategy.cpp" "ImplicitActivationStrategyExplicit.cpp" "ImplicitActivationStrategyFactoryImpl.cpp" "ImplicitActivationStrategyImplicit.cpp" "ImR_Client_Adapter.cpp" "Key_Adapters.cpp" "LifespanPolicy.cpp" "LifespanStrategy.cpp" "LifespanStrategyFactoryImpl.cpp" "LifespanStrategyPersistent.cpp" "LifespanStrategyPersistentFactoryImpl.cpp" "LifespanStrategyTransient.cpp" "LifespanStrategyTransientFactoryImpl.cpp" "Local_Servant_Base.cpp" "Network_Priority_Hook.cpp" "Non_Servant_Upcall.cpp" "Object_Adapter.cpp" "Object_Adapter_Factory.cpp" "Operation_Table.cpp" "Operation_Table_Binary_Search.cpp" "Operation_Table_Dynamic_Hash.cpp" "Operation_Table_Linear_Search.cpp" "Operation_Table_Perfect_Hash.cpp" "ORT_Adapter_Factory.cpp" "POA_Cached_Policies.cpp" "POA_Current.cpp" "POA_Current_Factory.cpp" "POA_Current_Impl.cpp" "POA_Guard.cpp" "POA_Policy_Set.cpp" "POAManager.cpp" "POAManagerFactory.cpp" "PolicyS.cpp" "PortableServer.cpp" "PortableServer_Functions.cpp" "PortableServer_WFunctions.cpp" "PS_ForwardA.cpp" "PS_ForwardC.cpp" "Regular_POA.cpp" "RequestProcessingPolicy.cpp" "RequestProcessingStrategy.cpp" "RequestProcessingStrategyAOMOnly.cpp" "RequestProcessingStrategyAOMOnlyFactoryImpl.cpp" "RequestProcessingStrategyDefaultServant.cpp" "RequestProcessingStrategyDefaultServantFI.cpp" "RequestProcessingStrategyFactoryImpl.cpp" "RequestProcessingStrategyServantActivator.cpp" "RequestProcessingStrategyServantActivatorFI.cpp" "RequestProcessingStrategyServantLocator.cpp" "RequestProcessingStrategyServantLocatorFI.cpp" "RequestProcessingStrategyServantManager.cpp" "Root_POA.cpp" "Servant_Base.cpp" "Servant_Dispatcher.cpp" "Servant_Upcall.cpp" "ServantRetentionPolicy.cpp" "ServantRetentionStrategyFactoryImpl.cpp" "ServantRetentionStrategyNonRetain.cpp" "ServantRetentionStrategyNonRetainFactoryImpl.cpp" "ServantRetentionStrategyRetain.cpp" "ServantRetentionStrategyRetainFactoryImpl.cpp" "StrategyFactory.cpp" "ThreadPolicy.cpp" "ThreadStrategy.cpp" "ThreadStrategyFactoryImpl.cpp" "ThreadStrategyORBControl.cpp" "ThreadStrategySingle.cpp" "ThreadStrategySingleFactoryImpl.cpp" "Upcall_Command.cpp" "Upcall_Wrapper.cpp" "ForwardRequestC.cpp" "AdapterActivatorC.cpp" "IdAssignmentPolicyC.cpp" "IdUniquenessPolicyC.cpp" "ImplicitActivationPolicyC.cpp" "LifespanPolicyC.cpp" "RequestProcessingPolicyC.cpp" "ServantActivatorC.cpp" "ServantLocatorC.cpp" "ServantManagerC.cpp" "ServantRetentionPolicyC.cpp" "ThreadPolicyC.cpp" "POAManagerC.cpp" "POAManagerFactoryC.cpp" "POAC.cpp" "PS_CurrentC.cpp" "PortableServer_includeC.cpp" "PortableServerC.cpp" "AdapterActivatorA.cpp" "ForwardRequestA.cpp" "IdAssignmentPolicyA.cpp" "IdUniquenessPolicyA.cpp" "ImplicitActivationPolicyA.cpp" "LifespanPolicyA.cpp" "RequestProcessingPolicyA.cpp" "ServantActivatorA.cpp" "ServantLocatorA.cpp" "ServantManagerA.cpp" "ServantRetentionPolicyA.cpp" "ThreadPolicyA.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_PortableServerd.pdb"
	-@del /f/q "..\..\..\lib\TAO_PortableServerd.dll"
	-@del /f/q "$(OUTDIR)\TAO_PortableServerd.lib"
	-@del /f/q "$(OUTDIR)\TAO_PortableServerd.exp"
	-@del /f/q "$(OUTDIR)\TAO_PortableServerd.ilk"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\PortableServer\$(NULL)" mkdir "Debug\PortableServer"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_VALUETYPE_OUT_INDIRECTION /D TAO_PORTABLESERVER_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\..\lib\TAO_PortableServerd.pdb" /machine:IA64 /out:"..\..\..\lib\TAO_PortableServerd.dll" /implib:"$(OUTDIR)\TAO_PortableServerd.lib"
LINK32_OBJS= \
	"$(INTDIR)\TAO_PortableServer.res" \
	"$(INTDIR)\Acceptor_Filter_Factory.obj" \
	"$(INTDIR)\Active_Object_Map.obj" \
	"$(INTDIR)\Active_Object_Map_Entry.obj" \
	"$(INTDIR)\Active_Policy_Strategies.obj" \
	"$(INTDIR)\Adapter_Activator.obj" \
	"$(INTDIR)\Collocated_Arguments_Converter.obj" \
	"$(INTDIR)\Collocated_Object_Proxy_Broker.obj" \
	"$(INTDIR)\Creation_Time.obj" \
	"$(INTDIR)\Default_Acceptor_Filter.obj" \
	"$(INTDIR)\Default_Policy_Validator.obj" \
	"$(INTDIR)\Default_Servant_Dispatcher.obj" \
	"$(INTDIR)\Direct_Collocation_Upcall_Wrapper.obj" \
	"$(INTDIR)\IdAssignmentPolicy.obj" \
	"$(INTDIR)\IdAssignmentStrategy.obj" \
	"$(INTDIR)\IdAssignmentStrategyFactoryImpl.obj" \
	"$(INTDIR)\IdAssignmentStrategySystem.obj" \
	"$(INTDIR)\IdAssignmentStrategyUser.obj" \
	"$(INTDIR)\IdUniquenessPolicy.obj" \
	"$(INTDIR)\IdUniquenessStrategyFactoryImpl.obj" \
	"$(INTDIR)\IdUniquenessStrategyMultiple.obj" \
	"$(INTDIR)\IdUniquenessStrategyUnique.obj" \
	"$(INTDIR)\IdUniquenessStrategyUniqueFactoryImpl.obj" \
	"$(INTDIR)\ImplicitActivationPolicy.obj" \
	"$(INTDIR)\ImplicitActivationStrategy.obj" \
	"$(INTDIR)\ImplicitActivationStrategyExplicit.obj" \
	"$(INTDIR)\ImplicitActivationStrategyFactoryImpl.obj" \
	"$(INTDIR)\ImplicitActivationStrategyImplicit.obj" \
	"$(INTDIR)\ImR_Client_Adapter.obj" \
	"$(INTDIR)\Key_Adapters.obj" \
	"$(INTDIR)\LifespanPolicy.obj" \
	"$(INTDIR)\LifespanStrategy.obj" \
	"$(INTDIR)\LifespanStrategyFactoryImpl.obj" \
	"$(INTDIR)\LifespanStrategyPersistent.obj" \
	"$(INTDIR)\LifespanStrategyPersistentFactoryImpl.obj" \
	"$(INTDIR)\LifespanStrategyTransient.obj" \
	"$(INTDIR)\LifespanStrategyTransientFactoryImpl.obj" \
	"$(INTDIR)\Local_Servant_Base.obj" \
	"$(INTDIR)\Network_Priority_Hook.obj" \
	"$(INTDIR)\Non_Servant_Upcall.obj" \
	"$(INTDIR)\Object_Adapter.obj" \
	"$(INTDIR)\Object_Adapter_Factory.obj" \
	"$(INTDIR)\Operation_Table.obj" \
	"$(INTDIR)\Operation_Table_Binary_Search.obj" \
	"$(INTDIR)\Operation_Table_Dynamic_Hash.obj" \
	"$(INTDIR)\Operation_Table_Linear_Search.obj" \
	"$(INTDIR)\Operation_Table_Perfect_Hash.obj" \
	"$(INTDIR)\ORT_Adapter_Factory.obj" \
	"$(INTDIR)\POA_Cached_Policies.obj" \
	"$(INTDIR)\POA_Current.obj" \
	"$(INTDIR)\POA_Current_Factory.obj" \
	"$(INTDIR)\POA_Current_Impl.obj" \
	"$(INTDIR)\POA_Guard.obj" \
	"$(INTDIR)\POA_Policy_Set.obj" \
	"$(INTDIR)\POAManager.obj" \
	"$(INTDIR)\POAManagerFactory.obj" \
	"$(INTDIR)\PolicyS.obj" \
	"$(INTDIR)\PortableServer.obj" \
	"$(INTDIR)\PortableServer_Functions.obj" \
	"$(INTDIR)\PortableServer_WFunctions.obj" \
	"$(INTDIR)\PS_ForwardA.obj" \
	"$(INTDIR)\PS_ForwardC.obj" \
	"$(INTDIR)\Regular_POA.obj" \
	"$(INTDIR)\RequestProcessingPolicy.obj" \
	"$(INTDIR)\RequestProcessingStrategy.obj" \
	"$(INTDIR)\RequestProcessingStrategyAOMOnly.obj" \
	"$(INTDIR)\RequestProcessingStrategyAOMOnlyFactoryImpl.obj" \
	"$(INTDIR)\RequestProcessingStrategyDefaultServant.obj" \
	"$(INTDIR)\RequestProcessingStrategyDefaultServantFI.obj" \
	"$(INTDIR)\RequestProcessingStrategyFactoryImpl.obj" \
	"$(INTDIR)\RequestProcessingStrategyServantActivator.obj" \
	"$(INTDIR)\RequestProcessingStrategyServantActivatorFI.obj" \
	"$(INTDIR)\RequestProcessingStrategyServantLocator.obj" \
	"$(INTDIR)\RequestProcessingStrategyServantLocatorFI.obj" \
	"$(INTDIR)\RequestProcessingStrategyServantManager.obj" \
	"$(INTDIR)\Root_POA.obj" \
	"$(INTDIR)\Servant_Base.obj" \
	"$(INTDIR)\Servant_Dispatcher.obj" \
	"$(INTDIR)\Servant_Upcall.obj" \
	"$(INTDIR)\ServantRetentionPolicy.obj" \
	"$(INTDIR)\ServantRetentionStrategyFactoryImpl.obj" \
	"$(INTDIR)\ServantRetentionStrategyNonRetain.obj" \
	"$(INTDIR)\ServantRetentionStrategyNonRetainFactoryImpl.obj" \
	"$(INTDIR)\ServantRetentionStrategyRetain.obj" \
	"$(INTDIR)\ServantRetentionStrategyRetainFactoryImpl.obj" \
	"$(INTDIR)\StrategyFactory.obj" \
	"$(INTDIR)\ThreadPolicy.obj" \
	"$(INTDIR)\ThreadStrategy.obj" \
	"$(INTDIR)\ThreadStrategyFactoryImpl.obj" \
	"$(INTDIR)\ThreadStrategyORBControl.obj" \
	"$(INTDIR)\ThreadStrategySingle.obj" \
	"$(INTDIR)\ThreadStrategySingleFactoryImpl.obj" \
	"$(INTDIR)\Upcall_Command.obj" \
	"$(INTDIR)\Upcall_Wrapper.obj" \
	"$(INTDIR)\ForwardRequestC.obj" \
	"$(INTDIR)\AdapterActivatorC.obj" \
	"$(INTDIR)\IdAssignmentPolicyC.obj" \
	"$(INTDIR)\IdUniquenessPolicyC.obj" \
	"$(INTDIR)\ImplicitActivationPolicyC.obj" \
	"$(INTDIR)\LifespanPolicyC.obj" \
	"$(INTDIR)\RequestProcessingPolicyC.obj" \
	"$(INTDIR)\ServantActivatorC.obj" \
	"$(INTDIR)\ServantLocatorC.obj" \
	"$(INTDIR)\ServantManagerC.obj" \
	"$(INTDIR)\ServantRetentionPolicyC.obj" \
	"$(INTDIR)\ThreadPolicyC.obj" \
	"$(INTDIR)\POAManagerC.obj" \
	"$(INTDIR)\POAManagerFactoryC.obj" \
	"$(INTDIR)\POAC.obj" \
	"$(INTDIR)\PS_CurrentC.obj" \
	"$(INTDIR)\PortableServer_includeC.obj" \
	"$(INTDIR)\PortableServerC.obj" \
	"$(INTDIR)\AdapterActivatorA.obj" \
	"$(INTDIR)\ForwardRequestA.obj" \
	"$(INTDIR)\IdAssignmentPolicyA.obj" \
	"$(INTDIR)\IdUniquenessPolicyA.obj" \
	"$(INTDIR)\ImplicitActivationPolicyA.obj" \
	"$(INTDIR)\LifespanPolicyA.obj" \
	"$(INTDIR)\RequestProcessingPolicyA.obj" \
	"$(INTDIR)\ServantActivatorA.obj" \
	"$(INTDIR)\ServantLocatorA.obj" \
	"$(INTDIR)\ServantManagerA.obj" \
	"$(INTDIR)\ServantRetentionPolicyA.obj" \
	"$(INTDIR)\ThreadPolicyA.obj"

"..\..\..\lib\TAO_PortableServerd.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_PortableServerd.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_PortableServerd.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\PortableServer\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_PortableServer.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_VALUETYPE_OUT_INDIRECTION -DTAO_PORTABLESERVER_BUILD_DLL -f "Makefile.PortableServer.dep" "Acceptor_Filter_Factory.cpp" "Active_Object_Map.cpp" "Active_Object_Map_Entry.cpp" "Active_Policy_Strategies.cpp" "Adapter_Activator.cpp" "Collocated_Arguments_Converter.cpp" "Collocated_Object_Proxy_Broker.cpp" "Creation_Time.cpp" "Default_Acceptor_Filter.cpp" "Default_Policy_Validator.cpp" "Default_Servant_Dispatcher.cpp" "Direct_Collocation_Upcall_Wrapper.cpp" "IdAssignmentPolicy.cpp" "IdAssignmentStrategy.cpp" "IdAssignmentStrategyFactoryImpl.cpp" "IdAssignmentStrategySystem.cpp" "IdAssignmentStrategyUser.cpp" "IdUniquenessPolicy.cpp" "IdUniquenessStrategyFactoryImpl.cpp" "IdUniquenessStrategyMultiple.cpp" "IdUniquenessStrategyUnique.cpp" "IdUniquenessStrategyUniqueFactoryImpl.cpp" "ImplicitActivationPolicy.cpp" "ImplicitActivationStrategy.cpp" "ImplicitActivationStrategyExplicit.cpp" "ImplicitActivationStrategyFactoryImpl.cpp" "ImplicitActivationStrategyImplicit.cpp" "ImR_Client_Adapter.cpp" "Key_Adapters.cpp" "LifespanPolicy.cpp" "LifespanStrategy.cpp" "LifespanStrategyFactoryImpl.cpp" "LifespanStrategyPersistent.cpp" "LifespanStrategyPersistentFactoryImpl.cpp" "LifespanStrategyTransient.cpp" "LifespanStrategyTransientFactoryImpl.cpp" "Local_Servant_Base.cpp" "Network_Priority_Hook.cpp" "Non_Servant_Upcall.cpp" "Object_Adapter.cpp" "Object_Adapter_Factory.cpp" "Operation_Table.cpp" "Operation_Table_Binary_Search.cpp" "Operation_Table_Dynamic_Hash.cpp" "Operation_Table_Linear_Search.cpp" "Operation_Table_Perfect_Hash.cpp" "ORT_Adapter_Factory.cpp" "POA_Cached_Policies.cpp" "POA_Current.cpp" "POA_Current_Factory.cpp" "POA_Current_Impl.cpp" "POA_Guard.cpp" "POA_Policy_Set.cpp" "POAManager.cpp" "POAManagerFactory.cpp" "PolicyS.cpp" "PortableServer.cpp" "PortableServer_Functions.cpp" "PortableServer_WFunctions.cpp" "PS_ForwardA.cpp" "PS_ForwardC.cpp" "Regular_POA.cpp" "RequestProcessingPolicy.cpp" "RequestProcessingStrategy.cpp" "RequestProcessingStrategyAOMOnly.cpp" "RequestProcessingStrategyAOMOnlyFactoryImpl.cpp" "RequestProcessingStrategyDefaultServant.cpp" "RequestProcessingStrategyDefaultServantFI.cpp" "RequestProcessingStrategyFactoryImpl.cpp" "RequestProcessingStrategyServantActivator.cpp" "RequestProcessingStrategyServantActivatorFI.cpp" "RequestProcessingStrategyServantLocator.cpp" "RequestProcessingStrategyServantLocatorFI.cpp" "RequestProcessingStrategyServantManager.cpp" "Root_POA.cpp" "Servant_Base.cpp" "Servant_Dispatcher.cpp" "Servant_Upcall.cpp" "ServantRetentionPolicy.cpp" "ServantRetentionStrategyFactoryImpl.cpp" "ServantRetentionStrategyNonRetain.cpp" "ServantRetentionStrategyNonRetainFactoryImpl.cpp" "ServantRetentionStrategyRetain.cpp" "ServantRetentionStrategyRetainFactoryImpl.cpp" "StrategyFactory.cpp" "ThreadPolicy.cpp" "ThreadStrategy.cpp" "ThreadStrategyFactoryImpl.cpp" "ThreadStrategyORBControl.cpp" "ThreadStrategySingle.cpp" "ThreadStrategySingleFactoryImpl.cpp" "Upcall_Command.cpp" "Upcall_Wrapper.cpp" "ForwardRequestC.cpp" "AdapterActivatorC.cpp" "IdAssignmentPolicyC.cpp" "IdUniquenessPolicyC.cpp" "ImplicitActivationPolicyC.cpp" "LifespanPolicyC.cpp" "RequestProcessingPolicyC.cpp" "ServantActivatorC.cpp" "ServantLocatorC.cpp" "ServantManagerC.cpp" "ServantRetentionPolicyC.cpp" "ThreadPolicyC.cpp" "POAManagerC.cpp" "POAManagerFactoryC.cpp" "POAC.cpp" "PS_CurrentC.cpp" "PortableServer_includeC.cpp" "PortableServerC.cpp" "AdapterActivatorA.cpp" "ForwardRequestA.cpp" "IdAssignmentPolicyA.cpp" "IdUniquenessPolicyA.cpp" "ImplicitActivationPolicyA.cpp" "LifespanPolicyA.cpp" "RequestProcessingPolicyA.cpp" "ServantActivatorA.cpp" "ServantLocatorA.cpp" "ServantManagerA.cpp" "ServantRetentionPolicyA.cpp" "ThreadPolicyA.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\TAO_PortableServer.dll"
	-@del /f/q "$(OUTDIR)\TAO_PortableServer.lib"
	-@del /f/q "$(OUTDIR)\TAO_PortableServer.exp"
	-@del /f/q "$(OUTDIR)\TAO_PortableServer.ilk"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\PortableServer\$(NULL)" mkdir "Release\PortableServer"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_VALUETYPE_OUT_INDIRECTION /D TAO_PORTABLESERVER_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\..\lib\TAO_PortableServer.dll" /implib:"$(OUTDIR)\TAO_PortableServer.lib"
LINK32_OBJS= \
	"$(INTDIR)\TAO_PortableServer.res" \
	"$(INTDIR)\Acceptor_Filter_Factory.obj" \
	"$(INTDIR)\Active_Object_Map.obj" \
	"$(INTDIR)\Active_Object_Map_Entry.obj" \
	"$(INTDIR)\Active_Policy_Strategies.obj" \
	"$(INTDIR)\Adapter_Activator.obj" \
	"$(INTDIR)\Collocated_Arguments_Converter.obj" \
	"$(INTDIR)\Collocated_Object_Proxy_Broker.obj" \
	"$(INTDIR)\Creation_Time.obj" \
	"$(INTDIR)\Default_Acceptor_Filter.obj" \
	"$(INTDIR)\Default_Policy_Validator.obj" \
	"$(INTDIR)\Default_Servant_Dispatcher.obj" \
	"$(INTDIR)\Direct_Collocation_Upcall_Wrapper.obj" \
	"$(INTDIR)\IdAssignmentPolicy.obj" \
	"$(INTDIR)\IdAssignmentStrategy.obj" \
	"$(INTDIR)\IdAssignmentStrategyFactoryImpl.obj" \
	"$(INTDIR)\IdAssignmentStrategySystem.obj" \
	"$(INTDIR)\IdAssignmentStrategyUser.obj" \
	"$(INTDIR)\IdUniquenessPolicy.obj" \
	"$(INTDIR)\IdUniquenessStrategyFactoryImpl.obj" \
	"$(INTDIR)\IdUniquenessStrategyMultiple.obj" \
	"$(INTDIR)\IdUniquenessStrategyUnique.obj" \
	"$(INTDIR)\IdUniquenessStrategyUniqueFactoryImpl.obj" \
	"$(INTDIR)\ImplicitActivationPolicy.obj" \
	"$(INTDIR)\ImplicitActivationStrategy.obj" \
	"$(INTDIR)\ImplicitActivationStrategyExplicit.obj" \
	"$(INTDIR)\ImplicitActivationStrategyFactoryImpl.obj" \
	"$(INTDIR)\ImplicitActivationStrategyImplicit.obj" \
	"$(INTDIR)\ImR_Client_Adapter.obj" \
	"$(INTDIR)\Key_Adapters.obj" \
	"$(INTDIR)\LifespanPolicy.obj" \
	"$(INTDIR)\LifespanStrategy.obj" \
	"$(INTDIR)\LifespanStrategyFactoryImpl.obj" \
	"$(INTDIR)\LifespanStrategyPersistent.obj" \
	"$(INTDIR)\LifespanStrategyPersistentFactoryImpl.obj" \
	"$(INTDIR)\LifespanStrategyTransient.obj" \
	"$(INTDIR)\LifespanStrategyTransientFactoryImpl.obj" \
	"$(INTDIR)\Local_Servant_Base.obj" \
	"$(INTDIR)\Network_Priority_Hook.obj" \
	"$(INTDIR)\Non_Servant_Upcall.obj" \
	"$(INTDIR)\Object_Adapter.obj" \
	"$(INTDIR)\Object_Adapter_Factory.obj" \
	"$(INTDIR)\Operation_Table.obj" \
	"$(INTDIR)\Operation_Table_Binary_Search.obj" \
	"$(INTDIR)\Operation_Table_Dynamic_Hash.obj" \
	"$(INTDIR)\Operation_Table_Linear_Search.obj" \
	"$(INTDIR)\Operation_Table_Perfect_Hash.obj" \
	"$(INTDIR)\ORT_Adapter_Factory.obj" \
	"$(INTDIR)\POA_Cached_Policies.obj" \
	"$(INTDIR)\POA_Current.obj" \
	"$(INTDIR)\POA_Current_Factory.obj" \
	"$(INTDIR)\POA_Current_Impl.obj" \
	"$(INTDIR)\POA_Guard.obj" \
	"$(INTDIR)\POA_Policy_Set.obj" \
	"$(INTDIR)\POAManager.obj" \
	"$(INTDIR)\POAManagerFactory.obj" \
	"$(INTDIR)\PolicyS.obj" \
	"$(INTDIR)\PortableServer.obj" \
	"$(INTDIR)\PortableServer_Functions.obj" \
	"$(INTDIR)\PortableServer_WFunctions.obj" \
	"$(INTDIR)\PS_ForwardA.obj" \
	"$(INTDIR)\PS_ForwardC.obj" \
	"$(INTDIR)\Regular_POA.obj" \
	"$(INTDIR)\RequestProcessingPolicy.obj" \
	"$(INTDIR)\RequestProcessingStrategy.obj" \
	"$(INTDIR)\RequestProcessingStrategyAOMOnly.obj" \
	"$(INTDIR)\RequestProcessingStrategyAOMOnlyFactoryImpl.obj" \
	"$(INTDIR)\RequestProcessingStrategyDefaultServant.obj" \
	"$(INTDIR)\RequestProcessingStrategyDefaultServantFI.obj" \
	"$(INTDIR)\RequestProcessingStrategyFactoryImpl.obj" \
	"$(INTDIR)\RequestProcessingStrategyServantActivator.obj" \
	"$(INTDIR)\RequestProcessingStrategyServantActivatorFI.obj" \
	"$(INTDIR)\RequestProcessingStrategyServantLocator.obj" \
	"$(INTDIR)\RequestProcessingStrategyServantLocatorFI.obj" \
	"$(INTDIR)\RequestProcessingStrategyServantManager.obj" \
	"$(INTDIR)\Root_POA.obj" \
	"$(INTDIR)\Servant_Base.obj" \
	"$(INTDIR)\Servant_Dispatcher.obj" \
	"$(INTDIR)\Servant_Upcall.obj" \
	"$(INTDIR)\ServantRetentionPolicy.obj" \
	"$(INTDIR)\ServantRetentionStrategyFactoryImpl.obj" \
	"$(INTDIR)\ServantRetentionStrategyNonRetain.obj" \
	"$(INTDIR)\ServantRetentionStrategyNonRetainFactoryImpl.obj" \
	"$(INTDIR)\ServantRetentionStrategyRetain.obj" \
	"$(INTDIR)\ServantRetentionStrategyRetainFactoryImpl.obj" \
	"$(INTDIR)\StrategyFactory.obj" \
	"$(INTDIR)\ThreadPolicy.obj" \
	"$(INTDIR)\ThreadStrategy.obj" \
	"$(INTDIR)\ThreadStrategyFactoryImpl.obj" \
	"$(INTDIR)\ThreadStrategyORBControl.obj" \
	"$(INTDIR)\ThreadStrategySingle.obj" \
	"$(INTDIR)\ThreadStrategySingleFactoryImpl.obj" \
	"$(INTDIR)\Upcall_Command.obj" \
	"$(INTDIR)\Upcall_Wrapper.obj" \
	"$(INTDIR)\ForwardRequestC.obj" \
	"$(INTDIR)\AdapterActivatorC.obj" \
	"$(INTDIR)\IdAssignmentPolicyC.obj" \
	"$(INTDIR)\IdUniquenessPolicyC.obj" \
	"$(INTDIR)\ImplicitActivationPolicyC.obj" \
	"$(INTDIR)\LifespanPolicyC.obj" \
	"$(INTDIR)\RequestProcessingPolicyC.obj" \
	"$(INTDIR)\ServantActivatorC.obj" \
	"$(INTDIR)\ServantLocatorC.obj" \
	"$(INTDIR)\ServantManagerC.obj" \
	"$(INTDIR)\ServantRetentionPolicyC.obj" \
	"$(INTDIR)\ThreadPolicyC.obj" \
	"$(INTDIR)\POAManagerC.obj" \
	"$(INTDIR)\POAManagerFactoryC.obj" \
	"$(INTDIR)\POAC.obj" \
	"$(INTDIR)\PS_CurrentC.obj" \
	"$(INTDIR)\PortableServer_includeC.obj" \
	"$(INTDIR)\PortableServerC.obj" \
	"$(INTDIR)\AdapterActivatorA.obj" \
	"$(INTDIR)\ForwardRequestA.obj" \
	"$(INTDIR)\IdAssignmentPolicyA.obj" \
	"$(INTDIR)\IdUniquenessPolicyA.obj" \
	"$(INTDIR)\ImplicitActivationPolicyA.obj" \
	"$(INTDIR)\LifespanPolicyA.obj" \
	"$(INTDIR)\RequestProcessingPolicyA.obj" \
	"$(INTDIR)\ServantActivatorA.obj" \
	"$(INTDIR)\ServantLocatorA.obj" \
	"$(INTDIR)\ServantManagerA.obj" \
	"$(INTDIR)\ServantRetentionPolicyA.obj" \
	"$(INTDIR)\ThreadPolicyA.obj"

"..\..\..\lib\TAO_PortableServer.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_PortableServer.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_PortableServer.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\PortableServer\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_PortableServersd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_VALUETYPE_OUT_INDIRECTION -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.PortableServer.dep" "Acceptor_Filter_Factory.cpp" "Active_Object_Map.cpp" "Active_Object_Map_Entry.cpp" "Active_Policy_Strategies.cpp" "Adapter_Activator.cpp" "Collocated_Arguments_Converter.cpp" "Collocated_Object_Proxy_Broker.cpp" "Creation_Time.cpp" "Default_Acceptor_Filter.cpp" "Default_Policy_Validator.cpp" "Default_Servant_Dispatcher.cpp" "Direct_Collocation_Upcall_Wrapper.cpp" "IdAssignmentPolicy.cpp" "IdAssignmentStrategy.cpp" "IdAssignmentStrategyFactoryImpl.cpp" "IdAssignmentStrategySystem.cpp" "IdAssignmentStrategyUser.cpp" "IdUniquenessPolicy.cpp" "IdUniquenessStrategyFactoryImpl.cpp" "IdUniquenessStrategyMultiple.cpp" "IdUniquenessStrategyUnique.cpp" "IdUniquenessStrategyUniqueFactoryImpl.cpp" "ImplicitActivationPolicy.cpp" "ImplicitActivationStrategy.cpp" "ImplicitActivationStrategyExplicit.cpp" "ImplicitActivationStrategyFactoryImpl.cpp" "ImplicitActivationStrategyImplicit.cpp" "ImR_Client_Adapter.cpp" "Key_Adapters.cpp" "LifespanPolicy.cpp" "LifespanStrategy.cpp" "LifespanStrategyFactoryImpl.cpp" "LifespanStrategyPersistent.cpp" "LifespanStrategyPersistentFactoryImpl.cpp" "LifespanStrategyTransient.cpp" "LifespanStrategyTransientFactoryImpl.cpp" "Local_Servant_Base.cpp" "Network_Priority_Hook.cpp" "Non_Servant_Upcall.cpp" "Object_Adapter.cpp" "Object_Adapter_Factory.cpp" "Operation_Table.cpp" "Operation_Table_Binary_Search.cpp" "Operation_Table_Dynamic_Hash.cpp" "Operation_Table_Linear_Search.cpp" "Operation_Table_Perfect_Hash.cpp" "ORT_Adapter_Factory.cpp" "POA_Cached_Policies.cpp" "POA_Current.cpp" "POA_Current_Factory.cpp" "POA_Current_Impl.cpp" "POA_Guard.cpp" "POA_Policy_Set.cpp" "POAManager.cpp" "POAManagerFactory.cpp" "PolicyS.cpp" "PortableServer.cpp" "PortableServer_Functions.cpp" "PortableServer_WFunctions.cpp" "PS_ForwardA.cpp" "PS_ForwardC.cpp" "Regular_POA.cpp" "RequestProcessingPolicy.cpp" "RequestProcessingStrategy.cpp" "RequestProcessingStrategyAOMOnly.cpp" "RequestProcessingStrategyAOMOnlyFactoryImpl.cpp" "RequestProcessingStrategyDefaultServant.cpp" "RequestProcessingStrategyDefaultServantFI.cpp" "RequestProcessingStrategyFactoryImpl.cpp" "RequestProcessingStrategyServantActivator.cpp" "RequestProcessingStrategyServantActivatorFI.cpp" "RequestProcessingStrategyServantLocator.cpp" "RequestProcessingStrategyServantLocatorFI.cpp" "RequestProcessingStrategyServantManager.cpp" "Root_POA.cpp" "Servant_Base.cpp" "Servant_Dispatcher.cpp" "Servant_Upcall.cpp" "ServantRetentionPolicy.cpp" "ServantRetentionStrategyFactoryImpl.cpp" "ServantRetentionStrategyNonRetain.cpp" "ServantRetentionStrategyNonRetainFactoryImpl.cpp" "ServantRetentionStrategyRetain.cpp" "ServantRetentionStrategyRetainFactoryImpl.cpp" "StrategyFactory.cpp" "ThreadPolicy.cpp" "ThreadStrategy.cpp" "ThreadStrategyFactoryImpl.cpp" "ThreadStrategyORBControl.cpp" "ThreadStrategySingle.cpp" "ThreadStrategySingleFactoryImpl.cpp" "Upcall_Command.cpp" "Upcall_Wrapper.cpp" "ForwardRequestC.cpp" "AdapterActivatorC.cpp" "IdAssignmentPolicyC.cpp" "IdUniquenessPolicyC.cpp" "ImplicitActivationPolicyC.cpp" "LifespanPolicyC.cpp" "RequestProcessingPolicyC.cpp" "ServantActivatorC.cpp" "ServantLocatorC.cpp" "ServantManagerC.cpp" "ServantRetentionPolicyC.cpp" "ThreadPolicyC.cpp" "POAManagerC.cpp" "POAManagerFactoryC.cpp" "POAC.cpp" "PS_CurrentC.cpp" "PortableServer_includeC.cpp" "PortableServerC.cpp" "AdapterActivatorA.cpp" "ForwardRequestA.cpp" "IdAssignmentPolicyA.cpp" "IdUniquenessPolicyA.cpp" "ImplicitActivationPolicyA.cpp" "LifespanPolicyA.cpp" "RequestProcessingPolicyA.cpp" "ServantActivatorA.cpp" "ServantLocatorA.cpp" "ServantManagerA.cpp" "ServantRetentionPolicyA.cpp" "ThreadPolicyA.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_PortableServersd.lib"
	-@del /f/q "$(OUTDIR)\TAO_PortableServersd.exp"
	-@del /f/q "$(OUTDIR)\TAO_PortableServersd.ilk"
	-@del /f/q "..\..\..\lib\TAO_PortableServersd.pdb"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\PortableServer\$(NULL)" mkdir "Static_Debug\PortableServer"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\TAO_PortableServersd.pdb" /I "..\..\.." /I "..\.." /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_VALUETYPE_OUT_INDIRECTION /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_PortableServersd.lib"
LINK32_OBJS= \
	"$(INTDIR)\Acceptor_Filter_Factory.obj" \
	"$(INTDIR)\Active_Object_Map.obj" \
	"$(INTDIR)\Active_Object_Map_Entry.obj" \
	"$(INTDIR)\Active_Policy_Strategies.obj" \
	"$(INTDIR)\Adapter_Activator.obj" \
	"$(INTDIR)\Collocated_Arguments_Converter.obj" \
	"$(INTDIR)\Collocated_Object_Proxy_Broker.obj" \
	"$(INTDIR)\Creation_Time.obj" \
	"$(INTDIR)\Default_Acceptor_Filter.obj" \
	"$(INTDIR)\Default_Policy_Validator.obj" \
	"$(INTDIR)\Default_Servant_Dispatcher.obj" \
	"$(INTDIR)\Direct_Collocation_Upcall_Wrapper.obj" \
	"$(INTDIR)\IdAssignmentPolicy.obj" \
	"$(INTDIR)\IdAssignmentStrategy.obj" \
	"$(INTDIR)\IdAssignmentStrategyFactoryImpl.obj" \
	"$(INTDIR)\IdAssignmentStrategySystem.obj" \
	"$(INTDIR)\IdAssignmentStrategyUser.obj" \
	"$(INTDIR)\IdUniquenessPolicy.obj" \
	"$(INTDIR)\IdUniquenessStrategyFactoryImpl.obj" \
	"$(INTDIR)\IdUniquenessStrategyMultiple.obj" \
	"$(INTDIR)\IdUniquenessStrategyUnique.obj" \
	"$(INTDIR)\IdUniquenessStrategyUniqueFactoryImpl.obj" \
	"$(INTDIR)\ImplicitActivationPolicy.obj" \
	"$(INTDIR)\ImplicitActivationStrategy.obj" \
	"$(INTDIR)\ImplicitActivationStrategyExplicit.obj" \
	"$(INTDIR)\ImplicitActivationStrategyFactoryImpl.obj" \
	"$(INTDIR)\ImplicitActivationStrategyImplicit.obj" \
	"$(INTDIR)\ImR_Client_Adapter.obj" \
	"$(INTDIR)\Key_Adapters.obj" \
	"$(INTDIR)\LifespanPolicy.obj" \
	"$(INTDIR)\LifespanStrategy.obj" \
	"$(INTDIR)\LifespanStrategyFactoryImpl.obj" \
	"$(INTDIR)\LifespanStrategyPersistent.obj" \
	"$(INTDIR)\LifespanStrategyPersistentFactoryImpl.obj" \
	"$(INTDIR)\LifespanStrategyTransient.obj" \
	"$(INTDIR)\LifespanStrategyTransientFactoryImpl.obj" \
	"$(INTDIR)\Local_Servant_Base.obj" \
	"$(INTDIR)\Network_Priority_Hook.obj" \
	"$(INTDIR)\Non_Servant_Upcall.obj" \
	"$(INTDIR)\Object_Adapter.obj" \
	"$(INTDIR)\Object_Adapter_Factory.obj" \
	"$(INTDIR)\Operation_Table.obj" \
	"$(INTDIR)\Operation_Table_Binary_Search.obj" \
	"$(INTDIR)\Operation_Table_Dynamic_Hash.obj" \
	"$(INTDIR)\Operation_Table_Linear_Search.obj" \
	"$(INTDIR)\Operation_Table_Perfect_Hash.obj" \
	"$(INTDIR)\ORT_Adapter_Factory.obj" \
	"$(INTDIR)\POA_Cached_Policies.obj" \
	"$(INTDIR)\POA_Current.obj" \
	"$(INTDIR)\POA_Current_Factory.obj" \
	"$(INTDIR)\POA_Current_Impl.obj" \
	"$(INTDIR)\POA_Guard.obj" \
	"$(INTDIR)\POA_Policy_Set.obj" \
	"$(INTDIR)\POAManager.obj" \
	"$(INTDIR)\POAManagerFactory.obj" \
	"$(INTDIR)\PolicyS.obj" \
	"$(INTDIR)\PortableServer.obj" \
	"$(INTDIR)\PortableServer_Functions.obj" \
	"$(INTDIR)\PortableServer_WFunctions.obj" \
	"$(INTDIR)\PS_ForwardA.obj" \
	"$(INTDIR)\PS_ForwardC.obj" \
	"$(INTDIR)\Regular_POA.obj" \
	"$(INTDIR)\RequestProcessingPolicy.obj" \
	"$(INTDIR)\RequestProcessingStrategy.obj" \
	"$(INTDIR)\RequestProcessingStrategyAOMOnly.obj" \
	"$(INTDIR)\RequestProcessingStrategyAOMOnlyFactoryImpl.obj" \
	"$(INTDIR)\RequestProcessingStrategyDefaultServant.obj" \
	"$(INTDIR)\RequestProcessingStrategyDefaultServantFI.obj" \
	"$(INTDIR)\RequestProcessingStrategyFactoryImpl.obj" \
	"$(INTDIR)\RequestProcessingStrategyServantActivator.obj" \
	"$(INTDIR)\RequestProcessingStrategyServantActivatorFI.obj" \
	"$(INTDIR)\RequestProcessingStrategyServantLocator.obj" \
	"$(INTDIR)\RequestProcessingStrategyServantLocatorFI.obj" \
	"$(INTDIR)\RequestProcessingStrategyServantManager.obj" \
	"$(INTDIR)\Root_POA.obj" \
	"$(INTDIR)\Servant_Base.obj" \
	"$(INTDIR)\Servant_Dispatcher.obj" \
	"$(INTDIR)\Servant_Upcall.obj" \
	"$(INTDIR)\ServantRetentionPolicy.obj" \
	"$(INTDIR)\ServantRetentionStrategyFactoryImpl.obj" \
	"$(INTDIR)\ServantRetentionStrategyNonRetain.obj" \
	"$(INTDIR)\ServantRetentionStrategyNonRetainFactoryImpl.obj" \
	"$(INTDIR)\ServantRetentionStrategyRetain.obj" \
	"$(INTDIR)\ServantRetentionStrategyRetainFactoryImpl.obj" \
	"$(INTDIR)\StrategyFactory.obj" \
	"$(INTDIR)\ThreadPolicy.obj" \
	"$(INTDIR)\ThreadStrategy.obj" \
	"$(INTDIR)\ThreadStrategyFactoryImpl.obj" \
	"$(INTDIR)\ThreadStrategyORBControl.obj" \
	"$(INTDIR)\ThreadStrategySingle.obj" \
	"$(INTDIR)\ThreadStrategySingleFactoryImpl.obj" \
	"$(INTDIR)\Upcall_Command.obj" \
	"$(INTDIR)\Upcall_Wrapper.obj" \
	"$(INTDIR)\ForwardRequestC.obj" \
	"$(INTDIR)\AdapterActivatorC.obj" \
	"$(INTDIR)\IdAssignmentPolicyC.obj" \
	"$(INTDIR)\IdUniquenessPolicyC.obj" \
	"$(INTDIR)\ImplicitActivationPolicyC.obj" \
	"$(INTDIR)\LifespanPolicyC.obj" \
	"$(INTDIR)\RequestProcessingPolicyC.obj" \
	"$(INTDIR)\ServantActivatorC.obj" \
	"$(INTDIR)\ServantLocatorC.obj" \
	"$(INTDIR)\ServantManagerC.obj" \
	"$(INTDIR)\ServantRetentionPolicyC.obj" \
	"$(INTDIR)\ThreadPolicyC.obj" \
	"$(INTDIR)\POAManagerC.obj" \
	"$(INTDIR)\POAManagerFactoryC.obj" \
	"$(INTDIR)\POAC.obj" \
	"$(INTDIR)\PS_CurrentC.obj" \
	"$(INTDIR)\PortableServer_includeC.obj" \
	"$(INTDIR)\PortableServerC.obj" \
	"$(INTDIR)\AdapterActivatorA.obj" \
	"$(INTDIR)\ForwardRequestA.obj" \
	"$(INTDIR)\IdAssignmentPolicyA.obj" \
	"$(INTDIR)\IdUniquenessPolicyA.obj" \
	"$(INTDIR)\ImplicitActivationPolicyA.obj" \
	"$(INTDIR)\LifespanPolicyA.obj" \
	"$(INTDIR)\RequestProcessingPolicyA.obj" \
	"$(INTDIR)\ServantActivatorA.obj" \
	"$(INTDIR)\ServantLocatorA.obj" \
	"$(INTDIR)\ServantManagerA.obj" \
	"$(INTDIR)\ServantRetentionPolicyA.obj" \
	"$(INTDIR)\ThreadPolicyA.obj"

"$(OUTDIR)\TAO_PortableServersd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_PortableServersd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_PortableServersd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\PortableServer\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_PortableServers.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_VALUETYPE_OUT_INDIRECTION -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.PortableServer.dep" "Acceptor_Filter_Factory.cpp" "Active_Object_Map.cpp" "Active_Object_Map_Entry.cpp" "Active_Policy_Strategies.cpp" "Adapter_Activator.cpp" "Collocated_Arguments_Converter.cpp" "Collocated_Object_Proxy_Broker.cpp" "Creation_Time.cpp" "Default_Acceptor_Filter.cpp" "Default_Policy_Validator.cpp" "Default_Servant_Dispatcher.cpp" "Direct_Collocation_Upcall_Wrapper.cpp" "IdAssignmentPolicy.cpp" "IdAssignmentStrategy.cpp" "IdAssignmentStrategyFactoryImpl.cpp" "IdAssignmentStrategySystem.cpp" "IdAssignmentStrategyUser.cpp" "IdUniquenessPolicy.cpp" "IdUniquenessStrategyFactoryImpl.cpp" "IdUniquenessStrategyMultiple.cpp" "IdUniquenessStrategyUnique.cpp" "IdUniquenessStrategyUniqueFactoryImpl.cpp" "ImplicitActivationPolicy.cpp" "ImplicitActivationStrategy.cpp" "ImplicitActivationStrategyExplicit.cpp" "ImplicitActivationStrategyFactoryImpl.cpp" "ImplicitActivationStrategyImplicit.cpp" "ImR_Client_Adapter.cpp" "Key_Adapters.cpp" "LifespanPolicy.cpp" "LifespanStrategy.cpp" "LifespanStrategyFactoryImpl.cpp" "LifespanStrategyPersistent.cpp" "LifespanStrategyPersistentFactoryImpl.cpp" "LifespanStrategyTransient.cpp" "LifespanStrategyTransientFactoryImpl.cpp" "Local_Servant_Base.cpp" "Network_Priority_Hook.cpp" "Non_Servant_Upcall.cpp" "Object_Adapter.cpp" "Object_Adapter_Factory.cpp" "Operation_Table.cpp" "Operation_Table_Binary_Search.cpp" "Operation_Table_Dynamic_Hash.cpp" "Operation_Table_Linear_Search.cpp" "Operation_Table_Perfect_Hash.cpp" "ORT_Adapter_Factory.cpp" "POA_Cached_Policies.cpp" "POA_Current.cpp" "POA_Current_Factory.cpp" "POA_Current_Impl.cpp" "POA_Guard.cpp" "POA_Policy_Set.cpp" "POAManager.cpp" "POAManagerFactory.cpp" "PolicyS.cpp" "PortableServer.cpp" "PortableServer_Functions.cpp" "PortableServer_WFunctions.cpp" "PS_ForwardA.cpp" "PS_ForwardC.cpp" "Regular_POA.cpp" "RequestProcessingPolicy.cpp" "RequestProcessingStrategy.cpp" "RequestProcessingStrategyAOMOnly.cpp" "RequestProcessingStrategyAOMOnlyFactoryImpl.cpp" "RequestProcessingStrategyDefaultServant.cpp" "RequestProcessingStrategyDefaultServantFI.cpp" "RequestProcessingStrategyFactoryImpl.cpp" "RequestProcessingStrategyServantActivator.cpp" "RequestProcessingStrategyServantActivatorFI.cpp" "RequestProcessingStrategyServantLocator.cpp" "RequestProcessingStrategyServantLocatorFI.cpp" "RequestProcessingStrategyServantManager.cpp" "Root_POA.cpp" "Servant_Base.cpp" "Servant_Dispatcher.cpp" "Servant_Upcall.cpp" "ServantRetentionPolicy.cpp" "ServantRetentionStrategyFactoryImpl.cpp" "ServantRetentionStrategyNonRetain.cpp" "ServantRetentionStrategyNonRetainFactoryImpl.cpp" "ServantRetentionStrategyRetain.cpp" "ServantRetentionStrategyRetainFactoryImpl.cpp" "StrategyFactory.cpp" "ThreadPolicy.cpp" "ThreadStrategy.cpp" "ThreadStrategyFactoryImpl.cpp" "ThreadStrategyORBControl.cpp" "ThreadStrategySingle.cpp" "ThreadStrategySingleFactoryImpl.cpp" "Upcall_Command.cpp" "Upcall_Wrapper.cpp" "ForwardRequestC.cpp" "AdapterActivatorC.cpp" "IdAssignmentPolicyC.cpp" "IdUniquenessPolicyC.cpp" "ImplicitActivationPolicyC.cpp" "LifespanPolicyC.cpp" "RequestProcessingPolicyC.cpp" "ServantActivatorC.cpp" "ServantLocatorC.cpp" "ServantManagerC.cpp" "ServantRetentionPolicyC.cpp" "ThreadPolicyC.cpp" "POAManagerC.cpp" "POAManagerFactoryC.cpp" "POAC.cpp" "PS_CurrentC.cpp" "PortableServer_includeC.cpp" "PortableServerC.cpp" "AdapterActivatorA.cpp" "ForwardRequestA.cpp" "IdAssignmentPolicyA.cpp" "IdUniquenessPolicyA.cpp" "ImplicitActivationPolicyA.cpp" "LifespanPolicyA.cpp" "RequestProcessingPolicyA.cpp" "ServantActivatorA.cpp" "ServantLocatorA.cpp" "ServantManagerA.cpp" "ServantRetentionPolicyA.cpp" "ThreadPolicyA.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_PortableServers.lib"
	-@del /f/q "$(OUTDIR)\TAO_PortableServers.exp"
	-@del /f/q "$(OUTDIR)\TAO_PortableServers.ilk"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\PortableServer\$(NULL)" mkdir "Static_Release\PortableServer"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_VALUETYPE_OUT_INDIRECTION /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_PortableServers.lib"
LINK32_OBJS= \
	"$(INTDIR)\Acceptor_Filter_Factory.obj" \
	"$(INTDIR)\Active_Object_Map.obj" \
	"$(INTDIR)\Active_Object_Map_Entry.obj" \
	"$(INTDIR)\Active_Policy_Strategies.obj" \
	"$(INTDIR)\Adapter_Activator.obj" \
	"$(INTDIR)\Collocated_Arguments_Converter.obj" \
	"$(INTDIR)\Collocated_Object_Proxy_Broker.obj" \
	"$(INTDIR)\Creation_Time.obj" \
	"$(INTDIR)\Default_Acceptor_Filter.obj" \
	"$(INTDIR)\Default_Policy_Validator.obj" \
	"$(INTDIR)\Default_Servant_Dispatcher.obj" \
	"$(INTDIR)\Direct_Collocation_Upcall_Wrapper.obj" \
	"$(INTDIR)\IdAssignmentPolicy.obj" \
	"$(INTDIR)\IdAssignmentStrategy.obj" \
	"$(INTDIR)\IdAssignmentStrategyFactoryImpl.obj" \
	"$(INTDIR)\IdAssignmentStrategySystem.obj" \
	"$(INTDIR)\IdAssignmentStrategyUser.obj" \
	"$(INTDIR)\IdUniquenessPolicy.obj" \
	"$(INTDIR)\IdUniquenessStrategyFactoryImpl.obj" \
	"$(INTDIR)\IdUniquenessStrategyMultiple.obj" \
	"$(INTDIR)\IdUniquenessStrategyUnique.obj" \
	"$(INTDIR)\IdUniquenessStrategyUniqueFactoryImpl.obj" \
	"$(INTDIR)\ImplicitActivationPolicy.obj" \
	"$(INTDIR)\ImplicitActivationStrategy.obj" \
	"$(INTDIR)\ImplicitActivationStrategyExplicit.obj" \
	"$(INTDIR)\ImplicitActivationStrategyFactoryImpl.obj" \
	"$(INTDIR)\ImplicitActivationStrategyImplicit.obj" \
	"$(INTDIR)\ImR_Client_Adapter.obj" \
	"$(INTDIR)\Key_Adapters.obj" \
	"$(INTDIR)\LifespanPolicy.obj" \
	"$(INTDIR)\LifespanStrategy.obj" \
	"$(INTDIR)\LifespanStrategyFactoryImpl.obj" \
	"$(INTDIR)\LifespanStrategyPersistent.obj" \
	"$(INTDIR)\LifespanStrategyPersistentFactoryImpl.obj" \
	"$(INTDIR)\LifespanStrategyTransient.obj" \
	"$(INTDIR)\LifespanStrategyTransientFactoryImpl.obj" \
	"$(INTDIR)\Local_Servant_Base.obj" \
	"$(INTDIR)\Network_Priority_Hook.obj" \
	"$(INTDIR)\Non_Servant_Upcall.obj" \
	"$(INTDIR)\Object_Adapter.obj" \
	"$(INTDIR)\Object_Adapter_Factory.obj" \
	"$(INTDIR)\Operation_Table.obj" \
	"$(INTDIR)\Operation_Table_Binary_Search.obj" \
	"$(INTDIR)\Operation_Table_Dynamic_Hash.obj" \
	"$(INTDIR)\Operation_Table_Linear_Search.obj" \
	"$(INTDIR)\Operation_Table_Perfect_Hash.obj" \
	"$(INTDIR)\ORT_Adapter_Factory.obj" \
	"$(INTDIR)\POA_Cached_Policies.obj" \
	"$(INTDIR)\POA_Current.obj" \
	"$(INTDIR)\POA_Current_Factory.obj" \
	"$(INTDIR)\POA_Current_Impl.obj" \
	"$(INTDIR)\POA_Guard.obj" \
	"$(INTDIR)\POA_Policy_Set.obj" \
	"$(INTDIR)\POAManager.obj" \
	"$(INTDIR)\POAManagerFactory.obj" \
	"$(INTDIR)\PolicyS.obj" \
	"$(INTDIR)\PortableServer.obj" \
	"$(INTDIR)\PortableServer_Functions.obj" \
	"$(INTDIR)\PortableServer_WFunctions.obj" \
	"$(INTDIR)\PS_ForwardA.obj" \
	"$(INTDIR)\PS_ForwardC.obj" \
	"$(INTDIR)\Regular_POA.obj" \
	"$(INTDIR)\RequestProcessingPolicy.obj" \
	"$(INTDIR)\RequestProcessingStrategy.obj" \
	"$(INTDIR)\RequestProcessingStrategyAOMOnly.obj" \
	"$(INTDIR)\RequestProcessingStrategyAOMOnlyFactoryImpl.obj" \
	"$(INTDIR)\RequestProcessingStrategyDefaultServant.obj" \
	"$(INTDIR)\RequestProcessingStrategyDefaultServantFI.obj" \
	"$(INTDIR)\RequestProcessingStrategyFactoryImpl.obj" \
	"$(INTDIR)\RequestProcessingStrategyServantActivator.obj" \
	"$(INTDIR)\RequestProcessingStrategyServantActivatorFI.obj" \
	"$(INTDIR)\RequestProcessingStrategyServantLocator.obj" \
	"$(INTDIR)\RequestProcessingStrategyServantLocatorFI.obj" \
	"$(INTDIR)\RequestProcessingStrategyServantManager.obj" \
	"$(INTDIR)\Root_POA.obj" \
	"$(INTDIR)\Servant_Base.obj" \
	"$(INTDIR)\Servant_Dispatcher.obj" \
	"$(INTDIR)\Servant_Upcall.obj" \
	"$(INTDIR)\ServantRetentionPolicy.obj" \
	"$(INTDIR)\ServantRetentionStrategyFactoryImpl.obj" \
	"$(INTDIR)\ServantRetentionStrategyNonRetain.obj" \
	"$(INTDIR)\ServantRetentionStrategyNonRetainFactoryImpl.obj" \
	"$(INTDIR)\ServantRetentionStrategyRetain.obj" \
	"$(INTDIR)\ServantRetentionStrategyRetainFactoryImpl.obj" \
	"$(INTDIR)\StrategyFactory.obj" \
	"$(INTDIR)\ThreadPolicy.obj" \
	"$(INTDIR)\ThreadStrategy.obj" \
	"$(INTDIR)\ThreadStrategyFactoryImpl.obj" \
	"$(INTDIR)\ThreadStrategyORBControl.obj" \
	"$(INTDIR)\ThreadStrategySingle.obj" \
	"$(INTDIR)\ThreadStrategySingleFactoryImpl.obj" \
	"$(INTDIR)\Upcall_Command.obj" \
	"$(INTDIR)\Upcall_Wrapper.obj" \
	"$(INTDIR)\ForwardRequestC.obj" \
	"$(INTDIR)\AdapterActivatorC.obj" \
	"$(INTDIR)\IdAssignmentPolicyC.obj" \
	"$(INTDIR)\IdUniquenessPolicyC.obj" \
	"$(INTDIR)\ImplicitActivationPolicyC.obj" \
	"$(INTDIR)\LifespanPolicyC.obj" \
	"$(INTDIR)\RequestProcessingPolicyC.obj" \
	"$(INTDIR)\ServantActivatorC.obj" \
	"$(INTDIR)\ServantLocatorC.obj" \
	"$(INTDIR)\ServantManagerC.obj" \
	"$(INTDIR)\ServantRetentionPolicyC.obj" \
	"$(INTDIR)\ThreadPolicyC.obj" \
	"$(INTDIR)\POAManagerC.obj" \
	"$(INTDIR)\POAManagerFactoryC.obj" \
	"$(INTDIR)\POAC.obj" \
	"$(INTDIR)\PS_CurrentC.obj" \
	"$(INTDIR)\PortableServer_includeC.obj" \
	"$(INTDIR)\PortableServerC.obj" \
	"$(INTDIR)\AdapterActivatorA.obj" \
	"$(INTDIR)\ForwardRequestA.obj" \
	"$(INTDIR)\IdAssignmentPolicyA.obj" \
	"$(INTDIR)\IdUniquenessPolicyA.obj" \
	"$(INTDIR)\ImplicitActivationPolicyA.obj" \
	"$(INTDIR)\LifespanPolicyA.obj" \
	"$(INTDIR)\RequestProcessingPolicyA.obj" \
	"$(INTDIR)\ServantActivatorA.obj" \
	"$(INTDIR)\ServantLocatorA.obj" \
	"$(INTDIR)\ServantManagerA.obj" \
	"$(INTDIR)\ServantRetentionPolicyA.obj" \
	"$(INTDIR)\ThreadPolicyA.obj"

"$(OUTDIR)\TAO_PortableServers.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_PortableServers.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_PortableServers.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.PortableServer.dep")
!INCLUDE "Makefile.PortableServer.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="Acceptor_Filter_Factory.cpp"

"$(INTDIR)\Acceptor_Filter_Factory.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Acceptor_Filter_Factory.obj" $(SOURCE)

SOURCE="Active_Object_Map.cpp"

"$(INTDIR)\Active_Object_Map.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Active_Object_Map.obj" $(SOURCE)

SOURCE="Active_Object_Map_Entry.cpp"

"$(INTDIR)\Active_Object_Map_Entry.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Active_Object_Map_Entry.obj" $(SOURCE)

SOURCE="Active_Policy_Strategies.cpp"

"$(INTDIR)\Active_Policy_Strategies.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Active_Policy_Strategies.obj" $(SOURCE)

SOURCE="Adapter_Activator.cpp"

"$(INTDIR)\Adapter_Activator.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Adapter_Activator.obj" $(SOURCE)

SOURCE="Collocated_Arguments_Converter.cpp"

"$(INTDIR)\Collocated_Arguments_Converter.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Collocated_Arguments_Converter.obj" $(SOURCE)

SOURCE="Collocated_Object_Proxy_Broker.cpp"

"$(INTDIR)\Collocated_Object_Proxy_Broker.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Collocated_Object_Proxy_Broker.obj" $(SOURCE)

SOURCE="Creation_Time.cpp"

"$(INTDIR)\Creation_Time.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Creation_Time.obj" $(SOURCE)

SOURCE="Default_Acceptor_Filter.cpp"

"$(INTDIR)\Default_Acceptor_Filter.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Default_Acceptor_Filter.obj" $(SOURCE)

SOURCE="Default_Policy_Validator.cpp"

"$(INTDIR)\Default_Policy_Validator.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Default_Policy_Validator.obj" $(SOURCE)

SOURCE="Default_Servant_Dispatcher.cpp"

"$(INTDIR)\Default_Servant_Dispatcher.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Default_Servant_Dispatcher.obj" $(SOURCE)

SOURCE="Direct_Collocation_Upcall_Wrapper.cpp"

"$(INTDIR)\Direct_Collocation_Upcall_Wrapper.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Direct_Collocation_Upcall_Wrapper.obj" $(SOURCE)

SOURCE="IdAssignmentPolicy.cpp"

"$(INTDIR)\IdAssignmentPolicy.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IdAssignmentPolicy.obj" $(SOURCE)

SOURCE="IdAssignmentStrategy.cpp"

"$(INTDIR)\IdAssignmentStrategy.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IdAssignmentStrategy.obj" $(SOURCE)

SOURCE="IdAssignmentStrategyFactoryImpl.cpp"

"$(INTDIR)\IdAssignmentStrategyFactoryImpl.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IdAssignmentStrategyFactoryImpl.obj" $(SOURCE)

SOURCE="IdAssignmentStrategySystem.cpp"

"$(INTDIR)\IdAssignmentStrategySystem.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IdAssignmentStrategySystem.obj" $(SOURCE)

SOURCE="IdAssignmentStrategyUser.cpp"

"$(INTDIR)\IdAssignmentStrategyUser.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IdAssignmentStrategyUser.obj" $(SOURCE)

SOURCE="IdUniquenessPolicy.cpp"

"$(INTDIR)\IdUniquenessPolicy.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IdUniquenessPolicy.obj" $(SOURCE)

SOURCE="IdUniquenessStrategyFactoryImpl.cpp"

"$(INTDIR)\IdUniquenessStrategyFactoryImpl.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IdUniquenessStrategyFactoryImpl.obj" $(SOURCE)

SOURCE="IdUniquenessStrategyMultiple.cpp"

"$(INTDIR)\IdUniquenessStrategyMultiple.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IdUniquenessStrategyMultiple.obj" $(SOURCE)

SOURCE="IdUniquenessStrategyUnique.cpp"

"$(INTDIR)\IdUniquenessStrategyUnique.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IdUniquenessStrategyUnique.obj" $(SOURCE)

SOURCE="IdUniquenessStrategyUniqueFactoryImpl.cpp"

"$(INTDIR)\IdUniquenessStrategyUniqueFactoryImpl.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IdUniquenessStrategyUniqueFactoryImpl.obj" $(SOURCE)

SOURCE="ImplicitActivationPolicy.cpp"

"$(INTDIR)\ImplicitActivationPolicy.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ImplicitActivationPolicy.obj" $(SOURCE)

SOURCE="ImplicitActivationStrategy.cpp"

"$(INTDIR)\ImplicitActivationStrategy.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ImplicitActivationStrategy.obj" $(SOURCE)

SOURCE="ImplicitActivationStrategyExplicit.cpp"

"$(INTDIR)\ImplicitActivationStrategyExplicit.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ImplicitActivationStrategyExplicit.obj" $(SOURCE)

SOURCE="ImplicitActivationStrategyFactoryImpl.cpp"

"$(INTDIR)\ImplicitActivationStrategyFactoryImpl.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ImplicitActivationStrategyFactoryImpl.obj" $(SOURCE)

SOURCE="ImplicitActivationStrategyImplicit.cpp"

"$(INTDIR)\ImplicitActivationStrategyImplicit.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ImplicitActivationStrategyImplicit.obj" $(SOURCE)

SOURCE="ImR_Client_Adapter.cpp"

"$(INTDIR)\ImR_Client_Adapter.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ImR_Client_Adapter.obj" $(SOURCE)

SOURCE="Key_Adapters.cpp"

"$(INTDIR)\Key_Adapters.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Key_Adapters.obj" $(SOURCE)

SOURCE="LifespanPolicy.cpp"

"$(INTDIR)\LifespanPolicy.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LifespanPolicy.obj" $(SOURCE)

SOURCE="LifespanStrategy.cpp"

"$(INTDIR)\LifespanStrategy.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LifespanStrategy.obj" $(SOURCE)

SOURCE="LifespanStrategyFactoryImpl.cpp"

"$(INTDIR)\LifespanStrategyFactoryImpl.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LifespanStrategyFactoryImpl.obj" $(SOURCE)

SOURCE="LifespanStrategyPersistent.cpp"

"$(INTDIR)\LifespanStrategyPersistent.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LifespanStrategyPersistent.obj" $(SOURCE)

SOURCE="LifespanStrategyPersistentFactoryImpl.cpp"

"$(INTDIR)\LifespanStrategyPersistentFactoryImpl.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LifespanStrategyPersistentFactoryImpl.obj" $(SOURCE)

SOURCE="LifespanStrategyTransient.cpp"

"$(INTDIR)\LifespanStrategyTransient.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LifespanStrategyTransient.obj" $(SOURCE)

SOURCE="LifespanStrategyTransientFactoryImpl.cpp"

"$(INTDIR)\LifespanStrategyTransientFactoryImpl.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LifespanStrategyTransientFactoryImpl.obj" $(SOURCE)

SOURCE="Local_Servant_Base.cpp"

"$(INTDIR)\Local_Servant_Base.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Local_Servant_Base.obj" $(SOURCE)

SOURCE="Network_Priority_Hook.cpp"

"$(INTDIR)\Network_Priority_Hook.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Network_Priority_Hook.obj" $(SOURCE)

SOURCE="Non_Servant_Upcall.cpp"

"$(INTDIR)\Non_Servant_Upcall.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Non_Servant_Upcall.obj" $(SOURCE)

SOURCE="Object_Adapter.cpp"

"$(INTDIR)\Object_Adapter.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Object_Adapter.obj" $(SOURCE)

SOURCE="Object_Adapter_Factory.cpp"

"$(INTDIR)\Object_Adapter_Factory.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Object_Adapter_Factory.obj" $(SOURCE)

SOURCE="Operation_Table.cpp"

"$(INTDIR)\Operation_Table.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Operation_Table.obj" $(SOURCE)

SOURCE="Operation_Table_Binary_Search.cpp"

"$(INTDIR)\Operation_Table_Binary_Search.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Operation_Table_Binary_Search.obj" $(SOURCE)

SOURCE="Operation_Table_Dynamic_Hash.cpp"

"$(INTDIR)\Operation_Table_Dynamic_Hash.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Operation_Table_Dynamic_Hash.obj" $(SOURCE)

SOURCE="Operation_Table_Linear_Search.cpp"

"$(INTDIR)\Operation_Table_Linear_Search.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Operation_Table_Linear_Search.obj" $(SOURCE)

SOURCE="Operation_Table_Perfect_Hash.cpp"

"$(INTDIR)\Operation_Table_Perfect_Hash.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Operation_Table_Perfect_Hash.obj" $(SOURCE)

SOURCE="ORT_Adapter_Factory.cpp"

"$(INTDIR)\ORT_Adapter_Factory.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ORT_Adapter_Factory.obj" $(SOURCE)

SOURCE="POA_Cached_Policies.cpp"

"$(INTDIR)\POA_Cached_Policies.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\POA_Cached_Policies.obj" $(SOURCE)

SOURCE="POA_Current.cpp"

"$(INTDIR)\POA_Current.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\POA_Current.obj" $(SOURCE)

SOURCE="POA_Current_Factory.cpp"

"$(INTDIR)\POA_Current_Factory.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\POA_Current_Factory.obj" $(SOURCE)

SOURCE="POA_Current_Impl.cpp"

"$(INTDIR)\POA_Current_Impl.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\POA_Current_Impl.obj" $(SOURCE)

SOURCE="POA_Guard.cpp"

"$(INTDIR)\POA_Guard.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\POA_Guard.obj" $(SOURCE)

SOURCE="POA_Policy_Set.cpp"

"$(INTDIR)\POA_Policy_Set.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\POA_Policy_Set.obj" $(SOURCE)

SOURCE="POAManager.cpp"

"$(INTDIR)\POAManager.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\POAManager.obj" $(SOURCE)

SOURCE="POAManagerFactory.cpp"

"$(INTDIR)\POAManagerFactory.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\POAManagerFactory.obj" $(SOURCE)

SOURCE="PolicyS.cpp"

"$(INTDIR)\PolicyS.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PolicyS.obj" $(SOURCE)

SOURCE="PortableServer.cpp"

"$(INTDIR)\PortableServer.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PortableServer.obj" $(SOURCE)

SOURCE="PortableServer_Functions.cpp"

"$(INTDIR)\PortableServer_Functions.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PortableServer_Functions.obj" $(SOURCE)

SOURCE="PortableServer_WFunctions.cpp"

"$(INTDIR)\PortableServer_WFunctions.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PortableServer_WFunctions.obj" $(SOURCE)

SOURCE="PS_ForwardA.cpp"

"$(INTDIR)\PS_ForwardA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PS_ForwardA.obj" $(SOURCE)

SOURCE="PS_ForwardC.cpp"

"$(INTDIR)\PS_ForwardC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PS_ForwardC.obj" $(SOURCE)

SOURCE="Regular_POA.cpp"

"$(INTDIR)\Regular_POA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Regular_POA.obj" $(SOURCE)

SOURCE="RequestProcessingPolicy.cpp"

"$(INTDIR)\RequestProcessingPolicy.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RequestProcessingPolicy.obj" $(SOURCE)

SOURCE="RequestProcessingStrategy.cpp"

"$(INTDIR)\RequestProcessingStrategy.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RequestProcessingStrategy.obj" $(SOURCE)

SOURCE="RequestProcessingStrategyAOMOnly.cpp"

"$(INTDIR)\RequestProcessingStrategyAOMOnly.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RequestProcessingStrategyAOMOnly.obj" $(SOURCE)

SOURCE="RequestProcessingStrategyAOMOnlyFactoryImpl.cpp"

"$(INTDIR)\RequestProcessingStrategyAOMOnlyFactoryImpl.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RequestProcessingStrategyAOMOnlyFactoryImpl.obj" $(SOURCE)

SOURCE="RequestProcessingStrategyDefaultServant.cpp"

"$(INTDIR)\RequestProcessingStrategyDefaultServant.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RequestProcessingStrategyDefaultServant.obj" $(SOURCE)

SOURCE="RequestProcessingStrategyDefaultServantFI.cpp"

"$(INTDIR)\RequestProcessingStrategyDefaultServantFI.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RequestProcessingStrategyDefaultServantFI.obj" $(SOURCE)

SOURCE="RequestProcessingStrategyFactoryImpl.cpp"

"$(INTDIR)\RequestProcessingStrategyFactoryImpl.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RequestProcessingStrategyFactoryImpl.obj" $(SOURCE)

SOURCE="RequestProcessingStrategyServantActivator.cpp"

"$(INTDIR)\RequestProcessingStrategyServantActivator.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RequestProcessingStrategyServantActivator.obj" $(SOURCE)

SOURCE="RequestProcessingStrategyServantActivatorFI.cpp"

"$(INTDIR)\RequestProcessingStrategyServantActivatorFI.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RequestProcessingStrategyServantActivatorFI.obj" $(SOURCE)

SOURCE="RequestProcessingStrategyServantLocator.cpp"

"$(INTDIR)\RequestProcessingStrategyServantLocator.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RequestProcessingStrategyServantLocator.obj" $(SOURCE)

SOURCE="RequestProcessingStrategyServantLocatorFI.cpp"

"$(INTDIR)\RequestProcessingStrategyServantLocatorFI.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RequestProcessingStrategyServantLocatorFI.obj" $(SOURCE)

SOURCE="RequestProcessingStrategyServantManager.cpp"

"$(INTDIR)\RequestProcessingStrategyServantManager.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RequestProcessingStrategyServantManager.obj" $(SOURCE)

SOURCE="Root_POA.cpp"

"$(INTDIR)\Root_POA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Root_POA.obj" $(SOURCE)

SOURCE="Servant_Base.cpp"

"$(INTDIR)\Servant_Base.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Servant_Base.obj" $(SOURCE)

SOURCE="Servant_Dispatcher.cpp"

"$(INTDIR)\Servant_Dispatcher.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Servant_Dispatcher.obj" $(SOURCE)

SOURCE="Servant_Upcall.cpp"

"$(INTDIR)\Servant_Upcall.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Servant_Upcall.obj" $(SOURCE)

SOURCE="ServantRetentionPolicy.cpp"

"$(INTDIR)\ServantRetentionPolicy.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ServantRetentionPolicy.obj" $(SOURCE)

SOURCE="ServantRetentionStrategyFactoryImpl.cpp"

"$(INTDIR)\ServantRetentionStrategyFactoryImpl.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ServantRetentionStrategyFactoryImpl.obj" $(SOURCE)

SOURCE="ServantRetentionStrategyNonRetain.cpp"

"$(INTDIR)\ServantRetentionStrategyNonRetain.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ServantRetentionStrategyNonRetain.obj" $(SOURCE)

SOURCE="ServantRetentionStrategyNonRetainFactoryImpl.cpp"

"$(INTDIR)\ServantRetentionStrategyNonRetainFactoryImpl.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ServantRetentionStrategyNonRetainFactoryImpl.obj" $(SOURCE)

SOURCE="ServantRetentionStrategyRetain.cpp"

"$(INTDIR)\ServantRetentionStrategyRetain.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ServantRetentionStrategyRetain.obj" $(SOURCE)

SOURCE="ServantRetentionStrategyRetainFactoryImpl.cpp"

"$(INTDIR)\ServantRetentionStrategyRetainFactoryImpl.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ServantRetentionStrategyRetainFactoryImpl.obj" $(SOURCE)

SOURCE="StrategyFactory.cpp"

"$(INTDIR)\StrategyFactory.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\StrategyFactory.obj" $(SOURCE)

SOURCE="ThreadPolicy.cpp"

"$(INTDIR)\ThreadPolicy.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ThreadPolicy.obj" $(SOURCE)

SOURCE="ThreadStrategy.cpp"

"$(INTDIR)\ThreadStrategy.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ThreadStrategy.obj" $(SOURCE)

SOURCE="ThreadStrategyFactoryImpl.cpp"

"$(INTDIR)\ThreadStrategyFactoryImpl.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ThreadStrategyFactoryImpl.obj" $(SOURCE)

SOURCE="ThreadStrategyORBControl.cpp"

"$(INTDIR)\ThreadStrategyORBControl.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ThreadStrategyORBControl.obj" $(SOURCE)

SOURCE="ThreadStrategySingle.cpp"

"$(INTDIR)\ThreadStrategySingle.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ThreadStrategySingle.obj" $(SOURCE)

SOURCE="ThreadStrategySingleFactoryImpl.cpp"

"$(INTDIR)\ThreadStrategySingleFactoryImpl.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ThreadStrategySingleFactoryImpl.obj" $(SOURCE)

SOURCE="Upcall_Command.cpp"

"$(INTDIR)\Upcall_Command.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Upcall_Command.obj" $(SOURCE)

SOURCE="Upcall_Wrapper.cpp"

"$(INTDIR)\Upcall_Wrapper.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Upcall_Wrapper.obj" $(SOURCE)

SOURCE="ForwardRequestC.cpp"

"$(INTDIR)\ForwardRequestC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ForwardRequestC.obj" $(SOURCE)

SOURCE="AdapterActivatorC.cpp"

"$(INTDIR)\AdapterActivatorC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\AdapterActivatorC.obj" $(SOURCE)

SOURCE="IdAssignmentPolicyC.cpp"

"$(INTDIR)\IdAssignmentPolicyC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IdAssignmentPolicyC.obj" $(SOURCE)

SOURCE="IdUniquenessPolicyC.cpp"

"$(INTDIR)\IdUniquenessPolicyC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IdUniquenessPolicyC.obj" $(SOURCE)

SOURCE="ImplicitActivationPolicyC.cpp"

"$(INTDIR)\ImplicitActivationPolicyC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ImplicitActivationPolicyC.obj" $(SOURCE)

SOURCE="LifespanPolicyC.cpp"

"$(INTDIR)\LifespanPolicyC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LifespanPolicyC.obj" $(SOURCE)

SOURCE="RequestProcessingPolicyC.cpp"

"$(INTDIR)\RequestProcessingPolicyC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RequestProcessingPolicyC.obj" $(SOURCE)

SOURCE="ServantActivatorC.cpp"

"$(INTDIR)\ServantActivatorC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ServantActivatorC.obj" $(SOURCE)

SOURCE="ServantLocatorC.cpp"

"$(INTDIR)\ServantLocatorC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ServantLocatorC.obj" $(SOURCE)

SOURCE="ServantManagerC.cpp"

"$(INTDIR)\ServantManagerC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ServantManagerC.obj" $(SOURCE)

SOURCE="ServantRetentionPolicyC.cpp"

"$(INTDIR)\ServantRetentionPolicyC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ServantRetentionPolicyC.obj" $(SOURCE)

SOURCE="ThreadPolicyC.cpp"

"$(INTDIR)\ThreadPolicyC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ThreadPolicyC.obj" $(SOURCE)

SOURCE="POAManagerC.cpp"

"$(INTDIR)\POAManagerC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\POAManagerC.obj" $(SOURCE)

SOURCE="POAManagerFactoryC.cpp"

"$(INTDIR)\POAManagerFactoryC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\POAManagerFactoryC.obj" $(SOURCE)

SOURCE="POAC.cpp"

"$(INTDIR)\POAC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\POAC.obj" $(SOURCE)

SOURCE="PS_CurrentC.cpp"

"$(INTDIR)\PS_CurrentC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PS_CurrentC.obj" $(SOURCE)

SOURCE="PortableServer_includeC.cpp"

"$(INTDIR)\PortableServer_includeC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PortableServer_includeC.obj" $(SOURCE)

SOURCE="PortableServerC.cpp"

"$(INTDIR)\PortableServerC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PortableServerC.obj" $(SOURCE)

SOURCE="AdapterActivatorA.cpp"

"$(INTDIR)\AdapterActivatorA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\AdapterActivatorA.obj" $(SOURCE)

SOURCE="ForwardRequestA.cpp"

"$(INTDIR)\ForwardRequestA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ForwardRequestA.obj" $(SOURCE)

SOURCE="IdAssignmentPolicyA.cpp"

"$(INTDIR)\IdAssignmentPolicyA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IdAssignmentPolicyA.obj" $(SOURCE)

SOURCE="IdUniquenessPolicyA.cpp"

"$(INTDIR)\IdUniquenessPolicyA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IdUniquenessPolicyA.obj" $(SOURCE)

SOURCE="ImplicitActivationPolicyA.cpp"

"$(INTDIR)\ImplicitActivationPolicyA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ImplicitActivationPolicyA.obj" $(SOURCE)

SOURCE="LifespanPolicyA.cpp"

"$(INTDIR)\LifespanPolicyA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LifespanPolicyA.obj" $(SOURCE)

SOURCE="RequestProcessingPolicyA.cpp"

"$(INTDIR)\RequestProcessingPolicyA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RequestProcessingPolicyA.obj" $(SOURCE)

SOURCE="ServantActivatorA.cpp"

"$(INTDIR)\ServantActivatorA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ServantActivatorA.obj" $(SOURCE)

SOURCE="ServantLocatorA.cpp"

"$(INTDIR)\ServantLocatorA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ServantLocatorA.obj" $(SOURCE)

SOURCE="ServantManagerA.cpp"

"$(INTDIR)\ServantManagerA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ServantManagerA.obj" $(SOURCE)

SOURCE="ServantRetentionPolicyA.cpp"

"$(INTDIR)\ServantRetentionPolicyA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ServantRetentionPolicyA.obj" $(SOURCE)

SOURCE="ThreadPolicyA.cpp"

"$(INTDIR)\ThreadPolicyA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ThreadPolicyA.obj" $(SOURCE)

!IF  "$(CFG)" == "Win64 Debug"
!ELSEIF  "$(CFG)" == "Win64 Release"
!ELSEIF  "$(CFG)" == "Win64 Static Debug"
!ELSEIF  "$(CFG)" == "Win64 Static Release"
!ENDIF

SOURCE="TAO_PortableServer.rc"

"$(INTDIR)\TAO_PortableServer.res" : $(SOURCE)
	$(RSC) /l 0x409 /fo"$(INTDIR)\TAO_PortableServer.res" /d NDEBUG /d WIN64 /d _CRT_SECURE_NO_WARNINGS /d _CRT_SECURE_NO_DEPRECATE /d _CRT_NONSTDC_NO_DEPRECATE /d TAO_HAS_VALUETYPE_OUT_INDIRECTION /i "..\..\.." /i "..\.." $(SOURCE)



!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.PortableServer.dep")
	@echo Using "Makefile.PortableServer.dep"
!ELSE
	@echo Warning: cannot find "Makefile.PortableServer.dep"
!ENDIF
!ENDIF

