unit uSKACSDataBase;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB,Vcl.Forms,Winapi.Windows,Vcl.Dialogs,ActiveX,
  uCommonVariable;

type
  TdmSKACSDataBase = class(TDataModule)
    ADOConnection: TADOConnection;
    ADOTempQuery: TADOQuery;
    MDBADOConnection: TADOConnection;
    MDBADOQuery: TADOQuery;
    BiostarADOConnection: TADOConnection;
    BiostarADOQuery: TADOQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    FCancel: Boolean;
    FDBConnected: Boolean;
    FOnAdoConnected: TAdoConnectedEvent;
    procedure SetCancel(const Value: Boolean);
    procedure SetDBConnected(const Value: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Function DataBaseConnect(aDBType:integer;aDBHost,aDBPort,aDBUserID,aDBUserPw,aDBName:string;aMessage: Boolean):Boolean;
    Function BioStarDataBaseConnect(aDataBaseName:string):Boolean;
    Function MDBDataBaseConnect(aDataBaseName:string):Boolean;
    Function DataBaseDisConnect:Boolean;
    Function ProcessExecSQL(aSql:String;bUpdateResult:Boolean=False): Boolean;
    Function GetTableVersion:integer;
    Function TableVersionCheck:Boolean;
    function Table_0001_VersionMake:Boolean;
    function Table_0002_VersionMake:Boolean;
  public
    Function AlterTB_SLOCAL_RelayBuildingCode_Add:Boolean;
    Function AlterTB_SLOCAL_RelayCode_Add:Boolean;
    Function CheckTB_LOCAL_Code(aLocalCode:string):integer;
    Function GetTB_SLOCAL_BuildingCode(aCode:string;var aName:string):string;
    Function GetTB_SLOCAL_CompanyCode(aCode:string;var aName:string):string;
    Function GetCardIDAndFingerID(aEmCode:string;var aCardNo:string;var aFingerID:string;var aFingerUse:integer):Boolean;
    Function InsertIntoTB_CONFIG_All(aCONFIGGROUP,aCONFIGCODE,aCONFIGVALUE:string;aDetail:string=''):Boolean;
    Function UpdateTB_CONFIG_Value(aCONFIGGROUP,aCONFIGCODE,aCONFIGVALUE:string):Boolean;
    Function UpdateTB_SLOCAL_BUILDINGCode(aSLocalCode,stBuildingCode:string):Boolean;
    Function UpdateTB_SLOCAL_CompanyCode(aSLocalCode,aCompanyCode:string):Boolean;
  public
    Property Cancel:Boolean read FCancel write SetCancel;
    Property DBConnected : Boolean read FDBConnected write SetDBConnected;
  Published
    property OnAdoConnected:      TAdoConnectedEvent read FOnAdoConnected       write FOnAdoConnected;
  end;
function SQLConfigDataSource(hwndParent : HWND; fRequest : WORD; lpszDriver : LPCSTR; lpszAttributes : LPCSTR) : Boolean; stdcall; external 'ODBCCP32.DLL';

var
  dmSKACSDataBase: TdmSKACSDataBase;

implementation

uses
  uCommonFunction;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmKTAMSDataBase }

function TdmSKACSDataBase.AlterTB_SLOCAL_RelayBuildingCode_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_SLOCAL ADD SL_RELAYBUILDINGCODE varchar(50) NULL ';
  result := ProcessExecSQL(stSql);
end;

function TdmSKACSDataBase.AlterTB_SLOCAL_RelayCode_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_SLOCAL ADD SL_RELAYCODE varchar(50) NULL ';
  result := ProcessExecSQL(stSql);
end;

function TdmSKACSDataBase.BioStarDataBaseConnect(
  aDataBaseName: string): Boolean;
var
  stConnectString : string;
  stDBType : string;
begin
  result := False;
  CanCel := False;
  G_stExeFolder  := ExtractFileDir(Application.ExeName);
  stConnectString := 'PROVIDER=SQLOLEDB.1;SERVER=localhost;DATABASE=' + aDataBaseName + ';TRUSTED_CONNECTION=YES';

  with BiostarADOConnection do
  begin
    Connected := False;
    Try
      ConnectionString := stConnectString;
      LoginPrompt:= false ;
      Connected := True;
    Except
      on E : EDatabaseError do
        begin
          ShowMessage(stConnectString + E.Message );
          Exit;
        end;
      else
        begin
          ShowMessage('Biostar�����ͺ��̽� ���ӿ���' );
          Exit;
        end;
    End;
    CursorLocation := clUseServer;
  end;

  result := True;
end;

function TdmSKACSDataBase.CheckTB_LOCAL_Code(aLocalCode: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_LOCAL ';
  stSql := stSql + ' where LOCAL_CODE = ''' + aLocalCode + '''';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordcount = 0 then result := 0
      else result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmSKACSDataBase.DataBaseConnect(aDBType: integer; aDBHost, aDBPort,
  aDBUserID, aDBUserPw, aDBName: string; aMessage: Boolean): Boolean;
var
  stConnectString : string;
  stDBType : string;
begin
  if DBConnected then Exit;
  result := False;
  CanCel := False;
  G_stExeFolder  := ExtractFileDir(Application.ExeName);
  if aDBType = MSSQL then
  begin
    //stConnectString := 'Data Source=localhost;Initial Catalog=' + aDBName + ';Integrated Security=SSPI';
    stConnectString := 'PROVIDER=SQLOLEDB.1;SERVER=localhost;DATABASE=' + aDBName + ';TRUSTED_CONNECTION=YES';
(*    stConnectString := stConnectString + 'Provider=SQLOLEDB.1;';
    stConnectString := stConnectString + 'Password=' + aDBUserPw + ';';
    stConnectString := stConnectString + 'Persist Security Info=True;';
    stConnectString := stConnectString + 'User ID=' + aDBUserID + ';';
    stConnectString := stConnectString + 'Initial Catalog=' + aDBName + ';';
    stConnectString := stConnectString + 'Data Source=' + aDBHost  + ',' + aDBPort;
    *)
  end else if aDBType = POSTGRESQL then
  begin

    stConnectString := 'Provider=PostgreSQL OLE DB Provider;';
    stConnectString := stConnectString + 'Data Source=' + aDBHost + ';'   ;
    stConnectString := stConnectString + 'location=' + aDBName + ';';
    stConnectString := stConnectString + 'User Id='+ aDBUserID + ';';
    stConnectString := stConnectString + 'password=' + aDBUserPw;

  end else if aDBType = FIREBIRD then
  begin
    stConnectString := 'Provider=ZStyle IBOLE Provider;';
    stConnectString := stConnectString + 'Data Source=' + aDBHost + ':' + aDBName + ';';
    stConnectString := stConnectString + 'UID='+ aDBUserID + ';';
    stConnectString := stConnectString + 'Password=' + aDBUserPw + ';';
    stConnectString := stConnectString + 'DIALECT=3;';
  end else //����Ʈ�� MDB�� �ν�����
  begin
    if Not FileExists(G_stExeFolder + '\..\db\SAC.mdb') then
    begin
      ChDir(G_stExeFolder + '\..\db');
      SQLConfigDataSource(0, 1, LPCSTR('Microsoft Access Driver (*.mdb)'), LPCSTR('CREATE_DB=SAC.mdb General'));
    end;

    stConnectString := 'Provider=Microsoft.Jet.OLEDB.4.0;';
    stConnectString := stConnectString + 'Data Source=' + G_stExeFolder + '\..\db\SAC.mdb' + ';';
    stConnectString := stConnectString + 'Persist Security Info=True;';
    stConnectString := stConnectString + 'Jet OLEDB:Database ';
  end;

  with ADOConnection do
  begin
    Connected := False;
    Try
      ConnectionString := stConnectString;
      LoginPrompt:= false ;
      Connected := True;
    Except
      on E : EDatabaseError do
        begin
          // ERROR MESSAGE-BOX DISPLAY
          if aMessage then
            ShowMessage(stConnectString + E.Message );
          Exit;
        end;
      else
        begin
          if aMessage then
            ShowMessage('�����ͺ��̽� ���ӿ���' );
          Exit;
        end;
    End;
    CursorLocation := clUseServer;
//    TableVersionCheck;
    //CursorLocation := clUseClient;
  end;

  DBConnected := True;
  result := True;
end;

function TdmSKACSDataBase.DataBaseDisConnect: Boolean;
begin
  DBConnected := False;
  with ADOConnection do
  begin
    Connected := False;
  end;
end;

procedure TdmSKACSDataBase.DataModuleCreate(Sender: TObject);
begin
  DBConnected := False;
end;

function TdmSKACSDataBase.GetCardIDAndFingerID(aEmCode: string;var aCardNo:string;var aFingerID:string;var aFingerUse:integer): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'select * from CardID ';
  stSql := stSql + ' where PNo = ''' + aEmCode + ''' ';

  with ADOTempQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    Try
      result := True;
      aFingerID := FindField('FRUSER').AsString;
      aCardNo := FindField('pID').AsString;
      if FindField('fFingerTemplate1').IsNull or (FindField('fFingerTemplate1').AsString = '') then aFingerUse := 0
      else aFingerUse := 1;
    Except
      Exit;
    End;
  end;
end;

function TdmSKACSDataBase.GetTableVersion: integer;
var
  stSql : string;
begin
  result := 0;
  stSql := 'select * from TB_CONFIG ';
  stSql := stSql + ' where CO_CONFIGGROUP = ''COMMON'' ';
  stSql := stSql + ' AND CO_CONFIGCODE = ''TABLEVER'' ';
  with ADOTempQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    Try
      result := strtoint(FindField('CO_CONFIGVALUE').AsString);
    Except
      Exit;
    End;
  end;
end;

function TdmSKACSDataBase.GetTB_SLOCAL_BuildingCode(aCode: string;
  var aName: string): string;
var
  stSql : string;
begin
  result := '';
  stSql := 'select * from TB_SLOCAL ';
  stSql := stSql + ' where SLOCAL_CODE = ''' + aCode + ''' ';
  with ADOTempQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    Try
      aName := FindField('SLOCAL_NAME').AsString;
      result := Trim(FindField('SL_RELAYBUILDINGCODE').AsString);
    Except
      Exit;
    End;
  end;
end;

function TdmSKACSDataBase.GetTB_SLOCAL_CompanyCode(aCode:string;var aName:string): string;
var
  stSql : string;
begin
  result := '';
  stSql := 'select * from TB_SLOCAL ';
  stSql := stSql + ' where SLOCAL_CODE = ''' + aCode + ''' ';
  with ADOTempQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    Try
      aName := FindField('SLOCAL_NAME').AsString;
      result := Trim(FindField('SL_RELAYCODE').AsString);
    Except
      Exit;
    End;
  end;
end;

function TdmSKACSDataBase.InsertIntoTB_CONFIG_All(aCONFIGGROUP, aCONFIGCODE,
  aCONFIGVALUE, aDetail: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_CONFIG (';
  stSql := stSql + ' CO_CONFIGGROUP,';
  stSql := stSql + ' CO_CONFIGCODE,';
  stSql := stSql + ' CO_CONFIGVALUE,';
  stSql := stSql + ' CO_CONFIGDETAIL) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + aCONFIGGROUP + ''', ';
  stSql := stSql + '''' + aCONFIGCODE + ''', ';
  stSql := stSql + '''' + aCONFIGVALUE + ''',';
  stSql := stSql + '''' + aDetail + ''') ';

  result := ProcessExecSQL(stSql);
end;

function TdmSKACSDataBase.MDBDataBaseConnect(aDataBaseName: string): Boolean;
var
  stConnectString : string;
begin
  result := False;
  CanCel := False;
  G_stExeFolder  := ExtractFileDir(Application.ExeName);
    stConnectString := 'Provider=Microsoft.Jet.OLEDB.4.0;';
    stConnectString := stConnectString + 'Data Source=' + G_stExeFolder + '\' + aDataBaseName + '.mdb' + ';';
    stConnectString := stConnectString + 'Persist Security Info=True;';
    stConnectString := stConnectString + 'Jet OLEDB:Database ';

  with MDBADOConnection do
  begin
    Connected := False;
    Try
      ConnectionString := stConnectString;
      LoginPrompt:= false ;
      Connected := True;
    Except
      on E : EDatabaseError do
        begin
          ShowMessage(stConnectString + E.Message );
          Exit;
        end;
      else
        begin
          ShowMessage('MDB�����ͺ��̽� ���ӿ���' );
          Exit;
        end;
    End;
    CursorLocation := clUseServer;
  end;

  result := True;
end;

function TdmSKACSDataBase.ProcessExecSQL(aSql: String;
  bUpdateResult: Boolean): Boolean;
var
  ExecQuery :TADOQuery;
  nResult : integer;
begin
  //������Ű��
  Result:= False;
  Try
    CoInitialize(nil);
    ExecQuery := TADOQuery.Create(nil);
    ExecQuery.Connection := ADOConnection;
    ExecQuery.DisableControls;
    with ExecQuery do
    begin
      Close;
      SQL.Text:= aSql;
      try
        nResult := ExecSQL;
//        LogSave(G_stExeFolder + '\..\Log\DBSUCCESS' + FormatDateTime('yyyymmdd',Now) + '.log',aSql);
      except
      ON E: Exception do
        begin
          LogSave(G_stExeFolder + '\Log\DB' + FormatDateTime('yyyymmdd',Now) + '.log','DBError('+ E.Message + ')' + aSql);

          if Pos('no connection to the server',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end else if Pos('out of memory',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end else if Pos('server closed the connection',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end else if Pos('connection dead',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end else if Pos('������ �����߽��ϴ�',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end;

          Exit;
        end
      end;
    end;
  Finally
    ExecQuery.EnableControls;
    ExecQuery.Free;
    CoUninitialize;
  End;

  if bUpdateResult then
  begin
    if nResult > 0 then Result := True
    else
    begin
      Result := False;
      LogSave(G_stExeFolder + '\..\Log\DB' + FormatDateTime('yyyymmdd',Now) + '.log','DBError(UPDATE)' + aSql);
    end;
  end else
  begin
    Result:= True;
  end;
end;

procedure TdmSKACSDataBase.SetCancel(const Value: Boolean);
begin
  FCancel := Value;
end;

procedure TdmSKACSDataBase.SetDBConnected(const Value: Boolean);
begin
  FDBConnected := Value;
end;

function TdmSKACSDataBase.TableVersionCheck: Boolean;
var
  nTableVersion : integer;
begin
  result := False;
  nTableVersion := GetTableVersion;
  if nTableVersion < 1 then Table_0001_VersionMake;
  if nTableVersion < 2 then Table_0002_VersionMake;

end;

function TdmSKACSDataBase.Table_0001_VersionMake: Boolean;
begin
  AlterTB_SLOCAL_RelayCode_Add;
  InsertIntoTB_CONFIG_All('COMMON','TABLEVER','1','');
end;

function TdmSKACSDataBase.Table_0002_VersionMake: Boolean;
begin
  AlterTB_SLOCAL_RelayBuildingCode_Add;

  UpdateTB_CONFIG_Value('COMMON','TABLEVER','2');
end;

function TdmSKACSDataBase.UpdateTB_CONFIG_Value(aCONFIGGROUP, aCONFIGCODE,
  aCONFIGVALUE: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_CONFIG set CO_CONFIGVALUE = ''' + aCONFIGVALUE + '''' ;
  stSql := stSql + ' Where CO_CONFIGGROUP = ''' + aCONFIGGROUP + ''' ';
  stSql := stSql + ' AND CO_CONFIGCODE = ''' + aCONFIGCODE + ''' ';

  result := ProcessExecSQL(stSql);
end;

function TdmSKACSDataBase.UpdateTB_SLOCAL_BUILDINGCode(aSLocalCode,
  stBuildingCode: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_SLOCAL set SL_RELAYBUILDINGCODE = ''' + stBuildingCode + '''' ;
  stSql := stSql + ' Where SLOCAL_CODE = ''' + aSLocalCode + ''' ';

  result := ProcessExecSQL(stSql);
end;

function TdmSKACSDataBase.UpdateTB_SLOCAL_CompanyCode(aSLocalCode,
  aCompanyCode: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_SLOCAL set SL_RELAYCODE = ''' + aCompanyCode + '''' ;
  stSql := stSql + ' Where SLOCAL_CODE = ''' + aSLocalCode + ''' ';

  result := ProcessExecSQL(stSql);
end;

end.