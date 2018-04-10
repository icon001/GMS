program Academy_Manager;

uses
  Vcl.Forms,
  System.SysUtils,
  uMain in 'uMain.pas' {fmMain},
  uDataBase in '..\..\Lib\DataBase\uDataBase.pas' {dmDataBase: TDataModule},
  uDataBaseConfig in '..\..\Lib\DataBase\uDataBaseConfig.pas' {fmDataBaseConfig},
  uDBAlter in '..\..\Lib\DataBase\uDBAlter.pas' {dmDBAlter: TDataModule},
  uDBCreate in '..\..\Lib\DataBase\uDBCreate.pas' {dmDBCreate: TDataModule},
  uDBDelete in '..\..\Lib\DataBase\uDBDelete.pas' {dmDBDelete: TDataModule},
  uDBFingerRelay in '..\..\Lib\DataBase\uDBFingerRelay.pas' {dmFingerDBRelay: TDataModule},
  uDBFormMessage in '..\..\Lib\DataBase\uDBFormMessage.pas' {dmFormMessage: TDataModule},
  uDBFormName in '..\..\Lib\DataBase\uDBFormName.pas' {dmFormName: TDataModule},
  uDBFunction in '..\..\Lib\DataBase\uDBFunction.pas' {dmDBFunction: TDataModule},
  uDBInsert in '..\..\Lib\DataBase\uDBInsert.pas' {dmDBInsert: TDataModule},
  uDBRelay in '..\..\Lib\DataBase\uDBRelay.pas' {dmDBRelay: TDataModule},
  uDBSelect in '..\..\Lib\DataBase\uDBSelect.pas' {dmDBSelect: TDataModule},
  uDBUpdate in '..\..\Lib\DataBase\uDBUpdate.pas' {dmDBUpdate: TDataModule},
  uDBVariable in '..\..\Lib\DataBase\uDBVariable.pas',
  DIMime in '..\..\Lib\Common\DIMime.pas',
  FileInfo in '..\..\Lib\Common\FileInfo.pas',
  systeminfos in '..\..\Lib\Common\systeminfos.pas',
  uCard in '..\..\Lib\Common\uCard.pas' {dmCard: TDataModule},
  uCommonEvent in '..\..\Lib\Common\uCommonEvent.pas',
  uCommonFunction in '..\..\Lib\Common\uCommonFunction.pas',
  uCommonVariable in '..\..\Lib\Common\uCommonVariable.pas',
  uMessage in '..\..\Lib\Common\uMessage.pas',
  uSolarLunar in '..\..\Lib\Date\uSolarLunar.pas',
  uAdvToolBarSubForm in '..\..\Lib\Form\uAdvToolBarSubForm.pas' {fmAdvToolBarSubForm},
  uSubForm in '..\..\Lib\Form\uSubForm.pas' {fmASubForm},
  uServerClientFunction in '..\..\Lib\MIAMSServer\uServerClientFunction.pas',
  uServerClientVariable in '..\..\Lib\MIAMSServer\uServerClientVariable.pas',
  uPCClient in '..\..\Lib\PCSocket\uPCClient.pas' {dmPCClient: TDataModule},
  u_c_basic_object in '..\..\Lib\Device\Winsockclasses\u_c_basic_object.pas',
  u_c_byte_buffer in '..\..\Lib\Device\Winsockclasses\u_c_byte_buffer.pas',
  u_c_display in '..\..\Lib\Device\Winsockclasses\u_c_display.pas',
  u_c_log in '..\..\Lib\Device\Winsockclasses\u_c_log.pas',
  u_winsock in '..\..\Lib\Device\Winsocket\u_winsock.pas',
  u_characters in '..\..\Lib\Device\Winsockunits\u_characters.pas',
  u_dir in '..\..\Lib\Device\Winsockunits\u_dir.pas',
  u_display_hex_2 in '..\..\Lib\Device\Winsockunits\u_display_hex_2.pas',
  u_file in '..\..\Lib\Device\Winsockunits\u_file.pas',
  u_strings in '..\..\Lib\Device\Winsockunits\u_strings.pas',
  u_types_constants in '..\..\Lib\Device\Winsockunits\u_types_constants.pas',
  uComboBoxCodeLoad in '..\..\Lib\DockForm\uComboBoxCodeLoad.pas',
  uFormDevice in '..\..\Lib\DockForm\uFormDevice.pas' {dmFormDevice: TDataModule},
  uFormDeviceState in '..\..\Lib\DockForm\uFormDeviceState.pas' {DataModule2: TDataModule},
  uFormFunction in '..\..\Lib\DockForm\uFormFunction.pas' {dmFormFunction: TDataModule},
  uFormUtil in '..\..\Lib\DockForm\uFormUtil.pas' {dmFormUtil: TDataModule},
  uFormVariable in '..\..\Lib\DockForm\uFormVariable.pas',
  uCertificatePlan in 'fmCertificatePlan\uCertificatePlan.pas' {fmCertificatePlan},
  uEmployeeRelay in '..\..\Lib\EmployeeRelay\uEmployeeRelay.pas' {dmEmployeeRelay: TDataModule},
  uDBCardPermit in '..\..\Lib\DataBase\uDBCardPermit.pas' {dmDBCardPermit: TDataModule},
  uDeviceVariable in '..\..\Lib\Device\uDeviceVariable.pas',
  uFingerVariable in '..\..\Lib\FingerReader\uFingerVariable.pas',
  uSupremaFinger in '..\..\Lib\FingerReader\uSupremaFinger.pas' {dmSupremaFinger: TDataModule},
  uSupremaServer in '..\..\Lib\FingerReader\uSupremaServer.pas' {dmSupremaServer: TDataModule},
  uSyFpReaderFunction in '..\..\Lib\SHFPReader\uSyFpReaderFunction.pas',
  uLogin in 'Login\uLogin.pas' {fmLogin},
  uLoginVariable in 'Login\uLoginVariable.pas',
  uClientConfig in 'fmClientConfig\uClientConfig.pas' {fmClientConfig},
  uCompany in 'fmCompany\uCompany.pas' {fmCompany},
  uTuitionOFF in 'fmTuitionOFF\uTuitionOFF.pas' {fmTuitionOFF},
  uAdminUserID in 'fmAdminUserID\uAdminUserID.pas' {fmAdminUserID},
  ucertificateClass in 'fmcertificateClass\ucertificateClass.pas' {fmCertificateClass},
  uLectureList in 'fmLectureList\uLectureList.pas' {fmLectureList},
  uEmployeeNotPaymentList in 'fmEmployeeNotPaymentList\uEmployeeNotPaymentList.pas' {fmEmployeeNotPaymentList},
  uLecturePayment in 'fmEmployee\uLecturePayment.pas' {fmLecturePayment},
  uAttendAbsentReport in 'fmAttendAbsentReport\uAttendAbsentReport.pas' {fmAttendAbsentReport},
  uLectureClassCode in 'fmLectureClassCode\uLectureClassCode.pas' {fmLectureClassCode},
  uLectureCode in 'fmLectureCode\uLectureCode.pas' {fmLectureCode},
  uCertificateCode in 'fmCertificateCode\uCertificateCode.pas' {fmCertificateCode},
  uCertificateReceiptSearch in 'fmCertificateReceiptSearch\uCertificateReceiptSearch.pas' {fmCertificateReceiptSearch},
  uCertificateReceipt in 'fmCertificateReceipt\uCertificateReceipt.pas' {fmCertificateReceipt},
  uLectureManager in 'fmLectureManager\uLectureManager.pas' {fmLectureManager},
  uAttendManager in 'fmAttendManager\uAttendManager.pas' {fmAttendManager},
  uAttendMonthReport in 'fmAttendMonthReport\uAttendMonthReport.pas' {fmAttendMonthReport},
  uEmployee in 'fmEmployee\uEmployee.pas' {fmEmployee},
  uAttendReport in 'fmAttendReport\uAttendReport.pas' {fmAttendReport},
  uEmployeePayment in 'fmEmployeePayment\uEmployeePayment.pas' {fmEmployeePayment},
  uEmployeePaymentList in 'fmEmployeePaymentList\uEmployeePaymentList.pas' {fmEmployeePaymentList},
  uBasicInfo in 'fmLectureCode\uBasicInfo.pas' {fmBasicInfo};

{$R *.res}
{$R manifest.RES}

begin
  Application.Initialize;
  if FileExists(ExtractFileDir(Application.ExeName) + '\logo.ico') then
  begin
    Application.Icon.LoadFromFile(ExtractFileDir(Application.ExeName) + '\logo.ico');
  end;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmDataBase, dmDataBase);
  Application.CreateForm(TdmSupremaFinger, dmSupremaFinger);
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TfmBasicInfo, fmBasicInfo);
  Application.Run;
end.
