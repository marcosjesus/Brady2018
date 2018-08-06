unit uRelatorioGrossMargin;

interface

uses
  System.IOUtils,
  System.DateUtils,


  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, cxClasses, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxCustomPivotGrid, cxDBPivotGrid, cxLabel,
  dxGDIPlusClasses, Vcl.ExtCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView,
  cxGrid, cxPC, dxSkinsDefaultPainters, dxSkinOffice2013White, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus, Vcl.StdCtrls,
  cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxCheckBox, cxCheckComboBox, FireDAC.Comp.ScriptCommands,
  FireDAC.Comp.Script, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue;

type
  TFr_RelatorioGrossMargin = class(TForm)
    cxGridGrossMargin: TcxGrid;
    cxGridLevelGrossMargin00: TcxGridLevel;
    cxTableViewGrossMargin00: TcxGridDBTableView;
    FDConnection: TFDConnection;
    PanelSQLSplashScreen: TPanel;
    ImageSQLSplashScreen: TImage;
    cxLabelMensagem: TcxLabel;
    FDQueryVSOP_OrderBilling00: TFDQuery;
    DataSourceVSOP_OrderBilling00: TDataSource;
    cxPageControl: TcxPageControl;
    cxTabSheetGrid: TcxTabSheet;
    cxPageControlFiltro: TcxPageControl;
    cxTabSheetFiltro: TcxTabSheet;
    cxButtonRefresh: TcxButton;
    cxLabel1: TcxLabel;
    cxDateEditTSOP_ORDBILDATDOCINI: TcxDateEdit;
    cxLabel2: TcxLabel;
    cxDateEditTSOP_ORDBILDATDOCFIM: TcxDateEdit;
    FDQueryVSOP_OrderBilling00SITE: TStringField;
    FDQueryVSOP_OrderBilling00CANAL: TStringField;
    FDQueryVSOP_OrderBilling00COD_CLIENTE: TStringField;
    FDQueryVSOP_OrderBilling00RAZAO_SOCIAL: TStringField;
    FDQueryVSOP_OrderBilling00GRUPO_CLIENTE: TStringField;
    FDQueryVSOP_OrderBilling00ACC_OWNER: TStringField;
    FDQueryVSOP_OrderBilling00COD_ITEM: TStringField;
    FDQueryVSOP_OrderBilling00MTO_MTS: TStringField;
    FDQueryVSOP_OrderBilling00FY: TIntegerField;
    FDQueryVSOP_OrderBilling00QTR: TStringField;
    FDQueryVSOP_OrderBilling00DTREF: TSQLTimeStampField;
    FDQueryVSOP_OrderBilling00COST_LOT_SIZE: TFMTBCDField;
    FDQueryVSOP_OrderBilling00TOTAL_VENDAS_QTD: TFMTBCDField;
    FDQueryVSOP_OrderBilling00UOM: TStringField;
    FDQueryVSOP_OrderBilling00NET_SALE: TFMTBCDField;
    FDQueryVSOP_OrderBilling00MATERIAL_SETUP: TFMTBCDField;
    FDQueryVSOP_OrderBilling00MATERIAL_RESALE_RUN_SCRAP: TFMTBCDField;
    FDQueryVSOP_OrderBilling00TOTAL_MATERIAL: TFMTBCDField;
    FDQueryVSOP_OrderBilling00MACHINE_SETUP: TFMTBCDField;
    FDQueryVSOP_OrderBilling00MACHINE_RUN: TFMTBCDField;
    FDQueryVSOP_OrderBilling00TOTAL_MACHINE: TFMTBCDField;
    FDQueryVSOP_OrderBilling00LABOR_SETUP: TFMTBCDField;
    FDQueryVSOP_OrderBilling00LABOR_RUN: TFMTBCDField;
    FDQueryVSOP_OrderBilling00TOTAL_LABOR: TFMTBCDField;
    FDQueryVSOP_OrderBilling00DIRECT_COST: TFMTBCDField;
    FDQueryVSOP_OrderBilling00CM_VALOR: TFMTBCDField;
    FDQueryVSOP_OrderBilling00CM_PERCENTUAL: TFMTBCDField;
    FDQueryVSOP_OrderBilling00INDIRECT_COST: TFMTBCDField;
    FDQueryVSOP_OrderBilling00TOTAL_COST: TFMTBCDField;
    FDQueryVSOP_OrderBilling00GM_VALOR: TFMTBCDField;
    FDQueryVSOP_OrderBilling00GM_PERCENTUAL: TFMTBCDField;
    cxTableViewGrossMargin00SITE: TcxGridDBColumn;
    cxTableViewGrossMargin00CANAL: TcxGridDBColumn;
    cxTableViewGrossMargin00COD_CLIENTE: TcxGridDBColumn;
    cxTableViewGrossMargin00RAZAO_SOCIAL: TcxGridDBColumn;
    cxTableViewGrossMargin00GRUPO_CLIENTE: TcxGridDBColumn;
    cxTableViewGrossMargin00ACC_OWNER: TcxGridDBColumn;
    cxTableViewGrossMargin00COD_ITEM: TcxGridDBColumn;
    cxTableViewGrossMargin00MTO_MTS: TcxGridDBColumn;
    cxTableViewGrossMargin00FY: TcxGridDBColumn;
    cxTableViewGrossMargin00QTR: TcxGridDBColumn;
    cxTableViewGrossMargin00DTREF: TcxGridDBColumn;
    cxTableViewGrossMargin00COST_LOT_SIZE: TcxGridDBColumn;
    cxTableViewGrossMargin00TOTAL_VENDAS_QTD: TcxGridDBColumn;
    cxTableViewGrossMargin00UOM: TcxGridDBColumn;
    cxTableViewGrossMargin00NET_SALE: TcxGridDBColumn;
    cxTableViewGrossMargin00MATERIAL_SETUP: TcxGridDBColumn;
    cxTableViewGrossMargin00MATERIAL_RESALE_RUN_SCRAP: TcxGridDBColumn;
    cxTableViewGrossMargin00TOTAL_MATERIAL: TcxGridDBColumn;
    cxTableViewGrossMargin00MACHINE_SETUP: TcxGridDBColumn;
    cxTableViewGrossMargin00MACHINE_RUN: TcxGridDBColumn;
    cxTableViewGrossMargin00TOTAL_MACHINE: TcxGridDBColumn;
    cxTableViewGrossMargin00LABOR_SETUP: TcxGridDBColumn;
    cxTableViewGrossMargin00LABOR_RUN: TcxGridDBColumn;
    cxTableViewGrossMargin00TOTAL_LABOR: TcxGridDBColumn;
    cxTableViewGrossMargin00DIRECT_COST: TcxGridDBColumn;
    cxTableViewGrossMargin00CM_VALOR: TcxGridDBColumn;
    cxTableViewGrossMargin00CM_PERCENTUAL: TcxGridDBColumn;
    cxTableViewGrossMargin00INDIRECT_COST: TcxGridDBColumn;
    cxTableViewGrossMargin00TOTAL_COST: TcxGridDBColumn;
    cxTableViewGrossMargin00GM_VALOR: TcxGridDBColumn;
    cxTableViewGrossMargin00GM_PERCENTUAL: TcxGridDBColumn;
    FDQueryVSOP_OrderBilling00ID: TGuidField;
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
  Fr_RelatorioGrossMargin: TFr_RelatorioGrossMargin;

implementation

{$R *.dfm}

uses uBrady, uUtils, uUtilsOwner;

procedure TFr_RelatorioGrossMargin.AbrirDataset;
begin

  Mensagem( 'Abrindo conexão...' );
  try

    if not FDConnection.Connected then
    begin

      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );
      FDConnection.Open;

    end;

    Mensagem( 'Obtendo dados (Gross Margin)...' );
    FDQueryVSOP_OrderBilling00.ParamByName( 'DT_INI' ).AsDateTime := cxDateEditTSOP_ORDBILDATDOCINI.Date;
    FDQueryVSOP_OrderBilling00.ParamByName( 'DT_FIN' ).AsDateTime := cxDateEditTSOP_ORDBILDATDOCFIM.Date;

    if Fr_Brady.SalesRep then
      FDQueryVSOP_OrderBilling00.MacroByName( 'WHERE' ).AsRaw := 'AND A01.ACC_OWNER = ' + QuotedStr(Fr_Brady.TSIS_USUNOM);

    FDQueryVSOP_OrderBilling00.Open;

  finally

    Mensagem( EmptyStr );

  end;

end;

procedure TFr_RelatorioGrossMargin.cxButtonRefreshClick(Sender: TObject);
begin

  FDQueryVSOP_OrderBilling00.Close;
  AbrirDataset;

end;

procedure TFr_RelatorioGrossMargin.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  FDQueryVSOP_OrderBilling00.Close;
  FDConnection.Close;

  Fr_RelatorioGrossMargin := nil;
  Action := caFree;

end;

procedure TFr_RelatorioGrossMargin.FormContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
begin

  if cxPageControl.ActivePage = cxTabSheetGrid then
    Fr_Brady.PopupGridTools( cxGridGrossMargin.ActiveView );

end;

procedure TFr_RelatorioGrossMargin.FormCreate(Sender: TObject);
var
  I: Integer;

begin

  LoadGridCustomization;

  cxDateEditTSOP_ORDBILDATDOCINI.Date := System.DateUtils.StartOfAYear(1900);
  cxDateEditTSOP_ORDBILDATDOCFIM.Date := System.DateUtils.EndOfAYear(9999);

  if not Fr_Brady.SalesRep then
  begin
    for I := 0 to cxTableViewGrossMargin00.ColumnCount-1 do
    begin
      cxTableViewGrossMargin00.Columns[I].VisibleForCustomization := True;
      cxTableViewGrossMargin00.Columns[I].Visible := True;
    end;
  end;

end;

procedure TFr_RelatorioGrossMargin.LoadGridCustomization;
begin

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxTableViewGrossMargin00.Name + '.ini' ) then
    cxTableViewGrossMargin00.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxTableViewGrossMargin00.Name + '.ini' );

end;

procedure TFr_RelatorioGrossMargin.Mensagem(pMensagem: String);
begin

  cxLabelMensagem.Caption := pMensagem;
  PanelSQLSplashScreen.Visible := not pMensagem.IsEmpty;
  Update;
  Application.ProcessMessages;

end;

end.
