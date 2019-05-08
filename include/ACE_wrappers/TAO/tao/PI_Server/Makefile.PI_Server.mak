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
!MESSAGE NMAKE /f "Makefile.PI_Server.mak" CFG="Win64 Debug"
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
INTDIR=Debug\PI_Server\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_PI_Serverd.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_PI_SERVER_BUILD_DLL -f "Makefile.PI_Server.dep" "PI_Server.cpp" "PI_Server_Loader.cpp" "PICurrent_Guard.cpp" "PortableServer_ORBInitializer.cpp" "PortableServer_PolicyFactory.cpp" "ServerInterceptorAdapter.cpp" "ServerRequestDetails.cpp" "ServerRequestInfo.cpp" "ServerRequestInterceptor_Factory_Impl.cpp" "ServerRequestInterceptorA.cpp" "ServerRequestInterceptorC.cpp" "ServerRequestInfoC.cpp" "PI_Server_includeC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_PI_Serverd.pdb"
	-@del /f/q "..\..\..\lib\TAO_PI_Serverd.dll"
	-@del /f/q "$(OUTDIR)\TAO_PI_Serverd.lib"
	-@del /f/q "$(OUTDIR)\TAO_PI_Serverd.exp"
	-@del /f/q "$(OUTDIR)\TAO_PI_Serverd.ilk"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\PI_Server\$(NULL)" mkdir "Debug\PI_Server"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_PI_SERVER_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_CodecFactoryd.lib TAO_PId.lib TAO_PortableServerd.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\..\lib\TAO_PI_Serverd.pdb" /machine:IA64 /out:"..\..\..\lib\TAO_PI_Serverd.dll" /implib:"$(OUTDIR)\TAO_PI_Serverd.lib"
LINK32_OBJS= \
	"$(INTDIR)\TAO_PI_Server.res" \
	"$(INTDIR)\PI_Server.obj" \
	"$(INTDIR)\PI_Server_Loader.obj" \
	"$(INTDIR)\PICurrent_Guard.obj" \
	"$(INTDIR)\PortableServer_ORBInitializer.obj" \
	"$(INTDIR)\PortableServer_PolicyFactory.obj" \
	"$(INTDIR)\ServerInterceptorAdapter.obj" \
	"$(INTDIR)\ServerRequestDetails.obj" \
	"$(INTDIR)\ServerRequestInfo.obj" \
	"$(INTDIR)\ServerRequestInterceptor_Factory_Impl.obj" \
	"$(INTDIR)\ServerRequestInterceptorA.obj" \
	"$(INTDIR)\ServerRequestInterceptorC.obj" \
	"$(INTDIR)\ServerRequestInfoC.obj" \
	"$(INTDIR)\PI_Server_includeC.obj"

"..\..\..\lib\TAO_PI_Serverd.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_PI_Serverd.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_PI_Serverd.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\PI_Server\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_PI_Server.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_PI_SERVER_BUILD_DLL -f "Makefile.PI_Server.dep" "PI_Server.cpp" "PI_Server_Loader.cpp" "PICurrent_Guard.cpp" "PortableServer_ORBInitializer.cpp" "PortableServer_PolicyFactory.cpp" "ServerInterceptorAdapter.cpp" "ServerRequestDetails.cpp" "ServerRequestInfo.cpp" "ServerRequestInterceptor_Factory_Impl.cpp" "ServerRequestInterceptorA.cpp" "ServerRequestInterceptorC.cpp" "ServerRequestInfoC.cpp" "PI_Server_includeC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\TAO_PI_Server.dll"
	-@del /f/q "$(OUTDIR)\TAO_PI_Server.lib"
	-@del /f/q "$(OUTDIR)\TAO_PI_Server.exp"
	-@del /f/q "$(OUTDIR)\TAO_PI_Server.ilk"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\PI_Server\$(NULL)" mkdir "Release\PI_Server"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_PI_SERVER_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_CodecFactory.lib TAO_PI.lib TAO_PortableServer.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\..\lib\TAO_PI_Server.dll" /implib:"$(OUTDIR)\TAO_PI_Server.lib"
LINK32_OBJS= \
	"$(INTDIR)\TAO_PI_Server.res" \
	"$(INTDIR)\PI_Server.obj" \
	"$(INTDIR)\PI_Server_Loader.obj" \
	"$(INTDIR)\PICurrent_Guard.obj" \
	"$(INTDIR)\PortableServer_ORBInitializer.obj" \
	"$(INTDIR)\PortableServer_PolicyFactory.obj" \
	"$(INTDIR)\ServerInterceptorAdapter.obj" \
	"$(INTDIR)\ServerRequestDetails.obj" \
	"$(INTDIR)\ServerRequestInfo.obj" \
	"$(INTDIR)\ServerRequestInterceptor_Factory_Impl.obj" \
	"$(INTDIR)\ServerRequestInterceptorA.obj" \
	"$(INTDIR)\ServerRequestInterceptorC.obj" \
	"$(INTDIR)\ServerRequestInfoC.obj" \
	"$(INTDIR)\PI_Server_includeC.obj"

"..\..\..\lib\TAO_PI_Server.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_PI_Server.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_PI_Server.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\PI_Server\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_PI_Serversd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.PI_Server.dep" "PI_Server.cpp" "PI_Server_Loader.cpp" "PICurrent_Guard.cpp" "PortableServer_ORBInitializer.cpp" "PortableServer_PolicyFactory.cpp" "ServerInterceptorAdapter.cpp" "ServerRequestDetails.cpp" "ServerRequestInfo.cpp" "ServerRequestInterceptor_Factory_Impl.cpp" "ServerRequestInterceptorA.cpp" "ServerRequestInterceptorC.cpp" "ServerRequestInfoC.cpp" "PI_Server_includeC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_PI_Serversd.lib"
	-@del /f/q "$(OUTDIR)\TAO_PI_Serversd.exp"
	-@del /f/q "$(OUTDIR)\TAO_PI_Serversd.ilk"
	-@del /f/q "..\..\..\lib\TAO_PI_Serversd.pdb"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\PI_Server\$(NULL)" mkdir "Static_Debug\PI_Server"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\TAO_PI_Serversd.pdb" /I "..\..\.." /I "..\.." /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_PI_Serversd.lib"
LINK32_OBJS= \
	"$(INTDIR)\PI_Server.obj" \
	"$(INTDIR)\PI_Server_Loader.obj" \
	"$(INTDIR)\PICurrent_Guard.obj" \
	"$(INTDIR)\PortableServer_ORBInitializer.obj" \
	"$(INTDIR)\PortableServer_PolicyFactory.obj" \
	"$(INTDIR)\ServerInterceptorAdapter.obj" \
	"$(INTDIR)\ServerRequestDetails.obj" \
	"$(INTDIR)\ServerRequestInfo.obj" \
	"$(INTDIR)\ServerRequestInterceptor_Factory_Impl.obj" \
	"$(INTDIR)\ServerRequestInterceptorA.obj" \
	"$(INTDIR)\ServerRequestInterceptorC.obj" \
	"$(INTDIR)\ServerRequestInfoC.obj" \
	"$(INTDIR)\PI_Server_includeC.obj"

"$(OUTDIR)\TAO_PI_Serversd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_PI_Serversd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_PI_Serversd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\PI_Server\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_PI_Servers.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.PI_Server.dep" "PI_Server.cpp" "PI_Server_Loader.cpp" "PICurrent_Guard.cpp" "PortableServer_ORBInitializer.cpp" "PortableServer_PolicyFactory.cpp" "ServerInterceptorAdapter.cpp" "ServerRequestDetails.cpp" "ServerRequestInfo.cpp" "ServerRequestInterceptor_Factory_Impl.cpp" "ServerRequestInterceptorA.cpp" "ServerRequestInterceptorC.cpp" "ServerRequestInfoC.cpp" "PI_Server_includeC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_PI_Servers.lib"
	-@del /f/q "$(OUTDIR)\TAO_PI_Servers.exp"
	-@del /f/q "$(OUTDIR)\TAO_PI_Servers.ilk"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\PI_Server\$(NULL)" mkdir "Static_Release\PI_Server"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_PI_Servers.lib"
LINK32_OBJS= \
	"$(INTDIR)\PI_Server.obj" \
	"$(INTDIR)\PI_Server_Loader.obj" \
	"$(INTDIR)\PICurrent_Guard.obj" \
	"$(INTDIR)\PortableServer_ORBInitializer.obj" \
	"$(INTDIR)\PortableServer_PolicyFactory.obj" \
	"$(INTDIR)\ServerInterceptorAdapter.obj" \
	"$(INTDIR)\ServerRequestDetails.obj" \
	"$(INTDIR)\ServerRequestInfo.obj" \
	"$(INTDIR)\ServerRequestInterceptor_Factory_Impl.obj" \
	"$(INTDIR)\ServerRequestInterceptorA.obj" \
	"$(INTDIR)\ServerRequestInterceptorC.obj" \
	"$(INTDIR)\ServerRequestInfoC.obj" \
	"$(INTDIR)\PI_Server_includeC.obj"

"$(OUTDIR)\TAO_PI_Servers.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_PI_Servers.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_PI_Servers.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.PI_Server.dep")
!INCLUDE "Makefile.PI_Server.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="PI_Server.cpp"

"$(INTDIR)\PI_Server.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PI_Server.obj" $(SOURCE)

SOURCE="PI_Server_Loader.cpp"

"$(INTDIR)\PI_Server_Loader.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PI_Server_Loader.obj" $(SOURCE)

SOURCE="PICurrent_Guard.cpp"

"$(INTDIR)\PICurrent_Guard.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PICurrent_Guard.obj" $(SOURCE)

SOURCE="PortableServer_ORBInitializer.cpp"

"$(INTDIR)\PortableServer_ORBInitializer.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PortableServer_ORBInitializer.obj" $(SOURCE)

SOURCE="PortableServer_PolicyFactory.cpp"

"$(INTDIR)\PortableServer_PolicyFactory.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PortableServer_PolicyFactory.obj" $(SOURCE)

SOURCE="ServerInterceptorAdapter.cpp"

"$(INTDIR)\ServerInterceptorAdapter.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ServerInterceptorAdapter.obj" $(SOURCE)

SOURCE="ServerRequestDetails.cpp"

"$(INTDIR)\ServerRequestDetails.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ServerRequestDetails.obj" $(SOURCE)

SOURCE="ServerRequestInfo.cpp"

"$(INTDIR)\ServerRequestInfo.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ServerRequestInfo.obj" $(SOURCE)

SOURCE="ServerRequestInterceptor_Factory_Impl.cpp"

"$(INTDIR)\ServerRequestInterceptor_Factory_Impl.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ServerRequestInterceptor_Factory_Impl.obj" $(SOURCE)

SOURCE="ServerRequestInterceptorA.cpp"

"$(INTDIR)\ServerRequestInterceptorA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ServerRequestInterceptorA.obj" $(SOURCE)

SOURCE="ServerRequestInterceptorC.cpp"

"$(INTDIR)\ServerRequestInterceptorC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ServerRequestInterceptorC.obj" $(SOURCE)

SOURCE="ServerRequestInfoC.cpp"

"$(INTDIR)\ServerRequestInfoC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ServerRequestInfoC.obj" $(SOURCE)

SOURCE="PI_Server_includeC.cpp"

"$(INTDIR)\PI_Server_includeC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PI_Server_includeC.obj" $(SOURCE)

!IF  "$(CFG)" == "Win64 Debug"
!ELSEIF  "$(CFG)" == "Win64 Release"
!ELSEIF  "$(CFG)" == "Win64 Static Debug"
!ELSEIF  "$(CFG)" == "Win64 Static Release"
!ENDIF

SOURCE="TAO_PI_Server.rc"

"$(INTDIR)\TAO_PI_Server.res" : $(SOURCE)
	$(RSC) /l 0x409 /fo"$(INTDIR)\TAO_PI_Server.res" /d NDEBUG /d WIN64 /d _CRT_SECURE_NO_WARNINGS /d _CRT_SECURE_NO_DEPRECATE /d _CRT_NONSTDC_NO_DEPRECATE /i "..\..\.." /i "..\.." $(SOURCE)



!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.PI_Server.dep")
	@echo Using "Makefile.PI_Server.dep"
!ELSE
	@echo Warning: cannot find "Makefile.PI_Server.dep"
!ENDIF
!ENDIF

