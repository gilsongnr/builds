call cleanAll.bat

@echo off
cls

set PathOrig=%CD%
set delphi_res=D:\projects\source\liblcl\delphi\resources
set delphiIBO=D:\Hd_ibo\Projetos\Delphi\Libs
set delphiIBOres=%delphiIBO%\resources
set pathComps=d:\Projects\source\Components\

set msgSucess= ***** SUCESSO ********
set OutputFile=%PathOrig%\out.txt
set OutputCmd=
set OutputCmd=^>^> %OutputFile%
type %OutputFile% > %OutputFile% 

rem goto Error
rem Shift
rem echo ("%1")
rem if "%1"=="nfe" goto nfe
rem if "%1"=="ib" goto IB


set Aborted=0
set dversion=D2007
set pathDelphi=c:\program files (x86)\codegear\rad studio\5.0\
set configDebug=-B -Q 

set configDebug=%configDebug% "-W-GARBAGE"
rem set configDebug=%configDebug% "-W^BOUNDS_ERROR"
rem set configDebug=%configDebug% "-W^CASE_LABEL_RANGE"
rem set configDebug=%configDebug% "-W^CONSTRUCTING_ABSTRACT"
set configDebug=%configDebug% "-W-COMPARISON_FALSE" 
set configDebug=%configDebug% "-W-COMPARISON_TRUE"
set configDebug=%configDebug% "-W-NO_RETVAL"
set configDebug=%configDebug% "-W-USE_BEFORE_DEF"
set configDebug=%configDebug% "-W-SUSPICIOUS_TYPECAST"
set configDebug=%configDebug% "-W-WIDECHAR_REDUCED"

set configRelease=-$D0 -$L- -$Y- %configDebug%
set ExecPath="%pathDelphi%bin\dcc32.exe" 
call :ExecuteVersionAll
rem goto finish
if not %Aborted% == 0  goto finish 

set dversion=xe
set pathDelphi=c:\program files (x86)\embarcadero\studio\19.0\
set configDebug=-B -Q -TX.exe

set configDebug=%configDebug% "-W-GARBAGE"
set configDebug=%configDebug% "-W^BOUNDS_ERROR"
set configDebug=%configDebug% "-W^CASE_LABEL_RANGE"
set configDebug=%configDebug% "-W^CONSTRUCTING_ABSTRACT"
set configDebug=%configDebug% "-W^COMPARISON_FALSE" 
set configDebug=%configDebug% "-W^COMPARISON_TRUE"
set configDebug=%configDebug% "-W^NO_RETVAL"
set configDebug=%configDebug% "-W^USE_BEFORE_DEF"
set configDebug=%configDebug% "-W^SUSPICIOUS_TYPECAST"
set configDebug=%configDebug% "-W-WIDECHAR_REDUCED" 
set configDebug=%configDebug% "-W-IMPLICIT_STRING_CAST"
set configDebug=%configDebug% "-W^IMPLICIT_STRING_CAST_LOSS"
set configDebug=%configDebug% "--inline:off"

set configRelease=-$D0 -$L- -$Y- %configDebug%
set ExecPath="%pathDelphi%bin\dcc32.exe" 
call :ExecuteVersionAll

timeout /T 10

goto finish

:ExecuteVersionAll

set config=-DDEBUG %configDebug%
set configdir=Debug
call :Compile
rem if not %Aborted% == 0 GOTO ExecuteVersionAllEnd
rem echo pause releaseA
if not %Aborted% == 0  goto :eof 
rem echo pause releaseB
rem pause

set config=-DRELEASE %configRelease%
set configdir=Release
call :Compile
:ExecuteVersionAllEnd
goto :eof

:Compile

rem cd %PathOrig%
echo ********************************************
echo              C o m p i l a n d o 
echo             Versao: %dversion% 
echo               Modo: %configdir%
echo       Configuracao:(%config%)
echo ********************************************
rem pause
rem timeout 5
rem goto end
rem @echo on

rem ***************************************************************
set pathOut=%PathOrig%\lib\%dversion%\Win32\%configdir%
del %pathOut%\*.dcu /s > deleteds.txt

rem ***************************************************************
set OutputDCUsFCL=%pathOut%\fcl
set OutputDCUs=%OutputDCUsFCL%

call :ShowCab (FCL) 

set includes=d:\Projects\source\LibFCL\includes
set aliases=System;Winapi;System.Win;vcl
set ExecPath=%ExecPath% %config%
set units=
set resources=

echo . >> %OutputFile% 
echo . >> %OutputFile% 

cd D:\projects\source\libfcl\delphi\build
call :ExecuteCmd Build1.dpr 

if not %ERRORLEVEL% == 0 GOTO Error
echo %msgSucess%

set units=%OutputDCUsFCL%





rem ***************************************************************
set OutputDCUs=%pathOut%\db
call :ShowCab (DB) 

set aliases=%aliases%;data

call :ExecuteCmd BuildDB.dpr 

if not %ERRORLEVEL% == 0 GOTO Error
echo %msgSucess%



rem ***************************************************************
set OutputDCUs=%pathOut%\lcl
cd D:\projects\source\liblcl\delphi\build
call :ShowCab (LCL) 


rem set paramextra= -NSSystem;Xml;Data;Datasnap;Web;Soap;Winapi;Vcl;Vcl.Imaging;Vcl.Samples;Vcl.Touch;Vcl.Shell
set DJedi=D25\win32
if %dversion% == D2007 set DJedi=D11

set units=%units%;%pathComps%jedi\350\jcl\lib\%DJedi%;%pathComps%jedi\350\jvcl\lib\%DJedi%
set includes=%includes%;%pathComps%jedi\350\jvcl\common;%pathComps%jedi\350\jcl\source\include
set resources=%pathComps%jedi\350\jvcl\resources;%delphi_res%
rem                   Data.Win;Xml;Data;WinAPI.Networking;
rem set aliases=%aliases%;Data.Win;Xml;Data;WinAPI.Networking;
if not %dversion% == D2007 set aliases=%aliases%;Vcl.Imaging;Vcl.Samples


call :ExecuteCmd buildlcl.dpr

if not %ERRORLEVEL% == 0 GOTO Error
echo %msgSucess%





rem ***************************************************************
set units=%units%;%pathOut%\db;%OutputDCUs%
set OutputDCUs=%pathOut%\db
cd D:\projects\source\liblcl\delphi\build
call :ShowCab (LCL_DB) 

if not %dversion% == D2007 set units=%units%;%pathComps%KBMTABLE\v7.71\lib\DXE\Win32\Release

set unitsSave=%units%
set unitsSave2=%units%;%OutputDCUs%
set units=%units%;d:\Projects\source\liblcl\delphi\Components\Quickrep5

set aliasesSave=%aliases%
set aliases=%aliases%;data

call :ExecuteCmd BuildLCL_DB.dpr 

if not %ERRORLEVEL% == 0 GOTO Error
echo %msgSucess%

set units=%unitsSave%
set aliases=%aliasesSave%




rem ***************************************************************
set OutputDCUs=%pathOut%\reg
cd D:\projects\source\progs\utils\Registro\Libs\build
call :ShowCab (REG)
call :ExecuteCmd BuildReg.dpr 

if not %ERRORLEVEL% == 0 GOTO Error
echo %msgSucess%

:nfe
rem ***************************************************************
set OutputDCUs=%pathOut%\nfe
cd D:\projects\source\progs\utils\nfe\build
call :ShowCab (NF-e) 

rem set unitsSave=%units%
set includesSave=%includes%
rem set includes=%includes%;d:\Projects\source\LibFCL\DB\includes
set rootpath=D:\projects\source\automacao\nfe\src\core\
rem set units=%units%;%rootpath%PCN2;%rootpath%ACBrComum;%rootpath%ACBrNFe2;%rootpath%synalist;%rootpath%ZLibExGZ;%rootpath%ACBrCapicom
set units=%units%;%rootpath%common;%rootpath%PCNComum;%rootpath%DFe;%rootpath%DFe\NFe;%rootpath%DFe\NFe\PCN
set units=%units%;%rootpath%..\terceiros\gilson
rem set units=%units%;%rootpath%..\terceiros\synalist
set units=%units%;%rootpath%..\terceiros\ZLibExGZ
set units=%units%;%rootpath%..\terceiros\ACBrCapicom

set includes=%includes%;%rootpath%common

call :ExecuteCmd BuildNFe.dpr 

if not %ERRORLEVEL% == 0 GOTO Error
echo %msgSucess%

set units=%unitsSave2%
set includes=%includesSave%
:skeepnfe

rem goto error
rem ***************************************************************
rem set units=%units%;d:\projects\source\Delphi\build\%pathOut%\lcl;d:\projects\source\Delphi\Componentes\Quickrep5\lib\%dversion%\win32\Release
set dversiontmp=d10_1
if %dversion% == D2007 set dversiontmp=d2007
set units=%units%;%pathComps%ibo\5_7\src\lib\%dversiontmp%\Win32\Release;
rem echo -U%units% %pathComps%ibo\5_7\src\lib\d10_1\Win32\Release\
set includes=%includes%;d:\Projects\source\LibFCL\DB\includes
rem %ExecPath% -NS%aliases%;data -I%includes% -R%resources% -U%units% -NU%OutputDCUs% BuildIB.dpr %OutputCmd%
set aliasesSave=%aliases%
set aliases=%aliases%;data
:IB

set OutputDCUs=%pathOut%\ib
cd d:\Hd_ibo\Projetos\Delphi\build
call :ShowCab (IB) 
call :ExecuteCmd BuildIB.dpr 

if not %ERRORLEVEL% == 0 GOTO Error
echo %msgSucess%

set units=%unitsSave%
set aliases=%aliasesSave%

goto :eof

:ShowCab
echo .
echo .
echo .
echo *************************************
echo * compilando %1
echo * Diretorio Atual: %cd%
echo *       Path DCUs: %OutputDCUs%
rem echo *      Units: %units%
rem echo *************************************
goto :eof

:getabsolute
set absolute=%~f1
goto :eof

:ExecuteCmd

if not exist %OutputDCUs% mkdir %OutputDCUs%

if %dversion% == D2007 goto :ExecuteCmdD2007

set cmdline=%ExecPath% -I%includes% -R%resources% -NS%aliases% -U%units% -NU%OutputDCUs% %1
echo Delphi XE %1
goto :ExecuteCmdDo
:ExecuteCmdD2007
set cmdline=%ExecPath% -I%includes% -R%resources% -U%units% -N0%OutputDCUs% %1
echo Delphi 2007 %1
:ExecuteCmdDo
echo ****************************************  >> %OutputFile% 
echo Delphi=%dversion% >> %OutputFile% 
echo Units=%units% >> %OutputFile% 
echo Includes=%includes% >> %OutputFile% 
echo DCUs=%OutputDCUs% >> %OutputFile% 

echo %cmdline% >> %OutputFile% 
%cmdline% %OutputCmd%
goto :eof

:Error
echo .
echo .
echo .
rem echo *************************************
echo ***********  E R R O  ***************
echo ***********  E R R O  ***************
echo ***********  E R R O  ***************
echo ***********  E R R O  ***************
echo * Diretorio Atual: %cd%
echo *************************************
rem set units=%unitsSave%
rem set aliases=%aliasesSave%
rem pause
timeout /T 5
start %OutputFile%
set Aborted=1
goto :eof

:end
:finish
cd %PathOrig%



