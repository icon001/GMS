unit uDBVariable;

interface

const
  //DataBase Type
  MSSQL = 0;
  MDB = 1;
  POSTGRESQL = 2;
  FIREBIRD = 3;

type
  TAdoConnectedEvent = procedure(Sender: TObject;  Connected:Boolean) of object;
  TRelayConnectedEvent = procedure(Sender: TObject; aSession:integer; Connected:Boolean) of object;
  TRelayDBEvent = procedure(Sender: TObject; aSession:integer; aData:string) of object;

var
  G_nDBType : integer;
  G_stDBHost : string;
  G_stDBPort : string;
  G_stDBUserID : string;
  G_stDBUserPw : string;
  G_stDBName :string;

implementation

end.
