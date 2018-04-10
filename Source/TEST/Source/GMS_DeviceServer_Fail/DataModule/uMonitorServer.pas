unit uMonitorServer;

interface

uses
  System.SysUtils, System.Classes,Vcl.ExtCtrls,Vcl.Forms,
  Winapi.Windows,
  uWinSockClient,
  uCommonVariable;

type
  TServerToMonitor = class(TComponent)
  private
    SendPacketTimer: TTimer;
    SocketCheckTimer: TTimer;
    NodePacketList : TStringList;
    WinSocket : TdmWinSockClient;
    L_bDestroy : Boolean;
    L_bPacketSending : Boolean;
    L_bServerSending : Boolean;
    L_stComBuffer : RawByteString;
    procedure DecoderFromServerProcess(aPacketData:string);
    procedure DecoderFromServerReadingProcessing;
    function DecoderToServerSendPacket(aPacket:string):Boolean;
    procedure SendPacketTimerTimer(Sender: TObject);
    procedure SocketCheckTimerTimer(Sender: TObject);
    procedure WinSocketConnected(Sender: TObject;aValue:Boolean);
    procedure WinSocketRead(Sender: TObject;aPacketData:RawByteString;aLen:integer);
  private
    FServerPort: integer;
    FServerIP: string;
    FServerConnected: Boolean;
    FSocketOpen: Boolean;
    FSocketCheck: Boolean;
    FServerReceiveTime: TDateTime;
    FOnDecoderPacket: TMonitorPacket;
    procedure SetServerConnected(const Value: Boolean);
    procedure SetServerIP(const Value: string);
    procedure SetServerPort(const Value: integer);
    procedure SetSocketOpen(const Value: Boolean);
    procedure SetSocketCheck(const Value: Boolean);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  public
    procedure NodePacket(aPacketData:string;aDirect:integer=1);
  published
    property ServerConnected : Boolean read FServerConnected write SetServerConnected;
    property ServerIP : string read FServerIP write SetServerIP ;
    property ServerPort : integer read FServerPort write SetServerPort ;
    property ServerReceiveTime : TDateTime read FServerReceiveTime write FServerReceiveTime;
    property SocketCheck : Boolean read FSocketCheck write SetSocketCheck;
    property SocketOpen : Boolean read FSocketOpen write SetSocketOpen;
  published
    property OnDecoderPacket : TMonitorPacket read FOnDecoderPacket write FOnDecoderPacket;

  end;
  TdmMonitorServer = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmMonitorServer: TdmMonitorServer;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
