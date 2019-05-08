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
!MESSAGE NMAKE /f "Makefile.Security.mak" CFG="Win64 Debug"
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

GENERATED_DIRTY = "CSIC.inl" "CSIS.inl" "CSIC.h" "CSIC.cpp" "CSIIOPC.inl" "CSIIOPS.inl" "CSIIOPC.h" "CSIIOPC.cpp" "GSSUPC.inl" "GSSUPS.inl" "GSSUPC.h" "GSSUPC.cpp" "SecurityC.inl" "SecurityS.inl" "SecurityC.h" "SecurityS.h" "SecurityC.cpp" "SecurityS.cpp" "SecurityLevel1C.inl" "SecurityLevel1S.inl" "SecurityLevel1C.h" "SecurityLevel1S.h" "SecurityLevel1C.cpp" "SecurityLevel1S.cpp" "SecurityLevel2C.inl" "SecurityLevel2S.inl" "SecurityLevel2C.h" "SecurityLevel2S.h" "SecurityLevel2C.cpp" "SecurityLevel2S.cpp" "SecurityLevel3C.inl" "SecurityLevel3S.inl" "SecurityLevel3C.h" "SecurityLevel3C.cpp"

!IF  "$(CFG)" == "Win64 Debug"

OUTDIR=..\..\..\lib
INTDIR=Debug\Security\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_Securityd.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_SECURITY_BUILD_DLL -f "Makefile.Security.dep" "CSIC.cpp" "CSIIOPC.cpp" "GSSUPC.cpp" "SecurityC.cpp" "SecurityS.cpp" "SecurityLevel1C.cpp" "SecurityLevel1S.cpp" "SecurityLevel2C.cpp" "SecurityLevel2S.cpp" "SecurityLevel3C.cpp" "Security\SL2_SecurityManager.cpp" "Security\Security_Current_Impl.cpp" "Security\SL3_SecurityManager.cpp" "Security\Security_Current.cpp" "Security\SL2_EstablishTrustPolicy.cpp" "Security\SL3_ObjectCredentialsPolicy.cpp" "Security\SL3_CredentialsCurator.cpp" "Security\SL3_SecurityCurrent.cpp" "Security\CSI_Utils.cpp" "Security\SL2_QOPPolicy.cpp" "Security\SL3_CredentialsAcquirerFactory.cpp" "Security\Security_PolicyFactory.cpp" "Security\SL3_PolicyFactory.cpp" "Security\SL3_ContextEstablishmentPolicy.cpp" "Security\Security_ORBInitializer.cpp" "Security\SL3_SecurityCurrent_Impl.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_Securityd.pdb"
	-@del /f/q "..\..\..\lib\TAO_Securityd.dll"
	-@del /f/q "$(OUTDIR)\TAO_Securityd.lib"
	-@del /f/q "$(OUTDIR)\TAO_Securityd.exp"
	-@del /f/q "$(OUTDIR)\TAO_Securityd.ilk"
	-@del /f/q "CSIC.inl"
	-@del /f/q "CSIS.inl"
	-@del /f/q "CSIC.h"
	-@del /f/q "CSIC.cpp"
	-@del /f/q "CSIIOPC.inl"
	-@del /f/q "CSIIOPS.inl"
	-@del /f/q "CSIIOPC.h"
	-@del /f/q "CSIIOPC.cpp"
	-@del /f/q "GSSUPC.inl"
	-@del /f/q "GSSUPS.inl"
	-@del /f/q "GSSUPC.h"
	-@del /f/q "GSSUPC.cpp"
	-@del /f/q "SecurityC.inl"
	-@del /f/q "SecurityS.inl"
	-@del /f/q "SecurityC.h"
	-@del /f/q "SecurityS.h"
	-@del /f/q "SecurityC.cpp"
	-@del /f/q "SecurityS.cpp"
	-@del /f/q "SecurityLevel1C.inl"
	-@del /f/q "SecurityLevel1S.inl"
	-@del /f/q "SecurityLevel1C.h"
	-@del /f/q "SecurityLevel1S.h"
	-@del /f/q "SecurityLevel1C.cpp"
	-@del /f/q "SecurityLevel1S.cpp"
	-@del /f/q "SecurityLevel2C.inl"
	-@del /f/q "SecurityLevel2S.inl"
	-@del /f/q "SecurityLevel2C.h"
	-@del /f/q "SecurityLevel2S.h"
	-@del /f/q "SecurityLevel2C.cpp"
	-@del /f/q "SecurityLevel2S.cpp"
	-@del /f/q "SecurityLevel3C.inl"
	-@del /f/q "SecurityLevel3S.inl"
	-@del /f/q "SecurityLevel3C.h"
	-@del /f/q "SecurityLevel3C.cpp"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\Security\$(NULL)" mkdir "Debug\Security"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_SECURITY_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_PortableServerd.lib TAO_CodecFactoryd.lib TAO_PId.lib TAO_Valuetyped.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\..\lib\TAO_Securityd.pdb" /machine:IA64 /out:"..\..\..\lib\TAO_Securityd.dll" /implib:"$(OUTDIR)\TAO_Securityd.lib"
LINK32_OBJS= \
	"$(INTDIR)\Security.res" \
	"$(INTDIR)\CSIC.obj" \
	"$(INTDIR)\CSIIOPC.obj" \
	"$(INTDIR)\GSSUPC.obj" \
	"$(INTDIR)\SecurityC.obj" \
	"$(INTDIR)\SecurityS.obj" \
	"$(INTDIR)\SecurityLevel1C.obj" \
	"$(INTDIR)\SecurityLevel1S.obj" \
	"$(INTDIR)\SecurityLevel2C.obj" \
	"$(INTDIR)\SecurityLevel2S.obj" \
	"$(INTDIR)\SecurityLevel3C.obj" \
	"$(INTDIR)\Security\SL2_SecurityManager.obj" \
	"$(INTDIR)\Security\Security_Current_Impl.obj" \
	"$(INTDIR)\Security\SL3_SecurityManager.obj" \
	"$(INTDIR)\Security\Security_Current.obj" \
	"$(INTDIR)\Security\SL2_EstablishTrustPolicy.obj" \
	"$(INTDIR)\Security\SL3_ObjectCredentialsPolicy.obj" \
	"$(INTDIR)\Security\SL3_CredentialsCurator.obj" \
	"$(INTDIR)\Security\SL3_SecurityCurrent.obj" \
	"$(INTDIR)\Security\CSI_Utils.obj" \
	"$(INTDIR)\Security\SL2_QOPPolicy.obj" \
	"$(INTDIR)\Security\SL3_CredentialsAcquirerFactory.obj" \
	"$(INTDIR)\Security\Security_PolicyFactory.obj" \
	"$(INTDIR)\Security\SL3_PolicyFactory.obj" \
	"$(INTDIR)\Security\SL3_ContextEstablishmentPolicy.obj" \
	"$(INTDIR)\Security\Security_ORBInitializer.obj" \
	"$(INTDIR)\Security\SL3_SecurityCurrent_Impl.obj"

"..\..\..\lib\TAO_Securityd.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_Securityd.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_Securityd.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\Security\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_Security.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_SECURITY_BUILD_DLL -f "Makefile.Security.dep" "CSIC.cpp" "CSIIOPC.cpp" "GSSUPC.cpp" "SecurityC.cpp" "SecurityS.cpp" "SecurityLevel1C.cpp" "SecurityLevel1S.cpp" "SecurityLevel2C.cpp" "SecurityLevel2S.cpp" "SecurityLevel3C.cpp" "Security\SL2_SecurityManager.cpp" "Security\Security_Current_Impl.cpp" "Security\SL3_SecurityManager.cpp" "Security\Security_Current.cpp" "Security\SL2_EstablishTrustPolicy.cpp" "Security\SL3_ObjectCredentialsPolicy.cpp" "Security\SL3_CredentialsCurator.cpp" "Security\SL3_SecurityCurrent.cpp" "Security\CSI_Utils.cpp" "Security\SL2_QOPPolicy.cpp" "Security\SL3_CredentialsAcquirerFactory.cpp" "Security\Security_PolicyFactory.cpp" "Security\SL3_PolicyFactory.cpp" "Security\SL3_ContextEstablishmentPolicy.cpp" "Security\Security_ORBInitializer.cpp" "Security\SL3_SecurityCurrent_Impl.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\TAO_Security.dll"
	-@del /f/q "$(OUTDIR)\TAO_Security.lib"
	-@del /f/q "$(OUTDIR)\TAO_Security.exp"
	-@del /f/q "$(OUTDIR)\TAO_Security.ilk"
	-@del /f/q "CSIC.inl"
	-@del /f/q "CSIS.inl"
	-@del /f/q "CSIC.h"
	-@del /f/q "CSIC.cpp"
	-@del /f/q "CSIIOPC.inl"
	-@del /f/q "CSIIOPS.inl"
	-@del /f/q "CSIIOPC.h"
	-@del /f/q "CSIIOPC.cpp"
	-@del /f/q "GSSUPC.inl"
	-@del /f/q "GSSUPS.inl"
	-@del /f/q "GSSUPC.h"
	-@del /f/q "GSSUPC.cpp"
	-@del /f/q "SecurityC.inl"
	-@del /f/q "SecurityS.inl"
	-@del /f/q "SecurityC.h"
	-@del /f/q "SecurityS.h"
	-@del /f/q "SecurityC.cpp"
	-@del /f/q "SecurityS.cpp"
	-@del /f/q "SecurityLevel1C.inl"
	-@del /f/q "SecurityLevel1S.inl"
	-@del /f/q "SecurityLevel1C.h"
	-@del /f/q "SecurityLevel1S.h"
	-@del /f/q "SecurityLevel1C.cpp"
	-@del /f/q "SecurityLevel1S.cpp"
	-@del /f/q "SecurityLevel2C.inl"
	-@del /f/q "SecurityLevel2S.inl"
	-@del /f/q "SecurityLevel2C.h"
	-@del /f/q "SecurityLevel2S.h"
	-@del /f/q "SecurityLevel2C.cpp"
	-@del /f/q "SecurityLevel2S.cpp"
	-@del /f/q "SecurityLevel3C.inl"
	-@del /f/q "SecurityLevel3S.inl"
	-@del /f/q "SecurityLevel3C.h"
	-@del /f/q "SecurityLevel3C.cpp"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\Security\$(NULL)" mkdir "Release\Security"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_SECURITY_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_PortableServer.lib TAO_CodecFactory.lib TAO_PI.lib TAO_Valuetype.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\..\lib\TAO_Security.dll" /implib:"$(OUTDIR)\TAO_Security.lib"
LINK32_OBJS= \
	"$(INTDIR)\Security.res" \
	"$(INTDIR)\CSIC.obj" \
	"$(INTDIR)\CSIIOPC.obj" \
	"$(INTDIR)\GSSUPC.obj" \
	"$(INTDIR)\SecurityC.obj" \
	"$(INTDIR)\SecurityS.obj" \
	"$(INTDIR)\SecurityLevel1C.obj" \
	"$(INTDIR)\SecurityLevel1S.obj" \
	"$(INTDIR)\SecurityLevel2C.obj" \
	"$(INTDIR)\SecurityLevel2S.obj" \
	"$(INTDIR)\SecurityLevel3C.obj" \
	"$(INTDIR)\Security\SL2_SecurityManager.obj" \
	"$(INTDIR)\Security\Security_Current_Impl.obj" \
	"$(INTDIR)\Security\SL3_SecurityManager.obj" \
	"$(INTDIR)\Security\Security_Current.obj" \
	"$(INTDIR)\Security\SL2_EstablishTrustPolicy.obj" \
	"$(INTDIR)\Security\SL3_ObjectCredentialsPolicy.obj" \
	"$(INTDIR)\Security\SL3_CredentialsCurator.obj" \
	"$(INTDIR)\Security\SL3_SecurityCurrent.obj" \
	"$(INTDIR)\Security\CSI_Utils.obj" \
	"$(INTDIR)\Security\SL2_QOPPolicy.obj" \
	"$(INTDIR)\Security\SL3_CredentialsAcquirerFactory.obj" \
	"$(INTDIR)\Security\Security_PolicyFactory.obj" \
	"$(INTDIR)\Security\SL3_PolicyFactory.obj" \
	"$(INTDIR)\Security\SL3_ContextEstablishmentPolicy.obj" \
	"$(INTDIR)\Security\Security_ORBInitializer.obj" \
	"$(INTDIR)\Security\SL3_SecurityCurrent_Impl.obj"

"..\..\..\lib\TAO_Security.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_Security.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_Security.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\Security\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_Securitysd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.Security.dep" "CSIC.cpp" "CSIIOPC.cpp" "GSSUPC.cpp" "SecurityC.cpp" "SecurityS.cpp" "SecurityLevel1C.cpp" "SecurityLevel1S.cpp" "SecurityLevel2C.cpp" "SecurityLevel2S.cpp" "SecurityLevel3C.cpp" "Security\SL2_SecurityManager.cpp" "Security\Security_Current_Impl.cpp" "Security\SL3_SecurityManager.cpp" "Security\Security_Current.cpp" "Security\SL2_EstablishTrustPolicy.cpp" "Security\SL3_ObjectCredentialsPolicy.cpp" "Security\SL3_CredentialsCurator.cpp" "Security\SL3_SecurityCurrent.cpp" "Security\CSI_Utils.cpp" "Security\SL2_QOPPolicy.cpp" "Security\SL3_CredentialsAcquirerFactory.cpp" "Security\Security_PolicyFactory.cpp" "Security\SL3_PolicyFactory.cpp" "Security\SL3_ContextEstablishmentPolicy.cpp" "Security\Security_ORBInitializer.cpp" "Security\SL3_SecurityCurrent_Impl.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_Securitysd.lib"
	-@del /f/q "$(OUTDIR)\TAO_Securitysd.exp"
	-@del /f/q "$(OUTDIR)\TAO_Securitysd.ilk"
	-@del /f/q "..\..\..\lib\TAO_Securitysd.pdb"
	-@del /f/q "CSIC.inl"
	-@del /f/q "CSIS.inl"
	-@del /f/q "CSIC.h"
	-@del /f/q "CSIC.cpp"
	-@del /f/q "CSIIOPC.inl"
	-@del /f/q "CSIIOPS.inl"
	-@del /f/q "CSIIOPC.h"
	-@del /f/q "CSIIOPC.cpp"
	-@del /f/q "GSSUPC.inl"
	-@del /f/q "GSSUPS.inl"
	-@del /f/q "GSSUPC.h"
	-@del /f/q "GSSUPC.cpp"
	-@del /f/q "SecurityC.inl"
	-@del /f/q "SecurityS.inl"
	-@del /f/q "SecurityC.h"
	-@del /f/q "SecurityS.h"
	-@del /f/q "SecurityC.cpp"
	-@del /f/q "SecurityS.cpp"
	-@del /f/q "SecurityLevel1C.inl"
	-@del /f/q "SecurityLevel1S.inl"
	-@del /f/q "SecurityLevel1C.h"
	-@del /f/q "SecurityLevel1S.h"
	-@del /f/q "SecurityLevel1C.cpp"
	-@del /f/q "SecurityLevel1S.cpp"
	-@del /f/q "SecurityLevel2C.inl"
	-@del /f/q "SecurityLevel2S.inl"
	-@del /f/q "SecurityLevel2C.h"
	-@del /f/q "SecurityLevel2S.h"
	-@del /f/q "SecurityLevel2C.cpp"
	-@del /f/q "SecurityLevel2S.cpp"
	-@del /f/q "SecurityLevel3C.inl"
	-@del /f/q "SecurityLevel3S.inl"
	-@del /f/q "SecurityLevel3C.h"
	-@del /f/q "SecurityLevel3C.cpp"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\Security\$(NULL)" mkdir "Static_Debug\Security"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\TAO_Securitysd.pdb" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_Securitysd.lib"
LINK32_OBJS= \
	"$(INTDIR)\CSIC.obj" \
	"$(INTDIR)\CSIIOPC.obj" \
	"$(INTDIR)\GSSUPC.obj" \
	"$(INTDIR)\SecurityC.obj" \
	"$(INTDIR)\SecurityS.obj" \
	"$(INTDIR)\SecurityLevel1C.obj" \
	"$(INTDIR)\SecurityLevel1S.obj" \
	"$(INTDIR)\SecurityLevel2C.obj" \
	"$(INTDIR)\SecurityLevel2S.obj" \
	"$(INTDIR)\SecurityLevel3C.obj" \
	"$(INTDIR)\Security\SL2_SecurityManager.obj" \
	"$(INTDIR)\Security\Security_Current_Impl.obj" \
	"$(INTDIR)\Security\SL3_SecurityManager.obj" \
	"$(INTDIR)\Security\Security_Current.obj" \
	"$(INTDIR)\Security\SL2_EstablishTrustPolicy.obj" \
	"$(INTDIR)\Security\SL3_ObjectCredentialsPolicy.obj" \
	"$(INTDIR)\Security\SL3_CredentialsCurator.obj" \
	"$(INTDIR)\Security\SL3_SecurityCurrent.obj" \
	"$(INTDIR)\Security\CSI_Utils.obj" \
	"$(INTDIR)\Security\SL2_QOPPolicy.obj" \
	"$(INTDIR)\Security\SL3_CredentialsAcquirerFactory.obj" \
	"$(INTDIR)\Security\Security_PolicyFactory.obj" \
	"$(INTDIR)\Security\SL3_PolicyFactory.obj" \
	"$(INTDIR)\Security\SL3_ContextEstablishmentPolicy.obj" \
	"$(INTDIR)\Security\Security_ORBInitializer.obj" \
	"$(INTDIR)\Security\SL3_SecurityCurrent_Impl.obj"

"$(OUTDIR)\TAO_Securitysd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_Securitysd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_Securitysd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\Security\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_Securitys.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.Security.dep" "CSIC.cpp" "CSIIOPC.cpp" "GSSUPC.cpp" "SecurityC.cpp" "SecurityS.cpp" "SecurityLevel1C.cpp" "SecurityLevel1S.cpp" "SecurityLevel2C.cpp" "SecurityLevel2S.cpp" "SecurityLevel3C.cpp" "Security\SL2_SecurityManager.cpp" "Security\Security_Current_Impl.cpp" "Security\SL3_SecurityManager.cpp" "Security\Security_Current.cpp" "Security\SL2_EstablishTrustPolicy.cpp" "Security\SL3_ObjectCredentialsPolicy.cpp" "Security\SL3_CredentialsCurator.cpp" "Security\SL3_SecurityCurrent.cpp" "Security\CSI_Utils.cpp" "Security\SL2_QOPPolicy.cpp" "Security\SL3_CredentialsAcquirerFactory.cpp" "Security\Security_PolicyFactory.cpp" "Security\SL3_PolicyFactory.cpp" "Security\SL3_ContextEstablishmentPolicy.cpp" "Security\Security_ORBInitializer.cpp" "Security\SL3_SecurityCurrent_Impl.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_Securitys.lib"
	-@del /f/q "$(OUTDIR)\TAO_Securitys.exp"
	-@del /f/q "$(OUTDIR)\TAO_Securitys.ilk"
	-@del /f/q "CSIC.inl"
	-@del /f/q "CSIS.inl"
	-@del /f/q "CSIC.h"
	-@del /f/q "CSIC.cpp"
	-@del /f/q "CSIIOPC.inl"
	-@del /f/q "CSIIOPS.inl"
	-@del /f/q "CSIIOPC.h"
	-@del /f/q "CSIIOPC.cpp"
	-@del /f/q "GSSUPC.inl"
	-@del /f/q "GSSUPS.inl"
	-@del /f/q "GSSUPC.h"
	-@del /f/q "GSSUPC.cpp"
	-@del /f/q "SecurityC.inl"
	-@del /f/q "SecurityS.inl"
	-@del /f/q "SecurityC.h"
	-@del /f/q "SecurityS.h"
	-@del /f/q "SecurityC.cpp"
	-@del /f/q "SecurityS.cpp"
	-@del /f/q "SecurityLevel1C.inl"
	-@del /f/q "SecurityLevel1S.inl"
	-@del /f/q "SecurityLevel1C.h"
	-@del /f/q "SecurityLevel1S.h"
	-@del /f/q "SecurityLevel1C.cpp"
	-@del /f/q "SecurityLevel1S.cpp"
	-@del /f/q "SecurityLevel2C.inl"
	-@del /f/q "SecurityLevel2S.inl"
	-@del /f/q "SecurityLevel2C.h"
	-@del /f/q "SecurityLevel2S.h"
	-@del /f/q "SecurityLevel2C.cpp"
	-@del /f/q "SecurityLevel2S.cpp"
	-@del /f/q "SecurityLevel3C.inl"
	-@del /f/q "SecurityLevel3S.inl"
	-@del /f/q "SecurityLevel3C.h"
	-@del /f/q "SecurityLevel3C.cpp"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\Security\$(NULL)" mkdir "Static_Release\Security"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_Securitys.lib"
LINK32_OBJS= \
	"$(INTDIR)\CSIC.obj" \
	"$(INTDIR)\CSIIOPC.obj" \
	"$(INTDIR)\GSSUPC.obj" \
	"$(INTDIR)\SecurityC.obj" \
	"$(INTDIR)\SecurityS.obj" \
	"$(INTDIR)\SecurityLevel1C.obj" \
	"$(INTDIR)\SecurityLevel1S.obj" \
	"$(INTDIR)\SecurityLevel2C.obj" \
	"$(INTDIR)\SecurityLevel2S.obj" \
	"$(INTDIR)\SecurityLevel3C.obj" \
	"$(INTDIR)\Security\SL2_SecurityManager.obj" \
	"$(INTDIR)\Security\Security_Current_Impl.obj" \
	"$(INTDIR)\Security\SL3_SecurityManager.obj" \
	"$(INTDIR)\Security\Security_Current.obj" \
	"$(INTDIR)\Security\SL2_EstablishTrustPolicy.obj" \
	"$(INTDIR)\Security\SL3_ObjectCredentialsPolicy.obj" \
	"$(INTDIR)\Security\SL3_CredentialsCurator.obj" \
	"$(INTDIR)\Security\SL3_SecurityCurrent.obj" \
	"$(INTDIR)\Security\CSI_Utils.obj" \
	"$(INTDIR)\Security\SL2_QOPPolicy.obj" \
	"$(INTDIR)\Security\SL3_CredentialsAcquirerFactory.obj" \
	"$(INTDIR)\Security\Security_PolicyFactory.obj" \
	"$(INTDIR)\Security\SL3_PolicyFactory.obj" \
	"$(INTDIR)\Security\SL3_ContextEstablishmentPolicy.obj" \
	"$(INTDIR)\Security\Security_ORBInitializer.obj" \
	"$(INTDIR)\Security\SL3_SecurityCurrent_Impl.obj"

"$(OUTDIR)\TAO_Securitys.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_Securitys.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_Securitys.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.Security.dep")
!INCLUDE "Makefile.Security.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="CSIC.cpp"

"$(INTDIR)\CSIC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\CSIC.obj" $(SOURCE)

SOURCE="CSIIOPC.cpp"

"$(INTDIR)\CSIIOPC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\CSIIOPC.obj" $(SOURCE)

SOURCE="GSSUPC.cpp"

"$(INTDIR)\GSSUPC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\GSSUPC.obj" $(SOURCE)

SOURCE="SecurityC.cpp"

"$(INTDIR)\SecurityC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\SecurityC.obj" $(SOURCE)

SOURCE="SecurityS.cpp"

"$(INTDIR)\SecurityS.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\SecurityS.obj" $(SOURCE)

SOURCE="SecurityLevel1C.cpp"

"$(INTDIR)\SecurityLevel1C.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\SecurityLevel1C.obj" $(SOURCE)

SOURCE="SecurityLevel1S.cpp"

"$(INTDIR)\SecurityLevel1S.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\SecurityLevel1S.obj" $(SOURCE)

SOURCE="SecurityLevel2C.cpp"

"$(INTDIR)\SecurityLevel2C.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\SecurityLevel2C.obj" $(SOURCE)

SOURCE="SecurityLevel2S.cpp"

"$(INTDIR)\SecurityLevel2S.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\SecurityLevel2S.obj" $(SOURCE)

SOURCE="SecurityLevel3C.cpp"

"$(INTDIR)\SecurityLevel3C.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\SecurityLevel3C.obj" $(SOURCE)

SOURCE="Security\SL2_SecurityManager.cpp"

"$(INTDIR)\Security\SL2_SecurityManager.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Security\$(NULL)" mkdir "$(INTDIR)\Security\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Security\SL2_SecurityManager.obj" $(SOURCE)

SOURCE="Security\Security_Current_Impl.cpp"

"$(INTDIR)\Security\Security_Current_Impl.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Security\$(NULL)" mkdir "$(INTDIR)\Security\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Security\Security_Current_Impl.obj" $(SOURCE)

SOURCE="Security\SL3_SecurityManager.cpp"

"$(INTDIR)\Security\SL3_SecurityManager.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Security\$(NULL)" mkdir "$(INTDIR)\Security\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Security\SL3_SecurityManager.obj" $(SOURCE)

SOURCE="Security\Security_Current.cpp"

"$(INTDIR)\Security\Security_Current.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Security\$(NULL)" mkdir "$(INTDIR)\Security\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Security\Security_Current.obj" $(SOURCE)

SOURCE="Security\SL2_EstablishTrustPolicy.cpp"

"$(INTDIR)\Security\SL2_EstablishTrustPolicy.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Security\$(NULL)" mkdir "$(INTDIR)\Security\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Security\SL2_EstablishTrustPolicy.obj" $(SOURCE)

SOURCE="Security\SL3_ObjectCredentialsPolicy.cpp"

"$(INTDIR)\Security\SL3_ObjectCredentialsPolicy.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Security\$(NULL)" mkdir "$(INTDIR)\Security\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Security\SL3_ObjectCredentialsPolicy.obj" $(SOURCE)

SOURCE="Security\SL3_CredentialsCurator.cpp"

"$(INTDIR)\Security\SL3_CredentialsCurator.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Security\$(NULL)" mkdir "$(INTDIR)\Security\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Security\SL3_CredentialsCurator.obj" $(SOURCE)

SOURCE="Security\SL3_SecurityCurrent.cpp"

"$(INTDIR)\Security\SL3_SecurityCurrent.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Security\$(NULL)" mkdir "$(INTDIR)\Security\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Security\SL3_SecurityCurrent.obj" $(SOURCE)

SOURCE="Security\CSI_Utils.cpp"

"$(INTDIR)\Security\CSI_Utils.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Security\$(NULL)" mkdir "$(INTDIR)\Security\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Security\CSI_Utils.obj" $(SOURCE)

SOURCE="Security\SL2_QOPPolicy.cpp"

"$(INTDIR)\Security\SL2_QOPPolicy.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Security\$(NULL)" mkdir "$(INTDIR)\Security\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Security\SL2_QOPPolicy.obj" $(SOURCE)

SOURCE="Security\SL3_CredentialsAcquirerFactory.cpp"

"$(INTDIR)\Security\SL3_CredentialsAcquirerFactory.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Security\$(NULL)" mkdir "$(INTDIR)\Security\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Security\SL3_CredentialsAcquirerFactory.obj" $(SOURCE)

SOURCE="Security\Security_PolicyFactory.cpp"

"$(INTDIR)\Security\Security_PolicyFactory.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Security\$(NULL)" mkdir "$(INTDIR)\Security\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Security\Security_PolicyFactory.obj" $(SOURCE)

SOURCE="Security\SL3_PolicyFactory.cpp"

"$(INTDIR)\Security\SL3_PolicyFactory.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Security\$(NULL)" mkdir "$(INTDIR)\Security\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Security\SL3_PolicyFactory.obj" $(SOURCE)

SOURCE="Security\SL3_ContextEstablishmentPolicy.cpp"

"$(INTDIR)\Security\SL3_ContextEstablishmentPolicy.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Security\$(NULL)" mkdir "$(INTDIR)\Security\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Security\SL3_ContextEstablishmentPolicy.obj" $(SOURCE)

SOURCE="Security\Security_ORBInitializer.cpp"

"$(INTDIR)\Security\Security_ORBInitializer.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Security\$(NULL)" mkdir "$(INTDIR)\Security\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Security\Security_ORBInitializer.obj" $(SOURCE)

SOURCE="Security\SL3_SecurityCurrent_Impl.cpp"

"$(INTDIR)\Security\SL3_SecurityCurrent_Impl.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Security\$(NULL)" mkdir "$(INTDIR)\Security\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Security\SL3_SecurityCurrent_Impl.obj" $(SOURCE)

!IF  "$(CFG)" == "Win64 Debug"
SOURCE="CSI.idl"

InputPath=CSI.idl

"CSIC.inl" "CSIS.inl" "CSIC.h" "CSIC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-CSI_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_Security_Export -Wb,export_include=orbsvcs/Security/security_export.h "$(InputPath)"
<<

SOURCE="CSIIOP.idl"

InputPath=CSIIOP.idl

"CSIIOPC.inl" "CSIIOPS.inl" "CSIIOPC.h" "CSIIOPC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-CSIIOP_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_Security_Export -Wb,export_include=orbsvcs/Security/security_export.h "$(InputPath)"
<<

SOURCE="GSSUP.idl"

InputPath=GSSUP.idl

"GSSUPC.inl" "GSSUPS.inl" "GSSUPC.h" "GSSUPC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-GSSUP_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_Security_Export -Wb,export_include=orbsvcs/Security/security_export.h "$(InputPath)"
<<

SOURCE="Security.idl"

InputPath=Security.idl

"SecurityC.inl" "SecurityS.inl" "SecurityC.h" "SecurityS.h" "SecurityC.cpp" "SecurityS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-Security_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_Security_Export -Wb,export_include=orbsvcs/Security/security_export.h "$(InputPath)"
<<

SOURCE="SecurityLevel1.idl"

InputPath=SecurityLevel1.idl

"SecurityLevel1C.inl" "SecurityLevel1S.inl" "SecurityLevel1C.h" "SecurityLevel1S.h" "SecurityLevel1C.cpp" "SecurityLevel1S.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-SecurityLevel1_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_Security_Export -Wb,export_include=orbsvcs/Security/security_export.h "$(InputPath)"
<<

SOURCE="SecurityLevel2.idl"

InputPath=SecurityLevel2.idl

"SecurityLevel2C.inl" "SecurityLevel2S.inl" "SecurityLevel2C.h" "SecurityLevel2S.h" "SecurityLevel2C.cpp" "SecurityLevel2S.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-SecurityLevel2_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_Security_Export -Wb,export_include=orbsvcs/Security/security_export.h "$(InputPath)"
<<

SOURCE="SecurityLevel3.idl"

InputPath=SecurityLevel3.idl

"SecurityLevel3C.inl" "SecurityLevel3S.inl" "SecurityLevel3C.h" "SecurityLevel3C.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-SecurityLevel3_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_Security_Export -Wb,export_include=orbsvcs/Security/security_export.h "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Release"
SOURCE="CSI.idl"

InputPath=CSI.idl

"CSIC.inl" "CSIS.inl" "CSIC.h" "CSIC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-CSI_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_Security_Export -Wb,export_include=orbsvcs/Security/security_export.h "$(InputPath)"
<<

SOURCE="CSIIOP.idl"

InputPath=CSIIOP.idl

"CSIIOPC.inl" "CSIIOPS.inl" "CSIIOPC.h" "CSIIOPC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-CSIIOP_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_Security_Export -Wb,export_include=orbsvcs/Security/security_export.h "$(InputPath)"
<<

SOURCE="GSSUP.idl"

InputPath=GSSUP.idl

"GSSUPC.inl" "GSSUPS.inl" "GSSUPC.h" "GSSUPC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-GSSUP_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_Security_Export -Wb,export_include=orbsvcs/Security/security_export.h "$(InputPath)"
<<

SOURCE="Security.idl"

InputPath=Security.idl

"SecurityC.inl" "SecurityS.inl" "SecurityC.h" "SecurityS.h" "SecurityC.cpp" "SecurityS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-Security_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_Security_Export -Wb,export_include=orbsvcs/Security/security_export.h "$(InputPath)"
<<

SOURCE="SecurityLevel1.idl"

InputPath=SecurityLevel1.idl

"SecurityLevel1C.inl" "SecurityLevel1S.inl" "SecurityLevel1C.h" "SecurityLevel1S.h" "SecurityLevel1C.cpp" "SecurityLevel1S.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-SecurityLevel1_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_Security_Export -Wb,export_include=orbsvcs/Security/security_export.h "$(InputPath)"
<<

SOURCE="SecurityLevel2.idl"

InputPath=SecurityLevel2.idl

"SecurityLevel2C.inl" "SecurityLevel2S.inl" "SecurityLevel2C.h" "SecurityLevel2S.h" "SecurityLevel2C.cpp" "SecurityLevel2S.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-SecurityLevel2_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_Security_Export -Wb,export_include=orbsvcs/Security/security_export.h "$(InputPath)"
<<

SOURCE="SecurityLevel3.idl"

InputPath=SecurityLevel3.idl

"SecurityLevel3C.inl" "SecurityLevel3S.inl" "SecurityLevel3C.h" "SecurityLevel3C.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-SecurityLevel3_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_Security_Export -Wb,export_include=orbsvcs/Security/security_export.h "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Debug"
SOURCE="CSI.idl"

InputPath=CSI.idl

"CSIC.inl" "CSIS.inl" "CSIC.h" "CSIC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-CSI_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_Security_Export -Wb,export_include=orbsvcs/Security/security_export.h "$(InputPath)"
<<

SOURCE="CSIIOP.idl"

InputPath=CSIIOP.idl

"CSIIOPC.inl" "CSIIOPS.inl" "CSIIOPC.h" "CSIIOPC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-CSIIOP_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_Security_Export -Wb,export_include=orbsvcs/Security/security_export.h "$(InputPath)"
<<

SOURCE="GSSUP.idl"

InputPath=GSSUP.idl

"GSSUPC.inl" "GSSUPS.inl" "GSSUPC.h" "GSSUPC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-GSSUP_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_Security_Export -Wb,export_include=orbsvcs/Security/security_export.h "$(InputPath)"
<<

SOURCE="Security.idl"

InputPath=Security.idl

"SecurityC.inl" "SecurityS.inl" "SecurityC.h" "SecurityS.h" "SecurityC.cpp" "SecurityS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-Security_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_Security_Export -Wb,export_include=orbsvcs/Security/security_export.h "$(InputPath)"
<<

SOURCE="SecurityLevel1.idl"

InputPath=SecurityLevel1.idl

"SecurityLevel1C.inl" "SecurityLevel1S.inl" "SecurityLevel1C.h" "SecurityLevel1S.h" "SecurityLevel1C.cpp" "SecurityLevel1S.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-SecurityLevel1_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_Security_Export -Wb,export_include=orbsvcs/Security/security_export.h "$(InputPath)"
<<

SOURCE="SecurityLevel2.idl"

InputPath=SecurityLevel2.idl

"SecurityLevel2C.inl" "SecurityLevel2S.inl" "SecurityLevel2C.h" "SecurityLevel2S.h" "SecurityLevel2C.cpp" "SecurityLevel2S.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-SecurityLevel2_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_Security_Export -Wb,export_include=orbsvcs/Security/security_export.h "$(InputPath)"
<<

SOURCE="SecurityLevel3.idl"

InputPath=SecurityLevel3.idl

"SecurityLevel3C.inl" "SecurityLevel3S.inl" "SecurityLevel3C.h" "SecurityLevel3C.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-SecurityLevel3_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_Security_Export -Wb,export_include=orbsvcs/Security/security_export.h "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Release"
SOURCE="CSI.idl"

InputPath=CSI.idl

"CSIC.inl" "CSIS.inl" "CSIC.h" "CSIC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-CSI_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_Security_Export -Wb,export_include=orbsvcs/Security/security_export.h "$(InputPath)"
<<

SOURCE="CSIIOP.idl"

InputPath=CSIIOP.idl

"CSIIOPC.inl" "CSIIOPS.inl" "CSIIOPC.h" "CSIIOPC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-CSIIOP_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_Security_Export -Wb,export_include=orbsvcs/Security/security_export.h "$(InputPath)"
<<

SOURCE="GSSUP.idl"

InputPath=GSSUP.idl

"GSSUPC.inl" "GSSUPS.inl" "GSSUPC.h" "GSSUPC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-GSSUP_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_Security_Export -Wb,export_include=orbsvcs/Security/security_export.h "$(InputPath)"
<<

SOURCE="Security.idl"

InputPath=Security.idl

"SecurityC.inl" "SecurityS.inl" "SecurityC.h" "SecurityS.h" "SecurityC.cpp" "SecurityS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-Security_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_Security_Export -Wb,export_include=orbsvcs/Security/security_export.h "$(InputPath)"
<<

SOURCE="SecurityLevel1.idl"

InputPath=SecurityLevel1.idl

"SecurityLevel1C.inl" "SecurityLevel1S.inl" "SecurityLevel1C.h" "SecurityLevel1S.h" "SecurityLevel1C.cpp" "SecurityLevel1S.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-SecurityLevel1_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_Security_Export -Wb,export_include=orbsvcs/Security/security_export.h "$(InputPath)"
<<

SOURCE="SecurityLevel2.idl"

InputPath=SecurityLevel2.idl

"SecurityLevel2C.inl" "SecurityLevel2S.inl" "SecurityLevel2C.h" "SecurityLevel2S.h" "SecurityLevel2C.cpp" "SecurityLevel2S.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-SecurityLevel2_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_Security_Export -Wb,export_include=orbsvcs/Security/security_export.h "$(InputPath)"
<<

SOURCE="SecurityLevel3.idl"

InputPath=SecurityLevel3.idl

"SecurityLevel3C.inl" "SecurityLevel3S.inl" "SecurityLevel3C.h" "SecurityLevel3C.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-SecurityLevel3_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_Security_Export -Wb,export_include=orbsvcs/Security/security_export.h "$(InputPath)"
<<

!ENDIF

SOURCE="Security.rc"

"$(INTDIR)\Security.res" : $(SOURCE)
	$(RSC) /l 0x409 /fo"$(INTDIR)\Security.res" /d NDEBUG /d WIN64 /d _CRT_SECURE_NO_WARNINGS /d _CRT_SECURE_NO_DEPRECATE /d _CRT_NONSTDC_NO_DEPRECATE /i "..\..\.." /i "..\.." /i "..\..\orbsvcs" $(SOURCE)



!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.Security.dep")
	@echo Using "Makefile.Security.dep"
!ELSE
	@echo Warning: cannot find "Makefile.Security.dep"
!ENDIF
!ENDIF

