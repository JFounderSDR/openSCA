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
!MESSAGE NMAKE /f "Makefile.EndpointPolicy_Core_Idl.mak" CFG="Win64 Debug"
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

GENERATED_DIRTY = "EndpointPolicyC.h" "EndpointPolicyS.h" "EndpointPolicyA.h" "EndpointPolicyC.cpp" "EndpointPolicyA.cpp" "IIOPEndpointValueC.h" "IIOPEndpointValueS.h" "IIOPEndpointValueA.h" "IIOPEndpointValueC.cpp" "IIOPEndpointValueA.cpp" "EndpointPolicyTypeC.h" "EndpointPolicyTypeS.h" "EndpointPolicyTypeA.h" "EndpointPolicyTypeC.cpp" "EndpointPolicyTypeA.cpp"

!IF  "$(CFG)" == "Win64 Debug"

OUTDIR=.
INTDIR=Debug\EndpointPolicy_Core_Idl\IA64

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
	-@del /f/q "EndpointPolicyC.h"
	-@del /f/q "EndpointPolicyS.h"
	-@del /f/q "EndpointPolicyA.h"
	-@del /f/q "EndpointPolicyC.cpp"
	-@del /f/q "EndpointPolicyA.cpp"
	-@del /f/q "IIOPEndpointValueC.h"
	-@del /f/q "IIOPEndpointValueS.h"
	-@del /f/q "IIOPEndpointValueA.h"
	-@del /f/q "IIOPEndpointValueC.cpp"
	-@del /f/q "IIOPEndpointValueA.cpp"
	-@del /f/q "EndpointPolicyTypeC.h"
	-@del /f/q "EndpointPolicyTypeS.h"
	-@del /f/q "EndpointPolicyTypeA.h"
	-@del /f/q "EndpointPolicyTypeC.cpp"
	-@del /f/q "EndpointPolicyTypeA.cpp"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\EndpointPolicy_Core_Idl\$(NULL)" mkdir "Debug\EndpointPolicy_Core_Idl"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /Fd"$(INTDIR)/" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe


!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=.
INTDIR=Release\EndpointPolicy_Core_Idl\IA64

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
	-@del /f/q "EndpointPolicyC.h"
	-@del /f/q "EndpointPolicyS.h"
	-@del /f/q "EndpointPolicyA.h"
	-@del /f/q "EndpointPolicyC.cpp"
	-@del /f/q "EndpointPolicyA.cpp"
	-@del /f/q "IIOPEndpointValueC.h"
	-@del /f/q "IIOPEndpointValueS.h"
	-@del /f/q "IIOPEndpointValueA.h"
	-@del /f/q "IIOPEndpointValueC.cpp"
	-@del /f/q "IIOPEndpointValueA.cpp"
	-@del /f/q "EndpointPolicyTypeC.h"
	-@del /f/q "EndpointPolicyTypeS.h"
	-@del /f/q "EndpointPolicyTypeA.h"
	-@del /f/q "EndpointPolicyTypeC.cpp"
	-@del /f/q "EndpointPolicyTypeA.cpp"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\EndpointPolicy_Core_Idl\$(NULL)" mkdir "Release\EndpointPolicy_Core_Idl"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe


!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=.
INTDIR=Static_Debug\EndpointPolicy_Core_Idl\IA64

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
	-@del /f/q "EndpointPolicyC.h"
	-@del /f/q "EndpointPolicyS.h"
	-@del /f/q "EndpointPolicyA.h"
	-@del /f/q "EndpointPolicyC.cpp"
	-@del /f/q "EndpointPolicyA.cpp"
	-@del /f/q "IIOPEndpointValueC.h"
	-@del /f/q "IIOPEndpointValueS.h"
	-@del /f/q "IIOPEndpointValueA.h"
	-@del /f/q "IIOPEndpointValueC.cpp"
	-@del /f/q "IIOPEndpointValueA.cpp"
	-@del /f/q "EndpointPolicyTypeC.h"
	-@del /f/q "EndpointPolicyTypeS.h"
	-@del /f/q "EndpointPolicyTypeA.h"
	-@del /f/q "EndpointPolicyTypeC.cpp"
	-@del /f/q "EndpointPolicyTypeA.cpp"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\EndpointPolicy_Core_Idl\$(NULL)" mkdir "Static_Debug\EndpointPolicy_Core_Idl"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /Fd".\sd.pdb" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"



!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=.
INTDIR=Static_Release\EndpointPolicy_Core_Idl\IA64

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
	-@del /f/q "EndpointPolicyC.h"
	-@del /f/q "EndpointPolicyS.h"
	-@del /f/q "EndpointPolicyA.h"
	-@del /f/q "EndpointPolicyC.cpp"
	-@del /f/q "EndpointPolicyA.cpp"
	-@del /f/q "IIOPEndpointValueC.h"
	-@del /f/q "IIOPEndpointValueS.h"
	-@del /f/q "IIOPEndpointValueA.h"
	-@del /f/q "IIOPEndpointValueC.cpp"
	-@del /f/q "IIOPEndpointValueA.cpp"
	-@del /f/q "EndpointPolicyTypeC.h"
	-@del /f/q "EndpointPolicyTypeS.h"
	-@del /f/q "EndpointPolicyTypeA.h"
	-@del /f/q "EndpointPolicyTypeC.cpp"
	-@del /f/q "EndpointPolicyTypeA.cpp"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\EndpointPolicy_Core_Idl\$(NULL)" mkdir "Static_Release\EndpointPolicy_Core_Idl"
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
!IF EXISTS("Makefile.EndpointPolicy_Core_Idl.dep")
!INCLUDE "Makefile.EndpointPolicy_Core_Idl.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
!IF  "$(CFG)" == "Win64 Debug"
SOURCE="EndpointPolicy.pidl"

InputPath=EndpointPolicy.pidl

"EndpointPolicyC.h" "EndpointPolicyS.h" "EndpointPolicyA.h" "EndpointPolicyC.cpp" "EndpointPolicyA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-EndpointPolicy_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GA -SS -Sci -Sorb -Wb,export_macro=TAO_EndpointPolicy_Export -Wb,export_include=tao/EndpointPolicy/EndpointPolicy_Export.h -iC tao/EndpointPolicy "$(InputPath)"
<<

SOURCE="IIOPEndpointValue.pidl"

InputPath=IIOPEndpointValue.pidl

"IIOPEndpointValueC.h" "IIOPEndpointValueS.h" "IIOPEndpointValueA.h" "IIOPEndpointValueC.cpp" "IIOPEndpointValueA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-IIOPEndpointValue_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GA -SS -Sci -Sorb -Wb,export_macro=TAO_EndpointPolicy_Export -Wb,export_include=tao/EndpointPolicy/EndpointPolicy_Export.h -iC tao/EndpointPolicy "$(InputPath)"
<<

SOURCE="EndpointPolicyType.pidl"

InputPath=EndpointPolicyType.pidl

"EndpointPolicyTypeC.h" "EndpointPolicyTypeS.h" "EndpointPolicyTypeA.h" "EndpointPolicyTypeC.cpp" "EndpointPolicyTypeA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-EndpointPolicyType_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GA -SS -Sci -Sorb -Wb,export_macro=TAO_EndpointPolicy_Export -Wb,export_include=tao/EndpointPolicy/EndpointPolicy_Export.h -iC tao/EndpointPolicy "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Release"
SOURCE="EndpointPolicy.pidl"

InputPath=EndpointPolicy.pidl

"EndpointPolicyC.h" "EndpointPolicyS.h" "EndpointPolicyA.h" "EndpointPolicyC.cpp" "EndpointPolicyA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-EndpointPolicy_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GA -SS -Sci -Sorb -Wb,export_macro=TAO_EndpointPolicy_Export -Wb,export_include=tao/EndpointPolicy/EndpointPolicy_Export.h -iC tao/EndpointPolicy "$(InputPath)"
<<

SOURCE="IIOPEndpointValue.pidl"

InputPath=IIOPEndpointValue.pidl

"IIOPEndpointValueC.h" "IIOPEndpointValueS.h" "IIOPEndpointValueA.h" "IIOPEndpointValueC.cpp" "IIOPEndpointValueA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-IIOPEndpointValue_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GA -SS -Sci -Sorb -Wb,export_macro=TAO_EndpointPolicy_Export -Wb,export_include=tao/EndpointPolicy/EndpointPolicy_Export.h -iC tao/EndpointPolicy "$(InputPath)"
<<

SOURCE="EndpointPolicyType.pidl"

InputPath=EndpointPolicyType.pidl

"EndpointPolicyTypeC.h" "EndpointPolicyTypeS.h" "EndpointPolicyTypeA.h" "EndpointPolicyTypeC.cpp" "EndpointPolicyTypeA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-EndpointPolicyType_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GA -SS -Sci -Sorb -Wb,export_macro=TAO_EndpointPolicy_Export -Wb,export_include=tao/EndpointPolicy/EndpointPolicy_Export.h -iC tao/EndpointPolicy "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Debug"
SOURCE="EndpointPolicy.pidl"

InputPath=EndpointPolicy.pidl

"EndpointPolicyC.h" "EndpointPolicyS.h" "EndpointPolicyA.h" "EndpointPolicyC.cpp" "EndpointPolicyA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-EndpointPolicy_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GA -SS -Sci -Sorb -Wb,export_macro=TAO_EndpointPolicy_Export -Wb,export_include=tao/EndpointPolicy/EndpointPolicy_Export.h -iC tao/EndpointPolicy "$(InputPath)"
<<

SOURCE="IIOPEndpointValue.pidl"

InputPath=IIOPEndpointValue.pidl

"IIOPEndpointValueC.h" "IIOPEndpointValueS.h" "IIOPEndpointValueA.h" "IIOPEndpointValueC.cpp" "IIOPEndpointValueA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-IIOPEndpointValue_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GA -SS -Sci -Sorb -Wb,export_macro=TAO_EndpointPolicy_Export -Wb,export_include=tao/EndpointPolicy/EndpointPolicy_Export.h -iC tao/EndpointPolicy "$(InputPath)"
<<

SOURCE="EndpointPolicyType.pidl"

InputPath=EndpointPolicyType.pidl

"EndpointPolicyTypeC.h" "EndpointPolicyTypeS.h" "EndpointPolicyTypeA.h" "EndpointPolicyTypeC.cpp" "EndpointPolicyTypeA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-EndpointPolicyType_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GA -SS -Sci -Sorb -Wb,export_macro=TAO_EndpointPolicy_Export -Wb,export_include=tao/EndpointPolicy/EndpointPolicy_Export.h -iC tao/EndpointPolicy "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Release"
SOURCE="EndpointPolicy.pidl"

InputPath=EndpointPolicy.pidl

"EndpointPolicyC.h" "EndpointPolicyS.h" "EndpointPolicyA.h" "EndpointPolicyC.cpp" "EndpointPolicyA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-EndpointPolicy_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GA -SS -Sci -Sorb -Wb,export_macro=TAO_EndpointPolicy_Export -Wb,export_include=tao/EndpointPolicy/EndpointPolicy_Export.h -iC tao/EndpointPolicy "$(InputPath)"
<<

SOURCE="IIOPEndpointValue.pidl"

InputPath=IIOPEndpointValue.pidl

"IIOPEndpointValueC.h" "IIOPEndpointValueS.h" "IIOPEndpointValueA.h" "IIOPEndpointValueC.cpp" "IIOPEndpointValueA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-IIOPEndpointValue_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GA -SS -Sci -Sorb -Wb,export_macro=TAO_EndpointPolicy_Export -Wb,export_include=tao/EndpointPolicy/EndpointPolicy_Export.h -iC tao/EndpointPolicy "$(InputPath)"
<<

SOURCE="EndpointPolicyType.pidl"

InputPath=EndpointPolicyType.pidl

"EndpointPolicyTypeC.h" "EndpointPolicyTypeS.h" "EndpointPolicyTypeA.h" "EndpointPolicyTypeC.cpp" "EndpointPolicyTypeA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-EndpointPolicyType_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GA -SS -Sci -Sorb -Wb,export_macro=TAO_EndpointPolicy_Export -Wb,export_include=tao/EndpointPolicy/EndpointPolicy_Export.h -iC tao/EndpointPolicy "$(InputPath)"
<<

!ENDIF


!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.EndpointPolicy_Core_Idl.dep")
	@echo Using "Makefile.EndpointPolicy_Core_Idl.dep"
!ENDIF
!ENDIF

