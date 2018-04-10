unit uSprash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, EllipsLabel, Vcl.ExtCtrls,
  Vcl.ComCtrls, AdvProgr, Vcl.Samples.Gauges, Vcl.Imaging.jpeg;

type
  TfmSprash = class(TForm)
    Image1: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSprash: TfmSprash;

implementation

{$R *.dfm}

end.
