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
!MESSAGE NMAKE /f "Makefile.CosNotification_MC.mak" CFG="Win64 Debug"
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

GENERATED_DIRTY = "Notify\MonitorControl\NotificationServiceMCC.inl" "Notify\MonitorControl\NotificationServiceMCS.inl" "Notify\MonitorControl\NotificationServiceMCC.h" "Notify\MonitorControl\NotificationServiceMCS.h" "Notify\MonitorControl\NotificationServiceMCC.cpp" "Notify\MonitorControl\NotificationServiceMCS.cpp"

!IF  "$(CFG)" == "Win64 Debug"

OUTDIR=..\..\..\lib
INTDIR=Debug\CosNotification_MC\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_CosNotification_MCd.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_NOTIFY_MC_BUILD_DLL -f "Makefile.CosNotification_MC.dep" "Notify\MonitorControl\NotificationServiceMCC.cpp" "Notify\MonitorControl\NotificationServiceMCS.cpp" "Notify\MonitorControl\MonitorManager.cpp" "Notify\MonitorControl\Timestamp_Monitor.cpp" "Notify\MonitorControl\Control.cpp" "Notify\MonitorControl\Control_Registry.cpp" "Notify\MonitorControl\NotificationServiceMonitor_i.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_MCd.pdb"
	-@del /f/q "..\..\..\lib\TAO_CosNotification_MCd.dll"
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_MCd.lib"
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_MCd.exp"
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_MCd.ilk"
	-@del /f/q "Notify\MonitorControl\NotificationServiceMCC.inl"
	-@del /f/q "Notify\MonitorControl\NotificationServiceMCS.inl"
	-@del /f/q "Notify\MonitorControl\NotificationServiceMCC.h"
	-@del /f/q "Notify\MonitorControl\NotificationServiceMCS.h"
	-@del /f/q "Notify\MonitorControl\NotificationServiceMCC.cpp"
	-@del /f/q "Notify\MonitorControl\NotificationServiceMCS.cpp"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\CosNotification_MC\$(NULL)" mkdir "Debug\CosNotification_MC"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_NOTIFY_MC_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_CosNamingd.lib TAO_PortableServerd.lib ACE_ETCLd.lib TAO_ETCLd.lib ACE_ETCL_Parserd.lib ACE_Monitor_Controld.lib TAO_Monitord.lib TAO_IORTabled.lib pdh.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\..\lib\TAO_CosNotification_MCd.pdb" /machine:IA64 /out:"..\..\..\lib\TAO_CosNotification_MCd.dll" /implib:"$(OUTDIR)\TAO_CosNotification_MCd.lib"
LINK32_OBJS= \
	"$(INTDIR)\Notify\MonitorControl\NotificationServiceMCC.obj" \
	"$(INTDIR)\Notify\MonitorControl\NotificationServiceMCS.obj" \
	"$(INTDIR)\Notify\MonitorControl\MonitorManager.obj" \
	"$(INTDIR)\Notify\MonitorControl\Timestamp_Monitor.obj" \
	"$(INTDIR)\Notify\MonitorControl\Control.obj" \
	"$(INTDIR)\Notify\MonitorControl\Control_Registry.obj" \
	"$(INTDIR)\Notify\MonitorControl\NotificationServiceMonitor_i.obj"

"..\..\..\lib\TAO_CosNotification_MCd.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_CosNotification_MCd.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_CosNotification_MCd.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\CosNotification_MC\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_CosNotification_MC.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_NOTIFY_MC_BUILD_DLL -f "Makefile.CosNotification_MC.dep" "Notify\MonitorControl\NotificationServiceMCC.cpp" "Notify\MonitorControl\NotificationServiceMCS.cpp" "Notify\MonitorControl\MonitorManager.cpp" "Notify\MonitorControl\Timestamp_Monitor.cpp" "Notify\MonitorControl\Control.cpp" "Notify\MonitorControl\Control_Registry.cpp" "Notify\MonitorControl\NotificationServiceMonitor_i.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\TAO_CosNotification_MC.dll"
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_MC.lib"
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_MC.exp"
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_MC.ilk"
	-@del /f/q "Notify\MonitorControl\NotificationServiceMCC.inl"
	-@del /f/q "Notify\MonitorControl\NotificationServiceMCS.inl"
	-@del /f/q "Notify\MonitorControl\NotificationServiceMCC.h"
	-@del /f/q "Notify\MonitorControl\NotificationServiceMCS.h"
	-@del /f/q "Notify\MonitorControl\NotificationServiceMCC.cpp"
	-@del /f/q "Notify\MonitorControl\NotificationServiceMCS.cpp"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\CosNotification_MC\$(NULL)" mkdir "Release\CosNotification_MC"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_NOTIFY_MC_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_CosNaming.lib TAO_PortableServer.lib ACE_ETCL.lib TAO_ETCL.lib ACE_ETCL_Parser.lib ACE_Monitor_Control.lib TAO_Monitor.lib TAO_IORTable.lib pdh.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\..\lib\TAO_CosNotification_MC.dll" /implib:"$(OUTDIR)\TAO_CosNotification_MC.lib"
LINK32_OBJS= \
	"$(INTDIR)\Notify\MonitorControl\NotificationServiceMCC.obj" \
	"$(INTDIR)\Notify\MonitorControl\NotificationServiceMCS.obj" \
	"$(INTDIR)\Notify\MonitorControl\MonitorManager.obj" \
	"$(INTDIR)\Notify\MonitorControl\Timestamp_Monitor.obj" \
	"$(INTDIR)\Notify\MonitorControl\Control.obj" \
	"$(INTDIR)\Notify\MonitorControl\Control_Registry.obj" \
	"$(INTDIR)\Notify\MonitorControl\NotificationServiceMonitor_i.obj"

"..\..\..\lib\TAO_CosNotification_MC.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_CosNotification_MC.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_CosNotification_MC.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\CosNotification_MC\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_CosNotification_MCsd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.CosNotification_MC.dep" "Notify\MonitorControl\NotificationServiceMCC.cpp" "Notify\MonitorControl\NotificationServiceMCS.cpp" "Notify\MonitorControl\MonitorManager.cpp" "Notify\MonitorControl\Timestamp_Monitor.cpp" "Notify\MonitorControl\Control.cpp" "Notify\MonitorControl\Control_Registry.cpp" "Notify\MonitorControl\NotificationServiceMonitor_i.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_MCsd.lib"
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_MCsd.exp"
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_MCsd.ilk"
	-@del /f/q "..\..\..\lib\TAO_CosNotification_MCsd.pdb"
	-@del /f/q "Notify\MonitorControl\NotificationServiceMCC.inl"
	-@del /f/q "Notify\MonitorControl\NotificationServiceMCS.inl"
	-@del /f/q "Notify\MonitorControl\NotificationServiceMCC.h"
	-@del /f/q "Notify\MonitorControl\NotificationServiceMCS.h"
	-@del /f/q "Notify\MonitorControl\NotificationServiceMCC.cpp"
	-@del /f/q "Notify\MonitorControl\NotificationServiceMCS.cpp"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\CosNotification_MC\$(NULL)" mkdir "Static_Debug\CosNotification_MC"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\TAO_CosNotification_MCsd.pdb" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_CosNotification_MCsd.lib"
LINK32_OBJS= \
	"$(INTDIR)\Notify\MonitorControl\NotificationServiceMCC.obj" \
	"$(INTDIR)\Notify\MonitorControl\NotificationServiceMCS.obj" \
	"$(INTDIR)\Notify\MonitorControl\MonitorManager.obj" \
	"$(INTDIR)\Notify\MonitorControl\Timestamp_Monitor.obj" \
	"$(INTDIR)\Notify\MonitorControl\Control.obj" \
	"$(INTDIR)\Notify\MonitorControl\Control_Registry.obj" \
	"$(INTDIR)\Notify\MonitorControl\NotificationServiceMonitor_i.obj"

"$(OUTDIR)\TAO_CosNotification_MCsd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_CosNotification_MCsd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_CosNotification_MCsd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\CosNotification_MC\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_CosNotification_MCs.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.CosNotification_MC.dep" "Notify\MonitorControl\NotificationServiceMCC.cpp" "Notify\MonitorControl\NotificationServiceMCS.cpp" "Notify\MonitorControl\MonitorManager.cpp" "Notify\MonitorControl\Timestamp_Monitor.cpp" "Notify\MonitorControl\Control.cpp" "Notify\MonitorControl\Control_Registry.cpp" "Notify\MonitorControl\NotificationServiceMonitor_i.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_MCs.lib"
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_MCs.exp"
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_MCs.ilk"
	-@del /f/q "Notify\MonitorControl\NotificationServiceMCC.inl"
	-@del /f/q "Notify\MonitorControl\NotificationServiceMCS.inl"
	-@del /f/q "Notify\MonitorControl\NotificationServiceMCC.h"
	-@del /f/q "Notify\MonitorControl\NotificationServiceMCS.h"
	-@del /f/q "Notify\MonitorControl\NotificationServiceMCC.cpp"
	-@del /f/q "Notify\MonitorControl\NotificationServiceMCS.cpp"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\CosNotification_MC\$(NULL)" mkdir "Static_Release\CosNotification_MC"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_CosNotification_MCs.lib"
LINK32_OBJS= \
	"$(INTDIR)\Notify\MonitorControl\NotificationServiceMCC.obj" \
	"$(INTDIR)\Notify\MonitorControl\NotificationServiceMCS.obj" \
	"$(INTDIR)\Notify\MonitorControl\MonitorManager.obj" \
	"$(INTDIR)\Notify\MonitorControl\Timestamp_Monitor.obj" \
	"$(INTDIR)\Notify\MonitorControl\Control.obj" \
	"$(INTDIR)\Notify\MonitorControl\Control_Registry.obj" \
	"$(INTDIR)\Notify\MonitorControl\NotificationServiceMonitor_i.obj"

"$(OUTDIR)\TAO_CosNotification_MCs.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_CosNotification_MCs.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_CosNotification_MCs.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.CosNotification_MC.dep")
!INCLUDE "Makefile.CosNotification_MC.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="Notify\MonitorControl\NotificationServiceMCC.cpp"

"$(INTDIR)\Notify\MonitorControl\NotificationServiceMCC.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\MonitorControl\$(NULL)" mkdir "$(INTDIR)\Notify\MonitorControl\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\MonitorControl\NotificationServiceMCC.obj" $(SOURCE)

SOURCE="Notify\MonitorControl\NotificationServiceMCS.cpp"

"$(INTDIR)\Notify\MonitorControl\NotificationServiceMCS.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\MonitorControl\$(NULL)" mkdir "$(INTDIR)\Notify\MonitorControl\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\MonitorControl\NotificationServiceMCS.obj" $(SOURCE)

SOURCE="Notify\MonitorControl\MonitorManager.cpp"

"$(INTDIR)\Notify\MonitorControl\MonitorManager.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\MonitorControl\$(NULL)" mkdir "$(INTDIR)\Notify\MonitorControl\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\MonitorControl\MonitorManager.obj" $(SOURCE)

SOURCE="Notify\MonitorControl\Timestamp_Monitor.cpp"

"$(INTDIR)\Notify\MonitorControl\Timestamp_Monitor.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\MonitorControl\$(NULL)" mkdir "$(INTDIR)\Notify\MonitorControl\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\MonitorControl\Timestamp_Monitor.obj" $(SOURCE)

SOURCE="Notify\MonitorControl\Control.cpp"

"$(INTDIR)\Notify\MonitorControl\Control.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\MonitorControl\$(NULL)" mkdir "$(INTDIR)\Notify\MonitorControl\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\MonitorControl\Control.obj" $(SOURCE)

SOURCE="Notify\MonitorControl\Control_Registry.cpp"

"$(INTDIR)\Notify\MonitorControl\Control_Registry.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\MonitorControl\$(NULL)" mkdir "$(INTDIR)\Notify\MonitorControl\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\MonitorControl\Control_Registry.obj" $(SOURCE)

SOURCE="Notify\MonitorControl\NotificationServiceMonitor_i.cpp"

"$(INTDIR)\Notify\MonitorControl\NotificationServiceMonitor_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\MonitorControl\$(NULL)" mkdir "$(INTDIR)\Notify\MonitorControl\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\MonitorControl\NotificationServiceMonitor_i.obj" $(SOURCE)

!IF  "$(CFG)" == "Win64 Debug"
SOURCE="Notify\MonitorControl\NotificationServiceMC.idl"

InputPath=Notify\MonitorControl\NotificationServiceMC.idl

"Notify\MonitorControl\NotificationServiceMCC.inl" "Notify\MonitorControl\NotificationServiceMCS.inl" "Notify\MonitorControl\NotificationServiceMCC.h" "Notify\MonitorControl\NotificationServiceMCS.h" "Notify\MonitorControl\NotificationServiceMCC.cpp" "Notify\MonitorControl\NotificationServiceMCS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-Notify_MonitorControl_NotificationServiceMC_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
        if not exist Notify\MonitorControl mkdir Notify\MonitorControl
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -I..\../orbsvcs -o Notify/MonitorControl -Wb,export_macro=TAO_Notify_MC_Export -Wb,export_include=orbsvcs/Notify/MonitorControl/notify_mc_export.h "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Release"
SOURCE="Notify\MonitorControl\NotificationServiceMC.idl"

InputPath=Notify\MonitorControl\NotificationServiceMC.idl

"Notify\MonitorControl\NotificationServiceMCC.inl" "Notify\MonitorControl\NotificationServiceMCS.inl" "Notify\MonitorControl\NotificationServiceMCC.h" "Notify\MonitorControl\NotificationServiceMCS.h" "Notify\MonitorControl\NotificationServiceMCC.cpp" "Notify\MonitorControl\NotificationServiceMCS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-Notify_MonitorControl_NotificationServiceMC_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
        if not exist Notify\MonitorControl mkdir Notify\MonitorControl
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -I..\../orbsvcs -o Notify/MonitorControl -Wb,export_macro=TAO_Notify_MC_Export -Wb,export_include=orbsvcs/Notify/MonitorControl/notify_mc_export.h "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Debug"
SOURCE="Notify\MonitorControl\NotificationServiceMC.idl"

InputPath=Notify\MonitorControl\NotificationServiceMC.idl

"Notify\MonitorControl\NotificationServiceMCC.inl" "Notify\MonitorControl\NotificationServiceMCS.inl" "Notify\MonitorControl\NotificationServiceMCC.h" "Notify\MonitorControl\NotificationServiceMCS.h" "Notify\MonitorControl\NotificationServiceMCC.cpp" "Notify\MonitorControl\NotificationServiceMCS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-Notify_MonitorControl_NotificationServiceMC_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
        if not exist Notify\MonitorControl mkdir Notify\MonitorControl
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -I..\../orbsvcs -o Notify/MonitorControl -Wb,export_macro=TAO_Notify_MC_Export -Wb,export_include=orbsvcs/Notify/MonitorControl/notify_mc_export.h "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Release"
SOURCE="Notify\MonitorControl\NotificationServiceMC.idl"

InputPath=Notify\MonitorControl\NotificationServiceMC.idl

"Notify\MonitorControl\NotificationServiceMCC.inl" "Notify\MonitorControl\NotificationServiceMCS.inl" "Notify\MonitorControl\NotificationServiceMCC.h" "Notify\MonitorControl\NotificationServiceMCS.h" "Notify\MonitorControl\NotificationServiceMCC.cpp" "Notify\MonitorControl\NotificationServiceMCS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-Notify_MonitorControl_NotificationServiceMC_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
        if not exist Notify\MonitorControl mkdir Notify\MonitorControl
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -I..\../orbsvcs -o Notify/MonitorControl -Wb,export_macro=TAO_Notify_MC_Export -Wb,export_include=orbsvcs/Notify/MonitorControl/notify_mc_export.h "$(InputPath)"
<<

!ENDIF


!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.CosNotification_MC.dep")
	@echo Using "Makefile.CosNotification_MC.dep"
!ELSE
	@echo Warning: cannot find "Makefile.CosNotification_MC.dep"
!ENDIF
!ENDIF

