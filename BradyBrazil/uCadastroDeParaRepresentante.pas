unit uCadastroDeParaRepresentante;

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
  TFr_CadastroDeParaRepresentante = class(TForm)
    cxGridDeParaRepresentante: TcxGrid;
    cxGridLevelDeParaRepresentante: TcxGridLevel;
    cxTableViewDeParaRepresentante: TcxGridDBTableView;
    DataSourceTSOP_DeParaRepresentante: TDataSource;
    FDConnection: TFDConnection;
    FDQueryTSOP_DeParaRepresentante: TFDQuery;
    PanelSQLSplashScreen: TPanel;
    ImageSQLSplashScreen: TImage;
    cxLabelMensagem: TcxLabel;
    FDQueryTSOP_DeParaRepresentanteTSOP_DPAREPCOD: TFDAutoIncField;
    FDQueryTSOP_DeParaRepresentanteTSOP_ORICOD: TIntegerField;
    FDQueryTSOP_DeParaRepresentanteTSOP_DPAREPTXTANT: TStringField;
    FDQueryTSOP_DeParaRepresentanteTSOP_DPAREPTXTDEP: TStringField;
    FDQueryTSOP_DeParaRepresentanteTSOP_USUCODCAD: TIntegerField;
    FDQueryTSOP_DeParaRepresentanteTSOP_DPAREPDATCAD: TSQLTimeStampField;
    FDQueryTSOP_DeParaRepresentanteTSOP_USUCODALT: TIntegerField;
    FDQueryTSOP_DeParaRepresentanteTSOP_DPAREPDATALT: TSQLTimeStampField;
    cxTableViewDeParaRepresentanteTSOP_DPAREPCOD: TcxGridDBColumn;
    cxTableViewDeParaRepresentanteTSOP_DPAREPTXTANT: TcxGridDBColumn;
    cxTableViewDeParaRepresentanteTSOP_DPAREPTXTDEP: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FDQueryTSOP_DeParaRepresentanteNewRecord(DataSet: TDataSet);
    procedure FDQueryTSOP_DeParaRepresentanteAfterEdit(DataSet: TDataSet);
  private
    procedure Mensagem( pMensagem: String );
    { Private declarations }
  public
    procedure AbrirDataset;
    procedure LoadGridCustomization;
    { Public declarations }
  end;

var
  Fr_CadastroDeParaRepresentante: TFr_CadastroDeParaRepresentante;

implementation

{$R *.dfm}

uses uUtils, uBrady;

procedure TFr_CadastroDeParaRepresentante.AbrirDataset;
begin

  if not FDConnection.Connected then
  begin

    Mensagem( 'Abrindo conexão...' );
    try

      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );
      FDConnection.Open;

      Mensagem( 'Obtendo dados (De/Para Representante)...' );
      FDQueryTSOP_DeParaRepresentante.Open;

    finally

      Mensagem( EmptyStr );

    end;

  end;

end;

procedure TFr_CadastroDeParaRepresentante.FDQueryTSOP_DeParaRepresentanteAfterEdit(DataSet: TDataSet);
begin

  FDQueryTSOP_DeParaRepresentanteTSOP_ORICOD.AsInteger := 1;
  FDQueryTSOP_DeParaRepresentanteTSOP_USUCODALT.AsInteger := 1;
  FDQueryTSOP_DeParaRepresentanteTSOP_DPAREPDATALT.AsDateTime := Now;

end;

procedure TFr_CadastroDeParaRepresentante.FDQueryTSOP_DeParaRepresentanteNewRecord(DataSet: TDataSet);
begin

  FDQueryTSOP_DeParaRepresentanteTSOP_ORICOD.AsInteger := 1;
  FDQueryTSOP_DeParaRepresentanteTSOP_USUCODCAD.AsInteger := 1;
  FDQueryTSOP_DeParaRepresentanteTSOP_USUCODALT.AsInteger := 1;
  FDQueryTSOP_DeParaRepresentanteTSOP_DPAREPDATCAD.AsDateTime := Now;
  FDQueryTSOP_DeParaRepresentanteTSOP_DPAREPDATALT.AsDateTime := Now;

end;

procedure TFr_CadastroDeParaRepresentante.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  FDQueryTSOP_DeParaRepresentante.Close;
  FDConnection.Close;

  Fr_CadastroDeParaRepresentante := nil;
  Action := caFree;

end;

procedure TFr_CadastroDeParaRepresentante.FormContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
begin

  Fr_Brady.PopupGridTools( cxGridDeParaRepresentante.ActiveView );

end;

procedure TFr_CadastroDeParaRepresentante.FormCreate(Sender: TObject);
begin

  LoadGridCustomization;

end;

procedure TFr_CadastroDeParaRepresentante.LoadGridCustomization;
begin

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxTableViewDeParaRepresentante.Name + '.ini' ) then
    cxTableViewDeParaRepresentante.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxTableViewDeParaRepresentante.Name + '.ini' );

end;

procedure TFr_CadastroDeParaRepresentante.Mensagem(pMensagem: String);
begin

  cxLabelMensagem.Caption := pMensagem;
  PanelSQLSplashScreen.Visible := not pMensagem.IsEmpty;
  Update;
  Application.ProcessMessages;

end;

end.
