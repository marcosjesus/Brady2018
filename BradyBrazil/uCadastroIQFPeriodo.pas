unit uCadastroIQFPeriodo;

interface

uses
  System.IOUtils,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
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
  TFr_CadastroIQFPeriodo = class(TForm)
    cxGridIQF_Periodo: TcxGrid;
    cxGridLevelIQF_Periodo: TcxGridLevel;
    cxTableViewIQF_Periodo: TcxGridDBTableView;
    DataSourceTIQF_Periodo: TDataSource;
    FDConnection: TFDConnection;
    FDQueryTIQF_Periodo: TFDQuery;
    PanelSQLSplashScreen: TPanel;
    ImageSQLSplashScreen: TImage;
    cxLabelMensagem: TcxLabel;
    FDQueryTIQF_PeriodoTIQF_PERCOD: TFDAutoIncField;
    FDQueryTIQF_PeriodoTIQF_PERNOM: TStringField;
    FDQueryTIQF_PeriodoTIQF_PERDAT: TSQLTimeStampField;
    cxTableViewIQF_PeriodoTIQF_PERCOD: TcxGridDBColumn;
    cxTableViewIQF_PeriodoTIQF_PERNOM: TcxGridDBColumn;
    cxTableViewIQF_PeriodoTIQF_PERDAT: TcxGridDBColumn;
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
  Fr_CadastroIQFPeriodo: TFr_CadastroIQFPeriodo;

implementation

{$R *.dfm}

uses uUtils, uBrady;

procedure TFr_CadastroIQFPeriodo.AbrirDataset;
begin

  if not FDConnection.Connected then
  begin

    Mensagem( 'Abrindo conex�o...' );
    try

      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );
      FDConnection.Open;

      Mensagem( 'Obtendo dados (IQF Periodos)...' );
      FDQueryTIQF_Periodo.Open;

    finally

      Mensagem( EmptyStr );

    end;

  end;

end;

procedure TFr_CadastroIQFPeriodo.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  FDQueryTIQF_Periodo.Close;
  FDConnection.Close;

  Fr_CadastroIQFPeriodo := nil;
  Action := caFree;

end;

procedure TFr_CadastroIQFPeriodo.FormContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
begin

  Fr_Brady.PopupGridTools( cxGridIQF_Periodo.ActiveView );

end;

procedure TFr_CadastroIQFPeriodo.FormCreate(Sender: TObject);
begin

  LoadGridCustomization;

end;

procedure TFr_CadastroIQFPeriodo.LoadGridCustomization;
begin

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxTableViewIQF_Periodo.Name + '.ini' ) then
    cxTableViewIQF_Periodo.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxTableViewIQF_Periodo.Name + '.ini' );

end;

procedure TFr_CadastroIQFPeriodo.Mensagem(pMensagem: String);
begin

  cxLabelMensagem.Caption := pMensagem;
  PanelSQLSplashScreen.Visible := not pMensagem.IsEmpty;
  Update;
  Application.ProcessMessages;

end;

end.