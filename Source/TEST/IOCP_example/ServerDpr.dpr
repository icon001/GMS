// 예제 서버
//ServerDpr.dpr
program ServerDpr;

uses
  Forms,
  ServerMainUnit in 'ServerMainUnit.pas',
  IOCPComp in 'IOCPComp.pas',
  CommonUnit in 'CommonUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TServerMainForm, ServerMainForm);
  Application.Run;
end.
