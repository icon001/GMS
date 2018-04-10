unit uCommonVariable;

interface

const
  MDB = 1;
  MSSQL = 2;
  POSTGRESQL = 3;
  FireBird = 4;
type
  TAdoConnectedEvent = procedure(Sender: TObject;  Connected:Boolean) of object;

var
  G_stExeFolder : string;

implementation


end.
