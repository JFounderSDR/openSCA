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
!MESSAGE NMAKE /f "Makefile.ObjRefTemplate.mak" CFG="Win64 Debug"
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
INTDIR=Debug\ObjRefTemplate\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_ObjRefTemplated.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_ORT_BUILD_DLL -f "Makefile.ObjRefTemplate.dep" "ObjectReferenceTemplate_i.cpp" "ORT_Adapter_Factory_Impl.cpp" "ORT_Adapter_Impl.cpp" "ObjectReferenceTemplateC.cpp" "ObjectReferenceTemplate_includeC.cpp" "Default_ORTC.cpp" "Default_ORTA.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_ObjRefTemplated.pdb"
	-@del /f/q "..\..\..\lib\TAO_ObjRefTemplated.dll"
	-@del /f/q "$(OUTDIR)\TAO_ObjRefTemplated.lib"
	-@del /f/q "$(OUTDIR)\TAO_ObjRefTemplated.exp"
	-@del /f/q "$(OUTDIR)\TAO_ObjRefTemplated.ilk"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\ObjRefTemplate\$(NULL)" mkdir "Debug\ObjRefTemplate"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_ORT_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_Valuetyped.lib TAO_PortableServerd.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\..\lib\TAO_ObjRefTemplated.pdb" /machine:IA64 /out:"..\..\..\lib\TAO_ObjRefTemplated.dll" /implib:"$(OUTDIR)\TAO_ObjRefTemplated.lib"
LINK32_OBJS= \
	"$(INTDIR)\TAO_ObjRefTemplate.res" \
	"$(INTDIR)\ObjectReferenceTemplate_i.obj" \
	"$(INTDIR)\ORT_Adapter_Factory_Impl.obj" \
	"$(INTDIR)\ORT_Adapter_Impl.obj" \
	"$(INTDIR)\ObjectReferenceTemplateC.obj" \
	"$(INTDIR)\ObjectReferenceTemplate_includeC.obj" \
	"$(INTDIR)\Default_ORTC.obj" \
	"$(INTDIR)\Default_ORTA.obj"

"..\..\..\lib\TAO_ObjRefTemplated.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_ObjRefTemplated.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_ObjRefTemplated.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\ObjRefTemplate\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_ObjRefTemplate.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_ORT_BUILD_DLL -f "Makefile.ObjRefTemplate.dep" "ObjectReferenceTemplate_i.cpp" "ORT_Adapter_Factory_Impl.cpp" "ORT_Adapter_Impl.cpp" "ObjectReferenceTemplateC.cpp" "ObjectReferenceTemplate_includeC.cpp" "Default_ORTC.cpp" "Default_ORTA.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\TAO_ObjRefTemplate.dll"
	-@del /f/q "$(OUTDIR)\TAO_ObjRefTemplate.lib"
	-@del /f/q "$(OUTDIR)\TAO_ObjRefTemplate.exp"
	-@del /f/q "$(OUTDIR)\TAO_ObjRefTemplate.ilk"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\ObjRefTemplate\$(NULL)" mkdir "Release\ObjRefTemplate"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_ORT_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_Valuetype.lib TAO_PortableServer.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\..\lib\TAO_ObjRefTemplate.dll" /implib:"$(OUTDIR)\TAO_ObjRefTemplate.lib"
LINK32_OBJS= \
	"$(INTDIR)\TAO_ObjRefTemplate.res" \
	"$(INTDIR)\ObjectReferenceTemplate_i.obj" \
	"$(INTDIR)\ORT_Adapter_Factory_Impl.obj" \
	"$(INTDIR)\ORT_Adapter_Impl.obj" \
	"$(INTDIR)\ObjectReferenceTemplateC.obj" \
	"$(INTDIR)\ObjectReferenceTemplate_includeC.obj" \
	"$(INTDIR)\Default_ORTC.obj" \
	"$(INTDIR)\Default_ORTA.obj"

"..\..\..\lib\TAO_ObjRefTemplate.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_ObjRefTemplate.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_ObjRefTemplate.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\ObjRefTemplate\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_ObjRefTemplatesd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.ObjRefTemplate.dep" "ObjectReferenceTemplate_i.cpp" "ORT_Adapter_Factory_Impl.cpp" "ORT_Adapter_Impl.cpp" "ObjectReferenceTemplateC.cpp" "ObjectReferenceTemplate_includeC.cpp" "Default_ORTC.cpp" "Default_ORTA.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_ObjRefTemplatesd.lib"
	-@del /f/q "$(OUTDIR)\TAO_ObjRefTemplatesd.exp"
	-@del /f/q "$(OUTDIR)\TAO_ObjRefTemplatesd.ilk"
	-@del /f/q "..\..\..\lib\TAO_ObjRefTemplatesd.pdb"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\ObjRefTemplate\$(NULL)" mkdir "Static_Debug\ObjRefTemplate"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\TAO_ObjRefTemplatesd.pdb" /I "..\..\.." /I "..\.." /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_ObjRefTemplatesd.lib"
LINK32_OBJS= \
	"$(INTDIR)\ObjectReferenceTemplate_i.obj" \
	"$(INTDIR)\ORT_Adapter_Factory_Impl.obj" \
	"$(INTDIR)\ORT_Adapter_Impl.obj" \
	"$(INTDIR)\ObjectReferenceTemplateC.obj" \
	"$(INTDIR)\ObjectReferenceTemplate_includeC.obj" \
	"$(INTDIR)\Default_ORTC.obj" \
	"$(INTDIR)\Default_ORTA.obj"

"$(OUTDIR)\TAO_ObjRefTemplatesd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_ObjRefTemplatesd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_ObjRefTemplatesd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\ObjRefTemplate\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_ObjRefTemplates.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.ObjRefTemplate.dep" "ObjectReferenceTemplate_i.cpp" "ORT_Adapter_Factory_Impl.cpp" "ORT_Adapter_Impl.cpp" "ObjectReferenceTemplateC.cpp" "ObjectReferenceTemplate_includeC.cpp" "Default_ORTC.cpp" "Default_ORTA.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_ObjRefTemplates.lib"
	-@del /f/q "$(OUTDIR)\TAO_ObjRefTemplates.exp"
	-@del /f/q "$(OUTDIR)\TAO_ObjRefTemplates.ilk"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\ObjRefTemplate\$(NULL)" mkdir "Static_Release\ObjRefTemplate"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_ObjRefTemplates.lib"
LINK32_OBJS= \
	"$(INTDIR)\ObjectReferenceTemplate_i.obj" \
	"$(INTDIR)\ORT_Adapter_Factory_Impl.obj" \
	"$(INTDIR)\ORT_Adapter_Impl.obj" \
	"$(INTDIR)\ObjectReferenceTemplateC.obj" \
	"$(INTDIR)\ObjectReferenceTemplate_includeC.obj" \
	"$(INTDIR)\Default_ORTC.obj" \
	"$(INTDIR)\Default_ORTA.obj"

"$(OUTDIR)\TAO_ObjRefTemplates.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_ObjRefTemplates.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_ObjRefTemplates.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.ObjRefTemplate.dep")
!INCLUDE "Makefile.ObjRefTemplate.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="ObjectReferenceTemplate_i.cpp"

"$(INTDIR)\ObjectReferenceTemplate_i.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ObjectReferenceTemplate_i.obj" $(SOURCE)

SOURCE="ORT_Adapter_Factory_Impl.cpp"

"$(INTDIR)\ORT_Adapter_Factory_Impl.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ORT_Adapter_Factory_Impl.obj" $(SOURCE)

SOURCE="ORT_Adapter_Impl.cpp"

"$(INTDIR)\ORT_Adapter_Impl.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ORT_Adapter_Impl.obj" $(SOURCE)

SOURCE="ObjectReferenceTemplateC.cpp"

"$(INTDIR)\ObjectReferenceTemplateC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ObjectReferenceTemplateC.obj" $(SOURCE)

SOURCE="ObjectReferenceTemplate_includeC.cpp"

"$(INTDIR)\ObjectReferenceTemplate_includeC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ObjectReferenceTemplate_includeC.obj" $(SOURCE)

SOURCE="Default_ORTC.cpp"

"$(INTDIR)\Default_ORTC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Default_ORTC.obj" $(SOURCE)

SOURCE="Default_ORTA.cpp"

"$(INTDIR)\Default_ORTA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Default_ORTA.obj" $(SOURCE)

!IF  "$(CFG)" == "Win64 Debug"
!ELSEIF  "$(CFG)" == "Win64 Release"
!ELSEIF  "$(CFG)" == "Win64 Static Debug"
!ELSEIF  "$(CFG)" == "Win64 Static Release"
!ENDIF

SOURCE="TAO_ObjRefTemplate.rc"

"$(INTDIR)\TAO_ObjRefTemplate.res" : $(SOURCE)
	$(RSC) /l 0x409 /fo"$(INTDIR)\TAO_ObjRefTemplate.res" /d NDEBUG /d WIN64 /d _CRT_SECURE_NO_WARNINGS /d _CRT_SECURE_NO_DEPRECATE /d _CRT_NONSTDC_NO_DEPRECATE /i "..\..\.." /i "..\.." $(SOURCE)



!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.ObjRefTemplate.dep")
	@echo Using "Makefile.ObjRefTemplate.dep"
!ELSE
	@echo Warning: cannot find "Makefile.ObjRefTemplate.dep"
!ENDIF
!ENDIF

