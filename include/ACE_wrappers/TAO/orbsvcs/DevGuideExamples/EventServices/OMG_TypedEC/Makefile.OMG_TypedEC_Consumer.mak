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
!MESSAGE NMAKE /f "Makefile.OMG_TypedEC_Consumer.mak" CFG="Win64 Debug"
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

GENERATED_DIRTY = "MessengerC.inl" "MessengerS.inl" "MessengerC.h" "MessengerS.h" "MessengerC.cpp" "MessengerS.cpp"

!IF  "$(CFG)" == "Win64 Debug"

OUTDIR=.
INSTALLDIR=.
INTDIR=Debug\OMG_TypedEC_Consumer\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(INSTALLDIR)\Consumer.exe"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\..\..\.." -I"..\..\..\.." -I"..\..\..\..\orbsvcs" -I"..\common" -D_DEBUG -DWIN64 -DWIN32 -D_CONSOLE -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -f "Makefile.OMG_TypedEC_Consumer.dep" "MessengerC.cpp" "MessengerS.cpp" "ConsumerMain.cpp" "Consumer_i.cpp" "Messenger_i.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(INSTALLDIR)\Consumer.pdb"
	-@del /f/q "$(INSTALLDIR)\Consumer.exe"
	-@del /f/q "$(INSTALLDIR)\Consumer.ilk"
	-@del /f/q "MessengerC.inl"
	-@del /f/q "MessengerS.inl"
	-@del /f/q "MessengerC.h"
	-@del /f/q "MessengerS.h"
	-@del /f/q "MessengerC.cpp"
	-@del /f/q "MessengerS.cpp"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\OMG_TypedEC_Consumer\$(NULL)" mkdir "Debug\OMG_TypedEC_Consumer"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\..\..\.." /I "..\..\..\.." /I "..\..\..\..\orbsvcs" /I "..\common" /D _DEBUG /D WIN64 /D WIN32 /D _CONSOLE /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_CosNamingd.lib TAO_CosEventd.lib TAO_PortableServerd.lib TAO_CosEvent_Skeld.lib /libpath:"." /libpath:"..\..\..\..\..\lib" /nologo /subsystem:console /debug /pdb:"$(INSTALLDIR)\Consumer.pdb" /machine:IA64 /out:"$(INSTALLDIR)\Consumer.exe"
LINK32_OBJS= \
	"$(INTDIR)\MessengerC.obj" \
	"$(INTDIR)\MessengerS.obj" \
	"$(INTDIR)\ConsumerMain.obj" \
	"$(INTDIR)\Consumer_i.obj" \
	"$(INTDIR)\Messenger_i.obj"

"$(INSTALLDIR)\Consumer.exe" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(INSTALLDIR)\Consumer.exe.manifest" mt.exe -manifest "$(INSTALLDIR)\Consumer.exe.manifest" -outputresource:$@;1

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=Release
INSTALLDIR=Release
INTDIR=Release\OMG_TypedEC_Consumer\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(INSTALLDIR)\Consumer.exe"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\..\..\.." -I"..\..\..\.." -I"..\..\..\..\orbsvcs" -I"..\common" -DNDEBUG -DWIN64 -DWIN32 -D_CONSOLE -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -f "Makefile.OMG_TypedEC_Consumer.dep" "MessengerC.cpp" "MessengerS.cpp" "ConsumerMain.cpp" "Consumer_i.cpp" "Messenger_i.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(INSTALLDIR)\Consumer.exe"
	-@del /f/q "$(INSTALLDIR)\Consumer.ilk"
	-@del /f/q "MessengerC.inl"
	-@del /f/q "MessengerS.inl"
	-@del /f/q "MessengerC.h"
	-@del /f/q "MessengerS.h"
	-@del /f/q "MessengerC.cpp"
	-@del /f/q "MessengerS.cpp"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\OMG_TypedEC_Consumer\$(NULL)" mkdir "Release\OMG_TypedEC_Consumer"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\..\..\.." /I "..\..\..\.." /I "..\..\..\..\orbsvcs" /I "..\common" /D NDEBUG /D WIN64 /D WIN32 /D _CONSOLE /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_CosNaming.lib TAO_CosEvent.lib TAO_PortableServer.lib TAO_CosEvent_Skel.lib /libpath:"." /libpath:"..\..\..\..\..\lib" /nologo /subsystem:console  /machine:IA64 /out:"$(INSTALLDIR)\Consumer.exe"
LINK32_OBJS= \
	"$(INTDIR)\MessengerC.obj" \
	"$(INTDIR)\MessengerS.obj" \
	"$(INTDIR)\ConsumerMain.obj" \
	"$(INTDIR)\Consumer_i.obj" \
	"$(INTDIR)\Messenger_i.obj"

"$(INSTALLDIR)\Consumer.exe" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(INSTALLDIR)\Consumer.exe.manifest" mt.exe -manifest "$(INSTALLDIR)\Consumer.exe.manifest" -outputresource:$@;1

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=Static_Debug
INSTALLDIR=Static_Debug
INTDIR=Static_Debug\OMG_TypedEC_Consumer\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(INSTALLDIR)\Consumer.exe"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\..\..\.." -I"..\..\..\.." -I"..\..\..\..\orbsvcs" -I"..\common" -D_DEBUG -DWIN64 -DWIN32 -D_CONSOLE -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.OMG_TypedEC_Consumer.dep" "MessengerC.cpp" "MessengerS.cpp" "ConsumerMain.cpp" "Consumer_i.cpp" "Messenger_i.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(INSTALLDIR)\Consumer.pdb"
	-@del /f/q "$(INSTALLDIR)\Consumer.exe"
	-@del /f/q "$(INSTALLDIR)\Consumer.ilk"
	-@del /f/q "MessengerC.inl"
	-@del /f/q "MessengerS.inl"
	-@del /f/q "MessengerC.h"
	-@del /f/q "MessengerS.h"
	-@del /f/q "MessengerC.cpp"
	-@del /f/q "MessengerS.cpp"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\OMG_TypedEC_Consumer\$(NULL)" mkdir "Static_Debug\OMG_TypedEC_Consumer"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\..\..\.." /I "..\..\..\.." /I "..\..\..\..\orbsvcs" /I "..\common" /D _DEBUG /D WIN64 /D WIN32 /D _CONSOLE /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEsd.lib TAOsd.lib TAO_AnyTypeCodesd.lib TAO_CosNamingsd.lib TAO_CosEventsd.lib TAO_PortableServersd.lib TAO_CosEvent_Skelsd.lib /libpath:"." /libpath:"..\..\..\..\..\lib" /nologo /subsystem:console /debug /pdb:"$(INSTALLDIR)\Consumer.pdb" /machine:IA64 /out:"$(INSTALLDIR)\Consumer.exe"
LINK32_OBJS= \
	"$(INTDIR)\MessengerC.obj" \
	"$(INTDIR)\MessengerS.obj" \
	"$(INTDIR)\ConsumerMain.obj" \
	"$(INTDIR)\Consumer_i.obj" \
	"$(INTDIR)\Messenger_i.obj"

"$(INSTALLDIR)\Consumer.exe" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(INSTALLDIR)\Consumer.exe.manifest" mt.exe -manifest "$(INSTALLDIR)\Consumer.exe.manifest" -outputresource:$@;1

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=Static_Release
INSTALLDIR=Static_Release
INTDIR=Static_Release\OMG_TypedEC_Consumer\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(INSTALLDIR)\Consumer.exe"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\..\..\.." -I"..\..\..\.." -I"..\..\..\..\orbsvcs" -I"..\common" -DNDEBUG -DWIN64 -DWIN32 -D_CONSOLE -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_HAS_TYPED_EVENT_CHANNEL -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.OMG_TypedEC_Consumer.dep" "MessengerC.cpp" "MessengerS.cpp" "ConsumerMain.cpp" "Consumer_i.cpp" "Messenger_i.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(INSTALLDIR)\Consumer.exe"
	-@del /f/q "$(INSTALLDIR)\Consumer.ilk"
	-@del /f/q "MessengerC.inl"
	-@del /f/q "MessengerS.inl"
	-@del /f/q "MessengerC.h"
	-@del /f/q "MessengerS.h"
	-@del /f/q "MessengerC.cpp"
	-@del /f/q "MessengerS.cpp"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\OMG_TypedEC_Consumer\$(NULL)" mkdir "Static_Release\OMG_TypedEC_Consumer"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\..\..\.." /I "..\..\..\.." /I "..\..\..\..\orbsvcs" /I "..\common" /D NDEBUG /D WIN64 /D WIN32 /D _CONSOLE /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_HAS_TYPED_EVENT_CHANNEL /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEs.lib TAOs.lib TAO_AnyTypeCodes.lib TAO_CosNamings.lib TAO_CosEvents.lib TAO_PortableServers.lib TAO_CosEvent_Skels.lib /libpath:"." /libpath:"..\..\..\..\..\lib" /nologo /subsystem:console  /machine:IA64 /out:"$(INSTALLDIR)\Consumer.exe"
LINK32_OBJS= \
	"$(INTDIR)\MessengerC.obj" \
	"$(INTDIR)\MessengerS.obj" \
	"$(INTDIR)\ConsumerMain.obj" \
	"$(INTDIR)\Consumer_i.obj" \
	"$(INTDIR)\Messenger_i.obj"

"$(INSTALLDIR)\Consumer.exe" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(INSTALLDIR)\Consumer.exe.manifest" mt.exe -manifest "$(INSTALLDIR)\Consumer.exe.manifest" -outputresource:$@;1

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
!IF EXISTS("Makefile.OMG_TypedEC_Consumer.dep")
!INCLUDE "Makefile.OMG_TypedEC_Consumer.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="MessengerC.cpp"

"$(INTDIR)\MessengerC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\MessengerC.obj" $(SOURCE)

SOURCE="MessengerS.cpp"

"$(INTDIR)\MessengerS.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\MessengerS.obj" $(SOURCE)

SOURCE="ConsumerMain.cpp"

"$(INTDIR)\ConsumerMain.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ConsumerMain.obj" $(SOURCE)

SOURCE="Consumer_i.cpp"

"$(INTDIR)\Consumer_i.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Consumer_i.obj" $(SOURCE)

SOURCE="Messenger_i.cpp"

"$(INTDIR)\Messenger_i.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Messenger_i.obj" $(SOURCE)

!IF  "$(CFG)" == "Win64 Debug"
SOURCE="Messenger.idl"

InputPath=Messenger.idl

"MessengerC.inl" "MessengerS.inl" "MessengerC.h" "MessengerS.h" "MessengerC.cpp" "MessengerS.cpp" : $(SOURCE)  "..\..\..\..\..\bin\tao_idl.exe" "..\..\..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-Messenger_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\..\..\lib
	..\..\..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\..\..\.. -I..\..\..\../orbsvcs "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Release"
SOURCE="Messenger.idl"

InputPath=Messenger.idl

"MessengerC.inl" "MessengerS.inl" "MessengerC.h" "MessengerS.h" "MessengerC.cpp" "MessengerS.cpp" : $(SOURCE)  "..\..\..\..\..\bin\tao_idl.exe" "..\..\..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-Messenger_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\..\..\lib
	..\..\..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\..\..\.. -I..\..\..\../orbsvcs "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Debug"
SOURCE="Messenger.idl"

InputPath=Messenger.idl

"MessengerC.inl" "MessengerS.inl" "MessengerC.h" "MessengerS.h" "MessengerC.cpp" "MessengerS.cpp" : $(SOURCE)  "..\..\..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-Messenger_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\..\..\lib
	..\..\..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\..\..\.. -I..\..\..\../orbsvcs "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Release"
SOURCE="Messenger.idl"

InputPath=Messenger.idl

"MessengerC.inl" "MessengerS.inl" "MessengerC.h" "MessengerS.h" "MessengerC.cpp" "MessengerS.cpp" : $(SOURCE)  "..\..\..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-Messenger_idl.bat
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
!IF EXISTS("Makefile.OMG_TypedEC_Consumer.dep")
	@echo Using "Makefile.OMG_TypedEC_Consumer.dep"
!ELSE
	@echo Warning: cannot find "Makefile.OMG_TypedEC_Consumer.dep"
!ENDIF
!ENDIF

