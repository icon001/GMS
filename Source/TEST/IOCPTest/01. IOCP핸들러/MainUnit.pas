unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, IOCPCtrl;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Post: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure PostClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    IOCPHandler: TIOCPHandler;
    procedure OnIOCompletion(Sender: TObject; IsSuccess: BOOL;
      OutErrCode, BytesTransferred, CompletionKey : DWORD; pOVL: POverlapped);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  Form1: TForm1;

implementation


{$R *.DFM}

type
  TTestSession = class(TIOCPSession)
  protected
    procedure IOCompletion(IsSuccess: BOOL;
      OutErrCode, BytesTransferred, CompletionKey : DWORD;
      lpOverlapped: POverlapped); override;
  public
  end;


{ TTestSession }

procedure TTestSession.IOCompletion(IsSuccess: BOOL; OutErrCode,
  BytesTransferred, CompletionKey: DWORD; lpOverlapped: POverlapped);
begin
  WriteLn('상속된 세션메소드. ', CompletionKey);
end;
  
constructor TForm1.Create(AOwner: TComponent);
begin
  inherited;

end;

destructor TForm1.Destroy;
begin
  if Assigned(IOCPHandler) then FreeAndNil(IOCPHandler);

  inherited;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if Assigned(IOCPHandler) then
  begin
    WriteLn('생성 실패 - 이미 생성중임');
    Exit;
  end;
  IOCPHandler:= TIOCPHandler.Create(nil, nil, 0, 0, nil);
  IOCPHandler.OnIOCompletion := OnIOCompletion;
end;


procedure TForm1.Button3Click(Sender: TObject);
begin
  if Assigned(IOCPHandler) then
  begin
    WriteLn('생성 실패 - 이미 생성중임');
    Exit;
  end;
  IOCPHandler:= TIOCPHandler.Create(TTestSession, nil, 0, 0, nil);
  IOCPHandler.OnIOCompletion := OnIOCompletion;
end;


procedure TForm1.Button2Click(Sender: TObject);
begin
  if not Assigned(IOCPHandler) then
  begin
    WriteLn('해제 실패 - 생성되지 않았음');
    Exit;
  end;
  FreeAndNil(IOCPHandler);

end;

procedure TForm1.OnIOCompletion(Sender: TObject; IsSuccess: BOOL;
  OutErrCode, BytesTransferred, CompletionKey: DWORD; pOVL: POverlapped);
begin
  WriteLn(Integer(Sender), ', ', CompletionKey);
  //
end;

procedure TForm1.PostClick(Sender: TObject);
begin
  if Assigned(IOCPHandler) then
  begin
    IOCPHandler.PostCompletionStatus(333, 0, nil, nil);
    IOCPHandler.PostCompletionStatus(334, 0, nil, nil);
    IOCPHandler.PostCompletionStatus(335, 0, nil, nil);
  end else
    WriteLn('Post 실패 - 생성되어있지 않음');
end;



end.
