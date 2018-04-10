unit uFoodReaderSetting;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, W7Classes, W7Panels, AdvOfficeTabSet,
  AdvOfficeTabSetStylers, AdvSmoothPanel, Vcl.ExtCtrls, AdvSmoothLabel,
  Vcl.StdCtrls, AdvEdit, Vcl.Buttons, Vcl.Grids, AdvObj, BaseGrid, AdvGrid,
  AdvToolBtn,ADODB,ActiveX, uSubForm, CommandArray,Winapi.WinSpool,System.iniFiles,
  AdvGroupBox, FolderDialog, AdvGlassButton, AdvGlowButton, ToolPanels, AdvCombo,
  Vcl.Menus, AdvTabSet, AdvPageControl, Vcl.ComCtrls, Vcl.Imaging.pngimage,
  AdvOfficePager, AdvOfficePagerStylers, AdvAppStyler, Vcl.ImgList;

const
  con_LocalBuildingImageIndex = 1;

type
  TfmFoodReaderSetting = class(TfmASubForm)
    Image1: TImage;
    BodyPanel: TW7Panel;
    menuTab: TAdvOfficeTabSet;
    Config: TAdvSmoothPanel;
    FolderDialog1: TFolderDialog;
    ATConfig: TAdvSmoothPanel;
    panATCode: TAdvToolPanel;
    Label9: TLabel;
    sg_Reader: TAdvStringGrid;
    cmb_Node: TAdvComboBox;
    Label1: TLabel;
    cmb_Ecu: TAdvComboBox;
    AdvGroupBox1: TAdvGroupBox;
    Label2: TLabel;
    cmb_FDUse: TAdvComboBox;
    AdvOfficePager1: TAdvOfficePager;
    AdvOfficePage1: TAdvOfficePage;
    btn_minimize: TAdvGlowButton;
    btn_Close: TAdvGlowButton;
    AdvFormStyler1: TAdvFormStyler;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    btn_Save: TAdvGlowButton;
    btn_ReaderBuildingSetting: TAdvGlowButton;
    pan_Building: TAdvSmoothPanel;
    lb_Building: TLabel;
    tv_buildingName: TTreeView;
    btn_BuildingSelect: TAdvGlowButton;
    btn_BuildingCancel: TAdvGlowButton;
    tv_buildingCode: TTreeView;
    MenuImageList16: TImageList;
    Label3: TLabel;
    cmb_FDGubun: TAdvComboBox;
    btn_FoodGubunAdd: TAdvGlowButton;
    procedure menuTabChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btn_addClick(Sender: TObject);
    procedure cmb_NodeChange(Sender: TObject);
    procedure cmb_EcuChange(Sender: TObject);
    procedure sg_ReaderClick(Sender: TObject);
    procedure sg_ReaderCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_ReaderBuildingSettingClick(Sender: TObject);
    procedure btn_BuildingCancelClick(Sender: TObject);
    procedure btn_BuildingSelectClick(Sender: TObject);
    procedure btn_FoodGubunAddClick(Sender: TObject);
  private
    { Private declarations }
    APCodeList : TStringList;
    NodeCodeList : TStringList;
    DeviceCodeList : TStringList;
    L_nReaderCheckCount : integer;
    Function FormClear:Boolean;
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);
  private
    { Private declarations }
    procedure SearchReader(aReaderNo:string);
  public
    { Public declarations }
    procedure Form_Close;
    procedure FormGradeRefresh;
    procedure FormIDSetting(aID:string);
  end;

var
  fmFoodReaderSetting: TfmFoodReaderSetting;

implementation
uses
  uComboBoxCodeLoad,
  uCommonFunction,
  uCommonVariable,
  uDataBase,
  uDBDelete,
  uDBFunction,
  uDBInsert,
  uDBUpdate,
  uFormFunction,
  uFormVariable,
  uDBFormMessage,
  uDBSelect, uFoodGubun;

{$R *.dfm}



procedure TfmFoodReaderSetting.cmb_EcuChange(Sender: TObject);
begin
  inherited;
  SearchReader('');

end;

procedure TfmFoodReaderSetting.cmb_NodeChange(Sender: TObject);
begin
  inherited;
  if cmb_Node.ItemIndex > -1 then
     LoadDevice(NodeCodeList.Strings[cmb_Node.ItemIndex], DeviceCodeList,TComboBox(cmb_Ecu),True,dmFormFunction.GetFormName('0','2','COMMONALLNAME'));
  SearchReader('');

end;

function TfmFoodReaderSetting.FormClear: Boolean;
begin
end;

procedure TfmFoodReaderSetting.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
(*  self.FindSubForm('Main').FindCommand('FORMENABLE').Params.Values['NAME'] := inttostr(con_FormAFSFoodReader);
  self.FindSubForm('Main').FindCommand('FORMENABLE').Params.Values['VALUE'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('FORMENABLE').Execute;
*)
  APCodeList.Free;
  NodeCodeList.Free;
  DeviceCodeList.Free;

  Action := caFree;
end;

procedure TfmFoodReaderSetting.FormCreate(Sender: TObject);
begin
  //Height := 420;
  APCodeList := TStringList.Create;
  NodeCodeList := TStringList.Create;
  DeviceCodeList := TStringList.Create;


  LoadNode(NodeCodeList,TComboBox(cmb_Node),True,dmFormFunction.GetFormName('0','2','COMMONALLNAME'));
  cmb_Node.ItemIndex := 0;
  LoadDevice(NodeCodeList.Strings[cmb_Node.ItemIndex], DeviceCodeList,TComboBox(cmb_Ecu),True,dmFormFunction.GetFormName('0','2','COMMONALLNAME'));

  LoadFoodTypeCode(TComboBox(cmb_FDUse),True,'0.미사용');
  LoadFoodGROUP(TComboBox(cmb_FDGubun),True,'0.미사용');

  if cmb_FDUse.Items.Count > 1 then
     cmb_FDUse.ItemIndex := 1;

  SearchReader('');
end;


procedure TfmFoodReaderSetting.FormGradeRefresh;
begin
end;

procedure TfmFoodReaderSetting.FormIDSetting(aID: string);
begin
end;

procedure TfmFoodReaderSetting.FormResize(Sender: TObject);
begin
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
  pan_Building.Left := (width div 2) - (pan_Building.Width div 2);
  pan_Building.Top := (Height div 2) - (pan_Building.Height div 2);

end;

procedure TfmFoodReaderSetting.FormShow(Sender: TObject);
var
  stComPort : string;
  nIndex : integer;
begin
  top := 0;
  Left := 0;
  Width := BodyPanel.Width;

(*  self.FindSubForm('Main').FindCommand('FORMENABLE').Params.Values['NAME'] := inttostr(con_FormAFSFoodReader);
  self.FindSubForm('Main').FindCommand('FORMENABLE').Params.Values['VALUE'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('FORMENABLE').Execute;

  //식수근태 서버와 모니터링에서 동일하게 사용하기 위해서 처리 하지 말자.
*)
end;

procedure TfmFoodReaderSetting.Form_Close;
begin
  Close;
end;


procedure TfmFoodReaderSetting.menuTabChange(Sender: TObject);
begin
  if menuTab.ActiveTabIndex = 0 then //Ȩ
  begin
    if menuTab.AdvOfficeTabs.Items[0].Caption = '닫기' then Close
    else
    begin
      menuTab.ActiveTabIndex := 1;
      menuTabChange(self);
    end;
  end else if menuTab.ActiveTabIndex = 1 then
  begin
    menuTab.AdvOfficeTabs.Items[0].Caption := '닫기';
    config.Visible := True;
    config.Align := alClient;
    AtConfig.Visible := True;
    AtConfig.Align := alClient;
  end else if menuTab.ActiveTabIndex = 2 then
  begin
    menuTab.AdvOfficeTabs.Items[0].Caption := '닫기';
    config.Visible := True;
    config.Align := alClient;
    AtConfig.Visible := False;
  end;
end;



procedure TfmFoodReaderSetting.SearchReader(aReaderNo: string);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  stNodeNo : string;
  stEcuID : string;
begin
  GridInit(sg_Reader,6,2,True);
  stNodeNo := '';
  stEcuID := '';
  if cmb_Node.ItemIndex > 0 then stNodeNo := NodeCodeList.Strings[cmb_Node.ItemIndex];
  if cmb_Ecu.ItemIndex > 0 then stEcuID := DeviceCodeList.Strings[cmb_Ecu.ItemIndex];
  if stEcuID <> '' then
  begin
    stNodeNo := copy(stEcuID,1,G_nNodeCodeLength);
    stEcuID := copy(stEcuID,1 + G_nNodeCodeLength,2);
  end;

  stSql := dmDBSelect.SelectTB_READER_Device(stNodeNo,stEcuID);

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      SQL.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordCount < 1 then
      begin
        Exit;
      end;

      sg_Reader.RowCount := recordCount + 1;
      nRow := 1;

      While Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        with sg_Reader do
        begin
          AddCheckBox(0,nRow,False,False);
          Cells[0,nRow] := '  ' + FindField('ND_NODENAME').AsString;
          Cells[1,nRow] := FindField('DE_ECUID').AsString;
          Cells[2,nRow] := FindField('RE_READERNO').AsString;
          Cells[3,nRow] := FindField('RE_FDTYPENAME').AsString ;
          Cells[4,nRow] := FindField('FG_NAME').AsString ;
          Cells[5,nRow] := FindField('BC_BUILDINGNAME').AsString ;
          Cells[6,nRow] := FindField('ND_NODENO').AsString;
          Cells[7,nRow] := FindField('RE_FDTYPE').AsString;
          Cells[8,nRow] := FindField('FG_CODE').AsString;

          if (FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength) + FindField('DE_ECUID').AsString + FindField('RE_READERNO').AsString)  = aReaderNo then
          begin
            SelectRows(nRow,1);
          end;

        end;
        Application.ProcessMessages;
        inc(nRow);
        Next;
      end;
      sg_ReaderClick(self);
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmFoodReaderSetting.sg_ReaderCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  inherited;
  if ARow = 0 then //전체선택 또는 해제
  begin
    if State then L_nReaderCheckCount := (Sender as TAdvStringGrid).RowCount - 1
    else L_nReaderCheckCount := 0;
    AdvStrinGridSetAllCheck(Sender,State);
  end else
  begin
    if State then L_nReaderCheckCount := L_nReaderCheckCount + 1
    else L_nReaderCheckCount := L_nReaderCheckCount - 1 ;
  end;

end;

procedure TfmFoodReaderSetting.sg_ReaderClick(Sender: TObject);
begin
  inherited;
//
end;

procedure TfmFoodReaderSetting.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;

end;

procedure TfmFoodReaderSetting.btn_addClick(Sender: TObject);
begin
  inherited;
  menutab.ActiveTabIndex := 2;
  menutabChange(self);
end;


procedure TfmFoodReaderSetting.btn_BuildingCancelClick(Sender: TObject);
begin
  inherited;
  pan_Building.Visible := False;
end;

procedure TfmFoodReaderSetting.btn_BuildingSelectClick(Sender: TObject);
var
  stMessage : string;
  stBuildingCode : string;
  i : integer;
  bCheckState : Boolean;
begin
  inherited;
  if tv_buildingName.Selected = nil then
  begin
    stMessage := stringReplace(dmFormMessage.GetMessage('NOTSELECTDATA'),'$WORK',btn_BuildingSelect.Caption,[rfReplaceAll]);
    Application.MessageBox(PChar(stMessage),'Information',MB_OK);
    Exit;
  end;
  stBuildingCode := tv_buildingCode.Items.Item[tv_buildingName.Selected.AbsoluteIndex].Text;
  with sg_Reader do
  begin
    for i := RowCount - 1 downto 1 do
    begin
      GetCheckBoxState(0,i, bCheckState);
      if bCheckState then
      begin
        dmDBUpdate.UpdateTB_READER_Field_StringValue(Cells[6,i],Cells[1,i],'0',Cells[2,i],'BC_BUILDINGCODE',stBuildingCode);
      end;
    end;
  end;
  pan_Building.Visible := False;
  SearchReader('');
end;

procedure TfmFoodReaderSetting.btn_FoodGubunAddClick(Sender: TObject);
var
  nIndex : integer;
begin
  inherited;
  fmFoodGubun := TfmFoodGubun.Create(nil);
  fmFoodGubun.ShowModal;
  fmFoodGubun.Free;
  nIndex := cmb_FDGubun.ItemIndex;
  LoadFoodGROUP(TComboBox(cmb_FDGubun),False);
  if cmb_FDGubun.Items.Count > nIndex  then cmb_FDGubun.ItemIndex := nIndex;

end;

procedure TfmFoodReaderSetting.btn_ReaderBuildingSettingClick(Sender: TObject);
var
  stMessage : string;
begin
  inherited;
  stMessage := stringReplace(dmFormMessage.GetMessage('NOTSELECTDATA'),'$WORK',btn_Save.Caption,[rfReplaceAll]);
  if L_nReaderCheckCount = 0 then
  begin
    Application.MessageBox(PChar(stMessage),'Information',MB_OK);
    Exit;
  end;

  LoadBuildingTreeView('',tv_buildingName,tv_buildingCode,con_LocalBuildingImageIndex);
  pan_Building.Visible := True;

end;

procedure TfmFoodReaderSetting.btn_SaveClick(Sender: TObject);
var
  stMessage : string;
  i : integer;
  bCheckState : Boolean;
  stNodeNo,stEcuID,stReaderNo : string;
  stFDType : string;
  stFGCode : string;
begin
  inherited;

  stMessage := stringReplace(dmFormMessage.GetMessage('NOTSELECTDATA'),'$WORK',btn_Save.Caption,[rfReplaceAll]);
  if L_nReaderCheckCount = 0 then
  begin
    Application.MessageBox(PChar(stMessage),'Information',MB_OK);
    Exit;
  end;

  if cmb_FDUse.ItemIndex < 0 then cmb_FDUse.ItemIndex := 0;

  stFDType := FindCharCopy(cmb_FDUse.text,0,'.');
  stFGCode := FindCharCopy(cmb_FDGubun.text,0,'.');

  with sg_Reader do
  begin
    for i := RowCount - 1 downto 1 do
    begin
      GetCheckBoxState(0,i, bCheckState);
      if bCheckState then
      begin
        stNodeNo := cells[6,i];
        stEcuID := cells[1,i];
        stReaderNo := cells[2,i];
        dmDBUpdate.UpdateTB_READER_Field_StringValue(stNodeNo,stEcuID,'0',stReaderNo,'RE_FDTYPE',stFDType);
        dmDBUpdate.UpdateTB_READER_Field_StringValue(stNodeNo,stEcuID,'0',stReaderNo,'FG_CODE',stFGCode);
      end;
    end;
  end;
  SearchReader('');

end;

initialization
  RegisterClass(TfmFoodReaderSetting);
Finalization
  UnRegisterClass(TfmFoodReaderSetting);

end.
