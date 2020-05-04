@echo off

rem set delphilibs=D:\projects\source\delphi\Libs\resources\
rem set delphiIBO=D:\Hd_ibo\Projetos\Delphi\Libs\resources\
set delphilibs=d:\Projects\source\Delphi\Libs
set delphilibsres=%delphilibs%\resources

set delphiIBO=D:\Hd_ibo\Projetos\Delphi\Libs
set delphiIBOres=%delphiIBO%\resources

copy %delphiIBO%\uCadPrinc.dfm                %delphiIBOres%
copy %delphiIBO%\uCadPrincMDI.dfm             %delphiIBOres%
copy %delphiIBO%\uPrinBuscaIB.dfm             %delphiIBOres%
copy %delphiIBO%\uCadGridPrimIB.dfm           %delphiIBOres%
copy %delphiIBO%\UAgenda.dfm                  %delphiIBOres%
copy %delphiIBO%\uBoleto.dfm  				 %delphiIBOres%
rem copy %delphiIBO%\UPrnEtiq.dfm                 %delphiIBOres%
rem copy %delphiIBO%\uPag_Dup.dfm                 %delphiIBOres%
rem rem copy %delphiIBO%\uCep_Ib.dfm                  %delphiIBOres%
copy %delphiIBO%\DbExcptM.dfm                 %delphiIBOres%
copy %delphiIBO%\uPag_Dup.dfm                 %delphiIBOres%
copy %delphiIBO%\UDinCons.dfm                 %delphiIBOres%


copy d:\Projects\source\progs\utils\Registro\Libs\cli\delphi\uRegistrFrm.dfm  %delphilibsres%
copy %delphilibs%\GSkins.RES                    %delphilibsres%
copy d:\Projects\source\delphi\Componentes\G_Pak\src\GFlatBtns.RES                 %delphilibsres%
copy %delphilibs%\Gimagens.RES                  %delphilibsres%
copy %delphilibs%\Gimagens2.RES                 %delphilibsres%
copy %delphilibs%\UGaugPri.dfm                  %delphilibsres%
copy %delphilibs%\uQrPrev1.dfm                 %delphilibsres%
copy %delphilibs%\uReducao.dfm                 %delphilibsres%
copy %delphilibs%\uVisuRel.dfm                 %delphilibsres%
copy %delphilibs%\URelacDlg.dfm                %delphilibsres%
copy %delphilibs%\uSplash.dfm                  %delphilibsres%
copy %delphilibs%\uMostraTroco.dfm             %delphilibsres%
rem copy %delphilibs%\uConfPrn.dfm                 %delphilibsres%
rem copy %delphilibs%\UCNP_CPF.dfm                 %delphilibsres%
copy %delphilibs%\uDlgAnivers.dfm              %delphilibsres%
copy %delphilibs%\uConfProtec.dfm              %delphilibsres%
copy d:\Projects\source\LibLCL\uCnpjCpfDlg.dfm              %delphilibsres%
copy %delphilibs%_DB\uBuscaDB.dfm                 %delphilibsres%
copy %delphilibs%_DB\uBuscaDlgCustom.dfm          %delphilibsres%
copy %delphilibs%\uFrameDescAcres.dfm          %delphilibsres%
copy %delphilibs%\uFMessages.dfm               %delphilibsres%
copy %delphilibs%\UniFormD1.dfm                %delphilibsres%
copy %delphilibs%\uPrnsele.dfm                 %delphilibsres%
copy %delphilibs%\uModCart.dfm                 %delphilibsres%
copy %delphilibs%\uImpCheq.dfm                 %delphilibsres%
rem copy %delphilibs%\UEditEtiquetas.dfm           %delphilibsres%
copy %delphilibs%\Rece_Pres.dfm                 %delphilibsres%
copy %delphilibs%\UVisuPrn.dfm                  %delphilibsres%
copy %delphilibs%\UCalenda.dfm                  %delphilibsres%
copy %delphilibs%\QModCart.dfm                  %delphilibsres%
copy %delphilibs%\UEditEtiqFormat.dfm           %delphilibsres%
copy %delphilibs%\ParaFmt.dfm                   %delphilibsres%
copy %delphilibs%\uMostraMens.dfm               %delphilibsres%

copy d:\Projects\source\LibLCL\panelbtns.dfm                 	  %delphilibsres%
copy d:\Projects\source\LibLCL\uDlgBase.dfm                 	  %delphilibsres%
copy d:\Projects\source\LibLCL\uDlg_Prim.dfm                	  %delphilibsres%
copy d:\Projects\source\LibLCL\uDlgESC.dfm                  	  %delphilibsres%
copy d:\Projects\source\LibLCL\uFrameSelEstabsBase.dfm            %delphilibsres%
copy d:\Projects\source\LibLCL\uFrameSelEstabs.dfm                %delphilibsres%
copy d:\Projects\source\LibLCL\uFrameCheckListFilter.dfm          %delphilibsres%

copy d:\Projects\source\delphi\Componentes\Quickrep5\qrenved.dfm         %delphilibsres%
copy d:\Projects\source\delphi\Componentes\Quickrep5\QRAbout.dfm         %delphilibsres%
copy d:\Projects\source\delphi\Componentes\Quickrep5\QRXSearchFrm.dfm    %delphilibsres%
copy d:\Projects\source\delphi\Componentes\Quickrep5\QRXBrowser.dfm      %delphilibsres%
copy d:\Projects\source\delphi\Componentes\Quickrep5\QRLablEd.dfm        %delphilibsres%
copy d:\Projects\source\delphi\Componentes\Quickrep5\QRExprEd.dfm        %delphilibsres%
copy d:\Projects\source\delphi\Componentes\Quickrep5\QRSearchDlg.dfm     %delphilibsres%
copy d:\Projects\source\delphi\Componentes\Quickrep5\QRPrev.dfm          %delphilibsres%
copy d:\Projects\source\delphi\Componentes\Quickrep5\QRPrgres.dfm        %delphilibsres%
copy d:\Projects\source\delphi\Componentes\Quickrep5\QRCompEd.dfm        %delphilibsres%
copy d:\Projects\source\delphi\Componentes\Quickrep5\QRExpBld.dfm        %delphilibsres%
copy d:\Projects\source\delphi\Componentes\Quickrep5\QUICKRPT.RES        %delphilibsres%



