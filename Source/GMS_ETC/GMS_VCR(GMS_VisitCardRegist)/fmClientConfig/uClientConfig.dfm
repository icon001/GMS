object fmClientConfig: TfmClientConfig
  Left = 0
  Top = 0
  Caption = #54872#44221#49444#51221
  ClientHeight = 192
  ClientWidth = 410
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 410
    Height = 143
    Align = alTop
    Caption = #46321#47197#44592#49444#51221
    TabOrder = 0
    object lb_RegCardType: TLabel
      Left = 10
      Top = 20
      Width = 60
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #46321#47197#44592#53440#51077
    end
    object lb_cardPort: TLabel
      Left = 10
      Top = 53
      Width = 60
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #46321#47197#44592#54252#53944
    end
    object Label1: TLabel
      Left = 10
      Top = 111
      Width = 48
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #51648#50669#53076#46300
    end
    object cmb_RegType: TComboBox
      Left = 170
      Top = 15
      Width = 161
      Height = 22
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style = csOwnerDrawFixed
      ImeName = 'Microsoft Office IME 2007'
      ItemIndex = 0
      TabOrder = 0
      Text = '0.RCU-100'
      OnChange = cmb_RegTypeChange
      Items.Strings = (
        '0.RCU-100'
        '1.Suprema Reader')
    end
    object cmb_Comport: TComboBox
      Left = 170
      Top = 48
      Width = 161
      Height = 22
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style = csOwnerDrawFixed
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 1
    end
    object ed_FingerIP: TEdit
      Left = 259
      Top = 48
      Width = 151
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 2
      Visible = False
    end
    object ed_FingerPort: TEdit
      Left = 170
      Top = 78
      Width = 151
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 3
      Text = '1471'
      Visible = False
    end
    object ed_AreaCD: TEdit
      Left = 170
      Top = 107
      Width = 151
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 4
      Text = '01'
    end
  end
  object btn_Save: TAdvGlowButton
    Left = 91
    Top = 150
    Width = 100
    Height = 25
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = #51200#51109
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    NotesFont.Charset = DEFAULT_CHARSET
    NotesFont.Color = clWindowText
    NotesFont.Height = -11
    NotesFont.Name = 'Tahoma'
    NotesFont.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btn_SaveClick
    Appearance.ColorChecked = 16111818
    Appearance.ColorCheckedTo = 16367008
    Appearance.ColorDisabled = 15921906
    Appearance.ColorDisabledTo = 15921906
    Appearance.ColorDown = 16111818
    Appearance.ColorDownTo = 16367008
    Appearance.ColorHot = 16117985
    Appearance.ColorHotTo = 16372402
    Appearance.ColorMirrorHot = 16107693
    Appearance.ColorMirrorHotTo = 16775412
    Appearance.ColorMirrorDown = 16102556
    Appearance.ColorMirrorDownTo = 16768988
    Appearance.ColorMirrorChecked = 16102556
    Appearance.ColorMirrorCheckedTo = 16768988
    Appearance.ColorMirrorDisabled = 11974326
    Appearance.ColorMirrorDisabledTo = 15921906
  end
  object btn_Close: TAdvGlowButton
    Left = 199
    Top = 150
    Width = 100
    Height = 25
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = #45803#44592
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    NotesFont.Charset = DEFAULT_CHARSET
    NotesFont.Color = clWindowText
    NotesFont.Height = -11
    NotesFont.Name = 'Tahoma'
    NotesFont.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btn_CloseClick
    Appearance.ColorChecked = 16111818
    Appearance.ColorCheckedTo = 16367008
    Appearance.ColorDisabled = 15921906
    Appearance.ColorDisabledTo = 15921906
    Appearance.ColorDown = 16111818
    Appearance.ColorDownTo = 16367008
    Appearance.ColorHot = 16117985
    Appearance.ColorHotTo = 16372402
    Appearance.ColorMirrorHot = 16107693
    Appearance.ColorMirrorHotTo = 16775412
    Appearance.ColorMirrorDown = 16102556
    Appearance.ColorMirrorDownTo = 16768988
    Appearance.ColorMirrorChecked = 16102556
    Appearance.ColorMirrorCheckedTo = 16768988
    Appearance.ColorMirrorDisabled = 11974326
    Appearance.ColorMirrorDisabledTo = 15921906
  end
end