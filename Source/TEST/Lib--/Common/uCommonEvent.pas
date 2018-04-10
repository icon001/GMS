unit uCommonEvent;

interface

type
  TAdoConnectedEvent = procedure(Sender: TObject;  Connected:Boolean) of object;
  TRelayConnectedEvent = procedure(Sender: TObject; aSession:integer; Connected:Boolean) of object;
  TRelayDBEvent = procedure(Sender: TObject; aSession:integer; aData:string) of object;

implementation

end.
