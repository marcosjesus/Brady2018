unit ConsultaCTE ;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fcadastro, ComCtrls, StdCtrls, Buttons, ToolWin, ExtCtrls, rsEdit, Mask, ShellApi,
  rsFlyovr, RseditDB, Db, DBTables, CheckLst, jpeg, Grids, DBGrids, DBCtrls,
  RxLookup, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, Variants,
  cxDropDownEdit, cxCalendar, Menus, cxLookAndFeelPainters, cxGraphics,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxStatusBarPainter,
  dxStatusBar, cxButtons, cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, QRPDFFilt,
  cxGridCustomView, cxGrid, cxPC, cxGroupBox, cxCalc, cxRadioGroup,
  cxCheckBox, cxLabel, cxLookAndFeels, dxSkinBlack, dxSkinBlue,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, DBClient, Provider, FMTBcd, SqlTimSt,
  SqlExpr, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, pcnConversao, pcteConversaoCTe,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue;

type
  TFrmConsultaCTE = class(TFrmCadastro)
    Panel8: TPanel;
    PageGeral: TcxPageControl;
    tabItens: TcxTabSheet;
    pnlItens: TPanel;
    Page: TcxPageControl;
    Panel13: TPanel;
    EdiCodFilial: TrsSuperEdit;
    TabFormaPagamento: TcxTabSheet;
    TabEnderecoEntrega: TcxTabSheet;
    qryAux: TSQLQuery;
    editCT: TrsSuperEdit;
    editChave: TEdit;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxTabSheet3: TcxTabSheet;
    cxTabSheet4: TcxTabSheet;
    TabSheetAereo: TcxTabSheet;
    cxTabSheet6: TcxTabSheet;
    cxTabSheet7: TcxTabSheet;
    cxGroupBox1: TcxGroupBox;
    Panel1: TPanel;
    editSerie: TrsSuperEdit;
    editDtEmissao: TrsSuperEdit;
    cxGroupBox2: TcxGroupBox;
    cxGroupBox3: TcxGroupBox;
    cxGroupBox4: TcxGroupBox;
    cxGroupBox5: TcxGroupBox;
    Panel5: TPanel;
    editEmitCNPJ: TrsSuperEdit;
    EditEmitNome: TrsSuperEdit;
    cxGroupBox6: TcxGroupBox;
    Panel6: TPanel;
    EditValTotServico: TrsSuperEdit;
    EditBaseCalcICMS: TrsSuperEdit;
    EditEmitIE: TrsSuperEdit;
    EditEmitUF: TrsSuperEdit;
    Panel4: TPanel;
    EditTomaCNPJ: TrsSuperEdit;
    EditTomaNome: TrsSuperEdit;
    EditTomaIE: TrsSuperEdit;
    EditTomaUF: TrsSuperEdit;
    Panel3: TPanel;
    EditDestCNPJ: TrsSuperEdit;
    EditDestNome: TrsSuperEdit;
    EditDestIE: TrsSuperEdit;
    EditDestUF: TrsSuperEdit;
    Panel2: TPanel;
    EditValorICMS: TrsSuperEdit;
    cxGroupBox7: TcxGroupBox;
    Panel7: TPanel;
    EditRemNome: TrsSuperEdit;
    EditRemUF: TrsSuperEdit;
    Panel9: TPanel;
    EditModal: TrsSuperEdit;
    editTpServico: TrsSuperEdit;
    EditFinalidade: TrsSuperEdit;
    EditForma: TrsSuperEdit;
    Panel10: TPanel;
    editCFOP: TrsSuperEdit;
    EditNatOpe: TrsSuperEdit;
    EditDiget: TrsSuperEdit;
    EditRemCNPJ: TrsSuperEdit;
    EditRemIE: TrsSuperEdit;
    editIniMunicipio: TrsSuperEdit;
    editFimMunicipio: TrsSuperEdit;
    cxAutorizado: TcxGroupBox;
    Panel11: TPanel;
    EditEvento: TrsSuperEdit;
    EditProtocolo: TrsSuperEdit;
    editDtRecebto: TrsSuperEdit;
    editID: TrsSuperEdit;
    Panel12: TPanel;
    cxGroupBox8: TcxGroupBox;
    Panel14: TPanel;
    EditEmitenteNome: TrsSuperEdit;
    EditEmitenteFantasia: TrsSuperEdit;
    Panel15: TPanel;
    EditEmitentePais: TrsSuperEdit;
    Panel16: TPanel;
    EditEmitenteFone: TrsSuperEdit;
    EditEmitenteCEP: TrsSuperEdit;
    Panel17: TPanel;
    EditEmitenteEnd: TrsSuperEdit;
    EditEmitenteBairro: TrsSuperEdit;
    Panel18: TPanel;
    EditEmitenteCNPJ: TrsSuperEdit;
    EditEmitenteIE: TrsSuperEdit;
    Panel19: TPanel;
    EditEmitenteMunic: TrsSuperEdit;
    EditEmitenteUF: TrsSuperEdit;
    Panel20: TPanel;
    cxGroupBox9: TcxGroupBox;
    Panel21: TPanel;
    EditTomadorNome: TrsSuperEdit;
    EditTomadorFantasia: TrsSuperEdit;
    Panel22: TPanel;
    EditTomadorPais: TrsSuperEdit;
    Panel23: TPanel;
    EditTomadorEmail: TrsSuperEdit;
    EditTomadorCEP: TrsSuperEdit;
    Panel24: TPanel;
    EditTomadorEnd: TrsSuperEdit;
    EditTomadorBairro: TrsSuperEdit;
    Panel25: TPanel;
    EditTomadorCNPJ: TrsSuperEdit;
    EditTomadorIE: TrsSuperEdit;
    Panel26: TPanel;
    EditTomadorMunic: TrsSuperEdit;
    EditTomadorUF: TrsSuperEdit;
    EditTomadorRelCarga: TrsSuperEdit;
    Panel28: TPanel;
    cxGroupBox10: TcxGroupBox;
    Panel29: TPanel;
    EditRemetenteNome: TrsSuperEdit;
    EditRemetenteFantasia: TrsSuperEdit;
    Panel30: TPanel;
    EditRemetentePais: TrsSuperEdit;
    Panel31: TPanel;
    EditRemetenteEmail: TrsSuperEdit;
    EditRemetenteCEP: TrsSuperEdit;
    Panel32: TPanel;
    EditRemetenteEnd: TrsSuperEdit;
    EditRemetenteBairro: TrsSuperEdit;
    Panel33: TPanel;
    EditRemetenteCNPJ: TrsSuperEdit;
    EditRemetenteIE: TrsSuperEdit;
    Panel34: TPanel;
    EditRemetenteMunic: TrsSuperEdit;
    EditRemetenteUF: TrsSuperEdit;
    Panel35: TPanel;
    cxGroupBox11: TcxGroupBox;
    Panel36: TPanel;
    EditDestinatarioNome: TrsSuperEdit;
    Panel37: TPanel;
    EditDestinatarioPais: TrsSuperEdit;
    EditDestinatarioSuframa: TrsSuperEdit;
    Panel38: TPanel;
    EditDestinatarioFone: TrsSuperEdit;
    EditDestinatarioCEP: TrsSuperEdit;
    Panel39: TPanel;
    EditDestinatarioEnd: TrsSuperEdit;
    EditDestinatarioBairro: TrsSuperEdit;
    Panel40: TPanel;
    EditDestinatarioCNPJ: TrsSuperEdit;
    EditDestinatarioIE: TrsSuperEdit;
    Panel41: TPanel;
    EditDestinatarioMunic: TrsSuperEdit;
    EditDestinatarioUF: TrsSuperEdit;
    EditcCT: TrsSuperEdit;
    Panel42: TPanel;
    EditFilialNome: TrsSuperEdit;
    EditFilialCNPJ: TrsSuperEdit;
    EditFilialMunicipio: TrsSuperEdit;
    editFilialUF: TrsSuperEdit;
    sqlComp: TSQLQuery;
    dspComp: TDataSetProvider;
    cdsComp: TClientDataSet;
    dsComp: TDataSource;
    cdsCompNome: TStringField;
    cdsCompValor: TFMTBCDField;
    sqlInfoQ: TSQLQuery;
    sqlAutXML: TSQLQuery;
    sqlNFE: TSQLQuery;
    dspInfoQ: TDataSetProvider;
    dspAutXML: TDataSetProvider;
    dspNFE: TDataSetProvider;
    cdsInfoQ: TClientDataSet;
    cdsAutXML: TClientDataSet;
    cdsNFE: TClientDataSet;
    dsInfoQ: TDataSource;
    dsAutXML: TDataSource;
    dsNFE: TDataSource;
    Panel47: TPanel;
    cxGroupBox14: TcxGroupBox;
    Panel44: TPanel;
    EditPrestValorServico: TrsSuperEdit;
    EditPrestValorReceber: TrsSuperEdit;
    cxGroupBox13: TcxGroupBox;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1Nome: TcxGridDBColumn;
    cxGrid1DBTableView1Valor: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxGroupBox12: TcxGroupBox;
    Panel43: TPanel;
    EditImpostoValorTotalTrib: TrsSuperEdit;
    Panel45: TPanel;
    EditImpostoBCICMS: TrsSuperEdit;
    EditImpostoAliquotaICMS: TrsSuperEdit;
    EditImpostoValorICMS: TrsSuperEdit;
    Panel46: TPanel;
    EditImpostoCST: TrsSuperEdit;
    EditImpostoValorCredito: TrsSuperEdit;
    EditImpostoBaseCalc: TrsSuperEdit;
    Panel48: TPanel;
    cxGroupBox16: TcxGroupBox;
    cxGrid3: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    cdsAutXMLCTE_AUTXML: TIntegerField;
    cdsAutXMLcCT: TStringField;
    cdsAutXMLCNPJ: TStringField;
    cdsNFECTE_NFE_ID: TIntegerField;
    cdsNFECCT: TStringField;
    cdsNFECHAVENFE: TStringField;
    cdsInfoQCTE_INFQ: TIntegerField;
    cdsInfoQCCT: TStringField;
    cdsInfoQCUNID: TStringField;
    cdsInfoQTPMED: TStringField;
    cdsInfoQQCARGA: TFMTBCDField;
    cxGroupBox17: TcxGroupBox;
    cxGrid4: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    cxGridDBTableView2CUNID: TcxGridDBColumn;
    cxGridDBTableView2TPMED: TcxGridDBColumn;
    cxGridDBTableView2QCARGA: TcxGridDBColumn;
    cxGroupBox18: TcxGroupBox;
    Panel49: TPanel;
    EditInfoValorTotalCarga: TrsSuperEdit;
    EditInfoProdutoPred: TrsSuperEdit;
    EditInfoOutrasCarac: TrsSuperEdit;
    Panel50: TPanel;
    cxGroupBox15: TcxGroupBox;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBTableView1CNPJ: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxGroupBox19: TcxGroupBox;
    Panel51: TPanel;
    EditSeguradoraResp: TrsSuperEdit;
    EditSeguradoraNome: TrsSuperEdit;
    EditSeguradoraValor: TrsSuperEdit;
    EditSeguradoraApolic: TrsSuperEdit;
    EditSeguradoraAverb: TrsSuperEdit;
    Panel52: TPanel;
    cxGroupBox20: TcxGroupBox;
    Panel53: TPanel;
    EditInfoModalMinuta: TrsSuperEdit;
    EditInfoModalDtaPrevEntrega: TrsSuperEdit;
    Panel57: TPanel;
    EditInfoModalLojaEmissor: TrsSuperEdit;
    EditInfoModalNumOpera: TrsSuperEdit;
    EditInfoModalCodIATA: TrsSuperEdit;
    cxGroupBox21: TcxGroupBox;
    Panel54: TPanel;
    EditInfoModalClasse: TrsSuperEdit;
    EditInfoModalCodigo: TrsSuperEdit;
    EditInfoModalValor: TrsSuperEdit;
    cxgNatCarga: TcxGroupBox;
    Panel55: TPanel;
    EditNatCargaDimensao: TrsSuperEdit;
    EditNatCargaManuseio: TrsSuperEdit;
    EditNatCargaCEspecial: TrsSuperEdit;
    procedure FormCreate(Sender: TObject);
    procedure editChaveCteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure ButCancelarClick(Sender: TObject);
  private
    { Private declarations }
    procedure Search ; Override ;
  public
    { Public declarations }
  end;

var
  FrmConsultaCTE: TFrmConsultaCTE;

implementation

{$R *.DFM}

Uses
   Global;


procedure TFrmConsultaCTE.ButCancelarClick(Sender: TObject);
begin
  inherited;
  cdsComp.Close;
  cdsInfoQ.Close;
  cdsAutXML.Close;
  cdsNFE.Close;
end;

procedure TFrmConsultaCTE.editChaveCteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = 13 then
    ButPesquisarClick(Self);
end;

procedure TFrmConsultaCTE.FormCreate(Sender: TObject);
begin
    LabCadTit.Caption := 'CTE ' ;
    FormOperacao := 'CONS_DOCUMENTO' ;
    FormTabela := 'CTE_PROTOCOLO' ;
    FormChaves := 'nCT' ;
    FormCtrlFocus := 'editCT' ;
    FormDataFocus := 'editID' ;

    inherited;
    Top    := 1;
    Width  := 871;
    Height := 597;

    editCT.CT_Sql.Clear;
    editCT.CT_Sql.Add(' Select p.nCt , p.cCT, p.chcte ');
    editCT.CT_Sql.Add(' From CTE_Protocolo p');
    editCT.CT_Sql.Add(' INNER JOIN XML_IMPORTADA X ON X.CHCTE = P.CHCTE  ');
    editCT.CT_Sql.Add(' WHERE X.TIPOXML = ''CTE''  ');
end;



procedure TFrmConsultaCTE.FormShow(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;
  PageGeral.ActivePage := tabItens;
end;

procedure TFrmConsultaCTE.Search;
Var
        ok : Boolean;
 cRelCarga : String;
 CTE_Filial_ID : String;
 Cod_Emitente, Cod_Destinatario : String;
begin
  PageGeral.ActivePage := tabItens;

  inherited;

  if (not FormOpeErro) then
  begin
    Salvo := True;

    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add('Select *  ');
    qryAux.Sql.Add('From CTE_CAPA ' );
    qryAux.Sql.Add('Where CCT = ' + QuotedStr(EditcCT.Text )  );
    qryAux.Open;

    editSerie.AsString        := qryAux.FieldByName('Serie').AsString;
    editDtEmissao.AsDateTime  := qryAux.FieldByName('DhEmi').AsDateTime;
    EditModal.AsString        := TpModalToStrText(StrToTpModal (ok,qryAux.FieldByName('Modal').AsString));
    editTpServico.AsString    := TpServToStrText(StrToTpServ(ok,qryAux.FieldByName('TpServ').AsString));
    EditFinalidade.AsString   := tpCTToStrText(StrTotpCTe(ok,qryAux.FieldByName('TpCte').AsString));
    EditForma.AsString        := tpCTToStrText(StrTotpCTe(ok,qryAux.FieldByName('TpCte').AsString));
    editCFOP.AsString         := qryAux.FieldByName('CFOP').AsString;
    EditNatOpe.AsString       := qryAux.FieldByName('NatOp').AsString;
    editIniMunicipio.AsString := qryAux.FieldByName('xMunIni').AsString;
    editFimMunicipio.AsString := qryAux.FieldByName('xMunFim').AsString;
    cRelCarga                 := TpTomadorToStrText(StrToTpTomador(ok, qryAux.FieldByName('Toma03').AsString));
    CTE_Filial_ID             := qryAux.FieldByName('CTE_Filial_ID').AsString;
    Cod_Emitente              := qryAux.FieldByName('CodFornecedor').AsString;
    Cod_Destinatario          := qryAux.FieldByName('CodDestinatario').AsString;

    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add('Select *  ');
    qryAux.Sql.Add('From CTE_FILIAL ' );
    qryAux.Sql.Add('Where CTE_Filial_ID = ' + QuotedStr(CTE_Filial_ID)  );
    qryAux.Open;

    EditFilialNome.AsString := qryAux.FieldByName('Nome').AsString;
    EditFilialCNPJ.AsString := qryAux.FieldByName('CNPJ').AsString;
    EditFilialMunicipio.AsString := qryAux.FieldByName('xMunicipio').AsString;
    editFilialUF.AsString := qryAux.FieldByName('UF').AsString;

    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add('Select *  ');
    qryAux.Sql.Add('From CTE_EMITENTE ' );
    qryAux.Sql.Add('Where CTE_EMITENTE_ID = ' + QuotedStr(Cod_Emitente)  );
    qryAux.Open;

    editEmitCNPJ.AsString := qryAux.FieldByName('CNPJCPF').AsString;
    EditEmitNome.AsString := qryAux.FieldByName('xNome').AsString;
    EditEmitIE.AsString   := qryAux.FieldByName('ie').AsString;
    EditEmitUF.AsString   := qryAux.FieldByName('UF').AsString;

    EditEmitenteNome.AsString     := qryAux.FieldByName('xNome').AsString;
    EditEmitenteFantasia.AsString := qryAux.FieldByName('xFant').AsString;
    EditEmitenteCNPJ.AsString     := qryAux.FieldByName('CNPJCPF').AsString;
    EditEmitenteIE.AsString       := qryAux.FieldByName('IE').AsString;
    EditEmitenteEnd.AsString      := qryAux.FieldByName('xLgr').AsString + ',' +
                                     qryAux.FieldByName('nro').AsString  + '-' +
                                     qryAux.FieldByName('xCpl').AsString;
    EditEmitenteBairro.AsString   := qryAux.FieldByName('xBairro').AsString;
    EditEmitenteFone.AsString     := qryAux.FieldByName('Fone').AsString;
    EditEmitenteCEP.AsString      := qryAux.FieldByName('CEP').AsString;
    EditEmitenteMunic.AsString    := qryAux.FieldByName('xMun').AsString;
    EditEmitenteUF.AsString       := qryAux.FieldByName('UF').AsString;
    EditEmitentePais.AsString     := qryAux.FieldByName('xPais').AsString;


    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add('Select *  ');
    qryAux.Sql.Add('From CTE_TOMADOR ' );
    qryAux.Sql.Add('Where CCT = ' + QuotedStr(EditcCT.Text )  );
    qryAux.Open;

    EditTomaCNPJ.AsString := qryAux.FieldByName('CNPJ').AsString;
    EditTomaNome.AsString := qryAux.FieldByName('xNome').AsString;
    EditTomaIE.AsString   := qryAux.FieldByName('ie').AsString;
    EditTomaUF.AsString   := qryAux.FieldByName('UF').AsString;

    EditTomadorNome.AsString     := qryAux.FieldByName('xNome').AsString;
    EditTomadorFantasia.AsString := qryAux.FieldByName('xFant').AsString;
    EditTomadorCNPJ.AsString     := qryAux.FieldByName('CNPJ').AsString;
    EditTomadorIE.AsString       := qryAux.FieldByName('IE').AsString;
    EditTomadorEnd.AsString      := qryAux.FieldByName('xLgr').AsString + ',' +
                                    qryAux.FieldByName('nro').AsString  + '-' +
                                    qryAux.FieldByName('xCpl').AsString;
    EditTomadorBairro.AsString   := qryAux.FieldByName('xBairro').AsString;
    EditTomadorEmail.AsString     := qryAux.FieldByName('Email').AsString;
    EditTomadorCEP.AsString      := qryAux.FieldByName('CEP').AsString;
    EditTomadorMunic.AsString    := qryAux.FieldByName('xMun').AsString;
    EditTomadorUF.AsString       := qryAux.FieldByName('UF').AsString;
    EditTomadorPais.AsString     := qryAux.FieldByName('xPais').AsString;
    EditTomadorRelCarga.AsString := cRelCarga;


    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add('Select *  ');
    qryAux.Sql.Add('From CTE_Destinatario ' );
    qryAux.Sql.Add('Where CTE_Destinatario = ' + QuotedStr(Cod_Destinatario)  );
    qryAux.Open;

    EditDestCNPJ.AsString := qryAux.FieldByName('CNPJ').AsString;
    EditDestNome.AsString := qryAux.FieldByName('xNome').AsString;
    EditDestIE.AsString   := qryAux.FieldByName('ie').AsString;
    EditDestUF.AsString   := qryAux.FieldByName('UF').AsString;


    EditDestinatarioNome.AsString     := qryAux.FieldByName('xNome').AsString;
    EditDestinatarioCNPJ.AsString     := qryAux.FieldByName('CNPJ').AsString;
    EditDestinatarioIE.AsString       := qryAux.FieldByName('IE').AsString;
    EditDestinatarioEnd.AsString      := qryAux.FieldByName('xLgr').AsString + ',' +
                                         qryAux.FieldByName('nro').AsString  + '-' +
                                         qryAux.FieldByName('xCpl').AsString;
    EditDestinatarioBairro.AsString   := qryAux.FieldByName('xBairro').AsString;
    EditDestinatarioCEP.AsString      := qryAux.FieldByName('CEP').AsString;
    EditDestinatarioMunic.AsString    := qryAux.FieldByName('xMun').AsString;
    EditDestinatarioUF.AsString       := qryAux.FieldByName('UF').AsString;
    EditDestinatarioPais.AsString     := qryAux.FieldByName('xPais').AsString;

    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add('Select *  ');
    qryAux.Sql.Add('From CTE_Remetente ' );
    qryAux.Sql.Add('Where CCT = ' + QuotedStr(EditcCT.Text )  );
    qryAux.Open;

    EditRemCNPJ.AsString := qryAux.FieldByName('CNPJ').AsString;
    EditRemNome.AsString := qryAux.FieldByName('xNome').AsString;
    EditRemIE.AsString   := qryAux.FieldByName('ie').AsString;
    EditRemUF.AsString   := qryAux.FieldByName('UF').AsString;

    EditRemetenteNome.AsString     := qryAux.FieldByName('xNome').AsString;
    EditRemetenteFantasia.AsString := qryAux.FieldByName('xFant').AsString;
    EditRemetenteCNPJ.AsString     := qryAux.FieldByName('CNPJ').AsString;
    EditRemetenteIE.AsString       := qryAux.FieldByName('IE').AsString;
    EditRemetenteEnd.AsString      := qryAux.FieldByName('xLgr').AsString + ',' +
                                      qryAux.FieldByName('nro').AsString  + '-' +
                                      qryAux.FieldByName('xCpl').AsString;
    EditRemetenteBairro.AsString   := qryAux.FieldByName('xBairro').AsString;
    EditRemetenteEmail.AsString    := qryAux.FieldByName('Email').AsString;
    EditRemetenteCEP.AsString      := qryAux.FieldByName('CEP').AsString;
    EditRemetenteMunic.AsString    := qryAux.FieldByName('xMun').AsString;
    EditRemetenteUF.AsString       := qryAux.FieldByName('UF').AsString;
    EditRemetentePais.AsString     := qryAux.FieldByName('xPais').AsString;


    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add('Select  V.VTPREST, V.VREC, I.VBC, I.VICMS, I.CST, I.PREDBC, I.VCRED, I.PICMS, I.VTOTTRIB  ');
    qryAux.Sql.Add('FROM CTE_VPREST V ' );
    qryAux.Sql.Add('INNER JOIN CTE_IMPOSTOS I ON I.CCT = V.CCT ' );
    qryAux.Sql.Add('Where V.CCT = ' + QuotedStr(EditcCT.Text)  );
    qryAux.Open;

    EditValTotServico.AsDouble := qryAux.FieldByName('VTPREST').AsFloat;
    EditBaseCalcICMS.AsDouble := qryAux.FieldByName('VBC').AsFloat;
    EditValorICMS.AsDouble := qryAux.FieldByName('VICMS').AsFloat;

    EditPrestValorServico.AsDouble := qryAux.FieldByName('VTPREST').AsFloat;
    EditPrestValorReceber.AsDouble := qryAux.FieldByName('VREC').AsFloat;
    EditImpostoCST.AsString :=  qryAux.FieldByName('CST').AsString;
    EditImpostoBaseCalc.AsDouble :=  qryAux.FieldByName('PREDBC').AsFloat;
    EditImpostoValorCredito.AsDouble := qryAux.FieldByName('VCRED').AsFloat;
    EditImpostoBCICMS.AsDouble :=  qryAux.FieldByName('VBC').AsFloat;
    EditImpostoAliquotaICMS.AsDouble :=  qryAux.FieldByName('PICMS').AsFloat;
    EditImpostoValorICMS.AsDouble :=  qryAux.FieldByName('VICMS').AsFloat;
    EditImpostoValorTotalTrib.AsDouble := qryAux.FieldByName('VTOTTRIB').AsFloat;

    cdsComp.Close;
    cdsComp.Params.ParamByName('cCT').AsString := EditcCT.Text;
    cdsComp.Open;

    cdsAutXML.Close;
    cdsAutXML.Params.ParamByName('cCT').AsString := EditcCT.Text;
    cdsAutXML.Open;

    cdsNFE.Close;
    cdsNFE.Params.ParamByName('cCT').AsString := EditcCT.Text;
    cdsNFE.Open;

    cdsInfoQ.Close;
    cdsInfoQ.Params.ParamByName('cCT').AsString := EditcCT.Text;
    cdsInfoQ.Open;

    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add('Select vCarga, propred,XOUTCAT From CTE_INFCARGA ');
    qryAux.Sql.Add('Where CCT = ' + QuotedStr(EditcCT.Text)  );
    qryAux.Open;

    EditInfoValorTotalCarga.AsDouble := qryAux.FieldByName('vCarga').AsFloat;
    EditInfoProdutoPred.AsString     := qryAux.FieldByName('propred').AsString;
    EditInfoOutrasCarac.AsString     := qryAux.FieldByName('XOUTCAT').AsString;

    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add('Select RESPSEG, XSEG, NAPOLICE, VCARGA from CTE_SEGURADORA ');
    qryAux.Sql.Add('Where CCT = ' + QuotedStr(EditcCT.Text)  );
    qryAux.Open;

    EditSeguradoraResp.AsString   := TpRspSeguroToStrText(StrToTpRspSeguro(ok,qryAux.FieldByName('RESPSEG').AsString));
    EditSeguradoraNome.AsString   := qryAux.FieldByName('XSEG').AsString;
    EditSeguradoraApolic.AsString := qryAux.FieldByName('NAPOLICE').AsString;
    EditSeguradoraValor.AsDouble  := qryAux.FieldByName('vCarga').AsFloat;

    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add('Select dprevaereo, idt, cl, cTar, vtarifa,  nMinu, nOCA, xLAgEmi from CTE_INFMODAL ');
    qryAux.Sql.Add('Where CCT = ' + QuotedStr(EditcCT.Text)  );
    qryAux.Open;
    TabSheetAereo.Visible := (qryAux.FieldByName('idt').AsString <> '');

    if not qryAux.IsEmpty then
    begin
     EditInfoModalMinuta.AsString         :=  qryAux.FieldByName('nMinu').AsString;
     EditInfoModalNumOpera.AsString       :=  qryAux.FieldByName('nOCA').AsString;
     EditInfoModalDtaPrevEntrega.AsString :=  qryAux.FieldByName('dprevaereo').AsString;
     EditInfoModalCodIATA.AsString        :=  qryAux.FieldByName('idt').AsString;
     EditInfoModalLojaEmissor.AsString    :=  qryAux.FieldByName('xLAgEmi').AsString;
     EditInfoModalCodigo.AsString         :=  qryAux.FieldByName('cTar').AsString;
     EditInfoModalClasse.AsString         :=  qryAux.FieldByName('cl').AsString;
     EditInfoModalValor.AsDouble          :=  qryAux.FieldByName('vtarifa').AsFloat;
    end;

    cxgNatCarga.Visible := False;
    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add(' Select xdime, cimp, cInfManu from CTE_INFMANU ');
    qryAux.Sql.Add('Where CCT = ' + QuotedStr(EditcCT.Text)  );
    qryAux.Open;

    if not qryAux.IsEmpty then
    begin
       cxgNatCarga.Visible := True;
       EditNatCargaDimensao.AsString  := qryAux.FieldByName('xdime').AsString;
       EditNatCargaManuseio.AsString  := qryAux.FieldByName('cInfManu').AsString;
       EditNatCargaCEspecial.AsString := qryAux.FieldByName('cimp').AsString;
    end;



    qryAux.Close;

  end;
end;


end.




