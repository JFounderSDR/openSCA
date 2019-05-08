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
!MESSAGE NMAKE /f "Makefile.DsNotifyLogAdmin.mak" CFG="Win64 Debug"
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
INTDIR=Debug\DsNotifyLogAdmin\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_DsNotifyLogAdmind.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -DTAO_NOTIFYLOG_BUILD_DLL -f "Makefile.DsNotifyLogAdmin.dep" "DsNotifyLogAdminC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_DsNotifyLogAdmind.pdb"
	-@del /f/q "..\..\..\lib\TAO_DsNotifyLogAdmind.dll"
	-@del /f/q "$(OUTDIR)\TAO_DsNotifyLogAdmind.lib"
	-@del /f/q "$(OUTDIR)\TAO_DsNotifyLogAdmind.exp"
	-@del /f/q "$(OUTDIR)\TAO_DsNotifyLogAdmind.ilk"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\DsNotifyLogAdmin\$(NULL)" mkdir "Debug\DsNotifyLogAdmin"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D TAO_NOTIFYLOG_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_DsLogAdmind.lib TAO_CosEventd.lib TAO_DsEventLogAdmind.lib TAO_CosNotificationd.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\..\lib\TAO_DsNotifyLogAdmind.pdb" /machine:IA64 /out:"..\..\..\lib\TAO_DsNotifyLogAdmind.dll" /implib:"$(OUTDIR)\TAO_DsNotifyLogAdmind.lib"
LINK32_OBJS= \
	"$(INTDIR)\DsNotifyLogAdmin.res" \
	"$(INTDIR)\DsNotifyLogAdminC.obj"

"..\..\..\lib\TAO_DsNotifyLogAdmind.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_DsNotifyLogAdmind.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_DsNotifyLogAdmind.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\DsNotifyLogAdmin\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_DsNotifyLogAdmin.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -DTAO_NOTIFYLOG_BUILD_DLL -f "Makefile.DsNotifyLogAdmin.dep" "DsNotifyLogAdminC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\TAO_DsNotifyLogAdmin.dll"
	-@del /f/q "$(OUTDIR)\TAO_DsNotifyLogAdmin.lib"
	-@del /f/q "$(OUTDIR)\TAO_DsNotifyLogAdmin.exp"
	-@del /f/q "$(OUTDIR)\TAO_DsNotifyLogAdmin.ilk"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\DsNotifyLogAdmin\$(NULL)" mkdir "Release\DsNotifyLogAdmin"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D TAO_NOTIFYLOG_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_DsLogAdmin.lib TAO_CosEvent.lib TAO_DsEventLogAdmin.lib TAO_CosNotification.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\..\lib\TAO_DsNotifyLogAdmin.dll" /implib:"$(OUTDIR)\TAO_DsNotifyLogAdmin.lib"
LINK32_OBJS= \
	"$(INTDIR)\DsNotifyLogAdmin.res" \
	"$(INTDIR)\DsNotifyLogAdminC.obj"

"..\..\..\lib\TAO_DsNotifyLogAdmin.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_DsNotifyLogAdmin.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_DsNotifyLogAdmin.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\DsNotifyLogAdmin\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_DsNotifyLogAdminsd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.DsNotifyLogAdmin.dep" "DsNotifyLogAdminC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_DsNotifyLogAdminsd.lib"
	-@del /f/q "$(OUTDIR)\TAO_DsNotifyLogAdminsd.exp"
	-@del /f/q "$(OUTDIR)\TAO_DsNotifyLogAdminsd.ilk"
	-@del /f/q "..\..\..\lib\TAO_DsNotifyLogAdminsd.pdb"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\DsNotifyLogAdmin\$(NULL)" mkdir "Static_Debug\DsNotifyLogAdmin"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\TAO_DsNotifyLogAdminsd.pdb" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_DsNotifyLogAdminsd.lib"
LINK32_OBJS= \
	"$(INTDIR)\DsNotifyLogAdminC.obj"

"$(OUTDIR)\TAO_DsNotifyLogAdminsd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_DsNotifyLogAdminsd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_DsNotifyLogAdminsd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\DsNotifyLogAdmin\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_DsNotifyLogAdmins.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.DsNotifyLogAdmin.dep" "DsNotifyLogAdminC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_DsNotifyLogAdmins.lib"
	-@del /f/q "$(OUTDIR)\TAO_DsNotifyLogAdmins.exp"
	-@del /f/q "$(OUTDIR)\TAO_DsNotifyLogAdmins.ilk"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\DsNotifyLogAdmin\$(NULL)" mkdir "Static_Release\DsNotifyLogAdmin"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_DsNotifyLogAdmins.lib"
LINK32_OBJS= \
	"$(INTDIR)\DsNotifyLogAdminC.obj"

"$(OUTDIR)\TAO_DsNotifyLogAdmins.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_DsNotifyLogAdmins.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_DsNotifyLogAdmins.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.DsNotifyLogAdmin.dep")
!INCLUDE "Makefile.DsNotifyLogAdmin.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="DsNotifyLogAdminC.cpp"

"$(INTDIR)\DsNotifyLogAdminC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\DsNotifyLogAdminC.obj" $(SOURCE)

!IF  "$(CFG)" == "Win64 Debug"
!ELSEIF  "$(CFG)" == "Win64 Release"
!ELSEIF  "$(CFG)" == "Win64 Static Debug"
!ELSEIF  "$(CFG)" == "Win64 Static Release"
!ENDIF

SOURCE="DsNotifyLogAdmin.rc"

"$(INTDIR)\DsNotifyLogAdmin.res" : $(SOURCE)
	$(RSC) /l 0x409 /fo"$(INTDIR)\DsNotifyLogAdmin.res" /d NDEBUG /d WIN64 /d _CRT_SECURE_NO_WARNINGS /d _CRT_SECURE_NO_DEPRECATE /d _CRT_NONSTDC_NO_DEPRECATE /d TAO_HAS_TYPED_EVENT_CHANNEL /i "..\..\.." /i "..\.." /i "..\..\orbsvcs" $(SOURCE)



!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.DsNotifyLogAdmin.dep")
	@echo Using "Makefile.DsNotifyLogAdmin.dep"
!ELSE
	@echo Warning: cannot find "Makefile.DsNotifyLogAdmin.dep"
!ENDIF
!ENDIF

