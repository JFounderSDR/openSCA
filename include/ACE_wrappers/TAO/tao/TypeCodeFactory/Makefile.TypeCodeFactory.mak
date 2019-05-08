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
!MESSAGE NMAKE /f "Makefile.TypeCodeFactory.mak" CFG="Win64 Debug"
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
INTDIR=Debug\TypeCodeFactory\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_TypeCodeFactoryd.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_TYPECODEFACTORY_BUILD_DLL -f "Makefile.TypeCodeFactory.dep" "Recursive_TypeCode.cpp" "TypeCodeFactory_Adapter_Impl.cpp" "TypeCodeFactory_i.cpp" "TypeCodeFactory_Loader.cpp" "TypeCodeFactoryC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_TypeCodeFactoryd.pdb"
	-@del /f/q "..\..\..\lib\TAO_TypeCodeFactoryd.dll"
	-@del /f/q "$(OUTDIR)\TAO_TypeCodeFactoryd.lib"
	-@del /f/q "$(OUTDIR)\TAO_TypeCodeFactoryd.exp"
	-@del /f/q "$(OUTDIR)\TAO_TypeCodeFactoryd.ilk"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\TypeCodeFactory\$(NULL)" mkdir "Debug\TypeCodeFactory"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_TYPECODEFACTORY_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_IFR_Clientd.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\..\lib\TAO_TypeCodeFactoryd.pdb" /machine:IA64 /out:"..\..\..\lib\TAO_TypeCodeFactoryd.dll" /implib:"$(OUTDIR)\TAO_TypeCodeFactoryd.lib"
LINK32_OBJS= \
	"$(INTDIR)\TypeCodeFactory.res" \
	"$(INTDIR)\Recursive_TypeCode.obj" \
	"$(INTDIR)\TypeCodeFactory_Adapter_Impl.obj" \
	"$(INTDIR)\TypeCodeFactory_i.obj" \
	"$(INTDIR)\TypeCodeFactory_Loader.obj" \
	"$(INTDIR)\TypeCodeFactoryC.obj"

"..\..\..\lib\TAO_TypeCodeFactoryd.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_TypeCodeFactoryd.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_TypeCodeFactoryd.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\TypeCodeFactory\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_TypeCodeFactory.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_TYPECODEFACTORY_BUILD_DLL -f "Makefile.TypeCodeFactory.dep" "Recursive_TypeCode.cpp" "TypeCodeFactory_Adapter_Impl.cpp" "TypeCodeFactory_i.cpp" "TypeCodeFactory_Loader.cpp" "TypeCodeFactoryC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\TAO_TypeCodeFactory.dll"
	-@del /f/q "$(OUTDIR)\TAO_TypeCodeFactory.lib"
	-@del /f/q "$(OUTDIR)\TAO_TypeCodeFactory.exp"
	-@del /f/q "$(OUTDIR)\TAO_TypeCodeFactory.ilk"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\TypeCodeFactory\$(NULL)" mkdir "Release\TypeCodeFactory"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_TYPECODEFACTORY_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_IFR_Client.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\..\lib\TAO_TypeCodeFactory.dll" /implib:"$(OUTDIR)\TAO_TypeCodeFactory.lib"
LINK32_OBJS= \
	"$(INTDIR)\TypeCodeFactory.res" \
	"$(INTDIR)\Recursive_TypeCode.obj" \
	"$(INTDIR)\TypeCodeFactory_Adapter_Impl.obj" \
	"$(INTDIR)\TypeCodeFactory_i.obj" \
	"$(INTDIR)\TypeCodeFactory_Loader.obj" \
	"$(INTDIR)\TypeCodeFactoryC.obj"

"..\..\..\lib\TAO_TypeCodeFactory.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_TypeCodeFactory.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_TypeCodeFactory.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\TypeCodeFactory\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_TypeCodeFactorysd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.TypeCodeFactory.dep" "Recursive_TypeCode.cpp" "TypeCodeFactory_Adapter_Impl.cpp" "TypeCodeFactory_i.cpp" "TypeCodeFactory_Loader.cpp" "TypeCodeFactoryC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_TypeCodeFactorysd.lib"
	-@del /f/q "$(OUTDIR)\TAO_TypeCodeFactorysd.exp"
	-@del /f/q "$(OUTDIR)\TAO_TypeCodeFactorysd.ilk"
	-@del /f/q "..\..\..\lib\TAO_TypeCodeFactorysd.pdb"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\TypeCodeFactory\$(NULL)" mkdir "Static_Debug\TypeCodeFactory"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\TAO_TypeCodeFactorysd.pdb" /I "..\..\.." /I "..\.." /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_TypeCodeFactorysd.lib"
LINK32_OBJS= \
	"$(INTDIR)\Recursive_TypeCode.obj" \
	"$(INTDIR)\TypeCodeFactory_Adapter_Impl.obj" \
	"$(INTDIR)\TypeCodeFactory_i.obj" \
	"$(INTDIR)\TypeCodeFactory_Loader.obj" \
	"$(INTDIR)\TypeCodeFactoryC.obj"

"$(OUTDIR)\TAO_TypeCodeFactorysd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_TypeCodeFactorysd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_TypeCodeFactorysd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\TypeCodeFactory\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_TypeCodeFactorys.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.TypeCodeFactory.dep" "Recursive_TypeCode.cpp" "TypeCodeFactory_Adapter_Impl.cpp" "TypeCodeFactory_i.cpp" "TypeCodeFactory_Loader.cpp" "TypeCodeFactoryC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_TypeCodeFactorys.lib"
	-@del /f/q "$(OUTDIR)\TAO_TypeCodeFactorys.exp"
	-@del /f/q "$(OUTDIR)\TAO_TypeCodeFactorys.ilk"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\TypeCodeFactory\$(NULL)" mkdir "Static_Release\TypeCodeFactory"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_TypeCodeFactorys.lib"
LINK32_OBJS= \
	"$(INTDIR)\Recursive_TypeCode.obj" \
	"$(INTDIR)\TypeCodeFactory_Adapter_Impl.obj" \
	"$(INTDIR)\TypeCodeFactory_i.obj" \
	"$(INTDIR)\TypeCodeFactory_Loader.obj" \
	"$(INTDIR)\TypeCodeFactoryC.obj"

"$(OUTDIR)\TAO_TypeCodeFactorys.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_TypeCodeFactorys.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_TypeCodeFactorys.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.TypeCodeFactory.dep")
!INCLUDE "Makefile.TypeCodeFactory.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="Recursive_TypeCode.cpp"

"$(INTDIR)\Recursive_TypeCode.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Recursive_TypeCode.obj" $(SOURCE)

SOURCE="TypeCodeFactory_Adapter_Impl.cpp"

"$(INTDIR)\TypeCodeFactory_Adapter_Impl.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\TypeCodeFactory_Adapter_Impl.obj" $(SOURCE)

SOURCE="TypeCodeFactory_i.cpp"

"$(INTDIR)\TypeCodeFactory_i.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\TypeCodeFactory_i.obj" $(SOURCE)

SOURCE="TypeCodeFactory_Loader.cpp"

"$(INTDIR)\TypeCodeFactory_Loader.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\TypeCodeFactory_Loader.obj" $(SOURCE)

SOURCE="TypeCodeFactoryC.cpp"

"$(INTDIR)\TypeCodeFactoryC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\TypeCodeFactoryC.obj" $(SOURCE)

!IF  "$(CFG)" == "Win64 Debug"
!ELSEIF  "$(CFG)" == "Win64 Release"
!ELSEIF  "$(CFG)" == "Win64 Static Debug"
!ELSEIF  "$(CFG)" == "Win64 Static Release"
!ENDIF

SOURCE="TypeCodeFactory.rc"

"$(INTDIR)\TypeCodeFactory.res" : $(SOURCE)
	$(RSC) /l 0x409 /fo"$(INTDIR)\TypeCodeFactory.res" /d NDEBUG /d WIN64 /d _CRT_SECURE_NO_WARNINGS /d _CRT_SECURE_NO_DEPRECATE /d _CRT_NONSTDC_NO_DEPRECATE /i "..\..\.." /i "..\.." $(SOURCE)



!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.TypeCodeFactory.dep")
	@echo Using "Makefile.TypeCodeFactory.dep"
!ELSE
	@echo Warning: cannot find "Makefile.TypeCodeFactory.dep"
!ENDIF
!ENDIF

