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
!MESSAGE NMAKE /f "Makefile.Strategies.mak" CFG="Win64 Debug"
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
INTDIR=Debug\Strategies\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_Strategiesd.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_STRATEGIES_BUILD_DLL -f "Makefile.Strategies.dep" "advanced_resource.cpp" "COIOP_Acceptor.cpp" "COIOP_Connection_Handler.cpp" "COIOP_Connector.cpp" "COIOP_Endpoint.cpp" "COIOP_Factory.cpp" "COIOP_Profile.cpp" "COIOP_Transport.cpp" "DIOP_Acceptor.cpp" "DIOP_Connection_Handler.cpp" "DIOP_Connector.cpp" "DIOP_Endpoint.cpp" "DIOP_Factory.cpp" "DIOP_Profile.cpp" "DIOP_Transport.cpp" "FIFO_Connection_Purging_Strategy.cpp" "LF_Strategy_Null.cpp" "LFU_Connection_Purging_Strategy.cpp" "NULL_Connection_Purging_Strategy.cpp" "OC_Endpoint_Selector_Factory.cpp" "OC_Endpoint_Selector_Loader.cpp" "Optimized_Connection_Endpoint_Selector.cpp" "SCIOP_Acceptor.cpp" "SCIOP_Connection_Handler.cpp" "SCIOP_Connector.cpp" "SCIOP_Endpoint.cpp" "SCIOP_Factory.cpp" "SCIOP_Profile.cpp" "SCIOP_Transport.cpp" "SHMIOP_Acceptor.cpp" "SHMIOP_Connection_Handler.cpp" "SHMIOP_Connector.cpp" "SHMIOP_Endpoint.cpp" "SHMIOP_Factory.cpp" "SHMIOP_Profile.cpp" "SHMIOP_Transport.cpp" "Strategies_ORBInitializer.cpp" "UIOP_Acceptor.cpp" "UIOP_Connection_Handler.cpp" "UIOP_Connector.cpp" "UIOP_Endpoint.cpp" "UIOP_Factory.cpp" "UIOP_Profile.cpp" "UIOP_Transport.cpp" "uiop_endpointsC.cpp" "sciop_endpointsC.cpp" "COIOP_EndpointsC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_Strategiesd.pdb"
	-@del /f/q "..\..\..\lib\TAO_Strategiesd.dll"
	-@del /f/q "$(OUTDIR)\TAO_Strategiesd.lib"
	-@del /f/q "$(OUTDIR)\TAO_Strategiesd.exp"
	-@del /f/q "$(OUTDIR)\TAO_Strategiesd.ilk"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\Strategies\$(NULL)" mkdir "Debug\Strategies"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_STRATEGIES_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_CodecFactoryd.lib TAO_PId.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\..\lib\TAO_Strategiesd.pdb" /machine:IA64 /out:"..\..\..\lib\TAO_Strategiesd.dll" /implib:"$(OUTDIR)\TAO_Strategiesd.lib"
LINK32_OBJS= \
	"$(INTDIR)\TAO_Strategies.res" \
	"$(INTDIR)\advanced_resource.obj" \
	"$(INTDIR)\COIOP_Acceptor.obj" \
	"$(INTDIR)\COIOP_Connection_Handler.obj" \
	"$(INTDIR)\COIOP_Connector.obj" \
	"$(INTDIR)\COIOP_Endpoint.obj" \
	"$(INTDIR)\COIOP_Factory.obj" \
	"$(INTDIR)\COIOP_Profile.obj" \
	"$(INTDIR)\COIOP_Transport.obj" \
	"$(INTDIR)\DIOP_Acceptor.obj" \
	"$(INTDIR)\DIOP_Connection_Handler.obj" \
	"$(INTDIR)\DIOP_Connector.obj" \
	"$(INTDIR)\DIOP_Endpoint.obj" \
	"$(INTDIR)\DIOP_Factory.obj" \
	"$(INTDIR)\DIOP_Profile.obj" \
	"$(INTDIR)\DIOP_Transport.obj" \
	"$(INTDIR)\FIFO_Connection_Purging_Strategy.obj" \
	"$(INTDIR)\LF_Strategy_Null.obj" \
	"$(INTDIR)\LFU_Connection_Purging_Strategy.obj" \
	"$(INTDIR)\NULL_Connection_Purging_Strategy.obj" \
	"$(INTDIR)\OC_Endpoint_Selector_Factory.obj" \
	"$(INTDIR)\OC_Endpoint_Selector_Loader.obj" \
	"$(INTDIR)\Optimized_Connection_Endpoint_Selector.obj" \
	"$(INTDIR)\SCIOP_Acceptor.obj" \
	"$(INTDIR)\SCIOP_Connection_Handler.obj" \
	"$(INTDIR)\SCIOP_Connector.obj" \
	"$(INTDIR)\SCIOP_Endpoint.obj" \
	"$(INTDIR)\SCIOP_Factory.obj" \
	"$(INTDIR)\SCIOP_Profile.obj" \
	"$(INTDIR)\SCIOP_Transport.obj" \
	"$(INTDIR)\SHMIOP_Acceptor.obj" \
	"$(INTDIR)\SHMIOP_Connection_Handler.obj" \
	"$(INTDIR)\SHMIOP_Connector.obj" \
	"$(INTDIR)\SHMIOP_Endpoint.obj" \
	"$(INTDIR)\SHMIOP_Factory.obj" \
	"$(INTDIR)\SHMIOP_Profile.obj" \
	"$(INTDIR)\SHMIOP_Transport.obj" \
	"$(INTDIR)\Strategies_ORBInitializer.obj" \
	"$(INTDIR)\UIOP_Acceptor.obj" \
	"$(INTDIR)\UIOP_Connection_Handler.obj" \
	"$(INTDIR)\UIOP_Connector.obj" \
	"$(INTDIR)\UIOP_Endpoint.obj" \
	"$(INTDIR)\UIOP_Factory.obj" \
	"$(INTDIR)\UIOP_Profile.obj" \
	"$(INTDIR)\UIOP_Transport.obj" \
	"$(INTDIR)\uiop_endpointsC.obj" \
	"$(INTDIR)\sciop_endpointsC.obj" \
	"$(INTDIR)\COIOP_EndpointsC.obj"

"..\..\..\lib\TAO_Strategiesd.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_Strategiesd.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_Strategiesd.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\Strategies\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_Strategies.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_STRATEGIES_BUILD_DLL -f "Makefile.Strategies.dep" "advanced_resource.cpp" "COIOP_Acceptor.cpp" "COIOP_Connection_Handler.cpp" "COIOP_Connector.cpp" "COIOP_Endpoint.cpp" "COIOP_Factory.cpp" "COIOP_Profile.cpp" "COIOP_Transport.cpp" "DIOP_Acceptor.cpp" "DIOP_Connection_Handler.cpp" "DIOP_Connector.cpp" "DIOP_Endpoint.cpp" "DIOP_Factory.cpp" "DIOP_Profile.cpp" "DIOP_Transport.cpp" "FIFO_Connection_Purging_Strategy.cpp" "LF_Strategy_Null.cpp" "LFU_Connection_Purging_Strategy.cpp" "NULL_Connection_Purging_Strategy.cpp" "OC_Endpoint_Selector_Factory.cpp" "OC_Endpoint_Selector_Loader.cpp" "Optimized_Connection_Endpoint_Selector.cpp" "SCIOP_Acceptor.cpp" "SCIOP_Connection_Handler.cpp" "SCIOP_Connector.cpp" "SCIOP_Endpoint.cpp" "SCIOP_Factory.cpp" "SCIOP_Profile.cpp" "SCIOP_Transport.cpp" "SHMIOP_Acceptor.cpp" "SHMIOP_Connection_Handler.cpp" "SHMIOP_Connector.cpp" "SHMIOP_Endpoint.cpp" "SHMIOP_Factory.cpp" "SHMIOP_Profile.cpp" "SHMIOP_Transport.cpp" "Strategies_ORBInitializer.cpp" "UIOP_Acceptor.cpp" "UIOP_Connection_Handler.cpp" "UIOP_Connector.cpp" "UIOP_Endpoint.cpp" "UIOP_Factory.cpp" "UIOP_Profile.cpp" "UIOP_Transport.cpp" "uiop_endpointsC.cpp" "sciop_endpointsC.cpp" "COIOP_EndpointsC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\TAO_Strategies.dll"
	-@del /f/q "$(OUTDIR)\TAO_Strategies.lib"
	-@del /f/q "$(OUTDIR)\TAO_Strategies.exp"
	-@del /f/q "$(OUTDIR)\TAO_Strategies.ilk"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\Strategies\$(NULL)" mkdir "Release\Strategies"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_STRATEGIES_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_CodecFactory.lib TAO_PI.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\..\lib\TAO_Strategies.dll" /implib:"$(OUTDIR)\TAO_Strategies.lib"
LINK32_OBJS= \
	"$(INTDIR)\TAO_Strategies.res" \
	"$(INTDIR)\advanced_resource.obj" \
	"$(INTDIR)\COIOP_Acceptor.obj" \
	"$(INTDIR)\COIOP_Connection_Handler.obj" \
	"$(INTDIR)\COIOP_Connector.obj" \
	"$(INTDIR)\COIOP_Endpoint.obj" \
	"$(INTDIR)\COIOP_Factory.obj" \
	"$(INTDIR)\COIOP_Profile.obj" \
	"$(INTDIR)\COIOP_Transport.obj" \
	"$(INTDIR)\DIOP_Acceptor.obj" \
	"$(INTDIR)\DIOP_Connection_Handler.obj" \
	"$(INTDIR)\DIOP_Connector.obj" \
	"$(INTDIR)\DIOP_Endpoint.obj" \
	"$(INTDIR)\DIOP_Factory.obj" \
	"$(INTDIR)\DIOP_Profile.obj" \
	"$(INTDIR)\DIOP_Transport.obj" \
	"$(INTDIR)\FIFO_Connection_Purging_Strategy.obj" \
	"$(INTDIR)\LF_Strategy_Null.obj" \
	"$(INTDIR)\LFU_Connection_Purging_Strategy.obj" \
	"$(INTDIR)\NULL_Connection_Purging_Strategy.obj" \
	"$(INTDIR)\OC_Endpoint_Selector_Factory.obj" \
	"$(INTDIR)\OC_Endpoint_Selector_Loader.obj" \
	"$(INTDIR)\Optimized_Connection_Endpoint_Selector.obj" \
	"$(INTDIR)\SCIOP_Acceptor.obj" \
	"$(INTDIR)\SCIOP_Connection_Handler.obj" \
	"$(INTDIR)\SCIOP_Connector.obj" \
	"$(INTDIR)\SCIOP_Endpoint.obj" \
	"$(INTDIR)\SCIOP_Factory.obj" \
	"$(INTDIR)\SCIOP_Profile.obj" \
	"$(INTDIR)\SCIOP_Transport.obj" \
	"$(INTDIR)\SHMIOP_Acceptor.obj" \
	"$(INTDIR)\SHMIOP_Connection_Handler.obj" \
	"$(INTDIR)\SHMIOP_Connector.obj" \
	"$(INTDIR)\SHMIOP_Endpoint.obj" \
	"$(INTDIR)\SHMIOP_Factory.obj" \
	"$(INTDIR)\SHMIOP_Profile.obj" \
	"$(INTDIR)\SHMIOP_Transport.obj" \
	"$(INTDIR)\Strategies_ORBInitializer.obj" \
	"$(INTDIR)\UIOP_Acceptor.obj" \
	"$(INTDIR)\UIOP_Connection_Handler.obj" \
	"$(INTDIR)\UIOP_Connector.obj" \
	"$(INTDIR)\UIOP_Endpoint.obj" \
	"$(INTDIR)\UIOP_Factory.obj" \
	"$(INTDIR)\UIOP_Profile.obj" \
	"$(INTDIR)\UIOP_Transport.obj" \
	"$(INTDIR)\uiop_endpointsC.obj" \
	"$(INTDIR)\sciop_endpointsC.obj" \
	"$(INTDIR)\COIOP_EndpointsC.obj"

"..\..\..\lib\TAO_Strategies.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_Strategies.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_Strategies.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\Strategies\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_Strategiessd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.Strategies.dep" "advanced_resource.cpp" "COIOP_Acceptor.cpp" "COIOP_Connection_Handler.cpp" "COIOP_Connector.cpp" "COIOP_Endpoint.cpp" "COIOP_Factory.cpp" "COIOP_Profile.cpp" "COIOP_Transport.cpp" "DIOP_Acceptor.cpp" "DIOP_Connection_Handler.cpp" "DIOP_Connector.cpp" "DIOP_Endpoint.cpp" "DIOP_Factory.cpp" "DIOP_Profile.cpp" "DIOP_Transport.cpp" "FIFO_Connection_Purging_Strategy.cpp" "LF_Strategy_Null.cpp" "LFU_Connection_Purging_Strategy.cpp" "NULL_Connection_Purging_Strategy.cpp" "OC_Endpoint_Selector_Factory.cpp" "OC_Endpoint_Selector_Loader.cpp" "Optimized_Connection_Endpoint_Selector.cpp" "SCIOP_Acceptor.cpp" "SCIOP_Connection_Handler.cpp" "SCIOP_Connector.cpp" "SCIOP_Endpoint.cpp" "SCIOP_Factory.cpp" "SCIOP_Profile.cpp" "SCIOP_Transport.cpp" "SHMIOP_Acceptor.cpp" "SHMIOP_Connection_Handler.cpp" "SHMIOP_Connector.cpp" "SHMIOP_Endpoint.cpp" "SHMIOP_Factory.cpp" "SHMIOP_Profile.cpp" "SHMIOP_Transport.cpp" "Strategies_ORBInitializer.cpp" "UIOP_Acceptor.cpp" "UIOP_Connection_Handler.cpp" "UIOP_Connector.cpp" "UIOP_Endpoint.cpp" "UIOP_Factory.cpp" "UIOP_Profile.cpp" "UIOP_Transport.cpp" "uiop_endpointsC.cpp" "sciop_endpointsC.cpp" "COIOP_EndpointsC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_Strategiessd.lib"
	-@del /f/q "$(OUTDIR)\TAO_Strategiessd.exp"
	-@del /f/q "$(OUTDIR)\TAO_Strategiessd.ilk"
	-@del /f/q "..\..\..\lib\TAO_Strategiessd.pdb"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\Strategies\$(NULL)" mkdir "Static_Debug\Strategies"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\TAO_Strategiessd.pdb" /I "..\..\.." /I "..\.." /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_Strategiessd.lib"
LINK32_OBJS= \
	"$(INTDIR)\advanced_resource.obj" \
	"$(INTDIR)\COIOP_Acceptor.obj" \
	"$(INTDIR)\COIOP_Connection_Handler.obj" \
	"$(INTDIR)\COIOP_Connector.obj" \
	"$(INTDIR)\COIOP_Endpoint.obj" \
	"$(INTDIR)\COIOP_Factory.obj" \
	"$(INTDIR)\COIOP_Profile.obj" \
	"$(INTDIR)\COIOP_Transport.obj" \
	"$(INTDIR)\DIOP_Acceptor.obj" \
	"$(INTDIR)\DIOP_Connection_Handler.obj" \
	"$(INTDIR)\DIOP_Connector.obj" \
	"$(INTDIR)\DIOP_Endpoint.obj" \
	"$(INTDIR)\DIOP_Factory.obj" \
	"$(INTDIR)\DIOP_Profile.obj" \
	"$(INTDIR)\DIOP_Transport.obj" \
	"$(INTDIR)\FIFO_Connection_Purging_Strategy.obj" \
	"$(INTDIR)\LF_Strategy_Null.obj" \
	"$(INTDIR)\LFU_Connection_Purging_Strategy.obj" \
	"$(INTDIR)\NULL_Connection_Purging_Strategy.obj" \
	"$(INTDIR)\OC_Endpoint_Selector_Factory.obj" \
	"$(INTDIR)\OC_Endpoint_Selector_Loader.obj" \
	"$(INTDIR)\Optimized_Connection_Endpoint_Selector.obj" \
	"$(INTDIR)\SCIOP_Acceptor.obj" \
	"$(INTDIR)\SCIOP_Connection_Handler.obj" \
	"$(INTDIR)\SCIOP_Connector.obj" \
	"$(INTDIR)\SCIOP_Endpoint.obj" \
	"$(INTDIR)\SCIOP_Factory.obj" \
	"$(INTDIR)\SCIOP_Profile.obj" \
	"$(INTDIR)\SCIOP_Transport.obj" \
	"$(INTDIR)\SHMIOP_Acceptor.obj" \
	"$(INTDIR)\SHMIOP_Connection_Handler.obj" \
	"$(INTDIR)\SHMIOP_Connector.obj" \
	"$(INTDIR)\SHMIOP_Endpoint.obj" \
	"$(INTDIR)\SHMIOP_Factory.obj" \
	"$(INTDIR)\SHMIOP_Profile.obj" \
	"$(INTDIR)\SHMIOP_Transport.obj" \
	"$(INTDIR)\Strategies_ORBInitializer.obj" \
	"$(INTDIR)\UIOP_Acceptor.obj" \
	"$(INTDIR)\UIOP_Connection_Handler.obj" \
	"$(INTDIR)\UIOP_Connector.obj" \
	"$(INTDIR)\UIOP_Endpoint.obj" \
	"$(INTDIR)\UIOP_Factory.obj" \
	"$(INTDIR)\UIOP_Profile.obj" \
	"$(INTDIR)\UIOP_Transport.obj" \
	"$(INTDIR)\uiop_endpointsC.obj" \
	"$(INTDIR)\sciop_endpointsC.obj" \
	"$(INTDIR)\COIOP_EndpointsC.obj"

"$(OUTDIR)\TAO_Strategiessd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_Strategiessd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_Strategiessd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\Strategies\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_Strategiess.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.Strategies.dep" "advanced_resource.cpp" "COIOP_Acceptor.cpp" "COIOP_Connection_Handler.cpp" "COIOP_Connector.cpp" "COIOP_Endpoint.cpp" "COIOP_Factory.cpp" "COIOP_Profile.cpp" "COIOP_Transport.cpp" "DIOP_Acceptor.cpp" "DIOP_Connection_Handler.cpp" "DIOP_Connector.cpp" "DIOP_Endpoint.cpp" "DIOP_Factory.cpp" "DIOP_Profile.cpp" "DIOP_Transport.cpp" "FIFO_Connection_Purging_Strategy.cpp" "LF_Strategy_Null.cpp" "LFU_Connection_Purging_Strategy.cpp" "NULL_Connection_Purging_Strategy.cpp" "OC_Endpoint_Selector_Factory.cpp" "OC_Endpoint_Selector_Loader.cpp" "Optimized_Connection_Endpoint_Selector.cpp" "SCIOP_Acceptor.cpp" "SCIOP_Connection_Handler.cpp" "SCIOP_Connector.cpp" "SCIOP_Endpoint.cpp" "SCIOP_Factory.cpp" "SCIOP_Profile.cpp" "SCIOP_Transport.cpp" "SHMIOP_Acceptor.cpp" "SHMIOP_Connection_Handler.cpp" "SHMIOP_Connector.cpp" "SHMIOP_Endpoint.cpp" "SHMIOP_Factory.cpp" "SHMIOP_Profile.cpp" "SHMIOP_Transport.cpp" "Strategies_ORBInitializer.cpp" "UIOP_Acceptor.cpp" "UIOP_Connection_Handler.cpp" "UIOP_Connector.cpp" "UIOP_Endpoint.cpp" "UIOP_Factory.cpp" "UIOP_Profile.cpp" "UIOP_Transport.cpp" "uiop_endpointsC.cpp" "sciop_endpointsC.cpp" "COIOP_EndpointsC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_Strategiess.lib"
	-@del /f/q "$(OUTDIR)\TAO_Strategiess.exp"
	-@del /f/q "$(OUTDIR)\TAO_Strategiess.ilk"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\Strategies\$(NULL)" mkdir "Static_Release\Strategies"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_Strategiess.lib"
LINK32_OBJS= \
	"$(INTDIR)\advanced_resource.obj" \
	"$(INTDIR)\COIOP_Acceptor.obj" \
	"$(INTDIR)\COIOP_Connection_Handler.obj" \
	"$(INTDIR)\COIOP_Connector.obj" \
	"$(INTDIR)\COIOP_Endpoint.obj" \
	"$(INTDIR)\COIOP_Factory.obj" \
	"$(INTDIR)\COIOP_Profile.obj" \
	"$(INTDIR)\COIOP_Transport.obj" \
	"$(INTDIR)\DIOP_Acceptor.obj" \
	"$(INTDIR)\DIOP_Connection_Handler.obj" \
	"$(INTDIR)\DIOP_Connector.obj" \
	"$(INTDIR)\DIOP_Endpoint.obj" \
	"$(INTDIR)\DIOP_Factory.obj" \
	"$(INTDIR)\DIOP_Profile.obj" \
	"$(INTDIR)\DIOP_Transport.obj" \
	"$(INTDIR)\FIFO_Connection_Purging_Strategy.obj" \
	"$(INTDIR)\LF_Strategy_Null.obj" \
	"$(INTDIR)\LFU_Connection_Purging_Strategy.obj" \
	"$(INTDIR)\NULL_Connection_Purging_Strategy.obj" \
	"$(INTDIR)\OC_Endpoint_Selector_Factory.obj" \
	"$(INTDIR)\OC_Endpoint_Selector_Loader.obj" \
	"$(INTDIR)\Optimized_Connection_Endpoint_Selector.obj" \
	"$(INTDIR)\SCIOP_Acceptor.obj" \
	"$(INTDIR)\SCIOP_Connection_Handler.obj" \
	"$(INTDIR)\SCIOP_Connector.obj" \
	"$(INTDIR)\SCIOP_Endpoint.obj" \
	"$(INTDIR)\SCIOP_Factory.obj" \
	"$(INTDIR)\SCIOP_Profile.obj" \
	"$(INTDIR)\SCIOP_Transport.obj" \
	"$(INTDIR)\SHMIOP_Acceptor.obj" \
	"$(INTDIR)\SHMIOP_Connection_Handler.obj" \
	"$(INTDIR)\SHMIOP_Connector.obj" \
	"$(INTDIR)\SHMIOP_Endpoint.obj" \
	"$(INTDIR)\SHMIOP_Factory.obj" \
	"$(INTDIR)\SHMIOP_Profile.obj" \
	"$(INTDIR)\SHMIOP_Transport.obj" \
	"$(INTDIR)\Strategies_ORBInitializer.obj" \
	"$(INTDIR)\UIOP_Acceptor.obj" \
	"$(INTDIR)\UIOP_Connection_Handler.obj" \
	"$(INTDIR)\UIOP_Connector.obj" \
	"$(INTDIR)\UIOP_Endpoint.obj" \
	"$(INTDIR)\UIOP_Factory.obj" \
	"$(INTDIR)\UIOP_Profile.obj" \
	"$(INTDIR)\UIOP_Transport.obj" \
	"$(INTDIR)\uiop_endpointsC.obj" \
	"$(INTDIR)\sciop_endpointsC.obj" \
	"$(INTDIR)\COIOP_EndpointsC.obj"

"$(OUTDIR)\TAO_Strategiess.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_Strategiess.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_Strategiess.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.Strategies.dep")
!INCLUDE "Makefile.Strategies.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="advanced_resource.cpp"

"$(INTDIR)\advanced_resource.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\advanced_resource.obj" $(SOURCE)

SOURCE="COIOP_Acceptor.cpp"

"$(INTDIR)\COIOP_Acceptor.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\COIOP_Acceptor.obj" $(SOURCE)

SOURCE="COIOP_Connection_Handler.cpp"

"$(INTDIR)\COIOP_Connection_Handler.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\COIOP_Connection_Handler.obj" $(SOURCE)

SOURCE="COIOP_Connector.cpp"

"$(INTDIR)\COIOP_Connector.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\COIOP_Connector.obj" $(SOURCE)

SOURCE="COIOP_Endpoint.cpp"

"$(INTDIR)\COIOP_Endpoint.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\COIOP_Endpoint.obj" $(SOURCE)

SOURCE="COIOP_Factory.cpp"

"$(INTDIR)\COIOP_Factory.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\COIOP_Factory.obj" $(SOURCE)

SOURCE="COIOP_Profile.cpp"

"$(INTDIR)\COIOP_Profile.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\COIOP_Profile.obj" $(SOURCE)

SOURCE="COIOP_Transport.cpp"

"$(INTDIR)\COIOP_Transport.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\COIOP_Transport.obj" $(SOURCE)

SOURCE="DIOP_Acceptor.cpp"

"$(INTDIR)\DIOP_Acceptor.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\DIOP_Acceptor.obj" $(SOURCE)

SOURCE="DIOP_Connection_Handler.cpp"

"$(INTDIR)\DIOP_Connection_Handler.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\DIOP_Connection_Handler.obj" $(SOURCE)

SOURCE="DIOP_Connector.cpp"

"$(INTDIR)\DIOP_Connector.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\DIOP_Connector.obj" $(SOURCE)

SOURCE="DIOP_Endpoint.cpp"

"$(INTDIR)\DIOP_Endpoint.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\DIOP_Endpoint.obj" $(SOURCE)

SOURCE="DIOP_Factory.cpp"

"$(INTDIR)\DIOP_Factory.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\DIOP_Factory.obj" $(SOURCE)

SOURCE="DIOP_Profile.cpp"

"$(INTDIR)\DIOP_Profile.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\DIOP_Profile.obj" $(SOURCE)

SOURCE="DIOP_Transport.cpp"

"$(INTDIR)\DIOP_Transport.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\DIOP_Transport.obj" $(SOURCE)

SOURCE="FIFO_Connection_Purging_Strategy.cpp"

"$(INTDIR)\FIFO_Connection_Purging_Strategy.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\FIFO_Connection_Purging_Strategy.obj" $(SOURCE)

SOURCE="LF_Strategy_Null.cpp"

"$(INTDIR)\LF_Strategy_Null.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LF_Strategy_Null.obj" $(SOURCE)

SOURCE="LFU_Connection_Purging_Strategy.cpp"

"$(INTDIR)\LFU_Connection_Purging_Strategy.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\LFU_Connection_Purging_Strategy.obj" $(SOURCE)

SOURCE="NULL_Connection_Purging_Strategy.cpp"

"$(INTDIR)\NULL_Connection_Purging_Strategy.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\NULL_Connection_Purging_Strategy.obj" $(SOURCE)

SOURCE="OC_Endpoint_Selector_Factory.cpp"

"$(INTDIR)\OC_Endpoint_Selector_Factory.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\OC_Endpoint_Selector_Factory.obj" $(SOURCE)

SOURCE="OC_Endpoint_Selector_Loader.cpp"

"$(INTDIR)\OC_Endpoint_Selector_Loader.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\OC_Endpoint_Selector_Loader.obj" $(SOURCE)

SOURCE="Optimized_Connection_Endpoint_Selector.cpp"

"$(INTDIR)\Optimized_Connection_Endpoint_Selector.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Optimized_Connection_Endpoint_Selector.obj" $(SOURCE)

SOURCE="SCIOP_Acceptor.cpp"

"$(INTDIR)\SCIOP_Acceptor.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\SCIOP_Acceptor.obj" $(SOURCE)

SOURCE="SCIOP_Connection_Handler.cpp"

"$(INTDIR)\SCIOP_Connection_Handler.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\SCIOP_Connection_Handler.obj" $(SOURCE)

SOURCE="SCIOP_Connector.cpp"

"$(INTDIR)\SCIOP_Connector.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\SCIOP_Connector.obj" $(SOURCE)

SOURCE="SCIOP_Endpoint.cpp"

"$(INTDIR)\SCIOP_Endpoint.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\SCIOP_Endpoint.obj" $(SOURCE)

SOURCE="SCIOP_Factory.cpp"

"$(INTDIR)\SCIOP_Factory.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\SCIOP_Factory.obj" $(SOURCE)

SOURCE="SCIOP_Profile.cpp"

"$(INTDIR)\SCIOP_Profile.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\SCIOP_Profile.obj" $(SOURCE)

SOURCE="SCIOP_Transport.cpp"

"$(INTDIR)\SCIOP_Transport.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\SCIOP_Transport.obj" $(SOURCE)

SOURCE="SHMIOP_Acceptor.cpp"

"$(INTDIR)\SHMIOP_Acceptor.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\SHMIOP_Acceptor.obj" $(SOURCE)

SOURCE="SHMIOP_Connection_Handler.cpp"

"$(INTDIR)\SHMIOP_Connection_Handler.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\SHMIOP_Connection_Handler.obj" $(SOURCE)

SOURCE="SHMIOP_Connector.cpp"

"$(INTDIR)\SHMIOP_Connector.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\SHMIOP_Connector.obj" $(SOURCE)

SOURCE="SHMIOP_Endpoint.cpp"

"$(INTDIR)\SHMIOP_Endpoint.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\SHMIOP_Endpoint.obj" $(SOURCE)

SOURCE="SHMIOP_Factory.cpp"

"$(INTDIR)\SHMIOP_Factory.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\SHMIOP_Factory.obj" $(SOURCE)

SOURCE="SHMIOP_Profile.cpp"

"$(INTDIR)\SHMIOP_Profile.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\SHMIOP_Profile.obj" $(SOURCE)

SOURCE="SHMIOP_Transport.cpp"

"$(INTDIR)\SHMIOP_Transport.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\SHMIOP_Transport.obj" $(SOURCE)

SOURCE="Strategies_ORBInitializer.cpp"

"$(INTDIR)\Strategies_ORBInitializer.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Strategies_ORBInitializer.obj" $(SOURCE)

SOURCE="UIOP_Acceptor.cpp"

"$(INTDIR)\UIOP_Acceptor.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\UIOP_Acceptor.obj" $(SOURCE)

SOURCE="UIOP_Connection_Handler.cpp"

"$(INTDIR)\UIOP_Connection_Handler.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\UIOP_Connection_Handler.obj" $(SOURCE)

SOURCE="UIOP_Connector.cpp"

"$(INTDIR)\UIOP_Connector.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\UIOP_Connector.obj" $(SOURCE)

SOURCE="UIOP_Endpoint.cpp"

"$(INTDIR)\UIOP_Endpoint.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\UIOP_Endpoint.obj" $(SOURCE)

SOURCE="UIOP_Factory.cpp"

"$(INTDIR)\UIOP_Factory.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\UIOP_Factory.obj" $(SOURCE)

SOURCE="UIOP_Profile.cpp"

"$(INTDIR)\UIOP_Profile.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\UIOP_Profile.obj" $(SOURCE)

SOURCE="UIOP_Transport.cpp"

"$(INTDIR)\UIOP_Transport.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\UIOP_Transport.obj" $(SOURCE)

SOURCE="uiop_endpointsC.cpp"

"$(INTDIR)\uiop_endpointsC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\uiop_endpointsC.obj" $(SOURCE)

SOURCE="sciop_endpointsC.cpp"

"$(INTDIR)\sciop_endpointsC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\sciop_endpointsC.obj" $(SOURCE)

SOURCE="COIOP_EndpointsC.cpp"

"$(INTDIR)\COIOP_EndpointsC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\COIOP_EndpointsC.obj" $(SOURCE)

!IF  "$(CFG)" == "Win64 Debug"
!ELSEIF  "$(CFG)" == "Win64 Release"
!ELSEIF  "$(CFG)" == "Win64 Static Debug"
!ELSEIF  "$(CFG)" == "Win64 Static Release"
!ENDIF

SOURCE="TAO_Strategies.rc"

"$(INTDIR)\TAO_Strategies.res" : $(SOURCE)
	$(RSC) /l 0x409 /fo"$(INTDIR)\TAO_Strategies.res" /d NDEBUG /d WIN64 /d _CRT_SECURE_NO_WARNINGS /d _CRT_SECURE_NO_DEPRECATE /d _CRT_NONSTDC_NO_DEPRECATE /i "..\..\.." /i "..\.." $(SOURCE)



!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.Strategies.dep")
	@echo Using "Makefile.Strategies.dep"
!ELSE
	@echo Warning: cannot find "Makefile.Strategies.dep"
!ENDIF
!ENDIF

