unit uRelatorioPartNumber;

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
  TFr_RelatorioPartNumber = class(TForm)
    cxGridPartNumber: TcxGrid;
    cxGridLevelPartNumberTodos: TcxGridLevel;
    cxTableViewPartNumberTodos: TcxGridDBTableView;
    DataSourcePartNumberTodos: TDataSource;
    FDConnection: TFDConnection;
    FDQueryTSOP_ItemClienteSAP: TFDQuery;
    FDQueryTSOP_ItemClienteSAPTSOP_ITECLISAPCOD: TIntegerField;
    FDQueryTSOP_ItemClienteSAPTSOP_ITECLISAPCANNOM: TStringField;
    FDQueryTSOP_ItemClienteSAPTSOP_ITECLISAPCLICOD: TStringField;
    FDQueryTSOP_ItemClienteSAPTSOP_ITECLISAPCLICGC: TStringField;
    FDQueryTSOP_ItemClienteSAPTSOP_ITECLISAPCLINOM: TStringField;
    FDQueryTSOP_ItemClienteSAPTSOP_ITECLISAPGRUCLINOM: TStringField;
    FDQueryTSOP_ItemClienteSAPTSOP_GRUCLIMER: TStringField;
    FDQueryTSOP_ItemClienteSAPTSOP_ITECLISAPREPNOM: TStringField;
    FDQueryTSOP_ItemClienteSAPTSOP_REPNOMINT: TStringField;
    FDQueryTSOP_ItemClienteSAPTSOP_ITECLISAPITECOD: TStringField;
    FDQueryTSOP_ItemClienteSAPTSOP_ITECLISAPITECLICOD: TStringField;
    FDQueryTSOP_ItemClienteSAPTSOP_ITECLISAPITEFAM001: TStringField;
    FDQueryTSOP_ItemClienteSAPTSOP_ITECLISAPITEFAM002: TStringField;
    FDQueryTSOP_ItemClienteSAPTSOP_ITECLISAPITEFAM003: TStringField;
    FDQueryTSOP_ItemClienteSAPTSOP_ITECLISAPITEFAM004: TStringField;
    FDQueryTSOP_ItemClienteSAPTSOP_ITECLISAPITEFAM005: TStringField;
    cxTableViewPartNumberTodosTSOP_ITECLISAPCANNOM: TcxGridDBColumn;
    cxTableViewPartNumberTodosTSOP_ITECLISAPCLICOD: TcxGridDBColumn;
    cxTableViewPartNumberTodosTSOP_ITECLISAPCLICGC: TcxGridDBColumn;
    cxTableViewPartNumberTodosTSOP_ITECLISAPCLINOM: TcxGridDBColumn;
    cxTableViewPartNumberTodosTSOP_ITECLISAPGRUCLINOM: TcxGridDBColumn;
    cxTableViewPartNumberTodosTSOP_GRUCLIMER: TcxGridDBColumn;
    cxTableViewPartNumberTodosTSOP_ITECLISAPREPNOM: TcxGridDBColumn;
    cxTableViewPartNumberTodosTSOP_REPNOMINT: TcxGridDBColumn;
    cxTableViewPartNumberTodosTSOP_ITECLISAPITECOD: TcxGridDBColumn;
    cxTableViewPartNumberTodosTSOP_ITECLISAPITECLICOD: TcxGridDBColumn;
    cxTableViewPartNumberTodosTSOP_ITECLISAPITEFAM001: TcxGridDBColumn;
    cxTableViewPartNumberTodosTSOP_ITECLISAPITEFAM002: TcxGridDBColumn;
    cxTableViewPartNumberTodosTSOP_ITECLISAPITEFAM003: TcxGridDBColumn;
    cxTableViewPartNumberTodosTSOP_ITECLISAPITEFAM004: TcxGridDBColumn;
    cxTableViewPartNumberTodosTSOP_ITECLISAPITEFAM005: TcxGridDBColumn;
    FDQueryTSOP_ItemClienteSAPTSOP_ITECLISAPITENOM: TStringField;
    cxTableViewPartNumberTodosTSOP_ITECLISAPITENOM: TcxGridDBColumn;
    PanelSQLSplashScreen: TPanel;
    ImageSQLSplashScreen: TImage;
    cxLabelMensagem: TcxLabel;
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
  Fr_RelatorioPartNumber: TFr_RelatorioPartNumber;

implementation

{$R *.dfm}

uses uBrady, uUtils;

procedure TFr_RelatorioPartNumber.AbrirDataset;
begin

  Mensagem( 'Abrindo conexão...' );
  try

    FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );
    FDConnection.Open;

    Mensagem( 'Obtendo dados (Item Cliente)...' );
    if Fr_Brady.SalesRep then
      FDQueryTSOP_ItemClienteSAP.MacroByName( 'WHERE' ).AsRaw := 'AND A01.TSOP_ITECLISAPREPNOM = ' + QuotedStr(Fr_Brady.TSIS_USUNOM);
    if Fr_Brady.CustomerService then
      FDQueryTSOP_ItemClienteSAP.MacroByName( 'WHERE' ).AsRaw := 'AND A01.TSOP_REPNOMINT = ' + QuotedStr(Fr_Brady.TSIS_USUNOM);
    FDQueryTSOP_ItemClienteSAP.Open;

  finally

    Mensagem( EmptyStr );

  end;

end;

procedure TFr_RelatorioPartNumber.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  FDQueryTSOP_ItemClienteSAP.Close;
  FDConnection.Close;

  Fr_RelatorioPartNumber := nil;
  Action := caFree;

end;

procedure TFr_RelatorioPartNumber.FormContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
begin

  Fr_Brady.PopupGridTools( cxGridPartNumber.ActiveView );

end;

procedure TFr_RelatorioPartNumber.FormCreate(Sender: TObject);
begin

  LoadGridCustomization;

end;

procedure TFr_RelatorioPartNumber.LoadGridCustomization;
begin

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxTableViewPartNumberTodos.Name + '.ini' ) then
    cxTableViewPartNumberTodos.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxTableViewPartNumberTodos.Name + '.ini' );

end;

procedure TFr_RelatorioPartNumber.Mensagem(pMensagem: String);
begin

  cxLabelMensagem.Caption := pMensagem;
  PanelSQLSplashScreen.Visible := not pMensagem.IsEmpty;
  Update;
  Application.ProcessMessages;

end;

end.
