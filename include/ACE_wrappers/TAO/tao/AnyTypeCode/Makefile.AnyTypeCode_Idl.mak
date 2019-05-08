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
!MESSAGE NMAKE /f "Makefile.AnyTypeCode_Idl.mak" CFG="Win64 Debug"
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

GENERATED_DIRTY = "AnySeqC.h" "AnySeqS.h" "AnySeqA.h" "AnySeqC.cpp" "AnySeqA.cpp" "Dynamic_ParameterC.h" "Dynamic_ParameterS.h" "Dynamic_ParameterA.h" "Dynamic_ParameterC.cpp" "Dynamic_ParameterA.cpp" "ValueModifierC.h" "ValueModifierS.h" "ValueModifierA.h" "ValueModifierC.cpp" "ValueModifierA.cpp" "VisibilityC.h" "VisibilityS.h" "VisibilityA.h" "VisibilityC.cpp" "VisibilityA.cpp" "DynamicC.h" "DynamicS.h" "DynamicA.h" "DynamicC.cpp" "DynamicA.cpp" "BoundsC.h" "BoundsS.h" "BoundsA.h" "BoundsC.cpp" "BoundsA.cpp"

!IF  "$(CFG)" == "Win64 Debug"

OUTDIR=.
INTDIR=Debug\AnyTypeCode_Idl\IA64

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
	-@del /f/q "AnySeqC.h"
	-@del /f/q "AnySeqS.h"
	-@del /f/q "AnySeqA.h"
	-@del /f/q "AnySeqC.cpp"
	-@del /f/q "AnySeqA.cpp"
	-@del /f/q "Dynamic_ParameterC.h"
	-@del /f/q "Dynamic_ParameterS.h"
	-@del /f/q "Dynamic_ParameterA.h"
	-@del /f/q "Dynamic_ParameterC.cpp"
	-@del /f/q "Dynamic_ParameterA.cpp"
	-@del /f/q "ValueModifierC.h"
	-@del /f/q "ValueModifierS.h"
	-@del /f/q "ValueModifierA.h"
	-@del /f/q "ValueModifierC.cpp"
	-@del /f/q "ValueModifierA.cpp"
	-@del /f/q "VisibilityC.h"
	-@del /f/q "VisibilityS.h"
	-@del /f/q "VisibilityA.h"
	-@del /f/q "VisibilityC.cpp"
	-@del /f/q "VisibilityA.cpp"
	-@del /f/q "DynamicC.h"
	-@del /f/q "DynamicS.h"
	-@del /f/q "DynamicA.h"
	-@del /f/q "DynamicC.cpp"
	-@del /f/q "DynamicA.cpp"
	-@del /f/q "BoundsC.h"
	-@del /f/q "BoundsS.h"
	-@del /f/q "BoundsA.h"
	-@del /f/q "BoundsC.cpp"
	-@del /f/q "BoundsA.cpp"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\AnyTypeCode_Idl\$(NULL)" mkdir "Debug\AnyTypeCode_Idl"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /Fd"$(INTDIR)/" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe


!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=.
INTDIR=Release\AnyTypeCode_Idl\IA64

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
	-@del /f/q "AnySeqC.h"
	-@del /f/q "AnySeqS.h"
	-@del /f/q "AnySeqA.h"
	-@del /f/q "AnySeqC.cpp"
	-@del /f/q "AnySeqA.cpp"
	-@del /f/q "Dynamic_ParameterC.h"
	-@del /f/q "Dynamic_ParameterS.h"
	-@del /f/q "Dynamic_ParameterA.h"
	-@del /f/q "Dynamic_ParameterC.cpp"
	-@del /f/q "Dynamic_ParameterA.cpp"
	-@del /f/q "ValueModifierC.h"
	-@del /f/q "ValueModifierS.h"
	-@del /f/q "ValueModifierA.h"
	-@del /f/q "ValueModifierC.cpp"
	-@del /f/q "ValueModifierA.cpp"
	-@del /f/q "VisibilityC.h"
	-@del /f/q "VisibilityS.h"
	-@del /f/q "VisibilityA.h"
	-@del /f/q "VisibilityC.cpp"
	-@del /f/q "VisibilityA.cpp"
	-@del /f/q "DynamicC.h"
	-@del /f/q "DynamicS.h"
	-@del /f/q "DynamicA.h"
	-@del /f/q "DynamicC.cpp"
	-@del /f/q "DynamicA.cpp"
	-@del /f/q "BoundsC.h"
	-@del /f/q "BoundsS.h"
	-@del /f/q "BoundsA.h"
	-@del /f/q "BoundsC.cpp"
	-@del /f/q "BoundsA.cpp"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\AnyTypeCode_Idl\$(NULL)" mkdir "Release\AnyTypeCode_Idl"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe


!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=.
INTDIR=Static_Debug\AnyTypeCode_Idl\IA64

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
	-@del /f/q ".\sd.pdb"
	-@del /f/q "AnySeqC.h"
	-@del /f/q "AnySeqS.h"
	-@del /f/q "AnySeqA.h"
	-@del /f/q "AnySeqC.cpp"
	-@del /f/q "AnySeqA.cpp"
	-@del /f/q "Dynamic_ParameterC.h"
	-@del /f/q "Dynamic_ParameterS.h"
	-@del /f/q "Dynamic_ParameterA.h"
	-@del /f/q "Dynamic_ParameterC.cpp"
	-@del /f/q "Dynamic_ParameterA.cpp"
	-@del /f/q "ValueModifierC.h"
	-@del /f/q "ValueModifierS.h"
	-@del /f/q "ValueModifierA.h"
	-@del /f/q "ValueModifierC.cpp"
	-@del /f/q "ValueModifierA.cpp"
	-@del /f/q "VisibilityC.h"
	-@del /f/q "VisibilityS.h"
	-@del /f/q "VisibilityA.h"
	-@del /f/q "VisibilityC.cpp"
	-@del /f/q "VisibilityA.cpp"
	-@del /f/q "DynamicC.h"
	-@del /f/q "DynamicS.h"
	-@del /f/q "DynamicA.h"
	-@del /f/q "DynamicC.cpp"
	-@del /f/q "DynamicA.cpp"
	-@del /f/q "BoundsC.h"
	-@del /f/q "BoundsS.h"
	-@del /f/q "BoundsA.h"
	-@del /f/q "BoundsC.cpp"
	-@del /f/q "BoundsA.cpp"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\AnyTypeCode_Idl\$(NULL)" mkdir "Static_Debug\AnyTypeCode_Idl"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /Fd".\sd.pdb" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"



!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=.
INTDIR=Static_Release\AnyTypeCode_Idl\IA64

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
	-@del /f/q "AnySeqC.h"
	-@del /f/q "AnySeqS.h"
	-@del /f/q "AnySeqA.h"
	-@del /f/q "AnySeqC.cpp"
	-@del /f/q "AnySeqA.cpp"
	-@del /f/q "Dynamic_ParameterC.h"
	-@del /f/q "Dynamic_ParameterS.h"
	-@del /f/q "Dynamic_ParameterA.h"
	-@del /f/q "Dynamic_ParameterC.cpp"
	-@del /f/q "Dynamic_ParameterA.cpp"
	-@del /f/q "ValueModifierC.h"
	-@del /f/q "ValueModifierS.h"
	-@del /f/q "ValueModifierA.h"
	-@del /f/q "ValueModifierC.cpp"
	-@del /f/q "ValueModifierA.cpp"
	-@del /f/q "VisibilityC.h"
	-@del /f/q "VisibilityS.h"
	-@del /f/q "VisibilityA.h"
	-@del /f/q "VisibilityC.cpp"
	-@del /f/q "VisibilityA.cpp"
	-@del /f/q "DynamicC.h"
	-@del /f/q "DynamicS.h"
	-@del /f/q "DynamicA.h"
	-@del /f/q "DynamicC.cpp"
	-@del /f/q "DynamicA.cpp"
	-@del /f/q "BoundsC.h"
	-@del /f/q "BoundsS.h"
	-@del /f/q "BoundsA.h"
	-@del /f/q "BoundsC.cpp"
	-@del /f/q "BoundsA.cpp"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\AnyTypeCode_Idl\$(NULL)" mkdir "Static_Release\AnyTypeCode_Idl"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS  /FD /c

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
!IF EXISTS("Makefile.AnyTypeCode_Idl.dep")
!INCLUDE "Makefile.AnyTypeCode_Idl.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
!IF  "$(CFG)" == "Win64 Debug"
SOURCE="AnySeq.pidl"

InputPath=AnySeq.pidl

"AnySeqC.h" "AnySeqS.h" "AnySeqA.h" "AnySeqC.cpp" "AnySeqA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-AnySeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -GA -Wb,export_macro=TAO_AnyTypeCode_Export -Wb,export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -iC tao/AnyTypeCode -Sorb "$(InputPath)"
<<

SOURCE="Dynamic_Parameter.pidl"

InputPath=Dynamic_Parameter.pidl

"Dynamic_ParameterC.h" "Dynamic_ParameterS.h" "Dynamic_ParameterA.h" "Dynamic_ParameterC.cpp" "Dynamic_ParameterA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-Dynamic_Parameter_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -GA -Wb,export_macro=TAO_AnyTypeCode_Export -Wb,export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -iC tao/AnyTypeCode -Sorb "$(InputPath)"
<<

SOURCE="ValueModifier.pidl"

InputPath=ValueModifier.pidl

"ValueModifierC.h" "ValueModifierS.h" "ValueModifierA.h" "ValueModifierC.cpp" "ValueModifierA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-ValueModifier_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -GA -Wb,export_macro=TAO_AnyTypeCode_Export -Wb,export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -iC tao/AnyTypeCode -Sorb "$(InputPath)"
<<

SOURCE="Visibility.pidl"

InputPath=Visibility.pidl

"VisibilityC.h" "VisibilityS.h" "VisibilityA.h" "VisibilityC.cpp" "VisibilityA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-Visibility_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -GA -Wb,export_macro=TAO_AnyTypeCode_Export -Wb,export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -iC tao/AnyTypeCode -Sorb "$(InputPath)"
<<

SOURCE="Dynamic.pidl"

InputPath=Dynamic.pidl

"DynamicC.h" "DynamicS.h" "DynamicA.h" "DynamicC.cpp" "DynamicA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-Dynamic_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -GA -Wb,export_macro=TAO_AnyTypeCode_Export -Wb,export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -iC tao/AnyTypeCode -Sorb "$(InputPath)"
<<

SOURCE="Bounds.pidl"

InputPath=Bounds.pidl

"BoundsC.h" "BoundsS.h" "BoundsA.h" "BoundsC.cpp" "BoundsA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-Bounds_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -GA -Wb,export_macro=TAO_AnyTypeCode_Export -Wb,export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -iC tao/AnyTypeCode "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Release"
SOURCE="AnySeq.pidl"

InputPath=AnySeq.pidl

"AnySeqC.h" "AnySeqS.h" "AnySeqA.h" "AnySeqC.cpp" "AnySeqA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-AnySeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -GA -Wb,export_macro=TAO_AnyTypeCode_Export -Wb,export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -iC tao/AnyTypeCode -Sorb "$(InputPath)"
<<

SOURCE="Dynamic_Parameter.pidl"

InputPath=Dynamic_Parameter.pidl

"Dynamic_ParameterC.h" "Dynamic_ParameterS.h" "Dynamic_ParameterA.h" "Dynamic_ParameterC.cpp" "Dynamic_ParameterA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-Dynamic_Parameter_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -GA -Wb,export_macro=TAO_AnyTypeCode_Export -Wb,export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -iC tao/AnyTypeCode -Sorb "$(InputPath)"
<<

SOURCE="ValueModifier.pidl"

InputPath=ValueModifier.pidl

"ValueModifierC.h" "ValueModifierS.h" "ValueModifierA.h" "ValueModifierC.cpp" "ValueModifierA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-ValueModifier_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -GA -Wb,export_macro=TAO_AnyTypeCode_Export -Wb,export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -iC tao/AnyTypeCode -Sorb "$(InputPath)"
<<

SOURCE="Visibility.pidl"

InputPath=Visibility.pidl

"VisibilityC.h" "VisibilityS.h" "VisibilityA.h" "VisibilityC.cpp" "VisibilityA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-Visibility_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -GA -Wb,export_macro=TAO_AnyTypeCode_Export -Wb,export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -iC tao/AnyTypeCode -Sorb "$(InputPath)"
<<

SOURCE="Dynamic.pidl"

InputPath=Dynamic.pidl

"DynamicC.h" "DynamicS.h" "DynamicA.h" "DynamicC.cpp" "DynamicA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-Dynamic_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -GA -Wb,export_macro=TAO_AnyTypeCode_Export -Wb,export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -iC tao/AnyTypeCode -Sorb "$(InputPath)"
<<

SOURCE="Bounds.pidl"

InputPath=Bounds.pidl

"BoundsC.h" "BoundsS.h" "BoundsA.h" "BoundsC.cpp" "BoundsA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-Bounds_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -GA -Wb,export_macro=TAO_AnyTypeCode_Export -Wb,export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -iC tao/AnyTypeCode "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Debug"
SOURCE="AnySeq.pidl"

InputPath=AnySeq.pidl

"AnySeqC.h" "AnySeqS.h" "AnySeqA.h" "AnySeqC.cpp" "AnySeqA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-AnySeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -GA -Wb,export_macro=TAO_AnyTypeCode_Export -Wb,export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -iC tao/AnyTypeCode -Sorb "$(InputPath)"
<<

SOURCE="Dynamic_Parameter.pidl"

InputPath=Dynamic_Parameter.pidl

"Dynamic_ParameterC.h" "Dynamic_ParameterS.h" "Dynamic_ParameterA.h" "Dynamic_ParameterC.cpp" "Dynamic_ParameterA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-Dynamic_Parameter_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -GA -Wb,export_macro=TAO_AnyTypeCode_Export -Wb,export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -iC tao/AnyTypeCode -Sorb "$(InputPath)"
<<

SOURCE="ValueModifier.pidl"

InputPath=ValueModifier.pidl

"ValueModifierC.h" "ValueModifierS.h" "ValueModifierA.h" "ValueModifierC.cpp" "ValueModifierA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-ValueModifier_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -GA -Wb,export_macro=TAO_AnyTypeCode_Export -Wb,export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -iC tao/AnyTypeCode -Sorb "$(InputPath)"
<<

SOURCE="Visibility.pidl"

InputPath=Visibility.pidl

"VisibilityC.h" "VisibilityS.h" "VisibilityA.h" "VisibilityC.cpp" "VisibilityA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-Visibility_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -GA -Wb,export_macro=TAO_AnyTypeCode_Export -Wb,export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -iC tao/AnyTypeCode -Sorb "$(InputPath)"
<<

SOURCE="Dynamic.pidl"

InputPath=Dynamic.pidl

"DynamicC.h" "DynamicS.h" "DynamicA.h" "DynamicC.cpp" "DynamicA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-Dynamic_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -GA -Wb,export_macro=TAO_AnyTypeCode_Export -Wb,export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -iC tao/AnyTypeCode -Sorb "$(InputPath)"
<<

SOURCE="Bounds.pidl"

InputPath=Bounds.pidl

"BoundsC.h" "BoundsS.h" "BoundsA.h" "BoundsC.cpp" "BoundsA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-Bounds_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -GA -Wb,export_macro=TAO_AnyTypeCode_Export -Wb,export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -iC tao/AnyTypeCode "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Release"
SOURCE="AnySeq.pidl"

InputPath=AnySeq.pidl

"AnySeqC.h" "AnySeqS.h" "AnySeqA.h" "AnySeqC.cpp" "AnySeqA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-AnySeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -GA -Wb,export_macro=TAO_AnyTypeCode_Export -Wb,export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -iC tao/AnyTypeCode -Sorb "$(InputPath)"
<<

SOURCE="Dynamic_Parameter.pidl"

InputPath=Dynamic_Parameter.pidl

"Dynamic_ParameterC.h" "Dynamic_ParameterS.h" "Dynamic_ParameterA.h" "Dynamic_ParameterC.cpp" "Dynamic_ParameterA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-Dynamic_Parameter_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -GA -Wb,export_macro=TAO_AnyTypeCode_Export -Wb,export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -iC tao/AnyTypeCode -Sorb "$(InputPath)"
<<

SOURCE="ValueModifier.pidl"

InputPath=ValueModifier.pidl

"ValueModifierC.h" "ValueModifierS.h" "ValueModifierA.h" "ValueModifierC.cpp" "ValueModifierA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-ValueModifier_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -GA -Wb,export_macro=TAO_AnyTypeCode_Export -Wb,export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -iC tao/AnyTypeCode -Sorb "$(InputPath)"
<<

SOURCE="Visibility.pidl"

InputPath=Visibility.pidl

"VisibilityC.h" "VisibilityS.h" "VisibilityA.h" "VisibilityC.cpp" "VisibilityA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-Visibility_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -GA -Wb,export_macro=TAO_AnyTypeCode_Export -Wb,export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -iC tao/AnyTypeCode -Sorb "$(InputPath)"
<<

SOURCE="Dynamic.pidl"

InputPath=Dynamic.pidl

"DynamicC.h" "DynamicS.h" "DynamicA.h" "DynamicC.cpp" "DynamicA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-Dynamic_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -GA -Wb,export_macro=TAO_AnyTypeCode_Export -Wb,export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -iC tao/AnyTypeCode -Sorb "$(InputPath)"
<<

SOURCE="Bounds.pidl"

InputPath=Bounds.pidl

"BoundsC.h" "BoundsS.h" "BoundsA.h" "BoundsC.cpp" "BoundsA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-Bounds_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -GA -Wb,export_macro=TAO_AnyTypeCode_Export -Wb,export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -iC tao/AnyTypeCode "$(InputPath)"
<<

!ENDIF


!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.AnyTypeCode_Idl.dep")
	@echo Using "Makefile.AnyTypeCode_Idl.dep"
!ENDIF
!ENDIF

