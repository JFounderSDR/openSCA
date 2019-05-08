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
!MESSAGE NMAKE /f "Makefile.Messaging.mak" CFG="Win64 Debug"
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
INTDIR=Debug\Messaging\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_Messagingd.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_MESSAGING_BUILD_DLL -f "Makefile.Messaging.dep" "AMH_Response_Handler.cpp" "AMI_Arguments_Converter_Impl.cpp" "Asynch_Invocation.cpp" "Asynch_Invocation_Adapter.cpp" "Asynch_Reply_Dispatcher.cpp" "Asynch_Timeout_Handler.cpp" "Buffering_Constraint_Policy.cpp" "Connection_Timeout_Policy_i.cpp" "ExceptionHolder_i.cpp" "Messaging.cpp" "Messaging_Loader.cpp" "Messaging_ORBInitializer.cpp" "Messaging_Policy_i.cpp" "Messaging_PolicyFactory.cpp" "Messaging_Queueing_Strategies.cpp" "ExceptionHolderC.cpp" "PollableC.cpp" "Messaging_TypesC.cpp" "TAO_ExtC.cpp" "Messaging_RT_PolicyC.cpp" "Messaging_SyncScope_PolicyC.cpp" "Messaging_No_ImplC.cpp" "MessagingC.cpp" "MessagingS.cpp" "ExceptionHolderA.cpp" "MessagingA.cpp" "Messaging_No_ImplA.cpp" "Messaging_RT_PolicyA.cpp" "Messaging_SyncScope_PolicyA.cpp" "TAO_ExtA.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_Messagingd.pdb"
	-@del /f/q "..\..\..\lib\TAO_Messagingd.dll"
	-@del /f/q "$(OUTDIR)\TAO_Messagingd.lib"
	-@del /f/q "$(OUTDIR)\TAO_Messagingd.exp"
	-@del /f/q "$(OUTDIR)\TAO_Messagingd.ilk"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\Messaging\$(NULL)" mkdir "Debug\Messaging"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_MESSAGING_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_PortableServerd.lib TAO_CodecFactoryd.lib TAO_PId.lib TAO_Valuetyped.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\..\lib\TAO_Messagingd.pdb" /machine:IA64 /out:"..\..\..\lib\TAO_Messagingd.dll" /implib:"$(OUTDIR)\TAO_Messagingd.lib"
LINK32_OBJS= \
	"$(INTDIR)\TAO_Messaging.res" \
	"$(INTDIR)\AMH_Response_Handler.obj" \
	"$(INTDIR)\AMI_Arguments_Converter_Impl.obj" \
	"$(INTDIR)\Asynch_Invocation.obj" \
	"$(INTDIR)\Asynch_Invocation_Adapter.obj" \
	"$(INTDIR)\Asynch_Reply_Dispatcher.obj" \
	"$(INTDIR)\Asynch_Timeout_Handler.obj" \
	"$(INTDIR)\Buffering_Constraint_Policy.obj" \
	"$(INTDIR)\Connection_Timeout_Policy_i.obj" \
	"$(INTDIR)\ExceptionHolder_i.obj" \
	"$(INTDIR)\Messaging.obj" \
	"$(INTDIR)\Messaging_Loader.obj" \
	"$(INTDIR)\Messaging_ORBInitializer.obj" \
	"$(INTDIR)\Messaging_Policy_i.obj" \
	"$(INTDIR)\Messaging_PolicyFactory.obj" \
	"$(INTDIR)\Messaging_Queueing_Strategies.obj" \
	"$(INTDIR)\ExceptionHolderC.obj" \
	"$(INTDIR)\PollableC.obj" \
	"$(INTDIR)\Messaging_TypesC.obj" \
	"$(INTDIR)\TAO_ExtC.obj" \
	"$(INTDIR)\Messaging_RT_PolicyC.obj" \
	"$(INTDIR)\Messaging_SyncScope_PolicyC.obj" \
	"$(INTDIR)\Messaging_No_ImplC.obj" \
	"$(INTDIR)\MessagingC.obj" \
	"$(INTDIR)\MessagingS.obj" \
	"$(INTDIR)\ExceptionHolderA.obj" \
	"$(INTDIR)\MessagingA.obj" \
	"$(INTDIR)\Messaging_No_ImplA.obj" \
	"$(INTDIR)\Messaging_RT_PolicyA.obj" \
	"$(INTDIR)\Messaging_SyncScope_PolicyA.obj" \
	"$(INTDIR)\TAO_ExtA.obj"

"..\..\..\lib\TAO_Messagingd.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_Messagingd.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_Messagingd.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\Messaging\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_Messaging.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_MESSAGING_BUILD_DLL -f "Makefile.Messaging.dep" "AMH_Response_Handler.cpp" "AMI_Arguments_Converter_Impl.cpp" "Asynch_Invocation.cpp" "Asynch_Invocation_Adapter.cpp" "Asynch_Reply_Dispatcher.cpp" "Asynch_Timeout_Handler.cpp" "Buffering_Constraint_Policy.cpp" "Connection_Timeout_Policy_i.cpp" "ExceptionHolder_i.cpp" "Messaging.cpp" "Messaging_Loader.cpp" "Messaging_ORBInitializer.cpp" "Messaging_Policy_i.cpp" "Messaging_PolicyFactory.cpp" "Messaging_Queueing_Strategies.cpp" "ExceptionHolderC.cpp" "PollableC.cpp" "Messaging_TypesC.cpp" "TAO_ExtC.cpp" "Messaging_RT_PolicyC.cpp" "Messaging_SyncScope_PolicyC.cpp" "Messaging_No_ImplC.cpp" "MessagingC.cpp" "MessagingS.cpp" "ExceptionHolderA.cpp" "MessagingA.cpp" "Messaging_No_ImplA.cpp" "Messaging_RT_PolicyA.cpp" "Messaging_SyncScope_PolicyA.cpp" "TAO_ExtA.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\TAO_Messaging.dll"
	-@del /f/q "$(OUTDIR)\TAO_Messaging.lib"
	-@del /f/q "$(OUTDIR)\TAO_Messaging.exp"
	-@del /f/q "$(OUTDIR)\TAO_Messaging.ilk"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\Messaging\$(NULL)" mkdir "Release\Messaging"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_MESSAGING_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_PortableServer.lib TAO_CodecFactory.lib TAO_PI.lib TAO_Valuetype.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\..\lib\TAO_Messaging.dll" /implib:"$(OUTDIR)\TAO_Messaging.lib"
LINK32_OBJS= \
	"$(INTDIR)\TAO_Messaging.res" \
	"$(INTDIR)\AMH_Response_Handler.obj" \
	"$(INTDIR)\AMI_Arguments_Converter_Impl.obj" \
	"$(INTDIR)\Asynch_Invocation.obj" \
	"$(INTDIR)\Asynch_Invocation_Adapter.obj" \
	"$(INTDIR)\Asynch_Reply_Dispatcher.obj" \
	"$(INTDIR)\Asynch_Timeout_Handler.obj" \
	"$(INTDIR)\Buffering_Constraint_Policy.obj" \
	"$(INTDIR)\Connection_Timeout_Policy_i.obj" \
	"$(INTDIR)\ExceptionHolder_i.obj" \
	"$(INTDIR)\Messaging.obj" \
	"$(INTDIR)\Messaging_Loader.obj" \
	"$(INTDIR)\Messaging_ORBInitializer.obj" \
	"$(INTDIR)\Messaging_Policy_i.obj" \
	"$(INTDIR)\Messaging_PolicyFactory.obj" \
	"$(INTDIR)\Messaging_Queueing_Strategies.obj" \
	"$(INTDIR)\ExceptionHolderC.obj" \
	"$(INTDIR)\PollableC.obj" \
	"$(INTDIR)\Messaging_TypesC.obj" \
	"$(INTDIR)\TAO_ExtC.obj" \
	"$(INTDIR)\Messaging_RT_PolicyC.obj" \
	"$(INTDIR)\Messaging_SyncScope_PolicyC.obj" \
	"$(INTDIR)\Messaging_No_ImplC.obj" \
	"$(INTDIR)\MessagingC.obj" \
	"$(INTDIR)\MessagingS.obj" \
	"$(INTDIR)\ExceptionHolderA.obj" \
	"$(INTDIR)\MessagingA.obj" \
	"$(INTDIR)\Messaging_No_ImplA.obj" \
	"$(INTDIR)\Messaging_RT_PolicyA.obj" \
	"$(INTDIR)\Messaging_SyncScope_PolicyA.obj" \
	"$(INTDIR)\TAO_ExtA.obj"

"..\..\..\lib\TAO_Messaging.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_Messaging.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_Messaging.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\Messaging\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_Messagingsd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.Messaging.dep" "AMH_Response_Handler.cpp" "AMI_Arguments_Converter_Impl.cpp" "Asynch_Invocation.cpp" "Asynch_Invocation_Adapter.cpp" "Asynch_Reply_Dispatcher.cpp" "Asynch_Timeout_Handler.cpp" "Buffering_Constraint_Policy.cpp" "Connection_Timeout_Policy_i.cpp" "ExceptionHolder_i.cpp" "Messaging.cpp" "Messaging_Loader.cpp" "Messaging_ORBInitializer.cpp" "Messaging_Policy_i.cpp" "Messaging_PolicyFactory.cpp" "Messaging_Queueing_Strategies.cpp" "ExceptionHolderC.cpp" "PollableC.cpp" "Messaging_TypesC.cpp" "TAO_ExtC.cpp" "Messaging_RT_PolicyC.cpp" "Messaging_SyncScope_PolicyC.cpp" "Messaging_No_ImplC.cpp" "MessagingC.cpp" "MessagingS.cpp" "ExceptionHolderA.cpp" "MessagingA.cpp" "Messaging_No_ImplA.cpp" "Messaging_RT_PolicyA.cpp" "Messaging_SyncScope_PolicyA.cpp" "TAO_ExtA.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_Messagingsd.lib"
	-@del /f/q "$(OUTDIR)\TAO_Messagingsd.exp"
	-@del /f/q "$(OUTDIR)\TAO_Messagingsd.ilk"
	-@del /f/q "..\..\..\lib\TAO_Messagingsd.pdb"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\Messaging\$(NULL)" mkdir "Static_Debug\Messaging"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\TAO_Messagingsd.pdb" /I "..\..\.." /I "..\.." /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_Messagingsd.lib"
LINK32_OBJS= \
	"$(INTDIR)\AMH_Response_Handler.obj" \
	"$(INTDIR)\AMI_Arguments_Converter_Impl.obj" \
	"$(INTDIR)\Asynch_Invocation.obj" \
	"$(INTDIR)\Asynch_Invocation_Adapter.obj" \
	"$(INTDIR)\Asynch_Reply_Dispatcher.obj" \
	"$(INTDIR)\Asynch_Timeout_Handler.obj" \
	"$(INTDIR)\Buffering_Constraint_Policy.obj" \
	"$(INTDIR)\Connection_Timeout_Policy_i.obj" \
	"$(INTDIR)\ExceptionHolder_i.obj" \
	"$(INTDIR)\Messaging.obj" \
	"$(INTDIR)\Messaging_Loader.obj" \
	"$(INTDIR)\Messaging_ORBInitializer.obj" \
	"$(INTDIR)\Messaging_Policy_i.obj" \
	"$(INTDIR)\Messaging_PolicyFactory.obj" \
	"$(INTDIR)\Messaging_Queueing_Strategies.obj" \
	"$(INTDIR)\ExceptionHolderC.obj" \
	"$(INTDIR)\PollableC.obj" \
	"$(INTDIR)\Messaging_TypesC.obj" \
	"$(INTDIR)\TAO_ExtC.obj" \
	"$(INTDIR)\Messaging_RT_PolicyC.obj" \
	"$(INTDIR)\Messaging_SyncScope_PolicyC.obj" \
	"$(INTDIR)\Messaging_No_ImplC.obj" \
	"$(INTDIR)\MessagingC.obj" \
	"$(INTDIR)\MessagingS.obj" \
	"$(INTDIR)\ExceptionHolderA.obj" \
	"$(INTDIR)\MessagingA.obj" \
	"$(INTDIR)\Messaging_No_ImplA.obj" \
	"$(INTDIR)\Messaging_RT_PolicyA.obj" \
	"$(INTDIR)\Messaging_SyncScope_PolicyA.obj" \
	"$(INTDIR)\TAO_ExtA.obj"

"$(OUTDIR)\TAO_Messagingsd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_Messagingsd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_Messagingsd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\Messaging\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_Messagings.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.Messaging.dep" "AMH_Response_Handler.cpp" "AMI_Arguments_Converter_Impl.cpp" "Asynch_Invocation.cpp" "Asynch_Invocation_Adapter.cpp" "Asynch_Reply_Dispatcher.cpp" "Asynch_Timeout_Handler.cpp" "Buffering_Constraint_Policy.cpp" "Connection_Timeout_Policy_i.cpp" "ExceptionHolder_i.cpp" "Messaging.cpp" "Messaging_Loader.cpp" "Messaging_ORBInitializer.cpp" "Messaging_Policy_i.cpp" "Messaging_PolicyFactory.cpp" "Messaging_Queueing_Strategies.cpp" "ExceptionHolderC.cpp" "PollableC.cpp" "Messaging_TypesC.cpp" "TAO_ExtC.cpp" "Messaging_RT_PolicyC.cpp" "Messaging_SyncScope_PolicyC.cpp" "Messaging_No_ImplC.cpp" "MessagingC.cpp" "MessagingS.cpp" "ExceptionHolderA.cpp" "MessagingA.cpp" "Messaging_No_ImplA.cpp" "Messaging_RT_PolicyA.cpp" "Messaging_SyncScope_PolicyA.cpp" "TAO_ExtA.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_Messagings.lib"
	-@del /f/q "$(OUTDIR)\TAO_Messagings.exp"
	-@del /f/q "$(OUTDIR)\TAO_Messagings.ilk"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\Messaging\$(NULL)" mkdir "Static_Release\Messaging"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_Messagings.lib"
LINK32_OBJS= \
	"$(INTDIR)\AMH_Response_Handler.obj" \
	"$(INTDIR)\AMI_Arguments_Converter_Impl.obj" \
	"$(INTDIR)\Asynch_Invocation.obj" \
	"$(INTDIR)\Asynch_Invocation_Adapter.obj" \
	"$(INTDIR)\Asynch_Reply_Dispatcher.obj" \
	"$(INTDIR)\Asynch_Timeout_Handler.obj" \
	"$(INTDIR)\Buffering_Constraint_Policy.obj" \
	"$(INTDIR)\Connection_Timeout_Policy_i.obj" \
	"$(INTDIR)\ExceptionHolder_i.obj" \
	"$(INTDIR)\Messaging.obj" \
	"$(INTDIR)\Messaging_Loader.obj" \
	"$(INTDIR)\Messaging_ORBInitializer.obj" \
	"$(INTDIR)\Messaging_Policy_i.obj" \
	"$(INTDIR)\Messaging_PolicyFactory.obj" \
	"$(INTDIR)\Messaging_Queueing_Strategies.obj" \
	"$(INTDIR)\ExceptionHolderC.obj" \
	"$(INTDIR)\PollableC.obj" \
	"$(INTDIR)\Messaging_TypesC.obj" \
	"$(INTDIR)\TAO_ExtC.obj" \
	"$(INTDIR)\Messaging_RT_PolicyC.obj" \
	"$(INTDIR)\Messaging_SyncScope_PolicyC.obj" \
	"$(INTDIR)\Messaging_No_ImplC.obj" \
	"$(INTDIR)\MessagingC.obj" \
	"$(INTDIR)\MessagingS.obj" \
	"$(INTDIR)\ExceptionHolderA.obj" \
	"$(INTDIR)\MessagingA.obj" \
	"$(INTDIR)\Messaging_No_ImplA.obj" \
	"$(INTDIR)\Messaging_RT_PolicyA.obj" \
	"$(INTDIR)\Messaging_SyncScope_PolicyA.obj" \
	"$(INTDIR)\TAO_ExtA.obj"

"$(OUTDIR)\TAO_Messagings.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_Messagings.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_Messagings.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.Messaging.dep")
!INCLUDE "Makefile.Messaging.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="AMH_Response_Handler.cpp"

"$(INTDIR)\AMH_Response_Handler.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\AMH_Response_Handler.obj" $(SOURCE)

SOURCE="AMI_Arguments_Converter_Impl.cpp"

"$(INTDIR)\AMI_Arguments_Converter_Impl.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\AMI_Arguments_Converter_Impl.obj" $(SOURCE)

SOURCE="Asynch_Invocation.cpp"

"$(INTDIR)\Asynch_Invocation.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Asynch_Invocation.obj" $(SOURCE)

SOURCE="Asynch_Invocation_Adapter.cpp"

"$(INTDIR)\Asynch_Invocation_Adapter.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Asynch_Invocation_Adapter.obj" $(SOURCE)

SOURCE="Asynch_Reply_Dispatcher.cpp"

"$(INTDIR)\Asynch_Reply_Dispatcher.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Asynch_Reply_Dispatcher.obj" $(SOURCE)

SOURCE="Asynch_Timeout_Handler.cpp"

"$(INTDIR)\Asynch_Timeout_Handler.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Asynch_Timeout_Handler.obj" $(SOURCE)

SOURCE="Buffering_Constraint_Policy.cpp"

"$(INTDIR)\Buffering_Constraint_Policy.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Buffering_Constraint_Policy.obj" $(SOURCE)

SOURCE="Connection_Timeout_Policy_i.cpp"

"$(INTDIR)\Connection_Timeout_Policy_i.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Connection_Timeout_Policy_i.obj" $(SOURCE)

SOURCE="ExceptionHolder_i.cpp"

"$(INTDIR)\ExceptionHolder_i.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ExceptionHolder_i.obj" $(SOURCE)

SOURCE="Messaging.cpp"

"$(INTDIR)\Messaging.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Messaging.obj" $(SOURCE)

SOURCE="Messaging_Loader.cpp"

"$(INTDIR)\Messaging_Loader.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Messaging_Loader.obj" $(SOURCE)

SOURCE="Messaging_ORBInitializer.cpp"

"$(INTDIR)\Messaging_ORBInitializer.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Messaging_ORBInitializer.obj" $(SOURCE)

SOURCE="Messaging_Policy_i.cpp"

"$(INTDIR)\Messaging_Policy_i.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Messaging_Policy_i.obj" $(SOURCE)

SOURCE="Messaging_PolicyFactory.cpp"

"$(INTDIR)\Messaging_PolicyFactory.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Messaging_PolicyFactory.obj" $(SOURCE)

SOURCE="Messaging_Queueing_Strategies.cpp"

"$(INTDIR)\Messaging_Queueing_Strategies.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Messaging_Queueing_Strategies.obj" $(SOURCE)

SOURCE="ExceptionHolderC.cpp"

"$(INTDIR)\ExceptionHolderC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ExceptionHolderC.obj" $(SOURCE)

SOURCE="PollableC.cpp"

"$(INTDIR)\PollableC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\PollableC.obj" $(SOURCE)

SOURCE="Messaging_TypesC.cpp"

"$(INTDIR)\Messaging_TypesC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Messaging_TypesC.obj" $(SOURCE)

SOURCE="TAO_ExtC.cpp"

"$(INTDIR)\TAO_ExtC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\TAO_ExtC.obj" $(SOURCE)

SOURCE="Messaging_RT_PolicyC.cpp"

"$(INTDIR)\Messaging_RT_PolicyC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Messaging_RT_PolicyC.obj" $(SOURCE)

SOURCE="Messaging_SyncScope_PolicyC.cpp"

"$(INTDIR)\Messaging_SyncScope_PolicyC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Messaging_SyncScope_PolicyC.obj" $(SOURCE)

SOURCE="Messaging_No_ImplC.cpp"

"$(INTDIR)\Messaging_No_ImplC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Messaging_No_ImplC.obj" $(SOURCE)

SOURCE="MessagingC.cpp"

"$(INTDIR)\MessagingC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\MessagingC.obj" $(SOURCE)

SOURCE="MessagingS.cpp"

"$(INTDIR)\MessagingS.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\MessagingS.obj" $(SOURCE)

SOURCE="ExceptionHolderA.cpp"

"$(INTDIR)\ExceptionHolderA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\ExceptionHolderA.obj" $(SOURCE)

SOURCE="MessagingA.cpp"

"$(INTDIR)\MessagingA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\MessagingA.obj" $(SOURCE)

SOURCE="Messaging_No_ImplA.cpp"

"$(INTDIR)\Messaging_No_ImplA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Messaging_No_ImplA.obj" $(SOURCE)

SOURCE="Messaging_RT_PolicyA.cpp"

"$(INTDIR)\Messaging_RT_PolicyA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Messaging_RT_PolicyA.obj" $(SOURCE)

SOURCE="Messaging_SyncScope_PolicyA.cpp"

"$(INTDIR)\Messaging_SyncScope_PolicyA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Messaging_SyncScope_PolicyA.obj" $(SOURCE)

SOURCE="TAO_ExtA.cpp"

"$(INTDIR)\TAO_ExtA.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\TAO_ExtA.obj" $(SOURCE)

!IF  "$(CFG)" == "Win64 Debug"
!ELSEIF  "$(CFG)" == "Win64 Release"
!ELSEIF  "$(CFG)" == "Win64 Static Debug"
!ELSEIF  "$(CFG)" == "Win64 Static Release"
!ENDIF

SOURCE="TAO_Messaging.rc"

"$(INTDIR)\TAO_Messaging.res" : $(SOURCE)
	$(RSC) /l 0x409 /fo"$(INTDIR)\TAO_Messaging.res" /d NDEBUG /d WIN64 /d _CRT_SECURE_NO_WARNINGS /d _CRT_SECURE_NO_DEPRECATE /d _CRT_NONSTDC_NO_DEPRECATE /i "..\..\.." /i "..\.." $(SOURCE)



!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.Messaging.dep")
	@echo Using "Makefile.Messaging.dep"
!ELSE
	@echo Warning: cannot find "Makefile.Messaging.dep"
!ENDIF
!ENDIF

