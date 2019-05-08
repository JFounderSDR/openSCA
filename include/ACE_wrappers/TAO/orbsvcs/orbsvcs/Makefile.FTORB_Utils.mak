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
!MESSAGE NMAKE /f "Makefile.FTORB_Utils.mak" CFG="Win64 Debug"
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

GENERATED_DIRTY = "FT_CORBA_ORBC.inl" "FT_CORBA_ORBS.inl" "FT_CORBA_ORBC.h" "FT_CORBA_ORBS.h" "FT_CORBA_ORBC.cpp" "FT_CORBA_ORBS.cpp"

!IF  "$(CFG)" == "Win64 Debug"

OUTDIR=..\..\..\lib
INTDIR=Debug\FTORB_Utils\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_FTORB_Utilsd.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_FT_ORB_UTILS_BUILD_DLL -f "Makefile.FTORB_Utils.dep" "FT_CORBA_ORBC.cpp" "FT_CORBA_ORBS.cpp" "FaultTolerance\FT_IOGR_Property.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_FTORB_Utilsd.pdb"
	-@del /f/q "..\..\..\lib\TAO_FTORB_Utilsd.dll"
	-@del /f/q "$(OUTDIR)\TAO_FTORB_Utilsd.lib"
	-@del /f/q "$(OUTDIR)\TAO_FTORB_Utilsd.exp"
	-@del /f/q "$(OUTDIR)\TAO_FTORB_Utilsd.ilk"
	-@del /f/q "FT_CORBA_ORBC.inl"
	-@del /f/q "FT_CORBA_ORBS.inl"
	-@del /f/q "FT_CORBA_ORBC.h"
	-@del /f/q "FT_CORBA_ORBS.h"
	-@del /f/q "FT_CORBA_ORBC.cpp"
	-@del /f/q "FT_CORBA_ORBS.cpp"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\FTORB_Utils\$(NULL)" mkdir "Debug\FTORB_Utils"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_FT_ORB_UTILS_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_IORManipd.lib TAO_PortableServerd.lib TAO_CosNamingd.lib TAO_Valuetyped.lib TAO_CodecFactoryd.lib TAO_PId.lib TAO_Messagingd.lib TAO_PortableGroupd.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\..\lib\TAO_FTORB_Utilsd.pdb" /machine:IA64 /out:"..\..\..\lib\TAO_FTORB_Utilsd.dll" /implib:"$(OUTDIR)\TAO_FTORB_Utilsd.lib"
LINK32_OBJS= \
	"$(INTDIR)\FT_CORBA_ORBC.obj" \
	"$(INTDIR)\FT_CORBA_ORBS.obj" \
	"$(INTDIR)\FaultTolerance\FT_IOGR_Property.obj"

"..\..\..\lib\TAO_FTORB_Utilsd.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_FTORB_Utilsd.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_FTORB_Utilsd.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\FTORB_Utils\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_FTORB_Utils.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_FT_ORB_UTILS_BUILD_DLL -f "Makefile.FTORB_Utils.dep" "FT_CORBA_ORBC.cpp" "FT_CORBA_ORBS.cpp" "FaultTolerance\FT_IOGR_Property.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\TAO_FTORB_Utils.dll"
	-@del /f/q "$(OUTDIR)\TAO_FTORB_Utils.lib"
	-@del /f/q "$(OUTDIR)\TAO_FTORB_Utils.exp"
	-@del /f/q "$(OUTDIR)\TAO_FTORB_Utils.ilk"
	-@del /f/q "FT_CORBA_ORBC.inl"
	-@del /f/q "FT_CORBA_ORBS.inl"
	-@del /f/q "FT_CORBA_ORBC.h"
	-@del /f/q "FT_CORBA_ORBS.h"
	-@del /f/q "FT_CORBA_ORBC.cpp"
	-@del /f/q "FT_CORBA_ORBS.cpp"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\FTORB_Utils\$(NULL)" mkdir "Release\FTORB_Utils"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_FT_ORB_UTILS_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_IORManip.lib TAO_PortableServer.lib TAO_CosNaming.lib TAO_Valuetype.lib TAO_CodecFactory.lib TAO_PI.lib TAO_Messaging.lib TAO_PortableGroup.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\..\lib\TAO_FTORB_Utils.dll" /implib:"$(OUTDIR)\TAO_FTORB_Utils.lib"
LINK32_OBJS= \
	"$(INTDIR)\FT_CORBA_ORBC.obj" \
	"$(INTDIR)\FT_CORBA_ORBS.obj" \
	"$(INTDIR)\FaultTolerance\FT_IOGR_Property.obj"

"..\..\..\lib\TAO_FTORB_Utils.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_FTORB_Utils.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_FTORB_Utils.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\FTORB_Utils\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_FTORB_Utilssd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.FTORB_Utils.dep" "FT_CORBA_ORBC.cpp" "FT_CORBA_ORBS.cpp" "FaultTolerance\FT_IOGR_Property.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_FTORB_Utilssd.lib"
	-@del /f/q "$(OUTDIR)\TAO_FTORB_Utilssd.exp"
	-@del /f/q "$(OUTDIR)\TAO_FTORB_Utilssd.ilk"
	-@del /f/q "..\..\..\lib\TAO_FTORB_Utilssd.pdb"
	-@del /f/q "FT_CORBA_ORBC.inl"
	-@del /f/q "FT_CORBA_ORBS.inl"
	-@del /f/q "FT_CORBA_ORBC.h"
	-@del /f/q "FT_CORBA_ORBS.h"
	-@del /f/q "FT_CORBA_ORBC.cpp"
	-@del /f/q "FT_CORBA_ORBS.cpp"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\FTORB_Utils\$(NULL)" mkdir "Static_Debug\FTORB_Utils"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\TAO_FTORB_Utilssd.pdb" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_FTORB_Utilssd.lib"
LINK32_OBJS= \
	"$(INTDIR)\FT_CORBA_ORBC.obj" \
	"$(INTDIR)\FT_CORBA_ORBS.obj" \
	"$(INTDIR)\FaultTolerance\FT_IOGR_Property.obj"

"$(OUTDIR)\TAO_FTORB_Utilssd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_FTORB_Utilssd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_FTORB_Utilssd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\FTORB_Utils\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_FTORB_Utilss.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.FTORB_Utils.dep" "FT_CORBA_ORBC.cpp" "FT_CORBA_ORBS.cpp" "FaultTolerance\FT_IOGR_Property.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_FTORB_Utilss.lib"
	-@del /f/q "$(OUTDIR)\TAO_FTORB_Utilss.exp"
	-@del /f/q "$(OUTDIR)\TAO_FTORB_Utilss.ilk"
	-@del /f/q "FT_CORBA_ORBC.inl"
	-@del /f/q "FT_CORBA_ORBS.inl"
	-@del /f/q "FT_CORBA_ORBC.h"
	-@del /f/q "FT_CORBA_ORBS.h"
	-@del /f/q "FT_CORBA_ORBC.cpp"
	-@del /f/q "FT_CORBA_ORBS.cpp"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\FTORB_Utils\$(NULL)" mkdir "Static_Release\FTORB_Utils"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_FTORB_Utilss.lib"
LINK32_OBJS= \
	"$(INTDIR)\FT_CORBA_ORBC.obj" \
	"$(INTDIR)\FT_CORBA_ORBS.obj" \
	"$(INTDIR)\FaultTolerance\FT_IOGR_Property.obj"

"$(OUTDIR)\TAO_FTORB_Utilss.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_FTORB_Utilss.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_FTORB_Utilss.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.FTORB_Utils.dep")
!INCLUDE "Makefile.FTORB_Utils.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="FT_CORBA_ORBC.cpp"

"$(INTDIR)\FT_CORBA_ORBC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FT_CORBA_ORBC.obj" $(SOURCE)

SOURCE="FT_CORBA_ORBS.cpp"

"$(INTDIR)\FT_CORBA_ORBS.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FT_CORBA_ORBS.obj" $(SOURCE)

SOURCE="FaultTolerance\FT_IOGR_Property.cpp"

"$(INTDIR)\FaultTolerance\FT_IOGR_Property.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\FaultTolerance\$(NULL)" mkdir "$(INTDIR)\FaultTolerance\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FaultTolerance\FT_IOGR_Property.obj" $(SOURCE)

!IF  "$(CFG)" == "Win64 Debug"
SOURCE="FT_CORBA_ORB.idl"

InputPath=FT_CORBA_ORB.idl

"FT_CORBA_ORBC.inl" "FT_CORBA_ORBS.inl" "FT_CORBA_ORBC.h" "FT_CORBA_ORBS.h" "FT_CORBA_ORBC.cpp" "FT_CORBA_ORBS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-FT_CORBA_ORB_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,skel_export_include=tao/PortableServer/PolicyS.h -Wb,export_macro=TAO_FT_ORB_Utils_Export -Wb,export_include=orbsvcs/FaultTolerance/FT_ORB_Utils_export.h "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Release"
SOURCE="FT_CORBA_ORB.idl"

InputPath=FT_CORBA_ORB.idl

"FT_CORBA_ORBC.inl" "FT_CORBA_ORBS.inl" "FT_CORBA_ORBC.h" "FT_CORBA_ORBS.h" "FT_CORBA_ORBC.cpp" "FT_CORBA_ORBS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-FT_CORBA_ORB_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,skel_export_include=tao/PortableServer/PolicyS.h -Wb,export_macro=TAO_FT_ORB_Utils_Export -Wb,export_include=orbsvcs/FaultTolerance/FT_ORB_Utils_export.h "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Debug"
SOURCE="FT_CORBA_ORB.idl"

InputPath=FT_CORBA_ORB.idl

"FT_CORBA_ORBC.inl" "FT_CORBA_ORBS.inl" "FT_CORBA_ORBC.h" "FT_CORBA_ORBS.h" "FT_CORBA_ORBC.cpp" "FT_CORBA_ORBS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-FT_CORBA_ORB_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,skel_export_include=tao/PortableServer/PolicyS.h -Wb,export_macro=TAO_FT_ORB_Utils_Export -Wb,export_include=orbsvcs/FaultTolerance/FT_ORB_Utils_export.h "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Release"
SOURCE="FT_CORBA_ORB.idl"

InputPath=FT_CORBA_ORB.idl

"FT_CORBA_ORBC.inl" "FT_CORBA_ORBS.inl" "FT_CORBA_ORBC.h" "FT_CORBA_ORBS.h" "FT_CORBA_ORBC.cpp" "FT_CORBA_ORBS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-FT_CORBA_ORB_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,skel_export_include=tao/PortableServer/PolicyS.h -Wb,export_macro=TAO_FT_ORB_Utils_Export -Wb,export_include=orbsvcs/FaultTolerance/FT_ORB_Utils_export.h "$(InputPath)"
<<

!ENDIF


!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.FTORB_Utils.dep")
	@echo Using "Makefile.FTORB_Utils.dep"
!ELSE
	@echo Warning: cannot find "Makefile.FTORB_Utils.dep"
!ENDIF
!ENDIF

