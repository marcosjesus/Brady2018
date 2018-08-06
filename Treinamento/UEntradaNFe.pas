unit UEntradaNFe;

interface

uses
 Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
 fcadastro, ComCtrls, StdCtrls, Buttons, ToolWin, ExtCtrls, rsEdit, Mask,
 rsFlyovr, RseditDB, Db, DBTables, CheckLst, jpeg, Grids, DBGrids, DBCtrls,
 RxLookup, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, Variants,
 cxDropDownEdit, cxCalendar, Menus, cxLookAndFeelPainters, cxGraphics,
 dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxStatusBarPainter,
 dxStatusBar, cxButtons, cxStyles, dxSkinscxPCPainter, cxCustomData,
 cxFilter, cxData, cxDataStorage, cxDBData, cxGridCustomTableView,
 cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses,
 cxGridCustomView, cxGrid, cxPC, cxGroupBox, cxRadioGroup, cxLabel, cxMemo,
 cxCheckBox, cxLookAndFeels, dxSkinBlack, dxSkinBlue, dxSkinMoneyTwins,
 dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2010Black, SqlTimSt,
 dxSkinOffice2010Blue, DBClient, Provider, FMTBcd, SqlExpr, cxLookupEdit,
 cxDBLookupEdit, cxDBLookupComboBox, udmBaseDocFiscal,
 SetParametro, EditBusca, DateFun, uItemDevolucao, CadFornecedor, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinValentine, dxSkinXmas2008Blue, DBConect, Contnrs, TypInfo;
//  uClassCalculaImpostoRN;



type
 TFrmEntradaNFe = class(TFrmCadastro)
  qryAux: TSQLQuery;
  Panel8: TPanel;
  Panel1: TPanel;
  EdiCodigo: TrsSuperEdit;
  Panel5: TPanel;
  EdiTipo: TrsSuperEdit;
  Panel2: TPanel;
  EdiSaida: TrsSuperEdit;
  EdiVecto: TrsSuperEdit;
  PageGeral: TcxPageControl;
  tabItens: TcxTabSheet;
  tabVenctos: TcxTabSheet;
  PageControl2: TcxPageControl;
  tbsGradeVcto: TcxTabSheet;
  cxGrid3: TcxGrid;
  cxGridDBTableView2: TcxGridDBTableView;
  cxGridDBTableView2Parcela: TcxGridDBColumn;
  cxGridDBTableView2Column3: TcxGridDBColumn;
  cxGridDBTableView2Vencimento: TcxGridDBColumn;
  cxGridDBTableView2Column1: TcxGridDBColumn;
  cxGridLevel2: TcxGridLevel;
  tbsEdicaoVcto: TcxTabSheet;
  Panel29: TPanel;
  EdiVcto: TcxDateEdit;
  Panel30: TPanel;
  EdiValParcela: TrsSuperEdit;
  Panel7: TPanel;
  Panel39: TPanel;
  ButNovoItemVcto: TcxButton;
  ButAlterarItemVcto: TcxButton;
  ButExcluirItemVcto: TcxButton;
  ButSalvarItemVcto: TcxButton;
  ButCancelarItemVcto: TcxButton;
  Panel21: TPanel;
  ButNovoItem: TcxButton;
  ButAlterarItem: TcxButton;
  ButExcluirItem: TcxButton;
  ButSalvarItem: TcxButton;
  ButCAncelarItem: TcxButton;
  Page: TcxPageControl;
  tbsGrade: TcxTabSheet;
  tbsEdit: TcxTabSheet;
  Panel3: TPanel;
  cmbGrupo: TRxDBLookupCombo;
  Panel15: TPanel;
  Edit1: TEdit;
  Panel4: TPanel;
  EdiQtde: TrsSuperEdit;
  EdiTotal: TrsSuperEdit;
  EdiValor: TrsSuperEdit;
  EdiLiquido: TrsSuperEdit;
  Panel6: TPanel;
  EdiNatureza: TrsSuperEdit;
  Edit2: TEdit;
  qryTemp: TSQLQuery;
  cxGrid1: TcxGrid;
  cxGrid1DBTableView1: TcxGridDBTableView;
  cxGrid1DBTableView1CodProduto: TcxGridDBColumn;
  cxGrid1DBTableView1DescProduto: TcxGridDBColumn;
  cxGrid1DBTableView1Qtde: TcxGridDBColumn;
  cxGrid1DBTableView1ValorUnitario: TcxGridDBColumn;
  cxGrid1DBTableView1ValorTotal: TcxGridDBColumn;
  cxGrid1DBTableView1PorcImposto: TcxGridDBColumn;
  cxGrid1DBTableView1Column1: TcxGridDBColumn;
  cxGrid1DBTableView1ValorLiquido: TcxGridDBColumn;
  cxGrid1DBTableView1Column6: TcxGridDBColumn;
  cxGrid1Level2: TcxGridLevel;
  cxGrid1DBTableView1Column2: TcxGridDBColumn;
  Panel17: TPanel;
  EdiCodFilial: TrsSuperEdit;
  Edit6: TEdit;
  tabComplementar: TcxTabSheet;
  Panel9: TPanel;
  Label1: TLabel;
  memObservacao: TMemo;
  tabTransportadora: TcxTabSheet;
  Panel12: TPanel;
  rsSuperEdit3: TrsSuperEdit;
  Edit4: TEdit;
  EdiPlaca: TrsSuperEdit;
  Panel13: TPanel;
  RadioButton1: TcxRadioButton;
  RadioButton2: TcxRadioButton;
    EdiFreteaaa: TrsSuperEdit;
  rsSuperEdit4: TrsSuperEdit;
  Panel14: TPanel;
  EdiQuantidade: TrsSuperEdit;
  EdiMarca: TrsSuperEdit;
  EdiEspecie: TrsSuperEdit;
  Panel19: TPanel;
  EdiPesoBruto: TrsSuperEdit;
  EdiPesoLiquido: TrsSuperEdit;
  Panel18: TPanel;
  EdiEntrega: TrsSuperEdit;
  pnlDesconto: TPanel;
  cxLabel6: TcxLabel;
  rsSuperEdit1: TrsSuperEdit;
  cxCheckBox2: TcxCheckBox;
  cxGroupBox6: TcxGroupBox;
  cxButton1: TcxButton;
  cxButton3: TcxButton;
  Panel20: TPanel;
  cxLabel7: TcxLabel;
  EdiTotalDesconto: TrsSuperEdit;
  cxGrid1DBTableView1Column3: TcxGridDBColumn;
  cxGrid1DBTableView1Column4: TcxGridDBColumn;
  cxGrid1DBTableView1Column5: TcxGridDBColumn;
  cxGrid1DBTableView1Column7: TcxGridDBColumn;
  cxButton5: TcxButton;
  qryTemp2: TSQLQuery;
  Panel24: TPanel;
  SpbPesquisa: TcxButton;
  pnlNF: TPanel;
  ButPesqNF: TcxButton;
  EdiPesqNF: TrsSuperEdit;
  lblObs1: TLabel;
  cxGrid1DBTableView1Column8: TcxGridDBColumn;
    cxGrid1DBTableView1Column9: TcxGridDBColumn;
    cxGrid1DBTableView1Column10: TcxGridDBColumn;
    qryEndereco: TSQLQuery;
    dspEndereco: TDataSetProvider;
    cdsEndereco: TClientDataSet;
    dtsEndereco: TDataSource;
    cdsEnderecoENDERECOEND: TStringField;
    cdsEnderecoCHAVESEQEND: TIntegerField;
    EdiUF: TrsSuperEdit;
    CbxUF: TComboBox;
    popICMS: TPopupMenu;
    CalcularSubstituiopelaAliquotaInter1: TMenuItem;
    ICMSSTPadro1: TMenuItem;
    pnlTributos: TPanel;
    cxLabel9: TcxLabel;
    rsSuperEdit2: TrsSuperEdit;
    cxCheckBox1: TcxCheckBox;
    cxGroupBox1: TcxGroupBox;
    cxButton6: TcxButton;
    cxButton7: TcxButton;
    Panel26: TPanel;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    dtsTributos: TDataSource;
    cdsTributos: TClientDataSet;
    dspTributos: TDataSetProvider;
    qryTributos: TSQLQuery;
    cxGrid2DBTableView1NCM: TcxGridDBColumn;
    cxGrid2DBTableView1EX: TcxGridDBColumn;
    cxGrid2DBTableView1Tabela: TcxGridDBColumn;
    cxGrid2DBTableView1AliqNac: TcxGridDBColumn;
    cxGrid2DBTableView1AliqImp: TcxGridDBColumn;
    cdsTributosCodProduto: TIntegerField;
    cdsTributosOrigmMerc: TIntegerField;
    cdsTributosAliqNac: TFMTBCDField;
    cdsTributosAliqImp: TFMTBCDField;
    cdsTributosEX: TIntegerField;
    cdsTributosTabela: TIntegerField;
    cxGrid1DBTableView1vTotTrib: TcxGridDBColumn;
    cxgTotal: TcxGroupBox;
    Label48: TcxLabel;
    Label29: TcxLabel;
    EdiTotProd: TrsSuperEdit;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    EdiBaseICMS: TrsSuperEdit;
    EdiTotICMS: TrsSuperEdit;
    EdiTotalFrete: TrsSuperEdit;
    EdiBaseICMS_ST: TrsSuperEdit;
    EdiTotalNF: TrsSuperEdit;
    EdiValorIMCS_ST: TrsSuperEdit;
    cxLabel8: TcxLabel;
    cxLabel14: TcxLabel;
    cxLabel15: TcxLabel;
    cxLabel16: TcxLabel;
    cxLabel17: TcxLabel;
    ediAliTotIPI: TrsSuperEdit;
    ediValTotIPI: TrsSuperEdit;
    ediAliTotPIS: TrsSuperEdit;
    ediValTotPIS: TrsSuperEdit;
    ediValTotCOFINS: TrsSuperEdit;
    ediAliTotCOFINS: TrsSuperEdit;
    cxLabel22: TcxLabel;
    cxLabel23: TcxLabel;
    cxLabel24: TcxLabel;
    ediTotalSeguro: TrsSuperEdit;
    cxLabel10: TcxLabel;
    TotalDesconto: TrsSuperEdit;
    cxLabel11: TcxLabel;
    EdiBaseIPI: TrsSuperEdit;
    cxLabel12: TcxLabel;
    EdiBasePIS: TrsSuperEdit;
    cxLabel13: TcxLabel;
    EdiBaseCOFINS: TrsSuperEdit;
    Panel22: TPanel;
    EdiTipoICMS: TrsSuperEdit;
    Panel10: TPanel;
    rsSuperEdit7: TrsSuperEdit;
    EdiPorcIPI: TrsSuperEdit;
    EdiPorcPIS: TrsSuperEdit;
    EdiPorcCOFINS: TrsSuperEdit;
    EdiPorcICMS: TrsSuperEdit;
    Edi_IVA: TrsSuperEdit;
    EdiIVA_Orig: TrsSuperEdit;
    EdiCondPagto: TrsSuperEdit;
    Edit3: TEdit;
    mskCNPJ: TcxMaskEdit;
    cxButton8: TcxButton;
    lblUnidade: TLabel;
    EdiNatOper: TrsSuperEdit;
    Edit5: TEdit;
    EdiCFOPGeral: TrsSuperEdit;
    Panel16: TPanel;
    cxButton9: TcxButton;
    rsSuperEdit5: TrsSuperEdit;
    cmbTipoFrete: TcxComboBox;
    rsSuperEdit13: TrsSuperEdit;
    rsSuperEdit6: TrsSuperEdit;
    ediFrete: TrsSuperEdit;
    ediSeguro: TrsSuperEdit;
    EdiOutrasDespesas: TrsSuperEdit;
    btnRecalculaOrc: TcxButton;
    cxLabel5: TcxLabel;
    EdiTotOutrasDespesas: TrsSuperEdit;
    memDetalhe: TMemo;
    pnlCredito: TPanel;
    rsSuperEdit9: TrsSuperEdit;
    EdiCreditoPorc: TrsSuperEdit;
    EdiCreditoBR: TrsSuperEdit;
    EditFornecedor: TEditBusca;
    ediIE: TrsSuperEdit;
    TabEndereco: TcxTabSheet;
    cxGroupBox2: TcxGroupBox;
    Panel25: TPanel;
    EdiEnd: TrsSuperEdit;
    EdiComplemento: TrsSuperEdit;
    EdiNum: TrsSuperEdit;
    mskCep: TcxMaskEdit;
    Panel28: TPanel;
    EdiCidade: TrsSuperEdit;
    rsSuperEdit10: TrsSuperEdit;
    cbUF: TcxComboBox;
    EdiBairro: TrsSuperEdit;
    cxGroupBox3: TcxGroupBox;
    Panel31: TPanel;
    rbSimUsaEnd: TRadioButton;
    rbNaoUsaEnd: TRadioButton;
    Panel32: TPanel;
    EdiEndEnt: TrsSuperEdit;
    EdiComplementoEnt: TrsSuperEdit;
    EdiNumEnt: TrsSuperEdit;
    MskCepEnt: TcxMaskEdit;
    Panel33: TPanel;
    EdiCidadeEnt: TrsSuperEdit;
    rsSuperEdit12: TrsSuperEdit;
    cbxUFEnt: TcxComboBox;
    EdiBairroEnt: TrsSuperEdit;
    Panel34: TPanel;
    Label6: TLabel;
    edtPontoReferenciaEnt: TrsSuperEdit;
    Panel35: TPanel;
    cxButton10: TcxButton;
    cmbEndereco: TRxDBLookupCombo;
    rsSuperEdit14: TrsSuperEdit;
    cxButton11: TcxButton;
    EdiCodPedido: TrsSuperEdit;
    EdiFilialPed: TrsSuperEdit;
    Panel36: TPanel;
    rsSuperEdit15: TrsSuperEdit;
    spbLimpaCNPJ: TcxButton;
    cmbFisJur: TcxComboBox;
    cxdEmissao: TcxDateEdit;
    cxdSaida: TcxDateEdit;
    EdiSituacao: TrsSuperEdit;
    btnEditarCliente: TcxButton;
    lblUF: TLabel;
    ediEmissao: TrsSuperEdit;
    lblTipo: TLabel;
    EdiProduto: TEditBusca;
    edtMesmoEndereco: TrsSuperEdit;
    edtQtde2: TrsSuperEdit;
    lblUnidadeConversao: TLabel;
    TabDetalhe: TcxTabSheet;
    Panel11: TPanel;
    cmbGrupo_Det: TRxDBLookupCombo;
    DataEntrega_Det: TcxDateEdit;
    Panel23: TPanel;
    Edit7: TEdit;
    ediNCM_Det: TrsSuperEdit;
    ediProduto_Det: TEditBusca;
    Panel37: TPanel;
    lblUnidade_Det: TLabel;
    ediQtde_Det: TrsSuperEdit;
    ediTotal_Det: TrsSuperEdit;
    ediValor_Det: TrsSuperEdit;
    ediLiquido_Det: TrsSuperEdit;
    Panel38: TPanel;
    rsSuperEdit8: TrsSuperEdit;
    ediCFOP_Det: TrsSuperEdit;
    ediPorcICMS_Det: TrsSuperEdit;
    editcsticms_det: TrsSuperEdit;
    edivaloricms_det: TrsSuperEdit;
    Panel40: TPanel;
    rsSuperEdit11: TrsSuperEdit;
    ediPorcProvPartICMS: TrsSuperEdit;
    edifcp: TrsSuperEdit;
    ediVlrICMSRemtente: TrsSuperEdit;
    ediVlrICMSDestinatario: TrsSuperEdit;
    Panel41: TPanel;
    rsSuperEdit17: TrsSuperEdit;
    ediPorcIPI_Det: TrsSuperEdit;
    edicstipi_Det: TrsSuperEdit;
    edivaloripi_det: TrsSuperEdit;
    Panel42: TPanel;
    rsSuperEdit18: TrsSuperEdit;
    ediPorcPIS_Det: TrsSuperEdit;
    edicstpis_det: TrsSuperEdit;
    edivalorpis_det: TrsSuperEdit;
    Panel43: TPanel;
    rsSuperEdit19: TrsSuperEdit;
    ediPorcCofins_Det: TrsSuperEdit;
    edicstcofins_det: TrsSuperEdit;
    edivalorcofins_det: TrsSuperEdit;
    Panel44: TPanel;
    rsSuperEdit20: TrsSuperEdit;
    PorcIcmsST_Det: TrsSuperEdit;
    edicsticmsst_det: TrsSuperEdit;
    ediValorICMSST_Det: TrsSuperEdit;
    PorcIVA_Det: TrsSuperEdit;
    PorcIVAAjus_Det: TrsSuperEdit;
    Panel45: TPanel;
    rsSuperEdit21: TrsSuperEdit;
    ediValorFrete_Det: TrsSuperEdit;
    ediValorSeguro_Det: TrsSuperEdit;
    ediValorOutrasDespesas_Det: TrsSuperEdit;
    butDevolucao: TcxButton;
    edtNCM: TrsSuperEdit;
    edtProdutoFornecedor: TrsSuperEdit;
    EdiFornecedor: TrsSuperEdit;
    Panel46: TPanel;
    editDigBaseICMSST: TrsSuperEdit;
    editDigValorICMSST: TrsSuperEdit;
    chkGARE: TCheckBox;
    EditTipoPIS: TrsSuperEdit;
    editTipoCofins: TrsSuperEdit;
    EditTipoIPI: TrsSuperEdit;
  procedure FormCreate(Sender: TObject);
  procedure ButNovoItemClick(Sender: TObject);
  procedure ButAlterarItemClick(Sender: TObject);
  procedure ButExcluirItemClick(Sender: TObject);
  procedure ButSalvarItemClick(Sender: TObject);
  procedure ButCAncelarItemClick(Sender: TObject);
  procedure ButSalvarClick(Sender: TObject);
  procedure ButExcluirClick(Sender: TObject);
  procedure ButAlterarClick(Sender: TObject);
  procedure ButNovoClick(Sender: TObject);
  procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  procedure EdiNaturezaExit(Sender: TObject);
  procedure EdiValorChange(Sender: TObject);
  procedure EdiPorcImpChange(Sender: TObject);
  procedure EdiQtdeChange(Sender: TObject);
  procedure EdiProdutoChange(Sender: TObject);
  procedure EdiProdutoExit(Sender: TObject);
  procedure EdiQtdeExit(Sender: TObject);
  procedure EdiPorcICMSChange(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure PageGeralChange(Sender: TObject);
  procedure ButNovoItemVctoClick(Sender: TObject);
  procedure ButAlterarItemVctoClick(Sender: TObject);
  procedure ButExcluirItemVctoClick(Sender: TObject);
  procedure ButSalvarItemVctoClick(Sender: TObject);
  procedure ButCancelarItemVctoClick(Sender: TObject);
  procedure EdiNatOperExit(Sender: TObject);
  procedure cxButton2Click(Sender: TObject);
  procedure cmbEnderecoClick(Sender: TObject);
  procedure cmbEnderecoEnter(Sender: TObject);
  procedure cxButton1Click(Sender: TObject);
  procedure cxButton3Click(Sender: TObject);
  procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  procedure PageGeralPageChanging(Sender: TObject; NewPage: TcxTabSheet;
    var AllowChange: Boolean);
  procedure EdiCodAliquotaExit(Sender: TObject);
  procedure cxButton5Click(Sender: TObject);
  procedure EdiCodFilialExit(Sender: TObject);
  procedure ButCancelarClick(Sender: TObject);
  procedure EdiCodigoEnter(Sender: TObject);
  // procedure memObservacaoKeyPress(Sender: TObject; var Key: Char);
  procedure Button1Click(Sender: TObject);
  procedure EdiCodigoExit(Sender: TObject);
    procedure cdsTipoCSTAfterScroll(DataSet: TDataSet);
    procedure EdiCreditoPorcExit(Sender: TObject);
    procedure CbxUFKeyPress(Sender: TObject; var Key: Char);
    procedure CalcularSubstituiopelaAliquotaInter1Click(Sender: TObject);
    procedure ButSairClick(Sender: TObject);
    procedure cxButton7Click(Sender: TObject);
    procedure cxButton6Click(Sender: TObject);
    procedure cmbGrupoCloseUp(Sender: TObject);
    procedure cmbFisJurExit(Sender: TObject);
    procedure spbLimpaCNPJClick(Sender: TObject);
    procedure cxButton8Click(Sender: TObject);
    procedure btnRecalculaOrcClick(Sender: TObject);
    procedure EdiValorExit(Sender: TObject);
    procedure EditFornecedorExit(Sender: TObject);
    procedure EdiProdutoClick(Sender: TObject);
    procedure rbSimUsaEndClick(Sender: TObject);
    procedure rbNaoUsaEndClick(Sender: TObject);
    procedure edtQtde2Exit(Sender: TObject);
    procedure EdiNatOperEnter(Sender: TObject);
    procedure btnEditarClienteClick(Sender: TObject);
    procedure EdiFornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chkGAREClick(Sender: TObject);
    procedure EdiFornecedorExit(Sender: TObject);
    procedure EdiTipoICMSEnter(Sender: TObject);
 private
  { Private declarations }
  ContaItem   : integer;
  NumNFInsereCP : String;
  PedidoIsereCP : String;

  IncAutomatico, Tela: Boolean;
  Var_OperacaoItem: Integer;
  NFSalva: Boolean;
  Valor60 : Double;
  Procedure ProcuraNCM( CodProduto : String );
  Procedure AtualizaEndereco(CodCliente : String);
  Function ValidaItens(var Item : Integer) : Boolean;
//  Function RegimeTributario(CodFilial : String) : String;
  procedure ButItensOnOff(S: String);
  procedure Search; Override;
  Procedure Scape; Virtual;
  procedure FiltroItens(Totaliza: Boolean = True);
  Procedure TotalizaNotaFiscal;
  Function  CheckItem: Boolean;
  procedure CalcValor;
  Function  CFOP(CodFornecedor: String): Boolean;
  procedure ExcluirItemVcto;
  procedure IncluiItemVcto;
  procedure AlteraItemVcto;
//  Procedure InsereConPag;
  // Function IMCS_Cliente(Cliente : String) : Double;
  Function  IncideIMCS(NumNF: String; Filial: String): Boolean;
  Procedure Insere_InfComplementar;
  Function  ProdutoDuplicado(Codigo: String; CodFilial: String; Produto: String): Boolean;
  Function  ConfereICMS(NumNF: String; CodFilial: String; ICMS : Double; var AliqICMSUsada : Double): Boolean;
//  procedure CarregaNota(bMostraTotal: Boolean);
  procedure ProdutoST(CodProduto, UF: String);
    procedure LimpaTelaItem;
    procedure PreencheEnderecoFornecedor;
    procedure LocalizaDocto;
    procedure ProdutoSetaValores;
    procedure PreencheEnderecoEntrega;
    procedure CopiarEndereco(bCopia: Boolean);
    procedure CarregaTotaisDaNota;
 public
  { Public declarations }
  SituacaoPedido : TSituacao;
 //OrigemdaNota   : TOrigemNota;
  vCodPedido: String;
  vCodFilial, vCodFilialOrig: String;
  GeraNFe: Boolean;
  Function Check: Boolean; Override;
 end;

var
 FrmEntradaNFe: TFrmEntradaNFe;

implementation

{$R *.DFM}

Uses
 Global, ObjFun, MensFun, StrFun, TestFun, ConsTabFun, Perfil, Constantes,
 EndEntrega, CadClientes, Produtos, uDMBaseProduto, uSelFinalidade;

procedure TFrmEntradaNFe.FormCreate(Sender: TObject);
begin
 LabCadTit.Caption := 'Entrada Manual de Nota Fiscal Eletrônica';
 FormOperacao      := '';
 FormTabela        := 'NFe_Entrada';
 FormChaves        := 'NumNF;CodFilial;CodFornecedor';
 FormCtrlFocus     := 'EdiCodFilial';
 FormDataFocus     := 'EditFornecedor';
 FormOBS           := 'Observacao';

 inherited;
 Top := 1;
 Width := 993;
 Height := 610;

 GeraNFe := False;

 EdiCodigo.CT_Sql.Clear;
 EdiCodigo.CT_Sql.Add('Select NumNF, Nome, DataEmissao, Situacao from NFe_Entrada n, Fornecedores f ');
 EdiCodigo.CT_Sql.Add('where n.CodFornecedor = f.CodFornecedor ');
 EdiCodigo.CT_Sql.Add('Order By NumNF ');

 EdiFornecedor.CT_Sql.Clear;
 EdiFornecedor.CT_Sql.Add('Select  n.CodFornecedor, n.NumNF, Nome, Endereco_3 From NFe_Entrada n, Fornecedores f ');
 EdiFornecedor.CT_Sql.Add('where n.CodFornecedor = f.CodFornecedor ');
 EdiFornecedor.CT_Sql.Add('Order By Nome ');

 dmBaseDocFiscal.cdsTipoCli.Open;

 dmBaseDocFiscal.cdsTipoCli.Open;
 SetParametros(EditFornecedor, TipoFornecedor);

 SetParametros(EdiProduto, TipoProdutoFornecedor );
 EdiProduto.bs_Filter := ' g.Tipo = ''V'' and p.Ativo = ''1''';

 SetParametros(EdiProduto_Det, TipoProdutoFornecedor);
 EdiProduto_Det.bs_Filter := ' g.Tipo = ''V''and p.Ativo = ''1''';
 dmBaseProduto.AbreTabelaGrupo('V');
 ButImprimir.Visible := False;
 ButNovo.Visible     := False;
end;

Function TFrmEntradaNFe.Check: Boolean;
Begin


 if (EditFornecedor.Text <> '')  then
  EdiFornecedor.AsInteger := EditFornecedor.bs_KeyValue;
 EdiEmissao.AsString := cxdEmissao.Text;
 EdiSaida.AsString   := cxdSaida.Text;
 EdiUF.AsString      := CbxUF.Text;

 if ((cmbEndereco.KeyValue <> '') and (cmbEndereco.KeyValue <> null)) then
  EdiEntrega.AsString := cmbEndereco.KeyValue
 else
  EdiEntrega.AsString := '';

 dmBaseDocFiscal.NFE_EntradaFiltroItensVcto(EdiCodigo.Text, EdiCodFilial.Text, EdiFornecedor.Text);


 Result := False;
 If (Test_IsEmptyStr(EdiCodigo.Text)) Then
 Begin
  Mens_MensInf('É Necessário Informar Número da Nota Fiscal !');
  EdiCodigo.SetFocus;
  Exit;
 End;

 if ((EdiFornecedor.AsString = '')) then
 begin
  Mens_MensInf('É necessário informar o Fornecedor !');
  EdiFornecedor.SetFocus;
  Exit;
 end;

 If (Test_IsEmptyStr(EdiNatOper.Text)) Then
 Begin
  Mens_MensInf('É necessário informar a Natureza da Operação !');
  EdiNatOper.SetFocus;
  Exit;
 End;

 If EdiEmissao.AsDateTime = 0 Then
 Begin
  Mens_MensInf('É necessário informar Data de Emissão da Nota Fiscal !');
  EdiEmissao.SetFocus;
  Exit;
 End;

 if (Trim(EdiCondPagto.AsString) <> '') and
   ((dmBaseDocFiscal.cdsNfeEntradaItensVcto.IsEmpty) or (not dmBaseDocFiscal.cdsNfeEntradaItensVcto.Active))  then
 begin
  Mens_MensInf('Verifique os Vencimentos da Nota Fiscal !');
  PageGeral.ActivePageIndex := 1;
  Application.ProcessMessages;
  Exit;
 end;

   If ( not Test_IsEmptyStr(EdiPlaca.AsString) ) and (( Test_IsEmptyStr(CbxUF.Text) ) or (CbxUF.ItemIndex = -1))  Then
	 Begin
			 Mens_MensInf('É necessário informar o Estado (UF) do veículo ! ') ;
       PageGeral.ActivePage := tabTransportadora;
			 cbxUF.SetFocus ;
			 Exit ;
	 End ;


   if dmBaseDocFiscal.cdsNfeEntradaItensVcto.IsEmpty then
   begin
       Mens_MensInf('É necessário informar a Forma de pagamento !') ;
       PageGeral.ActivePage := tabVenctos;

       Exit ;
   end;

   if cxGridDBTableView2.DataController.Summary.FooterSummaryValues[0] <> Arredondar(EdiTotalNF.Value,2) Then
   begin
      Mens_MensInf('Valor Total de Parcelas é diferente do Valor Total da Orçamento !') ;
       PageGeral.ActivePage := tabVenctos;
      Exit ;
   end;


 {
   if ((rsSuperEdit3.AsString = '')) then
   begin
   Mens_MensInf('Verifique os dados de Transporte !') ;
   PageGeral.ActivePage := tabTransportadora;
   rsSuperEdit3.SetFocus ;
   Exit ;
   end;
 }
 {
   if ((memObservacao.Text = '')) then
   begin
   Mens_MensInf('Verifique os dados Complementares !') ;
   PageGeral.ActivePage := tabComplementar;
   memObservacao.SetFocus ;
   Exit ;
   end;
 }
 { If EdiVecto.AsDateTime = 0 Then
   Begin
   Mens_MensInf('É necessário informar Data de Vencimento do Boleto !') ;
   EdiVecto.SetFocus ;
   Exit ;
   End ;
 }
 Result := True;
End;

procedure TFrmEntradaNFe.chkGAREClick(Sender: TObject);
begin
  inherited;
  editDigBaseICMSST.ReadOnly := not chkGARE.Checked;
  editDigValorICMSST.ReadOnly := not chkGARE.Checked;
end;

procedure TFrmEntradaNFe.LimpaTelaItem;
begin
  EdiNatureza.AsString := '';
  EdiProduto.Text := '';
  EdiProduto.bs_KeyValues.Clear;
  cmbGrupo.KeyValue := '';
  EdiQtde.AsDouble := 0;
  EdiValor.AsDouble := 0;
  EdiPorcICMS.AsDouble := 0;
  //EdiPorc.AsDouble := 0;
  EdiTotal.AsDouble := 0;
  EdiLiquido.AsDouble := 0;
  Edi_IVA.AsDouble := 0;
  EdiCreditoPorc.AsDouble := 0;
  EdiCreditoBR.AsDouble := 0;
  lblUnidade.Caption := 'Uni.';
  lblUnidadeConversao.Caption := 'Uni.';

  EdiTipoICMS.AsString := '';
  EditTipoPIS.AsString := '';
  editTipoCofins.AsString := '';
  EditTipoIPI.AsString := '';
  chkGARE.Checked := false;
  editDigBaseICMSST.AsDouble := 0;
  editDigValorICMSST.AsDouble := 0;
  edtNCM.AsString := '';
  edtProdutoFornecedor.AsString := '';

end;

procedure TFrmEntradaNFe.LocalizaDocto;
var
  vDocto : String;
begin
   if  (Trim(TiraChars( mskCNPJ.Text )) = '') and (Trim(GClienteNovo) = '') and (EditFornecedor.Text = EmptyStr) then
    Exit;

  vDocto := mskCNPJ.Text;

  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add('Select CodFornecedor ');
  qryAux.Sql.Add('From Fornecedores ' );
 // if GClienteNovo <> '' then
   // qryAux.Sql.Add('Where CodFornecedor = ' + QuotedStr(GClienteNovo)  )
  if EditFornecedor.Text <> EmptyStr then
    qryAux.Sql.Add('Where CodFornecedor = ' + VarToStr(EditFornecedor.bs_KeyValue) )
  else if (Trim(TiraChars( mskCNPJ.Text )) <> '') then
    qryAux.Sql.Add('Where CNPJ_CIC = ' + QuotedStr(mskCNPJ.Text)  );
  qryAux.Open;


  EdiFornecedor.AsInteger := qryAux.FieldByName('CodFornecedor').AsInteger;
  EditFornecedor.SetValue('Fornecedores.CodFornecedor = ' + QuotedStr(qryAux.FieldByName('CodFornecedor').AsString));
  GCodFornecedor := VarToStr(EditFornecedor.bs_KeyValue);
  GRegimeTrib := Tab.SeekGet('FORNECEDORES','CodFornecedor',[EdiFornecedor.Text],'RegimeICMS',False);
  dmBaseProduto.FazSQL_CSTpeloRegime(GRegimeTrib);
{

  EdiProduto.bs_Join := EdiProduto.bs_Join +
    ' Left Outer Join Fornecedor_Produto fp on fp.CodProdInterno = p.CodProdInterno ' +
    ' and fp.CodFornecedor = ' + QuotedStr(VarToStr(EditFornecedor.bs_KeyValue));
 }
//  LimpaCampos;

  GClienteNovo  := '';
  IncAutomatico := False;

  if not qryAux.IsEmpty then
  begin

    if Trim(EditFornecedor.bs_KeyValues[8]) = EmptyStr  then
    begin
      Mens_MensErro('UF do Fornecedor não cadastrada no Sistema !');
      btnEditarCliente.Click;
      Exit;
    end;

    PreencheEnderecoFornecedor;

   // EdiCodTipoCli.AsInteger := cmbTipoCliente.EditValue;

  end
  else
  begin
    if Mens_MensConf('Fornecedor não cadastrado. Deseja cadastrar agora ? ') <> mrOk then
      Exit;

    IncAutomatico := True;
    FrmCadFornecedor := TFrmCadFornecedor.Create(Self);
    FrmCadFornecedor.ButNovoClick(Self);
    FrmCadFornecedor.MEdiCGC.Text := vDocto;
   // FrmCadFornecedor.IncCliente := True;
    FrmCadFornecedor.Show;

  end;

end;

procedure TFrmEntradaNFe.ButNovoItemClick(Sender: TObject);
begin
 inherited;
 if (EditFornecedor.Text = EmptyStr) then
 begin
    Mens_MensInf('É necessário informar o Fornecedor !') ;
    EditFornecedor.SetFocus ;
    Exit ;
 end;

 if ((Trim(EdiSituacao.AsString) <> 'Pendente') and (Trim(EdiSituacao.AsString) <> 'Expedicao OK')) then
 begin
    Mens_MensInf('Não é permitido alteração em nota fiscal com situação: ' +
    Trim(EdiSituacao.AsString) + '.');
  Exit;
 end;

 ButItensOnOff('FFFTTFFF');
 Var_OperacaoItem := 1;
 LimpaTelaItem;

 Inc(ContaItem);

 Page.ActivePage := tbsEdit;
 EdiProduto.SetFocus;
end;

procedure TFrmEntradaNFe.ButItensOnOff(S: String);
begin
 ButNovoItem.Enabled := False; //Copy(S, 1, 1) = 'T' = True;
 ButAlterarItem.Enabled := Copy(S, 2, 1) = 'T' = True;
 ButExcluirItem.Enabled := False; //Copy(S, 3, 1) = 'T' = True;
 ButSalvarItem.Enabled := Copy(S, 4, 1) = 'T' = True;
 ButCAncelarItem.Enabled := Copy(S, 5, 1) = 'T' = True;

 cxgTotal.Visible := not ButSalvarItem.Enabled;

 ButNovoItemVcto.Enabled := Copy(S, 1, 1) = 'T';
 ButAlterarItemVcto.Enabled := Copy(S, 2, 1) = 'T';
 ButExcluirItemVcto.Enabled := Copy(S, 3, 1) = 'T';
 ButSalvarItemVcto.Enabled := Copy(S, 4, 1) = 'T';
 ButCancelarItemVcto.Enabled := Copy(S, 5, 1) = 'T';
 //ButGerarVecto.Enabled := Not(Copy(S, 4, 1) = 'T');
end;

procedure TFrmEntradaNFe.ButAlterarItemClick(Sender: TObject);
begin
 inherited;
 if (EditFornecedor.Text = EmptyStr) then
 begin
    Mens_MensInf('É necessário informar o Fornecedor !') ;
    EditFornecedor.SetFocus ;
    Exit ;
 end;

 if ((Trim(EdiSituacao.AsString) <> 'Pendente') and (Trim(EdiSituacao.AsString) <> 'Expedicao OK')) then
 begin
    Mens_MensInf('Não é permitido alteração em nota fiscal com situação: ' +
    Trim(EdiSituacao.AsString) + '.');
  Exit;
 end;


 ButItensOnOff('FFFTTFFF');
 Var_OperacaoItem := 2;

 EdiNatureza.AsString := dmBaseDocFiscal.cdsNFEItemEntradaI_CFOP.AsString;
 EdiProduto.SetValue('P.CodProdInterno = ' + QuotedStr(dmBaseDocFiscal.cdsNFEItemEntradaCodProduto.AsString));
 ProdutoSetaValores;


 EdiCreditoPorc.AsDouble  := 0;
 EdiCreditoBR.AsDouble    := 0;
// memDetalhe.Text          := dmBaseDocFiscal.cdsItemOrcamentoDetalhe.AsString;
 EdiQtde.AsDouble         := dmBaseDocFiscal.cdsNFEItemEntradaQtde.AsFloat;
 //EdiDesconto.AsDouble     := dmBaseDocFiscal.cdsNFEItemValorDesconto.AsFloat;
 EdiValor.AsDouble        := dmBaseDocFiscal.cdsNFEItemEntradaValorUnitario.AsFloat;
 //EdiPorc.AsDouble         := dmBaseDocFiscal.cdsNFEItemPorcDesconto.AsFloat;
 EdiPorcICMS.AsDouble     := dmBaseDocFiscal.cdsNFEItemEntradaPorcICMS.AsFloat;
 EdiPorcIPI.AsDouble      := dmBaseDocFiscal.cdsNFEItemEntradaPorcIPI.AsFloat;
 EdiPorcPIS.AsDouble      := dmBaseDocFiscal.cdsNFEItemEntradaPorcPIS.AsFloat;
 EdiPorcCOFINS.AsDouble   := dmBaseDocFiscal.cdsNFEItemEntradaPorcCOFINS.AsFloat;
 //EdiDesconto.AsDouble     := dmBaseDocFiscal.cdsNFEItemValorDesconto.AsFloat;

 Edi_IVA.AsDouble         := dmBaseDocFiscal.cdsNFEItemEntradaNF_IVA_ST.AsFloat;
 EdiIVA_Orig.AsDouble     := dmBaseDocFiscal.cdsNFEItemEntradaIVA_Original.AsFloat;

 EdiCreditoPorc.AsDouble  := dmBaseDocFiscal.cdsNFEItemEntradaPorcCredito.AsFloat;
 EdiCreditoBR.AsDouble    := dmBaseDocFiscal.cdsNFEItemEntradaVlrCredito.AsFloat;

 EdiTipoICMS.AsString     := dmBaseDocFiscal.cdsNFEItemEntradaNF_TipoICMS.AsString;
 EditTipoIPI.AsString     := dmBaseDocFiscal.cdsNFEItemEntradaNF_TipoIPI.AsString;
 EditTipoPIS.AsString     := dmBaseDocFiscal.cdsNFEItemEntradaNF_TipoPIS.AsString;
 editTipoCofins.AsString  := dmBaseDocFiscal.cdsNFEItemEntradaNF_TipoCofins.AsString;

 chkGARE.Checked := dmBaseDocFiscal.cdsNFEItemEntradaGare.AsString = 'S';

 editDigBaseICMSST.AsDouble := 0;
 editDigValorICMSST.AsDouble := 0;
 if chkGARE.Checked Then
 begin
    editDigBaseICMSST.AsDouble := dmBaseDocFiscal.cdsNFEItemEntradaBaseICMSST.AsFloat;
    editDigValorICMSST.AsDouble := dmBaseDocFiscal.cdsNFEItemEntradaValorICMS_ST.AsFloat;
 end;

 ProdutoST(dmBaseDocFiscal.cdsNFEItemEntradaCodProduto.AsString, EditFornecedor.bs_KeyValues[8] );
 CalcValor;

 qryAux.Close;
 qryAux.SQL.Text := ' Select CodProdutoFornecedor From Fornecedor_Produto ' +
                    ' Where CodFornecedor = ' + QuotedStr(VarToStr(EditFornecedor.bs_KeyValue)) +
                    ' and CodProdInterno = ' + QuotedStr(VarToStr(EdiProduto.bs_KeyValue));
 qryAux.Open;
 edtProdutoFornecedor.AsString := qryAux.FieldByName('CodProdutoFornecedor').AsString;

 Page.ActivePage := tbsEdit;
 EdiQtde.SetFocus;

end;

procedure TFrmEntradaNFe.ButExcluirItemClick(Sender: TObject);
begin
 inherited;
 Var_OperacaoItem := 0;
 If Mens_MensConf('Confirma Exclusão do Item Selecionado ? ') <> mrOk then
  Exit;

 qryAux.Close;
 qryAux.SQL.Clear;
 qryAux.SQL.Add('Delete From NFe_Itens where ChaveSeq = ' + dmBaseDocFiscal.cdsNFEItemEntradaChaveSeq.AsString);
 try
  qryAux.ExecSQL;
 Except
  Mens_MensErro('Erro Excluindo Registro !');
 End;
 Salvo := False;
 FiltroItens;
end;

procedure TFrmEntradaNFe.ButSalvarItemClick(Sender: TObject);
Var
 SQLIns: String;
begin
 inherited;

 EdiQtde.ValidateData;
 EdiValor.ValidateData;
 EdiPorcICMS.ValidateData;
 EdiTotal.ValidateData;
 EdiLiquido.ValidateData;
 editDigBaseICMSST.ValidateData;
 editDigValorICMSST.ValidateData;

 if not CheckItem then
  Exit;

 if Trim(EdiProduto.Text) = EmptyStr then
 begin
  Mens_MensInf('Produto Não Informado! ');
  EdiProduto.SetFocus;
  Exit;
 end;

 if EdiQtde.AsDouble = 0 then
 begin
  if Mens_MensConf('Quantidade do Produto Não Informado, Deseja Continuar ? ') <> mrOk then
  begin
    EdiQtde.SetFocus;
    Exit;
  end;
 end;

 if EdiValor.AsDouble = 0 then
 begin
  if Mens_MensConf('Valor do Produto Não Informado, Deseja Continuar ? ') <> mrOk then
  begin
    EdiValor.SetFocus;
    Exit;
  end;
 end;

 if cmbTipoFrete.ItemIndex <> -1 then
 begin
   if EdiFrete.Text = '' then
   begin
     Mens_MensInf('Valor do Frete não informado ! ');
     EdiFrete.SetFocus;
     Exit;
   end;
 end;

 if Var_OperacaoItem = 1 then
 begin

  SQLIns := 'Insert into NFe_Entrada_Itens (NumNf, CodProduto, CodFilial, NumItem, ';
  SQLIns := SQLIns + ' CodNatureza, I_CFOP, CodGrupo,  Qtde, ValorUnitario, ';
  SQLIns := SQLIns + ' ValorTotal, ValorLiquido, PorcICMS, ValorICMS, ';

  if chkGARE.Checked Then
    SQLIns := SQLIns + '  BaseICMS_It, BaseICMSST, ValorICMS_ST, ';

  SQLIns := SQLIns + ' PorcDesconto, ValorDesconto,  Nf_TipoICMS, Nf_TipoIPI, NF_TipoCofins,  NF_TipoPIS   ';
  SQLIns := SQLIns + ' Nf_IVA_ST, IVA_Original, PorcIPI, PorcPIS, PorcCOFINS, ' ;
  SQLIns := SQLIns + ' PorcCredito, VlrCredito, TipoFrete, CodFornecedor, Gare ) ';

  SQLIns := SQLIns + ' Values ( :NumNf, :CodProduto, :CodFilial, :NumItem, ';
  SQLIns := SQLIns + ' :CodNatureza, :I_CFOP, :CodGrupo,  :Qtde, :ValorUnitario, ';
  SQLIns := SQLIns + ' :ValorTotal, :ValorLiquido, :PorcICMS,  :ValorICMS,  ';

  if chkGARE.Checked Then
    SQLIns := SQLIns + '  :BaseICMS_It, :BaseICMSST, :ValorICMS_ST, ';

  SQLIns := SQLIns + ' :PorcDesconto, :ValorDesconto,  :Nf_TipoICMS, :Nf_TipoIPI, :NF_TipoCofins,  :NF_TipoPIS,  ';
  SQLIns := SQLIns + ' :Nf_IVA_ST, :IVA_Original, :PorcIPI, :PorcPIS, :PorcCOFINS, ' ;
  SQLIns := SQLIns + ' :PorcCredito, :VlrCredito, :TipoFrete, :CodFornecedor, :Gare ) ';

  Try
      qryAux.Close;
      qryAux.Sql.Clear;
      qryAux.SQL.Add(SQLIns);
      qryAux.ParamByName('NumNf').AsString         := EdiCodigo.AsString;
      qryAux.ParamByName('CodProduto').AsString    := VarToStr(EdiProduto.bs_KeyValue);
      qryAux.ParamByName('CodFilial').AsString     := EdiCodFilial.AsString;
      qryAux.ParamByName('NumItem').AsString       := LastCodigo('NumItem', 'NFe_Entrada_Itens', 'Where NumNf = ' + QuotedStr(EdiCodigo.AsString) + ' and CodFilial = ' + QuotedStr(EdiCodFilial.AsString));
      qryAux.ParamByName('CodNatureza').AsString   := EdiNatureza.AsString;
      qryAux.ParamByName('I_CFOP').AsString        := EdiNatureza.AsString;
      qryAux.ParamByName('CodGrupo').AsString      := cmbGrupo.KeyValue;
      qryAux.ParamByName('Qtde').asFloat           := EdiQtde.AsDouble;
      qryAux.ParamByName('ValorUnitario').asFloat  := EdiValor.AsDouble;
      qryAux.ParamByName('ValorTotal').asFloat     := EdiTotal.AsDouble;
      qryAux.ParamByName('ValorLiquido').asFloat   := EdiLiquido.AsDouble;
      qryAux.ParamByName('PorcICMS').asFloat       := EdiPorcICMS.AsDouble;
      qryAux.ParamByName('ValorICMS').asFloat      := EdiBaseICMS.AsDouble;

      if chkGARE.Checked Then
      begin
          qryAux.ParamByName('BaseICMS_It').asFloat   := editDigBaseICMSST.AsDouble;
          qryAux.ParamByName('BaseICMSST').asFloat    := editDigBaseICMSST.AsDouble;
          qryAux.ParamByName('ValorICMS_ST').asFloat  := editDigValorICMSST.AsDouble;
      end;

      qryAux.ParamByName('PorcDesconto').asFloat   := 0;
      qryAux.ParamByName('ValorDesconto').asFloat  := 0;

      qryAux.ParamByName('Nf_TipoICMS').AsString   := EdiTipoICMS.AsString;
      qryAux.ParamByName('Nf_TipoIPI').AsString    := EditTipoIPI.AsString;
      qryAux.ParamByName('NF_TipoCofins').AsString   := editTipoCofins.AsString;
      qryAux.ParamByName('NF_TipoPIS').AsString    := EditTipoPIS.AsString;

      qryAux.ParamByName('Nf_IVA_ST').asFloat      := Edi_IVA.AsDouble;
      qryAux.ParamByName('IVA_Original').asFloat   := EdiIVA_Orig.AsDouble;
      qryAux.ParamByName('PorcIPI').asFloat        := EdiPorcIPI.AsDouble;
      qryAux.ParamByName('PorcPIS').asFloat        := EdiPorcPIS.AsDouble;
      qryAux.ParamByName('PorcCOFINS').asFloat     := EdiPorcCOFINS.AsDouble;
      qryAux.ParamByName('PorcCredito').asFloat    := EdiCreditoPorc.AsDouble;
      qryAux.ParamByName('VlrCredito').asFloat     := EdiCreditoBR.AsDouble;

      if cmbTipoFrete.ItemIndex = 0 then
        qryAux.ParamByName('TipoFrete').AsString     := 'C'
      else if cmbTipoFrete.ItemIndex = 1 then
        qryAux.ParamByName('TipoFrete').AsString     := 'F'
      else  qryAux.ParamByName('TipoFrete').AsString := '';

      qryAux.ParamByName('CodFornecedor').asString   := VarToStr(EditFornecedor.bs_KeyValue);

      if chkGARE.Checked then
        qryAux.ParamByName('Gare').AsString          := 'S'
      else  qryAux.ParamByName('Gare').AsString      := 'N';

      qryAux.ExecSQL;

       if (edtProdutoFornecedor.Text <> '') then
       begin
         SQLIns := ' Select CodProdutoFornecedor from Fornecedor_Produto Where ' +
                   ' CodFornecedor = ' + QuotedStr(VarToStr(EditFornecedor.bs_KeyValue)) +
                   ' and CodProdInterno = ' + QuotedStr(VarToStr(EdiProduto.bs_KeyValue));
         qryAux.Close;
         qryAux.Sql.Clear;
         qryAux.SQL.Add(SQLIns);
         qryAux.Open;
         if qryAux.IsEmpty then
         begin
           SQLIns := 'Insert Into Fornecedor_Produto (CodFornecedor, CodProdInterno, CodProdutoFornecedor )';
           SQLIns := SQLIns +  'Values (:CodFornecedor, :CodProdInterno, :CodProdutoFornecedor)';

           qryAux.Close;
           qryAux.Sql.Clear;
           qryAux.SQL.Add(SQLIns);
           qryAux.ParamByName('CodFornecedor').AsString         := VarToStr(EditFornecedor.bs_KeyValue);
           qryAux.ParamByName('CodProdInterno').AsString        := VarToStr(EdiProduto.bs_KeyValue);
           qryAux.ParamByName('CodProdutoFornecedor').AsString  := edtProdutoFornecedor.AsString;
           qryAux.ExecSQL;
         end;

         edtProdutoFornecedor.Clear;

       end;


       Salvo := False;
  Except
      Mens_MensErro('Erro Incluindo Registro !');
  End;
 end
 else if Var_OperacaoItem = 2 then
 begin

  SQLIns := 'Update NFe_Entrada_Itens  ';
  SQLIns := SQLIns + 'Set ';

 // SQLIns := SQLIns + ' CodProduto  = :CodProduto, ';
  SQLIns := SQLIns + 'CodNatureza     = :CodNatureza, ';
  SQLIns := SQLIns + 'I_CFOP          = :I_CFOP, ';
//  SQLIns := SQLIns + 'CodGrupo        = :CodGrupo, ';
 // SQLIns := SQLIns + 'Qtde            = :Qtde, ';
//  SQLIns := SQLIns + 'ValorUnitario   = :ValorUnitario, ';
//  SQLIns := SQLIns + 'ValorTotal      = :ValorTotal, ';
//  SQLIns := SQLIns + 'PorcICMS        = :PorcICMS, ';
 // SQLIns := SQLIns + 'ValorICMS       = :ValorICMS, ';

  if chkGARE.Checked Then
  begin
    SQLIns := SQLIns + 'BaseICMS_It     = :BaseICMS_It, ';
    SQLIns := SQLIns + 'BaseICMSST      = :BaseICMSST, ';
    SQLIns := SQLIns + 'ValorICMS_ST    = :ValorICMS_ST, ';
  end;

//  SQLIns := SQLIns + 'PorcDesconto    = :PorcDesconto, ';
//  SQLIns := SQLIns + 'ValorDesconto   = :ValorDesconto, ';
//  SQLIns := SQLIns + 'ValorLiquido    = :ValorLiquido, ';
//  SQLIns := SQLIns + 'Nf_TipoICMS     = :Nf_TipoICMS, ';
//  SQLIns := SQLIns + 'Nf_TipoIPI      = :Nf_TipoIPI, ';
//  SQLIns := SQLIns + 'NF_TipoCofins     = :NF_TipoCofins, ';
//  SQLIns := SQLIns + 'NF_TipoPIS      = :NF_TipoPIS, ';

//  SQLIns := SQLIns + 'Nf_IVA_ST       = :Nf_IVA_ST, ';
//  SQLIns := SQLIns + 'IVA_Original    = :IVA_Original, ';
//  SQLIns := SQLIns + 'PorcIPI         = :PorcIPI, ';
//  SQLIns := SQLIns + 'PorcPIS         = :PorcPIS, ';
//  SQLIns := SQLIns + 'PorcCOFINS      = :PorcCOFINS, ';
//  SQLIns := SQLIns + 'PorcCredito     = :PorcCredito, ';
//  SQLIns := SQLIns + 'VlrCredito      = :VlrCredito, ';
//  SQLIns := SQLIns + 'TipoFrete       = :TipoFrete, ';
  SQLIns := SQLIns + 'Gare            = :Gare ';

  SQLIns := SQLIns + ' Where ChaveSeq = :ChaveSeq ';

    try
      qryAux.Close;
      qryAux.Sql.Clear;
      qryAux.SQL.Add(SQLIns);

  //    qryAux.ParamByName('CodProduto').AsString   := VarToStr(EdiProduto.bs_KeyValue);
      qryAux.ParamByName('CodNatureza').AsFloat   := EdiNatureza.AsDouble;
      qryAux.ParamByName('I_CFOP').AsString       := EdiNatureza.Text;
 //     qryAux.ParamByName('CodGrupo').AsString     := cmbGrupo.KeyValue;
 //     qryAux.ParamByName('Qtde').AsFloat          := EdiQtde.AsDouble;
 //     qryAux.ParamByName('ValorUnitario').AsFloat := EdiValor.AsDouble;
 //     qryAux.ParamByName('ValorTotal').AsFloat    := EdiQtde.AsDouble * Arredondar( EdiValor.AsDouble, 4);
 //     qryAux.ParamByName('PorcICMS').AsFloat      := EdiPorcICMS.AsDouble;
  //    qryAux.ParamByName('ValorICMS').AsFloat     := EdiBaseICMS.AsDouble;

      if chkGARE.Checked Then
      begin
          qryAux.ParamByName('BaseICMS_It').asFloat   := editDigBaseICMSST.AsDouble;
          qryAux.ParamByName('BaseICMSST').asFloat    := editDigBaseICMSST.AsDouble;
          qryAux.ParamByName('ValorICMS_ST').asFloat  := editDigValorICMSST.AsDouble;
      end;

    //  qryAux.ParamByName('PorcDesconto').AsFloat  := 0;
   //   qryAux.ParamByName('ValorDesconto').AsFloat := 0;
   //   qryAux.ParamByName('ValorLiquido').AsFloat  := EdiLiquido.AsDouble;
   //   qryAux.ParamByName('Nf_TipoICMS').AsString   := EdiTipoICMS.AsString;
    //  qryAux.ParamByName('Nf_TipoIPI').AsString    := EditTipoIPI.AsString;
   //   qryAux.ParamByName('NF_TipoCofins').AsString   := editTipoCofins.AsString;
   //   qryAux.ParamByName('NF_TipoPIS').AsString    := EditTipoPIS.AsString;

   //   qryAux.ParamByName('Nf_IVA_ST').AsFloat     := Edi_IVA.AsDouble;
   //   qryAux.ParamByName('IVA_Original').AsFloat  := EdiIVA_Orig.AsDouble;

   //   qryAux.ParamByName('PorcIPI').AsFloat       := EdiPorcIPI.AsDouble;
  //    qryAux.ParamByName('PorcPIS').AsFloat       := EdiPorcPIS.AsDouble;
  //    qryAux.ParamByName('PorcCOFINS').AsFloat    := EdiPorcCOFINS.AsDouble;
  //    qryAux.ParamByName('PorcCredito').AsFloat   := EdiCreditoPorc.AsDouble;
 //     qryAux.ParamByName('VlrCredito').AsFloat    := EdiCreditoBR.AsDouble;
  //    if cmbTipoFrete.ItemIndex = 0 then
  //      qryAux.ParamByName('TipoFrete').AsString  := 'C'
   //   else if cmbTipoFrete.ItemIndex = 1 then
    //    qryAux.ParamByName('TipoFrete').AsString  := 'F'
  //    else  qryAux.ParamByName('TipoFrete').AsString := '';

      if chkGARE.Checked then
        qryAux.ParamByName('Gare').AsString          := 'S'
      else  qryAux.ParamByName('Gare').AsString      := 'N';

      qryAux.ParamByName('ChaveSeq').AsInteger    := dmBaseDocFiscal.cdsNFEItemEntradaChaveSeq.AsInteger;


      qryAux.ExecSQL;

       if edtProdutoFornecedor.Text <> '' then
       begin

         SQLIns := 'Update Fornecedor_Produto ';
         SQLIns := SQLIns +  ' Set CodProdutoFornecedor = :CodProdutoFornecedor';
         SQLIns := SQLIns +  ' Where  CodFornecedor = :CodFornecedor and ';
         SQLIns := SQLIns +  '       CodProdInterno = :CodProdInterno ';

         qryAux.Close;
         qryAux.Sql.Clear;
         qryAux.SQL.Add(SQLIns);
         qryAux.ParamByName('CodFornecedor').AsString         := VarToStr(EditFornecedor.bs_KeyValue);
         qryAux.ParamByName('CodProdInterno').AsString        := VarToStr(EdiProduto.bs_KeyValue);
         qryAux.ParamByName('CodProdutoFornecedor').AsString  := edtProdutoFornecedor.AsString;
         qryAux.ExecSQL;
         edtProdutoFornecedor.Clear;

       end;

      Salvo := False;
    Except
      Mens_MensErro('Erro Alterado Registro !');
    End;

    qryAux.Close;
    qryAux.SQL.Text := 'Delete from NF_Entrada_Vencimentos Where NumNF = :NumNF  ' +
                        ' and CodFilial = :CodFilial and CodFornecedor = :CodFornecedor ';
    qryAux.Params.ParamByName('NumNF').AsString :=  EdiCodigo.AsString;
    qryAux.Params.ParamByName('CodFilial').AsString :=  EdiCodFilial.AsString;
    qryAux.Params.ParamByName('CodFornecedor').AsString  := VarToStr(EditFornecedor.bs_KeyValue);
    qryAux.ExecSQL;

 end;

 (* -- OK - Erro float
   if Var_OperacaoItem = 1 then
   begin
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.SQL.Add('Insert into NFe_Itens (NumNf, CodProduto, CodFilial, CodNatureza, I_CFOP, CodGrupo, Qtde, ValorUnitario, ValorTotal, ValorLiquido, PorcICMS,  ');
   qryAux.SQL.Add('ValorICMS, PorcDesconto, ValorDesconto, ValorFrete, Nf_TipoICMS, Nf_IVA_ST, IVA_Original, NF_TipoIPI, IPI, ICMS_Inter, CodAliquota ) ');
   qryAux.SQL.Add('values (''' + EdiCodigo.AsString + ''',''' + EdiProduto.AsString + ''', :pCodFilial, :pCodNatureza, :pI_CFOP, :pCodGrupo, :pQtde, :pValor, :pTotal,  :pLiquido, :pPorcICMS, ');
   qryAux.SQL.Add(':pValorICMS, :pPorcDesconto, :pValorDesconto, :pValorFrete, :Nf_TipoICMS, :Nf_IVA_ST, :IVA_Original, :NF_TipoIPI, :IPI, :ICMS_Inter, :CodAliquota )' );
   qryAux.ParamByName('pCodNatureza').AsString  := EdiNatureza.AsString;
   qryAux.ParamByName('pCodFilial').AsString    := EdiCodFilial.AsString;
   qryAux.ParamByName('pCodGrupo').Value        := cmbGrupo.KeyValue;
   qryAux.ParamByName('pI_CFOP').AsString       := EdiCFOP.AsString;

   qryAux.ParamByName('pQtde').AsFloat          := EdiQtde.AsDouble;
   qryAux.ParamByName('pValor').AsFloat         := EdiValor.AsDouble;
   qryAux.ParamByName('pTotal').AsFloat         := EdiTotal.AsDouble;
   qryAux.ParamByName('pPorcICMS').AsFloat      := EdiPorcICMS.AsDouble;
   qryAux.ParamByName('pLiquido').AsFloat       := EdiLiquido.AsDouble;
   qryAux.ParamByName('pValorICMS').AsFloat     := EdiValorICMS.AsDouble;
   qryAux.ParamByName('pPorcDesconto').AsFloat  := EdiPorc.AsDouble;
   qryAux.ParamByName('pValorDesconto').AsFloat := EdiDesconto.AsDouble;
   qryAux.ParamByName('pValorFrete').AsFloat    := EdiVlrFrete.AsDouble;
   qryAux.ParamByName('Nf_TipoICMS').AsString   := EdiTipoICMS.AsString;
   qryAux.ParamByName('Nf_IVA_ST').AsFloat      := Edi_IVA.AsDouble;
   qryAux.ParamByName('IVA_Original').AsFloat   := EdiIVA_Orig.AsDouble;
   qryAux.ParamByName('NF_TipoIPI').AsString    := EdiTipo_IPI.AsString;
   qryAux.ParamByName('IPI').AsFloat            := EdiIPI_V.AsDouble;
   qryAux.ParamByName('ICMS_Inter').AsFloat     := EdiICMS_Inter.AsDouble;
   qryAux.ParamByName('CodAliquota').Value      := EdiCodAliquota.Value;

   //    try
   qryAux.ExecSQL;
   {    Except
   Mens_MensErro('Erro Incluindo Registro !');
   End;
   }
   end
   else if Var_OperacaoItem = 2 then
   begin
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.SQL.Add('Update NFe_Itens set CodProduto = :pCodProduto, CodNatureza = :pCodNatureza, I_CFOP = :pI_CFOP, CodGrupo = :pCodGrupo, Qtde = :pQtde, ');
   qryAux.SQL.Add('ValorUnitario = :pValor, ValorTotal = :pTotal, PorcICMS = :pPorcICMS, ValorICMS = :pValorICMS, PorcDesconto = :pPorcDesconto, ');
   qryAux.SQL.Add('ValorDesconto = :pValorDesconto, ValorLiquido = :pLiquido, ValorFrete = :pValorFrete, Nf_TipoICMS = :Nf_TipoICMS, Nf_IVA_ST = :Nf_IVA_ST, ');
   qryAux.SQL.Add(' IVA_Original = :IVA_Original, NF_TipoIPI = :NF_TipoIPI, IPI = :IPI, ICMS_Inter = :ICMS_Inter, CodAliquota = :CodAliquota ');
   qryAux.SQL.Add('where ChaveSeq = :ChaveSeq ' );
   qryAux.ParamByName('ChaveSeq').AsInteger     := qryItemChaveSeq.AsInteger;
   qryAux.ParamByName('pCodProduto').AsString   := EdiProduto.AsString;
   qryAux.ParamByName('pCodNatureza').AsString  := EdiNatureza.AsString;
   qryAux.ParamByName('pI_CFOP').AsString       := EdiCFOP.AsString;
   qryAux.ParamByName('pCodGrupo').Value        := cmbGrupo.KeyValue;

   qryAux.ParamByName('pQtde').AsFloat          := EdiQtde.AsDouble;
   qryAux.ParamByName('pValor').AsFloat         := EdiValor.AsDouble;
   qryAux.ParamByName('pTotal').AsFloat         := EdiTotal.AsDouble;
   qryAux.ParamByName('pPorcICMS').AsFloat      := EdiPorcICMS.AsDouble;
   qryAux.ParamByName('pLiquido').AsFloat       := EdiLiquido.AsDouble;
   qryAux.ParamByName('pValorICMS').AsFloat     := EdiValorICMS.AsDouble;
   qryAux.ParamByName('pPorcDesconto').AsFloat  := EdiPorc.AsDouble;
   qryAux.ParamByName('pValorDesconto').AsFloat := EdiDesconto.AsDouble;
   qryAux.ParamByName('pValorFrete').AsFloat    := EdiVlrFrete.AsDouble;
   qryAux.ParamByName('Nf_TipoICMS').AsString   := EdiTipoICMS.AsString;
   qryAux.ParamByName('Nf_IVA_ST').AsFloat      := Edi_IVA.AsDouble;
   qryAux.ParamByName('IVA_Original').AsFloat   := EdiIVA_Orig.AsDouble;
   qryAux.ParamByName('NF_TipoIPI').AsString    := EdiTipo_IPI.AsString;
   qryAux.ParamByName('IPI').AsFloat            := EdiIPI_V.AsDouble;
   qryAux.ParamByName('ICMS_Inter').AsFloat     := EdiICMS_Inter.AsDouble;
   qryAux.ParamByName('CodAliquota').Value      := EdiCodAliquota.Value;

   //    try
   qryAux.ExecSQL;
   {    Except
   Mens_MensErro('Erro Alterando Registro !');
   End;
   }
   end;

 *)
 FiltroItens;
 ButItensOnOff('TTTFFTTT');
 Var_OperacaoItem := 0;
 Page.ActivePage := tbsGrade;

end;

procedure TFrmEntradaNFe.ButCAncelarItemClick(Sender: TObject);
begin
 inherited;
 Dec(ContaItem);
 FiltroItens;
 ButItensOnOff('TTTFFTTT');
 Var_OperacaoItem := 0;
 Page.ActivePage := tbsGrade;
end;

procedure TFrmEntradaNFe.Search;
Var
 sqlRelacionar : TSQLQuery;
begin
 inherited;

 // grpItens.Visible     := not FormOpeErro;
  IncAutomatico := False;
 if VarOperacao <> OPE_INCLUSAO then
  ButSalvar.Visible := (not FormOpeErro) and ((EdiSituacao.AsString = 'Pendente') or (EdiSituacao.AsString = 'Aprovada') or ( EdiSituacao.AsString = 'Expedicao OK' ));

 if not FormOpeErro then
 begin
  Salvo := True;
  PageGeral.ActivePage := tabItens;
  Page.ActivePage := tbsGrade;
  PageControl2.ActivePage := tbsGradeVcto;
  ButItensOnOff('TTTFFTTT');

 // CbxUF.ItemIndex := CbxUF.Items.IndexOf(EdiUF.Text);
  EditFornecedor.SetValue('Fornecedores.CodFornecedor = ' + QuotedStr(EdiFornecedor.AsString));
  PreencheEnderecoFornecedor;

  cxdEmissao.Text := EdiEmissao.AsString;
  cxdSaida.Text   := EdiSaida.AsString;
  if cxdSaida.Date < cxdEmissao.Date then
    cxdSaida.Date := cxdEmissao.Date;

  AtualizaEndereco(VarToStr(EditFornecedor.bs_KeyValue));

//  Application.ProcessMessages;
  cmbEndereco.KeyValue := EdiEntrega.AsString;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('Select Observacao, NFECodTipoCli, Situacao_NFE From NFe_Entrada Where NumNF = ''' +
    EdiCodigo.AsString + ''' and CodFilial = ' +
    QuotedStr(EdiCodFilial.AsString));
  qryAux.Open;
  memObservacao.Clear;
  memObservacao.Lines.Text := qryAux.FieldByName('Observacao').Value;

  qryAux.Close;
  FiltroItens(True);

  sqlRelacionar := TSQLQuery.Create(Nil);
  Try
     sqlRelacionar.SQLConnection := DB_Conect.SQLConnection;
     sqlRelacionar.Close;
     sqlRelacionar.SQL.Clear;
     sqlRelacionar.SQL.Add(' Select i.ChaveSeq ');
     sqlRelacionar.SQL.Add(' From NFe_Entrada_Itens i Inner Join NFe_Entrada n on n.NumNF = i.NumNF and  n.CodFilial = i.CodFilial ');
     sqlRelacionar.SQL.Add(' Left join Fornecedor_Produto f on i.CodProduto = f.CodProdInterno ');
     sqlRelacionar.SQL.Add(' Where n.NumNF = :NumNF ');
     sqlRelacionar.SQL.Add(' and n.CodFilial = :CodFilial ');
     sqlRelacionar.SQL.Add(' and n.CodFornecedor = :CodFornecedor ');
     sqlRelacionar.SQL.Add(' and f.CodProdInterno is null ');
     sqlRelacionar.ParamByName('NumNF').AsString     := EdiCodigo.AsString;
     sqlRelacionar.ParamByName('CodFilial').AsString := EdiCodFilial.AsString;
     sqlRelacionar.ParamByName('CodFornecedor').AsString := EdiFornecedor.AsString;

     sqlRelacionar.Open;
     if not sqlRelacionar.IsEmpty then
     begin
        Mens_MensInf('Necessário Relacionar os Itens da Nota Fiscal com o Código Interno.');
        ButCancelarClick(Nil);
        Exit;
     end;
  Finally
     FreeAndNil(sqlRelacionar);
  End;


  dmBaseDocFiscal.NFE_EntradaFiltroItensVcto(EdiCodigo.Text, EdiCodFilial.Text, EdiFornecedor.Text);
  EdiCreditoPorc.AsDouble  := 0;
  EdiCreditoBR.AsDouble    := 0;

 end;
end;


procedure TFrmEntradaNFe.PreencheEnderecoFornecedor;
begin
  if EditFornecedor.bs_KeyValues.Count > 0 then
  begin
    mskCNPJ.Text            := EditFornecedor.bs_KeyValues[1];
    ediIE.AsString          := EditFornecedor.bs_KeyValues[2];
    EdiFornecedor.AsInteger := EditFornecedor.bs_KeyValue;
    EdiEnd.AsString         := EditFornecedor.bs_KeyValues[3];
    EdiNum.AsString         := EditFornecedor.bs_KeyValues[4];
    EdiCidade.AsString      := EditFornecedor.bs_KeyValues[6];
    EdiBairro.AsString      := EditFornecedor.bs_KeyValues[7];
    EdiComplemento.AsString := EditFornecedor.bs_KeyValues[10];
    mskCep.Text             := EditFornecedor.bs_KeyValues[9];
    CbUF.ItemIndex         := CbUF.Properties.Items.IndexOf(EditFornecedor.bs_KeyValues[8]);
    lblUF.Caption           := EditFornecedor.bs_KeyValues[8];
  end;
end;

procedure TFrmEntradaNFe.spbLimpaCNPJClick(Sender: TObject);
begin
  inherited;
  EdiFornecedor.Clear;
  EditFornecedor.Text := EmptyStr;
  EditFornecedor.bs_KeyValues.Clear;
  mskCNPJ.Clear;
  mskCNPJ.Properties.EditMask := '##\.###\.###\/####\-##;0;_';
  lblTipo.Caption := 'CNPJ';
end;

procedure TFrmEntradaNFe.ButSairClick(Sender: TObject);
begin

  if ( Not Salvo ) and ((VarOperacao = OPE_INCLUSAO) or (VarOperacao = OPE_ALTERACAO))  then
  begin
    if Mens_MensConf('Existe alterações que ainda não foram salvas. Deseja Salvar Agora ? ') = mrOk then
    begin
      Silencioso := True;
      ButSalvarClick(Self);
    end;

    Exit;
  end;

  inherited;
end;

procedure TFrmEntradaNFe.ButSalvarClick(Sender: TObject);
Var
 Tot, PesoLiq, TQtde: Double;
 NumNF, Filial, Especie, CodFornecedor, sQtde, Observacao, CentroEst: String;
 Inclusao: Boolean;
 lItem : Integer;
 SQL : String;
 I : Integer;
begin
 { if page.ActivePage = tbsEdit then
   begin
   Mens_MensInf('Atenção. Salve Primeiro os Itens Da Nota Fiscal !');
   Exit;
   end;
 }

 if (PageGeral.ActivePage = tabItens) and (Page.ActivePage = tbsEdit) then
 begin
  Mens_MensInf('Atenção. Salve Primeiro os Itens Da Nota Fiscal !');
  Exit;
 end
 else if (PageGeral.ActivePage = tabVenctos) and
   (PageControl2.ActivePage = tbsEdicaoVcto) then
 begin
  Mens_MensInf('Atenção. Salve Primeiro os Vencimentos Da Nota Fiscal !');
  Exit;
 end;

 if ((not dmBaseDocFiscal.cdsNFEItemEntrada.Active) or (dmBaseDocFiscal.cdsNFEItemEntrada.RecordCount = 0)) then
 begin
  if Mens_MensConf('Não é Possivel Salvar a Nota Fiscal Sem Item, Deseja Incluir ?') <>
    mrOk then
   Exit
  else
   ButNovoItemClick(Self);

  Exit;
 end;

 if not ValidaItens(lItem) then
 begin
   Mens_MensErro('CFOP pendente. Verifique o Item ' + IntToStr(lItem) + ' da Nota Fiscal! ');
   Exit;
 end;

 NumNF := EdiCodigo.AsString;
 Filial := EdiCodFilial.AsString;
 CodFornecedor := EdiFornecedor.AsString;

 NumNFInsereCP := EdiCodigo.AsString;
 PedidoIsereCP := EdiCodPedido.AsString;

 Inclusao := VarOperacao = OPE_INCLUSAO;

// EdiFornecedor.ValidateData;

 Observacao    := memObservacao.Lines.Text;


 inherited;

 if Not FormOpeErro then
 begin
  {
  if not dmBaseDocFiscal.cdsNFEItemEntrada.IsEmpty then
  begin
   i := 0;
   dmBaseDocFiscal.cdsNFEItemEntrada.First;
   while not dmBaseDocFiscal.cdsNFEItemEntrada.Eof  do
   begin

     SQL := 'Update NFe_Entrada_Itens ';
     SQL := SQL + ' Set ValorFrete       = :VlrFrete,';
     SQL := SQL + ' VlrOutrasDespesas    = :VlrOutrasDespesas, ';
     SQL := SQL + ' VlrSeguro            = :VlrSeguro, ';
     SQL := SQL + ' ValorICMS            = :ValorICMS, ';
     SQL := SQL + ' ValorPIS             = :ValorPIS, ';
     SQL := SQL + ' ValorCofins          = :ValorCofins, ';
     SQL := SQL + ' ValorIPI             = :ValorIPI, ';
     SQL := SQL + ' BaseICMS             = :BaseICMS,   ';
     if dmBaseDocFiscal.cdsNFEItemEntradaGare.AsString = 'N' then
     begin
       SQL := SQL + ' ValorICMS_ST         = :ValorICMS_ST, ';
       SQL := SQL + ' BaseICMSST           = :BaseICMSST, ';
       SQL := SQL + ' BaseICMS_It          = :BaseICMS_It, ';
     end;

     SQL := SQL + ' BaseIPI              = :BaseIPI,    ';
     SQL := SQL + ' BasePIS              = :BasePIS,    ';
     SQL := SQL + ' BaseCOFINS           = :BaseCOFINS, ';
     SQL := SQL + ' PorcProvICMSPartilha = :PorcProvICMSPartilha, ';
     SQL := SQL + ' VlrFCP               = :VlrFCP, ';
     SQL := SQL + ' VlrICMSUFDestino     = :VlrICMSUFDestino, ';
     SQL := SQL + ' VlrICMSUFRemetente   = :VlrICMSUFRemetente, ';
     SQL := SQL + ' AliqFCP              = :AliqFCP, ';
     SQL := SQL + ' DIFAL                = :DIFAL ';
     SQL := SQL + ' where ChaveSeq       = :ChaveSeq ';
     try
        qryAux.Close;
        qryAux.Sql.Clear;
        qryAux.SQL.Add(SQL);
        qryAux.ParamByName('ChaveSeq').AsInteger            := dmBaseDocFiscal.cdsNFEItemEntradaChaveSeq.AsInteger;
        qryAux.ParamByName('VlrFrete').AsFloat              := FNotaFiscal.ItensNF[i].VL_FRETE_PROP;
        qryAux.ParamByName('VlrOutrasDespesas').AsFloat     := FNotaFiscal.ItensNF[i].VL_DESPAC_PROP;
        qryAux.ParamByName('VlrSeguro').AsFloat             := FNotaFiscal.ItensNF[i].VL_SEGUR_PROP;
        qryAux.ParamByName('ValorICMS').AsFloat             := FNotaFiscal.ItensNF[i].VL_ICMS_OP;

        qryAux.ParamByName('ValorPIS').AsFloat              := FNotaFiscal.ItensNF[i].VL_PIS;
        qryAux.ParamByName('ValorCofins').AsFloat           := FNotaFiscal.ItensNF[i].VL_COFINS;
        qryAux.ParamByName('ValorIPI').AsFloat              := FNotaFiscal.ItensNF[i].VL_IPI;
        qryAux.ParamByName('BaseICMS').AsFloat              := FNotaFiscal.ItensNF[i].BC_ICMS_OP;


        if dmBaseDocFiscal.cdsNFEItemEntradaGare.AsString = 'N' Then
        begin
         qryAux.ParamByName('ValorICMS_ST').AsFloat          := FNotaFiscal.ItensNF[i].VL_ICMS_ST;
         qryAux.ParamByName('BaseICMSST').AsFloat            := FNotaFiscal.ItensNF[i].BC_ICMS_ST;
         qryAux.ParamByName('BaseICMS_It').AsFloat           := FNotaFiscal.ItensNF[i].BC_ICMS_ST;
        end;

        qryAux.ParamByName('BaseIPI').AsFloat               := FNotaFiscal.ItensNF[i].BC_IPI;
        qryAux.ParamByName('BasePIS').AsFloat               := FNotaFiscal.ItensNF[i].BC_PIS;
        qryAux.ParamByName('BaseCOFINS').AsFloat            := FNotaFiscal.ItensNF[i].BC_COFINS;
        qryAux.ParamByName('PorcProvICMSPartilha').AsFloat  := FNotaFiscal.ItensNF[i].PorcProvICMS;
        qryAux.ParamByName('VlrFCP').AsFloat                := FNotaFiscal.ItensNF[i].VL_FCP;
        qryAux.ParamByName('VlrICMSUFDestino').AsFloat      := FNotaFiscal.ItensNF[i].VL_ICMS_Dest;
        qryAux.ParamByName('VlrICMSUFRemetente').AsFloat    := FNotaFiscal.ItensNF[i].VL_ICMS_Reme;

        qryAux.ParamByName('AliqFCP').AsFloat               := FNotaFiscal.ItensNF[i].Aliq_FCP;
        qryAux.ParamByName('DIFAL').AsFloat                 := FNotaFiscal.ItensNF[i].VL_DIFAL;

        qryAux.ExecSQL
     Except
        Mens_MensErro('Erro Alterando Registro !');
     End;
     Inc(i);
     dmBaseDocFiscal.cdsNFEItemEntrada.Next;
   end;
  end;
  }

  if (Inclusao) and (Not NFSalva) then
  begin
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add('Update Filial set NumNFeEntrada = NumNFeEntrada + 1 where CodFilial = ' +
     QuotedStr(Filial));
   try
    qryAux.ExecSQL;
   Except
    Mens_MensErro('Erro Alterando Parametro de Nota Fiscal !');
   End;

   NFSalva := True;
  end;


  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('update NFe_Entrada set Observacao = ' + QuotedStr(Observacao));
  qryAux.SQL.Add('where NumNf = :NumNf and CodFilial = :CodFilial and CodFornecedor = :CodFornecedor ');
  qryAux.ParamByName('NumNF').AsString := Trim(NumNF);
  qryAux.ParamByName('CodFilial').AsString := Trim(Filial);
  qryAux.ParamByName('CodFornecedor').AsString := CodFornecedor;
  try
   qryAux.ExecSQL;
  Except
   Mens_MensErro('Erro Finalizando Nota Fiscal !');
  End;
  {
  if (EdiSituacao.AsString = 'Pendente') then
  begin
     //Entrada no Estoque - Compra

    dmBaseDocFiscal.cdsNFEItemEntrada.First;
    dmBaseDocFiscal.cdsNFEItemEntrada.DisableControls;
    while Not dmBaseDocFiscal.cdsNFEItemEntrada.Eof do
    begin

      CentroEst := GParFin.GetCentroEstoque(GFilial);
      GCambio.PaiTipo  := 'E';
      GCambio.Obs      := '<<Nota de Entrada - Compra de Estoque>>';

      if not GCambio.UpdEstoque(dmBaseDocFiscal.cdsNFEItemEntradaCodProduto.AsString,
                                dmBaseDocFiscal.cdsNFEItemEntradaCodGrupo.AsString,
                                GParFin.DtTrab,
                                dmBaseDocFiscal.cdsNFEItemEntradaQtde.AsFloat,
                                'E',
                                CentroEst,
                                GFilial,
                                TP_ESTQ_E_COMPRA,
                                True) then
      begin
        Mens_MensErro('Erro Alterando Posição do Estoque !');
        Exit;
      end;

      dmBaseDocFiscal.cdsNFEItemEntrada.next;
    end;
    dmBaseDocFiscal.cdsNFEItemEntrada.First;
    dmBaseDocFiscal.cdsNFEItemEntrada.DisableControls;
  end;

  //Inserir Titulos a Pagar
  InsereConPag;
  }

  {
  if GeraNFe then
  begin
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add('update Pedidos set  NumNF = :NF ');
   qryAux.SQL.Add('where CodPedido  = :CodPedido and CodFilial = :CodFilial ');
   qryAux.ParamByName('NF').AsString := Trim(NumNF);
   qryAux.ParamByName('CodPedido').AsString := Trim(vCodPedido);
   qryAux.ParamByName('CodFilial').AsString := Trim(vCodFilialOrig);

   try
    qryAux.ExecSQL;
    dmBaseDocFiscal.AlterandoSituacao(Pedido, SituacaoPedido, Trim(vCodPedido), 'Pedido foi Faturado com Sucesso');
   Except
    Mens_MensErro('Erro Finalizando Emissão de Nota Fiscal / Pedido !');
   End;
   GeraNFe := False;
  end;
   }
 end;

 // EdiCodigo.AsString := Trim(NumNf);
 // Search;
end;

procedure TFrmEntradaNFe.ButExcluirClick(Sender: TObject);
Var
 CodForn : String;
 NumNF: String;
 Filial: String;
 FilialPed : String;
 Pedido: String;
 Situacao : string;
 CentroEst : string;
begin

 Situacao  := EdiSituacao.AsString;
 NumNF     := EdiCodigo.AsString;
 Filial    := EdiCodFilial.AsString;
 Pedido    := EdiCodPedido.AsString;
 FilialPed := EdiFilialPed.AsString;
 CodForn   := EdiFornecedor.AsString;

 if (Situacao = 'Cancelada') Then
 begin
   Mens_MensInf('Não é possível excluir uma Nota Fiscal com Status de Cancelada.');
   Exit;
 end;

 if (Situacao = 'Aprovada') Then
 begin
   if  not ( Glob_GetAccess('EXC-ESP-NFEE','') )   then
   begin
       Mens_MensInf('Usuário sem permissão para exclusão de NFE');
       exit;
   end;
 end;

   if (Situacao = 'Aprovada') Then
   begin
      dmBaseDocFiscal.cdsNFEItemEntrada.First;
      while not dmBaseDocFiscal.cdsNFEItemEntrada.Eof do
      begin
       CentroEst         := GParFin.GetCentroEstoque(GFilial);
       GCambio.DocOrigem := NumNF;
       GCambio.PaiTipo   := 'S';
       GCambio.Obs       := '<<03-Cancelamento de Nota de Entrada>>';

       if not GCambio.UpdEstoque(dmBaseDocFiscal.cdsNFEItemEntradaCodProdInterno.AsString,
                                  dmBaseDocFiscal.cdsNFEItemEntradaCodGrupo.AsString,
                                  GParFin.DtTrab,
                                  dmBaseDocFiscal.cdsNFEItemEntradaQtdeAjustada.AsFloat,
                                  'S',
                                  CentroEst,
                                  GFilial,
                                  TP_ESTQ_S_DEVOL_FORNECEDOR,
                                  True) then
       begin
         Mens_MensErro('Erro Alterando Posição do Estoque !');
         GCambio.ExecRollBack;
         Exit;
       end;
       dmBaseDocFiscal.cdsNFEItemEntrada.Next;
      end;
   end;
{
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('Update NFe_Entrada Set Situacao = ''Cancelada'' where NumNF = ''' + NumNF +  ''' and CodFilial = ''' + Filial + ''' and CodFornecedor = ''' + CodForn + '''');
      try
       qryAux.ExecSQL;
      Except
       Mens_MensErro('Erro Alterado Status da Nota Fiscal !');
      End;

      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('Update CONPAG Set Status = ''C'', DataCancelamento = Getdate() WHERE Status = ''A'' and DocOrigem = :DocOrigem and CodFornecedor = :CodFornecedor ');
      qryAux.SQL.Add('and  CodFilial = :CodFilial ');
      qryAux.ParamByName('DocOrigem').AsString := Trim(NumNF);
      qryAux.ParamByName('CodFilial').AsString := Trim(Filial);
      qryAux.ParamByName('CodFornecedor').AsString := Trim(CodForn);

      try
       qryAux.ExecSQL;
      Except
       Mens_MensErro('Erro Alterado Status do Contas a Pagar !');
      End;
   end;

     Mens_MensInf('Nota Fiscal de Entrada foi Cancelada.');

     ButPesquisarClick(Nil);
     ButExcluir.Enabled := not (EdiSituacao.AsString = 'Cancelada');
 end;
   }
//  if (Situacao <> 'Aprovada') Then
//  begin

    inherited;
    // grpItens.Visible := FormOpeErro;

    if not FormOpeErro then
    begin
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('Delete From NFe_Entrada_Itens where NumNF = ''' + NumNF +  ''' and CodFilial = ''' + Filial + ''' and CodFornecedor = ''' + CodForn + '''');
      try
       qryAux.ExecSQL;
      Except
       Mens_MensErro('Erro Excluindo Itens !');
      End;

      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('Delete From NF_Entrada_Vencimentos where NumNF = ''' + NumNF + ''' and CodFilial = ''' + Filial + ''' and CodFornecedor = ''' +  CodForn  + '''');
      try
       qryAux.ExecSQL;
      Except
       Mens_MensErro('Erro Excluindo Vencimentos !');
      End;

      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('Delete FROM CONPAG WHERE Status = ''A'' and DocOrigem = :DocOrigem and CodFornecedor = :CodFornecedor ');
      qryAux.SQL.Add('and  CodFilial = :CodFilial ');
      qryAux.ParamByName('DocOrigem').AsString := Trim(NumNF);
      qryAux.ParamByName('CodFilial').AsString := Trim(Filial);
      qryAux.ParamByName('CodFornecedor').AsString := Trim(CodForn);

      try
       qryAux.ExecSQL;
      Except
       Mens_MensErro('Erro Estornando Contas a Pagar !');
      End;
//    end;

//  end;

    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('Delete From ComposicaoBenefeciado where NumNF = ''' + NumNF + ''' and CodFilial = ''' + Filial + '''');
    try
     qryAux.ExecSQL;
    Except
     Mens_MensErro('Erro Excluindo Composição de Beneficiamento !');
    End;


  // Aprovada ou Pendente excluirá o histórico.


    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('Delete From HistoricoNFeEntradas where NumeroNF = ''' + NumNF + ''' and CodFornecedor = ''' + CodForn + '''');
    try
     qryAux.ExecSQL;
    Except
     Mens_MensErro('Erro Excluindo Historico NFE Entradas !');
    End;

    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('Delete FROM NFE_IMPORTADA WHERE NumNFE = :NumNFE and CNPJ_Origem = :CNPJ_Origem ');
    qryAux.ParamByName('NumNFE').AsString := Trim(NumNF);
    qryAux.ParamByName('CNPJ_Origem').AsString := TiraChars(mskCNPJ.Text);

    try
     qryAux.ExecSQL;
    Except
     Mens_MensErro('Erro Estornando Contas a Pagar !');
    End;

    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('update compras set Situacao = ''Aprovada'' ');
    qryAux.SQL.Add('where CodCompra  = :CodCompra and CodFilial = :CodFilial ');
    qryAux.ParamByName('CodCompra').AsString := Trim(Pedido);
    qryAux.ParamByName('CodFilial').AsString := Trim(FilialPed);
    try
     qryAux.ExecSQL;
    Except
     Mens_MensErro('Erro Estornando Relacioamento do Pedido de Compra !');
    End;

    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('update itenscompras set Recebido = ''N'' ');
    qryAux.SQL.Add('where CodCompra  = :CodCompra and CodFilial = :CodFilial ');
    qryAux.ParamByName('CodCompra').AsString := Trim(Pedido);
    qryAux.ParamByName('CodFilial').AsString := Trim(FilialPed);
    try
     qryAux.ExecSQL;
    Except
     Mens_MensErro('Erro Estornando Status de Recebimento do Pedido de Compra !');
    End;



    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('Select NumNFeEntrada From Filial Where CodFilial = ' +
      QuotedStr(Filial));
    try
     qryAux.Open;
    Except
     Mens_MensErro('Erro Verificando Numero da Nota Fiscal !');
    End;

    if FormatFloat('0000', qryAux.FieldByName('NumNFeEntrada').AsInteger) = NumNF then
    begin
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add('update Filial set NumNFeEntrada = NumNFeEntrada - 1 where CodFilial =  ' + QuotedStr(Filial));
     try
      qryAux.ExecSQL;
     Except
      Mens_MensErro('Erro Alterando Parametro de Nota Fiscal !');
     End;
    end;
    end;

end;

procedure TFrmEntradaNFe.AtualizaEndereco(CodCliente: String);
begin

//  cdsEndereco.Close;
//  qryEndereco.ParamByName('CodCliente').AsString := CodCliente;
 // cdsEndereco.Open;


end;
procedure TFrmEntradaNFe.btnEditarClienteClick(Sender: TObject);
begin
  inherited;
  FrmCadFornecedor := TFrmCadFornecedor.Create(Self);

  FrmCadFornecedor.EdiCodigo.AsString := VarToStr(EditFornecedor.bs_KeyValue);
  FrmCadFornecedor.Search;
  FrmCadFornecedor.VarOperacao := 0;
  IncAutomatico := True;
//  FrmCadFornecedor.PgCPrincipal.ActivePage := FrmClientes.tabEndereco;
  FrmCadFornecedor.ButAlterar.Click;

  FrmCadFornecedor.Show;

end;

procedure TFrmEntradaNFe.btnRecalculaOrcClick(Sender: TObject);
begin
  inherited;
 // if not dmBaseDocFiscal.cdsNFEItemEntrada.IsEmpty then
  //    CarregaTotaisDaNota;
end;

procedure TFrmEntradaNFe.ButAlterarClick(Sender: TObject);
begin
 inherited;
 // grpItens.Visible     := not FormOpeErro;
 //if (EdiSituacao.AsString = 'Pendente') or (EdiSituacao.AsString = 'Expedicao OK') then
 // ButSalvar.Visible    := True
 // else ButSalvar.Visible := False;

end;



procedure TFrmEntradaNFe.ButNovoClick(Sender: TObject);
var
 vSQL: string;
begin
  {
  if not GeraNFe then
  begin

    Try
      if not Assigned(frmSelFinalidade) then
        Application.CreateForm(TfrmSelFinalidade, frmSelFinalidade);

      frmSelFinalidade.ShowModal;

      if frmSelFinalidade.ModalResult = mrOk Then
      begin
        cmbTipoCliente.EditValue := dmBaseDocFiscal.cdsTipoCliCodTipoCli.AsInteger;
        ediCodTipoCli.AsInteger := cmbTipoCliente.EditValue;
        cmbTipoCliente.Enabled   := False;
      end
      else
      begin
        ButCancelarClick(Nil);
        Exit;
      end;
    Finally
       FreeAndNil(frmSelFinalidade);
    End;
  end;
   }

 inherited;
 EdiCodFilial.AsString := GFilial;

//  FNotaFiscal.TipoNota := Entrada;


  //FNotaFiscal.Finalidade := Revenda;
  {
  if FNotaFiscal.Finalidade = Industrializacao then
  begin
      EdiProduto.bs_Filter     := ' g.Tipo = ''V'' and g.CodGrupo = ''302'' and p.Ativo = ''1''';
      EdiProduto_Det.bs_Filter := ' g.Tipo = ''V'' and g.CodGrupo = ''302'' and p.Ativo = ''1''';
  end
  else
  begin
 }     EdiProduto.bs_Filter     := ' g.Tipo = ''V'' and p.Ativo = ''1''';
      EdiProduto_Det.bs_Filter := ' g.Tipo = ''V'' and p.Ativo = ''1''';
 // end;

 ContaItem := 0;

 // EdiCodigo.AsString := FormatFloat('0000', (StrToInt(LastCodigo('NumNFe','Parametros',''))));
 // grpItens.Visible := not FormOpeErro;
 cxdEmissao.Date := Date;
 cxdSaida.Date   := Date;
 EdiNatureza.AsString   := '';
 EdiCodPedido.AsString  := '';
 EdiFilialPed.AsString  := '';
 EdiFornecedor.Clear;
 EditFornecedor.bs_KeyValues.Clear;
 EditFornecedor.Text := EmptyStr;
 EdiQuantidade.AsString := '';
 edtMesmoEndereco.AsString := '';
 EdiMarca.AsString    := '';
 EdiPlaca.AsString    := '';
 EdiEspecie.AsString  := '';
 CbxUF.ItemIndex      := -1;
 memObservacao.Lines.Clear;
 EdiFrete.AsDouble    := 0;
 ediSeguro.AsDouble   := 0;
 EdiOutrasDespesas.AsDouble := 0;
 RadioButton1.Checked := True;

 // memObservacao.Lines.Add('TRANSFERÊNCIA CRÉDITO ICMS R$ ');
 EdiSituacao.AsString := 'Pendente';
 ButSalvar.Visible := True;
 EdiSituacao.ValidateData;
 cdsEndereco.Close;

 EdiCodFilialExit(Self);
 EditFornecedor.SetFocus;

 (* // Elias - 08/01/2017  Compra não pode gerar itens em NFe_Itens (Saida Nf Receita Federeal)
 if GeraNFe then
 begin
  EdiCodFilial.AsString := vCodFilial;
  EdiCodFilialExit(Self);

  EdiCodPedido.AsString := vCodPedido;
  EdiFilialPed.AsString := vCodFilialOrig;
  EdiCodPedido.ValidateData;

  with qryAux do
  begin
   // Busca dados do Pedido
   Close;
   SQL.Clear;
   SQL.Add('Select CodFornecedor, TotalFrete, TotalSeguro, TotalOutrasDespesas,  ChaveEnd, MesmoEndereco, ' +
           ' CodCondPagto, PedCodTipoCli, CodVendedor, Observacao from Compras where CodPedido = ''' + vCodPedido +
           ''' and CodFilial = ''' + vCodFilialOrig + '''');
   Open;

   EdiTotalFrete.AsDouble        := FieldByName('TotalFrete').AsFloat;
   EdiTotalSeguro.AsDouble       := FieldByName('TotalSeguro').AsFloat;
   EdiTotOutrasDespesas.AsDouble := FieldByName('TotalOutrasDespesas').AsFloat;
   EdiFrete.AsDouble             := FieldByName('TotalFrete').AsFloat;
   ediSeguro.AsDouble            := FieldByName('TotalSeguro').AsFloat;
   EdiOutrasDespesas.AsDouble    := FieldByName('TotalOutrasDespesas').AsFloat;
   EdiFornecedor.AsInteger           := FieldByName('CodFornecedor').AsInteger;
   EditFornecedor.SetValue('Fornecedores.CodFornecedor = ' + QuotedStr(EdiFornecedor.AsString));
   PreencheEnderecoFornecedor;

   cmbEndereco.KeyValue := '';
  // if (EditFornecedor.Text <> EmptyStr) then
   //  AtualizaEndereco(VarToStr(EditFornecedor.bs_KeyValue));

   cmbEndereco.KeyValue        := FieldByName('ChaveEnd').AsString;
   edtMesmoEndereco.AsString   := FieldByName('MesmoEndereco').AsString;
   EdiCondPagto.AsString       := FieldByName('CodCondPagto').AsString;
   EdiCondPagto.ValidateData;
   // EdiVendedor.AsString     := FieldByName('CodVendedor').AsString;
   memObservacao.Lines.Add(FieldByName('Observacao').AsString);

   // Insere itens da nota
   vSQL := 'Insert into NFe_Itens (NumNf, NumItem, CodProduto, CodFilial, CodGrupo, Qtde, ValorUnitario, ValorTotal, ValorLiquido,  ';
   vSQL := vSQL + ' PorcICMS, PorcDesconto, ValorDesconto, ValorFrete, Nf_TipoICMS, Nf_IVA_ST, IVA_Original, ICMS_Inter, CodAliquota, I_CFOP, TipoFrete,  ';
   vSQL := vSQL + ' PorcIpi, PorcPis, PorcCofins,  ';
   vSQL := vSQL + ' ValorICMS, ValorICMS_ST, ValorPIS, ValorCofins,  ValorIPI,  ';
   vSQL := vSQL + ' BaseICMS, BaseICMSST, BaseIPI, BasePIS, BaseCOFINS, PorcProvICMSPartilha, VlrFCP, VlrICMSUFDestino, VlrICMSUFRemetente, ';
   vSQL := vSQL + ' TabelaPrecoID,  ValorMinimo,  ValorPraticado,  ValorCompra, ValorUnitarioComIPI) ';

   vSQL := vSQL + 'Select ' + QuotedStr(EdiCodigo.AsString) +
                  ', NumItem, CodProduto, ' + QuotedStr(vCodFilial) +
                  ' , CodGrupo, Qtde, ValorUnitario, ValorTotal, ValorLiquido, ';
   vSQL := vSQL + ' PorcICMS, PorcDesconto, ValorDesconto, VlrFrete, P_TipoICMS, P_IVA_ST, IVA_Original, ICMS_Inter, CodAliquota, CFOP, TipoFrete, ';
   vSQL := vSQL + ' PorcIpi, PorcPis, PorcCofins,  ';
   vSQL := vSQL + ' ValorICMS, ValorICMS_ST, ValorPIS, ValorCofins,  ValorIPI,  ';
   vSQL := vSQL + ' BaseICMS, BaseICMSST, BaseIPI, BasePIS, BaseCOFINS, PorcProvICMSPartilha, VlrFCP, VlrICMSUFDestino, VlrICMSUFRemetente ,';
   vSQL := vSQL + ' TabelaPrecoID,  ValorMinimo,  ValorPraticado,  ValorCompra, ValorUnitarioComIPI) ';

   vSQL := vSQL + 'From ItensPedidos ';
   vSQL := vSQL + 'Where CodPedido = ' + QuotedStr(vCodPedido) +
                  ' and CodFilial = ' + QuotedStr(vCodFilialOrig);


   Close;
   SQL.Clear;
   SQL.Add(vSQL);
   ExecSQL;

   // Cria Vencimentos

   vSQL := 'Insert into NFVencimentos (NumNf, CodFilial, Parcela, TParcela, ValParcela, Vencimento) ';
   vSQL := vSQL + ' Select  ' + QuotedStr(EdiCodigo.AsString) + ', ' + QuotedStr(vCodFilial) + ', Parcela, TParcela, ValParcela, Vencimento ';
   vSQL := vSQL + ' From CPAVencimentos ';
   vSQL := vSQL + ' Where CodPedido = ' + QuotedStr(vCodPedido) + ' and CodFilial =  ' + QuotedStr(vCodFilialOrig);
   Close;
   SQL.Clear;
   SQL.Add(vSQL);
   ExecSQL;

   GetDesc;
   dmBaseDocFiscal.NFE_FiltroItensVcto(EdiCodigo.Text, EdiCodFilial.Text);

   dmBaseDocFiscal.AtualizaEndereco(VarToStr(EditFornecedor.bs_KeyValue));
   PreencheEnderecoEntrega;
   cmbEndereco.KeyValue := EdiEntrega.AsString;

   if (EdiNatOper.Enabled) and (EdiNatOper.Visible) then
    EdiNatOper.SetFocus;

  end;
 end;
 *)

 PageGeral.ActivePage := tabItens;
 FiltroItens;
 EditFornecedor.SetFocus;
end;
                               {

procedure TFrmEntradaNFe.CarregaNota(bMostraTotal: Boolean);
Var
  ItemBD : TItemNF;
  SQL    : String;
begin
  FNotaFiscal.Inicializar;
  FNotaFiscal.TipoNota   := Entrada;
  FNotaFiscal.OrigemNota := OrigemdaNota;

  FNotaFiscal.ValoresNF.VL_FRETE     := EdiFrete.AsDouble;
  FNotaFiscal.ValoresNF.VL_SEGURO    := ediSeguro.AsDouble;
  FNotaFiscal.ValoresNF.VL_DESPACESS := EdiOutrasDespesas.AsDouble;

  FNotaFiscal.EmitenteNF.Estado     := GFilialUF;

  if (EditFornecedor.Text <> '') and (EditFornecedor.bs_KeyValues.Count > 0) then
   FNotaFiscal.DestinatarioNF.Estado := EditFornecedor.bs_KeyValues[8];

  if (EditFornecedor.Text <> '') and (EditFornecedor.bs_KeyValues.Count > 0) then
   FNotaFiscal.DestinatarioNF.ConsumidorFinal := False;

  if (EditFornecedor.Text <> '') and (EditFornecedor.bs_KeyValues.Count > 0) then
    FNotaFiscal.DestinatarioNF.Contribuinte :=  '0';


  if  UpperCase(Copy(cmbFisJur.Text,1,1)) = 'F' then
    FNotaFiscal.DestinatarioNF.TipoPessoa      := Fisica
  else if UpperCase(Copy(cmbFisJur.Text,1,1)) = 'J' then
   FNotaFiscal.DestinatarioNF.TipoPessoa      := Juridica;

  FNotaFiscal.Finalidade := Revenda;

  ItemBD := TItemNF.Create(FNotaFiscal);
  Try
     dmBaseDocFiscal.cdsNFEItemEntrada.First;
     while not dmBaseDocFiscal.cdsNFEItemEntrada.Eof do
     begin
       ItemBD.Inicializar;

       if (cmbTipoFrete.ItemIndex = -1) Then
       Begin
          if dmBaseDocFiscal.cdsNfeitemEntradaTipoFrete.asString = 'C' then
            cmbTipoFrete.ItemIndex := 0
          else if dmBaseDocFiscal.cdsNfeitemEntradaTipoFrete.asString = 'F' then
                cmbTipoFrete.ItemIndex := 1
          else  cmbTipoFrete.ItemIndex := -1;
       end;

       if cmbTipoFrete.ItemIndex = 0 Then
          ItemBD.TipoFrete := CIF
       else if cmbTipoFrete.ItemIndex = 1 then
          ItemBD.TipoFrete := FOB;

     //  ItemBD.Impostos.CSTICMS_Especial   := dmBaseDocFiscal.cdsItemOrcamentoOrc_TipoICMS.AsString;
       ItemBD.Impostos.EstadoEmitente     := FNotaFiscal.EmitenteNF.Estado;
       ItemBD.Impostos.EstadoDestinatario := FNotaFiscal.DestinatarioNF.Estado;
       ItemBD.Impostos.ProdutoST.TipoNota := FNotaFiscal.TipoNota;
       if Var_OperacaoItem = 1 then
        ItemBD.Item := ContaItem
       else
       begin
        ContaItem    := dmBaseDocFiscal.cdsNFEItemEntradaChaveSeq.AsInteger;
        ItemBD.Item := ContaItem;
       end;


       ItemBD.Impostos.Regime             := GRegimeTrib;
       ItemBD.Impostos.CodProdInterno     := dmBaseDocFiscal.cdsNFEItemEntradaCodProduto.AsString;
       ItemBD.Impostos.AliqMVA            := dmBaseDocFiscal.cdsNFEItemEntradaNF_IVA_ST.AsFloat;
       ItemBD.CFOP;
       ItemBD.Impostos.RetornaMVA;

       if FNotaFiscal.TipoNota in [Entrada, DevolucaoCliente] then
       begin
         ItemBD.AliqIPI                     := dmBaseDocFiscal.cdsNFEItemEntradaPorcIPI.AsFloat;
         ItemBD.AliqMVA                     := dmBaseDocFiscal.cdsNFEItemEntradaNF_IVA_ST.AsFloat;
         ItemBD.Impostos.aliqIPI            :=  dmBaseDocFiscal.cdsNFEItemEntradaPorcIPI.AsFloat;
         ItemBD.Impostos.CSTIPI             := dmBaseDocFiscal.cdsNFEItemEntradaNF_TipoIPI.AsString;
         ItemBD.Impostos.CSTICMS            := dmBaseDocFiscal.cdsNFEItemEntradaNF_TipoICMS.AsString;
         ItemBD.Impostos.CSTCofins          := dmBaseDocFiscal.cdsnfeitementradaNF_TipoCofins.AsString;
         ItemBD.Impostos.CSTPIS             := dmBaseDocFiscal.cdsNFEItemEntradaNF_TipoPIS.AsString;
       end;

       ItemBD.CodProduto                  := dmBaseDocFiscal.cdsNFEItemEntradaCodProduto.AsString;
       ItemBD.DescProduto                 := dmBaseDocFiscal.cdsNFEItemEntradaDescProduto.AsString;
       ItemBD.Quantidade                  := dmBaseDocFiscal.cdsNFEItemEntradaQtde.AsFloat;
       ItemBD.ValorUnitario               := dmBaseDocFiscal.cdsNFEItemEntradaValorUnitario.AsFloat;
       ItemBD.Peso                        := dmBaseDocFiscal.cdsNFEItemEntradaQtde.AsFloat;
       ItemBD.ValorDesconto               := dmBaseDocFiscal.cdsNFEItemEntradaValorDesconto.AsFloat;
       ItemBD.ReducaoICMS                 := 0;
       ItemBD.ValorFrete                  := dmBaseDocFiscal.cdsNFEItemEntradaValorFrete.AsFloat;


       FNotaFiscal.ItensNF.Add(FNotaFiscal, ItemBD);
       dmBaseDocFiscal.cdsNFEItemEntrada.Next;
     end;

     if not FNotaFiscal.DestinatarioNF.ConsumidorFinal Then
     begin
        ediAliTotIPI.AsDouble   := ItemBD.Impostos.aliqIPI;
        EdiBaseIPI.AsDouble     := FNotaFiscal.ValoresNF.BS_IPI;
        ediValTotIPI.AsDouble   := FNotaFiscal.ValoresNF.VL_IPI;
     end
     else
     begin
        ediAliTotIPI.AsDouble   := 0.00;
        EdiBaseIPI.AsDouble     := 0.00;
        ediValTotIPI.AsDouble   := 0.00;
     end;

     ediAliTotPIS.Value       := ItemBD.Impostos.AliqPIS;
     ediAliTotCOFINS.Value    := ItemBD.Impostos.AliqCofins;

     if bMostraTotal then
     begin
        EdiBaseICMS.AsDouble     := FNotaFiscal.ValoresNF.BS_ICMS;
        EdiTotICMS.AsDouble      := FNotaFiscal.ValoresNF.VL_ICMS;
        EdiBaseICMS_ST.AsDouble  := FNotaFiscal.ValoresNF.BS_ICMS_ST;
        EdiBasePIS.AsDouble      := FNotaFiscal.ValoresNF.BS_PIS;
        EdiBaseCOFINS.AsDouble   := FNotaFiscal.ValoresNF.BS_COFINS;
        EdiValorIMCS_ST.AsDouble := FNotaFiscal.ValoresNF.VL_ICMS_ST;
        EdiTotProd.AsDouble      := FNotaFiscal.ValoresNF.VL_TOTAL_PROD;
        EdiTotalFrete.AsDouble   := FNotaFiscal.ValoresNF.VL_FRETE;
        ediValTotPIS.Value       := FNotaFiscal.ValoresNF.VL_PIS;
        ediValTotCOFINS.Value    := FNotaFiscal.ValoresNF.VL_COFINS;
        TotalDesconto.AsDouble   := FNotaFiscal.ValoresNF.VL_DESCONTO;
        EdiTotalSeguro.AsDouble  := FNotaFiscal.ValoresNF.VL_SEGURO;
        EdiTotalNF.AsDouble      := FNotaFiscal.ValoresNF.VL_TOTAL_NF;
     end;

  Finally
     FreeAndNil(ItemBD);
  End;
end;

}
procedure TFrmEntradaNFe.CarregaTotaisDaNota;
Var
  SQL    : String;
begin
     dmBaseDocFiscal.cdsNFEItemEntrada.First;
     while not dmBaseDocFiscal.cdsNFEItemEntrada.Eof do
     begin

      EdiBaseIPI.AsDouble      := EdiBaseIPI.AsDouble  +  dmBaseDocFiscal.cdsNFEItemEntradaBaseIPI.AsFloat;
      ediValTotIPI.AsDouble    := ediValTotIPI.AsDouble + dmBaseDocFiscal.cdsNFEItemEntradaValorIPI.AsFloat;
      EdiBaseICMS.AsDouble     := EdiBaseICMS.AsDouble + dmBaseDocFiscal.cdsNFEItemEntradaBaseICMS.AsFloat;
      EdiTotICMS.AsDouble      := EdiTotICMS.AsDouble + dmBaseDocFiscal.cdsNFEItemEntradaValorICMS.AsFloat;
      EdiBaseICMS_ST.AsDouble  := EdiBaseICMS_ST.AsDouble + dmBaseDocFiscal.cdsNFEItemEntradaBaseICMSST.AsFloat;
      EdiValorIMCS_ST.AsDouble := EdiValorIMCS_ST.AsDouble + dmBaseDocFiscal.cdsNFEItemEntradaValorICMS_ST.AsFloat;
      EdiBasePIS.AsDouble      := EdiBasePIS.AsDouble + dmBaseDocFiscal.cdsNFEItemEntradaBasePIS.AsFloat;
      EdiBaseCOFINS.AsDouble   := EdiBaseCOFINS.AsDouble + dmBaseDocFiscal.cdsNFEItemEntradaBaseCOFINS.AsFloat;
      EdiTotProd.AsDouble      := EdiTotProd.AsDouble + dmBaseDocFiscal.cdsNFEItemEntradaValorTotal.AsFloat;
      EdiTotalFrete.AsDouble   := EdiTotalFrete.AsDouble + dmBaseDocFiscal.cdsNFEItemEntradaValorFrete.AsFloat;
      ediValTotPIS.Value       := ediValTotPIS.Value  + dmBaseDocFiscal.cdsNFEItemEntradaValorPIS.AsFloat;
      ediValTotCOFINS.Value    := ediValTotCOFINS.Value + dmBaseDocFiscal.cdsNFEItemEntradaValorCofins.AsFloat;
      TotalDesconto.AsDouble   := TotalDesconto.AsDouble + dmBaseDocFiscal.cdsNFEItemEntradaValorDesconto.AsFloat;
      EdiTotalSeguro.AsDouble  := EdiTotalSeguro.AsDouble + dmBaseDocFiscal.cdsNFEItemEntradaVlrSeguro.AsFloat;
      EdiTotalNF.AsDouble      := EdiTotalNF.AsDouble + dmBaseDocFiscal.cdsNFEItemEntradaValorTotal.AsFloat;

      dmBaseDocFiscal.cdsNFEItemEntrada.Next;
     end;


end;

procedure TFrmEntradaNFe.ProdutoST(CodProduto, UF: String);
begin
  if Trim(CodProduto) = '' then
    Exit;

  if Trim(UF) = '' then
    Exit;

  EdiPorcICMS.Value            := dmBaseDocFiscal.cdsNFEItemEntradaICMS_Inter.AsFloat;
  EdiIVA_Orig.Value            := dmBaseDocFiscal.cdsNFEItemEntradaNF_IVA_ST.AsFloat;
  Edi_IVA.Value                := dmBaseDocFiscal.cdsNFEItemEntradaIVA_ST.AsFloat;
  EdiPorcPIS.Value             := dmBaseDocFiscal.cdsNFEItemEntradaPorcPIS.AsFloat;
  EdiPorcCOFINS.Value          := dmBaseDocFiscal.cdsNFEItemEntradaPorcCOFINS.AsFloat;
  edtNCM.Text                  := '';

end;

procedure TFrmEntradaNFe.rbNaoUsaEndClick(Sender: TObject);
begin
  inherited;
 if not (Sender is TRxDBLookupCombo) then
     cmbEndereco.KeyValue := -1;

  if rbNaoUsaEnd.Checked then
  begin
     edtMesmoEndereco.AsString := 'N';
     rbSimUsaEnd.Checked := False;
     CopiarEndereco(False);
  end;
end;

procedure TFrmEntradaNFe.rbSimUsaEndClick(Sender: TObject);
begin
  inherited;
  if not (Sender is TRxDBLookupCombo) then
     cmbEndereco.KeyValue := -1;

  if rbSimUsaEnd.Checked then
  begin
     edtMesmoEndereco.AsString := 'S';
     rbNaoUsaEnd.Checked := False;
     CopiarEndereco(True);
  end;
end;

procedure TFrmEntradaNFe.CopiarEndereco(bCopia: Boolean);
begin
   if bCopia then
   begin
      qryAux.Close;
      qryAux.SQL.Text := 'Select * from CLIENTE_ENDERECO ' +
      ' Where CodCliente = :CodCliente ' +
      ' and CEPEnd = :CEP ' +
      ' and NumeroEnd = :Numero ' +
      ' and BairroEnd = :Bairro ';
      qryAux.ParamByName('CodCliente').AsString  :=  VarToStr(EditFornecedor.bs_KeyValue);
      qryAux.ParamByName('CEP').AsString         :=  mskCep.Text;
      qryAux.ParamByName('Numero').AsString      :=  EdiNum.Text;
      qryAux.ParamByName('Bairro').AsString      :=  EdiBairro.Text;
      qryAux.Open;
      if not qryAux.IsEmpty then
      begin
        EdiEntrega.Text        := qryAux.FieldByName('ChaveSeqEnd').AsString;
        MskCepEnt.Text         := qryAux.FieldByName('CepEnd').AsString;
        EdiEndEnt.Text         := qryAux.FieldByName('EnderecoEnd').AsString;
        EdiNumEnt.Text         := qryAux.FieldByName('NumeroEnd').AsString;
        EdiComplementoEnt.Text := qryAux.FieldByName('ComplementoEnd').AsString;
        EdiBairroEnt.Text      := qryAux.FieldByName('BairroEnd').AsString;
        EdiCidadeEnt.Text      := qryAux.FieldByName('CidadeEnd').AsString;
        cbxUFEnt.Text          := qryAux.FieldByName('UFEnd').AsString;
        edtPontoReferenciaEnt.Text  := qryAux.FieldByName('PontoReferencia').AsString;
      end
      else
      begin
        EdiEntrega.Text        := '';
        MskCepEnt.Text         := mskCep.Text;
        EdiEndEnt.Text         := EdiEnd.Text;
        EdiNumEnt.Text         := EdiNum.Text;
        EdiComplementoEnt.Text := EdiComplemento.Text;
        EdiBairroEnt.Text      := EdiBairro.Text;
        EdiCidadeEnt.Text      := EdiCidade.Text;
        cbxUFEnt.Text          := CbxUF.Text;
        edtPontoReferenciaEnt.Text  := MemObservacao.Text;
      end;
   end
   else
   begin
      EdiEntrega.Clear;
      MskCepEnt.Clear;
      EdiEndEnt.Clear;
      EdiNumEnt.Clear;
      EdiComplementoEnt.Clear;
      EdiBairroEnt.Clear;
      EdiCidadeEnt.Clear;
      cbxUFEnt.Clear;
      edtPontoReferenciaEnt.Clear;
   end;
end;

procedure TFrmEntradaNFe.Scape;
begin
 // grpItens.Visible     := FormOpeErro;
end;

procedure TFrmEntradaNFe.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 inherited;
 Case Key Of
  27:
   Begin
    // grpItens.Visible     := FormOpeErro ;
   end;
  VK_F4:
   begin
    CentralizaPainel(pnlDesconto, True);
    EdiTotalDesconto.SetFocus;
   end;
 end;
end;

procedure TFrmEntradaNFe.FiltroItens(Totaliza: Boolean = True);
Var
 sqlNotaEntrada : TSQLQuery;
begin

  dmBaseDocFiscal.cdsNFEItemEntrada.Close;
  dmBaseDocFiscal.qryNFEItemEntrada.ParamByName('NumNF').AsString         := EdiCodigo.AsString;
  dmBaseDocFiscal.qryNFEItemEntrada.ParamByName('CodFilial').AsString     := EdiCodFilial.AsString;
  dmBaseDocFiscal.qryNFEItemEntrada.ParamByName('CodFornecedor').AsString := EdiFornecedor.AsString;
  dmBaseDocFiscal.cdsNFEItemEntrada.Open;

end;


procedure TFrmEntradaNFe.EdiNaturezaExit(Sender: TObject);
begin
 inherited;
 if EdiNatureza.AsString <> '' then
 begin
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('Select DescTipoServ, Tipo, CFOP, CFOP1 from Natureza where CodNatureza = '''  + EdiNatureza.AsString + '''');
  qryAux.Open;

  if qryAux.IsEmpty then
  begin
   Mens_MensInf('Natureza de operação não cadastrada ! ');
   EdiNatureza.SetFocus;
   Exit;
  end;
 {
  if CFOP(cmbCliente.KeyValue) then
   EdiCFOP.AsString := qryAux.FieldByName('CFOP').AsString
  else
   EdiCFOP.AsString := qryAux.FieldByName('CFOP1').AsString;
  }
  // EdiTipo.AsString := qryAux.FieldByName('Tipo').AsString;
 end;

end;

procedure TFrmEntradaNFe.PreencheEnderecoEntrega;
begin
 if not dmBaseDocFiscal.cdsEndereco.IsEmpty  then
  begin

    MskCepEnt.clear;
    EdiEndEnt.clear;
    EdiNumEnt.clear;
    EdiComplementoEnt.clear;
    EdiBairroEnt.clear;
    EdiCidadeEnt.clear;
    cbxUFEnt.clear;
    edtPontoReferenciaEnt.clear;
    EdiEntrega.Clear;

    EdiEntrega.Value       := dmBaseDocFiscal.cdsEnderecoCHAVESEQEND.AsInteger;
    MskCepEnt.Text         := dmBaseDocFiscal.cdsEnderecoCepEnd.AsString;
    EdiEndEnt.Text         := dmBaseDocFiscal.cdsEnderecoENDERECOEND.AsString;
    EdiNumEnt.Text         := dmBaseDocFiscal.cdsEnderecoNumeroEnd.AsString;
    EdiComplementoEnt.Text := dmBaseDocFiscal.cdsEnderecoComplementoEnd.AsString;
    EdiBairroEnt.Text      := dmBaseDocFiscal.cdsEnderecoBairroEnd.AsString;
    EdiCidadeEnt.Text      := dmBaseDocFiscal.cdsEnderecoCidadeEnd.AsString;
    cbxUFEnt.Text          := dmBaseDocFiscal.cdsEnderecoUFEnd.AsString;
    edtPontoReferenciaEnt.Text  := dmBaseDocFiscal.cdsEnderecoPontoReferencia.AsString;

  end;
end;


procedure TFrmEntradaNFe.ProdutoSetaValores;
begin
  if EdiProduto.Text <> '' then
  begin
      cmbGrupo.KeyValue         := EdiProduto.bs_KeyValues[7];
      edtNCM.Text               := EdiProduto.bs_KeyValues[8];
      edtProdutoFornecedor.Text := EdiProduto.bs_KeyValues[1];
  end;
end;

procedure TFrmEntradaNFe.EdiValorChange(Sender: TObject);
begin
 inherited;
 CalcValor;
end;

procedure TFrmEntradaNFe.EdiValorExit(Sender: TObject);
begin
  inherited;
  if EdiValor.AsDouble > 0 then
  begin

//    if FNotaFiscal.DestinatarioNF.ConsumidorFinal then
  //     EdiValor.AsDouble := EdiValor.AsDouble + TFuncoes.Percentual(lItemNF.Impostos.aliqIPI, EdiValor.AsDouble);
  end;

  CalcValor;

end;

procedure TFrmEntradaNFe.edtQtde2Exit(Sender: TObject);
begin
  inherited;
//  if edtQtde2.Value > 0 then
  //  EdiQtde.Value := edtQtde2.Value * lItemNF.Impostos.FatorConversao;
end;

procedure TFrmEntradaNFe.CalcularSubstituiopelaAliquotaInter1Click(
  Sender: TObject);
begin
  inherited;
  if EdiSituacao.AsString = 'Pendente' then
  begin
    qryAux.Close;
    qryAux.SQL.Clear;
    if Sender = CalcularSubstituiopelaAliquotaInter1 then
      qryAux.SQL.Add('update NFe_Entrada set ICMS_PorcInter = ''I'' ')
    else
      qryAux.SQL.Add('update NFe_Entrada set ICMS_PorcInter = ''P'' ');
    qryAux.SQL.Add('where NumNf = :NumNf and CodFilial = :CodFilial ');
    qryAux.ParamByName('NumNF').AsString     := Trim(EdiCodigo.AsString);
    qryAux.ParamByName('CodFilial').AsString := Trim(EdiCodFilial.AsString);
    try
     qryAux.ExecSQL;
    Except
     Mens_MensErro('Erro Alterando Calculo do ICMS !');
    End;

    TotalizaNotaFiscal;

  end;
end;

procedure TFrmEntradaNFe.CalcValor;
begin
  EdiTotal.AsDouble    := EdiQtde.AsDouble * EdiValor.AsDouble;
 {
  if EdiPorc.AsDouble <> 0 then
    EdiDesconto.AsDouble := ( (EdiQtde.AsDouble * EdiValor.AsDouble) * EdiPorc.AsDouble)/100;
  }
  EdiLiquido.AsDouble  := EdiTotal.AsDouble; // - EdiDesconto.AsDouble;

end;

procedure TFrmEntradaNFe.CbxUFKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  end;
end;

procedure TFrmEntradaNFe.cdsTipoCSTAfterScroll(DataSet: TDataSet);
begin
  inherited;
 {
  pnlCredito.Visible := cdsTipoCST.FieldByName('PermiteCredito').AsBoolean;
  if cdsTipoCST.FieldByName('PermiteCredito').AsBoolean then
  begin
     EdiCreditoPorc.AsDouble := cdsTipoCST.FieldByName('CreditoSN').AsFloat;
     EdiCreditoBR.AsDouble   := (EdiLiquido.AsDouble * EdiCreditoPorc.AsDouble)/100;
  end
  else
  begin
     EdiCreditoPorc.AsDouble := 0;
     EdiCreditoBR.AsDouble   := 0;
  end;
  }
end;

procedure TFrmEntradaNFe.EdiPorcImpChange(Sender: TObject);
begin
 inherited;
 CalcValor;
end;

procedure TFrmEntradaNFe.EdiQtdeChange(Sender: TObject);
begin
 inherited;
 CalcValor;
end;



procedure TFrmEntradaNFe.cmbGrupoCloseUp(Sender: TObject);
begin
  inherited;
  if ( (cmbGrupo.KeyValue <> '') and (cmbGrupo.KeyValue <> null)) then
  begin
    if cmbGrupo.Text = 'Lamminados - Beneficiado' then
    begin
      { if FNotaFiscal.Finalidade  <> Industrializacao Then
       begin
          Mens_MensErro('Grupo permitido somente para Finalidade de Industrialização !');
          cmbGrupo.KeyValue := -1;
          cmbGrupo.SetFocus;
          exit;
       end;
       }
    end;
  end;
end;

procedure TFrmEntradaNFe.EdiProdutoChange(Sender: TObject);
begin
 inherited;
 CalcValor;
end;

procedure TFrmEntradaNFe.EdiProdutoClick(Sender: TObject);
begin
  inherited;
  ProdutoSetaValores;
end;

procedure TFrmEntradaNFe.EdiProdutoExit(Sender: TObject);
begin
 inherited;
 if EdiProduto.Text <> EmptyStr then
  begin
    //Tabela            := Tabela_Preco(VarToStr(EdiProduto.bs_KeyValue));
    //EdiValor.AsDouble := Tabela;
    CalcValor;
    ProdutoST(VarToStr(EdiProduto.bs_KeyValue), EditFornecedor.bs_KeyValues[8] );
    EdiQtde.SetFocus;
  end;
end;

procedure TFrmEntradaNFe.EdiQtdeExit(Sender: TObject);
begin
 inherited;
 CalcValor;
end;

procedure TFrmEntradaNFe.EditFornecedorExit(Sender: TObject);
begin
  inherited;
 if (EditFornecedor.Text <> EmptyStr) then
  begin
    LocalizaDocto;
//    PageGeral.ActivePage := tabItens;
    ButAlterarItem.SetFocus;
  end;
end;

procedure TFrmEntradaNFe.EdiTipoICMSEnter(Sender: TObject);
begin
  inherited;
    EdiTipoICMS.CT_Sql.Clear;
    EdiTipoICMS.CT_Sql.Add('SELECT CodCST, DescCST ');
    EdiTipoICMS.CT_Sql.Add(' FROM TipoCST  ');
    EdiTipoICMS.CT_Sql.Add('Where Regime = ' + IntToStr(GRegimeTrib));
end;

procedure TFrmEntradaNFe.EdiPorcICMSChange(Sender: TObject);
begin
 inherited;
 CalcValor;
end;

function TFrmEntradaNFe.CFOP(CodFornecedor: String): Boolean;
begin
 qryTemp.Close;
 qryTemp.SQL.Clear;
 qryTemp.SQL.Add('Select Estado_3 From Fornecedores Where CodFornecedor = ' +
   QuotedStr(CodFornecedor));
 qryTemp.Open;

 Result := qryTemp.FieldByName('Estado_3').AsString = 'SP';
 qryTemp.Close;
end;

procedure TFrmEntradaNFe.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 inherited;

 dmBaseDocFiscal.cdsTipoCli.Close;
 dmBaseProduto.cdsGrupo.Close;

end;

procedure TFrmEntradaNFe.PageGeralChange(Sender: TObject);
begin
 inherited;
 if PageGeral.ActivePage = tabItens then
       FiltroItens
 else if PageGeral.ActivePage = tabVenctos then
       dmBaseDocFiscal.NFE_EntradaFiltroItensVcto(EdiCodigo.Text, EdiCodFilial.Text, EdiFornecedor.Text)
 else if PageGeral.ActivePage = tabComplementar then
 begin
       Insere_InfComplementar;

       // if VarOperacao = OPE_INCLUSAO then
       // begin
       if Pos('Cobrança:', memObservacao.Text) = 0 then
       begin
           qryTemp.Close;
           qryTemp.SQL.Clear;
           qryTemp.SQL.Add
             ('Select Contato1, Cep_3, Endereco_3, EndNum, Complemento, Cidade_3, Bairro_3, Estado_3');
           qryTemp.SQL.Add('From Fornecedores  ');
           qryTemp.SQL.Add('Where CodFornecedor = :CodFornecedor ');
           qryTemp.ParamByName('CodFornecedor').AsString := VarToStr(EditFornecedor.bs_KeyValue);
           try
            qryTemp.Open;
           Except
            Mens_MensErro('Erro Carregando Dados de Cobrança !');
           End;
           if qryTemp.FieldByName('Endereco_3').AsString <> '' then
           begin
            memObservacao.Lines.Add('Cobrança: A/c.: ' + qryTemp.FieldByName('Contato1').AsString);
            memObservacao.Lines.Add('End: ' + qryTemp.FieldByName('Endereco_3').AsString + ', ' + qryTemp.FieldByName('EndNum').AsString + ' ' +
                                              qryTemp.FieldByName('Complemento').AsString);
            memObservacao.Lines.Add('Bairro: ' + qryTemp.FieldByName('Bairro_3').AsString +
                                    'Cep ' + qryTemp.FieldByName('Cep_3').AsString + '  ' + qryTemp.FieldByName('Cidade_3').AsString + '-' +
                                             qryTemp.FieldByName('Estado_3').AsString);
           end;
       end;


       if Pos('Entrega:', memObservacao.Text) = 0 then
       begin
           if ((cmbEndereco.KeyValue <> '') and (cmbEndereco.KeyValue <> null)) then
           begin
              EdiEntrega.AsString := cmbEndereco.KeyValue;
              if (EditFornecedor.Text <> EmptyStr) and
                (Pos('Entrega:', memObservacao.Text) = 0) then
              begin
               qryTemp.Close;
               qryTemp.SQL.Clear;
               qryTemp.SQL.Add('Select DescricaoEnd, Responsavel, CepEnd, EnderecoEnd, NumeroEnd, ComplementoEnd, CidadeEnd, BairroEnd, UFEnd, PontoReferencia, RestricaoHora, HoraIni, HoraFim ');
               qryTemp.SQL.Add('From Cliente_Endereco a ');
               qryTemp.SQL.Add('Where ChaveSeqEnd = :Chave ');
               qryTemp.ParamByName('Chave').AsString := EdiEntrega.AsString;
               try
                qryTemp.Open;
               Except
                Mens_MensErro('Erro Carregando Dados de Entrega !');
               End;

               memObservacao.Lines.Add('Entrega: ' + qryTemp.FieldByName('DescricaoEnd').AsString);
               memObservacao.Lines.Add('A/c.: ' + qryTemp.FieldByName('Responsavel').AsString);
               memObservacao.Lines.Add('End: ' + qryTemp.FieldByName('EnderecoEnd').AsString + ', ' + qryTemp.FieldByName('NumeroEnd').AsString + ' ' +
                                               qryTemp.FieldByName('ComplementoEnd').AsString);
               memObservacao.Lines.Add('Bairro: ' + qryTemp.FieldByName('BairroEnd').AsString + 'Cep ' + qryTemp.FieldByName('CepEnd').AsString + '  ' + qryTemp.FieldByName('CidadeEnd').AsString + '-' +
                                               qryTemp.FieldByName('UFEnd').AsString);
               if Trim(qryTemp.FieldByName('PontoReferencia').AsString) <> '' then
                 memObservacao.Lines.Add('Ponto de Referência: ' + qryTemp.FieldByName('PontoReferencia').AsString);
               if qryTemp.FieldByName('RestricaoHora').AsInteger = 1 then
                 memObservacao.Lines.Add('Horário Permitido De : ' + FormatDateTime('HH:MM:SS', qryTemp.FieldByName('HoraIni').AsDateTime) + ' Até: ' + FormatDateTime('HH:MM:SS', qryTemp.FieldByName('HoraFim').AsDateTime) );

              end;
           end;
         // end;
         /// lblObs1.Caption := ('Restam ' + IntToStr(memObservacao.MaxLength) + ' caracteres');

       end
       else
        EdiEntrega.AsString := '';

 end
 else if (PageGeral.ActivePage = TabDetalhe) then
 begin
          if dmBaseDocFiscal.cdsNFEItemEntradaCodGrupo.asString <> '' then
            cmbGrupo_Det.KeyValue        := dmBaseDocFiscal.cdsNFEItemEntradaCodGrupo.asString;

          ediProduto_Det.SetValue('P.CodProdInterno = ' + QuotedStr(dmBaseDocFiscal.cdsNFEItemEntradaCodProduto.AsString));
          if ediProduto_Det.Text <> EmptyStr then
          begin
            if ediProduto_Det.bs_KeyValues[3] <> '' then
              cmbGrupo_Det.KeyValue := ediProduto_Det.bs_KeyValues[3];
            ediNCM_Det.Text       := ediProduto_Det.bs_KeyValues[4];
          end;

          EdiQtde_Det.Value         := dmBaseDocFiscal.cdsNFEItemEntradaQtde.AsFloat;
          EdiValor_Det.Value        := dmBaseDocFiscal.cdsNFEItemEntradaValorUnitario.AsFloat;
          ediTotal_Det.Value        := dmBaseDocFiscal.cdsNFEItemEntradaValorTotal.AsFloat;
          ediLiquido_Det.Value      := dmBaseDocFiscal.cdsNFEItemEntradaValorLiquido.AsFloat;
          ediCFOP_Det.AsString         := dmBaseDocFiscal.cdsNFEItemEntradaI_CFOP.AsString;


          edicstipi_Det.AsString       := dmBaseDocFiscal.cdsNFEItemEntradaNF_TipoIPI.AsString;
          ediPorcIPI_Det.Value         := dmBaseDocFiscal.cdsNFEItemEntradaPorcIPI.AsFloat;
          edivaloripi_det.Value        := dmBaseDocFiscal.cdsNFEItemEntradaValorIPI.AsFloat;

          dmBaseProduto.cdsNatureza.Open;

          dmBaseProduto.cdsNatureza.Locate('CodNatureza',dmBaseDocFiscal.cdsNFEItemEntradaI_CFOP.AsString, []);

          edicstpis_det.AsString       := dmBaseProduto.cdsNaturezaCSTPIS.AsString;
          ediPorcPIS_Det.Value         := dmBaseDocFiscal.cdsNFEItemPorcPIS.AsFloat;
          edivalorpis_det.Value        := dmBaseDocFiscal.cdsNFEItemValorPIS.AsFloat;

          edicstcofins_det.AsString    := dmBaseProduto.cdsNaturezaCSTCOFINS.AsString;
          ediPorcCofins_Det.Value      := dmBaseDocFiscal.cdsNFEItemPorcCOFINS.AsFloat;
          edivalorcofins_det.Value     := dmBaseDocFiscal.cdsNFEItemValorCofins.AsFloat;

          dmBaseProduto.cdsNatureza.Close;

          ediPorcProvPartICMS.Value    := dmBaseDocFiscal.cdsNFEItemEntradaPorcProvICMSPartilha.AsFloat;
          edifcp.Value                 := dmBaseDocFiscal.cdsNFEItemEntradaVlrFCP.AsFloat;
          ediVlrICMSRemtente.Value     := dmBaseDocFiscal.cdsNFEItemEntradaVlrICMSUFRemetente.AsFloat;
          ediVlrICMSDestinatario.Value := dmBaseDocFiscal.cdsNFEItemEntradaVlrICMSUFDestino.AsFloat;

          editcsticms_det.AsString      := dmBaseDocFiscal.cdsNFEItemEntradaNF_TipoICMS.AsString;
          ediPorcICMS_Det.Value         := dmBaseDocFiscal.cdsNFEItemEntradaPorcICMS.AsFloat;
          edivaloricms_det.Value        := dmBaseDocFiscal.cdsNFEItemEntradaValorICMS.AsFloat;
          edicsticmsst_det.AsString     := dmBaseDocFiscal.cdsNFEItemEntradaNF_TipoICMS.AsString;
          ediValorICMSST_Det.Value      := dmBaseDocFiscal.cdsNFEItemEntradaValorICMS_ST.AsFloat;
          PorcIVA_Det.Value             := dmBaseDocFiscal.cdsNFEItemEntradaIVA_Original.AsFloat;
          PorcIVAAjus_Det.Value         := dmBaseDocFiscal.cdsNFEItemEntradaIVA_ST.AsFloat;
          ediValorFrete_Det.Value       := dmBaseDocFiscal.cdsNFEItemEntradaValorFrete.AsFloat;
          ediValorSeguro_Det.Value      := dmBaseDocFiscal.cdsNFEItemEntradaVlrSeguro.AsFloat;
          ediValorOutrasDespesas_Det.Value := dmBaseDocFiscal.cdsNFEItemEntradaVlrOutrasDespesas.AsFloat;

         //ediICMS_Inter

         //   memDetalhe.Text          := dmaseDocFiscal.cdsItemOrcamentoDetalhe.AsString;
         //EdiDesconto.AsDouble     := dmBaseDocFiscal.cdsNFEItemValorDesconto.AsFloat;

 end;

end;


procedure TFrmEntradaNFe.ButNovoItemVctoClick(Sender: TObject);
begin
 inherited;
 ButItensOnOff('FFFTTFF');
 PageControl2.ActivePage := tbsEdicaoVcto;
 EdiValor.AsDouble       := EdiTotalNF.Value;
 EdiValParcela.AsDouble  := EdiTotalNF.Value;
 EdiVcto.Date            := cxdEmissao.Date;
 EdiCondPagto.Text       := GParFin.CodCondPagtoPadrao;
 Var_OperacaoItem := OPE_INCLUSAO;
 EdiVcto.SetFocus;

end;

procedure TFrmEntradaNFe.ButAlterarItemVctoClick(Sender: TObject);
begin
 inherited;
 ButItensOnOff('FFFTTFF');
 PageControl2.ActivePage := tbsEdicaoVcto;
 with dmBaseDocFiscal.cdsNfeEntradaItensVcto do
 begin
  EdiValParcela.AsDouble := FieldByName('ValParcela').AsFloat;
  EdiVcto.Text := FieldByName('Vencimento').AsString;
 end;
 Var_OperacaoItem := OPE_ALTERACAO;
 Try
  EdiVcto.SetFocus;
 Except
 End;
end;

procedure TFrmEntradaNFe.ButExcluirItemVctoClick(Sender: TObject);
var
 Tot: Double;
begin
 inherited;
 if Mens_MensConf('Confirma Exclusão do Vencimento Selecionado ?') <> mrOk then
  Exit;

 dmBaseDocFiscal.NFE_EntradaExcluirItemVcto;

 if dmBaseDocFiscal.cdsNFEEntradaItensVcto.IsEmpty then
 begin
  ButAlterarItemVcto.Enabled := False;
  ButExcluirItemVcto.Enabled := False;
 end;
end;

procedure TFrmEntradaNFe.ButSalvarItemVctoClick(Sender: TObject);
var
 Tot: Double;
begin
 if not CheckItem then
  Exit;

 inherited;
 EdiValor.ValidateData;

 if Var_OperacaoItem = OPE_INCLUSAO then
  IncluiItemVcto
 else
  AlteraItemVcto;

 ButItensOnOff('TTTFFTTT');
 Var_OperacaoItem := 0;
 PageControl2.ActivePage := tbsGradeVcto;

end;

procedure TFrmEntradaNFe.ButCancelarItemVctoClick(Sender: TObject);
begin
 inherited;
 ButItensOnOff('TTTFFTT');
 PageControl2.ActivePage := tbsGradeVcto;
 Var_OperacaoItem := 0;
end;

procedure TFrmEntradaNFe.AlteraItemVcto;
begin
  ButItensOnOff('TTTFFTT');

  if dmBaseDocFiscal.NFE_EntradaAlteraItemVcto(EdiValParcela.AsDouble,
                                    EdiVcto.Date,
                                    dmBaseDocFiscal.cdsNfeEntradaItensVcto.FieldByName('ChaveSeq').AsInteger) then
  begin
   PageControl2.ActivePage := tbsGradeVcto;
   dmBaseDocFiscal.NFE_EntradaFiltroItensVcto(EdiCodigo.Text, EdiCodFilial.Text, EdiFornecedor.AsString);
   Var_OperacaoItem := 0;
  end;
end;

procedure TFrmEntradaNFe.ExcluirItemVcto;
begin

end;

procedure TFrmEntradaNFe.IncluiItemVcto;
begin
 if (EdiCodFilial.Text = '') then
 begin
   Mens_MensInf('Filial não informada !');
   EdiCodFilial.SetFocus;
   Exit;
 end;

 if (EditFornecedor.Text = EmptyStr) then
 begin
    Mens_MensInf('É necessário informar o Fornecedor !') ;
    EditFornecedor.SetFocus ;
    Exit ;
 end;

 if (EdiCondPagto.Text = '') then
 begin
  Mens_MensInf('Condição de Pagamento Inválida !');
  EdiCondPagto.SetFocus;
  Exit;
 end;

 if (EdiCodigo.Text = '') then
 begin
  Mens_MensInf('Nota Fiscal não informada !');
  EdiCodigo.SetFocus;
  Exit;
 end;

 dmBaseDocFiscal.NFE_EntradaInsereVenctosItens(VarToStr(EditFornecedor.bs_KeyValue), EdiCodigo.AsString, EdiCodFilial.AsString, EdiCondPagto.AsString, cxdEmissao.Date, EdiValor.AsDouble);

 dmBaseDocFiscal.NFE_EntradaFiltroItensVcto(EdiCodigo.Text, EdiCodFilial.Text, EdiFornecedor.Text);


 {
 try
  ButItensOnOff('TTTFFTT');
  if dmBaseDocFiscal.NFE_IncluiItemVcto(EdiCodigo.AsString,
                                    EdiCodFilial.AsString,
                                    EdiValParcela.AsDouble,
                                    EdiParcela.AsInteger,
                                    EdiVcto.Date) then
    begin
     PageControl2.ActivePage := tbsGradeVcto;
     dmBaseDocFiscal.FiltroItensVcto(EdiCodigo.Text, EdiCodFilial.Text);

     Var_OperacaoItem := 0;
    end;
 except
  raise;
  Mens_MensInf('Erro ao Incluir Registro !');
 end;
  }
end;

{procedure TFrmEntradaNFe.InsereConPag;
begin
 dmBaseDocFiscal.cdsNfeEntradaItensVcto.First;
 dmBaseDocFiscal.cdsNfeEntradaItensVcto.DisableControls;

 while not dmBaseDocFiscal.cdsNfeEntradaItensVcto.Eof do
 begin

    GCambio.Banco       := GParFin.ContaBR;
    GCambio.Filial      := dmBaseDocFiscal.cdsNfeEntradaItensVctoCodFilial.AsString;
    GCambio.DocOrigem   := dmBaseDocFiscal.cdsNfeEntradaItensVctoNumNF.AsString;
    GCambio.Parcela     := dmBaseDocFiscal.cdsNfeEntradaItensVcto.FieldByName('Parcela').AsInteger;
    GCambio.NParcela    := dmBaseDocFiscal.cdsNfeEntradaItensVcto.FieldByName('TParcela').AsInteger;
    GCambio.DtEmissao   := GParFin.DtTrab;
    GCambio.Data        := Date_GetProDiaUtil(SQLTimeStampToDateTime(dmBaseDocFiscal.cdsNfeEntradaItensVcto.FieldByName('Vencimento').AsSQLTimeStamp));
    GCambio.Valor       := dmBaseDocFiscal.cdsNfeEntradaItensVcto.FieldByName('ValParcela').AsFloat;
    GCambio.CodCenCusto := EditFornecedor.bs_KeyValues[13];
    GCambio.NrNF        := NumNFInsereCP;
    GCambio.NrPedido    := PedidoIsereCP;
    GCambio.TipoDocQuitacao := '2';

    if not GCambio.InsConPagRec('P', 'A', Arredondar(GCambio.Valor, 2), EditFornecedor.bs_KeyValues[12], VarToStr(EditFornecedor.bs_KeyValue)) then
    begin
     Mens_MensErro('Erro Criando Contas a Pagar !');
     Exit;
    end;
    dmBaseDocFiscal.cdsNfeEntradaItensVcto.Next;
 end;

 dmBaseDocFiscal.cdsNfeEntradaItensVcto.EnableControls;
 dmBaseDocFiscal.cdsNfeEntradaItensVcto.First;

end;
 }
function TFrmEntradaNFe.CheckItem: Boolean;
Var
  lAliqICMSUsada : Double;
begin
 Result := False;

 if PageGeral.ActivePage = tabVenctos then
 begin

  if EdiValParcela.AsDouble = 0 then
  begin
   Mens_MensInf('Não é Permitido Vencimento Sem Valor !');
   Exit;
  end;
 end
 else if PageGeral.ActivePage = tabItens then
 begin
//  if Var_OperacaoItem = 1 then
//  begin
   if ProdutoDuplicado(EdiCodigo.AsString, EdiCodFilial.AsString, VarToStr(EdiProduto.bs_KeyValue)) then
   begin
     Mens_MensInf('Não é Permitido Incluir mais de 1 (um) produto com o mesmo código !');
     Exit;
   end;
//  end;

   if ConfereICMS(EdiCodigo.AsString, EdiCodFilial.AsString, EdiPorcICMS.AsDouble, lAliqICMSUsada) then
   begin
     if Mens_MensConf('Divergência de Aliquota de ICMS ! ' + #13#10 +
                  'Existe item(ns) com ICMS ' + FormatFloat('##,##0.00', lAliqICMSUsada) + #13#10 +
                  'ICMS informado no item ' + FormatFloat('##,##0.00', EdiPorcICMS.AsDouble)  + '. Deseja Continuar ? ') <> mrOk then
     Exit;
   end;

   if chkGARE.Checked then
   begin
      if editDigBaseICMSST.AsString = '' then
      begin
          Mens_MensInf('Campo Base de ICMS ST do Item deve ser preenchido');
          editDigBaseICMSST.SetFocus;
          exit;
      end;

      if editDigValorICMSST.AsString = '' then
      begin
          Mens_MensInf('Campo Valor de ICMS ST do Item deve ser preenchido');
          editDigValorICMSST.SetFocus;
          exit;
      end;
   end;

{
  if (EdiTributos.AsDouble = 0) then
  begin
    if Mens_MensConf('Valor Aproximado do Imposto Aproximado Não Informado! ' + #13#10 + 'Deseja Continuar?') <> mrOk then
    begin
      EdiTributos.SetFocus;
      Exit;
    end;
  end;
 }


  if (Trim(EdiNatureza.AsString) = '') then
  begin
    Mens_MensInf('Natureza da Operação do Item Não Informada !');
    EdiNatureza.SetFocus;
    Exit;
  end;

//  EdiTipoICMS.AsString := Trim(Copy(cmbTipoTrib.Text, 6, 2));
//  EdiTipo_IPI.AsString := Trim(Copy(cmbTipoIPI.Text, 5, 2));
  if ( EdiTipoICMS.AsString = '' ) then
  begin
    Mens_MensInf('Informe o Tipo de CST / CSOSN !');
    EdiTipoICMS.SetFocus;
    Exit;
  end;

  //EdiTipo_IPI.AsString := Trim(Copy(cmbTipoIPI.Text, 5, 2));

 end;

 Result := True;
end;

procedure TFrmEntradaNFe.EdiNatOperEnter(Sender: TObject);
begin
  inherited;

   if (EditFornecedor.Text = EmptyStr) then
   begin
      Mens_MensInf('É necessário informar o Fornecedor !') ;
      EditFornecedor.SetFocus ;
      Exit ;
   end;
end;

procedure TFrmEntradaNFe.EdiNatOperExit(Sender: TObject);
begin
 inherited;

 if EdiNatOper.AsString <> '' then
 begin
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('Select DescTipoServ, Tipo, CFOP, CFOP1 from Natureza where CodNatureza = ''' + EdiNatOper.AsString + '''');
  qryAux.Open;

  if qryAux.IsEmpty then
  begin
   Mens_MensInf('Natureza de operação não cadastrada ! ');
   EdiNatOper.SetFocus;
   Exit;
  end;

  if CFOP(VarToStr(EditFornecedor.bs_KeyValue)) then
   EdiCFOPGeral.AsString := qryAux.FieldByName('CFOP').AsString
  else
   EdiCFOPGeral.AsString := qryAux.FieldByName('CFOP1').AsString;

  EdiTipo.AsString := qryAux.FieldByName('Tipo').AsString;

  EdiTipo.ValidateData;

  EdiBaseICMS_ST.ReadOnly   := EdiNatOper.AsString <> '6404';
  EdiTotalNF.ReadOnly       := EdiNatOper.AsString <> '6404';
  EdiValorIMCS_ST.ReadOnly  := EdiNatOper.AsString <> '6404';
 end;

end;

procedure TFrmEntradaNFe.TotalizaNotaFiscal;
begin
 {
 qryTemp.Close;
 qryTemp.SQL.Clear;
 qryTemp.SQL.Add('Select Sum(TFrete) as TFrete, Sum(Total) as Total, Sum(TDesconto) as TDesconto, Sum(Volumes) as Volumes, ');
 qryTemp.SQL.Add('Sum(TVlrICMS_C) as TVlrICMS_C, Sum(TVlrICMS_V) as TVlrICMS_V, Sum(TBaseIVA) as TBaseIVA, ');
 qryTemp.SQL.Add('Sum(TVlr_IVA) as TVlr_IVA, Sum(TVlr_ICMS_ST) as TVlr_ICMS_ST, Sum(TBase_IMCS_ST) as TBase_IMCS_ST, Sum(PesoLiquido) Liq, Sum(PesoBruto) as Bruto, Sum(TVlr_IPI) as TVlr_IPI, Sum(TBaseICMS_It) as TBaseICMS_It ');
 qryTemp.SQL.Add('from vw_TotalizaItemNFe ');
 qryTemp.SQL.Add('Where NumNf = :NumNf and CodFilial = :CodFilial ');
 qryTemp.ParamByName('NumNF').AsString := EdiCodigo.AsString;
 qryTemp.ParamByName('CodFilial').AsString := EdiCodFilial.AsString;
 try
  qryTemp.Open;
 Except
  Mens_MensErro('Erro Calculando Total da Nota Fiscal !');
 End;

 Valor60 := 0;

 if IncideIMCS(EdiCodigo.AsString, EdiCodFilial.AsString) then
 begin
  if qryTemp.FieldByName('TBaseICMS_It').AsFloat = 0 then
    EdiBaseICMS.AsDouble := (qryTemp.FieldByName('Total').AsFloat - qryTemp.FieldByName('TDesconto').AsFloat) + qryTemp.FieldByName('TFrete').AsFloat - Valor60
  else
    EdiBaseICMS.AsDouble := qryTemp.FieldByName('TBaseICMS_It').AsFloat ;
  EdiTotICMS.AsDouble := qryTemp.FieldByName('TVlrICMS_V').AsFloat;
 end
 else
 begin
  EdiBaseICMS.AsDouble := 0;
  EdiTotICMS.AsDouble := 0;
 end;

 if EdiBaseICMS_ST.ReadOnly then
   EdiBaseICMS_ST.AsDouble := qryTemp.FieldByName('TBase_IMCS_ST').AsFloat;
 // qryTemp.FieldByName('TBaseIVA').AsFloat ; //qryTemp.FieldByName('TBaseIVA').AsFloat;

 if EdiValorIMCS_ST.ReadOnly then
   EdiValorIMCS_ST.AsDouble := qryTemp.FieldByName('TVlr_ICMS_ST').AsFloat;
 EdiVlrIPI.AsDouble  := qryTemp.FieldByName('TVlr_IPI').AsFloat;
 if qryTemp.FieldByName('TBaseICMS_It').AsFloat <> 0 then
   EdiTotProd.AsDouble := 0
 else
   EdiTotProd.AsDouble := (qryTemp.FieldByName('Total').AsFloat -  qryTemp.FieldByName('TDesconto').AsFloat); // + qryTemp.FieldByName('TFrete').AsFloat;
 EdiTotalFrete.AsDouble := qryTemp.FieldByName('TFrete').AsFloat;

 if qryTemp.FieldByName('TBaseICMS_It').AsFloat <> 0 then
   EdiTotalNF.AsDouble := 0
 else
   EdiTotalNF.AsDouble := (qryTemp.FieldByName('Total').AsFloat -  qryTemp.FieldByName('TDesconto').AsFloat) + qryTemp.FieldByName('TFrete').AsFloat + EdiValorIMCS_ST.AsDouble + EdiVlrIPI.AsDouble;

 // EdiPesoBruto.AsDouble    := qryTemp.FieldByName('Bruto').AsFloat;
 // EdiPesoLiquido.AsDouble  := qryTemp.FieldByName('Liq').AsFloat;
 }
{
  if Assigned(Item) then
  begin
    ediAliTotIPI.Value       := Item.Impostos.aliqIPI;
    ediAliTotPIS.Value       := Item.Impostos.AliqPIS;
    ediAliTotCOFINS.Value    := Item.Impostos.AliqCofins;
  end;

  EdiBaseICMS.AsDouble     := FNotaFiscal.ValoresNF.BS_ICMS;
  EdiTotICMS.AsDouble      := FNotaFiscal.ValoresNF.VL_ICMS;
  EdiBaseICMS_ST.AsDouble  := FNotaFiscal.ValoresNF.BS_ICMS_ST;
  EdiBaseIPI.AsDouble      := FNotaFiscal.ValoresNF.BS_IPI;
  EdiBasePIS.AsDouble      := FNotaFiscal.ValoresNF.BS_PIS;
  EdiBaseCOFINS.AsDouble   := FNotaFiscal.ValoresNF.BS_COFINS;


  EdiValorIMCS_ST.AsDouble := FNotaFiscal.ValoresNF.VL_ICMS_ST;
  EdiTotProd.AsDouble      := FNotaFiscal.ValoresNF.VL_TOTAL_PROD;
  EdiTotalFrete.AsDouble   := FNotaFiscal.ValoresNF.VL_FRETE;
  EdiTotalNF.AsDouble      := FNotaFiscal.ValoresNF.VL_TOTAL_NF;
  ediValTotIPI.Value       := FNotaFiscal.ValoresNF.VL_IPI;
  ediValTotPIS.Value       := FNotaFiscal.ValoresNF.VL_PIS;
  ediValTotCOFINS.Value    := FNotaFiscal.ValoresNF.VL_COFINS;
 }

end;

{
  function TFrmEmissaoNFe.IMCS_Cliente(Cliente: String): Double;
  begin
  Result := 0 ;

  if Trim(Cliente) = '' then
  Exit;

  qryTemp.Close;
  qryTemp.Sql.Clear;
  qryTemp.SQL.Add('Select ICMS_Regiao ');
  qryTemp.SQL.Add('From Clientes ' );
  qryTemp.SQL.Add('Where CodCliente = :CodCliente ' );
  qryTemp.ParamByName('CodCliente').AsString := Cliente;
  try
  qryTemp.Open;
  Except
  Mens_MensErro('Erro Buscando ICMS !');
  End;

  Result := qryTemp.FieldByName('ICMS_Regiao').AsFloat;
  qryTemp.Close;

  end;
}
procedure TFrmEntradaNFe.cxButton2Click(Sender: TObject);
begin
 inherited;
 if (EditFornecedor.Text = EmptyStr) then
 begin
  Mens_MensInf('Fornecedor não informado !');
  Exit;
 end;

 try
  FrmEndEntrega := TFrmEndEntrega.Create(nil);
  FrmEndEntrega.Cliente := VarToStr(EditFornecedor.bs_KeyValue);

  FrmEndEntrega.ShowModal;

  cmbEndereco.KeyValue := '';
  if (EditFornecedor.Text <> EmptyStr)  then
    AtualizaEndereco( VarToStr(EditFornecedor.bs_KeyValue));

  if FrmEndEntrega.Tag = 0 then
   Exit;

  cmbEndereco.KeyValue := FrmEndEntrega.cdsEnderecoChaveSeqEnd.AsInteger;

 Finally
  FrmEndEntrega.Release;
 end;
end;


procedure TFrmEntradaNFe.cmbEnderecoClick(Sender: TObject);
begin
 inherited;
 if ((cmbEndereco.KeyValue <> '') and (cmbEndereco.KeyValue <> null)) then
  EdiEntrega.AsString := cmbEndereco.KeyValue
 else
  EdiEntrega.AsString := '';
end;

procedure TFrmEntradaNFe.cmbEnderecoEnter(Sender: TObject);
begin
 inherited;
//  CriarCamposLookup(cmbEndereco, 'CLIENTE_ENDERECO WHERE CODCLIENTE = ' + QuotedStr(EdiCliente.AsString) + ' ORDER BY CHAVESEQEND', 'ENDERECOEND', 'CHAVESEQEND');
//  if (EditCliente.KeyValue <> '')  and (cmbCliente.KeyValue <> null) then
 //   AtualizaEndereco(cmbCliente.KeyValue);
end;


procedure TFrmEntradaNFe.cmbFisJurExit(Sender: TObject);
begin
  inherited;
  If  cmbFisJur.Text = 'Jurídica' then
  begin
    mskCNPJ.Properties.EditMask := '##\.###\.###\/####\-##;0;_';
    lblTipo.Caption := 'CNPJ';
  end
  else
  begin
    mskCNPJ.Properties.EditMask := '###\.###.###\-##;0;_';
    lblTipo.Caption := 'CPF';
  end;
end;

function TFrmEntradaNFe.IncideIMCS(NumNF: String; Filial: String): Boolean;
begin
 Result := False;

 qryAux.Close;
 qryAux.SQL.Clear;
 qryAux.SQL.Add('Select Simples ');
 qryAux.SQL.Add('From Filial ');
 qryAux.SQL.Add('Where CodFilial = :CodFilial ');
 qryAux.ParamByName('CodFilial').AsString := Filial;
 try
  qryAux.Open;
 Except
  Mens_MensErro('Erro Buscando Classificação do ICMS !');
 End;

 if qryAux.FieldByName('Simples').AsString = 'S' then
  Exit;

 qryAux.Close;
 qryAux.SQL.Clear;
 qryAux.SQL.Add('Select NF_TipoICMS ');
 qryAux.SQL.Add('From NFe_Entrada_Itens ');
 // and CodProdInterno in (Select CodProduto From Nfe_Itens Where
 qryAux.SQL.Add('Where ((NF_TipoICMS = ''00'') or (NF_TipoICMS = ''10'')) and NumNF = :NumNF and CodFilial = :CodFilial ');
 qryAux.ParamByName('NumNF').AsString := NumNF;
 qryAux.ParamByName('CodFilial').AsString := Filial;
 try
  qryAux.Open;
 Except
  Mens_MensErro('Erro Buscando Classificação do ICMS !');
 End;

 Result := Not qryAux.IsEmpty;

 qryAux.Close;
 qryAux.SQL.Clear;
 qryAux.SQL.Add
   ('Select  IsNull((Sum(Qtde * ValorUnitario) + Sum(ValorFrete) - IsNull(Sum(ValorDesconto),0) ),0)  Tot ');
 qryAux.SQL.Add('From NFe_Entrada_Itens ');
 // and CodProdInterno in (Select CodProduto From Nfe_Itens Where
 qryAux.SQL.Add
   ('Where (NF_TipoICMS = ''60'') and NumNF = :NumNF and CodFilial = :CodFilial ');
 qryAux.ParamByName('NumNF').AsString := NumNF;
 qryAux.ParamByName('CodFilial').AsString := Filial;
 try
  qryAux.Open;
 Except
  Mens_MensErro('Erro Buscando Classificação do ICMS !');
 End;

 Valor60 := qryAux.FieldByName('Tot').AsFloat;

 qryAux.Close;

end;

procedure TFrmEntradaNFe.Insere_InfComplementar;
begin
 qryTemp2.Close;
 qryTemp2.SQL.Clear;
 qryTemp2.SQL.Add('Select Distinct DadosComplementar ');
 qryTemp2.SQL.Add('From Produtos ');
 qryTemp2.SQL.Add('Where DadosComplementar <> '''' and CodProdInterno in (Select CodProduto From Nfe_Itens Where NumNF = :NumNF and CodFilial = :CodFilial) ');
 qryTemp2.ParamByName('NumNF').AsString := EdiCodigo.AsString;
 qryTemp2.ParamByName('CodFilial').AsString := EdiCodFilial.AsString;
 try
  qryTemp2.Open;
 Except
  Mens_MensErro('Erro Buscando Informação complementar do ICMS !');
 End;

 if not qryTemp2.IsEmpty then
 begin
  qryTemp2.First;
  while not qryTemp2.Eof do
  begin
   if Pos(qryTemp2.FieldByName('DadosComplementar').AsString,
     memObservacao.Text) = 0 then
    memObservacao.Lines.Add(qryTemp2.FieldByName('DadosComplementar').AsString);
   qryTemp2.Next;
  end;
 end;
 qryTemp2.Close;
end;

procedure TFrmEntradaNFe.cxButton1Click(Sender: TObject);
Var
 Desconto: Double;
begin
 inherited;

 if Mens_MensConf('Confirma Desconto no valor de R$ ' + FormatFloat('##,##0.00',
   EdiTotalDesconto.AsDouble)) <> mrOk then
  Exit;

 Salvo := False;

 qryAux.Close;
 qryAux.SQL.Clear;
// qryAux.SQL.Add('Update NFe_Itens set PorcDesconto = 0, ValorDesconto = Ceiling(:pDesconto * ((Qtde * ValorUnitario) /  ');
 qryAux.SQL.Add('Update NFe_Entrada_Itens set PorcDesconto = 0, ValorDesconto = ROUND(:pDesconto * ((Qtde * ValorUnitario) /  ');
 qryAux.SQL.Add('		(Select Sum(ValorTotal)  ');
 qryAux.SQL.Add('		 From NFe_Entrada_Itens s  ');
 qryAux.SQL.Add('		 Where s.NumNf = NFe_Itens.NumNf and s.CodFilial = NFe_Itens.CodFilial )),2 )  ');
 qryAux.SQL.Add('where NumNf = :NumNf and CodFilial = :CodFilial ');
 qryAux.ParamByName('pDesconto').AsFloat := EdiTotalDesconto.AsDouble;
 qryAux.ParamByName('NumNf').AsString := EdiCodigo.AsString;
 qryAux.ParamByName('CodFilial').AsString := EdiCodFilial.AsString;
 try
  qryAux.ExecSQL;
 Except
  Mens_MensErro('Erro Calculando Desconto !');
 End;

 qryAux.Close;
 qryAux.SQL.Clear;
 qryAux.SQL.Add('Select Sum(ValorDesconto) as Tot From NFe_Entrada_Itens Where NumNf = :NumNf and CodFilial = :CodFilial ');
 qryAux.ParamByName('NumNf').AsString := EdiCodigo.AsString;
 qryAux.ParamByName('CodFilial').AsString := EdiCodFilial.AsString;
 qryAux.Open;

 Desconto := qryAux.FieldByName('Tot').AsFloat;

 if (EdiTotalDesconto.AsDouble - Desconto) <> 0 then
 begin
  qryAux.SQL.Clear;
  qryAux.SQL.Add('update NFe_Entrada_Itens set ValorDesconto = ValorDesconto + :Diferenca ');
  qryAux.SQL.Add('Where ChaveSeq in (Select Max(ChaveSeq) From NFe_Entrada_Itens Where NumNf = :NumNf and CodFilial = :CodFilial) ');
  qryAux.ParamByName('Diferenca').AsFloat   :=(EdiTotalDesconto.AsDouble - Desconto);
  qryAux.ParamByName('NumNf').AsString      := EdiCodigo.AsString;
  qryAux.ParamByName('CodFilial').AsString  := EdiCodFilial.AsString;
  qryAux.ExecSQL;
 end;

 qryAux.Close;
 qryAux.SQL.Clear;
 qryAux.SQL.Add('Update NFe_Entrada_Itens set ValorLiquido = (Qtde * ValorUnitario) - ValorDesconto ');
 qryAux.SQL.Add('where NumNf = :NumNf and CodFilial = :CodFilial ');
 qryAux.ParamByName('NumNf').AsString := EdiCodigo.AsString;
 qryAux.ParamByName('CodFilial').AsString := EdiCodFilial.AsString;
 try
  qryAux.ExecSQL;
 Except
  Mens_MensErro('Erro Calculando Desconto !');
 End;

 pnlDesconto.Visible := False;
 FiltroItens;
 //ButGerarVectoClick(Self);
end;

procedure TFrmEntradaNFe.cxButton3Click(Sender: TObject);
begin
 inherited;
 pnlDesconto.Visible := False;
end;

procedure TFrmEntradaNFe.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 inherited;
 if (ButSalvar.Visible) then
 begin
  if Mens_MensConf('Nota Fiscal ainda não esta salva, Deseja sair Sem Salvar ? ') = mrOk then
  begin
    CanClose := True;
    ButCancelarClick(Nil);
    Exit;
  end;

  CanClose := False;
 end;
end;

procedure TFrmEntradaNFe.PageGeralPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
 inherited;
 if (PageGeral.ActivePage = tabItens) and (Page.ActivePage = tbsEdit) then
 begin
  Mens_MensInf
    ('Atenção. Salve Primeiro os Itens Da Nota Fiscal para continuar !');
  AllowChange := False;
  Exit;
 end
 else if (PageGeral.ActivePage = tabVenctos) and
   (PageControl2.ActivePage = tbsEdicaoVcto) then
 begin
  Mens_MensInf
    ('Atenção. Salve Primeiro os Vencimentos Da Nota Fiscal para continuar !');
  AllowChange := False;
  Exit;
 end;

end;

procedure TFrmEntradaNFe.EdiCodAliquotaExit(Sender: TObject);
begin
 inherited;
 GetDesc;
end;

function TFrmEntradaNFe.ConfereICMS(NumNF, CodFilial: String; ICMS: Double; var AliqICMSUsada : Double): Boolean;
begin
 Result := False;

 if ICMS = 0 then
   Exit;

 qryTemp2.Close;
 qryTemp2.SQL.Clear;
 qryTemp2.SQL.Add('Select IsNull(PorcICMS,0) as PorcICMS ');
 qryTemp2.SQL.Add('From NFe_Entrada_Itens I, TipoCST t ');
// qryTemp2.SQL.Add('Where i.NF_TipoICMS *= t.ChaveCST and t.ST <> ''S'' and NumNf = ' + QuotedStr(NumNF) + ' and CodFilial = ' + QuotedStr(CodFilial) +
 qryTemp2.SQL.Add('Where i.NF_TipoICMS = t.ChaveCST and NumNf = ' + QuotedStr(NumNF) + ' and CodFilial = ' + QuotedStr(CodFilial) +
                  ' and IsNull(PorcICMS, 0) <> 0 and IsNull(PorcICMS,0) <> :PorcICMS  ' );
 if Var_OperacaoItem = 2 then
   qryTemp2.SQL.Add('and ChaveSeq <> ' + dmBaseDocFiscal.cdsNFEItemEntradaChaveSeq.AsString);

 if (EdiTipoICMS.AsString <> '') then
   qryTemp2.SQL.Add('and NF_Tipoicms = ' + QuotedStr(EdiTipoICMS.AsString));

 qryTemp2.ParamByName('PorcICMS').AsFloat := ICMS;
 try
  qryTemp2.Open;
 Except
  Mens_MensErro('Erro Verificando Aliquota de ICMS !');
 End;

 AliqICMSUsada := qryTemp2.FieldByName('PorcICMS').AsFloat;

 Result := not qryTemp2.IsEmpty;
 qryTemp2.Close;
end;

function TFrmEntradaNFe.ValidaItens(var Item : Integer): Boolean;
begin
  Result := False;
  Item   := 0;

  qryTemp2.Close;
  qryTemp2.Sql.Clear;
  qryTemp2.Sql.Add('Select NumItem ');
  qryTemp2.Sql.Add('From NFe_Entrada_Itens ');
  qryTemp2.Sql.Add('Where ((I_CFOP = '''') or (I_CFOP is null)) and NumNF = ' + QuotedStr(EdiCodigo.AsString) + ' and CodFilial = ' + QuotedStr(EdiCodFilial.AsString) );
  qryTemp2.Sql.Add('Order By NumItem ');
  qryTemp2.Open;

  if not qryTemp2.IsEmpty then
  begin
    Item   := qryTemp2.FieldByName('NumItem').AsInteger;
    Exit;
  end;

  Result := True;
end;


procedure TFrmEntradaNFe.cxButton5Click(Sender: TObject);
begin
 inherited;
 if (Trim(EdiProduto.Text) = EmptyStr) then
 begin
  Mens_MensInf('Produto não informado !');
  Exit;
 end;

 FrmProdutos := TFrmProdutos.Create(nil);
 FrmProdutos.EdiCodigo.AsString := VarToStr(EdiProduto.bs_KeyValue);
 FrmProdutos.FechaTela := True;
 FrmProdutos.Show;
 FrmProdutos.Search;
end;

procedure TFrmEntradaNFe.cxButton6Click(Sender: TObject);
begin
  inherited;
{
  if ((cdsTributosOrigmMerc.AsInteger = 0) or (cdsTributosOrigmMerc.AsInteger = 4)) then
    EdiTributos.AsDouble := cdsTributosAliqNac.AsFloat
  else
    EdiTributos.AsDouble := cdsTributosAliqImp.AsFloat;

  pnlTributos.Visible := False;
  }
end;

procedure TFrmEntradaNFe.cxButton7Click(Sender: TObject);
begin
  inherited;
  pnlTributos.Visible := False;
end;

procedure TFrmEntradaNFe.cxButton8Click(Sender: TObject);
begin
  inherited;
  GClienteNovo  := '';
  IncAutomatico := True;
  FrmClientes := TFrmClientes.Create(Self);
  FrmClientes.ButNovoClick(Self);
  FrmClientes.IncCliente := True;
  FrmClientes.Show;
end;


procedure TFrmEntradaNFe.EdiCodFilialExit(Sender: TObject);
Var
 Continua  : Boolean;
 lUltimaNF : Integer;
begin
 inherited;
 if VarOperacao = OPE_INCLUSAO then
 begin
  EdiCodFilial.ValidateData;
  EdiCodigo.ReadOnly := False;
  Continua := True;
  NFSalva := False;

  if not EdiCodFilial.SeekGet then
  begin
   Mens_MensInf('Campo Empresa Deve Ser Preenchido Corretamente Para Continuar...');
   EdiCodFilial.SetFocus;
   Exit;
  end;

  while Continua do
  begin
   EdiCodigo.AsString := FormatFloat('0000', StrToFloat(LastCodigo('NumNfeEntrada', 'Filial', 'Where CodFilial = ' +
                                             QuotedStr(EdiCodFilial.AsString))));

   lUltimaNF := dmBaseDocFiscal.ValidaSequenciaNFEEntrada(EdiCodFilial.AsString);

   if (lUltimaNF + 1) <> StrToInt(EdiCodigo.AsString) then
   begin
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add('Update Filial set NumNfeEntrada = :NF where CodFilial = ' + QuotedStr(EdiCodFilial.AsString));
     qryAux.ParamByName('NF').AsInteger := lUltimaNF;
     try
      qryAux.ExecSQL;
     Except
      Mens_MensErro('Erro Alterando Parametro de Nota Fiscal !');
     End;
     // Atualiza codigo
     EdiCodigo.AsString := FormatFloat('0000', StrToFloat(LastCodigo('NumNfeEntrada', 'Filial', 'Where CodFilial = ' +
                                             QuotedStr(EdiCodFilial.AsString))));
   end;

   qryTemp.Close;
   qryTemp.SQL.Clear;
   qryTemp.SQL.Add('Select NumNf ');
   qryTemp.SQL.Add('From NFe_Entrada ');
   qryTemp.SQL.Add('Where NumNf = ' + QuotedStr(EdiCodigo.AsString) + ' and CodFilial = ' + QuotedStr(EdiCodFilial.AsString));
   try
    qryTemp.Open;
   Except
    Mens_MensErro('Erro Verificando Duplicidade de Nota Fiscal !');
   End;
   Continua := not qryTemp.IsEmpty;
   qryTemp.Close;
   if Continua then
   begin
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('Update Filial set NumNfeEntrada = NumNfeEntrada + 1 where CodFilial = ' +
      QuotedStr(EdiCodFilial.AsString));
    try
     qryAux.ExecSQL;
    Except
     Mens_MensErro('Erro Alterando Parametro de Nota Fiscal !');
    End;
   end;
  end;
  try
   cxdEmissao.SetFocus;
  Except
  End;



  if (GFilial <> EdiCodFilial.Text)  then
  begin
    GFilialUF   := Tab.SeekGet('FILIAL','CodFilial',[EdiCodFilial.Text],'Estado',False);
  end;

 end;

 // EdiCodigo.ReadOnly := ((VarOperacao = OPE_INCLUSAO) or (VarOperacao = OPE_ALTERACAO));
 EdiCodigo.ReadOnly := (VarOperacao = OPE_ALTERACAO);

end;

procedure TFrmEntradaNFe.ButCancelarClick(Sender: TObject);
Var
 CodForn : String;
 NumNF: String;
 Filial: String;
 Pedido: String;
 Inclusao: Boolean;
begin
 ActiveControl := Nil;

{
 if ( Not Salvo ) and ((VarOperacao = OPE_INCLUSAO) or (VarOperacao = OPE_ALTERACAO))  then
 begin
   if Mens_MensConf('Existe alterações que ainda não foram salvas. Deseja Salvar Agora ? ') = mrOk then
   begin
     Silencioso := True;
     ButSalvarClick(Self);
   end;

   Exit;
 end;
}

 GeraNFe  := False;
 NumNF    := EdiCodigo.AsString;
 Filial   := EdiCodFilial.AsString;
 CodForn  := EdiFornecedor.AsString;
 Inclusao := VarOperacao = OPE_INCLUSAO;

 inherited;
 // grpItens.Visible := FormOpeErro;
 ButNovo.Visible := False;
 ButImprimir.Visible := False;
 if not FormAlterou then
 begin
  if (Inclusao) and (Filial <> '') and (CodForn <> '') then
  begin

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add('Delete From NFe_Entrada_Itens where NumNF = ''' + NumNF +
     ''' and CodFilial = ''' + Filial + ''' and CodFornecedor = ''' + CodForn + '''');
   try
    qryAux.ExecSQL;
   Except
    Mens_MensErro('Erro Excluindo Itens !');
   End;

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add('Delete From NF_Entrada_Vencimentos where NumNF = ''' + NumNF +
     ''' and CodFilial = ''' + Filial + ''' and CodFornecedor = ' + CodForn + '''');
   try
    qryAux.ExecSQL;
   Except
    Mens_MensErro('Erro Excluindo Vencimentos !');
   End;

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add('update Filial set NumNfeEntrada = NumNfeEntrada - 1 where CodFilial =  ' +
     QuotedStr(Filial));
   try
    qryAux.ExecSQL;
   Except
    Mens_MensErro('Erro Alterando Parametro de Nota Fiscal !');
   End;

  end;
 end;

end;

procedure TFrmEntradaNFe.EdiCreditoPorcExit(Sender: TObject);
begin
  inherited;
  EdiCreditoBR.AsDouble   := (EdiLiquido.AsDouble * EdiCreditoPorc.AsDouble)/100;
end;

procedure TFrmEntradaNFe.EdiFornecedorExit(Sender: TObject);
begin
  inherited;
  if EdiFornecedor.Text <> '' then
  begin
    GRegimeTrib := Tab.SeekGet('FORNECEDORES','CodFornecedor',[EdiFornecedor.Text],'RegimeICMS',False);
    dmBaseProduto.FazSQL_CSTpeloRegime(GRegimeTrib);
  end;
end;

procedure TFrmEntradaNFe.EdiFornecedorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
 if Key = 13 then
  ButPesquisarClick(Self);
end;

procedure TFrmEntradaNFe.EdiCodigoEnter(Sender: TObject);
begin
 inherited;
 EdiCodigo.CT_Sql.Clear;
 EdiCodigo.CT_Sql.Add('Select NumNF, Nome, DataEmissao, Situacao from NFe_Entrada n, Fornecedores c ');
 EdiCodigo.CT_Sql.Add('where n.CodFornecedor = c.CodFornecedor ');
 if EdiCodFilial.AsString <> '' then
  EdiCodigo.CT_Sql.Add('and n.CodFilial = ' + QuotedStr(EdiCodFilial.AsString));
 EdiCodigo.CT_Sql.Add('Order By NumNF ');

end;

// procedure TFrmEmissaoNFe.memObservacaoKeyPress3(Sender: TObject;
// var Key: Char);
// Var
// Max, Min, Total : integer;
// begin
// inherited;
// Max := memObservacao.MaxLength; //Passando o valor máximo de caracteres do Memo para a variável Max.
// Min := memObservacao.GetTextLen; //Passando o valor minímo de caracteres do Memo para a variável Min.
// Total := Max - Min; //Efetuando o cálculo entre o valor máximo e o mínimo.
// lblObs1.Caption := ('Restam ' + IntToStr(Total) + ' caracteres');
// Repaint;
// if total < 1 then // Testando se ainda existem caracteres disponíveis para inserir.
// Mens_MensInf('Quantidade de caracteres excedido!');
// end;

procedure TFrmEntradaNFe.Button1Click(Sender: TObject);
begin
 inherited;
 qryAux.Close;
 qryAux.SQL.Clear;
 qryAux.SQL.Add('update NFe_Entrada set Observacao = ' + QuotedStr(memObservacao.Lines.Text));
 qryAux.SQL.Add('where NumNf = :NumNf and CodFilial = :CodFilial ');
 qryAux.ParamByName('NumNF').AsString := Trim(EdiCodigo.AsString);
 qryAux.ParamByName('CodFilial').AsString := Trim(EdiCodFilial.AsString);
 qryAux.ExecSQL;

end;


procedure TFrmEntradaNFe.ProcuraNCM(CodProduto: String);
begin
{
  cdsTributos.Close;
  qryTributos.ParamByName('CodProduto').AsString := EdiProduto.AsString;
  cdsTributos.Open;

  if cdsTributos.RecordCount = 1 then
  begin
    if ((cdsTributosOrigmMerc.AsInteger = 0) or (cdsTributosOrigmMerc.AsInteger = 4)) then
      EdiTributos.AsDouble := cdsTributosAliqNac.AsFloat
    else
      EdiTributos.AsDouble := cdsTributosAliqImp.AsFloat;
  end
  else if not cdsTributos.IsEmpty then
    CentralizaPainel( pnlTributos, True )
  else
  begin
    Mens_MensInf('NCM Não Encontrado na Tabela IBPT ! ');
    EdiTributos.AsDouble := 0;
  end;
  }
end;

function TFrmEntradaNFe.ProdutoDuplicado(Codigo, CodFilial, Produto: String): Boolean;
begin
 Result := False;

 qryTemp2.Close;
 qryTemp2.SQL.Clear;
 qryTemp2.SQL.Add('Select NumNf ');
 qryTemp2.SQL.Add('From NFe_Entrada_Itens ');
 qryTemp2.SQL.Add('Where NumNf = ' + QuotedStr(Codigo) + ' and CodFilial = ' + QuotedStr(CodFilial) + ' and CodProduto = ' + QuotedStr(Produto));
 if Var_OperacaoItem = 2 then
   qryTemp2.SQL.Add(' and ChaveSeq <> ' + dmBaseDocFiscal.cdsNFEItemEntradaChaveSeq.AsString );

 try
  qryTemp2.Open;
 Except
  Mens_MensErro('Erro Verificando Duplicidade de Produto !');
 End;

 Result := not qryTemp2.IsEmpty;
 qryTemp2.Close;

end;
{
function TFrmEmissaoNFe.RegimeTributario(CodFilial: String): String;
begin
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.SQL.Add('Select Regime ');
  qryAux.SQL.Add('From Filial ' );
  qryAux.SQL.Add('Where CodFilial = :CodFilial ' );
  qryAux.ParamByName('CodFilial').AsString  := CodFilial;
  try
    qryAux.Open;
  Except
    Mens_MensErro('Erro Verificando Regime Tributário !');
  End;

  Result := qryAux.FieldByName('Simples').AsString;
  qryAux.Close;
end;
}
procedure TFrmEntradaNFe.EdiCodigoExit(Sender: TObject);
Var
 Continua: Boolean;
 P: Integer;
begin
 inherited;
 if VarOperacao = OPE_INCLUSAO then
 begin

  EdiCodFilial.ValidateData;
  EdiCodigo.ReadOnly := False;
  Continua := True;
  NFSalva := False;

  if not EdiCodFilial.SeekGet then
  begin
   Mens_MensInf('Campo Empresa Deve Ser Preenchido Corretamente Para Continuar...');
   EdiCodFilial.SetFocus;
   Exit;
  end;

  EdiCodigo.AsString := FormatFloat('0000', StrToInt(EdiCodigo.AsString));

  qryTemp.Close;
  qryTemp.SQL.Clear;
  qryTemp.SQL.Add('Select NumNf ');
  qryTemp.SQL.Add('From NFe_Entrada ');
  qryTemp.SQL.Add('Where NumNf = ' + QuotedStr(EdiCodigo.AsString) + ' and CodFilial = ' + QuotedStr(EdiCodFilial.AsString));
  qryTemp.SQL.Add('and CodFornecedor = ' + QuotedStr(EdiFornecedor.AsString));

  try
   qryTemp.Open;
  Except
   Mens_MensErro('Erro Verificando Duplicidade de Nota Fiscal !');
  End;

  Continua := not qryTemp.IsEmpty;

  P := StrToInt(EdiCodigo.AsString);

  while Continua do
  begin
   Inc(P);
   EdiCodigo.AsString := FormatFloat('0000', P);

   qryTemp.Close;
   qryTemp.SQL.Clear;
   qryTemp.SQL.Add('Select NumNf ');
   qryTemp.SQL.Add('From NFe_Entrada ');
   qryTemp.SQL.Add('Where NumNf = ' + QuotedStr(EdiCodigo.AsString) +
     ' and CodFilial = ' + QuotedStr(EdiCodFilial.AsString) +
     ' and CodFornecedor = ' + QuotedStr(EdiFornecedor.AsString));
   try
    qryTemp.Open;
   Except
    Mens_MensErro('Erro Verificando Duplicidade de Nota Fiscal !');
   End;
   Continua := not qryTemp.IsEmpty;
   qryTemp.Close;
  end;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('Update Filial set NumNfeEntrada = :Nfe where CodFilial = ' +
    QuotedStr(EdiCodFilial.AsString));
  qryAux.ParamByName('Nfe').AsInteger := StrToInt(EdiCodigo.AsString) - 1;
  try
   qryAux.ExecSQL;
  Except
   Mens_MensErro('Erro Alterando Parametro de Nota Fiscal !');
  End;

 end
 else
 if (VarOperacao = 0) then
 begin
   qryTemp.Close;
   qryTemp.SQL.Clear;
   qryTemp.SQL.Add('Select Count(*) as T ');
   qryTemp.SQL.Add('From NFe_Entrada ');
   qryTemp.SQL.Add('Where NumNf = ' + QuotedStr(EdiCodigo.AsString) +
                                  ' and CodFilial = ' + QuotedStr(EdiCodFilial.AsString) );
   try
    qryTemp.Open;
   Except
    Mens_MensErro('Erro Fornecedor da Nota Fiscal !');
   End;

   if qryTemp.FieldByName('T').AsInteger = 1 then
   begin
     qryTemp.Close;
     qryTemp.SQL.Clear;
     qryTemp.SQL.Add('Select CodFornecedor ');
     qryTemp.SQL.Add('From NFe_Entrada ');
     qryTemp.SQL.Add('Where NumNf = ' + QuotedStr(EdiCodigo.AsString) +
                                    ' and CodFilial = ' + QuotedStr(EdiCodFilial.AsString) );
     try
      qryTemp.Open;
     Except
      Mens_MensErro('Erro Fornecedor da Nota Fiscal !');
     End;

     EdiFornecedor.AsString := qryTemp.FieldByName('CodFornecedor').AsString;
     ButPesquisarClick(Self);
   end
   else
   begin
      EdiFornecedor.CT_Sql.Clear;
      EdiFornecedor.CT_Sql.Add('Select  n.CodFornecedor, n.NumNF, Nome, Endereco_3 From NFe_Entrada n, Fornecedores f ');
      EdiFornecedor.CT_Sql.Add('where n.CodFornecedor = f.CodFornecedor and n.NumNf = ' + QuotedStr(EdiCodigo.AsString));
      EdiFornecedor.CT_Sql.Add('Order By Nome ');
   end;

 end;
 // EdiCodigo.ReadOnly := ((VarOperacao = OPE_INCLUSAO) or (VarOperacao = OPE_ALTERACAO));
 EdiCodigo.ReadOnly := (VarOperacao = OPE_ALTERACAO);

end;

end.









