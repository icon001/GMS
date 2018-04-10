unit uMonitoringServer;

interface

uses
  System.SysUtils, System.Classes, Web.Win.Sockets,ActiveX,ADODB,WinSock,
  Winapi.Messages,Vcl.ExtCtrls,Vcl.Forms,
  u_c_byte_buffer,uServerClientVariable,uServerClientFunction;

const
  wm_asynch_select= wm_User;
  MAXSOCKCOUNT = 100;

const k_buffer_max= 4096;
      k_tcp_ip_chunk= 1500;

type
  TClientSocket = class(TComponent)
  private
    ClientSendPacketList : TStringList;
    RcvPacketList:TStringList;
    SendClientTimer: TTimer;
    ServerAliveTimer : TTimer;
    RcvPacketProcessTimer : TTimer;
    StateSendTimer : TTimer;     //������ 1�� �� ���� ����� ��Ʈ�� ����,��Ʈ�ѷ��� ���ӻ���,���Թ� ����,����������� ���� ��������...
    L_bClientSocketDestroy : Boolean;
    L_bClientSending : Boolean;
    L_ClientBuffer : string;
    l_c_reception_buffer : c_byte_buffer;
    L_nStateSendNodeSeq : integer;
    FLastReceiveTime: TDateTime;
    FOnClientPacketView: TSCPacket;
    FClientPCIP: string;
    procedure SocketError(Sender: TObject; SocketError: Integer);
    procedure SocketReceive(Sender: TObject; Buf: PAnsiChar;var DataLen: Integer);
    procedure SendClientTimerTimer(Sender: TObject);
    procedure ServerAliveTimerTimer(Sender: TObject);
    procedure StateSendTimerTimer(Sender: TObject);
    procedure RcvPacketProcessTimerTimer(Sender: TObject);
    procedure SocketPacketProcess;
    procedure ClientArmAreaControlProcess(aRealData:string);
    procedure ClientARMAREAStateSearchProcess(aRealData:string);
    procedure ClientNodeStateReSearchProcess(aRealData:string);
    procedure ClientDataPacketProcess(aPacketData:RawBytestring);
    procedure ClientDeviceControlProcess(aRealData:string);
    procedure ClientDoorControlProcess(aRealData:string);
    procedure ClientDoorStateSearchProcess(aRealData:string);
    procedure ClientECUControlProcess(aRealData:string);
    procedure ClientECUStateSearchProcess(aRealData:RawBytestring);   // 'S' - ECU
    procedure ClientEventProcess(aRealData:string);
    procedure ClientMonitoringControlProcess(aRealData:string);
    procedure ClientMonitoringEventProcess(aRealData:string);
    procedure ClientNodeControlProcess(aRealData:string);
    procedure ClientStateSearchProcess(aRealData:RawBytestring);  // 'S' Ŀ�ǵ� ó��
  private
    FOnDeamonRestart: TSCExcEvent;
    FOnSocketClose: TSCSocketClose;
    FOnSocketConnected: TSCSocketClose;
    FConnected: Boolean;
    function GetKTNodeIndexDoorState(aIndex:integer):string;
    function GetOnlyMainNodeIndexDoorState(aIndex:integer):string;
    function GetNodeDeviceNetworkState(aNodeNo:string):string;
    function GetNodeDeviceDoorArmState(aNodeNo,aEcuID:string):string;
    procedure SetConnected(const Value: Boolean);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  public
    m_socket_handle: tSocket;
  public
    procedure SocketRead;
    procedure SocketClose;
    procedure SendPacket(aCMD,aDeviceType,aSubCmd,aNodeNo,aEcuID,aData:string);
    procedure ServerNodeConnected(aNodeNo:string);
    procedure AllNodeIndexStateSend(aIndex:integer);    //����͸� �������ڸ��� ������ ��������.
    procedure KTAutoDoorStateSend;                      //�бⱹ��� ���Թ����� ������ ��������.
    procedure OnlyMainProtocolState;                    //����ġ�� ����ϴ� ��� �� �������ݷ� ������ ��������.
  published
    property ClientPCIP : string read FClientPCIP write FClientPCIP;
    property LastReceiveTime : TDateTime read FLastReceiveTime write FLastReceiveTime;
    property Connected : Boolean read FConnected write SetConnected;
  published
    property OnSocketClose : TSCSocketClose read FOnSocketClose write FOnSocketClose;
    property OnSocketConnected : TSCSocketClose read FOnSocketConnected write FOnSocketConnected;
    property OnClientPacketView : TSCPacket read FOnClientPacketView write FOnClientPacketView;
    property OnDeamonRestart : TSCExcEvent read FOnDeamonRestart  write FOnDeamonRestart;
  end;

  TdmMonitoringServer = class(TDataModule)
    TcpServer1: TTcpServer;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    ClientSocketConnectCheckTimer : TTimer;
    L_wsa_data: twsaData;
    L_server_socket_handle:tSocket;
    L_c_server_client_socket_list: TStringList;
    procedure ClientSocketConnectCheckTimerTimer(Sender: TObject);
    procedure ClientPacketView(Sender: TObject;  aClientIP,aTxRx,aData,aResult:string);
    procedure DeamonRestart(Sender: TObject);
    procedure SocketClose(Sender: TObject;aSocketNo:integer);
    procedure SocketConnected(Sender: TObject;aSocketNo:integer);
  private
    //Handle ���� �κ�
    FHandle : THandle;

    FServerPort: integer;
    FServerStart: Boolean;
    FOnClientPacketView: TSCPacket;
    FOnDeamonRestart: TSCExcEvent;
    FOnSocketConnected: TSCSocketClose;
    procedure SetServerStart(const Value: Boolean);
    function GetHandle: THandle;
    function HandleAllocated : Boolean;
    procedure HandleNeeded;
  protected
    procedure WndProc ( var Message : TMessage ); virtual;
    procedure handle_wm_async_select(var Msg: TMessage); message wm_asynch_select;
    { Private declarations }
  public
    { Public declarations }
    procedure DBSocketClear(aSeq:integer);
    procedure DBSocketInitialize;

    function  GetLastDBSocketSerial:integer;
  public
    procedure AlarmConfirm;
    procedure ArmAreaModeChange(aNodeNo:integer;aEcuID, aExtendID, aNumber, aData:string);
    procedure CurrentAlarmEvent(aNodeNo,aECUID,aExtendID,aCmd,aMsgNo,aTime,aSubCLass,aSubAddr,aArmArea,aMode,aAlarmStateCode,aLoop,aZoneState,aOper,
                                       aAlarmStateCodeName,aAlarmStatePCCode,aAlarmStatePCCodeName,aArmModeChange,aAlarmView,aAlarmSound,aAlarmColor:string);
    procedure CurrentDeviceConnectedChange(aNodeNo:integer;aEcuID,stConnected:string);
    procedure CurrentDoorState(aNodeNo:integer;aEcuID,aExtendID, aNumber, aCardMode, aDoorMode, aDoorState, aLockState,aDoorFire:string);
    procedure DeviceCardAccessEvent(aNodeNo,aECUID,aDoorNo,aReaderNo,aInOut,aTime,aCardMode,aDoorMode,aChangeState,aAccessResult,
                                    aDoorState,aATButton,aCardNo,aType,aArmAreaNo,aCompanyCode,aCompanyName,aEmSeq,aEmCode, aEmName,aPosiCode,aPosiName,aPrintNo,aHandPhone:string);
    procedure FTPCardDownLoadPercentChange(aNodeNo,aEcuID, aExtendID, aNumber, aData:string);
    procedure ServerNodeConnected(aNodeNo:string);
  published
    property Handle : THandle read GetHandle;
    property ServerPort : integer read FServerPort write FServerPort;
    property ServerStart : Boolean read FServerStart write SetServerStart;
  published
    property OnClientPacketView : TSCPacket read FOnClientPacketView write FOnClientPacketView;
    property OnDeamonRestart : TSCExcEvent read FOnDeamonRestart  write FOnDeamonRestart;
    property OnSocketConnected : TSCSocketClose read FOnSocketConnected write FOnSocketConnected;
  end;

var
  dmMonitoringServer: TdmMonitoringServer;

implementation

uses
  uCommonVariable,
  uCommonFunction,
  uDataBase,
  uNodeServer,
  uNode,
  uDeviceVariable;

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TdmMonitoringServer }

procedure TdmMonitoringServer.AlarmConfirm;
var
  stSendData : string;
  i : integer;
begin
  Try
    if L_c_server_client_socket_list.Count < 1 then Exit;

    for i := 0 to L_c_server_client_socket_list.Count - 1 do
    begin
      TClientSocket(L_c_server_client_socket_list.Objects[i]).SendPacket('E',SCMONITORING,'A','000','00','');
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','dmMonitoringServer.AlarmConfirm');
  End;
end;

procedure TdmMonitoringServer.ArmAreaModeChange(aNodeNo: integer; aEcuID,
  aExtendID, aNumber, aData: string);
var
  stSendData : string;
  i : integer;
begin
  Try
    if L_c_server_client_socket_list.Count < 1 then Exit;

    if Not isDigit(aExtendID) then aExtendID := '0';
    if Not isDigit(aNumber) then aNumber := '0';

    stSendData := aExtendID[1] + FillZeroNumber(strtoint(aNumber),2) + aData[1];

    for i := 0 to L_c_server_client_socket_list.Count - 1 do
    begin
      TClientSocket(L_c_server_client_socket_list.Objects[i]).SendPacket('E',SCARMAREA,'M',inttostr(aNodeNo),aEcuID,stSendData);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','dmMonitoringServer.ArmAreaModeChange');
  End;
end;

procedure TdmMonitoringServer.ClientPacketView(Sender: TObject; aClientIP,
  aTxRx, aData, aResult: string);
begin
  Try
    if Assigned(FOnClientPacketView) then
    begin
      OnClientPacketView(Self,aClientIP,aTxRx,aData,aResult);  //View �� ���� �ְ�....
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','dmMonitoringServer.ClientPacketView');
  End;
end;

procedure TdmMonitoringServer.ClientSocketConnectCheckTimerTimer(
  Sender: TObject);
var
  i : integer;
  dtPollingTime: TDatetime;
  dtTimeOut: TDatetime;
begin
  Try
    if L_c_server_client_socket_list.Count < 1 then Exit;
    for i := L_c_server_client_socket_list.Count - 1 downto 0 do
    begin
      dtPollingTime := TClientSocket(L_c_server_client_socket_list.Objects[i]).LastReceiveTime;
      dtTimeOut:= IncTime(dtPollingTime,0,6,0,0);   //6�� ���� �����Ͱ� ���ŵȰ� ������ Ŭ���̾�Ʈ ������ ���� ������...
      if Now > dtTimeOut then
      begin
        TClientSocket(L_c_server_client_socket_list.Objects[i]).SocketClose;
        //TClientSocket(L_c_server_client_socket_list.Objects[i]).Free;
        //L_c_server_client_socket_list.Delete(i);
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','dmMonitoringServer.ClientSocketConnectCheckTimerTimer');
  End;
end;

procedure TdmMonitoringServer.CurrentAlarmEvent(aNodeNo, aECUID,aExtendID, aCmd, aMsgNo,
  aTime, aSubCLass, aSubAddr, aArmArea, aMode, aAlarmStateCode, aLoop,
  aZoneState, aOper, aAlarmStateCodeName, aAlarmStatePCCode,
  aAlarmStatePCCodeName, aArmModeChange,aAlarmView, aAlarmSound, aAlarmColor: string);
var
  stSendData : string;
  i : integer;
begin
  Try
    if L_c_server_client_socket_list.Count < 1 then Exit;

    if aArmArea = '' then aArmArea := '0';
    if aCmd = '' then aCmd := 'O';
    if aMsgNo = '' then aMsgNo := '0';
    if aMode = '' then aMode := '*';
    if aZoneState = '' then aZoneState := '*';

    stSendData := aExtendID[1] + aCmd[1] + aMsgNo[1] + FillZeroStrNum(aTime,14,False) + FillZeroStrNum(aSubCLass,2,False) + FillZeroStrNum(aSubAddr,2,False) +
                 FillZeroStrNum(aArmArea,2,True) + aMode[1] + FillZeroStrNum(aAlarmStateCode,2,True) + FillZeroStrNum(aLoop,2,True) +
                 aZoneState[1] + ',' + aOper + ',' + aAlarmStateCodeName + ',' + aAlarmStatePCCode + ',' + aAlarmStatePCCodeName + ',' + aArmModeChange + ',' + aAlarmView + ',' +
                 aAlarmSound + ',' + aAlarmColor;

    for i := 0 to L_c_server_client_socket_list.Count - 1 do
    begin
      TClientSocket(L_c_server_client_socket_list.Objects[i]).SendPacket('E',SCECU,'S',aNodeNo,aEcuID,stSendData);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','dmMonitoringServer.CurrentAlarmEvent');
  End;
end;

procedure TdmMonitoringServer.CurrentDeviceConnectedChange(aNodeNo:integer; aEcuID,
  stConnected: string);
var
  stSendData : string;
  i : integer;
begin
  Try
    if L_c_server_client_socket_list.Count < 1 then Exit;

    if stConnected = '' then stConnected := '0';

    stSendData := stConnected;

    for i := 0 to L_c_server_client_socket_list.Count - 1 do
    begin
      TClientSocket(L_c_server_client_socket_list.Objects[i]).SendPacket('E',SCECU,'N',inttostr(aNodeNo),aEcuID,stSendData);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','dmMonitoringServer.CurrentDeviceConnectedChange');
  End;
end;

procedure TdmMonitoringServer.CurrentDoorState(aNodeNo: integer; aEcuID,
  aExtendID, aNumber, aCardMode, aDoorMode, aDoorState, aLockState,
  aDoorFire: string);
var
  stSendData : string;
  i : integer;
begin
  Try
    if L_c_server_client_socket_list.Count < 1 then Exit;

    if Not isDigit(aExtendID) then aExtendID := '0';
    if Not isDigit(aNumber) then aNumber := '0';
    if aCardMode = '' then aCardMode := '*';
    if aDoorMode = '' then aDoorMode := '*';
    if aDoorState = '' then aDoorState := '*';
    if aLockState = '' then aLockState := '*';
    if aDoorFire = '' then aDoorFire := '*';


    stSendData := aExtendID[1] + FillZeroNumber(strtoint(aNumber),2) + aCardMode[1] + aDoorMode[1] + aDoorState[1] + aLockState[1] + aDoorFire[1];

    for i := 0 to L_c_server_client_socket_list.Count - 1 do
    begin
      TClientSocket(L_c_server_client_socket_list.Objects[i]).SendPacket('E',SCDOOR,'D',inttostr(aNodeNo),aEcuID,stSendData);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','dmMonitoringServer.CurrentDoorState');
  End;
end;

procedure TdmMonitoringServer.DataModuleCreate(Sender: TObject);
begin
  Try
    L_server_socket_handle:= Invalid_socket;
    L_c_server_client_socket_list := TStringList.Create;
    ClientSocketConnectCheckTimer := TTimer.Create(nil);
    ClientSocketConnectCheckTimer.Interval := 10000;
    ClientSocketConnectCheckTimer.OnTimer := ClientSocketConnectCheckTimerTimer;
    ClientSocketConnectCheckTimer.Enabled := True;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','dmMonitoringServer.DataModuleCreate');
  End;
end;

procedure TdmMonitoringServer.DataModuleDestroy(Sender: TObject);
var
  i : integer;
begin
  Try
    if L_c_server_client_socket_list.Count > 0 then
    begin
      for i := L_c_server_client_socket_list.Count - 1 downto 0 do
      begin
        TClientSocket(L_c_server_client_socket_list.Objects[i]).SocketClose;
      end;
    end;
    L_c_server_client_socket_list.Clear;
    L_c_server_client_socket_list.Free;
    ClientSocketConnectCheckTimer.Enabled := False;
    ClientSocketConnectCheckTimer.Free;

    if HandleAllocated
     then DeAllocateHWND ( FHandle );
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','dmMonitoringServer.DataModuleDestroy');
  End;
end;

procedure TdmMonitoringServer.DBSocketClear(aSeq: integer);
var
  stSql : string;
begin
  Try
    stSql := ' Delete From TB_CLIENTSOCKET where SEQ < ' + inttostr(aSeq + 1) + ' ' ;
    dmDataBase.ProcessExecSQL(stSql);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','dmMonitoringServer.DBSocketClear');
  End;
end;

procedure TdmMonitoringServer.DBSocketInitialize;
var
  stSql : string;
begin
  Try
    stSql := 'Delete from TB_CLIENTSOCKET ';
    dmDataBase.ProcessExecSQL(stSql);
    if G_nDBType = MSSQL then
    begin
      stSql := ' DBCC CHECKIDENT(''TB_CLIENTSOCKET'',RESEED,0) ';
    end else if G_nDBType = POSTGRESQL then
    begin
      stSql := 'select setval(''TB_CLIENTSOCKET_SEQ_SEQ'',1,''f'') ';
    end;
    dmDataBase.ProcessExecSQL(stSql);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','dmMonitoringServer.DBSocketInitialize');
  End;
end;


procedure TdmMonitoringServer.DeamonRestart(Sender: TObject);
begin
  Try
    if Assigned(FOnDeamonRestart) then
    begin
      OnDeamonRestart(Self);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','dmMonitoringServer.DeamonRestart');
  End;
end;

procedure TdmMonitoringServer.DeviceCardAccessEvent(aNodeNo, aECUID, aDoorNo,
  aReaderNo, aInOut, aTime, aCardMode, aDoorMode, aChangeState, aAccessResult,
  aDoorState, aATButton, aCardNo, aType, aArmAreaNo,aCompanyCode,aCompanyName, aEmSeq,aEmCode, aEmName,
  aPosiCode,aPosiName,aPrintNo,aHandPhone: string);
var
  stSendData : string;
  i : integer;
begin
  Try
    if L_c_server_client_socket_list.Count < 1 then Exit;

    if Not isDigit(aDoorNo) then aDoorNo := '0';
    if Not isDigit(aReaderNo) then aReaderNo := '0';
    if Not isDigit(aInOut) then aInOut := '0';
    if aCardMode = '' then aCardMode := '*';
    if aDoorMode = '' then aDoorMode := '*';
    if aChangeState = '' then aChangeState := '*';
    if aAccessResult = '' then aAccessResult := '*';
    if aDoorState = '' then aDoorState := '*';
    if aATButton = '' then aATButton := '*';
    if aType = '' then aType := '*';
    if Not isDigit(aArmAreaNo) then aArmAreaNo := '0';
    if Not isDigit(aEmSeq) then aEmSeq := '0';


    aCompanyName := StringReplace(aCompanyName,',','',[rfReplaceAll]);
    aEmName := StringReplace(aEmName,',','',[rfReplaceAll]);
    aPosiName := StringReplace(aPosiName,',','',[rfReplaceAll]);

    stSendData := FillZeroNumber(strtoint(aDoorNo),2) + aReaderNo[1] + aInOut[1] + aCardMode[1] + aDoorMode[1] + aChangeState[1] + aAccessResult[1] + aDoorState[1] + aATButton[1] + aType[1] + aArmAreaNo[1] + ',' + aTime + ',' + aCardNo + ',' + aCompanyCode + ',' + aCompanyName + ',' + aEmSeq + ',' + aEmCode + ',' + aEmName + ',' + aPosiCode + ',' + aPosiName + ',' + aPrintNo + ',' + aHandPhone;

    for i := 0 to L_c_server_client_socket_list.Count - 1 do
    begin
      TClientSocket(L_c_server_client_socket_list.Objects[i]).SendPacket('E',SCECU,'A',aNodeNo,aEcuID,stSendData);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','dmMonitoringServer.DeviceCardAccessEvent');
  End;
end;

procedure TdmMonitoringServer.FTPCardDownLoadPercentChange(aNodeNo, aEcuID,
  aExtendID, aNumber, aData: string);
var
  stSendData : string;
  i : integer;
begin
  Try
    if L_c_server_client_socket_list.Count < 1 then Exit;

    if Not isDigit(aExtendID) then aExtendID := '0';
    if Not isDigit(aNumber) then aNumber := '0';

    stSendData := aExtendID[1] + FillZeroNumber(strtoint(aNumber),2) + FillZeroStrNum(aData,3);

    for i := 0 to L_c_server_client_socket_list.Count - 1 do
    begin
      TClientSocket(L_c_server_client_socket_list.Objects[i]).SendPacket('E',SCECU,'F',aNodeNo,aEcuID,stSendData);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','dmMonitoringServer.ArmAreaModeChange');
  End;
end;

function TdmMonitoringServer.GetHandle: THandle;
begin
  Try
    HandleNeeded;
    Result := FHandle;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','dmMonitoringServer.GetHandle');
  End;
end;

function TdmMonitoringServer.GetLastDBSocketSerial: integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  Try
    result := 0;
    if G_nDBTYPE = MSSQL then stSql := 'Select top 1 SEQ from TB_CLIENTSOCKET '
    else if G_nDBTYPE = FireBird then stSql := 'Select FIRST 1 SEQ from TB_CLIENTSOCKET '
    else stSql := 'Select SEQ from TB_CLIENTSOCKET ';
    stSql := stSql + ' Order by SEQ DESC ';
    if G_nDBType = POSTGRESQL then stSql := stSql + ' LIMIT 1 OFFSET 0 ';


    Try
      CoInitialize(nil);
      TempAdoQuery := TADOQuery.Create(nil);
      TempAdoQuery.Connection := dmDataBase.ADOConnection;
      TempAdoQuery.DisableControls;
      With TempAdoQuery do
      begin
        Close;
        Sql.text := stSql;
        Try
          Open;
        Except
          Exit;
        End;
        if recordCount < 1 then Exit;
        result := FindField('SEQ').asinteger;
      end;
    Finally
      TempAdoQuery.EnableControls;
      TempAdoQuery.Free;
      CoUninitialize;
    End;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','dmMonitoringServer.GetLastDBSocketSerial');
  End;
end;

function TdmMonitoringServer.HandleAllocated: Boolean;
begin
  Try
    Result := ( FHandle <> 0 );
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','dmMonitoringServer.HandleAllocated');
  End;
end;

procedure TdmMonitoringServer.HandleNeeded;
begin
  Try
    if not HandleAllocated
     then FHandle := AllocateHWND ( WndProc );
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','dmMonitoringServer.HandleNeeded');
  End;
end;

procedure TdmMonitoringServer.handle_wm_async_select(var Msg: TMessage);
  procedure handle_fd_accept_notification(p_socket: tSocket);
  var l_address_socket_in: tSockAddrIn;
      l_address_size: Integer;
      l_server_client_socket: tSocket;
      nIndex : integer;
      oClientSocket : TClientSocket;
      l_address_in: tSockAddrIn;
      l_size: Integer;
      nResult : integer;
  begin
    Try
      l_address_size:= sizeof(l_address_socket_in);
      l_server_client_socket:= Accept(p_socket, @l_address_socket_in, @l_address_size);
      nIndex := L_c_server_client_socket_list.IndexOf(inttostr(l_server_client_socket));
      if nIndex < 0 then
      begin
        oClientSocket := TClientSocket.Create(nil);
        oClientSocket.m_socket_handle := l_server_client_socket;
        l_size := sizeof(tSockAddr);
       (* nResult:= GetSockName(l_server_client_socket, tSockAddr(l_address_in), l_size);
        if nResult = 0 then
          oClientSocket.ClientPCIP :=  inet_ntoa(l_address_in.sin_addr);  //������� ����ص� ���� ���� *)
         GetPeerName(l_server_client_socket, tSockAddr(l_address_in), l_size);
          oClientSocket.ClientPCIP :=  inet_ntoa(l_address_in.sin_addr);
        oClientSocket.OnClientPacketView := ClientPacketView;
        oClientSocket.OnDeamonRestart := DeamonRestart;
        oClientSocket.OnSocketClose := SocketClose;
        oClientSocket.OnSocketConnected := SocketConnected;
        oClientSocket.Connected := True;
        L_c_server_client_socket_list.AddObject(inttostr(l_server_client_socket),oClientSocket);
      end;
    Except
      LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','dmMonitoringServer.handle_fd_accept_notification');
    End;
  end;
  procedure handle_fd_write_notification(p_socket: Integer);
  var nIndex : integer;
      l_remaining: Integer;
      l_pt_start_reception: Pointer;
  begin
    Try
      if p_socket <> L_server_socket_handle then
      begin
        nIndex := L_c_server_client_socket_list.IndexOf(inttostr(p_socket));
        if nIndex > -1 then
        begin
          with TClientSocket(L_c_server_client_socket_list.Objects[nIndex]) do
          begin

          end;
        end;
      end;
    Except
      LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','dmMonitoringServer.handle_fd_write_notification');
    End;
  end;
  procedure handle_fd_read_notification(p_socket: tSocket);
  var nIndex : integer;
  begin
    Try
      if p_socket= L_server_socket_handle then
      begin
        //server should not receive much
      end else
      begin
        nIndex := L_c_server_client_socket_list.IndexOf(inttostr(p_socket));
        if nIndex > -1 then
        begin
          TClientSocket(L_c_server_client_socket_list.Objects[nIndex]).SocketRead;
        end;
      end;
    Except
      LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','dmMonitoringServer.handle_fd_read_notification');
    End;
  end;
  procedure handle_fd_close_notification(p_socket: Integer);
  var l_status: Integer;
      l_linger: TLinger;
      l_absolute_linger: array[0..3] of char absolute l_linger;

      nIndex : Integer;
  begin
    Try
      if p_socket <> L_server_socket_handle then
      begin
        nIndex:= L_c_server_client_socket_list.IndexOf(inttostr(p_socket));
      end;
      if WSAIsBlocking then WSACancelBlockingCall;
      ShutDown(p_socket, 2);
      Try
        SetSockOpt(p_socket, Sol_Socket, So_Linger,
                  pAnsichar(AnsiString(l_absolute_linger)), sizeof(l_linger));  // l_absolute_linger[0] ->  AnsiString(l_absolute_linger) ���� ����
      Except
      End;
      //l_status:= CloseSocket(p_socket);
      if nIndex > -1 then
      begin
        TClientSocket(L_c_server_client_socket_list.Objects[nIndex]).SocketClose; //�̺�Ʈ �߻� ó��
        //L_c_server_client_socket_list.Delete(nIndex);
      end;
    Except
      LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','dmMonitoringServer.handle_fd_close_notification');
    End;
  end;
var l_param: Integer;
    l_error, l_notification: Integer;
    l_socket_handle: Integer;
begin
  Try
    l_param:= Msg.lParam;
    l_socket_handle:= Msg.wParam;
    l_error:= wsaGetSelectError(l_param);
    l_notification:= wsaGetSelectEvent(l_param);

    if l_error<= wsaBaseErr then
    begin
      case l_notification of
        FD_ACCEPT: handle_fd_accept_notification(l_socket_handle);
        FD_CONNECT: begin end; //display('no server fd_connect');
        FD_WRITE: handle_fd_write_notification(l_socket_handle);
        FD_READ: handle_fd_read_notification(l_socket_handle);
        FD_CLOSE: handle_fd_close_notification(l_socket_handle);
      end // case
    end else begin
      if l_notification= FD_CLOSE then handle_fd_close_notification(l_socket_handle);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','dmMonitoringServer.handle_wm_async_select');
  End;
end;

procedure TdmMonitoringServer.ServerNodeConnected(aNodeNo: string);
var
  i : integer;
begin
  Try
    if L_c_server_client_socket_list.Count < 1 then Exit;

    for i := 0 to L_c_server_client_socket_list.Count - 1 do
    begin
      TClientSocket(L_c_server_client_socket_list.Objects[i]).ServerNodeConnected(aNodeNo);
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','dmMonitoringServer.ServerNodeConnected');
  End;
end;

procedure TdmMonitoringServer.SetServerStart(const Value: Boolean);
var
  l_result : integer;
  l_address_socket_in: tSockAddrIn;
  i : integer;
begin
  Try
    if FServerStart = Value then Exit;
    FServerStart := Value;

    if Value then
    begin
      l_result := wsaStartup($0101, l_wsa_data);
      if l_result <> 0 then
      begin
        ServerStart := False;
        Exit;  //���ϻ��� ���� �ÿ� Open False
      end;
      L_server_socket_handle:= Socket(PF_INET, SOCK_STREAM, IPPROTO_IP);
      if L_server_socket_handle= INVALID_SOCKET then
      begin
        ServerStart := False;
        Exit;  //���ϻ��� ���� �ÿ� Open False
      end;
      l_result:= wsaAsyncSelect(L_server_socket_handle, Handle,wm_asynch_select,FD_ACCEPT+ FD_READ+ FD_WRITE+ FD_CLOSE);
      if l_result<> 0 then
      begin
        ServerStart := False;
        Exit;  //���ϻ��� ���� �ÿ� Open False
      end;
      FillChar(l_address_socket_in, sizeof(l_address_socket_in), 0);
      with l_address_socket_in do
      begin
        sin_family:= af_Inet;
        sin_port:= hToNs(ServerPort);
        sin_addr.s_addr:= InAddr_Any; // $00000000
      end;
      l_result:= Bind(L_server_socket_handle, l_address_socket_in,
          sizeof(l_address_socket_in));
      if l_result <> 0 then
      begin
        ServerStart := False;
        Exit;  //���ϻ��� ���� �ÿ� Open False
      end;
      l_result:= Listen(L_server_socket_handle, MAXSOCKCOUNT);
      if l_result <> 0 then
      begin
        ServerStart := False;
        Exit;  //���ϻ��� ���� �ÿ� Open False
      end;
    end else
    begin
      for i := L_c_server_client_socket_list.Count - 1 downto 0 do
      begin
        TClientSocket(L_c_server_client_socket_list.Objects[i]).SocketClose;   //�̺�Ʈ �߻� �Ͽ� ���� ó�� ��
        //TClientSocket(L_c_server_client_socket_list.Objects[i]).Free;
      end;
      if L_server_socket_handle <> INVALID_SOCKET then
      begin
        shutdown(L_server_socket_handle,SD_BOTH);
        l_result:= CloseSocket(L_server_socket_handle);
        if l_result = 0 then L_server_socket_handle:= INVALID_SOCKET;
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','dmMonitoringServer.SetServerStart');
  End;
end;


procedure TdmMonitoringServer.SocketClose(Sender: TObject; aSocketNo: integer);
var
  nIndex : integer;
begin
  nIndex:= L_c_server_client_socket_list.IndexOf(inttostr(aSocketNo));
  if nIndex > -1 then
  begin
    TClientSocket(L_c_server_client_socket_list.Objects[nIndex]).Free;
    L_c_server_client_socket_list.Delete(nIndex);
  end;
end;

procedure TdmMonitoringServer.SocketConnected(Sender: TObject;
  aSocketNo: integer);
begin
  if Assigned(FOnSocketConnected) then
  begin
    OnSocketConnected(Sender,aSocketNo);  //
  end;

end;

procedure TdmMonitoringServer.WndProc(var Message: TMessage);
begin
  Dispatch ( Message );
end;

{ TClientSocket }

procedure TClientSocket.AllNodeIndexStateSend(aIndex: integer);
var
  stNodeNo : string;
  stEcuID : string;
  stSendData : string;
  i : integer;
  nCount : integer;
begin
  if aIndex > NodeList.Count - 1 then Exit;
  stNodeNo := inttostr(TNode(NodeList.Objects[aIndex]).No);
  stEcuID := '00';
  //    'N' : begin  //��Ʈ�� ����
  stSendData := GetNodeDeviceNetworkState(stNodeNo);
  SendPacket('S',SCECU,'N',stNodeNo,stEcuID,stSendData);
  nCount := strtoint(TNode(NodeList.Objects[aIndex]).GetNodeIndexInformation(con_NodeCmdDeviceCount));
  for i := 0 to nCount - 1 do
  begin
    stEcuID := TNode(NodeList.Objects[aIndex]).GetDeviceIndexInformation(con_DeviceCmdDeviceID,i);
    stSendData := GetNodeDeviceDoorArmState(stNodeNo,stEcuID);
    SendPacket('S',SCECU,'s',stNodeNo,stEcuID,stSendData);
  end;

end;

procedure TClientSocket.ClientArmAreaControlProcess(aRealData: string);
var
  stNodeNo : string;
  stEcuID : string;
  stArmAreaNo : string;
  stData : string;
  nIndex : integer;
  stTemp : string;
begin
  Try
    stNodeNo := copy(aRealData,4,G_nNodeCodeLength);
    if Not isDigit(stNodeNo) then Exit;

    stNodeNo := FillZeroNumber(strtoint(stNodeNo),G_nNodeCodeLength);
    stEcuID := copy(aRealData,4 + G_nNodeCodeLength,2);
    case aRealData[3] of
      'M' : begin  //������� ��� ����
        stArmAreaNo := copy(aRealData,4 + G_nNodeCodeLength + 2,2);
        stTemp := copy(aRealData,4 + G_nNodeCodeLength + 2 + 2,1);
        stData := 'MC' +
                  stArmAreaNo +
                  stTemp;
        nIndex := NodeList.IndexOf(stNodeNo);
        if nIndex > -1 then
        begin
          TNode(NodeList.Objects[nIndex]).SendPacket(stEcuID,'R',TNode(NodeList.Objects[nIndex]).GetSendMsgNo,TNode(NodeList.Objects[nIndex]).GetDeviceVer,stData,1);
        end else
        begin
          nIndex := ServerNodeList.IndexOf(stNodeNo);
          if nIndex > -1 then
          begin
            dmNodeServer.DeviceNodeServer_SendPacket(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,stEcuID ,'R',stData,1);
          end;
        end;
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','ClientSocket.ClientArmAreaControlProcess');
  End;
end;

procedure TClientSocket.ClientARMAREAStateSearchProcess(aRealData: string);
var
  stNodeNo : string;
  stEcuID : string;
  stArmAreaNo : string;
  stData : string;
  nIndex : integer;
begin
  Try
    stNodeNo := copy(aRealData,4,G_nNodeCodeLength);
    if Not isDigit(stNodeNo) then Exit;

    stNodeNo := FillZeroNumber(strtoint(stNodeNo),G_nNodeCodeLength);
    stEcuID := copy(aRealData,4 + G_nNodeCodeLength,2);
    case aRealData[3] of
      's' : begin  //���Թ� ����
        stArmAreaNo := copy(aRealData,4 + G_nNodeCodeLength + 1,2);
        nIndex := NodeList.IndexOf(stNodeNo);
        if nIndex > -1 then
        begin
          TNode(NodeList.Objects[nIndex]).ControlNodeToDeviceArmAreaStateCheck(stEcuID,stArmAreaNo);
        end else
        begin
          nIndex := ServerNodeList.IndexOf(stNodeNo);
          if nIndex > -1 then
          begin
            dmNodeServer.DeviceNodeServer_ControlNodeToDeviceArmAreaStateCheck(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,stEcuID ,stArmAreaNo);
          end;
        end;
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','ClientSocket.ClientARMAREAStateSearchProcess');
  End;
end;

procedure TClientSocket.ClientDataPacketProcess(aPacketData: RawBytestring);
var
  stRealData : RawBytestring;
  stRealLen : string;
begin
  Try
    stRealLen := copy(aPacketData,2,3);
    if Not IsDigit(stRealLen) then Exit;
    stRealData := copy(aPacketData,5,strtoint(stRealLen));
    case stRealData[1] of
      'S' : begin
        ClientStateSearchProcess(stRealData);
      end;
      'e' : begin

      end;
      'C' : begin
        ClientDeviceControlProcess(stRealData);
      end;
      'E' : begin
        ClientEventProcess(stRealData);
      end;
    end;
    if Assigned(FOnClientPacketView) then
    begin
      OnClientPacketView(Self,ClientPCIP,'RX',aPacketData,'00');  //View �� ���� �ְ�....
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','ClientSocket.ClientDataPacketProcess');
  End;
end;

procedure TClientSocket.ClientDeviceControlProcess(aRealData: string);
begin
  Try
    case aRealData[2] of
      SCNODE : begin
        ClientNodeControlProcess(aRealData);
      end;
      SCECU : begin
        ClientECUControlProcess(aRealData);
      end;
      SCDOOR : begin
        ClientDoorControlProcess(aRealData);
      end;
      SCARMAREA : begin
        ClientArmAreaControlProcess(aRealData);
      end;
      SCMONITORING : begin
        ClientMonitoringControlProcess(aRealData);
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','ClientSocket.ClientDeviceControlProcess');
  End;
end;

procedure TClientSocket.ClientDoorControlProcess(aRealData: string);
var
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
  stData : string;
  nIndex : integer;
  stTemp : string;
  nWinSocket : integer;
begin
//  SendPacket('T','T','T','0','00','TEST');
  Try
    stNodeNo := copy(aRealData,4,G_nNodeCodeLength);
    if Not isDigit(stNodeNo) then Exit;

    stNodeNo := FillZeroNumber(strtoint(stNodeNo),G_nNodeCodeLength);
    stEcuID := copy(aRealData,4 + G_nNodeCodeLength,2);
    case aRealData[3] of
      'O' : begin  //���Թ� ����
        stDoorNo := copy(aRealData,4 + G_nNodeCodeLength + 2,2);
        if Not isDigit(stDoorNo) then Exit;

        stData := 'C' +
                  '0' +  //  Msg Count
                  inttostr(strtoint(stDoorNo)) +
                  #$30+
                  #$33+ //  RecordCount(���Թ� ���� #$33)
                  #$31;
        nIndex := NodeList.IndexOf(stNodeNo);
        if nIndex > -1 then
        begin
          TNode(NodeList.Objects[nIndex]).SendPacket(stEcuID,'c',TNode(NodeList.Objects[nIndex]).GetSendMsgNo,TNode(NodeList.Objects[nIndex]).GetDeviceVer,stData,0);
        end else
        begin
          nIndex := ServerNodeList.IndexOf(stNodeNo);
          if nIndex > -1 then
          begin
            dmNodeServer.DeviceNodeServer_SendPacket(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,stEcuID,'c',stData,0);
          end;
        end;
      end;
      'M' : begin  //���Թ� ��� ����
        stDoorNo := copy(aRealData,4 + G_nNodeCodeLength + 2,2);
        if Not isDigit(stDoorNo) then Exit;

        stTemp := copy(aRealData,4 + G_nNodeCodeLength + 2 + 2,1);
        nIndex := NodeList.IndexOf(stNodeNo);
        stData := 'C' +
                  '0' +  //  Msg Count
                  inttostr(strtoint(stDoorNo)) +
                  #$30+
                  #$32+ //  RecordCount(��庯�� #$32)
                  stTemp;
        if nIndex > -1 then
        begin
          TNode(NodeList.Objects[nIndex]).SendPacket(stEcuID,'c',TNode(NodeList.Objects[nIndex]).GetSendMsgNo,TNode(NodeList.Objects[nIndex]).GetDeviceVer,stData,0);
        end else
        begin
          nIndex := ServerNodeList.IndexOf(stNodeNo);
          if nIndex > -1 then
          begin
            dmNodeServer.DeviceNodeServer_SendPacket(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,stEcuID,'c',stData,0);
          end;
        end;
      end;
      'C' : begin  //ī�� � ��� ����
        stDoorNo := copy(aRealData,4 + G_nNodeCodeLength + 2,2);
        if Not isDigit(stDoorNo) then Exit;
        stTemp := copy(aRealData,4 + G_nNodeCodeLength + 2 + 2,1);
        nIndex := NodeList.IndexOf(stNodeNo);
        stData := 'C' +
                  '0' +  //  Msg Count
                  inttostr(strtoint(stDoorNo)) +
                  #$30+
                  #$31+ //  RecordCount(ī����庯�� #$31)
                  stTemp;
        if nIndex > -1 then
        begin
          TNode(NodeList.Objects[nIndex]).SendPacket(stEcuID,'c',TNode(NodeList.Objects[nIndex]).GetSendMsgNo,TNode(NodeList.Objects[nIndex]).GetDeviceVer,stData,0);
        end else
        begin
          nIndex := ServerNodeList.IndexOf(stNodeNo);
          if nIndex > -1 then
          begin
            dmNodeServer.DeviceNodeServer_SendPacket(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,stEcuID,'c',stData,0);
          end;
        end;
      end;
      'S' : begin  //���Թ� ������ ������� ����
        stDoorNo := copy(aRealData,4 + G_nNodeCodeLength + 2,2);
        if isDigit(stDoorNo) then
           stDoorNo := inttostr(strtoint(stDoorNo));
        stTemp := copy(aRealData,4 + G_nNodeCodeLength + 2 + 2,1);
        nIndex := NodeList.IndexOf(stNodeNo);
        if nIndex > -1 then
        begin
          TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeDoor,con_DoorCmdSCHEDULEUSE,stEcuID,stDoorNo,stTemp);
          TNode(NodeList.Objects[nIndex]).SetDeviceRcvIDSubInformation(con_DeviceTypeDoor,con_DoorCmdSettingInfo,stEcuID,stDoorNo,'U');
        end
        else
        begin
          nIndex := ServerNodeList.IndexOf(stNodeNo);
          if nIndex > -1 then
          begin
            nWinSocket := TServerNode(ServerNodeList.Objects[nIndex]).WinSocket;
            dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(nWinSocket,con_DeviceTypeDoor,con_DoorCmdSCHEDULEUSE,stEcuID,stDoorNo,stTemp);
            dmNodeServer.DeviceNodeServer_SetDeviceRcvIDSubInformation(nWinSocket,con_DeviceTypeDoor,con_DoorCmdSettingInfo,stEcuID,stDoorNo,'U');
          end;
        end;
      end;
      'T' : begin  //���Թ� Ÿ���ڵ� ������� ����
        stDoorNo := copy(aRealData,4 + G_nNodeCodeLength + 2,2);
        if isDigit(stDoorNo) then
           stDoorNo := inttostr(strtoint(stDoorNo));
        stTemp := copy(aRealData,4 + G_nNodeCodeLength + 2 + 2,1);
        nIndex := NodeList.IndexOf(stNodeNo);
        if nIndex > -1 then
        begin
          TNode(NodeList.Objects[nIndex]).SetDeviceIDSubInformation(con_DeviceTypeDoor,con_DoorCmdTimeCodeUse,stEcuID,stDoorNo,stTemp);
          TNode(NodeList.Objects[nIndex]).SetDeviceRcvIDInformation(con_DeviceCmdTimeCodeUse,stEcuID,'U');
        end
        else
        begin
          nIndex := ServerNodeList.IndexOf(stNodeNo);
          if nIndex > -1 then
          begin
            nWinSocket := TServerNode(ServerNodeList.Objects[nIndex]).WinSocket;
            dmNodeServer.DeviceNodeServer_SetDeviceIDSubInformation(nWinSocket,con_DeviceTypeDoor,con_DoorCmdTimeCodeUse,stEcuID,stDoorNo,stTemp);
            dmNodeServer.DeviceNodeServer_SetDeviceRcvIDInformation(nWinSocket,con_DeviceCmdTimeCodeUse,stEcuID,'U');
          end;
        end;
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','ClientSocket.ClientDoorControlProcess');
  End;
end;

procedure TClientSocket.ClientDoorStateSearchProcess(aRealData: string);
var
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
  stData : string;
  nIndex : integer;
  stSendData : string;
  stCardMode : string;
  stDoorMode : string;
  stDoorState : string;
  stLockState : string;
  stDoorFire : string;
begin
  Try
    stNodeNo := copy(aRealData,4,G_nNodeCodeLength);
    if Not isDigit(stNodeNo) then Exit;
    stNodeNo := FillZeroNumber(strtoint(stNodeNo),G_nNodeCodeLength);
    stEcuID := copy(aRealData,4 + G_nNodeCodeLength,2);
    case aRealData[3] of
      'D' : begin  //���Թ� ����
        stDoorNo := copy(aRealData,4 + G_nNodeCodeLength + 2,2);
        if Not isDigit(stDoorNo) then Exit;
        if strtoint(stDoorNo) = 0 then Exit; //0�� ���Թ��� ��ȸ�� �ʿ� ����.

        //���⼭ ���� ���¸� �ٽ� �ѹ� ��������.
        nIndex := NodeList.IndexOf(stNodeNo);
        if nIndex > -1 then
        begin
          stData := 'C' +
                    '0' +  //  Msg Count
                    inttostr(strtoint(stDoorNo)) +
                    #$30+
                    #$30+ //  ���Թ� ���� ��ȸ
                    #$30;
          TNode(NodeList.Objects[nIndex]).SendPacket(stEcuID,'c',TNode(NodeList.Objects[nIndex]).GetSendMsgNo,TNode(NodeList.Objects[nIndex]).GetDeviceVer,stData,1);
          TNode(NodeList.Objects[nIndex]).GetDeviceDoorStateResend(stEcuID,inttostr(strtoint(stDoorNo)));
        end else
        begin
          nIndex := ServerNodeList.IndexOf(stNodeNo);
          if nIndex > -1 then
          begin
            dmNodeServer.DeviceNodeServer_SendPacket(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,stEcuID,'c',stData,1);
          end;
        end;
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','ClientSocket.ClientDoorStateSearchProcess');
  End;
end;

procedure TClientSocket.ClientECUControlProcess(aRealData: string);
var
  stNodeNo : string;
  stEcuID : string;
  stData : string;
  nIndex : integer;
begin
  Try
    stNodeNo := copy(aRealData,4,G_nNodeCodeLength);
    if Not isDigit(stNodeNo) then Exit;
    stNodeNo := FillZeroNumber(strtoint(stNodeNo),G_nNodeCodeLength);
    stEcuID := copy(aRealData,4 + G_nNodeCodeLength,2);
    case aRealData[3] of
      'C' : begin  //ī�� ������
        nIndex := NodeList.IndexOf(stNodeNo);
        if nIndex > -1 then
        begin
          TNode(NodeList.Objects[nIndex]).ControlNodeToDeviceCardResend(stEcuID);
        end else
        begin
          nIndex := ServerNodeList.IndexOf(stNodeNo);
          if nIndex > -1 then
          begin
            dmNodeServer.DeviceNodeServer_ControlNodeToDeviceCardResend(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,stEcuID);
          end;
        end;
      end;
      'R' : begin  //��Ʈ�ѷ� ����
        nIndex := NodeList.IndexOf(stNodeNo);
        if nIndex > -1 then
        begin
          TNode(NodeList.Objects[nIndex]).ControlNodeToDeviceReset(stEcuID);
        end else
        begin
          nIndex := ServerNodeList.IndexOf(stNodeNo);
          if nIndex > -1 then
          begin
            dmNodeServer.DeviceNodeServer_ControlNodeToDeviceReset(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,stEcuID);
          end;
        end;
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','ClientSocket.ClientECUControlProcess');
  End;
end;

procedure TClientSocket.ClientECUStateSearchProcess(aRealData: RawBytestring);
var
  stNodeNo : string;
  stEcuID : string;
  stData : string;
begin
  Try
    stNodeNo := copy(aRealData,4,G_nNodeCodeLength);
    stEcuID := copy(aRealData,4 + G_nNodeCodeLength,2);
    case aRealData[3] of
      'N' : begin  //��Ʈ�� ����
          stData := GetNodeDeviceNetworkState(stNodeNo);
          SendPacket('S',SCECU,'N',stNodeNo,stEcuID,stData);
      end;
      's' : begin  //��Ʈ�ѷ� ���� ��ȸ
          stData := GetNodeDeviceDoorArmState(stNodeNo,stEcuID);
          SendPacket('S',SCECU,'s',stNodeNo,stEcuID,stData);
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','ClientSocket.ClientECUStateSearchProcess');
  End;
end;


procedure TClientSocket.ClientEventProcess(aRealData: string);
begin
  Try
    case aRealData[2] of
      SCNODE : begin
      end;
      SCECU : begin
      end;
      SCDOOR : begin
      end;
      SCARMAREA : begin
      end;
      SCMONITORING : begin
        ClientMonitoringEventProcess(aRealData);
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','ClientSocket.ClientEventProcess');
  End;
end;

procedure TClientSocket.ClientMonitoringControlProcess(aRealData: string);
var
  stNodeNo : string;
  stEcuID : string;
  stData : string;
  nIndex : integer;
  stTemp : string;
  i : integer;
begin
  Try
    stNodeNo := copy(aRealData,4,G_nNodeCodeLength);
    stEcuID := copy(aRealData,4 + G_nNodeCodeLength,2);
    case aRealData[3] of
      'F' : begin  //ȭ�� ����
        if strtoint(stNodeNo) = 0 then
        begin
          if NodeList.Count > 0 then
          begin
            for i := 0 to NodeList.Count - 1 do
            begin
              TNode(NodeList.Objects[i]).FireRecovery;
            end;
          end;
          if ServerNodeList.Count > 0 then
          begin
            for i := 0 to ServerNodeList.Count - 1 do
            begin
              dmNodeServer.DeviceNodeServer_FireRecovery(TServerNode(ServerNodeList.Objects[i]).WinSocket);
            end;
          end;
        end else
        begin
          nIndex :=  NodeList.IndexOf(stNodeNo);
          if nIndex > -1 then
          begin
            TNode(NodeList.Objects[nIndex]).FireRecovery;
          end else
          begin
            nIndex :=  ServerNodeList.IndexOf(stNodeNo);
            dmNodeServer.DeviceNodeServer_FireRecovery(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket);
          end;
        end;
      end;
      'R' : begin  //��ŵ��� �����
        if Assigned(FOnClientPacketView) then
        begin
          OnDeamonRestart(Self);  //View �� ���� �ְ�....
        end;

      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','ClientSocket.ClientMonitoringControlProcess');
  End;
end;

procedure TClientSocket.ClientMonitoringEventProcess(aRealData: string);
var
  stNodeNo : string;
  stEcuID : string;
  stData : string;
  nIndex : integer;
  stTemp : string;
begin
  Try
    stNodeNo := copy(aRealData,4,G_nNodeCodeLength);
    stEcuID := copy(aRealData,4 + G_nNodeCodeLength,2);
    case aRealData[3] of
      'A' : begin  //�˶�Ȯ��
        dmMonitoringServer.AlarmConfirm;
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','ClientSocket.ClientMonitoringEventProcess');
  End;
end;

procedure TClientSocket.ClientNodeControlProcess(aRealData: string);
var
  stNodeNo : string;
  stEcuID : string;
  stData : string;
  nIndex : integer;
  stTemp : string;
begin
  Try
    stNodeNo := copy(aRealData,4,G_nNodeCodeLength);
    if Not isDigit(stNodeNo) then Exit;
    stNodeNo := FillZeroNumber(strtoint(stNodeNo),G_nNodeCodeLength);
    stEcuID := copy(aRealData,4 + G_nNodeCodeLength,2);
    case aRealData[3] of
      'T' : begin  //�ð�����ȭ
        nIndex := NodeList.IndexOf(stNodeNo);
        if nIndex > -1 then
        begin
          TNode(NodeList.Objects[nIndex]).ControlNodeToDeviceTimeSync;
        end else
        begin
          nIndex := ServerNodeList.IndexOf(stNodeNo);
          if nIndex > -1 then
          begin
            dmNodeServer.DeviceNodeServer_ControlNodeToDeviceTimeSync(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket);
          end;
        end;
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','ClientSocket.ClientNodeControlProcess');
  End;
end;

procedure TClientSocket.ClientNodeStateReSearchProcess(aRealData: string);
var
  stNodeNo : string;
  stEcuID : string;
  stArmAreaNo : string;
  stData : string;
  nIndex : integer;
begin
  Try
    stNodeNo := copy(aRealData,4,G_nNodeCodeLength);
    if Not isDigit(stNodeNo) then Exit;

    stNodeNo := FillZeroNumber(strtoint(stNodeNo),G_nNodeCodeLength);
    stEcuID := copy(aRealData,4 + G_nNodeCodeLength,2);
    case aRealData[3] of
      'S' : begin  //��ü ���� ������ ��û
        StateSendTimer.Enabled := True;
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','ClientSocket.ClientARMAREAStateSearchProcess');
  End;
end;

procedure TClientSocket.ClientStateSearchProcess(aRealData: RawBytestring);
begin
  Try
    case aRealData[2] of
      SCECU : begin
        ClientECUStateSearchProcess(aRealData);
      end;
      SCDOOR : begin
        ClientDOORStateSearchProcess(aRealData);
      end;
      SCARMAREA : begin
        ClientARMAREAStateSearchProcess(aRealData);
      end;
      SCMONITORING : begin  //����͸� ���� Ŭ����
        ClientNodeStateReSearchProcess(aRealData);
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','ClientSocket.ClientStateSearchProcess');
  End;
end;

constructor TClientSocket.Create(AOwner: TComponent);
begin
  inherited;
  Try
    L_bClientSocketDestroy := False;
    ClientSendPacketList := TStringList.Create;
    l_c_reception_buffer:= c_byte_buffer.create_byte_buffer('reception_buffer', k_buffer_max);
    L_nStateSendNodeSeq := 0;
    RcvPacketList := TStringList.Create;

    SendClientTimer:= TTimer.Create(nil);
    SendClientTimer.Interval := 10;
    SendClientTimer.OnTimer := SendClientTimerTimer;
    SendClientTimer.Enabled := True;
    LastReceiveTime := Now;         //���� �Ǹ� �ٷ� ���� ���� �ð��� ��������... �׷��� ������ �� �����ϱ�...

    ServerAliveTimer := TTimer.Create(nil);
    ServerAliveTimer.Interval := 100000;
    ServerAliveTimer.OnTimer := ServerAliveTimerTimer;
    ServerAliveTimer.Enabled := True;

    RcvPacketProcessTimer := TTimer.Create(nil);
    RcvPacketProcessTimer.Interval := 10;
    RcvPacketProcessTimer.OnTimer := RcvPacketProcessTimerTimer;
    RcvPacketProcessTimer.Enabled := True;

    StateSendTimer := TTimer.Create(nil);
    StateSendTimer.Interval := 300;
    StateSendTimer.OnTimer := StateSendTimerTimer;
    StateSendTimer.Enabled := True;

    //SendPacket('e',SCECU,'*','0000','00','ȯ���մϴ�.');
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','ClientSocket.Create');
  End;
end;

destructor TClientSocket.Destroy;
begin
  Try
    L_bClientSocketDestroy := True;

    SendClientTimer.Enabled := False;
    ServerAliveTimer.Enabled := False;
    RcvPacketProcessTimer.Enabled := False;
    StateSendTimer.Enabled := False;

    while L_bClientSending do    //Ȥ�� �������̸� Ÿ�̸� ���� �ɶ����� ��ٸ���
    begin
      sleep(1);
      Application.ProcessMessages;
    end;
    SendClientTimer.Free;
    ServerAliveTimer.Free;
    RcvPacketProcessTimer.Free;
    StateSendTimer.Free;

    if m_socket_handle <> INVALID_SOCKET then m_socket_handle := INVALID_SOCKET;
    l_c_reception_buffer.Free;
    l_c_reception_buffer := nil;

    ClientSendPacketList.Clear;
    ClientSendPacketList.Free;

    RcvPacketList.Clear;
    RcvPacketList.Free;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','ClientSocket.Destroy');
  End;
  inherited;
end;

function TClientSocket.GetKTNodeIndexDoorState(aIndex: integer): string;
var
  stNodeData : string;
  stDoorData : string;
  stTemp : string;
begin
  result := '';
  if aIndex > NodeList.Count - 1 then Exit;
  stNodeData := FillZeroNumber(TNode(NodeList.Objects[aIndex]).No,G_nNodeCodeLength);
  stDoorData := FillZeroNumber(0,8); //8bit ó��
  if TNode(NodeList.Objects[aIndex]).NodeConnected = csConnected then
  begin
    stDoorData[1] := '1'; //��� ���� �Ǿ� �ִ�.
    if TNode(NodeList.Objects[aIndex]).GetDeviceIDDoorInformation(con_DoorCurrentFireEvent,'00','1') = '1' then
    begin
      stDoorData[8] := '1';
      stTemp := TNode(NodeList.Objects[aIndex]).GetDeviceIDDoorInformation(con_DoorCurrentDSState,'00','1');
      if stTemp <> '*' then
      begin
        stDoorData[2] := '1'; //���Թ����¸� �ȴ�.
        if stTemp = 'C' then stDoorData[6] := '1';
      end;
    end else
    begin
      stTemp := TNode(NodeList.Objects[aIndex]).GetDeviceIDDoorInformation(con_DoorCurrentDSState,'00','1');
      if stTemp <> '*' then
      begin
        stDoorData[2] := '1'; //���Թ����¸� �ȴ�.
        if stTemp = 'C' then stDoorData[6] := '1'
        else if (stTemp = 'T') or (stTemp = 'D') then
        begin
          stDoorData[7] := '1';
        end;
      end;
    end;
    if TNode(NodeList.Objects[aIndex]).GetDeviceIDDoorInformation(con_DoorCurrentCARDMode,'00','1') = '1' then  stDoorData[3] := '1';
    stTemp := TNode(NodeList.Objects[aIndex]).GetDeviceIDDoorInformation(con_DoorCurrentManagerMode,'00','1');
    if stTemp = '1' then  stDoorData[5] := '1'
    else if stTemp = '2' then  stDoorData[4] := '1'
    else if stTemp = '3' then
    begin
      stDoorData[4] := '1';
      stDoorData[5] := '1';
    end;
  end;
  result := stNodeData + BinaryToHex(stDoorData);
end;

function TClientSocket.GetNodeDeviceDoorArmState(aNodeNo,
  aEcuID: string): string;
var
  stNodeNo : string;
  nIndex : integer;
  stTemp : string;
begin
  Try
    result := '';
    if Not isDigit(aNodeNo) then Exit;
    stNodeNo := FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength);
    nIndex := NodeList.IndexOf(stNodeNo);
    if nIndex > -1 then
    begin
      //if Not TNode(NodeList.Objects[nIndex]).start then Exit;
      stTemp := TNode(NodeList.Objects[nIndex]).GetDeviceIDInformation(con_DeviceCmdArmAreaState,aEcuID);
      if stTemp = '' then  result := '00'
      else result := stTemp;
    end else
    begin
      nIndex := ServerNodeList.IndexOf(stNodeNo);
      if nIndex > -1 then
      begin
        stTemp := dmNodeServer.DeviceNodeServer_GetDeviceIDInformation(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,con_DeviceCmdArmAreaState,aEcuID);
        if stTemp = '' then  result := '00'
        else result := stTemp;
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','ClientSocket.GetNodeDeviceDoorArmState');
  End;
end;

function TClientSocket.GetNodeDeviceNetworkState(aNodeNo: string): string;
var
  stNodeNo : string;
  nIndex : integer;
  stConnectData : string;
  i : integer;
  nCount : integer;
  stTemp : string;
begin
  Try
    result := '';
    if Not isDigit(aNodeNo) then Exit;
    stNodeNo := FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength);
    nIndex := NodeList.IndexOf(stNodeNo);
    if nIndex > -1 then
    begin
      //if Not TNode(NodeList.Objects[nIndex]).Start then Exit;
      stConnectData := '';

      stTemp := TNode(NodeList.Objects[nIndex]).GetNodeIndexInformation(con_NodeCmdDeviceCount);
      if isDigit(stTemp) then nCount := strtoint(stTemp)
      else nCount := 0;
      if nCount > 0 then
      begin
        for i := 0 to nCount - 1 do
        begin
          stTemp := TNode(NodeList.Objects[nIndex]).GetDeviceIndexInformation(con_DeviceCmdDeviceConnected,i);
          if stTemp = '' then stConnectData := stConnectData + '0'
          else stConnectData := stConnectData + stTemp[1];
        end;
      end;
      result := stConnectData;
    end else
    begin
      nIndex := ServerNodeList.IndexOf(stNodeNo);
      if nIndex > -1 then
      begin
        stConnectData := '';
        stTemp := dmNodeServer.DeviceNodeServer_GetNodeIndexInformation(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,con_NodeCmdDeviceCount);
        if isDigit(stTemp) then nCount := strtoint(stTemp)
        else nCount := 0;
        if nCount > 0 then
        begin
          for i := 0 to nCount - 1 do
          begin
            stTemp := dmNodeServer.DeviceNodeServer_GetDeviceIndexInformation(TServerNode(ServerNodeList.Objects[nIndex]).WinSocket,con_DeviceCmdDeviceConnected,i);
            if stTemp = '' then stConnectData := stConnectData + '0'
            else stConnectData := stConnectData + stTemp[1];
          end;
        end;
        result := stConnectData;
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','ClientSocket.GetNodeDeviceNetworkState');
  End;
end;

function TClientSocket.GetOnlyMainNodeIndexDoorState(aIndex: integer): string;
var
  stNodeData : string;
  stDoorData : string;
  stTemp : string;
  i : integer;
begin
  result := '';
  if aIndex > NodeList.Count - 1 then Exit;
  if G_nMonitoringOnlyDoorCount < 1 then Exit;

  stNodeData := FillZeroNumber(TNode(NodeList.Objects[aIndex]).No,G_nNodeCodeLength);
  stDoorData := FillZeroNumber(0,8 * G_nMonitoringOnlyDoorCount); //8bit ó��
  if TNode(NodeList.Objects[aIndex]).NodeConnected = csConnected then
  begin
    for i := 0 to G_nMonitoringOnlyDoorCount - 1 do
    begin
      stDoorData[i*8 + 1] := '1'; //��� ���� �Ǿ� �ִ�.
      if TNode(NodeList.Objects[aIndex]).GetDeviceIDDoorInformation(con_DoorCurrentFireEvent,'00',inttostr(i+1)) = '1' then
      begin
        stDoorData[i*8 + 8] := '1';
        stTemp := TNode(NodeList.Objects[aIndex]).GetDeviceIDDoorInformation(con_DoorCurrentDSState,'00',inttostr(i+1));
        if stTemp <> '*' then
        begin
          stDoorData[i*8 + 2] := '1'; //���Թ����¸� �ȴ�.
          if stTemp = 'C' then stDoorData[i*8 + 6] := '1';
        end;
      end else
      begin
        stTemp := TNode(NodeList.Objects[aIndex]).GetDeviceIDDoorInformation(con_DoorCurrentDSState,'00',inttostr(i+1));
        if stTemp <> '*' then
        begin
          stDoorData[i*8 + 2] := '1'; //���Թ����¸� �ȴ�.
          if stTemp = 'C' then stDoorData[i*8 + 6] := '1'
          else if (stTemp = 'T') or (stTemp = 'D') then
          begin
            stDoorData[i*8 + 7] := '1';
          end;
        end;
      end;
      if TNode(NodeList.Objects[aIndex]).GetDeviceIDDoorInformation(con_DoorCurrentCARDMode,'00',inttostr(i+1)) = '1' then  stDoorData[i*8 + 3] := '1';
      stTemp := TNode(NodeList.Objects[aIndex]).GetDeviceIDDoorInformation(con_DoorCurrentManagerMode,'00',inttostr(i+1));
      if stTemp = '1' then  stDoorData[i*8 + 5] := '1'
      else if stTemp = '2' then  stDoorData[i*8 + 4] := '1'
      else if stTemp = '3' then
      begin
        stDoorData[i*8 + 4] := '1';
        stDoorData[i*8 + 5] := '1';
      end;
    end;
  end;
  result := stNodeData + BinaryToHex(stDoorData);
end;

procedure TClientSocket.KTAutoDoorStateSend;
var
  i : integer;
  stSendData : string;
  stNodeData : string;
begin
  if NodeList.Count < 1 then Exit;
  stSendData := '';
  for i := 0 to NodeList.Count - 1 do
  begin
    if (i mod G_nMonitoringOnlyMainCount) = 0 then
    begin
      if stSendData <> '' then
         SendPacket('S',SCDOOR,'K',FillZeroNumber(G_nMonitoringOnlyMainCount,3),'00',stSendData);
      stSendData := '';
    end;
    stNodeData := GetKTNodeIndexDoorState(i);
    stSendData := stSendData + stNodeData;
  end;
  if stSendData <> '' then
     SendPacket('S',SCDOOR,'K',inttostr((NodeList.Count) mod G_nMonitoringOnlyMainCount),'00',stSendData);
end;

procedure TClientSocket.OnlyMainProtocolState;
var
  i : integer;
  stSendData : string;
  stNodeData : string;
  nMonitoringNodeCount : integer;
begin
  if NodeList.Count < 1 then Exit;
  stSendData := '';
  for i := 0 to NodeList.Count - 1 do
  begin
    if (i mod G_nMonitoringOnlyMainCount) = 0 then
    begin
      if stSendData <> '' then
         SendPacket('S',SCDOOR,'O',FillZeroNumber(G_nMonitoringOnlyMainCount,3),'00',stSendData);
      //LogSave(G_stLogDirectory + '\SendPacket' + FormatDateTime('yyyymmdd',now) + '.log',stSendData);
      stSendData := '';
    end;
    stNodeData := GetOnlyMainNodeIndexDoorState(i);
    stSendData := stSendData + stNodeData;
    Application.ProcessMessages;
  end;
  if stSendData <> '' then
  begin
     nMonitoringNodeCount := NodeList.Count mod G_nMonitoringOnlyMainCount;
     if nMonitoringNodeCount = 0 then nMonitoringNodeCount := G_nMonitoringOnlyMainCount;

     SendPacket('S',SCDOOR,'O',FillZeroNumber(nMonitoringNodeCount,3),'00',stSendData);
     //LogSave(G_stLogDirectory + '\SendPacket' + FormatDateTime('yyyymmdd',now) + '.log',stSendData);
  end;
end;

procedure TClientSocket.RcvPacketProcessTimerTimer(Sender: TObject);
var
  stPacketData : string;
begin
  Try
    if RcvPacketList.Count < 1 then Exit;
    RcvPacketProcessTimer.Enabled := False;
    Try
      stPacketData := RcvPacketList.Strings[0];
      RcvPacketList.Delete(0);
      ClientDataPacketProcess(stPacketData);
    Finally
      RcvPacketProcessTimer.Enabled := Not L_bClientSocketDestroy;
    End;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','ClientSocket.RcvPacketProcessTimerTimer');
    SocketClose;
  End;
end;

procedure TClientSocket.SendClientTimerTimer(Sender: TObject);
var
  stSendData : string;
  l_result: Integer;
  buf: TBytes;
  stTemp : RawByteString ;
  //stTemp : Widestring;
begin
  Try
    Try
      if L_bClientSocketDestroy then Exit;

      SendClientTimer.Enabled := False;
      L_bClientSending := True;
      if ClientSendPacketList.Count < 1 then Exit;
      stSendData := ClientSendPacketList.Strings[0];
      ClientSendPacketList.Delete(0);
      if Assigned(FOnClientPacketView) then
      begin
        OnClientPacketView(Self,ClientPCIP,'TX',stSendData,'00');  //View �� ���� �ְ�....
      end;
  //    Ascii2Bytes(stSendData,Length(stSendData),buf);
  //    l_result:= Send(m_socket_handle,buf[0], Length(stSendData), 0);
       stTemp := UTF8Encode(stSendData);
  //     stTemp := Widestring(stSendData);
       l_result:= Send(m_socket_handle,stTemp[1], Length(stTemp), 0);
    Finally
      SendClientTimer.Enabled := Not L_bClientSocketDestroy;
      L_bClientSending := False;
    End;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','ClientSocket.SendClientTimerTimer');
  End;
end;

procedure TClientSocket.SendPacket(aCMD, aDeviceType, aSubCmd, aNodeNo, aEcuID,
  aData: string);
var
  stSendData : string;
begin
  Try
    stSendData := GetPacketData(aCMD,aDeviceType,aSubCmd,aNodeNo,aEcuID,aData);
    if ClientSendPacketList <> nil then ClientSendPacketList.Add(stSendData);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','ClientSocket.SendPacket');
  End;
end;

procedure TClientSocket.ServerAliveTimerTimer(Sender: TObject);
begin
  Try
    if L_bClientSocketDestroy then Exit;
    if ClientSendPacketList.Count = 0 then
       SendPacket('e',SCECU,'*','0000','00','Alive');  //���� ���ۿ� �����Ͱ� ������ 100 �ʿ� �ѹ��� ��� ������ ������.
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','ClientSocket.ServerAliveTimerTimer');
  End;
end;

procedure TClientSocket.ServerNodeConnected(aNodeNo: string);
var
  stData : string;
begin
  Try
    stData := GetNodeDeviceNetworkState(aNodeNo);
    SendPacket('S',SCECU,'N',aNodeNo,'00',stData);
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','ClientSocket.ServerNodeConnected');
  End;
end;

procedure TClientSocket.SetConnected(const Value: Boolean);
begin
  FConnected := Value;
  if Value then
  begin
    if Assigned(FOnSocketConnected) then
    begin
      OnSocketConnected(Self,m_socket_handle);  //Socket ó�� �ϰ�
    end;
  end;
end;

procedure TClientSocket.SocketClose;
var
  l_result : integer;
  nTempWinSocket : integer;
begin
  Try
    if m_socket_handle <> INVALID_SOCKET then
    begin
      nTempWinSocket := m_socket_handle;
      shutdown(m_socket_handle,SD_BOTH);
      l_result:= CloseSocket(m_socket_handle);
      if l_result = 0 then
      begin
        m_socket_handle := INVALID_SOCKET;
      end else
      begin
        m_socket_handle := INVALID_SOCKET;
        //LogSave('ClientErr' + FormatDateTime('yyyymmdd',now) + '.log',ClientPCIP + ':PCServerCloseError');
      end;
      if Assigned(FOnSocketClose) then
      begin
        OnSocketClose(Self,nTempWinSocket);  //Socket ó�� �ϰ�
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','ClientSocket.SocketClose');
  End;
end;

procedure TClientSocket.SocketError(Sender: TObject; SocketError: Integer);
begin

end;

procedure TClientSocket.SocketPacketProcess;
var
  bLoop : Boolean;
  nFormat : integer;
  stLeavePacketData,stPacketData : String;
begin
  Try
    //Client ���� �۽��� �����Ͱ� ����� �´�.
    bLoop := False;
    repeat
      if Trim(L_ClientBuffer) = '' then Exit;
      nFormat := PacketFormatCheck(L_ClientBuffer,stLeavePacketData,stPacketData);
      L_ClientBuffer:= stLeavePacketData;

      if nFormat < 0 then
      begin
        if L_ClientBuffer = '' then break;
        if nFormat = -1 then  //������ ���� �ΰ��
        begin
          if Assigned(FOnClientPacketView) then
          begin
            OnClientPacketView(Self,ClientPCIP,'RX',L_ClientBuffer + '[' + Ascii2Hex(L_ClientBuffer) + ']','Er');
          end;
          Delete(L_ClientBuffer,1,1);
          continue;
        end else break;   //���� ���̰� �۰� ���� ���
      end;
      if stPacketData <> '' then
      begin
        RcvPacketList.Add(stPacketData);
        //ClientDataPacketProcess(stPacketData);
      end;
      if pos(SCETX,L_ClientBuffer) = 0 then bLoop := True
      else bLoop := False;
    until bLoop;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','ClientSocket.SocketPacketProcess');
  End;
end;

procedure TClientSocket.SocketRead;
var l_remaining: Integer;
    l_pt_start_reception: Pointer;
    l_packet_bytes: Integer;

    l_eol_position: Integer;
    l_file_name: String;
begin
  Try
    if l_c_reception_buffer = nil then Exit;
    with l_c_reception_buffer do
    begin
      l_remaining:= m_buffer_size- m_write_index;
      // -- if not at least a tcp-ip chunk, increase the room
      if l_remaining < k_tcp_ip_chunk then
      begin
        // -- reallocate
        double_the_capacity;
        l_remaining:= m_buffer_size- m_write_index;
      end;
      l_pt_start_reception:= @ m_oa_byte_buffer[m_write_index];
      l_packet_bytes:= Recv(m_socket_handle, l_pt_start_reception^, l_remaining, 0);
      if l_packet_bytes < 0 then SocketError(self,WSAGetLastError)
      else
      begin
        m_write_index:= m_write_index + l_packet_bytes;
        SocketReceive(self, l_pt_start_reception, l_packet_bytes);
      end;
    end;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','ClientSocket.SocketRead');
  End;
end;

procedure TClientSocket.SocketReceive(Sender: TObject; Buf: PAnsiChar;
  var DataLen: Integer);
begin
  Try
    LastReceiveTime := Now;
    L_ClientBuffer := L_ClientBuffer + Buf;
    SocketPacketProcess;
  Except
    LogSave(G_stLogDirectory + '\err' + FormatDateTime('yyyymmdd',now) + '.log','ClientSocket.SocketReceive');
  End;
end;

procedure TClientSocket.StateSendTimerTimer(Sender: TObject);
begin
//  if ClientSendPacketList.Count > 0 then Exit; //���� �Ұ� �׿� ������ �������� ����.

  StateSendTimer.Enabled := False;
  if L_nStateSendNodeSeq > NodeList.Count - 1 then Exit;

  //���⿡�� ���� ��������.
  Try
    if G_nMonitoringProtocol = 1 then  //����ġ ���� ��� ���������ΰ��
    begin
      OnlyMainProtocolState;
    end else
    begin
      AllNodeIndexStateSend(L_nStateSendNodeSeq);
      inc(L_nStateSendNodeSeq);
    end;
  Finally
    if G_nMonitoringProtocol <> 1 then StateSendTimer.Enabled := True;
  End;
end;

end.