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
!MESSAGE NMAKE /f "Makefile.CosNaming_Serv.mak" CFG="Win64 Debug"
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
INTDIR=Debug\CosNaming_Serv\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_CosNaming_Servd.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_NAMING_SERV_BUILD_DLL -f "Makefile.CosNaming_Serv.dep" "Naming\Flat_File_Persistence.cpp" "Naming\Persistent_Context_Index.cpp" "Naming\Persistent_Entries.cpp" "Naming\Persistent_Naming_Context.cpp" "Naming\Storable.cpp" "Naming\Storable_Naming_Context.cpp" "Naming\Storable_Naming_Context_Activator.cpp" "Naming\Entries.cpp" "Naming\Hash_Naming_Context.cpp" "Naming\Naming_Context_Interface.cpp" "Naming\Naming_Loader.cpp" "Naming\Naming_Server.cpp" "Naming\Transient_Naming_Context.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_CosNaming_Servd.pdb"
	-@del /f/q "..\..\..\lib\TAO_CosNaming_Servd.dll"
	-@del /f/q "$(OUTDIR)\TAO_CosNaming_Servd.lib"
	-@del /f/q "$(OUTDIR)\TAO_CosNaming_Servd.exp"
	-@del /f/q "$(OUTDIR)\TAO_CosNaming_Servd.ilk"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\CosNaming_Serv\$(NULL)" mkdir "Debug\CosNaming_Serv"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_NAMING_SERV_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_CosNamingd.lib TAO_PortableServerd.lib TAO_CosNaming_Skeld.lib TAO_Valuetyped.lib TAO_CodecFactoryd.lib TAO_PId.lib TAO_Messagingd.lib TAO_Svc_Utilsd.lib TAO_IORTabled.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\..\lib\TAO_CosNaming_Servd.pdb" /machine:IA64 /out:"..\..\..\lib\TAO_CosNaming_Servd.dll" /implib:"$(OUTDIR)\TAO_CosNaming_Servd.lib"
LINK32_OBJS= \
	"$(INTDIR)\CosNaming_Serv.res" \
	"$(INTDIR)\Naming\Flat_File_Persistence.obj" \
	"$(INTDIR)\Naming\Persistent_Context_Index.obj" \
	"$(INTDIR)\Naming\Persistent_Entries.obj" \
	"$(INTDIR)\Naming\Persistent_Naming_Context.obj" \
	"$(INTDIR)\Naming\Storable.obj" \
	"$(INTDIR)\Naming\Storable_Naming_Context.obj" \
	"$(INTDIR)\Naming\Storable_Naming_Context_Activator.obj" \
	"$(INTDIR)\Naming\Entries.obj" \
	"$(INTDIR)\Naming\Hash_Naming_Context.obj" \
	"$(INTDIR)\Naming\Naming_Context_Interface.obj" \
	"$(INTDIR)\Naming\Naming_Loader.obj" \
	"$(INTDIR)\Naming\Naming_Server.obj" \
	"$(INTDIR)\Naming\Transient_Naming_Context.obj"

"..\..\..\lib\TAO_CosNaming_Servd.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_CosNaming_Servd.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_CosNaming_Servd.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\CosNaming_Serv\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_CosNaming_Serv.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_NAMING_SERV_BUILD_DLL -f "Makefile.CosNaming_Serv.dep" "Naming\Flat_File_Persistence.cpp" "Naming\Persistent_Context_Index.cpp" "Naming\Persistent_Entries.cpp" "Naming\Persistent_Naming_Context.cpp" "Naming\Storable.cpp" "Naming\Storable_Naming_Context.cpp" "Naming\Storable_Naming_Context_Activator.cpp" "Naming\Entries.cpp" "Naming\Hash_Naming_Context.cpp" "Naming\Naming_Context_Interface.cpp" "Naming\Naming_Loader.cpp" "Naming\Naming_Server.cpp" "Naming\Transient_Naming_Context.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\TAO_CosNaming_Serv.dll"
	-@del /f/q "$(OUTDIR)\TAO_CosNaming_Serv.lib"
	-@del /f/q "$(OUTDIR)\TAO_CosNaming_Serv.exp"
	-@del /f/q "$(OUTDIR)\TAO_CosNaming_Serv.ilk"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\CosNaming_Serv\$(NULL)" mkdir "Release\CosNaming_Serv"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_NAMING_SERV_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_CosNaming.lib TAO_PortableServer.lib TAO_CosNaming_Skel.lib TAO_Valuetype.lib TAO_CodecFactory.lib TAO_PI.lib TAO_Messaging.lib TAO_Svc_Utils.lib TAO_IORTable.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\..\lib\TAO_CosNaming_Serv.dll" /implib:"$(OUTDIR)\TAO_CosNaming_Serv.lib"
LINK32_OBJS= \
	"$(INTDIR)\CosNaming_Serv.res" \
	"$(INTDIR)\Naming\Flat_File_Persistence.obj" \
	"$(INTDIR)\Naming\Persistent_Context_Index.obj" \
	"$(INTDIR)\Naming\Persistent_Entries.obj" \
	"$(INTDIR)\Naming\Persistent_Naming_Context.obj" \
	"$(INTDIR)\Naming\Storable.obj" \
	"$(INTDIR)\Naming\Storable_Naming_Context.obj" \
	"$(INTDIR)\Naming\Storable_Naming_Context_Activator.obj" \
	"$(INTDIR)\Naming\Entries.obj" \
	"$(INTDIR)\Naming\Hash_Naming_Context.obj" \
	"$(INTDIR)\Naming\Naming_Context_Interface.obj" \
	"$(INTDIR)\Naming\Naming_Loader.obj" \
	"$(INTDIR)\Naming\Naming_Server.obj" \
	"$(INTDIR)\Naming\Transient_Naming_Context.obj"

"..\..\..\lib\TAO_CosNaming_Serv.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_CosNaming_Serv.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_CosNaming_Serv.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\CosNaming_Serv\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_CosNaming_Servsd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.CosNaming_Serv.dep" "Naming\Flat_File_Persistence.cpp" "Naming\Persistent_Context_Index.cpp" "Naming\Persistent_Entries.cpp" "Naming\Persistent_Naming_Context.cpp" "Naming\Storable.cpp" "Naming\Storable_Naming_Context.cpp" "Naming\Storable_Naming_Context_Activator.cpp" "Naming\Entries.cpp" "Naming\Hash_Naming_Context.cpp" "Naming\Naming_Context_Interface.cpp" "Naming\Naming_Loader.cpp" "Naming\Naming_Server.cpp" "Naming\Transient_Naming_Context.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_CosNaming_Servsd.lib"
	-@del /f/q "$(OUTDIR)\TAO_CosNaming_Servsd.exp"
	-@del /f/q "$(OUTDIR)\TAO_CosNaming_Servsd.ilk"
	-@del /f/q "..\..\..\lib\TAO_CosNaming_Servsd.pdb"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\CosNaming_Serv\$(NULL)" mkdir "Static_Debug\CosNaming_Serv"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\TAO_CosNaming_Servsd.pdb" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_CosNaming_Servsd.lib"
LINK32_OBJS= \
	"$(INTDIR)\Naming\Flat_File_Persistence.obj" \
	"$(INTDIR)\Naming\Persistent_Context_Index.obj" \
	"$(INTDIR)\Naming\Persistent_Entries.obj" \
	"$(INTDIR)\Naming\Persistent_Naming_Context.obj" \
	"$(INTDIR)\Naming\Storable.obj" \
	"$(INTDIR)\Naming\Storable_Naming_Context.obj" \
	"$(INTDIR)\Naming\Storable_Naming_Context_Activator.obj" \
	"$(INTDIR)\Naming\Entries.obj" \
	"$(INTDIR)\Naming\Hash_Naming_Context.obj" \
	"$(INTDIR)\Naming\Naming_Context_Interface.obj" \
	"$(INTDIR)\Naming\Naming_Loader.obj" \
	"$(INTDIR)\Naming\Naming_Server.obj" \
	"$(INTDIR)\Naming\Transient_Naming_Context.obj"

"$(OUTDIR)\TAO_CosNaming_Servsd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_CosNaming_Servsd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_CosNaming_Servsd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\CosNaming_Serv\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_CosNaming_Servs.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.CosNaming_Serv.dep" "Naming\Flat_File_Persistence.cpp" "Naming\Persistent_Context_Index.cpp" "Naming\Persistent_Entries.cpp" "Naming\Persistent_Naming_Context.cpp" "Naming\Storable.cpp" "Naming\Storable_Naming_Context.cpp" "Naming\Storable_Naming_Context_Activator.cpp" "Naming\Entries.cpp" "Naming\Hash_Naming_Context.cpp" "Naming\Naming_Context_Interface.cpp" "Naming\Naming_Loader.cpp" "Naming\Naming_Server.cpp" "Naming\Transient_Naming_Context.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_CosNaming_Servs.lib"
	-@del /f/q "$(OUTDIR)\TAO_CosNaming_Servs.exp"
	-@del /f/q "$(OUTDIR)\TAO_CosNaming_Servs.ilk"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\CosNaming_Serv\$(NULL)" mkdir "Static_Release\CosNaming_Serv"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_CosNaming_Servs.lib"
LINK32_OBJS= \
	"$(INTDIR)\Naming\Flat_File_Persistence.obj" \
	"$(INTDIR)\Naming\Persistent_Context_Index.obj" \
	"$(INTDIR)\Naming\Persistent_Entries.obj" \
	"$(INTDIR)\Naming\Persistent_Naming_Context.obj" \
	"$(INTDIR)\Naming\Storable.obj" \
	"$(INTDIR)\Naming\Storable_Naming_Context.obj" \
	"$(INTDIR)\Naming\Storable_Naming_Context_Activator.obj" \
	"$(INTDIR)\Naming\Entries.obj" \
	"$(INTDIR)\Naming\Hash_Naming_Context.obj" \
	"$(INTDIR)\Naming\Naming_Context_Interface.obj" \
	"$(INTDIR)\Naming\Naming_Loader.obj" \
	"$(INTDIR)\Naming\Naming_Server.obj" \
	"$(INTDIR)\Naming\Transient_Naming_Context.obj"

"$(OUTDIR)\TAO_CosNaming_Servs.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_CosNaming_Servs.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_CosNaming_Servs.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.CosNaming_Serv.dep")
!INCLUDE "Makefile.CosNaming_Serv.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="Naming\Flat_File_Persistence.cpp"

"$(INTDIR)\Naming\Flat_File_Persistence.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Naming\$(NULL)" mkdir "$(INTDIR)\Naming\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Naming\Flat_File_Persistence.obj" $(SOURCE)

SOURCE="Naming\Persistent_Context_Index.cpp"

"$(INTDIR)\Naming\Persistent_Context_Index.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Naming\$(NULL)" mkdir "$(INTDIR)\Naming\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Naming\Persistent_Context_Index.obj" $(SOURCE)

SOURCE="Naming\Persistent_Entries.cpp"

"$(INTDIR)\Naming\Persistent_Entries.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Naming\$(NULL)" mkdir "$(INTDIR)\Naming\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Naming\Persistent_Entries.obj" $(SOURCE)

SOURCE="Naming\Persistent_Naming_Context.cpp"

"$(INTDIR)\Naming\Persistent_Naming_Context.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Naming\$(NULL)" mkdir "$(INTDIR)\Naming\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Naming\Persistent_Naming_Context.obj" $(SOURCE)

SOURCE="Naming\Storable.cpp"

"$(INTDIR)\Naming\Storable.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Naming\$(NULL)" mkdir "$(INTDIR)\Naming\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Naming\Storable.obj" $(SOURCE)

SOURCE="Naming\Storable_Naming_Context.cpp"

"$(INTDIR)\Naming\Storable_Naming_Context.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Naming\$(NULL)" mkdir "$(INTDIR)\Naming\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Naming\Storable_Naming_Context.obj" $(SOURCE)

SOURCE="Naming\Storable_Naming_Context_Activator.cpp"

"$(INTDIR)\Naming\Storable_Naming_Context_Activator.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Naming\$(NULL)" mkdir "$(INTDIR)\Naming\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Naming\Storable_Naming_Context_Activator.obj" $(SOURCE)

SOURCE="Naming\Entries.cpp"

"$(INTDIR)\Naming\Entries.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Naming\$(NULL)" mkdir "$(INTDIR)\Naming\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Naming\Entries.obj" $(SOURCE)

SOURCE="Naming\Hash_Naming_Context.cpp"

"$(INTDIR)\Naming\Hash_Naming_Context.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Naming\$(NULL)" mkdir "$(INTDIR)\Naming\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Naming\Hash_Naming_Context.obj" $(SOURCE)

SOURCE="Naming\Naming_Context_Interface.cpp"

"$(INTDIR)\Naming\Naming_Context_Interface.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Naming\$(NULL)" mkdir "$(INTDIR)\Naming\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Naming\Naming_Context_Interface.obj" $(SOURCE)

SOURCE="Naming\Naming_Loader.cpp"

"$(INTDIR)\Naming\Naming_Loader.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Naming\$(NULL)" mkdir "$(INTDIR)\Naming\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Naming\Naming_Loader.obj" $(SOURCE)

SOURCE="Naming\Naming_Server.cpp"

"$(INTDIR)\Naming\Naming_Server.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Naming\$(NULL)" mkdir "$(INTDIR)\Naming\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Naming\Naming_Server.obj" $(SOURCE)

SOURCE="Naming\Transient_Naming_Context.cpp"

"$(INTDIR)\Naming\Transient_Naming_Context.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Naming\$(NULL)" mkdir "$(INTDIR)\Naming\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Naming\Transient_Naming_Context.obj" $(SOURCE)

!IF  "$(CFG)" == "Win64 Debug"
!ELSEIF  "$(CFG)" == "Win64 Release"
!ELSEIF  "$(CFG)" == "Win64 Static Debug"
!ELSEIF  "$(CFG)" == "Win64 Static Release"
!ENDIF

SOURCE="CosNaming_Serv.rc"

"$(INTDIR)\CosNaming_Serv.res" : $(SOURCE)
	$(RSC) /l 0x409 /fo"$(INTDIR)\CosNaming_Serv.res" /d NDEBUG /d WIN64 /d _CRT_SECURE_NO_WARNINGS /d _CRT_SECURE_NO_DEPRECATE /d _CRT_NONSTDC_NO_DEPRECATE /i "..\..\.." /i "..\.." /i "..\..\orbsvcs" $(SOURCE)



!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.CosNaming_Serv.dep")
	@echo Using "Makefile.CosNaming_Serv.dep"
!ELSE
	@echo Warning: cannot find "Makefile.CosNaming_Serv.dep"
!ENDIF
!ENDIF

