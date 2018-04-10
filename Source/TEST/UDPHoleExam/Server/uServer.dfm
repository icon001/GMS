object FrmP2PServer: TFrmP2PServer
  Left = 305
  Top = 81
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'P2P Broadcast Server'
  ClientHeight = 480
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 31
    Width = 91
    Height = 13
    Caption = 'TCP Recv Message'
  end
  object Label2: TLabel
    Left = 8
    Top = 258
    Width = 92
    Height = 13
    Caption = 'UDP Recv Message'
  end
  object chkServerActive: TCheckBox
    Left = 8
    Top = 8
    Width = 89
    Height = 17
    Caption = 'Servers Active'
    TabOrder = 0
    OnClick = chkServerActiveClick
  end
  object mmoTCPRecvMsg: TMemo
    Left = 8
    Top = 50
    Width = 608
    Height = 194
    ImeName = 'Microsoft Office IME 2007'
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object BtnDelMsg: TButton
    Left = 541
    Top = 249
    Width = 75
    Height = 25
    Caption = 'Msg Delete'
    TabOrder = 2
    OnClick = BtnDelMsgClick
  end
  object mmoUDPRecvMsg: TMemo
    Left = 8
    Top = 277
    Width = 608
    Height = 194
    ImeName = 'Microsoft Office IME 2007'
    ScrollBars = ssBoth
    TabOrder = 3
  end
  object TCPServer: TIdTCPServer
    OnStatus = TCPServerStatus
    Bindings = <>
    DefaultPort = 22011
    OnConnect = TCPServerConnect
    OnDisconnect = TCPServerDisconnect
    OnException = TCPServerException
    OnListenException = TCPServerListenException
    Scheduler = IdSchedulerOfThreadDefault1
    OnExecute = TCPServerExecute
    Left = 136
    Top = 24
  end
  object IdSchedulerOfThreadDefault1: TIdSchedulerOfThreadDefault
    MaxThreads = 0
    Left = 168
    Top = 24
  end
  object UDPServer: TIdUDPServer
    BroadcastEnabled = True
    Bindings = <>
    DefaultPort = 22015
    OnUDPRead = UDPServerUDPRead
    OnUDPException = UDPServerUDPException
    Left = 144
    Top = 248
  end
  object AntiFreeze: TIdAntiFreeze
    OnlyWhenIdle = False
    Left = 176
    Top = 248
  end
end
