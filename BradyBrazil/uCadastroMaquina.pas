unit uCadastroMaquina;

interface

uses
  System.IOUtils,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxCheckBox,
  cxContainer, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxLabel, dxGDIPlusClasses, Vcl.ExtCtrls, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, dxSkinOffice2013White;

type
  TFr_CadastroMaquina = class(TForm)
    cxGridMaquina: TcxGrid;
    cxGridLevelMaquina: TcxGridLevel;
    cxTableViewMaquina: TcxGridDBTableView;
    DataSourceTMAQ_Maquina: TDataSource;
    FDConnection: TFDConnection;
    FDQueryTMAQ_Maquina: TFDQuery;
    FDQueryTMAQ_MaquinaTMAQ_MAQCOD: TFDAutoIncField;
    FDQueryTMAQ_MaquinaTMAQ_MAQNOM: TStringField;
    cxTableViewMaquinaTMAQ_MAQCOD: TcxGridDBColumn;
    cxTableViewMaquinaTMAQ_MAQNOM: TcxGridDBColumn;
    PanelSQLSplashScreen: TPanel;
    ImageSQLSplashScreen: TImage;
    cxLabelMensagem: TcxLabel;
    FDQueryTMAQ_CelulaLookup: TFDQuery;
    FDQueryTMAQ_CelulaLookupTMAQ_CELCOD: TFDAutoIncField;
    FDQueryTMAQ_CelulaLookupTMAQ_CELNOM: TStringField;
    FDQueryTMAQ_SiteLookup: TFDQuery;
    FDQueryTMAQ_SiteLookupTMAQ_SITCOD: TFDAutoIncField;
    FDQueryTMAQ_SiteLookupTMAQ_SITNOM: TStringField;
    FDQueryTMAQ_MaquinaTMAQ_SITCOD: TIntegerField;
    FDQueryTMAQ_MaquinaTMAQ_CELCOD: TIntegerField;
    FDQueryTMAQ_MaquinaTMAQ_MAQBAR: TStringField;
    FDQueryTMAQ_MaquinaTMAQ_SITNOM: TStringField;
    FDQueryTMAQ_MaquinaTMAQ_CELNOM: TStringField;
    cxTableViewMaquinaTMAQ_SITNOM: TcxGridDBColumn;
    cxTableViewMaquinaTMAQ_CELNOM: TcxGridDBColumn;
    cxTableViewMaquinaTMAQ_MAQBAR: TcxGridDBColumn;
    FDQueryTMAQ_MaquinaTMAQ_MAQPERMAXPAR: TIntegerField;
    FDQueryTMAQ_MaquinaTMAQ_MAQPERMAXSET: TIntegerField;
    FDQueryTMAQ_MaquinaTMAQ_MAQPERMINPRO: TIntegerField;
    cxTableViewMaquinaTMAQ_MAQPERMAXPAR: TcxGridDBColumn;
    cxTableViewMaquinaTMAQ_MAQPERMAXSET: TcxGridDBColumn;
    cxTableViewMaquinaTMAQ_MAQPERMINPRO: TcxGridDBColumn;
    FDQueryTMAQ_MaquinaTMAQ_MAQNOMRED: TStringField;
    FDQueryTMAQ_MaquinaTMAQ_MAQATI: TStringField;
    cxTableViewMaquinaTMAQ_MAQNOMRED: TcxGridDBColumn;
    cxTableViewMaquinaTMAQ_MAQATI: TcxGridDBColumn;
    FDQueryTMAQ_MaquinaTMAQ_MAQWRKCEN: TStringField;
    FDQueryTMAQ_MaquinaTMAQ_MAQCOSCEN: TStringField;
    cxTableViewMaquinaTMAQ_MAQWRKCEN: TcxGridDBColumn;
    cxTableViewMaquinaTMAQ_MAQCOSCEN: TcxGridDBColumn;
    FDQueryTMAQ_MaquinaTMAQ_MAQHORINI: TIntegerField;
    FDQueryTMAQ_MaquinaTMAQ_MAQHORFIM: TIntegerField;
    cxTableViewMaquinaTMAQ_MAQHORINI: TcxGridDBColumn;
    cxTableViewMaquinaTMAQ_MAQHORFIM: TcxGridDBColumn;
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
  Fr_CadastroMaquina: TFr_CadastroMaquina;

implementation

{$R *.dfm}

uses uUtils, uBrady;

procedure TFr_CadastroMaquina.AbrirDataset;
begin

  if not FDConnection.Connected then
  begin

    Mensagem( 'Abrindo conexão...' );
    try

      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );
      FDConnection.Open;

      Mensagem( 'Obtendo dados (Maquina)...' );
      FDQueryTMAQ_Maquina.Open;

    finally

      Mensagem( EmptyStr );

    end;

  end;

end;

procedure TFr_CadastroMaquina.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  FDQueryTMAQ_Maquina.Close;
  FDConnection.Close;

  Fr_CadastroMaquina := nil;
  Action := caFree;

end;

procedure TFr_CadastroMaquina.FormContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
begin

  Fr_Brady.PopupGridTools( cxGridMaquina.ActiveView );

end;

procedure TFr_CadastroMaquina.FormCreate(Sender: TObject);
begin

  LoadGridCustomization;

end;

procedure TFr_CadastroMaquina.LoadGridCustomization;
begin

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxTableViewMaquina.Name + '.ini' ) then
    cxTableViewMaquina.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxTableViewMaquina.Name + '.ini' );

end;

procedure TFr_CadastroMaquina.Mensagem(pMensagem: String);
begin

  cxLabelMensagem.Caption := pMensagem;
  PanelSQLSplashScreen.Visible := not pMensagem.IsEmpty;
  Update;
  Application.ProcessMessages;

end;

end.
