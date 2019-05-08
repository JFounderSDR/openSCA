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
!MESSAGE NMAKE /f "Makefile.FaultTolerance.mak" CFG="Win64 Debug"
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

GENERATED_DIRTY = "FT_CORBAC.inl" "FT_CORBAS.inl" "FT_CORBAC.h" "FT_CORBAS.h" "FT_CORBAC.cpp" "FT_CORBAS.cpp" "FT_ReplicaC.inl" "FT_ReplicaS.inl" "FT_ReplicaC.h" "FT_ReplicaS.h" "FT_ReplicaC.cpp" "FT_ReplicaS.cpp" "FT_NotifierC.inl" "FT_NotifierS.inl" "FT_NotifierC.h" "FT_NotifierS.h" "FT_NotifierC.cpp" "FT_NotifierS.cpp" "FT_FaultDetectorFactoryC.inl" "FT_FaultDetectorFactoryS.inl" "FT_FaultDetectorFactoryC.h" "FT_FaultDetectorFactoryS.h" "FT_FaultDetectorFactoryC.cpp" "FT_FaultDetectorFactoryS.cpp" "FT_ReplicationManagerC.inl" "FT_ReplicationManagerS.inl" "FT_ReplicationManagerC.h" "FT_ReplicationManagerS.h" "FT_ReplicationManagerC.cpp" "FT_ReplicationManagerS.cpp"

!IF  "$(CFG)" == "Win64 Debug"

OUTDIR=..\..\..\lib
INTDIR=Debug\FaultTolerance\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_FaultToleranced.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -DTAO_FT_BUILD_DLL -f "Makefile.FaultTolerance.dep" "FT_CORBAS.cpp" "FT_CORBAC.cpp" "FT_ReplicaS.cpp" "FT_ReplicaC.cpp" "FT_NotifierS.cpp" "FT_NotifierC.cpp" "FT_FaultDetectorFactoryS.cpp" "FT_FaultDetectorFactoryC.cpp" "FT_ReplicationManagerS.cpp" "FT_ReplicationManagerC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_FaultToleranced.pdb"
	-@del /f/q "..\..\..\lib\TAO_FaultToleranced.dll"
	-@del /f/q "$(OUTDIR)\TAO_FaultToleranced.lib"
	-@del /f/q "$(OUTDIR)\TAO_FaultToleranced.exp"
	-@del /f/q "$(OUTDIR)\TAO_FaultToleranced.ilk"
	-@del /f/q "FT_CORBAC.inl"
	-@del /f/q "FT_CORBAS.inl"
	-@del /f/q "FT_CORBAC.h"
	-@del /f/q "FT_CORBAS.h"
	-@del /f/q "FT_CORBAC.cpp"
	-@del /f/q "FT_CORBAS.cpp"
	-@del /f/q "FT_ReplicaC.inl"
	-@del /f/q "FT_ReplicaS.inl"
	-@del /f/q "FT_ReplicaC.h"
	-@del /f/q "FT_ReplicaS.h"
	-@del /f/q "FT_ReplicaC.cpp"
	-@del /f/q "FT_ReplicaS.cpp"
	-@del /f/q "FT_NotifierC.inl"
	-@del /f/q "FT_NotifierS.inl"
	-@del /f/q "FT_NotifierC.h"
	-@del /f/q "FT_NotifierS.h"
	-@del /f/q "FT_NotifierC.cpp"
	-@del /f/q "FT_NotifierS.cpp"
	-@del /f/q "FT_FaultDetectorFactoryC.inl"
	-@del /f/q "FT_FaultDetectorFactoryS.inl"
	-@del /f/q "FT_FaultDetectorFactoryC.h"
	-@del /f/q "FT_FaultDetectorFactoryS.h"
	-@del /f/q "FT_FaultDetectorFactoryC.cpp"
	-@del /f/q "FT_FaultDetectorFactoryS.cpp"
	-@del /f/q "FT_ReplicationManagerC.inl"
	-@del /f/q "FT_ReplicationManagerS.inl"
	-@del /f/q "FT_ReplicationManagerC.h"
	-@del /f/q "FT_ReplicationManagerS.h"
	-@del /f/q "FT_ReplicationManagerC.cpp"
	-@del /f/q "FT_ReplicationManagerS.cpp"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\FaultTolerance\$(NULL)" mkdir "Debug\FaultTolerance"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D TAO_FT_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_CodecFactoryd.lib TAO_PId.lib TAO_PortableServerd.lib TAO_PI_Serverd.lib TAO_CosEventd.lib TAO_CosNotificationd.lib TAO_IORManipd.lib TAO_CosNamingd.lib TAO_Valuetyped.lib TAO_Messagingd.lib TAO_PortableGroupd.lib TAO_FTORB_Utilsd.lib TAO_FT_ClientORBd.lib TAO_FT_ServerORBd.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\..\lib\TAO_FaultToleranced.pdb" /machine:IA64 /out:"..\..\..\lib\TAO_FaultToleranced.dll" /implib:"$(OUTDIR)\TAO_FaultToleranced.lib"
LINK32_OBJS= \
	"$(INTDIR)\FaultTolerance.res" \
	"$(INTDIR)\FT_CORBAS.obj" \
	"$(INTDIR)\FT_CORBAC.obj" \
	"$(INTDIR)\FT_ReplicaS.obj" \
	"$(INTDIR)\FT_ReplicaC.obj" \
	"$(INTDIR)\FT_NotifierS.obj" \
	"$(INTDIR)\FT_NotifierC.obj" \
	"$(INTDIR)\FT_FaultDetectorFactoryS.obj" \
	"$(INTDIR)\FT_FaultDetectorFactoryC.obj" \
	"$(INTDIR)\FT_ReplicationManagerS.obj" \
	"$(INTDIR)\FT_ReplicationManagerC.obj"

"..\..\..\lib\TAO_FaultToleranced.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_FaultToleranced.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_FaultToleranced.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\FaultTolerance\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_FaultTolerance.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -DTAO_FT_BUILD_DLL -f "Makefile.FaultTolerance.dep" "FT_CORBAS.cpp" "FT_CORBAC.cpp" "FT_ReplicaS.cpp" "FT_ReplicaC.cpp" "FT_NotifierS.cpp" "FT_NotifierC.cpp" "FT_FaultDetectorFactoryS.cpp" "FT_FaultDetectorFactoryC.cpp" "FT_ReplicationManagerS.cpp" "FT_ReplicationManagerC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\TAO_FaultTolerance.dll"
	-@del /f/q "$(OUTDIR)\TAO_FaultTolerance.lib"
	-@del /f/q "$(OUTDIR)\TAO_FaultTolerance.exp"
	-@del /f/q "$(OUTDIR)\TAO_FaultTolerance.ilk"
	-@del /f/q "FT_CORBAC.inl"
	-@del /f/q "FT_CORBAS.inl"
	-@del /f/q "FT_CORBAC.h"
	-@del /f/q "FT_CORBAS.h"
	-@del /f/q "FT_CORBAC.cpp"
	-@del /f/q "FT_CORBAS.cpp"
	-@del /f/q "FT_ReplicaC.inl"
	-@del /f/q "FT_ReplicaS.inl"
	-@del /f/q "FT_ReplicaC.h"
	-@del /f/q "FT_ReplicaS.h"
	-@del /f/q "FT_ReplicaC.cpp"
	-@del /f/q "FT_ReplicaS.cpp"
	-@del /f/q "FT_NotifierC.inl"
	-@del /f/q "FT_NotifierS.inl"
	-@del /f/q "FT_NotifierC.h"
	-@del /f/q "FT_NotifierS.h"
	-@del /f/q "FT_NotifierC.cpp"
	-@del /f/q "FT_NotifierS.cpp"
	-@del /f/q "FT_FaultDetectorFactoryC.inl"
	-@del /f/q "FT_FaultDetectorFactoryS.inl"
	-@del /f/q "FT_FaultDetectorFactoryC.h"
	-@del /f/q "FT_FaultDetectorFactoryS.h"
	-@del /f/q "FT_FaultDetectorFactoryC.cpp"
	-@del /f/q "FT_FaultDetectorFactoryS.cpp"
	-@del /f/q "FT_ReplicationManagerC.inl"
	-@del /f/q "FT_ReplicationManagerS.inl"
	-@del /f/q "FT_ReplicationManagerC.h"
	-@del /f/q "FT_ReplicationManagerS.h"
	-@del /f/q "FT_ReplicationManagerC.cpp"
	-@del /f/q "FT_ReplicationManagerS.cpp"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\FaultTolerance\$(NULL)" mkdir "Release\FaultTolerance"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D TAO_FT_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_CodecFactory.lib TAO_PI.lib TAO_PortableServer.lib TAO_PI_Server.lib TAO_CosEvent.lib TAO_CosNotification.lib TAO_IORManip.lib TAO_CosNaming.lib TAO_Valuetype.lib TAO_Messaging.lib TAO_PortableGroup.lib TAO_FTORB_Utils.lib TAO_FT_ClientORB.lib TAO_FT_ServerORB.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\..\lib\TAO_FaultTolerance.dll" /implib:"$(OUTDIR)\TAO_FaultTolerance.lib"
LINK32_OBJS= \
	"$(INTDIR)\FaultTolerance.res" \
	"$(INTDIR)\FT_CORBAS.obj" \
	"$(INTDIR)\FT_CORBAC.obj" \
	"$(INTDIR)\FT_ReplicaS.obj" \
	"$(INTDIR)\FT_ReplicaC.obj" \
	"$(INTDIR)\FT_NotifierS.obj" \
	"$(INTDIR)\FT_NotifierC.obj" \
	"$(INTDIR)\FT_FaultDetectorFactoryS.obj" \
	"$(INTDIR)\FT_FaultDetectorFactoryC.obj" \
	"$(INTDIR)\FT_ReplicationManagerS.obj" \
	"$(INTDIR)\FT_ReplicationManagerC.obj"

"..\..\..\lib\TAO_FaultTolerance.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_FaultTolerance.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_FaultTolerance.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\FaultTolerance\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_FaultTolerancesd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.FaultTolerance.dep" "FT_CORBAS.cpp" "FT_CORBAC.cpp" "FT_ReplicaS.cpp" "FT_ReplicaC.cpp" "FT_NotifierS.cpp" "FT_NotifierC.cpp" "FT_FaultDetectorFactoryS.cpp" "FT_FaultDetectorFactoryC.cpp" "FT_ReplicationManagerS.cpp" "FT_ReplicationManagerC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_FaultTolerancesd.lib"
	-@del /f/q "$(OUTDIR)\TAO_FaultTolerancesd.exp"
	-@del /f/q "$(OUTDIR)\TAO_FaultTolerancesd.ilk"
	-@del /f/q "..\..\..\lib\TAO_FaultTolerancesd.pdb"
	-@del /f/q "FT_CORBAC.inl"
	-@del /f/q "FT_CORBAS.inl"
	-@del /f/q "FT_CORBAC.h"
	-@del /f/q "FT_CORBAS.h"
	-@del /f/q "FT_CORBAC.cpp"
	-@del /f/q "FT_CORBAS.cpp"
	-@del /f/q "FT_ReplicaC.inl"
	-@del /f/q "FT_ReplicaS.inl"
	-@del /f/q "FT_ReplicaC.h"
	-@del /f/q "FT_ReplicaS.h"
	-@del /f/q "FT_ReplicaC.cpp"
	-@del /f/q "FT_ReplicaS.cpp"
	-@del /f/q "FT_NotifierC.inl"
	-@del /f/q "FT_NotifierS.inl"
	-@del /f/q "FT_NotifierC.h"
	-@del /f/q "FT_NotifierS.h"
	-@del /f/q "FT_NotifierC.cpp"
	-@del /f/q "FT_NotifierS.cpp"
	-@del /f/q "FT_FaultDetectorFactoryC.inl"
	-@del /f/q "FT_FaultDetectorFactoryS.inl"
	-@del /f/q "FT_FaultDetectorFactoryC.h"
	-@del /f/q "FT_FaultDetectorFactoryS.h"
	-@del /f/q "FT_FaultDetectorFactoryC.cpp"
	-@del /f/q "FT_FaultDetectorFactoryS.cpp"
	-@del /f/q "FT_ReplicationManagerC.inl"
	-@del /f/q "FT_ReplicationManagerS.inl"
	-@del /f/q "FT_ReplicationManagerC.h"
	-@del /f/q "FT_ReplicationManagerS.h"
	-@del /f/q "FT_ReplicationManagerC.cpp"
	-@del /f/q "FT_ReplicationManagerS.cpp"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\FaultTolerance\$(NULL)" mkdir "Static_Debug\FaultTolerance"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\TAO_FaultTolerancesd.pdb" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_FaultTolerancesd.lib"
LINK32_OBJS= \
	"$(INTDIR)\FT_CORBAS.obj" \
	"$(INTDIR)\FT_CORBAC.obj" \
	"$(INTDIR)\FT_ReplicaS.obj" \
	"$(INTDIR)\FT_ReplicaC.obj" \
	"$(INTDIR)\FT_NotifierS.obj" \
	"$(INTDIR)\FT_NotifierC.obj" \
	"$(INTDIR)\FT_FaultDetectorFactoryS.obj" \
	"$(INTDIR)\FT_FaultDetectorFactoryC.obj" \
	"$(INTDIR)\FT_ReplicationManagerS.obj" \
	"$(INTDIR)\FT_ReplicationManagerC.obj"

"$(OUTDIR)\TAO_FaultTolerancesd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_FaultTolerancesd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_FaultTolerancesd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\FaultTolerance\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_FaultTolerances.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.FaultTolerance.dep" "FT_CORBAS.cpp" "FT_CORBAC.cpp" "FT_ReplicaS.cpp" "FT_ReplicaC.cpp" "FT_NotifierS.cpp" "FT_NotifierC.cpp" "FT_FaultDetectorFactoryS.cpp" "FT_FaultDetectorFactoryC.cpp" "FT_ReplicationManagerS.cpp" "FT_ReplicationManagerC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_FaultTolerances.lib"
	-@del /f/q "$(OUTDIR)\TAO_FaultTolerances.exp"
	-@del /f/q "$(OUTDIR)\TAO_FaultTolerances.ilk"
	-@del /f/q "FT_CORBAC.inl"
	-@del /f/q "FT_CORBAS.inl"
	-@del /f/q "FT_CORBAC.h"
	-@del /f/q "FT_CORBAS.h"
	-@del /f/q "FT_CORBAC.cpp"
	-@del /f/q "FT_CORBAS.cpp"
	-@del /f/q "FT_ReplicaC.inl"
	-@del /f/q "FT_ReplicaS.inl"
	-@del /f/q "FT_ReplicaC.h"
	-@del /f/q "FT_ReplicaS.h"
	-@del /f/q "FT_ReplicaC.cpp"
	-@del /f/q "FT_ReplicaS.cpp"
	-@del /f/q "FT_NotifierC.inl"
	-@del /f/q "FT_NotifierS.inl"
	-@del /f/q "FT_NotifierC.h"
	-@del /f/q "FT_NotifierS.h"
	-@del /f/q "FT_NotifierC.cpp"
	-@del /f/q "FT_NotifierS.cpp"
	-@del /f/q "FT_FaultDetectorFactoryC.inl"
	-@del /f/q "FT_FaultDetectorFactoryS.inl"
	-@del /f/q "FT_FaultDetectorFactoryC.h"
	-@del /f/q "FT_FaultDetectorFactoryS.h"
	-@del /f/q "FT_FaultDetectorFactoryC.cpp"
	-@del /f/q "FT_FaultDetectorFactoryS.cpp"
	-@del /f/q "FT_ReplicationManagerC.inl"
	-@del /f/q "FT_ReplicationManagerS.inl"
	-@del /f/q "FT_ReplicationManagerC.h"
	-@del /f/q "FT_ReplicationManagerS.h"
	-@del /f/q "FT_ReplicationManagerC.cpp"
	-@del /f/q "FT_ReplicationManagerS.cpp"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\FaultTolerance\$(NULL)" mkdir "Static_Release\FaultTolerance"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_FaultTolerances.lib"
LINK32_OBJS= \
	"$(INTDIR)\FT_CORBAS.obj" \
	"$(INTDIR)\FT_CORBAC.obj" \
	"$(INTDIR)\FT_ReplicaS.obj" \
	"$(INTDIR)\FT_ReplicaC.obj" \
	"$(INTDIR)\FT_NotifierS.obj" \
	"$(INTDIR)\FT_NotifierC.obj" \
	"$(INTDIR)\FT_FaultDetectorFactoryS.obj" \
	"$(INTDIR)\FT_FaultDetectorFactoryC.obj" \
	"$(INTDIR)\FT_ReplicationManagerS.obj" \
	"$(INTDIR)\FT_ReplicationManagerC.obj"

"$(OUTDIR)\TAO_FaultTolerances.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_FaultTolerances.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_FaultTolerances.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.FaultTolerance.dep")
!INCLUDE "Makefile.FaultTolerance.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="FT_CORBAS.cpp"

"$(INTDIR)\FT_CORBAS.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FT_CORBAS.obj" $(SOURCE)

SOURCE="FT_CORBAC.cpp"

"$(INTDIR)\FT_CORBAC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FT_CORBAC.obj" $(SOURCE)

SOURCE="FT_ReplicaS.cpp"

"$(INTDIR)\FT_ReplicaS.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FT_ReplicaS.obj" $(SOURCE)

SOURCE="FT_ReplicaC.cpp"

"$(INTDIR)\FT_ReplicaC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FT_ReplicaC.obj" $(SOURCE)

SOURCE="FT_NotifierS.cpp"

"$(INTDIR)\FT_NotifierS.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FT_NotifierS.obj" $(SOURCE)

SOURCE="FT_NotifierC.cpp"

"$(INTDIR)\FT_NotifierC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FT_NotifierC.obj" $(SOURCE)

SOURCE="FT_FaultDetectorFactoryS.cpp"

"$(INTDIR)\FT_FaultDetectorFactoryS.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FT_FaultDetectorFactoryS.obj" $(SOURCE)

SOURCE="FT_FaultDetectorFactoryC.cpp"

"$(INTDIR)\FT_FaultDetectorFactoryC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FT_FaultDetectorFactoryC.obj" $(SOURCE)

SOURCE="FT_ReplicationManagerS.cpp"

"$(INTDIR)\FT_ReplicationManagerS.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FT_ReplicationManagerS.obj" $(SOURCE)

SOURCE="FT_ReplicationManagerC.cpp"

"$(INTDIR)\FT_ReplicationManagerC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FT_ReplicationManagerC.obj" $(SOURCE)

!IF  "$(CFG)" == "Win64 Debug"
SOURCE="FT_CORBA.idl"

InputPath=FT_CORBA.idl

"FT_CORBAC.inl" "FT_CORBAS.inl" "FT_CORBAC.h" "FT_CORBAS.h" "FT_CORBAC.cpp" "FT_CORBAS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-FT_CORBA_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_FT_Export -Wb,export_include=orbsvcs/FaultTolerance/fault_tol_export.h -Wb,skel_export_include=tao/PortableServer/PolicyS.h "$(InputPath)"
<<

SOURCE="FT_Replica.idl"

InputPath=FT_Replica.idl

"FT_ReplicaC.inl" "FT_ReplicaS.inl" "FT_ReplicaC.h" "FT_ReplicaS.h" "FT_ReplicaC.cpp" "FT_ReplicaS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-FT_Replica_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_FT_Export -Wb,export_include=orbsvcs/FaultTolerance/fault_tol_export.h -Wb,skel_export_include=tao/PortableServer/PolicyS.h "$(InputPath)"
<<

SOURCE="FT_Notifier.idl"

InputPath=FT_Notifier.idl

"FT_NotifierC.inl" "FT_NotifierS.inl" "FT_NotifierC.h" "FT_NotifierS.h" "FT_NotifierC.cpp" "FT_NotifierS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-FT_Notifier_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_FT_Export -Wb,export_include=orbsvcs/FaultTolerance/fault_tol_export.h -Wb,skel_export_include=tao/PortableServer/PolicyS.h "$(InputPath)"
<<

SOURCE="FT_FaultDetectorFactory.idl"

InputPath=FT_FaultDetectorFactory.idl

"FT_FaultDetectorFactoryC.inl" "FT_FaultDetectorFactoryS.inl" "FT_FaultDetectorFactoryC.h" "FT_FaultDetectorFactoryS.h" "FT_FaultDetectorFactoryC.cpp" "FT_FaultDetectorFactoryS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-FT_FaultDetectorFactory_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_FT_Export -Wb,export_include=orbsvcs/FaultTolerance/fault_tol_export.h -Wb,skel_export_include=tao/PortableServer/PolicyS.h "$(InputPath)"
<<

SOURCE="FT_ReplicationManager.idl"

InputPath=FT_ReplicationManager.idl

"FT_ReplicationManagerC.inl" "FT_ReplicationManagerS.inl" "FT_ReplicationManagerC.h" "FT_ReplicationManagerS.h" "FT_ReplicationManagerC.cpp" "FT_ReplicationManagerS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-FT_ReplicationManager_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_FT_Export -Wb,export_include=orbsvcs/FaultTolerance/fault_tol_export.h -Wb,skel_export_include=tao/PortableServer/PolicyS.h "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Release"
SOURCE="FT_CORBA.idl"

InputPath=FT_CORBA.idl

"FT_CORBAC.inl" "FT_CORBAS.inl" "FT_CORBAC.h" "FT_CORBAS.h" "FT_CORBAC.cpp" "FT_CORBAS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-FT_CORBA_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_FT_Export -Wb,export_include=orbsvcs/FaultTolerance/fault_tol_export.h -Wb,skel_export_include=tao/PortableServer/PolicyS.h "$(InputPath)"
<<

SOURCE="FT_Replica.idl"

InputPath=FT_Replica.idl

"FT_ReplicaC.inl" "FT_ReplicaS.inl" "FT_ReplicaC.h" "FT_ReplicaS.h" "FT_ReplicaC.cpp" "FT_ReplicaS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-FT_Replica_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_FT_Export -Wb,export_include=orbsvcs/FaultTolerance/fault_tol_export.h -Wb,skel_export_include=tao/PortableServer/PolicyS.h "$(InputPath)"
<<

SOURCE="FT_Notifier.idl"

InputPath=FT_Notifier.idl

"FT_NotifierC.inl" "FT_NotifierS.inl" "FT_NotifierC.h" "FT_NotifierS.h" "FT_NotifierC.cpp" "FT_NotifierS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-FT_Notifier_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_FT_Export -Wb,export_include=orbsvcs/FaultTolerance/fault_tol_export.h -Wb,skel_export_include=tao/PortableServer/PolicyS.h "$(InputPath)"
<<

SOURCE="FT_FaultDetectorFactory.idl"

InputPath=FT_FaultDetectorFactory.idl

"FT_FaultDetectorFactoryC.inl" "FT_FaultDetectorFactoryS.inl" "FT_FaultDetectorFactoryC.h" "FT_FaultDetectorFactoryS.h" "FT_FaultDetectorFactoryC.cpp" "FT_FaultDetectorFactoryS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-FT_FaultDetectorFactory_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_FT_Export -Wb,export_include=orbsvcs/FaultTolerance/fault_tol_export.h -Wb,skel_export_include=tao/PortableServer/PolicyS.h "$(InputPath)"
<<

SOURCE="FT_ReplicationManager.idl"

InputPath=FT_ReplicationManager.idl

"FT_ReplicationManagerC.inl" "FT_ReplicationManagerS.inl" "FT_ReplicationManagerC.h" "FT_ReplicationManagerS.h" "FT_ReplicationManagerC.cpp" "FT_ReplicationManagerS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-FT_ReplicationManager_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_FT_Export -Wb,export_include=orbsvcs/FaultTolerance/fault_tol_export.h -Wb,skel_export_include=tao/PortableServer/PolicyS.h "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Debug"
SOURCE="FT_CORBA.idl"

InputPath=FT_CORBA.idl

"FT_CORBAC.inl" "FT_CORBAS.inl" "FT_CORBAC.h" "FT_CORBAS.h" "FT_CORBAC.cpp" "FT_CORBAS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-FT_CORBA_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_FT_Export -Wb,export_include=orbsvcs/FaultTolerance/fault_tol_export.h -Wb,skel_export_include=tao/PortableServer/PolicyS.h "$(InputPath)"
<<

SOURCE="FT_Replica.idl"

InputPath=FT_Replica.idl

"FT_ReplicaC.inl" "FT_ReplicaS.inl" "FT_ReplicaC.h" "FT_ReplicaS.h" "FT_ReplicaC.cpp" "FT_ReplicaS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-FT_Replica_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_FT_Export -Wb,export_include=orbsvcs/FaultTolerance/fault_tol_export.h -Wb,skel_export_include=tao/PortableServer/PolicyS.h "$(InputPath)"
<<

SOURCE="FT_Notifier.idl"

InputPath=FT_Notifier.idl

"FT_NotifierC.inl" "FT_NotifierS.inl" "FT_NotifierC.h" "FT_NotifierS.h" "FT_NotifierC.cpp" "FT_NotifierS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-FT_Notifier_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_FT_Export -Wb,export_include=orbsvcs/FaultTolerance/fault_tol_export.h -Wb,skel_export_include=tao/PortableServer/PolicyS.h "$(InputPath)"
<<

SOURCE="FT_FaultDetectorFactory.idl"

InputPath=FT_FaultDetectorFactory.idl

"FT_FaultDetectorFactoryC.inl" "FT_FaultDetectorFactoryS.inl" "FT_FaultDetectorFactoryC.h" "FT_FaultDetectorFactoryS.h" "FT_FaultDetectorFactoryC.cpp" "FT_FaultDetectorFactoryS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-FT_FaultDetectorFactory_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_FT_Export -Wb,export_include=orbsvcs/FaultTolerance/fault_tol_export.h -Wb,skel_export_include=tao/PortableServer/PolicyS.h "$(InputPath)"
<<

SOURCE="FT_ReplicationManager.idl"

InputPath=FT_ReplicationManager.idl

"FT_ReplicationManagerC.inl" "FT_ReplicationManagerS.inl" "FT_ReplicationManagerC.h" "FT_ReplicationManagerS.h" "FT_ReplicationManagerC.cpp" "FT_ReplicationManagerS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-FT_ReplicationManager_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_FT_Export -Wb,export_include=orbsvcs/FaultTolerance/fault_tol_export.h -Wb,skel_export_include=tao/PortableServer/PolicyS.h "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Release"
SOURCE="FT_CORBA.idl"

InputPath=FT_CORBA.idl

"FT_CORBAC.inl" "FT_CORBAS.inl" "FT_CORBAC.h" "FT_CORBAS.h" "FT_CORBAC.cpp" "FT_CORBAS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-FT_CORBA_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_FT_Export -Wb,export_include=orbsvcs/FaultTolerance/fault_tol_export.h -Wb,skel_export_include=tao/PortableServer/PolicyS.h "$(InputPath)"
<<

SOURCE="FT_Replica.idl"

InputPath=FT_Replica.idl

"FT_ReplicaC.inl" "FT_ReplicaS.inl" "FT_ReplicaC.h" "FT_ReplicaS.h" "FT_ReplicaC.cpp" "FT_ReplicaS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-FT_Replica_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_FT_Export -Wb,export_include=orbsvcs/FaultTolerance/fault_tol_export.h -Wb,skel_export_include=tao/PortableServer/PolicyS.h "$(InputPath)"
<<

SOURCE="FT_Notifier.idl"

InputPath=FT_Notifier.idl

"FT_NotifierC.inl" "FT_NotifierS.inl" "FT_NotifierC.h" "FT_NotifierS.h" "FT_NotifierC.cpp" "FT_NotifierS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-FT_Notifier_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_FT_Export -Wb,export_include=orbsvcs/FaultTolerance/fault_tol_export.h -Wb,skel_export_include=tao/PortableServer/PolicyS.h "$(InputPath)"
<<

SOURCE="FT_FaultDetectorFactory.idl"

InputPath=FT_FaultDetectorFactory.idl

"FT_FaultDetectorFactoryC.inl" "FT_FaultDetectorFactoryS.inl" "FT_FaultDetectorFactoryC.h" "FT_FaultDetectorFactoryS.h" "FT_FaultDetectorFactoryC.cpp" "FT_FaultDetectorFactoryS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-FT_FaultDetectorFactory_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_FT_Export -Wb,export_include=orbsvcs/FaultTolerance/fault_tol_export.h -Wb,skel_export_include=tao/PortableServer/PolicyS.h "$(InputPath)"
<<

SOURCE="FT_ReplicationManager.idl"

InputPath=FT_ReplicationManager.idl

"FT_ReplicationManagerC.inl" "FT_ReplicationManagerS.inl" "FT_ReplicationManagerC.h" "FT_ReplicationManagerS.h" "FT_ReplicationManagerC.cpp" "FT_ReplicationManagerS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-FT_ReplicationManager_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_FT_Export -Wb,export_include=orbsvcs/FaultTolerance/fault_tol_export.h -Wb,skel_export_include=tao/PortableServer/PolicyS.h "$(InputPath)"
<<

!ENDIF

SOURCE="FaultTolerance.rc"

"$(INTDIR)\FaultTolerance.res" : $(SOURCE)
	$(RSC) /l 0x409 /fo"$(INTDIR)\FaultTolerance.res" /d NDEBUG /d WIN64 /d _CRT_SECURE_NO_WARNINGS /d _CRT_SECURE_NO_DEPRECATE /d _CRT_NONSTDC_NO_DEPRECATE /d TAO_HAS_TYPED_EVENT_CHANNEL /i "..\..\.." /i "..\.." /i "..\..\orbsvcs" $(SOURCE)



!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.FaultTolerance.dep")
	@echo Using "Makefile.FaultTolerance.dep"
!ELSE
	@echo Warning: cannot find "Makefile.FaultTolerance.dep"
!ENDIF
!ENDIF

