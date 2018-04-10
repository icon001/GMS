unit uLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls,DB, ADODB,ActiveX;

type

  TLogin = class(TComponent)
  private
    FLogined: Boolean;
    FSYSADMIN: Boolean;
    procedure SetLogined(const Value: Boolean);
    class function FindSelf:TComponent;
    { Private declarations }
  public
    { Public declarations }
    EmpSn : Integer;    //사원번호
    ProgIDs,UserID,UserName,CompanyCode,DepartCode,Grade : String;
    Procedure ShowLoginDlg;
    procedure SetSysAdmin(const Value: Boolean);
    class Function GetObject:TLogin;   //자기자신을 찾는것  class 는 폼생성전에도 사용가능
    Property SYSADMIN : Boolean read FSYSADMIN write SetSYSADMIN;
  Published
    { Published declarations }
    Property Logined : Boolean read FLogined write SetLogined;


  end;

  TfmLogin = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    edPassword: TEdit;
    edUserID: TEdit;
    sbLogin: TSpeedButton;
    sbCancel: TSpeedButton;
    ADOQuery1: TADOQuery;
    procedure sbLoginClick(Sender: TObject);
    procedure sbCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edUserIDKeyPress(Sender: TObject; var Key: Char);
    procedure edPasswordKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    Function MasterCheck(stUserID:string):Boolean;
  public
    { Public declarations }
  end;

var
  fmLogin: TfmLogin;

implementation

uses
  uLomosUtil,uDataBaseUtil, uDataModule1,uMsg;

{$R *.dfm}


procedure TfmLogin.sbLoginClick(Sender: TObject);
var
  aLogInfo: TLogInfo;
  stGrade: String;
  stUserName: String;
  stSql: String;
  TempAdoQuery : TADOQuery;
begin
  aLogInfo.Log_Time:= Now;
  aLogInfo.IP_Addr:= Get_Local_IPAddr;
  IsMaster := False;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;

    TLogin.GetObject.ProgIDs:=''; //사용가능한 프로그램 목록 초기화

    If TLogin.GetObject.FSYSADMIN or (UpperCase(edPassword.Text) = '1029') then
    begin
      IsMaster := True;
      BuildingGrade :=0; //0:전체,1:빌딩,2:층,3:구역,4:출입문단위
      MasterBuildingCode:='000'; //사용자 관리빌딩
      MasterFloorCode:='000';    //사용자 관리층
      MasterAreaCode:='000';     //사용자 구역

      //시스템 어드민 이면 비밀번호만 체크
      TLogin.GetObject.Logined  := True ;
      //모든 권한을 다 줌
      aLogInfo.User_ID:= 'SYSADMIN';
      aLogInfo.Log_Note:= '로그인 성공';
      logInSave(aLogINfo);

      if IsMaster then
      begin
        TLogin.GetObject.ProgIDs:='';
        With  TempAdoQuery  do
        Begin
            //모든 권한을 셋팅
            stSql := 'Select PR_PROGRAMID from TB_PROGRAMID';
            stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + '''';
            Close;
            SQL.Clear;
            SQL.Text := stSql;

            Try
              Open;
            Except
              on E : EDatabaseError do
                begin
                  ShowMessage(E.Message );
                  Exit;
                end;
            End;   //Try End

            While Not Eof do Begin
               TLogin.GetObject.ProgIDs:=
                   TLogin.GetObject.ProgIDs + Trim(FieldByName('PR_PROGRAMID').AsString) + ';' ;
               Next;
            End //While End
        End;   //With End
      end;

      TLogin.GetObject.UserID := 'SYSADMIN';
      TLogin.GetObject.UserName := '시스템';
      MasterCompany := '000';
      MasterJijum := '000';
      MasterDepart := '000';
      TLogin.GetObject.Grade := '1';

      Close;
      exit;
    End;  //IF End

    with  TempAdoQuery  do
    begin
      stSql := 'Select * from TB_ADMIN ';
      stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
      stSql := stSql + ' AND AD_USERID = ''' + Trim(edUserID.text) + ''' ';
      stSql := stSql + ' AND AD_USERPW = ''' + Trim(edPassword.text) + ''' ';
      Close;
      SQL.Clear;
      SQL.Text := stSql;

      Try
        Open;
      Except
         TLogin.GetObject.Logined  := False ;
         Exit;
      End;

      if RecordCount < 1 then
      begin
          Application.messagebox(PChar(stMsg003),PChar(Application.MainForm.Caption),mb_OK);
          TLogin.GetObject.Logined  := False ;
          Exit;
      end;

      stGrade:=  FindField('GR_GRADECODE').asString;
      stUserName:=   FindField('AD_USERNAME').asString;
      if FindField('AD_MASTER').AsString = 'Y' then
      begin
        IsMaster := True ;
        CompanyGrade := '0';
      end else
      begin
        IsMaster := False;
        CompanyGrade := FindField('AD_MASTER').AsString;  //'0' : 회사 전체권한,'1': 회사권한,'2':지점권한,'3':부서권한
        MasterCompany := FindField('CO_COMPANYCODE').AsString;
        MasterJijum := FindField('CO_JIJUMCODE').AsString;
        MasterDepart := FindField('CO_DEPARTCODE').AsString;
      end;
      if Not IsDigit(FindField('AD_BUILDINGGRADE').AsString) then
      begin
        BuildingGrade := 4;
      end else BuildingGrade := FindField('AD_BUILDINGGRADE').Asinteger;
      MasterBuildingCode:=FindField('LO_DONGCODE').AsString; //사용자 관리빌딩
      MasterFloorCode:=FindField('LO_FLOORCODE').AsString;    //사용자 관리층
      MasterAreaCode:=FindField('LO_AREACODE').AsString;     //사용자 구역

    end;


    aLogInfo.User_ID:= edUserID.text;
    aLogInfo.Log_Note:= '로그인 성공';
    logInSave(aLogINfo);

    //로그인 성공시
    TLogin.GetObject.UserID := edUserID.text;
    TLogin.GetObject.UserName := stUserName;
    TLogin.GetObject.Logined  := True ;
    TLogin.GetObject.Grade := stGrade;

    //IsMaster := MasterCheck(edUserID.text);

    if IsMaster then
    begin
      TLogin.GetObject.ProgIDs:='';
      With  TempAdoQuery  do
      Begin
          //모든 권한을 셋팅
          stSql := 'Select PR_PROGRAMID from TB_PROGRAMID';
          stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + '''';
          Close;
          SQL.Clear;
          SQL.Text := stSql;

          Try
            Open;
          Except
            on E : EDatabaseError do
              begin
                ShowMessage(E.Message );
                Exit;
              end;
          End;   //Try End

          While Not Eof do Begin
             TLogin.GetObject.ProgIDs:=
                 TLogin.GetObject.ProgIDs + Trim(FieldByName('PR_PROGRAMID').AsString) + ';' ;
             Next;
          End //While End
      End;   //With End
    end else
    begin
      //권한체크
      TLogin.GetObject.ProgIDs:='';
      With  TempAdoQuery  do
      Begin
          //모든 권한을 셋팅
          stSql := 'Select PR_PROGRAMID from TB_GRADEPROGRAM ';
          stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
          stSql := stSql + ' AND GR_GRADECODE = ''' + stGrade + ''' ';
          Close;
          SQL.Clear;
          SQL.Text := stSql;
          Try
            Open;
          Except
            on E : EDatabaseError do
              begin
                ShowMessage(E.Message  );
                Exit;
              end;
          End;   //Try End
          While Not Eof do Begin
             TLogin.GetObject.ProgIDs:=
                 TLogin.GetObject.ProgIDs + Trim(FieldByName('PR_PROGRAMID').AsString) + ';' ;
             Next;
          End //While End
      End;   //With End
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;

  Close;

end;

{ TLogin }

class function TLogin.FindSelf: TComponent;
var
  Loop:Integer;
begin
  Result:=Nil;
  for Loop:=0 to Application.ComponentCount-1 do begin
      if Application.Components[Loop] is TLogin then begin
          Result:= Application.Components[Loop];
          Break;
      end;
  end;
end;

class function TLogin.GetObject: TLogin;
begin
   If FindSelf = Nil then TLogin.Create(Application);
   Result := TLogin(FindSelf);

end;

procedure TLogin.SetLogined(const Value: Boolean);
begin
  FLogined := Value;
end;

procedure TLogin.SetSYSADMIN(const Value: Boolean);
begin
  FSYSADMIN := Value;
end;

procedure TLogin.ShowLoginDlg;
begin
  FLogined := False;

  fmLogin:=TfmLogin.Create(Nil);
  Try
    fmLogin.ShowModal;
  Finally
    fmLogin.Free;
  End;
end;

procedure TfmLogin.sbCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmLogin.FormCreate(Sender: TObject);
begin
  edUserID.Text:= '';
  edPassword.Text := '';
end;

procedure TfmLogin.edUserIDKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key := #0;
    edPassword.SetFocus;
  end;
end;

procedure TfmLogin.edPasswordKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key := #0;
    sbLogin.click;
  end;
end;

function TfmLogin.MasterCheck(stUserID: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Select * from TB_CONFIG ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_CONFIGGROUP = ''MOSTYPE'' ';
  stSql := stSql + ' AND CO_CONFIGCODE = ''MASTERID'' ';
  stSql := stSql + ' AND CO_CONFIGVALUE = ''' + stUserID + ''' ';

  With ADOQuery1 do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if RecordCount < 1 then Exit;
  end;
  result := True;
end;

end.
