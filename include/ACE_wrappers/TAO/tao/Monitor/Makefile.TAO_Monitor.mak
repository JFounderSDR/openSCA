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
!MESSAGE NMAKE /f "Makefile.TAO_Monitor.mak" CFG="Win64 Debug"
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
INTDIR=Debug\TAO_Monitor\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_Monitord.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_MONITOR_BUILD_DLL -f "Makefile.TAO_Monitor.dep" "Monitor.cpp" "Monitor_Impl.cpp" "Monitor_includeC.cpp" "MonitorC.cpp" "Monitor_TypesC.cpp" "MonitorA.cpp" "MonitorS.cpp" "Monitor_includeA.cpp" "Monitor_TypesA.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_Monitord.pdb"
	-@del /f/q "..\..\..\lib\TAO_Monitord.dll"
	-@del /f/q "$(OUTDIR)\TAO_Monitord.lib"
	-@del /f/q "$(OUTDIR)\TAO_Monitord.exp"
	-@del /f/q "$(OUTDIR)\TAO_Monitord.ilk"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\TAO_Monitor\$(NULL)" mkdir "Debug\TAO_Monitor"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_MONITOR_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_PortableServerd.lib ACE_ETCLd.lib ACE_ETCL_Parserd.lib ACE_Monitor_Controld.lib pdh.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\..\lib\TAO_Monitord.pdb" /machine:IA64 /out:"..\..\..\lib\TAO_Monitord.dll" /implib:"$(OUTDIR)\TAO_Monitord.lib"
LINK32_OBJS= \
	"$(INTDIR)\Monitor.obj" \
	"$(INTDIR)\Monitor_Impl.obj" \
	"$(INTDIR)\Monitor_includeC.obj" \
	"$(INTDIR)\MonitorC.obj" \
	"$(INTDIR)\Monitor_TypesC.obj" \
	"$(INTDIR)\MonitorA.obj" \
	"$(INTDIR)\MonitorS.obj" \
	"$(INTDIR)\Monitor_includeA.obj" \
	"$(INTDIR)\Monitor_TypesA.obj"

"..\..\..\lib\TAO_Monitord.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_Monitord.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_Monitord.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\TAO_Monitor\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_Monitor.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_MONITOR_BUILD_DLL -f "Makefile.TAO_Monitor.dep" "Monitor.cpp" "Monitor_Impl.cpp" "Monitor_includeC.cpp" "MonitorC.cpp" "Monitor_TypesC.cpp" "MonitorA.cpp" "MonitorS.cpp" "Monitor_includeA.cpp" "Monitor_TypesA.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\TAO_Monitor.dll"
	-@del /f/q "$(OUTDIR)\TAO_Monitor.lib"
	-@del /f/q "$(OUTDIR)\TAO_Monitor.exp"
	-@del /f/q "$(OUTDIR)\TAO_Monitor.ilk"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\TAO_Monitor\$(NULL)" mkdir "Release\TAO_Monitor"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_MONITOR_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_PortableServer.lib ACE_ETCL.lib ACE_ETCL_Parser.lib ACE_Monitor_Control.lib pdh.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\..\lib\TAO_Monitor.dll" /implib:"$(OUTDIR)\TAO_Monitor.lib"
LINK32_OBJS= \
	"$(INTDIR)\Monitor.obj" \
	"$(INTDIR)\Monitor_Impl.obj" \
	"$(INTDIR)\Monitor_includeC.obj" \
	"$(INTDIR)\MonitorC.obj" \
	"$(INTDIR)\Monitor_TypesC.obj" \
	"$(INTDIR)\MonitorA.obj" \
	"$(INTDIR)\MonitorS.obj" \
	"$(INTDIR)\Monitor_includeA.obj" \
	"$(INTDIR)\Monitor_TypesA.obj"

"..\..\..\lib\TAO_Monitor.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_Monitor.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_Monitor.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\TAO_Monitor\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_Monitorsd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.TAO_Monitor.dep" "Monitor.cpp" "Monitor_Impl.cpp" "Monitor_includeC.cpp" "MonitorC.cpp" "Monitor_TypesC.cpp" "MonitorA.cpp" "MonitorS.cpp" "Monitor_includeA.cpp" "Monitor_TypesA.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_Monitorsd.lib"
	-@del /f/q "$(OUTDIR)\TAO_Monitorsd.exp"
	-@del /f/q "$(OUTDIR)\TAO_Monitorsd.ilk"
	-@del /f/q "..\..\..\lib\TAO_Monitorsd.pdb"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\TAO_Monitor\$(NULL)" mkdir "Static_Debug\TAO_Monitor"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\TAO_Monitorsd.pdb" /I "..\..\.." /I "..\.." /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_Monitorsd.lib"
LINK32_OBJS= \
	"$(INTDIR)\Monitor.obj" \
	"$(INTDIR)\Monitor_Impl.obj" \
	"$(INTDIR)\Monitor_includeC.obj" \
	"$(INTDIR)\MonitorC.obj" \
	"$(INTDIR)\Monitor_TypesC.obj" \
	"$(INTDIR)\MonitorA.obj" \
	"$(INTDIR)\MonitorS.obj" \
	"$(INTDIR)\Monitor_includeA.obj" \
	"$(INTDIR)\Monitor_TypesA.obj"

"$(OUTDIR)\TAO_Monitorsd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_Monitorsd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_Monitorsd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\TAO_Monitor\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_Monitors.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.TAO_Monitor.dep" "Monitor.cpp" "Monitor_Impl.cpp" "Monitor_includeC.cpp" "MonitorC.cpp" "Monitor_TypesC.cpp" "MonitorA.cpp" "MonitorS.cpp" "Monitor_includeA.cpp" "Monitor_TypesA.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_Monitors.lib"
	-@del /f/q "$(OUTDIR)\TAO_Monitors.exp"
	-@del /f/q "$(OUTDIR)\TAO_Monitors.ilk"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\TAO_Monitor\$(NULL)" mkdir "Static_Release\TAO_Monitor"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_Monitors.lib"
LINK32_OBJS= \
	"$(INTDIR)\Monitor.obj" \
	"$(INTDIR)\Monitor_Impl.obj" \
	"$(INTDIR)\Monitor_includeC.obj" \
	"$(INTDIR)\MonitorC.obj" \
	"$(INTDIR)\Monitor_TypesC.obj" \
	"$(INTDIR)\MonitorA.obj" \
	"$(INTDIR)\MonitorS.obj" \
	"$(INTDIR)\Monitor_includeA.obj" \
	"$(INTDIR)\Monitor_TypesA.obj"

"$(OUTDIR)\TAO_Monitors.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_Monitors.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_Monitors.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.TAO_Monitor.dep")
!INCLUDE "Makefile.TAO_Monitor.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="Monitor.cpp"

"$(INTDIR)\Monitor.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Monitor.obj" $(SOURCE)

SOURCE="Monitor_Impl.cpp"

"$(INTDIR)\Monitor_Impl.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Monitor_Impl.obj" $(SOURCE)

SOURCE="Monitor_includeC.cpp"

"$(INTDIR)\Monitor_includeC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Monitor_includeC.obj" $(SOURCE)

SOURCE="MonitorC.cpp"

"$(INTDIR)\MonitorC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\MonitorC.obj" $(SOURCE)

SOURCE="Monitor_TypesC.cpp"

"$(INTDIR)\Monitor_TypesC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Monitor_TypesC.obj" $(SOURCE)

SOURCE="MonitorA.cpp"

"$(INTDIR)\MonitorA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\MonitorA.obj" $(SOURCE)

SOURCE="MonitorS.cpp"

"$(INTDIR)\MonitorS.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\MonitorS.obj" $(SOURCE)

SOURCE="Monitor_includeA.cpp"

"$(INTDIR)\Monitor_includeA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Monitor_includeA.obj" $(SOURCE)

SOURCE="Monitor_TypesA.cpp"

"$(INTDIR)\Monitor_TypesA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Monitor_TypesA.obj" $(SOURCE)

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
!IF EXISTS("Makefile.TAO_Monitor.dep")
	@echo Using "Makefile.TAO_Monitor.dep"
!ELSE
	@echo Warning: cannot find "Makefile.TAO_Monitor.dep"
!ENDIF
!ENDIF

