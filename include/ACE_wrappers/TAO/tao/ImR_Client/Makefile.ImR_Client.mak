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
!MESSAGE NMAKE /f "Makefile.ImR_Client.mak" CFG="Win64 Debug"
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
INTDIR=Debug\ImR_Client\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_ImR_Clientd.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_IMR_CLIENT_BUILD_DLL -f "Makefile.ImR_Client.dep" "ImR_Client.cpp" "ServerObject_i.cpp" "ServerObjectC.cpp" "ServerObjectA.cpp" "ServerObjectS.cpp" "ImplRepoC.cpp" "ImplRepoS.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_ImR_Clientd.pdb"
	-@del /f/q "..\..\..\lib\TAO_ImR_Clientd.dll"
	-@del /f/q "$(OUTDIR)\TAO_ImR_Clientd.lib"
	-@del /f/q "$(OUTDIR)\TAO_ImR_Clientd.exp"
	-@del /f/q "$(OUTDIR)\TAO_ImR_Clientd.ilk"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\ImR_Client\$(NULL)" mkdir "Debug\ImR_Client"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_IMR_CLIENT_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_PortableServerd.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\..\lib\TAO_ImR_Clientd.pdb" /machine:IA64 /out:"..\..\..\lib\TAO_ImR_Clientd.dll" /implib:"$(OUTDIR)\TAO_ImR_Clientd.lib"
LINK32_OBJS= \
	"$(INTDIR)\TAO_IMR_Client.res" \
	"$(INTDIR)\ImR_Client.obj" \
	"$(INTDIR)\ServerObject_i.obj" \
	"$(INTDIR)\ServerObjectC.obj" \
	"$(INTDIR)\ServerObjectA.obj" \
	"$(INTDIR)\ServerObjectS.obj" \
	"$(INTDIR)\ImplRepoC.obj" \
	"$(INTDIR)\ImplRepoS.obj"

"..\..\..\lib\TAO_ImR_Clientd.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_ImR_Clientd.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_ImR_Clientd.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\ImR_Client\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_ImR_Client.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_IMR_CLIENT_BUILD_DLL -f "Makefile.ImR_Client.dep" "ImR_Client.cpp" "ServerObject_i.cpp" "ServerObjectC.cpp" "ServerObjectA.cpp" "ServerObjectS.cpp" "ImplRepoC.cpp" "ImplRepoS.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\TAO_ImR_Client.dll"
	-@del /f/q "$(OUTDIR)\TAO_ImR_Client.lib"
	-@del /f/q "$(OUTDIR)\TAO_ImR_Client.exp"
	-@del /f/q "$(OUTDIR)\TAO_ImR_Client.ilk"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\ImR_Client\$(NULL)" mkdir "Release\ImR_Client"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_IMR_CLIENT_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_PortableServer.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\..\lib\TAO_ImR_Client.dll" /implib:"$(OUTDIR)\TAO_ImR_Client.lib"
LINK32_OBJS= \
	"$(INTDIR)\TAO_IMR_Client.res" \
	"$(INTDIR)\ImR_Client.obj" \
	"$(INTDIR)\ServerObject_i.obj" \
	"$(INTDIR)\ServerObjectC.obj" \
	"$(INTDIR)\ServerObjectA.obj" \
	"$(INTDIR)\ServerObjectS.obj" \
	"$(INTDIR)\ImplRepoC.obj" \
	"$(INTDIR)\ImplRepoS.obj"

"..\..\..\lib\TAO_ImR_Client.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_ImR_Client.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_ImR_Client.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\ImR_Client\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_ImR_Clientsd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.ImR_Client.dep" "ImR_Client.cpp" "ServerObject_i.cpp" "ServerObjectC.cpp" "ServerObjectA.cpp" "ServerObjectS.cpp" "ImplRepoC.cpp" "ImplRepoS.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_ImR_Clientsd.lib"
	-@del /f/q "$(OUTDIR)\TAO_ImR_Clientsd.exp"
	-@del /f/q "$(OUTDIR)\TAO_ImR_Clientsd.ilk"
	-@del /f/q "..\..\..\lib\TAO_ImR_Clientsd.pdb"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\ImR_Client\$(NULL)" mkdir "Static_Debug\ImR_Client"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\TAO_ImR_Clientsd.pdb" /I "..\..\.." /I "..\.." /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_ImR_Clientsd.lib"
LINK32_OBJS= \
	"$(INTDIR)\ImR_Client.obj" \
	"$(INTDIR)\ServerObject_i.obj" \
	"$(INTDIR)\ServerObjectC.obj" \
	"$(INTDIR)\ServerObjectA.obj" \
	"$(INTDIR)\ServerObjectS.obj" \
	"$(INTDIR)\ImplRepoC.obj" \
	"$(INTDIR)\ImplRepoS.obj"

"$(OUTDIR)\TAO_ImR_Clientsd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_ImR_Clientsd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_ImR_Clientsd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\ImR_Client\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_ImR_Clients.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.ImR_Client.dep" "ImR_Client.cpp" "ServerObject_i.cpp" "ServerObjectC.cpp" "ServerObjectA.cpp" "ServerObjectS.cpp" "ImplRepoC.cpp" "ImplRepoS.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_ImR_Clients.lib"
	-@del /f/q "$(OUTDIR)\TAO_ImR_Clients.exp"
	-@del /f/q "$(OUTDIR)\TAO_ImR_Clients.ilk"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\ImR_Client\$(NULL)" mkdir "Static_Release\ImR_Client"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_ImR_Clients.lib"
LINK32_OBJS= \
	"$(INTDIR)\ImR_Client.obj" \
	"$(INTDIR)\ServerObject_i.obj" \
	"$(INTDIR)\ServerObjectC.obj" \
	"$(INTDIR)\ServerObjectA.obj" \
	"$(INTDIR)\ServerObjectS.obj" \
	"$(INTDIR)\ImplRepoC.obj" \
	"$(INTDIR)\ImplRepoS.obj"

"$(OUTDIR)\TAO_ImR_Clients.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_ImR_Clients.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_ImR_Clients.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.ImR_Client.dep")
!INCLUDE "Makefile.ImR_Client.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="ImR_Client.cpp"

"$(INTDIR)\ImR_Client.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ImR_Client.obj" $(SOURCE)

SOURCE="ServerObject_i.cpp"

"$(INTDIR)\ServerObject_i.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ServerObject_i.obj" $(SOURCE)

SOURCE="ServerObjectC.cpp"

"$(INTDIR)\ServerObjectC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ServerObjectC.obj" $(SOURCE)

SOURCE="ServerObjectA.cpp"

"$(INTDIR)\ServerObjectA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ServerObjectA.obj" $(SOURCE)

SOURCE="ServerObjectS.cpp"

"$(INTDIR)\ServerObjectS.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ServerObjectS.obj" $(SOURCE)

SOURCE="ImplRepoC.cpp"

"$(INTDIR)\ImplRepoC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ImplRepoC.obj" $(SOURCE)

SOURCE="ImplRepoS.cpp"

"$(INTDIR)\ImplRepoS.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ImplRepoS.obj" $(SOURCE)

!IF  "$(CFG)" == "Win64 Debug"
!ELSEIF  "$(CFG)" == "Win64 Release"
!ELSEIF  "$(CFG)" == "Win64 Static Debug"
!ELSEIF  "$(CFG)" == "Win64 Static Release"
!ENDIF

SOURCE="TAO_IMR_Client.rc"

"$(INTDIR)\TAO_IMR_Client.res" : $(SOURCE)
	$(RSC) /l 0x409 /fo"$(INTDIR)\TAO_IMR_Client.res" /d NDEBUG /d WIN64 /d _CRT_SECURE_NO_WARNINGS /d _CRT_SECURE_NO_DEPRECATE /d _CRT_NONSTDC_NO_DEPRECATE /i "..\..\.." /i "..\.." $(SOURCE)



!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.ImR_Client.dep")
	@echo Using "Makefile.ImR_Client.dep"
!ELSE
	@echo Warning: cannot find "Makefile.ImR_Client.dep"
!ENDIF
!ENDIF

