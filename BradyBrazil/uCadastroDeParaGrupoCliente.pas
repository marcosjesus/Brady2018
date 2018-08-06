unit uCadastroDeParaGrupoCliente;

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
  TFr_CadastroDeParaGrupoCliente = class(TForm)
    cxGridDeParaGrupoCliente: TcxGrid;
    cxGridLevelDeParaGrupoCliente: TcxGridLevel;
    cxTableViewDeParaGrupoCliente: TcxGridDBTableView;
    DataSourceTSOP_DeParaGrupoCliente: TDataSource;
    FDConnection: TFDConnection;
    FDQueryTSOP_DeParaGrupoCliente: TFDQuery;
    PanelSQLSplashScreen: TPanel;
    ImageSQLSplashScreen: TImage;
    cxLabelMensagem: TcxLabel;
    FDQueryTSOP_DeParaGrupoClienteTSOP_DPAGRUCLICOD: TFDAutoIncField;
    FDQueryTSOP_DeParaGrupoClienteTSOP_ORICOD: TIntegerField;
    FDQueryTSOP_DeParaGrupoClienteTSOP_DPAGRUCLITXTANT: TStringField;
    FDQueryTSOP_DeParaGrupoClienteTSOP_DPAGRUCLITXTDEP: TStringField;
    FDQueryTSOP_DeParaGrupoClienteTSOP_USUCODCAD: TIntegerField;
    FDQueryTSOP_DeParaGrupoClienteTSOP_DPAGRUCLIDATCAD: TSQLTimeStampField;
    FDQueryTSOP_DeParaGrupoClienteTSOP_USUCODALT: TIntegerField;
    FDQueryTSOP_DeParaGrupoClienteTSOP_DPAGRUCLIDATALT: TSQLTimeStampField;
    cxTableViewDeParaGrupoClienteTSOP_DPAGRUCLICOD: TcxGridDBColumn;
    cxTableViewDeParaGrupoClienteTSOP_DPAGRUCLITXTANT: TcxGridDBColumn;
    cxTableViewDeParaGrupoClienteTSOP_DPAGRUCLITXTDEP: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FDQueryTSOP_DeParaGrupoClienteNewRecord(DataSet: TDataSet);
    procedure FDQueryTSOP_DeParaGrupoClienteAfterEdit(DataSet: TDataSet);
  private
    procedure Mensagem( pMensagem: String );
    { Private declarations }
  public
    procedure AbrirDataset;
    procedure LoadGridCustomization;
    { Public declarations }
  end;

var
  Fr_CadastroDeParaGrupoCliente: TFr_CadastroDeParaGrupoCliente;

implementation

{$R *.dfm}

uses uUtils, uBrady;

procedure TFr_CadastroDeParaGrupoCliente.AbrirDataset;
begin

  if not FDConnection.Connected then
  begin

    Mensagem( 'Abrindo conexão...' );
    try

      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );
      FDConnection.Open;

      Mensagem( 'Obtendo dados (De/Para Grupo de Cliente)...' );
      FDQueryTSOP_DeParaGrupoCliente.Open;

    finally

      Mensagem( EmptyStr );

    end;

  end;

end;

procedure TFr_CadastroDeParaGrupoCliente.FDQueryTSOP_DeParaGrupoClienteAfterEdit(DataSet: TDataSet);
begin

  FDQueryTSOP_DeParaGrupoClienteTSOP_ORICOD.AsInteger := 1;
  FDQueryTSOP_DeParaGrupoClienteTSOP_USUCODALT.AsInteger := 1;
  FDQueryTSOP_DeParaGrupoClienteTSOP_DPAGRUCLIDATALT.AsDateTime := Now;

end;

procedure TFr_CadastroDeParaGrupoCliente.FDQueryTSOP_DeParaGrupoClienteNewRecord(DataSet: TDataSet);
begin

  FDQueryTSOP_DeParaGrupoClienteTSOP_ORICOD.AsInteger := 1;
  FDQueryTSOP_DeParaGrupoClienteTSOP_USUCODCAD.AsInteger := 1;
  FDQueryTSOP_DeParaGrupoClienteTSOP_USUCODALT.AsInteger := 1;
  FDQueryTSOP_DeParaGrupoClienteTSOP_DPAGRUCLIDATCAD.AsDateTime := Now;
  FDQueryTSOP_DeParaGrupoClienteTSOP_DPAGRUCLIDATALT.AsDateTime := Now;

end;

procedure TFr_CadastroDeParaGrupoCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  FDQueryTSOP_DeParaGrupoCliente.Close;
  FDConnection.Close;

  Fr_CadastroDeParaGrupoCliente := nil;
  Action := caFree;

end;

procedure TFr_CadastroDeParaGrupoCliente.FormContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
begin

  Fr_Brady.PopupGridTools( cxGridDeParaGrupoCliente.ActiveView );

end;

procedure TFr_CadastroDeParaGrupoCliente.FormCreate(Sender: TObject);
begin

  LoadGridCustomization;

end;

procedure TFr_CadastroDeParaGrupoCliente.LoadGridCustomization;
begin

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxTableViewDeParaGrupoCliente.Name + '.ini' ) then
    cxTableViewDeParaGrupoCliente.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxTableViewDeParaGrupoCliente.Name + '.ini' );

end;

procedure TFr_CadastroDeParaGrupoCliente.Mensagem(pMensagem: String);
begin

  cxLabelMensagem.Caption := pMensagem;
  PanelSQLSplashScreen.Visible := not pMensagem.IsEmpty;
  Update;
  Application.ProcessMessages;

end;

end.
