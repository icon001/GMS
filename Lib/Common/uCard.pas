unit uCard;

interface

uses
  System.SysUtils, System.Classes;

const
  con_CardLastUsedate = 1;

type
  TCardChangePacket = procedure(Sender: TObject;  aCmd: integer;aCardNo:string; aData:string) of object;

  TCard = Class(TComponent)
  private
    FCOMPANYNAME: UnicodeString;
    FCOMPANYCODE: UnicodeString;
    FEMSEQ: integer;
    FEMNAME: UnicodeString;
    FEMCODE: UnicodeString;
    FCARDNO: UnicodeString;
    FPOSINAME: UnicodeString;
    FPOSICODE: UnicodeString;
    FLastUseDate: UnicodeString;
    FOnCardChangePacket: TCardChangePacket;
    FATUSE: UnicodeString;
    FFDUSE: UnicodeString;
    FPRINTNO: UnicodeString;
    FLoadDate: UnicodeString;
    FHandPhoneNum: UnicodeString;
    procedure SetLastUseDate(const Value: UnicodeString);
  published
    property CARDNO : UnicodeString read FCARDNO write FCARDNO;
    property EMSEQ : integer read FEMSEQ write FEMSEQ;
    property EMCODE : UnicodeString read FEMCODE write FEMCODE;
    property EMNAME : UnicodeString read FEMNAME write FEMNAME;
    property COMPANYCODE : UnicodeString read FCOMPANYCODE write FCOMPANYCODE;
    property COMPANYNAME : UnicodeString read FCOMPANYNAME write FCOMPANYNAME;
    property POSICODE : UnicodeString read FPOSICODE write FPOSICODE;
    property POSINAME : UnicodeString read FPOSINAME write FPOSINAME;
    property PRINTNO : UnicodeString read FPRINTNO write FPRINTNO;
    property HandPhoneNum : UnicodeString read FHandPhoneNum write FHandPhoneNum;
    property LastUseDate : UnicodeString read FLastUseDate write SetLastUseDate;
    property LoadDate : UnicodeString read FLoadDate write FLoadDate;
    property ATUSE : UnicodeString read FATUSE write FATUSE;
    property FDUSE : UnicodeString read FFDUSE write FFDUSE;
  published
    property OnCardChangePacket : TCardChangePacket read FOnCardChangePacket write FOnCardChangePacket;
  End;

  TCardGrade = Class(TComponent)
  private
    FPermit: string;
    FDOOR2: string;
    FDOOR3: string;
    FDOOR1: string;
    FDOOR6: string;
    FDOOR7: string;
    FDOOR4: string;
    FDOOR5: string;
    FDOOR8: string;
    FENDDATE: string;
    FARMAREA8: string;
    FARMAREA2: string;
    FARMAREA3: string;
    FARMAREA0: string;
    FARMAREA1: string;
    FARMAREA6: string;
    FARMAREA7: string;
    FARMAREA4: string;
    FARMAREA5: string;
  published
    property ARMAREA0 : string read FARMAREA0 write FARMAREA0;
    property ARMAREA1 : string read FARMAREA1 write FARMAREA1;
    property ARMAREA2 : string read FARMAREA2 write FARMAREA2;
    property ARMAREA3 : string read FARMAREA3 write FARMAREA3;
    property ARMAREA4 : string read FARMAREA4 write FARMAREA4;
    property ARMAREA5 : string read FARMAREA5 write FARMAREA5;
    property ARMAREA6 : string read FARMAREA6 write FARMAREA6;
    property ARMAREA7 : string read FARMAREA7 write FARMAREA7;
    property ARMAREA8 : string read FARMAREA8 write FARMAREA8;
    property DOOR1 : string read FDOOR1 write FDOOR1;
    property DOOR2 : string read FDOOR2 write FDOOR2;
    property DOOR3 : string read FDOOR3 write FDOOR3;
    property DOOR4 : string read FDOOR4 write FDOOR4;
    property DOOR5 : string read FDOOR5 write FDOOR5;
    property DOOR6 : string read FDOOR6 write FDOOR6;
    property DOOR7 : string read FDOOR7 write FDOOR7;
    property DOOR8 : string read FDOOR8 write FDOOR8;
    property ENDDATE : string read FENDDATE write FENDDATE;
    property Permit : string read FPermit write FPermit;
  End;

  TdmCard = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCard: TdmCard;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TCard }

procedure TCard.SetLastUseDate(const Value: UnicodeString);
begin
  if FLastUseDate <> '' then
  begin
    if FLastUseDate >= Value then Exit;  //기존 날짜가 들어온 날짜보다 크거나 같으면 빠져 나간다.
  end;
  FLastUseDate := Value;

  if Assigned(FOnCardChangePacket) then
  begin
    OnCardChangePacket(Self,con_CardLastUsedate,CARDNO,Value);
  end;

end;

end.
