object frmConsultaItens: TfrmConsultaItens
  Left = 0
  Top = 0
  Caption = 'Consulta Documentos Fiscal Itens ( NFe )'
  ClientHeight = 580
  ClientWidth = 937
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 937
    Height = 89
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label3: TLabel
      Left = 24
      Top = 7
      Width = 70
      Height = 13
      Caption = 'CNPJ Emitente'
    end
    object EditDocumento: TLabeledEdit
      Left = 24
      Top = 59
      Width = 185
      Height = 21
      EditLabel.Width = 88
      EditLabel.Height = 13
      EditLabel.Caption = 'Nr'#186' de Documento'
      TabOrder = 0
    end
    object GroupBox1: TGroupBox
      Left = 224
      Top = 7
      Width = 281
      Height = 73
      Caption = 'Data de Emiss'#227'o'
      TabOrder = 1
      object Label1: TLabel
        Left = 24
        Top = 24
        Width = 53
        Height = 13
        Caption = 'Data Inicial'
      end
      object Label2: TLabel
        Left = 151
        Top = 24
        Width = 48
        Height = 13
        Caption = 'Data Final'
      end
      object DataIni: TDateTimePicker
        Left = 23
        Top = 40
        Width = 106
        Height = 21
        Date = 43025.455392349540000000
        Time = 43025.455392349540000000
        TabOrder = 0
      end
      object DataFim: TDateTimePicker
        Left = 151
        Top = 40
        Width = 106
        Height = 21
        Date = 43025.455576562500000000
        Time = 43025.455576562500000000
        TabOrder = 1
      end
    end
    object EditCNPJ: TrsSuperEdit
      Tag = -2
      Left = 24
      Top = 22
      Width = 185
      Height = 21
      TagName = 'CTE_EMITENTE_ID'
      CT_Titulo = 'Localizar Emitente'
      CT_TableName = 'CTE_EMITENTE'
      CT_DataBaseName = 'DB_Conect.SQLConnection'
      CT_NumFields = 3
      CT_ColTit = 'Cnpj;Raz'#227'o Social;Nome Fantasia'
      CT_ColField = 'CNPJCPF;XNome;XFant'
      CT_RetField1 = 0
      CT_RetControl1 = EditCNPJ
      CT_RetField2 = 0
      CT_Test = False
      CT_ConsTab = True
      CT_KeyValue = EditCNPJ
      CT_Search = True
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 89
    Width = 937
    Height = 431
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Page: TPageControl
      Left = 1
      Top = 1
      Width = 935
      Height = 429
      ActivePage = TabNFES
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object TabNFES: TTabSheet
        Caption = 'NF-e Saida'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 5
        ExplicitTop = 26
        object PageItemS: TcxPageControl
          Left = 0
          Top = 0
          Width = 927
          Height = 401
          ActivePage = TabEditS
          Align = alClient
          TabOrder = 0
          ExplicitWidth = 513
          ClientRectBottom = 395
          ClientRectLeft = 3
          ClientRectRight = 921
          ClientRectTop = 3
          object TabGradeS: TcxTabSheet
            Caption = 'tbsGrade'
            ImageIndex = 0
            TabVisible = False
            ExplicitLeft = 6
            ExplicitWidth = 504
            object cxGrid1: TcxGrid
              Left = 0
              Top = 0
              Width = 918
              Height = 392
              Align = alClient
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              ExplicitLeft = -9
              ExplicitTop = -9
              ExplicitWidth = 927
              ExplicitHeight = 401
              object cxGridDBTableView3: TcxGridDBTableView
                OnDblClick = cxGrid1DBTableView1DblClick
                NavigatorButtons.ConfirmDelete = False
                DataController.DataSource = dsConsultaNFES
                DataController.DetailKeyFieldNames = 'cCT'
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <
                  item
                    Format = '##,##0.00'
                    Kind = skSum
                    FieldName = 'ValorTotal'
                    Column = cxGridDBTableView3ValorTotal
                  end
                  item
                    Format = '##,##0.00'
                    Kind = skSum
                    FieldName = 'ValorICMS'
                    Column = cxGridDBTableView3ValorICMS
                  end
                  item
                    Format = '##,##0.00'
                    Kind = skSum
                    FieldName = 'ValorCofins'
                    Column = cxGridDBTableView3ValorCofins
                  end
                  item
                    Format = '##,##0.00'
                    Kind = skSum
                    FieldName = 'ValorIPI'
                    Column = cxGridDBTableView3ValorIPI
                  end
                  item
                    Format = '##,##0.00'
                    Kind = skSum
                    FieldName = 'ValorPIS'
                    Column = cxGridDBTableView3ValorPIS
                  end
                  item
                    Format = '##,##0.00'
                    Kind = skSum
                    FieldName = 'ValorICMS_ST'
                    Column = cxGridDBTableView3ValorICMS_ST
                  end
                  item
                    Format = '##,##0.00'
                    Kind = skSum
                    FieldName = 'ValorFrete'
                    Column = cxGridDBTableView3ValorFrete
                  end
                  item
                    Format = '##,##0.00'
                    Kind = skSum
                    FieldName = 'ValorDesconto'
                    Column = cxGridDBTableView3ValorDesconto
                  end
                  item
                    Format = '##,##0.00'
                    Kind = skSum
                    FieldName = 'VlrOutrasDespesas'
                    Column = cxGridDBTableView3VlrOutrasDespesas
                  end
                  item
                    Format = '##,##0.00'
                    Kind = skSum
                    FieldName = 'BaseCOFINS'
                    Column = cxGridDBTableView3BaseCOFINS
                  end
                  item
                    Format = '##,##0.00'
                    Kind = skSum
                    FieldName = 'BaseICMS'
                    Column = cxGridDBTableView3BaseICMS
                  end
                  item
                    Format = '##,##0.00'
                    Kind = skSum
                    FieldName = 'BaseICMSST'
                    Column = cxGridDBTableView3BaseICMSST
                  end
                  item
                    Format = '##,##0.00'
                    Kind = skSum
                    FieldName = 'BaseIPI'
                    Column = cxGridDBTableView3BaseIPI
                  end
                  item
                    Format = '##,##0.00'
                    Kind = skSum
                    FieldName = 'BasePIS'
                    Column = cxGridDBTableView3BasePIS
                  end>
                DataController.Summary.SummaryGroups = <>
                OptionsData.CancelOnExit = False
                OptionsData.Deleting = False
                OptionsData.DeletingConfirmation = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsView.Footer = True
                OptionsView.GroupByBox = False
                object cxGridDBTableView3NumNF: TcxGridDBColumn
                  DataBinding.FieldName = 'NumNF'
                end
                object cxGridDBTableView3CodFilial: TcxGridDBColumn
                  DataBinding.FieldName = 'CodFilial'
                  Width = 50
                end
                object cxGridDBTableView3Nome: TcxGridDBColumn
                  DataBinding.FieldName = 'Nome'
                  Width = 200
                end
                object cxGridDBTableView3CNPJ: TcxGridDBColumn
                  DataBinding.FieldName = 'CNPJ'
                end
                object cxGridDBTableView3dhEmi: TcxGridDBColumn
                  DataBinding.FieldName = 'dhEmi'
                  Width = 100
                end
                object cxGridDBTableView3ValorTotal: TcxGridDBColumn
                  DataBinding.FieldName = 'ValorTotal'
                  Width = 100
                end
                object cxGridDBTableView3CodProduto: TcxGridDBColumn
                  DataBinding.FieldName = 'CodProduto'
                  Width = 100
                end
                object cxGridDBTableView3DescProduto: TcxGridDBColumn
                  DataBinding.FieldName = 'DescProduto'
                  Width = 300
                end
                object cxGridDBTableView3CodCest: TcxGridDBColumn
                  DataBinding.FieldName = 'CodCest'
                  Width = 40
                end
                object cxGridDBTableView3I_CFOP: TcxGridDBColumn
                  DataBinding.FieldName = 'I_CFOP'
                  Width = 40
                end
                object cxGridDBTableView3ValorUnitario: TcxGridDBColumn
                  DataBinding.FieldName = 'ValorUnitario'
                  Width = 100
                end
                object cxGridDBTableView3Qtde: TcxGridDBColumn
                  DataBinding.FieldName = 'Qtde'
                  Width = 100
                end
                object cxGridDBTableView3UnidadeItem: TcxGridDBColumn
                  DataBinding.FieldName = 'UnidadeItem'
                  Width = 100
                end
                object cxGridDBTableView3ValorDesconto: TcxGridDBColumn
                  DataBinding.FieldName = 'ValorDesconto'
                  Width = 100
                end
                object cxGridDBTableView3ValorFrete: TcxGridDBColumn
                  DataBinding.FieldName = 'ValorFrete'
                  Width = 100
                end
                object cxGridDBTableView3VlrOutrasDespesas: TcxGridDBColumn
                  DataBinding.FieldName = 'VlrOutrasDespesas'
                  Width = 100
                end
                object cxGridDBTableView3BaseICMS: TcxGridDBColumn
                  DataBinding.FieldName = 'BaseICMS'
                  Width = 100
                end
                object cxGridDBTableView3PorcICMS: TcxGridDBColumn
                  DataBinding.FieldName = 'PorcICMS'
                  Width = 100
                end
                object cxGridDBTableView3ValorICMS: TcxGridDBColumn
                  DataBinding.FieldName = 'ValorICMS'
                  Width = 100
                end
                object cxGridDBTableView3BaseICMSST: TcxGridDBColumn
                  DataBinding.FieldName = 'BaseICMSST'
                  Width = 100
                end
                object cxGridDBTableView3ValorICMS_ST: TcxGridDBColumn
                  DataBinding.FieldName = 'ValorICMS_ST'
                  Width = 100
                end
                object cxGridDBTableView3NF_TipoIPI: TcxGridDBColumn
                  DataBinding.FieldName = 'NF_TipoIPI'
                  Width = 100
                end
                object cxGridDBTableView3BaseIPI: TcxGridDBColumn
                  DataBinding.FieldName = 'BaseIPI'
                  Width = 100
                end
                object cxGridDBTableView3PorcIPI: TcxGridDBColumn
                  DataBinding.FieldName = 'PorcIPI'
                  Width = 100
                end
                object cxGridDBTableView3ValorIPI: TcxGridDBColumn
                  DataBinding.FieldName = 'ValorIPI'
                  Width = 100
                end
                object cxGridDBTableView3NF_TipoPIS: TcxGridDBColumn
                  DataBinding.FieldName = 'NF_TipoPIS'
                  Width = 100
                end
                object cxGridDBTableView3BasePIS: TcxGridDBColumn
                  DataBinding.FieldName = 'BasePIS'
                  Width = 100
                end
                object cxGridDBTableView3PorcPIS: TcxGridDBColumn
                  DataBinding.FieldName = 'PorcPIS'
                  Width = 100
                end
                object cxGridDBTableView3ValorPIS: TcxGridDBColumn
                  DataBinding.FieldName = 'ValorPIS'
                  Width = 100
                end
                object cxGridDBTableView3NF_TipoCofins: TcxGridDBColumn
                  DataBinding.FieldName = 'NF_TipoCofins'
                end
                object cxGridDBTableView3BaseCOFINS: TcxGridDBColumn
                  DataBinding.FieldName = 'BaseCOFINS'
                end
                object cxGridDBTableView3PorcCOFINS: TcxGridDBColumn
                  DataBinding.FieldName = 'PorcCOFINS'
                end
                object cxGridDBTableView3ValorCofins: TcxGridDBColumn
                  DataBinding.FieldName = 'ValorCofins'
                end
              end
              object cxGridDBTableView4: TcxGridDBTableView
                NavigatorButtons.ConfirmDelete = False
                DataController.DetailKeyFieldNames = 'NumNF'
                DataController.KeyFieldNames = 'Chaveseq'
                DataController.MasterKeyFieldNames = 'cCT'
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <
                  item
                    Format = '##,##0.00'
                    Kind = skSum
                    FieldName = 'ValorTotal'
                    Column = cxGridDBColumn61
                  end
                  item
                    Format = '##,##0.00'
                    Kind = skSum
                    FieldName = 'ValorICMS'
                    Column = cxGridDBColumn62
                  end
                  item
                    Format = '##,##0.00'
                    Kind = skSum
                    FieldName = 'ValorIPI'
                    Column = cxGridDBColumn63
                  end
                  item
                    Format = '##,##0.00'
                    Kind = skSum
                    FieldName = 'ValorPIS'
                    Column = cxGridDBColumn65
                  end
                  item
                    Format = '##,##0.00'
                    Kind = skSum
                    FieldName = 'ValorCofins'
                    Column = cxGridDBColumn64
                  end
                  item
                    Format = '##,##0.00'
                    Kind = skSum
                    FieldName = 'ValorFrete'
                    Column = cxGridDBColumn71
                  end
                  item
                    Format = '##,##0.00'
                    Kind = skSum
                    FieldName = 'ValorDesconto'
                    Column = cxGridDBColumn72
                  end>
                DataController.Summary.SummaryGroups = <>
                OptionsView.Footer = True
                OptionsView.GroupByBox = False
                OptionsView.Indicator = True
                object cxGridDBColumn51: TcxGridDBColumn
                  DataBinding.FieldName = 'Chaveseq'
                end
                object cxGridDBColumn52: TcxGridDBColumn
                  DataBinding.FieldName = 'CodFilial'
                end
                object cxGridDBColumn53: TcxGridDBColumn
                  DataBinding.FieldName = 'CodFornecedor'
                end
                object cxGridDBColumn54: TcxGridDBColumn
                  DataBinding.FieldName = 'NumNF'
                end
                object cxGridDBColumn55: TcxGridDBColumn
                  DataBinding.FieldName = 'CodNatureza'
                end
                object cxGridDBColumn56: TcxGridDBColumn
                  DataBinding.FieldName = 'CodProduto'
                end
                object cxGridDBColumn57: TcxGridDBColumn
                  DataBinding.FieldName = 'DescProduto'
                  Width = 250
                end
                object cxGridDBColumn58: TcxGridDBColumn
                  DataBinding.FieldName = 'UnidadeItem'
                end
                object cxGridDBColumn59: TcxGridDBColumn
                  DataBinding.FieldName = 'Qtde'
                end
                object cxGridDBColumn60: TcxGridDBColumn
                  DataBinding.FieldName = 'ValorUnitario'
                end
                object cxGridDBColumn61: TcxGridDBColumn
                  DataBinding.FieldName = 'ValorTotal'
                end
                object cxGridDBColumn62: TcxGridDBColumn
                  DataBinding.FieldName = 'ValorICMS'
                end
                object cxGridDBColumn63: TcxGridDBColumn
                  DataBinding.FieldName = 'ValorIPI'
                end
                object cxGridDBColumn64: TcxGridDBColumn
                  DataBinding.FieldName = 'ValorCofins'
                end
                object cxGridDBColumn65: TcxGridDBColumn
                  DataBinding.FieldName = 'ValorPIS'
                end
                object cxGridDBColumn66: TcxGridDBColumn
                  DataBinding.FieldName = 'ValorICMS_ST'
                end
                object cxGridDBColumn67: TcxGridDBColumn
                  DataBinding.FieldName = 'PorcICMS'
                end
                object cxGridDBColumn68: TcxGridDBColumn
                  DataBinding.FieldName = 'PorcIPI'
                end
                object cxGridDBColumn69: TcxGridDBColumn
                  DataBinding.FieldName = 'PorcCOFINS'
                end
                object cxGridDBColumn70: TcxGridDBColumn
                  DataBinding.FieldName = 'PorcPIS'
                end
                object cxGridDBColumn71: TcxGridDBColumn
                  DataBinding.FieldName = 'ValorFrete'
                end
                object cxGridDBColumn72: TcxGridDBColumn
                  DataBinding.FieldName = 'ValorDesconto'
                end
              end
              object cxGridLevel3: TcxGridLevel
                GridView = cxGridDBTableView3
              end
            end
          end
          object TabEditS: TcxTabSheet
            Caption = 'tbsEdit'
            ImageIndex = 1
            TabVisible = False
            object Panel7: TPanel
              Left = 0
              Top = 0
              Width = 918
              Height = 392
              Align = alClient
              BevelInner = bvLowered
              BevelOuter = bvNone
              BevelWidth = 2
              TabOrder = 0
              object Panel8: TPanel
                Left = 2
                Top = 2
                Width = 914
                Height = 2
                Align = alTop
                BevelWidth = 2
                TabOrder = 0
                Visible = False
                object Image1: TImage
                  Left = 2
                  Top = 2
                  Width = 910
                  Height = 0
                  Align = alClient
                  ExplicitWidth = 726
                end
                object Label8: TLabel
                  Left = 166
                  Top = 22
                  Width = 103
                  Height = 24
                  Caption = 'LabCadTit'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWhite
                  Font.Height = -21
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = True
                end
                object Edit1: TEdit
                  Left = 500
                  Top = 28
                  Width = 121
                  Height = 21
                  TabOrder = 0
                  Text = 'EdiDatabaseName'
                  Visible = False
                end
                object rsDBSuperEdit1: TrsDBSuperEdit
                  Left = 500
                  Top = 4
                  Width = 121
                  Height = 21
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  TabOrder = 1
                  Visible = False
                end
              end
              object dxStatusBar1: TdxStatusBar
                Left = 2
                Top = 370
                Width = 914
                Height = 20
                Panels = <
                  item
                    PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
                    Width = 400
                  end>
                PaintStyle = stpsOffice11
                LookAndFeel.Kind = lfOffice11
                LookAndFeel.NativeStyle = True
                LookAndFeel.SkinName = 'Office2007Blue'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
              end
              object Panel9: TPanel
                Left = 2
                Top = 334
                Width = 914
                Height = 36
                Align = alBottom
                BevelOuter = bvNone
                TabOrder = 2
                object cxButton2: TcxButton
                  Left = 4
                  Top = 2
                  Width = 36
                  Height = 33
                  Hint = 'Voltar (Alt+V)'
                  Caption = '   &V'
                  Glyph.Data = {
                    F6060000424DF606000000000000360000002800000018000000180000000100
                    180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDFB096EFD7CBFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFC1693AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FFFF00FFFF00FFFF00FFD1916FCC8661FF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE6C3B0B95C2BE5C2B0FF00FFFF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBC5E
                    2DC27147FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFC67B53C26131E4C1AFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FFFF00FFFF00FFFF00FFFF00FFD3997BCA6635C37953FF00FFFF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDBAD95CF6837BC5F31FF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDBAD
                    95CC6A3AC7683BE3C0AFCE6C34CE6C34CE6C34CE6C34CE6C34CE6C34CE6C34CE
                    6C34CE6C34CE6C34CE6C34CE6C34FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFDAAC95CB6D3FD07345D4A187CE6C34E67F44E57E43E57D42E57D
                    42E47C41E47A40E3793FE2773EDB723BC96F3DF4E2D8FF00FFFF00FFFF00FFFF
                    00FFFF00FFFF00FFFF00FFFF00FFDAAC95D17446D87D50C5815FCC6A33E88044
                    E27E3CE27D3BE17C3AE07A39E07939E5793DDE743BCA703DF4E2D8FF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD1977BD2784CDC8357C4
                    805FCB6933E77D41DE7936DE7836DD7735DD7635E3783CDE743BCA6F3DF4E2D8
                    FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBF6F
                    48DC8357DB845BC47F5EC96832E67B3FDD7634DC7533DC7432DE7435E3763CCB
                    6833E4BBA4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFECD6CABE653AE2885DD27C53C88A6CC86732E67D44DC7839DC7738DE76
                    38DA7334E0753ADD733DC66C3DF3E2D8FF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FFFF00FFFF00FFFF00FFC6825FD47E54E28B60C7734AD6A994C66631E57D44
                    DD7A3DE37B43E47B43DD783DDB773CE27841D56E3AC36A3BF3E1D8FF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFD4A087C26C41E18A60E18C64BA653DF0
                    DFD7C56430E57A43E37942DD743FD6703BE27840DA753BD9743AE1763FD76E3A
                    BF602EDCAE95FF00FFFF00FFFF00FFFF00FFFF00FFCF977ABD663BDE895FE08A
                    60D78760BA6C47FF00FFC36330E37942DC733EC66C3DC56B3DDB723DE0763ED9
                    7239D87139DF733DDD7340C96838BF693CCD8E6DDAAC95C78260B85E32CA744A
                    DF895FDD8358E08E66BF6D45E0BEAFFF00FFC1622FDB723DC46B3DF3E1D8E6C3
                    B0BF602EDA703CDF743DD87039D66F37DA713CE07A48DE7D4DD6794BD17649D8
                    8055DF875CE0865AD97A4CE18C63CB7B56C17E5EFF00FFFF00FFBD5F2EC46A3D
                    F3E1D8FF00FFFF00FFEED7CBC1683BCF6837E07541DD7440D66E39D46B36D770
                    3CD97543DA7746D97646D6713FD97A4CDF8B63CE7F5ABE7654FF00FFFF00FFFF
                    00FFBE6739F2E1D8FF00FFFF00FFFF00FFFF00FFFF00FFC98461C06132D47243
                    DF7C4DDF7D4DDC7A49DA7847DA7949DD8053E08A61D78760BF6D45BC7350FF00
                    FFFF00FFFF00FFFF00FFF2E1D8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FFEDD6CAC78260B85D30C3693DCF764BD0784ED07A50C7734ABA653DBA6C47
                    E0BFAEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE7CABCD8AA94D7AA94D7AA94DB
                    B4A1F0DFD7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                  LookAndFeel.Kind = lfOffice11
                  LookAndFeel.NativeStyle = False
                  LookAndFeel.SkinName = 'Office2007Blue'
                  Margin = 5
                  TabOrder = 0
                  OnClick = cxButton4Click
                end
                object cxButton5: TcxButton
                  Left = 41
                  Top = 2
                  Width = 36
                  Height = 33
                  Hint = 'Salvar ( Alt + S )'
                  Caption = '   &S'
                  Glyph.Data = {
                    76060000424D7606000000000000360400002800000018000000180000000100
                    08000000000040020000320B0000320B00000001000000000000942121009429
                    2900943131009C3131009C393900A5393900944242009C424200A5424200AD42
                    4200A54A42009C424A009C4A4A00A54A4A00AD4A4A00B54A4A009C525200B552
                    5200BD525200C6525200BD5A5A00C65A5A00CE5A5A009C636300A5636300C663
                    6300CE6363009C6B6B00B56B6B00BD6B6B00C66B6B00CE6B6B00AD736B00B573
                    6B009C737300A5737300B5737300BD737300C6737300CE737300B5847300A57B
                    7B00AD7B7B00BD7B7B00C67B7B00CE7B7B00A5848400B5848400BD848400C684
                    8400B58C8400A58C8C00AD8C8C00B58C8C00C68C8C00CE8C8C00BD949400D694
                    94009C9C9C00BD9C9C00C69C9C00CE9C9C00CEA59C00ADA5A500CEA5A500D6A5
                    A500C6ADAD00CEADAD00D6ADAD00B5B5B500BDB5B500DEB5B500BDBDB500B5BD
                    BD00BDBDBD00D6BDBD00DEBDBD00C6C6C600CEC6C600DEC6C600E7C6C600C6CE
                    CE00CECECE00D6CECE00DECECE00D6D6D600DEDED600DEDEDE00E7DEDE00E7E7
                    DE00EFE7DE00E7E7E700EFE7E700F7E7E700EFEFE700F7EFE700EFEFEF00F7EF
                    EF00F7F7EF00F7F7F700FFF7F700FFFFF700FF00FF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00666666666666
                    6666666666666666666666666666666666666666661E191A111B454545454545
                    454545240102040C66666666281E1A1A141B332F43546265635E5B2401020415
                    0C666666281E1A1A14222904213C5C636462602B010204150C666666281E1A1A
                    14232E02072456606364632B010204150C666666281E1A1A14233402020C4D59
                    6064672C010204150C666666281E1A1A112A350101023F525961673101020415
                    0C666666281E1A1A112A421818173A4555606731010204140C666666281E1A1A
                    1424413C3B3834343C44502608090E190C666666281E1A1A1A1A1A1A1A1A1A1A
                    1919191A1A1A1A1A0C666666281E14191E2727272727272727272727272D1F1A
                    0C666666280E0A1C36434B4B4B4B4B4B4B4B4B4B4B4F371A0C66666628093D62
                    616161616161616161616161615C37150C666666280940676363636363636363
                    63636363645C37140C66666628094067616161616161616161616161635C3714
                    0C666666280940675B4E5252525252525252524D585C37140C66666628094067
                    615C5C5C5C5C5C5C5C5C5C5C615C37140C666666280940675C53535353535353
                    535353525B5C37140C666666280940675E5858585858585858585858605C3714
                    0C666666280940675E5858585858585858585858605C37140C66666628094067
                    5B52535353535353535353525B5C37140C666666280940676464646464646464
                    64646464645C37150C66666666093D514D4D4D4D4D4D4D4D4D4D4D4D4D4D3611
                    6666666666666666666666666666666666666666666666666666}
                  LookAndFeel.Kind = lfOffice11
                  LookAndFeel.NativeStyle = False
                  LookAndFeel.SkinName = 'Office2007Blue'
                  Margin = 5
                  TabOrder = 1
                end
              end
              object Panel10: TPanel
                Left = 3
                Top = 100
                Width = 850
                Height = 27
                Alignment = taLeftJustify
                BevelInner = bvLowered
                Caption = 
                  '  Produto                                                       ' +
                  '                                                                ' +
                  '                                                                ' +
                  '                                                 NCM'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 3
                object Edit3: TEdit
                  Left = 184
                  Top = 3
                  Width = 0
                  Height = 22
                  TabStop = False
                  CharCase = ecUpperCase
                  Color = 14931644
                  Enabled = False
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  Visible = False
                end
                object rsSuperEdit1: TrsSuperEdit
                  Tag = -1
                  Left = 779
                  Top = 3
                  Width = 65
                  Height = 22
                  Options = [soAutoAlign, soAllowspaces, soEnterToTab]
                  TagName = 'NCM'
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  ReadOnly = True
                  TabOrder = 1
                end
                object rsSuperEdit2: TrsSuperEdit
                  Tag = -1
                  Left = 102
                  Top = 3
                  Width = 121
                  Height = 22
                  TagName = 'CodProduto'
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  TabOrder = 2
                end
                object rsSuperEdit3: TrsSuperEdit
                  Left = 230
                  Top = 3
                  Width = 449
                  Height = 22
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  TabOrder = 3
                end
              end
              object Panel11: TPanel
                Left = 3
                Top = 324
                Width = 850
                Height = 27
                Alignment = taLeftJustify
                BevelInner = bvLowered
                Caption = 
                  '                                                                ' +
                  ' Quantida                                           Unit'#225'rio R$ ' +
                  '                                                                ' +
                  '                                  Total R$                      ' +
                  '                                                '
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 4
                object rsSuperEdit5: TrsSuperEdit
                  Left = 269
                  Top = 3
                  Width = 65
                  Height = 22
                  Alignment = taRightJustify
                  Format = foReal
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  Decimals = 3
                  CharCase = ecUpperCase
                  Ctl3D = True
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentCtl3D = False
                  ParentFont = False
                  TabOrder = 0
                end
                object rsSuperEdit8: TrsSuperEdit
                  Left = 779
                  Top = 3
                  Width = 65
                  Height = 22
                  TabStop = False
                  Options = [soAutoAlign, soAllowspaces, soEnterToTab]
                  Alignment = taRightJustify
                  Format = foCurrency
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  CharCase = ecUpperCase
                  Enabled = False
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 2
                end
                object rsSuperEdit11: TrsSuperEdit
                  Left = 439
                  Top = 3
                  Width = 65
                  Height = 22
                  Options = [soAutoAlign, soAllowspaces, soEnterToTab]
                  Alignment = taRightJustify
                  Format = foCurrency
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  CharCase = ecUpperCase
                  Ctl3D = True
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentCtl3D = False
                  ParentFont = False
                  TabOrder = 1
                end
              end
              object Panel12: TPanel
                Tag = -1
                Left = 3
                Top = 128
                Width = 850
                Height = 27
                Alignment = taLeftJustify
                BevelInner = bvLowered
                Caption = 
                  '  CST ICMS                                                      ' +
                  'ICMS %                                Valor ICMS R$             ' +
                  '                     Base ICMS                          '
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 5
                object rsSuperEdit12: TrsSuperEdit
                  Left = 36
                  Top = 3
                  Width = 0
                  Height = 22
                  TabStop = False
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  MaxLength = 8
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
                object rsSuperEdit13: TrsSuperEdit
                  Tag = -1
                  Left = 269
                  Top = 4
                  Width = 65
                  Height = 22
                  Options = [soAutoAlign, soAllowspaces, soEnterToTab]
                  Alignment = taRightJustify
                  Format = foCurrency
                  TagName = 'PorcICMS'
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  CharCase = ecUpperCase
                  Ctl3D = True
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentCtl3D = False
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 1
                end
                object rsSuperEdit14: TrsSuperEdit
                  Left = 102
                  Top = 3
                  Width = 65
                  Height = 22
                  TagName = 'NF_TipoICMS'
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  TabOrder = 2
                end
                object rsSuperEdit16: TrsSuperEdit
                  Tag = -1
                  Left = 439
                  Top = 3
                  Width = 65
                  Height = 22
                  Options = [soAutoAlign, soAllowspaces, soEnterToTab]
                  Alignment = taRightJustify
                  Format = foCurrency
                  TagName = 'ValorICMS'
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 3
                end
                object rsSuperEdit17: TrsSuperEdit
                  Tag = -1
                  Left = 602
                  Top = 3
                  Width = 74
                  Height = 22
                  Options = [soAutoAlign, soAllowspaces, soEnterToTab]
                  Alignment = taRightJustify
                  Format = foCurrency
                  TagName = 'BaseICMS'
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 4
                end
              end
              object Panel14: TPanel
                Tag = -1
                Left = 3
                Top = 268
                Width = 850
                Height = 27
                Alignment = taLeftJustify
                BevelInner = bvLowered
                Caption = 
                  '   ICMS Partilha %                                          FCP ' +
                  'R$                            ICMS Origem R$                    ' +
                  '                                                           ICMS ' +
                  'do Destino R$'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 6
                object rsSuperEdit18: TrsSuperEdit
                  Left = 36
                  Top = 3
                  Width = 0
                  Height = 22
                  TabStop = False
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  MaxLength = 8
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
                object rsSuperEdit19: TrsSuperEdit
                  Left = 102
                  Top = 2
                  Width = 65
                  Height = 22
                  Options = [soAutoAlign, soAllowspaces, soEnterToTab]
                  Alignment = taRightJustify
                  Format = foCurrency
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 1
                end
                object rsSuperEdit20: TrsSuperEdit
                  Left = 269
                  Top = 3
                  Width = 65
                  Height = 22
                  Options = [soAutoAlign, soAllowspaces, soEnterToTab]
                  Alignment = taRightJustify
                  Format = foCurrency
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 2
                end
                object rsSuperEdit21: TrsSuperEdit
                  Left = 439
                  Top = 3
                  Width = 65
                  Height = 22
                  Options = [soAutoAlign, soAllowspaces, soEnterToTab]
                  Alignment = taRightJustify
                  Format = foCurrency
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 3
                end
                object rsSuperEdit22: TrsSuperEdit
                  Left = 779
                  Top = 2
                  Width = 65
                  Height = 22
                  Options = [soAutoAlign, soAllowspaces, soEnterToTab]
                  Alignment = taRightJustify
                  Format = foCurrency
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 4
                end
              end
              object Panel15: TPanel
                Tag = -1
                Left = 3
                Top = 184
                Width = 850
                Height = 27
                Alignment = taLeftJustify
                BevelInner = bvLowered
                Caption = 
                  '  CST IPI                                                       ' +
                  '        IPI %                                     Valor IPI R$  ' +
                  '                                      Base IPI                  ' +
                  '                    IVA Ajust. %                                ' +
                  '           '
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 7
                object rsSuperEdit23: TrsSuperEdit
                  Left = 36
                  Top = 3
                  Width = 0
                  Height = 22
                  TabStop = False
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  MaxLength = 8
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
                object rsSuperEdit24: TrsSuperEdit
                  Left = 269
                  Top = 3
                  Width = 64
                  Height = 22
                  Options = [soAutoAlign, soAllowspaces, soEnterToTab]
                  Alignment = taRightJustify
                  Format = foCurrency
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  CharCase = ecUpperCase
                  Ctl3D = True
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentCtl3D = False
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 1
                end
                object rsSuperEdit25: TrsSuperEdit
                  Left = 102
                  Top = 3
                  Width = 65
                  Height = 22
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  TabOrder = 2
                end
                object rsSuperEdit26: TrsSuperEdit
                  Left = 439
                  Top = 3
                  Width = 65
                  Height = 22
                  Options = [soAutoAlign, soAllowspaces, soEnterToTab]
                  Alignment = taRightJustify
                  Format = foCurrency
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 3
                end
                object rsSuperEdit27: TrsSuperEdit
                  Left = 779
                  Top = 4
                  Width = 65
                  Height = 22
                  Options = [soAutoAlign, soAllowspaces, soEnterToTab]
                  Alignment = taRightJustify
                  Format = foCurrency
                  TagName = 'IVA_ST'
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  CustomMask = '##,##0.00'
                  MaxLength = 50
                  CharCase = ecUpperCase
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 4
                end
                object rsSuperEdit28: TrsSuperEdit
                  Left = 602
                  Top = 3
                  Width = 74
                  Height = 22
                  Options = [soAutoAlign, soAllowspaces, soEnterToTab]
                  Alignment = taRightJustify
                  Format = foCurrency
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 5
                end
              end
              object Panel16: TPanel
                Tag = -1
                Left = 3
                Top = 212
                Width = 850
                Height = 27
                Alignment = taLeftJustify
                BevelInner = bvLowered
                Caption = 
                  '  CST PIS                                                       ' +
                  '      PIS%                                    Valor PIS R$      ' +
                  '                                 Base PIS                     '
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 8
                object rsSuperEdit29: TrsSuperEdit
                  Left = 36
                  Top = 3
                  Width = 0
                  Height = 22
                  TabStop = False
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  MaxLength = 8
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
                object rsSuperEdit30: TrsSuperEdit
                  Left = 269
                  Top = 4
                  Width = 65
                  Height = 22
                  Options = [soAutoAlign, soAllowspaces, soEnterToTab]
                  Alignment = taRightJustify
                  Format = foCurrency
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  CharCase = ecUpperCase
                  Ctl3D = True
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentCtl3D = False
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 1
                end
                object rsSuperEdit31: TrsSuperEdit
                  Left = 102
                  Top = 4
                  Width = 65
                  Height = 22
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  TabOrder = 2
                end
                object rsSuperEdit32: TrsSuperEdit
                  Left = 439
                  Top = 3
                  Width = 65
                  Height = 22
                  Options = [soAutoAlign, soAllowspaces, soEnterToTab]
                  Alignment = taRightJustify
                  Format = foCurrency
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 3
                end
                object rsSuperEdit33: TrsSuperEdit
                  Left = 602
                  Top = 3
                  Width = 74
                  Height = 22
                  Options = [soAutoAlign, soAllowspaces, soEnterToTab]
                  Alignment = taRightJustify
                  Format = foCurrency
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 4
                end
              end
              object Panel17: TPanel
                Tag = -1
                Left = 3
                Top = 240
                Width = 850
                Height = 27
                Alignment = taLeftJustify
                BevelInner = bvLowered
                Caption = 
                  '  CST COFINS                                             COFINS ' +
                  '%                             Valor COFINS R$                   ' +
                  '            Base COFINS                                         ' +
                  '   '
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 9
                object rsSuperEdit34: TrsSuperEdit
                  Left = 36
                  Top = 3
                  Width = 0
                  Height = 22
                  TabStop = False
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  MaxLength = 8
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
                object rsSuperEdit35: TrsSuperEdit
                  Left = 269
                  Top = 3
                  Width = 65
                  Height = 22
                  Options = [soAutoAlign, soAllowspaces, soEnterToTab]
                  Alignment = taRightJustify
                  Format = foCurrency
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  CharCase = ecUpperCase
                  Ctl3D = True
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentCtl3D = False
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 1
                end
                object rsSuperEdit36: TrsSuperEdit
                  Left = 102
                  Top = 3
                  Width = 65
                  Height = 22
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  TabOrder = 2
                end
                object rsSuperEdit37: TrsSuperEdit
                  Left = 439
                  Top = 3
                  Width = 65
                  Height = 22
                  Options = [soAutoAlign, soAllowspaces, soEnterToTab]
                  Alignment = taRightJustify
                  Format = foCurrency
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 3
                end
                object rsSuperEdit38: TrsSuperEdit
                  Left = 602
                  Top = 3
                  Width = 74
                  Height = 22
                  Options = [soAutoAlign, soAllowspaces, soEnterToTab]
                  Alignment = taRightJustify
                  Format = foCurrency
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 4
                end
              end
              object Panel19: TPanel
                Tag = -1
                Left = 3
                Top = 156
                Width = 850
                Height = 27
                Alignment = taLeftJustify
                BevelInner = bvLowered
                Caption = 
                  '                                                                ' +
                  '    ICMS ST %                          Valor ICMS ST R$         ' +
                  '                    Base ICMS ST                                ' +
                  '                  IVA %                          '
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 10
                object rsSuperEdit39: TrsSuperEdit
                  Left = 36
                  Top = 3
                  Width = 0
                  Height = 22
                  TabStop = False
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  MaxLength = 8
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
                object rsSuperEdit40: TrsSuperEdit
                  Left = 269
                  Top = 4
                  Width = 65
                  Height = 22
                  Options = [soAutoAlign, soAllowspaces, soEnterToTab]
                  Alignment = taRightJustify
                  Format = foCurrency
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  CharCase = ecUpperCase
                  Ctl3D = True
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentCtl3D = False
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 1
                end
                object rsSuperEdit41: TrsSuperEdit
                  Left = 439
                  Top = 3
                  Width = 65
                  Height = 22
                  Options = [soAutoAlign, soAllowspaces, soEnterToTab]
                  Alignment = taRightJustify
                  Format = foCurrency
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 2
                end
                object rsSuperEdit42: TrsSuperEdit
                  Left = 779
                  Top = 3
                  Width = 65
                  Height = 22
                  Options = [soAutoAlign, soAllowspaces, soEnterToTab]
                  Alignment = taRightJustify
                  Format = foCurrency
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  CustomMask = '##,##0.00'
                  MaxLength = 50
                  CharCase = ecUpperCase
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 3
                end
                object rsSuperEdit43: TrsSuperEdit
                  Left = 602
                  Top = 3
                  Width = 74
                  Height = 22
                  Options = [soAutoAlign, soAllowspaces, soEnterToTab]
                  Alignment = taRightJustify
                  Format = foCurrency
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 4
                end
              end
              object Panel20: TPanel
                Tag = -1
                Left = 3
                Top = 71
                Width = 850
                Height = 28
                Alignment = taLeftJustify
                BevelInner = bvLowered
                Caption = '  CFOP                          '
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 11
                object rsSuperEdit44: TrsSuperEdit
                  Tag = -2
                  Left = 103
                  Top = 3
                  Width = 120
                  Height = 22
                  TagName = 'CTE_CFOP_ID'
                  CT_Titulo = 'Consulta Natureza de Opera'#231#227'o'
                  CT_TableName = 'CTE_CFOP'
                  CT_NumFields = 4
                  CT_ColTit = 'C'#243'digo;CFOP;Descri'#231#227'o;Tipo'
                  CT_ColField = 'CTE_CFOP_ID;CFOP;DESCRICAO;TIPO'
                  CT_RetField1 = 1
                  CT_RetControl1 = rsSuperEdit44
                  CT_RetField2 = 2
                  CT_RetControl2 = Edit4
                  CT_Test = False
                  CT_ConsTab = True
                  CT_KeyValue = rsSuperEdit44
                  CT_Search = False
                  MaxLength = 15
                  CharCase = ecUpperCase
                  TabOrder = 0
                  OnExit = ediCFOP_DetExit
                end
                object Edit4: TEdit
                  Left = 230
                  Top = 4
                  Width = 614
                  Height = 22
                  Color = 14931644
                  ReadOnly = True
                  TabOrder = 1
                end
              end
              object cxGroupBox2: TcxGroupBox
                Left = 4
                Top = 2
                Caption = 'Informa'#231#245'es da NF-e'
                TabOrder = 12
                Height = 67
                Width = 850
                object Label9: TLabel
                  Left = 9
                  Top = 17
                  Width = 60
                  Height = 13
                  Caption = 'N'#250'mero NF'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label10: TLabel
                  Left = 136
                  Top = 14
                  Width = 64
                  Height = 13
                  Caption = 'Fornecedor'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label11: TLabel
                  Left = 722
                  Top = 17
                  Width = 93
                  Height = 13
                  Caption = 'Data da Emiss'#227'o'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label12: TLabel
                  Left = 604
                  Top = 17
                  Width = 94
                  Height = 13
                  Caption = 'Valor Total da NF'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object rsSuperEdit45: TrsSuperEdit
                  Tag = -1
                  Left = 9
                  Top = 33
                  Width = 121
                  Height = 21
                  TagName = 'NUMNF'
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  TabOrder = 0
                end
                object rsSuperEdit46: TrsSuperEdit
                  Left = 136
                  Top = 33
                  Width = 460
                  Height = 21
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  TabOrder = 1
                end
                object cxDateEdit1: TcxDateEdit
                  Left = 722
                  Top = 33
                  TabOrder = 2
                  Width = 121
                end
                object rsSuperEdit47: TrsSuperEdit
                  Left = 604
                  Top = 33
                  Width = 112
                  Height = 22
                  Alignment = taRightJustify
                  Format = foCurrency
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  CharCase = ecUpperCase
                  Ctl3D = True
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentCtl3D = False
                  ParentFont = False
                  TabOrder = 3
                end
              end
              object Panel21: TPanel
                Left = 3
                Top = 296
                Width = 850
                Height = 27
                Alignment = taLeftJustify
                BevelInner = bvLowered
                Caption = 
                  '                                                             Val' +
                  'or Frete R$                            Valor Seguro R$          ' +
                  '                                                        Valor Ou' +
                  'tras Despesas R$'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 13
                object rsSuperEdit48: TrsSuperEdit
                  Tag = -1
                  Left = 269
                  Top = 3
                  Width = 64
                  Height = 22
                  Alignment = taRightJustify
                  Format = foCurrency
                  TagName = 'TotalFrete'
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  CharCase = ecUpperCase
                  Ctl3D = True
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentCtl3D = False
                  ParentFont = False
                  TabOrder = 0
                end
                object rsSuperEdit49: TrsSuperEdit
                  Tag = -1
                  Left = 439
                  Top = 3
                  Width = 65
                  Height = 22
                  Alignment = taRightJustify
                  Format = foCurrency
                  TagName = 'TotalSeguro'
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 1
                end
                object rsSuperEdit50: TrsSuperEdit
                  Tag = -1
                  Left = 779
                  Top = 3
                  Width = 65
                  Height = 22
                  Alignment = taRightJustify
                  Format = foCurrency
                  TagName = 'TotalOutrasDespesas'
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 2
                end
              end
            end
          end
        end
      end
      object TabNFEE: TTabSheet
        Caption = 'NF-e Entrada'
        ImageIndex = 1
        object PageItem: TcxPageControl
          Left = 0
          Top = 0
          Width = 927
          Height = 401
          ActivePage = tbsGrade
          Align = alClient
          TabOrder = 0
          ClientRectBottom = 395
          ClientRectLeft = 3
          ClientRectRight = 921
          ClientRectTop = 3
          object tbsGrade: TcxTabSheet
            Caption = 'tbsGrade'
            ImageIndex = 0
            TabVisible = False
            object cxGrid2: TcxGrid
              Left = 0
              Top = 0
              Width = 918
              Height = 392
              Align = alClient
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              object cxGridDBTableView1: TcxGridDBTableView
                OnDblClick = cxGrid1DBTableView1DblClick
                NavigatorButtons.ConfirmDelete = False
                OnCellDblClick = cxGridDBTableView1CellDblClick
                DataController.DataSource = dsConsultaNFEE
                DataController.DetailKeyFieldNames = 'cCT'
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <
                  item
                    Format = '##,##0.00'
                    Kind = skSum
                    FieldName = 'BaseCOFINS'
                    Column = cxGridDBTableView1BaseCOFINS
                  end
                  item
                    Format = '##,##0.00'
                    Kind = skSum
                    FieldName = 'BaseICMS'
                    Column = cxGridDBTableView1BaseICMS
                  end
                  item
                    Format = '##,##0.00'
                    Kind = skSum
                    FieldName = 'BaseICMSST'
                    Column = cxGridDBTableView1BaseICMSST
                  end
                  item
                    Format = '##,##0.00'
                    Kind = skSum
                    FieldName = 'BaseIPI'
                    Column = cxGridDBTableView1BaseIPI
                  end
                  item
                    Format = '##,##0.00'
                    Kind = skSum
                    FieldName = 'BasePIS'
                    Column = cxGridDBTableView1BasePIS
                  end
                  item
                    Format = '##,##0.00'
                    Kind = skSum
                    FieldName = 'ValorCofins'
                    Column = cxGridDBTableView1ValorCofins
                  end
                  item
                    Format = '##,##0.00'
                    Kind = skSum
                    FieldName = 'ValorDesconto'
                    Column = cxGridDBTableView1ValorDesconto
                  end
                  item
                    Format = '##,##0.00'
                    FieldName = 'ValorFrete'
                    Column = cxGridDBTableView1ValorFrete
                  end
                  item
                    Format = '##,##0.00'
                    Kind = skSum
                    FieldName = 'ValorICMS'
                    Column = cxGridDBTableView1ValorICMS
                  end
                  item
                    Format = '##,##0.00'
                    Kind = skSum
                    FieldName = 'ValorICMS_ST'
                    Column = cxGridDBTableView1ValorICMS_ST
                  end
                  item
                    Format = '##,##0.00'
                    Kind = skSum
                    FieldName = 'ValorIPI'
                    Column = cxGridDBTableView1ValorIPI
                  end
                  item
                    Format = '##,##0.00'
                    Kind = skSum
                    FieldName = 'ValorPIS'
                    Column = cxGridDBTableView1ValorPIS
                  end
                  item
                    Format = '##,##0.00'
                    Kind = skSum
                    FieldName = 'ValorTotal'
                    Column = cxGridDBTableView1ValorTotal
                  end
                  item
                    Format = '##,##0.00'
                    Kind = skSum
                    FieldName = 'VlrOutrasDespesas'
                    Column = cxGridDBTableView1VlrOutrasDespesas
                  end>
                DataController.Summary.SummaryGroups = <>
                OptionsData.CancelOnExit = False
                OptionsData.Deleting = False
                OptionsData.DeletingConfirmation = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsView.Footer = True
                OptionsView.GroupByBox = False
                object cxGridDBTableView1NumNF: TcxGridDBColumn
                  DataBinding.FieldName = 'NumNF'
                end
                object cxGridDBTableView1CodFilial: TcxGridDBColumn
                  DataBinding.FieldName = 'CodFilial'
                  Width = 50
                end
                object cxGridDBTableView1Nome: TcxGridDBColumn
                  DataBinding.FieldName = 'Nome'
                  Width = 200
                end
                object cxGridDBTableView1CNPJ: TcxGridDBColumn
                  DataBinding.FieldName = 'CNPJ'
                end
                object cxGridDBTableView1dhEmi: TcxGridDBColumn
                  DataBinding.FieldName = 'dhEmi'
                  Width = 100
                end
                object cxGridDBTableView1ValorTotal: TcxGridDBColumn
                  DataBinding.FieldName = 'ValorTotal'
                  Width = 100
                end
                object cxGridDBTableView1CodProduto: TcxGridDBColumn
                  DataBinding.FieldName = 'CodProduto'
                  Width = 100
                end
                object cxGridDBTableView1DescProduto: TcxGridDBColumn
                  DataBinding.FieldName = 'DescProduto'
                  Width = 300
                end
                object cxGridDBTableView1CodCest: TcxGridDBColumn
                  DataBinding.FieldName = 'CodCest'
                  Width = 40
                end
                object cxGridDBTableView1I_CFOP: TcxGridDBColumn
                  DataBinding.FieldName = 'I_CFOP'
                  Width = 50
                end
                object cxGridDBTableView1ValorUnitario: TcxGridDBColumn
                  DataBinding.FieldName = 'ValorUnitario'
                  Width = 100
                end
                object cxGridDBTableView1Qtde: TcxGridDBColumn
                  DataBinding.FieldName = 'Qtde'
                  Width = 100
                end
                object cxGridDBTableView1UnidadeItem: TcxGridDBColumn
                  DataBinding.FieldName = 'UnidadeItem'
                  Width = 100
                end
                object cxGridDBTableView1ValorDesconto: TcxGridDBColumn
                  DataBinding.FieldName = 'ValorDesconto'
                  Width = 100
                end
                object cxGridDBTableView1ValorFrete: TcxGridDBColumn
                  DataBinding.FieldName = 'ValorFrete'
                  Width = 100
                end
                object cxGridDBTableView1VlrOutrasDespesas: TcxGridDBColumn
                  DataBinding.FieldName = 'VlrOutrasDespesas'
                  Width = 100
                end
                object cxGridDBTableView1BaseICMS: TcxGridDBColumn
                  DataBinding.FieldName = 'BaseICMS'
                  Width = 100
                end
                object cxGridDBTableView1PorcICMS: TcxGridDBColumn
                  DataBinding.FieldName = 'PorcICMS'
                  Width = 100
                end
                object cxGridDBTableView1ValorICMS: TcxGridDBColumn
                  DataBinding.FieldName = 'ValorICMS'
                  Width = 100
                end
                object cxGridDBTableView1BaseICMSST: TcxGridDBColumn
                  DataBinding.FieldName = 'BaseICMSST'
                  Width = 100
                end
                object cxGridDBTableView1ValorICMS_ST: TcxGridDBColumn
                  DataBinding.FieldName = 'ValorICMS_ST'
                  Width = 100
                end
                object cxGridDBTableView1NF_TipoIPI: TcxGridDBColumn
                  DataBinding.FieldName = 'NF_TipoIPI'
                  Width = 100
                end
                object cxGridDBTableView1BaseIPI: TcxGridDBColumn
                  DataBinding.FieldName = 'BaseIPI'
                  Width = 100
                end
                object cxGridDBTableView1PorcIPI: TcxGridDBColumn
                  DataBinding.FieldName = 'PorcIPI'
                  Width = 100
                end
                object cxGridDBTableView1ValorIPI: TcxGridDBColumn
                  DataBinding.FieldName = 'ValorIPI'
                  Width = 100
                end
                object cxGridDBTableView1NF_TipoPIS: TcxGridDBColumn
                  DataBinding.FieldName = 'NF_TipoPIS'
                end
                object cxGridDBTableView1BasePIS: TcxGridDBColumn
                  DataBinding.FieldName = 'BasePIS'
                end
                object cxGridDBTableView1PorcPIS: TcxGridDBColumn
                  DataBinding.FieldName = 'PorcPIS'
                end
                object cxGridDBTableView1ValorPIS: TcxGridDBColumn
                  DataBinding.FieldName = 'ValorPIS'
                end
                object cxGridDBTableView1NF_TipoCofins: TcxGridDBColumn
                  DataBinding.FieldName = 'NF_TipoCofins'
                end
                object cxGridDBTableView1BaseCOFINS: TcxGridDBColumn
                  DataBinding.FieldName = 'BaseCOFINS'
                end
                object cxGridDBTableView1PorcCOFINS: TcxGridDBColumn
                  DataBinding.FieldName = 'PorcCOFINS'
                end
                object cxGridDBTableView1ValorCofins: TcxGridDBColumn
                  DataBinding.FieldName = 'ValorCofins'
                end
              end
              object cxGridDBTableView2: TcxGridDBTableView
                NavigatorButtons.ConfirmDelete = False
                DataController.DetailKeyFieldNames = 'NumNF'
                DataController.KeyFieldNames = 'Chaveseq'
                DataController.MasterKeyFieldNames = 'cCT'
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <
                  item
                    Format = '##,##0.00'
                    Kind = skSum
                    FieldName = 'ValorTotal'
                    Column = cxGridDBColumn25
                  end
                  item
                    Format = '##,##0.00'
                    Kind = skSum
                    FieldName = 'ValorICMS'
                    Column = cxGridDBColumn26
                  end
                  item
                    Format = '##,##0.00'
                    Kind = skSum
                    FieldName = 'ValorIPI'
                    Column = cxGridDBColumn27
                  end
                  item
                    Format = '##,##0.00'
                    Kind = skSum
                    FieldName = 'ValorPIS'
                    Column = cxGridDBColumn29
                  end
                  item
                    Format = '##,##0.00'
                    Kind = skSum
                    FieldName = 'ValorCofins'
                    Column = cxGridDBColumn28
                  end
                  item
                    Format = '##,##0.00'
                    Kind = skSum
                    FieldName = 'ValorFrete'
                    Column = cxGridDBColumn35
                  end
                  item
                    Format = '##,##0.00'
                    Kind = skSum
                    FieldName = 'ValorDesconto'
                    Column = cxGridDBColumn36
                  end>
                DataController.Summary.SummaryGroups = <>
                OptionsView.Footer = True
                OptionsView.GroupByBox = False
                OptionsView.Indicator = True
                object cxGridDBColumn15: TcxGridDBColumn
                  DataBinding.FieldName = 'Chaveseq'
                end
                object cxGridDBColumn16: TcxGridDBColumn
                  DataBinding.FieldName = 'CodFilial'
                end
                object cxGridDBColumn17: TcxGridDBColumn
                  DataBinding.FieldName = 'CodFornecedor'
                end
                object cxGridDBColumn18: TcxGridDBColumn
                  DataBinding.FieldName = 'NumNF'
                end
                object cxGridDBColumn19: TcxGridDBColumn
                  DataBinding.FieldName = 'CodNatureza'
                end
                object cxGridDBColumn20: TcxGridDBColumn
                  DataBinding.FieldName = 'CodProduto'
                end
                object cxGridDBColumn21: TcxGridDBColumn
                  DataBinding.FieldName = 'DescProduto'
                  Width = 250
                end
                object cxGridDBColumn22: TcxGridDBColumn
                  DataBinding.FieldName = 'UnidadeItem'
                end
                object cxGridDBColumn23: TcxGridDBColumn
                  DataBinding.FieldName = 'Qtde'
                end
                object cxGridDBColumn24: TcxGridDBColumn
                  DataBinding.FieldName = 'ValorUnitario'
                end
                object cxGridDBColumn25: TcxGridDBColumn
                  DataBinding.FieldName = 'ValorTotal'
                end
                object cxGridDBColumn26: TcxGridDBColumn
                  DataBinding.FieldName = 'ValorICMS'
                end
                object cxGridDBColumn27: TcxGridDBColumn
                  DataBinding.FieldName = 'ValorIPI'
                end
                object cxGridDBColumn28: TcxGridDBColumn
                  DataBinding.FieldName = 'ValorCofins'
                end
                object cxGridDBColumn29: TcxGridDBColumn
                  DataBinding.FieldName = 'ValorPIS'
                end
                object cxGridDBColumn30: TcxGridDBColumn
                  DataBinding.FieldName = 'ValorICMS_ST'
                end
                object cxGridDBColumn31: TcxGridDBColumn
                  DataBinding.FieldName = 'PorcICMS'
                end
                object cxGridDBColumn32: TcxGridDBColumn
                  DataBinding.FieldName = 'PorcIPI'
                end
                object cxGridDBColumn33: TcxGridDBColumn
                  DataBinding.FieldName = 'PorcCOFINS'
                end
                object cxGridDBColumn34: TcxGridDBColumn
                  DataBinding.FieldName = 'PorcPIS'
                end
                object cxGridDBColumn35: TcxGridDBColumn
                  DataBinding.FieldName = 'ValorFrete'
                end
                object cxGridDBColumn36: TcxGridDBColumn
                  DataBinding.FieldName = 'ValorDesconto'
                end
              end
              object cxGridLevel1: TcxGridLevel
                GridView = cxGridDBTableView1
              end
            end
          end
          object tbsEdit: TcxTabSheet
            Caption = 'tbsEdit'
            ImageIndex = 1
            TabVisible = False
            object PanFundo: TPanel
              Left = 0
              Top = 0
              Width = 918
              Height = 392
              Align = alClient
              BevelInner = bvLowered
              BevelOuter = bvNone
              BevelWidth = 2
              TabOrder = 0
              object PanTitulo: TPanel
                Left = 2
                Top = 2
                Width = 914
                Height = 2
                Align = alTop
                BevelWidth = 2
                TabOrder = 0
                Visible = False
                object ImaBarraSup: TImage
                  Left = 2
                  Top = 2
                  Width = 910
                  Height = 0
                  Align = alClient
                  ExplicitWidth = 726
                end
                object LabCadTit: TLabel
                  Left = 166
                  Top = 22
                  Width = 103
                  Height = 24
                  Caption = 'LabCadTit'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWhite
                  Font.Height = -21
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = True
                end
                object EdiDatabaseName: TEdit
                  Left = 500
                  Top = 28
                  Width = 121
                  Height = 21
                  TabOrder = 0
                  Text = 'EdiDatabaseName'
                  Visible = False
                end
                object EdiKeyValue: TrsDBSuperEdit
                  Left = 500
                  Top = 4
                  Width = 121
                  Height = 21
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  TabOrder = 1
                  Visible = False
                end
              end
              object StatusBar: TdxStatusBar
                Left = 2
                Top = 370
                Width = 914
                Height = 20
                Panels = <
                  item
                    PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
                    Width = 400
                  end>
                PaintStyle = stpsOffice11
                LookAndFeel.Kind = lfOffice11
                LookAndFeel.NativeStyle = True
                LookAndFeel.SkinName = 'Office2007Blue'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
              end
              object Panel27: TPanel
                Left = 2
                Top = 334
                Width = 914
                Height = 36
                Align = alBottom
                BevelOuter = bvNone
                TabOrder = 2
                object cxButton4: TcxButton
                  Left = 4
                  Top = 2
                  Width = 36
                  Height = 33
                  Hint = 'Voltar (Alt+V)'
                  Caption = '   &V'
                  Glyph.Data = {
                    F6060000424DF606000000000000360000002800000018000000180000000100
                    180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDFB096EFD7CBFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFC1693AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FFFF00FFFF00FFFF00FFD1916FCC8661FF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE6C3B0B95C2BE5C2B0FF00FFFF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBC5E
                    2DC27147FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFC67B53C26131E4C1AFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FFFF00FFFF00FFFF00FFFF00FFD3997BCA6635C37953FF00FFFF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDBAD95CF6837BC5F31FF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDBAD
                    95CC6A3AC7683BE3C0AFCE6C34CE6C34CE6C34CE6C34CE6C34CE6C34CE6C34CE
                    6C34CE6C34CE6C34CE6C34CE6C34FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFDAAC95CB6D3FD07345D4A187CE6C34E67F44E57E43E57D42E57D
                    42E47C41E47A40E3793FE2773EDB723BC96F3DF4E2D8FF00FFFF00FFFF00FFFF
                    00FFFF00FFFF00FFFF00FFFF00FFDAAC95D17446D87D50C5815FCC6A33E88044
                    E27E3CE27D3BE17C3AE07A39E07939E5793DDE743BCA703DF4E2D8FF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD1977BD2784CDC8357C4
                    805FCB6933E77D41DE7936DE7836DD7735DD7635E3783CDE743BCA6F3DF4E2D8
                    FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBF6F
                    48DC8357DB845BC47F5EC96832E67B3FDD7634DC7533DC7432DE7435E3763CCB
                    6833E4BBA4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFECD6CABE653AE2885DD27C53C88A6CC86732E67D44DC7839DC7738DE76
                    38DA7334E0753ADD733DC66C3DF3E2D8FF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FFFF00FFFF00FFFF00FFC6825FD47E54E28B60C7734AD6A994C66631E57D44
                    DD7A3DE37B43E47B43DD783DDB773CE27841D56E3AC36A3BF3E1D8FF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFD4A087C26C41E18A60E18C64BA653DF0
                    DFD7C56430E57A43E37942DD743FD6703BE27840DA753BD9743AE1763FD76E3A
                    BF602EDCAE95FF00FFFF00FFFF00FFFF00FFFF00FFCF977ABD663BDE895FE08A
                    60D78760BA6C47FF00FFC36330E37942DC733EC66C3DC56B3DDB723DE0763ED9
                    7239D87139DF733DDD7340C96838BF693CCD8E6DDAAC95C78260B85E32CA744A
                    DF895FDD8358E08E66BF6D45E0BEAFFF00FFC1622FDB723DC46B3DF3E1D8E6C3
                    B0BF602EDA703CDF743DD87039D66F37DA713CE07A48DE7D4DD6794BD17649D8
                    8055DF875CE0865AD97A4CE18C63CB7B56C17E5EFF00FFFF00FFBD5F2EC46A3D
                    F3E1D8FF00FFFF00FFEED7CBC1683BCF6837E07541DD7440D66E39D46B36D770
                    3CD97543DA7746D97646D6713FD97A4CDF8B63CE7F5ABE7654FF00FFFF00FFFF
                    00FFBE6739F2E1D8FF00FFFF00FFFF00FFFF00FFFF00FFC98461C06132D47243
                    DF7C4DDF7D4DDC7A49DA7847DA7949DD8053E08A61D78760BF6D45BC7350FF00
                    FFFF00FFFF00FFFF00FFF2E1D8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FFEDD6CAC78260B85D30C3693DCF764BD0784ED07A50C7734ABA653DBA6C47
                    E0BFAEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE7CABCD8AA94D7AA94D7AA94DB
                    B4A1F0DFD7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                  LookAndFeel.Kind = lfOffice11
                  LookAndFeel.NativeStyle = False
                  LookAndFeel.SkinName = 'Office2007Blue'
                  Margin = 5
                  TabOrder = 0
                  OnClick = cxButton4Click
                end
                object ButSalvar: TcxButton
                  Left = 41
                  Top = 2
                  Width = 36
                  Height = 33
                  Hint = 'Salvar ( Alt + S )'
                  Caption = '   &S'
                  Glyph.Data = {
                    76060000424D7606000000000000360400002800000018000000180000000100
                    08000000000040020000320B0000320B00000001000000000000942121009429
                    2900943131009C3131009C393900A5393900944242009C424200A5424200AD42
                    4200A54A42009C424A009C4A4A00A54A4A00AD4A4A00B54A4A009C525200B552
                    5200BD525200C6525200BD5A5A00C65A5A00CE5A5A009C636300A5636300C663
                    6300CE6363009C6B6B00B56B6B00BD6B6B00C66B6B00CE6B6B00AD736B00B573
                    6B009C737300A5737300B5737300BD737300C6737300CE737300B5847300A57B
                    7B00AD7B7B00BD7B7B00C67B7B00CE7B7B00A5848400B5848400BD848400C684
                    8400B58C8400A58C8C00AD8C8C00B58C8C00C68C8C00CE8C8C00BD949400D694
                    94009C9C9C00BD9C9C00C69C9C00CE9C9C00CEA59C00ADA5A500CEA5A500D6A5
                    A500C6ADAD00CEADAD00D6ADAD00B5B5B500BDB5B500DEB5B500BDBDB500B5BD
                    BD00BDBDBD00D6BDBD00DEBDBD00C6C6C600CEC6C600DEC6C600E7C6C600C6CE
                    CE00CECECE00D6CECE00DECECE00D6D6D600DEDED600DEDEDE00E7DEDE00E7E7
                    DE00EFE7DE00E7E7E700EFE7E700F7E7E700EFEFE700F7EFE700EFEFEF00F7EF
                    EF00F7F7EF00F7F7F700FFF7F700FFFFF700FF00FF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00666666666666
                    6666666666666666666666666666666666666666661E191A111B454545454545
                    454545240102040C66666666281E1A1A141B332F43546265635E5B2401020415
                    0C666666281E1A1A14222904213C5C636462602B010204150C666666281E1A1A
                    14232E02072456606364632B010204150C666666281E1A1A14233402020C4D59
                    6064672C010204150C666666281E1A1A112A350101023F525961673101020415
                    0C666666281E1A1A112A421818173A4555606731010204140C666666281E1A1A
                    1424413C3B3834343C44502608090E190C666666281E1A1A1A1A1A1A1A1A1A1A
                    1919191A1A1A1A1A0C666666281E14191E2727272727272727272727272D1F1A
                    0C666666280E0A1C36434B4B4B4B4B4B4B4B4B4B4B4F371A0C66666628093D62
                    616161616161616161616161615C37150C666666280940676363636363636363
                    63636363645C37140C66666628094067616161616161616161616161635C3714
                    0C666666280940675B4E5252525252525252524D585C37140C66666628094067
                    615C5C5C5C5C5C5C5C5C5C5C615C37140C666666280940675C53535353535353
                    535353525B5C37140C666666280940675E5858585858585858585858605C3714
                    0C666666280940675E5858585858585858585858605C37140C66666628094067
                    5B52535353535353535353525B5C37140C666666280940676464646464646464
                    64646464645C37150C66666666093D514D4D4D4D4D4D4D4D4D4D4D4D4D4D3611
                    6666666666666666666666666666666666666666666666666666}
                  LookAndFeel.Kind = lfOffice11
                  LookAndFeel.NativeStyle = False
                  LookAndFeel.SkinName = 'Office2007Blue'
                  Margin = 5
                  TabOrder = 1
                end
              end
              object Panel13: TPanel
                Left = 3
                Top = 100
                Width = 850
                Height = 27
                Alignment = taLeftJustify
                BevelInner = bvLowered
                Caption = 
                  '  Produto                                                       ' +
                  '                                                                ' +
                  '                                                                ' +
                  '                                                 NCM'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 3
                object Edit2: TEdit
                  Left = 184
                  Top = 3
                  Width = 0
                  Height = 22
                  TabStop = False
                  CharCase = ecUpperCase
                  Color = 14931644
                  Enabled = False
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  Visible = False
                end
                object ediNCM_Det: TrsSuperEdit
                  Tag = -1
                  Left = 779
                  Top = 3
                  Width = 65
                  Height = 22
                  Options = [soAutoAlign, soAllowspaces, soEnterToTab]
                  TagName = 'NCM'
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  ReadOnly = True
                  TabOrder = 1
                end
                object editCodProduto: TrsSuperEdit
                  Tag = -1
                  Left = 102
                  Top = 3
                  Width = 121
                  Height = 22
                  TagName = 'CodProduto'
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  TabOrder = 2
                end
                object EditDesc_Produto: TrsSuperEdit
                  Left = 230
                  Top = 3
                  Width = 449
                  Height = 22
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  TabOrder = 3
                end
              end
              object Panel26: TPanel
                Left = 3
                Top = 324
                Width = 850
                Height = 27
                Alignment = taLeftJustify
                BevelInner = bvLowered
                Caption = 
                  '                                                                ' +
                  ' Quantida                                           Unit'#225'rio R$ ' +
                  '                                                                ' +
                  '                                  Total R$                      ' +
                  '                                                '
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 4
                object ediQtde_Det: TrsSuperEdit
                  Left = 269
                  Top = 3
                  Width = 65
                  Height = 22
                  Alignment = taRightJustify
                  Format = foReal
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  Decimals = 3
                  CharCase = ecUpperCase
                  Ctl3D = True
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentCtl3D = False
                  ParentFont = False
                  TabOrder = 0
                end
                object ediTotal_Det: TrsSuperEdit
                  Left = 779
                  Top = 3
                  Width = 65
                  Height = 22
                  TabStop = False
                  Options = [soAutoAlign, soAllowspaces, soEnterToTab]
                  Alignment = taRightJustify
                  Format = foCurrency
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  CharCase = ecUpperCase
                  Enabled = False
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 2
                end
                object ediValor_Det: TrsSuperEdit
                  Left = 439
                  Top = 3
                  Width = 65
                  Height = 22
                  Options = [soAutoAlign, soAllowspaces, soEnterToTab]
                  Alignment = taRightJustify
                  Format = foCurrency
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  CharCase = ecUpperCase
                  Ctl3D = True
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentCtl3D = False
                  ParentFont = False
                  TabOrder = 1
                end
              end
              object Panel28: TPanel
                Tag = -1
                Left = 3
                Top = 128
                Width = 850
                Height = 27
                Alignment = taLeftJustify
                BevelInner = bvLowered
                Caption = 
                  '  CST ICMS                                                      ' +
                  'ICMS %                                Valor ICMS R$             ' +
                  '                     Base ICMS                          '
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 5
                object rsSuperEdit15: TrsSuperEdit
                  Left = 36
                  Top = 3
                  Width = 0
                  Height = 22
                  TabStop = False
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  MaxLength = 8
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
                object ediPorcICMS_Det: TrsSuperEdit
                  Tag = -1
                  Left = 269
                  Top = 4
                  Width = 65
                  Height = 22
                  Options = [soAutoAlign, soAllowspaces, soEnterToTab]
                  Alignment = taRightJustify
                  Format = foCurrency
                  TagName = 'PorcICMS'
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  CharCase = ecUpperCase
                  Ctl3D = True
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentCtl3D = False
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 1
                end
                object editcsticms_det: TrsSuperEdit
                  Left = 102
                  Top = 3
                  Width = 65
                  Height = 22
                  TagName = 'NF_TipoICMS'
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  TabOrder = 2
                end
                object edivaloricms_det: TrsSuperEdit
                  Tag = -1
                  Left = 439
                  Top = 3
                  Width = 65
                  Height = 22
                  Options = [soAutoAlign, soAllowspaces, soEnterToTab]
                  Alignment = taRightJustify
                  Format = foCurrency
                  TagName = 'ValorICMS'
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 3
                end
                object EditvwBaseICMS: TrsSuperEdit
                  Tag = -1
                  Left = 602
                  Top = 3
                  Width = 74
                  Height = 22
                  Options = [soAutoAlign, soAllowspaces, soEnterToTab]
                  Alignment = taRightJustify
                  Format = foCurrency
                  TagName = 'BaseICMS'
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 4
                end
              end
              object Panel18: TPanel
                Tag = -1
                Left = 3
                Top = 268
                Width = 850
                Height = 27
                Alignment = taLeftJustify
                BevelInner = bvLowered
                Caption = 
                  '   ICMS Partilha %                                          FCP ' +
                  'R$                            ICMS Origem R$                    ' +
                  '                                                           ICMS ' +
                  'do Destino R$'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 6
                object rsSuperEdit4: TrsSuperEdit
                  Left = 36
                  Top = 3
                  Width = 0
                  Height = 22
                  TabStop = False
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  MaxLength = 8
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
                object ediPorcProvPartICMS: TrsSuperEdit
                  Left = 102
                  Top = 2
                  Width = 65
                  Height = 22
                  Options = [soAutoAlign, soAllowspaces, soEnterToTab]
                  Alignment = taRightJustify
                  Format = foCurrency
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 1
                end
                object edifcp: TrsSuperEdit
                  Left = 269
                  Top = 3
                  Width = 65
                  Height = 22
                  Options = [soAutoAlign, soAllowspaces, soEnterToTab]
                  Alignment = taRightJustify
                  Format = foCurrency
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 2
                end
                object ediVlrICMSRemtente: TrsSuperEdit
                  Left = 439
                  Top = 3
                  Width = 65
                  Height = 22
                  Options = [soAutoAlign, soAllowspaces, soEnterToTab]
                  Alignment = taRightJustify
                  Format = foCurrency
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 3
                end
                object ediVlrICMSDestinatario: TrsSuperEdit
                  Left = 779
                  Top = 2
                  Width = 65
                  Height = 22
                  Options = [soAutoAlign, soAllowspaces, soEnterToTab]
                  Alignment = taRightJustify
                  Format = foCurrency
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 4
                end
              end
              object Panel31: TPanel
                Tag = -1
                Left = 3
                Top = 184
                Width = 850
                Height = 27
                Alignment = taLeftJustify
                BevelInner = bvLowered
                Caption = 
                  '  CST IPI                                                       ' +
                  '        IPI %                                     Valor IPI R$  ' +
                  '                                      Base IPI                  ' +
                  '                    IVA Ajust. %                                ' +
                  '           '
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 7
                object rsSuperEdit6: TrsSuperEdit
                  Left = 36
                  Top = 3
                  Width = 0
                  Height = 22
                  TabStop = False
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  MaxLength = 8
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
                object ediPorcIPI_Det: TrsSuperEdit
                  Left = 269
                  Top = 3
                  Width = 64
                  Height = 22
                  Options = [soAutoAlign, soAllowspaces, soEnterToTab]
                  Alignment = taRightJustify
                  Format = foCurrency
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  CharCase = ecUpperCase
                  Ctl3D = True
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentCtl3D = False
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 1
                end
                object edicstipi_Det: TrsSuperEdit
                  Left = 102
                  Top = 3
                  Width = 65
                  Height = 22
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  TabOrder = 2
                end
                object edivaloripi_det: TrsSuperEdit
                  Left = 439
                  Top = 3
                  Width = 65
                  Height = 22
                  Options = [soAutoAlign, soAllowspaces, soEnterToTab]
                  Alignment = taRightJustify
                  Format = foCurrency
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 3
                end
                object PorcIVAAjus_Det: TrsSuperEdit
                  Left = 779
                  Top = 4
                  Width = 65
                  Height = 22
                  Options = [soAutoAlign, soAllowspaces, soEnterToTab]
                  Alignment = taRightJustify
                  Format = foCurrency
                  TagName = 'IVA_ST'
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  CustomMask = '##,##0.00'
                  MaxLength = 50
                  CharCase = ecUpperCase
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 4
                end
                object EditvwBaseIPI: TrsSuperEdit
                  Left = 602
                  Top = 3
                  Width = 74
                  Height = 22
                  Options = [soAutoAlign, soAllowspaces, soEnterToTab]
                  Alignment = taRightJustify
                  Format = foCurrency
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 5
                end
              end
              object Panel33: TPanel
                Tag = -1
                Left = 3
                Top = 212
                Width = 850
                Height = 27
                Alignment = taLeftJustify
                BevelInner = bvLowered
                Caption = 
                  '  CST PIS                                                       ' +
                  '      PIS%                                    Valor PIS R$      ' +
                  '                                 Base PIS                     '
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 8
                object rsSuperEdit7: TrsSuperEdit
                  Left = 36
                  Top = 3
                  Width = 0
                  Height = 22
                  TabStop = False
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  MaxLength = 8
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
                object ediPorcPIS_Det: TrsSuperEdit
                  Left = 269
                  Top = 4
                  Width = 65
                  Height = 22
                  Options = [soAutoAlign, soAllowspaces, soEnterToTab]
                  Alignment = taRightJustify
                  Format = foCurrency
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  CharCase = ecUpperCase
                  Ctl3D = True
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentCtl3D = False
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 1
                end
                object edicstpis_det: TrsSuperEdit
                  Left = 102
                  Top = 4
                  Width = 65
                  Height = 22
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  TabOrder = 2
                end
                object edivalorpis_det: TrsSuperEdit
                  Left = 439
                  Top = 3
                  Width = 65
                  Height = 22
                  Options = [soAutoAlign, soAllowspaces, soEnterToTab]
                  Alignment = taRightJustify
                  Format = foCurrency
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 3
                end
                object EditvwBasePIS: TrsSuperEdit
                  Left = 602
                  Top = 3
                  Width = 74
                  Height = 22
                  Options = [soAutoAlign, soAllowspaces, soEnterToTab]
                  Alignment = taRightJustify
                  Format = foCurrency
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 4
                end
              end
              object Panel34: TPanel
                Tag = -1
                Left = 3
                Top = 240
                Width = 850
                Height = 27
                Alignment = taLeftJustify
                BevelInner = bvLowered
                Caption = 
                  '  CST COFINS                                             COFINS ' +
                  '%                             Valor COFINS R$                   ' +
                  '            Base COFINS                                         ' +
                  '   '
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 9
                object rsSuperEdit9: TrsSuperEdit
                  Left = 36
                  Top = 3
                  Width = 0
                  Height = 22
                  TabStop = False
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  MaxLength = 8
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
                object ediPorcCofins_Det: TrsSuperEdit
                  Left = 269
                  Top = 3
                  Width = 65
                  Height = 22
                  Options = [soAutoAlign, soAllowspaces, soEnterToTab]
                  Alignment = taRightJustify
                  Format = foCurrency
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  CharCase = ecUpperCase
                  Ctl3D = True
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentCtl3D = False
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 1
                end
                object edicstcofins_det: TrsSuperEdit
                  Left = 102
                  Top = 3
                  Width = 65
                  Height = 22
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  TabOrder = 2
                end
                object edivalorcofins_det: TrsSuperEdit
                  Left = 439
                  Top = 3
                  Width = 65
                  Height = 22
                  Options = [soAutoAlign, soAllowspaces, soEnterToTab]
                  Alignment = taRightJustify
                  Format = foCurrency
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 3
                end
                object EditvwBaseCOFINS: TrsSuperEdit
                  Left = 602
                  Top = 3
                  Width = 74
                  Height = 22
                  Options = [soAutoAlign, soAllowspaces, soEnterToTab]
                  Alignment = taRightJustify
                  Format = foCurrency
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 4
                end
              end
              object Panel35: TPanel
                Tag = -1
                Left = 3
                Top = 156
                Width = 850
                Height = 27
                Alignment = taLeftJustify
                BevelInner = bvLowered
                Caption = 
                  '                                                                ' +
                  '    ICMS ST %                          Valor ICMS ST R$         ' +
                  '                    Base ICMS ST                                ' +
                  '                  IVA %                          '
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 10
                object rsSuperEdit10: TrsSuperEdit
                  Left = 36
                  Top = 3
                  Width = 0
                  Height = 22
                  TabStop = False
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  MaxLength = 8
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
                object PorcIcmsST_Det: TrsSuperEdit
                  Left = 269
                  Top = 4
                  Width = 65
                  Height = 22
                  Options = [soAutoAlign, soAllowspaces, soEnterToTab]
                  Alignment = taRightJustify
                  Format = foCurrency
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  CharCase = ecUpperCase
                  Ctl3D = True
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentCtl3D = False
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 1
                end
                object ediValorICMSST_Det: TrsSuperEdit
                  Left = 439
                  Top = 3
                  Width = 65
                  Height = 22
                  Options = [soAutoAlign, soAllowspaces, soEnterToTab]
                  Alignment = taRightJustify
                  Format = foCurrency
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 2
                end
                object PorcIVA_Det: TrsSuperEdit
                  Left = 779
                  Top = 3
                  Width = 65
                  Height = 22
                  Options = [soAutoAlign, soAllowspaces, soEnterToTab]
                  Alignment = taRightJustify
                  Format = foCurrency
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  CustomMask = '##,##0.00'
                  MaxLength = 50
                  CharCase = ecUpperCase
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 3
                end
                object EditvwBaseICMSST: TrsSuperEdit
                  Left = 602
                  Top = 3
                  Width = 74
                  Height = 22
                  Options = [soAutoAlign, soAllowspaces, soEnterToTab]
                  Alignment = taRightJustify
                  Format = foCurrency
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 4
                end
              end
              object Panel5: TPanel
                Tag = -1
                Left = 3
                Top = 71
                Width = 850
                Height = 28
                Alignment = taLeftJustify
                BevelInner = bvLowered
                Caption = '  CFOP                          '
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 11
                object ediCFOP_Det: TrsSuperEdit
                  Tag = -2
                  Left = 103
                  Top = 3
                  Width = 120
                  Height = 22
                  TagName = 'CTE_CFOP_ID'
                  CT_Titulo = 'Consulta Natureza de Opera'#231#227'o'
                  CT_TableName = 'CTE_CFOP'
                  CT_NumFields = 4
                  CT_ColTit = 'C'#243'digo;CFOP;Descri'#231#227'o;Tipo'
                  CT_ColField = 'CTE_CFOP_ID;CFOP;DESCRICAO;TIPO'
                  CT_RetField1 = 1
                  CT_RetControl1 = ediCFOP_Det
                  CT_RetField2 = 2
                  CT_RetControl2 = editDescCFOP
                  CT_Test = False
                  CT_ConsTab = True
                  CT_KeyValue = ediCFOP_Det
                  CT_Search = False
                  MaxLength = 15
                  CharCase = ecUpperCase
                  TabOrder = 0
                  OnExit = ediCFOP_DetExit
                end
                object editDescCFOP: TEdit
                  Left = 230
                  Top = 4
                  Width = 614
                  Height = 22
                  Color = 14931644
                  ReadOnly = True
                  TabOrder = 1
                end
              end
              object cxGroupBox1: TcxGroupBox
                Left = 3
                Top = 2
                Caption = 'Informa'#231#245'es da NF-e'
                TabOrder = 12
                Height = 67
                Width = 850
                object Label4: TLabel
                  Left = 9
                  Top = 17
                  Width = 60
                  Height = 13
                  Caption = 'N'#250'mero NF'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label5: TLabel
                  Left = 136
                  Top = 14
                  Width = 64
                  Height = 13
                  Caption = 'Fornecedor'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label6: TLabel
                  Left = 722
                  Top = 17
                  Width = 93
                  Height = 13
                  Caption = 'Data da Emiss'#227'o'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label7: TLabel
                  Left = 604
                  Top = 17
                  Width = 94
                  Height = 13
                  Caption = 'Valor Total da NF'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object editNumNF: TrsSuperEdit
                  Tag = -1
                  Left = 9
                  Top = 33
                  Width = 121
                  Height = 21
                  TagName = 'NUMNF'
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  TabOrder = 0
                end
                object editFornecedor: TrsSuperEdit
                  Left = 136
                  Top = 33
                  Width = 460
                  Height = 21
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  TabOrder = 1
                end
                object DataEntrega_Det: TcxDateEdit
                  Left = 722
                  Top = 33
                  TabOrder = 2
                  Width = 121
                end
                object EditTotalNF: TrsSuperEdit
                  Left = 604
                  Top = 33
                  Width = 112
                  Height = 22
                  Alignment = taRightJustify
                  Format = foCurrency
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  CharCase = ecUpperCase
                  Ctl3D = True
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentCtl3D = False
                  ParentFont = False
                  TabOrder = 3
                end
              end
              object Panel6: TPanel
                Left = 3
                Top = 296
                Width = 850
                Height = 27
                Alignment = taLeftJustify
                BevelInner = bvLowered
                Caption = 
                  '                                                             Val' +
                  'or Frete R$                            Valor Seguro R$          ' +
                  '                                                        Valor Ou' +
                  'tras Despesas R$'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 13
                object ediValorFrete_Det: TrsSuperEdit
                  Tag = -1
                  Left = 269
                  Top = 3
                  Width = 64
                  Height = 22
                  Alignment = taRightJustify
                  Format = foCurrency
                  TagName = 'TotalFrete'
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  CharCase = ecUpperCase
                  Ctl3D = True
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = []
                  ParentCtl3D = False
                  ParentFont = False
                  TabOrder = 0
                end
                object ediValorSeguro_Det: TrsSuperEdit
                  Tag = -1
                  Left = 439
                  Top = 3
                  Width = 65
                  Height = 22
                  Alignment = taRightJustify
                  Format = foCurrency
                  TagName = 'TotalSeguro'
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 1
                end
                object ediValorOutrasDespesas_Det: TrsSuperEdit
                  Tag = -1
                  Left = 779
                  Top = 3
                  Width = 65
                  Height = 22
                  Alignment = taRightJustify
                  Format = foCurrency
                  TagName = 'TotalOutrasDespesas'
                  CT_NumFields = 0
                  CT_RetField1 = 0
                  CT_RetField2 = 0
                  CT_Test = False
                  CT_ConsTab = False
                  CT_Search = False
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 2
                end
              end
            end
          end
        end
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 561
    Width = 937
    Height = 19
    Panels = <>
  end
  object Panel3: TPanel
    Left = 0
    Top = 520
    Width = 937
    Height = 41
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object ButPesquisar: TcxButton
      Left = 6
      Top = 3
      Width = 96
      Height = 34
      Hint = 'Pesquisar'
      Caption = ' &Consultar'
      Glyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000320B0000320B000000010000000000005A5A5A005263
        6B00846B6B009C6B6B00636B7300A5737300A57B73007B7B7B00AD847B00AD8C
        8400B58C8400EFBD8400BD8C8C00C6948C00BD9C8C00C69C8C00F7BD8C00F7C6
        8C00738494007B84940084849400C6949400C69C9400CE9C9400D69C9400BDA5
        9400CEA59400CEAD9400F7C69400F7CE94009C9C9C00BD9C9C00CE9C9C00D69C
        9C00CEA59C00F7CE9C00F7D69C003973A500C6A5A500ADADA500D6ADA500D6B5
        A500D6BDA500F7D6A500C6ADAD00D6B5AD00D6C6AD00DEC6AD00E7C6AD00E7CE
        AD00F7D6AD00F7DEAD00FFDEAD001873B5002173B5006394B500E7CEB500EFD6
        B500EFDEB500F7DEB500FFE7B5001873BD00E7D6BD00F7DEBD00F7E7BD00FFE7
        BD00FFEFBD00FFF7BD00EFDEC600EFE7C600FFEFC600FFF7C600FFF7CE003184
        D600FFFFD600C6CEDE00F7EFDE00FFEFDE00FFFFDE00EFEFE700FFF7E700FFFF
        E700218CEF00F7F7EF00FFFFEF00FFFFF700FF00FF0031A5FF0039A5FF0042A5
        FF004AB5FF0052BDFF005ABDFF007BC6FF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00560004165656
        5656565656565656565656565656565656562725361217565656565656565656
        5656565656565656565637585236131756565656565656565656565656565656
        56565A5C59523613175656565656565656565656565656565656575B5C595236
        13175656565656565656565656565656565656575B5C59523614175656565656
        565656565656565656565656575B5C5952361417565656565656565656565656
        5656565656575B5C59523614565656565656565656565656565656565656575B
        5C5849015656030A222928201556565656565656565656575B5D4B1E02093E48
        4A4E4A4A44225656565656565656565656564F2C1A484A4E4A4A4A4E4E4E2905
        565656565656565656562C1A4241484A4A4A4E4E515E5E265656565656565656
        56560C3A3C32484A4A4E5154555E5E4C065656565656565656562942232B484A
        4A4E54555E55544E1956565656565656561531421123464A4A4E545555544E4E
        2E155656565656565615393C0B113B4A4A4E515454514E4E3E0E565656565656
        56153942100B23464A4E4E4E4E4E4A4E3E0E56565656565656153142230B1C2B
        464A4E4A4A4A4A4E2E1556565656565656562842413323232B40484A4A4A4A4A
        0E5656565656565656560C3A4E544C231D1C324040464A440556565656565656
        5656560F505E5E3F1C0B101C3242460E5656565656565656565656561F4F5448
        3C33333C4240165656565656565656565656565656062A404242424030155656
        565656565656565656565656565656080F222216565656565656}
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'Office2007Blue'
      TabOrder = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = ButPesquisarClick
    end
    object cxButton3: TcxButton
      Left = 105
      Top = 3
      Width = 104
      Height = 34
      Hint = 'Exportar para Excel (Alt+E)'
      Caption = '   &Exportar'
      Glyph.Data = {
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
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'Office2007Blue'
      TabOrder = 1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = cxButton3Click
    end
    object btnLimpar: TcxButton
      Left = 212
      Top = 3
      Width = 112
      Height = 34
      Hint = 'Limpar &Filtro (Alt + F)'
      Caption = '   &Limpar Filtro'
      Glyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000220B0000220B00000001000000000000EFA53900EFA5
        5200FFB55200E7AD6B00F7BD6B00AD7B7300AD847300B5847300AD7B7B00AD73
        84009C7B8400A57B8400AD7B8400B57B8400B5848400BD848400E7B58400BD84
        8C00C68C8C00CE948C00DEA58C00EFC68C00F7C68C00D6949400D69C9400DE9C
        9400DEA59400E7A59400B5AD9400EFCE9400B5AD9C00EFCE9C00F7CE9C00F7D6
        9C00CEADA500BDB5A500DEC6A500EFCEA500F7CEA500F7D6A500CEBDAD00D6C6
        AD00F7D6AD00F7D6B500F7DEB500DEC6BD00E7CEBD00EFD6BD00F7DEBD00E7CE
        C600EFCEC600EFD6C600EFDEC600F7DEC600F7E7C600FFE7C600E7D6CE00E7DE
        CE00F7DECE00F7E7CE00FFE7CE00E7D6D600EFDED600F7E7D600FFE7D600FFEF
        D600EFDEDE00F7E7DE00F7EFDE00FFEFDE00F7EFE700FFEFE700FFF7E700F7EF
        EF00FFF7EF00FFF7F700FFFFF700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004D4D4D080E0E
        0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E4D4D4D4D4D093436302C2B2A271F1F1D
        1D1D1D1D1D1D1D0E4D4D4D4D4D09343635302B2A2A251F1F1D1D1D1D1D1D1D0E
        4D4D4D4D4D093A3B3535302B2A2A251F1F1D1D1D1D1D1D0E4D4D4D4D4D093B3F
        3B3530302B2A2A251F1F1D1D1D1D1D0E4D4D4D4D4D093F443F3B3535302B2A2A
        251F1F1D1D1D1D0E4D4D4D4D4D0C43443F3B3B3535302B2A2A251F1F1D1D1D0E
        4D4D4D4D4D0D4646443F3B3B3530302B2A2A251F1F1D1D0E4D4D4D4D4D0E464A
        46443F3F3B3530302B2A2A251F1F1D0E4D4D4D4D4D0F494A4646443F3B3B3530
        302B2A2A251F1D0E4D4D4D4D4D114B4C4A4646443F3B3B3535302B2A2A251F0E
        4D4D4D4D4D124B4E4B4A4646443F3B3B3530302B2A2A250E4D4D4D4D4D124B4E
        4E4B4A4646443F3B3B3530302B2A250E4D4D4D4D4D124B4E4E4E4B4A4646443F
        3B3B3530302B2A0E4D4D4D4D4D134B4E4E4E4E4B4A4646443F3B3B353030240B
        4D4D4D4D4D134B4E4E4E4E4E4B4A4646443F3B3B2F281C0A4D4D4D4D4D184B4E
        4E4E4E4E4E4B4A464444443928231E0A4D4D4D4D4D184B4E4E4E4E4E4E4E4B4A
        483E0706050505054D4D4D4D4D1A4B4E4E4E4E4E4E4E4C4B4A3107100301000E
        4D4D4D4D4D1A4B4E4E4E4E4E4E4E4E4E4C31071504020E4D4D4D4D4D4D1A4B4E
        4E4E4E4E4E4E4E4E4E380715040E4D4D4D4D4D4D4D1A4E4E4E4E4E4E4E4E4E4E
        4E3D07150E4D4D4D4D4D4D4D4D142E2F2F322E2E2E2E2D2D2D22070E4D4D4D4D
        4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D}
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'Office2007Blue'
      TabOrder = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = btnLimparClick
    end
    object ButSair: TcxButton
      Left = 430
      Top = 3
      Width = 100
      Height = 34
      Hint = 'Sair (Alt+S)'
      Caption = '   &Sair'
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDFB096EFD7CBFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFC1693AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFD1916FCC8661FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE6C3B0B95C2BE5C2B0FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBC5E
        2DC27147FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFC67B53C26131E4C1AFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFD3997BCA6635C37953FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDBAD95CF6837BC5F31FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDBAD
        95CC6A3AC7683BE3C0AFCE6C34CE6C34CE6C34CE6C34CE6C34CE6C34CE6C34CE
        6C34CE6C34CE6C34CE6C34CE6C34FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFDAAC95CB6D3FD07345D4A187CE6C34E67F44E57E43E57D42E57D
        42E47C41E47A40E3793FE2773EDB723BC96F3DF4E2D8FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFDAAC95D17446D87D50C5815FCC6A33E88044
        E27E3CE27D3BE17C3AE07A39E07939E5793DDE743BCA703DF4E2D8FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD1977BD2784CDC8357C4
        805FCB6933E77D41DE7936DE7836DD7735DD7635E3783CDE743BCA6F3DF4E2D8
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBF6F
        48DC8357DB845BC47F5EC96832E67B3FDD7634DC7533DC7432DE7435E3763CCB
        6833E4BBA4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFECD6CABE653AE2885DD27C53C88A6CC86732E67D44DC7839DC7738DE76
        38DA7334E0753ADD733DC66C3DF3E2D8FF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFC6825FD47E54E28B60C7734AD6A994C66631E57D44
        DD7A3DE37B43E47B43DD783DDB773CE27841D56E3AC36A3BF3E1D8FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFD4A087C26C41E18A60E18C64BA653DF0
        DFD7C56430E57A43E37942DD743FD6703BE27840DA753BD9743AE1763FD76E3A
        BF602EDCAE95FF00FFFF00FFFF00FFFF00FFFF00FFCF977ABD663BDE895FE08A
        60D78760BA6C47FF00FFC36330E37942DC733EC66C3DC56B3DDB723DE0763ED9
        7239D87139DF733DDD7340C96838BF693CCD8E6DDAAC95C78260B85E32CA744A
        DF895FDD8358E08E66BF6D45E0BEAFFF00FFC1622FDB723DC46B3DF3E1D8E6C3
        B0BF602EDA703CDF743DD87039D66F37DA713CE07A48DE7D4DD6794BD17649D8
        8055DF875CE0865AD97A4CE18C63CB7B56C17E5EFF00FFFF00FFBD5F2EC46A3D
        F3E1D8FF00FFFF00FFEED7CBC1683BCF6837E07541DD7440D66E39D46B36D770
        3CD97543DA7746D97646D6713FD97A4CDF8B63CE7F5ABE7654FF00FFFF00FFFF
        00FFBE6739F2E1D8FF00FFFF00FFFF00FFFF00FFFF00FFC98461C06132D47243
        DF7C4DDF7D4DDC7A49DA7847DA7949DD8053E08A61D78760BF6D45BC7350FF00
        FFFF00FFFF00FFFF00FFF2E1D8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFEDD6CAC78260B85D30C3693DCF764BD0784ED07A50C7734ABA653DBA6C47
        E0BFAEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE7CABCD8AA94D7AA94D7AA94DB
        B4A1F0DFD7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'Office2007Blue'
      TabOrder = 3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = ButSairClick
    end
    object cxButton1: TcxButton
      Left = 327
      Top = 3
      Width = 100
      Height = 34
      Caption = '        &Ajuda ?'
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'Office2007Blue'
      TabOrder = 4
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 14
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = cxButton1Click
    end
  end
  object pnlDica: TPanel
    Left = 510
    Top = 2
    Width = 660
    Height = 146
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Visible = False
    object Memo1: TMemo
      Left = 1
      Top = 42
      Width = 658
      Height = 103
      Align = alClient
      Color = clBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = 16
      Font.Name = #39#39
      Font.Style = [fsBold]
      Lines.Strings = (
        
          '1) Clique com o bot'#227'o direito em  cima do documento desejado e c' +
          'lique em Copiar Chave.'
        ''
        
          '2) Com Duplo-clique o sistema ir'#225' abrir a pagina https://www.dan' +
          'feonline.com.br.'
        ''
        
          '3) Ao abrir a pagina, cole com CTRL-V ou bot'#227'o direito (Paste/Co' +
          'lar) no campo indicado referente'
        '    ao numero do chave.')
      ParentFont = False
      TabOrder = 0
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 658
      Height = 41
      Align = alTop
      Caption = 'Consultar Documento na WEB'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = 16
      Font.Name = #39#39#39
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
    end
  end
  object dsConsultaNFES: TDataSource
    DataSet = cdsConsultaNFES
    Left = 133
    Top = 346
  end
  object SaveDialog: TSaveDialog
    Left = 405
    Top = 210
  end
  object sqlConsultaNFES: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select * from VW_NFEITENS Where 1=2')
    SQLConnection = DB_Conect.SQLConnection
    Left = 128
    Top = 240
    object sqlConsultaNFESNumNF: TStringField
      FieldName = 'NumNF'
      Size = 6
    end
    object sqlConsultaNFESCodFilial: TStringField
      FieldName = 'CodFilial'
      Size = 15
    end
    object sqlConsultaNFESNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object sqlConsultaNFESCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object sqlConsultaNFESdhEmi: TSQLTimeStampField
      FieldName = 'dhEmi'
    end
    object sqlConsultaNFESValorTotal: TFMTBCDField
      FieldName = 'ValorTotal'
      Precision = 18
      Size = 2
    end
    object sqlConsultaNFESCodProduto: TStringField
      FieldName = 'CodProduto'
      Size = 40
    end
    object sqlConsultaNFESDescProduto: TStringField
      FieldName = 'DescProduto'
      Size = 255
    end
    object sqlConsultaNFESCodCest: TStringField
      FieldName = 'CodCest'
      Size = 50
    end
    object sqlConsultaNFESI_CFOP: TStringField
      FieldName = 'I_CFOP'
      Size = 10
    end
    object sqlConsultaNFESValorUnitario: TFMTBCDField
      FieldName = 'ValorUnitario'
      Precision = 18
      Size = 4
    end
    object sqlConsultaNFESQtde: TFMTBCDField
      FieldName = 'Qtde'
      Precision = 18
      Size = 4
    end
    object sqlConsultaNFESUnidadeItem: TStringField
      FieldName = 'UnidadeItem'
      Size = 10
    end
    object sqlConsultaNFESValorDesconto: TFMTBCDField
      FieldName = 'ValorDesconto'
      Precision = 18
      Size = 2
    end
    object sqlConsultaNFESValorFrete: TFMTBCDField
      FieldName = 'ValorFrete'
      Precision = 18
      Size = 2
    end
    object sqlConsultaNFESVlrOutrasDespesas: TFMTBCDField
      FieldName = 'VlrOutrasDespesas'
      Precision = 18
      Size = 2
    end
    object sqlConsultaNFESBaseICMS: TFMTBCDField
      FieldName = 'BaseICMS'
      Precision = 18
      Size = 2
    end
    object sqlConsultaNFESPorcICMS: TFMTBCDField
      FieldName = 'PorcICMS'
      Precision = 18
      Size = 2
    end
    object sqlConsultaNFESValorICMS: TFMTBCDField
      FieldName = 'ValorICMS'
      Precision = 18
      Size = 2
    end
    object sqlConsultaNFESBaseICMSST: TFMTBCDField
      FieldName = 'BaseICMSST'
      Precision = 18
      Size = 2
    end
    object sqlConsultaNFESValorICMS_ST: TFMTBCDField
      FieldName = 'ValorICMS_ST'
      Precision = 18
      Size = 2
    end
    object sqlConsultaNFESNF_TipoIPI: TStringField
      FieldName = 'NF_TipoIPI'
      Size = 2
    end
    object sqlConsultaNFESBaseIPI: TFMTBCDField
      FieldName = 'BaseIPI'
      Precision = 18
      Size = 2
    end
    object sqlConsultaNFESPorcIPI: TFMTBCDField
      FieldName = 'PorcIPI'
      Precision = 18
      Size = 2
    end
    object sqlConsultaNFESValorIPI: TFMTBCDField
      FieldName = 'ValorIPI'
      Precision = 18
      Size = 2
    end
    object sqlConsultaNFESNF_TipoPIS: TStringField
      FieldName = 'NF_TipoPIS'
      Size = 10
    end
    object sqlConsultaNFESBasePIS: TFMTBCDField
      FieldName = 'BasePIS'
      Precision = 18
      Size = 2
    end
    object sqlConsultaNFESPorcPIS: TFMTBCDField
      FieldName = 'PorcPIS'
      Precision = 18
      Size = 2
    end
    object sqlConsultaNFESValorPIS: TFMTBCDField
      FieldName = 'ValorPIS'
      Precision = 18
      Size = 2
    end
    object sqlConsultaNFESNF_TipoCofins: TStringField
      FieldName = 'NF_TipoCofins'
      Size = 10
    end
    object sqlConsultaNFESBaseCOFINS: TFMTBCDField
      FieldName = 'BaseCOFINS'
      Precision = 18
      Size = 2
    end
    object sqlConsultaNFESPorcCOFINS: TFMTBCDField
      FieldName = 'PorcCOFINS'
      Precision = 18
      Size = 2
    end
    object sqlConsultaNFESValorCofins: TFMTBCDField
      FieldName = 'ValorCofins'
      Precision = 18
      Size = 2
    end
  end
  object cdsConsultaNFES: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsultaNFES'
    Left = 120
    Top = 312
    object cdsConsultaNFESNumNF: TStringField
      FieldName = 'NumNF'
      Size = 6
    end
    object cdsConsultaNFESCodFilial: TStringField
      FieldName = 'CodFilial'
      Size = 15
    end
    object cdsConsultaNFESNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object cdsConsultaNFESCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object cdsConsultaNFESdhEmi: TSQLTimeStampField
      FieldName = 'dhEmi'
    end
    object cdsConsultaNFESValorTotal: TFMTBCDField
      FieldName = 'ValorTotal'
      Precision = 18
      Size = 2
    end
    object cdsConsultaNFESCodProduto: TStringField
      FieldName = 'CodProduto'
      Size = 40
    end
    object cdsConsultaNFESDescProduto: TStringField
      FieldName = 'DescProduto'
      Size = 255
    end
    object cdsConsultaNFESCodCest: TStringField
      FieldName = 'CodCest'
      Size = 50
    end
    object cdsConsultaNFESI_CFOP: TStringField
      FieldName = 'I_CFOP'
      Size = 10
    end
    object cdsConsultaNFESValorUnitario: TFMTBCDField
      FieldName = 'ValorUnitario'
      Precision = 18
      Size = 4
    end
    object cdsConsultaNFESQtde: TFMTBCDField
      FieldName = 'Qtde'
      Precision = 18
      Size = 4
    end
    object cdsConsultaNFESUnidadeItem: TStringField
      FieldName = 'UnidadeItem'
      Size = 10
    end
    object cdsConsultaNFESValorDesconto: TFMTBCDField
      FieldName = 'ValorDesconto'
      Precision = 18
      Size = 2
    end
    object cdsConsultaNFESValorFrete: TFMTBCDField
      FieldName = 'ValorFrete'
      Precision = 18
      Size = 2
    end
    object cdsConsultaNFESVlrOutrasDespesas: TFMTBCDField
      FieldName = 'VlrOutrasDespesas'
      Precision = 18
      Size = 2
    end
    object cdsConsultaNFESBaseICMS: TFMTBCDField
      FieldName = 'BaseICMS'
      Precision = 18
      Size = 2
    end
    object cdsConsultaNFESPorcICMS: TFMTBCDField
      FieldName = 'PorcICMS'
      Precision = 18
      Size = 2
    end
    object cdsConsultaNFESValorICMS: TFMTBCDField
      FieldName = 'ValorICMS'
      Precision = 18
      Size = 2
    end
    object cdsConsultaNFESBaseICMSST: TFMTBCDField
      FieldName = 'BaseICMSST'
      Precision = 18
      Size = 2
    end
    object cdsConsultaNFESValorICMS_ST: TFMTBCDField
      FieldName = 'ValorICMS_ST'
      Precision = 18
      Size = 2
    end
    object cdsConsultaNFESNF_TipoIPI: TStringField
      FieldName = 'NF_TipoIPI'
      Size = 2
    end
    object cdsConsultaNFESBaseIPI: TFMTBCDField
      FieldName = 'BaseIPI'
      Precision = 18
      Size = 2
    end
    object cdsConsultaNFESPorcIPI: TFMTBCDField
      FieldName = 'PorcIPI'
      Precision = 18
      Size = 2
    end
    object cdsConsultaNFESValorIPI: TFMTBCDField
      FieldName = 'ValorIPI'
      Precision = 18
      Size = 2
    end
    object cdsConsultaNFESNF_TipoPIS: TStringField
      FieldName = 'NF_TipoPIS'
      Size = 10
    end
    object cdsConsultaNFESBasePIS: TFMTBCDField
      FieldName = 'BasePIS'
      Precision = 18
      Size = 2
    end
    object cdsConsultaNFESPorcPIS: TFMTBCDField
      FieldName = 'PorcPIS'
      Precision = 18
      Size = 2
    end
    object cdsConsultaNFESValorPIS: TFMTBCDField
      FieldName = 'ValorPIS'
      Precision = 18
      Size = 2
    end
    object cdsConsultaNFESNF_TipoCofins: TStringField
      FieldName = 'NF_TipoCofins'
      Size = 10
    end
    object cdsConsultaNFESBaseCOFINS: TFMTBCDField
      FieldName = 'BaseCOFINS'
      Precision = 18
      Size = 2
    end
    object cdsConsultaNFESPorcCOFINS: TFMTBCDField
      FieldName = 'PorcCOFINS'
      Precision = 18
      Size = 2
    end
    object cdsConsultaNFESValorCofins: TFMTBCDField
      FieldName = 'ValorCofins'
      Precision = 18
      Size = 2
    end
  end
  object dspConsultaNFES: TDataSetProvider
    DataSet = sqlConsultaNFES
    Left = 120
    Top = 248
  end
  object sqlConsultaNFEE: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM VW_NFEITENS'
      ' WHERE 1=2')
    SQLConnection = DB_Conect.SQLConnection
    Left = 240
    Top = 120
    object sqlConsultaNFEENumNF: TStringField
      FieldName = 'NumNF'
      Size = 6
    end
    object sqlConsultaNFEECodFilial: TStringField
      FieldName = 'CodFilial'
      Size = 15
    end
    object sqlConsultaNFEENome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object sqlConsultaNFEECNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object sqlConsultaNFEEdhEmi: TSQLTimeStampField
      FieldName = 'dhEmi'
    end
    object sqlConsultaNFEEValorTotal: TFMTBCDField
      FieldName = 'ValorTotal'
      Precision = 18
      Size = 2
    end
    object sqlConsultaNFEECodProduto: TStringField
      FieldName = 'CodProduto'
      Size = 40
    end
    object sqlConsultaNFEEDescProduto: TStringField
      FieldName = 'DescProduto'
      Size = 255
    end
    object sqlConsultaNFEECodCest: TStringField
      FieldName = 'CodCest'
      Size = 50
    end
    object sqlConsultaNFEEI_CFOP: TStringField
      FieldName = 'I_CFOP'
      Size = 10
    end
    object sqlConsultaNFEEValorUnitario: TFMTBCDField
      FieldName = 'ValorUnitario'
      Precision = 18
      Size = 4
    end
    object sqlConsultaNFEEQtde: TFMTBCDField
      FieldName = 'Qtde'
      Precision = 18
      Size = 4
    end
    object sqlConsultaNFEEUnidadeItem: TStringField
      FieldName = 'UnidadeItem'
      Size = 10
    end
    object sqlConsultaNFEEValorDesconto: TFMTBCDField
      FieldName = 'ValorDesconto'
      Precision = 18
      Size = 2
    end
    object sqlConsultaNFEEValorFrete: TFMTBCDField
      FieldName = 'ValorFrete'
      Precision = 18
      Size = 2
    end
    object sqlConsultaNFEEVlrOutrasDespesas: TFMTBCDField
      FieldName = 'VlrOutrasDespesas'
      Precision = 18
      Size = 2
    end
    object sqlConsultaNFEEBaseICMS: TFMTBCDField
      FieldName = 'BaseICMS'
      Precision = 18
      Size = 2
    end
    object sqlConsultaNFEEPorcICMS: TFMTBCDField
      FieldName = 'PorcICMS'
      Precision = 18
      Size = 2
    end
    object sqlConsultaNFEEValorICMS: TFMTBCDField
      FieldName = 'ValorICMS'
      Precision = 18
      Size = 2
    end
    object sqlConsultaNFEEBaseICMSST: TFMTBCDField
      FieldName = 'BaseICMSST'
      Precision = 18
      Size = 2
    end
    object sqlConsultaNFEEValorICMS_ST: TFMTBCDField
      FieldName = 'ValorICMS_ST'
      Precision = 18
      Size = 2
    end
    object sqlConsultaNFEENF_TipoIPI: TStringField
      FieldName = 'NF_TipoIPI'
      Size = 2
    end
    object sqlConsultaNFEEBaseIPI: TFMTBCDField
      FieldName = 'BaseIPI'
      Precision = 18
      Size = 2
    end
    object sqlConsultaNFEEPorcIPI: TFMTBCDField
      FieldName = 'PorcIPI'
      Precision = 18
      Size = 2
    end
    object sqlConsultaNFEEValorIPI: TFMTBCDField
      FieldName = 'ValorIPI'
      Precision = 18
      Size = 2
    end
    object sqlConsultaNFEENF_TipoPIS: TStringField
      FieldName = 'NF_TipoPIS'
      Size = 10
    end
    object sqlConsultaNFEEBasePIS: TFMTBCDField
      FieldName = 'BasePIS'
      Precision = 18
      Size = 2
    end
    object sqlConsultaNFEEPorcPIS: TFMTBCDField
      FieldName = 'PorcPIS'
      Precision = 18
      Size = 2
    end
    object sqlConsultaNFEEValorPIS: TFMTBCDField
      FieldName = 'ValorPIS'
      Precision = 18
      Size = 2
    end
    object sqlConsultaNFEENF_TipoCofins: TStringField
      FieldName = 'NF_TipoCofins'
      Size = 10
    end
    object sqlConsultaNFEEBaseCOFINS: TFMTBCDField
      FieldName = 'BaseCOFINS'
      Precision = 18
      Size = 2
    end
    object sqlConsultaNFEEPorcCOFINS: TFMTBCDField
      FieldName = 'PorcCOFINS'
      Precision = 18
      Size = 2
    end
    object sqlConsultaNFEEValorCofins: TFMTBCDField
      FieldName = 'ValorCofins'
      Precision = 18
      Size = 2
    end
    object sqlConsultaNFEETipoNF: TStringField
      FieldName = 'TipoNF'
      FixedChar = True
      Size = 1
    end
    object sqlConsultaNFEENCM: TStringField
      FieldName = 'NCM'
    end
    object sqlConsultaNFEEPorcProvICMSPartilha: TFMTBCDField
      FieldName = 'PorcProvICMSPartilha'
      Precision = 18
      Size = 2
    end
    object sqlConsultaNFEEVlrFCP: TFMTBCDField
      FieldName = 'VlrFCP'
      Precision = 18
      Size = 2
    end
    object sqlConsultaNFEEVlrICMSUFRemetente: TFMTBCDField
      FieldName = 'VlrICMSUFRemetente'
      Precision = 18
      Size = 2
    end
    object sqlConsultaNFEEVlrICMSUFDestino: TFMTBCDField
      FieldName = 'VlrICMSUFDestino'
      Precision = 18
      Size = 2
    end
    object sqlConsultaNFEENF_TipoICMS: TStringField
      FieldName = 'NF_TipoICMS'
      Size = 2
    end
    object sqlConsultaNFEEICMS_Inter: TFMTBCDField
      FieldName = 'ICMS_Inter'
      Precision = 18
      Size = 2
    end
    object sqlConsultaNFEENF_IVA_ST: TFMTBCDField
      FieldName = 'NF_IVA_ST'
      Precision = 18
      Size = 2
    end
    object sqlConsultaNFEEVlrSeguro: TFMTBCDField
      FieldName = 'VlrSeguro'
      Precision = 18
      Size = 2
    end
    object sqlConsultaNFEEIVA_Original: TFMTBCDField
      FieldName = 'IVA_Original'
      Precision = 18
      Size = 2
    end
    object sqlConsultaNFEEvTPrest: TFMTBCDField
      FieldName = 'vTPrest'
      Precision = 18
      Size = 2
    end
  end
  object cdsConsultaNFEE: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsultaNFEE'
    Left = 216
    Top = 312
    object cdsConsultaNFEENumNF: TStringField
      FieldName = 'NumNF'
      Size = 6
    end
    object cdsConsultaNFEECodFilial: TStringField
      FieldName = 'CodFilial'
      Size = 15
    end
    object cdsConsultaNFEENome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object cdsConsultaNFEECNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object cdsConsultaNFEEdhEmi: TSQLTimeStampField
      FieldName = 'dhEmi'
    end
    object cdsConsultaNFEEValorTotal: TFMTBCDField
      FieldName = 'ValorTotal'
      Precision = 18
      Size = 2
    end
    object cdsConsultaNFEECodProduto: TStringField
      FieldName = 'CodProduto'
      Size = 40
    end
    object cdsConsultaNFEEDescProduto: TStringField
      FieldName = 'DescProduto'
      Size = 255
    end
    object cdsConsultaNFEECodCest: TStringField
      FieldName = 'CodCest'
      Size = 50
    end
    object cdsConsultaNFEEI_CFOP: TStringField
      FieldName = 'I_CFOP'
      Size = 10
    end
    object cdsConsultaNFEEValorUnitario: TFMTBCDField
      FieldName = 'ValorUnitario'
      Precision = 18
      Size = 4
    end
    object cdsConsultaNFEEQtde: TFMTBCDField
      FieldName = 'Qtde'
      Precision = 18
      Size = 4
    end
    object cdsConsultaNFEEUnidadeItem: TStringField
      FieldName = 'UnidadeItem'
      Size = 10
    end
    object cdsConsultaNFEEValorDesconto: TFMTBCDField
      FieldName = 'ValorDesconto'
      Precision = 18
      Size = 2
    end
    object cdsConsultaNFEEValorFrete: TFMTBCDField
      FieldName = 'ValorFrete'
      Precision = 18
      Size = 2
    end
    object cdsConsultaNFEEVlrOutrasDespesas: TFMTBCDField
      FieldName = 'VlrOutrasDespesas'
      Precision = 18
      Size = 2
    end
    object cdsConsultaNFEEBaseICMS: TFMTBCDField
      FieldName = 'BaseICMS'
      Precision = 18
      Size = 2
    end
    object cdsConsultaNFEEPorcICMS: TFMTBCDField
      FieldName = 'PorcICMS'
      Precision = 18
      Size = 2
    end
    object cdsConsultaNFEEValorICMS: TFMTBCDField
      FieldName = 'ValorICMS'
      Precision = 18
      Size = 2
    end
    object cdsConsultaNFEEBaseICMSST: TFMTBCDField
      FieldName = 'BaseICMSST'
      Precision = 18
      Size = 2
    end
    object cdsConsultaNFEEValorICMS_ST: TFMTBCDField
      FieldName = 'ValorICMS_ST'
      Precision = 18
      Size = 2
    end
    object cdsConsultaNFEENF_TipoIPI: TStringField
      FieldName = 'NF_TipoIPI'
      Size = 2
    end
    object cdsConsultaNFEEBaseIPI: TFMTBCDField
      FieldName = 'BaseIPI'
      Precision = 18
      Size = 2
    end
    object cdsConsultaNFEEPorcIPI: TFMTBCDField
      FieldName = 'PorcIPI'
      Precision = 18
      Size = 2
    end
    object cdsConsultaNFEEValorIPI: TFMTBCDField
      FieldName = 'ValorIPI'
      Precision = 18
      Size = 2
    end
    object cdsConsultaNFEENF_TipoPIS: TStringField
      FieldName = 'NF_TipoPIS'
      Size = 10
    end
    object cdsConsultaNFEEBasePIS: TFMTBCDField
      FieldName = 'BasePIS'
      Precision = 18
      Size = 2
    end
    object cdsConsultaNFEEPorcPIS: TFMTBCDField
      FieldName = 'PorcPIS'
      Precision = 18
      Size = 2
    end
    object cdsConsultaNFEEValorPIS: TFMTBCDField
      FieldName = 'ValorPIS'
      Precision = 18
      Size = 2
    end
    object cdsConsultaNFEENF_TipoCofins: TStringField
      FieldName = 'NF_TipoCofins'
      Size = 10
    end
    object cdsConsultaNFEEBaseCOFINS: TFMTBCDField
      FieldName = 'BaseCOFINS'
      Precision = 18
      Size = 2
    end
    object cdsConsultaNFEEPorcCOFINS: TFMTBCDField
      FieldName = 'PorcCOFINS'
      Precision = 18
      Size = 2
    end
    object cdsConsultaNFEEValorCofins: TFMTBCDField
      FieldName = 'ValorCofins'
      Precision = 18
      Size = 2
    end
    object cdsConsultaNFEETipoNF: TStringField
      FieldName = 'TipoNF'
      FixedChar = True
      Size = 1
    end
    object cdsConsultaNFEENCM: TStringField
      FieldName = 'NCM'
    end
    object cdsConsultaNFEEPorcProvICMSPartilha: TFMTBCDField
      FieldName = 'PorcProvICMSPartilha'
      Precision = 18
      Size = 2
    end
    object cdsConsultaNFEEVlrFCP: TFMTBCDField
      FieldName = 'VlrFCP'
      Precision = 18
      Size = 2
    end
    object cdsConsultaNFEEVlrICMSUFRemetente: TFMTBCDField
      FieldName = 'VlrICMSUFRemetente'
      Precision = 18
      Size = 2
    end
    object cdsConsultaNFEEVlrICMSUFDestino: TFMTBCDField
      FieldName = 'VlrICMSUFDestino'
      Precision = 18
      Size = 2
    end
    object cdsConsultaNFEENF_TipoICMS: TStringField
      FieldName = 'NF_TipoICMS'
      Size = 2
    end
    object cdsConsultaNFEEICMS_Inter: TFMTBCDField
      FieldName = 'ICMS_Inter'
      Precision = 18
      Size = 2
    end
    object cdsConsultaNFEENF_IVA_ST: TFMTBCDField
      FieldName = 'NF_IVA_ST'
      Precision = 18
      Size = 2
    end
    object cdsConsultaNFEEVlrSeguro: TFMTBCDField
      FieldName = 'VlrSeguro'
      Precision = 18
      Size = 2
    end
    object cdsConsultaNFEEIVA_Original: TFMTBCDField
      FieldName = 'IVA_Original'
      Precision = 18
      Size = 2
    end
    object cdsConsultaNFEEvTPrest: TFMTBCDField
      FieldName = 'vTPrest'
      Precision = 18
      Size = 2
    end
  end
  object dsConsultaNFEE: TDataSource
    DataSet = cdsConsultaNFEE
    Left = 152
    Top = 368
  end
  object dspConsultaNFEE: TDataSetProvider
    DataSet = sqlConsultaNFEE
    Left = 216
    Top = 248
  end
  object cxGridPopupMenu1: TcxGridPopupMenu
    PopupMenus = <>
    Left = 104
    Top = 16
  end
  object TimerPerfil: TTimer
    Enabled = False
    Interval = 100
    Left = 466
    Top = 2
  end
end