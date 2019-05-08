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
!MESSAGE NMAKE /f "Makefile.Messaging_Idl.mak" CFG="Win64 Debug"
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

GENERATED_DIRTY = "ExceptionHolderC.inl" "ExceptionHolderC.h" "ExceptionHolderS.h" "ExceptionHolderA.h" "ExceptionHolderC.cpp" "ExceptionHolderA.cpp" "PollableC.h" "PollableS.h" "PollableA.h" "PollableC.cpp" "Messaging_TypesC.h" "Messaging_TypesS.h" "Messaging_TypesA.h" "Messaging_TypesC.cpp" "TAO_ExtC.h" "TAO_ExtS.h" "TAO_ExtA.h" "TAO_ExtC.cpp" "TAO_ExtA.cpp" "Messaging_RT_PolicyC.h" "Messaging_RT_PolicyS.h" "Messaging_RT_PolicyA.h" "Messaging_RT_PolicyC.cpp" "Messaging_RT_PolicyA.cpp" "Messaging_SyncScope_PolicyC.h" "Messaging_SyncScope_PolicyS.h" "Messaging_SyncScope_PolicyA.h" "Messaging_SyncScope_PolicyC.cpp" "Messaging_SyncScope_PolicyA.cpp" "Messaging_No_ImplC.h" "Messaging_No_ImplS.h" "Messaging_No_ImplA.h" "Messaging_No_ImplC.cpp" "Messaging_No_ImplA.cpp" "MessagingC.inl" "MessagingC.h" "MessagingS.h" "MessagingA.h" "MessagingC.cpp" "MessagingS.cpp" "MessagingA.cpp"

!IF  "$(CFG)" == "Win64 Debug"

OUTDIR=.
INTDIR=Debug\Messaging_Idl\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY)

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	-@rem
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\d.lib"
	-@del /f/q "$(OUTDIR)\d.exp"
	-@del /f/q "$(OUTDIR)\d.ilk"
	-@del /f/q "ExceptionHolderC.inl"
	-@del /f/q "ExceptionHolderC.h"
	-@del /f/q "ExceptionHolderS.h"
	-@del /f/q "ExceptionHolderA.h"
	-@del /f/q "ExceptionHolderC.cpp"
	-@del /f/q "ExceptionHolderA.cpp"
	-@del /f/q "PollableC.h"
	-@del /f/q "PollableS.h"
	-@del /f/q "PollableA.h"
	-@del /f/q "PollableC.cpp"
	-@del /f/q "Messaging_TypesC.h"
	-@del /f/q "Messaging_TypesS.h"
	-@del /f/q "Messaging_TypesA.h"
	-@del /f/q "Messaging_TypesC.cpp"
	-@del /f/q "TAO_ExtC.h"
	-@del /f/q "TAO_ExtS.h"
	-@del /f/q "TAO_ExtA.h"
	-@del /f/q "TAO_ExtC.cpp"
	-@del /f/q "TAO_ExtA.cpp"
	-@del /f/q "Messaging_RT_PolicyC.h"
	-@del /f/q "Messaging_RT_PolicyS.h"
	-@del /f/q "Messaging_RT_PolicyA.h"
	-@del /f/q "Messaging_RT_PolicyC.cpp"
	-@del /f/q "Messaging_RT_PolicyA.cpp"
	-@del /f/q "Messaging_SyncScope_PolicyC.h"
	-@del /f/q "Messaging_SyncScope_PolicyS.h"
	-@del /f/q "Messaging_SyncScope_PolicyA.h"
	-@del /f/q "Messaging_SyncScope_PolicyC.cpp"
	-@del /f/q "Messaging_SyncScope_PolicyA.cpp"
	-@del /f/q "Messaging_No_ImplC.h"
	-@del /f/q "Messaging_No_ImplS.h"
	-@del /f/q "Messaging_No_ImplA.h"
	-@del /f/q "Messaging_No_ImplC.cpp"
	-@del /f/q "Messaging_No_ImplA.cpp"
	-@del /f/q "MessagingC.inl"
	-@del /f/q "MessagingC.h"
	-@del /f/q "MessagingS.h"
	-@del /f/q "MessagingA.h"
	-@del /f/q "MessagingC.cpp"
	-@del /f/q "MessagingS.cpp"
	-@del /f/q "MessagingA.cpp"

"$(INTDIR)" :
	if not exist "Debug\$(NULL)" mkdir "Debug"
	if not exist "Debug\Messaging_Idl\$(NULL)" mkdir "Debug\Messaging_Idl"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /MDd /GR /Gy /Fd"$(INTDIR)/" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe


!ELSEIF  "$(CFG)" == "Win64 Release"

OUTDIR=.
INTDIR=Release\Messaging_Idl\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY)

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	-@rem
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "$(OUTDIR)\.lib"
	-@del /f/q "$(OUTDIR)\.exp"
	-@del /f/q "$(OUTDIR)\.ilk"
	-@del /f/q "ExceptionHolderC.inl"
	-@del /f/q "ExceptionHolderC.h"
	-@del /f/q "ExceptionHolderS.h"
	-@del /f/q "ExceptionHolderA.h"
	-@del /f/q "ExceptionHolderC.cpp"
	-@del /f/q "ExceptionHolderA.cpp"
	-@del /f/q "PollableC.h"
	-@del /f/q "PollableS.h"
	-@del /f/q "PollableA.h"
	-@del /f/q "PollableC.cpp"
	-@del /f/q "Messaging_TypesC.h"
	-@del /f/q "Messaging_TypesS.h"
	-@del /f/q "Messaging_TypesA.h"
	-@del /f/q "Messaging_TypesC.cpp"
	-@del /f/q "TAO_ExtC.h"
	-@del /f/q "TAO_ExtS.h"
	-@del /f/q "TAO_ExtA.h"
	-@del /f/q "TAO_ExtC.cpp"
	-@del /f/q "TAO_ExtA.cpp"
	-@del /f/q "Messaging_RT_PolicyC.h"
	-@del /f/q "Messaging_RT_PolicyS.h"
	-@del /f/q "Messaging_RT_PolicyA.h"
	-@del /f/q "Messaging_RT_PolicyC.cpp"
	-@del /f/q "Messaging_RT_PolicyA.cpp"
	-@del /f/q "Messaging_SyncScope_PolicyC.h"
	-@del /f/q "Messaging_SyncScope_PolicyS.h"
	-@del /f/q "Messaging_SyncScope_PolicyA.h"
	-@del /f/q "Messaging_SyncScope_PolicyC.cpp"
	-@del /f/q "Messaging_SyncScope_PolicyA.cpp"
	-@del /f/q "Messaging_No_ImplC.h"
	-@del /f/q "Messaging_No_ImplS.h"
	-@del /f/q "Messaging_No_ImplA.h"
	-@del /f/q "Messaging_No_ImplC.cpp"
	-@del /f/q "Messaging_No_ImplA.cpp"
	-@del /f/q "MessagingC.inl"
	-@del /f/q "MessagingC.h"
	-@del /f/q "MessagingS.h"
	-@del /f/q "MessagingA.h"
	-@del /f/q "MessagingC.cpp"
	-@del /f/q "MessagingS.cpp"
	-@del /f/q "MessagingA.cpp"

"$(INTDIR)" :
	if not exist "Release\$(NULL)" mkdir "Release"
	if not exist "Release\Messaging_Idl\$(NULL)" mkdir "Release\Messaging_Idl"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"

RSC=rc.exe


!ELSEIF  "$(CFG)" == "Win64 Static Debug"

OUTDIR=.
INTDIR=Static_Debug\Messaging_Idl\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY)

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	-@rem
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q ".\sd.pdb"
	-@del /f/q "ExceptionHolderC.inl"
	-@del /f/q "ExceptionHolderC.h"
	-@del /f/q "ExceptionHolderS.h"
	-@del /f/q "ExceptionHolderA.h"
	-@del /f/q "ExceptionHolderC.cpp"
	-@del /f/q "ExceptionHolderA.cpp"
	-@del /f/q "PollableC.h"
	-@del /f/q "PollableS.h"
	-@del /f/q "PollableA.h"
	-@del /f/q "PollableC.cpp"
	-@del /f/q "Messaging_TypesC.h"
	-@del /f/q "Messaging_TypesS.h"
	-@del /f/q "Messaging_TypesA.h"
	-@del /f/q "Messaging_TypesC.cpp"
	-@del /f/q "TAO_ExtC.h"
	-@del /f/q "TAO_ExtS.h"
	-@del /f/q "TAO_ExtA.h"
	-@del /f/q "TAO_ExtC.cpp"
	-@del /f/q "TAO_ExtA.cpp"
	-@del /f/q "Messaging_RT_PolicyC.h"
	-@del /f/q "Messaging_RT_PolicyS.h"
	-@del /f/q "Messaging_RT_PolicyA.h"
	-@del /f/q "Messaging_RT_PolicyC.cpp"
	-@del /f/q "Messaging_RT_PolicyA.cpp"
	-@del /f/q "Messaging_SyncScope_PolicyC.h"
	-@del /f/q "Messaging_SyncScope_PolicyS.h"
	-@del /f/q "Messaging_SyncScope_PolicyA.h"
	-@del /f/q "Messaging_SyncScope_PolicyC.cpp"
	-@del /f/q "Messaging_SyncScope_PolicyA.cpp"
	-@del /f/q "Messaging_No_ImplC.h"
	-@del /f/q "Messaging_No_ImplS.h"
	-@del /f/q "Messaging_No_ImplA.h"
	-@del /f/q "Messaging_No_ImplC.cpp"
	-@del /f/q "Messaging_No_ImplA.cpp"
	-@del /f/q "MessagingC.inl"
	-@del /f/q "MessagingC.h"
	-@del /f/q "MessagingS.h"
	-@del /f/q "MessagingA.h"
	-@del /f/q "MessagingC.cpp"
	-@del /f/q "MessagingS.cpp"
	-@del /f/q "MessagingA.cpp"

"$(INTDIR)" :
	if not exist "Static_Debug\$(NULL)" mkdir "Static_Debug"
	if not exist "Static_Debug\Messaging_Idl\$(NULL)" mkdir "Static_Debug\Messaging_Idl"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /Ob0 /W3 /Gm /EHsc /Zi /GR /Gy /MDd /Fd".\sd.pdb" /D _DEBUG /D WIN64 /D WIN32 /D _WINDOWS  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"



!ELSEIF  "$(CFG)" == "Win64 Static Release"

OUTDIR=.
INTDIR=Static_Release\Messaging_Idl\IA64

ALL : "$(INTDIR)" "$(OUTDIR)" DEPENDCHECK $(GENERATED_DIRTY)

DEPEND :
!IF "$(DEPGEN)" == ""
	@echo No suitable dependency generator could be found.
	@echo One comes with MPC, just set the MPC_ROOT environment variable
	@echo to the full path of MPC.  You can download MPC from
	@echo http://www.ociweb.com/products/mpc/down.html
!ELSE
	-@rem
!ENDIF

REALCLEAN : CLEAN
	-@del /f/q "ExceptionHolderC.inl"
	-@del /f/q "ExceptionHolderC.h"
	-@del /f/q "ExceptionHolderS.h"
	-@del /f/q "ExceptionHolderA.h"
	-@del /f/q "ExceptionHolderC.cpp"
	-@del /f/q "ExceptionHolderA.cpp"
	-@del /f/q "PollableC.h"
	-@del /f/q "PollableS.h"
	-@del /f/q "PollableA.h"
	-@del /f/q "PollableC.cpp"
	-@del /f/q "Messaging_TypesC.h"
	-@del /f/q "Messaging_TypesS.h"
	-@del /f/q "Messaging_TypesA.h"
	-@del /f/q "Messaging_TypesC.cpp"
	-@del /f/q "TAO_ExtC.h"
	-@del /f/q "TAO_ExtS.h"
	-@del /f/q "TAO_ExtA.h"
	-@del /f/q "TAO_ExtC.cpp"
	-@del /f/q "TAO_ExtA.cpp"
	-@del /f/q "Messaging_RT_PolicyC.h"
	-@del /f/q "Messaging_RT_PolicyS.h"
	-@del /f/q "Messaging_RT_PolicyA.h"
	-@del /f/q "Messaging_RT_PolicyC.cpp"
	-@del /f/q "Messaging_RT_PolicyA.cpp"
	-@del /f/q "Messaging_SyncScope_PolicyC.h"
	-@del /f/q "Messaging_SyncScope_PolicyS.h"
	-@del /f/q "Messaging_SyncScope_PolicyA.h"
	-@del /f/q "Messaging_SyncScope_PolicyC.cpp"
	-@del /f/q "Messaging_SyncScope_PolicyA.cpp"
	-@del /f/q "Messaging_No_ImplC.h"
	-@del /f/q "Messaging_No_ImplS.h"
	-@del /f/q "Messaging_No_ImplA.h"
	-@del /f/q "Messaging_No_ImplC.cpp"
	-@del /f/q "Messaging_No_ImplA.cpp"
	-@del /f/q "MessagingC.inl"
	-@del /f/q "MessagingC.h"
	-@del /f/q "MessagingS.h"
	-@del /f/q "MessagingA.h"
	-@del /f/q "MessagingC.cpp"
	-@del /f/q "MessagingS.cpp"
	-@del /f/q "MessagingA.cpp"

"$(INTDIR)" :
	if not exist "Static_Release\$(NULL)" mkdir "Static_Release"
	if not exist "Static_Release\Messaging_Idl\$(NULL)" mkdir "Static_Release\Messaging_Idl"
	if not exist "$(INTDIR)\$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_COMMON=/Zc:wchar_t /nologo /Wp64 /O2 /W3 /EHsc /MD /GR /D NDEBUG /D WIN64 /D WIN32 /D _WINDOWS  /FD /c

CPP_PROJ=$(CPP_COMMON) /Fo"$(INTDIR)\\"



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
!IF EXISTS("Makefile.Messaging_Idl.dep")
!INCLUDE "Makefile.Messaging_Idl.dep"
!ENDIF
!ENDIF

!IF "$(CFG)" == "Win64 Debug" || "$(CFG)" == "Win64 Release" || "$(CFG)" == "Win64 Static Debug" || "$(CFG)" == "Win64 Static Release" 
!IF  "$(CFG)" == "Win64 Debug"
SOURCE="ExceptionHolder.pidl"

InputPath=ExceptionHolder.pidl

"ExceptionHolderC.inl" "ExceptionHolderC.h" "ExceptionHolderS.h" "ExceptionHolderA.h" "ExceptionHolderC.cpp" "ExceptionHolderA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-ExceptionHolder_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -GA -Gp -Gd -Sorb -Sal -Wb,export_macro=TAO_Messaging_Export -Wb,export_include=tao/Messaging/messaging_export.h -iC tao/Messaging "$(InputPath)"
<<

SOURCE="Pollable.pidl"

InputPath=Pollable.pidl

"PollableC.h" "PollableS.h" "PollableA.h" "PollableC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-Pollable_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Sci -SS -Gp -Gd -Sorb -Sal -GX -Wb,export_macro=TAO_Messaging_Export -Wb,export_include=tao/Messaging/messaging_export.h -iC tao/Messaging "$(InputPath)"
<<

SOURCE="Messaging_Types.pidl"

InputPath=Messaging_Types.pidl

"Messaging_TypesC.h" "Messaging_TypesS.h" "Messaging_TypesA.h" "Messaging_TypesC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-Messaging_Types_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Sci -SS -Gp -Gd -Sorb -Sal -GX -Wb,export_macro=TAO_Messaging_Export -Wb,export_include=tao/Messaging/messaging_export.h -iC tao/Messaging "$(InputPath)"
<<

SOURCE="TAO_Ext.pidl"

InputPath=TAO_Ext.pidl

"TAO_ExtC.h" "TAO_ExtS.h" "TAO_ExtA.h" "TAO_ExtC.cpp" "TAO_ExtA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-TAO_Ext_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Sci -SS -GA -Gp -Gd -Sorb -Sal -Wb,export_macro=TAO_Messaging_Export -Wb,export_include=tao/Messaging/messaging_export.h -iC tao/Messaging "$(InputPath)"
<<

SOURCE="Messaging_RT_Policy.pidl"

InputPath=Messaging_RT_Policy.pidl

"Messaging_RT_PolicyC.h" "Messaging_RT_PolicyS.h" "Messaging_RT_PolicyA.h" "Messaging_RT_PolicyC.cpp" "Messaging_RT_PolicyA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-Messaging_RT_Policy_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Sci -SS -GA -Gp -Gd -Sorb -Sal -Wb,export_macro=TAO_Messaging_Export -Wb,export_include=tao/Messaging/messaging_export.h -iC tao/Messaging "$(InputPath)"
<<

SOURCE="Messaging_SyncScope_Policy.pidl"

InputPath=Messaging_SyncScope_Policy.pidl

"Messaging_SyncScope_PolicyC.h" "Messaging_SyncScope_PolicyS.h" "Messaging_SyncScope_PolicyA.h" "Messaging_SyncScope_PolicyC.cpp" "Messaging_SyncScope_PolicyA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-Messaging_SyncScope_Policy_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Sci -SS -GA -Gp -Gd -Sorb -Sal -Wb,export_macro=TAO_Messaging_Export -Wb,export_include=tao/Messaging/messaging_export.h -iC tao/Messaging "$(InputPath)"
<<

SOURCE="Messaging_No_Impl.pidl"

InputPath=Messaging_No_Impl.pidl

"Messaging_No_ImplC.h" "Messaging_No_ImplS.h" "Messaging_No_ImplA.h" "Messaging_No_ImplC.cpp" "Messaging_No_ImplA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-Messaging_No_Impl_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Sci -SS -GA -Gp -Gd -Sorb -Sal -Wb,export_macro=TAO_Messaging_Export -Wb,export_include=tao/Messaging/messaging_export.h -Wb,include_guard=TAO_MESSAGING_SAFE_INCLUDE -Wb,safe_include=tao/Messaging/Messaging.h -iC tao/Messaging "$(InputPath)"
<<

SOURCE="Messaging.pidl"

InputPath=Messaging.pidl

"MessagingC.inl" "MessagingC.h" "MessagingS.h" "MessagingA.h" "MessagingC.cpp" "MessagingS.cpp" "MessagingA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BEd.dll" "..\..\..\lib\TAO_IDL_FEd.dll"
	<<tempfile-Win64-Debug-idl_files-Messaging_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Ssi -GA -Gp -Gd -Sorb -Sal -Wb,export_macro=TAO_Messaging_Export -Wb,export_include=tao/Messaging/messaging_export.h -Wb,include_guard=TAO_MESSAGING_SAFE_INCLUDE -Wb,safe_include=tao/Messaging/Messaging.h -iC tao/Messaging "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Release"
SOURCE="ExceptionHolder.pidl"

InputPath=ExceptionHolder.pidl

"ExceptionHolderC.inl" "ExceptionHolderC.h" "ExceptionHolderS.h" "ExceptionHolderA.h" "ExceptionHolderC.cpp" "ExceptionHolderA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-ExceptionHolder_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -GA -Gp -Gd -Sorb -Sal -Wb,export_macro=TAO_Messaging_Export -Wb,export_include=tao/Messaging/messaging_export.h -iC tao/Messaging "$(InputPath)"
<<

SOURCE="Pollable.pidl"

InputPath=Pollable.pidl

"PollableC.h" "PollableS.h" "PollableA.h" "PollableC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-Pollable_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Sci -SS -Gp -Gd -Sorb -Sal -GX -Wb,export_macro=TAO_Messaging_Export -Wb,export_include=tao/Messaging/messaging_export.h -iC tao/Messaging "$(InputPath)"
<<

SOURCE="Messaging_Types.pidl"

InputPath=Messaging_Types.pidl

"Messaging_TypesC.h" "Messaging_TypesS.h" "Messaging_TypesA.h" "Messaging_TypesC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-Messaging_Types_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Sci -SS -Gp -Gd -Sorb -Sal -GX -Wb,export_macro=TAO_Messaging_Export -Wb,export_include=tao/Messaging/messaging_export.h -iC tao/Messaging "$(InputPath)"
<<

SOURCE="TAO_Ext.pidl"

InputPath=TAO_Ext.pidl

"TAO_ExtC.h" "TAO_ExtS.h" "TAO_ExtA.h" "TAO_ExtC.cpp" "TAO_ExtA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-TAO_Ext_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Sci -SS -GA -Gp -Gd -Sorb -Sal -Wb,export_macro=TAO_Messaging_Export -Wb,export_include=tao/Messaging/messaging_export.h -iC tao/Messaging "$(InputPath)"
<<

SOURCE="Messaging_RT_Policy.pidl"

InputPath=Messaging_RT_Policy.pidl

"Messaging_RT_PolicyC.h" "Messaging_RT_PolicyS.h" "Messaging_RT_PolicyA.h" "Messaging_RT_PolicyC.cpp" "Messaging_RT_PolicyA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-Messaging_RT_Policy_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Sci -SS -GA -Gp -Gd -Sorb -Sal -Wb,export_macro=TAO_Messaging_Export -Wb,export_include=tao/Messaging/messaging_export.h -iC tao/Messaging "$(InputPath)"
<<

SOURCE="Messaging_SyncScope_Policy.pidl"

InputPath=Messaging_SyncScope_Policy.pidl

"Messaging_SyncScope_PolicyC.h" "Messaging_SyncScope_PolicyS.h" "Messaging_SyncScope_PolicyA.h" "Messaging_SyncScope_PolicyC.cpp" "Messaging_SyncScope_PolicyA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-Messaging_SyncScope_Policy_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Sci -SS -GA -Gp -Gd -Sorb -Sal -Wb,export_macro=TAO_Messaging_Export -Wb,export_include=tao/Messaging/messaging_export.h -iC tao/Messaging "$(InputPath)"
<<

SOURCE="Messaging_No_Impl.pidl"

InputPath=Messaging_No_Impl.pidl

"Messaging_No_ImplC.h" "Messaging_No_ImplS.h" "Messaging_No_ImplA.h" "Messaging_No_ImplC.cpp" "Messaging_No_ImplA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-Messaging_No_Impl_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Sci -SS -GA -Gp -Gd -Sorb -Sal -Wb,export_macro=TAO_Messaging_Export -Wb,export_include=tao/Messaging/messaging_export.h -Wb,include_guard=TAO_MESSAGING_SAFE_INCLUDE -Wb,safe_include=tao/Messaging/Messaging.h -iC tao/Messaging "$(InputPath)"
<<

SOURCE="Messaging.pidl"

InputPath=Messaging.pidl

"MessagingC.inl" "MessagingC.h" "MessagingS.h" "MessagingA.h" "MessagingC.cpp" "MessagingS.cpp" "MessagingA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe" "..\..\..\lib\TAO_IDL_BE.dll" "..\..\..\lib\TAO_IDL_FE.dll"
	<<tempfile-Win64-Release-idl_files-Messaging_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Ssi -GA -Gp -Gd -Sorb -Sal -Wb,export_macro=TAO_Messaging_Export -Wb,export_include=tao/Messaging/messaging_export.h -Wb,include_guard=TAO_MESSAGING_SAFE_INCLUDE -Wb,safe_include=tao/Messaging/Messaging.h -iC tao/Messaging "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Debug"
SOURCE="ExceptionHolder.pidl"

InputPath=ExceptionHolder.pidl

"ExceptionHolderC.inl" "ExceptionHolderC.h" "ExceptionHolderS.h" "ExceptionHolderA.h" "ExceptionHolderC.cpp" "ExceptionHolderA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-ExceptionHolder_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -GA -Gp -Gd -Sorb -Sal -Wb,export_macro=TAO_Messaging_Export -Wb,export_include=tao/Messaging/messaging_export.h -iC tao/Messaging "$(InputPath)"
<<

SOURCE="Pollable.pidl"

InputPath=Pollable.pidl

"PollableC.h" "PollableS.h" "PollableA.h" "PollableC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-Pollable_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Sci -SS -Gp -Gd -Sorb -Sal -GX -Wb,export_macro=TAO_Messaging_Export -Wb,export_include=tao/Messaging/messaging_export.h -iC tao/Messaging "$(InputPath)"
<<

SOURCE="Messaging_Types.pidl"

InputPath=Messaging_Types.pidl

"Messaging_TypesC.h" "Messaging_TypesS.h" "Messaging_TypesA.h" "Messaging_TypesC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-Messaging_Types_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Sci -SS -Gp -Gd -Sorb -Sal -GX -Wb,export_macro=TAO_Messaging_Export -Wb,export_include=tao/Messaging/messaging_export.h -iC tao/Messaging "$(InputPath)"
<<

SOURCE="TAO_Ext.pidl"

InputPath=TAO_Ext.pidl

"TAO_ExtC.h" "TAO_ExtS.h" "TAO_ExtA.h" "TAO_ExtC.cpp" "TAO_ExtA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-TAO_Ext_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Sci -SS -GA -Gp -Gd -Sorb -Sal -Wb,export_macro=TAO_Messaging_Export -Wb,export_include=tao/Messaging/messaging_export.h -iC tao/Messaging "$(InputPath)"
<<

SOURCE="Messaging_RT_Policy.pidl"

InputPath=Messaging_RT_Policy.pidl

"Messaging_RT_PolicyC.h" "Messaging_RT_PolicyS.h" "Messaging_RT_PolicyA.h" "Messaging_RT_PolicyC.cpp" "Messaging_RT_PolicyA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-Messaging_RT_Policy_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Sci -SS -GA -Gp -Gd -Sorb -Sal -Wb,export_macro=TAO_Messaging_Export -Wb,export_include=tao/Messaging/messaging_export.h -iC tao/Messaging "$(InputPath)"
<<

SOURCE="Messaging_SyncScope_Policy.pidl"

InputPath=Messaging_SyncScope_Policy.pidl

"Messaging_SyncScope_PolicyC.h" "Messaging_SyncScope_PolicyS.h" "Messaging_SyncScope_PolicyA.h" "Messaging_SyncScope_PolicyC.cpp" "Messaging_SyncScope_PolicyA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-Messaging_SyncScope_Policy_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Sci -SS -GA -Gp -Gd -Sorb -Sal -Wb,export_macro=TAO_Messaging_Export -Wb,export_include=tao/Messaging/messaging_export.h -iC tao/Messaging "$(InputPath)"
<<

SOURCE="Messaging_No_Impl.pidl"

InputPath=Messaging_No_Impl.pidl

"Messaging_No_ImplC.h" "Messaging_No_ImplS.h" "Messaging_No_ImplA.h" "Messaging_No_ImplC.cpp" "Messaging_No_ImplA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-Messaging_No_Impl_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Sci -SS -GA -Gp -Gd -Sorb -Sal -Wb,export_macro=TAO_Messaging_Export -Wb,export_include=tao/Messaging/messaging_export.h -Wb,include_guard=TAO_MESSAGING_SAFE_INCLUDE -Wb,safe_include=tao/Messaging/Messaging.h -iC tao/Messaging "$(InputPath)"
<<

SOURCE="Messaging.pidl"

InputPath=Messaging.pidl

"MessagingC.inl" "MessagingC.h" "MessagingS.h" "MessagingA.h" "MessagingC.cpp" "MessagingS.cpp" "MessagingA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Debug-idl_files-Messaging_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Ssi -GA -Gp -Gd -Sorb -Sal -Wb,export_macro=TAO_Messaging_Export -Wb,export_include=tao/Messaging/messaging_export.h -Wb,include_guard=TAO_MESSAGING_SAFE_INCLUDE -Wb,safe_include=tao/Messaging/Messaging.h -iC tao/Messaging "$(InputPath)"
<<

!ELSEIF  "$(CFG)" == "Win64 Static Release"
SOURCE="ExceptionHolder.pidl"

InputPath=ExceptionHolder.pidl

"ExceptionHolderC.inl" "ExceptionHolderC.h" "ExceptionHolderS.h" "ExceptionHolderA.h" "ExceptionHolderC.cpp" "ExceptionHolderA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-ExceptionHolder_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -SS -GA -Gp -Gd -Sorb -Sal -Wb,export_macro=TAO_Messaging_Export -Wb,export_include=tao/Messaging/messaging_export.h -iC tao/Messaging "$(InputPath)"
<<

SOURCE="Pollable.pidl"

InputPath=Pollable.pidl

"PollableC.h" "PollableS.h" "PollableA.h" "PollableC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-Pollable_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Sci -SS -Gp -Gd -Sorb -Sal -GX -Wb,export_macro=TAO_Messaging_Export -Wb,export_include=tao/Messaging/messaging_export.h -iC tao/Messaging "$(InputPath)"
<<

SOURCE="Messaging_Types.pidl"

InputPath=Messaging_Types.pidl

"Messaging_TypesC.h" "Messaging_TypesS.h" "Messaging_TypesA.h" "Messaging_TypesC.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-Messaging_Types_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Sci -SS -Gp -Gd -Sorb -Sal -GX -Wb,export_macro=TAO_Messaging_Export -Wb,export_include=tao/Messaging/messaging_export.h -iC tao/Messaging "$(InputPath)"
<<

SOURCE="TAO_Ext.pidl"

InputPath=TAO_Ext.pidl

"TAO_ExtC.h" "TAO_ExtS.h" "TAO_ExtA.h" "TAO_ExtC.cpp" "TAO_ExtA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-TAO_Ext_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Sci -SS -GA -Gp -Gd -Sorb -Sal -Wb,export_macro=TAO_Messaging_Export -Wb,export_include=tao/Messaging/messaging_export.h -iC tao/Messaging "$(InputPath)"
<<

SOURCE="Messaging_RT_Policy.pidl"

InputPath=Messaging_RT_Policy.pidl

"Messaging_RT_PolicyC.h" "Messaging_RT_PolicyS.h" "Messaging_RT_PolicyA.h" "Messaging_RT_PolicyC.cpp" "Messaging_RT_PolicyA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-Messaging_RT_Policy_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Sci -SS -GA -Gp -Gd -Sorb -Sal -Wb,export_macro=TAO_Messaging_Export -Wb,export_include=tao/Messaging/messaging_export.h -iC tao/Messaging "$(InputPath)"
<<

SOURCE="Messaging_SyncScope_Policy.pidl"

InputPath=Messaging_SyncScope_Policy.pidl

"Messaging_SyncScope_PolicyC.h" "Messaging_SyncScope_PolicyS.h" "Messaging_SyncScope_PolicyA.h" "Messaging_SyncScope_PolicyC.cpp" "Messaging_SyncScope_PolicyA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-Messaging_SyncScope_Policy_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Sci -SS -GA -Gp -Gd -Sorb -Sal -Wb,export_macro=TAO_Messaging_Export -Wb,export_include=tao/Messaging/messaging_export.h -iC tao/Messaging "$(InputPath)"
<<

SOURCE="Messaging_No_Impl.pidl"

InputPath=Messaging_No_Impl.pidl

"Messaging_No_ImplC.h" "Messaging_No_ImplS.h" "Messaging_No_ImplA.h" "Messaging_No_ImplC.cpp" "Messaging_No_ImplA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-Messaging_No_Impl_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Sci -SS -GA -Gp -Gd -Sorb -Sal -Wb,export_macro=TAO_Messaging_Export -Wb,export_include=tao/Messaging/messaging_export.h -Wb,include_guard=TAO_MESSAGING_SAFE_INCLUDE -Wb,safe_include=tao/Messaging/Messaging.h -iC tao/Messaging "$(InputPath)"
<<

SOURCE="Messaging.pidl"

InputPath=Messaging.pidl

"MessagingC.inl" "MessagingC.h" "MessagingS.h" "MessagingA.h" "MessagingC.cpp" "MessagingS.cpp" "MessagingA.cpp" : $(SOURCE)  "..\..\..\bin\tao_idl.exe"
	<<tempfile-Win64-Static_Release-idl_files-Messaging_pidl.bat
	@echo off
	PATH=%PATH%;..\..\..\lib
	..\..\..\bin\tao_idl -Wb,pre_include=ace/pre.h -Wb,post_include=ace/post.h -I..\.. -Wb,versioning_begin=TAO_BEGIN_VERSIONED_NAMESPACE_DECL -Wb,versioning_end=TAO_END_VERSIONED_NAMESPACE_DECL -Ssi -GA -Gp -Gd -Sorb -Sal -Wb,export_macro=TAO_Messaging_Export -Wb,export_include=tao/Messaging/messaging_export.h -Wb,include_guard=TAO_MESSAGING_SAFE_INCLUDE -Wb,safe_include=tao/Messaging/Messaging.h -iC tao/Messaging "$(InputPath)"
<<

!ENDIF


!ENDIF

GENERATED : "$(INTDIR)" "$(OUTDIR)" $(GENERATED_DIRTY)
	-@rem

DEPENDCHECK :
!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Makefile.Messaging_Idl.dep")
	@echo Using "Makefile.Messaging_Idl.dep"
!ENDIF
!ENDIF

