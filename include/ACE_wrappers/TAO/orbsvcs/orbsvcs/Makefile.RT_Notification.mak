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
!MESSAGE NMAKE /f "Makefile.RT_Notification.mak" CFG="Win64 Debug"
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
INTDIR=Debug\RT_Notification\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_RT_Notificationd.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -DTAO_RT_NOTIFY_BUILD_DLL -f "Makefile.RT_Notification.dep" "Notify\RT_Builder.cpp" "Notify\RT_Factory.cpp" "Notify\RT_Notify_Service.cpp" "Notify\RT_POA_Helper.cpp" "Notify\RT_Properties.cpp" "Notify\Structured\RT_StructuredProxyPushSupplier.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_RT_Notificationd.pdb"
	-@del /f/q "..\..\..\lib\TAO_RT_Notificationd.dll"
	-@del /f/q "$(OUTDIR)\TAO_RT_Notificationd.lib"
	-@del /f/q "$(OUTDIR)\TAO_RT_Notificationd.exp"
	-@del /f/q "$(OUTDIR)\TAO_RT_Notificationd.ilk"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\RT_Notification\$(NULL)" mkdir "Debug\RT_Notification"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D TAO_RT_NOTIFY_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_CodecFactoryd.lib TAO_PId.lib TAO_RTCORBAd.lib TAO_PortableServerd.lib TAO_Svc_Utilsd.lib TAO_CosEventd.lib TAO_CosNotificationd.lib TAO_CosEvent_Skeld.lib TAO_CosNotification_Skeld.lib ACE_ETCLd.lib TAO_ETCLd.lib ACE_ETCL_Parserd.lib TAO_Valuetyped.lib TAO_DynamicAnyd.lib TAO_Messagingd.lib TAO_CosNotification_Servd.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\..\lib\TAO_RT_Notificationd.pdb" /machine:IA64 /out:"..\..\..\lib\TAO_RT_Notificationd.dll" /implib:"$(OUTDIR)\TAO_RT_Notificationd.lib"
LINK32_OBJS= \
	"$(INTDIR)\RT_Notification.res" \
	"$(INTDIR)\Notify\RT_Builder.obj" \
	"$(INTDIR)\Notify\RT_Factory.obj" \
	"$(INTDIR)\Notify\RT_Notify_Service.obj" \
	"$(INTDIR)\Notify\RT_POA_Helper.obj" \
	"$(INTDIR)\Notify\RT_Properties.obj" \
	"$(INTDIR)\Notify\Structured\RT_StructuredProxyPushSupplier.obj"

"..\..\..\lib\TAO_RT_Notificationd.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_RT_Notificationd.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_RT_Notificationd.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\RT_Notification\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_RT_Notification.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -DTAO_RT_NOTIFY_BUILD_DLL -f "Makefile.RT_Notification.dep" "Notify\RT_Builder.cpp" "Notify\RT_Factory.cpp" "Notify\RT_Notify_Service.cpp" "Notify\RT_POA_Helper.cpp" "Notify\RT_Properties.cpp" "Notify\Structured\RT_StructuredProxyPushSupplier.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\TAO_RT_Notification.dll"
	-@del /f/q "$(OUTDIR)\TAO_RT_Notification.lib"
	-@del /f/q "$(OUTDIR)\TAO_RT_Notification.exp"
	-@del /f/q "$(OUTDIR)\TAO_RT_Notification.ilk"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\RT_Notification\$(NULL)" mkdir "Release\RT_Notification"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D TAO_RT_NOTIFY_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_CodecFactory.lib TAO_PI.lib TAO_RTCORBA.lib TAO_PortableServer.lib TAO_Svc_Utils.lib TAO_CosEvent.lib TAO_CosNotification.lib TAO_CosEvent_Skel.lib TAO_CosNotification_Skel.lib ACE_ETCL.lib TAO_ETCL.lib ACE_ETCL_Parser.lib TAO_Valuetype.lib TAO_DynamicAny.lib TAO_Messaging.lib TAO_CosNotification_Serv.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\..\lib\TAO_RT_Notification.dll" /implib:"$(OUTDIR)\TAO_RT_Notification.lib"
LINK32_OBJS= \
	"$(INTDIR)\RT_Notification.res" \
	"$(INTDIR)\Notify\RT_Builder.obj" \
	"$(INTDIR)\Notify\RT_Factory.obj" \
	"$(INTDIR)\Notify\RT_Notify_Service.obj" \
	"$(INTDIR)\Notify\RT_POA_Helper.obj" \
	"$(INTDIR)\Notify\RT_Properties.obj" \
	"$(INTDIR)\Notify\Structured\RT_StructuredProxyPushSupplier.obj"

"..\..\..\lib\TAO_RT_Notification.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_RT_Notification.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_RT_Notification.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\RT_Notification\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_RT_Notificationsd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.RT_Notification.dep" "Notify\RT_Builder.cpp" "Notify\RT_Factory.cpp" "Notify\RT_Notify_Service.cpp" "Notify\RT_POA_Helper.cpp" "Notify\RT_Properties.cpp" "Notify\Structured\RT_StructuredProxyPushSupplier.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_RT_Notificationsd.lib"
	-@del /f/q "$(OUTDIR)\TAO_RT_Notificationsd.exp"
	-@del /f/q "$(OUTDIR)\TAO_RT_Notificationsd.ilk"
	-@del /f/q "..\..\..\lib\TAO_RT_Notificationsd.pdb"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\RT_Notification\$(NULL)" mkdir "Static_Debug\RT_Notification"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\TAO_RT_Notificationsd.pdb" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_RT_Notificationsd.lib"
LINK32_OBJS= \
	"$(INTDIR)\Notify\RT_Builder.obj" \
	"$(INTDIR)\Notify\RT_Factory.obj" \
	"$(INTDIR)\Notify\RT_Notify_Service.obj" \
	"$(INTDIR)\Notify\RT_POA_Helper.obj" \
	"$(INTDIR)\Notify\RT_Properties.obj" \
	"$(INTDIR)\Notify\Structured\RT_StructuredProxyPushSupplier.obj"

"$(OUTDIR)\TAO_RT_Notificationsd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_RT_Notificationsd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_RT_Notificationsd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\RT_Notification\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_RT_Notifications.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.RT_Notification.dep" "Notify\RT_Builder.cpp" "Notify\RT_Factory.cpp" "Notify\RT_Notify_Service.cpp" "Notify\RT_POA_Helper.cpp" "Notify\RT_Properties.cpp" "Notify\Structured\RT_StructuredProxyPushSupplier.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_RT_Notifications.lib"
	-@del /f/q "$(OUTDIR)\TAO_RT_Notifications.exp"
	-@del /f/q "$(OUTDIR)\TAO_RT_Notifications.ilk"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\RT_Notification\$(NULL)" mkdir "Static_Release\RT_Notification"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_RT_Notifications.lib"
LINK32_OBJS= \
	"$(INTDIR)\Notify\RT_Builder.obj" \
	"$(INTDIR)\Notify\RT_Factory.obj" \
	"$(INTDIR)\Notify\RT_Notify_Service.obj" \
	"$(INTDIR)\Notify\RT_POA_Helper.obj" \
	"$(INTDIR)\Notify\RT_Properties.obj" \
	"$(INTDIR)\Notify\Structured\RT_StructuredProxyPushSupplier.obj"

"$(OUTDIR)\TAO_RT_Notifications.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_RT_Notifications.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_RT_Notifications.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.RT_Notification.dep")
!INCLUDE "Makefile.RT_Notification.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="Notify\RT_Builder.cpp"

"$(INTDIR)\Notify\RT_Builder.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\RT_Builder.obj" $(SOURCE)

SOURCE="Notify\RT_Factory.cpp"

"$(INTDIR)\Notify\RT_Factory.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\RT_Factory.obj" $(SOURCE)

SOURCE="Notify\RT_Notify_Service.cpp"

"$(INTDIR)\Notify\RT_Notify_Service.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\RT_Notify_Service.obj" $(SOURCE)

SOURCE="Notify\RT_POA_Helper.cpp"

"$(INTDIR)\Notify\RT_POA_Helper.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\RT_POA_Helper.obj" $(SOURCE)

SOURCE="Notify\RT_Properties.cpp"

"$(INTDIR)\Notify\RT_Properties.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\$(NULL)" mkdir "$(INTDIR)\Notify\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\RT_Properties.obj" $(SOURCE)

SOURCE="Notify\Structured\RT_StructuredProxyPushSupplier.cpp"

"$(INTDIR)\Notify\Structured\RT_StructuredProxyPushSupplier.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Notify\Structured\$(NULL)" mkdir "$(INTDIR)\Notify\Structured\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Notify\Structured\RT_StructuredProxyPushSupplier.obj" $(SOURCE)

!IF  "$(CFG)" == "Win64 Debug"
!ELSEIF  "$(CFG)" == "Win64 Release"
!ELSEIF  "$(CFG)" == "Win64 Static Debug"
!ELSEIF  "$(CFG)" == "Win64 Static Release"
!ENDIF

SOURCE="RT_Notification.rc"

"$(INTDIR)\RT_Notification.res" : $(SOURCE)
	$(RSC) /l 0x409 /fo"$(INTDIR)\RT_Notification.res" /d NDEBUG /d WIN64 /d _CRT_SECURE_NO_WARNINGS /d _CRT_SECURE_NO_DEPRECATE /d _CRT_NONSTDC_NO_DEPRECATE /d TAO_HAS_TYPED_EVENT_CHANNEL /i "..\..\.." /i "..\.." /i "..\..\orbsvcs" $(SOURCE)



!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.RT_Notification.dep")
	@echo Using "Makefile.RT_Notification.dep"
!ELSE
	@echo Warning: cannot find "Makefile.RT_Notification.dep"
!ENDIF
!ENDIF

