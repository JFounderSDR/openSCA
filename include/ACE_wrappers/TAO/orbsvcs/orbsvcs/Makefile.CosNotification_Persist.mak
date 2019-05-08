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
!MESSAGE NMAKE /f "Makefile.CosNotification_Persist.mak" CFG="Win64 Debug"
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
INTDIR=Debug\CosNotification_Persist\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_CosNotification_Persistd.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -I"..\..\..\ACEXML\common" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -DTAO_NOTIFY_PERSIST_BUILD_DLL -f "Makefile.CosNotification_Persist.dep" "Notify\XML_Loader.cpp" "Notify\XML_Saver.cpp" "Notify\XML_Topology_Factory.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_Persistd.pdb"
	-@del /f/q "..\..\..\lib\TAO_CosNotification_Persistd.dll"
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_Persistd.lib"
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_Persistd.exp"
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_Persistd.ilk"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\CosNotification_Persist\$(NULL)" mkdir "Debug\CosNotification_Persist"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /I "..\..\..\ACEXML\common" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D TAO_NOTIFY_PERSIST_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_PortableServerd.lib TAO_Svc_Utilsd.lib TAO_CosEventd.lib TAO_CosNotificationd.lib TAO_CosEvent_Skeld.lib TAO_CosNotification_Skeld.lib ACE_ETCLd.lib TAO_ETCLd.lib ACE_ETCL_Parserd.lib TAO_Valuetyped.lib TAO_DynamicAnyd.lib TAO_CodecFactoryd.lib TAO_PId.lib TAO_Messagingd.lib TAO_CosNotification_Servd.lib ACEXMLd.lib ACEXML_Parserd.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\..\lib\TAO_CosNotification_Persistd.pdb" /machine:IA64 /out:"..\..\..\lib\TAO_CosNotification_Persistd.dll" /implib:"$(OUTDIR)\TAO_CosNotification_Persistd.lib"
LINK32_OBJS= \
	"$(INTDIR)\Notify\XML_Loader.obj" \
	"$(INTDIR)\Notify\XML_Saver.obj" \
	"$(INTDIR)\Notify\XML_Topology_Factory.obj"

"..\..\..\lib\TAO_CosNotification_Persistd.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_CosNotification_Persistd.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_CosNotification_Persistd.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\CosNotification_Persist\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_CosNotification_Persist.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -I"..\..\..\ACEXML\common" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -DTAO_NOTIFY_PERSIST_BUILD_DLL -f "Makefile.CosNotification_Persist.dep" "Notify\XML_Loader.cpp" "Notify\XML_Saver.cpp" "Notify\XML_Topology_Factory.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\TAO_CosNotification_Persist.dll"
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_Persist.lib"
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_Persist.exp"
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_Persist.ilk"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\CosNotification_Persist\$(NULL)" mkdir "Release\CosNotification_Persist"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /I "..\..\..\ACEXML\common" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D TAO_NOTIFY_PERSIST_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_PortableServer.lib TAO_Svc_Utils.lib TAO_CosEvent.lib TAO_CosNotification.lib TAO_CosEvent_Skel.lib TAO_CosNotification_Skel.lib ACE_ETCL.lib TAO_ETCL.lib ACE_ETCL_Parser.lib TAO_Valuetype.lib TAO_DynamicAny.lib TAO_CodecFactory.lib TAO_PI.lib TAO_Messaging.lib TAO_CosNotification_Serv.lib ACEXML.lib ACEXML_Parser.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\..\lib\TAO_CosNotification_Persist.dll" /implib:"$(OUTDIR)\TAO_CosNotification_Persist.lib"
LINK32_OBJS= \
	"$(INTDIR)\Notify\XML_Loader.obj" \
	"$(INTDIR)\Notify\XML_Saver.obj" \
	"$(INTDIR)\Notify\XML_Topology_Factory.obj"

"..\..\..\lib\TAO_CosNotification_Persist.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_CosNotification_Persist.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_CosNotification_Persist.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\CosNotification_Persist\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_CosNotification_Persistsd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -I"..\..\..\ACEXML\common" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.CosNotification_Persist.dep" "Notify\XML_Loader.cpp" "Notify\XML_Saver.cpp" "Notify\XML_Topology_Factory.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_Persistsd.lib"
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_Persistsd.exp"
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_Persistsd.ilk"
	-@del /f/q "..\..\..\lib\TAO_CosNotification_Persistsd.pdb"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\CosNotification_Persist\$(NULL)" mkdir "Static_Debug\CosNotification_Persist"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\TAO_CosNotification_Persistsd.pdb" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /I "..\..\..\ACEXML\common" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_CosNotification_Persistsd.lib"
LINK32_OBJS= \
	"$(INTDIR)\Notify\XML_Loader.obj" \
	"$(INTDIR)\Notify\XML_Saver.obj" \
	"$(INTDIR)\Notify\XML_Topology_Factory.obj"

"$(OUTDIR)\TAO_CosNotification_Persistsd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_CosNotification_Persistsd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_CosNotification_Persistsd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\CosNotification_Persist\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_CosNotification_Persists.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -I"..\..\..\ACEXML\common" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.CosNotification_Persist.dep" "Notify\XML_Loader.cpp" "Notify\XML_Saver.cpp" "Notify\XML_Topology_Factory.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_Persists.lib"
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_Persists.exp"
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_Persists.ilk"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\CosNotification_Persist\$(NULL)" mkdir "Static_Release\CosNotification_Persist"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /I "..\..\..\ACEXML\common" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_CosNotification_Persists.lib"
LINK32_OBJS= \
	"$(INTDIR)\Notify\XML_Loader.obj" \
	"$(INTDIR)\Notify\XML_Saver.obj" \
	"$(INTDIR)\Notify\XML_Topology_Factory.obj"

"$(OUTDIR)\TAO_CosNotification_Persists.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_CosNotification_Persists.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_CosNotification_Persists.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.CosNotification_Persist.dep")
!INCLUDE "Makefile.CosNotification_Persist.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="Notify\XML_Loader.cpp"

"$(INTDIR)\Notify\XML_Loader.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\XML_Loader.obj" $(SOURCE)

SOURCE="Notify\XML_Saver.cpp"

"$(INTDIR)\Notify\XML_Saver.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\XML_Saver.obj" $(SOURCE)

SOURCE="Notify\XML_Topology_Factory.cpp"

"$(INTDIR)\Notify\XML_Topology_Factory.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\XML_Topology_Factory.obj" $(SOURCE)

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
!IF EXISTS("Makefile.CosNotification_Persist.dep")
	@echo Using "Makefile.CosNotification_Persist.dep"
!ELSE
	@echo Warning: cannot find "Makefile.CosNotification_Persist.dep"
!ENDIF
!ENDIF

