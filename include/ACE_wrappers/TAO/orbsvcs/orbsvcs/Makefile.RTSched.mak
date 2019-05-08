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
!MESSAGE NMAKE /f "Makefile.RTSched.mak" CFG="Win64 Debug"
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

GENERATED_DIRTY = "RtecSchedulerC.inl" "RtecSchedulerS.inl" "RtecSchedulerC.h" "RtecSchedulerS.h" "RtecSchedulerC.cpp" "RtecSchedulerS.cpp"

!IF  "$(CFG)" == "Win64 Debug"

OUTDIR=..\..\..\lib
INTDIR=Debug\RTSched\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_RTSchedd.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_RTSCHED_BUILD_DLL -f "Makefile.RTSched.dep" "RtecSchedulerC.cpp" "RtecSchedulerS.cpp" "Scheduler_Factory.cpp" "Runtime_Scheduler.cpp" "Scheduler_Utilities.cpp" "Sched\DynSched.cpp" "Sched\Reconfig_Sched_Utils.cpp" "Sched\SchedEntry.cpp" "Sched\Strategy_Scheduler.cpp" "Sched\Scheduler.cpp" "Sched\Scheduler_Generic.cpp" "Sched\Config_Scheduler.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_RTSchedd.pdb"
	-@del /f/q "..\..\..\lib\TAO_RTSchedd.dll"
	-@del /f/q "$(OUTDIR)\TAO_RTSchedd.lib"
	-@del /f/q "$(OUTDIR)\TAO_RTSchedd.exp"
	-@del /f/q "$(OUTDIR)\TAO_RTSchedd.ilk"
	-@del /f/q "RtecSchedulerC.inl"
	-@del /f/q "RtecSchedulerS.inl"
	-@del /f/q "RtecSchedulerC.h"
	-@del /f/q "RtecSchedulerS.h"
	-@del /f/q "RtecSchedulerC.cpp"
	-@del /f/q "RtecSchedulerS.cpp"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\RTSched\$(NULL)" mkdir "Debug\RTSched"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_RTSCHED_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_CosNamingd.lib TAO_PortableServerd.lib TAO_Svc_Utilsd.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\..\lib\TAO_RTSchedd.pdb" /machine:IA64 /out:"..\..\..\lib\TAO_RTSchedd.dll" /implib:"$(OUTDIR)\TAO_RTSchedd.lib"
LINK32_OBJS= \
	"$(INTDIR)\RTSched.res" \
	"$(INTDIR)\RtecSchedulerC.obj" \
	"$(INTDIR)\RtecSchedulerS.obj" \
	"$(INTDIR)\Scheduler_Factory.obj" \
	"$(INTDIR)\Runtime_Scheduler.obj" \
	"$(INTDIR)\Scheduler_Utilities.obj" \
	"$(INTDIR)\Sched\DynSched.obj" \
	"$(INTDIR)\Sched\Reconfig_Sched_Utils.obj" \
	"$(INTDIR)\Sched\SchedEntry.obj" \
	"$(INTDIR)\Sched\Strategy_Scheduler.obj" \
	"$(INTDIR)\Sched\Scheduler.obj" \
	"$(INTDIR)\Sched\Scheduler_Generic.obj" \
	"$(INTDIR)\Sched\Config_Scheduler.obj"

"..\..\..\lib\TAO_RTSchedd.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_RTSchedd.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_RTSchedd.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\RTSched\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_RTSched.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_RTSCHED_BUILD_DLL -f "Makefile.RTSched.dep" "RtecSchedulerC.cpp" "RtecSchedulerS.cpp" "Scheduler_Factory.cpp" "Runtime_Scheduler.cpp" "Scheduler_Utilities.cpp" "Sched\DynSched.cpp" "Sched\Reconfig_Sched_Utils.cpp" "Sched\SchedEntry.cpp" "Sched\Strategy_Scheduler.cpp" "Sched\Scheduler.cpp" "Sched\Scheduler_Generic.cpp" "Sched\Config_Scheduler.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\TAO_RTSched.dll"
	-@del /f/q "$(OUTDIR)\TAO_RTSched.lib"
	-@del /f/q "$(OUTDIR)\TAO_RTSched.exp"
	-@del /f/q "$(OUTDIR)\TAO_RTSched.ilk"
	-@del /f/q "RtecSchedulerC.inl"
	-@del /f/q "RtecSchedulerS.inl"
	-@del /f/q "RtecSchedulerC.h"
	-@del /f/q "RtecSchedulerS.h"
	-@del /f/q "RtecSchedulerC.cpp"
	-@del /f/q "RtecSchedulerS.cpp"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\RTSched\$(NULL)" mkdir "Release\RTSched"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_RTSCHED_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_CosNaming.lib TAO_PortableServer.lib TAO_Svc_Utils.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\..\lib\TAO_RTSched.dll" /implib:"$(OUTDIR)\TAO_RTSched.lib"
LINK32_OBJS= \
	"$(INTDIR)\RTSched.res" \
	"$(INTDIR)\RtecSchedulerC.obj" \
	"$(INTDIR)\RtecSchedulerS.obj" \
	"$(INTDIR)\Scheduler_Factory.obj" \
	"$(INTDIR)\Runtime_Scheduler.obj" \
	"$(INTDIR)\Scheduler_Utilities.obj" \
	"$(INTDIR)\Sched\DynSched.obj" \
	"$(INTDIR)\Sched\Reconfig_Sched_Utils.obj" \
	"$(INTDIR)\Sched\SchedEntry.obj" \
	"$(INTDIR)\Sched\Strategy_Scheduler.obj" \
	"$(INTDIR)\Sched\Scheduler.obj" \
	"$(INTDIR)\Sched\Scheduler_Generic.obj" \
	"$(INTDIR)\Sched\Config_Scheduler.obj"

"..\..\..\lib\TAO_RTSched.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_RTSched.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_RTSched.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\RTSched\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_RTSchedsd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.RTSched.dep" "RtecSchedulerC.cpp" "RtecSchedulerS.cpp" "Scheduler_Factory.cpp" "Runtime_Scheduler.cpp" "Scheduler_Utilities.cpp" "Sched\DynSched.cpp" "Sched\Reconfig_Sched_Utils.cpp" "Sched\SchedEntry.cpp" "Sched\Strategy_Scheduler.cpp" "Sched\Scheduler.cpp" "Sched\Scheduler_Generic.cpp" "Sched\Config_Scheduler.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_RTSchedsd.lib"
	-@del /f/q "$(OUTDIR)\TAO_RTSchedsd.exp"
	-@del /f/q "$(OUTDIR)\TAO_RTSchedsd.ilk"
	-@del /f/q "..\..\..\lib\TAO_RTSchedsd.pdb"
	-@del /f/q "RtecSchedulerC.inl"
	-@del /f/q "RtecSchedulerS.inl"
	-@del /f/q "RtecSchedulerC.h"
	-@del /f/q "RtecSchedulerS.h"
	-@del /f/q "RtecSchedulerC.cpp"
	-@del /f/q "RtecSchedulerS.cpp"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\RTSched\$(NULL)" mkdir "Static_Debug\RTSched"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\TAO_RTSchedsd.pdb" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_RTSchedsd.lib"
LINK32_OBJS= \
	"$(INTDIR)\RtecSchedulerC.obj" \
	"$(INTDIR)\RtecSchedulerS.obj" \
	"$(INTDIR)\Scheduler_Factory.obj" \
	"$(INTDIR)\Runtime_Scheduler.obj" \
	"$(INTDIR)\Scheduler_Utilities.obj" \
	"$(INTDIR)\Sched\DynSched.obj" \
	"$(INTDIR)\Sched\Reconfig_Sched_Utils.obj" \
	"$(INTDIR)\Sched\SchedEntry.obj" \
	"$(INTDIR)\Sched\Strategy_Scheduler.obj" \
	"$(INTDIR)\Sched\Scheduler.obj" \
	"$(INTDIR)\Sched\Scheduler_Generic.obj" \
	"$(INTDIR)\Sched\Config_Scheduler.obj"

"$(OUTDIR)\TAO_RTSchedsd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_RTSchedsd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_RTSchedsd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\RTSched\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_RTScheds.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.RTSched.dep" "RtecSchedulerC.cpp" "RtecSchedulerS.cpp" "Scheduler_Factory.cpp" "Runtime_Scheduler.cpp" "Scheduler_Utilities.cpp" "Sched\DynSched.cpp" "Sched\Reconfig_Sched_Utils.cpp" "Sched\SchedEntry.cpp" "Sched\Strategy_Scheduler.cpp" "Sched\Scheduler.cpp" "Sched\Scheduler_Generic.cpp" "Sched\Config_Scheduler.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_RTScheds.lib"
	-@del /f/q "$(OUTDIR)\TAO_RTScheds.exp"
	-@del /f/q "$(OUTDIR)\TAO_RTScheds.ilk"
	-@del /f/q "RtecSchedulerC.inl"
	-@del /f/q "RtecSchedulerS.inl"
	-@del /f/q "RtecSchedulerC.h"
	-@del /f/q "RtecSchedulerS.h"
	-@del /f/q "RtecSchedulerC.cpp"
	-@del /f/q "RtecSchedulerS.cpp"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\RTSched\$(NULL)" mkdir "Static_Release\RTSched"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_RTScheds.lib"
LINK32_OBJS= \
	"$(INTDIR)\RtecSchedulerC.obj" \
	"$(INTDIR)\RtecSchedulerS.obj" \
	"$(INTDIR)\Scheduler_Factory.obj" \
	"$(INTDIR)\Runtime_Scheduler.obj" \
	"$(INTDIR)\Scheduler_Utilities.obj" \
	"$(INTDIR)\Sched\DynSched.obj" \
	"$(INTDIR)\Sched\Reconfig_Sched_Utils.obj" \
	"$(INTDIR)\Sched\SchedEntry.obj" \
	"$(INTDIR)\Sched\Strategy_Scheduler.obj" \
	"$(INTDIR)\Sched\Scheduler.obj" \
	"$(INTDIR)\Sched\Scheduler_Generic.obj" \
	"$(INTDIR)\Sched\Config_Scheduler.obj"

"$(OUTDIR)\TAO_RTScheds.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_RTScheds.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_RTScheds.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.RTSched.dep")
!INCLUDE "Makefile.RTSched.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="RtecSchedulerC.cpp"

"$(INTDIR)\RtecSchedulerC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RtecSchedulerC.obj" $(SOURCE)

SOURCE="RtecSchedulerS.cpp"

"$(INTDIR)\RtecSchedulerS.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RtecSchedulerS.obj" $(SOURCE)

SOURCE="Scheduler_Factory.cpp"

"$(INTDIR)\Scheduler_Factory.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Scheduler_Factory.obj" $(SOURCE)

SOURCE="Runtime_Scheduler.cpp"

"$(INTDIR)\Runtime_Scheduler.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Runtime_Scheduler.obj" $(SOURCE)

SOURCE="Scheduler_Utilities.cpp"

"$(INTDIR)\Scheduler_Utilities.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Scheduler_Utilities.obj" $(SOURCE)

SOURCE="Sched\DynSched.cpp"

"$(INTDIR)\Sched\DynSched.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Sched\$(NULL)" mkdir "$(INTDIR)\Sched\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Sched\DynSched.obj" $(SOURCE)

SOURCE="Sched\Reconfig_Sched_Utils.cpp"

"$(INTDIR)\Sched\Reconfig_Sched_Utils.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Sched\$(NULL)" mkdir "$(INTDIR)\Sched\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Sched\Reconfig_Sched_Utils.obj" $(SOURCE)

SOURCE="Sched\SchedEntry.cpp"

"$(INTDIR)\Sched\SchedEntry.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Sched\$(NULL)" mkdir "$(INTDIR)\Sched\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Sched\SchedEntry.obj" $(SOURCE)

SOURCE="Sched\Strategy_Scheduler.cpp"

"$(INTDIR)\Sched\Strategy_Scheduler.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Sched\$(NULL)" mkdir "$(INTDIR)\Sched\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Sched\Strategy_Scheduler.obj" $(SOURCE)

SOURCE="Sched\Scheduler.cpp"

"$(INTDIR)\Sched\Scheduler.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Sched\$(NULL)" mkdir "$(INTDIR)\Sched\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Sched\Scheduler.obj" $(SOURCE)

SOURCE="Sched\Scheduler_Generic.cpp"

"$(INTDIR)\Sched\Scheduler_Generic.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Sched\$(NULL)" mkdir "$(INTDIR)\Sched\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Sched\Scheduler_Generic.obj" $(SOURCE)

SOURCE="Sched\Config_Scheduler.cpp"

"$(INTDIR)\Sched\Config_Scheduler.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Sched\$(NULL)" mkdir "$(INTDIR)\Sched\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Sched\Config_Scheduler.obj" $(SOURCE)

!IF  "$(CFG)" == "Win64 Debug"
SOURCE="RtecScheduler.idl"

InputPath=RtecScheduler.idl

"RtecSchedulerC.inl" "RtecSchedulerS.inl" "RtecSchedulerC.h" "RtecSchedulerS.h" "RtecSchedulerC.cpp" "RtecSchedulerS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-RtecScheduler_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_RTSched_Export -Wb,export_include=orbsvcs/Sched/sched_export.h "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Release"
SOURCE="RtecScheduler.idl"

InputPath=RtecScheduler.idl

"RtecSchedulerC.inl" "RtecSchedulerS.inl" "RtecSchedulerC.h" "RtecSchedulerS.h" "RtecSchedulerC.cpp" "RtecSchedulerS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-RtecScheduler_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_RTSched_Export -Wb,export_include=orbsvcs/Sched/sched_export.h "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Debug"
SOURCE="RtecScheduler.idl"

InputPath=RtecScheduler.idl

"RtecSchedulerC.inl" "RtecSchedulerS.inl" "RtecSchedulerC.h" "RtecSchedulerS.h" "RtecSchedulerC.cpp" "RtecSchedulerS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-RtecScheduler_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_RTSched_Export -Wb,export_include=orbsvcs/Sched/sched_export.h "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Release"
SOURCE="RtecScheduler.idl"

InputPath=RtecScheduler.idl

"RtecSchedulerC.inl" "RtecSchedulerS.inl" "RtecSchedulerC.h" "RtecSchedulerS.h" "RtecSchedulerC.cpp" "RtecSchedulerS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-RtecScheduler_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_RTSched_Export -Wb,export_include=orbsvcs/Sched/sched_export.h "$(InputPath)"
<<

!ENDIF

SOURCE="RTSched.rc"

"$(INTDIR)\RTSched.res" : $(SOURCE)
	$(RSC) /l 0x409 /fo"$(INTDIR)\RTSched.res" /d NDEBUG /d WIN64 /d _CRT_SECURE_NO_WARNINGS /d _CRT_SECURE_NO_DEPRECATE /d _CRT_NONSTDC_NO_DEPRECATE /i "..\..\.." /i "..\.." /i "..\..\orbsvcs" $(SOURCE)



!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.RTSched.dep")
	@echo Using "Makefile.RTSched.dep"
!ELSE
	@echo Warning: cannot find "Makefile.RTSched.dep"
!ENDIF
!ENDIF

