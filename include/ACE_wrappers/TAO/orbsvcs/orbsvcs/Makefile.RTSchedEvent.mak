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
!MESSAGE NMAKE /f "Makefile.RTSchedEvent.mak" CFG="Win64 Debug"
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
INTDIR=Debug\RTSchedEvent\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_RTSchedEventd.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_RTSCHEDEVENT_BUILD_DLL -f "Makefile.RTSchedEvent.dep" "Event\EC_Gateway_Sched.cpp" "Event\EC_Priority_Dispatching.cpp" "Event\EC_Priority_Scheduling.cpp" "Event\EC_Sched_Factory.cpp" "Event\EC_Sched_Filter.cpp" "Event\EC_Sched_Filter_Builder.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_RTSchedEventd.pdb"
	-@del /f/q "..\..\..\lib\TAO_RTSchedEventd.dll"
	-@del /f/q "$(OUTDIR)\TAO_RTSchedEventd.lib"
	-@del /f/q "$(OUTDIR)\TAO_RTSchedEventd.exp"
	-@del /f/q "$(OUTDIR)\TAO_RTSchedEventd.ilk"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\RTSchedEvent\$(NULL)" mkdir "Debug\RTSchedEvent"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_RTSCHEDEVENT_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_Valuetyped.lib TAO_PortableServerd.lib TAO_CodecFactoryd.lib TAO_PId.lib TAO_Messagingd.lib TAO_Svc_Utilsd.lib TAO_RTEventd.lib TAO_RTEvent_Skeld.lib TAO_RTEvent_Servd.lib TAO_CosNamingd.lib TAO_RTSchedd.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\..\lib\TAO_RTSchedEventd.pdb" /machine:IA64 /out:"..\..\..\lib\TAO_RTSchedEventd.dll" /implib:"$(OUTDIR)\TAO_RTSchedEventd.lib"
LINK32_OBJS= \
	"$(INTDIR)\RTSchedEvent.res" \
	"$(INTDIR)\Event\EC_Gateway_Sched.obj" \
	"$(INTDIR)\Event\EC_Priority_Dispatching.obj" \
	"$(INTDIR)\Event\EC_Priority_Scheduling.obj" \
	"$(INTDIR)\Event\EC_Sched_Factory.obj" \
	"$(INTDIR)\Event\EC_Sched_Filter.obj" \
	"$(INTDIR)\Event\EC_Sched_Filter_Builder.obj"

"..\..\..\lib\TAO_RTSchedEventd.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_RTSchedEventd.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_RTSchedEventd.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\RTSchedEvent\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_RTSchedEvent.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_RTSCHEDEVENT_BUILD_DLL -f "Makefile.RTSchedEvent.dep" "Event\EC_Gateway_Sched.cpp" "Event\EC_Priority_Dispatching.cpp" "Event\EC_Priority_Scheduling.cpp" "Event\EC_Sched_Factory.cpp" "Event\EC_Sched_Filter.cpp" "Event\EC_Sched_Filter_Builder.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\TAO_RTSchedEvent.dll"
	-@del /f/q "$(OUTDIR)\TAO_RTSchedEvent.lib"
	-@del /f/q "$(OUTDIR)\TAO_RTSchedEvent.exp"
	-@del /f/q "$(OUTDIR)\TAO_RTSchedEvent.ilk"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\RTSchedEvent\$(NULL)" mkdir "Release\RTSchedEvent"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_RTSCHEDEVENT_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_Valuetype.lib TAO_PortableServer.lib TAO_CodecFactory.lib TAO_PI.lib TAO_Messaging.lib TAO_Svc_Utils.lib TAO_RTEvent.lib TAO_RTEvent_Skel.lib TAO_RTEvent_Serv.lib TAO_CosNaming.lib TAO_RTSched.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\..\lib\TAO_RTSchedEvent.dll" /implib:"$(OUTDIR)\TAO_RTSchedEvent.lib"
LINK32_OBJS= \
	"$(INTDIR)\RTSchedEvent.res" \
	"$(INTDIR)\Event\EC_Gateway_Sched.obj" \
	"$(INTDIR)\Event\EC_Priority_Dispatching.obj" \
	"$(INTDIR)\Event\EC_Priority_Scheduling.obj" \
	"$(INTDIR)\Event\EC_Sched_Factory.obj" \
	"$(INTDIR)\Event\EC_Sched_Filter.obj" \
	"$(INTDIR)\Event\EC_Sched_Filter_Builder.obj"

"..\..\..\lib\TAO_RTSchedEvent.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_RTSchedEvent.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_RTSchedEvent.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\RTSchedEvent\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_RTSchedEventsd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.RTSchedEvent.dep" "Event\EC_Gateway_Sched.cpp" "Event\EC_Priority_Dispatching.cpp" "Event\EC_Priority_Scheduling.cpp" "Event\EC_Sched_Factory.cpp" "Event\EC_Sched_Filter.cpp" "Event\EC_Sched_Filter_Builder.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_RTSchedEventsd.lib"
	-@del /f/q "$(OUTDIR)\TAO_RTSchedEventsd.exp"
	-@del /f/q "$(OUTDIR)\TAO_RTSchedEventsd.ilk"
	-@del /f/q "..\..\..\lib\TAO_RTSchedEventsd.pdb"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\RTSchedEvent\$(NULL)" mkdir "Static_Debug\RTSchedEvent"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\TAO_RTSchedEventsd.pdb" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_RTSchedEventsd.lib"
LINK32_OBJS= \
	"$(INTDIR)\Event\EC_Gateway_Sched.obj" \
	"$(INTDIR)\Event\EC_Priority_Dispatching.obj" \
	"$(INTDIR)\Event\EC_Priority_Scheduling.obj" \
	"$(INTDIR)\Event\EC_Sched_Factory.obj" \
	"$(INTDIR)\Event\EC_Sched_Filter.obj" \
	"$(INTDIR)\Event\EC_Sched_Filter_Builder.obj"

"$(OUTDIR)\TAO_RTSchedEventsd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_RTSchedEventsd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_RTSchedEventsd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\RTSchedEvent\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_RTSchedEvents.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.RTSchedEvent.dep" "Event\EC_Gateway_Sched.cpp" "Event\EC_Priority_Dispatching.cpp" "Event\EC_Priority_Scheduling.cpp" "Event\EC_Sched_Factory.cpp" "Event\EC_Sched_Filter.cpp" "Event\EC_Sched_Filter_Builder.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_RTSchedEvents.lib"
	-@del /f/q "$(OUTDIR)\TAO_RTSchedEvents.exp"
	-@del /f/q "$(OUTDIR)\TAO_RTSchedEvents.ilk"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\RTSchedEvent\$(NULL)" mkdir "Static_Release\RTSchedEvent"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_RTSchedEvents.lib"
LINK32_OBJS= \
	"$(INTDIR)\Event\EC_Gateway_Sched.obj" \
	"$(INTDIR)\Event\EC_Priority_Dispatching.obj" \
	"$(INTDIR)\Event\EC_Priority_Scheduling.obj" \
	"$(INTDIR)\Event\EC_Sched_Factory.obj" \
	"$(INTDIR)\Event\EC_Sched_Filter.obj" \
	"$(INTDIR)\Event\EC_Sched_Filter_Builder.obj"

"$(OUTDIR)\TAO_RTSchedEvents.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_RTSchedEvents.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_RTSchedEvents.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.RTSchedEvent.dep")
!INCLUDE "Makefile.RTSchedEvent.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="Event\EC_Gateway_Sched.cpp"

"$(INTDIR)\Event\EC_Gateway_Sched.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_Gateway_Sched.obj" $(SOURCE)

SOURCE="Event\EC_Priority_Dispatching.cpp"

"$(INTDIR)\Event\EC_Priority_Dispatching.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_Priority_Dispatching.obj" $(SOURCE)

SOURCE="Event\EC_Priority_Scheduling.cpp"

"$(INTDIR)\Event\EC_Priority_Scheduling.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_Priority_Scheduling.obj" $(SOURCE)

SOURCE="Event\EC_Sched_Factory.cpp"

"$(INTDIR)\Event\EC_Sched_Factory.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_Sched_Factory.obj" $(SOURCE)

SOURCE="Event\EC_Sched_Filter.cpp"

"$(INTDIR)\Event\EC_Sched_Filter.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_Sched_Filter.obj" $(SOURCE)

SOURCE="Event\EC_Sched_Filter_Builder.cpp"

"$(INTDIR)\Event\EC_Sched_Filter_Builder.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Event\$(NULL)" mkdir "$(INTDIR)\Event\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event\EC_Sched_Filter_Builder.obj" $(SOURCE)

!IF  "$(CFG)" == "Win64 Debug"
!ELSEIF  "$(CFG)" == "Win64 Release"
!ELSEIF  "$(CFG)" == "Win64 Static Debug"
!ELSEIF  "$(CFG)" == "Win64 Static Release"
!ENDIF

SOURCE="RTSchedEvent.rc"

"$(INTDIR)\RTSchedEvent.res" : $(SOURCE)
	$(RSC) /l 0x409 /fo"$(INTDIR)\RTSchedEvent.res" /d NDEBUG /d WIN64 /d _CRT_SECURE_NO_WARNINGS /d _CRT_SECURE_NO_DEPRECATE /d _CRT_NONSTDC_NO_DEPRECATE /i "..\..\.." /i "..\.." /i "..\..\orbsvcs" $(SOURCE)



!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.RTSchedEvent.dep")
	@echo Using "Makefile.RTSchedEvent.dep"
!ELSE
	@echo Warning: cannot find "Makefile.RTSchedEvent.dep"
!ENDIF
!ENDIF

