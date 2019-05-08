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
!MESSAGE NMAKE /f "Makefile.CosConcurrency_Serv.mak" CFG="Win64 Debug"
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
INTDIR=Debug\CosConcurrency_Serv\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_CosConcurrency_Servd.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_CONCURRENCY_SERV_BUILD_DLL -f "Makefile.CosConcurrency_Serv.dep" "Concurrency\Concurrency_Utils.cpp" "Concurrency\CC_Lock.cpp" "Concurrency\CC_LockSetFactory.cpp" "Concurrency\Concurrency_Loader.cpp" "Concurrency\CC_LockSet.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_CosConcurrency_Servd.pdb"
	-@del /f/q "..\..\..\lib\TAO_CosConcurrency_Servd.dll"
	-@del /f/q "$(OUTDIR)\TAO_CosConcurrency_Servd.lib"
	-@del /f/q "$(OUTDIR)\TAO_CosConcurrency_Servd.exp"
	-@del /f/q "$(OUTDIR)\TAO_CosConcurrency_Servd.ilk"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\CosConcurrency_Serv\$(NULL)" mkdir "Debug\CosConcurrency_Serv"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_CONCURRENCY_SERV_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_CosConcurrencyd.lib TAO_PortableServerd.lib TAO_CosConcurrency_Skeld.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\..\lib\TAO_CosConcurrency_Servd.pdb" /machine:IA64 /out:"..\..\..\lib\TAO_CosConcurrency_Servd.dll" /implib:"$(OUTDIR)\TAO_CosConcurrency_Servd.lib"
LINK32_OBJS= \
	"$(INTDIR)\Concurrency\Concurrency_Utils.obj" \
	"$(INTDIR)\Concurrency\CC_Lock.obj" \
	"$(INTDIR)\Concurrency\CC_LockSetFactory.obj" \
	"$(INTDIR)\Concurrency\Concurrency_Loader.obj" \
	"$(INTDIR)\Concurrency\CC_LockSet.obj"

"..\..\..\lib\TAO_CosConcurrency_Servd.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_CosConcurrency_Servd.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_CosConcurrency_Servd.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\CosConcurrency_Serv\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_CosConcurrency_Serv.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_CONCURRENCY_SERV_BUILD_DLL -f "Makefile.CosConcurrency_Serv.dep" "Concurrency\Concurrency_Utils.cpp" "Concurrency\CC_Lock.cpp" "Concurrency\CC_LockSetFactory.cpp" "Concurrency\Concurrency_Loader.cpp" "Concurrency\CC_LockSet.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\TAO_CosConcurrency_Serv.dll"
	-@del /f/q "$(OUTDIR)\TAO_CosConcurrency_Serv.lib"
	-@del /f/q "$(OUTDIR)\TAO_CosConcurrency_Serv.exp"
	-@del /f/q "$(OUTDIR)\TAO_CosConcurrency_Serv.ilk"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\CosConcurrency_Serv\$(NULL)" mkdir "Release\CosConcurrency_Serv"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_CONCURRENCY_SERV_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_CosConcurrency.lib TAO_PortableServer.lib TAO_CosConcurrency_Skel.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\..\lib\TAO_CosConcurrency_Serv.dll" /implib:"$(OUTDIR)\TAO_CosConcurrency_Serv.lib"
LINK32_OBJS= \
	"$(INTDIR)\Concurrency\Concurrency_Utils.obj" \
	"$(INTDIR)\Concurrency\CC_Lock.obj" \
	"$(INTDIR)\Concurrency\CC_LockSetFactory.obj" \
	"$(INTDIR)\Concurrency\Concurrency_Loader.obj" \
	"$(INTDIR)\Concurrency\CC_LockSet.obj"

"..\..\..\lib\TAO_CosConcurrency_Serv.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_CosConcurrency_Serv.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_CosConcurrency_Serv.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\CosConcurrency_Serv\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_CosConcurrency_Servsd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.CosConcurrency_Serv.dep" "Concurrency\Concurrency_Utils.cpp" "Concurrency\CC_Lock.cpp" "Concurrency\CC_LockSetFactory.cpp" "Concurrency\Concurrency_Loader.cpp" "Concurrency\CC_LockSet.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_CosConcurrency_Servsd.lib"
	-@del /f/q "$(OUTDIR)\TAO_CosConcurrency_Servsd.exp"
	-@del /f/q "$(OUTDIR)\TAO_CosConcurrency_Servsd.ilk"
	-@del /f/q "..\..\..\lib\TAO_CosConcurrency_Servsd.pdb"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\CosConcurrency_Serv\$(NULL)" mkdir "Static_Debug\CosConcurrency_Serv"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\TAO_CosConcurrency_Servsd.pdb" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_CosConcurrency_Servsd.lib"
LINK32_OBJS= \
	"$(INTDIR)\Concurrency\Concurrency_Utils.obj" \
	"$(INTDIR)\Concurrency\CC_Lock.obj" \
	"$(INTDIR)\Concurrency\CC_LockSetFactory.obj" \
	"$(INTDIR)\Concurrency\Concurrency_Loader.obj" \
	"$(INTDIR)\Concurrency\CC_LockSet.obj"

"$(OUTDIR)\TAO_CosConcurrency_Servsd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_CosConcurrency_Servsd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_CosConcurrency_Servsd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\CosConcurrency_Serv\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_CosConcurrency_Servs.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.CosConcurrency_Serv.dep" "Concurrency\Concurrency_Utils.cpp" "Concurrency\CC_Lock.cpp" "Concurrency\CC_LockSetFactory.cpp" "Concurrency\Concurrency_Loader.cpp" "Concurrency\CC_LockSet.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_CosConcurrency_Servs.lib"
	-@del /f/q "$(OUTDIR)\TAO_CosConcurrency_Servs.exp"
	-@del /f/q "$(OUTDIR)\TAO_CosConcurrency_Servs.ilk"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\CosConcurrency_Serv\$(NULL)" mkdir "Static_Release\CosConcurrency_Serv"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_CosConcurrency_Servs.lib"
LINK32_OBJS= \
	"$(INTDIR)\Concurrency\Concurrency_Utils.obj" \
	"$(INTDIR)\Concurrency\CC_Lock.obj" \
	"$(INTDIR)\Concurrency\CC_LockSetFactory.obj" \
	"$(INTDIR)\Concurrency\Concurrency_Loader.obj" \
	"$(INTDIR)\Concurrency\CC_LockSet.obj"

"$(OUTDIR)\TAO_CosConcurrency_Servs.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_CosConcurrency_Servs.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_CosConcurrency_Servs.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.CosConcurrency_Serv.dep")
!INCLUDE "Makefile.CosConcurrency_Serv.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="Concurrency\Concurrency_Utils.cpp"

"$(INTDIR)\Concurrency\Concurrency_Utils.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Concurrency\$(NULL)" mkdir "$(INTDIR)\Concurrency\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Concurrency\Concurrency_Utils.obj" $(SOURCE)

SOURCE="Concurrency\CC_Lock.cpp"

"$(INTDIR)\Concurrency\CC_Lock.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Concurrency\$(NULL)" mkdir "$(INTDIR)\Concurrency\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Concurrency\CC_Lock.obj" $(SOURCE)

SOURCE="Concurrency\CC_LockSetFactory.cpp"

"$(INTDIR)\Concurrency\CC_LockSetFactory.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Concurrency\$(NULL)" mkdir "$(INTDIR)\Concurrency\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Concurrency\CC_LockSetFactory.obj" $(SOURCE)

SOURCE="Concurrency\Concurrency_Loader.cpp"

"$(INTDIR)\Concurrency\Concurrency_Loader.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Concurrency\$(NULL)" mkdir "$(INTDIR)\Concurrency\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Concurrency\Concurrency_Loader.obj" $(SOURCE)

SOURCE="Concurrency\CC_LockSet.cpp"

"$(INTDIR)\Concurrency\CC_LockSet.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Concurrency\$(NULL)" mkdir "$(INTDIR)\Concurrency\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Concurrency\CC_LockSet.obj" $(SOURCE)

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
!IF EXISTS("Makefile.CosConcurrency_Serv.dep")
	@echo Using "Makefile.CosConcurrency_Serv.dep"
!ELSE
	@echo Warning: cannot find "Makefile.CosConcurrency_Serv.dep"
!ENDIF
!ENDIF

