program BradyBrazil;

uses
  System.IOUtils,
  System.SysUtils,
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  Windows,
  uUtils in 'uUtils.pas',
  uBrady in 'uBrady.pas' {Fr_Brady},
  uRelatorioPreco in 'uRelatorioPreco.pas' {Fr_RelatorioPreco},
  uRelatorioPartNumber in 'uRelatorioPartNumber.pas' {Fr_RelatorioPartNumber},
  uCadastroSite in 'uCadastroSite.pas' {Fr_CadastroSite},
  uMainSplashScreen in 'uMainSplashScreen.pas' {Fr_MainSplashScreen},
  AsyncCalls in 'AsyncCalls.pas',
  uCadastroCelula in 'uCadastroCelula.pas' {Fr_CadastroCelula},
  uCadastroMaquina in 'uCadastroMaquina.pas' {Fr_CadastroMaquina},
  uCadastroAtividade in 'uCadastroAtividade.pas' {Fr_CadastroAtividade},
  uCadastroApontamento in 'uCadastroApontamento.pas' {Fr_CadastroApontamento},
  uAddObservacao in 'uAddObservacao.pas' {Fr_AddObservacao},
  uCadastroOperador in 'uCadastroOperador.pas' {Fr_CadastroOperador},
  uPainelOperador in 'uPainelOperador.pas' {Fr_PainelOperador},
  uPainelOperador4x1 in 'uPainelOperador4x1.pas' {Fr_PainelOperador4x1},
  uCadastroMenu in 'uCadastroMenu.pas' {Fr_CadastroMenu},
  uCadastroUsuario in 'uCadastroUsuario.pas' {Fr_CadastroUsuario},
  uUtilsColuna in 'uUtilsColuna.pas' {Fr_UtilColuna},
  uCadastroProdutoSeton in 'uCadastroProdutoSeton.pas' {Fr_CadastroProdutoSeton},
  uCadastroDeParaCanal in 'uCadastroDeParaCanal.pas' {Fr_CadastroDeParaCanal},
  uCadastroGrupoCliente in 'uCadastroGrupoCliente.pas' {Fr_CadastroGrupoCliente},
  uCadastroRepresentante in 'uCadastroRepresentante.pas' {Fr_CadastroRepresentante},
  uCadastroDeParaFamilia in 'uCadastroDeParaFamilia.pas' {Fr_CadastroDeParaFamilia},
  uCadastroDeParaGrupoCliente in 'uCadastroDeParaGrupoCliente.pas' {Fr_CadastroDeParaGrupoCliente},
  uCadastroDeParaRepresentante in 'uCadastroDeParaRepresentante.pas' {Fr_CadastroDeParaRepresentante},
  uRelatorioFaturamentoPedidos in 'uRelatorioFaturamentoPedidos.pas' {Fr_RelatorioFaturamentoPedidos},
  uPainelLider in 'uPainelLider.pas' {Fr_PainelLider},
  uRelatorioAnaliseApontamento in 'uRelatorioAnaliseApontamento.pas' {Fr_RelatorioAnaliseApontamento},
  uRelatorioUtilizacaoMaquina in 'uRelatorioUtilizacaoMaquina.pas' {Fr_RelatorioUtilizacaoMaquina},
  uPainelItem in 'uPainelItem.pas' {Fr_PainelItem},
  uRelatorioGestaoMercados in 'uRelatorioGestaoMercados.pas' {Fr_RelatorioGestaoMercados},
  uUtilsOwner in 'uUtilsOwner.pas' {Fr_UtilOwner},
  uRelatorioForecast in 'uRelatorioForecast.pas' {Fr_RelatorioForecast},
  uCadastroDetran in 'uCadastroDetran.pas' {Fr_CadastroDetran},
  uRelatorioRecuperacaoContas in 'uRelatorioRecuperacaoContas.pas' {Fr_RelatorioRecuperacaoContas},
  uConsultaNotaFiscal in 'uConsultaNotaFiscal.pas' {Fr_ConsultaNotaFiscal},
  uCadastroInovarCFOP in 'uCadastroInovarCFOP.pas' {Fr_CadastroInovarCFOP},
  uCadastroInovarCliente in 'uCadastroInovarCliente.pas' {Fr_CadastroInovarCliente},
  uCadastroInovarParcelaDedutivel in 'uCadastroInovarParcelaDedutivel.pas' {Fr_CadastroInovarParcelaDedutivel},
  uConsultaInovarParcelaDedutivel in 'uConsultaInovarParcelaDedutivel.pas' {Fr_ConsultaInovarParcelaDedutivel},
  uCadastroInovarNotaFiscal in 'uCadastroInovarNotaFiscal.pas' {Fr_CadastroInovarNotaFiscal},
  uCadastroIQFParametro in 'uCadastroIQFParametro.pas' {Fr_CadastroIQFParametro},
  uCadastroSetonForecast in 'uCadastroSetonForecast.pas' {Fr_CadastroSetonForecast},
  uCadastroIQFFornecedor in 'uCadastroIQFFornecedor.pas' {Fr_CadastroIQFFornecedor},
  uImportarIQFZMP05 in 'uImportarIQFZMP05.pas' {Fr_ImportarIQFZMP05},
  uRelatorioAnaliseIQF in 'uRelatorioAnaliseIQF.pas' {Fr_RelatorioAnaliseIQF},
  uUploadBOM in 'uUploadBOM.pas' {Fr_UploadBOM},
  uUploadCustosEstoque in 'uUploadCustosEstoque.pas' {Fr_UploadCustosEstoque},
  uUploadProdutoSeton in 'uUploadProdutoSeton.pas' {Fr_UploadPodutoSeton},
  uUploadRouting in 'uUploadRouting.pas' {Fr_UploadRouting},
  uUploadTaxasHoras in 'uUploadTaxasHoras.pas' {Fr_UploadTaxasHoras},
  uCalcGM in 'uCalcGM.pas' {Fr_CalcGM};

{$R *.res}

var
  hMutex: THandle;

begin

  hMutex := CreateMutex(nil, True, PChar(WUserName+':{AD8919BD-0AB2-490D-978D-4264A1A033B2}'));
  if (hMutex = 0) OR (GetLastError = ERROR_ALREADY_EXISTS) then
  begin

    Application.Terminate;

  end
  else
  begin

    Application.Initialize;

    Fr_MainSplashScreen := TFr_MainSplashScreen.Create(nil);
    try

      Fr_MainSplashScreen.Show;
      Fr_MainSplashScreen.Update;

      Application.MainFormOnTaskbar := True;
      Application.Title := 'Brady Brazil';

      if not System.IOUtils.TDirectory.Exists( MyDocumentsPath ) then
        System.IOUtils.TDirectory.CreateDirectory( MyDocumentsPath );

      if not System.IOUtils.TFile.Exists( MyDocumentsPath + '\DB.ini' ) then
        System.IOUtils.TFile.Copy( ExtractFileDir(ParamStr(0)) + '\DB.ini', MyDocumentsPath + '\DB.ini' );

      Application.CreateForm(TFr_Brady, Fr_Brady);
  finally

        Fr_MainSplashScreen.Hide;
        FreeAndNil(Fr_MainSplashScreen);

    end;

    if Fr_Brady.PainelOperador then
    begin

      Fr_Brady.dxBarLargeButtonCargaMaquinaPainelOperador.Click;

    end;

    if Fr_Brady.PainelLider then
    begin

      Fr_Brady.dxBarLargeButtonCargaMaquinaPainelLiderTambore.Click;

    end;

    Application.Run;

  end;

end.
