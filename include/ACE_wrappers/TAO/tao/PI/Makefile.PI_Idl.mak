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
!MESSAGE NMAKE /f "Makefile.PI_Idl.mak" CFG="Win64 Debug"
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

GENERATED_DIRTY = "PI_includeC.h" "PI_includeS.h" "PI_includeA.h" "PI_includeC.cpp" "ORBInitInfoC.h" "ORBInitInfoS.h" "ORBInitInfoA.h" "ORBInitInfoC.cpp" "ORBInitializerC.h" "ORBInitializerS.h" "ORBInitializerA.h" "ORBInitializerC.cpp" "ORBInitializerA.cpp" "ClientRequestInterceptorC.h" "ClientRequestInterceptorS.h" "ClientRequestInterceptorA.h" "ClientRequestInterceptorC.cpp" "ClientRequestInterceptorA.cpp" "ClientRequestInfoC.h" "ClientRequestInfoS.h" "ClientRequestInfoA.h" "ClientRequestInfoC.cpp" "ClientRequestInfoA.cpp" "RequestInfoC.h" "RequestInfoS.h" "RequestInfoA.h" "RequestInfoC.cpp" "RequestInfoA.cpp" "PIForwardRequestC.h" "PIForwardRequestS.h" "PIForwardRequestA.h" "PIForwardRequestC.cpp" "PIForwardRequestA.cpp" "PICurrentC.h" "PICurrentS.h" "PICurrentA.h" "PICurrentC.cpp" "PICurrentA.cpp" "ProcessingModePolicyC.h" "ProcessingModePolicyS.h" "ProcessingModePolicyA.h" "ProcessingModePolicyC.cpp" "ProcessingModePolicyA.cpp" "InterceptorC.h" "InterceptorS.h" "InterceptorA.h" "InterceptorC.cpp" "InterceptorA.cpp" "InvalidSlotC.h" "InvalidSlotS.h" "InvalidSlotA.h" "InvalidSlotC.cpp" "InvalidSlotA.cpp"

!IF  "$(CFG)" == "Win64 Debug"

OUTDIR=.
INTDIR=Debug\PI_Idl\IA64

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
	-@del /f/q "PI_includeC.h"
	-@del /f/q "PI_includeS.h"
	-@del /f/q "PI_includeA.h"
	-@del /f/q "PI_includeC.cpp"
	-@del /f/q "ORBInitInfoC.h"
	-@del /f/q "ORBInitInfoS.h"
	-@del /f/q "ORBInitInfoA.h"
	-@del /f/q "ORBInitInfoC.cpp"
	-@del /f/q "ORBInitializerC.h"
	-@del /f/q "ORBInitializerS.h"
	-@del /f/q "ORBInitializerA.h"
	-@del /f/q "ORBInitializerC.cpp"
	-@del /f/q "ORBInitializerA.cpp"
	-@del /f/q "ClientRequestInterceptorC.h"
	-@del /f/q "ClientRequestInterceptorS.h"
	-@del /f/q "ClientRequestInterceptorA.h"
	-@del /f/q "ClientRequestInterceptorC.cpp"
	-@del /f/q "ClientRequestInterceptorA.cpp"
	-@del /f/q "ClientRequestInfoC.h"
	-@del /f/q "ClientRequestInfoS.h"
	-@del /f/q "ClientRequestInfoA.h"
	-@del /f/q "ClientRequestInfoC.cpp"
	-@del /f/q "ClientRequestInfoA.cpp"
	-@del /f/q "RequestInfoC.h"
	-@del /f/q "RequestInfoS.h"
	-@del /f/q "RequestInfoA.h"
	-@del /f/q "RequestInfoC.cpp"
	-@del /f/q "RequestInfoA.cpp"
	-@del /f/q "PIForwardRequestC.h"
	-@del /f/q "PIForwardRequestS.h"
	-@del /f/q "PIForwardRequestA.h"
	-@del /f/q "PIForwardRequestC.cpp"
	-@del /f/q "PIForwardRequestA.cpp"
	-@del /f/q "PICurrentC.h"
	-@del /f/q "PICurrentS.h"
	-@del /f/q "PICurrentA.h"
	-@del /f/q "PICurrentC.cpp"
	-@del /f/q "PICurrentA.cpp"
	-@del /f/q "ProcessingModePolicyC.h"
	-@del /f/q "ProcessingModePolicyS.h"
	-@del /f/q "ProcessingModePolicyA.h"
	-@del /f/q "ProcessingModePolicyC.cpp"
	-@del /f/q "ProcessingModePolicyA.cpp"
	-@del /f/q "InterceptorC.h"
	-@del /f/q "InterceptorS.h"
	-@del /f/q "InterceptorA.h"
	-@del /f/q "InterceptorC.cpp"
	-@del /f/q "InterceptorA.cpp"
	-@del /f/q "InvalidSlotC.h"
	-@del /f/q "InvalidSlotS.h"
	-@del /f/q "InvalidSlotA.h"
	-@del /f/q "InvalidSlotC.cpp"
	-@del /f/q "InvalidSlotA.cpp"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\PI_Idl\$(NULL)" mkdir "Debug\PI_Idl"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /Fd"$(INTDIR)/" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe


!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=.
INTDIR=Release\PI_Idl\IA64

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
	-@del /f/q "PI_includeC.h"
	-@del /f/q "PI_includeS.h"
	-@del /f/q "PI_includeA.h"
	-@del /f/q "PI_includeC.cpp"
	-@del /f/q "ORBInitInfoC.h"
	-@del /f/q "ORBInitInfoS.h"
	-@del /f/q "ORBInitInfoA.h"
	-@del /f/q "ORBInitInfoC.cpp"
	-@del /f/q "ORBInitializerC.h"
	-@del /f/q "ORBInitializerS.h"
	-@del /f/q "ORBInitializerA.h"
	-@del /f/q "ORBInitializerC.cpp"
	-@del /f/q "ORBInitializerA.cpp"
	-@del /f/q "ClientRequestInterceptorC.h"
	-@del /f/q "ClientRequestInterceptorS.h"
	-@del /f/q "ClientRequestInterceptorA.h"
	-@del /f/q "ClientRequestInterceptorC.cpp"
	-@del /f/q "ClientRequestInterceptorA.cpp"
	-@del /f/q "ClientRequestInfoC.h"
	-@del /f/q "ClientRequestInfoS.h"
	-@del /f/q "ClientRequestInfoA.h"
	-@del /f/q "ClientRequestInfoC.cpp"
	-@del /f/q "ClientRequestInfoA.cpp"
	-@del /f/q "RequestInfoC.h"
	-@del /f/q "RequestInfoS.h"
	-@del /f/q "RequestInfoA.h"
	-@del /f/q "RequestInfoC.cpp"
	-@del /f/q "RequestInfoA.cpp"
	-@del /f/q "PIForwardRequestC.h"
	-@del /f/q "PIForwardRequestS.h"
	-@del /f/q "PIForwardRequestA.h"
	-@del /f/q "PIForwardRequestC.cpp"
	-@del /f/q "PIForwardRequestA.cpp"
	-@del /f/q "PICurrentC.h"
	-@del /f/q "PICurrentS.h"
	-@del /f/q "PICurrentA.h"
	-@del /f/q "PICurrentC.cpp"
	-@del /f/q "PICurrentA.cpp"
	-@del /f/q "ProcessingModePolicyC.h"
	-@del /f/q "ProcessingModePolicyS.h"
	-@del /f/q "ProcessingModePolicyA.h"
	-@del /f/q "ProcessingModePolicyC.cpp"
	-@del /f/q "ProcessingModePolicyA.cpp"
	-@del /f/q "InterceptorC.h"
	-@del /f/q "InterceptorS.h"
	-@del /f/q "InterceptorA.h"
	-@del /f/q "InterceptorC.cpp"
	-@del /f/q "InterceptorA.cpp"
	-@del /f/q "InvalidSlotC.h"
	-@del /f/q "InvalidSlotS.h"
	-@del /f/q "InvalidSlotA.h"
	-@del /f/q "InvalidSlotC.cpp"
	-@del /f/q "InvalidSlotA.cpp"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\PI_Idl\$(NULL)" mkdir "Release\PI_Idl"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe


!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=.
INTDIR=Static_Debug\PI_Idl\IA64

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
	-@del /f/q "PI_includeC.h"
	-@del /f/q "PI_includeS.h"
	-@del /f/q "PI_includeA.h"
	-@del /f/q "PI_includeC.cpp"
	-@del /f/q "ORBInitInfoC.h"
	-@del /f/q "ORBInitInfoS.h"
	-@del /f/q "ORBInitInfoA.h"
	-@del /f/q "ORBInitInfoC.cpp"
	-@del /f/q "ORBInitializerC.h"
	-@del /f/q "ORBInitializerS.h"
	-@del /f/q "ORBInitializerA.h"
	-@del /f/q "ORBInitializerC.cpp"
	-@del /f/q "ORBInitializerA.cpp"
	-@del /f/q "ClientRequestInterceptorC.h"
	-@del /f/q "ClientRequestInterceptorS.h"
	-@del /f/q "ClientRequestInterceptorA.h"
	-@del /f/q "ClientRequestInterceptorC.cpp"
	-@del /f/q "ClientRequestInterceptorA.cpp"
	-@del /f/q "ClientRequestInfoC.h"
	-@del /f/q "ClientRequestInfoS.h"
	-@del /f/q "ClientRequestInfoA.h"
	-@del /f/q "ClientRequestInfoC.cpp"
	-@del /f/q "ClientRequestInfoA.cpp"
	-@del /f/q "RequestInfoC.h"
	-@del /f/q "RequestInfoS.h"
	-@del /f/q "RequestInfoA.h"
	-@del /f/q "RequestInfoC.cpp"
	-@del /f/q "RequestInfoA.cpp"
	-@del /f/q "PIForwardRequestC.h"
	-@del /f/q "PIForwardRequestS.h"
	-@del /f/q "PIForwardRequestA.h"
	-@del /f/q "PIForwardRequestC.cpp"
	-@del /f/q "PIForwardRequestA.cpp"
	-@del /f/q "PICurrentC.h"
	-@del /f/q "PICurrentS.h"
	-@del /f/q "PICurrentA.h"
	-@del /f/q "PICurrentC.cpp"
	-@del /f/q "PICurrentA.cpp"
	-@del /f/q "ProcessingModePolicyC.h"
	-@del /f/q "ProcessingModePolicyS.h"
	-@del /f/q "ProcessingModePolicyA.h"
	-@del /f/q "ProcessingModePolicyC.cpp"
	-@del /f/q "ProcessingModePolicyA.cpp"
	-@del /f/q "InterceptorC.h"
	-@del /f/q "InterceptorS.h"
	-@del /f/q "InterceptorA.h"
	-@del /f/q "InterceptorC.cpp"
	-@del /f/q "InterceptorA.cpp"
	-@del /f/q "InvalidSlotC.h"
	-@del /f/q "InvalidSlotS.h"
	-@del /f/q "InvalidSlotA.h"
	-@del /f/q "InvalidSlotC.cpp"
	-@del /f/q "InvalidSlotA.cpp"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\PI_Idl\$(NULL)" mkdir "Static_Debug\PI_Idl"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /Fd".\sd.pdb" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"



!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=.
INTDIR=Static_Release\PI_Idl\IA64

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
	-@del /f/q "PI_includeC.h"
	-@del /f/q "PI_includeS.h"
	-@del /f/q "PI_includeA.h"
	-@del /f/q "PI_includeC.cpp"
	-@del /f/q "ORBInitInfoC.h"
	-@del /f/q "ORBInitInfoS.h"
	-@del /f/q "ORBInitInfoA.h"
	-@del /f/q "ORBInitInfoC.cpp"
	-@del /f/q "ORBInitializerC.h"
	-@del /f/q "ORBInitializerS.h"
	-@del /f/q "ORBInitializerA.h"
	-@del /f/q "ORBInitializerC.cpp"
	-@del /f/q "ORBInitializerA.cpp"
	-@del /f/q "ClientRequestInterceptorC.h"
	-@del /f/q "ClientRequestInterceptorS.h"
	-@del /f/q "ClientRequestInterceptorA.h"
	-@del /f/q "ClientRequestInterceptorC.cpp"
	-@del /f/q "ClientRequestInterceptorA.cpp"
	-@del /f/q "ClientRequestInfoC.h"
	-@del /f/q "ClientRequestInfoS.h"
	-@del /f/q "ClientRequestInfoA.h"
	-@del /f/q "ClientRequestInfoC.cpp"
	-@del /f/q "ClientRequestInfoA.cpp"
	-@del /f/q "RequestInfoC.h"
	-@del /f/q "RequestInfoS.h"
	-@del /f/q "RequestInfoA.h"
	-@del /f/q "RequestInfoC.cpp"
	-@del /f/q "RequestInfoA.cpp"
	-@del /f/q "PIForwardRequestC.h"
	-@del /f/q "PIForwardRequestS.h"
	-@del /f/q "PIForwardRequestA.h"
	-@del /f/q "PIForwardRequestC.cpp"
	-@del /f/q "PIForwardRequestA.cpp"
	-@del /f/q "PICurrentC.h"
	-@del /f/q "PICurrentS.h"
	-@del /f/q "PICurrentA.h"
	-@del /f/q "PICurrentC.cpp"
	-@del /f/q "PICurrentA.cpp"
	-@del /f/q "ProcessingModePolicyC.h"
	-@del /f/q "ProcessingModePolicyS.h"
	-@del /f/q "ProcessingModePolicyA.h"
	-@del /f/q "ProcessingModePolicyC.cpp"
	-@del /f/q "ProcessingModePolicyA.cpp"
	-@del /f/q "InterceptorC.h"
	-@del /f/q "InterceptorS.h"
	-@del /f/q "InterceptorA.h"
	-@del /f/q "InterceptorC.cpp"
	-@del /f/q "InterceptorA.cpp"
	-@del /f/q "InvalidSlotC.h"
	-@del /f/q "InvalidSlotS.h"
	-@del /f/q "InvalidSlotA.h"
	-@del /f/q "InvalidSlotC.cpp"
	-@del /f/q "InvalidSlotA.cpp"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\PI_Idl\$(NULL)" mkdir "Static_Release\PI_Idl"
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
!IF EXISTS("Makefile.PI_Idl.dep")
!INCLUDE "Makefile.PI_Idl.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
!IF  "$(CFG)" == "Win64 Debug"
SOURCE="PI_include.pidl"

InputPath=PI_include.pidl

"PI_includeC.h" "PI_includeS.h" "PI_includeA.h" "PI_includeC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-PI_include_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Sa -St -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sci -Gp -Gd -Wb,export_macro=TAO_PI_Export -Wb,export_include=tao/PI/pi_export.h -iC tao/PI -Sorb -GX -Wb,unique_include=tao/PI/PI.h "$(InputPath)"
<<

SOURCE="ORBInitInfo.pidl"

InputPath=ORBInitInfo.pidl

"ORBInitInfoC.h" "ORBInitInfoS.h" "ORBInitInfoA.h" "ORBInitInfoC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-ORBInitInfo_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sci -Gp -Gd -Wb,export_macro=TAO_PI_Export -Wb,export_include=tao/PI/pi_export.h -iC tao/PI -Sorb -Sal -GX -Wb,include_guard=TAO_PI_SAFE_INCLUDE -Wb,safe_include=tao/PI/PI.h "$(InputPath)"
<<

SOURCE="ORBInitializer.pidl"

InputPath=ORBInitializer.pidl

"ORBInitializerC.h" "ORBInitializerS.h" "ORBInitializerA.h" "ORBInitializerC.cpp" "ORBInitializerA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-ORBInitializer_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sci -Gp -Gd -Wb,export_macro=TAO_PI_Export -Wb,export_include=tao/PI/pi_export.h -iC tao/PI -GA -Sorb -Sal -Wb,include_guard=TAO_PI_SAFE_INCLUDE -Wb,safe_include=tao/PI/PI.h "$(InputPath)"
<<

SOURCE="ClientRequestInterceptor.pidl"

InputPath=ClientRequestInterceptor.pidl

"ClientRequestInterceptorC.h" "ClientRequestInterceptorS.h" "ClientRequestInterceptorA.h" "ClientRequestInterceptorC.cpp" "ClientRequestInterceptorA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-ClientRequestInterceptor_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sci -Gp -Gd -Wb,export_macro=TAO_PI_Export -Wb,export_include=tao/PI/pi_export.h -iC tao/PI -GA -Sorb -Sal -Wb,include_guard=TAO_PI_SAFE_INCLUDE -Wb,safe_include=tao/PI/PI.h "$(InputPath)"
<<

SOURCE="ClientRequestInfo.pidl"

InputPath=ClientRequestInfo.pidl

"ClientRequestInfoC.h" "ClientRequestInfoS.h" "ClientRequestInfoA.h" "ClientRequestInfoC.cpp" "ClientRequestInfoA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-ClientRequestInfo_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sci -Gp -Gd -Wb,export_macro=TAO_PI_Export -Wb,export_include=tao/PI/pi_export.h -iC tao/PI -GA -Sorb -Sal -Wb,include_guard=TAO_PI_SAFE_INCLUDE -Wb,safe_include=tao/PI/PI.h "$(InputPath)"
<<

SOURCE="RequestInfo.pidl"

InputPath=RequestInfo.pidl

"RequestInfoC.h" "RequestInfoS.h" "RequestInfoA.h" "RequestInfoC.cpp" "RequestInfoA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-RequestInfo_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sci -Gp -Gd -Wb,export_macro=TAO_PI_Export -Wb,export_include=tao/PI/pi_export.h -iC tao/PI -GA -Sorb -Sal -Wb,include_guard=TAO_PI_SAFE_INCLUDE -Wb,safe_include=tao/PI/PI.h "$(InputPath)"
<<

SOURCE="PIForwardRequest.pidl"

InputPath=PIForwardRequest.pidl

"PIForwardRequestC.h" "PIForwardRequestS.h" "PIForwardRequestA.h" "PIForwardRequestC.cpp" "PIForwardRequestA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-PIForwardRequest_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sci -Gp -Gd -Wb,export_macro=TAO_PI_Export -Wb,export_include=tao/PI/pi_export.h -iC tao/PI -GA -Sorb -Sal -Wb,include_guard=TAO_PI_SAFE_INCLUDE -Wb,safe_include=tao/PI/PI.h "$(InputPath)"
<<

SOURCE="PICurrent.pidl"

InputPath=PICurrent.pidl

"PICurrentC.h" "PICurrentS.h" "PICurrentA.h" "PICurrentC.cpp" "PICurrentA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-PICurrent_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sci -Gp -Gd -Wb,export_macro=TAO_PI_Export -Wb,export_include=tao/PI/pi_export.h -iC tao/PI -GA -Sorb -Sal -Wb,include_guard=TAO_PI_SAFE_INCLUDE -Wb,safe_include=tao/PI/PI.h "$(InputPath)"
<<

SOURCE="ProcessingModePolicy.pidl"

InputPath=ProcessingModePolicy.pidl

"ProcessingModePolicyC.h" "ProcessingModePolicyS.h" "ProcessingModePolicyA.h" "ProcessingModePolicyC.cpp" "ProcessingModePolicyA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-ProcessingModePolicy_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sci -Gp -Gd -Wb,export_macro=TAO_PI_Export -Wb,export_include=tao/PI/pi_export.h -iC tao/PI -GA -Sorb -Sal -Wb,include_guard=TAO_PI_SAFE_INCLUDE -Wb,safe_include=tao/PI/PI.h "$(InputPath)"
<<

SOURCE="Interceptor.pidl"

InputPath=Interceptor.pidl

"InterceptorC.h" "InterceptorS.h" "InterceptorA.h" "InterceptorC.cpp" "InterceptorA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-Interceptor_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sci -Gp -Gd -Wb,export_macro=TAO_PI_Export -Wb,export_include=tao/PI/pi_export.h -iC tao/PI -GA -Sorb -Sal "$(InputPath)"
<<

SOURCE="InvalidSlot.pidl"

InputPath=InvalidSlot.pidl

"InvalidSlotC.h" "InvalidSlotS.h" "InvalidSlotA.h" "InvalidSlotC.cpp" "InvalidSlotA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-InvalidSlot_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sci -Gp -Gd -Wb,export_macro=TAO_PI_Export -Wb,export_include=tao/PI/pi_export.h -iC tao/PI -GA -Sal -Wb,include_guard=TAO_PI_SAFE_INCLUDE -Wb,safe_include=tao/PI/PI.h "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Release"
SOURCE="PI_include.pidl"

InputPath=PI_include.pidl

"PI_includeC.h" "PI_includeS.h" "PI_includeA.h" "PI_includeC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-PI_include_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Sa -St -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sci -Gp -Gd -Wb,export_macro=TAO_PI_Export -Wb,export_include=tao/PI/pi_export.h -iC tao/PI -Sorb -GX -Wb,unique_include=tao/PI/PI.h "$(InputPath)"
<<

SOURCE="ORBInitInfo.pidl"

InputPath=ORBInitInfo.pidl

"ORBInitInfoC.h" "ORBInitInfoS.h" "ORBInitInfoA.h" "ORBInitInfoC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-ORBInitInfo_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sci -Gp -Gd -Wb,export_macro=TAO_PI_Export -Wb,export_include=tao/PI/pi_export.h -iC tao/PI -Sorb -Sal -GX -Wb,include_guard=TAO_PI_SAFE_INCLUDE -Wb,safe_include=tao/PI/PI.h "$(InputPath)"
<<

SOURCE="ORBInitializer.pidl"

InputPath=ORBInitializer.pidl

"ORBInitializerC.h" "ORBInitializerS.h" "ORBInitializerA.h" "ORBInitializerC.cpp" "ORBInitializerA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-ORBInitializer_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sci -Gp -Gd -Wb,export_macro=TAO_PI_Export -Wb,export_include=tao/PI/pi_export.h -iC tao/PI -GA -Sorb -Sal -Wb,include_guard=TAO_PI_SAFE_INCLUDE -Wb,safe_include=tao/PI/PI.h "$(InputPath)"
<<

SOURCE="ClientRequestInterceptor.pidl"

InputPath=ClientRequestInterceptor.pidl

"ClientRequestInterceptorC.h" "ClientRequestInterceptorS.h" "ClientRequestInterceptorA.h" "ClientRequestInterceptorC.cpp" "ClientRequestInterceptorA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-ClientRequestInterceptor_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sci -Gp -Gd -Wb,export_macro=TAO_PI_Export -Wb,export_include=tao/PI/pi_export.h -iC tao/PI -GA -Sorb -Sal -Wb,include_guard=TAO_PI_SAFE_INCLUDE -Wb,safe_include=tao/PI/PI.h "$(InputPath)"
<<

SOURCE="ClientRequestInfo.pidl"

InputPath=ClientRequestInfo.pidl

"ClientRequestInfoC.h" "ClientRequestInfoS.h" "ClientRequestInfoA.h" "ClientRequestInfoC.cpp" "ClientRequestInfoA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-ClientRequestInfo_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sci -Gp -Gd -Wb,export_macro=TAO_PI_Export -Wb,export_include=tao/PI/pi_export.h -iC tao/PI -GA -Sorb -Sal -Wb,include_guard=TAO_PI_SAFE_INCLUDE -Wb,safe_include=tao/PI/PI.h "$(InputPath)"
<<

SOURCE="RequestInfo.pidl"

InputPath=RequestInfo.pidl

"RequestInfoC.h" "RequestInfoS.h" "RequestInfoA.h" "RequestInfoC.cpp" "RequestInfoA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-RequestInfo_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sci -Gp -Gd -Wb,export_macro=TAO_PI_Export -Wb,export_include=tao/PI/pi_export.h -iC tao/PI -GA -Sorb -Sal -Wb,include_guard=TAO_PI_SAFE_INCLUDE -Wb,safe_include=tao/PI/PI.h "$(InputPath)"
<<

SOURCE="PIForwardRequest.pidl"

InputPath=PIForwardRequest.pidl

"PIForwardRequestC.h" "PIForwardRequestS.h" "PIForwardRequestA.h" "PIForwardRequestC.cpp" "PIForwardRequestA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-PIForwardRequest_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sci -Gp -Gd -Wb,export_macro=TAO_PI_Export -Wb,export_include=tao/PI/pi_export.h -iC tao/PI -GA -Sorb -Sal -Wb,include_guard=TAO_PI_SAFE_INCLUDE -Wb,safe_include=tao/PI/PI.h "$(InputPath)"
<<

SOURCE="PICurrent.pidl"

InputPath=PICurrent.pidl

"PICurrentC.h" "PICurrentS.h" "PICurrentA.h" "PICurrentC.cpp" "PICurrentA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-PICurrent_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sci -Gp -Gd -Wb,export_macro=TAO_PI_Export -Wb,export_include=tao/PI/pi_export.h -iC tao/PI -GA -Sorb -Sal -Wb,include_guard=TAO_PI_SAFE_INCLUDE -Wb,safe_include=tao/PI/PI.h "$(InputPath)"
<<

SOURCE="ProcessingModePolicy.pidl"

InputPath=ProcessingModePolicy.pidl

"ProcessingModePolicyC.h" "ProcessingModePolicyS.h" "ProcessingModePolicyA.h" "ProcessingModePolicyC.cpp" "ProcessingModePolicyA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-ProcessingModePolicy_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sci -Gp -Gd -Wb,export_macro=TAO_PI_Export -Wb,export_include=tao/PI/pi_export.h -iC tao/PI -GA -Sorb -Sal -Wb,include_guard=TAO_PI_SAFE_INCLUDE -Wb,safe_include=tao/PI/PI.h "$(InputPath)"
<<

SOURCE="Interceptor.pidl"

InputPath=Interceptor.pidl

"InterceptorC.h" "InterceptorS.h" "InterceptorA.h" "InterceptorC.cpp" "InterceptorA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-Interceptor_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sci -Gp -Gd -Wb,export_macro=TAO_PI_Export -Wb,export_include=tao/PI/pi_export.h -iC tao/PI -GA -Sorb -Sal "$(InputPath)"
<<

SOURCE="InvalidSlot.pidl"

InputPath=InvalidSlot.pidl

"InvalidSlotC.h" "InvalidSlotS.h" "InvalidSlotA.h" "InvalidSlotC.cpp" "InvalidSlotA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-InvalidSlot_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sci -Gp -Gd -Wb,export_macro=TAO_PI_Export -Wb,export_include=tao/PI/pi_export.h -iC tao/PI -GA -Sal -Wb,include_guard=TAO_PI_SAFE_INCLUDE -Wb,safe_include=tao/PI/PI.h "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Debug"
SOURCE="PI_include.pidl"

InputPath=PI_include.pidl

"PI_includeC.h" "PI_includeS.h" "PI_includeA.h" "PI_includeC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-PI_include_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Sa -St -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sci -Gp -Gd -Wb,export_macro=TAO_PI_Export -Wb,export_include=tao/PI/pi_export.h -iC tao/PI -Sorb -GX -Wb,unique_include=tao/PI/PI.h "$(InputPath)"
<<

SOURCE="ORBInitInfo.pidl"

InputPath=ORBInitInfo.pidl

"ORBInitInfoC.h" "ORBInitInfoS.h" "ORBInitInfoA.h" "ORBInitInfoC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-ORBInitInfo_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sci -Gp -Gd -Wb,export_macro=TAO_PI_Export -Wb,export_include=tao/PI/pi_export.h -iC tao/PI -Sorb -Sal -GX -Wb,include_guard=TAO_PI_SAFE_INCLUDE -Wb,safe_include=tao/PI/PI.h "$(InputPath)"
<<

SOURCE="ORBInitializer.pidl"

InputPath=ORBInitializer.pidl

"ORBInitializerC.h" "ORBInitializerS.h" "ORBInitializerA.h" "ORBInitializerC.cpp" "ORBInitializerA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-ORBInitializer_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sci -Gp -Gd -Wb,export_macro=TAO_PI_Export -Wb,export_include=tao/PI/pi_export.h -iC tao/PI -GA -Sorb -Sal -Wb,include_guard=TAO_PI_SAFE_INCLUDE -Wb,safe_include=tao/PI/PI.h "$(InputPath)"
<<

SOURCE="ClientRequestInterceptor.pidl"

InputPath=ClientRequestInterceptor.pidl

"ClientRequestInterceptorC.h" "ClientRequestInterceptorS.h" "ClientRequestInterceptorA.h" "ClientRequestInterceptorC.cpp" "ClientRequestInterceptorA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-ClientRequestInterceptor_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sci -Gp -Gd -Wb,export_macro=TAO_PI_Export -Wb,export_include=tao/PI/pi_export.h -iC tao/PI -GA -Sorb -Sal -Wb,include_guard=TAO_PI_SAFE_INCLUDE -Wb,safe_include=tao/PI/PI.h "$(InputPath)"
<<

SOURCE="ClientRequestInfo.pidl"

InputPath=ClientRequestInfo.pidl

"ClientRequestInfoC.h" "ClientRequestInfoS.h" "ClientRequestInfoA.h" "ClientRequestInfoC.cpp" "ClientRequestInfoA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-ClientRequestInfo_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sci -Gp -Gd -Wb,export_macro=TAO_PI_Export -Wb,export_include=tao/PI/pi_export.h -iC tao/PI -GA -Sorb -Sal -Wb,include_guard=TAO_PI_SAFE_INCLUDE -Wb,safe_include=tao/PI/PI.h "$(InputPath)"
<<

SOURCE="RequestInfo.pidl"

InputPath=RequestInfo.pidl

"RequestInfoC.h" "RequestInfoS.h" "RequestInfoA.h" "RequestInfoC.cpp" "RequestInfoA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-RequestInfo_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sci -Gp -Gd -Wb,export_macro=TAO_PI_Export -Wb,export_include=tao/PI/pi_export.h -iC tao/PI -GA -Sorb -Sal -Wb,include_guard=TAO_PI_SAFE_INCLUDE -Wb,safe_include=tao/PI/PI.h "$(InputPath)"
<<

SOURCE="PIForwardRequest.pidl"

InputPath=PIForwardRequest.pidl

"PIForwardRequestC.h" "PIForwardRequestS.h" "PIForwardRequestA.h" "PIForwardRequestC.cpp" "PIForwardRequestA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-PIForwardRequest_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sci -Gp -Gd -Wb,export_macro=TAO_PI_Export -Wb,export_include=tao/PI/pi_export.h -iC tao/PI -GA -Sorb -Sal -Wb,include_guard=TAO_PI_SAFE_INCLUDE -Wb,safe_include=tao/PI/PI.h "$(InputPath)"
<<

SOURCE="PICurrent.pidl"

InputPath=PICurrent.pidl

"PICurrentC.h" "PICurrentS.h" "PICurrentA.h" "PICurrentC.cpp" "PICurrentA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-PICurrent_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sci -Gp -Gd -Wb,export_macro=TAO_PI_Export -Wb,export_include=tao/PI/pi_export.h -iC tao/PI -GA -Sorb -Sal -Wb,include_guard=TAO_PI_SAFE_INCLUDE -Wb,safe_include=tao/PI/PI.h "$(InputPath)"
<<

SOURCE="ProcessingModePolicy.pidl"

InputPath=ProcessingModePolicy.pidl

"ProcessingModePolicyC.h" "ProcessingModePolicyS.h" "ProcessingModePolicyA.h" "ProcessingModePolicyC.cpp" "ProcessingModePolicyA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-ProcessingModePolicy_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sci -Gp -Gd -Wb,export_macro=TAO_PI_Export -Wb,export_include=tao/PI/pi_export.h -iC tao/PI -GA -Sorb -Sal -Wb,include_guard=TAO_PI_SAFE_INCLUDE -Wb,safe_include=tao/PI/PI.h "$(InputPath)"
<<

SOURCE="Interceptor.pidl"

InputPath=Interceptor.pidl

"InterceptorC.h" "InterceptorS.h" "InterceptorA.h" "InterceptorC.cpp" "InterceptorA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-Interceptor_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sci -Gp -Gd -Wb,export_macro=TAO_PI_Export -Wb,export_include=tao/PI/pi_export.h -iC tao/PI -GA -Sorb -Sal "$(InputPath)"
<<

SOURCE="InvalidSlot.pidl"

InputPath=InvalidSlot.pidl

"InvalidSlotC.h" "InvalidSlotS.h" "InvalidSlotA.h" "InvalidSlotC.cpp" "InvalidSlotA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-InvalidSlot_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sci -Gp -Gd -Wb,export_macro=TAO_PI_Export -Wb,export_include=tao/PI/pi_export.h -iC tao/PI -GA -Sal -Wb,include_guard=TAO_PI_SAFE_INCLUDE -Wb,safe_include=tao/PI/PI.h "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Release"
SOURCE="PI_include.pidl"

InputPath=PI_include.pidl

"PI_includeC.h" "PI_includeS.h" "PI_includeA.h" "PI_includeC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-PI_include_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Sa -St -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sci -Gp -Gd -Wb,export_macro=TAO_PI_Export -Wb,export_include=tao/PI/pi_export.h -iC tao/PI -Sorb -GX -Wb,unique_include=tao/PI/PI.h "$(InputPath)"
<<

SOURCE="ORBInitInfo.pidl"

InputPath=ORBInitInfo.pidl

"ORBInitInfoC.h" "ORBInitInfoS.h" "ORBInitInfoA.h" "ORBInitInfoC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-ORBInitInfo_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sci -Gp -Gd -Wb,export_macro=TAO_PI_Export -Wb,export_include=tao/PI/pi_export.h -iC tao/PI -Sorb -Sal -GX -Wb,include_guard=TAO_PI_SAFE_INCLUDE -Wb,safe_include=tao/PI/PI.h "$(InputPath)"
<<

SOURCE="ORBInitializer.pidl"

InputPath=ORBInitializer.pidl

"ORBInitializerC.h" "ORBInitializerS.h" "ORBInitializerA.h" "ORBInitializerC.cpp" "ORBInitializerA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-ORBInitializer_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sci -Gp -Gd -Wb,export_macro=TAO_PI_Export -Wb,export_include=tao/PI/pi_export.h -iC tao/PI -GA -Sorb -Sal -Wb,include_guard=TAO_PI_SAFE_INCLUDE -Wb,safe_include=tao/PI/PI.h "$(InputPath)"
<<

SOURCE="ClientRequestInterceptor.pidl"

InputPath=ClientRequestInterceptor.pidl

"ClientRequestInterceptorC.h" "ClientRequestInterceptorS.h" "ClientRequestInterceptorA.h" "ClientRequestInterceptorC.cpp" "ClientRequestInterceptorA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-ClientRequestInterceptor_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sci -Gp -Gd -Wb,export_macro=TAO_PI_Export -Wb,export_include=tao/PI/pi_export.h -iC tao/PI -GA -Sorb -Sal -Wb,include_guard=TAO_PI_SAFE_INCLUDE -Wb,safe_include=tao/PI/PI.h "$(InputPath)"
<<

SOURCE="ClientRequestInfo.pidl"

InputPath=ClientRequestInfo.pidl

"ClientRequestInfoC.h" "ClientRequestInfoS.h" "ClientRequestInfoA.h" "ClientRequestInfoC.cpp" "ClientRequestInfoA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-ClientRequestInfo_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sci -Gp -Gd -Wb,export_macro=TAO_PI_Export -Wb,export_include=tao/PI/pi_export.h -iC tao/PI -GA -Sorb -Sal -Wb,include_guard=TAO_PI_SAFE_INCLUDE -Wb,safe_include=tao/PI/PI.h "$(InputPath)"
<<

SOURCE="RequestInfo.pidl"

InputPath=RequestInfo.pidl

"RequestInfoC.h" "RequestInfoS.h" "RequestInfoA.h" "RequestInfoC.cpp" "RequestInfoA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-RequestInfo_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sci -Gp -Gd -Wb,export_macro=TAO_PI_Export -Wb,export_include=tao/PI/pi_export.h -iC tao/PI -GA -Sorb -Sal -Wb,include_guard=TAO_PI_SAFE_INCLUDE -Wb,safe_include=tao/PI/PI.h "$(InputPath)"
<<

SOURCE="PIForwardRequest.pidl"

InputPath=PIForwardRequest.pidl

"PIForwardRequestC.h" "PIForwardRequestS.h" "PIForwardRequestA.h" "PIForwardRequestC.cpp" "PIForwardRequestA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-PIForwardRequest_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sci -Gp -Gd -Wb,export_macro=TAO_PI_Export -Wb,export_include=tao/PI/pi_export.h -iC tao/PI -GA -Sorb -Sal -Wb,include_guard=TAO_PI_SAFE_INCLUDE -Wb,safe_include=tao/PI/PI.h "$(InputPath)"
<<

SOURCE="PICurrent.pidl"

InputPath=PICurrent.pidl

"PICurrentC.h" "PICurrentS.h" "PICurrentA.h" "PICurrentC.cpp" "PICurrentA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-PICurrent_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sci -Gp -Gd -Wb,export_macro=TAO_PI_Export -Wb,export_include=tao/PI/pi_export.h -iC tao/PI -GA -Sorb -Sal -Wb,include_guard=TAO_PI_SAFE_INCLUDE -Wb,safe_include=tao/PI/PI.h "$(InputPath)"
<<

SOURCE="ProcessingModePolicy.pidl"

InputPath=ProcessingModePolicy.pidl

"ProcessingModePolicyC.h" "ProcessingModePolicyS.h" "ProcessingModePolicyA.h" "ProcessingModePolicyC.cpp" "ProcessingModePolicyA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-ProcessingModePolicy_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sci -Gp -Gd -Wb,export_macro=TAO_PI_Export -Wb,export_include=tao/PI/pi_export.h -iC tao/PI -GA -Sorb -Sal -Wb,include_guard=TAO_PI_SAFE_INCLUDE -Wb,safe_include=tao/PI/PI.h "$(InputPath)"
<<

SOURCE="Interceptor.pidl"

InputPath=Interceptor.pidl

"InterceptorC.h" "InterceptorS.h" "InterceptorA.h" "InterceptorC.cpp" "InterceptorA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-Interceptor_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sci -Gp -Gd -Wb,export_macro=TAO_PI_Export -Wb,export_include=tao/PI/pi_export.h -iC tao/PI -GA -Sorb -Sal "$(InputPath)"
<<

SOURCE="InvalidSlot.pidl"

InputPath=InvalidSlot.pidl

"InvalidSlotC.h" "InvalidSlotS.h" "InvalidSlotA.h" "InvalidSlotC.cpp" "InvalidSlotA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-InvalidSlot_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sci -Gp -Gd -Wb,export_macro=TAO_PI_Export -Wb,export_include=tao/PI/pi_export.h -iC tao/PI -GA -Sal -Wb,include_guard=TAO_PI_SAFE_INCLUDE -Wb,safe_include=tao/PI/PI.h "$(InputPath)"
<<

!ENDIF


!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.PI_Idl.dep")
	@echo Using "Makefile.PI_Idl.dep"
!ENDIF
!ENDIF

