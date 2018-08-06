unit EtiquetasInkjet2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FrmRlBs, Db, DBTables, Qrctrls, QuickRpt, ExtCtrls;

type
  TFrmEtiquetasInkJet2 = class(TForm)
    QuickRep: TQuickRep;
    qryDados: TQuery;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    qrlnome: TQRLabel;
    qrlNome_3: TQRLabel;
    qrlEndereco: TQRLabel;
    qrlCidade: TQRLabel;
    qrlCep: TQRLabel;
    qrlEstado: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public

  end;

var
  FrmEtiquetasInkJet2: TFrmEtiquetasInkJet2;

implementation


{$R *.DFM}


procedure TFrmEtiquetasInkJet2.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlNome.Caption     := qryDados.FieldByName('Nome').AsString;
  qrlNome_3.Caption   := qryDados.FieldByName('Responsavel').AsString;
  qrlEndereco.Caption := qryDados.FieldByName('EnderecoCob').AsString;
  qrlCidade.Caption   := qryDados.FieldByName('CidadeCob').AsString;
  qrlEstado.Caption   := qryDados.FieldByName('EstadoCob').AsString;
  qrlCep.Caption      := qryDados.FieldByName('CepCob').AsString;
  qryDados.Next;
end;

procedure TFrmEtiquetasInkJet2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryDados.Close;
end;

end.
