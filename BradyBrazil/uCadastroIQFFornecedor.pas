unit uCadastroIQFFornecedor;

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
  cxCheckBox, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
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
  TFr_CadastroIQFFornecedor = class(TForm)
    cxGridIQF_Fornecedor: TcxGrid;
    cxGridLevelIQF_Fornecedor: TcxGridLevel;
    cxTableViewIQF_Fornecedor: TcxGridDBTableView;
    DataSourceTIQF_Fornecedor: TDataSource;
    FDConnection: TFDConnection;
    FDQueryTIQF_Fornecedor: TFDQuery;
    PanelSQLSplashScreen: TPanel;
    ImageSQLSplashScreen: TImage;
    cxLabelMensagem: TcxLabel;
    FDQueryTIQF_FornecedorTIQF_FORCOD: TFDAutoIncField;
    FDQueryTIQF_FornecedorTIQF_FORSAP: TStringField;
    FDQueryTIQF_FornecedorTIQF_FORNOM: TStringField;
    FDQueryTIQF_FornecedorTIQF_FORATI: TStringField;
    cxTableViewIQF_FornecedorTIQF_FORCOD: TcxGridDBColumn;
    cxTableViewIQF_FornecedorTIQF_FORSAP: TcxGridDBColumn;
    cxTableViewIQF_FornecedorTIQF_FORNOM: TcxGridDBColumn;
    cxTableViewIQF_FornecedorTIQF_FORATI: TcxGridDBColumn;
    FDQueryTIQF_FornecedorTIQF_FORCER: TStringField;
    cxTableViewIQF_FornecedorTIQF_FORCER: TcxGridDBColumn;
    FDQueryTIQF_FornecedorTIQF_FORCERDATVAL: TSQLTimeStampField;
    cxTableViewIQF_FornecedorTIQF_FORCERDATVAL: TcxGridDBColumn;
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
  Fr_CadastroIQFFornecedor: TFr_CadastroIQFFornecedor;

implementation

{$R *.dfm}

uses uUtils, uBrady;

procedure TFr_CadastroIQFFornecedor.AbrirDataset;
begin

  if not FDConnection.Connected then
  begin

    Mensagem( 'Abrindo conexão...' );
    try

      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );
      FDConnection.Open;

      Mensagem( 'Obtendo dados (IQF Fornecedores)...' );
      FDQueryTIQF_Fornecedor.Open;

    finally

      Mensagem( EmptyStr );

    end;

  end;

end;

procedure TFr_CadastroIQFFornecedor.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  FDQueryTIQF_Fornecedor.Close;
  FDConnection.Close;

  Fr_CadastroIQFFornecedor := nil;
  Action := caFree;

end;

procedure TFr_CadastroIQFFornecedor.FormContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
begin

  Fr_Brady.PopupGridTools( cxGridIQF_Fornecedor.ActiveView );

end;

procedure TFr_CadastroIQFFornecedor.FormCreate(Sender: TObject);
begin

  LoadGridCustomization;

end;

procedure TFr_CadastroIQFFornecedor.LoadGridCustomization;
begin

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxTableViewIQF_Fornecedor.Name + '.ini' ) then
    cxTableViewIQF_Fornecedor.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxTableViewIQF_Fornecedor.Name + '.ini' );

end;

procedure TFr_CadastroIQFFornecedor.Mensagem(pMensagem: String);
begin

  cxLabelMensagem.Caption := pMensagem;
  PanelSQLSplashScreen.Visible := not pMensagem.IsEmpty;
  Update;
  Application.ProcessMessages;

end;

end.
