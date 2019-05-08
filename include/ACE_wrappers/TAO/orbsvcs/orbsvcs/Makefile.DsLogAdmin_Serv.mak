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
!MESSAGE NMAKE /f "Makefile.DsLogAdmin_Serv.mak" CFG="Win64 Debug"
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
INTDIR=Debug\DsLogAdmin_Serv\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_DsLogAdmin_Servd.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_LOG_SERV_BUILD_DLL -f "Makefile.DsLogAdmin_Serv.dep" "Log\BasicLogFactory_i.cpp" "Log\BasicLog_i.cpp" "Log\Hash_Iterator_i.cpp" "Log\Hash_LogRecordStore.cpp" "Log\Hash_LogStore.cpp" "Log\Hash_Persistence_Strategy.cpp" "Log\Iterator_i.cpp" "Log\LogActivator.cpp" "Log\LogMgr_i.cpp" "Log\LogNotification.cpp" "Log\LogRecordStore.cpp" "Log\Log_Compaction_Handler.cpp" "Log\Log_Constraint_Interpreter.cpp" "Log\Log_Constraint_Visitors.cpp" "Log\Log_Flush_Handler.cpp" "Log\Log_i.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_DsLogAdmin_Servd.pdb"
	-@del /f/q "..\..\..\lib\TAO_DsLogAdmin_Servd.dll"
	-@del /f/q "$(OUTDIR)\TAO_DsLogAdmin_Servd.lib"
	-@del /f/q "$(OUTDIR)\TAO_DsLogAdmin_Servd.exp"
	-@del /f/q "$(OUTDIR)\TAO_DsLogAdmin_Servd.ilk"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\DsLogAdmin_Serv\$(NULL)" mkdir "Debug\DsLogAdmin_Serv"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_LOG_SERV_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_DsLogAdmind.lib TAO_PortableServerd.lib TAO_DsLogAdmin_Skeld.lib TAO_Valuetyped.lib TAO_DynamicAnyd.lib ACE_ETCLd.lib TAO_ETCLd.lib ACE_ETCL_Parserd.lib TAO_CodecFactoryd.lib TAO_PId.lib TAO_Utilsd.lib TAO_Svc_Utilsd.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\..\lib\TAO_DsLogAdmin_Servd.pdb" /machine:IA64 /out:"..\..\..\lib\TAO_DsLogAdmin_Servd.dll" /implib:"$(OUTDIR)\TAO_DsLogAdmin_Servd.lib"
LINK32_OBJS= \
	"$(INTDIR)\Log\BasicLogFactory_i.obj" \
	"$(INTDIR)\Log\BasicLog_i.obj" \
	"$(INTDIR)\Log\Hash_Iterator_i.obj" \
	"$(INTDIR)\Log\Hash_LogRecordStore.obj" \
	"$(INTDIR)\Log\Hash_LogStore.obj" \
	"$(INTDIR)\Log\Hash_Persistence_Strategy.obj" \
	"$(INTDIR)\Log\Iterator_i.obj" \
	"$(INTDIR)\Log\LogActivator.obj" \
	"$(INTDIR)\Log\LogMgr_i.obj" \
	"$(INTDIR)\Log\LogNotification.obj" \
	"$(INTDIR)\Log\LogRecordStore.obj" \
	"$(INTDIR)\Log\Log_Compaction_Handler.obj" \
	"$(INTDIR)\Log\Log_Constraint_Interpreter.obj" \
	"$(INTDIR)\Log\Log_Constraint_Visitors.obj" \
	"$(INTDIR)\Log\Log_Flush_Handler.obj" \
	"$(INTDIR)\Log\Log_i.obj"

"..\..\..\lib\TAO_DsLogAdmin_Servd.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_DsLogAdmin_Servd.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_DsLogAdmin_Servd.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\DsLogAdmin_Serv\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_DsLogAdmin_Serv.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_LOG_SERV_BUILD_DLL -f "Makefile.DsLogAdmin_Serv.dep" "Log\BasicLogFactory_i.cpp" "Log\BasicLog_i.cpp" "Log\Hash_Iterator_i.cpp" "Log\Hash_LogRecordStore.cpp" "Log\Hash_LogStore.cpp" "Log\Hash_Persistence_Strategy.cpp" "Log\Iterator_i.cpp" "Log\LogActivator.cpp" "Log\LogMgr_i.cpp" "Log\LogNotification.cpp" "Log\LogRecordStore.cpp" "Log\Log_Compaction_Handler.cpp" "Log\Log_Constraint_Interpreter.cpp" "Log\Log_Constraint_Visitors.cpp" "Log\Log_Flush_Handler.cpp" "Log\Log_i.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\TAO_DsLogAdmin_Serv.dll"
	-@del /f/q "$(OUTDIR)\TAO_DsLogAdmin_Serv.lib"
	-@del /f/q "$(OUTDIR)\TAO_DsLogAdmin_Serv.exp"
	-@del /f/q "$(OUTDIR)\TAO_DsLogAdmin_Serv.ilk"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\DsLogAdmin_Serv\$(NULL)" mkdir "Release\DsLogAdmin_Serv"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_LOG_SERV_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_DsLogAdmin.lib TAO_PortableServer.lib TAO_DsLogAdmin_Skel.lib TAO_Valuetype.lib TAO_DynamicAny.lib ACE_ETCL.lib TAO_ETCL.lib ACE_ETCL_Parser.lib TAO_CodecFactory.lib TAO_PI.lib TAO_Utils.lib TAO_Svc_Utils.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\..\lib\TAO_DsLogAdmin_Serv.dll" /implib:"$(OUTDIR)\TAO_DsLogAdmin_Serv.lib"
LINK32_OBJS= \
	"$(INTDIR)\Log\BasicLogFactory_i.obj" \
	"$(INTDIR)\Log\BasicLog_i.obj" \
	"$(INTDIR)\Log\Hash_Iterator_i.obj" \
	"$(INTDIR)\Log\Hash_LogRecordStore.obj" \
	"$(INTDIR)\Log\Hash_LogStore.obj" \
	"$(INTDIR)\Log\Hash_Persistence_Strategy.obj" \
	"$(INTDIR)\Log\Iterator_i.obj" \
	"$(INTDIR)\Log\LogActivator.obj" \
	"$(INTDIR)\Log\LogMgr_i.obj" \
	"$(INTDIR)\Log\LogNotification.obj" \
	"$(INTDIR)\Log\LogRecordStore.obj" \
	"$(INTDIR)\Log\Log_Compaction_Handler.obj" \
	"$(INTDIR)\Log\Log_Constraint_Interpreter.obj" \
	"$(INTDIR)\Log\Log_Constraint_Visitors.obj" \
	"$(INTDIR)\Log\Log_Flush_Handler.obj" \
	"$(INTDIR)\Log\Log_i.obj"

"..\..\..\lib\TAO_DsLogAdmin_Serv.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_DsLogAdmin_Serv.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_DsLogAdmin_Serv.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\DsLogAdmin_Serv\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_DsLogAdmin_Servsd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.DsLogAdmin_Serv.dep" "Log\BasicLogFactory_i.cpp" "Log\BasicLog_i.cpp" "Log\Hash_Iterator_i.cpp" "Log\Hash_LogRecordStore.cpp" "Log\Hash_LogStore.cpp" "Log\Hash_Persistence_Strategy.cpp" "Log\Iterator_i.cpp" "Log\LogActivator.cpp" "Log\LogMgr_i.cpp" "Log\LogNotification.cpp" "Log\LogRecordStore.cpp" "Log\Log_Compaction_Handler.cpp" "Log\Log_Constraint_Interpreter.cpp" "Log\Log_Constraint_Visitors.cpp" "Log\Log_Flush_Handler.cpp" "Log\Log_i.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_DsLogAdmin_Servsd.lib"
	-@del /f/q "$(OUTDIR)\TAO_DsLogAdmin_Servsd.exp"
	-@del /f/q "$(OUTDIR)\TAO_DsLogAdmin_Servsd.ilk"
	-@del /f/q "..\..\..\lib\TAO_DsLogAdmin_Servsd.pdb"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\DsLogAdmin_Serv\$(NULL)" mkdir "Static_Debug\DsLogAdmin_Serv"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\TAO_DsLogAdmin_Servsd.pdb" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_DsLogAdmin_Servsd.lib"
LINK32_OBJS= \
	"$(INTDIR)\Log\BasicLogFactory_i.obj" \
	"$(INTDIR)\Log\BasicLog_i.obj" \
	"$(INTDIR)\Log\Hash_Iterator_i.obj" \
	"$(INTDIR)\Log\Hash_LogRecordStore.obj" \
	"$(INTDIR)\Log\Hash_LogStore.obj" \
	"$(INTDIR)\Log\Hash_Persistence_Strategy.obj" \
	"$(INTDIR)\Log\Iterator_i.obj" \
	"$(INTDIR)\Log\LogActivator.obj" \
	"$(INTDIR)\Log\LogMgr_i.obj" \
	"$(INTDIR)\Log\LogNotification.obj" \
	"$(INTDIR)\Log\LogRecordStore.obj" \
	"$(INTDIR)\Log\Log_Compaction_Handler.obj" \
	"$(INTDIR)\Log\Log_Constraint_Interpreter.obj" \
	"$(INTDIR)\Log\Log_Constraint_Visitors.obj" \
	"$(INTDIR)\Log\Log_Flush_Handler.obj" \
	"$(INTDIR)\Log\Log_i.obj"

"$(OUTDIR)\TAO_DsLogAdmin_Servsd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_DsLogAdmin_Servsd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_DsLogAdmin_Servsd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\DsLogAdmin_Serv\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_DsLogAdmin_Servs.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.DsLogAdmin_Serv.dep" "Log\BasicLogFactory_i.cpp" "Log\BasicLog_i.cpp" "Log\Hash_Iterator_i.cpp" "Log\Hash_LogRecordStore.cpp" "Log\Hash_LogStore.cpp" "Log\Hash_Persistence_Strategy.cpp" "Log\Iterator_i.cpp" "Log\LogActivator.cpp" "Log\LogMgr_i.cpp" "Log\LogNotification.cpp" "Log\LogRecordStore.cpp" "Log\Log_Compaction_Handler.cpp" "Log\Log_Constraint_Interpreter.cpp" "Log\Log_Constraint_Visitors.cpp" "Log\Log_Flush_Handler.cpp" "Log\Log_i.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_DsLogAdmin_Servs.lib"
	-@del /f/q "$(OUTDIR)\TAO_DsLogAdmin_Servs.exp"
	-@del /f/q "$(OUTDIR)\TAO_DsLogAdmin_Servs.ilk"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\DsLogAdmin_Serv\$(NULL)" mkdir "Static_Release\DsLogAdmin_Serv"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_DsLogAdmin_Servs.lib"
LINK32_OBJS= \
	"$(INTDIR)\Log\BasicLogFactory_i.obj" \
	"$(INTDIR)\Log\BasicLog_i.obj" \
	"$(INTDIR)\Log\Hash_Iterator_i.obj" \
	"$(INTDIR)\Log\Hash_LogRecordStore.obj" \
	"$(INTDIR)\Log\Hash_LogStore.obj" \
	"$(INTDIR)\Log\Hash_Persistence_Strategy.obj" \
	"$(INTDIR)\Log\Iterator_i.obj" \
	"$(INTDIR)\Log\LogActivator.obj" \
	"$(INTDIR)\Log\LogMgr_i.obj" \
	"$(INTDIR)\Log\LogNotification.obj" \
	"$(INTDIR)\Log\LogRecordStore.obj" \
	"$(INTDIR)\Log\Log_Compaction_Handler.obj" \
	"$(INTDIR)\Log\Log_Constraint_Interpreter.obj" \
	"$(INTDIR)\Log\Log_Constraint_Visitors.obj" \
	"$(INTDIR)\Log\Log_Flush_Handler.obj" \
	"$(INTDIR)\Log\Log_i.obj"

"$(OUTDIR)\TAO_DsLogAdmin_Servs.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_DsLogAdmin_Servs.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_DsLogAdmin_Servs.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.DsLogAdmin_Serv.dep")
!INCLUDE "Makefile.DsLogAdmin_Serv.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="Log\BasicLogFactory_i.cpp"

"$(INTDIR)\Log\BasicLogFactory_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Log\$(NULL)" mkdir "$(INTDIR)\Log\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Log\BasicLogFactory_i.obj" $(SOURCE)

SOURCE="Log\BasicLog_i.cpp"

"$(INTDIR)\Log\BasicLog_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Log\$(NULL)" mkdir "$(INTDIR)\Log\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Log\BasicLog_i.obj" $(SOURCE)

SOURCE="Log\Hash_Iterator_i.cpp"

"$(INTDIR)\Log\Hash_Iterator_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Log\$(NULL)" mkdir "$(INTDIR)\Log\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Log\Hash_Iterator_i.obj" $(SOURCE)

SOURCE="Log\Hash_LogRecordStore.cpp"

"$(INTDIR)\Log\Hash_LogRecordStore.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Log\$(NULL)" mkdir "$(INTDIR)\Log\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Log\Hash_LogRecordStore.obj" $(SOURCE)

SOURCE="Log\Hash_LogStore.cpp"

"$(INTDIR)\Log\Hash_LogStore.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Log\$(NULL)" mkdir "$(INTDIR)\Log\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Log\Hash_LogStore.obj" $(SOURCE)

SOURCE="Log\Hash_Persistence_Strategy.cpp"

"$(INTDIR)\Log\Hash_Persistence_Strategy.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Log\$(NULL)" mkdir "$(INTDIR)\Log\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Log\Hash_Persistence_Strategy.obj" $(SOURCE)

SOURCE="Log\Iterator_i.cpp"

"$(INTDIR)\Log\Iterator_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Log\$(NULL)" mkdir "$(INTDIR)\Log\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Log\Iterator_i.obj" $(SOURCE)

SOURCE="Log\LogActivator.cpp"

"$(INTDIR)\Log\LogActivator.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Log\$(NULL)" mkdir "$(INTDIR)\Log\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Log\LogActivator.obj" $(SOURCE)

SOURCE="Log\LogMgr_i.cpp"

"$(INTDIR)\Log\LogMgr_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Log\$(NULL)" mkdir "$(INTDIR)\Log\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Log\LogMgr_i.obj" $(SOURCE)

SOURCE="Log\LogNotification.cpp"

"$(INTDIR)\Log\LogNotification.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Log\$(NULL)" mkdir "$(INTDIR)\Log\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Log\LogNotification.obj" $(SOURCE)

SOURCE="Log\LogRecordStore.cpp"

"$(INTDIR)\Log\LogRecordStore.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Log\$(NULL)" mkdir "$(INTDIR)\Log\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Log\LogRecordStore.obj" $(SOURCE)

SOURCE="Log\Log_Compaction_Handler.cpp"

"$(INTDIR)\Log\Log_Compaction_Handler.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Log\$(NULL)" mkdir "$(INTDIR)\Log\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Log\Log_Compaction_Handler.obj" $(SOURCE)

SOURCE="Log\Log_Constraint_Interpreter.cpp"

"$(INTDIR)\Log\Log_Constraint_Interpreter.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Log\$(NULL)" mkdir "$(INTDIR)\Log\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Log\Log_Constraint_Interpreter.obj" $(SOURCE)

SOURCE="Log\Log_Constraint_Visitors.cpp"

"$(INTDIR)\Log\Log_Constraint_Visitors.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Log\$(NULL)" mkdir "$(INTDIR)\Log\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Log\Log_Constraint_Visitors.obj" $(SOURCE)

SOURCE="Log\Log_Flush_Handler.cpp"

"$(INTDIR)\Log\Log_Flush_Handler.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Log\$(NULL)" mkdir "$(INTDIR)\Log\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Log\Log_Flush_Handler.obj" $(SOURCE)

SOURCE="Log\Log_i.cpp"

"$(INTDIR)\Log\Log_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\Log\$(NULL)" mkdir "$(INTDIR)\Log\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Log\Log_i.obj" $(SOURCE)

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
!IF EXISTS("Makefile.DsLogAdmin_Serv.dep")
	@echo Using "Makefile.DsLogAdmin_Serv.dep"
!ELSE
	@echo Warning: cannot find "Makefile.DsLogAdmin_Serv.dep"
!ENDIF
!ENDIF

