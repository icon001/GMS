// ���� Ŭ���̾�Ʈ
///////////////////////////////////////////////////////////////////////////
//ClientDpr.dpr
program ClientDpr;

uses
  Forms,
  ClientMainUnit in 'ClientMainUnit.pas' {ClientMainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TClientMainForm, ClientMainForm);
  Application.Run;
end.
