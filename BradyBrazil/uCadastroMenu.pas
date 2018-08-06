unit uCadastroMenu;

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
  TFr_CadastroMenu = class(TForm)
    cxGridMenu: TcxGrid;
    cxGridLevelMenu: TcxGridLevel;
    cxTableViewMenu: TcxGridDBTableView;
    DataSourceTSIS_Menu: TDataSource;
    FDConnection: TFDConnection;
    FDQueryTSIS_Menu: TFDQuery;
    FDQueryTSIS_MenuTSIS_MENCOD: TFDAutoIncField;
    FDQueryTSIS_MenuTSIS_MENNOM: TStringField;
    cxTableViewMenuTSIS_MENCOD: TcxGridDBColumn;
    cxTableViewMenuTSIS_MENNOM: TcxGridDBColumn;
    PanelSQLSplashScreen: TPanel;
    ImageSQLSplashScreen: TImage;
    cxLabelMensagem: TcxLabel;
    FDQueryTSIS_MenuTSIS_MENOBJ: TStringField;
    cxTableViewMenuTSIS_MENOBJ: TcxGridDBColumn;
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
  Fr_CadastroMenu: TFr_CadastroMenu;

implementation

{$R *.dfm}

uses uUtils, uBrady;

procedure TFr_CadastroMenu.AbrirDataset;
begin

  if not FDConnection.Connected then
  begin

    Mensagem( 'Abrindo conexão...' );
    try

      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );
      FDConnection.Open;

      Mensagem( 'Obtendo dados (Menu)...' );
      FDQueryTSIS_Menu.Open;

    finally

      Mensagem( EmptyStr );

    end;

  end;

end;

procedure TFr_CadastroMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  FDQueryTSIS_Menu.Close;
  FDConnection.Close;

  Fr_CadastroMenu := nil;
  Action := caFree;

end;

procedure TFr_CadastroMenu.FormContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
begin

  Fr_Brady.PopupGridTools( cxGridMenu.ActiveView );

end;

procedure TFr_CadastroMenu.FormCreate(Sender: TObject);
begin

  LoadGridCustomization;

end;

procedure TFr_CadastroMenu.LoadGridCustomization;
begin

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxTableViewMenu.Name + '.ini' ) then
    cxTableViewMenu.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxTableViewMenu.Name + '.ini' );

end;

procedure TFr_CadastroMenu.Mensagem(pMensagem: String);
begin

  cxLabelMensagem.Caption := pMensagem;
  PanelSQLSplashScreen.Visible := not pMensagem.IsEmpty;
  Update;
  Application.ProcessMessages;

end;

end.
