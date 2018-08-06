unit uCadastroInovarParcelaDedutivel;

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
  TFr_CadastroInovarParcelaDedutivel = class(TForm)
    cxGridParcelaDedutivel: TcxGrid;
    cxGridLevelParcelaDedutivel: TcxGridLevel;
    cxTableViewParcelaDedutivel: TcxGridDBTableView;
    DataSourceTFIS_ParcelaDedutivel: TDataSource;
    FDConnection: TFDConnection;
    FDQueryTFIS_ParcelaDedutivel: TFDQuery;
    PanelSQLSplashScreen: TPanel;
    ImageSQLSplashScreen: TImage;
    cxLabelMensagem: TcxLabel;
    FDQueryTFIS_ParcelaDedutivelTFIS_PARDEDCOD: TFDAutoIncField;
    FDQueryTFIS_ParcelaDedutivelTFIS_ITECOD: TStringField;
    FDQueryTFIS_ParcelaDedutivelTFIS_ITEQTD: TFMTBCDField;
    FDQueryTFIS_ParcelaDedutivelTFIS_ITEQTDMPR: TFMTBCDField;
    FDQueryTFIS_ParcelaDedutivelTFIS_ITEORIMPR: TIntegerField;
    FDQueryTFIS_ParcelaDedutivelTFIS_ITEPREPORMPR: TFMTBCDField;
    FDQueryTFIS_ParcelaDedutivelTFIS_ITEPREMPR: TFMTBCDField;
    FDQueryTFIS_ParcelaDedutivelTFIS_PARDEDANOMES: TStringField;
    cxTableViewParcelaDedutivelTFIS_PARDEDCOD: TcxGridDBColumn;
    cxTableViewParcelaDedutivelTFIS_ITECOD: TcxGridDBColumn;
    cxTableViewParcelaDedutivelTFIS_ITEQTD: TcxGridDBColumn;
    cxTableViewParcelaDedutivelTFIS_ITEQTDMPR: TcxGridDBColumn;
    cxTableViewParcelaDedutivelTFIS_ITEORIMPR: TcxGridDBColumn;
    cxTableViewParcelaDedutivelTFIS_ITEPREPORMPR: TcxGridDBColumn;
    cxTableViewParcelaDedutivelTFIS_ITEPREMPR: TcxGridDBColumn;
    cxTableViewParcelaDedutivelTFIS_PARDEDANOMES: TcxGridDBColumn;
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
  Fr_CadastroInovarParcelaDedutivel: TFr_CadastroInovarParcelaDedutivel;

implementation

{$R *.dfm}

uses uUtils, uBrady;

procedure TFr_CadastroInovarParcelaDedutivel.AbrirDataset;
begin

  if not FDConnection.Connected then
  begin

    Mensagem( 'Abrindo conexão...' );
    try

      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );
      FDConnection.Open;

      Mensagem( 'Obtendo dados (Inovar ParcelaDedutivel)...' );
      FDQueryTFIS_ParcelaDedutivel.Open;

    finally

      Mensagem( EmptyStr );

    end;

  end;

end;

procedure TFr_CadastroInovarParcelaDedutivel.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  FDQueryTFIS_ParcelaDedutivel.Close;
  FDConnection.Close;

  Fr_CadastroInovarParcelaDedutivel := nil;
  Action := caFree;

end;

procedure TFr_CadastroInovarParcelaDedutivel.FormContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
begin

  Fr_Brady.PopupGridTools( cxGridParcelaDedutivel.ActiveView );

end;

procedure TFr_CadastroInovarParcelaDedutivel.FormCreate(Sender: TObject);
begin

  LoadGridCustomization;

end;

procedure TFr_CadastroInovarParcelaDedutivel.LoadGridCustomization;
begin

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxTableViewParcelaDedutivel.Name + '.ini' ) then
    cxTableViewParcelaDedutivel.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxTableViewParcelaDedutivel.Name + '.ini' );

end;

procedure TFr_CadastroInovarParcelaDedutivel.Mensagem(pMensagem: String);
begin

  cxLabelMensagem.Caption := pMensagem;
  PanelSQLSplashScreen.Visible := not pMensagem.IsEmpty;
  Update;
  Application.ProcessMessages;

end;

end.
