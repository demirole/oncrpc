# Microsoft Developer Studio Project File - Name="oncrpc" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Dynamic-Link Library" 0x0102

CFG=oncrpc - Win32 Debug_dominik
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "oncrpc.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "oncrpc.mak" CFG="oncrpc - Win32 Debug_dominik"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "oncrpc - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "oncrpc - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "oncrpc - Win32 Debug_ivo" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "oncrpc - Win32 Release_ivo" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "oncrpc - Win32 Debug_dominik" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "oncrpc - Win32 Release_dominik" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "oncrpc - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release"
# PROP Intermediate_Dir "Release"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "ONCRPC_EXPORTS" /Yu"stdafx.h" /FD /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I ".\include" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "ONCRPC_EXPORTS" /D "_WINDLL" /D "_AFXDLL" /D "_X86_" /FD /c
# SUBTRACT CPP /YX /Yc /Yu
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x807 /d "NDEBUG"
# ADD RSC /l 0x807 /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /dll /machine:I386
# ADD LINK32 ws2_32.lib /nologo /dll /machine:I386
# Begin Special Build Tool
SOURCE="$(InputPath)"
PostBuild_Cmds=copy .\Release\oncrpc.dll ..\Test\Release
# End Special Build Tool

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "lib"
# PROP Intermediate_Dir "Debug"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "ONCRPC_EXPORTS" /Yu"stdafx.h" /FD /GZ /c
# ADD CPP /nologo /MD /w /W0 /Gm /GR /GX /ZI /Od /I ".\include" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "ONCRPC_EXPORTS" /D "_WINDLL" /D "_AFXDLL" /D "_X86_" /Fr"Debug_6/" /Fo"Debug_6/" /Fd"Debug_6/" /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x807 /d "_DEBUG"
# ADD RSC /l 0x807 /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /dll /debug /machine:I386 /pdbtype:sept
# ADD LINK32 ws2_32.lib /nologo /dll /pdb:"Debug_6/oncrpc.pdb" /debug /machine:I386 /def:".\src\oncrpc.def" /out:"Debug_6/oncrpc.dll" /implib:"Debug_6/oncrpc.lib" /pdbtype:sept
# SUBTRACT LINK32 /pdb:none
# Begin Special Build Tool
SOURCE="$(InputPath)"
PostBuild_Desc=copy oncrpc.dll
PostBuild_Cmds=copy .\Debug_6\oncrpc.dll ..\Test\Debug_6	copy .\Debug_6\oncrpc.dll ..\CATInstall\ACS_Libs\intel_a\code\bin	copy .\Debug_6\oncrpc.pdb ..\CATInstall\ACS_Libs\intel_a\code\bin	copy .\Debug_6\oncrpc.lib ..\CATInstall\ACS_Libs\lib	copy .\include\rpc\*.h ..\CATInstall\ACS_Libs\include\rpc
# End Special Build Tool

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_ivo"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "oncrpc___Win32_Debug_ivo"
# PROP BASE Intermediate_Dir "oncrpc___Win32_Debug_ivo"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "oncrpc___Win32_Debug_ivo"
# PROP Intermediate_Dir "oncrpc___Win32_Debug_ivo"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /w /W0 /Gm /GR /GX /ZI /Od /I ".\include" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "ONCRPC_EXPORTS" /D "_WINDLL" /D "_AFXDLL" /D "_X86_" /Fr /FD /c
# ADD CPP /nologo /MD /w /W0 /Gm /GR /GX /ZI /Od /I ".\include" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "ONCRPC_EXPORTS" /D "_WINDLL" /D "_AFXDLL" /D "_X86_" /Fr"Debug/" /Fo"Debug/" /Fd"Debug/" /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x807 /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x807 /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ws2_32.lib /nologo /dll /debug /machine:I386 /pdbtype:sept
# ADD LINK32 ws2_32.lib /nologo /dll /pdb:"Debug/oncrpc.pdb" /debug /machine:I386 /def:".\src\oncrpc.def" /out:"Debug/oncrpc.dll" /implib:"Debug/oncrpc.lib" /pdbtype:sept
# SUBTRACT LINK32 /pdb:none
# Begin Special Build Tool
SOURCE="$(InputPath)"
PostBuild_Desc=copy oncrpc.dll
PostBuild_Cmds=copy .\lib\oncrpc.dll C:\user\ivo\AF_CATIA_R1_2\ACS_LIBS\intel_a\code\bin	copy .\lib\oncrpc.pdb C:\user\ivo\AF_CATIA_R1_2\ACS_LIBS\intel_a\code\bin	copy .\lib\oncrpc.lib C:\user\ivo\AF_CATIA_R1_2\ACS_LIBS\lib	rem copy .\include\rpc\*.h C:\user\ivo\AF_CATIA_R1_2\ACS_LIBS\include\rpc
# End Special Build Tool

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_ivo"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "oncrpc___Win32_Release_ivo"
# PROP BASE Intermediate_Dir "oncrpc___Win32_Release_ivo"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "oncrpc___Win32_Release_ivo"
# PROP Intermediate_Dir "oncrpc___Win32_Release_ivo"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I ".\include" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "ONCRPC_EXPORTS" /D "_WINDLL" /D "_AFXDLL" /D "_X86_" /FD /c
# SUBTRACT BASE CPP /YX /Yc /Yu
# ADD CPP /nologo /MD /W3 /GX /O2 /I ".\include" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "ONCRPC_EXPORTS" /D "_WINDLL" /D "_AFXDLL" /D "_X86_" /FD /c
# SUBTRACT CPP /YX /Yc /Yu
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x807 /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x807 /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ws2_32.lib /nologo /dll /machine:I386
# ADD LINK32 ws2_32.lib /nologo /dll /machine:I386

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_dominik"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "oncrpc___Win32_Debug_dominik"
# PROP BASE Intermediate_Dir "oncrpc___Win32_Debug_dominik"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Debug"
# PROP Intermediate_Dir "Debug"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /w /W0 /Gm /GR /GX /ZI /Od /I ".\include" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "ONCRPC_EXPORTS" /D "_WINDLL" /D "_AFXDLL" /D "_X86_" /Fr /FD /c
# ADD CPP /nologo /MD /w /W0 /Gm /GR /GX /ZI /Od /I ".\include" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "ONCRPC_EXPORTS" /D "_WINDLL" /D "_AFXDLL" /D "_X86_" /Fr /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x807 /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x807 /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ws2_32.lib /nologo /dll /debug /machine:I386 /pdbtype:sept
# ADD LINK32 ws2_32.lib /nologo /dll /debug /machine:I386 /pdbtype:sept
# Begin Special Build Tool
SOURCE="$(InputPath)"
PostBuild_Desc=copy oncrpc.dll
PostBuild_Cmds=copy .\Debug\oncrpc.dll ..\Test\Debug	copy .\Debug\oncrpc.dll ..\CATInstall\ACS_LIBS\intel_a\code\bin	copy .\Debug\oncrpc.pdb ..\CATInstall\ACS_LIBS\intel_a\code\bin	copy .\Debug\oncrpc.lib ..\CATInstall\ACS_LIBS\lib
# End Special Build Tool

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_dominik"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "oncrpc___Win32_Release_dominik"
# PROP BASE Intermediate_Dir "oncrpc___Win32_Release_dominik"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release"
# PROP Intermediate_Dir "Release"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I ".\include" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "ONCRPC_EXPORTS" /D "_WINDLL" /D "_AFXDLL" /D "_X86_" /FD /c
# SUBTRACT BASE CPP /YX /Yc /Yu
# ADD CPP /nologo /MD /W3 /GX /O2 /I ".\include" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "ONCRPC_EXPORTS" /D "_WINDLL" /D "_AFXDLL" /D "_X86_" /FD /c
# SUBTRACT CPP /YX /Yc /Yu
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x807 /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x807 /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 ws2_32.lib /nologo /dll /machine:I386
# ADD LINK32 ws2_32.lib /nologo /dll /machine:I386
# Begin Special Build Tool
SOURCE="$(InputPath)"
PostBuild_Cmds=copy .\Release\oncrpc.dll ..\CATInstall\ACS_LIBS\intel_a\code\bin	copy .\Release\oncrpc.lib ..\CATInstall\ACS_LIBS\lib
# End Special Build Tool

!ENDIF 

# Begin Target

# Name "oncrpc - Win32 Release"
# Name "oncrpc - Win32 Debug"
# Name "oncrpc - Win32 Debug_ivo"
# Name "oncrpc - Win32 Release_ivo"
# Name "oncrpc - Win32 Debug_dominik"
# Name "oncrpc - Win32 Release_dominik"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Source File

SOURCE=.\src\auth_non.c

!IF  "$(CFG)" == "oncrpc - Win32 Release"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug"

# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_ivo"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_ivo"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_dominik"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_dominik"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\src\auth_uni.c

!IF  "$(CFG)" == "oncrpc - Win32 Release"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug"

# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_ivo"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_ivo"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_dominik"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_dominik"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\src\authunix.c

!IF  "$(CFG)" == "oncrpc - Win32 Release"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug"

# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_ivo"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_ivo"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_dominik"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_dominik"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\src\bcopy.c

!IF  "$(CFG)" == "oncrpc - Win32 Release"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug"

# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_ivo"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_ivo"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_dominik"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_dominik"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\src\bindresv.c

!IF  "$(CFG)" == "oncrpc - Win32 Release"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug"

# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_ivo"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_ivo"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_dominik"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_dominik"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\src\clnt_gen.c

!IF  "$(CFG)" == "oncrpc - Win32 Release"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug"

# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_ivo"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_ivo"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_dominik"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_dominik"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\src\clnt_per.c

!IF  "$(CFG)" == "oncrpc - Win32 Release"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug"

# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_ivo"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_ivo"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_dominik"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_dominik"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\src\clnt_raw.c

!IF  "$(CFG)" == "oncrpc - Win32 Release"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug"

# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_ivo"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_ivo"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_dominik"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_dominik"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\src\clnt_sim.c

!IF  "$(CFG)" == "oncrpc - Win32 Release"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug"

# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_ivo"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_ivo"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_dominik"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_dominik"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\src\clnt_tcp.c

!IF  "$(CFG)" == "oncrpc - Win32 Release"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug"

# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_ivo"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_ivo"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_dominik"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_dominik"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\src\clnt_udp.c

!IF  "$(CFG)" == "oncrpc - Win32 Release"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug"

# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_ivo"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_ivo"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_dominik"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_dominik"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\src\get_myad.c

!IF  "$(CFG)" == "oncrpc - Win32 Release"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug"

# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_ivo"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_ivo"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_dominik"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_dominik"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\src\getrpcen.c

!IF  "$(CFG)" == "oncrpc - Win32 Release"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug"

# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_ivo"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_ivo"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_dominik"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_dominik"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\src\getrpcpo.c

!IF  "$(CFG)" == "oncrpc - Win32 Release"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug"

# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_ivo"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_ivo"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_dominik"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_dominik"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\src\nt.c

!IF  "$(CFG)" == "oncrpc - Win32 Release"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug"

# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_ivo"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_ivo"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_dominik"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_dominik"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\oncrpc.cpp

!IF  "$(CFG)" == "oncrpc - Win32 Release"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug"

# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_ivo"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_ivo"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_dominik"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_dominik"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\src\oncrpc.def

!IF  "$(CFG)" == "oncrpc - Win32 Release"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_ivo"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_ivo"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_dominik"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_dominik"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\src\pmap_cln.c

!IF  "$(CFG)" == "oncrpc - Win32 Release"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug"

# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_ivo"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_ivo"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_dominik"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_dominik"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\src\pmap_get.c

!IF  "$(CFG)" == "oncrpc - Win32 Release"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug"

# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_ivo"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_ivo"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_dominik"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_dominik"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\src\pmap_gma.c

!IF  "$(CFG)" == "oncrpc - Win32 Release"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug"

# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_ivo"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_ivo"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_dominik"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_dominik"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\src\pmap_pr.c

!IF  "$(CFG)" == "oncrpc - Win32 Release"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug"

# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_ivo"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_ivo"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_dominik"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_dominik"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\src\pmap_pro.c

!IF  "$(CFG)" == "oncrpc - Win32 Release"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug"

# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_ivo"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_ivo"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_dominik"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_dominik"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\src\pmap_rmt.c

!IF  "$(CFG)" == "oncrpc - Win32 Release"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug"

# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_ivo"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_ivo"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_dominik"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_dominik"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\src\portmap.c

!IF  "$(CFG)" == "oncrpc - Win32 Release"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug"

# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_ivo"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_ivo"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_dominik"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_dominik"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\src\rpc_call.c

!IF  "$(CFG)" == "oncrpc - Win32 Release"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug"

# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_ivo"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_ivo"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_dominik"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_dominik"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\src\rpc_comm.c

!IF  "$(CFG)" == "oncrpc - Win32 Release"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug"

# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_ivo"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_ivo"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_dominik"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_dominik"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\src\rpc_prot.c

!IF  "$(CFG)" == "oncrpc - Win32 Release"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug"

# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_ivo"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_ivo"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_dominik"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_dominik"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\src\svc.c

!IF  "$(CFG)" == "oncrpc - Win32 Release"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug"

# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_ivo"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_ivo"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_dominik"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_dominik"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\src\svc_auth.c

!IF  "$(CFG)" == "oncrpc - Win32 Release"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug"

# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_ivo"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_ivo"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_dominik"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_dominik"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\src\svc_autu.c

!IF  "$(CFG)" == "oncrpc - Win32 Release"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug"

# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_ivo"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_ivo"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_dominik"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_dominik"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\src\svc_raw.c

!IF  "$(CFG)" == "oncrpc - Win32 Release"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug"

# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_ivo"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_ivo"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_dominik"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_dominik"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\src\svc_run.c

!IF  "$(CFG)" == "oncrpc - Win32 Release"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug"

# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_ivo"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_ivo"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_dominik"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_dominik"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\src\svc_simp.c

!IF  "$(CFG)" == "oncrpc - Win32 Release"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug"

# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_ivo"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_ivo"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_dominik"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_dominik"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\src\svc_tcp.c

!IF  "$(CFG)" == "oncrpc - Win32 Release"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug"

# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_ivo"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_ivo"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_dominik"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_dominik"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\src\svc_udp.c

!IF  "$(CFG)" == "oncrpc - Win32 Release"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug"

# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_ivo"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_ivo"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_dominik"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_dominik"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\src\xdr.c

!IF  "$(CFG)" == "oncrpc - Win32 Release"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug"

# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_ivo"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_ivo"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_dominik"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_dominik"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\src\xdr_arra.c

!IF  "$(CFG)" == "oncrpc - Win32 Release"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug"

# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_ivo"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_ivo"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_dominik"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_dominik"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\src\xdr_floa.c

!IF  "$(CFG)" == "oncrpc - Win32 Release"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug"

# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_ivo"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_ivo"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_dominik"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_dominik"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\src\xdr_mem.c

!IF  "$(CFG)" == "oncrpc - Win32 Release"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug"

# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_ivo"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_ivo"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_dominik"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_dominik"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\src\xdr_rec.c

!IF  "$(CFG)" == "oncrpc - Win32 Release"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug"

# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_ivo"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_ivo"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_dominik"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_dominik"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\src\xdr_refe.c

!IF  "$(CFG)" == "oncrpc - Win32 Release"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug"

# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_ivo"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_ivo"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_dominik"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_dominik"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\src\xdr_stdi.c

!IF  "$(CFG)" == "oncrpc - Win32 Release"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug"

# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_ivo"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_ivo"

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Debug_dominik"

# ADD BASE CPP /FR
# ADD CPP /FR

!ELSEIF  "$(CFG)" == "oncrpc - Win32 Release_dominik"

!ENDIF 

# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl"
# Begin Source File

SOURCE=.\include\rpc\AUTH.H
# End Source File
# Begin Source File

SOURCE=.\include\rpc\AUTH_UNI.H
# End Source File
# Begin Source File

SOURCE=.\include\rpc\BCOPY.H
# End Source File
# Begin Source File

SOURCE=.\include\rpc\CLNT.H
# End Source File
# Begin Source File

SOURCE=.\include\rpc\NETDB.H
# End Source File
# Begin Source File

SOURCE=.\oncrpc.h
# End Source File
# Begin Source File

SOURCE=.\include\rpc\PMAP_CLN.H
# End Source File
# Begin Source File

SOURCE=.\include\rpc\PMAP_PRO.H
# End Source File
# Begin Source File

SOURCE=.\include\rpc\PMAP_RMT.H
# End Source File
# Begin Source File

SOURCE=.\include\rpc\RPC.H
# End Source File
# Begin Source File

SOURCE=.\include\rpc\RPC_MSG.H
# End Source File
# Begin Source File

SOURCE=.\include\rpc\SVC.H
# End Source File
# Begin Source File

SOURCE=.\include\rpc\SVC_AUTH.H
# End Source File
# Begin Source File

SOURCE=.\include\rpc\TYPES.H
# End Source File
# Begin Source File

SOURCE=.\include\rpc\XDR.H
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe"
# End Group
# End Target
# End Project
