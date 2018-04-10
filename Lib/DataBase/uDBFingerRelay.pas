unit uDBFingerRelay;

interface

uses
  System.SysUtils, System.Classes,Data.Win.ADODB,Vcl.Forms,
  uCommonEvent, Data.DB;

type
  TdmFingerDBRelay = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    RelayExeQuery: TADOQuery;
  private
    procedure SQLErrorLog(aSQL:string);
  private
    FDB1Connected: Boolean;
    FOnRelayConnected: TRelayConnectedEvent;
    procedure SetDB1Connected(const Value: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Function AdoRelay1Connected(aDataBaseType,aServerIP,aServerPort,aUserID,aUserPw,aDataBaseName:string):Boolean;
  public
    property DB1Connected :Boolean read FDB1Connected  write SetDB1Connected;
  public
    property OnRelayConnected:      TRelayConnectedEvent read FOnRelayConnected       write FOnRelayConnected;
  end;

var
  dmFingerDBRelay: TdmFingerDBRelay;

implementation
uses
  uCommonVariable;

var
  G_bFingerDBRelayUse : Boolean;
  G_bFingerRelayUse : Boolean;
  G_nFingerDBRelayTime : integer;
  G_nFingerRelayDBType : integer;
  G_nFingerReaderType : integer;
  G_stFingerDBIP : string;
  G_stFingerDBPort : string;
  G_stFingerDBUserID : string;
  G_stFingerDBUserPW : string;
  G_stFingerDBName : string;


{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmFingerDBRelay }

function TdmFingerDBRelay.AdoRelay1Connected(aDataBaseType, aServerIP,
  aServerPort, aUserID, aUserPw, aDataBaseName: string): Boolean;
var
  conStr : string;
begin
  result := False;
  DB1Connected := False;
  if aDataBaseType = '1' then    //MSSQL
  begin
    conStr := constr + 'Provider=SQLOLEDB.1;';
    conStr := constr + 'Password=' + aUserPw + ';';
    conStr := constr + 'Persist Security Info=True;';
    conStr := constr + 'User ID=' + aUserID + ';';
    conStr := constr + 'Initial Catalog=' + aDataBaseName + ';';
    conStr := constr + 'Data Source=' + aServerIP  + ',' + aServerPort;
  end else if aDataBaseType = '2' then  //PostGreSql
  begin
    conStr := 'Provider=PostgreSQL.1;';
    conStr := constr + 'Data Source=' + aServerIP + ',' + aServerPort + ';';
    conStr := constr + 'location=' + aDataBaseName + ';';
    conStr := constr + 'User Id='+ aUserID + ';';
    conStr := constr + 'password=' + aUserPw;
  end else if aDataBaseType = '3' then  //Oracle
  begin
    //conStr := 'Provider=OraOLEDB.Oracle;';
    //conStr := constr + 'Data Source=(DESCRIPTION=(CID=GTU_APP)(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=' + aServerIP + ')(PORT=' + aServerPort + ')))(CONNECT_DATA=(SID=' + aDataBaseName + ')(SERVER=DEDICATED)));';
    //conStr := 'Provider=OraOLEDB.Oracle;';
    //conStr := constr + 'Data Source=(DESCRIPTION=(CID=GTU_APP)(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=' + aServerIP + ')(PORT=' + aServerPort + ')))(CONNECT_DATA=(SERVICE_NAME=' + aDataBaseName + ')(SERVER=DEDICATED)));';
    //conStr := constr + 'User Id='+ aUserID + ';';
    //conStr := constr + 'Password=' + aUserPw + '';

    conStr := 'Provider=MSDAORA.1;';
    //conStr := 'Provider=OraOLEDB.Oracle;';
    conStr := constr + 'Password=' + aUserPw + ';';
    conStr := constr + 'User ID='+ aUserID + ';';
    conStr := constr + 'Data Source=' + aDataBaseName + ';';
    conStr := constr + 'Persist Security Info=False';
    //conStr := constr + 'Persist Security Info=True';  False
  end else if aDataBaseType = '0' then   //MDB
  begin
  {      //if DBName = '' then
    DBName := stExeFolder + '\..\DB\ZMOS.mdb';
    conStr := 'Provider=Microsoft.Jet.OLEDB.4.0;';
    conStr := conStr + 'Data Source=' + DBName + ';';
    conStr := conStr + 'Persist Security Info=True;';
    conStr := conStr + 'Jet OLEDB:Database ';
    //if stuserPW <> '' then  conStr := conStr + ' Password=' + stuserPW;  }
  end else
  begin
    //showmessage('DB Type 이 정확하지 않습니다.');
    Exit;
  end;

  with ADOConnection1 do
  begin
    Connected := False;
    ConnectionString := conStr;
    //ConnectionString := 'Provider=OraOLEDB.Oracle.1;Password=icon002;User ID=icon002;Data Source=OPPRA;Persist Security Info=True';
    LoginPrompt:= false ;
    Try
      Connected := True;
    Except
      on E : Exception do
        begin
          SQLErrorLog('DBError('+ E.Message + ')' + conStr );
          // ERROR MESSAGE-BOX DISPLAY
          //ShowMessage(E.Message );
          Exit;
        end;
      else
        begin
          //ShowMessage('데이터베이스 접속 에러' );
          Exit;
        end;
    End;
    CursorLocation := clUseServer;
  end;
  DB1Connected := True;
  result := True;
end;

procedure TdmFingerDBRelay.SetDB1Connected(const Value: Boolean);
begin
  if FDB1Connected = Value then Exit;
  FDB1Connected := Value;
  if Assigned(FOnRelayConnected) then
  begin
    OnRelayConnected(Self,1,Value);
  end;

end;

procedure TdmFingerDBRelay.SQLErrorLog(aSQL: string);
Var
  f: TextFile;
  st: string;
  aFileName: String;
begin
//  if SaveLogData < 1 then Exit;
  if Application.Terminated then Exit;
  {$I-}
  //Critical_SaveLog.Acquire;
  aFileName:= ExtractFileDir(Application.ExeName) + '\..\log\DBerr'+ FormatDateTIme('yyyymmdd',Now)+'.log';
  AssignFile(f, aFileName);
  Append(f);
  if IOResult <> 0 then Rewrite(f);
  st := FormatDateTIme('hh:nn:ss:zzz">"   ',Now) + #13#10 + aSQL;
  WriteLn(f,st);
  System.Close(f);
  //Critical_SaveLog.Release;
  {$I+}

end;

end.
