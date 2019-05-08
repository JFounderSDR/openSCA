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
!MESSAGE NMAKE /f "Makefile.RTKokyuEvent.mak" CFG="Win64 Debug"
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
INTDIR=Debug\RTKokyuEvent\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_RTKokyuEventd.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -I"..\..\..\Kokyu" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_RTKOKYUEVENT_BUILD_DLL -f "Makefile.RTKokyuEvent.dep" "Event\EC_Kokyu_Dispatching.cpp" "Event\EC_Kokyu_Factory.cpp" "Event\EC_Kokyu_Filter.cpp" "Event\EC_Kokyu_Filter_Builder.cpp" "Event\EC_Kokyu_Scheduling.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_RTKokyuEventd.pdb"
	-@del /f/q "..\..\..\lib\TAO_RTKokyuEventd.dll"
	-@del /f/q "$(OUTDIR)\TAO_RTKokyuEventd.lib"
	-@del /f/q "$(OUTDIR)\TAO_RTKokyuEventd.exp"
	-@del /f/q "$(OUTDIR)\TAO_RTKokyuEventd.ilk"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\RTKokyuEvent\$(NULL)" mkdir "Debug\RTKokyuEvent"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /I "..\..\..\Kokyu" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_RTKOKYUEVENT_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_Valuetyped.lib TAO_PortableServerd.lib TAO_CodecFactoryd.lib TAO_PId.lib TAO_Messagingd.lib TAO_Svc_Utilsd.lib TAO_RTEventd.lib TAO_RTEvent_Skeld.lib TAO_RTEvent_Servd.lib TAO_CosNamingd.lib TAO_RTSchedd.lib Kokyud.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\..\lib\TAO_RTKokyuEventd.pdb" /machine:IA64 /out:"..\..\..\lib\TAO_RTKokyuEventd.dll" /implib:"$(OUTDIR)\TAO_RTKokyuEventd.lib"
LINK32_OBJS= \
	"$(INTDIR)\Event\EC_Kokyu_Dispatching.obj" \
	"$(INTDIR)\Event\EC_Kokyu_Factory.obj" \
	"$(INTDIR)\Event\EC_Kokyu_Filter.obj" \
	"$(INTDIR)\Event\EC_Kokyu_Filter_Builder.obj" \
	"$(INTDIR)\Event\EC_Kokyu_Scheduling.obj"

"..\..\..\lib\TAO_RTKokyuEventd.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_RTKokyuEventd.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_RTKokyuEventd.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\RTKokyuEvent\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_RTKokyuEvent.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -I"..\..\..\Kokyu" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_RTKOKYUEVENT_BUILD_DLL -f "Makefile.RTKokyuEvent.dep" "Event\EC_Kokyu_Dispatching.cpp" "Event\EC_Kokyu_Factory.cpp" "Event\EC_Kokyu_Filter.cpp" "Event\EC_Kokyu_Filter_Builder.cpp" "Event\EC_Kokyu_Scheduling.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\TAO_RTKokyuEvent.dll"
	-@del /f/q "$(OUTDIR)\TAO_RTKokyuEvent.lib"
	-@del /f/q "$(OUTDIR)\TAO_RTKokyuEvent.exp"
	-@del /f/q "$(OUTDIR)\TAO_RTKokyuEvent.ilk"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\RTKokyuEvent\$(NULL)" mkdir "Release\RTKokyuEvent"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /I "..\..\..\Kokyu" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_RTKOKYUEVENT_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_Valuetype.lib TAO_PortableServer.lib TAO_CodecFactory.lib TAO_PI.lib TAO_Messaging.lib TAO_Svc_Utils.lib TAO_RTEvent.lib TAO_RTEvent_Skel.lib TAO_RTEvent_Serv.lib TAO_CosNaming.lib TAO_RTSched.lib Kokyu.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\..\lib\TAO_RTKokyuEvent.dll" /implib:"$(OUTDIR)\TAO_RTKokyuEvent.lib"
LINK32_OBJS= \
	"$(INTDIR)\Event\EC_Kokyu_Dispatching.obj" \
	"$(INTDIR)\Event\EC_Kokyu_Factory.obj" \
	"$(INTDIR)\Event\EC_Kokyu_Filter.obj" \
	"$(INTDIR)\Event\EC_Kokyu_Filter_Builder.obj" \
	"$(INTDIR)\Event\EC_Kokyu_Scheduling.obj"

"..\..\..\lib\TAO_RTKokyuEvent.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_RTKokyuEvent.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_RTKokyuEvent.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\RTKokyuEvent\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_RTKokyuEventsd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -I"..\..\..\Kokyu" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.RTKokyuEvent.dep" "Event\EC_Kokyu_Dispatching.cpp" "Event\EC_Kokyu_Factory.cpp" "Event\EC_Kokyu_Filter.cpp" "Event\EC_Kokyu_Filter_Builder.cpp" "Event\EC_Kokyu_Scheduling.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_RTKokyuEventsd.lib"
	-@del /f/q "$(OUTDIR)\TAO_RTKokyuEventsd.exp"
	-@del /f/q "$(OUTDIR)\TAO_RTKokyuEventsd.ilk"
	-@del /f/q "..\..\..\lib\TAO_RTKokyuEventsd.pdb"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\RTKokyuEvent\$(NULL)" mkdir "Static_Debug\RTKokyuEvent"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\TAO_RTKokyuEventsd.pdb" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /I "..\..\..\Kokyu" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_RTKokyuEventsd.lib"
LINK32_OBJS= \
	"$(INTDIR)\Event\EC_Kokyu_Dispatching.obj" \
	"$(INTDIR)\Event\EC_Kokyu_Factory.obj" \
	"$(INTDIR)\Event\EC_Kokyu_Filter.obj" \
	"$(INTDIR)\Event\EC_Kokyu_Filter_Builder.obj" \
	"$(INTDIR)\Event\EC_Kokyu_Scheduling.obj"

"$(OUTDIR)\TAO_RTKokyuEventsd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_RTKokyuEventsd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_RTKokyuEventsd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\RTKokyuEvent\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_RTKokyuEvents.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -I"..\..\..\Kokyu" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.RTKokyuEvent.dep" "Event\EC_Kokyu_Dispatching.cpp" "Event\EC_Kokyu_Factory.cpp" "Event\EC_Kokyu_Filter.cpp" "Event\EC_Kokyu_Filter_Builder.cpp" "Event\EC_Kokyu_Scheduling.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_RTKokyuEvents.lib"
	-@del /f/q "$(OUTDIR)\TAO_RTKokyuEvents.exp"
	-@del /f/q "$(OUTDIR)\TAO_RTKokyuEvents.ilk"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\RTKokyuEvent\$(NULL)" mkdir "Static_Release\RTKokyuEvent"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /I "..\..\..\Kokyu" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_RTKokyuEvents.lib"
LINK32_OBJS= \
	"$(INTDIR)\Event\EC_Kokyu_Dispatching.obj" \
	"$(INTDIR)\Event\EC_Kokyu_Factory.obj" \
	"$(INTDIR)\Event\EC_Kokyu_Filter.obj" \
	"$(INTDIR)\Event\EC_Kokyu_Filter_Builder.obj" \
	"$(INTDIR)\Event\EC_Kokyu_Scheduling.obj"

"$(OUTDIR)\TAO_RTKokyuEvents.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_RTKokyuEvents.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_RTKokyuEvents.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.RTKokyuEvent.dep")
!INCLUDE "Makefile.RTKokyuEvent.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="Event\EC_Kokyu_Dispatching.cpp"

"$(INTDIR)\Event\EC_Kokyu_Dispatching.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_Kokyu_Dispatching.obj" $(SOURCE)

SOURCE="Event\EC_Kokyu_Factory.cpp"

"$(INTDIR)\Event\EC_Kokyu_Factory.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_Kokyu_Factory.obj" $(SOURCE)

SOURCE="Event\EC_Kokyu_Filter.cpp"

"$(INTDIR)\Event\EC_Kokyu_Filter.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_Kokyu_Filter.obj" $(SOURCE)

SOURCE="Event\EC_Kokyu_Filter_Builder.cpp"

"$(INTDIR)\Event\EC_Kokyu_Filter_Builder.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_Kokyu_Filter_Builder.obj" $(SOURCE)

SOURCE="Event\EC_Kokyu_Scheduling.cpp"

"$(INTDIR)\Event\EC_Kokyu_Scheduling.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_Kokyu_Scheduling.obj" $(SOURCE)

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
!IF EXISTS("Makefile.RTKokyuEvent.dep")
	@echo Using "Makefile.RTKokyuEvent.dep"
!ELSE
	@echo Warning: cannot find "Makefile.RTKokyuEvent.dep"
!ENDIF
!ENDIF

