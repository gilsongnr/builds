@echo off
cls

set PathOrig=%CD%
rem set delphilibs=D:\projects\source\liblcl\delphi
set delphi_res=D:\projects\source\liblcl\delphi\resources

set delphiIBO=D:\Hd_ibo\Projetos\Delphi\Libs
set delphiIBOres=%delphiIBO%\resources

set msgSucess= ***** SUCESSO ********
set OutputFile=%PathOrig%\out.txt
set OutputCmd=
set OutputCmd=^>^> %OutputFile%
type %OutputFile% > %OutputFile% 

rem goto Error
rem Shift
echo ("%1")
if "%1"=="nfe" goto nfe
if "%1"=="ib" goto IB

set pathComps=d:\Projects\source\Components\
if "%1"=="D2007" goto ConfigD2007 

rem Delphi XE
set dversion=xe
set pathDelphi=c:\program files (x86)\embarcadero\studio\19.0\
rem set PathPub=C:\Users\Public\Documents\Embarcadero\Studio\19.0\
rem set PathUser=C:\Users\Gilson\Documents\Embarcadero\Studio\19.0\
set configDebug=-B -Q -TX.exe
rem set configDebug=%configDebug% -W-W1057 -W-W1058 
set configDebug=%configDebug% -W-IMPLICIT_STRING_CAST -W-IMPLICIT_STRING_CAST_LOSS --inline:off
rem set configDebug=%configDebug% -AGenerics.Collections=System.Generics.Collections;Generics.Defaults=System.Generics.Defaults;WinTypes=Winapi.Windows;WinProcs=Winapi.Windows;DbiTypes=BDE;DbiProcs=BDE;DbiErrs=BDE 
rem set configDebug=%configDebug% -I"%pathDelphi%lib\Win32\release";"%pathDelphi%include";"%pathDelphi%Imports"
rem set configDebug=%configDebug%;D:\Projects\source\LibFCL\includes;%delphi_res%
rem set configDebug=%configDebug%;%PathUser%Imports;%PathPub%Dcp
rem set configDebug=%configDebug%;%delphiIBOres%

rem set configDebug=%configDebug% -LE%PathPub%Bpl -LN%PathPub%Dcp
rem set configDebug=%configDebug% -NO..\lib\xe\Win32\Release\fcl
rem set configDebug=%configDebug% -NSData.Win;Datasnap.Win;Web.Win;Soap.Win;Xml.Win;Bde;System;Xml;Data;Datasnap;Web;Soap;Winapi;System.Win;Vcl;WinAPI.Networking;

rem set configDebug=%configDebug% -O"%pathDelphi%lib\Win32\release";%PathUser%Imports;"%pathDelphi%Imports";%PathPub%Dcp;"%pathDelphi%include"
rem set configDebug=%configDebug%;"C:\Program Files (x86)\FastReports\LibD24";%pathComps%jedi\350\jvcl\lib\d24\win32;%pathComps%jedi\350\jvcl\lib\D24\win32;%pathComps%jedi\350\jvcl\common
rem set configDebug=%configDebug%;%pathComps%jedi\350\jvcl\Resources
rem set configDebug=%configDebug%;D:\Projects\source\LibFCL\includes;D:\Projects\source\delphi\build\lib\xe\Win32\Release\fcl;%delphi_res%
rem set configDebug=%configDebug%;%pathComps%ibo\5_7\src\lib\d10_1\Win32\Release;%pathComps%jedi\350\jcl\lib\d24\win32;%pathComps%jedi\350\jcl\source\include
rem set configDebug=%configDebug%;D:\Projects\source\delphi\build\lib\xe\Win32\Release\lcl;D:\Projects\source\delphi\build\lib\xe\Win32\Release\db
rem set configDebug=%configDebug%;d:\Hd_ibo\Projetos\Delphi\build\lib\xe\Win32\Release;D:\projects\source\progs\utils\nfe\build\lib\xe\Win32\Release
rem set configDebug=%configDebug%;%delphiIBOres%

rem set configDebug=%configDebug% -R"%pathDelphi%lib\Win32\release";%PathUser%Imports;"%pathDelphi%Imports";%PathPub%Dcp;"%pathDelphi%include"
rem set configDebug=%configDebug%;"C:\Program Files (x86)\FastReports\LibD24";%pathComps%jedi\350\jvcl\lib\d24\win32;%pathComps%jedi\350\jvcl\lib\D24\win32;%pathComps%jedi\350\jvcl\common
rem set configDebug=%configDebug%;%pathComps%jedi\350\jvcl\Resources;%pathComps%KBMTABLE\v7.71\Source\DXE8\Win32\Release;D:\Projects\source\LibFCL\includes
rem set configDebug=%configDebug%;D:\Projects\source\delphi\build\lib\xe\Win32\Release\fcl;%delphi_res%;%pathComps%ibo\5_7\src\lib\d10_1\Win32\Release
rem set configDebug=%configDebug%;%pathComps%jedi\350\jcl\lib\d24\win32;%pathComps%jedi\350\jcl\source\include;D:\Projects\source\delphi\build\lib\xe\Win32\Release\lcl
rem set configDebug=%configDebug%;D:\Projects\source\delphi\build\lib\xe\Win32\Release\db;d:\Hd_ibo\Projetos\Delphi\build\lib\xe\Win32\Release;D:\projects\source\progs\utils\nfe\build\lib\xe\Win32\Release
rem set configDebug=%configDebug%;%delphiIBOres%

rem set configDebug=%configDebug% -U"%pathDelphi%lib\Win32\release";%PathUser%Imports;"%pathDelphi%Imports";%PathPub%Dcp;"%pathDelphi%include";D:\Projects\source\LibFCL\includes
rem set configDebug=%configDebug%;%delphi_res%
rem set configDebug=%configDebug% -NB%PathPub%Dcp -NH%PathPub%hpp\Win32
rem set configDebug=%configDebug% -U"%ExecPath%lib\win32\release"
set configRelease=-$D0 -$L- -$Y- %configDebug%
set ExecPath="%pathDelphi%bin\dcc32.exe" 

rem goto ExecDebug
rem goto ExecRelease
goto Prompt

:ConfigD2007

set dversion=D2007
set pathDelphi=c:\program files (x86)\codegear\rad studio\5.0\
rem set PathPub=C:\Users\Public\Documents\Embarcadero\Studio\18.0\
rem set PathUser=C:\Users\Gilson\Documents\Embarcadero\Studio\18.0\
rem set PathPub=
rem set PathUser=

set configDebug=-B -Q 
set configRelease=-$D0 -$L- -$Y- %configDebug%
set ExecPath="%pathDelphi%bin\dcc32.exe" 

:Prompt

rem cd %dversion%
rem CHOICE /C RDC /N /T 10 /D C /M "Selecione D para compilar com informacao de debug, R para Release ou C para cancelar."
echo .
echo ********************************************
echo *           Versao: %dversion% 
echo ********************************************
echo .

echo Selecione D para compilar com informacao de debug, R para releas eou C para cancelar.
CHOICE /C CDR /T 10 /D C 
if %ERRORLEVEL% == 3 goto ExecRelease
if %ERRORLEVEL% == 2 goto ExecDebug

echo *************************************
echo Cancelado
echo *************************************
goto finish

:ExecRelease

rem CONFIG RELEASE
set config=-DRELEASE %configRelease%
rem set config= -B -Q -$D- -$L- -$Y-
set configdir=Release
goto Compile

:ExecDebug
rem set config= -B -Q -$D+ -$L+ -$Y+
set config=-DDEBUG %configDebug%
set configdir=Debug
 

:Compile
echo ********************************************
echo              C o m p i l a n d o 
echo             Versao: %dversion% 
echo               Modo: %configdir%
echo       Configuracao:(%config%)
echo ********************************************
rem timeout 5
rem goto end
rem @echo on

rem ***************************************************************
set pathOut=%PathOrig%\lib\%dversion%\Win32\%configdir%
del %pathOut%\*.dcu

set OutputDCUs=%pathOut%

rem call :getabsolute "..\%pathOut%"
rem echo %absolute%

cd D:\projects\source\libfcl\delphi\build
set OutputDCUs_tmp=%OutputDCUs%\fcl
rem ***************************************************************
call :ShowCab (FCL) %OutputDCUs_tmp%
rem goto Error

rem echo %PathOrig%
set includes=D:\projects\source\libfcl\includes
set aliases=System;Winapi;System.Win;vcl
set ExecPath=%ExecPath% %config%
set units=
set resources=
rem @echo on
echo . >> %OutputFile% 
echo . >> %OutputFile% 

call :ExecuteCmd Build1.dpr 

if not %ERRORLEVEL% == 0 GOTO Error
echo %msgSucess%


set units=%OutputDCUs_tmp%
cd D:\projects\source\liblcl\delphi\build

rem ***************************************************************
set OutputDCUs_tmp=%OutputDCUs%\lcl
call :ShowCab (LCL) %OutputDCUs_tmp%

rem set paramextra= -NSSystem;Xml;Data;Datasnap;Web;Soap;Winapi;Vcl;Vcl.Imaging;Vcl.Samples;Vcl.Touch;Vcl.Shell
set DJedi=D25\win32
if %dversion% == D2007 set DJedi=D11

set units=%units%;%pathComps%jedi\350\jcl\lib\%DJedi%;%pathComps%jedi\350\jvcl\lib\%DJedi%
set includes=%includes%;%pathComps%jedi\350\jvcl\common;%pathComps%jedi\350\jcl\source\include
set resources=%pathComps%jedi\350\jvcl\resources;%delphi_res%
rem                   Data.Win;Xml;Data;WinAPI.Networking;
rem set aliases=%aliases%;Data.Win;Xml;Data;WinAPI.Networking;
if not %dversion% == D2007 set aliases=%aliases%;Vcl.Imaging;Vcl.Samples

call :ExecuteCmd Buildlcl.dpr 

if not %ERRORLEVEL% == 0 GOTO Error
echo %msgSucess%


rem ***************************************************************
set units=%units%;%OutputDCUs_tmp%

set OutputDCUs_tmp=%OutputDCUs%\db
call :ShowCab (DB) %OutputDCUs_tmp%
rem set units=%units%;d:\projects\source\Delphi\build\%pathOut%\lcl;d:\projects\source\Delphi\Componentes\Quickrep5\lib\%dversion%\win32\Release

if not %dversion% == D2007 set units=%units%;%pathComps%KBMTABLE\v7.71\lib\DXE\Win32\Release
rem echo -U%units%
set unitsSave=%units%
rem set units=%units%;d:\Projects\source\delphi\Componentes\Quickrep5
rem set units=%units%;d:\Projects\source\delphi\Componentes\Quickrep5\lib\%dversion%\Win32\Release\
rem if not %dversion% == D2007  
set units=%units%;d:\Projects\source\delphi\Componentes\Quickrep5

set aliasesSave=%aliases%
set aliases=%aliases%;data

call :ExecuteCmd BuildDB.dpr 

if not %ERRORLEVEL% == 0 GOTO Error
echo %msgSucess%

set unitsSave2=%unitsSave%;%OutputDCUs_tmp%
rem goto end

set units=%unitsSave%
set aliases=%aliasesSave%



rem ***************************************************************
set pathtmp=D:\projects\source\progs\utils\Registro\Libs\build
cd %pathtmp%
set OutputDCUs_tmp=%OutputDCUs%\reg
call :ShowCab (REG) %OutputDCUs_tmp%
rem goto Error
rem set includes=%includes%;d:\Projects\source\LibFCL\DB\includes



call :ExecuteCmd BuildReg.dpr 

rem %exec% %config% -D%configdir% -N0..\lib\d2007\Win32\%configdir%\ -I%includes% -U%units% -R%resources% BuildReg.dpr %outfile%
rem %ExecPath% -NS%aliases% -I%includes% -R%resources% -U%units% -NU%OutputDCUs% BuildReg.dpr %OutputCmd%
rem %ExecPath% -NS%aliases% -I%includestmp% -R%resources% -U%unitstmp% -NU%OutputDCUs% BuildNFe.dpr %OutputCmd%

if not %ERRORLEVEL% == 0 GOTO Error
echo %msgSucess%

rem goto end
rem goto skeepnfe
:nfe
rem ***************************************************************
set pathtmp=D:\projects\source\progs\utils\nfe\build
cd %pathtmp%
set OutputDCUs_tmp=%OutputDCUs%\nfe

call :ShowCab (NF-e) "%OutputDCUs_tmp%"

set unitsSave=%units%
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

set pathtmp=d:\Hd_ibo\Projetos\Delphi\build
cd %pathtmp%
set OutputDCUs_tmp=%OutputDCUs%\ib

call :ShowCab (IB) "%OutputDCUs_tmp%"

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
echo *      Path DCUs: %2
rem echo *      Units: %units%
rem echo *************************************
goto :eof

:getabsolute
set absolute=%~f1
goto :eof

:ExecuteCmd
rem call :getabsolute %OutputDCUs%
rem set OutDcustmp=%absolute%
rem set OutDcustmp=%OutputDCUs%
rem echo %OutDcustmp%
rem set OutDcustmp=%OutDcustmp%%2
rem echo %OutDcustmp%
if %dversion% == D2007 goto :ExecuteCmdD2007

set cmdline=%ExecPath% -I%includes% -R%resources% -NS%aliases% -U%units% -NU%OutputDCUs_tmp% %1
echo Delphi XE %1
goto :ExecuteCmdDo
:ExecuteCmdD2007
set cmdline=%ExecPath% -I%includes% -R%resources% -U%units% -N0%OutputDCUs_tmp% %1
echo Delphi 2007 %1
:ExecuteCmdDo
echo ****************************************  >> %OutputFile% 
echo Delphi=%dversion% >> %OutputFile% 
echo Units=%units% >> %OutputFile% 
echo Includes=%includes% >> %OutputFile% 
echo <OutputDCUs>=%OutDcustmp% >> %OutputFile% 

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



