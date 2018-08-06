inherited FrmCadPeriodicidade: TFrmCadPeriodicidade
  Caption = 'Cadastro de Periodicidade'
  ExplicitWidth = 750
  ExplicitHeight = 512
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanFundo: TPanel
    inherited PanTitulo: TPanel
      TabOrder = 3
    end
    inherited Panel27: TPanel
      TabOrder = 5
      inherited ButSalvar: TcxButton
        Top = 2
        ExplicitTop = 2
      end
      inherited ButCancelar: TcxButton
        Top = 2
        ExplicitTop = 2
      end
    end
    object Panel2: TPanel
      Tag = -1
      Left = 6
      Top = 37
      Width = 611
      Height = 27
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = '  Periodicidade'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object EdiNome: TrsSuperEdit
        Tag = -1
        Left = 116
        Top = 2
        Width = 487
        Height = 22
        TagName = 'DESCRICAO'
        CT_NumFields = 0
        CT_RetField1 = 0
        CT_RetField2 = 0
        CT_Test = False
        CT_ConsTab = False
        CT_Search = False
        MaxLength = 50
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
      Tag = -2
      Left = 6
      Top = 9
      Width = 611
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
      object EdiCodigo: TrsSuperEdit
        Tag = -2
        Left = 308
        Top = 3
        Width = 0
        Height = 22
        Alignment = taRightJustify
        Format = foInteger
        TagName = 'PERIODICIDADE_ID'
        CT_Titulo = 'Consulta de Periodicidade'
        CT_TableName = 'TRE_PERIODICIDADE'
        CT_DataBaseName = 'dbdSGD'
        CT_NumFields = 2
        CT_ColTit = 'C'#243'digo;Periodicidade'
        CT_ColField = 'PERIODICIDADE_ID;DESCRICAO'
        CT_RetField1 = 0
        CT_RetControl1 = EdiCodigo
        CT_RetField2 = 1
        CT_RetControl2 = EdiNome
        CT_Test = False
        CT_ConsTab = True
        CT_KeyValue = EdiCodigo
        CT_Search = False
        MaxLength = 15
        Text = ''
        CharCase = ecUpperCase
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        Visible = False
      end
      object EditBuscaPeriodo: TEditBusca
        Left = 116
        Top = 4
        Width = 121
        Height = 22
        TabOrder = 1
        OnClick = EditBuscaPeriodoClick
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
    object Panel3: TPanel
      Tag = -1
      Left = 6
      Top = 65
      Width = 611
      Height = 27
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = '  Nr'#186' de Dias'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object ediDias: TrsSuperEdit
        Tag = -1
        Left = 116
        Top = 2
        Width = 121
        Height = 22
        Alignment = taRightJustify
        Format = foInteger
        TagName = 'PER_DIAS'
        CT_NumFields = 0
        CT_RetField1 = 0
        CT_RetField2 = 0
        CT_Test = False
        CT_ConsTab = False
        CT_Search = False
        MaxLength = 50
        Text = ''
        CharCase = ecUpperCase
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  object qryAux: TFDQuery
    Connection = DB_Conect.SQLConnection
    Left = 528
    Top = 144
  end
end
