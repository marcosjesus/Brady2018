unit uCadastroDeParaSite;

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
  TFr_CadastroDeParaSite = class(TForm)
    cxGridDeParaSite: TcxGrid;
    cxGridLevelDeParaSite: TcxGridLevel;
    cxTableViewDeParaSite: TcxGridDBTableView;
    DataSourceTSOP_DeParaSite: TDataSource;
    FDConnection: TFDConnection;
    FDQueryTSOP_DeParaSite: TFDQuery;
    PanelSQLSplashScreen: TPanel;
    ImageSQLSplashScreen: TImage;
    cxLabelMensagem: TcxLabel;
    FDQueryTSOP_DeParaSiteTSOP_DPASITCOD: TFDAutoIncField;
    FDQueryTSOP_DeParaSiteTSOP_ORICOD: TIntegerField;
    FDQueryTSOP_DeParaSiteTSOP_DPASITTXTANT: TStringField;
    FDQueryTSOP_DeParaSiteTSOP_DPASITTXTDEP: TStringField;
    FDQueryTSOP_DeParaSiteTSOP_USUCODCAD: TIntegerField;
    FDQueryTSOP_DeParaSiteTSOP_DPASITDATCAD: TSQLTimeStampField;
    FDQueryTSOP_DeParaSiteTSOP_USUCODALT: TIntegerField;
    FDQueryTSOP_DeParaSiteTSOP_DPASITDATALT: TSQLTimeStampField;
    cxTableViewDeParaSiteTSOP_DPASITCOD: TcxGridDBColumn;
    cxTableViewDeParaSiteTSOP_DPASITTXTANT: TcxGridDBColumn;
    cxTableViewDeParaSiteTSOP_DPASITTXTDEP: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FDQueryTSOP_DeParaSiteNewRecord(DataSet: TDataSet);
    procedure FDQueryTSOP_DeParaSiteAfterEdit(DataSet: TDataSet);
  private
    procedure Mensagem( pMensagem: String );
    { Private declarations }
  public
    procedure AbrirDataset;
    procedure LoadGridCustomization;
    { Public declarations }
  end;

var
  Fr_CadastroDeParaSite: TFr_CadastroDeParaSite;

implementation

{$R *.dfm}

uses uUtils, uBrady;

procedure TFr_CadastroDeParaSite.AbrirDataset;
begin

  if not FDConnection.Connected then
  begin

    Mensagem( 'Abrindo conex�o...' );
    try

      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );
      FDConnection.Open;

      Mensagem( 'Obtendo dados (De/Para Site)...' );
      FDQueryTSOP_DeParaSite.Open;

    finally

      Mensagem( EmptyStr );

    end;

  end;

end;

procedure TFr_CadastroDeParaSite.FDQueryTSOP_DeParaSiteAfterEdit(DataSet: TDataSet);
begin

  FDQueryTSOP_DeParaSiteTSOP_ORICOD.AsInteger := 1;
  FDQueryTSOP_DeParaSiteTSOP_USUCODALT.AsInteger := 1;
  FDQueryTSOP_DeParaSiteTSOP_DPASITDATALT.AsDateTime := Now;

end;

procedure TFr_CadastroDeParaSite.FDQueryTSOP_DeParaSiteNewRecord(DataSet: TDataSet);
begin

  FDQueryTSOP_DeParaSiteTSOP_ORICOD.AsInteger := 1;
  FDQueryTSOP_DeParaSiteTSOP_USUCODCAD.AsInteger := 1;
  FDQueryTSOP_DeParaSiteTSOP_USUCODALT.AsInteger := 1;
  FDQueryTSOP_DeParaSiteTSOP_DPASITDATCAD.AsDateTime := Now;
  FDQueryTSOP_DeParaSiteTSOP_DPASITDATALT.AsDateTime := Now;

end;

procedure TFr_CadastroDeParaSite.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  FDQueryTSOP_DeParaSite.Close;
  FDConnection.Close;

  Fr_CadastroDeParaSite := nil;
  Action := caFree;

end;

procedure TFr_CadastroDeParaSite.FormContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
begin

  Fr_Brady.PopupGridTools( cxGridDeParaSite.ActiveView );

end;

procedure TFr_CadastroDeParaSite.FormCreate(Sender: TObject);
begin

  LoadGridCustomization;

end;

procedure TFr_CadastroDeParaSite.LoadGridCustomization;
begin

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxTableViewDeParaSite.Name + '.ini' ) then
    cxTableViewDeParaSite.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxTableViewDeParaSite.Name + '.ini' );

end;

procedure TFr_CadastroDeParaSite.Mensagem(pMensagem: String);
begin

  cxLabelMensagem.Caption := pMensagem;
  PanelSQLSplashScreen.Visible := not pMensagem.IsEmpty;
  Update;
  Application.ProcessMessages;

end;

end.
