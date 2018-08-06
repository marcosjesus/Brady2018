unit uCadastroDeParaCanal;

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
  TFr_CadastroDeParaCanal = class(TForm)
    cxGridDeParaCanal: TcxGrid;
    cxGridLevelDeParaCanal: TcxGridLevel;
    cxTableViewDeParaCanal: TcxGridDBTableView;
    DataSourceTSOP_DeParaCanal: TDataSource;
    FDConnection: TFDConnection;
    FDQueryTSOP_DeParaCanal: TFDQuery;
    PanelSQLSplashScreen: TPanel;
    ImageSQLSplashScreen: TImage;
    cxLabelMensagem: TcxLabel;
    FDQueryTSOP_DeParaCanalTSOP_DPACANCOD: TFDAutoIncField;
    FDQueryTSOP_DeParaCanalTSOP_ORICOD: TIntegerField;
    FDQueryTSOP_DeParaCanalTSOP_DPACANTXTANT: TStringField;
    FDQueryTSOP_DeParaCanalTSOP_DPACANTXTDEP: TStringField;
    FDQueryTSOP_DeParaCanalTSOP_USUCODCAD: TIntegerField;
    FDQueryTSOP_DeParaCanalTSOP_DPACANDATCAD: TSQLTimeStampField;
    FDQueryTSOP_DeParaCanalTSOP_USUCODALT: TIntegerField;
    FDQueryTSOP_DeParaCanalTSOP_DPACANDATALT: TSQLTimeStampField;
    cxTableViewDeParaCanalTSOP_DPACANCOD: TcxGridDBColumn;
    cxTableViewDeParaCanalTSOP_DPACANTXTANT: TcxGridDBColumn;
    cxTableViewDeParaCanalTSOP_DPACANTXTDEP: TcxGridDBColumn;
    FDQueryTSOP_DeParaCanalTSOP_DPACANTIPTXT: TStringField;
    cxTableViewDeParaCanalTSOP_DPACANTIPTXT: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FDQueryTSOP_DeParaCanalNewRecord(DataSet: TDataSet);
    procedure FDQueryTSOP_DeParaCanalAfterEdit(DataSet: TDataSet);
  private
    procedure Mensagem( pMensagem: String );
    { Private declarations }
  public
    procedure AbrirDataset;
    procedure LoadGridCustomization;
    { Public declarations }
  end;

var
  Fr_CadastroDeParaCanal: TFr_CadastroDeParaCanal;

implementation

{$R *.dfm}

uses uUtils, uBrady;

procedure TFr_CadastroDeParaCanal.AbrirDataset;
begin

  if not FDConnection.Connected then
  begin

    Mensagem( 'Abrindo conexão...' );
    try

      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );
      FDConnection.Open;

      Mensagem( 'Obtendo dados (De/Para Canal)...' );
      FDQueryTSOP_DeParaCanal.Open;

    finally

      Mensagem( EmptyStr );

    end;

  end;

end;

procedure TFr_CadastroDeParaCanal.FDQueryTSOP_DeParaCanalAfterEdit(DataSet: TDataSet);
begin

  FDQueryTSOP_DeParaCanalTSOP_ORICOD.AsInteger := 1;
  FDQueryTSOP_DeParaCanalTSOP_USUCODALT.AsInteger := 1;
  FDQueryTSOP_DeParaCanalTSOP_DPACANDATALT.AsDateTime := Now;

end;

procedure TFr_CadastroDeParaCanal.FDQueryTSOP_DeParaCanalNewRecord(DataSet: TDataSet);
begin

  FDQueryTSOP_DeParaCanalTSOP_ORICOD.AsInteger := 1;
  FDQueryTSOP_DeParaCanalTSOP_DPACANTIPTXT.AsString := 'S';
  FDQueryTSOP_DeParaCanalTSOP_USUCODCAD.AsInteger := 1;
  FDQueryTSOP_DeParaCanalTSOP_USUCODALT.AsInteger := 1;
  FDQueryTSOP_DeParaCanalTSOP_DPACANDATCAD.AsDateTime := Now;
  FDQueryTSOP_DeParaCanalTSOP_DPACANDATALT.AsDateTime := Now;

end;

procedure TFr_CadastroDeParaCanal.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  FDQueryTSOP_DeParaCanal.Close;
  FDConnection.Close;

  Fr_CadastroDeParaCanal := nil;
  Action := caFree;

end;

procedure TFr_CadastroDeParaCanal.FormContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
begin

  Fr_Brady.PopupGridTools( cxGridDeParaCanal.ActiveView );

end;

procedure TFr_CadastroDeParaCanal.FormCreate(Sender: TObject);
begin

  LoadGridCustomization;

end;

procedure TFr_CadastroDeParaCanal.LoadGridCustomization;
begin

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxTableViewDeParaCanal.Name + '.ini' ) then
    cxTableViewDeParaCanal.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxTableViewDeParaCanal.Name + '.ini' );

end;

procedure TFr_CadastroDeParaCanal.Mensagem(pMensagem: String);
begin

  cxLabelMensagem.Caption := pMensagem;
  PanelSQLSplashScreen.Visible := not pMensagem.IsEmpty;
  Update;
  Application.ProcessMessages;

end;

end.
