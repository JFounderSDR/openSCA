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
!MESSAGE NMAKE /f "Makefile.Codeset.mak" CFG="Win64 Debug"
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
INTDIR=Debug\Codeset\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_Codesetd.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_CODESET_BUILD_DLL -f "Makefile.Codeset.dep" "Codeset.cpp" "Codeset_Descriptor.cpp" "Codeset_Manager_Factory.cpp" "Codeset_Manager_i.cpp" "Codeset_Service_Context_Handler.cpp" "Codeset_Translator_Factory.cpp" "UTF16_BOM_Factory.cpp" "UTF16_BOM_Translator.cpp" "UTF8_Latin1_Factory.cpp" "UTF8_Latin1_Translator.cpp" "CodeSetContextC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_Codesetd.pdb"
	-@del /f/q "..\..\..\lib\TAO_Codesetd.dll"
	-@del /f/q "$(OUTDIR)\TAO_Codesetd.lib"
	-@del /f/q "$(OUTDIR)\TAO_Codesetd.exp"
	-@del /f/q "$(OUTDIR)\TAO_Codesetd.ilk"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\Codeset\$(NULL)" mkdir "Debug\Codeset"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_CODESET_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\..\lib\TAO_Codesetd.pdb" /machine:IA64 /out:"..\..\..\lib\TAO_Codesetd.dll" /implib:"$(OUTDIR)\TAO_Codesetd.lib"
LINK32_OBJS= \
	"$(INTDIR)\TAO_Codeset.res" \
	"$(INTDIR)\Codeset.obj" \
	"$(INTDIR)\Codeset_Descriptor.obj" \
	"$(INTDIR)\Codeset_Manager_Factory.obj" \
	"$(INTDIR)\Codeset_Manager_i.obj" \
	"$(INTDIR)\Codeset_Service_Context_Handler.obj" \
	"$(INTDIR)\Codeset_Translator_Factory.obj" \
	"$(INTDIR)\UTF16_BOM_Factory.obj" \
	"$(INTDIR)\UTF16_BOM_Translator.obj" \
	"$(INTDIR)\UTF8_Latin1_Factory.obj" \
	"$(INTDIR)\UTF8_Latin1_Translator.obj" \
	"$(INTDIR)\CodeSetContextC.obj"

"..\..\..\lib\TAO_Codesetd.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_Codesetd.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_Codesetd.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\Codeset\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_Codeset.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_CODESET_BUILD_DLL -f "Makefile.Codeset.dep" "Codeset.cpp" "Codeset_Descriptor.cpp" "Codeset_Manager_Factory.cpp" "Codeset_Manager_i.cpp" "Codeset_Service_Context_Handler.cpp" "Codeset_Translator_Factory.cpp" "UTF16_BOM_Factory.cpp" "UTF16_BOM_Translator.cpp" "UTF8_Latin1_Factory.cpp" "UTF8_Latin1_Translator.cpp" "CodeSetContextC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\TAO_Codeset.dll"
	-@del /f/q "$(OUTDIR)\TAO_Codeset.lib"
	-@del /f/q "$(OUTDIR)\TAO_Codeset.exp"
	-@del /f/q "$(OUTDIR)\TAO_Codeset.ilk"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\Codeset\$(NULL)" mkdir "Release\Codeset"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_CODESET_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\..\lib\TAO_Codeset.dll" /implib:"$(OUTDIR)\TAO_Codeset.lib"
LINK32_OBJS= \
	"$(INTDIR)\TAO_Codeset.res" \
	"$(INTDIR)\Codeset.obj" \
	"$(INTDIR)\Codeset_Descriptor.obj" \
	"$(INTDIR)\Codeset_Manager_Factory.obj" \
	"$(INTDIR)\Codeset_Manager_i.obj" \
	"$(INTDIR)\Codeset_Service_Context_Handler.obj" \
	"$(INTDIR)\Codeset_Translator_Factory.obj" \
	"$(INTDIR)\UTF16_BOM_Factory.obj" \
	"$(INTDIR)\UTF16_BOM_Translator.obj" \
	"$(INTDIR)\UTF8_Latin1_Factory.obj" \
	"$(INTDIR)\UTF8_Latin1_Translator.obj" \
	"$(INTDIR)\CodeSetContextC.obj"

"..\..\..\lib\TAO_Codeset.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_Codeset.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_Codeset.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\Codeset\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_Codesetsd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.Codeset.dep" "Codeset.cpp" "Codeset_Descriptor.cpp" "Codeset_Manager_Factory.cpp" "Codeset_Manager_i.cpp" "Codeset_Service_Context_Handler.cpp" "Codeset_Translator_Factory.cpp" "UTF16_BOM_Factory.cpp" "UTF16_BOM_Translator.cpp" "UTF8_Latin1_Factory.cpp" "UTF8_Latin1_Translator.cpp" "CodeSetContextC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_Codesetsd.lib"
	-@del /f/q "$(OUTDIR)\TAO_Codesetsd.exp"
	-@del /f/q "$(OUTDIR)\TAO_Codesetsd.ilk"
	-@del /f/q "..\..\..\lib\TAO_Codesetsd.pdb"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\Codeset\$(NULL)" mkdir "Static_Debug\Codeset"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\TAO_Codesetsd.pdb" /I "..\..\.." /I "..\.." /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_Codesetsd.lib"
LINK32_OBJS= \
	"$(INTDIR)\Codeset.obj" \
	"$(INTDIR)\Codeset_Descriptor.obj" \
	"$(INTDIR)\Codeset_Manager_Factory.obj" \
	"$(INTDIR)\Codeset_Manager_i.obj" \
	"$(INTDIR)\Codeset_Service_Context_Handler.obj" \
	"$(INTDIR)\Codeset_Translator_Factory.obj" \
	"$(INTDIR)\UTF16_BOM_Factory.obj" \
	"$(INTDIR)\UTF16_BOM_Translator.obj" \
	"$(INTDIR)\UTF8_Latin1_Factory.obj" \
	"$(INTDIR)\UTF8_Latin1_Translator.obj" \
	"$(INTDIR)\CodeSetContextC.obj"

"$(OUTDIR)\TAO_Codesetsd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_Codesetsd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_Codesetsd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\Codeset\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_Codesets.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.Codeset.dep" "Codeset.cpp" "Codeset_Descriptor.cpp" "Codeset_Manager_Factory.cpp" "Codeset_Manager_i.cpp" "Codeset_Service_Context_Handler.cpp" "Codeset_Translator_Factory.cpp" "UTF16_BOM_Factory.cpp" "UTF16_BOM_Translator.cpp" "UTF8_Latin1_Factory.cpp" "UTF8_Latin1_Translator.cpp" "CodeSetContextC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_Codesets.lib"
	-@del /f/q "$(OUTDIR)\TAO_Codesets.exp"
	-@del /f/q "$(OUTDIR)\TAO_Codesets.ilk"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\Codeset\$(NULL)" mkdir "Static_Release\Codeset"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_Codesets.lib"
LINK32_OBJS= \
	"$(INTDIR)\Codeset.obj" \
	"$(INTDIR)\Codeset_Descriptor.obj" \
	"$(INTDIR)\Codeset_Manager_Factory.obj" \
	"$(INTDIR)\Codeset_Manager_i.obj" \
	"$(INTDIR)\Codeset_Service_Context_Handler.obj" \
	"$(INTDIR)\Codeset_Translator_Factory.obj" \
	"$(INTDIR)\UTF16_BOM_Factory.obj" \
	"$(INTDIR)\UTF16_BOM_Translator.obj" \
	"$(INTDIR)\UTF8_Latin1_Factory.obj" \
	"$(INTDIR)\UTF8_Latin1_Translator.obj" \
	"$(INTDIR)\CodeSetContextC.obj"

"$(OUTDIR)\TAO_Codesets.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_Codesets.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_Codesets.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.Codeset.dep")
!INCLUDE "Makefile.Codeset.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="Codeset.cpp"

"$(INTDIR)\Codeset.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Codeset.obj" $(SOURCE)

SOURCE="Codeset_Descriptor.cpp"

"$(INTDIR)\Codeset_Descriptor.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Codeset_Descriptor.obj" $(SOURCE)

SOURCE="Codeset_Manager_Factory.cpp"

"$(INTDIR)\Codeset_Manager_Factory.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Codeset_Manager_Factory.obj" $(SOURCE)

SOURCE="Codeset_Manager_i.cpp"

"$(INTDIR)\Codeset_Manager_i.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Codeset_Manager_i.obj" $(SOURCE)

SOURCE="Codeset_Service_Context_Handler.cpp"

"$(INTDIR)\Codeset_Service_Context_Handler.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Codeset_Service_Context_Handler.obj" $(SOURCE)

SOURCE="Codeset_Translator_Factory.cpp"

"$(INTDIR)\Codeset_Translator_Factory.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Codeset_Translator_Factory.obj" $(SOURCE)

SOURCE="UTF16_BOM_Factory.cpp"

"$(INTDIR)\UTF16_BOM_Factory.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\UTF16_BOM_Factory.obj" $(SOURCE)

SOURCE="UTF16_BOM_Translator.cpp"

"$(INTDIR)\UTF16_BOM_Translator.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\UTF16_BOM_Translator.obj" $(SOURCE)

SOURCE="UTF8_Latin1_Factory.cpp"

"$(INTDIR)\UTF8_Latin1_Factory.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\UTF8_Latin1_Factory.obj" $(SOURCE)

SOURCE="UTF8_Latin1_Translator.cpp"

"$(INTDIR)\UTF8_Latin1_Translator.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\UTF8_Latin1_Translator.obj" $(SOURCE)

SOURCE="CodeSetContextC.cpp"

"$(INTDIR)\CodeSetContextC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\CodeSetContextC.obj" $(SOURCE)

!IF  "$(CFG)" == "Win64 Debug"
!ELSEIF  "$(CFG)" == "Win64 Release"
!ELSEIF  "$(CFG)" == "Win64 Static Debug"
!ELSEIF  "$(CFG)" == "Win64 Static Release"
!ENDIF

SOURCE="TAO_Codeset.rc"

"$(INTDIR)\TAO_Codeset.res" : $(SOURCE)
	$(RSC) /l 0x409 /fo"$(INTDIR)\TAO_Codeset.res" /d NDEBUG /d WIN64 /d _CRT_SECURE_NO_WARNINGS /d _CRT_SECURE_NO_DEPRECATE /d _CRT_NONSTDC_NO_DEPRECATE /i "..\..\.." /i "..\.." $(SOURCE)



!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.Codeset.dep")
	@echo Using "Makefile.Codeset.dep"
!ELSE
	@echo Warning: cannot find "Makefile.Codeset.dep"
!ENDIF
!ENDIF

