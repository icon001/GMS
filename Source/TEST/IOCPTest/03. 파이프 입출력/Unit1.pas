unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  SvrPipeCtrl, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    SvrPipeHandler: TSvrPipeHandler;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
begin
  if Assigned(SvrPipeHandler) then Exit;
  SvrPipeHandler:= TSvrPipeHandler.Create('Pipe_Ex', 0, 0, TSvrPipeInstance);
  WriteLn('파이프핸들러 생성');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if not Assigned(SvrPipeHandler) then Exit;
  FreeAndNil(SvrPipeHandler);
  WriteLn('파이프핸들러 해제');
end;

end.
