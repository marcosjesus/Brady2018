unit uCadastroUsuario;

interface

uses
  System.IOUtils,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxCheckComboBox,
  cxCheckBox, cxContainer, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxLabel, dxGDIPlusClasses, Vcl.ExtCtrls, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, dxSkinOffice2013White;

type
  TFr_CadastroUsuario = class(TForm)
    cxGridUsuario: TcxGrid;
    cxGridLevelUsuario: TcxGridLevel;
    cxTableViewUsuario: TcxGridDBTableView;
    DataSourceTSIS_Usuario: TDataSource;
    FDConnection: TFDConnection;
    FDQueryTSIS_Usuario: TFDQuery;
    PanelSQLSplashScreen: TPanel;
    ImageSQLSplashScreen: TImage;
    cxLabelMensagem: TcxLabel;
    FDQueryTSIS_UsuarioTSIS_USUCOD: TFDAutoIncField;
    cxTableViewUsuarioTSIS_USUCOD: TcxGridDBColumn;
    cxTableViewUsuarioTSIS_USUMEN: TcxGridDBColumn;
    FDQueryTSIS_MenuLookup: TFDQuery;
    FDQueryTSIS_UsuarioTSIS_USUMEN: TMemoField;
    FDQueryTSIS_UsuarioTSIS_USUNOM: TStringField;
    FDQueryTSIS_UsuarioTSIS_USULOG: TStringField;
    FDQueryTSIS_UsuarioTSIS_USUEML: TStringField;
    FDQueryTSIS_MenuLookupTSIS_MENCOD: TFDAutoIncField;
    FDQueryTSIS_MenuLookupTSIS_MENNOM: TStringField;
    FDQueryTSIS_MenuLookupTSIS_MENOBJ: TStringField;
    cxTableViewUsuarioTSIS_USUNOM: TcxGridDBColumn;
    cxTableViewUsuarioTSIS_USULOG: TcxGridDBColumn;
    cxTableViewUsuarioTSIS_USUEML: TcxGridDBColumn;
    FDQueryTSIS_UsuarioTSIS_USUATI: TStringField;
    cxTableViewUsuarioTSIS_USUATI: TcxGridDBColumn;
    FDQueryTSIS_UsuarioTSIS_USUSREP: TStringField;
    FDQueryTSIS_UsuarioTSIS_USUCSR: TStringField;
    FDQueryTSIS_UsuarioTSIS_USUMNG: TStringField;
    FDQueryTSIS_UsuarioTSIS_USUADM: TStringField;
    cxTableViewUsuarioTSIS_USUSREP: TcxGridDBColumn;
    cxTableViewUsuarioTSIS_USUCSR: TcxGridDBColumn;
    cxTableViewUsuarioTSIS_USUMNG: TcxGridDBColumn;
    cxTableViewUsuarioTSIS_USUADM: TcxGridDBColumn;
    FDQueryTSIS_UsuarioTSIS_USUPRD: TStringField;
    cxTableViewUsuarioTSIS_USUPRD: TcxGridDBColumn;
    FDQueryTSIS_UsuarioTSIS_USUMAQ: TMemoField;
    FDQueryTMAQ_MaquinaLookup: TFDQuery;
    FDQueryTMAQ_MaquinaLookupTMAQ_MAQCOD: TFDAutoIncField;
    FDQueryTMAQ_MaquinaLookupTMAQ_SITCOD: TIntegerField;
    FDQueryTMAQ_MaquinaLookupTMAQ_CELCOD: TIntegerField;
    FDQueryTMAQ_MaquinaLookupTMAQ_MAQBAR: TStringField;
    FDQueryTMAQ_MaquinaLookupTMAQ_MAQNOM: TStringField;
    cxTableViewUsuarioTSIS_USUMAQ: TcxGridDBColumn;
    FDQueryTSIS_UsuarioTSIS_USULID: TStringField;
    cxTableViewUsuarioTSIS_USULID: TcxGridDBColumn;
    FDQueryTSIS_UsuarioLookup: TFDQuery;
    FDQueryTSIS_UsuarioLookupTSIS_USUCOD: TFDAutoIncField;
    FDQueryTSIS_UsuarioLookupTSIS_USUNOM: TStringField;
    cxTableViewUsuarioTSIS_USUCODMEN: TcxGridDBColumn;
    FDQueryTSIS_UsuarioTSIS_USUCODMEN: TMemoField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FDQueryTSIS_UsuarioNewRecord(DataSet: TDataSet);
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
  Fr_CadastroUsuario: TFr_CadastroUsuario;

implementation

{$R *.dfm}

uses uUtils, uBrady;

procedure TFr_CadastroUsuario.AbrirDataset;
begin

  if not FDConnection.Connected then
  begin

    Mensagem( 'Abrindo conexão...' );
    try

      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );
      FDConnection.Open;

      Mensagem( 'Obtendo dados (Menu)...' );
      FDQueryTSIS_MenuLookup.Open;

      while not FDQueryTSIS_MenuLookup.Eof do
      begin

        with TcxCheckComboBoxProperties(cxTableViewUsuarioTSIS_USUMEN.Properties).Items.Add do
        begin

          Description := FDQueryTSIS_MenuLookupTSIS_MENNOM.AsString;
          ShortDescription := FDQueryTSIS_MenuLookupTSIS_MENNOM.AsString;

        end;

        FDQueryTSIS_MenuLookup.Next;

      end;

      Mensagem( 'Obtendo dados (Máquina)...' );
      FDQueryTMAQ_MaquinaLookup.Open;

      while not FDQueryTMAQ_MaquinaLookup.Eof do
      begin

        with TcxCheckComboBoxProperties(cxTableViewUsuarioTSIS_USUMAQ.Properties).Items.Add do
        begin

          Description := FDQueryTMAQ_MaquinaLookupTMAQ_MAQBAR.AsString + '-' + FDQueryTMAQ_MaquinaLookupTMAQ_MAQNOM.AsString;
          ShortDescription := FDQueryTMAQ_MaquinaLookupTMAQ_MAQBAR.AsString + '-' + FDQueryTMAQ_MaquinaLookupTMAQ_MAQNOM.AsString;

        end;

        FDQueryTMAQ_MaquinaLookup.Next;

      end;

      Mensagem( 'Obtendo dados (Usuário Lookup)...' );
      FDQueryTSIS_UsuarioLookup.Open;

      while not FDQueryTSIS_UsuarioLookup.Eof do
      begin

        with TcxCheckComboBoxProperties(cxTableViewUsuarioTSIS_USUCODMEN.Properties).Items.Add do
        begin

          Description := FDQueryTSIS_UsuarioLookupTSIS_USUCOD.AsString + '-' + FDQueryTSIS_UsuarioLookupTSIS_USUNOM.AsString;
          ShortDescription := FDQueryTSIS_UsuarioLookupTSIS_USUCOD.AsString + '-' + FDQueryTSIS_UsuarioLookupTSIS_USUNOM.AsString;

        end;

        FDQueryTSIS_UsuarioLookup.Next;

      end;

      Mensagem( 'Obtendo dados (Usuário)...' );
      FDQueryTSIS_Usuario.Open;

    finally

      Mensagem( EmptyStr );

    end;

  end;

end;

procedure TFr_CadastroUsuario.FDQueryTSIS_UsuarioNewRecord(DataSet: TDataSet);
begin

  FDQueryTSIS_UsuarioTSIS_USUATI.AsString := 'S';
  FDQueryTSIS_UsuarioTSIS_USUSREP.AsString := 'S';
  FDQueryTSIS_UsuarioTSIS_USUCSR.AsString := 'N';
  FDQueryTSIS_UsuarioTSIS_USUMNG.AsString := 'N';
  FDQueryTSIS_UsuarioTSIS_USUADM.AsString := 'N';
  FDQueryTSIS_UsuarioTSIS_USUPRD.AsString := 'N';
  FDQueryTSIS_UsuarioTSIS_USULID.AsString := 'N';

end;

procedure TFr_CadastroUsuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  FDQueryTMAQ_MaquinaLookup.Close;
  FDQueryTSIS_MenuLookup.Close;
  FDQueryTSIS_UsuarioLookup.Close;
  FDQueryTSIS_Usuario.Close;
  FDConnection.Close;

  Fr_CadastroUsuario := nil;
  Action := caFree;

end;

procedure TFr_CadastroUsuario.FormContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
begin

  Fr_Brady.PopupGridTools( cxGridUsuario.ActiveView );

end;

procedure TFr_CadastroUsuario.FormCreate(Sender: TObject);
begin

  LoadGridCustomization;

end;

procedure TFr_CadastroUsuario.LoadGridCustomization;
begin

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxTableViewUsuario.Name + '.ini' ) then
    cxTableViewUsuario.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxTableViewUsuario.Name + '.ini' );

end;

procedure TFr_CadastroUsuario.Mensagem(pMensagem: String);
begin

  cxLabelMensagem.Caption := pMensagem;
  PanelSQLSplashScreen.Visible := not pMensagem.IsEmpty;
  Update;
  Application.ProcessMessages;

end;

end.
