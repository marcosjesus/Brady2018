object FrmAguardando: TFrmAguardando
  Left = 434
  Top = 346
  AlphaBlend = True
  AlphaBlendValue = 200
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Aguarde...'
  ClientHeight = 107
  ClientWidth = 433
  Color = 15724527
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alClient
    Ctl3D = True
    ParentCtl3D = False
    Style.LookAndFeel.SkinName = 'MoneyTwins'
    StyleDisabled.LookAndFeel.SkinName = 'MoneyTwins'
    StyleFocused.LookAndFeel.SkinName = 'MoneyTwins'
    StyleHot.LookAndFeel.SkinName = 'MoneyTwins'
    TabOrder = 0
    ExplicitLeft = 48
    ExplicitTop = 24
    ExplicitWidth = 410
    ExplicitHeight = 110
    Height = 107
    Width = 433
    object LbInfo: TLabel
      Left = 2
      Top = 22
      Width = 429
      Height = 16
      Align = alTop
      Alignment = taCenter
      Caption = 'Aguardando...'
      Color = 10485760
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ExplicitWidth = 98
    end
    object lblProgresso: TLabel
      Left = 147
      Top = 72
      Width = 144
      Height = 13
      Caption = 'Processo em execu'#231#227'o...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
end
