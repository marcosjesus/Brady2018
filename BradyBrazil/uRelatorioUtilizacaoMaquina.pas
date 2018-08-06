unit uRelatorioUtilizacaoMaquina;

interface

uses
  System.DateUtils,
  System.IOUtils,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxLabel, dxGDIPlusClasses, Vcl.ExtCtrls, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, dxSkinOffice2013White, dxBarBuiltInMenu,
  Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxPC, dxSkinsDefaultPainters;

type
  TFr_RelatorioUtilizacaoMaquina = class(TForm)
    cxGridUtilizacaoMaquina: TcxGrid;
    cxGridLevelUtilizacaoMaquinaTodos: TcxGridLevel;
    cxTableViewUtilizacaoMaquinaTodos: TcxGridDBTableView;
    DataSourceUtilizacaoMaquinaTodos: TDataSource;
    FDConnection: TFDConnection;
    FDQueryTMAQ_Item: TFDQuery;
    PanelSQLSplashScreen: TPanel;
    ImageSQLSplashScreen: TImage;
    cxLabelMensagem: TcxLabel;
    cxPageControlFiltro: TcxPageControl;
    cxTabSheetFiltro: TcxTabSheet;
    cxLabelDataInicial: TcxLabel;
    cxDateEditTMAQ_APODATINI: TcxDateEdit;
    cxLabelDataFinal: TcxLabel;
    cxDateEditTMAQ_APODATFIM: TcxDateEdit;
    cxButtonRefresh: TcxButton;
    FDQueryTMAQ_ItemPlanta: TStringField;
    FDQueryTMAQ_ItemMtrlType: TStringField;
    FDQueryTMAQ_ItemYNumber: TStringField;
    FDQueryTMAQ_ItemCliente: TStringField;
    FDQueryTMAQ_ItemCodigoCliente: TStringField;
    FDQueryTMAQ_ItemDescricao: TStringField;
    FDQueryTMAQ_ItemQtdCores: TIntegerField;
    FDQueryTMAQ_ItemMRPGroup: TStringField;
    FDQueryTMAQ_ItemWorkCenter: TStringField;
    FDQueryTMAQ_ItemWorkCenterName: TStringField;
    FDQueryTMAQ_ItemLarguraEtq: TBCDField;
    FDQueryTMAQ_ItemAlturaEtq: TBCDField;
    FDQueryTMAQ_ItemCavidadesHoriz: TBCDField;
    FDQueryTMAQ_ItemCavidadesVert: TBCDField;
    FDQueryTMAQ_ItemEspaçamentoHoriz: TBCDField;
    FDQueryTMAQ_ItemEspaçamentoVertic: TBCDField;
    FDQueryTMAQ_ItemQuantOP: TIntegerField;
    FDQueryTMAQ_ItemUnidadeMedidaItem: TStringField;
    FDQueryTMAQ_ItemQuantidadePlanejada: TFMTBCDField;
    FDQueryTMAQ_ItemQuantidadeReportada: TFMTBCDField;
    FDQueryTMAQ_ItemMaterial1: TStringField;
    FDQueryTMAQ_ItemDescricaoMaterial1: TStringField;
    FDQueryTMAQ_ItemLarguraMaterial1: TBCDField;
    FDQueryTMAQ_ItemUnidadeMedida1: TStringField;
    FDQueryTMAQ_ItemQuantidadeTeorica1: TFMTBCDField;
    FDQueryTMAQ_ItemQuantidadeReal1: TFMTBCDField;
    FDQueryTMAQ_ItemMaterial2: TStringField;
    FDQueryTMAQ_ItemDescricaoMaterial2: TStringField;
    FDQueryTMAQ_ItemLarguraMaterial2: TBCDField;
    FDQueryTMAQ_ItemUnidadeMedida2: TStringField;
    FDQueryTMAQ_ItemQuantidadeTeorica2: TFMTBCDField;
    FDQueryTMAQ_ItemQuantidadeReal2: TFMTBCDField;
    FDQueryTMAQ_ItemMaterial3: TStringField;
    FDQueryTMAQ_ItemDescricaoMaterial3: TStringField;
    FDQueryTMAQ_ItemLarguraMaterial3: TBCDField;
    FDQueryTMAQ_ItemUnidadeMedida3: TStringField;
    FDQueryTMAQ_ItemQuantidadeTeorica3: TFMTBCDField;
    FDQueryTMAQ_ItemQuantidadeReal3: TFMTBCDField;
    FDQueryTMAQ_ItemMaterial4: TStringField;
    FDQueryTMAQ_ItemDescricaoMaterial4: TStringField;
    FDQueryTMAQ_ItemLarguraMaterial4: TBCDField;
    FDQueryTMAQ_ItemUnidadeMedida4: TStringField;
    FDQueryTMAQ_ItemQuantidadeTeorica4: TFMTBCDField;
    FDQueryTMAQ_ItemQuantidadeReal4: TFMTBCDField;
    FDQueryTMAQ_ItemMaterial5: TStringField;
    FDQueryTMAQ_ItemDescricaoMaterial5: TStringField;
    FDQueryTMAQ_ItemLarguraMaterial5: TBCDField;
    FDQueryTMAQ_ItemUnidadeMedida5: TStringField;
    FDQueryTMAQ_ItemQuantidadeTeorica5: TFMTBCDField;
    FDQueryTMAQ_ItemQuantidadeReal5: TFMTBCDField;
    cxTableViewUtilizacaoMaquinaTodosPlanta: TcxGridDBColumn;
    cxTableViewUtilizacaoMaquinaTodosMtrlType: TcxGridDBColumn;
    cxTableViewUtilizacaoMaquinaTodosYNumber: TcxGridDBColumn;
    cxTableViewUtilizacaoMaquinaTodosCliente: TcxGridDBColumn;
    cxTableViewUtilizacaoMaquinaTodosCodigoCliente: TcxGridDBColumn;
    cxTableViewUtilizacaoMaquinaTodosDescricao: TcxGridDBColumn;
    cxTableViewUtilizacaoMaquinaTodosQtdCores: TcxGridDBColumn;
    cxTableViewUtilizacaoMaquinaTodosMRPGroup: TcxGridDBColumn;
    cxTableViewUtilizacaoMaquinaTodosWorkCenter: TcxGridDBColumn;
    cxTableViewUtilizacaoMaquinaTodosWorkCenterName: TcxGridDBColumn;
    cxTableViewUtilizacaoMaquinaTodosLarguraEtq: TcxGridDBColumn;
    cxTableViewUtilizacaoMaquinaTodosAlturaEtq: TcxGridDBColumn;
    cxTableViewUtilizacaoMaquinaTodosCavidadesHoriz: TcxGridDBColumn;
    cxTableViewUtilizacaoMaquinaTodosCavidadesVert: TcxGridDBColumn;
    cxTableViewUtilizacaoMaquinaTodosEspaamentoHoriz: TcxGridDBColumn;
    cxTableViewUtilizacaoMaquinaTodosEspaamentoVertic: TcxGridDBColumn;
    cxTableViewUtilizacaoMaquinaTodosQuantOP: TcxGridDBColumn;
    cxTableViewUtilizacaoMaquinaTodosUnidadeMedidaItem: TcxGridDBColumn;
    cxTableViewUtilizacaoMaquinaTodosQuantidadePlanejada: TcxGridDBColumn;
    cxTableViewUtilizacaoMaquinaTodosQuantidadeReportada: TcxGridDBColumn;
    cxTableViewUtilizacaoMaquinaTodosMaterial1: TcxGridDBColumn;
    cxTableViewUtilizacaoMaquinaTodosDescricaoMaterial1: TcxGridDBColumn;
    cxTableViewUtilizacaoMaquinaTodosLarguraMaterial1: TcxGridDBColumn;
    cxTableViewUtilizacaoMaquinaTodosUnidadeMedida1: TcxGridDBColumn;
    cxTableViewUtilizacaoMaquinaTodosQuantidadeTeorica1: TcxGridDBColumn;
    cxTableViewUtilizacaoMaquinaTodosQuantidadeReal1: TcxGridDBColumn;
    cxTableViewUtilizacaoMaquinaTodosMaterial2: TcxGridDBColumn;
    cxTableViewUtilizacaoMaquinaTodosDescricaoMaterial2: TcxGridDBColumn;
    cxTableViewUtilizacaoMaquinaTodosLarguraMaterial2: TcxGridDBColumn;
    cxTableViewUtilizacaoMaquinaTodosUnidadeMedida2: TcxGridDBColumn;
    cxTableViewUtilizacaoMaquinaTodosQuantidadeTeorica2: TcxGridDBColumn;
    cxTableViewUtilizacaoMaquinaTodosQuantidadeReal2: TcxGridDBColumn;
    cxTableViewUtilizacaoMaquinaTodosMaterial3: TcxGridDBColumn;
    cxTableViewUtilizacaoMaquinaTodosDescricaoMaterial3: TcxGridDBColumn;
    cxTableViewUtilizacaoMaquinaTodosLarguraMaterial3: TcxGridDBColumn;
    cxTableViewUtilizacaoMaquinaTodosUnidadeMedida3: TcxGridDBColumn;
    cxTableViewUtilizacaoMaquinaTodosQuantidadeTeorica3: TcxGridDBColumn;
    cxTableViewUtilizacaoMaquinaTodosQuantidadeReal3: TcxGridDBColumn;
    cxTableViewUtilizacaoMaquinaTodosMaterial4: TcxGridDBColumn;
    cxTableViewUtilizacaoMaquinaTodosDescricaoMaterial4: TcxGridDBColumn;
    cxTableViewUtilizacaoMaquinaTodosLarguraMaterial4: TcxGridDBColumn;
    cxTableViewUtilizacaoMaquinaTodosUnidadeMedida4: TcxGridDBColumn;
    cxTableViewUtilizacaoMaquinaTodosQuantidadeTeorica4: TcxGridDBColumn;
    cxTableViewUtilizacaoMaquinaTodosQuantidadeReal4: TcxGridDBColumn;
    cxTableViewUtilizacaoMaquinaTodosMaterial5: TcxGridDBColumn;
    cxTableViewUtilizacaoMaquinaTodosDescricaoMaterial5: TcxGridDBColumn;
    cxTableViewUtilizacaoMaquinaTodosLarguraMaterial5: TcxGridDBColumn;
    cxTableViewUtilizacaoMaquinaTodosUnidadeMedida5: TcxGridDBColumn;
    cxTableViewUtilizacaoMaquinaTodosQuantidadeTeorica5: TcxGridDBColumn;
    cxTableViewUtilizacaoMaquinaTodosQuantidadeReal5: TcxGridDBColumn;
    FDQueryTMAQ_ItemEtqBob: TIntegerField;
    cxTableViewUtilizacaoMaquinaTodosEtqBob: TcxGridDBColumn;
    cxGridUtilizacaoMaquinaOrdemProducao: TcxGridLevel;
    cxGridUtilizacaoMaquinaDBTableViewOrdemProducao: TcxGridDBTableView;
    FDQueryPPM: TFDQuery;
    DataSourceUtilizacaoMaquinaPPM: TDataSource;
    FDQueryPPMTMAQ_ORDPRONUM: TStringField;
    FDQueryPPMTMAQ_ORDPROITECOD: TStringField;
    FDQueryPPMTMAQ_ORDPROMPRITECOD: TStringField;
    FDQueryPPMTMAQ_ORDPROMPRQTDTEO: TBCDField;
    FDQueryPPMTMAQ_ORDPROMPRQTDREA: TBCDField;
    FDQueryPPMTMAQ_ORDPROQTDPLA: TBCDField;
    FDQueryPPMTMAQ_ORDPROQTDREP: TBCDField;
    FDQueryPPMID: TGuidField;
    cxGridUtilizacaoMaquinaDBTableViewOrdemProducaoTMAQ_ORDPRONUM: TcxGridDBColumn;
    cxGridUtilizacaoMaquinaDBTableViewOrdemProducaoTMAQ_ORDPROITECOD: TcxGridDBColumn;
    cxGridUtilizacaoMaquinaDBTableViewOrdemProducaoTMAQ_ORDPROMPRITECOD: TcxGridDBColumn;
    cxGridUtilizacaoMaquinaDBTableViewOrdemProducaoTMAQ_ORDPROMPRQTDTEO: TcxGridDBColumn;
    cxGridUtilizacaoMaquinaDBTableViewOrdemProducaoTMAQ_ORDPROMPRQTDREA: TcxGridDBColumn;
    cxGridUtilizacaoMaquinaDBTableViewOrdemProducaoTMAQ_ORDPROQTDPLA: TcxGridDBColumn;
    cxGridUtilizacaoMaquinaDBTableViewOrdemProducaoTMAQ_ORDPROQTDREP: TcxGridDBColumn;
    FDQueryPPMTMAQ_ITEUNI: TStringField;
    cxGridUtilizacaoMaquinaDBTableViewOrdemProducaoTMAQ_ITEUNI: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure cxButtonRefreshClick(Sender: TObject);
  private
    procedure Mensagem( pMensagem: String );
    { Private declarations }
  public
    procedure AbrirDataset;
    procedure LoadGridCustomization;
    { Public declarations }
  end;

var
  Fr_RelatorioUtilizacaoMaquina: TFr_RelatorioUtilizacaoMaquina;

implementation

{$R *.dfm}

uses uBrady, uUtils;

procedure TFr_RelatorioUtilizacaoMaquina.AbrirDataset;
begin

  Mensagem( 'Abrindo conexão...' );
  try

    FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );
    FDConnection.Open;

    Mensagem( 'Obtendo dados (Utilização Maquinas)...' );
    FDQueryTMAQ_Item.ParamByName('DATAINI').AsDateTime := cxDateEditTMAQ_APODATINI.Date;
    FDQueryTMAQ_Item.ParamByName('DATAFIM').AsDateTime := cxDateEditTMAQ_APODATFIM.Date;
    FDQueryTMAQ_Item.Open;

    Mensagem( 'Obtendo dados (PPM)...' );
    FDQueryPPM.ParamByName('DATAINI').AsDateTime := cxDateEditTMAQ_APODATINI.Date;
    FDQueryPPM.ParamByName('DATAFIM').AsDateTime := cxDateEditTMAQ_APODATFIM.Date;
    FDQueryPPM.Open;

  finally

    Mensagem( EmptyStr );

  end;

end;

procedure TFr_RelatorioUtilizacaoMaquina.cxButtonRefreshClick(Sender: TObject);
begin

  FDQueryTMAQ_Item.Close;
  FDQueryPPM.Close;
  FDConnection.Close;
  AbrirDataset;

end;

procedure TFr_RelatorioUtilizacaoMaquina.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  FDQueryTMAQ_Item.Close;
  FDQueryPPM.Close;
  FDConnection.Close;

  Fr_RelatorioUtilizacaoMaquina := nil;
  Action := caFree;

end;

procedure TFr_RelatorioUtilizacaoMaquina.FormContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
begin

  Fr_Brady.PopupGridTools( cxGridUtilizacaoMaquina.ActiveView )

end;

procedure TFr_RelatorioUtilizacaoMaquina.FormCreate(Sender: TObject);
begin

  LoadGridCustomization;
  cxDateEditTMAQ_APODATINI.Date := System.DateUtils.StartOfTheMonth(Now);
  cxDateEditTMAQ_APODATFIM.Date := System.DateUtils.EndOfTheMonth(Now);

end;

procedure TFr_RelatorioUtilizacaoMaquina.LoadGridCustomization;
begin

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxTableViewUtilizacaoMaquinaTodos.Name + '.ini' ) then
    cxTableViewUtilizacaoMaquinaTodos.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxTableViewUtilizacaoMaquinaTodos.Name + '.ini' );

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxGridUtilizacaoMaquinaDBTableViewOrdemProducao.Name + '.ini' ) then
    cxGridUtilizacaoMaquinaDBTableViewOrdemProducao.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxGridUtilizacaoMaquinaDBTableViewOrdemProducao.Name + '.ini' );

end;

procedure TFr_RelatorioUtilizacaoMaquina.Mensagem(pMensagem: String);
begin

  cxLabelMensagem.Caption := pMensagem;
  PanelSQLSplashScreen.Visible := not pMensagem.IsEmpty;
  Update;
  Application.ProcessMessages;

end;

end.
