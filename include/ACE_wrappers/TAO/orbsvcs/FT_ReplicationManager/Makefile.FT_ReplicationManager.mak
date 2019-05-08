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
!MESSAGE NMAKE /f "Makefile.FT_ReplicationManager.mak" CFG="Win64 Debug"
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
INTDIR=Debug\FT_ReplicationManager\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(INSTALLDIR)\tao_ft_replicationmanager.exe"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_CONSOLE -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -f "Makefile.FT_ReplicationManager.dep" "FT_ReplicationManager.cpp" "FT_ReplicationManager_Main.cpp" "FT_Property_Validator.cpp" "FT_ReplicationManagerFaultAnalyzer.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(INSTALLDIR)\tao_ft_replicationmanager.pdb"
	-@del /f/q "$(INSTALLDIR)\tao_ft_replicationmanager.exe"
	-@del /f/q "$(INSTALLDIR)\tao_ft_replicationmanager.ilk"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\FT_ReplicationManager\$(NULL)" mkdir "Debug\FT_ReplicationManager"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _CONSOLE /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_PortableServerd.lib TAO_CosNamingd.lib TAO_CosEventd.lib TAO_CosNotificationd.lib TAO_Valuetyped.lib TAO_CodecFactoryd.lib TAO_PId.lib TAO_Messagingd.lib TAO_IORManipd.lib TAO_PortableGroupd.lib TAO_FTORB_Utilsd.lib TAO_FT_ClientORBd.lib TAO_PI_Serverd.lib TAO_FT_ServerORBd.lib TAO_FaultToleranced.lib TAO_CosEvent_Skeld.lib TAO_CosNotification_Skeld.lib TAO_IORTabled.lib TAO_ReplicationManagerLibd.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:console /debug /pdb:"$(INSTALLDIR)\tao_ft_replicationmanager.pdb" /machine:IA64 /out:"$(INSTALLDIR)\tao_ft_replicationmanager.exe"
LINK32_OBJS= \
	"$(INTDIR)\FT_ReplicationManager.obj" \
	"$(INTDIR)\FT_ReplicationManager_Main.obj" \
	"$(INTDIR)\FT_Property_Validator.obj" \
	"$(INTDIR)\FT_ReplicationManagerFaultAnalyzer.obj"

"$(INSTALLDIR)\tao_ft_replicationmanager.exe" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(INSTALLDIR)\tao_ft_replicationmanager.exe.manifest" mt.exe -manifest "$(INSTALLDIR)\tao_ft_replicationmanager.exe.manifest" -outputresource:$@;1

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=Release
INSTALLDIR=Release
INTDIR=Release\FT_ReplicationManager\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(INSTALLDIR)\tao_ft_replicationmanager.exe"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_CONSOLE -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -f "Makefile.FT_ReplicationManager.dep" "FT_ReplicationManager.cpp" "FT_ReplicationManager_Main.cpp" "FT_Property_Validator.cpp" "FT_ReplicationManagerFaultAnalyzer.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(INSTALLDIR)\tao_ft_replicationmanager.exe"
	-@del /f/q "$(INSTALLDIR)\tao_ft_replicationmanager.ilk"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\FT_ReplicationManager\$(NULL)" mkdir "Release\FT_ReplicationManager"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _CONSOLE /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_PortableServer.lib TAO_CosNaming.lib TAO_CosEvent.lib TAO_CosNotification.lib TAO_Valuetype.lib TAO_CodecFactory.lib TAO_PI.lib TAO_Messaging.lib TAO_IORManip.lib TAO_PortableGroup.lib TAO_FTORB_Utils.lib TAO_FT_ClientORB.lib TAO_PI_Server.lib TAO_FT_ServerORB.lib TAO_FaultTolerance.lib TAO_CosEvent_Skel.lib TAO_CosNotification_Skel.lib TAO_IORTable.lib TAO_ReplicationManagerLib.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:console  /machine:IA64 /out:"$(INSTALLDIR)\tao_ft_replicationmanager.exe"
LINK32_OBJS= \
	"$(INTDIR)\FT_ReplicationManager.obj" \
	"$(INTDIR)\FT_ReplicationManager_Main.obj" \
	"$(INTDIR)\FT_Property_Validator.obj" \
	"$(INTDIR)\FT_ReplicationManagerFaultAnalyzer.obj"

"$(INSTALLDIR)\tao_ft_replicationmanager.exe" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(INSTALLDIR)\tao_ft_replicationmanager.exe.manifest" mt.exe -manifest "$(INSTALLDIR)\tao_ft_replicationmanager.exe.manifest" -outputresource:$@;1

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=Static_Debug
INSTALLDIR=Static_Debug
INTDIR=Static_Debug\FT_ReplicationManager\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(INSTALLDIR)\tao_ft_replicationmanager.exe"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_CONSOLE -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.FT_ReplicationManager.dep" "FT_ReplicationManager.cpp" "FT_ReplicationManager_Main.cpp" "FT_Property_Validator.cpp" "FT_ReplicationManagerFaultAnalyzer.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(INSTALLDIR)\tao_ft_replicationmanager.pdb"
	-@del /f/q "$(INSTALLDIR)\tao_ft_replicationmanager.exe"
	-@del /f/q "$(INSTALLDIR)\tao_ft_replicationmanager.ilk"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\FT_ReplicationManager\$(NULL)" mkdir "Static_Debug\FT_ReplicationManager"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _CONSOLE /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEsd.lib TAOsd.lib TAO_AnyTypeCodesd.lib TAO_PortableServersd.lib TAO_CosNamingsd.lib TAO_CosEventsd.lib TAO_CosNotificationsd.lib TAO_Valuetypesd.lib TAO_CodecFactorysd.lib TAO_PIsd.lib TAO_Messagingsd.lib TAO_IORManipsd.lib TAO_PortableGroupsd.lib TAO_FTORB_Utilssd.lib TAO_FT_ClientORBsd.lib TAO_PI_Serversd.lib TAO_FT_ServerORBsd.lib TAO_FaultTolerancesd.lib TAO_CosEvent_Skelsd.lib TAO_CosNotification_Skelsd.lib TAO_IORTablesd.lib TAO_ReplicationManagerLibsd.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:console /debug /pdb:"$(INSTALLDIR)\tao_ft_replicationmanager.pdb" /machine:IA64 /out:"$(INSTALLDIR)\tao_ft_replicationmanager.exe"
LINK32_OBJS= \
	"$(INTDIR)\FT_ReplicationManager.obj" \
	"$(INTDIR)\FT_ReplicationManager_Main.obj" \
	"$(INTDIR)\FT_Property_Validator.obj" \
	"$(INTDIR)\FT_ReplicationManagerFaultAnalyzer.obj"

"$(INSTALLDIR)\tao_ft_replicationmanager.exe" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(INSTALLDIR)\tao_ft_replicationmanager.exe.manifest" mt.exe -manifest "$(INSTALLDIR)\tao_ft_replicationmanager.exe.manifest" -outputresource:$@;1

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=Static_Release
INSTALLDIR=Static_Release
INTDIR=Static_Release\FT_ReplicationManager\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(INSTALLDIR)\tao_ft_replicationmanager.exe"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_CONSOLE -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.FT_ReplicationManager.dep" "FT_ReplicationManager.cpp" "FT_ReplicationManager_Main.cpp" "FT_Property_Validator.cpp" "FT_ReplicationManagerFaultAnalyzer.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(INSTALLDIR)\tao_ft_replicationmanager.exe"
	-@del /f/q "$(INSTALLDIR)\tao_ft_replicationmanager.ilk"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\FT_ReplicationManager\$(NULL)" mkdir "Static_Release\FT_ReplicationManager"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _CONSOLE /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEs.lib TAOs.lib TAO_AnyTypeCodes.lib TAO_PortableServers.lib TAO_CosNamings.lib TAO_CosEvents.lib TAO_CosNotifications.lib TAO_Valuetypes.lib TAO_CodecFactorys.lib TAO_PIs.lib TAO_Messagings.lib TAO_IORManips.lib TAO_PortableGroups.lib TAO_FTORB_Utilss.lib TAO_FT_ClientORBs.lib TAO_PI_Servers.lib TAO_FT_ServerORBs.lib TAO_FaultTolerances.lib TAO_CosEvent_Skels.lib TAO_CosNotification_Skels.lib TAO_IORTables.lib TAO_ReplicationManagerLibs.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:console  /machine:IA64 /out:"$(INSTALLDIR)\tao_ft_replicationmanager.exe"
LINK32_OBJS= \
	"$(INTDIR)\FT_ReplicationManager.obj" \
	"$(INTDIR)\FT_ReplicationManager_Main.obj" \
	"$(INTDIR)\FT_Property_Validator.obj" \
	"$(INTDIR)\FT_ReplicationManagerFaultAnalyzer.obj"

"$(INSTALLDIR)\tao_ft_replicationmanager.exe" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(INSTALLDIR)\tao_ft_replicationmanager.exe.manifest" mt.exe -manifest "$(INSTALLDIR)\tao_ft_replicationmanager.exe.manifest" -outputresource:$@;1

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
!IF EXISTS("Makefile.FT_ReplicationManager.dep")
!INCLUDE "Makefile.FT_ReplicationManager.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="FT_ReplicationManager.cpp"

"$(INTDIR)\FT_ReplicationManager.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FT_ReplicationManager.obj" $(SOURCE)

SOURCE="FT_ReplicationManager_Main.cpp"

"$(INTDIR)\FT_ReplicationManager_Main.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FT_ReplicationManager_Main.obj" $(SOURCE)

SOURCE="FT_Property_Validator.cpp"

"$(INTDIR)\FT_Property_Validator.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FT_Property_Validator.obj" $(SOURCE)

SOURCE="FT_ReplicationManagerFaultAnalyzer.cpp"

"$(INTDIR)\FT_ReplicationManagerFaultAnalyzer.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FT_ReplicationManagerFaultAnalyzer.obj" $(SOURCE)

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
!IF EXISTS("Makefile.FT_ReplicationManager.dep")
	@echo Using "Makefile.FT_ReplicationManager.dep"
!ELSE
	@echo Warning: cannot find "Makefile.FT_ReplicationManager.dep"
!ENDIF
!ENDIF

