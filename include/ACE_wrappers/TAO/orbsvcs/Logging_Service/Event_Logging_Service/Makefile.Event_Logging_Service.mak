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
!MESSAGE NMAKE /f "Makefile.Event_Logging_Service.mak" CFG="Win64 Debug"
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
INTDIR=Debug\Event_Logging_Service\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(INSTALLDIR)\tao_tls_event.exe"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\..\.." -I"..\..\.." -I"..\..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_CONSOLE -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -f "Makefile.Event_Logging_Service.dep" "Event_Logging_Service.cpp" "Event_Logging_Server.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(INSTALLDIR)\tao_tls_event.pdb"
	-@del /f/q "$(INSTALLDIR)\tao_tls_event.exe"
	-@del /f/q "$(INSTALLDIR)\tao_tls_event.ilk"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\Event_Logging_Service\$(NULL)" mkdir "Debug\Event_Logging_Service"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\..\.." /I "..\..\.." /I "..\..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _CONSOLE /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_CosNamingd.lib TAO_IORTabled.lib TAO_DsLogAdmind.lib TAO_CosEventd.lib TAO_DsEventLogAdmind.lib TAO_PortableServerd.lib TAO_DsLogAdmin_Skeld.lib TAO_CosEvent_Skeld.lib TAO_DsEventLogAdmin_Skeld.lib TAO_Valuetyped.lib TAO_DynamicAnyd.lib ACE_ETCLd.lib TAO_ETCLd.lib ACE_ETCL_Parserd.lib TAO_Svc_Utilsd.lib TAO_CodecFactoryd.lib TAO_PId.lib TAO_Utilsd.lib TAO_DsLogAdmin_Servd.lib TAO_Messagingd.lib TAO_DynamicInterfaced.lib TAO_IFR_Clientd.lib TAO_CosEvent_Servd.lib TAO_DsEventLogAdmin_Servd.lib /libpath:"." /libpath:"..\..\..\..\lib" /nologo /subsystem:console /debug /pdb:"$(INSTALLDIR)\tao_tls_event.pdb" /machine:IA64 /out:"$(INSTALLDIR)\tao_tls_event.exe"
LINK32_OBJS= \
	"$(INTDIR)\Event_Logging_Service.obj" \
	"$(INTDIR)\Event_Logging_Server.obj"

"$(INSTALLDIR)\tao_tls_event.exe" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(INSTALLDIR)\tao_tls_event.exe.manifest" mt.exe -manifest "$(INSTALLDIR)\tao_tls_event.exe.manifest" -outputresource:$@;1

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=Release
INSTALLDIR=Release
INTDIR=Release\Event_Logging_Service\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(INSTALLDIR)\tao_tls_event.exe"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\..\.." -I"..\..\.." -I"..\..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_CONSOLE -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -f "Makefile.Event_Logging_Service.dep" "Event_Logging_Service.cpp" "Event_Logging_Server.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(INSTALLDIR)\tao_tls_event.exe"
	-@del /f/q "$(INSTALLDIR)\tao_tls_event.ilk"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\Event_Logging_Service\$(NULL)" mkdir "Release\Event_Logging_Service"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\..\.." /I "..\..\.." /I "..\..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _CONSOLE /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_CosNaming.lib TAO_IORTable.lib TAO_DsLogAdmin.lib TAO_CosEvent.lib TAO_DsEventLogAdmin.lib TAO_PortableServer.lib TAO_DsLogAdmin_Skel.lib TAO_CosEvent_Skel.lib TAO_DsEventLogAdmin_Skel.lib TAO_Valuetype.lib TAO_DynamicAny.lib ACE_ETCL.lib TAO_ETCL.lib ACE_ETCL_Parser.lib TAO_Svc_Utils.lib TAO_CodecFactory.lib TAO_PI.lib TAO_Utils.lib TAO_DsLogAdmin_Serv.lib TAO_Messaging.lib TAO_DynamicInterface.lib TAO_IFR_Client.lib TAO_CosEvent_Serv.lib TAO_DsEventLogAdmin_Serv.lib /libpath:"." /libpath:"..\..\..\..\lib" /nologo /subsystem:console  /machine:IA64 /out:"$(INSTALLDIR)\tao_tls_event.exe"
LINK32_OBJS= \
	"$(INTDIR)\Event_Logging_Service.obj" \
	"$(INTDIR)\Event_Logging_Server.obj"

"$(INSTALLDIR)\tao_tls_event.exe" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(INSTALLDIR)\tao_tls_event.exe.manifest" mt.exe -manifest "$(INSTALLDIR)\tao_tls_event.exe.manifest" -outputresource:$@;1

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=Static_Debug
INSTALLDIR=Static_Debug
INTDIR=Static_Debug\Event_Logging_Service\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(INSTALLDIR)\tao_tls_event.exe"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\..\.." -I"..\..\.." -I"..\..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_CONSOLE -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.Event_Logging_Service.dep" "Event_Logging_Service.cpp" "Event_Logging_Server.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(INSTALLDIR)\tao_tls_event.pdb"
	-@del /f/q "$(INSTALLDIR)\tao_tls_event.exe"
	-@del /f/q "$(INSTALLDIR)\tao_tls_event.ilk"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\Event_Logging_Service\$(NULL)" mkdir "Static_Debug\Event_Logging_Service"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\..\.." /I "..\..\.." /I "..\..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _CONSOLE /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEsd.lib TAOsd.lib TAO_AnyTypeCodesd.lib TAO_CosNamingsd.lib TAO_IORTablesd.lib TAO_DsLogAdminsd.lib TAO_CosEventsd.lib TAO_DsEventLogAdminsd.lib TAO_PortableServersd.lib TAO_DsLogAdmin_Skelsd.lib TAO_CosEvent_Skelsd.lib TAO_DsEventLogAdmin_Skelsd.lib TAO_Valuetypesd.lib TAO_DynamicAnysd.lib ACE_ETCLsd.lib TAO_ETCLsd.lib ACE_ETCL_Parsersd.lib TAO_Svc_Utilssd.lib TAO_CodecFactorysd.lib TAO_PIsd.lib TAO_Utilssd.lib TAO_DsLogAdmin_Servsd.lib TAO_Messagingsd.lib TAO_DynamicInterfacesd.lib TAO_IFR_Clientsd.lib TAO_CosEvent_Servsd.lib TAO_DsEventLogAdmin_Servsd.lib /libpath:"." /libpath:"..\..\..\..\lib" /nologo /subsystem:console /debug /pdb:"$(INSTALLDIR)\tao_tls_event.pdb" /machine:IA64 /out:"$(INSTALLDIR)\tao_tls_event.exe"
LINK32_OBJS= \
	"$(INTDIR)\Event_Logging_Service.obj" \
	"$(INTDIR)\Event_Logging_Server.obj"

"$(INSTALLDIR)\tao_tls_event.exe" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(INSTALLDIR)\tao_tls_event.exe.manifest" mt.exe -manifest "$(INSTALLDIR)\tao_tls_event.exe.manifest" -outputresource:$@;1

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=Static_Release
INSTALLDIR=Static_Release
INTDIR=Static_Release\Event_Logging_Service\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(INSTALLDIR)\tao_tls_event.exe"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\..\.." -I"..\..\.." -I"..\..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_CONSOLE -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.Event_Logging_Service.dep" "Event_Logging_Service.cpp" "Event_Logging_Server.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(INSTALLDIR)\tao_tls_event.exe"
	-@del /f/q "$(INSTALLDIR)\tao_tls_event.ilk"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\Event_Logging_Service\$(NULL)" mkdir "Static_Release\Event_Logging_Service"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\..\.." /I "..\..\.." /I "..\..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _CONSOLE /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEs.lib TAOs.lib TAO_AnyTypeCodes.lib TAO_CosNamings.lib TAO_IORTables.lib TAO_DsLogAdmins.lib TAO_CosEvents.lib TAO_DsEventLogAdmins.lib TAO_PortableServers.lib TAO_DsLogAdmin_Skels.lib TAO_CosEvent_Skels.lib TAO_DsEventLogAdmin_Skels.lib TAO_Valuetypes.lib TAO_DynamicAnys.lib ACE_ETCLs.lib TAO_ETCLs.lib ACE_ETCL_Parsers.lib TAO_Svc_Utilss.lib TAO_CodecFactorys.lib TAO_PIs.lib TAO_Utilss.lib TAO_DsLogAdmin_Servs.lib TAO_Messagings.lib TAO_DynamicInterfaces.lib TAO_IFR_Clients.lib TAO_CosEvent_Servs.lib TAO_DsEventLogAdmin_Servs.lib /libpath:"." /libpath:"..\..\..\..\lib" /nologo /subsystem:console  /machine:IA64 /out:"$(INSTALLDIR)\tao_tls_event.exe"
LINK32_OBJS= \
	"$(INTDIR)\Event_Logging_Service.obj" \
	"$(INTDIR)\Event_Logging_Server.obj"

"$(INSTALLDIR)\tao_tls_event.exe" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(INSTALLDIR)\tao_tls_event.exe.manifest" mt.exe -manifest "$(INSTALLDIR)\tao_tls_event.exe.manifest" -outputresource:$@;1

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
!IF EXISTS("Makefile.Event_Logging_Service.dep")
!INCLUDE "Makefile.Event_Logging_Service.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="Event_Logging_Service.cpp"

"$(INTDIR)\Event_Logging_Service.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event_Logging_Service.obj" $(SOURCE)

SOURCE="Event_Logging_Server.cpp"

"$(INTDIR)\Event_Logging_Server.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event_Logging_Server.obj" $(SOURCE)

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
!IF EXISTS("Makefile.Event_Logging_Service.dep")
	@echo Using "Makefile.Event_Logging_Service.dep"
!ELSE
	@echo Warning: cannot find "Makefile.Event_Logging_Service.dep"
!ENDIF
!ENDIF

