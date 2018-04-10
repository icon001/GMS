unit FileInfo;
{ ---------------------------------------------------------------------------- } 
{ File Information Object                                                      } 
{                                                                              } 
{ ---------------------------------------------------------------------------- } 
  interface 
{ ---------------------------------------------------------------------------- } 

uses 
  forms, shellapi, windows, sysutils; 

type 
  EFileInfo = exception; 
  TLangInfoBuffer = array [1..4] of SmallInt; 
  TFileInfo = class
    private 
      f : TSearchRec; 
      fVerBlk : TVSFixedFileInfo; 
      fFileName : string; 
      function GetFileVersion( AFileName : string ) : boolean; 
    public 
      constructor Create( AFileName : string ); // Create Object
      destructor  Destroy; override;
      function    Execute : integer;            // Open file with associated 
                                                //   program
      function    VersionString : string;       // File Version. String empty 
                                                //   if string not found
      function    OS : string;                  // Operating System 
      function    Path : string;                // File Path 
      function    FileName : string;            // File Name 
      function    Name : string;                // File Name without file 
                                                //   extension
      function    DosFileName : string;         // DOS File Name 
      function    FileExt : string;             // File Extension 
      function    FileType : string;            // File Type 
      function    FileSize : longint;           // File Size 
      function    isDebugBuild : boolean;       // True if debug build flag is 
                                                //   set
      function    isPreRelease : boolean;       // True if prerelease flag is 
                                                //   set
      function    isPrivateBuild : boolean;     // True if private build flag 
                                                //   is set
      function    isSpecialBuild : boolean;     // True if special build flag 
                                                //   is set
      function    isDirectory : boolean;        // True if file is not a file 
                                                //   but a directory 
      function    isHidden : boolean;           // True if file is hidden 
      function    isSystemFile : boolean;       // True if file is a systemfile 
      function    isVolumeId : boolean;         // True if file is a volumeid 
      function    isArchive : boolean;          // True if file is archived 
      function    CreationTime : TDateTime;     // Creation Date/Time 
      function    LastAccessed : TDateTime;     // Last Accessed Date/Time 
      function    LastWritten : TDateTime;      // Last Written  Date/Time 
  end; 

{ ---------------------------------------------------------------------------- } 
  implementation 
{ ---------------------------------------------------------------------------- } 

constructor TFileInfo.Create( AFileName : string ); 
var 
  ret : integer; 
begin 
  inherited Create; 
  fFileName := AFileName; 
  ret := FindFirst( AFileName, faReadOnly + faHidden+ faSysFile + faVolumeID + 
                    faDirectory + faArchive + faAnyFile, f ); 
  if ret <> 0 then 
    SysUtils.RaiseLastWin32Error; 
end; 

{ ---------------------------------------------------------------------------- } 
destructor TFileInfo.Destroy; 
begin 
  FindClose( f ); 
end; 

{ ---------------------------------------------------------------------------- } 
function  TFileInfo.GetFileVersion( AFileName : string ) : boolean; 
var 
  InfoSize,puLen : DWord; 
  Pt,InfoPtr : Pointer; 
begin 
  InfoSize := GetFileVersionInfoSize( PChar(AFileName), puLen ); 
  fillchar( fVerBlk, sizeof(TVSFixedFileInfo), 0); 
  if InfoSize > 0 then 
  begin 
    GetMem(Pt,InfoSize); 
    GetFileVersionInfo( PChar(AFileName), 0, InfoSize, Pt); 
    VerQueryValue(Pt,'\',InfoPtr,puLen); 
    move(InfoPtr^, fVerBlk, sizeof(TVSFixedFileInfo) ); 
    FreeMem(Pt); 
    result := true; 
  end 
  else 
    result := false; 
end; 

{ ---------------------------------------------------------------------------- } 
function TFileInfo.VersionString : string; 
begin 
  if GetFileVersion( fFileName ) then 
    result := Format('%u.%u.%u.%u', 
              [HiWord(fVerBlk.dwProductVersionMS), 
               LoWord(fVerBlk.dwProductVersionMS), 
               HiWord(fVerBlk.dwProductVersionLS), 
               LoWord(fVerBlk.dwProductVersionLS)]) 
  else 
    result := ''; 
end; 

{ ---------------------------------------------------------------------------- } 
function TFileInfo.isDebugBuild : boolean; 
begin 
  result := FALSE; 
  if GetFileVersion( fFileName ) then 
    result := (fVerBlk.dwFileFlagsMask and fVerBlk.dwFileFlags and 
              VS_FF_DEBUG) <> 0 
end; 

{ ---------------------------------------------------------------------------- } 
function TFIleInfo.isPreRelease : boolean; 
begin 
  result := FALSE; 
  if GetFileVersion( fFileName ) then 
    result := (fVerBlk.dwFileFlagsMask and fVerBlk.dwFileFlags and 
              VS_FF_PRERELEASE) <> 0 
end; 

{ ---------------------------------------------------------------------------- } 
function TFIleInfo.isPrivateBuild : boolean; 
begin 
  result := FALSE; 
  if GetFileVersion( fFileName ) then 
    result := (fVerBlk.dwFileFlagsMask and fVerBlk.dwFileFlags and 
              VS_FF_PRIVATEBUILD) <> 0 
end; 

{ ---------------------------------------------------------------------------- } 
function TFIleInfo.isSpecialBuild : boolean; 
begin 
  result := FALSE; 
  if GetFileVersion( fFileName ) then 
    result := (fVerBlk.dwFileFlagsMask and fVerBlk.dwFileFlags and 
              VS_FF_SPECIALBUILD) <> 0 
end; 

{ ---------------------------------------------------------------------------- } 
function TFileInfo.OS : string; 
begin 
  if GetFileVersion( fFileName ) then 
    case fVerBlk.dwFileOS of 
      VOS_DOS_WINDOWS16 : result := 'MS-DOS or 16 bit Windows'; 
      VOS_DOS_WINDOWS32 : result := '32 bit Windows'; 
      VOS_OS216_PM16    : result := '16 bit OS/2'; 
      VOS_OS232_PM32    : result := '32 bit OS/2'; 
      VOS_NT_WINDOWS32  : result := 'Win32 or Windows NT'; 
    else 
      result := 'Unknown OS'; 
    end 
  else 
    result := ''; 
end; 

{ ---------------------------------------------------------------------------- } 
function TFileInfo.FileType : string; 
var 
  S : string; 
begin 
  S := ''; 
  if GetFileVersion( fFileName ) then 
  begin 
    case fVerBlk.dwFileType of 
      VFT_APP  : S := 'Application'; 
      VFT_DLL  : S := 'Dynamic Link Library (DLL)'; 
      VFT_DRV  : begin 
                   S := 'Device Driver - '; 
                   case fVerBlk.dwFileSubtype of 
                     VFT2_DRV_PRINTER     : S := S + 'Printer'; 
                     VFT2_DRV_KEYBOARD    : S := S + 'Keyboard'; 
                     VFT2_DRV_LANGUAGE    : S := S + 'Language'; 
                     VFT2_DRV_DISPLAY     : S := S + 'Display'; 
                     VFT2_DRV_MOUSE       : S := S + 'Mouse'; 
                     VFT2_DRV_NETWORK     : S := S + 'Network'; 
                     VFT2_DRV_SYSTEM      : S := S + 'System'; 
                     VFT2_DRV_INSTALLABLE : S := S + 'Installable'; 
                     VFT2_DRV_SOUND       : S := S + 'Sound'; 
                   else 
                     S := S + 'Unknown'; 
                   end; 
                 end; 
      VFT_FONT : begin 
                   S := 'Font File - '; 
                   case fVerBlk.dwFileSubType of 
                     VFT2_FONT_RASTER   : S := S + 'Raster'; 
                     VFT2_FONT_VECTOR   : S := S + 'Vector'; 
                     VFT2_FONT_TRUETYPE : S := S + 'TrueType'; 
                   else 
                     S := S + 'Unknown'; 
                   end; 
                 end; 
      VFT_VXD        : S := 'Virtual Device'; 
      VFT_STATIC_LIB : S := 'Static Link Library'; 
    else 
      S := 'Unknown File Type'; 
    end; 
  end; 
  Result := S; 
end; 

{ ---------------------------------------------------------------------------- } 
function TFileInfo.Path : string; 
begin 
  result := ExtractFilePath( fFileName ); 
end; 

{ ---------------------------------------------------------------------------- } 
function TFileInfo.FileName : string; 
begin 
  result := ExtractFileName( fFileName ); 
end; 

{ ---------------------------------------------------------------------------- } 
function TFileInfo.Name : string; 
begin 
  if Pos( FileExt, FileName ) > 0 then 
    result := Copy( FileName, 0, pos( FileExt, FileName )-1 ) 
  else 
    result := FileName; 
end; 

{ ---------------------------------------------------------------------------- } 
function TFileInfo.DosFileName : string; 
begin 
  result := StrPas( f.FindData.cAlternateFileName ) 
end; 

{ ---------------------------------------------------------------------------- } 
function TFileInfo.FileExt : string; 
begin 
  result := ExtractFileExt( fFileName ); 
end; 

{ ---------------------------------------------------------------------------- } 
function TFileInfo.isDirectory : boolean; 
begin 
  result := f.Attr AND faDirectory = faDirectory; 
end; 

{ ---------------------------------------------------------------------------- } 
function TFileInfo.isHidden : boolean; 
begin 
  result := f.Attr AND faHidden = faHidden; 
end; 

{ ---------------------------------------------------------------------------- } 
function TFileInfo.isSystemFile : boolean; 
begin 
  result := f.Attr AND faSysFile = faSysFile; 
end; 

{ ---------------------------------------------------------------------------- } 
function TFileInfo.isVolumeId : boolean; 
begin 
  result := f.Attr AND faVolumeId = faVolumeId; 
end; 

{ ---------------------------------------------------------------------------- } 
function TFileInfo.isArchive : boolean; 
begin 
  result := f.Attr AND faArchive = faArchive; 
end; 

{ ---------------------------------------------------------------------------- } 
function TFileInfo.FileSize : longint; 
begin 
  result := f.Size; 
end; 

{ ---------------------------------------------------------------------------- } 
function TFileInfo.CreationTime : TDateTime; 
var 
  LTime : TFileTime; 
  Systemtime : TSystemtime; 
begin 
  FileTimeToLocalFileTime( f.FindData.ftCreationTime, LTime); 
  FileTimeToSystemTime( LTime, SystemTime ); 
  result := SystemTimeToDateTime( SystemTime); 
end; 

{ ---------------------------------------------------------------------------- } 
function TFileInfo.LastAccessed : TDateTime; 
var 
  LTime : TFileTime; 
  Systemtime : TSystemtime; 
begin 
  FileTimeToLocalFileTime( f.FindData.ftLastAccessTime, LTime); 
  FileTimeToSystemTime( LTime, SystemTime ); 
  result := SystemTimeToDateTime( SystemTime); 
end; 

{ ---------------------------------------------------------------------------- } 
function TFileInfo.LastWritten : TDateTime; 
var 
  LTime : TFileTime; 
  Systemtime : TSystemtime; 
begin 
  FileTimeToLocalFileTime( f.FindData.ftLastWriteTime, LTime); 
  FileTimeToSystemTime( LTime, SystemTime ); 
  result := SystemTimeToDateTime( SystemTime); 
end; 

{ ---------------------------------------------------------------------------- } 
function TFileInfo.Execute : integer; 
begin 
  result := shellapi.ShellExecute( Application.Handle, 'open', pChar( fFileName ), 
                                   '', pChar(Path), 
                                   SW_SHOWDEFAULT ); 
  case result of 
    0 : 
     raise Exception.Create( 'The operating system is out of memory or resources.' ); 
    ERROR_FILE_NOT_FOUND : 
      raise Exception.Create( 'The specified file was not found.' ); 
    ERROR_PATH_NOT_FOUND : 
      raise Exception.Create( 'The specified path was not found.' ); 
    ERROR_BAD_FORMAT : 
      raise Exception.Create( 'The .EXE file is invalid (non-Win32 .EXE or error ' + 
                              'in .EXE image).' ); 
    SE_ERR_ACCESSDENIED : 
      raise Exception.Create( 'The operating system denied access to the specified file.' ); 
    SE_ERR_ASSOCINCOMPLETE : 
      raise Exception.Create( 'The filename association is incomplete or invalid.' ); 
    SE_ERR_DDEBUSY : 
      raise Exception.Create( 'The DDE transaction could not be completed because ' + 
                              'other DDE transactions were being processed.' ); 
    SE_ERR_DDEFAIL : 
      raise Exception.Create( 'The DDE transaction failed.' ); 
    SE_ERR_DDETIMEOUT : 
      raise Exception.Create( 'The DDE transaction could not be completed because the ' + 
                              'request timed out.' ); 
    SE_ERR_DLLNOTFOUND : 
      raise Exception.Create( 'The specified dynamic-link library was not found.' ); 
    SE_ERR_NOASSOC : 
      raise Exception.Create( 'There is no application associated with the given ' + 
                              'filename extension.' ); 
    SE_ERR_OOM : 
      raise Exception.Create( 'There was not enough memory to complete the operation.' ); 
    SE_ERR_SHARE : 
      raise Exception.Create( 'A sharing violation occurred.' ); 
  else 
  end; 
end; 


end.
