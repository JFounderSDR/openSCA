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
!MESSAGE NMAKE /f "Makefile.CosTime_Serv.mak" CFG="Win64 Debug"
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
INTDIR=Debug\CosTime_Serv\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_CosTime_Servd.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_TIME_SERV_BUILD_DLL -f "Makefile.CosTime_Serv.dep" "Time\TAO_TIO.cpp" "Time\TAO_Time_Service_Clerk.cpp" "Time\TAO_Time_Service_Server.cpp" "Time\TAO_UTO.cpp" "Time\Timer_Helper.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_CosTime_Servd.pdb"
	-@del /f/q "..\..\..\lib\TAO_CosTime_Servd.dll"
	-@del /f/q "$(OUTDIR)\TAO_CosTime_Servd.lib"
	-@del /f/q "$(OUTDIR)\TAO_CosTime_Servd.exp"
	-@del /f/q "$(OUTDIR)\TAO_CosTime_Servd.ilk"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\CosTime_Serv\$(NULL)" mkdir "Debug\CosTime_Serv"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_TIME_SERV_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_CosTimed.lib TAO_PortableServerd.lib TAO_CosTime_Skeld.lib TAO_Svc_Utilsd.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\..\lib\TAO_CosTime_Servd.pdb" /machine:IA64 /out:"..\..\..\lib\TAO_CosTime_Servd.dll" /implib:"$(OUTDIR)\TAO_CosTime_Servd.lib"
LINK32_OBJS= \
	"$(INTDIR)\Time\TAO_TIO.obj" \
	"$(INTDIR)\Time\TAO_Time_Service_Clerk.obj" \
	"$(INTDIR)\Time\TAO_Time_Service_Server.obj" \
	"$(INTDIR)\Time\TAO_UTO.obj" \
	"$(INTDIR)\Time\Timer_Helper.obj"

"..\..\..\lib\TAO_CosTime_Servd.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_CosTime_Servd.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_CosTime_Servd.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\CosTime_Serv\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_CosTime_Serv.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_TIME_SERV_BUILD_DLL -f "Makefile.CosTime_Serv.dep" "Time\TAO_TIO.cpp" "Time\TAO_Time_Service_Clerk.cpp" "Time\TAO_Time_Service_Server.cpp" "Time\TAO_UTO.cpp" "Time\Timer_Helper.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\TAO_CosTime_Serv.dll"
	-@del /f/q "$(OUTDIR)\TAO_CosTime_Serv.lib"
	-@del /f/q "$(OUTDIR)\TAO_CosTime_Serv.exp"
	-@del /f/q "$(OUTDIR)\TAO_CosTime_Serv.ilk"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\CosTime_Serv\$(NULL)" mkdir "Release\CosTime_Serv"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_TIME_SERV_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_CosTime.lib TAO_PortableServer.lib TAO_CosTime_Skel.lib TAO_Svc_Utils.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\..\lib\TAO_CosTime_Serv.dll" /implib:"$(OUTDIR)\TAO_CosTime_Serv.lib"
LINK32_OBJS= \
	"$(INTDIR)\Time\TAO_TIO.obj" \
	"$(INTDIR)\Time\TAO_Time_Service_Clerk.obj" \
	"$(INTDIR)\Time\TAO_Time_Service_Server.obj" \
	"$(INTDIR)\Time\TAO_UTO.obj" \
	"$(INTDIR)\Time\Timer_Helper.obj"

"..\..\..\lib\TAO_CosTime_Serv.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_CosTime_Serv.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_CosTime_Serv.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\CosTime_Serv\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_CosTime_Servsd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.CosTime_Serv.dep" "Time\TAO_TIO.cpp" "Time\TAO_Time_Service_Clerk.cpp" "Time\TAO_Time_Service_Server.cpp" "Time\TAO_UTO.cpp" "Time\Timer_Helper.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_CosTime_Servsd.lib"
	-@del /f/q "$(OUTDIR)\TAO_CosTime_Servsd.exp"
	-@del /f/q "$(OUTDIR)\TAO_CosTime_Servsd.ilk"
	-@del /f/q "..\..\..\lib\TAO_CosTime_Servsd.pdb"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\CosTime_Serv\$(NULL)" mkdir "Static_Debug\CosTime_Serv"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\TAO_CosTime_Servsd.pdb" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_CosTime_Servsd.lib"
LINK32_OBJS= \
	"$(INTDIR)\Time\TAO_TIO.obj" \
	"$(INTDIR)\Time\TAO_Time_Service_Clerk.obj" \
	"$(INTDIR)\Time\TAO_Time_Service_Server.obj" \
	"$(INTDIR)\Time\TAO_UTO.obj" \
	"$(INTDIR)\Time\Timer_Helper.obj"

"$(OUTDIR)\TAO_CosTime_Servsd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_CosTime_Servsd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_CosTime_Servsd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\CosTime_Serv\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_CosTime_Servs.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.CosTime_Serv.dep" "Time\TAO_TIO.cpp" "Time\TAO_Time_Service_Clerk.cpp" "Time\TAO_Time_Service_Server.cpp" "Time\TAO_UTO.cpp" "Time\Timer_Helper.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_CosTime_Servs.lib"
	-@del /f/q "$(OUTDIR)\TAO_CosTime_Servs.exp"
	-@del /f/q "$(OUTDIR)\TAO_CosTime_Servs.ilk"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\CosTime_Serv\$(NULL)" mkdir "Static_Release\CosTime_Serv"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_CosTime_Servs.lib"
LINK32_OBJS= \
	"$(INTDIR)\Time\TAO_TIO.obj" \
	"$(INTDIR)\Time\TAO_Time_Service_Clerk.obj" \
	"$(INTDIR)\Time\TAO_Time_Service_Server.obj" \
	"$(INTDIR)\Time\TAO_UTO.obj" \
	"$(INTDIR)\Time\Timer_Helper.obj"

"$(OUTDIR)\TAO_CosTime_Servs.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_CosTime_Servs.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_CosTime_Servs.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.CosTime_Serv.dep")
!INCLUDE "Makefile.CosTime_Serv.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="Time\TAO_TIO.cpp"

"$(INTDIR)\Time\TAO_TIO.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Time\$(NULL)" mkdir "$(INTDIR)\Time\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Time\TAO_TIO.obj" $(SOURCE)

SOURCE="Time\TAO_Time_Service_Clerk.cpp"

"$(INTDIR)\Time\TAO_Time_Service_Clerk.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Time\$(NULL)" mkdir "$(INTDIR)\Time\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Time\TAO_Time_Service_Clerk.obj" $(SOURCE)

SOURCE="Time\TAO_Time_Service_Server.cpp"

"$(INTDIR)\Time\TAO_Time_Service_Server.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Time\$(NULL)" mkdir "$(INTDIR)\Time\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Time\TAO_Time_Service_Server.obj" $(SOURCE)

SOURCE="Time\TAO_UTO.cpp"

"$(INTDIR)\Time\TAO_UTO.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Time\$(NULL)" mkdir "$(INTDIR)\Time\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Time\TAO_UTO.obj" $(SOURCE)

SOURCE="Time\Timer_Helper.cpp"

"$(INTDIR)\Time\Timer_Helper.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Time\$(NULL)" mkdir "$(INTDIR)\Time\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Time\Timer_Helper.obj" $(SOURCE)

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
!IF EXISTS("Makefile.CosTime_Serv.dep")
	@echo Using "Makefile.CosTime_Serv.dep"
!ELSE
	@echo Warning: cannot find "Makefile.CosTime_Serv.dep"
!ENDIF
!ENDIF

