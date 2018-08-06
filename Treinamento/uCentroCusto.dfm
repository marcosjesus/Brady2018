inherited FrmCentroCusto: TFrmCentroCusto
  Caption = 'Cadastro de Centro de Custo'
  ExplicitWidth = 750
  ExplicitHeight = 512
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanFundo: TPanel
    inherited PanTitulo: TPanel
      TabOrder = 4
    end
    inherited Panel27: TPanel
      TabOrder = 6
    end
    object Panel1: TPanel
      Tag = -2
      Left = 2
      Top = 4
      Width = 730
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
        Left = 528
        Top = 2
        Width = 0
        Height = 22
        Hint = 'Clique com o bot'#227'o direito para Pesquisa (F1)'
        Alignment = taRightJustify
        TagName = 'TRE_CENTROCENTRO_ID'
        CT_Titulo = 'Localizar Centro de Custo'
        CT_TableName = 'TRE_CENTROCUSTO'
        CT_NumFields = 3
        CT_ColTit = 'ID;CODIGO;CENTRO DE CUSTO'
        CT_ColField = 'TRE_CENTROCENTRO_ID;TRE_CENTROCENTRO;DESCRICAO'
        CT_RetField1 = 0
        CT_RetControl1 = EdiCodigo
        CT_RetField2 = 2
        CT_RetControl2 = ediCentroCusto
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
        TabOrder = 0
        Visible = False
      end
      object EditBuscaCentroCusto: TEditBusca
        Left = 116
        Top = 2
        Width = 169
        Height = 22
        TabOrder = 1
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
    end
    object Panel3: TPanel
      Tag = -1
      Left = 2
      Top = 85
      Width = 730
      Height = 27
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = '  Ativo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object ediAtivo: TrsSuperEdit
        Tag = -1
        Left = 256
        Top = 3
        Width = 0
        Height = 22
        Hint = 'Status'
        TagName = 'ATIVO'
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
        Visible = False
      end
      object chkStatus: TCheckBox
        Left = 116
        Top = 6
        Width = 25
        Height = 17
        TabOrder = 1
      end
    end
    object Panel2: TPanel
      Tag = -1
      Left = 2
      Top = 58
      Width = 730
      Height = 27
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = '  Descri'#231#227'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object ediDescricao: TrsSuperEdit
        Tag = -1
        Left = 116
        Top = 3
        Width = 521
        Height = 22
        Hint = 'Descri'#231#227'o do Centro de Custo'
        TagName = 'DESCRICAO'
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
    object Panel4: TPanel
      Tag = -1
      Left = 2
      Top = 31
      Width = 730
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
      TabOrder = 1
      object ediCentroCusto: TrsSuperEdit
        Tag = -1
        Left = 116
        Top = 3
        Width = 169
        Height = 22
        Hint = 'Codigo Centro de Custo'
        TagName = 'TRE_CENTROCENTRO'
        CT_NumFields = 0
        CT_RetField1 = 0
        CT_RetField2 = 0
        CT_Test = False
        CT_ConsTab = False
        CT_Search = False
        MaxLength = 20
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
    Left = 192
    Top = 232
  end
end
