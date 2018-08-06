inherited FrmEditaItem: TFrmEditaItem
  Caption = 'Edita Item da Nota Fiscal Eletr'#244'nica'
  ClientHeight = 502
  ClientWidth = 907
  ExplicitWidth = 923
  ExplicitHeight = 540
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanFundo: TPanel
    Width = 907
    Height = 502
    ExplicitWidth = 907
    ExplicitHeight = 502
    inherited PanTitulo: TPanel
      Width = 903
      ExplicitWidth = 903
      inherited ImaBarraSup: TImage
        Width = 899
      end
    end
    inherited StatusBar: TdxStatusBar
      Top = 480
      Width = 903
      ExplicitTop = 480
      ExplicitWidth = 903
    end
    inherited Panel27: TPanel
      Top = 444
      Width = 903
      ExplicitTop = 444
      ExplicitWidth = 903
      inherited ButNovo: TcxButton
        Left = -1
        Top = 1
        ExplicitLeft = -1
        ExplicitTop = 1
      end
      inherited ButSalvar: TcxButton
        Top = -3
        ExplicitTop = -3
      end
    end
    object Panel13: TPanel
      Left = 3
      Top = 102
      Width = 900
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
      object rsSuperEdit1: TrsSuperEdit
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
      object EditDescProduto: TrsSuperEdit
        Tag = -1
        Left = 227
        Top = 3
        Width = 449
        Height = 22
        TagName = 'DescProduto'
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
      Top = 295
      Width = 900
      Height = 27
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = 
        '  Quantidade                                             Unit'#225'ri' +
        'o R$                                           Total R$         ' +
        '                                                               V' +
        'alor da Mercadoria R$'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      object lblUnidade_Det: TLabel
        Left = 174
        Top = 7
        Width = 20
        Height = 14
        Caption = 'Uni.'
      end
      object ediQtde_Det: TrsSuperEdit
        Left = 102
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
        Left = 439
        Top = 2
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
        TabOrder = 1
      end
      object ediLiquido_Det: TrsSuperEdit
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
        TabOrder = 3
      end
    end
    object Panel28: TPanel
      Tag = -1
      Left = 3
      Top = 133
      Width = 900
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
      Width = 900
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
        Width = 66
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
      Width = 900
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
      Width = 900
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
      Width = 900
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
      Top = 157
      Width = 900
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
    object Panel4: TPanel
      Tag = -1
      Left = 3
      Top = 73
      Width = 900
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
      object EdiCfop: TrsSuperEdit
        Tag = -1
        Left = 102
        Top = 3
        Width = 65
        Height = 22
        TagName = 'I_CFOP'
        CT_NumFields = 0
        CT_RetField1 = 0
        CT_RetField2 = 0
        CT_Test = False
        CT_ConsTab = False
        CT_Search = False
        MaxLength = 10
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
    object cxGroupBox1: TcxGroupBox
      Left = 4
      Top = 3
      Caption = 'Informa'#231#245'es da NF-e'
      TabOrder = 12
      Height = 67
      Width = 900
      object rsSuperEdit2: TrsSuperEdit
        Tag = -1
        Left = 10
        Top = 32
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
      object rsSuperEdit3: TrsSuperEdit
        Left = 152
        Top = 32
        Width = 121
        Height = 21
        CT_NumFields = 0
        CT_RetField1 = 0
        CT_RetField2 = 0
        CT_Test = False
        CT_ConsTab = False
        CT_Search = False
        TabOrder = 1
      end
      object rsSuperEdit5: TrsSuperEdit
        Left = 336
        Top = 32
        Width = 121
        Height = 21
        CT_NumFields = 0
        CT_RetField1 = 0
        CT_RetField2 = 0
        CT_Test = False
        CT_ConsTab = False
        CT_Search = False
        TabOrder = 2
      end
    end
  end
end
