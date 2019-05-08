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
!MESSAGE NMAKE /f "Makefile.RTCORBA.mak" CFG="Win64 Debug"
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
INTDIR=Debug\RTCORBA\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_RTCORBAd.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_RTCORBA_BUILD_DLL -f "Makefile.RTCORBA.dep" "Continuous_Priority_Mapping.cpp" "Direct_Priority_Mapping.cpp" "Linear_Network_Priority_Mapping.cpp" "Linear_Priority_Mapping.cpp" "Multi_Priority_Mapping.cpp" "Network_Priority_Mapping.cpp" "Network_Priority_Mapping_Manager.cpp" "Priority_Mapping.cpp" "Priority_Mapping_Manager.cpp" "RT_Current.cpp" "RT_Endpoint_Selector_Factory.cpp" "RT_Endpoint_Utils.cpp" "RT_Invocation_Endpoint_Selectors.cpp" "RT_Mutex.cpp" "RT_ORB.cpp" "RT_ORB_Loader.cpp" "RT_ORBInitializer.cpp" "RT_Policy_i.cpp" "RT_PolicyFactory.cpp" "RT_ProtocolPropertiesA.cpp" "RT_ProtocolPropertiesC.cpp" "RT_Protocols_Hooks.cpp" "RT_Service_Context_Handler.cpp" "RT_Stub.cpp" "RT_Stub_Factory.cpp" "RT_Thread_Lane_Resources_Manager.cpp" "RT_Transport_Descriptor.cpp" "RT_Transport_Descriptor_Property.cpp" "RTCORBA.cpp" "Thread_Pool.cpp" "RTCORBA_includeC.cpp" "RTCORBAC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_RTCORBAd.pdb"
	-@del /f/q "..\..\..\lib\TAO_RTCORBAd.dll"
	-@del /f/q "$(OUTDIR)\TAO_RTCORBAd.lib"
	-@del /f/q "$(OUTDIR)\TAO_RTCORBAd.exp"
	-@del /f/q "$(OUTDIR)\TAO_RTCORBAd.ilk"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\RTCORBA\$(NULL)" mkdir "Debug\RTCORBA"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_RTCORBA_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_CodecFactoryd.lib TAO_PId.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\..\lib\TAO_RTCORBAd.pdb" /machine:IA64 /out:"..\..\..\lib\TAO_RTCORBAd.dll" /implib:"$(OUTDIR)\TAO_RTCORBAd.lib"
LINK32_OBJS= \
	"$(INTDIR)\TAO_RTCORBA.res" \
	"$(INTDIR)\Continuous_Priority_Mapping.obj" \
	"$(INTDIR)\Direct_Priority_Mapping.obj" \
	"$(INTDIR)\Linear_Network_Priority_Mapping.obj" \
	"$(INTDIR)\Linear_Priority_Mapping.obj" \
	"$(INTDIR)\Multi_Priority_Mapping.obj" \
	"$(INTDIR)\Network_Priority_Mapping.obj" \
	"$(INTDIR)\Network_Priority_Mapping_Manager.obj" \
	"$(INTDIR)\Priority_Mapping.obj" \
	"$(INTDIR)\Priority_Mapping_Manager.obj" \
	"$(INTDIR)\RT_Current.obj" \
	"$(INTDIR)\RT_Endpoint_Selector_Factory.obj" \
	"$(INTDIR)\RT_Endpoint_Utils.obj" \
	"$(INTDIR)\RT_Invocation_Endpoint_Selectors.obj" \
	"$(INTDIR)\RT_Mutex.obj" \
	"$(INTDIR)\RT_ORB.obj" \
	"$(INTDIR)\RT_ORB_Loader.obj" \
	"$(INTDIR)\RT_ORBInitializer.obj" \
	"$(INTDIR)\RT_Policy_i.obj" \
	"$(INTDIR)\RT_PolicyFactory.obj" \
	"$(INTDIR)\RT_ProtocolPropertiesA.obj" \
	"$(INTDIR)\RT_ProtocolPropertiesC.obj" \
	"$(INTDIR)\RT_Protocols_Hooks.obj" \
	"$(INTDIR)\RT_Service_Context_Handler.obj" \
	"$(INTDIR)\RT_Stub.obj" \
	"$(INTDIR)\RT_Stub_Factory.obj" \
	"$(INTDIR)\RT_Thread_Lane_Resources_Manager.obj" \
	"$(INTDIR)\RT_Transport_Descriptor.obj" \
	"$(INTDIR)\RT_Transport_Descriptor_Property.obj" \
	"$(INTDIR)\RTCORBA.obj" \
	"$(INTDIR)\Thread_Pool.obj" \
	"$(INTDIR)\RTCORBA_includeC.obj" \
	"$(INTDIR)\RTCORBAC.obj"

"..\..\..\lib\TAO_RTCORBAd.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_RTCORBAd.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_RTCORBAd.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\RTCORBA\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_RTCORBA.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_RTCORBA_BUILD_DLL -f "Makefile.RTCORBA.dep" "Continuous_Priority_Mapping.cpp" "Direct_Priority_Mapping.cpp" "Linear_Network_Priority_Mapping.cpp" "Linear_Priority_Mapping.cpp" "Multi_Priority_Mapping.cpp" "Network_Priority_Mapping.cpp" "Network_Priority_Mapping_Manager.cpp" "Priority_Mapping.cpp" "Priority_Mapping_Manager.cpp" "RT_Current.cpp" "RT_Endpoint_Selector_Factory.cpp" "RT_Endpoint_Utils.cpp" "RT_Invocation_Endpoint_Selectors.cpp" "RT_Mutex.cpp" "RT_ORB.cpp" "RT_ORB_Loader.cpp" "RT_ORBInitializer.cpp" "RT_Policy_i.cpp" "RT_PolicyFactory.cpp" "RT_ProtocolPropertiesA.cpp" "RT_ProtocolPropertiesC.cpp" "RT_Protocols_Hooks.cpp" "RT_Service_Context_Handler.cpp" "RT_Stub.cpp" "RT_Stub_Factory.cpp" "RT_Thread_Lane_Resources_Manager.cpp" "RT_Transport_Descriptor.cpp" "RT_Transport_Descriptor_Property.cpp" "RTCORBA.cpp" "Thread_Pool.cpp" "RTCORBA_includeC.cpp" "RTCORBAC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\TAO_RTCORBA.dll"
	-@del /f/q "$(OUTDIR)\TAO_RTCORBA.lib"
	-@del /f/q "$(OUTDIR)\TAO_RTCORBA.exp"
	-@del /f/q "$(OUTDIR)\TAO_RTCORBA.ilk"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\RTCORBA\$(NULL)" mkdir "Release\RTCORBA"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_RTCORBA_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_CodecFactory.lib TAO_PI.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\..\lib\TAO_RTCORBA.dll" /implib:"$(OUTDIR)\TAO_RTCORBA.lib"
LINK32_OBJS= \
	"$(INTDIR)\TAO_RTCORBA.res" \
	"$(INTDIR)\Continuous_Priority_Mapping.obj" \
	"$(INTDIR)\Direct_Priority_Mapping.obj" \
	"$(INTDIR)\Linear_Network_Priority_Mapping.obj" \
	"$(INTDIR)\Linear_Priority_Mapping.obj" \
	"$(INTDIR)\Multi_Priority_Mapping.obj" \
	"$(INTDIR)\Network_Priority_Mapping.obj" \
	"$(INTDIR)\Network_Priority_Mapping_Manager.obj" \
	"$(INTDIR)\Priority_Mapping.obj" \
	"$(INTDIR)\Priority_Mapping_Manager.obj" \
	"$(INTDIR)\RT_Current.obj" \
	"$(INTDIR)\RT_Endpoint_Selector_Factory.obj" \
	"$(INTDIR)\RT_Endpoint_Utils.obj" \
	"$(INTDIR)\RT_Invocation_Endpoint_Selectors.obj" \
	"$(INTDIR)\RT_Mutex.obj" \
	"$(INTDIR)\RT_ORB.obj" \
	"$(INTDIR)\RT_ORB_Loader.obj" \
	"$(INTDIR)\RT_ORBInitializer.obj" \
	"$(INTDIR)\RT_Policy_i.obj" \
	"$(INTDIR)\RT_PolicyFactory.obj" \
	"$(INTDIR)\RT_ProtocolPropertiesA.obj" \
	"$(INTDIR)\RT_ProtocolPropertiesC.obj" \
	"$(INTDIR)\RT_Protocols_Hooks.obj" \
	"$(INTDIR)\RT_Service_Context_Handler.obj" \
	"$(INTDIR)\RT_Stub.obj" \
	"$(INTDIR)\RT_Stub_Factory.obj" \
	"$(INTDIR)\RT_Thread_Lane_Resources_Manager.obj" \
	"$(INTDIR)\RT_Transport_Descriptor.obj" \
	"$(INTDIR)\RT_Transport_Descriptor_Property.obj" \
	"$(INTDIR)\RTCORBA.obj" \
	"$(INTDIR)\Thread_Pool.obj" \
	"$(INTDIR)\RTCORBA_includeC.obj" \
	"$(INTDIR)\RTCORBAC.obj"

"..\..\..\lib\TAO_RTCORBA.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_RTCORBA.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_RTCORBA.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\RTCORBA\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_RTCORBAsd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.RTCORBA.dep" "Continuous_Priority_Mapping.cpp" "Direct_Priority_Mapping.cpp" "Linear_Network_Priority_Mapping.cpp" "Linear_Priority_Mapping.cpp" "Multi_Priority_Mapping.cpp" "Network_Priority_Mapping.cpp" "Network_Priority_Mapping_Manager.cpp" "Priority_Mapping.cpp" "Priority_Mapping_Manager.cpp" "RT_Current.cpp" "RT_Endpoint_Selector_Factory.cpp" "RT_Endpoint_Utils.cpp" "RT_Invocation_Endpoint_Selectors.cpp" "RT_Mutex.cpp" "RT_ORB.cpp" "RT_ORB_Loader.cpp" "RT_ORBInitializer.cpp" "RT_Policy_i.cpp" "RT_PolicyFactory.cpp" "RT_ProtocolPropertiesA.cpp" "RT_ProtocolPropertiesC.cpp" "RT_Protocols_Hooks.cpp" "RT_Service_Context_Handler.cpp" "RT_Stub.cpp" "RT_Stub_Factory.cpp" "RT_Thread_Lane_Resources_Manager.cpp" "RT_Transport_Descriptor.cpp" "RT_Transport_Descriptor_Property.cpp" "RTCORBA.cpp" "Thread_Pool.cpp" "RTCORBA_includeC.cpp" "RTCORBAC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_RTCORBAsd.lib"
	-@del /f/q "$(OUTDIR)\TAO_RTCORBAsd.exp"
	-@del /f/q "$(OUTDIR)\TAO_RTCORBAsd.ilk"
	-@del /f/q "..\..\..\lib\TAO_RTCORBAsd.pdb"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\RTCORBA\$(NULL)" mkdir "Static_Debug\RTCORBA"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\TAO_RTCORBAsd.pdb" /I "..\..\.." /I "..\.." /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_RTCORBAsd.lib"
LINK32_OBJS= \
	"$(INTDIR)\Continuous_Priority_Mapping.obj" \
	"$(INTDIR)\Direct_Priority_Mapping.obj" \
	"$(INTDIR)\Linear_Network_Priority_Mapping.obj" \
	"$(INTDIR)\Linear_Priority_Mapping.obj" \
	"$(INTDIR)\Multi_Priority_Mapping.obj" \
	"$(INTDIR)\Network_Priority_Mapping.obj" \
	"$(INTDIR)\Network_Priority_Mapping_Manager.obj" \
	"$(INTDIR)\Priority_Mapping.obj" \
	"$(INTDIR)\Priority_Mapping_Manager.obj" \
	"$(INTDIR)\RT_Current.obj" \
	"$(INTDIR)\RT_Endpoint_Selector_Factory.obj" \
	"$(INTDIR)\RT_Endpoint_Utils.obj" \
	"$(INTDIR)\RT_Invocation_Endpoint_Selectors.obj" \
	"$(INTDIR)\RT_Mutex.obj" \
	"$(INTDIR)\RT_ORB.obj" \
	"$(INTDIR)\RT_ORB_Loader.obj" \
	"$(INTDIR)\RT_ORBInitializer.obj" \
	"$(INTDIR)\RT_Policy_i.obj" \
	"$(INTDIR)\RT_PolicyFactory.obj" \
	"$(INTDIR)\RT_ProtocolPropertiesA.obj" \
	"$(INTDIR)\RT_ProtocolPropertiesC.obj" \
	"$(INTDIR)\RT_Protocols_Hooks.obj" \
	"$(INTDIR)\RT_Service_Context_Handler.obj" \
	"$(INTDIR)\RT_Stub.obj" \
	"$(INTDIR)\RT_Stub_Factory.obj" \
	"$(INTDIR)\RT_Thread_Lane_Resources_Manager.obj" \
	"$(INTDIR)\RT_Transport_Descriptor.obj" \
	"$(INTDIR)\RT_Transport_Descriptor_Property.obj" \
	"$(INTDIR)\RTCORBA.obj" \
	"$(INTDIR)\Thread_Pool.obj" \
	"$(INTDIR)\RTCORBA_includeC.obj" \
	"$(INTDIR)\RTCORBAC.obj"

"$(OUTDIR)\TAO_RTCORBAsd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_RTCORBAsd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_RTCORBAsd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\RTCORBA\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_RTCORBAs.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.RTCORBA.dep" "Continuous_Priority_Mapping.cpp" "Direct_Priority_Mapping.cpp" "Linear_Network_Priority_Mapping.cpp" "Linear_Priority_Mapping.cpp" "Multi_Priority_Mapping.cpp" "Network_Priority_Mapping.cpp" "Network_Priority_Mapping_Manager.cpp" "Priority_Mapping.cpp" "Priority_Mapping_Manager.cpp" "RT_Current.cpp" "RT_Endpoint_Selector_Factory.cpp" "RT_Endpoint_Utils.cpp" "RT_Invocation_Endpoint_Selectors.cpp" "RT_Mutex.cpp" "RT_ORB.cpp" "RT_ORB_Loader.cpp" "RT_ORBInitializer.cpp" "RT_Policy_i.cpp" "RT_PolicyFactory.cpp" "RT_ProtocolPropertiesA.cpp" "RT_ProtocolPropertiesC.cpp" "RT_Protocols_Hooks.cpp" "RT_Service_Context_Handler.cpp" "RT_Stub.cpp" "RT_Stub_Factory.cpp" "RT_Thread_Lane_Resources_Manager.cpp" "RT_Transport_Descriptor.cpp" "RT_Transport_Descriptor_Property.cpp" "RTCORBA.cpp" "Thread_Pool.cpp" "RTCORBA_includeC.cpp" "RTCORBAC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_RTCORBAs.lib"
	-@del /f/q "$(OUTDIR)\TAO_RTCORBAs.exp"
	-@del /f/q "$(OUTDIR)\TAO_RTCORBAs.ilk"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\RTCORBA\$(NULL)" mkdir "Static_Release\RTCORBA"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_RTCORBAs.lib"
LINK32_OBJS= \
	"$(INTDIR)\Continuous_Priority_Mapping.obj" \
	"$(INTDIR)\Direct_Priority_Mapping.obj" \
	"$(INTDIR)\Linear_Network_Priority_Mapping.obj" \
	"$(INTDIR)\Linear_Priority_Mapping.obj" \
	"$(INTDIR)\Multi_Priority_Mapping.obj" \
	"$(INTDIR)\Network_Priority_Mapping.obj" \
	"$(INTDIR)\Network_Priority_Mapping_Manager.obj" \
	"$(INTDIR)\Priority_Mapping.obj" \
	"$(INTDIR)\Priority_Mapping_Manager.obj" \
	"$(INTDIR)\RT_Current.obj" \
	"$(INTDIR)\RT_Endpoint_Selector_Factory.obj" \
	"$(INTDIR)\RT_Endpoint_Utils.obj" \
	"$(INTDIR)\RT_Invocation_Endpoint_Selectors.obj" \
	"$(INTDIR)\RT_Mutex.obj" \
	"$(INTDIR)\RT_ORB.obj" \
	"$(INTDIR)\RT_ORB_Loader.obj" \
	"$(INTDIR)\RT_ORBInitializer.obj" \
	"$(INTDIR)\RT_Policy_i.obj" \
	"$(INTDIR)\RT_PolicyFactory.obj" \
	"$(INTDIR)\RT_ProtocolPropertiesA.obj" \
	"$(INTDIR)\RT_ProtocolPropertiesC.obj" \
	"$(INTDIR)\RT_Protocols_Hooks.obj" \
	"$(INTDIR)\RT_Service_Context_Handler.obj" \
	"$(INTDIR)\RT_Stub.obj" \
	"$(INTDIR)\RT_Stub_Factory.obj" \
	"$(INTDIR)\RT_Thread_Lane_Resources_Manager.obj" \
	"$(INTDIR)\RT_Transport_Descriptor.obj" \
	"$(INTDIR)\RT_Transport_Descriptor_Property.obj" \
	"$(INTDIR)\RTCORBA.obj" \
	"$(INTDIR)\Thread_Pool.obj" \
	"$(INTDIR)\RTCORBA_includeC.obj" \
	"$(INTDIR)\RTCORBAC.obj"

"$(OUTDIR)\TAO_RTCORBAs.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_RTCORBAs.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_RTCORBAs.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.RTCORBA.dep")
!INCLUDE "Makefile.RTCORBA.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="Continuous_Priority_Mapping.cpp"

"$(INTDIR)\Continuous_Priority_Mapping.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Continuous_Priority_Mapping.obj" $(SOURCE)

SOURCE="Direct_Priority_Mapping.cpp"

"$(INTDIR)\Direct_Priority_Mapping.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Direct_Priority_Mapping.obj" $(SOURCE)

SOURCE="Linear_Network_Priority_Mapping.cpp"

"$(INTDIR)\Linear_Network_Priority_Mapping.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Linear_Network_Priority_Mapping.obj" $(SOURCE)

SOURCE="Linear_Priority_Mapping.cpp"

"$(INTDIR)\Linear_Priority_Mapping.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Linear_Priority_Mapping.obj" $(SOURCE)

SOURCE="Multi_Priority_Mapping.cpp"

"$(INTDIR)\Multi_Priority_Mapping.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Multi_Priority_Mapping.obj" $(SOURCE)

SOURCE="Network_Priority_Mapping.cpp"

"$(INTDIR)\Network_Priority_Mapping.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Network_Priority_Mapping.obj" $(SOURCE)

SOURCE="Network_Priority_Mapping_Manager.cpp"

"$(INTDIR)\Network_Priority_Mapping_Manager.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Network_Priority_Mapping_Manager.obj" $(SOURCE)

SOURCE="Priority_Mapping.cpp"

"$(INTDIR)\Priority_Mapping.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Priority_Mapping.obj" $(SOURCE)

SOURCE="Priority_Mapping_Manager.cpp"

"$(INTDIR)\Priority_Mapping_Manager.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Priority_Mapping_Manager.obj" $(SOURCE)

SOURCE="RT_Current.cpp"

"$(INTDIR)\RT_Current.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RT_Current.obj" $(SOURCE)

SOURCE="RT_Endpoint_Selector_Factory.cpp"

"$(INTDIR)\RT_Endpoint_Selector_Factory.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RT_Endpoint_Selector_Factory.obj" $(SOURCE)

SOURCE="RT_Endpoint_Utils.cpp"

"$(INTDIR)\RT_Endpoint_Utils.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RT_Endpoint_Utils.obj" $(SOURCE)

SOURCE="RT_Invocation_Endpoint_Selectors.cpp"

"$(INTDIR)\RT_Invocation_Endpoint_Selectors.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RT_Invocation_Endpoint_Selectors.obj" $(SOURCE)

SOURCE="RT_Mutex.cpp"

"$(INTDIR)\RT_Mutex.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RT_Mutex.obj" $(SOURCE)

SOURCE="RT_ORB.cpp"

"$(INTDIR)\RT_ORB.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RT_ORB.obj" $(SOURCE)

SOURCE="RT_ORB_Loader.cpp"

"$(INTDIR)\RT_ORB_Loader.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RT_ORB_Loader.obj" $(SOURCE)

SOURCE="RT_ORBInitializer.cpp"

"$(INTDIR)\RT_ORBInitializer.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RT_ORBInitializer.obj" $(SOURCE)

SOURCE="RT_Policy_i.cpp"

"$(INTDIR)\RT_Policy_i.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RT_Policy_i.obj" $(SOURCE)

SOURCE="RT_PolicyFactory.cpp"

"$(INTDIR)\RT_PolicyFactory.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RT_PolicyFactory.obj" $(SOURCE)

SOURCE="RT_ProtocolPropertiesA.cpp"

"$(INTDIR)\RT_ProtocolPropertiesA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RT_ProtocolPropertiesA.obj" $(SOURCE)

SOURCE="RT_ProtocolPropertiesC.cpp"

"$(INTDIR)\RT_ProtocolPropertiesC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RT_ProtocolPropertiesC.obj" $(SOURCE)

SOURCE="RT_Protocols_Hooks.cpp"

"$(INTDIR)\RT_Protocols_Hooks.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RT_Protocols_Hooks.obj" $(SOURCE)

SOURCE="RT_Service_Context_Handler.cpp"

"$(INTDIR)\RT_Service_Context_Handler.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RT_Service_Context_Handler.obj" $(SOURCE)

SOURCE="RT_Stub.cpp"

"$(INTDIR)\RT_Stub.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RT_Stub.obj" $(SOURCE)

SOURCE="RT_Stub_Factory.cpp"

"$(INTDIR)\RT_Stub_Factory.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RT_Stub_Factory.obj" $(SOURCE)

SOURCE="RT_Thread_Lane_Resources_Manager.cpp"

"$(INTDIR)\RT_Thread_Lane_Resources_Manager.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RT_Thread_Lane_Resources_Manager.obj" $(SOURCE)

SOURCE="RT_Transport_Descriptor.cpp"

"$(INTDIR)\RT_Transport_Descriptor.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RT_Transport_Descriptor.obj" $(SOURCE)

SOURCE="RT_Transport_Descriptor_Property.cpp"

"$(INTDIR)\RT_Transport_Descriptor_Property.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RT_Transport_Descriptor_Property.obj" $(SOURCE)

SOURCE="RTCORBA.cpp"

"$(INTDIR)\RTCORBA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RTCORBA.obj" $(SOURCE)

SOURCE="Thread_Pool.cpp"

"$(INTDIR)\Thread_Pool.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Thread_Pool.obj" $(SOURCE)

SOURCE="RTCORBA_includeC.cpp"

"$(INTDIR)\RTCORBA_includeC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RTCORBA_includeC.obj" $(SOURCE)

SOURCE="RTCORBAC.cpp"

"$(INTDIR)\RTCORBAC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RTCORBAC.obj" $(SOURCE)

!IF  "$(CFG)" == "Win64 Debug"
!ELSEIF  "$(CFG)" == "Win64 Release"
!ELSEIF  "$(CFG)" == "Win64 Static Debug"
!ELSEIF  "$(CFG)" == "Win64 Static Release"
!ENDIF

SOURCE="TAO_RTCORBA.rc"

"$(INTDIR)\TAO_RTCORBA.res" : $(SOURCE)
	$(RSC) /l 0x409 /fo"$(INTDIR)\TAO_RTCORBA.res" /d NDEBUG /d WIN64 /d _CRT_SECURE_NO_WARNINGS /d _CRT_SECURE_NO_DEPRECATE /d _CRT_NONSTDC_NO_DEPRECATE /i "..\..\.." /i "..\.." $(SOURCE)



!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.RTCORBA.dep")
	@echo Using "Makefile.RTCORBA.dep"
!ELSE
	@echo Warning: cannot find "Makefile.RTCORBA.dep"
!ENDIF
!ENDIF

