unit uDBSocket;

interface

uses
  System.SysUtils, System.Classes,Vcl.ExtCtrls,Forms,Winapi.ActiveX,Data.Win.ADODB,DB;

type
  TdmDBSocket = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    DBSocketReceiveTimer : TTimer;
    L_nOldDBSocketSeq : integer;
    procedure DBSocketReceiveTimerTimer(Sender: TObject);
  private
    FStart: Boolean;
    procedure SetStart(const Value: Boolean); //���� ������ DBSocketSequence
    { Private declarations }
  public
    { Public declarations }
    property Start : Boolean read FStart write SetStart;
  end;

var
  dmDBSocket: TdmDBSocket;

implementation
uses
  uCommonVariable,
  uClientSocket,
  uDataBase;

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TdmDBSocket.DataModuleCreate(Sender: TObject);
begin
  L_nOldDBSocketSeq := 0;
  DBSocketReceiveTimer := TTimer.Create(nil);
  DBSocketReceiveTimer.Interval := 100;
  DBSocketReceiveTimer.Enabled := False;
  DBSocketReceiveTimer.OnTimer := DBSocketReceiveTimerTimer;
end;

procedure TdmDBSocket.DataModuleDestroy(Sender: TObject);
begin
  DBSocketReceiveTimer.Enabled := False;
  DBSocketReceiveTimer.Free;
end;

procedure TdmDBSocket.DBSocketReceiveTimerTimer(Sender: TObject);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  if G_bApplicationTerminate then
  begin
    DBSocketReceiveTimer.Enabled := False;
    Exit;
  end;
  Try
    DBSocketReceiveTimer.Enabled := False;
    stSql := ' Select * from TB_CLIENTSOCK ';
    stSql := stSql + ' Where seq > ' + inttostr(L_nOldDBSocketSeq);

    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDataBase.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 0 then Exit;
      while Not Eof do
      begin
        L_nOldDBSocketSeq := FindField('SEQ').AsInteger;
        dmClientSocket.ServerDataProcessing(FindField('CSDATA').AsString);
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    DBSocketReceiveTimer.Enabled := Start;
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TdmDBSocket.SetStart(const Value: Boolean);
begin
  FStart := Value;
  L_nOldDBSocketSeq := 0;
  DBSocketReceiveTimer.Enabled := Value;
end;

end.
