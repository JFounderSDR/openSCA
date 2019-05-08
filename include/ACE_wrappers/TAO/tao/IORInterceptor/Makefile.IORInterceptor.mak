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
!MESSAGE NMAKE /f "Makefile.IORInterceptor.mak" CFG="Win64 Debug"
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
INTDIR=Debug\IORInterceptor\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_IORInterceptord.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_IORINTERCEPTOR_BUILD_DLL -f "Makefile.IORInterceptor.dep" "IORInfo.cpp" "IORInterceptor_Adapter_Factory_Impl.cpp" "IORInterceptor_Adapter_Impl.cpp" "IORInterceptor_Details.cpp" "IORInterceptorC.cpp" "IORInfoC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_IORInterceptord.pdb"
	-@del /f/q "..\..\..\lib\TAO_IORInterceptord.dll"
	-@del /f/q "$(OUTDIR)\TAO_IORInterceptord.lib"
	-@del /f/q "$(OUTDIR)\TAO_IORInterceptord.exp"
	-@del /f/q "$(OUTDIR)\TAO_IORInterceptord.ilk"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\IORInterceptor\$(NULL)" mkdir "Debug\IORInterceptor"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /wd4355 /wd4250 /wd4290 /Fd"$(INTDIR)/" /I "..\..\.." /I "..\.." /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_IORINTERCEPTOR_BUILD_DLL /D MPC_LIB_MODIFIER=\"d\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACEd.lib TAOd.lib TAO_AnyTypeCoded.lib TAO_PortableServerd.lib TAO_Valuetyped.lib TAO_ObjRefTemplated.lib TAO_CodecFactoryd.lib TAO_PId.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll /debug /pdb:"..\..\..\lib\TAO_IORInterceptord.pdb" /machine:IA64 /out:"..\..\..\lib\TAO_IORInterceptord.dll" /implib:"$(OUTDIR)\TAO_IORInterceptord.lib"
LINK32_OBJS= \
	"$(INTDIR)\TAO_IORInterceptor.res" \
	"$(INTDIR)\IORInfo.obj" \
	"$(INTDIR)\IORInterceptor_Adapter_Factory_Impl.obj" \
	"$(INTDIR)\IORInterceptor_Adapter_Impl.obj" \
	"$(INTDIR)\IORInterceptor_Details.obj" \
	"$(INTDIR)\IORInterceptorC.obj" \
	"$(INTDIR)\IORInfoC.obj"

"..\..\..\lib\TAO_IORInterceptord.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_IORInterceptord.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_IORInterceptord.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=..\..\..\lib
INTDIR=Release\IORInterceptor\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "..\..\..\lib\TAO_IORInterceptor.dll"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DTAO_IORINTERCEPTOR_BUILD_DLL -f "Makefile.IORInterceptor.dep" "IORInfo.cpp" "IORInterceptor_Adapter_Factory_Impl.cpp" "IORInterceptor_Adapter_Impl.cpp" "IORInterceptor_Details.cpp" "IORInterceptorC.cpp" "IORInfoC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "..\..\..\lib\TAO_IORInterceptor.dll"
	-@del /f/q "$(OUTDIR)\TAO_IORInterceptor.lib"
	-@del /f/q "$(OUTDIR)\TAO_IORInterceptor.exp"
	-@del /f/q "$(OUTDIR)\TAO_IORInterceptor.ilk"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\IORInterceptor\$(NULL)" mkdir "Release\IORInterceptor"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D TAO_IORINTERCEPTOR_BUILD_DLL  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe

LINK32=link.exe
LINK32_FLAGS=advapi32.lib user32.lib /INCREMENTAL:NO ACE.lib TAO.lib TAO_AnyTypeCode.lib TAO_PortableServer.lib TAO_Valuetype.lib TAO_ObjRefTemplate.lib TAO_CodecFactory.lib TAO_PI.lib /libpath:"." /libpath:"..\..\..\lib" /nologo /subsystem:windows /dll  /machine:IA64 /out:"..\..\..\lib\TAO_IORInterceptor.dll" /implib:"$(OUTDIR)\TAO_IORInterceptor.lib"
LINK32_OBJS= \
	"$(INTDIR)\TAO_IORInterceptor.res" \
	"$(INTDIR)\IORInfo.obj" \
	"$(INTDIR)\IORInterceptor_Adapter_Factory_Impl.obj" \
	"$(INTDIR)\IORInterceptor_Adapter_Impl.obj" \
	"$(INTDIR)\IORInterceptor_Details.obj" \
	"$(INTDIR)\IORInterceptorC.obj" \
	"$(INTDIR)\IORInfoC.obj"

"..\..\..\lib\TAO_IORInterceptor.dll" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "..\..\..\lib\TAO_IORInterceptor.dll.manifest" mt.exe -manifest "..\..\..\lib\TAO_IORInterceptor.dll.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=..\..\..\lib
INTDIR=Static_Debug\IORInterceptor\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_IORInterceptorsd.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -D_DEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.IORInterceptor.dep" "IORInfo.cpp" "IORInterceptor_Adapter_Factory_Impl.cpp" "IORInterceptor_Adapter_Impl.cpp" "IORInterceptor_Details.cpp" "IORInterceptorC.cpp" "IORInfoC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_IORInterceptorsd.lib"
	-@del /f/q "$(OUTDIR)\TAO_IORInterceptorsd.exp"
	-@del /f/q "$(OUTDIR)\TAO_IORInterceptorsd.ilk"
	-@del /f/q "..\..\..\lib\TAO_IORInterceptorsd.pdb"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\IORInterceptor\$(NULL)" mkdir "Static_Debug\IORInterceptor"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /wd4355 /wd4250 /wd4290 /Fd"..\..\..\lib\TAO_IORInterceptorsd.pdb" /I "..\..\.." /I "..\.." /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"sd\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_IORInterceptorsd.lib"
LINK32_OBJS= \
	"$(INTDIR)\IORInfo.obj" \
	"$(INTDIR)\IORInterceptor_Adapter_Factory_Impl.obj" \
	"$(INTDIR)\IORInterceptor_Adapter_Impl.obj" \
	"$(INTDIR)\IORInterceptor_Details.obj" \
	"$(INTDIR)\IORInterceptorC.obj" \
	"$(INTDIR)\IORInfoC.obj"

"$(OUTDIR)\TAO_IORInterceptorsd.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_IORInterceptorsd.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_IORInterceptorsd.lib.manifest" -outputresource:$@;2

!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=..\..\..\lib
INTDIR=Static_Release\IORInterceptor\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY) "$(OUTDIR)\TAO_IORInterceptors.lib"

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	$(DEPGEN) -I"..\..\.." -I"..\.." -DNDEBUG -DWIN64 -DWIN32 -D_WINDOWS -D_CRT_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_DEPRECATE -D_CRT_NONSTDC_NO_DEPRECATE -DACE_AS_STATIC_LIBS -DTAO_AS_STATIC_LIBS -f "Makefile.IORInterceptor.dep" "IORInfo.cpp" "IORInterceptor_Adapter_Factory_Impl.cpp" "IORInterceptor_Adapter_Impl.cpp" "IORInterceptor_Details.cpp" "IORInterceptorC.cpp" "IORInfoC.cpp"
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\TAO_IORInterceptors.lib"
	-@del /f/q "$(OUTDIR)\TAO_IORInterceptors.exp"
	-@del /f/q "$(OUTDIR)\TAO_IORInterceptors.ilk"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\IORInterceptor\$(NULL)" mkdir "Static_Release\IORInterceptor"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /wd4355 /wd4250 /wd4290 /I "..\..\.." /I "..\.." /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS /D _CRT_SECURE_NO_WARNINGS /D _CRT_SECURE_NO_DEPRECATE /D _CRT_NONSTDC_NO_DEPRECATE /D ACE_AS_STATIC_LIBS /D TAO_AS_STATIC_LIBS /D MPC_LIB_MODIFIER=\"s\" /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"


LINK32=link.exe -lib
LINK32_FLAGS=/nologo /machine:IA64 /out:"..\..\..\lib\TAO_IORInterceptors.lib"
LINK32_OBJS= \
	"$(INTDIR)\IORInfo.obj" \
	"$(INTDIR)\IORInterceptor_Adapter_Factory_Impl.obj" \
	"$(INTDIR)\IORInterceptor_Adapter_Impl.obj" \
	"$(INTDIR)\IORInterceptor_Details.obj" \
	"$(INTDIR)\IORInterceptorC.obj" \
	"$(INTDIR)\IORInfoC.obj"

"$(OUTDIR)\TAO_IORInterceptors.lib" : $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<
	if exist "$(OUTDIR)\TAO_IORInterceptors.lib.manifest" mt.exe -manifest "$(OUTDIR)\TAO_IORInterceptors.lib.manifest" -outputresource:$@;2

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
!IF EXISTS("Makefile.IORInterceptor.dep")
!INCLUDE "Makefile.IORInterceptor.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
SOURCE="IORInfo.cpp"

"$(INTDIR)\IORInfo.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IORInfo.obj" $(SOURCE)

SOURCE="IORInterceptor_Adapter_Factory_Impl.cpp"

"$(INTDIR)\IORInterceptor_Adapter_Factory_Impl.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IORInterceptor_Adapter_Factory_Impl.obj" $(SOURCE)

SOURCE="IORInterceptor_Adapter_Impl.cpp"

"$(INTDIR)\IORInterceptor_Adapter_Impl.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IORInterceptor_Adapter_Impl.obj" $(SOURCE)

SOURCE="IORInterceptor_Details.cpp"

"$(INTDIR)\IORInterceptor_Details.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IORInterceptor_Details.obj" $(SOURCE)

SOURCE="IORInterceptorC.cpp"

"$(INTDIR)\IORInterceptorC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IORInterceptorC.obj" $(SOURCE)

SOURCE="IORInfoC.cpp"

"$(INTDIR)\IORInfoC.obj" : $(SOURCE)
	$(CPP) $(CPP_COMMON) /Fo"$(INTDIR)\IORInfoC.obj" $(SOURCE)

!IF  "$(CFG)" == "Win64 Debug"
!ELSEIF  "$(CFG)" == "Win64 Release"
!ELSEIF  "$(CFG)" == "Win64 Static Debug"
!ELSEIF  "$(CFG)" == "Win64 Static Release"
!ENDIF

SOURCE="TAO_IORInterceptor.rc"

"$(INTDIR)\TAO_IORInterceptor.res" : $(SOURCE)
	$(RSC) /l 0x409 /fo"$(INTDIR)\TAO_IORInterceptor.res" /d NDEBUG /d WIN64 /d _CRT_SECURE_NO_WARNINGS /d _CRT_SECURE_NO_DEPRECATE /d _CRT_NONSTDC_NO_DEPRECATE /i "..\..\.." /i "..\.." $(SOURCE)



!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.IORInterceptor.dep")
	@echo Using "Makefile.IORInterceptor.dep"
!ELSE
	@echo Warning: cannot find "Makefile.IORInterceptor.dep"
!ENDIF
!ENDIF

