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
!MESSAGE NMAKE /f "Makefile.DsEventLogAdmin_Serv.mak" CFG="Win64 Debug"
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
INTDIR=Debug\DsEventLogAdmin_Serv\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_DsEventLogAdmin_Servd.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -DTAO_EVENTLOG_SERV_BUILD_DLL -f "Makefile.DsEventLogAdmin_Serv.dep" "Log\EventLogConsumer.cpp" "Log\EventLogFactory_i.cpp" "Log\EventLogNotification.cpp" "Log\EventLog_i.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_DsEventLogAdmin_Servd.pdb"
	-@del /f/q "..\..\..\lib\TAO_DsEventLogAdmin_Servd.dll"
	-@del /f/q "$(OUTDIR)\TAO_DsEventLogAdmin_Servd.lib"
	-@del /f/q "$(OUTDIR)\TAO_DsEventLogAdmin_Servd.exp"
	-@del /f/q "$(OUTDIR)\TAO_DsEventLogAdmin_Servd.ilk"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\DsEventLogAdmin_Serv\$(NULL)" mkdir "Debug\DsEventLogAdmin_Serv"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D TAO_EVENTLOG_SERV_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_DsLogAdmind.lib TAO_CosEventd.lib TAO_DsEventLogAdmind.lib TAO_PortableServerd.lib TAO_DsLogAdmin_Skeld.lib TAO_CosEvent_Skeld.lib TAO_DsEventLogAdmin_Skeld.lib TAO_Valuetyped.lib TAO_DynamicAnyd.lib ACE_ETCLd.lib TAO_ETCLd.lib ACE_ETCL_Parserd.lib TAO_Svc_Utilsd.lib TAO_CodecFactoryd.lib TAO_PId.lib TAO_Utilsd.lib TAO_DsLogAdmin_Servd.lib TAO_Messagingd.lib TAO_DynamicInterfaced.lib TAO_IFR_Clientd.lib TAO_CosNamingd.lib TAO_CosEvent_Servd.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\..\lib\TAO_DsEventLogAdmin_Servd.pdb" /machine:IA64 /out:"..\..\..\lib\TAO_DsEventLogAdmin_Servd.dll" /implib:"$(OUTDIR)\TAO_DsEventLogAdmin_Servd.lib"
LINK32_OBJS= \
	"$(INTDIR)\Log\EventLogConsumer.obj" \
	"$(INTDIR)\Log\EventLogFactory_i.obj" \
	"$(INTDIR)\Log\EventLogNotification.obj" \
	"$(INTDIR)\Log\EventLog_i.obj"

"..\..\..\lib\TAO_DsEventLogAdmin_Servd.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_DsEventLogAdmin_Servd.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_DsEventLogAdmin_Servd.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\DsEventLogAdmin_Serv\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_DsEventLogAdmin_Serv.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -DTAO_EVENTLOG_SERV_BUILD_DLL -f "Makefile.DsEventLogAdmin_Serv.dep" "Log\EventLogConsumer.cpp" "Log\EventLogFactory_i.cpp" "Log\EventLogNotification.cpp" "Log\EventLog_i.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\TAO_DsEventLogAdmin_Serv.dll"
	-@del /f/q "$(OUTDIR)\TAO_DsEventLogAdmin_Serv.lib"
	-@del /f/q "$(OUTDIR)\TAO_DsEventLogAdmin_Serv.exp"
	-@del /f/q "$(OUTDIR)\TAO_DsEventLogAdmin_Serv.ilk"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\DsEventLogAdmin_Serv\$(NULL)" mkdir "Release\DsEventLogAdmin_Serv"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D TAO_EVENTLOG_SERV_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_DsLogAdmin.lib TAO_CosEvent.lib TAO_DsEventLogAdmin.lib TAO_PortableServer.lib TAO_DsLogAdmin_Skel.lib TAO_CosEvent_Skel.lib TAO_DsEventLogAdmin_Skel.lib TAO_Valuetype.lib TAO_DynamicAny.lib ACE_ETCL.lib TAO_ETCL.lib ACE_ETCL_Parser.lib TAO_Svc_Utils.lib TAO_CodecFactory.lib TAO_PI.lib TAO_Utils.lib TAO_DsLogAdmin_Serv.lib TAO_Messaging.lib TAO_DynamicInterface.lib TAO_IFR_Client.lib TAO_CosNaming.lib TAO_CosEvent_Serv.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\..\lib\TAO_DsEventLogAdmin_Serv.dll" /implib:"$(OUTDIR)\TAO_DsEventLogAdmin_Serv.lib"
LINK32_OBJS= \
	"$(INTDIR)\Log\EventLogConsumer.obj" \
	"$(INTDIR)\Log\EventLogFactory_i.obj" \
	"$(INTDIR)\Log\EventLogNotification.obj" \
	"$(INTDIR)\Log\EventLog_i.obj"

"..\..\..\lib\TAO_DsEventLogAdmin_Serv.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_DsEventLogAdmin_Serv.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_DsEventLogAdmin_Serv.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\DsEventLogAdmin_Serv\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_DsEventLogAdmin_Servsd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.DsEventLogAdmin_Serv.dep" "Log\EventLogConsumer.cpp" "Log\EventLogFactory_i.cpp" "Log\EventLogNotification.cpp" "Log\EventLog_i.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_DsEventLogAdmin_Servsd.lib"
	-@del /f/q "$(OUTDIR)\TAO_DsEventLogAdmin_Servsd.exp"
	-@del /f/q "$(OUTDIR)\TAO_DsEventLogAdmin_Servsd.ilk"
	-@del /f/q "..\..\..\lib\TAO_DsEventLogAdmin_Servsd.pdb"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\DsEventLogAdmin_Serv\$(NULL)" mkdir "Static_Debug\DsEventLogAdmin_Serv"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\TAO_DsEventLogAdmin_Servsd.pdb" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_DsEventLogAdmin_Servsd.lib"
LINK32_OBJS= \
	"$(INTDIR)\Log\EventLogConsumer.obj" \
	"$(INTDIR)\Log\EventLogFactory_i.obj" \
	"$(INTDIR)\Log\EventLogNotification.obj" \
	"$(INTDIR)\Log\EventLog_i.obj"

"$(OUTDIR)\TAO_DsEventLogAdmin_Servsd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_DsEventLogAdmin_Servsd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_DsEventLogAdmin_Servsd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\DsEventLogAdmin_Serv\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_DsEventLogAdmin_Servs.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.DsEventLogAdmin_Serv.dep" "Log\EventLogConsumer.cpp" "Log\EventLogFactory_i.cpp" "Log\EventLogNotification.cpp" "Log\EventLog_i.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_DsEventLogAdmin_Servs.lib"
	-@del /f/q "$(OUTDIR)\TAO_DsEventLogAdmin_Servs.exp"
	-@del /f/q "$(OUTDIR)\TAO_DsEventLogAdmin_Servs.ilk"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\DsEventLogAdmin_Serv\$(NULL)" mkdir "Static_Release\DsEventLogAdmin_Serv"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_DsEventLogAdmin_Servs.lib"
LINK32_OBJS= \
	"$(INTDIR)\Log\EventLogConsumer.obj" \
	"$(INTDIR)\Log\EventLogFactory_i.obj" \
	"$(INTDIR)\Log\EventLogNotification.obj" \
	"$(INTDIR)\Log\EventLog_i.obj"

"$(OUTDIR)\TAO_DsEventLogAdmin_Servs.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_DsEventLogAdmin_Servs.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_DsEventLogAdmin_Servs.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.DsEventLogAdmin_Serv.dep")
!INCLUDE "Makefile.DsEventLogAdmin_Serv.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="Log\EventLogConsumer.cpp"

"$(INTDIR)\Log\EventLogConsumer.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Log\$(NULL)" mkdir "$(INTDIR)\Log\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Log\EventLogConsumer.obj" $(SOURCE)

SOURCE="Log\EventLogFactory_i.cpp"

"$(INTDIR)\Log\EventLogFactory_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Log\$(NULL)" mkdir "$(INTDIR)\Log\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Log\EventLogFactory_i.obj" $(SOURCE)

SOURCE="Log\EventLogNotification.cpp"

"$(INTDIR)\Log\EventLogNotification.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Log\$(NULL)" mkdir "$(INTDIR)\Log\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Log\EventLogNotification.obj" $(SOURCE)

SOURCE="Log\EventLog_i.cpp"

"$(INTDIR)\Log\EventLog_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Log\$(NULL)" mkdir "$(INTDIR)\Log\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Log\EventLog_i.obj" $(SOURCE)

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
!IF EXISTS("Makefile.DsEventLogAdmin_Serv.dep")
	@echo Using "Makefile.DsEventLogAdmin_Serv.dep"
!ELSE
	@echo Warning: cannot find "Makefile.DsEventLogAdmin_Serv.dep"
!ENDIF
!ENDIF

