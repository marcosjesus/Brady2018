unit uCadastroDeParaFamilia;

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
  TFr_CadastroDeParaFamilia = class(TForm)
    cxGridDeParaFamilia: TcxGrid;
    cxGridLevelDeParaFamilia: TcxGridLevel;
    cxTableViewDeParaFamilia: TcxGridDBTableView;
    DataSourceTSOP_DeParaFamilia: TDataSource;
    FDConnection: TFDConnection;
    FDQueryTSOP_DeParaFamilia: TFDQuery;
    PanelSQLSplashScreen: TPanel;
    ImageSQLSplashScreen: TImage;
    cxLabelMensagem: TcxLabel;
    FDQueryTSOP_DeParaFamiliaTSOP_DPAFAMCOD: TFDAutoIncField;
    FDQueryTSOP_DeParaFamiliaTSOP_ORICOD: TIntegerField;
    FDQueryTSOP_DeParaFamiliaTSOP_DPAFAMTXTANT: TStringField;
    FDQueryTSOP_DeParaFamiliaTSOP_DPAFAMTXTDEP: TStringField;
    FDQueryTSOP_DeParaFamiliaTSOP_USUCODCAD: TIntegerField;
    FDQueryTSOP_DeParaFamiliaTSOP_DPAFAMDATCAD: TSQLTimeStampField;
    FDQueryTSOP_DeParaFamiliaTSOP_USUCODALT: TIntegerField;
    FDQueryTSOP_DeParaFamiliaTSOP_DPAFAMDATALT: TSQLTimeStampField;
    cxTableViewDeParaFamiliaTSOP_DPAFAMCOD: TcxGridDBColumn;
    cxTableViewDeParaFamiliaTSOP_DPAFAMTXTANT: TcxGridDBColumn;
    cxTableViewDeParaFamiliaTSOP_DPAFAMTXTDEP: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FDQueryTSOP_DeParaFamiliaNewRecord(DataSet: TDataSet);
    procedure FDQueryTSOP_DeParaFamiliaAfterEdit(DataSet: TDataSet);
  private
    procedure Mensagem( pMensagem: String );
    { Private declarations }
  public
    procedure AbrirDataset;
    procedure LoadGridCustomization;
    { Public declarations }
  end;

var
  Fr_CadastroDeParaFamilia: TFr_CadastroDeParaFamilia;

implementation

{$R *.dfm}

uses uUtils, uBrady;

procedure TFr_CadastroDeParaFamilia.AbrirDataset;
begin

  if not FDConnection.Connected then
  begin

    Mensagem( 'Abrindo conexão...' );
    try

      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );
      FDConnection.Open;

      Mensagem( 'Obtendo dados (De/Para Família)...' );
      FDQueryTSOP_DeParaFamilia.Open;

    finally

      Mensagem( EmptyStr );

    end;

  end;

end;

procedure TFr_CadastroDeParaFamilia.FDQueryTSOP_DeParaFamiliaAfterEdit(DataSet: TDataSet);
begin

  FDQueryTSOP_DeParaFamiliaTSOP_ORICOD.AsInteger := 1;
  FDQueryTSOP_DeParaFamiliaTSOP_USUCODALT.AsInteger := 1;
  FDQueryTSOP_DeParaFamiliaTSOP_DPAFAMDATALT.AsDateTime := Now;

end;

procedure TFr_CadastroDeParaFamilia.FDQueryTSOP_DeParaFamiliaNewRecord(DataSet: TDataSet);
begin

  FDQueryTSOP_DeParaFamiliaTSOP_ORICOD.AsInteger := 1;
  FDQueryTSOP_DeParaFamiliaTSOP_USUCODCAD.AsInteger := 1;
  FDQueryTSOP_DeParaFamiliaTSOP_USUCODALT.AsInteger := 1;
  FDQueryTSOP_DeParaFamiliaTSOP_DPAFAMDATCAD.AsDateTime := Now;
  FDQueryTSOP_DeParaFamiliaTSOP_DPAFAMDATALT.AsDateTime := Now;

end;

procedure TFr_CadastroDeParaFamilia.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  FDQueryTSOP_DeParaFamilia.Close;
  FDConnection.Close;

  Fr_CadastroDeParaFamilia := nil;
  Action := caFree;

end;

procedure TFr_CadastroDeParaFamilia.FormContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
begin

  Fr_Brady.PopupGridTools( cxGridDeParaFamilia.ActiveView );

end;

procedure TFr_CadastroDeParaFamilia.FormCreate(Sender: TObject);
begin

  LoadGridCustomization;

end;

procedure TFr_CadastroDeParaFamilia.LoadGridCustomization;
begin

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxTableViewDeParaFamilia.Name + '.ini' ) then
    cxTableViewDeParaFamilia.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxTableViewDeParaFamilia.Name + '.ini' );

end;

procedure TFr_CadastroDeParaFamilia.Mensagem(pMensagem: String);
begin

  cxLabelMensagem.Caption := pMensagem;
  PanelSQLSplashScreen.Visible := not pMensagem.IsEmpty;
  Update;
  Application.ProcessMessages;

end;

end.
