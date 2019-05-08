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
!MESSAGE NMAKE /f "Makefile.IFR_Client_Idl.mak" CFG="Win64 Debug"
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

GENERATED_DIRTY = "IFR_BasicC.inl" "IFR_BasicS.inl" "IFR_BasicC.h" "IFR_BasicS.h" "IFR_BasicA.h" "IFR_BasicS_T.h" "IFR_BasicC.cpp" "IFR_BasicS.cpp" "IFR_BasicS_T.cpp" "IFR_ComponentsC.inl" "IFR_ComponentsS.inl" "IFR_ComponentsC.h" "IFR_ComponentsS.h" "IFR_ComponentsA.h" "IFR_ComponentsS_T.h" "IFR_ComponentsC.cpp" "IFR_ComponentsS.cpp" "IFR_ComponentsS_T.cpp" "IFR_ExtendedC.inl" "IFR_ExtendedS.inl" "IFR_ExtendedC.h" "IFR_ExtendedS.h" "IFR_ExtendedA.h" "IFR_ExtendedS_T.h" "IFR_ExtendedC.cpp" "IFR_ExtendedS.cpp" "IFR_ExtendedS_T.cpp" "IFR_BaseC.inl" "IFR_BaseS.inl" "IFR_BaseC.h" "IFR_BaseS.h" "IFR_BaseA.h" "IFR_BaseS_T.h" "IFR_BaseC.cpp" "IFR_BaseS.cpp" "IFR_BaseS_T.cpp"

!IF  "$(CFG)" == "Win64 Debug"

OUTDIR=.
INTDIR=Debug\IFR_Client_Idl\IA64

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
	-@del /f/q "IFR_BasicC.inl"
	-@del /f/q "IFR_BasicS.inl"
	-@del /f/q "IFR_BasicC.h"
	-@del /f/q "IFR_BasicS.h"
	-@del /f/q "IFR_BasicA.h"
	-@del /f/q "IFR_BasicS_T.h"
	-@del /f/q "IFR_BasicC.cpp"
	-@del /f/q "IFR_BasicS.cpp"
	-@del /f/q "IFR_BasicS_T.cpp"
	-@del /f/q "IFR_ComponentsC.inl"
	-@del /f/q "IFR_ComponentsS.inl"
	-@del /f/q "IFR_ComponentsC.h"
	-@del /f/q "IFR_ComponentsS.h"
	-@del /f/q "IFR_ComponentsA.h"
	-@del /f/q "IFR_ComponentsS_T.h"
	-@del /f/q "IFR_ComponentsC.cpp"
	-@del /f/q "IFR_ComponentsS.cpp"
	-@del /f/q "IFR_ComponentsS_T.cpp"
	-@del /f/q "IFR_ExtendedC.inl"
	-@del /f/q "IFR_ExtendedS.inl"
	-@del /f/q "IFR_ExtendedC.h"
	-@del /f/q "IFR_ExtendedS.h"
	-@del /f/q "IFR_ExtendedA.h"
	-@del /f/q "IFR_ExtendedS_T.h"
	-@del /f/q "IFR_ExtendedC.cpp"
	-@del /f/q "IFR_ExtendedS.cpp"
	-@del /f/q "IFR_ExtendedS_T.cpp"
	-@del /f/q "IFR_BaseC.inl"
	-@del /f/q "IFR_BaseS.inl"
	-@del /f/q "IFR_BaseC.h"
	-@del /f/q "IFR_BaseS.h"
	-@del /f/q "IFR_BaseA.h"
	-@del /f/q "IFR_BaseS_T.h"
	-@del /f/q "IFR_BaseC.cpp"
	-@del /f/q "IFR_BaseS.cpp"
	-@del /f/q "IFR_BaseS_T.cpp"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\IFR_Client_Idl\$(NULL)" mkdir "Debug\IFR_Client_Idl"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /Fd"$(INTDIR)/" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe


!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=.
INTDIR=Release\IFR_Client_Idl\IA64

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
	-@del /f/q "IFR_BasicC.inl"
	-@del /f/q "IFR_BasicS.inl"
	-@del /f/q "IFR_BasicC.h"
	-@del /f/q "IFR_BasicS.h"
	-@del /f/q "IFR_BasicA.h"
	-@del /f/q "IFR_BasicS_T.h"
	-@del /f/q "IFR_BasicC.cpp"
	-@del /f/q "IFR_BasicS.cpp"
	-@del /f/q "IFR_BasicS_T.cpp"
	-@del /f/q "IFR_ComponentsC.inl"
	-@del /f/q "IFR_ComponentsS.inl"
	-@del /f/q "IFR_ComponentsC.h"
	-@del /f/q "IFR_ComponentsS.h"
	-@del /f/q "IFR_ComponentsA.h"
	-@del /f/q "IFR_ComponentsS_T.h"
	-@del /f/q "IFR_ComponentsC.cpp"
	-@del /f/q "IFR_ComponentsS.cpp"
	-@del /f/q "IFR_ComponentsS_T.cpp"
	-@del /f/q "IFR_ExtendedC.inl"
	-@del /f/q "IFR_ExtendedS.inl"
	-@del /f/q "IFR_ExtendedC.h"
	-@del /f/q "IFR_ExtendedS.h"
	-@del /f/q "IFR_ExtendedA.h"
	-@del /f/q "IFR_ExtendedS_T.h"
	-@del /f/q "IFR_ExtendedC.cpp"
	-@del /f/q "IFR_ExtendedS.cpp"
	-@del /f/q "IFR_ExtendedS_T.cpp"
	-@del /f/q "IFR_BaseC.inl"
	-@del /f/q "IFR_BaseS.inl"
	-@del /f/q "IFR_BaseC.h"
	-@del /f/q "IFR_BaseS.h"
	-@del /f/q "IFR_BaseA.h"
	-@del /f/q "IFR_BaseS_T.h"
	-@del /f/q "IFR_BaseC.cpp"
	-@del /f/q "IFR_BaseS.cpp"
	-@del /f/q "IFR_BaseS_T.cpp"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\IFR_Client_Idl\$(NULL)" mkdir "Release\IFR_Client_Idl"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe


!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=.
INTDIR=Static_Debug\IFR_Client_Idl\IA64

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
	-@del /f/q "IFR_BasicC.inl"
	-@del /f/q "IFR_BasicS.inl"
	-@del /f/q "IFR_BasicC.h"
	-@del /f/q "IFR_BasicS.h"
	-@del /f/q "IFR_BasicA.h"
	-@del /f/q "IFR_BasicS_T.h"
	-@del /f/q "IFR_BasicC.cpp"
	-@del /f/q "IFR_BasicS.cpp"
	-@del /f/q "IFR_BasicS_T.cpp"
	-@del /f/q "IFR_ComponentsC.inl"
	-@del /f/q "IFR_ComponentsS.inl"
	-@del /f/q "IFR_ComponentsC.h"
	-@del /f/q "IFR_ComponentsS.h"
	-@del /f/q "IFR_ComponentsA.h"
	-@del /f/q "IFR_ComponentsS_T.h"
	-@del /f/q "IFR_ComponentsC.cpp"
	-@del /f/q "IFR_ComponentsS.cpp"
	-@del /f/q "IFR_ComponentsS_T.cpp"
	-@del /f/q "IFR_ExtendedC.inl"
	-@del /f/q "IFR_ExtendedS.inl"
	-@del /f/q "IFR_ExtendedC.h"
	-@del /f/q "IFR_ExtendedS.h"
	-@del /f/q "IFR_ExtendedA.h"
	-@del /f/q "IFR_ExtendedS_T.h"
	-@del /f/q "IFR_ExtendedC.cpp"
	-@del /f/q "IFR_ExtendedS.cpp"
	-@del /f/q "IFR_ExtendedS_T.cpp"
	-@del /f/q "IFR_BaseC.inl"
	-@del /f/q "IFR_BaseS.inl"
	-@del /f/q "IFR_BaseC.h"
	-@del /f/q "IFR_BaseS.h"
	-@del /f/q "IFR_BaseA.h"
	-@del /f/q "IFR_BaseS_T.h"
	-@del /f/q "IFR_BaseC.cpp"
	-@del /f/q "IFR_BaseS.cpp"
	-@del /f/q "IFR_BaseS_T.cpp"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\IFR_Client_Idl\$(NULL)" mkdir "Static_Debug\IFR_Client_Idl"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /Fd".\sd.pdb" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"



!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=.
INTDIR=Static_Release\IFR_Client_Idl\IA64

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
	-@del /f/q "IFR_BasicC.inl"
	-@del /f/q "IFR_BasicS.inl"
	-@del /f/q "IFR_BasicC.h"
	-@del /f/q "IFR_BasicS.h"
	-@del /f/q "IFR_BasicA.h"
	-@del /f/q "IFR_BasicS_T.h"
	-@del /f/q "IFR_BasicC.cpp"
	-@del /f/q "IFR_BasicS.cpp"
	-@del /f/q "IFR_BasicS_T.cpp"
	-@del /f/q "IFR_ComponentsC.inl"
	-@del /f/q "IFR_ComponentsS.inl"
	-@del /f/q "IFR_ComponentsC.h"
	-@del /f/q "IFR_ComponentsS.h"
	-@del /f/q "IFR_ComponentsA.h"
	-@del /f/q "IFR_ComponentsS_T.h"
	-@del /f/q "IFR_ComponentsC.cpp"
	-@del /f/q "IFR_ComponentsS.cpp"
	-@del /f/q "IFR_ComponentsS_T.cpp"
	-@del /f/q "IFR_ExtendedC.inl"
	-@del /f/q "IFR_ExtendedS.inl"
	-@del /f/q "IFR_ExtendedC.h"
	-@del /f/q "IFR_ExtendedS.h"
	-@del /f/q "IFR_ExtendedA.h"
	-@del /f/q "IFR_ExtendedS_T.h"
	-@del /f/q "IFR_ExtendedC.cpp"
	-@del /f/q "IFR_ExtendedS.cpp"
	-@del /f/q "IFR_ExtendedS_T.cpp"
	-@del /f/q "IFR_BaseC.inl"
	-@del /f/q "IFR_BaseS.inl"
	-@del /f/q "IFR_BaseC.h"
	-@del /f/q "IFR_BaseS.h"
	-@del /f/q "IFR_BaseA.h"
	-@del /f/q "IFR_BaseS_T.h"
	-@del /f/q "IFR_BaseC.cpp"
	-@del /f/q "IFR_BaseS.cpp"
	-@del /f/q "IFR_BaseS_T.cpp"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\IFR_Client_Idl\$(NULL)" mkdir "Static_Release\IFR_Client_Idl"
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
!IF EXISTS("Makefile.IFR_Client_Idl.dep")
!INCLUDE "Makefile.IFR_Client_Idl.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
!IF  "$(CFG)" == "Win64 Debug"
SOURCE="IFR_Basic.pidl"

InputPath=IFR_Basic.pidl

"IFR_BasicC.inl" "IFR_BasicS.inl" "IFR_BasicC.h" "IFR_BasicS.h" "IFR_BasicA.h" "IFR_BasicS_T.h" "IFR_BasicC.cpp" "IFR_BasicS.cpp" "IFR_BasicS_T.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-IFR_Basic_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GX -Wb,stub_export_macro=TAO_IFR_Client_Export -Wb,stub_export_include=tao/IFR_Client/ifr_client_export.h -Wb,skel_export_macro=TAO_IFR_Client_Skel_Export -Wb,skel_export_include=tao/IFR_Client/ifr_client_skel_export.h -iC tao/IFR_Client -GT "$(InputPath)"
<<

SOURCE="IFR_Components.pidl"

InputPath=IFR_Components.pidl

"IFR_ComponentsC.inl" "IFR_ComponentsS.inl" "IFR_ComponentsC.h" "IFR_ComponentsS.h" "IFR_ComponentsA.h" "IFR_ComponentsS_T.h" "IFR_ComponentsC.cpp" "IFR_ComponentsS.cpp" "IFR_ComponentsS_T.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-IFR_Components_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GX -Wb,stub_export_macro=TAO_IFR_Client_Export -Wb,stub_export_include=tao/IFR_Client/ifr_client_export.h -Wb,skel_export_macro=TAO_IFR_Client_Skel_Export -Wb,skel_export_include=tao/IFR_Client/ifr_client_skel_export.h -iC tao/IFR_Client -GT "$(InputPath)"
<<

SOURCE="IFR_Extended.pidl"

InputPath=IFR_Extended.pidl

"IFR_ExtendedC.inl" "IFR_ExtendedS.inl" "IFR_ExtendedC.h" "IFR_ExtendedS.h" "IFR_ExtendedA.h" "IFR_ExtendedS_T.h" "IFR_ExtendedC.cpp" "IFR_ExtendedS.cpp" "IFR_ExtendedS_T.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-IFR_Extended_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GX -Wb,stub_export_macro=TAO_IFR_Client_Export -Wb,stub_export_include=tao/IFR_Client/ifr_client_export.h -Wb,skel_export_macro=TAO_IFR_Client_Skel_Export -Wb,skel_export_include=tao/IFR_Client/ifr_client_skel_export.h -iC tao/IFR_Client -GT "$(InputPath)"
<<

SOURCE="IFR_Base.pidl"

InputPath=IFR_Base.pidl

"IFR_BaseC.inl" "IFR_BaseS.inl" "IFR_BaseC.h" "IFR_BaseS.h" "IFR_BaseA.h" "IFR_BaseS_T.h" "IFR_BaseC.cpp" "IFR_BaseS.cpp" "IFR_BaseS_T.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-IFR_Base_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GX -Wb,stub_export_macro=TAO_IFR_Client_Export -Wb,stub_export_include=tao/IFR_Client/ifr_client_export.h -Wb,skel_export_macro=TAO_IFR_Client_Skel_Export -Wb,skel_export_include=tao/IFR_Client/ifr_client_skel_export.h -iC tao/IFR_Client -GT "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Release"
SOURCE="IFR_Basic.pidl"

InputPath=IFR_Basic.pidl

"IFR_BasicC.inl" "IFR_BasicS.inl" "IFR_BasicC.h" "IFR_BasicS.h" "IFR_BasicA.h" "IFR_BasicS_T.h" "IFR_BasicC.cpp" "IFR_BasicS.cpp" "IFR_BasicS_T.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-IFR_Basic_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GX -Wb,stub_export_macro=TAO_IFR_Client_Export -Wb,stub_export_include=tao/IFR_Client/ifr_client_export.h -Wb,skel_export_macro=TAO_IFR_Client_Skel_Export -Wb,skel_export_include=tao/IFR_Client/ifr_client_skel_export.h -iC tao/IFR_Client -GT "$(InputPath)"
<<

SOURCE="IFR_Components.pidl"

InputPath=IFR_Components.pidl

"IFR_ComponentsC.inl" "IFR_ComponentsS.inl" "IFR_ComponentsC.h" "IFR_ComponentsS.h" "IFR_ComponentsA.h" "IFR_ComponentsS_T.h" "IFR_ComponentsC.cpp" "IFR_ComponentsS.cpp" "IFR_ComponentsS_T.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-IFR_Components_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GX -Wb,stub_export_macro=TAO_IFR_Client_Export -Wb,stub_export_include=tao/IFR_Client/ifr_client_export.h -Wb,skel_export_macro=TAO_IFR_Client_Skel_Export -Wb,skel_export_include=tao/IFR_Client/ifr_client_skel_export.h -iC tao/IFR_Client -GT "$(InputPath)"
<<

SOURCE="IFR_Extended.pidl"

InputPath=IFR_Extended.pidl

"IFR_ExtendedC.inl" "IFR_ExtendedS.inl" "IFR_ExtendedC.h" "IFR_ExtendedS.h" "IFR_ExtendedA.h" "IFR_ExtendedS_T.h" "IFR_ExtendedC.cpp" "IFR_ExtendedS.cpp" "IFR_ExtendedS_T.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-IFR_Extended_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GX -Wb,stub_export_macro=TAO_IFR_Client_Export -Wb,stub_export_include=tao/IFR_Client/ifr_client_export.h -Wb,skel_export_macro=TAO_IFR_Client_Skel_Export -Wb,skel_export_include=tao/IFR_Client/ifr_client_skel_export.h -iC tao/IFR_Client -GT "$(InputPath)"
<<

SOURCE="IFR_Base.pidl"

InputPath=IFR_Base.pidl

"IFR_BaseC.inl" "IFR_BaseS.inl" "IFR_BaseC.h" "IFR_BaseS.h" "IFR_BaseA.h" "IFR_BaseS_T.h" "IFR_BaseC.cpp" "IFR_BaseS.cpp" "IFR_BaseS_T.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-IFR_Base_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GX -Wb,stub_export_macro=TAO_IFR_Client_Export -Wb,stub_export_include=tao/IFR_Client/ifr_client_export.h -Wb,skel_export_macro=TAO_IFR_Client_Skel_Export -Wb,skel_export_include=tao/IFR_Client/ifr_client_skel_export.h -iC tao/IFR_Client -GT "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Debug"
SOURCE="IFR_Basic.pidl"

InputPath=IFR_Basic.pidl

"IFR_BasicC.inl" "IFR_BasicS.inl" "IFR_BasicC.h" "IFR_BasicS.h" "IFR_BasicA.h" "IFR_BasicS_T.h" "IFR_BasicC.cpp" "IFR_BasicS.cpp" "IFR_BasicS_T.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-IFR_Basic_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GX -Wb,stub_export_macro=TAO_IFR_Client_Export -Wb,stub_export_include=tao/IFR_Client/ifr_client_export.h -Wb,skel_export_macro=TAO_IFR_Client_Skel_Export -Wb,skel_export_include=tao/IFR_Client/ifr_client_skel_export.h -iC tao/IFR_Client -GT "$(InputPath)"
<<

SOURCE="IFR_Components.pidl"

InputPath=IFR_Components.pidl

"IFR_ComponentsC.inl" "IFR_ComponentsS.inl" "IFR_ComponentsC.h" "IFR_ComponentsS.h" "IFR_ComponentsA.h" "IFR_ComponentsS_T.h" "IFR_ComponentsC.cpp" "IFR_ComponentsS.cpp" "IFR_ComponentsS_T.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-IFR_Components_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GX -Wb,stub_export_macro=TAO_IFR_Client_Export -Wb,stub_export_include=tao/IFR_Client/ifr_client_export.h -Wb,skel_export_macro=TAO_IFR_Client_Skel_Export -Wb,skel_export_include=tao/IFR_Client/ifr_client_skel_export.h -iC tao/IFR_Client -GT "$(InputPath)"
<<

SOURCE="IFR_Extended.pidl"

InputPath=IFR_Extended.pidl

"IFR_ExtendedC.inl" "IFR_ExtendedS.inl" "IFR_ExtendedC.h" "IFR_ExtendedS.h" "IFR_ExtendedA.h" "IFR_ExtendedS_T.h" "IFR_ExtendedC.cpp" "IFR_ExtendedS.cpp" "IFR_ExtendedS_T.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-IFR_Extended_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GX -Wb,stub_export_macro=TAO_IFR_Client_Export -Wb,stub_export_include=tao/IFR_Client/ifr_client_export.h -Wb,skel_export_macro=TAO_IFR_Client_Skel_Export -Wb,skel_export_include=tao/IFR_Client/ifr_client_skel_export.h -iC tao/IFR_Client -GT "$(InputPath)"
<<

SOURCE="IFR_Base.pidl"

InputPath=IFR_Base.pidl

"IFR_BaseC.inl" "IFR_BaseS.inl" "IFR_BaseC.h" "IFR_BaseS.h" "IFR_BaseA.h" "IFR_BaseS_T.h" "IFR_BaseC.cpp" "IFR_BaseS.cpp" "IFR_BaseS_T.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-IFR_Base_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GX -Wb,stub_export_macro=TAO_IFR_Client_Export -Wb,stub_export_include=tao/IFR_Client/ifr_client_export.h -Wb,skel_export_macro=TAO_IFR_Client_Skel_Export -Wb,skel_export_include=tao/IFR_Client/ifr_client_skel_export.h -iC tao/IFR_Client -GT "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Release"
SOURCE="IFR_Basic.pidl"

InputPath=IFR_Basic.pidl

"IFR_BasicC.inl" "IFR_BasicS.inl" "IFR_BasicC.h" "IFR_BasicS.h" "IFR_BasicA.h" "IFR_BasicS_T.h" "IFR_BasicC.cpp" "IFR_BasicS.cpp" "IFR_BasicS_T.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-IFR_Basic_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GX -Wb,stub_export_macro=TAO_IFR_Client_Export -Wb,stub_export_include=tao/IFR_Client/ifr_client_export.h -Wb,skel_export_macro=TAO_IFR_Client_Skel_Export -Wb,skel_export_include=tao/IFR_Client/ifr_client_skel_export.h -iC tao/IFR_Client -GT "$(InputPath)"
<<

SOURCE="IFR_Components.pidl"

InputPath=IFR_Components.pidl

"IFR_ComponentsC.inl" "IFR_ComponentsS.inl" "IFR_ComponentsC.h" "IFR_ComponentsS.h" "IFR_ComponentsA.h" "IFR_ComponentsS_T.h" "IFR_ComponentsC.cpp" "IFR_ComponentsS.cpp" "IFR_ComponentsS_T.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-IFR_Components_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GX -Wb,stub_export_macro=TAO_IFR_Client_Export -Wb,stub_export_include=tao/IFR_Client/ifr_client_export.h -Wb,skel_export_macro=TAO_IFR_Client_Skel_Export -Wb,skel_export_include=tao/IFR_Client/ifr_client_skel_export.h -iC tao/IFR_Client -GT "$(InputPath)"
<<

SOURCE="IFR_Extended.pidl"

InputPath=IFR_Extended.pidl

"IFR_ExtendedC.inl" "IFR_ExtendedS.inl" "IFR_ExtendedC.h" "IFR_ExtendedS.h" "IFR_ExtendedA.h" "IFR_ExtendedS_T.h" "IFR_ExtendedC.cpp" "IFR_ExtendedS.cpp" "IFR_ExtendedS_T.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-IFR_Extended_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GX -Wb,stub_export_macro=TAO_IFR_Client_Export -Wb,stub_export_include=tao/IFR_Client/ifr_client_export.h -Wb,skel_export_macro=TAO_IFR_Client_Skel_Export -Wb,skel_export_include=tao/IFR_Client/ifr_client_skel_export.h -iC tao/IFR_Client -GT "$(InputPath)"
<<

SOURCE="IFR_Base.pidl"

InputPath=IFR_Base.pidl

"IFR_BaseC.inl" "IFR_BaseS.inl" "IFR_BaseC.h" "IFR_BaseS.h" "IFR_BaseA.h" "IFR_BaseS_T.h" "IFR_BaseC.cpp" "IFR_BaseS.cpp" "IFR_BaseS_T.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-IFR_Base_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -GX -Wb,stub_export_macro=TAO_IFR_Client_Export -Wb,stub_export_include=tao/IFR_Client/ifr_client_export.h -Wb,skel_export_macro=TAO_IFR_Client_Skel_Export -Wb,skel_export_include=tao/IFR_Client/ifr_client_skel_export.h -iC tao/IFR_Client -GT "$(InputPath)"
<<

!ENDIF


!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.IFR_Client_Idl.dep")
	@echo Using "Makefile.IFR_Client_Idl.dep"
!ENDIF
!ENDIF

