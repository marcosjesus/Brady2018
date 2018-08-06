unit uImpParticipante;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FrmPrBs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinsdxStatusBarPainter, Vcl.Menus, Vcl.StdCtrls, cxButtons, dxStatusBar,
  Vcl.Mask, rsEdit, RseditDB, Vcl.ExtCtrls;

type
  TfrmImpParticipante = class(TParamBase)
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImpParticipante: TfrmImpParticipante;

implementation

{$R *.dfm}

procedure TfrmImpParticipante.FormShow(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;
end;

end.
