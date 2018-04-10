program GMS_ServerManager;

uses
  Vcl.Forms,
  System.Classes,
  System.SysUtils,
  Winapi.Windows,
  uMain in 'fmMain\uMain.pas' {fmMain},
  uCommonFunction in '..\..\Lib\Common\uCommonFunction.pas',
  uSharedMemory in '..\..\Lib\Common\SharedMemory\uSharedMemory.pas',
  uDeviceVariable in '..\..\Lib\Device\uDeviceVariable.pas',
  uCommonVariable in '..\..\Lib\Common\uCommonVariable.pas',
  uDataBase in '..\..\Lib\DataBase\uDataBase.pas' {dmDataBase: TDataModule},
  uDataBaseConfig in '..\..\Lib\DataBase\uDataBaseConfig.pas' {fmDataBaseConfig},
  uCommonEvent in '..\..\Lib\Common\uCommonEvent.pas',
  uDBUpdate in '..\..\Lib\DataBase\uDBUpdate.pas' {dmDBUpdate: TDataModule},
  uDBCreate in '..\..\Lib\DataBase\uDBCreate.pas' {dmDBCreate: TDataModule},
  uDBFunction in '..\..\Lib\DataBase\uDBFunction.pas' {dmDBFunction: TDataModule},
  uDBInsert in '..\..\Lib\DataBase\uDBInsert.pas' {dmDBInsert: TDataModule},
  uSolarLunar in '..\..\Lib\Date\uSolarLunar.pas',
  uDBFormMessage in '..\..\Lib\DataBase\uDBFormMessage.pas' {dmFormMessage: TDataModule},
  uDBFormName in '..\..\Lib\DataBase\uDBFormName.pas' {dmFormName: TDataModule},
  uDBDelete in '..\..\Lib\DataBase\uDBDelete.pas' {dmDBDelete: TDataModule},
  uConfig in 'fmConfig\uConfig.pas' {fmConfig},
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
  uDBCardPermit in '..\..\Lib\DataBase\uDBCardPermit.pas' {dmDBCardPermit: TDataModule};

{$R *.res}

{$R manifest.RES}

var
hMutex : LongInt;
DaemonGubun:string;
FindHandle: THandle;
ProcessList : TStringList;
i : integer;
ProcId: DWORD;
hProcess: THandle;
//TermSucc: BOOL;
pSelfID : DWORD;
begin
  ProcessList := TStringList.Create;
  ProcessList.Clear;
  Process32List(ProcessList);
  GetWindowThreadProcessId(Application.Handle, @pSelfID);
  for i := 0 to ProcessList.Count - 1 do
  begin
    if ProcessList.Strings[i] = ExtractFileName(Application.ExeName) then  //실행 되고 있으면
    begin
      ProcId := DWORD(ProcessList.Objects[i]);
      if ProcID <> pSelfID then
      begin
        Application.Terminate;
        Exit;
        (*hProcess := OpenProcess(PROCESS_ALL_ACCESS, TRUE, ProcId);
        if hProcess <> 0 then
        begin
          // 명시한 process를 강제 종료시킨다
          TerminateProcess(hProcess, 0);
        end;
        FindHandle := GetWinHandle(ProcID);
        //FindHandle := GetWinHandle(pi.dwProcessId);
        //FindHandle := WindowFromProcessID(ProcID);
        If FindHandle <> 0 then
        begin
           //GetWindowText(FindHandle, strCaption[0], 255);
           //SendMessage(FindHandle,WM_USER,SC_MAXIMIZE,0);
           //SendMessage(FindHandle,WM_USER,SC_CLOSE,0);
           PostMessage(FindHandle,WM_USER,SC_CLOSE,0);
        end; *)
      end;
    end;
  end;
  Application.Initialize;
  if FileExists(ExtractFileDir(Application.ExeName) + '\logo.ico') then
  begin
    Application.Icon.LoadFromFile(ExtractFileDir(Application.ExeName) + '\logo.ico');
  end;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmDataBase, dmDataBase);
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TfmConfig, fmConfig);
  Application.CreateForm(TdmDBCardPermit, dmDBCardPermit);
  Application.Run;
end.
