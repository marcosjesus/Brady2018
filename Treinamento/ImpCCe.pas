unit ImpCCe;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, jpeg, DB, DBTables, QRPDFFilt, DBClient, Provider,
  FMTBcd, SqlExpr;

type
  TFrmImpCCe = class(TForm)
    QuickRep: TQuickRep;
    TitleBand1: TQRBand;
    QRLabel36: TQRLabel;
    QRImage2: TQRImage;
    qrlRazao: TQRLabel;
    qrlEndereco: TQRLabel;
    qrlFone: TQRLabel;
    qrlCep: TQRLabel;
    qrlCNPJ: TQRLabel;
    qryDados: TSQLQuery;
    QRGroup1: TQRGroup;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText38: TQRDBText;
    QRShape26: TQRShape;
    QRLabel26: TQRLabel;
    QRDBText25: TQRDBText;
    QRShape27: TQRShape;
    DetailBand1: TQRBand;
    QRDBText17: TQRDBText;
    QRSysData2: TQRSysData;
    QRLabel27: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel33: TQRLabel;
    QRPDFFilter: TQRPDFFilter;
    qryFilial: TSQLQuery;
    QRDBText34: TQRDBText;
    dspFilial: TDataSetProvider;
    cdsFilial: TClientDataSet;
    dspDados: TDataSetProvider;
    cdsDados: TClientDataSet;
    cdsFilialRazao: TStringField;
    cdsFilialCGC: TStringField;
    cdsFilialInscricao: TStringField;
    cdsFilialEndereco: TStringField;
    cdsFilialEndNum: TStringField;
    cdsFilialComplemento: TStringField;
    cdsFilialBairro: TStringField;
    cdsFilialCidade: TStringField;
    cdsFilialEstado: TStringField;
    cdsFilialCep: TStringField;
    cdsFilialNumero1: TStringField;
    cdsFilialLogo: TStringField;
    QRShape17: TQRShape;
    cdsDadosNumNF: TStringField;
    cdsDadosCodFilial: TStringField;
    cdsDadosRazao: TStringField;
    cdsDadosCartaSeq: TIntegerField;
    cdsDadosTexto_Correcao: TStringField;
    cdsDadosNumero_Protocolo: TStringField;
    cdsDadosDescStatus_Resposta: TStringField;
    cdsDadosCod_Status: TStringField;
    cdsDadosData_Registro: TSQLTimeStampField;
    cdsDadosNumero_Lote: TIntegerField;
    cdsDadosDtRecibo: TSQLTimeStampField;
    cdsDadosChave_Nfe: TStringField;
    QRDBText6: TQRDBText;
    QRLabel7: TQRLabel;
    cdsDadosDtInclusao: TSQLTimeStampField;
    ChildBand1: TQRChildBand;
    QRShape2: TQRShape;
    QRLabel3: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel4: TQRLabel;
    QRShape3: TQRShape;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    CodNF : String;
    CodFilial    : String;
  end;

var
  FrmImpCCe: TFrmImpCCe;

implementation

uses DBConect;

{$R *.DFM}

procedure TFrmImpCCe.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  cdsFilial.Close;
  qryFilial.Sql.Clear;
  qryFilial.Sql.Add('Select Razao, CGC, Inscricao, Endereco, EndNum, Complemento, Bairro, Cidade, Estado, Cep, Numero1, Logo ') ;
  qryFilial.Sql.Add('From Filial ') ;
  qryFilial.Sql.Add('Where CodFilial = ' + QuotedStr(CodFilial) ) ;
  cdsFilial.Open;

  qrlRazao.Caption    := cdsFilial.FieldByName('Razao').AsString;
  qrlEndereco.Caption := cdsFilial.FieldByName('Endereco').AsString + ', ' + cdsFilial.FieldByName('EndNum').AsString + ' ' + cdsFilial.FieldByName('Complemento').AsString;
  qrlCep.Caption      := 'CEP...: ' + cdsFilial.FieldByName('CEP').AsString + ' - ' + cdsFilial.FieldByName('Cidade').AsString + ' - ' + cdsFilial.FieldByName('Estado').AsString;
  qrlFone.Caption     := 'Tel.....: ' + cdsFilial.FieldByName('Numero1').AsString;
  qrlCNPJ.Caption     := 'CNPJ.: ' + cdsFilial.FieldByName('CGC').AsString;
  try
    if FileExists(cdsFilial.FieldByName('Logo').AsString) then
    begin
      QRImage2.Picture.LoadFromFile(cdsFilial.FieldByName('Logo').AsString);
      QRImage2.Repaint;
    end
    else
      QRImage2.Picture := nil;
  Except

  end;

  cdsDados.Close;
  qryDados.Sql.Clear;
  qryDados.Sql.Add(' SELECT		 n.DtRecibo, n.Chave_Nfe, n.NumNF, n.CodFilial, l.Razao, c.CartaSeq, c.DtInclusao, ' );
  qryDados.Sql.Add(' 				c.Texto_Correcao, c.Numero_Protocolo, c.DescStatus_Resposta, c.Cod_Status, c.Data_Registro, c.Numero_Lote ' );
  qryDados.Sql.Add(' FROM     NFe AS n INNER JOIN ' );
  qryDados.Sql.Add('                Clientes AS l ON n.CodCliente = l.CodCliente INNER JOIN ' );
  qryDados.Sql.Add('                NFeCarta AS c ON n.NumNF = c.NumNF AND n.CodFilial = c.CodFilial ' );
  qryDados.Sql.Add(' Where n.NumNF = :NumNF and n.CodFilial = :CodFilial ' );
  qryDados.Sql.Add(' ORDER BY c.CartaSeq desc ' );
  qryDados.ParamByName('NumNF').AsString       := CodNF;
  qryDados.ParamByName('CodFilial').AsString   := CodFilial;
  cdsDados.Open;


end;

procedure TFrmImpCCe.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cdsFilial.Close;
  cdsDados.Close;
end;

end.
