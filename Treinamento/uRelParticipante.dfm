inherited FrmRelParticipante: TFrmRelParticipante
  Caption = 'Relatorio por Participante'
  ClientHeight = 502
  ClientWidth = 1142
  ExplicitWidth = 1158
  ExplicitHeight = 540
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanFundo: TPanel
    Width = 1142
    Height = 502
    inherited PanTitulo: TPanel
      Width = 1138
      inherited ImaBarraSup: TImage
        Width = 1134
      end
    end
    inherited ToolBar: TToolBar
      Top = 442
      Width = 1138
      inherited ButPesquisar: TcxButton
        TabOrder = 4
        OnClick = ButPesquisarClick
      end
      inherited ButImprimir: TcxButton
        OnClick = ButImprimirClick
      end
      object ButExcel: TcxButton
        Left = 167
        Top = 0
        Width = 36
        Height = 33
        Hint = 'Exportar para Excel (Alt+E)'
        Caption = '   &E'
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = 'Office2007Blue'
        OptionsImage.Glyph.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000090312
          086B1E542ED771A680D2274F3398081F0E6001060328020202140808082E0202
          0212000000030000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000184927CA1467
          2EFF1E793BFEC2E5CDFFB0D8BFFFB4DAC2FFAADBB9FEA4CEB3F8E7EDECFABEC0
          C0E5848585BF4B4C4C8E1D1D1D590707072A0101010D00000002000000000000
          00000000000000000000000000000000000000000000000000000F4D23D61C78
          3AFF208843FFB3DDC0FF7FCB9FFF87D9ABFF82DCA9FFA2D9BBFFFEFFFFFFF8FB
          F9FFFFFFFFFFFFFFFFFFFDFEFEFEEEF0F0FABBBDBDE27E7F7FB9424343861717
          1751040404220000000800000000000000000000000000000000115126D42080
          41FF259149FFB1DBBFFF78C899FF80D6A6FF85DFAEFFAFE3C8FFFBFDFCFF8ECE
          A9FFA5DCBCFFADDABEFFB1DCBFFFE6F3E9FFF7FBF9FFFCFEFDFFFFFFFFFFFEFF
          FFFFE8ECECF9B0B4B3DD6E7271B03437367A0F10104501010111125227D32384
          44FF28954DFFB2DABFFF72C493FF78D19EFF7EDAA7FFB2E1C9FFF2F9F5FF78C9
          9EFF86D5ACFF79C99CFF64B883FFCBE4D2FFC5E5D2FF9EDBB9FFA6D9BAFFAEDB
          BDFFEDF6F0FFEFF7F2FFF9FCFAFFFEFFFFFFF8FCFCFE4D52518F135127D12485
          45FF2A964EFFB2DABFFF6ABE8BFF70CA95FF74D49EFFB6E1CBFFE8F4EDFF8CD9
          B4FF8ED8B0FF89D2A8FF7DC598FFD9EADEFFB3DEC7FF86D6AEFF7CCC9FFF63B7
          82FFE0EEE4FFB8E2CBFF95D7B2FF95D0ABFFC7E6D1FF4B4F4E89145229D02685
          47FF2B9850FFB2D9BFFF62B783FF67C38CFF6ACC93FFBBE0CDFFF4FAF6FFD5F0
          E0FFCFEBDAFFCBEAD6FFC6E6D0FFEBF4EDFFB9E6CFFFA0E1BFFF9ADAB5FF92D0
          A8FFECF5EFFFA9DEC3FF86D6ACFF73C594FFACD4BAFF41464580155229CF2887
          49FF2C9951FFB1D9BFFF5AB07AFF5EBB82FF60C388FFC1E1D0FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4FAF6FFE3F2E9FFDDF0E4FFD8ED
          DEFFF9FBF9FFC1E8D4FFAAE0C2FFABDFBFFFD2EADBFF383C3B7716532ACF2A88
          4AFF2E9A53FFB1D8BEFF52A872FF56B379FF57BA7EFFC9E3D6FFF8FBF9FFF7FB
          F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F9F6FFC7E0CFFFD9E6DDFFF2F6
          F3FFFFFFFFFFFEFEFEFFFFFFFFFFF8FDFCFFF2FBF9FF2F33326E17522BCE2C89
          4CFF309B54FFB2D8BFFF4CA26BFF51AD73FF51B376FFD3E7DDFFF8FBF9FFADDD
          C0FF9CD7B5FF82C69FFF8CC8A5FF98C9AAFF509C68FF228B45FF2C8349FF79B2
          89FFF1F4F1FFA6DABDFFA0DAB9FF9ED4B2FFCAE9D7FF2A2D2C6518542DCF2E8A
          4EFF319D56FFB2D7BFFF489D67FF52AA72FF52AE74FFDEECE6FFFFFFFFFFF0F7
          F3FFA6DCBEFF91DAB5FF75C99CFF31874FFF1C793CFF277F46FF66A278FFEDF3
          EEFFFFFFFFFF8FD4B1FF83D3A8FF6EC18FFFB3DAC3FF2023235B1A552DCF308B
          50FF329E57FFB2D6BEFF449962FF51A770FF4FA76FFFEAF3EFFFFFFFFFFFFFFF
          FFFFE3F1E8FF97D5B2FF398F58FF288347FF338951FF599B6FFF53AA71FFC4E4
          CDFFFFFFFFFFA2DFC0FF9FDCBAFFAEE2C2FFD1ECDEFF1B1D1D521C5730D1328D
          52FF34A059FFB1D5BDFF449861FF54A872FF51A46FFFF4F9F8FFFFFFFFFFFFFF
          FFFFF8FBF9FF509566FF1D7E3EFF228142FF489160FFCBDFD1FFDAECDFFFD5E9
          DAFFFFFFFFFFFFFFFFFFF9FCFAFFECF5EFFFEDF9F5FF151616481D5931D3348E
          54FF35A25AFFAED3BBFF449962FF5BAD78FF5BA877FFF9FDFCFFFFFFFFFFF9FB
          FAFF5F9F73FF208241FF228444FF43915DFF5FB280FF85BF99FFFDFEFEFFFFFF
          FFFFFFFFFFFFADDDC1FFACDCC0FF9ED4B1FFD5EEE1FF111212401F5A33D5368F
          56FF35A45AFFAED3BBFF48A168FF68B786FF6DB388FFFBFEFEFFF9FBFAFF7BB7
          8CFF459860FF48A266FF50A26AFF8EC2A0FF68BB89FF5DB27DFFA8D2B5FFFFFF
          FFFFFDFEFEFF7ECDA4FF80D0A5FF69BC89FFCAE6D7FF0D0E0E37205C34D73891
          58FF39A75DFFB2D7BFFF48A76BFF7AC599FF83C29EFFFCFEFEFFDBE9DEFFACD1
          B6FFA5CAB0FF9FCFAEFFDBECE0FFFBFDFBFF9BC9ABFF8FC4A1FF8DCB9FFFEAF3
          ECFFFAFDFBFF94DCB8FF9FDEBBFFABE0BFFFDDF0E7FF090A0A2D225D35D83A92
          59FF42A965FFB9DFC6FF42AB69FF8FD3AEFF98CEB2FFFCFEFEFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFEFEFEFFE9F6EEFFE7F3EBFFE4F0E8FFEAF6F3FE07070724225C36D83C92
          5BFF4BA86CFFC3EBCFFF40AF68FF9EDEBFFFA8D7C0FFE2F1ECFFE6F3EDFFE3F2
          EAFFDFEFE6FFDBEDE3FFD7EBE0FFD3E9DCFFCEE7D8FFC9E5D4FFC2E0CEFFB9DB
          C6FFADD4BDFFAACFB8FFA9BCB1DB616464964F55548F0101010D225232C74A99
          66FF46A167FF98D9ADFF8ED3A7FF92DDB6FFABE5C9FFA0DDBDFF92D3ADFF83C8
          9EFF78C193FF74BF8FFF6FBC8AFF68B885FF61B37EFF58AF77FF4FA96FFF3F9F
          61FF298E4DFF2D884EFF496E54AA000000000000000000000000102C1A95398A
          56FF459E66FF5FB97EFFD6F1DFFF7DD69FFFB8EAD1FFACE1C4FF9CD7B4FF8DCD
          A5FF81C59AFF7CC295FF77BF91FF70BB8BFF69B685FF60B17DFF56AC75FF45A0
          66FF2C8D4EFF298449FF50785BB200000000000000000000000002060436337F
          4DFE419660FF49A36AFF7FCC99FFD6F0DFFF82CE9FFFA1D9B8FFA2D6B6FF93CC
          A8FF87C59DFF84C39AFF7FC096FF78BC90FF70B78AFF68B283FF5DAC79FF4CA0
          6AFF2D8A4EFF2A8149FF567E63B900000000000000000000000000000000112D
          1A96378553FF429661FF48A068FF73C48EFFC8EDD3FFBCDDC8FF9FCEB0FF92C5
          A5FF8AC09DFF85BD99FF81BA95FF79B78FFF72B389FF68AC80FF5FA779FF4E9C
          6AFF358A53FF3A8855FF668A71C0000000000000000000000000000000000000
          00030F27188D337C4DFB3C8C59FF41935FFF4BA169FF58B476FF74C48DFF80CA
          97FF85CD9BFF8AD09FFF8FD3A4FF94D5A8FF97D6AAFF9AD8ADFF9BD9AEFF9CD9
          AFFF9EDAB0FFB1E3C0FF6C9077C7000000000000000000000000000000000000
          000000000000010302260E241685255335C536744BE732784AF032794BF1347A
          4DF4347C4DF6357D4EF8357E4EFA35804FFB35804FFB35804FFB35804FFD3980
          51FD337148F00F26168E0102011F000000000000000000000000}
        OptionsImage.Margin = 5
        TabOrder = 3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = ButExcelClick
      end
    end
    inherited StatusBar: TdxStatusBar
      Top = 480
      Width = 1138
    end
    object cxFiltro: TcxGroupBox
      Left = 2
      Top = 4
      Align = alTop
      Caption = 'Parametros'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -10
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      TabOrder = 3
      ExplicitWidth = 730
      Height = 85
      Width = 1138
      object Panel5: TPanel
        Tag = -1
        Left = 10
        Top = 18
        Width = 707
        Height = 27
        Alignment = taLeftJustify
        BevelInner = bvLowered
        Caption = 
          '  Inicial                                                  T'#233'rmi' +
          'no'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object EdiDatIni: TcxDateEdit
          Left = 100
          Top = 3
          TabOrder = 0
          Width = 87
        end
        object EdiDatFim: TcxDateEdit
          Left = 240
          Top = 3
          TabOrder = 1
          Width = 88
        end
        object spbLimpaData: TcxButton
          Left = 336
          Top = 3
          Width = 26
          Height = 23
          Hint = 'Limpar campo Data Inicio e T'#233'rmino'
          OptionsImage.Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            7777777777777777777777000000077777777077777700777777707777770307
            77777077777703307777770FBFBFB03307777770FBFBFB03307777770FBFBFB0
            3307777770FBFBFB03077777770FBFBFB00777777770FBFBFB07777777770000
            0077777777777777777777777777777777777777777777777777}
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = spbLimpaDataClick
        end
      end
      object Panel1: TPanel
        Tag = -1
        Left = 10
        Top = 47
        Width = 707
        Height = 27
        Alignment = taLeftJustify
        BevelInner = bvLowered
        Caption = ' Participante'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object spbLimpaParticipante: TcxButton
          Left = 581
          Top = 4
          Width = 26
          Height = 23
          Hint = 'Limpar campo Participante'
          OptionsImage.Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            7777777777777777777777000000077777777077777700777777707777770307
            77777077777703307777770FBFBFB03307777770FBFBFB03307777770FBFBFB0
            3307777770FBFBFB03077777770FBFBFB00777777770FBFBFB07777777770000
            0077777777777777777777777777777777777777777777777777}
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = spbLimpaParticipanteClick
        end
        object EditBuscaParticipante: TEditBusca
          Left = 100
          Top = 3
          Width = 473
          Height = 22
          TabOrder = 1
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
      end
    end
    object cxPageControl1: TcxPageControl
      Left = 2
      Top = 89
      Width = 1138
      Height = 353
      Align = alClient
      TabOrder = 4
      Properties.CustomButtons.Buttons = <>
      ExplicitTop = 201
      ExplicitWidth = 730
      ExplicitHeight = 213
      ClientRectBottom = 349
      ClientRectLeft = 4
      ClientRectRight = 1134
      ClientRectTop = 4
    end
    object cxGrid1: TcxGrid
      Left = 2
      Top = 89
      Width = 1138
      Height = 353
      Align = alClient
      TabOrder = 5
      ExplicitLeft = 0
      ExplicitTop = 84
      ExplicitWidth = 1075
      object cxGrid1DBTableView1: TcxGridDBTableView
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
        OptionsView.Indicator = True
        object cxGrid1DBTableView1FUN_MATRICULA: TcxGridDBColumn
          Caption = 'Matricula'
          DataBinding.FieldName = 'FUN_MATRICULA'
          Width = 61
        end
        object cxGrid1DBTableView1FUN_NOME: TcxGridDBColumn
          Caption = 'Participante'
          DataBinding.FieldName = 'FUN_NOME'
          Width = 315
        end
        object cxGrid1DBTableView1CUR_NOMCURSO: TcxGridDBColumn
          Caption = 'Treinamento'
          DataBinding.FieldName = 'CUR_NOMCURSO'
          Width = 271
        end
        object cxGrid1DBTableView1TRE_DTREALIZACAO: TcxGridDBColumn
          Caption = 'Dt Inicio'
          DataBinding.FieldName = 'TRE_DTREALIZACAO'
          Width = 87
        end
        object cxGrid1DBTableView1TRE_DTTERMINO: TcxGridDBColumn
          Caption = 'Dt T'#233'rmino'
          DataBinding.FieldName = 'TRE_DTTERMINO'
          Width = 98
        end
        object cxGrid1DBTableView1FUN_CARGO: TcxGridDBColumn
          Caption = 'Cargo'
          DataBinding.FieldName = 'FUN_CARGO'
          Width = 212
        end
        object cxGrid1DBTableView1DESCRICAO: TcxGridDBColumn
          Caption = 'Periodicidade'
          DataBinding.FieldName = 'DESCRICAO'
          Width = 93
        end
        object cxGrid1DBTableView1TRE_OBRIGATORIO: TcxGridDBColumn
          Caption = 'Obrigat'#243'rio'
          DataBinding.FieldName = 'TRE_OBRIGATORIO'
          Width = 60
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
  end
  inherited DSGrid: TDataSource
    DataSet = QGrid
    Left = 613
    Top = 278
  end
  inherited TimerCad: TTimer
    Left = 674
    Top = 218
  end
  inherited dspGrid: TDataSetProvider
    Left = 635
    Top = 380
  end
  inherited cdsGrid: TClientDataSet
    Left = 676
    Top = 368
    object cdsGridFUN_MATRICULA: TStringField
      FieldName = 'FUN_MATRICULA'
      Size = 6
    end
    object cdsGridFUN_NOME: TStringField
      FieldName = 'FUN_NOME'
      Size = 100
    end
    object cdsGridCUR_NOMCURSO: TStringField
      FieldName = 'CUR_NOMCURSO'
      Size = 100
    end
    object cdsGridTRE_DTREALIZACAO: TSQLTimeStampField
      FieldName = 'TRE_DTREALIZACAO'
    end
    object cdsGridTRE_DTTERMINO: TSQLTimeStampField
      FieldName = 'TRE_DTTERMINO'
    end
    object cdsGridFUN_CARGO: TStringField
      FieldName = 'FUN_CARGO'
      Size = 100
    end
    object cdsGridFUN_CODCENTRO: TStringField
      FieldName = 'FUN_CODCENTRO'
    end
    object cdsGridDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object cdsGridPER_DIAS: TIntegerField
      FieldName = 'PER_DIAS'
    end
    object cdsGridTRE_OBRIGATORIO: TStringField
      FieldName = 'TRE_OBRIGATORIO'
      FixedChar = True
      Size = 1
    end
  end
  inherited QGrid: TFDQuery
    SQL.Strings = (
      'Select F.FUN_MATRICULA,'
      '    F.FUN_NOME,'
      '    T.CUR_NOMCURSO,'
      '    T.TRE_DTREALIZACAO,'
      '    T.TRE_DTTERMINO,'
      '    F.FUN_CARGO,'
      '    F.FUN_CODCENTRO,'
      '    PR.DESCRICAO,'
      '    PR.PER_DIAS,'
      '    T.TRE_OBRIGATORIO'
      'From TRE_TREINAMENTO T'
      
        'INNER JOIN TRE_PARTICIPANTES P ON P.TRE_TREINAMENTO_ID = T.TRE_T' +
        'REINAMENTO_ID'
      
        'INNER JOIN TRE_FUNCIONARIO F ON F.FUN_MATRICULA = P.FUN_MATRICUL' +
        'A'
      
        'INNER JOIN TRE_PERIODICIDADE PR ON PR.PERIODICIDADE_ID = T.TRE_P' +
        'ERIODICIDADE'
      'Where 1 = 1')
    Left = 676
    Top = 278
    object QGridFUN_MATRICULA: TStringField
      FieldName = 'FUN_MATRICULA'
      Origin = 'FUN_MATRICULA'
      Size = 6
    end
    object QGridFUN_NOME: TStringField
      FieldName = 'FUN_NOME'
      Origin = 'FUN_NOME'
      Size = 100
    end
    object QGridCUR_NOMCURSO: TStringField
      FieldName = 'CUR_NOMCURSO'
      Origin = 'CUR_NOMCURSO'
      Size = 100
    end
    object QGridTRE_DTREALIZACAO: TSQLTimeStampField
      FieldName = 'TRE_DTREALIZACAO'
      Origin = 'TRE_DTREALIZACAO'
    end
    object QGridTRE_DTTERMINO: TSQLTimeStampField
      FieldName = 'TRE_DTTERMINO'
      Origin = 'TRE_DTTERMINO'
    end
    object QGridFUN_CARGO: TStringField
      FieldName = 'FUN_CARGO'
      Origin = 'FUN_CARGO'
      Size = 100
    end
    object QGridFUN_CODCENTRO: TStringField
      FieldName = 'FUN_CODCENTRO'
      Origin = 'FUN_CODCENTRO'
    end
    object QGridDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 50
    end
    object QGridPER_DIAS: TIntegerField
      FieldName = 'PER_DIAS'
      Origin = 'PER_DIAS'
    end
    object QGridTRE_OBRIGATORIO: TStringField
      FieldName = 'TRE_OBRIGATORIO'
      Origin = 'TRE_OBRIGATORIO'
      FixedChar = True
      Size = 1
    end
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '*.xlsx'
    Filter = 'Arquivos Excel|*.xlsx'
    Left = 408
    Top = 288
  end
  object dxComponentPrinter: TdxComponentPrinter
    CurrentLink = dxPrinterGrid
    Options = [cpoAutoRebuildBeforePreview, cpoAutoRebuildBeforePrint, cpoGenerateReportProgressEvent, cpoDropStorageModeAfterPreview]
    Version = 0
    Left = 480
    Top = 264
    object dxPrinterGrid: TdxGridReportLink
      Active = True
      Component = cxGrid1
      PrinterPage.DMPaper = 9
      PrinterPage.Footer = 6350
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.Orientation = poLandscape
      PrinterPage.PageSize.X = 210000
      PrinterPage.PageSize.Y = 297000
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportDocument.CreationDate = 43214.442495578700000000
      ReportTitle.Text = 'Relat'#243'rio por Participante'
      BuiltInReportLink = True
    end
  end
end
