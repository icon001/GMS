﻿unit uReaderPassword;

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
  TfmRederPassword = class(TfmASubForm)
    BodyPanel: TAdvSmoothPanel;
    ed_SearchName: TAdvEdit;
    sg_List: TAdvStringGrid;
    Add: TAdvSmoothPanel;
    lb_1: TAdvSmoothLabel;
    ed_Password: TAdvEdit;
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
    eb_BuildingName: TAdvEditBtn;
    lb_BuildingName: TAdvSmoothLabel;
    AdvSmoothLabel3: TAdvSmoothLabel;
    tv_buildingName: TTreeView;
    tv_buildingCode: TTreeView;
    MenuImageList16: TImageList;
    ed_BuildingCode: TAdvEdit;
    lb_Name: TLabel;
    ed_OldPasswd: TAdvEdit;
    btn_Search: TAdvGlowButton;
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
    procedure ed_PasswordKeyPress(Sender: TObject; var Key: Char);
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
    procedure pm_DeleteCodeClick(Sender: TObject);
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
    Function SearchList(aCurrentCode:string;aTopRow:integer = 0):Boolean;
  private
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);
    procedure AddPassword;
    procedure UpdatePassword;
  public
    { Public declarations }
    procedure FormChangeEvent(aFormName:integer);
    procedure FormGradeRefresh;
    procedure FormIDSetting(aID:string);
  end;

var
  fmRederPassword: TfmRederPassword;

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


procedure TfmRederPassword.AddPassword;
var
  i : integer;
  bChkState : Boolean;
  stCardNo : string;
begin
  if Not isDigit(ed_Password.Text) then
  begin
    showmessage('비밀번호는 숫자로만 가능합니다.');
  end;
  stCardNo := Dec2Hex(strtoint(ed_Password.Text),8);
  stCardNo := FillCharString(stCardNo,'*',G_nCardLength);
  With sg_List do
  begin
    for i := 1 to RowCount - 1 do
    begin
      GetCheckBoxState(0,i, bChkState);
      if bChkState then
      begin
        if dmDBFunction.CheckTB_CARDPERMIT_DeviceCardNo(cells[4,i],'00','0',stCardNo) = 0 then
        begin
          //입력
          dmDBInsert.InsertIntoTB_CARDPERMIT_VALUE(cells[4,i], '00', '0',stCardNo,'1','1','1', '1', '1', '1', '1',
          '1','1', '1', '1', '1', '1', '1', '1','1', '1', '1',ed_Password.Text,'0');
        end else
        begin
          //업데이트
          dmDBUpdate.UpdateTB_CARDPERMIT_VALUE(cells[4,i], '00', '0',stCardNo,'1','1','1', '1', '1', '1', '1',
          '1','1', '1', '1', '1', '1', '1', '1','1', '1', '1',ed_Password.Text,'0');
        end;

        Application.ProcessMessages;
      end;
    end;
  end;
end;


procedure TfmRederPassword.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;
end;

procedure TfmRederPassword.btn_AddClick(Sender: TObject);
begin
  inherited;
  pm_CodeAddClick(pm_CodeAdd);
end;

procedure TfmRederPassword.btn_CancelClick(Sender: TObject);
begin
  inherited;
  Add.Visible := False;
end;

procedure TfmRederPassword.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmRederPassword.btn_minimizeClick(Sender: TObject);
begin
  inherited;
  windowState := wsNormal;
end;

procedure TfmRederPassword.btn_SaveClick(Sender: TObject);
begin
  inherited;
  if L_stWork = 'ADD' then AddPassword
  else if L_stWork = 'UPDATE' then UpdatePassword;
  Add.Visible := False;

  SearchList(ed_NodeNo.Text,sg_List.TopRow);
end;

procedure TfmRederPassword.btn_SearchClick(Sender: TObject);
begin
  inherited;
  SearchList('');
end;

procedure TfmRederPassword.btn_UpdateClick(Sender: TObject);
begin
  inherited;
  sg_ListDblClick(sg_List);
end;

procedure TfmRederPassword.CommandArrayCommandsTFORMNAMEExecute(Command: TCommand;
  Params: TStringList);
begin
  inherited;
  Caption := Params.Values['CAPTION'];

end;

procedure TfmRederPassword.CommandArrayCommandsTGRADEREFRESHExecute(
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

procedure TfmRederPassword.CommandArrayCommandsTMENUIDExecute(Command: TCommand;
  Params: TStringList);
begin
  inherited;
  L_stMenuID := Params.Values['ID'];
end;

procedure TfmRederPassword.eb_BuildingNameClickBtn(Sender: TObject);
begin
  inherited;
  tv_buildingName.Visible := Not tv_buildingName.Visible;
  tv_buildingName.Top := eb_BuildingName.Top + eb_BuildingName.Height;
  tv_buildingName.Left := eb_BuildingName.Left;

end;

procedure TfmRederPassword.ed_PasswordKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = Char(VK_RETURN) then
      Perform(WM_NEXTDLGCTL,0,0);

end;

procedure TfmRederPassword.ed_SearchNameChange(Sender: TObject);
begin
  inherited;
  if G_nReportSearchType = 1 then SearchList('');
end;

procedure TfmRederPassword.ed_SearchNameKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    Key := #0;
    SearchList('');
  end;

end;

procedure TfmRederPassword.FormChangeEvent(aFormName: integer);
begin
//  case aFormName of
//  end;
end;

procedure TfmRederPassword.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  NodeDeviceTypeCodeList.Free;
  FireGroupCodeList.Free;
  ServerNoList.Free;

  Action := caFree;
end;

procedure TfmRederPassword.FormCreate(Sender: TObject);
begin
  inherited;
  FireGroupCodeList := TStringList.Create;
  NodeDeviceTypeCodeList := TStringList.Create;
  ServerNoList := TStringList.Create;

  L_nPageListMaxCount := 17;
end;

procedure TfmRederPassword.FormGradeRefresh;
begin
end;

procedure TfmRederPassword.FormIDSetting(aID: string);
begin
  L_stMenuID := aID;
end;

function TfmRederPassword.FormNameSetting: Boolean;
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

procedure TfmRederPassword.FormResize(Sender: TObject);
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

procedure TfmRederPassword.FormShow(Sender: TObject);
begin
  inherited;
  GridInit(sg_List,4,2,true);

  WindowState := wsMaximized;

  FormNameSetting;

  LoadBuildingTreeView('',tv_buildingName,tv_buildingCode,con_LocalBuildingImageIndex);
  tv_buildingNameDblClick(Self);

  //SearchList('');
end;

procedure TfmRederPassword.pm_CodeAddClick(Sender: TObject);
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
  ed_Password.Text := '';

  stMessage := stringReplace(dmFormMessage.GetMessage('WORKCOUNTINFO'),'$WORK',pm_CodeAdd.Caption,[rfReplaceAll]);
  stMessage := stringReplace(stMessage,'$COUNT',inttostr(L_nCheckCount),[rfReplaceAll]);
  if (Application.MessageBox(PChar(stMessage),'Information',MB_OKCANCEL) = IDCANCEL)  then Exit;


  Add.Visible := True;
  lb_WorkType.Caption := pm_CodeAdd.Caption;
  L_stWork := 'ADD';
end;

procedure TfmRederPassword.pm_DeleteCodeClick(Sender: TObject);
var
  stCardNo : string;
begin
  inherited;
  with sg_List do
  begin
    if Not isDigit(cells[4,Row]) then Exit;
    if Not isDigit(cells[2,Row]) then Exit;

    stCardNo := Dec2Hex(strtoint(cells[2,Row]),8);
    stCardNo := FillCharString(stCardNo,'*',G_nCardLength);
    dmDBUpdate.UpdateTB_CARDPERMIT_VALUE(cells[4,Row], '00', '0',stCardNo,'0','1','1', '1', '1', '1', '1',
    '1','1', '1', '1', '1', '1', '1', '1','1', '1', '1',cells[2,Row],'0');    //비밀번호 삭제
  end;
  SearchList('',sg_List.TopRow);
end;

procedure TfmRederPassword.pm_UpdateCodeClick(Sender: TObject);
begin
  inherited;
  sg_ListDblClick(sg_List);
end;

function TfmRederPassword.SearchList(aCurrentCode:string;aTopRow:integer = 0): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  stBuildingCode : string;
begin
  GridInit(sg_List,4,2,true);
  stBuildingCode := tv_buildingCode.Items.Item[tv_buildingName.Selected.AbsoluteIndex].Text;
  stSql := dmDBSelect.SelectTB_CARDPERMIT_PASSWD(stBuildingCode,ed_SearchName.Text);
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
          cells[2,nRow] := FindField('CP_PASSWD').AsString;
          cells[3,nRow] := FindField('CP_RCVACK').AsString;
          cells[4,nRow] := FindField('ND_NODENO').AsString;

          if cells[4,nRow] = aCurrentCode then
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


procedure TfmRederPassword.sg_ListCheckBoxClick(Sender: TObject; ACol,
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

procedure TfmRederPassword.sg_ListDblClick(Sender: TObject);
var
  nIndex : integer;
begin
  inherited;
  L_stWork := 'UPDATE';
  with sg_List do
  begin
    if Not isDigit(cells[4,Row]) then Exit;
    ed_NodeNo.Text := cells[4,Row];
    lb_Name.Caption := cells[1,Row];
    lb_Name.Visible := True;
    ed_Password.Text := cells[2,Row];
    ed_OldPasswd.Text := cells[2,Row];
  end;


  lb_WorkType.Caption := '수정';
  Add.Visible := True;

end;

procedure TfmRederPassword.tv_buildingNameDblClick(Sender: TObject);
begin
  inherited;
  if tv_buildingName.Selected = nil then tv_buildingName.Items[0].Selected := True;

  ed_BuildingCode.Text := tv_buildingCode.Items.Item[tv_buildingName.Selected.AbsoluteIndex].Text;
  eb_BuildingName.Text := tv_buildingName.Selected.Text;
  tv_buildingName.Visible := False;

  if G_nReportSearchType = 1 then SearchList('');

end;


procedure TfmRederPassword.UpdatePassword;
var
  i : integer;
  stCardNo : string;
begin
  if Not isDigit(ed_Password.Text) then
  begin
    showmessage('비밀번호는 숫자로만 가능합니다.');
  end;
  if ed_OldPasswd.Text <> ed_Password.Text then
  begin
    if isDigit(ed_OldPasswd.Text) then
    begin
      stCardNo := Dec2Hex(strtoint(ed_OldPasswd.Text),8);
      stCardNo := FillCharString(stCardNo,'*',G_nCardLength);
      dmDBUpdate.UpdateTB_CARDPERMIT_VALUE(ed_NodeNo.Text, '00', '0',stCardNo,'0','1','1', '1', '1', '1', '1',
      '1','1', '1', '1', '1', '1', '1', '1','1', '1', '1',ed_OldPasswd.Text,'0');    //비밀번호 삭제
    end;
  end;

  stCardNo := Dec2Hex(strtoint(ed_Password.Text),8);
  stCardNo := FillCharString(stCardNo,'*',G_nCardLength);

  if dmDBFunction.CheckTB_CARDPERMIT_DeviceCardNo(ed_NodeNo.Text,'00','0',stCardNo) = 0 then
  begin
    //입력
    dmDBInsert.InsertIntoTB_CARDPERMIT_VALUE(ed_NodeNo.Text, '00', '0',stCardNo,'1','1','1', '1', '1', '1', '1',
    '1','1', '1', '1', '1', '1', '1', '1','1', '1', '1',ed_Password.Text,'0');
  end else
  begin
    //업데이트
    dmDBUpdate.UpdateTB_CARDPERMIT_VALUE(ed_NodeNo.Text, '00', '0',stCardNo,'1','1','1', '1', '1', '1', '1',
    '1','1', '1', '1', '1', '1', '1', '1','1', '1', '1',ed_Password.Text,'0');
  end;



end;


initialization
  RegisterClass(TfmRederPassword);
Finalization
  UnRegisterClass(TfmRederPassword);

end.