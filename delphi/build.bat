@echo off
cls

set PathOrig=%CD%
set delphi_res=D:\projects\source\liblcl\delphi\resources

set delphiIBO=D:\Hd_ibo\Projetos\Delphi\Libs
set delphiIBOres=%delphiIBO%\resources

set msgSucess= ***** SUCESSO ********
set OutputFile=%PathOrig%\out.txt
set OutputCmd=
set OutputCmd=^>^> %OutputFile%
type %OutputFile% > %OutputFile% 

echo ("%1")
if "%1"=="nfe" goto nfe
if "%1"=="ib" goto IB

set pathComps=d:\Projects\source\Components\
if "%1"=="D2007" goto ConfigD2007 

set dversion=xe
set pathDelphi=c:\program files (x86)\embarcadero\studio\19.0\
set configDebug=-B -Q -TX.exe
set configDebug=%configDebug% -W-IMPLICIT_STRING_CAST -W-IMPLICIT_STRING_CAST_LOSS --inline:off
set configRelease=-$D0 -$L- -$Y- %configDebug%
set ExecPath="%pathDelphi%bin\dcc32.exe" 

goto Prompt

:ConfigD2007

set dversion=D2007
set pathDelphi=c:\program files (x86)\codegear\rad studio\5.0\
set configDebug=-B -Q 
set configRelease=-$D0 -$L- -$Y- %configDebug%
set ExecPath="%pathDelphi%bin\dcc32.exe" 

:Prompt

echo .
echo ********************************************
echo *           Versao: %dversion% 
echo ********************************************
echo .

echo Selecione D para compilar com informacao de debug, R para release ou C para cancelar.
CHOICE /C CDR /T 10 /D C 
if %ERRORLEVEL% == 3 goto ExecRelease
if %ERRORLEVEL% == 2 goto ExecDebug

echo *************************************
echo Cancelado
echo *************************************
goto finish

:ExecRelease
set config=-DRELEASE %configRelease%
set configdir=Release
goto Compile

:ExecDebug
set config=-DDEBUG %configDebug%
set configdir=Debug

:Compile
echo ********************************************
echo              C o m p i l a n d o 
echo             Versao: %dversion% 
echo               Modo: %configdir%
echo       Configuracao:(%config%)
echo ********************************************

set pathOutBase=%PathOrig%\lib\%dversion%\Win32\%configdir%
del %pathOutBase%\*.dcu

rem ***************************************************************
cd D:\projects\source\libfcl\delphi\build
set pOutputDCUsFCL=%pathOutBase%\fcl
set pOutputDCUs=%pOutputDCUsFCL%
call :ShowCab (FCL) 

set includes=D:\projects\source\libfcl\includes
set aliases=System;Winapi;System.Win
set ExecPath=%ExecPath% %config%
set units=
set resources=

echo . >> %OutputFile% 
echo . >> %OutputFile% 

call :ExecuteCmd Build1.dpr 

if not %ERRORLEVEL% == 0 GOTO Error
echo %msgSucess%

set units=%pOutputDCUsFCL%







rem ***************************************************************
set pOutputDCUs=%pathOutBase%\db
call :ShowCab (DB) 

set aliasesSave=%aliases%
set aliases=%aliases%;data

call :ExecuteCmd BuildDB.dpr 

if not %ERRORLEVEL% == 0 GOTO Error
echo %msgSucess%





cd D:\projects\source\liblcl\delphi\build

rem ***************************************************************
set pOutputDCUs=%pathOutBase%\lcl
call :ShowCab (LCL) 

set DJedi=D25\win32
if %dversion% == D2007 set DJedi=D11

set units=%units%;%pathComps%jedi\350\jcl\lib\%DJedi%;%pathComps%jedi\350\jvcl\lib\%DJedi%
set includes=%includes%;%pathComps%jedi\350\jvcl\common;%pathComps%jedi\350\jcl\source\include
set resources=%pathComps%jedi\350\jvcl\resources;%delphi_res%

if not %dversion% == D2007 set aliases=%aliases%;Vcl.Imaging;Vcl.Samples

call :ExecuteCmd Buildlcl.dpr 

if not %ERRORLEVEL% == 0 GOTO Error
echo %msgSucess%


rem ***************************************************************
set units=%units%;%pOutputDCUs%
set pOutputDCUs=%pathOutBase%\db
call :ShowCab (LCL_DB) 

if not %dversion% == D2007 set units=%units%;%pathComps%KBMTABLE\v7.71\lib\DXE\Win32\Release
set unitsSave=%units%
set units=%units%;%pOutputDCUs%;d:\Projects\source\delphi\Componentes\Quickrep5

set aliasesSave=%aliases%
set aliases=%aliases%;data

call :ExecuteCmd BuildLCL_DB.dpr 

if not %ERRORLEVEL% == 0 GOTO Error
echo %msgSucess%

set unitsSave2=%unitsSave%;%pOutputDCUs%
rem goto end

set units=%unitsSave%
set aliases=%aliasesSave%



rem ***************************************************************
set pathtmp=D:\projects\source\progs\utils\Registro\Libs\build
cd %pathtmp%
set pOutputDCUs=%pathOutBase%\reg
call :ShowCab (REG) 
rem goto Error
rem set includes=%includes%;d:\Projects\source\LibFCL\DB\includes



call :ExecuteCmd BuildReg.dpr 

if not %ERRORLEVEL% == 0 GOTO Error
echo %msgSucess%

:nfe
rem ***************************************************************
set pathtmp=D:\projects\source\progs\utils\nfe\build
cd %pathtmp%
set pOutputDCUs=%pathOutBase%\nfe

call :ShowCab (NF-e)

set unitsSave=%units%
set includesSave=%includes%
set rootpath=D:\projects\source\automacao\nfe\src\core\
set units=%units%;%rootpath%common;%rootpath%PCNComum;%rootpath%DFe;%rootpath%DFe\NFe;%rootpath%DFe\NFe\PCN
set units=%units%;%rootpath%..\terceiros\gilson
set units=%units%;%rootpath%..\terceiros\ZLibExGZ
set units=%units%;%rootpath%..\terceiros\ACBrCapicom
set includes=%includes%;%rootpath%common

call :ExecuteCmd BuildNFe.dpr 

if not %ERRORLEVEL% == 0 GOTO Error
echo %msgSucess%

set units=%unitsSave2%
set includes=%includesSave%

:skeepnfe
set dversiontmp=d10_1
if %dversion% == D2007 set dversiontmp=d2007
set units=%units%;%pathComps%ibo\5_7\src\lib\%dversiontmp%\Win32\Release;
set includes=%includes%;d:\Projects\source\LibFCL\DB\includes
set aliasesSave=%aliases%
set aliases=%aliases%;data

:IB
set pathtmp=d:\Hd_ibo\Projetos\Delphi\build
cd %pathtmp%
set pOutputDCUs=%pathOutBase%\ib

call :ShowCab (IB)

call :ExecuteCmd BuildIB.dpr 

if not %ERRORLEVEL% == 0 GOTO Error
echo %msgSucess%

set units=%unitsSave%
set aliases=%aliasesSave%


goto end

:ShowCab
echo .
echo .
echo .
echo *************************************
echo * compilando %1
echo * Diretorio Atual: %cd%
echo *      Path DCUs: %pOutputDCUs%
rem echo *      Units: %units%
rem echo *************************************
goto :eof

:getabsolute
set absolute=%~f1
goto :eof

:ExecuteCmd

if not exist %pOutputDCUs% mkdir %pOutputDCUs%

if %dversion% == D2007 goto :ExecuteCmdD2007

set cmdline=%ExecPath% -I%includes% -R%resources% -NS%aliases% -U%units% -NU%pOutputDCUs% %1
echo Delphi XE %1
goto :ExecuteCmdDo
:ExecuteCmdD2007
set cmdline=%ExecPath% -I%includes% -R%resources% -U%units% -N0%pOutputDCUs% %1
echo Delphi 2007 %1
:ExecuteCmdDo
echo ****************************************  >> %OutputFile% 
echo Delphi=%dversion% >> %OutputFile% 
echo Units=%units% >> %OutputFile% 
echo Includes=%includes% >> %OutputFile% 
echo DCUs=%pOutputDCUs% >> %OutputFile% 

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
pause
start %OutputFile%


:end
:finish
cd %PathOrig%
rem goto :eof



