inherited fmClientConfig: TfmClientConfig
  Left = 429
  Top = 345
  BorderIcons = [biSystemMenu]
  Caption = #54872#44221#49444#51221
  ClientHeight = 528
  ClientWidth = 711
  Font.Charset = HANGEUL_CHARSET
  Font.Height = -15
  OldCreateOrder = True
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 729
  ExplicitHeight = 573
  PixelsPerInch = 120
  TextHeight = 20
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
  object MediaPlayer1: TMediaPlayer [4]
    Left = 60
    Top = 313
    Width = 415
    Height = 51
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    AutoEnable = False
    Visible = False
    TabOrder = 1
  end
  object PageControl1: TPageControl [5]
    Left = 0
    Top = 0
    Width = 711
    Height = 457
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    ActivePage = TabSheet3
    Align = alTop
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    MultiLine = True
    ParentFont = False
    TabOrder = 0
    object AlarmTab: TTabSheet
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = #48169#48276#49444#51221
      ImageIndex = 1
      object gb_AlarmConfig: TGroupBox
        Left = 0
        Top = 0
        Width = 703
        Height = 268
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alTop
        Caption = #50508#46988#45936#51060#53552
        TabOrder = 0
        object lb_AlarmFile: TLabel
          Left = 40
          Top = 93
          Width = 60
          Height = 20
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #50508#46988#54028#51068
        end
        object lb_AlarmCount: TLabel
          Left = 40
          Top = 137
          Width = 90
          Height = 20
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #50508#46988#48156#49373#54943#49688
        end
        object lb_cnt: TLabel
          Left = 339
          Top = 137
          Width = 183
          Height = 20
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #54924'(0'#54924' '#51077#47141#49884' '#47924#51228#54620' '#48152#48373')'
        end
        object btn_Play: TSpeedButton
          Left = 512
          Top = 85
          Width = 39
          Height = 36
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC9169FBF7F4FF
            FFFFFFFFFFFFFFFFFBF7F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFCD883FCD8B57FCF8F6FFFFFFFFFFFFF9F4F2FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0AF69ECB741CE
            8852F8F0EAFFFFFFFAF5F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFDFAD6CF6D158EBB33BD08A48F3E2D7FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4B574F4D169F1
            C755F1C451D89546EDD3C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFE9BC7BF7DC7DF0C95FF5D469F7DA7DD38F50FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECC482F9E289F6
            DB7AF5DD90E2AB68FAF1E8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFEFC985FCF1A3F7DF96E7B672FBF4EDFFFEFDFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3D598FAECB6EA
            BB6DFDF8F3FFFFFFFDF8F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFF2CC76F1CB82FEFCF9FFFFFFFFFFFFFDF9F3FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4D184FEFBF5FF
            FFFFFFFFFFFFFFFFFEFBF6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          OnClick = btn_PlayClick
        end
        object btn_ArmSound: TSpeedButton
          Left = 257
          Top = 191
          Width = 160
          Height = 36
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #44221#44228#51020#49457#49440#53469
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC9169FBF7F4FF
            FFFFFFFFFFFFFFFFFBF7F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFCD883FCD8B57FCF8F6FFFFFFFFFFFFF9F4F2FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0AF69ECB741CE
            8852F8F0EAFFFFFFFAF5F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFDFAD6CF6D158EBB33BD08A48F3E2D7FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4B574F4D169F1
            C755F1C451D89546EDD3C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFE9BC7BF7DC7DF0C95FF5D469F7DA7DD38F50FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECC482F9E289F6
            DB7AF5DD90E2AB68FAF1E8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFEFC985FCF1A3F7DF96E7B672FBF4EDFFFEFDFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3D598FAECB6EA
            BB6DFDF8F3FFFFFFFDF8F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFF2CC76F1CB82FEFCF9FFFFFFFFFFFFFDF9F3FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4D184FEFBF5FF
            FFFFFFFFFFFFFFFFFEFBF6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          OnClick = btn_ArmSoundClick
        end
        object btn_DisArmSound: TSpeedButton
          Left = 439
          Top = 191
          Width = 160
          Height = 36
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #54644#51228#51020#49457#49440#53469
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC9169FBF7F4FF
            FFFFFFFFFFFFFFFFFBF7F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFCD883FCD8B57FCF8F6FFFFFFFFFFFFF9F4F2FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0AF69ECB741CE
            8852F8F0EAFFFFFFFAF5F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFDFAD6CF6D158EBB33BD08A48F3E2D7FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4B574F4D169F1
            C755F1C451D89546EDD3C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFE9BC7BF7DC7DF0C95FF5D469F7DA7DD38F50FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECC482F9E289F6
            DB7AF5DD90E2AB68FAF1E8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFEFC985FCF1A3F7DF96E7B672FBF4EDFFFEFDFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3D598FAECB6EA
            BB6DFDF8F3FFFFFFFDF8F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFF2CC76F1CB82FEFCF9FFFFFFFFFFFFFDF9F3FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4D184FEFBF5FF
            FFFFFFFFFFFFFFFFFEFBF6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          OnClick = btn_DisArmSoundClick
        end
        object chk_PTAlarm: TCheckBox
          Left = 40
          Top = 40
          Width = 255
          Height = 41
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #48169#48276' '#51060#49345#49884' '#50508#46988' '#48156#49373
          TabOrder = 0
        end
        object chk_PTMessage: TCheckBox
          Left = 333
          Top = 40
          Width = 255
          Height = 41
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #51316' '#44048#51648#49884' '#47700#49884#51648#54364#49884
          TabOrder = 1
        end
        object ed_AlarmSoundCount: TEdit
          Left = 180
          Top = 131
          Width = 148
          Height = 28
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          ImeName = 'Microsoft IME 2003'
          TabOrder = 2
        end
        object cmb_AlarmFile: TAdvComboBox
          Left = 180
          Top = 87
          Width = 321
          Height = 22
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Color = clWindow
          Version = '1.5.1.0'
          Visible = True
          ButtonWidth = 23
          Style = csOwnerDrawFixed
          EmptyTextStyle = []
          DropWidth = 0
          Enabled = True
          ImeName = 'Microsoft Office IME 2007'
          ItemIndex = -1
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'Tahoma'
          LabelFont.Style = []
          TabOrder = 3
        end
        object chk_ModeChangeSound: TCheckBox
          Left = 40
          Top = 185
          Width = 207
          Height = 42
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #47784#46300#48320#44221#49884' '#51020#49457#49569#52636
          TabOrder = 4
        end
        object ed_ModeChangeDisArmSound: TEdit
          Left = 440
          Top = 232
          Width = 148
          Height = 28
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          ImeName = 'Microsoft IME 2003'
          TabOrder = 5
          Visible = False
        end
        object ed_ModeChangeArmSound: TEdit
          Left = 257
          Top = 237
          Width = 148
          Height = 28
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          ImeName = 'Microsoft IME 2003'
          TabOrder = 6
          Visible = False
        end
      end
    end
    object TabAccess: TTabSheet
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = #52636#51077#49444#51221
      ImageIndex = 3
      object gb_AccessEvent: TGroupBox
        Left = 0
        Top = 0
        Width = 703
        Height = 120
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alTop
        Caption = #52636#51077#51060#48292#53944
        TabOrder = 0
        object lb_AccessAlarmFile: TLabel
          Left = 33
          Top = 37
          Width = 60
          Height = 20
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #50508#46988#54028#51068
        end
        object lb_AccessAlarmCount: TLabel
          Left = 33
          Top = 81
          Width = 90
          Height = 20
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #50508#46988#48156#49373#54943#49688
        end
        object lb_AccessAlarmCnt: TLabel
          Left = 339
          Top = 76
          Width = 183
          Height = 20
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #54924'(0'#54924' '#51077#47141#49884' '#47924#51228#54620' '#48152#48373')'
        end
        object btn_AccessAlarmPlay: TSpeedButton
          Left = 512
          Top = 29
          Width = 39
          Height = 36
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC9169FBF7F4FF
            FFFFFFFFFFFFFFFFFBF7F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFCD883FCD8B57FCF8F6FFFFFFFFFFFFF9F4F2FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0AF69ECB741CE
            8852F8F0EAFFFFFFFAF5F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFDFAD6CF6D158EBB33BD08A48F3E2D7FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4B574F4D169F1
            C755F1C451D89546EDD3C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFE9BC7BF7DC7DF0C95FF5D469F7DA7DD38F50FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECC482F9E289F6
            DB7AF5DD90E2AB68FAF1E8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFEFC985FCF1A3F7DF96E7B672FBF4EDFFFEFDFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3D598FAECB6EA
            BB6DFDF8F3FFFFFFFDF8F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFF2CC76F1CB82FEFCF9FFFFFFFFFFFFFDF9F3FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4D184FEFBF5FF
            FFFFFFFFFFFFFFFFFEFBF6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          OnClick = btn_AccessAlarmPlayClick
        end
        object ed_AccessSoundCount: TEdit
          Left = 180
          Top = 75
          Width = 148
          Height = 28
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          ImeName = 'Microsoft IME 2003'
          TabOrder = 0
        end
        object cmb_AccessAlarmFile: TAdvComboBox
          Left = 180
          Top = 31
          Width = 321
          Height = 22
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Color = clWindow
          Version = '1.5.1.0'
          Visible = True
          ButtonWidth = 23
          Style = csOwnerDrawFixed
          EmptyTextStyle = []
          DropWidth = 0
          Enabled = True
          ImeName = 'Microsoft Office IME 2007'
          ItemIndex = -1
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'Tahoma'
          LabelFont.Style = []
          TabOrder = 1
        end
      end
      object chk_CardMode: TAdvOfficeCheckBox
        Left = 5
        Top = 131
        Width = 200
        Height = 33
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        TabOrder = 1
        Alignment = taLeftJustify
        Caption = #52852#46300#50868#50689#47784#46300' '#49324#50857
        ReturnIsTab = False
        Version = '1.3.7.0'
      end
      object chk_DoorLongTimeOpen: TAdvOfficeCheckBox
        Left = 229
        Top = 131
        Width = 247
        Height = 33
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        TabOrder = 2
        Alignment = taLeftJustify
        Caption = #51109#49884#44036#52636#51077#47928#50676#47548#49884' '#50508#46988#48156#49373
        ReturnIsTab = False
        Version = '1.3.7.0'
      end
    end
    object tab_Attend: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #44540#53468#49444#51221
      ImageIndex = 3
      object Label8: TLabel
        Left = 29
        Top = 31
        Width = 120
        Height = 20
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = #44540#53468#50672#46041#49324#50857#50976#47924
      end
      object btn_FormatCreate: TSpeedButton
        Left = 524
        Top = 23
        Width = 160
        Height = 36
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = #54252#47607#49373#49457
        Enabled = False
        OnClick = btn_FormatCreateClick
      end
      object cmb_AttendRelayType: TAdvComboBox
        Left = 192
        Top = 25
        Width = 321
        Height = 22
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Color = clWindow
        Version = '1.5.1.0'
        Visible = True
        ButtonWidth = 23
        Style = csOwnerDrawFixed
        EmptyTextStyle = []
        DropWidth = 0
        Enabled = True
        ImeName = 'Microsoft Office IME 2007'
        ItemIndex = 0
        Items.Strings = (
          #49324#50857#50504#54632
          #53581#49828#53944'(TXT)'#54028#51068)
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -11
        LabelFont.Name = 'Tahoma'
        LabelFont.Style = []
        TabOrder = 0
        Text = #49324#50857#50504#54632
        OnChange = cmb_AttendRelayTypeChange
      end
    end
    object MonitoringTab: TTabSheet
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = #47784#45768#53552#47553#49444#51221
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImageIndex = 2
      ParentFont = False
      object gb_monitoring: TGroupBox
        Left = 0
        Top = 0
        Width = 703
        Height = 164
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alTop
        Caption = #47784#45768#53552#47553#54872#44221#49444#51221
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object lb_MonitoringStart: TLabel
          Left = 27
          Top = 40
          Width = 135
          Height = 20
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #47196#44536#51064#49884#47784#45768#53552#49884#51089
        end
        object lb_MonitoringType: TLabel
          Left = 27
          Top = 79
          Width = 95
          Height = 20
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #47784#45768#53552#47553' '#48169#48277
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          ParentFont = False
        end
        object lb_buildingDeep: TLabel
          Left = 27
          Top = 119
          Width = 60
          Height = 20
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #50948#52824#45800#44228
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          ParentFont = False
        end
        object cmb_LoginStart: TComboBox
          Left = 240
          Top = 35
          Width = 361
          Height = 22
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Style = csOwnerDrawFixed
          ImeName = 'Microsoft IME 2003'
          ItemIndex = 0
          TabOrder = 0
          Text = #47784#45768#53552#47553#49884#51089
          Items.Strings = (
            #47784#45768#53552#47553#49884#51089
            #47784#45768#53552#47553#50504#54632)
        end
        object cmb_MonitorType: TComboBox
          Left = 240
          Top = 73
          Width = 361
          Height = 22
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Style = csOwnerDrawFixed
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          ImeName = 'Microsoft IME 2003'
          ParentFont = False
          TabOrder = 1
          OnChange = cmb_MonitorTypeChange
          Items.Strings = (
            '0.'#48276#50857#47784#45768#53552#47553
            '1.'#47605#47784#45768#53552#47553
            '2.'#50948#52824#48324#47784#45768#53552#47553
            '3.'#51316#47605#47784#45768#53552#47553)
        end
        object cmb_buildingStep: TComboBox
          Left = 240
          Top = 113
          Width = 361
          Height = 22
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Style = csOwnerDrawFixed
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          ImeName = 'Microsoft IME 2003'
          ParentFont = False
          TabOrder = 2
          OnChange = cmb_MonitorTypeChange
          Items.Strings = (
            '1'#45800#44228
            '2'#45800#44228
            '3'#45800#44228)
        end
      end
      object chk_BuildingView: TAdvOfficeCheckBox
        Left = 27
        Top = 175
        Width = 200
        Height = 33
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Visible = False
        Alignment = taLeftJustify
        Caption = #48716#46377#54364#49884
        ReturnIsTab = False
        Version = '1.3.7.0'
      end
      object rg_MonitoringType: TAdvOfficeRadioGroup
        Left = 236
        Top = 175
        Width = 365
        Height = 72
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ImageIndex = 0
        Version = '1.3.7.0'
        Caption = #47784#45768#53552#47553#53440#51077
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
        Columns = 3
        Items.Strings = (
          #48169#48276'+'#52636#51077
          #52636#51077#51204#50857
          #48169#48276#51204#50857)
        Ellipsis = False
      end
    end
    object tab_regPort: TTabSheet
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = #46321#47197#44592#54252#53944#49444#51221
      ImageIndex = 6
      object lb_cardPort: TLabel
        Left = 13
        Top = 71
        Width = 75
        Height = 20
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = #46321#47197#44592#54252#53944
      end
      object lb_RegCardType: TLabel
        Left = 13
        Top = 27
        Width = 75
        Height = 20
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = #46321#47197#44592#53440#51077
      end
      object Label19: TLabel
        Left = 11
        Top = 107
        Width = 105
        Height = 20
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #51648#47928#46321#47197#44592#53440#51077
        Visible = False
      end
      object lb_FingerIP: TLabel
        Left = 13
        Top = 145
        Width = 43
        Height = 20
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #47532#45908'IP'
      end
      object lb_shFingerid: TLabel
        Left = 13
        Top = 184
        Width = 45
        Height = 20
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = #47532#45908'ID'
        Visible = False
      end
      object cmb_Comport: TComboBox
        Left = 227
        Top = 63
        Width = 214
        Height = 22
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Style = csOwnerDrawFixed
        ImeName = 'Microsoft Office IME 2007'
        TabOrder = 0
      end
      object cmb_RegType: TComboBox
        Left = 227
        Top = 20
        Width = 214
        Height = 22
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Style = csOwnerDrawFixed
        ImeName = 'Microsoft Office IME 2007'
        ItemIndex = 0
        TabOrder = 1
        Text = '0.RCU-100'
        OnChange = cmb_RegTypeChange
        Items.Strings = (
          '0.RCU-100'
          '1.Suprema Reader')
      end
      object ed_FingerIP: TEdit
        Left = 452
        Top = 60
        Width = 201
        Height = 28
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        ImeName = 'Microsoft Office IME 2007'
        TabOrder = 2
        Visible = False
      end
      object ed_FingerPort: TEdit
        Left = 473
        Top = 60
        Width = 202
        Height = 28
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        ImeName = 'Microsoft Office IME 2007'
        TabOrder = 3
        Text = '1471'
        Visible = False
      end
      object ed_shFingerIP: TEdit
        Left = 227
        Top = 141
        Width = 214
        Height = 28
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ImeName = 'Microsoft Office IME 2007'
        TabOrder = 4
        Text = '127.0.0.1'
      end
      object cmb_shFingerType: TComboBox
        Left = 227
        Top = 103
        Width = 214
        Height = 22
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Style = csOwnerDrawFixed
        ImeName = 'Microsoft Office IME 2007'
        ItemIndex = 0
        TabOrder = 5
        Text = #51648#47928#46321#47197#44592
        Visible = False
        OnChange = cmb_shFingerTypeChange
        Items.Strings = (
          #51648#47928#46321#47197#44592
          #49457#54788#51648#47928#47532#45908'('#44032#51256#50724#44592')'
          'IF-1000('#46321#47197#54616#44592')')
      end
      object ed_shFingerPort: TEdit
        Left = 473
        Top = 141
        Width = 202
        Height = 28
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        ImeName = 'Microsoft Office IME 2007'
        TabOrder = 6
        Text = '7005'
      end
      object ed_shFingerReaderID: TEdit
        Left = 227
        Top = 180
        Width = 214
        Height = 28
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ImeName = 'Microsoft Office IME 2007'
        TabOrder = 7
        Text = '1'
        Visible = False
      end
    end
    object TabSheet1: TTabSheet
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = #54868#47732
      ImageIndex = 4
      TabVisible = False
      object Label6: TLabel
        Left = 45
        Top = 57
        Width = 35
        Height = 20
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Style:'
      end
      object cmb_FormStyle: TComboBox
        Left = 115
        Top = 52
        Width = 242
        Height = 28
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Style = csDropDownList
        ImeName = 'Microsoft IME 2010'
        TabOrder = 0
        OnClick = cmb_FormStyleClick
        Items.Strings = (
          'Office 2010 Blue'
          'Office 2010 Silver'
          'Office 2010 Black'
          'Office2013Gray'
          'Office2013LightGray'
          'Office2013White'
          'Metro Light'
          'Metro Dark')
      end
    end
    object Tab_Report: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #48372#44256#49436
      ImageIndex = 5
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 703
        Height = 183
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alTop
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object Label1: TLabel
          Left = 32
          Top = 37
          Width = 60
          Height = 20
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #54268#49373#49457#49884
        end
        object Label4: TLabel
          Left = 32
          Top = 77
          Width = 90
          Height = 20
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #54028#51068#51200#51109#54252#47607
        end
        object Label5: TLabel
          Left = 32
          Top = 117
          Width = 90
          Height = 20
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #49548#49549#51312#54924#45800#44228
        end
        object cmb_ReportStart: TComboBox
          Left = 245
          Top = 32
          Width = 223
          Height = 22
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Style = csOwnerDrawFixed
          ImeName = 'Microsoft IME 2003'
          ItemIndex = 0
          TabOrder = 0
          Text = #48372#44256#49436' '#51312#54924
          OnChange = cmb_ReportStartChange
          Items.Strings = (
            #48372#44256#49436' '#51312#54924
            #48372#44256#49436' '#51312#54924' '#50504#54632'('#51312#54924#48260#53948#51004#47196#47564' '#51312#54924#46120')')
        end
        object cmb_FileFormat: TComboBox
          Left = 245
          Top = 72
          Width = 426
          Height = 22
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Style = csOwnerDrawFixed
          ImeName = 'Microsoft IME 2003'
          ItemIndex = 0
          TabOrder = 1
          Text = 'Excel'
          Items.Strings = (
            'Excel'
            'CSV')
        end
        object rg_FormEnable: TRadioGroup
          Left = 477
          Top = 19
          Width = 194
          Height = 44
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Enable'
            'Disable')
          TabOrder = 2
          Visible = False
        end
        object cmb_CompanyStep: TComboBox
          Left = 245
          Top = 112
          Width = 223
          Height = 22
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Style = csOwnerDrawFixed
          ImeName = 'Microsoft IME 2003'
          ItemIndex = 2
          TabOrder = 3
          Text = 'step 3'
          OnChange = cmb_ReportStartChange
          Items.Strings = (
            'step 1'
            'step 2'
            'step 3'
            'step 4'
            'step 5'
            'step 6'
            'step 7')
        end
      end
    end
    object TabSheet2: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #53945#54868#49884#49828#53596
      ImageIndex = 6
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 703
        Height = 183
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alTop
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object Label2: TLabel
          Left = 27
          Top = 40
          Width = 150
          Height = 20
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #52636#51077#47928#50676#47548#49884#50508#46988#48156#49373
        end
        object Label3: TLabel
          Left = 27
          Top = 79
          Width = 60
          Height = 20
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #50508#46988#54028#51068
        end
        object btn_DoorOpenSoundPlay: TSpeedButton
          Left = 572
          Top = 73
          Width = 39
          Height = 36
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC9169FBF7F4FF
            FFFFFFFFFFFFFFFFFBF7F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFCD883FCD8B57FCF8F6FFFFFFFFFFFFF9F4F2FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0AF69ECB741CE
            8852F8F0EAFFFFFFFAF5F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFDFAD6CF6D158EBB33BD08A48F3E2D7FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4B574F4D169F1
            C755F1C451D89546EDD3C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFE9BC7BF7DC7DF0C95FF5D469F7DA7DD38F50FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECC482F9E289F6
            DB7AF5DD90E2AB68FAF1E8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFEFC985FCF1A3F7DF96E7B672FBF4EDFFFEFDFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3D598FAECB6EA
            BB6DFDF8F3FFFFFFFDF8F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFF2CC76F1CB82FEFCF9FFFFFFFFFFFFFDF9F3FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4D184FEFBF5FF
            FFFFFFFFFFFFFFFFFEFBF6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          OnClick = btn_DoorOpenSoundPlayClick
        end
        object cmb_DoorOpenAlarmUse: TComboBox
          Left = 240
          Top = 35
          Width = 361
          Height = 22
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Style = csOwnerDrawFixed
          ImeName = 'Microsoft IME 2003'
          ItemIndex = 0
          TabOrder = 0
          Text = #48120#49324#50857
          Items.Strings = (
            #48120#49324#50857
            #49324#50857)
        end
        object cmb_DoorOpenAlarm: TAdvComboBox
          Left = 240
          Top = 75
          Width = 321
          Height = 22
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Color = clWindow
          Version = '1.5.1.0'
          Visible = True
          ButtonWidth = 23
          Style = csOwnerDrawFixed
          EmptyTextStyle = []
          DropWidth = 0
          Enabled = True
          ImeName = 'Microsoft Office IME 2007'
          ItemIndex = -1
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'Tahoma'
          LabelFont.Style = []
          TabOrder = 1
        end
        object btn_DoorOpenCheck: TAdvGlowButton
          Left = 240
          Top = 115
          Width = 321
          Height = 33
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #52636#51077#47928#49444#51221
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          NotesFont.Charset = DEFAULT_CHARSET
          NotesFont.Color = clWindowText
          NotesFont.Height = -11
          NotesFont.Name = 'Tahoma'
          NotesFont.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = btn_DoorOpenCheckClick
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
    end
    object TabSheet3: TTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = #54532#47196#44536#47016
      ImageIndex = 7
      object lb_language: TLabel
        Left = 21
        Top = 28
        Width = 30
        Height = 20
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = #50616#50612
      end
      object lb_ChildGradeSync: TLabel
        Left = 21
        Top = 67
        Width = 105
        Height = 20
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = #49345#50948#44428#54620#46041#44592#54868
      end
      object Label7: TLabel
        Left = 21
        Top = 107
        Width = 60
        Height = 20
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = #49324#50896#44288#47532
      end
      object cmb_Language: TComboBox
        Left = 149
        Top = 23
        Width = 362
        Height = 28
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Style = csOwnerDrawFixed
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ImeName = 'Microsoft IME 2003'
        ItemHeight = 22
        ItemIndex = 0
        ParentFont = False
        TabOrder = 0
        Text = '1.KOR'
        Items.Strings = (
          '1.KOR'
          '2.ENG'
          '3.CHINA')
      end
      object cmb_ChildGradeSync: TComboBox
        Left = 149
        Top = 63
        Width = 362
        Height = 28
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Style = csOwnerDrawFixed
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ImeName = 'Microsoft IME 2003'
        ItemHeight = 22
        ItemIndex = 0
        ParentFont = False
        TabOrder = 1
        Text = '0.Not Sync'
        Items.Strings = (
          '0.Not Sync'
          '1.Sync')
      end
      object cmb_EmployeeStart: TComboBox
        Left = 149
        Top = 103
        Width = 362
        Height = 28
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Style = csOwnerDrawFixed
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ImeName = 'Microsoft IME 2003'
        ItemHeight = 22
        ItemIndex = 0
        ParentFont = False
        TabOrder = 2
        Text = #49324#50896' '#51312#54924
        OnChange = cmb_ReportStartChange
        Items.Strings = (
          #49324#50896' '#51312#54924
          #49324#50896' '#51312#54924' '#50504#54632'('#51312#54924#48260#53948#51004#47196#47564' '#51312#54924#46120')')
      end
      object gb_AutoLogOut: TAdvGroupBox
        Left = 21
        Top = 135
        Width = 490
        Height = 73
        Caption = #51088#46041#47196#44536#50500#50883#49444#51221
        TabOrder = 3
        Visible = False
        object Label9: TLabel
          Left = 177
          Top = 37
          Width = 35
          Height = 20
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = #48516' '#54980
        end
        object chk_AutoLogOut: TAdvOfficeCheckBox
          Left = 16
          Top = 32
          Width = 120
          Height = 25
          TabOrder = 0
          Alignment = taLeftJustify
          Caption = #51088#46041#47196#44536#50500#50883
          ReturnIsTab = False
          Version = '1.3.7.0'
        end
        object ed_AutoLogoutTime: TAdvEdit
          Left = 142
          Top = 32
          Width = 27
          Height = 26
          EmptyTextStyle = []
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -13
          LabelFont.Name = 'Tahoma'
          LabelFont.Style = []
          Lookup.Font.Charset = DEFAULT_CHARSET
          Lookup.Font.Color = clWindowText
          Lookup.Font.Height = -13
          Lookup.Font.Name = 'Arial'
          Lookup.Font.Style = []
          Lookup.Separator = ';'
          Color = clWindow
          TabOrder = 1
          Text = '1'
          Visible = True
          Version = '3.3.2.0'
        end
      end
    end
  end
  object btn_Save: TAdvGlowButton [6]
    Left = 197
    Top = 467
    Width = 134
    Height = 33
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = #51200#51109
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    NotesFont.Charset = DEFAULT_CHARSET
    NotesFont.Color = clWindowText
    NotesFont.Height = -11
    NotesFont.Name = 'Tahoma'
    NotesFont.Style = []
    ParentFont = False
    TabOrder = 2
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
  object btn_Close: TAdvGlowButton [7]
    Left = 340
    Top = 467
    Width = 133
    Height = 33
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = #45803#44592
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    NotesFont.Charset = DEFAULT_CHARSET
    NotesFont.Color = clWindowText
    NotesFont.Height = -11
    NotesFont.Name = 'Tahoma'
    NotesFont.Style = []
    ParentFont = False
    TabOrder = 5
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
  object RzOpenDialog1: TOpenDialog
    Left = 44
    Top = 260
  end
  object fdmsADOQuery: TADOQuery
    Parameters = <>
    Left = 192
    Top = 272
  end
  object FindFile: TFindFile
    OnFileMatch = FindFileFileMatch
    Left = 113
    Top = 271
  end
  object AdvOfficeTabSetOfficeStyler1: TAdvOfficeTabSetOfficeStyler
    ButtonBorderColor = clNone
    GlowButtonAppearance.BorderColor = 13948116
    GlowButtonAppearance.BorderColorHot = 15381630
    GlowButtonAppearance.BorderColorDown = 15048022
    GlowButtonAppearance.BorderColorChecked = 16750899
    GlowButtonAppearance.BorderColorDisabled = 11316396
    GlowButtonAppearance.ColorTo = clNone
    GlowButtonAppearance.ColorChecked = 16750899
    GlowButtonAppearance.ColorCheckedTo = clNone
    GlowButtonAppearance.ColorDisabled = 15658734
    GlowButtonAppearance.ColorDisabledTo = clNone
    GlowButtonAppearance.ColorDown = 16573128
    GlowButtonAppearance.ColorDownTo = clNone
    GlowButtonAppearance.ColorHot = 16576740
    GlowButtonAppearance.ColorHotTo = clNone
    GlowButtonAppearance.ColorMirror = clWhite
    GlowButtonAppearance.ColorMirrorTo = clNone
    GlowButtonAppearance.ColorMirrorHot = 16576740
    GlowButtonAppearance.ColorMirrorHotTo = clNone
    GlowButtonAppearance.ColorMirrorDown = 16573128
    GlowButtonAppearance.ColorMirrorDownTo = clNone
    GlowButtonAppearance.ColorMirrorChecked = 16750899
    GlowButtonAppearance.ColorMirrorCheckedTo = clNone
    GlowButtonAppearance.ColorMirrorDisabled = 15658734
    GlowButtonAppearance.ColorMirrorDisabledTo = 15921906
    GlowButtonAppearance.GradientHot = ggVertical
    GlowButtonAppearance.GradientMirrorHot = ggVertical
    GlowButtonAppearance.GradientDown = ggVertical
    GlowButtonAppearance.GradientMirrorDown = ggVertical
    GlowButtonAppearance.GradientChecked = ggVertical
    TabRounding = 0
    Style = tsOffice2013White
    TabAppearance.BorderColor = clNone
    TabAppearance.BorderColorHot = clNone
    TabAppearance.BorderColorSelected = 13948116
    TabAppearance.BorderColorSelectedHot = 13948116
    TabAppearance.BorderColorDisabled = clNone
    TabAppearance.BorderColorDown = 13948116
    TabAppearance.Color = clBtnFace
    TabAppearance.ColorTo = clWhite
    TabAppearance.ColorSelected = clWhite
    TabAppearance.ColorSelectedTo = clNone
    TabAppearance.ColorDisabled = 15658734
    TabAppearance.ColorDisabledTo = clNone
    TabAppearance.ColorHot = clWhite
    TabAppearance.ColorHotTo = clNone
    TabAppearance.ColorMirror = clWhite
    TabAppearance.ColorMirrorTo = clWhite
    TabAppearance.ColorMirrorHot = clWhite
    TabAppearance.ColorMirrorHotTo = clNone
    TabAppearance.ColorMirrorSelected = clWhite
    TabAppearance.ColorMirrorSelectedTo = clNone
    TabAppearance.ColorMirrorDisabled = 15658734
    TabAppearance.ColorMirrorDisabledTo = clNone
    TabAppearance.Font.Charset = DEFAULT_CHARSET
    TabAppearance.Font.Color = clWindowText
    TabAppearance.Font.Height = -11
    TabAppearance.Font.Name = 'Tahoma'
    TabAppearance.Font.Style = []
    TabAppearance.Gradient = ggVertical
    TabAppearance.GradientMirror = ggVertical
    TabAppearance.GradientHot = ggVertical
    TabAppearance.GradientMirrorHot = ggVertical
    TabAppearance.GradientSelected = ggVertical
    TabAppearance.GradientMirrorSelected = ggVertical
    TabAppearance.GradientDisabled = ggVertical
    TabAppearance.GradientMirrorDisabled = ggVertical
    TabAppearance.TextColor = clBlack
    TabAppearance.TextColorHot = clBlack
    TabAppearance.TextColorSelected = clBlack
    TabAppearance.TextColorDisabled = clGray
    TabAppearance.ShadowColor = clNone
    TabAppearance.HighLightColorSelected = clNone
    TabAppearance.HighLightColorHot = clNone
    TabAppearance.HighLightColorSelectedHot = clNone
    TabAppearance.HighLightColorDown = clNone
    TabAppearance.BackGround.Color = clWhite
    TabAppearance.BackGround.ColorTo = clNone
    TabAppearance.BackGround.Direction = gdHorizontal
    Left = 112
    Top = 128
  end
  object AdvToolBarOfficeStyler1: TAdvToolBarOfficeStyler
    AppColor.AppButtonColor = 13005312
    AppColor.AppButtonHoverColor = 16755772
    AppColor.TextColor = clWhite
    AppColor.HoverColor = 16246477
    AppColor.HoverTextColor = clBlack
    AppColor.HoverBorderColor = 15187578
    AppColor.SelectedColor = 15187578
    AppColor.SelectedTextColor = clBlack
    AppColor.SelectedBorderColor = 15187578
    Style = bsOffice2013White
    BackGroundDisplay = bdStretch
    BorderColor = clSilver
    BorderColorHot = 15590880
    ButtonAppearance.Color = clWhite
    ButtonAppearance.ColorTo = 15590880
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
    CaptionAppearance.CaptionColor = 15921133
    CaptionAppearance.CaptionColorTo = 15921133
    CaptionAppearance.CaptionTextColor = 6774616
    CaptionAppearance.CaptionBorderColor = 15921133
    CaptionAppearance.CaptionColorHot = 16250355
    CaptionAppearance.CaptionColorHotTo = 16250355
    CaptionAppearance.CaptionTextColorHot = 6774616
    CaptionAppearance.CaptionBorderColorHot = 15921133
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
    Color.Mirror.Color = 16777214
    Color.Mirror.ColorTo = 16777214
    Color.Mirror.ColorMirror = 16777214
    Color.Mirror.ColorMirrorTo = 15921133
    ColorHot.Color = 16777214
    ColorHot.ColorTo = 16777214
    ColorHot.Direction = gdVertical
    ColorHot.Mirror.Color = 16777214
    ColorHot.Mirror.ColorTo = 16777214
    ColorHot.Mirror.ColorMirror = 16777214
    ColorHot.Mirror.ColorMirrorTo = 16250355
    CompactGlowButtonAppearance.BorderColor = 13815240
    CompactGlowButtonAppearance.BorderColorHot = 5819121
    CompactGlowButtonAppearance.BorderColorDown = 3181250
    CompactGlowButtonAppearance.BorderColorChecked = 3181250
    CompactGlowButtonAppearance.ColorTo = 15590880
    CompactGlowButtonAppearance.ColorChecked = 14285309
    CompactGlowButtonAppearance.ColorCheckedTo = 7131391
    CompactGlowButtonAppearance.ColorDisabled = clNone
    CompactGlowButtonAppearance.ColorDisabledTo = clNone
    CompactGlowButtonAppearance.ColorDown = 7131391
    CompactGlowButtonAppearance.ColorDownTo = 8122111
    CompactGlowButtonAppearance.ColorHot = 9102333
    CompactGlowButtonAppearance.ColorHotTo = 14285309
    CompactGlowButtonAppearance.ColorMirror = 15590880
    CompactGlowButtonAppearance.ColorMirrorTo = 15590880
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
    FloatingWindowBorderColor = 13486790
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clBlack
    Font.Height = -27
    Font.Name = 'Segoe UI'
    Font.Style = []
    GlowButtonAppearance.BorderColor = clWhite
    GlowButtonAppearance.BorderColorHot = 15187578
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
    GroupAppearance.CaptionAppearance.CaptionColor = 15921133
    GroupAppearance.CaptionAppearance.CaptionColorTo = 15921133
    GroupAppearance.CaptionAppearance.CaptionTextColor = 6774616
    GroupAppearance.CaptionAppearance.CaptionBorderColor = 15921133
    GroupAppearance.CaptionAppearance.CaptionColorHot = 16250355
    GroupAppearance.CaptionAppearance.CaptionColorHotTo = 16250355
    GroupAppearance.CaptionAppearance.CaptionTextColorHot = 6774616
    GroupAppearance.CaptionAppearance.CaptionBorderColorHot = 15921133
    GroupAppearance.PageAppearance.BorderColor = 15921133
    GroupAppearance.PageAppearance.Color = 16777214
    GroupAppearance.PageAppearance.ColorTo = 16777214
    GroupAppearance.PageAppearance.ColorMirror = 16777214
    GroupAppearance.PageAppearance.ColorMirrorTo = 15921133
    GroupAppearance.PageAppearance.Gradient = ggVertical
    GroupAppearance.PageAppearance.GradientMirror = ggVertical
    GroupAppearance.PageAppearance.ShadowColor = clGray
    GroupAppearance.PageAppearance.HighLightColor = clSilver
    GroupAppearance.TabAppearance.BorderColor = 13815240
    GroupAppearance.TabAppearance.BorderColorHot = 1340927
    GroupAppearance.TabAppearance.BorderColorSelected = 1340927
    GroupAppearance.TabAppearance.BorderColorSelectedHot = 1340927
    GroupAppearance.TabAppearance.BorderColorDisabled = clNone
    GroupAppearance.TabAppearance.BorderColorDown = 14404026
    GroupAppearance.TabAppearance.Color = clWhite
    GroupAppearance.TabAppearance.ColorTo = clWhite
    GroupAppearance.TabAppearance.ColorSelected = 16777214
    GroupAppearance.TabAppearance.ColorSelectedTo = 16777214
    GroupAppearance.TabAppearance.ColorDisabled = 15921906
    GroupAppearance.TabAppearance.ColorDisabledTo = 15921906
    GroupAppearance.TabAppearance.ColorHot = 16777214
    GroupAppearance.TabAppearance.ColorHotTo = 16777214
    GroupAppearance.TabAppearance.ColorMirror = clWhite
    GroupAppearance.TabAppearance.ColorMirrorTo = clWhite
    GroupAppearance.TabAppearance.ColorMirrorHot = 16777214
    GroupAppearance.TabAppearance.ColorMirrorHotTo = 16777214
    GroupAppearance.TabAppearance.ColorMirrorSelected = 16777214
    GroupAppearance.TabAppearance.ColorMirrorSelectedTo = 16777214
    GroupAppearance.TabAppearance.ColorMirrorDisabled = 15921906
    GroupAppearance.TabAppearance.ColorMirrorDisabledTo = 15921906
    GroupAppearance.TabAppearance.Font.Charset = DEFAULT_CHARSET
    GroupAppearance.TabAppearance.Font.Color = clWindowText
    GroupAppearance.TabAppearance.Font.Height = -11
    GroupAppearance.TabAppearance.Font.Name = 'Segoe UI'
    GroupAppearance.TabAppearance.Font.Style = []
    GroupAppearance.TabAppearance.Gradient = ggVertical
    GroupAppearance.TabAppearance.GradientMirror = ggVertical
    GroupAppearance.TabAppearance.GradientHot = ggVertical
    GroupAppearance.TabAppearance.GradientMirrorHot = ggVertical
    GroupAppearance.TabAppearance.GradientSelected = ggVertical
    GroupAppearance.TabAppearance.GradientMirrorSelected = ggVertical
    GroupAppearance.TabAppearance.GradientDisabled = ggVertical
    GroupAppearance.TabAppearance.GradientMirrorDisabled = ggVertical
    GroupAppearance.TabAppearance.TextColor = 6381406
    GroupAppearance.TabAppearance.TextColorHot = 6774616
    GroupAppearance.TabAppearance.TextColorSelected = 6774616
    GroupAppearance.TabAppearance.TextColorDisabled = clGray
    GroupAppearance.TabAppearance.ShadowColor = 12565174
    GroupAppearance.TabAppearance.HighLightColor = 16775871
    GroupAppearance.TabAppearance.HighLightColorHot = 16777214
    GroupAppearance.TabAppearance.HighLightColorSelected = 13815240
    GroupAppearance.TabAppearance.HighLightColorSelectedHot = 15590880
    GroupAppearance.TabAppearance.HighLightColorDown = 16119026
    GroupAppearance.ToolBarAppearance.BorderColor = 15921133
    GroupAppearance.ToolBarAppearance.BorderColorHot = 13092807
    GroupAppearance.ToolBarAppearance.Color.Color = 16777214
    GroupAppearance.ToolBarAppearance.Color.ColorTo = 15921133
    GroupAppearance.ToolBarAppearance.Color.Direction = gdHorizontal
    GroupAppearance.ToolBarAppearance.ColorHot.Color = 16777214
    GroupAppearance.ToolBarAppearance.ColorHot.ColorTo = 16250355
    GroupAppearance.ToolBarAppearance.ColorHot.Direction = gdHorizontal
    PageAppearance.BorderColor = 15921133
    PageAppearance.Color = 16777214
    PageAppearance.ColorTo = 16777214
    PageAppearance.ColorMirror = 16777214
    PageAppearance.ColorMirrorTo = 15921133
    PageAppearance.Gradient = ggVertical
    PageAppearance.GradientMirror = ggVertical
    PageAppearance.ShadowColor = clGray
    PageAppearance.HighLightColor = clSilver
    PagerCaption.BorderColor = 13815240
    PagerCaption.Color = 13946827
    PagerCaption.ColorTo = 13946827
    PagerCaption.ColorMirror = 13946827
    PagerCaption.ColorMirrorTo = 13946827
    PagerCaption.Gradient = ggVertical
    PagerCaption.GradientMirror = ggVertical
    PagerCaption.TextColor = clGray
    PagerCaption.TextColorExtended = clBlue
    PagerCaption.Font.Charset = DEFAULT_CHARSET
    PagerCaption.Font.Color = clWindowText
    PagerCaption.Font.Height = -17
    PagerCaption.Font.Name = 'Segoe UI'
    PagerCaption.Font.Style = []
    QATAppearance.BorderColor = 13815240
    QATAppearance.Color = clWhite
    QATAppearance.ColorTo = 15590880
    QATAppearance.FullSizeBorderColor = 13815240
    QATAppearance.FullSizeColor = clWhite
    QATAppearance.FullSizeColorTo = 15590880
    RightHandleColor = clSilver
    RightHandleColorTo = clSilver
    RightHandleColorHot = clGray
    RightHandleColorHotTo = clGray
    RightHandleColorDown = clGray
    RightHandleColorDownTo = clGray
    TabAppearance.BorderColor = 13815240
    TabAppearance.BorderColorHot = 12236209
    TabAppearance.BorderColorSelected = 12565174
    TabAppearance.BorderColorSelectedHot = 12236209
    TabAppearance.BorderColorDisabled = clNone
    TabAppearance.BorderColorDown = 14404026
    TabAppearance.Color = clWhite
    TabAppearance.ColorTo = clWhite
    TabAppearance.ColorSelected = 16777214
    TabAppearance.ColorSelectedTo = 16777214
    TabAppearance.ColorDisabled = 15921906
    TabAppearance.ColorDisabledTo = 15921906
    TabAppearance.ColorHot = 16777214
    TabAppearance.ColorHotTo = 16777214
    TabAppearance.ColorMirror = clWhite
    TabAppearance.ColorMirrorTo = clWhite
    TabAppearance.ColorMirrorHot = 16777214
    TabAppearance.ColorMirrorHotTo = 16777214
    TabAppearance.ColorMirrorSelected = 16777214
    TabAppearance.ColorMirrorSelectedTo = 16777214
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
    TabAppearance.TextColor = 6381406
    TabAppearance.TextColorHot = 6774616
    TabAppearance.TextColorSelected = 6774616
    TabAppearance.TextColorDisabled = clGray
    TabAppearance.ShadowColor = 12565174
    TabAppearance.HighLightColor = 16775871
    TabAppearance.HighLightColorHot = 16777214
    TabAppearance.HighLightColorSelected = 13815240
    TabAppearance.HighLightColorSelectedHot = 15590880
    TabAppearance.HighLightColorDown = 16119026
    TabAppearance.BackGround.Color = 16446701
    TabAppearance.BackGround.ColorTo = 16710906
    TabAppearance.BackGround.Direction = gdVertical
    Left = 68
    Top = 300
  end
  object AdvFormStyler1: TAdvFormStyler
    MetroColor = clSkyBlue
    Style = tsOffice2013White
    Left = 142
    Top = 280
  end
end