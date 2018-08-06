unit uRelatorioForecast;

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
  FireDAC.Comp.Script, cxCurrencyEdit;

type
  TFr_RelatorioForecast = class(TForm)
    FDConnection: TFDConnection;
    FDQueryVSOP_OrderBillingForecast: TFDQuery;
    FDQueryVSOP_OrderBillingForecastTSOP_ORDBILCANNOM: TStringField;
    FDQueryVSOP_OrderBillingForecastTSOP_ORDBILGRUCLINOM: TStringField;
    FDQueryVSOP_OrderBillingForecastTSOP_ORDBILREPNOM: TStringField;
    FDQueryVSOP_OrderBillingForecastTSOP_ORDBILVALLIQ: TBCDField;
    DataSourceVSOP_OrderBillingForecast: TDataSource;
    cxPageControlPivot: TcxPageControl;
    cxTabSheetPivot00: TcxTabSheet;
    cxDBPivotGrid00: TcxDBPivotGrid;
    cxDBPivotGrid00FieldTSOP_ORDBILCANNOM: TcxDBPivotGridField;
    cxDBPivotGrid00FieldTSOP_ORDBILDAT: TcxDBPivotGridField;
    cxDBPivotGrid00FieldTSOP_ORDBILGRUCLINOM: TcxDBPivotGridField;
    cxDBPivotGrid00FieldTSOP_ORDBILVALLIQ: TcxDBPivotGridField;
    cxDBPivotGrid00FieldTSOP_ORDBILREPNOM: TcxDBPivotGridField;
    PanelSQLSplashScreen: TPanel;
    ImageSQLSplashScreen: TImage;
    cxLabelMensagem: TcxLabel;
    FDQueryVSOP_OrderBillingForecastTSOP_ORDBILDAT: TMemoField;
    FDQueryVSOP_OrderBillingForecastTSOP_ORDBILTYP: TStringField;
    cxDBPivotGrid00FieldTSOP_ORDBILTYP: TcxDBPivotGridField;
    FDQueryVSOP_OrderBillingForecastTSOP_REPNOMINT: TStringField;
    FDQueryVSOP_OrderBillingForecastTSOP_REPMKT: TStringField;
    FDQueryVSOP_OrderBillingForecastTSOP_ORDBILCLINOM: TStringField;
    FDQueryVSOP_OrderBillingForecastTSOP_GRUCLIMER: TStringField;
    FDQueryVSOP_OrderBillingForecastTSOP_ORDBILSITNOM: TStringField;
    cxDBPivotGrid00FieldTSOP_REPNOMINT: TcxDBPivotGridField;
    cxDBPivotGrid00FieldTSOP_ORDBILSITNOM: TcxDBPivotGridField;
    cxDBPivotGrid00FieldTSOP_ORDBILCLINOM: TcxDBPivotGridField;
    cxDBPivotGrid00FieldTSOP_GRUCLIMER: TcxDBPivotGridField;
    cxDBPivotGrid00FieldTSOP_REPMKT: TcxDBPivotGridField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    procedure Mensagem( pMensagem: String );
    { Private declarations }
  public
    procedure AbrirDataset;
    procedure LoadGridCustomization;
    { Public declarations }
  end;

var
  Fr_RelatorioForecast: TFr_RelatorioForecast;

implementation

{$R *.dfm}

uses uBrady, uUtils;

procedure TFr_RelatorioForecast.AbrirDataset;
begin
(*
  Mensagem( 'Abrindo conexão...' );
  try

    if not FDConnection.Connected then
    begin

      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );
      FDConnection.Open;

    end;

    Mensagem( 'Obtendo dados (Entrada de Pedidos do Mês)...' );

    FDQueryVSOP_OrderBillingPedidos.ParamByName( 'MES_INI' ).AsDateTime := System.DateUtils.StartOfTheMonth(Now);

    if System.DateUtils.MonthOf(Now) >= 8 then
      FDQueryVSOP_OrderBillingPedidos.ParamByName( 'YEARDOC' ).AsInteger := System.DateUtils.YearOf(Now) + 1
    else
      FDQueryVSOP_OrderBillingPedidos.ParamByName( 'YEARDOC' ).AsInteger := System.DateUtils.YearOf(Now);

    if System.DateUtils.MonthOf(Now) >= 8 then
      FDQueryVSOP_OrderBillingPedidos.ParamByName( 'MONTHDOC' ).AsInteger := System.DateUtils.MonthOf(Now) - 7
    else
      FDQueryVSOP_OrderBillingPedidos.ParamByName( 'MONTHDOC' ).AsInteger := System.DateUtils.MonthOf(Now) + 5;

    if Fr_Brady.SalesRep then
      FDQueryVSOP_OrderBillingPedidos.MacroByName( 'WHERE1' ).AsRaw := 'AND (B01.TSOP_ORDBILREPNOM = ' + QuotedStr(Fr_Brady.TSIS_USUNOM) + ' OR B01.TSOP_REPMKT = ' + QuotedStr(Fr_Brady.TSIS_USUNOM) + ' OR B01.TSOP_REPNOMINT = ' + QuotedStr(Fr_Brady.TSIS_USUNOM) + ')';

    if Fr_Brady.CustomerService then
      FDQueryVSOP_OrderBillingPedidos.MacroByName( 'WHERE1' ).AsRaw := 'AND B01.TSOP_ORDBILREPCSR = ' + QuotedStr(Fr_Brady.TSIS_USUNOM);

    FDQueryVSOP_OrderBillingPedidos.Open;

    Mensagem( 'Obtendo dados (Faturamento do Mês)...' );

    FDQueryVSOP_OrderBillingFaturamento.ParamByName( 'MES_ANO_INI' ).AsDateTime := System.DateUtils.StartOfTheMonth(System.DateUtils.EndOfTheMonth(Now)-365);
    FDQueryVSOP_OrderBillingFaturamento.ParamByName( 'MES_ANO_FIM' ).AsDateTime := System.DateUtils.EndOfTheMonth(System.DateUtils.EndOfTheMonth(Now)-365);
    if System.DateUtils.MonthOf(FDQueryVSOP_OrderBillingFaturamento.ParamByName( 'MES_ANO_INI' ).AsDateTime) >= 8 then
      FDQueryVSOP_OrderBillingFaturamento.ParamByName( 'YEARDOC_ANO' ).AsInteger := System.DateUtils.YearOf(FDQueryVSOP_OrderBillingFaturamento.ParamByName( 'MES_ANO_INI' ).AsDateTime) + 1
    else
      FDQueryVSOP_OrderBillingFaturamento.ParamByName( 'YEARDOC_ANO' ).AsInteger := System.DateUtils.YearOf(FDQueryVSOP_OrderBillingFaturamento.ParamByName( 'MES_ANO_INI' ).AsDateTime);

    if System.DateUtils.MonthOf(FDQueryVSOP_OrderBillingFaturamento.ParamByName( 'MES_ANO_INI' ).AsDateTime) >= 8 then
      FDQueryVSOP_OrderBillingFaturamento.ParamByName( 'MONTHDOC_ANO' ).AsInteger := System.DateUtils.MonthOf(FDQueryVSOP_OrderBillingFaturamento.ParamByName( 'MES_ANO_INI' ).AsDateTime) - 7
    else
      FDQueryVSOP_OrderBillingFaturamento.ParamByName( 'MONTHDOC_ANO' ).AsInteger := System.DateUtils.MonthOf(FDQueryVSOP_OrderBillingFaturamento.ParamByName( 'MES_ANO_INI' ).AsDateTime) + 5;

    FDQueryVSOP_OrderBillingFaturamento.ParamByName( 'MES_ANT_INI' ).AsDateTime := System.DateUtils.StartOfTheMonth(System.DateUtils.StartOfTheMonth(Now)-1);
    FDQueryVSOP_OrderBillingFaturamento.ParamByName( 'MES_ANT_FIM' ).AsDateTime := System.DateUtils.EndOfTheMonth(System.DateUtils.StartOfTheMonth(Now)-1);
    if System.DateUtils.MonthOf(FDQueryVSOP_OrderBillingFaturamento.ParamByName( 'MES_ANT_INI' ).AsDateTime) >= 8 then
      FDQueryVSOP_OrderBillingFaturamento.ParamByName( 'YEARDOC_ANT' ).AsInteger := System.DateUtils.YearOf(FDQueryVSOP_OrderBillingFaturamento.ParamByName( 'MES_ANT_INI' ).AsDateTime) + 1
    else
      FDQueryVSOP_OrderBillingFaturamento.ParamByName( 'YEARDOC_ANT' ).AsInteger := System.DateUtils.YearOf(FDQueryVSOP_OrderBillingFaturamento.ParamByName( 'MES_ANT_INI' ).AsDateTime);

    if System.DateUtils.MonthOf(FDQueryVSOP_OrderBillingFaturamento.ParamByName( 'MES_ANO_INI' ).AsDateTime) >= 8 then
      FDQueryVSOP_OrderBillingFaturamento.ParamByName( 'MONTHDOC_ANT' ).AsInteger := System.DateUtils.MonthOf(FDQueryVSOP_OrderBillingFaturamento.ParamByName( 'MES_ANT_INI' ).AsDateTime) - 7
    else
      FDQueryVSOP_OrderBillingFaturamento.ParamByName( 'MONTHDOC_ANT' ).AsInteger := System.DateUtils.MonthOf(FDQueryVSOP_OrderBillingFaturamento.ParamByName( 'MES_ANT_INI' ).AsDateTime) + 5;

    FDQueryVSOP_OrderBillingFaturamento.ParamByName( 'MES_INI' ).AsDateTime := System.DateUtils.StartOfTheMonth(Now);
    FDQueryVSOP_OrderBillingFaturamento.ParamByName( 'MES_FIM' ).AsDateTime := System.DateUtils.EndOfTheMonth(Now);
    if System.DateUtils.MonthOf(FDQueryVSOP_OrderBillingFaturamento.ParamByName( 'MES_INI' ).AsDateTime) >= 8 then
      FDQueryVSOP_OrderBillingFaturamento.ParamByName( 'YEARDOC' ).AsInteger := System.DateUtils.YearOf(FDQueryVSOP_OrderBillingFaturamento.ParamByName( 'MES_INI' ).AsDateTime) + 1
    else
      FDQueryVSOP_OrderBillingFaturamento.ParamByName( 'YEARDOC' ).AsInteger := System.DateUtils.YearOf(FDQueryVSOP_OrderBillingFaturamento.ParamByName( 'MES_INI' ).AsDateTime);

    if System.DateUtils.MonthOf(FDQueryVSOP_OrderBillingFaturamento.ParamByName( 'MES_INI' ).AsDateTime) >= 8 then
      FDQueryVSOP_OrderBillingFaturamento.ParamByName( 'MONTHDOC' ).AsInteger := System.DateUtils.MonthOf(FDQueryVSOP_OrderBillingFaturamento.ParamByName( 'MES_INI' ).AsDateTime) - 7
    else
      FDQueryVSOP_OrderBillingFaturamento.ParamByName( 'MONTHDOC' ).AsInteger := System.DateUtils.MonthOf(FDQueryVSOP_OrderBillingFaturamento.ParamByName( 'MES_INI' ).AsDateTime) + 5;

    if Fr_Brady.SalesRep then
      FDQueryVSOP_OrderBillingFaturamento.MacroByName( 'WHERE1' ).AsRaw := 'AND (B01.TSOP_ORDBILREPNOM = ' + QuotedStr(Fr_Brady.TSIS_USUNOM) + ' OR B01.TSOP_REPMKT = ' + QuotedStr(Fr_Brady.TSIS_USUNOM) + ' OR B01.TSOP_REPNOMINT = ' + QuotedStr(Fr_Brady.TSIS_USUNOM) + ')';

    if Fr_Brady.CustomerService then
      FDQueryVSOP_OrderBillingFaturamento.MacroByName( 'WHERE1' ).AsRaw := 'AND B01.TSOP_ORDBILREPCSR = ' + QuotedStr(Fr_Brady.TSIS_USUNOM);

    FDQueryVSOP_OrderBillingFaturamento.Open;

  finally

    Mensagem( EmptyStr );

  end;
*)
end;

procedure TFr_RelatorioForecast.FormClose(Sender: TObject; var Action: TCloseAction);
begin
(*
  FDQueryVSOP_OrderBillingPedidos.Close;
  FDQueryVSOP_OrderBillingFaturamento.Close;
  FDConnection.Close;

  Fr_RelatorioForecast := nil;
  Action := caFree;
*)
end;

procedure TFr_RelatorioForecast.FormContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
begin
(*
  if cxPageControlPivot.ActivePage = cxTabSheetPivot00 then
    Fr_Brady.PopupPivotTools( cxDBPivotGrid00 )
  else
  if cxPageControlPivot.ActivePage = cxTabSheetPivot01 then
    Fr_Brady.PopupPivotTools( cxDBPivotGrid01 );
*)
end;

procedure TFr_RelatorioForecast.FormCreate(Sender: TObject);
begin

  LoadGridCustomization;

end;

procedure TFr_RelatorioForecast.LoadGridCustomization;
begin

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxDBPivotGrid00.Name + '.ini' ) then
    cxDBPivotGrid00.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxDBPivotGrid00.Name + '.ini' );

end;

procedure TFr_RelatorioForecast.Mensagem(pMensagem: String);
begin

  cxLabelMensagem.Caption := pMensagem;
  PanelSQLSplashScreen.Visible := not pMensagem.IsEmpty;
  Update;
  Application.ProcessMessages;

end;

end.
