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
!MESSAGE NMAKE /f "Makefile.PortableGroup.mak" CFG="Win64 Debug"
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

GENERATED_DIRTY = "miopC.inl" "miopS.inl" "miopC.h" "miopS.h" "miopC.cpp" "miopS.cpp" "PortableGroup_Simple_DSC.inl" "PortableGroup_Simple_DSS.inl" "PortableGroup_Simple_DSC.h" "PortableGroup_Simple_DSS.h" "PortableGroup_Simple_DSC.cpp" "PortableGroup_Simple_DSS.cpp" "PortableGroupC.inl" "PortableGroupS.inl" "PortableGroupC.h" "PortableGroupS.h" "PortableGroupC.cpp" "PortableGroupS.cpp"

!IF  "$(CFG)" == "Win64 Debug"

OUTDIR=..\..\..\lib
INTDIR=Debug\PortableGroup\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_PortableGroupd.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_PORTABLEGROUP_BUILD_DLL -f "Makefile.PortableGroup.dep" "miopC.cpp" "miopS.cpp" "PortableGroup_Simple_DSC.cpp" "PortableGroup_Simple_DSS.cpp" "PortableGroupC.cpp" "PortableGroupS.cpp" "PortableGroup\UIPMC_Message_Block_Data_Iterator.cpp" "PortableGroup\PG_Null_Property_Validator.cpp" "PortableGroup\PG_Location_Hash.cpp" "PortableGroup\UIPMC_Transport.cpp" "PortableGroup\PortableGroup_ORBInitializer.cpp" "PortableGroup\PG_Object_Adapter_Factory.cpp" "PortableGroup\PG_FactoryRegistry.cpp" "PortableGroup\PG_Properties_Support.cpp" "PortableGroup\PortableGroup_Request_Dispatcher.cpp" "PortableGroup\MIOP.cpp" "PortableGroup\UIPMC_Connector.cpp" "PortableGroup\PG_GenericFactory.cpp" "PortableGroup\UIPMC_Factory.cpp" "PortableGroup\UIPMC_Acceptor.cpp" "PortableGroup\PG_Operators.cpp" "PortableGroup\PortableGroup_Acceptor_Registry.cpp" "PortableGroup\UIPMC_Wait_Never.cpp" "PortableGroup\PG_Location_Equal_To.cpp" "PortableGroup\UIPMC_Profile.cpp" "PortableGroup\PG_Property_Utils.cpp" "PortableGroup\PG_Default_Property_Validator.cpp" "PortableGroup\PG_Object_Group.cpp" "PortableGroup\Portable_Group_Map.cpp" "PortableGroup\PG_Property_Set.cpp" "PortableGroup\PG_Object_Group_Manipulator.cpp" "PortableGroup\PG_ObjectGroupManager.cpp" "PortableGroup\PG_Group_Guard.cpp" "PortableGroup\GOA.cpp" "PortableGroup\PG_Group_Factory.cpp" "PortableGroup\PG_MemberInfo.cpp" "PortableGroup\UIPMC_Connection_Handler.cpp" "PortableGroup\PG_Servant_Dispatcher.cpp" "PortableGroup\UIPMC_Endpoint.cpp" "PortableGroup\UIPMC_Mcast_Connection_Handler.cpp" "PortableGroup\PG_Utils.cpp" "PortableGroup\PortableGroup_Loader.cpp" "PortableGroup\PG_PropertyManager.cpp" "PortableGroup\PG_Properties_Encoder.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_PortableGroupd.pdb"
	-@del /f/q "..\..\..\lib\TAO_PortableGroupd.dll"
	-@del /f/q "$(OUTDIR)\TAO_PortableGroupd.lib"
	-@del /f/q "$(OUTDIR)\TAO_PortableGroupd.exp"
	-@del /f/q "$(OUTDIR)\TAO_PortableGroupd.ilk"
	-@del /f/q "miopC.inl"
	-@del /f/q "miopS.inl"
	-@del /f/q "miopC.h"
	-@del /f/q "miopS.h"
	-@del /f/q "miopC.cpp"
	-@del /f/q "miopS.cpp"
	-@del /f/q "PortableGroup_Simple_DSC.inl"
	-@del /f/q "PortableGroup_Simple_DSS.inl"
	-@del /f/q "PortableGroup_Simple_DSC.h"
	-@del /f/q "PortableGroup_Simple_DSS.h"
	-@del /f/q "PortableGroup_Simple_DSC.cpp"
	-@del /f/q "PortableGroup_Simple_DSS.cpp"
	-@del /f/q "PortableGroupC.inl"
	-@del /f/q "PortableGroupS.inl"
	-@del /f/q "PortableGroupC.h"
	-@del /f/q "PortableGroupS.h"
	-@del /f/q "PortableGroupC.cpp"
	-@del /f/q "PortableGroupS.cpp"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\PortableGroup\$(NULL)" mkdir "Debug\PortableGroup"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_PORTABLEGROUP_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_CosNamingd.lib TAO_IORManipd.lib TAO_Valuetyped.lib TAO_PortableServerd.lib TAO_CodecFactoryd.lib TAO_PId.lib TAO_Messagingd.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\..\lib\TAO_PortableGroupd.pdb" /machine:IA64 /out:"..\..\..\lib\TAO_PortableGroupd.dll" /implib:"$(OUTDIR)\TAO_PortableGroupd.lib"
LINK32_OBJS= \
	"$(INTDIR)\PortableGroup.res" \
	"$(INTDIR)\miopC.obj" \
	"$(INTDIR)\miopS.obj" \
	"$(INTDIR)\PortableGroup_Simple_DSC.obj" \
	"$(INTDIR)\PortableGroup_Simple_DSS.obj" \
	"$(INTDIR)\PortableGroupC.obj" \
	"$(INTDIR)\PortableGroupS.obj" \
	"$(INTDIR)\PortableGroup\UIPMC_Message_Block_Data_Iterator.obj" \
	"$(INTDIR)\PortableGroup\PG_Null_Property_Validator.obj" \
	"$(INTDIR)\PortableGroup\PG_Location_Hash.obj" \
	"$(INTDIR)\PortableGroup\UIPMC_Transport.obj" \
	"$(INTDIR)\PortableGroup\PortableGroup_ORBInitializer.obj" \
	"$(INTDIR)\PortableGroup\PG_Object_Adapter_Factory.obj" \
	"$(INTDIR)\PortableGroup\PG_FactoryRegistry.obj" \
	"$(INTDIR)\PortableGroup\PG_Properties_Support.obj" \
	"$(INTDIR)\PortableGroup\PortableGroup_Request_Dispatcher.obj" \
	"$(INTDIR)\PortableGroup\MIOP.obj" \
	"$(INTDIR)\PortableGroup\UIPMC_Connector.obj" \
	"$(INTDIR)\PortableGroup\PG_GenericFactory.obj" \
	"$(INTDIR)\PortableGroup\UIPMC_Factory.obj" \
	"$(INTDIR)\PortableGroup\UIPMC_Acceptor.obj" \
	"$(INTDIR)\PortableGroup\PG_Operators.obj" \
	"$(INTDIR)\PortableGroup\PortableGroup_Acceptor_Registry.obj" \
	"$(INTDIR)\PortableGroup\UIPMC_Wait_Never.obj" \
	"$(INTDIR)\PortableGroup\PG_Location_Equal_To.obj" \
	"$(INTDIR)\PortableGroup\UIPMC_Profile.obj" \
	"$(INTDIR)\PortableGroup\PG_Property_Utils.obj" \
	"$(INTDIR)\PortableGroup\PG_Default_Property_Validator.obj" \
	"$(INTDIR)\PortableGroup\PG_Object_Group.obj" \
	"$(INTDIR)\PortableGroup\Portable_Group_Map.obj" \
	"$(INTDIR)\PortableGroup\PG_Property_Set.obj" \
	"$(INTDIR)\PortableGroup\PG_Object_Group_Manipulator.obj" \
	"$(INTDIR)\PortableGroup\PG_ObjectGroupManager.obj" \
	"$(INTDIR)\PortableGroup\PG_Group_Guard.obj" \
	"$(INTDIR)\PortableGroup\GOA.obj" \
	"$(INTDIR)\PortableGroup\PG_Group_Factory.obj" \
	"$(INTDIR)\PortableGroup\PG_MemberInfo.obj" \
	"$(INTDIR)\PortableGroup\UIPMC_Connection_Handler.obj" \
	"$(INTDIR)\PortableGroup\PG_Servant_Dispatcher.obj" \
	"$(INTDIR)\PortableGroup\UIPMC_Endpoint.obj" \
	"$(INTDIR)\PortableGroup\UIPMC_Mcast_Connection_Handler.obj" \
	"$(INTDIR)\PortableGroup\PG_Utils.obj" \
	"$(INTDIR)\PortableGroup\PortableGroup_Loader.obj" \
	"$(INTDIR)\PortableGroup\PG_PropertyManager.obj" \
	"$(INTDIR)\PortableGroup\PG_Properties_Encoder.obj"

"..\..\..\lib\TAO_PortableGroupd.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_PortableGroupd.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_PortableGroupd.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\PortableGroup\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_PortableGroup.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_PORTABLEGROUP_BUILD_DLL -f "Makefile.PortableGroup.dep" "miopC.cpp" "miopS.cpp" "PortableGroup_Simple_DSC.cpp" "PortableGroup_Simple_DSS.cpp" "PortableGroupC.cpp" "PortableGroupS.cpp" "PortableGroup\UIPMC_Message_Block_Data_Iterator.cpp" "PortableGroup\PG_Null_Property_Validator.cpp" "PortableGroup\PG_Location_Hash.cpp" "PortableGroup\UIPMC_Transport.cpp" "PortableGroup\PortableGroup_ORBInitializer.cpp" "PortableGroup\PG_Object_Adapter_Factory.cpp" "PortableGroup\PG_FactoryRegistry.cpp" "PortableGroup\PG_Properties_Support.cpp" "PortableGroup\PortableGroup_Request_Dispatcher.cpp" "PortableGroup\MIOP.cpp" "PortableGroup\UIPMC_Connector.cpp" "PortableGroup\PG_GenericFactory.cpp" "PortableGroup\UIPMC_Factory.cpp" "PortableGroup\UIPMC_Acceptor.cpp" "PortableGroup\PG_Operators.cpp" "PortableGroup\PortableGroup_Acceptor_Registry.cpp" "PortableGroup\UIPMC_Wait_Never.cpp" "PortableGroup\PG_Location_Equal_To.cpp" "PortableGroup\UIPMC_Profile.cpp" "PortableGroup\PG_Property_Utils.cpp" "PortableGroup\PG_Default_Property_Validator.cpp" "PortableGroup\PG_Object_Group.cpp" "PortableGroup\Portable_Group_Map.cpp" "PortableGroup\PG_Property_Set.cpp" "PortableGroup\PG_Object_Group_Manipulator.cpp" "PortableGroup\PG_ObjectGroupManager.cpp" "PortableGroup\PG_Group_Guard.cpp" "PortableGroup\GOA.cpp" "PortableGroup\PG_Group_Factory.cpp" "PortableGroup\PG_MemberInfo.cpp" "PortableGroup\UIPMC_Connection_Handler.cpp" "PortableGroup\PG_Servant_Dispatcher.cpp" "PortableGroup\UIPMC_Endpoint.cpp" "PortableGroup\UIPMC_Mcast_Connection_Handler.cpp" "PortableGroup\PG_Utils.cpp" "PortableGroup\PortableGroup_Loader.cpp" "PortableGroup\PG_PropertyManager.cpp" "PortableGroup\PG_Properties_Encoder.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\TAO_PortableGroup.dll"
	-@del /f/q "$(OUTDIR)\TAO_PortableGroup.lib"
	-@del /f/q "$(OUTDIR)\TAO_PortableGroup.exp"
	-@del /f/q "$(OUTDIR)\TAO_PortableGroup.ilk"
	-@del /f/q "miopC.inl"
	-@del /f/q "miopS.inl"
	-@del /f/q "miopC.h"
	-@del /f/q "miopS.h"
	-@del /f/q "miopC.cpp"
	-@del /f/q "miopS.cpp"
	-@del /f/q "PortableGroup_Simple_DSC.inl"
	-@del /f/q "PortableGroup_Simple_DSS.inl"
	-@del /f/q "PortableGroup_Simple_DSC.h"
	-@del /f/q "PortableGroup_Simple_DSS.h"
	-@del /f/q "PortableGroup_Simple_DSC.cpp"
	-@del /f/q "PortableGroup_Simple_DSS.cpp"
	-@del /f/q "PortableGroupC.inl"
	-@del /f/q "PortableGroupS.inl"
	-@del /f/q "PortableGroupC.h"
	-@del /f/q "PortableGroupS.h"
	-@del /f/q "PortableGroupC.cpp"
	-@del /f/q "PortableGroupS.cpp"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\PortableGroup\$(NULL)" mkdir "Release\PortableGroup"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_PORTABLEGROUP_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_CosNaming.lib TAO_IORManip.lib TAO_Valuetype.lib TAO_PortableServer.lib TAO_CodecFactory.lib TAO_PI.lib TAO_Messaging.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\..\lib\TAO_PortableGroup.dll" /implib:"$(OUTDIR)\TAO_PortableGroup.lib"
LINK32_OBJS= \
	"$(INTDIR)\PortableGroup.res" \
	"$(INTDIR)\miopC.obj" \
	"$(INTDIR)\miopS.obj" \
	"$(INTDIR)\PortableGroup_Simple_DSC.obj" \
	"$(INTDIR)\PortableGroup_Simple_DSS.obj" \
	"$(INTDIR)\PortableGroupC.obj" \
	"$(INTDIR)\PortableGroupS.obj" \
	"$(INTDIR)\PortableGroup\UIPMC_Message_Block_Data_Iterator.obj" \
	"$(INTDIR)\PortableGroup\PG_Null_Property_Validator.obj" \
	"$(INTDIR)\PortableGroup\PG_Location_Hash.obj" \
	"$(INTDIR)\PortableGroup\UIPMC_Transport.obj" \
	"$(INTDIR)\PortableGroup\PortableGroup_ORBInitializer.obj" \
	"$(INTDIR)\PortableGroup\PG_Object_Adapter_Factory.obj" \
	"$(INTDIR)\PortableGroup\PG_FactoryRegistry.obj" \
	"$(INTDIR)\PortableGroup\PG_Properties_Support.obj" \
	"$(INTDIR)\PortableGroup\PortableGroup_Request_Dispatcher.obj" \
	"$(INTDIR)\PortableGroup\MIOP.obj" \
	"$(INTDIR)\PortableGroup\UIPMC_Connector.obj" \
	"$(INTDIR)\PortableGroup\PG_GenericFactory.obj" \
	"$(INTDIR)\PortableGroup\UIPMC_Factory.obj" \
	"$(INTDIR)\PortableGroup\UIPMC_Acceptor.obj" \
	"$(INTDIR)\PortableGroup\PG_Operators.obj" \
	"$(INTDIR)\PortableGroup\PortableGroup_Acceptor_Registry.obj" \
	"$(INTDIR)\PortableGroup\UIPMC_Wait_Never.obj" \
	"$(INTDIR)\PortableGroup\PG_Location_Equal_To.obj" \
	"$(INTDIR)\PortableGroup\UIPMC_Profile.obj" \
	"$(INTDIR)\PortableGroup\PG_Property_Utils.obj" \
	"$(INTDIR)\PortableGroup\PG_Default_Property_Validator.obj" \
	"$(INTDIR)\PortableGroup\PG_Object_Group.obj" \
	"$(INTDIR)\PortableGroup\Portable_Group_Map.obj" \
	"$(INTDIR)\PortableGroup\PG_Property_Set.obj" \
	"$(INTDIR)\PortableGroup\PG_Object_Group_Manipulator.obj" \
	"$(INTDIR)\PortableGroup\PG_ObjectGroupManager.obj" \
	"$(INTDIR)\PortableGroup\PG_Group_Guard.obj" \
	"$(INTDIR)\PortableGroup\GOA.obj" \
	"$(INTDIR)\PortableGroup\PG_Group_Factory.obj" \
	"$(INTDIR)\PortableGroup\PG_MemberInfo.obj" \
	"$(INTDIR)\PortableGroup\UIPMC_Connection_Handler.obj" \
	"$(INTDIR)\PortableGroup\PG_Servant_Dispatcher.obj" \
	"$(INTDIR)\PortableGroup\UIPMC_Endpoint.obj" \
	"$(INTDIR)\PortableGroup\UIPMC_Mcast_Connection_Handler.obj" \
	"$(INTDIR)\PortableGroup\PG_Utils.obj" \
	"$(INTDIR)\PortableGroup\PortableGroup_Loader.obj" \
	"$(INTDIR)\PortableGroup\PG_PropertyManager.obj" \
	"$(INTDIR)\PortableGroup\PG_Properties_Encoder.obj"

"..\..\..\lib\TAO_PortableGroup.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_PortableGroup.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_PortableGroup.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\PortableGroup\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_PortableGroupsd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.PortableGroup.dep" "miopC.cpp" "miopS.cpp" "PortableGroup_Simple_DSC.cpp" "PortableGroup_Simple_DSS.cpp" "PortableGroupC.cpp" "PortableGroupS.cpp" "PortableGroup\UIPMC_Message_Block_Data_Iterator.cpp" "PortableGroup\PG_Null_Property_Validator.cpp" "PortableGroup\PG_Location_Hash.cpp" "PortableGroup\UIPMC_Transport.cpp" "PortableGroup\PortableGroup_ORBInitializer.cpp" "PortableGroup\PG_Object_Adapter_Factory.cpp" "PortableGroup\PG_FactoryRegistry.cpp" "PortableGroup\PG_Properties_Support.cpp" "PortableGroup\PortableGroup_Request_Dispatcher.cpp" "PortableGroup\MIOP.cpp" "PortableGroup\UIPMC_Connector.cpp" "PortableGroup\PG_GenericFactory.cpp" "PortableGroup\UIPMC_Factory.cpp" "PortableGroup\UIPMC_Acceptor.cpp" "PortableGroup\PG_Operators.cpp" "PortableGroup\PortableGroup_Acceptor_Registry.cpp" "PortableGroup\UIPMC_Wait_Never.cpp" "PortableGroup\PG_Location_Equal_To.cpp" "PortableGroup\UIPMC_Profile.cpp" "PortableGroup\PG_Property_Utils.cpp" "PortableGroup\PG_Default_Property_Validator.cpp" "PortableGroup\PG_Object_Group.cpp" "PortableGroup\Portable_Group_Map.cpp" "PortableGroup\PG_Property_Set.cpp" "PortableGroup\PG_Object_Group_Manipulator.cpp" "PortableGroup\PG_ObjectGroupManager.cpp" "PortableGroup\PG_Group_Guard.cpp" "PortableGroup\GOA.cpp" "PortableGroup\PG_Group_Factory.cpp" "PortableGroup\PG_MemberInfo.cpp" "PortableGroup\UIPMC_Connection_Handler.cpp" "PortableGroup\PG_Servant_Dispatcher.cpp" "PortableGroup\UIPMC_Endpoint.cpp" "PortableGroup\UIPMC_Mcast_Connection_Handler.cpp" "PortableGroup\PG_Utils.cpp" "PortableGroup\PortableGroup_Loader.cpp" "PortableGroup\PG_PropertyManager.cpp" "PortableGroup\PG_Properties_Encoder.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_PortableGroupsd.lib"
	-@del /f/q "$(OUTDIR)\TAO_PortableGroupsd.exp"
	-@del /f/q "$(OUTDIR)\TAO_PortableGroupsd.ilk"
	-@del /f/q "..\..\..\lib\TAO_PortableGroupsd.pdb"
	-@del /f/q "miopC.inl"
	-@del /f/q "miopS.inl"
	-@del /f/q "miopC.h"
	-@del /f/q "miopS.h"
	-@del /f/q "miopC.cpp"
	-@del /f/q "miopS.cpp"
	-@del /f/q "PortableGroup_Simple_DSC.inl"
	-@del /f/q "PortableGroup_Simple_DSS.inl"
	-@del /f/q "PortableGroup_Simple_DSC.h"
	-@del /f/q "PortableGroup_Simple_DSS.h"
	-@del /f/q "PortableGroup_Simple_DSC.cpp"
	-@del /f/q "PortableGroup_Simple_DSS.cpp"
	-@del /f/q "PortableGroupC.inl"
	-@del /f/q "PortableGroupS.inl"
	-@del /f/q "PortableGroupC.h"
	-@del /f/q "PortableGroupS.h"
	-@del /f/q "PortableGroupC.cpp"
	-@del /f/q "PortableGroupS.cpp"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\PortableGroup\$(NULL)" mkdir "Static_Debug\PortableGroup"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\TAO_PortableGroupsd.pdb" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_PortableGroupsd.lib"
LINK32_OBJS= \
	"$(INTDIR)\miopC.obj" \
	"$(INTDIR)\miopS.obj" \
	"$(INTDIR)\PortableGroup_Simple_DSC.obj" \
	"$(INTDIR)\PortableGroup_Simple_DSS.obj" \
	"$(INTDIR)\PortableGroupC.obj" \
	"$(INTDIR)\PortableGroupS.obj" \
	"$(INTDIR)\PortableGroup\UIPMC_Message_Block_Data_Iterator.obj" \
	"$(INTDIR)\PortableGroup\PG_Null_Property_Validator.obj" \
	"$(INTDIR)\PortableGroup\PG_Location_Hash.obj" \
	"$(INTDIR)\PortableGroup\UIPMC_Transport.obj" \
	"$(INTDIR)\PortableGroup\PortableGroup_ORBInitializer.obj" \
	"$(INTDIR)\PortableGroup\PG_Object_Adapter_Factory.obj" \
	"$(INTDIR)\PortableGroup\PG_FactoryRegistry.obj" \
	"$(INTDIR)\PortableGroup\PG_Properties_Support.obj" \
	"$(INTDIR)\PortableGroup\PortableGroup_Request_Dispatcher.obj" \
	"$(INTDIR)\PortableGroup\MIOP.obj" \
	"$(INTDIR)\PortableGroup\UIPMC_Connector.obj" \
	"$(INTDIR)\PortableGroup\PG_GenericFactory.obj" \
	"$(INTDIR)\PortableGroup\UIPMC_Factory.obj" \
	"$(INTDIR)\PortableGroup\UIPMC_Acceptor.obj" \
	"$(INTDIR)\PortableGroup\PG_Operators.obj" \
	"$(INTDIR)\PortableGroup\PortableGroup_Acceptor_Registry.obj" \
	"$(INTDIR)\PortableGroup\UIPMC_Wait_Never.obj" \
	"$(INTDIR)\PortableGroup\PG_Location_Equal_To.obj" \
	"$(INTDIR)\PortableGroup\UIPMC_Profile.obj" \
	"$(INTDIR)\PortableGroup\PG_Property_Utils.obj" \
	"$(INTDIR)\PortableGroup\PG_Default_Property_Validator.obj" \
	"$(INTDIR)\PortableGroup\PG_Object_Group.obj" \
	"$(INTDIR)\PortableGroup\Portable_Group_Map.obj" \
	"$(INTDIR)\PortableGroup\PG_Property_Set.obj" \
	"$(INTDIR)\PortableGroup\PG_Object_Group_Manipulator.obj" \
	"$(INTDIR)\PortableGroup\PG_ObjectGroupManager.obj" \
	"$(INTDIR)\PortableGroup\PG_Group_Guard.obj" \
	"$(INTDIR)\PortableGroup\GOA.obj" \
	"$(INTDIR)\PortableGroup\PG_Group_Factory.obj" \
	"$(INTDIR)\PortableGroup\PG_MemberInfo.obj" \
	"$(INTDIR)\PortableGroup\UIPMC_Connection_Handler.obj" \
	"$(INTDIR)\PortableGroup\PG_Servant_Dispatcher.obj" \
	"$(INTDIR)\PortableGroup\UIPMC_Endpoint.obj" \
	"$(INTDIR)\PortableGroup\UIPMC_Mcast_Connection_Handler.obj" \
	"$(INTDIR)\PortableGroup\PG_Utils.obj" \
	"$(INTDIR)\PortableGroup\PortableGroup_Loader.obj" \
	"$(INTDIR)\PortableGroup\PG_PropertyManager.obj" \
	"$(INTDIR)\PortableGroup\PG_Properties_Encoder.obj"

"$(OUTDIR)\TAO_PortableGroupsd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_PortableGroupsd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_PortableGroupsd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\PortableGroup\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_PortableGroups.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.PortableGroup.dep" "miopC.cpp" "miopS.cpp" "PortableGroup_Simple_DSC.cpp" "PortableGroup_Simple_DSS.cpp" "PortableGroupC.cpp" "PortableGroupS.cpp" "PortableGroup\UIPMC_Message_Block_Data_Iterator.cpp" "PortableGroup\PG_Null_Property_Validator.cpp" "PortableGroup\PG_Location_Hash.cpp" "PortableGroup\UIPMC_Transport.cpp" "PortableGroup\PortableGroup_ORBInitializer.cpp" "PortableGroup\PG_Object_Adapter_Factory.cpp" "PortableGroup\PG_FactoryRegistry.cpp" "PortableGroup\PG_Properties_Support.cpp" "PortableGroup\PortableGroup_Request_Dispatcher.cpp" "PortableGroup\MIOP.cpp" "PortableGroup\UIPMC_Connector.cpp" "PortableGroup\PG_GenericFactory.cpp" "PortableGroup\UIPMC_Factory.cpp" "PortableGroup\UIPMC_Acceptor.cpp" "PortableGroup\PG_Operators.cpp" "PortableGroup\PortableGroup_Acceptor_Registry.cpp" "PortableGroup\UIPMC_Wait_Never.cpp" "PortableGroup\PG_Location_Equal_To.cpp" "PortableGroup\UIPMC_Profile.cpp" "PortableGroup\PG_Property_Utils.cpp" "PortableGroup\PG_Default_Property_Validator.cpp" "PortableGroup\PG_Object_Group.cpp" "PortableGroup\Portable_Group_Map.cpp" "PortableGroup\PG_Property_Set.cpp" "PortableGroup\PG_Object_Group_Manipulator.cpp" "PortableGroup\PG_ObjectGroupManager.cpp" "PortableGroup\PG_Group_Guard.cpp" "PortableGroup\GOA.cpp" "PortableGroup\PG_Group_Factory.cpp" "PortableGroup\PG_MemberInfo.cpp" "PortableGroup\UIPMC_Connection_Handler.cpp" "PortableGroup\PG_Servant_Dispatcher.cpp" "PortableGroup\UIPMC_Endpoint.cpp" "PortableGroup\UIPMC_Mcast_Connection_Handler.cpp" "PortableGroup\PG_Utils.cpp" "PortableGroup\PortableGroup_Loader.cpp" "PortableGroup\PG_PropertyManager.cpp" "PortableGroup\PG_Properties_Encoder.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_PortableGroups.lib"
	-@del /f/q "$(OUTDIR)\TAO_PortableGroups.exp"
	-@del /f/q "$(OUTDIR)\TAO_PortableGroups.ilk"
	-@del /f/q "miopC.inl"
	-@del /f/q "miopS.inl"
	-@del /f/q "miopC.h"
	-@del /f/q "miopS.h"
	-@del /f/q "miopC.cpp"
	-@del /f/q "miopS.cpp"
	-@del /f/q "PortableGroup_Simple_DSC.inl"
	-@del /f/q "PortableGroup_Simple_DSS.inl"
	-@del /f/q "PortableGroup_Simple_DSC.h"
	-@del /f/q "PortableGroup_Simple_DSS.h"
	-@del /f/q "PortableGroup_Simple_DSC.cpp"
	-@del /f/q "PortableGroup_Simple_DSS.cpp"
	-@del /f/q "PortableGroupC.inl"
	-@del /f/q "PortableGroupS.inl"
	-@del /f/q "PortableGroupC.h"
	-@del /f/q "PortableGroupS.h"
	-@del /f/q "PortableGroupC.cpp"
	-@del /f/q "PortableGroupS.cpp"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\PortableGroup\$(NULL)" mkdir "Static_Release\PortableGroup"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_PortableGroups.lib"
LINK32_OBJS= \
	"$(INTDIR)\miopC.obj" \
	"$(INTDIR)\miopS.obj" \
	"$(INTDIR)\PortableGroup_Simple_DSC.obj" \
	"$(INTDIR)\PortableGroup_Simple_DSS.obj" \
	"$(INTDIR)\PortableGroupC.obj" \
	"$(INTDIR)\PortableGroupS.obj" \
	"$(INTDIR)\PortableGroup\UIPMC_Message_Block_Data_Iterator.obj" \
	"$(INTDIR)\PortableGroup\PG_Null_Property_Validator.obj" \
	"$(INTDIR)\PortableGroup\PG_Location_Hash.obj" \
	"$(INTDIR)\PortableGroup\UIPMC_Transport.obj" \
	"$(INTDIR)\PortableGroup\PortableGroup_ORBInitializer.obj" \
	"$(INTDIR)\PortableGroup\PG_Object_Adapter_Factory.obj" \
	"$(INTDIR)\PortableGroup\PG_FactoryRegistry.obj" \
	"$(INTDIR)\PortableGroup\PG_Properties_Support.obj" \
	"$(INTDIR)\PortableGroup\PortableGroup_Request_Dispatcher.obj" \
	"$(INTDIR)\PortableGroup\MIOP.obj" \
	"$(INTDIR)\PortableGroup\UIPMC_Connector.obj" \
	"$(INTDIR)\PortableGroup\PG_GenericFactory.obj" \
	"$(INTDIR)\PortableGroup\UIPMC_Factory.obj" \
	"$(INTDIR)\PortableGroup\UIPMC_Acceptor.obj" \
	"$(INTDIR)\PortableGroup\PG_Operators.obj" \
	"$(INTDIR)\PortableGroup\PortableGroup_Acceptor_Registry.obj" \
	"$(INTDIR)\PortableGroup\UIPMC_Wait_Never.obj" \
	"$(INTDIR)\PortableGroup\PG_Location_Equal_To.obj" \
	"$(INTDIR)\PortableGroup\UIPMC_Profile.obj" \
	"$(INTDIR)\PortableGroup\PG_Property_Utils.obj" \
	"$(INTDIR)\PortableGroup\PG_Default_Property_Validator.obj" \
	"$(INTDIR)\PortableGroup\PG_Object_Group.obj" \
	"$(INTDIR)\PortableGroup\Portable_Group_Map.obj" \
	"$(INTDIR)\PortableGroup\PG_Property_Set.obj" \
	"$(INTDIR)\PortableGroup\PG_Object_Group_Manipulator.obj" \
	"$(INTDIR)\PortableGroup\PG_ObjectGroupManager.obj" \
	"$(INTDIR)\PortableGroup\PG_Group_Guard.obj" \
	"$(INTDIR)\PortableGroup\GOA.obj" \
	"$(INTDIR)\PortableGroup\PG_Group_Factory.obj" \
	"$(INTDIR)\PortableGroup\PG_MemberInfo.obj" \
	"$(INTDIR)\PortableGroup\UIPMC_Connection_Handler.obj" \
	"$(INTDIR)\PortableGroup\PG_Servant_Dispatcher.obj" \
	"$(INTDIR)\PortableGroup\UIPMC_Endpoint.obj" \
	"$(INTDIR)\PortableGroup\UIPMC_Mcast_Connection_Handler.obj" \
	"$(INTDIR)\PortableGroup\PG_Utils.obj" \
	"$(INTDIR)\PortableGroup\PortableGroup_Loader.obj" \
	"$(INTDIR)\PortableGroup\PG_PropertyManager.obj" \
	"$(INTDIR)\PortableGroup\PG_Properties_Encoder.obj"

"$(OUTDIR)\TAO_PortableGroups.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_PortableGroups.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_PortableGroups.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.PortableGroup.dep")
!INCLUDE "Makefile.PortableGroup.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="miopC.cpp"

"$(INTDIR)\miopC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\miopC.obj" $(SOURCE)

SOURCE="miopS.cpp"

"$(INTDIR)\miopS.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\miopS.obj" $(SOURCE)

SOURCE="PortableGroup_Simple_DSC.cpp"

"$(INTDIR)\PortableGroup_Simple_DSC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PortableGroup_Simple_DSC.obj" $(SOURCE)

SOURCE="PortableGroup_Simple_DSS.cpp"

"$(INTDIR)\PortableGroup_Simple_DSS.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PortableGroup_Simple_DSS.obj" $(SOURCE)

SOURCE="PortableGroupC.cpp"

"$(INTDIR)\PortableGroupC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PortableGroupC.obj" $(SOURCE)

SOURCE="PortableGroupS.cpp"

"$(INTDIR)\PortableGroupS.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PortableGroupS.obj" $(SOURCE)

SOURCE="PortableGroup\UIPMC_Message_Block_Data_Iterator.cpp"

"$(INTDIR)\PortableGroup\UIPMC_Message_Block_Data_Iterator.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\PortableGroup\$(NULL)" mkdir "$(INTDIR)\PortableGroup\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PortableGroup\UIPMC_Message_Block_Data_Iterator.obj" $(SOURCE)

SOURCE="PortableGroup\PG_Null_Property_Validator.cpp"

"$(INTDIR)\PortableGroup\PG_Null_Property_Validator.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\PortableGroup\$(NULL)" mkdir "$(INTDIR)\PortableGroup\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PortableGroup\PG_Null_Property_Validator.obj" $(SOURCE)

SOURCE="PortableGroup\PG_Location_Hash.cpp"

"$(INTDIR)\PortableGroup\PG_Location_Hash.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\PortableGroup\$(NULL)" mkdir "$(INTDIR)\PortableGroup\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PortableGroup\PG_Location_Hash.obj" $(SOURCE)

SOURCE="PortableGroup\UIPMC_Transport.cpp"

"$(INTDIR)\PortableGroup\UIPMC_Transport.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\PortableGroup\$(NULL)" mkdir "$(INTDIR)\PortableGroup\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PortableGroup\UIPMC_Transport.obj" $(SOURCE)

SOURCE="PortableGroup\PortableGroup_ORBInitializer.cpp"

"$(INTDIR)\PortableGroup\PortableGroup_ORBInitializer.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\PortableGroup\$(NULL)" mkdir "$(INTDIR)\PortableGroup\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PortableGroup\PortableGroup_ORBInitializer.obj" $(SOURCE)

SOURCE="PortableGroup\PG_Object_Adapter_Factory.cpp"

"$(INTDIR)\PortableGroup\PG_Object_Adapter_Factory.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\PortableGroup\$(NULL)" mkdir "$(INTDIR)\PortableGroup\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PortableGroup\PG_Object_Adapter_Factory.obj" $(SOURCE)

SOURCE="PortableGroup\PG_FactoryRegistry.cpp"

"$(INTDIR)\PortableGroup\PG_FactoryRegistry.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\PortableGroup\$(NULL)" mkdir "$(INTDIR)\PortableGroup\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PortableGroup\PG_FactoryRegistry.obj" $(SOURCE)

SOURCE="PortableGroup\PG_Properties_Support.cpp"

"$(INTDIR)\PortableGroup\PG_Properties_Support.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\PortableGroup\$(NULL)" mkdir "$(INTDIR)\PortableGroup\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PortableGroup\PG_Properties_Support.obj" $(SOURCE)

SOURCE="PortableGroup\PortableGroup_Request_Dispatcher.cpp"

"$(INTDIR)\PortableGroup\PortableGroup_Request_Dispatcher.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\PortableGroup\$(NULL)" mkdir "$(INTDIR)\PortableGroup\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PortableGroup\PortableGroup_Request_Dispatcher.obj" $(SOURCE)

SOURCE="PortableGroup\MIOP.cpp"

"$(INTDIR)\PortableGroup\MIOP.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\PortableGroup\$(NULL)" mkdir "$(INTDIR)\PortableGroup\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PortableGroup\MIOP.obj" $(SOURCE)

SOURCE="PortableGroup\UIPMC_Connector.cpp"

"$(INTDIR)\PortableGroup\UIPMC_Connector.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\PortableGroup\$(NULL)" mkdir "$(INTDIR)\PortableGroup\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PortableGroup\UIPMC_Connector.obj" $(SOURCE)

SOURCE="PortableGroup\PG_GenericFactory.cpp"

"$(INTDIR)\PortableGroup\PG_GenericFactory.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\PortableGroup\$(NULL)" mkdir "$(INTDIR)\PortableGroup\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PortableGroup\PG_GenericFactory.obj" $(SOURCE)

SOURCE="PortableGroup\UIPMC_Factory.cpp"

"$(INTDIR)\PortableGroup\UIPMC_Factory.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\PortableGroup\$(NULL)" mkdir "$(INTDIR)\PortableGroup\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PortableGroup\UIPMC_Factory.obj" $(SOURCE)

SOURCE="PortableGroup\UIPMC_Acceptor.cpp"

"$(INTDIR)\PortableGroup\UIPMC_Acceptor.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\PortableGroup\$(NULL)" mkdir "$(INTDIR)\PortableGroup\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PortableGroup\UIPMC_Acceptor.obj" $(SOURCE)

SOURCE="PortableGroup\PG_Operators.cpp"

"$(INTDIR)\PortableGroup\PG_Operators.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\PortableGroup\$(NULL)" mkdir "$(INTDIR)\PortableGroup\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PortableGroup\PG_Operators.obj" $(SOURCE)

SOURCE="PortableGroup\PortableGroup_Acceptor_Registry.cpp"

"$(INTDIR)\PortableGroup\PortableGroup_Acceptor_Registry.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\PortableGroup\$(NULL)" mkdir "$(INTDIR)\PortableGroup\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PortableGroup\PortableGroup_Acceptor_Registry.obj" $(SOURCE)

SOURCE="PortableGroup\UIPMC_Wait_Never.cpp"

"$(INTDIR)\PortableGroup\UIPMC_Wait_Never.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\PortableGroup\$(NULL)" mkdir "$(INTDIR)\PortableGroup\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PortableGroup\UIPMC_Wait_Never.obj" $(SOURCE)

SOURCE="PortableGroup\PG_Location_Equal_To.cpp"

"$(INTDIR)\PortableGroup\PG_Location_Equal_To.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\PortableGroup\$(NULL)" mkdir "$(INTDIR)\PortableGroup\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PortableGroup\PG_Location_Equal_To.obj" $(SOURCE)

SOURCE="PortableGroup\UIPMC_Profile.cpp"

"$(INTDIR)\PortableGroup\UIPMC_Profile.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\PortableGroup\$(NULL)" mkdir "$(INTDIR)\PortableGroup\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PortableGroup\UIPMC_Profile.obj" $(SOURCE)

SOURCE="PortableGroup\PG_Property_Utils.cpp"

"$(INTDIR)\PortableGroup\PG_Property_Utils.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\PortableGroup\$(NULL)" mkdir "$(INTDIR)\PortableGroup\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PortableGroup\PG_Property_Utils.obj" $(SOURCE)

SOURCE="PortableGroup\PG_Default_Property_Validator.cpp"

"$(INTDIR)\PortableGroup\PG_Default_Property_Validator.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\PortableGroup\$(NULL)" mkdir "$(INTDIR)\PortableGroup\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PortableGroup\PG_Default_Property_Validator.obj" $(SOURCE)

SOURCE="PortableGroup\PG_Object_Group.cpp"

"$(INTDIR)\PortableGroup\PG_Object_Group.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\PortableGroup\$(NULL)" mkdir "$(INTDIR)\PortableGroup\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PortableGroup\PG_Object_Group.obj" $(SOURCE)

SOURCE="PortableGroup\Portable_Group_Map.cpp"

"$(INTDIR)\PortableGroup\Portable_Group_Map.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\PortableGroup\$(NULL)" mkdir "$(INTDIR)\PortableGroup\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PortableGroup\Portable_Group_Map.obj" $(SOURCE)

SOURCE="PortableGroup\PG_Property_Set.cpp"

"$(INTDIR)\PortableGroup\PG_Property_Set.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\PortableGroup\$(NULL)" mkdir "$(INTDIR)\PortableGroup\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PortableGroup\PG_Property_Set.obj" $(SOURCE)

SOURCE="PortableGroup\PG_Object_Group_Manipulator.cpp"

"$(INTDIR)\PortableGroup\PG_Object_Group_Manipulator.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\PortableGroup\$(NULL)" mkdir "$(INTDIR)\PortableGroup\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PortableGroup\PG_Object_Group_Manipulator.obj" $(SOURCE)

SOURCE="PortableGroup\PG_ObjectGroupManager.cpp"

"$(INTDIR)\PortableGroup\PG_ObjectGroupManager.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\PortableGroup\$(NULL)" mkdir "$(INTDIR)\PortableGroup\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PortableGroup\PG_ObjectGroupManager.obj" $(SOURCE)

SOURCE="PortableGroup\PG_Group_Guard.cpp"

"$(INTDIR)\PortableGroup\PG_Group_Guard.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\PortableGroup\$(NULL)" mkdir "$(INTDIR)\PortableGroup\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PortableGroup\PG_Group_Guard.obj" $(SOURCE)

SOURCE="PortableGroup\GOA.cpp"

"$(INTDIR)\PortableGroup\GOA.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\PortableGroup\$(NULL)" mkdir "$(INTDIR)\PortableGroup\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PortableGroup\GOA.obj" $(SOURCE)

SOURCE="PortableGroup\PG_Group_Factory.cpp"

"$(INTDIR)\PortableGroup\PG_Group_Factory.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\PortableGroup\$(NULL)" mkdir "$(INTDIR)\PortableGroup\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PortableGroup\PG_Group_Factory.obj" $(SOURCE)

SOURCE="PortableGroup\PG_MemberInfo.cpp"

"$(INTDIR)\PortableGroup\PG_MemberInfo.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\PortableGroup\$(NULL)" mkdir "$(INTDIR)\PortableGroup\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PortableGroup\PG_MemberInfo.obj" $(SOURCE)

SOURCE="PortableGroup\UIPMC_Connection_Handler.cpp"

"$(INTDIR)\PortableGroup\UIPMC_Connection_Handler.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\PortableGroup\$(NULL)" mkdir "$(INTDIR)\PortableGroup\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PortableGroup\UIPMC_Connection_Handler.obj" $(SOURCE)

SOURCE="PortableGroup\PG_Servant_Dispatcher.cpp"

"$(INTDIR)\PortableGroup\PG_Servant_Dispatcher.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\PortableGroup\$(NULL)" mkdir "$(INTDIR)\PortableGroup\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PortableGroup\PG_Servant_Dispatcher.obj" $(SOURCE)

SOURCE="PortableGroup\UIPMC_Endpoint.cpp"

"$(INTDIR)\PortableGroup\UIPMC_Endpoint.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\PortableGroup\$(NULL)" mkdir "$(INTDIR)\PortableGroup\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PortableGroup\UIPMC_Endpoint.obj" $(SOURCE)

SOURCE="PortableGroup\UIPMC_Mcast_Connection_Handler.cpp"

"$(INTDIR)\PortableGroup\UIPMC_Mcast_Connection_Handler.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\PortableGroup\$(NULL)" mkdir "$(INTDIR)\PortableGroup\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PortableGroup\UIPMC_Mcast_Connection_Handler.obj" $(SOURCE)

SOURCE="PortableGroup\PG_Utils.cpp"

"$(INTDIR)\PortableGroup\PG_Utils.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\PortableGroup\$(NULL)" mkdir "$(INTDIR)\PortableGroup\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PortableGroup\PG_Utils.obj" $(SOURCE)

SOURCE="PortableGroup\PortableGroup_Loader.cpp"

"$(INTDIR)\PortableGroup\PortableGroup_Loader.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\PortableGroup\$(NULL)" mkdir "$(INTDIR)\PortableGroup\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PortableGroup\PortableGroup_Loader.obj" $(SOURCE)

SOURCE="PortableGroup\PG_PropertyManager.cpp"

"$(INTDIR)\PortableGroup\PG_PropertyManager.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\PortableGroup\$(NULL)" mkdir "$(INTDIR)\PortableGroup\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PortableGroup\PG_PropertyManager.obj" $(SOURCE)

SOURCE="PortableGroup\PG_Properties_Encoder.cpp"

"$(INTDIR)\PortableGroup\PG_Properties_Encoder.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\PortableGroup\$(NULL)" mkdir "$(INTDIR)\PortableGroup\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PortableGroup\PG_Properties_Encoder.obj" $(SOURCE)

!IF  "$(CFG)" == "Win64 Debug"
SOURCE="miop.idl"

InputPath=miop.idl

"miopC.inl" "miopS.inl" "miopC.h" "miopS.h" "miopC.cpp" "miopS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-miop_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_PortableGroup_Export -Wb,export_include=orbsvcs/PortableGroup/portablegroup_export.h "$(InputPath)"
<<

SOURCE="PortableGroup_Simple_DS.idl"

InputPath=PortableGroup_Simple_DS.idl

"PortableGroup_Simple_DSC.inl" "PortableGroup_Simple_DSS.inl" "PortableGroup_Simple_DSC.h" "PortableGroup_Simple_DSS.h" "PortableGroup_Simple_DSC.cpp" "PortableGroup_Simple_DSS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-PortableGroup_Simple_DS_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_PortableGroup_Export -Wb,export_include=orbsvcs/PortableGroup/portablegroup_export.h "$(InputPath)"
<<

SOURCE="PortableGroup.idl"

InputPath=PortableGroup.idl

"PortableGroupC.inl" "PortableGroupS.inl" "PortableGroupC.h" "PortableGroupS.h" "PortableGroupC.cpp" "PortableGroupS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-PortableGroup_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_PortableGroup_Export -Wb,export_include=orbsvcs/PortableGroup/portablegroup_export.h -GC "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Release"
SOURCE="miop.idl"

InputPath=miop.idl

"miopC.inl" "miopS.inl" "miopC.h" "miopS.h" "miopC.cpp" "miopS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-miop_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_PortableGroup_Export -Wb,export_include=orbsvcs/PortableGroup/portablegroup_export.h "$(InputPath)"
<<

SOURCE="PortableGroup_Simple_DS.idl"

InputPath=PortableGroup_Simple_DS.idl

"PortableGroup_Simple_DSC.inl" "PortableGroup_Simple_DSS.inl" "PortableGroup_Simple_DSC.h" "PortableGroup_Simple_DSS.h" "PortableGroup_Simple_DSC.cpp" "PortableGroup_Simple_DSS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-PortableGroup_Simple_DS_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_PortableGroup_Export -Wb,export_include=orbsvcs/PortableGroup/portablegroup_export.h "$(InputPath)"
<<

SOURCE="PortableGroup.idl"

InputPath=PortableGroup.idl

"PortableGroupC.inl" "PortableGroupS.inl" "PortableGroupC.h" "PortableGroupS.h" "PortableGroupC.cpp" "PortableGroupS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-PortableGroup_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_PortableGroup_Export -Wb,export_include=orbsvcs/PortableGroup/portablegroup_export.h -GC "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Debug"
SOURCE="miop.idl"

InputPath=miop.idl

"miopC.inl" "miopS.inl" "miopC.h" "miopS.h" "miopC.cpp" "miopS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-miop_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_PortableGroup_Export -Wb,export_include=orbsvcs/PortableGroup/portablegroup_export.h "$(InputPath)"
<<

SOURCE="PortableGroup_Simple_DS.idl"

InputPath=PortableGroup_Simple_DS.idl

"PortableGroup_Simple_DSC.inl" "PortableGroup_Simple_DSS.inl" "PortableGroup_Simple_DSC.h" "PortableGroup_Simple_DSS.h" "PortableGroup_Simple_DSC.cpp" "PortableGroup_Simple_DSS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-PortableGroup_Simple_DS_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_PortableGroup_Export -Wb,export_include=orbsvcs/PortableGroup/portablegroup_export.h "$(InputPath)"
<<

SOURCE="PortableGroup.idl"

InputPath=PortableGroup.idl

"PortableGroupC.inl" "PortableGroupS.inl" "PortableGroupC.h" "PortableGroupS.h" "PortableGroupC.cpp" "PortableGroupS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-PortableGroup_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_PortableGroup_Export -Wb,export_include=orbsvcs/PortableGroup/portablegroup_export.h -GC "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Release"
SOURCE="miop.idl"

InputPath=miop.idl

"miopC.inl" "miopS.inl" "miopC.h" "miopS.h" "miopC.cpp" "miopS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-miop_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_PortableGroup_Export -Wb,export_include=orbsvcs/PortableGroup/portablegroup_export.h "$(InputPath)"
<<

SOURCE="PortableGroup_Simple_DS.idl"

InputPath=PortableGroup_Simple_DS.idl

"PortableGroup_Simple_DSC.inl" "PortableGroup_Simple_DSS.inl" "PortableGroup_Simple_DSC.h" "PortableGroup_Simple_DSS.h" "PortableGroup_Simple_DSC.cpp" "PortableGroup_Simple_DSS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-PortableGroup_Simple_DS_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_PortableGroup_Export -Wb,export_include=orbsvcs/PortableGroup/portablegroup_export.h "$(InputPath)"
<<

SOURCE="PortableGroup.idl"

InputPath=PortableGroup.idl

"PortableGroupC.inl" "PortableGroupS.inl" "PortableGroupC.h" "PortableGroupS.h" "PortableGroupC.cpp" "PortableGroupS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-PortableGroup_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_PortableGroup_Export -Wb,export_include=orbsvcs/PortableGroup/portablegroup_export.h -GC "$(InputPath)"
<<

!ENDIF

SOURCE="PortableGroup.rc"

"$(INTDIR)\PortableGroup.res" : $(SOURCE)
	$(RSC) /l 0x409 /fo"$(INTDIR)\PortableGroup.res" /d NDEBUG /d WIN64 /d _CRT_SECURE_NO_WARNINGS /d _CRT_SECURE_NO_DEPRECATE /d _CRT_NONSTDC_NO_DEPRECATE /i "..\..\.." /i "..\.." /i "..\..\orbsvcs" $(SOURCE)



!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.PortableGroup.dep")
	@echo Using "Makefile.PortableGroup.dep"
!ELSE
	@echo Warning: cannot find "Makefile.PortableGroup.dep"
!ENDIF
!ENDIF

