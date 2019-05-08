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
!MESSAGE NMAKE /f "Makefile.CosNotification_MC_Ext.mak" CFG="Win64 Debug"
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

GENERATED_DIRTY = "Notify\MonitorControlExt\NotifyMonitoringExtC.inl" "Notify\MonitorControlExt\NotifyMonitoringExtS.inl" "Notify\MonitorControlExt\NotifyMonitoringExtC.h" "Notify\MonitorControlExt\NotifyMonitoringExtS.h" "Notify\MonitorControlExt\NotifyMonitoringExtC.cpp" "Notify\MonitorControlExt\NotifyMonitoringExtS.cpp"

!IF  "$(CFG)" == "Win64 Debug"

OUTDIR=..\..\..\lib
INTDIR=Debug\CosNotification_MC_Ext\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_CosNotification_MC_Extd.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -DTAO_NOTIFY_MC_EXT_BUILD_DLL -f "Makefile.CosNotification_MC_Ext.dep" "Notify\MonitorControlExt\NotifyMonitoringExtC.cpp" "Notify\MonitorControlExt\NotifyMonitoringExtS.cpp" "Notify\MonitorControlExt\MonitorEventChannelFactory.cpp" "Notify\MonitorControlExt\MonitorConsumerAdmin.cpp" "Notify\MonitorControlExt\MC_Default_Factory.cpp" "Notify\MonitorControlExt\MC_Notify_Service.cpp" "Notify\MonitorControlExt\MonitorSupplierAdmin.cpp" "Notify\MonitorControlExt\MonitorEventChannel.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_MC_Extd.pdb"
	-@del /f/q "..\..\..\lib\TAO_CosNotification_MC_Extd.dll"
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_MC_Extd.lib"
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_MC_Extd.exp"
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_MC_Extd.ilk"
	-@del /f/q "Notify\MonitorControlExt\NotifyMonitoringExtC.inl"
	-@del /f/q "Notify\MonitorControlExt\NotifyMonitoringExtS.inl"
	-@del /f/q "Notify\MonitorControlExt\NotifyMonitoringExtC.h"
	-@del /f/q "Notify\MonitorControlExt\NotifyMonitoringExtS.h"
	-@del /f/q "Notify\MonitorControlExt\NotifyMonitoringExtC.cpp"
	-@del /f/q "Notify\MonitorControlExt\NotifyMonitoringExtS.cpp"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\CosNotification_MC_Ext\$(NULL)" mkdir "Debug\CosNotification_MC_Ext"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D TAO_NOTIFY_MC_EXT_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_PortableServerd.lib TAO_Svc_Utilsd.lib TAO_CosEventd.lib TAO_CosNotificationd.lib TAO_CosEvent_Skeld.lib TAO_CosNotification_Skeld.lib ACE_ETCLd.lib TAO_ETCLd.lib ACE_ETCL_Parserd.lib TAO_Valuetyped.lib TAO_DynamicAnyd.lib TAO_CodecFactoryd.lib TAO_PId.lib TAO_Messagingd.lib TAO_CosNotification_Servd.lib TAO_IORTabled.lib TAO_CosNamingd.lib ACE_Monitor_Controld.lib TAO_Monitord.lib TAO_CosNotification_MCd.lib pdh.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\..\lib\TAO_CosNotification_MC_Extd.pdb" /machine:IA64 /out:"..\..\..\lib\TAO_CosNotification_MC_Extd.dll" /implib:"$(OUTDIR)\TAO_CosNotification_MC_Extd.lib"
LINK32_OBJS= \
	"$(INTDIR)\Notify\MonitorControlExt\NotifyMonitoringExtC.obj" \
	"$(INTDIR)\Notify\MonitorControlExt\NotifyMonitoringExtS.obj" \
	"$(INTDIR)\Notify\MonitorControlExt\MonitorEventChannelFactory.obj" \
	"$(INTDIR)\Notify\MonitorControlExt\MonitorConsumerAdmin.obj" \
	"$(INTDIR)\Notify\MonitorControlExt\MC_Default_Factory.obj" \
	"$(INTDIR)\Notify\MonitorControlExt\MC_Notify_Service.obj" \
	"$(INTDIR)\Notify\MonitorControlExt\MonitorSupplierAdmin.obj" \
	"$(INTDIR)\Notify\MonitorControlExt\MonitorEventChannel.obj"

"..\..\..\lib\TAO_CosNotification_MC_Extd.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_CosNotification_MC_Extd.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_CosNotification_MC_Extd.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\CosNotification_MC_Ext\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_CosNotification_MC_Ext.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -DTAO_NOTIFY_MC_EXT_BUILD_DLL -f "Makefile.CosNotification_MC_Ext.dep" "Notify\MonitorControlExt\NotifyMonitoringExtC.cpp" "Notify\MonitorControlExt\NotifyMonitoringExtS.cpp" "Notify\MonitorControlExt\MonitorEventChannelFactory.cpp" "Notify\MonitorControlExt\MonitorConsumerAdmin.cpp" "Notify\MonitorControlExt\MC_Default_Factory.cpp" "Notify\MonitorControlExt\MC_Notify_Service.cpp" "Notify\MonitorControlExt\MonitorSupplierAdmin.cpp" "Notify\MonitorControlExt\MonitorEventChannel.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\TAO_CosNotification_MC_Ext.dll"
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_MC_Ext.lib"
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_MC_Ext.exp"
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_MC_Ext.ilk"
	-@del /f/q "Notify\MonitorControlExt\NotifyMonitoringExtC.inl"
	-@del /f/q "Notify\MonitorControlExt\NotifyMonitoringExtS.inl"
	-@del /f/q "Notify\MonitorControlExt\NotifyMonitoringExtC.h"
	-@del /f/q "Notify\MonitorControlExt\NotifyMonitoringExtS.h"
	-@del /f/q "Notify\MonitorControlExt\NotifyMonitoringExtC.cpp"
	-@del /f/q "Notify\MonitorControlExt\NotifyMonitoringExtS.cpp"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\CosNotification_MC_Ext\$(NULL)" mkdir "Release\CosNotification_MC_Ext"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D TAO_NOTIFY_MC_EXT_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_PortableServer.lib TAO_Svc_Utils.lib TAO_CosEvent.lib TAO_CosNotification.lib TAO_CosEvent_Skel.lib TAO_CosNotification_Skel.lib ACE_ETCL.lib TAO_ETCL.lib ACE_ETCL_Parser.lib TAO_Valuetype.lib TAO_DynamicAny.lib TAO_CodecFactory.lib TAO_PI.lib TAO_Messaging.lib TAO_CosNotification_Serv.lib TAO_IORTable.lib TAO_CosNaming.lib ACE_Monitor_Control.lib TAO_Monitor.lib TAO_CosNotification_MC.lib pdh.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\..\lib\TAO_CosNotification_MC_Ext.dll" /implib:"$(OUTDIR)\TAO_CosNotification_MC_Ext.lib"
LINK32_OBJS= \
	"$(INTDIR)\Notify\MonitorControlExt\NotifyMonitoringExtC.obj" \
	"$(INTDIR)\Notify\MonitorControlExt\NotifyMonitoringExtS.obj" \
	"$(INTDIR)\Notify\MonitorControlExt\MonitorEventChannelFactory.obj" \
	"$(INTDIR)\Notify\MonitorControlExt\MonitorConsumerAdmin.obj" \
	"$(INTDIR)\Notify\MonitorControlExt\MC_Default_Factory.obj" \
	"$(INTDIR)\Notify\MonitorControlExt\MC_Notify_Service.obj" \
	"$(INTDIR)\Notify\MonitorControlExt\MonitorSupplierAdmin.obj" \
	"$(INTDIR)\Notify\MonitorControlExt\MonitorEventChannel.obj"

"..\..\..\lib\TAO_CosNotification_MC_Ext.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_CosNotification_MC_Ext.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_CosNotification_MC_Ext.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\CosNotification_MC_Ext\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_CosNotification_MC_Extsd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.CosNotification_MC_Ext.dep" "Notify\MonitorControlExt\NotifyMonitoringExtC.cpp" "Notify\MonitorControlExt\NotifyMonitoringExtS.cpp" "Notify\MonitorControlExt\MonitorEventChannelFactory.cpp" "Notify\MonitorControlExt\MonitorConsumerAdmin.cpp" "Notify\MonitorControlExt\MC_Default_Factory.cpp" "Notify\MonitorControlExt\MC_Notify_Service.cpp" "Notify\MonitorControlExt\MonitorSupplierAdmin.cpp" "Notify\MonitorControlExt\MonitorEventChannel.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_MC_Extsd.lib"
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_MC_Extsd.exp"
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_MC_Extsd.ilk"
	-@del /f/q "..\..\..\lib\TAO_CosNotification_MC_Extsd.pdb"
	-@del /f/q "Notify\MonitorControlExt\NotifyMonitoringExtC.inl"
	-@del /f/q "Notify\MonitorControlExt\NotifyMonitoringExtS.inl"
	-@del /f/q "Notify\MonitorControlExt\NotifyMonitoringExtC.h"
	-@del /f/q "Notify\MonitorControlExt\NotifyMonitoringExtS.h"
	-@del /f/q "Notify\MonitorControlExt\NotifyMonitoringExtC.cpp"
	-@del /f/q "Notify\MonitorControlExt\NotifyMonitoringExtS.cpp"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\CosNotification_MC_Ext\$(NULL)" mkdir "Static_Debug\CosNotification_MC_Ext"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\TAO_CosNotification_MC_Extsd.pdb" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_CosNotification_MC_Extsd.lib"
LINK32_OBJS= \
	"$(INTDIR)\Notify\MonitorControlExt\NotifyMonitoringExtC.obj" \
	"$(INTDIR)\Notify\MonitorControlExt\NotifyMonitoringExtS.obj" \
	"$(INTDIR)\Notify\MonitorControlExt\MonitorEventChannelFactory.obj" \
	"$(INTDIR)\Notify\MonitorControlExt\MonitorConsumerAdmin.obj" \
	"$(INTDIR)\Notify\MonitorControlExt\MC_Default_Factory.obj" \
	"$(INTDIR)\Notify\MonitorControlExt\MC_Notify_Service.obj" \
	"$(INTDIR)\Notify\MonitorControlExt\MonitorSupplierAdmin.obj" \
	"$(INTDIR)\Notify\MonitorControlExt\MonitorEventChannel.obj"

"$(OUTDIR)\TAO_CosNotification_MC_Extsd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_CosNotification_MC_Extsd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_CosNotification_MC_Extsd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\CosNotification_MC_Ext\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_CosNotification_MC_Exts.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.CosNotification_MC_Ext.dep" "Notify\MonitorControlExt\NotifyMonitoringExtC.cpp" "Notify\MonitorControlExt\NotifyMonitoringExtS.cpp" "Notify\MonitorControlExt\MonitorEventChannelFactory.cpp" "Notify\MonitorControlExt\MonitorConsumerAdmin.cpp" "Notify\MonitorControlExt\MC_Default_Factory.cpp" "Notify\MonitorControlExt\MC_Notify_Service.cpp" "Notify\MonitorControlExt\MonitorSupplierAdmin.cpp" "Notify\MonitorControlExt\MonitorEventChannel.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_MC_Exts.lib"
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_MC_Exts.exp"
	-@del /f/q "$(OUTDIR)\TAO_CosNotification_MC_Exts.ilk"
	-@del /f/q "Notify\MonitorControlExt\NotifyMonitoringExtC.inl"
	-@del /f/q "Notify\MonitorControlExt\NotifyMonitoringExtS.inl"
	-@del /f/q "Notify\MonitorControlExt\NotifyMonitoringExtC.h"
	-@del /f/q "Notify\MonitorControlExt\NotifyMonitoringExtS.h"
	-@del /f/q "Notify\MonitorControlExt\NotifyMonitoringExtC.cpp"
	-@del /f/q "Notify\MonitorControlExt\NotifyMonitoringExtS.cpp"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\CosNotification_MC_Ext\$(NULL)" mkdir "Static_Release\CosNotification_MC_Ext"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_CosNotification_MC_Exts.lib"
LINK32_OBJS= \
	"$(INTDIR)\Notify\MonitorControlExt\NotifyMonitoringExtC.obj" \
	"$(INTDIR)\Notify\MonitorControlExt\NotifyMonitoringExtS.obj" \
	"$(INTDIR)\Notify\MonitorControlExt\MonitorEventChannelFactory.obj" \
	"$(INTDIR)\Notify\MonitorControlExt\MonitorConsumerAdmin.obj" \
	"$(INTDIR)\Notify\MonitorControlExt\MC_Default_Factory.obj" \
	"$(INTDIR)\Notify\MonitorControlExt\MC_Notify_Service.obj" \
	"$(INTDIR)\Notify\MonitorControlExt\MonitorSupplierAdmin.obj" \
	"$(INTDIR)\Notify\MonitorControlExt\MonitorEventChannel.obj"

"$(OUTDIR)\TAO_CosNotification_MC_Exts.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_CosNotification_MC_Exts.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_CosNotification_MC_Exts.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.CosNotification_MC_Ext.dep")
!INCLUDE "Makefile.CosNotification_MC_Ext.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="Notify\MonitorControlExt\NotifyMonitoringExtC.cpp"

"$(INTDIR)\Notify\MonitorControlExt\NotifyMonitoringExtC.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\MonitorControlExt\$(NULL)" mkdir "$(INTDIR)\Notify\MonitorControlExt\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\MonitorControlExt\NotifyMonitoringExtC.obj" $(SOURCE)

SOURCE="Notify\MonitorControlExt\NotifyMonitoringExtS.cpp"

"$(INTDIR)\Notify\MonitorControlExt\NotifyMonitoringExtS.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\MonitorControlExt\$(NULL)" mkdir "$(INTDIR)\Notify\MonitorControlExt\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\MonitorControlExt\NotifyMonitoringExtS.obj" $(SOURCE)

SOURCE="Notify\MonitorControlExt\MonitorEventChannelFactory.cpp"

"$(INTDIR)\Notify\MonitorControlExt\MonitorEventChannelFactory.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\MonitorControlExt\$(NULL)" mkdir "$(INTDIR)\Notify\MonitorControlExt\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\MonitorControlExt\MonitorEventChannelFactory.obj" $(SOURCE)

SOURCE="Notify\MonitorControlExt\MonitorConsumerAdmin.cpp"

"$(INTDIR)\Notify\MonitorControlExt\MonitorConsumerAdmin.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\MonitorControlExt\$(NULL)" mkdir "$(INTDIR)\Notify\MonitorControlExt\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\MonitorControlExt\MonitorConsumerAdmin.obj" $(SOURCE)

SOURCE="Notify\MonitorControlExt\MC_Default_Factory.cpp"

"$(INTDIR)\Notify\MonitorControlExt\MC_Default_Factory.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\MonitorControlExt\$(NULL)" mkdir "$(INTDIR)\Notify\MonitorControlExt\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\MonitorControlExt\MC_Default_Factory.obj" $(SOURCE)

SOURCE="Notify\MonitorControlExt\MC_Notify_Service.cpp"

"$(INTDIR)\Notify\MonitorControlExt\MC_Notify_Service.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\MonitorControlExt\$(NULL)" mkdir "$(INTDIR)\Notify\MonitorControlExt\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\MonitorControlExt\MC_Notify_Service.obj" $(SOURCE)

SOURCE="Notify\MonitorControlExt\MonitorSupplierAdmin.cpp"

"$(INTDIR)\Notify\MonitorControlExt\MonitorSupplierAdmin.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\MonitorControlExt\$(NULL)" mkdir "$(INTDIR)\Notify\MonitorControlExt\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\MonitorControlExt\MonitorSupplierAdmin.obj" $(SOURCE)

SOURCE="Notify\MonitorControlExt\MonitorEventChannel.cpp"

"$(INTDIR)\Notify\MonitorControlExt\MonitorEventChannel.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\MonitorControlExt\$(NULL)" mkdir "$(INTDIR)\Notify\MonitorControlExt\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\MonitorControlExt\MonitorEventChannel.obj" $(SOURCE)

!IF  "$(CFG)" == "Win64 Debug"
SOURCE="Notify\MonitorControlExt\NotifyMonitoringExt.idl"

InputPath=Notify\MonitorControlExt\NotifyMonitoringExt.idl

"Notify\MonitorControlExt\NotifyMonitoringExtC.inl" "Notify\MonitorControlExt\NotifyMonitoringExtS.inl" "Notify\MonitorControlExt\NotifyMonitoringExtC.h" "Notify\MonitorControlExt\NotifyMonitoringExtS.h" "Notify\MonitorControlExt\NotifyMonitoringExtC.cpp" "Notify\MonitorControlExt\NotifyMonitoringExtS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-Notify_MonitorControlExt_NotifyMonitoringExt_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
        if not exist Notify\MonitorControlExt mkdir Notify\MonitorControlExt
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -o Notify/MonitorControlExt -Wb,export_macro=TAO_Notify_MC_Ext_Export -Wb,export_include=orbsvcs/Notify/MonitorControlExt/notify_mc_ext_export.h "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Release"
SOURCE="Notify\MonitorControlExt\NotifyMonitoringExt.idl"

InputPath=Notify\MonitorControlExt\NotifyMonitoringExt.idl

"Notify\MonitorControlExt\NotifyMonitoringExtC.inl" "Notify\MonitorControlExt\NotifyMonitoringExtS.inl" "Notify\MonitorControlExt\NotifyMonitoringExtC.h" "Notify\MonitorControlExt\NotifyMonitoringExtS.h" "Notify\MonitorControlExt\NotifyMonitoringExtC.cpp" "Notify\MonitorControlExt\NotifyMonitoringExtS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-Notify_MonitorControlExt_NotifyMonitoringExt_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
        if not exist Notify\MonitorControlExt mkdir Notify\MonitorControlExt
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -o Notify/MonitorControlExt -Wb,export_macro=TAO_Notify_MC_Ext_Export -Wb,export_include=orbsvcs/Notify/MonitorControlExt/notify_mc_ext_export.h "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Debug"
SOURCE="Notify\MonitorControlExt\NotifyMonitoringExt.idl"

InputPath=Notify\MonitorControlExt\NotifyMonitoringExt.idl

"Notify\MonitorControlExt\NotifyMonitoringExtC.inl" "Notify\MonitorControlExt\NotifyMonitoringExtS.inl" "Notify\MonitorControlExt\NotifyMonitoringExtC.h" "Notify\MonitorControlExt\NotifyMonitoringExtS.h" "Notify\MonitorControlExt\NotifyMonitoringExtC.cpp" "Notify\MonitorControlExt\NotifyMonitoringExtS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-Notify_MonitorControlExt_NotifyMonitoringExt_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
        if not exist Notify\MonitorControlExt mkdir Notify\MonitorControlExt
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -o Notify/MonitorControlExt -Wb,export_macro=TAO_Notify_MC_Ext_Export -Wb,export_include=orbsvcs/Notify/MonitorControlExt/notify_mc_ext_export.h "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Release"
SOURCE="Notify\MonitorControlExt\NotifyMonitoringExt.idl"

InputPath=Notify\MonitorControlExt\NotifyMonitoringExt.idl

"Notify\MonitorControlExt\NotifyMonitoringExtC.inl" "Notify\MonitorControlExt\NotifyMonitoringExtS.inl" "Notify\MonitorControlExt\NotifyMonitoringExtC.h" "Notify\MonitorControlExt\NotifyMonitoringExtS.h" "Notify\MonitorControlExt\NotifyMonitoringExtC.cpp" "Notify\MonitorControlExt\NotifyMonitoringExtS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-Notify_MonitorControlExt_NotifyMonitoringExt_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
        if not exist Notify\MonitorControlExt mkdir Notify\MonitorControlExt
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -o Notify/MonitorControlExt -Wb,export_macro=TAO_Notify_MC_Ext_Export -Wb,export_include=orbsvcs/Notify/MonitorControlExt/notify_mc_ext_export.h "$(InputPath)"
<<

!ENDIF


!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.CosNotification_MC_Ext.dep")
	@echo Using "Makefile.CosNotification_MC_Ext.dep"
!ELSE
	@echo Warning: cannot find "Makefile.CosNotification_MC_Ext.dep"
!ENDIF
!ENDIF

