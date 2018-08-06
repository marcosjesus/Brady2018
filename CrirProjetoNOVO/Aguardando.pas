unit Aguardando;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, cxGroupBox, ComCtrls;

type
  TFrmAguardando = class(TForm)
    cxGroupBox1: TcxGroupBox;
    LbInfo: TLabel;
    lblProgresso: TLabel;
    procedure FormActivate(Sender: TObject);
  end;

var
  FrmAguardando: TFrmAguardando;

implementation

{$R *.dfm}

procedure TFrmAguardando.FormActivate(Sender: TObject);
begin
  Application.ProcessMessages;
end;

end.
