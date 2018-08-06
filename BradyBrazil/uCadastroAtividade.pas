unit uCadastroAtividade;

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
  TFr_CadastroAtividade = class(TForm)
    cxGridAtividade: TcxGrid;
    cxGridLevelAtividade: TcxGridLevel;
    cxTableViewAtividade: TcxGridDBTableView;
    DataSourceTMAQ_Atividade: TDataSource;
    FDConnection: TFDConnection;
    FDQueryTMAQ_Atividade: TFDQuery;
    FDQueryTMAQ_AtividadeTMAQ_ATICOD: TFDAutoIncField;
    FDQueryTMAQ_AtividadeTMAQ_ATINOM: TStringField;
    cxTableViewAtividadeTMAQ_ATICOD: TcxGridDBColumn;
    cxTableViewAtividadeTMAQ_ATINOM: TcxGridDBColumn;
    PanelSQLSplashScreen: TPanel;
    ImageSQLSplashScreen: TImage;
    cxLabelMensagem: TcxLabel;
    FDQueryTMAQ_AtividadeTMAQ_ATIBAR: TStringField;
    FDQueryTMAQ_AtividadeTMAQ_ATITIP: TIntegerField;
    FDQueryTMAQ_AtividadeTMAQ_ATIOSEYNU: TStringField;
    FDQueryTMAQ_AtividadeTMAQ_ATIQTD: TStringField;
    FDQueryTMAQ_AtividadeTMAQ_ATIFINOSE: TStringField;
    cxTableViewAtividadeTMAQ_ATIBAR: TcxGridDBColumn;
    cxTableViewAtividadeTMAQ_ATIOSEYNU: TcxGridDBColumn;
    cxTableViewAtividadeTMAQ_ATIQTD: TcxGridDBColumn;
    cxTableViewAtividadeTMAQ_ATIFINOSE: TcxGridDBColumn;
    FDQueryTMAQ_AtividadeLookupTipo: TFDQuery;
    FDQueryTMAQ_AtividadeLookupTipoid: TIntegerField;
    FDQueryTMAQ_AtividadeLookupTiponome: TStringField;
    FDQueryTMAQ_AtividadeTMAQ_ATITIPNOM: TStringField;
    cxTableViewAtividadeTMAQ_ATITIPNOM: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FDQueryTMAQ_AtividadeNewRecord(DataSet: TDataSet);
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
  Fr_CadastroAtividade: TFr_CadastroAtividade;

implementation

{$R *.dfm}

uses uUtils, uBrady;

procedure TFr_CadastroAtividade.AbrirDataset;
begin

  if not FDConnection.Connected then
  begin

    Mensagem( 'Abrindo conexão...' );
    try

      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );
      FDConnection.Open;

      Mensagem( 'Obtendo dados (Atividade)...' );
      FDQueryTMAQ_Atividade.Open;

    finally

      Mensagem( EmptyStr );

    end;

  end;

end;

procedure TFr_CadastroAtividade.FDQueryTMAQ_AtividadeNewRecord(DataSet: TDataSet);
begin

  FDQueryTMAQ_Atividade.FieldByName('TMAQ_ATIOSEYNU').AsString := 'N';
  FDQueryTMAQ_Atividade.FieldByName('TMAQ_ATIQTD').AsString := 'N';
  FDQueryTMAQ_Atividade.FieldByName('TMAQ_ATIFINOSE').AsString := 'N';

end;

procedure TFr_CadastroAtividade.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  FDQueryTMAQ_Atividade.Close;
  FDConnection.Close;

  Fr_CadastroAtividade := nil;
  Action := caFree;

end;

procedure TFr_CadastroAtividade.FormContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
begin

  Fr_Brady.PopupGridTools( cxGridAtividade.ActiveView );

end;

procedure TFr_CadastroAtividade.FormCreate(Sender: TObject);
begin

  LoadGridCustomization;

end;

procedure TFr_CadastroAtividade.LoadGridCustomization;
begin

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxTableViewAtividade.Name + '.ini' ) then
    cxTableViewAtividade.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxTableViewAtividade.Name + '.ini' );

end;

procedure TFr_CadastroAtividade.Mensagem(pMensagem: String);
begin

  cxLabelMensagem.Caption := pMensagem;
  PanelSQLSplashScreen.Visible := not pMensagem.IsEmpty;
  Update;
  Application.ProcessMessages;

end;

end.
