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
!MESSAGE NMAKE /f "Makefile.PortableServer_Idl.mak" CFG="Win64 Debug"
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

GENERATED_DIRTY = "ForwardRequestC.h" "ForwardRequestS.h" "ForwardRequestA.h" "ForwardRequestC.cpp" "ForwardRequestA.cpp" "AdapterActivatorC.h" "AdapterActivatorS.h" "AdapterActivatorA.h" "AdapterActivatorC.cpp" "AdapterActivatorA.cpp" "IdAssignmentPolicyC.h" "IdAssignmentPolicyS.h" "IdAssignmentPolicyA.h" "IdAssignmentPolicyC.cpp" "IdAssignmentPolicyA.cpp" "IdUniquenessPolicyC.h" "IdUniquenessPolicyS.h" "IdUniquenessPolicyA.h" "IdUniquenessPolicyC.cpp" "IdUniquenessPolicyA.cpp" "ImplicitActivationPolicyC.h" "ImplicitActivationPolicyS.h" "ImplicitActivationPolicyA.h" "ImplicitActivationPolicyC.cpp" "ImplicitActivationPolicyA.cpp" "LifespanPolicyC.h" "LifespanPolicyS.h" "LifespanPolicyA.h" "LifespanPolicyC.cpp" "LifespanPolicyA.cpp" "RequestProcessingPolicyC.h" "RequestProcessingPolicyS.h" "RequestProcessingPolicyA.h" "RequestProcessingPolicyC.cpp" "RequestProcessingPolicyA.cpp" "ServantActivatorC.h" "ServantActivatorS.h" "ServantActivatorA.h" "ServantActivatorC.cpp" "ServantActivatorA.cpp" "ServantLocatorC.h" "ServantLocatorS.h" "ServantLocatorA.h" "ServantLocatorC.cpp" "ServantLocatorA.cpp" "ServantManagerC.h" "ServantManagerS.h" "ServantManagerA.h" "ServantManagerC.cpp" "ServantManagerA.cpp" "ServantRetentionPolicyC.h" "ServantRetentionPolicyS.h" "ServantRetentionPolicyA.h" "ServantRetentionPolicyC.cpp" "ServantRetentionPolicyA.cpp" "ThreadPolicyC.h" "ThreadPolicyS.h" "ThreadPolicyA.h" "ThreadPolicyC.cpp" "ThreadPolicyA.cpp" "POAManagerC.h" "POAManagerS.h" "POAManagerC.cpp" "POAManagerFactoryC.h" "POAManagerFactoryS.h" "POAManagerFactoryC.cpp" "POAC.h" "POAS.h" "POAC.cpp" "PS_CurrentC.h" "PS_CurrentS.h" "PS_CurrentC.cpp" "PortableServer_includeC.h" "PortableServer_includeS.h" "PortableServer_includeA.h" "PortableServer_includeC.cpp" "PortableServerC.h" "PortableServerS.h" "PortableServerA.h" "PortableServerC.cpp"

!IF  "$(CFG)" == "Win64 Debug"

OUTDIR=.
INTDIR=Debug\PortableServer_Idl\IA64

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
	-@del /f/q "ForwardRequestC.h"
	-@del /f/q "ForwardRequestS.h"
	-@del /f/q "ForwardRequestA.h"
	-@del /f/q "ForwardRequestC.cpp"
	-@del /f/q "ForwardRequestA.cpp"
	-@del /f/q "AdapterActivatorC.h"
	-@del /f/q "AdapterActivatorS.h"
	-@del /f/q "AdapterActivatorA.h"
	-@del /f/q "AdapterActivatorC.cpp"
	-@del /f/q "AdapterActivatorA.cpp"
	-@del /f/q "IdAssignmentPolicyC.h"
	-@del /f/q "IdAssignmentPolicyS.h"
	-@del /f/q "IdAssignmentPolicyA.h"
	-@del /f/q "IdAssignmentPolicyC.cpp"
	-@del /f/q "IdAssignmentPolicyA.cpp"
	-@del /f/q "IdUniquenessPolicyC.h"
	-@del /f/q "IdUniquenessPolicyS.h"
	-@del /f/q "IdUniquenessPolicyA.h"
	-@del /f/q "IdUniquenessPolicyC.cpp"
	-@del /f/q "IdUniquenessPolicyA.cpp"
	-@del /f/q "ImplicitActivationPolicyC.h"
	-@del /f/q "ImplicitActivationPolicyS.h"
	-@del /f/q "ImplicitActivationPolicyA.h"
	-@del /f/q "ImplicitActivationPolicyC.cpp"
	-@del /f/q "ImplicitActivationPolicyA.cpp"
	-@del /f/q "LifespanPolicyC.h"
	-@del /f/q "LifespanPolicyS.h"
	-@del /f/q "LifespanPolicyA.h"
	-@del /f/q "LifespanPolicyC.cpp"
	-@del /f/q "LifespanPolicyA.cpp"
	-@del /f/q "RequestProcessingPolicyC.h"
	-@del /f/q "RequestProcessingPolicyS.h"
	-@del /f/q "RequestProcessingPolicyA.h"
	-@del /f/q "RequestProcessingPolicyC.cpp"
	-@del /f/q "RequestProcessingPolicyA.cpp"
	-@del /f/q "ServantActivatorC.h"
	-@del /f/q "ServantActivatorS.h"
	-@del /f/q "ServantActivatorA.h"
	-@del /f/q "ServantActivatorC.cpp"
	-@del /f/q "ServantActivatorA.cpp"
	-@del /f/q "ServantLocatorC.h"
	-@del /f/q "ServantLocatorS.h"
	-@del /f/q "ServantLocatorA.h"
	-@del /f/q "ServantLocatorC.cpp"
	-@del /f/q "ServantLocatorA.cpp"
	-@del /f/q "ServantManagerC.h"
	-@del /f/q "ServantManagerS.h"
	-@del /f/q "ServantManagerA.h"
	-@del /f/q "ServantManagerC.cpp"
	-@del /f/q "ServantManagerA.cpp"
	-@del /f/q "ServantRetentionPolicyC.h"
	-@del /f/q "ServantRetentionPolicyS.h"
	-@del /f/q "ServantRetentionPolicyA.h"
	-@del /f/q "ServantRetentionPolicyC.cpp"
	-@del /f/q "ServantRetentionPolicyA.cpp"
	-@del /f/q "ThreadPolicyC.h"
	-@del /f/q "ThreadPolicyS.h"
	-@del /f/q "ThreadPolicyA.h"
	-@del /f/q "ThreadPolicyC.cpp"
	-@del /f/q "ThreadPolicyA.cpp"
	-@del /f/q "POAManagerC.h"
	-@del /f/q "POAManagerS.h"
	-@del /f/q "POAManagerC.cpp"
	-@del /f/q "POAManagerFactoryC.h"
	-@del /f/q "POAManagerFactoryS.h"
	-@del /f/q "POAManagerFactoryC.cpp"
	-@del /f/q "POAC.h"
	-@del /f/q "POAS.h"
	-@del /f/q "POAC.cpp"
	-@del /f/q "PS_CurrentC.h"
	-@del /f/q "PS_CurrentS.h"
	-@del /f/q "PS_CurrentC.cpp"
	-@del /f/q "PortableServer_includeC.h"
	-@del /f/q "PortableServer_includeS.h"
	-@del /f/q "PortableServer_includeA.h"
	-@del /f/q "PortableServer_includeC.cpp"
	-@del /f/q "PortableServerC.h"
	-@del /f/q "PortableServerS.h"
	-@del /f/q "PortableServerA.h"
	-@del /f/q "PortableServerC.cpp"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\PortableServer_Idl\$(NULL)" mkdir "Debug\PortableServer_Idl"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /Fd"$(INTDIR)/" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe


!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=.
INTDIR=Release\PortableServer_Idl\IA64

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
	-@del /f/q "ForwardRequestC.h"
	-@del /f/q "ForwardRequestS.h"
	-@del /f/q "ForwardRequestA.h"
	-@del /f/q "ForwardRequestC.cpp"
	-@del /f/q "ForwardRequestA.cpp"
	-@del /f/q "AdapterActivatorC.h"
	-@del /f/q "AdapterActivatorS.h"
	-@del /f/q "AdapterActivatorA.h"
	-@del /f/q "AdapterActivatorC.cpp"
	-@del /f/q "AdapterActivatorA.cpp"
	-@del /f/q "IdAssignmentPolicyC.h"
	-@del /f/q "IdAssignmentPolicyS.h"
	-@del /f/q "IdAssignmentPolicyA.h"
	-@del /f/q "IdAssignmentPolicyC.cpp"
	-@del /f/q "IdAssignmentPolicyA.cpp"
	-@del /f/q "IdUniquenessPolicyC.h"
	-@del /f/q "IdUniquenessPolicyS.h"
	-@del /f/q "IdUniquenessPolicyA.h"
	-@del /f/q "IdUniquenessPolicyC.cpp"
	-@del /f/q "IdUniquenessPolicyA.cpp"
	-@del /f/q "ImplicitActivationPolicyC.h"
	-@del /f/q "ImplicitActivationPolicyS.h"
	-@del /f/q "ImplicitActivationPolicyA.h"
	-@del /f/q "ImplicitActivationPolicyC.cpp"
	-@del /f/q "ImplicitActivationPolicyA.cpp"
	-@del /f/q "LifespanPolicyC.h"
	-@del /f/q "LifespanPolicyS.h"
	-@del /f/q "LifespanPolicyA.h"
	-@del /f/q "LifespanPolicyC.cpp"
	-@del /f/q "LifespanPolicyA.cpp"
	-@del /f/q "RequestProcessingPolicyC.h"
	-@del /f/q "RequestProcessingPolicyS.h"
	-@del /f/q "RequestProcessingPolicyA.h"
	-@del /f/q "RequestProcessingPolicyC.cpp"
	-@del /f/q "RequestProcessingPolicyA.cpp"
	-@del /f/q "ServantActivatorC.h"
	-@del /f/q "ServantActivatorS.h"
	-@del /f/q "ServantActivatorA.h"
	-@del /f/q "ServantActivatorC.cpp"
	-@del /f/q "ServantActivatorA.cpp"
	-@del /f/q "ServantLocatorC.h"
	-@del /f/q "ServantLocatorS.h"
	-@del /f/q "ServantLocatorA.h"
	-@del /f/q "ServantLocatorC.cpp"
	-@del /f/q "ServantLocatorA.cpp"
	-@del /f/q "ServantManagerC.h"
	-@del /f/q "ServantManagerS.h"
	-@del /f/q "ServantManagerA.h"
	-@del /f/q "ServantManagerC.cpp"
	-@del /f/q "ServantManagerA.cpp"
	-@del /f/q "ServantRetentionPolicyC.h"
	-@del /f/q "ServantRetentionPolicyS.h"
	-@del /f/q "ServantRetentionPolicyA.h"
	-@del /f/q "ServantRetentionPolicyC.cpp"
	-@del /f/q "ServantRetentionPolicyA.cpp"
	-@del /f/q "ThreadPolicyC.h"
	-@del /f/q "ThreadPolicyS.h"
	-@del /f/q "ThreadPolicyA.h"
	-@del /f/q "ThreadPolicyC.cpp"
	-@del /f/q "ThreadPolicyA.cpp"
	-@del /f/q "POAManagerC.h"
	-@del /f/q "POAManagerS.h"
	-@del /f/q "POAManagerC.cpp"
	-@del /f/q "POAManagerFactoryC.h"
	-@del /f/q "POAManagerFactoryS.h"
	-@del /f/q "POAManagerFactoryC.cpp"
	-@del /f/q "POAC.h"
	-@del /f/q "POAS.h"
	-@del /f/q "POAC.cpp"
	-@del /f/q "PS_CurrentC.h"
	-@del /f/q "PS_CurrentS.h"
	-@del /f/q "PS_CurrentC.cpp"
	-@del /f/q "PortableServer_includeC.h"
	-@del /f/q "PortableServer_includeS.h"
	-@del /f/q "PortableServer_includeA.h"
	-@del /f/q "PortableServer_includeC.cpp"
	-@del /f/q "PortableServerC.h"
	-@del /f/q "PortableServerS.h"
	-@del /f/q "PortableServerA.h"
	-@del /f/q "PortableServerC.cpp"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\PortableServer_Idl\$(NULL)" mkdir "Release\PortableServer_Idl"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe


!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=.
INTDIR=Static_Debug\PortableServer_Idl\IA64

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
	-@del /f/q "ForwardRequestC.h"
	-@del /f/q "ForwardRequestS.h"
	-@del /f/q "ForwardRequestA.h"
	-@del /f/q "ForwardRequestC.cpp"
	-@del /f/q "ForwardRequestA.cpp"
	-@del /f/q "AdapterActivatorC.h"
	-@del /f/q "AdapterActivatorS.h"
	-@del /f/q "AdapterActivatorA.h"
	-@del /f/q "AdapterActivatorC.cpp"
	-@del /f/q "AdapterActivatorA.cpp"
	-@del /f/q "IdAssignmentPolicyC.h"
	-@del /f/q "IdAssignmentPolicyS.h"
	-@del /f/q "IdAssignmentPolicyA.h"
	-@del /f/q "IdAssignmentPolicyC.cpp"
	-@del /f/q "IdAssignmentPolicyA.cpp"
	-@del /f/q "IdUniquenessPolicyC.h"
	-@del /f/q "IdUniquenessPolicyS.h"
	-@del /f/q "IdUniquenessPolicyA.h"
	-@del /f/q "IdUniquenessPolicyC.cpp"
	-@del /f/q "IdUniquenessPolicyA.cpp"
	-@del /f/q "ImplicitActivationPolicyC.h"
	-@del /f/q "ImplicitActivationPolicyS.h"
	-@del /f/q "ImplicitActivationPolicyA.h"
	-@del /f/q "ImplicitActivationPolicyC.cpp"
	-@del /f/q "ImplicitActivationPolicyA.cpp"
	-@del /f/q "LifespanPolicyC.h"
	-@del /f/q "LifespanPolicyS.h"
	-@del /f/q "LifespanPolicyA.h"
	-@del /f/q "LifespanPolicyC.cpp"
	-@del /f/q "LifespanPolicyA.cpp"
	-@del /f/q "RequestProcessingPolicyC.h"
	-@del /f/q "RequestProcessingPolicyS.h"
	-@del /f/q "RequestProcessingPolicyA.h"
	-@del /f/q "RequestProcessingPolicyC.cpp"
	-@del /f/q "RequestProcessingPolicyA.cpp"
	-@del /f/q "ServantActivatorC.h"
	-@del /f/q "ServantActivatorS.h"
	-@del /f/q "ServantActivatorA.h"
	-@del /f/q "ServantActivatorC.cpp"
	-@del /f/q "ServantActivatorA.cpp"
	-@del /f/q "ServantLocatorC.h"
	-@del /f/q "ServantLocatorS.h"
	-@del /f/q "ServantLocatorA.h"
	-@del /f/q "ServantLocatorC.cpp"
	-@del /f/q "ServantLocatorA.cpp"
	-@del /f/q "ServantManagerC.h"
	-@del /f/q "ServantManagerS.h"
	-@del /f/q "ServantManagerA.h"
	-@del /f/q "ServantManagerC.cpp"
	-@del /f/q "ServantManagerA.cpp"
	-@del /f/q "ServantRetentionPolicyC.h"
	-@del /f/q "ServantRetentionPolicyS.h"
	-@del /f/q "ServantRetentionPolicyA.h"
	-@del /f/q "ServantRetentionPolicyC.cpp"
	-@del /f/q "ServantRetentionPolicyA.cpp"
	-@del /f/q "ThreadPolicyC.h"
	-@del /f/q "ThreadPolicyS.h"
	-@del /f/q "ThreadPolicyA.h"
	-@del /f/q "ThreadPolicyC.cpp"
	-@del /f/q "ThreadPolicyA.cpp"
	-@del /f/q "POAManagerC.h"
	-@del /f/q "POAManagerS.h"
	-@del /f/q "POAManagerC.cpp"
	-@del /f/q "POAManagerFactoryC.h"
	-@del /f/q "POAManagerFactoryS.h"
	-@del /f/q "POAManagerFactoryC.cpp"
	-@del /f/q "POAC.h"
	-@del /f/q "POAS.h"
	-@del /f/q "POAC.cpp"
	-@del /f/q "PS_CurrentC.h"
	-@del /f/q "PS_CurrentS.h"
	-@del /f/q "PS_CurrentC.cpp"
	-@del /f/q "PortableServer_includeC.h"
	-@del /f/q "PortableServer_includeS.h"
	-@del /f/q "PortableServer_includeA.h"
	-@del /f/q "PortableServer_includeC.cpp"
	-@del /f/q "PortableServerC.h"
	-@del /f/q "PortableServerS.h"
	-@del /f/q "PortableServerA.h"
	-@del /f/q "PortableServerC.cpp"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\PortableServer_Idl\$(NULL)" mkdir "Static_Debug\PortableServer_Idl"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /Fd".\sd.pdb" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"



!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=.
INTDIR=Static_Release\PortableServer_Idl\IA64

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
	-@del /f/q "ForwardRequestC.h"
	-@del /f/q "ForwardRequestS.h"
	-@del /f/q "ForwardRequestA.h"
	-@del /f/q "ForwardRequestC.cpp"
	-@del /f/q "ForwardRequestA.cpp"
	-@del /f/q "AdapterActivatorC.h"
	-@del /f/q "AdapterActivatorS.h"
	-@del /f/q "AdapterActivatorA.h"
	-@del /f/q "AdapterActivatorC.cpp"
	-@del /f/q "AdapterActivatorA.cpp"
	-@del /f/q "IdAssignmentPolicyC.h"
	-@del /f/q "IdAssignmentPolicyS.h"
	-@del /f/q "IdAssignmentPolicyA.h"
	-@del /f/q "IdAssignmentPolicyC.cpp"
	-@del /f/q "IdAssignmentPolicyA.cpp"
	-@del /f/q "IdUniquenessPolicyC.h"
	-@del /f/q "IdUniquenessPolicyS.h"
	-@del /f/q "IdUniquenessPolicyA.h"
	-@del /f/q "IdUniquenessPolicyC.cpp"
	-@del /f/q "IdUniquenessPolicyA.cpp"
	-@del /f/q "ImplicitActivationPolicyC.h"
	-@del /f/q "ImplicitActivationPolicyS.h"
	-@del /f/q "ImplicitActivationPolicyA.h"
	-@del /f/q "ImplicitActivationPolicyC.cpp"
	-@del /f/q "ImplicitActivationPolicyA.cpp"
	-@del /f/q "LifespanPolicyC.h"
	-@del /f/q "LifespanPolicyS.h"
	-@del /f/q "LifespanPolicyA.h"
	-@del /f/q "LifespanPolicyC.cpp"
	-@del /f/q "LifespanPolicyA.cpp"
	-@del /f/q "RequestProcessingPolicyC.h"
	-@del /f/q "RequestProcessingPolicyS.h"
	-@del /f/q "RequestProcessingPolicyA.h"
	-@del /f/q "RequestProcessingPolicyC.cpp"
	-@del /f/q "RequestProcessingPolicyA.cpp"
	-@del /f/q "ServantActivatorC.h"
	-@del /f/q "ServantActivatorS.h"
	-@del /f/q "ServantActivatorA.h"
	-@del /f/q "ServantActivatorC.cpp"
	-@del /f/q "ServantActivatorA.cpp"
	-@del /f/q "ServantLocatorC.h"
	-@del /f/q "ServantLocatorS.h"
	-@del /f/q "ServantLocatorA.h"
	-@del /f/q "ServantLocatorC.cpp"
	-@del /f/q "ServantLocatorA.cpp"
	-@del /f/q "ServantManagerC.h"
	-@del /f/q "ServantManagerS.h"
	-@del /f/q "ServantManagerA.h"
	-@del /f/q "ServantManagerC.cpp"
	-@del /f/q "ServantManagerA.cpp"
	-@del /f/q "ServantRetentionPolicyC.h"
	-@del /f/q "ServantRetentionPolicyS.h"
	-@del /f/q "ServantRetentionPolicyA.h"
	-@del /f/q "ServantRetentionPolicyC.cpp"
	-@del /f/q "ServantRetentionPolicyA.cpp"
	-@del /f/q "ThreadPolicyC.h"
	-@del /f/q "ThreadPolicyS.h"
	-@del /f/q "ThreadPolicyA.h"
	-@del /f/q "ThreadPolicyC.cpp"
	-@del /f/q "ThreadPolicyA.cpp"
	-@del /f/q "POAManagerC.h"
	-@del /f/q "POAManagerS.h"
	-@del /f/q "POAManagerC.cpp"
	-@del /f/q "POAManagerFactoryC.h"
	-@del /f/q "POAManagerFactoryS.h"
	-@del /f/q "POAManagerFactoryC.cpp"
	-@del /f/q "POAC.h"
	-@del /f/q "POAS.h"
	-@del /f/q "POAC.cpp"
	-@del /f/q "PS_CurrentC.h"
	-@del /f/q "PS_CurrentS.h"
	-@del /f/q "PS_CurrentC.cpp"
	-@del /f/q "PortableServer_includeC.h"
	-@del /f/q "PortableServer_includeS.h"
	-@del /f/q "PortableServer_includeA.h"
	-@del /f/q "PortableServer_includeC.cpp"
	-@del /f/q "PortableServerC.h"
	-@del /f/q "PortableServerS.h"
	-@del /f/q "PortableServerA.h"
	-@del /f/q "PortableServerC.cpp"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\PortableServer_Idl\$(NULL)" mkdir "Static_Release\PortableServer_Idl"
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
!IF EXISTS("Makefile.PortableServer_Idl.dep")
!INCLUDE "Makefile.PortableServer_Idl.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
!IF  "$(CFG)" == "Win64 Debug"
SOURCE="ForwardRequest.pidl"

InputPath=ForwardRequest.pidl

"ForwardRequestC.h" "ForwardRequestS.h" "ForwardRequestA.h" "ForwardRequestC.cpp" "ForwardRequestA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-ForwardRequest_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -GA -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="AdapterActivator.pidl"

InputPath=AdapterActivator.pidl

"AdapterActivatorC.h" "AdapterActivatorS.h" "AdapterActivatorA.h" "AdapterActivatorC.cpp" "AdapterActivatorA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-AdapterActivator_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -GA -Sal -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="IdAssignmentPolicy.pidl"

InputPath=IdAssignmentPolicy.pidl

"IdAssignmentPolicyC.h" "IdAssignmentPolicyS.h" "IdAssignmentPolicyA.h" "IdAssignmentPolicyC.cpp" "IdAssignmentPolicyA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-IdAssignmentPolicy_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -GA -Sal -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="IdUniquenessPolicy.pidl"

InputPath=IdUniquenessPolicy.pidl

"IdUniquenessPolicyC.h" "IdUniquenessPolicyS.h" "IdUniquenessPolicyA.h" "IdUniquenessPolicyC.cpp" "IdUniquenessPolicyA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-IdUniquenessPolicy_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -GA -Sal -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="ImplicitActivationPolicy.pidl"

InputPath=ImplicitActivationPolicy.pidl

"ImplicitActivationPolicyC.h" "ImplicitActivationPolicyS.h" "ImplicitActivationPolicyA.h" "ImplicitActivationPolicyC.cpp" "ImplicitActivationPolicyA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-ImplicitActivationPolicy_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -GA -Sal -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="LifespanPolicy.pidl"

InputPath=LifespanPolicy.pidl

"LifespanPolicyC.h" "LifespanPolicyS.h" "LifespanPolicyA.h" "LifespanPolicyC.cpp" "LifespanPolicyA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-LifespanPolicy_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -GA -Sal -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="RequestProcessingPolicy.pidl"

InputPath=RequestProcessingPolicy.pidl

"RequestProcessingPolicyC.h" "RequestProcessingPolicyS.h" "RequestProcessingPolicyA.h" "RequestProcessingPolicyC.cpp" "RequestProcessingPolicyA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-RequestProcessingPolicy_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -GA -Sal -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="ServantActivator.pidl"

InputPath=ServantActivator.pidl

"ServantActivatorC.h" "ServantActivatorS.h" "ServantActivatorA.h" "ServantActivatorC.cpp" "ServantActivatorA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-ServantActivator_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -GA -Sal -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="ServantLocator.pidl"

InputPath=ServantLocator.pidl

"ServantLocatorC.h" "ServantLocatorS.h" "ServantLocatorA.h" "ServantLocatorC.cpp" "ServantLocatorA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-ServantLocator_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -GA -Sal -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="ServantManager.pidl"

InputPath=ServantManager.pidl

"ServantManagerC.h" "ServantManagerS.h" "ServantManagerA.h" "ServantManagerC.cpp" "ServantManagerA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-ServantManager_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -GA -Sal -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="ServantRetentionPolicy.pidl"

InputPath=ServantRetentionPolicy.pidl

"ServantRetentionPolicyC.h" "ServantRetentionPolicyS.h" "ServantRetentionPolicyA.h" "ServantRetentionPolicyC.cpp" "ServantRetentionPolicyA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-ServantRetentionPolicy_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -GA -Sal -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="ThreadPolicy.pidl"

InputPath=ThreadPolicy.pidl

"ThreadPolicyC.h" "ThreadPolicyS.h" "ThreadPolicyA.h" "ThreadPolicyC.cpp" "ThreadPolicyA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-ThreadPolicy_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -GA -Sal -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="POAManager.pidl"

InputPath=POAManager.pidl

"POAManagerC.h" "POAManagerS.h" "POAManagerC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-POAManager_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="POAManagerFactory.pidl"

InputPath=POAManagerFactory.pidl

"POAManagerFactoryC.h" "POAManagerFactoryS.h" "POAManagerFactoryC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-POAManagerFactory_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="POA.pidl"

InputPath=POA.pidl

"POAC.h" "POAS.h" "POAC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-POA_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="PS_Current.pidl"

InputPath=PS_Current.pidl

"PS_CurrentC.h" "PS_CurrentS.h" "PS_CurrentC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-PS_Current_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="PortableServer_include.pidl"

InputPath=PortableServer_include.pidl

"PortableServer_includeC.h" "PortableServer_includeS.h" "PortableServer_includeA.h" "PortableServer_includeC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-PortableServer_include_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Sa -St -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Sci -SS -Sorb -Sa -GX -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -Wb,unique_include=tao/PortableServer/PortableServer.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="PortableServer.pidl"

InputPath=PortableServer.pidl

"PortableServerC.h" "PortableServerS.h" "PortableServerA.h" "PortableServerC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-PortableServer_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Sa -St -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Sci -SS -Sorb -Sa -GX -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -Wb,include_guard=TAO_PORTABLESERVER_SAFE_INCLUDE -Wb,safe_include=tao/PortableServer/PortableServer.h -iC tao/PortableServer "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Release"
SOURCE="ForwardRequest.pidl"

InputPath=ForwardRequest.pidl

"ForwardRequestC.h" "ForwardRequestS.h" "ForwardRequestA.h" "ForwardRequestC.cpp" "ForwardRequestA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-ForwardRequest_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -GA -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="AdapterActivator.pidl"

InputPath=AdapterActivator.pidl

"AdapterActivatorC.h" "AdapterActivatorS.h" "AdapterActivatorA.h" "AdapterActivatorC.cpp" "AdapterActivatorA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-AdapterActivator_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -GA -Sal -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="IdAssignmentPolicy.pidl"

InputPath=IdAssignmentPolicy.pidl

"IdAssignmentPolicyC.h" "IdAssignmentPolicyS.h" "IdAssignmentPolicyA.h" "IdAssignmentPolicyC.cpp" "IdAssignmentPolicyA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-IdAssignmentPolicy_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -GA -Sal -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="IdUniquenessPolicy.pidl"

InputPath=IdUniquenessPolicy.pidl

"IdUniquenessPolicyC.h" "IdUniquenessPolicyS.h" "IdUniquenessPolicyA.h" "IdUniquenessPolicyC.cpp" "IdUniquenessPolicyA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-IdUniquenessPolicy_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -GA -Sal -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="ImplicitActivationPolicy.pidl"

InputPath=ImplicitActivationPolicy.pidl

"ImplicitActivationPolicyC.h" "ImplicitActivationPolicyS.h" "ImplicitActivationPolicyA.h" "ImplicitActivationPolicyC.cpp" "ImplicitActivationPolicyA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-ImplicitActivationPolicy_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -GA -Sal -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="LifespanPolicy.pidl"

InputPath=LifespanPolicy.pidl

"LifespanPolicyC.h" "LifespanPolicyS.h" "LifespanPolicyA.h" "LifespanPolicyC.cpp" "LifespanPolicyA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-LifespanPolicy_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -GA -Sal -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="RequestProcessingPolicy.pidl"

InputPath=RequestProcessingPolicy.pidl

"RequestProcessingPolicyC.h" "RequestProcessingPolicyS.h" "RequestProcessingPolicyA.h" "RequestProcessingPolicyC.cpp" "RequestProcessingPolicyA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-RequestProcessingPolicy_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -GA -Sal -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="ServantActivator.pidl"

InputPath=ServantActivator.pidl

"ServantActivatorC.h" "ServantActivatorS.h" "ServantActivatorA.h" "ServantActivatorC.cpp" "ServantActivatorA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-ServantActivator_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -GA -Sal -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="ServantLocator.pidl"

InputPath=ServantLocator.pidl

"ServantLocatorC.h" "ServantLocatorS.h" "ServantLocatorA.h" "ServantLocatorC.cpp" "ServantLocatorA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-ServantLocator_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -GA -Sal -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="ServantManager.pidl"

InputPath=ServantManager.pidl

"ServantManagerC.h" "ServantManagerS.h" "ServantManagerA.h" "ServantManagerC.cpp" "ServantManagerA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-ServantManager_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -GA -Sal -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="ServantRetentionPolicy.pidl"

InputPath=ServantRetentionPolicy.pidl

"ServantRetentionPolicyC.h" "ServantRetentionPolicyS.h" "ServantRetentionPolicyA.h" "ServantRetentionPolicyC.cpp" "ServantRetentionPolicyA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-ServantRetentionPolicy_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -GA -Sal -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="ThreadPolicy.pidl"

InputPath=ThreadPolicy.pidl

"ThreadPolicyC.h" "ThreadPolicyS.h" "ThreadPolicyA.h" "ThreadPolicyC.cpp" "ThreadPolicyA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-ThreadPolicy_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -GA -Sal -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="POAManager.pidl"

InputPath=POAManager.pidl

"POAManagerC.h" "POAManagerS.h" "POAManagerC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-POAManager_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="POAManagerFactory.pidl"

InputPath=POAManagerFactory.pidl

"POAManagerFactoryC.h" "POAManagerFactoryS.h" "POAManagerFactoryC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-POAManagerFactory_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="POA.pidl"

InputPath=POA.pidl

"POAC.h" "POAS.h" "POAC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-POA_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="PS_Current.pidl"

InputPath=PS_Current.pidl

"PS_CurrentC.h" "PS_CurrentS.h" "PS_CurrentC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-PS_Current_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="PortableServer_include.pidl"

InputPath=PortableServer_include.pidl

"PortableServer_includeC.h" "PortableServer_includeS.h" "PortableServer_includeA.h" "PortableServer_includeC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-PortableServer_include_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Sa -St -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Sci -SS -Sorb -Sa -GX -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -Wb,unique_include=tao/PortableServer/PortableServer.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="PortableServer.pidl"

InputPath=PortableServer.pidl

"PortableServerC.h" "PortableServerS.h" "PortableServerA.h" "PortableServerC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-PortableServer_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Sa -St -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Sci -SS -Sorb -Sa -GX -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -Wb,include_guard=TAO_PORTABLESERVER_SAFE_INCLUDE -Wb,safe_include=tao/PortableServer/PortableServer.h -iC tao/PortableServer "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Debug"
SOURCE="ForwardRequest.pidl"

InputPath=ForwardRequest.pidl

"ForwardRequestC.h" "ForwardRequestS.h" "ForwardRequestA.h" "ForwardRequestC.cpp" "ForwardRequestA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-ForwardRequest_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -GA -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="AdapterActivator.pidl"

InputPath=AdapterActivator.pidl

"AdapterActivatorC.h" "AdapterActivatorS.h" "AdapterActivatorA.h" "AdapterActivatorC.cpp" "AdapterActivatorA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-AdapterActivator_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -GA -Sal -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="IdAssignmentPolicy.pidl"

InputPath=IdAssignmentPolicy.pidl

"IdAssignmentPolicyC.h" "IdAssignmentPolicyS.h" "IdAssignmentPolicyA.h" "IdAssignmentPolicyC.cpp" "IdAssignmentPolicyA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-IdAssignmentPolicy_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -GA -Sal -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="IdUniquenessPolicy.pidl"

InputPath=IdUniquenessPolicy.pidl

"IdUniquenessPolicyC.h" "IdUniquenessPolicyS.h" "IdUniquenessPolicyA.h" "IdUniquenessPolicyC.cpp" "IdUniquenessPolicyA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-IdUniquenessPolicy_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -GA -Sal -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="ImplicitActivationPolicy.pidl"

InputPath=ImplicitActivationPolicy.pidl

"ImplicitActivationPolicyC.h" "ImplicitActivationPolicyS.h" "ImplicitActivationPolicyA.h" "ImplicitActivationPolicyC.cpp" "ImplicitActivationPolicyA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-ImplicitActivationPolicy_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -GA -Sal -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="LifespanPolicy.pidl"

InputPath=LifespanPolicy.pidl

"LifespanPolicyC.h" "LifespanPolicyS.h" "LifespanPolicyA.h" "LifespanPolicyC.cpp" "LifespanPolicyA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-LifespanPolicy_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -GA -Sal -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="RequestProcessingPolicy.pidl"

InputPath=RequestProcessingPolicy.pidl

"RequestProcessingPolicyC.h" "RequestProcessingPolicyS.h" "RequestProcessingPolicyA.h" "RequestProcessingPolicyC.cpp" "RequestProcessingPolicyA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-RequestProcessingPolicy_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -GA -Sal -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="ServantActivator.pidl"

InputPath=ServantActivator.pidl

"ServantActivatorC.h" "ServantActivatorS.h" "ServantActivatorA.h" "ServantActivatorC.cpp" "ServantActivatorA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-ServantActivator_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -GA -Sal -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="ServantLocator.pidl"

InputPath=ServantLocator.pidl

"ServantLocatorC.h" "ServantLocatorS.h" "ServantLocatorA.h" "ServantLocatorC.cpp" "ServantLocatorA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-ServantLocator_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -GA -Sal -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="ServantManager.pidl"

InputPath=ServantManager.pidl

"ServantManagerC.h" "ServantManagerS.h" "ServantManagerA.h" "ServantManagerC.cpp" "ServantManagerA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-ServantManager_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -GA -Sal -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="ServantRetentionPolicy.pidl"

InputPath=ServantRetentionPolicy.pidl

"ServantRetentionPolicyC.h" "ServantRetentionPolicyS.h" "ServantRetentionPolicyA.h" "ServantRetentionPolicyC.cpp" "ServantRetentionPolicyA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-ServantRetentionPolicy_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -GA -Sal -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="ThreadPolicy.pidl"

InputPath=ThreadPolicy.pidl

"ThreadPolicyC.h" "ThreadPolicyS.h" "ThreadPolicyA.h" "ThreadPolicyC.cpp" "ThreadPolicyA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-ThreadPolicy_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -GA -Sal -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="POAManager.pidl"

InputPath=POAManager.pidl

"POAManagerC.h" "POAManagerS.h" "POAManagerC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-POAManager_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="POAManagerFactory.pidl"

InputPath=POAManagerFactory.pidl

"POAManagerFactoryC.h" "POAManagerFactoryS.h" "POAManagerFactoryC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-POAManagerFactory_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="POA.pidl"

InputPath=POA.pidl

"POAC.h" "POAS.h" "POAC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-POA_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="PS_Current.pidl"

InputPath=PS_Current.pidl

"PS_CurrentC.h" "PS_CurrentS.h" "PS_CurrentC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-PS_Current_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="PortableServer_include.pidl"

InputPath=PortableServer_include.pidl

"PortableServer_includeC.h" "PortableServer_includeS.h" "PortableServer_includeA.h" "PortableServer_includeC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-PortableServer_include_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Sa -St -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Sci -SS -Sorb -Sa -GX -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -Wb,unique_include=tao/PortableServer/PortableServer.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="PortableServer.pidl"

InputPath=PortableServer.pidl

"PortableServerC.h" "PortableServerS.h" "PortableServerA.h" "PortableServerC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-PortableServer_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Sa -St -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Sci -SS -Sorb -Sa -GX -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -Wb,include_guard=TAO_PORTABLESERVER_SAFE_INCLUDE -Wb,safe_include=tao/PortableServer/PortableServer.h -iC tao/PortableServer "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Release"
SOURCE="ForwardRequest.pidl"

InputPath=ForwardRequest.pidl

"ForwardRequestC.h" "ForwardRequestS.h" "ForwardRequestA.h" "ForwardRequestC.cpp" "ForwardRequestA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-ForwardRequest_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -GA -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="AdapterActivator.pidl"

InputPath=AdapterActivator.pidl

"AdapterActivatorC.h" "AdapterActivatorS.h" "AdapterActivatorA.h" "AdapterActivatorC.cpp" "AdapterActivatorA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-AdapterActivator_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -GA -Sal -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="IdAssignmentPolicy.pidl"

InputPath=IdAssignmentPolicy.pidl

"IdAssignmentPolicyC.h" "IdAssignmentPolicyS.h" "IdAssignmentPolicyA.h" "IdAssignmentPolicyC.cpp" "IdAssignmentPolicyA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-IdAssignmentPolicy_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -GA -Sal -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="IdUniquenessPolicy.pidl"

InputPath=IdUniquenessPolicy.pidl

"IdUniquenessPolicyC.h" "IdUniquenessPolicyS.h" "IdUniquenessPolicyA.h" "IdUniquenessPolicyC.cpp" "IdUniquenessPolicyA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-IdUniquenessPolicy_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -GA -Sal -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="ImplicitActivationPolicy.pidl"

InputPath=ImplicitActivationPolicy.pidl

"ImplicitActivationPolicyC.h" "ImplicitActivationPolicyS.h" "ImplicitActivationPolicyA.h" "ImplicitActivationPolicyC.cpp" "ImplicitActivationPolicyA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-ImplicitActivationPolicy_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -GA -Sal -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="LifespanPolicy.pidl"

InputPath=LifespanPolicy.pidl

"LifespanPolicyC.h" "LifespanPolicyS.h" "LifespanPolicyA.h" "LifespanPolicyC.cpp" "LifespanPolicyA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-LifespanPolicy_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -GA -Sal -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="RequestProcessingPolicy.pidl"

InputPath=RequestProcessingPolicy.pidl

"RequestProcessingPolicyC.h" "RequestProcessingPolicyS.h" "RequestProcessingPolicyA.h" "RequestProcessingPolicyC.cpp" "RequestProcessingPolicyA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-RequestProcessingPolicy_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -GA -Sal -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="ServantActivator.pidl"

InputPath=ServantActivator.pidl

"ServantActivatorC.h" "ServantActivatorS.h" "ServantActivatorA.h" "ServantActivatorC.cpp" "ServantActivatorA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-ServantActivator_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -GA -Sal -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="ServantLocator.pidl"

InputPath=ServantLocator.pidl

"ServantLocatorC.h" "ServantLocatorS.h" "ServantLocatorA.h" "ServantLocatorC.cpp" "ServantLocatorA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-ServantLocator_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -GA -Sal -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="ServantManager.pidl"

InputPath=ServantManager.pidl

"ServantManagerC.h" "ServantManagerS.h" "ServantManagerA.h" "ServantManagerC.cpp" "ServantManagerA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-ServantManager_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -GA -Sal -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="ServantRetentionPolicy.pidl"

InputPath=ServantRetentionPolicy.pidl

"ServantRetentionPolicyC.h" "ServantRetentionPolicyS.h" "ServantRetentionPolicyA.h" "ServantRetentionPolicyC.cpp" "ServantRetentionPolicyA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-ServantRetentionPolicy_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -GA -Sal -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="ThreadPolicy.pidl"

InputPath=ThreadPolicy.pidl

"ThreadPolicyC.h" "ThreadPolicyS.h" "ThreadPolicyA.h" "ThreadPolicyC.cpp" "ThreadPolicyA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-ThreadPolicy_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -GA -Sal -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="POAManager.pidl"

InputPath=POAManager.pidl

"POAManagerC.h" "POAManagerS.h" "POAManagerC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-POAManager_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="POAManagerFactory.pidl"

InputPath=POAManagerFactory.pidl

"POAManagerFactoryC.h" "POAManagerFactoryS.h" "POAManagerFactoryC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-POAManagerFactory_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="POA.pidl"

InputPath=POA.pidl

"POAC.h" "POAS.h" "POAC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-POA_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="PS_Current.pidl"

InputPath=PS_Current.pidl

"PS_CurrentC.h" "PS_CurrentS.h" "PS_CurrentC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-PS_Current_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Gp -Gd -Sci -SS -Sorb -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="PortableServer_include.pidl"

InputPath=PortableServer_include.pidl

"PortableServer_includeC.h" "PortableServer_includeS.h" "PortableServer_includeA.h" "PortableServer_includeC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-PortableServer_include_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Sa -St -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Sci -SS -Sorb -Sa -GX -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -Wb,unique_include=tao/PortableServer/PortableServer.h -iC tao/PortableServer "$(InputPath)"
<<

SOURCE="PortableServer.pidl"

InputPath=PortableServer.pidl

"PortableServerC.h" "PortableServerS.h" "PortableServerA.h" "PortableServerC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-PortableServer_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Sa -St -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Sci -SS -Sorb -Sa -GX -Wb,export_macro=TAO_PortableServer_Export -Wb,export_include=tao/PortableServer/portableserver_export.h -Wb,include_guard=TAO_PORTABLESERVER_SAFE_INCLUDE -Wb,safe_include=tao/PortableServer/PortableServer.h -iC tao/PortableServer "$(InputPath)"
<<

!ENDIF


!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.PortableServer_Idl.dep")
	@echo Using "Makefile.PortableServer_Idl.dep"
!ENDIF
!ENDIF

