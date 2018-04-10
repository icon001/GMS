unit uCommonFunction;

interface

uses System.SysUtils,System.DateUtils;

function Ascii2Hex(aData:string;bReverse:Boolean = False;bConvert:Boolean=False;aConvertDec:integer=30):string;
function Dec2Hex(N: int64; A: Byte): string;
function FillCharString(aNo:String;aChar:char; aLength:Integer;bFront:Boolean = False): string;
function FillZeroNumber(aNo:Int64; aLength:Integer): string;
function FillZeroStrNum(aNo:String; aLength:Integer;bFront:Boolean = True): string;
Function FindCharCopy(SourceStr : String; Index : integer; aChar:Char) : String;
function IsDate(aDate:string):Boolean;
function Isdigit(st: string):Boolean;
function LogSave(aFileName,ast:string):Boolean;


implementation

function Ascii2Hex(aData:string;bReverse:Boolean = False;bConvert:Boolean=False;aConvertDec:integer=30):string;
var
  i : integer;
  stHex : string;
  nOrd : integer;
begin
  stHex := '';
  for i:= 1 to Length(aData) do
  begin
    nOrd := Ord(aData[i]);
    if bConvert then
    begin
      if nOrd = aConvertDec then nOrd := 0;
    end;
    if Not bReverse then stHex := stHex + Dec2Hex(nOrd,2)
    else stHex := Dec2Hex(nOrd,2) + stHex;
  end;
  result := stHex;
end;

function Dec2Hex(N: int64; A: Byte): string;
begin
  Result := IntToHex(N, A);
end;

function FillCharString(aNo:String;aChar:char; aLength:Integer;bFront:Boolean = False): string;
var
  I       : Integer;
  st      : string;
  strNo   : String;
  StrCount: Integer;
begin
  Strno:= aNo;
  StrCount:= Length(Strno);
  St:= '';
  StrCount:=  aLength - StrCount;
  if StrCount > 0 then
  begin
    st:='';
    for I:=1 to StrCount do St:=st+ aChar;
    if bFront then  St:= St + StrNo
    else St:= StrNo + St;

    FillCharString := st;
  end else FillCharString := copy(Strno,1,aLength);
end;

function FillZeroNumber(aNo:Int64; aLength:Integer): string;
var
  I       : Integer;
  st      : string;
  strNo   : String;
  StrCount: Integer;
begin
  Strno:= InttoStr(aNo);
  StrCount:= Length(Strno);
  St:= '';
  StrCount:=  aLength - StrCount;
  if StrCount > 0 then
  begin
    st:='';
    for I:=1 to StrCount do St:=st+'0';
    St:= St + StrNo;
    FillZeroNumber:= st;
  end else FillZeroNumber:= copy(Strno,1,aLength);
end;


function FillZeroStrNum(aNo:String; aLength:Integer;bFront:Boolean = True): string;
var
  I       : Integer;
  st      : string;
  strNo   : String;
  StrCount: Integer;
begin
  Strno:= aNo;
  StrCount:= Length(Strno);
  St:= '';
  StrCount:=  aLength - StrCount;
  if StrCount > 0 then
  begin
    st:='';
    for I:=1 to StrCount do St:=st+'0';
    if bFront then  St:= St + StrNo
    else St:= StrNo + St;

    FillZeroStrNum:= st;
  end else FillZeroStrNum:= copy(Strno,1,aLength);
end;


Function FindCharCopy(SourceStr : String; Index : integer; aChar:Char) : String;
Var
  a, b : Integer;
  st   : String;
begin
  a := 0;
  b := 1;
  st := '';
  if (Length(SourceStr) < 1) then begin result:= ''; exit;  end;
  for b:=1 to Length(SourceStr) do
  begin
    if a = index then break;
    if SourceStr[b] = aChar then Inc(a);
  end;
  if (a = Index) then
  begin
    while (b <= Length(SourceStr)) and (SourceStr[b] <> aChar) do
    begin
      st := st + SourceStr[b];
      Inc(b);
    end;
  end;
  Result := st;
end;

function IsDate(aDate:string):Boolean;
var
  dtTime : TDateTime;
begin
  result := False;
  Try
    aDate := stringReplace(aDate,'-','',[rfReplaceAll]);
    aDate := stringReplace(aDate,':','',[rfReplaceAll]);
    aDate := stringReplace(aDate,' ','',[rfReplaceAll]);
    dtTime := EncodeDateTime(strtoint(copy(aDate,1,4)),
                                             strtoint(copy(aDate,5,2)),
                                             strtoint(copy(aDate,7,2)),
                                             0,0,0,0);
    //dtTime := strtoDate(aDate);
  Except
    Exit;
  End;
  result := True;
end;

function Isdigit(st: string):Boolean;
var
  I: Integer;
begin
  result:=True;
  if Length(st) < 1 then
  begin
    result:=False;
    Exit;
  end;
  for I:=1 to Length(st) do
    if (st[I]< '0') or (st[I] > '9')  then result:=False
end;

function LogSave(aFileName,ast:string):Boolean;
Var
  f: TextFile;
  st: string;
  stDir : string;
begin
  result := False;
  Try
    {$I-}
    stDir := ExtractFilePath(aFileName);
    if not DirectoryExists(stDir) then CreateDir(stDir);

    AssignFile(f, aFileName);
    Append(f);
    if IOResult <> 0 then Rewrite(f);
    st := FormatDateTIme('yyyy-mm-dd hh:nn:ss:zzz">"',Now) + ' ' + ast;
    WriteLn(f,st);
    System.Close(f);
    result := True;
    {$I+}
  Except
    Exit;
  End;
end;

end.
