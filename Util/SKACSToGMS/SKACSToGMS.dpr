program SKACSToGMS;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {fmMain},
  uMIAMSDataBase in 'uMIAMSDataBase.pas' {dmMIAMSDataBase: TDataModule},
  uSKACSDataBase in 'uSKACSDataBase.pas' {dmSKACSDataBase: TDataModule},
  uCommonVariable in 'uCommonVariable.pas',
  uCommonFunction in 'uCommonFunction.pas',
  uSKOrgDatabase in 'uSKOrgDatabase.pas' {dmSKOrgDataBase: TDataModule};

{$R *.res}
{$R manifest.RES}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TdmMIAMSDataBase, dmMIAMSDataBase);
  Application.CreateForm(TdmSKACSDataBase, dmSKACSDataBase);
  Application.CreateForm(TdmSKOrgDataBase, dmSKOrgDataBase);
  Application.Run;
end.
