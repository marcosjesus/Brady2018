unit uImportarIQFZMP05;

interface

uses
  dxSpreadSheet,
  dxSpreadSheetTypes,
  dxHashUtils,
  dxSpreadSheetCore,
  System.IOUtils,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxCheckBox,
  cxContainer, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxLabel, dxGDIPlusClasses, Vcl.ExtCtrls, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, dxSkinOffice2013White, dxBarBuiltInMenu, Vcl.Menus,
  cxTextEdit, cxButtons, cxPC, Vcl.StdCtrls, cxMemo, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, FireDAC.Comp.ScriptCommands,
  FireDAC.Comp.Script;

type
  TFr_ImportarIQFZMP05 = class(TForm)
    DataSourceTIQF_Periodo: TDataSource;
    FDConnection: TFDConnection;
    OpenDialog: TOpenDialog;
    FDQueryTIQF_Periodo: TFDQuery;
    FDQueryTIQF_PeriodoTIQF_PERCOD: TFDAutoIncField;
    FDQueryTIQF_PeriodoTIQF_PERNOM: TStringField;
    FDQueryTIQF_PeriodoTIQF_PERDAT: TSQLTimeStampField;
    FDQueryTIQF_Dados: TFDQuery;
    FDQueryTIQF_DadosTIQF_DADCOD: TFDAutoIncField;
    FDQueryTIQF_DadosTIQF_PERCOD: TIntegerField;
    FDQueryTIQF_DadosTIQF_FORCOD: TIntegerField;
    FDQueryTIQF_DadosTIQF_DADQTDENT: TIntegerField;
    FDQueryTIQF_DadosTIQF_DADQTDATR: TIntegerField;
    FDQueryTIQF_DadosTIQF_DADQTDRNCEMB: TIntegerField;
    FDQueryTIQF_DadosTIQF_DADQTDFAL: TIntegerField;
    FDQueryTIQF_DadosTIQF_DADPERIQFMES: TBCDField;
    FDQueryTIQF_DadosTIQF_DADPERIQFACU: TBCDField;
    FDQueryTIQF_Fornecedor: TFDQuery;
    FDQueryTIQF_FornecedorTIQF_FORCOD: TFDAutoIncField;
    FDQueryTIQF_FornecedorTIQF_FORSAP: TStringField;
    FDQueryTIQF_FornecedorTIQF_FORNOM: TStringField;
    FDQueryTIQF_FornecedorTIQF_FORATI: TStringField;
    FDQueryTIQF_FornecedorTIQF_FORCER: TStringField;
    cxPageControlFiltro: TcxPageControl;
    cxTabSheetFiltro: TcxTabSheet;
    cxComboBoxSheet: TcxComboBox;
    cxLabelSheet: TcxLabel;
    PanelSQLSplashScreen: TPanel;
    ImageSQLSplashScreen: TImage;
    cxLabelMensagem: TcxLabel;
    cxLabelSequenciaInicial: TcxLabel;
    cxLabelDataFinal: TcxLabel;
    cxButtonImportar: TcxButton;
    cxTextEditFileName: TcxTextEdit;
    cxButtonArquivo: TcxButton;
    cxLookupComboBoxPeriodo: TcxLookupComboBox;
    FDScriptCalcIQF: TFDScript;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButtonArquivoClick(Sender: TObject);
    procedure cxButtonImportarClick(Sender: TObject);
  private
    procedure Mensagem( pMensagem: String );
    { Private declarations }
  public
    procedure AbrirDataset;
    { Public declarations }
  end;

var
  Fr_ImportarIQFZMP05: TFr_ImportarIQFZMP05;

implementation

{$R *.dfm}

uses uUtils, uBrady;

procedure TFr_ImportarIQFZMP05.AbrirDataset;
begin

  if not FDConnection.Connected then
  begin

    Mensagem( 'Abrindo conexão...' );
    try

      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );
      FDConnection.Open;

      Mensagem( 'Obtendo dados (Periodo)...' );
      FDQueryTIQF_Periodo.Open;

      Mensagem( 'Obtendo dados (Fornecedor)...' );
      FDQueryTIQF_Fornecedor.Open;

    finally

      Mensagem( EmptyStr );

    end;

  end;

end;

procedure TFr_ImportarIQFZMP05.cxButtonArquivoClick(Sender: TObject);
var
  I: Integer;
  dxSpreadSheet: TdxSpreadSheet;

begin

  if OpenDialog.Execute(Handle) then
  begin

    cxTextEditFileName.Text := OpenDialog.FileName;

    dxSpreadSheet := TdxSpreadSheet.Create(nil);
    try

      dxSpreadSheet.LoadFromFile( cxTextEditFileName.Text );

      cxComboBoxSheet.Properties.Items.Clear;
      for I := 0 to dxSpreadSheet.SheetCount-1 do
        cxComboBoxSheet.Properties.Items.Add( dxSpreadSheet.Sheets[I].Caption );

    finally

      FreeAndNil(dxSpreadSheet);

    end;


  end;

end;

procedure TFr_ImportarIQFZMP05.cxButtonImportarClick(Sender: TObject);
var
  I: Integer;
  varCode: Integer;

  dxSpreadSheet: TdxSpreadSheet;

  varColumnCODFOR: Integer;
  varColumnNOMFOR: Integer;
  varColumnQTDENTREGA: Integer;
  varColumnATRASADA: Integer;
  varColumnRNCEMBARQUE: Integer;
  varColumnFALHA: Integer;

  varCODFOR: Integer;
  varNOMFOR: String;
  varQTDENTREGA: Integer;
  varATRASADA: Integer;
  varRNCEMBARQUE: Integer;
  varFALHA: Integer;

begin

  try
    if cxLookupComboBoxPeriodo.SelectedItem = -1 then
      raise Exception.Create('Selecione um periodo primeiro.');

    if cxTextEditFileName.Text = EmptyStr then
      raise Exception.Create('Selecione um arquivo para importar.');

    if cxComboBoxSheet.SelectedItem = -1 then
      raise Exception.Create('Selecione uma aba da planilha.');

    dxSpreadSheet := TdxSpreadSheet.Create(nil);
    try

      Mensagem( 'Carregando planilha...' );
      dxSpreadSheet.LoadFromFile( cxTextEditFileName.Text );

      varColumnCODFOR := -1;
      varColumnNOMFOR := -1;
      varColumnQTDENTREGA := -1;
      varColumnATRASADA := -1;
      varColumnRNCEMBARQUE := -1;
      varColumnFALHA := -1;

      for I := 0 to dxSpreadSheet.SheetCount-1 do
        if cxComboBoxSheet.Properties.Items[cxComboBoxSheet.SelectedItem] = dxSpreadSheet.Sheets[I].Caption then
          dxSpreadSheet.Sheets[I].Active := True;

      for I := dxSpreadSheet.ActiveSheetAsTable.Columns.FirstIndex to dxSpreadSheet.ActiveSheetAsTable.Columns.LastIndex do
      begin

        if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Fornecedor' then
          varColumnCODFOR := I;

        if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Nome1' then
          varColumnNOMFOR := I;

        if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Rcvd' then
          varColumnQTDENTREGA := I;

        if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'OT to initial' then
          varColumnATRASADA := I;

        if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'RNC' then
          varColumnRNCEMBARQUE := I;

        if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Falha' then
          varColumnFALHA := I;

      end;

      if varColumnCODFOR = -1 then
        raise Exception.Create('Coluna "Fornecedor" não foi encontrada na planilha selecionada.');

      if varColumnNOMFOR = -1 then
        raise Exception.Create('Coluna "Nome1" não foi encontrada na planilha selecionada.');

      if varColumnQTDENTREGA = -1 then
        raise Exception.Create('Coluna "Rcvd" não foi encontrada na planilha selecionada.');

      if varColumnATRASADA = -1 then
        raise Exception.Create('Coluna "OT to initial" não foi encontrada na planilha selecionada.');

      if varColumnRNCEMBARQUE = -1 then
        raise Exception.Create('Coluna "RNC" não foi encontrada na planilha selecionada.');

      if varColumnFALHA = -1 then
        raise Exception.Create('Coluna "Falha" não foi encontrada na planilha selecionada.');

      FDQueryTIQF_Dados.ParamByName('TIQF_PERCOD').AsInteger := FDQueryTIQF_PeriodoTIQF_PERCOD.AsInteger;
      FDQueryTIQF_Dados.Close;
      FDQueryTIQF_Dados.Open;

      while not FDQueryTIQF_Dados.Eof do
        FDQueryTIQF_Dados.Delete;

      for I := dxSpreadSheet.ActiveSheetAsTable.Rows.FirstIndex+1 to dxSpreadSheet.ActiveSheetAsTable.Rows.LastIndex do
      begin

        try
          Val( dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnCODFOR].AsString, varCODFOR, varCode );
        except
          varCode := 1;
        end;

        if varCode <> 0 then
          Continue;

        varNOMFOR := dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnNOMFOR].AsString;
        varQTDENTREGA := dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnQTDENTREGA].AsInteger;
        varATRASADA := varQTDENTREGA - dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnATRASADA].AsInteger;
        varRNCEMBARQUE := dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnRNCEMBARQUE].AsInteger;
        varFALHA := dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnFALHA].AsInteger;

        if not FDQueryTIQF_Fornecedor.Locate( 'TIQF_FORSAP', varCODFOR, [] ) then
        begin

          Mensagem( 'Criando fornecedor ("' + varNOMFOR + '")...' );
          FDQueryTIQF_Fornecedor.Append;

          FDQueryTIQF_FornecedorTIQF_FORSAP.AsInteger := varCODFOR;
          FDQueryTIQF_FornecedorTIQF_FORNOM.AsString := varNOMFOR;
          FDQueryTIQF_FornecedorTIQF_FORATI.AsString := 'S';
          FDQueryTIQF_FornecedorTIQF_FORCER.AsString := 'N';

          try

            FDQueryTIQF_Fornecedor.Post;

          except

            FDQueryTIQF_Fornecedor.Cancel;

          end;

        end;

        Mensagem( 'Criando dados entrega ( "' + varNOMFOR + '" )...' );

        FDQueryTIQF_Dados.Append;

        FDQueryTIQF_DadosTIQF_PERCOD.AsInteger       := FDQueryTIQF_PeriodoTIQF_PERCOD.AsInteger;
        FDQueryTIQF_DadosTIQF_FORCOD.AsInteger       := FDQueryTIQF_FornecedorTIQF_FORCOD.AsInteger;
        FDQueryTIQF_DadosTIQF_DADQTDENT.AsInteger    := varQTDENTREGA;
        FDQueryTIQF_DadosTIQF_DADQTDATR.AsInteger    := varATRASADA;
        FDQueryTIQF_DadosTIQF_DADQTDRNCEMB.AsInteger := varRNCEMBARQUE;
        FDQueryTIQF_DadosTIQF_DADQTDFAL.AsInteger    := varFALHA;
        FDQueryTIQF_DadosTIQF_DADPERIQFMES.AsFloat   := 0.00;
        FDQueryTIQF_DadosTIQF_DADPERIQFACU.AsFloat   := 0.00;

        try

          FDQueryTIQF_Dados.Post;

        except

          FDQueryTIQF_Dados.Cancel;

        end;

      end;

    finally

      FreeAndNil(dxSpreadSheet);

    end;

    Mensagem( 'Calculando IQF Acumulado...' );
    FDScriptCalcIQF.SQLScripts.Clear;
    FDScriptCalcIQF.SQLScripts.Add.SQL.Add( 'EXEC dbo.PIQF_CalculoIQF ' + FDQueryTIQF_PeriodoTIQF_PERCOD.AsString );
    FDScriptCalcIQF.ExecuteAll;

    Mensagem( 'Importação Concluida...' );

    Sleep(3000);

    Mensagem( EmptyStr );

  except

    on E: Exception do
    begin

      Mensagem( EmptyStr );
      raise Exception.Create('Erro no processamento.' + #13#10 + E.Message);

    end;

  end;

end;

procedure TFr_ImportarIQFZMP05.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  FDQueryTIQF_Periodo.Close;
  FDConnection.Close;

  Fr_ImportarIQFZMP05 := nil;
  Action := caFree;

end;

procedure TFr_ImportarIQFZMP05.Mensagem(pMensagem: String);
begin

  cxLabelMensagem.Caption := pMensagem;
  PanelSQLSplashScreen.Visible := not pMensagem.IsEmpty;
  Update;
  Application.ProcessMessages;

end;

end.
