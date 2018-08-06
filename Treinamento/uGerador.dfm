inherited frmGerador: TfrmGerador
  Caption = 'Guia de informa'#231#227'o e apura'#231#227'o de ICMS'
  ClientHeight = 619
  ClientWidth = 937
  WindowState = wsMaximized
  ExplicitWidth = 953
  ExplicitHeight = 657
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanFundo: TPanel
    Width = 937
    Height = 619
    ExplicitWidth = 937
    ExplicitHeight = 619
    inherited PanTitulo: TPanel
      Top = 133
      Width = 933
      ExplicitTop = 133
      ExplicitWidth = 933
      inherited ImaBarraSup: TImage
        Width = 929
        ExplicitWidth = 732
      end
    end
    inherited ToolBar: TToolBar
      Top = 559
      Width = 933
      ExplicitTop = 559
      ExplicitWidth = 933
      inherited ButImprimir: TcxButton
        OnClick = ButImprimirClick
      end
    end
    inherited StatusBar: TdxStatusBar
      Top = 597
      Width = 933
      ExplicitTop = 597
      ExplicitWidth = 933
    end
    object cxGroupBox: TcxGroupBox
      Left = 2
      Top = 2
      Align = alTop
      Caption = ' Parametros'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.Kind = lfOffice11
      Style.LookAndFeel.SkinName = 'Office2007Blue'
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.SkinName = 'Office2007Blue'
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.SkinName = 'Office2007Blue'
      StyleHot.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.SkinName = 'Office2007Blue'
      TabOrder = 3
      Height = 131
      Width = 933
      object Label2: TLabel
        Left = 86
        Top = 57
        Width = 46
        Height = 13
        Caption = 'Per'#237'odo'
      end
      object Label3: TLabel
        Left = 101
        Top = 25
        Width = 31
        Height = 13
        Caption = ' Filial'
      end
      object Label4: TLabel
        Left = 27
        Top = 84
        Width = 105
        Height = 13
        Caption = ' Regime Tribut'#225'rio'
      end
      object Label5: TLabel
        Left = 278
        Top = 84
        Width = 73
        Height = 13
        Caption = ' Tipo de GIA'
      end
      object Label1: TLabel
        Left = 515
        Top = 25
        Width = 69
        Height = 13
        Caption = 'Arquivo GIA'
      end
      object editFilial: TEditBusca
        Left = 138
        Top = 26
        Width = 352
        Height = 21
        TabOrder = 0
        OnExit = editFilialExit
        ClickOnArrow = True
        ClickOnReturn = False
        bs_HeightForm = 0
        bs_WidthForm = 0
        bs_SetCPF = False
        bs_SetCNPJ = False
        bs_SetPlaca = False
        bs_LoadConsulta = False
        bs_Distinct = False
        bs_SetColor = False
        bs_NomeCor = clBlack
        bs_IndiceCampo = 0
        bs_Imagem = False
        bs_HideTop = False
        bs_Top100 = False
      end
      object cmbRegime: TcxComboBox
        Left = 138
        Top = 80
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          '01 '#8211' RPA (Regime Peri'#243'dico de Apura'#231#227'o)'
          '02 '#8211' RES (Regime por Estimativa)'
          '03 '#8211' RPA-DISPENSADO'
          '04- Simples-ST')
        TabOrder = 1
        Width = 129
      end
      object cmbTipoGia: TcxComboBox
        Left = 360
        Top = 80
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          '01 normal '
          '02 substituta '
          '03 Coligida')
        TabOrder = 2
        Width = 130
      end
      object btnProcessar: TcxButton
        Left = 515
        Top = 61
        Width = 111
        Height = 40
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.SkinName = 'Office2007Blue'
        OptionsImage.Glyph.Data = {
          B60D0000424DB60D000000000000360000002800000030000000180000000100
          180000000000800D0000C40E0000C40E00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF006600FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565FF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
          660021A335006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FF656565949494656565FF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF00660024A53912A92028B040006600FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6565659696968F8F8F9E9E9E
          656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00660027A73E1E
          B43218AE2913AB2227AF3E006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FF6565659999999B9B9B9595959191919D9D9D656565FF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF0066001F99312EC04A26BA3E1FB53419AF2B13AB2325AE3C0066
          00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF6565658E8E8EA9A9A9A2A2A29C9C9C969696
          9191919B9B9B656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0066001D952E3FCE6337C8572F
          C14C25A63B00660029B14114AC2524AD3A006600FF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6565658B8B
          8BB8B8B8B1B1B1AAAAAA9797976565659F9F9F9292929A9A9A656565FF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          0066001A902A4FDA7948D56F40CF642FB34A006600FF00FF0066001CB22F15AC
          2622AC38006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FF656565878787C6C6C6C0C0C0B9B9B9A3A3A3656565FF00FF
          656565999999929292999999656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF00660059E28955E08250DB7B36BC5500
          6600FF00FFFF00FFFF00FF006600148D2117AE2721AB36006600FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565CFCFCFCCCC
          CCC7C7C7ABABAB656565FF00FFFF00FFFF00FF65656582828294949498989865
          6565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          00660031B04D5BE48A3ABF5B006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FF00660018AE2920AA34006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FF656565A2A2A2D1D1D1AEAEAE656565FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF656565959595979797656565FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00660047CF6D006600FF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00660019AF2B14AB23006600
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565BDBD
          BD656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF65656596
          9696919191656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FF0066000B7E1314AB24006600FF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF656565FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF656565767676919191656565FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF006600
          118D1D006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FF656565818181656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF00660008790F006600FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6565657272726565
          65FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF006600006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF656565656565FF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF006600FF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FF656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        OptionsImage.NumGlyphs = 2
        TabOrder = 3
        OnClick = btnProcessarClick
      end
      object mskperiodo: TMaskEdit
        Left = 138
        Top = 53
        Width = 129
        Height = 21
        EditMask = '!99/0000;1;_'
        MaxLength = 7
        TabOrder = 4
        Text = '  /    '
        OnExit = mskperiodoExit
      end
      object chkTransmitida: TcxCheckBox
        Left = 282
        Top = 53
        Caption = 'Transmitida'
        ParentBackground = False
        ParentColor = False
        Properties.Alignment = taLeftJustify
        Style.BorderColor = 16313799
        Style.Color = 16578530
        Style.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.Kind = lfOffice11
        TabOrder = 5
        Width = 121
      end
      object editArquivo: TrsSuperEdit
        Left = 590
        Top = 22
        Width = 315
        Height = 21
        Options = [soAutoAlign, soAllowspaces, soEnterToTab]
        CT_NumFields = 0
        CT_RetField1 = 0
        CT_RetField2 = 0
        CT_Test = False
        CT_ConsTab = False
        CT_Search = False
        Text = ''
        ReadOnly = True
        TabOrder = 6
      end
    end
    object Panel1: TPanel
      Left = 2
      Top = 135
      Width = 933
      Height = 424
      Align = alClient
      BevelInner = bvLowered
      TabOrder = 4
      object Page: TcxPageControl
        Left = 2
        Top = 2
        Width = 929
        Height = 420
        Align = alClient
        TabOrder = 0
        Properties.ActivePage = tabGIA
        Properties.CustomButtons.Buttons = <>
        OnChange = PageChange
        ClientRectBottom = 416
        ClientRectLeft = 4
        ClientRectRight = 925
        ClientRectTop = 24
        object tabValores: TcxTabSheet
          Caption = 'Valores'
          ImageIndex = 0
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Label7: TLabel
            Left = 64
            Top = 6
            Width = 131
            Height = 20
            Caption = 'D'#233'bito do Imposto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label8: TLabel
            Left = 472
            Top = 6
            Width = 135
            Height = 20
            Caption = 'Cr'#233'dito do Imposto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label9: TLabel
            Left = 376
            Top = 218
            Width = 136
            Height = 20
            Caption = 'Apura'#231#227'o do Saldo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Panel2: TPanel
            Left = 31
            Top = 28
            Width = 407
            Height = 184
            BevelInner = bvLowered
            TabOrder = 0
            object Label6: TLabel
              Left = 22
              Top = 16
              Width = 146
              Height = 13
              Caption = 'Por sa'#237'das ou presta'#231#245'es'
              Color = 12615680
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label10: TLabel
              Left = 22
              Top = 43
              Width = 83
              Height = 13
              Caption = 'Outros d'#233'bitos'
              Color = 12615680
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label11: TLabel
              Left = 22
              Top = 70
              Width = 111
              Height = 13
              Caption = 'Estorno de cr'#233'ditos'
              Color = 12615680
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label12: TLabel
              Left = 22
              Top = 97
              Width = 30
              Height = 13
              Caption = 'Total'
              Color = 12615680
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object EditPorSaidasPrestacoes: TrsSuperEdit
              Left = 278
              Top = 8
              Width = 121
              Height = 21
              Options = [soAutoAlign, soAllowspaces, soEnterToTab]
              Alignment = taRightJustify
              Format = foCurrency
              CT_NumFields = 0
              CT_RetField1 = 0
              CT_RetField2 = 0
              CT_Test = False
              CT_ConsTab = False
              CT_Search = False
              Text = ''
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              OnExit = editOutrosDebitoExit
            end
            object editOutrosDebito: TrsSuperEdit
              Left = 278
              Top = 35
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Format = foCurrency
              CT_NumFields = 0
              CT_RetField1 = 0
              CT_RetField2 = 0
              CT_Test = False
              CT_ConsTab = False
              CT_Search = False
              Text = ''
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnExit = editOutrosDebitoExit
            end
            object editEstornoCredito: TrsSuperEdit
              Left = 279
              Top = 62
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Format = foCurrency
              CT_NumFields = 0
              CT_RetField1 = 0
              CT_RetField2 = 0
              CT_Test = False
              CT_ConsTab = False
              CT_Search = False
              Text = ''
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              OnExit = editOutrosDebitoExit
            end
            object editTotalDebito: TrsSuperEdit
              Left = 278
              Top = 89
              Width = 121
              Height = 21
              Options = [soAutoAlign, soAllowspaces, soEnterToTab]
              Alignment = taRightJustify
              Format = foCurrency
              CT_NumFields = 0
              CT_RetField1 = 0
              CT_RetField2 = 0
              CT_Test = False
              CT_ConsTab = False
              CT_Search = False
              Text = ''
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
          end
          object Panel3: TPanel
            Left = 437
            Top = 28
            Width = 442
            Height = 184
            BevelInner = bvLowered
            TabOrder = 1
            object Label13: TLabel
              Left = 23
              Top = 17
              Width = 155
              Height = 13
              Caption = 'Por entradas ou aquisi'#231#245'es'
              Color = 12615680
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label14: TLabel
              Left = 23
              Top = 44
              Width = 87
              Height = 13
              Caption = 'Outros cr'#233'ditos'
              Color = 12615680
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label15: TLabel
              Left = 23
              Top = 71
              Width = 107
              Height = 13
              Caption = 'Estorno de d'#233'bitos'
              Color = 12615680
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label16: TLabel
              Left = 23
              Top = 98
              Width = 52
              Height = 13
              Caption = 'SubTotal'
              Color = 12615680
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label17: TLabel
              Left = 23
              Top = 125
              Width = 168
              Height = 13
              Caption = 'Saldo credor per'#237'odo anterior'
              Color = 12615680
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label18: TLabel
              Left = 23
              Top = 152
              Width = 30
              Height = 13
              Caption = 'Total'
              Color = 12615680
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object editPorEntradasAqui: TrsSuperEdit
              Left = 278
              Top = 9
              Width = 121
              Height = 21
              Options = [soAutoAlign, soAllowspaces, soEnterToTab]
              Alignment = taRightJustify
              Format = foCurrency
              CT_NumFields = 0
              CT_RetField1 = 0
              CT_RetField2 = 0
              CT_Test = False
              CT_ConsTab = False
              CT_Search = False
              Text = ''
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              OnExit = editEstornoDebitosExit
            end
            object editOutrosCreditos: TrsSuperEdit
              Left = 278
              Top = 36
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Format = foCurrency
              CT_NumFields = 0
              CT_RetField1 = 0
              CT_RetField2 = 0
              CT_Test = False
              CT_ConsTab = False
              CT_Search = False
              Text = ''
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnExit = editEstornoDebitosExit
            end
            object editEstornoDebitos: TrsSuperEdit
              Left = 278
              Top = 63
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Format = foCurrency
              CT_NumFields = 0
              CT_RetField1 = 0
              CT_RetField2 = 0
              CT_Test = False
              CT_ConsTab = False
              CT_Search = False
              Text = ''
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              OnExit = editEstornoDebitosExit
            end
            object editSubTotal: TrsSuperEdit
              Left = 278
              Top = 90
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Format = foCurrency
              CT_NumFields = 0
              CT_RetField1 = 0
              CT_RetField2 = 0
              CT_Test = False
              CT_ConsTab = False
              CT_Search = False
              Text = ''
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
            object editSaldoCredorAnterior: TrsSuperEdit
              Left = 278
              Top = 117
              Width = 121
              Height = 21
              Options = [soAutoAlign, soAllowspaces, soEnterToTab]
              Alignment = taRightJustify
              Format = foCurrency
              CT_NumFields = 0
              CT_RetField1 = 0
              CT_RetField2 = 0
              CT_Test = False
              CT_ConsTab = False
              CT_Search = False
              Text = ''
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 4
            end
            object EditTotalCredito: TrsSuperEdit
              Left = 278
              Top = 144
              Width = 121
              Height = 21
              Options = [soAutoAlign, soAllowspaces, soEnterToTab]
              Alignment = taRightJustify
              Format = foCurrency
              CT_NumFields = 0
              CT_RetField1 = 0
              CT_RetField2 = 0
              CT_Test = False
              CT_ConsTab = False
              CT_Search = False
              Text = ''
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 5
            end
          end
          object Panel4: TPanel
            Left = 31
            Top = 241
            Width = 848
            Height = 135
            BevelInner = bvLowered
            TabOrder = 2
            object Label19: TLabel
              Left = 22
              Top = 24
              Width = 83
              Height = 13
              Caption = 'Saldo devedor'
              Color = 12615680
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label20: TLabel
              Left = 22
              Top = 53
              Width = 58
              Height = 13
              Caption = 'Dedu'#231#245'es'
              Color = 12615680
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label21: TLabel
              Left = 22
              Top = 82
              Width = 106
              Height = 13
              Caption = 'Imposto a recolher'
              Color = 12615680
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label22: TLabel
              Left = 22
              Top = 112
              Width = 289
              Height = 13
              Caption = 'Saldo credor a transportar para o per'#237'odo seguinte'
              Color = 12615680
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object editSaldoDevedor: TrsSuperEdit
              Left = 415
              Top = 16
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Format = foCurrency
              CT_NumFields = 0
              CT_RetField1 = 0
              CT_RetField2 = 0
              CT_Test = False
              CT_ConsTab = False
              CT_Search = False
              Text = ''
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object editDeducoes: TrsSuperEdit
              Left = 415
              Top = 45
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Format = foCurrency
              CT_NumFields = 0
              CT_RetField1 = 0
              CT_RetField2 = 0
              CT_Test = False
              CT_ConsTab = False
              CT_Search = False
              Text = ''
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object EditImpostoRecolher: TrsSuperEdit
              Left = 415
              Top = 74
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Format = foCurrency
              CT_NumFields = 0
              CT_RetField1 = 0
              CT_RetField2 = 0
              CT_Test = False
              CT_ConsTab = False
              CT_Search = False
              Text = ''
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object editSaldoCredorSeguinte: TrsSuperEdit
              Left = 415
              Top = 104
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Format = foCurrency
              CT_NumFields = 0
              CT_RetField1 = 0
              CT_RetField2 = 0
              CT_Test = False
              CT_ConsTab = False
              CT_Search = False
              Text = ''
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
          end
        end
        object TabST: TcxTabSheet
          Caption = 'Substitui'#231#227'o Tribut'#225'ria'
          ImageIndex = 1
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
        end
        object TabNaturezas: TcxTabSheet
          Caption = 'Naturezas'
          ImageIndex = 2
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
        end
        object TabObs: TcxTabSheet
          Caption = 'Observa'#231#245'es'
          ImageIndex = 3
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
        end
        object tabGIA: TcxTabSheet
          Caption = 'GIAs'
          ImageIndex = 4
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object cxGroupBox13: TcxGroupBox
            Left = 0
            Top = 0
            Align = alClient
            Caption = ' Rela'#231#227'o de GIAs'
            TabOrder = 0
            Height = 392
            Width = 921
            object Panel5: TPanel
              Left = 2
              Top = 18
              Width = 768
              Height = 372
              Align = alClient
              TabOrder = 0
              ExplicitWidth = 767
              ExplicitHeight = 368
              object cxGrid1: TcxGrid
                Left = 1
                Top = 1
                Width = 763
                Height = 361
                Align = alClient
                TabOrder = 0
                ExplicitWidth = 765
                ExplicitHeight = 366
                object cxGrid1DBTableView: TcxGridDBTableView
                  Navigator.Buttons.CustomButtons = <>
                  DataController.DataSource = DSGrid
                  DataController.Summary.DefaultGroupSummaryItems = <>
                  DataController.Summary.FooterSummaryItems = <>
                  DataController.Summary.SummaryGroups = <>
                  OptionsData.CancelOnExit = False
                  OptionsData.Deleting = False
                  OptionsData.DeletingConfirmation = False
                  OptionsData.Editing = False
                  OptionsData.Inserting = False
                  OptionsSelection.CellSelect = False
                  OptionsSelection.MultiSelect = True
                  OptionsView.GroupByBox = False
                  OptionsView.Indicator = True
                  object cxGrid1DBTableViewCTE_SALDOCREDOR_ID: TcxGridDBColumn
                    DataBinding.FieldName = 'CTE_SALDOCREDOR_ID'
                    Visible = False
                  end
                  object cxGrid1DBTableViewNOME: TcxGridDBColumn
                    Caption = 'Filial'
                    DataBinding.FieldName = 'NOME'
                    Width = 125
                  end
                  object cxGrid1DBTableViewCTE_FILIAL_ID: TcxGridDBColumn
                    DataBinding.FieldName = 'CTE_FILIAL_ID'
                    Visible = False
                  end
                  object cxGrid1DBTableViewARQUIVO: TcxGridDBColumn
                    Caption = 'Arquivo GIA'
                    DataBinding.FieldName = 'ARQUIVO'
                    Width = 298
                  end
                  object cxGrid1DBTableViewPERIODO: TcxGridDBColumn
                    Caption = 'Per'#237'odo'
                    DataBinding.FieldName = 'PERIODO'
                    Width = 68
                  end
                  object cxGrid1DBTableViewDATACADASTRO: TcxGridDBColumn
                    Caption = 'Data da Gera'#231#227'o'
                    DataBinding.FieldName = 'DATACADASTRO'
                    Width = 126
                  end
                  object cxGrid1DBTableViewSALDOINICIAL: TcxGridDBColumn
                    Caption = 'Saldo Anterior'
                    DataBinding.FieldName = 'SALDOINICIAL'
                  end
                  object cxGrid1DBTableViewSALDOFINAL: TcxGridDBColumn
                    Caption = 'Saldo Seguinte'
                    DataBinding.FieldName = 'SALDOFINAL'
                  end
                end
                object cxGrid1Level1: TcxGridLevel
                  GridView = cxGrid1DBTableView
                end
              end
            end
            object Panel6: TPanel
              Left = 770
              Top = 18
              Width = 149
              Height = 372
              Align = alRight
              TabOrder = 1
              ExplicitLeft = 769
              ExplicitHeight = 368
              object ButExcluirItem: TcxButton
                Left = 16
                Top = 324
                Width = 113
                Height = 25
                Hint = '|Apaga os dados do contato selecionado.'
                Caption = '&Excluir'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                OnClick = ButExcluirItemClick
              end
            end
          end
        end
      end
    end
  end
  inherited DSGrid: TDataSource
    Left = 765
    Top = 214
  end
  inherited TimerCad: TTimer
    Left = 34
    Top = 34
  end
  inherited dspGrid: TDataSetProvider
    Left = 763
    Top = 92
  end
  inherited cdsGrid: TClientDataSet
    Params = <
      item
        DataType = ftString
        Name = 'CTE_FILIAL_ID'
        ParamType = ptInput
      end>
    Left = 756
    Top = 160
    object cdsGridCTE_SALDOCREDOR_ID: TIntegerField
      FieldName = 'CTE_SALDOCREDOR_ID'
      Required = True
    end
    object cdsGridNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsGridCTE_FILIAL_ID: TStringField
      FieldName = 'CTE_FILIAL_ID'
      Size = 15
    end
    object cdsGridARQUIVO: TStringField
      FieldName = 'ARQUIVO'
      Size = 100
    end
    object cdsGridPERIODO: TStringField
      FieldName = 'PERIODO'
      Size = 8
    end
    object cdsGridDATACADASTRO: TSQLTimeStampField
      FieldName = 'DATACADASTRO'
    end
    object cdsGridSALDOINICIAL: TFMTBCDField
      FieldName = 'SALDOINICIAL'
      Precision = 18
      Size = 2
    end
    object cdsGridSALDOFINAL: TFMTBCDField
      FieldName = 'SALDOFINAL'
      Precision = 18
      Size = 2
    end
  end
  inherited QGrid: TFDQuery
    SQL.Strings = (
      
        'SELECT S.CTE_SALDOCREDOR_ID, F.NOME, S.CTE_FILIAL_ID, S.ARQUIVO,' +
        ' S.PERIODO, S.DATACADASTRO, S.SALDOINICIAL, S.SALDOFINAL'
      ' FROM CTE_SALDOCREDOR S'
      ' INNER JOIN CTE_FILIAL F ON F.CTE_FILIAL_ID = S.CTE_FILIAL_ID'
      ' WHERE S.CTE_FILIAL_ID = :CTE_FILIAL_ID'
      'ORDER BY S.CTE_SALDOCREDOR_ID'
      '')
    Left = 764
    Top = 38
    ParamData = <
      item
        Name = 'CTE_FILIAL_ID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object OpenTextFileDialog: TOpenTextFileDialog
    Left = 616
    Top = 232
  end
end
