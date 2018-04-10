object fmMain: TfmMain
  Left = 0
  Top = 0
  Caption = 'BMOS To GMS'
  ClientHeight = 295
  ClientWidth = 422
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = #47569#51008' '#44256#46357
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lb_Message: TLabel
    Left = 8
    Top = 225
    Width = 406
    Height = 13
    AutoSize = False
    Caption = 'lb_Message'
  end
  object lb_count: TLabel
    Left = 8
    Top = 267
    Width = 406
    Height = 13
    AutoSize = False
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 0
    Width = 422
    Height = 186
    Align = alTop
    Caption = 'GMS '#45936#51060#53552#48288#51060#49828' '#54872#44221
    TabOrder = 0
    object Label5: TLabel
      Left = 32
      Top = 32
      Width = 79
      Height = 13
      Caption = #45936#51060#53552#48288#51060#49828' IP'
    end
    object Label6: TLabel
      Left = 32
      Top = 61
      Width = 91
      Height = 13
      Caption = #45936#51060#53552#48288#51060#49828' Port'
    end
    object Label7: TLabel
      Left = 32
      Top = 91
      Width = 104
      Height = 13
      Caption = #45936#51060#53552#48288#51060#49828' UserID'
    end
    object Label8: TLabel
      Left = 32
      Top = 121
      Width = 109
      Height = 13
      Caption = #45936#51060#53552#48288#51060#49828' UserPW'
    end
    object Label10: TLabel
      Left = 32
      Top = 148
      Width = 101
      Height = 13
      Caption = #45936#51060#53552#48288#51060#49828' NAME'
    end
    object ed_MIAMSIP: TEdit
      Left = 192
      Top = 28
      Width = 177
      Height = 21
      TabOrder = 0
      Text = '127.0.0.1'
    end
    object ed_MIAMSPort: TEdit
      Left = 192
      Top = 57
      Width = 177
      Height = 21
      TabOrder = 1
      Text = '1433'
    end
    object ed_MIAMSUserID: TEdit
      Left = 192
      Top = 87
      Width = 177
      Height = 21
      TabOrder = 2
      Text = 'sa'
    end
    object ed_MIAMSUserPW: TEdit
      Left = 192
      Top = 117
      Width = 177
      Height = 21
      TabOrder = 3
      Text = 'sapasswd'
    end
    object ed_MIAMSDBName: TEdit
      Left = 192
      Top = 144
      Width = 177
      Height = 21
      TabOrder = 4
      Text = 'bmos'
    end
  end
  object btn_DataBaseConnect: TButton
    Left = 138
    Top = 192
    Width = 135
    Height = 33
    Caption = #45936#51060#53552#48288#51060#49828' '#51217#49549
    TabOrder = 1
    OnClick = btn_DataBaseConnectClick
  end
  object btn_Convert: TButton
    Left = 279
    Top = 192
    Width = 135
    Height = 33
    Caption = #45936#51060#53552#48288#51060#49828' '#48320#54872
    Enabled = False
    TabOrder = 2
    OnClick = btn_ConvertClick
  end
  object Progress: TAdvProgress
    Left = 8
    Top = 244
    Width = 406
    Height = 17
    BarColor = clHighlight
    TabOrder = 3
    BkColor = clWindow
    Version = '1.2.0.0'
  end
end
