unit uNodeThread;


interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;


Type

TNodeThread = class(TThread)
private
procedure Execute ; override;
public
  constructor Create;
  destructor Destroy ; override;
end;

implementation

{ TNodeThread }

constructor TNodeThread.Create;
begin
  FreeOnTerminate := False;
  inherited Create( true );
end;

destructor TNodeThread.Destroy;
begin

  inherited;
end;

procedure TNodeThread.Execute;
begin
  inherited;
  while not Terminated do
  begin
//    Inc( iCnt );
//    Synchronize(  Display  );

    Application.ProcessMessages;
    WaitForSingleObject( handle, 500 )
  end;
end;

end.
