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
!MESSAGE NMAKE /f "Makefile.EndpointPolicy.mak" CFG="Win64 Debug"
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
INTDIR=Debug\EndpointPolicy\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_EndpointPolicyd.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_ENDPOINTPOLICY_BUILD_DLL -f "Makefile.EndpointPolicy.dep" "Endpoint_Acceptor_Filter.cpp" "Endpoint_Acceptor_Filter_Factory.cpp" "Endpoint_Value_Impl.cpp" "EndpointPolicy.cpp" "EndpointPolicy_Factory.cpp" "EndpointPolicy_i.cpp" "EndpointPolicy_ORBInitializer.cpp" "IIOPEndpointValue_i.cpp" "EndpointPolicyC.cpp" "IIOPEndpointValueC.cpp" "EndpointPolicyTypeC.cpp" "EndpointPolicyA.cpp" "EndpointPolicyTypeA.cpp" "IIOPEndpointValueA.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_EndpointPolicyd.pdb"
	-@del /f/q "..\..\..\lib\TAO_EndpointPolicyd.dll"
	-@del /f/q "$(OUTDIR)\TAO_EndpointPolicyd.lib"
	-@del /f/q "$(OUTDIR)\TAO_EndpointPolicyd.exp"
	-@del /f/q "$(OUTDIR)\TAO_EndpointPolicyd.ilk"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\EndpointPolicy\$(NULL)" mkdir "Debug\EndpointPolicy"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_ENDPOINTPOLICY_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_PortableServerd.lib TAO_CodecFactoryd.lib TAO_PId.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\..\lib\TAO_EndpointPolicyd.pdb" /machine:IA64 /out:"..\..\..\lib\TAO_EndpointPolicyd.dll" /implib:"$(OUTDIR)\TAO_EndpointPolicyd.lib"
LINK32_OBJS= \
	"$(INTDIR)\Endpoint_Acceptor_Filter.obj" \
	"$(INTDIR)\Endpoint_Acceptor_Filter_Factory.obj" \
	"$(INTDIR)\Endpoint_Value_Impl.obj" \
	"$(INTDIR)\EndpointPolicy.obj" \
	"$(INTDIR)\EndpointPolicy_Factory.obj" \
	"$(INTDIR)\EndpointPolicy_i.obj" \
	"$(INTDIR)\EndpointPolicy_ORBInitializer.obj" \
	"$(INTDIR)\IIOPEndpointValue_i.obj" \
	"$(INTDIR)\EndpointPolicyC.obj" \
	"$(INTDIR)\IIOPEndpointValueC.obj" \
	"$(INTDIR)\EndpointPolicyTypeC.obj" \
	"$(INTDIR)\EndpointPolicyA.obj" \
	"$(INTDIR)\EndpointPolicyTypeA.obj" \
	"$(INTDIR)\IIOPEndpointValueA.obj"

"..\..\..\lib\TAO_EndpointPolicyd.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_EndpointPolicyd.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_EndpointPolicyd.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\EndpointPolicy\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_EndpointPolicy.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_ENDPOINTPOLICY_BUILD_DLL -f "Makefile.EndpointPolicy.dep" "Endpoint_Acceptor_Filter.cpp" "Endpoint_Acceptor_Filter_Factory.cpp" "Endpoint_Value_Impl.cpp" "EndpointPolicy.cpp" "EndpointPolicy_Factory.cpp" "EndpointPolicy_i.cpp" "EndpointPolicy_ORBInitializer.cpp" "IIOPEndpointValue_i.cpp" "EndpointPolicyC.cpp" "IIOPEndpointValueC.cpp" "EndpointPolicyTypeC.cpp" "EndpointPolicyA.cpp" "EndpointPolicyTypeA.cpp" "IIOPEndpointValueA.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\TAO_EndpointPolicy.dll"
	-@del /f/q "$(OUTDIR)\TAO_EndpointPolicy.lib"
	-@del /f/q "$(OUTDIR)\TAO_EndpointPolicy.exp"
	-@del /f/q "$(OUTDIR)\TAO_EndpointPolicy.ilk"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\EndpointPolicy\$(NULL)" mkdir "Release\EndpointPolicy"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_ENDPOINTPOLICY_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_PortableServer.lib TAO_CodecFactory.lib TAO_PI.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\..\lib\TAO_EndpointPolicy.dll" /implib:"$(OUTDIR)\TAO_EndpointPolicy.lib"
LINK32_OBJS= \
	"$(INTDIR)\Endpoint_Acceptor_Filter.obj" \
	"$(INTDIR)\Endpoint_Acceptor_Filter_Factory.obj" \
	"$(INTDIR)\Endpoint_Value_Impl.obj" \
	"$(INTDIR)\EndpointPolicy.obj" \
	"$(INTDIR)\EndpointPolicy_Factory.obj" \
	"$(INTDIR)\EndpointPolicy_i.obj" \
	"$(INTDIR)\EndpointPolicy_ORBInitializer.obj" \
	"$(INTDIR)\IIOPEndpointValue_i.obj" \
	"$(INTDIR)\EndpointPolicyC.obj" \
	"$(INTDIR)\IIOPEndpointValueC.obj" \
	"$(INTDIR)\EndpointPolicyTypeC.obj" \
	"$(INTDIR)\EndpointPolicyA.obj" \
	"$(INTDIR)\EndpointPolicyTypeA.obj" \
	"$(INTDIR)\IIOPEndpointValueA.obj"

"..\..\..\lib\TAO_EndpointPolicy.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_EndpointPolicy.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_EndpointPolicy.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\EndpointPolicy\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_EndpointPolicysd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.EndpointPolicy.dep" "Endpoint_Acceptor_Filter.cpp" "Endpoint_Acceptor_Filter_Factory.cpp" "Endpoint_Value_Impl.cpp" "EndpointPolicy.cpp" "EndpointPolicy_Factory.cpp" "EndpointPolicy_i.cpp" "EndpointPolicy_ORBInitializer.cpp" "IIOPEndpointValue_i.cpp" "EndpointPolicyC.cpp" "IIOPEndpointValueC.cpp" "EndpointPolicyTypeC.cpp" "EndpointPolicyA.cpp" "EndpointPolicyTypeA.cpp" "IIOPEndpointValueA.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_EndpointPolicysd.lib"
	-@del /f/q "$(OUTDIR)\TAO_EndpointPolicysd.exp"
	-@del /f/q "$(OUTDIR)\TAO_EndpointPolicysd.ilk"
	-@del /f/q "..\..\..\lib\TAO_EndpointPolicysd.pdb"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\EndpointPolicy\$(NULL)" mkdir "Static_Debug\EndpointPolicy"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\TAO_EndpointPolicysd.pdb" /I "..\..\.." /I "..\.." /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_EndpointPolicysd.lib"
LINK32_OBJS= \
	"$(INTDIR)\Endpoint_Acceptor_Filter.obj" \
	"$(INTDIR)\Endpoint_Acceptor_Filter_Factory.obj" \
	"$(INTDIR)\Endpoint_Value_Impl.obj" \
	"$(INTDIR)\EndpointPolicy.obj" \
	"$(INTDIR)\EndpointPolicy_Factory.obj" \
	"$(INTDIR)\EndpointPolicy_i.obj" \
	"$(INTDIR)\EndpointPolicy_ORBInitializer.obj" \
	"$(INTDIR)\IIOPEndpointValue_i.obj" \
	"$(INTDIR)\EndpointPolicyC.obj" \
	"$(INTDIR)\IIOPEndpointValueC.obj" \
	"$(INTDIR)\EndpointPolicyTypeC.obj" \
	"$(INTDIR)\EndpointPolicyA.obj" \
	"$(INTDIR)\EndpointPolicyTypeA.obj" \
	"$(INTDIR)\IIOPEndpointValueA.obj"

"$(OUTDIR)\TAO_EndpointPolicysd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_EndpointPolicysd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_EndpointPolicysd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\EndpointPolicy\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_EndpointPolicys.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.EndpointPolicy.dep" "Endpoint_Acceptor_Filter.cpp" "Endpoint_Acceptor_Filter_Factory.cpp" "Endpoint_Value_Impl.cpp" "EndpointPolicy.cpp" "EndpointPolicy_Factory.cpp" "EndpointPolicy_i.cpp" "EndpointPolicy_ORBInitializer.cpp" "IIOPEndpointValue_i.cpp" "EndpointPolicyC.cpp" "IIOPEndpointValueC.cpp" "EndpointPolicyTypeC.cpp" "EndpointPolicyA.cpp" "EndpointPolicyTypeA.cpp" "IIOPEndpointValueA.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_EndpointPolicys.lib"
	-@del /f/q "$(OUTDIR)\TAO_EndpointPolicys.exp"
	-@del /f/q "$(OUTDIR)\TAO_EndpointPolicys.ilk"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\EndpointPolicy\$(NULL)" mkdir "Static_Release\EndpointPolicy"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_EndpointPolicys.lib"
LINK32_OBJS= \
	"$(INTDIR)\Endpoint_Acceptor_Filter.obj" \
	"$(INTDIR)\Endpoint_Acceptor_Filter_Factory.obj" \
	"$(INTDIR)\Endpoint_Value_Impl.obj" \
	"$(INTDIR)\EndpointPolicy.obj" \
	"$(INTDIR)\EndpointPolicy_Factory.obj" \
	"$(INTDIR)\EndpointPolicy_i.obj" \
	"$(INTDIR)\EndpointPolicy_ORBInitializer.obj" \
	"$(INTDIR)\IIOPEndpointValue_i.obj" \
	"$(INTDIR)\EndpointPolicyC.obj" \
	"$(INTDIR)\IIOPEndpointValueC.obj" \
	"$(INTDIR)\EndpointPolicyTypeC.obj" \
	"$(INTDIR)\EndpointPolicyA.obj" \
	"$(INTDIR)\EndpointPolicyTypeA.obj" \
	"$(INTDIR)\IIOPEndpointValueA.obj"

"$(OUTDIR)\TAO_EndpointPolicys.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_EndpointPolicys.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_EndpointPolicys.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.EndpointPolicy.dep")
!INCLUDE "Makefile.EndpointPolicy.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="Endpoint_Acceptor_Filter.cpp"

"$(INTDIR)\Endpoint_Acceptor_Filter.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Endpoint_Acceptor_Filter.obj" $(SOURCE)

SOURCE="Endpoint_Acceptor_Filter_Factory.cpp"

"$(INTDIR)\Endpoint_Acceptor_Filter_Factory.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Endpoint_Acceptor_Filter_Factory.obj" $(SOURCE)

SOURCE="Endpoint_Value_Impl.cpp"

"$(INTDIR)\Endpoint_Value_Impl.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Endpoint_Value_Impl.obj" $(SOURCE)

SOURCE="EndpointPolicy.cpp"

"$(INTDIR)\EndpointPolicy.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\EndpointPolicy.obj" $(SOURCE)

SOURCE="EndpointPolicy_Factory.cpp"

"$(INTDIR)\EndpointPolicy_Factory.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\EndpointPolicy_Factory.obj" $(SOURCE)

SOURCE="EndpointPolicy_i.cpp"

"$(INTDIR)\EndpointPolicy_i.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\EndpointPolicy_i.obj" $(SOURCE)

SOURCE="EndpointPolicy_ORBInitializer.cpp"

"$(INTDIR)\EndpointPolicy_ORBInitializer.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\EndpointPolicy_ORBInitializer.obj" $(SOURCE)

SOURCE="IIOPEndpointValue_i.cpp"

"$(INTDIR)\IIOPEndpointValue_i.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IIOPEndpointValue_i.obj" $(SOURCE)

SOURCE="EndpointPolicyC.cpp"

"$(INTDIR)\EndpointPolicyC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\EndpointPolicyC.obj" $(SOURCE)

SOURCE="IIOPEndpointValueC.cpp"

"$(INTDIR)\IIOPEndpointValueC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IIOPEndpointValueC.obj" $(SOURCE)

SOURCE="EndpointPolicyTypeC.cpp"

"$(INTDIR)\EndpointPolicyTypeC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\EndpointPolicyTypeC.obj" $(SOURCE)

SOURCE="EndpointPolicyA.cpp"

"$(INTDIR)\EndpointPolicyA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\EndpointPolicyA.obj" $(SOURCE)

SOURCE="EndpointPolicyTypeA.cpp"

"$(INTDIR)\EndpointPolicyTypeA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\EndpointPolicyTypeA.obj" $(SOURCE)

SOURCE="IIOPEndpointValueA.cpp"

"$(INTDIR)\IIOPEndpointValueA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IIOPEndpointValueA.obj" $(SOURCE)

!IF  "$(CFG)" == "Win64 Debug"
!ELSEIF  "$(CFG)" == "Win64 Release"
!ELSEIF  "$(CFG)" == "Win64 Static Debug"
!ELSEIF  "$(CFG)" == "Win64 Static Release"
!ENDIF


!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.EndpointPolicy.dep")
	@echo Using "Makefile.EndpointPolicy.dep"
!ELSE
	@echo Warning: cannot find "Makefile.EndpointPolicy.dep"
!ENDIF
!ENDIF

