unit uCadastroSite;

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
  TFr_CadastroSite = class(TForm)
    cxGridSite: TcxGrid;
    cxGridLevelSite: TcxGridLevel;
    cxTableViewSite: TcxGridDBTableView;
    DataSourceTMAQ_Site: TDataSource;
    FDConnection: TFDConnection;
    FDQueryTMAQ_Site: TFDQuery;
    FDQueryTMAQ_SiteTMAQ_SITCOD: TFDAutoIncField;
    FDQueryTMAQ_SiteTMAQ_SITCODPAI: TIntegerField;
    FDQueryTMAQ_SiteTMAQ_SITNOM: TStringField;
    FDQueryTMAQ_SiteLookup: TFDQuery;
    FDQueryTMAQ_SiteLookupTMAQ_SITCOD: TFDAutoIncField;
    FDQueryTMAQ_SiteLookupTMAQ_SITNOM: TStringField;
    FDQueryTMAQ_SiteTMAQ_SITNOMPAI: TStringField;
    cxTableViewSiteTMAQ_SITCOD: TcxGridDBColumn;
    cxTableViewSiteTMAQ_SITNOMPAI: TcxGridDBColumn;
    cxTableViewSiteTMAQ_SITNOM: TcxGridDBColumn;
    PanelSQLSplashScreen: TPanel;
    ImageSQLSplashScreen: TImage;
    cxLabelMensagem: TcxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FDQueryTMAQ_SiteAfterPost(DataSet: TDataSet);
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
  Fr_CadastroSite: TFr_CadastroSite;

implementation

{$R *.dfm}

uses uUtils, uBrady;

procedure TFr_CadastroSite.AbrirDataset;
begin

  if not FDConnection.Connected then
  begin

    Mensagem( 'Abrindo conexão...' );
    try

      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );
      FDConnection.Open;

      Mensagem( 'Obtendo dados (Site)...' );
      FDQueryTMAQ_Site.Open;

    finally

      Mensagem( EmptyStr );

    end;

  end;

end;

procedure TFr_CadastroSite.FDQueryTMAQ_SiteAfterPost(DataSet: TDataSet);
begin

  FDQueryTMAQ_SiteLookup.Refresh;

end;

procedure TFr_CadastroSite.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  FDQueryTMAQ_Site.Close;
  FDConnection.Close;

  Fr_CadastroSite := nil;
  Action := caFree;

end;

procedure TFr_CadastroSite.FormContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
begin

  Fr_Brady.PopupGridTools( cxGridSite.ActiveView );

end;

procedure TFr_CadastroSite.FormCreate(Sender: TObject);
begin

  LoadGridCustomization;

end;

procedure TFr_CadastroSite.LoadGridCustomization;
begin

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxTableViewSite.Name + '.ini' ) then
    cxTableViewSite.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxTableViewSite.Name + '.ini' );

end;

procedure TFr_CadastroSite.Mensagem(pMensagem: String);
begin

  cxLabelMensagem.Caption := pMensagem;
  PanelSQLSplashScreen.Visible := not pMensagem.IsEmpty;
  Update;
  Application.ProcessMessages;

end;

end.
