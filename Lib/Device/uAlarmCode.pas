unit uAlarmCode;

interface

uses
  System.SysUtils, System.Classes,Winapi.ActiveX,Data.Win.ADODB,DB;

type
  TdmAlarmCode = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
    function  GetModeChangeAlarmStatusCode(aAN_CODE:string;var aAlarmStateCode,aDisAlarmStateCode:string):Boolean;
    procedure LoadAlarmModeNotCard(var aStringList:TStringList);
    procedure LoadAlarmEventSoundStatusCodeLoad(var aStringList,aStringColorList:TStringList); //�˶��߻� �ڵ� �ε�
    procedure LoadAlarmEventViewStatusCodeLoad(var aStringList:TStringList); //�˶��߻� �ڵ� �ε�
    procedure LoadZoneDetectList(var aStringList:TStringList);
  end;

  TAlarmStatusCode = Class(TComponent)
  private
    FALARMSTATUSCODE: string;
    FALARMDATA: string;
    FDISALARMSTATUSCODE: string;
    procedure SetALARMDATA(const Value: string);
    procedure SetALARMSTATUSCODE(const Value: string);
    procedure SetDISALARMSTATUSCODE(const Value: string);
    { Private declarations }
  public
    { Public declarations }
  published
    Property ALARMDATA:string Read FALARMDATA write SetALARMDATA;
    Property ALARMSTATUSCODE:string Read FALARMSTATUSCODE write SetALARMSTATUSCODE;
    Property DISALARMSTATUSCODE:string Read FDISALARMSTATUSCODE write SetDISALARMSTATUSCODE;
  end;

var
  dmAlarmCode: TdmAlarmCode;


implementation
uses
  uDataBase;

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TAlarmStatusCode }

procedure TAlarmStatusCode.SetALARMDATA(const Value: string);
begin
  FALARMDATA := Value;
end;

procedure TAlarmStatusCode.SetALARMSTATUSCODE(const Value: string);
begin
  FALARMSTATUSCODE := Value;
end;

procedure TAlarmStatusCode.SetDISALARMSTATUSCODE(const Value: string);
begin
  FDISALARMSTATUSCODE := Value;
end;

{ TdmAlarmCode }

function TdmAlarmCode.GetModeChangeAlarmStatusCode(aAN_CODE: string;
  var aAlarmStateCode, aDisAlarmStateCode: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;
  aAlarmStateCode := '';
  aDisAlarmStateCode := '';

  stSql := ' SELECT * from TB_NOTCARDALARMCODE ';
  stSql := stSql + ' where AN_CODE = ''' + aAN_CODE + ''' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      //SQL.Clear;
      SQL.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      While Not Eof do
      begin
        if Trim(FindField('AN_MODE').AsString) = 'a' then aAlarmStateCode := FindField('AL_STATUSCODE2').AsString
        else if Trim(FindField('AN_MODE').AsString) = 'd' then aDisAlarmStateCode := FindField('AL_STATUSCODE2').AsString;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := True;
end;

procedure TdmAlarmCode.LoadAlarmEventSoundStatusCodeLoad(
  var aStringList,aStringColorList: TStringList);
var
  stSql : string;
  TempAdoQuery :TADOQuery;

begin
  aStringList.Clear;
  aStringColorList.Clear;

  stSql := ' Select * from TB_ALARMSTATUSCODE ';
  stSql := stSql + ' Where AL_ALARMSOUND = 1 ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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

      While Not Eof do
      begin
        aStringList.Add(FindField('AL_ALARMSTATUSCODE').AsString);
        aStringColorList.Add(inttostr(FindField('AL_COLOR').AsInteger));
        Next;
      end;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TdmAlarmCode.LoadAlarmEventViewStatusCodeLoad(
  var aStringList: TStringList);
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  aStringList.Clear;
  stSql := ' Select * from TB_ALARMSTATUSCODE ';
  stSql := stSql + ' Where AL_ALARMVIEW = 1 ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
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

      While Not Eof do
      begin
        aStringList.Add(FindField('AL_ALARMSTATUSCODE').AsString);
        Next;
      end;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TdmAlarmCode.LoadAlarmModeNotCard(var aStringList: TStringList);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  AlarmStatusCode : TAlarmStatusCode;
  stAlarmStateCode : string;
  stDisAlarmStateCode : string;
begin
  aStringList.Clear;

  stSql := ' SELECT * from TB_ALARMMODENOTCARD ';
  stSql := stSql + ' order by AN_CODE ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      //SQL.Clear;
      SQL.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      While Not Eof do
      begin
        AlarmStatusCode:= TAlarmStatusCode.Create(Self);
        AlarmStatusCode.ALARMDATA := FindField('AN_NOTDATA').AsString;
        GetModeChangeAlarmStatusCode(FindField('AN_CODE').AsString,stAlarmStateCode,stDisAlarmStateCode);
        AlarmStatusCode.ALARMSTATUSCODE := stAlarmStateCode;
        AlarmStatusCode.DISALARMSTATUSCODE := stDisAlarmStateCode;
        aStringList.AddObject(FindField('AN_NOTDATA').AsString,AlarmStatusCode);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TdmAlarmCode.LoadZoneDetectList(var aStringList: TStringList);
begin
  aStringList.Clear;
  aStringList.Add('FI'); //ȭ��˶�
//  aStringList.Add('F1'); //ȭ��˶�
  aStringList.Add('E1'); //���˶�
  aStringList.Add('G1'); //�����˶�
  aStringList.Add('Q1'); //����˶�

end;

end.
