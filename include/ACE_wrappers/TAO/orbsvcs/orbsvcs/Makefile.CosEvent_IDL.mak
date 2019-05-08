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
!MESSAGE NMAKE /f "Makefile.CosEvent_IDL.mak" CFG="Win64 Debug"
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

GENERATED_DIRTY = "CosTypedEventCommC.inl" "CosTypedEventCommS.inl" "CosTypedEventCommC.h" "CosTypedEventCommS.h" "CosTypedEventCommS_T.h" "CosTypedEventCommC.cpp" "CosTypedEventCommS.cpp" "CosTypedEventCommS_T.cpp" "CosTypedEventChannelAdminC.inl" "CosTypedEventChannelAdminS.inl" "CosTypedEventChannelAdminC.h" "CosTypedEventChannelAdminS.h" "CosTypedEventChannelAdminS_T.h" "CosTypedEventChannelAdminC.cpp" "CosTypedEventChannelAdminS.cpp" "CosTypedEventChannelAdminS_T.cpp" "CosEventCommC.inl" "CosEventCommS.inl" "CosEventCommC.h" "CosEventCommS.h" "CosEventCommS_T.h" "CosEventCommC.cpp" "CosEventCommS.cpp" "CosEventCommS_T.cpp" "CosEventChannelAdminC.inl" "CosEventChannelAdminS.inl" "CosEventChannelAdminC.h" "CosEventChannelAdminS.h" "CosEventChannelAdminS_T.h" "CosEventChannelAdminC.cpp" "CosEventChannelAdminS.cpp" "CosEventChannelAdminS_T.cpp"

!IF  "$(CFG)" == "Win64 Debug"

OUTDIR=..\..\..\lib
INTDIR=Debug\CosEvent_IDL\IA64

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
	-@del /f/q "CosTypedEventCommC.inl"
	-@del /f/q "CosTypedEventCommS.inl"
	-@del /f/q "CosTypedEventCommC.h"
	-@del /f/q "CosTypedEventCommS.h"
	-@del /f/q "CosTypedEventCommS_T.h"
	-@del /f/q "CosTypedEventCommC.cpp"
	-@del /f/q "CosTypedEventCommS.cpp"
	-@del /f/q "CosTypedEventCommS_T.cpp"
	-@del /f/q "CosTypedEventChannelAdminC.inl"
	-@del /f/q "CosTypedEventChannelAdminS.inl"
	-@del /f/q "CosTypedEventChannelAdminC.h"
	-@del /f/q "CosTypedEventChannelAdminS.h"
	-@del /f/q "CosTypedEventChannelAdminS_T.h"
	-@del /f/q "CosTypedEventChannelAdminC.cpp"
	-@del /f/q "CosTypedEventChannelAdminS.cpp"
	-@del /f/q "CosTypedEventChannelAdminS_T.cpp"
	-@del /f/q "CosEventCommC.inl"
	-@del /f/q "CosEventCommS.inl"
	-@del /f/q "CosEventCommC.h"
	-@del /f/q "CosEventCommS.h"
	-@del /f/q "CosEventCommS_T.h"
	-@del /f/q "CosEventCommC.cpp"
	-@del /f/q "CosEventCommS.cpp"
	-@del /f/q "CosEventCommS_T.cpp"
	-@del /f/q "CosEventChannelAdminC.inl"
	-@del /f/q "CosEventChannelAdminS.inl"
	-@del /f/q "CosEventChannelAdminC.h"
	-@del /f/q "CosEventChannelAdminS.h"
	-@del /f/q "CosEventChannelAdminS_T.h"
	-@del /f/q "CosEventChannelAdminC.cpp"
	-@del /f/q "CosEventChannelAdminS.cpp"
	-@del /f/q "CosEventChannelAdminS_T.cpp"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\CosEvent_IDL\$(NULL)" mkdir "Debug\CosEvent_IDL"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe


!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\CosEvent_IDL\IA64

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
	-@del /f/q "CosTypedEventCommC.inl"
	-@del /f/q "CosTypedEventCommS.inl"
	-@del /f/q "CosTypedEventCommC.h"
	-@del /f/q "CosTypedEventCommS.h"
	-@del /f/q "CosTypedEventCommS_T.h"
	-@del /f/q "CosTypedEventCommC.cpp"
	-@del /f/q "CosTypedEventCommS.cpp"
	-@del /f/q "CosTypedEventCommS_T.cpp"
	-@del /f/q "CosTypedEventChannelAdminC.inl"
	-@del /f/q "CosTypedEventChannelAdminS.inl"
	-@del /f/q "CosTypedEventChannelAdminC.h"
	-@del /f/q "CosTypedEventChannelAdminS.h"
	-@del /f/q "CosTypedEventChannelAdminS_T.h"
	-@del /f/q "CosTypedEventChannelAdminC.cpp"
	-@del /f/q "CosTypedEventChannelAdminS.cpp"
	-@del /f/q "CosTypedEventChannelAdminS_T.cpp"
	-@del /f/q "CosEventCommC.inl"
	-@del /f/q "CosEventCommS.inl"
	-@del /f/q "CosEventCommC.h"
	-@del /f/q "CosEventCommS.h"
	-@del /f/q "CosEventCommS_T.h"
	-@del /f/q "CosEventCommC.cpp"
	-@del /f/q "CosEventCommS.cpp"
	-@del /f/q "CosEventCommS_T.cpp"
	-@del /f/q "CosEventChannelAdminC.inl"
	-@del /f/q "CosEventChannelAdminS.inl"
	-@del /f/q "CosEventChannelAdminC.h"
	-@del /f/q "CosEventChannelAdminS.h"
	-@del /f/q "CosEventChannelAdminS_T.h"
	-@del /f/q "CosEventChannelAdminC.cpp"
	-@del /f/q "CosEventChannelAdminS.cpp"
	-@del /f/q "CosEventChannelAdminS_T.cpp"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\CosEvent_IDL\$(NULL)" mkdir "Release\CosEvent_IDL"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe


!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\CosEvent_IDL\IA64

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
	-@del /f/q "CosTypedEventCommC.inl"
	-@del /f/q "CosTypedEventCommS.inl"
	-@del /f/q "CosTypedEventCommC.h"
	-@del /f/q "CosTypedEventCommS.h"
	-@del /f/q "CosTypedEventCommS_T.h"
	-@del /f/q "CosTypedEventCommC.cpp"
	-@del /f/q "CosTypedEventCommS.cpp"
	-@del /f/q "CosTypedEventCommS_T.cpp"
	-@del /f/q "CosTypedEventChannelAdminC.inl"
	-@del /f/q "CosTypedEventChannelAdminS.inl"
	-@del /f/q "CosTypedEventChannelAdminC.h"
	-@del /f/q "CosTypedEventChannelAdminS.h"
	-@del /f/q "CosTypedEventChannelAdminS_T.h"
	-@del /f/q "CosTypedEventChannelAdminC.cpp"
	-@del /f/q "CosTypedEventChannelAdminS.cpp"
	-@del /f/q "CosTypedEventChannelAdminS_T.cpp"
	-@del /f/q "CosEventCommC.inl"
	-@del /f/q "CosEventCommS.inl"
	-@del /f/q "CosEventCommC.h"
	-@del /f/q "CosEventCommS.h"
	-@del /f/q "CosEventCommS_T.h"
	-@del /f/q "CosEventCommC.cpp"
	-@del /f/q "CosEventCommS.cpp"
	-@del /f/q "CosEventCommS_T.cpp"
	-@del /f/q "CosEventChannelAdminC.inl"
	-@del /f/q "CosEventChannelAdminS.inl"
	-@del /f/q "CosEventChannelAdminC.h"
	-@del /f/q "CosEventChannelAdminS.h"
	-@del /f/q "CosEventChannelAdminS_T.h"
	-@del /f/q "CosEventChannelAdminC.cpp"
	-@del /f/q "CosEventChannelAdminS.cpp"
	-@del /f/q "CosEventChannelAdminS_T.cpp"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\CosEvent_IDL\$(NULL)" mkdir "Static_Debug\CosEvent_IDL"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\sd.pdb" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"



!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\CosEvent_IDL\IA64

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
	-@del /f/q "CosTypedEventCommC.inl"
	-@del /f/q "CosTypedEventCommS.inl"
	-@del /f/q "CosTypedEventCommC.h"
	-@del /f/q "CosTypedEventCommS.h"
	-@del /f/q "CosTypedEventCommS_T.h"
	-@del /f/q "CosTypedEventCommC.cpp"
	-@del /f/q "CosTypedEventCommS.cpp"
	-@del /f/q "CosTypedEventCommS_T.cpp"
	-@del /f/q "CosTypedEventChannelAdminC.inl"
	-@del /f/q "CosTypedEventChannelAdminS.inl"
	-@del /f/q "CosTypedEventChannelAdminC.h"
	-@del /f/q "CosTypedEventChannelAdminS.h"
	-@del /f/q "CosTypedEventChannelAdminS_T.h"
	-@del /f/q "CosTypedEventChannelAdminC.cpp"
	-@del /f/q "CosTypedEventChannelAdminS.cpp"
	-@del /f/q "CosTypedEventChannelAdminS_T.cpp"
	-@del /f/q "CosEventCommC.inl"
	-@del /f/q "CosEventCommS.inl"
	-@del /f/q "CosEventCommC.h"
	-@del /f/q "CosEventCommS.h"
	-@del /f/q "CosEventCommS_T.h"
	-@del /f/q "CosEventCommC.cpp"
	-@del /f/q "CosEventCommS.cpp"
	-@del /f/q "CosEventCommS_T.cpp"
	-@del /f/q "CosEventChannelAdminC.inl"
	-@del /f/q "CosEventChannelAdminS.inl"
	-@del /f/q "CosEventChannelAdminC.h"
	-@del /f/q "CosEventChannelAdminS.h"
	-@del /f/q "CosEventChannelAdminS_T.h"
	-@del /f/q "CosEventChannelAdminC.cpp"
	-@del /f/q "CosEventChannelAdminS.cpp"
	-@del /f/q "CosEventChannelAdminS_T.cpp"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\CosEvent_IDL\$(NULL)" mkdir "Static_Release\CosEvent_IDL"
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
!IF EXISTS("Makefile.CosEvent_IDL.dep")
!INCLUDE "Makefile.CosEvent_IDL.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
!IF  "$(CFG)" == "Win64 Debug"
SOURCE="CosTypedEventComm.idl"

InputPath=CosTypedEventComm.idl

"CosTypedEventCommC.inl" "CosTypedEventCommS.inl" "CosTypedEventCommC.h" "CosTypedEventCommS.h" "CosTypedEventCommS_T.h" "CosTypedEventCommC.cpp" "CosTypedEventCommS.cpp" "CosTypedEventCommS_T.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-CosTypedEventComm_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -GT -Wb,stub_export_macro=TAO_Event_Export -Wb,stub_export_include=orbsvcs/CosEvent/event_export.h -Wb,skel_export_macro=TAO_Event_Skel_Export -Wb,skel_export_include=orbsvcs/CosEvent/event_skel_export.h "$(InputPath)"
<<

SOURCE="CosTypedEventChannelAdmin.idl"

InputPath=CosTypedEventChannelAdmin.idl

"CosTypedEventChannelAdminC.inl" "CosTypedEventChannelAdminS.inl" "CosTypedEventChannelAdminC.h" "CosTypedEventChannelAdminS.h" "CosTypedEventChannelAdminS_T.h" "CosTypedEventChannelAdminC.cpp" "CosTypedEventChannelAdminS.cpp" "CosTypedEventChannelAdminS_T.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-CosTypedEventChannelAdmin_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -GT -Wb,stub_export_macro=TAO_Event_Export -Wb,stub_export_include=orbsvcs/CosEvent/event_export.h -Wb,skel_export_macro=TAO_Event_Skel_Export -Wb,skel_export_include=orbsvcs/CosEvent/event_skel_export.h "$(InputPath)"
<<

SOURCE="CosEventComm.idl"

InputPath=CosEventComm.idl

"CosEventCommC.inl" "CosEventCommS.inl" "CosEventCommC.h" "CosEventCommS.h" "CosEventCommS_T.h" "CosEventCommC.cpp" "CosEventCommS.cpp" "CosEventCommS_T.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-CosEventComm_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GT -Wb,stub_export_macro=TAO_Event_Export -Wb,stub_export_include=orbsvcs/CosEvent/event_export.h -Wb,skel_export_macro=TAO_Event_Skel_Export -Wb,skel_export_include=orbsvcs/CosEvent/event_skel_export.h "$(InputPath)"
<<

SOURCE="CosEventChannelAdmin.idl"

InputPath=CosEventChannelAdmin.idl

"CosEventChannelAdminC.inl" "CosEventChannelAdminS.inl" "CosEventChannelAdminC.h" "CosEventChannelAdminS.h" "CosEventChannelAdminS_T.h" "CosEventChannelAdminC.cpp" "CosEventChannelAdminS.cpp" "CosEventChannelAdminS_T.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-CosEventChannelAdmin_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GT -Wb,stub_export_macro=TAO_Event_Export -Wb,stub_export_include=orbsvcs/CosEvent/event_export.h -Wb,skel_export_macro=TAO_Event_Skel_Export -Wb,skel_export_include=orbsvcs/CosEvent/event_skel_export.h "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Release"
SOURCE="CosTypedEventComm.idl"

InputPath=CosTypedEventComm.idl

"CosTypedEventCommC.inl" "CosTypedEventCommS.inl" "CosTypedEventCommC.h" "CosTypedEventCommS.h" "CosTypedEventCommS_T.h" "CosTypedEventCommC.cpp" "CosTypedEventCommS.cpp" "CosTypedEventCommS_T.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-CosTypedEventComm_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -GT -Wb,stub_export_macro=TAO_Event_Export -Wb,stub_export_include=orbsvcs/CosEvent/event_export.h -Wb,skel_export_macro=TAO_Event_Skel_Export -Wb,skel_export_include=orbsvcs/CosEvent/event_skel_export.h "$(InputPath)"
<<

SOURCE="CosTypedEventChannelAdmin.idl"

InputPath=CosTypedEventChannelAdmin.idl

"CosTypedEventChannelAdminC.inl" "CosTypedEventChannelAdminS.inl" "CosTypedEventChannelAdminC.h" "CosTypedEventChannelAdminS.h" "CosTypedEventChannelAdminS_T.h" "CosTypedEventChannelAdminC.cpp" "CosTypedEventChannelAdminS.cpp" "CosTypedEventChannelAdminS_T.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-CosTypedEventChannelAdmin_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -GT -Wb,stub_export_macro=TAO_Event_Export -Wb,stub_export_include=orbsvcs/CosEvent/event_export.h -Wb,skel_export_macro=TAO_Event_Skel_Export -Wb,skel_export_include=orbsvcs/CosEvent/event_skel_export.h "$(InputPath)"
<<

SOURCE="CosEventComm.idl"

InputPath=CosEventComm.idl

"CosEventCommC.inl" "CosEventCommS.inl" "CosEventCommC.h" "CosEventCommS.h" "CosEventCommS_T.h" "CosEventCommC.cpp" "CosEventCommS.cpp" "CosEventCommS_T.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-CosEventComm_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GT -Wb,stub_export_macro=TAO_Event_Export -Wb,stub_export_include=orbsvcs/CosEvent/event_export.h -Wb,skel_export_macro=TAO_Event_Skel_Export -Wb,skel_export_include=orbsvcs/CosEvent/event_skel_export.h "$(InputPath)"
<<

SOURCE="CosEventChannelAdmin.idl"

InputPath=CosEventChannelAdmin.idl

"CosEventChannelAdminC.inl" "CosEventChannelAdminS.inl" "CosEventChannelAdminC.h" "CosEventChannelAdminS.h" "CosEventChannelAdminS_T.h" "CosEventChannelAdminC.cpp" "CosEventChannelAdminS.cpp" "CosEventChannelAdminS_T.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-CosEventChannelAdmin_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GT -Wb,stub_export_macro=TAO_Event_Export -Wb,stub_export_include=orbsvcs/CosEvent/event_export.h -Wb,skel_export_macro=TAO_Event_Skel_Export -Wb,skel_export_include=orbsvcs/CosEvent/event_skel_export.h "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Debug"
SOURCE="CosTypedEventComm.idl"

InputPath=CosTypedEventComm.idl

"CosTypedEventCommC.inl" "CosTypedEventCommS.inl" "CosTypedEventCommC.h" "CosTypedEventCommS.h" "CosTypedEventCommS_T.h" "CosTypedEventCommC.cpp" "CosTypedEventCommS.cpp" "CosTypedEventCommS_T.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-CosTypedEventComm_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -GT -Wb,stub_export_macro=TAO_Event_Export -Wb,stub_export_include=orbsvcs/CosEvent/event_export.h -Wb,skel_export_macro=TAO_Event_Skel_Export -Wb,skel_export_include=orbsvcs/CosEvent/event_skel_export.h "$(InputPath)"
<<

SOURCE="CosTypedEventChannelAdmin.idl"

InputPath=CosTypedEventChannelAdmin.idl

"CosTypedEventChannelAdminC.inl" "CosTypedEventChannelAdminS.inl" "CosTypedEventChannelAdminC.h" "CosTypedEventChannelAdminS.h" "CosTypedEventChannelAdminS_T.h" "CosTypedEventChannelAdminC.cpp" "CosTypedEventChannelAdminS.cpp" "CosTypedEventChannelAdminS_T.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-CosTypedEventChannelAdmin_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -GT -Wb,stub_export_macro=TAO_Event_Export -Wb,stub_export_include=orbsvcs/CosEvent/event_export.h -Wb,skel_export_macro=TAO_Event_Skel_Export -Wb,skel_export_include=orbsvcs/CosEvent/event_skel_export.h "$(InputPath)"
<<

SOURCE="CosEventComm.idl"

InputPath=CosEventComm.idl

"CosEventCommC.inl" "CosEventCommS.inl" "CosEventCommC.h" "CosEventCommS.h" "CosEventCommS_T.h" "CosEventCommC.cpp" "CosEventCommS.cpp" "CosEventCommS_T.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-CosEventComm_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GT -Wb,stub_export_macro=TAO_Event_Export -Wb,stub_export_include=orbsvcs/CosEvent/event_export.h -Wb,skel_export_macro=TAO_Event_Skel_Export -Wb,skel_export_include=orbsvcs/CosEvent/event_skel_export.h "$(InputPath)"
<<

SOURCE="CosEventChannelAdmin.idl"

InputPath=CosEventChannelAdmin.idl

"CosEventChannelAdminC.inl" "CosEventChannelAdminS.inl" "CosEventChannelAdminC.h" "CosEventChannelAdminS.h" "CosEventChannelAdminS_T.h" "CosEventChannelAdminC.cpp" "CosEventChannelAdminS.cpp" "CosEventChannelAdminS_T.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-CosEventChannelAdmin_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GT -Wb,stub_export_macro=TAO_Event_Export -Wb,stub_export_include=orbsvcs/CosEvent/event_export.h -Wb,skel_export_macro=TAO_Event_Skel_Export -Wb,skel_export_include=orbsvcs/CosEvent/event_skel_export.h "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Release"
SOURCE="CosTypedEventComm.idl"

InputPath=CosTypedEventComm.idl

"CosTypedEventCommC.inl" "CosTypedEventCommS.inl" "CosTypedEventCommC.h" "CosTypedEventCommS.h" "CosTypedEventCommS_T.h" "CosTypedEventCommC.cpp" "CosTypedEventCommS.cpp" "CosTypedEventCommS_T.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-CosTypedEventComm_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -GT -Wb,stub_export_macro=TAO_Event_Export -Wb,stub_export_include=orbsvcs/CosEvent/event_export.h -Wb,skel_export_macro=TAO_Event_Skel_Export -Wb,skel_export_include=orbsvcs/CosEvent/event_skel_export.h "$(InputPath)"
<<

SOURCE="CosTypedEventChannelAdmin.idl"

InputPath=CosTypedEventChannelAdmin.idl

"CosTypedEventChannelAdminC.inl" "CosTypedEventChannelAdminS.inl" "CosTypedEventChannelAdminC.h" "CosTypedEventChannelAdminS.h" "CosTypedEventChannelAdminS_T.h" "CosTypedEventChannelAdminC.cpp" "CosTypedEventChannelAdminS.cpp" "CosTypedEventChannelAdminS_T.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-CosTypedEventChannelAdmin_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -GT -Wb,stub_export_macro=TAO_Event_Export -Wb,stub_export_include=orbsvcs/CosEvent/event_export.h -Wb,skel_export_macro=TAO_Event_Skel_Export -Wb,skel_export_include=orbsvcs/CosEvent/event_skel_export.h "$(InputPath)"
<<

SOURCE="CosEventComm.idl"

InputPath=CosEventComm.idl

"CosEventCommC.inl" "CosEventCommS.inl" "CosEventCommC.h" "CosEventCommS.h" "CosEventCommS_T.h" "CosEventCommC.cpp" "CosEventCommS.cpp" "CosEventCommS_T.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-CosEventComm_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GT -Wb,stub_export_macro=TAO_Event_Export -Wb,stub_export_include=orbsvcs/CosEvent/event_export.h -Wb,skel_export_macro=TAO_Event_Skel_Export -Wb,skel_export_include=orbsvcs/CosEvent/event_skel_export.h "$(InputPath)"
<<

SOURCE="CosEventChannelAdmin.idl"

InputPath=CosEventChannelAdmin.idl

"CosEventChannelAdminC.inl" "CosEventChannelAdminS.inl" "CosEventChannelAdminC.h" "CosEventChannelAdminS.h" "CosEventChannelAdminS_T.h" "CosEventChannelAdminC.cpp" "CosEventChannelAdminS.cpp" "CosEventChannelAdminS_T.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-CosEventChannelAdmin_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GT -Wb,stub_export_macro=TAO_Event_Export -Wb,stub_export_include=orbsvcs/CosEvent/event_export.h -Wb,skel_export_macro=TAO_Event_Skel_Export -Wb,skel_export_include=orbsvcs/CosEvent/event_skel_export.h "$(InputPath)"
<<

!ENDIF


!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.CosEvent_IDL.dep")
	@echo Using "Makefile.CosEvent_IDL.dep"
!ENDIF
!ENDIF

