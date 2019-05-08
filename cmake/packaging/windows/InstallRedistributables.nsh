################################################################################
# Copyright 2019 JFounder, Inc.
# openSCA (Licensed Product) is protected by copyright, and is
# distributed under the following terms.
# 
# openSCA is an proprietary implementation of the Joint Tactical Networking
# center (JTNC) SOFTWARE COMMUNICATION ARCHITECTURE SPECIFICATION (SCA) 
# version4.1, developed and copyrighted by JFounder Inc. 
################################################################################

!include x64.nsh

Var X64VS2017Needed
Var I86VS2017Needed

Function InstallRedistributables

    StrCpy $X64VS2017Needed "1"
    StrCpy $I86VS2017Needed "1"

    ${If} ${RunningX64}
        SetRegView 64
    ${EndIf}

    # Check if it is necessary to install to x64VS2017
    ${If} ${RunningX64}
        ${If} ${SectionIsSelected} ${libraries_x64Win64VS2017}
        ${OrIf} ${SectionIsSelected} ${libraries_x64Win64VS2015}
            ClearErrors
            ReadRegStr $0 HKLM "SOFTWARE\Classes\Installer\Dependencies\Microsoft.VS.VC_RuntimeMinimumVSU_amd64,v14" "Version"
            IfErrors 0 VC2017x64RedistInstalled
            StrCpy $X64VS2017Needed "0"
        ${EndIf}
    ${EndIf}

    VC2017x64RedistInstalled:

    # Check if it is necessary to install to i86VS2017
    ${If} ${SectionIsSelected} ${libraries_i86Win32VS2017}
    ${OrIf} ${SectionIsSelected} ${libraries_i86Win32VS2015}
        ClearErrors
        ReadRegStr $0 HKLM "SOFTWARE\Classes\Installer\Dependencies\Microsoft.VS.VC_RuntimeMinimumVSU_x86,v14" "Version"
        IfErrors 0 VC2017i86RedistInstalled
        StrCpy $I86VS2017Needed "0"
    ${EndIf}

    VC2017i86RedistInstalled:

    StrCmp $X64VS2017Needed "1" notinstall2017x64 install2017x64

    install2017x64:
    messageBox MB_YESNO|MB_ICONQUESTION "$(^Name) needs Visual Studio 2017 x64 Redistributable packages.$\nDo you want to download and install them?" IDNO notinstall2017x64

    NSISdl::download https://aka.ms/vs/15/release/VC_redist.x64.exe $TEMP\VC_redist.x64.exe
    Pop $R0 ; Get the return value
    StrCmp $R0 "success" 0 +3
    ExecWait "$TEMP\VC_redist.x64.exe"
    Goto +2
    MessageBox MB_OK "VC_redist.x64.exe download failed: $R0"

    notinstall2017x64:

    StrCmp $I86VS2017Needed "1" notinstall2017i86 install2017i86

    install2017i86:
    messageBox MB_YESNO|MB_ICONQUESTION "$(^Name) needs Visual Studio 2017 Win32 Redistributable packages.$\nDo you want to download and install them?" IDNO notinstall2017i86

    NSISdl::download https://aka.ms/vs/15/release/VC_redist.x86.exe $TEMP\VC_redist.x86.exe
    Pop $R0 ; Get the return value
    StrCmp $R0 "success" 0 +3
    ExecWait "$TEMP\VC_redist.x86.exe"
    Goto +2
    MessageBox MB_OK "VC_redist.x86.exe download failed: $R0"

    notinstall2017i86:

FunctionEnd
