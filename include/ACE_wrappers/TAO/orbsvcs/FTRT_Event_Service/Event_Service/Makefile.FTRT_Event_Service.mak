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
!MESSAGE NMAKE /f "Makefile.FTRT_Event_Service.mak" CFG="Win64 Debug"
!MESSAGE
!MESSAGE Possible choices for configuration are:
!MESSAGE
!MESSAGE "Win64 Debug" (based on "Win64 (IA64) Console Application")
!MESSAGE "Win64 Release" (based on "Win64 (IA64) Console Application")
!MESSAGE "Win64 Static Debug" (based on "Win64 (IA64) Console Application")
!MESSAGE "Win64 Static Release" (based on "Win64 (IA64) Console Application")
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

OUTDIR=.
INSTALLDIR=.
INTDIR=Debug\FTRT_Event_Service\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(INSTALLDIR)\ftrt_eventservice.exe"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\..\.." -I"..\..\.." -I"..\..\..\orbsvcs" -I"..\..\..\orbsvcs\FtRtEvent\EventChannel" -I"..\..\..\orbsvcs\FtRtEvent\Utils" -D_DEBUG -DWIN64 -DWIN32 -D_CONSOLE -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -f "Makefile.FTRT_Event_Service.dep" "FT_EventService.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(INSTALLDIR)\ftrt_eventservice.pdb"
	-@del /f/q "$(INSTALLDIR)\ftrt_eventservice.exe"
	-@del /f/q "$(INSTALLDIR)\ftrt_eventservice.ilk"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\FTRT_Event_Service\$(NULL)" mkdir "Debug\FTRT_Event_Service"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\..\.." /I "..\..\.." /I "..\..\..\orbsvcs" /I "..\..\..\orbsvcs\FtRtEvent\EventChannel" /I "..\..\..\orbsvcs\FtRtEvent\Utils" /D _DEBUG /D WIN64 /D WIN32 /D _CONSOLE /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_PortableServerd.lib TAO_CodecFactoryd.lib TAO_PId.lib TAO_Utilsd.lib TAO_CosNamingd.lib TAO_Svc_Utilsd.lib TAO_RTSchedd.lib TAO_Valuetyped.lib TAO_Messagingd.lib TAO_RTEventd.lib TAO_RTSchedEventd.lib TAO_IORManipd.lib TAO_PortableGroupd.lib TAO_FTORB_Utilsd.lib TAO_RTEvent_Skeld.lib TAO_RTEvent_Servd.lib TAO_PI_Serverd.lib TAO_FtRtEventd.lib TAO_FTRT_EventChanneld.lib /libpath:"." /libpath:"..\..\..\..\lib" /nologo /subsystem:console /debug /pdb:"$(INSTALLDIR)\ftrt_eventservice.pdb" /machine:IA64 /out:"$(INSTALLDIR)\ftrt_eventservice.exe"
LINK32_OBJS= \
	"$(INTDIR)\FT_EventService.obj"

"$(INSTALLDIR)\ftrt_eventservice.exe" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(INSTALLDIR)\ftrt_eventservice.exe.manifest" mt.exe -manifest "$(INSTALLDIR)\ftrt_eventservice.exe.manifest" -outputresource:$@;1

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=Release
INSTALLDIR=Release
INTDIR=Release\FTRT_Event_Service\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(INSTALLDIR)\ftrt_eventservice.exe"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\..\.." -I"..\..\.." -I"..\..\..\orbsvcs" -I"..\..\..\orbsvcs\FtRtEvent\EventChannel" -I"..\..\..\orbsvcs\FtRtEvent\Utils" -DNDEBUG -DWIN64 -DWIN32 -D_CONSOLE -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -f "Makefile.FTRT_Event_Service.dep" "FT_EventService.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(INSTALLDIR)\ftrt_eventservice.exe"
	-@del /f/q "$(INSTALLDIR)\ftrt_eventservice.ilk"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\FTRT_Event_Service\$(NULL)" mkdir "Release\FTRT_Event_Service"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\..\.." /I "..\..\.." /I "..\..\..\orbsvcs" /I "..\..\..\orbsvcs\FtRtEvent\EventChannel" /I "..\..\..\orbsvcs\FtRtEvent\Utils" /D NDEBUG /D WIN64 /D WIN32 /D _CONSOLE /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_PortableServer.lib TAO_CodecFactory.lib TAO_PI.lib TAO_Utils.lib TAO_CosNaming.lib TAO_Svc_Utils.lib TAO_RTSched.lib TAO_Valuetype.lib TAO_Messaging.lib TAO_RTEvent.lib TAO_RTSchedEvent.lib TAO_IORManip.lib TAO_PortableGroup.lib TAO_FTORB_Utils.lib TAO_RTEvent_Skel.lib TAO_RTEvent_Serv.lib TAO_PI_Server.lib TAO_FtRtEvent.lib TAO_FTRT_EventChannel.lib /libpath:"." /libpath:"..\..\..\..\lib" /nologo /subsystem:console  /machine:IA64 /out:"$(INSTALLDIR)\ftrt_eventservice.exe"
LINK32_OBJS= \
	"$(INTDIR)\FT_EventService.obj"

"$(INSTALLDIR)\ftrt_eventservice.exe" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(INSTALLDIR)\ftrt_eventservice.exe.manifest" mt.exe -manifest "$(INSTALLDIR)\ftrt_eventservice.exe.manifest" -outputresource:$@;1

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=Static_Debug
INSTALLDIR=Static_Debug
INTDIR=Static_Debug\FTRT_Event_Service\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(INSTALLDIR)\ftrt_eventservice.exe"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\..\.." -I"..\..\.." -I"..\..\..\orbsvcs" -I"..\..\..\orbsvcs\FtRtEvent\EventChannel" -I"..\..\..\orbsvcs\FtRtEvent\Utils" -D_DEBUG -DWIN64 -DWIN32 -D_CONSOLE -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.FTRT_Event_Service.dep" "FT_EventService.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(INSTALLDIR)\ftrt_eventservice.pdb"
	-@del /f/q "$(INSTALLDIR)\ftrt_eventservice.exe"
	-@del /f/q "$(INSTALLDIR)\ftrt_eventservice.ilk"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\FTRT_Event_Service\$(NULL)" mkdir "Static_Debug\FTRT_Event_Service"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\..\.." /I "..\..\.." /I "..\..\..\orbsvcs" /I "..\..\..\orbsvcs\FtRtEvent\EventChannel" /I "..\..\..\orbsvcs\FtRtEvent\Utils" /D _DEBUG /D WIN64 /D WIN32 /D _CONSOLE /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEsd.lib TAOsd.lib TAO_AnyTypeCodesd.lib TAO_PortableServersd.lib TAO_CodecFactorysd.lib TAO_PIsd.lib TAO_Utilssd.lib TAO_CosNamingsd.lib TAO_Svc_Utilssd.lib TAO_RTSchedsd.lib TAO_Valuetypesd.lib TAO_Messagingsd.lib TAO_RTEventsd.lib TAO_RTSchedEventsd.lib TAO_IORManipsd.lib TAO_PortableGroupsd.lib TAO_FTORB_Utilssd.lib TAO_RTEvent_Skelsd.lib TAO_RTEvent_Servsd.lib TAO_PI_Serversd.lib TAO_FtRtEventsd.lib TAO_FTRT_EventChannelsd.lib /libpath:"." /libpath:"..\..\..\..\lib" /nologo /subsystem:console /debug /pdb:"$(INSTALLDIR)\ftrt_eventservice.pdb" /machine:IA64 /out:"$(INSTALLDIR)\ftrt_eventservice.exe"
LINK32_OBJS= \
	"$(INTDIR)\FT_EventService.obj"

"$(INSTALLDIR)\ftrt_eventservice.exe" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(INSTALLDIR)\ftrt_eventservice.exe.manifest" mt.exe -manifest "$(INSTALLDIR)\ftrt_eventservice.exe.manifest" -outputresource:$@;1

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=Static_Release
INSTALLDIR=Static_Release
INTDIR=Static_Release\FTRT_Event_Service\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(INSTALLDIR)\ftrt_eventservice.exe"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\..\.." -I"..\..\.." -I"..\..\..\orbsvcs" -I"..\..\..\orbsvcs\FtRtEvent\EventChannel" -I"..\..\..\orbsvcs\FtRtEvent\Utils" -DNDEBUG -DWIN64 -DWIN32 -D_CONSOLE -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.FTRT_Event_Service.dep" "FT_EventService.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(INSTALLDIR)\ftrt_eventservice.exe"
	-@del /f/q "$(INSTALLDIR)\ftrt_eventservice.ilk"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\FTRT_Event_Service\$(NULL)" mkdir "Static_Release\FTRT_Event_Service"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\..\.." /I "..\..\.." /I "..\..\..\orbsvcs" /I "..\..\..\orbsvcs\FtRtEvent\EventChannel" /I "..\..\..\orbsvcs\FtRtEvent\Utils" /D NDEBUG /D WIN64 /D WIN32 /D _CONSOLE /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEs.lib TAOs.lib TAO_AnyTypeCodes.lib TAO_PortableServers.lib TAO_CodecFactorys.lib TAO_PIs.lib TAO_Utilss.lib TAO_CosNamings.lib TAO_Svc_Utilss.lib TAO_RTScheds.lib TAO_Valuetypes.lib TAO_Messagings.lib TAO_RTEvents.lib TAO_RTSchedEvents.lib TAO_IORManips.lib TAO_PortableGroups.lib TAO_FTORB_Utilss.lib TAO_RTEvent_Skels.lib TAO_RTEvent_Servs.lib TAO_PI_Servers.lib TAO_FtRtEvents.lib TAO_FTRT_EventChannels.lib /libpath:"." /libpath:"..\..\..\..\lib" /nologo /subsystem:console  /machine:IA64 /out:"$(INSTALLDIR)\ftrt_eventservice.exe"
LINK32_OBJS= \
	"$(INTDIR)\FT_EventService.obj"

"$(INSTALLDIR)\ftrt_eventservice.exe" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(INSTALLDIR)\ftrt_eventservice.exe.manifest" mt.exe -manifest "$(INSTALLDIR)\ftrt_eventservice.exe.manifest" -outputresource:$@;1

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
!IF EXISTS("Makefile.FTRT_Event_Service.dep")
!INCLUDE "Makefile.FTRT_Event_Service.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="FT_EventService.cpp"

"$(INTDIR)\FT_EventService.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FT_EventService.obj" $(SOURCE)

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
!IF EXISTS("Makefile.FTRT_Event_Service.dep")
	@echo Using "Makefile.FTRT_Event_Service.dep"
!ELSE
	@echo Warning: cannot find "Makefile.FTRT_Event_Service.dep"
!ENDIF
!ENDIF

