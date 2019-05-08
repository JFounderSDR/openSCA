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
!MESSAGE NMAKE /f "Makefile.Naming_Server_Messenger.mak" CFG="Win64 Debug"
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
INTDIR=Debug\Naming_Server_Messenger\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(INSTALLDIR)\NamingMessenger.exe"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\..\..\.." -I"..\..\..\.." -I"..\..\..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_CONSOLE -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -f "Makefile.Naming_Server_Messenger.dep" "MessengerC.cpp" "MessengerS.cpp" "MessengerTask.cpp" "NamingTask.cpp" "NamingMessenger.cpp" "Messenger_i.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(INSTALLDIR)\NamingMessenger.pdb"
	-@del /f/q "$(INSTALLDIR)\NamingMessenger.exe"
	-@del /f/q "$(INSTALLDIR)\NamingMessenger.ilk"
	-@del /f/q "MessengerC.inl"
	-@del /f/q "MessengerS.inl"
	-@del /f/q "MessengerC.h"
	-@del /f/q "MessengerS.h"
	-@del /f/q "MessengerC.cpp"
	-@del /f/q "MessengerS.cpp"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\Naming_Server_Messenger\$(NULL)" mkdir "Debug\Naming_Server_Messenger"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\..\..\.." /I "..\..\..\.." /I "..\..\..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _CONSOLE /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_CosNamingd.lib TAO_PortableServerd.lib TAO_CosNaming_Skeld.lib TAO_IORTabled.lib TAO_Valuetyped.lib TAO_CodecFactoryd.lib TAO_PId.lib TAO_Messagingd.lib TAO_Svc_Utilsd.lib TAO_CosNaming_Servd.lib /libpath:"." /libpath:"..\..\..\..\..\lib" /nologo /subsystem:console /debug /pdb:"$(INSTALLDIR)\NamingMessenger.pdb" /machine:IA64 /out:"$(INSTALLDIR)\NamingMessenger.exe"
LINK32_OBJS= \
	"$(INTDIR)\MessengerC.obj" \
	"$(INTDIR)\MessengerS.obj" \
	"$(INTDIR)\MessengerTask.obj" \
	"$(INTDIR)\NamingTask.obj" \
	"$(INTDIR)\NamingMessenger.obj" \
	"$(INTDIR)\Messenger_i.obj"

"$(INSTALLDIR)\NamingMessenger.exe" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(INSTALLDIR)\NamingMessenger.exe.manifest" mt.exe -manifest "$(INSTALLDIR)\NamingMessenger.exe.manifest" -outputresource:$@;1

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=Release
INSTALLDIR=Release
INTDIR=Release\Naming_Server_Messenger\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(INSTALLDIR)\NamingMessenger.exe"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\..\..\.." -I"..\..\..\.." -I"..\..\..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_CONSOLE -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -f "Makefile.Naming_Server_Messenger.dep" "MessengerC.cpp" "MessengerS.cpp" "MessengerTask.cpp" "NamingTask.cpp" "NamingMessenger.cpp" "Messenger_i.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(INSTALLDIR)\NamingMessenger.exe"
	-@del /f/q "$(INSTALLDIR)\NamingMessenger.ilk"
	-@del /f/q "MessengerC.inl"
	-@del /f/q "MessengerS.inl"
	-@del /f/q "MessengerC.h"
	-@del /f/q "MessengerS.h"
	-@del /f/q "MessengerC.cpp"
	-@del /f/q "MessengerS.cpp"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\Naming_Server_Messenger\$(NULL)" mkdir "Release\Naming_Server_Messenger"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\..\..\.." /I "..\..\..\.." /I "..\..\..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _CONSOLE /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_CosNaming.lib TAO_PortableServer.lib TAO_CosNaming_Skel.lib TAO_IORTable.lib TAO_Valuetype.lib TAO_CodecFactory.lib TAO_PI.lib TAO_Messaging.lib TAO_Svc_Utils.lib TAO_CosNaming_Serv.lib /libpath:"." /libpath:"..\..\..\..\..\lib" /nologo /subsystem:console  /machine:IA64 /out:"$(INSTALLDIR)\NamingMessenger.exe"
LINK32_OBJS= \
	"$(INTDIR)\MessengerC.obj" \
	"$(INTDIR)\MessengerS.obj" \
	"$(INTDIR)\MessengerTask.obj" \
	"$(INTDIR)\NamingTask.obj" \
	"$(INTDIR)\NamingMessenger.obj" \
	"$(INTDIR)\Messenger_i.obj"

"$(INSTALLDIR)\NamingMessenger.exe" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(INSTALLDIR)\NamingMessenger.exe.manifest" mt.exe -manifest "$(INSTALLDIR)\NamingMessenger.exe.manifest" -outputresource:$@;1

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=Static_Debug
INSTALLDIR=Static_Debug
INTDIR=Static_Debug\Naming_Server_Messenger\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(INSTALLDIR)\NamingMessenger.exe"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\..\..\.." -I"..\..\..\.." -I"..\..\..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_CONSOLE -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.Naming_Server_Messenger.dep" "MessengerC.cpp" "MessengerS.cpp" "MessengerTask.cpp" "NamingTask.cpp" "NamingMessenger.cpp" "Messenger_i.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(INSTALLDIR)\NamingMessenger.pdb"
	-@del /f/q "$(INSTALLDIR)\NamingMessenger.exe"
	-@del /f/q "$(INSTALLDIR)\NamingMessenger.ilk"
	-@del /f/q "MessengerC.inl"
	-@del /f/q "MessengerS.inl"
	-@del /f/q "MessengerC.h"
	-@del /f/q "MessengerS.h"
	-@del /f/q "MessengerC.cpp"
	-@del /f/q "MessengerS.cpp"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\Naming_Server_Messenger\$(NULL)" mkdir "Static_Debug\Naming_Server_Messenger"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\..\..\.." /I "..\..\..\.." /I "..\..\..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _CONSOLE /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEsd.lib TAOsd.lib TAO_AnyTypeCodesd.lib TAO_CosNamingsd.lib TAO_PortableServersd.lib TAO_CosNaming_Skelsd.lib TAO_IORTablesd.lib TAO_Valuetypesd.lib TAO_CodecFactorysd.lib TAO_PIsd.lib TAO_Messagingsd.lib TAO_Svc_Utilssd.lib TAO_CosNaming_Servsd.lib /libpath:"." /libpath:"..\..\..\..\..\lib" /nologo /subsystem:console /debug /pdb:"$(INSTALLDIR)\NamingMessenger.pdb" /machine:IA64 /out:"$(INSTALLDIR)\NamingMessenger.exe"
LINK32_OBJS= \
	"$(INTDIR)\MessengerC.obj" \
	"$(INTDIR)\MessengerS.obj" \
	"$(INTDIR)\MessengerTask.obj" \
	"$(INTDIR)\NamingTask.obj" \
	"$(INTDIR)\NamingMessenger.obj" \
	"$(INTDIR)\Messenger_i.obj"

"$(INSTALLDIR)\NamingMessenger.exe" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(INSTALLDIR)\NamingMessenger.exe.manifest" mt.exe -manifest "$(INSTALLDIR)\NamingMessenger.exe.manifest" -outputresource:$@;1

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=Static_Release
INSTALLDIR=Static_Release
INTDIR=Static_Release\Naming_Server_Messenger\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(INSTALLDIR)\NamingMessenger.exe"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\..\..\.." -I"..\..\..\.." -I"..\..\..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_CONSOLE -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.Naming_Server_Messenger.dep" "MessengerC.cpp" "MessengerS.cpp" "MessengerTask.cpp" "NamingTask.cpp" "NamingMessenger.cpp" "Messenger_i.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(INSTALLDIR)\NamingMessenger.exe"
	-@del /f/q "$(INSTALLDIR)\NamingMessenger.ilk"
	-@del /f/q "MessengerC.inl"
	-@del /f/q "MessengerS.inl"
	-@del /f/q "MessengerC.h"
	-@del /f/q "MessengerS.h"
	-@del /f/q "MessengerC.cpp"
	-@del /f/q "MessengerS.cpp"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\Naming_Server_Messenger\$(NULL)" mkdir "Static_Release\Naming_Server_Messenger"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\..\..\.." /I "..\..\..\.." /I "..\..\..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _CONSOLE /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEs.lib TAOs.lib TAO_AnyTypeCodes.lib TAO_CosNamings.lib TAO_PortableServers.lib TAO_CosNaming_Skels.lib TAO_IORTables.lib TAO_Valuetypes.lib TAO_CodecFactorys.lib TAO_PIs.lib TAO_Messagings.lib TAO_Svc_Utilss.lib TAO_CosNaming_Servs.lib /libpath:"." /libpath:"..\..\..\..\..\lib" /nologo /subsystem:console  /machine:IA64 /out:"$(INSTALLDIR)\NamingMessenger.exe"
LINK32_OBJS= \
	"$(INTDIR)\MessengerC.obj" \
	"$(INTDIR)\MessengerS.obj" \
	"$(INTDIR)\MessengerTask.obj" \
	"$(INTDIR)\NamingTask.obj" \
	"$(INTDIR)\NamingMessenger.obj" \
	"$(INTDIR)\Messenger_i.obj"

"$(INSTALLDIR)\NamingMessenger.exe" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(INSTALLDIR)\NamingMessenger.exe.manifest" mt.exe -manifest "$(INSTALLDIR)\NamingMessenger.exe.manifest" -outputresource:$@;1

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
!IF EXISTS("Makefile.Naming_Server_Messenger.dep")
!INCLUDE "Makefile.Naming_Server_Messenger.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="MessengerC.cpp"

"$(INTDIR)\MessengerC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\MessengerC.obj" $(SOURCE)

SOURCE="MessengerS.cpp"

"$(INTDIR)\MessengerS.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\MessengerS.obj" $(SOURCE)

SOURCE="MessengerTask.cpp"

"$(INTDIR)\MessengerTask.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\MessengerTask.obj" $(SOURCE)

SOURCE="NamingTask.cpp"

"$(INTDIR)\NamingTask.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\NamingTask.obj" $(SOURCE)

SOURCE="NamingMessenger.cpp"

"$(INTDIR)\NamingMessenger.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\NamingMessenger.obj" $(SOURCE)

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
!IF EXISTS("Makefile.Naming_Server_Messenger.dep")
	@echo Using "Makefile.Naming_Server_Messenger.dep"
!ELSE
	@echo Warning: cannot find "Makefile.Naming_Server_Messenger.dep"
!ENDIF
!ENDIF

