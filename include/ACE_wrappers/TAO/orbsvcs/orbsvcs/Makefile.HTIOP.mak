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
!MESSAGE NMAKE /f "Makefile.HTIOP.mak" CFG="Win64 Debug"
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

GENERATED_DIRTY = "HTIOPC.inl" "HTIOPC.h" "HTIOPS.h" "HTIOPC.cpp" "HTIOP\htiop_endpointsC.h" "HTIOP\htiop_endpointsS.h" "HTIOP\htiop_endpointsC.cpp"

!IF  "$(CFG)" == "Win64 Debug"

OUTDIR=..\..\..\lib
INTDIR=Debug\HTIOP\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_HTIOPd.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\..\..\protocols" -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DHTIOP_BUILD_DLL -f "Makefile.HTIOP.dep" "HTIOPC.cpp" "HTIOP\htiop_endpointsC.cpp" "HTIOP\HTIOP_Profile.cpp" "HTIOP\HTIOP_Factory.cpp" "HTIOP\HTIOP_Connector_Impl.cpp" "HTIOP\HTIOP_Transport.cpp" "HTIOP\HTIOP_Endpoint.cpp" "HTIOP\HTIOP_Completion_Handler.cpp" "HTIOP\HTIOP_Acceptor_Impl.cpp" "HTIOP\HTIOP_Connection_Handler.cpp" "HTIOP\HTIOP_Connector.cpp" "HTIOP\HTIOP_Acceptor.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_HTIOPd.pdb"
	-@del /f/q "..\..\..\lib\TAO_HTIOPd.dll"
	-@del /f/q "$(OUTDIR)\TAO_HTIOPd.lib"
	-@del /f/q "$(OUTDIR)\TAO_HTIOPd.exp"
	-@del /f/q "$(OUTDIR)\TAO_HTIOPd.ilk"
	-@del /f/q "HTIOPC.inl"
	-@del /f/q "HTIOPC.h"
	-@del /f/q "HTIOPS.h"
	-@del /f/q "HTIOPC.cpp"
	-@del /f/q "HTIOP\htiop_endpointsC.h"
	-@del /f/q "HTIOP\htiop_endpointsS.h"
	-@del /f/q "HTIOP\htiop_endpointsC.cpp"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\HTIOP\$(NULL)" mkdir "Debug\HTIOP"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\..\..\protocols" /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D HTIOP_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib ACE_HTBPd.lib TAOd.lib TAO_AnyTypeCoded.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\..\lib\TAO_HTIOPd.pdb" /machine:IA64 /out:"..\..\..\lib\TAO_HTIOPd.dll" /implib:"$(OUTDIR)\TAO_HTIOPd.lib"
LINK32_OBJS= \
	"$(INTDIR)\HTIOPC.obj" \
	"$(INTDIR)\HTIOP\htiop_endpointsC.obj" \
	"$(INTDIR)\HTIOP\HTIOP_Profile.obj" \
	"$(INTDIR)\HTIOP\HTIOP_Factory.obj" \
	"$(INTDIR)\HTIOP\HTIOP_Connector_Impl.obj" \
	"$(INTDIR)\HTIOP\HTIOP_Transport.obj" \
	"$(INTDIR)\HTIOP\HTIOP_Endpoint.obj" \
	"$(INTDIR)\HTIOP\HTIOP_Completion_Handler.obj" \
	"$(INTDIR)\HTIOP\HTIOP_Acceptor_Impl.obj" \
	"$(INTDIR)\HTIOP\HTIOP_Connection_Handler.obj" \
	"$(INTDIR)\HTIOP\HTIOP_Connector.obj" \
	"$(INTDIR)\HTIOP\HTIOP_Acceptor.obj"

"..\..\..\lib\TAO_HTIOPd.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_HTIOPd.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_HTIOPd.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\HTIOP\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_HTIOP.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\..\..\protocols" -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DHTIOP_BUILD_DLL -f "Makefile.HTIOP.dep" "HTIOPC.cpp" "HTIOP\htiop_endpointsC.cpp" "HTIOP\HTIOP_Profile.cpp" "HTIOP\HTIOP_Factory.cpp" "HTIOP\HTIOP_Connector_Impl.cpp" "HTIOP\HTIOP_Transport.cpp" "HTIOP\HTIOP_Endpoint.cpp" "HTIOP\HTIOP_Completion_Handler.cpp" "HTIOP\HTIOP_Acceptor_Impl.cpp" "HTIOP\HTIOP_Connection_Handler.cpp" "HTIOP\HTIOP_Connector.cpp" "HTIOP\HTIOP_Acceptor.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\TAO_HTIOP.dll"
	-@del /f/q "$(OUTDIR)\TAO_HTIOP.lib"
	-@del /f/q "$(OUTDIR)\TAO_HTIOP.exp"
	-@del /f/q "$(OUTDIR)\TAO_HTIOP.ilk"
	-@del /f/q "HTIOPC.inl"
	-@del /f/q "HTIOPC.h"
	-@del /f/q "HTIOPS.h"
	-@del /f/q "HTIOPC.cpp"
	-@del /f/q "HTIOP\htiop_endpointsC.h"
	-@del /f/q "HTIOP\htiop_endpointsS.h"
	-@del /f/q "HTIOP\htiop_endpointsC.cpp"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\HTIOP\$(NULL)" mkdir "Release\HTIOP"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\..\..\protocols" /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D HTIOP_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib ACE_HTBP.lib TAO.lib TAO_AnyTypeCode.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\..\lib\TAO_HTIOP.dll" /implib:"$(OUTDIR)\TAO_HTIOP.lib"
LINK32_OBJS= \
	"$(INTDIR)\HTIOPC.obj" \
	"$(INTDIR)\HTIOP\htiop_endpointsC.obj" \
	"$(INTDIR)\HTIOP\HTIOP_Profile.obj" \
	"$(INTDIR)\HTIOP\HTIOP_Factory.obj" \
	"$(INTDIR)\HTIOP\HTIOP_Connector_Impl.obj" \
	"$(INTDIR)\HTIOP\HTIOP_Transport.obj" \
	"$(INTDIR)\HTIOP\HTIOP_Endpoint.obj" \
	"$(INTDIR)\HTIOP\HTIOP_Completion_Handler.obj" \
	"$(INTDIR)\HTIOP\HTIOP_Acceptor_Impl.obj" \
	"$(INTDIR)\HTIOP\HTIOP_Connection_Handler.obj" \
	"$(INTDIR)\HTIOP\HTIOP_Connector.obj" \
	"$(INTDIR)\HTIOP\HTIOP_Acceptor.obj"

"..\..\..\lib\TAO_HTIOP.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_HTIOP.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_HTIOP.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\HTIOP\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_HTIOPsd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\..\..\protocols" -I"..\.." -I"..\..\orbsvcs" -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.HTIOP.dep" "HTIOPC.cpp" "HTIOP\htiop_endpointsC.cpp" "HTIOP\HTIOP_Profile.cpp" "HTIOP\HTIOP_Factory.cpp" "HTIOP\HTIOP_Connector_Impl.cpp" "HTIOP\HTIOP_Transport.cpp" "HTIOP\HTIOP_Endpoint.cpp" "HTIOP\HTIOP_Completion_Handler.cpp" "HTIOP\HTIOP_Acceptor_Impl.cpp" "HTIOP\HTIOP_Connection_Handler.cpp" "HTIOP\HTIOP_Connector.cpp" "HTIOP\HTIOP_Acceptor.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_HTIOPsd.lib"
	-@del /f/q "$(OUTDIR)\TAO_HTIOPsd.exp"
	-@del /f/q "$(OUTDIR)\TAO_HTIOPsd.ilk"
	-@del /f/q "..\..\..\lib\TAO_HTIOPsd.pdb"
	-@del /f/q "HTIOPC.inl"
	-@del /f/q "HTIOPC.h"
	-@del /f/q "HTIOPS.h"
	-@del /f/q "HTIOPC.cpp"
	-@del /f/q "HTIOP\htiop_endpointsC.h"
	-@del /f/q "HTIOP\htiop_endpointsS.h"
	-@del /f/q "HTIOP\htiop_endpointsC.cpp"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\HTIOP\$(NULL)" mkdir "Static_Debug\HTIOP"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\TAO_HTIOPsd.pdb" /I "..\..\.." /I "..\..\..\protocols" /I "..\.." /I "..\..\orbsvcs" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_HTIOPsd.lib"
LINK32_OBJS= \
	"$(INTDIR)\HTIOPC.obj" \
	"$(INTDIR)\HTIOP\htiop_endpointsC.obj" \
	"$(INTDIR)\HTIOP\HTIOP_Profile.obj" \
	"$(INTDIR)\HTIOP\HTIOP_Factory.obj" \
	"$(INTDIR)\HTIOP\HTIOP_Connector_Impl.obj" \
	"$(INTDIR)\HTIOP\HTIOP_Transport.obj" \
	"$(INTDIR)\HTIOP\HTIOP_Endpoint.obj" \
	"$(INTDIR)\HTIOP\HTIOP_Completion_Handler.obj" \
	"$(INTDIR)\HTIOP\HTIOP_Acceptor_Impl.obj" \
	"$(INTDIR)\HTIOP\HTIOP_Connection_Handler.obj" \
	"$(INTDIR)\HTIOP\HTIOP_Connector.obj" \
	"$(INTDIR)\HTIOP\HTIOP_Acceptor.obj"

"$(OUTDIR)\TAO_HTIOPsd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_HTIOPsd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_HTIOPsd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\HTIOP\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_HTIOPs.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\..\..\protocols" -I"..\.." -I"..\..\orbsvcs" -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.HTIOP.dep" "HTIOPC.cpp" "HTIOP\htiop_endpointsC.cpp" "HTIOP\HTIOP_Profile.cpp" "HTIOP\HTIOP_Factory.cpp" "HTIOP\HTIOP_Connector_Impl.cpp" "HTIOP\HTIOP_Transport.cpp" "HTIOP\HTIOP_Endpoint.cpp" "HTIOP\HTIOP_Completion_Handler.cpp" "HTIOP\HTIOP_Acceptor_Impl.cpp" "HTIOP\HTIOP_Connection_Handler.cpp" "HTIOP\HTIOP_Connector.cpp" "HTIOP\HTIOP_Acceptor.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_HTIOPs.lib"
	-@del /f/q "$(OUTDIR)\TAO_HTIOPs.exp"
	-@del /f/q "$(OUTDIR)\TAO_HTIOPs.ilk"
	-@del /f/q "HTIOPC.inl"
	-@del /f/q "HTIOPC.h"
	-@del /f/q "HTIOPS.h"
	-@del /f/q "HTIOPC.cpp"
	-@del /f/q "HTIOP\htiop_endpointsC.h"
	-@del /f/q "HTIOP\htiop_endpointsS.h"
	-@del /f/q "HTIOP\htiop_endpointsC.cpp"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\HTIOP\$(NULL)" mkdir "Static_Release\HTIOP"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\..\..\protocols" /I "..\.." /I "..\..\orbsvcs" /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_HTIOPs.lib"
LINK32_OBJS= \
	"$(INTDIR)\HTIOPC.obj" \
	"$(INTDIR)\HTIOP\htiop_endpointsC.obj" \
	"$(INTDIR)\HTIOP\HTIOP_Profile.obj" \
	"$(INTDIR)\HTIOP\HTIOP_Factory.obj" \
	"$(INTDIR)\HTIOP\HTIOP_Connector_Impl.obj" \
	"$(INTDIR)\HTIOP\HTIOP_Transport.obj" \
	"$(INTDIR)\HTIOP\HTIOP_Endpoint.obj" \
	"$(INTDIR)\HTIOP\HTIOP_Completion_Handler.obj" \
	"$(INTDIR)\HTIOP\HTIOP_Acceptor_Impl.obj" \
	"$(INTDIR)\HTIOP\HTIOP_Connection_Handler.obj" \
	"$(INTDIR)\HTIOP\HTIOP_Connector.obj" \
	"$(INTDIR)\HTIOP\HTIOP_Acceptor.obj"

"$(OUTDIR)\TAO_HTIOPs.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_HTIOPs.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_HTIOPs.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.HTIOP.dep")
!INCLUDE "Makefile.HTIOP.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="HTIOPC.cpp"

"$(INTDIR)\HTIOPC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\HTIOPC.obj" $(SOURCE)

SOURCE="HTIOP\htiop_endpointsC.cpp"

"$(INTDIR)\HTIOP\htiop_endpointsC.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\HTIOP\$(NULL)" mkdir "$(INTDIR)\HTIOP\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\HTIOP\htiop_endpointsC.obj" $(SOURCE)

SOURCE="HTIOP\HTIOP_Profile.cpp"

"$(INTDIR)\HTIOP\HTIOP_Profile.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\HTIOP\$(NULL)" mkdir "$(INTDIR)\HTIOP\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\HTIOP\HTIOP_Profile.obj" $(SOURCE)

SOURCE="HTIOP\HTIOP_Factory.cpp"

"$(INTDIR)\HTIOP\HTIOP_Factory.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\HTIOP\$(NULL)" mkdir "$(INTDIR)\HTIOP\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\HTIOP\HTIOP_Factory.obj" $(SOURCE)

SOURCE="HTIOP\HTIOP_Connector_Impl.cpp"

"$(INTDIR)\HTIOP\HTIOP_Connector_Impl.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\HTIOP\$(NULL)" mkdir "$(INTDIR)\HTIOP\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\HTIOP\HTIOP_Connector_Impl.obj" $(SOURCE)

SOURCE="HTIOP\HTIOP_Transport.cpp"

"$(INTDIR)\HTIOP\HTIOP_Transport.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\HTIOP\$(NULL)" mkdir "$(INTDIR)\HTIOP\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\HTIOP\HTIOP_Transport.obj" $(SOURCE)

SOURCE="HTIOP\HTIOP_Endpoint.cpp"

"$(INTDIR)\HTIOP\HTIOP_Endpoint.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\HTIOP\$(NULL)" mkdir "$(INTDIR)\HTIOP\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\HTIOP\HTIOP_Endpoint.obj" $(SOURCE)

SOURCE="HTIOP\HTIOP_Completion_Handler.cpp"

"$(INTDIR)\HTIOP\HTIOP_Completion_Handler.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\HTIOP\$(NULL)" mkdir "$(INTDIR)\HTIOP\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\HTIOP\HTIOP_Completion_Handler.obj" $(SOURCE)

SOURCE="HTIOP\HTIOP_Acceptor_Impl.cpp"

"$(INTDIR)\HTIOP\HTIOP_Acceptor_Impl.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\HTIOP\$(NULL)" mkdir "$(INTDIR)\HTIOP\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\HTIOP\HTIOP_Acceptor_Impl.obj" $(SOURCE)

SOURCE="HTIOP\HTIOP_Connection_Handler.cpp"

"$(INTDIR)\HTIOP\HTIOP_Connection_Handler.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\HTIOP\$(NULL)" mkdir "$(INTDIR)\HTIOP\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\HTIOP\HTIOP_Connection_Handler.obj" $(SOURCE)

SOURCE="HTIOP\HTIOP_Connector.cpp"

"$(INTDIR)\HTIOP\HTIOP_Connector.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\HTIOP\$(NULL)" mkdir "$(INTDIR)\HTIOP\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\HTIOP\HTIOP_Connector.obj" $(SOURCE)

SOURCE="HTIOP\HTIOP_Acceptor.cpp"

"$(INTDIR)\HTIOP\HTIOP_Acceptor.obj" : $(SOURCE)
	@if not exist "$(INTDIR)\HTIOP\$(NULL)" mkdir "$(INTDIR)\HTIOP\"
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\HTIOP\HTIOP_Acceptor.obj" $(SOURCE)

!IF  "$(CFG)" == "Win64 Debug"
SOURCE="HTIOP.idl"

InputPath=HTIOP.idl

"HTIOPC.inl" "HTIOPC.h" "HTIOPS.h" "HTIOPC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-HTIOP_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=HTIOP_Export -Wb,export_include=orbsvcs/HTIOP/HTIOP_Export.h -SS "$(InputPath)"
<<

SOURCE="HTIOP\htiop_endpoints.pidl"

InputPath=HTIOP\htiop_endpoints.pidl

"HTIOP\htiop_endpointsC.h" "HTIOP\htiop_endpointsS.h" "HTIOP\htiop_endpointsC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-HTIOP_htiop_endpoints_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=HTIOP_Export -Wb,export_include=orbsvcs/HTIOP/HTIOP_Export.h -SS -Sci -Gp -Gd -Sa -Sorb -o HTIOP "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Release"
SOURCE="HTIOP.idl"

InputPath=HTIOP.idl

"HTIOPC.inl" "HTIOPC.h" "HTIOPS.h" "HTIOPC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-HTIOP_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=HTIOP_Export -Wb,export_include=orbsvcs/HTIOP/HTIOP_Export.h -SS "$(InputPath)"
<<

SOURCE="HTIOP\htiop_endpoints.pidl"

InputPath=HTIOP\htiop_endpoints.pidl

"HTIOP\htiop_endpointsC.h" "HTIOP\htiop_endpointsS.h" "HTIOP\htiop_endpointsC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-HTIOP_htiop_endpoints_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=HTIOP_Export -Wb,export_include=orbsvcs/HTIOP/HTIOP_Export.h -SS -Sci -Gp -Gd -Sa -Sorb -o HTIOP "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Debug"
SOURCE="HTIOP.idl"

InputPath=HTIOP.idl

"HTIOPC.inl" "HTIOPC.h" "HTIOPS.h" "HTIOPC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-HTIOP_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=HTIOP_Export -Wb,export_include=orbsvcs/HTIOP/HTIOP_Export.h -SS "$(InputPath)"
<<

SOURCE="HTIOP\htiop_endpoints.pidl"

InputPath=HTIOP\htiop_endpoints.pidl

"HTIOP\htiop_endpointsC.h" "HTIOP\htiop_endpointsS.h" "HTIOP\htiop_endpointsC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-HTIOP_htiop_endpoints_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=HTIOP_Export -Wb,export_include=orbsvcs/HTIOP/HTIOP_Export.h -SS -Sci -Gp -Gd -Sa -Sorb -o HTIOP "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Release"
SOURCE="HTIOP.idl"

InputPath=HTIOP.idl

"HTIOPC.inl" "HTIOPC.h" "HTIOPS.h" "HTIOPC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-HTIOP_idl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=HTIOP_Export -Wb,export_include=orbsvcs/HTIOP/HTIOP_Export.h -SS "$(InputPath)"
<<

SOURCE="HTIOP\htiop_endpoints.pidl"

InputPath=HTIOP\htiop_endpoints.pidl

"HTIOP\htiop_endpointsC.h" "HTIOP\htiop_endpointsS.h" "HTIOP\htiop_endpointsC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-HTIOP_htiop_endpoints_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -I..\../orbsvcs -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Wb,export_macro=HTIOP_Export -Wb,export_include=orbsvcs/HTIOP/HTIOP_Export.h -SS -Sci -Gp -Gd -Sa -Sorb -o HTIOP "$(InputPath)"
<<

!ENDIF


!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.HTIOP.dep")
	@echo Using "Makefile.HTIOP.dep"
!ELSE
	@echo Warning: cannot find "Makefile.HTIOP.dep"
!ENDIF
!ENDIF

