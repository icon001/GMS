﻿unit ucertificateClass;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uSubForm, CommandArray, AdvGlassButton,
  Vcl.Grids, AdvObj, BaseGrid, AdvGrid, Vcl.StdCtrls, AdvEdit, AdvSmoothLabel,
  AdvSmoothPanel, AdvOfficeTabSet, W7Classes, W7Panels,ActiveX,ADODB,
  Vcl.ComCtrls, Vcl.Menus, Vcl.ImgList, AdvOfficeTabSetStylers, AdvToolBar,
  AdvToolBarStylers, AdvGlowButton, AdvOfficePager, AdvOfficePagerStylers,
  AdvAppStyler, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TfmCertificateClass = class(TfmASubForm)
    BodyPanel: TW7Panel;
    List: TAdvSmoothPanel;
    tv_emGroupList: TTreeView;
    tv_emGroupCode: TTreeView;
    pm_Work: TPopupMenu;
    Pan_EMGroupcode: TAdvSmoothPanel;
    ed_EmGroupName: TAdvEdit;
    ed_SelectCode: TAdvEdit;
    MenuImageList16: TImageList;
    AdvOfficePager1: TAdvOfficePager;
    AdvOfficePage1: TAdvOfficePage;
    btn_minimize: TAdvGlowButton;
    btn_Close: TAdvGlowButton;
    lb_List: TLabel;
    btn_Add: TAdvGlowButton;
    btn_Update: TAdvGlowButton;
    btn_Delete: TAdvGlowButton;
    AdvFormStyler1: TAdvFormStyler;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    lb_WorkType: TLabel;
    lb_Name: TAdvSmoothLabel;
    btn_Save: TAdvGlowButton;
    btn_Cancel: TAdvGlowButton;
    pan_SelectViewSeq: TAdvSmoothPanel;
    Label1: TLabel;
    btn_SelectSave: TAdvGlowButton;
    btn_SelectCancel: TAdvGlowButton;
    TreeView_Select: TTreeView;
    mn_ViewSeqChange: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tv_emGroupListClick(Sender: TObject);
    procedure pm_ChiledCodeAddClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure pm_UpdateCodeClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure ed_EmGroupNameKeyPress(Sender: TObject; var Key: Char);
    procedure pm_DeleteCodeClick(Sender: TObject);
    procedure tv_emGroupListDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure tv_emGroupListDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure tv_emGroupListDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_AddClick(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure btn_minimizeClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
    procedure mn_ViewSeqChangeClick(Sender: TObject);
    procedure btn_SelectSaveClick(Sender: TObject);
    procedure btn_SelectCancelClick(Sender: TObject);
  private
    L_stMenuID : string;
    L_stButtonCloseCaption : string;
    L_stWork : string;
    L_stSelectCertificateClassCode : string;
    procedure FormNameSetting;
    procedure FontSetting;
//    procedure SearchList(aCode:string);
    function ChangeLectureClassCode(aOrgCode,aCode,aDeepSeq,aViewSeq:string):Boolean;
    { Private declarations }
  public
    { Public declarations }
    procedure Form_Close;
    procedure FormChangeEvent(aNumber:integer);
    procedure FormGradeRefresh;
    procedure FormIDSetting(aID:string);
  end;

var
  fmCertificateClass: TfmCertificateClass;

implementation
uses
  uComboBoxCodeLoad,
  uCommonFunction,
  uCommonVariable,
  uFormFunction,
  uFormVariable,
  uDataBase,
  uDBCardPermit,
  uDBDelete,
  uDBFormMessage,
  uDBFunction,
  uDBInsert,
  uDBUpdate,
  uFormUtil,
  uMain;
{$R *.dfm}

procedure TfmCertificateClass.btn_AddClick(Sender: TObject);
begin
  inherited;
  pm_ChiledCodeAddClick(btn_Add);
end;

procedure TfmCertificateClass.btn_CancelClick(Sender: TObject);
begin
  inherited;
  Pan_EMGroupcode.Visible := False;
end;

procedure TfmCertificateClass.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmCertificateClass.btn_DeleteClick(Sender: TObject);
begin
  inherited;
  pm_DeleteCodeClick(btn_Delete);
end;

procedure TfmCertificateClass.btn_minimizeClick(Sender: TObject);
begin
  inherited;
  WindowState := wsNormal;
end;

procedure TfmCertificateClass.btn_SaveClick(Sender: TObject);
var
  stMessage : string;
  stParentCode : string;
  stCode,stDeepSeq,stViewSeq : string;
begin
  inherited;
  if Trim(ed_EmGroupName.Text) = '' then
  begin
    stMessage := dmFormMessage.GetMessage('BLANKFIELD');
    stMessage := StringReplace(stMessage,'$WORK',lb_Name.Caption.Text,[rfReplaceAll]);
    showmessage(stMessage);
    Exit;
  end;

  if L_stWork = 'CHILDCODEADD' then
  begin
    stParentCode := ed_SelectCode.Text;
    dmDBFunction.GetNextTB_CERTIFICATEClassCode_ChildCode(stParentCode,stCode,stDeepSeq,stViewSeq);
    dmDBInsert.InsertIntoTB_CERTIFICATEClassCode_Value(stCode,ed_EmGroupName.Text,stDeepSeq,'1',stViewSeq);
    LoadCERTIFICATEClassTreeView(stParentCode,tv_emGroupList,tv_emGroupCode,0);
    LoadCERTIFICATEClassTreeView(stParentCode,TreeView_Select,tv_emGroupCode,0);
    tv_emGroupList.SetFocus;
    fmMain.FORMCHANGE(con_FormBMOSEMGROUPCODE,'');
  end else if L_stWork = 'EXTCODEADD' then
  begin
    stParentCode := copy(ed_SelectCode.Text,1,Length(ed_SelectCode.Text) - G_nEmployeeGroupLength);
    dmDBFunction.GetNextTB_CERTIFICATEClassCode_ChildCode(stParentCode,stCode,stDeepSeq,stViewSeq);
    dmDBInsert.InsertIntoTB_CERTIFICATEClassCode_Value(stCode,ed_EmGroupName.Text,stDeepSeq,'1',stViewSeq);
    LoadCERTIFICATEClassTreeView(stParentCode,tv_emGroupList,tv_emGroupCode,0);
    LoadCERTIFICATEClassTreeView(stParentCode,TreeView_Select,tv_emGroupCode,0);
    tv_emGroupList.SetFocus;
    fmMain.FORMCHANGE(con_FormBMOSEMGROUPCODE,'');
  end else if L_stWork = 'SELECTCODEUPDATE' then
  begin
    stCode := ed_SelectCode.Text;
    dmDBUpdate.UpdateTB_CERTIFICATEClassCode_Field_StringValue(stCode,'CC_CODENAME',ed_EmGroupName.Text);
    tv_emGroupList.Selected.Text := ed_EmGroupName.Text;
    tv_emGroupList.SetFocus;
    fmMain.FORMCHANGE(con_FormBMOSEMGROUPCODE,'');
    //SearchList(stCode);
  end;

  Pan_EMGroupcode.Visible := False;
end;

procedure TfmCertificateClass.btn_SelectCancelClick(Sender: TObject);
begin
  inherited;
  pan_SelectViewSeq.Visible := False;
end;

procedure TfmCertificateClass.btn_SelectSaveClick(Sender: TObject);
var
  stTargetCode : string;
  stViewSeq : string;
begin
  inherited;
  //L_stSelectLectureClassCode :=
  if TreeView_Select.Selected = nil then
  begin
    showmessage('변경할 위치를 선택하셔야 합니다.');
    Exit;
  end;
  stTargetCode := tv_emGroupCode.Items[TreeView_Select.Selected.AbsoluteIndex].Text;
  stViewSeq := dmDBFunction.GetTB_CERTIFICATEClassCode_ViewSeq(stTargetCode);
  if isDigit(stViewSeq) then
  begin
    dmDBUpdate.UpdateTB_CERTIFICATEClassCode_ViewSeqUp(stViewSeq);
    dmDBUpdate.UpdateTB_CERTIFICATEClassCode_Field_IntValue(L_stSelectCertificateClassCode,'CC_VIEWSEQ',stViewSeq);
  end;
  pan_SelectViewSeq.Visible := False;
  LoadCERTIFICATEClassTreeView('',tv_emGroupList,tv_emGroupCode,0);
  LoadCERTIFICATEClassTreeView('',TreeView_Select,tv_emGroupCode,0);
end;

procedure TfmCertificateClass.btn_UpdateClick(Sender: TObject);
begin
  inherited;
  pm_UpdateCodeClick(btn_Update);
end;


function TfmCertificateClass.ChangeLectureClassCode(aOrgCode, aCode, aDeepSeq,
  aViewSeq: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stChildCode,stDeepSeq,stViewSeq : string;
  stOrgDeepSeq : string;
begin
  stOrgDeepSeq := dmDBFunction.GetTB_CERTIFICATEClassCode_CurrentDeepSeq(aOrgCode);
  stSql := ' Update TB_CERTIFICATECLASSCODE Set ';
  stSql := stSql + ' CC_CODE = ''' + aCode + ''',';
  stSql := stSql + ' CC_DEEPSEQ = ' + aDeepSeq + ',';
  stSql := stSql + ' CC_VIEWSEQ = ' + aViewSeq + ' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CC_CODE = ''' + aOrgCode + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);

end;

procedure TfmCertificateClass.ed_EmGroupNameKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    Key := #0;
    btn_SaveClick(self);
  end;
end;


procedure TfmCertificateClass.FontSetting;
begin
(*  dmFormUtil.TravelFormFontSetting(self,G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.TravelAdvOfficeTabSetOfficeStylerFontSetting(AdvOfficeTabSetOfficeStyler1, G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.FormAdvOfficeTabSetOfficeStylerSetting(AdvOfficeTabSetOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormAdvToolBarOfficeStylerSetting(AdvToolBarOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormStyleSetting(self,AdvToolBarOfficeStyler1);
*)
end;

procedure TfmCertificateClass.FormActivate(Sender: TObject);
begin
  inherited;
  WindowState := wsNormal;

end;

procedure TfmCertificateClass.FormChangeEvent(aNumber: integer);
begin

end;

procedure TfmCertificateClass.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  fmMain.FORMENABLE(con_FormBMOSEMGROUPCODE,'FALSE');

  Action := caFree;
end;

procedure TfmCertificateClass.FormCreate(Sender: TObject);
begin
  inherited;
  if G_nFormLanguageType = 1 then
  begin
    ed_EmGroupName.ImeMode := imSHanguel;// imHanguel;
    ed_EmGroupName.ImeName := '';
  end else if G_nFormLanguageType = 2 then
  begin
    ed_EmGroupName.ImeMode := imAlpha;
    ed_EmGroupName.ImeName := '';
  end;
  FontSetting;
end;

procedure TfmCertificateClass.FormGradeRefresh;
begin
  Try
    if IsInsertGrade or IsUpdateGrade or IsDeleteGrade then PopupMenu := pm_Work;
    btn_Add.Enabled := IsInsertGrade;
    btn_Delete.Enabled := False;
    btn_Update.Enabled := IsUpdateGrade;
  Except
    Exit;
  End;
end;

procedure TfmCertificateClass.FormIDSetting(aID: string);
begin
  L_stMenuID := aID;
end;

procedure TfmCertificateClass.FormNameSetting;
begin
  AdvOfficePage1.Caption := dmFormFunction.GetFormName('0','2','BUTTONMENU002');
  btn_Add.Caption := dmFormFunction.GetFormName('0','2','COMMONADD');
  btn_Delete.Caption := dmFormFunction.GetFormName('0','2','BUTTONDEL001');
  btn_Update.Caption := dmFormFunction.GetFormName('0','2','BUTTONUPDATE001');
  btn_Save.Caption := dmFormFunction.GetFormName('0','2','BUTTONSAVE001');
  btn_Cancel.Caption := dmFormFunction.GetFormName('0','2','BUTTONCANCEL001');
end;

procedure TfmCertificateClass.FormResize(Sender: TObject);
begin
  inherited;
  btn_Close.Left := AdvOfficePager1.Width - btn_Close.Width - 10;
  btn_minimize.Left := btn_Close.Left - btn_minimize.Width - 2;

  tv_emGroupList.Height := List.Height - tv_emGroupList.Top - 30;
  tv_emGroupList.Width := List.Width - (tv_emGroupList.Left * 2);

  Pan_EMGroupcode.Left := (Width div 2) - (Pan_EMGroupcode.Width div 2);
  Pan_EMGroupcode.top := (Height div 2) - (Pan_EMGroupcode.Height div 2);
  pan_SelectViewSeq.Left := (Width div 2) - (pan_SelectViewSeq.Width div 2);
  pan_SelectViewSeq.top := (Height div 2) - (pan_SelectViewSeq.Height div 2);

  if Windowstate = wsMaximized then
  begin
    btn_minimize.Visible := True;
    btn_Close.Visible := True;
  end else
  begin
    btn_minimize.Visible := False;
    btn_Close.Visible := False;
  end;
end;

procedure TfmCertificateClass.FormShow(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;

  FormNameSetting;
  fmMain.FORMENABLE(con_FormBMOSEMGROUPCODE,'TRUE');

  LoadCERTIFICATEClassTreeView('',tv_emGroupList,tv_emGroupCode,0);
  LoadCERTIFICATEClassTreeView('',TreeView_Select,tv_emGroupCode,0);

  FormResize(self);
  Left := 0;
  Top := 0;
end;

procedure TfmCertificateClass.Form_Close;
begin
  Close;
end;

procedure TfmCertificateClass.mn_ViewSeqChangeClick(Sender: TObject);
begin
  inherited;
  L_stSelectCertificateClassCode := tv_emGroupCode.Items[tv_emGroupList.Selected.AbsoluteIndex].Text;
  pan_SelectViewSeq.Visible := True;

end;

procedure TfmCertificateClass.pm_ChiledCodeAddClick(Sender: TObject);
var
  stMessage : string;
begin
  inherited;
  if tv_emGroupList.Selected = nil then
  begin
    stMessage := dmFormMessage.GetMessage('SELECTERROR');
    stMessage := stringReplace(stMessage,'$WORK',btn_Add.Caption,[rfReplaceAll]);
    showmessage(stMessage);
    Exit;
  end;
  Pan_EMGroupcode.Visible := True;
  lb_WorkType.Caption := btn_Add.Caption;
  ed_SelectCode.Text := tv_emGroupCode.Items.Item[tv_emGroupList.Selected.AbsoluteIndex].Text;
  L_stWork := 'CHILDCODEADD';
  ed_EmGroupName.Text := '';
  ed_EmGroupName.SetFocus;
end;

procedure TfmCertificateClass.pm_DeleteCodeClick(Sender: TObject);
var
  stMessage : string;
  stCode : string;
  stSql : string;
begin
  inherited;
  if tv_emGroupList.Selected = nil then
  begin
    stMessage := dmFormMessage.GetMessage('SELECTERROR');
    stMessage := stringReplace(stMessage,'$WORK',btn_Delete.Caption,[rfReplaceAll]);
    showmessage(stMessage);
    Exit;
  end;
  stCode := tv_emGroupCode.Items.Item[tv_emGroupList.Selected.AbsoluteIndex].Text;

  dmDBDelete.DeleteTB_CERTIFICATECLASSCODE_LikeCode(stCode);

  LoadCERTIFICATEClassTreeView(stCode,tv_emGroupList,tv_emGroupCode,0);
  LoadCERTIFICATEClassTreeView(stCode,TreeView_Select,tv_emGroupCode,0);
end;

procedure TfmCertificateClass.pm_UpdateCodeClick(Sender: TObject);
var
  stMessage : string;
begin
  inherited;
  if tv_emGroupList.Selected = nil then
  begin
    stMessage := dmFormMessage.GetMessage('SELECTERROR');
    stMessage := stringReplace(stMessage,'$WORK',btn_Update.Caption,[rfReplaceAll]);
    showmessage(stMessage);
    Exit;
  end;
  Pan_EMGroupcode.Visible := True;
  lb_WorkType.Caption := btn_Update.Caption;
  ed_SelectCode.Text := tv_emGroupCode.Items.Item[tv_emGroupList.Selected.AbsoluteIndex].Text;
  ed_EmGroupName.Text := tv_emGroupList.Selected.Text;
  L_stWork := 'SELECTCODEUPDATE';
  ed_EmGroupName.SetFocus;
end;

procedure TfmCertificateClass.tv_emGroupListClick(Sender: TObject);
begin
  inherited;
  if tv_emGroupList.Selected = nil then Exit;

  if tv_emGroupList.Selected.AbsoluteIndex = 0 then
  begin
    btn_Delete.Enabled := False;
  end else
  begin
    //pm_ExtendCodeAdd.Visible := True;
    btn_Delete.Enabled := IsDeleteGrade;
  end;

end;

procedure TfmCertificateClass.tv_emGroupListDblClick(Sender: TObject);
begin
  inherited;
  pm_UpdateCodeClick(Sender);
end;

procedure TfmCertificateClass.tv_emGroupListDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  currentItem, dropItem : TTreeNode;
  stOrgCode : string;
  stTargetParentCode : string;
  stCode : string;
  stDeepSeq,stViewSeq : string;
  stSql : string;
begin
  inherited;
  if Sender = Source then
  begin
    with TTreeView(Sender) do
    begin
      dropItem :=GetNodeAt(X,Y);
      currentItem := Selected;
      if currentItem.AbsoluteIndex = 0 then Exit;
      stTargetParentCode := tv_emGroupCode.Items[dropItem.AbsoluteIndex].Text;
      stOrgCode := tv_emGroupCode.Items[currentItem.AbsoluteIndex].Text;
      if copy(stTargetParentCode,1,Length(stOrgCode)) = stOrgCode then Exit; //자신의 하위디렉토리로 갈수는 없다
      dmDBFunction.GetNextTB_CERTIFICATECLASSCODE_ChildCode(stTargetParentCode,stCode,stDeepSeq,stViewSeq);
      ChangeLectureClassCode(stOrgCode,stCode,stDeepSeq,stViewSeq);
    end;
  end;
  LoadCERTIFICATEClassTreeView(stCode,tv_emGroupList,tv_emGroupCode,0);
  LoadCERTIFICATEClassTreeView(stCode,TreeView_Select,tv_emGroupCode,0);
end;

procedure TfmCertificateClass.tv_emGroupListDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Sender = tv_emGroupList;
end;

initialization
  RegisterClass(TfmCertificateClass);
Finalization
  UnRegisterClass(TfmCertificateClass);

end.