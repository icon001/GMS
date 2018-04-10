program P2PServer;

uses
  Forms,
  uServer in 'uServer.pas' {FrmP2PServer},
  uP2PCommon in '..\uP2PCommon.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmP2PServer, FrmP2PServer);
  Application.Run;
end.
