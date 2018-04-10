unit uCompanyCodeLoad;

interface
uses ADODB,StdCtrls,Classes,SysUtils,ActiveX;

procedure LoadBuildingCode(aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True);
procedure LoadCompanyCode(aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True);
procedure LoadFloorCode(aBuildingCode:string;aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True);
procedure LoadJijumCode(aCompanyCode:string;aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True);

implementation
uses
  uCommonVariable,
  uDataBase;

procedure LoadBuildingCode(aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True);
var
  stSql :string;
  TempAdoQuery : TADOQuery;
  nIndex : integer;
  stTemp : string;
begin
  cmb_Box.Clear;
  aStringList.Clear;

  stSql := ' select a.LO_NAME,a.LO_DONGCODE from TB_LOCATION a ';
  if G_nAdminBuildingGrade = 1 then
  begin
    stSql := stSql + ' Inner JOIN ( select * from TB_ADMIN where AD_USERID = ''' + G_stAdminUserID + ''') b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.LO_DONGCODE = b.LO_DONGCODE ) ';
  end;
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.LO_GUBUN = ''0''';
  stSql := stSql + ' Group by a.LO_NAME, a.LO_DONGCODE';
  stSql := stSql + ' Order by a.LO_NAME ';


  if aAll then
  begin
    cmb_Box.Items.Add('전체');
    aStringList.Add('');
    cmb_Box.ItemIndex := 0;
  end;

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

      if RecordCount < 1 then
      begin
        Exit;
      end;
      First;

      While Not Eof do
      begin
        stTemp := FindField('LO_DONGCODE').AsString + FindField('LO_NAME').AsString;
        cmb_Box.Items.Add(FindField('LO_NAME').AsString);
        aStringList.Add(FindField('LO_DONGCODE').AsString);
        Next;
      end;
      if RecordCount = 1 then
      begin
        cmb_Box.ItemIndex := 1;
      end else
      begin
        if G_nAdminBuildingGrade > 1 then
        begin
          nIndex := aStringList.IndexOf(G_stAdminBuildingCode);
          if nIndex > 0 then cmb_Box.ItemIndex := nIndex;
          cmb_Box.Enabled := False;
        end else
        if cmb_Box.Items.Count > 0 then
           cmb_Box.ItemIndex := 0;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure LoadCompanyCode(aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True);
var
  stSql :string;
  TempAdoQuery : TADOQuery;
  nIndex : integer;
  stTemp : string;
begin
  cmb_Box.Clear;
  aStringList.Clear;

  stSql := ' select a.CO_NAME,a.CO_COMPANYCODE from TB_COMPANY a ';
  if G_nAdminCompanyGrade = 1 then
  begin
    stSql := stSql + ' Inner JOIN TB_ADMINCOMPANY b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
    stSql := stSql + ' AND a.CO_GUBUN = b.CO_GUBUN ) ';
  end;
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.CO_GUBUN = ''1''';
  stSql := stSql + ' Group by a.CO_NAME, a.CO_COMPANYCODE';
  stSql := stSql + ' Order by a.CO_NAME ';


  if aAll then   //잘못하면 CompanyCodeList 의 인덱스와 맞지 않을 수 있다
  begin
    cmb_Box.Items.Add('전체');
    aStringList.Add('');
    cmb_Box.ItemIndex := 0;
  end;

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

      if RecordCount < 1 then
      begin
        Exit;
      end;
      First;

      While Not Eof do
      begin
        stTemp := FindField('CO_COMPANYCODE').AsString + FindField('CO_NAME').AsString;
        cmb_Box.Items.Add(FindField('CO_NAME').AsString);
        aStringList.Add(FindField('CO_COMPANYCODE').AsString);
        Next;
      end;
      if RecordCount = 1 then
      begin
        cmb_Box.ItemIndex := 1;
      end else
      begin
        if G_nAdminCompanyGrade > 1 then
        begin
          nIndex := aStringList.IndexOf(G_stAdminCompanyCode);
          if nIndex > 0 then cmb_Box.ItemIndex := nIndex;
          cmb_Box.Enabled := False;
        end else
        if cmb_Box.Items.Count > 0 then
           cmb_Box.ItemIndex := 0;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure LoadFloorCode(aBuildingCode:string;aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True);
var
  stSql :string;
  TempAdoQuery : TADOQuery;
  i : integer;
  nIndex : integer;
begin
  cmb_Box.Clear;
  aStringList.Clear;
  if aAll then
  begin
    cmb_Box.Items.Add('전체');
    aStringList.Add('');
    cmb_Box.ItemIndex := 0;
  end;

  stSql := ' select a.LO_NAME,a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE from TB_LOCATION a ';
  if G_nAdminBuildingGrade = 2 then
  begin
    stSql := stSql + ' Inner JOIN ( select * from TB_ADMIN where AD_USERID = ''' + G_stAdminUserID + ''') b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.LO_DONGCODE = b.LO_DONGCODE  ';
    stSql := stSql + ' AND a.LO_FLOORCODE = b.LO_FLOORCODE )  ';
  end;
  stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND a.LO_GUBUN = ''1''';
  if G_bIsMaster or ( G_nAdminBuildingGrade < 2) then
  begin
    if (aBuildingCode = '') then Exit;
  end;
  if (aBuildingCode <> '') then
     stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
  stSql := stSql + ' Order by a.LO_NAME ';

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

      if RecordCount < 1 then
      begin
        Exit;
      end;

      First;

      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('LO_NAME').AsString);
        aStringList.Add(FindField('LO_DONGCODE').AsString + FindField('LO_FLOORCODE').AsString);
        Next;
      end;

      if RecordCount = 1 then
      begin
        cmb_Box.ItemIndex := 1;
      end else
      begin
        if G_nAdminBuildingGrade > 2 then
        begin
          nIndex := aStringList.IndexOf(G_stAdminBuildingCode + G_stAdminFloorCode);
          if nIndex > 0 then cmb_Box.ItemIndex := nIndex;
          cmb_Box.Enabled := False;
        end;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure LoadJijumCode(aCompanyCode:string;aStringList:TStringList;cmb_Box:TComboBox;aAll:Boolean=True);
var
  stSql :string;
  TempAdoQuery : TADOQuery;
  i : integer;
  nIndex : integer;
begin
  cmb_Box.Clear;
  aStringList.Clear;
  if aAll then
  begin
    cmb_Box.Items.Add('전체');
    aStringList.Add('');
    cmb_Box.ItemIndex := 0;
  end;

  if G_nAdminCompanyGrade = 2 then
  begin
    stSql := ' select a.CO_NAME,a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE from TB_COMPANY a ';
    stSql := stSql + ' Inner JOIN TB_ADMINCOMPANY b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
    stSql := stSql + ' AND a.CO_JIJUMCODE = b.CO_JIJUMCODE ';
    stSql := stSql + ' AND a.CO_DEPARTCODE = b.CO_DEPARTCODE ';
    stSql := stSql + ' AND a.CO_GUBUN = b.CO_GUBUN ) ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND a.CO_GUBUN = ''2''';
    stSql := stSql + ' AND b.AD_USERID = ''' + G_stAdminUserID + '''';
  end else
  begin
    stSql := ' select a.CO_NAME,a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE from TB_COMPANY a ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND a.CO_GUBUN = ''2''';
    if G_bIsMaster or ( G_nAdminCompanyGrade < 2) then
    begin
      if (aCompanyCode = '') then Exit;
    end;
    if (aCompanyCode <> '') then
        stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  end;

  stSql := stSql + ' Order by a.CO_NAME ';

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

      if RecordCount < 1 then
      begin
        Exit;
      end;

      First;

      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('CO_NAME').AsString);
        aStringList.Add(FindField('CO_COMPANYCODE').AsString + FindField('CO_JIJUMCODE').AsString);
        Next;
      end;

      if RecordCount = 1 then
      begin
        cmb_Box.ItemIndex := 1;
      end else
      begin
        if G_nAdminCompanyGrade > 2 then
        begin
          nIndex := aStringList.IndexOf(G_stAdminCompanyCode + G_stAdminJijumCode);
          if nIndex > 0 then cmb_Box.ItemIndex := nIndex;
          cmb_Box.Enabled := False;
        end;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;
end.
