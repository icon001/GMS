program ZTBMSToGMS;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {fmMain},
  uMIAMSDataBase in 'uMIAMSDataBase.pas' {dmGMSDataBase: TDataModule},
  uKTAMSDataBase in 'uKTAMSDataBase.pas' {dmZTBMSDataBase: TDataModule},
  uCommonVariable in 'uCommonVariable.pas',
  uCommonFunction in 'uCommonFunction.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TdmGMSDataBase, dmGMSDataBase);
  Application.CreateForm(TdmZTBMSDataBase, dmZTBMSDataBase);
  Application.Run;
end.
