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
!MESSAGE NMAKE /f "Makefile.AV.mak" CFG="Win64 Debug"
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

GENERATED_DIRTY = "AVStreamsC.inl" "AVStreamsS.inl" "AVStreamsC.h" "AVStreamsS.h" "AVStreamsC.cpp" "AVStreamsS.cpp" "Null_MediaCtrlC.inl" "Null_MediaCtrlS.inl" "Null_MediaCtrlC.h" "Null_MediaCtrlS.h" "Null_MediaCtrlC.cpp" "Null_MediaCtrlS.cpp" "sfpC.inl" "sfpS.inl" "sfpC.h" "sfpS.h" "sfpC.cpp" "sfpS.cpp"

!IF  "$(CFG)" == "Win64 Debug"

OUTDIR=..\..\..\lib
INTDIR=Debug\AV\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_AVd.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_HAS_QOS -DTAO_AV_BUILD_DLL -f "Makefile.AV.dep" "AVStreamsC.cpp" "AVStreamsS.cpp" "Null_MediaCtrlC.cpp" "Null_MediaCtrlS.cpp" "sfpC.cpp" "sfpS.cpp" "AV\AVStreams_i.cpp" "AV\AV_Core.cpp" "AV\Endpoint_Strategy.cpp" "AV\Fill_ACE_QoS.cpp" "AV\FlowSpec_Entry.cpp" "AV\MCast.cpp" "AV\md5c.cpp" "AV\Policy.cpp" "AV\Protocol_Factory.cpp" "AV\QoS_UDP.cpp" "AV\RTCP.cpp" "AV\RTCP_Channel.cpp" "AV\RTCP_Packet.cpp" "AV\RTP.cpp" "AV\TCP.cpp" "AV\Transport.cpp" "AV\UDP.cpp" "AV\default_resource.cpp" "AV\media_timer.cpp" "AV\sfp.cpp" "AV\SCTP_SEQ.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_AVd.pdb"
	-@del /f/q "..\..\..\lib\TAO_AVd.dll"
	-@del /f/q "$(OUTDIR)\TAO_AVd.lib"
	-@del /f/q "$(OUTDIR)\TAO_AVd.exp"
	-@del /f/q "$(OUTDIR)\TAO_AVd.ilk"
	-@del /f/q "AVStreamsC.inl"
	-@del /f/q "AVStreamsS.inl"
	-@del /f/q "AVStreamsC.h"
	-@del /f/q "AVStreamsS.h"
	-@del /f/q "AVStreamsC.cpp"
	-@del /f/q "AVStreamsS.cpp"
	-@del /f/q "Null_MediaCtrlC.inl"
	-@del /f/q "Null_MediaCtrlS.inl"
	-@del /f/q "Null_MediaCtrlC.h"
	-@del /f/q "Null_MediaCtrlS.h"
	-@del /f/q "Null_MediaCtrlC.cpp"
	-@del /f/q "Null_MediaCtrlS.cpp"
	-@del /f/q "sfpC.inl"
	-@del /f/q "sfpS.inl"
	-@del /f/q "sfpC.h"
	-@del /f/q "sfpS.h"
	-@del /f/q "sfpC.cpp"
	-@del /f/q "sfpS.cpp"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\AV\$(NULL)" mkdir "Debug\AV"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_HAS_QOS /D TAO_AV_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_CosPropertyd.lib TAO_PortableServerd.lib TAO_CosProperty_Skeld.lib TAO_CosProperty_Servd.lib TAO_CosNamingd.lib ACE_QoSd.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\..\lib\TAO_AVd.pdb" /machine:IA64 /out:"..\..\..\lib\TAO_AVd.dll" /implib:"$(OUTDIR)\TAO_AVd.lib"
LINK32_OBJS= \
	"$(INTDIR)\AV.res" \
	"$(INTDIR)\AVStreamsC.obj" \
	"$(INTDIR)\AVStreamsS.obj" \
	"$(INTDIR)\Null_MediaCtrlC.obj" \
	"$(INTDIR)\Null_MediaCtrlS.obj" \
	"$(INTDIR)\sfpC.obj" \
	"$(INTDIR)\sfpS.obj" \
	"$(INTDIR)\AV\AVStreams_i.obj" \
	"$(INTDIR)\AV\AV_Core.obj" \
	"$(INTDIR)\AV\Endpoint_Strategy.obj" \
	"$(INTDIR)\AV\Fill_ACE_QoS.obj" \
	"$(INTDIR)\AV\FlowSpec_Entry.obj" \
	"$(INTDIR)\AV\MCast.obj" \
	"$(INTDIR)\AV\md5c.obj" \
	"$(INTDIR)\AV\Policy.obj" \
	"$(INTDIR)\AV\Protocol_Factory.obj" \
	"$(INTDIR)\AV\QoS_UDP.obj" \
	"$(INTDIR)\AV\RTCP.obj" \
	"$(INTDIR)\AV\RTCP_Channel.obj" \
	"$(INTDIR)\AV\RTCP_Packet.obj" \
	"$(INTDIR)\AV\RTP.obj" \
	"$(INTDIR)\AV\TCP.obj" \
	"$(INTDIR)\AV\Transport.obj" \
	"$(INTDIR)\AV\UDP.obj" \
	"$(INTDIR)\AV\default_resource.obj" \
	"$(INTDIR)\AV\media_timer.obj" \
	"$(INTDIR)\AV\sfp.obj" \
	"$(INTDIR)\AV\SCTP_SEQ.obj"

"..\..\..\lib\TAO_AVd.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_AVd.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_AVd.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\AV\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_AV.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_HAS_QOS -DTAO_AV_BUILD_DLL -f "Makefile.AV.dep" "AVStreamsC.cpp" "AVStreamsS.cpp" "Null_MediaCtrlC.cpp" "Null_MediaCtrlS.cpp" "sfpC.cpp" "sfpS.cpp" "AV\AVStreams_i.cpp" "AV\AV_Core.cpp" "AV\Endpoint_Strategy.cpp" "AV\Fill_ACE_QoS.cpp" "AV\FlowSpec_Entry.cpp" "AV\MCast.cpp" "AV\md5c.cpp" "AV\Policy.cpp" "AV\Protocol_Factory.cpp" "AV\QoS_UDP.cpp" "AV\RTCP.cpp" "AV\RTCP_Channel.cpp" "AV\RTCP_Packet.cpp" "AV\RTP.cpp" "AV\TCP.cpp" "AV\Transport.cpp" "AV\UDP.cpp" "AV\default_resource.cpp" "AV\media_timer.cpp" "AV\sfp.cpp" "AV\SCTP_SEQ.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\TAO_AV.dll"
	-@del /f/q "$(OUTDIR)\TAO_AV.lib"
	-@del /f/q "$(OUTDIR)\TAO_AV.exp"
	-@del /f/q "$(OUTDIR)\TAO_AV.ilk"
	-@del /f/q "AVStreamsC.inl"
	-@del /f/q "AVStreamsS.inl"
	-@del /f/q "AVStreamsC.h"
	-@del /f/q "AVStreamsS.h"
	-@del /f/q "AVStreamsC.cpp"
	-@del /f/q "AVStreamsS.cpp"
	-@del /f/q "Null_MediaCtrlC.inl"
	-@del /f/q "Null_MediaCtrlS.inl"
	-@del /f/q "Null_MediaCtrlC.h"
	-@del /f/q "Null_MediaCtrlS.h"
	-@del /f/q "Null_MediaCtrlC.cpp"
	-@del /f/q "Null_MediaCtrlS.cpp"
	-@del /f/q "sfpC.inl"
	-@del /f/q "sfpS.inl"
	-@del /f/q "sfpC.h"
	-@del /f/q "sfpS.h"
	-@del /f/q "sfpC.cpp"
	-@del /f/q "sfpS.cpp"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\AV\$(NULL)" mkdir "Release\AV"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_HAS_QOS /D TAO_AV_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_CosProperty.lib TAO_PortableServer.lib TAO_CosProperty_Skel.lib TAO_CosProperty_Serv.lib TAO_CosNaming.lib ACE_QoS.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\..\lib\TAO_AV.dll" /implib:"$(OUTDIR)\TAO_AV.lib"
LINK32_OBJS= \
	"$(INTDIR)\AV.res" \
	"$(INTDIR)\AVStreamsC.obj" \
	"$(INTDIR)\AVStreamsS.obj" \
	"$(INTDIR)\Null_MediaCtrlC.obj" \
	"$(INTDIR)\Null_MediaCtrlS.obj" \
	"$(INTDIR)\sfpC.obj" \
	"$(INTDIR)\sfpS.obj" \
	"$(INTDIR)\AV\AVStreams_i.obj" \
	"$(INTDIR)\AV\AV_Core.obj" \
	"$(INTDIR)\AV\Endpoint_Strategy.obj" \
	"$(INTDIR)\AV\Fill_ACE_QoS.obj" \
	"$(INTDIR)\AV\FlowSpec_Entry.obj" \
	"$(INTDIR)\AV\MCast.obj" \
	"$(INTDIR)\AV\md5c.obj" \
	"$(INTDIR)\AV\Policy.obj" \
	"$(INTDIR)\AV\Protocol_Factory.obj" \
	"$(INTDIR)\AV\QoS_UDP.obj" \
	"$(INTDIR)\AV\RTCP.obj" \
	"$(INTDIR)\AV\RTCP_Channel.obj" \
	"$(INTDIR)\AV\RTCP_Packet.obj" \
	"$(INTDIR)\AV\RTP.obj" \
	"$(INTDIR)\AV\TCP.obj" \
	"$(INTDIR)\AV\Transport.obj" \
	"$(INTDIR)\AV\UDP.obj" \
	"$(INTDIR)\AV\default_resource.obj" \
	"$(INTDIR)\AV\media_timer.obj" \
	"$(INTDIR)\AV\sfp.obj" \
	"$(INTDIR)\AV\SCTP_SEQ.obj"

"..\..\..\lib\TAO_AV.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_AV.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_AV.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\AV\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_AVsd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_HAS_QOS -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.AV.dep" "AVStreamsC.cpp" "AVStreamsS.cpp" "Null_MediaCtrlC.cpp" "Null_MediaCtrlS.cpp" "sfpC.cpp" "sfpS.cpp" "AV\AVStreams_i.cpp" "AV\AV_Core.cpp" "AV\Endpoint_Strategy.cpp" "AV\Fill_ACE_QoS.cpp" "AV\FlowSpec_Entry.cpp" "AV\MCast.cpp" "AV\md5c.cpp" "AV\Policy.cpp" "AV\Protocol_Factory.cpp" "AV\QoS_UDP.cpp" "AV\RTCP.cpp" "AV\RTCP_Channel.cpp" "AV\RTCP_Packet.cpp" "AV\RTP.cpp" "AV\TCP.cpp" "AV\Transport.cpp" "AV\UDP.cpp" "AV\default_resource.cpp" "AV\media_timer.cpp" "AV\sfp.cpp" "AV\SCTP_SEQ.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_AVsd.lib"
	-@del /f/q "$(OUTDIR)\TAO_AVsd.exp"
	-@del /f/q "$(OUTDIR)\TAO_AVsd.ilk"
	-@del /f/q "..\..\..\lib\TAO_AVsd.pdb"
	-@del /f/q "AVStreamsC.inl"
	-@del /f/q "AVStreamsS.inl"
	-@del /f/q "AVStreamsC.h"
	-@del /f/q "AVStreamsS.h"
	-@del /f/q "AVStreamsC.cpp"
	-@del /f/q "AVStreamsS.cpp"
	-@del /f/q "Null_MediaCtrlC.inl"
	-@del /f/q "Null_MediaCtrlS.inl"
	-@del /f/q "Null_MediaCtrlC.h"
	-@del /f/q "Null_MediaCtrlS.h"
	-@del /f/q "Null_MediaCtrlC.cpp"
	-@del /f/q "Null_MediaCtrlS.cpp"
	-@del /f/q "sfpC.inl"
	-@del /f/q "sfpS.inl"
	-@del /f/q "sfpC.h"
	-@del /f/q "sfpS.h"
	-@del /f/q "sfpC.cpp"
	-@del /f/q "sfpS.cpp"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\AV\$(NULL)" mkdir "Static_Debug\AV"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\TAO_AVsd.pdb" /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_HAS_QOS /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_AVsd.lib"
LINK32_OBJS= \
	"$(INTDIR)\AVStreamsC.obj" \
	"$(INTDIR)\AVStreamsS.obj" \
	"$(INTDIR)\Null_MediaCtrlC.obj" \
	"$(INTDIR)\Null_MediaCtrlS.obj" \
	"$(INTDIR)\sfpC.obj" \
	"$(INTDIR)\sfpS.obj" \
	"$(INTDIR)\AV\AVStreams_i.obj" \
	"$(INTDIR)\AV\AV_Core.obj" \
	"$(INTDIR)\AV\Endpoint_Strategy.obj" \
	"$(INTDIR)\AV\Fill_ACE_QoS.obj" \
	"$(INTDIR)\AV\FlowSpec_Entry.obj" \
	"$(INTDIR)\AV\MCast.obj" \
	"$(INTDIR)\AV\md5c.obj" \
	"$(INTDIR)\AV\Policy.obj" \
	"$(INTDIR)\AV\Protocol_Factory.obj" \
	"$(INTDIR)\AV\QoS_UDP.obj" \
	"$(INTDIR)\AV\RTCP.obj" \
	"$(INTDIR)\AV\RTCP_Channel.obj" \
	"$(INTDIR)\AV\RTCP_Packet.obj" \
	"$(INTDIR)\AV\RTP.obj" \
	"$(INTDIR)\AV\TCP.obj" \
	"$(INTDIR)\AV\Transport.obj" \
	"$(INTDIR)\AV\UDP.obj" \
	"$(INTDIR)\AV\default_resource.obj" \
	"$(INTDIR)\AV\media_timer.obj" \
	"$(INTDIR)\AV\sfp.obj" \
	"$(INTDIR)\AV\SCTP_SEQ.obj"

"$(OUTDIR)\TAO_AVsd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_AVsd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_AVsd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\AV\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_AVs.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_HAS_QOS -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.AV.dep" "AVStreamsC.cpp" "AVStreamsS.cpp" "Null_MediaCtrlC.cpp" "Null_MediaCtrlS.cpp" "sfpC.cpp" "sfpS.cpp" "AV\AVStreams_i.cpp" "AV\AV_Core.cpp" "AV\Endpoint_Strategy.cpp" "AV\Fill_ACE_QoS.cpp" "AV\FlowSpec_Entry.cpp" "AV\MCast.cpp" "AV\md5c.cpp" "AV\Policy.cpp" "AV\Protocol_Factory.cpp" "AV\QoS_UDP.cpp" "AV\RTCP.cpp" "AV\RTCP_Channel.cpp" "AV\RTCP_Packet.cpp" "AV\RTP.cpp" "AV\TCP.cpp" "AV\Transport.cpp" "AV\UDP.cpp" "AV\default_resource.cpp" "AV\media_timer.cpp" "AV\sfp.cpp" "AV\SCTP_SEQ.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_AVs.lib"
	-@del /f/q "$(OUTDIR)\TAO_AVs.exp"
	-@del /f/q "$(OUTDIR)\TAO_AVs.ilk"
	-@del /f/q "AVStreamsC.inl"
	-@del /f/q "AVStreamsS.inl"
	-@del /f/q "AVStreamsC.h"
	-@del /f/q "AVStreamsS.h"
	-@del /f/q "AVStreamsC.cpp"
	-@del /f/q "AVStreamsS.cpp"
	-@del /f/q "Null_MediaCtrlC.inl"
	-@del /f/q "Null_MediaCtrlS.inl"
	-@del /f/q "Null_MediaCtrlC.h"
	-@del /f/q "Null_MediaCtrlS.h"
	-@del /f/q "Null_MediaCtrlC.cpp"
	-@del /f/q "Null_MediaCtrlS.cpp"
	-@del /f/q "sfpC.inl"
	-@del /f/q "sfpS.inl"
	-@del /f/q "sfpC.h"
	-@del /f/q "sfpS.h"
	-@del /f/q "sfpC.cpp"
	-@del /f/q "sfpS.cpp"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\AV\$(NULL)" mkdir "Static_Release\AV"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_HAS_QOS /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_AVs.lib"
LINK32_OBJS= \
	"$(INTDIR)\AVStreamsC.obj" \
	"$(INTDIR)\AVStreamsS.obj" \
	"$(INTDIR)\Null_MediaCtrlC.obj" \
	"$(INTDIR)\Null_MediaCtrlS.obj" \
	"$(INTDIR)\sfpC.obj" \
	"$(INTDIR)\sfpS.obj" \
	"$(INTDIR)\AV\AVStreams_i.obj" \
	"$(INTDIR)\AV\AV_Core.obj" \
	"$(INTDIR)\AV\Endpoint_Strategy.obj" \
	"$(INTDIR)\AV\Fill_ACE_QoS.obj" \
	"$(INTDIR)\AV\FlowSpec_Entry.obj" \
	"$(INTDIR)\AV\MCast.obj" \
	"$(INTDIR)\AV\md5c.obj" \
	"$(INTDIR)\AV\Policy.obj" \
	"$(INTDIR)\AV\Protocol_Factory.obj" \
	"$(INTDIR)\AV\QoS_UDP.obj" \
	"$(INTDIR)\AV\RTCP.obj" \
	"$(INTDIR)\AV\RTCP_Channel.obj" \
	"$(INTDIR)\AV\RTCP_Packet.obj" \
	"$(INTDIR)\AV\RTP.obj" \
	"$(INTDIR)\AV\TCP.obj" \
	"$(INTDIR)\AV\Transport.obj" \
	"$(INTDIR)\AV\UDP.obj" \
	"$(INTDIR)\AV\default_resource.obj" \
	"$(INTDIR)\AV\media_timer.obj" \
	"$(INTDIR)\AV\sfp.obj" \
	"$(INTDIR)\AV\SCTP_SEQ.obj"

"$(OUTDIR)\TAO_AVs.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_AVs.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_AVs.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.AV.dep")
!INCLUDE "Makefile.AV.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="AVStreamsC.cpp"

"$(INTDIR)\AVStreamsC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\AVStreamsC.obj" $(SOURCE)

SOURCE="AVStreamsS.cpp"

"$(INTDIR)\AVStreamsS.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\AVStreamsS.obj" $(SOURCE)

SOURCE="Null_MediaCtrlC.cpp"

"$(INTDIR)\Null_MediaCtrlC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Null_MediaCtrlC.obj" $(SOURCE)

SOURCE="Null_MediaCtrlS.cpp"

"$(INTDIR)\Null_MediaCtrlS.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\Null_MediaCtrlS.obj" $(SOURCE)

SOURCE="sfpC.cpp"

"$(INTDIR)\sfpC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\sfpC.obj" $(SOURCE)

SOURCE="sfpS.cpp"

"$(INTDIR)\sfpS.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\sfpS.obj" $(SOURCE)

SOURCE="AV\AVStreams_i.cpp"

"$(INTDIR)\AV\AVStreams_i.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\AV\$(NULL)" mkdir "$(INTDIR)\AV\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\AV\AVStreams_i.obj" $(SOURCE)

SOURCE="AV\AV_Core.cpp"

"$(INTDIR)\AV\AV_Core.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\AV\$(NULL)" mkdir "$(INTDIR)\AV\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\AV\AV_Core.obj" $(SOURCE)

SOURCE="AV\Endpoint_Strategy.cpp"

"$(INTDIR)\AV\Endpoint_Strategy.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\AV\$(NULL)" mkdir "$(INTDIR)\AV\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\AV\Endpoint_Strategy.obj" $(SOURCE)

SOURCE="AV\Fill_ACE_QoS.cpp"

"$(INTDIR)\AV\Fill_ACE_QoS.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\AV\$(NULL)" mkdir "$(INTDIR)\AV\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\AV\Fill_ACE_QoS.obj" $(SOURCE)

SOURCE="AV\FlowSpec_Entry.cpp"

"$(INTDIR)\AV\FlowSpec_Entry.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\AV\$(NULL)" mkdir "$(INTDIR)\AV\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\AV\FlowSpec_Entry.obj" $(SOURCE)

SOURCE="AV\MCast.cpp"

"$(INTDIR)\AV\MCast.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\AV\$(NULL)" mkdir "$(INTDIR)\AV\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\AV\MCast.obj" $(SOURCE)

SOURCE="AV\md5c.cpp"

"$(INTDIR)\AV\md5c.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\AV\$(NULL)" mkdir "$(INTDIR)\AV\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\AV\md5c.obj" $(SOURCE)

SOURCE="AV\Policy.cpp"

"$(INTDIR)\AV\Policy.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\AV\$(NULL)" mkdir "$(INTDIR)\AV\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\AV\Policy.obj" $(SOURCE)

SOURCE="AV\Protocol_Factory.cpp"

"$(INTDIR)\AV\Protocol_Factory.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\AV\$(NULL)" mkdir "$(INTDIR)\AV\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\AV\Protocol_Factory.obj" $(SOURCE)

SOURCE="AV\QoS_UDP.cpp"

"$(INTDIR)\AV\QoS_UDP.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\AV\$(NULL)" mkdir "$(INTDIR)\AV\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\AV\QoS_UDP.obj" $(SOURCE)

SOURCE="AV\RTCP.cpp"

"$(INTDIR)\AV\RTCP.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\AV\$(NULL)" mkdir "$(INTDIR)\AV\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\AV\RTCP.obj" $(SOURCE)

SOURCE="AV\RTCP_Channel.cpp"

"$(INTDIR)\AV\RTCP_Channel.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\AV\$(NULL)" mkdir "$(INTDIR)\AV\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\AV\RTCP_Channel.obj" $(SOURCE)

SOURCE="AV\RTCP_Packet.cpp"

"$(INTDIR)\AV\RTCP_Packet.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\AV\$(NULL)" mkdir "$(INTDIR)\AV\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\AV\RTCP_Packet.obj" $(SOURCE)

SOURCE="AV\RTP.cpp"

"$(INTDIR)\AV\RTP.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\AV\$(NULL)" mkdir "$(INTDIR)\AV\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\AV\RTP.obj" $(SOURCE)

SOURCE="AV\TCP.cpp"

"$(INTDIR)\AV\TCP.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\AV\$(NULL)" mkdir "$(INTDIR)\AV\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\AV\TCP.obj" $(SOURCE)

SOURCE="AV\Transport.cpp"

"$(INTDIR)\AV\Transport.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\AV\$(NULL)" mkdir "$(INTDIR)\AV\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\AV\Transport.obj" $(SOURCE)

SOURCE="AV\UDP.cpp"

"$(INTDIR)\AV\UDP.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\AV\$(NULL)" mkdir "$(INTDIR)\AV\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\AV\UDP.obj" $(SOURCE)

SOURCE="AV\default_resource.cpp"

"$(INTDIR)\AV\default_resource.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\AV\$(NULL)" mkdir "$(INTDIR)\AV\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\AV\default_resource.obj" $(SOURCE)

SOURCE="AV\media_timer.cpp"

"$(INTDIR)\AV\media_timer.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\AV\$(NULL)" mkdir "$(INTDIR)\AV\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\AV\media_timer.obj" $(SOURCE)

SOURCE="AV\sfp.cpp"

"$(INTDIR)\AV\sfp.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\AV\$(NULL)" mkdir "$(INTDIR)\AV\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\AV\sfp.obj" $(SOURCE)

SOURCE="AV\SCTP_SEQ.cpp"

"$(INTDIR)\AV\SCTP_SEQ.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\AV\$(NULL)" mkdir "$(INTDIR)\AV\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\AV\SCTP_SEQ.obj" $(SOURCE)

!IF  "$(CFG)" == "Win64 Debug"
SOURCE="AVStreams.idl"

InputPath=AVStreams.idl

"AVStreamsC.inl" "AVStreamsS.inl" "AVStreamsC.h" "AVStreamsS.h" "AVStreamsC.cpp" "AVStreamsS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-AVStreams_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_AV_Export -Wb,export_include=orbsvcs/AV/AV_export.h "$(InputPath)"
<<

SOURCE="Null_MediaCtrl.idl"

InputPath=Null_MediaCtrl.idl

"Null_MediaCtrlC.inl" "Null_MediaCtrlS.inl" "Null_MediaCtrlC.h" "Null_MediaCtrlS.h" "Null_MediaCtrlC.cpp" "Null_MediaCtrlS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-Null_MediaCtrl_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_AV_Export -Wb,export_include=orbsvcs/AV/AV_export.h "$(InputPath)"
<<

SOURCE="sfp.idl"

InputPath=sfp.idl

"sfpC.inl" "sfpS.inl" "sfpC.h" "sfpS.h" "sfpC.cpp" "sfpS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-sfp_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_AV_Export -Wb,export_include=orbsvcs/AV/AV_export.h "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Release"
SOURCE="AVStreams.idl"

InputPath=AVStreams.idl

"AVStreamsC.inl" "AVStreamsS.inl" "AVStreamsC.h" "AVStreamsS.h" "AVStreamsC.cpp" "AVStreamsS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-AVStreams_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_AV_Export -Wb,export_include=orbsvcs/AV/AV_export.h "$(InputPath)"
<<

SOURCE="Null_MediaCtrl.idl"

InputPath=Null_MediaCtrl.idl

"Null_MediaCtrlC.inl" "Null_MediaCtrlS.inl" "Null_MediaCtrlC.h" "Null_MediaCtrlS.h" "Null_MediaCtrlC.cpp" "Null_MediaCtrlS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-Null_MediaCtrl_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_AV_Export -Wb,export_include=orbsvcs/AV/AV_export.h "$(InputPath)"
<<

SOURCE="sfp.idl"

InputPath=sfp.idl

"sfpC.inl" "sfpS.inl" "sfpC.h" "sfpS.h" "sfpC.cpp" "sfpS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-sfp_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_AV_Export -Wb,export_include=orbsvcs/AV/AV_export.h "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Debug"
SOURCE="AVStreams.idl"

InputPath=AVStreams.idl

"AVStreamsC.inl" "AVStreamsS.inl" "AVStreamsC.h" "AVStreamsS.h" "AVStreamsC.cpp" "AVStreamsS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-AVStreams_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_AV_Export -Wb,export_include=orbsvcs/AV/AV_export.h "$(InputPath)"
<<

SOURCE="Null_MediaCtrl.idl"

InputPath=Null_MediaCtrl.idl

"Null_MediaCtrlC.inl" "Null_MediaCtrlS.inl" "Null_MediaCtrlC.h" "Null_MediaCtrlS.h" "Null_MediaCtrlC.cpp" "Null_MediaCtrlS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-Null_MediaCtrl_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_AV_Export -Wb,export_include=orbsvcs/AV/AV_export.h "$(InputPath)"
<<

SOURCE="sfp.idl"

InputPath=sfp.idl

"sfpC.inl" "sfpS.inl" "sfpC.h" "sfpS.h" "sfpC.cpp" "sfpS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-sfp_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_AV_Export -Wb,export_include=orbsvcs/AV/AV_export.h "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Release"
SOURCE="AVStreams.idl"

InputPath=AVStreams.idl

"AVStreamsC.inl" "AVStreamsS.inl" "AVStreamsC.h" "AVStreamsS.h" "AVStreamsC.cpp" "AVStreamsS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-AVStreams_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_AV_Export -Wb,export_include=orbsvcs/AV/AV_export.h "$(InputPath)"
<<

SOURCE="Null_MediaCtrl.idl"

InputPath=Null_MediaCtrl.idl

"Null_MediaCtrlC.inl" "Null_MediaCtrlS.inl" "Null_MediaCtrlC.h" "Null_MediaCtrlS.h" "Null_MediaCtrlC.cpp" "Null_MediaCtrlS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-Null_MediaCtrl_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_AV_Export -Wb,export_include=orbsvcs/AV/AV_export.h "$(InputPath)"
<<

SOURCE="sfp.idl"

InputPath=sfp.idl

"sfpC.inl" "sfpS.inl" "sfpC.h" "sfpS.h" "sfpC.cpp" "sfpS.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-sfp_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=TAO_AV_Export -Wb,export_include=orbsvcs/AV/AV_export.h "$(InputPath)"
<<

!ENDIF

SOURCE="AV.rc"

"$(INTDIR)\AV.res" : $(SOURCE)
	$(RSC) /l 0x409 /fo"$(INTDIR)\AV.res" /d NDEBUG /d WIN64 /d _CRT_SECURE_NO_WARNINGS /d _CRT_SECURE_NO_DEPRECATE /d _CRT_NONSTDC_NO_DEPRECATE /d ACE_HAS_QOS /i "..\..\.." /i "..\.." /i "..\..\orbsvcs" $(SOURCE)



!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.AV.dep")
	@echo Using "Makefile.AV.dep"
!ELSE
	@echo Warning: cannot find "Makefile.AV.dep"
!ENDIF
!ENDIF

