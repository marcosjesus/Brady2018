unit uConsultaInovarParcelaDedutivel;

interface

uses
  System.IOUtils,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxCheckBox,
  cxContainer, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxLabel, dxGDIPlusClasses, Vcl.ExtCtrls, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, dxSkinOffice2013White,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue;

type
  TFr_ConsultaInovarParcelaDedutivel = class(TForm)
    cxGridParcelaDedutivel: TcxGrid;
    cxGridLevelParcelaDedutivel: TcxGridLevel;
    cxTableViewParcelaDedutivel: TcxGridDBTableView;
    DataSourceTFIS_ParcelaDedutivel: TDataSource;
    FDConnection: TFDConnection;
    FDQueryVFIS_ParcelaDedutivel: TFDQuery;
    PanelSQLSplashScreen: TPanel;
    ImageSQLSplashScreen: TImage;
    cxLabelMensagem: TcxLabel;
    FDQueryVFIS_ParcelaDedutivelTFIS_ITECOD: TStringField;
    FDQueryVFIS_ParcelaDedutivelTFIS_PARDEDANOMES: TStringField;
    FDQueryVFIS_ParcelaDedutivelTFIS_ITEPARDED: TFMTBCDField;
    cxTableViewParcelaDedutivelTFIS_ITECOD: TcxGridDBColumn;
    cxTableViewParcelaDedutivelTFIS_PARDEDANOMES: TcxGridDBColumn;
    cxTableViewParcelaDedutivelTFIS_ITEPARDED: TcxGridDBColumn;
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
  Fr_ConsultaInovarParcelaDedutivel: TFr_ConsultaInovarParcelaDedutivel;

implementation

{$R *.dfm}

uses uUtils, uBrady;

procedure TFr_ConsultaInovarParcelaDedutivel.AbrirDataset;
begin

  if not FDConnection.Connected then
  begin

    Mensagem( 'Abrindo conexão...' );
    try

      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );
      FDConnection.Open;

      Mensagem( 'Obtendo dados (Inovar ParcelaDedutivel)...' );
      FDQueryVFIS_ParcelaDedutivel.Open;

    finally

      Mensagem( EmptyStr );

    end;

  end;

end;

procedure TFr_ConsultaInovarParcelaDedutivel.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  FDQueryVFIS_ParcelaDedutivel.Close;
  FDConnection.Close;

  Fr_ConsultaInovarParcelaDedutivel := nil;
  Action := caFree;

end;

procedure TFr_ConsultaInovarParcelaDedutivel.FormContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
begin

  Fr_Brady.PopupGridTools( cxGridParcelaDedutivel.ActiveView );

end;

procedure TFr_ConsultaInovarParcelaDedutivel.FormCreate(Sender: TObject);
begin

  LoadGridCustomization;

end;

procedure TFr_ConsultaInovarParcelaDedutivel.LoadGridCustomization;
begin

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxTableViewParcelaDedutivel.Name + '.ini' ) then
    cxTableViewParcelaDedutivel.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxTableViewParcelaDedutivel.Name + '.ini' );

end;

procedure TFr_ConsultaInovarParcelaDedutivel.Mensagem(pMensagem: String);
begin

  cxLabelMensagem.Caption := pMensagem;
  PanelSQLSplashScreen.Visible := not pMensagem.IsEmpty;
  Update;
  Application.ProcessMessages;

end;

end.
