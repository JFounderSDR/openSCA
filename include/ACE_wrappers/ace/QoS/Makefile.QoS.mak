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
!MESSAGE NMAKE /f "Makefile.QoS.mak" CFG="Win64 Debug"
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

OUTDIR=..\..\lib
INTDIR=Debug\QoS\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\lib\ACE_QoSd.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\.." -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_HAS_QOS -DACE_HAS_WINSOCK2_GQOS -DACE_QoS_BUILD_DLL -f "Makefile.QoS.dep" "QoS_Manager.cpp" "QoS_Decorator.cpp" "QoS_Session_Impl.cpp" "SOCK_Dgram_Mcast_QoS.cpp" "QoS_Session_Factory.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\ACE_QoSd.pdb"
	-@del /f/q "..\..\lib\ACE_QoSd.dll"
	-@del /f/q "$(OUTDIR)\ACE_QoSd.lib"
	-@del /f/q "$(OUTDIR)\ACE_QoSd.exp"
	-@del /f/q "$(OUTDIR)\ACE_QoSd.ilk"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\QoS\$(NULL)" mkdir "Debug\QoS"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /Fd"$(INTDIR)/" /I "..\.." /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_HAS_QOS /D ACE_HAS_WINSOCK2_GQOS /D ACE_QoS_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib /libpath:"." /libpath:"..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\lib\ACE_QoSd.pdb" /machine:IA64 /out:"..\..\lib\ACE_QoSd.dll" /implib:"$(OUTDIR)\ACE_QoSd.lib"
LINK32_OBJS= \
	"$(INTDIR)\QoS_Manager.obj" \
	"$(INTDIR)\QoS_Decorator.obj" \
	"$(INTDIR)\QoS_Session_Impl.obj" \
	"$(INTDIR)\SOCK_Dgram_Mcast_QoS.obj" \
	"$(INTDIR)\QoS_Session_Factory.obj"

"..\..\lib\ACE_QoSd.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\lib\ACE_QoSd.dll.manifest" mt.exe -manifest "..\..\lib\ACE_QoSd.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\lib
INTDIR=Release\QoS\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\lib\ACE_QoS.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\.." -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_HAS_QOS -DACE_HAS_WINSOCK2_GQOS -DACE_QoS_BUILD_DLL -f "Makefile.QoS.dep" "QoS_Manager.cpp" "QoS_Decorator.cpp" "QoS_Session_Impl.cpp" "SOCK_Dgram_Mcast_QoS.cpp" "QoS_Session_Factory.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\lib\ACE_QoS.dll"
	-@del /f/q "$(OUTDIR)\ACE_QoS.lib"
	-@del /f/q "$(OUTDIR)\ACE_QoS.exp"
	-@del /f/q "$(OUTDIR)\ACE_QoS.ilk"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\QoS\$(NULL)" mkdir "Release\QoS"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /I "..\.." /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_HAS_QOS /D ACE_HAS_WINSOCK2_GQOS /D ACE_QoS_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib /libpath:"." /libpath:"..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\lib\ACE_QoS.dll" /implib:"$(OUTDIR)\ACE_QoS.lib"
LINK32_OBJS= \
	"$(INTDIR)\QoS_Manager.obj" \
	"$(INTDIR)\QoS_Decorator.obj" \
	"$(INTDIR)\QoS_Session_Impl.obj" \
	"$(INTDIR)\SOCK_Dgram_Mcast_QoS.obj" \
	"$(INTDIR)\QoS_Session_Factory.obj"

"..\..\lib\ACE_QoS.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\lib\ACE_QoS.dll.manifest" mt.exe -manifest "..\..\lib\ACE_QoS.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\lib
INTDIR=Static_Debug\QoS\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\ACE_QoSsd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\.." -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_HAS_QOS -DACE_HAS_WINSOCK2_GQOS -DACE_AS_STATIC_LIBS -f "Makefile.QoS.dep" "QoS_Manager.cpp" "QoS_Decorator.cpp" "QoS_Session_Impl.cpp" "SOCK_Dgram_Mcast_QoS.cpp" "QoS_Session_Factory.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\ACE_QoSsd.lib"
	-@del /f/q "$(OUTDIR)\ACE_QoSsd.exp"
	-@del /f/q "$(OUTDIR)\ACE_QoSsd.ilk"
	-@del /f/q "..\..\lib\ACE_QoSsd.pdb"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\QoS\$(NULL)" mkdir "Static_Debug\QoS"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /Fd"..\..\lib\ACE_QoSsd.pdb" /I "..\.." /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_HAS_QOS /D ACE_HAS_WINSOCK2_GQOS /D ACE_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\lib\ACE_QoSsd.lib"
LINK32_OBJS= \
	"$(INTDIR)\QoS_Manager.obj" \
	"$(INTDIR)\QoS_Decorator.obj" \
	"$(INTDIR)\QoS_Session_Impl.obj" \
	"$(INTDIR)\SOCK_Dgram_Mcast_QoS.obj" \
	"$(INTDIR)\QoS_Session_Factory.obj"

"$(OUTDIR)\ACE_QoSsd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\ACE_QoSsd.lib.manifest" mt.exe -manifest "$(OUTDIR)\ACE_QoSsd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\lib
INTDIR=Static_Release\QoS\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\ACE_QoSs.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\.." -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_HAS_QOS -DACE_HAS_WINSOCK2_GQOS -DACE_AS_STATIC_LIBS -f "Makefile.QoS.dep" "QoS_Manager.cpp" "QoS_Decorator.cpp" "QoS_Session_Impl.cpp" "SOCK_Dgram_Mcast_QoS.cpp" "QoS_Session_Factory.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\ACE_QoSs.lib"
	-@del /f/q "$(OUTDIR)\ACE_QoSs.exp"
	-@del /f/q "$(OUTDIR)\ACE_QoSs.ilk"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\QoS\$(NULL)" mkdir "Static_Release\QoS"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /I "..\.." /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_HAS_QOS /D ACE_HAS_WINSOCK2_GQOS /D ACE_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\lib\ACE_QoSs.lib"
LINK32_OBJS= \
	"$(INTDIR)\QoS_Manager.obj" \
	"$(INTDIR)\QoS_Decorator.obj" \
	"$(INTDIR)\QoS_Session_Impl.obj" \
	"$(INTDIR)\SOCK_Dgram_Mcast_QoS.obj" \
	"$(INTDIR)\QoS_Session_Factory.obj"

"$(OUTDIR)\ACE_QoSs.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\ACE_QoSs.lib.manifest" mt.exe -manifest "$(OUTDIR)\ACE_QoSs.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.QoS.dep")
!INCLUDE "Makefile.QoS.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="QoS_Manager.cpp"

"$(INTDIR)\QoS_Manager.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\QoS_Manager.obj" $(SOURCE)

SOURCE="QoS_Decorator.cpp"

"$(INTDIR)\QoS_Decorator.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\QoS_Decorator.obj" $(SOURCE)

SOURCE="QoS_Session_Impl.cpp"

"$(INTDIR)\QoS_Session_Impl.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\QoS_Session_Impl.obj" $(SOURCE)

SOURCE="SOCK_Dgram_Mcast_QoS.cpp"

"$(INTDIR)\SOCK_Dgram_Mcast_QoS.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\SOCK_Dgram_Mcast_QoS.obj" $(SOURCE)

SOURCE="QoS_Session_Factory.cpp"

"$(INTDIR)\QoS_Session_Factory.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\QoS_Session_Factory.obj" $(SOURCE)

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
!IF EXISTS("Makefile.QoS.dep")
	@echo Using "Makefile.QoS.dep"
!ELSE
	@echo Warning: cannot find "Makefile.QoS.dep"
!ENDIF
!ENDIF

