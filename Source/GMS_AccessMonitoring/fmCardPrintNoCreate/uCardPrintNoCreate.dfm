object fmCardPrintNoCreate: TfmCardPrintNoCreate
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = #52852#46300#51068#47144#48264#54840#49373#49457
  ClientHeight = 142
  ClientWidth = 472
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #47569#51008' '#44256#46357
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 17
  object Label1: TLabel
    Left = 32
    Top = 64
    Width = 122
    Height = 17
    AutoSize = False
    Caption = #52852#46300#51068#47144#48264#54840
  end
  object Label2: TLabel
    Left = 32
    Top = 24
    Width = 122
    Height = 17
    AutoSize = False
    Caption = #52852#46300#48264#54840
  end
  object btn_Save: TSpeedButton
    Left = 160
    Top = 104
    Width = 113
    Height = 22
    Caption = #51068#47144#48264#54840#51200#51109
    OnClick = btn_SaveClick
  end
  object btn_Cancel: TSpeedButton
    Left = 336
    Top = 104
    Width = 113
    Height = 22
    Caption = #52712#49548
    OnClick = btn_CancelClick
  end
  object ed_PrintNo: TEdit
    Left = 160
    Top = 61
    Width = 289
    Height = 25
    ReadOnly = True
    TabOrder = 0
  end
  object ed_CardNo: TEdit
    Left = 160
    Top = 21
    Width = 289
    Height = 25
    ReadOnly = True
    TabOrder = 1
  end
end