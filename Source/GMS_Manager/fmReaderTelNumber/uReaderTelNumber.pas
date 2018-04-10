﻿unit uReaderTelNumber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uSubForm, AdvOfficeTabSet,
  AdvOfficeTabSetStylers, CommandArray, Vcl.Grids, AdvObj, BaseGrid, AdvGrid,
  Vcl.StdCtrls, AdvEdit, Vcl.Buttons, AdvSmoothLabel, AdvSmoothPanel, W7Classes,
  W7Panels, AdvGlassButton,ADODB,ActiveX, frmshape, Vcl.Mask, AdvSpin,
  DBAdvSmoothLabel, AdvSmoothProgressBar, Vcl.ExtCtrls, AdvCombo, AdvGlowButton,
  AdvOfficePager, Vcl.Imaging.pngimage, Vcl.Menus, AdvOfficePagerStylers,
  AdvAppStyler, Vcl.ComCtrls, AdvEdBtn, Vcl.ImgList;

const
  con_LocalCompanyImageIndex = 0;
  con_LocalEmployeeImageIndex = 1;
  con_LocalBuildingImageIndex = 2;

type
  TfmRederTelNumber = class(TfmASubForm)
    BodyPanel: TAdvSmoothPanel;
    ed_SearchName: TAdvEdit;
    sg_List: TAdvStringGrid;
    btn_Search: TAdvGlassButton;
    Add: TAdvSmoothPanel;
    lb_1: TAdvSmoothLabel;
    ed_1: TAdvEdit;
    lb_2: TAdvSmoothLabel;
    ed_2: TAdvEdit;
    ed_NodeNo: TAdvEdit;
    TimerProgress: TTimer;
    AdvOfficePager1: TAdvOfficePager;
    AdvOfficePage1: TAdvOfficePage;
    btn_minimize: TAdvGlowButton;
    btn_Close: TAdvGlowButton;
    lb_List: TLabel;
    btn_Add: TAdvGlowButton;
    pm_Work: TPopupMenu;
    pm_CodeAdd: TMenuItem;
    pm_UpdateCode: TMenuItem;
    pm_DeleteCode: TMenuItem;
    lb_WorkType: TLabel;
    btn_Save: TAdvGlowButton;
    btn_Cancel: TAdvGlowButton;
    AdvFormStyler1: TAdvFormStyler;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    lb_5: TAdvSmoothLabel;
    eb_BuildingName: TAdvEditBtn;
    lb_BuildingName: TAdvSmoothLabel;
    AdvSmoothLabel3: TAdvSmoothLabel;
    tv_buildingName: TTreeView;
    tv_buildingCode: TTreeView;
    MenuImageList16: TImageList;
    ed_BuildingCode: TAdvEdit;
    lb_3: TAdvSmoothLabel;
    ed_3: TAdvEdit;
    lb_4: TAdvSmoothLabel;
    ed_4: TAdvEdit;
    lb_6: TAdvSmoothLabel;
    ed_6: TAdvEdit;
    lb_7: TAdvSmoothLabel;
    lb_8: TAdvSmoothLabel;
    ed_5: TAdvEdit;
    ed_7: TAdvEdit;
    ed_8: TAdvEdit;
    lb_Name: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_AddClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sg_ListCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure sg_ListDblClick(Sender: TObject);
    procedure ed_SearchNameChange(Sender: TObject);
    procedure CommandArrayCommandsTGRADEREFRESHExecute(Command: TCommand;
      Params: TStringList);
    procedure CommandArrayCommandsTMENUIDExecute(Command: TCommand;
      Params: TStringList);
    procedure ed_1KeyPress(Sender: TObject; var Key: Char);
    procedure CommandArrayCommandsTFORMNAMEExecute(Command: TCommand;
      Params: TStringList);
    procedure pm_CodeAddClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure pm_UpdateCodeClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_minimizeClick(Sender: TObject);
    procedure tv_buildingNameDblClick(Sender: TObject);
    procedure eb_BuildingNameClickBtn(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure ed_SearchNameKeyPress(Sender: TObject; var Key: Char);
  private
    L_nPageListMaxCount : integer;
    L_nCheckCount : integer;
    L_nProgress : integer;
    L_stMenuID : string;
    L_stButtonCloseCaption : string;
    L_stButtonPreCaption : string;
    L_stNodeAddCaption : string;
    L_stNodeUpdateCaption : string;
    L_stWork : string;
    L_bNodeChange : Boolean;
    FireGroupCodeList : TStringList;
    NodeDeviceTypeCodeList : TStringList;
    ServerNoList : TStringList;
    { Private declarations }
    Function FormNameSetting:Boolean;
    Function GetTelNumber(aNodeNo:string):Boolean;
    Function SearchList(aCurrentCode:string;aTopRow:integer = 0):Boolean;
  private
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);
    procedure AddTelNumber;
    procedure UpdateTelNumber;
  public
    { Public declarations }
    procedure FormChangeEvent(aFormName:integer);
    procedure FormGradeRefresh;
    procedure FormIDSetting(aID:string);
  end;

var
  fmRederTelNumber: TfmRederTelNumber;

implementation
uses
  uCommonFunction,
  uCommonVariable,
  uDataBase,
  uDBDelete,
  uDBFormMessage,
  uDBFunction,
  uDBInsert,
  uDBUpdate,
  uDBSelect,
  uFormFunction,
  uFormVariable,
  uComboBoxCodeLoad,
  uFireGroup,
  uMain;
{$R *.dfm}


procedure TfmRederTelNumber.AddTelNumber;
var
  i : integer;
  bChkState : Boolean;
begin
  With sg_List do
  begin
    for i := 1 to RowCount - 1 do
    begin
      GetCheckBoxState(0,i, bChkState);
      if bChkState then
      begin
        dmDBUPdate.UpdateTB_READER_Field_StringValue(cells[5,i],'00','0','1','RE_CARDREADERTEL1',ed_1.Text);
        dmDBUPdate.UpdateTB_READER_Field_StringValue(cells[5,i],'00','0','1','RE_CARDREADERTEL2',ed_2.Text);
        dmDBUPdate.UpdateTB_READER_Field_StringValue(cells[5,i],'00','0','1','RE_CARDREADERTEL3',ed_3.Text);
        dmDBUPdate.UpdateTB_READER_Field_StringValue(cells[5,i],'00','0','1','RE_CARDREADERTEL4',ed_4.Text);
        dmDBUPdate.UpdateTB_READER_Field_StringValue(cells[5,i],'00','0','1','RE_CARDREADERTEL5',ed_5.Text);
        dmDBUPdate.UpdateTB_READER_Field_StringValue(cells[5,i],'00','0','1','RE_CARDREADERTEL6',ed_6.Text);
        dmDBUPdate.UpdateTB_READER_Field_StringValue(cells[5,i],'00','0','1','RE_CARDREADERTEL7',ed_7.Text);
        dmDBUPdate.UpdateTB_READER_Field_StringValue(cells[5,i],'00','0','1','RE_CARDREADERTEL8',ed_8.Text);
        dmDBUPdate.UpdateTB_READERRCV_Field_StringValue(cells[5,i],'00','0','1','RE_CARDREADERTEL1','C');
        dmDBUPdate.UpdateTB_READERRCV_Field_StringValue(cells[5,i],'00','0','1','RE_CARDREADERTEL2','C');
        dmDBUPdate.UpdateTB_READERRCV_Field_StringValue(cells[5,i],'00','0','1','RE_CARDREADERTEL3','C');
        dmDBUPdate.UpdateTB_READERRCV_Field_StringValue(cells[5,i],'00','0','1','RE_CARDREADERTEL4','C');
        dmDBUPdate.UpdateTB_READERRCV_Field_StringValue(cells[5,i],'00','0','1','RE_CARDREADERTEL5','C');
        dmDBUPdate.UpdateTB_READERRCV_Field_StringValue(cells[5,i],'00','0','1','RE_CARDREADERTEL6','C');
        dmDBUPdate.UpdateTB_READERRCV_Field_StringValue(cells[5,i],'00','0','1','RE_CARDREADERTEL7','C');
        dmDBUPdate.UpdateTB_READERRCV_Field_StringValue(cells[5,i],'00','0','1','RE_CARDREADERTEL8','C');
        Application.ProcessMessages;
      end;
    end;
  end;
end;

procedure TfmRederTelNumber.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;
end;

procedure TfmRederTelNumber.btn_AddClick(Sender: TObject);
begin
  inherited;
  pm_CodeAddClick(pm_CodeAdd);
end;

procedure TfmRederTelNumber.btn_CancelClick(Sender: TObject);
begin
  inherited;
  Add.Visible := False;
end;

procedure TfmRederTelNumber.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmRederTelNumber.btn_minimizeClick(Sender: TObject);
begin
  inherited;
  windowState := wsNormal;
end;

procedure TfmRederTelNumber.btn_SaveClick(Sender: TObject);
begin
  inherited;
  if L_stWork = 'ADD' then AddTelNumber
  else if L_stWork = 'UPDATE' then UpdateTelNumber;
  Add.Visible := False;
end;

procedure TfmRederTelNumber.btn_SearchClick(Sender: TObject);
begin
  inherited;
  SearchList('');
end;

procedure TfmRederTelNumber.btn_UpdateClick(Sender: TObject);
begin
  inherited;
  sg_ListDblClick(sg_List);
end;

procedure TfmRederTelNumber.CommandArrayCommandsTFORMNAMEExecute(Command: TCommand;
  Params: TStringList);
begin
  inherited;
  Caption := Params.Values['CAPTION'];

end;

procedure TfmRederTelNumber.CommandArrayCommandsTGRADEREFRESHExecute(
  Command: TCommand; Params: TStringList);
begin
  inherited;
(*  btn_Add.Enabled := IsInsertGrade;
  pm_CodeAdd.Enabled := IsInsertGrade;
  btn_Delete.Enabled := IsDeleteGrade;
  pm_DeleteCode.Enabled := IsDeleteGrade;
  btn_Update.Enabled
*)
end;

procedure TfmRederTelNumber.CommandArrayCommandsTMENUIDExecute(Command: TCommand;
  Params: TStringList);
begin
  inherited;
  L_stMenuID := Params.Values['ID'];
end;

procedure TfmRederTelNumber.eb_BuildingNameClickBtn(Sender: TObject);
begin
  inherited;
  tv_buildingName.Visible := Not tv_buildingName.Visible;
  tv_buildingName.Top := eb_BuildingName.Top + eb_BuildingName.Height;
  tv_buildingName.Left := eb_BuildingName.Left;

end;

procedure TfmRederTelNumber.ed_1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = Char(VK_RETURN) then
      Perform(WM_NEXTDLGCTL,0,0);

end;

procedure TfmRederTelNumber.ed_SearchNameChange(Sender: TObject);
begin
  inherited;
  SearchList('');
end;

procedure TfmRederTelNumber.ed_SearchNameKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    Key := #0;
    SearchList('');
  end;

end;

procedure TfmRederTelNumber.FormChangeEvent(aFormName: integer);
begin
//  case aFormName of
//  end;
end;

procedure TfmRederTelNumber.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  NodeDeviceTypeCodeList.Free;
  FireGroupCodeList.Free;
  ServerNoList.Free;

  Action := caFree;
end;

procedure TfmRederTelNumber.FormCreate(Sender: TObject);
begin
  inherited;
  FireGroupCodeList := TStringList.Create;
  NodeDeviceTypeCodeList := TStringList.Create;
  ServerNoList := TStringList.Create;

  L_nPageListMaxCount := 17;
end;

procedure TfmRederTelNumber.FormGradeRefresh;
begin
end;

procedure TfmRederTelNumber.FormIDSetting(aID: string);
begin
  L_stMenuID := aID;
end;

function TfmRederTelNumber.FormNameSetting: Boolean;
begin
  Exit;
  AdvOfficePage1.Caption := dmFormFunction.GetFormName('0','2','BUTTONMENU002');
//  lb_List.Caption := dmFormFunction.GetFormName('2','1','BM2_011');//dmFormFunction.GetFormName('0','2','COMMONLIST01');
  pm_CodeAdd.Caption := dmFormFunction.GetFormName('0','2','BUTTONADD001');
  btn_Add.Caption := dmFormFunction.GetFormName('0','2','BUTTONADD001');
  pm_DeleteCode.Caption := dmFormFunction.GetFormName('0','2','BUTTONDEL001');
  pm_UpdateCode.Caption := dmFormFunction.GetFormName('0','2','BUTTONUPDATE001');
  btn_Save.Caption := dmFormFunction.GetFormName('0','2','BUTTONSAVE001');
  btn_Cancel.Caption := dmFormFunction.GetFormName('0','2','BUTTONCANCEL001');
  sg_List.Cells[2,0] := dmFormFunction.GetFormName('0','2','COMMONNODENAME01');
  sg_List.Cells[1,0] := dmFormFunction.GetFormName('0','2','COMMONNODEIP01');
  L_stNodeAddCaption := dmFormFunction.GetFormName('0','2','COMMONNODELIST02');
  L_stNodeUpdateCaption := dmFormFunction.GetFormName('0','2','COMMONNODELIST03');
  L_stButtonCloseCaption := dmFormFunction.GetFormName('0','2','BUTTONMENU001');
  L_stButtonPreCaption := dmFormFunction.GetFormName('0','2','BUTTONMENU004');
  btn_Search.Caption := dmFormFunction.GetFormName('0','2','BUTTONSEARCH001');

end;

procedure TfmRederTelNumber.FormResize(Sender: TObject);
begin
  inherited;
  btn_Close.Left := AdvOfficePager1.Width - btn_Close.Width - 10;
  btn_minimize.Left := btn_Close.Left - btn_minimize.Width - 2;

  if Windowstate = wsMaximized then
  begin
    btn_minimize.Visible := True;
    btn_Close.Visible := True;
  end else
  begin
    btn_minimize.Visible := False;
    btn_Close.Visible := False;
  end;

  sg_List.Left := 10;
  sg_List.Width := BodyPanel.Width - (sg_List.Left * 2);
  sg_List.Height := BodyPanel.Height - (sg_List.Top + 10);

  Add.Left := (BodyPanel.Width div 2) - (Add.Width div 2);
  Add.Top := (BodyPanel.Height div 2) - (Add.Height div 2);

end;

procedure TfmRederTelNumber.FormShow(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;

  FormNameSetting;

  LoadBuildingTreeView('',tv_buildingName,tv_buildingCode,con_LocalBuildingImageIndex);
  tv_buildingNameDblClick(Self);

  //SearchList('');
end;

function TfmRederTelNumber.GetTelNumber(aNodeNo: string): Boolean;
var
  nIndex : integer;
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  inherited;

  stSql := 'Select * from TB_READER ';
  stSql := stSql + ' Where ND_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND DE_ECUID = ''00'' ';
  stSql := stSql + ' AND DE_EXTENDID = 0 ';
  stSql := stSql + ' AND RE_READERNO = 1 ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      sql.Text := stSql;
      Try
        Open;
      Except
        dmDataBase.DBConnected := False;
        Exit;
      End;
      if recordcount < 1 then Exit;
      while Not Eof do
      begin
        ed_1.Text := FindField('RE_CARDREADERTEL1').AsString;
        ed_2.Text := FindField('RE_CARDREADERTEL2').AsString;
        ed_3.Text := FindField('RE_CARDREADERTEL3').AsString;
        ed_4.Text := FindField('RE_CARDREADERTEL4').AsString;
        ed_5.Text := FindField('RE_CARDREADERTEL5').AsString;
        ed_6.Text := FindField('RE_CARDREADERTEL6').AsString;
        ed_7.Text := FindField('RE_CARDREADERTEL7').AsString;
        ed_8.Text := FindField('RE_CARDREADERTEL8').AsString;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmRederTelNumber.pm_CodeAddClick(Sender: TObject);
var
  stMessage : string;
begin
  inherited;
  lb_Name.Visible := False;
  stMessage := stringReplace(dmFormMessage.GetMessage('SELECTERROR'),'$WORK',pm_CodeAdd.Caption,[rfReplaceAll]);
  if L_nCheckCount = 0 then
  begin
    Application.MessageBox(PChar(stMessage),'Information',MB_OK);
    Exit;
  end;
  ed_1.Text := '';
  ed_2.Text := '';
  ed_3.Text := '';
  ed_4.Text := '';
  ed_5.Text := '';
  ed_6.Text := '';
  ed_7.Text := '';
  ed_8.Text := '';

  stMessage := stringReplace(dmFormMessage.GetMessage('WORKCOUNTINFO'),'$WORK',pm_CodeAdd.Caption,[rfReplaceAll]);
  stMessage := stringReplace(stMessage,'$COUNT',inttostr(L_nCheckCount),[rfReplaceAll]);
  if (Application.MessageBox(PChar(stMessage),'Information',MB_OKCANCEL) = IDCANCEL)  then Exit;

  with sg_List do
  begin
    if Not isDigit(cells[5,Row]) then Exit;
    GetTelNumber(cells[5,Row]);
  end;

  Add.Visible := True;
  lb_WorkType.Caption := pm_CodeAdd.Caption;
  L_stWork := 'ADD';

end;

procedure TfmRederTelNumber.pm_UpdateCodeClick(Sender: TObject);
begin
  inherited;
  sg_ListDblClick(sg_List);
end;

function TfmRederTelNumber.SearchList(aCurrentCode:string;aTopRow:integer = 0): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  stBuildingCode : string;
begin
  GridInit(sg_List,5,2,true);
  stBuildingCode := tv_buildingCode.Items.Item[tv_buildingName.Selected.AbsoluteIndex].Text;
  stSql := dmDBSelect.SelectTB_NODE_Name(stBuildingCode,ed_SearchName.Text);
  L_nCheckCount := 0;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      sql.Text := stSql;
      Try
        Open;
      Except
        dmDataBase.DBConnected := False;
        Exit;
      End;
      if recordcount < 1 then Exit;
      with sg_List do
      begin
        nRow := 1;
        RowCount := RecordCount + 1;
        while Not Eof do
        begin
          AddCheckBox(0,nRow,False,False);
          cells[1,nRow] := FindField('ND_NODENAME').AsString;
          cells[2,nRow] := FindField('ND_NODEIP').AsString;
          cells[3,nRow] := FindField('ND_TELNUM').AsString;
          cells[4,nRow] := FindField('ND_ADDR').AsString;
          cells[5,nRow] := FindField('ND_NODENO').AsString;
          cells[6,nRow] := FindField('ND_DEVICEID').AsString;
          cells[7,nRow] := FindField('ND_NODEPORT').AsString;
          cells[8,nRow] := FindField('ND_DECODERNO').AsString;
          cells[9,nRow] := FindField('ND_ADDDATE').AsString;
          cells[10,nRow] := FindField('BC_BUILDINGCODE').AsString;

          if cells[5,nRow] = aCurrentCode then
          begin
            SelectRows(nRow,1);
          end;

          nRow := nRow + 1;
          Next;
        end;
        if aTopRow = 0 then
        begin
          if Row > (L_nPageListMaxCount - 1) then TopRow := Row - L_nPageListMaxCount;
        end else
        begin
          TopRow := aTopRow;
        end;
      end;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;


procedure TfmRederTelNumber.sg_ListCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  inherited;
  if ARow = 0 then //전체선택 또는 해제
  begin
    if State then L_nCheckCount := (Sender as TAdvStringGrid).RowCount - 1
    else L_nCheckCount := 0;
    AdvStrinGridSetAllCheck(Sender,State);
  end else
  begin
    if State then L_nCheckCount := L_nCheckCount + 1
    else L_nCheckCount := L_nCheckCount - 1 ;
  end;
end;

procedure TfmRederTelNumber.sg_ListDblClick(Sender: TObject);
var
  nIndex : integer;
begin
  inherited;
  L_stWork := 'UPDATE';
  with sg_List do
  begin
    if Not isDigit(cells[5,Row]) then Exit;
    GetTelNumber(cells[5,Row]);
    ed_NodeNo.Text := cells[5,Row];
    lb_Name.Caption := cells[1,Row];
    lb_Name.Visible := True;
  end;


  lb_WorkType.Caption := '수정';
  Add.Visible := True;
(*
          cells[1,nRow] := FindField('ND_NODENAME').AsString;
          cells[2,nRow] := FindField('ND_NODEIP').AsString;
          cells[3,nRow] := FindField('ND_TELNUM').AsString;
          cells[4,nRow] := FindField('ND_ADDR').AsString;
          cells[5,nRow] := FindField('ND_NODENO').AsString;
          cells[6,nRow] := FindField('ND_DEVICEID').AsString;
          cells[7,nRow] := FindField('ND_NODEPORT').AsString;
          cells[8,nRow] := FindField('ND_DECODERNO').AsString;
          cells[9,nRow] := FindField('ND_ADDDATE').AsString;

*)
end;

procedure TfmRederTelNumber.tv_buildingNameDblClick(Sender: TObject);
begin
  inherited;
  if tv_buildingName.Selected = nil then tv_buildingName.Items[0].Selected := True;

  ed_BuildingCode.Text := tv_buildingCode.Items.Item[tv_buildingName.Selected.AbsoluteIndex].Text;
  eb_BuildingName.Text := tv_buildingName.Selected.Text;
  tv_buildingName.Visible := False;

  SearchList('');

end;


procedure TfmRederTelNumber.UpdateTelNumber;
var
  i : integer;
  bChkState : Boolean;
begin
  dmDBUPdate.UpdateTB_READER_Field_StringValue(ed_NodeNo.Text,'00','0','1','RE_CARDREADERTEL1',ed_1.Text);
  dmDBUPdate.UpdateTB_READER_Field_StringValue(ed_NodeNo.Text,'00','0','1','RE_CARDREADERTEL2',ed_2.Text);
  dmDBUPdate.UpdateTB_READER_Field_StringValue(ed_NodeNo.Text,'00','0','1','RE_CARDREADERTEL3',ed_3.Text);
  dmDBUPdate.UpdateTB_READER_Field_StringValue(ed_NodeNo.Text,'00','0','1','RE_CARDREADERTEL4',ed_4.Text);
  dmDBUPdate.UpdateTB_READER_Field_StringValue(ed_NodeNo.Text,'00','0','1','RE_CARDREADERTEL5',ed_5.Text);
  dmDBUPdate.UpdateTB_READER_Field_StringValue(ed_NodeNo.Text,'00','0','1','RE_CARDREADERTEL6',ed_6.Text);
  dmDBUPdate.UpdateTB_READER_Field_StringValue(ed_NodeNo.Text,'00','0','1','RE_CARDREADERTEL7',ed_7.Text);
  dmDBUPdate.UpdateTB_READER_Field_StringValue(ed_NodeNo.Text,'00','0','1','RE_CARDREADERTEL8',ed_8.Text);
  dmDBUPdate.UpdateTB_READERRCV_Field_StringValue(ed_NodeNo.Text,'00','0','1','RE_CARDREADERTEL1','C');
  dmDBUPdate.UpdateTB_READERRCV_Field_StringValue(ed_NodeNo.Text,'00','0','1','RE_CARDREADERTEL2','C');
  dmDBUPdate.UpdateTB_READERRCV_Field_StringValue(ed_NodeNo.Text,'00','0','1','RE_CARDREADERTEL3','C');
  dmDBUPdate.UpdateTB_READERRCV_Field_StringValue(ed_NodeNo.Text,'00','0','1','RE_CARDREADERTEL4','C');
  dmDBUPdate.UpdateTB_READERRCV_Field_StringValue(ed_NodeNo.Text,'00','0','1','RE_CARDREADERTEL5','C');
  dmDBUPdate.UpdateTB_READERRCV_Field_StringValue(ed_NodeNo.Text,'00','0','1','RE_CARDREADERTEL6','C');
  dmDBUPdate.UpdateTB_READERRCV_Field_StringValue(ed_NodeNo.Text,'00','0','1','RE_CARDREADERTEL7','C');
  dmDBUPdate.UpdateTB_READERRCV_Field_StringValue(ed_NodeNo.Text,'00','0','1','RE_CARDREADERTEL8','C');

  if L_nCheckCount = 0 then  Exit;
  if (Application.MessageBox(PChar('체크된 분기국사 카드리더 정보도 동일하게 수정 하시겠습니까?'),'Information',MB_OKCANCEL) = IDCANCEL)  then Exit;

  With sg_List do
  begin
    for i := 1 to RowCount - 1 do
    begin
      GetCheckBoxState(0,i, bChkState);
      if bChkState then
      begin
        dmDBUPdate.UpdateTB_READER_Field_StringValue(cells[5,i],'00','0','1','RE_CARDREADERTEL1',ed_1.Text);
        dmDBUPdate.UpdateTB_READER_Field_StringValue(cells[5,i],'00','0','1','RE_CARDREADERTEL2',ed_2.Text);
        dmDBUPdate.UpdateTB_READER_Field_StringValue(cells[5,i],'00','0','1','RE_CARDREADERTEL3',ed_3.Text);
        dmDBUPdate.UpdateTB_READER_Field_StringValue(cells[5,i],'00','0','1','RE_CARDREADERTEL4',ed_4.Text);
        dmDBUPdate.UpdateTB_READER_Field_StringValue(cells[5,i],'00','0','1','RE_CARDREADERTEL5',ed_5.Text);
        dmDBUPdate.UpdateTB_READER_Field_StringValue(cells[5,i],'00','0','1','RE_CARDREADERTEL6',ed_6.Text);
        dmDBUPdate.UpdateTB_READER_Field_StringValue(cells[5,i],'00','0','1','RE_CARDREADERTEL7',ed_7.Text);
        dmDBUPdate.UpdateTB_READER_Field_StringValue(cells[5,i],'00','0','1','RE_CARDREADERTEL8',ed_8.Text);
        dmDBUPdate.UpdateTB_READERRCV_Field_StringValue(cells[5,i],'00','0','1','RE_CARDREADERTEL1','C');
        dmDBUPdate.UpdateTB_READERRCV_Field_StringValue(cells[5,i],'00','0','1','RE_CARDREADERTEL2','C');
        dmDBUPdate.UpdateTB_READERRCV_Field_StringValue(cells[5,i],'00','0','1','RE_CARDREADERTEL3','C');
        dmDBUPdate.UpdateTB_READERRCV_Field_StringValue(cells[5,i],'00','0','1','RE_CARDREADERTEL4','C');
        dmDBUPdate.UpdateTB_READERRCV_Field_StringValue(cells[5,i],'00','0','1','RE_CARDREADERTEL5','C');
        dmDBUPdate.UpdateTB_READERRCV_Field_StringValue(cells[5,i],'00','0','1','RE_CARDREADERTEL6','C');
        dmDBUPdate.UpdateTB_READERRCV_Field_StringValue(cells[5,i],'00','0','1','RE_CARDREADERTEL7','C');
        dmDBUPdate.UpdateTB_READERRCV_Field_StringValue(cells[5,i],'00','0','1','RE_CARDREADERTEL8','C');
        Application.ProcessMessages;
      end;
    end;
  end;
end;

initialization
  RegisterClass(TfmRederTelNumber);
Finalization
  UnRegisterClass(TfmRederTelNumber);

end.