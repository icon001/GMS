unit uOption;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvAppStyler, Vcl.StdCtrls, AdvEdit,System.IniFiles,
  Vcl.ExtCtrls, Vcl.Mask, AdvSpin;

type
  TfmOption = class(TForm)
    AdvFormStyler1: TAdvFormStyler;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    ed_ColCount: TAdvEdit;
    ed_RowCount: TAdvEdit;
    Label1: TLabel;
    Panel1: TPanel;
    btn_Save: TButton;
    btn_Cancel: TButton;
    pan_Body: TPanel;
    Label3: TLabel;
    se_TextPos: TAdvSpinEdit;
    Label4: TLabel;
    ed_initTime: TAdvEdit;
    Label5: TLabel;
    Label6: TLabel;
    ed_PhotoW: TAdvEdit;
    ed_PhotoH: TAdvEdit;
    Label7: TLabel;
    Label8: TLabel;
    ed_DisplayDelayTime: TAdvEdit;
    Label9: TLabel;
    procedure FormResize(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ed_RowCountKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure se_TextPosChange(Sender: TObject);
    procedure ed_initTimeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_DisplayDelayTimeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    ColPanelList : TStringList;
    RowPanelList : TStringList;
    FRowCount: integer;
    FColCount: integer;
    FSave: Boolean;
    FTextPos: integer;
    FInitTime: integer;
    FPhotoH: integer;
    FPhotoW: integer;
    FDisplayDelayTime: integer;
    procedure SetColCount(const Value: integer);
    procedure SetRowCount(const Value: integer);
    { Private declarations }
    procedure PanelClear;
    procedure PanelReSize;
    procedure PanelSetting;
    procedure PanelDblClick(Sender:TObject);
    procedure SetTextPos(const Value: integer);
    procedure SetInitTime(const Value: integer);
    procedure SetPhotoH(const Value: integer);
    procedure SetPhotoW(const Value: integer);
    procedure SetDisplayDelayTime(const Value: integer);
  public
    { Public declarations }

    property Save : Boolean read FSave write FSave;
    property RowCount:integer read FRowCount write SetRowCount;
    property ColCount: integer read FColCount write SetColCount;
    property DisplayDelayTime : integer read FDisplayDelayTime write SetDisplayDelayTime;
    property InitTime : integer read FInitTime write SetInitTime;
    property TextPos : integer read FTextPos write SetTextPos;
    property PhotoW : integer read FPhotoW write SetPhotoW;
    property PhotoH : integer read FPhotoH write SetPhotoH;
  end;

var
  fmOption: TfmOption;

implementation
uses
  uCommonFunction,
  uCommonVariable,
  uRederSetting;
{$R *.dfm}

procedure TfmOption.btn_CancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmOption.btn_SaveClick(Sender: TObject);
var
  ini_fun : TiniFile;
begin
  //ColCount := strtoint(ed_ColCount.Text);
  //RowCount := strtoint(ed_RowCount.Text);
  PhotoW := strtoint(ed_PhotoW.Text);
  PhotoH := strtoint(ed_PhotoH.Text);
  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\MVIEW.INI');
    ini_fun.WriteInteger('Config','RowCount',RowCount);
    ini_fun.WriteInteger('Config','ColCount',ColCount);
    ini_fun.WriteInteger('Config','TextPos',TextPos);
    ini_fun.WriteInteger('Config','InitTime',InitTime);
    ini_fun.WriteInteger('Config','PhotoW',PhotoW);
    ini_fun.WriteInteger('Config','PhotoH',PhotoH);
    ini_fun.WriteInteger('Config','DisplayDelayTime',DisplayDelayTime);

  Finally
    ini_fun.Free;
  End;
  Save := True;
  Close;
end;

procedure TfmOption.ed_DisplayDelayTimeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if isDigit(ed_DisplayDelayTime.Text) then
    DisplayDelayTime := strtoint(ed_DisplayDelayTime.Text);

end;

procedure TfmOption.ed_initTimeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if isDigit(ed_initTime.Text) then
    InitTime := strtoint(ed_initTime.Text);
end;

procedure TfmOption.ed_RowCountKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  ColCount := strtoint(ed_ColCount.Text);
  RowCount := strtoint(ed_RowCount.Text);
  PanelSetting;
end;

procedure TfmOption.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PanelClear;
  ColPanelList.Free;
  RowPanelList.Free;
end;

procedure TfmOption.FormCreate(Sender: TObject);
begin
  ColPanelList := TStringList.Create;
  RowPanelList := TStringList.Create;

end;

procedure TfmOption.FormResize(Sender: TObject);
begin
  btn_Save.Left := width div 2 - 5 - btn_Save.Width;
  btn_Cancel.Left := width div 2 + 5;
end;

procedure TfmOption.FormShow(Sender: TObject);
begin
  PanelSetting;
end;

procedure TfmOption.PanelClear;
var
  i : integer;
begin
  if ColPanelList.Count > 0 then
  begin
    for i := ColPanelList.Count - 1 downto 0 do TPanel(ColPanelList.Objects[i]).Free;
  end;
  ColPanelList.Clear;

  if RowPanelList.Count > 0 then
  begin
    for i := RowPanelList.Count - 1 downto 0 do TPanel(RowPanelList.Objects[i]).Free;
  end;
  RowPanelList.Clear;
end;

procedure TfmOption.PanelDblClick(Sender: TObject);
var
  no : integer;
begin
  no := TPanel(Sender).tag;

  fmReaderSetting := TfmReaderSetting.create(nil);
  fmReaderSetting.PanelNo := no;
  fmReaderSetting.ShowModal;
  fmReaderSetting.Free;
end;

procedure TfmOption.PanelReSize;
var
  i : integer;
  nHeight : integer;
  nWidth : integer;
begin
  nHeight := pan_Body.Height div RowCount;
  nWidth := pan_Body.Width div ColCount;
  for i := 0 to RowPanelList.Count - 1 do
  begin
    TPanel(RowPanelList.Objects[i]).Height := nHeight;
  end;
  for i := 0 to ColPanelList.Count - 1 do
  begin
    TPanel(ColPanelList.Objects[i]).Width := nWidth;
  end;
end;

procedure TfmOption.PanelSetting;
var
  i,j : integer;
  oRowPanel : TPanel;
  oColPanel : TPanel;
  nHeight : integer;
  nWidth : integer;
begin
  PanelClear;
  nHeight := pan_Body.Height div RowCount;
  nWidth := pan_Body.Width div ColCount;

  for i := 1 to RowCount do
  begin
    oRowPanel := TPanel.Create(nil);
    oRowPanel.Parent := pan_Body;
//    oPanel.Caption := inttostr(i);
    oRowPanel.Height := nHeight;
    oRowPanel.BevelOuter := bvNone;
    if i =  RowCount then oRowPanel.Align := alClient
    else oRowPanel.Align := alTop;
    RowPanelList.AddObject(inttostr(i),oRowPanel);


    for j:=ColCount downto 1 do
    begin
      oColPanel := TPanel.Create(nil);
      oColPanel.Parent := oRowPanel;
      oColPanel.Caption := 'Double Click' + inttostr( (i-1) * ColCount + j);
      oColPanel.Width := nWidth;
      oColPanel.Tag := (i-1) * ColCount + j;
      oColPanel.OnDblClick := PanelDblClick;
      //oColPanel.BevelOuter := bvNone;
      if j =  1 then oColPanel.Align := alClient
      else oColPanel.Align := alLeft;
      ColPanelList.AddObject(inttostr( (i-1) * ColCount + j),oColPanel);
    end;

  end;
end;

procedure TfmOption.SetColCount(const Value: integer);
begin
  if FColCount = Value then Exit;
  FColCount := Value;
  ed_ColCount.Text := inttostr(Value);
end;

procedure TfmOption.SetDisplayDelayTime(const Value: integer);
begin
  if FDisplayDelayTime = Value then Exit;

  FDisplayDelayTime := Value;
  ed_DisplayDelayTime.Text := inttostr(Value);
end;

procedure TfmOption.SetInitTime(const Value: integer);
begin
  if FInitTime = Value then Exit;
  FInitTime := Value;
  ed_initTime.Text := inttostr(Value);
end;

procedure TfmOption.SetPhotoH(const Value: integer);
begin
  if FPhotoH = Value then Exit;
  FPhotoH := Value;
  ed_PhotoH.Text := inttostr(Value);
end;

procedure TfmOption.SetPhotoW(const Value: integer);
begin
  if FPhotoW = Value then Exit;
  FPhotoW := Value;
  ed_PhotoW.Text := inttostr(Value);
end;

procedure TfmOption.SetRowCount(const Value: integer);
begin
  if(FRowCount=Value) then Exit;
  FRowCount := Value;
  ed_RowCount.Text := inttostr(Value);
end;

procedure TfmOption.SetTextPos(const Value: integer);
begin
  if(FTextPos=Value) then Exit;
  FTextPos := Value;
  se_TextPos.Value := Value;
end;

procedure TfmOption.se_TextPosChange(Sender: TObject);
begin
  TextPos := se_TextPos.Value;
end;

end.
