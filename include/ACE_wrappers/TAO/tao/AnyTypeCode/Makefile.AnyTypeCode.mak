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
!MESSAGE NMAKE /f "Makefile.AnyTypeCode.mak" CFG="Win64 Debug"
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

GENERATED_DIRTY =

!IF  "$(CFG)" == "Win64 Debug"

OUTDIR=..\..\..\lib
INTDIR=Debug\AnyTypeCode\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_AnyTypeCoded.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_ANYTYPECODE_BUILD_DLL -f "Makefile.AnyTypeCode.dep" "ServicesA.cpp" "Alias_TypeCode_Static.cpp" "Any.cpp" "AnySeqA.cpp" "AnySeqC.cpp" "Any_Basic_Impl.cpp" "Any_Impl.cpp" "Any_SystemException.cpp" "Any_Unknown_IDL_Type.cpp" "AnyTypeCode_Adapter_Impl.cpp" "append.cpp" "BasicTypeTraits.cpp" "BooleanSeqA.cpp" "BoundsA.cpp" "BoundsC.cpp" "CharSeqA.cpp" "CONV_FRAMEA.cpp" "CurrentA.cpp" "DoubleSeqA.cpp" "DynamicA.cpp" "DynamicC.cpp" "Dynamic_ParameterA.cpp" "Dynamic_ParameterC.cpp" "Empty_Param_TypeCode.cpp" "Enum_TypeCode_Static.cpp" "ExceptionA.cpp" "FloatSeqA.cpp" "GIOPA.cpp" "IIOPA.cpp" "IOPA.cpp" "IIOP_EndpointsA.cpp" "LongDoubleSeqA.cpp" "LongLongSeqA.cpp" "LongSeqA.cpp" "Marshal.cpp" "Messaging_PolicyValueA.cpp" "NVList.cpp" "NVList_Adapter_Impl.cpp" "ObjectIdListA.cpp" "Objref_TypeCode_Static.cpp" "OctetSeqA.cpp" "orb_typesA.cpp" "ParameterModeA.cpp" "PI_ForwardA.cpp" "PolicyA.cpp" "Policy_CurrentA.cpp" "Policy_ForwardA.cpp" "Policy_ManagerA.cpp" "PortableInterceptorA.cpp" "Sequence_TypeCode_Static.cpp" "ShortSeqA.cpp" "skip.cpp" "StringSeqA.cpp" "String_TypeCode_Static.cpp" "Struct_TypeCode_Static.cpp" "SystemExceptionA.cpp" "TAOA.cpp" "TimeBaseA.cpp" "True_RefCount_Policy.cpp" "TypeCode.cpp" "TypeCodeA.cpp" "TypeCode_CDR_Extraction.cpp" "TypeCode_Constants.cpp" "ULongLongSeqA.cpp" "ULongSeqA.cpp" "Union_TypeCode_Static.cpp" "UShortSeqA.cpp" "Value_TypeCode_Static.cpp" "ValueModifierC.cpp" "ValueModifierA.cpp" "VisibilityA.cpp" "VisibilityC.cpp" "WCharSeqA.cpp" "WrongTransactionA.cpp" "WStringSeqA.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_AnyTypeCoded.pdb"
	-@del /f/q "..\..\..\lib\TAO_AnyTypeCoded.dll"
	-@del /f/q "$(OUTDIR)\TAO_AnyTypeCoded.lib"
	-@del /f/q "$(OUTDIR)\TAO_AnyTypeCoded.exp"
	-@del /f/q "$(OUTDIR)\TAO_AnyTypeCoded.ilk"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\AnyTypeCode\$(NULL)" mkdir "Debug\AnyTypeCode"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_ANYTYPECODE_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\..\lib\TAO_AnyTypeCoded.pdb" /machine:IA64 /out:"..\..\..\lib\TAO_AnyTypeCoded.dll" /implib:"$(OUTDIR)\TAO_AnyTypeCoded.lib"
LINK32_OBJS= \
	"$(INTDIR)\TAO_AnyTypeCode.res" \
	"$(INTDIR)\ServicesA.obj" \
	"$(INTDIR)\Alias_TypeCode_Static.obj" \
	"$(INTDIR)\Any.obj" \
	"$(INTDIR)\AnySeqA.obj" \
	"$(INTDIR)\AnySeqC.obj" \
	"$(INTDIR)\Any_Basic_Impl.obj" \
	"$(INTDIR)\Any_Impl.obj" \
	"$(INTDIR)\Any_SystemException.obj" \
	"$(INTDIR)\Any_Unknown_IDL_Type.obj" \
	"$(INTDIR)\AnyTypeCode_Adapter_Impl.obj" \
	"$(INTDIR)\append.obj" \
	"$(INTDIR)\BasicTypeTraits.obj" \
	"$(INTDIR)\BooleanSeqA.obj" \
	"$(INTDIR)\BoundsA.obj" \
	"$(INTDIR)\BoundsC.obj" \
	"$(INTDIR)\CharSeqA.obj" \
	"$(INTDIR)\CONV_FRAMEA.obj" \
	"$(INTDIR)\CurrentA.obj" \
	"$(INTDIR)\DoubleSeqA.obj" \
	"$(INTDIR)\DynamicA.obj" \
	"$(INTDIR)\DynamicC.obj" \
	"$(INTDIR)\Dynamic_ParameterA.obj" \
	"$(INTDIR)\Dynamic_ParameterC.obj" \
	"$(INTDIR)\Empty_Param_TypeCode.obj" \
	"$(INTDIR)\Enum_TypeCode_Static.obj" \
	"$(INTDIR)\ExceptionA.obj" \
	"$(INTDIR)\FloatSeqA.obj" \
	"$(INTDIR)\GIOPA.obj" \
	"$(INTDIR)\IIOPA.obj" \
	"$(INTDIR)\IOPA.obj" \
	"$(INTDIR)\IIOP_EndpointsA.obj" \
	"$(INTDIR)\LongDoubleSeqA.obj" \
	"$(INTDIR)\LongLongSeqA.obj" \
	"$(INTDIR)\LongSeqA.obj" \
	"$(INTDIR)\Marshal.obj" \
	"$(INTDIR)\Messaging_PolicyValueA.obj" \
	"$(INTDIR)\NVList.obj" \
	"$(INTDIR)\NVList_Adapter_Impl.obj" \
	"$(INTDIR)\ObjectIdListA.obj" \
	"$(INTDIR)\Objref_TypeCode_Static.obj" \
	"$(INTDIR)\OctetSeqA.obj" \
	"$(INTDIR)\orb_typesA.obj" \
	"$(INTDIR)\ParameterModeA.obj" \
	"$(INTDIR)\PI_ForwardA.obj" \
	"$(INTDIR)\PolicyA.obj" \
	"$(INTDIR)\Policy_CurrentA.obj" \
	"$(INTDIR)\Policy_ForwardA.obj" \
	"$(INTDIR)\Policy_ManagerA.obj" \
	"$(INTDIR)\PortableInterceptorA.obj" \
	"$(INTDIR)\Sequence_TypeCode_Static.obj" \
	"$(INTDIR)\ShortSeqA.obj" \
	"$(INTDIR)\skip.obj" \
	"$(INTDIR)\StringSeqA.obj" \
	"$(INTDIR)\String_TypeCode_Static.obj" \
	"$(INTDIR)\Struct_TypeCode_Static.obj" \
	"$(INTDIR)\SystemExceptionA.obj" \
	"$(INTDIR)\TAOA.obj" \
	"$(INTDIR)\TimeBaseA.obj" \
	"$(INTDIR)\True_RefCount_Policy.obj" \
	"$(INTDIR)\TypeCode.obj" \
	"$(INTDIR)\TypeCodeA.obj" \
	"$(INTDIR)\TypeCode_CDR_Extraction.obj" \
	"$(INTDIR)\TypeCode_Constants.obj" \
	"$(INTDIR)\ULongLongSeqA.obj" \
	"$(INTDIR)\ULongSeqA.obj" \
	"$(INTDIR)\Union_TypeCode_Static.obj" \
	"$(INTDIR)\UShortSeqA.obj" \
	"$(INTDIR)\Value_TypeCode_Static.obj" \
	"$(INTDIR)\ValueModifierC.obj" \
	"$(INTDIR)\ValueModifierA.obj" \
	"$(INTDIR)\VisibilityA.obj" \
	"$(INTDIR)\VisibilityC.obj" \
	"$(INTDIR)\WCharSeqA.obj" \
	"$(INTDIR)\WrongTransactionA.obj" \
	"$(INTDIR)\WStringSeqA.obj"

"..\..\..\lib\TAO_AnyTypeCoded.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_AnyTypeCoded.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_AnyTypeCoded.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\AnyTypeCode\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_AnyTypeCode.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_ANYTYPECODE_BUILD_DLL -f "Makefile.AnyTypeCode.dep" "ServicesA.cpp" "Alias_TypeCode_Static.cpp" "Any.cpp" "AnySeqA.cpp" "AnySeqC.cpp" "Any_Basic_Impl.cpp" "Any_Impl.cpp" "Any_SystemException.cpp" "Any_Unknown_IDL_Type.cpp" "AnyTypeCode_Adapter_Impl.cpp" "append.cpp" "BasicTypeTraits.cpp" "BooleanSeqA.cpp" "BoundsA.cpp" "BoundsC.cpp" "CharSeqA.cpp" "CONV_FRAMEA.cpp" "CurrentA.cpp" "DoubleSeqA.cpp" "DynamicA.cpp" "DynamicC.cpp" "Dynamic_ParameterA.cpp" "Dynamic_ParameterC.cpp" "Empty_Param_TypeCode.cpp" "Enum_TypeCode_Static.cpp" "ExceptionA.cpp" "FloatSeqA.cpp" "GIOPA.cpp" "IIOPA.cpp" "IOPA.cpp" "IIOP_EndpointsA.cpp" "LongDoubleSeqA.cpp" "LongLongSeqA.cpp" "LongSeqA.cpp" "Marshal.cpp" "Messaging_PolicyValueA.cpp" "NVList.cpp" "NVList_Adapter_Impl.cpp" "ObjectIdListA.cpp" "Objref_TypeCode_Static.cpp" "OctetSeqA.cpp" "orb_typesA.cpp" "ParameterModeA.cpp" "PI_ForwardA.cpp" "PolicyA.cpp" "Policy_CurrentA.cpp" "Policy_ForwardA.cpp" "Policy_ManagerA.cpp" "PortableInterceptorA.cpp" "Sequence_TypeCode_Static.cpp" "ShortSeqA.cpp" "skip.cpp" "StringSeqA.cpp" "String_TypeCode_Static.cpp" "Struct_TypeCode_Static.cpp" "SystemExceptionA.cpp" "TAOA.cpp" "TimeBaseA.cpp" "True_RefCount_Policy.cpp" "TypeCode.cpp" "TypeCodeA.cpp" "TypeCode_CDR_Extraction.cpp" "TypeCode_Constants.cpp" "ULongLongSeqA.cpp" "ULongSeqA.cpp" "Union_TypeCode_Static.cpp" "UShortSeqA.cpp" "Value_TypeCode_Static.cpp" "ValueModifierC.cpp" "ValueModifierA.cpp" "VisibilityA.cpp" "VisibilityC.cpp" "WCharSeqA.cpp" "WrongTransactionA.cpp" "WStringSeqA.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\TAO_AnyTypeCode.dll"
	-@del /f/q "$(OUTDIR)\TAO_AnyTypeCode.lib"
	-@del /f/q "$(OUTDIR)\TAO_AnyTypeCode.exp"
	-@del /f/q "$(OUTDIR)\TAO_AnyTypeCode.ilk"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\AnyTypeCode\$(NULL)" mkdir "Release\AnyTypeCode"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_ANYTYPECODE_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\..\lib\TAO_AnyTypeCode.dll" /implib:"$(OUTDIR)\TAO_AnyTypeCode.lib"
LINK32_OBJS= \
	"$(INTDIR)\TAO_AnyTypeCode.res" \
	"$(INTDIR)\ServicesA.obj" \
	"$(INTDIR)\Alias_TypeCode_Static.obj" \
	"$(INTDIR)\Any.obj" \
	"$(INTDIR)\AnySeqA.obj" \
	"$(INTDIR)\AnySeqC.obj" \
	"$(INTDIR)\Any_Basic_Impl.obj" \
	"$(INTDIR)\Any_Impl.obj" \
	"$(INTDIR)\Any_SystemException.obj" \
	"$(INTDIR)\Any_Unknown_IDL_Type.obj" \
	"$(INTDIR)\AnyTypeCode_Adapter_Impl.obj" \
	"$(INTDIR)\append.obj" \
	"$(INTDIR)\BasicTypeTraits.obj" \
	"$(INTDIR)\BooleanSeqA.obj" \
	"$(INTDIR)\BoundsA.obj" \
	"$(INTDIR)\BoundsC.obj" \
	"$(INTDIR)\CharSeqA.obj" \
	"$(INTDIR)\CONV_FRAMEA.obj" \
	"$(INTDIR)\CurrentA.obj" \
	"$(INTDIR)\DoubleSeqA.obj" \
	"$(INTDIR)\DynamicA.obj" \
	"$(INTDIR)\DynamicC.obj" \
	"$(INTDIR)\Dynamic_ParameterA.obj" \
	"$(INTDIR)\Dynamic_ParameterC.obj" \
	"$(INTDIR)\Empty_Param_TypeCode.obj" \
	"$(INTDIR)\Enum_TypeCode_Static.obj" \
	"$(INTDIR)\ExceptionA.obj" \
	"$(INTDIR)\FloatSeqA.obj" \
	"$(INTDIR)\GIOPA.obj" \
	"$(INTDIR)\IIOPA.obj" \
	"$(INTDIR)\IOPA.obj" \
	"$(INTDIR)\IIOP_EndpointsA.obj" \
	"$(INTDIR)\LongDoubleSeqA.obj" \
	"$(INTDIR)\LongLongSeqA.obj" \
	"$(INTDIR)\LongSeqA.obj" \
	"$(INTDIR)\Marshal.obj" \
	"$(INTDIR)\Messaging_PolicyValueA.obj" \
	"$(INTDIR)\NVList.obj" \
	"$(INTDIR)\NVList_Adapter_Impl.obj" \
	"$(INTDIR)\ObjectIdListA.obj" \
	"$(INTDIR)\Objref_TypeCode_Static.obj" \
	"$(INTDIR)\OctetSeqA.obj" \
	"$(INTDIR)\orb_typesA.obj" \
	"$(INTDIR)\ParameterModeA.obj" \
	"$(INTDIR)\PI_ForwardA.obj" \
	"$(INTDIR)\PolicyA.obj" \
	"$(INTDIR)\Policy_CurrentA.obj" \
	"$(INTDIR)\Policy_ForwardA.obj" \
	"$(INTDIR)\Policy_ManagerA.obj" \
	"$(INTDIR)\PortableInterceptorA.obj" \
	"$(INTDIR)\Sequence_TypeCode_Static.obj" \
	"$(INTDIR)\ShortSeqA.obj" \
	"$(INTDIR)\skip.obj" \
	"$(INTDIR)\StringSeqA.obj" \
	"$(INTDIR)\String_TypeCode_Static.obj" \
	"$(INTDIR)\Struct_TypeCode_Static.obj" \
	"$(INTDIR)\SystemExceptionA.obj" \
	"$(INTDIR)\TAOA.obj" \
	"$(INTDIR)\TimeBaseA.obj" \
	"$(INTDIR)\True_RefCount_Policy.obj" \
	"$(INTDIR)\TypeCode.obj" \
	"$(INTDIR)\TypeCodeA.obj" \
	"$(INTDIR)\TypeCode_CDR_Extraction.obj" \
	"$(INTDIR)\TypeCode_Constants.obj" \
	"$(INTDIR)\ULongLongSeqA.obj" \
	"$(INTDIR)\ULongSeqA.obj" \
	"$(INTDIR)\Union_TypeCode_Static.obj" \
	"$(INTDIR)\UShortSeqA.obj" \
	"$(INTDIR)\Value_TypeCode_Static.obj" \
	"$(INTDIR)\ValueModifierC.obj" \
	"$(INTDIR)\ValueModifierA.obj" \
	"$(INTDIR)\VisibilityA.obj" \
	"$(INTDIR)\VisibilityC.obj" \
	"$(INTDIR)\WCharSeqA.obj" \
	"$(INTDIR)\WrongTransactionA.obj" \
	"$(INTDIR)\WStringSeqA.obj"

"..\..\..\lib\TAO_AnyTypeCode.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_AnyTypeCode.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_AnyTypeCode.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\AnyTypeCode\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_AnyTypeCodesd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.AnyTypeCode.dep" "ServicesA.cpp" "Alias_TypeCode_Static.cpp" "Any.cpp" "AnySeqA.cpp" "AnySeqC.cpp" "Any_Basic_Impl.cpp" "Any_Impl.cpp" "Any_SystemException.cpp" "Any_Unknown_IDL_Type.cpp" "AnyTypeCode_Adapter_Impl.cpp" "append.cpp" "BasicTypeTraits.cpp" "BooleanSeqA.cpp" "BoundsA.cpp" "BoundsC.cpp" "CharSeqA.cpp" "CONV_FRAMEA.cpp" "CurrentA.cpp" "DoubleSeqA.cpp" "DynamicA.cpp" "DynamicC.cpp" "Dynamic_ParameterA.cpp" "Dynamic_ParameterC.cpp" "Empty_Param_TypeCode.cpp" "Enum_TypeCode_Static.cpp" "ExceptionA.cpp" "FloatSeqA.cpp" "GIOPA.cpp" "IIOPA.cpp" "IOPA.cpp" "IIOP_EndpointsA.cpp" "LongDoubleSeqA.cpp" "LongLongSeqA.cpp" "LongSeqA.cpp" "Marshal.cpp" "Messaging_PolicyValueA.cpp" "NVList.cpp" "NVList_Adapter_Impl.cpp" "ObjectIdListA.cpp" "Objref_TypeCode_Static.cpp" "OctetSeqA.cpp" "orb_typesA.cpp" "ParameterModeA.cpp" "PI_ForwardA.cpp" "PolicyA.cpp" "Policy_CurrentA.cpp" "Policy_ForwardA.cpp" "Policy_ManagerA.cpp" "PortableInterceptorA.cpp" "Sequence_TypeCode_Static.cpp" "ShortSeqA.cpp" "skip.cpp" "StringSeqA.cpp" "String_TypeCode_Static.cpp" "Struct_TypeCode_Static.cpp" "SystemExceptionA.cpp" "TAOA.cpp" "TimeBaseA.cpp" "True_RefCount_Policy.cpp" "TypeCode.cpp" "TypeCodeA.cpp" "TypeCode_CDR_Extraction.cpp" "TypeCode_Constants.cpp" "ULongLongSeqA.cpp" "ULongSeqA.cpp" "Union_TypeCode_Static.cpp" "UShortSeqA.cpp" "Value_TypeCode_Static.cpp" "ValueModifierC.cpp" "ValueModifierA.cpp" "VisibilityA.cpp" "VisibilityC.cpp" "WCharSeqA.cpp" "WrongTransactionA.cpp" "WStringSeqA.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_AnyTypeCodesd.lib"
	-@del /f/q "$(OUTDIR)\TAO_AnyTypeCodesd.exp"
	-@del /f/q "$(OUTDIR)\TAO_AnyTypeCodesd.ilk"
	-@del /f/q "..\..\..\lib\TAO_AnyTypeCodesd.pdb"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\AnyTypeCode\$(NULL)" mkdir "Static_Debug\AnyTypeCode"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\TAO_AnyTypeCodesd.pdb" /I "..\..\.." /I "..\.." /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_AnyTypeCodesd.lib"
LINK32_OBJS= \
	"$(INTDIR)\ServicesA.obj" \
	"$(INTDIR)\Alias_TypeCode_Static.obj" \
	"$(INTDIR)\Any.obj" \
	"$(INTDIR)\AnySeqA.obj" \
	"$(INTDIR)\AnySeqC.obj" \
	"$(INTDIR)\Any_Basic_Impl.obj" \
	"$(INTDIR)\Any_Impl.obj" \
	"$(INTDIR)\Any_SystemException.obj" \
	"$(INTDIR)\Any_Unknown_IDL_Type.obj" \
	"$(INTDIR)\AnyTypeCode_Adapter_Impl.obj" \
	"$(INTDIR)\append.obj" \
	"$(INTDIR)\BasicTypeTraits.obj" \
	"$(INTDIR)\BooleanSeqA.obj" \
	"$(INTDIR)\BoundsA.obj" \
	"$(INTDIR)\BoundsC.obj" \
	"$(INTDIR)\CharSeqA.obj" \
	"$(INTDIR)\CONV_FRAMEA.obj" \
	"$(INTDIR)\CurrentA.obj" \
	"$(INTDIR)\DoubleSeqA.obj" \
	"$(INTDIR)\DynamicA.obj" \
	"$(INTDIR)\DynamicC.obj" \
	"$(INTDIR)\Dynamic_ParameterA.obj" \
	"$(INTDIR)\Dynamic_ParameterC.obj" \
	"$(INTDIR)\Empty_Param_TypeCode.obj" \
	"$(INTDIR)\Enum_TypeCode_Static.obj" \
	"$(INTDIR)\ExceptionA.obj" \
	"$(INTDIR)\FloatSeqA.obj" \
	"$(INTDIR)\GIOPA.obj" \
	"$(INTDIR)\IIOPA.obj" \
	"$(INTDIR)\IOPA.obj" \
	"$(INTDIR)\IIOP_EndpointsA.obj" \
	"$(INTDIR)\LongDoubleSeqA.obj" \
	"$(INTDIR)\LongLongSeqA.obj" \
	"$(INTDIR)\LongSeqA.obj" \
	"$(INTDIR)\Marshal.obj" \
	"$(INTDIR)\Messaging_PolicyValueA.obj" \
	"$(INTDIR)\NVList.obj" \
	"$(INTDIR)\NVList_Adapter_Impl.obj" \
	"$(INTDIR)\ObjectIdListA.obj" \
	"$(INTDIR)\Objref_TypeCode_Static.obj" \
	"$(INTDIR)\OctetSeqA.obj" \
	"$(INTDIR)\orb_typesA.obj" \
	"$(INTDIR)\ParameterModeA.obj" \
	"$(INTDIR)\PI_ForwardA.obj" \
	"$(INTDIR)\PolicyA.obj" \
	"$(INTDIR)\Policy_CurrentA.obj" \
	"$(INTDIR)\Policy_ForwardA.obj" \
	"$(INTDIR)\Policy_ManagerA.obj" \
	"$(INTDIR)\PortableInterceptorA.obj" \
	"$(INTDIR)\Sequence_TypeCode_Static.obj" \
	"$(INTDIR)\ShortSeqA.obj" \
	"$(INTDIR)\skip.obj" \
	"$(INTDIR)\StringSeqA.obj" \
	"$(INTDIR)\String_TypeCode_Static.obj" \
	"$(INTDIR)\Struct_TypeCode_Static.obj" \
	"$(INTDIR)\SystemExceptionA.obj" \
	"$(INTDIR)\TAOA.obj" \
	"$(INTDIR)\TimeBaseA.obj" \
	"$(INTDIR)\True_RefCount_Policy.obj" \
	"$(INTDIR)\TypeCode.obj" \
	"$(INTDIR)\TypeCodeA.obj" \
	"$(INTDIR)\TypeCode_CDR_Extraction.obj" \
	"$(INTDIR)\TypeCode_Constants.obj" \
	"$(INTDIR)\ULongLongSeqA.obj" \
	"$(INTDIR)\ULongSeqA.obj" \
	"$(INTDIR)\Union_TypeCode_Static.obj" \
	"$(INTDIR)\UShortSeqA.obj" \
	"$(INTDIR)\Value_TypeCode_Static.obj" \
	"$(INTDIR)\ValueModifierC.obj" \
	"$(INTDIR)\ValueModifierA.obj" \
	"$(INTDIR)\VisibilityA.obj" \
	"$(INTDIR)\VisibilityC.obj" \
	"$(INTDIR)\WCharSeqA.obj" \
	"$(INTDIR)\WrongTransactionA.obj" \
	"$(INTDIR)\WStringSeqA.obj"

"$(OUTDIR)\TAO_AnyTypeCodesd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_AnyTypeCodesd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_AnyTypeCodesd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\AnyTypeCode\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_AnyTypeCodes.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.AnyTypeCode.dep" "ServicesA.cpp" "Alias_TypeCode_Static.cpp" "Any.cpp" "AnySeqA.cpp" "AnySeqC.cpp" "Any_Basic_Impl.cpp" "Any_Impl.cpp" "Any_SystemException.cpp" "Any_Unknown_IDL_Type.cpp" "AnyTypeCode_Adapter_Impl.cpp" "append.cpp" "BasicTypeTraits.cpp" "BooleanSeqA.cpp" "BoundsA.cpp" "BoundsC.cpp" "CharSeqA.cpp" "CONV_FRAMEA.cpp" "CurrentA.cpp" "DoubleSeqA.cpp" "DynamicA.cpp" "DynamicC.cpp" "Dynamic_ParameterA.cpp" "Dynamic_ParameterC.cpp" "Empty_Param_TypeCode.cpp" "Enum_TypeCode_Static.cpp" "ExceptionA.cpp" "FloatSeqA.cpp" "GIOPA.cpp" "IIOPA.cpp" "IOPA.cpp" "IIOP_EndpointsA.cpp" "LongDoubleSeqA.cpp" "LongLongSeqA.cpp" "LongSeqA.cpp" "Marshal.cpp" "Messaging_PolicyValueA.cpp" "NVList.cpp" "NVList_Adapter_Impl.cpp" "ObjectIdListA.cpp" "Objref_TypeCode_Static.cpp" "OctetSeqA.cpp" "orb_typesA.cpp" "ParameterModeA.cpp" "PI_ForwardA.cpp" "PolicyA.cpp" "Policy_CurrentA.cpp" "Policy_ForwardA.cpp" "Policy_ManagerA.cpp" "PortableInterceptorA.cpp" "Sequence_TypeCode_Static.cpp" "ShortSeqA.cpp" "skip.cpp" "StringSeqA.cpp" "String_TypeCode_Static.cpp" "Struct_TypeCode_Static.cpp" "SystemExceptionA.cpp" "TAOA.cpp" "TimeBaseA.cpp" "True_RefCount_Policy.cpp" "TypeCode.cpp" "TypeCodeA.cpp" "TypeCode_CDR_Extraction.cpp" "TypeCode_Constants.cpp" "ULongLongSeqA.cpp" "ULongSeqA.cpp" "Union_TypeCode_Static.cpp" "UShortSeqA.cpp" "Value_TypeCode_Static.cpp" "ValueModifierC.cpp" "ValueModifierA.cpp" "VisibilityA.cpp" "VisibilityC.cpp" "WCharSeqA.cpp" "WrongTransactionA.cpp" "WStringSeqA.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_AnyTypeCodes.lib"
	-@del /f/q "$(OUTDIR)\TAO_AnyTypeCodes.exp"
	-@del /f/q "$(OUTDIR)\TAO_AnyTypeCodes.ilk"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\AnyTypeCode\$(NULL)" mkdir "Static_Release\AnyTypeCode"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_AnyTypeCodes.lib"
LINK32_OBJS= \
	"$(INTDIR)\ServicesA.obj" \
	"$(INTDIR)\Alias_TypeCode_Static.obj" \
	"$(INTDIR)\Any.obj" \
	"$(INTDIR)\AnySeqA.obj" \
	"$(INTDIR)\AnySeqC.obj" \
	"$(INTDIR)\Any_Basic_Impl.obj" \
	"$(INTDIR)\Any_Impl.obj" \
	"$(INTDIR)\Any_SystemException.obj" \
	"$(INTDIR)\Any_Unknown_IDL_Type.obj" \
	"$(INTDIR)\AnyTypeCode_Adapter_Impl.obj" \
	"$(INTDIR)\append.obj" \
	"$(INTDIR)\BasicTypeTraits.obj" \
	"$(INTDIR)\BooleanSeqA.obj" \
	"$(INTDIR)\BoundsA.obj" \
	"$(INTDIR)\BoundsC.obj" \
	"$(INTDIR)\CharSeqA.obj" \
	"$(INTDIR)\CONV_FRAMEA.obj" \
	"$(INTDIR)\CurrentA.obj" \
	"$(INTDIR)\DoubleSeqA.obj" \
	"$(INTDIR)\DynamicA.obj" \
	"$(INTDIR)\DynamicC.obj" \
	"$(INTDIR)\Dynamic_ParameterA.obj" \
	"$(INTDIR)\Dynamic_ParameterC.obj" \
	"$(INTDIR)\Empty_Param_TypeCode.obj" \
	"$(INTDIR)\Enum_TypeCode_Static.obj" \
	"$(INTDIR)\ExceptionA.obj" \
	"$(INTDIR)\FloatSeqA.obj" \
	"$(INTDIR)\GIOPA.obj" \
	"$(INTDIR)\IIOPA.obj" \
	"$(INTDIR)\IOPA.obj" \
	"$(INTDIR)\IIOP_EndpointsA.obj" \
	"$(INTDIR)\LongDoubleSeqA.obj" \
	"$(INTDIR)\LongLongSeqA.obj" \
	"$(INTDIR)\LongSeqA.obj" \
	"$(INTDIR)\Marshal.obj" \
	"$(INTDIR)\Messaging_PolicyValueA.obj" \
	"$(INTDIR)\NVList.obj" \
	"$(INTDIR)\NVList_Adapter_Impl.obj" \
	"$(INTDIR)\ObjectIdListA.obj" \
	"$(INTDIR)\Objref_TypeCode_Static.obj" \
	"$(INTDIR)\OctetSeqA.obj" \
	"$(INTDIR)\orb_typesA.obj" \
	"$(INTDIR)\ParameterModeA.obj" \
	"$(INTDIR)\PI_ForwardA.obj" \
	"$(INTDIR)\PolicyA.obj" \
	"$(INTDIR)\Policy_CurrentA.obj" \
	"$(INTDIR)\Policy_ForwardA.obj" \
	"$(INTDIR)\Policy_ManagerA.obj" \
	"$(INTDIR)\PortableInterceptorA.obj" \
	"$(INTDIR)\Sequence_TypeCode_Static.obj" \
	"$(INTDIR)\ShortSeqA.obj" \
	"$(INTDIR)\skip.obj" \
	"$(INTDIR)\StringSeqA.obj" \
	"$(INTDIR)\String_TypeCode_Static.obj" \
	"$(INTDIR)\Struct_TypeCode_Static.obj" \
	"$(INTDIR)\SystemExceptionA.obj" \
	"$(INTDIR)\TAOA.obj" \
	"$(INTDIR)\TimeBaseA.obj" \
	"$(INTDIR)\True_RefCount_Policy.obj" \
	"$(INTDIR)\TypeCode.obj" \
	"$(INTDIR)\TypeCodeA.obj" \
	"$(INTDIR)\TypeCode_CDR_Extraction.obj" \
	"$(INTDIR)\TypeCode_Constants.obj" \
	"$(INTDIR)\ULongLongSeqA.obj" \
	"$(INTDIR)\ULongSeqA.obj" \
	"$(INTDIR)\Union_TypeCode_Static.obj" \
	"$(INTDIR)\UShortSeqA.obj" \
	"$(INTDIR)\Value_TypeCode_Static.obj" \
	"$(INTDIR)\ValueModifierC.obj" \
	"$(INTDIR)\ValueModifierA.obj" \
	"$(INTDIR)\VisibilityA.obj" \
	"$(INTDIR)\VisibilityC.obj" \
	"$(INTDIR)\WCharSeqA.obj" \
	"$(INTDIR)\WrongTransactionA.obj" \
	"$(INTDIR)\WStringSeqA.obj"

"$(OUTDIR)\TAO_AnyTypeCodes.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_AnyTypeCodes.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_AnyTypeCodes.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.AnyTypeCode.dep")
!INCLUDE "Makefile.AnyTypeCode.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="ServicesA.cpp"

"$(INTDIR)\ServicesA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ServicesA.obj" $(SOURCE)

SOURCE="Alias_TypeCode_Static.cpp"

"$(INTDIR)\Alias_TypeCode_Static.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Alias_TypeCode_Static.obj" $(SOURCE)

SOURCE="Any.cpp"

"$(INTDIR)\Any.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Any.obj" $(SOURCE)

SOURCE="AnySeqA.cpp"

"$(INTDIR)\AnySeqA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\AnySeqA.obj" $(SOURCE)

SOURCE="AnySeqC.cpp"

"$(INTDIR)\AnySeqC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\AnySeqC.obj" $(SOURCE)

SOURCE="Any_Basic_Impl.cpp"

"$(INTDIR)\Any_Basic_Impl.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Any_Basic_Impl.obj" $(SOURCE)

SOURCE="Any_Impl.cpp"

"$(INTDIR)\Any_Impl.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Any_Impl.obj" $(SOURCE)

SOURCE="Any_SystemException.cpp"

"$(INTDIR)\Any_SystemException.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Any_SystemException.obj" $(SOURCE)

SOURCE="Any_Unknown_IDL_Type.cpp"

"$(INTDIR)\Any_Unknown_IDL_Type.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Any_Unknown_IDL_Type.obj" $(SOURCE)

SOURCE="AnyTypeCode_Adapter_Impl.cpp"

"$(INTDIR)\AnyTypeCode_Adapter_Impl.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\AnyTypeCode_Adapter_Impl.obj" $(SOURCE)

SOURCE="append.cpp"

"$(INTDIR)\append.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\append.obj" $(SOURCE)

SOURCE="BasicTypeTraits.cpp"

"$(INTDIR)\BasicTypeTraits.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\BasicTypeTraits.obj" $(SOURCE)

SOURCE="BooleanSeqA.cpp"

"$(INTDIR)\BooleanSeqA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\BooleanSeqA.obj" $(SOURCE)

SOURCE="BoundsA.cpp"

"$(INTDIR)\BoundsA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\BoundsA.obj" $(SOURCE)

SOURCE="BoundsC.cpp"

"$(INTDIR)\BoundsC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\BoundsC.obj" $(SOURCE)

SOURCE="CharSeqA.cpp"

"$(INTDIR)\CharSeqA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\CharSeqA.obj" $(SOURCE)

SOURCE="CONV_FRAMEA.cpp"

"$(INTDIR)\CONV_FRAMEA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\CONV_FRAMEA.obj" $(SOURCE)

SOURCE="CurrentA.cpp"

"$(INTDIR)\CurrentA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\CurrentA.obj" $(SOURCE)

SOURCE="DoubleSeqA.cpp"

"$(INTDIR)\DoubleSeqA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\DoubleSeqA.obj" $(SOURCE)

SOURCE="DynamicA.cpp"

"$(INTDIR)\DynamicA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\DynamicA.obj" $(SOURCE)

SOURCE="DynamicC.cpp"

"$(INTDIR)\DynamicC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\DynamicC.obj" $(SOURCE)

SOURCE="Dynamic_ParameterA.cpp"

"$(INTDIR)\Dynamic_ParameterA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Dynamic_ParameterA.obj" $(SOURCE)

SOURCE="Dynamic_ParameterC.cpp"

"$(INTDIR)\Dynamic_ParameterC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Dynamic_ParameterC.obj" $(SOURCE)

SOURCE="Empty_Param_TypeCode.cpp"

"$(INTDIR)\Empty_Param_TypeCode.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Empty_Param_TypeCode.obj" $(SOURCE)

SOURCE="Enum_TypeCode_Static.cpp"

"$(INTDIR)\Enum_TypeCode_Static.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Enum_TypeCode_Static.obj" $(SOURCE)

SOURCE="ExceptionA.cpp"

"$(INTDIR)\ExceptionA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ExceptionA.obj" $(SOURCE)

SOURCE="FloatSeqA.cpp"

"$(INTDIR)\FloatSeqA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FloatSeqA.obj" $(SOURCE)

SOURCE="GIOPA.cpp"

"$(INTDIR)\GIOPA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\GIOPA.obj" $(SOURCE)

SOURCE="IIOPA.cpp"

"$(INTDIR)\IIOPA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IIOPA.obj" $(SOURCE)

SOURCE="IOPA.cpp"

"$(INTDIR)\IOPA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IOPA.obj" $(SOURCE)

SOURCE="IIOP_EndpointsA.cpp"

"$(INTDIR)\IIOP_EndpointsA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IIOP_EndpointsA.obj" $(SOURCE)

SOURCE="LongDoubleSeqA.cpp"

"$(INTDIR)\LongDoubleSeqA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LongDoubleSeqA.obj" $(SOURCE)

SOURCE="LongLongSeqA.cpp"

"$(INTDIR)\LongLongSeqA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LongLongSeqA.obj" $(SOURCE)

SOURCE="LongSeqA.cpp"

"$(INTDIR)\LongSeqA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LongSeqA.obj" $(SOURCE)

SOURCE="Marshal.cpp"

"$(INTDIR)\Marshal.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Marshal.obj" $(SOURCE)

SOURCE="Messaging_PolicyValueA.cpp"

"$(INTDIR)\Messaging_PolicyValueA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Messaging_PolicyValueA.obj" $(SOURCE)

SOURCE="NVList.cpp"

"$(INTDIR)\NVList.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\NVList.obj" $(SOURCE)

SOURCE="NVList_Adapter_Impl.cpp"

"$(INTDIR)\NVList_Adapter_Impl.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\NVList_Adapter_Impl.obj" $(SOURCE)

SOURCE="ObjectIdListA.cpp"

"$(INTDIR)\ObjectIdListA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ObjectIdListA.obj" $(SOURCE)

SOURCE="Objref_TypeCode_Static.cpp"

"$(INTDIR)\Objref_TypeCode_Static.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Objref_TypeCode_Static.obj" $(SOURCE)

SOURCE="OctetSeqA.cpp"

"$(INTDIR)\OctetSeqA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\OctetSeqA.obj" $(SOURCE)

SOURCE="orb_typesA.cpp"

"$(INTDIR)\orb_typesA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\orb_typesA.obj" $(SOURCE)

SOURCE="ParameterModeA.cpp"

"$(INTDIR)\ParameterModeA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ParameterModeA.obj" $(SOURCE)

SOURCE="PI_ForwardA.cpp"

"$(INTDIR)\PI_ForwardA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PI_ForwardA.obj" $(SOURCE)

SOURCE="PolicyA.cpp"

"$(INTDIR)\PolicyA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PolicyA.obj" $(SOURCE)

SOURCE="Policy_CurrentA.cpp"

"$(INTDIR)\Policy_CurrentA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Policy_CurrentA.obj" $(SOURCE)

SOURCE="Policy_ForwardA.cpp"

"$(INTDIR)\Policy_ForwardA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Policy_ForwardA.obj" $(SOURCE)

SOURCE="Policy_ManagerA.cpp"

"$(INTDIR)\Policy_ManagerA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Policy_ManagerA.obj" $(SOURCE)

SOURCE="PortableInterceptorA.cpp"

"$(INTDIR)\PortableInterceptorA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PortableInterceptorA.obj" $(SOURCE)

SOURCE="Sequence_TypeCode_Static.cpp"

"$(INTDIR)\Sequence_TypeCode_Static.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Sequence_TypeCode_Static.obj" $(SOURCE)

SOURCE="ShortSeqA.cpp"

"$(INTDIR)\ShortSeqA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ShortSeqA.obj" $(SOURCE)

SOURCE="skip.cpp"

"$(INTDIR)\skip.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\skip.obj" $(SOURCE)

SOURCE="StringSeqA.cpp"

"$(INTDIR)\StringSeqA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\StringSeqA.obj" $(SOURCE)

SOURCE="String_TypeCode_Static.cpp"

"$(INTDIR)\String_TypeCode_Static.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\String_TypeCode_Static.obj" $(SOURCE)

SOURCE="Struct_TypeCode_Static.cpp"

"$(INTDIR)\Struct_TypeCode_Static.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Struct_TypeCode_Static.obj" $(SOURCE)

SOURCE="SystemExceptionA.cpp"

"$(INTDIR)\SystemExceptionA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\SystemExceptionA.obj" $(SOURCE)

SOURCE="TAOA.cpp"

"$(INTDIR)\TAOA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\TAOA.obj" $(SOURCE)

SOURCE="TimeBaseA.cpp"

"$(INTDIR)\TimeBaseA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\TimeBaseA.obj" $(SOURCE)

SOURCE="True_RefCount_Policy.cpp"

"$(INTDIR)\True_RefCount_Policy.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\True_RefCount_Policy.obj" $(SOURCE)

SOURCE="TypeCode.cpp"

"$(INTDIR)\TypeCode.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\TypeCode.obj" $(SOURCE)

SOURCE="TypeCodeA.cpp"

"$(INTDIR)\TypeCodeA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\TypeCodeA.obj" $(SOURCE)

SOURCE="TypeCode_CDR_Extraction.cpp"

"$(INTDIR)\TypeCode_CDR_Extraction.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\TypeCode_CDR_Extraction.obj" $(SOURCE)

SOURCE="TypeCode_Constants.cpp"

"$(INTDIR)\TypeCode_Constants.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\TypeCode_Constants.obj" $(SOURCE)

SOURCE="ULongLongSeqA.cpp"

"$(INTDIR)\ULongLongSeqA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ULongLongSeqA.obj" $(SOURCE)

SOURCE="ULongSeqA.cpp"

"$(INTDIR)\ULongSeqA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ULongSeqA.obj" $(SOURCE)

SOURCE="Union_TypeCode_Static.cpp"

"$(INTDIR)\Union_TypeCode_Static.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Union_TypeCode_Static.obj" $(SOURCE)

SOURCE="UShortSeqA.cpp"

"$(INTDIR)\UShortSeqA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\UShortSeqA.obj" $(SOURCE)

SOURCE="Value_TypeCode_Static.cpp"

"$(INTDIR)\Value_TypeCode_Static.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Value_TypeCode_Static.obj" $(SOURCE)

SOURCE="ValueModifierC.cpp"

"$(INTDIR)\ValueModifierC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ValueModifierC.obj" $(SOURCE)

SOURCE="ValueModifierA.cpp"

"$(INTDIR)\ValueModifierA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ValueModifierA.obj" $(SOURCE)

SOURCE="VisibilityA.cpp"

"$(INTDIR)\VisibilityA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\VisibilityA.obj" $(SOURCE)

SOURCE="VisibilityC.cpp"

"$(INTDIR)\VisibilityC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\VisibilityC.obj" $(SOURCE)

SOURCE="WCharSeqA.cpp"

"$(INTDIR)\WCharSeqA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\WCharSeqA.obj" $(SOURCE)

SOURCE="WrongTransactionA.cpp"

"$(INTDIR)\WrongTransactionA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\WrongTransactionA.obj" $(SOURCE)

SOURCE="WStringSeqA.cpp"

"$(INTDIR)\WStringSeqA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\WStringSeqA.obj" $(SOURCE)

!IF  "$(CFG)" == "Win64 Debug"
!ELSEIF  "$(CFG)" == "Win64 Release"
!ELSEIF  "$(CFG)" == "Win64 Static Debug"
!ELSEIF  "$(CFG)" == "Win64 Static Release"
!ENDIF

SOURCE="TAO_AnyTypeCode.rc"

"$(INTDIR)\TAO_AnyTypeCode.res" : $(SOURCE)
	$(RSC) /l 0x409 /fo"$(INTDIR)\TAO_AnyTypeCode.res" /d NDEBUG /d WIN64 /d _CRT_SECURE_NO_WARNINGS /d _CRT_SECURE_NO_DEPRECATE /d _CRT_NONSTDC_NO_DEPRECATE /i "..\..\.." /i "..\.." $(SOURCE)



!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.AnyTypeCode.dep")
	@echo Using "Makefile.AnyTypeCode.dep"
!ELSE
	@echo Warning: cannot find "Makefile.AnyTypeCode.dep"
!ENDIF
!ENDIF

