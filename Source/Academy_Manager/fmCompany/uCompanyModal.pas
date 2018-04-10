unit uCompanyModal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uSubForm, CommandArray, AdvGlassButton,
  Vcl.Grids, AdvObj, BaseGrid, AdvGrid, Vcl.StdCtrls, AdvEdit, AdvSmoothLabel,
  AdvSmoothPanel, AdvOfficeTabSet, W7Classes, W7Panels,ActiveX,ADODB,
  Vcl.ComCtrls, Vcl.Menus, Vcl.ExtCtrls, AdvSmoothTabPager, Vcl.ImgList,
  AdvOfficeTabSetStylers, AdvToolBar, AdvToolBarStylers, AdvAppStyler, AdvPanel,
  AdvOfficePager, AdvGlowButton;

const
  con_LocalCompanyImageIndex = 0;
  con_LocalEmployeeImageIndex = 1;
  con_LocalBuildingImageIndex = 2;

type
  TfmCompanyModal = class(TAdvToolBarForm)
    AdvFormStyler1: TAdvFormStyler;
    AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler;
    AdvPanelStyler1: TAdvPanelStyler;
    MenuImageList16: TImageList;
    pm_Work: TPopupMenu;
    pm_ChiledCodeAdd: TMenuItem;
    pm_UpdateCode: TMenuItem;
    pm_DeleteCode: TMenuItem;
    N1: TMenuItem;
    pm_CompanyGrade: TMenuItem;
    N2: TMenuItem;
    pm_ParentCompanyGrade: TMenuItem;
    AdvOfficePager1: TAdvOfficePager;
    AdvOfficePage1: TAdvOfficePage;
    BodyPanel: TW7Panel;
    List: TAdvSmoothPanel;
    tv_CompanyList: TTreeView;
    tv_CompanyCode: TTreeView;
    Pan_Companycode: TAdvSmoothPanel;
    lb_CompanyName: TAdvSmoothLabel;
    btn_Save: TAdvGlassButton;
    btn_Cancel: TAdvGlassButton;
    ed_CompanyName: TAdvEdit;
    ed_SelectCode: TAdvEdit;
    btn_minimize: TAdvGlowButton;
    btn_Close: TAdvGlowButton;
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure pm_ChiledCodeAddClick(Sender: TObject);
    procedure pm_UpdateCodeClick(Sender: TObject);
    procedure pm_DeleteCodeClick(Sender: TObject);
  private
    BuildingArmAreaCodeList : TStringList; //������ ������� �ڵ� ����Ʈ�� ������ ����.
    BuildingDoorCodeList : TStringList; //������ ���Թ� �ڵ� ����Ʈ�� ������ ����.
    GradeArmAreaCodeList : TStringList;
    GradeDoorCodeList : TStringList;
    NotGradeArmAreaCodeList : TStringList; //��������� ���� �������Ʈ
    NotGradeDoorCodeList : TStringList;  //���Ա����� ���� ����Ʈ
    L_nPermitArmAreaCheckCount : integer;           //������ ������� ���� ����
    L_nNotPermitArmAreaCheckCount : integer;        //��Ͻ� ������� ���� ����
    L_nPermitDoorCheckCount : integer;           //������ ���Թ� ���� ����
    L_nNotPermitDoorCheckCount : integer;        //��Ͻ� ���Թ� ���� ����
    L_stMenuID : string;
    L_stButtonCloseCaption : string;
    L_stWork : string;
    { Private declarations }

    procedure FormNameSetting;
    procedure FontSetting;
    function ChangeCompanyCode(aOrgCode,aCode,aDeepSeq,aViewSeq:string):Boolean;
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
  fmCompanyModal: TfmCompanyModal;

implementation
uses
  uCommonFunction,
  uComboBoxCodeLoad,
  uCommonVariable,
  uFormFunction,
  uFormVariable,
  uDataBase,
  uDBCardPermit,
  uDBDelete,
  uDBVariable,
  uDBFormMessage,
  uDBFunction,
  uDBInsert,
  uDBSelect,
  uDBUpdate,
  uFormUtil,
  uMain;

{$R *.dfm}

{ TfmCompanyModal }

procedure TfmCompanyModal.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

function TfmCompanyModal.ChangeCompanyCode(aOrgCode, aCode, aDeepSeq,
  aViewSeq: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stChildCode,stDeepSeq,stViewSeq : string;
  stOrgDeepSeq : string;
begin
  stOrgDeepSeq := dmDBFunction.GetTB_COMPANYCODE_CurrentDeepSeq(aOrgCode);
  stSql := ' Update TB_COMPANYCODE Set ';
  stSql := stSql + ' CO_COMPANYCODE = ''' + aCode + ''',';
  stSql := stSql + ' CO_DEEPSEQ = ' + aDeepSeq + ',';
  stSql := stSql + ' CO_VIEWSEQ = ' + aViewSeq + ' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aOrgCode + ''' ';

  result := dmDataBase.ProcessExecSQL(stSql);

  //���⼭ ȸ���ڵ庰 ī����� ���̺� ����
  stSql := ' Update TB_CARDPERMITCOMPANYGROUP set CO_COMPANYCODE = ''' + aCode + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aOrgCode + ''' ';
  result := dmDataBase.ProcessExecSQL(stSql);

  //���⼭ ������̺� ������ ���� ����
  stSql := ' Update TB_EMPLOYEE set CO_COMPANYCODE = ''' + aCode + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aOrgCode + ''' ';
  result := dmDataBase.ProcessExecSQL(stSql);

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;

    stSql := 'Select * from TB_COMPANYCODE ';
    stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
    stSql := stSql + ' AND CO_COMPANYCODE Like ''' + aOrgCode + '%'' ';
    stSql := stSql + ' AND CO_DEEPSEQ = ' + inttostr(strtoint(stOrgDeepSeq) + 1) + '';
    with TempAdoQuery do
    begin
      Close;
      sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then Exit;
      while Not Eof do
      begin
        dmDBFunction.GetNextTB_COMPANYCODE_ChildCompanyCode(aCode,stChildCode,stDeepSeq,stViewSeq); //�ű� �ڵ尡 �θ� ��
        ChangeCompanyCode(FindField('CO_COMPANYCODE').AsString,stChildCode,stDeepSeq,stViewSeq);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmCompanyModal.FontSetting;
begin

end;

procedure TfmCompanyModal.FormChangeEvent(aNumber: integer);
begin
  case aNumber of
    con_FormBMOSBUILDINGCODE : begin
//      LoadBuildingTreeView('',tv_buildingName,tv_buildingCode,con_LocalBuildingImageIndex);
    end;
  end;
end;

procedure TfmCompanyModal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  BuildingDoorCodeList.Free;
  BuildingArmAreaCodeList.Free;
  GradeArmAreaCodeList.Free;
  GradeDoorCodeList.Free;
  NotGradeArmAreaCodeList.Free; //��������� ���� �������Ʈ
  NotGradeDoorCodeList.Free;  //���Ա����� ���� ����Ʈ

  fmMain.FORMENABLE(con_FormBMOSCOMPANYCODE,'FALSE');

end;

procedure TfmCompanyModal.FormCreate(Sender: TObject);
begin
  if G_nFormLanguageType = 1 then
  begin
    ed_CompanyName.ImeMode := imSHanguel;// imHanguel;
    ed_CompanyName.ImeName := '';
  end else if G_nFormLanguageType = 2 then
  begin
    ed_CompanyName.ImeMode := imAlpha;
    ed_CompanyName.ImeName := '';
  end;
  BuildingDoorCodeList := TStringList.Create;
  BuildingArmAreaCodeList := TStringList.Create;
  GradeArmAreaCodeList := TStringList.Create;
  GradeDoorCodeList := TStringList.Create;
  NotGradeArmAreaCodeList := TStringList.Create; //��������� ���� �������Ʈ
  NotGradeDoorCodeList := TStringList.Create;  //���Ա����� ���� ����Ʈ
  FontSetting;

end;

procedure TfmCompanyModal.FormGradeRefresh;
begin
  if IsInsertGrade or IsUpdateGrade or IsDeleteGrade then PopupMenu := pm_Work;
  pm_ChiledCodeAdd.Enabled := IsInsertGrade;
  pm_DeleteCode.Enabled := IsDeleteGrade;
  pm_UpdateCode.Enabled := IsUpdateGrade;
end;

procedure TfmCompanyModal.FormIDSetting(aID: string);
begin
  L_stMenuID := aID;
end;

procedure TfmCompanyModal.FormNameSetting;
begin
  List.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONLIST01');
  pm_ChiledCodeAdd.Caption := dmFormFunction.GetFormName('2','2','BM2_011pm001');
  pm_DeleteCode.Caption := dmFormFunction.GetFormName('0','2','BUTTONDEL001');
  pm_UpdateCode.Caption := dmFormFunction.GetFormName('0','2','BUTTONUPDATE001');
  btn_Save.Caption := dmFormFunction.GetFormName('0','2','BUTTONSAVE001');
  btn_Cancel.Caption := dmFormFunction.GetFormName('0','2','BUTTONCANCEL001');
  lb_CompanyName.Caption.Text := dmFormFunction.GetFormName('0','2','COMMONCOMPANYNAME');

end;

procedure TfmCompanyModal.FormResize(Sender: TObject);
begin
  btn_Close.Left := AdvOfficePager1.Width - btn_Close.Width - 10;
  btn_minimize.Left := btn_Close.Left - btn_minimize.Width - 2;
end;

procedure TfmCompanyModal.FormShow(Sender: TObject);
begin
  FormResize(self);
  FormNameSetting;
  fmMain.FORMENABLE(con_FormBMOSCOMPANYCODE,'TRUE');

  LoadCompanyTreeView('',tv_CompanyList,tv_CompanyCode,con_LocalCompanyImageIndex);
end;

procedure TfmCompanyModal.Form_Close;
begin
  Close;
end;

procedure TfmCompanyModal.pm_ChiledCodeAddClick(Sender: TObject);
var
  stMessage : string;
begin
  inherited;
  if tv_CompanyList.Selected = nil then
  begin
    stMessage := dmFormMessage.GetMessage('SELECTERROR');
    stMessage := stringReplace(stMessage,'$WORK',pm_ChiledCodeAdd.Caption,[rfReplaceAll]);
    showmessage(stMessage);
    Exit;
  end;
  Pan_Companycode.Visible := True;
  Pan_Companycode.Caption.Text := pm_ChiledCodeAdd.Caption;
  ed_SelectCode.Text := tv_CompanyCode.Items.Item[tv_CompanyList.Selected.AbsoluteIndex].Text;
  L_stWork := 'CHILDCODEADD';
  ed_CompanyName.Text := '';
  ed_CompanyName.SetFocus;
end;

procedure TfmCompanyModal.pm_DeleteCodeClick(Sender: TObject);
var
  stMessage : string;
  stCode : string;
  stSql : string;
begin
  inherited;
  if tv_CompanyList.Selected = nil then
  begin
    stMessage := dmFormMessage.GetMessage('SELECTERROR');
    stMessage := stringReplace(stMessage,'$WORK',pm_DeleteCode.Caption,[rfReplaceAll]);
    showmessage(stMessage);
    Exit;
  end;

  stCode := tv_CompanyCode.Items.Item[tv_CompanyList.Selected.AbsoluteIndex].Text;
  if dmDBFunction.CheckTB_EMPLOYEE_CompanyCodeLike(stCode) = 1 then
  begin
    showmessage('�ش� �Ҽ��� ��������� �����մϴ�. ��������� �Ҽ��� ���� �� �۾� �Ͻñ� �ٶ��ϴ�.');
    Exit;
  end;


  stMessage := stringReplace(dmFormMessage.GetMessage('WORKMESSAGE'),'$WORK',pm_DeleteCode.Caption,[rfReplaceAll]);
  if (Application.MessageBox(PChar(stMessage),'Information',MB_OKCANCEL) = IDCANCEL)  then Exit;
  stSql := ' Update TB_COMPANYCODE set CO_CODEUSE = ''0'' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE LIKE ''' + stCode + '%'' ';
  dmDataBase.ProcessExecSQL(stSql);
//  dmDBUpdate.UpdateTB_COMPANYCODE_Field_StringValue(stCode,'CO_CODEUSE','0');
  LoadCompanyTreeView(stCode,tv_CompanyList,tv_CompanyCode,con_LocalCompanyImageIndex);
end;

procedure TfmCompanyModal.pm_UpdateCodeClick(Sender: TObject);
var
  stMessage : string;
begin
  inherited;
  if tv_CompanyList.Selected = nil then
  begin
    stMessage := dmFormMessage.GetMessage('SELECTERROR');
    stMessage := stringReplace(stMessage,'$WORK',pm_UpdateCode.Caption,[rfReplaceAll]);
    showmessage(stMessage);
    Exit;
  end;
  Pan_Companycode.Visible := True;
  Pan_Companycode.Caption.Text := pm_UpdateCode.Caption;
  ed_SelectCode.Text := tv_CompanyCode.Items.Item[tv_CompanyList.Selected.AbsoluteIndex].Text;
  ed_CompanyName.Text := tv_CompanyList.Items.Item[tv_CompanyList.Selected.AbsoluteIndex].Text;
  L_stWork := 'SELECTCODEUPDATE';
  ed_CompanyName.SetFocus;
end;

end.
