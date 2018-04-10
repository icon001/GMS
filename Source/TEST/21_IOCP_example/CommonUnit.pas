////////////////////////////////////////////////////////////////////////////
//CommonUnit.pas
unit CommonUnit;

interface

type
  PDataBlock = ^TDataBlock;
  TDataBlock = record
    Len: Integer;
    Content: array [0..100] of Char;
  end;

implementation

end.
