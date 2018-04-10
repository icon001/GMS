unit uP2PCommon;

interface

type
  TP2PTCPHeader = packed record
//    Header   : array [0..1] of Byte;
    Command  : Byte;
    UserID   : String[10];
    DataSize : Integer;
  end;

implementation

end.
