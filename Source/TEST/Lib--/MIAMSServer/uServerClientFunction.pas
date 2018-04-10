unit uServerClientFunction;

interface
  uses System.SysUtils;


  function GetPacketData(aCMD,aDeviceType,aSubCmd,aNodeNo,aEcuID,aData:string):string;
  function PacketFormatCheck(aData: String;var aLeavePacketData,aPacketData: String): integer;

implementation
uses
  uServerClientVariable,
  uCommonFunction,
  uCommonVariable;

function GetPacketData(aCMD,aDeviceType,aSubCmd,aNodeNo,aEcuID,aData:string):string;
var
  stSendData : string;
begin
  if Not isDigit(aNodeNo) then aNodeNo := '0';

  stSendData := aCMD + aDeviceType + aSubCmd + FillZeroNumber(strtoint(aNodeNo),G_nNodeCodeLength) + aEcuID + aData;
  //stSendData := String2Hex(stSendData);
  result := SCSTX + FillZeroNumber(Length(stSendData),3) + stSendData + SCETX;
end;

function PacketFormatCheck(aData: String;var aLeavePacketData,aPacketData: String): integer;
var
  stLen: String;
  nDefinedDataLength: Integer;
  stBuff: String;
  aKey: Byte;
  stData : string;
begin
  result := -1; //������ ����
  if aData[1] <> SCSTX then
  begin
    aLeavePacketData:= aData;
    Exit;
  end;

  aPacketData:= '';
  if Length(aData) < 4 then
  begin
    result := -2; //�ڸ����� �۰� ���� ���
    aLeavePacketData:= aData;
    Exit;
  end;
  stLen:= Copy(aData,2,3);
  //������ ���� ��ġ �����Ͱ� ���ڰ� �ƴϸ�...
  if not isDigit(stLen) then
  begin
    aLeavePacketData:= aData;           //���� �� ���ڸ� ����
    Exit;
  end;

  //��Ŷ�� ���ǵ� ����
  nDefinedDataLength:= StrtoInt(stLen);
  //��Ŷ�� ���ǵ� ���̺��� ���� �����Ͱ� ������
  if Length(aData) < nDefinedDataLength then
  begin
    result := -2; //�ڸ����� �۰� ���� ���
    aLeavePacketData:= aData;
    Exit;
  end;

  // ���ǵ� ���� ������ �����Ͱ� ETX�� �´°�?
  if aData[nDefinedDataLength + 3 + 2] = SCETX then
  begin
    stBuff:= Copy(aData,1,nDefinedDataLength + 3 + 2);
    result := 1;                             //STX ������ �´�
    Delete(aData, 1, nDefinedDataLength + 3 + 2 );
    aLeavePacketData:= aData;
    aPacketData:= stBuff ;//copy(stBuff,1,4) + Hex2UTF8String(copy(stBuff,5,nDefinedDataLength)) + SCETX;
  end else
  begin
    aLeavePacketData:= aData;
  end;
end;
end.