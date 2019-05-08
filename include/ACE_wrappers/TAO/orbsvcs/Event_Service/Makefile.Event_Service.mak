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
!MESSAGE NMAKE /f "Makefile.Event_Service.mak" CFG="Win64 Debug"
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
INTDIR=Debug\Event_Service\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(INSTALLDIR)\tao_rtevent.exe"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_CONSOLE -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -f "Makefile.Event_Service.dep" "Event_Service.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(INSTALLDIR)\tao_rtevent.pdb"
	-@del /f/q "$(INSTALLDIR)\tao_rtevent.exe"
	-@del /f/q "$(INSTALLDIR)\tao_rtevent.ilk"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\Event_Service\$(NULL)" mkdir "Debug\Event_Service"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _CONSOLE /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_Valuetyped.lib TAO_PortableServerd.lib TAO_CodecFactoryd.lib TAO_PId.lib TAO_Messagingd.lib TAO_Svc_Utilsd.lib TAO_RTEventd.lib TAO_RTEvent_Skeld.lib TAO_RTEvent_Servd.lib TAO_CosNamingd.lib TAO_RTSchedd.lib TAO_RTSchedEventd.lib TAO_BiDirGIOPd.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:console /debug /pdb:"$(INSTALLDIR)\tao_rtevent.pdb" /machine:IA64 /out:"$(INSTALLDIR)\tao_rtevent.exe"
LINK32_OBJS= \
	"$(INTDIR)\Event_Service.obj"

"$(INSTALLDIR)\tao_rtevent.exe" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(INSTALLDIR)\tao_rtevent.exe.manifest" mt.exe -manifest "$(INSTALLDIR)\tao_rtevent.exe.manifest" -outputresource:$@;1

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=Release
INSTALLDIR=Release
INTDIR=Release\Event_Service\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(INSTALLDIR)\tao_rtevent.exe"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_CONSOLE -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -f "Makefile.Event_Service.dep" "Event_Service.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(INSTALLDIR)\tao_rtevent.exe"
	-@del /f/q "$(INSTALLDIR)\tao_rtevent.ilk"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\Event_Service\$(NULL)" mkdir "Release\Event_Service"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _CONSOLE /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_Valuetype.lib TAO_PortableServer.lib TAO_CodecFactory.lib TAO_PI.lib TAO_Messaging.lib TAO_Svc_Utils.lib TAO_RTEvent.lib TAO_RTEvent_Skel.lib TAO_RTEvent_Serv.lib TAO_CosNaming.lib TAO_RTSched.lib TAO_RTSchedEvent.lib TAO_BiDirGIOP.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:console  /machine:IA64 /out:"$(INSTALLDIR)\tao_rtevent.exe"
LINK32_OBJS= \
	"$(INTDIR)\Event_Service.obj"

"$(INSTALLDIR)\tao_rtevent.exe" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(INSTALLDIR)\tao_rtevent.exe.manifest" mt.exe -manifest "$(INSTALLDIR)\tao_rtevent.exe.manifest" -outputresource:$@;1

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=Static_Debug
INSTALLDIR=Static_Debug
INTDIR=Static_Debug\Event_Service\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(INSTALLDIR)\tao_rtevent.exe"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_CONSOLE -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.Event_Service.dep" "Event_Service.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(INSTALLDIR)\tao_rtevent.pdb"
	-@del /f/q "$(INSTALLDIR)\tao_rtevent.exe"
	-@del /f/q "$(INSTALLDIR)\tao_rtevent.ilk"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\Event_Service\$(NULL)" mkdir "Static_Debug\Event_Service"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _CONSOLE /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEsd.lib TAOsd.lib TAO_AnyTypeCodesd.lib TAO_Valuetypesd.lib TAO_PortableServersd.lib TAO_CodecFactorysd.lib TAO_PIsd.lib TAO_Messagingsd.lib TAO_Svc_Utilssd.lib TAO_RTEventsd.lib TAO_RTEvent_Skelsd.lib TAO_RTEvent_Servsd.lib TAO_CosNamingsd.lib TAO_RTSchedsd.lib TAO_RTSchedEventsd.lib TAO_BiDirGIOPsd.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:console /debug /pdb:"$(INSTALLDIR)\tao_rtevent.pdb" /machine:IA64 /out:"$(INSTALLDIR)\tao_rtevent.exe"
LINK32_OBJS= \
	"$(INTDIR)\Event_Service.obj"

"$(INSTALLDIR)\tao_rtevent.exe" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(INSTALLDIR)\tao_rtevent.exe.manifest" mt.exe -manifest "$(INSTALLDIR)\tao_rtevent.exe.manifest" -outputresource:$@;1

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=Static_Release
INSTALLDIR=Static_Release
INTDIR=Static_Release\Event_Service\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(INSTALLDIR)\tao_rtevent.exe"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_CONSOLE -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.Event_Service.dep" "Event_Service.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(INSTALLDIR)\tao_rtevent.exe"
	-@del /f/q "$(INSTALLDIR)\tao_rtevent.ilk"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\Event_Service\$(NULL)" mkdir "Static_Release\Event_Service"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _CONSOLE /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEs.lib TAOs.lib TAO_AnyTypeCodes.lib TAO_Valuetypes.lib TAO_PortableServers.lib TAO_CodecFactorys.lib TAO_PIs.lib TAO_Messagings.lib TAO_Svc_Utilss.lib TAO_RTEvents.lib TAO_RTEvent_Skels.lib TAO_RTEvent_Servs.lib TAO_CosNamings.lib TAO_RTScheds.lib TAO_RTSchedEvents.lib TAO_BiDirGIOPs.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:console  /machine:IA64 /out:"$(INSTALLDIR)\tao_rtevent.exe"
LINK32_OBJS= \
	"$(INTDIR)\Event_Service.obj"

"$(INSTALLDIR)\tao_rtevent.exe" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(INSTALLDIR)\tao_rtevent.exe.manifest" mt.exe -manifest "$(INSTALLDIR)\tao_rtevent.exe.manifest" -outputresource:$@;1

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
!IF EXISTS("Makefile.Event_Service.dep")
!INCLUDE "Makefile.Event_Service.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="Event_Service.cpp"

"$(INTDIR)\Event_Service.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event_Service.obj" $(SOURCE)

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
!IF EXISTS("Makefile.Event_Service.dep")
	@echo Using "Makefile.Event_Service.dep"
!ELSE
	@echo Warning: cannot find "Makefile.Event_Service.dep"
!ENDIF
!ENDIF

