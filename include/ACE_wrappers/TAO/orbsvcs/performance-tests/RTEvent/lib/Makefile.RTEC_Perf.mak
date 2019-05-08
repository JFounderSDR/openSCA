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
!MESSAGE NMAKE /f "Makefile.RTEC_Perf.mak" CFG="Win64 Debug"
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

GENERATED_DIRTY = "Federated_TestC.inl" "Federated_TestS.inl" "Federated_TestC.h" "Federated_TestS.h" "Federated_TestC.cpp" "Federated_TestS.cpp"

!IF  "$(CFG)" == "Win64 Debug"

OUTDIR=.
INTDIR=Debug\RTEC_Perf\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) ".\TAO_RTEC_Perfd.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\..\..\.." -I"..\..\..\.." -I"..\..\..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_RTEC_PERF_BUILD_DLL -f "Makefile.RTEC_Perf.dep" "Federated_TestC.cpp" "Federated_TestS.cpp" "RTEC_Initializer.cpp" "ORB_Holder.cpp" "RTServer_Setup.cpp" "Supplier.cpp" "Client_Pair.cpp" "RTPOA_Setup.cpp" "Control.cpp" "RTCORBA_Setup.cpp" "PriorityBand_Setup.cpp" "Consumer.cpp" "EC_Destroyer.cpp" "Send_Task.cpp" "ORB_Task.cpp" "ORB_Task_Activator.cpp" "Client_Group.cpp" "Peer_Base.cpp" "Loopback_Supplier.cpp" "Loopback_Pair.cpp" "Send_Task_Stopper.cpp" "Loopback.cpp" "RTClient_Setup.cpp" "ORB_Shutdown.cpp" "RT_Class.cpp" "Loopback_Consumer.cpp" "Client_Options.cpp" "SyncScope_Setup.cpp" "Implicit_Deactivator.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_RTEC_Perfd.pdb"
	-@del /f/q ".\TAO_RTEC_Perfd.dll"
	-@del /f/q "$(OUTDIR)\TAO_RTEC_Perfd.lib"
	-@del /f/q "$(OUTDIR)\TAO_RTEC_Perfd.exp"
	-@del /f/q "$(OUTDIR)\TAO_RTEC_Perfd.ilk"
	-@del /f/q "Federated_TestC.inl"
	-@del /f/q "Federated_TestS.inl"
	-@del /f/q "Federated_TestC.h"
	-@del /f/q "Federated_TestS.h"
	-@del /f/q "Federated_TestC.cpp"
	-@del /f/q "Federated_TestS.cpp"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\RTEC_Perf\$(NULL)" mkdir "Debug\RTEC_Perf"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\..\..\.." /I "..\..\..\.." /I "..\..\..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_RTEC_PERF_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_CodecFactoryd.lib TAO_PId.lib TAO_Strategiesd.lib TAO_PortableServerd.lib TAO_RTCORBAd.lib TAO_RTPortableServerd.lib TAO_Valuetyped.lib TAO_Messagingd.lib TAO_Svc_Utilsd.lib TAO_RTEventd.lib TAO_RTEvent_Skeld.lib TAO_RTEvent_Servd.lib TAO_CosNamingd.lib TAO_RTCORBAEventd.lib /libpath:"." /libpath:"..\..\..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:".\TAO_RTEC_Perfd.pdb" /machine:IA64 /out:".\TAO_RTEC_Perfd.dll" /implib:"$(OUTDIR)\TAO_RTEC_Perfd.lib"
LINK32_OBJS= \
	"$(INTDIR)\Federated_TestC.obj" \
	"$(INTDIR)\Federated_TestS.obj" \
	"$(INTDIR)\RTEC_Initializer.obj" \
	"$(INTDIR)\ORB_Holder.obj" \
	"$(INTDIR)\RTServer_Setup.obj" \
	"$(INTDIR)\Supplier.obj" \
	"$(INTDIR)\Client_Pair.obj" \
	"$(INTDIR)\RTPOA_Setup.obj" \
	"$(INTDIR)\Control.obj" \
	"$(INTDIR)\RTCORBA_Setup.obj" \
	"$(INTDIR)\PriorityBand_Setup.obj" \
	"$(INTDIR)\Consumer.obj" \
	"$(INTDIR)\EC_Destroyer.obj" \
	"$(INTDIR)\Send_Task.obj" \
	"$(INTDIR)\ORB_Task.obj" \
	"$(INTDIR)\ORB_Task_Activator.obj" \
	"$(INTDIR)\Client_Group.obj" \
	"$(INTDIR)\Peer_Base.obj" \
	"$(INTDIR)\Loopback_Supplier.obj" \
	"$(INTDIR)\Loopback_Pair.obj" \
	"$(INTDIR)\Send_Task_Stopper.obj" \
	"$(INTDIR)\Loopback.obj" \
	"$(INTDIR)\RTClient_Setup.obj" \
	"$(INTDIR)\ORB_Shutdown.obj" \
	"$(INTDIR)\RT_Class.obj" \
	"$(INTDIR)\Loopback_Consumer.obj" \
	"$(INTDIR)\Client_Options.obj" \
	"$(INTDIR)\SyncScope_Setup.obj" \
	"$(INTDIR)\Implicit_Deactivator.obj"

".\TAO_RTEC_Perfd.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist ".\TAO_RTEC_Perfd.dll.manifest" mt.exe -manifest ".\TAO_RTEC_Perfd.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=.
INTDIR=Release\RTEC_Perf\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) ".\TAO_RTEC_Perf.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\..\..\.." -I"..\..\..\.." -I"..\..\..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_RTEC_PERF_BUILD_DLL -f "Makefile.RTEC_Perf.dep" "Federated_TestC.cpp" "Federated_TestS.cpp" "RTEC_Initializer.cpp" "ORB_Holder.cpp" "RTServer_Setup.cpp" "Supplier.cpp" "Client_Pair.cpp" "RTPOA_Setup.cpp" "Control.cpp" "RTCORBA_Setup.cpp" "PriorityBand_Setup.cpp" "Consumer.cpp" "EC_Destroyer.cpp" "Send_Task.cpp" "ORB_Task.cpp" "ORB_Task_Activator.cpp" "Client_Group.cpp" "Peer_Base.cpp" "Loopback_Supplier.cpp" "Loopback_Pair.cpp" "Send_Task_Stopper.cpp" "Loopback.cpp" "RTClient_Setup.cpp" "ORB_Shutdown.cpp" "RT_Class.cpp" "Loopback_Consumer.cpp" "Client_Options.cpp" "SyncScope_Setup.cpp" "Implicit_Deactivator.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q ".\TAO_RTEC_Perf.dll"
	-@del /f/q "$(OUTDIR)\TAO_RTEC_Perf.lib"
	-@del /f/q "$(OUTDIR)\TAO_RTEC_Perf.exp"
	-@del /f/q "$(OUTDIR)\TAO_RTEC_Perf.ilk"
	-@del /f/q "Federated_TestC.inl"
	-@del /f/q "Federated_TestS.inl"
	-@del /f/q "Federated_TestC.h"
	-@del /f/q "Federated_TestS.h"
	-@del /f/q "Federated_TestC.cpp"
	-@del /f/q "Federated_TestS.cpp"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\RTEC_Perf\$(NULL)" mkdir "Release\RTEC_Perf"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\..\..\.." /I "..\..\..\.." /I "..\..\..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_RTEC_PERF_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_CodecFactory.lib TAO_PI.lib TAO_Strategies.lib TAO_PortableServer.lib TAO_RTCORBA.lib TAO_RTPortableServer.lib TAO_Valuetype.lib TAO_Messaging.lib TAO_Svc_Utils.lib TAO_RTEvent.lib TAO_RTEvent_Skel.lib TAO_RTEvent_Serv.lib TAO_CosNaming.lib TAO_RTCORBAEvent.lib /libpath:"." /libpath:"..\..\..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:".\TAO_RTEC_Perf.dll" /implib:"$(OUTDIR)\TAO_RTEC_Perf.lib"
LINK32_OBJS= \
	"$(INTDIR)\Federated_TestC.obj" \
	"$(INTDIR)\Federated_TestS.obj" \
	"$(INTDIR)\RTEC_Initializer.obj" \
	"$(INTDIR)\ORB_Holder.obj" \
	"$(INTDIR)\RTServer_Setup.obj" \
	"$(INTDIR)\Supplier.obj" \
	"$(INTDIR)\Client_Pair.obj" \
	"$(INTDIR)\RTPOA_Setup.obj" \
	"$(INTDIR)\Control.obj" \
	"$(INTDIR)\RTCORBA_Setup.obj" \
	"$(INTDIR)\PriorityBand_Setup.obj" \
	"$(INTDIR)\Consumer.obj" \
	"$(INTDIR)\EC_Destroyer.obj" \
	"$(INTDIR)\Send_Task.obj" \
	"$(INTDIR)\ORB_Task.obj" \
	"$(INTDIR)\ORB_Task_Activator.obj" \
	"$(INTDIR)\Client_Group.obj" \
	"$(INTDIR)\Peer_Base.obj" \
	"$(INTDIR)\Loopback_Supplier.obj" \
	"$(INTDIR)\Loopback_Pair.obj" \
	"$(INTDIR)\Send_Task_Stopper.obj" \
	"$(INTDIR)\Loopback.obj" \
	"$(INTDIR)\RTClient_Setup.obj" \
	"$(INTDIR)\ORB_Shutdown.obj" \
	"$(INTDIR)\RT_Class.obj" \
	"$(INTDIR)\Loopback_Consumer.obj" \
	"$(INTDIR)\Client_Options.obj" \
	"$(INTDIR)\SyncScope_Setup.obj" \
	"$(INTDIR)\Implicit_Deactivator.obj"

".\TAO_RTEC_Perf.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist ".\TAO_RTEC_Perf.dll.manifest" mt.exe -manifest ".\TAO_RTEC_Perf.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=.
INTDIR=Static_Debug\RTEC_Perf\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_RTEC_Perfsd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\..\..\.." -I"..\..\..\.." -I"..\..\..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.RTEC_Perf.dep" "Federated_TestC.cpp" "Federated_TestS.cpp" "RTEC_Initializer.cpp" "ORB_Holder.cpp" "RTServer_Setup.cpp" "Supplier.cpp" "Client_Pair.cpp" "RTPOA_Setup.cpp" "Control.cpp" "RTCORBA_Setup.cpp" "PriorityBand_Setup.cpp" "Consumer.cpp" "EC_Destroyer.cpp" "Send_Task.cpp" "ORB_Task.cpp" "ORB_Task_Activator.cpp" "Client_Group.cpp" "Peer_Base.cpp" "Loopback_Supplier.cpp" "Loopback_Pair.cpp" "Send_Task_Stopper.cpp" "Loopback.cpp" "RTClient_Setup.cpp" "ORB_Shutdown.cpp" "RT_Class.cpp" "Loopback_Consumer.cpp" "Client_Options.cpp" "SyncScope_Setup.cpp" "Implicit_Deactivator.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_RTEC_Perfsd.lib"
	-@del /f/q "$(OUTDIR)\TAO_RTEC_Perfsd.exp"
	-@del /f/q "$(OUTDIR)\TAO_RTEC_Perfsd.ilk"
	-@del /f/q ".\TAO_RTEC_Perfsd.pdb"
	-@del /f/q "Federated_TestC.inl"
	-@del /f/q "Federated_TestS.inl"
	-@del /f/q "Federated_TestC.h"
	-@del /f/q "Federated_TestS.h"
	-@del /f/q "Federated_TestC.cpp"
	-@del /f/q "Federated_TestS.cpp"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\RTEC_Perf\$(NULL)" mkdir "Static_Debug\RTEC_Perf"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd".\TAO_RTEC_Perfsd.pdb" /I "..\..\..\..\.." /I "..\..\..\.." /I "..\..\..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:".\TAO_RTEC_Perfsd.lib"
LINK32_OBJS= \
	"$(INTDIR)\Federated_TestC.obj" \
	"$(INTDIR)\Federated_TestS.obj" \
	"$(INTDIR)\RTEC_Initializer.obj" \
	"$(INTDIR)\ORB_Holder.obj" \
	"$(INTDIR)\RTServer_Setup.obj" \
	"$(INTDIR)\Supplier.obj" \
	"$(INTDIR)\Client_Pair.obj" \
	"$(INTDIR)\RTPOA_Setup.obj" \
	"$(INTDIR)\Control.obj" \
	"$(INTDIR)\RTCORBA_Setup.obj" \
	"$(INTDIR)\PriorityBand_Setup.obj" \
	"$(INTDIR)\Consumer.obj" \
	"$(INTDIR)\EC_Destroyer.obj" \
	"$(INTDIR)\Send_Task.obj" \
	"$(INTDIR)\ORB_Task.obj" \
	"$(INTDIR)\ORB_Task_Activator.obj" \
	"$(INTDIR)\Client_Group.obj" \
	"$(INTDIR)\Peer_Base.obj" \
	"$(INTDIR)\Loopback_Supplier.obj" \
	"$(INTDIR)\Loopback_Pair.obj" \
	"$(INTDIR)\Send_Task_Stopper.obj" \
	"$(INTDIR)\Loopback.obj" \
	"$(INTDIR)\RTClient_Setup.obj" \
	"$(INTDIR)\ORB_Shutdown.obj" \
	"$(INTDIR)\RT_Class.obj" \
	"$(INTDIR)\Loopback_Consumer.obj" \
	"$(INTDIR)\Client_Options.obj" \
	"$(INTDIR)\SyncScope_Setup.obj" \
	"$(INTDIR)\Implicit_Deactivator.obj"

"$(OUTDIR)\TAO_RTEC_Perfsd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_RTEC_Perfsd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_RTEC_Perfsd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=.
INTDIR=Static_Release\RTEC_Perf\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_RTEC_Perfs.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\..\..\.." -I"..\..\..\.." -I"..\..\..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.RTEC_Perf.dep" "Federated_TestC.cpp" "Federated_TestS.cpp" "RTEC_Initializer.cpp" "ORB_Holder.cpp" "RTServer_Setup.cpp" "Supplier.cpp" "Client_Pair.cpp" "RTPOA_Setup.cpp" "Control.cpp" "RTCORBA_Setup.cpp" "PriorityBand_Setup.cpp" "Consumer.cpp" "EC_Destroyer.cpp" "Send_Task.cpp" "ORB_Task.cpp" "ORB_Task_Activator.cpp" "Client_Group.cpp" "Peer_Base.cpp" "Loopback_Supplier.cpp" "Loopback_Pair.cpp" "Send_Task_Stopper.cpp" "Loopback.cpp" "RTClient_Setup.cpp" "ORB_Shutdown.cpp" "RT_Class.cpp" "Loopback_Consumer.cpp" "Client_Options.cpp" "SyncScope_Setup.cpp" "Implicit_Deactivator.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_RTEC_Perfs.lib"
	-@del /f/q "$(OUTDIR)\TAO_RTEC_Perfs.exp"
	-@del /f/q "$(OUTDIR)\TAO_RTEC_Perfs.ilk"
	-@del /f/q "Federated_TestC.inl"
	-@del /f/q "Federated_TestS.inl"
	-@del /f/q "Federated_TestC.h"
	-@del /f/q "Federated_TestS.h"
	-@del /f/q "Federated_TestC.cpp"
	-@del /f/q "Federated_TestS.cpp"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\RTEC_Perf\$(NULL)" mkdir "Static_Release\RTEC_Perf"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\..\..\.." /I "..\..\..\.." /I "..\..\..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:".\TAO_RTEC_Perfs.lib"
LINK32_OBJS= \
	"$(INTDIR)\Federated_TestC.obj" \
	"$(INTDIR)\Federated_TestS.obj" \
	"$(INTDIR)\RTEC_Initializer.obj" \
	"$(INTDIR)\ORB_Holder.obj" \
	"$(INTDIR)\RTServer_Setup.obj" \
	"$(INTDIR)\Supplier.obj" \
	"$(INTDIR)\Client_Pair.obj" \
	"$(INTDIR)\RTPOA_Setup.obj" \
	"$(INTDIR)\Control.obj" \
	"$(INTDIR)\RTCORBA_Setup.obj" \
	"$(INTDIR)\PriorityBand_Setup.obj" \
	"$(INTDIR)\Consumer.obj" \
	"$(INTDIR)\EC_Destroyer.obj" \
	"$(INTDIR)\Send_Task.obj" \
	"$(INTDIR)\ORB_Task.obj" \
	"$(INTDIR)\ORB_Task_Activator.obj" \
	"$(INTDIR)\Client_Group.obj" \
	"$(INTDIR)\Peer_Base.obj" \
	"$(INTDIR)\Loopback_Supplier.obj" \
	"$(INTDIR)\Loopback_Pair.obj" \
	"$(INTDIR)\Send_Task_Stopper.obj" \
	"$(INTDIR)\Loopback.obj" \
	"$(INTDIR)\RTClient_Setup.obj" \
	"$(INTDIR)\ORB_Shutdown.obj" \
	"$(INTDIR)\RT_Class.obj" \
	"$(INTDIR)\Loopback_Consumer.obj" \
	"$(INTDIR)\Client_Options.obj" \
	"$(INTDIR)\SyncScope_Setup.obj" \
	"$(INTDIR)\Implicit_Deactivator.obj"

"$(OUTDIR)\TAO_RTEC_Perfs.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_RTEC_Perfs.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_RTEC_Perfs.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.RTEC_Perf.dep")
!INCLUDE "Makefile.RTEC_Perf.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="Federated_TestC.cpp"

"$(INTDIR)\Federated_TestC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Federated_TestC.obj" $(SOURCE)

SOURCE="Federated_TestS.cpp"

"$(INTDIR)\Federated_TestS.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Federated_TestS.obj" $(SOURCE)

SOURCE="RTEC_Initializer.cpp"

"$(INTDIR)\RTEC_Initializer.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RTEC_Initializer.obj" $(SOURCE)

SOURCE="ORB_Holder.cpp"

"$(INTDIR)\ORB_Holder.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ORB_Holder.obj" $(SOURCE)

SOURCE="RTServer_Setup.cpp"

"$(INTDIR)\RTServer_Setup.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RTServer_Setup.obj" $(SOURCE)

SOURCE="Supplier.cpp"

"$(INTDIR)\Supplier.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Supplier.obj" $(SOURCE)

SOURCE="Client_Pair.cpp"

"$(INTDIR)\Client_Pair.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Client_Pair.obj" $(SOURCE)

SOURCE="RTPOA_Setup.cpp"

"$(INTDIR)\RTPOA_Setup.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RTPOA_Setup.obj" $(SOURCE)

SOURCE="Control.cpp"

"$(INTDIR)\Control.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Control.obj" $(SOURCE)

SOURCE="RTCORBA_Setup.cpp"

"$(INTDIR)\RTCORBA_Setup.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RTCORBA_Setup.obj" $(SOURCE)

SOURCE="PriorityBand_Setup.cpp"

"$(INTDIR)\PriorityBand_Setup.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PriorityBand_Setup.obj" $(SOURCE)

SOURCE="Consumer.cpp"

"$(INTDIR)\Consumer.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Consumer.obj" $(SOURCE)

SOURCE="EC_Destroyer.cpp"

"$(INTDIR)\EC_Destroyer.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\EC_Destroyer.obj" $(SOURCE)

SOURCE="Send_Task.cpp"

"$(INTDIR)\Send_Task.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Send_Task.obj" $(SOURCE)

SOURCE="ORB_Task.cpp"

"$(INTDIR)\ORB_Task.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ORB_Task.obj" $(SOURCE)

SOURCE="ORB_Task_Activator.cpp"

"$(INTDIR)\ORB_Task_Activator.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ORB_Task_Activator.obj" $(SOURCE)

SOURCE="Client_Group.cpp"

"$(INTDIR)\Client_Group.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Client_Group.obj" $(SOURCE)

SOURCE="Peer_Base.cpp"

"$(INTDIR)\Peer_Base.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Peer_Base.obj" $(SOURCE)

SOURCE="Loopback_Supplier.cpp"

"$(INTDIR)\Loopback_Supplier.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Loopback_Supplier.obj" $(SOURCE)

SOURCE="Loopback_Pair.cpp"

"$(INTDIR)\Loopback_Pair.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Loopback_Pair.obj" $(SOURCE)

SOURCE="Send_Task_Stopper.cpp"

"$(INTDIR)\Send_Task_Stopper.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Send_Task_Stopper.obj" $(SOURCE)

SOURCE="Loopback.cpp"

"$(INTDIR)\Loopback.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Loopback.obj" $(SOURCE)

SOURCE="RTClient_Setup.cpp"

"$(INTDIR)\RTClient_Setup.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RTClient_Setup.obj" $(SOURCE)

SOURCE="ORB_Shutdown.cpp"

"$(INTDIR)\ORB_Shutdown.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ORB_Shutdown.obj" $(SOURCE)

SOURCE="RT_Class.cpp"

"$(INTDIR)\RT_Class.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RT_Class.obj" $(SOURCE)

SOURCE="Loopback_Consumer.cpp"

"$(INTDIR)\Loopback_Consumer.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Loopback_Consumer.obj" $(SOURCE)

SOURCE="Client_Options.cpp"

"$(INTDIR)\Client_Options.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Client_Options.obj" $(SOURCE)

SOURCE="SyncScope_Setup.cpp"

"$(INTDIR)\SyncScope_Setup.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\SyncScope_Setup.obj" $(SOURCE)

SOURCE="Implicit_Deactivator.cpp"

"$(INTDIR)\Implicit_Deactivator.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Implicit_Deactivator.obj" $(SOURCE)

!IF  "$(CFG)" == "Win64 Debug"
SOURCE="Federated_Test.idl"

InputPath=Federated_Test.idl

"Federated_TestC.inl" "Federated_TestS.inl" "Federated_TestC.h" "Federated_TestS.h" "Federated_TestC.cpp" "Federated_TestS.cpp" : $(SOURCE)  "..\..\..\..\..\bin\tao_idl.exe" "..\..\..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-Federated_Test_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\..\..\lib
	..\..\..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\..\..\.. -I..\..\..\../orbsvcs -Wb,export_macro=TAO_RTEC_Perf_Export -Wb,export_include=rtec_perf_export.h "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Release"
SOURCE="Federated_Test.idl"

InputPath=Federated_Test.idl

"Federated_TestC.inl" "Federated_TestS.inl" "Federated_TestC.h" "Federated_TestS.h" "Federated_TestC.cpp" "Federated_TestS.cpp" : $(SOURCE)  "..\..\..\..\..\bin\tao_idl.exe" "..\..\..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-Federated_Test_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\..\..\lib
	..\..\..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\..\..\.. -I..\..\..\../orbsvcs -Wb,export_macro=TAO_RTEC_Perf_Export -Wb,export_include=rtec_perf_export.h "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Debug"
SOURCE="Federated_Test.idl"

InputPath=Federated_Test.idl

"Federated_TestC.inl" "Federated_TestS.inl" "Federated_TestC.h" "Federated_TestS.h" "Federated_TestC.cpp" "Federated_TestS.cpp" : $(SOURCE)  "..\..\..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-Federated_Test_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\..\..\lib
	..\..\..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\..\..\.. -I..\..\..\../orbsvcs -Wb,export_macro=TAO_RTEC_Perf_Export -Wb,export_include=rtec_perf_export.h "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Release"
SOURCE="Federated_Test.idl"

InputPath=Federated_Test.idl

"Federated_TestC.inl" "Federated_TestS.inl" "Federated_TestC.h" "Federated_TestS.h" "Federated_TestC.cpp" "Federated_TestS.cpp" : $(SOURCE)  "..\..\..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-Federated_Test_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\..\..\lib
	..\..\..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\..\..\.. -I..\..\..\../orbsvcs -Wb,export_macro=TAO_RTEC_Perf_Export -Wb,export_include=rtec_perf_export.h "$(InputPath)"
<<

!ENDIF


!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.RTEC_Perf.dep")
	@echo Using "Makefile.RTEC_Perf.dep"
!ELSE
	@echo Warning: cannot find "Makefile.RTEC_Perf.dep"
!ENDIF
!ENDIF

