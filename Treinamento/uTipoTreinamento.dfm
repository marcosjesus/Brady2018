inherited FrmCadTipoTreinamento: TFrmCadTipoTreinamento
  Caption = 'Cadastro Tipo de Treinamento'
  ExplicitWidth = 750
  ExplicitHeight = 512
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanFundo: TPanel
    object Panel1: TPanel
      Tag = -2
      Left = 6
      Top = 8
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
      TabOrder = 3
      object EdiCodigo: TrsSuperEdit
        Tag = -2
        Left = 369
        Top = 3
        Width = 0
        Height = 22
        TagName = 'TRE_TIPOTREINAMENTO_ID'
        CT_Titulo = 'Consulta de Tipo de Treinamento'
        CT_TableName = 'TRE_TIPOTREINAMENTO'
        CT_NumFields = 2
        CT_ColTit = 'C'#243'digo;Tipo de Treinamento'
        CT_ColField = 'TRE_TIPOTREINAMENTO_ID;DESCRICAO'
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
        TabOrder = 0
        Visible = False
      end
      object EditBuscaTpTreinamento: TEditBusca
        Left = 140
        Top = 3
        Width = 121
        Height = 22
        TabOrder = 1
        OnClick = EditBuscaTpTreinamentoClick
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
    object Panel2: TPanel
      Tag = -1
      Left = 6
      Top = 37
      Width = 611
      Height = 27
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = ' Tipo de Treinamento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      object EdiNome: TrsSuperEdit
        Tag = -1
        Left = 140
        Top = 2
        Width = 463
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
  end
  object qryAux: TFDQuery
    Connection = DB_Conect.SQLConnection
    Left = 600
    Top = 200
  end
end
