object MainForm: TMainForm
  Left = 477
  Top = 224
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1055#1077#1088#1077#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1092#1072#1081#1083#1086#1074' '#1074' '#1076#1080#1088#1077#1082#1090#1086#1088#1080#1080
  ClientHeight = 183
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 174
    Height = 20
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1076#1080#1088#1077#1082#1090#1086#1088#1080#1102
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 72
    Width = 244
    Height = 20
    Caption = #1055#1088#1077#1092#1080#1082#1089' '#1076#1083#1103' '#1085#1072#1079#1074#1072#1085#1080#1103' '#1092#1072#1081#1083#1086#1074
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object GoBtn: TButton
    Left = 152
    Top = 144
    Width = 137
    Height = 25
    Caption = #1055#1086#1077#1093#1072#1083#1080
    Enabled = False
    TabOrder = 0
    OnClick = GoBtnClick
  end
  object DirTF: TEdit
    Left = 16
    Top = 40
    Width = 377
    Height = 21
    ReadOnly = True
    TabOrder = 1
    OnDblClick = SelectDirBtnClick
  end
  object SelectDirBtn: TButton
    Left = 400
    Top = 40
    Width = 36
    Height = 24
    Caption = '...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = SelectDirBtnClick
  end
  object PrefixTF: TEdit
    Left = 16
    Top = 104
    Width = 377
    Height = 21
    TabOrder = 3
    Text = 'file'
  end
  object OpenDialog1: TOpenDialog
    Left = 200
  end
end
