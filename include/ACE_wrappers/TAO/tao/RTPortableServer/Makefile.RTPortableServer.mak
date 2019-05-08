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
!MESSAGE NMAKE /f "Makefile.RTPortableServer.mak" CFG="Win64 Debug"
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
INTDIR=Debug\RTPortableServer\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_RTPortableServerd.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_RTPORTABLESERVER_BUILD_DLL -f "Makefile.RTPortableServer.dep" "RT_Acceptor_Filters.cpp" "RT_Collocation_Resolver.cpp" "RT_Object_Adapter_Factory.cpp" "RT_POA.cpp" "RT_Policy_Validator.cpp" "RT_Servant_Dispatcher.cpp" "RTPortableServer.cpp" "RTPortableServerC.cpp" "RTPortableServer_includeC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_RTPortableServerd.pdb"
	-@del /f/q "..\..\..\lib\TAO_RTPortableServerd.dll"
	-@del /f/q "$(OUTDIR)\TAO_RTPortableServerd.lib"
	-@del /f/q "$(OUTDIR)\TAO_RTPortableServerd.exp"
	-@del /f/q "$(OUTDIR)\TAO_RTPortableServerd.ilk"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\RTPortableServer\$(NULL)" mkdir "Debug\RTPortableServer"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_RTPORTABLESERVER_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_CodecFactoryd.lib TAO_PId.lib TAO_RTCORBAd.lib TAO_PortableServerd.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\..\lib\TAO_RTPortableServerd.pdb" /machine:IA64 /out:"..\..\..\lib\TAO_RTPortableServerd.dll" /implib:"$(OUTDIR)\TAO_RTPortableServerd.lib"
LINK32_OBJS= \
	"$(INTDIR)\TAO_RTPortableServer.res" \
	"$(INTDIR)\RT_Acceptor_Filters.obj" \
	"$(INTDIR)\RT_Collocation_Resolver.obj" \
	"$(INTDIR)\RT_Object_Adapter_Factory.obj" \
	"$(INTDIR)\RT_POA.obj" \
	"$(INTDIR)\RT_Policy_Validator.obj" \
	"$(INTDIR)\RT_Servant_Dispatcher.obj" \
	"$(INTDIR)\RTPortableServer.obj" \
	"$(INTDIR)\RTPortableServerC.obj" \
	"$(INTDIR)\RTPortableServer_includeC.obj"

"..\..\..\lib\TAO_RTPortableServerd.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_RTPortableServerd.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_RTPortableServerd.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\RTPortableServer\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_RTPortableServer.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_RTPORTABLESERVER_BUILD_DLL -f "Makefile.RTPortableServer.dep" "RT_Acceptor_Filters.cpp" "RT_Collocation_Resolver.cpp" "RT_Object_Adapter_Factory.cpp" "RT_POA.cpp" "RT_Policy_Validator.cpp" "RT_Servant_Dispatcher.cpp" "RTPortableServer.cpp" "RTPortableServerC.cpp" "RTPortableServer_includeC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\TAO_RTPortableServer.dll"
	-@del /f/q "$(OUTDIR)\TAO_RTPortableServer.lib"
	-@del /f/q "$(OUTDIR)\TAO_RTPortableServer.exp"
	-@del /f/q "$(OUTDIR)\TAO_RTPortableServer.ilk"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\RTPortableServer\$(NULL)" mkdir "Release\RTPortableServer"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_RTPORTABLESERVER_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_CodecFactory.lib TAO_PI.lib TAO_RTCORBA.lib TAO_PortableServer.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\..\lib\TAO_RTPortableServer.dll" /implib:"$(OUTDIR)\TAO_RTPortableServer.lib"
LINK32_OBJS= \
	"$(INTDIR)\TAO_RTPortableServer.res" \
	"$(INTDIR)\RT_Acceptor_Filters.obj" \
	"$(INTDIR)\RT_Collocation_Resolver.obj" \
	"$(INTDIR)\RT_Object_Adapter_Factory.obj" \
	"$(INTDIR)\RT_POA.obj" \
	"$(INTDIR)\RT_Policy_Validator.obj" \
	"$(INTDIR)\RT_Servant_Dispatcher.obj" \
	"$(INTDIR)\RTPortableServer.obj" \
	"$(INTDIR)\RTPortableServerC.obj" \
	"$(INTDIR)\RTPortableServer_includeC.obj"

"..\..\..\lib\TAO_RTPortableServer.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_RTPortableServer.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_RTPortableServer.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\RTPortableServer\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_RTPortableServersd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.RTPortableServer.dep" "RT_Acceptor_Filters.cpp" "RT_Collocation_Resolver.cpp" "RT_Object_Adapter_Factory.cpp" "RT_POA.cpp" "RT_Policy_Validator.cpp" "RT_Servant_Dispatcher.cpp" "RTPortableServer.cpp" "RTPortableServerC.cpp" "RTPortableServer_includeC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_RTPortableServersd.lib"
	-@del /f/q "$(OUTDIR)\TAO_RTPortableServersd.exp"
	-@del /f/q "$(OUTDIR)\TAO_RTPortableServersd.ilk"
	-@del /f/q "..\..\..\lib\TAO_RTPortableServersd.pdb"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\RTPortableServer\$(NULL)" mkdir "Static_Debug\RTPortableServer"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\TAO_RTPortableServersd.pdb" /I "..\..\.." /I "..\.." /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_RTPortableServersd.lib"
LINK32_OBJS= \
	"$(INTDIR)\RT_Acceptor_Filters.obj" \
	"$(INTDIR)\RT_Collocation_Resolver.obj" \
	"$(INTDIR)\RT_Object_Adapter_Factory.obj" \
	"$(INTDIR)\RT_POA.obj" \
	"$(INTDIR)\RT_Policy_Validator.obj" \
	"$(INTDIR)\RT_Servant_Dispatcher.obj" \
	"$(INTDIR)\RTPortableServer.obj" \
	"$(INTDIR)\RTPortableServerC.obj" \
	"$(INTDIR)\RTPortableServer_includeC.obj"

"$(OUTDIR)\TAO_RTPortableServersd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_RTPortableServersd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_RTPortableServersd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\RTPortableServer\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_RTPortableServers.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.RTPortableServer.dep" "RT_Acceptor_Filters.cpp" "RT_Collocation_Resolver.cpp" "RT_Object_Adapter_Factory.cpp" "RT_POA.cpp" "RT_Policy_Validator.cpp" "RT_Servant_Dispatcher.cpp" "RTPortableServer.cpp" "RTPortableServerC.cpp" "RTPortableServer_includeC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_RTPortableServers.lib"
	-@del /f/q "$(OUTDIR)\TAO_RTPortableServers.exp"
	-@del /f/q "$(OUTDIR)\TAO_RTPortableServers.ilk"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\RTPortableServer\$(NULL)" mkdir "Static_Release\RTPortableServer"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_RTPortableServers.lib"
LINK32_OBJS= \
	"$(INTDIR)\RT_Acceptor_Filters.obj" \
	"$(INTDIR)\RT_Collocation_Resolver.obj" \
	"$(INTDIR)\RT_Object_Adapter_Factory.obj" \
	"$(INTDIR)\RT_POA.obj" \
	"$(INTDIR)\RT_Policy_Validator.obj" \
	"$(INTDIR)\RT_Servant_Dispatcher.obj" \
	"$(INTDIR)\RTPortableServer.obj" \
	"$(INTDIR)\RTPortableServerC.obj" \
	"$(INTDIR)\RTPortableServer_includeC.obj"

"$(OUTDIR)\TAO_RTPortableServers.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_RTPortableServers.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_RTPortableServers.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.RTPortableServer.dep")
!INCLUDE "Makefile.RTPortableServer.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="RT_Acceptor_Filters.cpp"

"$(INTDIR)\RT_Acceptor_Filters.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RT_Acceptor_Filters.obj" $(SOURCE)

SOURCE="RT_Collocation_Resolver.cpp"

"$(INTDIR)\RT_Collocation_Resolver.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RT_Collocation_Resolver.obj" $(SOURCE)

SOURCE="RT_Object_Adapter_Factory.cpp"

"$(INTDIR)\RT_Object_Adapter_Factory.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RT_Object_Adapter_Factory.obj" $(SOURCE)

SOURCE="RT_POA.cpp"

"$(INTDIR)\RT_POA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RT_POA.obj" $(SOURCE)

SOURCE="RT_Policy_Validator.cpp"

"$(INTDIR)\RT_Policy_Validator.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RT_Policy_Validator.obj" $(SOURCE)

SOURCE="RT_Servant_Dispatcher.cpp"

"$(INTDIR)\RT_Servant_Dispatcher.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RT_Servant_Dispatcher.obj" $(SOURCE)

SOURCE="RTPortableServer.cpp"

"$(INTDIR)\RTPortableServer.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RTPortableServer.obj" $(SOURCE)

SOURCE="RTPortableServerC.cpp"

"$(INTDIR)\RTPortableServerC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RTPortableServerC.obj" $(SOURCE)

SOURCE="RTPortableServer_includeC.cpp"

"$(INTDIR)\RTPortableServer_includeC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RTPortableServer_includeC.obj" $(SOURCE)

!IF  "$(CFG)" == "Win64 Debug"
!ELSEIF  "$(CFG)" == "Win64 Release"
!ELSEIF  "$(CFG)" == "Win64 Static Debug"
!ELSEIF  "$(CFG)" == "Win64 Static Release"
!ENDIF

SOURCE="TAO_RTPortableServer.rc"

"$(INTDIR)\TAO_RTPortableServer.res" : $(SOURCE)
	$(RSC) /l 0x409 /fo"$(INTDIR)\TAO_RTPortableServer.res" /d NDEBUG /d WIN64 /d _CRT_SECURE_NO_WARNINGS /d _CRT_SECURE_NO_DEPRECATE /d _CRT_NONSTDC_NO_DEPRECATE /i "..\..\.." /i "..\.." $(SOURCE)



!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.RTPortableServer.dep")
	@echo Using "Makefile.RTPortableServer.dep"
!ELSE
	@echo Warning: cannot find "Makefile.RTPortableServer.dep"
!ENDIF
!ENDIF

