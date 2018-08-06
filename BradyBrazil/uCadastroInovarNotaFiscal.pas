unit uCadastroInovarNotaFiscal;

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
  TFr_CadastroInovarNotaFiscal = class(TForm)
    cxGridNotaFiscal: TcxGrid;
    cxGridLevelNotaFiscal: TcxGridLevel;
    cxTableViewNotaFiscal: TcxGridDBTableView;
    DataSourceTFIS_NotaFiscal: TDataSource;
    FDConnection: TFDConnection;
    FDQueryTFIS_NotaFiscal: TFDQuery;
    PanelSQLSplashScreen: TPanel;
    ImageSQLSplashScreen: TImage;
    cxLabelMensagem: TcxLabel;
    FDQueryTFIS_NotaFiscalTFIS_NOTFISANOMES: TStringField;
    FDQueryTFIS_NotaFiscalTFIS_NOTFISDATEMI: TSQLTimeStampField;
    FDQueryTFIS_NotaFiscalTFIS_NOTFISCLI: TStringField;
    FDQueryTFIS_NotaFiscalTFIS_NOTFISNUM: TStringField;
    FDQueryTFIS_NotaFiscalTFIS_NOTFISITE: TStringField;
    FDQueryTFIS_NotaFiscalTFIS_NOTFISCFO: TStringField;
    FDQueryTFIS_NotaFiscalTFIS_NOTFISQTD: TFMTBCDField;
    FDQueryTFIS_NotaFiscalTFIS_NOTFISVAL: TFMTBCDField;
    cxTableViewNotaFiscalTFIS_NOTFISANOMES: TcxGridDBColumn;
    cxTableViewNotaFiscalTFIS_NOTFISDATEMI: TcxGridDBColumn;
    cxTableViewNotaFiscalTFIS_NOTFISCLI: TcxGridDBColumn;
    cxTableViewNotaFiscalTFIS_NOTFISNUM: TcxGridDBColumn;
    cxTableViewNotaFiscalTFIS_NOTFISITE: TcxGridDBColumn;
    cxTableViewNotaFiscalTFIS_NOTFISCFO: TcxGridDBColumn;
    cxTableViewNotaFiscalTFIS_NOTFISQTD: TcxGridDBColumn;
    cxTableViewNotaFiscalTFIS_NOTFISVAL: TcxGridDBColumn;
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
  Fr_CadastroInovarNotaFiscal: TFr_CadastroInovarNotaFiscal;

implementation

{$R *.dfm}

uses uUtils, uBrady;

procedure TFr_CadastroInovarNotaFiscal.AbrirDataset;
begin

  if not FDConnection.Connected then
  begin

    Mensagem( 'Abrindo conexão...' );
    try

      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );
      FDConnection.Open;

      Mensagem( 'Obtendo dados (Inovar NotaFiscal)...' );
      FDQueryTFIS_NotaFiscal.Open;

    finally

      Mensagem( EmptyStr );

    end;

  end;

end;

procedure TFr_CadastroInovarNotaFiscal.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  FDQueryTFIS_NotaFiscal.Close;
  FDConnection.Close;

  Fr_CadastroInovarNotaFiscal := nil;
  Action := caFree;

end;

procedure TFr_CadastroInovarNotaFiscal.FormContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
begin

  Fr_Brady.PopupGridTools( cxGridNotaFiscal.ActiveView );

end;

procedure TFr_CadastroInovarNotaFiscal.FormCreate(Sender: TObject);
begin

  LoadGridCustomization;

end;

procedure TFr_CadastroInovarNotaFiscal.LoadGridCustomization;
begin

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxTableViewNotaFiscal.Name + '.ini' ) then
    cxTableViewNotaFiscal.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxTableViewNotaFiscal.Name + '.ini' );

end;

procedure TFr_CadastroInovarNotaFiscal.Mensagem(pMensagem: String);
begin

  cxLabelMensagem.Caption := pMensagem;
  PanelSQLSplashScreen.Visible := not pMensagem.IsEmpty;
  Update;
  Application.ProcessMessages;

end;

end.
