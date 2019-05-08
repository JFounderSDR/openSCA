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
!MESSAGE NMAKE /f "Makefile.BiDir_GIOP.mak" CFG="Win64 Debug"
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
INTDIR=Debug\BiDir_GIOP\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_BiDirGIOPd.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_BIDIRGIOP_BUILD_DLL -f "Makefile.BiDir_GIOP.dep" "BiDir_ORBInitializer.cpp" "BiDir_Policy_i.cpp" "BiDir_PolicyFactory.cpp" "BiDir_Service_Context_Handler.cpp" "BiDirGIOP.cpp" "BiDirPolicy_Validator.cpp" "BiDirPolicyC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_BiDirGIOPd.pdb"
	-@del /f/q "..\..\..\lib\TAO_BiDirGIOPd.dll"
	-@del /f/q "$(OUTDIR)\TAO_BiDirGIOPd.lib"
	-@del /f/q "$(OUTDIR)\TAO_BiDirGIOPd.exp"
	-@del /f/q "$(OUTDIR)\TAO_BiDirGIOPd.ilk"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\BiDir_GIOP\$(NULL)" mkdir "Debug\BiDir_GIOP"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_BIDIRGIOP_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_CodecFactoryd.lib TAO_PId.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\..\lib\TAO_BiDirGIOPd.pdb" /machine:IA64 /out:"..\..\..\lib\TAO_BiDirGIOPd.dll" /implib:"$(OUTDIR)\TAO_BiDirGIOPd.lib"
LINK32_OBJS= \
	"$(INTDIR)\TAO_BiDir_GIOP.res" \
	"$(INTDIR)\BiDir_ORBInitializer.obj" \
	"$(INTDIR)\BiDir_Policy_i.obj" \
	"$(INTDIR)\BiDir_PolicyFactory.obj" \
	"$(INTDIR)\BiDir_Service_Context_Handler.obj" \
	"$(INTDIR)\BiDirGIOP.obj" \
	"$(INTDIR)\BiDirPolicy_Validator.obj" \
	"$(INTDIR)\BiDirPolicyC.obj"

"..\..\..\lib\TAO_BiDirGIOPd.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_BiDirGIOPd.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_BiDirGIOPd.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\BiDir_GIOP\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_BiDirGIOP.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_BIDIRGIOP_BUILD_DLL -f "Makefile.BiDir_GIOP.dep" "BiDir_ORBInitializer.cpp" "BiDir_Policy_i.cpp" "BiDir_PolicyFactory.cpp" "BiDir_Service_Context_Handler.cpp" "BiDirGIOP.cpp" "BiDirPolicy_Validator.cpp" "BiDirPolicyC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\TAO_BiDirGIOP.dll"
	-@del /f/q "$(OUTDIR)\TAO_BiDirGIOP.lib"
	-@del /f/q "$(OUTDIR)\TAO_BiDirGIOP.exp"
	-@del /f/q "$(OUTDIR)\TAO_BiDirGIOP.ilk"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\BiDir_GIOP\$(NULL)" mkdir "Release\BiDir_GIOP"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_BIDIRGIOP_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_CodecFactory.lib TAO_PI.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\..\lib\TAO_BiDirGIOP.dll" /implib:"$(OUTDIR)\TAO_BiDirGIOP.lib"
LINK32_OBJS= \
	"$(INTDIR)\TAO_BiDir_GIOP.res" \
	"$(INTDIR)\BiDir_ORBInitializer.obj" \
	"$(INTDIR)\BiDir_Policy_i.obj" \
	"$(INTDIR)\BiDir_PolicyFactory.obj" \
	"$(INTDIR)\BiDir_Service_Context_Handler.obj" \
	"$(INTDIR)\BiDirGIOP.obj" \
	"$(INTDIR)\BiDirPolicy_Validator.obj" \
	"$(INTDIR)\BiDirPolicyC.obj"

"..\..\..\lib\TAO_BiDirGIOP.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_BiDirGIOP.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_BiDirGIOP.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\BiDir_GIOP\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_BiDirGIOPsd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.BiDir_GIOP.dep" "BiDir_ORBInitializer.cpp" "BiDir_Policy_i.cpp" "BiDir_PolicyFactory.cpp" "BiDir_Service_Context_Handler.cpp" "BiDirGIOP.cpp" "BiDirPolicy_Validator.cpp" "BiDirPolicyC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_BiDirGIOPsd.lib"
	-@del /f/q "$(OUTDIR)\TAO_BiDirGIOPsd.exp"
	-@del /f/q "$(OUTDIR)\TAO_BiDirGIOPsd.ilk"
	-@del /f/q "..\..\..\lib\TAO_BiDirGIOPsd.pdb"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\BiDir_GIOP\$(NULL)" mkdir "Static_Debug\BiDir_GIOP"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\TAO_BiDirGIOPsd.pdb" /I "..\..\.." /I "..\.." /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_BiDirGIOPsd.lib"
LINK32_OBJS= \
	"$(INTDIR)\BiDir_ORBInitializer.obj" \
	"$(INTDIR)\BiDir_Policy_i.obj" \
	"$(INTDIR)\BiDir_PolicyFactory.obj" \
	"$(INTDIR)\BiDir_Service_Context_Handler.obj" \
	"$(INTDIR)\BiDirGIOP.obj" \
	"$(INTDIR)\BiDirPolicy_Validator.obj" \
	"$(INTDIR)\BiDirPolicyC.obj"

"$(OUTDIR)\TAO_BiDirGIOPsd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_BiDirGIOPsd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_BiDirGIOPsd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\BiDir_GIOP\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_BiDirGIOPs.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.BiDir_GIOP.dep" "BiDir_ORBInitializer.cpp" "BiDir_Policy_i.cpp" "BiDir_PolicyFactory.cpp" "BiDir_Service_Context_Handler.cpp" "BiDirGIOP.cpp" "BiDirPolicy_Validator.cpp" "BiDirPolicyC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_BiDirGIOPs.lib"
	-@del /f/q "$(OUTDIR)\TAO_BiDirGIOPs.exp"
	-@del /f/q "$(OUTDIR)\TAO_BiDirGIOPs.ilk"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\BiDir_GIOP\$(NULL)" mkdir "Static_Release\BiDir_GIOP"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_BiDirGIOPs.lib"
LINK32_OBJS= \
	"$(INTDIR)\BiDir_ORBInitializer.obj" \
	"$(INTDIR)\BiDir_Policy_i.obj" \
	"$(INTDIR)\BiDir_PolicyFactory.obj" \
	"$(INTDIR)\BiDir_Service_Context_Handler.obj" \
	"$(INTDIR)\BiDirGIOP.obj" \
	"$(INTDIR)\BiDirPolicy_Validator.obj" \
	"$(INTDIR)\BiDirPolicyC.obj"

"$(OUTDIR)\TAO_BiDirGIOPs.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_BiDirGIOPs.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_BiDirGIOPs.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.BiDir_GIOP.dep")
!INCLUDE "Makefile.BiDir_GIOP.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="BiDir_ORBInitializer.cpp"

"$(INTDIR)\BiDir_ORBInitializer.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\BiDir_ORBInitializer.obj" $(SOURCE)

SOURCE="BiDir_Policy_i.cpp"

"$(INTDIR)\BiDir_Policy_i.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\BiDir_Policy_i.obj" $(SOURCE)

SOURCE="BiDir_PolicyFactory.cpp"

"$(INTDIR)\BiDir_PolicyFactory.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\BiDir_PolicyFactory.obj" $(SOURCE)

SOURCE="BiDir_Service_Context_Handler.cpp"

"$(INTDIR)\BiDir_Service_Context_Handler.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\BiDir_Service_Context_Handler.obj" $(SOURCE)

SOURCE="BiDirGIOP.cpp"

"$(INTDIR)\BiDirGIOP.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\BiDirGIOP.obj" $(SOURCE)

SOURCE="BiDirPolicy_Validator.cpp"

"$(INTDIR)\BiDirPolicy_Validator.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\BiDirPolicy_Validator.obj" $(SOURCE)

SOURCE="BiDirPolicyC.cpp"

"$(INTDIR)\BiDirPolicyC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\BiDirPolicyC.obj" $(SOURCE)

!IF  "$(CFG)" == "Win64 Debug"
!ELSEIF  "$(CFG)" == "Win64 Release"
!ELSEIF  "$(CFG)" == "Win64 Static Debug"
!ELSEIF  "$(CFG)" == "Win64 Static Release"
!ENDIF

SOURCE="TAO_BiDir_GIOP.rc"

"$(INTDIR)\TAO_BiDir_GIOP.res" : $(SOURCE)
	$(RSC) /l 0x409 /fo"$(INTDIR)\TAO_BiDir_GIOP.res" /d NDEBUG /d WIN64 /d _CRT_SECURE_NO_WARNINGS /d _CRT_SECURE_NO_DEPRECATE /d _CRT_NONSTDC_NO_DEPRECATE /i "..\..\.." /i "..\.." $(SOURCE)



!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.BiDir_GIOP.dep")
	@echo Using "Makefile.BiDir_GIOP.dep"
!ELSE
	@echo Warning: cannot find "Makefile.BiDir_GIOP.dep"
!ENDIF
!ENDIF

