unit uCriticalForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvGlowButton, Vcl.ExtCtrls,
  AdvSplitter, AdvSmoothPanel, AdvOfficePager, AdvOfficeTabSet,
  AdvOfficeTabSetStylers, AdvAppStyler, AdvOfficePagerStylers, Vcl.StdCtrls,
  Vcl.Grids, AdvObj, BaseGrid, AdvGrid, AdvSmoothLabel, uSubForm, CommandArray,
  Vcl.Imaging.pngimage,ActiveX,ADODB;

type
  TfmCriticalForm = class(TfmASubForm)
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    AdvFormStyler1: TAdvFormStyler;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    AdvOfficePager1: TAdvOfficePager;
    AdvOfficePage1: TAdvOfficePage;
    pan_Center: TAdvSmoothPanel;
    btn_minimize: TAdvGlowButton;
    btn_Close: TAdvGlowButton;
    lb_List: TLabel;
    sg_CriticalList: TAdvStringGrid;
    lb_PositionSearch: TAdvSmoothLabel;
    cmb_PositionSearch: TComboBox;
    cmb_CardWork: TComboBox;
    procedure btn_minimizeClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure sg_CriticalListResize(Sender: TObject);
    procedure cmb_PositionSearchChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sg_CriticalListSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure cmb_CardWorkExit(Sender: TObject);
    procedure cmb_CardWorkChange(Sender: TObject);
  private
    { Private declarations }
    procedure SearchFormCritial(aGubun:string);
    Function FormNameSetting:Boolean;
  public
    { Public declarations }
  end;

var
  fmCriticalForm: TfmCriticalForm;

implementation
uses
  uCommonFunction,
  uDBSelect,
  uDBUpdate,
  uDataBase,
  uFormFunction;
{$R *.dfm}


procedure TfmCriticalForm.btn_CloseClick(Sender: TObject);
begin
  Close;

end;

procedure TfmCriticalForm.btn_minimizeClick(Sender: TObject);
begin
  windowState := wsNormal;

end;

procedure TfmCriticalForm.cmb_CardWorkChange(Sender: TObject);
begin
  inherited;
  with cmb_CardWork do
  begin
    hide;
    with sg_CriticalList do
    begin
      if Not isDigit(Cells[3,Row]) then Exit;

      dmDBUpdate.UpdateTB_FORMCRITICAL_Field_IntValue(Cells[3,Row],'FC_CRITICALTYPE',inttostr(ItemIndex));
      Cells[2, row] := cmb_CardWork.Text;
      Cells[5,Row] := inttostr(ItemIndex);
    end;
  end;
end;

procedure TfmCriticalForm.cmb_CardWorkExit(Sender: TObject);
begin
  inherited;
  cmb_CardWork.Visible := False;
end;

procedure TfmCriticalForm.cmb_PositionSearchChange(Sender: TObject);
var
  stGubun : string;
begin
  if cmb_PositionSearch.ItemIndex = 0 then stGubun := ''
  else if cmb_PositionSearch.ItemIndex = 1 then stGubun := 'EMPLOYEE';

  SearchFormCritial(stGubun);
end;

procedure TfmCriticalForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

function TfmCriticalForm.FormNameSetting: Boolean;
begin
  AdvOfficePage1.Caption := dmFormFunction.GetFormName('2','1','BM5_013');
  lb_List.Caption := dmFormFunction.GetFormName('0','2','COMMONCRITICALLIST');
  lb_PositionSearch.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONMENU');
  sg_CriticalList.Cells[0,0] := dmFormFunction.GetFormName('0','2','COMMONMENU');
  sg_CriticalList.Cells[1,0] := dmFormFunction.GetFormName('0','2','COMMONFIELD');
  sg_CriticalList.Cells[2,0] := dmFormFunction.GetFormName('0','2','COMMONCRITICALUSED');
end;

procedure TfmCriticalForm.FormResize(Sender: TObject);
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

  sg_CriticalList.Left := 10;
  sg_CriticalList.Width := pan_Center.Width - (sg_CriticalList.Left * 2);
  sg_CriticalList.Height := pan_Center.Height - (sg_CriticalList.Top + 10);
end;

procedure TfmCriticalForm.FormShow(Sender: TObject);
begin
  inherited;
  FormNameSetting;
  SearchFormCritial('');
end;

procedure TfmCriticalForm.SearchFormCritial(aGubun: string);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
begin

  GridInit(sg_CriticalList,3);
  stSql := dmDBSelect.SelectTB_FORMCRITICAL_GubunCode(aGubun);
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
      with sg_CriticalList do
      begin
        nRow := 1;
        RowCount := RecordCount + 1;
        while Not Eof do
        begin
          if FindField('FC_MENUTYPE').AsString = 'EMPLOYEE' then cells[0,nRow] := '�������';
          cells[1,nRow] := FindField('NAME').AsString;
          if FindField('FC_CRITICALTYPE').AsString = '1' then cells[2,nRow] := '�ʼ��׸�'
          else cells[2,nRow] := '�����׸�';
          cells[3,nRow] := FindField('FC_CRITICALID').AsString;
          cells[4,nRow] := FindField('FC_MENUTYPE').AsString;
          cells[5,nRow] := FindField('FC_CRITICALTYPE').AsString;

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

procedure TfmCriticalForm.sg_CriticalListResize(Sender: TObject);
begin
  sg_CriticalList.ColWidths[0] := (sg_CriticalList.Width - 20) div 3;
  sg_CriticalList.ColWidths[1] := (sg_CriticalList.Width - 20) div 3;
  sg_CriticalList.ColWidths[2] := (sg_CriticalList.Width - 20) div 3;
end;

procedure TfmCriticalForm.sg_CriticalListSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  nIndex : integer;
  Rect: TRect;
begin
  inherited;
  if Trim(sg_CriticalList.Cells[3, ARow]) = '' then Exit;

  Rect := sg_CriticalList.CellRect(ACol, ARow);
  if ACol = 2 then
  begin
//    LoadCardGubun(WorkCardGubunCodeList,cmb_CardWork,False);
    With cmb_CardWork do
    begin
      Visible := true;
      Left := sg_CriticalList.Left + Rect.Left ;
      Top := sg_CriticalList.Top + Rect.Top ;
      Width := Rect.Right - Rect.Left;
      Height := (Rect.Bottom - Rect.Top);
      nIndex := Items.IndexOf(Trim(sg_CriticalList.Cells[ACol, ARow]));
      ItemIndex := nIndex;
      BringToFront;   // comboBox1�� �ֻ����� �ű�� <> SendToBack
      SetFocus;
    end;
  end;
end;

initialization
  RegisterClass(TfmCriticalForm);
Finalization
  UnRegisterClass(TfmCriticalForm);
end.