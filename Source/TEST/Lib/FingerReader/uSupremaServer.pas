unit uSupremaServer;

interface

uses
  System.SysUtils, System.Classes,Winapi.Windows,Vcl.ExtCtrls,
  System.DateUtils,uFingerVariable;

type
  TFingerCardNo = Class(TComponent)
  private
    FPOSITIONNUM: string;
    FSEND: string;
    FCARDNO: string;
    FTEMPLATE2_2: string;
    FCARDGUBUN: string;
    FTEMPLATE2_1: string;
    FTEMPLATE1_2: string;
    FTEMPLATE1_1: string;
    FFINGERID: string;
    FENDDATE: string;
    FFNSEQ: integer;
    FOnCardSendingChange: TCardSendingChange;
    FCARDSTATE: string;
    FPERMIT: string;
    procedure SetSEND(const Value: string);
  published
    property FNSEQ : integer read FFNSEQ write FFNSEQ;
    property POSITIONNUM : string read FPOSITIONNUM write FPOSITIONNUM;
    property CARDNO : string read FCARDNO write FCARDNO;
    property CARDGUBUN : string read FCARDGUBUN write FCARDGUBUN;
    property FINGERID : string read FFINGERID write FFINGERID;
    property TEMPLATE1_1 : string read FTEMPLATE1_1 write FTEMPLATE1_1;
    property TEMPLATE1_2 : string read FTEMPLATE1_2 write FTEMPLATE1_2;
    property TEMPLATE2_1 : string read FTEMPLATE2_1 write FTEMPLATE2_1;
    property TEMPLATE2_2 : string read FTEMPLATE2_2 write FTEMPLATE2_2;
    property ENDDATE : string read FENDDATE write FENDDATE;
    property PERMIT : string read FPERMIT write FPERMIT;
    property CARDSTATE : string read FCARDSTATE write FCARDSTATE;
    property SEND : string read FSEND write SetSEND;
  published
    property OnCardSendingChange : TCardSendingChange read FOnCardSendingChange write FOnCardSendingChange;
  End;


  TSupremaServer = Class(TComponent)
  private
    CardDownLoadTimer : TTimer;
    L_bCardDownLoading : Boolean;
    L_bModuleDestory : Boolean;
    L_nLibHandle : integer;
    L_nSockethandle : integer;
    L_nErrorCount : integer;
    FingerCardList : TStringList;

    procedure CardDownLoadTimerTimer(Sender:TObject);
    procedure CardSendingChange(Sender: TObject;  aFNDEVICESEQ,POSITIONNUM : integer;aData:string);
    procedure TimeSync;
  private
    FFNSEQ: integer;
    FDEVICEIP: string;
    FDEVICENAME: string;
    FDEVICEPORT: string;
    FDEVICETYPE: string;
    FNODENO: integer;
    FCPTYPE: string;
    FECUID: string;
    FEXTENDID: integer;
    FCONTROLNO: integer;
    FConnected: Boolean;
    FSocketOPEN: Boolean;
    FOnCardSendingChange: TCardSendingChange;
    FOnReaderConnected: TReaderConnected;
    FOnFingerCardEvent: TFingerCardEvent;
    procedure SetSocketOPEN(const Value: Boolean);
    procedure SetConnected(const Value: Boolean);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  public
    Function SetFingerCardDownload(aFNDEVICESEQ,aPOSITIONNUM,aSEND,aCARDNO,aCARDGUBUN,aFINGERID,aTEMPLATE1_1,aTEMPLATE1_2,aTEMPLATE2_1,aTEMPLATE2_2,aENDDATE,aPermit,aCardState:string):Boolean;
    Function FingerUserAllDelete:Boolean;
  published
    property FNSEQ : integer read FFNSEQ write FFNSEQ;
    property DEVICEIP : string read FDEVICEIP write FDEVICEIP;
    property DEVICENAME : string read FDEVICENAME write FDEVICENAME;
    property DEVICEPORT : string read FDEVICEPORT write FDEVICEPORT;
    property DEVICETYPE : string read FDEVICETYPE write FDEVICETYPE; //'1'.����,'2'.��������
    property CPTYPE : string read FCPTYPE write FCPTYPE;             //'1'.���Թ�����,'2'.�����������
    property NODENO : integer read FNODENO write FNODENO;
    property ECUID : string read FECUID write FECUID;
    property EXTENDID : integer read FEXTENDID write FEXTENDID;
    property CONTROLNO : integer read FCONTROLNO write FCONTROLNO;
  published
    property Connected : Boolean read FConnected write SetConnected;
    property SocketOPEN : Boolean read FSocketOPEN write SetSocketOPEN;
  published
    property OnCardSendingChange : TCardSendingChange read FOnCardSendingChange write FOnCardSendingChange;
    property OnReaderConnected : TReaderConnected read FOnReaderConnected write FOnReaderConnected;
    property OnFingerCardEvent : TFingerCardEvent read FOnFingerCardEvent write FOnFingerCardEvent;

  End;
  TdmSupremaServer = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmSupremaServer: TdmSupremaServer;

implementation

uses
  uCommonFunction;
{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TSupremaServer }

procedure TSupremaServer.CardDownLoadTimerTimer(Sender: TObject);
var
  i,j : integer;
  bSend : Boolean;
  nResult : UF_RET_CODE;
  SetScanTemplateADD : T_BS_ScanTemplateADD;
  SetDeleteUser : T_BS_DeleteUser;
  nCardNo : Longword;
  stExpiretime : string;
  expireTime : double;
  nExpireTime : int64;
  nFingerCount : integer;
  nUserID : integer;
  fnTemplate : PFingerTemplate;
  stErrMessage : string;
begin
  if L_nLibHandle = 0 then Exit;  //Dll �ε� ���н� ���� ����.
  if Not Connected then Exit; //���� �ȵǾ� ������ ���� �Ϸ� ���� ����.

  if L_bCardDownLoading then Exit;
  if L_bModuleDestory then Exit;
  Try
    L_bCardDownLoading := True;
    //���⼭ ī�嵥���� �ٿ�ε� ����.
    if FingerCardList.Count > 0 then
    begin
      bSend := False;
      for i := 0 to FingerCardList.Count - 1 do
      begin
        if TFingerCardNo(FingerCardList.Objects[i]).SEND = 'R' then
        begin
          bSend := True;
          if (TFingerCardNo(FingerCardList.Objects[i]).CARDSTATE = '1') and  //ī�尡 ��� ���� �̸鼭
             (TFingerCardNo(FingerCardList.Objects[i]).PERMIT = '1')         //������ �ִ� ��쿡�� ����
          then
          begin
            @SetScanTemplateADD := GetProcAddress(L_nLibHandle,'F_BS_ScanTemplateADD');
            if Not(@SetScanTemplateADD = nil)  then
            begin
              nCardNo := Hex2Dec64(copy(TFingerCardNo(FingerCardList.Objects[i]).CARDNO,1,8));
              stExpiretime := TFingerCardNo(FingerCardList.Objects[i]).ENDDATE;
              expireTime := EncodeDateTime(strtoint(copy(stExpiretime,1,4)),
                                             strtoint(copy(stExpiretime,5,2)),
                                             strtoint(copy(stExpiretime,7,2)),
                                             23,59,59,0);
              nExpireTime := (Trunc(expireTime) - SF_EpochDiff) * SF_SecsInDay;
              nUserID := strtoint(TFingerCardNo(FingerCardList.Objects[i]).POSITIONNUM);
              Try
                New(fnTemplate);
                nFingerCount := 0;
                if TFingerCardNo(FingerCardList.Objects[i]).CARDGUBUN = '0' then
                begin
                  if (TFingerCardNo(FingerCardList.Objects[i]).TEMPLATE1_1 <> '') and
                     (TFingerCardNo(FingerCardList.Objects[i]).TEMPLATE1_2 <> '')
                    then
                  begin
                    Try
                      nFingerCount := 1;
                      for j := 0 to SF_TEMPLATE_SIZE - 1 do
                        fnTemplate.Template1[j] := strtoint64(copy(TFingerCardNo(FingerCardList.Objects[i]).TEMPLATE1_1,1 + (j * 10),10));
                      for j := 0 to SF_TEMPLATE_SIZE - 1 do
                        fnTemplate.Template2[j] := strtoint64(copy(TFingerCardNo(FingerCardList.Objects[i]).TEMPLATE1_2,1 + (j * 10),10));
                      if (TFingerCardNo(FingerCardList.Objects[i]).TEMPLATE2_1 <> '') and
                         (TFingerCardNo(FingerCardList.Objects[i]).TEMPLATE2_2 <> '')
                        then
                      begin
                        nFingerCount := 2;
                        for j := 0 to SF_TEMPLATE_SIZE - 1 do
                          fnTemplate.Template3[j] := strtoint64(copy(TFingerCardNo(FingerCardList.Objects[i]).TEMPLATE2_1,1 + (j * 10),10));
                        for j := 0 to SF_TEMPLATE_SIZE - 1 do
                          fnTemplate.Template4[j] := strtoint64(copy(TFingerCardNo(FingerCardList.Objects[i]).TEMPLATE2_2,1 + (j * 10),10));
                      end;
                    Except
                      nFingerCount := 0;
                    End;
                  end;
                end;

                if Assigned(FOnFingerCardEvent) then
                begin
                  OnFingerCardEvent(Self,DEVICEIP,'FINGERCARDADD',TFingerCardNo(FingerCardList.Objects[i]).CARDNO,inttostr(nUserID),'Download Start');
                end;
                nResult := SetScanTemplateADD(L_nSockethandle,nFingerCount,nUserID,0,fnTemplate^,nCardNo,nExpireTime);   //1471
                if nResult = UF_RET_SUCCESS then
                begin
                  L_nErrorCount := 0;
                  TFingerCardNo(FingerCardList.Objects[i]).SEND := 'Y';
                  if Assigned(FOnFingerCardEvent) then
                  begin
                    OnFingerCardEvent(Self,DEVICEIP,'FINGERCARDADD',TFingerCardNo(FingerCardList.Objects[i]).CARDNO,inttostr(nUserID),'Download Success');
                  end;
                end else
                begin
                  if (nResult = UF_ERR_CANNOT_START_SOCKET) or
                     (nResult = UF_ERR_CANNOT_OPEN_SOCKET) or
                     (nResult = UF_ERR_CANNOT_CONNECT_SOCKET) or
                     (nResult = UF_ERR_CANNOT_READ_SOCKET) or
                     (nResult = UF_ERR_READ_SOCKET_TIMEOUT) or
                     (nResult = UF_ERR_CANNOT_WRITE_SOCKET) or
                     (nResult = UF_ERR_WRITE_SOCKET_TIMEOUT)
                   then
                   begin
                      SocketOpen := False;
                      if Assigned(FOnFingerCardEvent) then
                      begin
                        if (nResult = UF_ERR_CANNOT_START_SOCKET) then stErrMessage := 'UF_ERR_CANNOT_START_SOCKET'
                        else if (nResult = UF_ERR_CANNOT_OPEN_SOCKET) then stErrMessage := 'UF_ERR_CANNOT_OPEN_SOCKET'
                        else if (nResult = UF_ERR_CANNOT_CONNECT_SOCKET) then stErrMessage := 'UF_ERR_CANNOT_CONNECT_SOCKET'
                        else if (nResult = UF_ERR_CANNOT_READ_SOCKET) then stErrMessage := 'UF_ERR_CANNOT_READ_SOCKET'
                        else if (nResult = UF_ERR_READ_SOCKET_TIMEOUT) then stErrMessage := 'UF_ERR_READ_SOCKET_TIMEOUT'
                        else if (nResult = UF_ERR_CANNOT_WRITE_SOCKET) then stErrMessage := 'UF_ERR_CANNOT_WRITE_SOCKET'
                        else if (nResult = UF_ERR_WRITE_SOCKET_TIMEOUT) then stErrMessage := 'UF_ERR_WRITE_SOCKET_TIMEOUT';
                        OnFingerCardEvent(Self,DEVICEIP,'FINGERCARDADD',TFingerCardNo(FingerCardList.Objects[i]).CARDNO,inttostr(nUserID),'Socket Error' + stErrMessage);
                      end;
                      Delay(1000);
                   end else if nResult = UF_ERR_SOCKET_UNKNOWN then
                   begin
                      SocketOpen := False;
                      TFingerCardNo(FingerCardList.Objects[i]).SEND := 'Y';
                      if Assigned(FOnFingerCardEvent) then
                      begin
                        OnFingerCardEvent(Self,DEVICEIP,'FINGERCARDADD',TFingerCardNo(FingerCardList.Objects[i]).CARDNO,inttostr(nUserID),'(-311)Download Success');
                      end;
                   end else begin
                      L_nErrorCount := L_nErrorCount + 1;
                      if L_nErrorCount > 5 then
                      begin
                        SocketOpen := False;
                        L_nErrorCount := 0;
                        Delay(1000);
                      end;
                      TFingerCardNo(FingerCardList.Objects[i]).SEND := 'N'; //���߿� �ٽ� ���� ����.
                      if Assigned(FOnFingerCardEvent) then
                      begin
                        OnFingerCardEvent(Self,DEVICEIP,'FINGERCARDADD',TFingerCardNo(FingerCardList.Objects[i]).CARDNO,inttostr(nUserID),inttostr(integer(nResult)) + ': Download Fail');
                      end;
                   end;
                end;
              Finally
                Dispose(fnTemplate);
              End;
              break; //�ϳ� ���� �� ���� ������.
            end else
            begin
              SocketOpen := False; //�Լ� �ε� ���н�
            end;
          end else  //������ ���� ��� ���� ���� ������.
          begin
            @SetDeleteUser := GetProcAddress(L_nLibHandle,'F_BS_DeleteUser');
            if Not(@SetDeleteUser = nil)  then
            begin
              nUserID := strtoint(TFingerCardNo(FingerCardList.Objects[i]).POSITIONNUM);
              if Assigned(FOnFingerCardEvent) then
              begin
                OnFingerCardEvent(Self,DEVICEIP,'FINGERCARDDELETE',TFingerCardNo(FingerCardList.Objects[i]).CARDNO,inttostr(nUserID),'Download Start');
              end;
              nResult := SetDeleteUser(L_nSockethandle,nUserID);
              if nResult = UF_RET_SUCCESS then
              begin
                //L_nErrorCount := 0;
                TFingerCardNo(FingerCardList.Objects[i]).SEND := 'Y';
                if Assigned(FOnFingerCardEvent) then
                begin
                  OnFingerCardEvent(Self,DEVICEIP,'FINGERCARDDELETE',TFingerCardNo(FingerCardList.Objects[i]).CARDNO,inttostr(nUserID),'Download Success');
                end;
              end else
              begin
                if (nResult = UF_ERR_CANNOT_START_SOCKET) or
                   (nResult = UF_ERR_CANNOT_OPEN_SOCKET) or
                   (nResult = UF_ERR_CANNOT_CONNECT_SOCKET) or
                   (nResult = UF_ERR_CANNOT_READ_SOCKET) or
                   (nResult = UF_ERR_READ_SOCKET_TIMEOUT) or
                   //(nResult = UF_ERR_CANNOT_WRITE_SOCKET) or    // ���������� ���µ� ���� ���� ���� ������ ���
                   (nResult = UF_ERR_WRITE_SOCKET_TIMEOUT)
                 then
                 begin
                    SocketOpen := False;
                    if Assigned(FOnFingerCardEvent) then
                    begin
                      if (nResult = UF_ERR_CANNOT_START_SOCKET) then stErrMessage := 'UF_ERR_CANNOT_START_SOCKET'
                      else if (nResult = UF_ERR_CANNOT_OPEN_SOCKET) then stErrMessage := 'UF_ERR_CANNOT_OPEN_SOCKET'
                      else if (nResult = UF_ERR_CANNOT_CONNECT_SOCKET) then stErrMessage := 'UF_ERR_CANNOT_CONNECT_SOCKET'
                      else if (nResult = UF_ERR_CANNOT_READ_SOCKET) then stErrMessage := 'UF_ERR_CANNOT_READ_SOCKET'
                      else if (nResult = UF_ERR_READ_SOCKET_TIMEOUT) then stErrMessage := 'UF_ERR_READ_SOCKET_TIMEOUT'
                      else if (nResult = UF_ERR_CANNOT_WRITE_SOCKET) then stErrMessage := 'UF_ERR_CANNOT_WRITE_SOCKET'
                      else if (nResult = UF_ERR_WRITE_SOCKET_TIMEOUT) then stErrMessage := 'UF_ERR_WRITE_SOCKET_TIMEOUT' ;
                      OnFingerCardEvent(Self,DEVICEIP,'FINGERCARDDELETE',TFingerCardNo(FingerCardList.Objects[i]).CARDNO,inttostr(nUserID),'Socket Error' + stErrMessage);
                    end;
                    Delay(1000);
                 end else begin
                    //L_nErrorCount := L_nErrorCount + 1;
                    TFingerCardNo(FingerCardList.Objects[i]).SEND := 'Y'; //���� �Ϸ� ó�� ����.
                    if Assigned(FOnFingerCardEvent) then
                    begin
                      OnFingerCardEvent(Self,DEVICEIP,'FINGERCARDDELETE',TFingerCardNo(FingerCardList.Objects[i]).CARDNO,inttostr(nUserID),inttostr(integer(nResult)) + ': Download Fail');
                    end;
                end;
              end;
            end else
            begin
              SocketOpen := False; //�Լ� �ε� ���н�
            end;
            break; //�ϳ� ���� �� ���� ������.
          end;
        end;
      end;
      if Not bSend then CardDownLoadTimer.Enabled := False; //���� �� ���� ������ �ٿ�ε� ���� ����.
    end else
    begin
      CardDownLoadTimer.Enabled := False;
    end;
  Finally
    L_bCardDownLoading := False;
  End;
end;

procedure TSupremaServer.CardSendingChange(Sender: TObject; aFNDEVICESEQ,
  POSITIONNUM: integer; aData: string);
begin
  if Assigned(FOnCardSendingChange) then
  begin
    OnCardSendingChange(Self,aFNDEVICESEQ,POSITIONNUM,aData);
  end;
end;

constructor TSupremaServer.Create(AOwner: TComponent);
var
  BS_InitSDK : T_BS_InitSDK;
  nResult : UF_RET_CODE;
begin
  L_nLibHandle := -1;
  L_nLibHandle := LoadLibrary('BioStar16.dll');
  if L_nLibHandle > 0 then
  begin
    @BS_InitSDK := GetProcAddress(L_nLibHandle,'F_BS_InitSDK');
    if Not(@BS_InitSDK = nil)  then
    begin
      nResult := BS_InitSDK();
      if nResult <> UF_RET_SUCCESS then L_nLibHandle := 0;
    end else
    begin
      L_nLibHandle := 0;
    end;
  end;
  FingerCardList := TStringList.Create;
  CardDownLoadTimer := TTimer.Create(nil);
  CardDownLoadTimer.Interval := 500;
  CardDownLoadTimer.OnTimer := CardDownLoadTimerTimer;
  CardDownLoadTimer.Enabled := False;
end;

destructor TSupremaServer.Destroy;
var
  i : integer;
begin
  L_bModuleDestory := True;
  if L_nLibHandle <> 0 then
    FreeLibrary(L_nLibHandle);

  CardDownLoadTimer.Enabled := False;
  if FingerCardList.Count > 0 then
  begin
    for i := FingerCardList.Count - 1 downto 0 do
    begin
      TFingerCardNo(FingerCardList.Objects[i]).Free;
    end;
  end;
  FingerCardList.Free;
  CardDownLoadTimer.Free;
  inherited;
end;

function TSupremaServer.FingerUserAllDelete: Boolean;
var
  i,j : integer;
  bSend : Boolean;
  nResult : UF_RET_CODE;
  SetFiingerAllUserDelete : T_BS_DeleteAllUser;
  stErrMessage : string;
begin
  if L_nLibHandle = 0 then Exit;  //Dll �ε� ���н� ���� ����.
  if Not Connected then Exit; //���� �ȵǾ� ������ ���� �Ϸ� ���� ����.

  if L_bCardDownLoading then Exit;
  if L_bModuleDestory then Exit;
  @SetFiingerAllUserDelete := GetProcAddress(L_nLibHandle,'F_BS_DeleteAllUser');
  if Not(@SetFiingerAllUserDelete = nil)  then
  begin
      nResult := SetFiingerAllUserDelete(L_nSockethandle);   //1471
      if nResult = UF_RET_SUCCESS then
      begin
        L_nErrorCount := 0;
        if Assigned(FOnFingerCardEvent) then
        begin
          OnFingerCardEvent(Self,DEVICEIP,'ALLUSERDELETE','','','Delete Success');
        end;
      end else
      begin
        if (nResult = UF_ERR_CANNOT_START_SOCKET) or
           (nResult = UF_ERR_CANNOT_OPEN_SOCKET) or
           (nResult = UF_ERR_CANNOT_CONNECT_SOCKET) or
           (nResult = UF_ERR_CANNOT_READ_SOCKET) or
           (nResult = UF_ERR_READ_SOCKET_TIMEOUT) or
           (nResult = UF_ERR_CANNOT_WRITE_SOCKET) or
           (nResult = UF_ERR_WRITE_SOCKET_TIMEOUT)
         then
         begin
            SocketOpen := False;
            if Assigned(FOnFingerCardEvent) then
            begin
              OnFingerCardEvent(Self,DEVICEIP,'ALLUSERDELETE','','','Socket Error');
            end;
            Delay(1000);
         end else if nResult = UF_ERR_SOCKET_UNKNOWN then
         begin
            SocketOpen := False;
            TFingerCardNo(FingerCardList.Objects[i]).SEND := 'Y';
            if Assigned(FOnFingerCardEvent) then
            begin
              OnFingerCardEvent(Self,DEVICEIP,'ALLUSERDELETE','','','(-311)Socket Error');
            end;
         end else begin
            if Assigned(FOnFingerCardEvent) then
            begin
              OnFingerCardEvent(Self,DEVICEIP,'ALLUSERDELETE','','','Error');
            end;
         end;
      end;
  end;

end;

procedure TSupremaServer.SetConnected(const Value: Boolean);
begin
  if FConnected = Value then Exit;
  FConnected := Value;
  if Assigned(FOnReaderConnected) then
  begin
    OnReaderConnected(Self,FNSEQ,Value);
  end;
  if Value then
  begin
    TimeSync;
  end;
end;

function TSupremaServer.SetFingerCardDownload(aFNDEVICESEQ, aPOSITIONNUM, aSEND,
  aCARDNO, aCARDGUBUN, aFINGERID, aTEMPLATE1_1, aTEMPLATE1_2, aTEMPLATE2_1,
  aTEMPLATE2_2,aENDDATE,aPermit,aCardState: string): Boolean;
var
  nIndex : integer;
  oFingerCardNo : TFingerCardNo;
begin
  nIndex := FingerCardList.IndexOf(aPOSITIONNUM);
  if nIndex < 0 then
  begin
    oFingerCardNo := TFingerCardNo.Create(nil);
    oFingerCardNo.FNSEQ := strtoint(aFNDEVICESEQ);
    oFingerCardNo.POSITIONNUM := aPOSITIONNUM;
    oFingerCardNo.CARDNO := aCARDNO;
    oFingerCardNo.CARDGUBUN := aCARDGUBUN;
    oFingerCardNo.FINGERID := aFINGERID;
    oFingerCardNo.TEMPLATE1_1 := aTEMPLATE1_1;
    oFingerCardNo.TEMPLATE1_2 := aTEMPLATE1_2;
    oFingerCardNo.TEMPLATE2_1 := aTEMPLATE2_1;
    oFingerCardNo.TEMPLATE2_2 := aTEMPLATE2_2;
    oFingerCardNo.ENDDATE := aENDDATE;
    oFingerCardNo.PERMIT := aPermit;
    oFingerCardNo.CARDSTATE := aCardState;
    oFingerCardNo.SEND := aSEND;

    oFingerCardNo.OnCardSendingChange := CardSendingChange;

    FingerCardList.AddObject(aPOSITIONNUM,oFingerCardNo);
  end else
  begin
    TFingerCardNo(FingerCardList.Objects[nIndex]).FNSEQ := strtoint(aFNDEVICESEQ);
    TFingerCardNo(FingerCardList.Objects[nIndex]).POSITIONNUM := aPOSITIONNUM;
    TFingerCardNo(FingerCardList.Objects[nIndex]).CARDNO := aCARDNO;
    TFingerCardNo(FingerCardList.Objects[nIndex]).CARDGUBUN := aCARDGUBUN;
    TFingerCardNo(FingerCardList.Objects[nIndex]).FINGERID := aFINGERID;
    TFingerCardNo(FingerCardList.Objects[nIndex]).TEMPLATE1_1 := aTEMPLATE1_1;
    TFingerCardNo(FingerCardList.Objects[nIndex]).TEMPLATE1_2 := aTEMPLATE1_2;
    TFingerCardNo(FingerCardList.Objects[nIndex]).TEMPLATE2_1 := aTEMPLATE2_1;
    TFingerCardNo(FingerCardList.Objects[nIndex]).TEMPLATE2_2 := aTEMPLATE2_2;
    TFingerCardNo(FingerCardList.Objects[nIndex]).ENDDATE := aENDDATE;
    TFingerCardNo(FingerCardList.Objects[nIndex]).PERMIT := aPermit;
    TFingerCardNo(FingerCardList.Objects[nIndex]).CARDSTATE := aCardState;
    TFingerCardNo(FingerCardList.Objects[nIndex]).SEND := aSEND;

  end;
  CardDownLoadTimer.Enabled := True;
end;

procedure TSupremaServer.SetSocketOPEN(const Value: Boolean);
var
  BS_OpenSocket : T_BS_OpenSocket;
  BS_CloseSocket : T_BS_CloseSocket;
  nResult : UF_RET_CODE;
begin
  if FSocketOPEN = Value then Exit;
  FSocketOPEN := Value;

  if Value then
  begin
    if L_nLibHandle < 1 then
    begin
      SocketOPEN := False;
      Exit;
    end;
    @BS_OpenSocket := GetProcAddress(L_nLibHandle,'F_BS_OpenSocket');
    if Not(@BS_OpenSocket = nil)  then
    begin
      nResult := BS_OpenSocket(pAnsiChar(AnsiString(DeviceIP)), strtoint(DevicePort), L_nSockethandle);   //1471
      if nResult = UF_RET_SUCCESS then
      begin
        if Assigned(FOnFingerCardEvent) then
        begin
          OnFingerCardEvent(Self,DEVICEIP,'Socket','','','Open Success');
        end;
        Connected := True;
      end else
      begin
        L_nSockethandle := -1;
        SocketOPEN := False;
      end;
    end else
    begin
      SocketOPEN := False;
    end;
  end else
  begin
    Connected := False;
    if Assigned(FOnFingerCardEvent) then
    begin
      OnFingerCardEvent(Self,DEVICEIP,'Socket','','','Close');
    end;
    if L_nSockethandle <> -1 then
    begin
      @BS_CloseSocket := GetProcAddress(L_nLibHandle,'F_BS_CloseSocket');
      if Not(@BS_CloseSocket = nil)  then
      begin
        Try
          nResult := BS_CloseSocket(L_nSockethandle);   //1471
        Except
          Exit;
        End;
      end;
    end;
  end;
end;

procedure TSupremaServer.TimeSync;
var
  nResult : UF_RET_CODE;
  SetTimeSync : T_BS_SetTime;

  i,j : integer;
  bSend : Boolean;
  SetDeleteUser : T_BS_DeleteUser;
  nCardNo : Longword;
  stExpiretime : string;
  expireTime : double;
  nExpireTime : int64;
  nFingerCount : integer;
  nUserID : integer;
  fnTemplate : PFingerTemplate;
begin
  if L_nLibHandle = 0 then Exit;  //Dll �ε� ���н� ���� ����.
  if Not Connected then Exit; //���� �ȵǾ� ������ ���� �Ϸ� ���� ����.

  if L_bModuleDestory then Exit;
  Try
    @SetTimeSync := GetProcAddress(L_nLibHandle,'F_BS_SetTime');
    if Not(@SetTimeSync = nil)  then
    begin
      nResult := SetTimeSync(L_nSockethandle);   //1471
    end;
  Except

  End;
end;

{ TFingerCardNo }

procedure TFingerCardNo.SetSEND(const Value: string);
begin
  if FSEND = Value then Exit;
  FSEND := Value;
  if Assigned(FOnCardSendingChange) then
  begin
    OnCardSendingChange(Self,FNSEQ,strtoint(POSITIONNUM),Value);
  end;
end;

end.