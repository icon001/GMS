{$APPTYPE CONSOLE}

program IOCPTest;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {Form1},
  IOCPCtrl in 'IOCPCtrl.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
