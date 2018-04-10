unit uServer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdBaseComponent, IdComponent, IdCustomTCPServer,
  IdTCPServer, IdGlobal, IdContext, IdScheduler, IdSchedulerOfThread,
  IdSchedulerOfThreadDefault, IdException, uP2PCommon, IdUDPBase, IdUDPServer,
  IdSocketHandle, IdAntiFreezeBase, IdAntiFreeze;

type
  TRecvClient = class
    UserID   : String;
    PeerIP   : String;
    RealIP   : String;
    UDPPort  : Integer;
    Context  : TIdContext;
  end;

  TFrmP2PServer = class(TForm)
    chkServerActive: TCheckBox;
    mmoTCPRecvMsg: TMemo;
    BtnDelMsg: TButton;
    TCPServer: TIdTCPServer;
    IdSchedulerOfThreadDefault1: TIdSchedulerOfThreadDefault;
    UDPServer: TIdUDPServer;
    mmoUDPRecvMsg: TMemo;
    AntiFreeze: TIdAntiFreeze;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnDelMsgClick(Sender: TObject);
    procedure chkServerActiveClick(Sender: TObject);
    procedure TCPServerConnect(AContext: TIdContext);
    procedure TCPServerDisconnect(AContext: TIdContext);
    procedure TCPServerStatus(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: string);
    procedure TCPServerException(AContext: TIdContext; AException: Exception);
    procedure TCPServerListenException(AThread: TIdListenerThread;
      AException: Exception);
    procedure TCPServerExecute(AContext: TIdContext);

    procedure UDPServerUDPException(Sender: TObject; ABinding: TIdSocketHandle;
      const AMessage: string; const AExceptionClass: TClass);
    procedure UDPServerUDPRead(Sender: TObject; AData: TBytes;
      ABinding: TIdSocketHandle);
  private
    function FindRecvClientByUserID(aUserID : String) : TRecvClient;
    procedure InfoSendToClients;
    // TCP Processing;
    procedure ClientLogin(AContext : TIdContext; aUserID, aRealIP : String);
    // UDP PRocessing;
    procedure ClientUDPPeerPortSet(aPeerIP, aUserID : String; aUDPPeerPort : Integer);
  public

  end;

var
  FrmP2PServer: TFrmP2PServer;
  CS : TRTLCriticalSection;

implementation

{$R *.dfm}

procedure TFrmP2PServer.FormCreate(Sender: TObject);
begin
  InitializeCriticalSection(CS);
end;

procedure TFrmP2PServer.FormDestroy(Sender: TObject);
begin
  if TCPServer.Active then TCPServer.Active := False;
  if UDPServer.Active then UDPServer.Active := False;
  DeleteCriticalSection(CS);  
end;

function TFrmP2PServer.FindRecvClientByUserID(aUserID : String): TRecvClient;
var
  i       : Integer;
  aList   : TList;
  aClient : TRecvClient;
begin
  Result := nil;
  aList := TCPServer.Contexts.LockList;
  try
    for i := 0 to aList.Count - 1 do
    begin
      if TIdContext(aList.Items[i]).Data = nil then Continue;
      aClient := TRecvClient(TIdContext(aList.Items[i]).Data);
      if aClient.UserID = aUserID then
      begin
        Result := aClient;
        Break;
      end;
    end;
  finally
    TCPServer.Contexts.UnlockList;
  end;
end;


procedure TFrmP2PServer.ClientLogin(AContext : TIdContext; aUserID, aRealIP : String);
const
  FMT_ClientInfo = 'Client''s Info → UserID : %s , RealIP:%s , PeerIP:%s';
var
  aClient        : TRecvClient;
  aHeader        : TP2PTCPHeader;
  aBuf           : TIdBytes;
begin
  aClient := TRecvClient.Create;
  aClient.UserID  := aUserID;
  aClient.RealIP  := aRealIP;
  aClient.PeerIP  := AContext.Binding.PeerIP;
  aClient.UDPPort := -1;
  aClient.Context := AContext;

  AContext.Data := aClient;
  mmoTCPRecvMsg.Lines.Add(Format(FMT_ClientInfo, [aUserID, aClient.RealIP, aClient.PeerIP]));

  aHeader.Command  := $10;
  aHeader.UserID   := aUserID;
  aHeader.DataSize := 0;
  SetLength(aBuf, 0);
  aBuf := RawToBytes(aHeader, SizeOf(TP2PTCPHeader));
  aContext.Connection.IOHandler.Write(aBuf);
//  InfoSendToClients;
end;

procedure TFrmP2PServer.InfoSendToClients;
var
  aHeader   : TP2PTCPHeader;
  aBuf      : TIdBytes;
  i         : Integer;
  aList     : TList;
  aClient   : TRecvClient;
  aSendData : TStringList;
begin
  EnterCriticalSection(CS);
  try
    aSendData := TStringList.Create; // 차후 XML로 대치
    try
      aHeader.Command  := $11;
      aList := TCPServer.Contexts.LockList;
      try
        for i := 0 to aList.Count - 1 do
        begin
          if TIdContext(aList.Items[i]).Data = nil then Continue;
          aClient := TRecvClient(TIdContext(aList.Items[i]).Data);
          if aClient.UDPPort = -1 then Continue;
          aSendData.Add(aClient.UserID);
          aSendData.Add(aClient.PeerIP);
          aSendData.Add(IntToStr(aClient.UDPPort));
        end;
      finally
        TCPServer.Contexts.UnlockList;
      end;

      aList := TCPServer.Contexts.LockList;
      try
        for i := 0 to aList.Count - 1 do
        begin
          if TIdContext(aList.Items[i]).Data = nil then Continue;
          aClient := TRecvClient(TIdContext(aList.Items[i]).Data);
          if aClient.UDPPort = -1 then Continue;
          aHeader.UserID := aClient.UserID;
          aHeader.DataSize := Length(aSendData.Text);
          SetLength(aBuf, 0);
          aBuf := RawToBytes(aHeader, SizeOf(TP2PTCPHeader));
          aClient.Context.Connection.IOHandler.Write(aBuf);
          SetLength(aBuf, 0);
          aBuf := RawToBytes(PChar(aSendData.Text)^, aHeader.DataSize);
          aClient.Context.Connection.IOHandler.Write(aBuf);
        end;
      finally
        TCPServer.Contexts.UnlockList;
      end;
    finally
      aSendData.Free;
    end;
  finally
    LeaveCriticalSection(CS);
  end;
end;

procedure TFrmP2PServer.BtnDelMsgClick(Sender: TObject);
begin
  mmoTCPRecvMsg.Lines.Clear;
  mmoTCPRecvMsg.Clear;
  mmoUDPRecvMsg.Lines.Clear;
  mmoUDPRecvMsg.Clear;
end;

procedure TFrmP2PServer.chkServerActiveClick(Sender: TObject);
begin
  TCPServer.Active := chkServerActive.Checked;
  UDPServer.Active := chkServerActive.Checked;
end;

procedure TFrmP2PServer.TCPServerConnect(AContext: TIdContext);
begin
  AContext.Data := nil;
end;

procedure TFrmP2PServer.TCPServerDisconnect(AContext: TIdContext);
var
  aClient : TRecvClient;
begin
  try
    if not Assigned(AContext.Data) or (AContext.Data = nil) then Exit;
    begin
      aClient := TRecvClient(aContext.Data);
      aClient.Free;
      aClient := nil;
      AContext.Data := nil;
    end;
    InfoSendToClients;    
  except
  end;
end;

procedure TFrmP2PServer.TCPServerException(AContext: TIdContext;
  AException: Exception);
begin
  mmoTCPRecvMsg.Lines.Add(AException.Message);
  AContext.Connection.Disconnect;
end;

procedure TFrmP2PServer.TCPServerListenException(AThread: TIdListenerThread;
  AException: Exception);
begin
  mmoTCPRecvMsg.Lines.Add(AException.Message);
  AThread.FreeOnTerminate := True;
  AThread.Terminate;
//  AThread.Binding.CloseSocket;
end;

procedure TFrmP2PServer.TCPServerStatus(ASender: TObject;
  const AStatus: TIdStatus; const AStatusText: string);
begin
  case AStatus of
    hsResolving     : ;
    hsConnecting    : ;
    hsConnected     : ;
    hsDisconnecting : ;
    hsDisconnected  : ;
    hsStatusText    : ;
  end;
  mmoTCPRecvMsg.Lines.Add(AStatusText);
end;

procedure TFrmP2PServer.TCPServerExecute(AContext: TIdContext);
var
  aHeader  : TP2PTCPHeader;
  aData    : TMemoryStream;
  aStrData : String;
  aBuf     : TIdBytes;
begin
  aData := TMemoryStream.Create;
  try
    try
      AContext.Connection.IOHandler.ReadBytes(aBuf, SizeOf(TP2PTCPHeader));
      BytesToRaw(ABuf, aHeader, Sizeof(TP2PTCPHeader));
      if aHeader.DataSize <> 0 then
      begin
        aData.Clear;
        AContext.Connection.IOHandler.ReadStream(aData, aHeader.DataSize);
        with TStringList.Create do
        try
          aData.Position := 0;
          LoadFromStream(aData);
          aStrData := Trim(Text);
        finally
          Free;
        end;
      end;

      Case aHeader.Command of
        $00 : ClientLogin(AContext, aHeader.UserID, aStrData);
      end;
    except
(*      on E : Exception do
      begin
        if not ( E is EIdConnClosedGracefully ) and not (E is EIdSilentException) then //--- 참고
        begin

        end;
      end; *)
    end;
  finally
    aData.Free;
  end;
end;

procedure TFrmP2PServer.ClientUDPPeerPortSet(aPeerIP, aUserID: String;
  aUDPPeerPort: Integer);
var
  aClient : TRecvClient;
begin
  aClient := FindRecvClientByUserID(aUserID);
  if aClient = nil then Exit;
  aClient.UDPPort := aUDPPeerPort;
  InfoSendToClients;
end;

procedure TFrmP2PServer.UDPServerUDPException(Sender: TObject;
  ABinding: TIdSocketHandle; const AMessage: string;
  const AExceptionClass: TClass);
const
  FMT_ERROR_MESSAGE = 'PeerIP %s Error Message : "%s"';
begin
  mmoUDPRecvMsg.Lines.Add(Format(FMT_ERROR_MESSAGE, [ABinding.PeerIP, AMessage]));
end;

procedure TFrmP2PServer.UDPServerUDPRead(Sender: TObject; AData: TBytes;
  ABinding: TIdSocketHandle);
const
  FMT_UDP_READ_MSG = 'PeerIP %s, PeerPort %d recv Message : "%s"';
var
  aDataStr : String;
  aStrList : TStringList;
begin
  aDataStr := BytesToString(AData);
  aStrList := TStringList.Create;
  try
    aStrList.CommaText := aDataStr;
    mmoUDPRecvMsg.Lines.Add(Format(FMT_UDP_READ_MSG, [ABinding.PeerIP, ABinding.PeerPort, Trim(aDataStr)]));
    if aStrList.Strings[0] = '$20' then
      ClientUDPPeerPortSet(aBinding.PeerIP, aStrList.Strings[1], ABinding.PeerPort);
  finally
    aStrList.Free;
  end;
end;

end.
