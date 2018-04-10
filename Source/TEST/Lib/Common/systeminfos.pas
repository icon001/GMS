unit systeminfos;

interface
uses
 Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
 ComCtrls, ScktComp, StdCtrls, ExtCtrls, ToolWin, ActnList, ImgList,
 Menus, winSock, IniFiles, MMSystem, DdeMan, AppEvnts;//, Global;


const
 SystemBasicInformation = 0;
 SystemPerformanceInformation = 2;
 SystemTimeInformation = 3;

type
 TPDWord = ^DWORD;

 TSystem_Basic_Information = packed record
   dwUnknown1               : DWORD;
   uKeMaximumIncrement      : ULONG;
   uPageSize                : ULONG;
   uMmNumberOfPhysicalPages : ULONG;
   uMmLowestPhysicalPage    : ULONG;
   uMmHighestPhysicalPage   : ULONG;
   uAllocationGranularity   : ULONG;
   pLowestUserAddress       : Pointer;
   pMmHighestUserAddress    : Pointer;
   uKeActiveProcessors      : ULONG;
   bKeNumberProcessors      : byte;
   bUnknown2                : byte;
   wUnknown3                : word;
 end;

type
 TSystem_Performance_Information = packed record
   liIdleTime: LARGE_INTEGER; {LARGE_INTEGER}
   dwSpare   : array[0..75] of DWORD;
 end;

type
 TSystem_Time_Information = packed record
   liKeBootTime      : LARGE_INTEGER;
   liKeSystemTime    : LARGE_INTEGER;
   liExpTimeZoneBias : LARGE_INTEGER;
   uCurrentTimeZoneId: ULONG;
   dwReserved        : DWORD;
 end;

var
   NtQuerySystemInformation: function(infoClass: DWORD;
   buffer:pointer;
   bufSize: DWORD;
   returnSize: TPDword): DWORD; stdcall = nil;

   liOldIdleTime: LARGE_INTEGER = ();
   liOldSystemTime: LARGE_INTEGER = ();


  function GetCPUUsage:integer;
  procedure GetBuildInfo(var V1, V2, V3, V4: Word);
  function strBuildInfo: String;

implementation


procedure GetBuildInfo(var V1, V2, V3, V4: Word);
var
   VerInfoSize,
   VerValueSize,
   Dummy       : DWORD;
   VerInfo	   : Pointer;
   VerValue	   : PVSFixedFileInfo;
begin
	 VerInfoSize := GetFileVersionInfoSize(PChar(ParamStr(0)), Dummy);
	 GetMem(VerInfo, VerInfoSize);
	 GetFileVersionInfo(PChar(ParamStr(0)), 0, VerInfoSize, VerInfo);
	 VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
	 With VerValue^ do
	 begin
	 	V1 := dwFileVersionMS shr 16;
		V2 := dwFileVersionMS and $FFFF;
		V3 := dwFileVersionLS shr 16;
		V4 := dwFileVersionLS and $FFFF;
	end;
	FreeMem(VerInfo, VerInfoSize);
end;

function strBuildInfo: String;
var
  V1, V2, V3, V4: Word;
begin
  GetBuildInfo(V1, V2, V3, V4);
  Result := IntToStr(V1) + '.' +
            IntToStr(V2) + '.' +
            IntToStr(V3) + '.' +
            IntToStr(V4);
end;


function Li2Double(x: LARGE_INTEGER): Double;
begin
 Result := x.HighPart * 4.294967296E9 + x.LowPart
end;

function GetCPUUsage:integer;
var
   SysBaseInfo: TSystem_Basic_Information;
   SysPerfInfo: TSystem_Performance_Information;
   SysTimeInfo: TSystem_Time_Information;
   status: Longint; {long}
   dbSystemTime: Double;
   dbIdleTime: Double;
begin
   result := 0;

   if @NtQuerySystemInformation = nil then
       NtQuerySystemInformation := GetProcAddress(GetModuleHandle('ntdll.dll'), 'NtQuerySystemInformation');

   // get number of processors in the system
   status := NtQuerySystemInformation(SystemBasicInformation, @SysBaseInfo, SizeOf(SysBaseInfo), nil);
   if status <> 0 then Exit;

   // Showmessage 는 불필요하여 막아놓음.
{    with SysBaseInfo do begin
       ShowMessage(Format('uKeMaximumIncrement: %d'#13'uPageSize: %d'#13+
       'uMmNumberOfPhysicalPages: %d'+#13+'uMmLowestPhysicalPage: %d'+#13+
       'uMmHighestPhysicalPage: %d'+#13+'uAllocationGranularity: %d'#13+
       'uKeActiveProcessors: %d'#13'bKeNumberProcessors: %d',
       [uKeMaximumIncrement, uPageSize, uMmNumberOfPhysicalPages,
       uMmLowestPhysicalPage, uMmHighestPhysicalPage, uAllocationGranularity,
       uKeActiveProcessors, bKeNumberProcessors]));
   end;}


   // get new system time
   status := NtQuerySystemInformation(SystemTimeInformation, @SysTimeInfo, SizeOf(SysTimeInfo), nil);
   if status <> 0 then Exit;

   // get new CPU's idle time
   status := NtQuerySystemInformation(SystemPerformanceInformation, @SysPerfInfo, SizeOf(SysPerfInfo), nil);
   if status <> 0 then Exit;

   // if it's a first call - skip it
   if (liOldIdleTime.QuadPart <> 0) then begin
       // CurrentValue = NewValue - OldValue
       dbIdleTime := Li2Double(SysPerfInfo.liIdleTime) - Li2Double(liOldIdleTime);
       dbSystemTime := Li2Double(SysTimeInfo.liKeSystemTime) - Li2Double(liOldSystemTime);

       // CurrentCpuIdle = IdleTime / SystemTime
       if dbSystemTime > 0 then begin
           dbIdleTime := dbIdleTime / dbSystemTime;

           // CurrentCpuUsage% = 100 - (CurrentCpuIdle * 100) / NumberOfProcessors
           dbIdleTime := 100.0 - dbIdleTime * 100.0 / SysBaseInfo.bKeNumberProcessors + 0.5;

           // Show Percentage
           // FormatFloat('CPU Usage: 0.0 %', dbIdleTime);
           result := round(dbIdleTime);
           // Application.ProcessMessages;
       end;
   end;

   // store new CPU's idle and system time
   liOldIdleTime := SysPerfInfo.liIdleTime;
   liOldSystemTime := SysTimeInfo.liKeSystemTime;
   
end;

end.

