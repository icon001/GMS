unit uSecurityEventConfirm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, AdvGlassButton,
  AdvSmoothPanel, AdvToolBar, AdvToolBarStylers, AdvOfficeTabSet,
  AdvOfficeTabSetStylers,uSubForm, CommandArray, AdvAppStyler,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, AdvGlowButton;

type
  TfmSecurityEventConfirm = class(TfmASubForm)
    Pan_Workcode: TAdvSmoothPanel;
    Label1: TLabel;
    ed_ArmAreaName: TEdit;
    ed_AlarmStateName: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Memo1: TMemo;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    AdvToolBarOfficeStyler1: TAdvToolBarOfficeStyler;
    AdvFormStyler1: TAdvFormStyler;
    btn_Save: TAdvGlowButton;
    btn_Cancel: TAdvGlowButton;
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FNodeNo: string;
    FEcuID: string;
    FMsgNo: string;
    FAlarmTime: string;
    FAlarmDate: string;
    FExtendID: string;
    FSave: Boolean;
    FAllAlarmProcess: Boolean;
    { Private declarations }
    procedure FontSetting;
    procedure SetAllAlarmProcess(const Value: Boolean);
  public
    { Public declarations }
    property NodeNo : string read FNodeNo write FNodeNo;
    property EcuID : string read FEcuID write FEcuID;
    property ExtendID : string read FExtendID write FExtendID;
    property MsgNo : string read FMsgNo write FMsgNo;
    property AlarmDate : string read FAlarmDate write FAlarmDate;
    property AlarmTime : string read FAlarmTime write FAlarmTime;
    Property AllAlarmProcess : Boolean read FAllAlarmProcess write SetAllAlarmProcess;
    property Save : Boolean read FSave write FSave;
  end;

var
  fmSecurityEventConfirm: TfmSecurityEventConfirm;

implementation
uses
  uCommonFunction,
  uCommonVariable,
  uDataBase,
  uDBUpdate,
  uFormUtil;

{$R *.dfm}

procedure TfmSecurityEventConfirm.btn_CancelClick(Sender: TObject);
begin
  Save := False;
  Close;
end;

procedure TfmSecurityEventConfirm.btn_SaveClick(Sender: TObject);
var
  stSql : string;
begin
  if Memo1.Text = '' then
  begin
    showmessage('조치내용을 입력 하여 주세요.');
    memo1.SetFocus;
    Exit;
  end;

  if Not AllAlarmProcess then
  begin
    Save := dmDBUpdate.UpdateTB_ALARMEVENT_Confirm(AlarmDate, AlarmTime,
            NodeNo, EcuID, ExtendID, MsgNo, '1', Memo1.Text, formatDateTime('yyyymmddhhnnsszzz',now),
            GetLocalIPAddr);

    if Save then Close
    else showmessage('DataBase Save Failed!!');
  end else
  begin
    Save := True;    //전체 삭제 시
    Close;
  end;

end;

procedure TfmSecurityEventConfirm.FontSetting;
begin
(*  dmFormUtil.TravelFormFontSetting(self,G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.TravelAdvOfficeTabSetOfficeStylerFontSetting(AdvOfficeTabSetOfficeStyler1, G_stFontName,inttostr(G_nFontSize));
  dmFormUtil.FormAdvOfficeTabSetOfficeStylerSetting(AdvOfficeTabSetOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormAdvToolBarOfficeStylerSetting(AdvToolBarOfficeStyler1,G_stFormStyle);
  dmFormUtil.FormStyleSetting(self,AdvToolBarOfficeStyler1);
*)
end;

procedure TfmSecurityEventConfirm.FormCreate(Sender: TObject);
begin
  AllAlarmProcess := False;
  FontSetting;
end;

procedure TfmSecurityEventConfirm.FormShow(Sender: TObject);
begin
  Memo1.SetFocus;
end;

procedure TfmSecurityEventConfirm.SetAllAlarmProcess(const Value: Boolean);
begin
  FAllAlarmProcess := Value;
  Label2.Enabled := Not Value;
  Label1.Enabled := Not Value;
  ed_ArmAreaName.Enabled := Not Value;
  ed_AlarmStateName.Enabled := Not Value;
  if Value then
  begin
    ed_ArmAreaName.Text := '전체';
  end;
end;

end.
