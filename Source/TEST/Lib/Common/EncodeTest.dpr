program EncodeTest;

uses
  Vcl.Forms,
  uEncodeTest in '..\..\..\[TEST]\encodeTest\uEncodeTest.pas' {Form1},
  uCommonFunction in 'uCommonFunction.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
