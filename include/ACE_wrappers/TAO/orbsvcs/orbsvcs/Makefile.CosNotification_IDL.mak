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
!MESSAGE NMAKE /f "Makefile.CosNotification_IDL.mak" CFG="Win64 Debug"
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

GENERATED_DIRTY = "CosNotificationC.inl" "CosNotificationS.inl" "CosNotificationC.h" "CosNotificationS.h" "CosNotificationC.cpp" "CosNotificationS.cpp" "CosNotifyCommC.inl" "CosNotifyCommS.inl" "CosNotifyCommC.h" "CosNotifyCommS.h" "CosNotifyCommC.cpp" "CosNotifyCommS.cpp" "CosNotifyFilterC.inl" "CosNotifyFilterS.inl" "CosNotifyFilterC.h" "CosNotifyFilterS.h" "CosNotifyFilterC.cpp" "CosNotifyFilterS.cpp" "CosNotifyChannelAdminC.inl" "CosNotifyChannelAdminS.inl" "CosNotifyChannelAdminC.h" "CosNotifyChannelAdminS.h" "CosNotifyChannelAdminC.cpp" "CosNotifyChannelAdminS.cpp" "NotifyExtC.inl" "NotifyExtS.inl" "NotifyExtC.h" "NotifyExtS.h" "NotifyExtC.cpp" "NotifyExtS.cpp" "Event_ForwarderC.inl" "Event_ForwarderS.inl" "Event_ForwarderC.h" "Event_ForwarderS.h" "Event_ForwarderC.cpp" "Event_ForwarderS.cpp"

!IF  "$(CFG)" == "Win64 Debug"

OUTDIR=..\..\..\lib
INTDIR=Debug\CosNotification_IDL\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY)

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	-@rem
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\d.lib"
	-@del /f/q "$(OUTDIR)\d.exp"
	-@del /f/q "$(OUTDIR)\d.ilk"
	-@del /f/q "CosNotificationC.inl"
	-@del /f/q "CosNotificationS.inl"
	-@del /f/q "CosNotificationC.h"
	-@del /f/q "CosNotificationS.h"
	-@del /f/q "CosNotificationC.cpp"
	-@del /f/q "CosNotificationS.cpp"
	-@del /f/q "CosNotifyCommC.inl"
	-@del /f/q "CosNotifyCommS.inl"
	-@del /f/q "CosNotifyCommC.h"
	-@del /f/q "CosNotifyCommS.h"
	-@del /f/q "CosNotifyCommC.cpp"
	-@del /f/q "CosNotifyCommS.cpp"
	-@del /f/q "CosNotifyFilterC.inl"
	-@del /f/q "CosNotifyFilterS.inl"
	-@del /f/q "CosNotifyFilterC.h"
	-@del /f/q "CosNotifyFilterS.h"
	-@del /f/q "CosNotifyFilterC.cpp"
	-@del /f/q "CosNotifyFilterS.cpp"
	-@del /f/q "CosNotifyChannelAdminC.inl"
	-@del /f/q "CosNotifyChannelAdminS.inl"
	-@del /f/q "CosNotifyChannelAdminC.h"
	-@del /f/q "CosNotifyChannelAdminS.h"
	-@del /f/q "CosNotifyChannelAdminC.cpp"
	-@del /f/q "CosNotifyChannelAdminS.cpp"
	-@del /f/q "NotifyExtC.inl"
	-@del /f/q "NotifyExtS.inl"
	-@del /f/q "NotifyExtC.h"
	-@del /f/q "NotifyExtS.h"
	-@del /f/q "NotifyExtC.cpp"
	-@del /f/q "NotifyExtS.cpp"
	-@del /f/q "Event_ForwarderC.inl"
	-@del /f/q "Event_ForwarderS.inl"
	-@del /f/q "Event_ForwarderC.h"
	-@del /f/q "Event_ForwarderS.h"
	-@del /f/q "Event_ForwarderC.cpp"
	-@del /f/q "Event_ForwarderS.cpp"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\CosNotification_IDL\$(NULL)" mkdir "Debug\CosNotification_IDL"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe


!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\CosNotification_IDL\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY)

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	-@rem
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\.lib"
	-@del /f/q "$(OUTDIR)\.exp"
	-@del /f/q "$(OUTDIR)\.ilk"
	-@del /f/q "CosNotificationC.inl"
	-@del /f/q "CosNotificationS.inl"
	-@del /f/q "CosNotificationC.h"
	-@del /f/q "CosNotificationS.h"
	-@del /f/q "CosNotificationC.cpp"
	-@del /f/q "CosNotificationS.cpp"
	-@del /f/q "CosNotifyCommC.inl"
	-@del /f/q "CosNotifyCommS.inl"
	-@del /f/q "CosNotifyCommC.h"
	-@del /f/q "CosNotifyCommS.h"
	-@del /f/q "CosNotifyCommC.cpp"
	-@del /f/q "CosNotifyCommS.cpp"
	-@del /f/q "CosNotifyFilterC.inl"
	-@del /f/q "CosNotifyFilterS.inl"
	-@del /f/q "CosNotifyFilterC.h"
	-@del /f/q "CosNotifyFilterS.h"
	-@del /f/q "CosNotifyFilterC.cpp"
	-@del /f/q "CosNotifyFilterS.cpp"
	-@del /f/q "CosNotifyChannelAdminC.inl"
	-@del /f/q "CosNotifyChannelAdminS.inl"
	-@del /f/q "CosNotifyChannelAdminC.h"
	-@del /f/q "CosNotifyChannelAdminS.h"
	-@del /f/q "CosNotifyChannelAdminC.cpp"
	-@del /f/q "CosNotifyChannelAdminS.cpp"
	-@del /f/q "NotifyExtC.inl"
	-@del /f/q "NotifyExtS.inl"
	-@del /f/q "NotifyExtC.h"
	-@del /f/q "NotifyExtS.h"
	-@del /f/q "NotifyExtC.cpp"
	-@del /f/q "NotifyExtS.cpp"
	-@del /f/q "Event_ForwarderC.inl"
	-@del /f/q "Event_ForwarderS.inl"
	-@del /f/q "Event_ForwarderC.h"
	-@del /f/q "Event_ForwarderS.h"
	-@del /f/q "Event_ForwarderC.cpp"
	-@del /f/q "Event_ForwarderS.cpp"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\CosNotification_IDL\$(NULL)" mkdir "Release\CosNotification_IDL"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe


!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\CosNotification_IDL\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY)

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	-@rem
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\sd.pdb"
	-@del /f/q "CosNotificationC.inl"
	-@del /f/q "CosNotificationS.inl"
	-@del /f/q "CosNotificationC.h"
	-@del /f/q "CosNotificationS.h"
	-@del /f/q "CosNotificationC.cpp"
	-@del /f/q "CosNotificationS.cpp"
	-@del /f/q "CosNotifyCommC.inl"
	-@del /f/q "CosNotifyCommS.inl"
	-@del /f/q "CosNotifyCommC.h"
	-@del /f/q "CosNotifyCommS.h"
	-@del /f/q "CosNotifyCommC.cpp"
	-@del /f/q "CosNotifyCommS.cpp"
	-@del /f/q "CosNotifyFilterC.inl"
	-@del /f/q "CosNotifyFilterS.inl"
	-@del /f/q "CosNotifyFilterC.h"
	-@del /f/q "CosNotifyFilterS.h"
	-@del /f/q "CosNotifyFilterC.cpp"
	-@del /f/q "CosNotifyFilterS.cpp"
	-@del /f/q "CosNotifyChannelAdminC.inl"
	-@del /f/q "CosNotifyChannelAdminS.inl"
	-@del /f/q "CosNotifyChannelAdminC.h"
	-@del /f/q "CosNotifyChannelAdminS.h"
	-@del /f/q "CosNotifyChannelAdminC.cpp"
	-@del /f/q "CosNotifyChannelAdminS.cpp"
	-@del /f/q "NotifyExtC.inl"
	-@del /f/q "NotifyExtS.inl"
	-@del /f/q "NotifyExtC.h"
	-@del /f/q "NotifyExtS.h"
	-@del /f/q "NotifyExtC.cpp"
	-@del /f/q "NotifyExtS.cpp"
	-@del /f/q "Event_ForwarderC.inl"
	-@del /f/q "Event_ForwarderS.inl"
	-@del /f/q "Event_ForwarderC.h"
	-@del /f/q "Event_ForwarderS.h"
	-@del /f/q "Event_ForwarderC.cpp"
	-@del /f/q "Event_ForwarderS.cpp"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\CosNotification_IDL\$(NULL)" mkdir "Static_Debug\CosNotification_IDL"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\sd.pdb" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"



!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\CosNotification_IDL\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY)

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	-@rem
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "CosNotificationC.inl"
	-@del /f/q "CosNotificationS.inl"
	-@del /f/q "CosNotificationC.h"
	-@del /f/q "CosNotificationS.h"
	-@del /f/q "CosNotificationC.cpp"
	-@del /f/q "CosNotificationS.cpp"
	-@del /f/q "CosNotifyCommC.inl"
	-@del /f/q "CosNotifyCommS.inl"
	-@del /f/q "CosNotifyCommC.h"
	-@del /f/q "CosNotifyCommS.h"
	-@del /f/q "CosNotifyCommC.cpp"
	-@del /f/q "CosNotifyCommS.cpp"
	-@del /f/q "CosNotifyFilterC.inl"
	-@del /f/q "CosNotifyFilterS.inl"
	-@del /f/q "CosNotifyFilterC.h"
	-@del /f/q "CosNotifyFilterS.h"
	-@del /f/q "CosNotifyFilterC.cpp"
	-@del /f/q "CosNotifyFilterS.cpp"
	-@del /f/q "CosNotifyChannelAdminC.inl"
	-@del /f/q "CosNotifyChannelAdminS.inl"
	-@del /f/q "CosNotifyChannelAdminC.h"
	-@del /f/q "CosNotifyChannelAdminS.h"
	-@del /f/q "CosNotifyChannelAdminC.cpp"
	-@del /f/q "CosNotifyChannelAdminS.cpp"
	-@del /f/q "NotifyExtC.inl"
	-@del /f/q "NotifyExtS.inl"
	-@del /f/q "NotifyExtC.h"
	-@del /f/q "NotifyExtS.h"
	-@del /f/q "NotifyExtC.cpp"
	-@del /f/q "NotifyExtS.cpp"
	-@del /f/q "Event_ForwarderC.inl"
	-@del /f/q "Event_ForwarderS.inl"
	-@del /f/q "Event_ForwarderC.h"
	-@del /f/q "Event_ForwarderS.h"
	-@del /f/q "Event_ForwarderC.cpp"
	-@del /f/q "Event_ForwarderS.cpp"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\CosNotification_IDL\$(NULL)" mkdir "Static_Release\CosNotification_IDL"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"



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
!IF EXISTS("Makefile.CosNotification_IDL.dep")
!INCLUDE "Makefile.CosNotification_IDL.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
!IF  "$(CFG)" == "Win64 Debug"
SOURCE="CosNotification.idl"

InputPath=CosNotification.idl

"CosNotificationC.inl" "CosNotificationS.inl" "CosNotificationC.h" "CosNotificationS.h" "CosNotificationC.cpp" "CosNotificationS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-CosNotification_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,stub_export_macro=TAO_Notify_Export -Wb,stub_export_include=orbsvcs/Notify/notify_export.h -Wb,skel_export_macro=TAO_Notify_Skel_Export -Wb,skel_export_include=orbsvcs/Notify/notify_skel_export.h "$(InputPath)"
<<

SOURCE="CosNotifyComm.idl"

InputPath=CosNotifyComm.idl

"CosNotifyCommC.inl" "CosNotifyCommS.inl" "CosNotifyCommC.h" "CosNotifyCommS.h" "CosNotifyCommC.cpp" "CosNotifyCommS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-CosNotifyComm_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,stub_export_macro=TAO_Notify_Export -Wb,stub_export_include=orbsvcs/Notify/notify_export.h -Wb,skel_export_macro=TAO_Notify_Skel_Export -Wb,skel_export_include=orbsvcs/Notify/notify_skel_export.h "$(InputPath)"
<<

SOURCE="CosNotifyFilter.idl"

InputPath=CosNotifyFilter.idl

"CosNotifyFilterC.inl" "CosNotifyFilterS.inl" "CosNotifyFilterC.h" "CosNotifyFilterS.h" "CosNotifyFilterC.cpp" "CosNotifyFilterS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-CosNotifyFilter_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,stub_export_macro=TAO_Notify_Export -Wb,stub_export_include=orbsvcs/Notify/notify_export.h -Wb,skel_export_macro=TAO_Notify_Skel_Export -Wb,skel_export_include=orbsvcs/Notify/notify_skel_export.h "$(InputPath)"
<<

SOURCE="CosNotifyChannelAdmin.idl"

InputPath=CosNotifyChannelAdmin.idl

"CosNotifyChannelAdminC.inl" "CosNotifyChannelAdminS.inl" "CosNotifyChannelAdminC.h" "CosNotifyChannelAdminS.h" "CosNotifyChannelAdminC.cpp" "CosNotifyChannelAdminS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-CosNotifyChannelAdmin_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,stub_export_macro=TAO_Notify_Export -Wb,stub_export_include=orbsvcs/Notify/notify_export.h -Wb,skel_export_macro=TAO_Notify_Skel_Export -Wb,skel_export_include=orbsvcs/Notify/notify_skel_export.h "$(InputPath)"
<<

SOURCE="NotifyExt.idl"

InputPath=NotifyExt.idl

"NotifyExtC.inl" "NotifyExtS.inl" "NotifyExtC.h" "NotifyExtS.h" "NotifyExtC.cpp" "NotifyExtS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-NotifyExt_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,stub_export_macro=TAO_Notify_Export -Wb,stub_export_include=orbsvcs/Notify/notify_export.h -Wb,skel_export_macro=TAO_Notify_Skel_Export -Wb,skel_export_include=orbsvcs/Notify/notify_skel_export.h "$(InputPath)"
<<

SOURCE="Event_Forwarder.idl"

InputPath=Event_Forwarder.idl

"Event_ForwarderC.inl" "Event_ForwarderS.inl" "Event_ForwarderC.h" "Event_ForwarderS.h" "Event_ForwarderC.cpp" "Event_ForwarderS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-Event_Forwarder_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,stub_export_macro=TAO_Notify_Export -Wb,stub_export_include=orbsvcs/Notify/notify_export.h -Wb,skel_export_macro=TAO_Notify_Skel_Export -Wb,skel_export_include=orbsvcs/Notify/notify_skel_export.h "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Release"
SOURCE="CosNotification.idl"

InputPath=CosNotification.idl

"CosNotificationC.inl" "CosNotificationS.inl" "CosNotificationC.h" "CosNotificationS.h" "CosNotificationC.cpp" "CosNotificationS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-CosNotification_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,stub_export_macro=TAO_Notify_Export -Wb,stub_export_include=orbsvcs/Notify/notify_export.h -Wb,skel_export_macro=TAO_Notify_Skel_Export -Wb,skel_export_include=orbsvcs/Notify/notify_skel_export.h "$(InputPath)"
<<

SOURCE="CosNotifyComm.idl"

InputPath=CosNotifyComm.idl

"CosNotifyCommC.inl" "CosNotifyCommS.inl" "CosNotifyCommC.h" "CosNotifyCommS.h" "CosNotifyCommC.cpp" "CosNotifyCommS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-CosNotifyComm_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,stub_export_macro=TAO_Notify_Export -Wb,stub_export_include=orbsvcs/Notify/notify_export.h -Wb,skel_export_macro=TAO_Notify_Skel_Export -Wb,skel_export_include=orbsvcs/Notify/notify_skel_export.h "$(InputPath)"
<<

SOURCE="CosNotifyFilter.idl"

InputPath=CosNotifyFilter.idl

"CosNotifyFilterC.inl" "CosNotifyFilterS.inl" "CosNotifyFilterC.h" "CosNotifyFilterS.h" "CosNotifyFilterC.cpp" "CosNotifyFilterS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-CosNotifyFilter_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,stub_export_macro=TAO_Notify_Export -Wb,stub_export_include=orbsvcs/Notify/notify_export.h -Wb,skel_export_macro=TAO_Notify_Skel_Export -Wb,skel_export_include=orbsvcs/Notify/notify_skel_export.h "$(InputPath)"
<<

SOURCE="CosNotifyChannelAdmin.idl"

InputPath=CosNotifyChannelAdmin.idl

"CosNotifyChannelAdminC.inl" "CosNotifyChannelAdminS.inl" "CosNotifyChannelAdminC.h" "CosNotifyChannelAdminS.h" "CosNotifyChannelAdminC.cpp" "CosNotifyChannelAdminS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-CosNotifyChannelAdmin_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,stub_export_macro=TAO_Notify_Export -Wb,stub_export_include=orbsvcs/Notify/notify_export.h -Wb,skel_export_macro=TAO_Notify_Skel_Export -Wb,skel_export_include=orbsvcs/Notify/notify_skel_export.h "$(InputPath)"
<<

SOURCE="NotifyExt.idl"

InputPath=NotifyExt.idl

"NotifyExtC.inl" "NotifyExtS.inl" "NotifyExtC.h" "NotifyExtS.h" "NotifyExtC.cpp" "NotifyExtS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-NotifyExt_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,stub_export_macro=TAO_Notify_Export -Wb,stub_export_include=orbsvcs/Notify/notify_export.h -Wb,skel_export_macro=TAO_Notify_Skel_Export -Wb,skel_export_include=orbsvcs/Notify/notify_skel_export.h "$(InputPath)"
<<

SOURCE="Event_Forwarder.idl"

InputPath=Event_Forwarder.idl

"Event_ForwarderC.inl" "Event_ForwarderS.inl" "Event_ForwarderC.h" "Event_ForwarderS.h" "Event_ForwarderC.cpp" "Event_ForwarderS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-Event_Forwarder_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,stub_export_macro=TAO_Notify_Export -Wb,stub_export_include=orbsvcs/Notify/notify_export.h -Wb,skel_export_macro=TAO_Notify_Skel_Export -Wb,skel_export_include=orbsvcs/Notify/notify_skel_export.h "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Debug"
SOURCE="CosNotification.idl"

InputPath=CosNotification.idl

"CosNotificationC.inl" "CosNotificationS.inl" "CosNotificationC.h" "CosNotificationS.h" "CosNotificationC.cpp" "CosNotificationS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-CosNotification_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,stub_export_macro=TAO_Notify_Export -Wb,stub_export_include=orbsvcs/Notify/notify_export.h -Wb,skel_export_macro=TAO_Notify_Skel_Export -Wb,skel_export_include=orbsvcs/Notify/notify_skel_export.h "$(InputPath)"
<<

SOURCE="CosNotifyComm.idl"

InputPath=CosNotifyComm.idl

"CosNotifyCommC.inl" "CosNotifyCommS.inl" "CosNotifyCommC.h" "CosNotifyCommS.h" "CosNotifyCommC.cpp" "CosNotifyCommS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-CosNotifyComm_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,stub_export_macro=TAO_Notify_Export -Wb,stub_export_include=orbsvcs/Notify/notify_export.h -Wb,skel_export_macro=TAO_Notify_Skel_Export -Wb,skel_export_include=orbsvcs/Notify/notify_skel_export.h "$(InputPath)"
<<

SOURCE="CosNotifyFilter.idl"

InputPath=CosNotifyFilter.idl

"CosNotifyFilterC.inl" "CosNotifyFilterS.inl" "CosNotifyFilterC.h" "CosNotifyFilterS.h" "CosNotifyFilterC.cpp" "CosNotifyFilterS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-CosNotifyFilter_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,stub_export_macro=TAO_Notify_Export -Wb,stub_export_include=orbsvcs/Notify/notify_export.h -Wb,skel_export_macro=TAO_Notify_Skel_Export -Wb,skel_export_include=orbsvcs/Notify/notify_skel_export.h "$(InputPath)"
<<

SOURCE="CosNotifyChannelAdmin.idl"

InputPath=CosNotifyChannelAdmin.idl

"CosNotifyChannelAdminC.inl" "CosNotifyChannelAdminS.inl" "CosNotifyChannelAdminC.h" "CosNotifyChannelAdminS.h" "CosNotifyChannelAdminC.cpp" "CosNotifyChannelAdminS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-CosNotifyChannelAdmin_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,stub_export_macro=TAO_Notify_Export -Wb,stub_export_include=orbsvcs/Notify/notify_export.h -Wb,skel_export_macro=TAO_Notify_Skel_Export -Wb,skel_export_include=orbsvcs/Notify/notify_skel_export.h "$(InputPath)"
<<

SOURCE="NotifyExt.idl"

InputPath=NotifyExt.idl

"NotifyExtC.inl" "NotifyExtS.inl" "NotifyExtC.h" "NotifyExtS.h" "NotifyExtC.cpp" "NotifyExtS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-NotifyExt_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,stub_export_macro=TAO_Notify_Export -Wb,stub_export_include=orbsvcs/Notify/notify_export.h -Wb,skel_export_macro=TAO_Notify_Skel_Export -Wb,skel_export_include=orbsvcs/Notify/notify_skel_export.h "$(InputPath)"
<<

SOURCE="Event_Forwarder.idl"

InputPath=Event_Forwarder.idl

"Event_ForwarderC.inl" "Event_ForwarderS.inl" "Event_ForwarderC.h" "Event_ForwarderS.h" "Event_ForwarderC.cpp" "Event_ForwarderS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-Event_Forwarder_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,stub_export_macro=TAO_Notify_Export -Wb,stub_export_include=orbsvcs/Notify/notify_export.h -Wb,skel_export_macro=TAO_Notify_Skel_Export -Wb,skel_export_include=orbsvcs/Notify/notify_skel_export.h "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Release"
SOURCE="CosNotification.idl"

InputPath=CosNotification.idl

"CosNotificationC.inl" "CosNotificationS.inl" "CosNotificationC.h" "CosNotificationS.h" "CosNotificationC.cpp" "CosNotificationS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-CosNotification_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,stub_export_macro=TAO_Notify_Export -Wb,stub_export_include=orbsvcs/Notify/notify_export.h -Wb,skel_export_macro=TAO_Notify_Skel_Export -Wb,skel_export_include=orbsvcs/Notify/notify_skel_export.h "$(InputPath)"
<<

SOURCE="CosNotifyComm.idl"

InputPath=CosNotifyComm.idl

"CosNotifyCommC.inl" "CosNotifyCommS.inl" "CosNotifyCommC.h" "CosNotifyCommS.h" "CosNotifyCommC.cpp" "CosNotifyCommS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-CosNotifyComm_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,stub_export_macro=TAO_Notify_Export -Wb,stub_export_include=orbsvcs/Notify/notify_export.h -Wb,skel_export_macro=TAO_Notify_Skel_Export -Wb,skel_export_include=orbsvcs/Notify/notify_skel_export.h "$(InputPath)"
<<

SOURCE="CosNotifyFilter.idl"

InputPath=CosNotifyFilter.idl

"CosNotifyFilterC.inl" "CosNotifyFilterS.inl" "CosNotifyFilterC.h" "CosNotifyFilterS.h" "CosNotifyFilterC.cpp" "CosNotifyFilterS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-CosNotifyFilter_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,stub_export_macro=TAO_Notify_Export -Wb,stub_export_include=orbsvcs/Notify/notify_export.h -Wb,skel_export_macro=TAO_Notify_Skel_Export -Wb,skel_export_include=orbsvcs/Notify/notify_skel_export.h "$(InputPath)"
<<

SOURCE="CosNotifyChannelAdmin.idl"

InputPath=CosNotifyChannelAdmin.idl

"CosNotifyChannelAdminC.inl" "CosNotifyChannelAdminS.inl" "CosNotifyChannelAdminC.h" "CosNotifyChannelAdminS.h" "CosNotifyChannelAdminC.cpp" "CosNotifyChannelAdminS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-CosNotifyChannelAdmin_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,stub_export_macro=TAO_Notify_Export -Wb,stub_export_include=orbsvcs/Notify/notify_export.h -Wb,skel_export_macro=TAO_Notify_Skel_Export -Wb,skel_export_include=orbsvcs/Notify/notify_skel_export.h "$(InputPath)"
<<

SOURCE="NotifyExt.idl"

InputPath=NotifyExt.idl

"NotifyExtC.inl" "NotifyExtS.inl" "NotifyExtC.h" "NotifyExtS.h" "NotifyExtC.cpp" "NotifyExtS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-NotifyExt_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,stub_export_macro=TAO_Notify_Export -Wb,stub_export_include=orbsvcs/Notify/notify_export.h -Wb,skel_export_macro=TAO_Notify_Skel_Export -Wb,skel_export_include=orbsvcs/Notify/notify_skel_export.h "$(InputPath)"
<<

SOURCE="Event_Forwarder.idl"

InputPath=Event_Forwarder.idl

"Event_ForwarderC.inl" "Event_ForwarderS.inl" "Event_ForwarderC.h" "Event_ForwarderS.h" "Event_ForwarderC.cpp" "Event_ForwarderS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-Event_Forwarder_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,stub_export_macro=TAO_Notify_Export -Wb,stub_export_include=orbsvcs/Notify/notify_export.h -Wb,skel_export_macro=TAO_Notify_Skel_Export -Wb,skel_export_include=orbsvcs/Notify/notify_skel_export.h "$(InputPath)"
<<

!ENDIF


!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.CosNotification_IDL.dep")
	@echo Using "Makefile.CosNotification_IDL.dep"
!ENDIF
!ENDIF

