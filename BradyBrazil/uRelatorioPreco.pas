unit uRelatorioPreco;

interface

uses
  dxCoreClasses,

  System.IOUtils,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxImageComboBox,
  cxContainer, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  cxClasses, Vcl.ImgList, FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxLabel, dxGDIPlusClasses, Vcl.ExtCtrls, cxGridLevel,
  cxGridChartView, cxGridDBChartView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView, cxGrid,
  dxSkinOffice2013White, dxSkinsDefaultPainters, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue;

type
  TFr_RelatorioPreco = class(TForm)
    cxGridTabelaPreco: TcxGrid;
    cxTableViewTabelaPrecoVencidos: TcxGridDBTableView;
    cxGridLevelTabelaPrecoVencidos: TcxGridLevel;
    cxGridLevelTabelaPrecoTodos: TcxGridLevel;
    cxTableViewTabelaPrecoTodos: TcxGridDBTableView;
    cxGridLevelTabelaPrecoAVencer: TcxGridLevel;
    cxTableViewTabelaPrecoAVencer: TcxGridDBTableView;
    DataSourcePrecoTodos: TDataSource;
    DataSourcePrecosVencidos: TDataSource;
    DataSourceAVencer: TDataSource;
    FDConnection: TFDConnection;
    FDQueryTSOP_TabelaPrecoTodos: TFDQuery;
    FDQueryTSOP_TabelaPrecoTodosTSOP_TABPRECOD: TIntegerField;
    FDQueryTSOP_TabelaPrecoTodosTSOP_TABPRECANNOM: TStringField;
    FDQueryTSOP_TabelaPrecoTodosTSOP_TABPRECLICOD: TStringField;
    FDQueryTSOP_TabelaPrecoTodosTSOP_TABPRECLICGC: TStringField;
    FDQueryTSOP_TabelaPrecoTodosTSOP_TABPRECLINOM: TStringField;
    FDQueryTSOP_TabelaPrecoTodosTSOP_TABPREGRUCLINOM: TStringField;
    FDQueryTSOP_TabelaPrecoTodosTSOP_GRUCLIMER: TStringField;
    FDQueryTSOP_TabelaPrecoTodosTSOP_TABPREREPNOM: TStringField;
    FDQueryTSOP_TabelaPrecoTodosTSOP_REPNOMINT: TStringField;
    FDQueryTSOP_TabelaPrecoTodosTSOP_TABPREITECOD: TStringField;
    FDQueryTSOP_TabelaPrecoTodosTSOP_TABPREITECLICOD: TStringField;
    FDQueryTSOP_TabelaPrecoTodosTSOP_Z00PER: TBCDField;
    FDQueryTSOP_TabelaPrecoTodosTSOP_Z00QTD: TBCDField;
    FDQueryTSOP_TabelaPrecoTodosTSOP_Z00UOM: TStringField;
    FDQueryTSOP_TabelaPrecoTodosTSOP_Z00DATINI: TSQLTimeStampField;
    FDQueryTSOP_TabelaPrecoTodosTSOP_Z00DATFIM: TSQLTimeStampField;
    FDQueryTSOP_TabelaPrecoTodosTSOP_TABPREITEFAM001: TStringField;
    FDQueryTSOP_TabelaPrecoTodosTSOP_TABPREITEFAM002: TStringField;
    FDQueryTSOP_TabelaPrecoTodosTSOP_TABPREITEFAM003: TStringField;
    FDQueryTSOP_TabelaPrecoTodosTSOP_TABPREITEFAM004: TStringField;
    FDQueryTSOP_TabelaPrecoTodosTSOP_TABPREITEFAM005: TStringField;
    cxTableViewTabelaPrecoTodosTSOP_TABPRECANNOM: TcxGridDBColumn;
    cxTableViewTabelaPrecoTodosTSOP_TABPRECLICOD: TcxGridDBColumn;
    cxTableViewTabelaPrecoTodosTSOP_TABPRECLICGC: TcxGridDBColumn;
    cxTableViewTabelaPrecoTodosTSOP_TABPRECLINOM: TcxGridDBColumn;
    cxTableViewTabelaPrecoTodosTSOP_TABPREGRUCLINOM: TcxGridDBColumn;
    cxTableViewTabelaPrecoTodosTSOP_GRUCLIMER: TcxGridDBColumn;
    cxTableViewTabelaPrecoTodosTSOP_TABPREREPNOM: TcxGridDBColumn;
    cxTableViewTabelaPrecoTodosTSOP_REPNOMINT: TcxGridDBColumn;
    cxTableViewTabelaPrecoTodosTSOP_TABPREITECOD: TcxGridDBColumn;
    cxTableViewTabelaPrecoTodosTSOP_TABPREITECLICOD: TcxGridDBColumn;
    cxTableViewTabelaPrecoTodosTSOP_Z00PER: TcxGridDBColumn;
    cxTableViewTabelaPrecoTodosTSOP_Z00QTD: TcxGridDBColumn;
    cxTableViewTabelaPrecoTodosTSOP_Z00VLF: TcxGridDBColumn;
    cxTableViewTabelaPrecoTodosTSOP_Z00UOM: TcxGridDBColumn;
    cxTableViewTabelaPrecoTodosTSOP_Z00DATINI: TcxGridDBColumn;
    cxTableViewTabelaPrecoTodosTSOP_Z00DATFIM: TcxGridDBColumn;
    cxTableViewTabelaPrecoTodosTSOP_TABPREITEFAM001: TcxGridDBColumn;
    cxTableViewTabelaPrecoTodosTSOP_TABPREITEFAM002: TcxGridDBColumn;
    cxTableViewTabelaPrecoTodosTSOP_TABPREITEFAM003: TcxGridDBColumn;
    cxTableViewTabelaPrecoTodosTSOP_TABPREITEFAM004: TcxGridDBColumn;
    cxTableViewTabelaPrecoTodosTSOP_TABPREITEFAM005: TcxGridDBColumn;
    cxTableViewTabelaPrecoVencidosTSOP_TABPRECANNOM: TcxGridDBColumn;
    cxTableViewTabelaPrecoVencidosTSOP_TABPRECLICOD: TcxGridDBColumn;
    cxTableViewTabelaPrecoVencidosTSOP_TABPRECLICGC: TcxGridDBColumn;
    cxTableViewTabelaPrecoVencidosTSOP_TABPRECLINOM: TcxGridDBColumn;
    cxTableViewTabelaPrecoVencidosTSOP_TABPREGRUCLINOM: TcxGridDBColumn;
    cxTableViewTabelaPrecoVencidosTSOP_GRUCLIMER: TcxGridDBColumn;
    cxTableViewTabelaPrecoVencidosTSOP_TABPREREPNOM: TcxGridDBColumn;
    cxTableViewTabelaPrecoVencidosTSOP_REPNOMINT: TcxGridDBColumn;
    cxTableViewTabelaPrecoVencidosTSOP_TABPREITECOD: TcxGridDBColumn;
    cxTableViewTabelaPrecoVencidosTSOP_TABPREITECLICOD: TcxGridDBColumn;
    cxTableViewTabelaPrecoVencidosTSOP_Z00PER: TcxGridDBColumn;
    cxTableViewTabelaPrecoVencidosTSOP_Z00QTD: TcxGridDBColumn;
    cxTableViewTabelaPrecoVencidosTSOP_Z00VLF: TcxGridDBColumn;
    cxTableViewTabelaPrecoVencidosTSOP_Z00UOM: TcxGridDBColumn;
    cxTableViewTabelaPrecoVencidosTSOP_Z00DATINI: TcxGridDBColumn;
    cxTableViewTabelaPrecoVencidosTSOP_Z00DATFIM: TcxGridDBColumn;
    cxTableViewTabelaPrecoVencidosTSOP_TABPREITEFAM001: TcxGridDBColumn;
    cxTableViewTabelaPrecoVencidosTSOP_TABPREITEFAM002: TcxGridDBColumn;
    cxTableViewTabelaPrecoVencidosTSOP_TABPREITEFAM003: TcxGridDBColumn;
    cxTableViewTabelaPrecoVencidosTSOP_TABPREITEFAM004: TcxGridDBColumn;
    cxTableViewTabelaPrecoVencidosTSOP_TABPREITEFAM005: TcxGridDBColumn;
    cxTableViewTabelaPrecoAVencerTSOP_TABPRECANNOM: TcxGridDBColumn;
    cxTableViewTabelaPrecoAVencerTSOP_TABPRECLICOD: TcxGridDBColumn;
    cxTableViewTabelaPrecoAVencerTSOP_TABPRECLICGC: TcxGridDBColumn;
    cxTableViewTabelaPrecoAVencerTSOP_TABPRECLINOM: TcxGridDBColumn;
    cxTableViewTabelaPrecoAVencerTSOP_TABPREGRUCLINOM: TcxGridDBColumn;
    cxTableViewTabelaPrecoAVencerTSOP_GRUCLIMER: TcxGridDBColumn;
    cxTableViewTabelaPrecoAVencerTSOP_TABPREREPNOM: TcxGridDBColumn;
    cxTableViewTabelaPrecoAVencerTSOP_REPNOMINT: TcxGridDBColumn;
    cxTableViewTabelaPrecoAVencerTSOP_TABPREITECOD: TcxGridDBColumn;
    cxTableViewTabelaPrecoAVencerTSOP_TABPREITECLICOD: TcxGridDBColumn;
    cxTableViewTabelaPrecoAVencerTSOP_Z00PER: TcxGridDBColumn;
    cxTableViewTabelaPrecoAVencerTSOP_Z00QTD: TcxGridDBColumn;
    cxTableViewTabelaPrecoAVencerTSOP_Z00VLF: TcxGridDBColumn;
    cxTableViewTabelaPrecoAVencerTSOP_Z00UOM: TcxGridDBColumn;
    cxTableViewTabelaPrecoAVencerTSOP_Z00DATINI: TcxGridDBColumn;
    cxTableViewTabelaPrecoAVencerTSOP_Z00DATFIM: TcxGridDBColumn;
    cxTableViewTabelaPrecoAVencerTSOP_TABPREITEFAM001: TcxGridDBColumn;
    cxTableViewTabelaPrecoAVencerTSOP_TABPREITEFAM002: TcxGridDBColumn;
    cxTableViewTabelaPrecoAVencerTSOP_TABPREITEFAM003: TcxGridDBColumn;
    cxTableViewTabelaPrecoAVencerTSOP_TABPREITEFAM004: TcxGridDBColumn;
    cxTableViewTabelaPrecoAVencerTSOP_TABPREITEFAM005: TcxGridDBColumn;
    FDQueryTSOP_TabelaPrecoVencidos: TFDQuery;
    FDQueryTSOP_TabelaPrecoVencidosTSOP_TABPRECOD: TIntegerField;
    FDQueryTSOP_TabelaPrecoVencidosTSOP_TABPRECANNOM: TStringField;
    FDQueryTSOP_TabelaPrecoVencidosTSOP_TABPRECLICOD: TStringField;
    FDQueryTSOP_TabelaPrecoVencidosTSOP_TABPRECLICGC: TStringField;
    FDQueryTSOP_TabelaPrecoVencidosTSOP_TABPRECLINOM: TStringField;
    FDQueryTSOP_TabelaPrecoVencidosTSOP_TABPREGRUCLINOM: TStringField;
    FDQueryTSOP_TabelaPrecoVencidosTSOP_GRUCLIMER: TStringField;
    FDQueryTSOP_TabelaPrecoVencidosTSOP_TABPREREPNOM: TStringField;
    FDQueryTSOP_TabelaPrecoVencidosTSOP_REPNOMINT: TStringField;
    FDQueryTSOP_TabelaPrecoVencidosTSOP_TABPREITECOD: TStringField;
    FDQueryTSOP_TabelaPrecoVencidosTSOP_TABPREITECLICOD: TStringField;
    FDQueryTSOP_TabelaPrecoVencidosTSOP_Z00PER: TBCDField;
    FDQueryTSOP_TabelaPrecoVencidosTSOP_Z00QTD: TBCDField;
    FDQueryTSOP_TabelaPrecoVencidosTSOP_Z00VLF: TFMTBCDField;
    FDQueryTSOP_TabelaPrecoVencidosTSOP_Z00UOM: TStringField;
    FDQueryTSOP_TabelaPrecoVencidosTSOP_Z00DATINI: TSQLTimeStampField;
    FDQueryTSOP_TabelaPrecoVencidosTSOP_Z00DATFIM: TSQLTimeStampField;
    FDQueryTSOP_TabelaPrecoVencidosTSOP_TABPREITEFAM001: TStringField;
    FDQueryTSOP_TabelaPrecoVencidosTSOP_TABPREITEFAM002: TStringField;
    FDQueryTSOP_TabelaPrecoVencidosTSOP_TABPREITEFAM003: TStringField;
    FDQueryTSOP_TabelaPrecoVencidosTSOP_TABPREITEFAM004: TStringField;
    FDQueryTSOP_TabelaPrecoVencidosTSOP_TABPREITEFAM005: TStringField;
    FDQueryTSOP_TabelaPrecoAVencer: TFDQuery;
    FDQueryTSOP_TabelaPrecoAVencerTSOP_TABPRECOD: TIntegerField;
    FDQueryTSOP_TabelaPrecoAVencerTSOP_TABPRECANNOM: TStringField;
    FDQueryTSOP_TabelaPrecoAVencerTSOP_TABPRECLICOD: TStringField;
    FDQueryTSOP_TabelaPrecoAVencerTSOP_TABPRECLICGC: TStringField;
    FDQueryTSOP_TabelaPrecoAVencerTSOP_TABPRECLINOM: TStringField;
    FDQueryTSOP_TabelaPrecoAVencerTSOP_TABPREGRUCLINOM: TStringField;
    FDQueryTSOP_TabelaPrecoAVencerTSOP_GRUCLIMER: TStringField;
    FDQueryTSOP_TabelaPrecoAVencerTSOP_TABPREREPNOM: TStringField;
    FDQueryTSOP_TabelaPrecoAVencerTSOP_REPNOMINT: TStringField;
    FDQueryTSOP_TabelaPrecoAVencerTSOP_TABPREITECOD: TStringField;
    FDQueryTSOP_TabelaPrecoAVencerTSOP_TABPREITECLICOD: TStringField;
    FDQueryTSOP_TabelaPrecoAVencerTSOP_Z00PER: TBCDField;
    FDQueryTSOP_TabelaPrecoAVencerTSOP_Z00QTD: TBCDField;
    FDQueryTSOP_TabelaPrecoAVencerTSOP_Z00VLF: TFMTBCDField;
    FDQueryTSOP_TabelaPrecoAVencerTSOP_Z00UOM: TStringField;
    FDQueryTSOP_TabelaPrecoAVencerTSOP_Z00DATINI: TSQLTimeStampField;
    FDQueryTSOP_TabelaPrecoAVencerTSOP_Z00DATFIM: TSQLTimeStampField;
    FDQueryTSOP_TabelaPrecoAVencerTSOP_TABPREITEFAM001: TStringField;
    FDQueryTSOP_TabelaPrecoAVencerTSOP_TABPREITEFAM002: TStringField;
    FDQueryTSOP_TabelaPrecoAVencerTSOP_TABPREITEFAM003: TStringField;
    FDQueryTSOP_TabelaPrecoAVencerTSOP_TABPREITEFAM004: TStringField;
    FDQueryTSOP_TabelaPrecoAVencerTSOP_TABPREITEFAM005: TStringField;
    FDQueryTSOP_TabelaPrecoTodosTSOP_TABPRESTA: TIntegerField;
    cxTableViewTabelaPrecoTodosTSOP_TABPRESTA: TcxGridDBColumn;
    cxSmallImages: TcxImageList;
    cxGridLevelTabelaPrecoGrafico: TcxGridLevel;
    cxTableViewTabelaPrecoGrafico: TcxGridDBChartView;
    DataSourceGrafico: TDataSource;
    FDQueryTSOP_TabelaPrecoGrafico: TFDQuery;
    FDQueryTSOP_TabelaPrecoGraficoTSOP_TABPRECOD: TIntegerField;
    FDQueryTSOP_TabelaPrecoGraficoTSOP_TABPRECANNOM: TStringField;
    FDQueryTSOP_TabelaPrecoGraficoTSOP_TABPRECLICOD: TStringField;
    FDQueryTSOP_TabelaPrecoGraficoTSOP_TABPRECLICGC: TStringField;
    FDQueryTSOP_TabelaPrecoGraficoTSOP_TABPRECLINOM: TStringField;
    FDQueryTSOP_TabelaPrecoGraficoTSOP_TABPREGRUCLINOM: TStringField;
    FDQueryTSOP_TabelaPrecoGraficoTSOP_GRUCLIMER: TStringField;
    FDQueryTSOP_TabelaPrecoGraficoTSOP_TABPREREPNOM: TStringField;
    FDQueryTSOP_TabelaPrecoGraficoTSOP_REPNOMINT: TStringField;
    FDQueryTSOP_TabelaPrecoGraficoTSOP_TABPREITECOD: TStringField;
    FDQueryTSOP_TabelaPrecoGraficoTSOP_TABPREITECLICOD: TStringField;
    FDQueryTSOP_TabelaPrecoGraficoTSOP_Z00PER: TBCDField;
    FDQueryTSOP_TabelaPrecoGraficoTSOP_Z00QTD: TBCDField;
    FDQueryTSOP_TabelaPrecoGraficoTSOP_Z00VLF: TFMTBCDField;
    FDQueryTSOP_TabelaPrecoGraficoTSOP_Z00UOM: TStringField;
    FDQueryTSOP_TabelaPrecoGraficoTSOP_Z00DATINI: TSQLTimeStampField;
    FDQueryTSOP_TabelaPrecoGraficoTSOP_Z00DATFIM: TSQLTimeStampField;
    FDQueryTSOP_TabelaPrecoGraficoTSOP_TABPREITEFAM001: TStringField;
    FDQueryTSOP_TabelaPrecoGraficoTSOP_TABPREITEFAM002: TStringField;
    FDQueryTSOP_TabelaPrecoGraficoTSOP_TABPREITEFAM003: TStringField;
    FDQueryTSOP_TabelaPrecoGraficoTSOP_TABPREITEFAM004: TStringField;
    FDQueryTSOP_TabelaPrecoGraficoTSOP_TABPREITEFAM005: TStringField;
    FDQueryTSOP_TabelaPrecoGraficoVencer: TIntegerField;
    FDQueryTSOP_TabelaPrecoGraficoVencido: TIntegerField;
    FDQueryTSOP_TabelaPrecoGraficoValido: TIntegerField;
    cxTableViewTabelaPrecoGraficoSeries1: TcxGridDBChartSeries;
    cxTableViewTabelaPrecoGraficoSeries2: TcxGridDBChartSeries;
    cxTableViewTabelaPrecoGraficoSeries3: TcxGridDBChartSeries;
    cxStyleRepository: TcxStyleRepository;
    cxStyleValido: TcxStyle;
    cxStyleVencido: TcxStyle;
    cxStyleVencidoPrecoNovo: TcxStyle;
    cxStyleVencer30Dias: TcxStyle;
    FDQueryTSOP_TabelaPrecoTodosTSOP_TABPREITENOM: TStringField;
    FDQueryTSOP_TabelaPrecoVencidosTSOP_TABPREITENOM: TStringField;
    FDQueryTSOP_TabelaPrecoAVencerTSOP_TABPREITENOM: TStringField;
    FDQueryTSOP_TabelaPrecoGraficoTSOP_TABPREITENOM: TStringField;
    cxTableViewTabelaPrecoTodosTSOP_TABPREITENOM: TcxGridDBColumn;
    cxTableViewTabelaPrecoVencidosTSOP_TABPREITENOM: TcxGridDBColumn;
    cxTableViewTabelaPrecoAVencerTSOP_TABPREITENOM: TcxGridDBColumn;
    PanelSQLSplashScreen: TPanel;
    ImageSQLSplashScreen: TImage;
    cxLabelMensagem: TcxLabel;
    cxGridLevelTabelaPrecoGraficoAnalitico: TcxGridLevel;
    cxTableViewTabelaPrecoGraficoAnalitico: TcxGridDBTableView;
    cxTableViewTabelaPrecoGraficoAnaliticoTSOP_TABPRESTA: TcxGridDBColumn;
    cxTableViewTabelaPrecoGraficoAnaliticoTSOP_TABPRECANNOM: TcxGridDBColumn;
    cxTableViewTabelaPrecoGraficoAnaliticoTSOP_TABPRECLICOD: TcxGridDBColumn;
    cxTableViewTabelaPrecoGraficoAnaliticoTSOP_TABPRECLICGC: TcxGridDBColumn;
    cxTableViewTabelaPrecoGraficoAnaliticoTSOP_TABPRECLINOM: TcxGridDBColumn;
    cxTableViewTabelaPrecoGraficoAnaliticoTSOP_TABPREGRUCLINOM: TcxGridDBColumn;
    cxTableViewTabelaPrecoGraficoAnaliticoTSOP_GRUCLIMER: TcxGridDBColumn;
    cxTableViewTabelaPrecoGraficoAnaliticoTSOP_TABPREREPNOM: TcxGridDBColumn;
    cxTableViewTabelaPrecoGraficoAnaliticoTSOP_REPNOMINT: TcxGridDBColumn;
    cxTableViewTabelaPrecoGraficoAnaliticoTSOP_TABPREITECOD: TcxGridDBColumn;
    cxTableViewTabelaPrecoGraficoAnaliticoTSOP_TABPREITENOM: TcxGridDBColumn;
    cxTableViewTabelaPrecoGraficoAnaliticoTSOP_TABPREITECLICOD: TcxGridDBColumn;
    cxTableViewTabelaPrecoGraficoAnaliticoTSOP_Z00PER: TcxGridDBColumn;
    cxTableViewTabelaPrecoGraficoAnaliticoTSOP_Z00QTD: TcxGridDBColumn;
    cxTableViewTabelaPrecoGraficoAnaliticoTSOP_Z00VLF: TcxGridDBColumn;
    cxTableViewTabelaPrecoGraficoAnaliticoTSOP_Z00UOM: TcxGridDBColumn;
    cxTableViewTabelaPrecoGraficoAnaliticoTSOP_Z00DATINI: TcxGridDBColumn;
    cxTableViewTabelaPrecoGraficoAnaliticoTSOP_Z00DATFIM: TcxGridDBColumn;
    cxTableViewTabelaPrecoGraficoAnaliticoTSOP_TABPREITEFAM001: TcxGridDBColumn;
    cxTableViewTabelaPrecoGraficoAnaliticoTSOP_TABPREITEFAM002: TcxGridDBColumn;
    cxTableViewTabelaPrecoGraficoAnaliticoTSOP_TABPREITEFAM003: TcxGridDBColumn;
    cxTableViewTabelaPrecoGraficoAnaliticoTSOP_TABPREITEFAM004: TcxGridDBColumn;
    cxTableViewTabelaPrecoGraficoAnaliticoTSOP_TABPREITEFAM005: TcxGridDBColumn;
    cxTableViewTabelaPrecoGraficoDataGroup1: TcxGridDBChartDataGroup;
    cxTableViewTabelaPrecoGraficoDataGroup2: TcxGridDBChartDataGroup;
    cxTableViewTabelaPrecoGraficoAnaliticoVencer: TcxGridDBColumn;
    cxTableViewTabelaPrecoGraficoAnaliticoVencido: TcxGridDBColumn;
    cxTableViewTabelaPrecoGraficoAnaliticoValido: TcxGridDBColumn;
    cxTableViewTabelaPrecoGraficoDataGroup3: TcxGridDBChartDataGroup;
    cxTableViewTabelaPrecoGraficoDataGroup4: TcxGridDBChartDataGroup;
    StyleRepository: TcxStyleRepository;
    styleActiveGroup: TcxStyle;
    FDQueryTSOP_TabelaPrecoGraficoTSOP_TABPRESTA: TIntegerField;
    cxTableViewTabelaPrecoGraficoDataGroup5: TcxGridDBChartDataGroup;
    FDQueryTSOP_TabelaPrecoTodosTSOP_TABPREORI: TStringField;
    FDQueryTSOP_TabelaPrecoVencidosTSOP_TABPREORI: TStringField;
    FDQueryTSOP_TabelaPrecoAVencerTSOP_TABPREORI: TStringField;
    FDQueryTSOP_TabelaPrecoGraficoTSOP_TABPREORI: TStringField;
    FDQueryTSOP_TabelaPrecoTodosTSOP_TABPREITEFAM: TStringField;
    FDQueryTSOP_TabelaPrecoVencidosTSOP_TABPREITEFAM: TStringField;
    FDQueryTSOP_TabelaPrecoAVencerTSOP_TABPREITEFAM: TStringField;
    FDQueryTSOP_TabelaPrecoGraficoTSOP_TABPREITEFAM: TStringField;
    cxTableViewTabelaPrecoTodosTSOP_TABPREORI: TcxGridDBColumn;
    cxTableViewTabelaPrecoTodosTSOP_TABPREITEFAM: TcxGridDBColumn;
    cxTableViewTabelaPrecoVencidosTSOP_TABPREORI: TcxGridDBColumn;
    cxTableViewTabelaPrecoVencidosTSOP_TABPREITEFAM: TcxGridDBColumn;
    cxTableViewTabelaPrecoAVencerTSOP_TABPREORI: TcxGridDBColumn;
    cxTableViewTabelaPrecoAVencerTSOP_TABPREITEFAM: TcxGridDBColumn;
    cxTableViewTabelaPrecoGraficoAnaliticoTSOP_TABPREORI: TcxGridDBColumn;
    cxTableViewTabelaPrecoGraficoAnaliticoTSOP_TABPREITEFAM: TcxGridDBColumn;
    FDQueryTSOP_TabelaPrecoTodosTSOP_Z00VLF: TFMTBCDField;
    FDQueryTSOP_TabelaPrecoTodosTSOP_TABPREID: TGuidField;
    FDQueryTSOP_TabelaPrecoVencidosTSOP_TABPREID: TGuidField;
    FDQueryTSOP_TabelaPrecoAVencerTSOP_TABPREID: TGuidField;
    FDQueryTSOP_TabelaPrecoGraficoTSOP_TABPREID: TGuidField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxGridTabelaPrecoActiveTabChanged(Sender: TcxCustomGrid; ALevel: TcxGridLevel);
    procedure cxTableViewTabelaPrecoGraficoSeries1ValueClick(Sender: TcxGridChartView; ASeries: TcxGridChartSeries;
      AValueIndex: Integer; var AHandled: Boolean);
    procedure cxTableViewTabelaPrecoGraficoAnaliticoStylesGetGroupStyle(Sender: TcxGridTableView; ARecord: TcxCustomGridRecord;
      ALevel: Integer; var AStyle: TcxStyle);
    procedure cxTableViewTabelaPrecoGraficoDataGroup5GetValueDisplayText(Sender: TObject; const AValue: Variant;
      var ADisplayText: string);
    procedure FormContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    procedure Mensagem( pMensagem: String );
    { Private declarations }
  public
    procedure AbrirDataset;
    procedure LoadGridCustomization;
    { Public declarations }
  protected
    ActiveDataGroups: array of Integer;
    procedure SynchronizeTableWithChart;
    procedure UpdateTableGroupingAndColumnVisibility;
    function GetColumnByChartItem(AChartItem: TcxGridChartItem): TcxGridDBColumn;
    procedure ShowTableActiveGroup;
  end;

var
  Fr_RelatorioPreco: TFr_RelatorioPreco;

implementation

{$R *.dfm}

uses uBrady, uUtils;

procedure TFr_RelatorioPreco.AbrirDataset;
begin

  Mensagem( 'Abrindo conexão...' );
  try

    FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );
    FDConnection.Open;

    Mensagem( 'Obtendo dados (Todos)...' );
    FDQueryTSOP_TabelaPrecoTodos.MacroByName( 'WHERE' ).Clear;
    if Fr_Brady.SalesRep then
    begin
      FDQueryTSOP_TabelaPrecoTodos.MacroByName( 'WHERE' ).AsRaw := 'AND (A01.TSOP_TABPREREPNOM = ' + QuotedStr(Fr_Brady.TSIS_USUNOM) + ' OR A01.TSOP_REPNOMINT = ' + QuotedStr(Fr_Brady.TSIS_USUNOM) + ')';
      FDQueryTSOP_TabelaPrecoTodos.SQL.Text := FDQueryTSOP_TabelaPrecoTodos.SQL.Text.Replace( 'VSOP_TabelaPrecoPID', 'VSOP_TabelaPreco' );
    end;
    FDQueryTSOP_TabelaPrecoTodos.Open;

    Mensagem( 'Obtendo dados (Vencidos)...' );
    FDQueryTSOP_TabelaPrecoVencidos.MacroByName( 'WHERE' ).Clear;
    if Fr_Brady.SalesRep then
    begin
      FDQueryTSOP_TabelaPrecoVencidos.MacroByName( 'WHERE' ).AsRaw := 'AND (A01.TSOP_TABPREREPNOM = ' + QuotedStr(Fr_Brady.TSIS_USUNOM) + ' OR A01.TSOP_REPNOMINT = ' + QuotedStr(Fr_Brady.TSIS_USUNOM) + ')';
      FDQueryTSOP_TabelaPrecoVencidos.SQL.Text := FDQueryTSOP_TabelaPrecoVencidos.SQL.Text.Replace( 'VSOP_TabelaPrecoPID', 'VSOP_TabelaPreco' );
    end;
    FDQueryTSOP_TabelaPrecoVencidos.Open;

    Mensagem( 'Obtendo dados (A Vencer)...' );
    FDQueryTSOP_TabelaPrecoAVencer.MacroByName( 'WHERE' ).Clear;
    if Fr_Brady.SalesRep then
    begin
      FDQueryTSOP_TabelaPrecoAVencer.MacroByName( 'WHERE' ).AsRaw := 'AND (A01.TSOP_TABPREREPNOM = ' + QuotedStr(Fr_Brady.TSIS_USUNOM) + ' OR A01.TSOP_REPNOMINT = ' + QuotedStr(Fr_Brady.TSIS_USUNOM) + ')';
      FDQueryTSOP_TabelaPrecoAVencer.SQL.Text := FDQueryTSOP_TabelaPrecoAVencer.SQL.Text.Replace( 'VSOP_TabelaPrecoPID', 'VSOP_TabelaPreco' );
    end;
    FDQueryTSOP_TabelaPrecoAVencer.Open;

    Mensagem( 'Obtendo dados (Gráfico)...' );
    FDQueryTSOP_TabelaPrecoGrafico.MacroByName( 'WHERE' ).Clear;
    if Fr_Brady.SalesRep then
    begin
      FDQueryTSOP_TabelaPrecoGrafico.MacroByName( 'WHERE' ).AsRaw := 'AND (A01.TSOP_TABPREREPNOM = ' + QuotedStr(Fr_Brady.TSIS_USUNOM) + ' OR A01.TSOP_REPNOMINT = ' + QuotedStr(Fr_Brady.TSIS_USUNOM) + ')';
      FDQueryTSOP_TabelaPrecoGrafico.SQL.Text := FDQueryTSOP_TabelaPrecoGrafico.SQL.Text.Replace( 'VSOP_TabelaPrecoPID', 'VSOP_TabelaPreco' );
    end;
    FDQueryTSOP_TabelaPrecoGrafico.Open;

  finally

    Mensagem( EmptyStr );

  end;

end;

procedure TFr_RelatorioPreco.cxGridTabelaPrecoActiveTabChanged(Sender: TcxCustomGrid; ALevel: TcxGridLevel);
begin

  if ALevel = cxGridLevelTabelaPrecoGraficoAnalitico then
    SynchronizeTableWithChart;

end;

procedure TFr_RelatorioPreco.cxTableViewTabelaPrecoGraficoAnaliticoStylesGetGroupStyle(Sender: TcxGridTableView;
  ARecord: TcxCustomGridRecord; ALevel: Integer; var AStyle: TcxStyle);
var
  ADataGroupIndex, I: Integer;
begin
  if ARecord = nil then Exit;
  ADataGroupIndex := cxTableViewTabelaPrecoGraficoAnalitico.DataController.Groups.DataGroupIndexByRowIndex[ARecord.Index];
  for I := 0 to Length(ActiveDataGroups) - 1 do
    if ADataGroupIndex = ActiveDataGroups[I] then
    begin
      AStyle := styleActiveGroup;
      Break;
    end;
end;

procedure TFr_RelatorioPreco.cxTableViewTabelaPrecoGraficoDataGroup5GetValueDisplayText(Sender: TObject; const AValue: Variant;
  var ADisplayText: string);
begin

  if AValue = 0 then
    ADisplayText := 'Vence nos próximos 30 dias'
  else
  if AValue = 1 then
    ADisplayText := 'Vencido'
  else
  if AValue = 2 then
    ADisplayText := 'Vencido com preço novo'
  else
  if AValue = 3 then
    ADisplayText := 'Válido';

end;

procedure TFr_RelatorioPreco.cxTableViewTabelaPrecoGraficoSeries1ValueClick(Sender: TcxGridChartView;
  ASeries: TcxGridChartSeries; AValueIndex: Integer; var AHandled: Boolean);
begin

  if cxTableViewTabelaPrecoGrafico.ActiveDataLevel = 4 then
  begin

    AHandled := True;
    cxGridLevelTabelaPrecoGraficoAnalitico.Active := True;

  end;

end;

procedure TFr_RelatorioPreco.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  FDQueryTSOP_TabelaPrecoTodos.Close;
  FDQueryTSOP_TabelaPrecoVencidos.Close;
  FDQueryTSOP_TabelaPrecoAVencer.Close;
  FDQueryTSOP_TabelaPrecoGrafico.Close;
  FDConnection.Close;

  Fr_RelatorioPreco := nil;
  Action := caFree;

end;

procedure TFr_RelatorioPreco.FormContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
begin

  Fr_Brady.PopupGridTools( cxGridTabelaPreco.ActiveView );

end;

procedure TFr_RelatorioPreco.FormCreate(Sender: TObject);
begin

//  if not Fr_Brady.SalesRep then
//  begin

//    cxGridLevelTabelaPrecoTodos.Visible := False;
//    cxGridLevelTabelaPrecoGrafico.Visible := False;
//    cxGridLevelTabelaPrecoGraficoAnalitico.Visible := False;

//  end;

  LoadGridCustomization;

end;

function TFr_RelatorioPreco.GetColumnByChartItem(AChartItem: TcxGridChartItem): TcxGridDBColumn;
begin

  Result := cxTableViewTabelaPrecoGraficoAnalitico.GetColumnByFieldName(TcxGridDBChartItemDataBinding(AChartItem.DataBinding).FieldName);

end;

procedure TFr_RelatorioPreco.LoadGridCustomization;
begin

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxTableViewTabelaPrecoTodos.Name + '.ini' ) then
    cxTableViewTabelaPrecoTodos.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxTableViewTabelaPrecoTodos.Name + '.ini' );

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxTableViewTabelaPrecoVencidos.Name + '.ini' ) then
    cxTableViewTabelaPrecoVencidos.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxTableViewTabelaPrecoVencidos.Name + '.ini' );

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxTableViewTabelaPrecoAVencer.Name + '.ini' ) then
    cxTableViewTabelaPrecoAVencer.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxTableViewTabelaPrecoAVencer.Name + '.ini' );

end;

procedure TFr_RelatorioPreco.Mensagem(pMensagem: String);
begin

  cxLabelMensagem.Caption := pMensagem;
  PanelSQLSplashScreen.Visible := not pMensagem.IsEmpty;
  Update;
  Application.ProcessMessages;

end;

procedure TFr_RelatorioPreco.ShowTableActiveGroup;
var
  I, ADataGroupIndex, AGroupRowIndex: Integer;
  ARow: TcxCustomGridRow;

begin

  SetLength(ActiveDataGroups, cxTableViewTabelaPrecoGrafico.ActiveDataLevel);
  cxTableViewTabelaPrecoGraficoAnalitico.BeginUpdate;
  try

    cxTableViewTabelaPrecoGraficoAnalitico.DataController.Groups.FullCollapse;
    ADataGroupIndex := -1;

    for I := 0 to cxTableViewTabelaPrecoGrafico.ActiveDataLevel - 1 do
    begin

      ADataGroupIndex := cxTableViewTabelaPrecoGraficoAnalitico.DataController.Groups.GetDataGroupIndexByGroupValue(
        ADataGroupIndex, cxTableViewTabelaPrecoGrafico.VisibleDataGroups[I].ActiveValue);

      ActiveDataGroups[I] := ADataGroupIndex;

      AGroupRowIndex := cxTableViewTabelaPrecoGraficoAnalitico.DataController.DataControllerInfo.DataGroups[ADataGroupIndex].RowIndex;
      cxTableViewTabelaPrecoGraficoAnalitico.DataController.Groups.ChangeExpanding(AGroupRowIndex, True, False);
      cxTableViewTabelaPrecoGraficoAnalitico.Controller.FocusedRowIndex := AGroupRowIndex;

    end;

  finally

    cxTableViewTabelaPrecoGraficoAnalitico.EndUpdate;

  end;

  cxTableViewTabelaPrecoGraficoAnalitico.BeginUpdate;
  try

    if ADataGroupIndex = -1 then
    begin

      cxTableViewTabelaPrecoGraficoAnalitico.Controller.SelectAll

    end
    else
    begin

      cxTableViewTabelaPrecoGraficoAnalitico.Controller.ClearSelection;
      for I := cxTableViewTabelaPrecoGraficoAnalitico.Controller.FocusedRowIndex + 1 to cxTableViewTabelaPrecoGraficoAnalitico.ViewData.RowCount - 1 do
      begin

        ARow := cxTableViewTabelaPrecoGraficoAnalitico.ViewData.Rows[I];
        if ARow.Level = cxTableViewTabelaPrecoGrafico.ActiveDataLevel then
        begin

          ARow.Focused := True;
          ARow.Selected := True;

        end
        else
        begin

          Break;

        end;

      end;

    end;

  finally

    cxTableViewTabelaPrecoGraficoAnalitico.EndUpdate;

  end;

end;

procedure TFr_RelatorioPreco.SynchronizeTableWithChart;
begin

  UpdateTableGroupingAndColumnVisibility;
  ShowTableActiveGroup;

end;

procedure TFr_RelatorioPreco.UpdateTableGroupingAndColumnVisibility;
var
  I: Integer;

begin

  cxTableViewTabelaPrecoGraficoAnalitico.BeginUpdate;
  try
    cxTableViewTabelaPrecoGraficoAnalitico.Controller.ClearGrouping;
    for I := 0 to cxTableViewTabelaPrecoGrafico.VisibleDataGroupCount - 1 do
      GetColumnByChartItem(cxTableViewTabelaPrecoGrafico.VisibleDataGroups[I]).GroupIndex := I;

    for I := 0 to cxTableViewTabelaPrecoGrafico.DataGroupCount - 1 do
      GetColumnByChartItem(cxTableViewTabelaPrecoGrafico.DataGroups[I]).Visible := cxTableViewTabelaPrecoGrafico.DataGroups[I].Visible;
    for I := 0 to cxTableViewTabelaPrecoGrafico.SeriesCount - 1 do
      GetColumnByChartItem(cxTableViewTabelaPrecoGrafico.Series[I]).Visible := cxTableViewTabelaPrecoGrafico.Series[I].Visible;
  finally
    cxTableViewTabelaPrecoGraficoAnalitico.EndUpdate;
  end;

end;

end.
