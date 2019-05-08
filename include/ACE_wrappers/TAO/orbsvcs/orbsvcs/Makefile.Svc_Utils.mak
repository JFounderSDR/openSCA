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
!MESSAGE NMAKE /f "Makefile.Svc_Utils.mak" CFG="Win64 Debug"
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

GENERATED_DIRTY = "TimeBaseC.inl" "TimeBaseS.inl" "TimeBaseC.h" "TimeBaseS.h" "TimeBaseC.cpp" "TimeBaseS.cpp" "RtecBaseC.inl" "RtecBaseS.inl" "RtecBaseC.h" "RtecBaseS.h" "RtecBaseC.cpp" "RtecBaseS.cpp"

!IF  "$(CFG)" == "Win64 Debug"

OUTDIR=..\..\..\lib
INTDIR=Debug\Svc_Utils\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_Svc_Utilsd.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_SVC_UTILS_BUILD_DLL -f "Makefile.Svc_Utils.dep" "TimeBaseC.cpp" "TimeBaseS.cpp" "RtecBaseC.cpp" "RtecBaseS.cpp" "Shutdown_Utilities.cpp" "Time_Utilities.cpp" "IOR_Multicast.cpp" "Daemon_Utilities.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_Svc_Utilsd.pdb"
	-@del /f/q "..\..\..\lib\TAO_Svc_Utilsd.dll"
	-@del /f/q "$(OUTDIR)\TAO_Svc_Utilsd.lib"
	-@del /f/q "$(OUTDIR)\TAO_Svc_Utilsd.exp"
	-@del /f/q "$(OUTDIR)\TAO_Svc_Utilsd.ilk"
	-@del /f/q "TimeBaseC.inl"
	-@del /f/q "TimeBaseS.inl"
	-@del /f/q "TimeBaseC.h"
	-@del /f/q "TimeBaseS.h"
	-@del /f/q "TimeBaseC.cpp"
	-@del /f/q "TimeBaseS.cpp"
	-@del /f/q "RtecBaseC.inl"
	-@del /f/q "RtecBaseS.inl"
	-@del /f/q "RtecBaseC.h"
	-@del /f/q "RtecBaseS.h"
	-@del /f/q "RtecBaseC.cpp"
	-@del /f/q "RtecBaseS.cpp"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\Svc_Utils\$(NULL)" mkdir "Debug\Svc_Utils"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_SVC_UTILS_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_PortableServerd.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\..\lib\TAO_Svc_Utilsd.pdb" /machine:IA64 /out:"..\..\..\lib\TAO_Svc_Utilsd.dll" /implib:"$(OUTDIR)\TAO_Svc_Utilsd.lib"
LINK32_OBJS= \
	"$(INTDIR)\Svc_Utils.res" \
	"$(INTDIR)\TimeBaseC.obj" \
	"$(INTDIR)\TimeBaseS.obj" \
	"$(INTDIR)\RtecBaseC.obj" \
	"$(INTDIR)\RtecBaseS.obj" \
	"$(INTDIR)\Shutdown_Utilities.obj" \
	"$(INTDIR)\Time_Utilities.obj" \
	"$(INTDIR)\IOR_Multicast.obj" \
	"$(INTDIR)\Daemon_Utilities.obj"

"..\..\..\lib\TAO_Svc_Utilsd.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_Svc_Utilsd.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_Svc_Utilsd.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\Svc_Utils\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_Svc_Utils.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_SVC_UTILS_BUILD_DLL -f "Makefile.Svc_Utils.dep" "TimeBaseC.cpp" "TimeBaseS.cpp" "RtecBaseC.cpp" "RtecBaseS.cpp" "Shutdown_Utilities.cpp" "Time_Utilities.cpp" "IOR_Multicast.cpp" "Daemon_Utilities.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\TAO_Svc_Utils.dll"
	-@del /f/q "$(OUTDIR)\TAO_Svc_Utils.lib"
	-@del /f/q "$(OUTDIR)\TAO_Svc_Utils.exp"
	-@del /f/q "$(OUTDIR)\TAO_Svc_Utils.ilk"
	-@del /f/q "TimeBaseC.inl"
	-@del /f/q "TimeBaseS.inl"
	-@del /f/q "TimeBaseC.h"
	-@del /f/q "TimeBaseS.h"
	-@del /f/q "TimeBaseC.cpp"
	-@del /f/q "TimeBaseS.cpp"
	-@del /f/q "RtecBaseC.inl"
	-@del /f/q "RtecBaseS.inl"
	-@del /f/q "RtecBaseC.h"
	-@del /f/q "RtecBaseS.h"
	-@del /f/q "RtecBaseC.cpp"
	-@del /f/q "RtecBaseS.cpp"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\Svc_Utils\$(NULL)" mkdir "Release\Svc_Utils"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_SVC_UTILS_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_PortableServer.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\..\lib\TAO_Svc_Utils.dll" /implib:"$(OUTDIR)\TAO_Svc_Utils.lib"
LINK32_OBJS= \
	"$(INTDIR)\Svc_Utils.res" \
	"$(INTDIR)\TimeBaseC.obj" \
	"$(INTDIR)\TimeBaseS.obj" \
	"$(INTDIR)\RtecBaseC.obj" \
	"$(INTDIR)\RtecBaseS.obj" \
	"$(INTDIR)\Shutdown_Utilities.obj" \
	"$(INTDIR)\Time_Utilities.obj" \
	"$(INTDIR)\IOR_Multicast.obj" \
	"$(INTDIR)\Daemon_Utilities.obj"

"..\..\..\lib\TAO_Svc_Utils.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_Svc_Utils.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_Svc_Utils.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\Svc_Utils\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_Svc_Utilssd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.Svc_Utils.dep" "TimeBaseC.cpp" "TimeBaseS.cpp" "RtecBaseC.cpp" "RtecBaseS.cpp" "Shutdown_Utilities.cpp" "Time_Utilities.cpp" "IOR_Multicast.cpp" "Daemon_Utilities.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_Svc_Utilssd.lib"
	-@del /f/q "$(OUTDIR)\TAO_Svc_Utilssd.exp"
	-@del /f/q "$(OUTDIR)\TAO_Svc_Utilssd.ilk"
	-@del /f/q "..\..\..\lib\TAO_Svc_Utilssd.pdb"
	-@del /f/q "TimeBaseC.inl"
	-@del /f/q "TimeBaseS.inl"
	-@del /f/q "TimeBaseC.h"
	-@del /f/q "TimeBaseS.h"
	-@del /f/q "TimeBaseC.cpp"
	-@del /f/q "TimeBaseS.cpp"
	-@del /f/q "RtecBaseC.inl"
	-@del /f/q "RtecBaseS.inl"
	-@del /f/q "RtecBaseC.h"
	-@del /f/q "RtecBaseS.h"
	-@del /f/q "RtecBaseC.cpp"
	-@del /f/q "RtecBaseS.cpp"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\Svc_Utils\$(NULL)" mkdir "Static_Debug\Svc_Utils"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\TAO_Svc_Utilssd.pdb" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_Svc_Utilssd.lib"
LINK32_OBJS= \
	"$(INTDIR)\TimeBaseC.obj" \
	"$(INTDIR)\TimeBaseS.obj" \
	"$(INTDIR)\RtecBaseC.obj" \
	"$(INTDIR)\RtecBaseS.obj" \
	"$(INTDIR)\Shutdown_Utilities.obj" \
	"$(INTDIR)\Time_Utilities.obj" \
	"$(INTDIR)\IOR_Multicast.obj" \
	"$(INTDIR)\Daemon_Utilities.obj"

"$(OUTDIR)\TAO_Svc_Utilssd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_Svc_Utilssd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_Svc_Utilssd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\Svc_Utils\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_Svc_Utilss.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.Svc_Utils.dep" "TimeBaseC.cpp" "TimeBaseS.cpp" "RtecBaseC.cpp" "RtecBaseS.cpp" "Shutdown_Utilities.cpp" "Time_Utilities.cpp" "IOR_Multicast.cpp" "Daemon_Utilities.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_Svc_Utilss.lib"
	-@del /f/q "$(OUTDIR)\TAO_Svc_Utilss.exp"
	-@del /f/q "$(OUTDIR)\TAO_Svc_Utilss.ilk"
	-@del /f/q "TimeBaseC.inl"
	-@del /f/q "TimeBaseS.inl"
	-@del /f/q "TimeBaseC.h"
	-@del /f/q "TimeBaseS.h"
	-@del /f/q "TimeBaseC.cpp"
	-@del /f/q "TimeBaseS.cpp"
	-@del /f/q "RtecBaseC.inl"
	-@del /f/q "RtecBaseS.inl"
	-@del /f/q "RtecBaseC.h"
	-@del /f/q "RtecBaseS.h"
	-@del /f/q "RtecBaseC.cpp"
	-@del /f/q "RtecBaseS.cpp"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\Svc_Utils\$(NULL)" mkdir "Static_Release\Svc_Utils"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_Svc_Utilss.lib"
LINK32_OBJS= \
	"$(INTDIR)\TimeBaseC.obj" \
	"$(INTDIR)\TimeBaseS.obj" \
	"$(INTDIR)\RtecBaseC.obj" \
	"$(INTDIR)\RtecBaseS.obj" \
	"$(INTDIR)\Shutdown_Utilities.obj" \
	"$(INTDIR)\Time_Utilities.obj" \
	"$(INTDIR)\IOR_Multicast.obj" \
	"$(INTDIR)\Daemon_Utilities.obj"

"$(OUTDIR)\TAO_Svc_Utilss.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_Svc_Utilss.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_Svc_Utilss.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.Svc_Utils.dep")
!INCLUDE "Makefile.Svc_Utils.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="TimeBaseC.cpp"

"$(INTDIR)\TimeBaseC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\TimeBaseC.obj" $(SOURCE)

SOURCE="TimeBaseS.cpp"

"$(INTDIR)\TimeBaseS.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\TimeBaseS.obj" $(SOURCE)

SOURCE="RtecBaseC.cpp"

"$(INTDIR)\RtecBaseC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RtecBaseC.obj" $(SOURCE)

SOURCE="RtecBaseS.cpp"

"$(INTDIR)\RtecBaseS.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RtecBaseS.obj" $(SOURCE)

SOURCE="Shutdown_Utilities.cpp"

"$(INTDIR)\Shutdown_Utilities.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Shutdown_Utilities.obj" $(SOURCE)

SOURCE="Time_Utilities.cpp"

"$(INTDIR)\Time_Utilities.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Time_Utilities.obj" $(SOURCE)

SOURCE="IOR_Multicast.cpp"

"$(INTDIR)\IOR_Multicast.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IOR_Multicast.obj" $(SOURCE)

SOURCE="Daemon_Utilities.cpp"

"$(INTDIR)\Daemon_Utilities.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Daemon_Utilities.obj" $(SOURCE)

!IF  "$(CFG)" == "Win64 Debug"
SOURCE="TimeBase.idl"

InputPath=TimeBase.idl

"TimeBaseC.inl" "TimeBaseS.inl" "TimeBaseC.h" "TimeBaseS.h" "TimeBaseC.cpp" "TimeBaseS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-TimeBase_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_Svc_Utils_Export -Wb,export_include=orbsvcs/svc_utils_export.h "$(InputPath)"
<<

SOURCE="RtecBase.idl"

InputPath=RtecBase.idl

"RtecBaseC.inl" "RtecBaseS.inl" "RtecBaseC.h" "RtecBaseS.h" "RtecBaseC.cpp" "RtecBaseS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-RtecBase_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_Svc_Utils_Export -Wb,export_include=orbsvcs/svc_utils_export.h "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Release"
SOURCE="TimeBase.idl"

InputPath=TimeBase.idl

"TimeBaseC.inl" "TimeBaseS.inl" "TimeBaseC.h" "TimeBaseS.h" "TimeBaseC.cpp" "TimeBaseS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-TimeBase_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_Svc_Utils_Export -Wb,export_include=orbsvcs/svc_utils_export.h "$(InputPath)"
<<

SOURCE="RtecBase.idl"

InputPath=RtecBase.idl

"RtecBaseC.inl" "RtecBaseS.inl" "RtecBaseC.h" "RtecBaseS.h" "RtecBaseC.cpp" "RtecBaseS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-RtecBase_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_Svc_Utils_Export -Wb,export_include=orbsvcs/svc_utils_export.h "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Debug"
SOURCE="TimeBase.idl"

InputPath=TimeBase.idl

"TimeBaseC.inl" "TimeBaseS.inl" "TimeBaseC.h" "TimeBaseS.h" "TimeBaseC.cpp" "TimeBaseS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-TimeBase_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_Svc_Utils_Export -Wb,export_include=orbsvcs/svc_utils_export.h "$(InputPath)"
<<

SOURCE="RtecBase.idl"

InputPath=RtecBase.idl

"RtecBaseC.inl" "RtecBaseS.inl" "RtecBaseC.h" "RtecBaseS.h" "RtecBaseC.cpp" "RtecBaseS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-RtecBase_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_Svc_Utils_Export -Wb,export_include=orbsvcs/svc_utils_export.h "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Release"
SOURCE="TimeBase.idl"

InputPath=TimeBase.idl

"TimeBaseC.inl" "TimeBaseS.inl" "TimeBaseC.h" "TimeBaseS.h" "TimeBaseC.cpp" "TimeBaseS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-TimeBase_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_Svc_Utils_Export -Wb,export_include=orbsvcs/svc_utils_export.h "$(InputPath)"
<<

SOURCE="RtecBase.idl"

InputPath=RtecBase.idl

"RtecBaseC.inl" "RtecBaseS.inl" "RtecBaseC.h" "RtecBaseS.h" "RtecBaseC.cpp" "RtecBaseS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-RtecBase_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_Svc_Utils_Export -Wb,export_include=orbsvcs/svc_utils_export.h "$(InputPath)"
<<

!ENDIF

SOURCE="Svc_Utils.rc"

"$(INTDIR)\Svc_Utils.res" : $(SOURCE)
	$(RSC) /l 0x409 /fo"$(INTDIR)\Svc_Utils.res" /d NDEBUG /d WIN64 /d _CRT_SECURE_NO_WARNINGS /d _CRT_SECURE_NO_DEPRECATE /d _CRT_NONSTDC_NO_DEPRECATE /i "..\..\.." /i "..\.." /i "..\..\orbsvcs" $(SOURCE)



!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.Svc_Utils.dep")
	@echo Using "Makefile.Svc_Utils.dep"
!ELSE
	@echo Warning: cannot find "Makefile.Svc_Utils.dep"
!ENDIF
!ENDIF

