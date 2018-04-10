object ClientMainForm: TClientMainForm
  Left = 192
  Top = 107
  Width = 327
  Height = 341
  Caption = 'ClientMainForm'
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
    Left = 16
    Top = 8
    Width = 28
    Height = 15
    Caption = '&host'
    FocusControl = HostEdit
  end
  object Label2: TLabel
    Left = 16
    Top = 50
    Width = 84
    Height = 15
    Caption = '&Thread Count'
    FocusControl = ThreadCountEdit
  end
  object Label7: TLabel
    Left = 144
    Top = 8
    Width = 28
    Height = 15
    Caption = '&Port'
    FocusControl = PortEdit
  end
  object Label8: TLabel
    Left = 224
    Top = 8
    Width = 49
    Height = 15
    Caption = '&Timeout'
    FocusControl = TimeoutEdit
  end
  object StartButton: TButton
    Left = 16
    Top = 101
    Width = 89
    Height = 25
    Caption = '&Add test'
    TabOrder = 0
    OnClick = StartButtonClick
  end
  object HostEdit: TEdit
    Left = 16
    Top = 24
    Width = 97
    Height = 23
    ImeName = 'Microsoft IME 2003'
    TabOrder = 1
    Text = '127.0.0.1'
  end
  object ThreadCountEdit: TEdit
    Left = 16
    Top = 66
    Width = 265
    Height = 23
    ImeName = 'Microsoft IME 2003'
    MaxLength = 100
    TabOrder = 2
    Text = '200'
  end
  object StopButton: TButton
    Left = 120
    Top = 101
    Width = 89
    Height = 25
    Caption = 'St&op All'
    TabOrder = 3
    OnClick = StopButtonClick
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 152
    Width = 273
    Height = 137
    Caption = 'Result'
    TabOrder = 4
    object Label3: TLabel
      Left = 87
      Top = 53
      Width = 35
      Height = 15
      Caption = 'Count'
      FocusControl = CountText
    end
    object Label4: TLabel
      Left = 52
      Top = 82
      Width = 70
      Height = 15
      Caption = 'RightCount'
      FocusControl = RightCountText
    end
    object Label5: TLabel
      Left = 52
      Top = 112
      Width = 70
      Height = 15
      Caption = 'ErrorCount'
      FocusControl = ErrorCountText
    end
    object Label6: TLabel
      Left = 10
      Top = 24
      Width = 112
      Height = 15
      Caption = 'Connection Count'
      FocusControl = ConnectionCountText
    end
    object CountText: TStaticText
      Left = 136
      Top = 53
      Width = 97
      Height = 16
      AutoSize = False
      TabOrder = 0
    end
    object RightCountText: TStaticText
      Left = 136
      Top = 82
      Width = 97
      Height = 15
      AutoSize = False
      TabOrder = 1
    end
    object ErrorCountText: TStaticText
      Left = 136
      Top = 112
      Width = 97
      Height = 17
      AutoSize = False
      TabOrder = 2
    end
    object ConnectionCountText: TStaticText
      Left = 136
      Top = 24
      Width = 97
      Height = 16
      AutoSize = False
      TabOrder = 3
    end
  end
  object PortEdit: TEdit
    Left = 144
    Top = 24
    Width = 57
    Height = 23
    ImeName = 'Microsoft IME 2003'
    TabOrder = 5
    Text = '211'
  end
  object TimeoutEdit: TEdit
    Left = 224
    Top = 24
    Width = 57
    Height = 23
    ImeName = 'Microsoft IME 2003'
    TabOrder = 6
    Text = '500'
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 208
    Top = 104
  end
end
