object Form1: TForm1
  Left = 346
  Top = 288
  Width = 284
  Height = 269
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 12
    Top = 12
    Width = 89
    Height = 25
    Caption = '세션 비사용시'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 12
    Top = 112
    Width = 89
    Height = 25
    Caption = '핸들러 해제'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Post: TButton
    Left = 12
    Top = 160
    Width = 89
    Height = 25
    Caption = 'Post'
    TabOrder = 2
    OnClick = PostClick
  end
  object Button3: TButton
    Left = 12
    Top = 44
    Width = 89
    Height = 25
    Caption = '세션 사용시'
    TabOrder = 3
    OnClick = Button3Click
  end
end
