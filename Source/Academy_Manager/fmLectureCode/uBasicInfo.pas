unit uBasicInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvEdBtn, AdvGlowButton, Vcl.Grids,
  AdvObj, BaseGrid, AdvGrid, Vcl.StdCtrls, AdvGroupBox, AdvEdit, AdvSmoothLabel,
  Vcl.ComCtrls, Vcl.ImgList;

type
  TfmBasicInfo = class(TForm)
    lb_AddBookName: TAdvSmoothLabel;
    ed_bookName: TAdvEdit;
    AdvSmoothLabel3: TAdvSmoothLabel;
    ed_bookAmt: TAdvEdit;
    lb_Month: TAdvSmoothLabel;
    ed_Month: TAdvEdit;
    lb_List: TLabel;
    gb_Card: TAdvGroupBox;
    ed_LectureAmt: TAdvEdit;
    sg_Tuition: TAdvStringGrid;
    btn_LectureAmtAdd: TAdvGlowButton;
    eb_Company: TAdvEditBtn;
    tv_CompanyCode: TTreeView;
    tv_CompanyName: TTreeView;
    MenuImageList16: TImageList;
    btn_Save: TAdvGlowButton;
    btn_Cancel: TAdvGlowButton;
    ed_CompanyCode: TAdvEdit;
    procedure eb_CompanyClickBtn(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tv_CompanyNameDblClick(Sender: TObject);
  private
    FClassCode: string;
    FClassName: string;
    procedure SetClassName(const Value: string);
    procedure SetClassCode(const Value: string);
    procedure employeePanelClear;
    { Private declarations }
  public
    { Public declarations }
    property ClassCode : string read FClassCode write SetClassCode;
    property ClassName : string read FClassName write SetClassName;
  end;

var
  fmBasicInfo: TfmBasicInfo;

implementation

uses
  uComboBoxCodeLoad;

{$R *.dfm}

{ TfmBasicInfo }

procedure TfmBasicInfo.eb_CompanyClickBtn(Sender: TObject);
begin
  tv_CompanyName.Visible := Not tv_CompanyName.Visible;
  tv_CompanyName.Top := gb_Card.Top + eb_Company.Top + eb_Company.Height;
  tv_CompanyName.Left := gb_Card.left + eb_Company.Left;
end;

procedure TfmBasicInfo.employeePanelClear;
begin
  ed_LectureAmt.Text := '';
  ed_bookName.Text := '';
  ed_bookAmt.Text := '';
  ed_Month.Text := '';
  tv_CompanyNameDblClick(tv_CompanyName);
end;

procedure TfmBasicInfo.FormShow(Sender: TObject);
begin
  LoadCompanyTreeView('',tv_CompanyName,tv_CompanyCode,0);
  employeePanelClear;
end;

procedure TfmBasicInfo.SetClassCode(const Value: string);
begin
  FClassCode := Value;
end;

procedure TfmBasicInfo.SetClassName(const Value: string);
begin
  FClassName := Value;
  lb_List.Caption := Value;
end;

procedure TfmBasicInfo.tv_CompanyNameDblClick(Sender: TObject);
begin
  if tv_CompanyName.Selected = nil then tv_CompanyName.Items[0].Selected := True;

  ed_CompanyCode.Text := tv_CompanyCode.Items.Item[tv_CompanyName.Selected.AbsoluteIndex].Text;
  eb_Company.Text := tv_CompanyName.Selected.Text;
  tv_CompanyName.Visible := False;

end;

end.