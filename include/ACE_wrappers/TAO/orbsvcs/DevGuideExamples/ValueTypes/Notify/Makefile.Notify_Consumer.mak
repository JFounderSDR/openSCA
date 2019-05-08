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
!MESSAGE NMAKE /f "Makefile.Notify_Consumer.mak" CFG="Win64 Debug"
!MESSAGE
!MESSAGE Possible choices for configuration are:
!MESSAGE
!MESSAGE "Win64 Debug" (based on "Win64 (IA64) Console Application")
!MESSAGE "Win64 Release" (based on "Win64 (IA64) Console Application")
!MESSAGE "Win64 Static Debug" (based on "Win64 (IA64) Console Application")
!MESSAGE "Win64 Static Release" (based on "Win64 (IA64) Console Application")
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

GENERATED_DIRTY = "EventC.inl" "EventS.inl" "EventC.h" "EventS.h" "EventC.cpp" "EventS.cpp"

!IF  "$(CFG)" == "Win64 Debug"

OUTDIR=.
INSTALLDIR=.
INTDIR=Debug\Notify_Consumer\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(INSTALLDIR)\consumer.exe"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\..\..\.." -I"..\..\..\.." -I"..\..\..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_CONSOLE -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -f "Makefile.Notify_Consumer.dep" "EventC.cpp" "EventS.cpp" "consumer.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(INSTALLDIR)\consumer.pdb"
	-@del /f/q "$(INSTALLDIR)\consumer.exe"
	-@del /f/q "$(INSTALLDIR)\consumer.ilk"
	-@del /f/q "EventC.inl"
	-@del /f/q "EventS.inl"
	-@del /f/q "EventC.h"
	-@del /f/q "EventS.h"
	-@del /f/q "EventC.cpp"
	-@del /f/q "EventS.cpp"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\Notify_Consumer\$(NULL)" mkdir "Debug\Notify_Consumer"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\..\..\.." /I "..\..\..\.." /I "..\..\..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _CONSOLE /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_PortableServerd.lib TAO_Valuetyped.lib TAO_CosEventd.lib TAO_CosNotificationd.lib TAO_CosEvent_Skeld.lib /libpath:"." /libpath:"..\..\..\..\..\lib" /nologo /subsystem:console /debug /pdb:"$(INSTALLDIR)\consumer.pdb" /machine:IA64 /out:"$(INSTALLDIR)\consumer.exe"
LINK32_OBJS= \
	"$(INTDIR)\EventC.obj" \
	"$(INTDIR)\EventS.obj" \
	"$(INTDIR)\consumer.obj"

"$(INSTALLDIR)\consumer.exe" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(INSTALLDIR)\consumer.exe.manifest" mt.exe -manifest "$(INSTALLDIR)\consumer.exe.manifest" -outputresource:$@;1

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=Release
INSTALLDIR=Release
INTDIR=Release\Notify_Consumer\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(INSTALLDIR)\consumer.exe"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\..\..\.." -I"..\..\..\.." -I"..\..\..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_CONSOLE -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -f "Makefile.Notify_Consumer.dep" "EventC.cpp" "EventS.cpp" "consumer.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(INSTALLDIR)\consumer.exe"
	-@del /f/q "$(INSTALLDIR)\consumer.ilk"
	-@del /f/q "EventC.inl"
	-@del /f/q "EventS.inl"
	-@del /f/q "EventC.h"
	-@del /f/q "EventS.h"
	-@del /f/q "EventC.cpp"
	-@del /f/q "EventS.cpp"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\Notify_Consumer\$(NULL)" mkdir "Release\Notify_Consumer"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\..\..\.." /I "..\..\..\.." /I "..\..\..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _CONSOLE /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_PortableServer.lib TAO_Valuetype.lib TAO_CosEvent.lib TAO_CosNotification.lib TAO_CosEvent_Skel.lib /libpath:"." /libpath:"..\..\..\..\..\lib" /nologo /subsystem:console  /machine:IA64 /out:"$(INSTALLDIR)\consumer.exe"
LINK32_OBJS= \
	"$(INTDIR)\EventC.obj" \
	"$(INTDIR)\EventS.obj" \
	"$(INTDIR)\consumer.obj"

"$(INSTALLDIR)\consumer.exe" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(INSTALLDIR)\consumer.exe.manifest" mt.exe -manifest "$(INSTALLDIR)\consumer.exe.manifest" -outputresource:$@;1

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=Static_Debug
INSTALLDIR=Static_Debug
INTDIR=Static_Debug\Notify_Consumer\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(INSTALLDIR)\consumer.exe"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\..\..\.." -I"..\..\..\.." -I"..\..\..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_CONSOLE -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.Notify_Consumer.dep" "EventC.cpp" "EventS.cpp" "consumer.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(INSTALLDIR)\consumer.pdb"
	-@del /f/q "$(INSTALLDIR)\consumer.exe"
	-@del /f/q "$(INSTALLDIR)\consumer.ilk"
	-@del /f/q "EventC.inl"
	-@del /f/q "EventS.inl"
	-@del /f/q "EventC.h"
	-@del /f/q "EventS.h"
	-@del /f/q "EventC.cpp"
	-@del /f/q "EventS.cpp"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\Notify_Consumer\$(NULL)" mkdir "Static_Debug\Notify_Consumer"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\..\..\.." /I "..\..\..\.." /I "..\..\..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _CONSOLE /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEsd.lib TAOsd.lib TAO_AnyTypeCodesd.lib TAO_PortableServersd.lib TAO_Valuetypesd.lib TAO_CosEventsd.lib TAO_CosNotificationsd.lib TAO_CosEvent_Skelsd.lib /libpath:"." /libpath:"..\..\..\..\..\lib" /nologo /subsystem:console /debug /pdb:"$(INSTALLDIR)\consumer.pdb" /machine:IA64 /out:"$(INSTALLDIR)\consumer.exe"
LINK32_OBJS= \
	"$(INTDIR)\EventC.obj" \
	"$(INTDIR)\EventS.obj" \
	"$(INTDIR)\consumer.obj"

"$(INSTALLDIR)\consumer.exe" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(INSTALLDIR)\consumer.exe.manifest" mt.exe -manifest "$(INSTALLDIR)\consumer.exe.manifest" -outputresource:$@;1

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=Static_Release
INSTALLDIR=Static_Release
INTDIR=Static_Release\Notify_Consumer\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(INSTALLDIR)\consumer.exe"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\..\..\.." -I"..\..\..\.." -I"..\..\..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_CONSOLE -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.Notify_Consumer.dep" "EventC.cpp" "EventS.cpp" "consumer.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(INSTALLDIR)\consumer.exe"
	-@del /f/q "$(INSTALLDIR)\consumer.ilk"
	-@del /f/q "EventC.inl"
	-@del /f/q "EventS.inl"
	-@del /f/q "EventC.h"
	-@del /f/q "EventS.h"
	-@del /f/q "EventC.cpp"
	-@del /f/q "EventS.cpp"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\Notify_Consumer\$(NULL)" mkdir "Static_Release\Notify_Consumer"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\..\..\.." /I "..\..\..\.." /I "..\..\..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _CONSOLE /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEs.lib TAOs.lib TAO_AnyTypeCodes.lib TAO_PortableServers.lib TAO_Valuetypes.lib TAO_CosEvents.lib TAO_CosNotifications.lib TAO_CosEvent_Skels.lib /libpath:"." /libpath:"..\..\..\..\..\lib" /nologo /subsystem:console  /machine:IA64 /out:"$(INSTALLDIR)\consumer.exe"
LINK32_OBJS= \
	"$(INTDIR)\EventC.obj" \
	"$(INTDIR)\EventS.obj" \
	"$(INTDIR)\consumer.obj"

"$(INSTALLDIR)\consumer.exe" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(INSTALLDIR)\consumer.exe.manifest" mt.exe -manifest "$(INSTALLDIR)\consumer.exe.manifest" -outputresource:$@;1

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
!IF EXISTS("Makefile.Notify_Consumer.dep")
!INCLUDE "Makefile.Notify_Consumer.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="EventC.cpp"

"$(INTDIR)\EventC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\EventC.obj" $(SOURCE)

SOURCE="EventS.cpp"

"$(INTDIR)\EventS.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\EventS.obj" $(SOURCE)

SOURCE="consumer.cpp"

"$(INTDIR)\consumer.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\consumer.obj" $(SOURCE)

!IF  "$(CFG)" == "Win64 Debug"
SOURCE="Event.idl"

InputPath=Event.idl

"EventC.inl" "EventS.inl" "EventC.h" "EventS.h" "EventC.cpp" "EventS.cpp" : $(SOURCE)  "..\..\..\..\..\bin\tao_idl.exe" "..\..\..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-Event_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\..\..\lib
	..\..\..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\..\..\.. -I..\..\..\../orbsvcs "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Release"
SOURCE="Event.idl"

InputPath=Event.idl

"EventC.inl" "EventS.inl" "EventC.h" "EventS.h" "EventC.cpp" "EventS.cpp" : $(SOURCE)  "..\..\..\..\..\bin\tao_idl.exe" "..\..\..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-Event_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\..\..\lib
	..\..\..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\..\..\.. -I..\..\..\../orbsvcs "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Debug"
SOURCE="Event.idl"

InputPath=Event.idl

"EventC.inl" "EventS.inl" "EventC.h" "EventS.h" "EventC.cpp" "EventS.cpp" : $(SOURCE)  "..\..\..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-Event_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\..\..\lib
	..\..\..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\..\..\.. -I..\..\..\../orbsvcs "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Release"
SOURCE="Event.idl"

InputPath=Event.idl

"EventC.inl" "EventS.inl" "EventC.h" "EventS.h" "EventC.cpp" "EventS.cpp" : $(SOURCE)  "..\..\..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-Event_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\..\..\lib
	..\..\..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\..\..\.. -I..\..\..\../orbsvcs "$(InputPath)"
<<

!ENDIF


!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.Notify_Consumer.dep")
	@echo Using "Makefile.Notify_Consumer.dep"
!ELSE
	@echo Warning: cannot find "Makefile.Notify_Consumer.dep"
!ENDIF
!ENDIF

