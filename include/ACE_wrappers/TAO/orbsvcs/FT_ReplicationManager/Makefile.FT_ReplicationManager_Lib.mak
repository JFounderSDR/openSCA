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
!MESSAGE NMAKE /f "Makefile.FT_ReplicationManager_Lib.mak" CFG="Win64 Debug"
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
INTDIR=Debug\FT_ReplicationManager_Lib\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_ReplicationManagerLibd.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -DTAO_REPLICATIONMANAGERLIB_BUILD_DLL -f "Makefile.FT_ReplicationManager_Lib.dep" "FT_FaultAnalyzer.cpp" "FT_DefaultFaultAnalyzer.cpp" "FT_FaultEventDescriptor.cpp" "FT_FaultConsumer.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_ReplicationManagerLibd.pdb"
	-@del /f/q "..\..\..\lib\TAO_ReplicationManagerLibd.dll"
	-@del /f/q "$(OUTDIR)\TAO_ReplicationManagerLibd.lib"
	-@del /f/q "$(OUTDIR)\TAO_ReplicationManagerLibd.exp"
	-@del /f/q "$(OUTDIR)\TAO_ReplicationManagerLibd.ilk"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\FT_ReplicationManager_Lib\$(NULL)" mkdir "Debug\FT_ReplicationManager_Lib"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D TAO_REPLICATIONMANAGERLIB_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_CosNamingd.lib TAO_CosEventd.lib TAO_CosNotificationd.lib TAO_Valuetyped.lib TAO_PortableServerd.lib TAO_CodecFactoryd.lib TAO_PId.lib TAO_Messagingd.lib TAO_IORManipd.lib TAO_PortableGroupd.lib TAO_FTORB_Utilsd.lib TAO_FT_ClientORBd.lib TAO_PI_Serverd.lib TAO_FT_ServerORBd.lib TAO_FaultToleranced.lib TAO_CosEvent_Skeld.lib TAO_CosNotification_Skeld.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\..\lib\TAO_ReplicationManagerLibd.pdb" /machine:IA64 /out:"..\..\..\lib\TAO_ReplicationManagerLibd.dll" /implib:"$(OUTDIR)\TAO_ReplicationManagerLibd.lib"
LINK32_OBJS= \
	"$(INTDIR)\FT_FaultAnalyzer.obj" \
	"$(INTDIR)\FT_DefaultFaultAnalyzer.obj" \
	"$(INTDIR)\FT_FaultEventDescriptor.obj" \
	"$(INTDIR)\FT_FaultConsumer.obj"

"..\..\..\lib\TAO_ReplicationManagerLibd.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_ReplicationManagerLibd.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_ReplicationManagerLibd.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\FT_ReplicationManager_Lib\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_ReplicationManagerLib.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -DTAO_REPLICATIONMANAGERLIB_BUILD_DLL -f "Makefile.FT_ReplicationManager_Lib.dep" "FT_FaultAnalyzer.cpp" "FT_DefaultFaultAnalyzer.cpp" "FT_FaultEventDescriptor.cpp" "FT_FaultConsumer.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\TAO_ReplicationManagerLib.dll"
	-@del /f/q "$(OUTDIR)\TAO_ReplicationManagerLib.lib"
	-@del /f/q "$(OUTDIR)\TAO_ReplicationManagerLib.exp"
	-@del /f/q "$(OUTDIR)\TAO_ReplicationManagerLib.ilk"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\FT_ReplicationManager_Lib\$(NULL)" mkdir "Release\FT_ReplicationManager_Lib"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D TAO_REPLICATIONMANAGERLIB_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_CosNaming.lib TAO_CosEvent.lib TAO_CosNotification.lib TAO_Valuetype.lib TAO_PortableServer.lib TAO_CodecFactory.lib TAO_PI.lib TAO_Messaging.lib TAO_IORManip.lib TAO_PortableGroup.lib TAO_FTORB_Utils.lib TAO_FT_ClientORB.lib TAO_PI_Server.lib TAO_FT_ServerORB.lib TAO_FaultTolerance.lib TAO_CosEvent_Skel.lib TAO_CosNotification_Skel.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\..\lib\TAO_ReplicationManagerLib.dll" /implib:"$(OUTDIR)\TAO_ReplicationManagerLib.lib"
LINK32_OBJS= \
	"$(INTDIR)\FT_FaultAnalyzer.obj" \
	"$(INTDIR)\FT_DefaultFaultAnalyzer.obj" \
	"$(INTDIR)\FT_FaultEventDescriptor.obj" \
	"$(INTDIR)\FT_FaultConsumer.obj"

"..\..\..\lib\TAO_ReplicationManagerLib.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_ReplicationManagerLib.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_ReplicationManagerLib.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\FT_ReplicationManager_Lib\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_ReplicationManagerLibsd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.FT_ReplicationManager_Lib.dep" "FT_FaultAnalyzer.cpp" "FT_DefaultFaultAnalyzer.cpp" "FT_FaultEventDescriptor.cpp" "FT_FaultConsumer.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_ReplicationManagerLibsd.lib"
	-@del /f/q "$(OUTDIR)\TAO_ReplicationManagerLibsd.exp"
	-@del /f/q "$(OUTDIR)\TAO_ReplicationManagerLibsd.ilk"
	-@del /f/q "..\..\..\lib\TAO_ReplicationManagerLibsd.pdb"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\FT_ReplicationManager_Lib\$(NULL)" mkdir "Static_Debug\FT_ReplicationManager_Lib"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\TAO_ReplicationManagerLibsd.pdb" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_ReplicationManagerLibsd.lib"
LINK32_OBJS= \
	"$(INTDIR)\FT_FaultAnalyzer.obj" \
	"$(INTDIR)\FT_DefaultFaultAnalyzer.obj" \
	"$(INTDIR)\FT_FaultEventDescriptor.obj" \
	"$(INTDIR)\FT_FaultConsumer.obj"

"$(OUTDIR)\TAO_ReplicationManagerLibsd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_ReplicationManagerLibsd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_ReplicationManagerLibsd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\FT_ReplicationManager_Lib\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_ReplicationManagerLibs.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.FT_ReplicationManager_Lib.dep" "FT_FaultAnalyzer.cpp" "FT_DefaultFaultAnalyzer.cpp" "FT_FaultEventDescriptor.cpp" "FT_FaultConsumer.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_ReplicationManagerLibs.lib"
	-@del /f/q "$(OUTDIR)\TAO_ReplicationManagerLibs.exp"
	-@del /f/q "$(OUTDIR)\TAO_ReplicationManagerLibs.ilk"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\FT_ReplicationManager_Lib\$(NULL)" mkdir "Static_Release\FT_ReplicationManager_Lib"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_ReplicationManagerLibs.lib"
LINK32_OBJS= \
	"$(INTDIR)\FT_FaultAnalyzer.obj" \
	"$(INTDIR)\FT_DefaultFaultAnalyzer.obj" \
	"$(INTDIR)\FT_FaultEventDescriptor.obj" \
	"$(INTDIR)\FT_FaultConsumer.obj"

"$(OUTDIR)\TAO_ReplicationManagerLibs.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_ReplicationManagerLibs.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_ReplicationManagerLibs.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.FT_ReplicationManager_Lib.dep")
!INCLUDE "Makefile.FT_ReplicationManager_Lib.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="FT_FaultAnalyzer.cpp"

"$(INTDIR)\FT_FaultAnalyzer.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FT_FaultAnalyzer.obj" $(SOURCE)

SOURCE="FT_DefaultFaultAnalyzer.cpp"

"$(INTDIR)\FT_DefaultFaultAnalyzer.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FT_DefaultFaultAnalyzer.obj" $(SOURCE)

SOURCE="FT_FaultEventDescriptor.cpp"

"$(INTDIR)\FT_FaultEventDescriptor.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FT_FaultEventDescriptor.obj" $(SOURCE)

SOURCE="FT_FaultConsumer.cpp"

"$(INTDIR)\FT_FaultConsumer.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FT_FaultConsumer.obj" $(SOURCE)

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
!IF EXISTS("Makefile.FT_ReplicationManager_Lib.dep")
	@echo Using "Makefile.FT_ReplicationManager_Lib.dep"
!ELSE
	@echo Warning: cannot find "Makefile.FT_ReplicationManager_Lib.dep"
!ENDIF
!ENDIF

