program GMS_Node;

uses
  Vcl.Forms,
  uMain in 'fmMain\uMain.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
