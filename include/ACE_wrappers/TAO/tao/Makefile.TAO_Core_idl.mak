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
!MESSAGE NMAKE /f "Makefile.TAO_Core_idl.mak" CFG="Win64 Debug"
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

GENERATED_DIRTY = "GIOPC.inl" "GIOPC.h" "GIOPS.h" "AnyTypeCode\GIOPA.h" "GIOPC.cpp" "AnyTypeCode\GIOPA.cpp" "CONV_FRAMEC.h" "CONV_FRAMES.h" "AnyTypeCode\CONV_FRAMEA.h" "CONV_FRAMEC.cpp" "AnyTypeCode\CONV_FRAMEA.cpp" "CurrentC.h" "CurrentS.h" "AnyTypeCode\CurrentA.h" "CurrentC.cpp" "AnyTypeCode\CurrentA.cpp" "IIOPC.h" "IIOPS.h" "AnyTypeCode\IIOPA.h" "IIOPC.cpp" "AnyTypeCode\IIOPA.cpp" "IIOP_EndpointsC.h" "IIOP_EndpointsS.h" "AnyTypeCode\IIOP_EndpointsA.h" "IIOP_EndpointsC.cpp" "AnyTypeCode\IIOP_EndpointsA.cpp" "IOPC.h" "IOPS.h" "AnyTypeCode\IOPA.h" "IOPC.cpp" "AnyTypeCode\IOPA.cpp" "Messaging_PolicyValueC.h" "Messaging_PolicyValueS.h" "AnyTypeCode\Messaging_PolicyValueA.h" "Messaging_PolicyValueC.cpp" "AnyTypeCode\Messaging_PolicyValueA.cpp" "Messaging_SyncScopeC.h" "Messaging_SyncScopeS.h" "AnyTypeCode\Messaging_SyncScopeA.h" "Messaging_SyncScopeC.cpp" "AnyTypeCode\Messaging_SyncScopeA.cpp" "ObjectIdListC.h" "ObjectIdListS.h" "AnyTypeCode\ObjectIdListA.h" "ObjectIdListC.cpp" "AnyTypeCode\ObjectIdListA.cpp" "orb_typesC.h" "orb_typesS.h" "AnyTypeCode\orb_typesA.h" "orb_typesC.cpp" "AnyTypeCode\orb_typesA.cpp" "Policy_ManagerC.h" "Policy_ManagerS.h" "AnyTypeCode\Policy_ManagerA.h" "Policy_ManagerC.cpp" "AnyTypeCode\Policy_ManagerA.cpp" "Policy_CurrentC.h" "Policy_CurrentS.h" "AnyTypeCode\Policy_CurrentA.h" "Policy_CurrentC.cpp" "AnyTypeCode\Policy_CurrentA.cpp" "PI_ForwardC.h" "PI_ForwardS.h" "AnyTypeCode\PI_ForwardA.h" "PI_ForwardC.cpp" "AnyTypeCode\PI_ForwardA.cpp" "PortableInterceptorC.h" "PortableInterceptorS.h" "AnyTypeCode\PortableInterceptorA.h" "PortableInterceptorC.cpp" "AnyTypeCode\PortableInterceptorA.cpp" "ServicesC.h" "ServicesS.h" "AnyTypeCode\ServicesA.h" "ServicesC.cpp" "AnyTypeCode\ServicesA.cpp" "TAOC.h" "TAOS.h" "AnyTypeCode\TAOA.h" "TAOC.cpp" "AnyTypeCode\TAOA.cpp" "TimeBaseC.h" "TimeBaseS.h" "AnyTypeCode\TimeBaseA.h" "TimeBaseC.cpp" "AnyTypeCode\TimeBaseA.cpp" "Policy_ForwardC.h" "Policy_ForwardS.h" "AnyTypeCode\Policy_ForwardA.h" "Policy_ForwardC.cpp" "AnyTypeCode\Policy_ForwardA.cpp" "ParameterModeC.h" "ParameterModeS.h" "AnyTypeCode\ParameterModeA.h" "ParameterModeC.cpp" "AnyTypeCode\ParameterModeA.cpp" "BooleanSeqC.h" "BooleanSeqS.h" "AnyTypeCode\BooleanSeqA.h" "BooleanSeqC.cpp" "AnyTypeCode\BooleanSeqA.cpp" "CharSeqC.h" "CharSeqS.h" "AnyTypeCode\CharSeqA.h" "CharSeqC.cpp" "AnyTypeCode\CharSeqA.cpp" "DoubleSeqC.h" "DoubleSeqS.h" "AnyTypeCode\DoubleSeqA.h" "DoubleSeqC.cpp" "AnyTypeCode\DoubleSeqA.cpp" "FloatSeqC.h" "FloatSeqS.h" "AnyTypeCode\FloatSeqA.h" "FloatSeqC.cpp" "AnyTypeCode\FloatSeqA.cpp" "LongDoubleSeqC.h" "LongDoubleSeqS.h" "AnyTypeCode\LongDoubleSeqA.h" "LongDoubleSeqC.cpp" "AnyTypeCode\LongDoubleSeqA.cpp" "LongLongSeqC.h" "LongLongSeqS.h" "AnyTypeCode\LongLongSeqA.h" "LongLongSeqC.cpp" "AnyTypeCode\LongLongSeqA.cpp" "LongSeqC.h" "LongSeqS.h" "AnyTypeCode\LongSeqA.h" "LongSeqC.cpp" "AnyTypeCode\LongSeqA.cpp" "OctetSeqC.h" "OctetSeqS.h" "AnyTypeCode\OctetSeqA.h" "OctetSeqC.cpp" "AnyTypeCode\OctetSeqA.cpp" "ShortSeqC.h" "ShortSeqS.h" "AnyTypeCode\ShortSeqA.h" "ShortSeqC.cpp" "AnyTypeCode\ShortSeqA.cpp" "StringSeqC.h" "StringSeqS.h" "AnyTypeCode\StringSeqA.h" "StringSeqC.cpp" "AnyTypeCode\StringSeqA.cpp" "ULongLongSeqC.h" "ULongLongSeqS.h" "AnyTypeCode\ULongLongSeqA.h" "ULongLongSeqC.cpp" "AnyTypeCode\ULongLongSeqA.cpp" "ULongSeqC.h" "ULongSeqS.h" "AnyTypeCode\ULongSeqA.h" "ULongSeqC.cpp" "AnyTypeCode\ULongSeqA.cpp" "UShortSeqC.h" "UShortSeqS.h" "AnyTypeCode\UShortSeqA.h" "UShortSeqC.cpp" "AnyTypeCode\UShortSeqA.cpp" "WCharSeqC.h" "WCharSeqS.h" "AnyTypeCode\WCharSeqA.h" "WCharSeqC.cpp" "AnyTypeCode\WCharSeqA.cpp" "WStringSeqC.h" "WStringSeqS.h" "AnyTypeCode\WStringSeqA.h" "WStringSeqC.cpp" "AnyTypeCode\WStringSeqA.cpp"

!IF  "$(CFG)" == "Win64 Debug"

OUTDIR=.
INTDIR=Debug\TAO_Core_idl\IA64

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
	-@del /f/q "GIOPC.inl"
	-@del /f/q "GIOPC.h"
	-@del /f/q "GIOPS.h"
	-@del /f/q "AnyTypeCode\GIOPA.h"
	-@del /f/q "GIOPC.cpp"
	-@del /f/q "AnyTypeCode\GIOPA.cpp"
	-@del /f/q "CONV_FRAMEC.h"
	-@del /f/q "CONV_FRAMES.h"
	-@del /f/q "AnyTypeCode\CONV_FRAMEA.h"
	-@del /f/q "CONV_FRAMEC.cpp"
	-@del /f/q "AnyTypeCode\CONV_FRAMEA.cpp"
	-@del /f/q "CurrentC.h"
	-@del /f/q "CurrentS.h"
	-@del /f/q "AnyTypeCode\CurrentA.h"
	-@del /f/q "CurrentC.cpp"
	-@del /f/q "AnyTypeCode\CurrentA.cpp"
	-@del /f/q "IIOPC.h"
	-@del /f/q "IIOPS.h"
	-@del /f/q "AnyTypeCode\IIOPA.h"
	-@del /f/q "IIOPC.cpp"
	-@del /f/q "AnyTypeCode\IIOPA.cpp"
	-@del /f/q "IIOP_EndpointsC.h"
	-@del /f/q "IIOP_EndpointsS.h"
	-@del /f/q "AnyTypeCode\IIOP_EndpointsA.h"
	-@del /f/q "IIOP_EndpointsC.cpp"
	-@del /f/q "AnyTypeCode\IIOP_EndpointsA.cpp"
	-@del /f/q "IOPC.h"
	-@del /f/q "IOPS.h"
	-@del /f/q "AnyTypeCode\IOPA.h"
	-@del /f/q "IOPC.cpp"
	-@del /f/q "AnyTypeCode\IOPA.cpp"
	-@del /f/q "Messaging_PolicyValueC.h"
	-@del /f/q "Messaging_PolicyValueS.h"
	-@del /f/q "AnyTypeCode\Messaging_PolicyValueA.h"
	-@del /f/q "Messaging_PolicyValueC.cpp"
	-@del /f/q "AnyTypeCode\Messaging_PolicyValueA.cpp"
	-@del /f/q "Messaging_SyncScopeC.h"
	-@del /f/q "Messaging_SyncScopeS.h"
	-@del /f/q "AnyTypeCode\Messaging_SyncScopeA.h"
	-@del /f/q "Messaging_SyncScopeC.cpp"
	-@del /f/q "AnyTypeCode\Messaging_SyncScopeA.cpp"
	-@del /f/q "ObjectIdListC.h"
	-@del /f/q "ObjectIdListS.h"
	-@del /f/q "AnyTypeCode\ObjectIdListA.h"
	-@del /f/q "ObjectIdListC.cpp"
	-@del /f/q "AnyTypeCode\ObjectIdListA.cpp"
	-@del /f/q "orb_typesC.h"
	-@del /f/q "orb_typesS.h"
	-@del /f/q "AnyTypeCode\orb_typesA.h"
	-@del /f/q "orb_typesC.cpp"
	-@del /f/q "AnyTypeCode\orb_typesA.cpp"
	-@del /f/q "Policy_ManagerC.h"
	-@del /f/q "Policy_ManagerS.h"
	-@del /f/q "AnyTypeCode\Policy_ManagerA.h"
	-@del /f/q "Policy_ManagerC.cpp"
	-@del /f/q "AnyTypeCode\Policy_ManagerA.cpp"
	-@del /f/q "Policy_CurrentC.h"
	-@del /f/q "Policy_CurrentS.h"
	-@del /f/q "AnyTypeCode\Policy_CurrentA.h"
	-@del /f/q "Policy_CurrentC.cpp"
	-@del /f/q "AnyTypeCode\Policy_CurrentA.cpp"
	-@del /f/q "PI_ForwardC.h"
	-@del /f/q "PI_ForwardS.h"
	-@del /f/q "AnyTypeCode\PI_ForwardA.h"
	-@del /f/q "PI_ForwardC.cpp"
	-@del /f/q "AnyTypeCode\PI_ForwardA.cpp"
	-@del /f/q "PortableInterceptorC.h"
	-@del /f/q "PortableInterceptorS.h"
	-@del /f/q "AnyTypeCode\PortableInterceptorA.h"
	-@del /f/q "PortableInterceptorC.cpp"
	-@del /f/q "AnyTypeCode\PortableInterceptorA.cpp"
	-@del /f/q "ServicesC.h"
	-@del /f/q "ServicesS.h"
	-@del /f/q "AnyTypeCode\ServicesA.h"
	-@del /f/q "ServicesC.cpp"
	-@del /f/q "AnyTypeCode\ServicesA.cpp"
	-@del /f/q "TAOC.h"
	-@del /f/q "TAOS.h"
	-@del /f/q "AnyTypeCode\TAOA.h"
	-@del /f/q "TAOC.cpp"
	-@del /f/q "AnyTypeCode\TAOA.cpp"
	-@del /f/q "TimeBaseC.h"
	-@del /f/q "TimeBaseS.h"
	-@del /f/q "AnyTypeCode\TimeBaseA.h"
	-@del /f/q "TimeBaseC.cpp"
	-@del /f/q "AnyTypeCode\TimeBaseA.cpp"
	-@del /f/q "Policy_ForwardC.h"
	-@del /f/q "Policy_ForwardS.h"
	-@del /f/q "AnyTypeCode\Policy_ForwardA.h"
	-@del /f/q "Policy_ForwardC.cpp"
	-@del /f/q "AnyTypeCode\Policy_ForwardA.cpp"
	-@del /f/q "ParameterModeC.h"
	-@del /f/q "ParameterModeS.h"
	-@del /f/q "AnyTypeCode\ParameterModeA.h"
	-@del /f/q "ParameterModeC.cpp"
	-@del /f/q "AnyTypeCode\ParameterModeA.cpp"
	-@del /f/q "BooleanSeqC.h"
	-@del /f/q "BooleanSeqS.h"
	-@del /f/q "AnyTypeCode\BooleanSeqA.h"
	-@del /f/q "BooleanSeqC.cpp"
	-@del /f/q "AnyTypeCode\BooleanSeqA.cpp"
	-@del /f/q "CharSeqC.h"
	-@del /f/q "CharSeqS.h"
	-@del /f/q "AnyTypeCode\CharSeqA.h"
	-@del /f/q "CharSeqC.cpp"
	-@del /f/q "AnyTypeCode\CharSeqA.cpp"
	-@del /f/q "DoubleSeqC.h"
	-@del /f/q "DoubleSeqS.h"
	-@del /f/q "AnyTypeCode\DoubleSeqA.h"
	-@del /f/q "DoubleSeqC.cpp"
	-@del /f/q "AnyTypeCode\DoubleSeqA.cpp"
	-@del /f/q "FloatSeqC.h"
	-@del /f/q "FloatSeqS.h"
	-@del /f/q "AnyTypeCode\FloatSeqA.h"
	-@del /f/q "FloatSeqC.cpp"
	-@del /f/q "AnyTypeCode\FloatSeqA.cpp"
	-@del /f/q "LongDoubleSeqC.h"
	-@del /f/q "LongDoubleSeqS.h"
	-@del /f/q "AnyTypeCode\LongDoubleSeqA.h"
	-@del /f/q "LongDoubleSeqC.cpp"
	-@del /f/q "AnyTypeCode\LongDoubleSeqA.cpp"
	-@del /f/q "LongLongSeqC.h"
	-@del /f/q "LongLongSeqS.h"
	-@del /f/q "AnyTypeCode\LongLongSeqA.h"
	-@del /f/q "LongLongSeqC.cpp"
	-@del /f/q "AnyTypeCode\LongLongSeqA.cpp"
	-@del /f/q "LongSeqC.h"
	-@del /f/q "LongSeqS.h"
	-@del /f/q "AnyTypeCode\LongSeqA.h"
	-@del /f/q "LongSeqC.cpp"
	-@del /f/q "AnyTypeCode\LongSeqA.cpp"
	-@del /f/q "OctetSeqC.h"
	-@del /f/q "OctetSeqS.h"
	-@del /f/q "AnyTypeCode\OctetSeqA.h"
	-@del /f/q "OctetSeqC.cpp"
	-@del /f/q "AnyTypeCode\OctetSeqA.cpp"
	-@del /f/q "ShortSeqC.h"
	-@del /f/q "ShortSeqS.h"
	-@del /f/q "AnyTypeCode\ShortSeqA.h"
	-@del /f/q "ShortSeqC.cpp"
	-@del /f/q "AnyTypeCode\ShortSeqA.cpp"
	-@del /f/q "StringSeqC.h"
	-@del /f/q "StringSeqS.h"
	-@del /f/q "AnyTypeCode\StringSeqA.h"
	-@del /f/q "StringSeqC.cpp"
	-@del /f/q "AnyTypeCode\StringSeqA.cpp"
	-@del /f/q "ULongLongSeqC.h"
	-@del /f/q "ULongLongSeqS.h"
	-@del /f/q "AnyTypeCode\ULongLongSeqA.h"
	-@del /f/q "ULongLongSeqC.cpp"
	-@del /f/q "AnyTypeCode\ULongLongSeqA.cpp"
	-@del /f/q "ULongSeqC.h"
	-@del /f/q "ULongSeqS.h"
	-@del /f/q "AnyTypeCode\ULongSeqA.h"
	-@del /f/q "ULongSeqC.cpp"
	-@del /f/q "AnyTypeCode\ULongSeqA.cpp"
	-@del /f/q "UShortSeqC.h"
	-@del /f/q "UShortSeqS.h"
	-@del /f/q "AnyTypeCode\UShortSeqA.h"
	-@del /f/q "UShortSeqC.cpp"
	-@del /f/q "AnyTypeCode\UShortSeqA.cpp"
	-@del /f/q "WCharSeqC.h"
	-@del /f/q "WCharSeqS.h"
	-@del /f/q "AnyTypeCode\WCharSeqA.h"
	-@del /f/q "WCharSeqC.cpp"
	-@del /f/q "AnyTypeCode\WCharSeqA.cpp"
	-@del /f/q "WStringSeqC.h"
	-@del /f/q "WStringSeqS.h"
	-@del /f/q "AnyTypeCode\WStringSeqA.h"
	-@del /f/q "WStringSeqC.cpp"
	-@del /f/q "AnyTypeCode\WStringSeqA.cpp"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\TAO_Core_idl\$(NULL)" mkdir "Debug\TAO_Core_idl"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /Fd"$(INTDIR)/" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe


!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=.
INTDIR=Release\TAO_Core_idl\IA64

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
	-@del /f/q "GIOPC.inl"
	-@del /f/q "GIOPC.h"
	-@del /f/q "GIOPS.h"
	-@del /f/q "AnyTypeCode\GIOPA.h"
	-@del /f/q "GIOPC.cpp"
	-@del /f/q "AnyTypeCode\GIOPA.cpp"
	-@del /f/q "CONV_FRAMEC.h"
	-@del /f/q "CONV_FRAMES.h"
	-@del /f/q "AnyTypeCode\CONV_FRAMEA.h"
	-@del /f/q "CONV_FRAMEC.cpp"
	-@del /f/q "AnyTypeCode\CONV_FRAMEA.cpp"
	-@del /f/q "CurrentC.h"
	-@del /f/q "CurrentS.h"
	-@del /f/q "AnyTypeCode\CurrentA.h"
	-@del /f/q "CurrentC.cpp"
	-@del /f/q "AnyTypeCode\CurrentA.cpp"
	-@del /f/q "IIOPC.h"
	-@del /f/q "IIOPS.h"
	-@del /f/q "AnyTypeCode\IIOPA.h"
	-@del /f/q "IIOPC.cpp"
	-@del /f/q "AnyTypeCode\IIOPA.cpp"
	-@del /f/q "IIOP_EndpointsC.h"
	-@del /f/q "IIOP_EndpointsS.h"
	-@del /f/q "AnyTypeCode\IIOP_EndpointsA.h"
	-@del /f/q "IIOP_EndpointsC.cpp"
	-@del /f/q "AnyTypeCode\IIOP_EndpointsA.cpp"
	-@del /f/q "IOPC.h"
	-@del /f/q "IOPS.h"
	-@del /f/q "AnyTypeCode\IOPA.h"
	-@del /f/q "IOPC.cpp"
	-@del /f/q "AnyTypeCode\IOPA.cpp"
	-@del /f/q "Messaging_PolicyValueC.h"
	-@del /f/q "Messaging_PolicyValueS.h"
	-@del /f/q "AnyTypeCode\Messaging_PolicyValueA.h"
	-@del /f/q "Messaging_PolicyValueC.cpp"
	-@del /f/q "AnyTypeCode\Messaging_PolicyValueA.cpp"
	-@del /f/q "Messaging_SyncScopeC.h"
	-@del /f/q "Messaging_SyncScopeS.h"
	-@del /f/q "AnyTypeCode\Messaging_SyncScopeA.h"
	-@del /f/q "Messaging_SyncScopeC.cpp"
	-@del /f/q "AnyTypeCode\Messaging_SyncScopeA.cpp"
	-@del /f/q "ObjectIdListC.h"
	-@del /f/q "ObjectIdListS.h"
	-@del /f/q "AnyTypeCode\ObjectIdListA.h"
	-@del /f/q "ObjectIdListC.cpp"
	-@del /f/q "AnyTypeCode\ObjectIdListA.cpp"
	-@del /f/q "orb_typesC.h"
	-@del /f/q "orb_typesS.h"
	-@del /f/q "AnyTypeCode\orb_typesA.h"
	-@del /f/q "orb_typesC.cpp"
	-@del /f/q "AnyTypeCode\orb_typesA.cpp"
	-@del /f/q "Policy_ManagerC.h"
	-@del /f/q "Policy_ManagerS.h"
	-@del /f/q "AnyTypeCode\Policy_ManagerA.h"
	-@del /f/q "Policy_ManagerC.cpp"
	-@del /f/q "AnyTypeCode\Policy_ManagerA.cpp"
	-@del /f/q "Policy_CurrentC.h"
	-@del /f/q "Policy_CurrentS.h"
	-@del /f/q "AnyTypeCode\Policy_CurrentA.h"
	-@del /f/q "Policy_CurrentC.cpp"
	-@del /f/q "AnyTypeCode\Policy_CurrentA.cpp"
	-@del /f/q "PI_ForwardC.h"
	-@del /f/q "PI_ForwardS.h"
	-@del /f/q "AnyTypeCode\PI_ForwardA.h"
	-@del /f/q "PI_ForwardC.cpp"
	-@del /f/q "AnyTypeCode\PI_ForwardA.cpp"
	-@del /f/q "PortableInterceptorC.h"
	-@del /f/q "PortableInterceptorS.h"
	-@del /f/q "AnyTypeCode\PortableInterceptorA.h"
	-@del /f/q "PortableInterceptorC.cpp"
	-@del /f/q "AnyTypeCode\PortableInterceptorA.cpp"
	-@del /f/q "ServicesC.h"
	-@del /f/q "ServicesS.h"
	-@del /f/q "AnyTypeCode\ServicesA.h"
	-@del /f/q "ServicesC.cpp"
	-@del /f/q "AnyTypeCode\ServicesA.cpp"
	-@del /f/q "TAOC.h"
	-@del /f/q "TAOS.h"
	-@del /f/q "AnyTypeCode\TAOA.h"
	-@del /f/q "TAOC.cpp"
	-@del /f/q "AnyTypeCode\TAOA.cpp"
	-@del /f/q "TimeBaseC.h"
	-@del /f/q "TimeBaseS.h"
	-@del /f/q "AnyTypeCode\TimeBaseA.h"
	-@del /f/q "TimeBaseC.cpp"
	-@del /f/q "AnyTypeCode\TimeBaseA.cpp"
	-@del /f/q "Policy_ForwardC.h"
	-@del /f/q "Policy_ForwardS.h"
	-@del /f/q "AnyTypeCode\Policy_ForwardA.h"
	-@del /f/q "Policy_ForwardC.cpp"
	-@del /f/q "AnyTypeCode\Policy_ForwardA.cpp"
	-@del /f/q "ParameterModeC.h"
	-@del /f/q "ParameterModeS.h"
	-@del /f/q "AnyTypeCode\ParameterModeA.h"
	-@del /f/q "ParameterModeC.cpp"
	-@del /f/q "AnyTypeCode\ParameterModeA.cpp"
	-@del /f/q "BooleanSeqC.h"
	-@del /f/q "BooleanSeqS.h"
	-@del /f/q "AnyTypeCode\BooleanSeqA.h"
	-@del /f/q "BooleanSeqC.cpp"
	-@del /f/q "AnyTypeCode\BooleanSeqA.cpp"
	-@del /f/q "CharSeqC.h"
	-@del /f/q "CharSeqS.h"
	-@del /f/q "AnyTypeCode\CharSeqA.h"
	-@del /f/q "CharSeqC.cpp"
	-@del /f/q "AnyTypeCode\CharSeqA.cpp"
	-@del /f/q "DoubleSeqC.h"
	-@del /f/q "DoubleSeqS.h"
	-@del /f/q "AnyTypeCode\DoubleSeqA.h"
	-@del /f/q "DoubleSeqC.cpp"
	-@del /f/q "AnyTypeCode\DoubleSeqA.cpp"
	-@del /f/q "FloatSeqC.h"
	-@del /f/q "FloatSeqS.h"
	-@del /f/q "AnyTypeCode\FloatSeqA.h"
	-@del /f/q "FloatSeqC.cpp"
	-@del /f/q "AnyTypeCode\FloatSeqA.cpp"
	-@del /f/q "LongDoubleSeqC.h"
	-@del /f/q "LongDoubleSeqS.h"
	-@del /f/q "AnyTypeCode\LongDoubleSeqA.h"
	-@del /f/q "LongDoubleSeqC.cpp"
	-@del /f/q "AnyTypeCode\LongDoubleSeqA.cpp"
	-@del /f/q "LongLongSeqC.h"
	-@del /f/q "LongLongSeqS.h"
	-@del /f/q "AnyTypeCode\LongLongSeqA.h"
	-@del /f/q "LongLongSeqC.cpp"
	-@del /f/q "AnyTypeCode\LongLongSeqA.cpp"
	-@del /f/q "LongSeqC.h"
	-@del /f/q "LongSeqS.h"
	-@del /f/q "AnyTypeCode\LongSeqA.h"
	-@del /f/q "LongSeqC.cpp"
	-@del /f/q "AnyTypeCode\LongSeqA.cpp"
	-@del /f/q "OctetSeqC.h"
	-@del /f/q "OctetSeqS.h"
	-@del /f/q "AnyTypeCode\OctetSeqA.h"
	-@del /f/q "OctetSeqC.cpp"
	-@del /f/q "AnyTypeCode\OctetSeqA.cpp"
	-@del /f/q "ShortSeqC.h"
	-@del /f/q "ShortSeqS.h"
	-@del /f/q "AnyTypeCode\ShortSeqA.h"
	-@del /f/q "ShortSeqC.cpp"
	-@del /f/q "AnyTypeCode\ShortSeqA.cpp"
	-@del /f/q "StringSeqC.h"
	-@del /f/q "StringSeqS.h"
	-@del /f/q "AnyTypeCode\StringSeqA.h"
	-@del /f/q "StringSeqC.cpp"
	-@del /f/q "AnyTypeCode\StringSeqA.cpp"
	-@del /f/q "ULongLongSeqC.h"
	-@del /f/q "ULongLongSeqS.h"
	-@del /f/q "AnyTypeCode\ULongLongSeqA.h"
	-@del /f/q "ULongLongSeqC.cpp"
	-@del /f/q "AnyTypeCode\ULongLongSeqA.cpp"
	-@del /f/q "ULongSeqC.h"
	-@del /f/q "ULongSeqS.h"
	-@del /f/q "AnyTypeCode\ULongSeqA.h"
	-@del /f/q "ULongSeqC.cpp"
	-@del /f/q "AnyTypeCode\ULongSeqA.cpp"
	-@del /f/q "UShortSeqC.h"
	-@del /f/q "UShortSeqS.h"
	-@del /f/q "AnyTypeCode\UShortSeqA.h"
	-@del /f/q "UShortSeqC.cpp"
	-@del /f/q "AnyTypeCode\UShortSeqA.cpp"
	-@del /f/q "WCharSeqC.h"
	-@del /f/q "WCharSeqS.h"
	-@del /f/q "AnyTypeCode\WCharSeqA.h"
	-@del /f/q "WCharSeqC.cpp"
	-@del /f/q "AnyTypeCode\WCharSeqA.cpp"
	-@del /f/q "WStringSeqC.h"
	-@del /f/q "WStringSeqS.h"
	-@del /f/q "AnyTypeCode\WStringSeqA.h"
	-@del /f/q "WStringSeqC.cpp"
	-@del /f/q "AnyTypeCode\WStringSeqA.cpp"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\TAO_Core_idl\$(NULL)" mkdir "Release\TAO_Core_idl"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe


!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=.
INTDIR=Static_Debug\TAO_Core_idl\IA64

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
	-@del /f/q "GIOPC.inl"
	-@del /f/q "GIOPC.h"
	-@del /f/q "GIOPS.h"
	-@del /f/q "AnyTypeCode\GIOPA.h"
	-@del /f/q "GIOPC.cpp"
	-@del /f/q "AnyTypeCode\GIOPA.cpp"
	-@del /f/q "CONV_FRAMEC.h"
	-@del /f/q "CONV_FRAMES.h"
	-@del /f/q "AnyTypeCode\CONV_FRAMEA.h"
	-@del /f/q "CONV_FRAMEC.cpp"
	-@del /f/q "AnyTypeCode\CONV_FRAMEA.cpp"
	-@del /f/q "CurrentC.h"
	-@del /f/q "CurrentS.h"
	-@del /f/q "AnyTypeCode\CurrentA.h"
	-@del /f/q "CurrentC.cpp"
	-@del /f/q "AnyTypeCode\CurrentA.cpp"
	-@del /f/q "IIOPC.h"
	-@del /f/q "IIOPS.h"
	-@del /f/q "AnyTypeCode\IIOPA.h"
	-@del /f/q "IIOPC.cpp"
	-@del /f/q "AnyTypeCode\IIOPA.cpp"
	-@del /f/q "IIOP_EndpointsC.h"
	-@del /f/q "IIOP_EndpointsS.h"
	-@del /f/q "AnyTypeCode\IIOP_EndpointsA.h"
	-@del /f/q "IIOP_EndpointsC.cpp"
	-@del /f/q "AnyTypeCode\IIOP_EndpointsA.cpp"
	-@del /f/q "IOPC.h"
	-@del /f/q "IOPS.h"
	-@del /f/q "AnyTypeCode\IOPA.h"
	-@del /f/q "IOPC.cpp"
	-@del /f/q "AnyTypeCode\IOPA.cpp"
	-@del /f/q "Messaging_PolicyValueC.h"
	-@del /f/q "Messaging_PolicyValueS.h"
	-@del /f/q "AnyTypeCode\Messaging_PolicyValueA.h"
	-@del /f/q "Messaging_PolicyValueC.cpp"
	-@del /f/q "AnyTypeCode\Messaging_PolicyValueA.cpp"
	-@del /f/q "Messaging_SyncScopeC.h"
	-@del /f/q "Messaging_SyncScopeS.h"
	-@del /f/q "AnyTypeCode\Messaging_SyncScopeA.h"
	-@del /f/q "Messaging_SyncScopeC.cpp"
	-@del /f/q "AnyTypeCode\Messaging_SyncScopeA.cpp"
	-@del /f/q "ObjectIdListC.h"
	-@del /f/q "ObjectIdListS.h"
	-@del /f/q "AnyTypeCode\ObjectIdListA.h"
	-@del /f/q "ObjectIdListC.cpp"
	-@del /f/q "AnyTypeCode\ObjectIdListA.cpp"
	-@del /f/q "orb_typesC.h"
	-@del /f/q "orb_typesS.h"
	-@del /f/q "AnyTypeCode\orb_typesA.h"
	-@del /f/q "orb_typesC.cpp"
	-@del /f/q "AnyTypeCode\orb_typesA.cpp"
	-@del /f/q "Policy_ManagerC.h"
	-@del /f/q "Policy_ManagerS.h"
	-@del /f/q "AnyTypeCode\Policy_ManagerA.h"
	-@del /f/q "Policy_ManagerC.cpp"
	-@del /f/q "AnyTypeCode\Policy_ManagerA.cpp"
	-@del /f/q "Policy_CurrentC.h"
	-@del /f/q "Policy_CurrentS.h"
	-@del /f/q "AnyTypeCode\Policy_CurrentA.h"
	-@del /f/q "Policy_CurrentC.cpp"
	-@del /f/q "AnyTypeCode\Policy_CurrentA.cpp"
	-@del /f/q "PI_ForwardC.h"
	-@del /f/q "PI_ForwardS.h"
	-@del /f/q "AnyTypeCode\PI_ForwardA.h"
	-@del /f/q "PI_ForwardC.cpp"
	-@del /f/q "AnyTypeCode\PI_ForwardA.cpp"
	-@del /f/q "PortableInterceptorC.h"
	-@del /f/q "PortableInterceptorS.h"
	-@del /f/q "AnyTypeCode\PortableInterceptorA.h"
	-@del /f/q "PortableInterceptorC.cpp"
	-@del /f/q "AnyTypeCode\PortableInterceptorA.cpp"
	-@del /f/q "ServicesC.h"
	-@del /f/q "ServicesS.h"
	-@del /f/q "AnyTypeCode\ServicesA.h"
	-@del /f/q "ServicesC.cpp"
	-@del /f/q "AnyTypeCode\ServicesA.cpp"
	-@del /f/q "TAOC.h"
	-@del /f/q "TAOS.h"
	-@del /f/q "AnyTypeCode\TAOA.h"
	-@del /f/q "TAOC.cpp"
	-@del /f/q "AnyTypeCode\TAOA.cpp"
	-@del /f/q "TimeBaseC.h"
	-@del /f/q "TimeBaseS.h"
	-@del /f/q "AnyTypeCode\TimeBaseA.h"
	-@del /f/q "TimeBaseC.cpp"
	-@del /f/q "AnyTypeCode\TimeBaseA.cpp"
	-@del /f/q "Policy_ForwardC.h"
	-@del /f/q "Policy_ForwardS.h"
	-@del /f/q "AnyTypeCode\Policy_ForwardA.h"
	-@del /f/q "Policy_ForwardC.cpp"
	-@del /f/q "AnyTypeCode\Policy_ForwardA.cpp"
	-@del /f/q "ParameterModeC.h"
	-@del /f/q "ParameterModeS.h"
	-@del /f/q "AnyTypeCode\ParameterModeA.h"
	-@del /f/q "ParameterModeC.cpp"
	-@del /f/q "AnyTypeCode\ParameterModeA.cpp"
	-@del /f/q "BooleanSeqC.h"
	-@del /f/q "BooleanSeqS.h"
	-@del /f/q "AnyTypeCode\BooleanSeqA.h"
	-@del /f/q "BooleanSeqC.cpp"
	-@del /f/q "AnyTypeCode\BooleanSeqA.cpp"
	-@del /f/q "CharSeqC.h"
	-@del /f/q "CharSeqS.h"
	-@del /f/q "AnyTypeCode\CharSeqA.h"
	-@del /f/q "CharSeqC.cpp"
	-@del /f/q "AnyTypeCode\CharSeqA.cpp"
	-@del /f/q "DoubleSeqC.h"
	-@del /f/q "DoubleSeqS.h"
	-@del /f/q "AnyTypeCode\DoubleSeqA.h"
	-@del /f/q "DoubleSeqC.cpp"
	-@del /f/q "AnyTypeCode\DoubleSeqA.cpp"
	-@del /f/q "FloatSeqC.h"
	-@del /f/q "FloatSeqS.h"
	-@del /f/q "AnyTypeCode\FloatSeqA.h"
	-@del /f/q "FloatSeqC.cpp"
	-@del /f/q "AnyTypeCode\FloatSeqA.cpp"
	-@del /f/q "LongDoubleSeqC.h"
	-@del /f/q "LongDoubleSeqS.h"
	-@del /f/q "AnyTypeCode\LongDoubleSeqA.h"
	-@del /f/q "LongDoubleSeqC.cpp"
	-@del /f/q "AnyTypeCode\LongDoubleSeqA.cpp"
	-@del /f/q "LongLongSeqC.h"
	-@del /f/q "LongLongSeqS.h"
	-@del /f/q "AnyTypeCode\LongLongSeqA.h"
	-@del /f/q "LongLongSeqC.cpp"
	-@del /f/q "AnyTypeCode\LongLongSeqA.cpp"
	-@del /f/q "LongSeqC.h"
	-@del /f/q "LongSeqS.h"
	-@del /f/q "AnyTypeCode\LongSeqA.h"
	-@del /f/q "LongSeqC.cpp"
	-@del /f/q "AnyTypeCode\LongSeqA.cpp"
	-@del /f/q "OctetSeqC.h"
	-@del /f/q "OctetSeqS.h"
	-@del /f/q "AnyTypeCode\OctetSeqA.h"
	-@del /f/q "OctetSeqC.cpp"
	-@del /f/q "AnyTypeCode\OctetSeqA.cpp"
	-@del /f/q "ShortSeqC.h"
	-@del /f/q "ShortSeqS.h"
	-@del /f/q "AnyTypeCode\ShortSeqA.h"
	-@del /f/q "ShortSeqC.cpp"
	-@del /f/q "AnyTypeCode\ShortSeqA.cpp"
	-@del /f/q "StringSeqC.h"
	-@del /f/q "StringSeqS.h"
	-@del /f/q "AnyTypeCode\StringSeqA.h"
	-@del /f/q "StringSeqC.cpp"
	-@del /f/q "AnyTypeCode\StringSeqA.cpp"
	-@del /f/q "ULongLongSeqC.h"
	-@del /f/q "ULongLongSeqS.h"
	-@del /f/q "AnyTypeCode\ULongLongSeqA.h"
	-@del /f/q "ULongLongSeqC.cpp"
	-@del /f/q "AnyTypeCode\ULongLongSeqA.cpp"
	-@del /f/q "ULongSeqC.h"
	-@del /f/q "ULongSeqS.h"
	-@del /f/q "AnyTypeCode\ULongSeqA.h"
	-@del /f/q "ULongSeqC.cpp"
	-@del /f/q "AnyTypeCode\ULongSeqA.cpp"
	-@del /f/q "UShortSeqC.h"
	-@del /f/q "UShortSeqS.h"
	-@del /f/q "AnyTypeCode\UShortSeqA.h"
	-@del /f/q "UShortSeqC.cpp"
	-@del /f/q "AnyTypeCode\UShortSeqA.cpp"
	-@del /f/q "WCharSeqC.h"
	-@del /f/q "WCharSeqS.h"
	-@del /f/q "AnyTypeCode\WCharSeqA.h"
	-@del /f/q "WCharSeqC.cpp"
	-@del /f/q "AnyTypeCode\WCharSeqA.cpp"
	-@del /f/q "WStringSeqC.h"
	-@del /f/q "WStringSeqS.h"
	-@del /f/q "AnyTypeCode\WStringSeqA.h"
	-@del /f/q "WStringSeqC.cpp"
	-@del /f/q "AnyTypeCode\WStringSeqA.cpp"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\TAO_Core_idl\$(NULL)" mkdir "Static_Debug\TAO_Core_idl"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /Fd".\sd.pdb" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"



!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=.
INTDIR=Static_Release\TAO_Core_idl\IA64

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
	-@del /f/q "GIOPC.inl"
	-@del /f/q "GIOPC.h"
	-@del /f/q "GIOPS.h"
	-@del /f/q "AnyTypeCode\GIOPA.h"
	-@del /f/q "GIOPC.cpp"
	-@del /f/q "AnyTypeCode\GIOPA.cpp"
	-@del /f/q "CONV_FRAMEC.h"
	-@del /f/q "CONV_FRAMES.h"
	-@del /f/q "AnyTypeCode\CONV_FRAMEA.h"
	-@del /f/q "CONV_FRAMEC.cpp"
	-@del /f/q "AnyTypeCode\CONV_FRAMEA.cpp"
	-@del /f/q "CurrentC.h"
	-@del /f/q "CurrentS.h"
	-@del /f/q "AnyTypeCode\CurrentA.h"
	-@del /f/q "CurrentC.cpp"
	-@del /f/q "AnyTypeCode\CurrentA.cpp"
	-@del /f/q "IIOPC.h"
	-@del /f/q "IIOPS.h"
	-@del /f/q "AnyTypeCode\IIOPA.h"
	-@del /f/q "IIOPC.cpp"
	-@del /f/q "AnyTypeCode\IIOPA.cpp"
	-@del /f/q "IIOP_EndpointsC.h"
	-@del /f/q "IIOP_EndpointsS.h"
	-@del /f/q "AnyTypeCode\IIOP_EndpointsA.h"
	-@del /f/q "IIOP_EndpointsC.cpp"
	-@del /f/q "AnyTypeCode\IIOP_EndpointsA.cpp"
	-@del /f/q "IOPC.h"
	-@del /f/q "IOPS.h"
	-@del /f/q "AnyTypeCode\IOPA.h"
	-@del /f/q "IOPC.cpp"
	-@del /f/q "AnyTypeCode\IOPA.cpp"
	-@del /f/q "Messaging_PolicyValueC.h"
	-@del /f/q "Messaging_PolicyValueS.h"
	-@del /f/q "AnyTypeCode\Messaging_PolicyValueA.h"
	-@del /f/q "Messaging_PolicyValueC.cpp"
	-@del /f/q "AnyTypeCode\Messaging_PolicyValueA.cpp"
	-@del /f/q "Messaging_SyncScopeC.h"
	-@del /f/q "Messaging_SyncScopeS.h"
	-@del /f/q "AnyTypeCode\Messaging_SyncScopeA.h"
	-@del /f/q "Messaging_SyncScopeC.cpp"
	-@del /f/q "AnyTypeCode\Messaging_SyncScopeA.cpp"
	-@del /f/q "ObjectIdListC.h"
	-@del /f/q "ObjectIdListS.h"
	-@del /f/q "AnyTypeCode\ObjectIdListA.h"
	-@del /f/q "ObjectIdListC.cpp"
	-@del /f/q "AnyTypeCode\ObjectIdListA.cpp"
	-@del /f/q "orb_typesC.h"
	-@del /f/q "orb_typesS.h"
	-@del /f/q "AnyTypeCode\orb_typesA.h"
	-@del /f/q "orb_typesC.cpp"
	-@del /f/q "AnyTypeCode\orb_typesA.cpp"
	-@del /f/q "Policy_ManagerC.h"
	-@del /f/q "Policy_ManagerS.h"
	-@del /f/q "AnyTypeCode\Policy_ManagerA.h"
	-@del /f/q "Policy_ManagerC.cpp"
	-@del /f/q "AnyTypeCode\Policy_ManagerA.cpp"
	-@del /f/q "Policy_CurrentC.h"
	-@del /f/q "Policy_CurrentS.h"
	-@del /f/q "AnyTypeCode\Policy_CurrentA.h"
	-@del /f/q "Policy_CurrentC.cpp"
	-@del /f/q "AnyTypeCode\Policy_CurrentA.cpp"
	-@del /f/q "PI_ForwardC.h"
	-@del /f/q "PI_ForwardS.h"
	-@del /f/q "AnyTypeCode\PI_ForwardA.h"
	-@del /f/q "PI_ForwardC.cpp"
	-@del /f/q "AnyTypeCode\PI_ForwardA.cpp"
	-@del /f/q "PortableInterceptorC.h"
	-@del /f/q "PortableInterceptorS.h"
	-@del /f/q "AnyTypeCode\PortableInterceptorA.h"
	-@del /f/q "PortableInterceptorC.cpp"
	-@del /f/q "AnyTypeCode\PortableInterceptorA.cpp"
	-@del /f/q "ServicesC.h"
	-@del /f/q "ServicesS.h"
	-@del /f/q "AnyTypeCode\ServicesA.h"
	-@del /f/q "ServicesC.cpp"
	-@del /f/q "AnyTypeCode\ServicesA.cpp"
	-@del /f/q "TAOC.h"
	-@del /f/q "TAOS.h"
	-@del /f/q "AnyTypeCode\TAOA.h"
	-@del /f/q "TAOC.cpp"
	-@del /f/q "AnyTypeCode\TAOA.cpp"
	-@del /f/q "TimeBaseC.h"
	-@del /f/q "TimeBaseS.h"
	-@del /f/q "AnyTypeCode\TimeBaseA.h"
	-@del /f/q "TimeBaseC.cpp"
	-@del /f/q "AnyTypeCode\TimeBaseA.cpp"
	-@del /f/q "Policy_ForwardC.h"
	-@del /f/q "Policy_ForwardS.h"
	-@del /f/q "AnyTypeCode\Policy_ForwardA.h"
	-@del /f/q "Policy_ForwardC.cpp"
	-@del /f/q "AnyTypeCode\Policy_ForwardA.cpp"
	-@del /f/q "ParameterModeC.h"
	-@del /f/q "ParameterModeS.h"
	-@del /f/q "AnyTypeCode\ParameterModeA.h"
	-@del /f/q "ParameterModeC.cpp"
	-@del /f/q "AnyTypeCode\ParameterModeA.cpp"
	-@del /f/q "BooleanSeqC.h"
	-@del /f/q "BooleanSeqS.h"
	-@del /f/q "AnyTypeCode\BooleanSeqA.h"
	-@del /f/q "BooleanSeqC.cpp"
	-@del /f/q "AnyTypeCode\BooleanSeqA.cpp"
	-@del /f/q "CharSeqC.h"
	-@del /f/q "CharSeqS.h"
	-@del /f/q "AnyTypeCode\CharSeqA.h"
	-@del /f/q "CharSeqC.cpp"
	-@del /f/q "AnyTypeCode\CharSeqA.cpp"
	-@del /f/q "DoubleSeqC.h"
	-@del /f/q "DoubleSeqS.h"
	-@del /f/q "AnyTypeCode\DoubleSeqA.h"
	-@del /f/q "DoubleSeqC.cpp"
	-@del /f/q "AnyTypeCode\DoubleSeqA.cpp"
	-@del /f/q "FloatSeqC.h"
	-@del /f/q "FloatSeqS.h"
	-@del /f/q "AnyTypeCode\FloatSeqA.h"
	-@del /f/q "FloatSeqC.cpp"
	-@del /f/q "AnyTypeCode\FloatSeqA.cpp"
	-@del /f/q "LongDoubleSeqC.h"
	-@del /f/q "LongDoubleSeqS.h"
	-@del /f/q "AnyTypeCode\LongDoubleSeqA.h"
	-@del /f/q "LongDoubleSeqC.cpp"
	-@del /f/q "AnyTypeCode\LongDoubleSeqA.cpp"
	-@del /f/q "LongLongSeqC.h"
	-@del /f/q "LongLongSeqS.h"
	-@del /f/q "AnyTypeCode\LongLongSeqA.h"
	-@del /f/q "LongLongSeqC.cpp"
	-@del /f/q "AnyTypeCode\LongLongSeqA.cpp"
	-@del /f/q "LongSeqC.h"
	-@del /f/q "LongSeqS.h"
	-@del /f/q "AnyTypeCode\LongSeqA.h"
	-@del /f/q "LongSeqC.cpp"
	-@del /f/q "AnyTypeCode\LongSeqA.cpp"
	-@del /f/q "OctetSeqC.h"
	-@del /f/q "OctetSeqS.h"
	-@del /f/q "AnyTypeCode\OctetSeqA.h"
	-@del /f/q "OctetSeqC.cpp"
	-@del /f/q "AnyTypeCode\OctetSeqA.cpp"
	-@del /f/q "ShortSeqC.h"
	-@del /f/q "ShortSeqS.h"
	-@del /f/q "AnyTypeCode\ShortSeqA.h"
	-@del /f/q "ShortSeqC.cpp"
	-@del /f/q "AnyTypeCode\ShortSeqA.cpp"
	-@del /f/q "StringSeqC.h"
	-@del /f/q "StringSeqS.h"
	-@del /f/q "AnyTypeCode\StringSeqA.h"
	-@del /f/q "StringSeqC.cpp"
	-@del /f/q "AnyTypeCode\StringSeqA.cpp"
	-@del /f/q "ULongLongSeqC.h"
	-@del /f/q "ULongLongSeqS.h"
	-@del /f/q "AnyTypeCode\ULongLongSeqA.h"
	-@del /f/q "ULongLongSeqC.cpp"
	-@del /f/q "AnyTypeCode\ULongLongSeqA.cpp"
	-@del /f/q "ULongSeqC.h"
	-@del /f/q "ULongSeqS.h"
	-@del /f/q "AnyTypeCode\ULongSeqA.h"
	-@del /f/q "ULongSeqC.cpp"
	-@del /f/q "AnyTypeCode\ULongSeqA.cpp"
	-@del /f/q "UShortSeqC.h"
	-@del /f/q "UShortSeqS.h"
	-@del /f/q "AnyTypeCode\UShortSeqA.h"
	-@del /f/q "UShortSeqC.cpp"
	-@del /f/q "AnyTypeCode\UShortSeqA.cpp"
	-@del /f/q "WCharSeqC.h"
	-@del /f/q "WCharSeqS.h"
	-@del /f/q "AnyTypeCode\WCharSeqA.h"
	-@del /f/q "WCharSeqC.cpp"
	-@del /f/q "AnyTypeCode\WCharSeqA.cpp"
	-@del /f/q "WStringSeqC.h"
	-@del /f/q "WStringSeqS.h"
	-@del /f/q "AnyTypeCode\WStringSeqA.h"
	-@del /f/q "WStringSeqC.cpp"
	-@del /f/q "AnyTypeCode\WStringSeqA.cpp"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\TAO_Core_idl\$(NULL)" mkdir "Static_Release\TAO_Core_idl"
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
!IF EXISTS("Makefile.TAO_Core_idl.dep")
!INCLUDE "Makefile.TAO_Core_idl.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
!IF  "$(CFG)" == "Win64 Debug"
SOURCE="GIOP.pidl"

InputPath=GIOP.pidl

"GIOPC.inl" "GIOPC.h" "GIOPS.h" "AnyTypeCode\GIOPA.h" "GIOPC.cpp" "AnyTypeCode\GIOPA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BEd.dll" "..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-GIOP_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h "$(InputPath)"
<<

SOURCE="CONV_FRAME.pidl"

InputPath=CONV_FRAME.pidl

"CONV_FRAMEC.h" "CONV_FRAMES.h" "AnyTypeCode\CONV_FRAMEA.h" "CONV_FRAMEC.cpp" "AnyTypeCode\CONV_FRAMEA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BEd.dll" "..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-CONV_FRAME_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="Current.pidl"

InputPath=Current.pidl

"CurrentC.h" "CurrentS.h" "AnyTypeCode\CurrentA.h" "CurrentC.cpp" "AnyTypeCode\CurrentA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BEd.dll" "..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-Current_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="IIOP.pidl"

InputPath=IIOP.pidl

"IIOPC.h" "IIOPS.h" "AnyTypeCode\IIOPA.h" "IIOPC.cpp" "AnyTypeCode\IIOPA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BEd.dll" "..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-IIOP_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="IIOP_Endpoints.pidl"

InputPath=IIOP_Endpoints.pidl

"IIOP_EndpointsC.h" "IIOP_EndpointsS.h" "AnyTypeCode\IIOP_EndpointsA.h" "IIOP_EndpointsC.cpp" "AnyTypeCode\IIOP_EndpointsA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BEd.dll" "..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-IIOP_Endpoints_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="IOP.pidl"

InputPath=IOP.pidl

"IOPC.h" "IOPS.h" "AnyTypeCode\IOPA.h" "IOPC.cpp" "AnyTypeCode\IOPA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BEd.dll" "..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-IOP_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="Messaging_PolicyValue.pidl"

InputPath=Messaging_PolicyValue.pidl

"Messaging_PolicyValueC.h" "Messaging_PolicyValueS.h" "AnyTypeCode\Messaging_PolicyValueA.h" "Messaging_PolicyValueC.cpp" "AnyTypeCode\Messaging_PolicyValueA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BEd.dll" "..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-Messaging_PolicyValue_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="Messaging_SyncScope.pidl"

InputPath=Messaging_SyncScope.pidl

"Messaging_SyncScopeC.h" "Messaging_SyncScopeS.h" "AnyTypeCode\Messaging_SyncScopeA.h" "Messaging_SyncScopeC.cpp" "AnyTypeCode\Messaging_SyncScopeA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BEd.dll" "..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-Messaging_SyncScope_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="ObjectIdList.pidl"

InputPath=ObjectIdList.pidl

"ObjectIdListC.h" "ObjectIdListS.h" "AnyTypeCode\ObjectIdListA.h" "ObjectIdListC.cpp" "AnyTypeCode\ObjectIdListA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BEd.dll" "..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-ObjectIdList_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="orb_types.pidl"

InputPath=orb_types.pidl

"orb_typesC.h" "orb_typesS.h" "AnyTypeCode\orb_typesA.h" "orb_typesC.cpp" "AnyTypeCode\orb_typesA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BEd.dll" "..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-orb_types_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="Policy_Manager.pidl"

InputPath=Policy_Manager.pidl

"Policy_ManagerC.h" "Policy_ManagerS.h" "AnyTypeCode\Policy_ManagerA.h" "Policy_ManagerC.cpp" "AnyTypeCode\Policy_ManagerA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BEd.dll" "..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-Policy_Manager_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="Policy_Current.pidl"

InputPath=Policy_Current.pidl

"Policy_CurrentC.h" "Policy_CurrentS.h" "AnyTypeCode\Policy_CurrentA.h" "Policy_CurrentC.cpp" "AnyTypeCode\Policy_CurrentA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BEd.dll" "..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-Policy_Current_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="PI_Forward.pidl"

InputPath=PI_Forward.pidl

"PI_ForwardC.h" "PI_ForwardS.h" "AnyTypeCode\PI_ForwardA.h" "PI_ForwardC.cpp" "AnyTypeCode\PI_ForwardA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BEd.dll" "..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-PI_Forward_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="PortableInterceptor.pidl"

InputPath=PortableInterceptor.pidl

"PortableInterceptorC.h" "PortableInterceptorS.h" "AnyTypeCode\PortableInterceptorA.h" "PortableInterceptorC.cpp" "AnyTypeCode\PortableInterceptorA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BEd.dll" "..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-PortableInterceptor_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="Services.pidl"

InputPath=Services.pidl

"ServicesC.h" "ServicesS.h" "AnyTypeCode\ServicesA.h" "ServicesC.cpp" "AnyTypeCode\ServicesA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BEd.dll" "..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-Services_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="TAO.pidl"

InputPath=TAO.pidl

"TAOC.h" "TAOS.h" "AnyTypeCode\TAOA.h" "TAOC.cpp" "AnyTypeCode\TAOA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BEd.dll" "..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-TAO_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="TimeBase.pidl"

InputPath=TimeBase.pidl

"TimeBaseC.h" "TimeBaseS.h" "AnyTypeCode\TimeBaseA.h" "TimeBaseC.cpp" "AnyTypeCode\TimeBaseA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BEd.dll" "..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-TimeBase_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="Policy_Forward.pidl"

InputPath=Policy_Forward.pidl

"Policy_ForwardC.h" "Policy_ForwardS.h" "AnyTypeCode\Policy_ForwardA.h" "Policy_ForwardC.cpp" "AnyTypeCode\Policy_ForwardA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BEd.dll" "..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-Policy_Forward_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Sa "$(InputPath)"
<<

SOURCE="ParameterMode.pidl"

InputPath=ParameterMode.pidl

"ParameterModeC.h" "ParameterModeS.h" "AnyTypeCode\ParameterModeA.h" "ParameterModeC.cpp" "AnyTypeCode\ParameterModeA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BEd.dll" "..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-ParameterMode_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Sat "$(InputPath)"
<<

SOURCE="BooleanSeq.pidl"

InputPath=BooleanSeq.pidl

"BooleanSeqC.h" "BooleanSeqS.h" "AnyTypeCode\BooleanSeqA.h" "BooleanSeqC.cpp" "AnyTypeCode\BooleanSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BEd.dll" "..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-BooleanSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="CharSeq.pidl"

InputPath=CharSeq.pidl

"CharSeqC.h" "CharSeqS.h" "AnyTypeCode\CharSeqA.h" "CharSeqC.cpp" "AnyTypeCode\CharSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BEd.dll" "..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-CharSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="DoubleSeq.pidl"

InputPath=DoubleSeq.pidl

"DoubleSeqC.h" "DoubleSeqS.h" "AnyTypeCode\DoubleSeqA.h" "DoubleSeqC.cpp" "AnyTypeCode\DoubleSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BEd.dll" "..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-DoubleSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="FloatSeq.pidl"

InputPath=FloatSeq.pidl

"FloatSeqC.h" "FloatSeqS.h" "AnyTypeCode\FloatSeqA.h" "FloatSeqC.cpp" "AnyTypeCode\FloatSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BEd.dll" "..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-FloatSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="LongDoubleSeq.pidl"

InputPath=LongDoubleSeq.pidl

"LongDoubleSeqC.h" "LongDoubleSeqS.h" "AnyTypeCode\LongDoubleSeqA.h" "LongDoubleSeqC.cpp" "AnyTypeCode\LongDoubleSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BEd.dll" "..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-LongDoubleSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="LongLongSeq.pidl"

InputPath=LongLongSeq.pidl

"LongLongSeqC.h" "LongLongSeqS.h" "AnyTypeCode\LongLongSeqA.h" "LongLongSeqC.cpp" "AnyTypeCode\LongLongSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BEd.dll" "..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-LongLongSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="LongSeq.pidl"

InputPath=LongSeq.pidl

"LongSeqC.h" "LongSeqS.h" "AnyTypeCode\LongSeqA.h" "LongSeqC.cpp" "AnyTypeCode\LongSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BEd.dll" "..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-LongSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="OctetSeq.pidl"

InputPath=OctetSeq.pidl

"OctetSeqC.h" "OctetSeqS.h" "AnyTypeCode\OctetSeqA.h" "OctetSeqC.cpp" "AnyTypeCode\OctetSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BEd.dll" "..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-OctetSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="ShortSeq.pidl"

InputPath=ShortSeq.pidl

"ShortSeqC.h" "ShortSeqS.h" "AnyTypeCode\ShortSeqA.h" "ShortSeqC.cpp" "AnyTypeCode\ShortSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BEd.dll" "..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-ShortSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="StringSeq.pidl"

InputPath=StringSeq.pidl

"StringSeqC.h" "StringSeqS.h" "AnyTypeCode\StringSeqA.h" "StringSeqC.cpp" "AnyTypeCode\StringSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BEd.dll" "..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-StringSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="ULongLongSeq.pidl"

InputPath=ULongLongSeq.pidl

"ULongLongSeqC.h" "ULongLongSeqS.h" "AnyTypeCode\ULongLongSeqA.h" "ULongLongSeqC.cpp" "AnyTypeCode\ULongLongSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BEd.dll" "..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-ULongLongSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="ULongSeq.pidl"

InputPath=ULongSeq.pidl

"ULongSeqC.h" "ULongSeqS.h" "AnyTypeCode\ULongSeqA.h" "ULongSeqC.cpp" "AnyTypeCode\ULongSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BEd.dll" "..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-ULongSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="UShortSeq.pidl"

InputPath=UShortSeq.pidl

"UShortSeqC.h" "UShortSeqS.h" "AnyTypeCode\UShortSeqA.h" "UShortSeqC.cpp" "AnyTypeCode\UShortSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BEd.dll" "..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-UShortSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="WCharSeq.pidl"

InputPath=WCharSeq.pidl

"WCharSeqC.h" "WCharSeqS.h" "AnyTypeCode\WCharSeqA.h" "WCharSeqC.cpp" "AnyTypeCode\WCharSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BEd.dll" "..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-WCharSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="WStringSeq.pidl"

InputPath=WStringSeq.pidl

"WStringSeqC.h" "WStringSeqS.h" "AnyTypeCode\WStringSeqA.h" "WStringSeqC.cpp" "AnyTypeCode\WStringSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BEd.dll" "..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-WStringSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Release"
SOURCE="GIOP.pidl"

InputPath=GIOP.pidl

"GIOPC.inl" "GIOPC.h" "GIOPS.h" "AnyTypeCode\GIOPA.h" "GIOPC.cpp" "AnyTypeCode\GIOPA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BE.dll" "..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-GIOP_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h "$(InputPath)"
<<

SOURCE="CONV_FRAME.pidl"

InputPath=CONV_FRAME.pidl

"CONV_FRAMEC.h" "CONV_FRAMES.h" "AnyTypeCode\CONV_FRAMEA.h" "CONV_FRAMEC.cpp" "AnyTypeCode\CONV_FRAMEA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BE.dll" "..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-CONV_FRAME_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="Current.pidl"

InputPath=Current.pidl

"CurrentC.h" "CurrentS.h" "AnyTypeCode\CurrentA.h" "CurrentC.cpp" "AnyTypeCode\CurrentA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BE.dll" "..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-Current_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="IIOP.pidl"

InputPath=IIOP.pidl

"IIOPC.h" "IIOPS.h" "AnyTypeCode\IIOPA.h" "IIOPC.cpp" "AnyTypeCode\IIOPA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BE.dll" "..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-IIOP_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="IIOP_Endpoints.pidl"

InputPath=IIOP_Endpoints.pidl

"IIOP_EndpointsC.h" "IIOP_EndpointsS.h" "AnyTypeCode\IIOP_EndpointsA.h" "IIOP_EndpointsC.cpp" "AnyTypeCode\IIOP_EndpointsA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BE.dll" "..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-IIOP_Endpoints_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="IOP.pidl"

InputPath=IOP.pidl

"IOPC.h" "IOPS.h" "AnyTypeCode\IOPA.h" "IOPC.cpp" "AnyTypeCode\IOPA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BE.dll" "..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-IOP_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="Messaging_PolicyValue.pidl"

InputPath=Messaging_PolicyValue.pidl

"Messaging_PolicyValueC.h" "Messaging_PolicyValueS.h" "AnyTypeCode\Messaging_PolicyValueA.h" "Messaging_PolicyValueC.cpp" "AnyTypeCode\Messaging_PolicyValueA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BE.dll" "..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-Messaging_PolicyValue_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="Messaging_SyncScope.pidl"

InputPath=Messaging_SyncScope.pidl

"Messaging_SyncScopeC.h" "Messaging_SyncScopeS.h" "AnyTypeCode\Messaging_SyncScopeA.h" "Messaging_SyncScopeC.cpp" "AnyTypeCode\Messaging_SyncScopeA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BE.dll" "..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-Messaging_SyncScope_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="ObjectIdList.pidl"

InputPath=ObjectIdList.pidl

"ObjectIdListC.h" "ObjectIdListS.h" "AnyTypeCode\ObjectIdListA.h" "ObjectIdListC.cpp" "AnyTypeCode\ObjectIdListA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BE.dll" "..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-ObjectIdList_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="orb_types.pidl"

InputPath=orb_types.pidl

"orb_typesC.h" "orb_typesS.h" "AnyTypeCode\orb_typesA.h" "orb_typesC.cpp" "AnyTypeCode\orb_typesA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BE.dll" "..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-orb_types_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="Policy_Manager.pidl"

InputPath=Policy_Manager.pidl

"Policy_ManagerC.h" "Policy_ManagerS.h" "AnyTypeCode\Policy_ManagerA.h" "Policy_ManagerC.cpp" "AnyTypeCode\Policy_ManagerA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BE.dll" "..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-Policy_Manager_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="Policy_Current.pidl"

InputPath=Policy_Current.pidl

"Policy_CurrentC.h" "Policy_CurrentS.h" "AnyTypeCode\Policy_CurrentA.h" "Policy_CurrentC.cpp" "AnyTypeCode\Policy_CurrentA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BE.dll" "..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-Policy_Current_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="PI_Forward.pidl"

InputPath=PI_Forward.pidl

"PI_ForwardC.h" "PI_ForwardS.h" "AnyTypeCode\PI_ForwardA.h" "PI_ForwardC.cpp" "AnyTypeCode\PI_ForwardA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BE.dll" "..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-PI_Forward_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="PortableInterceptor.pidl"

InputPath=PortableInterceptor.pidl

"PortableInterceptorC.h" "PortableInterceptorS.h" "AnyTypeCode\PortableInterceptorA.h" "PortableInterceptorC.cpp" "AnyTypeCode\PortableInterceptorA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BE.dll" "..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-PortableInterceptor_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="Services.pidl"

InputPath=Services.pidl

"ServicesC.h" "ServicesS.h" "AnyTypeCode\ServicesA.h" "ServicesC.cpp" "AnyTypeCode\ServicesA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BE.dll" "..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-Services_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="TAO.pidl"

InputPath=TAO.pidl

"TAOC.h" "TAOS.h" "AnyTypeCode\TAOA.h" "TAOC.cpp" "AnyTypeCode\TAOA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BE.dll" "..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-TAO_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="TimeBase.pidl"

InputPath=TimeBase.pidl

"TimeBaseC.h" "TimeBaseS.h" "AnyTypeCode\TimeBaseA.h" "TimeBaseC.cpp" "AnyTypeCode\TimeBaseA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BE.dll" "..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-TimeBase_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="Policy_Forward.pidl"

InputPath=Policy_Forward.pidl

"Policy_ForwardC.h" "Policy_ForwardS.h" "AnyTypeCode\Policy_ForwardA.h" "Policy_ForwardC.cpp" "AnyTypeCode\Policy_ForwardA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BE.dll" "..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-Policy_Forward_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Sa "$(InputPath)"
<<

SOURCE="ParameterMode.pidl"

InputPath=ParameterMode.pidl

"ParameterModeC.h" "ParameterModeS.h" "AnyTypeCode\ParameterModeA.h" "ParameterModeC.cpp" "AnyTypeCode\ParameterModeA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BE.dll" "..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-ParameterMode_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Sat "$(InputPath)"
<<

SOURCE="BooleanSeq.pidl"

InputPath=BooleanSeq.pidl

"BooleanSeqC.h" "BooleanSeqS.h" "AnyTypeCode\BooleanSeqA.h" "BooleanSeqC.cpp" "AnyTypeCode\BooleanSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BE.dll" "..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-BooleanSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="CharSeq.pidl"

InputPath=CharSeq.pidl

"CharSeqC.h" "CharSeqS.h" "AnyTypeCode\CharSeqA.h" "CharSeqC.cpp" "AnyTypeCode\CharSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BE.dll" "..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-CharSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="DoubleSeq.pidl"

InputPath=DoubleSeq.pidl

"DoubleSeqC.h" "DoubleSeqS.h" "AnyTypeCode\DoubleSeqA.h" "DoubleSeqC.cpp" "AnyTypeCode\DoubleSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BE.dll" "..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-DoubleSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="FloatSeq.pidl"

InputPath=FloatSeq.pidl

"FloatSeqC.h" "FloatSeqS.h" "AnyTypeCode\FloatSeqA.h" "FloatSeqC.cpp" "AnyTypeCode\FloatSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BE.dll" "..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-FloatSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="LongDoubleSeq.pidl"

InputPath=LongDoubleSeq.pidl

"LongDoubleSeqC.h" "LongDoubleSeqS.h" "AnyTypeCode\LongDoubleSeqA.h" "LongDoubleSeqC.cpp" "AnyTypeCode\LongDoubleSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BE.dll" "..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-LongDoubleSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="LongLongSeq.pidl"

InputPath=LongLongSeq.pidl

"LongLongSeqC.h" "LongLongSeqS.h" "AnyTypeCode\LongLongSeqA.h" "LongLongSeqC.cpp" "AnyTypeCode\LongLongSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BE.dll" "..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-LongLongSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="LongSeq.pidl"

InputPath=LongSeq.pidl

"LongSeqC.h" "LongSeqS.h" "AnyTypeCode\LongSeqA.h" "LongSeqC.cpp" "AnyTypeCode\LongSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BE.dll" "..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-LongSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="OctetSeq.pidl"

InputPath=OctetSeq.pidl

"OctetSeqC.h" "OctetSeqS.h" "AnyTypeCode\OctetSeqA.h" "OctetSeqC.cpp" "AnyTypeCode\OctetSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BE.dll" "..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-OctetSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="ShortSeq.pidl"

InputPath=ShortSeq.pidl

"ShortSeqC.h" "ShortSeqS.h" "AnyTypeCode\ShortSeqA.h" "ShortSeqC.cpp" "AnyTypeCode\ShortSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BE.dll" "..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-ShortSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="StringSeq.pidl"

InputPath=StringSeq.pidl

"StringSeqC.h" "StringSeqS.h" "AnyTypeCode\StringSeqA.h" "StringSeqC.cpp" "AnyTypeCode\StringSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BE.dll" "..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-StringSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="ULongLongSeq.pidl"

InputPath=ULongLongSeq.pidl

"ULongLongSeqC.h" "ULongLongSeqS.h" "AnyTypeCode\ULongLongSeqA.h" "ULongLongSeqC.cpp" "AnyTypeCode\ULongLongSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BE.dll" "..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-ULongLongSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="ULongSeq.pidl"

InputPath=ULongSeq.pidl

"ULongSeqC.h" "ULongSeqS.h" "AnyTypeCode\ULongSeqA.h" "ULongSeqC.cpp" "AnyTypeCode\ULongSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BE.dll" "..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-ULongSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="UShortSeq.pidl"

InputPath=UShortSeq.pidl

"UShortSeqC.h" "UShortSeqS.h" "AnyTypeCode\UShortSeqA.h" "UShortSeqC.cpp" "AnyTypeCode\UShortSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BE.dll" "..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-UShortSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="WCharSeq.pidl"

InputPath=WCharSeq.pidl

"WCharSeqC.h" "WCharSeqS.h" "AnyTypeCode\WCharSeqA.h" "WCharSeqC.cpp" "AnyTypeCode\WCharSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BE.dll" "..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-WCharSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="WStringSeq.pidl"

InputPath=WStringSeq.pidl

"WStringSeqC.h" "WStringSeqS.h" "AnyTypeCode\WStringSeqA.h" "WStringSeqC.cpp" "AnyTypeCode\WStringSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe" "..\..\lib\TAO_IDL_BE.dll" "..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-WStringSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Debug"
SOURCE="GIOP.pidl"

InputPath=GIOP.pidl

"GIOPC.inl" "GIOPC.h" "GIOPS.h" "AnyTypeCode\GIOPA.h" "GIOPC.cpp" "AnyTypeCode\GIOPA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-GIOP_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h "$(InputPath)"
<<

SOURCE="CONV_FRAME.pidl"

InputPath=CONV_FRAME.pidl

"CONV_FRAMEC.h" "CONV_FRAMES.h" "AnyTypeCode\CONV_FRAMEA.h" "CONV_FRAMEC.cpp" "AnyTypeCode\CONV_FRAMEA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-CONV_FRAME_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="Current.pidl"

InputPath=Current.pidl

"CurrentC.h" "CurrentS.h" "AnyTypeCode\CurrentA.h" "CurrentC.cpp" "AnyTypeCode\CurrentA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-Current_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="IIOP.pidl"

InputPath=IIOP.pidl

"IIOPC.h" "IIOPS.h" "AnyTypeCode\IIOPA.h" "IIOPC.cpp" "AnyTypeCode\IIOPA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-IIOP_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="IIOP_Endpoints.pidl"

InputPath=IIOP_Endpoints.pidl

"IIOP_EndpointsC.h" "IIOP_EndpointsS.h" "AnyTypeCode\IIOP_EndpointsA.h" "IIOP_EndpointsC.cpp" "AnyTypeCode\IIOP_EndpointsA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-IIOP_Endpoints_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="IOP.pidl"

InputPath=IOP.pidl

"IOPC.h" "IOPS.h" "AnyTypeCode\IOPA.h" "IOPC.cpp" "AnyTypeCode\IOPA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-IOP_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="Messaging_PolicyValue.pidl"

InputPath=Messaging_PolicyValue.pidl

"Messaging_PolicyValueC.h" "Messaging_PolicyValueS.h" "AnyTypeCode\Messaging_PolicyValueA.h" "Messaging_PolicyValueC.cpp" "AnyTypeCode\Messaging_PolicyValueA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-Messaging_PolicyValue_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="Messaging_SyncScope.pidl"

InputPath=Messaging_SyncScope.pidl

"Messaging_SyncScopeC.h" "Messaging_SyncScopeS.h" "AnyTypeCode\Messaging_SyncScopeA.h" "Messaging_SyncScopeC.cpp" "AnyTypeCode\Messaging_SyncScopeA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-Messaging_SyncScope_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="ObjectIdList.pidl"

InputPath=ObjectIdList.pidl

"ObjectIdListC.h" "ObjectIdListS.h" "AnyTypeCode\ObjectIdListA.h" "ObjectIdListC.cpp" "AnyTypeCode\ObjectIdListA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-ObjectIdList_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="orb_types.pidl"

InputPath=orb_types.pidl

"orb_typesC.h" "orb_typesS.h" "AnyTypeCode\orb_typesA.h" "orb_typesC.cpp" "AnyTypeCode\orb_typesA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-orb_types_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="Policy_Manager.pidl"

InputPath=Policy_Manager.pidl

"Policy_ManagerC.h" "Policy_ManagerS.h" "AnyTypeCode\Policy_ManagerA.h" "Policy_ManagerC.cpp" "AnyTypeCode\Policy_ManagerA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-Policy_Manager_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="Policy_Current.pidl"

InputPath=Policy_Current.pidl

"Policy_CurrentC.h" "Policy_CurrentS.h" "AnyTypeCode\Policy_CurrentA.h" "Policy_CurrentC.cpp" "AnyTypeCode\Policy_CurrentA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-Policy_Current_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="PI_Forward.pidl"

InputPath=PI_Forward.pidl

"PI_ForwardC.h" "PI_ForwardS.h" "AnyTypeCode\PI_ForwardA.h" "PI_ForwardC.cpp" "AnyTypeCode\PI_ForwardA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-PI_Forward_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="PortableInterceptor.pidl"

InputPath=PortableInterceptor.pidl

"PortableInterceptorC.h" "PortableInterceptorS.h" "AnyTypeCode\PortableInterceptorA.h" "PortableInterceptorC.cpp" "AnyTypeCode\PortableInterceptorA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-PortableInterceptor_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="Services.pidl"

InputPath=Services.pidl

"ServicesC.h" "ServicesS.h" "AnyTypeCode\ServicesA.h" "ServicesC.cpp" "AnyTypeCode\ServicesA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-Services_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="TAO.pidl"

InputPath=TAO.pidl

"TAOC.h" "TAOS.h" "AnyTypeCode\TAOA.h" "TAOC.cpp" "AnyTypeCode\TAOA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-TAO_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="TimeBase.pidl"

InputPath=TimeBase.pidl

"TimeBaseC.h" "TimeBaseS.h" "AnyTypeCode\TimeBaseA.h" "TimeBaseC.cpp" "AnyTypeCode\TimeBaseA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-TimeBase_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="Policy_Forward.pidl"

InputPath=Policy_Forward.pidl

"Policy_ForwardC.h" "Policy_ForwardS.h" "AnyTypeCode\Policy_ForwardA.h" "Policy_ForwardC.cpp" "AnyTypeCode\Policy_ForwardA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-Policy_Forward_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Sa "$(InputPath)"
<<

SOURCE="ParameterMode.pidl"

InputPath=ParameterMode.pidl

"ParameterModeC.h" "ParameterModeS.h" "AnyTypeCode\ParameterModeA.h" "ParameterModeC.cpp" "AnyTypeCode\ParameterModeA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-ParameterMode_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Sat "$(InputPath)"
<<

SOURCE="BooleanSeq.pidl"

InputPath=BooleanSeq.pidl

"BooleanSeqC.h" "BooleanSeqS.h" "AnyTypeCode\BooleanSeqA.h" "BooleanSeqC.cpp" "AnyTypeCode\BooleanSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-BooleanSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="CharSeq.pidl"

InputPath=CharSeq.pidl

"CharSeqC.h" "CharSeqS.h" "AnyTypeCode\CharSeqA.h" "CharSeqC.cpp" "AnyTypeCode\CharSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-CharSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="DoubleSeq.pidl"

InputPath=DoubleSeq.pidl

"DoubleSeqC.h" "DoubleSeqS.h" "AnyTypeCode\DoubleSeqA.h" "DoubleSeqC.cpp" "AnyTypeCode\DoubleSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-DoubleSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="FloatSeq.pidl"

InputPath=FloatSeq.pidl

"FloatSeqC.h" "FloatSeqS.h" "AnyTypeCode\FloatSeqA.h" "FloatSeqC.cpp" "AnyTypeCode\FloatSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-FloatSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="LongDoubleSeq.pidl"

InputPath=LongDoubleSeq.pidl

"LongDoubleSeqC.h" "LongDoubleSeqS.h" "AnyTypeCode\LongDoubleSeqA.h" "LongDoubleSeqC.cpp" "AnyTypeCode\LongDoubleSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-LongDoubleSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="LongLongSeq.pidl"

InputPath=LongLongSeq.pidl

"LongLongSeqC.h" "LongLongSeqS.h" "AnyTypeCode\LongLongSeqA.h" "LongLongSeqC.cpp" "AnyTypeCode\LongLongSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-LongLongSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="LongSeq.pidl"

InputPath=LongSeq.pidl

"LongSeqC.h" "LongSeqS.h" "AnyTypeCode\LongSeqA.h" "LongSeqC.cpp" "AnyTypeCode\LongSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-LongSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="OctetSeq.pidl"

InputPath=OctetSeq.pidl

"OctetSeqC.h" "OctetSeqS.h" "AnyTypeCode\OctetSeqA.h" "OctetSeqC.cpp" "AnyTypeCode\OctetSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-OctetSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="ShortSeq.pidl"

InputPath=ShortSeq.pidl

"ShortSeqC.h" "ShortSeqS.h" "AnyTypeCode\ShortSeqA.h" "ShortSeqC.cpp" "AnyTypeCode\ShortSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-ShortSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="StringSeq.pidl"

InputPath=StringSeq.pidl

"StringSeqC.h" "StringSeqS.h" "AnyTypeCode\StringSeqA.h" "StringSeqC.cpp" "AnyTypeCode\StringSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-StringSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="ULongLongSeq.pidl"

InputPath=ULongLongSeq.pidl

"ULongLongSeqC.h" "ULongLongSeqS.h" "AnyTypeCode\ULongLongSeqA.h" "ULongLongSeqC.cpp" "AnyTypeCode\ULongLongSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-ULongLongSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="ULongSeq.pidl"

InputPath=ULongSeq.pidl

"ULongSeqC.h" "ULongSeqS.h" "AnyTypeCode\ULongSeqA.h" "ULongSeqC.cpp" "AnyTypeCode\ULongSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-ULongSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="UShortSeq.pidl"

InputPath=UShortSeq.pidl

"UShortSeqC.h" "UShortSeqS.h" "AnyTypeCode\UShortSeqA.h" "UShortSeqC.cpp" "AnyTypeCode\UShortSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-UShortSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="WCharSeq.pidl"

InputPath=WCharSeq.pidl

"WCharSeqC.h" "WCharSeqS.h" "AnyTypeCode\WCharSeqA.h" "WCharSeqC.cpp" "AnyTypeCode\WCharSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-WCharSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="WStringSeq.pidl"

InputPath=WStringSeq.pidl

"WStringSeqC.h" "WStringSeqS.h" "AnyTypeCode\WStringSeqA.h" "WStringSeqC.cpp" "AnyTypeCode\WStringSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-WStringSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Release"
SOURCE="GIOP.pidl"

InputPath=GIOP.pidl

"GIOPC.inl" "GIOPC.h" "GIOPS.h" "AnyTypeCode\GIOPA.h" "GIOPC.cpp" "AnyTypeCode\GIOPA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-GIOP_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h "$(InputPath)"
<<

SOURCE="CONV_FRAME.pidl"

InputPath=CONV_FRAME.pidl

"CONV_FRAMEC.h" "CONV_FRAMES.h" "AnyTypeCode\CONV_FRAMEA.h" "CONV_FRAMEC.cpp" "AnyTypeCode\CONV_FRAMEA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-CONV_FRAME_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="Current.pidl"

InputPath=Current.pidl

"CurrentC.h" "CurrentS.h" "AnyTypeCode\CurrentA.h" "CurrentC.cpp" "AnyTypeCode\CurrentA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-Current_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="IIOP.pidl"

InputPath=IIOP.pidl

"IIOPC.h" "IIOPS.h" "AnyTypeCode\IIOPA.h" "IIOPC.cpp" "AnyTypeCode\IIOPA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-IIOP_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="IIOP_Endpoints.pidl"

InputPath=IIOP_Endpoints.pidl

"IIOP_EndpointsC.h" "IIOP_EndpointsS.h" "AnyTypeCode\IIOP_EndpointsA.h" "IIOP_EndpointsC.cpp" "AnyTypeCode\IIOP_EndpointsA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-IIOP_Endpoints_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="IOP.pidl"

InputPath=IOP.pidl

"IOPC.h" "IOPS.h" "AnyTypeCode\IOPA.h" "IOPC.cpp" "AnyTypeCode\IOPA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-IOP_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="Messaging_PolicyValue.pidl"

InputPath=Messaging_PolicyValue.pidl

"Messaging_PolicyValueC.h" "Messaging_PolicyValueS.h" "AnyTypeCode\Messaging_PolicyValueA.h" "Messaging_PolicyValueC.cpp" "AnyTypeCode\Messaging_PolicyValueA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-Messaging_PolicyValue_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="Messaging_SyncScope.pidl"

InputPath=Messaging_SyncScope.pidl

"Messaging_SyncScopeC.h" "Messaging_SyncScopeS.h" "AnyTypeCode\Messaging_SyncScopeA.h" "Messaging_SyncScopeC.cpp" "AnyTypeCode\Messaging_SyncScopeA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-Messaging_SyncScope_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="ObjectIdList.pidl"

InputPath=ObjectIdList.pidl

"ObjectIdListC.h" "ObjectIdListS.h" "AnyTypeCode\ObjectIdListA.h" "ObjectIdListC.cpp" "AnyTypeCode\ObjectIdListA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-ObjectIdList_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="orb_types.pidl"

InputPath=orb_types.pidl

"orb_typesC.h" "orb_typesS.h" "AnyTypeCode\orb_typesA.h" "orb_typesC.cpp" "AnyTypeCode\orb_typesA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-orb_types_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="Policy_Manager.pidl"

InputPath=Policy_Manager.pidl

"Policy_ManagerC.h" "Policy_ManagerS.h" "AnyTypeCode\Policy_ManagerA.h" "Policy_ManagerC.cpp" "AnyTypeCode\Policy_ManagerA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-Policy_Manager_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="Policy_Current.pidl"

InputPath=Policy_Current.pidl

"Policy_CurrentC.h" "Policy_CurrentS.h" "AnyTypeCode\Policy_CurrentA.h" "Policy_CurrentC.cpp" "AnyTypeCode\Policy_CurrentA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-Policy_Current_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="PI_Forward.pidl"

InputPath=PI_Forward.pidl

"PI_ForwardC.h" "PI_ForwardS.h" "AnyTypeCode\PI_ForwardA.h" "PI_ForwardC.cpp" "AnyTypeCode\PI_ForwardA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-PI_Forward_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="PortableInterceptor.pidl"

InputPath=PortableInterceptor.pidl

"PortableInterceptorC.h" "PortableInterceptorS.h" "AnyTypeCode\PortableInterceptorA.h" "PortableInterceptorC.cpp" "AnyTypeCode\PortableInterceptorA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-PortableInterceptor_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="Services.pidl"

InputPath=Services.pidl

"ServicesC.h" "ServicesS.h" "AnyTypeCode\ServicesA.h" "ServicesC.cpp" "AnyTypeCode\ServicesA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-Services_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="TAO.pidl"

InputPath=TAO.pidl

"TAOC.h" "TAOS.h" "AnyTypeCode\TAOA.h" "TAOC.cpp" "AnyTypeCode\TAOA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-TAO_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="TimeBase.pidl"

InputPath=TimeBase.pidl

"TimeBaseC.h" "TimeBaseS.h" "AnyTypeCode\TimeBaseA.h" "TimeBaseC.cpp" "AnyTypeCode\TimeBaseA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-TimeBase_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci "$(InputPath)"
<<

SOURCE="Policy_Forward.pidl"

InputPath=Policy_Forward.pidl

"Policy_ForwardC.h" "Policy_ForwardS.h" "AnyTypeCode\Policy_ForwardA.h" "Policy_ForwardC.cpp" "AnyTypeCode\Policy_ForwardA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-Policy_Forward_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Sa "$(InputPath)"
<<

SOURCE="ParameterMode.pidl"

InputPath=ParameterMode.pidl

"ParameterModeC.h" "ParameterModeS.h" "AnyTypeCode\ParameterModeA.h" "ParameterModeC.cpp" "AnyTypeCode\ParameterModeA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-ParameterMode_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Sat "$(InputPath)"
<<

SOURCE="BooleanSeq.pidl"

InputPath=BooleanSeq.pidl

"BooleanSeqC.h" "BooleanSeqS.h" "AnyTypeCode\BooleanSeqA.h" "BooleanSeqC.cpp" "AnyTypeCode\BooleanSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-BooleanSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="CharSeq.pidl"

InputPath=CharSeq.pidl

"CharSeqC.h" "CharSeqS.h" "AnyTypeCode\CharSeqA.h" "CharSeqC.cpp" "AnyTypeCode\CharSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-CharSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="DoubleSeq.pidl"

InputPath=DoubleSeq.pidl

"DoubleSeqC.h" "DoubleSeqS.h" "AnyTypeCode\DoubleSeqA.h" "DoubleSeqC.cpp" "AnyTypeCode\DoubleSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-DoubleSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="FloatSeq.pidl"

InputPath=FloatSeq.pidl

"FloatSeqC.h" "FloatSeqS.h" "AnyTypeCode\FloatSeqA.h" "FloatSeqC.cpp" "AnyTypeCode\FloatSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-FloatSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="LongDoubleSeq.pidl"

InputPath=LongDoubleSeq.pidl

"LongDoubleSeqC.h" "LongDoubleSeqS.h" "AnyTypeCode\LongDoubleSeqA.h" "LongDoubleSeqC.cpp" "AnyTypeCode\LongDoubleSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-LongDoubleSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="LongLongSeq.pidl"

InputPath=LongLongSeq.pidl

"LongLongSeqC.h" "LongLongSeqS.h" "AnyTypeCode\LongLongSeqA.h" "LongLongSeqC.cpp" "AnyTypeCode\LongLongSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-LongLongSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="LongSeq.pidl"

InputPath=LongSeq.pidl

"LongSeqC.h" "LongSeqS.h" "AnyTypeCode\LongSeqA.h" "LongSeqC.cpp" "AnyTypeCode\LongSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-LongSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="OctetSeq.pidl"

InputPath=OctetSeq.pidl

"OctetSeqC.h" "OctetSeqS.h" "AnyTypeCode\OctetSeqA.h" "OctetSeqC.cpp" "AnyTypeCode\OctetSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-OctetSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="ShortSeq.pidl"

InputPath=ShortSeq.pidl

"ShortSeqC.h" "ShortSeqS.h" "AnyTypeCode\ShortSeqA.h" "ShortSeqC.cpp" "AnyTypeCode\ShortSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-ShortSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="StringSeq.pidl"

InputPath=StringSeq.pidl

"StringSeqC.h" "StringSeqS.h" "AnyTypeCode\StringSeqA.h" "StringSeqC.cpp" "AnyTypeCode\StringSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-StringSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="ULongLongSeq.pidl"

InputPath=ULongLongSeq.pidl

"ULongLongSeqC.h" "ULongLongSeqS.h" "AnyTypeCode\ULongLongSeqA.h" "ULongLongSeqC.cpp" "AnyTypeCode\ULongLongSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-ULongLongSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="ULongSeq.pidl"

InputPath=ULongSeq.pidl

"ULongSeqC.h" "ULongSeqS.h" "AnyTypeCode\ULongSeqA.h" "ULongSeqC.cpp" "AnyTypeCode\ULongSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-ULongSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="UShortSeq.pidl"

InputPath=UShortSeq.pidl

"UShortSeqC.h" "UShortSeqS.h" "AnyTypeCode\UShortSeqA.h" "UShortSeqC.cpp" "AnyTypeCode\UShortSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-UShortSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="WCharSeq.pidl"

InputPath=WCharSeq.pidl

"WCharSeqC.h" "WCharSeqS.h" "AnyTypeCode\WCharSeqA.h" "WCharSeqC.cpp" "AnyTypeCode\WCharSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-WCharSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

SOURCE="WStringSeq.pidl"

InputPath=WStringSeq.pidl

"WStringSeqC.h" "WStringSeqS.h" "AnyTypeCode\WStringSeqA.h" "WStringSeqC.cpp" "AnyTypeCode\WStringSeqA.cpp" : $(SOURCE)  "..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-WStringSeq_pidl.bat
	@echo off
	PATH=%PATH%;..\..\lib
	..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -Sorb -GA -Gp -Gd -oA AnyTypeCode -Wb,export_macro=TAO_Export -Wb,export_include=tao/TAO_Export.h -Wb,anyop_export_macro=TAO_AnyTypeCode_Export -Wb,anyop_export_include=tao/AnyTypeCode/TAO_AnyTypeCode_Export.h -Sci -Gse -Gata "$(InputPath)"
<<

!ENDIF


!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.TAO_Core_idl.dep")
	@echo Using "Makefile.TAO_Core_idl.dep"
!ENDIF
!ENDIF

