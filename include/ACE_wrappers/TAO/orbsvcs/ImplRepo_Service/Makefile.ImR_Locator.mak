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
!MESSAGE NMAKE /f "Makefile.ImR_Locator.mak" CFG="Win64 Debug"
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
INTDIR=Debug\ImR_Locator\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_ImR_Locatord.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -I"..\..\..\ACEXML\common" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DLOCATOR_BUILD_DLL -f "Makefile.ImR_Locator.dep" "Activator_Info.cpp" "Adapter_Activator.cpp" "Forwarder.cpp" "ImR_Locator_i.cpp" "AsyncStartupWaiter_i.cpp" "INS_Locator.cpp" "Locator_XMLHandler.cpp" "Locator_Loader.cpp" "Locator_Options.cpp" "Iterator.cpp" "Server_Info.cpp" "Locator_Repository.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_ImR_Locatord.pdb"
	-@del /f/q "..\..\..\lib\TAO_ImR_Locatord.dll"
	-@del /f/q "$(OUTDIR)\TAO_ImR_Locatord.lib"
	-@del /f/q "$(OUTDIR)\TAO_ImR_Locatord.exp"
	-@del /f/q "$(OUTDIR)\TAO_ImR_Locatord.ilk"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\ImR_Locator\$(NULL)" mkdir "Debug\ImR_Locator"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /I "..\..\..\ACEXML\common" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D LOCATOR_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_IORTabled.lib TAO_PortableServerd.lib TAO_Valuetyped.lib TAO_CodecFactoryd.lib TAO_PId.lib TAO_Messagingd.lib TAO_Svc_Utilsd.lib ACEXMLd.lib ACEXML_Parserd.lib TAO_ImR_Clientd.lib TAO_ImR_Activator_IDLd.lib TAO_ImR_Locator_IDLd.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\..\lib\TAO_ImR_Locatord.pdb" /machine:IA64 /out:"..\..\..\lib\TAO_ImR_Locatord.dll" /implib:"$(OUTDIR)\TAO_ImR_Locatord.lib"
LINK32_OBJS= \
	"$(INTDIR)\Activator_Info.obj" \
	"$(INTDIR)\Adapter_Activator.obj" \
	"$(INTDIR)\Forwarder.obj" \
	"$(INTDIR)\ImR_Locator_i.obj" \
	"$(INTDIR)\AsyncStartupWaiter_i.obj" \
	"$(INTDIR)\INS_Locator.obj" \
	"$(INTDIR)\Locator_XMLHandler.obj" \
	"$(INTDIR)\Locator_Loader.obj" \
	"$(INTDIR)\Locator_Options.obj" \
	"$(INTDIR)\Iterator.obj" \
	"$(INTDIR)\Server_Info.obj" \
	"$(INTDIR)\Locator_Repository.obj"

"..\..\..\lib\TAO_ImR_Locatord.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_ImR_Locatord.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_ImR_Locatord.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\ImR_Locator\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_ImR_Locator.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -I"..\..\..\ACEXML\common" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DLOCATOR_BUILD_DLL -f "Makefile.ImR_Locator.dep" "Activator_Info.cpp" "Adapter_Activator.cpp" "Forwarder.cpp" "ImR_Locator_i.cpp" "AsyncStartupWaiter_i.cpp" "INS_Locator.cpp" "Locator_XMLHandler.cpp" "Locator_Loader.cpp" "Locator_Options.cpp" "Iterator.cpp" "Server_Info.cpp" "Locator_Repository.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\TAO_ImR_Locator.dll"
	-@del /f/q "$(OUTDIR)\TAO_ImR_Locator.lib"
	-@del /f/q "$(OUTDIR)\TAO_ImR_Locator.exp"
	-@del /f/q "$(OUTDIR)\TAO_ImR_Locator.ilk"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\ImR_Locator\$(NULL)" mkdir "Release\ImR_Locator"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /I "..\..\..\ACEXML\common" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D LOCATOR_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_IORTable.lib TAO_PortableServer.lib TAO_Valuetype.lib TAO_CodecFactory.lib TAO_PI.lib TAO_Messaging.lib TAO_Svc_Utils.lib ACEXML.lib ACEXML_Parser.lib TAO_ImR_Client.lib TAO_ImR_Activator_IDL.lib TAO_ImR_Locator_IDL.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\..\lib\TAO_ImR_Locator.dll" /implib:"$(OUTDIR)\TAO_ImR_Locator.lib"
LINK32_OBJS= \
	"$(INTDIR)\Activator_Info.obj" \
	"$(INTDIR)\Adapter_Activator.obj" \
	"$(INTDIR)\Forwarder.obj" \
	"$(INTDIR)\ImR_Locator_i.obj" \
	"$(INTDIR)\AsyncStartupWaiter_i.obj" \
	"$(INTDIR)\INS_Locator.obj" \
	"$(INTDIR)\Locator_XMLHandler.obj" \
	"$(INTDIR)\Locator_Loader.obj" \
	"$(INTDIR)\Locator_Options.obj" \
	"$(INTDIR)\Iterator.obj" \
	"$(INTDIR)\Server_Info.obj" \
	"$(INTDIR)\Locator_Repository.obj"

"..\..\..\lib\TAO_ImR_Locator.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_ImR_Locator.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_ImR_Locator.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\ImR_Locator\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_ImR_Locatorsd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -I"..\..\..\ACEXML\common" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.ImR_Locator.dep" "Activator_Info.cpp" "Adapter_Activator.cpp" "Forwarder.cpp" "ImR_Locator_i.cpp" "AsyncStartupWaiter_i.cpp" "INS_Locator.cpp" "Locator_XMLHandler.cpp" "Locator_Loader.cpp" "Locator_Options.cpp" "Iterator.cpp" "Server_Info.cpp" "Locator_Repository.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_ImR_Locatorsd.lib"
	-@del /f/q "$(OUTDIR)\TAO_ImR_Locatorsd.exp"
	-@del /f/q "$(OUTDIR)\TAO_ImR_Locatorsd.ilk"
	-@del /f/q "..\..\..\lib\TAO_ImR_Locatorsd.pdb"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\ImR_Locator\$(NULL)" mkdir "Static_Debug\ImR_Locator"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\TAO_ImR_Locatorsd.pdb" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /I "..\..\..\ACEXML\common" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_ImR_Locatorsd.lib"
LINK32_OBJS= \
	"$(INTDIR)\Activator_Info.obj" \
	"$(INTDIR)\Adapter_Activator.obj" \
	"$(INTDIR)\Forwarder.obj" \
	"$(INTDIR)\ImR_Locator_i.obj" \
	"$(INTDIR)\AsyncStartupWaiter_i.obj" \
	"$(INTDIR)\INS_Locator.obj" \
	"$(INTDIR)\Locator_XMLHandler.obj" \
	"$(INTDIR)\Locator_Loader.obj" \
	"$(INTDIR)\Locator_Options.obj" \
	"$(INTDIR)\Iterator.obj" \
	"$(INTDIR)\Server_Info.obj" \
	"$(INTDIR)\Locator_Repository.obj"

"$(OUTDIR)\TAO_ImR_Locatorsd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_ImR_Locatorsd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_ImR_Locatorsd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\ImR_Locator\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_ImR_Locators.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -I"..\..\..\ACEXML\common" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.ImR_Locator.dep" "Activator_Info.cpp" "Adapter_Activator.cpp" "Forwarder.cpp" "ImR_Locator_i.cpp" "AsyncStartupWaiter_i.cpp" "INS_Locator.cpp" "Locator_XMLHandler.cpp" "Locator_Loader.cpp" "Locator_Options.cpp" "Iterator.cpp" "Server_Info.cpp" "Locator_Repository.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_ImR_Locators.lib"
	-@del /f/q "$(OUTDIR)\TAO_ImR_Locators.exp"
	-@del /f/q "$(OUTDIR)\TAO_ImR_Locators.ilk"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\ImR_Locator\$(NULL)" mkdir "Static_Release\ImR_Locator"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /I "..\..\..\ACEXML\common" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_ImR_Locators.lib"
LINK32_OBJS= \
	"$(INTDIR)\Activator_Info.obj" \
	"$(INTDIR)\Adapter_Activator.obj" \
	"$(INTDIR)\Forwarder.obj" \
	"$(INTDIR)\ImR_Locator_i.obj" \
	"$(INTDIR)\AsyncStartupWaiter_i.obj" \
	"$(INTDIR)\INS_Locator.obj" \
	"$(INTDIR)\Locator_XMLHandler.obj" \
	"$(INTDIR)\Locator_Loader.obj" \
	"$(INTDIR)\Locator_Options.obj" \
	"$(INTDIR)\Iterator.obj" \
	"$(INTDIR)\Server_Info.obj" \
	"$(INTDIR)\Locator_Repository.obj"

"$(OUTDIR)\TAO_ImR_Locators.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_ImR_Locators.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_ImR_Locators.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.ImR_Locator.dep")
!INCLUDE "Makefile.ImR_Locator.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="Activator_Info.cpp"

"$(INTDIR)\Activator_Info.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Activator_Info.obj" $(SOURCE)

SOURCE="Adapter_Activator.cpp"

"$(INTDIR)\Adapter_Activator.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Adapter_Activator.obj" $(SOURCE)

SOURCE="Forwarder.cpp"

"$(INTDIR)\Forwarder.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Forwarder.obj" $(SOURCE)

SOURCE="ImR_Locator_i.cpp"

"$(INTDIR)\ImR_Locator_i.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ImR_Locator_i.obj" $(SOURCE)

SOURCE="AsyncStartupWaiter_i.cpp"

"$(INTDIR)\AsyncStartupWaiter_i.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\AsyncStartupWaiter_i.obj" $(SOURCE)

SOURCE="INS_Locator.cpp"

"$(INTDIR)\INS_Locator.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\INS_Locator.obj" $(SOURCE)

SOURCE="Locator_XMLHandler.cpp"

"$(INTDIR)\Locator_XMLHandler.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Locator_XMLHandler.obj" $(SOURCE)

SOURCE="Locator_Loader.cpp"

"$(INTDIR)\Locator_Loader.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Locator_Loader.obj" $(SOURCE)

SOURCE="Locator_Options.cpp"

"$(INTDIR)\Locator_Options.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Locator_Options.obj" $(SOURCE)

SOURCE="Iterator.cpp"

"$(INTDIR)\Iterator.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Iterator.obj" $(SOURCE)

SOURCE="Server_Info.cpp"

"$(INTDIR)\Server_Info.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Server_Info.obj" $(SOURCE)

SOURCE="Locator_Repository.cpp"

"$(INTDIR)\Locator_Repository.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Locator_Repository.obj" $(SOURCE)

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
!IF EXISTS("Makefile.ImR_Locator.dep")
	@echo Using "Makefile.ImR_Locator.dep"
!ELSE
	@echo Warning: cannot find "Makefile.ImR_Locator.dep"
!ENDIF
!ENDIF

