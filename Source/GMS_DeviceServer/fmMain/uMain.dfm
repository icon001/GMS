inherited fmMain: TfmMain
  Left = 0
  Top = 0
  Caption = 'GMS_DeviceServer'
  ClientHeight = 955
  ClientWidth = 1318
  Font.Height = -14
  Font.Name = 'Tahoma'
  FormStyle = fsMDIForm
  PopupMenu = PopupMenu1
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  ExplicitWidth = 1336
  ExplicitHeight = 1000
  PixelsPerInch = 120
  TextHeight = 17
  inherited ExcelEnImage: TImage
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
  end
  inherited ExcelDisImage: TImage
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
  end
  inherited Img_Stop: TImage
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
  end
  inherited img_Start: TImage
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
  end
  object Image1: TImage [4]
    Left = 10
    Top = 178
    Width = 1298
    Height = 859
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Center = True
  end
  object at_Menu: TAdvToolBarPager [5]
    Left = 0
    Top = 0
    Width = 1318
    Height = 169
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ActivePage = ApManager
    Caption.Caption = 'GMS_DeviceServer'
    CaptionButtons = []
    Hints.MDICloseBtnHint = 'Close'
    Hints.MDIMinimizeBtnHint = 'Minimize'
    Hints.MDIMaximizeBtnHint = 'Maximize'
    Hints.HelpBtnHint = 'Help'
    TabGroups = <
      item
        Caption = #52488#44592#49444#51221
        CaptionAlignment = taLeftJustify
        DefaultAppearance = True
        ImageIndex = -1
        TabIndexStart = 0
        TabIndexEnd = 0
        GroupAppearance.Background = clInfoBk
        GroupAppearance.BorderColor = 10729644
        GroupAppearance.Color = clWhite
        GroupAppearance.ColorTo = clWhite
        GroupAppearance.ColorMirror = clSilver
        GroupAppearance.ColorMirrorTo = clWhite
        GroupAppearance.Font.Charset = DEFAULT_CHARSET
        GroupAppearance.Font.Color = clWindowText
        GroupAppearance.Font.Height = -11
        GroupAppearance.Font.Name = 'Tahoma'
        GroupAppearance.Font.Style = []
        GroupAppearance.Gradient = ggVertical
        GroupAppearance.GradientMirror = ggVertical
        GroupAppearance.TextColor = clBlue
        GroupAppearance.CaptionAppearance.CaptionColor = clGray
        GroupAppearance.PageAppearance.BorderColor = clGray
        GroupAppearance.PageAppearance.Color = clWhite
        GroupAppearance.PageAppearance.ColorTo = clWhite
        GroupAppearance.PageAppearance.ColorMirror = clSilver
        GroupAppearance.PageAppearance.ColorMirrorTo = clWhite
        GroupAppearance.PageAppearance.Gradient = ggVertical
        GroupAppearance.PageAppearance.GradientMirror = ggVertical
        GroupAppearance.PageAppearance.ShadowColor = 12888726
        GroupAppearance.PageAppearance.HighLightColor = 16644558
        GroupAppearance.TabAppearance.BorderColor = clSkyBlue
        GroupAppearance.TabAppearance.BorderColorHot = clBlue
        GroupAppearance.TabAppearance.BorderColorSelected = clSkyBlue
        GroupAppearance.TabAppearance.BorderColorSelectedHot = clNone
        GroupAppearance.TabAppearance.BorderColorDisabled = clNone
        GroupAppearance.TabAppearance.BorderColorDown = clNone
        GroupAppearance.TabAppearance.Color = clSkyBlue
        GroupAppearance.TabAppearance.ColorTo = clNone
        GroupAppearance.TabAppearance.ColorSelected = clWhite
        GroupAppearance.TabAppearance.ColorSelectedTo = clSkyBlue
        GroupAppearance.TabAppearance.ColorDisabled = clNone
        GroupAppearance.TabAppearance.ColorDisabledTo = clNone
        GroupAppearance.TabAppearance.ColorHot = clYellow
        GroupAppearance.TabAppearance.ColorHotTo = clNone
        GroupAppearance.TabAppearance.ColorMirror = clNone
        GroupAppearance.TabAppearance.ColorMirrorTo = clNone
        GroupAppearance.TabAppearance.ColorMirrorHot = clNone
        GroupAppearance.TabAppearance.ColorMirrorHotTo = clNone
        GroupAppearance.TabAppearance.ColorMirrorSelected = clNone
        GroupAppearance.TabAppearance.ColorMirrorSelectedTo = clNone
        GroupAppearance.TabAppearance.ColorMirrorDisabled = clNone
        GroupAppearance.TabAppearance.ColorMirrorDisabledTo = clNone
        GroupAppearance.TabAppearance.Font.Charset = DEFAULT_CHARSET
        GroupAppearance.TabAppearance.Font.Color = clWindowText
        GroupAppearance.TabAppearance.Font.Height = -11
        GroupAppearance.TabAppearance.Font.Name = 'Tahoma'
        GroupAppearance.TabAppearance.Font.Style = []
        GroupAppearance.TabAppearance.Gradient = ggVertical
        GroupAppearance.TabAppearance.GradientMirror = ggVertical
        GroupAppearance.TabAppearance.GradientHot = ggVertical
        GroupAppearance.TabAppearance.GradientMirrorHot = ggVertical
        GroupAppearance.TabAppearance.GradientSelected = ggVertical
        GroupAppearance.TabAppearance.GradientMirrorSelected = ggVertical
        GroupAppearance.TabAppearance.GradientDisabled = ggVertical
        GroupAppearance.TabAppearance.GradientMirrorDisabled = ggVertical
        GroupAppearance.TabAppearance.TextColor = clBlue
        GroupAppearance.TabAppearance.TextColorHot = clBlue
        GroupAppearance.TabAppearance.TextColorSelected = clBlue
        GroupAppearance.TabAppearance.TextColorDisabled = clWhite
        GroupAppearance.TabAppearance.ShadowColor = 15255470
        GroupAppearance.TabAppearance.HighLightColor = 16775871
        GroupAppearance.TabAppearance.HighLightColorHot = 16643309
        GroupAppearance.TabAppearance.HighLightColorSelected = 6540536
        GroupAppearance.TabAppearance.HighLightColorSelectedHot = 12451839
        GroupAppearance.TabAppearance.HighLightColorDown = 16776144
        GroupAppearance.ToolBarAppearance.Color.Color = clWhite
        GroupAppearance.ToolBarAppearance.Color.ColorTo = clBtnFace
        GroupAppearance.ToolBarAppearance.Color.Direction = gdHorizontal
        GroupAppearance.ToolBarAppearance.ColorHot.Color = clNone
        GroupAppearance.ToolBarAppearance.ColorHot.ColorTo = clNone
        GroupAppearance.ToolBarAppearance.ColorHot.Direction = gdHorizontal
      end
      item
        Caption = #50868#50689
        CaptionAlignment = taLeftJustify
        DefaultAppearance = True
        ImageIndex = -1
        TabIndexStart = 1
        TabIndexEnd = 2
        GroupAppearance.Background = clInfoBk
        GroupAppearance.BorderColor = 10729644
        GroupAppearance.Color = clWhite
        GroupAppearance.ColorTo = clWhite
        GroupAppearance.ColorMirror = clSilver
        GroupAppearance.ColorMirrorTo = clWhite
        GroupAppearance.Font.Charset = DEFAULT_CHARSET
        GroupAppearance.Font.Color = clWindowText
        GroupAppearance.Font.Height = -11
        GroupAppearance.Font.Name = 'Tahoma'
        GroupAppearance.Font.Style = []
        GroupAppearance.Gradient = ggVertical
        GroupAppearance.GradientMirror = ggVertical
        GroupAppearance.TextColor = clBlue
        GroupAppearance.CaptionAppearance.CaptionColor = clGray
        GroupAppearance.PageAppearance.BorderColor = clGray
        GroupAppearance.PageAppearance.Color = clWhite
        GroupAppearance.PageAppearance.ColorTo = clWhite
        GroupAppearance.PageAppearance.ColorMirror = clSilver
        GroupAppearance.PageAppearance.ColorMirrorTo = clWhite
        GroupAppearance.PageAppearance.Gradient = ggVertical
        GroupAppearance.PageAppearance.GradientMirror = ggVertical
        GroupAppearance.PageAppearance.ShadowColor = 12888726
        GroupAppearance.PageAppearance.HighLightColor = 16644558
        GroupAppearance.TabAppearance.BorderColor = clBtnFace
        GroupAppearance.TabAppearance.BorderColorHot = clBlue
        GroupAppearance.TabAppearance.BorderColorSelected = clBtnFace
        GroupAppearance.TabAppearance.BorderColorSelectedHot = clNone
        GroupAppearance.TabAppearance.BorderColorDisabled = clNone
        GroupAppearance.TabAppearance.BorderColorDown = clNone
        GroupAppearance.TabAppearance.Color = clBtnFace
        GroupAppearance.TabAppearance.ColorTo = clWhite
        GroupAppearance.TabAppearance.ColorSelected = clWhite
        GroupAppearance.TabAppearance.ColorSelectedTo = clBtnFace
        GroupAppearance.TabAppearance.ColorDisabled = clNone
        GroupAppearance.TabAppearance.ColorDisabledTo = clNone
        GroupAppearance.TabAppearance.ColorHot = clYellow
        GroupAppearance.TabAppearance.ColorHotTo = clNone
        GroupAppearance.TabAppearance.ColorMirror = clWhite
        GroupAppearance.TabAppearance.ColorMirrorTo = clWhite
        GroupAppearance.TabAppearance.ColorMirrorHot = clNone
        GroupAppearance.TabAppearance.ColorMirrorHotTo = clNone
        GroupAppearance.TabAppearance.ColorMirrorSelected = clWhite
        GroupAppearance.TabAppearance.ColorMirrorSelectedTo = clWhite
        GroupAppearance.TabAppearance.ColorMirrorDisabled = clNone
        GroupAppearance.TabAppearance.ColorMirrorDisabledTo = clNone
        GroupAppearance.TabAppearance.Font.Charset = DEFAULT_CHARSET
        GroupAppearance.TabAppearance.Font.Color = clWindowText
        GroupAppearance.TabAppearance.Font.Height = -11
        GroupAppearance.TabAppearance.Font.Name = 'Tahoma'
        GroupAppearance.TabAppearance.Font.Style = []
        GroupAppearance.TabAppearance.Gradient = ggVertical
        GroupAppearance.TabAppearance.GradientMirror = ggVertical
        GroupAppearance.TabAppearance.GradientHot = ggVertical
        GroupAppearance.TabAppearance.GradientMirrorHot = ggVertical
        GroupAppearance.TabAppearance.GradientSelected = ggVertical
        GroupAppearance.TabAppearance.GradientMirrorSelected = ggVertical
        GroupAppearance.TabAppearance.GradientDisabled = ggVertical
        GroupAppearance.TabAppearance.GradientMirrorDisabled = ggVertical
        GroupAppearance.TabAppearance.TextColor = clBlue
        GroupAppearance.TabAppearance.TextColorHot = clBlue
        GroupAppearance.TabAppearance.TextColorSelected = clBlue
        GroupAppearance.TabAppearance.TextColorDisabled = clWhite
        GroupAppearance.TabAppearance.ShadowColor = 15255470
        GroupAppearance.TabAppearance.HighLightColor = 16775871
        GroupAppearance.TabAppearance.HighLightColorHot = 16643309
        GroupAppearance.TabAppearance.HighLightColorSelected = 6540536
        GroupAppearance.TabAppearance.HighLightColorSelectedHot = 12451839
        GroupAppearance.TabAppearance.HighLightColorDown = 16776144
        GroupAppearance.ToolBarAppearance.Color.Color = clWhite
        GroupAppearance.ToolBarAppearance.Color.ColorTo = clBtnFace
        GroupAppearance.ToolBarAppearance.Color.Direction = gdHorizontal
        GroupAppearance.ToolBarAppearance.ColorHot.Color = clNone
        GroupAppearance.ToolBarAppearance.ColorHot.ColorTo = clNone
        GroupAppearance.ToolBarAppearance.ColorHot.Direction = gdHorizontal
      end>
    TabSettings.LeftMargin = 25
    TabSettings.RightMargin = 25
    TabSettings.StartMargin = 50
    TabSettings.EndMargin = 0
    Persistence.Location = plRegistry
    Persistence.Enabled = False
    ToolBarStyler = AdvToolBarOfficeStyler1
    ShowExpandCollapsButton = True
    ShowTabHint = True
    ParentShowHint = False
    ShowHint = True
    PageLeftMargin = 0
    PageRightMargin = 0
    OptionPicture.Data = {
      424DA20400000000000036040000280000000900000009000000010008000000
      00006C000000C30E0000C30E00000001000000010000AD8C6300FF00FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0001010101010101010100
      0000010101010000000001000000010002010100000001000000010002010100
      0000010000000100020100020100010000000100020101010101010000000100
      0202020202010100000001000000000000010100000001010101010101010100
      0000}
    OptionDisabledPicture.Data = {
      424DA20400000000000036040000280000000900000009000000010008000000
      00006C0000000000000000000000000100000000000000000000000080000080
      000000808000800000008000800080800000C0C0C000C0DCC000F0CAA6000020
      400000206000002080000020A0000020C0000020E00000400000004020000040
      400000406000004080000040A0000040C0000040E00000600000006020000060
      400000606000006080000060A0000060C0000060E00000800000008020000080
      400000806000008080000080A0000080C0000080E00000A0000000A0200000A0
      400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0200000C0
      400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0200000E0
      400000E0600000E0800000E0A00000E0C00000E0E00040000000400020004000
      400040006000400080004000A0004000C0004000E00040200000402020004020
      400040206000402080004020A0004020C0004020E00040400000404020004040
      400040406000404080004040A0004040C0004040E00040600000406020004060
      400040606000406080004060A0004060C0004060E00040800000408020004080
      400040806000408080004080A0004080C0004080E00040A0000040A0200040A0
      400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0200040C0
      400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0200040E0
      400040E0600040E0800040E0A00040E0C00040E0E00080000000800020008000
      400080006000800080008000A0008000C0008000E00080200000802020008020
      400080206000802080008020A0008020C0008020E00080400000804020008040
      400080406000804080008040A0008040C0008040E00080600000806020008060
      400080606000806080008060A0008060C0008060E00080800000808020008080
      400080806000808080008080A0008080C0008080E00080A0000080A0200080A0
      400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0200080C0
      400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0200080E0
      400080E0600080E0800080E0A00080E0C00080E0E000C0000000C0002000C000
      4000C0006000C0008000C000A000C000C000C000E000C0200000C0202000C020
      4000C0206000C0208000C020A000C020C000C020E000C0400000C0402000C040
      4000C0406000C0408000C040A000C040C000C040E000C0600000C0602000C060
      4000C0606000C0608000C060A000C060C000C060E000C0800000C0802000C080
      4000C0806000C0808000C080A000C080C000C080E000C0A00000C0A02000C0A0
      4000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C02000C0C0
      4000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000FF0000FF
      000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFFFFFFFF00
      0000FDFDFDFD07070707FF000000FD07FFFDFD070707FF000000FD07FFFDFD07
      0707FF000000FD07FFFD07FFFD07FD000000FD07FFFDFDFDFDFDFD000000FD07
      FFFFFFFFFFFDFD000000FD070707070707FDFD000000FDFDFDFDFDFDFDFDFD00
      0000}
    TabOrder = 1
    object ApManager: TAdvPage
      AlignWithMargins = True
      Left = -1
      Top = 53
      Width = 1320
      Height = 116
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #47784#45768#53552#47553
      ShortCutHint = 'I'
      object AdvToolBar1: TAdvToolBar
        Left = 3
        Top = 3
        Width = 206
        Height = 110
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        AllowFloating = True
        Caption = ''
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = -11
        CaptionFont.Name = #47569#51008' '#44256#46357
        CaptionFont.Style = []
        CaptionPosition = cpBottom
        CaptionAlignment = taCenter
        CompactImageIndex = -1
        ShowRightHandle = False
        TextAutoOptionMenu = 'Add or Remove Buttons'
        TextOptionMenu = 'Options'
        ToolBarStyler = AdvToolBarOfficeStyler1
        ParentOptionPicture = True
        ToolBarIndex = 0
        object mn_PCMonitor: TAdvGlowButton
          Tag = 1
          Left = 2
          Top = 2
          Width = 98
          Height = 72
          Hint = 'MOF02i'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          AntiAlias = aaNone
          BorderStyle = bsNone
          Caption = 'PC'#47784#45768#53552#47553
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ImageIndex = 9
          Images = MenuImageList32
          DisabledImages = MenuDisImageList32
          FocusType = ftHot
          NotesFont.Charset = DEFAULT_CHARSET
          NotesFont.Color = clWindowText
          NotesFont.Height = -11
          NotesFont.Name = #47569#51008' '#44256#46357
          NotesFont.Style = []
          OfficeHint.Title = #54924#49324#53076#46300
          OfficeHint.Notes.Strings = (
            #49548#49549#53076#46300#47484' '#46321#47197'/'#49688#51221'/'#49325#51228' '#54624' '#49688' '#51080#49845#45768#45796'.')
          ParentFont = False
          Rounded = False
          Transparent = True
          TabOrder = 0
          OnClick = mn_PCMonitorClick
          Appearance.BorderColor = clWhite
          Appearance.BorderColorHot = 16246477
          Appearance.BorderColorDown = 15187578
          Appearance.BorderColorChecked = 15187578
          Appearance.BorderColorDisabled = clNone
          Appearance.ColorTo = clNone
          Appearance.ColorChecked = 15187578
          Appearance.ColorCheckedTo = clNone
          Appearance.ColorDisabled = clWhite
          Appearance.ColorDisabledTo = clWhite
          Appearance.ColorDown = 15187578
          Appearance.ColorDownTo = clNone
          Appearance.ColorHot = 16246477
          Appearance.ColorHotTo = clNone
          Appearance.ColorMirror = clWhite
          Appearance.ColorMirrorTo = clNone
          Appearance.ColorMirrorHot = 16246477
          Appearance.ColorMirrorHotTo = clNone
          Appearance.ColorMirrorDown = 15187578
          Appearance.ColorMirrorDownTo = clNone
          Appearance.ColorMirrorChecked = clNone
          Appearance.ColorMirrorCheckedTo = clNone
          Appearance.ColorMirrorDisabled = clWhite
          Appearance.ColorMirrorDisabledTo = clWhite
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
          Layout = blGlyphTop
        end
        object mn_DeviceMonitoring: TAdvGlowButton
          Tag = 1
          Left = 100
          Top = 2
          Width = 102
          Height = 72
          Hint = 'MOC01s'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          AntiAlias = aaNone
          BorderStyle = bsNone
          Caption = #51109#48708#47784#45768#53552#47553
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ImageIndex = 8
          Images = MenuImageList32
          DisabledImages = MenuDisImageList32
          FocusType = ftHot
          NotesFont.Charset = DEFAULT_CHARSET
          NotesFont.Color = clWindowText
          NotesFont.Height = -11
          NotesFont.Name = #47569#51008' '#44256#46357
          NotesFont.Style = []
          OfficeHint.Title = #54924#49324#53076#46300
          OfficeHint.Notes.Strings = (
            #49548#49549#53076#46300#47484' '#46321#47197'/'#49688#51221'/'#49325#51228' '#54624' '#49688' '#51080#49845#45768#45796'.')
          ParentFont = False
          Rounded = False
          Transparent = True
          TabOrder = 1
          OnClick = mn_DeviceMonitoringClick
          Appearance.BorderColor = clWhite
          Appearance.BorderColorHot = 16246477
          Appearance.BorderColorDown = 15187578
          Appearance.BorderColorChecked = 15187578
          Appearance.BorderColorDisabled = clNone
          Appearance.ColorTo = clNone
          Appearance.ColorChecked = 15187578
          Appearance.ColorCheckedTo = clNone
          Appearance.ColorDisabled = clWhite
          Appearance.ColorDisabledTo = clWhite
          Appearance.ColorDown = 15187578
          Appearance.ColorDownTo = clNone
          Appearance.ColorHot = 16246477
          Appearance.ColorHotTo = clNone
          Appearance.ColorMirror = clWhite
          Appearance.ColorMirrorTo = clNone
          Appearance.ColorMirrorHot = 16246477
          Appearance.ColorMirrorHotTo = clNone
          Appearance.ColorMirrorDown = 15187578
          Appearance.ColorMirrorDownTo = clNone
          Appearance.ColorMirrorChecked = clNone
          Appearance.ColorMirrorCheckedTo = clNone
          Appearance.ColorMirrorDisabled = clWhite
          Appearance.ColorMirrorDisabledTo = clWhite
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
          Layout = blGlyphTop
        end
      end
    end
    object AdvShapeButton1: TAdvShapeButton
      Left = 0
      Top = 30
      Width = 55
      Height = 24
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Appearance.Shape = bsOrb
      Appearance.BorderColor = clWhite
      Appearance.BorderColorHot = clWhite
      Appearance.BorderColorDown = 13005312
      Appearance.BorderColorDisabled = clWhite
      Appearance.InnerBorderColor = clGray
      Appearance.InnerBorderColorHot = clGray
      Appearance.InnerBorderColorDown = clGray
      Appearance.Color = 12954008
      Appearance.ColorTo = 15722980
      Appearance.ColorHot = 14408667
      Appearance.ColorHotTo = 14408667
      Appearance.ColorDown = 13005312
      Appearance.ColorDownTo = 13005312
      Appearance.ColorDownMirror = 13005312
      Appearance.ColorDownMirrorTo = 13005312
      Appearance.ColorDisabled = clGray
      Appearance.ColorDisabledTo = clGray
      Appearance.ShowPicture = False
      AdvPreviewMenu = StartMenu
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ShortCutHint = 'F'
      ShortCutHintPos = shpBottom
      TabOrder = 4
      Text = 'START'
      Version = '6.0.0.1'
    end
    object AdvQuickAccessToolBar1: TAdvQuickAccessToolBar
      Left = 5
      Top = 3
      Width = 60
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ShowCustomizeOption = False
      ShowHint = False
    end
  end
  object sb_Status: TAdvOfficeStatusBar [6]
    Left = 0
    Top = 936
    Width = 1318
    Height = 19
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    AnchorHint = False
    Panels = <
      item
        AppearanceStyle = psLight
        DateFormat = 'mm/dd/yyyy'
        Progress.BackGround = clNone
        Progress.Indication = piPercentage
        Progress.Min = 0
        Progress.Max = 100
        Progress.Position = 0
        Progress.Level0Color = clLime
        Progress.Level0ColorTo = 14811105
        Progress.Level1Color = clYellow
        Progress.Level1ColorTo = 13303807
        Progress.Level2Color = 5483007
        Progress.Level2ColorTo = 11064319
        Progress.Level3Color = clRed
        Progress.Level3ColorTo = 13290239
        Progress.Level1Perc = 70
        Progress.Level2Perc = 90
        Progress.BorderColor = clBlack
        Progress.ShowBorder = False
        Progress.Stacked = False
        TimeFormat = 'hh:mm:ss'
        Width = 150
        OfficeHint.Title = 'Statusbar'
        OfficeHint.Notes.Strings = (
          'The Office 2007 Luna style statusbar appears here.')
      end
      item
        AppearanceStyle = psLight
        Button = True
        DateFormat = 'mm/dd/yyyy'
        Progress.BackGround = clNone
        Progress.Indication = piPercentage
        Progress.Min = 0
        Progress.Max = 100
        Progress.Position = 0
        Progress.Level0Color = clLime
        Progress.Level0ColorTo = 14811105
        Progress.Level1Color = clYellow
        Progress.Level1ColorTo = 13303807
        Progress.Level2Color = 5483007
        Progress.Level2ColorTo = 11064319
        Progress.Level3Color = clRed
        Progress.Level3ColorTo = 13290239
        Progress.Level1Perc = 70
        Progress.Level2Perc = 90
        Progress.BorderColor = clBlack
        Progress.ShowBorder = False
        Progress.Stacked = False
        Style = psProgress
        TimeFormat = 'hh:mm:ss'
        Width = 100
      end
      item
        AppearanceStyle = psLight
        DateFormat = 'mm/dd/yyyy'
        MinWidth = 200
        Progress.BackGround = clNone
        Progress.Indication = piPercentage
        Progress.Min = 0
        Progress.Max = 100
        Progress.Position = 0
        Progress.Level0Color = clLime
        Progress.Level0ColorTo = 14811105
        Progress.Level1Color = clYellow
        Progress.Level1ColorTo = 13303807
        Progress.Level2Color = 5483007
        Progress.Level2ColorTo = 11064319
        Progress.Level3Color = clRed
        Progress.Level3ColorTo = 13290239
        Progress.Level1Perc = 70
        Progress.Level2Perc = 90
        Progress.BorderColor = clBlack
        Progress.ShowBorder = False
        Progress.Stacked = False
        Text = 'START '#48260#53948#51012' '#53364#47533#54616#50668' '#47196#44536#51064' '#54980' '#51089#50629#54616#49464#50836'.'
        TimeFormat = 'hh:mm:ss'
        Width = 500
      end
      item
        Alignment = taRightJustify
        AppearanceStyle = psDark
        DateFormat = 'mm/dd/yyyy'
        Progress.BackGround = clNone
        Progress.Indication = piPercentage
        Progress.Min = 0
        Progress.Max = 100
        Progress.Position = 0
        Progress.Level0Color = clLime
        Progress.Level0ColorTo = 14811105
        Progress.Level1Color = clYellow
        Progress.Level1ColorTo = 13303807
        Progress.Level2Color = 5483007
        Progress.Level2ColorTo = 11064319
        Progress.Level3Color = clRed
        Progress.Level3ColorTo = 13290239
        Progress.Level1Perc = 70
        Progress.Level2Perc = 90
        Progress.BorderColor = clBlack
        Progress.ShowBorder = False
        Progress.Stacked = False
        Style = psTime
        Text = '15:15:33'
        TimeFormat = 'hh:mm:ss'
        Width = 562
      end>
    ParentShowHint = False
    ShowHint = True
    ShowSplitter = True
    SimplePanel = False
    Version = '1.5.2.2'
  end
  object pan_TEST: TPanel [7]
    Left = 18
    Top = 388
    Width = 1247
    Height = 461
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    TabOrder = 4
    Visible = False
    object lb_ConnectedCount: TLabel
      Left = 375
      Top = 22
      Width = 219
      Height = 26
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      AutoSize = False
    end
    object lb_CardDownLoadCount: TLabel
      Left = 638
      Top = 56
      Width = 399
      Height = 26
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      AutoSize = False
    end
    object btn_ConnectedCount: TButton
      Left = 31
      Top = 21
      Width = 253
      Height = 33
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'ConnectedCount'
      TabOrder = 0
      OnClick = btn_ConnectedCountClick
    end
    object btn_FailList: TButton
      Left = 31
      Top = 61
      Width = 253
      Height = 33
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'FailList'
      TabOrder = 1
      OnClick = btn_FailListClick
    end
    object mem_FailList: TMemo
      Left = 31
      Top = 102
      Width = 504
      Height = 349
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Lines.Strings = (
        'Memo1')
      TabOrder = 2
    end
    object btn_CardDownLoadCount: TButton
      Left = 638
      Top = 16
      Width = 253
      Height = 32
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'CardDownLoadCount'
      TabOrder = 3
      OnClick = btn_CardDownLoadCountClick
    end
  end
  object chk_debug: TCheckBox [8]
    Left = 9
    Top = 177
    Width = 127
    Height = 22
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'debug'
    TabOrder = 7
    OnClick = chk_debugClick
  end
  inherited CommandArray: TCommandArray
    Commands = <
      item
        CommandName = 'FORMENABLE'
        CommandKind = 0
        Name = 'TFORMENABLE'
        OnExecute = CommandArrayCommandsTFORMENABLEExecute
      end>
  end
  object MenuImageList32: TImageList
    BkColor = clWhite
    DrawingStyle = dsTransparent
    Height = 32
    Width = 32
    Left = 344
    Top = 64
    Bitmap = {
      494C01011F009400A00520002000FFFFFF00FF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000000001000001002000000000000000
      020000000000000000000000000000000000FFFFFF00FAFAFA00EDEDEC00EDED
      EC00EDEDED00ECECEC00ECECEC00EDEDEC00EDEDEC00EDEDEC00EDEDEC00EDED
      EC00EFEFEE00F4F4F300F7F7F700F8F8F800F5F5F500F7F7F700FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00F0F0EF00EDEDEC00ECECEC00F2F2
      F100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F9F9FA00E6E6E600F4F4F400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F6F6F600E6E6E600F8F8F800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E8E8
      E700E4E4E300E4E4E300E4E4E300E9E9E800EEEEED00EDEDED00EDEDED00EDED
      ED00EDEDED00EDEDED00EDEDED00EDEDED00EDEDED00EDEDED00EDEDED00EDED
      ED00EDEDED00EDEDED00EDEDED00EDEDED00EEEEED00EAEAE900E4E4E300E4E4
      E300E4E4E300E7E7E700FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00E6E6E500E1E1
      E000FAFAFA00F9F8F800EAE9E900E1E1E000E0E0DF00E0E0DF00E0E0DF00E0E0
      DF00E0E0DF00E1E1E000E1E1E000E1E1E000EFEFEE00FEFEFE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5F5F400E0E0DF00E5E4E300FCFC
      FC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E7E7E700E1E0E100FDFDFD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00E2E2E300E5E5E600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E4E3
      E300DEDEDD00DEDEDD00DEDEDD00E4E4E300E9E9E800E8E8E800E8E8E800E8E8
      E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8
      E800E8E8E800E8E8E800E8E8E800E8E8E800E9E9E800E4E4E400DEDEDD00DEDE
      DD00DEDEDD00E3E2E200FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00ECECEC00EEEE
      ED00FFFFFF00FFFFFF00FFFFFF00FAFAFA00EFEFEF00E5E5E500DFDEDE00DCDC
      DB00DDDDDC00E2E2E200EDEDEC00FBFBFB00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00E3E3E200F4F4F400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E5E5E500EEEEEF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F0F0F000E4E4E400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F4F4
      F400DEDDDC00DBDAD900DCDBDA00DAD9D800D9D8D700DAD9D800DAD9D800DAD9
      D800DAD9D800DAD9D800DAD9D800DAD9D800DAD9D800DAD9D800DAD9D800DAD9
      D800DAD9D800DAD9D800DAD9D800DAD9D800D9D8D700DAD9D800DCDBDA00DBDA
      D900DDDCDC00F3F2F200FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CECD
      CD00656263005552530055525300514E4F004D4A4B004D4A4B004D4A4B004D4A
      4B004D4A4B004D4A4B004D4A4B004C4A4B004C4A4B004C4A4B004C4A4B004C4A
      4B004C4A4B004C4A4B004C4A4B004C4A4A004B4A4A004F4D4D00535151005057
      5F00605E5D00C5C4C500FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F4F4F4005F5E5F00BCBCBC00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE007977780091909000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006260
      61004341420043414200434142005B595A007271710072717100727171007271
      7100727171007271710072717100727171007271710072717100727171007271
      710072717100727071007270710071707100717071005E5855003D658F004094
      E0003C638B005B555300FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FAFAFA005E5C5D0059575800F9F9F900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C8C7C80044424300AAA9A900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005553
      5400444243004442430044424300747273009C9B9B009B9A9B009B9A9B009B9A
      9B009B9A9B009B9A9B009B9A9B009B9A9B009B9A9B009B9A9B009B9A9A009B9A
      9A009B9A9A009B9A9A009B9A9A009B9A9A009B9A9B007A7572003C6D9F00459D
      ED003B6B9B00524A4700FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00DFDFDF0090909000FFFFFF00FFFFFF00F4F4F400C8C8C800959495007574
      75006A696A006C6B6C007F7E7F00AFAFAF00ECECEC00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A8A7A800A8A7A800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C4C4C40045434400B5B4B500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FDFDFD006A6869005C5A5B00F8F8F800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A09F
      9F00454343004543430045434300454343004543430045434300454343004543
      4300454343004543430045434300444243004443430044434300444243004442
      4300444243004442430044424300444243004442420043414100424448003D52
      68004343450095939300FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00A3A2A3004B4A4B00B3B3B300B1B0B100636263004E4D4E004E4D4E004F4D
      4E004F4E4F004F4E4F00504E4F00504E4F0069686900BCBBBC00FCFCFC00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EDEDED00575657004C4B4C00D3D2D300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE006D6C6C005B595900F8F8F800FFFF
      FF00FFFFFF00FFFFFF00C4C4C4004B484900BAB9B900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00D2D1D200C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C1C0
      C100C7C6C700CACACA00C5C4C400BCBBBC00B9B8B900BCBBBC00C4C3C300CACA
      CA00C8C7C700C2C1C100C0BFC000C0BFC000C0BFC000C0BFC000C0BFBF00C0BE
      BD00CECECE00FEFEFE00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00F9F9
      F900646364004E4C4D004F4D4E004F4E4F00504F5000514F5000515051005250
      51005C5B5C0098979800CBCACA00E7E7E700E6E6E600C8C8C800E1E1E100FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00979797004E4D4E004E4C4D0062606100EDED
      ED00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CDCCCC004C494A00AFAEAF00FFFF
      FF00FFFFFF00FDFDFD006967670067656500FAFAFA00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E1E0E000A9A8A9007C7B7C0068666700615F6000676566007A787900A6A5
      A500DCDCDC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00C5C5
      C5004F4E4F00514F500052505100525152005352530053525300565556009A9A
      9A00E8E8E800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00DFDEDF005554550051505100504F50004F4E4F007D7C
      7D00FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007F7D7D005E5C5C00F6F6
      F600FFFFFF00BFBEBE00504E4E00CACACA00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F4F4F400DCDBDC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D5D5D5007A78
      780047454500474545004745450058575700626161005A585800474445004744
      45004644450073717200CFCFCF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF008383
      8300525052005352530054525400555454005654550073727200D3D2D300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008684850055545400545354005352530052515200514F
      5000A0A0A000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E5E5E500D0CF
      CF00D0D0D000D1D0D000D1D1D100D2D1D100D3D2D200ACABAB00525050009F9E
      9E00D3D2D2006A686800615F5F00D1D0D000D3D2D200D2D2D200D2D2D200D2D1
      D100D2D1D100D1D1D100D1D0D000E8E8E800FFFFFF00FFFFFF00FFFFFF00B9B9
      B900535151004E4C4D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ABAAAA00474546004846
      460075747400BBBABB00E6E5E600F8F8F800FEFEFE00F9F8F800E7E7E700C0BF
      BF007A7878004745450047444500A2A0A100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00E3E3E3005756
      5700545354005654550057555600585657005A595A00DEDDDE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00CCCCCC0058575800585657005755560055545500545354005352
      530052515200BBBABB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00626060004A48
      49004C4A4B004E4C4C00504D4E00514F4F005350510054525200555353005653
      5300565454005654540056545400565454005553530055525200545151005250
      5000514F4F00504D4E004E4B4C0078777700FFFFFF00D3D2D2006F6D6E004543
      43006B686900514F5000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009C9B9B004846470059575800C1C1
      C100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C7C7C7005E5C5D004745450091909000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF009F9E9E005654
      55005756570058575800595859005A5959005B5A5A008A898900FBFAFA00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F7F7F700787677005D5B5C005B5A5A005958580058575700575657006765
      660088888800A6A5A600FFFFFF00FFFFFF00FFFFFF00FFFFFF00535051006E6B
      6C00C9C8C800CCCCCC00CDCCCC00CDCDCD00CECDCD00CECDCD00CECECE00CFCE
      CE00CFCECE00CFCECE00CFCECE00CFCECE00CFCECE00CECECE00CECDCD00CECD
      CD00CDCDCD00C8C7C70067656500636061008C8A8B004A48480074737300D9D9
      D900F2F2F2005D5B5C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B0B0B0004947470064626200E5E5E500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00ECEBEB006B6A6A0047454600A4A4A400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00999899008785
      8600888687008B8B8B008D8B8C008E8D8D00919090008F8F8F00E5E4E400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F8F8F800D9D9D900E3E3E300A6A6A6005C5B5B005B595A005A585900AEAD
      AD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00514E4F009C9A
      9A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008B8A8A00514F4F0064626200C1BFC000FFFFFF00FFFF
      FF00ECECEC005D5C5D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E0DFDF00504D4E0057565600E2E1E200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E9E9E9005C5A5B0049474800D6D6D600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C6C6C6005F5D5E005E5C5D005C5B5B00BCBC
      BC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00535152009998
      9800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008988880052505000E8E8E800FFFFFF00FFFFFF00FFFF
      FF00EBEBEB005F5D5E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008A8889004B484900BBB9BA00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C5C500494647007C7A7B00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CDCCCD0061606000605E5F005E5D5D00D4D4
      D400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00555353009B99
      9900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008A88880054525200EFEFEF00FFFFFF00FFFFFF00FFFF
      FF00ECEBEB00605E5F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EAEAEA004F4D4D0069686800FCFCFC00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F8FBFF00BEDEFC00A6D1FC00BBDCFC00F4F9FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00737172004B484800E0E0
      E000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00D0D0D000646263006261610067666600EDED
      ED00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00565454009C9B
      9B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008A89890056535300EEEDED00FFFFFF00FFFFFF00FFFF
      FF00ECEBEB00615F6000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B7B7B7004C4A4A00AEADAD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00DEEEFE005AAAF9003396F7003396F7003396F70054A7F800D5EA
      FD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BBBABA004A484800A9A8
      A800FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F8FBFF00FEFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CBCACA0066656500656364008D8C8C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00585656009D9B
      9B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008C8A8A0058555500EEEEEE00FFFFFF00FFFFFF00FFFF
      FF00ECECEC0063606100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008F8D8E004D4A4B00DCDCDC00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F9FCFF0059A9F8003496F7002D93F7002991F7002D93F7003496F7004EA4
      F800F4F9FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E5E5E5004B4949008381
      8100FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CBE4FD00FDFEFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00BEBDBD006967670067666600CCCBCC00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00595757009D9C
      9C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008D8B8B0059575700EEEEEE00FFFFFF00FFFFFF00FFFF
      FF00ECECEC0063616200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF007A7979004F4D4D00EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00CBE4FD003396F7002D93F7005CABF800B3D8FC0064AFF9002D93F7003396
      F700BDDDFC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6F6F600565454006C6B
      6B00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0083BFFA00F1F8FE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF009F9F9F006B6A6A008F8E8E00FDFDFD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005A5858009D9C
      9C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008E8C8C005A585800F3F2F200FFFFFF00FFFFFF00FFFF
      FF00ECECEC0063626300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF007473730056545400F5F4F400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00AED5FC003396F7002790F700B5D9FC00FFFFFF00C6E2FD002891F7003396
      F7009DCDFB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFBFB00615F5F006563
      6400FEFEFE00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0055A8F8009DCCFB00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F3F2F200717070007F7D7D00ECECEC00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005B5859009F9D
      9D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00908E8E005B595900D7D7D700FFFFFF00FFFFFF00FFFF
      FF00ECECEC0064636300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF007B797A00514E4F00EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C9E3FD003396F7002D93F70061ADF900B9DBFC006AB2F9002C93F7003396
      F700BBDCFC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700585656006E6B
      6C00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF006FB5F9003698F700C2E0FD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FAFAFA00A2A0A000908F8F00E9E9E900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005A585800A2A0
      A000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00939292005C5959005C595900A4A2A200F4F4F400FFFF
      FF00EFEFEF0064636300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00908F8F004F4D4D00DEDDDD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F7FBFF0055A7F8003496F7002D93F7002A91F7002D93F7003496F7004BA2
      F800F2F8FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E6E6004E4B4C008381
      8100FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A5D0FB003396F7003999F700A9D3FC00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E8F3FE00EDF6FE00FFFFFF00FFFFFF00FFFF
      FF00F8F8F800D4D4D400CCCBCB00FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005D5B5B007B79
      7900D9D9D900DDDDDD00DEDDDD00DEDEDE00DFDEDE00E0DFDF00E0E0E000E1E0
      E000E2E1E100E2E2E100E2E2E100E1E1E100E1E0E000E0E0DF00E0DFDF00DFDE
      DE00DEDEDE00D9D9D9007572720073707000B3B2B2005E5B5C0063616100C1C0
      C000E5E5E50063616100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B8B8B800504E4E00B1B1B100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00DCEDFE0056A8F8003396F7003396F7003396F70050A5F800D4E9
      FD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDBCBC004E4C4C00AAA9
      A900FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E7F3FE003E9CF7003396F7003396F7006DB4
      F900D5E9FD00FFFFFF00FFFFFF007CBBFA007DBCFA00FFFFFF00FFFFFF00FFFF
      FF00FDFDFD00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006B6969005957
      57005C5A5A005F5D5D00635E5D0067605B006B625D006E6660006F6A6700716E
      6D0074717000767372007673720073706F00716E6D006E6B6A006B6867006865
      650064626100625F5F005F5C5C007F7D7D00FFFFFF00EEEEEE0096959500514F
      4F005654540058565600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E8E8E80054525200716F6F00FEFEFE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F4F9FF00B8DAFC0099CBFB00B5D9FC00F0F7FE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007A7878004F4C4D00E0DF
      E000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009BCCFB003396F7003396F7003396
      F7003698F7007FBDFA00BCDCFC003A9AF7003496F700D8EBFD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DFDFDF00C5C4
      C400C5C4C300C7C4C200CCCCCD00BFC9D300ABBDCE00BBC7D300CFD1D400CECB
      C800CDCBCA00CDCDCC00D0CFCF00CECDCD00BBBAB900BCBBBA00CECDCD00CBCA
      CA00C8C7C700C7C7C700C7C6C600E4E3E300FFFFFF00FFFFFF00FFFFFF00DADA
      DA007C7A7A0066646400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008C8A8A00524F4F00C1C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CBCACA004F4D4D007F7D7D00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFDFF006DB4F9003396F7003396
      F7003396F7003396F7003396F7003396F7003396F70069B2F900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00D3E6F9005EAFFD0043A2FE0053A9FE00B4D7F900FFFF
      FF00FFFFFF00FFFFFF00F8F8F8009C9B9B007776760079787700A7A6A600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F2F1F100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00DFDFDF0056545400605E5E00E7E6E600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EDEDED0065636300504E4E00D6D5D500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F2F8FE0069B2F9003396
      F7003396F7003396F7003396F7003396F7003396F7003396F700B9DBFC00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E4F2FF003E9EFC003396F7003396F7003396F7003297FA00C6E3
      FF00FFFFFF00FEFEFE009493920068676600686766006867660068676600A9A8
      A700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B1AFB00052515100706F6E00EAEAEA00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F0F0F00077757500514F4F00A4A3A300FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8FBFF0086C1
      FA003496F7003396F7003396F7003396F7003396F7003396F7004FA4F800F6FA
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00AFD6FC003396F7003396F7003396F7003396F7003396F70087C3
      FE00FFFFFF00F0F0F0006D6C6A00686766006867660068676600686766007A79
      7900FBFBFB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009D9B9B005351510067656500CBCA
      CA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00D1D0D0006C6B6B005250500092919100FEFEFE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B5D9FC003496F7003396F7003396F7003396F7003396F7003396F70095C9
      FB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B5D9FC003396F7003396F7003396F7003396F7003396F7008CC6
      FE00FFFFFF00F2F2F2006F6E6C00686766006867660068676600686766007D7C
      7B00FBFBFB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ABAAAA00545252005452
      520084828200C6C5C500EDEDED00FCFCFC00FFFFFF00FCFCFC00EFEFEF00C9C8
      C800888787005350510053515100A2A0A100FEFEFE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00A3D0FB003396F7003396F7003396F7003396F7003597F7003E9CF7005FAD
      F900F5FAFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EEF6FE004DA3F8003396F7003396F7003396F7003898F700D4EA
      FF00FFFFFF00FFFFFF00A2A1A00068676600686766006867660068676600B7B6
      B600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D3D2D2007E7C
      7D005552530055525300585555006C696900737171006B6A6A00595757005452
      52005452520078767600CCCCCC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8FB
      FF0069B2F9006AB2F90089C2FA00A7D2FC00C5E1FD00D9ECFE00EBF5FE00F8FB
      FF00FEFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00DCEDFE0070B5F90049A1F80061AEF900C5E1FD00FFFF
      FF00FFFFFF00FFFFFF00F8F8F800ABAAAA007B7A79007E7D7C00B6B5B500FEFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00D6D5D500A09F9F007B797900646363005C5A5A0064626200797777009C9B
      9B00D1D1D100FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E6CB9B00C1903300AC750E009F6A04009763010097630100A16B
      0400B47E1700CDA14800F3E5CD001AA3F1000690E7000984DC000A81D900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00ECEBEB00E9E9E800E9E9E800E9E9E800F1F1F000FFFF
      FF00F9F9F900E9E9E800E9E9E800E9E9E800E9E9E800F9F9F900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B27D1B009863
      0100B3770400D38D0700DC940700E5990800ED9F0900F5A60D00FDAD1200FDAE
      1500FDAE1600F0BF6000FDAE150059C8FF0045C1FF0000AAFF007FD4FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F6F6F600E3E3E200DBDAD900E0E0DF00FCFCFC00FFFF
      FF00FFFFFF00E7E7E600DCDBDA00DBDBDA00DBDAD900F0F0F000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FEFEFE00FDFDFD00FDFD
      FD00FBFBFB00FBFBFB00FAFAFA00FAFAFA00FAFAFA00FBFBFB00FBFBFB00FCFC
      FC00FDFDFD00FDFDFD00FEFEFE00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFEFA00FFFEFA00FFFFFF00FFFFFF00FFFDF900FFFFFD00FFFF
      FD00FFFEFA00FFFFFE00FFFFFF00FFFEFA00FFFEFA00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFA00FFFEFA00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BE8E34009B660100BF7F0500C785
      0600CF8B0600D8910700E0980C00E8A01200F1A81B00F9B02400FDB52A00FDB6
      2D00FDB72F00F2D29500FDB62D0061CAFF00EEF8FE0064CBFF001EB4FF0080D5
      FF000987DE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F0F0F000F6F6F600FFFFFF00FFFF
      FF00FFFFFF00F2F2F200D2D1D000DFDEDE00EEEEED00FCFCFC00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FEFEFE00FEFEFE00FCFCFC00FAFAFA00F7F7F700F5F5
      F500F2F2F200F0F0F000EFEFEF00EEEEEE00EEEEEE00EFEFEF00F1F1F100F3F3
      F300F6F6F600F8F8F800FBFBFB00FDFDFD00FEFEFE00FEFEFE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFD00FFFCF200FFFCF200FFFFFF00FFFDF900FFFBF200FFFBF200FFFB
      F200FFFBF200FFFBF200FFFFFF00FFFCF200FFFCF200FFFEFC00FFFEFC00FFFE
      FC00FFFEFC00FFFEFC00FFFEFC00FFFEFC00FFFCF400FFFCF200FFFCF200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A66E0300BB7C0500C3820500CB88
      0600D48E0900DC961100E49F1A00ECA82600F5B23000FDBB3C00FDBD4200FDBE
      4500FDBF4700FFFAEF00EDBC590092BCA80073CAF900E2F0FB0082D5FF0000AA
      FF00088AE100078BE300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FEFEFE00FCFCFC00F9F9F900F4F4F400EEEEEE00E8E8E800E2E2
      E200DDDDDD00DADADA00D8D8D800D7D7D700D7D7D700D9D9D900DBDBDB00DFDF
      DF00E5E5E500EBEBEB00F1F1F100F6F6F600FBFBFB00FDFDFD00FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFEFB00FEF9EB00FEF9EB00FFFFFF00FEFAEC00FEFAEC00FEFAEC00FEFA
      EC00FEFAEC00FEFAEC00FFFFFF00FEF9EB00FEF9EB00FEF9EB00FEF9EB00FEF9
      EB00FEF9EB00FEF9EB00FEF9EB00FEF9EB00FEF9EB00FEF9EB00FEF9EB00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B6790400BE7F0500C7850600CF8C
      0A00D7941300E09E1E00E8A82A00F0B13900FABD4700FEC35300FEC55900FEC7
      5D00FECD6F00FFFFFF00D1B58000FEC65A009FC4B0007CC6F400D6EAF90096DC
      FF0000AAFF0080D5FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F1F1F100BEBDBD00F9F9F900FFFFFF00FFFF
      FF00F1F1F1007371720083818100B8B6B700F4F3F300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFEFE00FCFCFC00F7F7F700EFEFEF00E4E4E400D9D9D900CFCFCF00C7C7
      C700C0C0BF00BDBCBB00BBB9B700BAB8B600BAB8B600BCBBB900BFBEBE00C3C3
      C300CACACA00D4D4D400DEDEDE00E9E9E900F3F3F300F9F9F900FDFDFD00FEFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFEF900FEF7E400FEF7E400FFFBF100FFFDF800FFFDF800FFFDF800FFFD
      F800FFFDF800FFFDF800FFFDF800FEF7E400FEF7E400FEF7E400FEF7E400FEF7
      E400FEF7E400FEF7E400FEF7E400FEF7E400FEF7E400FEF7E400FEF7E400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BA7C0500C2820500CB890A00D391
      1200DB9B1E00E4A52C00EDB03B00F5BB4D00FEC86000FECB6800FECD7000FECF
      7500FFD99100FFFFFF00B5A89100FECE7200FECC6B00A6C8B7007FC4F100CEE6
      F7008FDAFF0027B7FF0080D5FF000594EB00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FCFBFB00B5B4B400636161004D4B4B009F9D9E00FFFFFF00FFFF
      FF00AFAEAE004A4849004B4949004A484800C3C2C300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFE
      FE00FDFDFD00F8F8F800EEEEEE00DFDFDF00CDCDCD00BEBDBD00B3B1AF00AFA8
      A200B0A49800B2A19000B4A08C00B6A08A00B5A08A00B3A18E00B1A39400AEA5
      9C00B0ACA800B7B6B500C4C4C400D6D6D600E6E6E600F4F4F400FBFBFB00FEFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFDF800FEF6DE00FEF6DE00FEF6DE00FEF6DE00FEF6DE00FEF6DE00FEF6
      DE00FEF6DE00FEF6DE00FEF6DE00FEF6DE00FEF6DE00FEF6DE00FEF6DE00FEF6
      DE00FEF6DE00FEF6DE00FEF6DE00FEF6DE00FEF6DE00FEF6DE00FEF6DE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BB7D0500C6850700CE8D1000D797
      1C00DFA12A00E8AC3A00F1B94E00F9C56200FECE7300FED27D00FED58600FED7
      8D00FFEBC500FFFFFF00A49E9200FED68A00FED48200FED07800A7C9B90087CA
      F400D6EAF90077D1FF0000AAFF000597EE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F3F3F300575555004F4D4D004F4D4D00504D4E00C5C5C500DFDF
      DF00666465004D4B4B004C4A4B004D4B4B00DAD9D900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFE
      FE00FCFCFC00F4F4F400E5E5E500CFCFCF00B9B8B800AAA5A000B09E8C00BB9C
      7D0098785A00C1884D00D6A15A00DEB36C00DEB17900D39F5F00A8774E00BC9A
      7700B59C8300ABA19600AFAEAC00C3C3C300DADADA00EDEDED00F8F8F800FDFD
      FD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFE00FDF4D800FDF4D800FDF4D800FDF4D800FDF4D800FDF4D800FDF4
      D800FDF4D800FDF4D800FDF4D800FDF4D800FDF4D800FDF4D800FDF4D800FDF4
      D800FDF4D800FDF4D800FDF4D800FDF4D800FDF4D800FDF4D800FDF4D800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B97B0400D99F3100D3921600DB9C
      2400E4A83400ECB44800F5C15E00FDCF7700FED58500FED99100FEDC9B00FEDC
      9C00FFFFFF00FFFFFF0097959000FEDEA100FEDB9700FED78D00FBCF79009DC1
      B0007DCAF600F2F8FD005CC9FF0006A6FA00078FE60001A4F90001A8FD00039C
      F2000A82DA00C0E4FA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0093919100514E4F00514E4F00514E4E00504E4E00514E
      4F004F4D4D004F4C4D004E4C4C0058565700F5F5F500FFFFFF00FFFFFF00F4F4
      F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFE
      FE00FBFBFB00F2F2F200E0E0E000C6C6C600AFAEAC00AF9E8C00CF8C6100E6B6
      6E00F2CE8000F6DA8B00FAEEC300F9E39600F8E29200FCF9EF00F6D48000EEC7
      7800DBA35D0097715600A79F9800B9B8B800D3D3D300E9E9E900F7F7F700FDFD
      FD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B0740400F5CA7800D7971C00DFA1
      2C00E8AE3F00F0BB5400F9C96E00FED48400FEDA9300FEDFA200FEE3AF00FFDB
      9600FFFFFF00FFFFFF0092908E00FEE6B700FEE2AB00FEDD9E00FBD38900EDBD
      5F008EB6A50072CCFC006CC3F6003CBEFF0088D9FF00AAE5FF00AEE6FF00B1E7
      FF00B5E8FF00199EED0089CDF500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00D1D0D1005350500053505000514F50004D4C50004C4A
      4F004C4B50004C4A4F004F4D4E0052505000A5A4A400D2D1D100918F8F005F5C
      5D00BFBEBE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFE
      FE00FBFBFB00F3F3F300E2E2E200CACACA009C674A00E2A26300EDB97200F2C8
      7D00F6D68800F8E08D00F9E27F00FAEB9900FAEA9A00F9ECBD00FFFFFF00F9E5
      BB00F4D09F00E9AA5C00D1874800BDBCBC00D5D5D500EBEBEB00F7F7F700FDFD
      FD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00DA960000DA960000DA960000DA960000DA960000DA960000DA96
      0000DA960000DA960000DA960000DA960000DA960000DA960000DA960000DA96
      0000DA960000DA960000DA960000DA960000DA960000DA960000EECB8000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AD761000EEBE6200DA9B2100E3A7
      3200ECB34700F4C15E00FDD07A00FED88E00FEDE9F00FEE9BF00FEE8BB00FFFB
      F400FFFFFF00FFFFFF008D8C8B00FFEDCA00FEE8BD00FEE2AC00FBD89400EDC0
      6700E0AA42008ED9FC0057C7FF00ABE5FF0093DDFF0097DEFF009ADFFF009DE0
      FF00A1E2FF00A5E3FF001593E500FFFFFF00FFFFFF00FFFFFF00F4F4F400C1C0
      C000D8D7D700EAEAEA00A09F9F0055525200514F52006F6D6E00A5A09100B2AB
      8E00B2AB8E00A29E90006A686A004E4C4F00504E4E004F4D4D004E4C4C004D4B
      4C0069686800F7F6F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFE
      FE00FDFDFD00F6F6F600EAEAEA00C7683500E19B5B00EBB88300EDBB7200F1C9
      7F00F6D68C00FBF5CC00FCF6DE00FEFDFD00FFFEFD00FBF1AA00FDF9FB00FCF2
      CF00EFC37900EAB36B00E5AA7000E2B29D00A19A9600F0F0F000FAFAFA00FEFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00DD990000DD990000DD990000DD990000DD990000DD990000DD99
      0000DD990000DD990000DD990000DD990000DD990000DD990000DD990000DD99
      0000DD990000DD990000DD990000DD990000DD990000DD990000DD990000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFCFA00D6941600EFBE5E00E7AB
      3700F0B84D00F8C76700FED37F00FED99100FEDFA400FFF1D500FFDB9600FFFF
      FF00FFFFFF00FFFFFF0082828200FFF2D900FFECC700FEE5B500FBDA9C00EDC1
      6B00E0AB450066C3F8003CBFFF007CD5FF007FD6FF0083D7FF0087D8FF0089D9
      FF008DDBFF0091DCFF0094DDFF0042AAEC00FFFFFF00FFFFFF00BABABA005653
      5400565454005D5B5B0056545400535154008D8A8400C2B99000C5B56600CABB
      7000CABB6F00C4B56600C0B8920085827E004F4D4F00514F4F00504D4E004F4D
      4D004E4B4C00CAC9C900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFEFE00FBFBFB00C05E2D00DA874D00E19A5C00E7A96800EBB87200F1C6
      8000F6D38E00FADF9800FFFEFF00FFFFFF00FDECA400FBE39D00F8D99400FDF6
      EB00EFBE7500E9B16C00E4A15F00ECBD7A00CD753E00C5C2C100FCFCFC00FEFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00DF9C0000DF9C0000DF9C0000DF9C0000DF9C0000DF9C0000DF9C
      0000DF9C0000DF9C0000DF9C0000DF9C0000DF9C0000DF9C0000DF9C0000DF9C
      0000DF9C0000DF9C0000DF9C0000DF9C0000DF9C0000DF9C0000DF9C0000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAD19D00EEB95300ECB1
      3D00F4BC5100FCCA6A00FED27E00FED99100FEE2AA00FEE5B600F8F6F100AFC8
      E2009CBCDE00DEE9F4008D8D8D00FFF2DA00FFECC800FEE6B600FBDB9C00EDC1
      6C00EECE900019B2FE005CC9FF0069CEFF006BCFFF006FD0FF005AB9F200E3F4
      FE00C9EFFF007DD5FF0080D6FF000C87DE00FFFFFF00FFFFFF00868484005855
      550058565600585656005755560075727200C3BA8E00C7B76400ECE7D000FDFD
      FB00FDFDFA00EAE5CB00C6B56100C0B8900068666700524F5000524F4F00514F
      4F009E9D9D00F5F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFEFE009C553800CF754300D7844B00FDFAF800E3A46100EAB47000EFC2
      7D00F5CA8400FFFFFF00FBE5A900FEFAE900FDE2A300FBDB9D00F7D49300F3C9
      8500FEFDFD00E7AD6D00E19D5D00DC925900EAB57F00D89F8500FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E29F0000E29F0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E29F0000E29F0000E29F0000E29F0000E29F
      0000E29F0000E29F0000E29F0000E29F0000E29F0000E29F0000E29F0000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9E5BF00F9CA
      7000F8BF5300FECA6700FED07800FED78B00FFF2D700E6CF9D007B9FC40087AA
      CE0094B5D8009BBBDE008F949A00FFEECD00FEE9C000FEE3AF00FBD99700EFC5
      7300FFFFFF001AB3FF004EC6FF0055C7FF0058C8FF0032A5EC00FFFFFF00FFFF
      FF00FFFFFF00BBE9FF006CCFFF000C87DE00FFFFFF00FFFFFF00787676005957
      57005A5757005A58580055545800AAA69300C4B36000EEEAD500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EAE5CC00C3B263009F9B8D004F4E520057555500C5C4
      C400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FCFCFC00C2643800CB724000D3814A00D5803900E1A05E00E7AF6B00EDBD
      7800FDF9EF00F6D19400F9D79900FFFDFA00FAD99D00F8D49600F5CC8C00F0C3
      8000EBB77400FFFDFC00DE9C5C00D9956700FEFCFB00CC704000B14C2400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E4A20000E4A20000FFFFFF00EAB02000E7A50000E7A50000E7A5
      0000E7A50000E7A50000FFFFFF00E4A20000E4A20000E4A20000E4A20000E4A2
      0000E4A20000E4A20000E4A20000E4A20000E4A20000E4A20000E4A20000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFC
      F900FDC65D00FECD7000FECD6F00FED99000DDC59100597FA6004F749900567A
      9E005C7FA2006587AA0098B2CE00FEE7BA00FEE3AF00FEDFA300FCDFA500FFFF
      FF00FFFFFF007CD3FF004ECAFF0041C0FF0044C2FF000A81D900FFFFFF00FFFF
      FF00FFFFFF00EAF7FF0059C9FF0042AAEC00FFFFFF00FFFFFF00EFEFEF00B4B3
      B300747272005C5959005C5A5E00B8B19100CABC7400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FEFEFE00CABB7000B1AB91004F4E530059575700EEEE
      EE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00AA452200C2643800C76B3D00C8662900D6894C00DD9B5800E4AB6400E7AA
      5700F2D08F00F3C98800F6CF8E00F6CB8500F6D09000F5CC8C00F1C78300EEBD
      7800E8B16C00EABD7C00F5E0CD00DEA67D00EBCFC100D0784300BC5E3600E9E9
      E800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E7A50000E7A50000FFFFFF00FFFBF100F0B71200F0B71200F0B7
      1200F0B71200F1BC2000FFFFFF00E7A50000E7A50000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8E4B000E7A50000E7A50000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FEE1A500FFD17B00FED88D00234464003A608500395C7E003352
      71003E5E7E004F7193005C7DA000FEDFA400FEDD9C00FFF8EB00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0053CDFF0031BBFF0030BBFF001F9EEC00E2F2FD00FFFF
      FF00FFFFFF0036ADF20011AAFA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E4E4E4005F5C5C005E5C6000B9B29100CABC7500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CABB7200B2AC910052505600565354007B79
      7900C2C1C100F8F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B4572E00BB5D3600C3663900DAA17F00D2834900DA945300E1A65F00F3DC
      BC00EBB86B00F0C57D00F2CA8300F3CC8800F0C98000F1C88000EEC17900EAB9
      6F00E4AD6400DDA05B00E8BD9E00CA713B00BF623800DC925A00BB5C32009A3E
      1B00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E9A80000E9A80000FFFFFF00FFFFFF00FFFCF300E2A62000DD99
      0000F5DCA300FFFFFF00FFFFFF00E9A80000E9A80000F9E5B000FAEAC000FAEA
      C000FAEAC000FAEAC000FAEAC000FAEAC000EEB93000E9A80000E9A80000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFD480001B3C5D00203D5A003B5F8100527B
      A200477198004C759B0050789D00D8DEE100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B9E8FF007FDFFF0035BFFF0020B5FF00169BEB000A82
      DA001A9CEB0016B2FF008CCDF500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00CDCCCC00626060005B595D00AFAA9600C3B25E00F1EDDC00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EDE9D400C2B36200A5A1910054525600575555005654
      54005452520084838300FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B5B
      4900B2552F00B85B3200BE623600F8EFE900CF7A4400D68A4C00DFA16200E4A9
      5D00E9BA6900EDC27100EFC77700F0CA7A00FFFFFF00F4E5DB00EBBE6D00E7B6
      6600E1A65B00FEFEFD00ECB87100CA733F00DBAD9A00F6EEE900B6573100A94D
      2A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00ECAB0000ECAB0000FFFFFF00FFFFFF00EBB12000E7A50000E7A5
      0000E7A50000FFFFFF00FFFFFF00ECAB0000ECAB0000ECAB0000ECAB0000ECAB
      0000ECAB0000ECAB0000ECAB0000ECAB0000ECAB0000ECAB0000ECAB0000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00173450005A80A600446F97004771
      98004F789D00587FA3005E84A8006287AB00E8EDF300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00DCF4FF0029BBFF007FDFFF008EE5FF005BD0
      FF0001A4FA00C0E4FA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6F6F600AEAC
      AC0064616100615F5F00605E5F00827F7D00C5BA8B00C8B86A00F0ECDA00FFFF
      FE00FEFEFE00EFEBD700C6B76700C3B98D007471710059575800595656005755
      5500565353008C8B8B00FFFFFF00BEBEBE00BCBBBB00ECECEC00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008D31
      1500AD512D00B5582F00B95C3500FDF9F700CA723E00D3804600F4DCC900E7B2
      6A00E6AD5F00EABA6600ECC26900EBC98100FFFFFF00FFFFFF00FEFDFC00FCF7
      F200FFFFFF00FDFBFA00FEFDFB00E8C5B200E3C2B500ECD9CF00CA846600A03D
      1900E4E3E200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EEAE0100EEAE0100FFFFFF00FFFFFF00EEB10600EEB10600EEB1
      0600EEB10600FFFFFF00FFFFFF00EEAE0100EEAE0100FAE6B100FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFBF100F2BE3100EEAE0100EEAE0100FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00567DA200416C950048729900547B
      A1005F85A900688CB0006E93B6006F93B7006E93B600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C4C3C3006260
      6000636160006461610064616100605E61009B978F00C7BD8E00C5B56500CABB
      7300CABB7200C6B66500C6BD9100918E89005A585A005C595900626161005C59
      590057545400CFCECE00F7F7F7005755550057545400B0AFAF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00913B
      1D00A64A2700AE532C00B6593100FCF7F600C6693900C9652500D57C3F00EABF
      6000FBF2E900F3D7B300E6A24600EBB06000F8F2F600FCFBFB00E6A15400E091
      4800D4732800D37C4300C96B3B00B9562F00CE997D00F0DBD300E1A67E00DCBD
      B10090766C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EFB10700EFB10700FFFFFF00FFFFFF00FBEAB900F1BC1C00F1BC
      1C00F1BC1C00FFFFFF00FFFFFF00EFB10700EFB10700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBE7B300EFB10700EFB10700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C5D2DF004872990049739900567DA2006388
      AC006F94B700789BBE007C9FC2007DA0C3007C9FC200E9F0F400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F0F0F0007370
      7000656262006563620066636300666363006260630083817E00B2AD9900BAB2
      9000B9B19000B0AC98007C7A78005C5A5D005F5D5C00AEACAC00CCCBCB009998
      9800BAB9B900EDECEC00A4A2A1005A54510059545200A3A1A100FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008A38
      1D009C452400A84C2900B1542E00F4E3DC00C3683B00FFFFFF00F6E8E000EFC5
      6400E18A4B00E6925000E99A5300EB9D5500EA9C5300E5843300E38C4A00FFFF
      FF00D87C4200CE703D00C6663600CF784000B4562D00A53E1400B75C31009942
      23007C423300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EFB40C00EFB40C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EFB40C00EFB40C00EFB40C00EFB40C00EFB4
      0C00EFB40C00EFB40C00EFB40C00EFB40C00EFB40C00EFB40C00EFB40C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CACACA0050667C004A739A00567DA200648AAE007396
      B9007EA1C40086A8CB008BACCF008CAED0008BACCF00A6C0D800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BEBD
      BD0073706F009D9B9B00D2D1D100A4A2A2006866650065636400615F64006463
      6700626164005E5D6100615E5F00615E5E0062606000D6D6D6007C7979005C5A
      5A0084838300726C680074757900828D9A007E838A006C666100ACAAAA00E8E7
      E700C4C3C300E3E3E300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007F32
      1800923E2100A0482600AC522A00FFFFFF00D3A38500FDFBF900D06D3C00ECB2
      6000E1814900E78B4E00EB905300ED935500EC925400E98E5100FFFFFF00F0EB
      E000D5723F00CC693800C4633500E1944F00AB4B2000A1431E00964122008E3C
      1E0062251700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F0B71100F0B71100F0B71100F0B71100F0B71100F0B71100F0B7
      1100F0B71100F0B71100F0B71100F0B71100F0B71100F0B71100F0B71100F0B7
      1100F0B71100F0B71100F0B71100F0B71100F0B71100F0B71100F0B71100FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00333333006187AB00537BA0006288AC007296B90080A2
      C5008BACCF0093B4D60098B8DA0099B9DB0098B8DA0093B4D600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFE
      FE00F2F2F200FFFFFF00FFFFFF00EFEEEE006E6B6A0068656500676565006663
      6300666362006562610063616000625F5F00615E5E00908E8E006D6B6B005C59
      5900625B57008BA1B80069ABEC0064AFF90065ADF30087A8C9006C686700605D
      5C005A57570087858500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007028
      130087371B0089260D00E9D5CE00AB4F2800BE603800C6663B00D16D4000EBA4
      5E00E37D4E00EA845300EE865400F08A5700F0895600EC885500FFFFFF00FFFF
      FF00D7724400CD6A3C00C25F3400D67940009F3814009E4524008B3C1F008033
      1A0094736800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F1B91700F1B91700F1B91700F1B91700F1B91700F1B91700F1B9
      1700F1B91700F1B91700F1B91700F1B91700F1B91700F1B91700F1B91700F1B9
      1700F1B91700F1B91700F1B91700F1B91700F1B91700F1B91700F1B91700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF006E6E6E00333333005F85A9005D83A7006D92B5007C9FC2008AAC
      CE0095B6D8009DBDDF00A9C5E500ABC8E600A6C3E4009DBDDF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00D5D4D4006A6867006A686700696766008381
      8000E0DFDF00C2C1C1006562620063616100625F5F0075737300D7D6D6006A63
      5F008494A4005CADFD00B6DBFE00EDF6FE00D0E7FE005FB2FF008AA6C3006159
      54005B5959007C797900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005917
      0700B08170007D220C009B422300C2957E00FFFDFD00DABFA700D36C4400F3B7
      8A00EC9F8100F3A98C00F6AE9200F8B29500F7B19400F5AC8F00FDFBF800F6E8
      DC00DC7F5B00CE6B4400CE6E4300C0623800BD7E6400943D1F0083341A006D28
      1400C6C2C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F1BC1C00F1BC1C00F1BC1C00F1BC1C00F1BC1C00F1BC1C00F5CD
      5500FCEFC700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFCF200FAE7
      AB00F1BC1C00F1BC1C00F1BC1C00F1BC1C00F1BC1C00F1BC1C00F1BC1C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0033333300333333006B90B300668BAE007498BB0084A6C90092B3
      D500A7C4E200B9D1EB00B8D2EE00B5D0EE00B0CDEB00A7C5E600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C1C0C0006D6A69006C6969006B686700C5C4
      C400FFFFFF00FFFFFF00A19F9F006462610076737300BFBDBD00FCFCFC007A74
      6F0078A5D10095CBFF00FFFFFF00FFFFFF00FFFFFF00BEDFFE006AAAE9007372
      750094919000F1F1F100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006134
      2500692411007D2F1A0083251000FBF7F400FCFBF800FFFEFE00E09E8700F9CC
      AD00F8E4DB00FFFDFD00FACFC100FAC0AD00FAC1AE00F7BEA900F3AD9500EDAA
      9300FFFFFF00D88B7000C5654300AE513100F8F3F10087341B0074291400591D
      0D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F2BF2200F2BF2200F2BF2200F2BF2200F2BF2200FBE8AD00F5E0
      B000DB970000DB970000DB970000DB970000DB970000DB970000DB970000E0A5
      2000FFFFFF00F2BF2200F2BF2200F2BF2200F2BF2200F2BF2200F2BF2200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF003333330033333300353637003A3E4200799CBF0089ABCD00A0BD
      DD00BED4EC00BFD7F000C0D8F300BDD7F400B8D3F100AECCEC00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F1F0F000BDBCBC009290900086848300F5F5
      F500FFFFFF00FFFFFF00F5F5F500C1C0C000F3F3F300FFFFFF00E2E2E200746D
      690076A9DB00ADD6FF00FFFFFF00FFFFFF00FFFFFF00D5EAFE0065ACF000777A
      7F00D2D1D000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9F9
      F900743C2E007838230083361F00C6AA9B00FAF6F600FBFBFA00DAA18E00F5C2
      AA00EDBFB000F2C9BC00F6CFC300F7CABB00FFFFFF00F0BFAE00F0C0B200EABA
      AA00E1AD9C00F7E0D700C4806B00A3553D009B543D00792F1A00631F0F003C0A
      0200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFCF300F2C22700F2C22700F2C22700F2C22700F2C22700FFFFFF00E19E
      0000E19E0000E19E0000E19E0000E19E0000E19E0000E19E0000E19E0000E19E
      0000E5AB2000FBE9AF00F2C22700F2C22700F2C22700F2C22700F2C22700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00333333003333330033333300464A4F007B9EC1008CAED000C1D5
      EA00C3D8EF00C5DAF300C5DCF700C5DCF800BDD8F500A6C3E200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFAFA00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C9C8C80074727100655D
      570088A4C20066B5FF00F5FAFF00FFFFFF00FFFFFF0084C3FF007AABDC006F69
      6700D9D8D800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFF
      FF003A0A02005D2112007532200095544100BA7A6800F5EDEB00DAAEA000ECC4
      B700EDCDC400F2D8D000F5DED700F7E1DA00F6E0D900F1D4CC00FFFFFF00E9C8
      BE00DEB5AD00CD9E9000C3908000A15D4700813A27006A29180053190C00B4AB
      A600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCF4E000E7A5
      0000E7A50000E7A50000E7A50000E7A50000E7A50000E7A50000E7A50000E7A5
      0000E7A50000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F6F6F6003333330033333300383838005D5D5D006889AB009BB9D700C4D7
      EB00C6DAF000C7DCF400C9DFF800C9E0FB00C1DBF70086A4C30091919100FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0097959500646161006561
      5F0076787B007FB0E20065B4FF0092C9FF0074BCFF006FAFEE0089929E00645E
      5B007E7C7C00E7E7E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C9C4C2004D190E00662B1D0093625400AB776A00BE8E8100D9B7AD00E2CC
      C400EEDCD500F4E5E000F7EAE700F8EDEA00F8ECE900F6E5E100F2E1DB00EAD2
      CE00E5BEB100D3AFA400C5988C00E8D6D200753927005A211500390D0700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EDAC
      0000EDAC0000EDAC0000EDAC0000FAE5B000F0BC3000EDAC0000EDAC0000EDAC
      0000FAE5B000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF003333330038383800414141007A7A7A00586F86006E8CAA008EA7
      C100C5D9EE00C9DDF300C9DEF600C7DEF700BED6F20055636F004E4E4E00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DFDFDF0088868600A7A6
      A600938F8D007B7A7C008CA6C0007AA6D00084A5C6007F858C00665F5B006461
      610063606000C0BEBE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0031090600552217008D605600A9807600BD978E00FCFBFA00E7D5
      D000F0E4E100F6EEEC00F9F4F200FBF6F500FBF6F400F8EFEC00F4EAE700FAE1
      DC00DEC8C200DAC4BC00BB989100BD998D009A6B5C0048181000F2F2F200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEF6E100EFB30A00EFB30A00FFFFFF00FBE8B400EFB30A00EFB30A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00353535003F3F3F004A4A4A00575757009A9A9A00848484006C70
      740060758A0059789600587897005F748900656768007A7A7A0064646400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFEFE00ABA9A8006A625C006E666000776F6A00ACA9A800DBDBDB009D9C
      9B0098969600FBFBFB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF003A110C0063342A00A17D7400BC9E9700D5C0BA00E9DE
      DA00F4E9E700F8F3F200FCF9F800FDFBFB00FDFBFA00FAF7F600F9F0ED00EEE2
      DF00E0CECA00D2BAB100DDC8C000A37267005425190072595100FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F0B91600F0B91600F0B91600F0B91600F0B91600F6D46E00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF003A3A3A0045454500505050005B5B5B0065656500A6A6A600BCBC
      BC00C3C3C300C3C3C300C3C3C300C3C3C300B3B3B300BCBCBC00C9C9C900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00DFDEDE006967660069666600BAB9B800FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0040181000997B7000D4BAB100CEB9B300DFD1
      CD00F2E4E100F8F4F200FCFAFA00FEFEFE00FEFDFD00FBF8F700F5EFED00EBE0
      DD00DBC9C400CDB5AE00C9ACA2005924190059372D00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FDF4D600F2BF2200F2BF2200F2BF2200F3C43000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00D3D3D3004949490054545400606060006B6B6B00767676008484
      8400949494009F9F9F00A4A4A400A7A7A700ADADAD0077777700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EBEAEA008B8989007F7D7C00E2E2E200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003F120D00BB9F9800C1ABA400D9C8
      C300E9DEDA00F4EEEC00FBF7F700FEFCFC00FDFBFA00F8F5F300F3ECE900E2D6
      D200CFBCB600CEB4AB0055241A00A59C9800FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C9C9C90056565600626262006D6D6D00797979008585
      850095959500A5A5A500A3A3A300A2A2A20089898900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C8C1BD00501F1500CFBA
      B300DDCECA00EBE1DE00F4EEEB00F7F3F100F6F1EF00F1E9E600E8DDD900D5C3
      BF00B99F970045170C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C1C1C1006C6C6C00777777008181
      81008A8A8A008F8F8F0091919100EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFE00ECEB
      EA00572719006C342200B6948700D8C2B800CDB3A900976C5E004C170F00957C
      7100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFBFE00BCBA
      EE007E7ADE004E4AD100302BCA00211BC600211BC600302BCA004E4AD1007E7A
      DE00BCBAEE00FAFAFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6F5F500E6E3E200D0CC
      CB00BEB9B800B0ABA900A9A5A3009B9695008B8685007F7A79007C7776009B96
      9500C1BDBC00E6E3E200FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAEAFA008B88E1001C17C4001B1E
      BF001B25BB001A2BB8001A2FB5001A30B4001A30B4001A2FB5001A2BB8001B25
      BB001B1EBF001C17C4008B88E100EAEAFA00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FBFAFA00EFEEED00D8D4D300C0BBBA00B1ADAB00AED5EB005C5D
      5D00B6B1B000B2ADAB00708390009E9A9800D6D6D600B3B3B300D0D0D0007E7E
      7E007D7D7D00C1BDBB00E3E0DF00FEFEFD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFD
      FD00F6F6F600F0F0F000EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F0F0F000F2F2
      F200FBFBFB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008E8BE2001C18C3001B24BD001B2FB8001B31
      B7001B32B8001B32B8001B32B8001B32B8001B32B8001B32B8001B32B8001B32
      B8001B31B7001B2FB8001B24BD001C18C3008E8BE200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00F5F3
      F300E3E0DF00C1BDBB00A9A4A3009E9997009C989600A6A1A00090B8CF003A3D
      3E00ABACAA0087868600A2C0D200FFFFFF00956D4000764D2000D2D2D2007676
      76006D6D6D009E999800CCC7C700ECEAE900FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFCFC00DBDB
      DB00949494007575750071717100717171007171710071717100717171007171
      7100717171007171710071717100717171007171710071717100717171007171
      7100717171007171710071717100717171007171710071717100727272007F7F
      7F00B8B8B800F3F3F300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00D7D6F5007A76DD001C20C1001B30BC001B32BB001B33BC001B33
      BC001B33BC001B33BC001B33BD001B33BD001B33BD001B33BD001B33BC001B33
      BC001B33BC001B33BC001B32BB001B30BC001C20C1007A76DD00D7D6F500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F6F5F400E7E4E300D5D1D000C5C0C000ADA9
      A700918D8B00817C7B006B757D00B2B0AF00CFCECE009EC4DB009CBFD4009ABE
      D300A3C2D600A9C6D700728DA000FFFFFF0068411100764C1E00C5C5C5007070
      70006E6E6E00EDEBEA00FCFCFB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EBEBEB008585
      8500FDF8E700E2CEA000E2CEA000E2CEA000E2CEA000E2CEA000E2CEA000E2CE
      A000E2CEA000E2CEA000E2CEA000E2CEA000E2CEA000E2CEA000E2CEA000E2CE
      A000E2CEA000E2CEA000E2CEA000E2CEA000E2CEA000E2CEA000E2CEA000E3D1
      AC00F8F5F000BCBCBC00FBFBFB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C3C1F0001C17C4001C28C0001C34BE001C35BF001C35BF001C35BF001C35
      C0001C35C0001D35C1001D35C1002B41C4002B42C4001E36C1001D35C1001C35
      C0001C35C0001C35BF001C35BF001C35BF001C34BE001C28C0001C17C400C3C1
      F000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8F7
      F700E6E3E200D1CDCC00CCC8C700C1BCBB00A8A3A2009B9695008E888700ABA7
      A700D3D3D300CFCFCF0086B3D00047728A009EC1D700A0C2D70057849E00587B
      960048718C009DC1D800ACC8D900AECADA00514936007D9EB1005F7D8E007171
      71006C6D6D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080C0C0008080A00080E0E00040A0E0000040
      6000402040004040600040606000F0FBFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D7D7D700E3D1
      AD00B78E4300D4B56B00C8A55A00C8A55A00C8A55A00C8A55A00C8A55A00C8A5
      5A00C8A55A00C8A55A00C8A55A00C8A55A00C8A55A00C8A55A00C8A55A00C8A5
      5A00C8A55A00C8A55A00C8A55A00C8A55A00C8A55A00C8A55A00C8A55A00F2DD
      9800D5B97D0087878700F3F3F300FFFFFF00FFFFFF00FFFFFF00FFFFFF00D9D8
      F6001C17C4001C2AC3001C34C2001C35C3001C35C3001C35C4001C35C400364B
      CB008692DC00C5CAEA00EDEDF300F5F5F500F5F5F500EFF0F400C8CDEB008F9A
      DE003C51CC001C35C4001C35C4001C35C3001C35C3001C34C2001C2AC3001C17
      C400D9D8F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00F3F2F100DBD7D700B3AE
      AD0097929100938D8C0099959400B6B4B400D3D3D300D0CFCF00CED0D200D9CD
      C200A4672000B1773200897F690095BDD500608EAA005F90AD00683B0900A96B
      2300A46D2C00B3783500B5772F00ABC6D800B2CBDA00A8C1D40077A8C5006565
      650064646400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0C0C000000000004080A0000080C00040C0E00000A0E0004080
      E0000020600000000000406060008080800040404000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DDDDDD00B68D
      4200D7B35400C69B3600DCB64800DCB64800DCB64800DCB64800DCB64800DCB6
      4800DCB64800DCB64800DCB64800DCB64800DCB64800DCB64800DCB64800DCB6
      4800DCB64800DCB64800DCB64800DCB64800DCB64800DCB64800DCB64800A979
      2000B68A3700947D5900F3F3F300FFFFFF00FFFFFF00FFFFFF00FFFFFF007A76
      DD001D28C5001D35C5001D35C5001D36C6001D36C7002B42CB00959FE200EDEE
      F300F5F5F500F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F5F5
      F500F3F4F500A5AEE5003046CC001D36C7001D36C6001D35C5001D35C5001D28
      C5007A76DD00FFFFFF00FFFFFF00FFFFFF00F8F7F700E1DEDD00BCB7B600B3B2
      B200C4C4C400C6C6C600506D7F00BEB4A600995E1900B6762D00F3972B00FFA9
      2F00B3763100B86F210094BDD400497B98005993B9007F4E1300D1842A00E092
      3900F4A03D00D38E3C00D08C3F0085A2B100C1D5E300427B9C006C6A6A006060
      60005C5C5C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0DCC0000000
      000000000000000000004060800040E0E0000080C00040C0E00000A0E0000080
      E000002080008060A00040204000404040008060600040606000F0FBFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EEEEEE009965
      130099651300EEC32B00EFC42B00EFC42B00EFC42B00EFC42B00EFC42B00EFC4
      2B00EFC42B00EFC42B00EFC42B00EFC42B00EFC42B00EFC42B00EFC42B00EFC4
      2B00EFC42B00EFC42B00EFC42B00EFC42B00EFC42B00EFC42B00EFC42B00EFC4
      2B00A47119009B773F00F9F9F900FFFFFF00FFFFFF00FFFFFF008E8BE2001F23
      C6001D36C9001D36C9001D37CA001D37CB004257D400DADDF100F5F5F500F6F6
      F600F7F7F700F7F7F700F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F7F7
      F700F6F6F600F5F5F500E1E3F1004C60D5001D37CB001D37CA001D36C9001D36
      C9001F23C6008D8AE200FFFFFF00FFFFFF00FFFFFF00C9C4C300C2C4C600C4A7
      8600BC721D00A86C260082B1CC005E60530090C3E400566F8400CA7B1E00F798
      2800C97E2D009CC0D7009CB4C200537D9600663E1200885B2600BA7F3A00C888
      3C00956B3B00D08C3E00D28E4000B27D4100B9D0DF004D86A80098918D006161
      61005E5E5E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F0FBFF00000000004040400080404000F0CA
      A600C0808000400020000060800040E0E0000080E00040C0E0000080E0000080
      E000002060008060800040208000000000004040400080808000C0C0C000A4A0
      A000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8F8F8009965
      1300EABF2A00EBBF2A00EBBF2A00EBC02A00EBC02A00ECC02A00ECC02A00ECC1
      2A00ECC12A00ECC12A00EDC12A00EDC22A00EDC22A00EDC22A00EDC22B00EEC2
      2B00EEC32B00EEC32B00EEC32B00EEC32B00EFC42B00EFC42B00EFC42B00EFC4
      2B00EFC42B0099651300FCFCFC00FFFFFF00FFFFFF00EBEAFA001F1BC5001E34
      CB001E37CD001E38CE001E38CF004358D700E4E6F300F5F5F500F7F7F700F7F7
      F700F8F8F800F9F9F900F9F9F900F9F9FA00F9F9FA00F9F9F900F9F9F900F8F8
      F800F8F8F800F7F7F700F6F6F600ECEDF3004D61D8001E38CF001E38CE001E37
      CD001E34CB001F1BC500EBEAFA00FFFFFF00FFFFFF00CDC9C700C8B7A100D178
      12005168750087B3CD0074B3D90052A4D40097BED7002B3B44009E530000E990
      2600A7C9DE009EC1D800446A7E005B380F00744B1D00AD763800BE823C00CA89
      3D00E8993F00D48F3E00DA934100D2904100C4DBEC004E7082005D9FC3006666
      66005E5E5E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F0FBFF0040002000C0C0C00080404000C0A0
      A000C0808000400000000060600040E0E0000080E00040C0E00000A0E0000080
      E0000020600080608000400080000020400040606000A4A0A000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00E7BB
      2900E7BB2900E7BB2900E7BB2900E7BC2900E8BC2900E8BC2900E8BC2900E8BC
      2900E8BD2900E9BD2900E9BD2900E9BD2900E9BE2900E9BE2900EABE2A00EABE
      2A00EABF2A00EABF2A00EBBF2A00EBBF2A00EBC02A00EBC02A00EBC02A00ECC0
      2A00ECC02A00AD7C1800FEFEFE00FFFFFF00FFFFFF008B88E100212ACB001E38
      D0001E39D2001E39D3002942D600D7DBF200F5F5F500F7F7F700F8F8F800F9F9
      F900E5E7F400808CD5003C4FC1001F35B8001F34B800384BC0007986D300E0E3
      F200F9F9F900F8F8F800F7F7F700F6F6F600E0E3F2003149D7001E39D3001E39
      D2001E38D000212ACB008D8AE200FFFFFF00FFFFFF00CDC9C700C9B296009483
      6300E6EFF4006297B7006940130084551E009461280096BDD600D1DCE1009370
      4000AFD1EA007B8F9E004A677C005B39100092642E00B77D3B00D38E3B00CC8B
      3D00BE833D00D18E3F00CB8B4100D1904200B6D4EC00C3D6E300CBDCE700DBE7
      F00056555500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F0FBFF0040002000C0C0C00080404000C0A0
      A000C0806000402000000060600040E0E0000080C00040C0E00000A0E0004080
      E00000206000806080004000A0000020400080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C293
      1E00E3B72800E3B72800E3B72800E4B72800E4B82800E4B82800E4B82800E4B8
      2800E5B92800E5B92800E5B92800E5B92800E6BA2800E6BA2800E6BA2800E6BA
      2900E6BA2900E7BB2900E7BB2900E7BB2900E7BB2900E7BC2900E8BC2900E8BC
      2900E8BC2900A3701500FFFFFF00FFFFFF00FAFAFE001E18C5001F37D3001F3A
      D5001F3BD6001F3BD70098A4EC00F5F5F500F6F6F600F8F8F800F9F9F900ACB4
      E500243BC0001C34BE001C34BE001C34BE001C34BE001C34BE001C34BE00243B
      C000A4ADE300F9F9F900F8F8F800F7F7F700F5F5F500A5AFEA001F3BD7001F3B
      D6001F3AD5001F37D3001E18C500FAFAFE00FFFFFF00CBC7C600C9AB8C00A4C6
      DD004C82A5007346130095612400A46C2C00AC722E009F6C2F00516C7C00A364
      1B00ABCBDF005664720077491600774C1B00B0783800B47D3C00BF833E00CB8A
      3F00DB923F00FBAD4300FAAC4500FFAD4600AFCDE300B1C6D4002C5871003E61
      74005F5F5F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0040002000F0CAA60080404000C0A0
      A00080808000000000000060800040E0E0000080C00000E0E00000A0E0000040
      C00000206000804080004000A00000000000F0FBFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0A3
      7500DFB32700E0B32700F7ECC900F7ECC900F7ECC900F7ECC900F7ECC900F7EC
      C900F7ECC900F7ECC900F7ECC900F7ECC900F7ECC900F7ECC900F7ECC900F7EC
      C900F8ECC900F8EDC900F8EDC900F8EDC900F8EDC900F8EDC900F8EDC900E4B8
      2800E4B82800D1BE9F00FFFFFF00FFFFFF00BCBAEE00292BCC00203AD800203B
      DA00203BDB003049DE00F2F3F900F6F6F600F7F7F700F9F9F900AEB7E8001E37
      C6001D36C6001D36C6001D36C6001D36C6001D36C6001D36C6001D36C6001D36
      C6001D36C600A2ACE500F9F9F900F8F8F800F6F6F600F3F4F5003E55E000203B
      DB00203BDA00203AD800292BCC00BBB9EE00FFFFFF00C9C6C50090B8D3003358
      6E0074460F00975F1F00A86E2C00A0692D00A86F2F00A76F2E009AC4DE00EB85
      1300B1CFE20052596200774C1B008C5B2300BD803B00B07B3B00BB813D00F5A5
      4000E5A04300D18F4300D0974300D5924400DCF0FF007092AB00FFFFFF006D6D
      6D005F5E5E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F0FBFF0040002000F0CAA60080406000C0A0
      C000C0808000402040004080A00040E0E00000A0E00000C0E00040E0E0000040
      C000002060008060A0004000800000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFB
      FB00DCAF2600DCAF2600DCAF2600DCAF2600DCAF2600DDB02600DDB02600DDB0
      2600DDB02600DDB12600DEB12600DEB12600DEB12600DEB22600DFB22600DFB2
      2600DFB22700DFB22700DFB32700E0B32700E0B32700E0B32700E0B42700E0B4
      2700E1B42700F9F9F900FFFFFF00FFFFFF007E7ADE002A36D300203CDD00203D
      DE00203DDF007688EA00F7F7F700F7F7F700F8F8F800EAECF7002942D0001E38
      CE001E38CF001E38CF001E39D0002740D2002741D2001E39D0001E38CF001E38
      CF001E38CE00253ECF00E5E7F600F8F8F800F7F7F700F5F5F5008F9DEA00203D
      DF00203DDE00203CDD002A36D4007D79DD00FFFFFF00C9C8C7008EB6D0005774
      8F007E4C1200B1722900AE722D00A9712C00A9713000A9713100ADCCE000C1DC
      ED00BAD4E6005B5D65004D32120092602500CF8B3D00EA983E00FFAB4200FFAB
      4200EA9D4300E1984300E0984600AF7D4400CCDDE800EFF3F600F3F3F3006C6C
      6C005E5E5E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F0FBFF0040002000C0A0C00080404000C0A0
      C000C08080004060600080E0E00000C0E00000C0E00000C0E00000E0E0000040
      E00000208000404080004020800000000000F0FBFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFE
      FE00D8AA2500D8AB2500D8AB2500D8AB2500D9AB2500D9AC2500D9AC2500D9AC
      2500DAAC2500DAAD2500DAAD2500DAAD2500DAAD2500DBAD2500DBAE2500DBAE
      2500DBAE2500DBAE2600DCAF2600DCAF2600DCAF2600DCAF2600DCB02600DDB0
      2600DDB02600FCFCFC00FFFFFF00FFFFFF00504BD2002539DA00213DE100213E
      E200213EE300BAC3F500F7F7F700F7F7F700F9F9F900919EE9001F3AD6001F3A
      D6001F3AD7002843D900AAB4ED00F2F2F500F3F4F500B5BEED00304ADA001F3A
      D7001F3AD6001F3AD6008694E700F9F9F900F7F7F700F6F6F600CAD0F200213E
      E300213EE200213DE1002539DA00504BD200FFFFFF00CDCCCB00A9CCE1008262
      3C008B551800BB792C00AD722C00A8712F00A972310095622A0077A8C6004882
      A500B6D3E5002C2F30007D4B10008F5E2700FFB13E00FFAD4100C3863F00C286
      4000C7894300A5784200AD7C4500AB773E00D9E6F000FFFFFF00A5A5A5006868
      680060606000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C0A0A00080606000C0A0A00080606000C0A0
      A000C0A0A0000040600040E0E00000E0E00000C0E00000E0E00000C0E0000060
      E0004080E000002060004020800000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00A06D1500D4A72400D5A72400EAD39100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5E9C800F5E9C800F5EA
      C800F5EAC800F5EAC800F5EAC800F5EAC800F5EAC800F5EAC800D9AB2500D9AC
      2500D5A72300FEFEFE00FFFFFF00FFFFFF002F2AC900223DE100213EE500213F
      E600213FE700E4E7FA00F6F6F600F8F8F800F9F9F9004960E400213DDF00213D
      E000213EE100A5B1F100F5F5F500F5F5F500F5F5F500F5F5F500B7BFEF00213E
      E100213DE000213DDF00415AE300F9F9F900F8F8F800F6F6F600EEEFF5002340
      E700213FE600213EE500223DE1002F2AC900FFFFFF003E7091009DC4DD00764F
      2000784C1800885C2A0093632C00A26D2F008D612F00A8B0AD004D667A008E5C
      2200BDD7E800363A3D00794B1800B8732400B27A3C00C1853E00EB9C4200BB82
      4200B6814200BB844300B4814600DCEFFE00E2EBF400E2EDF500255E7E006666
      660060606000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000C0C0C000C0A0A000C0A0A000C0A0
      8000C0A0A0000040600040E0E00000E0E00000C0E00000C0E00000C0E0000060
      E0004080E000002060008020A00000204000A4A0A000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00EAE4DA00D1A22300D1A32300D1A32300D1A32300D1A32300D2A42300D2A4
      2300D2A42300D2A42300D3A52300D3A52300D3A52300D3A52300D3A52300D4A6
      2300D4A62300D4A62300D4A62400D4A72400D5A72400D5A72400D5A72400D5A8
      2400A06D1500FFFFFF00FFFFFF00FFFFFF00221CC6002440E700223FE8002240
      EA002240EB00F7F8FC00F6F6F600F8F8F800FAFAFA002A45E800223FE800223F
      E800223FE900F1F2FB00F6F6F600F5F5F500F5F5F500F5F5F500F3F4F5002C48
      EA00223FE800223FE8002744E800F9F9FA00F8F8F800F6F6F600F5F5F5002E4B
      EC002240EA00223FE8002440E700221CC600FFFFFF00D0D3D300A7C7DC003641
      49008C561700BD7B2C00A06B2D00BD7B3000C1803200B5D1E5009CCEEC002659
      7C00BFD8E7004E697A00885E2C007C4F1B00CF883A009F723E00AC7A4000A878
      4100B8824400D5934600B67A3400DCE8F0005C7D9000877D6700909DA7007878
      780068686800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0040000000C0A0A000C0A0A000C0A0A000C0A0
      A000C0A0A0000040600040E0E00000E0E00000C0E00000C0E00000C0E0000060
      E0004080E000002060004020A0004020800000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FBFBFB00CD9E2100CD9F2200CD9F2200CE9F2200CE9F2200CE9F2200CEA0
      2200CEA02200CFA02200CFA02200CFA12200CFA12200CFA12200D0A12200D0A2
      2200D0A22200D0A22200D0A22200D1A22300D1A32300D1A32300D1A32300D2A3
      2300D1BE9F00FFFFFF00FFFFFF00FFFFFF00221CC6002D47E8002642E8002643
      EA002643EB00F0F2FB00F7F7F700F8F8F800F9F9F9003F59EA002A46E8002A46
      E9002A46EA00EEF0FB00F8F8F800F5F5F500F5F5F500F5F5F500F3F3F500324D
      EB002A46E9002A46E8003B54E900F9F9FA00F8F8F800F6F6F600F5F5F500324D
      EC002643EA002642E8002D47E800221CC600FFFFFF00D2D6D6009DC0D8002A2C
      2E0078491300A56A2600B5762F00AF743000B8D9F00045759100734B1C006B47
      1D00C2DAE900BFD7E80036383A007E4C13007D562A00AC793F00AE7B4200AB7B
      43008F6C44009F6D3700D9E7F00092B9D1005F9FC4005B3D1B008D8E9000A8A8
      A8007D7D7D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000C0A0A000C0A0A000C0A0A000C0A0
      A000C0A0A0000040600040E0E00000E0E00040C0E00040E0E00080E0E0000060
      E0004080E000002060004020A0004020800000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFEFE00C0901E00C99A2000CA9B2100CA9B2100CA9B2100CA9B2100CA9C
      2100CB9C2100CB9C2100CB9C2100CB9D2100CB9D2100CC9D2100CC9D2100CC9D
      2100CC9E2100CD9E2100CD9E2100CD9E2100CD9F2200CD9F2200CE9F2200CE9F
      2200F9F9F900FFFFFF00FFFFFF00FFFFFF002F2AC9003A52E7002945E9002946
      EB002946EC00DCE0FA00F8F8F800F8F8F800F9F9F900788BF000314DE800324D
      E900324DEA00A2AEF400FCFCFC00F8F8F800F6F6F600F5F5F500B1BBF300324D
      EA00324DE900314DE8006F82EE00F9F9F900F8F8F800F6F6F600ECEDF5002946
      EC002946EB002945E9003951E7002F2AC900FFFFFF00D9D8D600527B9400A0C3
      D9002A4C60005C350C0079532600BED6E700C1DCEC00573F25006C441600C8EA
      FF00CFE0E900C8DEEB00D6E8F50031333800613F190075553100A1744000A879
      42007B7D7200DAE7F1009AB6C7004A8CB30062441F004C351900CCCDCD00CACA
      CA008C8C8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000C0A0A000C0A0A000C0A0A000C0A0
      A000C0A0A0000060600040E0E00000C0E00080E0E00080E0E000F0FBFF0040A0
      E00040A0E000002060004020A0004000800000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A97F3C00C6961F00C6972000C6972000C6972000C6972000C797
      2000C7982000C7982000C7982000C8982000C8992000C8992000C8992000C899
      2000C99A2000C99A2000C99A2000C99A2000C99A2100CA9B2100CA9B2100CA9B
      2100FCFCFC00FFFFFF00FFFFFF00FFFFFF00514CD2004555E3002D48E9002D48
      EA002D49EC00B8C1F700FAFAFA00F7F7F700F9F9F900BEC6F6003E57EA003953
      E9003954EA003F58EB00A6B2F500EFF1FB00F2F3FB00AFB9F600435CEC003954
      EA003953E9003C56E900B7C1F500F9F9F900F7F7F700F6F6F600C8CEF3002D49
      EC002D48EA002D48E9004455E300504BD200FFFFFF00CFD1D30078512400A567
      1E006AA9CE00BDD5E500A5D0E8005590B2005F3203006AA9CF0068482400EE9B
      3900D79F540093653000CBDFEB00D2E3F000E9F5FF008EB6D100C3DEF300D4E3
      EE00E1EDF500A2B8C500E4EEF60069A3C5004A30120061432300E5E7E900D5D5
      D5008F8F8F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0040000000C0C0C000C0A0A000C0A0A000C0A0
      A000C0A0A0004040600080E0E00080E0E00080C0E00080C0E00080A0E00040A0
      E00080C0E000002040004020A0004000800000204000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F9F9F900C2921E00C2921E00C2931F00F0E4C700F0E4C700F0E4
      C700F0E4C700F0E4C700F0E4C700F0E4C700F0E4C700F0E4C700F0E4C700F0E4
      C700F0E4C700F0E4C700F0E5C700F0E5C700F0E5C700C6972000C6972000C394
      1F00FEFEFE00FFFFFF00FFFFFF00FFFFFF007E7ADE004952DC00304CE900304C
      EA00304CEB007B8EF200FCFCFC00F7F7F700F8F8F800F1F3F9007D8EF0004159
      E9004159EA004159EA00415AEB00415AEB00415AEB00415AEB004159EA004159
      EA004159E9007688EF00EFF0F900F8F8F800F7F7F700F5F5F500919FF000304C
      EB00304CEA00304CE9004953DC007D79DD00FFFFFF00C9CBCB00B86D16007F64
      3B0041667C005C3E1D00505F6B006C461A00744C1E009F6C3300D48A3500E695
      3900B1793A00E2943B00AFA28B00B6DCF000DFEAF200D5E5F000D0E2EE00A8D4
      EC004A758B00587380005B6766004885A900704D24006E4F2800E3E4E700DEDE
      DE0092929200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0040000000C0A0A000C0A0A000F0FBFF00FFFF
      FF00FFFFFF00404040004060600080A0A0000020400000204000002040008080
      A000A4A0A000C0A0E000C080E0004020800000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FDFDFD00BE8E1D00BE8E1D00BF8F1D00BF8F1E00BF8F1E00BF8F
      1E00BF8F1E00C0901E00C0901E00C0901E00C0901E00C1911E00C1911E00C191
      1E00C1911E00C1921E00C2921E00C2921E00C2921E00C2921E00C2931F009E6A
      1400FFFFFF00FFFFFF00FFFFFF00FFFFFF00BCBAEE003B3BD1003954E900344F
      EA00344FEB00405AED00F2F3FB00F9F9F900F7F7F700F9F9F900D9DEF7007B8C
      F0004C64EA004860EA004860EB004860EB004860EB004860EB004860EA004C63
      EA007889EF00D3D8F700F9F9F900F7F7F700F6F6F600F0F1F5004B64ED00344F
      EB00344FEA003954E9003B3BD100BCBAEE00FFFFFF00BCBEBE009F5F1400724C
      2300AA6E2700E18E2C007D5931007E572C009C693000D98F39009C6C3700CB88
      3B00A0703A00C4863D00D2E5F4004B758E008E5C26005C3D1900DDE9F200555E
      670063431D005739180088613400957045009E7445008B673F00EDF0F200E7E7
      E70094949400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000C0DCC000F0FBFF00808080008080
      8000806060008060600040404000402040008080A00080808000406080004040
      40008060A0008040C0008040A000C080E00000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00A7751700BB8A1C00BB8A1C00BB8B1D00BB8B1D00BC8B
      1D00BC8B1D00BC8C1D00BC8C1D00BC8C1D00BD8C1D00BD8D1D00BD8D1D00BD8D
      1D00BD8D1D00BE8D1D00BE8E1D00BE8E1D00BE8E1D00BE8E1D00BF8F1E00D1BE
      9F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFAFE001F19C500596CEA003752
      EA003852EB003852EC0099A7F500FCFCFC00F7F7F700F8F8F800F9F9F900DADF
      F70096A4F3007184EE005B71EC005068EA004F67EA005A71EB006F83EE0093A1
      F200D7DCF700F9F9F900F8F8F800F6F6F600F5F5F500A6B2F3003852EC003852
      EB003752EA00596CEA001F19C500FAFAFE00FFFFFF00A2A1A10093560E005E37
      0A00C0B3A500DFE3E70083592900BE7E3100C2833B00A8743A00C88539008F67
      3800AA763C00C2853E00B47D3F00D88F3C00805D34007E5A300098D7FE00545A
      6200795831006A4B2600A67A4800BB874C00A17A4D00B6854F00F7F9FD00F0F0
      F00096969600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C0C0C00080606000F0FBFF00000000000000
      000000000000402020000000000040404000C0DCC000C0C0C000A4A0A0000000
      000000000000002040000020400000204000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CCB59100B7861B00B7861B00B7871B00B8871C00B887
      1C00B8871C00B8871C00B8881C00B9881C00B9881C00B9881C00B9891C00B989
      1C00BA891C00BA891C00BA8A1C00BA8A1C00BB8A1C00BB8A1C00BB8B1C00F9F9
      F900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008D8AE2005155DB00425A
      EA003C55EB003C55EC00415BED00D7DCF900FCFCFC00F8F8F800F8F8F800F9F9
      F900F2F3F900C8CFF600ABB6F5009BA8F3009AA8F300A9B5F400C6CEF600F1F2
      F900F9F9F900F8F8F800F7F7F700F5F5F500D7DCF500465FEE003C55EC003C55
      EB00425AEA005155DB008D8AE200FFFFFF00FFFFFF00FFFFFF0099999A00BCBC
      BC00D0D0D000DBDCDC005E3B120086592600B17B3D00C9893D008D663A00976B
      3B009C6F3A00C3843D00FFC34300B57E40009E723D009C724200A1764400A87A
      470086643F00AC783E009C764B009B754B00A87E4C00A17A4D00F8FBFE00F5F5
      F50096969600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0DCC00040202000A4A0A0008080
      800080808000404040004020200080606000FFFFFF00FFFFFF00C0C0C0000000
      0000404060008060800040404000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FBFBFB00B3821A00B3821A00B4821A00B4831A00B483
      1B00B4831B00B5831B00B5841B00B5841B00B5841B00B5841B00B6851B00B685
      1B00B6851B00B6851B00B6851B00B7861B00B7861B00B7861B00B7861B00FCFC
      FC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EBEAFA00231EC7006A7A
      EB003E58EA003E58EB003F58EC00546BEF00E6E9FA00FCFCFC00F7F7F700F7F7
      F700F8F8F800F9F9F900F9F9F900FAFAFA00FAFAFA00F9F9F900F9F9F900F8F8
      F800F7F7F700F6F6F600F5F5F500E6E8F5005A70EF003F58EC003E58EB003E58
      EA006A7AEB00231EC700EBEAFA00FFFFFF00FFFFFF00FFFFFF00CECECE005A34
      070085664100DADADA004E300C00C67F2C00A2754000A3743D009D6F3C009F70
      3A009E703B00966C3C00B47D3F00BF854200A6784200AC7B450094704600AE7E
      4600A67A48009E764A0099754A00A57B4B00A27A4D00AB804E00F8FCFF00FBFB
      FB0094949400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0040202000C0DCC000C0C0
      C000A4A0A00000000000A4A0A000C0C0C000FFFFFF00C0DCC0008080A0004060
      6000C0C0C000A4A0A00000000000F0FBFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FEFEFE00B07E1900B07E1900B07E1900B07F1900B07F
      1A00B17F1A00B17F1A00B17F1A00B1801A00B1801A00B2801A00B2801A00B281
      1A00B2811A00B2811A00B3811A00B3821A00B3821A00B3821A00B2801A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008E8BE2004344
      D4006276ED00425AEA00425BEB00435BEC00556CEE00D3D9F900FCFCFC00F9F9
      F900F7F7F700F7F7F700F8F8F800F8F8F800F8F8F800F8F8F800F7F7F700F7F7
      F700F6F6F600F5F5F500D9DDF6005C71EF00435BEC00425BEB00425AEA006276
      ED004344D4008E8BE200FFFFFF00FFFFFF00FFFFFF00FFFFFF00D0D0D0007D58
      2E007B4B1200DADADA00412A0D0093643000A67946008F694100986E3D009168
      3C009C6F3D00956C3E00D5914200F8AB4400D18F4500AE7C4500B07F47009C75
      46009D774800A3794B00B1814B00A77D4C00A97F4F009F7A5000FAFCFF00FFFF
      FF0091919100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F0FBFF0040202000FFFFFF00F0FB
      FF00C0C0C00040202000C0C0C000FFFFFF00000000004020200040202000F0FB
      FF00F0FBFF00C0C0C00000000000F0FBFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0099651300AC7A1800AC7A1800AC7A1800AD7B
      1800AD7B1900AD7B1900AD7B1900AD7C1900AE7C1900AE7C1900AE7C1900AE7D
      1900AF7D1900AF7D1900AF7D1900AF7D1900AF7E1900B07E19009B681300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007A76
      DD005E64DF005D72ED00455DEB00455EEC00465EED004C63EE00A0ADF500F3F4
      FB00FCFCFC00FAFAFA00F8F8F800F7F7F700F6F6F600F6F6F600F7F7F700F7F7
      F700F3F4F900A9B5F6004E65EF00465EED00455EEC00455DEB005D72ED005F64
      DF007A76DD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D0D0D0009463
      2C0069461F00DCE0E500442B1100C0813700AB7E4A00BA834400A1733E008D67
      3B009C703D009A6E3F00BF844000BA834200A1754300997245009B744700A379
      47009B754800B7844C00A77D4D00A17A4C00AA804E00A27C4F00F7FCFF00FFFF
      FF008F8F8F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0DCC000FFFFFF00C0C0
      C000A4A0A00080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00A4A0A000FFFF
      FF00C0C0C00080808000C0DCC000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A8761700A8761700A9761700A977
      1700A9771700A9771800AA771800AA771800AA781800AA781800AA781800AB78
      1800AB791800AB791800AB791800AB791800AC7A1800AC7A1800D9C6A800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DAD9
      F6001D18C5006B73E300667AED004860EB004861EC004961ED004961ED00546B
      EF0091A0F400C5CDF800DFE3FA00F3F4FB00F8F9FC00E8EBFB00C8CFF80098A5
      F400586EEF004961ED004961ED004861EC004860EB00667AED006B73E3001D18
      C500D9D8F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D1D2D2007E57
      2D00A9712E005F2C00004A2E0C0092693B00B98850009F764600996E3D009D70
      3D00976D3C009E703F00BA824000C68A4400FDA947009E7544009A7447009773
      4700B6834B00B2824C00A47C4D00A27B4E00A1794C0098704200F8FBFD00FEFE
      FE008F8F8F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A5721600C5961F00A5721600CFA0
      2200E1B42700CA9B2100CA9B2100EFC42B00D8AB2400A6741700C6971F00DDB0
      2600B5831A00A7751700C7981F00CB9D2100C2931E00A8761700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C3C1F0001D18C5006268DF007A8CF0005169EC004B64EC004B64EC004B64
      ED004B64ED004C64EE004C64EE004C64EE004C64EE004C64EE004C64EE004B64
      ED004B64ED004B64EC004B64EC005169EC007A8CF0006268DF001D18C500C3C1
      F000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D1D2D300A16B
      2C009D692F00805A2F00918474008B663B00B1855300C18A4900986F3E00AA77
      3E00A3743D00996E3E009F724100CD8E4400C1884400967146009E7341009D79
      4E00E5DCD300FFFFFF00FAFAFA00F8F8F800F8F8F800F5F5F500F9F9F900EEEE
      EE00ABABAB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0051390A00A16E15005139
      0A0051390A0065460C00845B110051390A0051390A009D6C150051390A005139
      0A0051390A00996A140051390A0051390A0051390A00EDE3D400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00D7D6F5007A76DD004547D4008693EE007184EE00546AEC004E66
      EC004E66EC004E66EC004E66ED004E66ED004E66ED004E66ED004E66EC004E66
      EC004E66EC00546AEC007184EE008693EE004547D4007A76DD00D7D6F500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D2D2D300BC7A
      2F007D593000825C310095673200855C2B00C1915900B6854A00B98241009C6F
      3E0096693400BE926000EEEBEA00F7FAFD00F7F7F700F8F8F800F8F8F800FAFA
      FA00FFFFFF00D9D9D900A8A8A800A4A4A400A3A6A700C8C3C100FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006752290051390A005139
      0A00FFFFFF0051390A0051390A00CAC2B4008878570051390A0051390A00FFFF
      FF0051390A0051390A00725F3900FFFFFF0051390A00D5CFC300FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008E8BE200241FC700595DDC008B97EF008193
      F1006F82EF006176EE00576DED00536AEC00536AEC00576DED006176EE006F82
      EF008193F1008C98EF00595DDC00241FC7008E8BE200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D3D4D5009263
      2E00A86F300093653100A7723300885B2700FFFFFF00FEFEFE00F2F2F200EFEF
      EF00EFEFEF00F3F3F300F6F6F600C0C0C000A8A8A800A6A8A800B4B2B000F9F8
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EBEAFA008D8AE2001E19C5004141
      D2006368DF007C86E8008D99EF0095A2F20095A2F2008D99EF007C86E8006368
      DF004141D2001E19C5008C89E100EBEAFA00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D1D1D300D9DD
      E000DCDDDF00DFDFDE00E2E2E200E4E4E400D3D3D300AEAEAE00A4A4A500A3A6
      A700C5BFBD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFBFE00BCBA
      EE007E7BDE004F4BD200312CCA00231DC600231DC600312CCA004F4BD2007E7B
      DE00BCBAEE00FBFBFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6D6D600C5C5
      C5009EA0A000A6A5A400F2F0EF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFBFB00F9F9F900F8F8
      F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8
      F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8
      F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8
      F800F8F8F800F9F9F900FBFBFB00FFFFFF00FFFFFF00C0C0C000BEBEBE00BABA
      BA00B6B6B600B2B2B200ADADAD00A8A8A800A3A3A3009E9E9E009A9A9A009696
      9600929292009090900092929200969696009A9A9A009E9E9E00A3A3A300A8A8
      A800ADADAD00B2B2B200B6B6B600BABABA00BEBEBE00C0C0C000C0C0C000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005A7174005A7174005A71
      74005A7174005A7174005A7174005A71740059707300576D7000556B6E005369
      6B00516669004F6365004C6062004A5D6000485A5D0046585B00445658004355
      57004456580046585B00485A5D004A5D60004C6062004F636500516669005369
      6B00556B6E00576D70009DAAAC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B7DD
      E30084C5CF0082C3CD0080BFC9007DBBC4007AB6C00077B2BB0073ACB50070A7
      AF006DA2AA006A9EA600679AA20064969D0063949B0064969D00679AA2006A9E
      A6006DA2AA0070A7AF0073ACB50077B2BB007AB6C0007DBBC40080BFC90082C3
      CD0084C5CF0084C5CF00B7DDE300FFFFFF00FBFBFB00EEEEEE00D4D4D400C5C5
      C50053806B00507B6700507B6700507B6700507B6700507B6700507B6700507B
      6700507B6700507B6700507B6700507B6700507B6700507B6700507B6700507B
      6700507B6700507B6700507B6700507B6700507B6700507B6700507B67005380
      6B00C5C5C500CFCFCF00EBEBEB00FBFBFB00C0C0C000F7F7F700E4E4E400E6E6
      E600E9E9E900EBEBEB00EEEEEE00F1F1F100F4F4F400F6F6F600F9F9F900FBFB
      FB00FDFDFD00FFFFFF00FFFFFF00FDFDFD00FBFBFB00F9F9F900F6F6F600F4F4
      F400F1F1F100EEEEEE00EBEBEB00E9E9E900E6E6E600E4E4E400E3E3E300C0C0
      C000C0C0C000FFFFFF00FFFFFF00FFFFFF005A7174006D8388006D8388006D83
      88006D8388006D8388006D8388006D8488006E8489006E8489006E8589006E85
      89006E8589006E8589006E8589006E8589006E8589006E8589006E8589006E85
      89006E8589006E8489006E8489006D8488006D8388006D8388006D8388006D83
      88006D8388006D8388005A717400FFFFFF00FFFFFF00B7DDE30084C5CF0084C5
      CF00E7F8FB00A6E8F000ADEAF100B5ECF200BEEEF400C7F0F500D1F3F700DAF5
      F900E2F8FA00EAFAFC00F1FBFD00F8FDFE00FEFFFF00FEFFFF00F8FDFE00F1FB
      FD00EAFAFC00E2F8FA00DAF5F900D1F3F700C7F0F500BEEEF400B5ECF200ADEA
      F100A6E8F000A1E6EF0084C5CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5F5
      F50053866D0069B7940069B7940069B7940069B7940069B7940069B7940069B7
      940069B7940069B7940069B7940069B7940069B7940069B7940069B7940069B7
      940069B7940069B7940069B7940069B7940069B7940069B7940069B794005386
      6D00F3F3F300FFFFFF00FFFFFF00FFFFFF00C0C0C000F8F8F800E2E2E200E2E2
      E200E2E2E200E3E3E300E3E3E300E4E4E400E4E4E400E4E4E400E4E4E400E4E4
      E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4
      E400E4E4E400E3E3E300E3E3E300E2E2E200E2E2E200E2E2E200E2E2E200C0C0
      C000E9E9E900C0C0C000FFFFFF00FFFFFF005A7174006C8387006C838700CDD4
      D500C9D0D100C9D0D100C9D0D100C9D0D200CAD1D200CAD1D200CAD1D200CAD1
      D200CAD1D200CAD1D200CAD1D200CAD1D200CAD1D200CAD1D200CAD1D200CAD1
      D200CAD1D200CAD1D200CAD1D200C9D0D200C9D0D100C9D0D100C9D0D100CBD2
      D4006C8387006C8387005A717400FFFFFF00FFFFFF0084C5CF00E6F8FB0084C5
      CF00E7F9FB0091D3DA009EE6EE009EE6EE009FE6EF009FE6EF009FE7F0009FE7
      F0009FE7F0009FE7F0009FE7F0009FE7F0009FE7F0009FE7F0009FE7F0009FE7
      F0009FE7F0009FE7F0009FE7F0009FE7F0009FE6EF009FE6EF009EE6EE009EE6
      EE009EE6EE009EE6EE0084C5CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00538A71006BBF99003AAA77003AAA77003AAA77003AAA77003AAA77003AAA
      77003AAA77003AAA77003AAA77003AAA77003AAA77003AAA77003AAA77003AAA
      77003AAA77003AAA77003AAA77003AAA77003AAA77003AAA77006BBF9900538A
      7100FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000F8F8F800E3E3E300E3E3
      E300CDCDCD00CDCDCD00CDCDCD00CDCDCD00E5E5E500E5E5E500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E3E3E300E3E3E300E3E3E300C0C0
      C000E9E9E900C0C0C000FFFFFF00FFFFFF005A7174006C82870064797D00BDC3
      C400B8BEBF00B7BCBE00B6BDBD00B5BCBD00B6BDBD00B8BEBF00B9C0C200BBC1
      C300BDC3C500BEC5C700C0C6C800C1C8CA00C3CACC00C5CCCE00C7CED000C8CF
      D100C9D0D200CAD1D200CAD1D200CAD1D200CAD1D200CAD0D200C9D0D100CDD4
      D500CDD3D5006C8287005A717400FFFFFF00FFFFFF0084C5CF00E7F9FB0084C5
      CF00E7F9FB0092D1D900A0E6EF00A0E6F000A1E7F100A1E7F100A2E8F200A2E8
      F200A2E8F200A2E9F300A2E9F300A2E9F300A2E9F300A2E9F300A2E9F300A2E9
      F300A2E9F300A2E8F200A2E8F200A2E8F200A1E7F100A1E7F100A0E6F000A0E6
      EF00A0E6EF00A0E6EF0084C5CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00528A70006BBD980039A7750039A7750039A7750039A7750039A7750039A7
      750039A7750039A7750039A7750039A7750039A7750039A7750039A7750039A7
      750039A7750039A7750039A7750039A7750039A7750039A775006BBD9800528A
      7000FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000F8F8F800E3E3E300E4E4
      E4004343430071717100C3C3C300C6C6C600E6E6E600E7E7E700D3D3D300D3D3
      D300D3D3D300D3D3D300D3D3D300D3D3D300D3D3D300D3D3D300D3D3D300D3D3
      D300D3D3D300D2D2D200D2D2D200D2D2D200E4E4E400E3E3E300E3E3E300C0C0
      C000EAEAEA00C0C0C000FFFFFF00FFFFFF005A7174006C828600FDFDFD00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FDFDFD006C8286005A717400FFFFFF00FFFFFF0084C5CF00E7F9FB0084C5
      CF00E8F9FB0092D0D800A2E7F000A3E8F100A4E9F200A4E9F200A4EAF300A4EA
      F300A5EBF400A5EBF400A5EBF400A5EBF400A5EBF400A5EBF400A5EBF400A5EB
      F400A5EBF400A5EBF400A4EAF300A4EAF300A4E9F200A4E9F200A3E8F100A2E7
      F000A2E7EF00A2E7EF0084C5CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0052876F006ABB960038A4730038A4730038A4730038A4730038A4730038A4
      730038A4730038A4730038A4730038A4730038A4730038A4730038A4730038A4
      730038A4730038A4730038A4730038A4730038A4730038A473006ABB96005287
      6F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000F8F8F800E5E5E500E5E5
      E5006868680059595900595959001C3D500069C7F500E8E8E800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E5E5E500E5E5E500E4E4E400C0C0
      C000EBEBEB00C0C0C000FFFFFF00FFFFFF005A7174006B818600FDFDFD00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FDFDFD006B8186005A717400FFFFFF00FFFFFF0084C5CF00E8F9FB0084C5
      CF00E8F9FB0094CFD800A6E8F100A7E9F200A7EAF300A7EAF300A8EBF400A8EB
      F400A8EBF400A9ECF500A9ECF500A9ECF500A9ECF500A9ECF500A9ECF500A9EC
      F500A9ECF500A8EBF400A8EBF400A8EBF400A7EAF300A7EAF300A7E9F200A6E8
      F100A5E7F000A5E7EF0084C5CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0051866E0069B9950037A1710037A1710037A17100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0037A1710037A1710037A1710069B995005186
      6E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000F8F8F800E6E6E600E6E6
      E600AAAAAA00595959001C3D5000A8E4F200A8E4F2001C95F500D5D5D500D5D5
      D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5
      D500D5D5D500D4D4D400D4D4D400D3D3D300E6E6E600E6E6E600E5E5E500C0C0
      C000EBEBEB00C0C0C000FFFFFF00FFFFFF005A7174006B818500FDFDFD00FBFB
      FB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFB
      FB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFB
      FB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFB
      FB00FDFDFD006B8185005A717400FFFFFF00FFFFFF0084C5CF00E8F9FB0084C5
      CF00E9F9FB0097D0D900A8E8F200A9E9F300A9EAF400AAEBF500ABECF600ABEC
      F600ABECF600ABECF600ABECF600ABECF600ABECF600ABECF600ABECF600ABEC
      F600ABECF600ABECF600ABECF600ABECF600AAEBF500A9EAF400A9E9F300A8E8
      F200A7E7F100A7E7F00084C5CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0051846D0068B69300379F7000389F7100389F7100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00389F7100389F7100379F700068B693005184
      6D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000F8F8F800E6E6E600E7E7
      E700E0E0E0001C3D5000A8E4F200A8E4F2002AABF7002AABF7001C95F500EBEB
      EB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEB
      EB00EAEAEA00EAEAEA00E9E9E900E8E8E800E7E7E700E6E6E600E5E5E500C0C0
      C000ECECEC00C0C0C000FFFFFF00FFFFFF005A7174006A818500FDFDFD00FBFB
      FB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFB
      FB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFB
      FB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFB
      FB00FDFDFD006A8185005A717400FFFFFF00FFFFFF0084C5CF00E9F9FB0084C5
      CF00EAF9FB009CD4DC00ACEAF300ACEBF400ADECF500AEEDF600AEEDF600AEEE
      F700AEEEF700AEEEF700AEEEF700AEEEF700AEEEF700AEEEF700AEEEF700AEEE
      F700AEEEF700AEEEF700AEEEF700AEEDF600AEEDF600ADECF500ACEBF400ACEA
      F300ABE9F200AAE8F00084C5CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0051836B0069B593003D9F73003E9F73003E9F730032805D0032805D003280
      5D0032805D0032805D0032805D0032805D0032805D0032805D0032805D003280
      5D0032805D0032805D0032805D003E9F73003E9F73003C9F720069B593005183
      6B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000F9F9F900E7E7E700E8E8
      E800CDCDCD0069C7F500A8E4F2002AABF70045C6FA002AABF7002AABF7001C95
      F500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E8E8E800E7E7E700E6E6E600C0C0
      C000EDEDED00C0C0C000FFFFFF00FFFFFF005A7174006B828500FCFCFC00FAFA
      FA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFA
      FA00FAFAFA00EDBF5400FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFA
      FA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFA
      FA00FCFCFC006B8285005A717400FFFFFF00FFFFFF0084C5CF00EAF9FB0084C5
      CF00EAF9FB00A0D7DE00AFEBF300AFECF400B0EDF500B1EEF600B1EFF700B1EF
      F700B1EFF700B2F0F800B2F0F800B2F0F800B2F0F800B2F0F800B2F0F800B2F0
      F800B2F0F800B1EFF700B1EFF700B1EFF700B1EEF600B0EDF500AFECF400AFEB
      F300AEEAF200ADE9F10084C5CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0050816B006BB4930042A0760043A1770043A1770043A1770043A1770043A1
      770043A1770043A1770043A1770043A1770043A1770043A1770043A1770043A1
      770043A1770043A1770043A1770043A1770043A1770041A075006BB493005081
      6B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000F9F9F900E8E8E800E9E9
      E900CDCDCD00EEEEEE002AABF700A2E3FD007DD7FC0045C6FA002AABF7002AAB
      F7001C95F500D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D6D6
      D600D6D6D600D6D6D600D5D5D500D5D5D500E9E9E900E8E8E800E7E7E700C0C0
      C000EDEDED00C0C0C000FFFFFF00FFFFFF005A7174006A818500FCFCFC00FAFA
      FA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFA
      FA00EDC05600EFC56100EFC76400FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFA
      FA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFA
      FA00FCFCFC006A8185005A717400FFFFFF00FFFFFF0084C5CF00EAF9FB0084C5
      CF00EBF9FC00A5D9E200B1EBF400B3EDF600B3EDF600B4EEF700B4EFF800B4EF
      F800B5F0F900B5F0F900B5F0F900B5F0F900B5F0F900B5F0F900B5F0F900B5F0
      F900B5F0F900B5F0F900B4EFF800B4EFF800B4EEF700B3EDF600B3EDF600B1EB
      F400B1EAF300B0E9F20084C5CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0051836C006DB6950048A37A004AA57C004AA57C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF004AA57C004AA57C0047A379006EB796005183
      6C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000F9F9F900E8E8E800EAEA
      EA00CDCDCD00EEEEEE00EEEEEE002AABF700A2E3FD007DD7FC0045C6FA002AAB
      F7002AABF7001C95F500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAEAEA00E8E8E800E7E7E700C0C0
      C000EEEEEE00C0C0C000FFFFFF00FFFFFF005A7174006A818500FBFBFB00F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900EDC0
      5600EFC56100EFC86600F0C86800EFC86600F9F9F900F9F9F900F9F9F900F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9
      F900FBFBFB006A8185005A717400FFFFFF00FFFFFF0084C5CF00EBF9FC0084C5
      CF00ECFAFC00A9DCE400B5EDF500B6EEF600B7EFF700B7EFF700B7F0F800B8F1
      F900B8F1F900B8F1F900B8F1F900B8F1F900B8F1F900B8F1F900B8F1F900B8F1
      F900B8F1F900B8F1F900B8F1F900B7F0F800B7EFF700B7EFF700B6EEF600B5ED
      F500B4EBF300B3EAF20084C5CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0052846D006FB897004FA8800050A8810050A88100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0050A8810050A881004DA77F006FB897005284
      6D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000F9F9F900E9E9E900EBEB
      EB00CDCDCD00CDCDCD00CDCDCD00CDCDCD002AABF700A2E3FD007DD7FC0045C6
      FA002AABF7002AABF7001C95F500D7D7D700D7D7D700D7D7D700D7D7D700D7D7
      D700D7D7D700D6D6D600D6D6D600D6D6D600EBEBEB00E9E9E900E8E8E800C0C0
      C000EFEFEF00C0C0C000FFFFFF00FFFFFF005A7174006A808500FBFBFB00F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900EDBF5600EFC5
      6100EFC76400EFC66300EFC66200EFC66300EFC76400F9F9F900F9F9F900F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9
      F900FBFBFB006A8085005A717400FFFFFF00FFFFFF0084C5CF00ECFAFC0084C5
      CF00EDFAFC00AFE0E700B9EEF500BAEFF600BBF0F700BBF0F700BBF1F800BCF2
      F900BCF2F900BCF2F900BCF2F900BCF2F900BCF2F900BCF2F900BCF2F900BCF2
      F900BCF2F900BCF2F900BCF2F900BBF1F800BBF0F700BBF0F700BAEFF600B9EE
      F500B8ECF300B7EBF20084C5CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0054866F0072B9990055AC850058AC860058AC8600478B6C00478B6C00478B
      6C00478B6C00478B6C00478B6C00478B6C00478B6C00478B6C00478B6C00478B
      6C00478B6C00478B6C00478B6C0058AC860058AC860053AB830072B999005486
      6F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000F9F9F900EAEAEA00ECEC
      EC00EDEDED00EEEEEE00EEEEEE00EFEFEF00F0F0F0002AABF700A2E3FD007DD7
      FC0045C6FA002AABF7002AABF7001C95F500F0F0F000F0F0F000F0F0F000F0F0
      F000EFEFEF00EEEEEE00EEEEEE00EDEDED00ECECEC00EAEAEA00E9E9E900C0C0
      C000F0F0F000C0C0C000FFFFFF00FFFFFF005A7174006A808400FBFBFB00F8F8
      F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800ECBE5200EEC45E00EFC7
      6400EFC56100EEC15A00EDBF5600EEC15A00EFC56100EFC76400F8F8F800F8F8
      F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8
      F800FBFBFB006A8084005A717400FFFFFF00FFFFFF0084C5CF00EDFAFC0084C5
      CF00EEFAFC00B4E4E900BCEFF500BDF0F600BEF1F700BEF1F700BEF2F800BFF3
      F900BFF3F900BFF3F900BFF3F900BFF3F900BFF3F900BFF3F900BFF3F900BFF3
      F900BFF3F900BFF3F900BFF3F900BEF2F800BEF1F700BEF1F700BDF0F600BCEF
      F500BBEDF300BAECF20084C5CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF005588700074BB9B005BAF89005EB08B005EB08B005EB08B005EB08B005EB0
      8B005EB08B005EB08B005EB08B005EB08B005EB08B005EB08B005EB08B005EB0
      8B005EB08B005EB08B005EB08B005EB08B005EB08B005AAE880074BB9B005588
      7000FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FAFAFA00EBEBEB00EDED
      ED00CDCDCD00CDCDCD00CDCDCD00CDCDCD00F1F1F100F1F1F1002AABF700A2E3
      FD007DD7FC0045C6FA002AABF7002AABF7001C95F500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EDEDED00EBEBEB00EAEAEA00C0C0
      C000F0F0F000C0C0C000FFFFFF00FFFFFF005A717400697F8400FAFAFA00F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700EBB74400EDBE5300EEC35D00EEC4
      5E00EDBF5600F7F7F700EBB84700ECBB4C00EDC05600EFC56100EFC76400F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700FAFAFA00697F84005A717400FFFFFF00FFFFFF0084C5CF00EEFAFC0084C5
      CF00EEFAFC00B7E6EB00BFEFF500C0F0F600C0F1F700C0F1F700C1F2F800C2F3
      F900C2F3F900C2F3F900C2F3F900C2F3F900C2F3F900C2F3F900C2F3F900C2F3
      F900C2F3F900C2F3F900C2F3F900C1F2F800C0F1F700C0F1F700C0F0F600BFEF
      F500BDEDF300BDECF20084C5CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00578A710076BD9D0061B28E0066B5910066B59100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0066B5910066B591005FB18C0076BD9D00578A
      7100FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FAFAFA00EBEBEB00EDED
      ED00CDCDCD00EEEEEE00EEEEEE00CDCDCD00F1F1F100F1F1F100D8D8D8002AAB
      F700A2E3FD007DD7FC0045C6FA002AABF7002AABF7001C95F500D8D8D800D8D8
      D800D8D8D800D7D7D700D7D7D700D7D7D700EDEDED00EBEBEB00EAEAEA00C0C0
      C000F1F1F100C0C0C000FFFFFF00FFFFFF005A717400697F8300FAFAFA00F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700EAB54100ECBB4D00EDBE5300ECBE
      5200F7F7F700F7F7F700F7F7F700EAB54000EBBA4A00EDC05600EFC56100EFC7
      6400F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700FAFAFA00697F83005A717400FFFFFF00FFFFFF0084C5CF00EEFAFC0084C5
      CF00EFFAFC00BDE9EF00C3F0F600C4F1F700C4F2F800C4F2F800C5F3F900C6F4
      FA00C6F4FA00C6F4FA00C6F4FA00C6F4FA00C6F4FA00C6F4FA00C6F4FA00C6F4
      FA00C6F4FA00C6F4FA00C6F4FA00C5F3F900C4F2F800C4F2F800C4F1F700C3F0
      F600C1EEF400C1EDF30084C5CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00578B730078BE9F0068B693006CB896006CB89600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF006CB896006CB9960065B5910078BE9E00578B
      7300FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FAFAFA00ECECEC00EEEE
      EE00CDCDCD00EEEEEE00EEEEEE00CDCDCD00F2F2F200F2F2F200FFFFFF00FFFF
      FF002AABF700A2E3FD007DD7FC0045C6FA002AABF7002AABF7001C95F500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EEEEEE00ECECEC00EBEBEB00C0C0
      C000F2F2F200C0C0C000FFFFFF00FFFFFF005A717400687E8300FAFAFA00F6F6
      F600F6F6F600F6F6F600F6F6F600F6F6F600E9B23B00EAB54100EBB74400F6F6
      F600F6F6F600F6F6F600F6F6F600F6F6F600EAB43F00EBBA4A00EDC05600EFC5
      6100EFC76400F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6
      F600FAFAFA00687E83005A717400FFFFFF00FFFFFF0084C5CF00EFFAFC0084C5
      CF00F0FAFC00C1EBF100C5F0F600C6F1F700C6F2F800C6F2F800C7F3F900C8F4
      FA00C8F4FA00C8F4FA00C8F4FA00C8F4FA00C8F4FA00C8F4FA00C8F4FA00C8F4
      FA00C8F4FA00C8F4FA00C8F4FA00C7F3F900C6F2F800C6F2F800C6F1F700C5F0
      F600C3EEF400C3EDF30084C5CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00598C74007ABFA0006EBA980074BD9C0074BD9C005C977C005C977C005C97
      7C005C977C005C977C005C977C005C977C005C977C005C977C005C977C005C97
      7C005C977C005C977C005C977C0074BD9C0073BC9B006BB895007ABFA000598C
      7400FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FAFAFA00EDEDED00EFEF
      EF00CDCDCD00CDCDCD00CDCDCD00CDCDCD00F3F3F300F3F3F300D9D9D900D9D9
      D900D9D9D9002AABF700A2E3FD007DD7FC0045C6FA002AABF7002AABF7001C95
      F500D9D9D900D8D8D800D8D8D800D8D8D800EFEFEF00EDEDED00ECECEC00C0C0
      C000F3F3F300C0C0C000FFFFFF00FFFFFF005A717400677E8200F9F9F900F5F5
      F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5
      F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500EAB43F00EBBA4A00EDC0
      5600EFC56100EFC76400F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5
      F500F9F9F900677E82005A717400FFFFFF00FFFFFF0084C5CF00F0FAFC0084C5
      CF00F1FBFC00C6EEF400C9F1F700CAF2F800CAF3F900CAF3F900CBF4FA00CCF5
      FB00CCF5FB00CCF5FB00CCF5FB00CCF5FB00CCF5FB00CCF5FB00CCF5FB00CCF5
      FB00CCF5FB00CCF5FB00CCF5FB00CBF4FA00CAF3F900CAF3F900CAF2F800C9F1
      F700C7EFF500C6EEF40084C5CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF005A8E76007BC0A10074BD9C007AC0A0007AC0A0007AC0A0007AC0A0007AC0
      A0007AC0A0007AC0A0007AC0A0007AC0A0007AC0A0007AC0A0007AC0A0007AC0
      A0007AC0A0007AC0A0007AC0A0007AC0A0007AC0A00071BB9A007DC1A3005A8E
      7600FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FAFAFA00EDEDED00EFEF
      EF00F0F0F000F1F1F100F1F1F100F2F2F200F3F3F300F3F3F300F3F3F300F3F3
      F300F3F3F300F3F3F3002AABF700A2E3FD007DD7FC0045C6FA002AABF7002AAB
      F7001C95F500F1F1F100F1F1F100F0F0F000EFEFEF00EDEDED00ECECEC00C0C0
      C000F4F4F400C0C0C000FFFFFF00FFFFFF005A717400677E8200F9F9F900F5F5
      F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5
      F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500EAB43F00EBBA
      4A00EDBF5600EEC45E00EEC35D00F5F5F500F5F5F500F5F5F500F5F5F500F5F5
      F500F9F9F900677E82005A717400FFFFFF00FFFFFF0084C5CF00F1FBFC0084C5
      CF00F1FBFC00CAEFF500CCF1F700CDF2F800CDF3F900CDF3F900CEF4FA00CFF5
      FB00CFF5FB00CFF5FB00CFF5FB00CFF5FB00CFF5FB00CFF5FB00CFF5FB00CFF5
      FB00CFF5FB00CFF5FB00CFF5FB00CEF4FA00CDF3F900CDF3F900CDF2F800CCF1
      F700CAEFF500C9EEF40084C5CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF005B8F77007EC2A4007AC0A10081C3A50081C3A500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0081C3A50081C3A50076BE9E007FC3A4005B8F
      7700FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FAFAFA00EEEEEE00F0F0
      F000CDCDCD00CDCDCD00CDCDCD00CDCDCD00F4F4F400F4F4F400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF002AABF700A2E3FD007DD7FC0045C6FA002AAB
      F7002AABF7001C95F500FFFFFF00FFFFFF00F0F0F000EEEEEE00EDEDED00C0C0
      C000F4F4F400C0C0C000FFFFFF00FFFFFF005A717400667E8100F8F8F800F4F4
      F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4
      F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400EAB4
      3F00EBB94900ECBE5200EDBE5300F4F4F400F4F4F400F4F4F400F4F4F400F4F4
      F400F8F8F800667E81005A717400FFFFFF00FFFFFF0084C5CF00F1FBFC0084C5
      CF00F2FBFC00CDF0F500CFF2F700D0F3F800D0F4F900D0F4F900D1F5FA00D2F6
      FB00D2F6FB00D2F6FB00D2F6FB00D2F6FB00D2F6FB00D2F6FB00D2F6FB00D2F6
      FB00D2F6FB00D2F6FB00D2F6FB00D1F5FA00D0F4F900D0F4F900D0F3F800CFF2
      F700CDF0F500CCEFF40084C5CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF005C91790081C4A60081C4A60088C7AB0088C7AB00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0088C7AB0087C7AA007CC2A20081C3A5005C91
      7900FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FBFBFB00EFEFEF00F1F1
      F100CDCDCD00EEEEEE00EEEEEE00CDCDCD00F5F5F500F5F5F500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF002AABF700A2E3FD007DD7FC0045C6
      FA002AABF7002AABF7001C95F500D9D9D900F1F1F100EFEFEF00EEEEEE00C0C0
      C000F5F5F500C0C0C000FFFFFF00FFFFFF005A717400667D8100F8F8F800F3F3
      F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3
      F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3
      F300EAB33D00EAB64300EBB74400F3F3F300F3F3F300F3F3F300F3F3F300F3F3
      F300F8F8F800667D81005A717400FFFFFF00FFFFFF0084C5CF00F2FBFC0084C5
      CF00F3FBFC00D1F1F500D3F3F700D3F4F800D4F5F900D4F5F900D5F6FA00D6F7
      FB00D6F7FB00D6F7FB00D6F7FB00D6F7FB00D6F7FB00D6F7FB00D6F7FB00D6F7
      FB00D6F7FB00D6F7FB00D6F7FB00D5F6FA00D4F5F900D4F5F900D3F4F800D3F3
      F700D1F1F500D0F0F40084C5CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF005E927A0083C6A80087C7AA008ECAAF008ECAAF0071A28C0071A28C0071A2
      8C0071A28C0071A28C0071A28C0071A28C0071A28C0071A28C0071A28C0071A2
      8C0071A28C0071A28C0071A28C008ECAAF008DCAAF0082C4A60083C6A8005E92
      7A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FBFBFB00F0F0F000F2F2
      F200CDCDCD00EEEEEE00EEEEEE00CDCDCD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF002AABF700A2E3FD007DD7
      FC0045C6FA002AABF7002AABF7001C95F500F2F2F200F0F0F000EFEFEF00C0C0
      C000F6F6F600C0C0C000FFFFFF00FFFFFF005A717400657C8000F8F8F800F3F3
      F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3
      F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3
      F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3
      F300F8F8F800657C80005A717400FFFFFF00FFFFFF0084C5CF00F3FBFC0084C5
      CF00F4FBFC00D4F2F500D6F4F700D6F5F800D7F6F900D7F6F900D8F7FA00D9F8
      FB00D9F8FB00D9F8FB00D9F8FB00D9F8FB00D9F8FB00D9F8FB00D9F8FB00D9F8
      FB00D9F8FB00D9F8FB00D9F8FB00D8F7FA00D7F6F900D7F6F900D6F5F800D6F4
      F700D4F2F500D3F1F40084C5CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0060947B0084C7A9008DCAAE0095CEB50095CEB50095CEB50095CEB50095CE
      B50095CEB50095CEB50095CEB50095CEB50095CEB50095CEB50095CEB50095CE
      B50095CEB50095CEB50095CEB50095CEB50094CDB30088C8AB0085C7A9006094
      7B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FBFBFB00F0F0F000F2F2
      F200CDCDCD00CDCDCD00CDCDCD00CDCDCD00F6F6F600F6F6F600DBDBDB00DBDB
      DB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDBDB002AABF700A2E3
      FD007DD7FC0045C6FA002AABF7002AABF7001C95F500F0F0F000EFEFEF00C0C0
      C000F7F7F700C0C0C000FFFFFF00FFFFFF005A717400657B8000F7F7F700F2F2
      F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2
      F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2
      F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2
      F200F7F7F700657B80005A717400FFFFFF00FFFFFF0084C5CF00F4FBFC0084C5
      CF00F5FBFC00D7F2F600D8F3F700D9F5F900D9F5F900DAF6FA00DBF7FB00DBF7
      FB00DCF8FC00DCF8FC00DCF8FC00DCF8FC00DCF8FC00DCF8FC00DCF8FC00DCF8
      FC00DCF8FC00DCF8FC00DBF7FB00DBF7FB00DAF6FA00D9F5F900D9F5F900D8F3
      F700D7F2F600D6F1F50084C5CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0060967D0087C8AB0093CEB3009BD1B9009BD1B9009BD1B9009BD1B9009BD1
      B9009BD1B9009BD1B9009BD1B9009BD1B9009BD1B9009BD1B9009BD1B9009BD1
      B9009BD1B9009BD1B9009BD1B9009BD1B9009BD1B9008DCAAF0087C7AA006096
      7D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FBFBFB00F1F1F100F2F2
      F200F4F4F400F4F4F400F5F5F500F6F6F600F6F6F600F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F7002AAB
      F700A2E3FD007DD7FC0045C6FA002AABF7002AABF7001C95F500F0F0F000C0C0
      C000F7F7F700C0C0C000FFFFFF00FFFFFF005A717400647A7F00F7F7F700F2F2
      F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2
      F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2
      F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2
      F200F7F7F700647A7F005A717400FFFFFF00FFFFFF0084C5CF00F5FBFC0084C5
      CF00F5FCFC00DAF3F600DBF4F700DCF5F800DCF6F900DDF7FA00DEF8FB00DEF8
      FB00DEF8FB00DFF9FC00DFF9FC00DFF9FC00DFF9FC00DFF9FC00DFF9FC00DFF9
      FC00DFF9FC00DEF8FB00DEF8FB00DEF8FB00DDF7FA00DCF6F900DCF5F800DBF4
      F700DAF3F600D9F2F50084C5CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0062977F0089CAAD009AD1B800A2D4BE00A2D4BE00A2D4BE00A2D4BE00A2D4
      BE00A2D4BE00A2D4BE00A2D4BE00A2D4BE00A2D4BE00A2D4BE00A2D4BE00A2D4
      BE00A2D4BE00A2D4BE00A2D4BE00A2D4BE00A1D4BD0092CDB20088C9AC006297
      7F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FBFBFB00F2F2F200F3F3
      F300F4F4F400F5F5F500F6F6F600F7F7F700F7F7F700F7F7F700F8F8F800F8F8
      F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F7F7F700F7F7
      F7002AABF700A2E3FD007DD7FC0045C6FA002AABF7002AABF7001C95F5009393
      9300F8F8F800C0C0C000FFFFFF00FFFFFF005A717400637A7E00ECBD5100ECBD
      5100ECBD5100ECBD5100ECBD5100ECBD5100ECBD5100ECBD5100ECBD5100ECBD
      5100ECBD5100ECBD5100ECBD5100ECBD5100ECBD5100ECBD5100ECBD5100ECBD
      5100ECBD5100ECBD5100ECBD5100ECBD5100ECBD5100ECBD5100ECBD5100ECBD
      5100ECBD5100637A7E005A717400FFFFFF00FFFFFF0084C5CF00F5FCFC0084C5
      CF00F6FCFC00DDF4F600DEF5F700DEF6F800DFF7F900E0F8FA00E0F8FA00E1F9
      FB00E1F9FB00E1F9FB00E1F9FB00E1F9FB00E1F9FB00E1F9FB00E1F9FB00E1F9
      FB00E1F9FB00E1F9FB00E1F9FB00E0F8FA00E0F8FA00DFF7F900DEF6F800DEF5
      F700DDF4F600DBF2F40084C5CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0063997F008ACAAD00A0D4BD00A9D8C300A9D8C300A9D8C300A9D8C300A9D8
      C300A9D8C300A9D8C300A9D8C300A9D8C300A9D8C300A9D8C300A9D8C300A9D8
      C30090B8A60090B8A60090B8A60090B8A6008EB7A5007EB0990074AC93006399
      7F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FBFBFB00F2F2F200F3F3
      F300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF002AABF700A2E3FD007DD7FC0045C6FA002AABF7008B8B8B009999
      9900A4A4A400C0C0C000FFFFFF00FFFFFF005A71740062787D00EEC25A00EEC2
      5A00EEC25A00EEC25A00EEC25A00EEC25A00EEC25A00EEC25A00EEC25A00EEC2
      5A00EEC25A00EEC25A00EEC25A00EEC25A00EEC25A00EEC25A00EEC25A00EEC2
      5A00EEC25A00EEC25A00EEC25A00EEC25A00EEC25A00EEC25A00EEC25A00EEC2
      5A00EEC25A0062787D005A717400FFFFFF00FFFFFF00619BD700487EDD00487E
      DD00487EDD00487EDD00487EDD00487EDD00487EDD00487EDD00487EDD00487E
      DD00487EDD00487EDD00487EDD00487EDD00487EDD00487EDD00487EDD00487E
      DD00487EDD00487EDD00487EDD00487EDD00487EDD00487EDD00487EDD00487E
      DD00487EDD00487EDD00619BD700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00659B81008DCCAF00A6D7C100B0DBC800B0DBC800B0DBC800B0DBC800B0DB
      C800B0DBC800B0DBC800B0DBC800B0DBC800B0DBC800B0DBC800B0DBC800B0DB
      C80095BBAA0061927C0061957C0061957C0061957C0061957C00699B8300659B
      8100FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FBFBFB00F2F2F200F3F3
      F300CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCD
      CD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCD
      CD00CDCDCD00CDCDCD002AABF700A2E3FD0045C6FA0093939300B2B2B200A5A5
      A5009999990093939300FFFFFF00FFFFFF005A71740062787D00EFC76500EFC7
      6500EFC76500EFC76600EFC76500EFC76500EFC76600EFC76500EFC76500EFC7
      6500EFC76500EFC76500EFC76500EFC76500EFC76500EFC76500EFC76500EFC7
      6500EFC76500EFC76500EFC76600EFC76500EFC76500EFC76600EFC76500EFC7
      6500EFC7650062787D005A717400FFFFFF00FFFFFF00487EDD0077A3ED004E7F
      D500558CE800558CE800558CE800558CE800558CE800558CE800558CE800558C
      E800558CE800558CE800558CE800558CE800558CE800558CE800558CE800558C
      E800558CE800558CE800558CE800558CE800558CE800558CE800558CE800558C
      E800558CE800558CE800487EDD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00669D83008ECDB100ABDAC500B6DECC00B6DECC00B6DECC00B6DECC00B6DE
      CC00B6DECC00B6DECC00B6DECC00B6DECC00B6DECC00B6DECC00B6DECC00B6DE
      CC009ABDAD0062977E00D7EEE400D5ECE200BAE0CF008FCCB00070A98F0069A2
      8600FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FCFCFC00F3F3F300F4F4
      F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF002AABF7009B9B9B00CCCCCC00BFBFBF00B2B2
      B200A4A4A400D994E200FFFFFF00FFFFFF005A71740061787C00F1CD7100F1CD
      7100F5DC9B00F8E6B800F5DC9B00F5DC9B00F8E6B800F5DC9B00F1CD7100F1CD
      7100F1CD7100F1CD7100F1CD7100F1CD7100F1CD7100F1CD7100F1CD7100F1CD
      7100F1CD7100F5DC9B00F8E6B800F5DC9B00F5DC9B00F8E6B800F5DC9B00F1CD
      7100F1CD710061787C005A717400FFFFFF00FFFFFF00487EDD0075A2EB004D7D
      D200528BE600528BE600528BE600528BE600528BE600528BE600528BE600528B
      E600528BE600528BE600528BE600528BE600528BE600528BE600528BE600528B
      E600528BE600528BE600528BE600528BE600528BE600528BE600528BE600528B
      E600528BE600528BE600487EDD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00689E840090CEB200B0DCC800BCE1D100BCE1D100BCE1D100BCE1D100BCE1
      D100BCE1D100BCE1D100BCE1D100BCE1D100BCE1D100BCE1D100BCE1D100BCE1
      D100A1C1B30064987F00D3EBE000BFE3D3008ECBB00075AC91006AA38800CFEB
      DE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FCFCFC00F2F2F200F3F3
      F300CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCD
      CD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCD
      CD00CDCDCD00CDCDCD00CDCDCD0097979700E5E5E500D9D9D900CCCCCC009393
      9300F1D7F400E3B2EA00D994E200FFFFFF005A71740061777C00F2D27C00F2D2
      7D00B7B09E0088888800B8B19F00B7B09E0088888800B7B09E00F2D27D00F2D2
      7C00F2D27C00F2D27C00F2D27C00F2D27C00F2D27C00F2D27C00F2D27C00F2D2
      7C00F2D27D00B7B09E0088888800B8B19F00B7B09E0088888800B7B09E00F2D2
      7D00F2D27C0061777C005A717400FFFFFF00FFFFFF00487EDD0072A0E9004A7A
      CF004F88E3004F88E3004F88E3004F88E3004F88E3004F88E3004F88E3004F88
      E3004F88E3004F88E3004F88E3004F88E3004F88E3004F88E3004F88E3004F88
      E3004F88E3004F88E3004F88E3004F88E3004F88E3004F88E3004F88E3004F88
      E3004F88E3004F88E300487EDD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00699F86008FCEB200ADDBC600BFE3D300C2E4D500C3E4D500C3E4D500C3E4
      D500C3E4D500C3E4D500C3E4D500C3E4D500C3E4D500C3E4D500C3E4D500C2E4
      D500A4C2B50065998000B8E0CE0090CDB10070AA8E006BA48A00CFEBDE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FCFCFC00F3F3F300F3F3
      F300F4F4F400F5F5F500F5F5F500F6F6F600F6F6F600F6F6F600F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F6F6F600F6F6
      F600F6F6F600F5F5F500F5F5F500F4F4F400A2A2A200E5E5E500A2A2A200F5E3
      F800EBC6F000E7BCED00E3B2EA00D994E2005A71740061777B00F4D78500F4D7
      860088888800DBDBDB008989890088888800DBDBDB0088888800F4D78600F4D7
      8500F4D78500F4D78500F4D78500F4D78500F4D78500F4D78500F4D78500F4D7
      8500F4D7860088888800DBDBDB008989890088888800DBDBDB0088888800F4D7
      8600F4D7850061777B005A717400FFFFFF00FFFFFF00487EDD00719DE6004777
      CD004D85E0004D85E0004D85E0004D85E0004D85E0004D85E0004D85E0004D85
      E0004D85E0004D85E0004D85E0004D85E0004D85E0004D85E0004D85E0004D85
      E0004D85E0004D85E0004D85E0004D85E0004D85E0004D85E0004D85E0004D85
      E0004D85E0004D85E000487EDD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF006AA1880088CBAD00A1D6BE00B2DDCA00B8E0CE00B9E0CF00BAE1CF00BAE1
      CF00BAE1CF00BAE1CF00BAE1CF00BAE1CF00BAE1CF00BAE1CF00B9E0CF00B8E0
      CE0099BDAD00689D840088CAAC0073AC91006CA58B00CFEBDE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FCFCFC00F4F4F400F4F4
      F400F4F4F400F5F5F500F5F5F500F6F6F600F6F6F600F6F6F600F6F6F600F6F6
      F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6
      F600F6F6F600F5F5F500F5F5F500F4F4F400F4F4F400A3A3A300D994E200F2DB
      F500EED1F300EBC6F000E7BCED00D994E2005A71740060777B00F5DA8B00F5DA
      8C0088888800F0F0F0008989890088888800F0F0F00088888800F5DA8C00F5DA
      8B00F5DA8B00F5DA8B00F5DA8B00F5DA8B00F5DA8B00F5DA8B00F5DA8B00F5DA
      8B00F5DA8C0088888800F0F0F0008989890088888800F0F0F00088888800F5DA
      8C00F5DA8B0060777B005A717400FFFFFF00FFFFFF00487EDD006F9CE5004575
      CA00487FDD00487EDD00487EDD00487EDD00477DDC00477DDC00477DDC00477D
      DC00477DDC00477DDC00487EDD00487EDD00487EDD00487FDD00487FDD00497F
      DD004980DD004980DD004A81DD004A81DD004A81DD004A82DE004A82DE004A82
      DE004B83DE004B83DE00487EDD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF006BA3890082C3A50095CCB3009BCFB8009DD0B9009FD0BA00A0D2BA00A0D2
      BA00A0D2BA00A0D2BA00A0D2BA00A0D2BA00A0D2BA00A0D2BA009FD0BA009DD0
      B90085B09C0070A28B0070AB90006EA78C00CFEBDE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00D994
      E200F2DBF500EED1F300D994E200FFFFFF00FFFFFF005A7174005A7174005A71
      740088888800FFFFFF008888880088888800FFFFFF00888888005A7174005A71
      74005A7174005A7174005A7174005A7174005A7174005A7174005A7174005A71
      74005A71740088888800FFFFFF008888880088888800FFFFFF00888888005A71
      74005A7174005A717400FFFFFF00FFFFFF00FFFFFF00487EDD006D9AE2006D9A
      E2006D9AE2006D9AE2006D9AE2006D9AE2006D9AE2006D9AE2006D9AE2006D9A
      E2006D9AE2006D9AE2006D9AE2006D9AE2006D9AE2006D9AE2006D9AE2006D9A
      E2006D9AE2006D9AE2006D9AE2006D9AE2006D9AE2006D9AE2006D9AE2006D9A
      E2006D9AE2006D9AE200487EDD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF006EA98E006CA58A006CA58A006CA58A006CA58A006CA58A006CA58A006CA5
      8A006CA58A006CA58A006CA58A006CA58A006CA58A006CA58A006CA58A006CA5
      8A006CA58A006CA58A006EA98E00CFECDE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000FFFF
      FF00D994E200D994E200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B9B9B90088888800B9B9B900B9B9B90088888800B9B9B900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B9B9B90088888800B9B9B900B9B9B90088888800B9B9B900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0076A6E000487EDD00487E
      DD00487EDD00487EDD00487EDD00487EDD00487EDD00487EDD00487EDD00487E
      DD00487EDD00487EDD00487EDD00487EDD00487EDD00487EDD00487EDD00487E
      DD00487EDD00487EDD00487EDD00487EDD00487EDD00487EDD00487EDD00487E
      DD00487EDD00487EDD0094B4EB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FDFFFF00FFFEFE00FFFEFF00FFFFFF00FDFFFE00FFFE
      FD00FFFFFF00E5F7FE00A1E0FF004991E90083B1EE00FFFFFF00FFFFFF00FCFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFBFB00F9F9F900F8F8
      F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8
      F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8
      F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8
      F800F8F8F800F9F9F900FBFBFB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFF00FEFFFE00FEFFFE00FEFF
      FE00FEFFFF00FEFFFF00FEF8EB00F8BD8500F7CAAD00FEFFFF00FFFFFF00FFFF
      FF00FEFFFF00FFFEFF00FEFEFF00FFFFFE00FEFEFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FEFFFF00FEFFFF00FEFFFE00FFFFFF00FFFFFE00CEF0
      FF0080D7FF0064C9FE0068CDFF003E89E800377EE1002772DE00689DE900F9FB
      FD00FFFFFF00FEFFFF00FEFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FFFFFF00FFFF
      FF00FFFFFF00E5E5E500D4D4D4009B9B9B00A8A8A800FDFDFD00FFFFFF00FFFF
      FF00FEFEFE00FFFFFF00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFBFB00EEEEEE00D4D4D400C5C5
      C5008D743A008870380088703800887038008870380088703800887038008870
      3800887038008870380088703800887038008870380088703800887038008870
      3800887038008870380088703800887038008870380088703800887038008D74
      3A00C5C5C500CFCFCF00EBEBEB00FBFBFB00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FFFFFF00FFFFFE00FEFF
      FF00FDFFFF00FFEBC500FED89500F5A55B00F0884300FBE3D000FEFFFF00FDFF
      FF00FFFFFE00FFFFFF00FEFFFE00FFFFFF00FEFFFE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FEFEFF00FFFFFE00FEFEFF00FFFFFF00D8F3FF0061C9
      FD004DA9F20061C5FD0068CEFF003C87E6003E8EE6003D8FE7003179E20083AF
      EA00D7E6F800FFFFFF00FDFEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFE
      FE00ECECEC00CDCDCD00CFCFCF00A2A2A20094949400B3B3B300E1E1E100FFFF
      FF00FFFFFF00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5F5
      F50096783600CDA34100CDA34100CDA34100CDA34100CDA34100CDA34100CDA3
      4100CDA34100CDA34100CDA34100CDA34100CDA34100CDA34100CDA34100CDA3
      4100CDA34100CDA34100CDA34100CDA34100CDA34100CDA34100CDA341009678
      3600F3F3F300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FEFFFF00FFFFFF00FFE2
      AE00FDCD7F00F9BD7500FED38800F5A96300F08F4C00F6A66000F18D4800F8C8
      A700FEF3ED00FEFFFF00FEFEFF00FFFEFF00FFFEFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FEFFFC00F8FDFF00BCE8FE004CAEF4003D92EB0092C5
      F5003072DE006DCCFE0066CEFF003D85E7003D8EE70057BCF7003C88E50047A4
      EF00348BE6005C94E700B0CCF300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9F9F900E5E5E500CECE
      CE00A9A9A900CECECE00D0D0D000A2A2A200B7B7B700BEBEBE009B9B9B009D9D
      9D00CECECE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF009B7B3500D7A94000CB8D0000CB8D0000CB8D0000CB8D0000CB8D0000CB8D
      0000CB8D0000CB8D0000CB8D0000CB8D0000CB8D0000CB8D0000CB8D0000CB8D
      0000CB8D0000CB8D0000CB8D0000CB8D0000CB8D0000CB8D0000D7A940009B7B
      3500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFEFF00FDFFFF00FEFBF200FFE8BD00FED4
      8500F8B97C00F8B26C00FFD58900F6AA6300F08F4B00FECE8300F49B5300F18D
      4600F2A06800FEFFFF00FFFFFF00FEFFFF00FFFFFE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFEFE00EAF8FE007FD4FF004587E300307AE100AFD9
      FA008BC1F40066CCFF0064CCFF003D89E600357BE20057B5F5003F8CE5004DB1
      F3004FAEF4002770DF00528FE600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FAFAFA00CECECE00B8B8B800D3D3
      D300A2A2A200CFCFCF00D0D0D000A3A3A300ADADAD00C3C3C3009E9E9E00B1B1
      B1009C9C9C00DBDBDB00F9F9F900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF009A7B3500D5A84000C78B0000C78B0000C78B0000C78B0000C78B0000C78B
      0000C78B0000C78B0000C78B0000C78B0000C78B0000C78B0000C78B0000C78B
      0000C78B0000C78B0000C78B0000C78B0000C78B0000C78B0000D5A840009A7B
      3500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCD09400F2905500FCD1
      8900FEDBAC00FED68C00FED38700F6AB6300EF8C4800F69F5600F1964E00FFDD
      9100FAC27800EF894300F7CAA900FDFFFD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E9F8FE007CD4FF00A3CDF50084D7FE006DC5
      FA003581E40060C4FC0068D0FF003C86E7003A8DE6004EACF1003785E4003D8B
      E5004EACF1003074E000528FE400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FEFEFE00FFFFFF00FFFFFF00E9E9E900A6A6A6009A9A9A00D5D5
      D500D9D9D900CECECE00D0D0D000A3A3A300ADADAD009C9C9C009B9B9B00D0D0
      D000C1C1C10097979700CACACA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0098793500D2A64000C4880000C4880000C4880000C4880000C4880000C488
      0000C4880000C4880000C4880000C4880000C4880000C4880000C4880000C488
      0000C4880000C4880000C4880000C4880000C4880000C4880000D2A640009879
      3500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFFFF00FEFFFF00FCD4A000F4AB8400FFD4
      8B00FED18600F8BF7600FDD58800F5A96200F18F4C00F7AA6200F0914C00FBBD
      7100FCBC7100F08D4A00F8CAAA00FDFEFF00FDFEFE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E9F7FE007FD3FF0069C9FD004EAEF50091C6
      F6002166DC0069C7FD0068CEFF003A86E6003E8EE70053BAF6003B88E5004196
      EB003883E4003279E000528EE500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FEFEFE00FFFFFF00FFFFFF00E8E8E800CBCBCB00D8D8D800CFCF
      CF00ACACAC00CFCFCF00D1D1D100A2A2A200B6B6B600BBBBBB009C9C9C00ACAC
      AC00B2B2B20099999900CCCCCC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0096783500D0A44000C0860000C0860000C0860000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C0860000C0860000C0860000D0A440009678
      3500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFFFF00FEFFFF00FFD48900FABB7400FDD1
      8900F8B98300FBC98B00FFD58A00F5AA6200EF8B4700FECA7B00F39C5500FECE
      8400F7A76300EF8D4900F9CAAA00FEFEFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFE00E8F8FE007CD7FF00417FE0003981E30093D9
      FE008FDCFF0060C6FE0066CDFE003C8AE600367FE2003E8DE8003881E30052B8
      F4004EB1F2002C75E100518FE500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FEFEFE00FFFFFF00FFFFFF00EAEAEA00B3B3B3009A9A9A00D9D9
      D900C4C4C400D0D0D000D0D0D000A2A2A2009A9A9A00B8B8B8009E9E9E00D3D3
      D300B7B7B7009A9A9A00CCCCCC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0094773500CDA24000BD840200BD850300BD850300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00BD850300BD850300BD840200CDA240009477
      3500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFFFF00FCD19500F18E5500FED1
      8A00FDD9AA00FFD68D00FED38600F6AA6300EF8C4600F59B5400F1954E00FFDC
      9100FDC37800F08D4800F8C9AA00FEFFFE00FEFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E8F7FF007AD5FF0087ADEC0089C9F60061C6
      FC00479FED0062C3FC0069CEFF003B87E4003C8DE7003F91E600357EE3004799
      EE0058B9F6002E74E000518FE300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E9E9E900A4A4A40095959500D9D9
      D900DFDFDF00CECECE00D0D0D000A3A3A300A6A6A6009B9B9B009B9B9B00D3D3
      D300C1C1C10099999900CCCCCC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0093763400CBA14200BC860A00BC860B00BC860B00976C0900976C0900976C
      0900976C0900976C0900976C0900976C0900976C0900976C0900976C0900976C
      0900976C0900976C0900976C0900BC860B00BC860B00BC850900CBA142009376
      3400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFFFF00FEDCA600FDDDAC00FED7
      8F00F9BA7B00F8B36D00FED68A00F6A96400F1904C00FCCD8100F3995300F195
      4F00F4975100F08F4900FACAAA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFEFF00E9F7FE0082D6FD0053ABF2003B87E80096CA
      F5003877DF006CCBFE0068CEFF003C86E5003F8DE50054BCF6003E8AE6004CA9
      F2003E94EA003078E200518EE500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FEFEFE00FFFFFF00FFFFFF00EAEAEA00DCDCDC00CACACA00D1D1
      D100A3A3A300CFCFCF00D1D1D100A2A2A200B3B3B300C3C3C3009D9D9D00A2A2
      A2009C9C9C0099999900CCCCCC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0091743500CAA14500BC881100BC891300BC891300BC891300BC891300BC89
      1300BC891300BC891300BC891300BC891300BC891300BC891300BC891300BC89
      1300BC891300BC891300BC891300BC891300BC891300BC881000CAA145009174
      3500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFFFD00FEFFFF00FFD58B00FABE7700FDD1
      8800F8BA8600FBC78800FED58B00F6AB6300F08C4900FFCA7D00F29B5500FBC9
      7E00F4A35B00EE8F4900F7CAAA00FFFFFF00FFFEFE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E8F8FF007ED8FF004280E2002D7AE100A7D8
      FB0098CBF80062CCFE0068CEFF003D8AE7003074DF0052B0F3003E88E5004DB1
      F2004EB2F1002E73DF00518FE400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAEAEA00BBBBBB00A0A0A000D6D6
      D600BABABA00CFCFCF00D0D0D000A2A2A200A1A1A100BFBFBF009E9E9E00CCCC
      CC00AFAFAF009A9A9A00CCCCCC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0093763600CBA34700BE8C1900BF8D1B00BF8D1B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00BF8D1B00BF8D1B00BE8B1700CCA448009376
      3600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFF00FEFFFF00FCD19B00F4A37700FFD6
      8C00FFD88E00FFD58A00FFCC8100FDB05E00F7A25700EF8D4900EF904B00FBBF
      7300FCBE7200F28D4800F7C9AA00FFFFFF00FDFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFE00E9F8FE007AD5FF0098CCF60089DBFF0064CD
      FE0068CEFF0056B9F8004BAFF1004CB2F4004DADF2003885E300337AE0003C88
      E5004DA2F2002D75DE004F90E500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FEFEFE00FFFFFF00E9E9E900B1B1B100C6C6C600D2D2
      D200D1D1D100CCCCCC00BEBEBE00B1B1B100A7A7A700999999009A9A9A00BBBB
      BB00BCBCBC0098989800CCCCCC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0094773700CDA54A00C2912100C2922300C2922300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C2922300C2922300C2901F00CDA54A009477
      3700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEDCA500FDDAAA00FED6
      8900FED58700FEC06F00FEB36100FEB45E00FFB56200F69C5400F0904C00F093
      4C00F59B5400F08F4900F8CAAA00FFFFFF00FEFEFE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FEFEFF00EAF7FF007FD4FF0074D4FF005FCBFF0064CB
      FE0056BCF8004BADF0004CACF1004BABF2004EB3F2004AA8F1003E94E9003476
      DF00367CE2003178E200528EE500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E9E9E900DDDDDD00D3D3D300CFCF
      CF00CECECE00B6B6B600B2B2B200B5B5B500B6B6B600A3A3A3009C9C9C009D9D
      9D00A2A2A2009A9A9A00CCCCCC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0096793800CEA74D00C5952900C5972C00C5972C009F7924009F7924009F79
      24009F7924009F7924009F7924009F7924009F7924009F7924009F7924009F79
      24009F7924009F7924009F792400C5972C00C5972C00C4942600CEA74D009679
      3800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFEFF00FEFFFF00FFD58700FDD58800FEBC
      6900FFB05B00FFBE6B00FFCA7C00F5A96400EF8C4700FEAE5D00FFB66200F9A3
      5800F2965000F08E4A00F8CAAB00FFFEFF00FDFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FEFDFF00E7F7FD0081D6FE0061C6FD0053B5F7004BAD
      F1004EB0F30063C7FE0067CEFE003D89E600357BE0004199ED004BACF2004CAE
      F000449FEB003178E000518EE600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAEAEA00D0D0D000CACACA00B3B3
      B300B2B2B200C4C4C400CDCDCD00A2A2A2009A9A9A00B3B3B300B6B6B600A9A9
      A9009F9F9F0099999900CCCCCC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00977B3900CFA84F00C7993000C89B3400C89B3400C89B3400C89B3400C89B
      3400C89B3400C89B3400C89B3400C89B3400C89B3400C89B3400C89B3400C89B
      3400C89B3400C89B3400C89B3400C89B3400C89B3400C7992E00CFA84F00977B
      3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFFFE00FEFFFF00FECC7B00FDBE6D00FDAF
      5C00FDB86700FCC17500FDCC8400F5A96300F49D5A00F0944F00F6A15500FFB6
      6200FDB05E00F08F4800F7C8A800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFE00EAF7FF007CD1FC004AAEF1004AAEF00057BA
      F70064C8FD004EA6F20066C9FD003E8AE9003F91E800367DE1003883E2004BAB
      F0004FB1F4003491E8005092E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EBEBEB00BFBFBF00B6B6B600B4B4
      B400C0C0C000C0C0C000D2D2D200A3A3A300ABABAB009F9F9F00ABABAB00B6B6
      B600B0B0B00099999900CACACA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF009A7C3A00D2AB5200CA9D3700CCA03D00CCA03D00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CCA03D00CCA03D00C99C3400D2AB52009A7C
      3A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFFFF00FEFEFF00FFEFE000FECC9200F7A7
      6400F8AF6600F8B78800FDD08700F5A96300F2985200F69E5600FABF7600F18F
      4B00F1995100FFF8EF00FFFFFF00FEFEFF00FEFFFE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008AD0FB0072CDFF00378A
      E9007ED3FC0072C2F90068CDFF003F87E7003C89E6003D8BE700419BEC003B8A
      E7003078E000D5EEFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FEFEFE00FFFFFF00FFFFFF00FEFEFE00CDCDCD00C8C8C800A5A5
      A500D1D1D100BFBFBF00D2D2D200A1A1A100AFAFAF00A5A5A500C1C1C1009A9A
      9A00A4A4A400F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF009A7E3B00D3AC5400CDA24000CEA44500CEA44500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CEA44500CFA54500CDA13C00D2AC54009A7E
      3B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFFFF00FEFFFD00FFFFFF00FFF2D800F29E
      6B00FAC28200F8C18600FDC97E00F5A86300F49F5900F3955000F6A96000F294
      4C00F1985B00FFFFFF00FFFFFE00FFFFFE00FEFEFE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FDFEFF00FFFEFF00FEFFFE00CCF0FF008CD4FC006EB8
      F40072D2FF005DB3F40065CAFD003D8AE7003B8CE7003984E3004190E900479A
      EC003679E100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D2D2D200B0B0
      B000D2D2D200C3C3C300D1D1D100A3A3A300ADADAD009E9E9E00B8B8B8009898
      9800B2B2B200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF009C7F3C00D3AD5600D0A64700D2AA4E00D2AA4E00A8873E00A8873E00A887
      3E00A8873E00A8873E00A8873E00A8873E00A8873E00A8873E00A8873E00A887
      3E00A8873E00A8873E00A8873E00D2AA4E00D2A94D00CFA44300D3AD56009C7F
      3C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFFFE00FEFFFF00FEEFD400F39B
      5A00F7B06700F9C39600FDD38C00F6A96300F2924C00F49B5300FABE7400F291
      4A00F2995A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C4EBFE0076D0FD003E97
      EA0080CFFD0076C3F8006ACFFF003D87E7003E8BE6004291E9003E95EA003D8F
      E800387DE200FFFFFF00FEFEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00D3D3D300A6A6
      A600D3D3D300C5C5C500D1D1D100A2A2A200A9A9A900A6A6A600BFBFBF009797
      9700B2B2B200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF009E803E00D4AE5800D2AA4F00D4AE5600D4AE5600D4AE5600D4AE5600D4AE
      5600D4AE5600D4AE5600D4AE5600D4AE5600D4AE5600D4AE5600D4AE5600D4AE
      5600D4AE5600D4AE5600D4AE5600D4AE5600D4AE5600D1A84A00D5B05A009E80
      3E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFFFF00FDEFD000F5AC
      7A00FAC58300F9B77500FCC77D00F4A96200F4A65F00F0924F00F5A15900F493
      4E00F2985B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C4EBFF0087D3FD0058A5
      EE0078D6FF0059B5F70065C9FE003B8BE7003B8BE600367AE1004094E9004297
      EC00357BE100FFFFFF00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00D2D2D200AAAA
      AA00D2D2D200BEBEBE00D2D2D200A3A3A300AEAEAE009C9C9C00BABABA009797
      9700B3B3B300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF009F813F00D6B15B00D5AE5600D7B25E00D7B25E00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00D7B25E00D7B25E00D3AC5100D7B15C009F81
      3F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFEFF00FDFFFE00FFFFFF00FEEFD400F397
      5700F9AD6500FBCA9C00FDD28A00F7A96300F28F4E00F39A5100F9C27600F291
      4B00F1985B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C2EBFF006FCEFE003E95
      EC007ECFFB006BB8F60069CDFF003B85E6003F8DE700408EE6004099EB003583
      E300377DE200FFFFFF00FFFFFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D2D2D200A4A4
      A400D3D3D300C4C4C400D2D2D200A0A0A000ACACAC00A7A7A700C5C5C5009696
      9600B2B2B200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00A1834000D8B35E00D8B35E00DAB76700DAB76700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00DAB76700DAB76600D6B05800D7B25E00A183
      4000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFEFF00FFFEFE00FEFFFF00FEEED100F4AF
      7C00FCCD9000FFD98D00FFD08300FDB26100F7A05500F08D4900F39F5900F494
      4B00F1985A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C3EBFF0089D3FB005DA6
      ED0072D1FE0070D3FF0064CBFF004097EA00357AE0003B83E4004497EB00439B
      ED00367BE000FFFFFF00FFFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00D0D0D000AEAE
      AE00D1D1D100D5D5D500CDCDCD00A9A9A9009A9A9A009D9D9D00B9B9B9009797
      9700B3B3B300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00A3854100D9B46100DAB76600DCBB6F00DCBB6F00B0955800B0955800B095
      5800B0955800B0955800B0955800B0955800B0955800B0955800B0955800B095
      5800B0955800B0955800B0955800DCBB6F00DCBA6E00D8B35F00D9B46100A385
      4100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFFFE00FEFFFE00FEFFFF00FFF0D600FFD1
      8100FFC37100FFAF5C00FEBA6900F6AD6400F6995100FFB66200FDAC5C00EF8D
      4800F3965A00FFFFFF00FFFEFF00FFFFFE00FEFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C2EAFE006ECDFF0065CE
      FF0061C3FB004CAEF2004CACF10049A8F0004DB0F40045A1EE003A87E400357A
      E100377DE100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00D3D3D300CFCF
      CF00C7C7C700B3B3B300B7B7B700AFAFAF00B1B1B100AFAFAF00A1A1A1009595
      9500B3B3B300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00A5874200DAB56200DCBA6D00DFC07800DFC07800DFC07800DFC07800DFC0
      7800DFC07800DFC07800DFC07800DFC07800DFC07800DFC07800DFC07800DFC0
      7800DFC07800DFC07800DFC07800DFC07800DEBE7600DBB86700DAB66300A587
      4200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFFFF00FFFEFF00FEFFFF00FEF1DB00FEB5
      5D00FDB15C00FFC47600F8B97100F6A96300F6A86400F7A25500FEB26100FBA6
      5200F6A56300FFFFFF00FEFFFE00FFFFFD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C1E9FF0065CCFD0053B7
      F5004CAEF30052B3F4005DC2FB003F8CE8003C8CE5004CB0F3004AACF1003784
      E200347CE100FFFFFF00FDFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00CCCCCC00BABA
      BA00B2B2B200BFBFBF00C8C8C800A5A5A500A5A5A500B2B2B200B6B6B6009B9B
      9B00B0B0B000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00A6884300DBB76500DFBE7500E1C37F00E1C37F00E1C37F00E1C37F00E1C3
      7F00E1C37F00E1C37F00E1C37F00E1C37F00E1C37F00E1C37F00E1C37F00E1C3
      7F00E1C37F00E1C37F00E1C37F00E1C37F00E1C37F00DCBB6D00DAB76500A688
      4300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFFFF00FDFEFF00FEFFFF00FFFF
      FA00FCCF9A00FCCD9100F9BD8200F5A96200F5AF6600FABA7100F7AA5E00FFFF
      FF00FFFFFF00FEFFFF00FFFFFF00FDFFFE00FFFFFE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D1EAFA005DBE
      F80051AAF1005199EB005EB8F4004192EA0047A2EF003E8DE6003D8DE70072BF
      F500C6E6FB00FFFFFD00FFFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D8D8
      D800B2B2B200BBBBBB00CACACA00AAAAAA00B5B5B500C1C1C100A6A6A600EBEB
      EB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00A8894500DDB96800E1C37D00E3C78800E3C78800E3C78800E3C78800E3C7
      8800E3C78800E3C78800E3C78800E3C78800E3C78800E3C78800E3C78800E3C7
      8800E3C78800E3C78800E3C78800E3C78800E3C78700DEBE7300DCB86700A889
      4500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FFFFFF00FEFFFE00FEFFFF00FFFD
      F800FDD69E00FAC48A00F6A16600F5A86200FAB86C00F9B56C00F4A25900FFFF
      FF00FEFFFF00FEFFFF00FEFEFE00FEFEFF00FFFFFE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFFFE00FFFFFF0080CE
      FC0068A1EC006BB7F70064C3FA004290E800439BEA00459EEC004CA4F000F2F9
      FD00FFFFFF00FEFEFF00FEFEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ECEC
      EC00B9B9B900B5B5B500BEBEBE00ADADAD00C0C0C000B8B8B800A5A5A500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00AA8B4500DDBA6900E3C78500E6CC9100E6CC9100E6CC9100E6CC9100E6CC
      9100E6CC9100E6CC9100E6CC9100E6CC9100E6CC9100E6CC9100E6CC9100E6CC
      9100C3AD7B00C3AD7B00C3AD7B00C3AD7B00C3AD7900BEA36400BC9D5800AA8B
      4500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFEFF00FFFFFE00FFFEFF00FEFFFF00FFFD
      F500FDDBA200F9C38A00F5A46900F5A96200F8B86F00F6AD6600F59D5300FEFF
      FF00FEFFFF00FFFEFF00FFFEFF00FEFFFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FFFFFF007CCE
      FC004D92E6006EBEF70065C2FB00418FE8004295E90048A5F000449EED00FDFD
      FD00FFFEFE00FDFEFF00FEFFFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E9E9
      E900BABABA00C0C0C000BCBCBC00ADADAD00B6B6B600B9B9B900A4A4A400FFFF
      FF00FFFFFF00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00AD8C4600DEBB6C00E5CA8C00E8D09900E8D09900E8D09900E8D09900E8D0
      9900E8D09900E8D09900E8D09900E8D09900E8D09900E8D09900E8D09900E8D0
      9900C6B18200A2854600A5874400A5874400A5874400A5874400A98E4E00AD8C
      4600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFE
      F700FBD09C00FCCD8E00FDD59500FAAB6000F2954F00FABD7300F9AB6000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFFFF00FFFFFF0087D5
      FD0080C2F4004795EB0055B2F5003F92EA0044A1EE003F91E8004396EB00FCFE
      FF00FEFFFF00FFFEFF00FFFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FFFFFF00E7E7
      E700BCBCBC00AFAFAF00C5C5C500A7A7A700BBBBBB00BCBCBC00A1A1A100FFFF
      FF00FEFEFE00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00AE8E4800DFBD6E00E7CE9300EAD4A100EAD4A100EAD4A100EAD4A100EAD4
      A100EAD4A100EAD4A100EAD4A100EAD4A100EAD4A100EAD4A100EAD4A100EAD4
      A100C7B48800A7894500F4E8CC00F3E6C900EBD6A700DEBC6F00BA9B5200B393
      4900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFC
      F700FED79400FEB66400FEB25E00FFB36000FEB46000FAAC5B00F5954800FEFF
      FF00FEFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFE00FFFFFE0085D1
      FB0080C0F50064CDFF005DC2FB0047A5EE003D8DE6004093EA00439BED00FDFE
      FF00FEFFFF00FDFFFE00FEFEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E2E2
      E200CDCDCD00C2C2C200B6B6B600B5B5B500AFAFAF009E9E9E0098989800FFFF
      FF00FEFEFE00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00AF904900E0BE7000E9D19900ECD8A900ECD8A900ECD8A900ECD8A900ECD8
      A900ECD8A900ECD8A900ECD8A900ECD8A900ECD8A900ECD8A900ECD8A900ECD8
      A900CAB99100A98B4600F2E5C600EDD9AD00DDBC6E00BC9E5600B5944A00F4E4
      C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFE
      FE00FEE1BD00FDAE5500FFB05D00FEB46000FEB36000FFB15A00FDBF7C00FEFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFFFF00FFFFFF007AD4
      FF0067CDFF0054B6F8004BACF2004EAFF2004CB0F1003C88E6003477E100FCFE
      FF00FFFEFE00FEFFFE00FEFFFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DFDF
      DF00BFBFBF00B4B4B400B4B4B400B4B4B400B4B4B400AFAFAF009C9C9C00FEFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B0914B00E1BE6E00E8CF9500EEDAAD00EEDBB000EEDCB100EEDCB100EEDC
      B100EEDCB100EEDCB100EEDCB100EEDCB100EEDCB100EEDCB100EEDCB100EEDB
      B000CBBA9500AA8C4700EBD6A400DFBD7000BC9A5000B6954C00F4E4C000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFFFF00FDFFFF00FEF3E500FEB76800FFD6A800FDFFFF00FFFFFF00FEFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFF00D9EF
      FD008BCAF70044ABF1004DADF2004AAEF4004CB0F20045AAF2007FC8F700FFFF
      FE00FEFEFF00FEFFFE00FEFEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFEFE00C9C9C900B0B0B000B3B3B300B0B0B000E9E9E900FEFEFE00FFFF
      FF00FFFFFF00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B2924C00DFBA6500E6C98500EAD29B00EBD5A300ECD6A500ECD7A600ECD7
      A600ECD7A600ECD7A600ECD7A600ECD7A600ECD7A600ECD7A600ECD6A500EBD5
      A300C8B48600AD8F4B00DDB96600BE9D5300B8974D00F4E4C000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FFFFFE00FFFF
      FD00FAFEFF007CC3F70047ABF2004BAEF20043ABF000C8E6FB00F2F8FF00FFFE
      FE00FEFEFF00FFFFFE00FFFEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FBFBFB00E8E8E800C0C0C000E3E3E300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B4944D00D8B25E00DDBD7700DEC28000DFC38300E0C38400E0C58500E0C5
      8500E0C58500E0C58500E0C58500E0C58500E0C58500E0C58500E0C38400DFC3
      8300BEA56D00B2955400BE9C5000BA994E00F4E4C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00BB9A4F00B5964E00B5964E00B5964E00B5964E00B5964E00B5964E00B596
      4E00B5964E00B5964E00B5964E00B5964E00B5964E00B5964E00B5964E00B596
      4E00B5964E00B5964E00BB9A4F00F4E4C000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAE9E800DCDB
      DA00DCDBDA00DCDBDA00DCDBDA00F6F6F600FFFFFF00FFFFFF00FFFFFF00E6E5
      E500DCDBDA00DCDBDA00EFEEEE00FFFFFF00FFFFFF00FFFFFF00FCFCFC00DEDE
      DD00DCDBDA00DCDBDA00F7F7F600FFFFFF00FFFFFF00FFFFFF00F6F5F500DCDB
      DA00DCDBDA00E0E0DF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FAFAFA00F0F0F000EBEBEB00EBEBEB00EBEBEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00EBEBEC00EBEBEC00EBEBEC00EBEBEC00EBEBEC00ECEC
      EC00ECECEC00ECECEC00EBEBEC00EBEBEB00EBEAEB00EFEFF000F9F9FA00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00E4E4
      E300D5D4D300D8D7D600F0F0EF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F2F2
      F200D6D5D400DBDADA00FBFAFA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EBEA
      EA00D4D3D200E3E2E200FEFEFE00FFFFFF00FFFFFF00FFFFFF00FEFEFE00E2E1
      E100D4D3D200ECECEB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F7F7F700E6E6E600D8D8D800D3D3D300D5D5D500D3D3D300D3D3D300D3D3
      D300D3D3D300D3D3D300D3D3D300D5D5D500D3D3D300D8D8D800E6E6E600F7F7
      F700FFFFFF00FFFFFF00F1F1F100D7D7D700D3D3D300D7D7D600D4D4D400D2D2
      D200E0E0DF00F9F9F900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F9F9F900EFEFEF00E7E7E800E3E3E400E2E2
      E300E2E2E300E2E2E300E3E3E400E3E3E400E3E3E400E3E3E400E2E2E300E2E2
      E300E2E2E300E3E3E300E7E7E700EEEEEF00F8F8F900FEFEFE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F8F8F800E2E2E200C8C8C800C7C7C700CBCBCB00C9C9C900C9C9C900C9C9
      C900C9C9C900C9C9C900C9C9C900CBCBCB00C7C7C700C8C8C800E2E2E200F8F8
      F800FFFFFF00FDFDFD00DBDBDB00CECECE00CECECE00CECECE00CDCDCD00CDCD
      CD00CECECE00EAEAEA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00F8F8F800F1F1
      F100ECECEC00E7E7E700E4E4E400E2E2E300E2E1E200E3E3E400E6E6E600EBEB
      EB00F1F1F100F6F6F700FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8FBFF0089C2
      FA004DA3F80053A6F800A9D3FC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D2D2
      D2006D6C6D0076757600E5E5E500FFFFFF00FFFFFF00FFFFFF00FFFFFF00B0B0
      B000686768008D8C8D00F8F8F800FFFFFF00FFFFFF00FFFFFF00F7F7F7008A8A
      8A0063626300AFAEAF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFD00F2EFDF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0091C7FB003396
      F7003396F7003396F7003396F700C2E0FD00FFFFFF00FFFFFF00FFFFFF008484
      84005554550055545500ABABAB00FFFFFF00FFFFFF00FFFFFF00F7F7F7006260
      61005453540054535400D6D6D600FFFFFF00FFFFFF00FFFFFF00CFCFCF00504F
      50004F4E4F005F5D5E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F7F5EB00D4C99500EDE8D200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EEEEEE00B4B3
      B300818081006563640056545500514F4F0055535300626060007B7A7A00ACAB
      AB00E6E6E600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004FA4F8003396
      F7003396F7003396F7003396F7007FBDFA00FFFFFF00FFFFFF00FFFFFF007E7C
      7D005856570058565700AFAEAF00FFFFFF00FFFFFF00FFFFFF00F2F2F2006261
      61005755560056555600D4D3D400FFFFFF00FFFFFF00FFFFFF00C9C9C9005351
      52005250510064636300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00EFEFEF00CCCCCC00B0B0B000A7A7A700AAAAAA00A7A7A700A6A6A600A6A6
      A600A6A6A600A6A6A600A7A7A700AAAAAA00A7A7A700B0B0B000CCCCCC00EFEF
      EF00FFFFFF00FFFFFF00D4D4D4009D9D9D009B9B9B009B9B9B009D9D9D009D9D
      9D009C9C9C00B7B7B700FAFAFA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E5DEBD00BEAF6100CABD7E00FCFBF800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EEEEEE00959495004D4B4C00403E
      3F00413F3F00413F4000413F4000413F4000423F4000413F4000413F4000413F
      40004745460088878700E5E5E500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0063AFF9003396
      F7003396F7003396F7003396F70096C9FB00FFFFFF00FFFFFF00F9F9F9006C6B
      6C005A5959005A595900C1C1C100FFFFFF00FFFFFF00FFFFFF00E7E7E7005D5C
      5C005958580059585900DFDFDF00FFFFFF00FFFFFF00FFFFFF00C3C3C3005553
      5400545353006C6B6C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F1F1F100C5C5C500919191008E8E8E009797970093939300929292009292
      9200939393009292920093939300979797008F8F8F0091919100C5C5C500F1F1
      F100FFFFFF00FFFFFF00F3F3F300C0C0BF00A4A4A400A8A8A800AEAEAD00A7A7
      A700AFAFAF00E2E2E200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E0D6AB00BBA75100BAA95600F8F6EC00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00BFBFBF0052505000413F4000424040004240
      41004846470068666600818080008B898A00848383006E6B6C004E4B4C004341
      420043414200434141004C4A4B00ACABAC00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CCE5FD003F9C
      F7003396F7003396F70057A9F800ECF6FF00FFFFFF00FFFFFF00CECECE005C5B
      5B005C5B5B005E5D5D00E1E1E100FFFFFF00FFFFFF00FFFFFF00D0D0D0005C5A
      5B005B5A5A0065636400F1F1F100FFFFFF00FFFFFF00FFFFFF00B6B5B6005756
      56005655550077757600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FDFDFD00C5C5C50081818100BDBDBD00D9D9D900C8C8C800C3C3C300C5C5
      C500C7C7C700C6C6C600CCCCCC00DEDEDE00C3C3C30083838300C6C6C600FDFD
      FD00F6F6F600F9F9F900FFFFFF00DBDBDC0096999C00A4A9AE00B7BBC0009498
      9C00BBBCBD00FFFFFF00FCFCFC00F6F6F600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FDFEFF00D7ECFF00F4F8FB00E0DDC300C5B25D00CEBA5F00F7F4E800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00A1A0A100413F400042404100434141005D5B5C00ACAC
      AC00E7E6E700FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EDECED00B8B7
      B700696767004543440045434300444242008D8C8C00FDFDFD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DFEF
      FE00A0CEFB00AAD3FC00F1F8FF00FFFFFF00FFFFFF00FEFEFE00817F80005E5D
      5D005E5D5D007F7E7E00FEFEFE00FFFFFF00FFFFFF00FFFFFF00ADACAC005E5C
      5D005D5C5C0078767700FDFDFD00FFFFFF00FFFFFF00FFFFFF00A19FA0005958
      58005857570088888800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E8E8E800D5D5D500C5C5C50097979700C3C3C300D7D7D700CFCF
      CF00D0D0D000D8D8D800C5C5C50099999900C9C9C900D7D7D700E8E8E800FFFF
      FF00BCBDBD00ADACAC00B3B2B200ACACAD00909293009E9FA200ADAFB0008F91
      9200A0A1A200B7B6B600ADACAC00B2B2B200FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E5F1FE0098CBFD0075BAFF007BB1D800CAC69700CEC5A000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E5E5E400F1F1F100FFFFFF00F1F1F100FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A3A2A2004240410043414200454243009B9A9A00F6F6F600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FDFDFD00AFAEAE004E4C4C0047444500464344008F8D8E00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADACAC00605E5F00605F
      5F00615F6000C2C2C200FFFFFF00FFFFFF00FFFFFF00FFFFFF0085858500605E
      5F005F5E5E0099999900FFFFFF00FFFFFF00FFFFFF00FFFFFF00828081005B59
      5A005A595900A8A7A700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E8E8E8007A7A7A008A8A8A00A4A4A4009797
      970097979700A4A4A4008989890079797900E8E8E800FFFFFF00FFFFFF00FFFF
      FF0095979800B7A99B00D7B89C00C1A28200C7AA8D00D3B59600D6B89A00CCAF
      9100C2A48500C6A88800D6BFA700918F8C00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F0F7FE009DCDFB003B9EFE0071BFFF00C1D3E000CBC9C400CDCDD000EDEC
      ED00DEDEDF00B7B6B6008B89890088868600A4A3A3008D8C8C00B0AFAF00D7D6
      D600ECEBEB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C3C2C30043404100444242004C4A4B00C4C4C400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00D6D6D6005B595A004846460047454600A9A8A900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FBFBFB00ACACAC0062616100626161006261
      61008A888900FDFDFD00FFFFFF00FFFFFF00FFFFFF00E0E0E000646363006261
      610062606100CFCECE00FFFFFF00FFFFFF00FFFFFF00F0F0F000676566005D5C
      5C005C5B5B00CDCDCD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00DADADA00959595007A7A7A007D7D7D007878
      7800787878007E7E7E007979790092929200D9D9D900FFFFFF00FFFFFF00FFFF
      FF009DA0A300C49B7100EF923400DD750D00DD7D1D00DA781700D9781700DB7B
      1B00DD7A1600E07E1A00EAA2570099938C00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00DBEDFE00DDF0FF00D4E7F800E5E9EE00736E6C006B6B6F009290
      93006C6A6A004E4B4B004D4A4B00575555004B494A004A484800636162004E4C
      4C009E9D9D00B9B9B900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F0F0
      F0005B5A5A004442430045434300BFBEBE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00D9D8D800545252004A484800514F4F00E0E0
      E000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFEFE00F2F2F200C8C7C700838282006362620064626300646363007271
      7100E9E9E900FFFFFF00FFFFFF00FFFFFF00FFFFFF00A09E9F00646363006563
      630076757400F9F9F900FFFFFF00FFFFFF00FFFFFF00D0CFD000605E5F005F5D
      5E0063616200EBEBEB00FFFFFF00FFFFFF00D5D5D500D6D6D600DDDDDD00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00D5D5D5009D9D9D0083838300959595008989
      89008989890096969600838383009C9C9C00D5D5D500DEDEDE00DEDEDE00DEDE
      DE00888B8F00AB855D00CE7B2500C1630400E77F1500E57D1200E47C1200E57F
      1500E67C0E00E9801300ED9F500098928B00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FCFCFC00ECEBEA005854540054535400524F
      5000504E4F00504C4D004F4D4D004E4C4C004D4B4B004C4A4A004B494A004A47
      480048464700626161009C9B9B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A09F
      9F00444243004543440097969600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F5F3E700F9F7F000FFFFFF00FFFFFF00FCFBF800FBFBF600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B2B2B2004C4A4A004B494A008C8A
      8B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D5D5D5008988
      8800817F7F00717070006563630065646400666465006665650076747400DCDB
      DB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E1E1E1006A686800676565006665
      6500B2B1B100FFFFFF00FFFFFF00FFFFFF00FFFFFF009A999900626061006160
      600085838400FEFEFE00FFFFFF00FFFFFF00A8A8A80095959400939494009394
      9500929495009294950092949500A1A2A30095969800A7AAAC00C3C6C800B5B8
      BA00B5B8BA00C3C6C800A8AAAC0095969800A1A2A40092949500929495009294
      95006366680076634E008E5D250098560A00E68A1E00E78A1E00E78A1E00E68B
      1F00E6871700E8891C00EAA1540099928B00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D7D5D400615F5E00535151005351
      510052505100524F4F00514F4F00504E4E00504D4D004D4B4C004D4A4B004C49
      4A004A48480049474700484546008F8D8E00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F1F1F1005958
      5800454344005E5B5C00F2F2F200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F0ECDA00BCAC5C00C5B77200F8F6EE00FDFDFA00C9BC7C00D1C68F00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00767575004E4C4C00504F
      4F00E1E1E100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00777676006563
      6400656464006665650067666500676666006867670092919100EAE9E900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FAFAFA008886860069686800696868007574
      7400F2F2F200FFFFFF00FFFFFF00FFFFFF00F2F2F2006F6D6E00646263006362
      6200B9B9B900FFFFFF00FFFFFF00FFFFFF00A8A8A80094949400D5D6D700CACF
      D400C7CDD300C7CCD200C7CCD200C8CCD200C9CED300D1D7DC00D5DAE000D3D9
      DE00D3D9DE00D5DAE000D1D7DC00C9CED300C8CCD200C7CCD200C7CCD200C7CD
      D300C5CACF00D2D1CF0091744E00995C0400E7911500E8911400E7911500E892
      1600E88E0D00E98E1200E89E4C0099928B00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C9C8C8005B595900555353005553
      530054525200545151005351510052505000524F5000504E4E004F4C4D004D4B
      4B004C4A4A004A4848004947470048454600908F8F00FDFDFD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C2C1C1004643
      440047444500A3A2A200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F2EF
      DF00C0B06400B9A85400B9A85400C6B97500CCC08400B9A85400C4B56E00FDFD
      FB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDBCBC005C5A5A009E9D
      9D00F0F0F000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00909090006765
      650067666600686767006E6D6C0091909000CAC9C900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A7A6A6006B6A6A006C6A6A006B6A6A00C1C0
      C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00B4B4B40067666500666465006C6B
      6B00EBEBEB00FFFFFF00FFFFFF00FFFFFF00A9A9A9009B9FA100FAF3ED00E2B9
      9000DAA77300DBAC7D00DBAC7D00DBAC7D00D9AA7B00CFA07100CC9D6E00CD9E
      6F00CD9E7000CC9D6E00CFA07200D9AA7B00DBAC7D00DBAC7D00DBAC7D00DAA7
      7300E2B99100FAF3ED009A866900A2660900F29F1C00F39F1B00F29F1B00F39F
      1C00F39D1300F39C1800EEA752009B938D00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D8D8D80058555500575555005755
      5500565454005553530055535300545151005351510052505000504E4E004F4D
      4D004D4B4B004C4A4A004B4949004947470047454600A6A5A500FCFCFC00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00919090004745
      450049474700DDDDDD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F3F0E200C1B2
      6800B9A85400B9A85400B9A85400B9A85400B9A85400B9A85400BAA95700F3F0
      E100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8F8F800F3F3F300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F4F4F400C2C2
      C200C2C1C100D0CFCF00EAEAEA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B3B2B2006E6C6C006E6C6C006E6C6C0099989800FDFD
      FD00FFFFFF00FFFFFF00FFFFFF00F3F3F3007775750069686700686667009D9C
      9D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ACACAC009AA0A600E6D9CB00CC79
      2600C65D0000CA680600CA680600CA680600CA680600CA680600CA680500CA68
      0500CA680600CA680600CA680600CA680600CA680600CA680600CA680600C65D
      0000CC792600E6D9CB009A927C00AC7C3900FFBE6100FFBE6000FFBE6000FFBE
      6100FFBB5900FFBE5F00FFD58F00A29D9800FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6F6F60085838300595757005856
      560058565600575555005654540056535300545252005351510052505000504E
      4E004F4D4D004E4C4C004C4A4A004B4849004A4647005B595900D7D7D700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00747273004746
      46005E5C5D00F6F6F600FFFFFF00FFFFFF00FFFFFF00F8F6EE00C2B36900B9A8
      5400B9A85400B9A85400B9A85400B9A85400B9A85400B9A85400B9A85400E4DE
      BE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FAFAFA00A9A8A800706E6E00706F6E00706F6F0084828200F2F2F200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00ADACAC006C6A6A006B6A6A006D6C6C00E2E2
      E200FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADADAD00999FA500E8DBCE00D587
      3500DA720600E57F1900E37E1900E37E1900E37E1900E37E1900E37E1800E37E
      1800E37E1900E37E1900E37E1900E37E1900E37E1900E37E1900E57F1800DB72
      0500D5873500E8DBCE007E838700736E6800A9A39B00A9A39B00A9A39B00A9A3
      9B00A9A29B00A9A39B00A9A59E009D9D9D00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00D1D1D1008A8888005A58
      58005C5858005957570058565600575555005654540055525200535151005250
      5000504E4E004F4D4D004E4C4C004C4A4A004B4849004947460084828300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00626162004846
      47006F6D6E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8F6ED00C2B36900B9A8
      5400B9A85400B9A85400B9A85400B9A85400B9A85400B9A85400B9A85400D4CA
      9700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00EEEEEE00FCFCFC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDE
      DE008F8F8E00737171007371710073717100807F7F00E7E6E600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00DFDFDF00727070006E6D6C006D6C6C00A4A3A300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADADAD00999FA500E8DBCE00D689
      3600DF750800EC841B00E9831B00E9831B00EA831B00EA831B00EA831B00EA83
      1B00EA831B00EA831B00E9831B00E9831B00E9831B00E9831B00EB831B00DF75
      0800D6893600E8DBCE00999FA500ADADAD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFBFB00DAD9D900ABAA
      AA0063606000656262005B585800585757005755550057545400545252005451
      510052505000504E4E004F4D4D004E4C4C004C494A004A48480048464600E1E1
      E100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005E5C5D004947
      480075747500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6F3E800C8BA
      7800B9A85400B9A85400B9A85400B9A85400B9A85400B9A85400B9A85400C6B8
      7300FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B6B5
      B50069686800EDEDED00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00DDDCDC00A5A4A4007574
      73007473720075737300757373008C8A8A00E8E7E700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7F7F70089878700716F6F00706E6E007A787800F0F0EF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADADAD00999FA500E8DBCE00D588
      3600DC740800E8831B00E5821B00E5831B00E6831B00E6831B00E6831B00E683
      1B00E6831B00E6831B00E5831B00E5831B00E5831B00E5831B00E7821B00DB74
      0800D5883600E8DBCE00999FA500ADADAD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00FFFF
      FF00C7C6C600999797006E6B6B005B5858005957570058555500575454005652
      52005351510052505000514F4F00595657004C4A4B004B49490049484700A6A5
      A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00656363004A48
      4900706F6F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D7CE
      9E00B9A85400B9A85400B9A85400B9A85400B9A85400B9A85400B9A85400BBAB
      5A00F5F3E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5F5F500949292005957
      570059565600E0DFDF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F2F2
      F200EBEBEB00E2E2E200CDCDCD00B1B0B00091908F0075747300767474007675
      74007775750077757500A3A2A200F3F3F300FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFEFE00A09E9E00747272007371710072707000C9C8C800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADADAD00999FA500E8DBCD00D587
      3500DA750800E3851C00E2841C00E3851C00E3851C00E2851C00E2851C00E285
      1C00E3861C00E3861C00E2851C00E2851C00E3851C00E3851C00E4851C00DA75
      0800D5873500E8DBCD00999FA500ADADAD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E3E3E300B8B6B6006F6D6D005B58580059575700585555005754
      5400555353005351510053505100ADACAC00626061004D4B4B00494847007473
      7400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00777676004B49
      4900605E5F00F6F6F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00DCD3A900B9A8
      5400B9A85400B9A85400B9A85400B9A85400B9A85400B9A85400B9A85400B9A8
      5400E7E1C500FFFFFF00FFFFFF00FFFFFF00DCDBDB00747272005B5959005B59
      59005B595900CECECE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BEBDBD007C7B
      7B00787676007573730075747300767574007776750078767600787776007977
      770089878700C9C8C800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B0AEAE00767574007674740075737300A6A5A500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AEAEAE0099A0A600E7DACD00D586
      3500DB780800E58D1D00E48B1C00E48C1C00E48C1C00E48C1C00E48C1C00E48C
      1C00E48C1D00E48C1D00E48C1C00E48C1D00E48C1D00E48C1D00E68D1D00DB78
      0800D5863500E7DACD0099A0A600AEAEAE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F0F0F000B5B4B400656262005B585800595757005756
      5600565454005553530052505000C7C7C700CFCFCF00545252004B4949005956
      5700FBFBFB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00969595004B49
      49004E4B4C00DDDCDC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D9CFA100C1B2
      6700BBAB5A00B9A85400B9A85400B9A85400B9A85400B9A85400B9A85400B9A8
      5400D9CF9E00FFFFFF00FEFEFE00B5B4B400626060005D5A5A005D5A5A005D5A
      5A005D5A5A00B5B3B300FFFFFF00FFFFFF00FFFFFF00FFFFFF007F7E7D007473
      720076747400777575007876760079777600797877007A787800918F8F00C2C1
      C100F5F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00B0B0
      AF0079787700797777007876760094939300F9F9F900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B1B1B1009AA0A600E7DACD00D485
      3500DD7C0800EA961D00E8931C00E8931C00E8931C00E8931C00E8931C00E893
      1C00E8931D00E8931D00E8931C00E8931D00E8931D00E8931D00EA951D00DD7C
      0800D4853500E7DACD009AA0A600B1B1B100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F0F0F0008F8D8D005D5A5A005A5858005957
      5700575555005654540053515100BFBEBE00FFFFFF008C8B8B004D4A4B004A47
      4800F1F1F100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C5C5004C4A
      4A004D4B4B00A5A4A400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFD
      FB00F6F3E800EAE5CB00DED6AF00D0C48C00C4B66F00BCAC5C00B9A85400B9A8
      5400CCBE7800FFFFFF00B4B3B5005D5B5B005E5B5B005E5C5C005F5C5C005F5C
      5C005F5C5C00A19F9F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B4B3B3007978
      7700797777007E7C7C008886860098969600B4B4B300DDDDDC00FCFCFC00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5F5F500A5A4A3007C7A
      7A007B7A79007B7979008D8C8C00F0F0EF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B2B2B2009BA1A700E7DACD00D384
      3400DE7E0800ED9A1E00EB981D00EB971D00EB961D00EB961D00EB961D00EB96
      1D00EB961D00EB971D00EB971D00EB961D00EB961D00EB971D00ED991E00DE7E
      0800D3843400E7DACD009BA1A700B2B2B200FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DADADA00656262005C5959005A58
      5800585656005754540057545400D2D2D200FFFFFF00D8D8D8004E4B4C005452
      5300F1F1F100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F3F3F300615F
      60004E4B4C0063606100F1F0F000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFC00F7F5EC00ECE7CF00DED5
      AD00E4DDB900FFFFFF00F9F9F900D3D3D30092919000605D5D00605D5D00605E
      5E00615E5E008F8D8D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E9E8
      E800E6E5E500EEEEEE00F8F8F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDDDD00949392007F7D7C007E7C
      7C007E7C7B00908F8F00EBEBEB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B4B4B4009CA1A700E7DACD00D181
      3400DF800800F4A52000F2A21E00F1A11E00F1A01E00F1A01E00F1A01E00F1A0
      1E00F1A01E00F1A11E00F1A11E00F1A01E00F1A01E00F2A11E00F4A42000DF80
      0800D1813400E7DACD009CA1A700B4B4B400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008A8787005D5A5A005C5A
      5A005957570059565600807E7E00F4F3F300FFFFFF00FFFFFF00696767007977
      7800F9F9F900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A7A6
      A6004E4C4C004F4D4D009A999900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BBBABA00615F5E00625F5F006C69
      690062605F007E7D7D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F1F1F100B5B4B4008280800082807F0081807F00817F
      7E009E9C9C00F0F0F000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5B5B5009CA1A800E7DACC00D483
      2F00DF7F0000F09E1700EE9C1600ED9B1600ED9B1600ED9B1600ED9B1600ED9B
      1600ED9B1600ED9B1600ED9B1600ED9B1600ED9B1600EE9C1600F09E1700DF7F
      0000D4832F00E7DACC009CA1A800B5B5B500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BEBCBC005E5C5C005C5A
      5A005A575700615E5E00BEBDBD00FFFFFF00FFFFFF00FFFFFF00B1B0B000BCBC
      BC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F3F2
      F20068656600504D4E00514F4F00BFBEBE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00DAD9D9006866660062605F006D6A6A00E3E3
      E300D4D3D300A7A5A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00EFEFEE00BDBDBC008E8C8B0084828100848282008382810083828100B3B1
      B100FAF9F900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5B5B5009AA0A800E8DBCA00DE8E
      2800DE7A0000DF840800DF840800DF840800DF840800DF840800DF840800DF84
      0800DF840800DF840800DF840800DF840800DF840800DF840800DF840800DE7A
      0000DE8E2800E8DBCA009AA0A800B5B5B500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E4E3E300626060005D5B
      5B00625F5F0098969600E8E8E800FFFFFF00FFFFFF00FFFFFF00F4F4F400F3F2
      F200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00CBCACA00514F4F00524F4F0058565600C4C3C300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00D8D7D700706D6D006360600064616100BBBABA00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00EEEEED00D4D3D300ABAA
      A9008C8A89008785840087858400878584008785840093919100D3D2D200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B3B3B300A7AAAD00FFFFFF00FFED
      C100FFE2AB00FFE3B200FFE3B200FFE3B200FFE3B200FFE3B200FFE3B200FFE3
      B200FFE3B200FFE3B200FFE3B200FFE3B200FFE3B200FFE3B200FFE3B200FFE2
      AB00FFEDC100FFFFFF00A7AAAD00B3B3B300FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ECECEC00605D5D005F5D
      5D0089888800DBDBDB00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00AEADAD00524F500052505000545252009E9D9D00F4F4F400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FCFCFC00B6B5B400666463006360600064616100A6A4A400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFAFA00D6D5
      D500D0CFCF00CBCBCA00C1C0C000AFAFAE009B9A99008B898800878585008886
      85008887860089878600898786008E8C8B00BBBAB900F3F3F300FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B6B6B600A4A4A300D5D7D800D6DD
      E600D6DFE900D7DEE800D7DEE800D7DEE800D7DEE800D7DEE800D7DEE800D7DE
      E800D7DEE800D7DEE800D7DEE800D7DEE800D7DEE800D7DEE800D7DEE800D6DF
      E900D6DDE600D5D7D800A4A4A300B6B6B600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E6E5E500646161009694
      9400D0CFCF00FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00AEADAD005351510054525200555353006B686800B0AE
      AE00E6E5E500FCFCFC00FFFFFF00FFFFFF00FFFFFF00FEFEFE00ECECEC00BDBC
      BC007C797900625F5F006360600064616100A6A4A400FEFEFE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ABABAA00817F
      7E00838180008482810085848300878584008886850089878600898887008A89
      88008B89880094929100BAB9B800EBEAEA00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BFBFBF00AEAEAE00AAAAAA00ABAC
      AC00ABACAC00ABACAC00ABACAC00ABACAC00ABACAC00ABACAC00ABACAC00ABAC
      AC00ABACAC00ABACAC00ABACAC00ABACAC00ABACAC00ABACAC00ABACAC00ABAC
      AC00ABACAC00AAAAAA00AEAEAE00BFBFBF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F0EFEF00BCBBBB00E5E5
      E500FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CACACA006866670056535300575454005856
      56005C5A5A00767474008D8B8B0095949400908E8E007E7B7B0066636300615E
      5E00615F5F00636060006E6B6B00C0BEBE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008E8D8D008381
      8000848381008684830087868500898786008A8887008B89880094929100AEAD
      AC00D2D1D100F2F2F200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8F8F800FCFC
      FC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F2F2F200A8A6A600656363005856
      56005A5757005A5858005B5959005D5A5A005E5B5B005F5C5C00605D5D00615E
      5E0069676600A1A0A000EDECEC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D5D5D4009796
      9600969493009C9A9A00A6A5A400B6B4B400CBC9C900E2E1E100F4F4F400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F2F2F200C3C3
      C300979696007C7A7A006C696900686565006D6A6A007C7B7B0096949400C0BF
      BF00EEEEEE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E8E8E700E7E6
      E600E7E6E600E7E6E600E7E6E600E7E6E600E7E6E600E6E6E500F8F8F800FDFD
      FD00E6E6E500E7E6E600E7E6E600E7E6E600E7E6E600E7E6E600E7E6E600E6E6
      E500FBFBFB00FBFBFB00E6E6E500E7E6E600E7E6E600E7E6E600E7E6E600E7E6
      E600E7E6E600E7E7E600FFFFFF00FFFFFF00FFFFFF00FDF4FE00FDFAFF00FBFF
      FE00EDEEEA00EFE6FA00EDE7FF00E2E6F100E2E9F200E2E9F200E2E9F200E2E9
      F200E2E9F200E2E9F200E2E9F200E2E9F200E2E9F200E2E9F200E2E9F200E2E9
      F200E2E9F200E2E9F200E2E9F200E2E9F200EFE7F100EAE8FC00DEEAF600E2E8
      F500F1E5FF00F7FAFF00F4FFFC00FBF7F600FFFFFF00FCFEFE00FFFEFF00FFFD
      FF00FFFCFF00FFFBFF00FFFAFF00FFFBFF00FFFFF800FDFFF800FCFFF800FCFF
      F800FDFFFB00FDFFFB00FDFFFC00FDFFFC00FFFBFF00FFFBFF00FFFCFF00FFFA
      FF00FFFBFF00FFFCFF00FFFBFE00FFFAFD00FDFAFF00FBFBFF00FBFFFA00FAFF
      FB00FFFFFF00F8F8FE00FFFDFF00FFFBFC00FFFFFF00F8F3F400F6F3F500F5F3
      F300F4F4F400F2F5F300F2F4F400EFF4F300F3F5F500F4F6F600F3F3F300F4F4
      F400F2F5F300F2F5F300F2F4F400F2F4F400F7F4F600F8F5F700F6F3F500F6F4
      F400F3F3F300F3F4F200F3F3F300F3F3F300F6F4F400F7F5F500F4F4F400F4F4
      F400F2F4F400F2F4F400F5F3F300F5F3F300FFFFFF00FFFFFF00F0F0EF00DEDE
      DD00DDDDDC00DDDDDD00DDDDDD00DDDDDD00DDDDDD00E4E4E400FDFDFD00FFFF
      FF00ECEBEA00DEDEDD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00E8E7
      E700FEFEFE00FEFEFE00E8E7E700DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDD
      DD00DEDEDD00ECECEC00FFFFFF00FFFFFF00F1FBFF00FAFBFF00EDE9E400C6BE
      8F00AF9D5600B2934E00B6964B00B59B3D00B99A4B00B99A4B00B99A4B00B99A
      4B00B99A4B00B99A4B00B99A4B00B99A4B00B99A4B00B99A4B00B99A4B00B99A
      4B00B99A4B00B99A4B00B99A4B00B99A4B00C1A04300B3934700AB944400B499
      4F00BA9A6900CABE9A00E8F3DF00F6FCFF00FFFFFF00F6FBFA00FBFDFE00FDFF
      FF00FCFEFF00FDFFFF00FDFFFF00FAFCFD00FFFEFF00FFFCFE00FFFDFF00FFFE
      FF00FDFFFF00FBFCFF00F8FBFF00F9FCFF00F7FEF900F4FBF600F6FCF700FBFF
      FA00FAFBF700F2F1ED00EDEAE600EBE8E400F2EBF200FBFFFE00F6FFF800FAFF
      F900FFFFFE00FFFCFF00FCFDFF00F4FFFF00FFFFFF00FFFFFF00F7F4F600F6F4
      F400F7F7F700F6F6F600F5F7F700F4F6F600F4F6F600F4F4F400F4F4F400F5F5
      F500F4F5F300F4F5F300F1F3F300F3F3F300F7F5F500F9F6F800F8F7F900F4F3
      F500F2F4F400F4F7F500F6F6F600F6F6F600F7F5F500F8F6F600F7F7F700F6F6
      F600F4F6F600F6F6F600F6F6F600F9F7F700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFFAFF00FDF8F900C8B58A00AD8A
      2800B8880400C98E0200CE900000D0970000CE8F0500CE8F0500CE8F0500CE8F
      0500CE8F0500CE8F0500CE8F0500CE8F0500CE8F0500CE8F0500CE8F0500CE8F
      0500CE8F0500CE8F0500CE8F0500CE8F0500CE950000C88D0100C88E0000CB8F
      0000BA820500B08D2B00C6BC8C00F4F4FF00FCFEFF00FFFFFF00F8FFFF00F5FF
      FE00F6FFFE00F4FFFA00F7FFFB00F8FFFB00F7FCFF00FAFCFF00FBFDFF00FDFC
      FF00FFFCFF00FFFCFF00FFFBFF00FFF7FF00F2F7E800F0F5E600EFF1E500E1E2
      D800C3C4BB00A3A39D00989793009E9B9700E0CECD00EDEEE500EFFFF100F0FF
      F300FBFDF700FFFEFF00FDFFFF00F4FFFF00F8F6F600F8F6F600F7F5F500F7F5
      F500F8F8F800F5F5F500F6F6F600F3F3F300F3F4F200F2F0EF00EAE8E800DCDA
      DA00D1CFCE00C6C4C300BFBFBF00C2C2C200C8C6C600C5C3C300BDBFC000C4C8
      C900D0D5D400DBE0DE00E7E9E900EFF1F200F4F3F500F6F5F700F7F6F800F6F5
      F700F6F6F600F6F6F600F6F6F600F5F5F500FFFFFF00FFFFFF009E9D9D005D5B
      5B005C5A5A005C5A5A005C5A5A005D5A5B005D5B5B00706F6F00ECECEC00FEFE
      FE008C8A8A005F5C5C005E5B5B005E5B5B005E5B5B005D5B5B005D5B5B007D79
      7700F6F6F700F5F9FE0065B0FB00419DF800419DF800419DF800419DF800419D
      F800429EF8007CBBFA00FFFFFF00FFFFFF00FFFEFF00F8E0C400B4823600C07D
      0300DA900200DA900200D1890000D08B0000CA860500CA860500CA860500CA86
      0500CA860500CA860500CA860500CA860500CA860500CA860500CA860500CA86
      0500CA860500CA860500CA860500CA860500C9850000CC890F00D0890A00D78F
      0100CF8E0000BD840000BB944600EFDEDB00FFFEFF00FDFFFF00F6FBFA00F5FC
      F900FAFFFC00FBFFFB00FFFFF900FBFCF300FFFEFF00FFFEFF00FEF9FA00F4EF
      F000F1EDEC00EEEAE900E2DEDD00D3CFCE00B3BAB300888E89004E5552001F27
      2700030C1000000007000000080000000A0025201F00A5A29D00E6ECE100EBF7
      EB00F6FFF900F1F7F200FFFEFF00FFFCFF00F8F6F600F8F6F600F8F6F600F7F5
      F500F7F6F800F6F6F600F6F4F400F8F6F600F8F6F500F5F3F200F3F1F100EFED
      ED00D7D5D400D1CFCE00CFCFCF00D2D2D200D7D5D400D4D2D200CBCDCE00CACE
      CF00D8DDDC00EBEEEC00EFF1F100F4F4F400F8F7F900F6F5F700F6F5F700F6F6
      F600F6F6F600F6F6F600F6F6F600F5F5F500FFFFFF00FFFFFF005E5C5C00514E
      4E00514F4F00514F4F00524F5000525050005250500052505000CCCCCC00F2F2
      F20054515100535051005350510053505100535151005350500053505000534E
      4C00E0E2E400DCECFC003397F9003396F7003396F7003396F7003396F7003396
      F7003396F7003C9BF700FFFFFF00FFFFFF00FFFEFE00F5D3A800B5721600D27B
      0300D67C0000C9770000C4790D00C3761500CE7D0E00CE7D0E00CE7D0E00CE7D
      0E00CE7D0E00CE7D0E00CE7D0E00CE7D0E00CE7D0E00CE7D0E00CE7D0E00CE7D
      0E00CE7D0E00CE7D0E00CE7D0E00CE7D0E00D47D0900C97B1700C2710E00C779
      0800CA860300CD810000BF7F2100E7CEB400FCFBFD00FBF8FA00FFFFFF00FFFF
      FE00FFFBFA00FFFBF800FFFFFB00F1EBE600EAEEE300E4E5DC00D7D5CD00C2BF
      B700A29C9700746B67003E3532001B0F0D0007000E0000001100001025000936
      4B001E6B7E00339CAF003BB9CB0038C2D400144A5100000008007C6E7900D7C8
      CC00F0F3F100F6FFFC00FFFFFE00FFF9FD00F6F5F700F7F6F800F7F7F700F7F7
      F700F6F6F600F7F7F700F6F6F600F8F6F500F8F6F600F9F7F700E7E7E700D6D6
      D600D3D4D200D8D9D700D9D9D900D8D8D800D7D5D400D8D6D500D9D7D700DAD8
      D800D7D5D500D9D7D600EAE8E700F5F6F400F6F7F300F7F8F600F7F8F600F8F8
      F800F7F7F700F4F6F600F7F6F800F6F5F700FFFFFF00FFFFFF0062606000524F
      5000525050005250500053505000535151005351510053515100CCCCCC00F2F1
      F1005B595900545252005452520054525200545252005451520054515200544F
      4D00E1E2E400DCECFC003397F9003396F7003396F7003396F7003396F7003396
      F7003396F700419DF800FFFFFF00FFFFFF00F6FCFF00EBD2AA00B26F1300D977
      0B00D4710500D17C0E00CE7D1400C66F1100D5760800D5760800D5760800D576
      0800D5760800D5760800D5760800D5760800D5760800D5760800D5760800D576
      0800D5760800D5760800D5760800D5760800E1790200CD770D00CE740F00D079
      1100C67A0900D2750000BE711500D3C4A300FFFFFE00FFFFFF00FFF7F800FFFD
      FF00FFFDFF00E2DBDE00BFBEC200A7AAAE0085777900544C4D00191A1E000000
      06000001080000111A0000323D00144F59001384A50030A4C5004AC5E70052D2
      F5004FD7FB004BDAFF0049DCFF0044DAFF0051D2ED0010587A00000019004530
      4900BAACB700E7EAE800FFFFFE00FFFDFF00F7F6F800F9F9F900F8F8F800F9F9
      F900F7F7F700F7F7F700F7F8F600F5F6F400F5F3F300DFDDDD00D5D5D500D8D9
      D700D9D7D600DAD8D700DCDAD900D9D7D700DADADA00DBD9D900DDDAD600DED9
      D600DDD9D800DAD8D800D9D7D700E0E1DF00F5F6F200F7F8F400F7F8F600F8F9
      F700F9F9F900F7F9F900FAFAFA00F8F8F800FFFFFF00FFFFFF00646262005350
      5100535151005351510054525200545252005452520055525200CECDCD00F2F2
      F2005C5A5A005553530055535300555353005553530055535300555253005650
      4E00E1E3E400DCECFC003297F9003396F7003396F7003396F7003396F7003396
      F7003396F700419DF800FFFFFF00FFFFFF00EDF9FF00EAD3A500AF690C00D66F
      0F00D46A1300CE731800BE670B00B7580800AC570700AC570700AC570700AC57
      0700AC570700AC570700AC570700AC570700AC570700AC570700AC570700AC57
      0700AC570700AC570700AC570700AC570700B6590400AC5C0700C1640900D26D
      1100CB6D0E00DD6A0100C16B1700D0D1AA00F7FDF800FFFFFC00FFFCFD00FFFC
      FF00D5D0D9005B646E000218230000000B000000190000122E00103C5B00246E
      90002C96BB0029AFD70025C3EB0026D0FA0021CEFC0023CEFC0022CAF90023C5
      F50028C6F60032CCFD0038CDFF0039CCFE002AC9FF0021A1DC002A7AAF000017
      3D00040A1D00E0DBDD00FBFCF800F5FCF900F7F7F700F8F8F800F9F9F900F8F9
      F700F8F8F800F8F8F800F9F7F600F5F6F400DCDCDC00D9D9D900D7D5D400DCDB
      D700DEDBD700DFDBD600E4DED700E0DBD800D8D9DD00D9DBDC00E1DDD800E4DE
      D700DCDAD900D9DBDC00DADBDF00D8D7D900E1DFDF00F8F6F500F6F7F500F8F8
      F800F7F7F700F8F8F800F9F9F900F8F9F700FFFFFF00FFFFFF00656363005452
      5200545252005552520055535300555353005653530056535300CECDCD00F2F2
      F2005D5B5B005654540056545400565454005654540056545400565454005752
      4F00E1E3E500DCECFC003297F9003396F7003396F7003396F7003396F7003396
      F7003396F700419DF800FFFFFF00FFFFFF00FBFFF700F6DA9A00B4630000D564
      0E00C9591700BC5E1C00B65E1E00D5754000AB6C5000AB6C5000AB6C5000AB6C
      5000AB6C5000AB6C5000AB6C5000AB6C5000AB6C5000AB6C5000AB6C5000AB6C
      5000AB6C5000AB6C5000AB6C5000AB6C5000B26D5900A3684000B35C1E00C85C
      1500CF631500E5630400BD5F0C00C5CFA400F8FFFB00F6FAF500FFFEFF00E8E1
      E800474B560000000D0019485600518E9C0011B1D10022C1E5002FCCF80029C4
      FB0021BBFC001FB8FF001EB6FF001AB1FF0023B7F30023B5F10023B5EF0025B8
      F00029BDF3002CC0F40030C4F80032C7F9001FB3FF000093DF000AA3E0002B95
      BE00000B1E00AEAAAF00FFFAF700F8FFFC00F6F6F600F6F6F600F8F8F800F9F9
      F900F8F8F800F8F8F800FDFBFA00E5E6E400D7D7D700DAD8D700E1DDD800E5DE
      D500ECE0D400EFE2D200F1E2CF00F2E5D500DFDAD700E0DBD800E5D8C800E0D2
      BF00E9E1D400E4E1D900DFDDDD00DCDBDD00D9D4D500E9E5E400F7F7F700F5F7
      F700F8F8F800F7F7F700F9FAF800F8F9F700FFFFFF00FFFFFF00656464005552
      5300555353005653530056545400565454005754540057545400CECECE00F2F2
      F2005E5C5C005755550057555500575555005755550057555500575555005853
      5000E1E3E500DCECFC003297F9003396F7003396F7003396F7003396F7003396
      F7003396F700419DF800FFFFFF00FFFFFF00FDFCFF00DED5AA00CE551000C755
      0E00D6561B00CF4F1E00AC543C00FFFDFC00FFF9FA00FFFCFD00FCFDFB00FFFF
      FE00FFFEFD00FFF9F600FFFEFC00FFFDFC00FFFFF600FFFEF400FBFFF700FAFF
      FC00FBFFFE00FFFEFF00FFFCFF00FFFCFF00D7FFF900FFF5F600BA563300CC51
      0D00C3551B00DB501800C7591F00D3CFA600FFFAFF00FFFCFF00FBFFFC00C7C5
      B300000006000083A7002EC7FE002CCBF7001CBBF5001DB7F80019B0FA0018AE
      FC001DB0FA001D9FE200157CBA0012659D001F98DD0022B1F40017B4F6001CB1
      F40026B5F80020B7F4001FBFF50027C3F80015BBF6001195DB000B8BE4000D9A
      E30000173D00A7A4AD00FBF6F700FFFFF800FAFAFA00F9F9F900F8F7F900FAF9
      FB00F9F9F900F8F8F800F1F2F000D9DAD800DCDDDB00E2DFDB00EAE0D600E5D4
      C100C2A98F00CBAD8A00C9A88100C1A58200EEDDCA00F2E2D100B89C7A00C0A0
      7C00D3B79900E7D5BE00EAE0D600E5E0DD00E2DEDD00DBD9D800F4F4F400FAFA
      FA00FAFAFA00F9F9F900F8F9F700F8F9F700FFFFFF00FFFFFF00636060005654
      5400565454005754540057555500575555005855550058565600CDCCCC00F1F1
      F1005C5959005956560059565600595656005956560059565600585656005954
      5200E0E2E400DBECFC003297F9003396F7003396F7003396F7003396F7003396
      F7003396F7003D9BF700FFFFFF00FFFFFF00FDFAFF00DAD1A600CB501200C851
      1300D04C1700CA461700BC593D00FFF2ED00EFFFFF00FBFFFF00FFFBFE00FBFA
      FC00F1FFFF00EDFFFF00F7FAFE00FFFBFF00EEFFFE00F4FFFF00FBFFFF00FEF7
      FA00FFF9FC00FFFDFF00FFFEFF00F9FCFF00FAFFF800F9D2D000BC4B2A00D050
      0F00BE4C1700D4471600C1501800CFCAA300FFFDFF00FEFBFF00F5FBF600B2AF
      A000050712001CA4CE002CC5FF001BB9EE0016B4F00016B2F40011ABF4000DA7
      F40013A8F2000D92D6000471AF00116AA3001BA3E3000FAEEC0000AAEA000AA9
      ED0018ACF20018B0F1001EB9F80025BBF70014B8F3001294DA000D8BE4000F9B
      E20000183C00A7A4AD00FCF7F800FFFFF800F9F9F900FAFAFA00F9F8FA00FAF9
      FB00F9F9F900F9F9F900E5E6E400DFE0DE00DFDEDA00E4DDD400F4E0CE00BEA2
      8400AC886200B38A5D00BA8D5A00B18A5E00EFD7BB00C9B29800B08A6000B58B
      5C00B28A6000AB8C6B00F3E2CD00E9E0D600E2DFDB00DDDDDD00E4E4E400FAFA
      FA00F9F9F900FBFBFB00FAFAFA00FAFBF900FFFFFF00FFFFFF00868484005755
      550058555500595656005957570059565600595656005E5C5C00E2E2E200FBFB
      FB00767373005A5757005A5858005B5858005B5858005A5757005A5757006864
      6200F0F1F200EDF5FE0043A0F9003396F7003397F800329AFF00329AFF003396
      F8003396F7005BABF900FFFFFF00FFFFFF00FFFEFF00DAD0A800C6461100C949
      1900CF431C00CD3F1600BC422400DC9B8D00EBF9F300F5FFFB00FBFFFF00FEF9
      FB00FFFCFF00FFFCFF00EBF4FD00EDFEFF00FFFCFF00F4F3FC00F4F7FC00FDFE
      FF00FBFEFF00EEFAFA00F1FFFD00F6FFFF00FFEFE000E1919000C33B1E00D449
      1000BD441A00DA451D00C54F1E00D2CCA900FFFDFE00FEFCFF00FAFFFB00A4A2
      9700090B1D002CB4E80020B7FF0011AEF00012ACED000FAAEF000AA7F10008A9
      F50016B1FA00129DE200077BBA001B7FBA0027B7F1000EB7F00000AEEB0004AA
      EF000EA8F1000EA8F10018B0F7001CAEF60013B4F2001292D9000F8BE3000F9B
      E00000183A00A7A5AB00FCF7F900FFFFF900FAFBF900FAFBF900FBFBFB00FBFB
      FB00F7F9F900F4F6F600DADCDC00DEDFDD00E4E1D900F3E4D400D5B89900C09A
      7000BA906300BF8F5F00C0905C00B78E6100EFD5B700C2A88A00B7906400BE91
      5E00BA8F5E00B38D6300D0B69800F4E6D400E3DFDA00DFDFDF00DEDEDE00F5F5
      F500FCFAF900FDFBFB00F9F9F900FAFAFA00FFFFFF00FFFFFF00F5F5F500D5D4
      D400D4D4D400C0BFBF00A7A6A600D4D3D300D5D4D400E4E3E300FFFFFF00FFFF
      FF00EFEFEF00D5D4D400D5D4D400B8B7B700B4B3B300D4D4D400D4D4D400EAE9
      E900FFFFFF00FFFFFF00E4F2FE00CAE4FE00CAE4FD00A4BBD300AFC7DE00CAE5
      FE00CBE4FD00EDF6FE00FFFFFF00FFFFFF00FFFFFE00DCD2AA00C53F1500CC3D
      2100D33A2500D33D1E00BD2D1100AB3C2C00B8484800E49D9900FFF0E800FDFF
      F900F9FEFC00FFFEFF00FDFDFF00F8FEFF00FFF6FF00FFFDFF00F3FFFF00F1FF
      FE00F6FFF900FFFFF700FFEBE100DEAAA400B7554500A62B2D00CB2A1400DA43
      1700BD3A1F00D6391F00C1471F00D0C6A800FFFFFE00FEFDFF00FAFFFE00A6A5
      9B000709210024ACE7000EA5FA0010ACF90014ADF20009A7ED0005A9F20008AD
      F60018B6FC0019A6E9000782C200117BBA002DABE20021BAF1000DB6F3000CAF
      F40010AAF5000AA5F4000DA8F70011A6F60012AEEF001591D800118CE200109C
      DE0001193700A9A5AA00FDF8FA00FFFFFB00FCFDFB00FBFCFA00FBFCFA00FEFF
      FD00F8FAFA00E7E9E900DBDDDD00E2E1DD00EEE5D800E5CFB600B9966B00D3A8
      7700BA906300B9906300B9906300B18D6700E9D3BA00F6E0C700B7957100BC93
      6600BF936400B98F6400B3916D00F3DDC400EEE6DF00E0E0E000DEDEDE00EBEB
      EB00FCFCFC00FBFBFB00FAFAFA00FBFAFC00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00D3D3D30093929200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00BCBBBB00B3B2B200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A49E9A00BEBCB900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFDF800DCD1AB00C6371800CF30
      2600CF2C2A00D4382500D6321F00BE272000E4262700C01A1900B2373300D486
      7F00F3CCC300FFF5ED00FFFFF900F3FEF600F8FBF900F3FFFB00FDFFF900FFE8
      E100EFB4AB00C0686100BA3E3800B5151300BB2B2000BE252E00E3332900DA37
      1E00BB2D2600D22B1E00C3401F00D6CBAD00FFFFFC00FDFCFF00F9FFFD00A7A5
      9D000408210019A5E20008A2FB0005A7F60013ADF40008ABF00007B2F6000AB6
      F80016B5F7001FABED00178FD0001380BE001E7FB9002BACE5001CB5F20012AD
      F20014ADF80008A8F60005A7F5000DA8F70013AAED00188FDA00168DE200159E
      DC00031A3400AAA7A900FDF8FA00FFFFFC00F9FBFB00FAFCFC00FCFCFC00FBFB
      FB00FBFBFB00E0E2E200DDDFE000E3DFDA00F6E3CE00C9AB8800BC936200D9B0
      7F00E6C7A000DFC6A600E4CAAC00E0CCB300EDE1D500F4EBDE00CBB8A300F8DC
      BE00FFDFB900E1B98F00D8B28800E1C5A300EEE2D600E7E5E400E2E0E000E4E4
      E400FDFDFD00FBFDFD00FAFCFC00FAFCFC00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00CECDCD0092919100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B8B7B700B0AFAF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A19F9F00BAB9B800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFB00DBCFAD00C52C1700D022
      2900CF202E00C8282600DD2C2900D9242D00C61F1C00D52D2C00CE232500BF11
      1800B81A2000CC5F6100F0CCC400F3FFF500F2FFFA00FFFFF900E4B4B000B239
      3D00BC1A2000BC131600D5252500E8252700D0262400CC223500DF232900CD24
      1D00BE273100D6232400C0381C00D1C3A600FFFEFD00FFFDFF00F8FFFC00A5A6
      9D0000051C0014A3DD000BABFF0003A9F6000EADF10008B2F20008BBF8000CBC
      F80012B1ED001FA7E200299CD900228BCA001370A8002CAAE1001FB9F40012AF
      F10015B3F9000AAFF80005AAF3000CACF40015A8EE001D90DB001C90E40019A1
      DB00031B3100AAA8A800FDF8FA00FFFFFC00FAFDFB00FAFDFB00FCFDFB00FBFB
      FB00FBFBFB00E0DFE100E2E1E500EDE5DE00ECD5BB00BE9B7000C7986400C499
      6600FFEAC800FBE9D200F7E9D700F3EADD00EAE7E200EAE7E200F1E8DB00FEE9
      D300F2CFAD00BF956A00C69A6B00CFAB8500F9EADA00E8E3E000E5E3E200DFDF
      DF00FEFDFF00FAFCFD00FAFCFD00FAFCFC00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00CECECE0094929200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B9B8B800B1B0B000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A1A0A000BBBABA00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFB00DCCFAF00C6251700D318
      2800CF183400BA1A2600D01A2500D7102C00CD1E2C00BB1B2700BA1A2600DD24
      3400DE132800A9001000B75E6100FFF9F000FDFFFE00FFEFEE00C56F7700AC03
      1600E91C3300D7192A00C7162500CF1A2800CD1B2000C4143200D7182D00CD1E
      2800BC1B3500D7182500C3351C00D7CAAA00FFF8F900FFFCFF00F7FFFD00A4A8
      9D0000071B0012A3DA000DB1FE0005B0F4000DB2F1000BBBF70002BCF2000CBE
      F30014B0E5001798CF002490CA002183BF00178DC10023BAED0012C2F70007B7
      F3000EB8F80009B6F50009AFF00010ACED0018A6ED002090DC002093E4001CA3
      DB00041C3000AAA8A700FDF8FA00FFFFFE00FAFEF900FBFFFA00FAFEF900FBFC
      FA00FAFAFA00E1E0E200E4E3E700EBE3DC00E2CAAE00BF9A6E00CB9C6400C598
      6500D0B29500DBCBBB00F1E8DF00EBE8E300E5E9E400E6EAE400EDE9DE00FBEB
      D400CFAC8400C89B6800CC9C6800BF996F00E8D6C500E9E4E100E7E5E400E1E1
      E100FDFCFE00FDFCFE00FDFCFE00FDFCFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00CFCECE0096959500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00BDBCBC00B5B4B400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A4A4A400BAB9B900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEF800DDD0B000CB271B00D410
      2600CE123500B7172B00CF152B00DD0D3500BF0B2800CC143200D10A2900DB08
      2900DA102D009D061A009E565C00FFFFFB00F5FCFF00FFFCFF00D38C9C009F08
      2200CF113000C50D2B00C20E2A00D4123000D01C2700BC0C3100D0133000C918
      2C00B30E3100D6142500C7351F00D8C9A900FFFCFF00FFFCFF00F4FCFB00A3A7
      9C00030F210013A8DA0008AFF80003B2F1000DB5F2000DBFF80000B9EC0011C6
      F40023BEEF00219ED1002C90CA002A86C10017ABDA0012C4F30000C3F40000BA
      F00004BAF50008B8F4000EB4EF0015ADE80018A5EE002391DD002295E6001DA4
      DA00041C2E00ACA8A700FDF8FA00FDFFFF00F9FDF800F8FCF700FAFDFB00FCFD
      FB00FAFAFA00E4E3E500E5E4E600EFE7E000F5DFC600C19E7600CB9E6B00CBA1
      7200B79A7F00EBDBCE00F2ECE700E5E7E700E1E7E600E3E9E400EEECE200E8D8
      C100C49E7400CFA06C00CE9F6B00BF9B7300ECDAC900EBE6E300E9E7E600E3E3
      E300FFFCFE00FFFCFE00FFFEFF00FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00CECECE0081808000DCDCDC00DCDBDB00DCDBDB00DCDBDB00DCDB
      DB00DCDCDC00DCDCDC00DDDCDC00A5A4A4009F9E9E00DDDCDC00DCDCDC00DCDB
      DC00DCDBDB00DCDBDB00DCDBDB00DCDBDB00DCDCDC008C8B8B00BABABA00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFB00EBCAA900C31D1E00CE02
      3100CE003500C6042E00C50C3600C90B3400C90F3900C1163D00CD1B4600D815
      4300B30E340080263D00E5CAD400FFFBFD00FFFFFE00FAFFFE00FAEFF2008F3A
      4E00C1163C00D7184500CB184500CD124300C90C3900D3113500C7093800D707
      3700CF003400CC002D00C92A2C00DCCBAA00FFFFF500F1FFFF00FFFCFF00B3A3
      9D0000091B001AA8E50000B0FC000FB8F20006B6FC0011B8FB000CB7EF0012C8
      F6000EC8F1000FC3EC0004BAE40005C6F10008C9F1000CCCF70003BFEF000CC1
      F8000DBFFA000AB8FA0011BBFF0003AAF300289AD9001997DE001491DB0041A3
      D900001C34009DAAA800F7FAF100FBFFFC00FFFEFF00FEFDFF00FDFDFD00FCFC
      FC00F8F9F700E3E4E200E4E6E700EAE6E100F3E4D100C5AC8C00BF9E7700BE9C
      7800D6BFA500FBECDC00F0EAE500EAEAEA00E7EAEE00EAECED00F3EBE400CEB9
      A400C59E7200CDA16C00C9A17100D7B99600FBECDC00EEE9E600E9E7E600DFE1
      E100FDFCFE00FDFCFE00FDFDFD00FCFDFB00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EBEBEB0093929200949393009493930095939300959494009594
      94009694940096949400969595007C7A7A007A77770096959500969494009694
      9400959494009594940094939300949393009593930091909000DFDFDF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFFFB00E1CDAA00C42F2B00D51C
      4400D81E4C00D3254700D12C4F00D62A4C00D9294E00D7325500D92A5000E42C
      5400B5244400CE8A9B00FFF6FD00FFFEFF00FDFEFC00FCFEFE00FFFBFE00C988
      9700AF1B3900DD284F00DA2C5400D7295100D72C5200DE2E4B00CF264D00E024
      4D00D71E4800D31A4200C7383500CFCCA600FFFFF500ECFFFF00F8F7FB00B3A5
      9F0000091A001D9FDA000EBAFF000DB2F10000BBEB0008BDEF000EC3F50009C5
      F60005C4F10017D1FA000FCBEE000ED2F0000ED1F70011D0F7000CC3EF0014C1
      F30016B7EE001CB4EF0015A3E400159EE2001C9BE0001397E4001E99E300429C
      D200001F3600A9AEAF00FFFFFB00FFFFFF00FEFDFF00FEFDFF00FFFDFF00FFFF
      FF00FAFBF900E5E6E400E3E5E500EAE9E500F1E8DA00EFDEC900EFD7BB00E4C8
      AA00FFE8CD00EDD6C000F2E3D300F4ECE500EDE9E800EEE9E600FBEDE100FFEA
      D200EAC79C00CAA67800C4A78200F8E5CA00F5EBE100ECE8E700E7E7E700E4E6
      E600FBFAFC00FDFDFD00FEFEFE00FEFFFD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00BFBEBE00B7B7B700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F4FFFC00D9D2AB00C7443B00D838
      5600D83B5D00D3405600CE425900D43E5600D73A5500DC415C00DC365300DC36
      5300AE3D5100FFDBE300FFFEFF00FFFBFF00FDFFFE00FFFFFF00FFFFFF00F4D2
      D800A6334700DC395500E03D5C00D93D5B00D3415F00DB435600CD3C5800DE3E
      5A00D93D5C00D9395700C74B4100C5CDA400FCFFF600ECFFFF00FFFEFF00ABA3
      9C00001622002BB1E10005BAFF0000B3F00017C4EA0008BFE60009D0F70000D0
      F80000CDF5000ED8FD0014D0F30019CCEC0013B0E80013ABE4000F9ED8001294
      D0001185C400167EBF00116FB1002982C5001897DB001A96DD0045AEF1002F73
      A200031D2E00CFCDCD00FFFFFC00FFFFFF00FFFDFF00FFFEFE00FEFEFE00FFFF
      FF00FBFBFB00EAEAEA00E4E6E700E7E8E600EEEBE300F8EFE200FDEDDC00FFF1
      D900F0CDAB00C7A37D00D5B99A00FFF3DA00FFF0E000F3E4D400F6E0C700F5DC
      BA00FDE3BB00ECD6B200D4C4AD00F9F0E300EDEAE600EAE9EB00E9E9E900EBEB
      EB00FDFDFD00FDFDFD00FFFEFE00FFFEFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00BCBBBB00B5B4B400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6FFFC00D4D2A900CE554500DA4C
      5F00D74E6300D0515A00CC505C00D24B5900D74D5E00D94D5E00E6506000D344
      5300B45F6700FFF9F900F3FFFF00FFFDFF00FBFFFF00FFFCFD00FAFFFE00F8EF
      EC00AC566000DB495B00DE4D5C00D24F5C00CF4C6000DA515900CB4C5B00DB51
      5D00D7526200DD4F6200CD584900C5CEA300FFFFFC00F0F9FC00FFFEFF00B0AE
      A600000E14001799BC000DC5FB0000C0F7000CC7FA0005C1EA0011C1E00016B3
      CD000FA1BF000795BE000C93C9000482C3000A74C7000D78C9001680CD001F89
      D000208ACA000570AA0000649A00046EA3003EA0CE003D97C600175B8800001E
      3A00646C7300FFFFFB00FFFCF800F8FFFF00FFFEFE00FEFEFE00FEFEFE00FEFE
      FE00FDFDFD00F1F1F100E7E9EA00E9E9E900EBECEA00F0ECE700F9EDE100E4CC
      B600CEA67C00D1A57600D0AB7F00F9DCB700FFF0D600D5BFA300C3A47D00C7A7
      7C00CEB58D00FFEED100FBF2E500EEEBE700ECEBED00E8E9ED00EAE9EB00F0F0
      F000FFFFFF00FDFDFD00FFFEFE00FFFEFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00BDBBBC00B5B5B500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFC00D8CFA400D7634C00E15C
      6600DB616900D7646100D7656500E2616600D7616600D65E6200E6656800D85B
      5D00B8737000FFFFF900EDFEFB00FFFDFF00FDFFFF00FFF9FA00F5FFF900FFFD
      F500B46A6A00DC5C6100E0616300D2656300DA5F6900E5676300D8636400DF64
      6200D8606400E35F6600D6614C00CACC9E00FFFEFF00F0F4F500FFFEFE00F2EF
      EA00212D330000384E00108CB50018AEDD000099E9000078B4003285A5009FBB
      CC00A1B9CD00296E95000070B3000082DA000083CC00007DC3000682C2002392
      CA003294C200156D9200136382000047630000253300001426001D3646008E96
      9D00FCF6F100FFFFF700FBFDF700F4FFFF00FFFFFE00FFFFFE00FEFEFE00FDFD
      FD00FCFEFF00F3F5F600E8E8E800E8EAEA00EAECED00EDECE800F7EDE300C8B1
      9700D9AF8200DEAC7700D7AB7C00D8B58A00FFF5D200E9C9A500D5AA7700D9AC
      7900C9A98000F9E4C900F6EDE300EBEBEB00EBEDEE00EAEBEF00EBEAEC00F3F2
      F400FEFBFD00FFFEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C1C0C200B8B8BA00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFE00D7CBA100E06F5400E66C
      6C00DD716D00D9746500DC756C00EB736E00D9716C00D5726A00DB6F6400DE72
      6700BA756B00FFFAF000F6FFFE00FEFAFF00FFFEFF00FFFEFE00F8FFFB00FFFE
      F400B86A6400E36E6900DC746700D3796800DF6F6F00EB786900DC766A00E073
      6500D66F6600E56D6D00DD6C5200CFCB9A00F8F8F800F8FFFF00F2EDEC00FFFE
      FF00F1DCE4004A566200000520001D517900127ED0001875AD006F99B000E6D7
      DB00F7E9EB006691A6001472A7000671C2000D769F00005F8600004263000027
      410000021600273240009D97A200C6B9C10027322A004E535100F8F3F400FFFF
      FC00FFFFF800FFFFF800FDFFFC00F8FFFF00FDFFFE00FDFFFE00FFFFFF00FEFE
      FE00FFFFFF00F9FBFB00ECEEEE00EAECED00ECEEEF00EEECEB00F7F0E700F6E1
      CB00D4AE8400D9AC7900DAAE7F00D2AB7F00EBCAA300D2AF8700DDAE7A00DAAD
      7A00CFB18E00D7C6B100FCF4ED00EEEEEE00ECEEEF00ECEEEF00EAECED00FBFA
      FC00FFFDFF00FFFDFF00FFFEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F6F4EA00E7E1C300E7E1C100C6C1A500C3BDA200E7E1C200E6E0C200F3F0
      E200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00D2CDA000E37F5D00E57E
      7500D9827200D5836A00D8827000E87F7200E4827600DB877500DD846F00EA84
      7100CC7F6F00E9CFC300FDFFFE00FFFBFF00FFFDFF00FFFFFF00F9FFFA00EDCF
      C400D3746B00EC7F7100D9836B00D7896C00DC7D7400EA866E00DA856F00DC82
      6900D3826D00E9837700E0795900CBCD9900FFFFFE00F8FFFC00FDFFFF00FAFF
      FF00FFFCFF00FFF6F5009A89920000011600003263001A6A87008FC6CD00D6DB
      D900E7E1DC006E8489000D2C430009103B001C13270052485900867C89008378
      82001B1013007E727200E2D6D200FFFFF9008A887E003F393400FFFEFF00FFFD
      FF00F3F3F300FDFFFF00FFFFFF00FFFCFE00FFFFFE00FEFFFD00FFFFFF00FEFE
      FE00FEFEFE00FCFEFE00F2F7F600E9EDEE00EEEDEF00F2F0F000F1EEEA00FBF2
      E500EFD7BB00CFAE8700D6AF8300ECC59900D3AF8900CFAB8500D6AF8300CEAD
      8600EBD8C300FEF5EB00F5F1EC00F2F1ED00EDF0EE00EAECEC00F5F7F700FDFF
      FF00FEFEFE00FFFEFF00FFFDFF00FFFDFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFA
      F400C2B46B00B9A85400B9A85400BDAC5400BEAC5400B9A85400B9A85400BDAD
      5E00F6F4EA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00CDCFA100E38A6500E68E
      7E00DB927C00D5947500D9917900E98D7C00EA8B7B00DA907800E3967B00E787
      6F00E18B7900B8928600F6F1EE00FFFDFF00FFFAFF00F4F9F800ECF1E800BC8E
      8600F2877F00F58C7900DC907300DE967400DE8C8000EB957700DA947700DC94
      7200D5947800ED958500DF836000C5CE9600FFFBFB00FBFFFC00F5FDFC00E5FC
      FE00FFFFFE00FFFFF400FFFFF800BAC6CA003B243A000C142100848C9300F2DC
      E100F7E5E6004F625900253D3300CAC6C100D8D9D700E2E3E100DADBD9009EA1
      9F000001000082878600CFD4D300F6FBFA007F807C004F4C4E00FCF9FF00F5F7
      FF00F6FCFF00F3F6FE00FFFDFF00FFFBFF00FDFEFC00FDFEFC00FFFFFF00FFFF
      FF00FEFEFE00FDFFFF00F9FEFD00F2F4F400EFEDED00EFEDED00F2F2F200F6F2
      ED00FFF3E300ECD8BF00F1D5B600E8CCAA00D9BD9F00D8BDA200DAC0A200DAC5
      AF00FDF4EA00F3F0EC00F5F2EE00F3F2EE00EDEEEC00ECEFED00FBFEFC00FFFF
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6F3
      E800BAAA5700B9A85400B9A85400B9A85400B9A85400B9A85400B9A85400B9A8
      5400F0ECD900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF200E7C8A900D4966800EC9E
      7300EB9E8300E39C8800E29C7F00ECA17A00E39E8300DE9B8000DB9A7E00DE9F
      8300D99F8200CF997B00DBA78900FAC6A800FFE2C100ECC9A800D1AA8A00C99B
      7C00D29E8000DCA48700E2A38700E09F8300E9A77400E99E7700E5997C00EAA4
      8600E39C7600EBA07400D1966E00E2C09C00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E6E6E600000000008C8C8C00DFDF
      DF00E6E6E6006060600047474700B6B6B6008686860047474700181818000000
      00001A1A1A0082828200D5D5D500FCFCFC008787870044444400FFFFFF00FCFC
      FC00FFFFFF00FFFFFF00FFFFFF00FBFBFB00FFFFFE00FFFFFE00FFFFFF00FFFF
      FF00FEFEFE00FDFFFF00FCFEFE00F6F9F700F3F1F000F3F1F100F2F1F300F2F0
      F000F6F3EF00FBF5EE00FEF5E800FFF4E600FFF9EF00FFF7ED00FFF7EE00FDF7
      F000F2F1ED00F2F3F100F2F3F100F0F0F000F1F3F300F8FAFA00FEFEFE00FDFD
      FD00FDFDFD00FEFEFE00FEFEFE00FDFEFC00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6F4
      E900BCAB5B00B9A85400B9A85400B9A85400B9A85400B9A85400B9A85400B9A8
      5400F0EDDB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF200DBC5A200D3A36F00F1B3
      7D00E6AB8300E1AB8C00E3AE8900E7AF8000EEAD8700ECAB8500E8A98300E8AD
      8600E8AF8800DEA78000D8A47C00DEAB8300DBA27B00DDA27B00E2A37D00EAA6
      8100F1AA8500F5A98500F3A58100F2A17E00DCAA7500EFB58B00E5AB8800DDA8
      8300E7AE8100F3B68400CC9E6F00DDC59B00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E0E0E0000E0E0E0083838300E1E1
      E100E6E6E600636363000808080000000000040404001D1D1D004F4F4F007F7F
      7F009D9D9D00C8C8C800F4F4F400FCFCFC005C5C5C0061616100EFEFEF00FFFF
      FF00FFFFFF00FBFBFB00FFFFFF00FFFFFF00FEFFFD00FEFEFE00FFFFFF00FFFF
      FF00FCFEFE00FDFFFF00FCFFFD00FCFDFB00F8F9F700F4F2F200F2F1F300F4F3
      F500F2F4F500F4F4F400F3F4F200F5F3F200F8F4F300F7F5F500F5F5F500F3F5
      F500F3F5F500F2F4F400F2F2F200F1F1F100F6F8F800FDFDFD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFE00FFFFFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6F4
      E900BCAB5B00B9A85400B9A85400B9A85400B9A85400B9A85400B9A85400B9A8
      5400F0EDDB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF900D5C5A800CEA97500EDC0
      8700E1B78800DFBB9500E2BE9800DDB68A00E1B48F00E1B59000DFB38E00DDB3
      8E00E0BB9500E1BD9700DBB79100D6B58E00DCB58F00E0B99300E4BD9700E6BC
      9700E2B89300E2B69100E4B89300E6BA9500DEBC8E00DFB38E00DBAF9000DEB6
      9300E8BB8F00EFBC8A00C5A07400D5C69F00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EBEBEB000606060087878700EDED
      ED00E5E5E500A1A1A1006060600086868600AAAAAA00C8C8C800D9D9D900EBEB
      EB00F3F3F300FCFCFC00FAFAFA00C8C8C80017171700BABABA00FFFFFF00FFFF
      FF00F7F7F700FEFEFE00FDFDFD00FEFEFE00FFFFFF00FEFEFE00FFFFFF00FDFF
      FF00FFFFFF00FFFFFF00FEFFFD00FFFFFE00FDFDFD00FAFAFA00F6F5F700F2F1
      F300F4F3F500F6F5F700F4F4F400F5F5F500F8F6F600F9F7F700F7F5F500F6F6
      F600F4F4F400F4F5F300F5F5F500FAFAFA00FDFDFD00FFFFFE00FFFFFE00FEFF
      FD00FEFEFE00FEFEFE00FFFEFD00FFFFFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6F4
      E900BCAB5B00B9A85400B9A85400B9A85400B9A85400B9A85400B9A85400B9A8
      5400F0EDDB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8FB00DBC7B500CFAE8100F3CC
      9500E5C29000D3B58C00DABD9600E6C59E00F7C49200FAC79500F8C59300F2C1
      8F00F1C28F00F5C69300F5C89500F4C79400EFC79300EEC79300ECC59100E8C3
      8F00E7C28E00E5C38E00E4C48F00E6C69100E2CA9400EAC99C00E7C59A00DCBE
      8D00ECC78D00F8CC9100D2B27D00E0D6A700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F3F3F300161616007D7D7D00FFFF
      FF00FAFAFA00EEEEEE00DADADA00EAEAEA00F2F2F200FFFFFF00FBFBFB00EEEE
      EE00D4D4D400ADADAD006B6B6B001919190085858500FFFFFF00FFFFFF00FDFD
      FD00FFFFFF00FFFFFF00F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFF
      FF00FFFFFF00FFFFFF00FEFFFD00FFFFFF00FFFFFF00FEFEFE00FEFEFE00FBFB
      FB00F7F6F800F6F6F600F6F6F600F5F5F500FAF8F800F9F7F700FAF8F800F9F7
      F700F7F7F700F8F8F800FCFCFC00FDFDFD00FCFDFB00FDFEFC00FEFFFD00FFFF
      FE00FFFFFF00FFFFFF00FFFFFE00FFFFFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6F3
      E800BCAB5B00B9A85400B9A85400B9A85400B9A85400B9A85400B9A85400B9A8
      5400F0ECDA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFC00F1DCC700C9AA7D00ECCA
      8E00FBDEA100EBCF9900E6CB9900EDCD9C00E9C9A000ECCCA300EFCFA600EFCF
      A600EACAA100E4C69D00E4C69D00E6C89F00EFC8A100EEC7A000EBC79F00ECC9
      A100EDCDA400EDCFA600EBCFA600EACEA500DEC39100EFCCA100ECC8A000E9CB
      9C00FCD8A200EDC18C00C8A67B00F6ECCA00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006B6B6B001B1B1B00A1A1
      A100FFFFFF00FFFFFF00FFFFFF00E5E5E500CCCCCC009D9D9D006A6A6A003131
      3100131313002C2C2C006C6C6C00B1B1B100FFFFFF00FFFFFF00F6F6F600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00FDFFFF00FDFFFF00FDFFFF00FDFFFF00FFFFFF00FFFE
      FF00FFFFFF00FDFDFD00F7F9F900F8F9F700FCFAFA00FCFAFA00FCFAFA00FFFD
      FD00FDFDFD00FFFEFF00FEFDFF00FEFEFE00FDFFFE00FFFFFE00FFFFFE00FFFF
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6F4
      EA00BAA95500B9A85400B9A85400B9A85400B9A85400B9A85400B9A85400B9A8
      5400F0EDDB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF800FFFCE100D2C09100D7C0
      8200F1D99700FEE8A700FFE6A800F8DC9F00E7E0A700E3DCA300E7E0A700EFE6
      AD00EDE4AB00E9E0A700E9E0A700EAE1A800F4E0A900F4E0A900F3DFA800F0DF
      A700ECDDA500EADDA500ECDFA700EEE1A900FFE6AD00F7D7A200FADAA900FAE2
      AC00F0D49800DDB88400D8C19B00FFFFE800FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFBFB00FFFFFF005C5C5C000C0C
      0C003232320059595900585858002F2F2F00222222003434340076767600B2B2
      B200E3E3E300FAFAFA00F4F4F400FFFFFF00FFFFFF00F8F8F800FFFFFF00FFFF
      FF00F8F8F800FEFEFE00FFFFFF00FDFDFD00FDFFFF00FDFFFF00FCFEFE00FFFF
      FF00FFFFFF00FFFFFF00FDFFFF00FDFFFF00FDFFFE00FDFFFE00FFFFFF00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FFFFFF00FEFEFE00FFFFFF00FFFFFF00FDFD
      FD00FFFFFF00FFFEFF00FFFEFF00FFFFFF00FCFEFE00FFFFFE00FFFFFE00FFFF
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFD
      FC00D4CA9700BFB06300BFB06300BFB06300BFB06300BFB06300BFB06300CEC2
      8700FBFBF600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7FFFF00FFFFF800FAF3D800D8CC
      A200BEAF7E00C4B17E00CAB48000CFB78300DBC47400D3BC6C00D4BD6D00D8BF
      6F00D5BC6C00D7BC6C00D9BE6E00D7BC6C00D4BB6B00D7BE6E00DAC17100DAC1
      7100D8BF6F00D6BD6D00D6BD6D00D7BE6E00CCBD7500CBB57400D0BE8100C5BC
      7C00BEB27000E6D59D00FFFFDE00F6FFF100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFAFA00D0D0
      D000939393007D7D7D008C8C8C00C2C2C200EFEFEF00FEFEFE00FFFFFF00FCFC
      FC00FCFCFC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFB
      FB00FFFFFF00FFFFFF00FBFBFB00FEFEFE00FDFFFE00FDFFFE00FDFFFE00FDFF
      FE00FFFFFF00FEFEFE00FEFEFE00FFFFFF00FFFFFE00FFFFFE00FDFFFE00FFFF
      FF00FEFEFE00FFFDFD00FFFEFE00FFFFFF00FDFFFF00FDFFFE00FDFFFE00FEFF
      FD00FEFEFE00FFFEFE00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFCFE00FFFDFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EBF9FF00EDF6FF00FFFFFF00FFFF
      F500FFF2DC00FFF3D800FEE9CA00FFEFCF00F8E8DC00F6E6DA00FBEBDF00FCEA
      DF00FAE6DB00FCE8DD00FFEBE000FDE7DC00F8E8DC00F7E7DB00F7E5DA00F9E5
      DA00FAE6DB00FDE7DC00FFE7DD00FFE7DD00FFEDCE00FFEBD300FCE4D000F8EC
      D400FFF7E100FFFBF200FFFBFF00E5F7FF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFBFB00FEFEFE00FEFE
      FE00FFFFFF00FFFFFF00F9F9F900FFFFFF00F9F9F900FFFFFF00FAFAFA00FFFF
      FF00FFFFFF00FDFDFD00FFFFFF00FCFCFC00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FDFDFD00FDFDFD00FFFFFF00FFFFFF00FBFFFA00FCFFFB00FBFFFC00FBFF
      FC00FFFFFF00FFFFFF00FEFEFE00FFFFFF00FDFEFC00FFFFFE00FDFFFE00FDFF
      FE00FFFEFE00FFFEFE00FFFEFF00FFFFFF00F9FBFB00F9FEFC00FCFFFB00FBFF
      FA00FFFFFF00FFFEFE00FFFFFF00FFFFFF00FDFCFE00FDFCFE00FFFFFF00FFFF
      FF00FFFEFF00FFFEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FDFFFF00FFFEFF00FFFF
      FF00FDFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFF00FDFFFE00FFFFFF00FEFD
      FF00FFFFFC00FFFFFF00FFFEFF00FFFEFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFF00FFFFFF00FFFFFF00FDFF
      FF00FFFFFF00FFFEFF00FEFEFE00FFFFFE00FFFFFE00FFFFFF00FBFFFF00FFFF
      FF00FFFEFF00FFFEFF00FFFFFE00FFFFFF00FEFEFE00FFFFFF00FFFFFE00FDFF
      FE00FDFFFF00FDFFFF00FFFEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F6F600ECEC
      EC00F4F4F300F8F8F700F8F7F700F8F7F700F8F7F700F8F7F700F8F7F700F8F7
      F700F8F7F700F8F7F700F8F7F700F8F7F700F8F7F700F8F7F700F8F7F700F8F7
      F700F8F7F700F8F7F700F8F7F700F8F7F700F8F7F700F8F7F700F8F8F700F4F4
      F300ECECEC00F7F7F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFFFF00FCFEFE00FFFEFF00FFFF
      FF00FFFFFE00FFFFFF00FDFFFF00FFFFFF00FFFFFF00FDFCFF00FFFFFF00FFFF
      FE00FFFFFF00FFFFFF00FEFFFD00FFFFFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FFFFFC00FFFEFF00FFFFFF00FFFF
      FB00FDFFFF00FFFEFD00FFFFFF00FEFFFD00FDFFFF00FFFEFE00FFFFFE00FDFF
      FF00FEFEFE00FFFFFF00FFFFFE00FFFEFF00FFFFFF00FCFEFF00FFFFFF00FFFF
      FE00FFFFFC00FFFFFF00FFFFFC00FFFEFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EDED
      ED00D6D5D400D3D2D100D4D3D200D4D3D200D4D3D200D4D3D200D4D3D200D4D3
      D200D4D3D200D4D3D200D4D3D200D4D3D200D4D3D200D4D3D200D4D3D200D4D3
      D200D4D3D200D4D3D200D4D3D200D4D3D200D4D3D200D4D3D200D3D2D100D6D5
      D400EDEDEC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFE00FFFFFF00FFFFFF00FFFF
      FC00FDFFFF00FDFEFF00FFFFFF00FFFFFE00FAFFFE00FFFFFF00FFFFFF00FAFE
      FF00FFFFFF00FFFFFC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFFFE00FCFEFE00FEFDFF00FFFF
      FC00FCFFFD00FEFEFE00FCFEFE00D1E3FA00E2ECFD00FFFEFF00FDFFFF00FFFF
      FF00FDFFFE00FAFFFF00FDFFFE00FEFDFF00FEFFFD00FFFFFE00FBFFFE00FFFE
      FF00FFFEFF00FFFEFF00FDFFFF00FDFFFF00FFFFFF00FFFFFF00FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00FEFEFE00FFFFFF00FEFEFE00FFFFFF00FFFFFF00FEFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFF00FCFEFE00FFFFFF00FEFE
      FE00FDFFFF00FFFFFF00FFFFFF00FDFFFE00FFFEFF00FFFDFC00FFFFFE00FDFF
      FC00FEFDFF00FFFEFE00FDFEFF00FFFEFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FEFDFF00FFFFFF00FEFFFD00FFFF
      FF00FDFFFF00FFFEFF00FFFEFE00C5DAF5005B96E600559CF4008FC8FF00E7F2
      FF00FFFFFE00FCFFFB00FFFFFF00FFFEFD00FFFFFB00FBFFFF00FDFFFF00FEFF
      FD00FDFDFD00FFFFFF00FFFFFE00FDFFFF00FFFFFF00FFFFFF00FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFEFE00FFFFFF00FEFEFE00FFFFFF00F7F7F700C7C7C700F0F0F000FFFF
      FF00FFFFFF00FFFFFF00FEFEFE00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C1DFFD004DA4F8003D9BF700419DF800419DF800419DF800419DF800419D
      F800419DF800419DF800419DF800419DF800419DF800419DF800419DF800419D
      F800419DF800419DF800419DF800419DF800419DF8003E9CF700419DF800A0CE
      FB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFF00FCFEFF00FCFFFD00FAFE
      FF00FEFEFE00FFFFFB00FBFFFF00FFFBFA00F7CAA900F8B88100FDECD900FEFE
      FE00FDFFFE00FAFEFF00FDFFFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FDFFFE00FFFDFC00FFFFFF00FFFE
      FD00FCFEFE00FCFEFE00BCD2F5005B94E900337BE1004B95F50058ACFE008DC3
      FF00E1EEFE00FDFFFF00FFFEFF00FCFEFE00FEFFFD00FFFFFE00FFFDFD00FFFF
      FE00FDFFFE00FBFFFF00FFFEFD00FFFEFF00FFFFFF00FFFFFF00FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFEFE00FFFFFF00D8D8D800959595008585850091919100B0B0B000B5B5
      B500D8D8D800FAFAFA00FEFEFE00FFFFFF00FEFEFE00FEFEFE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D5EA
      FD003597F70075B8FA00CCE5FD00CEE6FD00CDE5FD00CDE5FD00CDE5FD00CDE5
      FD00CDE5FD00CDE5FD00CDE5FD00CDE5FD00CDE5FD00CDE5FD00CDE5FD00CDE5
      FD00CDE5FD00CDE5FD00CDE5FD00CDE5FD00CDE5FD00D0E7FD0094C8FB003396
      F700ADD5FC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFC00FFFEFD00FEFFFD00FEFD
      FF00FFFFFF00FDFFFF00FCDCC900F69B5E00ED7A2900F8994900FDB56100FECC
      9800FEF5EB00FCFEFE00FFFFFF00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFDFF00FDFFFF00FEFEFE00FBFE
      FF00D5E3FA006FA1E9002673E100397DE2008FB9EE00CEE5FB008CC7FF004AA2
      FF0057ABFD00A1CFFE00E8F4FE00FDFFFE00FEFEFE00FCFEFF00FFFFFE00FFFD
      FF00FFFFFC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00FEFEFE00FEFEFE00FFFFFF00FEFEFE00FFFFFF00FFFF
      FF00FFFFFF00A3A3A3008686860087878700A3A3A300DCDCDC00CECECE00B0B0
      B000AFAFAF00BBBBBB00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FFFFFF00FEFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0094C8
      FB0048A1F800F9FCFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0079BA
      FA005EACF900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFF00FEFEFE00FDFFFE00FDFF
      FF00FEEBDE00F5AA7600EE7A2D00F0873E00F7C7A500FCF3E600FDCF9F00FFB0
      5900FCB26000FFD8AB00FFFAF100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FFFFFF00FAFDFF00ECF3FC008EB5
      EC00377EE0002674DE0072A4EC00DBE6FA00FFFEFD00FDFFFF00FEFEFE00C9E4
      FF0072B7FF00499FFF0067B0FF00B2D6FE00F9FDFE00FFFFFF00FFFFFF00FFFF
      FF00F9FEFF00FFFEFF00FDFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7
      F700BBBBBB0086868600858585008E8E8E00FFFFFF00FFFFFF00FFFFFF00C4C4
      C400B0B0B000AEAEAE00C4C4C400EAEAEA00FFFFFF00FFFFFF00FEFEFE00FEFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0087C1
      FA005BABF900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0094C8
      FB0051A5F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FDFEFF00FFF6F300FABD
      9500F0813800EE7E3200F7B38400FDF3EC00FFFEFF00FEF7F400FFFFFE00FCEE
      DC00FFC58400FDAD5400FEBA6F00FEDFBE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7FD00AAC7F3004585E3002270
      E100568FE400C5DAF600FDFFFF00FCFEFF00B2CCF40073AEF400DEEFFC00FFFE
      FF00F7FCFD00AAD6FF005BACFD0042A0FF007ABBFF00FFFEFF00FFFEFF00FEFF
      FD00FDFFFF00FFFFFF00FFFEFF00FDFFFE00FFFFFF00FFFFFF00FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00FEFEFE00FFFFFF00FFFFFF00E2E2E200868686008686
      860086868600EFEFEF00FFFFFF00FFFFFF00E1E1E100ACACAC00DBDBDB00FFFF
      FF00FFFFFF00FAFAFA00B0B0B000AFAFAF00B0B0B000EFEFEF00FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0087C1
      FA005BABF900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0094C8
      FB0051A6F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8D0B400F28C4B00EE77
      2800F39F6500FEE4D400FDFFFF00FFF0E700F4AC7D00F5A25700FFDFBB00FFFB
      FA00FDFFFF00FEE2C400FFBC7100FFAC4D00FDF1E500FFFFFC00FFFFFE00FFFF
      FF00FFFFFF00FDFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFF
      FF00FFFFFF00FEFFFD00FFFFFF00FCFEFF008DB5EF00176ADD004483E500A3C4
      F200FAFCFC00FFFFFF00D2E3F800619AE9004E8EE30087BBF70060AEFF0097CC
      FE00EDF6FF00FDFFFF00E9F3FD0092C8FF006AB2FF00FFFFFF00FDFFFF00FEFE
      FE00FFFFFE00FDFFFF00FFFFFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A4A4A40088888800878787009595
      9500E0E0E000FFFFFF00FFFFFF00F0F0F0008686860091919100B0B0B000EAEA
      EA00FFFFFF00FFFFFF00F4F4F400CACACA00B0B0B000EBEBEB00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0087C1
      FA005BABF900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0094C8
      FB0051A6F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBF1EA00EE853C00F18D4500F6D1
      B500FFFEFF00FCFAF900F6BF9800F1904C00F5B48700FFE4CA00FBC58600FDC0
      7C00FFE7CF00FFFFFF00FDFCF200FDD0A500FBF3E600FEFEFE00FFFEFF00FDFF
      FF00FDFFFF00FFFFFF00FFFFFF00FDFFFF00FDFFFF00FDFFFF00FDFFFF00FDFF
      FF00FFFFFF00FFFFFE00FFFFFF00FFFEFF0084B0EB007BA8EB00E7F2FA00FEFF
      FD00E7EEFD007FAAED004686E50088B6EC00F0F6FD00FCFEFF00DAEBFE007ABD
      FC0068B2FF00B0D7FE00FCFEFE00FDFFFF00B6DAFE00FFFFFE00FFFEFE00FDFF
      FF00FCFEFF00FFFEFF00FFFEFF00FFFFFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008585850085858500C9C9C900FFFF
      FF00FFFFFF00F5F5F500C4C4C4008E8E8E00BBBBBB00F6F6F600D8D8D800B0B0
      B000C9C9C900F5F5F500FFFFFF00FEFEFE00EBEBEB00EAEAEA00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0087C1
      FA005BABF900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0094C8
      FB0051A6F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFEDE200F8C7A700FDF7F200FDFF
      FF00F9D6B500F1965900F3A06800FCE5D600FDFFFE00FEFEFE00FFFFFF00FFE1
      C400FDBD7600FCC88C00FFF3E300FCF9F100FFFDF500FDFFFF00FFFEFE00FFFF
      FF00FFFFFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FEFDFF00F4F7FC00DFE9FB00FEFEFE00F3F9FE009BBE
      F0004687E30071A5EB00DCE8FA00FFFEFF00E7F0FA00CCE2FB00F9FDFE00FFFE
      FE00C1E1FE006DB4FE0075BAFF00D2E6FF00C4E2FF00FCFEFF00FFFFFE00FFFF
      FF00FEFDFF00FFFFFE00FFFDFF00FFFFFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D9D9D900FFFFFF00FFFFFF00E8E8
      E800A4A4A40095959500E0E0E000FEFEFE00FFFFFF00FFFFFF00FEFEFE00FFFF
      FF00F0F0F000C4C4C400B9B9B900E6E6E600FFFFFF00EBEBEB00FDFDFD00FFFF
      FF00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0087C1
      FA005BABF900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0094C8
      FB0051A6F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFEFE300FCF7F600FAEADA00F2A2
      6700F1945500FDD4BB00FFFFFE00FFF9F400F5B78E00F9A76600FFE7CB00FFFF
      FF00FEFBF600FCD6A600FCBE7800FFCA9100FFF9F000FDFFFF00FFFFFE00FFFF
      FF00FFFFFE00FFFFFF00FFFFFF00FEFFFD00FFFFFF00FFFEFD00FFFFFF00FFFF
      FF00FFFFFF00FFFEFF00FDFEFF00F3F7FC00E4ECFD00C0D5F4005892E4005493
      E400C5D8F300FFFEFF00FFFFFE00A9C6F200538EE4004D9AF10080C1FE00DAE9
      FF00FCFEFE00F4FAFF00ADD6FD0061ADFF0078B9FE00FFFFFF00FEFEFE00FCFF
      FD00FFFFFE00FFFFFE00FDFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E0E0E000FFFFFF00B4B4B4008686
      86008E8E8E00FFFFFF00FFFFFF00FFFFFF00C3C3C30098989800CECECE00FFFF
      FF00FEFEFE00FFFFFF00BABABA00B0B0B000C3C3C300EAEAEA00FFFFFF00FDFD
      FD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0087C1
      FA005BABF900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0094C8
      FB0051A6F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCF1E900F6B48400F08E4800F8C0
      9D00FDFAF600FEFEFE00F7CFB200F2915200F5A77200FBD9BB00FFC37D00FCC5
      8800FFEEDB00FDFFFF00FFF3E900FFCB8F00FFF3E500FEFFFD00FDFFFF00FCFE
      FF00FFFFFF00FFFFFF00FFFFFF00FDFFFF00FDFFFF00FFFEFF00FEFEFE00FFFF
      FF00FFFFFF00FEFFFD00FFFFFF00FAFEFF008DB5EF004287E400A1C2F000FDFC
      FE00FDFFFF00CADDF8005C94E5005390E600B2CCF400F2F8FD009DCEFF0065B0
      FE0092C8FF00EBF5FF00FEFEFE00E8F4FE0092C8FD00FFFEFD00FFFDFC00FDFF
      FE00FAFEFF00FFFFFE00FDFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E3E3E300C1C1C10086868600B2B2
      B200F7F7F700FFFFFF00FFFFFF00D9D9D90086868600A5A5A500B0B0B000D9D9
      D900FEFEFE00FEFEFE00FFFFFF00D7D7D700B5B5B500EBEBEB00FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0087C1
      FA005BABF900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0094C8
      FB0051A6F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAEEE200F9B78E00FFF0E700FFFF
      FF00F9E0D000F59D6100F2985D00FAD7C300FFFFFE00FFFFFF00FFFEF900FDDA
      AF00FFBD7800FFCE9C00FFF8EF00FCF8ED00FFFAF300FDFFFF00FFFFFF00FFFF
      FF00FFFFFE00FFFFFF00FFFEFE00FFFFFF00FFFEFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FEFFFD00FDFFFF00F7FBFC00B9D2F400E3ECFA00FDFFFF00E3EC
      F90076A7EB004588E50099BBF100F1F7FC00FFFEFF00F8FBFF00FFFEFF00DAEF
      FE008EC6FD0064AFFE00B1D5FD00F1F9FF00C9E4FE00FCFEFF00FFFFFE00FFFF
      FF00FCFEFF00FFFFFE00FFFDFF00FFFFFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FEFEFE00FFFFFF0095959500D9D9D900FDFDFD00FFFF
      FF00F7F7F700868686008D8D8D00C3C3C300FFFFFF00FFFFFF00FFFFFF00E6E6
      E600BBBBBB00B0B0B000F0F0F000FFFFFF00FFFFFF00EBEBEB00FFFFFF00FEFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0087C1
      FA005BABF900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0094C8
      FB0051A6F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCEFE100FDFAF600FCF1E900F3AE
      7C00F1904E00F7C8A800FDFBFB00FEFEFE00F7C7A500F9B37700FFECD100FDFF
      FF00FEF7EE00FFD1A100FFBF7800FECF9B00FBF8F400FDFEFF00FFFFFF00FFFF
      FE00FFFFFC00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FFFFFE00FFFFFF00FFFF
      FF00FEFEFE00FFFFFF00FDFFFF00F4F7FB00E5EDFA00F8FBFF0092B8EE004988
      E40077A6EA00E1ECFA00FDFFFF00EEF2FD0083AEED0062A4F200B8DAFE00FCFE
      FE00FAFEFF00CFE7FF0074B9FE006FB7FF0096C7FF00FCFEFE00FFFFFF00FBFD
      FE00FFFFFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E0E0E000FFFFFF00FFFFFF00CBCB
      CB008E8E8E00B4B4B400F6F6F600FFFFFF00FFFFFF00EBEBEB00FFFFFF00FEFE
      FE00FFFFFF00D8D8D800B0B0B000CECECE00FAFAFA00ECECEC00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0088C2
      FA0058A9F800FAFDFF00F4F9FF00F3F9FF00F3F9FF00F3F9FF00F3F9FF00F3F9
      FF00F3F9FF00F3F9FF00F3F9FF00F3F9FF00F3F9FF00F3F9FF00F3F9FF00F3F9
      FF00F3F9FF00F3F9FF00F3F9FF00F3F9FF00F3F9FF00F3F9FF00FFFFFF008EC5
      FB0052A6F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDF1EB00FABD9500F08F4D00F7B4
      8300FCF3EF00FFFFFF00FDDCC800F3975C00F2A26700FDCCA400FFBF7E00FDCB
      8F00FCF4E300FFFFFF00FEEEDD00FEC38500FFF2E500FFFFFC00FFFFFF00FDFF
      FF00FFFFFF00FDFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FFFFFF00FFFE
      FF00FFFFFF00FFFFFF00FFFFFF00FAFCFD00B3CDF5004C8BE500649AE700C6D8
      F700FFFEFF00F5FAFD00A7C7F2004A88E6006CA2E900AFD1FC0075BAFF0070B8
      FF00D3E7FF00FEFEFE00F9FEFF00B2DAFD007ABBFF00FFFFFF00FEFEFE00FEFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFEFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E2E2E200FFFFFF00959595008787
      8700A5A5A500FFFFFF00FFFFFF00FFFFFF00A4A4A40091919100BBBBBB00FFFF
      FF00FEFEFE00FFFFFF00CDCDCD00B0B0B000B5B5B500EBEBEB00FEFEFE00FFFF
      FF00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0090C9
      FF00319AFF0048A5FF0047A5FF0047A5FF0047A5FF0047A5FF0047A5FF0047A5
      FF0047A5FF0047A5FF0047A5FF0047A5FF0047A5FF0047A5FF0047A5FF0047A5
      FF0047A5FF0047A5FF0047A5FF0047A5FF0047A5FF0047A5FF0048A5FF00359C
      FF005DB1FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFECE700F7B07E00FAE3D300FFFF
      FE00FDECDF00F4A97100F4925200F8CCAD00FFFCF800FDFFFF00FDF9F400FFD8
      A800FFBC7300FCD3A200FDFCF800FFF6E900FEF9F600FFFFFF00FFFFFF00FFFF
      FF00FEFEFE00FFFFFE00FDFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFE00FFFFFE00FCFEFE0096BBEF00A3C4F200F8FCFD00FFFE
      FE00C3D9F5005C94E5004E8CE600BFD7F500FBFDFD00FFFFFF00F6F8FF00AFD5
      FF0066B1FF008BC3FE00E0EFFF00FFFFFF00C2DEFF00FAFFFE00FFFDFF00FEFF
      FD00FEFFFD00FDFFFF00FFFEFF00FFFFFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008686860087878700F7F7F700FFFF
      FF00FFFFFF00CBCBCB008D8D8D0086868600EFEFEF00FFFFFF00FDFDFD00B5B5
      B500B1B1B100CDCDCD00FFFFFF00FEFEFE00FFFFFF00ECECEC00FDFDFD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CAD9
      E80095B3D10098B5D20098B5D20098B5D30098B5D30098B5D30098B5D30098B5
      D30098B5D30098B5D30098B5D30098B5D30098B5D30098B5D30098B5D30098B5
      D30098B5D30098B5D20098B5D20098B5D20098B5D20098B5D20098B5D20095B3
      D100B0C7DD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCEFDF00FEF9F600FFF7F300F6BC
      9200EF8E4A00F5BA8D00FCF9F400FFFFFF00FBD6C000F8C09100FEF2E000FFFE
      FF00FAF3E400FFCB9600FEBD7900FDD9AB00FFFBEE00FDFFFF00FDFFFF00FFFF
      FF00FFFFFF00FFFEFE00FFFFFF00FFFFFF00FFFFFE00FEFFFD00FFFFFF00FDFF
      FF00FEFEFE00FFFFFF00FDFFFF00F3F6FA00E2EEFA00FFFEFF00DAE7FD0070A2
      EA00478AE6009BBBF000F9FAFE00FFFFFE00D0E1FB00A0CAF900EEF4FF00FDFF
      FF00ECF6FD008FC8FC0064B0FF009ECDFF00B6DAFE00FCFEFE00FFFFFF00FFFE
      FD00FEFDFF00FFFFFC00FFFFFF00FFFFFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ACACAC00F0F0F000FFFFFF00FFFF
      FF00E1E1E100858585009E9E9E00E0E0E000FFFFFF00FFFFFF00FFFFFF00FAFA
      FA00CDCDCD00B1B1B100D7D7D700FEFEFE00FEFEFE00EAEAEA00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A29D
      9A0051494400534C4600544C4600544C4700544D4700544D4700554D4700554D
      4700554D4800554D4800554D4800554D4800554D4700554D4700554D4700544D
      4700544C4700544C4600534C4600534B4600534B4500524A4500524A45004F47
      4200766F6B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBEFE900F6C6A200F3945500F3A6
      7500FEEADF00FFFFFF00FDEBE000F1A67200EE7A2D00F5943C00FFB76800FFD3
      A400FEF8F100FFFDFF00FEEDD300FFC07B00FDF1E500FEFEFE00FDFFFF00FFFF
      FF00FDFFFF00FFFFFF00FFFFFF00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FDFFFF00F6FAFB00D4E1F70092B8EE004188E30082AE
      EE00E5EEFB00FDFFFF00E5EEFB0084B2EC00377BE0003D8BF00064B2FF00B0D6
      FF00F9F9FF00FFFFFF00D7E8FB007EBEFE006CB3FD00FFFFFF00FDFFFE00FCFE
      FF00FFFEFF00FCFEFE00FFFEFF00FDFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E0E0E000FFFFFF00EEEEEE00ADAD
      AD0086868600D1D1D100FFFFFF00FFFFFF00F7F7F700CFCFCF00F0F0F000FFFF
      FF00FFFFFF00EFEFEF00B1B1B100B8B8B800E6E6E600EBEBEB00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B6B5
      B500514E4F00514F4F00524F4F00524F4F00524F500052505000525050005350
      5000535050005350500053505000535050005350500052505000525050005250
      5000524F4F00524F4F00514F4F00514E4F00514E4E00504E4E00504D4D004F4C
      4D008E8C8D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBEFE500F6A87300F7D7C000FBFF
      FE00FEF5F200F7B99100EF7F3300F27E2A00F6A45C00FDCA8400FEBD6C00FFAD
      5400FFB76F00FFE1BA00FFFDFC00FDF3EC00FFF9F400FFFFFE00FFFFFE00FDFF
      FF00FDFFFF00FFFFFE00FDFFFF00FFFFFF00FFFEFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FEFFFD00FDFFFF00FAFEFF008CB4EE00538FE800D5E4F700FFFE
      FE00FAFCFD00A6C6EF004886E400276FDF003F8EE50063BBFB0053ACFD004DA2
      FE0075B6FF00C5E1FF00FDFFFF00F7FCFD00B5D9FD00FBFDFE00FFFFFF00FFFF
      FE00FFFEFE00FFFEFF00FCFEFF00FDFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00BBBBBB0095959500ACACAC00F0F0
      F000FFFFFF00FFFFFF00E1E1E1009D9D9D008686860091919100B0B0B000B4B4
      B400D8D8D800FEFEFE00FFFFFF00FFFFFF00D8D8D800EBEBEB00FEFEFE00FFFF
      FF00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F4F4
      F400757373005350500053515100535151005451510054515100545252005452
      52005452520054525200504E5200504E520054525200514F5200504E52005250
      510053515100535151005350510052505000524F5000514F4F00514F4F005D5A
      5B00DDDCDC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBEFE500FDFAF200FDFFFF00F9CB
      AC00F18F4900EB792500F4984F00FCC37E00FFCB8200FFC67B00FFD88F00FFD1
      8400FDB76400FCAD5600FFC38100FDDFBC00FEFBF600FFFFFE00FFFFFE00FFFF
      FF00FFFFFF00FFFFFE00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FFFFFE00FFFF
      FF00FFFFFF00FFFFFF00FFFEFF00F6F9FE00D3E1F800F9FDFE00FCFDFF00C1D5
      F8005D95E600286FDE003581E5005AB1EF006BC7F8006DCCF80079DAFE0061BE
      FB0050A4FF004CA6FF0086C1FF00D9EDFF00C5E1FF00FFFFFB00FEFDFF00FEFE
      FE00FFFFFE00FFFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE008787870095959500FFFFFF00FFFF
      FF00FFFFFF00B3B3B30087878700868686008C8C8C00B8B8B800B7B7B700B0B0
      B000B0B0B000BBBBBB00FFFFFF00FFFFFF00FFFFFF00EAEAEA00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F1F1F100B1B0B00096959500939292008B8989008B8989008C8A8A008F8E
      8E008A8989008E8D8D009793890098948B009897960098968E0096928600908E
      8D00898888008B8A8A008B8989008C8A8A008A89890091909000A5A4A400E3E3
      E300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFEFE800FAD8C000F3996200F178
      2800F3893C00F9B87400FAD08500FDC07000FFB15E00FCB25A00FEB86500FFCB
      8400FCDA9400FECA7E00FEAF5E00FFAB5200FDF1E500FFFFFE00FDFFFF00FFFE
      FD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFFFF00FFFFFF00FFFFFF00FDFF
      FF00FFFFFF00FFFFFF00FDFFFF00F4F7FB00E6EEFB00DEE9FD0071A5E8002D75
      E100307BDF0050A6EC006CC8F9005BB2F2003C84E200327DE30051A6EA0073D6
      FC0076D7FD0062BCFD004FA5FF0059A9FE0084BFFD00FFFFFF00FEFEFE00FEFD
      FF00FCFEFE00FFFFFE00FFFEFF00FFFFFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C2C2C200FFFFFF00FFFFFF00F8F8
      F800C3C3C300878787008585850086868600E1E1E100E7E7E700E6E6E600B3B3
      B300AFAFAF00B0B0B000C4C4C400F0F0F000FFFFFF00EBEBEB00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF009694940068656500686667009C9B9B007C7B
      7B0066656900ABA69400D3C78C00F9F8F200FFFFFF00FEFDFC00D9CE9600B6AF
      94006E6D71006C6A6A006361610079777700807E7E0094939300FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBF2E800F0894400EE7E2C00F8AC
      6400FFCD8400FEC67500FEB35D00FFB25F00FFB16200FFB46200FFB25F00FCB1
      5B00FFBA6A00FED78D00FFD88F00FFBE6B00FFF3E700FFFFFF00FDFFFF00FFFF
      FF00FDFFFF00FDFFFF00FEFEFE00FFFFFF00FDFFFF00FFFFFF00FFFFFF00FDFF
      FF00FFFFFF00FFFFFE00FFFFFE00FBFDFD009FC0F200397BE1002674DF004797
      EA0067C6F8005FBDF200438EE4003479E000347ADF00367AE5003277DE003783
      E3005DB5F10077D9FB006DCCFE0055AEFF005FAEFD00FEFEFE00FDFFFF00FFFF
      FF00FEFEFE00FDFFFF00FCFFFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FEFEFE00FFFFFF00E1E1E100E8E8E800868686008686
      860086868600C9C9C900E2E2E200C7C7C700A6A6A600A6A6A600A6A6A600D7D7
      D700E6E6E600E0E0E000B0B0B000B0B0B000B0B0B000E9E9E900FFFFFF00FDFD
      FD00FFFFFF00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CFCECE00565353005653540065636300DFDFDF006D6B
      6C00605E5F00B8AE7C00E7E0BE00FFFFFF00FFFFFF00FFFFFF00F0ECD800C0B4
      7600726F6B00545253007C7A7B00939192005653540054525200CAC9C900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF1F200F4AD6A00FDCC8000FFD9
      9400FFB86800FEAE5900FEB25F00FDB46000FDB46000FCB35D00FFB25F00FBB1
      5F00FFBD6D00FED18700FEE5AD00FFF3DB00FFFFFB00FDFFFF00FFFFFF00FFFE
      FF00FEFEFE00FFFFFE00FDFFFF00FFFFFF00FFFFFF00FFFFFE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFEFF0078A9ED003081E2005EB8F10066C2
      F5004B9AEB003478E3003479E000337BE100347CE100377DE200377DE2003676
      E2002E72DB004A9BEC0077E2FD0072DDFE0098D4FE00FFFFFF00FFFFFE00FFFE
      FE00FFFFFF00FFFFFE00FBFFFF00FFFEFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A4A4A40086868600878787008C8C
      8C00B7B7B700D4D4D400AFAFAF00A7A7A700A6A6A600A6A6A600A7A7A700A7A7
      A700B9B9B900E1E1E100D9D9D900BABABA00B0B0B000EAEAEA00FEFEFE00FFFF
      FF00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8F8
      F800B9B9B900969494006D6B6B005754540057555500ADACAC00E6E6E6006361
      62006A676600BFB47B00ECE7CF00FFFFFF00FFFFFF00FFFFFF00F8F6ED00C5B8
      780076736B005B595B00F4F4F400EEEEEE006461610055535300A6A5A500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFE00FEFBED00FDEABD00FEDF
      9A00FED48900FFC17100FFB45E00FFB25F00FEB26000FFB16000FEB96900FFCF
      8100FFE0A100FFF0D000FFFAF700FFFEFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ACD7F80071D4FA0079E7FF0059B1
      F100317AE2002F76DE00347BE300357AE100377BE400367DDF003276DF00337E
      E2004DA7EE006BCFF90093EAFE00D4F8FF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FEFEFE00FFFFFF008585850087878700AAAAAA00E2E2
      E200DBDBDB00A5A5A500A7A7A700A6A6A600A6A6A600A7A7A700A7A7A700A6A6
      A600A6A6A600A5A5A500E3E3E300E7E7E700D2D2D200ECECEC00FFFFFF00FEFE
      FE00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F4F4F4007E7D
      7D00575555005755550057555500585555006A686800B0AEAE005A5858005856
      56005A595D00B0A78000DCD19E00FFFFFF00FFFFFF00FFFFFF00E2DBB300BBAF
      7C0067666600565455009F9E9E00FAFAFA00D5D4D40087868600ADABAB00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFF00FBFFFF00FFFFFE00FFF7
      E600FEE7B900FFDE9900FDCF8100FCB96A00FFB66000FDC57600FDDB9900FEEC
      C300FDFCEE00FBFFFF00FBFFFE00FFFFFC00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFFFF00DDF9FF009FEAFF007EE5
      FE0068D1F8004B9CED00377BE0003577E000337BE0003178E0004799EA0065CB
      F6008BE8FD00C5F6FF00F9FEFF00FFFFFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C5C5C500E7E7E700E3E3E300C3C3
      C300A6A6A600A6A6A600A6A6A600A7A7A700A6A6A600A6A6A600A5A5A500A7A7
      A700A9A9A900CECECE00E7E7E700EFEFEF00FCFCFC00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A2A1A1005855
      55005856560058565600595656005956560059565600B4B3B3006C6A6A005957
      57005755570084817900C2B57A00D9CE9600E7E1C100DDD3A200C6B876009490
      810055535600585656005855550089878700FFFFFF00F8F8F80085848400E4E4
      E400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FDFFFE00FDFDFD00FFFE
      FF00FFFEFD00FFF4DE00FFE7B300FFDB8F00FDD69100FFE9B700FDF8E900FFFF
      FF00FFFFFF00FEFDFF00FCFEFE00FFFEFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFFFD00FFFFFF00FCFEFE00D4F4
      FF0095EBFD0079E4FF005EC2F800428FE6003B88E4005BBCF4007FE4FD00B6F1
      FF00F0FBFF00FDFFFF00FEFDFF00FDFFFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00F4F4F400E7E7E700E7E7
      E700DFDFDF00A7A7A700A5A5A500A7A7A700A6A6A600A6A6A600A6A6A600C7C7
      C700E3E3E300E6E6E600F9F9F900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006E6D6D005956
      560083828200BAB9B900817F7F005A5757005A58580095949400A1A0A0009E9D
      9D008483830056555800817E7500AAA17E00B7AE7E00ADA57D008B877A005856
      5A00605D5D005B59590059575700B3B2B200FFFFFF00FFFFFF00C4C4C4009290
      9000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FDFFFF00FDFF
      FF00FFFEFD00FBFEFF00FDFEFA00FFF0D600FFF4DC00FFFFFB00FBFFFF00FEFE
      FE00FFFEFF00FFFFFE00FFFDFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FCFEFF00FFFF
      FF00FAFEFF00C9F3FF0096EEFF006EDDFD0077DBFD00A7EFFF00E6FAFF00FDFF
      FF00FDFFFC00FEFFFB00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FEFEFE00FEFEFE00FFFFFF00FFFFFF00F3F3F300E9E9
      E900E6E6E600D7D7D700B0B0B000A5A5A500A6A6A600A6A6A600BABABA00E7E7
      E700EAEAEA00F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00686666005C59
      5900E1E0E000FFFFFF00E3E2E2005E5C5C005B5858008E8C8C00FFFFFF00FFFF
      FF00D1D0D0005B59590059575900565459005B595C005A585D00575558006966
      6600E1E0E000DBDBDB00AFAEAE00F1F1F100FFFFFF00FFFFFF00FFFFFF009291
      9100CDCCCC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FEFEFE00FFFEFE00FEFD
      FF00FFFEFF00FEFEFE00FEFEFE00FFFEFF00FFFFFF00FDFFFF00FFFFFF00FEFE
      FE00FDFFFF00FDFFFF00FDFFFF00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FEFEFE00FBFFFC00FDFF
      FF00FEFEFE00FDFFFF00F1FBFB00C6F3FF00D0F7FF00FDFFFF00FFFFFE00FDFF
      FF00FFFEFF00FEFEFE00FEFEFE00FDFFFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EFEFEF00E8E8E800E7E7E700E6E6E600E7E7E700EFEFEF00FEFE
      FE00FFFFFF00FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00878686009796
      9600FFFFFF00FFFFFF00D1D0D0005C5959005C5A5A00B5B5B500FFFFFF00FFFF
      FF00A9A8A8005C5A5A005C5A5A0077757500908E8E005E5B5C005C5959006967
      6700F2F2F200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDE
      DE007E7C7C00EBEAEA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFFFE00FDFEFF00FFFEFF00FEFF
      FD00FBFFFE00FFFFFF00FFFFFF00FEFEFE00FFFEFF00FEFEFE00FFFFFE00FFFF
      FF00FFFDFF00FFFDFE00FFFEFD00FBFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFDFF00FFFEFF00FEFEFE00FFFF
      FF00FDFDFD00FFFDFF00FFFFFE00FFFFFF00FFFFFE00FFFFFE00FCFFFD00FFFE
      FF00FCFEFE00FDFFFF00FDFFFF00FFFDFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FFFFFF00FEFEFE00FEFE
      FE00FFFFFF00FFFFFF00F9F9F900EDEDED00EDEDED00FAFAFA00FFFFFF00FFFF
      FF00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E3E3E300E8E8
      E800FFFFFF00FCFCFC007F7D7D005D5A5A007D7A7A00F5F5F500FFFFFF00FFFF
      FF00ABAAAA005E5B5B00615E5E00DDDDDD00FFFFFF00898787005D5A5A005E5B
      5B00E1E0E000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF007E7B7B008F8E8E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FFFF
      FE00FDFFFE00FFFEFE00FFFFFF00FFFFFE00FFFEFF00FFFFFF00FFFEFF00FDFF
      FE00FCFFFD00FFFFFF00FEFFFD00FDFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FDFFFF00FFFE
      FE00FFFFFE00FFFEFF00FDFFFE00FEFEFE00FDFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFE00FFFFFF00FFFFFF00FFFEFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FFFF
      FF00FEFEFE00FFFFFF00FEFEFE00FFFFFF00FEFEFE00FEFEFE00FFFFFF00FEFE
      FE00FFFFFF00FEFEFE00FFFFFF00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00CACACA00686565009F9D9D00F0F0F000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00DEDEDE00CECDCD00FFFFFF00FFFFFF00D7D6D6009E9D9D00D9D8
      D800FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00DDDCDC0089888800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FFFFFF00FFFE
      FF00FDFFFF00FFFFFF00FEFFFD00FDFFFF00FDFFFF00FFFFFE00FFFFFE00FCFE
      FF00FFFFFF00FFFFFE00FFFEFF00FFFFFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFFFD00FFFFFF00FFFE
      FF00FFFFFE00FEFDFF00FFFFFF00FFFFFF00FFFEFF00FDFFFE00FFFFFF00FAFE
      FF00FFFFFE00FFFFFF00FBFFFF00FFFFFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FEFEFE00FFFFFF00FEFEFE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00424D3E000000000000003E000000
      2800000080000000000100000100010000000000001000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFF8001FFF00000000FFF007FF
      FFFFFFFFC0001FFF00000000FF0000FFF9827F9F000007FF00000000FC00003F
      F102001F000003FF00000000F800001FF102001F000403FF00000000F000000F
      F000001F000400FF00000000E000000FF000001F000400FF00000000E000000F
      F000001F000C000300000000E000000FFFFFFFFF000C000100000000E000200F
      F800001F000C000100000000E000000FF800001F001C000000000000F001000F
      F800001F8000000000000000F004001FF9FE001FC000083800000000F000001F
      F902001FE000183800000000F000000FF9027F1FF8003C1900000000F0000007
      F986001FFE00FC0100000000E000800FF986001FFF007E0300000000E000C807
      F9863E1FFF007FFF00000000E0000007F9867F1FFE003FFF00000000E0401007
      F9FE001FFC003FFF00000000E1002007F800001FFC003FFF00000000E0003007
      F800001FF8003FFF00000000E0000007F807C01FF8003FFF00000000E000080F
      F800081FF8003FFF00000000E000800FF020001FF8003FFF00000000E000200F
      FFC007FFF0001FFF00000000F000001FFFE007FFF8001FFF00000000F800001F
      FFF11FFFF8001FFF00000000FC00003FFFF81FFFF8001FFF00000000FE00007F
      FFF83FFFF8003FFF00000000FF0000FFFFFFFFFFFC007FFF00000000FF8003FF
      FFFFFFFFFF00FFFF00000000FFC00FFFFFC003FFFFFF8001FFFFFFFFFFFFFFFF
      FF0000FFFFF80000FFFFFFFFE0000007FE00007FFFC00100FFFFFFFFC0000003
      F800001FFE000101FFFFFFFFC0000001F000000FE0000007FFFE00FFC0000001
      E000000780000007FFF8007FC0000001E000000700000007FFC0001FC0000001
      C000000380000007FE00000FC00000018000000180000007FE00003FC0000001
      8000000180000007FE00007FE00000030000000080000007FF00007FE0000003
      0000000080000027FE0000FFE00000030000000080000007FE00007FE0000003
      0000000080000047FE0000FFF0FF80030000000080000007FE00007FF0000007
      0000000080000007FE00007FF00000070000000080000007FE00007FF0000007
      0000000080000007FE00007FF80000070000000080000007FE00007FF8000007
      0000000080000007FE18007FF800000F0000000080000007FE00007FFC00000F
      0000000080000007FE00007FFC00000F80000001C0000007FF00C1FFFC00000F
      80000001C0000007FF8080FFFC00001FC0000003C0000017FF2100FFFE00001F
      E0000007C0000017FFA3D1FFFF00001FE0000007C0000007FFC7E3FFFF00003F
      F000000FC0000407FFFFFFFFFF80003FF800001FC000083FFFFFFFFFFF88113F
      FE00007FC0800FFFFFFFFFFFFFFFFFFFFF0000FFC007FFFFFFFFFFFFFFFFFFFF
      FFC003FFC1FFFFFFFFFFFFFFFFFFFFFF800000018000001080000000E0000001
      0000000000000004000000008000000100000000000000000000000080000001
      0000000000000000000000008000000100000000000000000000000080000001
      0000000000000000000000008000000100000000000000000000000080000001
      0000000000000000000000008000000100000000000000000000000080000001
      0000000000000000000000008000000100000000000000000000000080000001
      0000000000000000000000008000000100000000000000000000000080000001
      0000000000000000000000008000000100000000000000000000000080000001
      0000000000000000000000008000000100000000000000000000000080000001
      0000000000000000000000008000000100000000000000000000000080000001
      00000000003F0000000000008000000100000000000000000000000080000001
      0000000000000000000000008000000100000000000000000000000080000001
      0000000000000000000000008000000100000000000000000000000080000001
      0000000000000000000000008000000100000000000000000000000080000001
      0000000000000000000000008000000100000000000000000000000080000001
      0000000000000000000000008000000100000000000000008000000280000001
      00000000800000100000000080000001FFFFFFFFFC486FFFFFFFFFFF80000001
      FF00307FFC4009FFFFB835FF00000000FF40057FFC4005FFFFE01BFF00000000
      FF20007FFC0001FFFF8007FF00000000FE00027FFC0001FFFE0001FF00000000
      FF8000FFFE0001FFFB0001FF00000000FE00007FFE0001FFFB0001FF00000000
      FE0000FFFC0001FFFB0001FF00000000FF00007FFE0001FFFF0001FF00000000
      FF0001FFFC0001FFFB0001FF00000000FE00017FFE0001FFFF0001FF00000000
      FE00017FFC0001FFFD0001FF00000000FF80017FFC0001FFFF0001FF00000000
      FE00007FFC0001FFFF0001FF00000000FE0001FFFC0001FFFF0001FF00000000
      FE00027FFF8003FFFB0003FF00000000FE40047FFC0007FFFFC007FF00000000
      FF0007FFFF8005FFFF8007FF00000000FF8007FFFF8005FFFF8007FF00000000
      FE4007FFFF8005FFFFC007FF00000000FE0007FFFF8005FFFF8007FF00000000
      FE00047FFF8007FFFF8007FF00000000FE0004FFFF8005FFFF8007FF00000000
      FF001A7FFFC001FFFFE00FFF00000000FE80107FFFA009FFFFE01FFF00000000
      FE0000FFFFA001FFFFE01BFF00000000FFE01FFFFFA001FFFFA013FF00000000
      FFE007FFFF8001FFFFE013FF00000000FFE00FFFFFA001FFFFE00FFF00000000
      FFF02FFFFFC001FFFFF01BFF00000000FFFFFFFFFF8001FFFFF87FFF00000000
      FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000800000008000000880000000
      000000000000000080000000C000000000000000000000004000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000010000000000000000000000000000000100000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF1724FFFF685141FFFFFFFF00000000
      FF15ACFFFE2204A4FFFFFFFF00000000FF626BFFFF001000DD6F7FFB00000000
      FF2600FFFE500204DEF51CFF00000000FF0001FFFE200000DFF4013F00000000
      FF0802FFFF000007DCB803AF00000000FF0001FFFE800071DFE0E0CF00000000
      FF0000FFFF000004DD83181F00000000FF80001BEA040041FF060C3F00000000
      FF0004060A000000FF18023F00000000FF002017FC000010FF60D09700000000
      FF001016B8000041FF47142F00000000FF00000E1A000001FF06021F00000000
      FF10403578000010FD10E1AF00000000FF00002734000027FF61A83F00000000
      FF04042BAE00004EFF47141700000000FF000071F8004100FF18429F00000000
      FF01001B24000022FF30E03F00000000FF040016FC000440FF43183F00000000
      FF00000178000020FE0C031700000000FF00001B9C000003FE3803BF00000000
      FF00000F6C000040FF6000BF00000000FF00005168000011FD00002B00000000
      FF000021BE000048FF00001700000000FF0000FFFF0000FFFD00002700000000
      FF0000FFFF0000FFFF00007F00000000FF0018FFFF4000FFFF0001FF00000000
      FF8001FFFF9001FFFCC003FF00000000FF00A0FFFF0000FFFFF80BFF00000000
      FF0610FFFF1100FFFF4C37FF00000000FFC244FFFF8076FFFDD52AFF00000000
      FFA408FFFFA324FFFFFD7FFF0000000000000000000000000000000000000000
      000000000000}
  end
  object MenuDisImageList32: TImageList
    BkColor = clWhite
    DrawingStyle = dsTransparent
    Height = 32
    Width = 32
    Left = 408
    Top = 64
    Bitmap = {
      494C01011F009400A40520002000FFFFFF00FF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000000001000001002000000000000000
      020000000000000000000000000000000000FFFFFF00FAFAFA00EDEDEC00EDED
      EC00EDEDED00ECECEC00ECECEC00EDEDEC00EDEDEC00EDEDEC00EDEDEC00EDED
      EC00EFEFEE00F4F4F300F7F7F700F8F8F800F5F5F500F7F7F700FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00F0F0EF00EDEDEC00ECECEC00F2F2
      F100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F9F9FA00E6E6E600F4F4F400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F6F6F600E6E6E600F8F8F800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E8E8
      E700E4E4E300E4E4E300E4E4E300E9E9E800EEEEED00EDEDED00EDEDED00EDED
      ED00EDEDED00EDEDED00EDEDED00EDEDED00EDEDED00EDEDED00EDEDED00EDED
      ED00EDEDED00EDEDED00EDEDED00EDEDED00EEEEED00EAEAE900E4E4E300E4E4
      E300E4E4E300E7E7E700FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00E6E6E500E1E1
      E000FAFAFA00F9F8F800EAE9E900E1E1E000E0E0DF00E0E0DF00E0E0DF00E0E0
      DF00E0E0DF00E1E1E000E1E1E000E1E1E000EFEFEE00FEFEFE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5F5F400E0E0DF00E5E4E300FCFC
      FC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E7E7E700E1E0E100FDFDFD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00E2E2E300E5E5E600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E4E3
      E300DEDEDD00DEDEDD00DEDEDD00E4E4E300E9E9E800E8E8E800E8E8E800E8E8
      E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8E800E8E8
      E800E8E8E800E8E8E800E8E8E800E8E8E800E9E9E800E4E4E400DEDEDD00DEDE
      DD00DEDEDD00E3E2E200FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00ECECEC00EEEE
      ED00FFFFFF00FFFFFF00FFFFFF00FAFAFA00EFEFEF00E5E5E500DFDEDE00DCDC
      DB00DDDDDC00E2E2E200EDEDEC00FBFBFB00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00E3E3E200F4F4F400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E5E5E500EEEEEF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F0F0F000E4E4E400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F4F4
      F400DEDDDC00DBDAD900DCDBDA00DAD9D800D9D8D700DAD9D800DAD9D800DAD9
      D800DAD9D800DAD9D800DAD9D800DAD9D800DAD9D800DAD9D800DAD9D800DAD9
      D800DAD9D800DAD9D800DAD9D800DAD9D800D9D8D700DAD9D800DCDBDA00DBDA
      D900DDDCDC00F3F2F200FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DAD9
      D9008F8E8D00848382008483820081807F007E7D7C007E7D7C007E7D7C007E7D
      7C007E7D7C007E7D7C007E7D7C007E7D7C007E7D7C007E7D7C007E7D7C007E7D
      7C007E7D7C007E7D7C007E7D7C007E7D7C007E7D7C00807F7F00848382009190
      90008C8B8A00D3D3D300FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F7F7F7008C8B8B00CFCECE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE009E9D9C00AFAEAE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8A
      8A00757473007574730075747300868585009796950097969500979695009796
      9500979695009796950097969500979695009796950097969500979695009796
      9500979695009796950097969500979695009796950083828100B1B0B000E5E5
      E500AEAEAD0081807F00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FBFBFB008A89880086858400FBFBFB00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00D6D6D60075747300C0C0BF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008181
      800075747300757473007574730096959400B1B1B000B1B0AF00B1B0AF00B1B0
      AF00B1B0AF00B1B0AF00B1B0AF00B1B0AF00B1B0AF00B1B0AF00B1B0AF00B1B0
      AF00B1B0AF00B1B0AF00B1B0AF00B1B0AF00B1B1B00096959400BAB9B800E8E8
      E800B8B8B70079787800FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E7E6E600ACABAA00FFFFFF00FFFFFF00F7F7F700D5D4D400ADADAC009494
      93008C8B8B008D8D8C009B9B9A00C1C1C000F0F0F000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDBCBC00BDBCBC00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00D4D3D30075747300C8C7C700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FDFDFD008F8E8D0085848300FAFAFA00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BBBA
      BA00757473007574730075747300757473007574730075747300757473007574
      7300757473007574730075747300757473007574730075747300757473007574
      7300757473007574730075747300757473007574730074737200797877009291
      910077767500B2B2B100FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B9B8B80075747300C5C4C400C2C2C2008685850075747300757473007574
      73007574730075747300757473007574730089888700CACAC900FDFDFD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F1F1F1007E7D7C0076757400DDDDDC00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE009190900083828100FAFAFA00FFFF
      FF00FFFFFF00FFFFFF00D3D2D20075747300CBCACA00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00DEDEDE00D1D1D000D1D1D000D1D1D000D1D1D000D1D1D000D1D1D000D2D2
      D100D6D6D600D9D8D800D5D4D400CDCCCC00C9C9C900CCCCCB00D4D4D400D9D8
      D800D7D7D600D2D2D100D1D1D000D1D1D000D1D1D000D1D1D000D1D0D000CFCF
      CF00DCDBDB00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FBFB
      FB00878685007574730075747300757473007574730075747300757473007574
      73007D7C7B00ADACAC00D5D5D500ECECEC00ECEBEB00D4D3D300E7E7E700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00AEADAD00757473007574730085848300F1F1
      F100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D9D8D80075747300C2C1C100FFFF
      FF00FFFFFF00FDFDFD008A89880089888700FBFBFB00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E7E7E700BBBABA009E9D9D008B8A8A00858483008B8A89009C9B9B00B9B8
      B800E4E4E400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00D2D2
      D10075747300757473007574730075747300757473007574730077767500AEAD
      AD00EDECEC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00E6E5E500787776007574730075747300757473009A99
      9800FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9A990081807F00F8F8
      F800FFFFFF00CCCCCB0075747300D5D5D500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F7F7F700E6E6E600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDEDE009998
      9700757473007574730076757400858483008B8A8A0086858400777675007574
      73007574730094949300D9D8D800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF009D9C
      9C0075747300757473007574730075747300757473008D8C8B00DBDADA00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF009C9B9B00757473007574730075747300757473007574
      7300B4B4B300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ECEBEB00DBDB
      DB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00DCDCDB00BEBDBD0075747300B2B2
      B100DBDBDB0087868500807F7F00DAD9D900DBDBDB00DBDBDB00DBDBDB00DBDB
      DB00DBDBDB00DBDBDB00DBDBDB00EEEEED00FFFFFF00FFFFFF00FFFFFF00CCCC
      CB008382810081807F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BEBDBD00757473007574
      730099989700CECECE00EFEFEF00FBFBFB00FEFEFE00FCFCFC00F0F0F000D1D1
      D0009D9C9C007574730075747300B7B7B600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00E8E8E8007877
      76007574730075747300757473007574730077767500E3E3E300FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00D5D4D40075747300757473007574730075747300757473007574
      730075747300C9C8C800FFFFFF00FFFFFF00FFFFFF00FFFFFF00888887007574
      7300757473007574730075747300757473007574730075747300757473007574
      7300757473007574730075747300757473007574730075747300757473007574
      730075747300757473007574730097969600FFFFFF00DDDDDD00939392007675
      74009392910083828100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B2B2B1007574730083828100D3D2
      D200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00D8D8D7008887860075747300ABAAA900FEFEFE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00B1B1B0007574
      730075747300757473007574730075747300757473009C9B9B00FBFBFB00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F9F8F8008D8C8B0077767500767574007574730075747300757473008382
      81009F9F9E00B8B7B700FFFFFF00FFFFFF00FFFFFF00FFFFFF007B7A79008E8D
      8C00D4D4D400D7D7D600D7D7D600D7D7D600D7D7D600D7D7D600D7D7D600D7D7
      D600D7D7D600D7D7D600D7D7D600D7D7D600D7D7D600D7D7D600D7D7D600D7D7
      D600D7D7D600D3D3D3008786850085848300A6A5A4007574730097969500E3E3
      E200F6F6F60089888700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C2C2C200757473008B8A8A00EDECEC00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F1F1F1009190900075747300B9B9B800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00ABABAA009B9A
      99009B9B9A009E9D9C009E9D9D009F9E9D00A1A09F009F9F9E00E8E8E800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F9F9F900DFDEDE00E7E7E700B3B3B200757473007574730075747300BBBB
      BA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0078777600B1B1
      B000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00A2A2A1007574730086858500CFCECE00FFFFFF00FFFF
      FF00F1F1F10089888700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E7E7E700797877007F7E7D00EAEAEA00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F0F0F0008483820076757400E0E0E000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CECDCD00757473007574730075747300C6C6
      C500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0079787700AFAE
      AE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF009F9F9E0075747300EDEDED00FFFFFF00FFFFFF00FFFF
      FF00F0F0F00089888700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00A5A4A30075747300CBCBCA00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D4D4D400757473009B9B9A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00D3D3D300757473007574730075747300DADA
      DA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0079787700AFAE
      AE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF009F9E9D0075747300F3F2F200FFFFFF00FFFFFF00FFFF
      FF00F0F0F00089888700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EEEEEE00787776008D8D8C00FDFDFD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F9F9F900D2D2D100BEBEBD00CFCFCF00F6F6F600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009595940075747300E7E7
      E700FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00D5D5D50075747300757473007A797800EFEF
      EF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0079787700AFAE
      AE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF009F9E9D0075747300F1F1F100FFFFFF00FFFFFF00FFFF
      FF00F0F0F00089888700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C7C7C60075747300C2C1C100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E7E6E6008D8D8C007574730075747300757473008A898800E1E0
      E000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CCCBCB0075747300BDBC
      BC00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FAFAFA00FEFEFE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CFCFCF0075747300757473009A9A9900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0079787700AFAE
      AE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF009F9E9D0075747300F1F1F100FFFFFF00FFFFFF00FFFF
      FF00F0F0F00089888700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A7A7A60075747300E6E5E500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F9F9F9008C8B8A007574730071706F006F6E6D0071706F00757473008584
      8300F6F6F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00ECECEC00757473009F9E
      9D00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00DCDCDB00FEFEFE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C2C2C2007574730075747300D1D1D000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0079787700AFAE
      AE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF009F9E9D0075747300F1F1F100FFFFFF00FFFFFF00FFFF
      FF00F0F0F00089888700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF009897960077767500F3F3F300FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00DAD9D90075747300706F6E0095949300D3D3D3009B9A9900706F6E007574
      7300D0D0CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9F8F8007E7D7C008E8D
      8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00ABABAA00F6F6F600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A5A5A4007574730098979600FDFDFD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0079787700AFAE
      AE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF009F9E9D0075747300F5F5F500FFFFFF00FFFFFF00FFFF
      FF00F0F0F00089888700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00939291007B7A7900F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C9C8C800757473006D6C6B00CDCCCC00FFFFFF00D8D8D8006E6D6C007574
      7300BDBCBC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFCFC00858483008988
      8700FEFEFE00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008C8B8B00BCBCBB00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F3F3F3007877760085848300EDEDED00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0079787700AFAE
      AE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00A09F9E0075747300DEDEDE00FFFFFF00FFFFFF00FFFF
      FF00F0F0F00089888700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF009897970077767500F3F2F200FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00DCDCDC007574730071706F00908F8E00C9C9C9009695940071706F007574
      7300D3D2D200FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8F8F8007D7C7B008F8E
      8D00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF009E9D9D0077767500D6D6D500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FAFAFA00A3A2A20093929100EAEAEA00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0078777600B2B1
      B000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00A2A2A1007574730077767500B4B4B300F6F6F600FFFF
      FF00F3F2F20089888700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A9A8A80075747300E4E4E400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FBFBFB00908F8E007574730071706F006E6D6C0071706F00757473008888
      8700F8F8F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00EBEBEB0075747300A09F
      9E00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C2C1C1007574730079787700C5C4C400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EFEFEF00F3F2F200FFFFFF00FFFFFF00FFFF
      FF00F8F8F800D4D3D300CCCBCB00FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007A7978009190
      9000DFDFDF00E2E2E100E2E2E100E2E2E100E2E2E100E2E2E100E2E2E100E2E2
      E100E2E2E100E2E2E100E2E2E100E2E2E100E2E2E100E2E2E100E2E2E100E2E2
      E100E2E2E100DEDEDE008887860088888700C0BFBF007B7B7A0081818000CECD
      CD00ECEBEB0088878600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C9C8C80075747300C0C0BF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E9E9E90091908F007574730075747300757473008C8B8B00E4E4
      E400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CACAC90075747300BEBE
      BD00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EFEFEF007D7C7B0075747300757473009D9C
      9B00E2E2E200FFFFFF00FFFFFF00A6A6A500A7A6A600FFFFFF00FFFFFF00FFFF
      FF00FDFDFD00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00868584007574
      7300757473007574730075747300757473007574730075747300757473007574
      7300757473007574730075747300757473007574730075747300757473007574
      730075747300757473007574730093929100FFFFFF00F1F1F100ABABAA007675
      74007C7B7A00807F7E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EFEFEF00787776008C8B8A00FDFDFD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FBFBFB00D6D6D600C2C2C200D4D3D300F9F8F800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009493920076757400E9E9
      E800FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BBBBBA0075747300757473007574
      730077767500A8A8A700D2D2D1007A79780076757400E4E4E400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E5E5E500CFCE
      CE00CECDCD00CECDCD00D3D2D200CBCACA00BCBBBB00C6C6C500D3D3D300CECE
      CE00CECDCD00CECDCD00D0D0D000D0D0CF00BFBEBE00C0C0BF00D2D1D100CFCF
      CF00CECDCD00CECECE00CFCECE00E8E8E700FFFFFF00FFFFFF00FFFFFF00E2E2
      E100999998008A898800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00A7A6A60075747300C8C8C800FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D2D1D100757473009E9D9C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFCFC009D9C9B00757473007574
      7300757473007574730075747300757473007574730099999800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E0E0E00093939200818180008C8B8B00CCCBCB00FFFF
      FF00FFFFFF00FFFFFF00F9F8F800A5A4A3008382810085848300AEAEAD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F5F5F500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E9E9E8007A7978007E7D7C00E7E7E700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EDEDED008281800077767500E2E2E100FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6F6F6009A9998007574
      7300757473007574730075747300757473007574730075747300CFCFCF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EDEDED007D7C7B0075747300757473007574730075747300D9D9
      D900FFFFFF00FEFEFE009D9C9C0075747300757473007574730075747300B0AF
      AF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C5C5C4007574730088888700EAEAEA00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EFEFEF008E8D8C0075747300BCBBBB00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFAFA00ADAD
      AC0076757400757473007574730075747300757473007574730088878600F9F9
      F900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C9C8C8007574730075747300757473007574730075747300AEAE
      AD00FFFFFF00F1F1F1007A797800757473007574730075747300757473008685
      8400FBFBFB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B6B5B50075747300807F7F00CFCE
      CE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00D4D3D3008584830075747300AEADAD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00CDCCCC00767574007574730075747300757473007574730075747300B8B7
      B700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00CDCCCC007574730075747300757473007574730075747300B2B2
      B100FFFFFF00F3F3F3007B7B7A00757473007574730075747300757473008887
      8600FCFCFC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C1C1C000767574007574
      730095949300CBCACA00ECEBEB00FAFAFA00FCFCFC00FAFAFA00EDECEC00CDCD
      CC00999897007574730075747300BBBABA00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C1C0C00075747300757473007574730075747300767574007D7C7B009392
      9100F8F8F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F4F4F3008685850075747300757473007574730078777600E2E2
      E200FFFFFF00FFFFFF00AAA9A90075747300757473007574730075747300BDBC
      BC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E1E1E1009D9C
      9B00757473007574730075747300818180008887860083828100757473007574
      73007574730099989700DCDCDC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFA
      FA00999998009A9A9900AFAEAE00C4C4C300D7D7D700E6E5E500F1F1F100FBFB
      FB00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E7E7E7009E9D9D008483820094949300D7D7D700FFFF
      FF00FFFFFF00FFFFFF00F9F9F900B2B2B1008685850089888700BCBBBB00FEFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E3E3E300B8B8B7009B9A990088888700828180008887860099999800B5B5
      B400E1E0E000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E6CB9B00C1903300AC750E009F6A04009763010097630100A16B
      0400B47E1700CDA14800F3E5CD001AA3F1000690E7000984DC000A81D900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00ECEBEB00E9E9E800E9E9E800E9E9E800F1F1F000FFFF
      FF00F9F9F900E9E9E800E9E9E800E9E9E800E9E9E800F9F9F900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B27D1B009863
      0100B3770400D38D0700DC940700E5990800ED9F0900F5A60D00FDAD1200FDAE
      1500FDAE1600F0BF6000FDAE150059C8FF0045C1FF0000AAFF007FD4FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F6F6F600E3E3E200DBDAD900E0E0DF00FCFCFC00FFFF
      FF00FFFFFF00E7E7E600DCDBDA00DBDBDA00DBDAD900F0F0F000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FEFEFE00FDFDFD00FDFD
      FD00FBFBFB00FBFBFB00FAFAFA00FAFAFA00FAFAFA00FBFBFB00FBFBFB00FCFC
      FC00FDFDFD00FDFDFD00FEFEFE00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFEFA00FFFEFA00FFFFFF00FFFFFF00FFFDF900FFFFFD00FFFF
      FD00FFFEFA00FFFFFE00FFFFFF00FFFEFA00FFFEFA00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFA00FFFEFA00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BE8E34009B660100BF7F0500C785
      0600CF8B0600D8910700E0980C00E8A01200F1A81B00F9B02400FDB52A00FDB6
      2D00FDB72F00F2D29500FDB62D0061CAFF00EEF8FE0064CBFF001EB4FF0080D5
      FF000987DE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F0F0F000F6F6F600FFFFFF00FFFF
      FF00FFFFFF00F2F2F200D2D1D000DFDEDE00EEEEED00FCFCFC00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FEFEFE00FEFEFE00FCFCFC00FAFAFA00F7F7F700F5F5
      F500F2F2F200F0F0F000EFEFEF00EEEEEE00EEEEEE00EFEFEF00F1F1F100F3F3
      F300F6F6F600F8F8F800FBFBFB00FDFDFD00FEFEFE00FEFEFE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFD00FFFCF200FFFCF200FFFFFF00FFFDF900FFFBF200FFFBF200FFFB
      F200FFFBF200FFFBF200FFFFFF00FFFCF200FFFCF200FFFEFC00FFFEFC00FFFE
      FC00FFFEFC00FFFEFC00FFFEFC00FFFEFC00FFFCF400FFFCF200FFFCF200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A66E0300BB7C0500C3820500CB88
      0600D48E0900DC961100E49F1A00ECA82600F5B23000FDBB3C00FDBD4200FDBE
      4500FDBF4700FFFAEF00EDBC590092BCA80073CAF900E2F0FB0082D5FF0000AA
      FF00088AE100078BE300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FEFEFE00FCFCFC00F9F9F900F4F4F400EEEEEE00E8E8E800E2E2
      E200DDDDDD00DADADA00D8D8D800D7D7D700D7D7D700D9D9D900DBDBDB00DFDF
      DF00E5E5E500EBEBEB00F1F1F100F6F6F600FBFBFB00FDFDFD00FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFEFB00FEF9EB00FEF9EB00FFFFFF00FEFAEC00FEFAEC00FEFAEC00FEFA
      EC00FEFAEC00FEFAEC00FFFFFF00FEF9EB00FEF9EB00FEF9EB00FEF9EB00FEF9
      EB00FEF9EB00FEF9EB00FEF9EB00FEF9EB00FEF9EB00FEF9EB00FEF9EB00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B6790400BE7F0500C7850600CF8C
      0A00D7941300E09E1E00E8A82A00F0B13900FABD4700FEC35300FEC55900FEC7
      5D00FECD6F00FFFFFF00D1B58000FEC65A009FC4B0007CC6F400D6EAF90096DC
      FF0000AAFF0080D5FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F4F4F400CDCDCC00FBFBFB00FFFFFF00FFFF
      FF00F4F4F40095949300A1A09F00C9C8C800F6F6F600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFEFE00FCFCFC00F7F7F700EFEFEF00E4E4E400D9D9D900CFCFCF00C7C7
      C700C0C0BF00BDBCBB00BBB9B700BAB8B600BAB8B600BCBBB900BFBEBE00C3C3
      C300CACACA00D4D4D400DEDEDE00E9E9E900F3F3F300F9F9F900FDFDFD00FEFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFEF900FEF7E400FEF7E400FFFBF100FFFDF800FFFDF800FFFDF800FFFD
      F800FFFDF800FFFDF800FFFDF800FEF7E400FEF7E400FEF7E400FEF7E400FEF7
      E400FEF7E400FEF7E400FEF7E400FEF7E400FEF7E400FEF7E400FEF7E400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BA7C0500C2820500CB890A00D391
      1200DB9B1E00E4A52C00EDB03B00F5BB4D00FEC86000FECB6800FECD7000FECF
      7500FFD99100FFFFFF00B5A89100FECE7200FECC6B00A6C8B7007FC4F100CEE6
      F7008FDAFF0027B7FF0080D5FF000594EB00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FCFCFC00C6C5C5008685840075747300B4B4B300FFFFFF00FFFF
      FF00C1C1C000747373007574730075747300D2D1D100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFE
      FE00FDFDFD00F8F8F800EEEEEE00DFDFDF00CDCDCD00BEBDBD00B3B1AF00AFA8
      A200B0A49800B2A19000B4A08C00B6A08A00B5A08A00B3A18E00B1A39400AEA5
      9C00B0ACA800B7B6B500C4C4C400D6D6D600E6E6E600F4F4F400FBFBFB00FEFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFDF800FEF6DE00FEF6DE00FEF6DE00FEF6DE00FEF6DE00FEF6DE00FEF6
      DE00FEF6DE00FEF6DE00FEF6DE00FEF6DE00FEF6DE00FEF6DE00FEF6DE00FEF6
      DE00FEF6DE00FEF6DE00FEF6DE00FEF6DE00FEF6DE00FEF6DE00FEF6DE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BB7D0500C6850700CE8D1000D797
      1C00DFA12A00E8AC3A00F1B94E00F9C56200FECE7300FED27D00FED58600FED7
      8D00FFEBC500FFFFFF00A49E9200FED68A00FED48200FED07800A7C9B90087CA
      F400D6EAF90077D1FF0000AAFF000597EE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F6F6F6007B7B7A00757473007574730076757400D2D2D100E6E6
      E60088878600757473007574730076757400E2E2E200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFE
      FE00FCFCFC00F4F4F400E5E5E500CFCFCF00B9B8B800AAA5A000B09E8C00BB9C
      7D0098785A00C1884D00D6A15A00DEB36C00DEB17900D39F5F00A8774E00BC9A
      7700B59C8300ABA19600AFAEAC00C3C3C300DADADA00EDEDED00F8F8F800FDFD
      FD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFE00FDF4D800FDF4D800FDF4D800FDF4D800FDF4D800FDF4D800FDF4
      D800FDF4D800FDF4D800FDF4D800FDF4D800FDF4D800FDF4D800FDF4D800FDF4
      D800FDF4D800FDF4D800FDF4D800FDF4D800FDF4D800FDF4D800FDF4D800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B97B0400D99F3100D3921600DB9C
      2400E4A83400ECB44800F5C15E00FDCF7700FED58500FED99100FEDC9B00FEDC
      9C00FFFFFF00FFFFFF0097959000FEDEA100FEDB9700FED78D00FBCF79009DC1
      B0007DCAF600F2F8FD005CC9FF0006A6FA00078FE60001A4F90001A8FD00039C
      F2000A82DA00C0E4FA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00A9A8A800757473007574730075747300757473007675
      74007574730075747300757473007D7C7B00F7F7F700FFFFFF00FFFFFF00F7F7
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFE
      FE00FBFBFB00F2F2F200E0E0E000C6C6C600AFAEAC00AF9E8C00CF8C6100E6B6
      6E00F2CE8000F6DA8B00FAEEC300F9E39600F8E29200FCF9EF00F6D48000EEC7
      7800DBA35D0097715600A79F9800B9B8B800D3D3D300E9E9E900F7F7F700FDFD
      FD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B0740400F5CA7800D7971C00DFA1
      2C00E8AE3F00F0BB5400F9C96E00FED48400FEDA9300FEDFA200FEE3AF00FFDB
      9600FFFFFF00FFFFFF0092908E00FEE6B700FEE2AB00FEDD9E00FBD38900EDBD
      5F008EB6A50072CCFC006CC3F6003CBEFF0088D9FF00AAE5FF00AEE6FF00B1E7
      FF00B5E8FF00199EED0089CDF500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00DADADA00757473007574730075747300757473007574
      730076757400757473007574730078777600B9B8B800DCDCDB00A9A9A8008483
      8200CECDCD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFE
      FE00FBFBFB00F3F3F300E2E2E200CACACA009C674A00E2A26300EDB97200F2C8
      7D00F6D68800F8E08D00F9E27F00FAEB9900FAEA9A00F9ECBD00FFFFFF00F9E5
      BB00F4D09F00E9AA5C00D1874800BDBCBC00D5D5D500EBEBEB00F7F7F700FDFD
      FD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00DA960000DA960000DA960000DA960000DA960000DA960000DA96
      0000DA960000DA960000DA960000DA960000DA960000DA960000DA960000DA96
      0000DA960000DA960000DA960000DA960000DA960000DA960000EECB8000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AD761000EEBE6200DA9B2100E3A7
      3200ECB34700F4C15E00FDD07A00FED88E00FEDE9F00FEE9BF00FEE8BB00FFFB
      F400FFFFFF00FFFFFF008D8C8B00FFEDCA00FEE8BD00FEE2AC00FBD89400EDC0
      6700E0AA42008ED9FC0057C7FF00ABE5FF0093DDFF0097DEFF009ADFFF009DE0
      FF00A1E2FF00A5E3FF001593E500FFFFFF00FFFFFF00FFFFFF00F6F6F600CDCC
      CC00DFDFDF00EEEEEE00B2B2B10075747300757473008B8A8A00A7A7A600A5A4
      A300A5A5A400A7A6A6008A898800757473007574730075747300757473007574
      73008C8B8A00F9F8F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFE
      FE00FDFDFD00F6F6F600EAEAEA00C7683500E19B5B00EBB88300EDBB7200F1C9
      7F00F6D68C00FBF5CC00FCF6DE00FEFDFD00FFFEFD00FBF1AA00FDF9FB00FCF2
      CF00EFC37900EAB36B00E5AA7000E2B29D00A19A9600F0F0F000FAFAFA00FEFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00DD990000DD990000DD990000DD990000DD990000DD990000DD99
      0000DD990000DD990000DD990000DD990000DD990000DD990000DD990000DD99
      0000DD990000DD990000DD990000DD990000DD990000DD990000DD990000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFCFA00D6941600EFBE5E00E7AB
      3700F0B84D00F8C76700FED37F00FED99100FEDFA400FFF1D500FFDB9600FFFF
      FF00FFFFFF00FFFFFF0082828200FFF2D900FFECC700FEE5B500FBDA9C00EDC1
      6B00E0AB450066C3F8003CBFFF007CD5FF007FD6FF0083D7FF0087D8FF0089D9
      FF008DDBFF0091DCFF0094DDFF0042AAEC00FFFFFF00FFFFFF00C7C7C6007574
      7300757473007B7A790075747300757473009B9B9A00A6A5A400848382008C8B
      8A008B8A8A0084838200A8A7A700999897007574730075747300757473007574
      730075747300D6D6D500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFEFE00FBFBFB00C05E2D00DA874D00E19A5C00E7A96800EBB87200F1C6
      8000F6D38E00FADF9800FFFEFF00FFFFFF00FDECA400FBE39D00F8D99400FDF6
      EB00EFBE7500E9B16C00E4A15F00ECBD7A00CD753E00C5C2C100FCFCFC00FEFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00DF9C0000DF9C0000DF9C0000DF9C0000DF9C0000DF9C0000DF9C
      0000DF9C0000DF9C0000DF9C0000DF9C0000DF9C0000DF9C0000DF9C0000DF9C
      0000DF9C0000DF9C0000DF9C0000DF9C0000DF9C0000DF9C0000DF9C0000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAD19D00EEB95300ECB1
      3D00F4BC5100FCCA6A00FED27E00FED99100FEE2AA00FEE5B600F8F6F100AFC8
      E2009CBCDE00DEE9F4008D8D8D00FFF2DA00FFECC800FEE6B600FBDB9C00EDC1
      6C00EECE900019B2FE005CC9FF0069CEFF006BCFFF006FD0FF005AB9F200E3F4
      FE00C9EFFF007DD5FF0080D6FF000C87DE00FFFFFF00FFFFFF009C9B9B007574
      73007574730075747300757473008C8B8B00A5A4A30082818000D9D9D900FCFC
      FC00FBFBFB00D5D5D500807F7E00A6A5A4008685850075747300757473007675
      7400B3B2B200F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFEFE009C553800CF754300D7844B00FDFAF800E3A46100EAB47000EFC2
      7D00F5CA8400FFFFFF00FBE5A900FEFAE900FDE2A300FBDB9D00F7D49300F3C9
      8500FEFDFD00E7AD6D00E19D5D00DC925900EAB57F00D89F8500FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E29F0000E29F0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E29F0000E29F0000E29F0000E29F0000E29F
      0000E29F0000E29F0000E29F0000E29F0000E29F0000E29F0000E29F0000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9E5BF00F9CA
      7000F8BF5300FECA6700FED07800FED78B00FFF2D700E6CF9D007B9FC40087AA
      CE0094B5D8009BBBDE008F949A00FFEECD00FEE9C000FEE3AF00FBD99700EFC5
      7300FFFFFF001AB3FF004EC6FF0055C7FF0058C8FF0032A5EC00FFFFFF00FFFF
      FF00FFFFFF00BBE9FF006CCFFF000C87DE00FFFFFF00FFFFFF008E8E8D007574
      7300757473007574730075747300A7A6A6007F7E7D00DDDDDC00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00D6D6D50081807F00A4A3A2007574730078777600D1D1
      D000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FCFCFC00C2643800CB724000D3814A00D5803900E1A05E00E7AF6B00EDBD
      7800FDF9EF00F6D19400F9D79900FFFDFA00FAD99D00F8D49600F5CC8C00F0C3
      8000EBB77400FFFDFC00DE9C5C00D9956700FEFCFB00CC704000B14C2400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E4A20000E4A20000FFFFFF00EAB02000E7A50000E7A50000E7A5
      0000E7A50000E7A50000FFFFFF00E4A20000E4A20000E4A20000E4A20000E4A2
      0000E4A20000E4A20000E4A20000E4A20000E4A20000E4A20000E4A20000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFC
      F900FDC65D00FECD7000FECD6F00FED99000DDC59100597FA6004F749900567A
      9E005C7FA2006587AA0098B2CE00FEE7BA00FEE3AF00FEDFA300FCDFA500FFFF
      FF00FFFFFF007CD3FF004ECAFF0041C0FF0044C2FF000A81D900FFFFFF00FFFF
      FF00FFFFFF00EAF7FF0059C9FF0042AAEC00FFFFFF00FFFFFF00F1F1F100C0C0
      BF008A8988007574730079787700A5A5A4008E8E8D00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FEFEFE008C8B8A00A6A6A5007574730079787700F1F1
      F100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00AA452200C2643800C76B3D00C8662900D6894C00DD9B5800E4AB6400E7AA
      5700F2D08F00F3C98800F6CF8E00F6CB8500F6D09000F5CC8C00F1C78300EEBD
      7800E8B16C00EABD7C00F5E0CD00DEA67D00EBCFC100D0784300BC5E3600E9E9
      E800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E7A50000E7A50000FFFFFF00FFFBF100F0B71200F0B71200F0B7
      1200F0B71200F1BC2000FFFFFF00E7A50000E7A50000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8E4B000E7A50000E7A50000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FEE1A500FFD17B00FED88D00234464003A608500395C7E003352
      71003E5E7E004F7193005C7DA000FEDFA400FEDD9C00FFF8EB00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0053CDFF0031BBFF0030BBFF001F9EEC00E2F2FD00FFFF
      FF00FFFFFF0036ADF20011AAFA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E8E8E8007675740079787700A5A4A300908F8E00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008D8C8B00A6A5A40076757400757473009493
      9200CECDCD00F9F9F900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B4572E00BB5D3600C3663900DAA17F00D2834900DA945300E1A65F00F3DC
      BC00EBB86B00F0C57D00F2CA8300F3CC8800F0C98000F1C88000EEC17900EAB9
      6F00E4AD6400DDA05B00E8BD9E00CA713B00BF623800DC925A00BB5C32009A3E
      1B00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E9A80000E9A80000FFFFFF00FFFFFF00FFFCF300E2A62000DD99
      0000F5DCA300FFFFFF00FFFFFF00E9A80000E9A80000F9E5B000FAEAC000FAEA
      C000FAEAC000FAEAC000FAEAC000FAEAC000EEB93000E9A80000E9A80000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFD480001B3C5D00203D5A003B5F8100527B
      A200477198004C759B0050789D00D8DEE100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B9E8FF007FDFFF0035BFFF0020B5FF00169BEB000A82
      DA001A9CEB0016B2FF008CCDF500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00D4D3D3007776750075747300A7A7A6007E7D7C00E3E3E200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00DCDCDC00807F7F00A5A5A40075747300757473007574
      7300757473009D9C9B00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B5B
      4900B2552F00B85B3200BE623600F8EFE900CF7A4400D68A4C00DFA16200E4A9
      5D00E9BA6900EDC27100EFC77700F0CA7A00FFFFFF00F4E5DB00EBBE6D00E7B6
      6600E1A65B00FEFEFD00ECB87100CA733F00DBAD9A00F6EEE900B6573100A94D
      2A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00ECAB0000ECAB0000FFFFFF00FFFFFF00EBB12000E7A50000E7A5
      0000E7A50000FFFFFF00FFFFFF00ECAB0000ECAB0000ECAB0000ECAB0000ECAB
      0000ECAB0000ECAB0000ECAB0000ECAB0000ECAB0000ECAB0000ECAB0000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00173450005A80A600446F97004771
      98004F789D00587FA3005E84A8006287AB00E8EDF300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00DCF4FF0029BBFF007FDFFF008EE5FF005BD0
      FF0001A4FA00C0E4FA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700B8B8
      B700787776007574730075747300908F8E00A0A09F0087878600E1E1E100FEFE
      FE00FEFEFE00DFDEDE0084838200A2A2A1008988870075747300757473007574
      730075747300A3A2A200FFFFFF00CBCACA00C8C8C800F0F0F000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008D31
      1500AD512D00B5582F00B95C3500FDF9F700CA723E00D3804600F4DCC900E7B2
      6A00E6AD5F00EABA6600ECC26900EBC98100FFFFFF00FFFFFF00FEFDFC00FCF7
      F200FFFFFF00FDFBFA00FEFDFB00E8C5B200E3C2B500ECD9CF00CA846600A03D
      1900E4E3E200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EEAE0100EEAE0100FFFFFF00FFFFFF00EEB10600EEB10600EEB1
      0600EEB10600FFFFFF00FFFFFF00EEAE0100EEAE0100FAE6B100FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFBF100F2BE3100EEAE0100EEAE0100FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00567DA200416C950048729900547B
      A1005F85A900688CB0006E93B6006F93B7006E93B600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CBCBCA007574
      7300757473007574730075747300757473009E9D9D00A3A2A200848382008E8E
      8D008E8D8C0084838200A5A5A4009B9B9A0075747300757473007C7B7A007776
      750075747300D8D8D700F9F8F8007574730075747300BEBEBD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00913B
      1D00A64A2700AE532C00B6593100FCF7F600C6693900C9652500D57C3F00EABF
      6000FBF2E900F3D7B300E6A24600EBB06000F8F2F600FCFBFB00E6A15400E091
      4800D4732800D37C4300C96B3B00B9562F00CE997D00F0DBD300E1A67E00DCBD
      B10090766C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EFB10700EFB10700FFFFFF00FFFFFF00FBEAB900F1BC1C00F1BC
      1C00F1BC1C00FFFFFF00FFFFFF00EFB10700EFB10700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBE7B300EFB10700EFB10700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C5D2DF004872990049739900567DA2006388
      AC006F94B700789BBE007C9FC2007DA0C3007C9FC200E9F0F400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F2F2F2008382
      810075747300757473007574730075747300757473008E8E8D00A8A8A700A2A1
      A100A2A2A100A8A8A7008C8B8B007574730076757400BAB9B900D4D4D400ABAA
      A900C6C5C500F0F0F000B3B3B2007574730075747300B3B2B200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008A38
      1D009C452400A84C2900B1542E00F4E3DC00C3683B00FFFFFF00F6E8E000EFC5
      6400E18A4B00E6925000E99A5300EB9D5500EA9C5300E5843300E38C4A00FFFF
      FF00D87C4200CE703D00C6663600CF784000B4562D00A53E1400B75C31009942
      23007C423300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EFB40C00EFB40C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EFB40C00EFB40C00EFB40C00EFB40C00EFB4
      0C00EFB40C00EFB40C00EFB40C00EFB40C00EFB40C00EFB40C00EFB40C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CACACA0050667C004A739A00567DA200648AAE007396
      B9007EA1C40086A8CB008BACCF008CAED0008BACCF00A6C0D800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C5C4
      C400807F7E00A6A6A500D6D6D600ACACAB007675740075747300757473007877
      76007776750075747300757473007574730077767500DCDCDC00919090007776
      750098979700888786008B8A8A009A9998009595940083828100B9B9B800ECEB
      EB00CECECE00E8E8E800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007F32
      1800923E2100A0482600AC522A00FFFFFF00D3A38500FDFBF900D06D3C00ECB2
      6000E1814900E78B4E00EB905300ED935500EC925400E98E5100FFFFFF00F0EB
      E000D5723F00CC693800C4633500E1944F00AB4B2000A1431E00964122008E3C
      1E0062251700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F0B71100F0B71100F0B71100F0B71100F0B71100F0B71100F0B7
      1100F0B71100F0B71100F0B71100F0B71100F0B71100F0B71100F0B71100F0B7
      1100F0B71100F0B71100F0B71100F0B71100F0B71100F0B71100F0B71100FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00333333006187AB00537BA0006288AC007296B90080A2
      C5008BACCF0093B4D60098B8DA0099B9DB0098B8DA0093B4D600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFE
      FE00F3F3F300FFFFFF00FFFFFF00F0F0F0007978770075747300757473007574
      73007574730075747300757473007574730075747300A09F9E00848382007574
      730078777600A5A5A400989796009695940096959400A6A5A400838281007978
      7700757473009B9A9900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007028
      130087371B0089260D00E9D5CE00AB4F2800BE603800C6663B00D16D4000EBA4
      5E00E37D4E00EA845300EE865400F08A5700F0895600EC885500FFFFFF00FFFF
      FF00D7724400CD6A3C00C25F3400D67940009F3814009E4524008B3C1F008033
      1A0094736800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F1B91700F1B91700F1B91700F1B91700F1B91700F1B91700F1B9
      1700F1B91700F1B91700F1B91700F1B91700F1B91700F1B91700F1B91700F1B9
      1700F1B91700F1B91700F1B91700F1B91700F1B91700F1B91700F1B91700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF006E6E6E00333333005F85A9005D83A7006D92B5007C9FC2008AAC
      CE0095B6D8009DBDDF00A9C5E500ABC8E600A6C3E4009DBDDF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00D7D7D7007574730075747300757473008E8D
      8C00E3E3E200C8C7C70075747300757473007574730087878600DDDDDC007E7D
      7C009D9C9B0091909000CECECE00F3F3F300E0DFDF0095949300A6A5A4007776
      75007574730091908F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005917
      0700B08170007D220C009B422300C2957E00FFFDFD00DABFA700D36C4400F3B7
      8A00EC9F8100F3A98C00F6AE9200F8B29500F7B19400F5AC8F00FDFBF800F6E8
      DC00DC7F5B00CE6B4400CE6E4300C0623800BD7E6400943D1F0083341A006D28
      1400C6C2C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F1BC1C00F1BC1C00F1BC1C00F1BC1C00F1BC1C00F1BC1C00F5CD
      5500FCEFC700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFCF200FAE7
      AB00F1BC1C00F1BC1C00F1BC1C00F1BC1C00F1BC1C00F1BC1C00F1BC1C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0033333300333333006B90B300668BAE007498BB0084A6C90092B3
      D500A7C4E200B9D1EB00B8D2EE00B5D0EE00B0CDEB00A7C5E600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C5C4C400757473007574730075747300C9C9
      C900FFFFFF00FFFFFF00AAA9A9007574730086858400C7C6C600FCFCFC008B8A
      8A009C9B9B00B8B8B700FFFFFF00FFFFFF00FFFFFF00D4D3D300979696008887
      8600A3A2A200F4F4F300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006134
      2500692411007D2F1A0083251000FBF7F400FCFBF800FFFEFE00E09E8700F9CC
      AD00F8E4DB00FFFDFD00FACFC100FAC0AD00FAC1AE00F7BEA900F3AD9500EDAA
      9300FFFFFF00D88B7000C5654300AE513100F8F3F10087341B0074291400591D
      0D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F2BF2200F2BF2200F2BF2200F2BF2200F2BF2200FBE8AD00F5E0
      B000DB970000DB970000DB970000DB970000DB970000DB970000DB970000E0A5
      2000FFFFFF00F2BF2200F2BF2200F2BF2200F2BF2200F2BF2200F2BF2200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF003333330033333300353637003A3E4200799CBF0089ABCD00A0BD
      DD00BED4EC00BFD7F000C0D8F300BDD7F400B8D3F100AECCEC00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F1F1F100C0C0BF00989797008D8D8C00F6F6
      F600FFFFFF00FFFFFF00F6F6F600C7C7C600F4F4F400FFFFFF00E6E6E6008483
      82009C9B9B00C8C7C700FFFFFF00FFFFFF00FFFFFF00E3E3E200959594008C8B
      8A00D8D8D700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9F9
      F900743C2E007838230083361F00C6AA9B00FAF6F600FBFBFA00DAA18E00F5C2
      AA00EDBFB000F2C9BC00F6CFC300F7CABB00FFFFFF00F0BFAE00F0C0B200EABA
      AA00E1AD9C00F7E0D700C4806B00A3553D009B543D00792F1A00631F0F003C0A
      0200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFCF300F2C22700F2C22700F2C22700F2C22700F2C22700FFFFFF00E19E
      0000E19E0000E19E0000E19E0000E19E0000E19E0000E19E0000E19E0000E19E
      0000E5AB2000FBE9AF00F2C22700F2C22700F2C22700F2C22700F2C22700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00333333003333330033333300464A4F007B9EC1008CAED000C1D5
      EA00C3D8EF00C5DAF300C5DCF700C5DCF800BDD8F500A6C3E200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFBFB00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D0D0CF00858483007574
      7300A2A2A10099999800F9F8F800FFFFFF00FFFFFF00ADADAC009F9F9E00807F
      7F00DEDEDE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFF
      FF003A0A02005D2112007532200095544100BA7A6800F5EDEB00DAAEA000ECC4
      B700EDCDC400F2D8D000F5DED700F7E1DA00F6E0D900F1D4CC00FFFFFF00E9C8
      BE00DEB5AD00CD9E9000C3908000A15D4700813A27006A29180053190C00B4AB
      A600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCF4E000E7A5
      0000E7A50000E7A50000E7A50000E7A50000E7A50000E7A50000E7A50000E7A5
      0000E7A50000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F6F6F6003333330033333300383838005D5D5D006889AB009BB9D700C4D7
      EB00C6DAF000C7DCF400C9DFF800C9E0FB00C1DBF70086A4C30091919100FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A3A2A200757473007574
      730087868500A3A2A20099989700B6B6B500A3A2A2009B9A99009B9B9A007574
      73008E8E8D00EAEAEA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C9C4C2004D190E00662B1D0093625400AB776A00BE8E8100D9B7AD00E2CC
      C400EEDCD500F4E5E000F7EAE700F8EDEA00F8ECE900F6E5E100F2E1DB00EAD2
      CE00E5BEB100D3AFA400C5988C00E8D6D200753927005A211500390D0700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EDAC
      0000EDAC0000EDAC0000EDAC0000FAE5B000F0BC3000EDAC0000EDAC0000EDAC
      0000FAE5B000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF003333330038383800414141007A7A7A00586F86006E8CAA008EA7
      C100C5D9EE00C9DDF300C9DEF600C7DEF700BED6F20055636F004E4E4E00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E3E3E20094949300B1B0
      AF009D9C9B0088888700A4A3A3009B9B9A00A09F9E00908F8E00757473007574
      730075747300C7C7C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0031090600552217008D605600A9807600BD978E00FCFBFA00E7D5
      D000F0E4E100F6EEEC00F9F4F200FBF6F500FBF6F400F8EFEC00F4EAE700FAE1
      DC00DEC8C200DAC4BC00BB989100BD998D009A6B5C0048181000F2F2F200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEF6E100EFB30A00EFB30A00FFFFFF00FBE8B400EFB30A00EFB30A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00353535003F3F3F004A4A4A00575757009A9A9A00848484006C70
      740060758A0059789600587897005F748900656768007A7A7A0064646400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFEFE00B2B2B100757473007877760081818000B3B3B200DFDFDF00A7A7
      A600A3A2A200FBFBFB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF003A110C0063342A00A17D7400BC9E9700D5C0BA00E9DE
      DA00F4E9E700F8F3F200FCF9F800FDFBFB00FDFBFA00FAF7F600F9F0ED00EEE2
      DF00E0CECA00D2BAB100DDC8C000A37267005425190072595100FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F0B91600F0B91600F0B91600F0B91600F0B91600F6D46E00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF003A3A3A0045454500505050005B5B5B0065656500A6A6A600BCBC
      BC00C3C3C300C3C3C300C3C3C300C3C3C300B3B3B300BCBCBC00C9C9C900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E1E1E1007574730075747300C0BFBF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0040181000997B7000D4BAB100CEB9B300DFD1
      CD00F2E4E100F8F4F200FCFAFA00FEFEFE00FEFDFD00FBF8F700F5EFED00EBE0
      DD00DBC9C400CDB5AE00C9ACA2005924190059372D00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FDF4D600F2BF2200F2BF2200F2BF2200F3C43000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00D3D3D3004949490054545400606060006B6B6B00767676008484
      8400949494009F9F9F00A4A4A400A7A7A700ADADAD0077777700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00ECECEC009392910088888700E4E4E400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003F120D00BB9F9800C1ABA400D9C8
      C300E9DEDA00F4EEEC00FBF7F700FEFCFC00FDFBFA00F8F5F300F3ECE900E2D6
      D200CFBCB600CEB4AB0055241A00A59C9800FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C9C9C90056565600626262006D6D6D00797979008585
      850095959500A5A5A500A3A3A300A2A2A20089898900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C8C1BD00501F1500CFBA
      B300DDCECA00EBE1DE00F4EEEB00F7F3F100F6F1EF00F1E9E600E8DDD900D5C3
      BF00B99F970045170C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C1C1C1006C6C6C00777777008181
      81008A8A8A008F8F8F0091919100EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFE00ECEB
      EA00572719006C342200B6948700D8C2B800CDB3A900976C5E004C170F00957C
      7100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFBFE00BCBA
      EE007E7ADE004E4AD100302BCA00211BC600211BC600302BCA004E4AD1007E7A
      DE00BCBAEE00FAFAFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6F5F500E6E3E200D0CC
      CB00BEB9B800B0ABA900A9A5A3009B9695008B8685007F7A79007C7776009B96
      9500C1BDBC00E6E3E200FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAEAFA008B88E1001C17C4001B1E
      BF001B25BB001A2BB8001A2FB5001A30B4001A30B4001A2FB5001A2BB8001B25
      BB001B1EBF001C17C4008B88E100EAEAFA00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FBFAFA00EFEEED00D8D4D300C0BBBA00B1ADAB00AED5EB005C5D
      5D00B6B1B000B2ADAB00708390009E9A9800D6D6D600B3B3B300D0D0D0007E7E
      7E007D7D7D00C1BDBB00E3E0DF00FEFEFD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFD
      FD00F6F6F600F0F0F000EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F0F0F000F2F2
      F200FBFBFB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008E8BE2001C18C3001B24BD001B2FB8001B31
      B7001B32B8001B32B8001B32B8001B32B8001B32B8001B32B8001B32B8001B32
      B8001B31B7001B2FB8001B24BD001C18C3008E8BE200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00F5F3
      F300E3E0DF00C1BDBB00A9A4A3009E9997009C989600A6A1A00090B8CF003A3D
      3E00ABACAA0087868600A2C0D200FFFFFF00956D4000764D2000D2D2D2007676
      76006D6D6D009E999800CCC7C700ECEAE900FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFCFC00DBDB
      DB00949494007575750071717100717171007171710071717100717171007171
      7100717171007171710071717100717171007171710071717100717171007171
      7100717171007171710071717100717171007171710071717100727272007F7F
      7F00B8B8B800F3F3F300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00D7D6F5007A76DD001C20C1001B30BC001B32BB001B33BC001B33
      BC001B33BC001B33BC001B33BD001B33BD001B33BD001B33BD001B33BC001B33
      BC001B33BC001B33BC001B32BB001B30BC001C20C1007A76DD00D7D6F500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F6F5F400E7E4E300D5D1D000C5C0C000ADA9
      A700918D8B00817C7B006B757D00B2B0AF00CFCECE009EC4DB009CBFD4009ABE
      D300A3C2D600A9C6D700728DA000FFFFFF0068411100764C1E00C5C5C5007070
      70006E6E6E00EDEBEA00FCFCFB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EBEBEB008585
      8500FDF8E700E2CEA000E2CEA000E2CEA000E2CEA000E2CEA000E2CEA000E2CE
      A000E2CEA000E2CEA000E2CEA000E2CEA000E2CEA000E2CEA000E2CEA000E2CE
      A000E2CEA000E2CEA000E2CEA000E2CEA000E2CEA000E2CEA000E2CEA000E3D1
      AC00F8F5F000BCBCBC00FBFBFB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C3C1F0001C17C4001C28C0001C34BE001C35BF001C35BF001C35BF001C35
      C0001C35C0001D35C1001D35C1002B41C4002B42C4001E36C1001D35C1001C35
      C0001C35C0001C35BF001C35BF001C35BF001C34BE001C28C0001C17C400C3C1
      F000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8F7
      F700E6E3E200D1CDCC00CCC8C700C1BCBB00A8A3A2009B9695008E888700ABA7
      A700D3D3D300CFCFCF0086B3D00047728A009EC1D700A0C2D70057849E00587B
      960048718C009DC1D800ACC8D900AECADA00514936007D9EB1005F7D8E007171
      71006C6D6D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080C0C0008080A00080E0E00040A0E0000040
      6000402040004040600040606000F0FBFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D7D7D700E3D1
      AD00B78E4300D4B56B00C8A55A00C8A55A00C8A55A00C8A55A00C8A55A00C8A5
      5A00C8A55A00C8A55A00C8A55A00C8A55A00C8A55A00C8A55A00C8A55A00C8A5
      5A00C8A55A00C8A55A00C8A55A00C8A55A00C8A55A00C8A55A00C8A55A00F2DD
      9800D5B97D0087878700F3F3F300FFFFFF00FFFFFF00FFFFFF00FFFFFF00D9D8
      F6001C17C4001C2AC3001C34C2001C35C3001C35C3001C35C4001C35C400364B
      CB008692DC00C5CAEA00EDEDF300F5F5F500F5F5F500EFF0F400C8CDEB008F9A
      DE003C51CC001C35C4001C35C4001C35C3001C35C3001C34C2001C2AC3001C17
      C400D9D8F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00F3F2F100DBD7D700B3AE
      AD0097929100938D8C0099959400B6B4B400D3D3D300D0CFCF00CED0D200D9CD
      C200A4672000B1773200897F690095BDD500608EAA005F90AD00683B0900A96B
      2300A46D2C00B3783500B5772F00ABC6D800B2CBDA00A8C1D40077A8C5006565
      650064646400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0C0C000000000004080A0000080C00040C0E00000A0E0004080
      E0000020600000000000406060008080800040404000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DDDDDD00B68D
      4200D7B35400C69B3600DCB64800DCB64800DCB64800DCB64800DCB64800DCB6
      4800DCB64800DCB64800DCB64800DCB64800DCB64800DCB64800DCB64800DCB6
      4800DCB64800DCB64800DCB64800DCB64800DCB64800DCB64800DCB64800A979
      2000B68A3700947D5900F3F3F300FFFFFF00FFFFFF00FFFFFF00FFFFFF007A76
      DD001D28C5001D35C5001D35C5001D36C6001D36C7002B42CB00959FE200EDEE
      F300F5F5F500F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F5F5
      F500F3F4F500A5AEE5003046CC001D36C7001D36C6001D35C5001D35C5001D28
      C5007A76DD00FFFFFF00FFFFFF00FFFFFF00F8F7F700E1DEDD00BCB7B600B3B2
      B200C4C4C400C6C6C600506D7F00BEB4A600995E1900B6762D00F3972B00FFA9
      2F00B3763100B86F210094BDD400497B98005993B9007F4E1300D1842A00E092
      3900F4A03D00D38E3C00D08C3F0085A2B100C1D5E300427B9C006C6A6A006060
      60005C5C5C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0DCC0000000
      000000000000000000004060800040E0E0000080C00040C0E00000A0E0000080
      E000002080008060A00040204000404040008060600040606000F0FBFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EEEEEE009965
      130099651300EEC32B00EFC42B00EFC42B00EFC42B00EFC42B00EFC42B00EFC4
      2B00EFC42B00EFC42B00EFC42B00EFC42B00EFC42B00EFC42B00EFC42B00EFC4
      2B00EFC42B00EFC42B00EFC42B00EFC42B00EFC42B00EFC42B00EFC42B00EFC4
      2B00A47119009B773F00F9F9F900FFFFFF00FFFFFF00FFFFFF008E8BE2001F23
      C6001D36C9001D36C9001D37CA001D37CB004257D400DADDF100F5F5F500F6F6
      F600F7F7F700F7F7F700F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F7F7
      F700F6F6F600F5F5F500E1E3F1004C60D5001D37CB001D37CA001D36C9001D36
      C9001F23C6008D8AE200FFFFFF00FFFFFF00FFFFFF00C9C4C300C2C4C600C4A7
      8600BC721D00A86C260082B1CC005E60530090C3E400566F8400CA7B1E00F798
      2800C97E2D009CC0D7009CB4C200537D9600663E1200885B2600BA7F3A00C888
      3C00956B3B00D08C3E00D28E4000B27D4100B9D0DF004D86A80098918D006161
      61005E5E5E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F0FBFF00000000004040400080404000F0CA
      A600C0808000400020000060800040E0E0000080E00040C0E0000080E0000080
      E000002060008060800040208000000000004040400080808000C0C0C000A4A0
      A000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8F8F8009965
      1300EABF2A00EBBF2A00EBBF2A00EBC02A00EBC02A00ECC02A00ECC02A00ECC1
      2A00ECC12A00ECC12A00EDC12A00EDC22A00EDC22A00EDC22A00EDC22B00EEC2
      2B00EEC32B00EEC32B00EEC32B00EEC32B00EFC42B00EFC42B00EFC42B00EFC4
      2B00EFC42B0099651300FCFCFC00FFFFFF00FFFFFF00EBEAFA001F1BC5001E34
      CB001E37CD001E38CE001E38CF004358D700E4E6F300F5F5F500F7F7F700F7F7
      F700F8F8F800F9F9F900F9F9F900F9F9FA00F9F9FA00F9F9F900F9F9F900F8F8
      F800F8F8F800F7F7F700F6F6F600ECEDF3004D61D8001E38CF001E38CE001E37
      CD001E34CB001F1BC500EBEAFA00FFFFFF00FFFFFF00CDC9C700C8B7A100D178
      12005168750087B3CD0074B3D90052A4D40097BED7002B3B44009E530000E990
      2600A7C9DE009EC1D800446A7E005B380F00744B1D00AD763800BE823C00CA89
      3D00E8993F00D48F3E00DA934100D2904100C4DBEC004E7082005D9FC3006666
      66005E5E5E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F0FBFF0040002000C0C0C00080404000C0A0
      A000C0808000400000000060600040E0E0000080E00040C0E00000A0E0000080
      E0000020600080608000400080000020400040606000A4A0A000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00E7BB
      2900E7BB2900E7BB2900E7BB2900E7BC2900E8BC2900E8BC2900E8BC2900E8BC
      2900E8BD2900E9BD2900E9BD2900E9BD2900E9BE2900E9BE2900EABE2A00EABE
      2A00EABF2A00EABF2A00EBBF2A00EBBF2A00EBC02A00EBC02A00EBC02A00ECC0
      2A00ECC02A00AD7C1800FEFEFE00FFFFFF00FFFFFF008B88E100212ACB001E38
      D0001E39D2001E39D3002942D600D7DBF200F5F5F500F7F7F700F8F8F800F9F9
      F900E5E7F400808CD5003C4FC1001F35B8001F34B800384BC0007986D300E0E3
      F200F9F9F900F8F8F800F7F7F700F6F6F600E0E3F2003149D7001E39D3001E39
      D2001E38D000212ACB008D8AE200FFFFFF00FFFFFF00CDC9C700C9B296009483
      6300E6EFF4006297B7006940130084551E009461280096BDD600D1DCE1009370
      4000AFD1EA007B8F9E004A677C005B39100092642E00B77D3B00D38E3B00CC8B
      3D00BE833D00D18E3F00CB8B4100D1904200B6D4EC00C3D6E300CBDCE700DBE7
      F00056555500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F0FBFF0040002000C0C0C00080404000C0A0
      A000C0806000402000000060600040E0E0000080C00040C0E00000A0E0004080
      E00000206000806080004000A0000020400080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C293
      1E00E3B72800E3B72800E3B72800E4B72800E4B82800E4B82800E4B82800E4B8
      2800E5B92800E5B92800E5B92800E5B92800E6BA2800E6BA2800E6BA2800E6BA
      2900E6BA2900E7BB2900E7BB2900E7BB2900E7BB2900E7BC2900E8BC2900E8BC
      2900E8BC2900A3701500FFFFFF00FFFFFF00FAFAFE001E18C5001F37D3001F3A
      D5001F3BD6001F3BD70098A4EC00F5F5F500F6F6F600F8F8F800F9F9F900ACB4
      E500243BC0001C34BE001C34BE001C34BE001C34BE001C34BE001C34BE00243B
      C000A4ADE300F9F9F900F8F8F800F7F7F700F5F5F500A5AFEA001F3BD7001F3B
      D6001F3AD5001F37D3001E18C500FAFAFE00FFFFFF00CBC7C600C9AB8C00A4C6
      DD004C82A5007346130095612400A46C2C00AC722E009F6C2F00516C7C00A364
      1B00ABCBDF005664720077491600774C1B00B0783800B47D3C00BF833E00CB8A
      3F00DB923F00FBAD4300FAAC4500FFAD4600AFCDE300B1C6D4002C5871003E61
      74005F5F5F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0040002000F0CAA60080404000C0A0
      A00080808000000000000060800040E0E0000080C00000E0E00000A0E0000040
      C00000206000804080004000A00000000000F0FBFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0A3
      7500DFB32700E0B32700F7ECC900F7ECC900F7ECC900F7ECC900F7ECC900F7EC
      C900F7ECC900F7ECC900F7ECC900F7ECC900F7ECC900F7ECC900F7ECC900F7EC
      C900F8ECC900F8EDC900F8EDC900F8EDC900F8EDC900F8EDC900F8EDC900E4B8
      2800E4B82800D1BE9F00FFFFFF00FFFFFF00BCBAEE00292BCC00203AD800203B
      DA00203BDB003049DE00F2F3F900F6F6F600F7F7F700F9F9F900AEB7E8001E37
      C6001D36C6001D36C6001D36C6001D36C6001D36C6001D36C6001D36C6001D36
      C6001D36C600A2ACE500F9F9F900F8F8F800F6F6F600F3F4F5003E55E000203B
      DB00203BDA00203AD800292BCC00BBB9EE00FFFFFF00C9C6C50090B8D3003358
      6E0074460F00975F1F00A86E2C00A0692D00A86F2F00A76F2E009AC4DE00EB85
      1300B1CFE20052596200774C1B008C5B2300BD803B00B07B3B00BB813D00F5A5
      4000E5A04300D18F4300D0974300D5924400DCF0FF007092AB00FFFFFF006D6D
      6D005F5E5E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F0FBFF0040002000F0CAA60080406000C0A0
      C000C0808000402040004080A00040E0E00000A0E00000C0E00040E0E0000040
      C000002060008060A0004000800000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFB
      FB00DCAF2600DCAF2600DCAF2600DCAF2600DCAF2600DDB02600DDB02600DDB0
      2600DDB02600DDB12600DEB12600DEB12600DEB12600DEB22600DFB22600DFB2
      2600DFB22700DFB22700DFB32700E0B32700E0B32700E0B32700E0B42700E0B4
      2700E1B42700F9F9F900FFFFFF00FFFFFF007E7ADE002A36D300203CDD00203D
      DE00203DDF007688EA00F7F7F700F7F7F700F8F8F800EAECF7002942D0001E38
      CE001E38CF001E38CF001E39D0002740D2002741D2001E39D0001E38CF001E38
      CF001E38CE00253ECF00E5E7F600F8F8F800F7F7F700F5F5F5008F9DEA00203D
      DF00203DDE00203CDD002A36D4007D79DD00FFFFFF00C9C8C7008EB6D0005774
      8F007E4C1200B1722900AE722D00A9712C00A9713000A9713100ADCCE000C1DC
      ED00BAD4E6005B5D65004D32120092602500CF8B3D00EA983E00FFAB4200FFAB
      4200EA9D4300E1984300E0984600AF7D4400CCDDE800EFF3F600F3F3F3006C6C
      6C005E5E5E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F0FBFF0040002000C0A0C00080404000C0A0
      C000C08080004060600080E0E00000C0E00000C0E00000C0E00000E0E0000040
      E00000208000404080004020800000000000F0FBFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFE
      FE00D8AA2500D8AB2500D8AB2500D8AB2500D9AB2500D9AC2500D9AC2500D9AC
      2500DAAC2500DAAD2500DAAD2500DAAD2500DAAD2500DBAD2500DBAE2500DBAE
      2500DBAE2500DBAE2600DCAF2600DCAF2600DCAF2600DCAF2600DCB02600DDB0
      2600DDB02600FCFCFC00FFFFFF00FFFFFF00504BD2002539DA00213DE100213E
      E200213EE300BAC3F500F7F7F700F7F7F700F9F9F900919EE9001F3AD6001F3A
      D6001F3AD7002843D900AAB4ED00F2F2F500F3F4F500B5BEED00304ADA001F3A
      D7001F3AD6001F3AD6008694E700F9F9F900F7F7F700F6F6F600CAD0F200213E
      E300213EE200213DE1002539DA00504BD200FFFFFF00CDCCCB00A9CCE1008262
      3C008B551800BB792C00AD722C00A8712F00A972310095622A0077A8C6004882
      A500B6D3E5002C2F30007D4B10008F5E2700FFB13E00FFAD4100C3863F00C286
      4000C7894300A5784200AD7C4500AB773E00D9E6F000FFFFFF00A5A5A5006868
      680060606000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C0A0A00080606000C0A0A00080606000C0A0
      A000C0A0A0000040600040E0E00000E0E00000C0E00000E0E00000C0E0000060
      E0004080E000002060004020800000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00A06D1500D4A72400D5A72400EAD39100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5E9C800F5E9C800F5EA
      C800F5EAC800F5EAC800F5EAC800F5EAC800F5EAC800F5EAC800D9AB2500D9AC
      2500D5A72300FEFEFE00FFFFFF00FFFFFF002F2AC900223DE100213EE500213F
      E600213FE700E4E7FA00F6F6F600F8F8F800F9F9F9004960E400213DDF00213D
      E000213EE100A5B1F100F5F5F500F5F5F500F5F5F500F5F5F500B7BFEF00213E
      E100213DE000213DDF00415AE300F9F9F900F8F8F800F6F6F600EEEFF5002340
      E700213FE600213EE500223DE1002F2AC900FFFFFF003E7091009DC4DD00764F
      2000784C1800885C2A0093632C00A26D2F008D612F00A8B0AD004D667A008E5C
      2200BDD7E800363A3D00794B1800B8732400B27A3C00C1853E00EB9C4200BB82
      4200B6814200BB844300B4814600DCEFFE00E2EBF400E2EDF500255E7E006666
      660060606000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000C0C0C000C0A0A000C0A0A000C0A0
      8000C0A0A0000040600040E0E00000E0E00000C0E00000C0E00000C0E0000060
      E0004080E000002060008020A00000204000A4A0A000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00EAE4DA00D1A22300D1A32300D1A32300D1A32300D1A32300D2A42300D2A4
      2300D2A42300D2A42300D3A52300D3A52300D3A52300D3A52300D3A52300D4A6
      2300D4A62300D4A62300D4A62400D4A72400D5A72400D5A72400D5A72400D5A8
      2400A06D1500FFFFFF00FFFFFF00FFFFFF00221CC6002440E700223FE8002240
      EA002240EB00F7F8FC00F6F6F600F8F8F800FAFAFA002A45E800223FE800223F
      E800223FE900F1F2FB00F6F6F600F5F5F500F5F5F500F5F5F500F3F4F5002C48
      EA00223FE800223FE8002744E800F9F9FA00F8F8F800F6F6F600F5F5F5002E4B
      EC002240EA00223FE8002440E700221CC600FFFFFF00D0D3D300A7C7DC003641
      49008C561700BD7B2C00A06B2D00BD7B3000C1803200B5D1E5009CCEEC002659
      7C00BFD8E7004E697A00885E2C007C4F1B00CF883A009F723E00AC7A4000A878
      4100B8824400D5934600B67A3400DCE8F0005C7D9000877D6700909DA7007878
      780068686800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0040000000C0A0A000C0A0A000C0A0A000C0A0
      A000C0A0A0000040600040E0E00000E0E00000C0E00000C0E00000C0E0000060
      E0004080E000002060004020A0004020800000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FBFBFB00CD9E2100CD9F2200CD9F2200CE9F2200CE9F2200CE9F2200CEA0
      2200CEA02200CFA02200CFA02200CFA12200CFA12200CFA12200D0A12200D0A2
      2200D0A22200D0A22200D0A22200D1A22300D1A32300D1A32300D1A32300D2A3
      2300D1BE9F00FFFFFF00FFFFFF00FFFFFF00221CC6002D47E8002642E8002643
      EA002643EB00F0F2FB00F7F7F700F8F8F800F9F9F9003F59EA002A46E8002A46
      E9002A46EA00EEF0FB00F8F8F800F5F5F500F5F5F500F5F5F500F3F3F500324D
      EB002A46E9002A46E8003B54E900F9F9FA00F8F8F800F6F6F600F5F5F500324D
      EC002643EA002642E8002D47E800221CC600FFFFFF00D2D6D6009DC0D8002A2C
      2E0078491300A56A2600B5762F00AF743000B8D9F00045759100734B1C006B47
      1D00C2DAE900BFD7E80036383A007E4C13007D562A00AC793F00AE7B4200AB7B
      43008F6C44009F6D3700D9E7F00092B9D1005F9FC4005B3D1B008D8E9000A8A8
      A8007D7D7D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000C0A0A000C0A0A000C0A0A000C0A0
      A000C0A0A0000040600040E0E00000E0E00040C0E00040E0E00080E0E0000060
      E0004080E000002060004020A0004020800000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFEFE00C0901E00C99A2000CA9B2100CA9B2100CA9B2100CA9B2100CA9C
      2100CB9C2100CB9C2100CB9C2100CB9D2100CB9D2100CC9D2100CC9D2100CC9D
      2100CC9E2100CD9E2100CD9E2100CD9E2100CD9F2200CD9F2200CE9F2200CE9F
      2200F9F9F900FFFFFF00FFFFFF00FFFFFF002F2AC9003A52E7002945E9002946
      EB002946EC00DCE0FA00F8F8F800F8F8F800F9F9F900788BF000314DE800324D
      E900324DEA00A2AEF400FCFCFC00F8F8F800F6F6F600F5F5F500B1BBF300324D
      EA00324DE900314DE8006F82EE00F9F9F900F8F8F800F6F6F600ECEDF5002946
      EC002946EB002945E9003951E7002F2AC900FFFFFF00D9D8D600527B9400A0C3
      D9002A4C60005C350C0079532600BED6E700C1DCEC00573F25006C441600C8EA
      FF00CFE0E900C8DEEB00D6E8F50031333800613F190075553100A1744000A879
      42007B7D7200DAE7F1009AB6C7004A8CB30062441F004C351900CCCDCD00CACA
      CA008C8C8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000C0A0A000C0A0A000C0A0A000C0A0
      A000C0A0A0000060600040E0E00000C0E00080E0E00080E0E000F0FBFF0040A0
      E00040A0E000002060004020A0004000800000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A97F3C00C6961F00C6972000C6972000C6972000C6972000C797
      2000C7982000C7982000C7982000C8982000C8992000C8992000C8992000C899
      2000C99A2000C99A2000C99A2000C99A2000C99A2100CA9B2100CA9B2100CA9B
      2100FCFCFC00FFFFFF00FFFFFF00FFFFFF00514CD2004555E3002D48E9002D48
      EA002D49EC00B8C1F700FAFAFA00F7F7F700F9F9F900BEC6F6003E57EA003953
      E9003954EA003F58EB00A6B2F500EFF1FB00F2F3FB00AFB9F600435CEC003954
      EA003953E9003C56E900B7C1F500F9F9F900F7F7F700F6F6F600C8CEF3002D49
      EC002D48EA002D48E9004455E300504BD200FFFFFF00CFD1D30078512400A567
      1E006AA9CE00BDD5E500A5D0E8005590B2005F3203006AA9CF0068482400EE9B
      3900D79F540093653000CBDFEB00D2E3F000E9F5FF008EB6D100C3DEF300D4E3
      EE00E1EDF500A2B8C500E4EEF60069A3C5004A30120061432300E5E7E900D5D5
      D5008F8F8F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0040000000C0C0C000C0A0A000C0A0A000C0A0
      A000C0A0A0004040600080E0E00080E0E00080C0E00080C0E00080A0E00040A0
      E00080C0E000002040004020A0004000800000204000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F9F9F900C2921E00C2921E00C2931F00F0E4C700F0E4C700F0E4
      C700F0E4C700F0E4C700F0E4C700F0E4C700F0E4C700F0E4C700F0E4C700F0E4
      C700F0E4C700F0E4C700F0E5C700F0E5C700F0E5C700C6972000C6972000C394
      1F00FEFEFE00FFFFFF00FFFFFF00FFFFFF007E7ADE004952DC00304CE900304C
      EA00304CEB007B8EF200FCFCFC00F7F7F700F8F8F800F1F3F9007D8EF0004159
      E9004159EA004159EA00415AEB00415AEB00415AEB00415AEB004159EA004159
      EA004159E9007688EF00EFF0F900F8F8F800F7F7F700F5F5F500919FF000304C
      EB00304CEA00304CE9004953DC007D79DD00FFFFFF00C9CBCB00B86D16007F64
      3B0041667C005C3E1D00505F6B006C461A00744C1E009F6C3300D48A3500E695
      3900B1793A00E2943B00AFA28B00B6DCF000DFEAF200D5E5F000D0E2EE00A8D4
      EC004A758B00587380005B6766004885A900704D24006E4F2800E3E4E700DEDE
      DE0092929200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0040000000C0A0A000C0A0A000F0FBFF00FFFF
      FF00FFFFFF00404040004060600080A0A0000020400000204000002040008080
      A000A4A0A000C0A0E000C080E0004020800000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FDFDFD00BE8E1D00BE8E1D00BF8F1D00BF8F1E00BF8F1E00BF8F
      1E00BF8F1E00C0901E00C0901E00C0901E00C0901E00C1911E00C1911E00C191
      1E00C1911E00C1921E00C2921E00C2921E00C2921E00C2921E00C2931F009E6A
      1400FFFFFF00FFFFFF00FFFFFF00FFFFFF00BCBAEE003B3BD1003954E900344F
      EA00344FEB00405AED00F2F3FB00F9F9F900F7F7F700F9F9F900D9DEF7007B8C
      F0004C64EA004860EA004860EB004860EB004860EB004860EB004860EA004C63
      EA007889EF00D3D8F700F9F9F900F7F7F700F6F6F600F0F1F5004B64ED00344F
      EB00344FEA003954E9003B3BD100BCBAEE00FFFFFF00BCBEBE009F5F1400724C
      2300AA6E2700E18E2C007D5931007E572C009C693000D98F39009C6C3700CB88
      3B00A0703A00C4863D00D2E5F4004B758E008E5C26005C3D1900DDE9F200555E
      670063431D005739180088613400957045009E7445008B673F00EDF0F200E7E7
      E70094949400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000C0DCC000F0FBFF00808080008080
      8000806060008060600040404000402040008080A00080808000406080004040
      40008060A0008040C0008040A000C080E00000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00A7751700BB8A1C00BB8A1C00BB8B1D00BB8B1D00BC8B
      1D00BC8B1D00BC8C1D00BC8C1D00BC8C1D00BD8C1D00BD8D1D00BD8D1D00BD8D
      1D00BD8D1D00BE8D1D00BE8E1D00BE8E1D00BE8E1D00BE8E1D00BF8F1E00D1BE
      9F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFAFE001F19C500596CEA003752
      EA003852EB003852EC0099A7F500FCFCFC00F7F7F700F8F8F800F9F9F900DADF
      F70096A4F3007184EE005B71EC005068EA004F67EA005A71EB006F83EE0093A1
      F200D7DCF700F9F9F900F8F8F800F6F6F600F5F5F500A6B2F3003852EC003852
      EB003752EA00596CEA001F19C500FAFAFE00FFFFFF00A2A1A10093560E005E37
      0A00C0B3A500DFE3E70083592900BE7E3100C2833B00A8743A00C88539008F67
      3800AA763C00C2853E00B47D3F00D88F3C00805D34007E5A300098D7FE00545A
      6200795831006A4B2600A67A4800BB874C00A17A4D00B6854F00F7F9FD00F0F0
      F00096969600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C0C0C00080606000F0FBFF00000000000000
      000000000000402020000000000040404000C0DCC000C0C0C000A4A0A0000000
      000000000000002040000020400000204000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CCB59100B7861B00B7861B00B7871B00B8871C00B887
      1C00B8871C00B8871C00B8881C00B9881C00B9881C00B9881C00B9891C00B989
      1C00BA891C00BA891C00BA8A1C00BA8A1C00BB8A1C00BB8A1C00BB8B1C00F9F9
      F900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008D8AE2005155DB00425A
      EA003C55EB003C55EC00415BED00D7DCF900FCFCFC00F8F8F800F8F8F800F9F9
      F900F2F3F900C8CFF600ABB6F5009BA8F3009AA8F300A9B5F400C6CEF600F1F2
      F900F9F9F900F8F8F800F7F7F700F5F5F500D7DCF500465FEE003C55EC003C55
      EB00425AEA005155DB008D8AE200FFFFFF00FFFFFF00FFFFFF0099999A00BCBC
      BC00D0D0D000DBDCDC005E3B120086592600B17B3D00C9893D008D663A00976B
      3B009C6F3A00C3843D00FFC34300B57E40009E723D009C724200A1764400A87A
      470086643F00AC783E009C764B009B754B00A87E4C00A17A4D00F8FBFE00F5F5
      F50096969600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0DCC00040202000A4A0A0008080
      800080808000404040004020200080606000FFFFFF00FFFFFF00C0C0C0000000
      0000404060008060800040404000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FBFBFB00B3821A00B3821A00B4821A00B4831A00B483
      1B00B4831B00B5831B00B5841B00B5841B00B5841B00B5841B00B6851B00B685
      1B00B6851B00B6851B00B6851B00B7861B00B7861B00B7861B00B7861B00FCFC
      FC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EBEAFA00231EC7006A7A
      EB003E58EA003E58EB003F58EC00546BEF00E6E9FA00FCFCFC00F7F7F700F7F7
      F700F8F8F800F9F9F900F9F9F900FAFAFA00FAFAFA00F9F9F900F9F9F900F8F8
      F800F7F7F700F6F6F600F5F5F500E6E8F5005A70EF003F58EC003E58EB003E58
      EA006A7AEB00231EC700EBEAFA00FFFFFF00FFFFFF00FFFFFF00CECECE005A34
      070085664100DADADA004E300C00C67F2C00A2754000A3743D009D6F3C009F70
      3A009E703B00966C3C00B47D3F00BF854200A6784200AC7B450094704600AE7E
      4600A67A48009E764A0099754A00A57B4B00A27A4D00AB804E00F8FCFF00FBFB
      FB0094949400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0040202000C0DCC000C0C0
      C000A4A0A00000000000A4A0A000C0C0C000FFFFFF00C0DCC0008080A0004060
      6000C0C0C000A4A0A00000000000F0FBFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FEFEFE00B07E1900B07E1900B07E1900B07F1900B07F
      1A00B17F1A00B17F1A00B17F1A00B1801A00B1801A00B2801A00B2801A00B281
      1A00B2811A00B2811A00B3811A00B3821A00B3821A00B3821A00B2801A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008E8BE2004344
      D4006276ED00425AEA00425BEB00435BEC00556CEE00D3D9F900FCFCFC00F9F9
      F900F7F7F700F7F7F700F8F8F800F8F8F800F8F8F800F8F8F800F7F7F700F7F7
      F700F6F6F600F5F5F500D9DDF6005C71EF00435BEC00425BEB00425AEA006276
      ED004344D4008E8BE200FFFFFF00FFFFFF00FFFFFF00FFFFFF00D0D0D0007D58
      2E007B4B1200DADADA00412A0D0093643000A67946008F694100986E3D009168
      3C009C6F3D00956C3E00D5914200F8AB4400D18F4500AE7C4500B07F47009C75
      46009D774800A3794B00B1814B00A77D4C00A97F4F009F7A5000FAFCFF00FFFF
      FF0091919100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F0FBFF0040202000FFFFFF00F0FB
      FF00C0C0C00040202000C0C0C000FFFFFF00000000004020200040202000F0FB
      FF00F0FBFF00C0C0C00000000000F0FBFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0099651300AC7A1800AC7A1800AC7A1800AD7B
      1800AD7B1900AD7B1900AD7B1900AD7C1900AE7C1900AE7C1900AE7C1900AE7D
      1900AF7D1900AF7D1900AF7D1900AF7D1900AF7E1900B07E19009B681300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007A76
      DD005E64DF005D72ED00455DEB00455EEC00465EED004C63EE00A0ADF500F3F4
      FB00FCFCFC00FAFAFA00F8F8F800F7F7F700F6F6F600F6F6F600F7F7F700F7F7
      F700F3F4F900A9B5F6004E65EF00465EED00455EEC00455DEB005D72ED005F64
      DF007A76DD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D0D0D0009463
      2C0069461F00DCE0E500442B1100C0813700AB7E4A00BA834400A1733E008D67
      3B009C703D009A6E3F00BF844000BA834200A1754300997245009B744700A379
      47009B754800B7844C00A77D4D00A17A4C00AA804E00A27C4F00F7FCFF00FFFF
      FF008F8F8F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0DCC000FFFFFF00C0C0
      C000A4A0A00080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00A4A0A000FFFF
      FF00C0C0C00080808000C0DCC000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A8761700A8761700A9761700A977
      1700A9771700A9771800AA771800AA771800AA781800AA781800AA781800AB78
      1800AB791800AB791800AB791800AB791800AC7A1800AC7A1800D9C6A800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DAD9
      F6001D18C5006B73E300667AED004860EB004861EC004961ED004961ED00546B
      EF0091A0F400C5CDF800DFE3FA00F3F4FB00F8F9FC00E8EBFB00C8CFF80098A5
      F400586EEF004961ED004961ED004861EC004860EB00667AED006B73E3001D18
      C500D9D8F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D1D2D2007E57
      2D00A9712E005F2C00004A2E0C0092693B00B98850009F764600996E3D009D70
      3D00976D3C009E703F00BA824000C68A4400FDA947009E7544009A7447009773
      4700B6834B00B2824C00A47C4D00A27B4E00A1794C0098704200F8FBFD00FEFE
      FE008F8F8F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A5721600C5961F00A5721600CFA0
      2200E1B42700CA9B2100CA9B2100EFC42B00D8AB2400A6741700C6971F00DDB0
      2600B5831A00A7751700C7981F00CB9D2100C2931E00A8761700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C3C1F0001D18C5006268DF007A8CF0005169EC004B64EC004B64EC004B64
      ED004B64ED004C64EE004C64EE004C64EE004C64EE004C64EE004C64EE004B64
      ED004B64ED004B64EC004B64EC005169EC007A8CF0006268DF001D18C500C3C1
      F000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D1D2D300A16B
      2C009D692F00805A2F00918474008B663B00B1855300C18A4900986F3E00AA77
      3E00A3743D00996E3E009F724100CD8E4400C1884400967146009E7341009D79
      4E00E5DCD300FFFFFF00FAFAFA00F8F8F800F8F8F800F5F5F500F9F9F900EEEE
      EE00ABABAB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0051390A00A16E15005139
      0A0051390A0065460C00845B110051390A0051390A009D6C150051390A005139
      0A0051390A00996A140051390A0051390A0051390A00EDE3D400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00D7D6F5007A76DD004547D4008693EE007184EE00546AEC004E66
      EC004E66EC004E66EC004E66ED004E66ED004E66ED004E66ED004E66EC004E66
      EC004E66EC00546AEC007184EE008693EE004547D4007A76DD00D7D6F500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D2D2D300BC7A
      2F007D593000825C310095673200855C2B00C1915900B6854A00B98241009C6F
      3E0096693400BE926000EEEBEA00F7FAFD00F7F7F700F8F8F800F8F8F800FAFA
      FA00FFFFFF00D9D9D900A8A8A800A4A4A400A3A6A700C8C3C100FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006752290051390A005139
      0A00FFFFFF0051390A0051390A00CAC2B4008878570051390A0051390A00FFFF
      FF0051390A0051390A00725F3900FFFFFF0051390A00D5CFC300FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008E8BE200241FC700595DDC008B97EF008193
      F1006F82EF006176EE00576DED00536AEC00536AEC00576DED006176EE006F82
      EF008193F1008C98EF00595DDC00241FC7008E8BE200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D3D4D5009263
      2E00A86F300093653100A7723300885B2700FFFFFF00FEFEFE00F2F2F200EFEF
      EF00EFEFEF00F3F3F300F6F6F600C0C0C000A8A8A800A6A8A800B4B2B000F9F8
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EBEAFA008D8AE2001E19C5004141
      D2006368DF007C86E8008D99EF0095A2F20095A2F2008D99EF007C86E8006368
      DF004141D2001E19C5008C89E100EBEAFA00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D1D1D300D9DD
      E000DCDDDF00DFDFDE00E2E2E200E4E4E400D3D3D300AEAEAE00A4A4A500A3A6
      A700C5BFBD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFBFE00BCBA
      EE007E7BDE004F4BD200312CCA00231DC600231DC600312CCA004F4BD2007E7B
      DE00BCBAEE00FBFBFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6D6D600C5C5
      C5009EA0A000A6A5A400F2F0EF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFBFB00F9F9F900F8F8
      F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8
      F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8
      F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8
      F800F8F8F800F9F9F900FBFBFB00FFFFFF00FFFFFF00C0C0C000BEBEBE00BABA
      BA00B6B6B600B2B2B200ADADAD00A8A8A800A3A3A3009E9E9E009A9A9A009696
      9600929292009090900092929200969696009A9A9A009E9E9E00A3A3A300A8A8
      A800ADADAD00B2B2B200B6B6B600BABABA00BEBEBE00C0C0C000C0C0C000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005A7174005A7174005A71
      74005A7174005A7174005A7174005A71740059707300576D7000556B6E005369
      6B00516669004F6365004C6062004A5D6000485A5D0046585B00445658004355
      57004456580046585B00485A5D004A5D60004C6062004F636500516669005369
      6B00556B6E00576D70009DAAAC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B7DD
      E30084C5CF0082C3CD0080BFC9007DBBC4007AB6C00077B2BB0073ACB50070A7
      AF006DA2AA006A9EA600679AA20064969D0063949B0064969D00679AA2006A9E
      A6006DA2AA0070A7AF0073ACB50077B2BB007AB6C0007DBBC40080BFC90082C3
      CD0084C5CF0084C5CF00B7DDE300FFFFFF00FBFBFB00EEEEEE00D4D4D400C5C5
      C50053806B00507B6700507B6700507B6700507B6700507B6700507B6700507B
      6700507B6700507B6700507B6700507B6700507B6700507B6700507B6700507B
      6700507B6700507B6700507B6700507B6700507B6700507B6700507B67005380
      6B00C5C5C500CFCFCF00EBEBEB00FBFBFB00C0C0C000F7F7F700E4E4E400E6E6
      E600E9E9E900EBEBEB00EEEEEE00F1F1F100F4F4F400F6F6F600F9F9F900FBFB
      FB00FDFDFD00FFFFFF00FFFFFF00FDFDFD00FBFBFB00F9F9F900F6F6F600F4F4
      F400F1F1F100EEEEEE00EBEBEB00E9E9E900E6E6E600E4E4E400E3E3E300C0C0
      C000C0C0C000FFFFFF00FFFFFF00FFFFFF005A7174006D8388006D8388006D83
      88006D8388006D8388006D8388006D8488006E8489006E8489006E8589006E85
      89006E8589006E8589006E8589006E8589006E8589006E8589006E8589006E85
      89006E8589006E8489006E8489006D8488006D8388006D8388006D8388006D83
      88006D8388006D8388005A717400FFFFFF00FFFFFF00B7DDE30084C5CF0084C5
      CF00E7F8FB00A6E8F000ADEAF100B5ECF200BEEEF400C7F0F500D1F3F700DAF5
      F900E2F8FA00EAFAFC00F1FBFD00F8FDFE00FEFFFF00FEFFFF00F8FDFE00F1FB
      FD00EAFAFC00E2F8FA00DAF5F900D1F3F700C7F0F500BEEEF400B5ECF200ADEA
      F100A6E8F000A1E6EF0084C5CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5F5
      F50053866D0069B7940069B7940069B7940069B7940069B7940069B7940069B7
      940069B7940069B7940069B7940069B7940069B7940069B7940069B7940069B7
      940069B7940069B7940069B7940069B7940069B7940069B7940069B794005386
      6D00F3F3F300FFFFFF00FFFFFF00FFFFFF00C0C0C000F8F8F800E2E2E200E2E2
      E200E2E2E200E3E3E300E3E3E300E4E4E400E4E4E400E4E4E400E4E4E400E4E4
      E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4E400E4E4
      E400E4E4E400E3E3E300E3E3E300E2E2E200E2E2E200E2E2E200E2E2E200C0C0
      C000E9E9E900C0C0C000FFFFFF00FFFFFF005A7174006C8387006C838700CDD4
      D500C9D0D100C9D0D100C9D0D100C9D0D200CAD1D200CAD1D200CAD1D200CAD1
      D200CAD1D200CAD1D200CAD1D200CAD1D200CAD1D200CAD1D200CAD1D200CAD1
      D200CAD1D200CAD1D200CAD1D200C9D0D200C9D0D100C9D0D100C9D0D100CBD2
      D4006C8387006C8387005A717400FFFFFF00FFFFFF0084C5CF00E6F8FB0084C5
      CF00E7F9FB0091D3DA009EE6EE009EE6EE009FE6EF009FE6EF009FE7F0009FE7
      F0009FE7F0009FE7F0009FE7F0009FE7F0009FE7F0009FE7F0009FE7F0009FE7
      F0009FE7F0009FE7F0009FE7F0009FE7F0009FE6EF009FE6EF009EE6EE009EE6
      EE009EE6EE009EE6EE0084C5CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00538A71006BBF99003AAA77003AAA77003AAA77003AAA77003AAA77003AAA
      77003AAA77003AAA77003AAA77003AAA77003AAA77003AAA77003AAA77003AAA
      77003AAA77003AAA77003AAA77003AAA77003AAA77003AAA77006BBF9900538A
      7100FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000F8F8F800E3E3E300E3E3
      E300CDCDCD00CDCDCD00CDCDCD00CDCDCD00E5E5E500E5E5E500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E3E3E300E3E3E300E3E3E300C0C0
      C000E9E9E900C0C0C000FFFFFF00FFFFFF005A7174006C82870064797D00BDC3
      C400B8BEBF00B7BCBE00B6BDBD00B5BCBD00B6BDBD00B8BEBF00B9C0C200BBC1
      C300BDC3C500BEC5C700C0C6C800C1C8CA00C3CACC00C5CCCE00C7CED000C8CF
      D100C9D0D200CAD1D200CAD1D200CAD1D200CAD1D200CAD0D200C9D0D100CDD4
      D500CDD3D5006C8287005A717400FFFFFF00FFFFFF0084C5CF00E7F9FB0084C5
      CF00E7F9FB0092D1D900A0E6EF00A0E6F000A1E7F100A1E7F100A2E8F200A2E8
      F200A2E8F200A2E9F300A2E9F300A2E9F300A2E9F300A2E9F300A2E9F300A2E9
      F300A2E9F300A2E8F200A2E8F200A2E8F200A1E7F100A1E7F100A0E6F000A0E6
      EF00A0E6EF00A0E6EF0084C5CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00528A70006BBD980039A7750039A7750039A7750039A7750039A7750039A7
      750039A7750039A7750039A7750039A7750039A7750039A7750039A7750039A7
      750039A7750039A7750039A7750039A7750039A7750039A775006BBD9800528A
      7000FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000F8F8F800E3E3E300E4E4
      E4004343430071717100C3C3C300C6C6C600E6E6E600E7E7E700D3D3D300D3D3
      D300D3D3D300D3D3D300D3D3D300D3D3D300D3D3D300D3D3D300D3D3D300D3D3
      D300D3D3D300D2D2D200D2D2D200D2D2D200E4E4E400E3E3E300E3E3E300C0C0
      C000EAEAEA00C0C0C000FFFFFF00FFFFFF005A7174006C828600FDFDFD00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FDFDFD006C8286005A717400FFFFFF00FFFFFF0084C5CF00E7F9FB0084C5
      CF00E8F9FB0092D0D800A2E7F000A3E8F100A4E9F200A4E9F200A4EAF300A4EA
      F300A5EBF400A5EBF400A5EBF400A5EBF400A5EBF400A5EBF400A5EBF400A5EB
      F400A5EBF400A5EBF400A4EAF300A4EAF300A4E9F200A4E9F200A3E8F100A2E7
      F000A2E7EF00A2E7EF0084C5CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0052876F006ABB960038A4730038A4730038A4730038A4730038A4730038A4
      730038A4730038A4730038A4730038A4730038A4730038A4730038A4730038A4
      730038A4730038A4730038A4730038A4730038A4730038A473006ABB96005287
      6F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000F8F8F800E5E5E500E5E5
      E5006868680059595900595959001C3D500069C7F500E8E8E800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E5E5E500E5E5E500E4E4E400C0C0
      C000EBEBEB00C0C0C000FFFFFF00FFFFFF005A7174006B818600FDFDFD00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FDFDFD006B8186005A717400FFFFFF00FFFFFF0084C5CF00E8F9FB0084C5
      CF00E8F9FB0094CFD800A6E8F100A7E9F200A7EAF300A7EAF300A8EBF400A8EB
      F400A8EBF400A9ECF500A9ECF500A9ECF500A9ECF500A9ECF500A9ECF500A9EC
      F500A9ECF500A8EBF400A8EBF400A8EBF400A7EAF300A7EAF300A7E9F200A6E8
      F100A5E7F000A5E7EF0084C5CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0051866E0069B9950037A1710037A1710037A17100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0037A1710037A1710037A1710069B995005186
      6E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000F8F8F800E6E6E600E6E6
      E600AAAAAA00595959001C3D5000A8E4F200A8E4F2001C95F500D5D5D500D5D5
      D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5
      D500D5D5D500D4D4D400D4D4D400D3D3D300E6E6E600E6E6E600E5E5E500C0C0
      C000EBEBEB00C0C0C000FFFFFF00FFFFFF005A7174006B818500FDFDFD00FBFB
      FB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFB
      FB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFB
      FB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFB
      FB00FDFDFD006B8185005A717400FFFFFF00FFFFFF0084C5CF00E8F9FB0084C5
      CF00E9F9FB0097D0D900A8E8F200A9E9F300A9EAF400AAEBF500ABECF600ABEC
      F600ABECF600ABECF600ABECF600ABECF600ABECF600ABECF600ABECF600ABEC
      F600ABECF600ABECF600ABECF600ABECF600AAEBF500A9EAF400A9E9F300A8E8
      F200A7E7F100A7E7F00084C5CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0051846D0068B69300379F7000389F7100389F7100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00389F7100389F7100379F700068B693005184
      6D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000F8F8F800E6E6E600E7E7
      E700E0E0E0001C3D5000A8E4F200A8E4F2002AABF7002AABF7001C95F500EBEB
      EB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEB
      EB00EAEAEA00EAEAEA00E9E9E900E8E8E800E7E7E700E6E6E600E5E5E500C0C0
      C000ECECEC00C0C0C000FFFFFF00FFFFFF005A7174006A818500FDFDFD00FBFB
      FB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFB
      FB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFB
      FB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFB
      FB00FDFDFD006A8185005A717400FFFFFF00FFFFFF0084C5CF00E9F9FB0084C5
      CF00EAF9FB009CD4DC00ACEAF300ACEBF400ADECF500AEEDF600AEEDF600AEEE
      F700AEEEF700AEEEF700AEEEF700AEEEF700AEEEF700AEEEF700AEEEF700AEEE
      F700AEEEF700AEEEF700AEEEF700AEEDF600AEEDF600ADECF500ACEBF400ACEA
      F300ABE9F200AAE8F00084C5CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0051836B0069B593003D9F73003E9F73003E9F730032805D0032805D003280
      5D0032805D0032805D0032805D0032805D0032805D0032805D0032805D003280
      5D0032805D0032805D0032805D003E9F73003E9F73003C9F720069B593005183
      6B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000F9F9F900E7E7E700E8E8
      E800CDCDCD0069C7F500A8E4F2002AABF70045C6FA002AABF7002AABF7001C95
      F500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E8E8E800E7E7E700E6E6E600C0C0
      C000EDEDED00C0C0C000FFFFFF00FFFFFF005A7174006B828500FCFCFC00FAFA
      FA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFA
      FA00FAFAFA00EDBF5400FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFA
      FA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFA
      FA00FCFCFC006B8285005A717400FFFFFF00FFFFFF0084C5CF00EAF9FB0084C5
      CF00EAF9FB00A0D7DE00AFEBF300AFECF400B0EDF500B1EEF600B1EFF700B1EF
      F700B1EFF700B2F0F800B2F0F800B2F0F800B2F0F800B2F0F800B2F0F800B2F0
      F800B2F0F800B1EFF700B1EFF700B1EFF700B1EEF600B0EDF500AFECF400AFEB
      F300AEEAF200ADE9F10084C5CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0050816B006BB4930042A0760043A1770043A1770043A1770043A1770043A1
      770043A1770043A1770043A1770043A1770043A1770043A1770043A1770043A1
      770043A1770043A1770043A1770043A1770043A1770041A075006BB493005081
      6B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000F9F9F900E8E8E800E9E9
      E900CDCDCD00EEEEEE002AABF700A2E3FD007DD7FC0045C6FA002AABF7002AAB
      F7001C95F500D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D6D6
      D600D6D6D600D6D6D600D5D5D500D5D5D500E9E9E900E8E8E800E7E7E700C0C0
      C000EDEDED00C0C0C000FFFFFF00FFFFFF005A7174006A818500FCFCFC00FAFA
      FA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFA
      FA00EDC05600EFC56100EFC76400FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFA
      FA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFA
      FA00FCFCFC006A8185005A717400FFFFFF00FFFFFF0084C5CF00EAF9FB0084C5
      CF00EBF9FC00A5D9E200B1EBF400B3EDF600B3EDF600B4EEF700B4EFF800B4EF
      F800B5F0F900B5F0F900B5F0F900B5F0F900B5F0F900B5F0F900B5F0F900B5F0
      F900B5F0F900B5F0F900B4EFF800B4EFF800B4EEF700B3EDF600B3EDF600B1EB
      F400B1EAF300B0E9F20084C5CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0051836C006DB6950048A37A004AA57C004AA57C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF004AA57C004AA57C0047A379006EB796005183
      6C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000F9F9F900E8E8E800EAEA
      EA00CDCDCD00EEEEEE00EEEEEE002AABF700A2E3FD007DD7FC0045C6FA002AAB
      F7002AABF7001C95F500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAEAEA00E8E8E800E7E7E700C0C0
      C000EEEEEE00C0C0C000FFFFFF00FFFFFF005A7174006A818500FBFBFB00F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900EDC0
      5600EFC56100EFC86600F0C86800EFC86600F9F9F900F9F9F900F9F9F900F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9
      F900FBFBFB006A8185005A717400FFFFFF00FFFFFF0084C5CF00EBF9FC0084C5
      CF00ECFAFC00A9DCE400B5EDF500B6EEF600B7EFF700B7EFF700B7F0F800B8F1
      F900B8F1F900B8F1F900B8F1F900B8F1F900B8F1F900B8F1F900B8F1F900B8F1
      F900B8F1F900B8F1F900B8F1F900B7F0F800B7EFF700B7EFF700B6EEF600B5ED
      F500B4EBF300B3EAF20084C5CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0052846D006FB897004FA8800050A8810050A88100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0050A8810050A881004DA77F006FB897005284
      6D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000F9F9F900E9E9E900EBEB
      EB00CDCDCD00CDCDCD00CDCDCD00CDCDCD002AABF700A2E3FD007DD7FC0045C6
      FA002AABF7002AABF7001C95F500D7D7D700D7D7D700D7D7D700D7D7D700D7D7
      D700D7D7D700D6D6D600D6D6D600D6D6D600EBEBEB00E9E9E900E8E8E800C0C0
      C000EFEFEF00C0C0C000FFFFFF00FFFFFF005A7174006A808500FBFBFB00F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900EDBF5600EFC5
      6100EFC76400EFC66300EFC66200EFC66300EFC76400F9F9F900F9F9F900F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9
      F900FBFBFB006A8085005A717400FFFFFF00FFFFFF0084C5CF00ECFAFC0084C5
      CF00EDFAFC00AFE0E700B9EEF500BAEFF600BBF0F700BBF0F700BBF1F800BCF2
      F900BCF2F900BCF2F900BCF2F900BCF2F900BCF2F900BCF2F900BCF2F900BCF2
      F900BCF2F900BCF2F900BCF2F900BBF1F800BBF0F700BBF0F700BAEFF600B9EE
      F500B8ECF300B7EBF20084C5CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0054866F0072B9990055AC850058AC860058AC8600478B6C00478B6C00478B
      6C00478B6C00478B6C00478B6C00478B6C00478B6C00478B6C00478B6C00478B
      6C00478B6C00478B6C00478B6C0058AC860058AC860053AB830072B999005486
      6F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000F9F9F900EAEAEA00ECEC
      EC00EDEDED00EEEEEE00EEEEEE00EFEFEF00F0F0F0002AABF700A2E3FD007DD7
      FC0045C6FA002AABF7002AABF7001C95F500F0F0F000F0F0F000F0F0F000F0F0
      F000EFEFEF00EEEEEE00EEEEEE00EDEDED00ECECEC00EAEAEA00E9E9E900C0C0
      C000F0F0F000C0C0C000FFFFFF00FFFFFF005A7174006A808400FBFBFB00F8F8
      F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800ECBE5200EEC45E00EFC7
      6400EFC56100EEC15A00EDBF5600EEC15A00EFC56100EFC76400F8F8F800F8F8
      F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8
      F800FBFBFB006A8084005A717400FFFFFF00FFFFFF0084C5CF00EDFAFC0084C5
      CF00EEFAFC00B4E4E900BCEFF500BDF0F600BEF1F700BEF1F700BEF2F800BFF3
      F900BFF3F900BFF3F900BFF3F900BFF3F900BFF3F900BFF3F900BFF3F900BFF3
      F900BFF3F900BFF3F900BFF3F900BEF2F800BEF1F700BEF1F700BDF0F600BCEF
      F500BBEDF300BAECF20084C5CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF005588700074BB9B005BAF89005EB08B005EB08B005EB08B005EB08B005EB0
      8B005EB08B005EB08B005EB08B005EB08B005EB08B005EB08B005EB08B005EB0
      8B005EB08B005EB08B005EB08B005EB08B005EB08B005AAE880074BB9B005588
      7000FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FAFAFA00EBEBEB00EDED
      ED00CDCDCD00CDCDCD00CDCDCD00CDCDCD00F1F1F100F1F1F1002AABF700A2E3
      FD007DD7FC0045C6FA002AABF7002AABF7001C95F500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EDEDED00EBEBEB00EAEAEA00C0C0
      C000F0F0F000C0C0C000FFFFFF00FFFFFF005A717400697F8400FAFAFA00F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700EBB74400EDBE5300EEC35D00EEC4
      5E00EDBF5600F7F7F700EBB84700ECBB4C00EDC05600EFC56100EFC76400F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700FAFAFA00697F84005A717400FFFFFF00FFFFFF0084C5CF00EEFAFC0084C5
      CF00EEFAFC00B7E6EB00BFEFF500C0F0F600C0F1F700C0F1F700C1F2F800C2F3
      F900C2F3F900C2F3F900C2F3F900C2F3F900C2F3F900C2F3F900C2F3F900C2F3
      F900C2F3F900C2F3F900C2F3F900C1F2F800C0F1F700C0F1F700C0F0F600BFEF
      F500BDEDF300BDECF20084C5CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00578A710076BD9D0061B28E0066B5910066B59100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0066B5910066B591005FB18C0076BD9D00578A
      7100FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FAFAFA00EBEBEB00EDED
      ED00CDCDCD00EEEEEE00EEEEEE00CDCDCD00F1F1F100F1F1F100D8D8D8002AAB
      F700A2E3FD007DD7FC0045C6FA002AABF7002AABF7001C95F500D8D8D800D8D8
      D800D8D8D800D7D7D700D7D7D700D7D7D700EDEDED00EBEBEB00EAEAEA00C0C0
      C000F1F1F100C0C0C000FFFFFF00FFFFFF005A717400697F8300FAFAFA00F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700EAB54100ECBB4D00EDBE5300ECBE
      5200F7F7F700F7F7F700F7F7F700EAB54000EBBA4A00EDC05600EFC56100EFC7
      6400F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700FAFAFA00697F83005A717400FFFFFF00FFFFFF0084C5CF00EEFAFC0084C5
      CF00EFFAFC00BDE9EF00C3F0F600C4F1F700C4F2F800C4F2F800C5F3F900C6F4
      FA00C6F4FA00C6F4FA00C6F4FA00C6F4FA00C6F4FA00C6F4FA00C6F4FA00C6F4
      FA00C6F4FA00C6F4FA00C6F4FA00C5F3F900C4F2F800C4F2F800C4F1F700C3F0
      F600C1EEF400C1EDF30084C5CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00578B730078BE9F0068B693006CB896006CB89600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF006CB896006CB9960065B5910078BE9E00578B
      7300FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FAFAFA00ECECEC00EEEE
      EE00CDCDCD00EEEEEE00EEEEEE00CDCDCD00F2F2F200F2F2F200FFFFFF00FFFF
      FF002AABF700A2E3FD007DD7FC0045C6FA002AABF7002AABF7001C95F500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EEEEEE00ECECEC00EBEBEB00C0C0
      C000F2F2F200C0C0C000FFFFFF00FFFFFF005A717400687E8300FAFAFA00F6F6
      F600F6F6F600F6F6F600F6F6F600F6F6F600E9B23B00EAB54100EBB74400F6F6
      F600F6F6F600F6F6F600F6F6F600F6F6F600EAB43F00EBBA4A00EDC05600EFC5
      6100EFC76400F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6
      F600FAFAFA00687E83005A717400FFFFFF00FFFFFF0084C5CF00EFFAFC0084C5
      CF00F0FAFC00C1EBF100C5F0F600C6F1F700C6F2F800C6F2F800C7F3F900C8F4
      FA00C8F4FA00C8F4FA00C8F4FA00C8F4FA00C8F4FA00C8F4FA00C8F4FA00C8F4
      FA00C8F4FA00C8F4FA00C8F4FA00C7F3F900C6F2F800C6F2F800C6F1F700C5F0
      F600C3EEF400C3EDF30084C5CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00598C74007ABFA0006EBA980074BD9C0074BD9C005C977C005C977C005C97
      7C005C977C005C977C005C977C005C977C005C977C005C977C005C977C005C97
      7C005C977C005C977C005C977C0074BD9C0073BC9B006BB895007ABFA000598C
      7400FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FAFAFA00EDEDED00EFEF
      EF00CDCDCD00CDCDCD00CDCDCD00CDCDCD00F3F3F300F3F3F300D9D9D900D9D9
      D900D9D9D9002AABF700A2E3FD007DD7FC0045C6FA002AABF7002AABF7001C95
      F500D9D9D900D8D8D800D8D8D800D8D8D800EFEFEF00EDEDED00ECECEC00C0C0
      C000F3F3F300C0C0C000FFFFFF00FFFFFF005A717400677E8200F9F9F900F5F5
      F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5
      F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500EAB43F00EBBA4A00EDC0
      5600EFC56100EFC76400F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5
      F500F9F9F900677E82005A717400FFFFFF00FFFFFF0084C5CF00F0FAFC0084C5
      CF00F1FBFC00C6EEF400C9F1F700CAF2F800CAF3F900CAF3F900CBF4FA00CCF5
      FB00CCF5FB00CCF5FB00CCF5FB00CCF5FB00CCF5FB00CCF5FB00CCF5FB00CCF5
      FB00CCF5FB00CCF5FB00CCF5FB00CBF4FA00CAF3F900CAF3F900CAF2F800C9F1
      F700C7EFF500C6EEF40084C5CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF005A8E76007BC0A10074BD9C007AC0A0007AC0A0007AC0A0007AC0A0007AC0
      A0007AC0A0007AC0A0007AC0A0007AC0A0007AC0A0007AC0A0007AC0A0007AC0
      A0007AC0A0007AC0A0007AC0A0007AC0A0007AC0A00071BB9A007DC1A3005A8E
      7600FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FAFAFA00EDEDED00EFEF
      EF00F0F0F000F1F1F100F1F1F100F2F2F200F3F3F300F3F3F300F3F3F300F3F3
      F300F3F3F300F3F3F3002AABF700A2E3FD007DD7FC0045C6FA002AABF7002AAB
      F7001C95F500F1F1F100F1F1F100F0F0F000EFEFEF00EDEDED00ECECEC00C0C0
      C000F4F4F400C0C0C000FFFFFF00FFFFFF005A717400677E8200F9F9F900F5F5
      F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5
      F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500F5F5F500EAB43F00EBBA
      4A00EDBF5600EEC45E00EEC35D00F5F5F500F5F5F500F5F5F500F5F5F500F5F5
      F500F9F9F900677E82005A717400FFFFFF00FFFFFF0084C5CF00F1FBFC0084C5
      CF00F1FBFC00CAEFF500CCF1F700CDF2F800CDF3F900CDF3F900CEF4FA00CFF5
      FB00CFF5FB00CFF5FB00CFF5FB00CFF5FB00CFF5FB00CFF5FB00CFF5FB00CFF5
      FB00CFF5FB00CFF5FB00CFF5FB00CEF4FA00CDF3F900CDF3F900CDF2F800CCF1
      F700CAEFF500C9EEF40084C5CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF005B8F77007EC2A4007AC0A10081C3A50081C3A500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0081C3A50081C3A50076BE9E007FC3A4005B8F
      7700FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FAFAFA00EEEEEE00F0F0
      F000CDCDCD00CDCDCD00CDCDCD00CDCDCD00F4F4F400F4F4F400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF002AABF700A2E3FD007DD7FC0045C6FA002AAB
      F7002AABF7001C95F500FFFFFF00FFFFFF00F0F0F000EEEEEE00EDEDED00C0C0
      C000F4F4F400C0C0C000FFFFFF00FFFFFF005A717400667E8100F8F8F800F4F4
      F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4
      F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400EAB4
      3F00EBB94900ECBE5200EDBE5300F4F4F400F4F4F400F4F4F400F4F4F400F4F4
      F400F8F8F800667E81005A717400FFFFFF00FFFFFF0084C5CF00F1FBFC0084C5
      CF00F2FBFC00CDF0F500CFF2F700D0F3F800D0F4F900D0F4F900D1F5FA00D2F6
      FB00D2F6FB00D2F6FB00D2F6FB00D2F6FB00D2F6FB00D2F6FB00D2F6FB00D2F6
      FB00D2F6FB00D2F6FB00D2F6FB00D1F5FA00D0F4F900D0F4F900D0F3F800CFF2
      F700CDF0F500CCEFF40084C5CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF005C91790081C4A60081C4A60088C7AB0088C7AB00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0088C7AB0087C7AA007CC2A20081C3A5005C91
      7900FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FBFBFB00EFEFEF00F1F1
      F100CDCDCD00EEEEEE00EEEEEE00CDCDCD00F5F5F500F5F5F500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF002AABF700A2E3FD007DD7FC0045C6
      FA002AABF7002AABF7001C95F500D9D9D900F1F1F100EFEFEF00EEEEEE00C0C0
      C000F5F5F500C0C0C000FFFFFF00FFFFFF005A717400667D8100F8F8F800F3F3
      F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3
      F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3
      F300EAB33D00EAB64300EBB74400F3F3F300F3F3F300F3F3F300F3F3F300F3F3
      F300F8F8F800667D81005A717400FFFFFF00FFFFFF0084C5CF00F2FBFC0084C5
      CF00F3FBFC00D1F1F500D3F3F700D3F4F800D4F5F900D4F5F900D5F6FA00D6F7
      FB00D6F7FB00D6F7FB00D6F7FB00D6F7FB00D6F7FB00D6F7FB00D6F7FB00D6F7
      FB00D6F7FB00D6F7FB00D6F7FB00D5F6FA00D4F5F900D4F5F900D3F4F800D3F3
      F700D1F1F500D0F0F40084C5CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF005E927A0083C6A80087C7AA008ECAAF008ECAAF0071A28C0071A28C0071A2
      8C0071A28C0071A28C0071A28C0071A28C0071A28C0071A28C0071A28C0071A2
      8C0071A28C0071A28C0071A28C008ECAAF008DCAAF0082C4A60083C6A8005E92
      7A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FBFBFB00F0F0F000F2F2
      F200CDCDCD00EEEEEE00EEEEEE00CDCDCD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF002AABF700A2E3FD007DD7
      FC0045C6FA002AABF7002AABF7001C95F500F2F2F200F0F0F000EFEFEF00C0C0
      C000F6F6F600C0C0C000FFFFFF00FFFFFF005A717400657C8000F8F8F800F3F3
      F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3
      F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3
      F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3F300F3F3
      F300F8F8F800657C80005A717400FFFFFF00FFFFFF0084C5CF00F3FBFC0084C5
      CF00F4FBFC00D4F2F500D6F4F700D6F5F800D7F6F900D7F6F900D8F7FA00D9F8
      FB00D9F8FB00D9F8FB00D9F8FB00D9F8FB00D9F8FB00D9F8FB00D9F8FB00D9F8
      FB00D9F8FB00D9F8FB00D9F8FB00D8F7FA00D7F6F900D7F6F900D6F5F800D6F4
      F700D4F2F500D3F1F40084C5CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0060947B0084C7A9008DCAAE0095CEB50095CEB50095CEB50095CEB50095CE
      B50095CEB50095CEB50095CEB50095CEB50095CEB50095CEB50095CEB50095CE
      B50095CEB50095CEB50095CEB50095CEB50094CDB30088C8AB0085C7A9006094
      7B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FBFBFB00F0F0F000F2F2
      F200CDCDCD00CDCDCD00CDCDCD00CDCDCD00F6F6F600F6F6F600DBDBDB00DBDB
      DB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDBDB002AABF700A2E3
      FD007DD7FC0045C6FA002AABF7002AABF7001C95F500F0F0F000EFEFEF00C0C0
      C000F7F7F700C0C0C000FFFFFF00FFFFFF005A717400657B8000F7F7F700F2F2
      F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2
      F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2
      F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2
      F200F7F7F700657B80005A717400FFFFFF00FFFFFF0084C5CF00F4FBFC0084C5
      CF00F5FBFC00D7F2F600D8F3F700D9F5F900D9F5F900DAF6FA00DBF7FB00DBF7
      FB00DCF8FC00DCF8FC00DCF8FC00DCF8FC00DCF8FC00DCF8FC00DCF8FC00DCF8
      FC00DCF8FC00DCF8FC00DBF7FB00DBF7FB00DAF6FA00D9F5F900D9F5F900D8F3
      F700D7F2F600D6F1F50084C5CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0060967D0087C8AB0093CEB3009BD1B9009BD1B9009BD1B9009BD1B9009BD1
      B9009BD1B9009BD1B9009BD1B9009BD1B9009BD1B9009BD1B9009BD1B9009BD1
      B9009BD1B9009BD1B9009BD1B9009BD1B9009BD1B9008DCAAF0087C7AA006096
      7D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FBFBFB00F1F1F100F2F2
      F200F4F4F400F4F4F400F5F5F500F6F6F600F6F6F600F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F7002AAB
      F700A2E3FD007DD7FC0045C6FA002AABF7002AABF7001C95F500F0F0F000C0C0
      C000F7F7F700C0C0C000FFFFFF00FFFFFF005A717400647A7F00F7F7F700F2F2
      F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2
      F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2
      F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2
      F200F7F7F700647A7F005A717400FFFFFF00FFFFFF0084C5CF00F5FBFC0084C5
      CF00F5FCFC00DAF3F600DBF4F700DCF5F800DCF6F900DDF7FA00DEF8FB00DEF8
      FB00DEF8FB00DFF9FC00DFF9FC00DFF9FC00DFF9FC00DFF9FC00DFF9FC00DFF9
      FC00DFF9FC00DEF8FB00DEF8FB00DEF8FB00DDF7FA00DCF6F900DCF5F800DBF4
      F700DAF3F600D9F2F50084C5CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0062977F0089CAAD009AD1B800A2D4BE00A2D4BE00A2D4BE00A2D4BE00A2D4
      BE00A2D4BE00A2D4BE00A2D4BE00A2D4BE00A2D4BE00A2D4BE00A2D4BE00A2D4
      BE00A2D4BE00A2D4BE00A2D4BE00A2D4BE00A1D4BD0092CDB20088C9AC006297
      7F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FBFBFB00F2F2F200F3F3
      F300F4F4F400F5F5F500F6F6F600F7F7F700F7F7F700F7F7F700F8F8F800F8F8
      F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F7F7F700F7F7
      F7002AABF700A2E3FD007DD7FC0045C6FA002AABF7002AABF7001C95F5009393
      9300F8F8F800C0C0C000FFFFFF00FFFFFF005A717400637A7E00ECBD5100ECBD
      5100ECBD5100ECBD5100ECBD5100ECBD5100ECBD5100ECBD5100ECBD5100ECBD
      5100ECBD5100ECBD5100ECBD5100ECBD5100ECBD5100ECBD5100ECBD5100ECBD
      5100ECBD5100ECBD5100ECBD5100ECBD5100ECBD5100ECBD5100ECBD5100ECBD
      5100ECBD5100637A7E005A717400FFFFFF00FFFFFF0084C5CF00F5FCFC0084C5
      CF00F6FCFC00DDF4F600DEF5F700DEF6F800DFF7F900E0F8FA00E0F8FA00E1F9
      FB00E1F9FB00E1F9FB00E1F9FB00E1F9FB00E1F9FB00E1F9FB00E1F9FB00E1F9
      FB00E1F9FB00E1F9FB00E1F9FB00E0F8FA00E0F8FA00DFF7F900DEF6F800DEF5
      F700DDF4F600DBF2F40084C5CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0063997F008ACAAD00A0D4BD00A9D8C300A9D8C300A9D8C300A9D8C300A9D8
      C300A9D8C300A9D8C300A9D8C300A9D8C300A9D8C300A9D8C300A9D8C300A9D8
      C30090B8A60090B8A60090B8A60090B8A6008EB7A5007EB0990074AC93006399
      7F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FBFBFB00F2F2F200F3F3
      F300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF002AABF700A2E3FD007DD7FC0045C6FA002AABF7008B8B8B009999
      9900A4A4A400C0C0C000FFFFFF00FFFFFF005A71740062787D00EEC25A00EEC2
      5A00EEC25A00EEC25A00EEC25A00EEC25A00EEC25A00EEC25A00EEC25A00EEC2
      5A00EEC25A00EEC25A00EEC25A00EEC25A00EEC25A00EEC25A00EEC25A00EEC2
      5A00EEC25A00EEC25A00EEC25A00EEC25A00EEC25A00EEC25A00EEC25A00EEC2
      5A00EEC25A0062787D005A717400FFFFFF00FFFFFF00619BD700487EDD00487E
      DD00487EDD00487EDD00487EDD00487EDD00487EDD00487EDD00487EDD00487E
      DD00487EDD00487EDD00487EDD00487EDD00487EDD00487EDD00487EDD00487E
      DD00487EDD00487EDD00487EDD00487EDD00487EDD00487EDD00487EDD00487E
      DD00487EDD00487EDD00619BD700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00659B81008DCCAF00A6D7C100B0DBC800B0DBC800B0DBC800B0DBC800B0DB
      C800B0DBC800B0DBC800B0DBC800B0DBC800B0DBC800B0DBC800B0DBC800B0DB
      C80095BBAA0061927C0061957C0061957C0061957C0061957C00699B8300659B
      8100FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FBFBFB00F2F2F200F3F3
      F300CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCD
      CD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCD
      CD00CDCDCD00CDCDCD002AABF700A2E3FD0045C6FA0093939300B2B2B200A5A5
      A5009999990093939300FFFFFF00FFFFFF005A71740062787D00EFC76500EFC7
      6500EFC76500EFC76600EFC76500EFC76500EFC76600EFC76500EFC76500EFC7
      6500EFC76500EFC76500EFC76500EFC76500EFC76500EFC76500EFC76500EFC7
      6500EFC76500EFC76500EFC76600EFC76500EFC76500EFC76600EFC76500EFC7
      6500EFC7650062787D005A717400FFFFFF00FFFFFF00487EDD0077A3ED004E7F
      D500558CE800558CE800558CE800558CE800558CE800558CE800558CE800558C
      E800558CE800558CE800558CE800558CE800558CE800558CE800558CE800558C
      E800558CE800558CE800558CE800558CE800558CE800558CE800558CE800558C
      E800558CE800558CE800487EDD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00669D83008ECDB100ABDAC500B6DECC00B6DECC00B6DECC00B6DECC00B6DE
      CC00B6DECC00B6DECC00B6DECC00B6DECC00B6DECC00B6DECC00B6DECC00B6DE
      CC009ABDAD0062977E00D7EEE400D5ECE200BAE0CF008FCCB00070A98F0069A2
      8600FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FCFCFC00F3F3F300F4F4
      F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF002AABF7009B9B9B00CCCCCC00BFBFBF00B2B2
      B200A4A4A400D994E200FFFFFF00FFFFFF005A71740061787C00F1CD7100F1CD
      7100F5DC9B00F8E6B800F5DC9B00F5DC9B00F8E6B800F5DC9B00F1CD7100F1CD
      7100F1CD7100F1CD7100F1CD7100F1CD7100F1CD7100F1CD7100F1CD7100F1CD
      7100F1CD7100F5DC9B00F8E6B800F5DC9B00F5DC9B00F8E6B800F5DC9B00F1CD
      7100F1CD710061787C005A717400FFFFFF00FFFFFF00487EDD0075A2EB004D7D
      D200528BE600528BE600528BE600528BE600528BE600528BE600528BE600528B
      E600528BE600528BE600528BE600528BE600528BE600528BE600528BE600528B
      E600528BE600528BE600528BE600528BE600528BE600528BE600528BE600528B
      E600528BE600528BE600487EDD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00689E840090CEB200B0DCC800BCE1D100BCE1D100BCE1D100BCE1D100BCE1
      D100BCE1D100BCE1D100BCE1D100BCE1D100BCE1D100BCE1D100BCE1D100BCE1
      D100A1C1B30064987F00D3EBE000BFE3D3008ECBB00075AC91006AA38800CFEB
      DE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FCFCFC00F2F2F200F3F3
      F300CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCD
      CD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCD
      CD00CDCDCD00CDCDCD00CDCDCD0097979700E5E5E500D9D9D900CCCCCC009393
      9300F1D7F400E3B2EA00D994E200FFFFFF005A71740061777C00F2D27C00F2D2
      7D00B7B09E0088888800B8B19F00B7B09E0088888800B7B09E00F2D27D00F2D2
      7C00F2D27C00F2D27C00F2D27C00F2D27C00F2D27C00F2D27C00F2D27C00F2D2
      7C00F2D27D00B7B09E0088888800B8B19F00B7B09E0088888800B7B09E00F2D2
      7D00F2D27C0061777C005A717400FFFFFF00FFFFFF00487EDD0072A0E9004A7A
      CF004F88E3004F88E3004F88E3004F88E3004F88E3004F88E3004F88E3004F88
      E3004F88E3004F88E3004F88E3004F88E3004F88E3004F88E3004F88E3004F88
      E3004F88E3004F88E3004F88E3004F88E3004F88E3004F88E3004F88E3004F88
      E3004F88E3004F88E300487EDD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00699F86008FCEB200ADDBC600BFE3D300C2E4D500C3E4D500C3E4D500C3E4
      D500C3E4D500C3E4D500C3E4D500C3E4D500C3E4D500C3E4D500C3E4D500C2E4
      D500A4C2B50065998000B8E0CE0090CDB10070AA8E006BA48A00CFEBDE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FCFCFC00F3F3F300F3F3
      F300F4F4F400F5F5F500F5F5F500F6F6F600F6F6F600F6F6F600F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F6F6F600F6F6
      F600F6F6F600F5F5F500F5F5F500F4F4F400A2A2A200E5E5E500A2A2A200F5E3
      F800EBC6F000E7BCED00E3B2EA00D994E2005A71740061777B00F4D78500F4D7
      860088888800DBDBDB008989890088888800DBDBDB0088888800F4D78600F4D7
      8500F4D78500F4D78500F4D78500F4D78500F4D78500F4D78500F4D78500F4D7
      8500F4D7860088888800DBDBDB008989890088888800DBDBDB0088888800F4D7
      8600F4D7850061777B005A717400FFFFFF00FFFFFF00487EDD00719DE6004777
      CD004D85E0004D85E0004D85E0004D85E0004D85E0004D85E0004D85E0004D85
      E0004D85E0004D85E0004D85E0004D85E0004D85E0004D85E0004D85E0004D85
      E0004D85E0004D85E0004D85E0004D85E0004D85E0004D85E0004D85E0004D85
      E0004D85E0004D85E000487EDD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF006AA1880088CBAD00A1D6BE00B2DDCA00B8E0CE00B9E0CF00BAE1CF00BAE1
      CF00BAE1CF00BAE1CF00BAE1CF00BAE1CF00BAE1CF00BAE1CF00B9E0CF00B8E0
      CE0099BDAD00689D840088CAAC0073AC91006CA58B00CFEBDE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FCFCFC00F4F4F400F4F4
      F400F4F4F400F5F5F500F5F5F500F6F6F600F6F6F600F6F6F600F6F6F600F6F6
      F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6
      F600F6F6F600F5F5F500F5F5F500F4F4F400F4F4F400A3A3A300D994E200F2DB
      F500EED1F300EBC6F000E7BCED00D994E2005A71740060777B00F5DA8B00F5DA
      8C0088888800F0F0F0008989890088888800F0F0F00088888800F5DA8C00F5DA
      8B00F5DA8B00F5DA8B00F5DA8B00F5DA8B00F5DA8B00F5DA8B00F5DA8B00F5DA
      8B00F5DA8C0088888800F0F0F0008989890088888800F0F0F00088888800F5DA
      8C00F5DA8B0060777B005A717400FFFFFF00FFFFFF00487EDD006F9CE5004575
      CA00487FDD00487EDD00487EDD00487EDD00477DDC00477DDC00477DDC00477D
      DC00477DDC00477DDC00487EDD00487EDD00487EDD00487FDD00487FDD00497F
      DD004980DD004980DD004A81DD004A81DD004A81DD004A82DE004A82DE004A82
      DE004B83DE004B83DE00487EDD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF006BA3890082C3A50095CCB3009BCFB8009DD0B9009FD0BA00A0D2BA00A0D2
      BA00A0D2BA00A0D2BA00A0D2BA00A0D2BA00A0D2BA00A0D2BA009FD0BA009DD0
      B90085B09C0070A28B0070AB90006EA78C00CFEBDE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00D994
      E200F2DBF500EED1F300D994E200FFFFFF00FFFFFF005A7174005A7174005A71
      740088888800FFFFFF008888880088888800FFFFFF00888888005A7174005A71
      74005A7174005A7174005A7174005A7174005A7174005A7174005A7174005A71
      74005A71740088888800FFFFFF008888880088888800FFFFFF00888888005A71
      74005A7174005A717400FFFFFF00FFFFFF00FFFFFF00487EDD006D9AE2006D9A
      E2006D9AE2006D9AE2006D9AE2006D9AE2006D9AE2006D9AE2006D9AE2006D9A
      E2006D9AE2006D9AE2006D9AE2006D9AE2006D9AE2006D9AE2006D9AE2006D9A
      E2006D9AE2006D9AE2006D9AE2006D9AE2006D9AE2006D9AE2006D9AE2006D9A
      E2006D9AE2006D9AE200487EDD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF006EA98E006CA58A006CA58A006CA58A006CA58A006CA58A006CA58A006CA5
      8A006CA58A006CA58A006CA58A006CA58A006CA58A006CA58A006CA58A006CA5
      8A006CA58A006CA58A006EA98E00CFECDE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000FFFF
      FF00D994E200D994E200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B9B9B90088888800B9B9B900B9B9B90088888800B9B9B900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B9B9B90088888800B9B9B900B9B9B90088888800B9B9B900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0076A6E000487EDD00487E
      DD00487EDD00487EDD00487EDD00487EDD00487EDD00487EDD00487EDD00487E
      DD00487EDD00487EDD00487EDD00487EDD00487EDD00487EDD00487EDD00487E
      DD00487EDD00487EDD00487EDD00487EDD00487EDD00487EDD00487EDD00487E
      DD00487EDD00487EDD0094B4EB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FDFFFF00FFFEFE00FFFEFF00FFFFFF00FDFFFE00FFFE
      FD00FFFFFF00E5F7FE00A1E0FF004991E90083B1EE00FFFFFF00FFFFFF00FCFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFBFB00F9F9F900F8F8
      F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8
      F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8
      F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8
      F800F8F8F800F9F9F900FBFBFB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFF00FEFFFE00FEFFFE00FEFF
      FE00FEFFFF00FEFFFF00FEF8EB00F8BD8500F7CAAD00FEFFFF00FFFFFF00FFFF
      FF00FEFFFF00FFFEFF00FEFEFF00FFFFFE00FEFEFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FEFFFF00FEFFFF00FEFFFE00FFFFFF00FFFFFE00CEF0
      FF0080D7FF0064C9FE0068CDFF003E89E800377EE1002772DE00689DE900F9FB
      FD00FFFFFF00FEFFFF00FEFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FFFFFF00FFFF
      FF00FFFFFF00E5E5E500D4D4D4009B9B9B00A8A8A800FDFDFD00FFFFFF00FFFF
      FF00FEFEFE00FFFFFF00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFBFB00EEEEEE00D4D4D400C5C5
      C5008D743A008870380088703800887038008870380088703800887038008870
      3800887038008870380088703800887038008870380088703800887038008870
      3800887038008870380088703800887038008870380088703800887038008D74
      3A00C5C5C500CFCFCF00EBEBEB00FBFBFB00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FFFFFF00FFFFFE00FEFF
      FF00FDFFFF00FFEBC500FED89500F5A55B00F0884300FBE3D000FEFFFF00FDFF
      FF00FFFFFE00FFFFFF00FEFFFE00FFFFFF00FEFFFE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FEFEFF00FFFFFE00FEFEFF00FFFFFF00D8F3FF0061C9
      FD004DA9F20061C5FD0068CEFF003C87E6003E8EE6003D8FE7003179E20083AF
      EA00D7E6F800FFFFFF00FDFEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFE
      FE00ECECEC00CDCDCD00CFCFCF00A2A2A20094949400B3B3B300E1E1E100FFFF
      FF00FFFFFF00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5F5
      F50096783600CDA34100CDA34100CDA34100CDA34100CDA34100CDA34100CDA3
      4100CDA34100CDA34100CDA34100CDA34100CDA34100CDA34100CDA34100CDA3
      4100CDA34100CDA34100CDA34100CDA34100CDA34100CDA34100CDA341009678
      3600F3F3F300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FEFFFF00FFFFFF00FFE2
      AE00FDCD7F00F9BD7500FED38800F5A96300F08F4C00F6A66000F18D4800F8C8
      A700FEF3ED00FEFFFF00FEFEFF00FFFEFF00FFFEFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FEFFFC00F8FDFF00BCE8FE004CAEF4003D92EB0092C5
      F5003072DE006DCCFE0066CEFF003D85E7003D8EE70057BCF7003C88E50047A4
      EF00348BE6005C94E700B0CCF300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9F9F900E5E5E500CECE
      CE00A9A9A900CECECE00D0D0D000A2A2A200B7B7B700BEBEBE009B9B9B009D9D
      9D00CECECE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF009B7B3500D7A94000CB8D0000CB8D0000CB8D0000CB8D0000CB8D0000CB8D
      0000CB8D0000CB8D0000CB8D0000CB8D0000CB8D0000CB8D0000CB8D0000CB8D
      0000CB8D0000CB8D0000CB8D0000CB8D0000CB8D0000CB8D0000D7A940009B7B
      3500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFEFF00FDFFFF00FEFBF200FFE8BD00FED4
      8500F8B97C00F8B26C00FFD58900F6AA6300F08F4B00FECE8300F49B5300F18D
      4600F2A06800FEFFFF00FFFFFF00FEFFFF00FFFFFE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFEFE00EAF8FE007FD4FF004587E300307AE100AFD9
      FA008BC1F40066CCFF0064CCFF003D89E600357BE20057B5F5003F8CE5004DB1
      F3004FAEF4002770DF00528FE600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FAFAFA00CECECE00B8B8B800D3D3
      D300A2A2A200CFCFCF00D0D0D000A3A3A300ADADAD00C3C3C3009E9E9E00B1B1
      B1009C9C9C00DBDBDB00F9F9F900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF009A7B3500D5A84000C78B0000C78B0000C78B0000C78B0000C78B0000C78B
      0000C78B0000C78B0000C78B0000C78B0000C78B0000C78B0000C78B0000C78B
      0000C78B0000C78B0000C78B0000C78B0000C78B0000C78B0000D5A840009A7B
      3500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCD09400F2905500FCD1
      8900FEDBAC00FED68C00FED38700F6AB6300EF8C4800F69F5600F1964E00FFDD
      9100FAC27800EF894300F7CAA900FDFFFD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E9F8FE007CD4FF00A3CDF50084D7FE006DC5
      FA003581E40060C4FC0068D0FF003C86E7003A8DE6004EACF1003785E4003D8B
      E5004EACF1003074E000528FE400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FEFEFE00FFFFFF00FFFFFF00E9E9E900A6A6A6009A9A9A00D5D5
      D500D9D9D900CECECE00D0D0D000A3A3A300ADADAD009C9C9C009B9B9B00D0D0
      D000C1C1C10097979700CACACA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0098793500D2A64000C4880000C4880000C4880000C4880000C4880000C488
      0000C4880000C4880000C4880000C4880000C4880000C4880000C4880000C488
      0000C4880000C4880000C4880000C4880000C4880000C4880000D2A640009879
      3500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFFFF00FEFFFF00FCD4A000F4AB8400FFD4
      8B00FED18600F8BF7600FDD58800F5A96200F18F4C00F7AA6200F0914C00FBBD
      7100FCBC7100F08D4A00F8CAAA00FDFEFF00FDFEFE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E9F7FE007FD3FF0069C9FD004EAEF50091C6
      F6002166DC0069C7FD0068CEFF003A86E6003E8EE70053BAF6003B88E5004196
      EB003883E4003279E000528EE500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FEFEFE00FFFFFF00FFFFFF00E8E8E800CBCBCB00D8D8D800CFCF
      CF00ACACAC00CFCFCF00D1D1D100A2A2A200B6B6B600BBBBBB009C9C9C00ACAC
      AC00B2B2B20099999900CCCCCC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0096783500D0A44000C0860000C0860000C0860000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C0860000C0860000C0860000D0A440009678
      3500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFFFF00FEFFFF00FFD48900FABB7400FDD1
      8900F8B98300FBC98B00FFD58A00F5AA6200EF8B4700FECA7B00F39C5500FECE
      8400F7A76300EF8D4900F9CAAA00FEFEFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFE00E8F8FE007CD7FF00417FE0003981E30093D9
      FE008FDCFF0060C6FE0066CDFE003C8AE600367FE2003E8DE8003881E30052B8
      F4004EB1F2002C75E100518FE500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FEFEFE00FFFFFF00FFFFFF00EAEAEA00B3B3B3009A9A9A00D9D9
      D900C4C4C400D0D0D000D0D0D000A2A2A2009A9A9A00B8B8B8009E9E9E00D3D3
      D300B7B7B7009A9A9A00CCCCCC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0094773500CDA24000BD840200BD850300BD850300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00BD850300BD850300BD840200CDA240009477
      3500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFFFF00FCD19500F18E5500FED1
      8A00FDD9AA00FFD68D00FED38600F6AA6300EF8C4600F59B5400F1954E00FFDC
      9100FDC37800F08D4800F8C9AA00FEFFFE00FEFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E8F7FF007AD5FF0087ADEC0089C9F60061C6
      FC00479FED0062C3FC0069CEFF003B87E4003C8DE7003F91E600357EE3004799
      EE0058B9F6002E74E000518FE300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E9E9E900A4A4A40095959500D9D9
      D900DFDFDF00CECECE00D0D0D000A3A3A300A6A6A6009B9B9B009B9B9B00D3D3
      D300C1C1C10099999900CCCCCC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0093763400CBA14200BC860A00BC860B00BC860B00976C0900976C0900976C
      0900976C0900976C0900976C0900976C0900976C0900976C0900976C0900976C
      0900976C0900976C0900976C0900BC860B00BC860B00BC850900CBA142009376
      3400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFFFF00FEDCA600FDDDAC00FED7
      8F00F9BA7B00F8B36D00FED68A00F6A96400F1904C00FCCD8100F3995300F195
      4F00F4975100F08F4900FACAAA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFEFF00E9F7FE0082D6FD0053ABF2003B87E80096CA
      F5003877DF006CCBFE0068CEFF003C86E5003F8DE50054BCF6003E8AE6004CA9
      F2003E94EA003078E200518EE500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FEFEFE00FFFFFF00FFFFFF00EAEAEA00DCDCDC00CACACA00D1D1
      D100A3A3A300CFCFCF00D1D1D100A2A2A200B3B3B300C3C3C3009D9D9D00A2A2
      A2009C9C9C0099999900CCCCCC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0091743500CAA14500BC881100BC891300BC891300BC891300BC891300BC89
      1300BC891300BC891300BC891300BC891300BC891300BC891300BC891300BC89
      1300BC891300BC891300BC891300BC891300BC891300BC881000CAA145009174
      3500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFFFD00FEFFFF00FFD58B00FABE7700FDD1
      8800F8BA8600FBC78800FED58B00F6AB6300F08C4900FFCA7D00F29B5500FBC9
      7E00F4A35B00EE8F4900F7CAAA00FFFFFF00FFFEFE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E8F8FF007ED8FF004280E2002D7AE100A7D8
      FB0098CBF80062CCFE0068CEFF003D8AE7003074DF0052B0F3003E88E5004DB1
      F2004EB2F1002E73DF00518FE400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAEAEA00BBBBBB00A0A0A000D6D6
      D600BABABA00CFCFCF00D0D0D000A2A2A200A1A1A100BFBFBF009E9E9E00CCCC
      CC00AFAFAF009A9A9A00CCCCCC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0093763600CBA34700BE8C1900BF8D1B00BF8D1B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00BF8D1B00BF8D1B00BE8B1700CCA448009376
      3600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFF00FEFFFF00FCD19B00F4A37700FFD6
      8C00FFD88E00FFD58A00FFCC8100FDB05E00F7A25700EF8D4900EF904B00FBBF
      7300FCBE7200F28D4800F7C9AA00FFFFFF00FDFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFE00E9F8FE007AD5FF0098CCF60089DBFF0064CD
      FE0068CEFF0056B9F8004BAFF1004CB2F4004DADF2003885E300337AE0003C88
      E5004DA2F2002D75DE004F90E500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FEFEFE00FFFFFF00E9E9E900B1B1B100C6C6C600D2D2
      D200D1D1D100CCCCCC00BEBEBE00B1B1B100A7A7A700999999009A9A9A00BBBB
      BB00BCBCBC0098989800CCCCCC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0094773700CDA54A00C2912100C2922300C2922300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C2922300C2922300C2901F00CDA54A009477
      3700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEDCA500FDDAAA00FED6
      8900FED58700FEC06F00FEB36100FEB45E00FFB56200F69C5400F0904C00F093
      4C00F59B5400F08F4900F8CAAA00FFFFFF00FEFEFE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FEFEFF00EAF7FF007FD4FF0074D4FF005FCBFF0064CB
      FE0056BCF8004BADF0004CACF1004BABF2004EB3F2004AA8F1003E94E9003476
      DF00367CE2003178E200528EE500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E9E9E900DDDDDD00D3D3D300CFCF
      CF00CECECE00B6B6B600B2B2B200B5B5B500B6B6B600A3A3A3009C9C9C009D9D
      9D00A2A2A2009A9A9A00CCCCCC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0096793800CEA74D00C5952900C5972C00C5972C009F7924009F7924009F79
      24009F7924009F7924009F7924009F7924009F7924009F7924009F7924009F79
      24009F7924009F7924009F792400C5972C00C5972C00C4942600CEA74D009679
      3800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFEFF00FEFFFF00FFD58700FDD58800FEBC
      6900FFB05B00FFBE6B00FFCA7C00F5A96400EF8C4700FEAE5D00FFB66200F9A3
      5800F2965000F08E4A00F8CAAB00FFFEFF00FDFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FEFDFF00E7F7FD0081D6FE0061C6FD0053B5F7004BAD
      F1004EB0F30063C7FE0067CEFE003D89E600357BE0004199ED004BACF2004CAE
      F000449FEB003178E000518EE600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAEAEA00D0D0D000CACACA00B3B3
      B300B2B2B200C4C4C400CDCDCD00A2A2A2009A9A9A00B3B3B300B6B6B600A9A9
      A9009F9F9F0099999900CCCCCC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00977B3900CFA84F00C7993000C89B3400C89B3400C89B3400C89B3400C89B
      3400C89B3400C89B3400C89B3400C89B3400C89B3400C89B3400C89B3400C89B
      3400C89B3400C89B3400C89B3400C89B3400C89B3400C7992E00CFA84F00977B
      3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFFFE00FEFFFF00FECC7B00FDBE6D00FDAF
      5C00FDB86700FCC17500FDCC8400F5A96300F49D5A00F0944F00F6A15500FFB6
      6200FDB05E00F08F4800F7C8A800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFE00EAF7FF007CD1FC004AAEF1004AAEF00057BA
      F70064C8FD004EA6F20066C9FD003E8AE9003F91E800367DE1003883E2004BAB
      F0004FB1F4003491E8005092E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EBEBEB00BFBFBF00B6B6B600B4B4
      B400C0C0C000C0C0C000D2D2D200A3A3A300ABABAB009F9F9F00ABABAB00B6B6
      B600B0B0B00099999900CACACA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF009A7C3A00D2AB5200CA9D3700CCA03D00CCA03D00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CCA03D00CCA03D00C99C3400D2AB52009A7C
      3A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFFFF00FEFEFF00FFEFE000FECC9200F7A7
      6400F8AF6600F8B78800FDD08700F5A96300F2985200F69E5600FABF7600F18F
      4B00F1995100FFF8EF00FFFFFF00FEFEFF00FEFFFE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008AD0FB0072CDFF00378A
      E9007ED3FC0072C2F90068CDFF003F87E7003C89E6003D8BE700419BEC003B8A
      E7003078E000D5EEFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FEFEFE00FFFFFF00FFFFFF00FEFEFE00CDCDCD00C8C8C800A5A5
      A500D1D1D100BFBFBF00D2D2D200A1A1A100AFAFAF00A5A5A500C1C1C1009A9A
      9A00A4A4A400F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF009A7E3B00D3AC5400CDA24000CEA44500CEA44500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CEA44500CFA54500CDA13C00D2AC54009A7E
      3B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFFFF00FEFFFD00FFFFFF00FFF2D800F29E
      6B00FAC28200F8C18600FDC97E00F5A86300F49F5900F3955000F6A96000F294
      4C00F1985B00FFFFFF00FFFFFE00FFFFFE00FEFEFE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FDFEFF00FFFEFF00FEFFFE00CCF0FF008CD4FC006EB8
      F40072D2FF005DB3F40065CAFD003D8AE7003B8CE7003984E3004190E900479A
      EC003679E100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D2D2D200B0B0
      B000D2D2D200C3C3C300D1D1D100A3A3A300ADADAD009E9E9E00B8B8B8009898
      9800B2B2B200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF009C7F3C00D3AD5600D0A64700D2AA4E00D2AA4E00A8873E00A8873E00A887
      3E00A8873E00A8873E00A8873E00A8873E00A8873E00A8873E00A8873E00A887
      3E00A8873E00A8873E00A8873E00D2AA4E00D2A94D00CFA44300D3AD56009C7F
      3C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFFFE00FEFFFF00FEEFD400F39B
      5A00F7B06700F9C39600FDD38C00F6A96300F2924C00F49B5300FABE7400F291
      4A00F2995A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C4EBFE0076D0FD003E97
      EA0080CFFD0076C3F8006ACFFF003D87E7003E8BE6004291E9003E95EA003D8F
      E800387DE200FFFFFF00FEFEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00D3D3D300A6A6
      A600D3D3D300C5C5C500D1D1D100A2A2A200A9A9A900A6A6A600BFBFBF009797
      9700B2B2B200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF009E803E00D4AE5800D2AA4F00D4AE5600D4AE5600D4AE5600D4AE5600D4AE
      5600D4AE5600D4AE5600D4AE5600D4AE5600D4AE5600D4AE5600D4AE5600D4AE
      5600D4AE5600D4AE5600D4AE5600D4AE5600D4AE5600D1A84A00D5B05A009E80
      3E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFFFF00FDEFD000F5AC
      7A00FAC58300F9B77500FCC77D00F4A96200F4A65F00F0924F00F5A15900F493
      4E00F2985B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C4EBFF0087D3FD0058A5
      EE0078D6FF0059B5F70065C9FE003B8BE7003B8BE600367AE1004094E9004297
      EC00357BE100FFFFFF00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00D2D2D200AAAA
      AA00D2D2D200BEBEBE00D2D2D200A3A3A300AEAEAE009C9C9C00BABABA009797
      9700B3B3B300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF009F813F00D6B15B00D5AE5600D7B25E00D7B25E00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00D7B25E00D7B25E00D3AC5100D7B15C009F81
      3F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFEFF00FDFFFE00FFFFFF00FEEFD400F397
      5700F9AD6500FBCA9C00FDD28A00F7A96300F28F4E00F39A5100F9C27600F291
      4B00F1985B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C2EBFF006FCEFE003E95
      EC007ECFFB006BB8F60069CDFF003B85E6003F8DE700408EE6004099EB003583
      E300377DE200FFFFFF00FFFFFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D2D2D200A4A4
      A400D3D3D300C4C4C400D2D2D200A0A0A000ACACAC00A7A7A700C5C5C5009696
      9600B2B2B200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00A1834000D8B35E00D8B35E00DAB76700DAB76700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00DAB76700DAB76600D6B05800D7B25E00A183
      4000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFEFF00FFFEFE00FEFFFF00FEEED100F4AF
      7C00FCCD9000FFD98D00FFD08300FDB26100F7A05500F08D4900F39F5900F494
      4B00F1985A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C3EBFF0089D3FB005DA6
      ED0072D1FE0070D3FF0064CBFF004097EA00357AE0003B83E4004497EB00439B
      ED00367BE000FFFFFF00FFFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00D0D0D000AEAE
      AE00D1D1D100D5D5D500CDCDCD00A9A9A9009A9A9A009D9D9D00B9B9B9009797
      9700B3B3B300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00A3854100D9B46100DAB76600DCBB6F00DCBB6F00B0955800B0955800B095
      5800B0955800B0955800B0955800B0955800B0955800B0955800B0955800B095
      5800B0955800B0955800B0955800DCBB6F00DCBA6E00D8B35F00D9B46100A385
      4100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFFFE00FEFFFE00FEFFFF00FFF0D600FFD1
      8100FFC37100FFAF5C00FEBA6900F6AD6400F6995100FFB66200FDAC5C00EF8D
      4800F3965A00FFFFFF00FFFEFF00FFFFFE00FEFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C2EAFE006ECDFF0065CE
      FF0061C3FB004CAEF2004CACF10049A8F0004DB0F40045A1EE003A87E400357A
      E100377DE100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00D3D3D300CFCF
      CF00C7C7C700B3B3B300B7B7B700AFAFAF00B1B1B100AFAFAF00A1A1A1009595
      9500B3B3B300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00A5874200DAB56200DCBA6D00DFC07800DFC07800DFC07800DFC07800DFC0
      7800DFC07800DFC07800DFC07800DFC07800DFC07800DFC07800DFC07800DFC0
      7800DFC07800DFC07800DFC07800DFC07800DEBE7600DBB86700DAB66300A587
      4200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFFFF00FFFEFF00FEFFFF00FEF1DB00FEB5
      5D00FDB15C00FFC47600F8B97100F6A96300F6A86400F7A25500FEB26100FBA6
      5200F6A56300FFFFFF00FEFFFE00FFFFFD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C1E9FF0065CCFD0053B7
      F5004CAEF30052B3F4005DC2FB003F8CE8003C8CE5004CB0F3004AACF1003784
      E200347CE100FFFFFF00FDFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00CCCCCC00BABA
      BA00B2B2B200BFBFBF00C8C8C800A5A5A500A5A5A500B2B2B200B6B6B6009B9B
      9B00B0B0B000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00A6884300DBB76500DFBE7500E1C37F00E1C37F00E1C37F00E1C37F00E1C3
      7F00E1C37F00E1C37F00E1C37F00E1C37F00E1C37F00E1C37F00E1C37F00E1C3
      7F00E1C37F00E1C37F00E1C37F00E1C37F00E1C37F00DCBB6D00DAB76500A688
      4300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFFFF00FDFEFF00FEFFFF00FFFF
      FA00FCCF9A00FCCD9100F9BD8200F5A96200F5AF6600FABA7100F7AA5E00FFFF
      FF00FFFFFF00FEFFFF00FFFFFF00FDFFFE00FFFFFE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D1EAFA005DBE
      F80051AAF1005199EB005EB8F4004192EA0047A2EF003E8DE6003D8DE70072BF
      F500C6E6FB00FFFFFD00FFFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D8D8
      D800B2B2B200BBBBBB00CACACA00AAAAAA00B5B5B500C1C1C100A6A6A600EBEB
      EB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00A8894500DDB96800E1C37D00E3C78800E3C78800E3C78800E3C78800E3C7
      8800E3C78800E3C78800E3C78800E3C78800E3C78800E3C78800E3C78800E3C7
      8800E3C78800E3C78800E3C78800E3C78800E3C78700DEBE7300DCB86700A889
      4500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FFFFFF00FEFFFE00FEFFFF00FFFD
      F800FDD69E00FAC48A00F6A16600F5A86200FAB86C00F9B56C00F4A25900FFFF
      FF00FEFFFF00FEFFFF00FEFEFE00FEFEFF00FFFFFE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFFFE00FFFFFF0080CE
      FC0068A1EC006BB7F70064C3FA004290E800439BEA00459EEC004CA4F000F2F9
      FD00FFFFFF00FEFEFF00FEFEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ECEC
      EC00B9B9B900B5B5B500BEBEBE00ADADAD00C0C0C000B8B8B800A5A5A500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00AA8B4500DDBA6900E3C78500E6CC9100E6CC9100E6CC9100E6CC9100E6CC
      9100E6CC9100E6CC9100E6CC9100E6CC9100E6CC9100E6CC9100E6CC9100E6CC
      9100C3AD7B00C3AD7B00C3AD7B00C3AD7B00C3AD7900BEA36400BC9D5800AA8B
      4500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFEFF00FFFFFE00FFFEFF00FEFFFF00FFFD
      F500FDDBA200F9C38A00F5A46900F5A96200F8B86F00F6AD6600F59D5300FEFF
      FF00FEFFFF00FFFEFF00FFFEFF00FEFFFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FFFFFF007CCE
      FC004D92E6006EBEF70065C2FB00418FE8004295E90048A5F000449EED00FDFD
      FD00FFFEFE00FDFEFF00FEFFFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E9E9
      E900BABABA00C0C0C000BCBCBC00ADADAD00B6B6B600B9B9B900A4A4A400FFFF
      FF00FFFFFF00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00AD8C4600DEBB6C00E5CA8C00E8D09900E8D09900E8D09900E8D09900E8D0
      9900E8D09900E8D09900E8D09900E8D09900E8D09900E8D09900E8D09900E8D0
      9900C6B18200A2854600A5874400A5874400A5874400A5874400A98E4E00AD8C
      4600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFE
      F700FBD09C00FCCD8E00FDD59500FAAB6000F2954F00FABD7300F9AB6000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFFFF00FFFFFF0087D5
      FD0080C2F4004795EB0055B2F5003F92EA0044A1EE003F91E8004396EB00FCFE
      FF00FEFFFF00FFFEFF00FFFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FFFFFF00E7E7
      E700BCBCBC00AFAFAF00C5C5C500A7A7A700BBBBBB00BCBCBC00A1A1A100FFFF
      FF00FEFEFE00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00AE8E4800DFBD6E00E7CE9300EAD4A100EAD4A100EAD4A100EAD4A100EAD4
      A100EAD4A100EAD4A100EAD4A100EAD4A100EAD4A100EAD4A100EAD4A100EAD4
      A100C7B48800A7894500F4E8CC00F3E6C900EBD6A700DEBC6F00BA9B5200B393
      4900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFC
      F700FED79400FEB66400FEB25E00FFB36000FEB46000FAAC5B00F5954800FEFF
      FF00FEFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFE00FFFFFE0085D1
      FB0080C0F50064CDFF005DC2FB0047A5EE003D8DE6004093EA00439BED00FDFE
      FF00FEFFFF00FDFFFE00FEFEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E2E2
      E200CDCDCD00C2C2C200B6B6B600B5B5B500AFAFAF009E9E9E0098989800FFFF
      FF00FEFEFE00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00AF904900E0BE7000E9D19900ECD8A900ECD8A900ECD8A900ECD8A900ECD8
      A900ECD8A900ECD8A900ECD8A900ECD8A900ECD8A900ECD8A900ECD8A900ECD8
      A900CAB99100A98B4600F2E5C600EDD9AD00DDBC6E00BC9E5600B5944A00F4E4
      C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFE
      FE00FEE1BD00FDAE5500FFB05D00FEB46000FEB36000FFB15A00FDBF7C00FEFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFFFF00FFFFFF007AD4
      FF0067CDFF0054B6F8004BACF2004EAFF2004CB0F1003C88E6003477E100FCFE
      FF00FFFEFE00FEFFFE00FEFFFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DFDF
      DF00BFBFBF00B4B4B400B4B4B400B4B4B400B4B4B400AFAFAF009C9C9C00FEFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B0914B00E1BE6E00E8CF9500EEDAAD00EEDBB000EEDCB100EEDCB100EEDC
      B100EEDCB100EEDCB100EEDCB100EEDCB100EEDCB100EEDCB100EEDCB100EEDB
      B000CBBA9500AA8C4700EBD6A400DFBD7000BC9A5000B6954C00F4E4C000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFFFF00FDFFFF00FEF3E500FEB76800FFD6A800FDFFFF00FFFFFF00FEFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFF00D9EF
      FD008BCAF70044ABF1004DADF2004AAEF4004CB0F20045AAF2007FC8F700FFFF
      FE00FEFEFF00FEFFFE00FEFEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFEFE00C9C9C900B0B0B000B3B3B300B0B0B000E9E9E900FEFEFE00FFFF
      FF00FFFFFF00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B2924C00DFBA6500E6C98500EAD29B00EBD5A300ECD6A500ECD7A600ECD7
      A600ECD7A600ECD7A600ECD7A600ECD7A600ECD7A600ECD7A600ECD6A500EBD5
      A300C8B48600AD8F4B00DDB96600BE9D5300B8974D00F4E4C000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FFFFFE00FFFF
      FD00FAFEFF007CC3F70047ABF2004BAEF20043ABF000C8E6FB00F2F8FF00FFFE
      FE00FEFEFF00FFFFFE00FFFEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FBFBFB00E8E8E800C0C0C000E3E3E300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B4944D00D8B25E00DDBD7700DEC28000DFC38300E0C38400E0C58500E0C5
      8500E0C58500E0C58500E0C58500E0C58500E0C58500E0C58500E0C38400DFC3
      8300BEA56D00B2955400BE9C5000BA994E00F4E4C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00BB9A4F00B5964E00B5964E00B5964E00B5964E00B5964E00B5964E00B596
      4E00B5964E00B5964E00B5964E00B5964E00B5964E00B5964E00B5964E00B596
      4E00B5964E00B5964E00BB9A4F00F4E4C000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAE9E800DCDB
      DA00DCDBDA00DCDBDA00DCDBDA00F6F6F600FFFFFF00FFFFFF00FFFFFF00E6E5
      E500DCDBDA00DCDBDA00EFEEEE00FFFFFF00FFFFFF00FFFFFF00FCFCFC00DEDE
      DD00DCDBDA00DCDBDA00F7F7F600FFFFFF00FFFFFF00FFFFFF00F6F5F500DCDB
      DA00DCDBDA00E0E0DF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FAFAFA00F0F0F000EBEBEB00EBEBEB00EBEBEC00ECECEC00ECEC
      EC00ECECEC00ECECEC00EBEBEC00EBEBEC00EBEBEC00EBEBEC00EBEBEC00ECEC
      EC00ECECEC00ECECEC00EBEBEC00EBEBEB00EBEAEB00EFEFF000F9F9FA00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F7F7F700E6E6E600D8D8D800D3D3D300D5D5D500D3D3D300D3D3D300D3D3
      D300D3D3D300D3D3D300D3D3D300D5D5D500D3D3D300D8D8D800E6E6E600F7F7
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00E4E4
      E300D5D4D300D8D7D600F0F0EF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F2F2
      F200D6D5D400DBDADA00FBFAFA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EBEA
      EA00D4D3D200E3E2E200FEFEFE00FFFFFF00FFFFFF00FFFFFF00FEFEFE00E2E1
      E100D4D3D200ECECEB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F9F9F900EFEFEF00E7E7E800E3E3E400E2E2
      E300E2E2E300E2E2E300E3E3E400E3E3E400E3E3E400E3E3E400E2E2E300E2E2
      E300E2E2E300E3E3E300E7E7E700EEEEEF00F8F8F900FEFEFE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F8F8F800E2E2E200C8C8C800C7C7C700CBCBCB00C9C9C900C9C9C900C9C9
      C900C9C9C900C9C9C900C9C9C900CBCBCB00C7C7C700C8C8C800E2E2E200F8F8
      F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00F8F8F800F1F1
      F100ECECEC00E7E7E700E4E4E400E2E2E300E2E1E200E3E3E400E6E6E600EBEB
      EB00F1F1F100F6F6F700FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFAFA00AFAE
      AE00868585008B8A8900C5C5C400FFFFFF00FFFFFF00FFFFFF00FFFFFF00DBDA
      DA008A89880091909000EAEAEA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0BF
      BF0086858500A4A3A300FAFAFA00FFFFFF00FFFFFF00FFFFFF00F9F8F800A4A3
      A30086858500C1C0C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D7D7D700F4F4
      F300FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5B4B4007574
      7300757473007574730075747300D6D6D500FFFFFF00FFFFFF00FFFFFF009B9B
      9A007574730075747300BBBABA00FFFFFF00FFFFFF00FFFFFF00F9F8F800807F
      7E007574730075747300DEDEDE00FFFFFF00FFFFFF00FFFFFF00D9D9D9007574
      73007574730081818000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DDDDDC0087878600CDCD
      CC00FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F1F1F100C9C9
      C900A1A09F008C8B8A00838281007F7E7D0081807F008A8988009B9B9A00C2C1
      C100ECECEC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00EDEDED00CACACA00AFAFAF00A8A8A800AAAAAA00A6A6A600A6A6A600A6A6
      A600A6A6A600A5A5A500A7A7A700ABABAB00A7A7A700B5B5B500D4D4D400F4F4
      F400FFFFFF00FFFFFF00E1E1E100A0A0A0009B9B9B009B9B9B009D9D9D009D9D
      9D009C9C9C00C9C9C900FFFFFF00FFFFFF00FFFFFF00FFFFFF00888786007574
      7300757473007574730075747300A8A8A700FFFFFF00FFFFFF00FFFFFF009494
      93007574730075747300BDBCBC00FFFFFF00FFFFFF00FFFFFF00F4F4F4007E7D
      7C007574730075747300DCDCDB00FFFFFF00FFFFFF00FFFFFF00D4D3D3007574
      73007574730084838200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A6A6A50077767500ABAB
      AA00FCFCFC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEFEF00AFAFAE007C7B7A007574
      7300757473007574730075747300757473007574730075747300757473007574
      730078777600A5A5A400E8E8E800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F1F1F100BEBEBE00808080008B8B8B009797970090909000909090009191
      910091919100909090009494940098989800878787008B8B8B00D1D1D100F6F6
      F600FFFFFF00FFFFFF00EFEFEF00B6B6B5009B9B9A009B9B9A009E9E9E009D9C
      9C00AAA9A900E0E0E000FFFFFF00FFFFFF00FFFFFF00FFFFFF00959594007574
      7300757473007574730075747300B8B8B700FFFFFF00FFFFFF00FAFAFA008584
      83007574730075747300CBCBCA00FFFFFF00FFFFFF00FFFFFF00EBEBEB007877
      76007574730076757400E4E4E400FFFFFF00FFFFFF00FFFFFF00CECECE007574
      73007574730089888700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F4F4F4009A9A990075747300A1A0
      9F00FCFCFC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CDCCCC007F7E7D0075747300757473007574
      73007A797800908F8E00A4A3A200ACACAB00A6A5A400939392007D7C7B007574
      730075747300757473007A797800BFBFBE00FEFEFE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C3C3C30091919100CCCCCC00E0E0E000D5D5D500D3D3D300D4D4
      D400D6D6D600D5D5D500DCDCDC00E3E3E300C8C8C8008F8F8F00E2E2E200FFFF
      FF00F9F9F900F9F9F900FFFFFF00E1E1E1009C9FA100B0B2B600BFC2C4009C9F
      A100C6C7C800FFFFFF00FBFBFB00F9F9F900FFFFFF00FFFFFF00DCDCDC007D7C
      7B0075747300757473008D8D8C00F3F2F200FFFFFF00FFFFFF00D6D6D5007574
      73007574730077767500E6E5E500FFFFFF00FFFFFF00FFFFFF00D7D7D7007574
      7300757473007E7D7C00F3F3F300FFFFFF00FFFFFF00FFFFFF00C3C2C2007574
      73007574730091908F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E5E5E500C5C4C400D5D5D5009695940083828100B4B3
      B300FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B7B7B6007574730075747300757473008A898800C5C5
      C400EEEEEE00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F2F2F200CECD
      CD0091909000757473007574730075747300A6A6A500FCFCFC00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EEEEEE00E4E4E400C2C2C20085858500B9B9B900CBCBCB00C3C3
      C300C3C3C300CECECE00AAAAAA008A8A8A00D6D6D600E3E3E300F7F7F700FFFF
      FF00C6C6C600B7B7B700BEBDBC00BCBABA00939393009A9A9A00A9A9A8008C8C
      8C00B0AFAF00C5C5C300B7B7B700C6C6C600FFFFFF00FFFFFF00FFFFFF00E9E9
      E900BFBEBE00C6C5C500F6F6F600FFFFFF00FFFFFF00FEFEFE00939291007574
      73007574730092919000FEFEFE00FFFFFF00FFFFFF00FFFFFF00B9B8B8007574
      7300757473008C8B8A00FDFDFD00FFFFFF00FFFFFF00FFFFFF00B0AFAF007574
      7300757473009E9D9C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FAFAFA00DBDADA007D7C7B0081818000A9A9A800ACACAB00F0F0
      F000FFFFFF00FDFDFD00FFFFFF00FFFFFF00F9F8F800FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B8B8B700757473007574730078777600BABAB900FBFBFB00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFEFE00C7C7C6007D7C7B007574730075747300A6A5A400FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E4E4E4007A7A7A0088888800979797008E8E
      8E008E8E8E009B9B9B007C7C7C008C8C8C00F7F7F700FFFFFF00FFFFFF00FFFF
      FF0096989800A0999200D3BCA700B7A18E00BCA99600CBB7A300CEBAA600C1AE
      9A00B6A28F00C5AF9900BBAE9F0096989800FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B8B7B700757473007574
      730075747300CACAC900FFFFFF00FFFFFF00FFFFFF00FFFFFF00959594007574
      730075747300A8A7A700FFFFFF00FFFFFF00FFFFFF00FFFFFF00959493007574
      730075747300B6B6B500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FCFCFC00EBEBEB00C6C6C500A9A9A800D0D0D000CECECE00CBCA
      CA00ECEBEB00F1F1F100C7C7C600D6D6D500C8C8C800C6C6C500DADADA00FCFC
      FC00FAFAFA00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00CFCECE0075747300757473007C7B7A00D6D6D600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E3E3E200848382007574730075747300BCBBBB00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00D1D1D10095959500797979007B7B7B007777
      7700777777007E7E7E007C7C7C00A0A0A000DEDEDE00FCFCFC00FCFCFC00FCFC
      FC009B9EA100B2927300CE9862006E7379007F7D7C007A787700797876007D7C
      7A0072777D00A7896C00D79D62009DA0A300FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FCFCFC00B6B6B50075747300757473007574
      730097969600FDFDFD00FFFFFF00FFFFFF00FFFFFF00E4E4E400777675007574
      730075747300D5D4D400FFFFFF00FFFFFF00FFFFFF00F2F2F2007D7C7B007574
      730075747300D5D4D400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FEFEFE00F5F5F500F8F8F800F7F7F700AEAEAD008483
      8200959493009D9C9C007E7D7C007A7978008A8988007E7D7C0079787700A7A6
      A600C1C1C000F1F1F100FCFCFC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F1F1
      F100858483007574730077767500D5D4D400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E4E4E4007F7E7D007574730079787700E3E3
      E200FFFFFF00FFFFFF00FFFFFF00FFFFFF00C8C8C800C7C7C700CFCFCF00D0D0
      D000D0D0D000D0D0D000D0D0D000D1D1D100979797008D8D8D009F9F9F009393
      930093939300A4A4A40086868600A9A9A900D0D0D000D0D0D000D0D0D000D0D0
      D0007F82840092785C00A2774A00575D64007E7F7F007C7D7D007C7D7D007E7E
      7F0071798000A88A6C00D99B5D009CA0A300FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFEFE00F4F4F300CECECE00919090007574730075747300757473008180
      7F00ECEBEB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A9A9A800757473007574
      730085848300FAFAFA00FFFFFF00FFFFFF00FFFFFF00D6D6D500757473007574
      730079787700EEEEEE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00878685007574
      7300777675007574730075747300757473007574730075747300757473007574
      730075747300A2A1A100C6C5C500FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B6B6
      B5007574730075747300B8B7B700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E6E6E600F0F0F000FFFFFF00FFFFFF00F7F7F700F6F6F600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CCCBCB007574730075747300A1A1
      A000FFFFFF00FFFFFF00FFFFFF00FFFFFF00A6A6A6008D8D8D00969696009696
      9600969696009696960096969600A0A0A0009C9C9C00BEBEBE00CFCFCF00C6C6
      C600C6C6C600D2D2D200B2B2B2009B9B9B009C9C9C0096969600969696009696
      96007274750075695D00795E40004B4F55008282820082828200828282008282
      8200757C8200A98D6F00D69C60009DA1A400FFFFFF00FFFFFF00DADADA009796
      96008E8E8D00807F7F007574730075747300757473007574730083828100DFDF
      DF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E4E4E40078777600757473007574
      7300B9B9B800FFFFFF00FFFFFF00FFFFFF00FFFFFF00A6A5A400757473007574
      730095949300FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ECEBEB007F7E7D007574
      7300757473007574730075747300757473007574730075747300757473007574
      730075747300757473007F7E7D00B7B7B600F4F4F300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F4F4F3008382
      81007574730087878600F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00DEDEDE00797877008C8B8A00F0F0F000FCFCFC0094939200A4A3A200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0098979700757473007675
      7400E3E3E300FFFFFF00FFFFFF00FFFFFF00A8A8A80099999900F2F2F200DCDC
      DC00D8D8D800D9D9D900D9D9D900D9D9D900D7D7D700D3D3D300D2D2D200D2D2
      D200D2D2D200D2D2D200D4D4D400D8D8D800D9D9D900D9D9D900D9D9D900D8D8
      D800E5E5E500E0E0E0007D685000424B5700747A8300757B8300747A8300757B
      840067758500A0866B00D49855009EA2A500FFFFFF00FFFFFF00878685007574
      730075747300757473007574730075747300757473009B9B9A00ECEBEB00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FAFAFA0091908F007574730075747300807F
      7F00F3F3F300FFFFFF00FFFFFF00FFFFFF00F3F3F3007E7D7C00757473007574
      7300C2C1C100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6D6D6007B7A79007574
      7300757473007574730075747300757473007574730075747300757473007574
      730075747300757473007675740081818000C1C1C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D3D3D3007574
      730075747300BBBBBA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E3E3
      E30081807F007574730075747300908F8E009C9B9B007574730086858400F9F8
      F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CDCDCC007F7E7D00B5B4
      B400F1F1F100FFFFFF00FFFFFF00FFFFFF00AAAAAA00A0A0A000E4E4E4008E8E
      8E00787878008080800080808000808080007E7E7E007A7A7A00797979007979
      790079797900787878007B7B7B007F7F7F008080800080808000808080007575
      7500A8A8A800E0E0E0008D78590071614B00B3997500B49A7600B3997500B49A
      7600AC947200CFA56B00E0AA6A009FA2A600FFFFFF00FFFFFF009C9B9B007574
      730075747300757473007A79780099999800CECDCD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00ADACAC00757473007574730075747300C5C5
      C400FFFFFF00FFFFFF00FFFFFF00FFFFFF00BBBBBA0075747300757473007B7A
      7900EDEDED00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D1D1D000787776007574
      7300757473007574730075747300757473007574730075747300757473007574
      7300757473007574730075747300757473007F7E7D00CDCDCC00FAFAFA00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADADAC007574
      730076757400E6E5E500FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E7008483
      820075747300757473007574730075747300757473007574730076757400E6E5
      E500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFAFA00F6F6F600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ACACAC00A2A2A200D4D4D4006262
      6200464646005454540053535300535353005353530053535300535353005353
      5300535353005353530053535300535353005353530053535300535353004242
      420082828200D7D7D7008F826800A0794300ECB76E00ECB76D00ECB76E00ECB7
      6E00EDB46500EBC17900CEB89900A3A4A600FFFFFF00FFFFFF00F5F5F500C7C7
      C600C6C6C500D3D3D300ECEBEB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B6B5B5007574730075747300757473009E9D9D00FDFD
      FD00FFFFFF00FFFFFF00FFFFFF00F4F4F30081807F007574730075747300A6A6
      A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ECEBEB00979695007574
      7300757473007574730075747300757473007574730075747300757473007574
      7300757473007574730075747300757473007574730092919000E0DFDF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00939392007574
      730086858500F9F9F900FFFFFF00FFFFFF00FFFFFF00F0F0F000858483007574
      730075747300757473007574730075747300757473007574730075747300C9C9
      C900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADADAD00A1A1A100D7D7D7007171
      71005C5C5C006B6B6B006A6A6A006A6A6A006A6A6A006A6A6A006A6A6A006A6A
      6A006A6A6A006A6A6A006A6A6A006A6A6A006A6A6A006A6A6A006A6A6A005757
      57008D8D8D00D7D7D7007475770073757800AAADB100AAADB100AAADB100AAAD
      B100AAADB100AAADB100A9AAAC00B7B6B600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FAFAFA00ACACAB0075747300757473007574730088888700F3F2F200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B1B1B000757473007574730078777600E4E4
      E400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CECDCD008D8C
      8B00757473007574730075747300757473007574730075747300757473007574
      730075747300757473007574730075747300757473007E7D7C00BCBBBB00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00868585007574
      730095959400FFFFFF00FFFFFF00FFFFFF00FFFFFF00F1F1F100878786007574
      730075747300757473007574730075747300757473007574730075747300A7A6
      A600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00EFEFEF00FCFCFC00FFFFFF00FFFFFF00ADADAD00A1A1A100D6D6D6007070
      70005B5B5B006B6B6B0069696900696969006A6A6A006A6A6A006A6A6A006A6A
      6A006A6A6A006969690069696900696969006969690069696900696969005757
      57008C8C8C00D7D7D70098989800ADADAD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DFDE
      DE009291900075747300757473007574730083828100E7E7E700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E0E0E000787776007574730075747300AAA9A900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F3F3F300D3D3
      D300908F8E007574730075747300757473007574730075747300757473007574
      73007574730075747300757473007574730075747300767574008D8D8C00F0F0
      F000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00838281007574
      73009B9A9900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F0F0F0009393
      9200757473007574730075747300757473007574730075747300757473008C8B
      8B00FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C3C3
      C30082818000EFEFEF00FFFFFF00FFFFFF00ADADAD00A1A1A100D6D6D6007070
      70005A5A5A006B6B6B0069696900696969006A6A6A006A6A6A006A6A6A006A6A
      6A006A6A6A006969690069696900696969006969690069696900696969005656
      56008C8C8C00D7D7D70098989800ADADAD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00DDDDDC00A6A5A4007675
      74007574730075747300757473008C8B8A00E8E8E700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7F7F7008B8A8A007574730075747300807F7E00F0F0F000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00EFEFEF00ADADAC0089888700757473007574730075747300757473007574
      730075747300757473007574730075747300757473007574730075747300C6C6
      C500FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00878786007574
      730094949300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B0AF
      AF00757473007574730075747300757473007574730075747300757473007A79
      7800ECEBEB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5F5F500A5A4A3007574
      730075747300E4E4E400FFFFFF00FFFFFF00ADADAD00A1A1A100D6D6D6007070
      70005A5A5A006A6A6A0069696900696969006969690069696900696969006969
      6900696969006969690069696900696969006969690069696900696969005656
      56008C8C8C00D7D7D70098989800ADADAD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F3F2
      F200ECEBEB00E2E2E200CECDCD00B1B1B00091908F0075747300757473007574
      73007574730075747300A2A1A100F3F3F300FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFEFE00A09F9E00757473007574730075747300CBCBCA00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EFEFEF00C2C1C100898887007574730075747300757473007574
      730075747300757473007675740077767500757473007574730075747300AEAD
      AD00F9F8F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00959594007574
      730085848300F8F8F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00B6B6B5007574
      7300757473007574730075747300757473007574730075747300757473007574
      7300CECDCD00FFFFFF00FFFFFF00FFFFFF00E0DFDF008A898800757473007574
      730075747300D6D6D600FFFFFF00FFFFFF00AFAFAF00A1A1A100D6D6D6007070
      70005C5C5C006B6B6B0069696900696969006969690069696900696969006969
      69006A6A6A0069696900696969006A6A6A006A6A6A006A6A6A00696969005656
      56008C8C8C00D7D7D70099999900AFAFAF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0BFBF007F7E
      7D00797877007574730075747300757473007574730075747300757473007574
      730085848300C8C7C700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00AEADAD00757473007574730075747300A7A6A600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EFEFEF00BAB9B9007F7E7D0075747300757473007574
      7300757473007574730077767500A4A3A3009594930076757400757473009B9B
      9A00F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B0AFAF007574
      730076757400E3E3E300FFFFFF00FFFFFF00FFFFFF00FFFFFF00B2B2B1008685
      85007B7B7A007574730075747300757473007574730075747300757473007574
      7300AEAEAD00FFFFFF00FDFDFD00C0BFBF007978770075747300757473007574
      730075747300C2C1C100FFFFFF00FFFFFF00B1B1B100A2A2A200D6D6D6007070
      70005C5C5C006D6D6D006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B
      6B006C6C6C006B6B6B006B6B6B006C6C6C006C6C6C006C6C6C006B6B6B005656
      56008C8C8C00D7D7D7009A9A9A00B1B1B100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00807F7F007574
      73007574730075747300757473007574730075747300757473008C8B8A00BFBF
      BE00F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00ADAD
      AC0075747300757473007574730093929100F9F9F900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E9E9E8009796960075747300757473007574
      7300757473007574730076757400BEBDBD00DBDBDB0084838200757473008D8D
      8C00F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6D6D5007574
      730075747300B7B7B600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFD
      FD00F0F0F000D9D8D800BEBDBD00A6A6A500919090007D7C7B00757473007574
      730095949300FFFFFF00C2C2C200757473007574730075747300757473007574
      730075747300ADADAC00FFFFFF00FFFFFF00B2B2B200A2A2A200D6D6D6006F6F
      6F005C5C5C006F6F6F006D6D6D006D6D6D006D6D6D006D6D6D006D6D6D006D6D
      6D006D6D6D006D6D6D006D6D6D006D6D6D006D6D6D006F6F6F006D6D6D005757
      57008B8B8B00D7D7D7009A9A9A00B2B2B200FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B4B3B3007877
      7600767574007A7978008483820093939200B1B1B000DBDBDB00FCFCFC00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F4F4F400A09F9E007574
      7300757473007574730089888700EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00CDCCCC007B7A7900757473007574
      7300757473007574730075747300C7C7C600F2F2F2009E9D9D00757473008584
      8300F6F6F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6F6F6008584
      83007574730085848300F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00F3F2F200DBDBDB00BCBB
      BB00C7C6C600FFFFFF00FCFCFC00DBDBDB00A5A4A30075747300757473007574
      7300757473009A999800FFFFFF00FFFFFF00B5B5B500A3A3A300D6D6D6006E6E
      6E005D5D5D007272720070707000707070007070700070707000707070007070
      7000707070007070700070707000707070007070700071717100707070005757
      57008A8A8A00D7D7D7009C9C9C00B5B5B500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E8E8
      E800E5E5E500EEEEED00F8F8F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DBDADA008B8A8A00757473007574
      7300757473008A898800EAEAEA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F4F4F30095959400767574007574
      7300757473007574730078777600DDDDDC00FEFEFE00C6C5C500757473007E7D
      7C00F6F6F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BABA
      B9007574730075747300B2B1B000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C9C8C80075747300757473007D7C
      7B00757473008C8B8A00FFFFFF00FFFFFF00B5B5B500A3A3A300D3D3D3006565
      65004D4D4D005E5E5E005D5D5D005D5D5D005D5D5D005D5D5D005D5D5D005D5D
      5D005D5D5D005D5D5D005D5D5D005D5D5D005D5D5D005D5D5D005D5D5D004848
      480084848400D3D3D3009C9C9C00B5B5B500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EFEFEF00ADADAC007675740075747300757473007574
      730095959400EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5F5F500A5A4A300767574007574
      7300757473007574730095949300F7F7F700FFFFFF00E8E8E8007E7D7C009291
      9000FCFCFC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5F5
      F500888786007574730075747300CECDCD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00DFDEDE007B7A7900757473007D7C7B00E5E5
      E500DBDBDB00AFAEAE00FFFFFF00FFFFFF00B5B5B500A5A5A500DFDFDF008888
      8800717171007979790079797900797979007979790079797900797979007979
      7900797979007979790079797900797979007979790079797900797979006E6E
      6E00A1A1A100DFDFDF009C9C9C00B5B5B500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00EDECEC00B5B5B400807F7E0075747300757473007574730075747300AAA9
      A900F9F9F900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00B7B7B600757473007574
      7300757473007D7C7B00D8D8D700FFFFFF00FFFFFF00EFEFEF0096959400C1C0
      C000FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00D4D4D400767574007574730079787700CFCECE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00DBDBDB007F7E7D007574730075747300C3C2C200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B4B4B400ADADAD00FFFFFF00FFFF
      FF00FCFCFC00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFD
      FD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FBFB
      FB00FFFFFF00FFFFFF009F9F9F00B4B4B400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00ECEBEB00CECDCD00A09F
      9E007C7B7A007574730075747300757473007574730084838200CDCDCC00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C5C500757473007574
      73007F7E7D00BCBBBB00FDFDFD00FFFFFF00FFFFFF00F8F8F800C4C4C300F7F7
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00BFBFBE00757473007574730076757400B1B0AF00F6F6F600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FCFCFC00BEBEBD00797877007574730075747300AEADAD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B7B7B700A0A0A000ADADAD00B4B4
      B400B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B6B6
      B600B1B1B100AEAEAE00A2A2A200B7B7B700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFAFA00D2D2
      D100CBCBCA00C6C5C500BAB9B900A6A5A4008D8D8C0079787700757473007574
      73007574730075747300757473007B7A7900B0AFAF00F1F1F100FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C9C8C800757473008584
      8300B5B4B400F0F0F000FFFFFF00FFFFFF00FFFFFF00FEFEFE00FCFCFC00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0BFBF0075747300757473007574730083828100BABA
      B900E8E8E700FBFBFB00FFFFFF00FFFFFF00FFFFFF00FCFCFC00ECECEC00C4C4
      C3008A898800757473007574730075747300AEAEAD00FEFEFE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C4C4C400B8B8B800B7B7B700B8B8
      B800B8B8B800B8B8B800B8B8B800B8B8B800B8B8B800B8B8B800B8B8B800B8B8
      B800B8B8B800B8B8B800B8B8B800B8B8B800B8B8B800B8B8B800B8B8B800B8B8
      B800B7B7B700B8B8B800BABABA00C4C4C400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A5A4A3007574
      7300757473007574730075747300757473007574730075747300757473007574
      7300757473007F7E7D00ADACAC00E7E7E700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BCBCBB0093929100C2C2
      C200EEEEEE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00D5D5D5008584830075747300757473007574
      7300777675008787860099999800A1A09F009B9A99008B8A8900787776007574
      730075747300757473007E7D7C00C8C7C700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848382007574
      73007574730075747300757473007574730075747300757473007E7D7C009D9C
      9C00C8C8C800F0F0F000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DAD9D900DFDFDF00F4F4
      F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F4F4F400BAB9B900818180007574
      7300757473007574730075747300757473007574730075747300757473007574
      73007C7B7A00AFAEAE00EEEEEE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D0D0D0008B8A
      8900878685008D8C8B0097969600A8A8A700C0C0BF00DCDCDB00F2F2F200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFBFB00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6F6F600D3D3
      D300ABAAA900908F8E00838281007E7D7C00828180008D8D8C00A6A5A400CDCC
      CC00F2F2F200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E8E8E700E7E6
      E600E7E6E600E7E6E600E7E6E600E7E6E600E7E6E600E6E6E500F8F8F800FDFD
      FD00E6E6E500E7E6E600E7E6E600E7E6E600E7E6E600E7E6E600E7E6E600E6E6
      E500FBFBFB00FBFBFB00E6E6E500E7E6E600E7E6E600E7E6E600E7E6E600E7E6
      E600E7E6E600E7E7E600FFFFFF00FFFFFF00FFFFFF00FDF4FE00FDFAFF00FBFF
      FE00EDEEEA00EFE6FA00EDE7FF00E2E6F100E2E9F200E2E9F200E2E9F200E2E9
      F200E2E9F200E2E9F200E2E9F200E2E9F200E2E9F200E2E9F200E2E9F200E2E9
      F200E2E9F200E2E9F200E2E9F200E2E9F200EFE7F100EAE8FC00DEEAF600E2E8
      F500F1E5FF00F7FAFF00F4FFFC00FBF7F600FFFFFF00FCFEFE00FFFEFF00FFFD
      FF00FFFCFF00FFFBFF00FFFAFF00FFFBFF00FFFFF800FDFFF800FCFFF800FCFF
      F800FDFFFB00FDFFFB00FDFFFC00FDFFFC00FFFBFF00FFFBFF00FFFCFF00FFFA
      FF00FFFBFF00FFFCFF00FFFBFE00FFFAFD00FDFAFF00FBFBFF00FBFFFA00FAFF
      FB00FFFFFF00F8F8FE00FFFDFF00FFFBFC00FFFFFF00F8F3F400F6F3F500F5F3
      F300F4F4F400F2F5F300F2F4F400EFF4F300F3F5F500F4F6F600F3F3F300F4F4
      F400F2F5F300F2F5F300F2F4F400F2F4F400F7F4F600F8F5F700F6F3F500F6F4
      F400F3F3F300F3F4F200F3F3F300F3F3F300F6F4F400F7F5F500F4F4F400F4F4
      F400F2F4F400F2F4F400F5F3F300F5F3F300FFFFFF00FFFFFF00F0F0EF00DEDE
      DD00DDDDDC00DDDDDD00DDDDDD00DDDDDD00DDDDDD00E4E4E400FDFDFD00FFFF
      FF00ECEBEA00DEDEDD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDDDD00E8E7
      E700FEFEFE00FEFEFE00E8E7E700DDDDDD00DDDDDD00DDDDDD00DDDDDD00DDDD
      DD00DEDEDD00ECECEC00FFFFFF00FFFFFF00F1FBFF00FAFBFF00EDE9E400C6BE
      8F00AF9D5600B2934E00B6964B00B59B3D00B99A4B00B99A4B00B99A4B00B99A
      4B00B99A4B00B99A4B00B99A4B00B99A4B00B99A4B00B99A4B00B99A4B00B99A
      4B00B99A4B00B99A4B00B99A4B00B99A4B00C1A04300B3934700AB944400B499
      4F00BA9A6900CABE9A00E8F3DF00F6FCFF00FFFFFF00F6FBFA00FBFDFE00FDFF
      FF00FCFEFF00FDFFFF00FDFFFF00FAFCFD00FFFEFF00FFFCFE00FFFDFF00FFFE
      FF00FDFFFF00FBFCFF00F8FBFF00F9FCFF00F7FEF900F4FBF600F6FCF700FBFF
      FA00FAFBF700F2F1ED00EDEAE600EBE8E400F2EBF200FBFFFE00F6FFF800FAFF
      F900FFFFFE00FFFCFF00FCFDFF00F4FFFF00FFFFFF00FFFFFF00F7F4F600F6F4
      F400F7F7F700F6F6F600F5F7F700F4F6F600F4F6F600F4F4F400F4F4F400F5F5
      F500F4F5F300F4F5F300F1F3F300F3F3F300F7F5F500F9F6F800F8F7F900F4F3
      F500F2F4F400F4F7F500F6F6F600F6F6F600F7F5F500F8F6F600F7F7F700F6F6
      F600F4F6F600F6F6F600F6F6F600F9F7F700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFFAFF00FDF8F900C8B58A00AD8A
      2800B8880400C98E0200CE900000D0970000CE8F0500CE8F0500CE8F0500CE8F
      0500CE8F0500CE8F0500CE8F0500CE8F0500CE8F0500CE8F0500CE8F0500CE8F
      0500CE8F0500CE8F0500CE8F0500CE8F0500CE950000C88D0100C88E0000CB8F
      0000BA820500B08D2B00C6BC8C00F4F4FF00FCFEFF00FFFFFF00F8FFFF00F5FF
      FE00F6FFFE00F4FFFA00F7FFFB00F8FFFB00F7FCFF00FAFCFF00FBFDFF00FDFC
      FF00FFFCFF00FFFCFF00FFFBFF00FFF7FF00F2F7E800F0F5E600EFF1E500E1E2
      D800C3C4BB00A3A39D00989793009E9B9700E0CECD00EDEEE500EFFFF100F0FF
      F300FBFDF700FFFEFF00FDFFFF00F4FFFF00F8F6F600F8F6F600F7F5F500F7F5
      F500F8F8F800F5F5F500F6F6F600F3F3F300F3F4F200F2F0EF00EAE8E800DCDA
      DA00D1CFCE00C6C4C300BFBFBF00C2C2C200C8C6C600C5C3C300BDBFC000C4C8
      C900D0D5D400DBE0DE00E7E9E900EFF1F200F4F3F500F6F5F700F7F6F800F6F5
      F700F6F6F600F6F6F600F6F6F600F5F5F500FFFFFF00FFFFFF00B1B0AF00807F
      7E007F7E7D007F7E7D007F7E7D007F7E7D007F7E7D00908F8E00F2F2F200FDFD
      FD00A1A1A0007F7E7D007F7E7D007F7E7D007F7E7D007F7E7D007F7E7D009A9A
      9900FAFAFA00F6F6F600959594007F7E7D007F7E7D007F7E7D007F7E7D007F7E
      7D007F7E7D00AAA9A900FFFFFF00FFFFFF00FFFEFF00F8E0C400B4823600C07D
      0300DA900200DA900200D1890000D08B0000CA860500CA860500CA860500CA86
      0500CA860500CA860500CA860500CA860500CA860500CA860500CA860500CA86
      0500CA860500CA860500CA860500CA860500C9850000CC890F00D0890A00D78F
      0100CF8E0000BD840000BB944600EFDEDB00FFFEFF00FDFFFF00F6FBFA00F5FC
      F900FAFFFC00FBFFFB00FFFFF900FBFCF300FFFEFF00FFFEFF00FEF9FA00F4EF
      F000F1EDEC00EEEAE900E2DEDD00D3CFCE00B3BAB300888E89004E5552001F27
      2700030C1000000007000000080000000A0025201F00A5A29D00E6ECE100EBF7
      EB00F6FFF900F1F7F200FFFEFF00FFFCFF00F8F6F600F8F6F600F8F6F600F7F5
      F500F7F6F800F6F6F600F6F4F400F8F6F600F8F6F500F5F3F200F3F1F100EFED
      ED00D7D5D400D1CFCE00CFCFCF00D2D2D200D7D5D400D4D2D200CBCDCE00CACE
      CF00D8DDDC00EBEEEC00EFF1F100F4F4F400F8F7F900F6F5F700F6F5F700F6F6
      F600F6F6F600F6F6F600F6F6F600F5F5F500FFFFFF00FFFFFF007D7C7B007574
      7300757473007574730075747300757473007574730075747300DCDCDC00F3F2
      F200757473007574730075747300757473007574730075747300757473007574
      7300EBEBEB00E4E4E40075747300757473007574730075747300757473007574
      7300757473007D7C7B00FFFFFF00FFFFFF00FFFEFE00F5D3A800B5721600D27B
      0300D67C0000C9770000C4790D00C3761500CE7D0E00CE7D0E00CE7D0E00CE7D
      0E00CE7D0E00CE7D0E00CE7D0E00CE7D0E00CE7D0E00CE7D0E00CE7D0E00CE7D
      0E00CE7D0E00CE7D0E00CE7D0E00CE7D0E00D47D0900C97B1700C2710E00C779
      0800CA860300CD810000BF7F2100E7CEB400FCFBFD00FBF8FA00FFFFFF00FFFF
      FE00FFFBFA00FFFBF800FFFFFB00F1EBE600EAEEE300E4E5DC00D7D5CD00C2BF
      B700A29C9700746B67003E3532001B0F0D0007000E0000001100001025000936
      4B001E6B7E00339CAF003BB9CB0038C2D400144A5100000008007C6E7900D7C8
      CC00F0F3F100F6FFFC00FFFFFE00FFF9FD00F6F5F700F7F6F800F7F7F700F7F7
      F700F6F6F600F7F7F700F6F6F600F8F6F500F8F6F600F9F7F700E7E7E700D6D6
      D600D3D4D200D8D9D700D9D9D900D8D8D800D7D5D400D8D6D500D9D7D700DAD8
      D800D7D5D500D9D7D600EAE8E700F5F6F400F6F7F300F7F8F600F7F8F600F8F8
      F800F7F7F700F4F6F600F7F6F800F6F5F700FFFFFF00FFFFFF00807F7F007574
      7300757473007574730075747300757473007574730075747300DDDDDC00F2F2
      F200797877007574730075747300757473007574730075747300757473007675
      7400EBEBEB00E5E5E50075747300757473007574730075747300757473007574
      730075747300807F7F00FFFFFF00FFFFFF00F6FCFF00EBD2AA00B26F1300D977
      0B00D4710500D17C0E00CE7D1400C66F1100D5760800D5760800D5760800D576
      0800D5760800D5760800D5760800D5760800D5760800D5760800D5760800D576
      0800D5760800D5760800D5760800D5760800E1790200CD770D00CE740F00D079
      1100C67A0900D2750000BE711500D3C4A300FFFFFE00FFFFFF00FFF7F800FFFD
      FF00FFFDFF00E2DBDE00BFBEC200A7AAAE0085777900544C4D00191A1E000000
      06000001080000111A0000323D00144F59001384A50030A4C5004AC5E70052D2
      F5004FD7FB004BDAFF0049DCFF0044DAFF0051D2ED0010587A00000019004530
      4900BAACB700E7EAE800FFFFFE00FFFDFF00F7F6F800F9F9F900F8F8F800F9F9
      F900F7F7F700F7F7F700F7F8F600F5F6F400F5F3F300DFDDDD00D5D5D500D8D9
      D700D9D7D600DAD8D700DCDAD900D9D7D700DADADA00DBD9D900DDDAD600DED9
      D600DDD9D800DAD8D800D9D7D700E0E1DF00F5F6F200F7F8F400F7F8F600F8F9
      F700F9F9F900F7F9F900FAFAFA00F8F8F800FFFFFF00FFFFFF0081807F007574
      7300757473007574730075747300757473007574730075747300DDDDDC00F2F2
      F200797877007574730075747300757473007574730075747300757473007675
      7400EBEBEB00E5E5E50075747300757473007574730075747300757473007574
      730075747300807F7F00FFFFFF00FFFFFF00EDF9FF00EAD3A500AF690C00D66F
      0F00D46A1300CE731800BE670B00B7580800AC570700AC570700AC570700AC57
      0700AC570700AC570700AC570700AC570700AC570700AC570700AC570700AC57
      0700AC570700AC570700AC570700AC570700B6590400AC5C0700C1640900D26D
      1100CB6D0E00DD6A0100C16B1700D0D1AA00F7FDF800FFFFFC00FFFCFD00FFFC
      FF00D5D0D9005B646E000218230000000B000000190000122E00103C5B00246E
      90002C96BB0029AFD70025C3EB0026D0FA0021CEFC0023CEFC0022CAF90023C5
      F50028C6F60032CCFD0038CDFF0039CCFE002AC9FF0021A1DC002A7AAF000017
      3D00040A1D00E0DBDD00FBFCF800F5FCF900F7F7F700F8F8F800F9F9F900F8F9
      F700F8F8F800F8F8F800F9F7F600F5F6F400DCDCDC00D9D9D900D7D5D400DCDB
      D700DEDBD700DFDBD600E4DED700E0DBD800D8D9DD00D9DBDC00E1DDD800E4DE
      D700DCDAD900D9DBDC00DADBDF00D8D7D900E1DFDF00F8F6F500F6F7F500F8F8
      F800F7F7F700F8F8F800F9F9F900F8F9F700FFFFFF00FFFFFF0081807F007574
      7300757473007574730075747300757473007574730075747300DDDDDC00F2F2
      F200797877007574730075747300757473007574730075747300757473007675
      7400EBEBEB00E5E5E50075747300757473007574730075747300757473007574
      730075747300807F7F00FFFFFF00FFFFFF00FBFFF700F6DA9A00B4630000D564
      0E00C9591700BC5E1C00B65E1E00D5754000AB6C5000AB6C5000AB6C5000AB6C
      5000AB6C5000AB6C5000AB6C5000AB6C5000AB6C5000AB6C5000AB6C5000AB6C
      5000AB6C5000AB6C5000AB6C5000AB6C5000B26D5900A3684000B35C1E00C85C
      1500CF631500E5630400BD5F0C00C5CFA400F8FFFB00F6FAF500FFFEFF00E8E1
      E800474B560000000D0019485600518E9C0011B1D10022C1E5002FCCF80029C4
      FB0021BBFC001FB8FF001EB6FF001AB1FF0023B7F30023B5F10023B5EF0025B8
      F00029BDF3002CC0F40030C4F80032C7F9001FB3FF000093DF000AA3E0002B95
      BE00000B1E00AEAAAF00FFFAF700F8FFFC00F6F6F600F6F6F600F8F8F800F9F9
      F900F8F8F800F8F8F800FDFBFA00E5E6E400D7D7D700DAD8D700E1DDD800E5DE
      D500ECE0D400EFE2D200F1E2CF00F2E5D500DFDAD700E0DBD800E5D8C800E0D2
      BF00E9E1D400E4E1D900DFDDDD00DCDBDD00D9D4D500E9E5E400F7F7F700F5F7
      F700F8F8F800F7F7F700F9FAF800F8F9F700FFFFFF00FFFFFF0081807F007574
      7300757473007574730075747300757473007574730075747300DDDDDC00F2F2
      F200797877007574730075747300757473007574730075747300757473007675
      7400EBEBEB00E5E5E50075747300757473007574730075747300757473007574
      730075747300807F7F00FFFFFF00FFFFFF00FDFCFF00DED5AA00CE551000C755
      0E00D6561B00CF4F1E00AC543C00FFFDFC00FFF9FA00FFFCFD00FCFDFB00FFFF
      FE00FFFEFD00FFF9F600FFFEFC00FFFDFC00FFFFF600FFFEF400FBFFF700FAFF
      FC00FBFFFE00FFFEFF00FFFCFF00FFFCFF00D7FFF900FFF5F600BA563300CC51
      0D00C3551B00DB501800C7591F00D3CFA600FFFAFF00FFFCFF00FBFFFC00C7C5
      B300000006000083A7002EC7FE002CCBF7001CBBF5001DB7F80019B0FA0018AE
      FC001DB0FA001D9FE200157CBA0012659D001F98DD0022B1F40017B4F6001CB1
      F40026B5F80020B7F4001FBFF50027C3F80015BBF6001195DB000B8BE4000D9A
      E30000173D00A7A4AD00FBF6F700FFFFF800FAFAFA00F9F9F900F8F7F900FAF9
      FB00F9F9F900F8F8F800F1F2F000D9DAD800DCDDDB00E2DFDB00EAE0D600E5D4
      C100C2A98F00CBAD8A00C9A88100C1A58200EEDDCA00F2E2D100B89C7A00C0A0
      7C00D3B79900E7D5BE00EAE0D600E5E0DD00E2DEDD00DBD9D800F4F4F400FAFA
      FA00FAFAFA00F9F9F900F8F9F700F8F9F700FFFFFF00FFFFFF007E7D7C007574
      7300757473007574730075747300757473007574730075747300DCDCDB00F1F1
      F100777675007574730075747300757473007574730075747300757473007574
      7300EAEAEA00E4E4E40075747300757473007574730075747300757473007574
      7300757473007E7D7C00FFFFFF00FFFFFF00FDFAFF00DAD1A600CB501200C851
      1300D04C1700CA461700BC593D00FFF2ED00EFFFFF00FBFFFF00FFFBFE00FBFA
      FC00F1FFFF00EDFFFF00F7FAFE00FFFBFF00EEFFFE00F4FFFF00FBFFFF00FEF7
      FA00FFF9FC00FFFDFF00FFFEFF00F9FCFF00FAFFF800F9D2D000BC4B2A00D050
      0F00BE4C1700D4471600C1501800CFCAA300FFFDFF00FEFBFF00F5FBF600B2AF
      A000050712001CA4CE002CC5FF001BB9EE0016B4F00016B2F40011ABF4000DA7
      F40013A8F2000D92D6000471AF00116AA3001BA3E3000FAEEC0000AAEA000AA9
      ED0018ACF20018B0F1001EB9F80025BBF70014B8F3001294DA000D8BE4000F9B
      E20000183C00A7A4AD00FCF7F800FFFFF800F9F9F900FAFAFA00F9F8FA00FAF9
      FB00F9F9F900F9F9F900E5E6E400DFE0DE00DFDEDA00E4DDD400F4E0CE00BEA2
      8400AC886200B38A5D00BA8D5A00B18A5E00EFD7BB00C9B29800B08A6000B58B
      5C00B28A6000AB8C6B00F3E2CD00E9E0D600E2DFDB00DDDDDD00E4E4E400FAFA
      FA00F9F9F900FBFBFB00FAFAFA00FAFBF900FFFFFF00FFFFFF00989796007574
      730075747300757473007574730075747300757473007A797800EAEAEA00FAFA
      FA00898887007574730075747300757473007574730075747300757473008382
      8100F5F5F500F0F0F0007E7D7C00757473007574730075747300757473007574
      73007574730092919100FFFFFF00FFFFFF00FFFEFF00DAD0A800C6461100C949
      1900CF431C00CD3F1600BC422400DC9B8D00EBF9F300F5FFFB00FBFFFF00FEF9
      FB00FFFCFF00FFFCFF00EBF4FD00EDFEFF00FFFCFF00F4F3FC00F4F7FC00FDFE
      FF00FBFEFF00EEFAFA00F1FFFD00F6FFFF00FFEFE000E1919000C33B1E00D449
      1000BD441A00DA451D00C54F1E00D2CCA900FFFDFE00FEFCFF00FAFFFB00A4A2
      9700090B1D002CB4E80020B7FF0011AEF00012ACED000FAAEF000AA7F10008A9
      F50016B1FA00129DE200077BBA001B7FBA0027B7F1000EB7F00000AEEB0004AA
      EF000EA8F1000EA8F10018B0F7001CAEF60013B4F2001292D9000F8BE3000F9B
      E00000183A00A7A5AB00FCF7F900FFFFF900FAFBF900FAFBF900FBFBFB00FBFB
      FB00F7F9F900F4F6F600DADCDC00DEDFDD00E4E1D900F3E4D400D5B89900C09A
      7000BA906300BF8F5F00C0905C00B78E6100EFD5B700C2A88A00B7906400BE91
      5E00BA8F5E00B38D6300D0B69800F4E6D400E3DFDA00DFDFDF00DEDEDE00F5F5
      F500FCFAF900FDFBFB00F9F9F900FAFAFA00FFFFFF00FFFFFF00F5F5F500DADA
      DA00D9D8D800C8C7C700B8B7B700D9D8D800D9D8D800E8E8E800FFFFFF00FFFF
      FF00F0F0F000D9D9D900D9D8D800C1C0C000C1C0C000D9D8D800D9D9D900EEEE
      ED00FFFFFF00FFFFFF00ECEBEB00D9D9D900D9D8D800BABAB900C5C4C400D9D8
      D800DAD9D900F3F2F200FFFFFF00FFFFFF00FFFFFE00DCD2AA00C53F1500CC3D
      2100D33A2500D33D1E00BD2D1100AB3C2C00B8484800E49D9900FFF0E800FDFF
      F900F9FEFC00FFFEFF00FDFDFF00F8FEFF00FFF6FF00FFFDFF00F3FFFF00F1FF
      FE00F6FFF900FFFFF700FFEBE100DEAAA400B7554500A62B2D00CB2A1400DA43
      1700BD3A1F00D6391F00C1471F00D0C6A800FFFFFE00FEFDFF00FAFFFE00A6A5
      9B000709210024ACE7000EA5FA0010ACF90014ADF20009A7ED0005A9F20008AD
      F60018B6FC0019A6E9000782C200117BBA002DABE20021BAF1000DB6F3000CAF
      F40010AAF5000AA5F4000DA8F70011A6F60012AEEF001591D800118CE200109C
      DE0001193700A9A5AA00FDF8FA00FFFFFB00FCFDFB00FBFCFA00FBFCFA00FEFF
      FD00F8FAFA00E7E9E900DBDDDD00E2E1DD00EEE5D800E5CFB600B9966B00D3A8
      7700BA906300B9906300B9906300B18D6700E9D3BA00F6E0C700B7957100BC93
      6600BF936400B98F6400B3916D00F3DDC400EEE6DF00E0E0E000DEDEDE00EBEB
      EB00FCFCFC00FBFBFB00FAFAFA00FBFAFC00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00DAD9D900AEADAD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C7C6C600C7C6C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5B4B400D0D0CF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFDF800DCD1AB00C6371800CF30
      2600CF2C2A00D4382500D6321F00BE272000E4262700C01A1900B2373300D486
      7F00F3CCC300FFF5ED00FFFFF900F3FEF600F8FBF900F3FFFB00FDFFF900FFE8
      E100EFB4AB00C0686100BA3E3800B5151300BB2B2000BE252E00E3332900DA37
      1E00BB2D2600D22B1E00C3401F00D6CBAD00FFFFFC00FDFCFF00F9FFFD00A7A5
      9D000408210019A5E20008A2FB0005A7F60013ADF40008ABF00007B2F6000AB6
      F80016B5F7001FABED00178FD0001380BE001E7FB9002BACE5001CB5F20012AD
      F20014ADF80008A8F60005A7F5000DA8F70013AAED00188FDA00168DE200159E
      DC00031A3400AAA7A900FDF8FA00FFFFFC00F9FBFB00FAFCFC00FCFCFC00FBFB
      FB00FBFBFB00E0E2E200DDDFE000E3DFDA00F6E3CE00C9AB8800BC936200D9B0
      7F00E6C7A000DFC6A600E4CAAC00E0CCB300EDE1D500F4EBDE00CBB8A300F8DC
      BE00FFDFB900E1B98F00D8B28800E1C5A300EEE2D600E7E5E400E2E0E000E4E4
      E400FDFDFD00FBFDFD00FAFCFC00FAFCFC00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00D5D5D500ACABAA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C3C3C300C3C3C300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B2B2B100CCCCCB00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFB00DBCFAD00C52C1700D022
      2900CF202E00C8282600DD2C2900D9242D00C61F1C00D52D2C00CE232500BF11
      1800B81A2000CC5F6100F0CCC400F3FFF500F2FFFA00FFFFF900E4B4B000B239
      3D00BC1A2000BC131600D5252500E8252700D0262400CC223500DF232900CD24
      1D00BE273100D6232400C0381C00D1C3A600FFFEFD00FFFDFF00F8FFFC00A5A6
      9D0000051C0014A3DD000BABFF0003A9F6000EADF10008B2F20008BBF8000CBC
      F80012B1ED001FA7E200299CD900228BCA001370A8002CAAE1001FB9F40012AF
      F10015B3F9000AAFF80005AAF3000CACF40015A8EE001D90DB001C90E40019A1
      DB00031B3100AAA8A800FDF8FA00FFFFFC00FAFDFB00FAFDFB00FCFDFB00FBFB
      FB00FBFBFB00E0DFE100E2E1E500EDE5DE00ECD5BB00BE9B7000C7986400C499
      6600FFEAC800FBE9D200F7E9D700F3EADD00EAE7E200EAE7E200F1E8DB00FEE9
      D300F2CFAD00BF956A00C69A6B00CFAB8500F9EADA00E8E3E000E5E3E200DFDF
      DF00FEFDFF00FAFCFD00FAFCFD00FAFCFC00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00D5D5D500ACABAA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C3C3C300C3C3C300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B2B2B100CCCCCB00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFB00DCCFAF00C6251700D318
      2800CF183400BA1A2600D01A2500D7102C00CD1E2C00BB1B2700BA1A2600DD24
      3400DE132800A9001000B75E6100FFF9F000FDFFFE00FFEFEE00C56F7700AC03
      1600E91C3300D7192A00C7162500CF1A2800CD1B2000C4143200D7182D00CD1E
      2800BC1B3500D7182500C3351C00D7CAAA00FFF8F900FFFCFF00F7FFFD00A4A8
      9D0000071B0012A3DA000DB1FE0005B0F4000DB2F1000BBBF70002BCF2000CBE
      F30014B0E5001798CF002490CA002183BF00178DC10023BAED0012C2F70007B7
      F3000EB8F80009B6F50009AFF00010ACED0018A6ED002090DC002093E4001CA3
      DB00041C3000AAA8A700FDF8FA00FFFFFE00FAFEF900FBFFFA00FAFEF900FBFC
      FA00FAFAFA00E1E0E200E4E3E700EBE3DC00E2CAAE00BF9A6E00CB9C6400C598
      6500D0B29500DBCBBB00F1E8DF00EBE8E300E5E9E400E6EAE400EDE9DE00FBEB
      D400CFAC8400C89B6800CC9C6800BF996F00E8D6C500E9E4E100E7E5E400E1E1
      E100FDFCFE00FDFCFE00FDFCFE00FDFCFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00D5D5D500ADADAC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C6C5C500C6C5C500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B4B3B300CCCBCB00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEF800DDD0B000CB271B00D410
      2600CE123500B7172B00CF152B00DD0D3500BF0B2800CC143200D10A2900DB08
      2900DA102D009D061A009E565C00FFFFFB00F5FCFF00FFFCFF00D38C9C009F08
      2200CF113000C50D2B00C20E2A00D4123000D01C2700BC0C3100D0133000C918
      2C00B30E3100D6142500C7351F00D8C9A900FFFCFF00FFFCFF00F4FCFB00A3A7
      9C00030F210013A8DA0008AFF80003B2F1000DB5F2000DBFF80000B9EC0011C6
      F40023BEEF00219ED1002C90CA002A86C10017ABDA0012C4F30000C3F40000BA
      F00004BAF50008B8F4000EB4EF0015ADE80018A5EE002391DD002295E6001DA4
      DA00041C2E00ACA8A700FDF8FA00FDFFFF00F9FDF800F8FCF700FAFDFB00FCFD
      FB00FAFAFA00E4E3E500E5E4E600EFE7E000F5DFC600C19E7600CB9E6B00CBA1
      7200B79A7F00EBDBCE00F2ECE700E5E7E700E1E7E600E3E9E400EEECE200E8D8
      C100C49E7400CFA06C00CE9F6B00BF9B7300ECDAC900EBE6E300E9E7E600E3E3
      E300FFFCFE00FFFCFE00FFFEFF00FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00D4D4D4009D9C9C00E5E5E500E5E5E500E5E5E500E5E5E500E5E5
      E500E5E5E500E5E5E500E5E5E500B5B4B400B5B4B400E5E5E500E5E5E500E5E5
      E500E5E5E500E5E5E500E5E5E500E5E5E500E5E5E500A2A2A100CBCBCA00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFB00EBCAA900C31D1E00CE02
      3100CE003500C6042E00C50C3600C90B3400C90F3900C1163D00CD1B4600D815
      4300B30E340080263D00E5CAD400FFFBFD00FFFFFE00FAFFFE00FAEFF2008F3A
      4E00C1163C00D7184500CB184500CD124300C90C3900D3113500C7093800D707
      3700CF003400CC002D00C92A2C00DCCBAA00FFFFF500F1FFFF00FFFCFF00B3A3
      9D0000091B001AA8E50000B0FC000FB8F20006B6FC0011B8FB000CB7EF0012C8
      F6000EC8F1000FC3EC0004BAE40005C6F10008C9F1000CCCF70003BFEF000CC1
      F8000DBFFA000AB8FA0011BBFF0003AAF300289AD9001997DE001491DB0041A3
      D900001C34009DAAA800F7FAF100FBFFFC00FFFEFF00FEFDFF00FDFDFD00FCFC
      FC00F8F9F700E3E4E200E4E6E700EAE6E100F3E4D100C5AC8C00BF9E7700BE9C
      7800D6BFA500FBECDC00F0EAE500EAEAEA00E7EAEE00EAECED00F3EBE400CEB9
      A400C59E7200CDA16C00C9A17100D7B99600FBECDC00EEE9E600E9E7E600DFE1
      E100FDFCFE00FDFCFE00FDFDFD00FCFDFB00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EDECEC00A9A9A800ABABAA00ACABAA00ACABAA00ACABAA00ACAB
      AA00ACABAA00ACABAA00ACABAA009493920094939200ACABAA00ACABAA00ACAB
      AA00ACABAA00ACABAA00ACABAA00ACABAA00ABABAA00A9A8A800E7E7E700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFFFB00E1CDAA00C42F2B00D51C
      4400D81E4C00D3254700D12C4F00D62A4C00D9294E00D7325500D92A5000E42C
      5400B5244400CE8A9B00FFF6FD00FFFEFF00FDFEFC00FCFEFE00FFFBFE00C988
      9700AF1B3900DD284F00DA2C5400D7295100D72C5200DE2E4B00CF264D00E024
      4D00D71E4800D31A4200C7383500CFCCA600FFFFF500ECFFFF00F8F7FB00B3A5
      9F0000091A001D9FDA000EBAFF000DB2F10000BBEB0008BDEF000EC3F50009C5
      F60005C4F10017D1FA000FCBEE000ED2F0000ED1F70011D0F7000CC3EF0014C1
      F30016B7EE001CB4EF0015A3E400159EE2001C9BE0001397E4001E99E300429C
      D200001F3600A9AEAF00FFFFFB00FFFFFF00FEFDFF00FEFDFF00FFFDFF00FFFF
      FF00FAFBF900E5E6E400E3E5E500EAE9E500F1E8DA00EFDEC900EFD7BB00E4C8
      AA00FFE8CD00EDD6C000F2E3D300F4ECE500EDE9E800EEE9E600FBEDE100FFEA
      D200EAC79C00CAA67800C4A78200F8E5CA00F5EBE100ECE8E700E7E7E700E4E6
      E600FBFAFC00FDFDFD00FEFEFE00FEFFFD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C6C6C500C6C6C500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F4FFFC00D9D2AB00C7443B00D838
      5600D83B5D00D3405600CE425900D43E5600D73A5500DC415C00DC365300DC36
      5300AE3D5100FFDBE300FFFEFF00FFFBFF00FDFFFE00FFFFFF00FFFFFF00F4D2
      D800A6334700DC395500E03D5C00D93D5B00D3415F00DB435600CD3C5800DE3E
      5A00D93D5C00D9395700C74B4100C5CDA400FCFFF600ECFFFF00FFFEFF00ABA3
      9C00001622002BB1E10005BAFF0000B3F00017C4EA0008BFE60009D0F70000D0
      F80000CDF5000ED8FD0014D0F30019CCEC0013B0E80013ABE4000F9ED8001294
      D0001185C400167EBF00116FB1002982C5001897DB001A96DD0045AEF1002F73
      A200031D2E00CFCDCD00FFFFFC00FFFFFF00FFFDFF00FFFEFE00FEFEFE00FFFF
      FF00FBFBFB00EAEAEA00E4E6E700E7E8E600EEEBE300F8EFE200FDEDDC00FFF1
      D900F0CDAB00C7A37D00D5B99A00FFF3DA00FFF0E000F3E4D400F6E0C700F5DC
      BA00FDE3BB00ECD6B200D4C4AD00F9F0E300EDEAE600EAE9EB00E9E9E900EBEB
      EB00FDFDFD00FDFDFD00FFFEFE00FFFEFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C3C3C300C3C3C300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6FFFC00D4D2A900CE554500DA4C
      5F00D74E6300D0515A00CC505C00D24B5900D74D5E00D94D5E00E6506000D344
      5300B45F6700FFF9F900F3FFFF00FFFDFF00FBFFFF00FFFCFD00FAFFFE00F8EF
      EC00AC566000DB495B00DE4D5C00D24F5C00CF4C6000DA515900CB4C5B00DB51
      5D00D7526200DD4F6200CD584900C5CEA300FFFFFC00F0F9FC00FFFEFF00B0AE
      A600000E14001799BC000DC5FB0000C0F7000CC7FA0005C1EA0011C1E00016B3
      CD000FA1BF000795BE000C93C9000482C3000A74C7000D78C9001680CD001F89
      D000208ACA000570AA0000649A00046EA3003EA0CE003D97C600175B8800001E
      3A00646C7300FFFFFB00FFFCF800F8FFFF00FFFEFE00FEFEFE00FEFEFE00FEFE
      FE00FDFDFD00F1F1F100E7E9EA00E9E9E900EBECEA00F0ECE700F9EDE100E4CC
      B600CEA67C00D1A57600D0AB7F00F9DCB700FFF0D600D5BFA300C3A47D00C7A7
      7C00CEB58D00FFEED100FBF2E500EEEBE700ECEBED00E8E9ED00EAE9EB00F0F0
      F000FFFFFF00FDFDFD00FFFEFE00FFFEFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C3C3C300C3C3C300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFC00D8CFA400D7634C00E15C
      6600DB616900D7646100D7656500E2616600D7616600D65E6200E6656800D85B
      5D00B8737000FFFFF900EDFEFB00FFFDFF00FDFFFF00FFF9FA00F5FFF900FFFD
      F500B46A6A00DC5C6100E0616300D2656300DA5F6900E5676300D8636400DF64
      6200D8606400E35F6600D6614C00CACC9E00FFFEFF00F0F4F500FFFEFE00F2EF
      EA00212D330000384E00108CB50018AEDD000099E9000078B4003285A5009FBB
      CC00A1B9CD00296E95000070B3000082DA000083CC00007DC3000682C2002392
      CA003294C200156D9200136382000047630000253300001426001D3646008E96
      9D00FCF6F100FFFFF700FBFDF700F4FFFF00FFFFFE00FFFFFE00FEFEFE00FDFD
      FD00FCFEFF00F3F5F600E8E8E800E8EAEA00EAECED00EDECE800F7EDE300C8B1
      9700D9AF8200DEAC7700D7AB7C00D8B58A00FFF5D200E9C9A500D5AA7700D9AC
      7900C9A98000F9E4C900F6EDE300EBEBEB00EBEDEE00EAEBEF00EBEAEC00F3F2
      F400FEFBFD00FFFEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C7C7C600C7C7C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFE00D7CBA100E06F5400E66C
      6C00DD716D00D9746500DC756C00EB736E00D9716C00D5726A00DB6F6400DE72
      6700BA756B00FFFAF000F6FFFE00FEFAFF00FFFEFF00FFFEFE00F8FFFB00FFFE
      F400B86A6400E36E6900DC746700D3796800DF6F6F00EB786900DC766A00E073
      6500D66F6600E56D6D00DD6C5200CFCB9A00F8F8F800F8FFFF00F2EDEC00FFFE
      FF00F1DCE4004A566200000520001D517900127ED0001875AD006F99B000E6D7
      DB00F7E9EB006691A6001472A7000671C2000D769F00005F8600004263000027
      410000021600273240009D97A200C6B9C10027322A004E535100F8F3F400FFFF
      FC00FFFFF800FFFFF800FDFFFC00F8FFFF00FDFFFE00FDFFFE00FFFFFF00FEFE
      FE00FFFFFF00F9FBFB00ECEEEE00EAECED00ECEEEF00EEECEB00F7F0E700F6E1
      CB00D4AE8400D9AC7900DAAE7F00D2AB7F00EBCAA300D2AF8700DDAE7A00DAAD
      7A00CFB18E00D7C6B100FCF4ED00EEEEEE00ECEEEF00ECEEEF00EAECED00FBFA
      FC00FFFDFF00FFFDFF00FFFEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00EDEDED00D1D1D000D0D0D000B5B4B400B5B4B400D0D0D000D0D0D000EAEA
      EA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00D2CDA000E37F5D00E57E
      7500D9827200D5836A00D8827000E87F7200E4827600DB877500DD846F00EA84
      7100CC7F6F00E9CFC300FDFFFE00FFFBFF00FFFDFF00FFFFFF00F9FFFA00EDCF
      C400D3746B00EC7F7100D9836B00D7896C00DC7D7400EA866E00DA856F00DC82
      6900D3826D00E9837700E0795900CBCD9900FFFFFE00F8FFFC00FDFFFF00FAFF
      FF00FFFCFF00FFF6F5009A89920000011600003263001A6A87008FC6CD00D6DB
      D900E7E1DC006E8489000D2C430009103B001C13270052485900867C89008378
      82001B1013007E727200E2D6D200FFFFF9008A887E003F393400FFFEFF00FFFD
      FF00F3F3F300FDFFFF00FFFFFF00FFFCFE00FFFFFE00FEFFFD00FFFFFF00FEFE
      FE00FEFEFE00FCFEFE00F2F7F600E9EDEE00EEEDEF00F2F0F000F1EEEA00FBF2
      E500EFD7BB00CFAE8700D6AF8300ECC59900D3AF8900CFAB8500D6AF8300CEAD
      8600EBD8C300FEF5EB00F5F1EC00F2F1ED00EDF0EE00EAECEC00F5F7F700FDFF
      FF00FEFEFE00FFFEFF00FFFDFF00FFFDFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5F5
      F500868584007574730075747300757473007574730075747300757473007F7E
      7D00F0F0F000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00CDCFA100E38A6500E68E
      7E00DB927C00D5947500D9917900E98D7C00EA8B7B00DA907800E3967B00E787
      6F00E18B7900B8928600F6F1EE00FFFDFF00FFFAFF00F4F9F800ECF1E800BC8E
      8600F2877F00F58C7900DC907300DE967400DE8C8000EB957700DA947700DC94
      7200D5947800ED958500DF836000C5CE9600FFFBFB00FBFFFC00F5FDFC00E5FC
      FE00FFFFFE00FFFFF400FFFFF800BAC6CA003B243A000C142100848C9300F2DC
      E100F7E5E6004F625900253D3300CAC6C100D8D9D700E2E3E100DADBD9009EA1
      9F000001000082878600CFD4D300F6FBFA007F807C004F4C4E00FCF9FF00F5F7
      FF00F6FCFF00F3F6FE00FFFDFF00FFFBFF00FDFEFC00FDFEFC00FFFFFF00FFFF
      FF00FEFEFE00FDFFFF00F9FEFD00F2F4F400EFEDED00EFEDED00F2F2F200F6F2
      ED00FFF3E300ECD8BF00F1D5B600E8CCAA00D9BD9F00D8BDA200DAC0A200DAC5
      AF00FDF4EA00F3F0EC00F5F2EE00F3F2EE00EDEEEC00ECEFED00FBFEFC00FFFF
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAEA
      EA00777675007574730075747300757473007574730075747300757473007574
      7300E4E4E400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF200E7C8A900D4966800EC9E
      7300EB9E8300E39C8800E29C7F00ECA17A00E39E8300DE9B8000DB9A7E00DE9F
      8300D99F8200CF997B00DBA78900FAC6A800FFE2C100ECC9A800D1AA8A00C99B
      7C00D29E8000DCA48700E2A38700E09F8300E9A77400E99E7700E5997C00EAA4
      8600E39C7600EBA07400D1966E00E2C09C00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E6E6E600000000008C8C8C00DFDF
      DF00E6E6E6006060600047474700B6B6B6008686860047474700181818000000
      00001A1A1A0082828200D5D5D500FCFCFC008787870044444400FFFFFF00FCFC
      FC00FFFFFF00FFFFFF00FFFFFF00FBFBFB00FFFFFE00FFFFFE00FFFFFF00FFFF
      FF00FEFEFE00FDFFFF00FCFEFE00F6F9F700F3F1F000F3F1F100F2F1F300F2F0
      F000F6F3EF00FBF5EE00FEF5E800FFF4E600FFF9EF00FFF7ED00FFF7EE00FDF7
      F000F2F1ED00F2F3F100F2F3F100F0F0F000F1F3F300F8FAFA00FEFEFE00FDFD
      FD00FDFDFD00FEFEFE00FEFEFE00FDFEFC00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ECEB
      EB00797877007574730075747300757473007574730075747300757473007675
      7400E5E5E500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF200DBC5A200D3A36F00F1B3
      7D00E6AB8300E1AB8C00E3AE8900E7AF8000EEAD8700ECAB8500E8A98300E8AD
      8600E8AF8800DEA78000D8A47C00DEAB8300DBA27B00DDA27B00E2A37D00EAA6
      8100F1AA8500F5A98500F3A58100F2A17E00DCAA7500EFB58B00E5AB8800DDA8
      8300E7AE8100F3B68400CC9E6F00DDC59B00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E0E0E0000E0E0E0083838300E1E1
      E100E6E6E600636363000808080000000000040404001D1D1D004F4F4F007F7F
      7F009D9D9D00C8C8C800F4F4F400FCFCFC005C5C5C0061616100EFEFEF00FFFF
      FF00FFFFFF00FBFBFB00FFFFFF00FFFFFF00FEFFFD00FEFEFE00FFFFFF00FFFF
      FF00FCFEFE00FDFFFF00FCFFFD00FCFDFB00F8F9F700F4F2F200F2F1F300F4F3
      F500F2F4F500F4F4F400F3F4F200F5F3F200F8F4F300F7F5F500F5F5F500F3F5
      F500F3F5F500F2F4F400F2F2F200F1F1F100F6F8F800FDFDFD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFE00FFFFFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ECEB
      EB00797877007574730075747300757473007574730075747300757473007675
      7400E5E5E500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF900D5C5A800CEA97500EDC0
      8700E1B78800DFBB9500E2BE9800DDB68A00E1B48F00E1B59000DFB38E00DDB3
      8E00E0BB9500E1BD9700DBB79100D6B58E00DCB58F00E0B99300E4BD9700E6BC
      9700E2B89300E2B69100E4B89300E6BA9500DEBC8E00DFB38E00DBAF9000DEB6
      9300E8BB8F00EFBC8A00C5A07400D5C69F00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EBEBEB000606060087878700EDED
      ED00E5E5E500A1A1A1006060600086868600AAAAAA00C8C8C800D9D9D900EBEB
      EB00F3F3F300FCFCFC00FAFAFA00C8C8C80017171700BABABA00FFFFFF00FFFF
      FF00F7F7F700FEFEFE00FDFDFD00FEFEFE00FFFFFF00FEFEFE00FFFFFF00FDFF
      FF00FFFFFF00FFFFFF00FEFFFD00FFFFFE00FDFDFD00FAFAFA00F6F5F700F2F1
      F300F4F3F500F6F5F700F4F4F400F5F5F500F8F6F600F9F7F700F7F5F500F6F6
      F600F4F4F400F4F5F300F5F5F500FAFAFA00FDFDFD00FFFFFE00FFFFFE00FEFF
      FD00FEFEFE00FEFEFE00FFFEFD00FFFFFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ECEB
      EB00797877007574730075747300757473007574730075747300757473007675
      7400E5E5E500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8FB00DBC7B500CFAE8100F3CC
      9500E5C29000D3B58C00DABD9600E6C59E00F7C49200FAC79500F8C59300F2C1
      8F00F1C28F00F5C69300F5C89500F4C79400EFC79300EEC79300ECC59100E8C3
      8F00E7C28E00E5C38E00E4C48F00E6C69100E2CA9400EAC99C00E7C59A00DCBE
      8D00ECC78D00F8CC9100D2B27D00E0D6A700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F3F3F300161616007D7D7D00FFFF
      FF00FAFAFA00EEEEEE00DADADA00EAEAEA00F2F2F200FFFFFF00FBFBFB00EEEE
      EE00D4D4D400ADADAD006B6B6B001919190085858500FFFFFF00FFFFFF00FDFD
      FD00FFFFFF00FFFFFF00F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFF
      FF00FFFFFF00FFFFFF00FEFFFD00FFFFFF00FFFFFF00FEFEFE00FEFEFE00FBFB
      FB00F7F6F800F6F6F600F6F6F600F5F5F500FAF8F800F9F7F700FAF8F800F9F7
      F700F7F7F700F8F8F800FCFCFC00FDFDFD00FCFDFB00FDFEFC00FEFFFD00FFFF
      FE00FFFFFF00FFFFFF00FFFFFE00FFFFFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ECEB
      EB00797877007574730075747300757473007574730075747300757473007675
      7400E5E5E500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFC00F1DCC700C9AA7D00ECCA
      8E00FBDEA100EBCF9900E6CB9900EDCD9C00E9C9A000ECCCA300EFCFA600EFCF
      A600EACAA100E4C69D00E4C69D00E6C89F00EFC8A100EEC7A000EBC79F00ECC9
      A100EDCDA400EDCFA600EBCFA600EACEA500DEC39100EFCCA100ECC8A000E9CB
      9C00FCD8A200EDC18C00C8A67B00F6ECCA00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006B6B6B001B1B1B00A1A1
      A100FFFFFF00FFFFFF00FFFFFF00E5E5E500CCCCCC009D9D9D006A6A6A003131
      3100131313002C2C2C006C6C6C00B1B1B100FFFFFF00FFFFFF00F6F6F600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00FDFFFF00FDFFFF00FDFFFF00FDFFFF00FFFFFF00FFFE
      FF00FFFFFF00FDFDFD00F7F9F900F8F9F700FCFAFA00FCFAFA00FCFAFA00FFFD
      FD00FDFDFD00FFFEFF00FEFDFF00FEFEFE00FDFFFE00FFFFFE00FFFFFE00FFFF
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ECEC
      EC00757473007574730075747300757473007574730075747300757473007574
      7300E5E5E500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF800FFFCE100D2C09100D7C0
      8200F1D99700FEE8A700FFE6A800F8DC9F00E7E0A700E3DCA300E7E0A700EFE6
      AD00EDE4AB00E9E0A700E9E0A700EAE1A800F4E0A900F4E0A900F3DFA800F0DF
      A700ECDDA500EADDA500ECDFA700EEE1A900FFE6AD00F7D7A200FADAA900FAE2
      AC00F0D49800DDB88400D8C19B00FFFFE800FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFBFB00FFFFFF005C5C5C000C0C
      0C003232320059595900585858002F2F2F00222222003434340076767600B2B2
      B200E3E3E300FAFAFA00F4F4F400FFFFFF00FFFFFF00F8F8F800FFFFFF00FFFF
      FF00F8F8F800FEFEFE00FFFFFF00FDFDFD00FDFFFF00FDFFFF00FCFEFE00FFFF
      FF00FFFFFF00FFFFFF00FDFFFF00FDFFFF00FDFFFE00FDFFFE00FFFFFF00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FFFFFF00FEFEFE00FFFFFF00FFFFFF00FDFD
      FD00FFFFFF00FFFEFF00FFFEFF00FFFFFF00FCFEFE00FFFFFE00FFFFFE00FFFF
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFB
      FB00A7A6A6007F7E7D007F7E7D007F7E7D007F7E7D007F7E7D007F7E7D00A09F
      9E00F9F8F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7FFFF00FFFFF800FAF3D800D8CC
      A200BEAF7E00C4B17E00CAB48000CFB78300DBC47400D3BC6C00D4BD6D00D8BF
      6F00D5BC6C00D7BC6C00D9BE6E00D7BC6C00D4BB6B00D7BE6E00DAC17100DAC1
      7100D8BF6F00D6BD6D00D6BD6D00D7BE6E00CCBD7500CBB57400D0BE8100C5BC
      7C00BEB27000E6D59D00FFFFDE00F6FFF100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFAFA00D0D0
      D000939393007D7D7D008C8C8C00C2C2C200EFEFEF00FEFEFE00FFFFFF00FCFC
      FC00FCFCFC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFB
      FB00FFFFFF00FFFFFF00FBFBFB00FEFEFE00FDFFFE00FDFFFE00FDFFFE00FDFF
      FE00FFFFFF00FEFEFE00FEFEFE00FFFFFF00FFFFFE00FFFFFE00FDFFFE00FFFF
      FF00FEFEFE00FFFDFD00FFFEFE00FFFFFF00FDFFFF00FDFFFE00FDFFFE00FEFF
      FD00FEFEFE00FFFEFE00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFCFE00FFFDFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EBF9FF00EDF6FF00FFFFFF00FFFF
      F500FFF2DC00FFF3D800FEE9CA00FFEFCF00F8E8DC00F6E6DA00FBEBDF00FCEA
      DF00FAE6DB00FCE8DD00FFEBE000FDE7DC00F8E8DC00F7E7DB00F7E5DA00F9E5
      DA00FAE6DB00FDE7DC00FFE7DD00FFE7DD00FFEDCE00FFEBD300FCE4D000F8EC
      D400FFF7E100FFFBF200FFFBFF00E5F7FF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFBFB00FEFEFE00FEFE
      FE00FFFFFF00FFFFFF00F9F9F900FFFFFF00F9F9F900FFFFFF00FAFAFA00FFFF
      FF00FFFFFF00FDFDFD00FFFFFF00FCFCFC00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FDFDFD00FDFDFD00FFFFFF00FFFFFF00FBFFFA00FCFFFB00FBFFFC00FBFF
      FC00FFFFFF00FFFFFF00FEFEFE00FFFFFF00FDFEFC00FFFFFE00FDFFFE00FDFF
      FE00FFFEFE00FFFEFE00FFFEFF00FFFFFF00F9FBFB00F9FEFC00FCFFFB00FBFF
      FA00FFFFFF00FFFEFE00FFFFFF00FFFFFF00FDFCFE00FDFCFE00FFFFFF00FFFF
      FF00FFFEFF00FFFEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FDFFFF00FFFEFF00FFFF
      FF00FDFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFF00FDFFFE00FFFFFF00FEFD
      FF00FFFFFC00FFFFFF00FFFEFF00FFFEFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFF00FFFFFF00FFFFFF00FDFF
      FF00FFFFFF00FFFEFF00FEFEFE00FFFFFE00FFFFFE00FFFFFF00FBFFFF00FFFF
      FF00FFFEFF00FFFEFF00FFFFFE00FFFFFF00FEFEFE00FFFFFF00FFFFFE00FDFF
      FE00FDFFFF00FDFFFF00FFFEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F6F600ECEC
      EC00F4F4F300F8F8F700F8F7F700F8F7F700F8F7F700F8F7F700F8F7F700F8F7
      F700F8F7F700F8F7F700F8F7F700F8F7F700F8F7F700F8F7F700F8F7F700F8F7
      F700F8F7F700F8F7F700F8F7F700F8F7F700F8F7F700F8F7F700F8F8F700F4F4
      F300ECECEC00F7F7F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFFFF00FCFEFE00FFFEFF00FFFF
      FF00FFFFFE00FFFFFF00FDFFFF00FFFFFF00FFFFFF00FDFCFF00FFFFFF00FFFF
      FE00FFFFFF00FFFFFF00FEFFFD00FFFFFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FFFFFC00FFFEFF00FFFFFF00FFFF
      FB00FDFFFF00FFFEFD00FFFFFF00FEFFFD00FDFFFF00FFFEFE00FFFFFE00FDFF
      FF00FEFEFE00FFFFFF00FFFFFE00FFFEFF00FFFFFF00FCFEFF00FFFFFF00FFFF
      FE00FFFFFC00FFFFFF00FFFFFC00FFFEFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EDED
      ED00D6D5D400D3D2D100D4D3D200D4D3D200D4D3D200D4D3D200D4D3D200D4D3
      D200D4D3D200D4D3D200D4D3D200D4D3D200D4D3D200D4D3D200D4D3D200D4D3
      D200D4D3D200D4D3D200D4D3D200D4D3D200D4D3D200D4D3D200D3D2D100D6D5
      D400EDEDEC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFE00FFFFFF00FFFFFF00FFFF
      FC00FDFFFF00FDFEFF00FFFFFF00FFFFFE00FAFFFE00FFFFFF00FFFFFF00FAFE
      FF00FFFFFF00FFFFFC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFFFE00FCFEFE00FEFDFF00FFFF
      FC00FCFFFD00FEFEFE00FCFEFE00D1E3FA00E2ECFD00FFFEFF00FDFFFF00FFFF
      FF00FDFFFE00FAFFFF00FDFFFE00FEFDFF00FEFFFD00FFFFFE00FBFFFE00FFFE
      FF00FFFEFF00FFFEFF00FDFFFF00FDFFFF00FFFFFF00FFFFFF00FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00FEFEFE00FFFFFF00FEFEFE00FFFFFF00FFFFFF00FEFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFF00FCFEFE00FFFFFF00FEFE
      FE00FDFFFF00FFFFFF00FFFFFF00FDFFFE00FFFEFF00FFFDFC00FFFFFE00FDFF
      FC00FEFDFF00FFFEFE00FDFEFF00FFFEFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FEFDFF00FFFFFF00FEFFFD00FFFF
      FF00FDFFFF00FFFEFF00FFFEFE00C5DAF5005B96E600559CF4008FC8FF00E7F2
      FF00FFFFFE00FCFFFB00FFFFFF00FFFEFD00FFFFFB00FBFFFF00FDFFFF00FEFF
      FD00FDFDFD00FFFFFF00FFFFFE00FDFFFF00FFFFFF00FFFFFF00FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFEFE00FFFFFF00FEFEFE00FFFFFF00F7F7F700C7C7C700F0F0F000FFFF
      FF00FFFFFF00FFFFFF00FEFEFE00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00D5D4D400878685007B7B7A007E7D7C007E7D7C007E7D7C007E7D7C007E7D
      7C007E7D7C007E7D7C007E7D7C007E7D7C007E7D7C007E7D7C007E7D7C007E7D
      7C007E7D7C007E7D7C007E7D7C007E7D7C007E7D7C007D7C7B007F7E7D00BFBE
      BE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFF00FCFEFF00FCFFFD00FAFE
      FF00FEFEFE00FFFFFB00FBFFFF00FFFBFA00F7CAA900F8B88100FDECD900FEFE
      FE00FDFFFE00FAFEFF00FDFFFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FDFFFE00FFFDFC00FFFFFF00FFFE
      FD00FCFEFE00FCFEFE00BCD2F5005B94E900337BE1004B95F50058ACFE008DC3
      FF00E1EEFE00FDFFFF00FFFEFF00FCFEFE00FEFFFD00FFFFFE00FFFDFD00FFFF
      FE00FDFFFE00FBFFFF00FFFEFD00FFFEFF00FFFFFF00FFFFFF00FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFEFE00FFFFFF00D8D8D800959595008585850091919100B0B0B000B5B5
      B500D8D8D800FAFAFA00FEFEFE00FFFFFF00FEFEFE00FEFEFE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E3E3
      E20076757400A2A1A100DDDDDC00DDDDDD00DDDDDC00DDDDDC00DDDDDC00DDDD
      DC00DDDDDC00DDDDDC00DDDDDC00DDDDDC00DDDDDC00DDDDDC00DDDDDC00DDDD
      DC00DDDDDC00DDDDDC00DDDDDC00DDDDDC00DDDDDD00DFDFDF00B6B6B5007574
      7300C8C7C700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFC00FFFEFD00FEFFFD00FEFD
      FF00FFFFFF00FDFFFF00FCDCC900F69B5E00ED7A2900F8994900FDB56100FECC
      9800FEF5EB00FCFEFE00FFFFFF00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFDFF00FDFFFF00FEFEFE00FBFE
      FF00D5E3FA006FA1E9002673E100397DE2008FB9EE00CEE5FB008CC7FF004AA2
      FF0057ABFD00A1CFFE00E8F4FE00FDFFFE00FEFEFE00FCFEFF00FFFFFE00FFFD
      FF00FFFFFC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00FEFEFE00FEFEFE00FFFFFF00FEFEFE00FFFFFF00FFFF
      FF00FFFFFF00A3A3A3008686860087878700A3A3A300DCDCDC00CECECE00B0B0
      B000AFAFAF00BBBBBB00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FFFFFF00FEFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B6B6
      B50083828100FBFBFB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A4A3
      A30092919100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFF00FEFEFE00FDFFFE00FDFF
      FF00FEEBDE00F5AA7600EE7A2D00F0873E00F7C7A500FCF3E600FDCF9F00FFB0
      5900FCB26000FFD8AB00FFFAF100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FFFFFF00FAFDFF00ECF3FC008EB5
      EC00377EE0002674DE0072A4EC00DBE6FA00FFFEFD00FDFFFF00FEFEFE00C9E4
      FF0072B7FF00499FFF0067B0FF00B2D6FE00F9FDFE00FFFFFF00FFFFFF00FFFF
      FF00F9FEFF00FFFEFF00FDFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7
      F700BBBBBB0086868600858585008E8E8E00FFFFFF00FFFFFF00FFFFFF00C4C4
      C400B0B0B000AEAEAE00C4C4C400EAEAEA00FFFFFF00FFFFFF00FEFEFE00FEFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AEAD
      AD00908F8E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B6B6
      B50089888700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FDFEFF00FFF6F300FABD
      9500F0813800EE7E3200F7B38400FDF3EC00FFFEFF00FEF7F400FFFFFE00FCEE
      DC00FFC58400FDAD5400FEBA6F00FEDFBE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7FD00AAC7F3004585E3002270
      E100568FE400C5DAF600FDFFFF00FCFEFF00B2CCF40073AEF400DEEFFC00FFFE
      FF00F7FCFD00AAD6FF005BACFD0042A0FF007ABBFF00FFFEFF00FFFEFF00FEFF
      FD00FDFFFF00FFFFFF00FFFEFF00FDFFFE00FFFFFF00FFFFFF00FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00FEFEFE00FFFFFF00FFFFFF00E2E2E200868686008686
      860086868600EFEFEF00FFFFFF00FFFFFF00E1E1E100ACACAC00DBDBDB00FFFF
      FF00FFFFFF00FAFAFA00B0B0B000AFAFAF00B0B0B000EFEFEF00FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AEAD
      AD00908F8E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B6B6
      B5008A898800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8D0B400F28C4B00EE77
      2800F39F6500FEE4D400FDFFFF00FFF0E700F4AC7D00F5A25700FFDFBB00FFFB
      FA00FDFFFF00FEE2C400FFBC7100FFAC4D00FDF1E500FFFFFC00FFFFFE00FFFF
      FF00FFFFFF00FDFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFF
      FF00FFFFFF00FEFFFD00FFFFFF00FCFEFF008DB5EF00176ADD004483E500A3C4
      F200FAFCFC00FFFFFF00D2E3F800619AE9004E8EE30087BBF70060AEFF0097CC
      FE00EDF6FF00FDFFFF00E9F3FD0092C8FF006AB2FF00FFFFFF00FDFFFF00FEFE
      FE00FFFFFE00FDFFFF00FFFFFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A4A4A40088888800878787009595
      9500E0E0E000FFFFFF00FFFFFF00F0F0F0008686860091919100B0B0B000EAEA
      EA00FFFFFF00FFFFFF00F4F4F400CACACA00B0B0B000EBEBEB00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AEAD
      AD00908F8E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B6B6
      B5008A898800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBF1EA00EE853C00F18D4500F6D1
      B500FFFEFF00FCFAF900F6BF9800F1904C00F5B48700FFE4CA00FBC58600FDC0
      7C00FFE7CF00FFFFFF00FDFCF200FDD0A500FBF3E600FEFEFE00FFFEFF00FDFF
      FF00FDFFFF00FFFFFF00FFFFFF00FDFFFF00FDFFFF00FDFFFF00FDFFFF00FDFF
      FF00FFFFFF00FFFFFE00FFFFFF00FFFEFF0084B0EB007BA8EB00E7F2FA00FEFF
      FD00E7EEFD007FAAED004686E50088B6EC00F0F6FD00FCFEFF00DAEBFE007ABD
      FC0068B2FF00B0D7FE00FCFEFE00FDFFFF00B6DAFE00FFFFFE00FFFEFE00FDFF
      FF00FCFEFF00FFFEFF00FFFEFF00FFFFFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008585850085858500C9C9C900FFFF
      FF00FFFFFF00F5F5F500C4C4C4008E8E8E00BBBBBB00F6F6F600D8D8D800B0B0
      B000C9C9C900F5F5F500FFFFFF00FEFEFE00EBEBEB00EAEAEA00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AEAD
      AD00908F8E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B6B6
      B5008A898800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFEDE200F8C7A700FDF7F200FDFF
      FF00F9D6B500F1965900F3A06800FCE5D600FDFFFE00FEFEFE00FFFFFF00FFE1
      C400FDBD7600FCC88C00FFF3E300FCF9F100FFFDF500FDFFFF00FFFEFE00FFFF
      FF00FFFFFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FEFDFF00F4F7FC00DFE9FB00FEFEFE00F3F9FE009BBE
      F0004687E30071A5EB00DCE8FA00FFFEFF00E7F0FA00CCE2FB00F9FDFE00FFFE
      FE00C1E1FE006DB4FE0075BAFF00D2E6FF00C4E2FF00FCFEFF00FFFFFE00FFFF
      FF00FEFDFF00FFFFFE00FFFDFF00FFFFFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D9D9D900FFFFFF00FFFFFF00E8E8
      E800A4A4A40095959500E0E0E000FEFEFE00FFFFFF00FFFFFF00FEFEFE00FFFF
      FF00F0F0F000C4C4C400B9B9B900E6E6E600FFFFFF00EBEBEB00FDFDFD00FFFF
      FF00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AEAD
      AD00908F8E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B6B6
      B5008A898800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFEFE300FCF7F600FAEADA00F2A2
      6700F1945500FDD4BB00FFFFFE00FFF9F400F5B78E00F9A76600FFE7CB00FFFF
      FF00FEFBF600FCD6A600FCBE7800FFCA9100FFF9F000FDFFFF00FFFFFE00FFFF
      FF00FFFFFE00FFFFFF00FFFFFF00FEFFFD00FFFFFF00FFFEFD00FFFFFF00FFFF
      FF00FFFFFF00FFFEFF00FDFEFF00F3F7FC00E4ECFD00C0D5F4005892E4005493
      E400C5D8F300FFFEFF00FFFFFE00A9C6F200538EE4004D9AF10080C1FE00DAE9
      FF00FCFEFE00F4FAFF00ADD6FD0061ADFF0078B9FE00FFFFFF00FEFEFE00FCFF
      FD00FFFFFE00FFFFFE00FDFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E0E0E000FFFFFF00B4B4B4008686
      86008E8E8E00FFFFFF00FFFFFF00FFFFFF00C3C3C30098989800CECECE00FFFF
      FF00FEFEFE00FFFFFF00BABABA00B0B0B000C3C3C300EAEAEA00FFFFFF00FDFD
      FD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AEAD
      AD00908F8E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B6B6
      B5008A898800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCF1E900F6B48400F08E4800F8C0
      9D00FDFAF600FEFEFE00F7CFB200F2915200F5A77200FBD9BB00FFC37D00FCC5
      8800FFEEDB00FDFFFF00FFF3E900FFCB8F00FFF3E500FEFFFD00FDFFFF00FCFE
      FF00FFFFFF00FFFFFF00FFFFFF00FDFFFF00FDFFFF00FFFEFF00FEFEFE00FFFF
      FF00FFFFFF00FEFFFD00FFFFFF00FAFEFF008DB5EF004287E400A1C2F000FDFC
      FE00FDFFFF00CADDF8005C94E5005390E600B2CCF400F2F8FD009DCEFF0065B0
      FE0092C8FF00EBF5FF00FEFEFE00E8F4FE0092C8FD00FFFEFD00FFFDFC00FDFF
      FE00FAFEFF00FFFFFE00FDFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E3E3E300C1C1C10086868600B2B2
      B200F7F7F700FFFFFF00FFFFFF00D9D9D90086868600A5A5A500B0B0B000D9D9
      D900FEFEFE00FEFEFE00FFFFFF00D7D7D700B5B5B500EBEBEB00FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AEAD
      AD00908F8E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B6B6
      B5008A898800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAEEE200F9B78E00FFF0E700FFFF
      FF00F9E0D000F59D6100F2985D00FAD7C300FFFFFE00FFFFFF00FFFEF900FDDA
      AF00FFBD7800FFCE9C00FFF8EF00FCF8ED00FFFAF300FDFFFF00FFFFFF00FFFF
      FF00FFFFFE00FFFFFF00FFFEFE00FFFFFF00FFFEFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FEFFFD00FDFFFF00F7FBFC00B9D2F400E3ECFA00FDFFFF00E3EC
      F90076A7EB004588E50099BBF100F1F7FC00FFFEFF00F8FBFF00FFFEFF00DAEF
      FE008EC6FD0064AFFE00B1D5FD00F1F9FF00C9E4FE00FCFEFF00FFFFFE00FFFF
      FF00FCFEFF00FFFFFE00FFFDFF00FFFFFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FEFEFE00FFFFFF0095959500D9D9D900FDFDFD00FFFF
      FF00F7F7F700868686008D8D8D00C3C3C300FFFFFF00FFFFFF00FFFFFF00E6E6
      E600BBBBBB00B0B0B000F0F0F000FFFFFF00FFFFFF00EBEBEB00FFFFFF00FEFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AEAD
      AD00908F8E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B6B6
      B5008A898800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCEFE100FDFAF600FCF1E900F3AE
      7C00F1904E00F7C8A800FDFBFB00FEFEFE00F7C7A500F9B37700FFECD100FDFF
      FF00FEF7EE00FFD1A100FFBF7800FECF9B00FBF8F400FDFEFF00FFFFFF00FFFF
      FE00FFFFFC00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FFFFFE00FFFFFF00FFFF
      FF00FEFEFE00FFFFFF00FDFFFF00F4F7FB00E5EDFA00F8FBFF0092B8EE004988
      E40077A6EA00E1ECFA00FDFFFF00EEF2FD0083AEED0062A4F200B8DAFE00FCFE
      FE00FAFEFF00CFE7FF0074B9FE006FB7FF0096C7FF00FCFEFE00FFFFFF00FBFD
      FE00FFFFFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E0E0E000FFFFFF00FFFFFF00CBCB
      CB008E8E8E00B4B4B400F6F6F600FFFFFF00FFFFFF00EBEBEB00FFFFFF00FEFE
      FE00FFFFFF00D8D8D800B0B0B000CECECE00FAFAFA00ECECEC00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AEAE
      AD008E8D8C00FCFCFC00F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700FFFFFF00B3B2
      B2008A898800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDF1EB00FABD9500F08F4D00F7B4
      8300FCF3EF00FFFFFF00FDDCC800F3975C00F2A26700FDCCA400FFBF7E00FDCB
      8F00FCF4E300FFFFFF00FEEEDD00FEC38500FFF2E500FFFFFC00FFFFFF00FDFF
      FF00FFFFFF00FDFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FFFFFF00FFFE
      FF00FFFFFF00FFFFFF00FFFFFF00FAFCFD00B3CDF5004C8BE500649AE700C6D8
      F700FFFEFF00F5FAFD00A7C7F2004A88E6006CA2E900AFD1FC0075BAFF0070B8
      FF00D3E7FF00FEFEFE00F9FEFF00B2DAFD007ABBFF00FFFFFF00FEFEFE00FEFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFEFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E2E2E200FFFFFF00959595008787
      8700A5A5A500FFFFFF00FFFFFF00FFFFFF00A4A4A40091919100BBBBBB00FFFF
      FF00FEFEFE00FFFFFF00CDCDCD00B0B0B000B5B5B500EBEBEB00FEFEFE00FFFF
      FF00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5B4
      B400757473008483820084838200848382008483820084838200848382008483
      8200848382008483820084838200848382008483820084838200848382008483
      8200848382008483820084838200848382008483820084838200858483007877
      760093929100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFECE700F7B07E00FAE3D300FFFF
      FE00FDECDF00F4A97100F4925200F8CCAD00FFFCF800FDFFFF00FDF9F400FFD8
      A800FFBC7300FCD3A200FDFCF800FFF6E900FEF9F600FFFFFF00FFFFFF00FFFF
      FF00FEFEFE00FFFFFE00FDFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFE00FFFFFE00FCFEFE0096BBEF00A3C4F200F8FCFD00FFFE
      FE00C3D9F5005C94E5004E8CE600BFD7F500FBFDFD00FFFFFF00F6F8FF00AFD5
      FF0066B1FF008BC3FE00E0EFFF00FFFFFF00C2DEFF00FAFFFE00FFFDFF00FEFF
      FD00FEFFFD00FDFFFF00FFFEFF00FFFFFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008686860087878700F7F7F700FFFF
      FF00FFFFFF00CBCBCB008D8D8D0086868600EFEFEF00FFFFFF00FDFDFD00B5B5
      B500B1B1B100CDCDCD00FFFFFF00FEFEFE00FFFFFF00ECECEC00FDFDFD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D9D8
      D800B3B2B200B5B4B400B5B4B400B5B4B400B5B4B400B5B4B400B5B4B400B5B4
      B400B5B4B400B5B4B400B5B4B400B5B4B400B5B4B400B5B4B400B5B4B400B5B4
      B400B5B4B400B5B4B400B5B4B400B5B4B400B5B4B400B5B4B400B5B4B400B3B3
      B200C7C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCEFDF00FEF9F600FFF7F300F6BC
      9200EF8E4A00F5BA8D00FCF9F400FFFFFF00FBD6C000F8C09100FEF2E000FFFE
      FF00FAF3E400FFCB9600FEBD7900FDD9AB00FFFBEE00FDFFFF00FDFFFF00FFFF
      FF00FFFFFF00FFFEFE00FFFFFF00FFFFFF00FFFFFE00FEFFFD00FFFFFF00FDFF
      FF00FEFEFE00FFFFFF00FDFFFF00F3F6FA00E2EEFA00FFFEFF00DAE7FD0070A2
      EA00478AE6009BBBF000F9FAFE00FFFFFE00D0E1FB00A0CAF900EEF4FF00FDFF
      FF00ECF6FD008FC8FC0064B0FF009ECDFF00B6DAFE00FCFEFE00FFFFFF00FFFE
      FD00FEFDFF00FFFFFC00FFFFFF00FFFFFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ACACAC00F0F0F000FFFFFF00FFFF
      FF00E1E1E100858585009E9E9E00E0E0E000FFFFFF00FFFFFF00FFFFFF00FAFA
      FA00CDCDCD00B1B1B100D7D7D700FEFEFE00FEFEFE00EAEAEA00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5B4
      B400757473007776750077767500777675007776750077767500777675007776
      7500777675007776750077767500777675007776750077767500777675007776
      7500777675007776750077767500777675007776750077767500777675007574
      730093939200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBEFE900F6C6A200F3945500F3A6
      7500FEEADF00FFFFFF00FDEBE000F1A67200EE7A2D00F5943C00FFB76800FFD3
      A400FEF8F100FFFDFF00FEEDD300FFC07B00FDF1E500FEFEFE00FDFFFF00FFFF
      FF00FDFFFF00FFFFFF00FFFFFF00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FDFFFF00F6FAFB00D4E1F70092B8EE004188E30082AE
      EE00E5EEFB00FDFFFF00E5EEFB0084B2EC00377BE0003D8BF00064B2FF00B0D6
      FF00F9F9FF00FFFFFF00D7E8FB007EBEFE006CB3FD00FFFFFF00FDFFFE00FCFE
      FF00FFFEFF00FCFEFE00FFFEFF00FDFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E0E0E000FFFFFF00EEEEEE00ADAD
      AD0086868600D1D1D100FFFFFF00FFFFFF00F7F7F700CFCFCF00F0F0F000FFFF
      FF00FFFFFF00EFEFEF00B1B1B100B8B8B800E6E6E600EBEBEB00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C5
      C500757473007574730075747300757473007574730075747300757473007574
      7300757473007574730075747300757473007574730075747300757473007574
      7300757473007574730075747300757473007574730075747300757473007574
      7300A6A6A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBEFE500F6A87300F7D7C000FBFF
      FE00FEF5F200F7B99100EF7F3300F27E2A00F6A45C00FDCA8400FEBD6C00FFAD
      5400FFB76F00FFE1BA00FFFDFC00FDF3EC00FFF9F400FFFFFE00FFFFFE00FDFF
      FF00FDFFFF00FFFFFE00FDFFFF00FFFFFF00FFFEFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FEFFFD00FDFFFF00FAFEFF008CB4EE00538FE800D5E4F700FFFE
      FE00FAFCFD00A6C6EF004886E400276FDF003F8EE50063BBFB0053ACFD004DA2
      FE0075B6FF00C5E1FF00FDFFFF00F7FCFD00B5D9FD00FBFDFE00FFFFFF00FFFF
      FE00FFFEFE00FFFEFF00FCFEFF00FDFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00BBBBBB0095959500ACACAC00F0F0
      F000FFFFFF00FFFFFF00E1E1E1009D9D9D008686860091919100B0B0B000B4B4
      B400D8D8D800FEFEFE00FFFFFF00FFFFFF00D8D8D800EBEBEB00FEFEFE00FFFF
      FF00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6F6
      F60091908F007574730075747300757473007574730075747300757473007574
      7300757473007574730075747300757473007574730075747300757473007574
      7300757473007574730075747300757473007574730075747300757473007F7E
      7D00E4E4E400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBEFE500FDFAF200FDFFFF00F9CB
      AC00F18F4900EB792500F4984F00FCC37E00FFCB8200FFC67B00FFD88F00FFD1
      8400FDB76400FCAD5600FFC38100FDDFBC00FEFBF600FFFFFE00FFFFFE00FFFF
      FF00FFFFFF00FFFFFE00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FFFFFE00FFFF
      FF00FFFFFF00FFFFFF00FFFEFF00F6F9FE00D3E1F800F9FDFE00FCFDFF00C1D5
      F8005D95E600286FDE003581E5005AB1EF006BC7F8006DCCF80079DAFE0061BE
      FB0050A4FF004CA6FF0086C1FF00D9EDFF00C5E1FF00FFFFFB00FEFDFF00FEFE
      FE00FFFFFE00FFFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE008787870095959500FFFFFF00FFFF
      FF00FFFFFF00B3B3B30087878700868686008C8C8C00B8B8B800B7B7B700B0B0
      B000B0B0B000BBBBBB00FFFFFF00FFFFFF00FFFFFF00EAEAEA00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F4F4F300C0C0BF00ABAAA900A8A7A700A1A09F00A1A09F00A1A1A000A4A3
      A300A0A09F00A4A3A200A0A09F00A2A1A100ABABAA00A4A3A3009E9D9D00A4A3
      A300A0A09F00A1A1A000A1A1A000A2A2A100A1A1A000A7A7A600B8B7B700E9E9
      E800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFEFE800FAD8C000F3996200F178
      2800F3893C00F9B87400FAD08500FDC07000FFB15E00FCB25A00FEB86500FFCB
      8400FCDA9400FECA7E00FEAF5E00FFAB5200FDF1E500FFFFFE00FDFFFF00FFFE
      FD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFFFF00FFFFFF00FFFFFF00FDFF
      FF00FFFFFF00FFFFFF00FDFFFF00F4F7FB00E6EEFB00DEE9FD0071A5E8002D75
      E100307BDF0050A6EC006CC8F9005BB2F2003C84E200327DE30051A6EA0073D6
      FC0076D7FD0062BCFD004FA5FF0059A9FE0084BFFD00FFFFFF00FEFEFE00FEFD
      FF00FCFEFE00FFFFFE00FFFEFF00FFFFFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C2C2C200FFFFFF00FFFFFF00F8F8
      F800C3C3C300878787008585850086868600E1E1E100E7E7E700E6E6E600B3B3
      B300AFAFAF00B0B0B000C4C4C400F0F0F000FFFFFF00EBEBEB00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00AAA9A9008483820085848300AFAEAE009594
      930086858500A8A8A700A2A2A100F4F4F400FFFFFF00FDFDFD00ABAAA900A9A8
      A8008D8D8C008888870081807F009392910099989700A9A9A800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBF2E800F0894400EE7E2C00F8AC
      6400FFCD8400FEC67500FEB35D00FFB25F00FFB16200FFB46200FFB25F00FCB1
      5B00FFBA6A00FED78D00FFD88F00FFBE6B00FFF3E700FFFFFF00FDFFFF00FFFF
      FF00FDFFFF00FDFFFF00FEFEFE00FFFFFF00FDFFFF00FFFFFF00FFFFFF00FDFF
      FF00FFFFFF00FFFFFE00FFFFFE00FBFDFD009FC0F200397BE1002674DF004797
      EA0067C6F8005FBDF200438EE4003479E000347ADF00367AE5003277DE003783
      E3005DB5F10077D9FB006DCCFE0055AEFF005FAEFD00FEFEFE00FDFFFF00FFFF
      FF00FEFEFE00FDFFFF00FCFFFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FEFEFE00FFFFFF00E1E1E100E8E8E800868686008686
      860086868600C9C9C900E2E2E200C7C7C700A6A6A600A6A6A600A6A6A600D7D7
      D700E6E6E600E0E0E000B0B0B000B0B0B000B0B0B000E9E9E900FFFFFF00FDFD
      FD00FFFFFF00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00D8D8D700757473007574730081807F00E5E5E5008888
      87007E7D7C0095949300CBCACA00FFFFFF00FFFFFF00FFFFFF00E0DFDF009190
      8F00888786007574730095949300A7A7A6007675740075747300D4D4D400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF1F200F4AD6A00FDCC8000FFD9
      9400FFB86800FEAE5900FEB25F00FDB46000FDB46000FCB35D00FFB25F00FBB1
      5F00FFBD6D00FED18700FEE5AD00FFF3DB00FFFFFB00FDFFFF00FFFFFF00FFFE
      FF00FEFEFE00FFFFFE00FDFFFF00FFFFFF00FFFFFF00FFFFFE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFEFF0078A9ED003081E2005EB8F10066C2
      F5004B9AEB003478E3003479E000337BE100347CE100377DE200377DE2003676
      E2002E72DB004A9BEC0077E2FD0072DDFE0098D4FE00FFFFFF00FFFFFE00FFFE
      FE00FFFFFF00FFFFFE00FBFFFF00FFFEFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A4A4A40086868600878787008C8C
      8C00B7B7B700D4D4D400AFAFAF00A7A7A700A6A6A600A6A6A600A7A7A700A7A7
      A700B9B9B900E1E1E100D9D9D900BABABA00B0B0B000EAEAEA00FEFEFE00FFFF
      FF00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFA
      FA00C6C6C500A9A8A800878786007574730075747300BCBBBB00EAEAEA00807F
      7E008382810094949300D9D8D800FFFFFF00FFFFFF00FFFFFF00F0F0F0009291
      9100878786007A797800F6F6F600F1F1F100807F7F0075747300B7B7B600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFE00FEFBED00FDEABD00FEDF
      9A00FED48900FFC17100FFB45E00FFB25F00FEB26000FFB16000FEB96900FFCF
      8100FFE0A100FFF0D000FFFAF700FFFEFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ACD7F80071D4FA0079E7FF0059B1
      F100317AE2002F76DE00347BE300357AE100377BE400367DDF003276DF00337E
      E2004DA7EE006BCFF90093EAFE00D4F8FF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FEFEFE00FFFFFF008585850087878700AAAAAA00E2E2
      E200DBDBDB00A5A5A500A7A7A700A6A6A600A6A6A600A7A7A700A7A7A700A6A6
      A600A6A6A600A5A5A500E3E3E300E7E7E700D2D2D200ECECEC00FFFFFF00FEFE
      FE00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6F6F6009695
      94007574730075747300757473007574730084838200BEBDBD00777675007574
      73007B7A790098979700B1B0AF00FFFFFF00FFFFFF00FFFFFF00C2C1C1009594
      93008382810075747300B1B0AF00FBFBFB00DCDCDC009D9C9C00BCBBBB00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFF00FBFFFF00FFFFFE00FFF7
      E600FEE7B900FFDE9900FDCF8100FCB96A00FFB66000FDC57600FDDB9900FEEC
      C300FDFCEE00FBFFFF00FBFFFE00FFFFFC00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFFFF00DDF9FF009FEAFF007EE5
      FE0068D1F8004B9CED00377BE0003577E000337BE0003178E0004799EA0065CB
      F6008BE8FD00C5F6FF00F9FEFF00FFFFFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C5C5C500E7E7E700E3E3E300C3C3
      C300A6A6A600A6A6A600A6A6A600A7A7A700A6A6A600A6A6A600A5A5A500A7A7
      A700A9A9A900CECECE00E7E7E700EFEFEF00FCFCFC00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B3B2B2007574
      73007574730075747300757473007574730075747300C1C0C000858483007574
      73007574730091908F0094939200ABAAA900CDCDCC00B4B3B30091908F009897
      97007574730075747300757473009E9D9C00FFFFFF00F9F9F9009B9B9A00E9E9
      E800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FDFFFE00FDFDFD00FFFE
      FF00FFFEFD00FFF4DE00FFE7B300FFDB8F00FDD69100FFE9B700FDF8E900FFFF
      FF00FFFFFF00FEFDFF00FCFEFE00FFFEFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFFFD00FFFFFF00FCFEFE00D4F4
      FF0095EBFD0079E4FF005EC2F800428FE6003B88E4005BBCF4007FE4FD00B6F1
      FF00F0FBFF00FDFFFF00FEFDFF00FDFFFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00F4F4F400E7E7E700E7E7
      E700DFDFDF00A7A7A700A5A5A500A7A7A700A6A6A600A6A6A600A6A6A600C7C7
      C700E3E3E300E6E6E600F9F9F900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00878786007574
      730098979700C6C5C500959594007574730075747300A6A6A500B1B0AF00AEAD
      AD0098979700757473008E8D8C00969594009695940095959400929190007776
      75007A7978007776750075747300C0C0BF00FFFFFF00FFFFFF00CFCECE00A5A5
      A400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FDFFFF00FDFF
      FF00FFFEFD00FBFEFF00FDFEFA00FFF0D600FFF4DC00FFFFFB00FBFFFF00FEFE
      FE00FFFEFF00FFFFFE00FFFDFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FCFEFF00FFFF
      FF00FAFEFF00C9F3FF0096EEFF006EDDFD0077DBFD00A7EFFF00E6FAFF00FDFF
      FF00FDFFFC00FEFFFB00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FEFEFE00FEFEFE00FFFFFF00FFFFFF00F3F3F300E9E9
      E900E6E6E600D7D7D700B0B0B000A5A5A500A6A6A600A6A6A600BABABA00E7E7
      E700EAEAEA00F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00818180007776
      7500E6E5E500FFFFFF00E7E7E7007877760075747300A0A09F00FFFFFF00FFFF
      FF00D8D8D700757473007574730075747300787776007877760075747300807F
      7F00E6E5E500E1E1E100BCBBBB00F4F4F300FFFFFF00FFFFFF00FFFFFF00A5A5
      A400D5D5D500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FEFEFE00FFFEFE00FEFD
      FF00FFFEFF00FEFEFE00FEFEFE00FFFEFF00FFFFFF00FDFFFF00FFFFFF00FEFE
      FE00FDFFFF00FDFFFF00FDFFFF00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FEFEFE00FBFFFC00FDFF
      FF00FEFEFE00FDFFFF00F1FBFB00C6F3FF00D0F7FF00FDFFFF00FFFFFE00FDFF
      FF00FFFEFF00FEFEFE00FEFEFE00FDFFFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EFEFEF00E8E8E800E7E7E700E6E6E600E7E7E700EFEFEF00FEFE
      FE00FFFFFF00FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9A9900A8A7
      A700FFFFFF00FFFFFF00D8D8D7007574730075747300C1C0C000FFFFFF00FFFF
      FF00B6B5B50075747300757473008C8B8A00A1A09F007776750075747300807F
      7F00F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E4E4
      E40094939200EEEEEE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFFFE00FDFEFF00FFFEFF00FEFF
      FD00FBFFFE00FFFFFF00FFFFFF00FEFEFE00FFFEFF00FEFEFE00FFFFFE00FFFF
      FF00FFFDFF00FFFDFE00FFFEFD00FBFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFDFF00FFFEFF00FEFEFE00FFFF
      FF00FDFDFD00FFFDFF00FFFFFE00FFFFFF00FFFFFE00FFFFFE00FCFFFD00FFFE
      FF00FCFEFE00FDFFFF00FDFFFF00FFFDFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FFFFFF00FEFEFE00FEFE
      FE00FFFFFF00FFFFFF00F9F9F900EDEDED00EDEDED00FAFAFA00FFFFFF00FFFF
      FF00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E8E8E700ECEC
      EC00FFFFFF00FDFDFD009291910075747300908F8E00F6F6F600FFFFFF00FFFF
      FF00B8B7B7007574730078777600E2E2E200FFFFFF009A9A9900757473007675
      7400E5E5E500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0093929100A2A1A100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FFFF
      FE00FDFFFE00FFFEFE00FFFFFF00FFFFFE00FFFEFF00FFFFFF00FFFEFF00FDFF
      FE00FCFFFD00FFFFFF00FEFFFD00FDFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FDFFFF00FFFE
      FE00FFFFFE00FFFEFF00FDFFFE00FEFEFE00FDFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFE00FFFFFF00FFFFFF00FFFEFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FFFF
      FF00FEFEFE00FFFFFF00FEFEFE00FFFFFF00FEFEFE00FEFEFE00FFFFFF00FEFE
      FE00FFFFFF00FEFEFE00FFFFFF00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00D2D2D1007E7D7C00ADACAC00F3F2F200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E3E3E200D5D4D400FFFFFF00FFFFFF00DCDCDC00ACACAB00DFDE
      DE00FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E2E2E2009D9C9B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FFFFFF00FFFE
      FF00FDFFFF00FFFFFF00FEFFFD00FDFFFF00FDFFFF00FFFFFE00FFFFFE00FCFE
      FF00FFFFFF00FFFFFE00FFFEFF00FFFFFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFFFD00FFFFFF00FFFE
      FF00FFFFFE00FEFDFF00FFFFFF00FFFFFF00FFFEFF00FDFFFE00FFFFFF00FAFE
      FF00FFFFFE00FFFFFF00FBFFFF00FFFFFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FEFEFE00FFFFFF00FEFEFE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00424D3E000000000000003E000000
      2800000080000000000100000100010000000000001000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFF8001FFF00000000FFF007FF
      FFFFFFFFC0001FFF00000000FF0000FFF9827F9F000007FF00000000FC00003F
      F102001F000003FF00000000F800001FF102001F000403FF00000000F000000F
      F000001F000400FF00000000E000000FF000001F000400FF00000000E000000F
      F000001F000C000300000000E000000FFFFFFFFF000C000100000000E000200F
      F800001F000C000100000000E000000FF800001F001C000000000000F001000F
      F800001F8000000000000000F004001FF9FE001FC000083800000000F000001F
      F902001FE000183800000000F000000FF9027F1FF8003C1900000000F0000007
      F986001FFE00FC0100000000E000800FF986001FFF007E0300000000E000C807
      F9863E1FFF007FFF00000000E0000007F9867F1FFE003FFF00000000E0401007
      F9FE001FFC003FFF00000000E1002007F800001FFC003FFF00000000E0003007
      F800001FF8003FFF00000000E0000007F807C01FF8003FFF00000000E000080F
      F800081FF8003FFF00000000E000800FF020001FF8003FFF00000000E000200F
      FFC007FFF0001FFF00000000F000001FFFE007FFF8001FFF00000000F800001F
      FFF11FFFF8001FFF00000000FC00003FFFF81FFFF8001FFF00000000FE00007F
      FFF83FFFF8003FFF00000000FF0000FFFFFFFFFFFC007FFF00000000FF8003FF
      FFFFFFFFFF00FFFF00000000FFC00FFFFFC003FFFFFF8001FFFFFFFFFFFFFFFF
      FF0000FFFFF80000FFFFFFFFE0000007FE00007FFFC00100FFFFFFFFC0000003
      F800001FFE000101FFFFFFFFC0000001F000000FE0000007FFFE00FFC0000001
      E000000780000007FFF8007FC0000001E000000700000007FFC0001FC0000001
      C000000380000007FE00000FC00000018000000180000007FE00003FC0000001
      8000000180000007FE00007FE00000030000000080000007FF00007FE0000003
      0000000080000027FE0000FFE00000030000000080000007FE00007FE0000003
      0000000080000047FE0000FFF0FF80030000000080000007FE00007FF0000007
      0000000080000007FE00007FF00000070000000080000007FE00007FF0000007
      0000000080000007FE00007FF80000070000000080000007FE00007FF8000007
      0000000080000007FE18007FF800000F0000000080000007FE00007FFC00000F
      0000000080000007FE00007FFC00000F80000001C0000007FF00C1FFFC00000F
      80000001C0000007FF8080FFFC00001FC0000003C0000017FF2100FFFE00001F
      E0000007C0000017FFA3D1FFFF00001FE0000007C0000007FFC7E3FFFF00003F
      F000000FC0000407FFFFFFFFFF80003FF800001FC000083FFFFFFFFFFF88113F
      FE00007FC0800FFFFFFFFFFFFFFFFFFFFF0000FFC007FFFFFFFFFFFFFFFFFFFF
      FFC003FFC1FFFFFFFFFFFFFFFFFFFFFF800000018000001080000000E0000001
      0000000000000004000000008000000100000000000000000000000080000001
      0000000000000000000000008000000100000000000000000000000080000001
      0000000000000000000000008000000100000000000000000000000080000001
      0000000000000000000000008000000100000000000000000000000080000001
      0000000000000000000000008000000100000000000000000000000080000001
      0000000000000000000000008000000100000000000000000000000080000001
      0000000000000000000000008000000100000000000000000000000080000001
      0000000000000000000000008000000100000000000000000000000080000001
      0000000000000000000000008000000100000000000000000000000080000001
      00000000003F0000000000008000000100000000000000000000000080000001
      0000000000000000000000008000000100000000000000000000000080000001
      0000000000000000000000008000000100000000000000000000000080000001
      0000000000000000000000008000000100000000000000000000000080000001
      0000000000000000000000008000000100000000000000000000000080000001
      0000000000000000000000008000000100000000000000008000000280000001
      00000000800000100000000080000001FFFFFFFFFC486FFFFFFFFFFF80000001
      FF00307FFC4009FFFFB835FF00000000FF40057FFC4005FFFFE01BFF00000000
      FF20007FFC0001FFFF8007FF00000000FE00027FFC0001FFFE0001FF00000000
      FF8000FFFE0001FFFB0001FF00000000FE00007FFE0001FFFB0001FF00000000
      FE0000FFFC0001FFFB0001FF00000000FF00007FFE0001FFFF0001FF00000000
      FF0001FFFC0001FFFB0001FF00000000FE00017FFE0001FFFF0001FF00000000
      FE00017FFC0001FFFD0001FF00000000FF80017FFC0001FFFF0001FF00000000
      FE00007FFC0001FFFF0001FF00000000FE0001FFFC0001FFFF0001FF00000000
      FE00027FFF8003FFFB0003FF00000000FE40047FFC0007FFFFC007FF00000000
      FF0007FFFF8005FFFF8007FF00000000FF8007FFFF8005FFFF8007FF00000000
      FE4007FFFF8005FFFFC007FF00000000FE0007FFFF8005FFFF8007FF00000000
      FE00047FFF8007FFFF8007FF00000000FE0004FFFF8005FFFF8007FF00000000
      FF001A7FFFC001FFFFE00FFF00000000FE80107FFFA009FFFFE01FFF00000000
      FE0000FFFFA001FFFFE01BFF00000000FFE01FFFFFA001FFFFA013FF00000000
      FFE007FFFF8001FFFFE013FF00000000FFE00FFFFFA001FFFFE00FFF00000000
      FFF02FFFFFC001FFFFF01BFF00000000FFFFFFFFFF8001FFFFF87FFF00000000
      FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000800000008000000880000000
      000000000000000080000000C000000000000000000000004000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000010000000000000000000000000000000100000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF1724FFFF685141FFFFFFFF00000000
      FF15ACFFFE2204A4FFFFFFFF00000000FF626BFFFF001000DD6F7FFB00000000
      FF2600FFFE500204DEF51CFF00000000FF0001FFFE200000DFF4013F00000000
      FF0802FFFF000007DCB803AF00000000FF0001FFFE800071DFE0E0CF00000000
      FF0000FFFF000004DD83181F00000000FF80001BEA040041FF060C3F00000000
      FF0004060A000000FF18023F00000000FF002017FC000010FF60D09700000000
      FF001016B8000041FF47142F00000000FF00000E1A000001FF06021F00000000
      FF10403578000010FD10E1AF00000000FF00002734000027FF61A83F00000000
      FF04042BAE00004EFF47141700000000FF000071F8004100FF18429F00000000
      FF01001B24000022FF30E03F00000000FF040016FC000440FF43183F00000000
      FF00000178000020FE0C031700000000FF00001B9C000003FE3803BF00000000
      FF00000F6C000040FF6000BF00000000FF00005168000011FD00002B00000000
      FF000021BE000048FF00001700000000FF0000FFFF0000FFFD00002700000000
      FF0000FFFF0000FFFF00007F00000000FF0018FFFF4000FFFF0001FF00000000
      FF8001FFFF9001FFFCC003FF00000000FF00A0FFFF0000FFFFF80BFF00000000
      FF0610FFFF1100FFFF4C37FF00000000FFC244FFFF8076FFFDD52AFF00000000
      FFA408FFFFA324FFFFFD7FFF0000000000000000000000000000000000000000
      000000000000}
  end
  object ImageList2: TImageList
    BkColor = clWhite
    DrawingStyle = dsTransparent
    Height = 32
    Width = 32
    Left = 664
    Top = 104
    Bitmap = {
      494C01010E00A300040520002000FFFFFF00FF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000008000000001002000000000000000
      010000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFE
      FE00FCFCFC00FAFAFA00FAFAFA00FAFAFB00FBFBFC00FCFCFC00FDFDFD00FEFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFAFA00F5F5
      F500F4F3F400F4F4F400F5F5F500F6F6F700F8F8F800F9F9FA00FAFAFA00FBFB
      FB00FCFCFD00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E9F6F700E5F7
      F800DAECF100BFD6D200D8E9EC00E2F1F100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5F5F500EBEBEB00E9E9E900EAEA
      EA00EEEEEE00F0F0F000F2F2F300F5F5F500F6F6F700F8F8F800F9F9F900F9F9
      FA00F9F9FA00FAFAFA00FBFBFB00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EEEBE900C5BBB200AEA79E00AAAAA000B0B9B200BDCB
      CC0066A96F0042954A0098ADA500A8B1AD00A3A69D009F9B8F00998F82009689
      7C00948779009487790094867800948678009486780094867800948678009486
      7800BAB3AA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F9F9F900E7E7E700E0DFDF00E3E3E200E7E6E600E9E9
      E900ECECEC00EEEEEE00F2F2F100F4F4F400F6F6F600F8F8F800F8F8F900F9F9
      FA00FAFAFA00F9F9FA00F9F9FA00F9F9FA00FCFCFC00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E2DBD600C4B2A600D5CDC600D2CCC500E7DAE1004986
      440004B6000000AD0000528E5000C0B8B900C4BCB700C4BBB100C4B6AB00C0B1
      A700BFB0A300BFAFA200BEAEA100BEAEA100BEADA000BEADA100C1B1A500A08D
      7C0084736200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F3F3F300DBDADA00D9D8D800DEDEDD00E1E1E000E4E3E300E9E9
      E800EEEEED00EEEEED00E9E9EA00E9E9E900EBEAEC00EFEFEF00F7F8F700FDFD
      FC00FCFCFC00FAFAFA00FAFAFA00F9F9FA00F9F9FA00FBFBFB00FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E0DED900DCD1C900FFFFFF00FFFFFF006E9E690003BD
      000008DD06000ADA08000BAC09006BB37100E0E2E100F3ECEE00FDF7F400FFF8
      F500FFF7F400FFF6F300FEF5F100FEF5F100FEF5F100FEF4F000FFFAF600D4C6
      BC0084746300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F0F0F000D2D2D100D3D3D300D8D7D700DADADA00DFDFDE00E6E6E400D8D7
      DA00B0ACBC00867E9E00695D8C005E5186005D5185006356890081779C00B1AD
      C000E6E5E900FDFDFC00FCFCFC00FAFAFA00FAFAFA00F9F9FA00FAFAFB00FEFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00DFE4E000E3D9D200FFFFFF0064995F002EC3290013DB
      100000D2000007D605000DD80F00009F000067B46F00E4DEE200F0E9EB00F8F4
      F200FDF7F500FCF6F500FDF6F300FBF5F200F8EFEB00F8EEE900FDF2EE00CFC1
      B60084746300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5F5
      F400CDCDCC00CDCCCC00D1D1D100D5D4D400DBDCDA00D7D7D7009D98AB005C4F
      83004B3B7C00534388005D4C93005D4C95005A49940054429000493686003C2A
      7900453677009992AE00EFEFF100FEFEFD00FAFAFA00FAFAFA00F9F9FA00FBFB
      FB00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E2EDEC00DDD9D60060A15C001FBF1C0033DC32003DDC
      3C00B7FEB60071F173000ED3110017D820000096000053AC5B00CBBFB500CFB5
      A500CEAF9500CFA68900CCA08000C7957200F0E1D800F8EFEB00FDF2EF00CFC1
      B60084746200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFCFC00CFCF
      CE00C5C5C400CBCBCA00CECECD00D6D6D400C5C4C700736890006B5C9C007566
      A7007263A40069599D005E4E9400584790005645900054428F004F3D8C004E3B
      8D004B378D003B287900584B7F00DBD9E100FEFEFD00FAFAFA00FAFAFA00F9F9
      FA00FCFCFC00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CAE3DD00569A4F0020B51B0030CF2D0047D7460096E9
      940034932E0053BB500069E76D001ED128001ED42C00009100005EB46900E2E3
      E500F2EEF000FAF7F700FFFAFB00FFFBFB00FAF0ED00F8EDE900FDF3EF00CFC1
      B70084746200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DFDFDE00BEBD
      BC00C5C4C300C8C7C700CFCFCD00BFBDC100695D8C008C7EBE009A8CCC008778
      B9007F6FB4007867AF006A58A2005B4995004E3C8A004A378700483587004835
      88004A378800493686003E2B7A0041337000D9D6DF00FEFFFD00FAFAFA00F9F9
      FA00F9F9FA00FEFEFE00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00D7F2EB006AB7720035B3300028C2260053D453007EDC7C0059A1
      4F00DDE3D900C0DBBC0063B8610065DD6F0024CE330023CF37000191050062AF
      6900D3D8D100E6D9D500E9DBD000E8D4C700F6ECE600F9EFEB00FDF3EF00CFC1
      B70084746200FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8F8F800C0BFBE00BDBC
      BB00C2C1C000C6C6C500C5C4C4006C6189008D7EBF009F90CF009485C6008676
      BC007968B4007A69B4007462AF006552A1005643940048348800422F83003E2A
      7E003F2C7D003E2C79003D2B7900372376004B3C7600EBEAED00FDFDFD00FAFA
      FA00F9F9FA00FBFBFB00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00CEEDE00055B2550066CE63006AD66B0065C8620071B36D00EFEB
      E900FEF5F400FBF6F300BADCB70067BD66006DDE780026C9370028C83E000C96
      140057A45600C9CABC00DECBC200DCC5B400F5EAE400F9F1ED00FEF4F000D0C1
      B70083746300FFFFFF00FFFFFF00FFFFFF00FFFFFF00DDDDDD00B4B3B200BBBB
      BA00BEBEBD00C7C7C5008B8699006D5E9F008C7DBD009283C4008979C0008373
      B6009286B8006E5BAA00725FAF00705DAE00624EA20057439700453185006D5F
      9C005D4E8F00311E6F00362374003521770028126C00847B9E00FBFBFB00FAFA
      FA00F9F9FA00F9F9FA00FEFEFE00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E9FDFE00ADD5BC0056A64D003FAC3A0087C18200F3F3F500FFFF
      FF00FFFEFF00FFFEFF00FFFFFF00C2E4C3005EB75B0081E78D001DC0350027BF
      400010981B005DAA6300D9E1DC00F0EAEE00F1EDE900F8F0ED00FEF5F200D1C3
      B80085756400FFFFFF00FFFFFF00FFFFFF00FBFBFB00C2C2C100B3B2B100B9B8
      B600BEBDBC00B3B2B400605488008172B4007767A9006D5DA3007C6CB100B4AF
      C400D1D1CF009A90BB00634EA5006C58AD006C58AC005B479B008072AD00E5E3
      EB00D5D1E2005C4B8F003A267C003F2B83003E28840037257000D9D8DF00FDFD
      FC00FAFAFA00F9F9FA00FCFCFC00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00DBE5E100C2CDB500C8E3C600F7FAF800F5E2D700EBD4
      C100EBD2BE00EBD2BF00EBD5C500F2E0D600BDD4B0003FA43800AEF3B90033D1
      4A0045D457001EA4240058A65A00C0BEB300E4DBDB00F6F0ED00FFF7F400D1C4
      BA0087776700FFFFFF00FFFFFF00FFFFFF00EBEAEA00B2B2B000B2B1B000B6B5
      B300BFBEBC008C889700655599006F5FA20069589E00614F9C00938AAE00CBCC
      C800C5C3C800D2D2D4009C92BE00604BA200614CA1009082BC00E6E3EE00EAE8
      EF00F3F2F600CCC6DD007361AC007766AF007463AC00564396009890AE00FBFC
      FA00F9F9F900F9F9FA00FBFBFB00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EAFBFF00DCE6E600EAE6E400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D8F1DB0029952000BBFF
      C90035D64B0046DA5C00169C1C005AA95F00DFDEDE00ECE6E700FCF5F100D4C8
      BF008A7E6F00FFFFFF00FFFFFF00FFFFFF00D7D7D600AAA9A800B0AFAE00B3B2
      B100B9B9B700706788006958A000615197005A4992005E4C9A006D5DA200A9A5
      B400C6C5C700CCCBD100D9D8DC009A90BD00897BB400E1DFE800E8E7EE00ECEA
      F100D3D0DE009385BF009384C6009A8DC7009F94C6009689C30074679900F0F0
      F100F8F8F800F9F9F900FAFAFA00FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00B9734900A44C
      1700A44E1A00A44E1B00A1511F009E511F00974A19008F431000893906008131
      00007A28000078270000792E000076310000DCCABC00FFFFFF00BEE9C5003098
      2700A8F3B30040D5570047DA6200018F060057AF5F00DEDCDE00F2EAEC00D3CA
      C200918B7D00FFFFFF00FFFFFF00FFFFFF00CDCCCB00A6A5A300AEADAB00B2B1
      AF00AEACAC00615587006D5BA5005F4E98005E4C99005F4C9C00564298005F4D
      9A00B5B0C300D7D6D900DAD9E000D9D8DF00D9D8DF00E0DFE600E6E5EB00CDCA
      D9008576B5007B6AB0008A7EB6009E93C400B1A7D200BFB7DC007C70A200E0DF
      E400F8F8F800F7F7F700F9F9F900FCFCFD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00E69D8000F2B7
      A000F5C3B000F2C0AC00EFBEAB00EEBCA700EAB9A300E5B69F00E3B39C00DFB0
      9800DBAD9500D9AC9400D9AA90009B5A3000CDAB9100F0DDCE00FAE5E100ACD9
      AC004CAC47008BE497003ED0570040D75C00008D030059AF6000E3E2E200D0C8
      C600999A8F00FFFFFF00FFFFFF00FFFFFF00C9C8C700A3A2A100ABAAA900AFAF
      AD00A7A6A600594B83006655A100604E9B006350A000604D9F005D499E005944
      9E006B59A600B8B2CA00DBDAE000DBDAE200E0DEE700E8E6EE00CFCBDC009183
      BF008B7CBE009286BD009185B800A197C400B6AED400C1BADA008076A400D8D6
      DD00F6F7F600F5F5F500F7F7F700FBFBFB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00E1977900F4C6
      B200FFFFFF00FFFFFF00FFFFFF00FEFAFB00FBF6F600FEFCFE00FFFEFF00FFF5
      F600FAF1F100FCF4F500EACCBE0092481900DBC8BB00FFFFFF00FFFDFE00FFFF
      FF00A4DAA80061BA5F007DDE890040CE55003DD45700028F080061B06700C1C8
      BF00A1A8A500E0F2F300FFFFFF00FFFFFF00C8C7C600A1A09E00A9A8A600ADAD
      AB00A3A2A2005D4E88007764B4006D5AAA006C58AB006D58AE006C57AE006A56
      A9005D48A000968ABC00DBDADF00DAD9E100E7E5EE00F1EFF600C6BFDF009383
      C600988BC3009C91C200978EB900948BB4009D95B800ACA6C3007C729F00D6D4
      DB00F4F4F400F3F3F400F5F5F500FAFAFA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00E1977900F4C4
      B000FCFCFC00CA998100C7B3A500F0ECEA00FFFAFB00DDB2A000A18B7600E0D8
      D200FCEFEE00FAEEED00E8C8BB00954B1B00D4B39B00F7E7DB00F2E1D300F4E4
      DB00F7EBE400A3CF9B0065B9620081E18C003BCD52003BD25400109817004C9E
      4F009EBCB100D2E6EB00FFFFFF00FFFFFF00C9C8C8009F9E9C00A6A6A400AAA9
      A800A4A3A3005E508700735FB1006551A4005E4AA0005F4BA100614DA2005944
      9A009387BB00DDDCE400DCDBE300E0DFE500E6E5EC00EEECF400F2F1F700CFC9
      E500A298CA00A197C300978FB500968EB200A29BBB00ACA6C100756A9A00D7D6
      DC00F2F2F100F1F1F100F3F3F300FAFAFA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00E1977900F4C5
      B100FBFCFD00B0502500A8562900C2B2A500FFFFFF00CF795400692E03006D5E
      4000FFF9F800FBF0F000EACBBD009A4E1D00D6B8A200F9EBE300F4E6DC00F4E7
      DE00F8ECE600F9F4F0009FD5A00058B455008FE89A0030C9480038CD4F00169E
      1D0046A15400B7DCD400FFFFFF00FFFFFF00D3D2D1009E9D9C00A5A4A200A7A6
      A500ABAAA800645A8100634FA50056439700533F9200534093004D398F008D80
      B400E9E8EE00E9E7EF00EAE8EF00D0CCDF00CEC9E000F2F1F600EFEEF400F2F2
      F500D7D2E700B5ADD300B7B0D000B2ACC900B2ADC500ADA7C300776D9A00E2E1
      E300EEEEEE00EEEEEF00F2F2F200FCFCFC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00E1977900F4C5
      B100FCFDFF00C97A5B00E4825700AC5A2F00CDC4BA00E5997C00DA6C3800703C
      1500BFB9AD00FFFAFA00EBCDBE009D501F00DCC7B900FFFFFF00FCF8F700FCF8
      F800FCF8F600FFFAFA00FDFCFA00A4DAA70045A73E00A5F7B30024C33F0030C9
      490014A2200054AA6300FFFFFF00FFFFFF00E7E7E700A4A3A100A2A19F00A4A4
      A200ADACAA00756F830059459A0058449900534191004C398B00897DB100E5E5
      EA00EAE8F000EFEEF300D2CEE000A193D000A89BD600D7D3E500F2F1F400F0EF
      F400F3F3F500DDD9E900C4BDDB00CAC4DD00CFCADE00A69DC4008D86A600EAE9
      E900EAEAEA00ECEBEB00F2F2F200FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00E1977900F3C5
      B100FFFFFF00C77C5C00BF896F00DA845A00A1542A00BA684200D0836500AB54
      2B005E4F2D00FFFFFF00EED0C300A2532400DEC8B800FFFEFF00FCF8F600FCF7
      F500FCF7F600FBF6F400FEF9FA00FFFDFF00B7E5BC0029972000B0FBC3007AD5
      850015901D00ADE1C700FFFFFF00FFFFFF00FBFBFA00B4B3B2009D9D9B00A3A2
      A000A8A7A50094919500514185006551A600614E9D00584495008C80B400E1E0
      E600ECEBF000D3CFE2009F91CE00A496D500B0A4DB00B8AEDD00DDDAE900F4F4
      F600EBEAED00D6D2E100CAC4DE00D1CDE200D7D2E9008275AB00BBB8C400E8E9
      E800E7E7E700E8E8E800F5F5F500FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00E1977900F3C4
      B000FFFFFF00CB846700C4947F00DBA99800E07D50008C3F1800D9AB9B00D473
      4200854B2600B6AFA200F8DBD000A8592A00E0C8B900FFFEFD00FBF6F500FBF6
      F400FBF5F300FDF8F800FDFAF800FEF9F800FFFFFF00C9EFCE00198C0E000D7E
      0B00A5C7B500E5F8FF00FFFFFF00FFFFFF00FFFFFF00D4D3D3009A999800A1A0
      9F00A3A1A000AAA9A700645C7900533F92005E4B9B00614E9D005C479D009083
      BB00C5BFD600988AC8009C8ECD00A99DD300B5AADA00C1B7E300C5BDE200D9D6
      E200D5D2E000CEC9E300D5D0E500D9D5E800B1A7D2007B719A00DDDCDC00E2E2
      E100E4E4E300E7E6E600FBFBFB00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00E1977900F4C6
      B300FAF0EC00D4937800CAA08E00EBCEC300E7B2A000914D2C00D9C4BA00E4C2
      B600A450250081694A00F8D9CD00AE603400DAB59A00F6E0CF00F3DAC600F1D7
      C300F3DFD000FCF9F800DBD0C900C9B6A800D0B9A800DDC2B900C0CAAE00B5B4
      9C00A3A29C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6F6F600A7A6A4009F9E
      9C00A1A09E00A5A4A2009A989A00463871004B378C004D388E004F3A9200513B
      9700705EAB00897ABB00978BC300A99ECE00BAB1DB00C6BFE300CAC3E400BFB9
      D600C8C3DC00CFCAE000D2CEE100C6BEE10073669D00BEBBC300E0DFDE00DEDE
      DE00E0DFDF00ECEBEB00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00E2987900F7CF
      BF00D5806300DF9C8300CA836800CEA89A00F1D1C500954A2800E3D3CD00D88F
      7400C4725400C2673F00DA967A00B5693E00E0C5B300FDF6F100FAF0EA00FAF0
      E900FDF5F000E1D8D100A8948000A38F7C00A1917F00A2928000A39080007064
      5200BCBDB500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D0D0CF009A99
      9800A19F9E00A09F9E00A9A8A50087848C004332770048328F004A349000513B
      95006F5EA7008B7DBA009F93C700A9A0CB00AFA7CC00BDB6D700C3BDD900C6C0
      D900CFCBE000D6D2E500C7C0E2007C6FA800A19DAD00DADAD900D8D8D800DBDB
      DA00DEDDDD00F8F8F800FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00E79B7B00F5C8
      B500E8C6BB00E5BFB000E4B9AA00E4BFB100FEFCFC00D0B1A300FCFAFB00DEA9
      9400E3B4A400E2B09F00E4AC9700B86C3F00DFBEA700F9EBE000F6E5D900F6E5
      D700FBEDE400E0D7D000DDC8B800FDE6D700F6DDCC00FEE1CF009B7E6800BBB7
      B000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFBFA00B1B1
      AF009B9A9900A19F9E00A1A09E00A9A8A60085818900413172003F2A85004A35
      8F006D5CA4009488BC00A499C700A79EC500B1AACB00B6AFCD00C9C3DD00DCD7
      EB00DEDAEE00C0B7DE007B6EA4009C98A700D3D3D100D3D3D200D5D5D400D5D5
      D500EAEAEA00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00EB9E7F00F3C2
      AD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F9E1D800B9673B00E6D0C400FFFFFF00FDFCFC00FDFC
      FC00FFFFFF00E0D6CE00E0CEC100FFEFE500FFF4E8008B715800BBB6AF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EDED
      ED00A4A3A2009D9C9A00A19F9E00A1A09E00A9A8A60094929500584E74004432
      7D0062509E009285BC00ACA4CC00B2ABCC00BEB8D500C4BFD700D8D3E900CCC5
      E4009B90BF00796F9600A9A6AE00CECECC00CCCCCB00CFCECE00CFCECE00DEDD
      DD00FDFDFD00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00EDA08200F7CD
      BF00F9E1D800F8DDD200F8DBCF00F7D9CC00F7D5C800F6D3C400F6CFC100F6CD
      BD00F4CBB900F4C9B700F7C3AF00BF714700E6D0C200FFFFFF00FCFAF900FDFA
      F800FFFDFD00E1D7D000E0CEC100FFFFF7008C725A00C3BEB700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E3E3E200A1A19F009D9C9A00A1A09E00A1A09E00A7A6A300A7A7A5008A86
      8E006A618000645989007A6E9F008D84AB00988FB200988FB300887FA5007C74
      930097939F00BDBCBC00C7C7C500C5C5C400C8C8C700C8C8C700D6D5D500FAF9
      F900FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00ED9D7D00EC8B
      6500E98A6400E5866000E2865E00DF825A00D77A5200D2744A00CC704600C66A
      3F00BF653B00BB5F3600B8603500A5461200E6CEC000FFFFFF00FEFCFB00FDFB
      FA00FFFFFE00E3D9D200F0DED100A48E7A00CBC6BF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E5E4E400A7A6A4009B9A9900A19F9E00A1A09E00A3A2A100AAA9
      A600ACABA900A3A2A200979599009592980098969B009D9A9F00AAA9AA00B9B9
      B700BFBEBC00BEBDBB00BFBEBE00C2C1C000C1C0BF00D3D3D200F9F9F900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E9E9E500E3DDD700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFBFB00FDFBFA00FDFA
      F800FEFDFD00E8DFD600A0887500D7D0CD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F1F1F100B9B8B7009C9B9A009D9C9A00A1A09E00A2A1
      A000A4A3A100A7A6A500ABABA900AEADAB00B1B0AE00B2B1B000B2B2B000B4B3
      B200B6B6B400B8B7B700B8B8B600BEBDBD00DCDCDB00FDFDFD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EEE9E600D1C0B200D1C0B200D1C0B300D0BFB200CFBE
      B000CFBEB100CEBDB000CDBCAF00CEBBAE00CCBAAD00CBB9AB00CAB8AA00CAB8
      AA00C9B7A900C8B7A900EAE4DE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DDDCDC00B2B1B0009E9D9B009B9A
      98009E9D9C00A2A19F00A4A4A200A7A6A500A9A9A700ABAAA900ADACAA00ADAC
      AB00AFAEAC00B7B6B500CDCDCC00F0F0F000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00E5E5E500C8C8
      C700B3B2B100A7A6A500A4A3A100A3A2A100A5A4A300AAA9A800B3B3B100C2C2
      C100D8D8D700F1F1F100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFA
      FA00E9E9E800D8D7D700CDCDCC00C8C7C600CAC9C900D2D2D100E0E0DF00F0F0
      F000FEFEFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E7E9EB00EAECEE00EAECEE00EAECEE00EAECEE00EAECEE00EAECEE00EAEC
      EE00EAECEE00EAECEE00EAECEE00EAECEE00EAECEE00EAECEE00EAECEE00E8EA
      EC00EAEAEA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BFAB9E00A290
      7F00836E5B00735C4600735F4900735F4900735F4900735F4900735F4900735F
      4900735F4A00735F4A00735F4A00735F4A00735F4A00735F4A00725E48008675
      6200EBECEE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFCFD00F0F2
      F300EAEBED00ECEDEF00ECEEEF00ECEEF000EDEEF000EDEEF000EDEEF000EDEE
      F000EDEEF000EDEEF000EDEEF000EDEEF000EDEEF000EDEEF000EDEEF000EDEE
      F000ECEEF000EBECED00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0CDD9005980A1003C60830071859900AAB7C100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B8A49400FDF6
      F000FFFFFD00FFFFFC00FFFEFB00FFFEFB00FFFDF900FFFDF900FFFDFA00FFFD
      F800FFFCF700FFFCF700FFFCF700FFFBF600FFFBF500FFFAF800FFFCF7007968
      5300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CFC1B800B6A9
      9D009E8F820095867700908173008F8071008D7E6E008D7E6F008D7F6F008D7F
      6F008D7F6F008D7F6F008D7F6F008D7F6F008E7F6F008E7F6F008E7F6F008E7F
      6F008E7F6F00B5ADA400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF007E9DB90077BBD40039B8DD002076A5006D849E00D9D9DA00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B8A49500F5ED
      E800FAF2EE00F9F2EE00FAF3EE00FAF2EE00F9F2ED00FAF2EC00FAF1ED00F9F1
      EC00F9EFEB00F9F1EB00F9F0EB00F8EEEA00F7EDE700F8EDE800FAEFE9007A69
      5400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B8A39300EBE4
      DE00EBE6E000E9E0DC00E8E0DA00E7DFD900E6DCD600E6DDD600E5DCD500E5DB
      D400E5DBD300E5DAD300E6DBD400EADED600ECE0D800EEE3D900EFE3DA00F1E4
      DD00CAB9AC009A8E7F00EAECED00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DDBC
      AB00DDBBAA00DDBCAB00DCBBA900DDBCAB00DDBCAC00DCBBAB00DBBBAB00DBBA
      AA00DBBAAA00DABAA900DAB9A900DAB9A900DBBAAA00DCBCAC00DFBDAC00C5B0
      A6006C97BA00DEFFFF0039A2CC0000AFE50038759D00B9BEC500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFBF700F6F0EC00F1EBE600F1EBE600F1EBE600F1EBE600F1EBE600F1EB
      E600F1EBE700F1ECE700F1ECE700F1ECE700F1ECE700F1ECE800F1ECE800F1EC
      E800F1ECE800F1ECE800F1EDE800EEEAE600EBEAE900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B8A49500F5ED
      E900FBF5F000F6EDEA00E7DDD600E9DED700E8DDD700E8DDD600E8DED600E8DE
      D500E8DDD600E8DDD600E8DDD500E7DAD300F2E8E200F9EEE900FAEFEA007A69
      5400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B8A49400F9F4
      F300FFFBFA00FFFDFB00FFFDFB00FFFCFA00FFFBF800FFFAF700FFF9F600FFFA
      F600FFFAF600FFF9F500ECE3DF00C4BEBA00A7A19D008F8B8700817D79009088
      8500978D8500968E8600D6D5D600EBEAEB00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D9A18400D67D
      5100D6805400D7805500D6805400CE744400C5653400C5663500C5673600C365
      3300C3653300C2643300C2633200C2643200C5663500BC5C2C00BD5A2800A959
      330071A1C800D3FAFF0033A2CD0028ACDA002AB9D9006E829900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF007AA5CA00578BB9005E8EBA005E8DB8005E8DB8005D8CB5005D8BB5005D8A
      B4005C88B3005C87B1005C86AF005B84AD005C83AC005B81A9005B81A8005C7F
      A7005A7EA6005C7DA400577AA000799CBD00D7DADC00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B9A49600F5EC
      E900FBF5F100F7EFEA00E9DED800EADFD900E9DFD800EADFD800EADED800EADE
      D800EADED700EADED600EADED700E8DCD400F3E9E400F8EFE900FBEFEA007A69
      5400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B8A49400F8F5
      F000FBF6F200CBAB9C00CDAD9F00CAAA9A00C8A69600C6A19000C49E8D00C29A
      8700B58E7C009882760094827800A5897D00B4928100C0978400C4968200FFF8
      F300C7BBB200877B6F00A19C9900B2ADAA00DFDEDE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D68A6300FFB2
      8C00FFB99500FFB89400FFBC9900F9A98000EF966800F0976900EE956800EF96
      6800EE966800EF976900EF976900F1986B00F1996C00DB845600DC825200BC73
      4F0070A3C700CDF9FF0030A2CD0024AEDC004296B50097A1AE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF006A93C1008DD9F40055C0EE0058C0EF0059C1EF0057C1EF0059C1EF0059C1
      EE0059C1EE0059C1EF0059C1EF0059C1EF005AC2EF005AC1EF005AC1EF0059C1
      EF005AC1EE005AC2F0005BC0EC003C79AC00CDCFD300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B9A49500F6EE
      EB00FCF6F300F5EEE800DDD1C900E0D3CA00DFD3CA00DFD3CA00DFD2CA00DFD2
      CA00DFD2CA00DFD3C900DFD2C900DDD0C700F1E6E000F8EFE900FAF1EB007A69
      5300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B8A49500F9F4
      F000FDF8F600F3EBE700F4ECE800F4EAE600F3E9E300F2E8E200F5EAE400DCD5
      D200ADA29B00BBABA100E6D2C700F2DFD300EEDED300EEDCD400ECDBD200FEF2
      EB00D6C6BB00A2948500E7E6E600BCB9B600ABA6A200D1CECC00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ED9C7100FEEB
      E400FFF4F100FFF0E900FFE3D500FED2BE00FDC0A100FDC1A400FCC0A300FDC1
      A400FDC1A400FDC1A400FDC1A400FDC1A400FDC4A800FCA97E00FEA67700D992
      70006D9DC600C7F7FF002DA2CD0027AAD8002FC8E10064799300FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF006D95C300A5F2FF0082DEF60082DEF50081DDF7007FDDF6007DDCF5007CDA
      F60079DBF60079DAF40076D8F50074D8F30073D7F40071D6F2006ED6F4006FD5
      F2006DD5F3006CD4F30066D1F8004080B100CDCFD300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BAA49700F7EF
      EC00FCF6F200F9F3EF00F6EEEB00F7F0EB00F7EFEB00F6EEEA00F7EDEA00F7ED
      EA00F6EDE900F6EDE700F4ECE700F3EBE500F7EEEA00F8EFEA00FBF1EC007A69
      5300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B9A49500F9F3
      F000FCF6F500DFCBC000E0CCC200DFCBC000DDC6BC00E0C7BC00BDA59900A796
      8B00D5B7A500E0BCA700DFB8A200DDB69E00DCB59D00DBB39C00D9B19900FFF9
      EC00DECAB700A7947F00F1ECE600F4EDE500D4D1CC00AAA39F00D3D2D100FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DFBDAC00FDBA
      9A00FFBC9B00FFBA9A00FFB89600FFB99600FFB79400FFB89500FFB89500FFC4
      A400FFCCA900FFBF9E00FFB89500FFB79500FFBB9A00E8946900E88E6000C17A
      55006EA0C600C1F7FF002BA6CF002BAED8002AB6E60043648400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF006C97C500A3EFFF0082DDF60082DCF60080DBF6007EDBF6007DDAF6007BD9
      F50079D9F50079D8F40077D7F40074D6F30072D6F20071D5F30070D5F2006FD4
      F3006DD4F3006DD3F10068D1F7004081B300CDD0D400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BBA59700F7F0
      EC00FCF7F400F3EDE800D2C4B900D5C7BD00D5C8BD00D5C6BD00D5C6BD00D5C6
      BD00D4C6BD00D8CCC200DFD4CA00E8DCD000F9F1E900FAF3EE00FCF1EC007A69
      5300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BAA39600F8F3
      F100FDF8F600E5D3CB00E5D5CD00E5D3CB00E5D2C900DFD0C800AD9F9800B3AC
      A700A9C3D100A5BFCD00A1BBCD009EBACF0097B7CF0099B6D1009EBBD7009AB5
      D20087A2C1006885A900799ECE006591CB00D2D7DE00D3CDC800A7A2A000E1E0
      DF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E0906800FDEF
      EA00FFFAF900FFF5F100FFE7DC00FEDECF00FED3C000FED5C200FFE1D100B556
      25005A000000D78B6300FFDDCD00FFD5C300FFD9C900FFB08600FFA97A00DF97
      77006C9FC900B5F3FF0027A2CF0027B8DD004D769800BCB8BE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF006E98C500A3EFFF0085DEF70085DEF60084DDF70082DCF6007FDBF5007EDB
      F6007DDAF4007BD9F5007AD8F50078D7F30076D7F30074D6F30071D6F30071D5
      F2006FD4F3006FD4F20069D2F7004082B500CDCFD400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BBA79800F7F0
      ED00FDF7F300FBF5F300F9F4F100FAF4F100FAF4F000FBF3F000FAF3F000FBF4
      EE00FDF8F300FFFDF700FCFAFB00A7B6EC00C3CBEF00FEF9F500FCF2ED007A69
      5300EBEDEF00FFFFFF00E5E5E500DFDFDF00EBEBEB00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BBA49600F7F3
      F100FDFAF700F0E5E000F1E7E100F1E6E000F3E7E000B5A8A200B3A89F00799C
      AF00528FAF004E8CB0004888B1004283B2003D80B3004281BA004687C1004583
      C6004081C800377BCB002870C5000758C000BFC8D200F1EDEA00BCB6B100B7B2
      AF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E0B8A100FDC1
      A300FFC3A600FFC1A400FFBE9F00FDB59100FBAA8200FCAE8500FDB08800D27A
      4C0078180000EA936500FFAD8300FFAC8100FFAE8300EA946800EC976C00C87E
      59006DA4C800ACF1FF0021A6D10032AED6000BC2F50035729B00C9C7CB00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF006F9BC800A1EFFF0087DFF80087DFF70087DEF70085DDF70082DDF60081DB
      F70080DCF6007DDAF5007DD9F4007AD8F40078D8F30078D7F30074D7F40073D5
      F30072D6F20072D6F3006AD2F7004083B600CDCFD400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BBA69900F7F0
      EF00FCF8F500F5EFEB00DACEC500DCD2C800DCD1C700DBD1C700DED3C900E9DF
      D300ECE6E100B5BEE2006884DB005F7CDB004869D700E3E7F500FFF6EF007B6A
      5400EAECEE00DDDDDD008D888500908C8A00D5D6D600EBEBEB00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BBA69700F7F4
      F100FBF8F500CFB1A300D1B3A600CFB1A200C6AA9D00A08A7E00CCBDAE00C2CD
      CC00BEC7C500B8C8CA00B1C6CC00AAC3CD00A9C5D200ACCDDD00A7CDE000A1CC
      E3009BCAE20098CAE5006BA3D6002F73C600C6C9D000F0ECE700E5E0DB00A7A2
      9F00DDDCDC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E3A38200FDDC
      CC00FFE3D700FFE0D100FFD6C100FFD3BC00FFCEB400FFCDB300FFDAC200DA80
      5200520E0000F6A47800FFC1A300FDBC9C00FDBEA000F8A27700FBAE8600D88F
      6C0069A3CB00A3EFFF001EA7D2002EADD5004DC3E30000BDF7005F698500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF006F9DCB00A7F2FF008BE0F8008BE0F8008AE0F70086DEF80085DEF70084DD
      F60083DCF70080DCF6007FDBF5007CDAF4007CD9F5007AD8F40079D8F40076D7
      F30074D7F30074D6F2006CD3F7004185B900CDD0D400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BBA79900F7F1
      EF00FCF9F700F9F4F000EEE5E000EFE7E200F2E9E500F7F1EC00FFFFF700DDE3
      F600859DE700496BD800A8B5E600EBEBF300869BE200859BE600FFFBF0007F6D
      5900C8CACB008079730094887F00837B7300928F8D00D9D9D900EBEBEC00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BBA69900F8F3
      F100FDFBFB00FDFBF900FEFBF900FFFFFD00D1CCCA00CABCB00082A8C9007CA6
      CA0078A5C90073A3CC006EA0CD0069A1D20070A7DB0079B0E60073ADE6006DA9
      E90064A3E80083BAEA0081B1D8004381C800CBCED300ECE6DF00ECE6E200B7B2
      AE00C5C2C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E3AB8F00FDD2
      BE00FFD7C500FFD5C000FFCDB400FFC9AE00FFC4A400FFC5A800FFB68D00D47C
      4B003D020000F1966400FFAE8400FCB18A00FDB18B00F2A68000F5A57C00D28A
      670068A5CD009CEDFF0019A7D2002DAED5003FC2E500248EBA008690A200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00739FCD00B2F3FF008DE2F9008EE1F8008DE0F8008BE0F80089DFF70087DF
      F70085DEF70083DDF80082DDF60080DBF5007EDAF5007DDAF4007BD9F60079D8
      F40077D7F50077D8F3006ED4F8004288BB00CDD0D400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BBA99900F8F2
      F000FDFAF800F8F2F000E8DFD800EAE3DD00F9EFE300ECE9E90097A7E2006080
      E00095A8E800AFBCE9008196DD005B77D600CCD3F0004367DA00DBDBF0007E6F
      5900817C7800A6938800D0C7C100B7B1AB007F766E008D8A8900DFDFDF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BBA69800F9F7
      F300FCF7F500CEB0A000D0B2A400D2B3A300A38F8500BFAA990087A8C30080A4
      C2007BA3C40076A0C6006F9EC80076A5D1007DADDF007EB1E6007AAFE60074AA
      E6006BA5E60088BBE80089B4D7005087C900D0D3D800EDE4DC00ECE6E000C6C0
      BC00B0ACAB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E4B19700FDD2
      BD00FFD6C300FFD4BF00FFCBB100FFC8AC00FFC3A600FFCAAE00E38E6100590A
      0000710E00009B3E1800EF9F7700FFBE9D00FFBD9C00F7A77F00FBA77C00D78B
      670066A4CE0095ECFF0015A7D3002AB3D9003F8DB000597E9A00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0074A2D000B6F6FF0090E4FA0091E2F9008FE2FA008DE1F8008DE0F90089E1
      F70088DFF80086DEF60084DDF60082DCF70081DDF5007FDBF5007EDAF6007CD9
      F4007AD8F50079DAF3006FD5F800438BBE00CDD1D500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BAA99A00F8F2
      F000FDFAF800F8F4F200F1E9E100FFFCF200BBC6F1005778E5008498E300D2D8
      ED00A4B2E6004E6DD8001F44C8001037C500A9B7E900CCD5F700546DC6006C60
      5000AA978A00D8D1CC00CDC8C600CAC4C100B9B1AD0081776F008D8B8A00E0E0
      E000EBEBEB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BBA99900F8F4
      F100FDFBFA00F5EEE900F5EEEA00FDF4F100ADA6A200CDBFAF00A6B6C1009BAE
      BD0099AFC00094ADC10091ABC30092B2CF0099BDDE009DC2E70098C0E60092BB
      E6008AB7E6009FC8E80093BAD9005E90CA00D3D3D500ECE4DC00EEE6DF00CEC6
      C200A4A09E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E79F7A00FDEE
      E800FFF6F300FFF3EF00FFEBE300FFE3D600FFD9C900FFE1D100F5A074007F27
      06004C030000C96D3D00F3AE8C00FFD6C300FED4C100FCB69500FCB28C00C291
      7D0080A8CB0090EAFF0011A2D00024B2D8005B7290005A728900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0076A4D100B8F4FF0093E5FA0094E4F90093E4FA0090E4F8008FE3FA008DE2
      F8008CE1F90089DFF90088E0F80086DFF60085DEF70083DDF70081DCF5007FDC
      F6007DDBF4007DDBF50070D6F900438EC000CDD1D500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BCA89A00F9F4
      F200FDFBFB00FFFFF900E7E8F3005E7DE4005B7CE500DAE1F800CFD6F5005173
      E600345ADD00254ED9001B44D200788EDF00F3F6FF0097A3D0004A4C5B00B299
      8800DDD9D600CECAC700CBC5C400CDC7C400CEC9C600B2AAA500706861008B89
      8800EAEBEB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BAA89A00F8F5
      F300FDFAF800E0CBC200E0CEC400E6D1C800A5979100ADAAA000C5BEB300C1BC
      AF00C1BDB300BFBDB300BBBEB700B6C0BE00B6C6C900BCCED500BED4DC00BCD3
      DF00B7D1DF00B0CEDE0091B4D4006B99CB00D5D4D500ECE4DC00EEE5DE00CFC6
      BF00A29E9B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E2BEAA00FCC4
      A700FFC5A900FFC4A700FFC0A000FFBC9A00FFB89500FFB89600FFB99600F597
      670084220000DA825300FFBC9A00FFB89600FFBB9900F5976700EC8A5700528A
      B0001ECCFF00B2E8ED0028CCF8004CD5F70008B5EC0000A5EB00FDE5DA00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0078A7D400B6F4FF0096E6FA0096E6FB0095E5FB0094E4F90092E4FA0091E3
      F8008FE3FA008CE1F9008AE1F80088E0F80087DFF70085DEF70083DDF70082DC
      F60080DBF60080DCF60073D8F900458FC200CDD1D500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDA89C00FAF4
      F300FFFFFC00B4C3F4003B60E400A2B2EB00EFEDEF006C88E2002A52DA001F45
      D7001A43D4003256D700C1C9EB00C6D0F200586FBD004E4E5600B4968100EAE8
      E700D4D0CD00D2CEC900C8C3C000B8B3B000A9A4A200A8A4A20095908B00685F
      5900908E8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BCA89900F9F6
      F400FDFBFA00E7D6CE00E7D8D100EDDDD500B1A29C007F9092008B9D9F008C9C
      9D00879B9F00869BA10086A1AA007F9FAD00799DAF007CA2B70082A8C00087AD
      C80088AFCF0086AED00082A9CF00719FCD00D9D8DB00EFE5DD00EBE0D800C5BB
      B400AEAAA700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EE9F7600FEF7
      F400FFFFFF00FFFCFC00FFF3EF00FFE9E200FFDFD100FFDFD100FFE0D100FFE1
      D200FFE9D900FFDECD00FFD6C300FFD8C400D0C0BA006790AF005B80A50000CE
      FF00B1E2EA0096DDED0087D8EF008BDAEE0099DEEF0069DDFC004E678D007E92
      AA00BEC8CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0079A8D600B9F5FF0099E7FC009AE7FC0098E6FB0095E6FA0094E5FB0093E4
      F90092E3FA0090E3FA008EE2F9008CE1F9008BE0F80088DFF80087DEF70085DD
      F70082DDF60083DDF70076DAF9004590C400CDD1D600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDAA9C00FAF6
      F400FDFEFC00718EED007690EE00D2DBF800355BE7002750E5002853E5003960
      E50093A7EF00FCFEFE009DB1F5003959C60056566100B79B8500F0EFED00BAB6
      B500A6A4A400A5A1A100A8A3A100AAA5A200A9A4A100A8A3A100A9A4A4008C86
      8200A7A09C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDA89B00FAF7
      F400FDFCFB00F0E6E100F1E7E200F6EAE600C6BEB900B4B2AD00D0BFAE00D2BE
      AA00D0BEAE00D0C0B100D5CEC400D7D5CE00D4D3CD00D0CDC600D0CBC500D3D0
      CC00C8C6C400B5B4B100CED1D600C9D0D600E8E2DC00EFE3D900E5D9CE00B9B0
      A900BEBCBA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E6BCA800FECB
      B300FFCEB600FFCCB300FFC9AE00FFC6A900FFC1A300FFC2A400FFC2A400FFC2
      A300FFC2A400FFC1A300FFC1A300FFC5A100999FB2007AC8E00002C9FF0021C6
      F90093DDED0084D9EE0087D7ED0083D6EE0081D8EE0079DAF30000BCF7003598
      C4009EA4B300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF007AABD900BBF6FF0099E8FC009BE8FC0099E6FB0098E6FB0095E6FA0094E5
      FA0094E4FB0092E5FA0090E4F9008FE2FA008DE1F9008BE2F8008AE0F80088E0
      F80086DEF70086DFF7007EDCFA004791C500CCD2D600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDAB9C00F9F5
      F400FFFFFD00EAEDFB006A88EB00B3BEEA005D7AE1003558DE00627FE400D4D8
      F000C3CDF1005578EB006077C90079726E00B19A8800EFEBE600A8ABBC002742
      9C000020930014318A005D6B940096959E00AAA6A300ACA9A500948E88009A94
      8E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDA99C00FBF7
      F600FCFAF900D8C1B400DAC3B900DCC4B900C3ADA300AC9A9000D9AF9100E1B3
      9200DBB09000DBB09100E2BEA500E6CAB700E8CDBC00E5C7B400E0BEA700FBE7
      D700E4CBB700C3AA9200E8D6C600E9D6C500E7D7C700ECDBCC00E0D1C400ACA5
      A100D4D3D400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F2AE8B00F9D6
      C600F9DCCE00FADCCE00F9DACB00F7D4C200F7D2BF00F8D5C200F5CDB700F4CB
      B500F3C9B400F3C5AE00F3C7B100FBC8AD00919BAC00B8EFFA009DDCEC008AD7
      EE006CD4EF006CD4F0006CD4EF0071D2F00071D2F0007CD5EF0071D8F50000A1
      DC009797AA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF007CAEDB00C5FEFF00B5F4FF00B4F2FF00B1F2FF00AFF1FF00ABEFFE00A7EE
      FF00A3ECFE00A1EBFD009DEAFD0099E7FC0095E6FA0092E5FB008EE3FB008BE2
      FA0088E0F90086E0F90087E3FD004691C300D1D5DB00FFFFFF00FFFFFF00C2BA
      B700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BEAC9E00FAF7
      F600FFFFFC00FEFCFB0098AAEC00879EF100B7C4F200B4C1F300CCD5F8007892
      EF006584EB00A9B0CF00968A7800AA968900E6E1DF00EDE6DC003A509E000026
      DD00083CEA001642CE000934BB001D41B7006B78A5009F97920099928C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDAB9C00FAF7
      F500FFFEFD00FFFCFD00FFFDFD00FFFEFC00FFFFFE00B0ADAB00D3C2B500EFCB
      AC00E7C5A900E7C7AC00EED6C300F4E5D800F7ECE200F7ECE500F5EBE000F7EA
      E000E5D3C400C8B5A200E7D9CA00E6D7C800E7D8CA00EBD8CB00C4B8AA00A6A4
      A100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8EAE300F4C1
      A700F4C1A700EFB39400E58D6000F6B39100E7916600CE6D3A00E9B59900ECBB
      A100EAB79E00EABAA100DE977100E8996E00899AAC00BEEFF700D3EAE900B5DF
      EB0095DBEC007ED9EE006DD4F0005CCFF10060D0EF0068D2F10062D3F20003A3
      DA009B9AAB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0076A8DB008AB8E20089B6E00088B6E10086B5E10084B6E30084B5E10083B5
      E20081B5E30080B7E3007DB8E50073B3E50070B1E4006EB1E5006CB1E4006BB0
      E50069B1E40068AFE50067B0E70068B0DB00E4E9ED00FFFFFF00E2E0DD008472
      6800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BEAC9E00FBF7
      F600FFFEFE00FFFFFA00E2E5F4007490EF008EA3EC008AA1EF006A88EF00B3C3
      F900DFDBD500857A6E00A7958A00E6E0DC00DFDEDD00F1E9DA00082A9E001147
      F9005881FF004370FF002C5FFF00164DFF000936D0006D728D00EAE9E300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BEAA9C00FBF8
      F600FDFCFB00D4B9AD00D6BEB200D7BDB000D7BDB000C5B0A5009E8F8700D1AA
      8F00DEB18F00E8C8AC00EFD9C600F6E8DC00F8EDE400FAF1EB00FAF2EC00FCF4
      ED00EEE5DC00D7CBC200EFE9E300EFE7E100F2E7DB00DCCCBF00A29E9900D9D7
      D600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F1E3DB00DE977200FFF0E600E8A07D00AF4A1700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E5BEA800F7C4A90093B1CA00B8EDF500C1E5EA00B4E6
      EC00C2EAEC00BCE7EC00B8E5EC009ADDEE0068D1F00043CAEE0046CFF20005A4
      DA009B9BAC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0074ABDC00B6EDFD00A9EDFE00A5ECFE00ACEDFD00A9EBFE00A4EDFD009CE9
      FE009FEAFF0097D3F3009EC0E300E0E6ED00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EEF0F200F6F5F500FFFFFF00CEC9C3008E7F
      7600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BEAC9F00FBF8
      F800FFFFFF00FBF6F400EFE6DC00ABB7E800617FEA00A0AFEA00DDDDE700F3EB
      DD0077716B00A9958900E9E2E000E2E1DF00DDDBD800F4ECDD00082DA5005580
      FF006285FF002756FD002557FD002C5EFF000941FB003450A200F6F3E900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BEAB9C00FBF8
      F700FFFFFE00F7F3F000F8F3F100F8F3F000F7F2EE00FFF9F500C2BAB600B9AD
      A600DFBEA400EAC6AB00EED7C100EFDED000EEE1D700EFE3DB00EFE5DC00F1E6
      DD00E6D8CD00D7C9BC00F0E7DE00EEE2D700E2D0C000AFA7A000C1BFBD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F1DED500DF987200FFEFE600EDA58300B14C1800F3EEEB00FFFF
      FF00FFFFFF00FFFFFF00E5BBA400F5B08E009AA9BD00AEEBF600ADE1EB00A0E5
      EE00B1E6EC0091DEEB0076E0EE008FDFEE00A8E2ED00A5DFEC009CDFEF0000A1
      DA009897AC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0D8ED008CC1E600BAEDFD00BEEFFD00BEF0FD00BFEEFD00BDEDFD00B2ED
      FD00A0D9F40099BEE400DDE4EC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B4A59900CBC5C100EEEFEF00E0DEDE006F645B00BBB6
      B400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BEAC9F00FAF8
      F800FFFFFF00FCFBFB00F9F6F300F3F3F800E8EBFA00FFFDFA00FFFBF600F6F1
      EE00A28B7C00F4F2F100E2E0E000E0DDDC00DFDCDB00F6EEE000001DA80096AE
      FF002B5DFF002859FE002859FD00265AFD00255BFF0000199300FBF7E900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BEAC9D00FAF9
      F700FEFEFC00E2D0C800E4D4CC00E4D3CA00E2D1C900E2D0C700E3D2C900B9B0
      AC00B2A19600DCC4B000E6CCB500E1CAB600DDCDBC00DBCBBC00DACABB00D8C7
      B800CEBEAF00E5D9CC00F0E5DA00D4C6BA00B3AAA300BAB8B600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F2DFD500E29C7900FFF1EC00F1AC8A00B6501C00F3EEEB00FFFF
      FF00FFFFFF00FFFFFF00E5BCA500F5AC87009BA5BE00ADEAF7009DDDED009BE1
      EE00B0E4EB00A9E7F100B3F8FF00C0F0F900AFE6EE00B3E2ED00B6E3EE0000A1
      DA00969AAC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B7D2ED0099BDE3009ABEE4009ABEE40098BEE40098BDE40096BD
      E500A2C4E700E4EBF300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E7E3E00091766600AEA29A00B8B4B100766A6200A39C9800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BFAD9F00FCF9
      F900FFFFFF00FEFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FFFF
      FF00D5CDC700C8B6A900F2F3F400DFDDDC00E1DDDE00F4EEE0001B3CB3007796
      FF004B72FF00265AFF002A5BFF002758FE001C52FF001334A100FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BEAC9E00FAF8
      F800FEFEFD00E9DAD500EADED700EADDD600E9DCD500E9DAD300E9DBD300E2D1
      C900BEAFA700BCB5B200B5A49800D5C6B900F4E5D800FDE9DA00FCE7D500DBC8
      B800D3C8BD00D5CCC400BAB1A900AFA9A500CCCAC800FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F2DFD500E19B7800FFF8F400F7B38F00B9542100F4EFED00FFFF
      FF00FFFFFF00FFFFFF00E6BCA700F5AD88009FABBD00B2EBF7008EDAED008BDC
      EF0099E5EE005EBBCF003879970089CCDD00B0EAF200A1E0EE00B0E2ED0000A2
      DE00949AAF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00BFADA300724B36007E6452009B8F8800C8C4C100FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BFAC9E00F6F3
      F200FBFAFA00FBF9F800FAF9F800F9F8F700F9F8F600F9F8F600F9F7F600FBF7
      F600FAF8F600C8BDB600CABBB000EDECEC00E0DFDE00EDE8DF007A8CC8001D4F
      F90085A1FF00537CFF003B6AFF004270FF00023BF1007789C300FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BEAC9F00FBF9
      F800FFFFFF00F1E8E500F2EAE600F3EAE600F1EAE400F1E8E400F0E6E300F1E8
      E300F2EAE600ECEBEB00BAAFA800ADA39C00B7AFA800B0A59D00A1958C009289
      8100AAA5A100B8B5B100C8C5C400E2E1E100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F2E1D700E39F7E00FFFAF700FFCDB000C6643100D9B7A700FFFF
      FF00FFFFFF00F4EFEB00E0A78800FAB592009DADC400A1DEEE00C2F1FA0090E2
      F2009AE6F2007AD2DF006AACC10076D2E400AFECF300B9E9F400BDEDF200079E
      D5009BA1B700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00DFD6D100A28B7C008C716000DBD8D400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D0C3B900BEAD
      A000BFAC9F00BFAB9F00BEAA9C00BEAA9D00BCA99B00BCA89A00BBA89900BDAA
      9C00CAB9AE00DCD4CE00C4B8B100CFC5BC00E9E9E800E4E1DF00DBDADE004861
      C1002955EE006887EC006988EC002C5AEF005875CD00E7E8ED00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BEAB9F00FCFA
      F900FEFEFD00DAC3B800DCC7BD00DDC6BC00DAC5BA00DAC3B700D8BFB500D6BD
      B100DCC6BB00FFFFFF00D8CCC200D4CBC500F8EDE9007C665000C1C0BE00E4E4
      E400E8E7E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F5EAE500E9A58200FFD7C400FFEFE600EDB09000BF5A2800CC99
      8000DEBCAB00D89A7A00F1A27C00FFD4B900B3AEB10065A3C400A0D6E900A4D2
      E400AFD2E100B3D3E200B0D5E400BCD0DE009ACFE20099D1E1009ACADA006A90
      B100B2C3D300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00D1C8C200D7D1CD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C3BBB400D0C6BF00EDECEB00CFC7BF00B7AE
      AD0096A4D3005C77C9005B74C70099A7D500E8EAF000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BFAD9F00FCFA
      F900FFFFFF00FDFBFB00FDFBFA00FCFCFA00FCFBFA00FCFBF900FDFBF900FDF9
      F900FCFAF900FFFFFF00D9CEC500E0CABD00B1988600C6C1BC00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EEC1AA00F8AB8400FFDBC800FFF4ED00F6C7B100D493
      7200D77F5100E8976F00FFC9AE00FFBA9800E18F6600A48F8800B1BCCE00ADC0
      D400A4BFD100A9BDD000ACBACD00ABB8CB00ABB6C900A6B4CA00A2B2C700BFCE
      DB00E2EAEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C8C0B900CFC6BF00C3BAB200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BFAC9E00F7F4
      F300FCFBFA00FBFBFA00FBFBFA00FBFBFA00FBF9F900FBF9F900FBFBF900FBF9
      F900FBF8F700FDFDFC00D8CCC400AD948300D7D3D000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F6EEEA00F0C0A900F0A57F00FEBFA000FFE9DF00FFFF
      FC00FFE0CD00FFCFB500FFB89200F0956700D3825800E2B7A100FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DED8D400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D0C3B900BEAC
      9F00BEAC9F00BEAB9E00BDAA9C00BEA99C00BBA89A00BCA79900BAA69700BAA4
      9700B9A49600B9A39400B9A49400DAD4CE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F0D4C700EDB59900E5A38200DD96
      7100DB896000DD936C00E4A17F00E9B9A000EDDBD300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F6F8F800E7EBEA00DDE1E000DDE1E000DCDEDD00DBDCDC00DCDC
      DC00DCDCDC00DCDCDC00DCDDDD00DDDDDD00DDDDDD00DDDEDE00DDDEDE00DDDE
      DE00DCE0DF00DCE1E000DCE1E000DCE1E000DCE1E000DCE1E000DBE0DF00E1E1
      E100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E4E4E300929292009595
      9500E8E8E600EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F9F9F900E9E7E600DCDAD900D5D3D100D5D3D100D5D3D100D5D3
      D100D5D3D100D5D3D100D5D3D100D5D3D100D5D3D100D5D3D100D5D3D100D5D3
      D200D5D4D200D5D3D200D5D4D200D5D4D200D6D4D200E5E5E500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FAF9FA00F8F5F800F4F2F400F3F1F300F3F1
      F300F2F1F200F1F1F100F1F1F100F1F1F100F1F1F100F1F1F100F1F1F100F3F1
      F300F3F1F300F3F1F300F3F1F300F3F1F300F4F4F400F8F8F800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F9FBFB00DAD2D200BB98A000B5989D00AF8D9400AC9B9F00AFB0AF00B2B2
      B200AFB1B000ABADAC00A7A3A300A4A1A100A29E9E00A09C9C009F9B9B009C9D
      9B00B0899200AE8B9200AD8A9100AC889000AC899100AC899100AB848B00C8CB
      CA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DFDFDF0086868300181858002E2D
      800086868A00E7E7E500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F3F0EF00A78D7B00AE9F900098847300907E6C00917F6D00917F
      6C00917E6C00917E6C00907E6C00907E6C00917E6B00907D6B00917E6B00907D
      6B00907D6A00907D6A00907D6A0093806D0070594200D4D2CF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E8EDE800C8D7C700C3D0C200C2CFC100C1D0
      C000CFCFCF00CCCCCC00CCCCCC00CCCCCC00CDCDCD00CDCDCD00D0CED000C3D0
      C200C2CFC100C2CFC100C2CFC100C9D3C900DFE0DF00F1F0F100F9F9F900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E8E6E500B58F8D00A5566800B0647200A3506200B68F9700D4DBDB00A182
      8700A77B8200A27A8100BFBFBE00B6B0B100B0ABAB00ACA6A500A5A0A000B3B6
      B3008C3648009A4457009F4E6000AB5E6E00A7556600A9576900912F4300C3C8
      C700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E7E9E800CFCFCF007F7E7E008C9095006769B9005D5E
      DB006365C300AEAEB000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F2EFEE00BEA99B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FE00FFFFFD00FFFFFC00FFFDFB00FFFDFA00FFFBF700FFFAF600FFFAF600FFFA
      F500FFF8F400FFF9F300FFF8F300FFFFFF0095827000D3D2CF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF006FB86F00259C29002EA334002EA3340027A8
      2E00737874008A888A00888887008A8A8A0083838300838383007E737E0033A1
      38002DA433002EA334002BA12F003D9F3E00B0C9B000F2EEF200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0929C00AA6A7200B8727F00B9748000AF657300CDACB400FBFFFF00A471
      7B00B5697600B26D7A00E9EFEF00DDDBDD00D9D7D800D3D0D100CAC6C600E6EA
      E800853B4B00A0526400AB657300C0828D00B9737F00BD78840097384C00C3C9
      C800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00EBE7E700D5C4C900D0C2C400CDBCC000CBC3C500CDCDCD00CFD0CF00CDCF
      CE00CBCDCC00C8C7C700C7C5C500C6C4C400C5C3C300C3C4C300CDBCBF00CDBC
      C000CDBBBF00C4B3B700B1A2A60071756D00566F5200C7CCC600E6E7E0008283
      C7008483A200DEDED900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F2EFEE00BCA79800FFFFFF00FBF6F300FBF6F200FAF4F200FBF4
      F000F9F4F000FAF2EE00FAF2ED00FAF2EC00F9EFEB00F7EFEA00F7EEE900F7EF
      E900F7EEE700F6ECE700F8ECE600FFF7F300927F6D00D3D2CF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EAF2E9003BB03C0087E4970097EEA70095EDA50096F7
      A7007B7C7B00D8D6D700D3D3D200D3D3D300AAAAAA00A2A2A2007E757D0091E5
      A00095EEA60096EDA60094EBA3004CB4500094BF9200F8F3F800F9F9F900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B5778700BE858E00B9748000BA748100AF667200C8A6AE00F4FDFE00A472
      7D00B56C7800B16F7B00E9F0F100DEDCDF00D9D6D800D3D0D100CBC8C800E5E9
      E800843949009D506200A9647200BF808B00B9727F00BD78850098384D00C3C9
      C800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00BC9B9A009F4C5F00AA5B6B009C475800A87F8800BFC4C4009D878B009F81
      8600997E8200AAA7A600A19B9B009C959500968F8E00999A98008E3E4E00953C
      4F008E384A007D2E3E0058384F006B84800042772F004E784400B1B4B5009B9B
      9A00D1D1CD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F2EFEE00BCA89900FFFFFF00FBF6F300FBF6F300FAF4F100FBF4
      F000FAF3F000F9F2EF00FAF2EE00F9F1ED00F9EFEB00F8F0EB00F7EFE900F8EE
      E900F7EEE800F6ECE700F8EDE700FFF8F30092806D00D3D2CF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF007BC97E0063C7680072C9740071C973006ECF
      70008E908E00B8B7B800D1D0D100D9D8D900AAAAAB008E8E8E007B727B0071C4
      740071CA730071C974006DC870006CBC6C00C6DBC500FBF8FC00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B6798800C38D9500B8748100BA758200AF667300C4A3AB00EDF6F600A473
      7D00B6707C00B16E7C00EEF7F800E5E4E700E0DFE100DBD7D900D3CFD200E9F0
      EE00813445009B4E6000A8637100BF818C00B9728000BD788500983B4E00C3C9
      C800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C9A5
      AC00AB6E7400B5717E00BA748000AF657300CFAEB600FEFFFF00A5717B00B668
      7500B36C7900EBF1F100DFDDDF00DBD9DA00D3D1D100E6EAE80091515F00994E
      5F008A465300644E6000629FBF00A9E6FF00ACC5BB003A6A33007F858000D5D4
      D500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F2EFEE00BDA79800FFFFFF00FBF6F400FAF5F400FBF4F100FBF5
      F100FAF5F000F9F2EE00FAF1EF00F8F1EE00F9EFEB00F9F0EA00F8EEEA00F8EE
      E900F8EDE800F7EEE800F8EEE700FFF9F40092806D00D3D2CF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E8F3E900CAE6CA00CCE6CB00CCE6CB00C9E7
      C900E8E8E800DEDEDE00A2A1A200D6D6D500A3A2A300B3B3B300D7D4D700CEE7
      CD00CCE7CB00CCE6CB00CAE6C900DCECDB00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B5798800C48D9400BA748200BA778300B1667500C09FA700E6EEEE00A26F
      7A00B0677500AC697400F3FAFD00EAE9ED00E4E5E800E1E0E200DAD8DA00EFF6
      F6007D324300994B5C00A75F7000C0828D00B9727F00BD788400993C5100C3C8
      C700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B476
      8600BA7E8800BA748100BA748100AE657200C8A6AF00F4FDFF00A4727D00B56C
      7800B16F7B00E8EFF000DDDBDE00D8D5D700D1CECF00E1E4E400874B58008A42
      4F00573A4B005D9CBD0098E5FF00B1FCFF0088D1EC006E827F00D0CFCE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F2F0EE00BDA89900FFFFFF00FCF7F400FAF6F400FBF5F200FBF4
      F200F9F3F000F9F2EF00FAF3EE00FAF2EF00F8F0EC00F7F1EB00F9EFEA00F9EE
      E900F7EEE900F7EFE800F7EDE800FFF9F50092806D00D3D2CF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0083838200DCDADA0093929200B7B7B600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B5798800C48D9700BB768400BC788500B1677500BD9CA400DFE7E700B693
      9B00A2788200A8848D00F4FBFD00EFF3F600EDF1F300EBEDEF00E3E4E700F8FF
      FF007A2F40008F435500A05B6B00C1828E00B8717E00BB76830099405100C3C8
      C700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B679
      8800C38D9500B8748000BA758200AF667300C5A3AB00EEF7F800A4727D00B56E
      7B00B16E7B00EDF6F600E4E2E500DFDEDF00D9D5D700DBDFDE0080424C00502A
      3A004F91B80098E6FF00ABF6FF0082E3FB0047556F00B9B6B800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F2F0EE00BDA89B00FFFFFF00FCF8F400FCF6F300FAF6F200F9F4
      F100FBF5F200F9F4EF00F9F3F000FAF2ED00F8F0EE00F9F1ED00F9EFEC00F9F0
      EB00F7EEEB00F9EFEB00F7EFEA00FFFAF50092806D00D3D2CF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E5E3E200DEDCDB00E0DDDC00E0DD
      DC00E2DFDE00D9D6D40086838200DEDBD80093918F00B3B0AF00E1DEDC00E1DE
      DD00E0DDDC00E0DDDC00E0DEDD00E9E8E700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B5798800C48F9600BB778400BD798500B76F7D00B6858F00C0A4AA00C8AE
      B400CEB4BB00D0B8BF00CDAFB700CFB3BA00D0B4BC00CEB2BA00CBAEB600D7BE
      C4008D445400914D5C00A5657200BD7A8700B7707D00BB7582009A415300C3C8
      C700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B579
      8800C48D9400B9748200BA768300B1667500C1A0A800E8F0F000A2717B00BA70
      7E00B36F7B00F3F9FC00E9E8EC00E4E4E700D3D2D400D3D2D10049222C004386
      B2009AEBFF00A2F0FF0082E2FA0053738B00802E4000D8CECF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F2F0EE00BDA99B00FFFFFF00FCF7F500FCF7F400FAF7F300FBF6
      F200FBF4F200F9F4F100FAF4F000F9F4EF00FAF1EE00F8F1ED00F8F1EC00F9F0
      EC00F8F0EC00F8F0EB00F8F0EA00FFFAF700927F6E00D3D2CF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E5E0DD00DFD9D500E6E9EC006794BE005082AB005489B1004E85AF004E85
      AF004E86B0004E88B2005691BC004E8CB8005394C0004F93BF00498FBC004891
      BF004892C0004490C0006CA0C200D8D6D500ECEBEA00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B5798800C5909800BC788500BD798600BD798600B66F7D00B0667400AF65
      7300AE647200AE637100AD637100AD606F00AC606F00AC5F6E00AD5E6E00AC5E
      6E00B26A7800B36C7A00B8738000B66D7A00B76F7D00BA7480009B415400C3C8
      C700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B579
      8800C48D9700BB758400BB788400B1687500BE9CA400E1E9E800AB7C86008F57
      630096647000F5FDFE00EDEFF200DFE0E100C9C5C5007C8389004184AF009CF1
      FF0097EBFF007DDCF4004E6D8600A25C6700A1475800D5CDCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F2F0EE00BEAA9C00FFFFFF00FBF8F600FCF8F500FBF6F400FAF5
      F300FBF5F200FAF5F100FBF4F100FAF4F000FAF2EE00F8F1EE00F9F2EC00FAF1
      ED00F8F1ED00F9F0EC00F9EFEC00FFFCF80092806E00D3D2CF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DBCB
      C200C9B1A300C5AB9A00EFF3F8006996C3008BCBE7009AE2FF006DD2FB0060CA
      F60061CCF70062CBF70062CCF70062CBF70062CBF60062CAF70062CAF60062CB
      F60062CAF50063CDF70053AFDD00829EB900E1DEDD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B5798800C5919900BD788600BD7A8700BE7B8800BD798700BE7A8700BC79
      8400BB768300BB778200BA768200BA727F00B9707F00B96F7D00B96E7C00B86E
      7B00B86F7C00B66D7B00B66C7A00B66D7B00B66D7A00B9717E009C425500C3C8
      C700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B579
      8800C38F9600BB778400BE798500B56C7A00B88F9700CABDBF00D3C9CD00DBD1
      D600DFD7DB00DBCCD100D3C5CA00BFB2B5007C838D004A88AE008CE0FF0090E7
      FF0079DAF3004F738D0099556000C17783009D475700D4CDCE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F2F0EF00BFAA9D00FFFFFF00FCF9F700FBF7F600FCF7F500FBF6
      F300FBF6F200FBF5F200FBF5F100FBF4F100F9F2EF00F9F2EF00F9F1ED00FAF1
      EE00F8F2ED00F8F1EC00F9F0ED00FFFDF90092816D00D3D2CF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFF
      FF00F8FDFF00F5F8FA00E6E8EB0071A1CC0085C5E10096CCE9008DDCFC0065C7
      F10065C7F30065C7F20065C7F20065C7F20065C7F20065C7F20065C7F20065C8
      F20065C7F20065C9F30063C7F20060A2CB00B3BAC500EBE9E700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B5788800C5919A00BE7B8700B66F7C009F4E63009F4D62009F4D62009F4D
      62009F4D61009F4D61009F4D62009F4C61009F4C61009F4C61009F4C61009F4C
      61009F4D61009F4D6100A04E6300A3566A00B1667600B96F7E009C445600C3C9
      C700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B579
      8800C5909700BC788500BD798600BD7A8600B36B7A00AB5E6E00AB5E6D00AA5D
      6D00A95C6C00A55968008C48530057374800457599007FD4F7008FE8FF0072DA
      F6004A708C0097525C00BD717F00BA7480009E465800D4CDCE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F2F0EF00BFAB9D00FFFFFF00FDF9F700FBF8F500FCF8F600FCF6
      F400FBF5F300FAF5F200FBF4F200FBF5F100F9F3F000FAF2EF00F9F3EF00FAF2
      EF00F8F1ED00F9F2EE00FAF1ED00FFFDFA0092806E00D3D2CE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFDFE00DFD3
      CB00CDBAAF00C7B2A500E9EDF10078A6D10098E1F60084C3E2009FDBF70076D1
      F70067C9F40069CAF30068CAF30069CAF30068CAF30068CAF30068CAF4006ACA
      F40068CAF30068CAF4006BCCF60059B6E3007FA3C000D5D4D700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B5788700C6939A00BA778400BA868E00F8F7F600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFFFE00FDFFFF00FCFE
      FD00FBFCFC00FCFEFE00F8F4F300C898A000AC5F6F00B96F7C009C445700C3C9
      C700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B579
      8800C5919900BD788600BD7A8700BD7B8700BD798700BE7A8700BC798400BC77
      8300B0707A00A2646E00674B5B00487A9C0076CEF4008BE6FF006BDCFD00486D
      860098525E00BD707D00B76E7B00B9717E009E465900D4CDCE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F2F0EF00BEAB9E00FFFFFF00FDFAF600FCF8F600FBF8F500FCF7
      F500FBF7F400FBF6F300FAF6F300FBF5F200FAF3F000F9F4F000F9F3EF00F9F3
      EF00F9F2EF00F9F2EE00FAF2EE00FFFEFD0092806E00D3D2CE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFCFC00EDE7
      E400E4DAD500E0D6CF00ECEEF30078A9D200A1F2FF0082C5E00098D5EF0099E2
      FF006BCBF4006CCCF5006BCCF5006DCCF5006CCCF5006BCCF5006BCCF5006DCC
      F5006CCCF5006CCCF5006DCCF6006CD0F900579DC700B2BCC600E6E5E400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B5788700C6949B00BB778300BF8E9700FFFFFF00F7F8F700F7F8F700F6F7
      F700F5F7F500F5F6F600F5F6F500F5F5F400F3F4F400F2F3F300F2F3F300F2F3
      F300F2F3F300F2F2F100F9FFFE00D4B5BC00AD5D6F00BA6F7D009D465800C4C9
      C700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B578
      8800C5919900BE7B8600B8717F00A6576A00A5566A00A5566900A7576A00A054
      66008E4B580062415200457195006FC3EA0085E4FF0060D4F500375B77008A3C
      4C00AB566900A75A6D00B0667600B96F7D009E475900D4CDCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F2F0EF00BEAC9F00FFFFFF00FDF9F700FBF8F600FBF9F600FBF7
      F500FBF8F600FCF6F400FAF7F300FAF6F400FBF4F100FAF5F000FAF5F000FAF3
      F000FBF3F000FAF3F100FBF3EF00FFFFFD0093816E00D3D1CE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFF
      FF00F5F9FB00F0F3F500E2E5E8007BABD400A9F3FF0093E4FA007CB9D800A5DD
      F5007DD4FB006ECDF60070CEF60070CEF70070CEF70070CEF60070CEF60070CE
      F60070CEF60070CDF60070CEF60071D0F80069C9F2006593BA00D5D3D500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B5788700C8949B00BC788400BF8E9600FBFFFF00E3E3E300E3E3E300E0E1
      E000E0DFDE00DFDFDF00DCDCDC00DBDBDA00D9DAD900D7D8D700D7D7D700D6D5
      D600D6D6D600D4D4D500E5EAE800D5B4BC00AD5F6F00B96F7C009E475A00C4C9
      C800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B578
      8800C6939A00BB788400B9818A00E5D4D700EDE0E300ECDFE200EADDE000D6C9
      CB00A2979A006B8AAE009FD1F10099DDFE005CD0F5005291A400CBC2C400EFDD
      E100E8D7DA00C7979F00A95C6E00B86F7C009E495900D4CED000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F3F0EF00C1AE9F00FFFFFF00FDF9F900FBF9F700FCF8F800FBF9
      F600FDF9F700FBF8F600FCF7F500FAF5F400FBF6F300FBF4F300FBF5F200FBF5
      F200F9F5F200FBF5F000F9F5F200FFFFFE0093817000D3D1CE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFFFF00D1BC
      AF00BA9A8800B5937D00EFF4F9007FACD500AEF2FF0097ECFF0086C8E10095DA
      F800ADEAFF006ECEF80073D0F70074D1F70074CFF90074D1F70074D1F70074CF
      F70074D1F70074D1F70074D1F90074D1F70077D5FC005AACD700A4B2C100E6E3
      E200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B5788700C7959D00BC788500BF8D9600FFFFFF00F2F2F100F2F2F200F1F1
      F000F0EFF000EFEFEF00EDEDED00EDEDED00EDECED00EBEAEA00EAEAEA00E9E9
      E900E8E8E800E7E7E700F2F6F500D5B3BD00AD607100B8707D009F4A5B00C4C8
      C800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B578
      8700C6949B00BA778200BF8E9600FFFFFF00FEFFFE00FFFFFF00EEF1F000DDDE
      D9006A7E8F00BCE7FF00D5F0FF0086CBF500538CA200D1D2D100FFFEFD00FAFD
      FC00FDFFFF00DFC9CE00A8586B00BA6F7D009E485A00D4CECF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F3F0EF00C1ADA000FFFFFF00FCFBF800FDFBF800FDF8F800FDFA
      F700FBF9F700FDF8F700FCF8F500FCF7F500FCF7F400FBF6F400FBF6F300FAF6
      F300FBF6F300FBF5F300FBF5F200FFFFFF0093816F00D3D1CE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFF
      FF00FAFEFF00F7FAFC00E8EAEE0081B0D900B2F4FF0098EAFF009BEEFF0073B8
      DB00A2E1FC008DDBFD0074D1F80078D2F90077D2FA0077D2F90077D2FA0077D2
      FA0077D2F90078D2F90077D2F90077D2FA0077D2F90079DBFF004E86BA00D6D4
      D400EAEAE900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B5788700C7969D00BD7A8600BF8D9600FFFFFF00EFEFEF00F0F0F000EFEF
      EE00EDEDED00ECECEC00EBEBEB00EAEBEA00E9E9E900E8E8E700E6E7E700E6E6
      E600E5E5E500E3E3E300F0F5F400D6B4BC00AC617200B8717E00A24B5E00C4C8
      C700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B578
      8700C8949C00BC788500BF8D9600FFFFFF00FAFAF900FDFDFD00E2E1DF008586
      880096CAF700BEE1FF0079A7D400687A8E00D8D2D100FEFDFC00F5F5F500F5F5
      F500F9FDFC00E1CBD000A85A6C00B9727E00A04B5E00D5CFCF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F3F1EF00C1AEA100FFFFFF00FDFAFA00FEFAFA00FCFAF800FCF9
      F900FDFAF700FDF8F800FCF9F600FBF9F600FCF8F500FBF7F500FBF6F400FBF7
      F400FBF6F300FBF6F300FCF6F300FFFFFF0093816F00D3D1CE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFCFC00ECE6
      E200DED5CF00D8CEC700E5E8ED0082B2DA00B3F4FF0099E9FF0098E9FE008EDF
      F7007CC1EB00ADEBFF007AD4FB0074D1F90076D1F90076D1F90076D1F90076D1
      F90076D1F90076D1F90076D1F90076D1F90076D1F90077D3FB006DCAF3007F98
      B600E9E5E100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B5788700C8969E00BD7A8600BF8D9600FDFFFF00EAE9EA00EBEAEB00E9E9
      E900E7E8E800E7E7E600E5E5E500E4E4E300E2E2E200E0E0E000DFE0DF00DDDE
      DE00DDDCDC00D9D9D900E9EDEC00D6B5BD00AD637200BA727F00A24F6100C4C8
      C700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B578
      8700C7979D00BD798600BF8E9600FDFFFF00E7E0E700F0E9F000A39E9C006487
      AA00A1CCF4006A8BAD0080848800CFCDCA00E0E0DF00D8D9D800D7D8D700D7D6
      D600E0E3E200E4CED200A95B6D00B9727E00A24E5F00D5CED000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F3F1EF00C1AFA100FFFFFF00FEFBFB00FDFBF900FCFBF900FDFA
      F800FCFAF800FDF9F700FCF9F800FCF8F600FCF9F600FBF7F600FCF8F500FCF7
      F500FCF7F400FBF7F500FCF6F400FFFFFF0093827000D3D1CE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFDFE00E0D4
      CC00D1BEB200CCB7A900EDF2F70082B3DC00B4F4FF009AE9FF0097E9FE009BEB
      FF0077C5E7009DD6F8009AE3FE0090DEFD0091DFFD0091DFFD0091DFFD0091DF
      FD0091DFFD0092DFFD0092DFFD0092DFFD0092DFFD0092DFFE0098E8FF005C9A
      C900C5CCD200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B5788700CA969E00BD7A8600BE8D9500FFFFFF00FAFAF900F9FAFA00F9F9
      F900F9F9F800F8F9F800F8F8F800F8F8F700F6F6F700F5F5F500F5F5F500F5F5
      F500F4F4F400F3F3F300FAFEFD00D5B4BC00AF647300BB748000A3526400C4C7
      C700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B578
      8700C8969E00BD7A8600C28E9900E6FFEB00A6E4A600B4F2B30061695E006C85
      A0007B8C9D00CFCBC700FBF9F800F3F3F300EFEFEE00EEEFEE00EDEEEE00EDEC
      EC00F2F5F400E3CCD200A95C6E00BB748000A24F6100D5CFD000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F3F1EE00C3AEA200FFFFFF00FDFDFB00FDFBFB00FDFBF900FDFA
      F900FCFBF800FCFAF800FCF9F800FDF9F700FCF9F700FBF8F600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0096867400D4D2D000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFF
      FF00F7FCFE00F3F7F800E5E7EC0084B5DE00B7F4FF009FEAFF0099EAFF0098E8
      FE0096EAFE008DC7EF0098C6EB009ECAED009CC9ED009BC9ED009BC9ED0099CA
      EE0099C8EE0096C8EF0092C4EF0094C8F1008FC7F20085C0EC0080BCE6005EA3
      D80081ACD600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B5788700CA9AA000BD7A8600BF8D9600FBFFFF00E3E3E300E4E5E400E3E3
      E500E2E4E300E3E1E100E0E0E000DEDEDE00DCDCDC00DADADA00D8D8D800D7D6
      D700D5D4D500D1D1D100E4E8E700D8B6BE00AF647400BC758200A3546500C3C7
      C700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B578
      8700C9969F00BD7A8600C48E9B00DAFEDF0083D882008AE18A00969B9500C8B8
      C300FDF1F900FDF2FD00F7ECF700F6EAF600F5E9F500F4E9F400F3E8F400F2E6
      F200F6F0F800E4CED300AA5C6E00BB748100A3536400D5CFD000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F3F1EE00C2B0A200FFFFFF00FFFCFC00FDFCFC00FEFBFA00FDFB
      FA00FDFBFA00FDFAFA00FEFAF900FCF9F800FCF9F700FFFFFF00C8B4A8009C87
      7700897A69008C7D6C008D7E6E00998B7A00735D4700DEDCDA00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFEFF00DACB
      C100C6AEA000C0A69500EBF0F60086B9E100BAF6FF00A7EDFF00A5ECFF00A4EC
      FF00A4EDFF009BE5FC0091D6F40087D6F5008CD9F60092DCF7008DDCF80086D9
      F60085D6F4007FD1F3007CCEF40061A8DD0097B1D500CDDBEA00CDDDED00CBDB
      EE00D7E6F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B5788700CA9AA000BD7A8600BE8D9500FFFFFF00FEFEFD00FDFDFC00FDFD
      FC00FCFDFC00FCFCFC00FCFCFB00FCFCFB00FBFBFA00FAFAF900F9F9F900F9F9
      F900F9F9F900F9F9F800FEFFFF00D7B4BC00A5697500B7758200A5536400C4C7
      C700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B578
      8700CA999F00BD7A8600C58E9C00CFFAD40064CF65006DD26F006DD86E0068D5
      690062D0630061CF630062CF620061CF620061CE620061CF620061CF62005DCD
      5E007FDD8100EFCFDE00AB5D6E00BC768300A4556500D5CFD100FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F3F1EF00C3B1A300FFFFFF00FDFCFC00FDFEFB00FDFCFB00FEFC
      FB00FEFDFA00FEFBFB00FCFCF900FCFAF900FEFAF800FFFFFF00AD958400FCFB
      FC00E2CBBB00E1C5B000E6C5AE0070523A00A89D9300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFBFB00F3F0
      EE00F0EBE800F1EBE700F0F4F90088BAE200BBF7FF00A4EEFF00A7EEFF00A9EE
      FF00A5EAFF009EECFF0099EAFF009DEBFF0096DCFB007DBDEB0074B6E60071B4
      E60070B3E60069ABE30066ABE20066AEDF00C5DBE700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B5788700CA9AA000BD7A8600BF8D9600FCFFFF00E7E7E700E8E8E800E8E8
      E800E8E8E800E8E8E800E7E7E700E5E6E500E4E4E400E2E2E200E0E0E100DFDE
      DE00DDDDDD00DBDADB00EAEFED00D9B6BF00995C6A0098596600A3516200C4C8
      C800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B578
      8700CA9AA000BD7A8600C18D9800F2FFF600C6F0C500C9F1C800C9F1C800C8F1
      C800C8F0C900C9F0C800C9F0C800C8EFC700C7EFC600C7EEC700C7EEC700C5EE
      C500D3F7D400E8CED700A8607000BC7B8700A5566600D6CFD100FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F3F1F000C3B1A300FFFFFF00FFFCFE00FDFCFD00FFFDFB00FDFD
      FD00FDFDFC00FDFBFA00FEFBFB00FEFCFB00FDFAFA00FFFFFF00AF958400FFFF
      FF00FFF0E500F5DFD000967B6300ACA29700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFB
      FB00FBFCFC00FDFDFD00EFF2F70081B5E200B7EFFF00ABEFFF00AAF0FF00ACEE
      FF00A8F0FF009FEDFF00A1ECFF0099D4F4009BBBDC00E0E2E600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B5788700CB9BA000BE7C8700BF8D9600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00D7B5BD00AF657500B3707C00A6576600C8CB
      CB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B578
      8700CA9AA000BD7A8600C08F9700F3F7F800CBC6CB00CFC9CF00CFC9CF00CFCA
      CF00CFCACF00CEC8CE00CBC7CB00CAC6CC00C9C4C900C7C2C700C5BFC500C1BC
      C100CFCED100E9D2D700985867009A636D00A14F5F00D7CFD100FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F3F1EF00C3B1A500FFFFFF00FFFEFD00FDFEFD00FFFEFD00FDFE
      FD00FEFEFC00FEFDFC00FDFBFC00FEFDFC00FCFBFB00FFFFFF00AF958400FFFF
      FF00FCE8DC00AA948000A59A8E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B8D1EA0092C6E900B8EAFC00BAEBFB00BCEB
      FB00B9E9FB00AFE9FB009ED6F30098BDE100D9DFE700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B2718100B3707E00AE647400B57D8900EDF1F000E7E6E600E7E6E600E7E6
      E600E8E6E600E8E6E600E8E6E600E8E6E600E8E6E600E8E6E600E8E6E600E8E6
      E600E8E6E600E8E7E600ECEFED00C6A1AA00A6506500B46575009C465900E0E5
      E300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B578
      8700CB9BA100BD7B8600BF8D9600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FFFF
      FE00FFFFFF00E4CED300A65D6D00A5667300A0526200D7D0D100FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F2F1EF00C4B1A400FFFFFF00FFFFFE00FEFEFD00FEFEFE00FEFE
      FE00FEFEFD00FEFDFD00FEFDFC00FEFCFC00FEFCFB00FFFFFF00B0978600FFFF
      FC00BFA99A00AEA39800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5D0EB009FC0E500A0C1E5009EC1
      E5009DC0E5009CC0E600A6C6E700E4EAEF00FDFBF900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E4D1D600DFC7CD00DFC9CE00E3D2D600EEEFEE00EDEBEC00EDEBEC00EDEB
      EC00EDEBEC00EDEBEC00EDEBEC00EDEBEC00EDEBEC00EDEBEC00EDEBEC00EDEB
      EC00EDEBEC00EDEBEC00EEEEEE00E6DBDE00DCC3CA00DDC5CB00DBC1C700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B374
      8400C1879000B7717E00BA858F00F7FEFC00F2F2F100F2F2F100F2F2F100F2F2
      F100F2F2F100F2F2F100F2F2F100F2F2F100F2F2F200F2F3F200F2F3F200F2F3
      F200F5F9F700D8C1C600AB576B00C6798600A7556500DFD8D900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F2F1EF00C6B4A700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B59D8D00D5BE
      B100BCB2A900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CCA4
      AD00C18F9B00C3929D00C6A0AA00CBCECD00CAC9C900CAC9C900CAC9C900CAC9
      C900CAC9C900CAC9C900CAC9C900CAC9C900CAC9C900CAC9C900CAC9C900CAC9
      C900CBCBCB00C8B6BB00BD879400BD8A9700BA829000F0EBEC00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F3F1F000B59E8F00D0C3B900CEBEB400CDBFB400CDBDB300CCBD
      B200CBBBB100CCBBAF00CABAAF00CAB9AE00C9B7AC00CBBCAF00AA8E7C00D6CB
      C500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F9F9F900EAE5E100E9E4E000E9E3E000E9E3DF00E9E3DF00E8E3
      DF00E8E2DF00E8E2DE00E7E2DE00E8E2DE00E7E1DD00E7E1DD00E8E3DF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EDEBE900D7D4D100C9C5
      C100C6C3BF00C7C3BF00C7C3BF00C7C3BF00C7C3BF00C7C3BF00C7C3BF00C7C3
      BF00C7C4C000D5D3D100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6F6F700E8E8
      E800E0E0E000E1E1E100E1E1E100E1E1E100E1E1E100E1E1E100E1E1E100E1E1
      E100E1E1E200E1E1E200E1E1E200E1E1E200E1E2E200E1E1E200E1E2E200E1E2
      E200E1E2E200E5E6E600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E0DDDB00CEC2BF00C8B8B500C5B6B200CEC5
      C200D4CECC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BFAD9D00BDAFA200AD9E
      9200A3958600A4968700A4968700A4968700A4958700A4958600A3958600A495
      87008C7A6700A1948800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B9A39500AB9A
      8A00917D6C00836D580084705B0084705B0083705B0083705A0083705B008470
      5B00836F5A00836F5A00836F5A00836F5900836F5900836F5900836F5900836F
      5A007A654D009E918400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EEECEA00C6AD9F00B17B69009E483100933416006F2612009C59
      4500A66D5500BBAEA800A3ADA0009AAC9C0099A99A00A2B0A3009FABA000DADC
      DA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDAC9C00FFFFFF00E3DD
      D800D2C5BE00D3C8C000D5CCC500D7CDC700D5CAC500D5CDC800D4CCC600E6DC
      D600DDD6CF009F928700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B8A49400FFFB
      F900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FFFFFD00FFFD
      F900FBF5F200FAF3F200F9F3F100F9F3F000F9F2EF00F8F2ED00F9F1EE00FCF5
      F300D0C4BC00998F8200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E4E5E500D9D8D900DAD9D900DAD9D900DAD9D900DAD9D900DAD9D900DAD9
      D900DAD9D900DAD9D900DAD9D900DAD9D900DAD9D900DAD9D900DAD9D900DAD9
      D900DAD9DA00DBDADA00E3E2E100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00D0B1A500AE583600C7634400CE694300CF6C4000864C3800A95E
      4100A5563000884C300045612D0023872B001D6020003076330022732800839C
      8400C6CBC600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BEAC9D00FFFFFF00B1A0
      9200DAC5B100D3BAAA00BF8E7800AF816200C6987900C5835C00B6674300A796
      8700DCD4CE009F928700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B8A49400F7F3
      F000FDF8F600FBF7F400FBF6F300FBF6F300FDF7F500FCF8F700F5EFEC00F0E8
      E200D8CAC100CFBCB100C8B5AA00C6B3A700C7B4A700C6B3A600C7B3A600C8B6
      A900B39E90009D8A7A00CCBFB600C6B8AF00C4B7AD00C3B5AC00C1B3AA00CCC2
      BC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0094B6
      D4004C7DA700588DB5004E83B1004F84B0004A80AB004B86B400488FBA004A90
      B9004887BA004B8CB6004889B800498AB5004988B2004988B4004889B9004B8B
      BA004594C2005492BC00A6B5C300DEDDDE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B97A5900E48C7200DC826600D2725300DD7C5300A3524100C27E
      6200AC6B4B00A85E3E008057340053AB4B003A8F4000499F4C003EA346003082
      360076927800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDAA9D00FFFFFF00B49F
      9100DFB49100FFFFFF00E2B99E00BA774500FBE6D800D47F3F00F6CDA100A794
      8700DBD5D0009E928500EBECED00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B8A49500F8F4
      F000FDF8F600FBF7F400FDF9F700FBF7F500DFD5CB00C6AE9500B2917800BC9E
      8700B0917700BAA79200DBC9BA00DFCCBC00DCC8B800DCC8B800DCC8B800DCC8
      B800DECBBB00E0CCBD00DCC8B700DBC6B600DAC4B300D9C3B100D4BDAB00AE94
      8100C9BFB800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0081A1
      C7006C9FC600A6F1FF005FCAF5005ECAF6005FCBF60060C9F60060C9F50060C9
      F50060CAF60060CAF5005FC9F60060C9F60060C9F60060CAF6005FC9F50060C9
      F4005FC9F60059C2EF005598C000B0B7C300E9E8E600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00EDECEA00A4664B00F6AC9C00EC988200DE866C00C3705500993F2E00C87D
      5E00C8876D00B76E50009F4835006E9E52004DAB4B0066BA680055AA5C0047A4
      50003B8840009EB19C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EBECEC00FFFFFF00FFFFFF00FFFFFF00BDAA9D00FFFFFF00B8A6
      9A00F5D5A700C58E6D00DCAE8A00FEE9BD00D38E5000F4D4A400FCE8BD00A590
      8300DCD6D000A4988B00FFFFFF00FFFFFF00FFFFFF00EBEDED00EAEBEB00E8E8
      E800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B9A49500F8F3
      EF00FCF8F600FDF8F800F5EEEA00D1AD8F00A66D3600915117008A470D008A4A
      1500844B1F00A1784D00C6B39E00F5EEE500FFFDF500FFF9F000FFFFF900FFFF
      F900FFFFFA00FFFFFA00FFFFFA00FFFFF900FFFFF600FFF9EC00FFF8EB00DDC8
      B700B39F9300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008AA5
      CA0078B8D80097D1EE0089D8FA005DC4F00062C6F00062C5F10062C6F10062C7
      F10062C6F10062C6F00062C5F10062C5F10062C5F10062C7F10062C5F00063C5
      F10062C5F00063C9F40051AAD7007497B600D0D3D500ECEBEB00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00EBEDEE00E4E6E800E7E9EB00E7E9EB00E7E9EB00E7E9EB00E7E9EB00E7EA
      EC00E8EBED00CFB7AB00D18B7700FBAC9A00D9866C00B6877F00BD8E8700A452
      3900DA916C00B66444009E584500699657003B9A370055B6580079CC7C005CB4
      6100329237007AA07900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C3C4
      C2007C79780062585800635858004D464700343634009F8C7E00FFFFFF00B7A7
      9900FFF3C600FFEFC400FEEEC400FFEFC100FDEDC500FFF0C300FAE8BC00A690
      8400E4DFD800594C3F003A3A3A00554F4F006357570062575700655C5C00A9A9
      AA00EBEBEB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B9A49500F8F3
      F000FFFBF900F9F2EC00D6AE8700BA661B00B85C0200B7540000AF480000A543
      0000933F0000803E09007B451C00AB957800F5EFE500FFFFF900B6A69800AF9E
      9100AE9D8F00AD9D8E00AC9B8D00AC9A8D00A6958700FFF4E800FFF7EB00EBD8
      C800B6A29600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0088A2
      CA0092D4EC0078A9CB00A8EBFF006FCCF30064C7F30065C8F20065C8F20065C8
      F20065C8F20065C8F20065C8F30065C8F20065C8F20066C8F20065C8F20065C8
      F20066C8F10065C9F40065CAF4004D8EBD00A0B1C100DFE0E000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BBA6
      9700A89787008E7867007B6651007D6853007D6853007D6853007D6854007B66
      500078634D007E694F00A4795900DDA08F00B87B6F00D7CFCC00FFFFFF00B788
      7800B15D4800B05E3D00838956008FB89000ADCBAA004C9E4B006FD1780047B0
      4D004D9B4F00B2BEB000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008787
      860098989700A5A6A5009FA09F005A5A5A00242526009D8A7C00FFFFFF00B8A7
      9800FFF5C500FFEEC200FFF0C100F8E7C6008CA6FF00DBD6D700FFEDBC00A58E
      8100ECE7E1005E50460029292B0065676600A1A2A100A5A7A6008A878600837A
      7A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BBA49600F7F3
      F100FEFBFA00E6CDB600C26D2600C7650000D8680000EBB48000FFFFFF00FFFF
      FF00E9CAAB00A4480000873F0400824C2300CBBBAA00FFFFFB00AC998C00FFF8
      F800FAF0EF00FAF0EF00FAF2F000FFFAF900A9968B00FDF4E900FFF8EE00E9D9
      C900B8A49700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0087A2
      C900A6E9FD006CB0D20090C9E80094DEFD0066C9F40069CAF30068CAF3006ACA
      F3006ACAF30068CAF30069CAF50069CAF30068CAF4006ACAF40068CAF3006ACA
      F30069CAF30068CAF4006BCDF7005EBBE6005987B100CCD1D400EAE9E800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B9A4
      9500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00ECDED800A37970009D93940085818200D6D3D400CBBE
      BA00924B370097785B0081BC8400ADC0AE00FFFFFF00A5CCA6004EA74C003AA0
      3B0073997200EFEAEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008D8D
      8D009B979700989595009B9898006B6B6B003C3C3D0083776E00C3C3C4009688
      7E00C9BC9A00C4B79800CBBC94007983BB00A0BCC6005773D500C6B893008977
      6E00AFADAA005C534D003F3F40007A7677009A9696009A9797008E8A8A00867E
      7E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BBA59600F7F4
      F200FCF9F800CE9D7000D4731B00E5750300E5770A00DB650000EEBC8A00FFFF
      FF00C24D0000BC5D0500A34E050090460A0094744F00FDF8F000AC998D00F2E8
      E600ECE1DE00ECE1DE00ECE2DF00F2E9E600A5938700FDF4E900FFF8ED00E9D9
      C900B8A49700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0088A3
      CC00A1EDFF006DC1E1007FB0CF00A6ECFF007FD4F8006ACBF5006CCCF5006DCC
      F5006DCCF5006DCCF5006DCCF4006CCCF5006DCCF5006DCCF5006DCCF5006DCC
      F5006DCCF5006DCCF5006DCCF6006FD2FB004F92BD008DA6B700E3E2DF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B8A3
      9400FDFBFA00FEFBFB00FCFBF900FDF9F800FBF9F600FCF8F700FCF7F500FBF7
      F500FBF7F300FDF8F600DDDAD800888D8E00A2A3A400AEAEAE00919191007A7C
      7D007B84830086A289008D988A008D8E8D00B6B8B500BEC2BE004D8D50006B95
      5C009B8A8300EEEEF000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008686
      8600A49E9E00A9A5A500ACA7A700928F8F008786860088898900818080008485
      860080808400808084008080840086858100868280007F7C73007F868E00838A
      910080868B008D9093007F7E7E009D999900A5A0A000A49F9F008E878700867E
      7E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BBA69800F8F5
      F200FBF7F600D07A3400E87E0D00ED811400EC770300E4680000F7D8B700FFFC
      F900D65D0000C8640400B259050099480200884F2300F9F0E700C7B8AE00BEAF
      A300BEAEA200BDADA100BBACA000BBAC9F00B6A79900FFF5EB00FFF8ED00E9D9
      C900B8A49700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0087A6
      CD00AEEFFF0087DEF8006CB2D2008DBFDD0099E2FF0073CFF70070CEF60071CF
      F80071CFF80071CFF80071CFF70071CFF60071CFF80071CFF60071CFF70071CF
      F70071CFF70071CDF70071CFF70071CFF70070D6FD003F73A800D0D3D400E8E8
      E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B9A4
      9500FDFAFA00FEFCFB00FCFAFA00FDFAF900FCFAF700FCF9F600FBF8F600FBF8
      F500FDF8F500FAF5F300BEBDBB00A2A2A300E3E3E300DDDDDD00C6C6C600A9A9
      A900767676008E8C8F00A4A2A400B9B8B9009E9E9E00868586007D777E00C1B6
      B40091817200EDEEF000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008686
      8500CFCFCF00CDCECE00D1D1D100A5A5A5009C9C9C00ADADAD00ABABAB00ABAB
      AB00ABABAB00ABABAB00ABABAB00ABABAB00ADADAD0091989C00F1B37E00ECB1
      8000EEB17D00D6B59B00898B8E00B3B4B400C3C3C300C1C2C200ADABAB00837A
      7A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BBA69900F9F6
      F400FBF6F500CE7B3600EE953600EE943500EB811500EF9B4500FEFAF800FFFF
      FF00DC600000D26A0400C05E0400A24F050083451300F1E6DB00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFC00FFF6EC00FFF7EC00E9D9
      C900B8A49700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0089A8
      CF00B7EFFF0095E9FF0071C1E0007EB8D700A5E6FF008AD9FC0072D0F70074D1
      F80074D1F70074D0F90074D1F90074D1F70074D1F90074D0F80074D1F80074D1
      F80074D0F90074D1F70074D1F90074D1F90077D5FC0062B6DE006885AB00E7E3
      DF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B9A5
      9600FDFAFB00FEFDFC00FDFBFA00FEFBF900FCFAF800FFFCFC00FFFFFF00FFFF
      FD00FFFFFF00FBF8F8009C9D9D0095959500FCFCFC00F9F9F900DADADA00C4C4
      C4008787870094949400E5E5E500E4E4E400C9C9C900B7B7B700727474008F8B
      880095857500EDEEF000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008787
      8500D1D1D100C4C5C500C9C9C9009F9F9F0095959500A5A5A500A3A3A300A3A3
      A300A3A3A300A3A3A300A3A3A300A3A3A300A4A4A400979A9C00BA9D8500B69C
      8700B69C8600AD9E93007F7F8000ADADAD00BBBBBB00BABABA00ACAAAA00827A
      7A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BBA79800F9F6
      F400FBF7F500D2894E00E9A25500F1A65A00EC933900F1AF6E00F1AD6700F0A9
      6100E06B0000D96E0400CE680300AF540200905A2700F8F0E600D2C6BC00CBBE
      B300CBBDB200CABEB100C9BCB100C9BBB000C6B8AB00FFF5EB00FFF7ED00E9D9
      C900B8A49700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0089AA
      D200B9F0FE0095E9FF007EDAF5006DB8DB0087C8E9009EE2FF007CD4FA0076D1
      FA0078D2F90077D2FA0077D2FA0077D2F90078D2F90077D2FA0077D2F90077D2
      F90077D2FA0078D2F90077D2F90077D1FA0077D2F9007BDCFF005087BA00B1BC
      C600E7E6E400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B9A6
      9700FDFBFB00FEFDFC00FEFCFA00FDFAF900FFFDFD00E0CFC500CFB6A700CCB3
      A400C7AC9C00C4A797008C7D750072747500C1C1C100E5E5E500EAEAEA00EEEE
      EE008D8D8D0098989800F4F4F400FFFFFF00E2E2E200CFCFCF00969697007975
      720097877700EDEEF000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008887
      8700FDFDFD00F2F3F300F6F6F600C1C0C000BABABA00CFCFCF00CDCDCD00CDCD
      CD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00C9CCCE00C9CC
      CF00C9CCCF00CED0D100A4A4A400D2D2D200EEEEEE00F0F0F000D4D2D2007F76
      7600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BBA89900F8F5
      F300FDFBF900DBAA7E00DC974F00F4BE8800EFA56000EB8E3100F6CA9E00F5C6
      9700E26B0000DF710600D26B0400B2550000B1855400FFFAF300AA978B00E3D7
      D300DED2CC00DED2CC00DED2CD00E3D8D300A18E8200FDF4E900FFF8ED00E9D9
      C900B7A49700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008AAC
      D400B8F0FE009AEAFF0088E2FA0076CAEA0071BCE4009DDBF9008EDDFD0073D1
      F90074D1F90074D1F90074D1F90074D1F90074D1F90074D1F90074D1F90074D1
      F90074D1F90074D1F90074D1F90074D1F90074D1F90076D3FB006FCAF1005D80
      AC00D2D6D700ECEBEB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BAA6
      9800FEFBFC00FEFEFD00FEFBFC00FDFCFB00FEFBF900FDFCFA00FDFCFA00FDFB
      FA00FDFCF900FFFDFB00D4D2D1008B8C8D0079797900535353008C8C8C00AFAF
      AF007878780080808000AEAEAE00DADADA00E9E9E900FCFCFC00979898007776
      720097877700EDEEF000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008989
      8900FDFDFD00BBBBBB00CFCFCF00B9B7B600AEADAD00C8C8C800C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600CBCBCB008F8F8F00D3D3D300C2C2C20096969600D2D2D2007F76
      7600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BAA89A00F8F5
      F400FEFDFD00E9CCB400D3854200ECB67E00F5CBA000EC9D4D00FFFFFF00FFFF
      FF00E56E0000E4760600CB650000A85C1100D4B89900FFFFFE00AD9A8D00FFFF
      FF00FFF8F800FFF8F800FFFAF900FFFFFF00AB998D00FDF5EC00FFF9F000EAD9
      CB00B9A69900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008BAD
      D600B7EFFE009EEBFF008EE6FD0080D9F4006AC0E30086C4EB00A0E1FD009CE4
      FF009CE4FF009CE4FF009CE4FF009CE4FF009CE4FF009CE4FF009CE4FF009DE4
      FF009DE4FF009DE4FF009DE4FF009DE4FF009DE4FF009EE5FF00A1E9FF0062A1
      CB0087A8C100F0EDEA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BBA6
      9800FDFDFC00FEFDFD00FEFDFC00FEFBFA00FFFFFF00DBC7BC00C6AA9800C4A6
      9500BD9E8C00B9978300B89B8A00ADA8A3009D9E9E00909090006C6D6D004142
      420096969600999999007E7E7E004D4D4D006F707000999999007B7C7D00A09A
      970094847400EDEEF000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008D8B
      8B00FFFFFF00F2F2F200F8F8F800B7B5B600AEAEAD00C8C8C800C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600CBCBCB0090909000D1D0D000E2E2E200DBDBDB00CDCCCC007F76
      7600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDA89A00F9F6
      F300FEFEFE00FAF6F200DDB28F00D4884900EBAF7300F1B98200EEB07100F1A3
      5400ED7F1100E0730500BE670D00C69A6C00F8F1E900FFFFFF00AB978B00AA98
      8A00A9968900A8958800A6948600A695860098857600FEF7F000FFFBF200ECDC
      D000BCA99B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008CB1
      D800BAF0FF00A3EDFF009CEAFF0090E6FC0094E5FA008FD6F70090BFE80096BF
      E60097C0E70096BFE70096BFE70094BFE60093BEE80092C0E80092BEE80091BE
      E80091C0E9008DBDEA0089BBEC0082BAED007CB7EB0073B0E4006CAADC004E94
      D4006BA3D800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BAA8
      9900FEFDFC00FEFEFE00FDFDFB00FEFCFB00FEFBFA00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FAF7F400D2D0CE00B0AEAD00AFADAC008988
      8700F0EAE800CCC9C800A3A3A3009595950078797900414142009D9E9E00DBD1
      CB008F7F6F00ECEEF000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008F8E
      8E00FFFFFF00F4F3F300F9F9F900B9B8B800B1B1B100CDCDCD00CACACA00CACA
      CA00CACACA00CACACA00CACACA00CACACA00CACACA00CACACA00CACACA00CACA
      CA00CACACA00CFCFCF0093939300D4D4D400D0D0D000B0B0B000D3D2D2007F76
      7600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDA89C00FAF6
      F400FEFCFB00FEFEFD00FAF7F200E1B79500D3885200D98B4400E5974900E393
      4400D77D2800CA854800D1B08D00FCF9F500FFFFFF00FFFFFD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFDF800FFFEF800E9D9
      CD00C0AB9E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008CB3
      DB00BCF1FE00A6EDFF00A7ECFF00A6EDFF00A4EDFF009CEBFF0093E2FC008ADD
      FB0082DDFB007DDDFB0077DBFB0072DCFC006FD7F8006ED6F70068D3F50068D2
      F20065CEF20064CDF00059AFDB00A4BCD100E5E7EB00EBEFF500EBF0F500EBF0
      F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BBA7
      9900FEFEFD00FFFFFE00FDFCFB00FEFDFC00FEFCFB00FEFAFA00FEFBF900FDFA
      F700FBF8F800FCF9F700FCF8F600FDF8F600FFFAF700FFFCFB00FFFEFA00FFFE
      FB00FEF8F300FBF4EF00E3DFD800CCC6BC00C7C3BA00A6A09800EEE8E400ECE0
      D9008F806F00ECEEF000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00918F
      8F00FFFFFF00F8F7F700FEFEFE00BCBBBB00B4B4B300D1D2D200CFCFCF00CFCF
      CF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCFCF00CFCF
      CF00CFCFCF00D4D4D40096969600D6D6D600DFDFDF00CACACA00D8D6D6007E76
      7600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDAA9C00FAF6
      F500FFFCFC00FDFAFA00FFFCFE00FCFBF900EFE1D300E5C0A500DBAA8800D69E
      7600DDB39600E1D1C100F1EAE400F2E9E300F0E6DF00F0E6DF00F0E6DF00F0E6
      DF00F2E8E200F5EBE400F1E7E000F0E5DE00EFE3DB00EEE2D900EADCD100C4AA
      9800D5C8BF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008EB4
      DD00BDF1FE00A8EFFF00A7EEFF00A8EDFF00A6EBFF00A2EBFF009BE9FF0094E9
      FF008BE7FF008FE9FF0096ECFF0092E8FF008CE8FE0088E6FE0086E1FA0083DE
      FC0081DBF8007EDAFA005CAADC00ABBBD300FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BBA7
      9900FEFEFD00FFFFFE00FDFCFB00FEFDFC00FEFCFB00FEFAF900FEFBF800FDFA
      F700FBF8F800FBF9F600FCF8F500FCF6F500FAF5F200FBF4F300F9F5F200FBF3
      F100F9F4F000FFF8F000D1D3EA0099A4E0009DA6D9008F99CD00FFF9F100E8DB
      D5008E806F00ECEEF000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8A
      8A00FFFFFF00FFFFFF00FFFFFF00C1C1C000BCBDBC00DFDFDF00DCDCDC00DCDC
      DC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDC
      DC00DCDCDC00E2E2E2009D9C9C00DCDCDC00EDEDED00D7D8D800E4E2E2007B72
      7200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDAB9C00FAF7
      F500FFFDFD00FEFBFB00FDFBF900FDFBFA00FEFEFD00FFFFFF00FFFFFF00FEFF
      FF00F5EFEB00E7D6CB00DEC8BA00DCC6B700DCC6B800DCC6B800DCC6B700DEC8
      BA00CDB6A400B69C8900D8C4B700D9C5B700D8C4B600D5C1B300D3BEB000DDCF
      C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008DB5
      DE00BCF0FE00A7EFFF00A6EEFF00AAEFFF00AAEEFF00A6ECFF009FEBFF009BE9
      FF00A0E8FE009ED7F5008FBDE8008DB7E3008EB8E4008DB8E4008EB8E5008BB7
      E40087B2E30084B1E2008FC3EA00D6EAF200FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BBA7
      9900FEFEFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFDFB00FDF9
      F800FCF9F700FCF9F700FBF7F600FCF7F500FAF6F400FAF5F300FAF4F100FBF4
      F000FAF3EF00FFFBEF009BA7E5001A3CCF00203FC0000022A600FFFCF000E8DC
      D4008F807100ECEEEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C4C3
      C300BBBABA00BBBABA00BFBEBE00A3A3A3009E9E9D00A2A4A500999A9A009998
      9800989898009897970097969600969595009595950094959500949494009392
      930096979800A2A2A3008C8B8B009B9A9A00A3A2A300A1A1A1009A9A9A00B7B4
      B400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BEAA9C00FBF7
      F600FEFEFD00FDFDFB00FDFBFA00FDFBFA00FCFAF800FCFAF800FDFAF800FDF9
      F700FCFBF900FFFDFC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00DED8D1009A8F8200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A0C3
      E400A1D5F200B7F3FF00B1F2FF00B7F3FF00B7F3FF00B3F3FF00AAF1FF00A6EE
      FF0099D2F2009EBFE300EBECED00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F7EEE800D2C7C000C6BCB700BEB2AB00E3E4E400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BBA7
      9900FFFFFE00FAF8F800CEB5A700CFB7A900CBB1A200C2A49400F2ECE800FEFC
      FB00FDFBF700FDF8F800FCF8F600FCF9F600FBF6F400FBF7F400FAF5F100FBF4
      F100FAF4F000FFFCEF00A4AFEE002E51E6003654D9001839C300FFFCEE00EADE
      D60093867700ECEDEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00BEBEBD006D6E6F00A0908300EFEFEC00F0F0
      EF00F0EEEE00EFEEED00EFEDEC00EFEDEC00EFECEC00EFECEB00EDEBEA00F2EF
      EF00CBC4BD006D63560073747400C5C4C400E8E8E800EBEBEB00EBEBEB00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BEAB9D00FAF8
      F600FEFFFE00FEFCFC00FDFCFB00FEFBFA00FDFBFA00FDFAFA00FDFAF900FCF9
      F800FCF9F800FFFDFB00E7DDD700B5A194009C8C7E00998B7C009A8D7E009F92
      840095857300A2958800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAF0
      F50095BFE6009DD1EF00A3D4F100A3D4F100A3D4F100A1D3F1009CD3F20092CC
      EE00A2C5E600DFE6ED00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E1DCD9009F8A7C0077564200683D2400E4E6E600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BBA7
      9A00FEFEFE00FFFFFF00FDFDFD00FFFDFE00FEFEFD00F9F5F200FDF9F900FDFB
      FA00FCFBF800FDF9F900FDF8F700FDF9F700FCF6F400FAF5F300FAF6F300FBF4
      F200F9F5F200FFFCEF00A4AFEE003053F0003A59E9001D41DB00FFFBEE00EADD
      D60095877800ECEDEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00D3D2D2005B5D5F009E8A7D00FFFFFF00FFFF
      FF00FFFFFF00FFFFFE00FFFFFE00FFFFFD00FFFEFD00FFFEFC00FFFDFC00FFFF
      FF00DCD2C9005A4E41006F707100DBDBDA00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BEAC9E00FAF8
      F700FEFFFE00FEFCFD00FDFEFB00FDFCFB00FEFDFA00FEFBFB00FCFCF900FCFA
      F900FCFAFA00FFFFFE00D7C9BF00D0C4BB00DFD1C700D6BDA900D5B59F00BC9C
      860058453300E9E6E400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E1EBF600C7D9EE00C9DAEE00C8DAEE00C8DAEE00C7DAEE00C7DAEF00C4D9
      EE00E9EEF400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C2B6AF00ECEB
      EB00FFFFFF00FFFFFF00FFFFFF00B3A49B009784770072513C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BBA7
      9A00FDFFFF00FAF7F800C4A69500C6A99700BC9A8800E9DFD800FFFFFF00FEFC
      F900FEFAFA00FCFBF900FDFAF700FDF9F600FBF8F600FCF6F500FAF7F400FBF6
      F300FBF4F200FFFCF000A5AFF1003255F0003E5EF100284DEE00FFFAEF00EADE
      D60094867700EBEDEE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00838385009C897B00FFFEFD00FFFF
      FF00FFFCFE00FDFCFD00FFFDFB00FDFDFC00FDFCFA00FEFBFB00FEFCFB00FFFF
      FF00D9D0C9005A4E4100A6A7A800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BEAC9E00FAF8
      F700FEFFFF00FFFCFE00FDFCFC00FFFCFB00FDFDFC00FDFBFA00FDFCFA00FEFB
      FB00FCFCF900FFFFFF00D7CAC000DDD3CD00FFFCF600FFEADE00E8CCB7005D46
      2F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CFC5BF009A85
      7900D8D3D000D3CECB00B7AAA200937C6E00DBD6D3008C776700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BCA9
      9A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FE00FFFFFE00FFFDFE00FFFDFC00FFFEFB00FFFCFA00FFFAF900FFFAF800FFFA
      F800FDF9F700FEF8F600FFFFF500FFFFF400FFFFF300FFFFEF00FFF7F300EDE3
      DD00A3958800EBECEE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ACADAE00A5938600FEFEFD00FFFF
      FF00FFFEFD00FDFEFD00FFFEFD00FEFEFC00FEFDFC00FDFCFC00FEFDFC00FFFF
      FF00D6CFC7006F635700C5C5C700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BEAB9F00FBF9
      F800FFFFFF00FFFEFD00FDFEFC00FFFEFD00FEFEFB00FEFDFC00FDFBFC00FEFD
      FC00FCFBFB00FFFFFF00D7C9C000DBD2CC00FFFDF700EAD4C5005E473100FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C8BD
      B50081665400795C4A009E8A7E00DDD7D300FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BCA8
      9B00E5DED800E7E0DB00E6DFD900E6DED800E5DED700E5DDD700E4DBD600E5DB
      D500E4DBD400E3D9D200E3D8D200E3D7D100E2D7CF00E1D6CE00E2D5CE00E1D5
      CE00E1D5CD00E1D4CC00E0D4CB00E0D3CB00DFD3CA00DFD1C900E1D3CA00D7C7
      BD00B8A99C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C2AEA100FBFBF900FFFF
      FF00FFFFFE00FEFEFD00FEFEFE00FEFEFD00FEFDFD00FEFDFC00FEFCFC00FFFF
      FF00D2CAC200A3968B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BEAC9F00FBF9
      F800FFFFFF00FFFFFE00FEFEFE00FEFEFE00FEFEFD00FEFDFD00FEFDFC00FEFC
      FC00FEFDFC00FFFFFF00D7CBC100DED1C900EEDDD4008B786400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DDD3
      CD00D1C5BD00D2C5BD00D2C5BB00D1C5BB00D1C4BB00D1C4BA00D0C2BA00D0C2
      B800CFC2B800CFC1B700CEC0B600CEBFB600CDBFB500CEBFB500CEBFB500CEBF
      B500CEBFB500CEBFB500CEBFB600CEBFB600CEBFB600CEC0B600CEC0B600CEBF
      B500DDD3CD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BFAB9F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00D8D3CB00A5988D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BFAD9F00FFFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00DCD2CB00C8AFA000B6A49600E6E3E200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0AC9F00C5B5A900C7B7
      AC00C7B6AA00C6B5A900C6B4A900C5B3A700C5B2A600C3B2A400C3B0A400C4B0
      A400B59F8F00C3B4AA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BFAD9F00D2C6
      BD00D5C9C100D5C8C000D4C8BE00D5C7BE00D3C6BC00D3C5BC00D2C5BB00D2C3
      BA00D1C2B900D3C5BB00BEAB9C00BCA89B00E9E7E500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFECE900EFEC
      E900EFEBE900EFEBE900EFEBE900EEEBE900EFEBE800EEEBE800EEEAE800EEEA
      E800EFEBE800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAE4E100E2DB
      D500E2DAD500E2DAD500E1DAD400E2D9D400E1D9D300E1D9D300E0D8D200E0D8
      D200E0D7D200E0D7D100E0D8D100EEEBE800FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00424D3E000000000000003E000000
      2800000080000000800000000100010000000000000800000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFE00FFF0000000000000000
      FFFFFFFFFFC003FF0000000000000000FFC0FFFFFF0000FF0000000000000000
      FC000007FC00007F0000000000000000FC000007F800001F0000000000000000
      FC000007F000000F0000000000000000FC000007E000000F0000000000000000
      FC000007C00000070000000000000000FC000007C00000030000000000000000
      F8000007800000030000000000000000F8000007800000010000000000000000
      F8000007000000010000000000000000FC000007000000010000000000000000
      F8000007000000000000000000000000C0000007000000000000000000000000
      C0000007000000000000000000000000C0000003000000000000000000000000
      C0000003000000000000000000000000C0000003000000000000000000000000
      C0000003000000000000000000000000C0000003000000010000000000000000
      C0000003800000010000000000000000C0000007800000030000000000000000
      C0000007C00000030000000000000000C000000FC00000070000000000000000
      C000001FE00000070000000000000000C000003FF000000F0000000000000000
      C000007FF800001F0000000000000000FC0000FFFC00003F0000000000000000
      FC0001FFFF0000FF0000000000000000FFFFFFFFFF8003FF0000000000000000
      FFFFFFFFFFE007FF0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00007FFFFFFFFFFFFFFFFFFFFFFFFFF
      C00007FFC00003FFFFFFF07FFFFFFFFFC0000FFFC00003FFFFFFF03FFFFFFFFF
      C0000FFFC00001FFE000003FF000007FC0000FFFC00000FFC000003FF000007F
      C0000FFFC000007FC000003FF000007FC0000FFFC000003FC000003FF000007F
      C0000FFFC000001FC000003FF000007FC0000FFFC000000FC000003FF000007F
      C000047FC000000FC000001FF000007FC000003FC0000007C000001FF000007F
      C000001FC0000007C000001FF000007FC000001FC0000007C000003FF000007F
      C0000007C0000007C000003FF000007FC0000007C0000007C000001FF000007F
      C0000007C0000007C0000007F000007FC0000007C0000007C0000007F000007F
      C000000FC0000007C0000007F000006FC000001FC000000FC0000007F000004F
      C000001FC000000FF83C0007F000FE4FC000001FC000001FF81C0007F001FC0F
      C000001FC000003FF81C0007F803F81FC000003FC000007FF81C0007FFFFF83F
      C000003FC00000FFF8180007FFFFF87FC000003FC00007FFF8000007FFFFFE7F
      FFFE007FC0003FFFFC000007FFFFFFFFFFFF1FFFC0007FFFFC003FFFFFFFFFFF
      FFFFBFFFC000FFFFFF007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFF800000FFFFFFF83F800003FFE00003FF000000FFFFFFF03F800003F
      FE00001FF000000FFFFFFC03F800003FFE00003FF000000FF0000003F800003F
      FC00001FF000000FF0000007F800003FFE00003FF000000FE000000FF800003F
      FE0000FFF000000FE000001FF800003FFFFC3FFFF000000FE000003FF800003F
      FF0000FFF000000FE000003FF800003FF000007FF000000FE000003FF800003F
      E000007FF000000FE000003FF800003FE000003FF000000FE000003FF800003F
      C000003FF000000FE000003FF800003FC000001FF000000FE000003FF800003F
      E000001FF000000FE000003FF800003FC000000FF000000FE000003FF800003F
      E0000007F000000FE000003FF800003FC0000007F000000FE000003FF800003F
      C0000007F000000FE000003FF800003FE0000007F000000FE000003FF800003F
      C0000007F000000FE000003FF800007FC000007FF000000FE000003FF80000FF
      E0003FFFF000000FE000003FF80001FFFE007FFFF000000FE000003FF80003FF
      FF007FFFF000001FE000003FF80007FFFFFFFFFFFFFFFFFFE000003FF8000FFF
      FFFFFFFFFFFFFFFFFFFFFFFFF8001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF8003FFC00003FFFFFFFFFFFFFE07FFFF8003FFC00003FF
      FFFFFFFFFFF8000FFF8003FFC00003FFF00001FFFFF80007FF8003FFC000000F
      E00000FFFFF80007FF8001FFC0000007E000007FFFF00003FB80038FC0000007
      E000003FF0000003E0000007C0000007E000003FE0000003E000000FC0000007
      E000001FE0000003E000000FC0000007E000001FE0000003E000000FC0000007
      E000000FE0000003E000000FC0000007E000000FE0000003E000000FC0000007
      E0000007E0000003E000000FC0000007E0000003E0000003E000000FC0000007
      E0000003E0000003E000000FC0000007E0000007E0000003E000000FC0000007
      E000000FE0000003E000000FC0000007E00000FFE0000003E000000FC000000F
      E00000FFE0000003E000000FC00003FFE001FC1FE0000003FE00001FC00003FF
      E003FC1FE0000003FE0000FFC00003FFF007CE3FE0000003FF0001FFC0000FFF
      FFFFC03FE0000003FF0001FFC0001FFFFFFFE0FFE0000007FF8003FFC0003FFF
      FFFFFFFFE0000007FF8003FFC0003FFFFFFFFFFFFFFFFFFFFF8003FFC0007FFF
      FFFFFFFFFFFFFFFFFFC007FFC000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object ImageList1: TImageList
    Left = 664
    Top = 56
    Bitmap = {
      494C010114009400040510001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000006000000001002000000000000060
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AD4A0000C65A0000BD735200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B552
      1000CE630000C65A0000B55A3100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B55A2100CE63
      0000C6630000B55A310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A87D68008551
      3A00766049000000000000000000000000000000000060382000704020007040
      200067422B0000000000000000000000000000000000C6846300C6630000CE63
      0000B55A21000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DCDDDD009460
      3A00000000000000000000000000000000000000000000000000703820007642
      2B000000000000000000000000000000000000000000B54A0000CE630000AD4A
      00000000000000000000C6846300BD5A0000BD5A0000BD5A0000BD5A0000BD5A
      0000BD5A0000BD5A0000AD4A0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58A
      7400A47B5D00000000000000000000000000000000008048300070402000936E
      5E0000000000000000000000000000000000C6846300C6630000C66300000000
      00000000000000000000BD6B4200C6630000CE630000CE630000CE630000CE63
      0000CE6B0000D6730000B5520000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DBD6
      D400A05840009F6C5200926552009F6C520094583A0080483000703820000000
      000000000000000000000000000000000000B5521000CE630000AD4A00000000
      0000000000000000000000000000CE9C8400CE9C8400CE9C8400A5421000CE63
      0000D6730000DE7B0000BD5A0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000938378003A342F000D0C0B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AC795F0000000000000000000000000095603B0090503000986F5E000000
      000000000000000000000000000000000000B54A0000CE630000C67342000000
      00000000000000000000000000000000000000000000C6846300CE630000DE73
      0000CE630000E7840000C6630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009181
      7500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CBB9AB00AC795F0000000000D4C5BC009058300090503000D0C3BC000000
      000000000000000000000000000000000000B54A0000CE630000C67342000000
      000000000000000000000000000000000000BD7B5200CE6B0000DE7B0000B552
      0000B5521000F7940000CE630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003A34
      2F00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A4684A00E3E2E200A0735200905030009A624600000000000000
      000000000000000000000000000000000000B5521000CE630000B54A00000000
      0000000000000000000000000000BD633100CE6B0000E7840000B55200000000
      0000CE844200FF9C0800CE6B0800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000E0D
      0B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C5998000BB948000A060400090503000CDBBB200000000000000
      000000000000000000000000000000000000C6846300C6630000C6630000B552
      1000C68C7300C67B5200BD520000E77B0000E7840000C6631000000000000000
      0000CE844A00FFAD3100CE732100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003C36
      3200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E6E5E500B0705000B0705000A4684A0000000000000000000000
      00000000000000000000000000000000000000000000AD4A1000C6630000CE6B
      0000D6730000DE7B0000E7840000E77B0000B55A210000000000000000000000
      0000C67B5200FFBD6300CE7B3900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000988A
      7E0000000000000000000000000000000000887C71000000000000000000887C
      7100000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C0887000B0705000E3D5CC0000000000000000000000
      0000000000000000000000000000000000000000000000000000BD6B4200BD5A
      0000CE6B0000CE6B0000C6631000CE9C84000000000000000000000000000000
      000000000000C6845A00CE947B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000978A7E003C36320000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BF8F77000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BD735200C65A0000AD4A
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B55A3100C65A0000CE63
      0000B55210000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B55A3100C663
      0000CE630000B55A210000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B55A
      2100CE630000C6630000C6846300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AD4A0000BD5A0000BD5A
      0000BD5A0000BD5A0000BD5A0000BD5A0000BD5A0000C6846300000000000000
      0000AD4A0000CE630000B54A0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5520000D6730000CE6B
      0000CE630000CE630000CE630000CE630000C6630000BD6B4200000000000000
      0000CE9C8400C6630000C6630000C68463000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BD5A0000DE7B0000D673
      0000CE630000A5421000CE9C8400CE9C8400CE9C840000000000000000000000
      000000000000AD4A0000CE630000B55210000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6630000E7840000CE63
      0000DE730000CE630000C6846300000000000000000000000000000000000000
      000000000000C6734200CE630000B54A00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE630000F7940000B552
      1000B5520000DE7B0000CE6B0000BD7B52000000000000000000000000000000
      000000000000C6734200CE630000B54A00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE6B0800FF9C0800CE84
      420000000000B5520000E7840000CE6B0000BD63310000000000000000000000
      000000000000B54A0000CE630000B55210000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE732100FFAD3100CE84
      4A000000000000000000C6631000E7840000E77B0000BD520000C67B5200C68C
      7300B5521000C6630000C6630000C68463000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE7B3900FFBD6300C67B
      5200000000000000000000000000B55A2100E77B0000E7840000DE7B0000D673
      0000CE6B0000C6630000AD4A1000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE947B00C6845A000000
      000000000000000000000000000000000000CE9C8400C6631000CE6B0000CE6B
      0000BD5A0000BD6B420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AD5A5A00AD52
      5200A54A4A00AD949400C6CEC600CECEC600CECEC600C6CEC600C6CEC600B59C
      9C009C4242009C424200A5525200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B58C8C008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A008C5A5A0000000000000000000000000000000000299C
      DE00299CDE00A57B7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B
      7300A57B7300A57B7300A57B73000000000000000000BD7B7300CE636300CE6B
      6B00B55A5A009C848400BDA5A500E7CECE00FFF7F700FFFFF700F7F7F700CEB5
      B500942929009C313100C65A5A00AD5A5A000000000000000000000000000000
      0000AD390000A54200008C290000000000000000000000000000A5420000A542
      00008C2900000000000000000000000000000000000000000000000000000000
      000000000000B58C8C00FFF7E700F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EF
      DE00F7EFDE00F7E7CE008C5A5A00000000000000000000000000299CDE008CD6
      EF0084D6F700CEC6BD00FFEFDE00F7EFE700F7EFDE00F7EFDE00F7EFDE00F7EF
      DE00F7EFDE00F7EFDE00A57B73000000000000000000BD7B7300CE636300CE63
      6300B55A5A009C7B7B009C424200B5737300E7DEDE00FFF7F700FFFFFF00D6B5
      B500943131009C313100BD5A5A00AD5A5A00000000000000000000000000C65A
      0000A5420000A5420000A54200008C29000000000000A5420000AD390000A542
      0000AD3900008C29000000000000000000000000000000000000000000000000
      000000000000B58C8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DE
      C600EFDECE00EFDECE008C5A5A000000000000000000299CDE00A5E7FF0094EF
      FF008CF7FF00CEC6BD00F7E7D600F7E7D600F7DEC600F7DEC600F7DEC600F7DE
      BD00F7DEC600F7E7D600A57B73000000000000000000BD7B7300CE636300CE63
      6300B55A5A00AD8484009C3939009C393900CEBDBD00EFEFEF00FFFFFF00E7C6
      C6009429290094313100BD5A5A00AD5A5A00000000000000000000000000AD39
      00000000000000000000000000008C29000000000000AD390000000000000000
      0000000000008C29000000000000000000000000000000000000000000000000
      000000000000B58C8C00FFF7E700FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500EFDECE008C5A5A000000000000000000299CDE00A5E7FF0094EF
      FF0084EFFF00CEC6BD00F7E7DE00FFE7CE00F7DEBD00F7DEBD00F7DEBD00F7DE
      BD00F7DEC600F7E7D600A57B73000000000000000000BD7B7300CE636300CE63
      6300B55A5A00B58C8C009C4A4A0094313100A59C9C00D6D6D600FFFFFF00E7C6
      C6009429290094313100BD5A5A00AD5A5A00000000000000000000000000AD39
      00008C29000000000000000000008C29000000000000AD390000000000000000
      0000C65A00008C290000000000000000000000000000B58C8C008C5A5A008C5A
      5A008C5A5A00B58C8C00FFF7EF00F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      BD00F7E7CE00EFDECE009C6B63000000000000000000299CDE00ADEFFF00A5EF
      FF0094EFFF00CEC6BD00F7E7E700F7E7D600F7DEC600F7DEC600F7DEBD00F7DE
      BD00F7DEC600F7E7D600A57B73000000000000000000BD7B7300CE636300CE63
      6300BD5A5A00C6948C00C6949400B5848400AD8C8C00BDA5A500E7C6C600DEAD
      AD00A5393900A5393900C65A5A00AD5A5A00000000000000000000000000C65A
      0000AD390000A5420000AD390000AD39000000000000AD390000AD390000A542
      0000AD3900008C290000000000000000000000000000B58C8C00FFF7E700F7EF
      DE00F7EFDE00B58C8C00FFF7EF00F7E7CE00F7DEC600F7DEC600F7DEC600F7DE
      C600F7E7D600EFDECE009C6B6B000000000000000000299CDE00B5EFFF00ADEF
      FF00A5EFFF00CEC6BD00F7EFE700F7EFDE00FFE7CE00FFE7CE00FFE7CE00F7DE
      C600F7E7D600EFE7DE00A57B73000000000000000000BD7B7300CE636300CE63
      6300CE636300CE636300CE636300CE636300CE636300C65A5A00C65A5A00CE63
      6300CE636300CE636300CE6B6B00AD525A000000000000000000000000000000
      0000C65A0000A5420000A54200009C4A18008C634A00AD390000A5420000A542
      00008C29000000000000000000000000000000000000B58C8C00F7EFDE00F7DE
      CE00F7DEC600B58C8C00FFFFF700FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500EFE7D600A57B73000000000000000000299CDE00BDEFFF00BDF7
      FF00ADF7FF00CEC6BD00FFF7EF00FFE7CE00FFDEBD00F7DEBD00F7DEBD00FFDE
      B500F7DEC600F7EFE700A57B73000000000000000000BD7B7300B5525200B55A
      5A00C6848400D6A5A500D6ADAD00D6ADA500D6ADAD00D6A5A500D6A5A500D6AD
      A500D6ADAD00D69C9C00CE636300AD5252000000000000000000000000000000
      00000000000000000000000000008C736B004242420063524200000000000000
      00000000000000000000000000000000000000000000B58C8C00FFF7E700FFD6
      A500FFD6A500B58C8C00FFFFF700FFE7D600FFE7D600F7E7D600F7E7CE00FFE7
      D600FFF7E700EFDEDE00A57B73000000000000000000299CDE00C6EFFF00CEF7
      FF00BDF7FF00CEC6BD00FFF7F700FFF7EF00F7EFE700F7EFE700F7EFDE00F7EF
      DE00F7EFE700EFE7DE00A57B73000000000000000000BD7B7300AD524A00E7CE
      CE00F7F7F700F7F7EF00F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700DEBDBD00C65A5A00AD525A000000000000000000000000000000
      000000000000000000008C736B009C847B009C847B009C847B00635242000000
      00000000000000000000000000000000000000000000B58C8C00FFF7EF00F7DE
      C600F7DEC600B58C8C00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700EFDE
      DE00D6C6C600BDADAD00B58473000000000000000000299CDE00CEEFFF00DEF7
      FF00CEF7FF00CEC6BD00FFF7F700FFFFFF00FFFFFF00FFF7F700F7F7F700EFE7
      DE00D6BDB500C6ADA500A57B73000000000000000000BD7B7300B5524A00EFD6
      D600FFF7F700F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7F7F700DEBDBD00C65A5A00AD525A000000000000000000000000000000
      0000000000008C736B009C847B00B5A59C0000000000B5A59C009C847B006352
      42000000000000000000000000000000000000000000B58C8C00FFF7EF00F7E7
      CE00F7DEC600B58C8C00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700B58C
      8C00B58C8C00B58C8C00B58C8C000000000000000000299CDE00CEEFFF00E7FF
      FF00DEF7FF00CEC6BD00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00DECE
      C600E7AD7300C6AD8C00000000000000000000000000BD7B7300B5524A00EFD6
      D600EFEFEF00D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600EFEFEF00DEBDBD00C65A5A00AD525A000000000000000000000000000000
      00008C736B009C847B00B5A59C00000000000000000000000000B5A59C009C84
      7B006352420000000000000000000000000000000000B58C8C00FFFFF700FFD6
      A500FFD6A500B58C8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B58C
      8C00EFB56B00C68C7B00000000000000000000000000299CDE00D6F7FF00F7FF
      FF00E7FFFF00CEC6BD00FFEFE700FFF7EF00FFF7EF00FFEFEF00FFF7EF00E7C6
      BD00C6AD8C00299CDE00000000000000000000000000BD7B7300B5524A00EFD6
      D600EFEFEF00DED6D600DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DED6
      D600EFEFEF00DEBDBD00C65A5A00AD525A000000000000000000000000008C73
      6B009C847B00B5A59C000000000000000000000000000000000000000000B5A5
      9C009C847B0063524200000000000000000000000000B58C8C00FFFFF700FFE7
      D600FFE7D600B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C
      8C00BD84840000000000000000000000000000000000299CDE00DEF7FF00FFFF
      FF00F7FFFF00CEC6BD00CEC6BD00CEC6BD00CEC6BD00CEC6BD00CEC6BD00CEC6
      BD0084C6DE00299CDE00000000000000000000000000BD7B7300B5524A00EFD6
      D600F7F7EF00E7DEDE00E7DEDE00E7DEDE00E7DEDE00E7DEDE00E7DEDE00E7DE
      DE00EFEFEF00DEBDBD00C65A5A00AD525A000000000000000000000000009C84
      7B00B5A59C000000000000000000000000000000000000000000000000000000
      0000B5A59C009C847B00000000000000000000000000B58C8C00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFFFF700EFDEDE00D6C6C600BDADAD00B58473000000
      00000000000000000000000000000000000000000000299CDE00DEF7FF00F7F7
      F700ADC6CE00A5C6CE00A5C6CE00A5C6CE00A5C6CE00A5C6CE00B5D6D600DEFF
      FF0084D6F700299CDE00000000000000000000000000BD7B7300B5524A00EFD6
      D600EFEFEF00D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600EFEFEF00DEBDBD00C65A5A00AD525A00000000000000000000000000B5A5
      9C00000000000000000000000000000000000000000000000000000000000000
      000000000000B5A59C00000000000000000000000000B58C8C00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFFFF700B58C8C00B58C8C00B58C8C00B58C8C000000
      00000000000000000000000000000000000000000000299CDE00DEF7FF00DECE
      C600BDA59C00A57B7300A57B7300A57B7300A57B7300A57B7300BD9C9400E7EF
      E70094DEF700299CDE00000000000000000000000000BD7B7300B5524A00E7D6
      CE00FFF7F700F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00FFF7F700DEBDBD00C65A5A00AD525A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B58C8C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B58C8C00EFB56B00C68C7B00000000000000
      0000000000000000000000000000000000000000000000000000299CDE00B5D6
      E700949C9C00E7DED600F7E7D600F7E7D600F7E7D600CEC6BD00849CA5008CCE
      E700299CDE000000000000000000000000000000000000000000AD524A00CEB5
      B500D6D6D600CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00D6D6D600CEADAD00A54A4A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B58C8C00B58C8C00B58C
      8C00B58C8C00B58C8C00B58C8C00B58C8C00BD84840000000000000000000000
      000000000000000000000000000000000000000000000000000000000000299C
      DE00299CDE009C948C009C948C009C948C009C948C009C948C00299CDE00299C
      DE00000000000000000000000000000000000000000000000000000000001277
      A90004609700000000000000000000000000000000000000000000000000036C
      A300086FA500000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000EBE8E400B7B7B700B0B0B000B8B2
      AB00B8B7B300B4B6B000B6B1B000ACB8BA00AFB3B400B2B1AD00BAB7B200B9B8
      B400B5B2AE00B2B2B200CBC9C800FEFBF7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000C689A0056CA
      E90034B0D700025D9300000000000000000000000000000000001080B20081E0
      F3000D8BBD000C689A000000000000000000C0C0C000C0C0C000C0C0C0000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000B5B3B200EEEBE700E9EFF600E4E7
      EB00ECEEEE00E9EEEF00EEECEC00ECEDE900EFEDEC00E9EBEC00E7E9EA00EDEE
      EC00E3E7EC00EAECED00E3DDD600CCCECF000000000029ADD60031B5DE0021AD
      D600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002892
      BF005DF0FF0038B6DC0004659A0000000000000000001F8BBA00A1EEFB0041D4
      F7002892BF00000000000000000000000000C0C0C000C0C0C000000000000000
      0000C0C0C000C0C0C00000000000000000000000000000000000000000000000
      000000000000C0C0C000C0C0C000C0C0C000B9B7B600D8D4CF00D5DCE500F2EC
      E500E9ECF000F1F2F600EBEDEE00EBE9E900E5E5E500E7E9EA00E7EAEE00E7EA
      EF00E8EAEB00C1C4C800FFFBF200B0B6BD000000000029ADD6009CDEEF0084EF
      FF004AC6E70021ADD60018A5C60018A5C60018A5C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000A67
      9A0048D3F60050E9FF0048C2E300076B9F002392BF00B5F2FB0050EAFF0048D3
      F600005A9100000000000000000000000000C0C0C0000000000000000000FFFF
      FF00FFFFFF00C0C0C00000000000000000000000000000000000000000000000
      00000000000000000000C0C0C000C0C0C000B2B0AF00E8E8E800E4E4E400B08C
      5E00A96B1F00A36A2C00EEDEC700E2E4EF00E7E3E200AE875A00A86D2500A365
      1900E4D2BB00E0E6ED00FFF9F200B0B6BD000000000029ADD60052BDE7009CFF
      FF0094FFFF0073DEF70073DEF70073DEF70073DEF7004AC6E70021ADD60018A5
      C600000000000000000000000000000000000000000000000000000000000000
      00000A679A0035DDFF0055E3FF0058D7F300A5EEFC0081EEFF0043DEFC000A67
      9A0000000000000000000000000000000000000000000000000080808000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C0C0C000ADB6BA00DCE6D900DDE3EA00AD74
      1700C86D1200CA6B0E00EBE5DA00DFE3E800D1E4EB00B3723B00CC700B00CC63
      1200DFD0A900DFE6E900EEF8F200AFB9AD000000000029ADD60052BDE700ADFF
      FF008CF7FF008CEFFF008CEFFF008CEFFF0073DEF70073DEF70073DEF7004AC6
      EF0021ADD6000000000000000000000000000000000000000000000000000000
      0000000000000A679A0030D4FF0057E1FF0075E7FF0084F3FF000A679A000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF000000FF000000FF00000000000000FF00000000000000
      0000000000000000000000000000C0C0C000ADAEB200F2E2DC00D2DDF300C471
      1B00B7760A00BE690600EBE0CC00D9D9D900D3DFDF00B5783A00BA720300BD74
      0C00DAC7B200E2DBE800FFF8F500B6B2B1000000000029ADD60029ADD600ADDE
      EF0094F7FF0094F7FF008CEFFF008CEFFF008CEFFF008CEFFF0073DEF70073DE
      F7004AC6EF000000000000000000000000000000000000000000000000000462
      97000A679A000FC6FB0018CBFF0035D5FF0055DDFF007FEDFF0063CEE7000A67
      9A000A679A000000000000000000000000000000000000000000000000000000
      FF00FFFFFF00FFFFFF000000FF000000FF000000FF00000000000000FF000000
      FF00000000000000000000000000C0C0C000A1AFAD00DDD8D700D9E6E800B86A
      1000CA701700CC6B1400D7BB9800DCCDB300D3CBB400C27A3A00C96E1300CE68
      0F00D6C3A000DCDFE400F2F8F300ADB9B9000000000029ADD60073DEF70029AD
      D6009CFFFF008CF7FF008CF7FF008CF7FF008CEFFF008CEFFF008CEFFF0073DE
      F70073DEF70018A5C600000000000000000000000000005A91001A79A90056C4
      E50047E0FF001CCCFF000AC6FE001CCCFE003AD7FF0059E0FF0083EEFF0075E5
      F7002EA5CC002EA5CC00005A91000000000000000000000000000000FF000000
      FF00FFFFFF00FFFFFF000000FF000000FF00000000000000FF00000000000000
      FF000000FF000000000000000000C0C0C000B4B0AF00D8DDE000B2834D00B667
      0000B96D1300D2770A00BF721200D86D0C00C46A1100CD750900BE6F0E00C46B
      1000B97A2000CDBCAF00F2F3F100AEB3B1000000000029ADD60094F7FF0029AD
      D600ADDEEF00A5EFF700A5EFF700A5F7FF008CEFFF008CEFFF008CEFFF0073DE
      F7000073080018A5C6000000000000000000106EA0006BB8D300D3FFFF00BFFF
      FF0080F2FF0050E5FF001CCEFF000AC5FE001DCCFE003EDDFF0064EDFF008FF8
      FF0089FEFF004CD3ED006BB8D300005A910080808000000000000000FF000000
      FF00FFFFFF00FFFFFF000000FF000000FF000000FF00000000000000FF000000
      FF000000FF000000000080808000C0C0C000ACAEAF00D7D7D700A6835700D477
      0200B9690C00CE740F00C96E0B00B5661500C4741B00BF6A0200C6710E00CC71
      1600A45E0B00D2C7BF00EFEFF500B2B2B8000000000029ADD6009CFFFF0073DE
      F70029ADD60018A5C60018A5C60018A5C600ADDEEF008CF7FF0084EFFF000073
      08005AE78C000073080018A5C60000000000005A9100005A9100005A9100005A
      9100005A9100005A910055CEF00019CEFF000CC9FF0016A7DA00005A9100005A
      9100005A9100005A9100005A9100005A9100C0C0C000000000000000FF000000
      FF00FFFFFF00FFFFFF000000FF000000FF00000000000000FF00000000000000
      FF000000FF0000000000C0C0C000C0C0C000B2B0AF00CBC9C800E8DBCB00AD7F
      4500C66F0F00B86B1500C6710D00C6710D00C46F0900C4711500BC6D1600C56B
      0000D9B99600D8D3D400F6F1F200ADB0B5000000000029ADD6009CFFFF0094F7
      FF0073DEF70073DEF70073DEF7006BDEF70029ADD600ADDEEF000073080052D6
      7B0042D66B0031C64A0000730800000000000000000000000000000000000000
      00000000000000000000005A910049E2FF0014CBFF00036FA700000000000000
      000000000000000000000000000000000000C0C0C000000000000000FF000000
      FF00FFFFFF00FFFFFF000000FF000000FF000000FF00000000000000FF000000
      FF000000FF0000000000C0C0C000C0C0C000ABA9A800D2CFCB00BEC7D100D3D1
      D000B2793C00D3770800B36B1300C3730E00BD701400CE731000BA670400C5B3
      9400C8CBD300C9CCD400F2ECE500B3B7BC000000000029ADD6009CFFFF0094F7
      FF0094F7FF0094F7FF0094F7FF0073DEF70073DEF70029ADD60018A5C600108C
      210031C64A00109C210018A5C600000000000000000000000000000000000000
      00000000000000000000005A910073EDFF0031CCF700066BA000000000000000
      000000000000000000000000000000000000C0C0C000000000000000FF000000
      FF0000000000000000000000000000000000000000000000FF00000000000000
      FF000000FF0000000000C0C0C000C0C0C000B1AFAE00CAC6C100BEC4CB00C8C5
      C100CCCAC200B1772C00CD730E00B5651200C7721600B7680700CAAC8300BFC8
      D500C4C7CB00C1C4C800F8F1E800ADB3B8000000000029ADD600C6FFFF0094FF
      FF009CFFFF00D6FFFF00D6FFFF008CEFFF0094EFFF0073DEF70073DEF7000884
      100018AD29000884100000000000000000000000000000000000000000000000
      00000000000000000000005A910093EFFC0041BCE10003609700000000000000
      000000000000000000000000000000000000C0C0C000000000000000FF000000
      0000000000008080800000000000000000000000000000000000000000000000
      00000000FF0000000000C0C0C000C0C0C000ADADAD00C5C5C500C2C2C200C3C3
      C300C1C5BA00CCC6BF00AA6D2F00EA770000C0610000C2A58A00C3C9C400C8CA
      B700C4C4C400C9C9C900EBEBEB00B2B2B2000000000021ADD6009CDEEF00C6FF
      FF00C6FFFF009CDEEF0018ADD60018A5C60018A5C60018A5C60018A5C600088C
      100008A518000000000000000000000000000000000000000000000000000000
      00000000000000000000005A9100ADEEF80041A4CA00005A9100000000000000
      000000000000000000000000000000000000C0C0C00000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000000000000000C0C0C000C0C0C000ABABAB00C0C0C000C9C9C900C0C0
      C000B5BCC500BAC0CB00CDBEAE00B7906400C2A58600C8C6C600B2BBC800BDC1
      C600C2C2C200BABABA00EEEEEE00B2B2B200000000000000000031B5DE0029AD
      D60018A5C60018A5C60000000000000000000000000000000000088C100008A5
      1800088410000000000000000000000000000000000000000000000000000000
      00000000000000000000005A9100B8E3EF0046A0C500005A9100000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      000000000000C0C0C000C0C0C000C0C0C000A6A6A600C7C7C700C4C4C400BFBF
      BF00CAC2C200C0BEBE00BDC0C400B8C1C400BBC2C500BCBEBF00C9C3C400C7BD
      BD00BCBCBC00B3B3B300E2E2E200B6B6B6000000000000000000000000000000
      000000000000000000000000000000730800087B0800088C1000088C1000087B
      0800000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001875A5000B699D0000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C0C0C000C0C0C000C0C0C000C0C0C000BCBCBC00A4A4A400A5A5A500ACAC
      AC00A5A3A200A9A5A400A8A6A600AAA9AB00AEACAC00A7A3A200A9A5A400A9A7
      A600A2A2A200A7A7A700A8A8A800EEEEEE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000600000000100010000000000000300000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFF1FFFFFFFFFFFFFFE1FF
      FFFFFEDFFFFFC3FFC007FEDFC78787FFFFFFFEDFCFCF8C01F83FFEDFE78F1C01
      FFFFFEDFE01F1E01C007F0DFF71F1F81FFFFE0DFF21F1F01F01FE0DFF83F1E11
      FFFFE0DFF83F0031C007E0DFF87F8071FFFFE04FFC7FC0F9F83FF007FEFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF8FFFFFFFFFFFFFFF8C03C007C00710388FFFFFFFFFFFBAD7FFFFC03FF807
      0000FFFFFFFFFFFFD6378FFFC007C007C6D78C03FFFFFFFFEED68FFFC03FF807
      EC38FFFFFFFFFFFFFFFFFFFFC007C007FFFF8FFFFFFFFFFFFFFF8C03C03FF807
      FFFF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FFFFFFFFFFFFFFF87FFFFFFFFFFFF
      FFC3FFFFFFFFE00FFFE1FFFFFFFFFFFF8031F00F81FFF83F8030F8C7E3FFF39F
      8078F8C7F1FFF39F81F8F8C7F8FFF39F80F8F80FFC7FF39F8878F8C7FE3FF39F
      8C00F8C7FF1FF39F8E01F8C7FF8FF39F9F03F00FFF03E10FFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC001FFFFF801E0018000F1C7F801C001
      8000E083F80180018000EEBBF80180018000E6B3800180018000E08380018001
      8000F007800180018000FE3F800180018000FC1F800180018000F88F80018003
      8000F1C7800380038000E3E3800780038000E7F3801F80038000EFFB801F8003
      8000FFFF803FC007C001FFFF807FE00FE7E700000000FFFFC3C3000000008FFF
      E18700000000807FE00700000000800FF00F000000008007F81F000000008007
      E007000000008003800100000000800300000000000080010000000000008001
      FC3F000000008001FC3F000000008003FC3F000000008007FC3F00000000C3C7
      FC3F00000000FE0FFE7F00000000FFFF00000000000000000000000000000000
      000000000000}
  end
  object StartMenu: TAdvPreviewMenu
    Buttons = <>
    ButtonSpacing = 4
    ButtonHeight = 25
    MenuItems = <
      item
        CanSelect = False
        Caption = #54532#47196#44536#47016'    '
        Enabled = False
        ImageIndex = 3
        OfficeHint.Title = 'BM1_0'
        OfficeHint.Notes.Strings = (
          'Select the type of the new document to start here.')
        OfficeHint.Picture.Data = {
          424D360C00000000000036000000280000002000000020000000010018000000
          0000000C0000120B0000120B00000000000000000000FF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFF9F9F9E9E7E6DCDAD9D5D3D1D5D3D1D5D3D1D5D3D1D5D3D1D5D3D1
          D5D3D1D5D3D1D5D3D1D5D3D1D5D3D1D5D3D2D5D4D2D5D3D2D5D4D2D5D4D2D6D4
          D2E5E5E5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFF3F0EFA78D7BAE9F90988473907E6C917F6D917F6C917E6C917E6C
          907E6C907E6C917E6B907D6B917E6B907D6B907D6A907D6A907D6A93806D7059
          42D4D2CFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFF2EFEEBEA99BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFDFFFFFC
          FFFDFBFFFDFAFFFBF7FFFAF6FFFAF6FFFAF5FFF8F4FFF9F3FFF8F3FFFFFF9582
          70D3D2CFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFF2EFEEBCA798FFFFFFFBF6F3FBF6F2FAF4F2FBF4F0F9F4F0FAF2EE
          FAF2EDFAF2ECF9EFEBF7EFEAF7EEE9F7EFE9F7EEE7F6ECE7F8ECE6FFF7F3927F
          6DD3D2CFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFF2EFEEBCA899FFFFFFFBF6F3FBF6F3FAF4F1FBF4F0FAF3F0F9F2EF
          FAF2EEF9F1EDF9EFEBF8F0EBF7EFE9F8EEE9F7EEE8F6ECE7F8EDE7FFF8F39280
          6DD3D2CFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFF2EFEEBDA798FFFFFFFBF6F4FAF5F4FBF4F1FBF5F1FAF5F0F9F2EE
          FAF1EFF8F1EEF9EFEBF9F0EAF8EEEAF8EEE9F8EDE8F7EEE8F8EEE7FFF9F49280
          6DD3D2CFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFF2F0EEBDA899FFFFFFFCF7F4FAF6F4FBF5F2FBF4F2F9F3F0F9F2EF
          FAF3EEFAF2EFF8F0ECF7F1EBF9EFEAF9EEE9F7EEE9F7EFE8F7EDE8FFF9F59280
          6DD3D2CFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFF2F0EEBDA89BFFFFFFFCF8F4FCF6F3FAF6F2F9F4F1FBF5F2F9F4EF
          F9F3F0FAF2EDF8F0EEF9F1EDF9EFECF9F0EBF7EEEBF9EFEBF7EFEAFFFAF59280
          6DD3D2CFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFF2F0EEBDA99BFFFFFFFCF7F5FCF7F4FAF7F3FBF6F2FBF4F2F9F4F1
          FAF4F0F9F4EFFAF1EEF8F1EDF8F1ECF9F0ECF8F0ECF8F0EBF8F0EAFFFAF7927F
          6ED3D2CFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFF2F0EEBEAA9CFFFFFFFBF8F6FCF8F5FBF6F4FAF5F3FBF5F2FAF5F1
          FBF4F1FAF4F0FAF2EEF8F1EEF9F2ECFAF1EDF8F1EDF9F0ECF9EFECFFFCF89280
          6ED3D2CFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFF2F0EFBFAA9DFFFFFFFCF9F7FBF7F6FCF7F5FBF6F3FBF6F2FBF5F2
          FBF5F1FBF4F1F9F2EFF9F2EFF9F1EDFAF1EEF8F2EDF8F1ECF9F0EDFFFDF99281
          6DD3D2CFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFF2F0EFBFAB9DFFFFFFFDF9F7FBF8F5FCF8F6FCF6F4FBF5F3FAF5F2
          FBF4F2FBF5F1F9F3F0FAF2EFF9F3EFFAF2EFF8F1EDF9F2EEFAF1EDFFFDFA9280
          6ED3D2CEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFF2F0EFBEAB9EFFFFFFFDFAF6FCF8F6FBF8F5FCF7F5FBF7F4FBF6F3
          FAF6F3FBF5F2FAF3F0F9F4F0F9F3EFF9F3EFF9F2EFF9F2EEFAF2EEFFFEFD9280
          6ED3D2CEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFF2F0EFBEAC9FFFFFFFFDF9F7FBF8F6FBF9F6FBF7F5FBF8F6FCF6F4
          FAF7F3FAF6F4FBF4F1FAF5F0FAF5F0FAF3F0FBF3F0FAF3F1FBF3EFFFFFFD9381
          6ED3D1CEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFF3F0EFC1AE9FFFFFFFFDF9F9FBF9F7FCF8F8FBF9F6FDF9F7FBF8F6
          FCF7F5FAF5F4FBF6F3FBF4F3FBF5F2FBF5F2F9F5F2FBF5F0F9F5F2FFFFFE9381
          70D3D1CEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFF3F0EFC1ADA0FFFFFFFCFBF8FDFBF8FDF8F8FDFAF7FBF9F7FDF8F7
          FCF8F5FCF7F5FCF7F4FBF6F4FBF6F3FAF6F3FBF6F3FBF5F3FBF5F2FFFFFF9381
          6FD3D1CEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFF3F1EFC1AEA1FFFFFFFDFAFAFEFAFAFCFAF8FCF9F9FDFAF7FDF8F8
          FCF9F6FBF9F6FCF8F5FBF7F5FBF6F4FBF7F4FBF6F3FBF6F3FCF6F3FFFFFF9381
          6FD3D1CEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFF3F1EFC1AFA1FFFFFFFEFBFBFDFBF9FCFBF9FDFAF8FCFAF8FDF9F7
          FCF9F8FCF8F6FCF9F6FBF7F6FCF8F5FCF7F5FCF7F4FBF7F5FCF6F4FFFFFF9382
          70D3D1CEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFF3F1EEC3AEA2FFFFFFFDFDFBFDFBFBFDFBF9FDFAF9FCFBF8FCFAF8
          FCF9F8FDF9F7FCF9F7FBF8F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9686
          74D4D2D0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFF3F1EEC2B0A2FFFFFFFFFCFCFDFCFCFEFBFAFDFBFAFDFBFAFDFAFA
          FEFAF9FCF9F8FCF9F7FFFFFFC8B4A89C8777897A698C7D6C8D7E6E998B7A735D
          47DEDCDAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFF3F1EFC3B1A3FFFFFFFDFCFCFDFEFBFDFCFBFEFCFBFEFDFAFEFBFB
          FCFCF9FCFAF9FEFAF8FFFFFFAD9584FCFBFCE2CBBBE1C5B0E6C5AE70523AA89D
          93FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFF3F1F0C3B1A3FFFFFFFFFCFEFDFCFDFFFDFBFDFDFDFDFDFCFDFBFA
          FEFBFBFEFCFBFDFAFAFFFFFFAF9584FFFFFFFFF0E5F5DFD0967B63ACA297FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFF3F1EFC3B1A5FFFFFFFFFEFDFDFEFDFFFEFDFDFEFDFEFEFCFEFDFC
          FDFBFCFEFDFCFCFBFBFFFFFFAF9584FFFFFFFCE8DCAA9480A59A8EFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFF2F1EFC4B1A4FFFFFFFFFFFEFEFEFDFEFEFEFEFEFEFEFEFDFEFDFD
          FEFDFCFEFCFCFEFCFBFFFFFFB09786FFFFFCBFA99AAEA398FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFF2F1EFC6B4A7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFB59D8DD5BEB1BCB2A9FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFF3F1F0B59E8FD0C3B9CEBEB4CDBFB4CDBDB3CCBDB2CBBBB1CCBBAF
          CABAAFCAB9AEC9B7ACCBBCAFAA8E7CD6CBC5FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFF9F9F9EAE5E1E9E4E0E9E3E0E9E3DFE9E3DFE8E3DFE8E2DFE8E2DE
          E7E2DEE8E2DEE7E1DDE7E1DDE8E3DFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        SubItems = <>
        Separator = True
        SubMenuItemSpacing = 6
        Visible = True
      end
      item
        CanSelect = False
        Caption = #51333#47308
        ImageIndex = 13
        SubItems = <>
        Separator = False
        SubMenuItemSpacing = 4
        Visible = True
        OnClick = mn_trayCloseClick
      end>
    MenuSpacing = 8
    MenuImages = ImageList2
    MenuWidth = 150
    MenuFont.Charset = ANSI_CHARSET
    MenuFont.Color = clWindowText
    MenuFont.Height = -11
    MenuFont.Name = #45208#45588#44256#46357
    MenuFont.Style = []
    SubMenuWidth = 0
    SubMenuItems = <
      item
        Title = 'VERSION'
        Visible = True
      end
      item
        Title = '1.0.0.1'
        Visible = True
      end>
    SubMenuCaption = #54532#47196#44536#47016#51221#48372
    SubMenuItemSpacing = 4
    Styler = AdvPreviewMenuOfficeStyler1
    ShowHint = True
    Version = '6.0.0.0'
    Left = 78
    Top = 222
  end
  object AdvPreviewMenuOfficeStyler2: TAdvPreviewMenuOfficeStyler
    FrameAppearance.BorderColor = 13087391
    FrameAppearance.CaptionBackground = 15656925
    FrameAppearance.Color = 16643823
    FrameAppearance.ColorTo = 15784647
    FrameAppearance.ColorMirror = 15784647
    FrameAppearance.ColorMirrorTo = 15784647
    FrameAppearance.Gradient = ggVertical
    FrameAppearance.GradientMirror = ggVertical
    LeftFrameColor = clWhite
    RightFrameColor = 15389631
    MenuItemAppearance.BorderColor = clNone
    MenuItemAppearance.BorderColorHot = 5819121
    MenuItemAppearance.BorderColorDown = 3181250
    MenuItemAppearance.BorderColorChecked = 5819121
    MenuItemAppearance.BorderColorDisabled = clNone
    MenuItemAppearance.Color = clNone
    MenuItemAppearance.ColorTo = clNone
    MenuItemAppearance.ColorChecked = 14285309
    MenuItemAppearance.ColorCheckedTo = 9102333
    MenuItemAppearance.ColorDisabled = clNone
    MenuItemAppearance.ColorDisabledTo = clNone
    MenuItemAppearance.ColorDown = 8122111
    MenuItemAppearance.ColorDownTo = 7131391
    MenuItemAppearance.ColorHot = 14285309
    MenuItemAppearance.ColorHotTo = 9102333
    MenuItemAppearance.ColorMirror = clNone
    MenuItemAppearance.ColorMirrorTo = clNone
    MenuItemAppearance.ColorMirrorHot = 9102333
    MenuItemAppearance.ColorMirrorHotTo = 14285309
    MenuItemAppearance.ColorMirrorDown = 7131391
    MenuItemAppearance.ColorMirrorDownTo = 8122111
    MenuItemAppearance.ColorMirrorChecked = 9102333
    MenuItemAppearance.ColorMirrorCheckedTo = 14285309
    MenuItemAppearance.ColorMirrorDisabled = clNone
    MenuItemAppearance.ColorMirrorDisabledTo = clNone
    MenuItemAppearance.GradientHot = ggVertical
    MenuItemAppearance.GradientMirrorHot = ggVertical
    MenuItemAppearance.GradientDown = ggVertical
    MenuItemAppearance.GradientMirrorDown = ggVertical
    MenuItemAppearance.GradientChecked = ggVertical
    MenuItemAppearance.GradientDisabled = ggVertical
    MenuItemAppearance.GradientMirrorDisabled = ggVertical
    MenuItemAppearance.TextColorChecked = clBlack
    MenuItemAppearance.TextColorDown = clBlack
    MenuItemAppearance.TextColorHot = clBlack
    MenuItemAppearance.Font.Charset = DEFAULT_CHARSET
    MenuItemAppearance.Font.Color = clWindowText
    MenuItemAppearance.Font.Height = -11
    MenuItemAppearance.Font.Name = 'Tahoma'
    MenuItemAppearance.Font.Style = []
    MenuItemAppearance.SubMenuCaptionFont.Charset = DEFAULT_CHARSET
    MenuItemAppearance.SubMenuCaptionFont.Color = clWindowText
    MenuItemAppearance.SubMenuCaptionFont.Height = -11
    MenuItemAppearance.SubMenuCaptionFont.Name = 'Tahoma'
    MenuItemAppearance.SubMenuCaptionFont.Style = []
    MenuItemAppearance.SubItemTitleFont.Charset = DEFAULT_CHARSET
    MenuItemAppearance.SubItemTitleFont.Color = clWindowText
    MenuItemAppearance.SubItemTitleFont.Height = -11
    MenuItemAppearance.SubItemTitleFont.Name = 'Tahoma'
    MenuItemAppearance.SubItemTitleFont.Style = [fsBold]
    MenuItemAppearance.SubItemFont.Charset = DEFAULT_CHARSET
    MenuItemAppearance.SubItemFont.Color = clWindowText
    MenuItemAppearance.SubItemFont.Height = -11
    MenuItemAppearance.SubItemFont.Name = 'Tahoma'
    MenuItemAppearance.SubItemFont.Style = []
    MenuItemAppearance.TextColor = clBlack
    MenuItemAppearance.TextColorDisabled = clGray
    MenuItemAppearance.Rounded = True
    ButtonAppearance.BorderColor = 13087391
    ButtonAppearance.BorderColorHot = 5819121
    ButtonAppearance.BorderColorDown = 3181250
    ButtonAppearance.BorderColorChecked = 3181250
    ButtonAppearance.Color = 16643823
    ButtonAppearance.ColorTo = 15784647
    ButtonAppearance.ColorChecked = 14285309
    ButtonAppearance.ColorCheckedTo = 7131391
    ButtonAppearance.ColorDisabled = clNone
    ButtonAppearance.ColorDisabledTo = clNone
    ButtonAppearance.ColorDown = 7131391
    ButtonAppearance.ColorDownTo = 8122111
    ButtonAppearance.ColorHot = 9102333
    ButtonAppearance.ColorHotTo = 14285309
    ButtonAppearance.ColorMirror = 15784647
    ButtonAppearance.ColorMirrorTo = 15784647
    ButtonAppearance.ColorMirrorHot = 14285309
    ButtonAppearance.ColorMirrorHotTo = 9102333
    ButtonAppearance.ColorMirrorDown = 8122111
    ButtonAppearance.ColorMirrorDownTo = 7131391
    ButtonAppearance.ColorMirrorChecked = 7131391
    ButtonAppearance.ColorMirrorCheckedTo = 7131391
    ButtonAppearance.ColorMirrorDisabled = clNone
    ButtonAppearance.ColorMirrorDisabledTo = clNone
    ButtonAppearance.GradientHot = ggVertical
    ButtonAppearance.GradientMirrorHot = ggVertical
    ButtonAppearance.GradientDown = ggVertical
    ButtonAppearance.GradientMirrorDown = ggVertical
    ButtonAppearance.GradientChecked = ggVertical
    Style = psOffice2010Blue
    Left = 604
    Top = 68
  end
  object AdvPreviewMenuOfficeStyler1: TAdvPreviewMenuOfficeStyler
    FrameAppearance.BorderColor = 13217692
    FrameAppearance.CaptionBackground = 15656925
    FrameAppearance.Color = 16114129
    FrameAppearance.ColorTo = 15191480
    FrameAppearance.ColorMirror = 16114129
    FrameAppearance.ColorMirrorTo = 15191480
    FrameAppearance.Gradient = ggVertical
    FrameAppearance.GradientMirror = ggVertical
    LeftFrameColor = clWhite
    RightFrameColor = 15657705
    MenuItemAppearance.BorderColor = clNone
    MenuItemAppearance.BorderColorHot = 10079963
    MenuItemAppearance.BorderColorDown = 4548219
    MenuItemAppearance.BorderColorChecked = 4548219
    MenuItemAppearance.BorderColorDisabled = clNone
    MenuItemAppearance.Color = clNone
    MenuItemAppearance.ColorTo = clNone
    MenuItemAppearance.ColorChecked = 11918331
    MenuItemAppearance.ColorCheckedTo = 7915518
    MenuItemAppearance.ColorDisabled = clNone
    MenuItemAppearance.ColorDisabledTo = clNone
    MenuItemAppearance.ColorDown = 7778289
    MenuItemAppearance.ColorDownTo = 4296947
    MenuItemAppearance.ColorHot = 15465983
    MenuItemAppearance.ColorHotTo = 11332863
    MenuItemAppearance.ColorMirror = clNone
    MenuItemAppearance.ColorMirrorTo = clNone
    MenuItemAppearance.ColorMirrorHot = 5888767
    MenuItemAppearance.ColorMirrorHotTo = 10807807
    MenuItemAppearance.ColorMirrorDown = 946929
    MenuItemAppearance.ColorMirrorDownTo = 5021693
    MenuItemAppearance.ColorMirrorChecked = 10480637
    MenuItemAppearance.ColorMirrorCheckedTo = 5682430
    MenuItemAppearance.ColorMirrorDisabled = clNone
    MenuItemAppearance.ColorMirrorDisabledTo = clNone
    MenuItemAppearance.GradientHot = ggVertical
    MenuItemAppearance.GradientMirrorHot = ggVertical
    MenuItemAppearance.GradientDown = ggVertical
    MenuItemAppearance.GradientMirrorDown = ggVertical
    MenuItemAppearance.GradientChecked = ggVertical
    MenuItemAppearance.GradientDisabled = ggVertical
    MenuItemAppearance.GradientMirrorDisabled = ggVertical
    MenuItemAppearance.TextColorChecked = clBlack
    MenuItemAppearance.TextColorDown = 7214336
    MenuItemAppearance.TextColorHot = 7214336
    MenuItemAppearance.Font.Charset = DEFAULT_CHARSET
    MenuItemAppearance.Font.Color = clWindowText
    MenuItemAppearance.Font.Height = -11
    MenuItemAppearance.Font.Name = 'Tahoma'
    MenuItemAppearance.Font.Style = []
    MenuItemAppearance.SubMenuCaptionFont.Charset = DEFAULT_CHARSET
    MenuItemAppearance.SubMenuCaptionFont.Color = clWindowText
    MenuItemAppearance.SubMenuCaptionFont.Height = -11
    MenuItemAppearance.SubMenuCaptionFont.Name = 'Tahoma'
    MenuItemAppearance.SubMenuCaptionFont.Style = []
    MenuItemAppearance.SubItemTitleFont.Charset = DEFAULT_CHARSET
    MenuItemAppearance.SubItemTitleFont.Color = clWindowText
    MenuItemAppearance.SubItemTitleFont.Height = -11
    MenuItemAppearance.SubItemTitleFont.Name = 'Tahoma'
    MenuItemAppearance.SubItemTitleFont.Style = [fsBold]
    MenuItemAppearance.SubItemFont.Charset = DEFAULT_CHARSET
    MenuItemAppearance.SubItemFont.Color = clWindowText
    MenuItemAppearance.SubItemFont.Height = -11
    MenuItemAppearance.SubItemFont.Name = 'Tahoma'
    MenuItemAppearance.SubItemFont.Style = []
    MenuItemAppearance.TextColor = 7214336
    MenuItemAppearance.TextColorDisabled = clGray
    MenuItemAppearance.Rounded = False
    ButtonAppearance.BorderColor = 14727579
    ButtonAppearance.BorderColorHot = 10079963
    ButtonAppearance.BorderColorDown = 4548219
    ButtonAppearance.BorderColorChecked = 4548219
    ButtonAppearance.Color = 15653832
    ButtonAppearance.ColorTo = 16178633
    ButtonAppearance.ColorChecked = 11918331
    ButtonAppearance.ColorCheckedTo = 7915518
    ButtonAppearance.ColorDisabled = clNone
    ButtonAppearance.ColorDisabledTo = clNone
    ButtonAppearance.ColorDown = 7778289
    ButtonAppearance.ColorDownTo = 4296947
    ButtonAppearance.ColorHot = 15465983
    ButtonAppearance.ColorHotTo = 11332863
    ButtonAppearance.ColorMirror = 15586496
    ButtonAppearance.ColorMirrorTo = 16245200
    ButtonAppearance.ColorMirrorHot = 5888767
    ButtonAppearance.ColorMirrorHotTo = 10807807
    ButtonAppearance.ColorMirrorDown = 946929
    ButtonAppearance.ColorMirrorDownTo = 5021693
    ButtonAppearance.ColorMirrorChecked = 10480637
    ButtonAppearance.ColorMirrorCheckedTo = 5682430
    ButtonAppearance.ColorMirrorDisabled = clNone
    ButtonAppearance.ColorMirrorDisabledTo = clNone
    ButtonAppearance.GradientHot = ggVertical
    ButtonAppearance.GradientMirrorHot = ggVertical
    ButtonAppearance.GradientDown = ggVertical
    ButtonAppearance.GradientMirrorDown = ggVertical
    ButtonAppearance.GradientChecked = ggVertical
    Style = psOffice2007Luna
    Left = 740
    Top = 60
  end
  object AdvMenuOfficeStyler1: TAdvMenuOfficeStyler
    AntiAlias = aaNone
    AutoThemeAdapt = False
    Style = osOffice2013White
    Background.Position = bpCenter
    Background.Color = clWhite
    Background.ColorTo = clWhite
    ButtonAppearance.DownColor = 16576740
    ButtonAppearance.DownColorTo = 16576740
    ButtonAppearance.HoverColor = 16576740
    ButtonAppearance.HoverColorTo = 16576740
    ButtonAppearance.DownBorderColor = 15381630
    ButtonAppearance.HoverBorderColor = 15381630
    ButtonAppearance.CaptionFont.Charset = DEFAULT_CHARSET
    ButtonAppearance.CaptionFont.Color = clWindowText
    ButtonAppearance.CaptionFont.Height = -11
    ButtonAppearance.CaptionFont.Name = 'Tahoma'
    ButtonAppearance.CaptionFont.Style = []
    IconBar.Color = clWhite
    IconBar.ColorTo = clWhite
    IconBar.CheckColor = 16576740
    IconBar.CheckBorder = 15381630
    IconBar.RadioColor = 16576740
    IconBar.RadioBorder = 15381630
    IconBar.SeparatorColor = 15197410
    SelectedItem.Color = 16576740
    SelectedItem.ColorTo = 16576740
    SelectedItem.BorderColor = 15381630
    SelectedItem.Font.Charset = DEFAULT_CHARSET
    SelectedItem.Font.Color = clWindowText
    SelectedItem.Font.Height = -11
    SelectedItem.Font.Name = 'Tahoma'
    SelectedItem.Font.Style = []
    SelectedItem.NotesFont.Charset = DEFAULT_CHARSET
    SelectedItem.NotesFont.Color = clWindowText
    SelectedItem.NotesFont.Height = -8
    SelectedItem.NotesFont.Name = 'Tahoma'
    SelectedItem.NotesFont.Style = []
    SelectedItem.CheckColor = 16576740
    SelectedItem.CheckBorder = 3577330
    SelectedItem.RadioColor = 16576740
    SelectedItem.RadioBorder = 3577330
    RootItem.Color = clWhite
    RootItem.ColorTo = clWhite
    RootItem.GradientDirection = gdVertical
    RootItem.Font.Charset = DEFAULT_CHARSET
    RootItem.Font.Color = clBlack
    RootItem.Font.Height = -12
    RootItem.Font.Name = #44404#47548
    RootItem.Font.Style = []
    RootItem.SelectedColor = 16576740
    RootItem.SelectedColorTo = 16576740
    RootItem.SelectedBorderColor = 15381630
    RootItem.HoverColor = 16246477
    RootItem.HoverColorTo = 16246477
    RootItem.HoverColorMirror = 16246477
    RootItem.HoverColorMirrorTo = 16246477
    RootItem.HoverBorderColor = 15187578
    RootItem.HoverTextColor = clBlack
    Glyphs.SubMenu.Data = {
      5A000000424D5A000000000000003E0000002800000004000000070000000100
      0100000000001C0000000000000000000000020000000200000000000000FFFF
      FF0070000000300000001000000000000000100000003000000070000000}
    Glyphs.Check.Data = {
      7E000000424D7E000000000000003E0000002800000010000000100000000100
      010000000000400000000000000000000000020000000200000000000000FFFF
      FF00FFFF0000FFFF0000FFFF0000FFFF0000FDFF0000F8FF0000F07F0000F23F
      0000F71F0000FF8F0000FFCF0000FFEF0000FFFF0000FFFF0000FFFF0000FFFF
      0000}
    Glyphs.Radio.Data = {
      7E000000424D7E000000000000003E0000002800000010000000100000000100
      010000000000400000000000000000000000020000000200000000000000FFFF
      FF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FC3F0000F81F0000F81F
      0000F81F0000F81F0000FC3F0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000}
    SideBar.Font.Charset = DEFAULT_CHARSET
    SideBar.Font.Color = clWhite
    SideBar.Font.Height = -19
    SideBar.Font.Name = 'Tahoma'
    SideBar.Font.Style = [fsBold, fsItalic]
    SideBar.Image.Position = bpCenter
    SideBar.Background.Position = bpCenter
    SideBar.SplitterColorTo = clBlack
    Separator.Color = 13224135
    Separator.ColorTo = 13224135
    Separator.GradientType = gtBoth
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMenuText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    NotesFont.Charset = DEFAULT_CHARSET
    NotesFont.Color = clGray
    NotesFont.Height = -8
    NotesFont.Name = 'Tahoma'
    NotesFont.Style = []
    MenuBorderColor = 11578279
    Left = 788
    Top = 104
  end
  object AdvToolBarOfficeStyler1: TAdvToolBarOfficeStyler
    AppColor.AppButtonColor = 13005312
    AppColor.AppButtonHoverColor = 16755772
    AppColor.TextColor = clWhite
    AppColor.HoverColor = 16246477
    AppColor.HoverTextColor = clBlack
    AppColor.HoverBorderColor = 16246477
    AppColor.SelectedColor = 15187578
    AppColor.SelectedTextColor = clBlack
    AppColor.SelectedBorderColor = 15187578
    Style = bsOffice2013White
    BackGroundDisplay = bdStretch
    BorderColor = clSilver
    BorderColorHot = 14074033
    ButtonAppearance.Color = 16643823
    ButtonAppearance.ColorTo = 15784647
    ButtonAppearance.ColorChecked = 7131391
    ButtonAppearance.ColorCheckedTo = 7131391
    ButtonAppearance.ColorDown = 7131391
    ButtonAppearance.ColorDownTo = 8122111
    ButtonAppearance.ColorHot = 9102333
    ButtonAppearance.ColorHotTo = 14285309
    ButtonAppearance.BorderDownColor = 3181250
    ButtonAppearance.BorderHotColor = 5819121
    ButtonAppearance.BorderCheckedColor = 3181250
    ButtonAppearance.CaptionFont.Charset = DEFAULT_CHARSET
    ButtonAppearance.CaptionFont.Color = clWindowText
    ButtonAppearance.CaptionFont.Height = -11
    ButtonAppearance.CaptionFont.Name = 'Segoe UI'
    ButtonAppearance.CaptionFont.Style = []
    CaptionAppearance.CaptionColor = 16181724
    CaptionAppearance.CaptionColorTo = 16181724
    CaptionAppearance.CaptionTextColor = 5978398
    CaptionAppearance.CaptionBorderColor = 16181724
    CaptionAppearance.CaptionColorHot = 16117737
    CaptionAppearance.CaptionColorHotTo = 16117737
    CaptionAppearance.CaptionTextColorHot = 5978398
    CaptionAppearance.CaptionBorderColorHot = 16117737
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -11
    CaptionFont.Name = 'Segoe UI'
    CaptionFont.Style = []
    ContainerAppearance.LineColor = clBtnShadow
    ContainerAppearance.Line3D = True
    Color.Color = clWhite
    Color.ColorTo = clWhite
    Color.Direction = gdVertical
    Color.Mirror.Color = 16775925
    Color.Mirror.ColorTo = 16445413
    Color.Mirror.ColorMirror = 16445413
    Color.Mirror.ColorMirrorTo = 16181724
    ColorHot.Color = 16248291
    ColorHot.ColorTo = 16643823
    ColorHot.Direction = gdVertical
    ColorHot.Mirror.Color = 16775925
    ColorHot.Mirror.ColorTo = 16445413
    ColorHot.Mirror.ColorMirror = 16445413
    ColorHot.Mirror.ColorMirrorTo = 16117737
    CompactGlowButtonAppearance.BorderColor = 13087391
    CompactGlowButtonAppearance.BorderColorHot = 5819121
    CompactGlowButtonAppearance.BorderColorDown = 3181250
    CompactGlowButtonAppearance.BorderColorChecked = 3181250
    CompactGlowButtonAppearance.Color = 16643823
    CompactGlowButtonAppearance.ColorTo = 15784647
    CompactGlowButtonAppearance.ColorChecked = 14285309
    CompactGlowButtonAppearance.ColorCheckedTo = 7131391
    CompactGlowButtonAppearance.ColorDisabled = clNone
    CompactGlowButtonAppearance.ColorDisabledTo = clNone
    CompactGlowButtonAppearance.ColorDown = 7131391
    CompactGlowButtonAppearance.ColorDownTo = 8122111
    CompactGlowButtonAppearance.ColorHot = 9102333
    CompactGlowButtonAppearance.ColorHotTo = 14285309
    CompactGlowButtonAppearance.ColorMirror = 15784647
    CompactGlowButtonAppearance.ColorMirrorTo = 15784647
    CompactGlowButtonAppearance.ColorMirrorHot = 14285309
    CompactGlowButtonAppearance.ColorMirrorHotTo = 9102333
    CompactGlowButtonAppearance.ColorMirrorDown = 8122111
    CompactGlowButtonAppearance.ColorMirrorDownTo = 7131391
    CompactGlowButtonAppearance.ColorMirrorChecked = 7131391
    CompactGlowButtonAppearance.ColorMirrorCheckedTo = 7131391
    CompactGlowButtonAppearance.ColorMirrorDisabled = clNone
    CompactGlowButtonAppearance.ColorMirrorDisabledTo = clNone
    CompactGlowButtonAppearance.GradientHot = ggVertical
    CompactGlowButtonAppearance.GradientMirrorHot = ggVertical
    CompactGlowButtonAppearance.GradientDown = ggVertical
    CompactGlowButtonAppearance.GradientMirrorDown = ggVertical
    CompactGlowButtonAppearance.GradientChecked = ggVertical
    DockColor.Color = clWhite
    DockColor.ColorTo = clWhite
    DockColor.Direction = gdHorizontal
    DockColor.Steps = 128
    FloatingWindowBorderColor = 14074033
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindow
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    GlowButtonAppearance.BorderColor = clWhite
    GlowButtonAppearance.BorderColorHot = 16246477
    GlowButtonAppearance.BorderColorDown = 15187578
    GlowButtonAppearance.BorderColorChecked = 15187578
    GlowButtonAppearance.ColorTo = clNone
    GlowButtonAppearance.ColorChecked = 15187578
    GlowButtonAppearance.ColorCheckedTo = clNone
    GlowButtonAppearance.ColorDisabled = clNone
    GlowButtonAppearance.ColorDisabledTo = clNone
    GlowButtonAppearance.ColorDown = 15187578
    GlowButtonAppearance.ColorDownTo = clNone
    GlowButtonAppearance.ColorHot = 16246477
    GlowButtonAppearance.ColorHotTo = clNone
    GlowButtonAppearance.ColorMirror = clNone
    GlowButtonAppearance.ColorMirrorTo = clNone
    GlowButtonAppearance.ColorMirrorHot = clNone
    GlowButtonAppearance.ColorMirrorHotTo = clNone
    GlowButtonAppearance.ColorMirrorDown = clNone
    GlowButtonAppearance.ColorMirrorDownTo = clNone
    GlowButtonAppearance.ColorMirrorChecked = clNone
    GlowButtonAppearance.ColorMirrorCheckedTo = clNone
    GlowButtonAppearance.ColorMirrorDisabled = clNone
    GlowButtonAppearance.ColorMirrorDisabledTo = clNone
    GlowButtonAppearance.GradientHot = ggVertical
    GlowButtonAppearance.GradientMirrorHot = ggVertical
    GlowButtonAppearance.GradientDown = ggVertical
    GlowButtonAppearance.GradientMirrorDown = ggVertical
    GlowButtonAppearance.GradientChecked = ggVertical
    GroupAppearance.Background = clInfoBk
    GroupAppearance.BorderColor = 1340927
    GroupAppearance.Color = 4636927
    GroupAppearance.ColorTo = 4636927
    GroupAppearance.ColorMirror = 4636927
    GroupAppearance.ColorMirrorTo = 4636927
    GroupAppearance.Font.Charset = DEFAULT_CHARSET
    GroupAppearance.Font.Color = clWindowText
    GroupAppearance.Font.Height = -11
    GroupAppearance.Font.Name = 'Segoe UI'
    GroupAppearance.Font.Style = []
    GroupAppearance.Gradient = ggVertical
    GroupAppearance.GradientMirror = ggVertical
    GroupAppearance.TextColor = clWhite
    GroupAppearance.CaptionAppearance.CaptionColor = 16181724
    GroupAppearance.CaptionAppearance.CaptionColorTo = 16181724
    GroupAppearance.CaptionAppearance.CaptionTextColor = 5978398
    GroupAppearance.CaptionAppearance.CaptionBorderColor = 16181724
    GroupAppearance.CaptionAppearance.CaptionColorHot = 16117737
    GroupAppearance.CaptionAppearance.CaptionColorHotTo = 16117737
    GroupAppearance.CaptionAppearance.CaptionTextColorHot = 5978398
    GroupAppearance.CaptionAppearance.CaptionBorderColorHot = 16117737
    GroupAppearance.PageAppearance.BorderColor = 13087391
    GroupAppearance.PageAppearance.Color = 16775925
    GroupAppearance.PageAppearance.ColorTo = 16445413
    GroupAppearance.PageAppearance.ColorMirror = 16445413
    GroupAppearance.PageAppearance.ColorMirrorTo = 16181724
    GroupAppearance.PageAppearance.Gradient = ggVertical
    GroupAppearance.PageAppearance.GradientMirror = ggVertical
    GroupAppearance.PageAppearance.ShadowColor = 15126975
    GroupAppearance.PageAppearance.HighLightColor = 13416873
    GroupAppearance.TabAppearance.BorderColor = 13087391
    GroupAppearance.TabAppearance.BorderColorHot = 1340927
    GroupAppearance.TabAppearance.BorderColorSelected = 1340927
    GroupAppearance.TabAppearance.BorderColorSelectedHot = 1340927
    GroupAppearance.TabAppearance.BorderColorDisabled = clNone
    GroupAppearance.TabAppearance.BorderColorDown = 14404026
    GroupAppearance.TabAppearance.Color = clWhite
    GroupAppearance.TabAppearance.ColorTo = clWhite
    GroupAppearance.TabAppearance.ColorSelected = 16775925
    GroupAppearance.TabAppearance.ColorSelectedTo = 16775925
    GroupAppearance.TabAppearance.ColorDisabled = 15921906
    GroupAppearance.TabAppearance.ColorDisabledTo = 15921906
    GroupAppearance.TabAppearance.ColorHot = 16446701
    GroupAppearance.TabAppearance.ColorHotTo = 16710903
    GroupAppearance.TabAppearance.ColorMirror = clWhite
    GroupAppearance.TabAppearance.ColorMirrorTo = clWhite
    GroupAppearance.TabAppearance.ColorMirrorHot = 16710906
    GroupAppearance.TabAppearance.ColorMirrorHotTo = 16710906
    GroupAppearance.TabAppearance.ColorMirrorSelected = 16775925
    GroupAppearance.TabAppearance.ColorMirrorSelectedTo = 16775925
    GroupAppearance.TabAppearance.ColorMirrorDisabled = 15921906
    GroupAppearance.TabAppearance.ColorMirrorDisabledTo = 15921906
    GroupAppearance.TabAppearance.Font.Charset = DEFAULT_CHARSET
    GroupAppearance.TabAppearance.Font.Color = clWindowText
    GroupAppearance.TabAppearance.Font.Height = -11
    GroupAppearance.TabAppearance.Font.Name = 'Tahoma'
    GroupAppearance.TabAppearance.Font.Style = []
    GroupAppearance.TabAppearance.Gradient = ggVertical
    GroupAppearance.TabAppearance.GradientMirror = ggVertical
    GroupAppearance.TabAppearance.GradientHot = ggVertical
    GroupAppearance.TabAppearance.GradientMirrorHot = ggVertical
    GroupAppearance.TabAppearance.GradientSelected = ggVertical
    GroupAppearance.TabAppearance.GradientMirrorSelected = ggVertical
    GroupAppearance.TabAppearance.GradientDisabled = ggVertical
    GroupAppearance.TabAppearance.GradientMirrorDisabled = ggVertical
    GroupAppearance.TabAppearance.TextColor = 5978398
    GroupAppearance.TabAppearance.TextColorHot = 5978398
    GroupAppearance.TabAppearance.TextColorSelected = 5978398
    GroupAppearance.TabAppearance.TextColorDisabled = clGray
    GroupAppearance.TabAppearance.ShadowColor = 13087391
    GroupAppearance.TabAppearance.HighLightColor = 16775871
    GroupAppearance.TabAppearance.HighLightColorHot = 16643823
    GroupAppearance.TabAppearance.HighLightColorSelected = 13087391
    GroupAppearance.TabAppearance.HighLightColorSelectedHot = 15784647
    GroupAppearance.TabAppearance.HighLightColorDown = 16181209
    GroupAppearance.ToolBarAppearance.BorderColor = 13087391
    GroupAppearance.ToolBarAppearance.BorderColorHot = 13092807
    GroupAppearance.ToolBarAppearance.Color.Color = 16775925
    GroupAppearance.ToolBarAppearance.Color.ColorTo = 16181724
    GroupAppearance.ToolBarAppearance.Color.Direction = gdHorizontal
    GroupAppearance.ToolBarAppearance.ColorHot.Color = 16775925
    GroupAppearance.ToolBarAppearance.ColorHot.ColorTo = 16117737
    GroupAppearance.ToolBarAppearance.ColorHot.Direction = gdHorizontal
    PageAppearance.BorderColor = 13087391
    PageAppearance.Color = 16775925
    PageAppearance.ColorTo = 16445413
    PageAppearance.ColorMirror = 16445413
    PageAppearance.ColorMirrorTo = 16181724
    PageAppearance.Gradient = ggVertical
    PageAppearance.GradientMirror = ggVertical
    PageAppearance.ShadowColor = 15126975
    PageAppearance.HighLightColor = 13416873
    PagerCaption.BorderColor = 13087391
    PagerCaption.Color = 16775925
    PagerCaption.ColorTo = 15389631
    PagerCaption.ColorMirror = 15389631
    PagerCaption.ColorMirrorTo = 15389631
    PagerCaption.Gradient = ggVertical
    PagerCaption.GradientMirror = ggVertical
    PagerCaption.TextColor = clGray
    PagerCaption.TextColorExtended = clBlue
    PagerCaption.Font.Charset = DEFAULT_CHARSET
    PagerCaption.Font.Color = clWindowText
    PagerCaption.Font.Height = -17
    PagerCaption.Font.Name = 'Segoe UI'
    PagerCaption.Font.Style = []
    QATAppearance.BorderColor = 13087391
    QATAppearance.Color = 16643823
    QATAppearance.ColorTo = 15784647
    QATAppearance.FullSizeBorderColor = 13087391
    QATAppearance.FullSizeColor = 16643823
    QATAppearance.FullSizeColorTo = 15784647
    RightHandleColor = clSilver
    RightHandleColorTo = clSilver
    RightHandleColorHot = clSilver
    RightHandleColorHotTo = clSilver
    RightHandleColorDown = 10526880
    RightHandleColorDownTo = 10526880
    TabAppearance.BorderColor = 13087391
    TabAppearance.BorderColorHot = 12236209
    TabAppearance.BorderColorSelected = 14404024
    TabAppearance.BorderColorSelectedHot = 14404024
    TabAppearance.BorderColorDisabled = clNone
    TabAppearance.BorderColorDown = 14404026
    TabAppearance.Color = clWhite
    TabAppearance.ColorTo = clWhite
    TabAppearance.ColorSelected = 16775925
    TabAppearance.ColorSelectedTo = 16775925
    TabAppearance.ColorDisabled = 15921906
    TabAppearance.ColorDisabledTo = 15921906
    TabAppearance.ColorHot = 16446701
    TabAppearance.ColorHotTo = 16710903
    TabAppearance.ColorMirror = clWhite
    TabAppearance.ColorMirrorTo = clWhite
    TabAppearance.ColorMirrorHot = 16710906
    TabAppearance.ColorMirrorHotTo = 16710906
    TabAppearance.ColorMirrorSelected = 16775925
    TabAppearance.ColorMirrorSelectedTo = 16775925
    TabAppearance.ColorMirrorDisabled = 15921906
    TabAppearance.ColorMirrorDisabledTo = 15921906
    TabAppearance.Font.Charset = DEFAULT_CHARSET
    TabAppearance.Font.Color = clWindowText
    TabAppearance.Font.Height = -11
    TabAppearance.Font.Name = 'Segoe UI'
    TabAppearance.Font.Style = []
    TabAppearance.Gradient = ggVertical
    TabAppearance.GradientMirror = ggVertical
    TabAppearance.GradientHot = ggVertical
    TabAppearance.GradientMirrorHot = ggVertical
    TabAppearance.GradientSelected = ggVertical
    TabAppearance.GradientMirrorSelected = ggVertical
    TabAppearance.GradientDisabled = ggVertical
    TabAppearance.GradientMirrorDisabled = ggVertical
    TabAppearance.TextColor = 5978398
    TabAppearance.TextColorHot = 5978398
    TabAppearance.TextColorSelected = 5978398
    TabAppearance.TextColorDisabled = clGray
    TabAppearance.ShadowColor = 13087391
    TabAppearance.HighLightColor = 16775871
    TabAppearance.HighLightColorHot = 16643823
    TabAppearance.HighLightColorSelected = 13087391
    TabAppearance.HighLightColorSelectedHot = 15784647
    TabAppearance.HighLightColorDown = 16181209
    TabAppearance.BackGround.Color = 16446701
    TabAppearance.BackGround.ColorTo = 16710906
    TabAppearance.BackGround.Direction = gdVertical
    Left = 932
    Top = 84
  end
  object AdvFormStyler1: TAdvFormStyler
    Style = tsOffice2013White
    Left = 824
    Top = 24
  end
  object TrayIcon1: TTrayIcon
    Icon.Data = {
      0000010001002020000001001800080D00001600000028000000200000004000
      000001001800000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F5F5EF
      D8D7F2C9C6EFC8C5EFCBC7F2CBC8F2CBC8EECAC7F1C7C4F2CDC9F0E2E0FDFDFE
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCBBB8B9
      483FC61C0FBF2418BD271AC21E11C12013BB291EC41F12C32416BD6A63F0E2E1
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0CBC9CC5E54C2
      2114C06059D8A4A0CD7C75B0372DB7493FD79993D29792BE443BC62417D18881
      EAE3E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCD9E9ABB2417D0
      3428E5D1CFF9FFFFF3EBEADEBCB9E4C8C6FBFEFEF3F8F9DD9D99C81406B9473C
      DFC8C5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFDFEFCFEFEFCFEFEC78882AE180BD0
      5248FDFDFCF3E4E3F0DEDCF5EBEAF3E8E6EFDBD9F7EFEEF3CFCCBF2216AE3227
      DAB7B3FDFFFFFBFDFDFBFBFBFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFF6EEEDEAD6D5EAD9D7EAD8D6C57870AD251AC4
      5E55E3C9C6C26F67B24137BB6158B8584FB13F35D19994DFB6B3B8352BB0362B
      D39E99EFE3E2E8D3D1E6CECCF0E3E1FBF8F7FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFAFFFFE3CDCAC67D76C4584ECA483DCA473CC8473DC92A1DBE3529C2
      837DD7B0ADCB4036C20A04C62214C61F12C20B03D26E66D3B2AFBC625AC3291C
      C93529C94E42C9443ACA4237C84C42C3675FCD948EF9FBFBFFFFFFFFFFFFFFFF
      FFF0ECECDEACA8CA5B52BD291CBF1507C50F01C50E00C40E00CD0C00C53B30C3
      928DD7AFAAD2382CCC0000CE1304CF1305CD0100D6665DD0B4B2BD726BCA2417
      CB0A00C31001C50D00C60D00C20F01BE1B0FC2382DD08C87E7D0CEFFFFFFFDFC
      FCD9A5A1C54137C40A00CF1405CF180ACE1709CE1709CE1709D01103C3392EC4
      8F8AD9B4B0D13D31CA0300CD180ACD180ACB0500D66B63D2B7B5BD6D66C82518
      D11002CE1709CE1809CE180ACE1709D11507CE1203B5190ECB7E77F4EAE9EBDA
      D9CC3F34CA0E00CF1B0DCD180ACD180ACD180ACD180ACD180AD01203C2372CC2
      8B86D8B2AED13D31CB0300CD180ACD180ACB0500D66B62D2B5B2BC6A63C82417
      D01103CD180ACD180ACD180ACD180ACD180ACD180ACD0E00CC473CCB8C86C47F
      79C82519CC0D00CE190BCD180ACD180ACD180ACD180ACD180AD01203C2382DC2
      8C87D8B2AED13D31CB0300CD180ACD180ACB0500D66B62D2B6B2BC6B64C82418
      D01103CD180ACD180ACD180ACD180ACD180ACD180AD01305C5271BB94036B73E
      34C81E11CD1405CD180ACD180ACD180ACD180ACD180ACD180AD01203C2382DC2
      8C87D8B2AED13D31CB0300CD180ACD180ACB0500D66B62D2B6B2BC6B64C82418
      D01103CD180ACD180ACD180ACD180ACD180ACD180ACF1709C61B0EBB2014BD25
      18C91A0DCD1709CD180ACD180ACD180ACD180ACD180ACD180AD01203C2382DC2
      8C87D8B2AED13D31CB0300CD180ACD180ACB0500D66B62D2B6B2BC6B64C82418
      D01103CD180ACD180ACD180ACD180ACD180ACD180ACE1709C81B0DC11F12C122
      15CA1A0CCD1709CD180ACD180ACD180ACD180ACD180ACD180ACF1203C3392DC2
      8C87D7B0ADD13C31CB0300CD180ACD180ACB0600D56A62D1B4B2BD6C65C82518
      D01102CD180ACD180ACD180ACD180ACD180ACD180ACE1708C61F12BC281DBD22
      16C91A0CCD1709CD180ACD180ACD180ACD180ACD180ACD180ACF1102C43C31C2
      8F8AD3A9A5D03327CC0000CE1002CE1102CC0000D36157CFB0ADBE726BC8271A
      D01001CD180ACD180ACD180ACD180ACD180ACD180ACF1304C52C21B74D44B638
      2FC81D10CD1506CD180ACD180ACD180ACD180ACD180ACD180AD11405BE3227C6
      908CEBD8D6D16E67C0342EC6463BC44339C13730DE9C96E4D2CFBB6860C62114
      D11304CD180ACD180ACD180ACD180ACF1709CF1506C20600C84F45D7A9A5C276
      70C92317CD0E00CE190BCD180ACD180ACD180ACD180ACD180AD2180ABB1E12C8
      7A74FBFCFCE3D1D0CDA29CCFA5A1CFA4A0D0A8A4F0ECEBEEDEDBBA493FC5180B
      D1180ACD180ACE1709CD1405CC1103CA1305C51A0CC13A2FDA9A95FBF8F8E7D0
      CECE3A2FCB0D00CE1C0ECD180ACD180ACD180ACD180ACD180ACF1B0DC40F01C4
      443AE2C6C4FCFEFEFAF3F2EDDFDEF2E6E5FFFCFCF4F3F3D59B96C02316C91304
      CF1B0ECD180ACD180ACB190BCC1809C02315B7433AE1C8C5FDFFFFFFFFFFFCFA
      F9D59893C6392EC80900CF1506CF190BCD180ACE1709CE1608CE180ACC1507CA
      1F12CD3E32D0544ACC584EC7544AC9554CCF5850CF4E43CC3326CA180ACC1708
      D01B0CC91608BE2317C76962D3948EDEA8A3EED8D6FAFAFAFFFFFFFFFFFFFFFF
      FFEDE5E4DAA29DC85046BB2115C21103C90C00C50D00BE1508C41508CC1709CD
      1507C90C00C40B00C10F01C11203C11103C20D00C50B00CB0F00CE1709CD180A
      D11909C5170AB63B31DBB8B6EDEAEAF7F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFF5F9F8DCBEBBC3726BC64D43CD3C32CB473DC55B52BD392EC51B0ED0
      1709CD180ACE1709CE1709CE1709CE1709CE1709CE180ACD180ACD180ACD180A
      D21004C72014BF6E67F3E9E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFEFE2E0E1C5C3ECDAD8F8F3F2CA938EBF3429D1
      1304CD180ACD180ACD180ACD180ACD180ACD180ACD180ACD180ACD180ACD180A
      CD0600CE382DDABAB8F7F8F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFF9F9F9FCFBFBFFFFFFF4ECEBD17770BD
      0900CE1709D01B0DCD180ACD180ACD180ACD180ACD180ACD180ACD180AD21405
      BE180DC46C65F8F4F4FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8C8C6C3
      534AC11103CC0F00D01709CE1709CE180ACE1809CE1708D01405CD0F00BF1508
      C6675EE2C8C5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FCFDE0
      C0BCC65147C5261AC81A0DC81103C91001C91002C61305C81B0ECA2D21C05B53
      E3C7C4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFF
      FFFFF1E5E4C78580B63B31C02215C61C0FC41E11BA2A1EB64B42C98F8AF4EAE9
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFEFFFFF3E9E8EED5D3F1CFCCF2CECBF2CECBEFD1CFEEDAD8F3EBEBFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000}
    Icons = TrayImageList
    PopupMenu = pm_TrayMenu
    OnDblClick = TrayIcon1DblClick
    Left = 256
    Top = 256
  end
  object FireDoorOpenTimer: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = FireDoorOpenTimerTimer
    Left = 168
    Top = 640
  end
  object TrayTimer: TTimer
    Enabled = False
    OnTimer = TrayTimerTimer
    Left = 128
    Top = 584
  end
  object MemoryReadTimer: TTimer
    Enabled = False
    Interval = 1
    OnTimer = MemoryReadTimerTimer
    Left = 208
    Top = 584
  end
  object DeviceServerManagerCheckTimer: TTimer
    Enabled = False
    OnTimer = DeviceServerManagerCheckTimerTimer
    Left = 320
    Top = 576
  end
  object pm_TrayMenu: TPopupMenu
    AutoHotkeys = maManual
    Left = 224
    Top = 256
    object mn_trayVisible: TMenuItem
      Caption = #54868#47732#48372#44592
      OnClick = mn_trayVisibleClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object mn_trayClose: TMenuItem
      Caption = #51333#47308
      OnClick = mn_trayCloseClick
    end
  end
  object TrayImageList: TImageList
    BkColor = clWhite
    DrawingStyle = dsTransparent
    Height = 32
    Width = 32
    Left = 440
    Top = 64
    Bitmap = {
      494C010102000404780520002000FFFFFF00FF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000002000000001002000000000000040
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFCFC00EAE9
      E900D6D6D500D8D8D700DBDBDA00D9D9D800D9D9D800DBDBDA00D6D6D500DADA
      D900F1F1F100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8F5F500EFD8
      D700F2C9C600EFC8C500EFCBC700F2CBC800F2CBC800EECAC700F1C7C400F2CD
      C900F0E2E000FDFDFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DFDEDE009391
      8F0059585400676663006C6B69005F5E5A0062615E00716F6D005D5D5A006363
      5F00AFAEAC00F2F2F200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DCBBB800B948
      3F00C61C0F00BF241800BD271A00C21E1100C1201300BB291E00C41F1200C324
      1600BD6A6300F0E2E100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EBEBEC0092918F00605E
      5B00A1A09F00CCCCCB00B1B0AF008A88870094939100C1C1C000C6C6C5008887
      850061605C00B8B7B500F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E0CBC900CC5E5400C221
      1400C0605900D8A4A000CD7C7500B0372D00B7493F00D7999300D2979200BE44
      3B00C6241700D1888100EAE3E100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D2D2D1006A6A66006565
      6100EBEBEB00FFFFFF00F7F7F700DEDEDE00E5E4E400FFFFFF00FFFFFF00C1C1
      BF004D4E49008F8E8B00E8E8E800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CD9E9A00BB241700D034
      2800E5D1CF00F9FFFF00F3EBEA00DEBCB900E4C8C600FBFEFE00F3F8F900DD9D
      9900C8140600B9473C00DFC8C500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C2C2BF006C6C67008484
      8000FEFEFF00F1F1F000EEEEED00F6F6F500F3F4F300ECECEB00F6F6F600DCDC
      DC006465600085858100DCDCDB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FCFDFE00FCFEFE00FCFEFE00C7888200AE180B00D052
      4800FDFDFC00F3E4E300F0DEDC00F5EBEA00F3E8E600EFDBD900F7EFEE00F3CF
      CC00BF221600AE322700DAB7B300FDFFFF00FBFDFD00FBFBFB00FEFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F8F8F800ECECEC00EEEEEE00EDEDED00B4B4B100797976009A9A
      9800E6E6E600ADADAA0091908C00A8A7A400A1A19E008E8E8A00C8C8C700D7D7
      D7007F7F7C0087878500CBCBCA00F4F4F300EBEBEB00E9E9E900F3F3F300FCFC
      FC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F6EEED00EAD6D500EAD9D700EAD8D600C5787000AD251A00C45E
      5500E3C9C600C26F6700B2413700BB615800B8584F00B13F3500D1999400DFB6
      B300B8352B00B0362B00D39E9900EFE3E200E8D3D100E6CECC00F0E3E100FBF8
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00E9E9
      EA00B7B7B50096949200817F7D007F7E7B0081807C0064635D0078787400C2C1
      C000DAD9D90078767300494843005D5C58005C5B57004A4945009D9D9B00DEDE
      DF00A7A7A500686764006D6C6900868682007D7C78007B7A770087858300A1A0
      9F00CCCBC800FDFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFFFF00E3CD
      CA00C67D7600C4584E00CA483D00CA473C00C8473D00C92A1D00BE352900C283
      7D00D7B0AD00CB403600C20A0400C6221400C61F1200C20B0300D26E6600D3B2
      AF00BC625A00C3291C00C9352900C94E4200C9443A00CA423700C84C4200C367
      5F00CD948E00F9FBFB00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00F6FCFC00C7CFCE009192
      90006D6C6900595754004D4C48004B4A46004D4C470041403A0078777400D0D0
      CF00D8D8D7006867640034332E0046454100474642003736310091918F00E4E4
      E400B6B4B3005C5B570041403C004F4E4A004B4A45004A494500504E4A005E5E
      5B007D7D7900B7BAB800E5E5E500FFFFFF00FFFFFF00F0ECEC00DEACA800CA5B
      5200BD291C00BF150700C50F0100C50E0000C40E0000CD0C0000C53B3000C392
      8D00D7AFAA00D2382C00CC000000CE130400CF130500CD010000D6665D00D0B4
      B200BD726B00CA241700CB0A0000C3100100C50D0000C60D0000C20F0100BE1B
      0F00C2382D00D08C8700E7D0CE00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00CBCFCF007B827F004648
      4400474642004B4A46004B4B46004C4B47004B4A470043423E0079787500CCCC
      CB00DBDBDA006D6D69003A3935004D4C48004D4C48003D3C370096969400E5E5
      E400B1B0AE005F5E5A0042413D004B4A46004C4B47004C4B47004B4A46004849
      45004949450061635F00AFAEAD00F7F7F700FDFCFC00D9A5A100C5413700C40A
      0000CF140500CF180A00CE170900CE170900CE170900D0110300C3392E00C48F
      8A00D9B4B000D13D3100CA030000CD180A00CD180A00CB050000D66B6300D2B7
      B500BD6D6600C8251800D1100200CE170900CE180900CE180A00CE170900D115
      0700CE120300B5190E00CB7E7700F4EAE9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EFEFEE0086787600584C48004D4F
      4B004D4C48004D4C48004D4C48004D4C48004D4C480044433F0077777300CACA
      C900DBDAD9006E6C69003A3935004D4C48004D4C48003D3C370096969300E3E3
      E200AEAEAC005E5D5A0043423E004D4C48004D4C48004D4C48004C4C48004E4C
      48004B4B47003F3B38007C7A7800CACAC800EBDAD900CC3F3400CA0E0000CF1B
      0D00CD180A00CD180A00CD180A00CD180A00CD180A00D0120300C2372C00C28B
      8600D8B2AE00D13D3100CB030000CD180A00CD180A00CB050000D66B6200D2B5
      B200BC6A6300C8241700D0110300CD180A00CD180A00CD180A00CD180A00CD18
      0A00CD180A00CD0E0000CC473C00CB8C86000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BBBCBA00695E5B004D413D004D4D
      49004D4C48004D4C48004D4C48004D4C48004D4C480044433F0078777300CBCB
      C900DBDAD9006D6C69003A3935004D4C48004D4C48003D3C370096969300E3E3
      E300AFAEAD005E5D5A0043423E004D4C48004D4C48004D4C48004D4C48004D4C
      48004B4B47004A47420066635F0087858300C47F7900C8251900CC0D0000CE19
      0B00CD180A00CD180A00CD180A00CD180A00CD180A00D0120300C2382D00C28C
      8700D8B2AE00D13D3100CB030000CD180A00CD180A00CB050000D66B6200D2B6
      B200BC6B6400C8241800D0110300CD180A00CD180A00CD180A00CD180A00CD18
      0A00CD180A00D0130500C5271B00B94036000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000898986005B5551004C4541004D4C
      48004D4C48004D4C48004D4C48004D4C48004D4C480044433F0078777300CBCB
      C900DBDAD9006D6C69003A3935004D4C48004D4C48003D3C370096969300E3E3
      E300AFAEAD005E5D5A0043423E004D4C48004D4C48004D4C48004D4C48004D4C
      48004D4C48004E4D48005A58530064626000B73E3400C81E1100CD140500CD18
      0A00CD180A00CD180A00CD180A00CD180A00CD180A00D0120300C2382D00C28C
      8700D8B2AE00D13D3100CB030000CD180A00CD180A00CB050000D66B6200D2B6
      B200BC6B6400C8241800D0110300CD180A00CD180A00CD180A00CD180A00CD18
      0A00CD180A00CF170900C61B0E00BB2014000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006B6A650055504C004D4A46004D4C
      48004D4C48004D4C48004D4C48004D4C48004D4C480044433F0078777300CBCB
      C900DBDAD9006D6C69003A3935004D4C48004D4C48003D3C370096969300E3E3
      E300AFAEAD005E5D5A0043423E004D4C48004D4C48004D4C48004D4C48004D4C
      48004D4C48004B4A46005554500061605E00BD251800C91A0D00CD170900CD18
      0A00CD180A00CD180A00CD180A00CD180A00CD180A00D0120300C2382D00C28C
      8700D8B2AE00D13D3100CB030000CD180A00CD180A00CB050000D66B6200D2B6
      B200BC6B6400C8241800D0110300CD180A00CD180A00CD180A00CD180A00CD18
      0A00CD180A00CE170900C81B0D00C11F12000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000063635F00534F4B004D4A46004D4D
      49004D4C48004D4C48004D4C48004D4C48004D4C480044433F0078777400CBCB
      CA00DADAD9006D6C69003B3935004D4C48004D4C48003D3C370096959300E3E3
      E300AFAFAD005E5E5A0043423E004D4C48004D4C48004D4C48004D4C48004E4C
      48004D4C48004A484400595956006E6E6D00C1221500CA1A0C00CD170900CD18
      0A00CD180A00CD180A00CD180A00CD180A00CD180A00CF120300C3392D00C28C
      8700D7B0AD00D13C3100CB030000CD180A00CD180A00CB060000D56A6200D1B4
      B200BD6C6500C8251800D0110200CD180A00CD180A00CD180A00CD180A00CD18
      0A00CD180A00CE170800C61F1200BC281D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006464620056534F004E4B47004C4B
      47004D4C48004D4C48004D4C48004D4C48004D4C480044433E007A797700CDCD
      CD00D6D6D5006564600032312C00454440004544400034332E008F8E8C00E2E2
      E100B4B4B200605F5B0043413D004D4C48004D4C48004D4C48004D4C48004D4C
      48004D4C480044433F006969660098979600BD221600C91A0C00CD170900CD18
      0A00CD180A00CD180A00CD180A00CD180A00CD180A00CF110200C43C3100C28F
      8A00D3A9A500D0332700CC000000CE100200CE110200CC000000D3615700CFB0
      AD00BE726B00C8271A00D0100100CD180A00CD180A00CD180A00CD180A00CD18
      0A00CD180A00CF130400C52C2100B74D44000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000083817F005B5753004F4945004E4C
      49004D4C48004D4C48004D4C48004D4C48004D4C480045443F0076757100CBCB
      CA00ECECEC009E9E9B007574710081817E0080807D0078777400BEBDBC00EEEE
      ED00AEADAB005E5D590044423E004D4C48004D4C48004D4C48004D4C48004B4A
      460048464200484743008A898600D4D3D200B6382F00C81D1000CD150600CD18
      0A00CD180A00CD180A00CD180A00CD180A00CD180A00D1140500BE322700C690
      8C00EBD8D600D16E6700C0342E00C6463B00C4433900C1373000DE9C9600E4D2
      CF00BB686000C6211400D1130400CD180A00CD180A00CD180A00CD180A00CF17
      0900CF150600C2060000C84F4500D7A9A5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B7B4B200655C58004F443F00504E
      4A004D4C48004D4C48004D4C48004D4C48004D4C48004948440065646000B4B4
      B100FFFFFF00EEEDED00D6D5D500D6D6D600D6D6D500D9D9D800FBFBFB00EFEF
      EE0092918F0056545100484743004D4C48004B4A460049484400494743004B4B
      4700565452007A7B7800C1C1BE00FDFEFD00C2767000C9231700CD0E0000CE19
      0B00CD180A00CD180A00CD180A00CD180A00CD180A00D2180A00BB1E1200C87A
      7400FBFCFC00E3D1D000CDA29C00CFA5A100CFA4A000D0A8A400F0ECEB00EEDE
      DB00BA493F00C5180B00D1180A00CD180A00CE170900CD140500CC110300CA13
      0500C51A0C00C13A2F00DA9A9500FBF8F8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EAEAE9007C706D00534641004D4D
      48004D4C48004D4C48004D4C48004D4C48004D4C48004E4D49004E4D49008382
      7F00E6E5E500FFFFFF00F8F9F800F2F2F200F4F4F400FCFCFC00FFFFFE00C7C7
      C500656361004C4A47004E4D49004C4C47004C4C480050504C0053504C006060
      5D008E8D8D00DEE1E100FFFFFF00FFFFFF00E7D0CE00CE3A2F00CB0D0000CE1C
      0E00CD180A00CD180A00CD180A00CD180A00CD180A00CF1B0D00C40F0100C444
      3A00E2C6C400FCFEFE00FAF3F200EDDFDE00F2E6E500FFFCFC00F4F3F300D59B
      9600C0231600C9130400CF1B0E00CD180A00CD180A00CB190B00CC180900C023
      1500B7433A00E1C8C500FDFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FDFDFD00C4C8C600737874004343
      3E004B4A46004E4D49004C4B48004B4A46004A4944004C4B47004C4B47005756
      520073726F00858482008D8C89008E8D8B008D8D8A008C8B880081807D006868
      6400504F4B004C4B47004E4B47004E4D490064666200A1A4A100C1C1C000CCCA
      CA00E9E9E900FDFEFE00FFFFFF00FFFFFF00FCFAF900D5989300C6392E00C809
      0000CF150600CF190B00CD180A00CE170900CE160800CE180A00CC150700CA1F
      1200CD3E3200D0544A00CC584E00C7544A00C9554C00CF585000CF4E4300CC33
      2600CA180A00CC170800D01B0C00C9160800BE231700C7696200D3948E00DEA8
      A300EED8D600FAFAFA00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00F4F9F900C1C8C7008A89
      87006766630051504D00464540004A4945005958530052514E004C4B48004948
      440044433F004A494500504F4B0052514E0052514D004F4E4900484742004645
      40004B4A46004E4D49004A49450054534F0088878400DCDEDD00FBFCFC00FFFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EDE5E400DAA29D00C850
      4600BB211500C2110300C90C0000C50D0000BE150800C4150800CC170900CD15
      0700C90C0000C40B0000C10F0100C1120300C1110300C20D0000C50B0000CB0F
      0000CE170900CD180A00D1190900C5170A00B63B3100DBB8B600EDEAEA00F7F5
      F500FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00E3E2
      E100ACABAA008685830073726E007E7D7B00979794007C7C7900585754004A49
      45004C4B47004C4B47004B4A46004B4A46004B4A46004B4A46004C4B47004C4C
      48004D4C4800504E4A0042433D005B5B5700B2AFAD00F6F5F500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5F9F800DCBE
      BB00C3726B00C64D4300CD3C3200CB473D00C55B5200BD392E00C51B0E00D017
      0900CD180A00CE170900CE170900CE170900CE170900CE170900CE180A00CD18
      0A00CD180A00CD180A00D2100400C7201400BF6E6700F3E9E900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F1F1F100E4E4E400EEEEEE00FAFAFA00CACAC900797875004948
      43004D4C48004E4D49004D4C48004D4C48004D4C48004D4C48004D4C48004C4C
      48004D4C4800514D4900413D38006B6C6800DCDCDB00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EFE2E000E1C5C300ECDAD800F8F3F200CA938E00BF342900D113
      0400CD180A00CD180A00CD180A00CD180A00CD180A00CD180A00CD180A00CD18
      0A00CD180A00CD180A00CD060000CE382D00DABAB800F7F8F900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8F8F700A9A9A7005352
      4E004C4B47004C4B47004C4B47004D4C48004D4C48004D4C48004D4C48004E4D
      49004C4C4800454440005E5D5900AAAAA700FAFAFA00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FEFFFF00F9F9F900FCFBFB00FFFFFF00F4ECEB00D1777000BD09
      0000CE170900D01B0D00CD180A00CD180A00CD180A00CD180A00CD180A00CD18
      0A00CD180A00D2140500BE180D00C46C6500F8F4F400FEFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E1E1E0009392
      8F0053514E0045444000494843004B4A46004C4B47004C4B47004B4A46004847
      420044433F0059595500A2A1A000E6E6E500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E8C8C600C353
      4A00C1110300CC0F0000D0170900CE170900CE180A00CE180900CE170800D014
      0500CD0F0000BF150800C6675E00E2C8C500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFF00FFFFFF00DDDC
      DC008B8A880066656200565551004B4A4600494844004A49450051504C005756
      5200666562009D9C9900E4E3E300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8FCFD00E0C0
      BC00C6514700C5261A00C81A0D00C8110300C9100100C9100200C6130500C81B
      0E00CA2D2100C05B5300E3C7C400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F3F3F300C0C0BF008887850064636000595854005E5D5A0071706D009494
      9100C7C6C500F6F5F500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFE00FFFF
      FF00F1E5E400C7858000B63B3100C0221500C61C0F00C41E1100BA2A1E00B64B
      4200C98F8A00F4EAE900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F6F6F600E7E7E700DEDEDD00DBDBDA00DCDCDC00E1E1E000EBEB
      EA00F8F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFFFF00F3E9E800EED5D300F1CFCC00F2CECB00F2CECB00EFD1CF00EEDA
      D800F3EBEB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000200000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFFFFFF0000000000000000
      FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF0000000000000000
      FFC007FFFFC003FF0000000000000000FFC003FFFFC003FF0000000000000000
      FF8001FFFF8001FF0000000000000000FF8461FFFF8001FF0000000000000000
      FF8001FFFC00001F0000000000000000F800000FF800000F0000000000000000
      E0000003C0000003000000000000000080000001800000010000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0008000000000000000000000000000000040003000000010000000000000000
      000000030000000300000000000000008000000F8000000F0000000000000000
      E000003FC000003F0000000000000000F800007FF800003F0000000000000000
      FF80007FF880003F0000000000000000FFC000FFFFC000FF0000000000000000
      FFA001FFFFC001FF0000000000000000FFF003FFFFD003FF0000000000000000
      FFF807FFFFF007FF0000000000000000FFFFFFFFFFFFFFFF0000000000000000
      FFFFFFFFFFFFFFFF000000000000000000000000000000000000000000000000
      000000000000}
  end
  object AdoConnectCheckTimer: TTimer
    Enabled = False
    OnTimer = AdoConnectCheckTimerTimer
    Left = 248
    Top = 400
  end
  object ManagerControlProcessTimer: TTimer
    Enabled = False
    Interval = 5
    OnTimer = ManagerControlProcessTimerTimer
    Left = 336
    Top = 408
  end
  object NodeOpenCheckTimer: TTimer
    Enabled = False
    Interval = 100
    OnTimer = NodeOpenCheckTimerTimer
    Left = 592
    Top = 328
  end
  object TimeSyncTimer: TTimer
    Enabled = False
    OnTimer = TimeSyncTimerTimer
    Left = 128
    Top = 408
  end
  object ToDayTimer: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = ToDayTimerTimer
    Left = 168
    Top = 368
  end
  object CardDownLoadTimer: TTimer
    Enabled = False
    Interval = 300
    OnTimer = CardDownLoadTimerTimer
    Left = 592
    Top = 272
  end
  object FireRecoveryTimer: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = FireRecoveryTimerTimer
    Left = 640
    Top = 272
  end
  object FTPCardDownLoadTimer: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = FTPCardDownLoadTimerTimer
    Left = 696
    Top = 272
  end
  object NRCheckTimer: TTimer
    Enabled = False
    Interval = 60000
    OnTimer = NRCheckTimerTimer
    Left = 744
    Top = 272
  end
  object NFCheckTimer: TTimer
    Enabled = False
    Interval = 60000
    OnTimer = NFCheckTimerTimer
    Left = 784
    Top = 272
  end
  object StateCheckTimer: TTimer
    Enabled = False
    OnTimer = StateCheckTimerTimer
    Left = 824
    Top = 272
  end
  object RcvCheckTimer: TTimer
    Enabled = False
    Interval = 500
    OnTimer = RcvCheckTimerTimer
    Left = 864
    Top = 272
  end
  object PopupMenu1: TPopupMenu
    Left = 976
    Top = 288
    object mn_Test1: TMenuItem
      Caption = 'Test'#48372#51060#44592
      OnClick = mn_Test1Click
    end
  end
  object NodeSendPacketTimer: TTimer
    Enabled = False
    Interval = 20
    OnTimer = NodeSendPacketTimerTimer
    Left = 864
    Top = 200
  end
  object NodeRcvPacketTimer: TTimer
    Enabled = False
    Interval = 20
    OnTimer = NodeRcvPacketTimerTimer
    Left = 832
    Top = 200
  end
  object MemoryClearTimer: TTimer
    Interval = 3600000
    OnTimer = MemoryClearTimerTimer
    Left = 592
    Top = 384
  end
end
