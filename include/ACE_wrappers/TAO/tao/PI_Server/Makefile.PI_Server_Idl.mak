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
!MESSAGE NMAKE /f "Makefile.PI_Server_Idl.mak" CFG="Win64 Debug"
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

GENERATED_DIRTY = "ServerRequestInfoC.h" "ServerRequestInfoS.h" "ServerRequestInfoA.h" "ServerRequestInfoC.cpp" "ServerRequestInfoA.cpp" "PI_Server_includeC.h" "PI_Server_includeS.h" "PI_Server_includeA.h" "PI_Server_includeC.cpp"

!IF  "$(CFG)" == "Win64 Debug"

OUTDIR=.
INTDIR=Debug\PI_Server_Idl\IA64

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
	-@del /f/q "ServerRequestInfoC.h"
	-@del /f/q "ServerRequestInfoS.h"
	-@del /f/q "ServerRequestInfoA.h"
	-@del /f/q "ServerRequestInfoC.cpp"
	-@del /f/q "ServerRequestInfoA.cpp"
	-@del /f/q "PI_Server_includeC.h"
	-@del /f/q "PI_Server_includeS.h"
	-@del /f/q "PI_Server_includeA.h"
	-@del /f/q "PI_Server_includeC.cpp"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\PI_Server_Idl\$(NULL)" mkdir "Debug\PI_Server_Idl"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /Fd"$(INTDIR)/" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe


!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=.
INTDIR=Release\PI_Server_Idl\IA64

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
	-@del /f/q "ServerRequestInfoC.h"
	-@del /f/q "ServerRequestInfoS.h"
	-@del /f/q "ServerRequestInfoA.h"
	-@del /f/q "ServerRequestInfoC.cpp"
	-@del /f/q "ServerRequestInfoA.cpp"
	-@del /f/q "PI_Server_includeC.h"
	-@del /f/q "PI_Server_includeS.h"
	-@del /f/q "PI_Server_includeA.h"
	-@del /f/q "PI_Server_includeC.cpp"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\PI_Server_Idl\$(NULL)" mkdir "Release\PI_Server_Idl"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe


!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=.
INTDIR=Static_Debug\PI_Server_Idl\IA64

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
	-@del /f/q "ServerRequestInfoC.h"
	-@del /f/q "ServerRequestInfoS.h"
	-@del /f/q "ServerRequestInfoA.h"
	-@del /f/q "ServerRequestInfoC.cpp"
	-@del /f/q "ServerRequestInfoA.cpp"
	-@del /f/q "PI_Server_includeC.h"
	-@del /f/q "PI_Server_includeS.h"
	-@del /f/q "PI_Server_includeA.h"
	-@del /f/q "PI_Server_includeC.cpp"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\PI_Server_Idl\$(NULL)" mkdir "Static_Debug\PI_Server_Idl"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /Fd".\sd.pdb" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"



!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=.
INTDIR=Static_Release\PI_Server_Idl\IA64

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
	-@del /f/q "ServerRequestInfoC.h"
	-@del /f/q "ServerRequestInfoS.h"
	-@del /f/q "ServerRequestInfoA.h"
	-@del /f/q "ServerRequestInfoC.cpp"
	-@del /f/q "ServerRequestInfoA.cpp"
	-@del /f/q "PI_Server_includeC.h"
	-@del /f/q "PI_Server_includeS.h"
	-@del /f/q "PI_Server_includeA.h"
	-@del /f/q "PI_Server_includeC.cpp"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\PI_Server_Idl\$(NULL)" mkdir "Static_Release\PI_Server_Idl"
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
!IF EXISTS("Makefile.PI_Server_Idl.dep")
!INCLUDE "Makefile.PI_Server_Idl.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
!IF  "$(CFG)" == "Win64 Debug"
SOURCE="ServerRequestInfo.pidl"

InputPath=ServerRequestInfo.pidl

"ServerRequestInfoC.h" "ServerRequestInfoS.h" "ServerRequestInfoA.h" "ServerRequestInfoC.cpp" "ServerRequestInfoA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-ServerRequestInfo_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_PI_Server_Export -Wb,export_include=tao/PI_Server/pi_server_export.h -iC tao/PI_Server -Sci -SS -GA -Gp -Gd -Sorb -Sal "$(InputPath)"
<<

SOURCE="PI_Server_include.pidl"

InputPath=PI_Server_include.pidl

"PI_Server_includeC.h" "PI_Server_includeS.h" "PI_Server_includeA.h" "PI_Server_includeC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-PI_Server_include_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Sa -St -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_PI_Server_Export -Wb,export_include=tao/PI_Server/pi_server_export.h -iC tao/PI_Server -SS -Sorb -GX -Sci -Wb,unique_include=tao/PI_Server/PI_Server.h "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Release"
SOURCE="ServerRequestInfo.pidl"

InputPath=ServerRequestInfo.pidl

"ServerRequestInfoC.h" "ServerRequestInfoS.h" "ServerRequestInfoA.h" "ServerRequestInfoC.cpp" "ServerRequestInfoA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-ServerRequestInfo_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_PI_Server_Export -Wb,export_include=tao/PI_Server/pi_server_export.h -iC tao/PI_Server -Sci -SS -GA -Gp -Gd -Sorb -Sal "$(InputPath)"
<<

SOURCE="PI_Server_include.pidl"

InputPath=PI_Server_include.pidl

"PI_Server_includeC.h" "PI_Server_includeS.h" "PI_Server_includeA.h" "PI_Server_includeC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-PI_Server_include_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Sa -St -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_PI_Server_Export -Wb,export_include=tao/PI_Server/pi_server_export.h -iC tao/PI_Server -SS -Sorb -GX -Sci -Wb,unique_include=tao/PI_Server/PI_Server.h "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Debug"
SOURCE="ServerRequestInfo.pidl"

InputPath=ServerRequestInfo.pidl

"ServerRequestInfoC.h" "ServerRequestInfoS.h" "ServerRequestInfoA.h" "ServerRequestInfoC.cpp" "ServerRequestInfoA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-ServerRequestInfo_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_PI_Server_Export -Wb,export_include=tao/PI_Server/pi_server_export.h -iC tao/PI_Server -Sci -SS -GA -Gp -Gd -Sorb -Sal "$(InputPath)"
<<

SOURCE="PI_Server_include.pidl"

InputPath=PI_Server_include.pidl

"PI_Server_includeC.h" "PI_Server_includeS.h" "PI_Server_includeA.h" "PI_Server_includeC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-PI_Server_include_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Sa -St -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_PI_Server_Export -Wb,export_include=tao/PI_Server/pi_server_export.h -iC tao/PI_Server -SS -Sorb -GX -Sci -Wb,unique_include=tao/PI_Server/PI_Server.h "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Release"
SOURCE="ServerRequestInfo.pidl"

InputPath=ServerRequestInfo.pidl

"ServerRequestInfoC.h" "ServerRequestInfoS.h" "ServerRequestInfoA.h" "ServerRequestInfoC.cpp" "ServerRequestInfoA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-ServerRequestInfo_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_PI_Server_Export -Wb,export_include=tao/PI_Server/pi_server_export.h -iC tao/PI_Server -Sci -SS -GA -Gp -Gd -Sorb -Sal "$(InputPath)"
<<

SOURCE="PI_Server_include.pidl"

InputPath=PI_Server_include.pidl

"PI_Server_includeC.h" "PI_Server_includeS.h" "PI_Server_includeA.h" "PI_Server_includeC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-PI_Server_include_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Sa -St -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_PI_Server_Export -Wb,export_include=tao/PI_Server/pi_server_export.h -iC tao/PI_Server -SS -Sorb -GX -Sci -Wb,unique_include=tao/PI_Server/PI_Server.h "$(InputPath)"
<<

!ENDIF


!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.PI_Server_Idl.dep")
	@echo Using "Makefile.PI_Server_Idl.dep"
!ENDIF
!ENDIF

