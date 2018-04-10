unit uFormFunction;

interface

uses
  System.SysUtils, System.Classes,AdvGrid,Vcl.StdCtrls,Vcl.ExtCtrls,
  ADODB,ActiveX,AdvCombo;

type
  TdmFormFunction = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }

    function GetAccessControlTypeName(aACCESSCONTROLTYPE:string):string;
    function GetAlarmDeviceTypeName(aAlarmDeviceType:string):string;
    function GetAlarmModeName(aAlarmMode:string):string;
    function GetCardToEmployeeInfo(aCardNo:string;var aEmSeq,aEmName,aCompanyName,aEmCode,aPosiName:string):Boolean;
    function GetFormName(aFormGroup,aMenuGubun,aNameCode:string):string;
    function GetFormMessage(aMessageCode:string):string;
    Procedure GridInitialize(sg_Grid:TAdvStringGrid;aRow:integer = 2;bCheckBox:Boolean=False);
    procedure GridInit(sg:TAdvStringGrid;aCol:integer;aRow:integer = 2;bCheckBox:Boolean=False;aFixedRow:integer=1);
    Procedure RowGridInitialize(sg_Grid:TAdvStringGrid;aRow:integer = 2;bCheckBox:Boolean=False); //모두 지움 쓰레기 데이터 남을수 없도록
    //*************************
    //Group Box 내에서 컴포넌트 찾는 함수
    //*************************
    Function TravelGroupAdvComboBoxItem(GroupBox:TGroupBox;stName:string; no:Integer):TAdvComboBox;
    Function TravelCheckBoxTagItem(GroupBox:TGroupBox;aTag:Integer):TCheckBox;
    Function TravelGroupCheckBoxItem(GroupBox:TGroupBox;stName:string; no:Integer):TCheckBox;
    Function TravelGroupComboBoxItem(GroupBox:TGroupBox;stName:string; no:Integer):TComboBox;
    Function TravelGroupEditItem(GroupBox:TGroupBox;stName:string; no:Integer):TEdit;
    Function TravelGroupLabelItem(GroupBox:TGroupBox;stName:string; no:Integer):TLabel;
    //*************************
    //Panel 내에서 컴포넌트 찾는 함수
    //*************************
    Function TravelPanelEditItem(Panel:TPanel;stName:string; no:Integer):TEdit;
    Function TravelPanelLabelItem(Panel:TPanel;stName:string; no:Integer):TLabel;
  end;

var
  dmFormFunction: TdmFormFunction;

implementation
uses
  uCommonVariable,
  uDataBase,
  uFormVariable;

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TdmFormFunction }

function TdmFormFunction.GetAccessControlTypeName(
  aACCESSCONTROLTYPE: string): string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := '';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;

    stSql := 'select AE_CONTROLTYPECODENAME' + inttostr(G_nFormLanguageType) + ' as AE_CONTROLTYPECODENAME from TB_ACCESSCONTROLTYPE ';
    stSql := stSql + ' where GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND AE_CONTROLTYPECODE = ''' + aACCESSCONTROLTYPE + ''' ';  //BMS 출입모니터링에서

    with TempAdoQuery do
    begin
      Close;
      //Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then Exit;

      result := FindField('AE_CONTROLTYPECODENAME').AsString;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmFormFunction.GetAlarmDeviceTypeName(
  aAlarmDeviceType: string): string;
var
  stSql : string;
  nIndex : integer;
  TempAdoQuery : TADOQuery;
  oAlarmDeviceType : TAlarmDeviceType;
begin
  result := aAlarmDeviceType;
  nIndex := AlarmDeviceTypeCodeList.IndexOf(aAlarmDeviceType);
  if nIndex > -1 then
  begin
    result := TAlarmDeviceType(AlarmDeviceTypeCodeList.Objects[nIndex]).AlarmDeviceTypeName;
    Exit;
  end;
  stSql := ' Select * from TB_ALARMDEVICETYPE ' ;
  stSql := stSql + ' Where AL_ALARMDEVICETYPE = ''' + aAlarmDeviceType + ''' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then Exit;

      oAlarmDeviceType := TAlarmDeviceType.Create(nil);
      oAlarmDeviceType.AlarmDeviceTypeCode := aAlarmDeviceType;
      oAlarmDeviceType.AlarmDeviceTypeName := FindField('AL_ALARMDEVICETYPENAME').AsString;
      AlarmDeviceTypeCodeList.AddObject(aAlarmDeviceType,oAlarmDeviceType);
      result := FindField('AL_ALARMDEVICETYPENAME').AsString;
    end;

  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TdmFormFunction.GetAlarmModeName(aAlarmMode: string): string;
var
  stSql : string;
  nIndex : integer;
  TempAdoQuery : TADOQuery;
  oAlarmMode : TAlarmMode;
begin
  result := aAlarmMode;
  nIndex := AlarmModeCodeList.IndexOf(aAlarmMode);
  if nIndex > -1 then
  begin
    result := TAlarmMode(AlarmModeCodeList.Objects[nIndex]).AlarmModeName;
    Exit;
  end;
  stSql := ' Select AM_ARMMODENAME' + inttostr(G_nFormLanguageType) + ' as NAME from TB_ALARMMODECODE ' ;
  stSql := stSql + ' Where AM_ARMMODECODE = ''' + aAlarmMode + ''' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then Exit;

      oAlarmMode := TAlarmMode.Create(nil);
      oAlarmMode.AlarmModeCode := aAlarmMode;
      oAlarmMode.AlarmModeName := FindField('NAME').AsString;
      AlarmModeCodeList.AddObject(aAlarmMode,oAlarmMode);
      result := FindField('NAME').AsString;
    end;

  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TdmFormFunction.GetCardToEmployeeInfo(aCardNo: string; var aEmSeq,
  aEmName, aCompanyName, aEmCode, aPosiName: string): Boolean;
var
  stSql : string;
  nIndex : integer;
  TempAdoQuery : TADOQuery;
  oCard : TCardNo;
begin
  result := False;
  nIndex := CardList.IndexOf(aCardNo);
  if nIndex > -1 then
  begin
    result := True;
    aEmSeq := inttostr(TCARDNO(CardList.Objects[nIndex]).EMSEQ);
    aEmName := TCARDNO(CardList.Objects[nIndex]).EMNAME;
    aCompanyName := TCARDNO(CardList.Objects[nIndex]).COMPANYNAME;
    aEmCode := TCARDNO(CardList.Objects[nIndex]).EMCODE;
    aPosiName := TCARDNO(CardList.Objects[nIndex]).POSINAME;
    Exit;
  end;
  stSql := ' Select a.EM_SEQ,b.EM_CODE,b.EM_NAME,b.CO_COMPANYCODE,c.CO_COMPANYNAME,b.PO_POSICODE,d.PO_POSICODENAME  from TB_CARD a ' ;
  stSql := stSql + ' Left Join TB_EMPLOYEE b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.EM_SEQ = b.EM_SEQ) ';
  stSql := stSql + ' Left Join TB_COMPANYCODE c ';
  stSql := stSql + ' ON(b.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = c.CO_COMPANYCODE )';
  stSql := stSql + ' Left Join TB_POSICODE d ';
  stSql := stSql + ' ON(b.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND b.PO_POSICODE = d.PO_POSICODE ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.CA_CARDNO = ''' + aCardNo + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then Exit;

      oCard := TCardNo.Create(nil);
      oCard.CARDNO := aCardNo;
      oCard.EMSEQ := FindField('EM_SEQ').AsInteger;
      oCard.EMCODE := FindField('EM_CODE').AsString;
      oCard.EMNAME := FindField('EM_NAME').AsString;
      oCard.COMPANYCODE := FindField('CO_COMPANYCODE').AsString;
      oCard.COMPANYNAME := FindField('CO_COMPANYNAME').AsString;
      oCard.POSICODE := FindField('PO_POSICODE').AsString;
      oCard.POSINAME := FindField('PO_POSICODENAME').AsString;
      CardList.AddObject(aCardNo,oCard);
      aEmSeq := FindField('EM_SEQ').AsString;
      aEmName := FindField('EM_NAME').AsString;
      aCompanyName := FindField('CO_COMPANYNAME').AsString;
      aEmCode := FindField('PO_POSICODENAME').AsString;
      aPosiName := FindField('PO_POSICODENAME').AsString;

      result := True;
    end;

  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmFormFunction.GetFormMessage(aMessageCode: string): string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := '';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;

    stSql := 'select FM_MESSAGENAME' + inttostr(G_nFormLanguageType) + ' as FORMMESSAGE from TB_FORMMESSAGE ';
    stSql := stSql + ' where GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND FM_MESSAGECODE = ''' + aMessageCode + ''' ';  //BMS 출입모니터링에서

    with TempAdoQuery do
    begin
      Close;
      //Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then Exit;

      result := FindField('FORMMESSAGE').AsString;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmFormFunction.GetFormName(aFormGroup, aMenuGubun,
  aNameCode: string): string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  if G_nFormLanguageType = 0 then G_nFormLanguageType := 1;

  result := '';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;

    stSql := 'select FN_NAMECODE,FN_NAME' + inttostr(G_nFormLanguageType) + ' as FORMNAME from TB_FORMNAME ';
    stSql := stSql + ' where GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND FN_PROGRAMGUBUN = ''' + aFormGroup + ''' ';  //BMS 출입모니터링에서
    stSql := stSql + ' AND FN_MENUGUBUN = ''' + aMenuGubun + ''' ';     //메뉴디렉토리
    stSql := stSql + ' AND FN_NAMECODE = ''' + aNameCode + ''' ';     //

    with TempAdoQuery do
    begin
      Close;
      //Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then Exit;

      result := FindField('FORMNAME').AsString;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TdmFormFunction.GridInit(sg: TAdvStringGrid; aCol, aRow: integer;
  bCheckBox: Boolean; aFixedRow: integer);
var
  i:integer;
begin
  with sg do
  begin
    if bCheckBox then
    begin
      RemoveCheckBox(0,0);
      RemoveCheckBox(0,1);

      AddCheckBox(0,0,False,False);
    end;
    RowCount := aRow;
    for i:= 0 to ColCount - 1 do
    begin
      Cells[i,aFixedRow] := '';
    end;

    for i := aCol to ColCount - 1 do
    begin
      ColWidths[i] := 0;
    end;
  end;
end;

procedure TdmFormFunction.GridInitialize(sg_Grid: TAdvStringGrid; aRow: integer;
  bCheckBox: Boolean);
var
  i:integer;
begin
  with sg_Grid do
  begin
    if bCheckBox then
    begin
      RemoveCheckBox(0,0);
      RemoveCheckBox(0,1);

      AddCheckBox(0,0,False,False);
    end;
    rowCount := aRow;
    for i:=0 to ColCount - 1 do
    begin
      Cells[i,1] := '';
    end;
  end;
end;

procedure TdmFormFunction.RowGridInitialize(sg_Grid: TAdvStringGrid;
  aRow: integer; bCheckBox: Boolean);
var
  i,j:integer;
begin
  with sg_Grid do
  begin
    if bCheckBox then
    begin
      RemoveCheckBox(0,0);
      RemoveCheckBox(0,1);

      AddCheckBox(0,0,False,False);
    end;
    for i:= 0 to ColCount - 1 do
    begin
      for j:= aRow - 1 to RowCount -1 do
      begin
        Cells[i,j] := '';
      end;
    end;
    rowCount := aRow;
  end;
end;

function TdmFormFunction.TravelCheckBoxTagItem(GroupBox: TGroupBox;
  aTag: Integer): TCheckBox;
var
Loop:integer;
begin
  Result:= Nil;

  For Loop:=0 to GroupBox.ControlCount-1 do
  Begin
    If GroupBox.Controls[Loop].Tag = aTag then
    Begin
      Result:=TCheckBox(GroupBox.Controls[Loop]);
      exit;
    End;
  End;
end;

function TdmFormFunction.TravelGroupAdvComboBoxItem(GroupBox: TGroupBox;
  stName: string; no: Integer): TAdvComboBox;
var
  Loop:integer;
begin
  Result:= Nil;

  For Loop:=0 to GroupBox.ControlCount-1 do
  Begin
    If LowerCase(GroupBox.Controls[Loop].name) = LowerCase(stName) + inttostr(no) then
    Begin
      Result:=TAdvComboBox(GroupBox.Controls[Loop]);
      exit;
    End;
  End;
end;

function TdmFormFunction.TravelGroupCheckBoxItem(GroupBox: TGroupBox;
  stName: string; no: Integer): TCheckBox;
var
Loop:integer;
begin
  Result:= Nil;

  For Loop:=0 to GroupBox.ControlCount-1 do
  Begin
    If LowerCase(GroupBox.Controls[Loop].name) = LowerCase(stName) + inttostr(no) then
    Begin
      Result:=TCheckBox(GroupBox.Controls[Loop]);
      exit;
    End;
  End;
end;

function TdmFormFunction.TravelGroupComboBoxItem(GroupBox: TGroupBox;
  stName: string; no: Integer): TComboBox;
var
  Loop:integer;
begin
  Result:= Nil;

  For Loop:=0 to GroupBox.ControlCount-1 do
  Begin
    If LowerCase(GroupBox.Controls[Loop].name) = LowerCase(stName) + inttostr(no) then
    Begin
      Result:=TComboBox(GroupBox.Controls[Loop]);
      exit;
    End;
  End;
end;

function TdmFormFunction.TravelGroupEditItem(GroupBox: TGroupBox;
  stName: string; no: Integer): TEdit;
var
Loop:integer;
begin
  Result:= Nil;

  For Loop:=0 to GroupBox.ControlCount-1 do
  Begin
    If LowerCase(GroupBox.Controls[Loop].name) = LowerCase(stName) + inttostr(no) then
    Begin
      Result:=TEdit(GroupBox.Controls[Loop]);
      exit;
    End;
  End;
end;

function TdmFormFunction.TravelGroupLabelItem(GroupBox: TGroupBox;
  stName: string; no: Integer): TLabel;
var
Loop:integer;
begin
  Result:= Nil;

  For Loop:=0 to GroupBox.ControlCount-1 do
  Begin
    If LowerCase(GroupBox.Controls[Loop].name) = LowerCase(stName) + inttostr(no) then
    Begin
      Result:=TLabel(GroupBox.Controls[Loop]);
      exit;
    End;
  End;
end;

function TdmFormFunction.TravelPanelEditItem(Panel: TPanel; stName: string;
  no: Integer): TEdit;
var
Loop:integer;
begin
  Result:= Nil;

  For Loop:=0 to Panel.ControlCount-1 do
  Begin
    If LowerCase(Panel.Controls[Loop].name) = LowerCase(stName) + inttostr(no) then
    Begin
      Result:=TEdit(Panel.Controls[Loop]);
      exit;
    End;
  End;

end;

function TdmFormFunction.TravelPanelLabelItem(Panel: TPanel; stName: string;
  no: Integer): TLabel;
var
Loop:integer;
begin
  Result:= Nil;

  For Loop:=0 to Panel.ControlCount-1 do
  Begin
    If LowerCase(Panel.Controls[Loop].name) = LowerCase(stName) + inttostr(no) then
    Begin
      Result:=TLabel(Panel.Controls[Loop]);
      exit;
    End;
  End;

end;

end.
