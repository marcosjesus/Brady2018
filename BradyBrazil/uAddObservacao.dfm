object Fr_AddObservacao: TFr_AddObservacao
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Hora a Hora'
  ClientHeight = 268
  ClientWidth = 524
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  Touch.InteractiveGestureOptions = [igoPanSingleFingerHorizontal, igoPanInertia, igoParentPassthrough]
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 25
  object MemoObservacao: TMemo
    Left = 0
    Top = 0
    Width = 524
    Height = 268
    Align = alClient
    BevelKind = bkSoft
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    WantReturns = False
  end
end
