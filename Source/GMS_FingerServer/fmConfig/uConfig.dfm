object fmConfig: TfmConfig
  Left = 0
  Top = 0
  Caption = #54872#44221#49444#51221
  ClientHeight = 536
  ClientWidth = 401
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  PixelsPerInch = 120
  TextHeight = 17
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 401
    Height = 88
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    Caption = #51648#47928#47532#45908
    TabOrder = 0
    object Label1: TLabel
      Left = 31
      Top = 42
      Width = 84
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #51648#47928#47532#45908#51333#47448
    end
    object cmb_ReaderType: TComboBox
      Left = 157
      Top = 38
      Width = 190
      Height = 22
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style = csOwnerDrawFixed
      ItemIndex = 0
      TabOrder = 0
      Text = '1.'#49457#54788#51648#47928#47532#45908
      OnChange = cmb_ReaderTypeChange
      Items.Strings = (
        '1.'#49457#54788#51648#47928#47532#45908
        '2.'#49800#54532#47532#47560)
    end
  end
  object btn_Save: TButton
    Left = 73
    Top = 471
    Width = 98
    Height = 32
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = #51201#50857
    TabOrder = 1
    OnClick = btn_SaveClick
  end
  object btn_close: TButton
    Left = 259
    Top = 471
    Width = 98
    Height = 32
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = #45803#44592
    TabOrder = 2
    OnClick = btn_closeClick
  end
  object gb_RelayType: TGroupBox
    Left = 0
    Top = 88
    Width = 401
    Height = 70
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    TabOrder = 3
    object Label2: TLabel
      Left = 31
      Top = 21
      Width = 56
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #50672#46041#53440#51077
    end
    object cmb_RelayType: TComboBox
      Left = 157
      Top = 17
      Width = 190
      Height = 22
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style = csOwnerDrawFixed
      ItemIndex = 0
      TabOrder = 0
      Text = '1.TCP/IP'
      OnChange = cmb_RelayTypeChange
      Items.Strings = (
        '1.TCP/IP'
        '2.DataBase')
    end
  end
  object gb_RelayDBConfig: TGroupBox
    Left = 0
    Top = 158
    Width = 401
    Height = 305
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    TabOrder = 4
    object Label3: TLabel
      Left = 31
      Top = 21
      Width = 46
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'DB'#53440#51077
    end
    object Label4: TLabel
      Left = 31
      Top = 59
      Width = 34
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'DB IP'
    end
    object Label5: TLabel
      Left = 31
      Top = 94
      Width = 48
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'DB Port'
    end
    object Label6: TLabel
      Left = 31
      Top = 129
      Width = 67
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'DB User ID'
    end
    object Label7: TLabel
      Left = 31
      Top = 165
      Width = 75
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'DB User PW'
    end
    object Label8: TLabel
      Left = 31
      Top = 200
      Width = 57
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'DB Name'
    end
    object Label9: TLabel
      Left = 31
      Top = 235
      Width = 84
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #49324#50857#51088'ID'#44600#51060
    end
    object Label10: TLabel
      Left = 32
      Top = 268
      Width = 56
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #52852#46300#44600#51060
    end
    object cmb_RelayDBType: TComboBox
      Left = 157
      Top = 17
      Width = 190
      Height = 22
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style = csOwnerDrawFixed
      ItemIndex = 0
      TabOrder = 0
      Text = '1.MSSQL'
      Items.Strings = (
        '1.MSSQL')
    end
    object ed_RelayDBIP: TEdit
      Left = 157
      Top = 54
      Width = 190
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabOrder = 1
      Text = 'ed_RelayDBIP'
    end
    object ed_RelayDBPort: TEdit
      Left = 157
      Top = 89
      Width = 190
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabOrder = 2
      Text = 'Edit1'
    end
    object ed_RelayDBUserID: TEdit
      Left = 157
      Top = 124
      Width = 190
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabOrder = 3
      Text = 'Edit1'
    end
    object ed_RelayDBUserPW: TEdit
      Left = 157
      Top = 160
      Width = 190
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabOrder = 4
      Text = 'Edit1'
    end
    object ed_RelayDBName: TEdit
      Left = 157
      Top = 195
      Width = 190
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabOrder = 5
      Text = 'Edit1'
    end
    object ed_UserIDLen: TEdit
      Left = 157
      Top = 230
      Width = 190
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabOrder = 6
      Text = 'ed_UserIDLen'
    end
    object ed_CardNoLen: TEdit
      Left = 157
      Top = 263
      Width = 190
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabOrder = 7
      Text = 'ed_UserIDLen'
    end
  end
end
