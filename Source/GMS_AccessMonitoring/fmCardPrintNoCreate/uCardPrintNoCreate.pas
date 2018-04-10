unit uCardPrintNoCreate;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls;

type
  TfmCardPrintNoCreate = class(TForm)
    Label1: TLabel;
    ed_PrintNo: TEdit;
    Label2: TLabel;
    ed_CardNo: TEdit;
    btn_Save: TSpeedButton;
    btn_Cancel: TSpeedButton;
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    L_bSave : Boolean;
    FSelectCardNo: string;
    FSelectPrintNo: string;
    procedure SetSelectPrintNo(const Value: string);
    procedure SetSelectCardNo(const Value: string);
    { Private declarations }
  public
    { Public declarations }
    property SelectCardNo : string read FSelectCardNo write SetSelectCardNo;
    property SelectPrintNo : string read FSelectPrintNo write SetSelectPrintNo;
  end;

var
  fmCardPrintNoCreate: TfmCardPrintNoCreate;

implementation
uses
  uDBFunction,
  uDBInsert;

{$R *.dfm}

procedure TfmCardPrintNoCreate.btn_CancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCardPrintNoCreate.btn_SaveClick(Sender: TObject);
var
  stPrintNo : string;
  stCarNo : string;
begin
  if dmDBFunction.CheckTB_CARDPRINTLIST_CardNo(ed_CardNo.Text,stPrintNo) = 1 then
  begin
    showmessage('ī���ȣ ' + ed_CardNo.Text + '�� �Ϸù�ȣ ' + stPrintNo + ' ���� ������Դϴ�.');
    SelectPrintNo := stPrintNo;
    L_bSave := True;
    Close;
    Exit;
  end;
  if dmDBFunction.CheckTB_CARDPRINTLIST_PrintNo(ed_PrintNo.Text,stCarNo) = 1 then
  begin
    showmessage('�Ϸù�ȣ ' + ed_PrintNo.Text + '�� ī���ȣ ' + stCarNo + ' ���� ������Դϴ�. �Ϸù�ȣ�� ���Ҵ� �մϴ�.');
    SelectPrintNo := dmDBFunction.GetTB_CARDPRINTLIST_AutoPrintNo;
    Exit;
  end;

  if Not dmDBInsert.InsertIntoTB_CARDPRINTLIST_Value(ed_PrintNo.Text,ed_CardNo.Text) then
  begin
    showmessage('�Ϸù�ȣ ���� ����');
    Exit;
  end;

  L_bSave := True;
  Close;
end;

procedure TfmCardPrintNoCreate.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Not L_bSave then SelectCardNo := '';
end;

procedure TfmCardPrintNoCreate.FormCreate(Sender: TObject);
begin
  SelectPrintNo := dmDBFunction.GetTB_CARDPRINTLIST_AutoPrintNo;
end;

procedure TfmCardPrintNoCreate.SetSelectCardNo(const Value: string);
begin
  FSelectCardNo := Value;
  ed_CardNo.Text := Value;
end;

procedure TfmCardPrintNoCreate.SetSelectPrintNo(const Value: string);
begin
  FSelectPrintNo := Value;
  ed_PrintNo.Text := Value;
end;

end.