unit uCadastroDetran;

interface

uses
  System.IOUtils,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxCheckBox,
  cxContainer, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxLabel, dxGDIPlusClasses, Vcl.ExtCtrls, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, dxSkinOffice2013White, dxBarBuiltInMenu, Vcl.Menus,
  cxTextEdit, cxButtons, cxPC, Vcl.StdCtrls, cxMemo;

type
  TFr_CadastroDetran = class(TForm)
    cxGridDetran: TcxGrid;
    cxGridLevelDetran: TcxGridLevel;
    cxTableViewDetran: TcxGridDBTableView;
    DataSourceTSOP_Detran: TDataSource;
    FDConnection: TFDConnection;
    PanelSQLSplashScreen: TPanel;
    ImageSQLSplashScreen: TImage;
    cxLabelMensagem: TcxLabel;
    cxPageControlFiltro: TcxPageControl;
    cxTabSheetFiltro: TcxTabSheet;
    cxLabelSequenciaInicial: TcxLabel;
    cxLabelDataFinal: TcxLabel;
    cxButtonRefresh: TcxButton;
    FDQueryTSOP_Detran: TFDQuery;
    cxTextEditSeqIni: TcxTextEdit;
    cxTextEditSeqFim: TcxTextEdit;
    FDQueryTSOP_DetranTSOP_DENCOD: TStringField;
    cxTableViewDetranTSOP_DENCOD: TcxGridDBColumn;
    cxMemoDetran: TcxMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure cxButtonRefreshClick(Sender: TObject);
  private
    procedure Mensagem( pMensagem: String );
    { Private declarations }
  public
    procedure AbrirDataset;
    procedure LoadGridCustomization;
    { Public declarations }
  end;

var
  Fr_CadastroDetran: TFr_CadastroDetran;

implementation

{$R *.dfm}

uses uUtils, uBrady;

procedure TFr_CadastroDetran.AbrirDataset;
begin

  cxMemoDetran.Lines.Clear;

  if not FDConnection.Connected then
  begin

    Mensagem( 'Abrindo conexão...' );
    try

      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );
      FDConnection.Open;

      Mensagem( 'Obtendo dados (Detran)...' );
      FDQueryTSOP_Detran.Open;

    finally

      Mensagem( EmptyStr );

    end;

  end;

end;

procedure TFr_CadastroDetran.cxButtonRefreshClick(Sender: TObject);
var
  Atual, Inicial, Final: Int64;

  function chInt(ch: Char): ShortInt;
  begin
    Result := Ord(ch) - Ord('0');
  end;

  function intCh(int: ShortInt): Char;
  begin
    Result := Chr(int + Ord('0'));
  end;

  function DvModulo11(str: String): Char;
  var
    soma, fator, i: Integer;
  begin
    soma := 0;
    fator := 2;
    for i := Length(str) downto 1 do
    begin
      soma := soma + chInt(str[i]) * fator;
      Inc(fator);
      if fator = 10 then
        fator := 2;
    end;
    soma := 11 - (soma mod 11);
    if soma >= 10 then
      Result := '1'
    else
      Result := intCh(soma);
  end;


begin

  Inicial := StrToInt64(Trim(cxTextEditSeqIni.Text));
  Atual := StrToInt64(Trim(cxTextEditSeqIni.Text));
  Final := StrToInt64(Trim(cxTextEditSeqFim.Text));

  cxMemoDetran.Lines.Clear;
  while Atual <= Final do
  begin

    cxMemoDetran.Lines.Add( IntToStr(Atual)+ DvModulo11(IntToStr(Atual)) );
    Atual := Atual +1;

  end;


end;

procedure TFr_CadastroDetran.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  FDQueryTSOP_Detran.Close;
  FDConnection.Close;

  Fr_CadastroDetran := nil;
  Action := caFree;

end;

procedure TFr_CadastroDetran.FormContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
begin

  Fr_Brady.PopupGridTools( cxGridDetran.ActiveView );

end;

procedure TFr_CadastroDetran.FormCreate(Sender: TObject);
begin

  LoadGridCustomization;

end;

procedure TFr_CadastroDetran.LoadGridCustomization;
begin

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxTableViewDetran.Name + '.ini' ) then
    cxTableViewDetran.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxTableViewDetran.Name + '.ini' );

end;

procedure TFr_CadastroDetran.Mensagem(pMensagem: String);
begin

  cxLabelMensagem.Caption := pMensagem;
  PanelSQLSplashScreen.Visible := not pMensagem.IsEmpty;
  Update;
  Application.ProcessMessages;

end;

end.
