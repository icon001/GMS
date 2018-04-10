unit uNodeThread;

interface

uses
  System.SysUtils, System.Classes,
  uDeviceVariable;

type
  TNodeThread = class(TThread)
  private
    FOnRcvData: TNotifyReceive;
    { Private declarations }
  protected
    procedure Execute; override;

  public
    { Public declarations }
    constructor Create(aNodeNo:integer);
    destructor Destroy; override;
  public
    ProPerty OnRcvData : TNotifyReceive read FOnRcvData write FOnRcvData;
  end;

  TdmThread = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmThread: TdmThread;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TNodeThread }

constructor TNodeThread.Create(aNodeNo:integer);
begin
  inherited Create(True);
  FreeOnTerminate := False;

end;

destructor TNodeThread.Destroy;
begin

  inherited;
end;

procedure TNodeThread.Execute;
begin
  inherited;

end;

end.
