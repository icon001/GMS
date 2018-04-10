{$APPTYPE CONSOLE}

program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  SvrPipeCtrl in 'SvrPipeCtrl.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
