object ServerMainForm: TServerMainForm
  Left = 192
  Top = 107
  Width = 497
  Height = 291
  Caption = 'ServerMainForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Courier New'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 32
    Top = 8
    Width = 49
    Height = 15
    Caption = 'Port(&P)'
    FocusControl = PortEdit
  end
  object PortEdit: TEdit
    Left = 32
    Top = 28
    Width = 161
    Height = 23
    TabOrder = 0
    Text = '211'
  end
  object ActiveButton: TButton
    Left = 32
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 1
    OnClick = ActiveButtonClick
  end
  object MsgMemo: TMemo
    Left = 280
    Top = 8
    Width = 193
    Height = 241
    Lines.Strings = (
      'MsgMemo')
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object Button1: TButton
    Left = 32
    Top = 120
    Width = 161
    Height = 25
    Caption = 'SendMsgToClient'
    TabOrder = 3
    OnClick = Button1Click
  end
  object ClientMsgEdit: TEdit
    Left = 32
    Top = 96
    Width = 161
    Height = 23
    TabOrder = 4
    Text = 'ClientMsgEdit'
  end
  object GroupBox1: TGroupBox
    Left = 24
    Top = 160
    Width = 249
    Height = 89
    Caption = 'Result'
    TabOrder = 5
    object Label3: TLabel
      Left = 24
      Top = 56
      Width = 84
      Height = 15
      Caption = 'Packet Count'
      FocusControl = CountText
    end
    object Label6: TLabel
      Left = 38
      Top = 24
      Width = 70
      Height = 15
      Caption = 'Connection'
      FocusControl = ConnectionCountText
    end
    object CountText: TStaticText
      Left = 112
      Top = 56
      Width = 97
      Height = 16
      AutoSize = False
      TabOrder = 0
    end
    object ConnectionCountText: TStaticText
      Left = 112
      Top = 24
      Width = 97
      Height = 16
      AutoSize = False
      TabOrder = 1
    end
  end
  object Timer1: TTimer
    Interval = 2000
    OnTimer = Timer1Timer
    Left = 216
    Top = 8
  end
end
