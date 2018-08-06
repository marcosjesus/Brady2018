inherited FrmCadCurso: TFrmCadCurso
  Caption = 'Cadastro de Curso'
  ExplicitWidth = 750
  ExplicitHeight = 512
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanFundo: TPanel
    inherited Panel27: TPanel
      inherited ButSalvar: TcxButton
        Top = 2
        ExplicitTop = 2
      end
      inherited ButCancelar: TcxButton
        Top = 2
        ExplicitTop = 2
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
      Caption = '  C'#243'digo do Curso'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object EdiCodigo: TrsSuperEdit
        Tag = -2
        Left = 468
        Top = 1
        Width = 0
        Height = 22
        Alignment = taRightJustify
        Format = foInteger
        TagName = 'CUR_ID'
        CT_Titulo = 'Consulta de Cursos'
        CT_TableName = 'TRE_CURSO'
        CT_NumFields = 2
        CT_ColTit = 'C'#243'digo;Nome do Curso'
        CT_ColField = 'CUR_ID;CUR_NOMCURSO'
        CT_RetField1 = 0
        CT_RetControl1 = EdiCodigo
        CT_RetField2 = 0
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
      object EditBuscaCurso: TEditBusca
        Left = 116
        Top = 3
        Width = 121
        Height = 22
        TabOrder = 1
        OnClick = EditBuscaCursoClick
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
      Caption = '  Nome'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      object EdiNome: TrsSuperEdit
        Tag = -1
        Left = 116
        Top = 2
        Width = 487
        Height = 22
        TagName = 'CUR_NOMCURSO'
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
    object Panel3: TPanel
      Tag = -1
      Left = 6
      Top = 65
      Width = 611
      Height = 27
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = ' Nota M'#237'nima'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      object rsSuperEdit1: TrsSuperEdit
        Tag = -1
        Left = 116
        Top = 2
        Width = 121
        Height = 22
        Alignment = taRightJustify
        Format = foReal
        TagName = 'CUR_NOTAMINIMA'
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
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object Panel4: TPanel
      Tag = -1
      Left = 6
      Top = 93
      Width = 611
      Height = 27
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = ' Carga Hor'#225'ria'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      object rsSuperEdit2: TrsSuperEdit
        Tag = -1
        Left = 116
        Top = 2
        Width = 121
        Height = 22
        Alignment = taRightJustify
        TagName = 'CUR_CARGAHORARIA'
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
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  inherited TimerPerfil: TTimer
    Left = 602
    Top = 210
  end
  object qryAux: TFDQuery
    Connection = DB_Conect.SQLConnection
    Left = 496
    Top = 136
  end
end
