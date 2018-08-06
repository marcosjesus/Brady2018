unit uCadastroCelula;

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
  TFr_CadastroCelula = class(TForm)
    cxGridCelula: TcxGrid;
    cxGridLevelCelula: TcxGridLevel;
    cxTableViewCelula: TcxGridDBTableView;
    DataSourceTMAQ_Celula: TDataSource;
    FDConnection: TFDConnection;
    FDQueryTMAQ_Celula: TFDQuery;
    FDQueryTMAQ_CelulaTMAQ_CELCOD: TFDAutoIncField;
    FDQueryTMAQ_CelulaTMAQ_CELCODPAI: TIntegerField;
    FDQueryTMAQ_CelulaTMAQ_CELNOM: TStringField;
    FDQueryTMAQ_CelulaLookup: TFDQuery;
    FDQueryTMAQ_CelulaLookupTMAQ_CELCOD: TFDAutoIncField;
    FDQueryTMAQ_CelulaLookupTMAQ_CELNOM: TStringField;
    FDQueryTMAQ_CelulaTMAQ_CELNOMPAI: TStringField;
    cxTableViewCelulaTMAQ_CELCOD: TcxGridDBColumn;
    cxTableViewCelulaTMAQ_CELNOMPAI: TcxGridDBColumn;
    cxTableViewCelulaTMAQ_CELNOM: TcxGridDBColumn;
    PanelSQLSplashScreen: TPanel;
    ImageSQLSplashScreen: TImage;
    cxLabelMensagem: TcxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FDQueryTMAQ_CelulaAfterPost(DataSet: TDataSet);
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
  Fr_CadastroCelula: TFr_CadastroCelula;

implementation

{$R *.dfm}

uses uUtils, uBrady;

procedure TFr_CadastroCelula.AbrirDataset;
begin

  if not FDConnection.Connected then
  begin

    Mensagem( 'Abrindo conexão...' );
    try

      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );
      FDConnection.Open;

      Mensagem( 'Obtendo dados (Celula)...' );
      FDQueryTMAQ_Celula.Open;

    finally

      Mensagem( EmptyStr );

    end;

  end;

end;

procedure TFr_CadastroCelula.FDQueryTMAQ_CelulaAfterPost(DataSet: TDataSet);
begin

  FDQueryTMAQ_CelulaLookup.Refresh;

end;

procedure TFr_CadastroCelula.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  FDQueryTMAQ_Celula.Close;
  FDConnection.Close;

  Fr_CadastroCelula := nil;
  Action := caFree;

end;

procedure TFr_CadastroCelula.FormContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
begin

  Fr_Brady.PopupGridTools( cxGridCelula.ActiveView );

end;

procedure TFr_CadastroCelula.FormCreate(Sender: TObject);
begin

  LoadGridCustomization;

end;

procedure TFr_CadastroCelula.LoadGridCustomization;
begin

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxTableViewCelula.Name + '.ini' ) then
    cxTableViewCelula.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxTableViewCelula.Name + '.ini' );

end;

procedure TFr_CadastroCelula.Mensagem(pMensagem: String);
begin

  cxLabelMensagem.Caption := pMensagem;
  PanelSQLSplashScreen.Visible := not pMensagem.IsEmpty;
  Update;
  Application.ProcessMessages;

end;

end.
