unit uCadastroOperador;

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
  TFr_CadastroOperador = class(TForm)
    cxGridOperador: TcxGrid;
    cxGridLevelOperador: TcxGridLevel;
    cxTableViewOperador: TcxGridDBTableView;
    DataSourceTMAQ_Operador: TDataSource;
    FDConnection: TFDConnection;
    FDQueryTMAQ_Operador: TFDQuery;
    FDQueryTMAQ_OperadorTMAQ_OPECOD: TFDAutoIncField;
    FDQueryTMAQ_OperadorTMAQ_OPENOM: TStringField;
    cxTableViewOperadorTMAQ_OPECOD: TcxGridDBColumn;
    cxTableViewOperadorTMAQ_OPENOM: TcxGridDBColumn;
    PanelSQLSplashScreen: TPanel;
    ImageSQLSplashScreen: TImage;
    cxLabelMensagem: TcxLabel;
    FDQueryTMAQ_SiteLookup: TFDQuery;
    FDQueryTMAQ_SiteLookupTMAQ_SITCOD: TFDAutoIncField;
    FDQueryTMAQ_SiteLookupTMAQ_SITNOM: TStringField;
    FDQueryTMAQ_OperadorTMAQ_SITCOD: TIntegerField;
    FDQueryTMAQ_OperadorTMAQ_OPEBAR: TStringField;
    FDQueryTMAQ_OperadorTMAQ_SITNOM: TStringField;
    cxTableViewOperadorTMAQ_SITNOM: TcxGridDBColumn;
    cxTableViewOperadorTMAQ_OPEBAR: TcxGridDBColumn;
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
  Fr_CadastroOperador: TFr_CadastroOperador;

implementation

{$R *.dfm}

uses uUtils, uBrady;

procedure TFr_CadastroOperador.AbrirDataset;
begin

  if not FDConnection.Connected then
  begin

    Mensagem( 'Abrindo conexão...' );
    try

      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );
      FDConnection.Open;

      Mensagem( 'Obtendo dados (Operador)...' );
      FDQueryTMAQ_Operador.Open;

    finally

      Mensagem( EmptyStr );

    end;

  end;

end;

procedure TFr_CadastroOperador.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  FDQueryTMAQ_Operador.Close;
  FDConnection.Close;

  Fr_CadastroOperador := nil;
  Action := caFree;

end;

procedure TFr_CadastroOperador.FormContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
begin

  Fr_Brady.PopupGridTools( cxGridOperador.ActiveView );

end;

procedure TFr_CadastroOperador.FormCreate(Sender: TObject);
begin

  LoadGridCustomization;

end;

procedure TFr_CadastroOperador.LoadGridCustomization;
begin

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxTableViewOperador.Name + '.ini' ) then
    cxTableViewOperador.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxTableViewOperador.Name + '.ini' );

end;

procedure TFr_CadastroOperador.Mensagem(pMensagem: String);
begin

  cxLabelMensagem.Caption := pMensagem;
  PanelSQLSplashScreen.Visible := not pMensagem.IsEmpty;
  Update;
  Application.ProcessMessages;

end;

end.
