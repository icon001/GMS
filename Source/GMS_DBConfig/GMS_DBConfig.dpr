program GMS_DBConfig;

uses
  Forms,
  System.SysUtils,
  uLink in 'uLink.pas' {Form1},
  uDataBase in '..\..\Lib\DataBase\uDataBase.pas' {dmDataBase: TDataModule},
  uDataBaseConfig in '..\..\Lib\DataBase\uDataBaseConfig.pas' {fmDataBaseConfig},
  uCommonEvent in '..\..\Lib\Common\uCommonEvent.pas',
  uDBInsert in '..\..\Lib\DataBase\uDBInsert.pas' {dmDBInsert: TDataModule},
  uDBUpdate in '..\..\Lib\DataBase\uDBUpdate.pas' {dmDBUpdate: TDataModule},
  uCommonVariable in '..\..\Lib\Common\uCommonVariable.pas',
  uDBCreate in '..\..\Lib\DataBase\uDBCreate.pas' {dmDBCreate: TDataModule},
  uCommonFunction in '..\..\Lib\Common\uCommonFunction.pas',
  uDBFormName in '..\..\Lib\DataBase\uDBFormName.pas' {dmFormName: TDataModule},
  uDBFormMessage in '..\..\Lib\DataBase\uDBFormMessage.pas' {dmFormMessage: TDataModule},
  uDBFunction in '..\..\Lib\DataBase\uDBFunction.pas' {dmDBFunction: TDataModule},
  uSolarLunar in '..\..\Lib\Date\uSolarLunar.pas';

{$R *.res}
{$R manifest.RES}

begin
  Application.Initialize;
  if FileExists(ExtractFileDir(Application.ExeName) + '\logo.ico') then
  begin
    Application.Icon.LoadFromFile(ExtractFileDir(Application.ExeName) + '\logo.ico');
  end;
  Application.CreateForm(TdmDataBase, dmDataBase);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
