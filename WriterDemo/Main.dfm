object FrmMain: TFrmMain
  Left = 325
  Top = 233
  Width = 372
  Height = 209
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'TarMaker - Demo for LibTar.pas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnHide = FormHide
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LblTar: TLabel
    Left = 8
    Top = 8
    Width = 69
    Height = 13
    Caption = 'Destination file'
  end
  object Label3: TLabel
    Left = 100
    Top = 102
    Width = 143
    Height = 13
    Caption = '(Repeat this step for every file)'
  end
  object EdtTarFilename: TEdit
    Left = 8
    Top = 24
    Width = 317
    Height = 21
    TabOrder = 0
  end
  object BtnTar: TButton
    Left = 328
    Top = 24
    Width = 21
    Height = 21
    Caption = '...'
    TabOrder = 1
    OnClick = BtnTarClick
  end
  object BtnAdd: TButton
    Left = 8
    Top = 96
    Width = 85
    Height = 25
    Caption = '&Add File to tar'
    Default = True
    TabOrder = 3
    OnClick = BtnAddClick
  end
  object BtnCreateTar: TButton
    Left = 8
    Top = 52
    Width = 85
    Height = 25
    Caption = '&Create tar File'
    TabOrder = 2
    OnClick = BtnCreateTarClick
  end
  object BtnFinalize: TButton
    Left = 8
    Top = 140
    Width = 85
    Height = 25
    Caption = '&Finalize tar File'
    TabOrder = 4
    OnClick = BtnFinalizeClick
  end
  object LblStatus: TStaticText
    Left = 100
    Top = 146
    Width = 249
    Height = 13
    AutoSize = False
    Caption = '---'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object DlgTar: TSaveDialog
    DefaultExt = 'TAR'
    Filter = 'tar Files (*.tar)|*.tar|All Files (*.*)|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Left = 312
    Top = 16
  end
  object DlgFile: TOpenDialog
    Filter = 'All Files (*.*)|*.*'
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Left = 84
    Top = 84
  end
end
