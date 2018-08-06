unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsdxBarPainter, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxRibbonSkins,
  dxSkinsdxRibbonPainter, dxBar, dxRibbonBackstageView, cxClasses, dxRibbon,
  StdCtrls;

const
  UM_SHOWBACKSTAGE = WM_USER +1001;

type
  TForm1 = class(TForm)
    dxBarManager1: TdxBarManager;
    dxRibbon1Tab1: TdxRibbonTab;
    dxRibbon1: TdxRibbon;
    dxRibbonBackstageView1: TdxRibbonBackstageView;
    dxBarManager1Bar1: TdxBar;
    dxBarManager1Bar2: TdxBar;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure UmShowBackstage(var Message: TMessage); message UM_SHOWBACKSTAGE;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormShow(Sender: TObject);
begin
  PostMessage(Handle, UM_SHOWBACKSTAGE, Integer(Sender), 0);
end;

procedure TForm1.UmShowBackstage(var Message: TMessage);
begin
  dxRibbon1.ApplicationMenuPopup;
end;

end.
