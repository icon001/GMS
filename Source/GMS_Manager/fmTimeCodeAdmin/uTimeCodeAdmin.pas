﻿unit uTimeCodeAdmin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uSubForm, CommandArray, AdvGlassButton,
  Vcl.Grids, AdvObj, BaseGrid, AdvGrid, Vcl.StdCtrls, AdvEdit, AdvSmoothLabel,
  AdvSmoothPanel, AdvOfficeTabSet, W7Classes, W7Panels,ActiveX,ADODB,
  Vcl.ComCtrls, Vcl.Menus, Vcl.ImgList, Vcl.ExtCtrls, AdvSplitter, AdvGroupBox,
  AdvCombo, AdvOfficeTabSetStylers, AdvToolBar, AdvToolBarStylers, AdvAppStyler,
  AdvPageControl, AdvOfficePager, AdvOfficePagerStylers, AdvGlowButton,
  Vcl.Imaging.pngimage;

const
  con_LocalBuildingImageIndex = 1;
  con_LocalDeviceImageIndex = 7;
  con_LocalDeviceMyTypeImage = 8;

type
  TfmTimeCodeAdmin = class(TfmASubForm)
    pm_Work: TPopupMenu;
    pm_UpdateCode: TMenuItem;
    MenuImageList16: TImageList;
    N1: TMenuItem;
    N2: TMenuItem;
    pm_Building: TPopupMenu;
    MenuItem3: TMenuItem;
    mn_GroupTimeCode: TMenuItem;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    AdvToolBarOfficeStyler1: TAdvToolBarOfficeStyler;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    AdvOfficePager1: TAdvOfficePager;
    AdvOfficePager11: TAdvOfficePage;
    W7Panel1: TW7Panel;
    BodyPanel: TW7Panel;
    AdvSplitter1: TAdvSplitter;
    List: TAdvSmoothPanel;
    tv_List: TTreeView;
    tv_Code: TTreeView;
    pan_TimeCodeSetting: TAdvSmoothPanel;
    Gb_Group1: TAdvGroupBox;
    lb_Time11: TLabel;
    lb_StartHH11: TLabel;
    lb_StartMM11: TLabel;
    lb_endHH11: TLabel;
    lb_EndMM11: TLabel;
    Label7: TLabel;
    lb_Time12: TLabel;
    lb_StartHH12: TLabel;
    lb_StartMM12: TLabel;
    Label11: TLabel;
    lb_endHH12: TLabel;
    lb_EndMM12: TLabel;
    lb_Time13: TLabel;
    lb_StartHH13: TLabel;
    lb_StartMM13: TLabel;
    Label17: TLabel;
    lb_endHH13: TLabel;
    lb_EndMM13: TLabel;
    lb_Time14: TLabel;
    lb_StartHH14: TLabel;
    lb_StartMM14: TLabel;
    Label23: TLabel;
    lb_endHH14: TLabel;
    lb_EndMM14: TLabel;
    cmb_StartHH11: TAdvComboBox;
    cmb_StartMM11: TAdvComboBox;
    cmb_EndHH11: TAdvComboBox;
    cmb_EndMM11: TAdvComboBox;
    cmb_StartHH12: TAdvComboBox;
    cmb_StartMM12: TAdvComboBox;
    cmb_EndHH12: TAdvComboBox;
    cmb_EndMM12: TAdvComboBox;
    cmb_StartHH13: TAdvComboBox;
    cmb_StartMM13: TAdvComboBox;
    cmb_EndHH13: TAdvComboBox;
    cmb_EndMM13: TAdvComboBox;
    cmb_StartHH14: TAdvComboBox;
    cmb_StartMM14: TAdvComboBox;
    cmb_EndHH14: TAdvComboBox;
    cmb_EndMM14: TAdvComboBox;
    Gb_Group2: TAdvGroupBox;
    lb_Time21: TLabel;
    lb_StartHH21: TLabel;
    lb_StartMM21: TLabel;
    lb_endHH21: TLabel;
    lb_EndMM21: TLabel;
    Label31: TLabel;
    lb_Time22: TLabel;
    lb_StartHH22: TLabel;
    lb_StartMM22: TLabel;
    Label35: TLabel;
    lb_endHH22: TLabel;
    lb_EndMM22: TLabel;
    lb_Time23: TLabel;
    lb_StartHH23: TLabel;
    lb_StartMM23: TLabel;
    Label41: TLabel;
    lb_endHH23: TLabel;
    lb_EndMM23: TLabel;
    lb_Time24: TLabel;
    lb_StartHH24: TLabel;
    lb_StartMM24: TLabel;
    Label47: TLabel;
    lb_endHH24: TLabel;
    lb_EndMM24: TLabel;
    cmb_StartHH21: TAdvComboBox;
    cmb_StartMM21: TAdvComboBox;
    cmb_EndHH21: TAdvComboBox;
    cmb_EndMM21: TAdvComboBox;
    cmb_StartHH22: TAdvComboBox;
    cmb_StartMM22: TAdvComboBox;
    cmb_EndHH22: TAdvComboBox;
    cmb_EndMM22: TAdvComboBox;
    cmb_StartHH23: TAdvComboBox;
    cmb_StartMM23: TAdvComboBox;
    cmb_EndHH23: TAdvComboBox;
    cmb_EndMM23: TAdvComboBox;
    cmb_StartHH24: TAdvComboBox;
    cmb_StartMM24: TAdvComboBox;
    cmb_EndHH24: TAdvComboBox;
    cmb_EndMM24: TAdvComboBox;
    lb_List: TLabel;
    Pan_Workcode: TAdvSmoothPanel;
    lb_Name: TAdvSmoothLabel;
    btn_Save: TAdvGlassButton;
    btn_Cancel: TAdvGlassButton;
    ed_Name: TAdvEdit;
    ed_SelectCode: TAdvEdit;
    btn_minimize: TAdvGlowButton;
    btn_Close: TAdvGlowButton;
    AdvOfficeTabSetOfficeStyler2: TAdvOfficeTabSetOfficeStyler;
    lb_TimeCode: TLabel;
    lb_Group1: TLabel;
    lb_Group2: TLabel;
    btn_TimeCodeSave: TAdvGlowButton;
    AdvOfficeTabSet1: TAdvOfficeTabSet;
    lb_SelectName: TLabel;
    lb_SelectCode: TLabel;
    AdvGroupBox1: TAdvGroupBox;
    AdvFormStyler1: TAdvFormStyler;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure menuTabChange(Sender: TObject);
    procedure tv_ListClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure pm_UpdateCodeClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure ed_NameKeyPress(Sender: TObject; var Key: Char);
    procedure tv_ListDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure tv_ListDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure tv_ListDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListResize(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure btn_TimeCodeSaveClick(Sender: TObject);
    procedure mn_GroupTimeCodeClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_minimizeClick(Sender: TObject);
    procedure pan_TimeCodeSettingResize(Sender: TObject);
  private
    L_stMenuID : string;
    L_stButtonCloseCaption : string;
    L_stWork : string;
    L_stMoveCode : string;
    L_nMoveImageIndex : integer;
    procedure FormNameSetting;
    procedure FontSetting;
    procedure SearchList(aCode:string);
    procedure ComboBoxInitialize;
    procedure ComboBoxIndexInitialize;
    procedure SearchTimeCode(aSelectCode:string);
  private
    { Private declarations }
    procedure WMMDIActivate(var Msg: TWMMDIActivate); message WM_MDIACTIVATE;
  public
    IsInsertGrade : Boolean;
    IsUpdateGrade : Boolean;
    IsDeleteGrade : Boolean;
    { Public declarations }
    procedure Form_Close;
    procedure FormChangeEvent(aNumber:integer);
    procedure FormGradeRefresh;
    procedure FormIDSetting(aID:string);
  end;

var
  fmTimeCodeAdmin: TfmTimeCodeAdmin;

implementation
uses
  uComboBoxCodeLoad,
  uCommonFunction,
  uCommonVariable,
  uFormVariable,
  uDataBase,
  uDBFormMessage,
  uDBFunction,
  uDBInsert,
  uDBUpdate,
  uDBDelete,
  uFormFunction,
  uFormUtil,
  uMain;
{$R *.dfm}

procedure TfmTimeCodeAdmin.btn_CancelClick(Sender: TObject);
begin
  inherited;
  Pan_Workcode.Visible := False;
end;

procedure TfmTimeCodeAdmin.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmTimeCodeAdmin.btn_minimizeClick(Sender: TObject);
begin
  inherited;
  WindowState := wsNormal;
end;

procedure TfmTimeCodeAdmin.btn_SaveClick(Sender: TObject);
var
  stMessage : string;
  stParentCode : string;
  stCode : string;
  stNodeNo,stEcuID: string;
  stTime : string;
  stClientIP : string;
begin
  inherited;
  stClientIP:= GetLocalIPAddr;
  stTime := FormatDateTime('yyyymmddhhnnsszzz',now);
  if Trim(ed_Name.Text) = '' then
  begin
    stMessage := dmFormMessage.GetMessage('BLANKFIELD');
    stMessage := StringReplace(stMessage,'$WORK',lb_Name.Caption.Text,[rfReplaceAll]);
    showmessage(stMessage);
    Exit;
  end;
  if L_stWork = 'SELECTCODEUPDATE' then
  begin
    stCode := ed_SelectCode.Text;
    Delete(stCode,1,1);
    stNodeNo := copy(stCode,1,G_nNodeCodeLength);
    stEcuID := copy(stCode,1 + G_nNodeCodeLength,2);
    dmDBUpdate.UpdateTB_DEVICE_Field_StringValue(stNodeNo,stEcuID,'0','DE_DEVICENAME',ed_Name.Text);
    dmDBInsert.InsertIntoTB_SYSTEMLOG_All(copy(stTime,1,8),copy(stTime,9,6),stClientIP,G_stAdminUserID,stNodeNo, stEcuID, '', '0', con_ComLogTYPE_DEVICE, L_stMenuID + '(' + Caption + '): Change');
    tv_List.Items.Item[tv_List.Selected.AbsoluteIndex].Text := ed_Name.Text;
    tv_List.SetFocus;
    fmMain.FORMCHANGE(con_FormBMOSTIMECODEADMIN,'');
    //SearchList(ed_SelectCode.Text);
  end;


  Pan_Workcode.Visible := False;
end;

procedure TfmTimeCodeAdmin.btn_TimeCodeSaveClick(Sender: TObject);
var
  stMessage:string;
  stCode : string;
  bParentGrade : Boolean;
  i,j: Integer;
  arrTime: Array [0..4] of string;
  stNo : string;
  oComboBox : TAdvComboBox;
begin
  inherited;
  stCode := lb_SelectCode.Caption ;
  if stCode = '' then
  begin
    stMessage := dmFormMessage.GetMessage('SELECTERROR');
    stMessage := stringReplace(stMessage,'$WORK',dmFormFunction.GetFormName('0','2','COMMONBUILDING'),[rfReplaceAll]);
    showmessage(stMessage);
    Exit;
  end;
  if stCode[1] <> 'E' then
  begin
    if Application.MessageBox(pchar(dmFormMessage.GetMessage('CHILDTIME')),'Information',MB_OKCANCEL)= IDOK then bParentGrade := True
    else bParentGrade := false;

    if bParentGrade then
    begin
      dmDBDelete.DeleteTB_TIMECODE_BuildingChildAll(stCode);
      dmDBDelete.DeleteTB_TIMECODEDEVICE_BuildingChildAllDevice(stCode);
      for i := 1 to 2 do
      begin
        for j := 1 to 4 do
        begin
          arrTime[j] := '';
          stNo := inttostr(i) + inttostr(j);
          if i = 1 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_Group1),'cmb_StartHH',strtoint(stNo))
          else oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_Group2),'cmb_StartHH',strtoint(stNo));
          if oComboBox <> nil then
          begin
            arrTime[j] := arrTime[j] + FillZeroStrnum(oComboBox.Text,2);
          end;
          if i = 1 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_Group1),'cmb_StartMM',strtoint(stNo))
          else oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_Group2),'cmb_StartMM',strtoint(stNo));
          if oComboBox <> nil then
          begin
            arrTime[j] := arrTime[j] + FillZeroStrnum(oComboBox.Text,2);
          end;
          if i = 1 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_Group1),'cmb_ENDHH',strtoint(stNo))
          else oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_Group2),'cmb_ENDHH',strtoint(stNo));
          if oComboBox <> nil then
          begin
            arrTime[j] := arrTime[j] + FillZeroStrnum(oComboBox.Text,2);
          end;
          if i = 1 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_Group1),'cmb_ENDMM',strtoint(stNo))
          else oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_Group2),'cmb_ENDMM',strtoint(stNo));
          if oComboBox <> nil then
          begin
            arrTime[j] := arrTime[j] + FillZeroStrnum(oComboBox.Text,2);
          end;
        end;
        dmDBInsert.InsertIntoTB_TIMECODE_BuildingChildAll(stCode,inttostr(i-1),arrTime[1],arrTime[2],arrTime[3],arrTime[4],'N');
        dmDBInsert.InsertIntoTB_TIMECODEDEVICE_BuildingChildAllDevice(stCode,inttostr(i-1),arrTime[1],arrTime[2],arrTime[3],arrTime[4],'N');
      end;
    end else
    begin
      dmDBDelete.DeleteTB_TIMECODE_Building(stCode);
      dmDBDelete.DeleteTB_TIMECODEDEVICE_BuildingDevice(stCode);
       for i := 1 to 2 do
      begin
        for j := 1 to 4 do
        begin
          arrTime[j] := '';
          stNo := inttostr(i) + inttostr(j);
          if i = 1 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_Group1),'cmb_StartHH',strtoint(stNo))
          else oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_Group2),'cmb_StartHH',strtoint(stNo));
          if oComboBox <> nil then
          begin
            arrTime[j] := arrTime[j] + oComboBox.Text;
          end;
          if i = 1 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_Group1),'cmb_StartMM',strtoint(stNo))
          else oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_Group2),'cmb_StartMM',strtoint(stNo));
          if oComboBox <> nil then
          begin
            arrTime[j] := arrTime[j] + oComboBox.Text;
          end;
          if i = 1 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_Group1),'cmb_ENDHH',strtoint(stNo))
          else oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_Group2),'cmb_ENDHH',strtoint(stNo));
          if oComboBox <> nil then
          begin
            arrTime[j] := arrTime[j] + oComboBox.Text;
          end;
          if i = 1 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_Group1),'cmb_ENDMM',strtoint(stNo))
          else oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_Group2),'cmb_ENDMM',strtoint(stNo));
          if oComboBox <> nil then
          begin
            arrTime[j] := arrTime[j] + oComboBox.Text;
          end;
        end;
        dmDBInsert.InsertIntoTB_TIMECODE_Building(stCode,inttostr(i-1),arrTime[1],arrTime[2],arrTime[3],arrTime[4],'N');
        dmDBInsert.InsertIntoTB_TIMECODEDEVICE_BuildingDevice(stCode,inttostr(i-1),arrTime[1],arrTime[2],arrTime[3],arrTime[4],'N');
      end;
   end;
  end else
  begin
    dmDBDelete.DeleteTB_TIMECODEDEVICE_DeviceAll(copy(stCode,2,G_nNodeCodeLength),copy(stCode,2 + G_nNodeCodeLength,2));
    for i := 1 to 2 do
    begin
      for j := 1 to 4 do
      begin
        arrTime[j] := '';
        stNo := inttostr(i) + inttostr(j);
        if i = 1 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_Group1),'cmb_StartHH',strtoint(stNo))
        else oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_Group2),'cmb_StartHH',strtoint(stNo));
        if oComboBox <> nil then
        begin
          arrTime[j] := arrTime[j] + oComboBox.Text;
        end;
        if i = 1 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_Group1),'cmb_StartMM',strtoint(stNo))
        else oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_Group2),'cmb_StartMM',strtoint(stNo));
        if oComboBox <> nil then
        begin
          arrTime[j] := arrTime[j] + oComboBox.Text;
        end;
        if i = 1 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_Group1),'cmb_ENDHH',strtoint(stNo))
        else oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_Group2),'cmb_ENDHH',strtoint(stNo));
        if oComboBox <> nil then
        begin
          arrTime[j] := arrTime[j] + oComboBox.Text;
        end;
        if i = 1 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_Group1),'cmb_ENDMM',strtoint(stNo))
        else oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_Group2),'cmb_ENDMM',strtoint(stNo));
        if oComboBox <> nil then
        begin
          arrTime[j] := arrTime[j] + oComboBox.Text;
        end;
      end;
      dmDBInsert.InsertIntoTB_TIMECODEDEVICE_Value(copy(stCode,2,G_nNodeCodeLength),copy(stCode,2 + G_nNodeCodeLength,2),inttostr(i-1),arrTime[1],arrTime[2],arrTime[3],arrTime[4],'N');
      dmDBUpdate.UpdateTB_DEVICE_Field_IntValue(copy(stCode,2,G_nNodeCodeLength),copy(stCode,2 + G_nNodeCodeLength,2),'0','DE_TIMECODETYPE','1');
    end;
  end;
  stMessage := dmFormMessage.GetMessage('WORKSUCCESS');
  stMessage := stringReplace(stMessage,'$WORK',btn_TimeCodeSave.Caption,[rfReplaceAll]);
  showmessage(stMessage);
  //SearchList(stCode);
end;

procedure TfmTimeCodeAdmin.ComboBoxIndexInitialize;
var
  i,j,k : integer;
  stNo : string;
  oComboBox : TAdvComboBox;
begin
  for i := 1 to 2 do
  begin
    for j := 1 to 4 do
    begin
      stNo := inttostr(i) + inttostr(j);
      if i = 1 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_Group1),'cmb_StartHH',strtoint(stNo))
      else oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_Group2),'cmb_StartHH',strtoint(stNo));
      if oComboBox <> nil then
      begin
        oComboBox.ItemIndex := 0;
      end;
      if i = 1 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_Group1),'cmb_StartMM',strtoint(stNo))
      else oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_Group2),'cmb_StartMM',strtoint(stNo));
      if oComboBox <> nil then
      begin
        oComboBox.ItemIndex := 0;
      end;
      if i = 1 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_Group1),'cmb_EndHH',strtoint(stNo))
      else oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_Group2),'cmb_EndHH',strtoint(stNo));
      if oComboBox <> nil then
      begin
        oComboBox.ItemIndex := 0;
      end;
      if i = 1 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_Group1),'cmb_EndMM',strtoint(stNo))
      else oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_Group2),'cmb_EndMM',strtoint(stNo));
      if oComboBox <> nil then
      begin
        oComboBox.ItemIndex := 0;
      end;
    end;
  end;
end;

procedure TfmTimeCodeAdmin.ComboBoxInitialize;
var
  i,j,k : integer;
  stNo : string;
  oComboBox : TAdvComboBox;
begin
  for i := 1 to 2 do
  begin
    for j := 1 to 4 do
    begin
      stNo := inttostr(i) + inttostr(j);
      if i = 1 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_Group1),'cmb_StartHH',strtoint(stNo))
      else oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_Group2),'cmb_StartHH',strtoint(stNo));
      if oComboBox <> nil then
      begin
        oComboBox.Items.Clear;
        for k := 0 to 23 do oComboBox.Items.Add(FillZeroNumber(k,2));
        oComboBox.ItemIndex := 0;
        //oComboBox.Style := csDropDownList;
      end;
      if i = 1 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_Group1),'cmb_StartMM',strtoint(stNo))
      else oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_Group2),'cmb_StartMM',strtoint(stNo));
      if oComboBox <> nil then
      begin
        oComboBox.Items.Clear;
        for k := 0 to 11 do oComboBox.Items.Add(FillZeroNumber(k * 5,2));
        oComboBox.ItemIndex := 0;
        //oComboBox.Style := csDropDownList;
      end;
      if i = 1 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_Group1),'cmb_EndHH',strtoint(stNo))
      else oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_Group2),'cmb_EndHH',strtoint(stNo));
      if oComboBox <> nil then
      begin
        oComboBox.Items.Clear;
        for k := 0 to 24 do oComboBox.Items.Add(FillZeroNumber(k,2));
        oComboBox.ItemIndex := 0;
        //oComboBox.Style := csDropDownList;
      end;
      if i = 1 then oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_Group1),'cmb_EndMM',strtoint(stNo))
      else oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_Group2),'cmb_EndMM',strtoint(stNo));
      if oComboBox <> nil then
      begin
        oComboBox.Items.Clear;
        for k := 0 to 11 do oComboBox.Items.Add(FillZeroNumber(k * 5,2));
        oComboBox.ItemIndex := 0;
        //oComboBox.Style := csDropDownList;
      end;
    end;
  end;
end;

procedure TfmTimeCodeAdmin.ed_NameKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    Key := #0;
    btn_SaveClick(self);
  end;
end;

procedure TfmTimeCodeAdmin.FontSetting;
begin
(*  dmFormUtil.TravelFormFontSetting(self,G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.TravelAdvOfficeTabSetOfficeStylerFontSetting(AdvOfficeTabSetOfficeStyler1, G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.FormAdvOfficeTabSetOfficeStylerSetting(AdvOfficeTabSetOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormAdvToolBarOfficeStylerSetting(AdvToolBarOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormStyleSetting(self,AdvToolBarOfficeStyler1);
  *)
end;

procedure TfmTimeCodeAdmin.FormChangeEvent(aNumber: integer);
begin

end;

procedure TfmTimeCodeAdmin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  fmMain.FORMENABLE(con_FormBMOSTIMECODEADMIN,'FALSE');

  Action := caFree;
end;

procedure TfmTimeCodeAdmin.FormCreate(Sender: TObject);
begin
  inherited;
  if G_nFormLanguageType = 1 then
  begin
    ed_name.ImeMode := imSHanguel; // imHanguel;
    ed_name.ImeName := '';
  end else if G_nFormLanguageType = 2 then
  begin
    ed_name.ImeMode := imAlpha;
    ed_name.ImeName := '';
  end;
  tv_Code.Left := -400;
  ComboBoxInitialize;
  FontSetting;
end;

procedure TfmTimeCodeAdmin.FormGradeRefresh;
begin
  if IsInsertGrade or IsUpdateGrade or IsDeleteGrade then PopupMenu := pm_Work;
//  pm_DeleteCode.Enabled := IsDeleteGrade;
  pm_UpdateCode.Enabled := IsUpdateGrade;
end;

procedure TfmTimeCodeAdmin.FormIDSetting(aID: string);
begin
  L_stMenuID := aID;
end;

procedure TfmTimeCodeAdmin.FormNameSetting;
begin
  AdvOfficePager11.Caption := dmFormFunction.GetFormName('0','2','BUTTONMENU002');
  lb_List.Caption := dmFormFunction.GetFormName('0','2','COMMONDEVICELIST');
  btn_Save.Caption := dmFormFunction.GetFormName('0','2','BUTTONSAVE001');
  btn_TimeCodeSave.Caption := dmFormFunction.GetFormName('0','2','BUTTONAPPLY');
  btn_Cancel.Caption := dmFormFunction.GetFormName('0','2','BUTTONCANCEL001');
  lb_Name.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONDEVICENAME');
  lb_TimeCode.Caption := dmFormFunction.GetFormName('0','2','COMMONTIMECODE');
  AdvOfficeTabSet1.AdvOfficeTabs[0].Caption := dmFormFunction.GetFormName('0','2','COMMONSELECTBUILDING');
  lb_Group1.Caption := dmFormFunction.GetFormName('0','2','COMMONGROUP') + '1';
  lb_Group2.Caption := dmFormFunction.GetFormName('0','2','COMMONGROUP') + '2';
  lb_Time11.Caption := dmFormFunction.GetFormName('0','2','COMMONTIME02') + '1';
  lb_Time12.Caption := dmFormFunction.GetFormName('0','2','COMMONTIME02') + '2';
  lb_Time13.Caption := dmFormFunction.GetFormName('0','2','COMMONTIME02') + '3';
  lb_Time14.Caption := dmFormFunction.GetFormName('0','2','COMMONTIME02') + '4';
  lb_Time21.Caption := dmFormFunction.GetFormName('0','2','COMMONTIME02') + '1';
  lb_Time22.Caption := dmFormFunction.GetFormName('0','2','COMMONTIME02') + '2';
  lb_Time23.Caption := dmFormFunction.GetFormName('0','2','COMMONTIME02') + '3';
  lb_Time24.Caption := dmFormFunction.GetFormName('0','2','COMMONTIME02') + '4';
  lb_StartHH11.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_StartHH12.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_StartHH13.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_StartHH14.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_StartHH21.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_StartHH22.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_StartHH23.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_StartHH24.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_StartMM11.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_StartMM12.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_StartMM13.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_StartMM14.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_StartMM21.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_StartMM22.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_StartMM23.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_StartMM24.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');

  lb_EndHH11.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_EndHH12.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_EndHH13.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_EndHH14.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_EndHH21.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_EndHH22.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_EndHH23.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_EndHH24.Caption := dmFormFunction.GetFormName('0','2','COMMONHH');
  lb_EndMM11.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_EndMM12.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_EndMM13.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_EndMM14.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_EndMM21.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_EndMM22.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_EndMM23.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');
  lb_EndMM24.Caption := dmFormFunction.GetFormName('0','2','COMMONMM');

end;

procedure TfmTimeCodeAdmin.FormResize(Sender: TObject);
begin
  inherited;
  BodyPanel.Left := 0;
  BodyPanel.Top := 0;
//  BodyPanel.Height := Height - menuTab.Height;
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

end;

procedure TfmTimeCodeAdmin.FormShow(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;

  FormNameSetting;
  fmMain.FORMENABLE(con_FormBMOSTIMECODEADMIN,'TRUE');

//  menuTab.ActiveTabIndex := 1;
  menuTabChange(self);
  SearchList('');
  tv_ListClick(self);
end;

procedure TfmTimeCodeAdmin.Form_Close;
begin
  Close;
end;

procedure TfmTimeCodeAdmin.ListResize(Sender: TObject);
begin
  inherited;

  tv_List.Height := List.Height - tv_List.Top - 30;
  tv_List.Width := List.Width - tv_List.Left - 20;
end;

procedure TfmTimeCodeAdmin.MenuItem3Click(Sender: TObject);
var
  stMessage : string;
  stBuildingCode : string;
  stNodeNo : string;
  stEcuID : string;
begin
  inherited;
  if tv_List.Selected = nil then
  begin
    stMessage := dmFormMessage.GetMessage('SELECTERROR');
    stMessage := stringReplace(stMessage,'$WORK',pm_UpdateCode.Caption,[rfReplaceAll]);
    showmessage(stMessage);
    Exit;
  end;
  stBuildingCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  if copy(stBuildingCode,1,1) = 'E' then Exit;
  if copy(L_stMoveCode,1,1) <> 'E' then Exit;
  stNodeNo := copy(L_stMoveCode,2,G_nNodeCodeLength);
  stEcuID := copy(L_stMoveCode,2 + G_nNodeCodeLength,2);

  dmDBUpdate.UpdateTB_DEVICE_Field_StringValue(stNodeNo,stEcuID,'0','BC_BUILDINGCODE',stBuildingCode);
  dmDBUpdate.UpdateTB_DEVICE_Field_StringValue(stNodeNo,stEcuID,'0','DE_NAMECHANGE','1');

  if L_nMoveImageIndex <> con_LocalDeviceMyTypeImage  then
  begin
    dmDBDelete.DeleteTB_TIMECODEDEVICE_DeviceAll(stNodeNo,stEcuID);
    dmDBInsert.InsertIntoTB_TIMECODEDEVICE_TimeCodeToDevice(stNodeNo,stEcuID,stBuildingCode);
  end;
  SearchList(L_stMoveCode);
end;

procedure TfmTimeCodeAdmin.menuTabChange(Sender: TObject);
begin
  inherited;
(*  if menuTab.ActiveTabIndex = 0 then //Ȩ
  begin
    if menuTab.AdvOfficeTabs.Items[0].Caption = L_stButtonCloseCaption then Close
    else
    begin
      menuTab.ActiveTabIndex := 1;
      menuTabChange(self);
    end;
  end;  *)
end;

procedure TfmTimeCodeAdmin.mn_GroupTimeCodeClick(Sender: TObject);
var
  stMessage : string;
  stCode : string;
  stNodeNo : string;
  stEcuID : string;
  stBuildingCode : string;
begin
  inherited;
  if tv_List.Selected = nil then
  begin
    stMessage := dmFormMessage.GetMessage('SELECTERROR');
    stMessage := stringReplace(stMessage,'$WORK',pm_UpdateCode.Caption,[rfReplaceAll]);
    showmessage(stMessage);
    Exit;
  end;
  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  if copy(stCode,1,1) <> 'E' then Exit;
  stNodeNo := copy(stCode,2,G_nNodeCodeLength);
  stEcuID := copy(stCode,2 + G_nNodeCodeLength,2);
  stBuildingCode := dmDBFunction.getTB_DEVICE_BuildingCode(stNodeNo,stEcuID,'0');

  dmDBDelete.DeleteTB_TIMECODEDEVICE_DeviceAll(stNodeNo,stEcuID);
  dmDBInsert.InsertIntoTB_TIMECODEDEVICE_TimeCodeToDevice(stNodeNo,stEcuID,stBuildingCode);
  dmDBUpdate.UpdateTB_DEVICE_Field_IntValue(stNodeNo,stEcuID,'0','DE_TIMECODETYPE','0');

  SearchList(stCode);
end;

procedure TfmTimeCodeAdmin.N2Click(Sender: TObject);
var
  stMessage : string;
begin
  inherited;
  if tv_List.Selected = nil then
  begin
    stMessage := dmFormMessage.GetMessage('SELECTERROR');
    stMessage := stringReplace(stMessage,'$WORK',pm_UpdateCode.Caption,[rfReplaceAll]);
    showmessage(stMessage);
    Exit;
  end;
  L_stMoveCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  L_nMoveImageIndex := tv_List.Selected.ImageIndex;
  if copy(L_stMoveCode,1,1) <> 'E' then
  begin
    L_stMoveCode := '';
    Exit;
  end;

end;

procedure TfmTimeCodeAdmin.pan_TimeCodeSettingResize(Sender: TObject);
begin
  inherited;
  AdvOfficeTabSet1.Width := pan_TimeCodeSetting.Width - (AdvOfficeTabSet1.Left * 2);
  Gb_Group1.Width := pan_TimeCodeSetting.Width - (Gb_Group1.Left * 2);
  Gb_Group2.Width := pan_TimeCodeSetting.Width - (Gb_Group2.Left * 2);
  btn_TimeCodeSave.Left := Gb_Group2.Left + Gb_Group2.Width - btn_TimeCodeSave.Width;

end;

procedure TfmTimeCodeAdmin.pm_UpdateCodeClick(Sender: TObject);
var
  stMessage : string;
begin
  inherited;
  if tv_List.Selected = nil then
  begin
    stMessage := dmFormMessage.GetMessage('SELECTERROR');
    stMessage := stringReplace(stMessage,'$WORK',pm_UpdateCode.Caption,[rfReplaceAll]);
    showmessage(stMessage);
    Exit;
  end;
  ed_SelectCode.Text := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  if copy(ed_SelectCode.Text,1,1) <> 'E' then Exit;

  Pan_Workcode.Visible := True;
  Pan_Workcode.Caption.Text := pm_UpdateCode.Caption;
  ed_Name.Text := tv_List.Items.Item[tv_List.Selected.AbsoluteIndex].Text;
  L_stWork := 'SELECTCODEUPDATE';
  ed_Name.SetFocus;
end;

procedure TfmTimeCodeAdmin.SearchList(aCode: string);
var
  aTreeView : TTreeview;
  vTreeView : TTreeview;
  aNode,bNode,cNode,dNode : TTreeNode;
  vNode1,vNode2,vNode3 : TTreeNode;
  stSql : string;
  TempAdoQuery : TADOQuery;
  stParentCode : string;
  nDeepSeq : integer;
  stDoorAllCode : string;
begin
  L_stMoveCode := '';
  aTreeView := tv_List;
  aTreeView.ReadOnly:= True;
  aTreeView.Items.Clear;
  vTreeView := tv_Code;
  vTreeView.ReadOnly := True;
  vTreeView.Items.Clear;
  LoadBuildingTreeView('',tv_List,tv_Code,0);

(*  stSql := ' Select * from TB_BUILDINGCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND BC_CODEUSE = ''1'' ';
  if Not G_bIsMaster then
  begin
    if G_nAdminBuildingType = 0 then
        stSql := stSql + ' AND BC_BUILDINGCODE Like ''' + G_stAdminBuildingCode + '%'' ';
  end;
  stSql := stSql + ' Order by BC_DEEPSEQ,BC_VIEWSEQ ';
*)
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
(*      Close;
      sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if RecordCount < 1 then Exit;
      First;
      While Not Eof do
      begin
        if FindField('BC_DEEPSEQ').AsInteger = 0 then
        begin
          aNode := aTreeView.Items.Add(nil,FindField('BC_BUILDINGNAME').AsString);
          vTreeView.Items.AddChild(nil,FindField('BC_BUILDINGCODE').AsString);
          aNode.Expanded := True;
        end else
        begin
          nDeepSeq := FindField('BC_DEEPSEQ').AsInteger;
          stParentCode := copy(FindField('BC_BUILDINGCODE').AsString,1,1 + ((nDeepSeq - 1) * G_nBuildingCodeLength) );
          vNode1:= GetNodeByText(vTreeView,stParentCode,True);
          if vNode1 <> nil then
          begin
            bNode := aTreeView.Items.Item[vNode1.AbsoluteIndex];
            if bNode <> nil then
            begin
              cNode:= aTreeView.Items.AddChild(bNode,FindField('BC_BUILDINGNAME').AsString);
              cNode.ImageIndex := con_LocalBuildingImageIndex;
              cNode.SelectedIndex := con_LocalBuildingImageIndex;
            end;
            vNode2:= vTreeView.Items.Item[vNode1.AbsoluteIndex];
            if vNode2 <> nil then
            begin
              vNode3:= vTreeView.Items.AddChild(vNode2,FindField('BC_BUILDINGCODE').AsString);
            end;
            bNode.Expanded := True;
            vNode1.Expanded := True;
            if aCode = FindField('BC_BUILDINGCODE').AsString  then
            begin
              if cNode <> nil then cNode.Selected := True;
            end;
          end;
        end;
        Next;
      end;
*)
      //Exit; //2016년 위치별 test

      stSql := ' Select * from TB_DEVICE ';
      stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
      stSql := stSql + ' AND DE_DEVICEUSE = ''1'' ';
      stSql := stSql + ' AND DE_EXTENDID = 0 ';
      if Not G_bIsMaster then
      begin
        if G_nAdminBuildingType = 0 then
            stSql := stSql + ' AND BC_BUILDINGCODE Like ''' + G_stAdminBuildingCode + '%'' ';
      end;

      Close;
      sql.Text := stSql;
      Try
        Open;
      Except
        dmDataBase.DBConnected := False;
        Exit;
      End;
      if RecordCount < 1 then Exit;
      While Not Eof do
      begin
        stParentCode := FindField('BC_BUILDINGCODE').AsString;
        if Trim(stParentCode) = '' then stParentCode := '0';
        vNode1:= GetNodeByText(vTreeView,stParentCode,True);
        if vNode1 <> nil then
        begin
          bNode := aTreeView.Items.Item[vNode1.AbsoluteIndex];
          if bNode <> nil then
          begin
            cNode:= aTreeView.Items.AddChild(bNode,FindField('DE_DEVICENAME').AsString);
            if FindField('DE_TIMECODETYPE').AsInteger = 1 then
            begin
              cNode.ImageIndex := con_LocalDeviceMyTypeImage;
              cNode.SelectedIndex := con_LocalDeviceMyTypeImage;
            end else
            begin
              cNode.ImageIndex := con_LocalDeviceImageIndex;
              cNode.SelectedIndex := con_LocalDeviceImageIndex;
            end;
          end;
          vNode2:= vTreeView.Items.Item[vNode1.AbsoluteIndex];
          if vNode2 <> nil then
          begin
            stDoorAllCode := 'E' + FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength) + FindField('DE_ECUID').AsString;
            vNode3:= vTreeView.Items.AddChild(vNode2,stDoorAllCode);
          end;
          bNode.Expanded := True;
          vNode1.Expanded := True;
          if aCode = stDoorAllCode  then
          begin
            if cNode <> nil then cNode.Selected := True;
          end;
        end;
        Next;
      end;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  tv_List.SetFocus;
end;

procedure TfmTimeCodeAdmin.SearchTimeCode(aSelectCode: string);
var
  stSql : string;
  stNodeNo : string;
  stEcuID : string;
  TempAdoQuery : TADOQuery;
  oComboBox : TAdvComboBox;
  i,j : integer;
  stTemp : string;
begin
  if aSelectCode = '' then Exit;

  if aSelectCode[1] = 'E' then
  begin
    stNodeNo := copy(aSelectCode,2,G_nNodeCodeLength);
    stEcuID := copy(aSelectCode,2 + G_nNodeCodeLength,2);
    stSql := 'select TC_GROUP,TC_TIME1,TC_TIME2,TC_TIME3,TC_TIME4 from TB_TIMECODEDEVICE ';
    stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND ND_NODENO = ' + stNodeNo + ' ';
    stSql := stSql + ' AND DE_ECUID = ''' + stEcuID + ''' ';
  end else
  begin
    stSql := 'select TC_GROUP,TC_TIME1,TC_TIME2,TC_TIME3,TC_TIME4 from TB_TIMECODE ';
    stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND BC_BUILDINGCODE = ''' + aSelectCode + ''' ';
  end;

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
        if FindField('TC_GROUP').AsString = '0' then
        begin
          for i := 1 to 4 do
          begin
            stTemp := FindField('TC_TIME' + inttostr(i)).AsString;
            oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_Group1),'cmb_StartHH',strtoint('1' + inttostr(i)));
            if oComboBox <> nil then
            begin
              oComboBox.ItemIndex := oComboBox.Items.IndexOf(copy(stTemp,1,2));
            end;
            oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_Group1),'cmb_StartMM',strtoint('1' + inttostr(i)));
            if oComboBox <> nil then
            begin
              oComboBox.ItemIndex := oComboBox.Items.IndexOf(copy(stTemp,3,2));
            end;
            oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_Group1),'cmb_ENDHH',strtoint('1' + inttostr(i)));
            if oComboBox <> nil then
            begin
              oComboBox.ItemIndex := oComboBox.Items.IndexOf(copy(stTemp,5,2));
            end;
            oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_Group1),'cmb_ENDMM',strtoint('1' + inttostr(i)));
            if oComboBox <> nil then
            begin
              oComboBox.ItemIndex := oComboBox.Items.IndexOf(copy(stTemp,7,2));
            end;
          end;
        end else if FindField('TC_GROUP').AsString = '1' then
        begin
          for i := 1 to 4 do
          begin
            stTemp := FindField('TC_TIME' + inttostr(i)).AsString;
            oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_Group2),'cmb_StartHH',strtoint('2' + inttostr(i)));
            if oComboBox <> nil then
            begin
              oComboBox.ItemIndex := oComboBox.Items.IndexOf(copy(stTemp,1,2));
            end;
            oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_Group2),'cmb_StartMM',strtoint('2' + inttostr(i)));
            if oComboBox <> nil then
            begin
              oComboBox.ItemIndex := oComboBox.Items.IndexOf(copy(stTemp,3,2));
            end;
            oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_Group2),'cmb_ENDHH',strtoint('2' + inttostr(i)));
            if oComboBox <> nil then
            begin
              oComboBox.ItemIndex := oComboBox.Items.IndexOf(copy(stTemp,5,2));
            end;
            oComboBox := dmFormFunction.TravelGroupAdvComboBoxItem(TGroupbox(Gb_Group2),'cmb_ENDMM',strtoint('2' + inttostr(i)));
            if oComboBox <> nil then
            begin
              oComboBox.ItemIndex := oComboBox.Items.IndexOf(copy(stTemp,7,2));
            end;
          end;
        end;

        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmTimeCodeAdmin.tv_ListClick(Sender: TObject);
var
  stCode : string;
begin
  inherited;
  if tv_List.Selected = nil then tv_List.Items[0].Selected := True;

  stCode := tv_Code.Items.Item[tv_List.Selected.AbsoluteIndex].Text;

  lb_SelectName.Caption := tv_List.Selected.Text;
  lb_SelectCode.Caption := stCode;

  if copy(stCode,1,1) = 'E' then
  begin
    popupmenu := pm_Work;
    if tv_List.Items.item[tv_List.Selected.AbsoluteIndex].ImageIndex = con_LocalDeviceMyTypeImage then mn_GroupTimeCode.Visible := True
    else mn_GroupTimeCode.Visible := False;

  end else
  begin
    if L_stMoveCode = '' then popupmenu := nil
    else popupmenu := pm_Building;
  end;
  ComboBoxIndexInitialize;
  SearchTimeCode(lb_SelectCode.Caption);
end;

procedure TfmTimeCodeAdmin.tv_ListDblClick(Sender: TObject);
begin
  inherited;
  pm_UpdateCodeClick(self);
end;

procedure TfmTimeCodeAdmin.tv_ListDragDrop(Sender, Source: TObject; X, Y: Integer);
var
  currentItem, dropItem : TTreeNode;
  stOrgCode : string;
  stBuildingCode : string;
  stCode : string;
  stDeepSeq,stViewSeq : string;
  stSql : string;
  stNodeNo,stEcuID:string;
begin
  inherited;
  if Sender = Source then
  begin
    with TTreeView(Sender) do
    begin
      dropItem :=GetNodeAt(X,Y);
      currentItem := Selected;
      if currentItem.AbsoluteIndex = 0 then Exit;   //루트디렉토리가 움직일수는 없다
      stBuildingCode := tv_Code.Items[dropItem.AbsoluteIndex].Text;
      if copy(stBuildingCode,1,1) = 'E' then Exit; //옮기려는 위치가 컨트롤러이면 빠져 나가자
      stOrgCode := tv_Code.Items[currentItem.AbsoluteIndex].Text;
      if copy(stOrgCode,1,1) <> 'E' then Exit;
      stNodeNo := copy(stOrgCode,2,G_nNodeCodeLength);
      stEcuID := copy(stOrgCode,2 + G_nNodeCodeLength,2);
      dmDBUpdate.UpdateTB_DEVICE_Field_StringValue(stNodeNo,stEcuID,'0','BC_BUILDINGCODE',stBuildingCode);
      dmDBUpdate.UpdateTB_DEVICE_Field_StringValue(stNodeNo,stEcuID,'0','DE_NAMECHANGE','1');

      if currentItem.ImageIndex <> con_LocalDeviceMyTypeImage  then
      begin
        dmDBDelete.DeleteTB_TIMECODEDEVICE_DeviceAll(stNodeNo,stEcuID);
        dmDBInsert.InsertIntoTB_TIMECODEDEVICE_TimeCodeToDevice(stNodeNo,stEcuID,stBuildingCode);
      end;
    end;
  end;
  SearchList(stCode);
end;

procedure TfmTimeCodeAdmin.tv_ListDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Sender = tv_List;
end;

procedure TfmTimeCodeAdmin.WMMDIActivate(var Msg: TWMMDIActivate);
var
  Style: Longint;
begin
  if (Msg.ActiveWnd = Handle) and (biSystemMenu in BorderIcons) then
  begin
    Style := GetWindowLong(Handle, GWL_STYLE);
    if (Style and WS_MAXIMIZE <> 0) and (Style and WS_SYSMENU = 0) then
      SendMessage(Handle, WM_SIZE, SIZE_RESTORED, 0);
  end;
  inherited;
end;

initialization
  RegisterClass(TfmTimeCodeAdmin);
Finalization
  UnRegisterClass(TfmTimeCodeAdmin);

end.