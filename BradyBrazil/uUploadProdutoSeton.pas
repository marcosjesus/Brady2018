unit uUploadProdutoSeton;

interface

uses
  System.IOUtils,
  System.DateUtils,

  dxSpreadSheet,
  dxSpreadSheetTypes,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinOffice2013White, dxSkinscxPCPainter,
  dxBarBuiltInMenu, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, cxPC, cxContainer, cxEdit, cxTextEdit, cxLabel,
  cxMaskEdit, cxButtonEdit, cxGroupBox, cxRadioGroup, Vcl.Menus, Vcl.StdCtrls,
  cxButtons, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxGDIPlusClasses, Vcl.ExtCtrls, cxCheckBox, cxDropDownEdit,
  FireDAC.Comp.ScriptCommands, FireDAC.Comp.Script;

type
  TFr_UploadPodutoSeton = class(TForm)
    FDConnection: TFDConnection;
    cxPageControlPivot: TcxPageControl;
    SaveDialog: TSaveDialog;
    OpenDialog: TOpenDialog;
    PanelSQLSplashScreen: TPanel;
    ImageSQLSplashScreen: TImage;
    cxLabelMensagem: TcxLabel;
    FDQueryTSOP_ProdutoSeton: TFDQuery;
    cxTabSheetPivot00: TcxTabSheet;
    cxLabel1: TcxLabel;
    cxButtonEditPath: TcxButtonEdit;
    cxButtonProcessar: TcxButton;
    cxRadioGroupOperacao: TcxRadioGroup;
    FDQueryTSOP_ProdutoSetonTSOP_PROSETCOD: TFDAutoIncField;
    FDQueryTSOP_ProdutoSetonTSOP_YNUMBER: TStringField;
    FDQueryTSOP_ProdutoSetonTSOP_CODSETON: TStringField;
    FDQueryTSOP_ProdutoSetonTSOP_DESCRICAO: TStringField;
    FDQueryTSOP_ProdutoSetonTSOP_ATUAL: TStringField;
    FDQueryTSOP_ProdutoSetonTSOP_DTAULTATUALIZACAO: TSQLTimeStampField;
    FDScriptProdutoSetonDelete: TFDScript;
    procedure cxRadioGroupOperacaoPropertiesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButtonProcessarClick(Sender: TObject);
    procedure cxButtonEditPathClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    function getTSOP_BUDTIP: string;
    procedure ImportarProdutoSeton;
    procedure ExportarProdutoSeton;
    procedure Mensagem( pMensagem: String );
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fr_UploadPodutoSeton: TFr_UploadPodutoSeton;

implementation

{$R *.dfm}

uses uBrady, uUtils;

procedure TFr_UploadPodutoSeton.cxButtonEditPathClick(Sender: TObject);
begin

  if cxRadioGroupOperacao.ItemIndex = 0 then
  begin
    if OpenDialog.Execute(Handle) then
    begin
      cxButtonEditPath.Text := OpenDialog.FileName;
    end;
  end
  else
  begin
    if SaveDialog.Execute(Handle) then
    begin
      cxButtonEditPath.Text := SaveDialog.FileName;
    end;
  end;

end;

procedure TFr_UploadPodutoSeton.cxButtonProcessarClick(Sender: TObject);
begin

  if cxButtonEditPath.Text = EmptyStr then
    raise Exception.Create('Informe o arquivo primeiro.');

  if cxRadioGroupOperacao.ItemIndex = 0 then
  begin

      ImportarProdutoSeton;

  end
  else
  begin

      ExportarProdutoSeton;

  end;

end;

procedure TFr_UploadPodutoSeton.cxRadioGroupOperacaoPropertiesChange(Sender: TObject);
begin

  if cxRadioGroupOperacao.ItemIndex = 0 then
    cxButtonProcessar.Caption := 'Importar'
  else
    cxButtonProcessar.Caption := 'Exportar';

  cxButtonEditPath.Text := EmptyStr;

end;


procedure TFr_UploadPodutoSeton.ExportarProdutoSeton;
var
  X, I: Integer;
  dxSpreadSheet: TdxSpreadSheet;
  varData: TDateTime;

begin

  Mensagem( 'Iniciando processo de exporta��o...' );
  try

    Mensagem( 'Criando planilha...' );
    DeleteFile(PWideChar(MyDocumentsPath+'\ProdutoSeton_Upload.xlsx'));
    CopyFile( PWideChar('\\ghos2024\Brady\ProdutoSeton_Upload.xlsx'), PWideChar(MyDocumentsPath+'\ProdutoSeton_Upload.xlsx'), True );

    dxSpreadSheet := TdxSpreadSheet.Create(nil);
    try

      Mensagem( 'Carregando planilha...' );
      dxSpreadSheet.LoadFromFile( MyDocumentsPath+'\ProdutoSeton_Upload.xlsx' );
      dxSpreadSheet.BeginUpdate;


      for I := 0 to 4 do
      begin

        with dxSpreadSheet.ActiveSheetAsTable.CreateCell(0,I) do;

      end;


      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );

      Mensagem( 'Abrindo Conex�o...' );
      FDConnection.Open;
      try

        Mensagem( 'Produtos Seton...' );
        FDQueryTSOP_ProdutoSeton.Open;
        FDQueryTSOP_ProdutoSeton.First;

        try

          X := 1;


            While not FDQueryTSOP_ProdutoSeton.Eof do
            begin

               Mensagem( 'Produto (" '+ FDQueryTSOP_ProdutoSetonTSOP_YNUMBER.AsString + ' - ' + FDQueryTSOP_ProdutoSetonTSOP_DESCRICAO.AsString +' ")...' );

                with dxSpreadSheet.ActiveSheetAsTable.CreateCell(X,0) do
                begin

                  AsVariant := FDQueryTSOP_ProdutoSetonTSOP_PROSETCOD.AsString;

                end;

                with dxSpreadSheet.ActiveSheetAsTable.CreateCell(X,1) do
                begin

                  AsVariant := FDQueryTSOP_ProdutoSetonTSOP_YNUMBER.AsString;

                end;

                with dxSpreadSheet.ActiveSheetAsTable.CreateCell(X,2) do
                begin

                  AsVariant := FDQueryTSOP_ProdutoSetonTSOP_CODSETON.AsString;

                end;

                with dxSpreadSheet.ActiveSheetAsTable.CreateCell(X,3) do
                begin

                  AsVariant := FDQueryTSOP_ProdutoSetonTSOP_DESCRICAO.AsString;

                end;

                with dxSpreadSheet.ActiveSheetAsTable.CreateCell(X,4) do
                begin

                  AsVariant := FDQueryTSOP_ProdutoSetonTSOP_ATUAL.AsString;

                end;

                FDQueryTSOP_ProdutoSeton.Next;
                Inc(X);
                Application.ProcessMessages;
            end;



        finally

          FDQueryTSOP_ProdutoSeton.Close;

        end;

        Mensagem( 'Salvando a planilha...' );
        dxSpreadSheet.SaveToFile( cxButtonEditPath.Text );

      finally

        FDConnection.Close;

      end;

    finally

      FreeAndNil(dxSpreadSheet);

    end;

  finally

    Mensagem( EmptyStr );

  end;

end;

procedure TFr_UploadPodutoSeton.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  Mensagem( 'Abrindo Conex�o...' );
  FDConnection.Open;


  Action := caFree;

end;

procedure TFr_UploadPodutoSeton.FormCreate(Sender: TObject);
begin


  FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );

  Mensagem( 'Abrindo Conex�o...' );
  FDConnection.Open;

  FDConnection.Close;

  Mensagem( '' );

end;

function TFr_UploadPodutoSeton.getTSOP_BUDTIP: string;
begin




end;

procedure TFr_UploadPodutoSeton.ImportarProdutoSeton;
var
  I, X: Integer;
  dxSpreadSheet: TdxSpreadSheet;
  varID, varYNumber,varCodSeton, varDescricao, varAtual : String;
  varUltimaLinha : Integer;

begin

  Mensagem( 'Iniciando processo de importa��o...' );
  try

    dxSpreadSheet := TdxSpreadSheet.Create(nil);
    try

      Mensagem( 'Carregando planilha...' );
      dxSpreadSheet.LoadFromFile( cxButtonEditPath.Text );
      dxSpreadSheet.BeginUpdate;

      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );

      Mensagem( 'Abrindo Conex�o...' );
      FDConnection.Open;
      try

          Mensagem( 'Apagando Produto Seton' );
          FDScriptProdutoSetonDelete.ExecuteAll;

          FDQueryTSOP_ProdutoSeton.Open;

          try

            Mensagem( 'Lendo linhas da planilha...' );
            Application.ProcessMessages;
            Sleep(1000);
            Application.ProcessMessages;
            varUltimaLinha :=  dxSpreadSheet.ActiveSheetAsTable.Rows.LastIndex;
            Mensagem( 'Total de linhas: ' + IntToStr(varUltimaLinha) );
            Application.ProcessMessages;
            Sleep(5000);
            Application.ProcessMessages;

            for X := dxSpreadSheet.ActiveSheetAsTable.Rows.FirstIndex+1 to varUltimaLinha do
            begin

              try

               if not Assigned(dxSpreadSheet.ActiveSheetAsTable.Rows[X].Cells[0]) then
                 Continue;

                if dxSpreadSheet.ActiveSheetAsTable.Rows[X].Cells[1].AsString = EmptyStr then
                   Continue;

                Mensagem( 'Linha (" ' + IntToStr(X) + '/' + IntToStr(varUltimaLinha) + '...' );

                if not Assigned(dxSpreadSheet.ActiveSheetAsTable.Rows[X].Cells[1]) then
                 varYNumber := ''
                else varYNumber    :=  dxSpreadSheet.ActiveSheetAsTable.Rows[X].Cells[1].AsString;

                if not Assigned(dxSpreadSheet.ActiveSheetAsTable.Rows[X].Cells[2]) then
                  varCodSeton := ''
                else varCodSeton   :=  dxSpreadSheet.ActiveSheetAsTable.Rows[X].Cells[2].AsString;

                if not Assigned(dxSpreadSheet.ActiveSheetAsTable.Rows[X].Cells[3]) then
                   varDescricao := ''
                else varDescricao  :=  dxSpreadSheet.ActiveSheetAsTable.Rows[X].Cells[3].AsString;

                 if not Assigned(dxSpreadSheet.ActiveSheetAsTable.Rows[X].Cells[4]) then
                  varAtual := ''
                else varAtual      :=  dxSpreadSheet.ActiveSheetAsTable.Rows[X].Cells[4].AsString;


                FDQueryTSOP_ProdutoSeton.Append;

                FDQueryTSOP_ProdutoSetonTSOP_YNUMBER.AsString   := varYNumber;
                FDQueryTSOP_ProdutoSetonTSOP_CODSETON.AsString  := varCodSeton;
                FDQueryTSOP_ProdutoSetonTSOP_DESCRICAO.AsString := varDescricao;
                FDQueryTSOP_ProdutoSetonTSOP_ATUAL.AsString     := varAtual;

                try
                   FDQueryTSOP_ProdutoSeton.Post;
                 except
                   on E: Exception do
                   begin
                     FDQueryTSOP_ProdutoSeton.Cancel;
                     ShowMessage(E.Message);
                   end;
                end;

                Application.ProcessMessages;

              except

                on E: Exception do
                begin
                  ShowMessage(E.Message);
                end;

              end;

            end;

          finally

            FDQueryTSOP_ProdutoSeton.Close;

          end;


        Application.MessageBox( 'Dados carregados com sucesso!!!', 'S&OP', MB_ICONINFORMATION );

      finally

        FDConnection.Close;

      end;

    finally

      FreeAndNil(dxSpreadSheet);

    end;

  finally

    Mensagem( EmptyStr );

  end;

end;

procedure TFr_UploadPodutoSeton.Mensagem(pMensagem: String);
begin

  cxLabelMensagem.Caption := pMensagem;
  PanelSQLSplashScreen.Visible := not pMensagem.IsEmpty;
  Update;
  Application.ProcessMessages;

end;

end.
