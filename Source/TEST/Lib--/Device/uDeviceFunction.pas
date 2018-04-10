unit uDeviceFunction;

interface

uses
  System.SysUtils, System.Classes;

type
  TdmDeviceFunction = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDeviceFunction: TdmDeviceFunction;

implementation
uses
  uCommonFunction,
  uDeviceVariable;

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TDataModule1 }



end.
