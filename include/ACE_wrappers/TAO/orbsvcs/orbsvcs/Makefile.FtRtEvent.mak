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
!MESSAGE NMAKE /f "Makefile.FtRtEvent.mak" CFG="Win64 Debug"
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

GENERATED_DIRTY = "FTRTC.inl" "FTRTS.inl" "FTRTC.h" "FTRTS.h" "FTRTC.cpp" "FTRTS.cpp" "FtRtecEventCommC.inl" "FtRtecEventCommS.inl" "FtRtecEventCommC.h" "FtRtecEventCommS.h" "FtRtecEventCommC.cpp" "FtRtecEventCommS.cpp" "FTRT_GroupManagerC.inl" "FTRT_GroupManagerS.inl" "FTRT_GroupManagerC.h" "FTRT_GroupManagerS.h" "FTRT_GroupManagerC.cpp" "FTRT_GroupManagerS.cpp" "FtRtecEventChannelAdminC.inl" "FtRtecEventChannelAdminS.inl" "FtRtecEventChannelAdminC.h" "FtRtecEventChannelAdminS.h" "FtRtecEventChannelAdminC.cpp" "FtRtecEventChannelAdminS.cpp"

!IF  "$(CFG)" == "Win64 Debug"

OUTDIR=..\..\..\lib
INTDIR=Debug\FtRtEvent\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_FtRtEventd.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_FTRTEVENT_BUILD_DLL -f "Makefile.FtRtEvent.dep" "FTRTC.cpp" "FTRTS.cpp" "FtRtecEventCommC.cpp" "FtRtecEventCommS.cpp" "FTRT_GroupManagerC.cpp" "FTRT_GroupManagerS.cpp" "FtRtecEventChannelAdminC.cpp" "FtRtecEventChannelAdminS.cpp" "FtRtEvent\Utils\Log.cpp" "FtRtEvent\Utils\FTEC_Gateway.cpp" "FtRtEvent\Utils\Safe_InputCDR.cpp" "FtRtEvent\Utils\UUID.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_FtRtEventd.pdb"
	-@del /f/q "..\..\..\lib\TAO_FtRtEventd.dll"
	-@del /f/q "$(OUTDIR)\TAO_FtRtEventd.lib"
	-@del /f/q "$(OUTDIR)\TAO_FtRtEventd.exp"
	-@del /f/q "$(OUTDIR)\TAO_FtRtEventd.ilk"
	-@del /f/q "FTRTC.inl"
	-@del /f/q "FTRTS.inl"
	-@del /f/q "FTRTC.h"
	-@del /f/q "FTRTS.h"
	-@del /f/q "FTRTC.cpp"
	-@del /f/q "FTRTS.cpp"
	-@del /f/q "FtRtecEventCommC.inl"
	-@del /f/q "FtRtecEventCommS.inl"
	-@del /f/q "FtRtecEventCommC.h"
	-@del /f/q "FtRtecEventCommS.h"
	-@del /f/q "FtRtecEventCommC.cpp"
	-@del /f/q "FtRtecEventCommS.cpp"
	-@del /f/q "FTRT_GroupManagerC.inl"
	-@del /f/q "FTRT_GroupManagerS.inl"
	-@del /f/q "FTRT_GroupManagerC.h"
	-@del /f/q "FTRT_GroupManagerS.h"
	-@del /f/q "FTRT_GroupManagerC.cpp"
	-@del /f/q "FTRT_GroupManagerS.cpp"
	-@del /f/q "FtRtecEventChannelAdminC.inl"
	-@del /f/q "FtRtecEventChannelAdminS.inl"
	-@del /f/q "FtRtecEventChannelAdminC.h"
	-@del /f/q "FtRtecEventChannelAdminS.h"
	-@del /f/q "FtRtecEventChannelAdminC.cpp"
	-@del /f/q "FtRtecEventChannelAdminS.cpp"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\FtRtEvent\$(NULL)" mkdir "Debug\FtRtEvent"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_FTRTEVENT_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_IORManipd.lib TAO_PortableServerd.lib TAO_CosNamingd.lib TAO_Valuetyped.lib TAO_CodecFactoryd.lib TAO_PId.lib TAO_Messagingd.lib TAO_PortableGroupd.lib TAO_FTORB_Utilsd.lib TAO_Svc_Utilsd.lib TAO_RTEventd.lib TAO_RTEvent_Skeld.lib TAO_RTEvent_Servd.lib TAO_PI_Serverd.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\..\lib\TAO_FtRtEventd.pdb" /machine:IA64 /out:"..\..\..\lib\TAO_FtRtEventd.dll" /implib:"$(OUTDIR)\TAO_FtRtEventd.lib"
LINK32_OBJS= \
	"$(INTDIR)\FTRTC.obj" \
	"$(INTDIR)\FTRTS.obj" \
	"$(INTDIR)\FtRtecEventCommC.obj" \
	"$(INTDIR)\FtRtecEventCommS.obj" \
	"$(INTDIR)\FTRT_GroupManagerC.obj" \
	"$(INTDIR)\FTRT_GroupManagerS.obj" \
	"$(INTDIR)\FtRtecEventChannelAdminC.obj" \
	"$(INTDIR)\FtRtecEventChannelAdminS.obj" \
	"$(INTDIR)\FtRtEvent\Utils\Log.obj" \
	"$(INTDIR)\FtRtEvent\Utils\FTEC_Gateway.obj" \
	"$(INTDIR)\FtRtEvent\Utils\Safe_InputCDR.obj" \
	"$(INTDIR)\FtRtEvent\Utils\UUID.obj"

"..\..\..\lib\TAO_FtRtEventd.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_FtRtEventd.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_FtRtEventd.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\FtRtEvent\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_FtRtEvent.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_FTRTEVENT_BUILD_DLL -f "Makefile.FtRtEvent.dep" "FTRTC.cpp" "FTRTS.cpp" "FtRtecEventCommC.cpp" "FtRtecEventCommS.cpp" "FTRT_GroupManagerC.cpp" "FTRT_GroupManagerS.cpp" "FtRtecEventChannelAdminC.cpp" "FtRtecEventChannelAdminS.cpp" "FtRtEvent\Utils\Log.cpp" "FtRtEvent\Utils\FTEC_Gateway.cpp" "FtRtEvent\Utils\Safe_InputCDR.cpp" "FtRtEvent\Utils\UUID.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\TAO_FtRtEvent.dll"
	-@del /f/q "$(OUTDIR)\TAO_FtRtEvent.lib"
	-@del /f/q "$(OUTDIR)\TAO_FtRtEvent.exp"
	-@del /f/q "$(OUTDIR)\TAO_FtRtEvent.ilk"
	-@del /f/q "FTRTC.inl"
	-@del /f/q "FTRTS.inl"
	-@del /f/q "FTRTC.h"
	-@del /f/q "FTRTS.h"
	-@del /f/q "FTRTC.cpp"
	-@del /f/q "FTRTS.cpp"
	-@del /f/q "FtRtecEventCommC.inl"
	-@del /f/q "FtRtecEventCommS.inl"
	-@del /f/q "FtRtecEventCommC.h"
	-@del /f/q "FtRtecEventCommS.h"
	-@del /f/q "FtRtecEventCommC.cpp"
	-@del /f/q "FtRtecEventCommS.cpp"
	-@del /f/q "FTRT_GroupManagerC.inl"
	-@del /f/q "FTRT_GroupManagerS.inl"
	-@del /f/q "FTRT_GroupManagerC.h"
	-@del /f/q "FTRT_GroupManagerS.h"
	-@del /f/q "FTRT_GroupManagerC.cpp"
	-@del /f/q "FTRT_GroupManagerS.cpp"
	-@del /f/q "FtRtecEventChannelAdminC.inl"
	-@del /f/q "FtRtecEventChannelAdminS.inl"
	-@del /f/q "FtRtecEventChannelAdminC.h"
	-@del /f/q "FtRtecEventChannelAdminS.h"
	-@del /f/q "FtRtecEventChannelAdminC.cpp"
	-@del /f/q "FtRtecEventChannelAdminS.cpp"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\FtRtEvent\$(NULL)" mkdir "Release\FtRtEvent"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_FTRTEVENT_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_IORManip.lib TAO_PortableServer.lib TAO_CosNaming.lib TAO_Valuetype.lib TAO_CodecFactory.lib TAO_PI.lib TAO_Messaging.lib TAO_PortableGroup.lib TAO_FTORB_Utils.lib TAO_Svc_Utils.lib TAO_RTEvent.lib TAO_RTEvent_Skel.lib TAO_RTEvent_Serv.lib TAO_PI_Server.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\..\lib\TAO_FtRtEvent.dll" /implib:"$(OUTDIR)\TAO_FtRtEvent.lib"
LINK32_OBJS= \
	"$(INTDIR)\FTRTC.obj" \
	"$(INTDIR)\FTRTS.obj" \
	"$(INTDIR)\FtRtecEventCommC.obj" \
	"$(INTDIR)\FtRtecEventCommS.obj" \
	"$(INTDIR)\FTRT_GroupManagerC.obj" \
	"$(INTDIR)\FTRT_GroupManagerS.obj" \
	"$(INTDIR)\FtRtecEventChannelAdminC.obj" \
	"$(INTDIR)\FtRtecEventChannelAdminS.obj" \
	"$(INTDIR)\FtRtEvent\Utils\Log.obj" \
	"$(INTDIR)\FtRtEvent\Utils\FTEC_Gateway.obj" \
	"$(INTDIR)\FtRtEvent\Utils\Safe_InputCDR.obj" \
	"$(INTDIR)\FtRtEvent\Utils\UUID.obj"

"..\..\..\lib\TAO_FtRtEvent.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_FtRtEvent.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_FtRtEvent.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\FtRtEvent\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_FtRtEventsd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.FtRtEvent.dep" "FTRTC.cpp" "FTRTS.cpp" "FtRtecEventCommC.cpp" "FtRtecEventCommS.cpp" "FTRT_GroupManagerC.cpp" "FTRT_GroupManagerS.cpp" "FtRtecEventChannelAdminC.cpp" "FtRtecEventChannelAdminS.cpp" "FtRtEvent\Utils\Log.cpp" "FtRtEvent\Utils\FTEC_Gateway.cpp" "FtRtEvent\Utils\Safe_InputCDR.cpp" "FtRtEvent\Utils\UUID.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_FtRtEventsd.lib"
	-@del /f/q "$(OUTDIR)\TAO_FtRtEventsd.exp"
	-@del /f/q "$(OUTDIR)\TAO_FtRtEventsd.ilk"
	-@del /f/q "..\..\..\lib\TAO_FtRtEventsd.pdb"
	-@del /f/q "FTRTC.inl"
	-@del /f/q "FTRTS.inl"
	-@del /f/q "FTRTC.h"
	-@del /f/q "FTRTS.h"
	-@del /f/q "FTRTC.cpp"
	-@del /f/q "FTRTS.cpp"
	-@del /f/q "FtRtecEventCommC.inl"
	-@del /f/q "FtRtecEventCommS.inl"
	-@del /f/q "FtRtecEventCommC.h"
	-@del /f/q "FtRtecEventCommS.h"
	-@del /f/q "FtRtecEventCommC.cpp"
	-@del /f/q "FtRtecEventCommS.cpp"
	-@del /f/q "FTRT_GroupManagerC.inl"
	-@del /f/q "FTRT_GroupManagerS.inl"
	-@del /f/q "FTRT_GroupManagerC.h"
	-@del /f/q "FTRT_GroupManagerS.h"
	-@del /f/q "FTRT_GroupManagerC.cpp"
	-@del /f/q "FTRT_GroupManagerS.cpp"
	-@del /f/q "FtRtecEventChannelAdminC.inl"
	-@del /f/q "FtRtecEventChannelAdminS.inl"
	-@del /f/q "FtRtecEventChannelAdminC.h"
	-@del /f/q "FtRtecEventChannelAdminS.h"
	-@del /f/q "FtRtecEventChannelAdminC.cpp"
	-@del /f/q "FtRtecEventChannelAdminS.cpp"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\FtRtEvent\$(NULL)" mkdir "Static_Debug\FtRtEvent"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\TAO_FtRtEventsd.pdb" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_FtRtEventsd.lib"
LINK32_OBJS= \
	"$(INTDIR)\FTRTC.obj" \
	"$(INTDIR)\FTRTS.obj" \
	"$(INTDIR)\FtRtecEventCommC.obj" \
	"$(INTDIR)\FtRtecEventCommS.obj" \
	"$(INTDIR)\FTRT_GroupManagerC.obj" \
	"$(INTDIR)\FTRT_GroupManagerS.obj" \
	"$(INTDIR)\FtRtecEventChannelAdminC.obj" \
	"$(INTDIR)\FtRtecEventChannelAdminS.obj" \
	"$(INTDIR)\FtRtEvent\Utils\Log.obj" \
	"$(INTDIR)\FtRtEvent\Utils\FTEC_Gateway.obj" \
	"$(INTDIR)\FtRtEvent\Utils\Safe_InputCDR.obj" \
	"$(INTDIR)\FtRtEvent\Utils\UUID.obj"

"$(OUTDIR)\TAO_FtRtEventsd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_FtRtEventsd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_FtRtEventsd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\FtRtEvent\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_FtRtEvents.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.FtRtEvent.dep" "FTRTC.cpp" "FTRTS.cpp" "FtRtecEventCommC.cpp" "FtRtecEventCommS.cpp" "FTRT_GroupManagerC.cpp" "FTRT_GroupManagerS.cpp" "FtRtecEventChannelAdminC.cpp" "FtRtecEventChannelAdminS.cpp" "FtRtEvent\Utils\Log.cpp" "FtRtEvent\Utils\FTEC_Gateway.cpp" "FtRtEvent\Utils\Safe_InputCDR.cpp" "FtRtEvent\Utils\UUID.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_FtRtEvents.lib"
	-@del /f/q "$(OUTDIR)\TAO_FtRtEvents.exp"
	-@del /f/q "$(OUTDIR)\TAO_FtRtEvents.ilk"
	-@del /f/q "FTRTC.inl"
	-@del /f/q "FTRTS.inl"
	-@del /f/q "FTRTC.h"
	-@del /f/q "FTRTS.h"
	-@del /f/q "FTRTC.cpp"
	-@del /f/q "FTRTS.cpp"
	-@del /f/q "FtRtecEventCommC.inl"
	-@del /f/q "FtRtecEventCommS.inl"
	-@del /f/q "FtRtecEventCommC.h"
	-@del /f/q "FtRtecEventCommS.h"
	-@del /f/q "FtRtecEventCommC.cpp"
	-@del /f/q "FtRtecEventCommS.cpp"
	-@del /f/q "FTRT_GroupManagerC.inl"
	-@del /f/q "FTRT_GroupManagerS.inl"
	-@del /f/q "FTRT_GroupManagerC.h"
	-@del /f/q "FTRT_GroupManagerS.h"
	-@del /f/q "FTRT_GroupManagerC.cpp"
	-@del /f/q "FTRT_GroupManagerS.cpp"
	-@del /f/q "FtRtecEventChannelAdminC.inl"
	-@del /f/q "FtRtecEventChannelAdminS.inl"
	-@del /f/q "FtRtecEventChannelAdminC.h"
	-@del /f/q "FtRtecEventChannelAdminS.h"
	-@del /f/q "FtRtecEventChannelAdminC.cpp"
	-@del /f/q "FtRtecEventChannelAdminS.cpp"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\FtRtEvent\$(NULL)" mkdir "Static_Release\FtRtEvent"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_FtRtEvents.lib"
LINK32_OBJS= \
	"$(INTDIR)\FTRTC.obj" \
	"$(INTDIR)\FTRTS.obj" \
	"$(INTDIR)\FtRtecEventCommC.obj" \
	"$(INTDIR)\FtRtecEventCommS.obj" \
	"$(INTDIR)\FTRT_GroupManagerC.obj" \
	"$(INTDIR)\FTRT_GroupManagerS.obj" \
	"$(INTDIR)\FtRtecEventChannelAdminC.obj" \
	"$(INTDIR)\FtRtecEventChannelAdminS.obj" \
	"$(INTDIR)\FtRtEvent\Utils\Log.obj" \
	"$(INTDIR)\FtRtEvent\Utils\FTEC_Gateway.obj" \
	"$(INTDIR)\FtRtEvent\Utils\Safe_InputCDR.obj" \
	"$(INTDIR)\FtRtEvent\Utils\UUID.obj"

"$(OUTDIR)\TAO_FtRtEvents.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_FtRtEvents.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_FtRtEvents.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.FtRtEvent.dep")
!INCLUDE "Makefile.FtRtEvent.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="FTRTC.cpp"

"$(INTDIR)\FTRTC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FTRTC.obj" $(SOURCE)

SOURCE="FTRTS.cpp"

"$(INTDIR)\FTRTS.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FTRTS.obj" $(SOURCE)

SOURCE="FtRtecEventCommC.cpp"

"$(INTDIR)\FtRtecEventCommC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FtRtecEventCommC.obj" $(SOURCE)

SOURCE="FtRtecEventCommS.cpp"

"$(INTDIR)\FtRtecEventCommS.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FtRtecEventCommS.obj" $(SOURCE)

SOURCE="FTRT_GroupManagerC.cpp"

"$(INTDIR)\FTRT_GroupManagerC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FTRT_GroupManagerC.obj" $(SOURCE)

SOURCE="FTRT_GroupManagerS.cpp"

"$(INTDIR)\FTRT_GroupManagerS.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FTRT_GroupManagerS.obj" $(SOURCE)

SOURCE="FtRtecEventChannelAdminC.cpp"

"$(INTDIR)\FtRtecEventChannelAdminC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FtRtecEventChannelAdminC.obj" $(SOURCE)

SOURCE="FtRtecEventChannelAdminS.cpp"

"$(INTDIR)\FtRtecEventChannelAdminS.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FtRtecEventChannelAdminS.obj" $(SOURCE)

SOURCE="FtRtEvent\Utils\Log.cpp"

"$(INTDIR)\FtRtEvent\Utils\Log.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\FtRtEvent\Utils\$(NULL)" mkdir "$(INTDIR)\FtRtEvent\Utils\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FtRtEvent\Utils\Log.obj" $(SOURCE)

SOURCE="FtRtEvent\Utils\FTEC_Gateway.cpp"

"$(INTDIR)\FtRtEvent\Utils\FTEC_Gateway.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\FtRtEvent\Utils\$(NULL)" mkdir "$(INTDIR)\FtRtEvent\Utils\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FtRtEvent\Utils\FTEC_Gateway.obj" $(SOURCE)

SOURCE="FtRtEvent\Utils\Safe_InputCDR.cpp"

"$(INTDIR)\FtRtEvent\Utils\Safe_InputCDR.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\FtRtEvent\Utils\$(NULL)" mkdir "$(INTDIR)\FtRtEvent\Utils\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FtRtEvent\Utils\Safe_InputCDR.obj" $(SOURCE)

SOURCE="FtRtEvent\Utils\UUID.cpp"

"$(INTDIR)\FtRtEvent\Utils\UUID.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\FtRtEvent\Utils\$(NULL)" mkdir "$(INTDIR)\FtRtEvent\Utils\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FtRtEvent\Utils\UUID.obj" $(SOURCE)

!IF  "$(CFG)" == "Win64 Debug"
SOURCE="FTRT.idl"

InputPath=FTRT.idl

"FTRTC.inl" "FTRTS.inl" "FTRTC.h" "FTRTS.h" "FTRTC.cpp" "FTRTS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-FTRT_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_FtRtEvent_Export -Wb,export_include=orbsvcs/FtRtEvent/Utils/ftrtevent_export.h -GC "$(InputPath)"
<<

SOURCE="FtRtecEventComm.idl"

InputPath=FtRtecEventComm.idl

"FtRtecEventCommC.inl" "FtRtecEventCommS.inl" "FtRtecEventCommC.h" "FtRtecEventCommS.h" "FtRtecEventCommC.cpp" "FtRtecEventCommS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-FtRtecEventComm_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_FtRtEvent_Export -Wb,export_include=orbsvcs/FtRtEvent/Utils/ftrtevent_export.h -GC "$(InputPath)"
<<

SOURCE="FTRT_GroupManager.idl"

InputPath=FTRT_GroupManager.idl

"FTRT_GroupManagerC.inl" "FTRT_GroupManagerS.inl" "FTRT_GroupManagerC.h" "FTRT_GroupManagerS.h" "FTRT_GroupManagerC.cpp" "FTRT_GroupManagerS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-FTRT_GroupManager_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_FtRtEvent_Export -Wb,export_include=orbsvcs/FtRtEvent/Utils/ftrtevent_export.h -GC "$(InputPath)"
<<

SOURCE="FtRtecEventChannelAdmin.idl"

InputPath=FtRtecEventChannelAdmin.idl

"FtRtecEventChannelAdminC.inl" "FtRtecEventChannelAdminS.inl" "FtRtecEventChannelAdminC.h" "FtRtecEventChannelAdminS.h" "FtRtecEventChannelAdminC.cpp" "FtRtecEventChannelAdminS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-FtRtecEventChannelAdmin_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_FtRtEvent_Export -Wb,export_include=orbsvcs/FtRtEvent/Utils/ftrtevent_export.h "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Release"
SOURCE="FTRT.idl"

InputPath=FTRT.idl

"FTRTC.inl" "FTRTS.inl" "FTRTC.h" "FTRTS.h" "FTRTC.cpp" "FTRTS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-FTRT_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_FtRtEvent_Export -Wb,export_include=orbsvcs/FtRtEvent/Utils/ftrtevent_export.h -GC "$(InputPath)"
<<

SOURCE="FtRtecEventComm.idl"

InputPath=FtRtecEventComm.idl

"FtRtecEventCommC.inl" "FtRtecEventCommS.inl" "FtRtecEventCommC.h" "FtRtecEventCommS.h" "FtRtecEventCommC.cpp" "FtRtecEventCommS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-FtRtecEventComm_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_FtRtEvent_Export -Wb,export_include=orbsvcs/FtRtEvent/Utils/ftrtevent_export.h -GC "$(InputPath)"
<<

SOURCE="FTRT_GroupManager.idl"

InputPath=FTRT_GroupManager.idl

"FTRT_GroupManagerC.inl" "FTRT_GroupManagerS.inl" "FTRT_GroupManagerC.h" "FTRT_GroupManagerS.h" "FTRT_GroupManagerC.cpp" "FTRT_GroupManagerS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-FTRT_GroupManager_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_FtRtEvent_Export -Wb,export_include=orbsvcs/FtRtEvent/Utils/ftrtevent_export.h -GC "$(InputPath)"
<<

SOURCE="FtRtecEventChannelAdmin.idl"

InputPath=FtRtecEventChannelAdmin.idl

"FtRtecEventChannelAdminC.inl" "FtRtecEventChannelAdminS.inl" "FtRtecEventChannelAdminC.h" "FtRtecEventChannelAdminS.h" "FtRtecEventChannelAdminC.cpp" "FtRtecEventChannelAdminS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-FtRtecEventChannelAdmin_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_FtRtEvent_Export -Wb,export_include=orbsvcs/FtRtEvent/Utils/ftrtevent_export.h "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Debug"
SOURCE="FTRT.idl"

InputPath=FTRT.idl

"FTRTC.inl" "FTRTS.inl" "FTRTC.h" "FTRTS.h" "FTRTC.cpp" "FTRTS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-FTRT_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_FtRtEvent_Export -Wb,export_include=orbsvcs/FtRtEvent/Utils/ftrtevent_export.h -GC "$(InputPath)"
<<

SOURCE="FtRtecEventComm.idl"

InputPath=FtRtecEventComm.idl

"FtRtecEventCommC.inl" "FtRtecEventCommS.inl" "FtRtecEventCommC.h" "FtRtecEventCommS.h" "FtRtecEventCommC.cpp" "FtRtecEventCommS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-FtRtecEventComm_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_FtRtEvent_Export -Wb,export_include=orbsvcs/FtRtEvent/Utils/ftrtevent_export.h -GC "$(InputPath)"
<<

SOURCE="FTRT_GroupManager.idl"

InputPath=FTRT_GroupManager.idl

"FTRT_GroupManagerC.inl" "FTRT_GroupManagerS.inl" "FTRT_GroupManagerC.h" "FTRT_GroupManagerS.h" "FTRT_GroupManagerC.cpp" "FTRT_GroupManagerS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-FTRT_GroupManager_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_FtRtEvent_Export -Wb,export_include=orbsvcs/FtRtEvent/Utils/ftrtevent_export.h -GC "$(InputPath)"
<<

SOURCE="FtRtecEventChannelAdmin.idl"

InputPath=FtRtecEventChannelAdmin.idl

"FtRtecEventChannelAdminC.inl" "FtRtecEventChannelAdminS.inl" "FtRtecEventChannelAdminC.h" "FtRtecEventChannelAdminS.h" "FtRtecEventChannelAdminC.cpp" "FtRtecEventChannelAdminS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-FtRtecEventChannelAdmin_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_FtRtEvent_Export -Wb,export_include=orbsvcs/FtRtEvent/Utils/ftrtevent_export.h "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Release"
SOURCE="FTRT.idl"

InputPath=FTRT.idl

"FTRTC.inl" "FTRTS.inl" "FTRTC.h" "FTRTS.h" "FTRTC.cpp" "FTRTS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-FTRT_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_FtRtEvent_Export -Wb,export_include=orbsvcs/FtRtEvent/Utils/ftrtevent_export.h -GC "$(InputPath)"
<<

SOURCE="FtRtecEventComm.idl"

InputPath=FtRtecEventComm.idl

"FtRtecEventCommC.inl" "FtRtecEventCommS.inl" "FtRtecEventCommC.h" "FtRtecEventCommS.h" "FtRtecEventCommC.cpp" "FtRtecEventCommS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-FtRtecEventComm_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_FtRtEvent_Export -Wb,export_include=orbsvcs/FtRtEvent/Utils/ftrtevent_export.h -GC "$(InputPath)"
<<

SOURCE="FTRT_GroupManager.idl"

InputPath=FTRT_GroupManager.idl

"FTRT_GroupManagerC.inl" "FTRT_GroupManagerS.inl" "FTRT_GroupManagerC.h" "FTRT_GroupManagerS.h" "FTRT_GroupManagerC.cpp" "FTRT_GroupManagerS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-FTRT_GroupManager_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_FtRtEvent_Export -Wb,export_include=orbsvcs/FtRtEvent/Utils/ftrtevent_export.h -GC "$(InputPath)"
<<

SOURCE="FtRtecEventChannelAdmin.idl"

InputPath=FtRtecEventChannelAdmin.idl

"FtRtecEventChannelAdminC.inl" "FtRtecEventChannelAdminS.inl" "FtRtecEventChannelAdminC.h" "FtRtecEventChannelAdminS.h" "FtRtecEventChannelAdminC.cpp" "FtRtecEventChannelAdminS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-FtRtecEventChannelAdmin_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_FtRtEvent_Export -Wb,export_include=orbsvcs/FtRtEvent/Utils/ftrtevent_export.h "$(InputPath)"
<<

!ENDIF


!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.FtRtEvent.dep")
	@echo Using "Makefile.FtRtEvent.dep"
!ELSE
	@echo Warning: cannot find "Makefile.FtRtEvent.dep"
!ENDIF
!ENDIF

