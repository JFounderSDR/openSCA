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
!MESSAGE NMAKE /f "Makefile.RTEvent.mak" CFG="Win64 Debug"
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

GENERATED_DIRTY = "RtecDefaultEventDataC.inl" "RtecDefaultEventDataC.h" "RtecDefaultEventDataC.cpp" "RtecDefaultEventDataS_T.cpp" "RtecEventCommC.inl" "RtecEventCommC.h" "RtecEventCommC.cpp" "RtecEventCommS_T.cpp" "RtecEventChannelAdminC.inl" "RtecEventChannelAdminC.h" "RtecEventChannelAdminC.cpp" "RtecEventChannelAdminS_T.cpp" "RtecUDPAdminC.inl" "RtecUDPAdminC.h" "RtecUDPAdminC.cpp" "RtecUDPAdminS_T.cpp"

!IF  "$(CFG)" == "Win64 Debug"

OUTDIR=..\..\..\lib
INTDIR=Debug\RTEvent\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_RTEventd.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_RTEVENT_BUILD_DLL -f "Makefile.RTEvent.dep" "Event_Utilities.cpp" "RtecDefaultEventDataC.cpp" "RtecEventCommC.cpp" "RtecEventChannelAdminC.cpp" "RtecUDPAdminC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_RTEventd.pdb"
	-@del /f/q "..\..\..\lib\TAO_RTEventd.dll"
	-@del /f/q "$(OUTDIR)\TAO_RTEventd.lib"
	-@del /f/q "$(OUTDIR)\TAO_RTEventd.exp"
	-@del /f/q "$(OUTDIR)\TAO_RTEventd.ilk"
	-@del /f/q "RtecDefaultEventDataC.inl"
	-@del /f/q "RtecDefaultEventDataC.h"
	-@del /f/q "RtecDefaultEventDataC.cpp"
	-@del /f/q "RtecDefaultEventDataS_T.cpp"
	-@del /f/q "RtecEventCommC.inl"
	-@del /f/q "RtecEventCommC.h"
	-@del /f/q "RtecEventCommC.cpp"
	-@del /f/q "RtecEventCommS_T.cpp"
	-@del /f/q "RtecEventChannelAdminC.inl"
	-@del /f/q "RtecEventChannelAdminC.h"
	-@del /f/q "RtecEventChannelAdminC.cpp"
	-@del /f/q "RtecEventChannelAdminS_T.cpp"
	-@del /f/q "RtecUDPAdminC.inl"
	-@del /f/q "RtecUDPAdminC.h"
	-@del /f/q "RtecUDPAdminC.cpp"
	-@del /f/q "RtecUDPAdminS_T.cpp"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\RTEvent\$(NULL)" mkdir "Debug\RTEvent"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_RTEVENT_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_PortableServerd.lib TAO_Svc_Utilsd.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\..\lib\TAO_RTEventd.pdb" /machine:IA64 /out:"..\..\..\lib\TAO_RTEventd.dll" /implib:"$(OUTDIR)\TAO_RTEventd.lib"
LINK32_OBJS= \
	"$(INTDIR)\RTEvent.res" \
	"$(INTDIR)\Event_Utilities.obj" \
	"$(INTDIR)\RtecDefaultEventDataC.obj" \
	"$(INTDIR)\RtecEventCommC.obj" \
	"$(INTDIR)\RtecEventChannelAdminC.obj" \
	"$(INTDIR)\RtecUDPAdminC.obj"

"..\..\..\lib\TAO_RTEventd.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_RTEventd.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_RTEventd.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\RTEvent\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_RTEvent.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_RTEVENT_BUILD_DLL -f "Makefile.RTEvent.dep" "Event_Utilities.cpp" "RtecDefaultEventDataC.cpp" "RtecEventCommC.cpp" "RtecEventChannelAdminC.cpp" "RtecUDPAdminC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\TAO_RTEvent.dll"
	-@del /f/q "$(OUTDIR)\TAO_RTEvent.lib"
	-@del /f/q "$(OUTDIR)\TAO_RTEvent.exp"
	-@del /f/q "$(OUTDIR)\TAO_RTEvent.ilk"
	-@del /f/q "RtecDefaultEventDataC.inl"
	-@del /f/q "RtecDefaultEventDataC.h"
	-@del /f/q "RtecDefaultEventDataC.cpp"
	-@del /f/q "RtecDefaultEventDataS_T.cpp"
	-@del /f/q "RtecEventCommC.inl"
	-@del /f/q "RtecEventCommC.h"
	-@del /f/q "RtecEventCommC.cpp"
	-@del /f/q "RtecEventCommS_T.cpp"
	-@del /f/q "RtecEventChannelAdminC.inl"
	-@del /f/q "RtecEventChannelAdminC.h"
	-@del /f/q "RtecEventChannelAdminC.cpp"
	-@del /f/q "RtecEventChannelAdminS_T.cpp"
	-@del /f/q "RtecUDPAdminC.inl"
	-@del /f/q "RtecUDPAdminC.h"
	-@del /f/q "RtecUDPAdminC.cpp"
	-@del /f/q "RtecUDPAdminS_T.cpp"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\RTEvent\$(NULL)" mkdir "Release\RTEvent"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_RTEVENT_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_PortableServer.lib TAO_Svc_Utils.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\..\lib\TAO_RTEvent.dll" /implib:"$(OUTDIR)\TAO_RTEvent.lib"
LINK32_OBJS= \
	"$(INTDIR)\RTEvent.res" \
	"$(INTDIR)\Event_Utilities.obj" \
	"$(INTDIR)\RtecDefaultEventDataC.obj" \
	"$(INTDIR)\RtecEventCommC.obj" \
	"$(INTDIR)\RtecEventChannelAdminC.obj" \
	"$(INTDIR)\RtecUDPAdminC.obj"

"..\..\..\lib\TAO_RTEvent.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_RTEvent.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_RTEvent.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\RTEvent\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_RTEventsd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.RTEvent.dep" "Event_Utilities.cpp" "RtecDefaultEventDataC.cpp" "RtecEventCommC.cpp" "RtecEventChannelAdminC.cpp" "RtecUDPAdminC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_RTEventsd.lib"
	-@del /f/q "$(OUTDIR)\TAO_RTEventsd.exp"
	-@del /f/q "$(OUTDIR)\TAO_RTEventsd.ilk"
	-@del /f/q "..\..\..\lib\TAO_RTEventsd.pdb"
	-@del /f/q "RtecDefaultEventDataC.inl"
	-@del /f/q "RtecDefaultEventDataC.h"
	-@del /f/q "RtecDefaultEventDataC.cpp"
	-@del /f/q "RtecDefaultEventDataS_T.cpp"
	-@del /f/q "RtecEventCommC.inl"
	-@del /f/q "RtecEventCommC.h"
	-@del /f/q "RtecEventCommC.cpp"
	-@del /f/q "RtecEventCommS_T.cpp"
	-@del /f/q "RtecEventChannelAdminC.inl"
	-@del /f/q "RtecEventChannelAdminC.h"
	-@del /f/q "RtecEventChannelAdminC.cpp"
	-@del /f/q "RtecEventChannelAdminS_T.cpp"
	-@del /f/q "RtecUDPAdminC.inl"
	-@del /f/q "RtecUDPAdminC.h"
	-@del /f/q "RtecUDPAdminC.cpp"
	-@del /f/q "RtecUDPAdminS_T.cpp"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\RTEvent\$(NULL)" mkdir "Static_Debug\RTEvent"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\TAO_RTEventsd.pdb" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_RTEventsd.lib"
LINK32_OBJS= \
	"$(INTDIR)\Event_Utilities.obj" \
	"$(INTDIR)\RtecDefaultEventDataC.obj" \
	"$(INTDIR)\RtecEventCommC.obj" \
	"$(INTDIR)\RtecEventChannelAdminC.obj" \
	"$(INTDIR)\RtecUDPAdminC.obj"

"$(OUTDIR)\TAO_RTEventsd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_RTEventsd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_RTEventsd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\RTEvent\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_RTEvents.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.RTEvent.dep" "Event_Utilities.cpp" "RtecDefaultEventDataC.cpp" "RtecEventCommC.cpp" "RtecEventChannelAdminC.cpp" "RtecUDPAdminC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_RTEvents.lib"
	-@del /f/q "$(OUTDIR)\TAO_RTEvents.exp"
	-@del /f/q "$(OUTDIR)\TAO_RTEvents.ilk"
	-@del /f/q "RtecDefaultEventDataC.inl"
	-@del /f/q "RtecDefaultEventDataC.h"
	-@del /f/q "RtecDefaultEventDataC.cpp"
	-@del /f/q "RtecDefaultEventDataS_T.cpp"
	-@del /f/q "RtecEventCommC.inl"
	-@del /f/q "RtecEventCommC.h"
	-@del /f/q "RtecEventCommC.cpp"
	-@del /f/q "RtecEventCommS_T.cpp"
	-@del /f/q "RtecEventChannelAdminC.inl"
	-@del /f/q "RtecEventChannelAdminC.h"
	-@del /f/q "RtecEventChannelAdminC.cpp"
	-@del /f/q "RtecEventChannelAdminS_T.cpp"
	-@del /f/q "RtecUDPAdminC.inl"
	-@del /f/q "RtecUDPAdminC.h"
	-@del /f/q "RtecUDPAdminC.cpp"
	-@del /f/q "RtecUDPAdminS_T.cpp"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\RTEvent\$(NULL)" mkdir "Static_Release\RTEvent"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_RTEvents.lib"
LINK32_OBJS= \
	"$(INTDIR)\Event_Utilities.obj" \
	"$(INTDIR)\RtecDefaultEventDataC.obj" \
	"$(INTDIR)\RtecEventCommC.obj" \
	"$(INTDIR)\RtecEventChannelAdminC.obj" \
	"$(INTDIR)\RtecUDPAdminC.obj"

"$(OUTDIR)\TAO_RTEvents.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_RTEvents.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_RTEvents.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.RTEvent.dep")
!INCLUDE "Makefile.RTEvent.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="Event_Utilities.cpp"

"$(INTDIR)\Event_Utilities.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Event_Utilities.obj" $(SOURCE)

SOURCE="RtecDefaultEventDataC.cpp"

"$(INTDIR)\RtecDefaultEventDataC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RtecDefaultEventDataC.obj" $(SOURCE)

SOURCE="RtecEventCommC.cpp"

"$(INTDIR)\RtecEventCommC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RtecEventCommC.obj" $(SOURCE)

SOURCE="RtecEventChannelAdminC.cpp"

"$(INTDIR)\RtecEventChannelAdminC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RtecEventChannelAdminC.obj" $(SOURCE)

SOURCE="RtecUDPAdminC.cpp"

"$(INTDIR)\RtecUDPAdminC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RtecUDPAdminC.obj" $(SOURCE)

!IF  "$(CFG)" == "Win64 Debug"
SOURCE="RtecDefaultEventData.idl"

InputPath=RtecDefaultEventData.idl

"RtecDefaultEventDataC.inl" "RtecDefaultEventDataC.h" "RtecDefaultEventDataC.cpp" "RtecDefaultEventDataS_T.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-RtecDefaultEventData_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GT -Wb,stub_export_macro=TAO_RTEvent_Export -Wb,stub_export_include=orbsvcs/Event/event_export.h -Wb,skel_export_macro=TAO_RTEvent_Skel_Export -Wb,skel_export_include=orbsvcs/Event/event_skel_export.h "$(InputPath)"
<<

SOURCE="RtecEventComm.idl"

InputPath=RtecEventComm.idl

"RtecEventCommC.inl" "RtecEventCommC.h" "RtecEventCommC.cpp" "RtecEventCommS_T.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-RtecEventComm_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GT -Wb,stub_export_macro=TAO_RTEvent_Export -Wb,stub_export_include=orbsvcs/Event/event_export.h -Wb,skel_export_macro=TAO_RTEvent_Skel_Export -Wb,skel_export_include=orbsvcs/Event/event_skel_export.h "$(InputPath)"
<<

SOURCE="RtecEventChannelAdmin.idl"

InputPath=RtecEventChannelAdmin.idl

"RtecEventChannelAdminC.inl" "RtecEventChannelAdminC.h" "RtecEventChannelAdminC.cpp" "RtecEventChannelAdminS_T.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-RtecEventChannelAdmin_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GT -Wb,stub_export_macro=TAO_RTEvent_Export -Wb,stub_export_include=orbsvcs/Event/event_export.h -Wb,skel_export_macro=TAO_RTEvent_Skel_Export -Wb,skel_export_include=orbsvcs/Event/event_skel_export.h "$(InputPath)"
<<

SOURCE="RtecUDPAdmin.idl"

InputPath=RtecUDPAdmin.idl

"RtecUDPAdminC.inl" "RtecUDPAdminC.h" "RtecUDPAdminC.cpp" "RtecUDPAdminS_T.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-RtecUDPAdmin_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GT -Wb,stub_export_macro=TAO_RTEvent_Export -Wb,stub_export_include=orbsvcs/Event/event_export.h -Wb,skel_export_macro=TAO_RTEvent_Skel_Export -Wb,skel_export_include=orbsvcs/Event/event_skel_export.h "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Release"
SOURCE="RtecDefaultEventData.idl"

InputPath=RtecDefaultEventData.idl

"RtecDefaultEventDataC.inl" "RtecDefaultEventDataC.h" "RtecDefaultEventDataC.cpp" "RtecDefaultEventDataS_T.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-RtecDefaultEventData_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GT -Wb,stub_export_macro=TAO_RTEvent_Export -Wb,stub_export_include=orbsvcs/Event/event_export.h -Wb,skel_export_macro=TAO_RTEvent_Skel_Export -Wb,skel_export_include=orbsvcs/Event/event_skel_export.h "$(InputPath)"
<<

SOURCE="RtecEventComm.idl"

InputPath=RtecEventComm.idl

"RtecEventCommC.inl" "RtecEventCommC.h" "RtecEventCommC.cpp" "RtecEventCommS_T.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-RtecEventComm_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GT -Wb,stub_export_macro=TAO_RTEvent_Export -Wb,stub_export_include=orbsvcs/Event/event_export.h -Wb,skel_export_macro=TAO_RTEvent_Skel_Export -Wb,skel_export_include=orbsvcs/Event/event_skel_export.h "$(InputPath)"
<<

SOURCE="RtecEventChannelAdmin.idl"

InputPath=RtecEventChannelAdmin.idl

"RtecEventChannelAdminC.inl" "RtecEventChannelAdminC.h" "RtecEventChannelAdminC.cpp" "RtecEventChannelAdminS_T.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-RtecEventChannelAdmin_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GT -Wb,stub_export_macro=TAO_RTEvent_Export -Wb,stub_export_include=orbsvcs/Event/event_export.h -Wb,skel_export_macro=TAO_RTEvent_Skel_Export -Wb,skel_export_include=orbsvcs/Event/event_skel_export.h "$(InputPath)"
<<

SOURCE="RtecUDPAdmin.idl"

InputPath=RtecUDPAdmin.idl

"RtecUDPAdminC.inl" "RtecUDPAdminC.h" "RtecUDPAdminC.cpp" "RtecUDPAdminS_T.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-RtecUDPAdmin_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GT -Wb,stub_export_macro=TAO_RTEvent_Export -Wb,stub_export_include=orbsvcs/Event/event_export.h -Wb,skel_export_macro=TAO_RTEvent_Skel_Export -Wb,skel_export_include=orbsvcs/Event/event_skel_export.h "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Debug"
SOURCE="RtecDefaultEventData.idl"

InputPath=RtecDefaultEventData.idl

"RtecDefaultEventDataC.inl" "RtecDefaultEventDataC.h" "RtecDefaultEventDataC.cpp" "RtecDefaultEventDataS_T.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-RtecDefaultEventData_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GT -Wb,stub_export_macro=TAO_RTEvent_Export -Wb,stub_export_include=orbsvcs/Event/event_export.h -Wb,skel_export_macro=TAO_RTEvent_Skel_Export -Wb,skel_export_include=orbsvcs/Event/event_skel_export.h "$(InputPath)"
<<

SOURCE="RtecEventComm.idl"

InputPath=RtecEventComm.idl

"RtecEventCommC.inl" "RtecEventCommC.h" "RtecEventCommC.cpp" "RtecEventCommS_T.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-RtecEventComm_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GT -Wb,stub_export_macro=TAO_RTEvent_Export -Wb,stub_export_include=orbsvcs/Event/event_export.h -Wb,skel_export_macro=TAO_RTEvent_Skel_Export -Wb,skel_export_include=orbsvcs/Event/event_skel_export.h "$(InputPath)"
<<

SOURCE="RtecEventChannelAdmin.idl"

InputPath=RtecEventChannelAdmin.idl

"RtecEventChannelAdminC.inl" "RtecEventChannelAdminC.h" "RtecEventChannelAdminC.cpp" "RtecEventChannelAdminS_T.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-RtecEventChannelAdmin_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GT -Wb,stub_export_macro=TAO_RTEvent_Export -Wb,stub_export_include=orbsvcs/Event/event_export.h -Wb,skel_export_macro=TAO_RTEvent_Skel_Export -Wb,skel_export_include=orbsvcs/Event/event_skel_export.h "$(InputPath)"
<<

SOURCE="RtecUDPAdmin.idl"

InputPath=RtecUDPAdmin.idl

"RtecUDPAdminC.inl" "RtecUDPAdminC.h" "RtecUDPAdminC.cpp" "RtecUDPAdminS_T.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-RtecUDPAdmin_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GT -Wb,stub_export_macro=TAO_RTEvent_Export -Wb,stub_export_include=orbsvcs/Event/event_export.h -Wb,skel_export_macro=TAO_RTEvent_Skel_Export -Wb,skel_export_include=orbsvcs/Event/event_skel_export.h "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Release"
SOURCE="RtecDefaultEventData.idl"

InputPath=RtecDefaultEventData.idl

"RtecDefaultEventDataC.inl" "RtecDefaultEventDataC.h" "RtecDefaultEventDataC.cpp" "RtecDefaultEventDataS_T.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-RtecDefaultEventData_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GT -Wb,stub_export_macro=TAO_RTEvent_Export -Wb,stub_export_include=orbsvcs/Event/event_export.h -Wb,skel_export_macro=TAO_RTEvent_Skel_Export -Wb,skel_export_include=orbsvcs/Event/event_skel_export.h "$(InputPath)"
<<

SOURCE="RtecEventComm.idl"

InputPath=RtecEventComm.idl

"RtecEventCommC.inl" "RtecEventCommC.h" "RtecEventCommC.cpp" "RtecEventCommS_T.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-RtecEventComm_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GT -Wb,stub_export_macro=TAO_RTEvent_Export -Wb,stub_export_include=orbsvcs/Event/event_export.h -Wb,skel_export_macro=TAO_RTEvent_Skel_Export -Wb,skel_export_include=orbsvcs/Event/event_skel_export.h "$(InputPath)"
<<

SOURCE="RtecEventChannelAdmin.idl"

InputPath=RtecEventChannelAdmin.idl

"RtecEventChannelAdminC.inl" "RtecEventChannelAdminC.h" "RtecEventChannelAdminC.cpp" "RtecEventChannelAdminS_T.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-RtecEventChannelAdmin_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GT -Wb,stub_export_macro=TAO_RTEvent_Export -Wb,stub_export_include=orbsvcs/Event/event_export.h -Wb,skel_export_macro=TAO_RTEvent_Skel_Export -Wb,skel_export_include=orbsvcs/Event/event_skel_export.h "$(InputPath)"
<<

SOURCE="RtecUDPAdmin.idl"

InputPath=RtecUDPAdmin.idl

"RtecUDPAdminC.inl" "RtecUDPAdminC.h" "RtecUDPAdminC.cpp" "RtecUDPAdminS_T.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-RtecUDPAdmin_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GT -Wb,stub_export_macro=TAO_RTEvent_Export -Wb,stub_export_include=orbsvcs/Event/event_export.h -Wb,skel_export_macro=TAO_RTEvent_Skel_Export -Wb,skel_export_include=orbsvcs/Event/event_skel_export.h "$(InputPath)"
<<

!ENDIF

SOURCE="RTEvent.rc"

"$(INTDIR)\RTEvent.res" : $(SOURCE)
	$(RSC) /l 0x409 /fo"$(INTDIR)\RTEvent.res" /d NDEBUG /d WIN64 /d _CRT_SECURE_NO_WARNINGS /d _CRT_SECURE_NO_DEPRECATE /d _CRT_NONSTDC_NO_DEPRECATE /i "..\..\.." /i "..\.." /i "..\..\orbsvcs" $(SOURCE)



!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.RTEvent.dep")
	@echo Using "Makefile.RTEvent.dep"
!ELSE
	@echo Warning: cannot find "Makefile.RTEvent.dep"
!ENDIF
!ENDIF

