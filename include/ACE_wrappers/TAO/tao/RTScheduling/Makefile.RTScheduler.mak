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
!MESSAGE NMAKE /f "Makefile.RTScheduler.mak" CFG="Win64 Debug"
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
INTDIR=Debug\RTScheduler\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_RTSchedulerd.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_RTSCHEDULER_BUILD_DLL -f "Makefile.RTScheduler.dep" "Current.cpp" "Distributable_Thread.cpp" "Request_Interceptor.cpp" "RTScheduler.cpp" "RTScheduler_Initializer.cpp" "RTScheduler_Loader.cpp" "RTScheduler_Manager.cpp" "RTSchedulerC.cpp" "RTScheduler_includeC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_RTSchedulerd.pdb"
	-@del /f/q "..\..\..\lib\TAO_RTSchedulerd.dll"
	-@del /f/q "$(OUTDIR)\TAO_RTSchedulerd.lib"
	-@del /f/q "$(OUTDIR)\TAO_RTSchedulerd.exp"
	-@del /f/q "$(OUTDIR)\TAO_RTSchedulerd.ilk"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\RTScheduler\$(NULL)" mkdir "Debug\RTScheduler"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_RTSCHEDULER_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_CodecFactoryd.lib TAO_PId.lib TAO_RTCORBAd.lib TAO_PortableServerd.lib TAO_PI_Serverd.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\..\lib\TAO_RTSchedulerd.pdb" /machine:IA64 /out:"..\..\..\lib\TAO_RTSchedulerd.dll" /implib:"$(OUTDIR)\TAO_RTSchedulerd.lib"
LINK32_OBJS= \
	"$(INTDIR)\TAO_RTScheduler.res" \
	"$(INTDIR)\Current.obj" \
	"$(INTDIR)\Distributable_Thread.obj" \
	"$(INTDIR)\Request_Interceptor.obj" \
	"$(INTDIR)\RTScheduler.obj" \
	"$(INTDIR)\RTScheduler_Initializer.obj" \
	"$(INTDIR)\RTScheduler_Loader.obj" \
	"$(INTDIR)\RTScheduler_Manager.obj" \
	"$(INTDIR)\RTSchedulerC.obj" \
	"$(INTDIR)\RTScheduler_includeC.obj"

"..\..\..\lib\TAO_RTSchedulerd.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_RTSchedulerd.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_RTSchedulerd.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\RTScheduler\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_RTScheduler.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_RTSCHEDULER_BUILD_DLL -f "Makefile.RTScheduler.dep" "Current.cpp" "Distributable_Thread.cpp" "Request_Interceptor.cpp" "RTScheduler.cpp" "RTScheduler_Initializer.cpp" "RTScheduler_Loader.cpp" "RTScheduler_Manager.cpp" "RTSchedulerC.cpp" "RTScheduler_includeC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\TAO_RTScheduler.dll"
	-@del /f/q "$(OUTDIR)\TAO_RTScheduler.lib"
	-@del /f/q "$(OUTDIR)\TAO_RTScheduler.exp"
	-@del /f/q "$(OUTDIR)\TAO_RTScheduler.ilk"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\RTScheduler\$(NULL)" mkdir "Release\RTScheduler"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_RTSCHEDULER_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_CodecFactory.lib TAO_PI.lib TAO_RTCORBA.lib TAO_PortableServer.lib TAO_PI_Server.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\..\lib\TAO_RTScheduler.dll" /implib:"$(OUTDIR)\TAO_RTScheduler.lib"
LINK32_OBJS= \
	"$(INTDIR)\TAO_RTScheduler.res" \
	"$(INTDIR)\Current.obj" \
	"$(INTDIR)\Distributable_Thread.obj" \
	"$(INTDIR)\Request_Interceptor.obj" \
	"$(INTDIR)\RTScheduler.obj" \
	"$(INTDIR)\RTScheduler_Initializer.obj" \
	"$(INTDIR)\RTScheduler_Loader.obj" \
	"$(INTDIR)\RTScheduler_Manager.obj" \
	"$(INTDIR)\RTSchedulerC.obj" \
	"$(INTDIR)\RTScheduler_includeC.obj"

"..\..\..\lib\TAO_RTScheduler.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_RTScheduler.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_RTScheduler.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\RTScheduler\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_RTSchedulersd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.RTScheduler.dep" "Current.cpp" "Distributable_Thread.cpp" "Request_Interceptor.cpp" "RTScheduler.cpp" "RTScheduler_Initializer.cpp" "RTScheduler_Loader.cpp" "RTScheduler_Manager.cpp" "RTSchedulerC.cpp" "RTScheduler_includeC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_RTSchedulersd.lib"
	-@del /f/q "$(OUTDIR)\TAO_RTSchedulersd.exp"
	-@del /f/q "$(OUTDIR)\TAO_RTSchedulersd.ilk"
	-@del /f/q "..\..\..\lib\TAO_RTSchedulersd.pdb"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\RTScheduler\$(NULL)" mkdir "Static_Debug\RTScheduler"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\TAO_RTSchedulersd.pdb" /I "..\..\.." /I "..\.." /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_RTSchedulersd.lib"
LINK32_OBJS= \
	"$(INTDIR)\Current.obj" \
	"$(INTDIR)\Distributable_Thread.obj" \
	"$(INTDIR)\Request_Interceptor.obj" \
	"$(INTDIR)\RTScheduler.obj" \
	"$(INTDIR)\RTScheduler_Initializer.obj" \
	"$(INTDIR)\RTScheduler_Loader.obj" \
	"$(INTDIR)\RTScheduler_Manager.obj" \
	"$(INTDIR)\RTSchedulerC.obj" \
	"$(INTDIR)\RTScheduler_includeC.obj"

"$(OUTDIR)\TAO_RTSchedulersd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_RTSchedulersd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_RTSchedulersd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\RTScheduler\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_RTSchedulers.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.RTScheduler.dep" "Current.cpp" "Distributable_Thread.cpp" "Request_Interceptor.cpp" "RTScheduler.cpp" "RTScheduler_Initializer.cpp" "RTScheduler_Loader.cpp" "RTScheduler_Manager.cpp" "RTSchedulerC.cpp" "RTScheduler_includeC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_RTSchedulers.lib"
	-@del /f/q "$(OUTDIR)\TAO_RTSchedulers.exp"
	-@del /f/q "$(OUTDIR)\TAO_RTSchedulers.ilk"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\RTScheduler\$(NULL)" mkdir "Static_Release\RTScheduler"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_RTSchedulers.lib"
LINK32_OBJS= \
	"$(INTDIR)\Current.obj" \
	"$(INTDIR)\Distributable_Thread.obj" \
	"$(INTDIR)\Request_Interceptor.obj" \
	"$(INTDIR)\RTScheduler.obj" \
	"$(INTDIR)\RTScheduler_Initializer.obj" \
	"$(INTDIR)\RTScheduler_Loader.obj" \
	"$(INTDIR)\RTScheduler_Manager.obj" \
	"$(INTDIR)\RTSchedulerC.obj" \
	"$(INTDIR)\RTScheduler_includeC.obj"

"$(OUTDIR)\TAO_RTSchedulers.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_RTSchedulers.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_RTSchedulers.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.RTScheduler.dep")
!INCLUDE "Makefile.RTScheduler.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="Current.cpp"

"$(INTDIR)\Current.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Current.obj" $(SOURCE)

SOURCE="Distributable_Thread.cpp"

"$(INTDIR)\Distributable_Thread.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Distributable_Thread.obj" $(SOURCE)

SOURCE="Request_Interceptor.cpp"

"$(INTDIR)\Request_Interceptor.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Request_Interceptor.obj" $(SOURCE)

SOURCE="RTScheduler.cpp"

"$(INTDIR)\RTScheduler.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RTScheduler.obj" $(SOURCE)

SOURCE="RTScheduler_Initializer.cpp"

"$(INTDIR)\RTScheduler_Initializer.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RTScheduler_Initializer.obj" $(SOURCE)

SOURCE="RTScheduler_Loader.cpp"

"$(INTDIR)\RTScheduler_Loader.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RTScheduler_Loader.obj" $(SOURCE)

SOURCE="RTScheduler_Manager.cpp"

"$(INTDIR)\RTScheduler_Manager.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RTScheduler_Manager.obj" $(SOURCE)

SOURCE="RTSchedulerC.cpp"

"$(INTDIR)\RTSchedulerC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RTSchedulerC.obj" $(SOURCE)

SOURCE="RTScheduler_includeC.cpp"

"$(INTDIR)\RTScheduler_includeC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\RTScheduler_includeC.obj" $(SOURCE)

!IF  "$(CFG)" == "Win64 Debug"
!ELSEIF  "$(CFG)" == "Win64 Release"
!ELSEIF  "$(CFG)" == "Win64 Static Debug"
!ELSEIF  "$(CFG)" == "Win64 Static Release"
!ENDIF

SOURCE="TAO_RTScheduler.rc"

"$(INTDIR)\TAO_RTScheduler.res" : $(SOURCE)
	$(RSC) /l 0x409 /fo"$(INTDIR)\TAO_RTScheduler.res" /d NDEBUG /d WIN64 /d _CRT_SECURE_NO_WARNINGS /d _CRT_SECURE_NO_DEPRECATE /d _CRT_NONSTDC_NO_DEPRECATE /i "..\..\.." /i "..\.." $(SOURCE)



!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.RTScheduler.dep")
	@echo Using "Makefile.RTScheduler.dep"
!ELSE
	@echo Warning: cannot find "Makefile.RTScheduler.dep"
!ENDIF
!ENDIF

