unit uRelatorioAnaliseIQF;

interface

uses
  dxCoreClasses,
  System.DateUtils,
  System.Math,

  System.IOUtils,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxImageComboBox,
  cxContainer, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  cxClasses, Vcl.ImgList, FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxLabel, dxGDIPlusClasses, Vcl.ExtCtrls, cxGridLevel,
  cxGridChartView, cxGridDBChartView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView, cxGrid,
  dxSkinOffice2013White, dxBarBuiltInMenu, cxPC, cxCustomPivotGrid, cxDBPivotGrid, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, Vcl.StdCtrls, Vcl.Buttons, Vcl.Menus, cxButtons,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxColorComboBox;

type
  TFr_RelatorioAnaliseIQF = class(TForm)
    cxPageControl: TcxPageControl;
    cxTabSheetGrid: TcxTabSheet;
    DataSourceTIQF_Dados: TDataSource;
    FDConnection: TFDConnection;
    FDQueryTIQF_Dados: TFDQuery;
    cxSmallImages: TcxImageList;
    cxStyleRepository: TcxStyleRepository;
    cxStyleSemTurno: TcxStyle;
    cxStyleSetup: TcxStyle;
    cxStyleProdutivo: TcxStyle;
    cxStyleParada: TcxStyle;
    cxStyleSemApontamento: TcxStyle;
    PanelSQLSplashScreen: TPanel;
    ImageSQLSplashScreen: TImage;
    cxLabelMensagem: TcxLabel;
    StyleRepository: TcxStyleRepository;
    styleActiveGroup: TcxStyle;
    cxPageControlFiltro: TcxPageControl;
    cxTabSheetFiltro: TcxTabSheet;
    cxLabelDataInicial: TcxLabel;
    cxButtonRefresh: TcxButton;
    cxGridTMAQ_Apontamento01: TcxGrid;
    cxTableViewTMAQ_Apontamento01: TcxGridDBTableView;
    cxGridLevelTMAQ_Apontamento01: TcxGridLevel;
    DataSourceTIQF_Periodo: TDataSource;
    FDQueryTIQF_Periodo: TFDQuery;
    FDQueryTIQF_PeriodoTIQF_PERCOD: TFDAutoIncField;
    FDQueryTIQF_PeriodoTIQF_PERNOM: TStringField;
    FDQueryTIQF_PeriodoTIQF_PERDAT: TSQLTimeStampField;
    cxLookupComboBoxPeriodo: TcxLookupComboBox;
    FDQueryTIQF_DadosTIQF_DADCOD: TFDAutoIncField;
    FDQueryTIQF_DadosTIQF_PERNOM: TStringField;
    FDQueryTIQF_DadosTIQF_FORSAP: TStringField;
    FDQueryTIQF_DadosTIQF_FORNOM: TStringField;
    FDQueryTIQF_DadosTIQF_DADQTDENT: TIntegerField;
    FDQueryTIQF_DadosTIQF_DADQTDATR: TIntegerField;
    FDQueryTIQF_DadosTIQF_DADQTDRNCEMB: TIntegerField;
    FDQueryTIQF_DadosTIQF_DADQTDFAL: TIntegerField;
    FDQueryTIQF_DadosTIQF_DADPERIQFMES: TBCDField;
    FDQueryTIQF_DadosTIQF_DADPERIQFACU: TBCDField;
    cxTableViewTMAQ_Apontamento01TIQF_DADCOD: TcxGridDBColumn;
    cxTableViewTMAQ_Apontamento01TIQF_PERNOM: TcxGridDBColumn;
    cxTableViewTMAQ_Apontamento01TIQF_FORSAP: TcxGridDBColumn;
    cxTableViewTMAQ_Apontamento01TIQF_FORNOM: TcxGridDBColumn;
    cxTableViewTMAQ_Apontamento01TIQF_DADQTDENT: TcxGridDBColumn;
    cxTableViewTMAQ_Apontamento01TIQF_DADQTDATR: TcxGridDBColumn;
    cxTableViewTMAQ_Apontamento01TIQF_DADQTDRNCEMB: TcxGridDBColumn;
    cxTableViewTMAQ_Apontamento01TIQF_DADQTDFAL: TcxGridDBColumn;
    cxTableViewTMAQ_Apontamento01TIQF_DADPERIQFMES: TcxGridDBColumn;
    cxTableViewTMAQ_Apontamento01TIQF_DADPERIQFACU: TcxGridDBColumn;
    cxTabSheetPivot00: TcxTabSheet;
    cxDBPivotGrid00: TcxDBPivotGrid;
    cxDBPivotGrid00FieldTIQF_FORNOM: TcxDBPivotGridField;
    cxDBPivotGrid00FieldTIQF_PERNOM: TcxDBPivotGridField;
    cxDBPivotGrid00FieldTIQF_DADPERIQFMES: TcxDBPivotGridField;
    cxDBPivotGrid00FieldTIQF_DADPERIQFACU: TcxDBPivotGridField;
    cxTabSheetGrafico: TcxTabSheet;
    cxGridTMAQ_ApontamentoGrafico01: TcxGrid;
    cxTableViewTMAQ_ApontamentoGrafico01: TcxGridDBChartView;
    cxTableViewTMAQ_ApontamentoGrafico01DataGroup1: TcxGridDBChartDataGroup;
    cxTableViewTMAQ_ApontamentoGrafico01DataGroup2: TcxGridDBChartDataGroup;
    cxTableViewTMAQ_ApontamentoGrafico01Series1: TcxGridDBChartSeries;
    cxTableViewTMAQ_ApontamentoGrafico01Series2: TcxGridDBChartSeries;
    cxGridLevelTMAQ_ApontamentoGrafico01: TcxGridLevel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure cxButtonRefreshClick(Sender: TObject);
    procedure cxTableViewTMAQ_Apontamento01TIQF_DADPERIQFMESCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxTableViewTMAQ_Apontamento01TIQF_DADPERIQFACUCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  private
    procedure Mensagem( pMensagem: String );
    { Private declarations }
  public
    procedure AbrirDataset;
    procedure LoadGridCustomization;
    { Public declarations }
  end;

var
  Fr_RelatorioAnaliseIQF: TFr_RelatorioAnaliseIQF;

implementation

{$R *.dfm}

uses uBrady, uUtils;

procedure TFr_RelatorioAnaliseIQF.AbrirDataset;
begin

  Mensagem( 'Abrindo conexão...' );
  try

    FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );
    FDConnection.Open;

    FDQueryTIQF_Periodo.Open;

    Mensagem( 'Obtendo dados (01 - IQF)...' );
    //FDQueryTIQF_Dados.ParamByName('TIQF_PERCOD').AsInteger := FDQueryTIQF_PeriodoTIQF_PERCOD.AsInteger;
    FDQueryTIQF_Dados.Open;

  finally

    Mensagem( EmptyStr );

  end;

end;

procedure TFr_RelatorioAnaliseIQF.cxButtonRefreshClick(Sender: TObject);
begin

  FDQueryTIQF_Dados.Close;
  FDQueryTIQF_Periodo.Close;
  FDConnection.Close;
  AbrirDataset;

end;

procedure TFr_RelatorioAnaliseIQF.cxTableViewTMAQ_Apontamento01TIQF_DADPERIQFACUCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin

  if AViewInfo.Value < 50 then
    ACanvas.Brush.Color := clRed
  else
  if AViewInfo.Value < 80 then
    ACanvas.Brush.Color := clYellow
  else
    ACanvas.Brush.Color := clGreen;

end;

procedure TFr_RelatorioAnaliseIQF.cxTableViewTMAQ_Apontamento01TIQF_DADPERIQFMESCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin

  if AViewInfo.Value < 50 then
    ACanvas.Brush.Color := clRed
  else
  if AViewInfo.Value < 80 then
    ACanvas.Brush.Color := clYellow
  else
    ACanvas.Brush.Color := clGreen;

end;

procedure TFr_RelatorioAnaliseIQF.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  FDQueryTIQF_Dados.Close;
  FDQueryTIQF_Periodo.Close;
  FDConnection.Close;

  Fr_RelatorioAnaliseIQF := nil;
  Action := caFree;

end;

procedure TFr_RelatorioAnaliseIQF.FormCreate(Sender: TObject);
begin

  LoadGridCustomization;

end;

procedure TFr_RelatorioAnaliseIQF.LoadGridCustomization;
begin

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxTableViewTMAQ_Apontamento01.Name + '.ini' ) then
    cxTableViewTMAQ_Apontamento01.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxTableViewTMAQ_Apontamento01.Name + '.ini' );

end;

procedure TFr_RelatorioAnaliseIQF.Mensagem(pMensagem: String);
begin

  cxLabelMensagem.Caption := pMensagem;
  PanelSQLSplashScreen.Visible := not pMensagem.IsEmpty;
  Update;
  Application.ProcessMessages;

end;

end.
