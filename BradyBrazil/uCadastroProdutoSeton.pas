unit uCadastroProdutoSeton;

interface

uses
  System.IOUtils,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxLabel, dxGDIPlusClasses, Vcl.ExtCtrls, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, dxSkinOffice2013White;

type
  TFr_CadastroProdutoSeton = class(TForm)
    cxGridDeParaSite: TcxGrid;
    cxGridLevelDeParaSite: TcxGridLevel;
    cxTableViewDeParaSite: TcxGridDBTableView;
    DataSourceTSOP_CadastroProdutoSeton: TDataSource;
    FDConnection: TFDConnection;
    FDQueryTSOP_CadastroProdutoSeton: TFDQuery;
    PanelSQLSplashScreen: TPanel;
    ImageSQLSplashScreen: TImage;
    cxLabelMensagem: TcxLabel;
    FDQueryTSOP_CadastroProdutoSetonTSOP_PROSETCOD: TFDAutoIncField;
    FDQueryTSOP_CadastroProdutoSetonTSOP_YNUMBER: TStringField;
    FDQueryTSOP_CadastroProdutoSetonTSOP_CODSETON: TStringField;
    FDQueryTSOP_CadastroProdutoSetonTSOP_DESCRICAO: TStringField;
    FDQueryTSOP_CadastroProdutoSetonTSOP_DTAULTATUALIZACAO: TSQLTimeStampField;
    cxTableViewDeParaSiteTSOP_PROSETCOD: TcxGridDBColumn;
    cxTableViewDeParaSiteTSOP_YNUMBER: TcxGridDBColumn;
    cxTableViewDeParaSiteTSOP_CODSETON: TcxGridDBColumn;
    cxTableViewDeParaSiteTSOP_DESCRICAO: TcxGridDBColumn;
    cxTableViewDeParaSiteTSOP_ATUAL: TcxGridDBColumn;
    FDQueryTSOP_CadastroProdutoSetonTSOP_ATUAL: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FDQueryTSOP_CadastroProdutoSetonNewRecord(DataSet: TDataSet);
    procedure FDQueryTSOP_CadastroProdutoSetonAfterEdit(DataSet: TDataSet);
  private
    procedure Mensagem( pMensagem: String );
    { Private declarations }
  public
    procedure AbrirDataset;
    procedure LoadGridCustomization;
    { Public declarations }
  end;

var
  Fr_CadastroProdutoSeton: TFr_CadastroProdutoSeton;

implementation

{$R *.dfm}

uses uUtils, uBrady;

procedure TFr_CadastroProdutoSeton.AbrirDataset;
begin

  if not FDConnection.Connected then
  begin

    Mensagem( 'Abrindo conexão...' );
    try

      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );
      FDConnection.Open;

      Mensagem( 'Obtendo dados (Produtos Seton)...' );
      FDQueryTSOP_CadastroProdutoSeton.Open;

    finally

      Mensagem( EmptyStr );

    end;

  end;

end;

procedure TFr_CadastroProdutoSeton.FDQueryTSOP_CadastroProdutoSetonAfterEdit(DataSet: TDataSet);
begin

  FDQueryTSOP_CadastroProdutoSetonTSOP_DTAULTATUALIZACAO.AsDateTime := Now;

end;

procedure TFr_CadastroProdutoSeton.FDQueryTSOP_CadastroProdutoSetonNewRecord(DataSet: TDataSet);
begin

  FDQueryTSOP_CadastroProdutoSetonTSOP_DTAULTATUALIZACAO.AsDateTime := Now;

end;

procedure TFr_CadastroProdutoSeton.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  FDQueryTSOP_CadastroProdutoSeton.Close;
  FDConnection.Close;

  Fr_CadastroProdutoSeton := nil;
  Action := caFree;

end;

procedure TFr_CadastroProdutoSeton.FormContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
begin

  Fr_Brady.PopupGridTools( cxGridDeParaSite.ActiveView );

end;

procedure TFr_CadastroProdutoSeton.FormCreate(Sender: TObject);
begin

  LoadGridCustomization;

end;

procedure TFr_CadastroProdutoSeton.LoadGridCustomization;
begin

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxTableViewDeParaSite.Name + '.ini' ) then
    cxTableViewDeParaSite.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxTableViewDeParaSite.Name + '.ini' );

end;

procedure TFr_CadastroProdutoSeton.Mensagem(pMensagem: String);
begin

  cxLabelMensagem.Caption := pMensagem;
  PanelSQLSplashScreen.Visible := not pMensagem.IsEmpty;
  Update;
  Application.ProcessMessages;

end;

end.
