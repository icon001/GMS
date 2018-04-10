unit uCardCreate;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, AdvGroupBox,
  AdvGlowButton, AdvEdit, AdvSmoothLabel, AdvSmoothPanel,ActiveX,ADODB;

type
  TfmCardCreate = class(TForm)
    Pan_Emcode: TAdvSmoothPanel;
    lb_CompanyName: TAdvSmoothLabel;
    lb_EmCode: TAdvSmoothLabel;
    lb_HandPhone: TAdvSmoothLabel;
    lb_EmployeeName: TAdvSmoothLabel;
    ed_GLCode: TAdvEdit;
    ed_emSeq: TAdvEdit;
    ed_CompanyName: TAdvEdit;
    ed_Name: TAdvEdit;
    ed_Handphone: TAdvEdit;
    pan_AddWork: TAdvSmoothPanel;
    btn_Save: TAdvGlowButton;
    btn_Cancel: TAdvGlowButton;
    ed_SelectCompanyCode: TAdvEdit;
    gb_Card: TAdvGroupBox;
    ed_RegCardNo: TAdvEdit;
    pan_FingerCard: TPanel;
    ed_GlSeq: TAdvEdit;
    AdvGlowButton2: TAdvGlowButton;
    AdvSmoothLabel3: TAdvSmoothLabel;
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    Function EmployeePermitToCardLoad(aEmSeq:string):Boolean;
  public
    { Public declarations }
  end;

var
  fmCardCreate: TfmCardCreate;

implementation

uses
  uCommonFunction,
  uCommonVariable,
  uDataBase,
  uDBCardPermit,
  uDBFunction,
  uDBInsert,
  uDBUpdate,
  uMain,
  uEmployeeRelay,
  uFingerVariable,
  uSupremaFinger;

{$R *.dfm}

procedure TfmCardCreate.btn_CancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCardCreate.btn_SaveClick(Sender: TObject);
var
  stMessage : string;
  stParentCode : string;
  stEmCode,stEmName,stEmStateCode : string;
  stEmSeq,stCompanyCode,stPosiCode,stGubunCode : string;
  stACType,stATType,stFdType : string;
  stEmGroupCode : string;
  stFingerCardNo : string;
  stOldCardNo : string;
  i : integer;
  stTempEmSeq,stTempEmCode,stTempEmName : string;
  stCardGubun,stCardState : string;
  nIndex : integer;
  stPositionNum : string;
  stRelayID : string;
  stCardGroupType : string; //ī�� ���� �׷� Ÿ��
  stAWCode : string;
  stFingerUse : string;
  stFingerCard,stFingerCardState : string;
  TempAdoQuery : TADOQuery;
  stSql : string;
  bGradeUpdate : Boolean;
  stCardUse : string;
  stCardType : string;
  stEmGubunCode : string;
  stTemp : string;
  stTemp1 : string;
  stDate : string;
begin
  inherited;
  bGradeUpdate := False;
  stDate :=  FormatDateTime('yyyymmdd',Now);
  Try
    btn_Save.Enabled := False;

    stCardGubun := '0'; //��������ī��� �ν�����

    if ed_RegCardNo.Text = '' then
    begin
      showmessage('ī���ȣ�� ���� �� �����ϼ���.');
      Exit;
    end;

    if ed_RegCardNo.Text <> '' then ed_RegCardNo.Text := FillCharString(ed_RegCardNo.Text,'*',16,False);
    stCardState := '1';

    bGradeUpdate := True;
    if ed_RegCardNo.Text <> '' then
    begin
      stCompanyCode := '0003';
      stEmCode := ed_GLCode.Text;
      stEmName := ed_Name.Text;

      stPosiCode := '0';
      stEmGubunCode := '0';
      stEmSeq := dmDBFunction.GetNextTB_EMPLOYEE_EmSeq;

      dmDBInsert.InsertIntoTB_EMPLOYEE_Value(stEmSeq,stEmCode,stEmName,stCompanyCode,stPosiCode,stEmGubunCode,'','','','',
                                                       stDate,'20301231','1','1','1','0','3','0','1','1','0','1',stDate,'01');
      dmDBInsert.InsertIntoTB_EMPLOYEEHIS_CopyEmployee(stEmSeq,con_ComWorkType_INSERT); //������� Update ���� ������. ī�带 ó�� �ϰ� ������� �Է� �Ŀ� ���ܾ� ������ ���� ����

      //��� ���� �Է� ����.
      dmEmployeeRelay.EmployeePermitCreate(stEmSeq,ed_GlSeq.Text,ed_emSeq.Text);


      if dmDBFunction.CheckTB_GUESTLIST_GLCode(stDate,stEmCode,stTemp1)= 1 then
      begin
        dmDBUpdate.UpdateTB_GUESTLIST_Value(stTemp1,stEmName,stDate,'20301231',ed_CompanyName.Text,'','Y');
        dmDBUpdate.UpdateTB_GUESTLIST_Field_StringValue(stTemp1,'GL_CARDNO',ed_RegCardNo.Text);
        dmDBUpdate.UpdateTB_GUESTLIST_Field_IntValue(stTemp1,'GL_WORKFLAG','2');
      end else
      begin
        dmDBInsert.InsertIntoTB_GUESTLIST_Value(stDate,stEmSeq,stEmCode,stEmName,stDate,'20301231',ed_CompanyName.Text,'',ed_RegCardNo.Text,'N','2','01');
      end;

      if dmDBFunction.checkTB_CARD_CARDNO(ed_RegCardNo.Text,stCardType,stTemp,stEmCode,stEmName) = 1 then
      begin
        dmDBUpdate.UpdateTB_CARD_Value(ed_RegCardNo.Text,stCardState,stCardGubun,stEmSeq);
      end else
      begin
        stPositionNum := dmDBFunction.GetNextTB_CARD_PositionNum;
        stRelayID := dmDBFunction.GetNextTB_CARD_RelayID;
        dmDBInsert.InsertIntoTB_CARD_Value(ed_RegCardNo.Text,stCardState,stCardGubun,stPositionNum,stRelayID,'0',stEmSeq);
        dmDBInsert.InsertIntoTB_CARDHIS_CopyCard(ed_RegCardNo.Text,ed_RegCardNo.Text,con_ComWorkType_INSERT); //ī�� �Է� �̷� ������.
      end;
      stCardUse := '1';
      dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(stEmSeq,'em_statecode','1');
      dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(stEmSeq,'EM_CARDUSE',stCardUse);
      if (G_nSystmRelayUse = 1) and (G_nSystmRelayCustomerNo = 2) then
      begin
        dmEmployeeRelay.CardInfoSKChungcheongRelay(ed_glCode.text,stEmName,ed_RegCardNo.Text);
        dmEmployeeRelay.VisitCardCreateTime(ed_glCode.text,ed_RegCardNo.Text);
      end;

    end;
    dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_EmSeqApply(stEmSeq,'N'); //�ش� ����� ���� ���� �κ��� �� �۾� - ������ ī�尡 �ְų� �߰��� ī�尡 �����Ƿ�
    dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_EmSeqFingerApply(stEmSeq,'','','','','N');

    dmDBUpdate.UpdateTB_EMPLOYEE_Field_StringValue(stEmSeq,'EM_MEMLOAD','N');  //�������� �޸� �ε�����.
    EmployeePermitToCardLoad(stEmSeq);

    //�湮�� ���̺��� �����̷� ��������.
    dmDBUpdate.UpdateTB_GUESTLIST_Field_StringValue(stEmSeq,'GL_INTIME',formatDateTime('hhnnss',now));
  Finally
    btn_Save.Enabled := True;
  End;
  close;
end;



function TfmCardCreate.EmployeePermitToCardLoad(aEmSeq: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_EmSeqApplyNew(aEmSeq,'N','R');

  stSql := ' Select ND_NODENO,DE_ECUID,EM_SEQ from TB_CARDPERMITEMPLOYEECODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + G_stGroupCode + ''' ';
  stSql := stSql + ' AND EM_SEQ = ' + aEmSeq + ' ';
  stSql := stSql + ' AND CP_APPLY = ''R'' ';
  stSql := stSql + ' GROUP BY ND_NODENO,DE_ECUID,EM_SEQ ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      //SQL.Clear;
      SQL.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then Exit;
      while Not Eof do
      begin
        dmDBCardPermit.EmployeePermitToCardDeviceLoad(FindField('ND_NODENO').AsString,FindField('DE_ECUID').AsString,FindField('EM_SEQ').AsString);
        Next;
      end;
      dmDBUpdate.UpdateTB_CARDPERMITEMPLOYEECODE_EmSeqApplyNew(aEmSeq,'R','Y');
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := True;
end;

procedure TfmCardCreate.FormActivate(Sender: TObject);
var
  stCardNo : string;
  nResult : UF_RET_CODE;
begin
  if G_nCardRegisterType = 1 then
  begin
    Try
      if Not dmSupremaFinger.Connected then
      begin
        dmSupremaFinger.DeviceIP := G_stCardRegisterIP;
        dmSupremaFinger.DevicePort := strtoint(G_stCardRegisterFingerPort);
        dmSupremaFinger.SocketOPEN := True;
      end;
      if Not dmSupremaFinger.Connected then
      begin
        showmessage('�������� ���� ����');
        Exit;
      end;
      pan_FingerCard.Caption := 'ī�带 ���������� �±��Ͽ� �ּ���';
      pan_FingerCard.Visible := True;
      Application.ProcessMessages;
      nResult := dmSupremaFinger.GetReadCardNo(stCardNo);
      dmSupremaFinger.SocketOPEN := False;
      if nResult = UF_RET_SUCCESS then
      begin
        ed_RegCardNo.Text := stCardNo;
        pan_FingerCard.Visible := False;
      end else
      begin
        showmessage('ī�� �б⿡ ���� �Ͽ����ϴ�.');
        pan_FingerCard.Visible := False;
        Exit;
      end;
    Finally

    End;

  end;
end;


end.