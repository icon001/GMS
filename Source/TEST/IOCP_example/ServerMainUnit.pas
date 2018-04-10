////////////////////////////////////////////////////////////////////////////
//ServerMainUnit.pas
unit ServerMainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IOCPComp, SyncObjs, StdCtrls, ExtCtrls;

type
  TServerMainForm = class(TForm)
    PortEdit: TEdit;
    ActiveButton: TButton;
    Label1: TLabel;
    MsgMemo: TMemo;
    Button1: TButton;
    ClientMsgEdit: TEdit;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label6: TLabel;
    CountText: TStaticText;
    ConnectionCountText: TStaticText;
    Timer1: TTimer;
    procedure ActiveButtonClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    FRequestCount: Integer;
    FLock: TCriticalSection;
    FServerSocket: TServerSocket;
    FServerActive: Boolean;
    function OnClientRead(ASocket: TCustomSocket; AData: Pointer;
      ACount: Integer): Integer;
    procedure OnClientError(ASocket: TCustomSocket; ErrorEvent: TErrorEvent;
      var ErrCode: Integer);
    procedure OnClientEvent(ASocket: TCustomSocket; SocketEvent: TSocketEvent);
    procedure SetServerActive(const Value: Boolean);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property ServerActive: Boolean read FServerActive write SetServerActive;
  end;

var
  ServerMainForm: TServerMainForm;

implementation

uses CommonUnit, TypInfo;
{$R *.dfm}

{ TServerMainForm }

constructor TServerMainForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FLock := TCriticalSection.Create;
  FServerSocket := TServerSocket.Create;
  FServerSocket.OnClientRead := OnClientRead;
  FServerSocket.OnClientError := OnClientError;
  FServerSocket.OnClientEvent := OnClientEvent;
  FServerSocket.OnErrorEvent := OnClientError;
  FServerSocket.OnEventEvent := OnClientEvent;
end;

destructor TServerMainForm.Destroy;
begin
  Timer1.Enabled := False;
  FServerSocket.Free;
  FLock.Free;
  inherited Destroy;
end;

procedure TServerMainForm.OnClientError(ASocket: TCustomSocket;
  ErrorEvent: TErrorEvent; var ErrCode: Integer);
begin
  FLock.Enter;
  try
    MsgMemo.Lines.Add('Error: ' + SysErrorMessage(ErrCode))
  finally
    FLock.Leave;
  end;
end;

procedure TServerMainForm.OnClientEvent(ASocket: TCustomSocket;
  SocketEvent: TSocketEvent);
begin
 { FLock.Enter;
  try
    MsgMemo.Lines.Add(GetEnumName(TypeInfo(TSocketEvent), Ord(SocketEvent)));
    if SocketEvent in [seConnect, seDisconnect] then
  finally
    FLock.Leave;
  end; }
end;

function TServerMainForm.OnClientRead(ASocket: TCustomSocket;
  AData: Pointer; ACount: Integer): Integer;
begin
  FLock.Enter;
  try
    Inc(FRequestCount);
  finally
    FLock.Leave;
  end;
  ASocket.Write(AData^, ACount);
  Result := 0;
end;

procedure TServerMainForm.SetServerActive(const Value: Boolean);
begin
  if Value then
  begin
    FServerSocket.Port := StrToInt(PortEdit.Text);
    FServerSocket.Open;
  end else
    FServerSocket.Close;
  FServerActive := Value;
  FRequestCount := 0;
end;

procedure TServerMainForm.ActiveButtonClick(Sender: TObject);
const
  SCaption: array [Boolean] of string = ('Start', 'Stop');
begin
  ServerActive := not ServerActive;
  ActiveButton.Caption := SCaption[ServerActive];
end;

procedure TServerMainForm.Button1Click(Sender: TObject);
var
  S: string;
  D: TDataBlock;
  I, Count: Integer;
begin
  S := ClientMsgEdit.Text;
  FillChar(D, SizeOf(D), 0);
  D.Len := Length(S);
  StrPCopy(D.Content, S);
  Count := SizeOf(Integer) + Length(S);
  for I := 0 to FServerSocket.ClientCount - 1 do
    FServerSocket.Clients[I].Write(D, Count);
end;

procedure TServerMainForm.Timer1Timer(Sender: TObject);
begin
  ConnectionCountText.Caption := IntToStr(FServerSocket.ClientCount);
  CountText.Caption := IntToStr(FRequestCount);
end;

end.
