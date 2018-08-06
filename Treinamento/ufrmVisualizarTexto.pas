unit ufrmVisualizarTexto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FGrid, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  cxControls, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinsdxStatusBarPainter, FMTBcd, StdCtrls, DBClient,
  Provider, ExtCtrls, DB, SqlExpr, dxStatusBar, cxButtons, ToolWin, ComCtrls,
  jpeg;

type
  TfrmVisualizarTexto = class(TFrmGrid)
    mmVisualizar: TMemo;
    pnTitulo: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVisualizarTexto: TfrmVisualizarTexto;

implementation

{$R *.dfm}

end.
