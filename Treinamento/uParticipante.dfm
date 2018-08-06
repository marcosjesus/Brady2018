inherited FrmCadParticipante: TFrmCadParticipante
  Caption = 'Cadastro de Participante'
  ClientWidth = 1023
  ExplicitWidth = 1039
  ExplicitHeight = 512
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanFundo: TPanel
    Width = 1023
    ParentFont = False
    ExplicitWidth = 1023
    inherited PanTitulo: TPanel
      Width = 1019
      TabOrder = 8
      ExplicitWidth = 1019
      inherited ImaBarraSup: TImage
        Width = 1015
        ExplicitWidth = 1015
      end
    end
    inherited StatusBar: TdxStatusBar
      Width = 1019
      ExplicitWidth = 1019
    end
    inherited Panel27: TPanel
      Width = 1019
      TabOrder = 10
      ExplicitWidth = 1019
    end
    object Panel13: TPanel
      Tag = -2
      Left = 1
      Top = 4
      Width = 1018
      Height = 27
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = '  C'#243'digo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object EditBuscaParticipante: TEditBusca
        Left = 130
        Top = 2
        Width = 176
        Height = 22
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = EditBuscaParticipanteClick
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
      object EdiCodigo: TrsSuperEdit
        Tag = -2
        Left = 528
        Top = 2
        Width = 0
        Height = 22
        Hint = 'Clique com o bot'#227'o direito para Pesquisa (F1)'
        Alignment = taRightJustify
        TagName = 'FUN_FUNCIONARIO_ID'
        CT_NumFields = 3
        CT_RetField1 = 0
        CT_RetControl1 = EdiCodigo
        CT_RetField2 = 2
        CT_Test = False
        CT_ConsTab = True
        CT_KeyValue = EdiCodigo
        CT_Search = False
        MaxLength = 20
        Text = ''
        CharCase = ecUpperCase
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
        Visible = False
      end
    end
    object Panel2: TPanel
      Tag = -1
      Left = 1
      Top = 58
      Width = 1018
      Height = 27
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = ' Nome do Participante'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object EdiNome: TrsSuperEdit
        Tag = -1
        Left = 130
        Top = 3
        Width = 506
        Height = 22
        Hint = 'Nome do Participante'
        TagName = 'FUN_NOME'
        CT_NumFields = 0
        CT_RetField1 = 0
        CT_RetField2 = 0
        CT_Test = False
        CT_ConsTab = False
        CT_Search = False
        MaxLength = 100
        Text = ''
        CharCase = ecUpperCase
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object Panel1: TPanel
      Tag = -1
      Left = 1
      Top = 31
      Width = 1018
      Height = 27
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = ' Matricula'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object ediMatricula: TrsSuperEdit
        Tag = -1
        Left = 130
        Top = 3
        Width = 177
        Height = 22
        Hint = 'Numero da Matricula'
        TagName = 'FUN_MATRICULA'
        CT_NumFields = 0
        CT_RetField1 = 0
        CT_RetField2 = 0
        CT_Test = False
        CT_ConsTab = False
        CT_Search = False
        MaxLength = 10
        Text = ''
        CharCase = ecUpperCase
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object Panel12: TPanel
      Tag = -1
      Left = 1
      Top = 85
      Width = 1018
      Height = 27
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = ' Empresa'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object EditBuscaFilial: TEditBusca
        Left = 130
        Top = 3
        Width = 506
        Height = 22
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = EditBuscaFilialClick
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
      object cxButton4: TcxButton
        Left = 647
        Top = 3
        Width = 26
        Height = 23
        Hint = 'Limpar campo Treinamento'
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
        TabOrder = 1
        OnClick = cxButton4Click
      end
      object ediFilial: TrsSuperEdit
        Tag = -1
        Left = 704
        Top = 3
        Width = 0
        Height = 22
        TagName = 'CODFILIAL'
        CT_NumFields = 0
        CT_RetField1 = 0
        CT_RetField2 = 0
        CT_Test = False
        CT_ConsTab = False
        CT_Search = False
        Text = ''
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        Visible = False
      end
    end
    object Panel3: TPanel
      Tag = -1
      Left = 1
      Top = 112
      Width = 1018
      Height = 27
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = ' Centro de Custo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      object EditBuscaCentroCusto: TEditBusca
        Left = 130
        Top = 3
        Width = 506
        Height = 22
        TabOrder = 0
        OnClick = EditBuscaCentroCustoClick
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
      object cxButton1: TcxButton
        Left = 647
        Top = 3
        Width = 26
        Height = 23
        Hint = 'Limpar campo Treinamento'
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
        TabOrder = 1
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = cxButton1Click
      end
      object ediCentroCusto: TrsSuperEdit
        Tag = -1
        Left = 704
        Top = 8
        Width = 0
        Height = 22
        TagName = 'TRE_CENTROCENTRO'
        CT_NumFields = 0
        CT_RetField1 = 0
        CT_RetField2 = 0
        CT_Test = False
        CT_ConsTab = False
        CT_Search = False
        Text = ''
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        Visible = False
      end
    end
    object Panel4: TPanel
      Tag = -1
      Left = 1
      Top = 139
      Width = 1018
      Height = 27
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = ' Cargo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      object EditBuscaCargo: TEditBusca
        Left = 130
        Top = 3
        Width = 506
        Height = 22
        TabOrder = 0
        OnClick = EditBuscaCargoClick
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
      object cxButton2: TcxButton
        Left = 647
        Top = 4
        Width = 26
        Height = 23
        Hint = 'Limpar campo Treinamento'
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
        TabOrder = 1
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = cxButton2Click
      end
      object ediCargo: TrsSuperEdit
        Tag = -1
        Left = 704
        Top = 9
        Width = 0
        Height = 22
        Alignment = taRightJustify
        Format = foInteger
        TagName = 'TRE_CARGO_ID'
        CT_NumFields = 0
        CT_RetField1 = 0
        CT_RetField2 = 0
        CT_Test = False
        CT_ConsTab = False
        CT_Search = False
        Text = ''
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        Visible = False
      end
    end
    object Panel5: TPanel
      Tag = -1
      Left = 3
      Top = 166
      Width = 1018
      Height = 27
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = ' Data de Desligamento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      object editxtDtDesligamento: TrsSuperEdit
        Tag = -1
        Left = 455
        Top = 3
        Width = 0
        Height = 22
        Format = foFullDate
        TagName = 'FUN_DTDESL'
        CT_NumFields = 0
        CT_RetField1 = 0
        CT_RetField2 = 0
        CT_Test = False
        CT_ConsTab = False
        CT_Search = False
        MaxLength = 10
        Text = '  /  /    '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object EdiDatDesligamento: TcxDateEdit
        Left = 130
        Top = 4
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Arial'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 1
        Width = 121
      end
    end
    object Panel6: TPanel
      Tag = -1
      Left = 2
      Top = 190
      Width = 1019
      Height = 226
      Align = alBottom
      BevelInner = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      object cxGroupBox1: TcxGroupBox
        Left = 2
        Top = 2
        Align = alClient
        Caption = ' Hist'#243'rico de Trabalho'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -10
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 0
        Height = 222
        Width = 1015
        object cxGrid1: TcxGrid
          Left = 2
          Top = 18
          Width = 1011
          Height = 202
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -10
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object cxGrid1DBTableView1: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = dsHistorico
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            object cxGrid1DBTableView1FUN_MATRICULA: TcxGridDBColumn
              Caption = 'Matricula'
              DataBinding.FieldName = 'FUN_MATRICULA'
              Width = 65
            end
            object cxGrid1DBTableView1ALIASEMPRESA: TcxGridDBColumn
              Caption = 'Empresa'
              DataBinding.FieldName = 'ALIASEMPRESA'
              Width = 258
            end
            object cxGrid1DBTableView1CENTROCUSTO: TcxGridDBColumn
              Caption = 'Centro Custo'
              DataBinding.FieldName = 'CENTROCUSTO'
              Width = 276
            end
            object cxGrid1DBTableView1CARGO: TcxGridDBColumn
              Caption = 'Cargo'
              DataBinding.FieldName = 'CARGO'
              Width = 192
            end
            object cxGrid1DBTableView1DATA_ATUAL: TcxGridDBColumn
              Caption = 'Data Inicio'
              DataBinding.FieldName = 'DATA_ATUAL'
              Width = 90
            end
            object cxGrid1DBTableView1DATA_ALTERACAO: TcxGridDBColumn
              Caption = 'Data Ult. Altera'#231#227'o'
              DataBinding.FieldName = 'DATA_ALTERACAO'
              Width = 102
            end
          end
          object cxGrid1Level1: TcxGridLevel
            GridView = cxGrid1DBTableView1
          end
        end
      end
    end
  end
  object qryAux: TFDQuery
    Connection = DB_Conect.SQLConnection
    Left = 654
    Top = 308
  end
  object sqlHistorico: TFDQuery
    Connection = DB_Conect.SQLConnection
    SQL.Strings = (
      
        'SELECT FUN_MATRICULA, F.ALIASEMPRESA, CC.DESCRICAO AS CENTROCUST' +
        'O, C.DESCRICAO AS CARGO, H.DATA_ATUAL, H.DATA_ALTERACAO'
      'FROM TRE_FUNCIONARIO_HISTORICO H'
      
        'LEFT OUTER JOIN TRE_CENTROCUSTO CC ON CC.TRE_CENTROCENTRO = H.TR' +
        'E_CENTROCENTRO'
      'LEFT OUTER JOIN TRE_CARGO C ON C.TRE_CARGO_ID = H.TRE_CARGO_ID'
      'LEFT OUTER JOIN FILIAL F ON F.CODFILIAL = H.CODFILIAL'
      'WHERE H.FUN_MATRICULA = :FUN_MATRICULA'
      'ORDER BY  H.DATA_ALTERACAO DESC')
    Left = 500
    Top = 275
    ParamData = <
      item
        Name = 'FUN_MATRICULA'
        DataType = ftString
        ADDataType = dtAnsiString
        ParamType = ptInput
      end>
    object sqlHistoricoFUN_MATRICULA: TStringField
      DisplayWidth = 10
      FieldName = 'FUN_MATRICULA'
      Origin = 'FUN_MATRICULA'
      Size = 10
    end
    object sqlHistoricoALIASEMPRESA: TStringField
      FieldName = 'ALIASEMPRESA'
      Origin = 'ALIASEMPRESA'
      Size = 50
    end
    object sqlHistoricoCENTROCUSTO: TStringField
      FieldName = 'CENTROCUSTO'
      Origin = 'CENTROCUSTO'
      Size = 100
    end
    object sqlHistoricoCARGO: TStringField
      FieldName = 'CARGO'
      Origin = 'CARGO'
      Size = 100
    end
    object sqlHistoricoDATA_ATUAL: TSQLTimeStampField
      FieldName = 'DATA_ATUAL'
      Origin = 'DATA_ATUAL'
    end
    object sqlHistoricoDATA_ALTERACAO: TSQLTimeStampField
      FieldName = 'DATA_ALTERACAO'
      Origin = 'DATA_ALTERACAO'
    end
  end
  object dsHistorico: TDataSource
    DataSet = sqlHistorico
    Left = 564
    Top = 299
  end
end
