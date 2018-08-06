unit uImportador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ACBrBase, ACBrDFe, ACBrCTe, ACBrNFe, pcnConversao, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters,  cxControls, cxCustomData, cxStyles, cxTL,
  cxTextEdit, cxTLdxBarBuiltInMenu, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, FMTBcd, DB, SqlExpr, cxInplaceContainer,
  StdCtrls, cxButtons, Mask, ExtCtrls,  Menus, SQLTimST, EditBusca, Global, pcteConversaoCTe,
  pcteCTe, cxContainer, cxEdit, cxLabel, cxGroupBox, cxRadioGroup, xmldom,
  XMLIntf, msxmldom, XMLDoc, Funcoes, dxSkinscxPCPainter, cxPC, IOUtils,
  pcnNFe, Buttons, StrFun, cxSSheet, dxBarBuiltInMenu;

Type
   TTipoRetorno = record
      trCodigo           : String;
      trCodPlanoContatil : String;
      trCodCentroCusto   : String;
      trRegimeICMS       : String;
      procedure Inicializar;
   end;

Type
  TTipoProduto = record
     trCodProdInterno : String;
     trCodGrupo       : String;
     procedure Inicializar;
  end;

type
  TfrmImportador = class(TForm)
    pnlTop: TPanel;
    Panel13: TPanel;
    btnLocalizar: TcxButton;
    Panel2: TPanel;
    lblLocal: TLabel;
    Panel1: TPanel;
    btnImportar: TcxButton;
    ButSair: TcxButton;
    qryInsert: TSQLQuery;
    qryAux: TSQLQuery;
    btnLog: TcxButton;
    ButCancelar: TcxButton;
    XMLDocument: TXMLDocument;
    Page: TcxPageControl;
    TabGrid: TcxTabSheet;
    TabLog: TcxTabSheet;
    tlNFe: TcxTreeList;
    cxTreeList1Column1: TcxTreeListColumn;
    cxTreeList1Column2: TcxTreeListColumn;
    cxTreeList1Column3: TcxTreeListColumn;
    cxTreeList1Column4: TcxTreeListColumn;
    cxTreeList1Column5: TcxTreeListColumn;
    cxTreeList1Column6: TcxTreeListColumn;
    mmVisualizar: TMemo;
    pnTitulo: TPanel;
    cxGroupBox1: TcxGroupBox;
    lblTotalReg: TLabel;
    lblTotalImp: TLabel;
    lstArquivos: TListBox;
    Splitter1: TSplitter;
    cxGroupBox2: TcxGroupBox;
    OpenDialog: TOpenDialog;
    edtCaminho: TEdit;
    btnCaminho: TBitBtn;
    BitBtn1: TBitBtn;
    ACBrNFe: TACBrNFe;
    ACBrCTe: TACBrCTe;
    procedure btnLocalizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButSairClick(Sender: TObject);
    procedure btnImportarClick(Sender: TObject);
    procedure ButCancelarClick(Sender: TObject);
    procedure btnLogClick(Sender: TObject);
    procedure PageChange(Sender: TObject);
    procedure lstArquivosClick(Sender: TObject);
    procedure btnCaminhoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    tpRetornoDestinatario    : TTipoRetorno;
    tpRetornoEmitente        : TTipoRetorno;

    tpProduto         : TTipoProduto;
    infEvento, retEvento, subinfEvento, _subinfEvento : IXMLNode;
    lPathImportados : string;
    lPathSemProtocolo : string;
    lPathExistente : string;
    lArquivoImportado: string;
    lPath        : string;

    function AtualizaNaturezaOperacao(CFOP, CNPJ: string): String;

    procedure RetornarCodigoDestinatarioCTE(Destinatario: pcteCTe.TDest;
      NumeroNF: String);
    procedure RetornarCodigoDestinatarioNFE(Destinatario: pcnNFe.TDest;
      NumeroNF: String);
    procedure RetornarCodigoFornecedorCTE(Emitente: pcteCTe.TEmit;
      NumeroNF: String);
    procedure RetornarCodigoFornecedorNFE(Emitente: pcnNFe.TEmit;
      NumeroNF: String);
    function CriarPastadoCliente(pTipo, pArquivo: String): String;

  public
    { Public declarations }
  end;

var
  frmImportador: TfrmImportador;

implementation

uses DBConect, SetParametro, MensFun, ufrmDialogDir;


{$R *.dfm}

const
  cPASTA_ARQUIVOS_IMPORTADOS   = 'IMPORTADAS';
  cPASTA_ARQUIVOS_SEMPROTOLOCO = 'SEMPROTOCOLO';
  cPASTA_ARQUIVOS_EXISTENTE    = 'EXISTENTE';
  cPASTA_ARQUIVOS_LOG          = 'LOG';
  cPasta_ARQUIVOS_ENTRADA      = 'ENTRADA';
  cPasta_ARQUIVOS_SAIDA        = 'SAIDA';

(*
--Leandro 24/08/2012
--Fix/Solu��o tempor�ria para falha do DirectoryExists()
--http://qc.embarcadero.com/wc/qcmain.aspx?d=92183
*)
function DirExists( const Directory: string ): boolean;
var
  Code: Integer;
begin
  Code := GetFileAttributes(PChar(Directory));
  Result := (Code <> -1) and (FILE_ATTRIBUTE_DIRECTORY and Code <> 0);
end;


{ TTipoRetorno }

procedure TTipoRetorno.Inicializar;
begin
   trCodigo           := '';
   trCodPlanoContatil := '';
   trCodCentroCusto   := '';
   trRegimeICMS       := '';
end;

{ TTipoProduto }

procedure TTipoProduto.Inicializar;
begin
   trCodProdInterno := '';
   trCodGrupo := '';
end;







procedure TfrmImportador.BitBtn1Click(Sender: TObject);
begin
  edtCaminho.Clear;
end;

procedure TfrmImportador.btnCaminhoClick(Sender: TObject);
begin
 edtCaminho.Text :=  DialogDir('Selecionar Pasta','C:')
end;

procedure TfrmImportador.btnImportarClick(Sender: TObject);
var
  i, J, D, T      : integer;
  lSQL            : string;
  lArquivo        : string;
  pCodFilial      : String;
  bCancelar       : Boolean;
  bTemParcela     : Boolean;
  IDENTITY_ID     : Integer;
  IDENTITY_CTE_CAPA_ID : Integer;
  bLog            : Boolean;
  varFilialID     : String;
  infEvento, retEvento, subinfEvento, _subinfEvento : IXMLNode;
  OrigemDaNota    : String;
  pNovoCFOP       : String;
begin

   if tlNFe.Count = 0 Then
   begin
      Mens_MensInf('Grade de documentos vazia.');
      Exit;
   end;

   try
        AguardandoProcesso(frmImportador, true, 'Importando XML');
        bLog      := False;
        bCancelar := False;

       try
           for i := 0 to tlNFe.Count -1 do
           begin
               lArquivo          := tlNFe.Items[i].Values[4];
               lArquivoImportado := 'C:\MLSISTEMAS_LIDOS\'  + StrTran(ExtractFilePath(tlNFe.Items[i].Values[4]), PastaRAIZ, '');

               if not DirExists(  lArquivoImportado ) then
               begin
                 if not ForceDirectories(  lArquivoImportado ) then
                   Exit;
               end;

               lArquivoImportado := lArquivoImportado  + ExtractFileName(lArquivo);

               if tlNFe.Items[i].Values[5] <> 'Importar' then
               begin
                 if FileExists(PWideChar( lArquivo )) then
                    DeleteFile(PWideChar( lArquivo ));
                 Continue;
               end;

               ACBrNFe.NotasFiscais.Clear;
               ACBrCTe.Conhecimentos.Clear;
               XMLDocument.XML.Clear;

               if ACBrCTe.Conhecimentos.LoadFromFile( lArquivo ) Then
               begin

                   GCambio.BeginTrans;

                   with ACBrCTe.Conhecimentos.Items[0].CTe do
                   begin

                    lSQL := ' INSERT INTO CTE_PROTOCOLO (';
                    lSQL := lSQL + ' ID,  ';
                    lSQL := lSQL + ' tpAmb, ';
                    lSQL := lSQL + ' verAplic, ';
                    lSQL := lSQL + ' chCTe, ';
                    lSQL := lSQL + ' dhRecbto, ';
                    lSQL := lSQL + ' nProt,  ';
                    lSQL := lSQL + ' digVal, ';
                    lSQL := lSQL + ' cStat, ';
                    lSQL := lSQL + ' xMotivo, ';
                    lSQL := lSQL + ' nCT, ';
                    lSQL := lSQL + ' cCT ';
                    lSQL := lSQL + ' ) VALUES  ( ';
                    lSQL := lSQL + ' :ID,  ';
                    lSQL := lSQL + ' :tpAmb, ';
                    lSQL := lSQL + ' :verAplic, ';
                    lSQL := lSQL + ' :chCTe, ';
                    lSQL := lSQL + ' :dhRecbto, ';
                    lSQL := lSQL + ' :nProt,  ';
                    lSQL := lSQL + ' :digVal, ';
                    lSQL := lSQL + ' :cStat, ';
                    lSQL := lSQL + ' :xMotivo, ';
                    lSQL := lSQL + ' :nCT, ';
                    lSQL := lSQL + ' :cCT) ';


                    qryInsert.Close;
                    qryInsert.SQL.Clear;
                    qryInsert.SQL.Add( lSQL );


                    qryInsert.ParamByName('ID').AsString                        := infCTe.ID;
                    qryInsert.ParamByName('tpAmb').AsString                     := TpAmbToStr(procCTe.tpAmb);
                    qryInsert.ParamByName('verAplic').AsString                  := procCTe.verAplic;
                    qryInsert.ParamByName('chCTe').AsString                     := procCTe.chCTe;
                    qryInsert.ParamByName('dhRecbto').AsSQLTimeStamp            := DateTimeToSQLTimeStamp(procCTe.dhRecbto);
                    qryInsert.ParamByName('nProt').AsString                     := procCTe.nProt;
                    qryInsert.ParamByName('digVal').AsString                    := procCTe.digVal;
                    qryInsert.ParamByName('cStat').AsString                     := IntToStr(procCTe.cStat);
                    qryInsert.ParamByName('xMotivo').AsString                   := procCTe.xMotivo;
                    qryInsert.ParamByName('nCT').AsString                       := IntToStr(ide.nCT);
                    qryInsert.ParamByName('cCT').AsInteger                      := ide.cCT;
                    try
                      qryInsert.ExecSQL;

                    except
                      On E:Exception do
                        begin
              //            DB_Conect.GetComando(qryInsert, frmImportarNFeEntrada, False);
                          GCambio.ExecRollBack;

                          bLog := True;
                          DB_Conect.doSaveLogImport(PastaLOG, pChar(lArquivo)  + ' - Falha ao incluir CTE_PROTOCOLO.' + E.Message);
                          Continue;
                        end;
                    end;

                    QryAux.Close;
                    QryAux.SQL.Clear;
                    QryAux.SQL.Add('Select CTE_FILIAL_ID from cte_filial where cnpj = :cnpj');
                    QryAux.ParamByName('cnpj').AsString := Emit.CNPJ;
                    QryAux.Open;

                    if qryAux.IsEmpty then
                    begin
                          QryAux.Close;
                          QryAux.SQL.Clear;
                          QryAux.SQL.Add('Select CTE_FILIAL_ID from cte_filial where cnpj = :cnpj');
                          QryAux.ParamByName('cnpj').AsString := dest.CNPJCPF;
                          QryAux.Open;
                          if qryAux.IsEmpty then
                          begin
                            GCambio.ExecRollBack;
                            bLog := True;
                            DB_Conect.doSaveLogImport(PastaLOG, pChar(lArquivo)  + ' - NF Entrada - Filial N�o Cadastrada');
                            Continue;
                          end;
                    end;

                    varFilialID :=  QryAux.FieldByName('CTE_FILIAL_ID').AsString;

                    lSQL := ' INSERT INTO CTE_CAPA (';
                    lSQL := lSQL + ' CTE_FILIAL_ID ';
                    lSQL := lSQL + ' ,cUF ';
                    lSQL := lSQL + ' ,cCT';
                    lSQL := lSQL + ' ,CFOP';
                    lSQL := lSQL + ' ,natOp';
                    lSQL := lSQL + ' ,forPag';
                    lSQL := lSQL + ' ,mod_';
                    lSQL := lSQL + ' ,serie';
                    lSQL := lSQL + ' ,nCT';
                    lSQL := lSQL + ' ,dhEmi';
                    lSQL := lSQL + ' ,tpImp';
                    lSQL := lSQL + ' ,tpEmis';
                    lSQL := lSQL + ' ,cDV';
                    lSQL := lSQL + ' ,tpAmb';
                    lSQL := lSQL + ' ,tpCTe';
                    lSQL := lSQL + ' ,procEmi';
                    lSQL := lSQL + ' ,verProc';
                    lSQL := lSQL + ' ,cMunEnv';
                    lSQL := lSQL + ' ,xMunEnv';
                    lSQL := lSQL + ' ,UFEnv';
                    lSQL := lSQL + ' ,modal';
                    lSQL := lSQL + ' ,tpServ';
                    lSQL := lSQL + ' ,cMunIni';
                    lSQL := lSQL + ' ,xMunIni';
                    lSQL := lSQL + ' ,UFIni';
                    lSQL := lSQL + ' ,cMunFim';
                    lSQL := lSQL + ' ,xMunFim';
                    lSQL := lSQL + ' ,UFFim';
                    lSQL := lSQL + ' ,retira';
                    lSQL := lSQL + ' ,toma03';
                    lSQL := lSQL + ' ,xCaracAd';
                    lSQL := lSQL + ' ,xCaracSer';
                    lSQL := lSQL + ' ,xEmi';
                    lSQL := lSQL + ' ,xOrig';
                    lSQL := lSQL + ' ,xDest';
                    lSQL := lSQL + ' ,tpPer';
                    lSQL := lSQL + ' ,dProg';
                    lSQL := lSQL + ' ,tpHor';
                    lSQL := lSQL + ' ,hProg';
                    lSQL := lSQL + ' ,xObs)';
                    lSQL := lSQL + ' VALUES ';
                    lSQL := lSQL + ' ( :CTE_FILIAL_ID,';
                    lSQL := lSQL + '  :cUF,';
                    lSQL := lSQL + '  :cCT, ';
                    lSQL := lSQL + '  :CFOP, ';
                    lSQL := lSQL + '  :natOp, ';
                    lSQL := lSQL + '  :forPag, ';
                    lSQL := lSQL + '  :mod_, ';
                    lSQL := lSQL + '  :serie, ';
                    lSQL := lSQL + '  :nCT, ';
                    lSQL := lSQL + '  :dhEmi, ';
                    lSQL := lSQL + '  :tpImp, ';
                    lSQL := lSQL + '  :tpEmis, ';
                    lSQL := lSQL + '  :cDV, ';
                    lSQL := lSQL + '  :tpAmb, ';
                    lSQL := lSQL + '  :tpCTe, ';
                    lSQL := lSQL + '  :procEmi, ';
                    lSQL := lSQL + '  :verProc, ';
                    lSQL := lSQL + '  :cMunEnv, ';
                    lSQL := lSQL + '  :xMunEnv,';
                    lSQL := lSQL + '  :UFEnv, ';
                    lSQL := lSQL + '  :modal, ';
                    lSQL := lSQL + '  :tpServ, ';
                    lSQL := lSQL + '  :cMunIni, ';
                    lSQL := lSQL + '  :xMunIni, ';
                    lSQL := lSQL + '  :UFIni, ';
                    lSQL := lSQL + '  :cMunFim, ';
                    lSQL := lSQL + '  :xMunFim, ';
                    lSQL := lSQL + '  :UFFim, ';
                    lSQL := lSQL + '  :retira, ';
                    lSQL := lSQL + '  :toma03, ';
                    lSQL := lSQL + '  :xCaracAd, ';
                    lSQL := lSQL + '  :xCaracSer, ';
                    lSQL := lSQL + '  :xEmi, ';
                    lSQL := lSQL + '  :xOrig, ';
                    lSQL := lSQL + '  :xDest, ';
                    lSQL := lSQL + '  :tpPer, ';
                    lSQL := lSQL + '  :dProg, ';
                    lSQL := lSQL + '  :tpHor, ';
                    lSQL := lSQL + '  :hProg, ';
                    lSQL := lSQL + '  :xObs) ';

                    qryInsert.Close;
                    qryInsert.SQL.Clear;
                    qryInsert.SQL.Add( lSQL );

                    qryInsert.ParamByName('CTE_FILIAL_ID').AsString           := varFilialID;
                    qryInsert.ParamByName('cUF').AsString                     := IntToStr(Ide.cUF);
                    qryInsert.ParamByName('cCT').AsInteger                    := ide.cCT;
                    qryInsert.ParamByName('CFOP').AsString                    := IntToStr(ide.CFOP);
                    qryInsert.ParamByName('natOp').AsString                   := ide.natOp;
                    qryInsert.ParamByName('forPag').AsString                  := tpforPagToStr(ide.forPag);
                    qryInsert.ParamByName('mod_').AsString                    := IntToStr(ide.modelo);
                    qryInsert.ParamByName('serie').AsString                   := IntToStr(ide.serie);
                    qryInsert.ParamByName('nCT').AsString                     := IntToStr(ide.nCT);
                    qryInsert.ParamByName('dhEmi').AsSQLTimeStamp             := DateTimeToSQLTimeStamp(ide.dhEmi);
                    qryInsert.ParamByName('tpImp').AsString                   := TpImpToStr(ide.tpImp);
                    qryInsert.ParamByName('tpEmis').AsString                  := TpEmisToStr(ide.tpEmis);
                    qryInsert.ParamByName('cDV').AsString                     := IntToStr(ide.cDV);
                    qryInsert.ParamByName('tpAmb').AsString                   := TpAmbToStr(ide.tpAmb);
                    qryInsert.ParamByName('tpCTe').AsString                   := tpCTToStr(ide.tpCTe);
                    qryInsert.ParamByName('procEmi').AsString                 := procEmiToStr(ide.procEmi);
                    qryInsert.ParamByName('verProc').AsString                 := ide.verProc;
                    qryInsert.ParamByName('cMunEnv').AsString                 := InTToStr(ide.cMunEnv);
                    qryInsert.ParamByName('xMunEnv').AsString                 := ide.xMunEnv;
                    qryInsert.ParamByName('UFEnv').AsString                   := ide.UFEnv;
                    qryInsert.ParamByName('modal').AsString                   := TpModalToStr(ide.modal);
                    qryInsert.ParamByName('tpServ').AsString                  := TpServPagToStr(ide.tpServ);
                    qryInsert.ParamByName('cMunIni').AsInteger                := ide.cMunIni;
                    qryInsert.ParamByName('xMunIni').AsString                 := ide.xMunIni;
                    qryInsert.ParamByName('UFIni').AsString                   := ide.UFIni;
                    qryInsert.ParamByName('cMunFim').AsInteger                := ide.cMunFim;
                    qryInsert.ParamByName('xMunFim').AsString                 := ide.xMunFim;
                    qryInsert.ParamByName('UFFim').AsString                   := ide.UFFim;
                    qryInsert.ParamByName('retira').AsString                  := TpRetiraPagToStr(ide.retira);
                    qryInsert.ParamByName('toma03').AsString                  := TpTomadorToStr(ide.toma03.Toma);
                    qryInsert.ParamByName('xCaracAd').AsString                := compl.xCaracAd ;
                    qryInsert.ParamByName('xCaracSer').AsString               := compl.xCaracSer;
                    qryInsert.ParamByName('xEmi').AsString                    := compl.xEmi;
                    qryInsert.ParamByName('xOrig').AsString                   := compl.fluxo.xOrig;
                    qryInsert.ParamByName('xDest').AsString                   := compl.fluxo.xDest;
                    qryInsert.ParamByName('tpPer').AsString                   := TpDataPeriodoToStr(compl.Entrega.comData.tpPer);
                    qryInsert.ParamByName('dProg').AsSQLTimeStamp             := DateTimeToSQLTimeStamp(compl.Entrega.comData.dProg);
                    qryInsert.ParamByName('tpHor').AsString                   := TpHorarioIntervaloToStr(compl.Entrega.comHora.tpHor);
                    qryInsert.ParamByName('hProg').AsSQLTimeStamp             := DateTimeToSQLTimeStamp(compl.Entrega.comHora.hProg);
                    qryInsert.ParamByName('xObs').AsString                    := compl.xObs;


                    try
                      qryInsert.ExecSQL;

                    except
                      On E:Exception do
                        begin
              //            DB_Conect.GetComando(qryInsert, frmImportarNFeEntrada, False);
                          GCambio.ExecRollBack;

                          bLog := True;
                          DB_Conect.doSaveLogImport(PastaLOG, pChar(lArquivo) + #13#10 + 'Falha ao incluir CTE_CAPA.' + E.Message);
                          Continue;
                        end;
                    end;



                    Try
                      IDENTITY_CTE_CAPA_ID := 0;
                      lSQL  := 'SELECT @@IDENTITY as CTE_CAPA_ID ';

                      qryInsert.Close;
                      qryInsert.SQL.Clear;
                      qryInsert.SQL.Add( lSQL );
                      qryInsert.Open;
                      IDENTITY_CTE_CAPA_ID := qryInsert.FieldByName('CTE_CAPA_ID').AsInteger;

                    except
                      On E:Exception do
                        begin
                         //  DB_Conect.SQLConnection.RollBack;
                           bLog := True;
                           DB_Conect.doSaveLogImport(PastaLOG, DB_Conect.GetComando(qryInsert) + #13#10 + 'Falha ao pegar chave da CTE_CAPA_ID.' + E.Message);
                           Continue;
                         end;
                    end;

                    lSQL := ' INSERT INTO [dbo].[CTE_OBSCONT]( ';
                    lSQL := lSQL + ' cCT ';
                    lSQL := lSQL + ' ,CTE_CAPA_ID ';
                    lSQL := lSQL + ',xCampo';
                    lSQL := lSQL + ',xTexto)';
                    lSQL := lSQL + ' Values (';
                    lSQL := lSQL + ' :cCT ';
                    lSQL := lSQL + ' ,:CTE_CAPA_ID ';
                    lSQL := lSQL + ',:xCampo';
                    lSQL := lSQL + ',:xTexto)';

                    qryInsert.Close;
                    qryInsert.SQL.Clear;
                    qryInsert.SQL.Add( lSQL );

                    for T := 0 to compl.ObsCont.Count-1 do
                    begin
                      with compl.ObsCont[T] do
                      begin
                         qryInsert.ParamByName('cCT').AsInteger                    := ide.cCT;
                         qryInsert.ParamByName('CTE_CAPA_ID').AsInteger            := IDENTITY_CTE_CAPA_ID;
                         qryInsert.ParamByName('xCampo').AsString                  := compl.ObsCont[T].xCampo;
                         qryInsert.ParamByName('xTexto').AsString                  := compl.ObsCont[T].xTexto;
                      end;

                      try
                        qryInsert.ExecSQL;

                      except
                        On E:Exception do
                          begin
                            GCambio.ExecRollBack;

                            bLog := True;
                            DB_Conect.doSaveLogImport(PastaLOG, pChar(lArquivo) + #13#10 + 'Falha ao incluir CTE_OBSCONT.' + E.Message);
                            Continue;
                          end;
                      end;
                    end;


                    RetornarCodigoFornecedorCTE(  Emit,  IntToStr(ide.cCT));

                    RetornarCodigoDestinatarioCTE( Dest,  IntToStr(ide.cCT));
                    {

                    lSQL := ' INSERT INTO [dbo].[CTE_EMITENTE]( ';
                    lSQL := lSQL + ' cCT ';
                    lSQL := lSQL + ' ,CTE_CAPA_ID ';
                    lSQL := lSQL + ',CNPJCPF';
                    lSQL := lSQL + ',IE';
                    lSQL := lSQL + ',IEST';
                    lSQL := lSQL + ',xNome';
                    lSQL := lSQL + ',xFant';
                    lSQL := lSQL + ',Fone';
                    lSQL := lSQL + ',xCpl';
                    lSQL := lSQL + ',xLgr';
                    lSQL := lSQL + ',nro';
                    lSQL := lSQL + ',xBairro';
                    lSQL := lSQL + ',cMun';
                    lSQL := lSQL + ',xMun';
                    lSQL := lSQL + ',CEP';
                    lSQL := lSQL + ',UF)';
                    lSQL := lSQL + ' VALUES ( ' ;
                    lSQL := lSQL + ':cCT ';
                    lSQL := lSQL + ' ,:CTE_CAPA_ID ';
                    lSQL := lSQL +',:CNPJCPF ';
                    lSQL := lSQL +',:IE ';
                    lSQL := lSQL +',:IEST ';
                    lSQL := lSQL +',:xNome ';
                    lSQL := lSQL +',:xFant ';
                    lSQL := lSQL +',:Fone ';
                    lSQL := lSQL +',:xCpl ';
                    lSQL := lSQL +',:xLgr ';
                    lSQL := lSQL +',:nro ';
                    lSQL := lSQL +',:xBairro ';
                    lSQL := lSQL +',:cMun';
                    lSQL := lSQL +',:xMun';
                    lSQL := lSQL +',:CEP';
                    lSQL := lSQL +',:UF)';

                    qryInsert.Close;
                    qryInsert.SQL.Clear;
                    qryInsert.SQL.Add( lSQL );

                    qryInsert.ParamByName('cCT').AsInteger                    := ide.cCT;
                    qryInsert.ParamByName('CTE_CAPA_ID').AsInteger            := IDENTITY_CTE_CAPA_ID;
                    qryInsert.ParamByName('CNPJCPF').AsString                 := Emit.CNPJ;
                    qryInsert.ParamByName('IE').AsString                      := Emit.IE;
                    qryInsert.ParamByName('IEST').AsString                    := Emit.IEST;
                    qryInsert.ParamByName('xNome').AsString                   := Emit.xNome;
                    qryInsert.ParamByName('xFant').AsString                   := Emit.xFant;
                    qryInsert.ParamByName('Fone').AsString                    := Emit.EnderEmit.fone;
                    qryInsert.ParamByName('xCpl').AsString                    := Emit.EnderEmit.xCpl;
                    qryInsert.ParamByName('xLgr').AsString                    := Emit.EnderEmit.xLgr;
                    qryInsert.ParamByName('nro').AsString                     := Emit.EnderEmit.nro;
                    qryInsert.ParamByName('xBairro').AsString                 := Emit.EnderEmit.xBairro;
                    qryInsert.ParamByName('cMun').AsString                    := IntToStr(Emit.EnderEmit.cMun);
                    qryInsert.ParamByName('xMun').AsString                    := Emit.EnderEmit.xMun;

                    qryInsert.ParamByName('CEP').AsString                     := IntToStr(Emit.EnderEmit.CEP);
                    qryInsert.ParamByName('UF').AsString                      := Emit.EnderEmit.UF;

                    try
                      qryInsert.ExecSQL;

                    except
                      On E:Exception do
                        begin
              //            DB_Conect.GetComando(qryInsert, frmImportarNFeEntrada, False);
                          GCambio.ExecRollBack;

                          bLog := True;
                          DB_Conect.doSaveLogImport(PastaLOG, pChar(lArquivo) + #13#10 + 'Falha ao incluir CTE_EMITENTE.' + E.Message);
                          Continue;
                        end;
                    end;
                    }

                    lSQL := 'INSERT INTO [dbo].[CTE_INFCTESUB]  ';
                    lSQL := lSQL +'(cCT';
                    lSQL := lSQL + ' ,CTE_CAPA_ID ';
                    lSQL := lSQL +',CteChave';
                    lSQL := lSQL +',RefCteAnu';
                    lSQL := lSQL +',RefNfe';
                    lSQL := lSQL +',CNPJCPF';
                    lSQL := lSQL +',modelo';
                    lSQL := lSQL +',serie';
                    lSQL := lSQL +',subserie';
                    lSQL := lSQL +',numero';
                    lSQL := lSQL +',valor';
                    lSQL := lSQL +',dEmi)';
                    lSQL := lSQL +' VALUES (';
                    lSQL := lSQL +' :cCT';
                    lSQL := lSQL + ' ,:CTE_CAPA_ID ';
                    lSQL := lSQL +',:CteChave';
                    lSQL := lSQL +',:RefCteAnu';
                    lSQL := lSQL +',:RefNfe';
                    lSQL := lSQL +',:CNPJCPF';
                    lSQL := lSQL +',:modelo';
                    lSQL := lSQL +',:serie';
                    lSQL := lSQL +',:subserie';
                    lSQL := lSQL +',:numero';
                    lSQL := lSQL +',:valor';
                    lSQL := lSQL +',:dEmi)';

                    qryInsert.Close;
                    qryInsert.SQL.Clear;
                    qryInsert.SQL.Add( lSQL );

                    qryInsert.ParamByName('cCT').asInteger                     := ide.cCT;
                    qryInsert.ParamByName('CTE_CAPA_ID').AsInteger            := IDENTITY_CTE_CAPA_ID;
                    qryInsert.ParamByName('CteChave').asString                 := infCTeNorm.infCteSub.chCte;
                    qryInsert.ParamByName('RefCteAnu').asString                := infCTeNorm.infCteSub.refCteAnu;
                    qryInsert.ParamByName('RefNfe').asString                   := infCTeNorm.infCteSub.tomaICMS.refNFe;
                    qryInsert.ParamByName('CNPJCPF').asString                  := infCTeNorm.infCteSub.tomaICMS.refNF.CNPJCPF;
                    qryInsert.ParamByName('modelo').asString                   := infCTeNorm.infCteSub.tomaICMS.refNF.modelo;
                    qryInsert.ParamByName('serie').AsInteger                   := infCTeNorm.infCteSub.tomaICMS.refNF.serie;
                    qryInsert.ParamByName('subserie').AsInteger                := infCTeNorm.infCteSub.tomaICMS.refNF.subserie;
                    qryInsert.ParamByName('numero').AsInteger                  := infCTeNorm.infCteSub.tomaICMS.refNF.nro;
                    qryInsert.ParamByName('valor').AsFloat                     := infCTeNorm.infCteSub.tomaICMS.refNF.valor;
                    qryInsert.ParamByName('dEmi').AsSQLTimeStamp               := DateTimeToSQLTimeStamp(infCTeNorm.infCteSub.tomaICMS.refNF.dEmi);

                    try
                      qryInsert.ExecSQL;

                    except
                      On E:Exception do
                        begin
              //            DB_Conect.GetComando(qryInsert, frmImportarNFeEntrada, False);
                          GCambio.ExecRollBack;

                          bLog := True;
                          DB_Conect.doSaveLogImport(PastaLOG, pChar(lArquivo) + #13#10 + 'Falha ao incluir CTE_INFCTESUB.' + E.Message);
                          Continue;
                        end;
                    end;



                    lSQL := ' INSERT INTO [dbo].[CTE_INFServico]( ';
                    lSQL := lSQL + ' cCT ';
                    lSQL := lSQL + ' ,CTE_CAPA_ID ';
                    lSQL := lSQL + ' ,xDescServ ';
                    lSQL := lSQL + ' ,qCarga) ';
                    lSQL := lSQL + '  Values ( ';
                    lSQL := lSQL + ' :cCT ';
                    lSQL := lSQL + ' ,:CTE_CAPA_ID ';
                    lSQL := lSQL + ' ,:xDescServ ';
                    lSQL := lSQL + ' ,:qCarga) ';

                    qryInsert.Close;
                    qryInsert.SQL.Clear;
                    qryInsert.SQL.Add( lSQL );

                    qryInsert.ParamByName('cCT').asInteger                      := ide.cCT;
                    qryInsert.ParamByName('CTE_CAPA_ID').AsInteger              := IDENTITY_CTE_CAPA_ID;
                    qryInsert.ParamByName('xDescServ').asString                 := infCTeNorm.infServico.xDescServ;
                    qryInsert.ParamByName('qCarga').AsFloat                     := infCTeNorm.infServico.qCarga;

                    try
                      qryInsert.ExecSQL;

                    except
                      On E:Exception do
                        begin
              //            DB_Conect.GetComando(qryInsert, frmImportarNFeEntrada, False);
                          GCambio.ExecRollBack;

                          bLog := True;
                          DB_Conect.doSaveLogImport(PastaLOG, pChar(lArquivo) + #13#10 + 'Falha ao incluir CTE_INFServico.' + E.Message);
                          Continue;
                        end;
                    end;

                    {
                    lSQL := ' INSERT INTO [dbo].[CTE_Destinatario]( ';
                    lSQL := lSQL + ' cCT ';
                    lSQL := lSQL + ' ,CTE_CAPA_ID ';
                    lSQL := lSQL + ',CNPJ';
                    lSQL := lSQL + ',IE';
                 //   lSQL := lSQL + ',IEST';
                    lSQL := lSQL + ',xNome';
                //    lSQL := lSQL + ',xFant';
                 //   lSQL := lSQL + ',Fone';
                    lSQL := lSQL + ',xCpl';
                    lSQL := lSQL + ',xLgr';
                    lSQL := lSQL + ',nro';
                    lSQL := lSQL + ',xBairro';
                    lSQL := lSQL + ',cMun';
                    lSQL := lSQL + ',xMun';
                    lSQL := lSQL + ',CEP';
                    lSQL := lSQL + ',UF)';
                    lSQL := lSQL + ' VALUES ( ' ;
                    lSQL := lSQL + ':cCT ';
                    lSQL := lSQL + ' ,:CTE_CAPA_ID ';
                    lSQL := lSQL +',:CNPJ ';
                    lSQL := lSQL +',:IE ';
               //     lSQL := lSQL +',:IEST ';
                    lSQL := lSQL +',:xNome ';
             //       lSQL := lSQL +',:xFant ';
           //         lSQL := lSQL +',:Fone ';
                    lSQL := lSQL +',:xCpl ';
                    lSQL := lSQL +',:xLgr ';
                    lSQL := lSQL +',:nro ';
                    lSQL := lSQL +',:xBairro ';
                    lSQL := lSQL +',:cMun';
                    lSQL := lSQL +',:xMun';
                    lSQL := lSQL +',:CEP';
                    lSQL := lSQL +',:UF)';

                    qryInsert.Close;
                    qryInsert.SQL.Clear;
                    qryInsert.SQL.Add( lSQL );

                    qryInsert.ParamByName('cCT').AsInteger                    := ide.cCT;
                    qryInsert.ParamByName('CTE_CAPA_ID').AsInteger            := IDENTITY_CTE_CAPA_ID;
                    qryInsert.ParamByName('CNPJ').AsString                    := Dest.CNPJCPF;
                    qryInsert.ParamByName('IE').AsString                      := Dest.IE;
                   // qryInsert.ParamByName('IEST').AsString                    := Dest.IEST;
                    qryInsert.ParamByName('xNome').AsString                   := Dest.xNome;
         //           qryInsert.ParamByName('xFant').AsString                   := Dest.xFant;
         //           qryInsert.ParamByName('Fone').AsString                    := Dest.enderDest.fone;
                    qryInsert.ParamByName('xCpl').AsString                    := Dest.enderDest.xCpl;
                    qryInsert.ParamByName('xLgr').AsString                    := Dest.enderDest.xLgr;
                    qryInsert.ParamByName('nro').AsString                     := Dest.enderDest.nro;
                    qryInsert.ParamByName('xBairro').AsString                 := Dest.enderDest.xBairro;
                    qryInsert.ParamByName('cMun').AsString                    := IntToStr(Dest.enderDest.cMun);
                    qryInsert.ParamByName('xMun').AsString                    := Dest.enderDest.xMun;

                    qryInsert.ParamByName('CEP').AsString                     := IntToStr(Dest.enderDest.CEP);
                    qryInsert.ParamByName('UF').AsString                      := Dest.enderDest.UF;

                    try
                      qryInsert.ExecSQL;

                    except
                      On E:Exception do
                        begin
              //            DB_Conect.GetComando(qryInsert, frmImportarNFeEntrada, False);
                          GCambio.ExecRollBack;

                          bLog := True;
                          DB_Conect.doSaveLogImport(PastaLOG, pChar(lArquivo) + #13#10 + 'Falha ao incluir CTE_Destinatario.' + E.Message);
                          Continue;
                        end;
                    end;

                    }

                     Try

                       lSQL  := 'UPDATE CTE_CAPA SET CODFORNECEDOR = :CODFORNECEDOR, CODDESTINATARIO = :CODDESTINATARIO WHERE CTE_CAPA_ID = :CTE_CAPA_ID';

                       qryInsert.Close;
                       qryInsert.SQL.Clear;
                       qryInsert.SQL.Add( lSQL );
                       qryInsert.ParamByName('CODFORNECEDOR').AsString   := tpRetornoEmitente.trCodigo;
                       qryInsert.ParamByName('CODDESTINATARIO').AsString := tpRetornoDestinatario.trCodigo;

                       qryInsert.ParamByName('CTE_CAPA_ID').AsInteger   := IDENTITY_CTE_CAPA_ID;
                       qryInsert.ExecSQL;

                    except
                      On E:Exception do
                        begin
                           DB_Conect.doSaveLogImport(PastaLOG, Db_Conect.GetComando(qryInsert) + #13#10 + 'Falha ao pegar chave da CTE_EMITENTE_ID.' + E.Message);
                           Continue;
                         end;
                    end;

                    lSQL := ' INSERT INTO [dbo].[CTE_Remetente]( ';
                    lSQL := lSQL + ' cCT ';
                    lSQL := lSQL + ' ,CTE_CAPA_ID ';
                    lSQL := lSQL + ',CNPJ';
                    lSQL := lSQL + ',IE';
                 //   lSQL := lSQL + ',IEST';
                    lSQL := lSQL + ',xNome';
                //    lSQL := lSQL + ',xFant';
                 //   lSQL := lSQL + ',Fone';
                    lSQL := lSQL + ',xCpl';
                    lSQL := lSQL + ',xLgr';
                    lSQL := lSQL + ',nro';
                    lSQL := lSQL + ',xBairro';
                    lSQL := lSQL + ',cMun';
                    lSQL := lSQL + ',xMun';
                    lSQL := lSQL + ',CEP';
                    lSQL := lSQL + ',UF';
                    lSQL := lSQL + ',Email)';

                    lSQL := lSQL + ' VALUES ( ' ;
                    lSQL := lSQL + '  :cCT ';
                    lSQL := lSQL + ' ,:CTE_CAPA_ID ';
                    lSQL := lSQL + ',:CNPJ ';
                    lSQL := lSQL + ',:IE ';
               //     lSQL := lSQL +',:IEST ';
                    lSQL := lSQL +',:xNome ';
             //       lSQL := lSQL +',:xFant ';
           //         lSQL := lSQL +',:Fone ';
                    lSQL := lSQL +',:xCpl ';
                    lSQL := lSQL +',:xLgr ';
                    lSQL := lSQL +',:nro ';
                    lSQL := lSQL +',:xBairro ';
                    lSQL := lSQL +',:cMun';
                    lSQL := lSQL +',:xMun';
                    lSQL := lSQL +',:CEP';
                    lSQL := lSQL +',:UF';
                    lSQL := lSQL +',:Email)';


                    qryInsert.Close;
                    qryInsert.SQL.Clear;
                    qryInsert.SQL.Add( lSQL );



                    qryInsert.ParamByName('cCT').AsInteger                    := ide.cCT;
                    qryInsert.ParamByName('CTE_CAPA_ID').AsInteger            := IDENTITY_CTE_CAPA_ID;
                    qryInsert.ParamByName('CNPJ').AsString                    := rem.CNPJCPF;
                    qryInsert.ParamByName('IE').AsString                      := rem.IE;
                   // qryInsert.ParamByName('IEST').AsString                    := Dest.IEST;
                    qryInsert.ParamByName('xNome').AsString                   := rem.xNome;
         //           qryInsert.ParamByName('xFant').AsString                   := Dest.xFant;
         //           qryInsert.ParamByName('Fone').AsString                    := Dest.enderDest.fone;
                    qryInsert.ParamByName('xCpl').AsString                    := rem.enderReme.xCpl;
                    qryInsert.ParamByName('xLgr').AsString                    := rem.enderReme.xLgr;
                    qryInsert.ParamByName('nro').AsString                     := rem.enderReme.nro;
                    qryInsert.ParamByName('xBairro').AsString                 := rem.enderReme.xBairro;
                    qryInsert.ParamByName('cMun').AsString                    := IntToStr(rem.enderReme.cMun);
                    qryInsert.ParamByName('xMun').AsString                    := rem.enderReme.xMun;

                    qryInsert.ParamByName('CEP').AsString                     := IntToStr(rem.enderReme.CEP);
                    qryInsert.ParamByName('UF').AsString                      := rem.enderReme.UF;
                    qryInsert.ParamByName('Email').AsString                   := rem.email;


                    try
                      qryInsert.ExecSQL;

                    except
                      On E:Exception do
                        begin
              //            DB_Conect.GetComando(qryInsert, frmImportarNFeEntrada, False);
                          GCambio.ExecRollBack;

                          bLog := True;
                          DB_Conect.doSaveLogImport(PastaLOG, pChar(lArquivo) + #13#10 + 'Falha ao incluir CTE_Remetente.' + E.Message);
                          Continue;
                        end;
                    end;

                    lSQL := ' INSERT INTO [dbo].[CTE_Tomador]( ';
                    lSQL := lSQL + ' cCT ';
                    lSQL := lSQL + ' ,CTE_CAPA_ID ';
                    lSQL := lSQL + ',CNPJ';
                    lSQL := lSQL + ',IE';
                 //   lSQL := lSQL + ',IEST';
                    lSQL := lSQL + ',xNome';
                    lSQL := lSQL + ',xFant';
                    lSQL := lSQL + ',Fone';
                    lSQL := lSQL + ',xCpl';
                    lSQL := lSQL + ',xLgr';
                    lSQL := lSQL + ',nro';
                    lSQL := lSQL + ',xBairro';
                    lSQL := lSQL + ',cMun';
                    lSQL := lSQL + ',xMun';
                    lSQL := lSQL + ',CEP';
                    lSQL := lSQL + ',UF';
                    lSQL := lSQL + ',Email)';

                    lSQL := lSQL + ' VALUES ( ' ;
                    lSQL := lSQL + ':cCT ';
                    lSQL := lSQL + ' ,:CTE_CAPA_ID ';
                    lSQL := lSQL +',:CNPJ ';
                    lSQL := lSQL +',:IE ';
               //     lSQL := lSQL +',:IEST ';
                    lSQL := lSQL +',:xNome ';
                    lSQL := lSQL +',:xFant ';
                    lSQL := lSQL +',:Fone ';
                    lSQL := lSQL +',:xCpl ';
                    lSQL := lSQL +',:xLgr ';
                    lSQL := lSQL +',:nro ';
                    lSQL := lSQL +',:xBairro ';
                    lSQL := lSQL +',:cMun';
                    lSQL := lSQL +',:xMun';
                    lSQL := lSQL +',:CEP';
                    lSQL := lSQL +',:UF';
                    lSQL := lSQL +',:Email)';


                    qryInsert.Close;
                    qryInsert.SQL.Clear;
                    qryInsert.SQL.Add( lSQL );

                    if (ide.toma03.Toma = tmRemetente) then
                    begin

                       qryInsert.ParamByName('cCT').AsInteger                    := ide.cCT;
                       qryInsert.ParamByName('CTE_CAPA_ID').AsInteger            := IDENTITY_CTE_CAPA_ID;
                       qryInsert.ParamByName('CNPJ').AsString                    := rem.CNPJCPF;
                       qryInsert.ParamByName('IE').AsString                      := rem.IE;
                      // qryInsert.ParamByName('IEST').AsString                    := Dest.IEST;
                       qryInsert.ParamByName('xNome').AsString                   := rem.xNome;
                       qryInsert.ParamByName('xFant').AsString                   := rem.xFant;
                       qryInsert.ParamByName('Fone').AsString                    := rem.fone;
                       qryInsert.ParamByName('xCpl').AsString                    := rem.enderReme.xCpl;
                       qryInsert.ParamByName('xLgr').AsString                    := rem.enderReme.xLgr;
                       qryInsert.ParamByName('nro').AsString                     := rem.enderReme.nro;
                       qryInsert.ParamByName('xBairro').AsString                 := rem.enderReme.xBairro;
                       qryInsert.ParamByName('cMun').AsString                    := IntToStr(rem.enderReme.cMun);
                       qryInsert.ParamByName('xMun').AsString                    := rem.enderReme.xMun;

                       qryInsert.ParamByName('CEP').AsString                     := IntToStr(rem.enderReme.CEP);
                       qryInsert.ParamByName('UF').AsString                      := rem.enderReme.UF;
                       qryInsert.ParamByName('Email').AsString                   := rem.email;

                    end
                    else if (ide.toma03.Toma = tmExpedidor)  then
                    begin
                       qryInsert.ParamByName('cCT').AsInteger                    := ide.cCT;
                       qryInsert.ParamByName('CTE_CAPA_ID').AsInteger            := IDENTITY_CTE_CAPA_ID;
                       qryInsert.ParamByName('CNPJ').AsString                    := emit.CNPJ;
                       qryInsert.ParamByName('IE').AsString                      := emit.IE;
                      // qryInsert.ParamByName('IEST').AsString                    := Dest.IEST;
                       qryInsert.ParamByName('xNome').AsString                   := emit.xNome;
                      qryInsert.ParamByName('xFant').AsString                    := emit.xFant;
                      qryInsert.ParamByName('Fone').AsString                     := emit.enderEmit.fone;
                       qryInsert.ParamByName('xCpl').AsString                    := emit.enderEmit.xCpl;
                       qryInsert.ParamByName('xLgr').AsString                    := emit.enderEmit.xLgr;
                       qryInsert.ParamByName('nro').AsString                     := emit.enderEmit.nro;
                       qryInsert.ParamByName('xBairro').AsString                 := emit.enderEmit.xBairro;
                       qryInsert.ParamByName('cMun').AsString                    := IntToStr(emit.enderEmit.cMun);
                       qryInsert.ParamByName('xMun').AsString                    := emit.enderEmit.xMun;
                       qryInsert.ParamByName('CEP').AsString                     := IntToStr(emit.enderEmit.CEP);
                       qryInsert.ParamByName('UF').AsString                      := emit.enderEmit.UF;
                       qryInsert.ParamByName('Email').AsString                   := '';

                    end
                    else if (ide.toma03.Toma = tmDestinatario)  then
                    begin
                       qryInsert.ParamByName('cCT').AsInteger                    := ide.cCT;
                       qryInsert.ParamByName('CTE_CAPA_ID').AsInteger            := IDENTITY_CTE_CAPA_ID;
                       qryInsert.ParamByName('CNPJ').AsString                    := Dest.CNPJCPF;
                       qryInsert.ParamByName('IE').AsString                      := Dest.IE;
                      // qryInsert.ParamByName('IEST').AsString                    := Dest.IEST;
                       qryInsert.ParamByName('xNome').AsString                   := Dest.xNome;
                       qryInsert.ParamByName('xFant').AsString                   := Copy(Dest.xNome,1,40);
                       qryInsert.ParamByName('Fone').AsString                    := Dest.fone;
                       qryInsert.ParamByName('xCpl').AsString                    := Dest.enderDest.xCpl;
                       qryInsert.ParamByName('xLgr').AsString                    := Dest.enderDest.xLgr;
                       qryInsert.ParamByName('nro').AsString                     := Dest.enderDest.nro;
                       qryInsert.ParamByName('xBairro').AsString                 := Dest.enderDest.xBairro;
                       qryInsert.ParamByName('cMun').AsString                    := IntToStr(Dest.enderDest.cMun);
                       qryInsert.ParamByName('xMun').AsString                    := Dest.enderDest.xMun;
                       qryInsert.ParamByName('CEP').AsString                     := IntToStr(Dest.enderDest.CEP);
                       qryInsert.ParamByName('UF').AsString                      := Dest.enderDest.UF;
                       qryInsert.ParamByName('Email').AsString                   := Dest.email;

                    end
                    else if (ide.toma4.Toma = tmOutros) then
                    begin
                       qryInsert.ParamByName('cCT').AsInteger                    := ide.cCT;
                       qryInsert.ParamByName('CTE_CAPA_ID').AsInteger            := IDENTITY_CTE_CAPA_ID;
                       qryInsert.ParamByName('CNPJ').AsString                    := ide.toma4.CNPJCPF;
                       qryInsert.ParamByName('IE').AsString                      := ide.toma4.IE;
                      // qryInsert.ParamByName('IEST').AsString                    := Dest.IEST;
                       qryInsert.ParamByName('xNome').AsString                   := ide.toma4.xNome;
                       qryInsert.ParamByName('xFant').AsString                   := ide.toma4.xFant;
                       qryInsert.ParamByName('Fone').AsString                    := ide.toma4.fone;
                       qryInsert.ParamByName('xCpl').AsString                    := ide.toma4.enderToma.xCpl;
                       qryInsert.ParamByName('xLgr').AsString                    := ide.toma4.enderToma.xLgr;
                       qryInsert.ParamByName('nro').AsString                     := ide.toma4.enderToma.nro;
                       qryInsert.ParamByName('xBairro').AsString                 := ide.toma4.enderToma.xBairro;
                       qryInsert.ParamByName('cMun').AsString                    := IntToStr(ide.toma4.enderToma.cMun);
                       qryInsert.ParamByName('xMun').AsString                    := ide.toma4.enderToma.xMun;
                       qryInsert.ParamByName('CEP').AsString                     := IntToStr(ide.toma4.enderToma.CEP);
                       qryInsert.ParamByName('UF').AsString                      := ide.toma4.enderToma.UF;
                       qryInsert.ParamByName('Email').AsString                   := ide.toma4.email;

                    end;

                    try
                      qryInsert.ExecSQL;

                    except
                      On E:Exception do
                        begin
              //            DB_Conect.GetComando(qryInsert, frmImportarNFeEntrada, False);
                          GCambio.ExecRollBack;

                          bLog := True;
                          DB_Conect.doSaveLogImport(PastaLOG, pChar(lArquivo) + #13#10 + 'Falha ao incluir CTE_Tomador.' + E.Message);
                          Continue;
                        end;
                    end;

                    lSQL := ' INSERT INTO [dbo].[CTE_VPrest]( ';
                    lSQL := lSQL + ' cCT ';
                    lSQL := lSQL + ' ,CTE_CAPA_ID ';
                    lSQL := lSQL + ' ,vTPrest ';
                    lSQL := lSQL + ' ,vRec )';
                    lSQL := lSQL + ' Values (';
                    lSQL := lSQL + ' :cCT ';
                    lSQL := lSQL + ' ,:CTE_CAPA_ID ';
                    lSQL := lSQL + ' ,:vTPrest ';
                    lSQL := lSQL + ' ,:vRec )';

                    qryInsert.Close;
                    qryInsert.SQL.Clear;
                    qryInsert.SQL.Add( lSQL );

                    qryInsert.ParamByName('cCT').AsInteger                    := ide.cCT;
                    qryInsert.ParamByName('CTE_CAPA_ID').AsInteger            := IDENTITY_CTE_CAPA_ID;
                    qryInsert.ParamByName('vTPrest').asFloat                  := vPrest.vTPrest;
                    qryInsert.ParamByName('vRec').asFloat                     := vPrest.vRec;

                    try
                      qryInsert.ExecSQL;

                    except
                      On E:Exception do
                        begin
              //            DB_Conect.GetComando(qryInsert, frmImportarNFeEntrada, False);
                          GCambio.ExecRollBack;

                          bLog := True;
                          DB_Conect.doSaveLogImport(PastaLOG, pChar(lArquivo) + #13#10 + 'Falha ao incluir CTE_VPrest.' + E.Message);
                          Continue;
                        end;
                    end;

                    lSQL := ' INSERT INTO [dbo].[CTE_COMP_VALORES]( ';
                    lSQL := lSQL + ' cCT ';
                    lSQL := lSQL + ' ,CTE_CAPA_ID ';
                    lSQL := lSQL + ' ,Nome ';
                    lSQL := lSQL + ' ,Valor )';
                    lSQL := lSQL + ' Values (';
                    lSQL := lSQL + ' :cCT ';
                    lSQL := lSQL + ' ,:CTE_CAPA_ID ';
                    lSQL := lSQL + ' ,:Nome ';
                    lSQL := lSQL + ' ,:Valor )';

                    qryInsert.Close;
                    qryInsert.SQL.Clear;
                    qryInsert.SQL.Add( lSQL );

                    for T := 0 to vPrest.Comp.Count-1 do
                    begin
                      with vPrest.Comp[T] do
                      begin
                        qryInsert.ParamByName('cCT').AsInteger                     := ide.cCT;
                        qryInsert.ParamByName('CTE_CAPA_ID').AsInteger             := IDENTITY_CTE_CAPA_ID;
                        qryInsert.ParamByName('Nome').asString                     := vPrest.Comp[T].xNome;
                        qryInsert.ParamByName('Valor').asFloat                     := vPrest.Comp[T].vComp;

                        try
                          qryInsert.ExecSQL;

                        except
                          On E:Exception do
                            begin
                  //            DB_Conect.GetComando(qryInsert, frmImportarNFeEntrada, False);
                              GCambio.ExecRollBack;

                              bLog := True;
                              DB_Conect.doSaveLogImport(PastaLOG, pChar(lArquivo) + #13#10 + 'Falha ao incluir CTE_COMP_VALORES.' + E.Message);
                              Continue;
                            end;
                        end;
                      end;
                    end;


                    lSQL := ' INSERT INTO [dbo].[CTE_IMPOSTOS]( ';
                    lSQL := lSQL + ' cCT';
                    lSQL := lSQL + ' ,CTE_CAPA_ID ';
                    lSQL := lSQL + ' ,SituTrib';
                    lSQL := lSQL + ' ,CST';
                    lSQL := lSQL + ' ,pRedBC';
                    lSQL := lSQL + ' ,vBC';
                    lSQL := lSQL + ' ,pICMS';
                    lSQL := lSQL + ' ,vICMS';
                    lSQL := lSQL + ' ,vCred';
                    lSQL := lSQL + ' ,infAdFisco';
                    lSQL := lSQL + ' ,vTotTrib';
                    lSQL := lSQL + ' ,vPIS';
                    lSQL := lSQL + ' ,vCOFINS';
                    lSQL := lSQL + ' ,vIR';
                    lSQL := lSQL + ' ,vINSS';
                    lSQL := lSQL + ' ,vCSLL';
                    lSQL := lSQL + ' ,CFOP)';
                    lSQL := lSQL + ' Values (';
                    lSQL := lSQL + ' :cCT';
                    lSQL := lSQL + ' ,:CTE_CAPA_ID ';
                    lSQL := lSQL + ' ,:SituTrib';
                    lSQL := lSQL + ' ,:CST';
                    lSQL := lSQL + ' ,:pRedBC';
                    lSQL := lSQL + ' ,:vBC';
                    lSQL := lSQL + ' ,:pICMS';
                    lSQL := lSQL + ' ,:vICMS';
                    lSQL := lSQL + ' ,:vCred';
                    lSQL := lSQL + ' ,:infAdFisco';
                    lSQL := lSQL + ' ,:vTotTrib';
                    lSQL := lSQL + ' ,:vPIS';
                    lSQL := lSQL + ' ,:vCOFINS';
                    lSQL := lSQL + ' ,:vIR';
                    lSQL := lSQL + ' ,:vINSS';
                    lSQL := lSQL + ' ,:vCSLL';
                    lSQL := lSQL + ' ,:CFOP)';


                    qryInsert.Close;
                    qryInsert.SQL.Clear;
                    qryInsert.SQL.Add( lSQL );

                    qryInsert.ParamByName('cCT').AsInteger                     := ide.cCT;
                    qryInsert.ParamByName('CTE_CAPA_ID').AsInteger             := IDENTITY_CTE_CAPA_ID;


                    Case  TpcnCSTIcms(Imp.ICMS.SituTrib) of
                    cst00: begin
                           qryInsert.ParamByName('SituTrib').asString                 := CSTICMSToStr(cst00);
                           qryInsert.ParamByName('CST').asString                      := CSTICMSToStr(Imp.ICMS.ICMS00.CST);
                           qryInsert.ParamByName('pRedBC').AsFloat                    := 0;
                           qryInsert.ParamByName('vBC').AsFloat                       := Imp.ICMS.ICMS00.vBC;
                           qryInsert.ParamByName('pICMS').AsFloat                     := Imp.ICMS.ICMS00.pICMS;
                           qryInsert.ParamByName('vICMS').AsFloat                     := Imp.ICMS.ICMS00.vICMS;
                           qryInsert.ParamByName('vCred').AsFloat                     := 0;
                        end;
                    cst20: begin
                           qryInsert.ParamByName('SituTrib').asString                 := CSTICMSToStr(cst20);
                           qryInsert.ParamByName('CST').asString                      := CSTICMSToStr(Imp.ICMS.ICMS20.CST);
                           qryInsert.ParamByName('pRedBC').AsFloat                    := Imp.ICMS.ICMS20.pRedBC;
                           qryInsert.ParamByName('vBC').AsFloat                       := Imp.ICMS.ICMS20.vBC;
                           qryInsert.ParamByName('pICMS').AsFloat                     := Imp.ICMS.ICMS20.pICMS;
                           qryInsert.ParamByName('vICMS').AsFloat                     := Imp.ICMS.ICMS20.vICMS;
                           qryInsert.ParamByName('vCred').AsFloat                     := 0;
                        end;
                    cst40: begin
                           qryInsert.ParamByName('SituTrib').asString                 := CSTICMSToStr(cst40);
                           qryInsert.ParamByName('CST').asString                      := CSTICMSToStr(Imp.ICMS.ICMS45.CST);
                           qryInsert.ParamByName('pRedBC').AsFloat                    := 0;
                           qryInsert.ParamByName('vBC').AsFloat                       := 0;
                           qryInsert.ParamByName('pICMS').AsFloat                     := 0;
                           qryInsert.ParamByName('vICMS').AsFloat                     := 0;
                           qryInsert.ParamByName('vCred').AsFloat                     := 0;
                        end;
                    cst41: begin
                           qryInsert.ParamByName('SituTrib').asString                 := CSTICMSToStr(cst41);
                           qryInsert.ParamByName('CST').asString                      := CSTICMSToStr(Imp.ICMS.ICMS45.CST);
                           qryInsert.ParamByName('pRedBC').AsFloat                    := 0;
                           qryInsert.ParamByName('vBC').AsFloat                       := 0;
                           qryInsert.ParamByName('pICMS').AsFloat                     := 0;
                           qryInsert.ParamByName('vICMS').AsFloat                     := 0;
                           qryInsert.ParamByName('vCred').AsFloat                     := 0;
                        end;
                    cst51: begin
                           qryInsert.ParamByName('SituTrib').asString                 := CSTICMSToStr(cst51);
                           qryInsert.ParamByName('CST').asString                      := CSTICMSToStr(Imp.ICMS.ICMS45.CST);
                           qryInsert.ParamByName('pRedBC').AsFloat                    := 0;
                           qryInsert.ParamByName('vBC').AsFloat                       := 0;
                           qryInsert.ParamByName('pICMS').AsFloat                     := 0;
                           qryInsert.ParamByName('vICMS').AsFloat                     := 0;
                           qryInsert.ParamByName('vCred').AsFloat                     := 0;
                        end;
                    cst60: begin
                           qryInsert.ParamByName('SituTrib').asString                 := CSTICMSToStr(cst60);
                           qryInsert.ParamByName('CST').asString                      := CSTICMSToStr(Imp.ICMS.ICMS60.CST);
                           qryInsert.ParamByName('pRedBC').AsFloat                    := 0;
                           qryInsert.ParamByName('vBC').AsFloat                       := imp.ICMS.ICMS60.vBCSTRet;
                           qryInsert.ParamByName('pICMS').AsFloat                     := imp.ICMS.ICMS60.pICMSSTRet;
                           qryInsert.ParamByName('vICMS').AsFloat                     := imp.ICMS.ICMS60.vICMSSTRet;
                           qryInsert.ParamByName('vCred').AsFloat                     := imp.ICMS.ICMS60.vCred;

                    end;
                    cst80: begin
                           qryInsert.ParamByName('SituTrib').asString                 := CSTICMSToStr(cst80);
                           qryInsert.ParamByName('CST').asString                      := CSTICMSToStr(Imp.ICMS.ICMS90.CST);
                           qryInsert.ParamByName('pRedBC').AsFloat                    := 0;
                           qryInsert.ParamByName('vBC').AsFloat                       := 0;
                           qryInsert.ParamByName('pICMS').AsFloat                     := 0;
                           qryInsert.ParamByName('vICMS').AsFloat                     := 0;
                           qryInsert.ParamByName('vCred').AsFloat                     := 0;
                        end;
                    cst81: begin
                           qryInsert.ParamByName('SituTrib').asString                 := CSTICMSToStr(cst81);
                           qryInsert.ParamByName('CST').asString                      := CSTICMSToStr(Imp.ICMS.ICMS90.CST);
                           qryInsert.ParamByName('pRedBC').AsFloat                    := 0;
                           qryInsert.ParamByName('vBC').AsFloat                       := 0;
                           qryInsert.ParamByName('pICMS').AsFloat                     := 0;
                           qryInsert.ParamByName('vICMS').AsFloat                     := 0;
                           qryInsert.ParamByName('vCred').AsFloat                     := 0;
                        end;
                    cst90: begin
                           qryInsert.ParamByName('SituTrib').asString                 := CSTICMSToStr(cst90);
                           qryInsert.ParamByName('CST').asString                      := CSTICMSToStr(Imp.ICMS.ICMS90.CST);
                           qryInsert.ParamByName('pRedBC').AsFloat                    := Imp.ICMS.ICMS90.pRedBC;
                           qryInsert.ParamByName('vBC').AsFloat                       := Imp.ICMS.ICMS90.vBC;
                           qryInsert.ParamByName('pICMS').AsFloat                     := Imp.ICMS.ICMS90.pICMS;
                           qryInsert.ParamByName('vICMS').AsFloat                     := Imp.ICMS.ICMS90.vICMS;
                           qryInsert.ParamByName('vCred').AsFloat                     := Imp.ICMS.ICMS90.vCred;
                     end;
                     cstICMSOutraUF:
                        begin
                           qryInsert.ParamByName('SituTrib').asString                 := CSTICMSToStr(cst90);
                           qryInsert.ParamByName('CST').asString                      := CSTICMSToStr(Imp.ICMS.ICMSOutraUF.CST);
                           qryInsert.ParamByName('pRedBC').AsFloat                    := Imp.ICMS.ICMSOutraUF.pRedBCOutraUF;
                           qryInsert.ParamByName('vBC').AsFloat                       := Imp.ICMS.ICMSOutraUF.vBCOutraUF;
                           qryInsert.ParamByName('pICMS').AsFloat                     := Imp.ICMS.ICMSOutraUF.pICMSOutraUF;
                           qryInsert.ParamByName('vICMS').AsFloat                     := Imp.ICMS.ICMSOutraUF.vICMSOutraUF;
                           qryInsert.ParamByName('vCred').AsFloat                     := 0;
                        end;
                    end;

                    qryInsert.ParamByName('infAdFisco').AsString                          := Imp.infAdFisco;
                    qryInsert.ParamByName('vTotTrib').AsFloat                             := imp.vTotTrib ;
                    qryInsert.ParamByName('vPIS').AsFloat                                 := imp.infTribFed.vPIS;
                    qryInsert.ParamByName('vCOFINS').AsFloat                              := imp.infTribFed.vCOFINS;
                    qryInsert.ParamByName('vIR').AsFloat                                  := imp.infTribFed.vIR;
                    qryInsert.ParamByName('vINSS').AsFloat                                := imp.infTribFed.vINSS;
                    qryInsert.ParamByName('vCSLL').AsFloat                                := imp.infTribFed.vCSLL;
                    qryInsert.ParamByName('CFOP').AsString                                := IntToStr(ide.CFOP);

                    try
                      qryInsert.ExecSQL;

                    except
                      On E:Exception do
                        begin
              //            DB_Conect.GetComando(qryInsert, frmImportarNFeEntrada, False);
                          GCambio.ExecRollBack;

                          bLog := True;
                          DB_Conect.doSaveLogImport(PastaLOG, pChar(lArquivo) + #13#10 + 'Falha ao incluir CTE_IMPOSTOS.' + E.Message);
                          Continue;
                        end;
                    end;

                    lSQL := ' INSERT INTO [dbo].[CTE_INFCARGA]( ';
                    lSQL := lSQL + ' cCT';
                    lSQL := lSQL + ' ,CTE_CAPA_ID ';
                    lSQL := lSQL + ' ,VCARGA ';
                    lSQL := lSQL + ' ,PROPRED';
                    lSQL := lSQL + ' ,XOUTCAT)';
                    lSQL := lSQL + ' Values ( ';
                    lSQL := lSQL + ' :cCT';
                    lSQL := lSQL + ' ,:CTE_CAPA_ID ';
                    lSQL := lSQL + ' ,:VCARGA ';
                    lSQL := lSQL + ' ,:PROPRED';
                    lSQL := lSQL + ' ,:XOUTCAT)';

                    qryInsert.Close;
                    qryInsert.SQL.Clear;
                    qryInsert.SQL.Add( lSQL );

                    qryInsert.ParamByName('cCT').AsInteger                     := ide.cCT;
                    qryInsert.ParamByName('CTE_CAPA_ID').AsInteger             := IDENTITY_CTE_CAPA_ID;
                    qryInsert.ParamByName('VCARGA').AsFloat                    := infCTeNorm.infCarga.vCarga;
                    qryInsert.ParamByName('PROPRED').AsString                  := infCTeNorm.infCarga.proPred;
                    qryInsert.ParamByName('XOUTCAT').AsString                  := infCTeNorm.infCarga.xOutCat;

                    try
                      qryInsert.ExecSQL;

                    except
                      On E:Exception do
                        begin
              //            DB_Conect.GetComando(qryInsert, frmImportarNFeEntrada, False);
                          GCambio.ExecRollBack;

                          bLog := True;
                          DB_Conect.doSaveLogImport(PastaLOG, pChar(lArquivo) + #13#10 + 'Falha ao incluir CTE_INFCARGA.' + E.Message);
                          Continue;
                        end;
                    end;

                    lSQL := ' INSERT INTO [dbo].[CTE_SEGURADORA]( ';
                    lSQL := lSQL + ' cCT';
                    lSQL := lSQL + ' ,CTE_CAPA_ID ';
                    lSQL := lSQL + ' ,RESPSEG';
                    lSQL := lSQL + ' ,XSEG';
                    lSQL := lSQL + ' ,NAPOLICE';
                    lSQL := lSQL + ' ,VCARGA)';
                    lSQL := lSQL + '  Values (';
                    lSQL := lSQL + ' :cCT';
                    lSQL := lSQL + ' ,:CTE_CAPA_ID ';
                    lSQL := lSQL + ' ,:RESPSEG';
                    lSQL := lSQL + ' ,:XSEG';
                    lSQL := lSQL + ' ,:NAPOLICE';
                    lSQL := lSQL + ' ,:VCARGA)';

                    qryInsert.Close;
                    qryInsert.SQL.Clear;
                    qryInsert.SQL.Add( lSQL );

                    for T := 0 to infCTeNorm.Seg.Count-1 do
                    begin
                      with infCTeNorm.Seg[T] do
                      begin

                        qryInsert.ParamByName('cCT').AsInteger                     := ide.cCT;
                        qryInsert.ParamByName('CTE_CAPA_ID').AsInteger             := IDENTITY_CTE_CAPA_ID;
                        qryInsert.ParamByName('RESPSEG').AsString                  := TpRspSeguroToStr(infCTeNorm.Seg.Items[T].respSeg);
                        qryInsert.ParamByName('XSEG').AsString                     := infCTeNorm.Seg.Items[T].xSeg;
                        qryInsert.ParamByName('NAPOLICE').AsString                 := infCTeNorm.Seg.Items[T].nApol;
                        qryInsert.ParamByName('VCARGA').AsFloat                    := infCTeNorm.Seg.Items[T].vCarga;

                        try
                          qryInsert.ExecSQL;

                        except
                          On E:Exception do
                            begin
                  //            DB_Conect.GetComando(qryInsert, frmImportarNFeEntrada, False);
                              GCambio.ExecRollBack;

                              bLog := True;
                              DB_Conect.doSaveLogImport(PastaLOG, pChar(lArquivo) + #13#10 + 'Falha ao incluir CTE_SEGURADORA.' + E.Message);
                              Continue;
                            end;
                        end;
                      end;
                    end;

                    lSQL := ' INSERT INTO [dbo].[CTE_INFMODAL]( ';
                    lSQL := lSQL + ' cCT';
                    lSQL := lSQL + ' ,CTE_CAPA_ID ';
                    lSQL := lSQL + ' ,DPREVAEREO';
                    lSQL := lSQL + ' ,IDT';
                    lSQL := lSQL + ' ,CL';
                    lSQL := lSQL + ' ,VTARIFA';
                    lSQL := lSQL + ' ,nMinu ';
                    lSQL := lSQL + ' ,nOCA ';
                    lSQL := lSQL + ' ,cTar ';
                    lSQL := lSQL + ' ,xLAgEmi) ';


                    lSQL := lSQL + ' Values (';
                    lSQL := lSQL + ' :cCT';
                    lSQL := lSQL + ' ,:CTE_CAPA_ID ';
                    lSQL := lSQL + ' ,:DPREVAEREO';
                    lSQL := lSQL + ' ,:IDT';
                    lSQL := lSQL + ' ,:CL';
                    lSQL := lSQL + ' ,:VTARIFA';

                    lSQL := lSQL + ' ,:nMinu ';
                    lSQL := lSQL + ' ,:nOCA ';
                    lSQL := lSQL + ' ,:cTar ';
                    lSQL := lSQL + ' ,:xLAgEmi) ';

                    qryInsert.Close;
                    qryInsert.SQL.Clear;
                    qryInsert.SQL.Add( lSQL );

                    qryInsert.ParamByName('cCT').AsInteger                     := ide.cCT;
                    qryInsert.ParamByName('CTE_CAPA_ID').AsInteger             := IDENTITY_CTE_CAPA_ID;
                    qryInsert.ParamByName('DPREVAEREO').AsSQLTimeStamp         := DateTimeToSQLTimeStamp(infCTeNorm.aereo.dPrevAereo);
                    qryInsert.ParamByName('IDT').AsString                      := infCTeNorm.aereo.IdT;
                    qryInsert.ParamByName('CL').AsString                       := infCTeNorm.aereo.tarifa.CL;
                    qryInsert.ParamByName('VTARIFA').AsFloat                   := infCTeNorm.aereo.tarifa.vTar;
                    qryInsert.ParamByName('cTar').AsString                     := infCTeNorm.aereo.tarifa.cTar;

                    qryInsert.ParamByName('nMinu').AsInteger                    := infCTeNorm.aereo.nMinu;
                    qryInsert.ParamByName('nOCA').AsString                      := infCTeNorm.aereo.nOCA;
                    qryInsert.ParamByName('xLAgEmi').AsString                   := infCTeNorm.aereo.xLAgEmi;


                    try
                      qryInsert.ExecSQL;
                      IDENTITY_ID := 0;
                      lSQL  := 'SELECT @@IDENTITY as ICTE_INFMODAL ';

                      qryInsert.Close;
                      qryInsert.SQL.Clear;
                      qryInsert.SQL.Add( lSQL );
                      qryInsert.Open;
                      IDENTITY_ID := qryInsert.FieldByName('ICTE_INFMODAL').AsInteger;

                    except
                      On E:Exception do
                        begin
                          //DB_Conect.GetComando(qryInsert, frmImportador, False);
                          GCambio.ExecRollBack;

                          bLog := True;
                          DB_Conect.doSaveLogImport(PastaLOG, pChar(lArquivo) + #13#10 + 'Falha ao incluir CTE_INFMODAL.' + E.Message);
                          Continue;
                        end;
                    end;

                    lSQL := ' INSERT INTO [dbo].[CTE_INFMANU]( ';
                    lSQL := lSQL + ' cCT';
                    lSQL := lSQL + ' ,CTE_CAPA_ID ';
                    lSQL := lSQL + ' ,CTE_INFMODAL';
                    lSQL := lSQL + ' ,CINFMANU';
                    lSQL := lSQL + ' ,CIMP ';
                    lSQL := lSQL + ' ,XDIME)';
                    lSQL := lSQL + ' VALUES (';
                    lSQL := lSQL + ' :cCT';
                    lSQL := lSQL + ' ,:CTE_CAPA_ID ';
                    lSQL := lSQL + ' ,:CTE_INFMODAL';
                    lSQL := lSQL + ' ,:CINFMANU';
                    lSQL := lSQL + ' ,:CIMP';
                    lSQL := lSQL + ' ,:XDIME)';
                    qryInsert.Close;
                    qryInsert.SQL.Clear;
                    qryInsert.SQL.Add( lSQL );

                    for T := 0 to infCTeNorm.aereo.natCarga.cinfManu.Count-1 do
                    begin
                      with infCTeNorm.aereo.natCarga.cinfManu[T] do
                      begin
                        qryInsert.ParamByName('cCT').AsInteger                     := ide.cCT;
                        qryInsert.ParamByName('CTE_CAPA_ID').AsInteger             := IDENTITY_CTE_CAPA_ID;
                        qryInsert.ParamByName('CTE_INFMODAL').AsInteger            := IDENTITY_ID;
                        qryInsert.ParamByName('CINFMANU').AsString                 := TpInfManuToStr(infCTeNorm.aereo.natCarga.cinfManu[T].nInfManu);
                        qryInsert.ParamByName('CIMP').AsString                     := infCTeNorm.aereo.natCarga.cIMP;
                        qryInsert.ParamByName('XDIME').AsString                    := infCTeNorm.aereo.natCarga.xDime;

                        try
                          qryInsert.ExecSQL;

                        except
                          On E:Exception do
                            begin
                  //            DB_Conect.GetComando(qryInsert, frmImportarNFeEntrada, False);
                              GCambio.ExecRollBack;

                              bLog := True;
                              DB_Conect.doSaveLogImport(PastaLOG, pChar(lArquivo) + #13#10 + 'Falha ao incluir CTE_INFMANU.' + E.Message);
                              Continue;
                            end;
                        end;
                      end;
                    end;


                    lSQL := ' INSERT INTO [dbo].[CTE_NFE]( ';
                    lSQL := lSQL + ' cCT';
                    lSQL := lSQL + ' ,CTE_CAPA_ID ';
                    lSQL := lSQL + ' ,CHAVENFE) ';
                    lSQL := lSQL + ' Values ( ';
                    lSQL := lSQL + ' :cCT';
                    lSQL := lSQL + ' ,:CTE_CAPA_ID ';
                    lSQL := lSQL + ' ,:CHAVENFE) ';

                    qryInsert.Close;
                    qryInsert.SQL.Clear;
                    qryInsert.SQL.Add( lSQL );

                    for T := 0 to infCTeNorm.infDoc.infNFe.Count-1 do
                    begin
                      with infCTeNorm.infDoc.infNFe[T] do
                      begin
                        qryInsert.ParamByName('cCT').AsInteger                     := ide.cCT;
                        qryInsert.ParamByName('CTE_CAPA_ID').AsInteger             := IDENTITY_CTE_CAPA_ID;
                        qryInsert.ParamByName('CHAVENFE').AsString                 := infCTeNorm.infDoc.infNFe[T].chave;

                        try
                          qryInsert.ExecSQL;

                        except
                          On E:Exception do
                            begin
                  //            DB_Conect.GetComando(qryInsert, frmImportarNFeEntrada, False);
                              GCambio.ExecRollBack;

                              bLog := True;
                              DB_Conect.doSaveLogImport(PastaLOG, pChar(lArquivo) + #13#10 + 'Falha ao incluir CTE_NFE.' + E.Message);
                              Continue;
                            end;
                        end;

                      end;
                    end;


                    lSQL := ' INSERT INTO [dbo].[CTE_INFQ]( ';
                    lSQL := lSQL + ' cCT';
                    lSQL := lSQL + ' ,CTE_CAPA_ID ';
                    lSQL := lSQL + ' ,CUNID';
                    lSQL := lSQL + ' ,TPMED';
                    lSQL := lSQL + ' ,QCARGA)';
                    lSQL := lSQL + ' Values (';
                    lSQL := lSQL + ' :cCT';
                    lSQL := lSQL + ' ,:CTE_CAPA_ID ';
                    lSQL := lSQL + ' ,:CUNID';
                    lSQL := lSQL + ' ,:TPMED';
                    lSQL := lSQL + ' ,:QCARGA)';

                    qryInsert.Close;
                    qryInsert.SQL.Clear;
                    qryInsert.SQL.Add( lSQL );

                    for T := 0 to infCTeNorm.infCarga.infQ.Count-1 do
                    begin
                      with infCTeNorm.infCarga.infQ[T] do
                      begin
                        qryInsert.ParamByName('cCT').AsInteger                  := ide.cCT;
                        qryInsert.ParamByName('CTE_CAPA_ID').AsInteger          := IDENTITY_CTE_CAPA_ID;
                        qryInsert.ParamByName('CUNID').AsString                 := UnidMedToStr(infCTeNorm.infCarga.infQ[T].cUnid);
                        qryInsert.ParamByName('TPMED').AsString                 := infCTeNorm.infCarga.infQ[T].tpMed;
                        qryInsert.ParamByName('QCARGA').AsFloat                 := infCTeNorm.infCarga.infQ[T].qCarga;

                        try
                          qryInsert.ExecSQL;

                        except
                          On E:Exception do
                            begin
                  //            DB_Conect.GetComando(qryInsert, frmImportarNFeEntrada, False);
                              GCambio.ExecRollBack;

                              bLog := True;
                              DB_Conect.doSaveLogImport(PastaLOG, pChar(lArquivo) + #13#10 + 'Falha ao incluir CTE_INFQ.' + E.Message);
                              Continue;
                            end;
                        end;

                      end;
                    end;

                    lSQL := ' INSERT INTO [dbo].[CTE_RODO]( ';
                    lSQL := lSQL + ' cCT';
                    lSQL := lSQL + ' ,CTE_CAPA_ID ';
                    lSQL := lSQL + ' ,RNTRC';
                    lSQL := lSQL + ' ,dPrev';
                    lSQL := lSQL + ' ,lota';
                    lSQL := lSQL + ' ,CIOT)';
                    lSQL := lSQL + ' Values (';
                    lSQL := lSQL + ' :cCT';
                    lSQL := lSQL + ' ,:CTE_CAPA_ID ';
                    lSQL := lSQL + ' ,:RNTRC';
                    lSQL := lSQL + ' ,:dPrev';
                    lSQL := lSQL + ' ,:lota';
                    lSQL := lSQL + ' ,:CIOT)';

                    qryInsert.Close;
                    qryInsert.SQL.Clear;
                    qryInsert.SQL.Add( lSQL );

                    qryInsert.ParamByName('cCT').AsInteger                  := ide.cCT;
                    qryInsert.ParamByName('CTE_CAPA_ID').AsInteger          := IDENTITY_CTE_CAPA_ID;
                    qryInsert.ParamByName('RNTRC').AsString                 := infCTeNorm.rodo.RNTRC;
                    qryInsert.ParamByName('dPrev').AsSQLTimeStamp           := DateTimeToSQLTimeStamp(infCTeNorm.rodo.dPrev);
                    qryInsert.ParamByName('lota').AsString                  := TpLotacaoToStr(infCTeNorm.rodo.lota);
                    qryInsert.ParamByName('CIOT').AsString                  := infCTeNorm.rodo.CIOT;

                    try
                     qryInsert.ExecSQL;
                     IDENTITY_ID := 0;
                     lSQL  := 'SELECT @@IDENTITY as CTE_RODO_ID ';

                     qryInsert.Close;
                     qryInsert.SQL.Clear;
                     qryInsert.SQL.Add( lSQL );
                     qryInsert.Open;
                     IDENTITY_ID := qryInsert.FieldByName('CTE_RODO_ID').AsInteger;

                    except
                      On E:Exception do
                        begin
              //            DB_Conect.GetComando(qryInsert, frmImportarNFeEntrada, False);
                          GCambio.ExecRollBack;

                          bLog := True;
                          DB_Conect.doSaveLogImport(PastaLOG, pChar(lArquivo) + #13#10 + 'Falha ao incluir CTE_RODO.' + E.Message);
                          Continue;
                        end;
                    end;

                    lSQL := ' INSERT INTO [dbo].[CTE_RODO_OCC]( ';
                    lSQL := lSQL + ' cCT';
                    lSQL := lSQL + ' ,CTE_CAPA_ID ';
                    lSQL := lSQL + ' ,CTE_RODO_ID';
                    lSQL := lSQL + ' ,serie';
                    lSQL := lSQL + ' ,nOcc';
                    lSQL := lSQL + ' ,dEmi';
                    lSQL := lSQL + ' ,CNPJ';
                    lSQL := lSQL + ' ,cInt';
                    lSQL := lSQL + ' ,IE';
                    lSQL := lSQL + ' ,UF';
                    lSQL := lSQL + ' ,fone)';
                    lSQL := lSQL + ' Values';
                    lSQL := lSQL + ' :cCT';
                    lSQL := lSQL + ' ,:CTE_CAPA_ID ';
                    lSQL := lSQL + ' ,:CTE_RODO_ID';
                    lSQL := lSQL + ' ,:serie';
                    lSQL := lSQL + ' ,:nOcc';
                    lSQL := lSQL + ' ,:dEmi';
                    lSQL := lSQL + ' ,:CNPJ';
                    lSQL := lSQL + ' ,:cInt';
                    lSQL := lSQL + ' ,:IE';
                    lSQL := lSQL + ' ,:UF';
                    lSQL := lSQL + ' ,:fone)';

                    qryInsert.Close;
                    qryInsert.SQL.Clear;
                    qryInsert.SQL.Add( lSQL );

                    for T := 0 to infCTeNorm.rodo.occ.Count-1 do
                    begin
                      with infCTeNorm.rodo.occ[T] do
                      begin
                        qryInsert.ParamByName('cCT').AsInteger                  := ide.cCT;
                        qryInsert.ParamByName('CTE_CAPA_ID').AsInteger          := IDENTITY_CTE_CAPA_ID;
                        qryInsert.ParamByName('CTE_RODO_ID').AsInteger          := IDENTITY_ID;
                        qryInsert.ParamByName('serie').AsString                 := infCTeNorm.rodo.occ[T].serie;
                        qryInsert.ParamByName('nOcc').AsInteger                 := infCTeNorm.rodo.occ[T].nOcc;
                        qryInsert.ParamByName('dEmi').AsSQLTimeStamp            := DateTimeToSQLTimeStamp(infCTeNorm.rodo.occ[T].dEmi);
                        qryInsert.ParamByName('CNPJ').AsString                  := infCTeNorm.rodo.occ[T].emiOcc.CNPJ;
                        qryInsert.ParamByName('cInt').AsString                  := infCTeNorm.rodo.occ[T].emiOcc.cInt;
                        qryInsert.ParamByName('IE').AsString                    := infCTeNorm.rodo.occ[T].emiOcc.IE;
                        qryInsert.ParamByName('UF').AsString                    := infCTeNorm.rodo.occ[T].emiOcc.UF;
                        qryInsert.ParamByName('fone').AsString                  := infCTeNorm.rodo.occ[T].emiOcc.fone;
                       end;

                       try
                         qryInsert.ExecSQL;

                       except
                         On E:Exception do
                           begin
                 //            DB_Conect.GetComando(qryInsert, frmImportarNFeEntrada, False);
                             GCambio.ExecRollBack;


                             bLog := True;
                             DB_Conect.doSaveLogImport(PastaLOG, pChar(lArquivo) + #13#10 + 'Falha ao incluir CTE_RODO_OCC.' + E.Message);
                             Continue;
                           end;
                       end;
                    end;


                    lSQL := ' INSERT INTO [dbo].[CTE_AUTXML]( ';
                    lSQL := lSQL + ' cCT';
                    lSQL := lSQL + ' ,CTE_CAPA_ID ';
                    lSQL := lSQL + ' ,CNPJ )';
                    lSQL := lSQL + ' Values (';
                    lSQL := lSQL + ' :cCT';
                    lSQL := lSQL + ' ,:CTE_CAPA_ID ';
                    lSQL := lSQL + ' ,:CNPJ )';

                    qryInsert.Close;
                    qryInsert.SQL.Clear;
                    qryInsert.SQL.Add( lSQL );

                    for T := 0 to autXML.Count-1 do
                    begin
                      with autXML[T] do
                      begin
                       qryInsert.ParamByName('cCT').AsInteger                  := ide.cCT;
                       qryInsert.ParamByName('CTE_CAPA_ID').AsInteger          := IDENTITY_CTE_CAPA_ID;
                       qryInsert.ParamByName('CNPJ').AsString                  := autXML[T].CNPJCPF;
                      end;

                      try
                        qryInsert.ExecSQL;

                      except
                        On E:Exception do
                          begin
                //            DB_Conect.GetComando(qryInsert, frmImportarNFeEntrada, False);
                            GCambio.ExecRollBack;


                            bLog := True;
                            DB_Conect.doSaveLogImport(PastaLOG, pChar(lArquivo) + #13#10 + 'Falha ao incluir CTE_AUTXML.' + E.Message);
                            Continue;
                          end;
                      end;
                    end;

                    lSQL := ' INSERT INTO [dbo].[CTE_COBR]( ';
                    lSQL := lSQL + ' cCT';
                    lSQL := lSQL + ' ,CTE_CAPA_ID ';
                    lSQL := lSQL + ' ,nFat';
                    lSQL := lSQL + ' ,vOrig';
                    lSQL := lSQL + ' ,vDesc';
                    lSQL := lSQL + ' ,vLiq';
                    lSQL := lSQL + ' ,nDup';
                    lSQL := lSQL + ' ,dVenc';
                    lSQL := lSQL + ' ,vDup )';
                    lSQL := lSQL + ' Values (';
                    lSQL := lSQL + ' :cCT';
                    lSQL := lSQL + ' ,:CTE_CAPA_ID ';
                    lSQL := lSQL + ' ,:nFat';
                    lSQL := lSQL + ' ,:vOrig';
                    lSQL := lSQL + ' ,:vDesc';
                    lSQL := lSQL + ' ,:vLiq';
                    lSQL := lSQL + ' ,:nDup';
                    lSQL := lSQL + ' ,:dVenc';
                    lSQL := lSQL + ' ,:vDup )';

                    qryInsert.Close;
                    qryInsert.SQL.Clear;
                    qryInsert.SQL.Add( lSQL );

                    for T := 0 to infCTeNorm.cobr.dup.Count-1 do
                    begin
                      with infCTeNorm.cobr.dup[T] do
                      begin
                       qryInsert.ParamByName('cCT').AsInteger                 := ide.cCT;
                       qryInsert.ParamByName('CTE_CAPA_ID').AsInteger         := IDENTITY_CTE_CAPA_ID;
                       qryInsert.ParamByName('nFat').AsString                 := infCTeNorm.cobr.fat.nFat;
                       qryInsert.ParamByName('vOrig').AsFloat                 := infCTeNorm.cobr.fat.vOrig;
                       qryInsert.ParamByName('vDesc').AsFloat                 := infCTeNorm.cobr.fat.vDesc;
                       qryInsert.ParamByName('vLiq').AsFloat                  := infCTeNorm.cobr.fat.vLiq;
                       qryInsert.ParamByName('nDup').AsString                 := infCTeNorm.cobr.dup[T].nDup;
                       qryInsert.ParamByName('dVenc').AsSQLTimeStamp          := DateTimeToSQLTimeStamp(infCTeNorm.cobr.dup[T].dVenc);
                       qryInsert.ParamByName('vDup').AsFloat                  := infCTeNorm.cobr.dup[T].vDup;
                      end;

                      try
                        qryInsert.ExecSQL;

                      except
                        On E:Exception do
                          begin
                //            DB_Conect.GetComando(qryInsert, frmImportarNFeEntrada, False);
                            GCambio.ExecRollBack;


                            bLog := True;
                            DB_Conect.doSaveLogImport(PastaLOG, pChar(lArquivo) + #13#10 + 'Falha ao incluir CTE_COBR.' + E.Message);
                            Continue;
                          end;
                      end;

                    end;

                    { Falta Criar a Tabela no Banco de Dados
                    lSQL := ' INSERT INTO [dbo].[CTE_VALEPED]( ';
                    lSQL := lSQL + ' cCT';
                    lSQL := lSQL + ' ,CNPJForn';
                    lSQL := lSQL + ' ,nCompra';
                    lSQL := lSQL + ' ,CNPJPg';
                    lSQL := lSQL + ' ,ID)';
                    lSQL := lSQL + ' Values (';
                    lSQL := lSQL + ' :cCT';
                    lSQL := lSQL + ' ,:CNPJForn';
                    lSQL := lSQL + ' ,:nCompra';
                    lSQL := lSQL + ' ,:CNPJPg';
                    lSQL := lSQL + ' ,:ID)';

                    for T := 0 to infCTeNorm.rodo.valePed.Count-1 do
                    begin
                      with infCTeNorm.rodo.valePed[T] do
                      begin
                       qryInsert.ParamByName('cCT').AsInteger                 := ide.cCT;
                       qryInsert.ParamByName('CNPJForn').AsString             := infCTeNorm.rodo.valePed[T].CNPJForn;
                       qryInsert.ParamByName('nCompra').AsString              := infCTeNorm.rodo.valePed[T].nCompra;
                       qryInsert.ParamByName('CNPJPg').AsString               := infCTeNorm.rodo.valePed[T].CNPJPg;
                       qryInsert.ParamByName('ID').AsInteger                  := infCTeNorm.rodo.valePed[T].ID;
                      end;

                      try
                        qryInsert.ExecSQL;

                      except
                        On E:Exception do
                          begin
                //            DB_Conect.GetComando(qryInsert, frmImportarNFeEntrada, False);
                            //GCambio.ExecRollBack;


                            bLog := True;
                            MessageDlg( pChar(lArquivo) + #13#10 + 'Falha ao incluir CTE_VALEPED.' + E.Message, mtError, [mbOK],0);
                            Continue;
                          end;
                      end;

                    end;
                   }

                   { Falta Criar a Tabela no Banco de Dados
                   lSQL := ' INSERT INTO [dbo].[CTE_ROD_VEICULO]( ';
                   lSQL := lSQL + ' cCT';
                   lSQL := lSQL + ' ,cInt';
                   lSQL := lSQL + ' ,RENAVAM';
                   lSQL := lSQL + ' ,placa';
                   lSQL := lSQL + ' ,tara';
                   lSQL := lSQL + ' ,capKG';
                   lSQL := lSQL + ' ,capM3';
                   lSQL := lSQL + ' ,tpProp';
                   lSQL := lSQL + ' ,tpVeic';
                   lSQL := lSQL + ' ,tpRod';
                   lSQL := lSQL + ' ,tpCar';
                   lSQL := lSQL + ' ,UF';
                   lSQL := lSQL + ' ,CNPJCF';
                   lSQL := lSQL + ' ,RNTRC';
                   lSQL := lSQL + ' ,xNome';
                   lSQL := lSQL + ' ,IE';
                   lSQL := lSQL + ' ,UF';
                   lSQL := lSQL + ' ,tpProp)';
                   lSQL := lSQL + ' Values(';
                   lSQL := lSQL + ' :cCT';
                   lSQL := lSQL + ' ,:cInt';
                   lSQL := lSQL + ' ,:RENAVAM';
                   lSQL := lSQL + ' ,:placa';
                   lSQL := lSQL + ' ,:tara';
                   lSQL := lSQL + ' ,:capKG';
                   lSQL := lSQL + ' ,:capM3';
                   lSQL := lSQL + ' ,:tpProp';
                   lSQL := lSQL + ' ,:tpVeic';
                   lSQL := lSQL + ' ,:tpRod';
                   lSQL := lSQL + ' ,:tpCar';
                   lSQL := lSQL + ' ,:UF';
                   lSQL := lSQL + ' ,:CNPJCF';
                   lSQL := lSQL + ' ,:RNTRC';
                   lSQL := lSQL + ' ,:xNome';
                   lSQL := lSQL + ' ,:IE';
                   lSQL := lSQL + ' ,:UF';
                   lSQL := lSQL + ' ,:tpProp)';


                    for T := 0 to infCTeNorm.rodo.veic.Count-1 do
                    begin
                      with infCTeNorm.rodo.veic[T] do
                      begin
                       qryInsert.ParamByName('cCT').AsInteger                 := ide.cCT;
                       qryInsert.ParamByName('cInt').AsString                 := infCTeNorm.rodo.veic[T].cInt;
                       qryInsert.ParamByName('RENAVAM').AsString              := infCTeNorm.rodo.veic[T].RENAVAM;
                       qryInsert.ParamByName('placa').AsString                := infCTeNorm.rodo.veic[T].placa;
                       qryInsert.ParamByName('tara').AsInteger                := infCTeNorm.rodo.veic[T].tara;
                       qryInsert.ParamByName('capKG').AsInteger               := infCTeNorm.rodo.veic[T].capKG;
                       qryInsert.ParamByName('capM3').AsInteger               := infCTeNorm.rodo.veic[T].capM3;
                       qryInsert.ParamByName('tpProp').AsString               := TpPropriedadeToStr(infCTeNorm.rodo.veic[T].tpProp);
                       qryInsert.ParamByName('tpVeic').AsString               := TpVeiculoToStr(infCTeNorm.rodo.veic[T].tpVeic);
                       qryInsert.ParamByName('tpRod').AsString                := TpRodadoToStr(infCTeNorm.rodo.veic[T].tpRod);
                       qryInsert.ParamByName('tpCar').AsString                := TpCarroceriaToStr(infCTeNorm.rodo.veic[T].tpCar);
                       qryInsert.ParamByName('UF').AsString                   := infCTeNorm.rodo.veic[T].UF;
                       qryInsert.ParamByName('CNPJCF').AsString               := infCTeNorm.rodo.veic[T].Prop.CNPJCPF;
                       qryInsert.ParamByName('RNTRC').AsString                := infCTeNorm.rodo.veic[T].Prop.RNTRC;
                       qryInsert.ParamByName('xNome').AsString                := infCTeNorm.rodo.veic[T].Prop.xNome;
                       qryInsert.ParamByName('IE').AsString                   := infCTeNorm.rodo.veic[T].Prop.IE;
                       qryInsert.ParamByName('UF').AsString                   := infCTeNorm.rodo.veic[T].Prop.UF;
                       qryInsert.ParamByName('tpProp').AsString               := TpPropToStr(infCTeNorm.rodo.veic[T].Prop.tpProp);
                      end;

                      try
                        qryInsert.ExecSQL;

                      except
                        On E:Exception do
                          begin
                //            DB_Conect.GetComando(qryInsert, frmImportarNFeEntrada, False);
                            //GCambio.ExecRollBack;


                            bLog := True;
                            MessageDlg( pChar(lArquivo) + #13#10 + 'Falha ao incluir CTE_ROD_VEICULO.' + E.Message, mtError, [mbOK],0);
                            Continue;
                          end;
                      end;

                    end;
                   }


                    {


                    infCTeNorm.rodoOS.TAF;
                    infCTeNorm.rodoOS.NroRegEstadual;
                    infCTeNorm.rodoOS.veic.placa;
                    infCTeNorm.rodoOS.veic.RENAVAM;
                    infCTeNorm.rodoOS.veic.prop;
                    infCTeNorm.rodoOS.veic.UF;

                    infCTeNorm.aquav.vPrest;
                    infCTeNorm.aquav.vAFRMM;
                    infCTeNorm.aquav.nBooking;
                    infCTeNorm.aquav.nCtrl;
                    infCTeNorm.aquav.xNavio;
                    infCTeNorm.aquav.balsa[0].ID;
                    infCTeNorm.aquav.balsa[0].xBalsa;
                    infCTeNorm.aquav.nViag;
                    infCTeNorm.aquav.direc;
                    infCTeNorm.aquav.prtEmb;
                    infCTeNorm.aquav.prtTrans;
                    infCTeNorm.aquav.prtDest;
                    infCTeNorm.aquav.tpNav;
                    infCTeNorm.aquav.irin;
                    infCTeNorm.aquav.detCont[0].nCont;
                    infCTeNorm.aquav.detCont[0].Lacre[0].nLacre;
                    infCTeNorm.aquav.detCont[0].Lacre[0].ID;
                    infCTeNorm.aquav.detCont[0].infDoc.infNF[0].serie;
                    infCTeNorm.aquav.detCont[0].infDoc.infNF[0].nDoc;
                    infCTeNorm.aquav.detCont[0].infDoc.infNF[0].unidRat;
                    infCTeNorm.aquav.detCont[0].infDoc.infNF[0].ID;

                    infCTeNorm.ferrov.tpTraf;
                    infCTeNorm.ferrov.trafMut.respFat;
                    infCTeNorm.ferrov.trafMut.ferrEmi;
                    infCTeNorm.ferrov.fluxo;
                    infCTeNorm.ferrov.idTrem;
                    infCTeNorm.ferrov.vFrete;
                    infCTeNorm.ferrov.ferroEnv[0].CNPJ;
                    infCTeNorm.ferrov.ferroEnv[0].cInt;
                    infCTeNorm.ferrov.ferroEnv[0].IE;
                    infCTeNorm.ferrov.ferroEnv[0].xNome;
                    infCTeNorm.ferrov.ferroEnv[0].enderFerro.xLgr;
                    infCTeNorm.ferrov.ferroEnv[0].enderFerro.nro;
                    infCTeNorm.ferrov.ferroEnv[0].enderFerro.xCpl;
                    infCTeNorm.ferrov.ferroEnv[0].enderFerro.xBairro;
                    infCTeNorm.ferrov.ferroEnv[0].enderFerro.cMun;
                    infCTeNorm.ferrov.ferroEnv[0].enderFerro.xMun;
                    infCTeNorm.ferrov.ferroEnv[0].enderFerro.CEP;
                    infCTeNorm.ferrov.ferroEnv[0].enderFerro.UF;
                    infCTeNorm.ferrov.detVag[0].nVag;
                    infCTeNorm.ferrov.detVag[0].cap;
                    infCTeNorm.ferrov.detVag[0].tpVag;
                    infCTeNorm.ferrov.detVag[0].pesoR;
                    infCTeNorm.ferrov.detVag[0].pesoBC;
                    infCTeNorm.ferrov.detVag[0].ID;

                    infCTeNorm.duto.vTar;
                    infCTeNorm.duto.dIni;
                    infCTeNorm.duto.dFim;

                    infCTeNorm.multimodal.COTM;
                    infCTeNorm.multimodal.indNegociavel;
                    infCTeNorm.peri[0].nONU;
                    infCTeNorm.peri[0].xNomeAE;
                    infCTeNorm.peri[0].xClaRisco;
                    infCTeNorm.peri[0].grEmb;
                    infCTeNorm.peri[0].qTotProd;
                    infCTeNorm.peri[0].qVolTipo;
                    infCTeNorm.peri[0].pontoFulgor;


                    infCTeNorm.veicNovos[0].cCor;
                    infCTeNorm.veicNovos[0].xCor;
                    infCTeNorm.veicNovos[0].cMod;
                    infCTeNorm.veicNovos[0].vUnit;
                    infCTeNorm.veicNovos[0].vFrete;

                    infCTeNorm.cobr.fat;
                    infCTeNorm.cobr.dup[0].nDup;
                    infCTeNorm.cobr.dup[0].dVenc;
                    infCTeNorm.cobr.dup[0].vDup;

                    infCTeNorm.infCteSub.chCte;
                    infCTeNorm.infCteSub.refCteAnu;
                    infCTeNorm.infCteSub.tomaICMS;
                    infCTeNorm.infCteSub.tomaNaoICMS;

                    infCTeNorm.infCteSub.indAlteraToma.tiSim;

                     }


                    // Guardar Arquivo XML
                    try
                      lSQL := 'insert into XML_IMPORTADA(cCT, CTE_CAPA_ID, DataEmissao,nCT,CHCTE,CodUsuario, TipoXML, ArquivoXML)';
                      lSQL := lSQL + ' values( :cCT, :CTE_CAPA_ID, :DataEmissao,:nCT,:CHCTE,:CodUsuario, :TipoXML';
                      lSQL := lSQL + ',' + QuotedStr( ACBrCTe.Conhecimentos.Items[0].XML );
                      lSQL := lSQL + ')';

                      qryInsert.Close;
                      qryInsert.SQL.Clear;
                      qryInsert.SQL.Add( lSQL );

                      qryInsert.ParamByName('cCT').asInteger               := ide.cCT;
                      qryInsert.ParamByName('CTE_CAPA_ID').AsInteger       := IDENTITY_CTE_CAPA_ID;
                      qryInsert.ParamByName('DataEmissao').AsSQLTimeStamp  := DateTimeToSQLTimeStamp(Ide.dhEmi);
                      qryInsert.ParamByName('nCT').AsString                := IntToStr(Ide.nCT);
                      qryInsert.ParamByName('CHCTE').AsString              := procCTe.chCTe;
                      qryInsert.ParamByName('CodUsuario').AsString         := GUsuario;
                      qryInsert.ParamByName('TipoXML').AsString            := 'CTE';

                    finally

                      try
                        qryInsert.ExecSQL;

                        MoveFile( PWideChar( lArquivo ) , PWideChar( lArquivoImportado ) );


                      except
                        On E:Exception do
                          begin
                            GCambio.ExecRollBack;
                            bLog := True;
                            DB_Conect.doSaveLogImport(PastaLOG, 'Falha ao incluir CTe.' + E.Message);

                          end;
                      end;

                    end;
                    // Fim Guarda Arquivo XML

                    GCambio.ExecCommit;

                   end;
           end
           else
           if  ACBrNFe.NotasFiscais.LoadFromFile( lArquivo ) Then
           begin
                  GCambio.BeginTrans;
                  with ACBrNFe.NotasFiscais.Items[0].NFe do
                  begin
                   lSQL := ' INSERT INTO CTE_PROTOCOLO (';
                   lSQL := lSQL + ' ID,  ';
                   lSQL := lSQL + ' tpAmb, ';
                   lSQL := lSQL + ' verAplic, ';
                   lSQL := lSQL + ' chCTe, ';
                   lSQL := lSQL + ' dhRecbto, ';
                   lSQL := lSQL + ' nProt,  ';
                   lSQL := lSQL + ' digVal, ';
                   lSQL := lSQL + ' cStat, ';
                   lSQL := lSQL + ' xMotivo, ';
                   lSQL := lSQL + ' nCT, ';
                   lSQL := lSQL + ' cCT ';
                   lSQL := lSQL + ' ) VALUES  ( ';
                   lSQL := lSQL + ' :ID,  ';
                   lSQL := lSQL + ' :tpAmb, ';
                   lSQL := lSQL + ' :verAplic, ';
                   lSQL := lSQL + ' :chCTe, ';
                   lSQL := lSQL + ' :dhRecbto, ';
                   lSQL := lSQL + ' :nProt,  ';
                   lSQL := lSQL + ' :digVal, ';
                   lSQL := lSQL + ' :cStat, ';
                   lSQL := lSQL + ' :xMotivo, ';
                   lSQL := lSQL + ' :nCT, ';
                   lSQL := lSQL + ' :cCT) ';

                   qryInsert.Close;
                   qryInsert.SQL.Clear;
                   qryInsert.SQL.Add( lSQL );

                   qryInsert.ParamByName('ID').AsString                        := infNFe.ID;
                   qryInsert.ParamByName('tpAmb').AsString                     := TpAmbToStr(procNFe.tpAmb);
                   qryInsert.ParamByName('verAplic').AsString                  := procNFe.verAplic;
                   qryInsert.ParamByName('chCTe').AsString                     := procNFe.chNFe;
                   qryInsert.ParamByName('dhRecbto').AsSQLTimeStamp            := DateTimeToSQLTimeStamp(procNFe.dhRecbto);
                   qryInsert.ParamByName('nProt').AsString                     := procNFe.nProt;
                   qryInsert.ParamByName('digVal').AsString                    := procNFe.digVal;
                   qryInsert.ParamByName('cStat').AsString                     := IntToStr(procNFe.cStat);
                   qryInsert.ParamByName('xMotivo').AsString                   := procNFe.xMotivo;
                   qryInsert.ParamByName('nCT').AsString                       := IntToStr(ide.nNF);
                   qryInsert.ParamByName('cCT').AsInteger                      := ide.cNF;
                   try
                     qryInsert.ExecSQL;

                   except
                     On E:Exception do
                       begin
             //            DB_Conect.GetComando(qryInsert, frmImportarNFeEntrada, False);
                         GCambio.ExecRollBack;


                         bLog := True;
                         DB_Conect.doSaveLogImport(PastaLOG, pChar(lArquivo)  + ' - Falha ao incluir CTE_PROTOCOLO.' + E.Message);
                         Continue;
                       end;
                   end;

                   QryAux.Close;
                   QryAux.SQL.Clear;
                   QryAux.SQL.Add('Select CTE_FILIAL_ID from CTE_FILIAL Where cnpj = :cnpj');
                   QryAux.ParamByName('cnpj').AsString := Dest.CNPJCPF;
                   QryAux.Open;

                   pNovoCFOP := '';
                   if qryAux.IsEmpty then
                   begin
                        QryAux.Close;
                        QryAux.SQL.Clear;
                        QryAux.SQL.Add('Select CTE_FILIAL_ID from CTE_FILIAL Where cnpj = :cnpj');
                        QryAux.ParamByName('cnpj').AsString := Emit.CNPJCPF;
                        QryAux.Open;
                        if not QryAux.IsEmpty then
                           OrigemDaNota := 'S'

                        else
                        begin
                            GCambio.ExecRollBack;

                            bLog := True;
                            DB_Conect.doSaveLogImport(PastaLOG, pChar(lArquivo)  + ' - CNPJ N�o Cadastrado.');
                            Continue;
                        end;
                   end
                   else
                   begin
                      OrigemDaNota := 'E';
                   end;

                   varFilialID :=  QryAux.FieldByName('CTE_FILIAL_ID').AsString;

                   lSQL := ' INSERT INTO CTE_CAPA (';
                   lSQL := lSQL + ' CTE_FILIAL_ID ';
                   lSQL := lSQL + ' ,cUF ';
                   lSQL := lSQL + ' ,cCT';
                   lSQL := lSQL + ' ,CFOP';
                   lSQL := lSQL + ' ,natOp';
                   lSQL := lSQL + ' ,forPag';
                   lSQL := lSQL + ' ,mod_';
                   lSQL := lSQL + ' ,serie';
                   lSQL := lSQL + ' ,nCT';
                   lSQL := lSQL + ' ,dhEmi';
                   lSQL := lSQL + ' ,tpImp';
                   lSQL := lSQL + ' ,tpEmis';
                   lSQL := lSQL + ' ,cDV';
                   lSQL := lSQL + ' ,tpAmb';
                   lSQL := lSQL + ' ,tpCTe';
                   lSQL := lSQL + ' ,procEmi';
                   lSQL := lSQL + ' ,verProc';
                   lSQL := lSQL + ' ,cMunEnv';
                   lSQL := lSQL + ' ,xMunEnv';
                   lSQL := lSQL + ' ,UFEnv';
                   lSQL := lSQL + ' ,modal';
                   lSQL := lSQL + ' ,tpServ';
                   lSQL := lSQL + ' ,cMunIni';
                   lSQL := lSQL + ' ,xMunIni';
                   lSQL := lSQL + ' ,UFIni';
                   lSQL := lSQL + ' ,cMunFim';
                   lSQL := lSQL + ' ,xMunFim';
                   lSQL := lSQL + ' ,UFFim';
                   lSQL := lSQL + ' ,retira';
                   lSQL := lSQL + ' ,toma03';
                   lSQL := lSQL + ' ,xCaracAd';
                   lSQL := lSQL + ' ,xCaracSer';
                   lSQL := lSQL + ' ,xEmi';
                   lSQL := lSQL + ' ,xOrig';
                   lSQL := lSQL + ' ,xDest';
                   lSQL := lSQL + ' ,tpPer';
                   lSQL := lSQL + ' ,dProg';
                   lSQL := lSQL + ' ,tpHor';
                   lSQL := lSQL + ' ,hProg';
                   lSQL := lSQL + ' ,OrigemNota';
                   lSQL := lSQL + ' ,xObs)';
                   lSQL := lSQL + ' VALUES ';
                   lSQL := lSQL + ' ( :CTE_FILIAL_ID,';
                   lSQL := lSQL + '  :cUF,';
                   lSQL := lSQL + '  :cCT, ';
                   lSQL := lSQL + '  :CFOP, ';
                   lSQL := lSQL + '  :natOp, ';
                   lSQL := lSQL + '  :forPag, ';
                   lSQL := lSQL + '  :mod_, ';
                   lSQL := lSQL + '  :serie, ';
                   lSQL := lSQL + '  :nCT, ';
                   lSQL := lSQL + '  :dhEmi, ';
                   lSQL := lSQL + '  :tpImp, ';
                   lSQL := lSQL + '  :tpEmis, ';
                   lSQL := lSQL + '  :cDV, ';
                   lSQL := lSQL + '  :tpAmb, ';
                   lSQL := lSQL + '  :tpCTe, ';
                   lSQL := lSQL + '  :procEmi, ';
                   lSQL := lSQL + '  :verProc, ';
                   lSQL := lSQL + '  :cMunEnv, ';
                   lSQL := lSQL + '  :xMunEnv,';
                   lSQL := lSQL + '  :UFEnv, ';
                   lSQL := lSQL + '  :modal, ';
                   lSQL := lSQL + '  :tpServ, ';
                   lSQL := lSQL + '  :cMunIni, ';
                   lSQL := lSQL + '  :xMunIni, ';
                   lSQL := lSQL + '  :UFIni, ';
                   lSQL := lSQL + '  :cMunFim, ';
                   lSQL := lSQL + '  :xMunFim, ';
                   lSQL := lSQL + '  :UFFim, ';
                   lSQL := lSQL + '  :retira, ';
                   lSQL := lSQL + '  :toma03, ';
                   lSQL := lSQL + '  :xCaracAd, ';
                   lSQL := lSQL + '  :xCaracSer, ';
                   lSQL := lSQL + '  :xEmi, ';
                   lSQL := lSQL + '  :xOrig, ';
                   lSQL := lSQL + '  :xDest, ';
                   lSQL := lSQL + '  :tpPer, ';
                   lSQL := lSQL + '  :dProg, ';
                   lSQL := lSQL + '  :tpHor, ';
                   lSQL := lSQL + '  :hProg, ';
                   lSQL := lSQL + '  :OrigemNota,';
                   lSQL := lSQL + '  :xObs) ';

                   qryInsert.Close;
                   qryInsert.SQL.Clear;
                   qryInsert.SQL.Add( lSQL );

                   qryInsert.ParamByName('CTE_FILIAL_ID').AsString           := varFilialID;
                   qryInsert.ParamByName('cUF').AsString                     := IntToStr(Ide.cUF);
                   qryInsert.ParamByName('cCT').AsInteger                    := ide.nNF;
                   qryInsert.ParamByName('CFOP').AsString                    := '';
                   qryInsert.ParamByName('natOp').AsString                   := ide.natOp;
                   qryInsert.ParamByName('forPag').AsString                  := '';
                   qryInsert.ParamByName('mod_').AsString                    := IntToStr(ide.modelo);
                   qryInsert.ParamByName('serie').AsString                   := IntToStr(ide.serie);
                   qryInsert.ParamByName('nCT').AsString                     := IntToStr(ide.nNF);
                   qryInsert.ParamByName('dhEmi').AsSQLTimeStamp             := DateTimeToSQLTimeStamp(ide.dEmi);
                   qryInsert.ParamByName('tpImp').AsString                   := TpImpToStr(ide.tpImp);
                   qryInsert.ParamByName('tpEmis').AsString                  := TpEmisToStr(ide.tpEmis);
                   qryInsert.ParamByName('cDV').AsString                     := IntToStr(ide.cDV);
                   qryInsert.ParamByName('tpAmb').AsString                   := TpAmbToStr(ide.tpAmb);
                   qryInsert.ParamByName('tpCTe').AsString                   := '';
                   qryInsert.ParamByName('procEmi').AsString                 := procEmiToStr(ide.procEmi);
                   qryInsert.ParamByName('verProc').AsString                 := ide.verProc;
                   qryInsert.ParamByName('cMunEnv').AsString                 := InTToStr(Dest.EnderDest.cMun);
                   qryInsert.ParamByName('xMunEnv').AsString                 := Dest.EnderDest.xMun;
                   qryInsert.ParamByName('UFEnv').AsString                   := Dest.EnderDest.UF;
                   qryInsert.ParamByName('modal').AsString                   := '';
                   qryInsert.ParamByName('tpServ').AsString                  := '';
                   qryInsert.ParamByName('cMunIni').AsInteger                := Emit.EnderEmit.cMun;
                   qryInsert.ParamByName('xMunIni').AsString                 := Emit.EnderEmit.xMun;
                   qryInsert.ParamByName('UFIni').AsString                   := Emit.EnderEmit.UF;
                   qryInsert.ParamByName('cMunFim').AsInteger                := Dest.EnderDest.cMun;
                   qryInsert.ParamByName('xMunFim').AsString                 := Dest.EnderDest.xMun;
                   qryInsert.ParamByName('UFFim').AsString                   := Dest.EnderDest.UF;
                   qryInsert.ParamByName('retira').AsString                  := '';
                   qryInsert.ParamByName('toma03').AsString                  := '';
                   qryInsert.ParamByName('xCaracAd').AsString                := '' ;
                   qryInsert.ParamByName('xCaracSer').AsString               := '';
                   qryInsert.ParamByName('xEmi').AsString                    := '';
                   qryInsert.ParamByName('xOrig').AsString                   := '';
                   qryInsert.ParamByName('xDest').AsString                   := '';
                   qryInsert.ParamByName('tpPer').AsString                   := '';
                   qryInsert.ParamByName('dProg').AsSQLTimeStamp             := DateTimeToSQLTimeStamp(Date);
                   qryInsert.ParamByName('tpHor').AsString                   := '';
                   qryInsert.ParamByName('hProg').AsSQLTimeStamp             := DateTimeToSQLTimeStamp(Date);
                   qryInsert.ParamByName('OrigemNota').AsString              := OrigemDaNota;
                   qryInsert.ParamByName('xObs').AsString                    := '';
                   try
                     qryInsert.ExecSQL;

                   except
                     On E:Exception do
                       begin
                         GCambio.ExecRollBack;
                         bLog := True;
                         DB_Conect.doSaveLogImport(PastaLOG, pChar(lArquivo) + #13#10 + 'Falha ao incluir CTE_CAPA.' + E.Message);
                         Continue;
                       end;
                   end;

                   Try
                     IDENTITY_CTE_CAPA_ID := 0;
                     lSQL  := 'SELECT @@IDENTITY as CTE_CAPA_ID ';

                     qryInsert.Close;
                     qryInsert.SQL.Clear;
                     qryInsert.SQL.Add( lSQL );
                     qryInsert.Open;
                     IDENTITY_CTE_CAPA_ID := qryInsert.FieldByName('CTE_CAPA_ID').AsInteger;

                   except
                     On E:Exception do
                       begin
                          bLog := True;
                          DB_Conect.doSaveLogImport(PastaLOG, Db_Conect.GetComando(qryInsert) + #13#10 + 'Falha ao pegar chave da CTE_CAPA_ID.' + E.Message);
                          Continue;
                        end;
                   end;

                   //if OrigemDaNota = 'E' then
                   RetornarCodigoFornecedorNFE(Emit, IntToStr(ide.nNF));

                   RetornarCodigoDestinatarioNFE(Dest, IntToStr(ide.nNF));
                  {

                   lSQL := ' INSERT INTO [dbo].[CTE_EMITENTE]( ';
                   lSQL := lSQL + ' cCT ';
                   lSQL := lSQL + ',CTE_CAPA_ID ';
                   lSQL := lSQL + ',CNPJCPF';
                   lSQL := lSQL + ',IE';
                   lSQL := lSQL + ',IEST';
                   lSQL := lSQL + ',xNome';
                   lSQL := lSQL + ',xFant';
                   lSQL := lSQL + ',Fone';
                   lSQL := lSQL + ',xCpl';
                   lSQL := lSQL + ',xLgr';
                   lSQL := lSQL + ',nro';
                   lSQL := lSQL + ',xBairro';
                   lSQL := lSQL + ',cMun';
                   lSQL := lSQL + ',xMun';
                   lSQL := lSQL + ',CEP';
                   lSQL := lSQL + ',UF)';
                   lSQL := lSQL + ' VALUES ( ' ;
                   lSQL := lSQL + ':cCT ';
                   lSQL := lSQL + ' ,:CTE_CAPA_ID ';
                   lSQL := lSQL +',:CNPJCPF ';
                   lSQL := lSQL +',:IE ';
                   lSQL := lSQL +',:IEST ';
                   lSQL := lSQL +',:xNome ';
                   lSQL := lSQL +',:xFant ';
                   lSQL := lSQL +',:Fone ';
                   lSQL := lSQL +',:xCpl ';
                   lSQL := lSQL +',:xLgr ';
                   lSQL := lSQL +',:nro ';
                   lSQL := lSQL +',:xBairro ';
                   lSQL := lSQL +',:cMun';
                   lSQL := lSQL +',:xMun';
                   lSQL := lSQL +',:CEP';
                   lSQL := lSQL +',:UF)';

                   qryInsert.Close;
                   qryInsert.SQL.Clear;
                   qryInsert.SQL.Add( lSQL );

                   qryInsert.ParamByName('cCT').AsInteger                    := ide.nNF;
                   qryInsert.ParamByName('CTE_CAPA_ID').AsInteger            := IDENTITY_CTE_CAPA_ID;
                   qryInsert.ParamByName('CNPJCPF').AsString                 := Emit.CNPJCPF;
                   qryInsert.ParamByName('IE').AsString                      := Emit.IE;
                   qryInsert.ParamByName('IEST').AsString                    := Emit.IEST;
                   qryInsert.ParamByName('xNome').AsString                   := Emit.xNome;
                   qryInsert.ParamByName('xFant').AsString                   := Copy(Emit.xFant,1,40);
                   qryInsert.ParamByName('Fone').AsString                    := Emit.EnderEmit.fone;
                   qryInsert.ParamByName('xCpl').AsString                    := Emit.EnderEmit.xCpl;
                   qryInsert.ParamByName('xLgr').AsString                    := Emit.EnderEmit.xLgr;
                   qryInsert.ParamByName('nro').AsString                     := Emit.EnderEmit.nro;
                   qryInsert.ParamByName('xBairro').AsString                 := Emit.EnderEmit.xBairro;
                   qryInsert.ParamByName('cMun').AsString                    := IntToStr(Emit.EnderEmit.cMun);
                   qryInsert.ParamByName('xMun').AsString                    := Emit.EnderEmit.xMun;

                   qryInsert.ParamByName('CEP').AsString                     := IntToStr(Emit.EnderEmit.CEP);
                   qryInsert.ParamByName('UF').AsString                      := Emit.EnderEmit.UF;

                   try
                     qryInsert.ExecSQL;

                   except
                     On E:Exception do
                       begin
             //            DB_Conect.GetComando(qryInsert, frmImportarNFeEntrada, False);
                         GCambio.ExecRollBack;


                         bLog := True;
                         DB_Conect.doSaveLogImport(PastaLOG, pChar(lArquivo) + #13#10 + 'Falha ao incluir CTE_EMITENTE.' + E.Message);
                         Continue;
                       end;
                   end;

                   tpRetorno.Inicializar;
                   Try

                     lSQL  := 'SELECT @@IDENTITY as CTE_EMITENTE_ID ';

                     qryAux.Close;
                     qryAux.SQL.Clear;
                     qryAux.SQL.Add( lSQL );
                     qryAux.Open;
                     tpRetorno.trCodFornecedor := qryAux.FieldByName('CTE_EMITENTE_ID').AsString;

                   except
                     On E:Exception do
                       begin
                          DB_Conect.doSaveLogImport(PastaLOG, Db_Conect.GetComando(qryInsert) + #13#10 + 'Falha ao pegar chave da CTE_EMITENTE_ID.' + E.Message);
                          Continue;
                        end;
                   end;
                    }

                   Try

                     lSQL  := 'UPDATE CTE_CAPA SET CODFORNECEDOR = :CODFORNECEDOR, CODDESTINATARIO = :CODDESTINATARIO WHERE CTE_CAPA_ID = :CTE_CAPA_ID';

                     qryAux.Close;
                     qryAux.SQL.Clear;
                     qryAux.SQL.Add( lSQL );
                     qryAux.ParamByName('CODFORNECEDOR').AsString   := tpRetornoEmitente.trCodigo;
                     qryAux.ParamByName('CODDESTINATARIO').AsString := tpRetornoDestinatario.trCodigo;

                     qryAux.ParamByName('CTE_CAPA_ID').AsInteger   := IDENTITY_CTE_CAPA_ID;
                     qryAux.ExecSQL;

                   except
                     On E:Exception do
                       begin
                          DB_Conect.doSaveLogImport(PastaLOG, Db_Conect.GetComando(qryInsert) + #13#10 + 'Falha ao pegar chave da CTE_EMITENTE_ID.' + E.Message);
                          Continue;
                        end;
                   end;
                   {
                   lSQL := ' INSERT INTO [dbo].[CTE_Destinatario]( ';
                   lSQL := lSQL + ' cCT ';
                   lSQL := lSQL + ' ,CTE_CAPA_ID ';
                   lSQL := lSQL + ',CNPJ';
                   lSQL := lSQL + ',IE';
                //   lSQL := lSQL + ',IEST';
                   lSQL := lSQL + ',xNome';
               //    lSQL := lSQL + ',xFant';
                //   lSQL := lSQL + ',Fone';
                   lSQL := lSQL + ',xCpl';
                   lSQL := lSQL + ',xLgr';
                   lSQL := lSQL + ',nro';
                   lSQL := lSQL + ',xBairro';
                   lSQL := lSQL + ',cMun';
                   lSQL := lSQL + ',xMun';
                   lSQL := lSQL + ',CEP';
                   lSQL := lSQL + ',UF)';
                   lSQL := lSQL + ' VALUES ( ' ;
                   lSQL := lSQL + ':cCT ';
                   lSQL := lSQL + ' ,:CTE_CAPA_ID ';
                   lSQL := lSQL +',:CNPJ ';
                   lSQL := lSQL +',:IE ';
              //     lSQL := lSQL +',:IEST ';
                   lSQL := lSQL +',:xNome ';
            //       lSQL := lSQL +',:xFant ';
          //         lSQL := lSQL +',:Fone ';
                   lSQL := lSQL +',:xCpl ';
                   lSQL := lSQL +',:xLgr ';
                   lSQL := lSQL +',:nro ';
                   lSQL := lSQL +',:xBairro ';
                   lSQL := lSQL +',:cMun';
                   lSQL := lSQL +',:xMun';
                   lSQL := lSQL +',:CEP';
                   lSQL := lSQL +',:UF)';

                   qryInsert.Close;
                   qryInsert.SQL.Clear;
                   qryInsert.SQL.Add( lSQL );

                   qryInsert.ParamByName('cCT').AsInteger                    := ide.nNF;
                   qryInsert.ParamByName('CTE_CAPA_ID').AsInteger            := IDENTITY_CTE_CAPA_ID;
                   qryInsert.ParamByName('CNPJ').AsString                    := Dest.CNPJCPF;
                   qryInsert.ParamByName('IE').AsString                      := Dest.IE;
                  // qryInsert.ParamByName('IEST').AsString                    := Dest.IEST;
                   qryInsert.ParamByName('xNome').AsString                   := Dest.xNome;
        //           qryInsert.ParamByName('xFant').AsString                   := Dest.xFant;
        //           qryInsert.ParamByName('Fone').AsString                    := Dest.enderDest.fone;
                   qryInsert.ParamByName('xCpl').AsString                    := Dest.enderDest.xCpl;
                   qryInsert.ParamByName('xLgr').AsString                    := Dest.enderDest.xLgr;
                   qryInsert.ParamByName('nro').AsString                     := Dest.enderDest.nro;
                   qryInsert.ParamByName('xBairro').AsString                 := Dest.enderDest.xBairro;
                   qryInsert.ParamByName('cMun').AsString                    := IntToStr(Dest.enderDest.cMun);
                   qryInsert.ParamByName('xMun').AsString                    := Dest.enderDest.xMun;

                   qryInsert.ParamByName('CEP').AsString                     := IntToStr(Dest.enderDest.CEP);
                   qryInsert.ParamByName('UF').AsString                      := Dest.enderDest.UF;

                   try
                     qryInsert.ExecSQL;

                   except
                     On E:Exception do
                       begin
             //            DB_Conect.GetComando(qryInsert, frmImportarNFeEntrada, False);
                         GCambio.ExecRollBack;


                         bLog := True;
                         DB_Conect.doSaveLogImport(PastaLOG, pChar(lArquivo) + #13#10 + 'Falha ao incluir CTE_Destinatario.' + E.Message);
                         Continue;
                       end;
                   end;
                    }


                   lSQL := ' INSERT INTO [dbo].[CTE_Remetente]( ';
                   lSQL := lSQL + ' cCT ';
                   lSQL := lSQL + ',CTE_CAPA_ID ';
                   lSQL := lSQL + ',CNPJ';
                   lSQL := lSQL + ',IE';
                //   lSQL := lSQL + ',IEST';
                   lSQL := lSQL + ',xNome';
               //    lSQL := lSQL + ',xFant';
                //   lSQL := lSQL + ',Fone';
                   lSQL := lSQL + ',xCpl';
                   lSQL := lSQL + ',xLgr';
                   lSQL := lSQL + ',nro';
                   lSQL := lSQL + ',xBairro';
                   lSQL := lSQL + ',cMun';
                   lSQL := lSQL + ',xMun';
                   lSQL := lSQL + ',CEP';
                   lSQL := lSQL + ',UF';
                   lSQL := lSQL + ',Email)';

                   lSQL := lSQL + ' VALUES ( ' ;
                   lSQL := lSQL + ':cCT ';
                   lSQL := lSQL + ' ,:CTE_CAPA_ID ';
                   lSQL := lSQL +',:CNPJ ';
                   lSQL := lSQL +',:IE ';
              //     lSQL := lSQL +',:IEST ';
                   lSQL := lSQL +',:xNome ';
            //       lSQL := lSQL +',:xFant ';
          //         lSQL := lSQL +',:Fone ';
                   lSQL := lSQL +',:xCpl ';
                   lSQL := lSQL +',:xLgr ';
                   lSQL := lSQL +',:nro ';
                   lSQL := lSQL +',:xBairro ';
                   lSQL := lSQL +',:cMun';
                   lSQL := lSQL +',:xMun';
                   lSQL := lSQL +',:CEP';
                   lSQL := lSQL +',:UF';
                   lSQL := lSQL +',:Email)';

                   qryInsert.Close;
                   qryInsert.SQL.Clear;
                   qryInsert.SQL.Add( lSQL );

                   qryInsert.ParamByName('cCT').AsInteger                    := ide.nNF;
                   qryInsert.ParamByName('CTE_CAPA_ID').AsInteger            := IDENTITY_CTE_CAPA_ID;
                   qryInsert.ParamByName('CNPJ').AsString                    := Emit.CNPJCPF;
                   qryInsert.ParamByName('IE').AsString                      := Emit.IE;
                  // qryInsert.ParamByName('IEST').AsString                    := Dest.IEST;
                   qryInsert.ParamByName('xNome').AsString                   := Emit.xNome;
        //           qryInsert.ParamByName('xFant').AsString                   := Dest.xFant;
        //           qryInsert.ParamByName('Fone').AsString                    := Dest.enderDest.fone;
                   qryInsert.ParamByName('xCpl').AsString                    := Emit.EnderEmit.xCpl;
                   qryInsert.ParamByName('xLgr').AsString                    := Emit.EnderEmit.xLgr;
                   qryInsert.ParamByName('nro').AsString                     := Emit.EnderEmit.nro;
                   qryInsert.ParamByName('xBairro').AsString                 := Emit.EnderEmit.xBairro;
                   qryInsert.ParamByName('cMun').AsString                    := IntToStr(Emit.EnderEmit.cMun);
                   qryInsert.ParamByName('xMun').AsString                    := Emit.EnderEmit.xMun;

                   qryInsert.ParamByName('CEP').AsString                     := IntToStr(Emit.EnderEmit.CEP);
                   qryInsert.ParamByName('UF').AsString                      := Emit.EnderEmit.UF;
                   qryInsert.ParamByName('Email').AsString                   := '';


                   try
                     qryInsert.ExecSQL;

                   except
                     On E:Exception do
                       begin
             //            DB_Conect.GetComando(qryInsert, frmImportarNFeEntrada, False);
                         GCambio.ExecRollBack;


                         bLog := True;
                         DB_Conect.doSaveLogImport(PastaLOG, pChar(lArquivo) + #13#10 + 'Falha ao incluir CTE_Remetente.' + E.Message);
                         Continue;
                       end;
                   end;

                   lSQL := ' INSERT INTO [dbo].[CTE_VPrest]( ';
                   lSQL := lSQL + ' cCT ';
                   lSQL := lSQL + ' ,CTE_CAPA_ID ';
                   lSQL := lSQL + ' ,vTPrest ';
                   lSQL := lSQL + ' ,vRec )';
                   lSQL := lSQL + ' Values (';
                   lSQL := lSQL + ' :cCT ';
                   lSQL := lSQL + ' ,:CTE_CAPA_ID ';
                   lSQL := lSQL + ' ,:vTPrest ';
                   lSQL := lSQL + ' ,:vRec )';

                   qryInsert.Close;
                   qryInsert.SQL.Clear;
                   qryInsert.SQL.Add( lSQL );

                   qryInsert.ParamByName('cCT').AsInteger                    := ide.nNF;
                   qryInsert.ParamByName('CTE_CAPA_ID').AsInteger            := IDENTITY_CTE_CAPA_ID;
                   qryInsert.ParamByName('vTPrest').asFloat                  := Total.ICMSTot.vNF;
                   qryInsert.ParamByName('vRec').asFloat                     := Total.ICMSTot.vNF;

                   try
                     qryInsert.ExecSQL;

                   except
                     On E:Exception do
                       begin
                         GCambio.ExecRollBack;


                         bLog := True;
                         DB_Conect.doSaveLogImport(PastaLOG, pChar(lArquivo) + #13#10 + 'Falha ao incluir CTE_VPrest.' + E.Message);
                         Continue;
                       end;
                   end;



                   for J := 0 to Det.Count-1 do
                   begin
                     with Det.Items[J] do
                      begin
                       if OrigemDaNota = 'S' then
                          pNovoCFOP := Prod.CFOP
                       else if OrigemDaNota = 'E' then
                           pNovoCFOP := DB_Conect.TrocarCFOP(Prod.CFOP);

                       lSQL := 'Insert into CTE_Itens (';
                       lSQL := lSQL + ' NumNf, ';
                       lSQL := lSQL + ' CTE_CAPA_ID, ';
                       lSQL := lSQL + ' CodFornecedor, ';
                       lSQL := lSQL + ' CodProduto, ';
                       lSQL := lSQL + ' DescProduto, ';
                       lSQL := lSQL + ' UnidadeItem, ';
                       lSQL := lSQL + ' CodFilial, ';
                       lSQL := lSQL + ' NumItem,  ';
                       lSQL := lSQL + ' CodNatureza, ';
                       lSQL := lSQL + ' I_CFOP, ';
                       lSQL := lSQL + ' CodGrupo, ';
         //              lSQL := lSQL + ' DataEntrega, ';
                       lSQL := lSQL + ' Qtde, ';
                       lSQL := lSQL + ' ValorUnitario,  ';
                       lSQL := lSQL + ' ValorTotal, ';
                       lSQL := lSQL + ' ValorLiquido, ';
                       lSQL := lSQL + ' Nf_TipoICMS, ';
                       lSQL := lSQL + ' BaseICMSST,  ';
                       lSQL := lSQL + ' ValorICMS_ST, ';
                       lSQL := lSQL + ' Nf_IVA_ST, ';
                       lSQL := lSQL + ' IVA_Original, ';
                       lSQL := lSQL + ' BaseICMS_It,  ';
                       lSQL := lSQL + ' BaseICMS , ';
                       lSQL := lSQL + ' ValorICMS,';
                       lSQL := lSQL + ' PorcICMS, ';
                       lSQL := lSQL + ' Nf_TipoIPI,  ';
                       lSQL := lSQL + ' BaseIPI, ';
                       lSQL := lSQL + ' ValorIPI, ';
                       lSQL := lSQL + ' PorcIPI, ';
                       lSQL := lSQL + ' NF_TipoPIS,  ';
                       lSQL := lSQL + ' BasePIS, ';
                       lSQL := lSQL + ' ValorPIS ,  ';
                       lSQL := lSQL + ' PorcPIS, ';
                       lSQL := lSQL + ' NF_TipoCofins, ';
                       lSQL := lSQL + ' BaseCOFINS,';
                       lSQL := lSQL + ' ValorCofins, ';
                       lSQL := lSQL + ' PorcCOFINS,  ';
                       lSQL := lSQL + ' ValorFrete , ';
                       lSQL := lSQL + ' VlrOutrasDespesas, ';
                       lSQL := lSQL + ' VlrSeguro,  ';
                       lSQL := lSQL + ' PorcProvICMSPartilha,  ';
                       lSQL := lSQL + ' VlrFCP ,  ';
                       lSQL := lSQL + ' VlrICMSUFDestino , ';
                       lSQL := lSQL + ' VlrICMSUFRemetente ,  ';
                       lSQL := lSQL + ' AliqFCP, ';
                       lSQL := lSQL + ' DIFAL, ';
                       lSQL := lSQL + ' PorcDesconto, ';
                       lSQL := lSQL + ' ValorDesconto,  ';
                       lSQL := lSQL + ' PorcCredito, ';
                       lSQL := lSQL + ' VlrCredito, ';
                       lSQL := lSQL + ' NCM ';
                       lSQL := lSQL + ' ) Values (';
                       lSQL := lSQL + ' :NumNf, ';
                       lSQL := lSQL + ' :CTE_CAPA_ID, ';
                       lSQL := lSQL + ' :CodFornecedor, ';
                       lSQL := lSQL + ' :CodProduto, ';
                       lSQL := lSQL + ' :DescProduto, ';
                       lSQL := lSQL + ' :UnidadeItem, ';
                       lSQL := lSQL + ' :CodFilial, ';
                       lSQL := lSQL + ' :NumItem,  ';
                       lSQL := lSQL + ' :CodNatureza, ';
                       lSQL := lSQL + ' :I_CFOP, ';
                       lSQL := lSQL + ' :CodGrupo, ';
         //              lSQL := lSQL + ' :DataEntrega, ';
                       lSQL := lSQL + ' :Qtde, ';
                       lSQL := lSQL + ' :ValorUnitario,  ';
                       lSQL := lSQL + ' :ValorTotal, ';
                       lSQL := lSQL + ' :ValorLiquido, ';
                       lSQL := lSQL + ' :Nf_TipoICMS, ';
                       lSQL := lSQL + ' :BaseICMSST,  ';
                       lSQL := lSQL + ' :ValorICMS_ST, ';
                       lSQL := lSQL + ' :Nf_IVA_ST, ';
                       lSQL := lSQL + ' :IVA_Original, ';
                       lSQL := lSQL + ' :BaseICMS_It,  ';
                       lSQL := lSQL + ' :BaseICMS , ';
                       lSQL := lSQL + ' :ValorICMS,';
                       lSQL := lSQL + ' :PorcICMS, ';
                       lSQL := lSQL + ' :Nf_TipoIPI,  ';
                       lSQL := lSQL + ' :BaseIPI, ';
                       lSQL := lSQL + ' :ValorIPI, ';
                       lSQL := lSQL + ' :PorcIPI, ';
                       lSQL := lSQL + ' :NF_TipoPIS,  ';
                       lSQL := lSQL + ' :BasePIS, ';
                       lSQL := lSQL + ' :ValorPIS ,  ';
                       lSQL := lSQL + ' :PorcPIS, ';
                       lSQL := lSQL + ' :NF_TipoCofins, ';
                       lSQL := lSQL + ' :BaseCOFINS,';
                       lSQL := lSQL + ' :ValorCofins, ';
                       lSQL := lSQL + ' :PorcCOFINS,  ';
                       lSQL := lSQL + ' :ValorFrete , ';
                       lSQL := lSQL + ' :VlrOutrasDespesas, ';
                       lSQL := lSQL + ' :VlrSeguro,  ';
                       lSQL := lSQL + ' :PorcProvICMSPartilha,  ';
                       lSQL := lSQL + ' :VlrFCP ,  ';
                       lSQL := lSQL + ' :VlrICMSUFDestino , ';
                       lSQL := lSQL + ' :VlrICMSUFRemetente ,  ';
                       lSQL := lSQL + ' :AliqFCP, ';
                       lSQL := lSQL + ' :DIFAL, ';
                       lSQL := lSQL + ' :PorcDesconto, ';
                       lSQL := lSQL + ' :ValorDesconto,  ';
                       lSQL := lSQL + ' :PorcCredito, ';
                       lSQL := lSQL + ' :VlrCredito, ';
                       lSQL := lSQL + ' :NCM ';
                       lSQL := lSQL + '  )';

                        qryAux.Close;
                        qryAux.Sql.Clear;
                        qryAux.SQL.Add(lSQL);

                        //RetornaCodigoProduto(tpRetorno.trCodFornecedor,Prod.cProd,Prod.NCM, Prod.xProd);

                        qryAux.ParamByName('NumNf').AsInteger        := Ide.nNF;
                        qryAux.ParamByName('CTE_CAPA_ID').AsInteger  := IDENTITY_CTE_CAPA_ID;

                        qryAux.ParamByName('CodFornecedor').AsString := tpRetornoEmitente.trCodigo;

                        qryAux.ParamByName('CodProduto').AsString    := Prod.cProd;
                        qryAux.ParamByName('DescProduto').AsString   := Prod.xProd;

                        qryAux.ParamByName('UnidadeItem').AsString   := prod.uCom;
                        qryAux.ParamByName('CodFilial').AsString     := varFilialID;
                        qryAux.ParamByName('NumItem').AsInteger      := Prod.nItem;
                        qryAux.ParamByName('CodNatureza').AsString   := pNovoCFOP;
                        qryAux.ParamByName('I_CFOP').AsString        := pNovoCFOP;
                        qryAux.ParamByName('CodGrupo').AsString      := '0'; //tpProduto.trCodGrupo;
                       // qryAux.ParamByName('DataEntrega').AsSQLTimeStamp  := DateTimeToSQLTimeStamp(Ide.dEmi);
                        qryAux.ParamByName('Qtde').asFloat           := Prod.qCom;
                        qryAux.ParamByName('ValorUnitario').asFloat  := Prod.vUnCom;
                        qryAux.ParamByName('ValorTotal').asFloat     := Prod.vProd;
                        qryAux.ParamByName('ValorLiquido').asFloat   := Prod.vProd;

                        with Imposto do
                        begin
                             with ICMS do
                             begin
                                if ((tpRetornoEmitente.trRegimeICMS = '1') or (tpRetornoEmitente.trRegimeICMS = '2'))  then
                                  qryAux.ParamByName('Nf_TipoICMS').AsString   := CSOSNIcmsToStr(CSOSN)
                                else  qryAux.ParamByName('Nf_TipoICMS').AsString   := CSTICMSToStr(CST);

                                qryAux.ParamByName('BaseICMSST').AsFloat     := ICMS.vBCST;
                                qryAux.ParamByName('ValorICMS_ST').AsFloat   := ICMS.vICMSST;
                                qryAux.ParamByName('Nf_IVA_ST').asFloat      := 0;
                                qryAux.ParamByName('IVA_Original').asFloat   := ICMS.pMVAST;
                                qryAux.ParamByName('BaseICMS_It').asFloat    := ICMS.vBCST;

                                qryAux.ParamByName('BaseICMS').AsFloat       := ICMS.vBC;
                                qryAux.ParamByName('ValorICMS').AsFloat      := ICMS.vICMS;
                                qryAux.ParamByName('PorcICMS').asFloat       := ICMS.pICMS;
                             end;


                             if (IPI.vBC > 0) then
                             begin
                                 with IPI do
                                 begin
                                    qryAux.ParamByName('Nf_TipoIPI').AsString    := CSTIPIToStr(CST);
                                    qryAux.ParamByName('BaseIPI').AsFloat        := vBC;
                                    qryAux.ParamByName('ValorIPI').AsFloat       := vIPI;
                                    qryAux.ParamByName('PorcIPI').asFloat        := pIPI;
                                 end;
                             end
                             else
                             begin
                                 with IPI do
                                 begin
                                    qryAux.ParamByName('Nf_TipoIPI').AsString    := CSTIPIToStr(CST);
                                    qryAux.ParamByName('BaseIPI').AsFloat        := 0;
                                    qryAux.ParamByName('ValorIPI').AsFloat       := 0;
                                    qryAux.ParamByName('PorcIPI').asFloat        := 0;
                                 end;
                             end;


                             with PIS do
                             begin
                                qryAux.ParamByName('NF_TipoPIS').AsString       := CSTPISToStr(CST) ;
                                if (CST = pis01) or (CST = pis02) then
                                 begin
                                   qryAux.ParamByName('BasePIS').AsFloat        := PIS.vBC;
                                   qryAux.ParamByName('ValorPIS').AsFloat       := PIS.vPIS;
                                   qryAux.ParamByName('PorcPIS').asFloat        := PIS.pPIS;
                                 end
                                else if CST = pis03 then
                                 begin
                                   qryAux.ParamByName('BasePIS').AsFloat        := PIS.qBCProd;
                                   qryAux.ParamByName('ValorPIS').AsFloat       := PIS.vPIS;
                                   qryAux.ParamByName('PorcPIS').asFloat        := PIS.vAliqProd;
                                 end
                                else if CST = pis99 then
                                 begin
                                   qryAux.ParamByName('BasePIS').AsFloat        := PIS.vBC;
                                   qryAux.ParamByName('ValorPIS').AsFloat       := PIS.vPIS;
                                   qryAux.ParamByName('PorcPIS').asFloat        := PIS.pPIS;
                                end
                                else
                                begin
                                   qryAux.ParamByName('BasePIS').AsFloat        := 0;
                                   qryAux.ParamByName('ValorPIS').AsFloat       := 0;
                                   qryAux.ParamByName('PorcPIS').asFloat        := 0;
                                end;
                             end;

                             with COFINS do
                             begin
                                qryAux.ParamByName('NF_TipoCofins').AsString    := CSTCOFINSToStr(CST);
                                if (CST = cof01) or (CST = cof02)   then
                                 begin
                                  qryAux.ParamByName('BaseCOFINS').AsFloat     := COFINS.vBC;
                                  qryAux.ParamByName('ValorCofins').AsFloat    := COFINS.vCOFINS;
                                  qryAux.ParamByName('PorcCOFINS').asFloat     := COFINS.pCOFINS;
                                 end
                                else if CST = cof03 then
                                 begin
                                  qryAux.ParamByName('BaseCOFINS').AsFloat     := COFINS.qBCProd;
                                  qryAux.ParamByName('ValorCofins').AsFloat    := COFINS.vCOFINS;
                                  qryAux.ParamByName('PorcCOFINS').asFloat     := COFINS.vAliqProd;
                                 end
                                else if CST = cof99 then
                                 begin
                                  qryAux.ParamByName('BaseCOFINS').AsFloat     := COFINS.vBC;
                                  qryAux.ParamByName('ValorCofins').AsFloat    := COFINS.vCOFINS;
                                  qryAux.ParamByName('PorcCOFINS').asFloat     := COFINS.vAliqProd;
                                 end
                                 else
                                 begin
                                  qryAux.ParamByName('BaseCOFINS').AsFloat     := 0;
                                  qryAux.ParamByName('ValorCofins').AsFloat    := 0;
                                  qryAux.ParamByName('PorcCOFINS').asFloat     := 0;
                                 end;
                             end;


                             qryAux.ParamByName('ValorFrete').AsFloat            := Prod.vFrete;
                             qryAux.ParamByName('VlrOutrasDespesas').AsFloat     := Prod.vOutro;
                             qryAux.ParamByName('VlrSeguro').AsFloat             := Prod.vSeg;

                             with ICMSUFDest do
                             begin
                               qryAux.ParamByName('PorcProvICMSPartilha').AsFloat  := pICMSInterPart;
                               qryAux.ParamByName('VlrFCP').AsFloat                := vFCPUFDest;
                               qryAux.ParamByName('VlrICMSUFDestino').AsFloat      := vICMSUFDest;
                               qryAux.ParamByName('VlrICMSUFRemetente').AsFloat    := vICMSUFRemet;
                               qryAux.ParamByName('AliqFCP').AsFloat               := pFCPUFDest;
                               qryAux.ParamByName('DIFAL').AsFloat                 := pICMSInter;
                             end;

                             qryAux.ParamByName('PorcDesconto').asFloat   := 0;
                             qryAux.ParamByName('ValorDesconto').asFloat  := Prod.vDesc;
                             qryAux.ParamByName('PorcCredito').asFloat    := ICMS.pCredSN;
                             qryAux.ParamByName('VlrCredito').AsFloat     := ICMS.vCredICMSSN;
                             qryAux.ParamByName('NCM').AsString           := Prod.NCM;

                             if (ICMS.pCredSN > 0) then
                              DB_Conect.GravaCreditoSimplesNacional(tpRetornoEmitente.trCodigo, Ide.dEmi,ICMS.pCredSN);


                        end;

                     end ;

                     try


                       qryAux.ExecSQL;

                     except

                       On E:Exception do
                         begin
           //               DB_Conect.GetComando(qryAux, frmImportarNFeEntrada, False);
                           GCambio.ExecRollBack;

                           DB_Conect.doSaveLogImport(PastaLOG, DB_Conect.GetComando(qryAux)  + #13#10 + 'Falha ao incluir CTE_Itens.' + E.Message);
                           Mens_MensErro( pChar(lArquivo) + #13#10 + 'Falha ao incluir Item NFe.' + E.Message );
                           Continue;
                         end;
                     end;

                   end;
                   // Itens da Nota
                   for J := 0 to Det.Count-1 do
                    begin
                      with Det.Items[J] do
                       begin

                         lSQL := ' INSERT INTO [dbo].[CTE_IMPOSTOS]( ';
                         lSQL := lSQL + ' cCT';
                         lSQL := lSQL + ' ,CTE_CAPA_ID ';
                         lSQL := lSQL + ' ,SituTrib';
                         lSQL := lSQL + ' ,CST';
                         lSQL := lSQL + ' ,pRedBC';
                         lSQL := lSQL + ' ,pICMS';
                         lSQL := lSQL + ' ,vCred';
                         lSQL := lSQL + ' ,vBC';
                         lSQL := lSQL + ' ,vICMS';
                         lSQL := lSQL + ' ,infAdFisco';
                         lSQL := lSQL + ' ,vTotTrib';
                         lSQL := lSQL + ' ,vPIS';
                         lSQL := lSQL + ' ,vCOFINS';
                         lSQL := lSQL + ' ,vIR';
                         lSQL := lSQL + ' ,vINSS';
                         lSQL := lSQL + ' ,vCSLL';
                         lSQL := lSQL + ' ,CFOP)';


                         lSQL := lSQL + ' Values (';
                         lSQL := lSQL + ' :cCT';
                         lSQL := lSQL + ' ,:CTE_CAPA_ID ';
                         lSQL := lSQL + ' ,:SituTrib';
                         lSQL := lSQL + ' ,:CST';
                         lSQL := lSQL + ' ,:pRedBC';
                         lSQL := lSQL + ' ,:pICMS';
                         lSQL := lSQL + ' ,:vCred';
                         lSQL := lSQL + ' ,:vBC';
                         lSQL := lSQL + ' ,:vICMS';
                         lSQL := lSQL + ' ,:infAdFisco';
                         lSQL := lSQL + ' ,:vTotTrib';
                         lSQL := lSQL + ' ,:vPIS';
                         lSQL := lSQL + ' ,:vCOFINS';
                         lSQL := lSQL + ' ,:vIR';
                         lSQL := lSQL + ' ,:vINSS';
                         lSQL := lSQL + ' ,:vCSLL';
                         lSQL := lSQL + ' ,:CFOP)';


                         qryInsert.Close;
                         qryInsert.SQL.Clear;
                         qryInsert.SQL.Add( lSQL );
                         qryInsert.ParamByName('cCT').AsInteger                     := ide.nNF;
                         qryInsert.ParamByName('CTE_CAPA_ID').AsInteger             := IDENTITY_CTE_CAPA_ID;
                         if (CSTICMSToStr(Imposto.ICMS.CST) <> '') then
                         begin
                           qryInsert.ParamByName('SituTrib').asString               := CSTICMSToStr(Imposto.ICMS.CST);
                           qryInsert.ParamByName('CST').asString                    := CSTICMSToStr(Imposto.ICMS.CST);
                         end
                         else
                         begin
                           qryInsert.ParamByName('SituTrib').asString               := CSOSNIcmsToStr(Imposto.ICMS.CSOSN);
                           qryInsert.ParamByName('CST').asString                    := CSOSNIcmsToStr(Imposto.ICMS.CSOSN);
                         end;

                         qryInsert.ParamByName('pRedBC').AsFloat                    := 0;
                         qryInsert.ParamByName('pICMS').AsFloat                     := Imposto.ICMS.pICMS;
                         qryInsert.ParamByName('vCred').AsFloat                     := 0;


                         if (Imposto.ICMS.vBCST > 0) then
                         begin
                           qryInsert.ParamByName('vBC').AsFloat                       := Imposto.ICMS.vBCST;
                           qryInsert.ParamByName('vICMS').AsFloat                     := Imposto.ICMS.vICMSST;
                          end
                          else
                          begin
                           qryInsert.ParamByName('vBC').AsFloat                       := Imposto.ICMS.vBC;
                           qryInsert.ParamByName('vICMS').AsFloat                     := Imposto.ICMS.vICMS;
                         end;
                         qryInsert.ParamByName('infAdFisco').AsString                 := '';
                         qryInsert.ParamByName('vTotTrib').AsFloat                    := Imposto.vTotTrib ;
                         qryInsert.ParamByName('vPIS').AsFloat                        := Imposto.PIS.vPIS;
                         qryInsert.ParamByName('vCOFINS').AsFloat                     := Imposto.COFINS.vCOFINS;
                         qryInsert.ParamByName('vIR').AsFloat                         := 0;
                         qryInsert.ParamByName('vINSS').AsFloat                       := 0;
                         qryInsert.ParamByName('vCSLL').AsFloat                       := 0;
                         qryInsert.ParamByName('CFOP').AsString                       := pNovoCFOP;


                         try
                           qryInsert.ExecSQL;

                         except
                           On E:Exception do
                             begin
                   //            DB_Conect.GetComando(qryInsert, frmImportarNFeEntrada, False);
                               GCambio.ExecRollBack;

                               DB_Conect.doSaveLogImport(PastaLOG, DB_Conect.GetComando(qryInsert)  + #13#10 + 'Falha ao incluir CTE_IMPOSTOS.' + E.Message);
                               bLog := True;
                               DB_Conect.doSaveLogImport(PastaLOG, pChar(lArquivo) + #13#10 + 'Falha ao incluir CTE_IMPOSTOS.' + E.Message);
                               Continue;
                             end;
                         end;


                       end;
                    end;

                    try
                      lSQL := 'insert into XML_IMPORTADA(cCT,CTE_CAPA_ID,DataEmissao,nCT,CHCTE,CodUsuario, TipoXML, Origem, ArquivoXML)';
                      lSQL := lSQL + ' values( :cCT,:CTE_CAPA_ID,:DataEmissao,:nCT,:CHCTE,:CodUsuario, :TipoXML, :Origem';
                      lSQL := lSQL + ',' + QuotedStr( ACBrNFe.NotasFiscais.Items[0].XML  );
                      lSQL := lSQL + ')';

                      qryInsert.Close;
                      qryInsert.SQL.Clear;
                      qryInsert.SQL.Add( lSQL );

                      qryInsert.ParamByName('cCT').asInteger               := ide.nNF;
                      qryInsert.ParamByName('CTE_CAPA_ID').AsInteger       := IDENTITY_CTE_CAPA_ID;
                      qryInsert.ParamByName('DataEmissao').AsSQLTimeStamp  := DateTimeToSQLTimeStamp(Ide.dEmi);
                      qryInsert.ParamByName('nCT').AsString                := IntToStr(Ide.nNF);
                      qryInsert.ParamByName('CHCTE').AsString              := procNFe.chNFe;
                      qryInsert.ParamByName('CodUsuario').AsString         := GUsuario;
                      qryInsert.ParamByName('TipoXML').AsString            := 'NFE';
                      qryInsert.ParamByName('Origem').AsString             := OrigemDaNota;

                    finally

                      try
                        qryInsert.ExecSQL;

                        MoveFile( PWideChar( lArquivo ) , PWideChar( lArquivoImportado ) );


                      except
                        On E:Exception do
                          begin
                           GCambio.ExecRollBack;


                            bLog := True;
                            DB_Conect.doSaveLogImport(PastaLOG, 'Falha ao incluir CTe.' + E.Message);

                          end;
                      end;

                    end;

                       // Fim Guarda Arquivo XML

                   GCambio.ExecCommit;

                   end;


        end
        else
        begin
             Try
                 XMLDocument.LoadFromFile(lArquivo);
             except
                 XMLDocument.XML.Clear;
                 DB_Conect.doSaveLogImport(PastaLOG, 'Arquivo Inv�lido ' +  PWideChar(  lArquivoImportado ));
                 MoveFile( PWideChar(   lArquivo) , PWideChar( lArquivoImportado ) );
                 Continue;
             end;

             XMLDocument.Active := True;
             Try
                retEvento := XMLDocument.DocumentElement.ChildNodes.FindNode('retEvento');
                infEvento := retEvento.ChildNodes.FindNode('infEvento');
             except
                  DB_Conect.doSaveLogImport(PastaLOG, 'N� Inv�lido ' +  PWideChar(  lArquivoImportado ));
                  XMLDocument.XML.Clear;
                  MoveFile( PWideChar(   lArquivo) , PWideChar( lArquivoImportado ) );
                  Continue;
             End;

             Try
                with qryInsert do
                begin
                  Close;
                  SQL.Clear;
                  SQL.Add(' SELECT cCT FROM XML_IMPORTADA  ');
                  SQL.Add(' WHERE cCT  = :cCT ');
                  SQL.Add(' and nCT = :nCT ');
                  SQL.Add(' and CHCTE = :CHCTE ');
                  SQL.Add(' and TipoXML = :TipoXML ');

                  ParamByName('cCT').asInteger               := StrToInt(infEvento.ChildNodes['tpEvento'].Text);
                  ParamByName('nCT').AsString                := infEvento.ChildNodes['tpEvento'].Text;
                  ParamByName('CHCTE').AsString              := infEvento.ChildNodes['chNFe'].Text;
                  ParamByName('TipoXML').AsString            := 'CCE';
                  Open;
                end;
             except
                Try
                  with qryInsert do
                  begin
                        Close;
                        SQL.Clear;
                        SQL.Add(' SELECT cCT FROM XML_IMPORTADA  ');
                        SQL.Add(' WHERE cCT  = :cCT ');
                        SQL.Add(' and nCT = :nCT ');
                        SQL.Add(' and CHCTE = :CHCTE ');
                        SQL.Add(' and TipoXML = :TipoXML ');
                        infEvento := retEvento.ChildNodes.FindNode('retEnvEvento');
                        ParamByName('cCT').asInteger               := StrToInt(infEvento.ChildNodes['tpEvento'].Text);
                        ParamByName('nCT').AsString                := infEvento.ChildNodes['tpEvento'].Text;
                        ParamByName('CHCTE').AsString              := infEvento.ChildNodes['chNFe'].Text;
                        ParamByName('TipoXML').AsString            := 'CCE';
                        Open;
                  end;
                 except
                     with qryInsert do
                     begin
                      Close;
                      SQL.Clear;
                      SQL.Add(' SELECT cCT FROM XML_IMPORTADA  ');
                      SQL.Add(' WHERE cCT  = :cCT ');
                      SQL.Add(' and nCT = :nCT ');
                      SQL.Add(' and CHCTE = :CHCTE ');
                      SQL.Add(' and TipoXML = :TipoXML ');
                      infEvento      := retEvento.ChildNodes.FindNode('retEnvEvento');
                      subinfEvento   := infEvento.ChildNodes.FindNode('retEvento');
                      _subinfEvento  := subinfEvento.ChildNodes.FindNode('infEvento');
                      ParamByName('cCT').asInteger               := StrToInt(_subinfEvento.ChildNodes['tpEvento'].Text);
                      ParamByName('nCT').AsString                := _subinfEvento.ChildNodes['tpEvento'].Text;
                      ParamByName('CHCTE').AsString              := _subinfEvento.ChildNodes['chNFe'].Text;
                      ParamByName('TipoXML').AsString            := 'CCE';
                      Open;
                     end;
                  end;
             end;


             if not qryInsert.IsEmpty then
             begin
                XMLDocument.XML.Clear;
                MoveFile( PWideChar(  lArquivo ) , PWideChar(  lArquivoImportado ) );
                bLog := True;
                DB_Conect.doSaveLogImport(PastaLOG, 'Existente ' +  PWideChar(  lArquivoImportado));
                Continue;
             end;

             lSQL := ' Insert into CTE_OUTRAS (xMotivo, chNFe, tpEvento, xEvento, dhRegEvento, nProt) ';
             lSQL := lSQL +             ' Values ( :xMotivo, :chNFe, :tpEvento, :xEvento, :dhRegEvento, :nProt) ';

             qryInsert.Close;
             qryInsert.SQL.Clear;
             qryInsert.SQL.Add( lSQL );
             Try
                 qryInsert.ParamByName('xMotivo').asString     := infEvento.ChildNodes['xMotivo'].Text;
                 qryInsert.ParamByName('chNFe').asString       := infEvento.ChildNodes['chNFe'].Text;
                 if qryInsert.ParamByName('chNFe').asString <> '' then
                 begin
                   qryInsert.ParamByName('tpEvento').asString    := infEvento.ChildNodes['tpEvento'].Text;
                   qryInsert.ParamByName('xEvento').asString     := infEvento.ChildNodes['xEvento'].Text;
                   qryInsert.ParamByName('dhRegEvento').asString := infEvento.ChildNodes['dhRegEvento'].Text;
                   qryInsert.ParamByName('nProt').asString       := infEvento.ChildNodes['nProt'].Text;
                 end
                 else
                 begin
                   infEvento      := retEvento.ChildNodes.FindNode('retEnvEvento');
                   subinfEvento   := infEvento.ChildNodes.FindNode('retEvento');
                   _subinfEvento  := subinfEvento.ChildNodes.FindNode('infEvento');
                   qryInsert.ParamByName('xMotivo').asString     := _subinfEvento.ChildNodes['xMotivo'].Text;
                   qryInsert.ParamByName('chNFe').asString       := _subinfEvento.ChildNodes['chNFe'].Text;
                   qryInsert.ParamByName('tpEvento').asString    := _subinfEvento.ChildNodes['tpEvento'].Text;
                   qryInsert.ParamByName('xEvento').asString     := _subinfEvento.ChildNodes['xEvento'].Text;
                   qryInsert.ParamByName('dhRegEvento').asString := _subinfEvento.ChildNodes['dhRegEvento'].Text;
                   qryInsert.ParamByName('nProt').asString       := _subinfEvento.ChildNodes['nProt'].Text;
                 end;
             except
                   Try
                       qryInsert.ParamByName('xMotivo').asString     := infEvento.ChildNodes['xMotivo'].Text;
                       qryInsert.ParamByName('chNFe').asString       := infEvento.ChildNodes['chNFe'].Text;
                       qryInsert.ParamByName('tpEvento').asString    := infEvento.ChildNodes['tpEvento'].Text;
                       qryInsert.ParamByName('xEvento').asString     := infEvento.ChildNodes['xEvento'].Text;
                       qryInsert.ParamByName('dhRegEvento').asString := infEvento.ChildNodes['dhRegEvento'].Text;
                       qryInsert.ParamByName('nProt').asString       := infEvento.ChildNodes['nProt'].Text;
                   except
                       infEvento      := retEvento.ChildNodes.FindNode('retEnvEvento');
                       subinfEvento   := infEvento.ChildNodes.FindNode('retEvento');
                       _subinfEvento  := subinfEvento.ChildNodes.FindNode('infEvento');
                       qryInsert.ParamByName('xMotivo').asString     := _subinfEvento.ChildNodes['xMotivo'].Text;
                       qryInsert.ParamByName('chNFe').asString       := _subinfEvento.ChildNodes['chNFe'].Text;
                       qryInsert.ParamByName('tpEvento').asString    := _subinfEvento.ChildNodes['tpEvento'].Text;
                       qryInsert.ParamByName('xEvento').asString     := _subinfEvento.ChildNodes['xEvento'].Text;
                       qryInsert.ParamByName('dhRegEvento').asString := _subinfEvento.ChildNodes['dhRegEvento'].Text;
                       qryInsert.ParamByName('nProt').asString       := _subinfEvento.ChildNodes['nProt'].Text;
                   End;
             End;
             try
                    qryInsert.ExecSQL;

                    Try
                      IDENTITY_ID := 0;
                      lSQL  := 'SELECT @@IDENTITY as CTE_CAPA_ID ';

                      qryInsert.Close;
                      qryInsert.SQL.Clear;
                      qryInsert.SQL.Add( lSQL );
                      qryInsert.Open;
                      IDENTITY_ID := qryInsert.FieldByName('CTE_CAPA_ID').AsInteger;

                    except
                      On E:Exception do
                        begin
                      //     DB_Conect.SQLConnection.RollBack;
                           bLog := True;
                           DB_Conect.doSaveLogImport(PastaLOG, DB_Conect.GetComando(qryInsert) + #13#10 + 'Falha ao pegar chave da CTE_OUTRAS.' + E.Message);
                           Continue;
                         end;
                    end;

                     // Guardar Arquivo XML
                   try
                     lSQL := 'Insert into XML_IMPORTADA(cCT,  CTE_CAPA_ID, nCT,CHCTE,CodUsuario, TipoXML, ArquivoXML)';
                     lSQL := lSQL + ' values( :cCT,  :CTE_CAPA_ID, :nCT,:CHCTE,:CodUsuario, :TipoXML ';
                     lSQL := lSQL + ',' + QuotedStr( XMLDocument.XML.Text ) + ')';


                     qryInsert.Close;
                     qryInsert.SQL.Clear;
                     qryInsert.SQL.Add( lSQL );
                     Try
                        qryInsert.ParamByName('cCT').asInteger               := StrToInt(infEvento.ChildNodes['tpEvento'].Text);
                        qryInsert.ParamByName('CTE_CAPA_ID').AsInteger       := IDENTITY_ID;
                        qryInsert.ParamByName('nCT').AsString                := infEvento.ChildNodes['tpEvento'].Text;
                        qryInsert.ParamByName('CHCTE').AsString              := infEvento.ChildNodes['chNFe'].Text;
                        qryInsert.ParamByName('CodUsuario').AsString         := '2';
                        qryInsert.ParamByName('TipoXML').AsString            := 'CCE';
                     except
                        infEvento      := retEvento.ChildNodes.FindNode('retEnvEvento');
                        subinfEvento   := infEvento.ChildNodes.FindNode('retEvento');
                        _subinfEvento  := subinfEvento.ChildNodes.FindNode('infEvento');
                        qryInsert.ParamByName('cCT').asInteger               := StrToInt(_subinfEvento.ChildNodes['tpEvento'].Text);
                        qryInsert.ParamByName('CTE_CAPA_ID').AsInteger       := IDENTITY_ID;
                        qryInsert.ParamByName('nCT').AsString                := _subinfEvento.ChildNodes['tpEvento'].Text;
                        qryInsert.ParamByName('CHCTE').AsString              := _subinfEvento.ChildNodes['chNFe'].Text;
                        qryInsert.ParamByName('CodUsuario').AsString         := '2';
                        qryInsert.ParamByName('TipoXML').AsString            := 'CCE';
                     End;

                   finally

                     try
                       qryInsert.ExecSQL;
                       XMLDocument.XML.Clear;
                       MoveFile( PWideChar(  lArquivo ) , PWideChar( lArquivoImportado) );
                     except
                       On E:Exception do
                         begin
                       //    DB_Conect.SQLConnection.RollBack;
                           bLog := True;
                           DB_Conect.doSaveLogImport(PastaLOG, DB_Conect.GetComando(qryInsert) + ' ' +  'Falha ao incluir XML.' + E.Message);
                         end;
                     end;

                   end;

                except
                  On E:Exception do
                    begin
                    // DB_Conect.SQLConnection.RollBack;
                     bLog := True;
                     DB_Conect.doSaveLogImport(PastaLOG, DB_Conect.GetComando(qryInsert) + ' ' +  'Falha ao incluir Outro Tipo de Nota.' + E.Message);
                    end;
                end;

         end;
           end;


        AguardandoProcesso(frmImportador, False, 'Fim');

         if bLog = True then
           Mens_MensInf('Clique no bot�o Ver Log');

        except
         on E:Exception do
           begin

             DB_Conect.doSaveLogImport(PastaLOG, 'Erro Desconhecido ao Importar arquivos.!' + #13 +
                             E.Message);
           end;
        end;
   finally
      tlNFe.Clear;
   end;


end;


Function TfrmImportador.CriarPastadoCliente(pTipo, pArquivo : String) : String;
Var
  PastaCNPJ, PastaOrigem: String;
  dia, mes, ano: Word;
  DataCCE : String;
begin

  with DB_Conect do
  begin
     if pTipo = 'CTE' then
     begin
        with ACBrCTe.Conhecimentos.Items[0].CTe do
        begin
           FD_Consulta_EntregaXML.Close;
           FD_Consulta_EntregaXML.SQL.Clear;
           FD_Consulta_EntregaXML.SQL.Add('Select CTE_FILIAL_ID from CTE_FILIAL Where cnpj = :cnpj');
           FD_Consulta_EntregaXML.ParamByName('cnpj').AsString := Dest.CNPJCPF;
           FD_Consulta_EntregaXML.Open;

           if FD_Consulta_EntregaXML.IsEmpty then
           begin
              FD_Consulta_EntregaXML.Close;
              FD_Consulta_EntregaXML.SQL.Clear;
              FD_Consulta_EntregaXML.SQL.Add('Select CTE_FILIAL_ID from CTE_FILIAL Where cnpj = :cnpj');
              FD_Consulta_EntregaXML.ParamByName('cnpj').AsString := Emit.CNPJ;
              FD_Consulta_EntregaXML.Open;
              if not FD_Consulta_EntregaXML.IsEmpty then
              begin
                 PastaCNPJ   := Emit.CNPJ;
                 PastaOrigem := 'CTE_SAIDA';

              end
              else
              begin
                 DB_Conect.doSaveLogImport(PastaLOG, pChar(pArquivo)  + ' - CNPJ N�o Cadastrado.');
              end;
           end
           else
           begin
              PastaCNPJ   :=  Dest.CNPJCPF;
              PastaOrigem := 'CTE_ENTRADA';
           end;

           DecodeDate(ide.dhEmi,ano,mes,dia);
        end;
     end
     else if pTipo = 'NFE' then
     begin
        with ACBrNFe.NotasFiscais.Items[0].NFe do
        begin
           FD_Consulta_EntregaXML.Close;
           FD_Consulta_EntregaXML.SQL.Clear;
           FD_Consulta_EntregaXML.SQL.Add('Select CTE_FILIAL_ID from CTE_FILIAL Where cnpj = :cnpj');
           FD_Consulta_EntregaXML.ParamByName('cnpj').AsString := Dest.CNPJCPF;
           FD_Consulta_EntregaXML.Open;

           if FD_Consulta_EntregaXML.IsEmpty then
           begin
              FD_Consulta_EntregaXML.Close;
              FD_Consulta_EntregaXML.SQL.Clear;
              FD_Consulta_EntregaXML.SQL.Add('Select CTE_FILIAL_ID from CTE_FILIAL Where cnpj = :cnpj');
              FD_Consulta_EntregaXML.ParamByName('cnpj').AsString := Emit.CNPJCPF;
              FD_Consulta_EntregaXML.Open;
              if not FD_Consulta_EntregaXML.IsEmpty then
              begin
                 PastaCNPJ   := Emit.CNPJCPF;
                 PastaOrigem := 'NFE_SAIDA';

              end
              else
              begin
                 DB_Conect.doSaveLogImport(PastaLOG, pChar(pArquivo)  + ' - CNPJ N�o Cadastrado.');
              end;
           end
           else
           begin
              PastaCNPJ   :=  Dest.CNPJCPF;
              PastaOrigem := 'NFE_ENTRADA';
           end;

           DecodeDate(ide.dEmi,ano,mes,dia);
        end;
     end
     else if pTipo = 'CCE' then
     begin


        FD_Consulta_EntregaXML.Close;
        FD_Consulta_EntregaXML.SQL.Clear;
        FD_Consulta_EntregaXML.SQL.Add('Select CTE_FILIAL_ID from CTE_FILIAL Where cnpj = :cnpj');
        FD_Consulta_EntregaXML.ParamByName('cnpj').AsString := _subinfEvento.ChildNodes['CNPJ'].Text;
        FD_Consulta_EntregaXML.Open;

        if FD_Consulta_EntregaXML.IsEmpty then
        begin
           FD_Consulta_EntregaXML.Close;
           FD_Consulta_EntregaXML.SQL.Clear;
           FD_Consulta_EntregaXML.SQL.Add('Select CTE_FILIAL_ID from CTE_FILIAL Where cnpj = :cnpj');
           FD_Consulta_EntregaXML.ParamByName('cnpj').AsString := infEvento.ChildNodes['CNPJDest'].Text;
           FD_Consulta_EntregaXML.Open;
           if not FD_Consulta_EntregaXML.IsEmpty then
           begin
              PastaCNPJ   := infEvento.ChildNodes['CNPJDest'].Text;
              PastaOrigem := 'CCE_SAIDA';

           end
           else
           begin
              DB_Conect.doSaveLogImport(PastaLOG, pChar(pArquivo)  + ' - CNPJ N�o Cadastrado.');
           end;
        end
        else
        begin
           PastaCNPJ   := _subinfEvento.ChildNodes['CNPJ'].Text;
           PastaOrigem := 'CCE_ENTRADA';
        end;

        DataCCE := Str_Pal(infEvento.ChildNodes['dhRegEvento'].Text,1,'T');

        DecodeDate(ConvertDate(DataCCE),ano,mes,dia);


     end;

     if not DirExists(  PastaRAIZ  + PastaCNPJ ) then
     begin
         if not ForceDirectories(  PastaRAIZ  + PastaCNPJ ) then
          Exit;
     end;

     if not DirExists(  PastaRAIZ  + PastaCNPJ + '\' + IntToStr(ano) ) then
     begin
         if not ForceDirectories(  PastaRAIZ  + PastaCNPJ + '\' + IntToStr(ano) ) then
          Exit;
     end;

     if not DirExists(  PastaRAIZ  + PastaCNPJ  + IntToStr(ano)  + '\' + IntToStr(mes)) then
     begin
         if not ForceDirectories(  PastaRAIZ  + PastaCNPJ + '\' + IntToStr(ano) + '\' + IntToStr(mes) ) then
          Exit;
     end;

     if not DirExists(  PastaRAIZ  + PastaCNPJ + '\' + IntToStr(ano)   + '\' + IntToStr(mes) + '\'  + PastaOrigem) then
     begin
         if not ForceDirectories(  PastaRAIZ  + PastaCNPJ + '\' + IntToStr(ano)  + '\' + IntToStr(mes) + '\' + PastaOrigem) then
          Exit;
     end;
  end;

  result := IncludeTrailingPathDelimiter (PastaRAIZ  + PastaCNPJ + '\' + IntToStr(ano)  + '\' + IntToStr(mes) + '\' + PastaOrigem);
end;


procedure TfrmImportador.btnLocalizarClick(Sender: TObject);
var
  lContinua    : boolean;
 // sr           : TSearchRec;
 // searchResult : integer;
  i,x,n        : Integer;
  loNode       : TcxTreeListNode;
  cct : integer;
  bLog         : Boolean;
  xPathLocal, xNomeArquivo, xPastaClienteLido   : string;
  Listtemp3    : TStringList;
begin
    lContinua := True;
    bLog := False;
    try
      if edtCaminho.Text = '' Then
        xPathLocal := 'C:\MLSistemas-XML\'
      else xPathLocal := edtCaminho.Text;

      if not DirExists(  xPathLocal ) then
      begin
        Mens_MensInf('Pasta selecionada Inv�lida.');
        exit;
      end;


      if lContinua then
        begin
          lPath := IncludeTrailingPathDelimiter( xPathLocal );
          lPath := IncludeTrailingPathDelimiter( lPath );
          lblLocal.Caption := 'Local: ' + lPath;
          loNode := nil;
          tlNFe.Clear;
          I := 0;
          X := 0;

          Listtemp2               := TStringList.Create;
          ListarArquivos(lPath, '*.XML', true, true);
          Try
            Listtemp3               := TStringList.Create;
            Listtemp3.Text          := Listtemp2.Text;
            FreeAndNil(Listtemp2);
            i := 0;

            for i:= 0 to Listtemp3.Count - 1 do
            begin

                ACBrCTe.Conhecimentos.Clear;
                ACBrNFe.NotasFiscais.Clear;
                XMLDocument.XML.Clear;

                xNomeArquivo      := Listtemp3.Strings[i];
                lArquivoImportado := 'C:\MLSISTEMAS_LIDOS\'  + StrTran(ExtractFilePath(xNomeArquivo), PastaRAIZ, '');

                if not DirExists(  lArquivoImportado ) then
                begin
                  if not ForceDirectories(  lArquivoImportado ) then
                    Exit;
                end;
                lArquivoImportado := lArquivoImportado  + ExtractFileName(xNomeArquivo);

                Try
                    //if rgXML.ItemIndex = 0 then
                    //begin

                       if ACBrCTe.Conhecimentos.LoadFromFile( xNomeArquivo  ) Then
                       begin
                           if xNomeArquivo <> '.' then
                           begin
                             loNode := tlNfe.Add;
                             loNode.Values[4] := xNomeArquivo;
                           end;

                           with ACBrCTe.Conhecimentos.Items[n].CTe do
                           begin

                              if edtCaminho.Text <> '' then
                              begin
                                xPastaClienteLido := CriarPastadoCliente('CTE', ExtractFileName (xNomeArquivo));
                                lArquivoImportado := 'C:\MLSISTEMAS_LIDOS\'  + StrTran(ExtractFilePath(xPastaClienteLido), PastaRAIZ, '');
                                if not DirExists( lArquivoImportado ) then
                                begin
                                  if not ForceDirectories( lArquivoImportado ) then
                                    Exit;
                                end;
                              end;

                              qryAux.Close;
                              qryAux.SQL.Clear;
                              qryAux.SQL.Add(' SELECT cCT FROM XML_IMPORTADA  ');
                              qryAux.SQL.Add(' WHERE cCT  = :cCT ');
                              qryAux.SQL.Add(' and DataEmissao  = :DataEmissao ');
                              qryAux.SQL.Add(' and nCT = :nCT ');
                              qryAux.SQL.Add(' and CHCTE = :CHCTE ');
                              qryAux.SQL.Add(' and TipoXML = :TipoXML ');
                              qryAux.ParamByName('cCT').asInteger               := ide.cCT;
                              qryAux.ParamByName('DataEmissao').AsSQLTimeStamp  := DateTimeToSQLTimeStamp(Ide.dhEmi);
                              qryAux.ParamByName('nCT').AsString                := IntToStr(Ide.nCT);
                              qryAux.ParamByName('CHCTE').AsString              := procCTe.chCTe;
                              qryAux.ParamByName('TipoXML').AsString            := 'CTE'; //rgXML.Properties.Items[rgXML.ItemIndex].Caption;
                              qryAux.Open;

                              loNode.Values[0] := ide.cCT;
                              loNode.Values[1] := Ide.dhEmi;
                              loNode.Values[2] := Ide.nCT;
                              loNode.Values[3] := procCTe.chCTe;
                              loNode.Values[5] := 'Importar';

                              if procCTe.nProt = '' then
                              begin
                                 loNode.Values[5] := 'Sem Protocolo';
                                 MoveFile( PWideChar(   xNomeArquivo ) , PWideChar( lArquivoImportado ) );
                                 bLog := True;
                                 DB_Conect.doSaveLogImport(PastaLOG, 'Sem Protocolo ' +  PWideChar(  lArquivoImportado ));
                                 //searchResult := FindNext(sr);
                                 Inc(X);
                                 Continue;
                              end;
                           end;

                           if not qryAux.IsEmpty then
                           begin
                                loNode.Values[5] := 'Existente';
                                MoveFile( PWideChar(   xNomeArquivo ) , PWideChar( lArquivoImportado ) );
                                bLog := True;
                                DB_Conect.doSaveLogImport(PastaLOG, 'Existente ' +  PWideChar(  lArquivoImportado ));
                                //searchResult := FindNext(sr);
                                Inc(X);
                                Continue;
                           end;

                       end
                       else

                        {begin
                            bLog := True;
                            DB_Conect.doSaveLogImport(PastaLOG, ' Arquivo ' + rgXML.Properties.Items[rgXML.ItemIndex].Caption  + ' Inv�lido ' + PWideChar(  lPath +  xNomeArquivo ));
                            //searchResult := FindNext(sr);
                            Continue;
                        end;
                         }

                       if ACBrNFe.NotasFiscais.LoadFromFile(  xNomeArquivo ) Then
                       begin
                           if xNomeArquivo[1] <> '.' then
                           begin
                             loNode := tlNfe.Add;
                             loNode.Values[4] := xNomeArquivo;
                           end;

                           if edtCaminho.Text <> '' then
                           begin
                             xPastaClienteLido := CriarPastadoCliente('NFE', ExtractFileName(xNomeArquivo));
                             lArquivoImportado := 'C:\MLSISTEMAS_LIDOS\'  + StrTran(ExtractFilePath(xPastaClienteLido), PastaRAIZ, '');
                             if not DirExists( lArquivoImportado ) then
                             begin
                                 if not ForceDirectories( lArquivoImportado ) then
                                  Exit;
                             end;
                           end;

                          with ACBrNFe.NotasFiscais.Items[0].NFe do
                          begin

                            qryAux.Close;
                            qryAux.SQL.Clear;
                            qryAux.SQL.Add(' SELECT cCT FROM XML_IMPORTADA  ');
                            qryAux.SQL.Add(' WHERE cCT  = :cCT ');
                            qryAux.SQL.Add(' and DataEmissao  = :DataEmissao ');
                            qryAux.SQL.Add(' and nCT = :nCT ');
                            qryAux.SQL.Add(' and CHCTE = :CHCTE ');
                            qryAux.SQL.Add(' and TipoXML = :TipoXML ');
                            qryAux.ParamByName('cCT').AsString                := IntToStr( Ide.nNF );
                            qryAux.ParamByName('DataEmissao').AsSQLTimeStamp  := DateTimeToSQLTimeStamp(Ide.dEmi);
                            qryAux.ParamByName('nCT').AsString                := IntToStr( Ide.nNF );
                            qryAux.ParamByName('CHCTE').AsString              := procNFe.chNFe;
                            qryAux.ParamByName('TipoXML').AsString            := 'NFE'; //rgXML.Properties.Items[rgXML.ItemIndex].Caption;
                            qryAux.Open;

                            loNode.Values[0] := Ide.nNF;
                            loNode.Values[1] := Ide.dEmi;
                            loNode.Values[2] := Ide.nNF;
                            loNode.Values[3] := procNFe.chNFe;
                            loNode.Values[5] := 'Importar';

                            if (procNFe.nProt = '') then
                            begin
                              loNode.Values[5] := 'Sem Protocolo';
                               MoveFile( PWideChar(  xNomeArquivo ) , PWideChar( lArquivoImportado ) );
                               DB_Conect.doSaveLogImport(PastaLOG, 'Sem Protocolo ' +  PWideChar(  lArquivoImportado ));
                            //   searchResult := FindNext(sr);
                               Inc(X);
                               bLog := True;
                               Continue;
                            end;
                          end;

                          if not qryAux.IsEmpty then
                          begin
                             loNode.Values[5] := 'Existente';
                             MoveFile( PWideChar(  xNomeArquivo ) , PWideChar( lArquivoImportado ) );
                             DB_Conect.doSaveLogImport(PastaLOG, 'Existente ' +  PWideChar(  lArquivoImportado ));
                           //  searchResult := FindNext(sr);
                             Inc(X);
                             bLog := True;

                             Continue;
                          end;


                       end
                       else

                       {begin
                           bLog := True;
                           DB_Conect.doSaveLogImport(PastaLOG, ' Arquivo ' + rgXML.Properties.Items[rgXML.ItemIndex].Caption  + ' Inv�lido ' + PWideChar(  lPath +  xNomeArquivo ));
                        //   searchResult := FindNext(sr);
                           Continue;
                       end;
                    end
                    else

                    if rgXML.ItemIndex  = 2 then }

                    begin
                      XMLDocument.XML.Clear;
                      try
                        XMLDocument.LoadFromFile( xNomeArquivo );

                        if edtCaminho.Text <> '' then
                        begin
                          xPastaClienteLido := CriarPastadoCliente('CCE', ExtractFileName(xNomeArquivo));
                          lArquivoImportado := 'C:\MLSISTEMAS_LIDOS\'  + StrTran(ExtractFilePath(xPastaClienteLido), PastaRAIZ, '');
                          if not DirExists( lArquivoImportado ) then
                          begin
                             if not ForceDirectories( lArquivoImportado ) then
                               Exit;
                          end;
                        end;

                      except
                          DB_Conect.doSaveLogImport(PastaLOG, 'Arquivo CCe Inv�lido ' +  PWideChar(  lArquivoImportado ));
                          MoveFile( PWideChar(   xNomeArquivo ) , PWideChar( lArquivoImportado)  );
                        //  searchResult := FindNext(sr);
                          Continue;
                      end;

                      if xNomeArquivo[1] <> '.' then
                      begin
                         loNode := tlNfe.Add;
                         loNode.Values[4] := xNomeArquivo;
                      end;



                      XMLDocument.Active := True;
                      Try
                         retEvento := XMLDocument.DocumentElement.ChildNodes.FindNode('retEvento');
                         infEvento := retEvento.ChildNodes.FindNode('infEvento');
                      except
                           loNode.Values[5] := 'Arquivo CCe Inv�lido';
                           DB_Conect.doSaveLogImport(PastaLOG, 'Arquivo CCe Inv�lido ' +  PWideChar(  PastaSERVIDORNFE_LIDO +  ExtractFileName( xNomeArquivo ) ));
                           DeleteFile( xNomeArquivo);
                        //   searchResult := FindNext(sr);
                           Continue;
                      End;

                      Try
                          with qryInsert do
                          begin
                            Close;
                            SQL.Clear;
                            SQL.Add(' SELECT cCT FROM XML_IMPORTADA  ');
                            SQL.Add(' WHERE cCT  = :cCT ');
                            SQL.Add(' and nCT = :nCT ');
                            SQL.Add(' and CHCTE = :CHCTE ');
                            SQL.Add(' and TipoXML = :TipoXML ');

                            ParamByName('cCT').asInteger               := StrToInt(infEvento.ChildNodes['tpEvento'].Text);
                            ParamByName('nCT').AsString                := infEvento.ChildNodes['tpEvento'].Text;
                            ParamByName('CHCTE').AsString              := infEvento.ChildNodes['chNFe'].Text;
                            ParamByName('TipoXML').AsString            := 'CCE';
                            Open;
                          end;
                      Except
                          with qryInsert do
                          begin
                            Close;
                            SQL.Clear;
                            SQL.Add(' SELECT cCT FROM XML_IMPORTADA  ');
                            SQL.Add(' WHERE cCT  = :cCT ');
                            SQL.Add(' and nCT = :nCT ');
                            SQL.Add(' and CHCTE = :CHCTE ');
                            SQL.Add(' and TipoXML = :TipoXML ');
                            infEvento      := retEvento.ChildNodes.FindNode('retEnvEvento');
                            subinfEvento   := infEvento.ChildNodes.FindNode('retEvento');
                            _subinfEvento  := subinfEvento.ChildNodes.FindNode('infEvento');
                            ParamByName('cCT').asInteger               := StrToInt(_subinfEvento.ChildNodes['tpEvento'].Text);
                            ParamByName('nCT').AsString                := _subinfEvento.ChildNodes['tpEvento'].Text;
                            ParamByName('CHCTE').AsString              := _subinfEvento.ChildNodes['chNFe'].Text;
                            ParamByName('TipoXML').AsString            := 'CCE';
                            Open;
                          end;
                      End;

                    {  if not qryInsert.IsEmpty then
                      begin
                             MoveFile( PWideChar(  PastaXML + xNomeArquivo ) , PWideChar(  PastaXML_LIDO +  xNomeArquivo ) );
                             bLog := True;
                             DB_Conect.doSaveLogImport(PastaLOG, 'Existente ' +  PWideChar(  PastaXML_LIDO +  xNomeArquivo));
                             searchResult := FindNext(sr);
                             Continue;
                      end;
                        }
                      if (infEvento.ChildNodes['tpEvento'].Text <> '') then
                      begin
                        loNode.Values[0] := infEvento.ChildNodes['tpEvento'].Text;
                        loNode.Values[1] := infEvento.ChildNodes['dhRegEvento'].Text;
                        loNode.Values[2] := infEvento.ChildNodes['tpEvento'].Text;
                        loNode.Values[3] := infEvento.ChildNodes['chNFe'].Text;
                      end
                      else
                      begin
                        loNode.Values[0] := _subinfEvento.ChildNodes['tpEvento'].Text;
                        loNode.Values[1] := _subinfEvento.ChildNodes['dhRegEvento'].Text;
                        loNode.Values[2] := _subinfEvento.ChildNodes['tpEvento'].Text;
                        loNode.Values[3] := _subinfEvento.ChildNodes['chNFe'].Text;
                      end;
                      loNode.Values[5] := 'Importar';

                       if not qryInsert.IsEmpty then
                       begin
                          loNode.Values[5] := 'Existente';
                          MoveFile( PWideChar(  xNomeArquivo ) , PWideChar( lArquivoImportado ) );
                          DB_Conect.doSaveLogImport(PastaLOG, 'Existente ' +  PWideChar(  lArquivoImportado));
                          bLog := True;
                        //  searchResult := FindNext(sr);
                          Inc(X);
                          bLog := True;
                          Continue;
                       end;


                    end;

                except
                    bLog := True;
                    DB_Conect.doSaveLogImport(PastaLOG, ' Arquivo Inv�lido ' + PWideChar(  xNomeArquivo ));
                  //  searchResult := FindNext(sr);
                    Continue;
                end;

               // Inc(i);

             //   searchResult := FindNext(sr);
              end;
            Finally
              FreeAndNil(Listtemp3);
            end;

        end;

   AguardandoProcesso(frmImportador, False);
   if bLog then
     Mens_MensInf('Clique no bot�o Ver Log.');

  except
    on E:Exception do
      begin
        Mens_MensErro('Erro Desconhecido ao Localizar arquivos.!' + #13 +
                        E.Message);
      end;
  end;
  lblTotalReg.Visible := True;
  lblTotalReg.Caption :=  ' � Importar.: ' + IntToStr(i);
  lblTotalImp.Visible := True;
  lblTotalImp.Caption := ' Importado(s) Anteriormente.: ' + IntToStr(x);
end;

procedure TfrmImportador.btnLogClick(Sender: TObject);
Var
 varDataHora, varArquivo : String;
begin

 varDataHora := FormatDateTime('ddmmyyyy',Now);
 varArquivo  := 'log_' +  varDataHora  + '.log';
 if TFile.Exists(  PastaLOG + varArquivo ) then
 begin
   pnTitulo.Caption := PastaLOG + varArquivo;
   mmVisualizar.Lines.LoadFromFile(PastaLOG + varArquivo);
 end;

 if mmVisualizar.Lines.Count = 0 Then
 begin
    Mens_MensInf('Arquivo de log di�rio vazio.');
    Exit;
 end;

 Page.ActivePage := TabLog;

end;

procedure TfrmImportador.ButCancelarClick(Sender: TObject);
begin
   tlNFe.Clear;
   ACBrCTe.Conhecimentos.Clear;
   ACBrNFe.NotasFiscais.Clear;
   XMLDocument.XML.Clear;
   Page.ActivePage     := TabGrid;
   mmVisualizar.Clear;
   pnTitulo.Caption    := '';
end;

procedure TfrmImportador.ButSairClick(Sender: TObject);
begin
  Close;
end;


procedure TfrmImportador.FormCreate(Sender: TObject);
begin
   if not DB_Conect.CarregaPastaXML then
   begin
      Mens_MensErro( 'MLParametros.ini -' + 'Arquivo de Configura��o das Pastas.' );
      Exit;
   end;
   Page.ActivePage := TabGrid;
end;

procedure TfrmImportador.lstArquivosClick(Sender: TObject);
begin
   mmVisualizar.Clear;
   pnTitulo.Caption :=  PastaLOG + Trim(lstArquivos.Items.Text);
   mmVisualizar.Lines.LoadFromFile(PastaLOG + Trim(lstArquivos.Items.Text));
end;

procedure TfrmImportador.PageChange(Sender: TObject);
var
  sr           : TSearchRec;
  searchResult : integer;
begin
  mmVisualizar.Clear;
  if ((Page.ActivePage = TabLog) and (mmVisualizar.Lines.Count = 0)) then
    btnLog.Click;

  lstArquivos.Clear;
  searchResult := FindFirst( PastaLOG + '*.log', faAnyFile, sr );
  while searchResult = 0 do
  begin
       lstArquivos.Items.Add(sr.Name);
       searchResult := FindNext(sr);
  end;

end;

function TfrmImportador.AtualizaNaturezaOperacao(CFOP, CNPJ : string) : String;
var
  sqlConfigNatureza: TSQLQuery;
  sSQL : String;
begin
  sqlConfigNatureza := TSQLQuery.Create(nil);
  try
    sqlConfigNatureza.SQLConnection := DB_Conect.SQLConnection;
    sqlConfigNatureza.Close;
    sqlConfigNatureza.SQL.Clear;
    sqlConfigNatureza.SQL.Add('Select CFOP1, CFOP2 From Natureza_Fornecedor with (nolock) ');
    sqlConfigNatureza.SQL.Add('Where  CFOP1      = :CFOP1   ');
    sqlConfigNatureza.SQL.Add('and CNPJ = :CNPJ  ');

    sqlConfigNatureza.ParamByName('CFOP1').AsString := CFOP;
    sqlConfigNatureza.ParamByName('CNPJ').AsString  := CNPJ;
    sqlConfigNatureza.Open;
    if sqlConfigNatureza.IsEmpty then
    begin
      sqlConfigNatureza.Close;
      sqlConfigNatureza.SQL.Clear;
      sqlConfigNatureza.SQL.Add('Select Top 1  CFOP2 From Natureza with (nolock) ');
      sqlConfigNatureza.SQL.Add('Where  CodNatureza         = :CFOP1   ');
      sqlConfigNatureza.ParamByName('CFOP1').AsString := CFOP;
      sqlConfigNatureza.Open;
    end;

    Result := sqlConfigNatureza.FieldByName('CFOP2').AsString;  // << ---- o certo � cfop2

  finally
    FreeAndNil(sqlConfigNatureza);
  end;
end;


procedure TfrmImportador.RetornarCodigoDestinatarioNFE(Destinatario : pcnNFe.TDest;  NumeroNF : String);
Var
 sSQLUpdate, lSQL : String;
 n : Integer;
begin
   tpRetornoDestinatario.Inicializar;
   With DB_Conect do
   begin
     sqlAux.Close;
     sqlAux.SQL.Text := 'Select cte_destinatario From CTE_DESTINATARIO Where CNPJ = ' + QuotedStr( Destinatario.CNPJCPF);
     sqlAux.Open;
     Try
       if not sqlAux.IsEmpty then
       begin
          tpRetornoDestinatario.trCodigo           := sqlAux.FieldByName('cte_destinatario').AsString;

          sSQLUpdate :=
          'Update CTE_DESTINATARIO '
          +' Set xNome         = :xNome '
          +',cCT               = :cCT '
          +',xFant             = :xFant '
          +',DataInclusao      = :DataInclusao '
          +',CEP               = :CEP '
          +',UF                = :UF '
          +',cMun              = :cMun '
          +',xMun              = :xMun '
          +',xLgr              = :xLgr '
          +',nro               = :nro '
          +',xBairro           = :xBairro '
          +',xCpl              = :xCpl '
        //  +',IEST              = :IEST '
         // +',Fone              = :Fone'
          +' Where CNPJ     = :CNPJ';

          sqlAux.Close;
          sqlAux.SQL.Clear;
          sqlAux.SQL.Add(sSQLUpdate);


            sqlAux.ParamByName('xNome').AsString                := Utf8ToAnsi(Copy(Destinatario.xNome,1,100));
            sqlAux.ParamByName('cCT').AsString                  := NumeroNF;
            sqlAux.ParamByName('xFant').AsString                := Utf8ToAnsi(Copy(Destinatario.xNome,1,40));
            sqlAux.ParamByName('DataInclusao').AsSQLTimeStamp   := DateTimeToSQLTimeStamp(GParFin.DtTrab);
            sqlAux.ParamByName('CEP').AsString                  := IntToStr(Destinatario.enderDest.CEP);
            sqlAux.ParamByName('UF').AsString                   := Destinatario.enderDest.UF;
            sqlAux.ParamByName('cMun').asInteger                := Destinatario.enderDest.cMun;
            sqlAux.ParamByName('xMun').AsString                 := Destinatario.enderDest.xMun;
            sqlAux.ParamByName('xLgr').AsString                 := Destinatario.enderDest.xLgr;
            sqlAux.ParamByName('nro').AsString                  := Destinatario.enderDest.nro;
            sqlAux.ParamByName('xBairro').AsString              := Destinatario.enderDest.xBairro;
            sqlAux.ParamByName('xCpl').AsString                 := Destinatario.enderDest.xCpl;
          //  qryAux.ParamByName('IEST').AsString                 := Dest.IEST;;
            //sqlAux.ParamByName('Fone').AsString                 := enderDest.fone;
            sqlAux.ParamByName('CNPJ').AsString                 := Destinatario.CNPJCPF;


          try
            sqlAux.ExecSQL;

          except
            On E:Exception do
              begin
                Writeln( 'Falha ao Alterar CTE_DESTINATARIO.' + E.Message );
              end;
          end;

       end
     else
       begin
          lSQL := ' INSERT INTO [dbo].[CTE_Destinatario]( ';
          lSQL := lSQL + ' cCT ';
          lSQL := lSQL + ',CNPJ';
          lSQL := lSQL + ',IE';
       //   lSQL := lSQL + ',IEST';
          lSQL := lSQL + ',xNome';
          lSQL := lSQL + ',xFant';
       //   lSQL := lSQL + ',Fone';
          lSQL := lSQL + ',xCpl';
          lSQL := lSQL + ',xLgr';
          lSQL := lSQL + ',nro';
          lSQL := lSQL + ',xBairro';
          lSQL := lSQL + ',cMun';
          lSQL := lSQL + ',xMun';
          lSQL := lSQL + ',CEP';
          lSQL := lSQL + ',UF)';
          lSQL := lSQL + ' VALUES ( ' ;
          lSQL := lSQL + ':cCT ';
          lSQL := lSQL +',:CNPJ ';
          lSQL := lSQL +',:IE ';
     //     lSQL := lSQL +',:IEST ';
          lSQL := lSQL +',:xNome ';
          lSQL := lSQL +',:xFant ';
  //         lSQL := lSQL +',:Fone ';
          lSQL := lSQL +',:xCpl ';
          lSQL := lSQL +',:xLgr ';
          lSQL := lSQL +',:nro ';
          lSQL := lSQL +',:xBairro ';
          lSQL := lSQL +',:cMun';
          lSQL := lSQL +',:xMun';
          lSQL := lSQL +',:CEP';
          lSQL := lSQL +',:UF)';

          sqlAux.Close;
          sqlAux.SQL.Clear;
          sqlAux.SQL.Add( lSQL );

              sqlAux.ParamByName('cCT').AsString                     := NumeroNF;
              sqlAux.ParamByName('CNPJ').AsString                    := Destinatario.CNPJCPF;
              sqlAux.ParamByName('IE').AsString                      := Destinatario.IE;
             // qryInsert.ParamByName('IEST').AsString                  := Dest.IEST;
              sqlAux.ParamByName('xNome').AsString                   := Utf8ToAnsi(Copy(Destinatario.xNome,1,100));
              sqlAux.ParamByName('xFant').AsString                   := Utf8ToAnsi(Copy(Destinatario.xNome,1,40));
      //      qryInsert.ParamByName('Fone').AsString                 := Dest.enderDest.fone;
              sqlAux.ParamByName('xCpl').AsString                    := Destinatario.enderDest.xCpl;
              sqlAux.ParamByName('xLgr').AsString                    := Destinatario.enderDest.xLgr;
              sqlAux.ParamByName('nro').AsString                     := Destinatario.enderDest.nro;
              sqlAux.ParamByName('xBairro').AsString                 := Destinatario.enderDest.xBairro;
              sqlAux.ParamByName('cMun').AsString                    := IntToStr(Destinatario.enderDest.cMun);
              sqlAux.ParamByName('xMun').AsString                    := Destinatario.enderDest.xMun;

              sqlAux.ParamByName('CEP').AsString                     := IntToStr(Destinatario.enderDest.CEP);
              sqlAux.ParamByName('UF').AsString                      := Destinatario.enderDest.UF;



          try
            sqlAux.ExecSQL;


            Try
               lSQL  := 'SELECT @@IDENTITY as CTE_Destinatario ';

               sqlAux.Close;
               sqlAux.SQL.Clear;
               sqlAux.SQL.Add( lSQL );
               sqlAux.Open;
               tpRetornoDestinatario.trCodigo := sqlAux.FieldByName('CTE_Destinatario').AsString;

             except
               On E:Exception do
                 begin
                    DB_Conect.doSaveLogImport(PastaLOG, Db_Conect.GetComando(sqlAux) + #13#10 + 'Falha ao pegar chave da CTE_Destinatario.' + E.Message);
                  end;
             end;

          except
            On E:Exception do
              begin
                DB_Conect.doSaveLogImport(PastaLOG, Db_Conect.GetComando(sqlAux) + #13#10 + 'Falha ao incluir CTE_Destinatario.' + E.Message);
              end;
          end;
       end;
      except
      on E:Exception do
         begin
           Writeln('Falha do Importar o CTE_Destinatario');
         end;

     End;
   end;
end;

procedure TfrmImportador.RetornarCodigoFornecedorNFE(Emitente : pcnNFe.TEmit;  NumeroNF: String );
Var
 sSQLUpdate, lSQL  : String;
 n :Integer;
begin
   tpRetornoEmitente.Inicializar;
   with DB_Conect do
   begin
     sqlAux.Close;
     sqlAux.SQL.Text := 'Select CTE_EMITENTE_ID, CDContabil, CdCentroCusto, RegimeICMS From CTE_EMITENTE Where CNPJCPF = ' + QuotedStr(Emitente.CNPJCPF);
     sqlAux.Open;
     Try
       if not sqlAux.IsEmpty then
       begin
          tpRetornoEmitente.trCodigo           := sqlAux.FieldByName('CTE_EMITENTE_ID').AsString;
          tpRetornoEmitente.trCodPlanoContatil := sqlAux.FieldByName('CDContabil').AsString;
          tpRetornoEmitente.trCodCentroCusto   := sqlAux.FieldByName('CdCentroCusto').AsString;
          tpRetornoEmitente.trRegimeICMS       := sqlAux.FieldByName('RegimeICMS').AsString;

          sSQLUpdate :=
          'Update CTE_EMITENTE '
          +' Set xNome         = :xNome '
          +',cCT               = :cCT '
          +',xFant             = :xFant '
          +',DataInclusao      = :DataInclusao '
          +',CEP               = :CEP '
          +',UF                = :UF '
          +',cMun              = :cMun '
          +',xMun              = :xMun '
          +',xLgr              = :xLgr '
          +',nro               = :nro '
          +',xBairro           = :xBairro '
          +',xCpl              = :xCpl '
          +',IEST              = :IEST '
          +',Fone              = :Fone'
      //    +',RegimeICMS        = :RegimeICMS'
          +' Where CNPJCPF     = :CNPJCPF';

          sqlAux.Close;
          sqlAux.SQL.Clear;
          sqlAux.SQL.Add(sSQLUpdate);
         Try

           sqlAux.ParamByName('xNome').AsString                := Utf8ToAnsi(Copy(Emitente.xNome,1,100));
           sqlAux.ParamByName('cCT').AsString                  := NumeroNF;
           sqlAux.ParamByName('xFant').AsString                := Utf8ToAnsi(Copy(Emitente.xFant,1,40));
           sqlAux.ParamByName('DataInclusao').AsSQLTimeStamp   := DateTimeToSQLTimeStamp(GParFin.DtTrab);
           sqlAux.ParamByName('CEP').AsString                  := IntToStr(Emitente.EnderEmit.CEP);
           sqlAux.ParamByName('UF').AsString                   := Emitente.EnderEmit.UF;
           sqlAux.ParamByName('cMun').asInteger                := Emitente.EnderEmit.cMun;
           sqlAux.ParamByName('xMun').AsString                 := Emitente.EnderEmit.xMun;
           sqlAux.ParamByName('xLgr').AsString                 := Emitente.EnderEmit.xLgr;
           sqlAux.ParamByName('nro').AsString                  := Emitente.EnderEmit.nro;
           sqlAux.ParamByName('xBairro').AsString              := Emitente.EnderEmit.xBairro;
           sqlAux.ParamByName('xCpl').AsString                 := Emitente.EnderEmit.xCpl;
           sqlAux.ParamByName('IEST').AsString                 := Emitente.IEST;;
           sqlAux.ParamByName('Fone').AsString                 := Emitente.EnderEmit.fone;
      //     sqlAux.ParamByName('RegimeICMS').AsString           := CRTToStr(EnderEmit.CRT);
           sqlAux.ParamByName('CNPJCPF').AsString              := Emitente.CNPJCPF;

         except
            On E:Exception do
                DB_Conect.doSaveLogImport(PastaLOG, GetComando(sqlAux) + #13#10 + 'Falha ao Alterar CTE_EMITENTE.' + E.Message);
         End;
          try
            sqlAux.ExecSQL;

          except
            On E:Exception do
              begin
                DB_Conect.doSaveLogImport(PastaLOG, GetComando(sqlAux) + #13#10 + 'Falha ao Alterar CTE_EMITENTE.' + E.Message);
              end;
          end;

       end
       else
       begin

          lSQL := ' INSERT INTO [dbo].[CTE_EMITENTE]( ';
          lSQL := lSQL + ' cCT ';
          lSQL := lSQL + ',CNPJCPF';
          lSQL := lSQL + ',IE';
          lSQL := lSQL + ',IEST';
          lSQL := lSQL + ',xNome';
          lSQL := lSQL + ',xFant';
          lSQL := lSQL + ',Fone';
          lSQL := lSQL + ',xCpl';
          lSQL := lSQL + ',xLgr';
          lSQL := lSQL + ',nro';
          lSQL := lSQL + ',xBairro';
          lSQL := lSQL + ',cMun';
          lSQL := lSQL + ',xMun';
          lSQL := lSQL + ',CEP';
          lSQL := lSQL + ',UF)';
          lSQL := lSQL + ' VALUES ( ' ;
          lSQL := lSQL + ':cCT ';
          lSQL := lSQL +',:CNPJCPF ';
          lSQL := lSQL +',:IE ';
          lSQL := lSQL +',:IEST ';
          lSQL := lSQL +',:xNome ';
          lSQL := lSQL +',:xFant ';
          lSQL := lSQL +',:Fone ';
          lSQL := lSQL +',:xCpl ';
          lSQL := lSQL +',:xLgr ';
          lSQL := lSQL +',:nro ';
          lSQL := lSQL +',:xBairro ';
          lSQL := lSQL +',:cMun';
          lSQL := lSQL +',:xMun';
          lSQL := lSQL +',:CEP';
          lSQL := lSQL +',:UF)';

          sqlAux.Close;
          sqlAux.SQL.Clear;
          sqlAux.SQL.Add(lSQL);

             sqlAux.ParamByName('cCT').AsString                     := NumeroNF;
             sqlAux.ParamByName('CNPJCPF').AsString                 := Emitente.CNPJCPF;
             sqlAux.ParamByName('IE').AsString                      := Emitente.IE;
             sqlAux.ParamByName('IEST').AsString                    := Emitente.IEST;
             sqlAux.ParamByName('xNome').AsString                   := Utf8ToAnsi(Copy(Emitente.xNome,1,100));
             sqlAux.ParamByName('xFant').AsString                   := Utf8ToAnsi(Copy(Emitente.xFant,1,40));
             sqlAux.ParamByName('Fone').AsString                    := Emitente.EnderEmit.fone;
             sqlAux.ParamByName('xCpl').AsString                    := Emitente.EnderEmit.xCpl;
             sqlAux.ParamByName('xLgr').AsString                    := Emitente.EnderEmit.xLgr;
             sqlAux.ParamByName('nro').AsString                     := Emitente.EnderEmit.nro;
             sqlAux.ParamByName('xBairro').AsString                 := Emitente.EnderEmit.xBairro;
             sqlAux.ParamByName('cMun').AsString                    := IntToStr(Emitente.EnderEmit.cMun);
             sqlAux.ParamByName('xMun').AsString                    := Emitente.EnderEmit.xMun;
             sqlAux.ParamByName('CEP').AsString                     := IntToStr(Emitente.EnderEmit.CEP);
             sqlAux.ParamByName('UF').AsString                      := Emitente.EnderEmit.UF;


          try
            sqlAux.ExecSQL;
            tpRetornoEmitente.Inicializar;
            Try
               lSQL  := 'SELECT @@IDENTITY as CTE_EMITENTE_ID ';

               sqlAux.Close;
               sqlAux.SQL.Clear;
               sqlAux.SQL.Add( lSQL );
               sqlAux.Open;
               tpRetornoEmitente.trCodigo := sqlAux.FieldByName('CTE_EMITENTE_ID').AsString;

             except
               On E:Exception do
                 begin
                    DB_Conect.doSaveLogImport(PastaLOG, Db_Conect.GetComando(sqlAux) + #13#10 + 'Falha ao pegar chave da CTE_EMITENTE_ID.' + E.Message);
                  end;
             end;

          except
            On E:Exception do
              begin
                DB_Conect.doSaveLogImport(PastaLOG, GetComando(sqlAux) + #13#10 + 'Falha ao Incluir CTE_EMITENTE.' + E.Message);
              end;
          end;

       end;
     except
      on E:Exception do
         begin
           Writeln('Falha do Importar o CTE_EMITENTE');
         end;
     End;
   end;

end;


procedure TfrmImportador.RetornarCodigoDestinatarioCTE(Destinatario  : pcteCTe.TDest;  NumeroNF : String);
Var
 sSQLUpdate, lSQL : String;
 n : Integer;
begin
   tpRetornoDestinatario.Inicializar;
   With DB_Conect do
   begin
     sqlAux.Close;
     sqlAux.SQL.Text := 'Select cte_destinatario From CTE_DESTINATARIO Where CNPJ = ' + QuotedStr( Destinatario.CNPJCPF);
     sqlAux.Open;
     Try
       if not sqlAux.IsEmpty then
       begin
          tpRetornoDestinatario.trCodigo           := sqlAux.FieldByName('cte_destinatario').AsString;

          sSQLUpdate :=
          'Update CTE_DESTINATARIO '
          +' Set xNome         = :xNome '
          +',cCT               = :cCT '
          +',xFant             = :xFant '
          +',DataInclusao      = :DataInclusao '
          +',CEP               = :CEP '
          +',UF                = :UF '
          +',cMun              = :cMun '
          +',xMun              = :xMun '
          +',xLgr              = :xLgr '
          +',nro               = :nro '
          +',xBairro           = :xBairro '
          +',xCpl              = :xCpl '
        //  +',IEST              = :IEST '
         // +',Fone              = :Fone'
          +' Where CNPJ     = :CNPJ';

          sqlAux.Close;
          sqlAux.SQL.Clear;
          sqlAux.SQL.Add(sSQLUpdate);


            sqlAux.ParamByName('xNome').AsString                := Utf8ToAnsi(Copy(Destinatario.xNome,1,100));
            sqlAux.ParamByName('cCT').AsString                  := NumeroNF;
            sqlAux.ParamByName('xFant').AsString                := Utf8ToAnsi(Copy(Destinatario.xNome,1,40));
            sqlAux.ParamByName('DataInclusao').AsSQLTimeStamp   := DateTimeToSQLTimeStamp(GParFin.DtTrab);
            sqlAux.ParamByName('CEP').AsString                  := IntToStr(Destinatario.enderDest.CEP);
            sqlAux.ParamByName('UF').AsString                   := Destinatario.enderDest.UF;
            sqlAux.ParamByName('cMun').asInteger                := Destinatario.enderDest.cMun;
            sqlAux.ParamByName('xMun').AsString                 := Destinatario.enderDest.xMun;
            sqlAux.ParamByName('xLgr').AsString                 := Destinatario.enderDest.xLgr;
            sqlAux.ParamByName('nro').AsString                  := Destinatario.enderDest.nro;
            sqlAux.ParamByName('xBairro').AsString              := Destinatario.enderDest.xBairro;
            sqlAux.ParamByName('xCpl').AsString                 := Destinatario.enderDest.xCpl;
          //  qryAux.ParamByName('IEST').AsString                 := Dest.IEST;;
            //sqlAux.ParamByName('Fone').AsString                 := enderDest.fone;
            sqlAux.ParamByName('CNPJ').AsString                 := Destinatario.CNPJCPF;


          try
            sqlAux.ExecSQL;

          except
            On E:Exception do
              begin
                Writeln( 'Falha ao Alterar CTE_DESTINATARIO.' + E.Message );
              end;
          end;

       end
     else
       begin
          lSQL := ' INSERT INTO [dbo].[CTE_Destinatario]( ';
          lSQL := lSQL + ' cCT ';
          lSQL := lSQL + ',CNPJ';
          lSQL := lSQL + ',IE';
       //   lSQL := lSQL + ',IEST';
          lSQL := lSQL + ',xNome';
          lSQL := lSQL + ',xFant';
       //   lSQL := lSQL + ',Fone';
          lSQL := lSQL + ',xCpl';
          lSQL := lSQL + ',xLgr';
          lSQL := lSQL + ',nro';
          lSQL := lSQL + ',xBairro';
          lSQL := lSQL + ',cMun';
          lSQL := lSQL + ',xMun';
          lSQL := lSQL + ',CEP';
          lSQL := lSQL + ',UF)';
          lSQL := lSQL + ' VALUES ( ' ;
          lSQL := lSQL + ':cCT ';
          lSQL := lSQL +',:CNPJ ';
          lSQL := lSQL +',:IE ';
     //     lSQL := lSQL +',:IEST ';
          lSQL := lSQL +',:xNome ';
          lSQL := lSQL +',:xFant ';
  //         lSQL := lSQL +',:Fone ';
          lSQL := lSQL +',:xCpl ';
          lSQL := lSQL +',:xLgr ';
          lSQL := lSQL +',:nro ';
          lSQL := lSQL +',:xBairro ';
          lSQL := lSQL +',:cMun';
          lSQL := lSQL +',:xMun';
          lSQL := lSQL +',:CEP';
          lSQL := lSQL +',:UF)';

          sqlAux.Close;
          sqlAux.SQL.Clear;
          sqlAux.SQL.Add( lSQL );
          with Destinatario do
          begin
              sqlAux.ParamByName('cCT').AsString                     := NumeroNF;
              sqlAux.ParamByName('CNPJ').AsString                    := Destinatario.CNPJCPF;
              sqlAux.ParamByName('IE').AsString                      := IE;
             // qryInsert.ParamByName('IEST').AsString                  := Dest.IEST;
              sqlAux.ParamByName('xNome').AsString                   := Utf8ToAnsi(Copy(Destinatario.xNome,1,100));
              sqlAux.ParamByName('xFant').AsString                   := Utf8ToAnsi(Copy(Destinatario.xNome,1,40));
      //           qryInsert.ParamByName('Fone').AsString               := Dest.enderDest.fone;
              sqlAux.ParamByName('xCpl').AsString                    := enderDest.xCpl;
              sqlAux.ParamByName('xLgr').AsString                    := enderDest.xLgr;
              sqlAux.ParamByName('nro').AsString                     := enderDest.nro;
              sqlAux.ParamByName('xBairro').AsString                 := enderDest.xBairro;
              sqlAux.ParamByName('cMun').AsString                    := IntToStr(enderDest.cMun);
              sqlAux.ParamByName('xMun').AsString                    := enderDest.xMun;

              sqlAux.ParamByName('CEP').AsString                     := IntToStr(enderDest.CEP);
              sqlAux.ParamByName('UF').AsString                      := enderDest.UF;

          end;

          try
            sqlAux.ExecSQL;


            Try
               lSQL  := 'SELECT @@IDENTITY as CTE_Destinatario ';

               sqlAux.Close;
               sqlAux.SQL.Clear;
               sqlAux.SQL.Add( lSQL );
               sqlAux.Open;
               tpRetornoDestinatario.trCodigo := sqlAux.FieldByName('CTE_Destinatario').AsString;

             except
               On E:Exception do
                 begin
                    DB_Conect.doSaveLogImport(PastaLOG, Db_Conect.GetComando(sqlAux) + #13#10 + 'Falha ao pegar chave da CTE_Destinatario.' + E.Message);
                  end;
             end;

          except
            On E:Exception do
              begin
                DB_Conect.doSaveLogImport(PastaLOG, Db_Conect.GetComando(sqlAux) + #13#10 + 'Falha ao incluir CTE_Destinatario.' + E.Message);
              end;
          end;
       end;
      except
      on E:Exception do
         begin
           Writeln('Falha do Importar o CTE_Destinatario');
         end;

     End;
   end;
end;


procedure TfrmImportador.RetornarCodigoFornecedorCTE(Emitente : pcteCTe.TEmit;  NumeroNF: String );
Var
 sSQLUpdate, lSQL  : String;
 n :Integer;
begin
   tpRetornoEmitente.Inicializar;
   with DB_Conect do
   begin
     sqlAux.Close;
     sqlAux.SQL.Text := 'Select CTE_EMITENTE_ID, CDContabil, CdCentroCusto, RegimeICMS From CTE_EMITENTE Where CNPJCPF = ' + QuotedStr(Emitente.CNPJ );
     sqlAux.Open;
     Try
       if not sqlAux.IsEmpty then
       begin
          tpRetornoEmitente.trCodigo           := sqlAux.FieldByName('CTE_EMITENTE_ID').AsString;
          tpRetornoEmitente.trCodPlanoContatil := sqlAux.FieldByName('CDContabil').AsString;
          tpRetornoEmitente.trCodCentroCusto   := sqlAux.FieldByName('CdCentroCusto').AsString;
          tpRetornoEmitente.trRegimeICMS       := sqlAux.FieldByName('RegimeICMS').AsString;

          sSQLUpdate :=
          'Update CTE_EMITENTE '
          +' Set xNome         = :xNome '
          +',cCT               = :cCT '
          +',xFant             = :xFant '
          +',DataInclusao      = :DataInclusao '
          +',CEP               = :CEP '
          +',UF                = :UF '
          +',cMun              = :cMun '
          +',xMun              = :xMun '
          +',xLgr              = :xLgr '
          +',nro               = :nro '
          +',xBairro           = :xBairro '
          +',xCpl              = :xCpl '
          +',IEST              = :IEST '
          +',Fone              = :Fone'
      //    +',RegimeICMS        = :RegimeICMS'
          +' Where CNPJCPF     = :CNPJCPF';

          sqlAux.Close;
          sqlAux.SQL.Clear;
          sqlAux.SQL.Add(sSQLUpdate);
         Try
          with Emitente do
          begin
            sqlAux.ParamByName('xNome').AsString                := Utf8ToAnsi(Copy(xNome,1,100));
            sqlAux.ParamByName('cCT').AsString                  := NumeroNF;
            sqlAux.ParamByName('xFant').AsString                := Utf8ToAnsi(Copy(Emitente.xFant,1,40));
            sqlAux.ParamByName('DataInclusao').AsSQLTimeStamp   := DateTimeToSQLTimeStamp(GParFin.DtTrab);
            sqlAux.ParamByName('CEP').AsString                  := IntToStr(EnderEmit.CEP);
            sqlAux.ParamByName('UF').AsString                   := EnderEmit.UF;
            sqlAux.ParamByName('cMun').asInteger                := EnderEmit.cMun;
            sqlAux.ParamByName('xMun').AsString                 := EnderEmit.xMun;
            sqlAux.ParamByName('xLgr').AsString                 := EnderEmit.xLgr;
            sqlAux.ParamByName('nro').AsString                  := EnderEmit.nro;
            sqlAux.ParamByName('xBairro').AsString              := EnderEmit.xBairro;
            sqlAux.ParamByName('xCpl').AsString                 := EnderEmit.xCpl;
            sqlAux.ParamByName('IEST').AsString                 := IEST;;
            sqlAux.ParamByName('Fone').AsString                 := EnderEmit.fone;
       //     sqlAux.ParamByName('RegimeICMS').AsString           := CRTToStr(EnderEmit.CRT);
            sqlAux.ParamByName('CNPJCPF').AsString              := Emitente.CNPJ;
          end;

         except
            On E:Exception do
                DB_Conect.doSaveLogImport(PastaLOG, GetComando(sqlAux) + #13#10 + 'Falha ao Alterar CTE_EMITENTE.' + E.Message);
         End;
          try
            sqlAux.ExecSQL;

          except
            On E:Exception do
              begin
                DB_Conect.doSaveLogImport(PastaLOG, GetComando(sqlAux) + #13#10 + 'Falha ao Alterar CTE_EMITENTE.' + E.Message);
              end;
          end;

       end
       else
       begin

          lSQL := ' INSERT INTO [dbo].[CTE_EMITENTE]( ';
          lSQL := lSQL + ' cCT ';
          lSQL := lSQL + ',CNPJCPF';
          lSQL := lSQL + ',IE';
          lSQL := lSQL + ',IEST';
          lSQL := lSQL + ',xNome';
          lSQL := lSQL + ',xFant';
          lSQL := lSQL + ',Fone';
          lSQL := lSQL + ',xCpl';
          lSQL := lSQL + ',xLgr';
          lSQL := lSQL + ',nro';
          lSQL := lSQL + ',xBairro';
          lSQL := lSQL + ',cMun';
          lSQL := lSQL + ',xMun';
          lSQL := lSQL + ',CEP';
          lSQL := lSQL + ',UF)';
          lSQL := lSQL + ' VALUES ( ' ;
          lSQL := lSQL + ':cCT ';
          lSQL := lSQL +',:CNPJCPF ';
          lSQL := lSQL +',:IE ';
          lSQL := lSQL +',:IEST ';
          lSQL := lSQL +',:xNome ';
          lSQL := lSQL +',:xFant ';
          lSQL := lSQL +',:Fone ';
          lSQL := lSQL +',:xCpl ';
          lSQL := lSQL +',:xLgr ';
          lSQL := lSQL +',:nro ';
          lSQL := lSQL +',:xBairro ';
          lSQL := lSQL +',:cMun';
          lSQL := lSQL +',:xMun';
          lSQL := lSQL +',:CEP';
          lSQL := lSQL +',:UF)';

          sqlAux.Close;
          sqlAux.SQL.Clear;
          sqlAux.SQL.Add(lSQL);
          with Emitente do
          begin
             sqlAux.ParamByName('cCT').AsString                     := NumeroNF;
             sqlAux.ParamByName('CNPJCPF').AsString                 := Emitente.CNPJ;
             sqlAux.ParamByName('IE').AsString                      := IE;
             sqlAux.ParamByName('IEST').AsString                    := IEST;
             sqlAux.ParamByName('xNome').AsString                   := Utf8ToAnsi(Copy(xNome,1,100));
             sqlAux.ParamByName('xFant').AsString                   := Utf8ToAnsi(Copy(xNome,1,40));
             sqlAux.ParamByName('Fone').AsString                    := EnderEmit.fone;
             sqlAux.ParamByName('xCpl').AsString                    := EnderEmit.xCpl;
             sqlAux.ParamByName('xLgr').AsString                    := EnderEmit.xLgr;
             sqlAux.ParamByName('nro').AsString                     := EnderEmit.nro;
             sqlAux.ParamByName('xBairro').AsString                 := EnderEmit.xBairro;
             sqlAux.ParamByName('cMun').AsString                    := IntToStr(EnderEmit.cMun);
             sqlAux.ParamByName('xMun').AsString                    := EnderEmit.xMun;

             sqlAux.ParamByName('CEP').AsString                     := IntToStr(EnderEmit.CEP);
             sqlAux.ParamByName('UF').AsString                      := EnderEmit.UF;
          end;

          try
            sqlAux.ExecSQL;
            tpRetornoEmitente.Inicializar;
            Try
               lSQL  := 'SELECT @@IDENTITY as CTE_EMITENTE_ID ';

               sqlAux.Close;
               sqlAux.SQL.Clear;
               sqlAux.SQL.Add( lSQL );
               sqlAux.Open;
               tpRetornoEmitente.trCodigo := sqlAux.FieldByName('CTE_EMITENTE_ID').AsString;

             except
               On E:Exception do
                 begin
                    DB_Conect.doSaveLogImport(PastaLOG, Db_Conect.GetComando(sqlAux) + #13#10 + 'Falha ao pegar chave da CTE_EMITENTE_ID.' + E.Message);
                  end;
             end;

          except
            On E:Exception do
              begin
                DB_Conect.doSaveLogImport(PastaLOG, GetComando(sqlAux) + #13#10 + 'Falha ao Incluir CTE_EMITENTE.' + E.Message);
              end;
          end;

       end;
     except
      on E:Exception do
         begin
           Writeln('Falha do Importar o CTE_EMITENTE');
         end;
     End;
   end;

end;


end.


var
 i, j, k, n  : integer;
 Nota, Node, NodePai, NodeItem: TTreeNode;
begin
 OpenDialog1.FileName  :=  '';
 OpenDialog1.Title := 'Selecione o CTe';
 OpenDialog1.DefaultExt := '*-cte.xml';
 OpenDialog1.Filter := 'Arquivos CTe (*-cte.xml)|*-cte.xml|Arquivos XML (*.xml)|*.xml|Todos os Arquivos (*.*)|*.*';
 OpenDialog1.InitialDir := ACBrCTe1.Configuracoes.Arquivos.PathSalvar;

 if OpenDialog1.Execute then
  begin
   ACBrCTe1.Conhecimentos.Clear;
   ACBrCTe1.Conhecimentos.LoadFromFile(OpenDialog1.FileName);
   trvwCTe.Items.Clear;

   for n:=0 to ACBrCTe1.Conhecimentos.Count-1 do
    begin
     with ACBrCTe1.Conhecimentos.Items[n].CTe do
      begin
       (*
       Nota := trvwCTe.Items.Add(nil,infCTe.ID);
       trvwCTe.Items.AddChild(Nota,'ID= ' +infCTe.ID);
       Node := trvwCTe.Items.AddChild(Nota,'procCTe');
       trvwCTe.Items.AddChild(Node,'tpAmb= '     +TpAmbToStr(procCTe.tpAmb));
       trvwCTe.Items.AddChild(Node,'verAplic= '  +procCTe.verAplic);
       trvwCTe.Items.AddChild(Node,'chCTe= '     +procCTe.chCTe);
       trvwCTe.Items.AddChild(Node,'dhRecbto= '  +DateTimeToStr(procCTe.dhRecbto));
       trvwCTe.Items.AddChild(Node,'nProt= '     +procCTe.nProt);
       trvwCTe.Items.AddChild(Node,'digVal= '    +procCTe.digVal);
       trvwCTe.Items.AddChild(Node,'cStat= '     +IntToStr(procCTe.cStat));
       trvwCTe.Items.AddChild(Node,'xMotivo= '   +procCTe.xMotivo);

       Node := trvwCTe.Items.AddChild(Nota,'Ide');
       trvwCTe.Items.AddChild(Node,'cNF= '     +IntToStr(Ide.cNF));
       trvwCTe.Items.AddChild(Node,'natOp= '   +Ide.natOp );
       trvwCTe.Items.AddChild(Node,'indPag= '  +IndpagToStr(Ide.indPag));
       trvwCTe.Items.AddChild(Node,'modelo= '  +IntToStr(Ide.modelo));
       trvwCTe.Items.AddChild(Node,'serie= '   +IntToStr(Ide.serie));
       trvwCTe.Items.AddChild(Node,'nNF= '     +IntToStr(Ide.nNF));
       trvwCTe.Items.AddChild(Node,'dEmi= '    +DateToStr(Ide.dEmi));
       trvwCTe.Items.AddChild(Node,'dSaiEnt= ' +DateToStr(Ide.dSaiEnt));
       trvwCTe.Items.AddChild(Node,'tpNF= '    +tpNFToStr(Ide.tpNF));
       trvwCTe.Items.AddChild(Node,'finCTe= '  +FinCTeToStr(Ide.finCTe));
       trvwCTe.Items.AddChild(Node,'verProc= ' +Ide.verProc);
       trvwCTe.Items.AddChild(Node,'cUF= '     +IntToStr(Ide.cUF));
       trvwCTe.Items.AddChild(Node,'cMunFG= '  +IntToStr(Ide.cMunFG));
       trvwCTe.Items.AddChild(Node,'tpImp= '   +TpImpToStr(Ide.tpImp));
       trvwCTe.Items.AddChild(Node,'tpEmis= '  +TpEmisToStr(Ide.tpEmis));
       trvwCTe.Items.AddChild(Node,'cDV= '     +IntToStr(Ide.cDV));
       trvwCTe.Items.AddChild(Node,'tpAmb= '   +TpAmbToStr(Ide.tpAmb));
       trvwCTe.Items.AddChild(Node,'finCTe= '  +FinCTeToStr(Ide.finCTe));
       trvwCTe.Items.AddChild(Node,'procEmi= ' +procEmiToStr(Ide.procEmi));
       trvwCTe.Items.AddChild(Node,'verProc= ' +Ide.verProc);

       for i:=0 to Ide.NFref.Count-1 do
        begin
          Node := trvwCTe.Items.AddChild(Node,'NFRef'+IntToStrZero(i+1,3));
          trvwCTe.Items.AddChild(Node,'refCTe= ' +Ide.NFref.Items[i].refCTe);
          trvwCTe.Items.AddChild(Node,'cUF= '    +IntToStr(Ide.NFref.Items[i].RefNF.cUF));
          trvwCTe.Items.AddChild(Node,'AAMM= '   +Ide.NFref.Items[i].RefNF.AAMM);
          trvwCTe.Items.AddChild(Node,'CNPJ= '   +Ide.NFref.Items[i].RefNF.CNPJ);
          trvwCTe.Items.AddChild(Node,'modelo= ' +IntToStr(Ide.NFref.Items[i].RefNF.modelo));
          trvwCTe.Items.AddChild(Node,'serie= '  +IntToStr(Ide.NFref.Items[i].RefNF.serie));
          trvwCTe.Items.AddChild(Node,'nNF= '    +IntToStr(Ide.NFref.Items[i].RefNF.nNF));
        end;

       Node := trvwCTe.Items.AddChild(Nota,'Emit');
       trvwCTe.Items.AddChild(Node,'CNPJCPF= ' +Emit.CNPJCPF);
       trvwCTe.Items.AddChild(Node,'IE='       +Emit.IE);
       trvwCTe.Items.AddChild(Node,'xNome='    +Emit.xNome);
       trvwCTe.Items.AddChild(Node,'xFant='    +Emit.xFant );
       trvwCTe.Items.AddChild(Node,'IEST='     +Emit.IEST);
       trvwCTe.Items.AddChild(Node,'IM='       +Emit.IM);
       trvwCTe.Items.AddChild(Node,'CNAE='     +Emit.CNAE);

       Node := trvwCTe.Items.AddChild(Node,'EnderEmit');
       trvwCTe.Items.AddChild(Node,'Fone='    +Emit.EnderEmit.fone);
       trvwCTe.Items.AddChild(Node,'CEP='     +IntToStr(Emit.EnderEmit.CEP));
       trvwCTe.Items.AddChild(Node,'xLgr='    +Emit.EnderEmit.xLgr);
       trvwCTe.Items.AddChild(Node,'nro='     +Emit.EnderEmit.nro);
       trvwCTe.Items.AddChild(Node,'xCpl='    +Emit.EnderEmit.xCpl);
       trvwCTe.Items.AddChild(Node,'xBairro=' +Emit.EnderEmit.xBairro);
       trvwCTe.Items.AddChild(Node,'cMun='    +IntToStr(Emit.EnderEmit.cMun));
       trvwCTe.Items.AddChild(Node,'xMun='    +Emit.EnderEmit.xMun);
       trvwCTe.Items.AddChild(Node,'UF'       +Emit.EnderEmit.UF);
       trvwCTe.Items.AddChild(Node,'cPais='   +IntToStr(Emit.EnderEmit.cPais));
       trvwCTe.Items.AddChild(Node,'xPais='   +Emit.EnderEmit.xPais);

       if Avulsa.CNPJ  <> '' then
        begin
          Node := trvwCTe.Items.AddChild(Nota,'Avulsa');
          trvwCTe.Items.AddChild(Node,'CNPJ='    +Avulsa.CNPJ);
          trvwCTe.Items.AddChild(Node,'xOrgao='  +Avulsa.xOrgao);
          trvwCTe.Items.AddChild(Node,'matr='    +Avulsa.matr );
          trvwCTe.Items.AddChild(Node,'xAgente=' +Avulsa.xAgente);
          trvwCTe.Items.AddChild(Node,'fone='    +Avulsa.fone);
          trvwCTe.Items.AddChild(Node,'UF='      +Avulsa.UF);
          trvwCTe.Items.AddChild(Node,'nDAR='    +Avulsa.nDAR);
          trvwCTe.Items.AddChild(Node,'dEmi='    +DateToStr(Avulsa.dEmi));
          trvwCTe.Items.AddChild(Node,'vDAR='    +FloatToStr(Avulsa.vDAR));
          trvwCTe.Items.AddChild(Node,'repEmi='  +Avulsa.repEmi);
          trvwCTe.Items.AddChild(Node,'dPag='    +DateToStr(Avulsa.dPag));
        end;

       Node := trvwCTe.Items.AddChild(Nota,'Dest');
       trvwCTe.Items.AddChild(Node,'CNPJCPF= ' +Dest.CNPJCPF);
       trvwCTe.Items.AddChild(Node,'IE='       +Dest.IE);
       trvwCTe.Items.AddChild(Node,'ISUF='     +Dest.ISUF);
       trvwCTe.Items.AddChild(Node,'xNome='    +Dest.xNome);

       Node := trvwCTe.Items.AddChild(Node,'EnderDest');
       trvwCTe.Items.AddChild(Node,'Fone='    +Dest.EnderDest.Fone);
       trvwCTe.Items.AddChild(Node,'CEP='     +IntToStr(Dest.EnderDest.CEP));
       trvwCTe.Items.AddChild(Node,'xLgr='    +Dest.EnderDest.xLgr);
       trvwCTe.Items.AddChild(Node,'nro='     +Dest.EnderDest.nro);
       trvwCTe.Items.AddChild(Node,'xCpl='    +Dest.EnderDest.xCpl);
       trvwCTe.Items.AddChild(Node,'xBairro=' +Dest.EnderDest.xBairro);
       trvwCTe.Items.AddChild(Node,'cMun='    +IntToStr(Dest.EnderDest.cMun));
       trvwCTe.Items.AddChild(Node,'xMun='    +Dest.EnderDest.xMun);
       trvwCTe.Items.AddChild(Node,'UF='      +Dest.EnderDest.UF );
       trvwCTe.Items.AddChild(Node,'cPais='   +IntToStr(Dest.EnderDest.cPais));
       trvwCTe.Items.AddChild(Node,'xPais='   +Dest.EnderDest.xPais);

       {if Retirada.CNPJ <> '' then
        begin
          Node := trvwCTe.Items.AddChild(Nota,'Retirada');
          trvwCTe.Items.AddChild(Node,'CNPJ='    +Retirada.CNPJ);
          trvwCTe.Items.AddChild(Node,'xLgr='    +Retirada.xLgr);
          trvwCTe.Items.AddChild(Node,'nro='     +Retirada.nro);
          trvwCTe.Items.AddChild(Node,'xCpl='    +Retirada.xCpl);
          trvwCTe.Items.AddChild(Node,'xBairro=' +Retirada.xBairro);
          trvwCTe.Items.AddChild(Node,'cMun='    +IntToStr(Retirada.cMun));
          trvwCTe.Items.AddChild(Node,'xMun='    +Retirada.xMun);
          trvwCTe.Items.AddChild(Node,'UF='      +Retirada.UF);
        end;

       if Entrega.CNPJ <> '' then
        begin
          Node := trvwCTe.Items.AddChild(Nota,'Entrega');
          trvwCTe.Items.AddChild(Node,'CNPJ='    +Entrega.CNPJ);
          trvwCTe.Items.AddChild(Node,'xLgr='    +Entrega.xLgr);
          trvwCTe.Items.AddChild(Node,'nro='     +Entrega.nro);
          trvwCTe.Items.AddChild(Node,'xCpl='    +Entrega.xCpl);
          trvwCTe.Items.AddChild(Node,'xBairro=' +Entrega.xBairro);
          trvwCTe.Items.AddChild(Node,'cMun='    +IntToStr(Entrega.cMun));
          trvwCTe.Items.AddChild(Node,'xMun='    +Entrega.xMun);
          trvwCTe.Items.AddChild(Node,'UF='      +Entrega.UF);
        end;}

       for I := 0 to Det.Count-1 do
        begin
          with Det.Items[I] do
           begin
               NodeItem := trvwCTe.Items.AddChild(Nota,'Produto'+IntToStrZero(I+1,3));
               trvwCTe.Items.AddChild(NodeItem,'nItem='  +IntToStr(Prod.nItem) );
               trvwCTe.Items.AddChild(NodeItem,'cProd='  +Prod.cProd );
               trvwCTe.Items.AddChild(NodeItem,'cEAN='   +Prod.cEAN);
               trvwCTe.Items.AddChild(NodeItem,'xProd='  +Prod.xProd);
               trvwCTe.Items.AddChild(NodeItem,'NCM='    +Prod.NCM);
               trvwCTe.Items.AddChild(NodeItem,'EXTIPI=' +Prod.EXTIPI);
               //trvwCTe.Items.AddChild(NodeItem,'genero=' +IntToStr(Prod.genero));
               trvwCTe.Items.AddChild(NodeItem,'CFOP='   +Prod.CFOP);
               trvwCTe.Items.AddChild(NodeItem,'uCom='   +Prod.uCom);
               trvwCTe.Items.AddChild(NodeItem,'qCom='   +FloatToStr(Prod.qCom));
               trvwCTe.Items.AddChild(NodeItem,'vUnCom=' +FloatToStr(Prod.vUnCom));
               trvwCTe.Items.AddChild(NodeItem,'vProd='  +FloatToStr(Prod.vProd));

               trvwCTe.Items.AddChild(NodeItem,'cEANTrib=' +Prod.cEANTrib);
               trvwCTe.Items.AddChild(NodeItem,'uTrib='    +Prod.uTrib);
               trvwCTe.Items.AddChild(NodeItem,'qTrib='    +FloatToStr(Prod.qTrib));
               trvwCTe.Items.AddChild(NodeItem,'vUnTrib='  +FloatToStr(Prod.vUnTrib));

               trvwCTe.Items.AddChild(NodeItem,'vFrete=' +FloatToStr(Prod.vFrete));
               trvwCTe.Items.AddChild(NodeItem,'vSeg='   +FloatToStr(Prod.vSeg));
               trvwCTe.Items.AddChild(NodeItem,'vDesc='  +FloatToStr(Prod.vDesc));

               trvwCTe.Items.AddChild(NodeItem,'infAdProd=' +infAdProd);

               for J:=0 to Prod.DI.Count-1 do
                begin
                  if Prod.DI.Items[j].nDi <> '' then
                   begin
                     with Prod.DI.Items[j] do
                      begin
                        NodePai := trvwCTe.Items.AddChild(NodeItem,'DI'+IntToStrZero(J+1,3));
                        trvwCTe.Items.AddChild(NodePai,'nDi='         +nDi);
                        trvwCTe.Items.AddChild(NodePai,'dDi='         +DateToStr(dDi));
                        trvwCTe.Items.AddChild(NodePai,'xLocDesemb='  +xLocDesemb);
                        trvwCTe.Items.AddChild(NodePai,'UFDesemb='    +UFDesemb);
                        trvwCTe.Items.AddChild(NodePai,'dDesemb='     +DateToStr(dDesemb));
                        trvwCTe.Items.AddChild(NodePai,'cExportador=' +cExportador);;

                        for K:=0 to adi.Count-1 do
                         begin
                           with adi.Items[K] do
                            begin
                              Node := trvwCTe.Items.AddChild(NodePai,'LADI'+IntToStrZero(K+1,3));
                              trvwCTe.Items.AddChild(Node,'nAdicao='     +IntToStr(nAdicao));
                              trvwCTe.Items.AddChild(Node,'nSeqAdi='     +IntToStr(nSeqAdi));
                              trvwCTe.Items.AddChild(Node,'cFabricante=' +cFabricante);
                              trvwCTe.Items.AddChild(Node,'vDescDI='     +FloatToStr(vDescDI));
                            end;
                         end;
                      end;
                   end
                  else
                    Break;
                end;

              if Prod.veicProd.chassi <> '' then
               begin
                 Node := trvwCTe.Items.AddChild(NodeItem,'Veiculo');
                 with Prod.veicProd do
                  begin
                    trvwCTe.Items.AddChild(Node,'tpOP='     +tpOPToStr(tpOP));
                    trvwCTe.Items.AddChild(Node,'chassi='   +chassi);
                    trvwCTe.Items.AddChild(Node,'cCor='     +cCor);
                    trvwCTe.Items.AddChild(Node,'xCor='     +xCor);
                    trvwCTe.Items.AddChild(Node,'pot='      +pot);
                    trvwCTe.Items.AddChild(Node,'Cilin='      +Cilin);
                    trvwCTe.Items.AddChild(Node,'pesoL='    +pesoL);
                    trvwCTe.Items.AddChild(Node,'pesoB='    +pesoB);
                    trvwCTe.Items.AddChild(Node,'nSerie='   +nSerie);
                    trvwCTe.Items.AddChild(Node,'tpComb='   +tpComb);
                    trvwCTe.Items.AddChild(Node,'nMotor='   +nMotor);
                    trvwCTe.Items.AddChild(Node,'CMT='     +CMT);
                    trvwCTe.Items.AddChild(Node,'dist='     +dist);
                    trvwCTe.Items.AddChild(Node,'RENAVAM='  +RENAVAM);
                    trvwCTe.Items.AddChild(Node,'anoMod='   +IntToStr(anoMod));
                    trvwCTe.Items.AddChild(Node,'anoFab='   +IntToStr(anoFab));
                    trvwCTe.Items.AddChild(Node,'tpPint='   +tpPint);
                    trvwCTe.Items.AddChild(Node,'tpVeic='   +IntToStr(tpVeic));
                    trvwCTe.Items.AddChild(Node,'espVeic='  +IntToStr(espVeic));
                    trvwCTe.Items.AddChild(Node,'VIN='      +VIN);
                    trvwCTe.Items.AddChild(Node,'condVeic=' +condVeicToStr(condVeic));
                    trvwCTe.Items.AddChild(Node,'cMod='     +cMod);
                  end;
               end;

               for J:=0 to Prod.med.Count-1 do
                begin
                  Node := trvwCTe.Items.AddChild(NodeItem,'Medicamento'+IntToStrZero(J+1,3) );
                  with Prod.med.Items[J] do
                   begin
                     trvwCTe.Items.AddChild(Node,'nLote=' +nLote);
                     trvwCTe.Items.AddChild(Node,'qLote=' +FloatToStr(qLote));
                     trvwCTe.Items.AddChild(Node,'dFab='  +DateToStr(dFab));
                     trvwCTe.Items.AddChild(Node,'dVal='  +DateToStr(dVal));
                     trvwCTe.Items.AddChild(Node,'vPMC='  +FloatToStr(vPMC));
                    end;
                end;

               for J:=0 to Prod.arma.Count-1 do
                begin
                  Node := trvwCTe.Items.AddChild(NodeItem,'Arma'+IntToStrZero(J+1,3));
                  with Prod.arma.Items[J] do
                   begin
                     trvwCTe.Items.AddChild(Node,'nSerie=' +IntToStr(nSerie));
                     trvwCTe.Items.AddChild(Node,'tpArma=' +tpArmaToStr(tpArma));
                     trvwCTe.Items.AddChild(Node,'nCano='  +IntToStr(nCano));
                     trvwCTe.Items.AddChild(Node,'descr='  +descr);
                    end;
                end;

               if (Prod.comb.cProdANP > 0) then
                begin
                 NodePai := trvwCTe.Items.AddChild(NodeItem,'Combustivel');
                 with Prod.comb do
                  begin
                    trvwCTe.Items.AddChild(NodePai,'cProdANP=' +IntToStr(cProdANP));
                    trvwCTe.Items.AddChild(NodePai,'CODIF='    +CODIF);
                    trvwCTe.Items.AddChild(NodePai,'qTemp='    +FloatToStr(qTemp));

                    Node := trvwCTe.Items.AddChild(NodePai,'CIDE'+IntToStrZero(I+1,3));
                    trvwCTe.Items.AddChild(Node,'qBCprod='   +FloatToStr(CIDE.qBCprod));
                    trvwCTe.Items.AddChild(Node,'vAliqProd=' +FloatToStr(CIDE.vAliqProd));
                    trvwCTe.Items.AddChild(Node,'vCIDE='     +FloatToStr(CIDE.vCIDE));

                    Node := trvwCTe.Items.AddChild(NodePai,'ICMSComb'+IntToStrZero(I+1,3));
                    trvwCTe.Items.AddChild(Node,'vBCICMS='   +FloatToStr(ICMS.vBCICMS));
                    trvwCTe.Items.AddChild(Node,'vICMS='     +FloatToStr(ICMS.vICMS));
                    trvwCTe.Items.AddChild(Node,'vBCICMSST=' +FloatToStr(ICMS.vBCICMSST));
                    trvwCTe.Items.AddChild(Node,'vICMSST='   +FloatToStr(ICMS.vICMSST));

                    if (ICMSInter.vBCICMSSTDest>0) then
                     begin
                       Node := trvwCTe.Items.AddChild(NodePai,'ICMSInter'+IntToStrZero(I+1,3));
                       trvwCTe.Items.AddChild(Node,'vBCICMSSTDest=' +FloatToStr(ICMSInter.vBCICMSSTDest));
                       trvwCTe.Items.AddChild(Node,'vICMSSTDest='   +FloatToStr(ICMSInter.vICMSSTDest));
                     end;

                    if (ICMSCons.vBCICMSSTCons>0) then
                     begin
                       Node := trvwCTe.Items.AddChild(NodePai,'ICMSCons'+IntToStrZero(I+1,3));
                       trvwCTe.Items.AddChild(Node,'vBCICMSSTCons=' +FloatToStr(ICMSCons.vBCICMSSTCons));
                       trvwCTe.Items.AddChild(Node,'vICMSSTCons='   +FloatToStr(ICMSCons.vICMSSTCons));
                       trvwCTe.Items.AddChild(Node,'UFCons='        +ICMSCons.UFcons);
                     end;
                  end;
               end;

               with Imposto do
                begin
                   NodePai := trvwCTe.Items.AddChild(NodeItem,'Imposto');
                   Node := trvwCTe.Items.AddChild(NodePai,'ICMS');
                   with ICMS do
                    begin
                      trvwCTe.Items.AddChild(Node,'CST=' +CSTICMSToStr(CST));

                      if CST = cst00 then
                       begin
                         trvwCTe.Items.AddChild(Node,'orig='  +OrigToStr(ICMS.orig));
                         trvwCTe.Items.AddChild(Node,'modBC=' +modBCToStr(ICMS.modBC));
                         trvwCTe.Items.AddChild(Node,'vBC='   +FloatToStr(ICMS.vBC));
                         trvwCTe.Items.AddChild(Node,'pICMS=' +FloatToStr(ICMS.pICMS));
                         trvwCTe.Items.AddChild(Node,'vICMS=' +FloatToStr(ICMS.vICMS));
                       end
                      else if CST = cst10 then
                       begin
                         trvwCTe.Items.AddChild(Node,'orig='     +OrigToStr(ICMS.orig));
                         trvwCTe.Items.AddChild(Node,'modBC='    +modBCToStr(ICMS.modBC));
                         trvwCTe.Items.AddChild(Node,'vBC='      +FloatToStr(ICMS.vBC));
                         trvwCTe.Items.AddChild(Node,'pICMS='    +FloatToStr(ICMS.pICMS));
                         trvwCTe.Items.AddChild(Node,'vICMS='    +FloatToStr(ICMS.vICMS));
                         trvwCTe.Items.AddChild(Node,'modBCST='  +modBCSTToStr(ICMS.modBCST));
                         trvwCTe.Items.AddChild(Node,'pMVAST='   +FloatToStr(ICMS.pMVAST));
                         trvwCTe.Items.AddChild(Node,'pRedBCST=' +FloatToStr(ICMS.pRedBCST));
                         trvwCTe.Items.AddChild(Node,'vBCST='    +FloatToStr(ICMS.vBCST));
                         trvwCTe.Items.AddChild(Node,'pICMSST='  +FloatToStr(ICMS.pICMSST));
                         trvwCTe.Items.AddChild(Node,'vICMSST='  +FloatToStr(ICMS.vICMSST));
                       end
                      else if CST = cst20 then
                       begin
                         trvwCTe.Items.AddChild(Node,'orig='   +OrigToStr(ICMS.orig));
                         trvwCTe.Items.AddChild(Node,'modBC='  +modBCToStr(ICMS.modBC));
                         trvwCTe.Items.AddChild(Node,'pRedBC=' +FloatToStr(ICMS.pRedBC));
                         trvwCTe.Items.AddChild(Node,'vBC='    +FloatToStr(ICMS.vBC));
                         trvwCTe.Items.AddChild(Node,'pICMS='  +FloatToStr(ICMS.pICMS));
                         trvwCTe.Items.AddChild(Node,'vICMS='  +FloatToStr(ICMS.vICMS));
                       end
                      else if CST = cst30 then
                       begin
                         trvwCTe.Items.AddChild(Node,'orig='     +OrigToStr(ICMS.orig));
                         trvwCTe.Items.AddChild(Node,'modBCST='  +modBCSTToStr(ICMS.modBCST));
                         trvwCTe.Items.AddChild(Node,'pMVAST='   +FloatToStr(ICMS.pMVAST));
                         trvwCTe.Items.AddChild(Node,'pRedBCST=' +FloatToStr(ICMS.pRedBCST));
                         trvwCTe.Items.AddChild(Node,'vBCST='    +FloatToStr(ICMS.vBCST));
                         trvwCTe.Items.AddChild(Node,'pICMSST='  +FloatToStr(ICMS.pICMSST));
                         trvwCTe.Items.AddChild(Node,'vICMSST='  +FloatToStr(ICMS.vICMSST));
                       end
                      else if (CST = cst40) or (CST = cst41) or (CST = cst50) then
                       begin
                         trvwCTe.Items.AddChild(Node,'orig='    +OrigToStr(ICMS.orig));
                       end
                      else if CST = cst51 then
                         begin
                         trvwCTe.Items.AddChild(Node,'orig='    +OrigToStr(ICMS.orig));
                         trvwCTe.Items.AddChild(Node,'modBC='   +modBCToStr(ICMS.modBC));
                         trvwCTe.Items.AddChild(Node,'pRedBC='  +FloatToStr(ICMS.pRedBC));
                         trvwCTe.Items.AddChild(Node,'vBC='     +FloatToStr(ICMS.vBC));
                         trvwCTe.Items.AddChild(Node,'pICMS='   +FloatToStr(ICMS.pICMS));
                         trvwCTe.Items.AddChild(Node,'vICMS='   +FloatToStr(ICMS.vICMS));
                       end
                      else if CST = cst60 then
                       begin
                         trvwCTe.Items.AddChild(Node,'orig='    +OrigToStr(ICMS.orig));
                         trvwCTe.Items.AddChild(Node,'vBCST='   +FloatToStr(ICMS.vBCST));
                         trvwCTe.Items.AddChild(Node,'vICMSST=' +FloatToStr(ICMS.vICMSST));
                       end
                      else if CST = cst70 then
                       begin
                         trvwCTe.Items.AddChild(Node,'orig='       +OrigToStr(ICMS.orig));
                         trvwCTe.Items.AddChild(Node,'modBC='      +modBCToStr(ICMS.modBC));
                         trvwCTe.Items.AddChild(Node,'pRedBC='     +FloatToStr(ICMS.pRedBC));
                         trvwCTe.Items.AddChild(Node,'vBC='        +FloatToStr(ICMS.vBC));
                         trvwCTe.Items.AddChild(Node,'pICMS='      +FloatToStr(ICMS.pICMS));
                         trvwCTe.Items.AddChild(Node,'vICMS='      +FloatToStr(ICMS.vICMS));
                         trvwCTe.Items.AddChild(Node,'modBCST='    +modBCSTToStr(ICMS.modBCST));
                         trvwCTe.Items.AddChild(Node,'pMVAST='     +FloatToStr(ICMS.pMVAST));
                         trvwCTe.Items.AddChild(Node,'pRedBCST='   +FloatToStr(ICMS.pRedBCST));
                         trvwCTe.Items.AddChild(Node,'vBCST='      +FloatToStr(ICMS.vBCST));
                         trvwCTe.Items.AddChild(Node,'pICMSST='    +FloatToStr(ICMS.pICMSST));
                         trvwCTe.Items.AddChild(Node,'vICMSST='    +FloatToStr(ICMS.vICMSST));
                       end
                      else if CST = cst90 then
                       begin
                         trvwCTe.Items.AddChild(Node,'orig='       +OrigToStr(ICMS.orig));
                         trvwCTe.Items.AddChild(Node,'modBC='      +modBCToStr(ICMS.modBC));
                         trvwCTe.Items.AddChild(Node,'pRedBC='     +FloatToStr(ICMS.pRedBC));
                         trvwCTe.Items.AddChild(Node,'vBC='        +FloatToStr(ICMS.vBC));
                         trvwCTe.Items.AddChild(Node,'pICMS='      +FloatToStr(ICMS.pICMS));
                         trvwCTe.Items.AddChild(Node,'vICMS='      +FloatToStr(ICMS.vICMS));
                         trvwCTe.Items.AddChild(Node,'modBCST='    +modBCSTToStr(ICMS.modBCST));
                         trvwCTe.Items.AddChild(Node,'pMVAST='     +FloatToStr(ICMS.pMVAST));
                         trvwCTe.Items.AddChild(Node,'pRedBCST='   +FloatToStr(ICMS.pRedBCST));
                         trvwCTe.Items.AddChild(Node,'vBCST='      +FloatToStr(ICMS.vBCST));
                         trvwCTe.Items.AddChild(Node,'pICMSST='    +FloatToStr(ICMS.pICMSST));
                         trvwCTe.Items.AddChild(Node,'vICMSST='    +FloatToStr(ICMS.vICMSST));
                       end;
                    end;

                   if (IPI.vBC > 0) then
                    begin
                      Node := trvwCTe.Items.AddChild(NodePai,'IPI');
                      with IPI do
                       begin
                         trvwCTe.Items.AddChild(Node,'CST='       +CSTIPIToStr(CST));
                         trvwCTe.Items.AddChild(Node,'clEnq='    +clEnq);
                         trvwCTe.Items.AddChild(Node,'CNPJProd=' +CNPJProd);
                         trvwCTe.Items.AddChild(Node,'cSelo='    +cSelo);
                         trvwCTe.Items.AddChild(Node,'qSelo='    +IntToStr(qSelo));
                         trvwCTe.Items.AddChild(Node,'cEnq='     +cEnq);

                         trvwCTe.Items.AddChild(Node,'vBC='    +FloatToStr(vBC));
                         trvwCTe.Items.AddChild(Node,'qUnid='  +FloatToStr(qUnid));
                         trvwCTe.Items.AddChild(Node,'vUnid='  +FloatToStr(vUnid));
                         trvwCTe.Items.AddChild(Node,'pIPI='   +FloatToStr(pIPI));
                         trvwCTe.Items.AddChild(Node,'vIPI='   +FloatToStr(vIPI));
                       end;
                    end;

                   if (II.vBc > 0) then
                    begin
                      Node := trvwCTe.Items.AddChild(NodePai,'II');
                      with II do
                       begin
                         trvwCTe.Items.AddChild(Node,'vBc='      +FloatToStr(vBc));
                         trvwCTe.Items.AddChild(Node,'vDespAdu=' +FloatToStr(vDespAdu));
                         trvwCTe.Items.AddChild(Node,'vII='      +FloatToStr(vII));
                         trvwCTe.Items.AddChild(Node,'vIOF='     +FloatToStr(vIOF));
                       end;
                    end;

                   Node := trvwCTe.Items.AddChild(NodePai,'PIS');
                   with PIS do
                    begin
                      trvwCTe.Items.AddChild(Node,'CST=' +CSTPISToStr(CST));

                      if (CST = pis01) or (CST = pis02) then
                       begin
                         trvwCTe.Items.AddChild(Node,'vBC='  +FloatToStr(PIS.vBC));
                         trvwCTe.Items.AddChild(Node,'pPIS=' +FloatToStr(PIS.pPIS));
                         trvwCTe.Items.AddChild(Node,'vPIS=' +FloatToStr(PIS.vPIS));
                       end
                      else if CST = pis03 then
                       begin
                         trvwCTe.Items.AddChild(Node,'qBCProd='   +FloatToStr(PIS.qBCProd));
                         trvwCTe.Items.AddChild(Node,'vAliqProd=' +FloatToStr(PIS.vAliqProd));
                         trvwCTe.Items.AddChild(Node,'vPIS='      +FloatToStr(PIS.vPIS));
                       end
                      else if CST = pis99 then
                       begin
                         trvwCTe.Items.AddChild(Node,'vBC='       +FloatToStr(PIS.vBC));
                         trvwCTe.Items.AddChild(Node,'pPIS='      +FloatToStr(PIS.pPIS));
                         trvwCTe.Items.AddChild(Node,'qBCProd='   +FloatToStr(PIS.qBCProd));
                         trvwCTe.Items.AddChild(Node,'vAliqProd=' +FloatToStr(PIS.vAliqProd));
                         trvwCTe.Items.AddChild(Node,'vPIS='      +FloatToStr(PIS.vPIS));
                       end;
                    end;

                   if (PISST.vBc>0) then
                    begin
                      Node := trvwCTe.Items.AddChild(NodePai,'PISST');
                      with PISST do
                       begin
                         trvwCTe.Items.AddChild(Node,'vBc='       +FloatToStr(vBc));
                         trvwCTe.Items.AddChild(Node,'pPis='      +FloatToStr(pPis));
                         trvwCTe.Items.AddChild(Node,'qBCProd='   +FloatToStr(qBCProd));
                         trvwCTe.Items.AddChild(Node,'vAliqProd=' +FloatToStr(vAliqProd));
                         trvwCTe.Items.AddChild(Node,'vPIS='      +FloatToStr(vPIS));
                       end;
                      end;

                   Node := trvwCTe.Items.AddChild(NodePai,'COFINS');
                   with COFINS do
                    begin
                      trvwCTe.Items.AddChild(Node,'CST=' +CSTCOFINSToStr(CST));

                      if (CST = cof01) or (CST = cof02)   then
                       begin
                         trvwCTe.Items.AddChild(Node,'vBC='     +FloatToStr(COFINS.vBC));
                         trvwCTe.Items.AddChild(Node,'pCOFINS=' +FloatToStr(COFINS.pCOFINS));
                         trvwCTe.Items.AddChild(Node,'vCOFINS=' +FloatToStr(COFINS.vCOFINS));
                       end
                      else if CST = cof03 then
                       begin
                         trvwCTe.Items.AddChild(Node,'qBCProd='   +FloatToStr(COFINS.qBCProd));
                         trvwCTe.Items.AddChild(Node,'vAliqProd=' +FloatToStr(COFINS.vAliqProd));
                         trvwCTe.Items.AddChild(Node,'vCOFINS='   +FloatToStr(COFINS.vCOFINS));
                       end
                      else if CST = cof99 then
                       begin
                         trvwCTe.Items.AddChild(Node,'vBC='       +FloatToStr(COFINS.vBC));
                         trvwCTe.Items.AddChild(Node,'pCOFINS='   +FloatToStr(COFINS.pCOFINS));
                         trvwCTe.Items.AddChild(Node,'qBCProd='   +FloatToStr(COFINS.qBCProd));
                         trvwCTe.Items.AddChild(Node,'vAliqProd=' +FloatToStr(COFINS.vAliqProd));
                         trvwCTe.Items.AddChild(Node,'vCOFINS='   +FloatToStr(COFINS.vCOFINS));
                       end;
                    end;

                   if (COFINSST.vBC > 0) then
                    begin
                      Node := trvwCTe.Items.AddChild(NodePai,'COFINSST');
                      with COFINSST do
                       begin
                         trvwCTe.Items.AddChild(Node,'vBC='       +FloatToStr(vBC));
                         trvwCTe.Items.AddChild(Node,'pCOFINS='   +FloatToStr(pCOFINS));
                         trvwCTe.Items.AddChild(Node,'qBCProd='   +FloatToStr(qBCProd));
                         trvwCTe.Items.AddChild(Node,'vAliqProd=' +FloatToStr(vAliqProd));
                         trvwCTe.Items.AddChild(Node,'vCOFINS='   +FloatToStr(vCOFINS));
                       end;
                    end;

                   if (ISSQN.vBC > 0) then
                    begin
                     Node := trvwCTe.Items.AddChild(NodePai,'ISSQN');
                     with ISSQN do
                      begin
                        trvwCTe.Items.AddChild(Node,'vBC='       +FloatToStr(vBC));
                        trvwCTe.Items.AddChild(Node,'vAliq='     +FloatToStr(vAliq));
                        trvwCTe.Items.AddChild(Node,'vISSQN='    +FloatToStr(vISSQN));
                        trvwCTe.Items.AddChild(Node,'cMunFG='    +IntToStr(cMunFG));
                        trvwCTe.Items.AddChild(Node,'cListServ=' +IntToStr(cListServ));
                      end;
                    end;
                end;
             end;
          end;

       NodePai := trvwCTe.Items.AddChild(Nota,'Total');
       Node := trvwCTe.Items.AddChild(NodePai,'ICMSTot');
       trvwCTe.Items.AddChild(Node,'vBC='     +FloatToStr(Total.ICMSTot.vBC));
       trvwCTe.Items.AddChild(Node,'vICMS='   +FloatToStr(Total.ICMSTot.vICMS));
       trvwCTe.Items.AddChild(Node,'vBCST='   +FloatToStr(Total.ICMSTot.vBCST));
       trvwCTe.Items.AddChild(Node,'vST='     +FloatToStr(Total.ICMSTot.vST));
       trvwCTe.Items.AddChild(Node,'vProd='   +FloatToStr(Total.ICMSTot.vProd));
       trvwCTe.Items.AddChild(Node,'vFrete='  +FloatToStr(Total.ICMSTot.vFrete));
       trvwCTe.Items.AddChild(Node,'vSeg='    +FloatToStr(Total.ICMSTot.vSeg));
       trvwCTe.Items.AddChild(Node,'vDesc='   +FloatToStr(Total.ICMSTot.vDesc));
       trvwCTe.Items.AddChild(Node,'vII='     +FloatToStr(Total.ICMSTot.vII));
       trvwCTe.Items.AddChild(Node,'vIPI='    +FloatToStr(Total.ICMSTot.vIPI));
       trvwCTe.Items.AddChild(Node,'vPIS='    +FloatToStr(Total.ICMSTot.vPIS));
       trvwCTe.Items.AddChild(Node,'vCOFINS=' +FloatToStr(Total.ICMSTot.vCOFINS));
       trvwCTe.Items.AddChild(Node,'vOutro='  +FloatToStr(Total.ICMSTot.vOutro));
       trvwCTe.Items.AddChild(Node,'vNF='     +FloatToStr(Total.ICMSTot.vNF));

       if Total.ISSQNtot.vServ > 0 then
        begin
          Node := trvwCTe.Items.AddChild(NodePai,'ISSQNtot');
          trvwCTe.Items.AddChild(Node,'vServ='   +FloatToStr(Total.ISSQNtot.vServ));
          trvwCTe.Items.AddChild(Node,'vBC='     +FloatToStr(Total.ISSQNTot.vBC));
          trvwCTe.Items.AddChild(Node,'vISS='    +FloatToStr(Total.ISSQNTot.vISS));
          trvwCTe.Items.AddChild(Node,'vPIS='    +FloatToStr(Total.ISSQNTot.vPIS));
          trvwCTe.Items.AddChild(Node,'vCOFINS=' +FloatToStr(Total.ISSQNTot.vCOFINS));
        end;

       Node := trvwCTe.Items.AddChild(NodePai,'retTrib');
       trvwCTe.Items.AddChild(Node,'vRetPIS='   +FloatToStr(Total.retTrib.vRetPIS));
       trvwCTe.Items.AddChild(Node,'vRetCOFINS='+FloatToStr(Total.retTrib.vRetCOFINS));
       trvwCTe.Items.AddChild(Node,'vRetCSLL='  +FloatToStr(Total.retTrib.vRetCSLL));
       trvwCTe.Items.AddChild(Node,'vBCIRRF='   +FloatToStr(Total.retTrib.vBCIRRF));
       trvwCTe.Items.AddChild(Node,'vIRRF='     +FloatToStr(Total.retTrib.vIRRF));
       trvwCTe.Items.AddChild(Node,'vBCRetPrev='+FloatToStr(Total.retTrib.vBCRetPrev));
       trvwCTe.Items.AddChild(Node,'vRetPrev='  +FloatToStr(Total.retTrib.vRetPrev));

       NodePai := trvwCTe.Items.AddChild(Nota,'Transp');
       Node := trvwCTe.Items.AddChild(NodePai,'Transporta');
       trvwCTe.Items.AddChild(Node,'modFrete=' +modFreteToStr(Transp.modFrete));
       trvwCTe.Items.AddChild(Node,'CNPJCPF='  +Transp.Transporta.CNPJCPF);
       trvwCTe.Items.AddChild(Node,'xNome='    +Transp.Transporta.xNome);
       trvwCTe.Items.AddChild(Node,'IE='       +Transp.Transporta.IE);
       trvwCTe.Items.AddChild(Node,'xEnder='   +Transp.Transporta.xEnder);
       trvwCTe.Items.AddChild(Node,'xMun='     +Transp.Transporta.xMun);
       trvwCTe.Items.AddChild(Node,'UF='       +Transp.Transporta.UF);

       Node := trvwCTe.Items.AddChild(NodePai,'retTransp');
       trvwCTe.Items.AddChild(Node,'vServ='    +FloatToStr(Transp.retTransp.vServ));
       trvwCTe.Items.AddChild(Node,'vBCRet='   +FloatToStr(Transp.retTransp.vBCRet));
       trvwCTe.Items.AddChild(Node,'pICMSRet=' +FloatToStr(Transp.retTransp.pICMSRet));
       trvwCTe.Items.AddChild(Node,'vICMSRet=' +FloatToStr(Transp.retTransp.vICMSRet));
       trvwCTe.Items.AddChild(Node,'CFOP='     +Transp.retTransp.CFOP);
       trvwCTe.Items.AddChild(Node,'cMunFG='   +FloatToStr(Transp.retTransp.cMunFG));

       Node := trvwCTe.Items.AddChild(NodePai,'veicTransp');
       trvwCTe.Items.AddChild(Node,'placa='  +Transp.veicTransp.placa);
       trvwCTe.Items.AddChild(Node,'UF='     +Transp.veicTransp.UF);
       trvwCTe.Items.AddChild(Node,'RNTC='   +Transp.veicTransp.RNTC);

       for I:=0 to Transp.Reboque.Count-1 do
        begin
          Node := trvwCTe.Items.AddChild(NodePai,'Reboque'+IntToStrZero(I+1,3));
          with Transp.Reboque.Items[I] do
           begin
             trvwCTe.Items.AddChild(Node,'placa=' +placa);
             trvwCTe.Items.AddChild(Node,'UF='    +UF);
             trvwCTe.Items.AddChild(Node,'RNTC='  +RNTC);
           end;
        end;

       for I:=0 to Transp.Vol.Count-1 do
        begin
          Node := trvwCTe.Items.AddChild(NodePai,'Volume'+IntToStrZero(I+1,3));
          with Transp.Vol.Items[I] do
           begin
             trvwCTe.Items.AddChild(Node,'qVol='  +IntToStr(qVol));
             trvwCTe.Items.AddChild(Node,'esp='   +esp);
             trvwCTe.Items.AddChild(Node,'marca=' +marca);
             trvwCTe.Items.AddChild(Node,'nVol='  +nVol);
             trvwCTe.Items.AddChild(Node,'pesoL=' +FloatToStr(pesoL));
             trvwCTe.Items.AddChild(Node,'pesoB'  +FloatToStr(pesoB));

             for J:=0 to Lacres.Count-1 do
              begin
                Node := trvwCTe.Items.AddChild(Node,'Lacre'+IntToStrZero(I+1,3)+IntToStrZero(J+1,3) );
                trvwCTe.Items.AddChild(Node,'nLacre='+Lacres.Items[J].nLacre);
              end;
           end;
        end;

       NodePai := trvwCTe.Items.AddChild(Nota,'Cobr');
       Node    := trvwCTe.Items.AddChild(NodePai,'Fat');
       trvwCTe.Items.AddChild(Node,'nFat='  +Cobr.Fat.nFat);
       trvwCTe.Items.AddChild(Node,'vOrig=' +FloatToStr(Cobr.Fat.vOrig));
       trvwCTe.Items.AddChild(Node,'vDesc=' +FloatToStr(Cobr.Fat.vDesc));
       trvwCTe.Items.AddChild(Node,'vLiq='  +FloatToStr(Cobr.Fat.vLiq));

       for I:=0 to Cobr.Dup.Count-1 do
        begin
          Node    := trvwCTe.Items.AddChild(NodePai,'Duplicata'+IntToStrZero(I+1,3));
          with Cobr.Dup.Items[I] do
           begin
             trvwCTe.Items.AddChild(Node,'nDup='  +nDup);
             trvwCTe.Items.AddChild(Node,'dVenc=' +DateToStr(dVenc));
             trvwCTe.Items.AddChild(Node,'vDup='  +FloatToStr(vDup));
           end;
        end;

       NodePai := trvwCTe.Items.AddChild(Nota,'InfAdic');
       trvwCTe.Items.AddChild(NodePai,'infCpl='     +InfAdic.infCpl);
       trvwCTe.Items.AddChild(NodePai,'infAdFisco=' +InfAdic.infAdFisco);

       for I:=0 to InfAdic.obsCont.Count-1 do
        begin
          Node := trvwCTe.Items.AddChild(NodePai,'obsCont'+IntToStrZero(I+1,3));
          with InfAdic.obsCont.Items[I] do
           begin
             trvwCTe.Items.AddChild(Node,'xCampo=' +xCampo);
             trvwCTe.Items.AddChild(Node,'xTexto=' +xTexto);
           end;
        end;

         for I:=0 to InfAdic.obsFisco.Count-1 do
          begin
            Node := trvwCTe.Items.AddChild(NodePai,'obsFisco'+IntToStrZero(I+1,3));
            with InfAdic.obsFisco.Items[I] do
             begin
                trvwCTe.Items.AddChild(Node,'xCampo=' +xCampo);
                trvwCTe.Items.AddChild(Node,'xTexto=' +xTexto);
             end;
          end;

         for I:=0 to InfAdic.procRef.Count-1 do
          begin
            Node := trvwCTe.Items.AddChild(NodePai,'procRef'+IntToStrZero(I+1,3));
            with InfAdic.procRef.Items[I] do
             begin
               trvwCTe.Items.AddChild(Node,'nProc='   +nProc);
               trvwCTe.Items.AddChild(Node,'indProc=' +indProcToStr(indProc));
             end;
          end;

         if (exporta.UFembarq <> '') then
          begin
            Node := trvwCTe.Items.AddChild(Nota,'exporta');
            trvwCTe.Items.AddChild(Node,'UFembarq='   +exporta.UFembarq);
            trvwCTe.Items.AddChild(Node,'xLocEmbarq=' +exporta.xLocEmbarq);
          end;

         if (compra.xNEmp <> '') then
          begin
            Node := trvwCTe.Items.AddChild(Nota,'compra');
            trvwCTe.Items.AddChild(Node,'xNEmp=' +compra.xNEmp);
            trvwCTe.Items.AddChild(Node,'xPed='  +compra.xPed);
            trvwCTe.Items.AddChild(Node,'xCont=' +compra.xCont);
          end;
      *)
      end;
     PageControl2.ActivePageIndex := 3;
    end;
  end;
