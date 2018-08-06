inherited frmVisualizarTexto: TfrmVisualizarTexto
  Caption = 'Visualizar'
  ClientHeight = 440
  ClientWidth = 654
  WindowState = wsMaximized
  ExplicitWidth = 670
  ExplicitHeight = 478
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanFundo: TPanel
    Width = 654
    Height = 440
    ExplicitWidth = 654
    ExplicitHeight = 440
    inherited PanTitulo: TPanel
      Width = 650
      ExplicitWidth = 650
      inherited ImaBarraSup: TImage
        Width = 646
        ExplicitWidth = 646
      end
    end
    inherited ToolBar: TToolBar
      Top = 380
      Width = 650
      ExplicitTop = 380
      ExplicitWidth = 650
      inherited ButEscape: TcxButton
        Visible = False
      end
      inherited ButImprimir: TcxButton
        Visible = False
      end
    end
    inherited StatusBar: TdxStatusBar
      Top = 418
      Width = 650
      ExplicitTop = 418
      ExplicitWidth = 650
    end
    object mmVisualizar: TMemo
      Left = 2
      Top = 37
      Width = 650
      Height = 343
      Align = alClient
      ReadOnly = True
      TabOrder = 3
      ExplicitTop = 97
    end
    object pnTitulo: TPanel
      Left = 2
      Top = 4
      Width = 650
      Height = 33
      Align = alTop
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 4
      ExplicitTop = 10
    end
  end
end
