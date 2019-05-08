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
!MESSAGE NMAKE /f "Makefile.DynamicInterface.mak" CFG="Win64 Debug"
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
INTDIR=Debug\DynamicInterface\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_DynamicInterfaced.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_DYNAMICINTERFACE_BUILD_DLL -f "Makefile.DynamicInterface.dep" "DII_Reply_Handler.cpp" "Dynamic_Adapter_Impl.cpp" "ExceptionList.cpp" "Server_Request.cpp" "Unknown_User_Exception.cpp" "AMH_DSI_Response_Handler.cpp" "DII_Arguments_Converter_Impl.cpp" "DII_Invocation.cpp" "Request.cpp" "DII_Arguments.cpp" "DII_Reply_Dispatcher.cpp" "Context.cpp" "DII_Invocation_Adapter.cpp" "Dynamic_Implementation.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_DynamicInterfaced.pdb"
	-@del /f/q "..\..\..\lib\TAO_DynamicInterfaced.dll"
	-@del /f/q "$(OUTDIR)\TAO_DynamicInterfaced.lib"
	-@del /f/q "$(OUTDIR)\TAO_DynamicInterfaced.exp"
	-@del /f/q "$(OUTDIR)\TAO_DynamicInterfaced.ilk"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\DynamicInterface\$(NULL)" mkdir "Debug\DynamicInterface"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_DYNAMICINTERFACE_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_Valuetyped.lib TAO_PortableServerd.lib TAO_CodecFactoryd.lib TAO_PId.lib TAO_Messagingd.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\..\lib\TAO_DynamicInterfaced.pdb" /machine:IA64 /out:"..\..\..\lib\TAO_DynamicInterfaced.dll" /implib:"$(OUTDIR)\TAO_DynamicInterfaced.lib"
LINK32_OBJS= \
	"$(INTDIR)\TAO_DynamicInterface.res" \
	"$(INTDIR)\DII_Reply_Handler.obj" \
	"$(INTDIR)\Dynamic_Adapter_Impl.obj" \
	"$(INTDIR)\ExceptionList.obj" \
	"$(INTDIR)\Server_Request.obj" \
	"$(INTDIR)\Unknown_User_Exception.obj" \
	"$(INTDIR)\AMH_DSI_Response_Handler.obj" \
	"$(INTDIR)\DII_Arguments_Converter_Impl.obj" \
	"$(INTDIR)\DII_Invocation.obj" \
	"$(INTDIR)\Request.obj" \
	"$(INTDIR)\DII_Arguments.obj" \
	"$(INTDIR)\DII_Reply_Dispatcher.obj" \
	"$(INTDIR)\Context.obj" \
	"$(INTDIR)\DII_Invocation_Adapter.obj" \
	"$(INTDIR)\Dynamic_Implementation.obj"

"..\..\..\lib\TAO_DynamicInterfaced.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_DynamicInterfaced.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_DynamicInterfaced.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\DynamicInterface\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_DynamicInterface.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_DYNAMICINTERFACE_BUILD_DLL -f "Makefile.DynamicInterface.dep" "DII_Reply_Handler.cpp" "Dynamic_Adapter_Impl.cpp" "ExceptionList.cpp" "Server_Request.cpp" "Unknown_User_Exception.cpp" "AMH_DSI_Response_Handler.cpp" "DII_Arguments_Converter_Impl.cpp" "DII_Invocation.cpp" "Request.cpp" "DII_Arguments.cpp" "DII_Reply_Dispatcher.cpp" "Context.cpp" "DII_Invocation_Adapter.cpp" "Dynamic_Implementation.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\TAO_DynamicInterface.dll"
	-@del /f/q "$(OUTDIR)\TAO_DynamicInterface.lib"
	-@del /f/q "$(OUTDIR)\TAO_DynamicInterface.exp"
	-@del /f/q "$(OUTDIR)\TAO_DynamicInterface.ilk"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\DynamicInterface\$(NULL)" mkdir "Release\DynamicInterface"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_DYNAMICINTERFACE_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_Valuetype.lib TAO_PortableServer.lib TAO_CodecFactory.lib TAO_PI.lib TAO_Messaging.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\..\lib\TAO_DynamicInterface.dll" /implib:"$(OUTDIR)\TAO_DynamicInterface.lib"
LINK32_OBJS= \
	"$(INTDIR)\TAO_DynamicInterface.res" \
	"$(INTDIR)\DII_Reply_Handler.obj" \
	"$(INTDIR)\Dynamic_Adapter_Impl.obj" \
	"$(INTDIR)\ExceptionList.obj" \
	"$(INTDIR)\Server_Request.obj" \
	"$(INTDIR)\Unknown_User_Exception.obj" \
	"$(INTDIR)\AMH_DSI_Response_Handler.obj" \
	"$(INTDIR)\DII_Arguments_Converter_Impl.obj" \
	"$(INTDIR)\DII_Invocation.obj" \
	"$(INTDIR)\Request.obj" \
	"$(INTDIR)\DII_Arguments.obj" \
	"$(INTDIR)\DII_Reply_Dispatcher.obj" \
	"$(INTDIR)\Context.obj" \
	"$(INTDIR)\DII_Invocation_Adapter.obj" \
	"$(INTDIR)\Dynamic_Implementation.obj"

"..\..\..\lib\TAO_DynamicInterface.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_DynamicInterface.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_DynamicInterface.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\DynamicInterface\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_DynamicInterfacesd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.DynamicInterface.dep" "DII_Reply_Handler.cpp" "Dynamic_Adapter_Impl.cpp" "ExceptionList.cpp" "Server_Request.cpp" "Unknown_User_Exception.cpp" "AMH_DSI_Response_Handler.cpp" "DII_Arguments_Converter_Impl.cpp" "DII_Invocation.cpp" "Request.cpp" "DII_Arguments.cpp" "DII_Reply_Dispatcher.cpp" "Context.cpp" "DII_Invocation_Adapter.cpp" "Dynamic_Implementation.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_DynamicInterfacesd.lib"
	-@del /f/q "$(OUTDIR)\TAO_DynamicInterfacesd.exp"
	-@del /f/q "$(OUTDIR)\TAO_DynamicInterfacesd.ilk"
	-@del /f/q "..\..\..\lib\TAO_DynamicInterfacesd.pdb"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\DynamicInterface\$(NULL)" mkdir "Static_Debug\DynamicInterface"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\TAO_DynamicInterfacesd.pdb" /I "..\..\.." /I "..\.." /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_DynamicInterfacesd.lib"
LINK32_OBJS= \
	"$(INTDIR)\DII_Reply_Handler.obj" \
	"$(INTDIR)\Dynamic_Adapter_Impl.obj" \
	"$(INTDIR)\ExceptionList.obj" \
	"$(INTDIR)\Server_Request.obj" \
	"$(INTDIR)\Unknown_User_Exception.obj" \
	"$(INTDIR)\AMH_DSI_Response_Handler.obj" \
	"$(INTDIR)\DII_Arguments_Converter_Impl.obj" \
	"$(INTDIR)\DII_Invocation.obj" \
	"$(INTDIR)\Request.obj" \
	"$(INTDIR)\DII_Arguments.obj" \
	"$(INTDIR)\DII_Reply_Dispatcher.obj" \
	"$(INTDIR)\Context.obj" \
	"$(INTDIR)\DII_Invocation_Adapter.obj" \
	"$(INTDIR)\Dynamic_Implementation.obj"

"$(OUTDIR)\TAO_DynamicInterfacesd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_DynamicInterfacesd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_DynamicInterfacesd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\DynamicInterface\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_DynamicInterfaces.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.DynamicInterface.dep" "DII_Reply_Handler.cpp" "Dynamic_Adapter_Impl.cpp" "ExceptionList.cpp" "Server_Request.cpp" "Unknown_User_Exception.cpp" "AMH_DSI_Response_Handler.cpp" "DII_Arguments_Converter_Impl.cpp" "DII_Invocation.cpp" "Request.cpp" "DII_Arguments.cpp" "DII_Reply_Dispatcher.cpp" "Context.cpp" "DII_Invocation_Adapter.cpp" "Dynamic_Implementation.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_DynamicInterfaces.lib"
	-@del /f/q "$(OUTDIR)\TAO_DynamicInterfaces.exp"
	-@del /f/q "$(OUTDIR)\TAO_DynamicInterfaces.ilk"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\DynamicInterface\$(NULL)" mkdir "Static_Release\DynamicInterface"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_DynamicInterfaces.lib"
LINK32_OBJS= \
	"$(INTDIR)\DII_Reply_Handler.obj" \
	"$(INTDIR)\Dynamic_Adapter_Impl.obj" \
	"$(INTDIR)\ExceptionList.obj" \
	"$(INTDIR)\Server_Request.obj" \
	"$(INTDIR)\Unknown_User_Exception.obj" \
	"$(INTDIR)\AMH_DSI_Response_Handler.obj" \
	"$(INTDIR)\DII_Arguments_Converter_Impl.obj" \
	"$(INTDIR)\DII_Invocation.obj" \
	"$(INTDIR)\Request.obj" \
	"$(INTDIR)\DII_Arguments.obj" \
	"$(INTDIR)\DII_Reply_Dispatcher.obj" \
	"$(INTDIR)\Context.obj" \
	"$(INTDIR)\DII_Invocation_Adapter.obj" \
	"$(INTDIR)\Dynamic_Implementation.obj"

"$(OUTDIR)\TAO_DynamicInterfaces.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_DynamicInterfaces.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_DynamicInterfaces.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.DynamicInterface.dep")
!INCLUDE "Makefile.DynamicInterface.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="DII_Reply_Handler.cpp"

"$(INTDIR)\DII_Reply_Handler.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\DII_Reply_Handler.obj" $(SOURCE)

SOURCE="Dynamic_Adapter_Impl.cpp"

"$(INTDIR)\Dynamic_Adapter_Impl.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Dynamic_Adapter_Impl.obj" $(SOURCE)

SOURCE="ExceptionList.cpp"

"$(INTDIR)\ExceptionList.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ExceptionList.obj" $(SOURCE)

SOURCE="Server_Request.cpp"

"$(INTDIR)\Server_Request.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Server_Request.obj" $(SOURCE)

SOURCE="Unknown_User_Exception.cpp"

"$(INTDIR)\Unknown_User_Exception.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Unknown_User_Exception.obj" $(SOURCE)

SOURCE="AMH_DSI_Response_Handler.cpp"

"$(INTDIR)\AMH_DSI_Response_Handler.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\AMH_DSI_Response_Handler.obj" $(SOURCE)

SOURCE="DII_Arguments_Converter_Impl.cpp"

"$(INTDIR)\DII_Arguments_Converter_Impl.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\DII_Arguments_Converter_Impl.obj" $(SOURCE)

SOURCE="DII_Invocation.cpp"

"$(INTDIR)\DII_Invocation.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\DII_Invocation.obj" $(SOURCE)

SOURCE="Request.cpp"

"$(INTDIR)\Request.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Request.obj" $(SOURCE)

SOURCE="DII_Arguments.cpp"

"$(INTDIR)\DII_Arguments.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\DII_Arguments.obj" $(SOURCE)

SOURCE="DII_Reply_Dispatcher.cpp"

"$(INTDIR)\DII_Reply_Dispatcher.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\DII_Reply_Dispatcher.obj" $(SOURCE)

SOURCE="Context.cpp"

"$(INTDIR)\Context.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Context.obj" $(SOURCE)

SOURCE="DII_Invocation_Adapter.cpp"

"$(INTDIR)\DII_Invocation_Adapter.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\DII_Invocation_Adapter.obj" $(SOURCE)

SOURCE="Dynamic_Implementation.cpp"

"$(INTDIR)\Dynamic_Implementation.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Dynamic_Implementation.obj" $(SOURCE)

!IF  "$(CFG)" == "Win64 Debug"
!ELSEIF  "$(CFG)" == "Win64 Release"
!ELSEIF  "$(CFG)" == "Win64 Static Debug"
!ELSEIF  "$(CFG)" == "Win64 Static Release"
!ENDIF

SOURCE="TAO_DynamicInterface.rc"

"$(INTDIR)\TAO_DynamicInterface.res" : $(SOURCE)
	$(RSC) /l 0x409 /fo"$(INTDIR)\TAO_DynamicInterface.res" /d NDEBUG /d WIN64 /d _CRT_SECURE_NO_WARNINGS /d _CRT_SECURE_NO_DEPRECATE /d _CRT_NONSTDC_NO_DEPRECATE /i "..\..\.." /i "..\.." $(SOURCE)



!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.DynamicInterface.dep")
	@echo Using "Makefile.DynamicInterface.dep"
!ELSE
	@echo Warning: cannot find "Makefile.DynamicInterface.dep"
!ENDIF
!ENDIF

