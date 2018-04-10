object fmMain: TfmMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'DeviceServer_Manager'
  ClientHeight = 927
  ClientWidth = 696
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = #47569#51008' '#44256#46357
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 20
  object AdvGroupBox1: TAdvGroupBox
    Left = 0
    Top = 0
    Width = 696
    Height = 119
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    Caption = 'DeviceServer'#44288#47532
    TabOrder = 0
    object btn_PGUpdate: TSpeedButton
      Left = 21
      Top = 32
      Width = 158
      Height = 29
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'DeviceServer Update'
      OnClick = btn_PGUpdateClick
    end
    object btn_ServerRestart: TSpeedButton
      Left = 21
      Top = 69
      Width = 158
      Height = 30
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'DeviceServer Restart'
      OnClick = btn_ServerRestartClick
    end
    object btn_DataBaseBackupConfig: TSpeedButton
      Left = 491
      Top = 69
      Width = 184
      Height = 30
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Server Config'
      OnClick = btn_DataBaseBackupConfigClick
    end
    object btn_DbBackup: TSpeedButton
      Left = 187
      Top = 69
      Width = 157
      Height = 30
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'db backup'
      OnClick = btn_DbBackupClick
    end
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 119
    Width = 696
    Height = 808
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    TabOrder = 1
    object FlowPanel1: TFlowPanel
      Left = 0
      Top = 0
      Width = 692
      Height = 785
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      TabOrder = 0
      object pan_state1: TPanel
        Tag = 1
        Left = 1
        Top = 1
        Width = 686
        Height = 54
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 0
        Visible = False
        object lb_DeviceState1: TLabel
          Left = 32
          Top = 20
          Width = 139
          Height = 20
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'DeviceServer  1 '#49345#53468
        end
        object btn_Start1: TSpeedButton
          Left = 363
          Top = 13
          Width = 97
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Start'
          OnClick = btn_Start1Click
        end
        object btn_Stop1: TSpeedButton
          Left = 468
          Top = 13
          Width = 97
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Stop'
          Enabled = False
          OnClick = btn_Stop1Click
        end
        object btn_ServerShow1: TSpeedButton
          Tag = 1
          Left = 573
          Top = 13
          Width = 98
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #54868#47732#48372#44592
          Enabled = False
          OnClick = btn_ServerShow1Click
        end
        object pan_DeviceState1: TPanel
          Left = 203
          Top = 13
          Width = 65
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #51221#51648
          Color = clRed
          ParentBackground = False
          TabOrder = 0
        end
      end
      object pan_state2: TPanel
        Tag = 2
        Left = 1
        Top = 55
        Width = 686
        Height = 53
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 1
        Visible = False
        object lb_DeviceState2: TLabel
          Left = 32
          Top = 20
          Width = 139
          Height = 20
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'DeviceServer  1 '#49345#53468
        end
        object btn_Start2: TSpeedButton
          Left = 363
          Top = 13
          Width = 97
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Start'
          OnClick = btn_Start1Click
        end
        object btn_Stop2: TSpeedButton
          Left = 468
          Top = 13
          Width = 97
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Stop'
          Enabled = False
          OnClick = btn_Stop1Click
        end
        object btn_ServerShow2: TSpeedButton
          Tag = 2
          Left = 573
          Top = 13
          Width = 98
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #54868#47732#48372#44592
          Enabled = False
          OnClick = btn_ServerShow1Click
        end
        object pan_DeviceState2: TPanel
          Left = 203
          Top = 13
          Width = 65
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #51221#51648
          Color = clRed
          ParentBackground = False
          TabOrder = 0
        end
      end
      object pan_state3: TPanel
        Tag = 3
        Left = 1
        Top = 108
        Width = 686
        Height = 53
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 2
        Visible = False
        object lb_DeviceState3: TLabel
          Left = 32
          Top = 20
          Width = 139
          Height = 20
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'DeviceServer  1 '#49345#53468
        end
        object btn_Start3: TSpeedButton
          Left = 363
          Top = 13
          Width = 97
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Start'
          OnClick = btn_Start1Click
        end
        object btn_Stop3: TSpeedButton
          Left = 468
          Top = 13
          Width = 97
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Stop'
          Enabled = False
          OnClick = btn_Stop1Click
        end
        object btn_ServerShow3: TSpeedButton
          Tag = 3
          Left = 573
          Top = 13
          Width = 98
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #54868#47732#48372#44592
          Enabled = False
          OnClick = btn_ServerShow1Click
        end
        object pan_DeviceState3: TPanel
          Left = 203
          Top = 13
          Width = 65
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #51221#51648
          Color = clRed
          ParentBackground = False
          TabOrder = 0
        end
      end
      object pan_state4: TPanel
        Tag = 4
        Left = 1
        Top = 161
        Width = 686
        Height = 54
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 3
        Visible = False
        object lb_DeviceState4: TLabel
          Left = 32
          Top = 20
          Width = 139
          Height = 20
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'DeviceServer  1 '#49345#53468
        end
        object btn_Start4: TSpeedButton
          Left = 363
          Top = 13
          Width = 97
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Start'
          OnClick = btn_Start1Click
        end
        object btn_Stop4: TSpeedButton
          Left = 468
          Top = 13
          Width = 97
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Stop'
          Enabled = False
          OnClick = btn_Stop1Click
        end
        object btn_ServerShow4: TSpeedButton
          Tag = 4
          Left = 573
          Top = 13
          Width = 98
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #54868#47732#48372#44592
          Enabled = False
          OnClick = btn_ServerShow1Click
        end
        object pan_DeviceState4: TPanel
          Left = 203
          Top = 13
          Width = 65
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #51221#51648
          Color = clRed
          ParentBackground = False
          TabOrder = 0
        end
      end
      object pan_state5: TPanel
        Tag = 5
        Left = 1
        Top = 215
        Width = 686
        Height = 53
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 4
        Visible = False
        object lb_DeviceState5: TLabel
          Left = 32
          Top = 20
          Width = 139
          Height = 20
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'DeviceServer  1 '#49345#53468
        end
        object btn_Start5: TSpeedButton
          Left = 363
          Top = 13
          Width = 97
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Start'
          OnClick = btn_Start1Click
        end
        object btn_Stop5: TSpeedButton
          Left = 468
          Top = 13
          Width = 97
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Stop'
          Enabled = False
          OnClick = btn_Stop1Click
        end
        object btn_ServerShow5: TSpeedButton
          Tag = 5
          Left = 573
          Top = 13
          Width = 98
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #54868#47732#48372#44592
          Enabled = False
          OnClick = btn_ServerShow1Click
        end
        object pan_DeviceState5: TPanel
          Left = 203
          Top = 13
          Width = 65
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #51221#51648
          Color = clRed
          ParentBackground = False
          TabOrder = 0
        end
      end
      object pan_state6: TPanel
        Tag = 6
        Left = 1
        Top = 268
        Width = 686
        Height = 53
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 5
        Visible = False
        object lb_DeviceState6: TLabel
          Left = 32
          Top = 20
          Width = 139
          Height = 20
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'DeviceServer  1 '#49345#53468
        end
        object btn_Start6: TSpeedButton
          Left = 363
          Top = 13
          Width = 97
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Start'
          OnClick = btn_Start1Click
        end
        object btn_Stop6: TSpeedButton
          Left = 468
          Top = 13
          Width = 97
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Stop'
          Enabled = False
          OnClick = btn_Stop1Click
        end
        object btn_ServerShow6: TSpeedButton
          Tag = 6
          Left = 573
          Top = 13
          Width = 98
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #54868#47732#48372#44592
          Enabled = False
          OnClick = btn_ServerShow1Click
        end
        object pan_DeviceState6: TPanel
          Left = 203
          Top = 13
          Width = 65
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #51221#51648
          Color = clRed
          ParentBackground = False
          TabOrder = 0
        end
      end
      object pan_state7: TPanel
        Tag = 7
        Left = 1
        Top = 321
        Width = 686
        Height = 54
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 6
        Visible = False
        object lb_DeviceState7: TLabel
          Left = 32
          Top = 20
          Width = 139
          Height = 20
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'DeviceServer  1 '#49345#53468
        end
        object btn_Start7: TSpeedButton
          Left = 363
          Top = 13
          Width = 97
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Start'
          OnClick = btn_Start1Click
        end
        object btn_Stop7: TSpeedButton
          Left = 468
          Top = 13
          Width = 97
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Stop'
          Enabled = False
          OnClick = btn_Stop1Click
        end
        object btn_ServerShow7: TSpeedButton
          Tag = 7
          Left = 573
          Top = 13
          Width = 98
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #54868#47732#48372#44592
          Enabled = False
          OnClick = btn_ServerShow1Click
        end
        object pan_DeviceState7: TPanel
          Left = 203
          Top = 13
          Width = 65
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #51221#51648
          Color = clRed
          ParentBackground = False
          TabOrder = 0
        end
      end
      object pan_state8: TPanel
        Tag = 8
        Left = 1
        Top = 375
        Width = 686
        Height = 53
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 7
        Visible = False
        object lb_DeviceState8: TLabel
          Left = 32
          Top = 20
          Width = 139
          Height = 20
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'DeviceServer  1 '#49345#53468
        end
        object btn_Start8: TSpeedButton
          Left = 363
          Top = 13
          Width = 97
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Start'
          OnClick = btn_Start1Click
        end
        object btn_Stop8: TSpeedButton
          Left = 468
          Top = 13
          Width = 97
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Stop'
          Enabled = False
          OnClick = btn_Stop1Click
        end
        object btn_ServerShow8: TSpeedButton
          Tag = 8
          Left = 573
          Top = 13
          Width = 98
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #54868#47732#48372#44592
          Enabled = False
          OnClick = btn_ServerShow1Click
        end
        object pan_DeviceState8: TPanel
          Left = 203
          Top = 13
          Width = 65
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #51221#51648
          Color = clRed
          ParentBackground = False
          TabOrder = 0
        end
      end
      object pan_state9: TPanel
        Tag = 9
        Left = 1
        Top = 428
        Width = 686
        Height = 53
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 8
        Visible = False
        object lb_DeviceState9: TLabel
          Left = 32
          Top = 20
          Width = 139
          Height = 20
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'DeviceServer  1 '#49345#53468
        end
        object btn_Start9: TSpeedButton
          Left = 363
          Top = 13
          Width = 97
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Start'
          OnClick = btn_Start1Click
        end
        object btn_Stop9: TSpeedButton
          Left = 468
          Top = 13
          Width = 97
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Stop'
          Enabled = False
          OnClick = btn_Stop1Click
        end
        object btn_ServerShow9: TSpeedButton
          Tag = 9
          Left = 573
          Top = 13
          Width = 98
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #54868#47732#48372#44592
          Enabled = False
          OnClick = btn_ServerShow1Click
        end
        object pan_DeviceState9: TPanel
          Left = 203
          Top = 13
          Width = 65
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #51221#51648
          Color = clRed
          ParentBackground = False
          TabOrder = 0
        end
      end
      object pan_state10: TPanel
        Tag = 10
        Left = 1
        Top = 481
        Width = 686
        Height = 54
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 9
        Visible = False
        object lb_DeviceState10: TLabel
          Left = 32
          Top = 20
          Width = 139
          Height = 20
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'DeviceServer  1 '#49345#53468
        end
        object btn_Start10: TSpeedButton
          Left = 363
          Top = 13
          Width = 97
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Start'
          OnClick = btn_Start1Click
        end
        object btn_Stop10: TSpeedButton
          Left = 468
          Top = 13
          Width = 97
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Stop'
          Enabled = False
          OnClick = btn_Stop1Click
        end
        object btn_ServerShow10: TSpeedButton
          Tag = 10
          Left = 573
          Top = 13
          Width = 98
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #54868#47732#48372#44592
          Enabled = False
          OnClick = btn_ServerShow1Click
        end
        object pan_DeviceState10: TPanel
          Left = 203
          Top = 13
          Width = 65
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #51221#51648
          Color = clRed
          ParentBackground = False
          TabOrder = 0
        end
      end
      object pan_state11: TPanel
        Tag = 11
        Left = 1
        Top = 535
        Width = 686
        Height = 53
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 10
        Visible = False
        object lb_DeviceState11: TLabel
          Left = 32
          Top = 20
          Width = 139
          Height = 20
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'DeviceServer  1 '#49345#53468
        end
        object btn_Start11: TSpeedButton
          Left = 363
          Top = 13
          Width = 97
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Start'
          OnClick = btn_Start1Click
        end
        object btn_Stop11: TSpeedButton
          Left = 468
          Top = 13
          Width = 97
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Stop'
          Enabled = False
          OnClick = btn_Stop1Click
        end
        object btn_ServerShow11: TSpeedButton
          Tag = 11
          Left = 573
          Top = 13
          Width = 98
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #54868#47732#48372#44592
          Enabled = False
          OnClick = btn_ServerShow1Click
        end
        object pan_DeviceState11: TPanel
          Left = 203
          Top = 13
          Width = 65
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #51221#51648
          Color = clRed
          ParentBackground = False
          TabOrder = 0
        end
      end
      object pan_state12: TPanel
        Tag = 12
        Left = 1
        Top = 588
        Width = 686
        Height = 53
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 11
        Visible = False
        object lb_DeviceState12: TLabel
          Left = 32
          Top = 20
          Width = 139
          Height = 20
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'DeviceServer  1 '#49345#53468
        end
        object btn_Start12: TSpeedButton
          Left = 363
          Top = 13
          Width = 97
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Start'
          OnClick = btn_Start1Click
        end
        object btn_Stop12: TSpeedButton
          Left = 468
          Top = 13
          Width = 97
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Stop'
          Enabled = False
          OnClick = btn_Stop1Click
        end
        object btn_ServerShow12: TSpeedButton
          Tag = 12
          Left = 573
          Top = 13
          Width = 98
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #54868#47732#48372#44592
          Enabled = False
          OnClick = btn_ServerShow1Click
        end
        object pan_DeviceState12: TPanel
          Left = 203
          Top = 13
          Width = 65
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #51221#51648
          Color = clRed
          ParentBackground = False
          TabOrder = 0
        end
      end
      object pan_state13: TPanel
        Tag = 13
        Left = 1
        Top = 641
        Width = 686
        Height = 54
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 12
        Visible = False
        object lb_DeviceState13: TLabel
          Left = 32
          Top = 20
          Width = 139
          Height = 20
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'DeviceServer  1 '#49345#53468
        end
        object btn_Start13: TSpeedButton
          Left = 363
          Top = 13
          Width = 97
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Start'
          OnClick = btn_Start1Click
        end
        object btn_Stop13: TSpeedButton
          Left = 468
          Top = 13
          Width = 97
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Stop'
          Enabled = False
          OnClick = btn_Stop1Click
        end
        object btn_ServerShow13: TSpeedButton
          Tag = 12
          Left = 573
          Top = 13
          Width = 98
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #54868#47732#48372#44592
          Enabled = False
          OnClick = btn_ServerShow1Click
        end
        object pan_DeviceState13: TPanel
          Left = 203
          Top = 13
          Width = 65
          Height = 30
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = #51221#51648
          Color = clRed
          ParentBackground = False
          TabOrder = 0
        end
      end
    end
    object StatusBar1: TStatusBar
      Left = 0
      Top = 785
      Width = 692
      Height = 19
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Panels = <
        item
          Width = 3000
        end>
    end
  end
  object TrayIcon1: TTrayIcon
    Icons = TrayImageList
    PopupMenu = pm_TrayMenu
    OnDblClick = TrayIcon1DblClick
    Left = 208
    Top = 64
  end
  object pm_TrayMenu: TPopupMenu
    AutoHotkeys = maManual
    Left = 280
    Top = 32
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
    Left = 248
    Top = 64
    Bitmap = {
      494C0101020014041C0520002000FFFFFF00FF10FFFFFFFFFFFFFFFF424D3600
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
      FF00F7F7F700E7E7E700DEDEDE00D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600DEDEDE00E7E7E700F7F7
      F700FFFFFF00FFFFFF00F7F7F700D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600E7E7DE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F7F7F700E6E6E600D8D8D800D3D3D300D5D5D500D3D3D300D3D3D300D3D3
      D300D3D3D300D3D3D300D3D3D300D5D5D500D3D3D300D8D8D800E6E6E600F7F7
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E7E7E700CECECE00C6C6C600CECECE00CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00C6C6C600CECECE00E7E7E700FFFF
      FF00FFFFFF00FFFFFF00DEDEDE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE00EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F8F8F800E2E2E200C8C8C800C7C7C700CBCBCB00C9C9C900C9C9C900C9C9
      C900C9C9C900C9C9C900C9C9C900CBCBCB00C7C7C700C8C8C800E2E2E200F8F8
      F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
      FF00EFEFEF00CECECE00B5B5B500A5A5A500ADADAD00A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500ADADAD00A5A5A500B5B5B500CECECE00EFEF
      EF00FFFFFF00FFFFFF00D6D6D6009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C00B5B5B500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00EDEDED00CACACA00AFAFAF00A8A8A800AAAAAA00A6A6A600A6A6A600A6A6
      A600A6A6A600A5A5A500A7A7A700ABABAB00A7A7A700B5B5B500D4D4D400F4F4
      F400FFFFFF00FFFFFF00E1E1E100A0A0A0009B9B9B009B9B9B009D9D9D009D9D
      9D009C9C9C00C9C9C900FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F7F7F700C6C6C600949494008C8C8C009494940094949400949494009494
      9400949494009494940094949400949494008C8C8C0094949400C6C6C600F7F7
      F700FFFFFF00FFFFFF00F7F7F700C6C6BD00A5A5A500ADADAD00ADADAD00A5A5
      A500ADADAD00E7E7E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F1F1F100BEBEBE00808080008B8B8B009797970090909000909090009191
      910091919100909090009494940098989800878787008B8B8B00D1D1D100F6F6
      F600FFFFFF00FFFFFF00EFEFEF00B6B6B5009B9B9A009B9B9A009E9E9E009D9C
      9C00AAA9A900E0E0E000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C60084848400BDBDBD00DEDEDE00CECECE00C6C6C600C6C6
      C600C6C6C600C6C6C600CECECE00DEDEDE00C6C6C60084848400C6C6C600FFFF
      FF00F7F7F700FFFFFF00FFFFFF00DEDEDE00949C9C00A5ADAD00B5BDC600949C
      9C00BDBDBD00FFFFFF00FFFFFF00F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C3C3C30091919100CCCCCC00E0E0E000D5D5D500D3D3D300D4D4
      D400D6D6D600D5D5D500DCDCDC00E3E3E300C8C8C8008F8F8F00E2E2E200FFFF
      FF00F9F9F900F9F9F900FFFFFF00E1E1E1009C9FA100B0B2B600BFC2C4009C9F
      A100C6C7C800FFFFFF00FBFBFB00F9F9F9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EFEFEF00D6D6D600C6C6C60094949400C6C6C600D6D6D600CECE
      CE00D6D6D600DEDEDE00C6C6C6009C9C9C00CECECE00D6D6D600EFEFEF00FFFF
      FF00BDBDBD00ADADAD00B5B5B500ADADAD00949494009C9CA500ADADB5008C94
      9400A5A5A500B5B5B500ADADAD00B5B5B500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EEEEEE00E4E4E400C2C2C20085858500B9B9B900CBCBCB00C3C3
      C300C3C3C300CECECE00AAAAAA008A8A8A00D6D6D600E3E3E300F7F7F700FFFF
      FF00C6C6C600B7B7B700BEBDBC00BCBABA00939393009A9A9A00A9A9A8008C8C
      8C00B0AFAF00C5C5C300B7B7B700C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EFEFEF007B7B7B008C8C8C00A5A5A5009494
      940094949400A5A5A5008C8C8C007B7B7B00EFEFEF00FFFFFF00FFFFFF00FFFF
      FF0094949C00B5AD9C00D6BD9C00C6A58400C6AD8C00D6B59400D6BD9C00CEAD
      9400C6A58400C6AD8C00D6BDA500948C8C00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E4E4E4007A7A7A0088888800979797008E8E
      8E008E8E8E009B9B9B007C7C7C008C8C8C00F7F7F700FFFFFF00FFFFFF00FFFF
      FF0096989800A0999200D3BCA700B7A18E00BCA99600CBB7A300CEBAA600C1AE
      9A00B6A28F00C5AF9900BBAE9F00969898000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00DEDEDE00949494007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B0094949400DEDEDE00FFFFFF00FFFFFF00FFFF
      FF009CA5A500C69C7300EF943100DE730800DE7B1800DE7B1000DE7B1000DE7B
      1800DE7B1000E77B1800EFA552009C948C00FDFDFD00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00FCFCFC00FCFCFC00D1D1D10095959500797979007B7B7B007777
      7700777777007E7E7E007C7C7C00A0A0A000DEDEDE00FCFCFC00FCFCFC00FCFC
      FC009B9EA100B2927300CE9862006E7379007F7D7C007A787700797876007D7C
      7A0072777D00A7896C00D79D62009DA0A3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6D6D600D6D6D600DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00D6D6D6009C9C9C0084848400949494008C8C
      8C008C8C8C0094949400848484009C9C9C00D6D6D600DEDEDE00DEDEDE00DEDE
      DE008C8C8C00AD845A00CE7B2100C6630000E77B1000E77B1000E77B1000E77B
      1000E77B0800EF841000EF9C52009C948C00C8C8C800C7C7C700CFCFCF00D0D0
      D000D0D0D000D0D0D000D0D0D000D1D1D100979797008D8D8D009F9F9F009393
      930093939300A4A4A40086868600A9A9A900D0D0D000D0D0D000D0D0D000D0D0
      D0007F82840092785C00A2774A00575D64007E7F7F007C7D7D007C7D7D007E7E
      7F0071798000A88A6C00D99B5D009CA0A3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ADADAD0094949400949494009494
      9400949494009494940094949400A5A5A50094949C00A5ADAD00C6C6CE00B5BD
      BD00B5BDBD00C6C6CE00ADADAD0094949C00A5A5A50094949400949494009494
      940063636B0073634A008C5A21009C520800E78C1800E78C1800E78C1800E78C
      1800E7841000EF8C1800EFA552009C948C00A6A6A6008D8D8D00969696009696
      9600969696009696960096969600A0A0A0009C9C9C00BEBEBE00CFCFCF00C6C6
      C600C6C6C600D2D2D200B2B2B2009B9B9B009C9C9C0096969600969696009696
      96007274750075695D00795E40004B4F55008282820082828200828282008282
      8200757C8200A98D6F00D69C60009DA1A4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ADADAD0094949400D6D6D600CECE
      D600C6CED600C6CED600C6CED600CECED600CECED600D6D6DE00D6DEE700D6DE
      DE00D6DEDE00D6DEE700D6D6DE00CECED600CECED600C6CED600C6CED600C6CE
      D600C6CECE00D6D6CE0094734A009C5A0000E7941000EF941000E7941000EF94
      1000EF8C0800EF8C1000EF9C4A009C948C00A8A8A80099999900F2F2F200DCDC
      DC00D8D8D800D9D9D900D9D9D900D9D9D900D7D7D700D3D3D300D2D2D200D2D2
      D200D2D2D200D2D2D200D4D4D400D8D8D800D9D9D900D9D9D900D9D9D900D8D8
      D800E5E5E500E0E0E0007D685000424B5700747A8300757B8300747A8300757B
      840067758500A0866B00D49855009EA2A5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ADADAD009C9CA500FFF7EF00E7BD
      9400DEA57300DEAD7B00DEAD7B00DEAD7B00DEAD7B00CEA57300CE9C6B00CE9C
      6B00CE9C7300CE9C6B00CEA57300DEAD7B00DEAD7B00DEAD7B00DEAD7B00DEA5
      7300E7BD9400FFF7EF009C846B00A5630800F79C1800F79C1800F79C1800F79C
      1800F79C1000F79C1800EFA552009C948C00AAAAAA00A0A0A000E4E4E4008E8E
      8E00787878008080800080808000808080007E7E7E007A7A7A00797979007979
      790079797900787878007B7B7B007F7F7F008080800080808000808080007575
      7500A8A8A800E0E0E0008D78590071614B00B3997500B49A7600B3997500B49A
      7600AC947200CFA56B00E0AA6A009FA2A6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ADADAD009CA5A500E7DECE00CE7B
      2100C65A0000CE6B0000CE6B0000CE6B0000CE6B0000CE6B0000CE6B0000CE6B
      0000CE6B0000CE6B0000CE6B0000CE6B0000CE6B0000CE6B0000CE6B0000C65A
      0000CE7B2100E7DECE009C947B00AD7B3900FFBD6300FFBD6300FFBD6300FFBD
      6300FFBD5A00FFBD5A00FFD68C00A59C9C00ACACAC00A2A2A200D4D4D4006262
      6200464646005454540053535300535353005353530053535300535353005353
      5300535353005353530053535300535353005353530053535300535353004242
      420082828200D7D7D7008F826800A0794300ECB76E00ECB76D00ECB76E00ECB7
      6E00EDB46500EBC17900CEB89900A3A4A6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ADADAD009C9CA500EFDECE00D684
      3100DE730000E77B1800E77B1800E77B1800E77B1800E77B1800E77B1800E77B
      1800E77B1800E77B1800E77B1800E77B1800E77B1800E77B1800E77B1800DE73
      0000D6843100EFDECE007B848400736B6B00ADA59C00ADA59C00ADA59C00ADA5
      9C00ADA59C00ADA59C00ADA59C009C9C9C00ADADAD00A1A1A100D7D7D7007171
      71005C5C5C006B6B6B006A6A6A006A6A6A006A6A6A006A6A6A006A6A6A006A6A
      6A006A6A6A006A6A6A006A6A6A006A6A6A006A6A6A006A6A6A006A6A6A005757
      57008D8D8D00D7D7D7007475770073757800AAADB100AAADB100AAADB100AAAD
      B100AAADB100AAADB100A9AAAC00B7B6B6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ADADAD009C9CA500EFDECE00D68C
      3100DE730800EF841800EF841800EF841800EF841800EF841800EF841800EF84
      1800EF841800EF841800EF841800EF841800EF841800EF841800EF841800DE73
      0800D68C3100EFDECE009C9CA500ADADAD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADADAD00A1A1A100D6D6D6007070
      70005B5B5B006B6B6B0069696900696969006A6A6A006A6A6A006A6A6A006A6A
      6A006A6A6A006969690069696900696969006969690069696900696969005757
      57008C8C8C00D7D7D70098989800ADADAD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ADADAD009C9CA500EFDECE00D68C
      3100DE730800EF841800E7841800E7841800E7841800E7841800E7841800E784
      1800E7841800E7841800E7841800E7841800E7841800E7841800E7841800DE73
      0800D68C3100EFDECE009C9CA500ADADAD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADADAD00A1A1A100D6D6D6007070
      70005A5A5A006B6B6B0069696900696969006A6A6A006A6A6A006A6A6A006A6A
      6A006A6A6A006969690069696900696969006969690069696900696969005656
      56008C8C8C00D7D7D70098989800ADADAD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ADADAD009C9CA500EFDECE00D684
      3100DE730800E7841800E7841800E7841800E7841800E7841800E7841800E784
      1800E7841800E7841800E7841800E7841800E7841800E7841800E7841800DE73
      0800D6843100EFDECE009C9CA500ADADAD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADADAD00A1A1A100D6D6D6007070
      70005A5A5A006A6A6A0069696900696969006969690069696900696969006969
      6900696969006969690069696900696969006969690069696900696969005656
      56008C8C8C00D7D7D70098989800ADADAD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ADADAD009CA5A500E7DECE00D684
      3100DE7B0800E78C1800E78C1800E78C1800E78C1800E78C1800E78C1800E78C
      1800E78C1800E78C1800E78C1800E78C1800E78C1800E78C1800E78C1800DE7B
      0800D6843100E7DECE009CA5A500ADADAD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AFAFAF00A1A1A100D6D6D6007070
      70005C5C5C006B6B6B0069696900696969006969690069696900696969006969
      69006A6A6A0069696900696969006A6A6A006A6A6A006A6A6A00696969005656
      56008C8C8C00D7D7D70099999900AFAFAF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5B5B5009CA5A500E7DECE00D684
      3100DE7B0800EF941800EF941800EF941800EF941800EF941800EF941800EF94
      1800EF941800EF941800EF941800EF941800EF941800EF941800EF941800DE7B
      0800D6843100E7DECE009CA5A500B5B5B500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B1B1B100A2A2A200D6D6D6007070
      70005C5C5C006D6D6D006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B
      6B006C6C6C006B6B6B006B6B6B006C6C6C006C6C6C006C6C6C006B6B6B005656
      56008C8C8C00D7D7D7009A9A9A00B1B1B100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5B5B5009CA5A500E7DECE00D684
      3100DE7B0800EF9C1800EF9C1800EF941800EF941800EF941800EF941800EF94
      1800EF941800EF941800EF941800EF941800EF941800EF941800EF9C1800DE7B
      0800D6843100E7DECE009CA5A500B5B5B500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B2B2B200A2A2A200D6D6D6006F6F
      6F005C5C5C006F6F6F006D6D6D006D6D6D006D6D6D006D6D6D006D6D6D006D6D
      6D006D6D6D006D6D6D006D6D6D006D6D6D006D6D6D006F6F6F006D6D6D005757
      57008B8B8B00D7D7D7009A9A9A00B2B2B200FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5B5B5009CA5A500E7DECE00D684
      3100DE840800F7A52100F7A51800F7A51800F7A51800F7A51800F7A51800F7A5
      1800F7A51800F7A51800F7A51800F7A51800F7A51800F7A51800F7A52100DE84
      0800D6843100E7DECE009CA5A500B5B5B500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5B5B500A3A3A300D6D6D6006E6E
      6E005D5D5D007272720070707000707070007070700070707000707070007070
      7000707070007070700070707000707070007070700071717100707070005757
      57008A8A8A00D7D7D7009C9C9C00B5B5B500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5B5B5009CA5AD00E7DECE00D684
      2900DE7B0000F79C1000EF9C1000EF9C1000EF9C1000EF9C1000EF9C1000EF9C
      1000EF9C1000EF9C1000EF9C1000EF9C1000EF9C1000EF9C1000F79C1000DE7B
      0000D6842900E7DECE009CA5AD00B5B5B500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5B5B500A3A3A300D3D3D3006565
      65004D4D4D005E5E5E005D5D5D005D5D5D005D5D5D005D5D5D005D5D5D005D5D
      5D005D5D5D005D5D5D005D5D5D005D5D5D005D5D5D005D5D5D005D5D5D004848
      480084848400D3D3D3009C9C9C00B5B5B500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5B5B5009CA5AD00EFDECE00DE8C
      2900DE7B0000DE840800DE840800DE840800DE840800DE840800DE840800DE84
      0800DE840800DE840800DE840800DE840800DE840800DE840800DE840800DE7B
      0000DE8C2900EFDECE009CA5AD00B5B5B500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5B5B500A5A5A500DFDFDF008888
      8800717171007979790079797900797979007979790079797900797979007979
      7900797979007979790079797900797979007979790079797900797979006E6E
      6E00A1A1A100DFDFDF009C9C9C00B5B5B500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5B5B500A5ADAD00FFFFFF00FFEF
      C600FFE7AD00FFE7B500FFE7B500FFE7B500FFE7B500FFE7B500FFE7B500FFE7
      B500FFE7B500FFE7B500FFE7B500FFE7B500FFE7B500FFE7B500FFE7B500FFE7
      AD00FFEFC600FFFFFF00A5ADAD00B5B5B500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B4B4B400ADADAD00FFFFFF00FFFF
      FF00FCFCFC00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFD
      FD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FBFB
      FB00FFFFFF00FFFFFF009F9F9F00B4B4B400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5B5B500A5A5A500D6D6DE00D6DE
      E700D6DEEF00D6DEEF00D6DEEF00D6DEEF00D6DEEF00D6DEEF00D6DEEF00D6DE
      EF00D6DEEF00D6DEEF00D6DEEF00D6DEEF00D6DEEF00D6DEEF00D6DEEF00D6DE
      EF00D6DEE700D6D6DE00A5A5A500B5B5B500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B7B7B700A0A0A000ADADAD00B4B4
      B400B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B6B6
      B600B1B1B100AEAEAE00A2A2A200B7B7B700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDBDBD00ADADAD00ADADAD00ADAD
      AD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADAD
      AD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADAD
      AD00ADADAD00ADADAD00ADADAD00BDBDBD00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C4C4C400B8B8B800B7B7B700B8B8
      B800B8B8B800B8B8B800B8B8B800B8B8B800B8B8B800B8B8B800B8B8B800B8B8
      B800B8B8B800B8B8B800B8B8B800B8B8B800B8B8B800B8B8B800B8B8B800B8B8
      B800B7B7B700B8B8B800BABABA00C4C4C400FFFFFF00FFFFFF00FFFFFF00FFFF
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
      000000000000000000000000FFFFFF00FFFFFFFF000000000000000000000000
      F0000C07000000000000000000000000F8001C03000000000000000000000000
      FFFFFFFF000000000000000000000000FFFFFFFF000000000000000000000000
      F0000C03000000000000000000000000F0000C03000000000000000000000000
      F8001606000000000000000000000000F8001000000000000000000000000000
      FE007000000000000000000000000000FE007000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FF000000000000000000000000000000FF000000000000000000000000
      000000FF000000000000000000000000000000FF000000000000000000000000
      000000FF000000000000000000000000000000FF000000000000000000000000
      000000FF000000000000000000000000000000FF000000000000000000000000
      000000FF000000000000000000000000200004FF000000000000000000000000
      000000FF000000000000000000000000000000FF000000000000000000000000
      FFFFFFFF000000000000000000000000FFFFFFFF000000000000000000000000
      FFFFFFFF00000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object TrayTimer: TTimer
    Enabled = False
    Interval = 500
    OnTimer = TrayTimerTimer
    Left = 200
  end
  object ETCServerCheckTimer: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = ETCServerCheckTimerTimer
    Left = 288
    Top = 8
  end
  object ADOBackupQuery: TADOQuery
    Connection = dmDataBase.ADOConnection
    Parameters = <>
    Left = 232
    Top = 144
  end
  object DateTimer1: TTimer
    Enabled = False
    Interval = 60000
    OnTimer = DateTimer1Timer
    Left = 416
  end
  object MemoryClearTimer: TTimer
    Interval = 3600000
    OnTimer = MemoryClearTimerTimer
    Left = 166
    Top = 48
  end
  object CardPermitCheckTimer: TTimer
    Enabled = False
    OnTimer = CardPermitCheckTimerTimer
    Left = 302
    Top = 48
  end
end