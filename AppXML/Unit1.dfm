object Form1: TForm1
  Left = 367
  Top = 124
  Width = 722
  Height = 589
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dxRibbon1: TdxRibbon
    Left = 0
    Top = 0
    Width = 706
    Height = 159
    ApplicationButton.Menu = dxRibbonBackstageView1
    BarManager = dxBarManager1
    ColorSchemeName = 'Blue'
    QuickAccessToolbar.Toolbar = dxBarManager1Bar1
    Contexts = <>
    TabOrder = 4
    TabStop = False
    object dxRibbon1Tab1: TdxRibbonTab
      Active = True
      Caption = 'dxRibbon1Tab1'
      Groups = <
        item
          ToolbarName = 'dxBarManager1Bar2'
        end>
      Index = 0
    end
  end
  object dxRibbonBackstageView1: TdxRibbonBackstageView
    Left = 104
    Top = 176
    Width = 450
    Height = 300
    Buttons = <>
    Ribbon = dxRibbon1
  end
  object dxBarManager1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 640
    Top = 320
    DockControlHeights = (
      0
      0
      0
      0)
    object dxBarManager1Bar1: TdxBar
      Caption = 'Custom 1'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 317
      FloatTop = 124
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarManager1Bar2: TdxBar
      Caption = 'Custom 2'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 317
      FloatTop = 124
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
  end
end
