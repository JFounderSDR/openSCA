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
!MESSAGE NMAKE /f "Makefile.CosLoadBalancing.mak" CFG="Win64 Debug"
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

GENERATED_DIRTY = "CosLoadBalancingC.inl" "CosLoadBalancingS.inl" "CosLoadBalancingC.h" "CosLoadBalancingS.h" "CosLoadBalancingC.cpp" "CosLoadBalancingS.cpp" "LB_ORTC.inl" "LB_ORTS.inl" "LB_ORTC.h" "LB_ORTS.h" "LB_ORTC.cpp"

!IF  "$(CFG)" == "Win64 Debug"

OUTDIR=..\..\..\lib
INTDIR=Debug\CosLoadBalancing\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_CosLoadBalancingd.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_LOADBALANCING_BUILD_DLL -f "Makefile.CosLoadBalancing.dep" "CosLoadBalancingC.cpp" "CosLoadBalancingS.cpp" "LB_ORTC.cpp" "LoadBalancing\LB_LeastLoaded.cpp" "LoadBalancing\LB_LoadMinimum.cpp" "LoadBalancing\LB_LoadAverage.cpp" "LoadBalancing\LB_LoadAlert.cpp" "LoadBalancing\LB_LoadAlertInfo.cpp" "LoadBalancing\LB_LoadAlert_Handler.cpp" "LoadBalancing\LB_LoadManager.cpp" "LoadBalancing\LB_MemberLocator.cpp" "LoadBalancing\LB_Pull_Handler.cpp" "LoadBalancing\LB_Random.cpp" "LoadBalancing\LB_RoundRobin.cpp" "LoadBalancing\LB_ClientComponent.cpp" "LoadBalancing\LB_ClientORBInitializer.cpp" "LoadBalancing\LB_ClientRequestInterceptor.cpp" "LoadBalancing\LB_ServerRequestInterceptor.cpp" "LoadBalancing\LB_IORInterceptor.cpp" "LoadBalancing\LB_ObjectReferenceFactory.cpp" "LoadBalancing\LB_ORBInitializer.cpp" "LoadBalancing\LB_Component.cpp" "LoadBalancing\LB_CPU_Utilization_Monitor.cpp" "LoadBalancing\LB_CPU_Load_Average_Monitor.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_CosLoadBalancingd.pdb"
	-@del /f/q "..\..\..\lib\TAO_CosLoadBalancingd.dll"
	-@del /f/q "$(OUTDIR)\TAO_CosLoadBalancingd.lib"
	-@del /f/q "$(OUTDIR)\TAO_CosLoadBalancingd.exp"
	-@del /f/q "$(OUTDIR)\TAO_CosLoadBalancingd.ilk"
	-@del /f/q "CosLoadBalancingC.inl"
	-@del /f/q "CosLoadBalancingS.inl"
	-@del /f/q "CosLoadBalancingC.h"
	-@del /f/q "CosLoadBalancingS.h"
	-@del /f/q "CosLoadBalancingC.cpp"
	-@del /f/q "CosLoadBalancingS.cpp"
	-@del /f/q "LB_ORTC.inl"
	-@del /f/q "LB_ORTS.inl"
	-@del /f/q "LB_ORTC.h"
	-@del /f/q "LB_ORTS.h"
	-@del /f/q "LB_ORTC.cpp"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\CosLoadBalancing\$(NULL)" mkdir "Debug\CosLoadBalancing"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_LOADBALANCING_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_CosNamingd.lib TAO_IORManipd.lib TAO_Valuetyped.lib TAO_PortableServerd.lib TAO_CodecFactoryd.lib TAO_PId.lib TAO_Messagingd.lib TAO_PortableGroupd.lib TAO_PI_Serverd.lib TAO_ObjRefTemplated.lib TAO_IORInterceptord.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\..\lib\TAO_CosLoadBalancingd.pdb" /machine:IA64 /out:"..\..\..\lib\TAO_CosLoadBalancingd.dll" /implib:"$(OUTDIR)\TAO_CosLoadBalancingd.lib"
LINK32_OBJS= \
	"$(INTDIR)\CosLoadBalancing.res" \
	"$(INTDIR)\CosLoadBalancingC.obj" \
	"$(INTDIR)\CosLoadBalancingS.obj" \
	"$(INTDIR)\LB_ORTC.obj" \
	"$(INTDIR)\LoadBalancing\LB_LeastLoaded.obj" \
	"$(INTDIR)\LoadBalancing\LB_LoadMinimum.obj" \
	"$(INTDIR)\LoadBalancing\LB_LoadAverage.obj" \
	"$(INTDIR)\LoadBalancing\LB_LoadAlert.obj" \
	"$(INTDIR)\LoadBalancing\LB_LoadAlertInfo.obj" \
	"$(INTDIR)\LoadBalancing\LB_LoadAlert_Handler.obj" \
	"$(INTDIR)\LoadBalancing\LB_LoadManager.obj" \
	"$(INTDIR)\LoadBalancing\LB_MemberLocator.obj" \
	"$(INTDIR)\LoadBalancing\LB_Pull_Handler.obj" \
	"$(INTDIR)\LoadBalancing\LB_Random.obj" \
	"$(INTDIR)\LoadBalancing\LB_RoundRobin.obj" \
	"$(INTDIR)\LoadBalancing\LB_ClientComponent.obj" \
	"$(INTDIR)\LoadBalancing\LB_ClientORBInitializer.obj" \
	"$(INTDIR)\LoadBalancing\LB_ClientRequestInterceptor.obj" \
	"$(INTDIR)\LoadBalancing\LB_ServerRequestInterceptor.obj" \
	"$(INTDIR)\LoadBalancing\LB_IORInterceptor.obj" \
	"$(INTDIR)\LoadBalancing\LB_ObjectReferenceFactory.obj" \
	"$(INTDIR)\LoadBalancing\LB_ORBInitializer.obj" \
	"$(INTDIR)\LoadBalancing\LB_Component.obj" \
	"$(INTDIR)\LoadBalancing\LB_CPU_Utilization_Monitor.obj" \
	"$(INTDIR)\LoadBalancing\LB_CPU_Load_Average_Monitor.obj"

"..\..\..\lib\TAO_CosLoadBalancingd.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_CosLoadBalancingd.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_CosLoadBalancingd.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\CosLoadBalancing\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_CosLoadBalancing.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_LOADBALANCING_BUILD_DLL -f "Makefile.CosLoadBalancing.dep" "CosLoadBalancingC.cpp" "CosLoadBalancingS.cpp" "LB_ORTC.cpp" "LoadBalancing\LB_LeastLoaded.cpp" "LoadBalancing\LB_LoadMinimum.cpp" "LoadBalancing\LB_LoadAverage.cpp" "LoadBalancing\LB_LoadAlert.cpp" "LoadBalancing\LB_LoadAlertInfo.cpp" "LoadBalancing\LB_LoadAlert_Handler.cpp" "LoadBalancing\LB_LoadManager.cpp" "LoadBalancing\LB_MemberLocator.cpp" "LoadBalancing\LB_Pull_Handler.cpp" "LoadBalancing\LB_Random.cpp" "LoadBalancing\LB_RoundRobin.cpp" "LoadBalancing\LB_ClientComponent.cpp" "LoadBalancing\LB_ClientORBInitializer.cpp" "LoadBalancing\LB_ClientRequestInterceptor.cpp" "LoadBalancing\LB_ServerRequestInterceptor.cpp" "LoadBalancing\LB_IORInterceptor.cpp" "LoadBalancing\LB_ObjectReferenceFactory.cpp" "LoadBalancing\LB_ORBInitializer.cpp" "LoadBalancing\LB_Component.cpp" "LoadBalancing\LB_CPU_Utilization_Monitor.cpp" "LoadBalancing\LB_CPU_Load_Average_Monitor.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\TAO_CosLoadBalancing.dll"
	-@del /f/q "$(OUTDIR)\TAO_CosLoadBalancing.lib"
	-@del /f/q "$(OUTDIR)\TAO_CosLoadBalancing.exp"
	-@del /f/q "$(OUTDIR)\TAO_CosLoadBalancing.ilk"
	-@del /f/q "CosLoadBalancingC.inl"
	-@del /f/q "CosLoadBalancingS.inl"
	-@del /f/q "CosLoadBalancingC.h"
	-@del /f/q "CosLoadBalancingS.h"
	-@del /f/q "CosLoadBalancingC.cpp"
	-@del /f/q "CosLoadBalancingS.cpp"
	-@del /f/q "LB_ORTC.inl"
	-@del /f/q "LB_ORTS.inl"
	-@del /f/q "LB_ORTC.h"
	-@del /f/q "LB_ORTS.h"
	-@del /f/q "LB_ORTC.cpp"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\CosLoadBalancing\$(NULL)" mkdir "Release\CosLoadBalancing"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_LOADBALANCING_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_CosNaming.lib TAO_IORManip.lib TAO_Valuetype.lib TAO_PortableServer.lib TAO_CodecFactory.lib TAO_PI.lib TAO_Messaging.lib TAO_PortableGroup.lib TAO_PI_Server.lib TAO_ObjRefTemplate.lib TAO_IORInterceptor.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\..\lib\TAO_CosLoadBalancing.dll" /implib:"$(OUTDIR)\TAO_CosLoadBalancing.lib"
LINK32_OBJS= \
	"$(INTDIR)\CosLoadBalancing.res" \
	"$(INTDIR)\CosLoadBalancingC.obj" \
	"$(INTDIR)\CosLoadBalancingS.obj" \
	"$(INTDIR)\LB_ORTC.obj" \
	"$(INTDIR)\LoadBalancing\LB_LeastLoaded.obj" \
	"$(INTDIR)\LoadBalancing\LB_LoadMinimum.obj" \
	"$(INTDIR)\LoadBalancing\LB_LoadAverage.obj" \
	"$(INTDIR)\LoadBalancing\LB_LoadAlert.obj" \
	"$(INTDIR)\LoadBalancing\LB_LoadAlertInfo.obj" \
	"$(INTDIR)\LoadBalancing\LB_LoadAlert_Handler.obj" \
	"$(INTDIR)\LoadBalancing\LB_LoadManager.obj" \
	"$(INTDIR)\LoadBalancing\LB_MemberLocator.obj" \
	"$(INTDIR)\LoadBalancing\LB_Pull_Handler.obj" \
	"$(INTDIR)\LoadBalancing\LB_Random.obj" \
	"$(INTDIR)\LoadBalancing\LB_RoundRobin.obj" \
	"$(INTDIR)\LoadBalancing\LB_ClientComponent.obj" \
	"$(INTDIR)\LoadBalancing\LB_ClientORBInitializer.obj" \
	"$(INTDIR)\LoadBalancing\LB_ClientRequestInterceptor.obj" \
	"$(INTDIR)\LoadBalancing\LB_ServerRequestInterceptor.obj" \
	"$(INTDIR)\LoadBalancing\LB_IORInterceptor.obj" \
	"$(INTDIR)\LoadBalancing\LB_ObjectReferenceFactory.obj" \
	"$(INTDIR)\LoadBalancing\LB_ORBInitializer.obj" \
	"$(INTDIR)\LoadBalancing\LB_Component.obj" \
	"$(INTDIR)\LoadBalancing\LB_CPU_Utilization_Monitor.obj" \
	"$(INTDIR)\LoadBalancing\LB_CPU_Load_Average_Monitor.obj"

"..\..\..\lib\TAO_CosLoadBalancing.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_CosLoadBalancing.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_CosLoadBalancing.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\CosLoadBalancing\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_CosLoadBalancingsd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.CosLoadBalancing.dep" "CosLoadBalancingC.cpp" "CosLoadBalancingS.cpp" "LB_ORTC.cpp" "LoadBalancing\LB_LeastLoaded.cpp" "LoadBalancing\LB_LoadMinimum.cpp" "LoadBalancing\LB_LoadAverage.cpp" "LoadBalancing\LB_LoadAlert.cpp" "LoadBalancing\LB_LoadAlertInfo.cpp" "LoadBalancing\LB_LoadAlert_Handler.cpp" "LoadBalancing\LB_LoadManager.cpp" "LoadBalancing\LB_MemberLocator.cpp" "LoadBalancing\LB_Pull_Handler.cpp" "LoadBalancing\LB_Random.cpp" "LoadBalancing\LB_RoundRobin.cpp" "LoadBalancing\LB_ClientComponent.cpp" "LoadBalancing\LB_ClientORBInitializer.cpp" "LoadBalancing\LB_ClientRequestInterceptor.cpp" "LoadBalancing\LB_ServerRequestInterceptor.cpp" "LoadBalancing\LB_IORInterceptor.cpp" "LoadBalancing\LB_ObjectReferenceFactory.cpp" "LoadBalancing\LB_ORBInitializer.cpp" "LoadBalancing\LB_Component.cpp" "LoadBalancing\LB_CPU_Utilization_Monitor.cpp" "LoadBalancing\LB_CPU_Load_Average_Monitor.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_CosLoadBalancingsd.lib"
	-@del /f/q "$(OUTDIR)\TAO_CosLoadBalancingsd.exp"
	-@del /f/q "$(OUTDIR)\TAO_CosLoadBalancingsd.ilk"
	-@del /f/q "..\..\..\lib\TAO_CosLoadBalancingsd.pdb"
	-@del /f/q "CosLoadBalancingC.inl"
	-@del /f/q "CosLoadBalancingS.inl"
	-@del /f/q "CosLoadBalancingC.h"
	-@del /f/q "CosLoadBalancingS.h"
	-@del /f/q "CosLoadBalancingC.cpp"
	-@del /f/q "CosLoadBalancingS.cpp"
	-@del /f/q "LB_ORTC.inl"
	-@del /f/q "LB_ORTS.inl"
	-@del /f/q "LB_ORTC.h"
	-@del /f/q "LB_ORTS.h"
	-@del /f/q "LB_ORTC.cpp"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\CosLoadBalancing\$(NULL)" mkdir "Static_Debug\CosLoadBalancing"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\TAO_CosLoadBalancingsd.pdb" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_CosLoadBalancingsd.lib"
LINK32_OBJS= \
	"$(INTDIR)\CosLoadBalancingC.obj" \
	"$(INTDIR)\CosLoadBalancingS.obj" \
	"$(INTDIR)\LB_ORTC.obj" \
	"$(INTDIR)\LoadBalancing\LB_LeastLoaded.obj" \
	"$(INTDIR)\LoadBalancing\LB_LoadMinimum.obj" \
	"$(INTDIR)\LoadBalancing\LB_LoadAverage.obj" \
	"$(INTDIR)\LoadBalancing\LB_LoadAlert.obj" \
	"$(INTDIR)\LoadBalancing\LB_LoadAlertInfo.obj" \
	"$(INTDIR)\LoadBalancing\LB_LoadAlert_Handler.obj" \
	"$(INTDIR)\LoadBalancing\LB_LoadManager.obj" \
	"$(INTDIR)\LoadBalancing\LB_MemberLocator.obj" \
	"$(INTDIR)\LoadBalancing\LB_Pull_Handler.obj" \
	"$(INTDIR)\LoadBalancing\LB_Random.obj" \
	"$(INTDIR)\LoadBalancing\LB_RoundRobin.obj" \
	"$(INTDIR)\LoadBalancing\LB_ClientComponent.obj" \
	"$(INTDIR)\LoadBalancing\LB_ClientORBInitializer.obj" \
	"$(INTDIR)\LoadBalancing\LB_ClientRequestInterceptor.obj" \
	"$(INTDIR)\LoadBalancing\LB_ServerRequestInterceptor.obj" \
	"$(INTDIR)\LoadBalancing\LB_IORInterceptor.obj" \
	"$(INTDIR)\LoadBalancing\LB_ObjectReferenceFactory.obj" \
	"$(INTDIR)\LoadBalancing\LB_ORBInitializer.obj" \
	"$(INTDIR)\LoadBalancing\LB_Component.obj" \
	"$(INTDIR)\LoadBalancing\LB_CPU_Utilization_Monitor.obj" \
	"$(INTDIR)\LoadBalancing\LB_CPU_Load_Average_Monitor.obj"

"$(OUTDIR)\TAO_CosLoadBalancingsd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_CosLoadBalancingsd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_CosLoadBalancingsd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\CosLoadBalancing\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_CosLoadBalancings.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.CosLoadBalancing.dep" "CosLoadBalancingC.cpp" "CosLoadBalancingS.cpp" "LB_ORTC.cpp" "LoadBalancing\LB_LeastLoaded.cpp" "LoadBalancing\LB_LoadMinimum.cpp" "LoadBalancing\LB_LoadAverage.cpp" "LoadBalancing\LB_LoadAlert.cpp" "LoadBalancing\LB_LoadAlertInfo.cpp" "LoadBalancing\LB_LoadAlert_Handler.cpp" "LoadBalancing\LB_LoadManager.cpp" "LoadBalancing\LB_MemberLocator.cpp" "LoadBalancing\LB_Pull_Handler.cpp" "LoadBalancing\LB_Random.cpp" "LoadBalancing\LB_RoundRobin.cpp" "LoadBalancing\LB_ClientComponent.cpp" "LoadBalancing\LB_ClientORBInitializer.cpp" "LoadBalancing\LB_ClientRequestInterceptor.cpp" "LoadBalancing\LB_ServerRequestInterceptor.cpp" "LoadBalancing\LB_IORInterceptor.cpp" "LoadBalancing\LB_ObjectReferenceFactory.cpp" "LoadBalancing\LB_ORBInitializer.cpp" "LoadBalancing\LB_Component.cpp" "LoadBalancing\LB_CPU_Utilization_Monitor.cpp" "LoadBalancing\LB_CPU_Load_Average_Monitor.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_CosLoadBalancings.lib"
	-@del /f/q "$(OUTDIR)\TAO_CosLoadBalancings.exp"
	-@del /f/q "$(OUTDIR)\TAO_CosLoadBalancings.ilk"
	-@del /f/q "CosLoadBalancingC.inl"
	-@del /f/q "CosLoadBalancingS.inl"
	-@del /f/q "CosLoadBalancingC.h"
	-@del /f/q "CosLoadBalancingS.h"
	-@del /f/q "CosLoadBalancingC.cpp"
	-@del /f/q "CosLoadBalancingS.cpp"
	-@del /f/q "LB_ORTC.inl"
	-@del /f/q "LB_ORTS.inl"
	-@del /f/q "LB_ORTC.h"
	-@del /f/q "LB_ORTS.h"
	-@del /f/q "LB_ORTC.cpp"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\CosLoadBalancing\$(NULL)" mkdir "Static_Release\CosLoadBalancing"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_CosLoadBalancings.lib"
LINK32_OBJS= \
	"$(INTDIR)\CosLoadBalancingC.obj" \
	"$(INTDIR)\CosLoadBalancingS.obj" \
	"$(INTDIR)\LB_ORTC.obj" \
	"$(INTDIR)\LoadBalancing\LB_LeastLoaded.obj" \
	"$(INTDIR)\LoadBalancing\LB_LoadMinimum.obj" \
	"$(INTDIR)\LoadBalancing\LB_LoadAverage.obj" \
	"$(INTDIR)\LoadBalancing\LB_LoadAlert.obj" \
	"$(INTDIR)\LoadBalancing\LB_LoadAlertInfo.obj" \
	"$(INTDIR)\LoadBalancing\LB_LoadAlert_Handler.obj" \
	"$(INTDIR)\LoadBalancing\LB_LoadManager.obj" \
	"$(INTDIR)\LoadBalancing\LB_MemberLocator.obj" \
	"$(INTDIR)\LoadBalancing\LB_Pull_Handler.obj" \
	"$(INTDIR)\LoadBalancing\LB_Random.obj" \
	"$(INTDIR)\LoadBalancing\LB_RoundRobin.obj" \
	"$(INTDIR)\LoadBalancing\LB_ClientComponent.obj" \
	"$(INTDIR)\LoadBalancing\LB_ClientORBInitializer.obj" \
	"$(INTDIR)\LoadBalancing\LB_ClientRequestInterceptor.obj" \
	"$(INTDIR)\LoadBalancing\LB_ServerRequestInterceptor.obj" \
	"$(INTDIR)\LoadBalancing\LB_IORInterceptor.obj" \
	"$(INTDIR)\LoadBalancing\LB_ObjectReferenceFactory.obj" \
	"$(INTDIR)\LoadBalancing\LB_ORBInitializer.obj" \
	"$(INTDIR)\LoadBalancing\LB_Component.obj" \
	"$(INTDIR)\LoadBalancing\LB_CPU_Utilization_Monitor.obj" \
	"$(INTDIR)\LoadBalancing\LB_CPU_Load_Average_Monitor.obj"

"$(OUTDIR)\TAO_CosLoadBalancings.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_CosLoadBalancings.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_CosLoadBalancings.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.CosLoadBalancing.dep")
!INCLUDE "Makefile.CosLoadBalancing.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="CosLoadBalancingC.cpp"

"$(INTDIR)\CosLoadBalancingC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\CosLoadBalancingC.obj" $(SOURCE)

SOURCE="CosLoadBalancingS.cpp"

"$(INTDIR)\CosLoadBalancingS.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\CosLoadBalancingS.obj" $(SOURCE)

SOURCE="LB_ORTC.cpp"

"$(INTDIR)\LB_ORTC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LB_ORTC.obj" $(SOURCE)

SOURCE="LoadBalancing\LB_LeastLoaded.cpp"

"$(INTDIR)\LoadBalancing\LB_LeastLoaded.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\LoadBalancing\$(NULL)" mkdir "$(INTDIR)\LoadBalancing\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LoadBalancing\LB_LeastLoaded.obj" $(SOURCE)

SOURCE="LoadBalancing\LB_LoadMinimum.cpp"

"$(INTDIR)\LoadBalancing\LB_LoadMinimum.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\LoadBalancing\$(NULL)" mkdir "$(INTDIR)\LoadBalancing\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LoadBalancing\LB_LoadMinimum.obj" $(SOURCE)

SOURCE="LoadBalancing\LB_LoadAverage.cpp"

"$(INTDIR)\LoadBalancing\LB_LoadAverage.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\LoadBalancing\$(NULL)" mkdir "$(INTDIR)\LoadBalancing\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LoadBalancing\LB_LoadAverage.obj" $(SOURCE)

SOURCE="LoadBalancing\LB_LoadAlert.cpp"

"$(INTDIR)\LoadBalancing\LB_LoadAlert.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\LoadBalancing\$(NULL)" mkdir "$(INTDIR)\LoadBalancing\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LoadBalancing\LB_LoadAlert.obj" $(SOURCE)

SOURCE="LoadBalancing\LB_LoadAlertInfo.cpp"

"$(INTDIR)\LoadBalancing\LB_LoadAlertInfo.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\LoadBalancing\$(NULL)" mkdir "$(INTDIR)\LoadBalancing\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LoadBalancing\LB_LoadAlertInfo.obj" $(SOURCE)

SOURCE="LoadBalancing\LB_LoadAlert_Handler.cpp"

"$(INTDIR)\LoadBalancing\LB_LoadAlert_Handler.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\LoadBalancing\$(NULL)" mkdir "$(INTDIR)\LoadBalancing\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LoadBalancing\LB_LoadAlert_Handler.obj" $(SOURCE)

SOURCE="LoadBalancing\LB_LoadManager.cpp"

"$(INTDIR)\LoadBalancing\LB_LoadManager.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\LoadBalancing\$(NULL)" mkdir "$(INTDIR)\LoadBalancing\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LoadBalancing\LB_LoadManager.obj" $(SOURCE)

SOURCE="LoadBalancing\LB_MemberLocator.cpp"

"$(INTDIR)\LoadBalancing\LB_MemberLocator.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\LoadBalancing\$(NULL)" mkdir "$(INTDIR)\LoadBalancing\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LoadBalancing\LB_MemberLocator.obj" $(SOURCE)

SOURCE="LoadBalancing\LB_Pull_Handler.cpp"

"$(INTDIR)\LoadBalancing\LB_Pull_Handler.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\LoadBalancing\$(NULL)" mkdir "$(INTDIR)\LoadBalancing\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LoadBalancing\LB_Pull_Handler.obj" $(SOURCE)

SOURCE="LoadBalancing\LB_Random.cpp"

"$(INTDIR)\LoadBalancing\LB_Random.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\LoadBalancing\$(NULL)" mkdir "$(INTDIR)\LoadBalancing\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LoadBalancing\LB_Random.obj" $(SOURCE)

SOURCE="LoadBalancing\LB_RoundRobin.cpp"

"$(INTDIR)\LoadBalancing\LB_RoundRobin.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\LoadBalancing\$(NULL)" mkdir "$(INTDIR)\LoadBalancing\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LoadBalancing\LB_RoundRobin.obj" $(SOURCE)

SOURCE="LoadBalancing\LB_ClientComponent.cpp"

"$(INTDIR)\LoadBalancing\LB_ClientComponent.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\LoadBalancing\$(NULL)" mkdir "$(INTDIR)\LoadBalancing\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LoadBalancing\LB_ClientComponent.obj" $(SOURCE)

SOURCE="LoadBalancing\LB_ClientORBInitializer.cpp"

"$(INTDIR)\LoadBalancing\LB_ClientORBInitializer.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\LoadBalancing\$(NULL)" mkdir "$(INTDIR)\LoadBalancing\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LoadBalancing\LB_ClientORBInitializer.obj" $(SOURCE)

SOURCE="LoadBalancing\LB_ClientRequestInterceptor.cpp"

"$(INTDIR)\LoadBalancing\LB_ClientRequestInterceptor.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\LoadBalancing\$(NULL)" mkdir "$(INTDIR)\LoadBalancing\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LoadBalancing\LB_ClientRequestInterceptor.obj" $(SOURCE)

SOURCE="LoadBalancing\LB_ServerRequestInterceptor.cpp"

"$(INTDIR)\LoadBalancing\LB_ServerRequestInterceptor.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\LoadBalancing\$(NULL)" mkdir "$(INTDIR)\LoadBalancing\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LoadBalancing\LB_ServerRequestInterceptor.obj" $(SOURCE)

SOURCE="LoadBalancing\LB_IORInterceptor.cpp"

"$(INTDIR)\LoadBalancing\LB_IORInterceptor.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\LoadBalancing\$(NULL)" mkdir "$(INTDIR)\LoadBalancing\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LoadBalancing\LB_IORInterceptor.obj" $(SOURCE)

SOURCE="LoadBalancing\LB_ObjectReferenceFactory.cpp"

"$(INTDIR)\LoadBalancing\LB_ObjectReferenceFactory.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\LoadBalancing\$(NULL)" mkdir "$(INTDIR)\LoadBalancing\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LoadBalancing\LB_ObjectReferenceFactory.obj" $(SOURCE)

SOURCE="LoadBalancing\LB_ORBInitializer.cpp"

"$(INTDIR)\LoadBalancing\LB_ORBInitializer.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\LoadBalancing\$(NULL)" mkdir "$(INTDIR)\LoadBalancing\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LoadBalancing\LB_ORBInitializer.obj" $(SOURCE)

SOURCE="LoadBalancing\LB_Component.cpp"

"$(INTDIR)\LoadBalancing\LB_Component.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\LoadBalancing\$(NULL)" mkdir "$(INTDIR)\LoadBalancing\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LoadBalancing\LB_Component.obj" $(SOURCE)

SOURCE="LoadBalancing\LB_CPU_Utilization_Monitor.cpp"

"$(INTDIR)\LoadBalancing\LB_CPU_Utilization_Monitor.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\LoadBalancing\$(NULL)" mkdir "$(INTDIR)\LoadBalancing\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LoadBalancing\LB_CPU_Utilization_Monitor.obj" $(SOURCE)

SOURCE="LoadBalancing\LB_CPU_Load_Average_Monitor.cpp"

"$(INTDIR)\LoadBalancing\LB_CPU_Load_Average_Monitor.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\LoadBalancing\$(NULL)" mkdir "$(INTDIR)\LoadBalancing\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LoadBalancing\LB_CPU_Load_Average_Monitor.obj" $(SOURCE)

!IF  "$(CFG)" == "Win64 Debug"
SOURCE="CosLoadBalancing.idl"

InputPath=CosLoadBalancing.idl

"CosLoadBalancingC.inl" "CosLoadBalancingS.inl" "CosLoadBalancingC.h" "CosLoadBalancingS.h" "CosLoadBalancingC.cpp" "CosLoadBalancingS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-CosLoadBalancing_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -GC -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_LoadBalancing_Export -Wb,export_include=orbsvcs/LoadBalancing/LoadBalancing_export.h "$(InputPath)"
<<

SOURCE="LB_ORT.idl"

InputPath=LB_ORT.idl

"LB_ORTC.inl" "LB_ORTS.inl" "LB_ORTC.h" "LB_ORTS.h" "LB_ORTC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-LB_ORT_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -GC -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_LoadBalancing_Export -Wb,export_include=orbsvcs/LoadBalancing/LoadBalancing_export.h "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Release"
SOURCE="CosLoadBalancing.idl"

InputPath=CosLoadBalancing.idl

"CosLoadBalancingC.inl" "CosLoadBalancingS.inl" "CosLoadBalancingC.h" "CosLoadBalancingS.h" "CosLoadBalancingC.cpp" "CosLoadBalancingS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-CosLoadBalancing_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -GC -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_LoadBalancing_Export -Wb,export_include=orbsvcs/LoadBalancing/LoadBalancing_export.h "$(InputPath)"
<<

SOURCE="LB_ORT.idl"

InputPath=LB_ORT.idl

"LB_ORTC.inl" "LB_ORTS.inl" "LB_ORTC.h" "LB_ORTS.h" "LB_ORTC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-LB_ORT_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -GC -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_LoadBalancing_Export -Wb,export_include=orbsvcs/LoadBalancing/LoadBalancing_export.h "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Debug"
SOURCE="CosLoadBalancing.idl"

InputPath=CosLoadBalancing.idl

"CosLoadBalancingC.inl" "CosLoadBalancingS.inl" "CosLoadBalancingC.h" "CosLoadBalancingS.h" "CosLoadBalancingC.cpp" "CosLoadBalancingS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-CosLoadBalancing_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -GC -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_LoadBalancing_Export -Wb,export_include=orbsvcs/LoadBalancing/LoadBalancing_export.h "$(InputPath)"
<<

SOURCE="LB_ORT.idl"

InputPath=LB_ORT.idl

"LB_ORTC.inl" "LB_ORTS.inl" "LB_ORTC.h" "LB_ORTS.h" "LB_ORTC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-LB_ORT_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -GC -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_LoadBalancing_Export -Wb,export_include=orbsvcs/LoadBalancing/LoadBalancing_export.h "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Release"
SOURCE="CosLoadBalancing.idl"

InputPath=CosLoadBalancing.idl

"CosLoadBalancingC.inl" "CosLoadBalancingS.inl" "CosLoadBalancingC.h" "CosLoadBalancingS.h" "CosLoadBalancingC.cpp" "CosLoadBalancingS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-CosLoadBalancing_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -GC -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_LoadBalancing_Export -Wb,export_include=orbsvcs/LoadBalancing/LoadBalancing_export.h "$(InputPath)"
<<

SOURCE="LB_ORT.idl"

InputPath=LB_ORT.idl

"LB_ORTC.inl" "LB_ORTS.inl" "LB_ORTC.h" "LB_ORTS.h" "LB_ORTC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-LB_ORT_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -GC -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_LoadBalancing_Export -Wb,export_include=orbsvcs/LoadBalancing/LoadBalancing_export.h "$(InputPath)"
<<

!ENDIF

SOURCE="CosLoadBalancing.rc"

"$(INTDIR)\CosLoadBalancing.res" : $(SOURCE)
	$(RSC) /l 0x409 /fo"$(INTDIR)\CosLoadBalancing.res" /d NDEBUG /d WIN64 /d _CRT_SECURE_NO_WARNINGS /d _CRT_SECURE_NO_DEPRECATE /d _CRT_NONSTDC_NO_DEPRECATE /i "..\..\.." /i "..\.." /i "..\..\orbsvcs" $(SOURCE)



!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.CosLoadBalancing.dep")
	@echo Using "Makefile.CosLoadBalancing.dep"
!ELSE
	@echo Warning: cannot find "Makefile.CosLoadBalancing.dep"
!ENDIF
!ENDIF

