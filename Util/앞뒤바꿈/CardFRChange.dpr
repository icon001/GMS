program CardFRChange;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {Form1},
  uCommonEvent in '..\..\Lib\Common\uCommonEvent.pas',
  uCommonFunction in '..\..\Lib\Common\uCommonFunction.pas',
  uCommonVariable in '..\..\Lib\Common\uCommonVariable.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
