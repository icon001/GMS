program P2PNATClient;

uses
  Forms,
  uNATClient in 'uNATClient.pas' {FrmP2PClient},
  uP2PCommon in '..\uP2PCommon.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmP2PClient, FrmP2PClient);
  Application.Run;
end.
