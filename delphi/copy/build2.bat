@echo off
cls
set dversion=%1
if "%dversion%" == "xe" goto ConfigXe 

rem ConfigD2007
set dversion=D2007
set ExecPath="c:\program files (x86)\codegear\rad studio\5.0\bin\dcc32.exe" 
set configRelease= -B -Q -$D- -$L- -$Y-
set configDebug= -B -Q -$D+ -$L+ -$Y+
set PathParam=-N0
goto Prompt

:ConfigXe
              
set pathDelphi=c:\program files (x86)\embarcadero\studio\18.0\
set PathPub=C:\Users\Public\Documents\Embarcadero\Studio\18.0\
set ExecPath=%pathDelphi%
set PathUser=C:\Users\Gilson\Documents\Embarcadero\Studio\18.0\
set configDebug=-B -Q -TX.exe 
rem set configDebug=%configDebug% -AGenerics.Collections=System.Generics.Collections;Generics.Defaults=System.Generics.Defaults;WinTypes=Winapi.Windows;WinProcs=Winapi.Windows;DbiTypes=BDE;DbiProcs=BDE;DbiErrs=BDE 
set configDebug=%configDebug% -I"%pathDelphi%lib\Win32\release";"%pathDelphi%include";"%pathDelphi%Imports"
set configDebug=%configDebug%;D:\Projects\source\LibFCL\includes;d:\projects\source\Delphi\Libs\resources
rem set configDebug=%configDebug%;%PathUser%Imports;%PathPub%Dcp
rem set configDebug=%configDebug%;d:\Hd_ibo\Projetos\Delphi\Libs\resources

set configDebug=%configDebug% -LE%PathPub%Bpl -LN%PathPub%Dcp -NO..\lib\xe\Win32\Release\fcl
set configDebug=%configDebug% -NSData.Win;Datasnap.Win;Web.Win;Soap.Win;Xml.Win;Bde;System;Xml;Data;Datasnap;Web;Soap;Winapi;System.Win;Vcl;WinAPI.Networking;

rem set configDebug=%configDebug% -O"%pathDelphi%lib\Win32\release";%PathUser%Imports;"%pathDelphi%Imports";%PathPub%Dcp;"%pathDelphi%include"
set configDebug=%configDebug%;"C:\Program Files (x86)\FastReports\LibD24";%pathComps%jedi\350\jvcl\lib\d24\win32;%pathComps%jedi\350\jvcl\lib\D24\win32;%pathComps%jedi\350\jvcl\common
set configDebug=%configDebug%;%pathComps%jedi\350\jvcl\Resources;%pathComps%KBMTABLE\v7.71\Source\DXE8\Win32\Release
set configDebug=%configDebug%;D:\Projects\source\LibFCL\includes;D:\Projects\source\delphi\build\lib\xe\Win32\Release\fcl;d:\projects\source\Delphi\Libs\resources
set configDebug=%configDebug%;%pathComps%ibo\5_7\src\lib\d10_1\Win32\Release;%pathComps%jedi\350\jcl\lib\d24\win32;%pathComps%jedi\350\jcl\source\include
set configDebug=%configDebug%;D:\Projects\source\delphi\build\lib\xe\Win32\Release\lcl;D:\Projects\source\delphi\build\lib\xe\Win32\Release\db
set configDebug=%configDebug%;d:\Hd_ibo\Projetos\Delphi\build\lib\xe\Win32\Release;D:\projects\source\progs\utils\nfe\build\lib\xe\Win32\Release
set configDebug=%configDebug%;d:\Hd_ibo\Projetos\Delphi\Libs\resources

set configDebug=%configDebug% -R"%pathDelphi%lib\Win32\release";%PathUser%Imports;"%pathDelphi%Imports";%PathPub%Dcp;"%pathDelphi%include"
set configDebug=%configDebug%;"C:\Program Files (x86)\FastReports\LibD24";%pathComps%jedi\350\jvcl\lib\d24\win32;%pathComps%jedi\350\jvcl\lib\D24\win32;%pathComps%jedi\350\jvcl\common
set configDebug=%configDebug%;%pathComps%jedi\350\jvcl\Resources;%pathComps%KBMTABLE\v7.71\Source\DXE8\Win32\Release;D:\Projects\source\LibFCL\includes
set configDebug=%configDebug%;D:\Projects\source\delphi\build\lib\xe\Win32\Release\fcl;d:\projects\source\Delphi\Libs\resources;%pathComps%ibo\5_7\src\lib\d10_1\Win32\Release
set configDebug=%configDebug%;%pathComps%jedi\350\jcl\lib\d24\win32;%pathComps%jedi\350\jcl\source\include;D:\Projects\source\delphi\build\lib\xe\Win32\Release\lcl
set configDebug=%configDebug%;D:\Projects\source\delphi\build\lib\xe\Win32\Release\db;d:\Hd_ibo\Projetos\Delphi\build\lib\xe\Win32\Release;D:\projects\source\progs\utils\nfe\build\lib\xe\Win32\Release
set configDebug=%configDebug%;d:\Hd_ibo\Projetos\Delphi\Libs\resources

set configDebug=%configDebug% -U"%pathDelphi%lib\Win32\release";%PathUser%Imports;"%pathDelphi%Imports";%PathPub%Dcp;"%pathDelphi%include";D:\Projects\source\LibFCL\includes
set configDebug=%configDebug%;d:\projects\source\Delphi\Libs\resources -NB%PathPub%Dcp -NH%PathPub%hpp\Win32 

rem set configDebug=%configDebug% -U"%ExecPath%lib\win32\release"
set configRelease=-$D0 -$L- -$Y- %configDebug%
set ExecPath="%ExecPath%bin\dcc32.exe" 
set PathParam=-NU


:Prompt

 
set PathOrig=%CD%
rem CHOICE /C RDC /N /T 10 /D C /M "Selecione D para compilar com informacao de debug, R para release ou C para cancelar."
CHOICE /C CDR /T 10 /D C /M "Selecione D para compilar com informacao de debug, R para releas eou C para cancelar."
if %ERRORLEVEL% == 3 goto ExecRelease
if %ERRORLEVEL% == 2 goto ExecDebug

echo **********************
echo Cancelado
echo **********************
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

set pathOut=lib\%dversion%\Win32\%configdir%
echo ********************************************
echo              C o m p i l a n d o 
echo             Versao: %dversion% 
echo               Modo: %configdir%
echo       Configuracao:(%config%)
echo ********************************************
timeout 5
rem goto end
@echo on
del %pathOut%\*.dcu /s > deleteds.txt
del D:\Hd_ibo\Projetos\Delphi\build\%pathOut%\*.dcu /s >> deleteds.txt
del D:\projects\source\progs\utils\Registro\Libs\build\%pathOut%\*.dcu >> deleteds.txt
del D:\projects\source\progs\utils\nfe\build\%pathOut%\*.dcu >> deleteds.txt
rem cd d2007
cd xe

set msgSucess= ***** SUCESSO ********
rem set FileOutput=^> %PathOrig%\out.txt
set FileOutput=

rem echo %PathOrig%
set includes=d:\Projects\source\LibFCL\includes
echo .
echo **********************
echo compilando Build1.dpr (fcl)
echo %cd%
set ExecPath=%ExecPath% %config%
set pathparam=%PathParam%..\%pathOut%\
rem @echo on
%ExecPath% -I%includes% %PathParam%fcl Build1.dpr %FileOutput%

if not %ERRORLEVEL% == 0 GOTO Error
echo %msgSucess%


echo .
echo **********************
echo compilando BuildLCL.dpr
echo %cd%

rem set paramextra= -NSSystem;Xml;Data;Datasnap;Web;Soap;Winapi;Vcl;Vcl.Imaging;Vcl.Samples;Vcl.Touch;Vcl.Shell

set units=D:\projects\source\Delphi\build\%pathOut%\fcl;d:\projects\source\Components\jedi\350\jcl\lib\D11;d:\projects\source\Components\jedi\350\jvcl\lib\D11
set includes=%includes%;D:\projects\source\Components\jedi\350\jvcl\common;D:\projects\source\Components\jedi\350\jcl\source\include
set resources=d:\Projects\source\Components\jedi\350\jvcl\resources;d:\Projects\source\Delphi\Libs\resources
if not "%FileOutput%" == "" set FileOutput=^>%PathOrig%

%ExecPath% %paramextra% -U%units% -I%includes% -R%resources% %PathParam%lcl Buildlcl.dpr  %FileOutput%
if not %ERRORLEVEL% == 0 GOTO Error
echo %msgSucess%



echo .
echo **********************
echo compilando BuildDB.dpr  
echo %cd%

set units=%units%;d:\projects\source\Delphi\build\%pathOut%\lcl;d:\projects\source\Delphi\Componentes\Quickrep5\lib\%dversion%\win32\Release
rem echo -U%units%
%ExecPath% %PathParam%db -I%includes% -U%units% -R%resources% BuildDB.dpr %FileOutput%
if not %ERRORLEVEL% == 0 GOTO Error
echo %msgSucess%


echo .
echo **********************
echo compilando BuildReg.dpr  (REG)
cd D:\projects\source\progs\utils\Registro\Libs\build\%dversion%
echo %cd%

rem set includes=%includes%;d:\Projects\source\LibFCL\DB\includes
%ExecPath% %PathParam% -I%includes% -U%units% -R%resources% BuildReg.dpr %FileOutput%

if not %ERRORLEVEL% == 0 GOTO Error
echo %msgSucess%

echo .
echo **********************
echo compilando BuildNFe.dpr  (NF-e)
cd D:\projects\source\progs\utils\nfe\build\%dversion%
echo %cd%
rem set includes=%includes%;d:\Projects\source\LibFCL\DB\includes
set rootpath=D:\Projects\source\Delphi\Componentes\ACBR\src\Fontes\
set unitstmp=%units%;%rootpath%PCN2;%rootpath%ACBrComum;%rootpath%ACBrNFe2;%rootpath%synalist;%rootpath%ZLibExGZ;%rootpath%ACBrCapicom
set includestmp=%includes%;%rootpath%ACBrComum
%ExecPath% %PathParam% -I%includestmp% -U%unitstmp% -R%resources% BuildNFe.dpr %FileOutput%

if not %ERRORLEVEL% == 0 GOTO Error
echo %msgSucess%

echo .
echo **********************
echo compilando BuildIB.dpr  (IB)
cd d:\Hd_ibo\Projetos\Delphi\build\%dversion%
echo %cd%
rem set units=%units%;d:\projects\source\Delphi\build\%pathOut%\lcl;d:\projects\source\Delphi\Componentes\Quickrep5\lib\%dversion%\win32\Release
set units=%units%;d:\projects\source\Delphi\build\%pathOut%\db;d:\Projects\source\Components\ibo\5_7\lib\%dversion%\Win32\Release
rem echo -U%units%
set includes=%includes%;d:\Projects\source\LibFCL\DB\includes
%ExecPath% %PathParam% -I%includes% -U%units% -R%resources% BuildIB.dpr %FileOutput%

if not %ERRORLEVEL% == 0 GOTO Error
echo %msgSucess%
goto end

:Error
echo ** Erro ***

:end
pause

:finish
cd %PathOrig%
