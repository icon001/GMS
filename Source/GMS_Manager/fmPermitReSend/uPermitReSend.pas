unit uPermitReSend;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, AdvProgr, AdvGlowButton,
  Vcl.StdCtrls, AdvCombo, AdvEdit, AdvEdBtn, Vcl.Grids, AdvObj, BaseGrid,
  AdvGrid, AdvSmoothLabel, AdvSmoothPanel, Vcl.ExtCtrls, AdvSplitter, W7Classes,
  W7Panels, AdvOfficePager, AdvAppStyler, AdvOfficePagerStylers,
  AdvOfficeTabSet, AdvOfficeTabSetStylers, uSubForm, CommandArray,
  Vcl.Imaging.pngimage, Vcl.ImgList,ActiveX,ADODB;

const
  con_LocalCompanyImageIndex = 0;
  con_LocalEmployeeImageIndex = 1;
  con_LocalBuildingImageIndex = 2;

type
  TfmPermitReSend = class(TfmASubForm)
    AdvOfficePager1: TAdvOfficePager;
    AdvOfficePage1: TAdvOfficePage;
    BodyPanel: TW7Panel;
    AdvSmoothPanel1: TAdvSmoothPanel;
    pan_DeviceList: TAdvSmoothPanel;
    lb_BuildingName: TAdvSmoothLabel;
    lb_ControlerTime: TLabel;
    sg_Device: TAdvStringGrid;
    tv_buildingName: TTreeView;
    tv_buildingCode: TTreeView;
    eb_BuildingName: TAdvEditBtn;
    ed_BuildingCode: TAdvEdit;
    btn_minimize: TAdvGlowButton;
    btn_Close: TAdvGlowButton;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    AdvFormStyler1: TAdvFormStyler;
    MenuImageList16: TImageList;
    btn_ReSend: TAdvGlowButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pan_DeviceListResize(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure eb_BuildingNameClickBtn(Sender: TObject);
    procedure tv_buildingNameDblClick(Sender: TObject);
    procedure sg_DeviceCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure btn_ReSendClick(Sender: TObject);
  private
    { Private declarations }
    L_stAllName : string;
    L_stMenuID : string;
    L_nDeviceCheckCount : integer;
    procedure FormNameSetting;
    procedure SearchDeviceList(aCode:string);
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);
  public
    { Public declarations }
    procedure FormGradeRefresh;
    procedure FormIDSetting(aID:string);
    procedure RcvFTPPercent(aDecoderNo, aNodeNo,aEcuID,aData:string);
  end;

var
  fmPermitReSend: TfmPermitReSend;

implementation

uses
  uComboBoxCodeLoad,
  uCommonFunction,
  uCommonVariable,
  uDataBase,
  uDBFormMessage,
  uDBFunction,
  uDBInsert,
  uDBUpdate,
  uDBSelect,
  uFormFunction,
  uFormVariable,
  uMain;
{$R *.dfm}



{ TfmPermitReSend }

procedure TfmPermitReSend.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;
end;

procedure TfmPermitReSend.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmPermitReSend.btn_ReSendClick(Sender: TObject);
var
  stMessage : string;
  i : integer;
  bChecked : Boolean;
  stNodeNo : string;
  stEcuID : string;
begin
  inherited;
  if L_nDeviceCheckCount = 0 then
  begin
    stMessage := dmFormMessage.GetMessage('SELECTERROR');
    stMessage := StringReplace(stMessage,'$WORK',btn_ReSend.Caption,[rfReplaceAll]);
    showmessage(stMessage);
    Exit;
  end;
  for i := 1 to sg_Device.RowCount - 1 do
  begin
    sg_Device.GetCheckBoxState(0,i, bChecked);
    if bChecked then
    begin
      stNodeNo := sg_Device.Cells[5,i];
      stEcuID := sg_Device.Cells[2,i];
      if dmDBFunction.CheckTB_CARDFTPDOWNLIST_Device(stNodeNo,stEcuID) < 1 then
      begin
        //Insert
        dmDBInsert.InsertIntoTB_CARDFTPDOWNLIST_Value(stNodeNo,stEcuID,'0','N','0');
      end else
      begin
        //Update
        dmDBUpdate.UpdateTB_CARDFTPDOWNLIST_Value(stNodeNo,stEcuID,'0','N','0')
      end;
      sg_Device.Cells[4,i] := '0';
    end;
  end;

end;

procedure TfmPermitReSend.eb_BuildingNameClickBtn(Sender: TObject);
begin
  inherited;
  tv_buildingName.Visible := True;
  tv_buildingName.Top := eb_BuildingName.Top + eb_BuildingName.Height;
  tv_buildingName.Left := eb_BuildingName.Left;

end;

procedure TfmPermitReSend.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  fmMain.FORMENABLE(con_FormBMOSPERMITRESEND,'FALSE');

end;

procedure TfmPermitReSend.FormGradeRefresh;
begin

end;

procedure TfmPermitReSend.FormIDSetting(aID: string);
begin
  L_stMenuID := aID;

end;

procedure TfmPermitReSend.FormNameSetting;
begin
  L_stAllName := dmFormFunction.GetFormName('0','2','COMMONALLNAME');
  AdvOfficePage1.Caption := dmFormFunction.GetFormName('0','2','BUTTONMENU002');
  lb_BuildingName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONBUILDINGNAME');
  lb_ControlerTime.Caption := dmFormFunction.GetFormName('0','2','COMMONDEVICE');
  sg_Device.Cells[1,0] := dmFormFunction.GetFormName('0','2','COMMONNODEIP01');   //���IP
  sg_Device.Cells[2,0] := dmFormFunction.GetFormName('0','2','COMMONCONTROLERID');         //��Ʈ�ѷ���ȣ
  sg_Device.Cells[3,0] := dmFormFunction.GetFormName('0','2','COMMONDEVICENAME');
  sg_Device.Cells[4,0] := dmFormFunction.GetFormName('0','2','COMMONSEND');

  btn_ReSend.Caption := dmFormFunction.GetFormName('2','1','BM3_029');
end;

procedure TfmPermitReSend.FormResize(Sender: TObject);
begin
  inherited;
  btn_Close.Left := AdvOfficePager1.Width - btn_Close.Width - 10;
  btn_minimize.Left := btn_Close.Left - btn_minimize.Width - 2;

  if Windowstate = wsMaximized then
  begin
    btn_minimize.Visible := False;
    btn_Close.Visible := True;
  end else
  begin
    btn_minimize.Visible := False;
    btn_Close.Visible := False;
  end;
  pan_DeviceListResize(pan_DeviceList);
end;

procedure TfmPermitReSend.FormShow(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;
  FormNameSetting;
  fmMain.FORMENABLE(con_FormBMOSPERMITRESEND,'TRUE');

  LoadBuildingTreeView('',tv_buildingName,tv_buildingCode,con_LocalBuildingImageIndex);
  tv_buildingNameDblClick(Self);

//  GridInit(sg_Device,5,2,True);

end;

procedure TfmPermitReSend.pan_DeviceListResize(Sender: TObject);
begin
  inherited;
  sg_Device.Width := pan_DeviceList.Width - (sg_Device.Left * 2);
  sg_Device.Height := pan_DeviceList.Height - sg_Device.Top - 50;
  sg_Device.ColWidths[4] := sg_Device.Width - ( sg_Device.ColWidths[0] + sg_Device.ColWidths[1] + sg_Device.ColWidths[2] + sg_Device.ColWidths[3]) - 10;
end;

procedure TfmPermitReSend.RcvFTPPercent(aDecoderNo, aNodeNo, aEcuID,
  aData: string);
var
  i : integer;
  stDeviceID : string;
begin
  if Not isDigit(aData) then Exit;

  stDeviceID := FillZeroStrNum(aNodeNo,G_nNodeCodeLength) + aEcuID;
  with sg_device do
  begin
    for i := 1 to RowCount - 1  do
    begin
      if (cells[6,i] = stDeviceID) then
      begin
        cells[4,i] := inttostr(strtoint(aData));
        break;
      end;
    end;
  end;


end;

procedure TfmPermitReSend.SearchDeviceList(aCode: string);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  stBuildingCode : string;
begin
  GridInit(sg_Device,5,2,True);

  stBuildingCode := ed_BuildingCode.Text;
  if stBuildingCode = '' then stBuildingCode := '0';

  stSql := dmDBSelect.SelectTB_DEVICE_BuildingFTPState(stBuildingCode);

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;

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

      with sg_Device do
      begin
        nRow := 1;
        RowCount := RecordCount + 1;
        while Not Eof do
        begin
          AddCheckBox(0,nRow,False,False);

          cells[1,nRow] := FindField('ND_NODEIP').AsString;
          cells[2,nRow] := FindField('DE_ECUID').AsString;
          cells[3,nRow] := FindField('DE_DEVICENAME').AsString;
          cells[4,nRow] := FindField('CF_SENDPROGRESS').AsString;
          cells[5,nRow] := FindField('ND_NODENO').AsString;
          cells[6,nRow] := FillZeroNumber(FindField('ND_NODENO').AsInteger,G_nNodeCodeLength) + FindField('DE_ECUID').AsString;

          nRow := nRow + 1;
          Next;
        end;

      end;

    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmPermitReSend.sg_DeviceCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  inherited;
  if ARow = 0 then //��ü���� �Ǵ� ����
  begin
    if State then L_nDeviceCheckCount := (Sender as TAdvStringGrid).RowCount - 1
    else L_nDeviceCheckCount := 0;
    AdvStrinGridSetAllCheck(Sender,State);
  end else
  begin
    if State then L_nDeviceCheckCount := L_nDeviceCheckCount + 1
    else L_nDeviceCheckCount := L_nDeviceCheckCount - 1 ;
  end;

end;

procedure TfmPermitReSend.tv_buildingNameDblClick(Sender: TObject);
begin
  inherited;
  if tv_buildingName.Selected = nil then tv_buildingName.Items[0].Selected := True;

  ed_BuildingCode.Text := tv_buildingCode.Items.Item[tv_buildingName.Selected.AbsoluteIndex].Text;
  eb_BuildingName.Text := tv_buildingName.Selected.Text;
  tv_buildingName.Visible := False;
  SearchDeviceList('');

end;

initialization
  RegisterClass(TfmPermitReSend);
Finalization
  UnRegisterClass(TfmPermitReSend);

end.