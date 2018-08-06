unit FPrincipal;
                                             
interface

uses
	Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
	StdCtrls, ExtCtrls, rsFlyovr, ImgList, Menus, Buttons, Animate, ComCtrls,
	ToolWin, DBTables, Db ;

type
	TFrmPrincipal = class(TForm)
		ImaFundo: TImage;
		ButSair: TrsFlyOverButton;
		ButVendas: TrsFlyOverButton;
		ButFinanceiro: TrsFlyOverButton;
		MenuCadastros: TPopupMenu;
		MenuCadEmpresas: TMenuItem;
		MenuCadClientes: TMenuItem;
		ButCadastros: TrsFlyOverButton;
		MenuCadFornecedores: TMenuItem;
		MenuCadUsuarios: TMenuItem;
	 N1: TMenuItem;
		MenuVendas: TPopupMenu;
		MenuVenRepresentantes: TMenuItem;
		MenuVenTransportadoras: TMenuItem;
		MenuFinanceiro: TPopupMenu;
		MenuFinContaCorrente: TMenuItem;
		MenuFinMoedas: TMenuItem;
		MenuVenMapa: TMenuItem;
		MenuVenProvEntreg: TMenuItem;
		MenuFinAgente: TMenuItem;
		MenuFrota: TPopupMenu;
		MenuFroVeiculos: TMenuItem;
		MenuFroRota: TMenuItem;
		ButFrota: TrsFlyOverButton;
		ButProdAgricola: TrsFlyOverButton;
		ButProcJudiciais: TrsFlyOverButton;
		ButProducao: TrsFlyOverButton;
		ButEstoque: TrsFlyOverButton;
		ButCompras: TrsFlyOverButton;
		ButCobranca: TrsFlyOverButton;
		ButFaturamento: TrsFlyOverButton;
		MenuFaturamento: TPopupMenu;
		MenuFatCondPag: TMenuItem;
		MenuFatNatOpe: TMenuItem;
		MenuVenConsultas: TMenuItem;
		N5: TMenuItem;
		MenuFinConsultas: TMenuItem;
		MenuFatConsultas: TMenuItem;
		MenuFatEmitBol: TMenuItem;
		MenuFinConPag: TMenuItem;
		MenuFinPrevisao: TMenuItem;
		MenuCadRepresentantes: TMenuItem;
		MenuFroTransp: TMenuItem;
		TimerLogin: TTimer;
		MenuVenPedAprMan: TMenuItem;
		MenuVenPedAprAut: TMenuItem;
		LabNomeEmpresa: TLabel;
		MenuFatEmiNotFisMapa: TMenuItem;
		MenuCadFuncionarios: TMenuItem;
		N8: TMenuItem;
		N10: TMenuItem;
		N3: TMenuItem;
    MenuFatManNotFiscais: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
		MenuVenClientes: TMenuItem;
	 N11: TMenuItem;
		MenuVenPedCientes: TMenuItem;
		MenuCodPagamentos: TMenuItem;
		MenuCadPerfil: TMenuItem;
		MenuCadOperacao: TMenuItem;
		MenuCadPerfilOperacao: TMenuItem;
		MenuCadSegCli: TMenuItem;
    N2: TMenuItem;
		MenuVenMapaManifesto: TMenuItem;
    MenuCadParEmp: TMenuItem;
		MenuCobranca: TPopupMenu;
		MenuCobMovChe: TMenuItem;
		MovimentaodeDuplicatas1: TMenuItem;
    PrestaodeContas1: TMenuItem;
    MenuCadParGer: TMenuItem;
    MenuVenVisPreCon: TMenuItem;
		N7: TMenuItem;
		MenuCobConsultas: TMenuItem;
		ButMinimizar: TrsFlyOverButton;
    ConfirmarPrestacaoContas: TMenuItem;
		MenuCompra: TPopupMenu;
		MenuComprasInsumos: TMenuItem;
		N12: TMenuItem;
		MenuComprasRequisicao: TMenuItem;
    LabEmp2: TLabel;
		MenuVenCancMapa: TMenuItem;
		MenuEstoque: TPopupMenu;
    MenuEstoqueReqSolic: TMenuItem;
		MenuEstoqueTransferencia: TMenuItem;
		MenuComprasCategoria: TMenuItem;
    CancelaCtPagar: TMenuItem;
    BaixaCtPagar: TMenuItem;
    CadastroCtPagar: TMenuItem;
		MovimentoCCorrente: TMenuItem;
    MenuComprasOrcamento: TMenuItem;
		QGeral: TQuery;
		MenuComprasOrdemdeCompra: TMenuItem;
    Adiantamentos1: TMenuItem;
    PrestServio1: TMenuItem;
    ContaCorrente1: TMenuItem;
    AplicDiaria1: TMenuItem;
		AplicaLongoPrrazo1: TMenuItem;
    MenuFinMovContabil: TMenuItem;
		MenuComprasEntradas: TMenuItem;
    ResgatePorCotas1: TMenuItem;
		EspecificaoDeVendas1: TMenuItem;
		Produtos1: TMenuItem;
    Produtos2: TMenuItem;
		N9: TMenuItem;
		Zona1: TMenuItem;
    GrupoDeZona1: TMenuItem;
    Unidade1: TMenuItem;
    CentroDeCusto1: TMenuItem;
		TipoDeOperao1: TMenuItem;
    N17: TMenuItem;
    Insumos1: TMenuItem;
    Categorias1: TMenuItem;
    Estorno1: TMenuItem;
		MenuComprasReqManut: TMenuItem;
    MenuComprasReqAprov: TMenuItem;
    MenuComprasReqCanc: TMenuItem;
		MenuComprasOrcManut: TMenuItem;
		MenuComprasOrcAprov: TMenuItem;
    N13: TMenuItem;
		MenuCompraConsultas: TMenuItem;
    MenuComprasOrcAltera: TMenuItem;
    Manutencao1: TMenuItem;
    Cancela1: TMenuItem;
    MenuComprasOrdemdeCompraAlteracao: TMenuItem;
    MovEspeciais1: TMenuItem;
    MovEspeciais2: TMenuItem;
		Despesas1: TMenuItem;
    Despesas2: TMenuItem;
		Despesas3: TMenuItem;
    Fornecedores1: TMenuItem;
    Movimentao1: TMenuItem;
		Transferencia1: TMenuItem;
		N14: TMenuItem;
    Fechamento1: TMenuItem;
		N15: TMenuItem;
    N16: TMenuItem;
    Relatrios1: TMenuItem;
    TipodeOperao2: TMenuItem;
    Unidade2: TMenuItem;
    Fornecedores2: TMenuItem;
		CentrodeCusto2: TMenuItem;
    MenuProdAgricola: TPopupMenu;
    MenuProducao: TPopupMenu;
    MnuProdAgricolaServicos: TMenuItem;
    MnuProdAgricolaFrete: TMenuItem;
    MnuProdAgricolaMaquinas: TMenuItem;
    N18: TMenuItem;
    ConsultaseRelatrios1: TMenuItem;
    MnuProdAgricolaMovMaq: TMenuItem;
		MnuProdAgricolaPrestMaquinas: TMenuItem;
    MenuProdMaquinas: TMenuItem;
		MenuProdServicos: TMenuItem;
		N19: TMenuItem;
    MenuProdMovMaq: TMenuItem;
    SadasdoCaixa1: TMenuItem;
    Manuteno1: TMenuItem;
		Aprovao1: TMenuItem;
    Baixa1: TMenuItem;
    LiberacaoOrcamento: TMenuItem;
    Aprovacao: TMenuItem;
    FechaEstoque: TMenuItem;
    Processos1: TMenuItem;
    ProducaoAgricola1: TMenuItem;
    Manutencao2: TMenuItem;
    Movimentacao1: TMenuItem;
    Finalizacao1: TMenuItem;
    Processos2: TMenuItem;
    Toneis1: TMenuItem;
    MovimentodeToneis1: TMenuItem;
    Frota1: TMenuItem;
    N20: TMenuItem;
    MovimentoFrota1: TMenuItem;
		Producao1: TMenuItem;
    ConfirmacaodeProducao1: TMenuItem;
    BaixaParcial1: TMenuItem;
    MovimentoFrota2: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
	 procedure ButSairClick(Sender: TObject);
	 procedure MenuFroZonaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
		procedure MenuFroRotaClick(Sender: TObject);
    procedure MenuFroVeiculosClick(Sender: TObject);
    procedure MenuCadClientesClick(Sender: TObject);
		procedure MenuCadEmpresasClick(Sender: TObject);
		procedure MenuCadRepresentantesClick(Sender: TObject);
		procedure MenuCadAgentesClick(Sender: TObject);
		procedure MenuFroTranspClick(Sender: TObject);
		procedure MenuCadFornecedoresClick(Sender: TObject);
    procedure MenuFinMoedasClick(Sender: TObject);
		procedure MenuCadUsuariosClick(Sender: TObject);
		procedure TimerLoginTimer(Sender: TObject);
		procedure FormShow(Sender: TObject);
		procedure MenuFatCondPagClick(Sender: TObject);
    procedure MenuVenPedAprManClick(Sender: TObject);
    procedure MenuVenPedAprAutClick(Sender: TObject);
		procedure MenuFatEmitNFMapaClick(Sender: TObject);
    procedure MenuVenMapaClick(Sender: TObject);
		procedure MenuVenProvEntregClick(Sender: TObject);
		procedure MenuFatEmiNotFisMapaClick(Sender: TObject);
    procedure MenuFatNatOpeClick(Sender: TObject);
    procedure MenuVenPedCientesClick(Sender: TObject);
		procedure MenuFroGruZonasClick(Sender: TObject);
		procedure MenuVenConsultasClick(Sender: TObject);
    procedure MenuFatManNotFiscaisClick(Sender: TObject);
		procedure MenuCadPerfilClick(Sender: TObject);
		procedure MenuCadOperacaoClick(Sender: TObject);
		procedure MenuCadPerfilOperacaoClick(Sender: TObject);
		procedure MenuCadSegCliClick(Sender: TObject);
		procedure MenuFatEmitBolClick(Sender: TObject);
		procedure MenuCadLoginClick(Sender: TObject);
		procedure MenuVenConfEmbClick(Sender: TObject);
		procedure MenuVenMapaManifestoClick(Sender: TObject);
		procedure MenuCadParEmpClick(Sender: TObject);
		procedure MovimentaodeDuplicatas1Click(Sender: TObject);
		procedure PrestaodeContas1Click(Sender: TObject);
		procedure MenuCadParGerClick(Sender: TObject);
    procedure MenuVenVisPreConClick(Sender: TObject);
		procedure MenuCobMovCheClick(Sender: TObject);
		procedure MenuFinTpoClick(Sender: TObject);
    procedure MenuCobConsultasClick(Sender: TObject);
		procedure ButMinimizarClick(Sender: TObject);
		procedure ConfirmarPrestacaoContasClick(Sender: TObject);
		procedure MenuComprasUnidadeClick(Sender: TObject);
		procedure MenuComprasCentroCustoClick(Sender: TObject);
    procedure MenuComprasInsumosClick(Sender: TObject);
    procedure MenuVenCancMapaClick(Sender: TObject);
		procedure MenuFatConsultasClick(Sender: TObject);
    procedure MenuEstoqueReqSolicClick(Sender: TObject);
		procedure CancelaCtPagarClick(Sender: TObject);
		procedure MenuEstoqueTransferenciaClick(Sender: TObject);
		procedure BaixaCtPagarClick(Sender: TObject);
		procedure MenuComprasCategoriaClick(Sender: TObject);
		procedure CadastroCtPagarClick(Sender: TObject);
		procedure MovimentoCCorrenteClick(Sender: TObject);
		procedure MenuCadFuncionariosClick(Sender: TObject);
		procedure Adiantamentos1Click(Sender: TObject);
		procedure PrestServio1Click(Sender: TObject);
		procedure ContaCorrente1Click(Sender: TObject);
		procedure AplicDiaria1Click(Sender: TObject);
		procedure MenuFinMovContabilClick(Sender: TObject);
		procedure MenuComprasEntradasClick(Sender: TObject);
    procedure AplicaLongoPrrazo1Click(Sender: TObject);
    procedure MenuFinConsultasClick(Sender: TObject);
		procedure ResgatePorCotas1Click(Sender: TObject);
		procedure EspecificaoDeVendas1Click(Sender: TObject);
		procedure Produtos1Click(Sender: TObject);
    procedure Produtos2Click(Sender: TObject);
    procedure Estorno1Click(Sender: TObject);
    procedure MenuComprasReqManutClick(Sender: TObject);
		procedure MenuComprasReqCancClick(Sender: TObject);
		procedure MenuComprasReqAprovClick(Sender: TObject);
    procedure MenuComprasOrcManutClick(Sender: TObject);
		procedure MenuComprasOrcAprovClick(Sender: TObject);
		procedure MenuComprasOrcAprovDirClick(Sender: TObject);
    procedure MenuCompraConsultasClick(Sender: TObject);
		procedure MenuComprasOrcAlteraClick(Sender: TObject);
    procedure Manutencao1Click(Sender: TObject);
    procedure Cancela1Click(Sender: TObject);
		procedure MenuComprasOrdemdeCompraAlteracaoClick(Sender: TObject);
		procedure MovEspeciais2Click(Sender: TObject);
		procedure Despesas1Click(Sender: TObject);
		procedure Movimentao1Click(Sender: TObject);
		procedure Transferencia1Click(Sender: TObject);
		procedure Fechamento1Click(Sender: TObject);
		procedure Unidade2Click(Sender: TObject);
		procedure Fornecedores2Click(Sender: TObject);
		procedure CentrodeCusto2Click(Sender: TObject);
		procedure TipodeOperao2Click(Sender: TObject);
		procedure MnuProdAgricolaServicosClick(Sender: TObject);
		procedure MnuProdAgricolaFreteClick(Sender: TObject);
		procedure MnuProdAgricolaMaquinasClick(Sender: TObject);
		procedure ConsultaseRelatrios1Click(Sender: TObject);
		procedure MnuProdAgricolaMovMaqClick(Sender: TObject);
		procedure MnuProdAgricolaPrestMaquinasClick(Sender: TObject);
		procedure Manuteno1Click(Sender: TObject);
		procedure Aprovao1Click(Sender: TObject);
		procedure Baixa1Click(Sender: TObject);
		procedure LiberacaoOrcamentoClick(Sender: TObject);
		procedure AprovacaoClick(Sender: TObject);
		procedure FechaEstoqueClick(Sender: TObject);
		procedure Processos1Click(Sender: TObject);
		procedure Manutencao2Click(Sender: TObject);
		procedure Movimentacao1Click(Sender: TObject);
		procedure Finalizacao1Click(Sender: TObject);
		procedure Toneis1Click(Sender: TObject);
		procedure MovimentodeToneis1Click(Sender: TObject);
		procedure Frota1Click(Sender: TObject);
		procedure MovimentoFrota1Click(Sender: TObject);
		procedure Producao1Click(Sender: TObject);
		procedure ConfirmacaodeProducao1Click(Sender: TObject);
    procedure BaixaParcial1Click(Sender: TObject);
    procedure MovimentoFrota2Click(Sender: TObject);
private
		{ Private declarations }
	public
	 iWidthTot,iHeightTot :Integer;
		{ Public declarations }
		Function Confirma_Acesso( ItemSelecionado : String ):Boolean ;
	end;

const

	// Tablespace da YPIOCA 	e Global Net
	TABLESPACE_A = 'TS_YPIOCA01';
	TABLESPACE_B = 'TS_YPIOCA02';

var
	FrmPrincipal: TFrmPrincipal;
	ABRIU_B: boolean;

implementation

{$R *.DFM}

Uses
	DBYpioca, StrFun, Zona, Rota, Veiculo, Contato_For, Cliente, Empresa, Global,
	Represen, Agente, Transp, Fornecedor, IPI, Moedas, Nat_Op, MensFun,
	Esp_Venda, Produto, Pedidos, Usuario, Login,
	PrestContas, Cond_pag, Aprov_Manual, Aprov_Auto,Nota_Fiscal,
	Prev_entrega,Gerar_mapa,Emissao_NF, ZonaGrupo, ConsRelVendas,ConsRelCobranca,
	Cheques, RelConsChequesDuplicatas , Manut_Dup, Perfil, Operacao, Perfil_Operacao,
	Dm_CadBasico, Segmento, PrestContasConf, Boleto, Nota_rpt, Conf_Embarque,
	Mapa_Manifesto, Emp_Parametros, Parametros, Centro_custo, Tipo_operacao,
	Unidade , Insumos , Requisicao, CancelaMapa, ConsRelFaturamento ,ContasPagar,
	Est_SolicitacaoRequisicao,Aprov_Requisicao,Cancela_Requisicao, CancelaContasAPagar,
	TransfereEstoque, ContaCorrente, Categoria, Orcamento,MovCCorrente,
	Aprov_Orcamento,Ord_Compra,BaixaCtPagar, Funcionarios, Prest_Servico,
	Adiantamento, Aplicacoes, Mov_Contabil,Entrada, AplicCotas, ConsRelFinanc,
	ResgateCotas, EstornoBaixa, ConsRelCompras, AltOrcamento, CancelOrdCompra,
	AltOrd_Compra, RelUnidadeRpt, RelTPORpt, RelCCustosRpt, MovimentacoesEspeciais,
	Despesas, Previsoes, TransfPrevisao,	FechaCaixa, RelFornecedoresRpt , ConsRelEstoque,
	Peq_Despesas, Libera_Solicitacao, Aprov_OrdCompra,SaldoEstoque,
	// Fase 3
	Servicos, Mov_Frete, Maquinas, Mov_Maquinas,Processo,Ordem_producao_A,
	Toneis,Mov_Tonel,Frota,Movimento_Frota,Ordem_producao_I,Conf_Producao_I,
	BaixaParcial;

procedure TFrmPrincipal.ButSairClick(Sender: TObject);
begin
	DB_Ypioca.DataBaseYpioca.Connected := False ;
	Close ;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin

	 // Temporariamente trabalha com tamanho pré definido
	 iWidthTot    := 640;
	 iHeightTot   := 500;
	 ImaFundo.Picture.LoadFromFile('fundomenuprinc.bmp') ;

	 ButFinanceiro.GlyphActive.LoadFromFile('btfinon.bmp') ;
	 ButFinanceiro.GlyphInActive.LoadFromFile('btfinoff.bmp') ;

	 ButCobranca.GlyphActive.LoadFromFile('btcobon.bmp') ;
	 ButCobranca.GlyphInActive.LoadFromFile('btcoboff.bmp') ;

	 ButCompras.GlyphActive.LoadFromFile('btcomon.bmp') ;
	 ButCompras.GlyphInActive.LoadFromFile('btcomoff.bmp') ;

	 ButFaturamento.GlyphActive.LoadFromFile('btfaton.bmp') ;
	 ButFaturamento.GlyphInActive.LoadFromFile('btfatoff.bmp') ;

	 ButCadastros.GlyphActive.LoadFromFile('btcadon.bmp') ;
	 ButCadastros.GlyphInActive.LoadFromFile('btcadoff.bmp') ;

	 ButProcJudiciais.GlyphActive.LoadFromFile('btjudon.bmp') ;
	 ButProcJudiciais.GlyphInActive.LoadFromFile('btjudoff.bmp') ;

	 ButVendas.GlyphActive.LoadFromFile('btvenon.bmp') ;
	 ButVendas.GlyphInActive.LoadFromFile('btvenoff.bmp') ;

	 ButFrota.GlyphActive.LoadFromFile('btfron.bmp') ;
	 ButFrota.GlyphInActive.LoadFromFile('btfroff.bmp') ;

	 ButProducao.GlyphActive.LoadFromFile('btprodon.bmp') ;
	 ButProducao.GlyphInActive.LoadFromFile('btprodoff.bmp') ;

	 ButProdAgricola.GlyphActive.LoadFromFile('btprodagon.bmp') ;
	 ButProdAgricola.GlyphInActive.LoadFromFile('btprodagoff.bmp') ;

	 ButEstoque.GlyphActive.LoadFromFile('BtEstOn.bmp') ;
	 ButEstoque.GlyphInActive.LoadFromFile('BtEstOff.bmp') ;

	 ButSair.GlyphActive.LoadFromFile('btsaion.bmp') ;
	 ButSair.GlyphInActive.LoadFromFile('btsaioff.bmp') ;

	DB_Ypioca.DataBaseYpioca.Connected := True ;

	 Glob_SetClientWidth(ClientWidth) ;
   Glob_SetClientHeight(ClientHeight) ;

	with QGeral do
	begin
		Close;
		SQL.Clear;
		SQL.Add('SELECT STATUS FROM USER_TABLESPACES WHERE TABLESPACE_NAME=:v0');
		Params[0].AsString := TABLESPACE_B;
		Open;
	end;
	if AnsiUpperCase(QGeral.Fields[0].AsString) = 'ONLINE' then
		ABRIU_B:=True
	else
		ABRIU_B:=False;
	QGeral.Close;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
	 Application.ProcessMessages ;
	 TimerLogin.Interval := 100 ;
	 TimerLogin.Enabled := True ;
	 ShortDateFormat := 'dd/mm/yy';
end;

procedure TFrmPrincipal.TimerLoginTimer(Sender: TObject);
Var
	 Status : Integer ;
begin
	 Screen.Cursor := crHourglass ;
	 TimerLogin.Enabled := False ;
	 FrmLogin := TFrmLogin.Create(Self) ;
	 Screen.Cursor := crDefault ;
	 FrmLogin.ShowModal ;
	 Status := FrmLogin.Tag ;
	 LabNomeEmpresa.Caption := FrmLogin.EdiEmpNome.Text ;
	 Labemp2.Caption := FrmLogin.EdiEmpNome.Text ;
	 FrmLogin.Close ;
	 If ( Status <> mrOk ) Then
       Close ;
end;

procedure TFrmPrincipal.MenuFroRotaClick(Sender: TObject);
begin
	 If Not Confirma_Acesso('Manut-Rot') Then
   Begin
     Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		 Exit ;
   End;
   Cursor := crHourGlass ;
   FrmRota := TFrmRota.Create(Self) ;
	 Application.ProcessMessages ;
	 Cursor := crDefault ;
	 FrmRota.ShowModal ;
	 FrmRota.Close ;
	 FrmRota.Release ;   
end;

procedure TFrmPrincipal.MenuFroVeiculosClick(Sender: TObject);
begin
	If Not Confirma_Acesso('Manut-Vei') Then
	 Begin
		 Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		 Exit ;
	 End;
	 FrmVeiculo := TFrmVeiculo.Create(Self) ;
	 FrmVeiculo.ShowModal ;
	 FrmVeiculo.Close ;
 	 FrmVeiculo.Release ;
end;

procedure TFrmPrincipal.MenuCadClientesClick(Sender: TObject);
begin
	 If Not Confirma_Acesso('Manut-Cli') Then
	 Begin
     Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
     Exit ;
   End;
	 FormCadCliente := TFormCadCliente.Create(Self) ;
   FormCadCliente.ShowModal ;
	 FormCadCliente.Close ;
	 FormCadCliente.Release;

end;

procedure TFrmPrincipal.MenuCadEmpresasClick(Sender: TObject);
begin

	 If Not Confirma_Acesso('Manut-Emp') Then
	 Begin
     Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		 Exit ;
   End;

	 FormCadEmpresa := TFormCadEmpresa.Create(Self) ;
   FormCadEmpresa.ShowModal ;
   FormCadEmpresa.Close ;
   FormCadEmpresa.Release;
end;

procedure TFrmPrincipal.MenuCadRepresentantesClick(Sender: TObject);
begin
	 If Not Confirma_Acesso('Manut-Rep') Then
   Begin
		 Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		 Exit ;
	 End;
   FrmRepresentante := TFrmRepresentante.Create(Self) ;
	 FrmRepresentante.ShowModal ;
	 FrmRepresentante.Close ;
   FrmRepresentante.Release;
end;

procedure TFrmPrincipal.MenuCadAgentesClick(Sender: TObject);
begin
	 If Not Confirma_Acesso('Manut-Age') Then
	 Begin
     Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
     Exit ;
	 End;
   FrmAgente := TFrmAgente.Create(Self) ;
   FrmAgente.ShowModal ;
   FrmAgente.Close ;
   FrmAgente.Release ;
end;

procedure TFrmPrincipal.MenuFroTranspClick(Sender: TObject);
begin
	 If Not Confirma_Acesso('Manut-Tra') Then
	 Begin
     Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		 Exit ;
   End;
   FormCadTransp := TFormCadTransp.Create(Self) ;
   FormCadTransp.ShowModal ;
	 FormCadTransp.Close ;
 	 FormCadTransp.Release;
end;

procedure TFrmPrincipal.MenuCadFornecedoresClick(Sender: TObject);
begin
	 If Not Confirma_Acesso('Manut-For') Then
	 Begin
       Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
			 Exit ;
   End;

	 FormCadFornecedor := TFormCadFornecedor.Create(Self) ;
	 FormCadFornecedor.ShowModal ;
	 FormCadFornecedor.Close ;
   FormCadFornecedor.Release;


end;

procedure TFrmPrincipal.MenuFinMoedasClick(Sender: TObject);
begin
	 If Not Confirma_Acesso('Moeda') Then
	 Begin
		 Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
     Exit ;
	 End;
   FrmMoedas := TFrmMoedas.Create(Self) ;
	 FrmMoedas.ShowModal ;
	 FrmMoedas.Close ;
	 FrmMoedas.Release ;
end;

procedure TFrmPrincipal.MenuCadUsuariosClick(Sender: TObject);
begin
	 If Not Confirma_Acesso('Manut-Usu') Then
   Begin
     Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
     Exit ;
   End;
	 FrmUsuario := TFrmUsuario.Create(Self) ;
	 FrmUsuario.ShowModal ;
	 FrmUsuario.Close ;
   FrmUsuario.Release ;
end;

procedure TFrmPrincipal.MenuFatCondPagClick(Sender: TObject);
begin
   If Not Confirma_Acesso('Manut-TabGenFin') Then
	 Begin
		 Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
     Exit ;
	 End;
   FrmCond_Pag := TFrmCond_Pag.Create(Self) ;
   FrmCond_Pag.ShowModal ;
	 FrmCond_Pag.Close ;
	 FrmCond_Pag.Release ;   
end;

procedure TFrmPrincipal.MenuVenPedAprManClick(Sender: TObject);
begin
	 If Not Confirma_Acesso('PedAprovManu') Then
	 Begin
		 Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
     Exit ;
	 End;
	 FrmAprov_Manual := TFrmAprov_Manual.Create(Self) ;
   FrmAprov_Manual.ShowModal ;
   FrmAprov_Manual.Close ;
   FrmAprov_Manual.Release ;
end;

procedure TFrmPrincipal.MenuVenPedAprAutClick(Sender: TObject);
begin
	 If Not Confirma_Acesso('PedAprovAuto') Then
	 Begin
		 Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		 Exit ;
   End;
   FrmAprov_Auto := TFrmAprov_Auto.Create(Self) ;
   FrmAprov_Auto.ShowModal ;
   FrmAprov_Auto.Close ;
   FrmAprov_Auto.Release;

end;

procedure TFrmPrincipal.MenuFatEmitNFMapaClick(Sender: TObject);
begin
   If Not Confirma_Acesso('Emit-NF') Then
	 Begin
		 Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
     Exit ;
	 End;
end;

procedure TFrmPrincipal.MenuVenMapaClick(Sender: TObject);
begin
   If Not Confirma_Acesso('Manut-Mapa') Then
	 Begin
		 Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		 Exit ;
	 End;
	 FrmGerar_Mapa := TFrmGerar_Mapa.Create(Self) ;
	 FrmGerar_Mapa.ShowModal ;
   FrmGerar_Mapa.Close ;
	 FrmGerar_Mapa.Release ;
end;

procedure TFrmPrincipal.MenuVenProvEntregClick(Sender: TObject);
begin
	 If Not Confirma_Acesso('PrevEnt') Then
	 Begin
     Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		 Exit ;
	 End;
	 FrmPrev_Entrega := TFrmPrev_Entrega.Create(Self) ;
	 FrmPrev_Entrega.ShowModal ;
   FrmPrev_Entrega.Close ;
   FrmPrev_Entrega.Release;
end;

procedure TFrmPrincipal.MenuFatEmiNotFisMapaClick(Sender: TObject);
begin
   If Not Confirma_Acesso('Emit-NF') Then
	 Begin
     Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		 Exit ;
	 End;
   FrmEmissao_NF := TFrmEmissao_NF.Create(Self) ;
   FrmEmissao_NF.ShowModal ;
	 FrmEmissao_NF.Close ;
   FrmEmissao_NF.Release;
end;

procedure TFrmPrincipal.MenuFatNatOpeClick(Sender: TObject);
begin
   If Not Confirma_Acesso('Manut-TabGenFin') Then
	 Begin
		 Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
     Exit ;
	 End;
   FrmNat_Op := TFrmNat_Op.Create(Self) ;
	 FrmNat_Op.ShowModal ;
	 FrmNat_Op.Close ;
   FrmNat_Op.Release ;
end;

procedure TFrmPrincipal.MenuVenPedCientesClick(Sender: TObject);
begin
   If Not Confirma_Acesso('Manut-PedCli') Then
   Begin
     Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		 Exit ;
   End;
	 FrmPedidos := TFrmPedidos.Create(Self) ;
	 FrmPedidos.ShowModal ;
	 FrmPedidos.Close ;
	 FrmPedidos.Release ;
end;

procedure TFrmPrincipal.MenuFroZonaClick(Sender: TObject);
begin
	 If Not Confirma_Acesso('Manut-Zon') Then
   Begin
     Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
     Exit ;
   End;
   FrmZona := TFrmZona.Create(Self) ;
	 FrmZona.ShowModal ;
   FrmZona.Close ;
	 FrmZona.Release ;
end;

procedure TFrmPrincipal.MenuFroGruZonasClick(Sender: TObject);
begin
   If Not Confirma_Acesso('Manut-Zon') Then
	 Begin
		 Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
     Exit ;
	 End;
   FrmZonaGrupo := TFrmZonaGrupo.Create(Self) ;
   FrmZonaGrupo.ShowModal ;
   FrmZonaGrupo.Close ;
   FrmZonaGrupo.Release ;
end;

procedure TFrmPrincipal.MenuVenConsultasClick(Sender: TObject);
begin
	 If (Not Confirma_Acesso('RelVendas')) and (Not Confirma_Acesso('RelVendasOp')) Then
	 Begin
     Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		 Exit ;
   End;
   FrmConRelVendas := TFrmConRelVendas.Create(Self) ;
	 FrmConRelVendas.ShowModal ;
   FrmConRelVendas.Close ;
   FrmConRelVendas.Release;
end;

procedure TFrmPrincipal.MenuFatManNotFiscaisClick(Sender: TObject);
begin
	 If Not Confirma_Acesso('Manut-NF') Then
   Begin
		 Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		 Exit ;
   End;
   FrmNota_Fiscal := TFrmNota_Fiscal.Create(Self) ;
   FrmNota_Fiscal.ShowModal ;
   FrmNota_Fiscal.Close ;
	 FrmNota_Fiscal.Release;
end;

procedure TFrmPrincipal.MenuCadPerfilClick(Sender: TObject);
begin
	 If Not Confirma_Acesso('Manut-Usu') Then
	 Begin
     Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
     Exit ;
	 End;
   FrmPerfil := TFrmPerfil.Create(Self) ;
   FrmPerfil.ShowModal ;
   FrmPerfil.Close     ;
   FrmPerfil.Release   ;
end;

procedure TFrmPrincipal.MenuCadOperacaoClick(Sender: TObject);
begin
	 If Not Confirma_Acesso('Manut-Usu') Then
	 Begin
		 Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		 Exit ;
	 End;
   FrmOperacao := TFrmOperacao.Create(Self) ;
	 FrmOperacao.ShowModal ;
	 FrmOperacao.Close     ;
   FrmOperacao.Release   ;
end;

procedure TFrmPrincipal.MenuCadPerfilOperacaoClick(Sender: TObject);
begin
   If Not Confirma_Acesso('Manut-Usu') Then
   Begin
		 Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
     Exit ;
   End;
	 FrmPerfilOperacao := TFrmPerfilOperacao.Create(Self) ;
   FrmPerfilOperacao.ShowModal ;
	 FrmPerfilOperacao.Close     ;
	 FrmPerfilOperacao.Release   ;

end;

Function TFrmPrincipal.Confirma_Acesso( ItemSelecionado : String ):Boolean ;
Var
   i : Integer ;
Begin
	 Result := False ;
	 For i:=0 To Length(Glob_GetUserOpeLib)-1 Do
	 Begin
			 If ( Glob_GetUserOpeLib[i] = ItemSelecionado ) Then
			 Begin
           Result := True ;
					 Break ;
       End ;
   End ;
End;

procedure TFrmPrincipal.MenuCadSegCliClick(Sender: TObject);
begin
	 If Not Confirma_Acesso('Manut-Cli') Then
   Begin
     Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		 Exit ;
	 End;
   FrmSegmento := TFrmSegmento.Create(Self) ;
	 FrmSegmento.ShowModal ;
   FrmSegmento.Close     ;
   FrmSegmento.Release   ;
end;

procedure TFrmPrincipal.MenuFatEmitBolClick(Sender: TObject);
begin
	 If Not Confirma_Acesso('ImpBoleto') Then
   Begin
		 Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		 Exit ;
   End;
	 FrmBoleto := TFrmBoleto.Create(Self) ;
   FrmBoleto.ShowModal ;
   FrmBoleto.Close ;
	 FrmBoleto.Release ;
end;

procedure TFrmPrincipal.MenuCadLoginClick(Sender: TObject);
begin
	 TimerLogin.Enabled := True ;
end;

procedure TFrmPrincipal.MenuVenConfEmbClick(Sender: TObject);
begin
	 Exit ;
   If Not Confirma_Acesso('ConfEmb') Then
   Begin
		 Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		 Exit ;
	 End;
	 FrmConf_embarq := TFrmConf_embarq.Create(Self) ;
	 FrmConf_embarq.ShowModal ;
	 FrmConf_embarq.Close ;
	 FrmConf_embarq.Release ;
end;

procedure TFrmPrincipal.MenuVenMapaManifestoClick(Sender: TObject);
begin
	 If Not Confirma_Acesso('MapaManifesto') Then
	 Begin
     Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
     Exit ;
	 End;
   FrmMapa_Manifesto := TFrmMapa_Manifesto.Create(Self) ;
   FrmMapa_Manifesto.ShowModal ;
	 FrmMapa_Manifesto.Close ;
	 FrmMapa_Manifesto.Release ;
end;

procedure TFrmPrincipal.MenuCadParEmpClick(Sender: TObject);
begin
	If Not Confirma_Acesso('Par-Emp') Then
	 Begin
		 Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		 Exit ;
	 End;
	 FrmEmpParametros := TFrmEmpParametros.Create(Self) ;
	 FrmEmpParametros.ShowModal ;
   FrmEmpParametros.Close ;
   FrmEmpParametros.Release ;
end;

procedure TFrmPrincipal.MovimentaodeDuplicatas1Click(Sender: TObject);
begin
	 If Not Confirma_Acesso('MovDup') Then
	 Begin
     Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		 Exit ;
	 End;
   FrmManut_Dup := TFrmManut_Dup.Create(Self) ;
   FrmManut_Dup.ShowModal ;
	 FrmManut_Dup.Close ;
   FrmManut_Dup.Release ;
end;

procedure TFrmPrincipal.PrestaodeContas1Click(Sender: TObject);
begin
	 If Not Confirma_Acesso('PrestConta') Then
	 Begin
		 Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
     Exit ;
	 End;
	 FrmPrestContas := TFrmPrestContas.Create(Self) ;
   FrmPrestContas.ShowModal ;
   FrmPrestContas.Close ;
   FrmPrestContas.Release;
end;

procedure TFrmPrincipal.MenuCadParGerClick(Sender: TObject);
begin
   If Not Confirma_Acesso('ParGer') Then
	 Begin
		 Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
     Exit ;
	 End;
	 FrmParametros := TFrmParametros.Create(Self) ;
	FrmParametros.ShowModal ;
	FrmParametros.Close ;
  FrmParametros.Release ;
end;

procedure TFrmPrincipal.MenuVenVisPreConClick(Sender: TObject);
begin
	If Not Confirma_Acesso('VisuPrestContas') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;
	FrmPrestContasConf := TFrmPrestContasConf.Create(Self) ;
	FrmPrestContasConf.Tag := 1 ;
	FrmPrestContasConf.ShowModal ;
	FrmPrestContasConf.Close     ;
	FrmPrestContasConf.Release   ;
end;

procedure TFrmPrincipal.MenuCobMovCheClick(Sender: TObject);
begin
	If Not Confirma_Acesso('MovChe') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;
	FrmCheques := TFrmCheques.Create(Self) ;
	FrmCheques.ShowModal ;
	FrmCheques.Close ;
	FrmCheques.Release ;
end;

procedure TFrmPrincipal.MenuFinTpoClick(Sender: TObject);
begin
	If Not Confirma_Acesso('Manut-TipoOp') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;
	FrmTipoOp := TFrmTipoOp.Create(Self) ;
	FrmTipoOp.ShowModal ;
	FrmTipoOp.Close     ;
  FrmTipoOp.Release   ;
end;

procedure TFrmPrincipal.MenuCobConsultasClick(Sender: TObject);
begin
	 If Not Confirma_Acesso('RelCobranca') Then
	 Begin
		 Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		 Exit ;
	 End;
	 FrmConsRelCobranca := TFrmConsRelCobranca.Create(Self) ;
	 FrmConsRelCobranca.ShowModal ;
	 FrmConsRelCobranca.Close ;
   FrmConsRelCobranca.Release ;
end;

procedure TFrmPrincipal.ButMinimizarClick(Sender: TObject);
begin
	FrmPrincipal.WindowState:=wsMinimized;
end;

procedure TFrmPrincipal.ConfirmarPrestacaoContasClick(Sender: TObject);
begin
	If Not Confirma_Acesso('ConfPrestContas') Then
	 Begin
		 Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		 Exit ;
	 End;
	 FrmPrestContasConf := TFrmPrestContasConf.Create(Self) ;
	 FrmPrestContasConf.ShowModal ;
	 FrmPrestContasConf.Close     ;
	 FrmPrestContasConf.Release   ;
end;

procedure TFrmPrincipal.MenuComprasUnidadeClick(Sender: TObject);
begin
	If Not Confirma_Acesso('Manut-Unid') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;
	FrmUnidade := TFrmUnidade.Create(Self) ;
	FrmUnidade.ShowModal ;
	FrmUnidade.Close     ;
	FrmUnidade.Release   ;
end;

procedure TFrmPrincipal.MenuComprasCentroCustoClick(Sender: TObject);
begin
	If Not Confirma_Acesso('Manut-CCusto') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;
 	FrmCCusto := TFrmCCusto.Create(Self) ;
	FrmCCusto.ShowModal ;
	FrmCCusto.Close     ;
	FrmCCusto.Release   ;
end;

procedure TFrmPrincipal.MenuComprasInsumosClick(Sender: TObject);
begin
	If Not Confirma_Acesso('Insumo') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
	  Exit ;
	End;
	FrmInsumos := TFrmInsumos.Create(Self) ;
	FrmInsumos.ShowModal ;
	FrmInsumos.Close     ;
	FrmInsumos.Release   ;
end;

procedure TFrmPrincipal.MenuVenCancMapaClick(Sender: TObject);
begin
	 If Not Confirma_Acesso('CancelaMapa') Then
	 Begin
		 Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
     Exit ;
   End;
   FrmCancelaMapa := TFrmCancelaMapa.Create(Self) ;
   FrmCancelaMapa.ShowModal ;
   FrmCancelaMapa.Close ;
	 FrmCancelaMapa.Release ;
end;

procedure TFrmPrincipal.MenuFatConsultasClick(Sender: TObject);
begin
	 If Not Confirma_Acesso('RelFat') Then
	 Begin
		 Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		 Exit ;
	 End;
	 FrmConsRelFaturamento := TFrmConsRelFaturamento.Create(Self) ;
	 FrmConsRelFaturamento.ShowModal ;
	 FrmConsRelFaturamento.Close ;
	 FrmConsRelFaturamento.Release ;
end;

procedure TFrmPrincipal.MenuEstoqueReqSolicClick(Sender: TObject);
begin
	If Not Confirma_Acesso('Baixa-Req') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;

	FrmEstSolicitacao := TFrmEstSolicitacao.Create(Self) ;
	FrmEstSolicitacao.ShowModal ;
	FrmEstSolicitacao.Close     ;
	FrmEstSolicitacao.Release   ;

end;

procedure TFrmPrincipal.CancelaCtPagarClick(Sender: TObject);
begin
	If Not Confirma_Acesso('Canc-CPagar') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;

	FrmCancelaContasAPagar := TFrmCancelaContasAPagar.Create(Self) ;
	FrmCancelaContasAPagar.ShowModal ;
	FrmCancelaContasAPagar.Close     ;
	FrmCancelaContasAPagar.Release   ;

end;

procedure TFrmPrincipal.MenuEstoqueTransferenciaClick(Sender: TObject);
begin
	If Not Confirma_Acesso('Transf-Estoq') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;

	FrmTransfereEstoque := TFrmTransfereEstoque.Create(Self) ;
	FrmTransfereEstoque.ShowModal ;
	FrmTransfereEstoque.Close     ;
	FrmTransfereEstoque.Release   ;

end;

procedure TFrmPrincipal.BaixaCtPagarClick(Sender: TObject);
begin
	If Not Confirma_Acesso('Baixa-CPagar') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;  

	FrmBaixaCtPagar := TFrmBaixaCTPagar.Create(Self) ;
	FrmBaixaCtPagar.ShowModal ;
	FrmBaixaCtPagar.Close     ;
	FrmBaixaCtPagar.Release   ;

end;

procedure TFrmPrincipal.MenuComprasCategoriaClick(Sender: TObject);
begin
	If Not Confirma_Acesso('Categoria') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;

	FrmCategoria := TFrmCategoria.Create(Self) ;
	FrmCategoria.ShowModal ;
	FrmCategoria.Close     ;
	FrmCategoria.Release   ;

end;

procedure TFrmPrincipal.CadastroCtPagarClick(Sender: TObject);
begin
	If Not Confirma_Acesso('Manut-CPagar') Then
	 Begin
		 Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		 Exit ;
	 End;
	 FrmContaPagar := TFrmContaPagar.Create(Self) ;
	 FrmContaPagar.ShowModal ;
	 FrmContaPagar.Close ;
	 FrmContaPagar.Release ;
end;

procedure TFrmPrincipal.MovimentoCCorrenteClick(Sender: TObject);
begin
	If Not Confirma_Acesso('Manut-MovFin') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;

	FrmMovCCorrente := TFrmMovCCorrente.Create(Self) ;
	FrmMovCCorrente.ShowModal ;
	FrmMovCCorrente.Close     ;
	FrmMovCCorrente.Release   ;
end;

procedure TFrmPrincipal.MenuCadFuncionariosClick(Sender: TObject);
begin
	If Not Confirma_Acesso('Manut-Func') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;
	FrmFuncionarios := TFrmFuncionarios.Create(Self) ;
	FrmFuncionarios.ShowModal ;
	FrmFuncionarios.Close     ;
	FrmFuncionarios.Release   ;

end;

procedure TFrmPrincipal.Adiantamentos1Click(Sender: TObject);
begin
	If Not Confirma_Acesso('Adiant') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;

	FrmAdiantamento := TFrmAdiantamento.Create(Self) ;
	FrmAdiantamento.ShowModal ;
	FrmAdiantamento.Close     ;
	FrmAdiantamento.Release   ;

end;

procedure TFrmPrincipal.PrestServio1Click(Sender: TObject);
begin
	If Not Confirma_Acesso('Manut-Serv') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;
	FrmPrest_Servico := TFrmPrest_Servico.Create(Self) ;
	FrmPrest_Servico.ShowModal ;
	FrmPrest_Servico.Close     ;
	FrmPrest_Servico.Release;
end;

procedure TFrmPrincipal.ContaCorrente1Click(Sender: TObject);
begin
		If Not Confirma_Acesso('CCorrente') Then
		Begin
			Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
			Exit ;
		End;

	FrmContaCorrente := TFrmContaCorrente.Create(Self) ;
	FrmContaCorrente.ShowModal ;
	FrmContaCorrente.Close     ;
end;

procedure TFrmPrincipal.AplicDiaria1Click(Sender: TObject);
begin
		If Not Confirma_Acesso('Aplic-Dia') Then
		Begin
			Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
			Exit ;
		End;

	FrmAplicacoes := TFrmAplicacoes.Create(Self) ;
	FrmAplicacoes.ShowModal ;
	FrmAplicacoes.Close     ;
	FrmAplicacoes.Release;
end;

procedure TFrmPrincipal.MenuFinMovContabilClick(Sender: TObject);
begin
	If Not Confirma_Acesso('Mov-Contab') Then
		Begin
			Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
			Exit ;
		End;

	FrmMovContabil := TFrmMovContabil.Create(Self) ;
	FrmMovContabil.ShowModal ;
	FrmMovContabil.Close     ;
	FrmMovContabil.Release;
end;

procedure TFrmPrincipal.MenuComprasEntradasClick(Sender: TObject);
begin
	If Not Confirma_Acesso('Entrada') Then
		Begin
			Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
			Exit ;
		End;

	FrmEntrada := TFrmEntrada.Create(Self) ;
	FrmEntrada.ShowModal ;
	FrmEntrada.Close     ;
	FrmEntrada.Release;
end;

procedure TFrmPrincipal.AplicaLongoPrrazo1Click(Sender: TObject);
begin
	If Not Confirma_Acesso('Aplic-Cotas') Then
		Begin
			Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
			Exit ;
		End;

	FrmAplicCotas := TFrmAplicCotas.Create(Self) ;
	FrmAplicCotas.ShowModal ;
	FrmAplicCotas.Close     ;
	FrmAplicCotas.Release;

end;

procedure TFrmPrincipal.MenuFinConsultasClick(Sender: TObject);
begin
	If (Not Confirma_Acesso('RelFinanc')) and (Not Confirma_Acesso('RelFinancOp'))  Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;

	FrmConsRelFinanc := TFrmConsRelFinanc.Create(Self) ;
	FrmConsRelFinanc.ShowModal ;
	FrmConsRelFinanc.Close ;
	FrmConsRelFinanc.Release;
end;

procedure TFrmPrincipal.ResgatePorCotas1Click(Sender: TObject);
begin
	If Not Confirma_Acesso('Resg-Cotas') Then
		Begin
			Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
			Exit ;
		End;

	FrmResgateCotas := TFrmResgateCotas.Create(Self) ;
	FrmResgateCotas.ShowModal ;
	FrmResgateCotas.Close     ;
	FrmResgateCotas.Release;

end;

procedure TFrmPrincipal.EspecificaoDeVendas1Click(Sender: TObject);
begin
	If Not Confirma_Acesso('Manut-TabGenFin') Then
	 Begin
     Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		 Exit ;
	 End;
   FrmEsp_Venda := TFrmEsp_Venda.Create(Self) ;
   FrmEsp_Venda.ShowModal ;
	 FrmEsp_Venda.Close ;
   FrmEsp_Venda.Release ;

end;

procedure TFrmPrincipal.Produtos1Click(Sender: TObject);
begin
	 If Not Confirma_Acesso('Manut-TabGenFin') Then
	 Begin
		 Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		 Exit ;
	 End;
	 FrmIPI := TFrmIPI.Create(Self) ;
	 FrmIPI.ShowModal ;
	 FrmIPI.Close ;
	 FrmIPI.Release;
end;

procedure TFrmPrincipal.Produtos2Click(Sender: TObject);
begin
	If Not Confirma_Acesso('Manut-Pro') Then
	 Begin
		 Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		 Exit ;
	 End;
	 FrmProduto := TFrmProduto.Create(Self) ;
	 FrmProduto.ShowModal ;
	 FrmProduto.Close ;
	 FrmProduto.Release;
end;

procedure TFrmPrincipal.Estorno1Click(Sender: TObject);
begin
	If Not Confirma_Acesso('Est-CPagar') Then
	 Begin
		 Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		 Exit ;
	 End;

	 FrmEstornoBaixa := TFrmEstornoBaixa.Create(Self) ;
	 FrmEstornoBaixa.ShowModal ;
	 FrmEstornoBaixa.Close ;
	 FrmEstornoBaixa.Release;
end;

procedure TFrmPrincipal.MenuComprasReqManutClick(Sender: TObject);
begin
	If Not Confirma_Acesso('Manut-Req') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;
	FrmRequisicao := TFrmRequisicao.Create(Self) ;
	FrmRequisicao.ShowModal ;
	FrmRequisicao.Close     ;
	FrmRequisicao.Release   ;
end;

procedure TFrmPrincipal.MenuComprasReqCancClick(Sender: TObject);
begin
	If Not Confirma_Acesso('Canc-Req') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;
	FrmCancela_Requisicao := TFrmCancela_Requisicao.Create(Self) ;
	FrmCancela_Requisicao.ShowModal ;
	FrmCancela_Requisicao.Close     ;
	FrmCancela_Requisicao.Release   ;

end;

procedure TFrmPrincipal.MenuComprasReqAprovClick(Sender: TObject);
begin
	If Not Confirma_Acesso('Aprov-Req') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;
	FrmAprov_Requisicao := TFrmAprov_Requisicao.Create(Self) ;
	FrmAprov_Requisicao.ShowModal ;
	FrmAprov_Requisicao.Close     ;
	FrmAprov_Requisicao.Release   ;

end;

procedure TFrmPrincipal.MenuComprasOrcManutClick(Sender: TObject);
begin
	If Not Confirma_Acesso('Manut-Orc') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;

	FrmOrcamento := TFrmOrcamento.Create(Self) ;
	FrmOrcamento.ShowModal ;
	FrmOrcamento.Close     ;
	FrmOrcamento.Release   ;

end;

procedure TFrmPrincipal.MenuComprasOrcAprovClick(Sender: TObject);
begin
	If Not Confirma_Acesso('Aprov-Orc') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;

	FrmAprov_Orcamento := TFrmAprov_Orcamento.Create(Self) ;
	FrmAprov_Orcamento.Tag := 1  ;
	FrmAprov_Orcamento.ShowModal ;
	FrmAprov_Orcamento.Close     ;
	FrmAprov_Orcamento.Release   ;
end;

procedure TFrmPrincipal.MenuComprasOrcAprovDirClick(Sender: TObject);
begin
	If Not Confirma_Acesso('Aprov-Orc-Dir') Then
		 Begin
		 Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		 Exit ;
	 End;

	FrmAprov_Orcamento := TFrmAprov_Orcamento.Create(Self) ;
	FrmAprov_Orcamento.Tag := 2  ;
	FrmAprov_Orcamento.ShowModal ;
	FrmAprov_Orcamento.Close     ;
	FrmAprov_Orcamento.Release   ;

end;

procedure TFrmPrincipal.MenuCompraConsultasClick(Sender: TObject);
begin
	If Not Confirma_Acesso('RelCompra') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;

	FrmConsRelCompras := TFrmConsRelCompras.Create(Self) ;
	FrmConsRelCompras.ShowModal ;
	FrmConsRelCompras.Close     ;

end;

procedure TFrmPrincipal.MenuComprasOrcAlteraClick(Sender: TObject);
begin
	If Not Confirma_Acesso('Alt-Orc') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;

	FrmAltOrcamento := TFrmAltOrcamento.Create(Self) ;
	FrmAltOrcamento.ShowModal ;
	FrmAltOrcamento.Close     ;
	FrmAltOrcamento.Release   ;
end;

procedure TFrmPrincipal.Manutencao1Click(Sender: TObject);
begin
	If Not Confirma_Acesso('Manut-Ord') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;

	FrmOrd_Compra := TFrmOrd_Compra.Create(Self) ;
	FrmOrd_Compra.ShowModal ;
	FrmOrd_Compra.Close     ;
	FrmOrd_Compra.Release   ;

end;

procedure TFrmPrincipal.Cancela1Click(Sender: TObject);
begin
	If Not Confirma_Acesso('Canc-Ord') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;

	FrmCancela_Compra := TFrmCancela_Compra.Create(Self) ;
	FrmCancela_Compra.ShowModal ;
	FrmCancela_Compra.Close     ;
	FrmCancela_Compra.Release   ;

end;

procedure TFrmPrincipal.MenuComprasOrdemdeCompraAlteracaoClick(
	Sender: TObject);
begin
	If Not Confirma_Acesso('Alt-Ord') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;

	FrmAltOrdCompra := TFrmAltOrdCompra.Create(Self) ;
	FrmAltOrdCompra.ShowModal ;
	FrmAltOrdCompra.Close     ;
	FrmAltOrdCompra.Release   ;
end;

procedure TFrmPrincipal.MovEspeciais2Click(Sender: TObject);
begin
	If Not Confirma_Acesso('Mov-Espec') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;

	FrmMovimentacoesEspeciais := TFrmMovimentacoesEspeciais.Create(Self) ;
	FrmMovimentacoesEspeciais.ShowModal ;
	FrmMovimentacoesEspeciais.Close     ;
	FrmMovimentacoesEspeciais.Release   ;
end;

procedure TFrmPrincipal.Despesas1Click(Sender: TObject);
begin
	If Not Confirma_Acesso('Despesa') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;

	FrmDespesas := TFrmDespesas.Create(Self) ;
	FrmDespesas.ShowModal ;
	FrmDespesas.Close     ;
	FrmDespesas.Release   ;
end;

procedure TFrmPrincipal.Movimentao1Click(Sender: TObject);
begin
	If Not Confirma_Acesso('Manut-Prev') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;

	FrmPrevisao := TFrmPrevisao.Create(Self) ;
	FrmPrevisao.ShowModal ;
	FrmPrevisao.Close     ;
	FrmPrevisao.Release   ;
end;

procedure TFrmPrincipal.Transferencia1Click(Sender: TObject);
begin
	If Not Confirma_Acesso('Transf-Prev') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;

	FrmTransfPrevisao := TFrmTransfPrevisao.Create(Self) ;
	FrmTransfPrevisao.ShowModal ;
	FrmTransfPrevisao.Close     ;
	FrmTransfPrevisao.Release   ;
end;

procedure TFrmPrincipal.Fechamento1Click(Sender: TObject);
begin
	If Not Confirma_Acesso('Fecha-Caixa') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;

	FrmFechaCaixa := TFrmFechaCaixa.Create(Self) ;
	FrmFechaCaixa.ShowModal ;
	FrmFechaCaixa.Close     ;
	FrmFechaCaixa.Release   ;
end;

procedure TFrmPrincipal.Unidade2Click(Sender: TObject);
begin
	If Not Confirma_Acesso('RelCad') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;
	frm_RelUnidade := Tfrm_RelUnidade.Create(Self) ;
	frm_RelUnidade.query1.Open;
	frm_RelUnidade.qr1.preview ;
	frm_RelUnidade.query1.close;
	frm_RelUnidade.Close ;
	frm_RelUnidade.Release;
end;

procedure TFrmPrincipal.Fornecedores2Click(Sender: TObject);
begin
	If Not Confirma_Acesso('RelCad') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;
	frm_RelFornecedor := Tfrm_RelFornecedor.Create(Self) ;
	frm_RelFornecedor.query1.Open;
	frm_RelFornecedor.qr1.preview ;
	frm_RelFornecedor.query1.close;
	frm_RelFornecedor.Close ;
end;

procedure TFrmPrincipal.CentrodeCusto2Click(Sender: TObject);
begin
	If Not Confirma_Acesso('RelCad') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;
	frm_RelCCusto := Tfrm_RelCCusto.Create(Self) ;
	frm_RelCCusto.query1.Open;
	frm_RelCCusto.qr1.preview ;
	frm_RelCCusto.query1.close;
	frm_RelCCusto.Close ;
end;


procedure TFrmPrincipal.TipodeOperao2Click(Sender: TObject);
begin
	If Not Confirma_Acesso('RelCad') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;
	frm_RelTPO := Tfrm_RelTPO.Create(Self) ;
	frm_RelTPO.query1.Open;
	frm_RelTPO.qr1.preview ;
	frm_RelTPO.query1.close;
	frm_RelTPO.Close ;
	frm_RelTPO.Release;
end;

procedure TFrmPrincipal.MnuProdAgricolaServicosClick(Sender: TObject);
begin
	If Not Confirma_Acesso('Servico') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;
	FrmServicos := TFrmServicos.Create(Self);
	FrmServicos.ShowModal;
	FrmServicos.Close;
	FrmServicos.Release;
end;

procedure TFrmPrincipal.MnuProdAgricolaFreteClick(Sender: TObject);
begin
	If Not Confirma_Acesso('Frete') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;
	FrmMov_Frete := TFrmMov_Frete.Create(Self);
	FrmMov_Frete.ShowModal;
	FrmMov_Frete.Close;
	FrmMov_Frete.Release;
end;

procedure TFrmPrincipal.MnuProdAgricolaMaquinasClick(Sender: TObject);
begin
	If Not Confirma_Acesso('Maquina') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;
	FrmMaquinas := TFrmMaquinas.Create(Self);
	FrmMaquinas.ShowModal;
	FrmMaquinas.Close;
	FrmMaquinas.Release;
end;

procedure TFrmPrincipal.ConsultaseRelatrios1Click(Sender: TObject);
begin
	If Not Confirma_Acesso('RelEstoque') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;
	FrmConsRelEstoque := TFrmConsRelEstoque.Create(Self) ;
	FrmConsRelEstoque.ShowModal ;
	FrmConsRelEstoque.Close     ;
end;

procedure TFrmPrincipal.MnuProdAgricolaMovMaqClick(Sender: TObject);
begin
	If Not Confirma_Acesso('MovMaq') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;
	FrmMov_Maquinas := TFrmMov_Maquinas.Create(Self);
	FrmMov_Maquinas.ShowModal;
	FrmMov_Maquinas.Close;
	FrmMov_Maquinas.Release;
end;

procedure TFrmPrincipal.MnuProdAgricolaPrestMaquinasClick(Sender: TObject);
begin
	If Not Confirma_Acesso('Manut-Serv') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;
	FrmPrest_Servico := TFrmPrest_Servico.Create(Self);
	FrmPrest_Servico.ShowModal;
	FrmPrest_Servico.Close;
	FrmPrest_Servico.Release;
end;

procedure TFrmPrincipal.Manuteno1Click(Sender: TObject);
begin
	If Not Confirma_Acesso('PeqDesp') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;
	FrmPeqDesp := TFrmPeqDesp.Create(Self);
	FrmPeqDesp.Tag := 1; // manutencao
	FrmPeqDesp.ShowModal;
	FrmPeqDesp.Close;
	FrmPeqDesp.Release;
end;

procedure TFrmPrincipal.Aprovao1Click(Sender: TObject);
begin
	If Not Confirma_Acesso('AprovPeqDesp') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;
	FrmPeqDesp := TFrmPeqDesp.Create(Self);
	FrmPeqDesp.Tag := 2; // aprovacao/cancelamento
	FrmPeqDesp.ShowModal;
	FrmPeqDesp.Close;
	FrmPeqDesp.Release;
end;

procedure TFrmPrincipal.Baixa1Click(Sender: TObject);
begin
	If Not Confirma_Acesso('BaixPeqDesp') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;
	FrmPeqDesp := TFrmPeqDesp.Create(Self);
	FrmPeqDesp.Tag := 3; // baixa
	FrmPeqDesp.ShowModal;
	FrmPeqDesp.Close;
	FrmPeqDesp.Release;
end;

procedure TFrmPrincipal.LiberacaoOrcamentoClick(Sender: TObject);
begin
	If Not Confirma_Acesso('Aprov-Rec') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;
	FrmLibera_Solicitacao := TFrmLibera_Solicitacao.Create(Self) ;
	FrmLibera_Solicitacao.ShowModal ;
	FrmLibera_Solicitacao.Close     ;
	FrmLibera_Solicitacao.Release   ;
end;

procedure TFrmPrincipal.AprovacaoClick(Sender: TObject);
begin
	If Not Confirma_Acesso('AprovOrd') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;
	FrmAprov_OrdCompra := TFrmAprov_OrdCompra.Create(Self) ;
	FrmAprov_OrdCompra.ShowModal ;
	FrmAprov_OrdCompra.Close     ;
	FrmAprov_OrdCompra.Release   ;
end;

procedure TFrmPrincipal.FechaEstoqueClick(Sender: TObject);
begin
	If Not Confirma_Acesso('Fec-Saldo') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;
	FrmSaldoEstoque := TFrmSaldoEstoque.Create(Self) ;
	FrmSaldoEstoque.ShowModal ;
	FrmSaldoEstoque.Close     ;
	FrmSaldoEstoque.Release   ;
end;

procedure TFrmPrincipal.Processos1Click(Sender: TObject);
begin
	If Not Confirma_Acesso('Processo') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;
	FrmProcesso := TFrmProcesso.Create(Self) ;
	FrmProcesso.ShowModal ;
	FrmProcesso.Close     ;
	FrmProcesso.Release   ;
end;

procedure TFrmPrincipal.Manutencao2Click(Sender: TObject);
begin
	If Not Confirma_Acesso('Manut-Agr') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;

	FrmProdAgric := TFrmProdAgric.Create(Self) ;
	FrmProdAgric.Tag := 1;
	FrmProdAgric.ShowModal ;
	FrmProdAgric.Close     ;
	FrmProdAgric.Release   ;
end;

procedure TFrmPrincipal.Movimentacao1Click(Sender: TObject);
begin
	If Not Confirma_Acesso('Mov-Agr') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;
	FrmProdAgric := TFrmProdAgric.Create(Self) ;
	FrmProdAgric.Tag := 2;
	FrmProdAgric.ShowModal ;
	FrmProdAgric.Close     ;
	FrmProdAgric.Release   ;
end;

procedure TFrmPrincipal.Finalizacao1Click(Sender: TObject);
begin
	If Not Confirma_Acesso('Final-Agr') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;
	FrmProdAgric := TFrmProdAgric.Create(Self) ;
	FrmProdAgric.Tag := 3;
	FrmProdAgric.ShowModal ;
	FrmProdAgric.Close     ;
	FrmProdAgric.Release   ;
end;

procedure TFrmPrincipal.Toneis1Click(Sender: TObject);
begin
	If Not Confirma_Acesso('Toneis') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;
	FrmTonel := TFrmTonel.Create(Self) ;
	FrmTonel.ShowModal ;
	FrmTonel.Close     ;
	FrmTonel.Release   ;
end;

procedure TFrmPrincipal.MovimentodeToneis1Click(Sender: TObject);
begin
	If Not Confirma_Acesso('Mov-Tonel') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;
	FrmMov_Tonel := TFrmMov_Tonel.Create(Self) ;
	FrmMov_Tonel.ShowModal ;
	FrmMov_Tonel.Close     ;
	FrmMov_Tonel.Release   ;
end;

procedure TFrmPrincipal.Frota1Click(Sender: TObject);
begin
	If Not Confirma_Acesso('Frota') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;
	FrmFrota := TFrmFrota.Create(Self) ;
	FrmFrota.ShowModal ;
	FrmFrota.Close     ;
	FrmFrota.Release   ;
end;

procedure TFrmPrincipal.MovimentoFrota1Click(Sender: TObject);
begin
	If Not Confirma_Acesso('Mov-Frota') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;
	FrmMovimento_Frota := TFrmMovimento_Frota.Create(Self) ;
	FrmMovimento_Frota.Tag := 1  ; // Abertura
	FrmMovimento_Frota.ShowModal ;
	FrmMovimento_Frota.Close     ;
	FrmMovimento_Frota.Release   ;
end;

procedure TFrmPrincipal.Producao1Click(Sender: TObject);
begin
	If Not Confirma_Acesso('Manut-Ind') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;
	FrmProdInd := TFrmProdInd.Create(Self) ;
	FrmProdInd.ShowModal ;
	FrmProdInd.Close     ;
	FrmProdInd.Release   ;
end;

procedure TFrmPrincipal.ConfirmacaodeProducao1Click(Sender: TObject);
begin
	If Not Confirma_Acesso('Conf-Ind') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;
	FrmConfProdInd := TFrmConfProdInd.Create(Self) ;
	FrmConfProdInd.ShowModal ;
	FrmConfProdInd.Close     ;
	FrmConfProdInd.Release   ;
end;

procedure TFrmPrincipal.BaixaParcial1Click(Sender: TObject);
begin
	If Not Confirma_Acesso('BxPar-CPag') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;
	FrmBaixaParcial := TFrmBaixaParcial.Create(Self) ;
	FrmBaixaParcial.ShowModal ;
	FrmBaixaParcial.Close     ;
	FrmBaixaParcial.Release   ;
end;

procedure TFrmPrincipal.MovimentoFrota2Click(Sender: TObject);
begin
	If Not Confirma_Acesso('Mov-Frota') Then
	Begin
		Mens_MensErro('Operacao inválida para Perfil do Usuário.') ;
		Exit ;
	End;
	FrmMovimento_Frota := TFrmMovimento_Frota.Create(Self) ;
	FrmMovimento_Frota.Tag := 2  ; // Encerramento
	FrmMovimento_Frota.ShowModal ;
	FrmMovimento_Frota.Close     ;
	FrmMovimento_Frota.Release   ;
end;

End.

