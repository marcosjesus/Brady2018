unit uUploadForecast;

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
  dxGDIPlusClasses, Vcl.ExtCtrls, cxCheckBox, cxDropDownEdit;

type
  TFr_UploadForecast = class(TForm)
    FDConnection: TFDConnection;
    FDQueryVSOP_ClienteBySalesRep: TFDQuery;
    cxPageControlPivot: TcxPageControl;
    cxTabSheetPivot00: TcxTabSheet;
    SaveDialog: TSaveDialog;
    OpenDialog: TOpenDialog;
    cxLabel1: TcxLabel;
    cxButtonEditPath: TcxButtonEdit;
    cxButtonProcessar: TcxButton;
    FDQueryVSOP_ClienteBySalesRepTSOP_ORDBILGRUCLINOM: TStringField;
    FDQueryVSOP_ClienteBySalesRepTSOP_ORDBILCLICOD: TStringField;
    FDQueryVSOP_ClienteBySalesRepTSOP_ORDBILCLINOM: TStringField;
    FDQueryVSOP_ClienteBySalesRepBudget: TFDQuery;
    FDQueryVSOP_ClienteBySalesRepBudgetTSOP_ORDBILGRUCLINOM: TStringField;
    FDQueryVSOP_ClienteBySalesRepBudgetTSOP_ORDBILCLICOD: TStringField;
    FDQueryVSOP_ClienteBySalesRepBudgetTSOP_ORDBILCLINOM: TStringField;
    FDQueryVSOP_ClienteBySalesRepBudgetTSOP_BUDDAT: TSQLTimeStampField;
    FDQueryVSOP_ClienteBySalesRepBudgetTSOP_BUDVLF: TBCDField;
    PanelSQLSplashScreen: TPanel;
    ImageSQLSplashScreen: TImage;
    cxLabelMensagem: TcxLabel;
    FDQueryTSOP_Budget: TFDQuery;
    FDQueryTSOP_BudgetTSOP_BUDCOD: TFDAutoIncField;
    FDQueryTSOP_BudgetTSOP_BUDTIP: TStringField;
    FDQueryTSOP_BudgetTSOP_BUDDATREF: TSQLTimeStampField;
    FDQueryTSOP_BudgetTSOP_BUDDAT: TSQLTimeStampField;
    FDQueryTSOP_BudgetTSOP_BUDCLICOD: TStringField;
    FDQueryTSOP_BudgetTSOP_BUDVLF: TBCDField;
    FDQueryVSOP_ClienteBySalesRepTSOP_ORDBILREPNOM: TStringField;
    FDQueryVSOP_ClienteBySalesRepTSOP_ORDBILREGEST: TStringField;
    cxRadioGroupOpcao: TcxRadioGroup;
    FDQueryVSOP_ClienteBySalesRepTSOP_ORDBILREG: TStringField;
    FDQueryVSOP_ClienteFamiliaBySalesRep: TFDQuery;
    FDQueryVSOP_ClienteFamiliaBySalesRepTSOP_ORDBILGRUCLINOM: TStringField;
    FDQueryVSOP_ClienteFamiliaBySalesRepTSOP_ORDBILCLICOD: TStringField;
    FDQueryVSOP_ClienteFamiliaBySalesRepTSOP_ORDBILCLINOM: TStringField;
    FDQueryVSOP_ClienteFamiliaBySalesRepTSOP_ORDBILREPNOM: TStringField;
    FDQueryVSOP_ClienteFamiliaBySalesRepTSOP_ORDBILREGEST: TStringField;
    FDQueryVSOP_ClienteFamiliaBySalesRepTSOP_ORDBILREG: TStringField;
    FDQueryVSOP_ClienteFamiliaBySalesRepBudget: TFDQuery;
    FDQueryVSOP_ClienteFamiliaBySalesRepBudgetTSOP_ORDBILGRUCLINOM: TStringField;
    FDQueryVSOP_ClienteFamiliaBySalesRepBudgetTSOP_ORDBILCLICOD: TStringField;
    FDQueryVSOP_ClienteFamiliaBySalesRepBudgetTSOP_ORDBILCLINOM: TStringField;
    FDQueryVSOP_ClienteFamiliaBySalesRepBudgetTSOP_BUDDAT: TSQLTimeStampField;
    FDQueryVSOP_ClienteFamiliaBySalesRepBudgetTSOP_BUDVLF: TBCDField;
    FDQueryVSOP_ClienteFamiliaBySalesRepTSOP_ORDBILITEFAMPAI: TStringField;
    FDQueryVSOP_ClienteFamiliaBySalesRepTSOP_ORDBILITEFAM: TStringField;
    FDQueryVSOP_ClienteFamiliaBySalesRepBudgetTSOP_ORDBILITEFAMPAI: TStringField;
    FDQueryVSOP_ClienteFamiliaBySalesRepBudgetTSOP_ORDBILITEFAM: TStringField;
    FDQueryVSOP_ClienteFamiliaBySalesRepTSOP_ORDBILSITNOM: TStringField;
    FDQueryVSOP_ClienteBySalesRepTSOP_ORDBILSITNOM: TStringField;
    FDQueryVSOP_ClienteBySalesRepBudgetTSOP_ORDBILSITNOM: TStringField;
    FDQueryVSOP_ClienteBySalesRepBilling: TFDQuery;
    FDQueryVSOP_ClienteFamiliaBySalesRepBudgetTSOP_ORDBILSITNOM: TStringField;
    FDQueryVSOP_ClienteFamiliaBySalesRepBilling: TFDQuery;
    FDQueryTSOP_BudgetTSOP_BUDFAM: TStringField;
    FDQueryTSOP_BudgetTSOP_ORDBILSITNOM: TStringField;
    FDQueryVSOP_ClienteBySalesRepBillingTSOP_ORDBILGRUCLINOM: TStringField;
    FDQueryVSOP_ClienteBySalesRepBillingTSOP_ORDBILCLICOD: TStringField;
    FDQueryVSOP_ClienteBySalesRepBillingTSOP_ORDBILCLINOM: TStringField;
    FDQueryVSOP_ClienteBySalesRepBillingTSOP_ORDBILSITNOM: TStringField;
    FDQueryVSOP_ClienteBySalesRepBillingTSOP_BUDDAT: TSQLTimeStampField;
    FDQueryVSOP_ClienteBySalesRepBillingTSOP_BUDVLF: TFMTBCDField;
    FDQueryVSOP_ClienteFamiliaBySalesRepBillingTSOP_ORDBILGRUCLINOM: TStringField;
    FDQueryVSOP_ClienteFamiliaBySalesRepBillingTSOP_ORDBILSITNOM: TStringField;
    FDQueryVSOP_ClienteFamiliaBySalesRepBillingTSOP_ORDBILCLICOD: TStringField;
    FDQueryVSOP_ClienteFamiliaBySalesRepBillingTSOP_ORDBILCLINOM: TStringField;
    FDQueryVSOP_ClienteFamiliaBySalesRepBillingTSOP_ORDBILITEFAMPAI: TStringField;
    FDQueryVSOP_ClienteFamiliaBySalesRepBillingTSOP_ORDBILITEFAM: TStringField;
    FDQueryVSOP_ClienteFamiliaBySalesRepBillingTSOP_BUDDAT: TSQLTimeStampField;
    FDQueryVSOP_ClienteFamiliaBySalesRepBillingTSOP_BUDVLF: TFMTBCDField;
    FDQueryTSOP_BudgetTSOP_USUCOD: TIntegerField;
    FDQueryTSOP_BudgetTSOP_BUDDATCAD: TSQLTimeStampField;
    cxComboBoxTipo: TcxComboBox;
    cxLabelTipo: TcxLabel;
    cxRadioGroupOperacao: TcxRadioGroup;
    cxTextEditIni: TcxTextEdit;
    cxTextEditFim: TcxTextEdit;
    cxLabelIni: TcxLabel;
    cxLabelAte: TcxLabel;
    FDQueryTSOP_PeriodoImportacao: TFDQuery;
    FDQueryTSOP_PeriodoImportacaoTSOP_PERIMPINI: TIntegerField;
    FDQueryTSOP_PeriodoImportacaoTSOP_PERIMPFIN: TIntegerField;
    cxRadioGroupOrigem: TcxRadioGroup;
    FDQueryTSOP_PeriodoImportacaoTSOP_USUCOD: TIntegerField;
    FDQueryTSOP_PeriodoImportacaoTSOP_PERIMPDATCAD: TSQLTimeStampField;
    procedure cxRadioGroupOperacaoPropertiesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButtonProcessarClick(Sender: TObject);
    procedure cxButtonEditPathClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    function getTSOP_BUDTIP: string;
    procedure ImportarForecast;
    procedure ExportarForecastCliente;
    procedure ExportarForecastFamilia;
    procedure Mensagem( pMensagem: String );
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fr_UploadForecast: TFr_UploadForecast;

implementation

{$R *.dfm}

uses uBrady, uUtils;

procedure TFr_UploadForecast.cxButtonEditPathClick(Sender: TObject);
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

procedure TFr_UploadForecast.cxButtonProcessarClick(Sender: TObject);
begin

  if cxButtonEditPath.Text = EmptyStr then
    raise Exception.Create('Informe o arquivo primeiro.');

  if cxRadioGroupOperacao.ItemIndex = 0 then
  begin

    if Fr_Brady.SalesRep then
    begin

      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );

      Mensagem( 'Abrindo Conexão...' );
      FDConnection.Open;

      Mensagem( 'Verificando periodo...' );
      FDQueryTSOP_PeriodoImportacao.Close;
      FDQueryTSOP_PeriodoImportacao.Open;

      if (DayOfTheMonth(Now) > FDQueryTSOP_PeriodoImportacaoTSOP_PERIMPFIN.AsInteger) or (DayOfTheMonth(Now) < FDQueryTSOP_PeriodoImportacaoTSOP_PERIMPINI.AsInteger) then
        raise Exception.Create('Fora do periodo permitido para efetuar a carga dos dados (' + FDQueryTSOP_PeriodoImportacaoTSOP_PERIMPINI.AsString + '/' + FDQueryTSOP_PeriodoImportacaoTSOP_PERIMPFIN.AsString + ').');

      FDConnection.Close;

      Mensagem( '' );

    end;

    ImportarForecast;

  end
  else
  begin

    if cxRadioGroupOpcao.ItemIndex = 0 then
      ExportarForecastCliente
    else
      ExportarForecastFamilia;

  end;

end;

procedure TFr_UploadForecast.cxRadioGroupOperacaoPropertiesChange(Sender: TObject);
begin

  if cxRadioGroupOperacao.ItemIndex = 0 then
    cxButtonProcessar.Caption := 'Importar'
  else
    cxButtonProcessar.Caption := 'Exportar';

  cxButtonEditPath.Text := EmptyStr;

end;

procedure TFr_UploadForecast.ExportarForecastCliente;
const
  varCelulas: array[7..30] of string = ('H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','AA','AB','AC','AD','AE');

var
  I, X, LastX: Integer;
  dxSpreadSheet: TdxSpreadSheet;
  varData: TDateTime;
  varLastGrupoCliente: String;
  varCor1,varCor2: TColor;
  varSubtotal: array[7..30] of string;

begin

  Mensagem( 'Iniciando processo de exportação...' );
  try

    Mensagem( 'Criando planilha...' );
    DeleteFile(PWideChar(MyDocumentsPath+'\Forecast_Upload.xlsx'));
    CopyFile( PWideChar('\\ghos2024\Brady\Forecast_Upload.xlsx'), PWideChar(MyDocumentsPath+'\Forecast_Upload.xlsx'), True );

    dxSpreadSheet := TdxSpreadSheet.Create(nil);
    try

      Mensagem( 'Carregando planilha...' );
      dxSpreadSheet.LoadFromFile( MyDocumentsPath+'\Forecast_Upload.xlsx' );
      dxSpreadSheet.BeginUpdate;

      for I := 0 to 6 do
      begin

        with dxSpreadSheet.ActiveSheetAsTable.CreateCell(0,I) do;

      end;

      varData := System.DateUtils.StartOfTheMonth(IncMonth(Now,-12));
      for I := 7 to 30 do
      begin

        varData := System.DateUtils.StartOfTheMonth(System.DateUtils.EndOfTheMonth(varData)+1);
        with dxSpreadSheet.ActiveSheetAsTable.CreateCell(0,I) do
        begin

          AsString := FormatDateTime('mmm - yyyy', varData);

        end;

      end;

      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );

      Mensagem( 'Abrindo Conexão...' );
      FDConnection.Open;
      try

        if Fr_Brady.SalesRep then
        begin
          FDQueryVSOP_ClienteBySalesRepBilling.MacroByName( 'WHERE1' ).AsRaw := ' AND A01.TSOP_ORDBILREPNOM = ' + QuotedStr(Fr_Brady.TSIS_USUNOM);
          //FDQueryVSOP_ClienteBySalesRepBilling.MacroByName( 'WHERE2' ).AsRaw := ' AND A01.TSOP_ORDBILREPNOM = ' + QuotedStr(Fr_Brady.TSIS_USUNOM);
        end;

        Mensagem( 'Vendas x Sales Rep...' );
        FDQueryVSOP_ClienteBySalesRepBilling.Open;

        if Fr_Brady.SalesRep then
          FDQueryVSOP_ClienteBySalesRepBudget.MacroByName( 'WHERE1' ).AsRaw := ' AND A01.TSOP_ORDBILREPNOM = ' + QuotedStr(Fr_Brady.TSIS_USUNOM);

        Mensagem( 'Forecast x Sales Rep...' );
        if cxRadioGroupOrigem.ItemIndex = 1 then
          FDQueryVSOP_ClienteBySalesRepBudget.ParamByName( 'TSOP_BUDDATREF_ANT' ).AsDateTime := System.DateUtils.StartOfTheMonth(Now)
        else
          FDQueryVSOP_ClienteBySalesRepBudget.ParamByName( 'TSOP_BUDDATREF_ANT' ).AsDateTime := System.DateUtils.StartOfTheMonth(IncMonth(Now,-1));
        FDQueryVSOP_ClienteBySalesRepBudget.ParamByName( 'TSOP_BUDTIP' ).AsString := getTSOP_BUDTIP;
        FDQueryVSOP_ClienteBySalesRepBudget.Open;

        if Fr_Brady.SalesRep then
          FDQueryVSOP_ClienteBySalesRep.MacroByName( 'WHERE1' ).AsRaw := ' AND A01.TSOP_ORDBILREPNOM = ' + QuotedStr(Fr_Brady.TSIS_USUNOM);

        Mensagem( 'Clientes x Sales Rep...' );
        FDQueryVSOP_ClienteBySalesRep.Open;
        try

          varLastGrupoCliente := EmptyStr;
          varCor1 := RGB( 255, 255, 204 );
          varCor2 := RGB(255,255,225);

          X := 1;
          LastX := 1;
          while True do
          begin

            Mensagem( 'Cliente (" '+ FDQueryVSOP_ClienteBySalesRepTSOP_ORDBILCLICOD.AsString + ' - ' + FDQueryVSOP_ClienteBySalesRepTSOP_ORDBILCLINOM.AsString +' ")...' );

            if (varLastGrupoCliente <> FDQueryVSOP_ClienteBySalesRepTSOP_ORDBILGRUCLINOM.AsString) or FDQueryVSOP_ClienteBySalesRep.Eof then
            begin

              if varLastGrupoCliente <> EmptyStr then
              begin

                with dxSpreadSheet.ActiveSheetAsTable.CreateCell(X,0) do
                  Style.Brush.BackgroundColor := varCor1;

                with dxSpreadSheet.ActiveSheetAsTable.CreateCell(X,1) do
                begin
                  Style.Font.Style := Style.Font.Style + [fsBold];
                  Style.Brush.BackgroundColor := varCor1;
                  AsVariant := varLastGrupoCliente;
                end;

                with dxSpreadSheet.ActiveSheetAsTable.CreateCell(X,2) do
                  Style.Brush.BackgroundColor := varCor1;

                with dxSpreadSheet.ActiveSheetAsTable.CreateCell(X,3) do
                  Style.Brush.BackgroundColor := varCor1;

                with dxSpreadSheet.ActiveSheetAsTable.CreateCell(X,4) do
                  Style.Brush.BackgroundColor := varCor1;

                with dxSpreadSheet.ActiveSheetAsTable.CreateCell(X,5) do
                  Style.Brush.BackgroundColor := varCor1;

                with dxSpreadSheet.ActiveSheetAsTable.CreateCell(X,6) do
                  Style.Brush.BackgroundColor := varCor1;

                for I := 7 to 30 do
                begin

                  with dxSpreadSheet.ActiveSheetAsTable.CreateCell(X,I) do
                  begin

                    Style.Font.Style := Style.Font.Style + [fsBold];
                    Style.Brush.BackgroundColor := varCor2;
                    Style.DataFormat.FormatCode := '#,##0.00';
                    SetText('=SUM('+ varCelulas[I] + IntToStr( LastX+1 ) + ':' + varCelulas[I] + IntToStr(X)+')', True);

                    if varSubtotal[I].IsEmpty then
                      varSubtotal[I] := '=' + varCelulas[I] + IntToStr(X+1)
                    else
                      varSubtotal[I] := varSubtotal[I] + '+' + varCelulas[I] + IntToStr(X+1);

                  end;

                end;

                Inc(X);
                LastX := X;

              end;

              if varCor1 = RGB( 197, 224, 178 ) then
                varCor1 := RGB( 255, 255, 204 )
              else
                varCor1 := RGB( 197, 224, 178 );

              if varCor1 = RGB(255,255,204) then
                varCor2 := RGB(255,255,225)
              else
                varCor2 := RGB(216,234,204);

            end;

            if FDQueryVSOP_ClienteBySalesRep.Eof then
            begin

              for I := 7 to 30 do
              begin

                with dxSpreadSheet.ActiveSheetAsTable.CreateCell(X,I) do
                begin

                  Style.Font.Style := Style.Font.Style + [fsBold];
                  Style.DataFormat.FormatCode := '#,##0.00';
                  SetText(varSubtotal[I], True);

                end;

              end;

              Break;
            end;

            with dxSpreadSheet.ActiveSheetAsTable.CreateCell(X,0) do
            begin

              Style.Brush.BackgroundColor := varCor1;
              AsVariant := FDQueryVSOP_ClienteBySalesRepTSOP_ORDBILREPNOM.AsString;

            end;

            with dxSpreadSheet.ActiveSheetAsTable.CreateCell(X,1) do
            begin

              Style.Brush.BackgroundColor := varCor1;
              AsVariant := FDQueryVSOP_ClienteBySalesRepTSOP_ORDBILGRUCLINOM.AsString;

            end;

            with dxSpreadSheet.ActiveSheetAsTable.CreateCell(X,2) do
            begin

              Style.Brush.BackgroundColor := varCor1;
              AsVariant := FDQueryVSOP_ClienteBySalesRepTSOP_ORDBILSITNOM.AsString;

            end;

            with dxSpreadSheet.ActiveSheetAsTable.CreateCell(X,3) do
            begin

              Style.Brush.BackgroundColor := varCor1;
              AsVariant := FDQueryVSOP_ClienteBySalesRepTSOP_ORDBILCLICOD.AsString;

            end;

            with dxSpreadSheet.ActiveSheetAsTable.CreateCell(X,4) do
            begin

              Style.Brush.BackgroundColor := varCor1;
              AsVariant := FDQueryVSOP_ClienteBySalesRepTSOP_ORDBILCLINOM.AsString;

            end;

            with dxSpreadSheet.ActiveSheetAsTable.CreateCell(X,5) do
            begin

              Style.Brush.BackgroundColor := varCor1;
              AsVariant := FDQueryVSOP_ClienteBySalesRepTSOP_ORDBILREG.AsString;

            end;

            with dxSpreadSheet.ActiveSheetAsTable.CreateCell(X,6) do
            begin

              Style.Brush.BackgroundColor := varCor1;
              AsVariant := FDQueryVSOP_ClienteBySalesRepTSOP_ORDBILREGEST.AsString;

            end;

            varData := System.DateUtils.StartOfTheMonth(IncMonth(Now,-12));
            for I := 7 to 30 do
            begin

              varData := System.DateUtils.StartOfTheMonth(System.DateUtils.EndOfTheMonth(varData)+1);

              if varLastGrupoCliente <> FDQueryVSOP_ClienteBySalesRepTSOP_ORDBILGRUCLINOM.AsString then
                if varCor1 = RGB(255,255,204) then
                  varCor2 := RGB(255,255,225)
                else
                  varCor2 := RGB(216,234,204);

              with dxSpreadSheet.ActiveSheetAsTable.CreateCell(X,I) do
              begin

                Style.Brush.BackgroundColor := varCor2;
                Style.DataFormat.FormatCode := '#,##0.00';

                if I < 18 then
                begin

                  if FDQueryVSOP_ClienteBySalesRepBilling.Locate( 'TSOP_ORDBILSITNOM;TSOP_ORDBILCLICOD;TSOP_BUDDAT', VarArrayOf([FDQueryVSOP_ClienteBySalesRepTSOP_ORDBILSITNOM.AsString,FDQueryVSOP_ClienteBySalesRepTSOP_ORDBILCLICOD.AsString,varData]) ) then
                    AsVariant := FDQueryVSOP_ClienteBySalesRepBillingTSOP_BUDVLF.AsFloat
                  else
                    AsVariant := 0.00;

                end
                else
                begin

                  if FDQueryVSOP_ClienteBySalesRepBudget.Locate( 'TSOP_ORDBILSITNOM;TSOP_ORDBILCLICOD;TSOP_BUDDAT', VarArrayOf([FDQueryVSOP_ClienteBySalesRepTSOP_ORDBILSITNOM.AsString,FDQueryVSOP_ClienteBySalesRepTSOP_ORDBILCLICOD.AsString,varData]) ) then
                    AsVariant := FDQueryVSOP_ClienteBySalesRepBudgetTSOP_BUDVLF.AsFloat
                  else
                    AsVariant := 0.00;

                end;

              end;

            end;

            varLastGrupoCliente := FDQueryVSOP_ClienteBySalesRepTSOP_ORDBILGRUCLINOM.AsString;

            FDQueryVSOP_ClienteBySalesRep.Next;
            Inc(X);
            Application.ProcessMessages;

          end;

        finally

          FDQueryVSOP_ClienteBySalesRepBudget.Close;
          FDQueryVSOP_ClienteBySalesRep.Close;

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

procedure TFr_UploadForecast.ExportarForecastFamilia;
const
  varCelulas: array[9..32] of string = ('J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','AA','AB','AC','AD','AE','AF','AG');

var
  I, X, LastX: Integer;
  dxSpreadSheet: TdxSpreadSheet;
  varData: TDateTime;
  varLastGrupoCliente: String;
  varCor1,varCor2: TColor;
  varSubtotal: array[9..32] of string;

begin

  Mensagem( 'Iniciando processo de exportação...' );
  try

    Mensagem( 'Criando planilha...' );
    DeleteFile(PWideChar(MyDocumentsPath+'\Forecast_Upload_Familia.xlsx'));
    CopyFile( PWideChar('\\ghos2024\Brady\Forecast_Upload_Familia.xlsx'), PWideChar(MyDocumentsPath+'\Forecast_Upload_Familia.xlsx'), True );

    dxSpreadSheet := TdxSpreadSheet.Create(nil);
    try

      Mensagem( 'Carregando planilha...' );
      dxSpreadSheet.LoadFromFile( MyDocumentsPath+'\Forecast_Upload_Familia.xlsx' );
      dxSpreadSheet.BeginUpdate;

      for I := 0 to 8 do
      begin

        with dxSpreadSheet.ActiveSheetAsTable.CreateCell(0,I) do;

      end;

      varData := System.DateUtils.StartOfTheMonth(IncMonth(Now,-12));
      for I := 9 to 32 do
      begin

        varData := System.DateUtils.StartOfTheMonth(System.DateUtils.EndOfTheMonth(varData)+1);
        with dxSpreadSheet.ActiveSheetAsTable.CreateCell(0,I) do
        begin

          AsString := FormatDateTime('mmm - yyyy', varData);

        end;

      end;

      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );

      Mensagem( 'Abrindo Conexão...' );
      FDConnection.Open;
      try

        if Fr_Brady.SalesRep then
        begin
          FDQueryVSOP_ClienteFamiliaBySalesRepBilling.MacroByName( 'WHERE1' ).AsRaw := ' AND A01.TSOP_ORDBILREPNOM = ' + QuotedStr(Fr_Brady.TSIS_USUNOM);
          //FDQueryVSOP_ClienteFamiliaBySalesRepBilling.MacroByName( 'WHERE2' ).AsRaw := ' AND A01.TSOP_ORDBILREPNOM = ' + QuotedStr(Fr_Brady.TSIS_USUNOM);
        end;

        Mensagem( 'Vendas x Sales Rep...' );
        FDQueryVSOP_ClienteFamiliaBySalesRepBilling.Open;

        if Fr_Brady.SalesRep then
          FDQueryVSOP_ClienteFamiliaBySalesRepBudget.MacroByName( 'WHERE1' ).AsRaw := ' AND A01.TSOP_ORDBILREPNOM = ' + QuotedStr(Fr_Brady.TSIS_USUNOM);

        Mensagem( 'Forecast x Sales Rep...' );
        if cxRadioGroupOrigem.ItemIndex = 1 then
          FDQueryVSOP_ClienteFamiliaBySalesRepBudget.ParamByName( 'TSOP_BUDDATREF_ANT' ).AsDateTime := System.DateUtils.StartOfTheMonth(Now)
        else
          FDQueryVSOP_ClienteFamiliaBySalesRepBudget.ParamByName( 'TSOP_BUDDATREF_ANT' ).AsDateTime := System.DateUtils.StartOfTheMonth(IncMonth(Now,-1));
        FDQueryVSOP_ClienteFamiliaBySalesRepBudget.ParamByName( 'TSOP_BUDTIP' ).AsString := getTSOP_BUDTIP;
        FDQueryVSOP_ClienteFamiliaBySalesRepBudget.Open;

        if Fr_Brady.SalesRep then
          FDQueryVSOP_ClienteFamiliaBySalesRep.MacroByName( 'WHERE1' ).AsRaw := ' AND A01.TSOP_ORDBILREPNOM = ' + QuotedStr(Fr_Brady.TSIS_USUNOM);

        Mensagem( 'Clientes x Sales Rep...' );
        FDQueryVSOP_ClienteFamiliaBySalesRep.Open;
        try

          varLastGrupoCliente := EmptyStr;
          varCor1 := RGB( 255, 255, 204 );
          varCor2 := RGB(255,255,225);

          X := 1;
          LastX := 1;
          while True do
          begin

            Mensagem( 'Cliente (" '+ FDQueryVSOP_ClienteFamiliaBySalesRepTSOP_ORDBILCLICOD.AsString + ' - ' + FDQueryVSOP_ClienteFamiliaBySalesRepTSOP_ORDBILCLINOM.AsString +' ")...' );

            if (varLastGrupoCliente <> FDQueryVSOP_ClienteFamiliaBySalesRepTSOP_ORDBILGRUCLINOM.AsString) or FDQueryVSOP_ClienteFamiliaBySalesRep.Eof then
            begin

              if varLastGrupoCliente <> EmptyStr then
              begin

                with dxSpreadSheet.ActiveSheetAsTable.CreateCell(X,0) do
                  Style.Brush.BackgroundColor := varCor1;

                with dxSpreadSheet.ActiveSheetAsTable.CreateCell(X,1) do
                begin
                  Style.Font.Style := Style.Font.Style + [fsBold];
                  Style.Brush.BackgroundColor := varCor1;
                  AsVariant := varLastGrupoCliente;
                end;

                with dxSpreadSheet.ActiveSheetAsTable.CreateCell(X,2) do
                  Style.Brush.BackgroundColor := varCor1;

                with dxSpreadSheet.ActiveSheetAsTable.CreateCell(X,3) do
                  Style.Brush.BackgroundColor := varCor1;

                with dxSpreadSheet.ActiveSheetAsTable.CreateCell(X,4) do
                  Style.Brush.BackgroundColor := varCor1;

                with dxSpreadSheet.ActiveSheetAsTable.CreateCell(X,5) do
                  Style.Brush.BackgroundColor := varCor1;

                with dxSpreadSheet.ActiveSheetAsTable.CreateCell(X,6) do
                  Style.Brush.BackgroundColor := varCor1;

                with dxSpreadSheet.ActiveSheetAsTable.CreateCell(X,7) do
                  Style.Brush.BackgroundColor := varCor1;

                with dxSpreadSheet.ActiveSheetAsTable.CreateCell(X,8) do
                  Style.Brush.BackgroundColor := varCor1;

                for I := 9 to 32 do
                begin

                  with dxSpreadSheet.ActiveSheetAsTable.CreateCell(X,I) do
                  begin

                    Style.Font.Style := Style.Font.Style + [fsBold];
                    Style.Brush.BackgroundColor := varCor2;
                    Style.DataFormat.FormatCode := '#,##0.00';
                    SetText('=SUM('+ varCelulas[I] + IntToStr( LastX+1 ) + ':' + varCelulas[I] + IntToStr(X)+')', True);

                    if varSubtotal[I].IsEmpty then
                      varSubtotal[I] := '=' + varCelulas[I] + IntToStr(X+1)
                    else
                      varSubtotal[I] := varSubtotal[I] + '+' + varCelulas[I] + IntToStr(X+1);

                  end;

                end;

                Inc(X);
                LastX := X;

              end;

              if varCor1 = RGB( 197, 224, 178 ) then
                varCor1 := RGB( 255, 255, 204 )
              else
                varCor1 := RGB( 197, 224, 178 );

              if varCor1 = RGB(255,255,204) then
                varCor2 := RGB(255,255,225)
              else
                varCor2 := RGB(216,234,204);

            end;

            if FDQueryVSOP_ClienteFamiliaBySalesRep.Eof then
            begin

              for I := 9 to 32 do
              begin

                with dxSpreadSheet.ActiveSheetAsTable.CreateCell(X,I) do
                begin

                  Style.Font.Style := Style.Font.Style + [fsBold];
                  Style.DataFormat.FormatCode := '#,##0.00';
                  SetText(varSubtotal[I], True);

                end;

              end;

              Break;
            end;

            with dxSpreadSheet.ActiveSheetAsTable.CreateCell(X,0) do
            begin

              Style.Brush.BackgroundColor := varCor1;
              AsVariant := FDQueryVSOP_ClienteFamiliaBySalesRepTSOP_ORDBILREPNOM.AsString;

            end;

            with dxSpreadSheet.ActiveSheetAsTable.CreateCell(X,1) do
            begin

              Style.Brush.BackgroundColor := varCor1;
              AsVariant := FDQueryVSOP_ClienteFamiliaBySalesRepTSOP_ORDBILGRUCLINOM.AsString;

            end;

            with dxSpreadSheet.ActiveSheetAsTable.CreateCell(X,2) do
            begin

              Style.Brush.BackgroundColor := varCor1;
              AsVariant := FDQueryVSOP_ClienteFamiliaBySalesRepTSOP_ORDBILSITNOM.AsString;

            end;

            with dxSpreadSheet.ActiveSheetAsTable.CreateCell(X,3) do
            begin

              Style.Brush.BackgroundColor := varCor1;
              AsVariant := FDQueryVSOP_ClienteFamiliaBySalesRepTSOP_ORDBILCLICOD.AsString;

            end;

            with dxSpreadSheet.ActiveSheetAsTable.CreateCell(X,4) do
            begin

              Style.Brush.BackgroundColor := varCor1;
              AsVariant := FDQueryVSOP_ClienteFamiliaBySalesRepTSOP_ORDBILCLINOM.AsString;

            end;

            with dxSpreadSheet.ActiveSheetAsTable.CreateCell(X,5) do
            begin

              Style.Brush.BackgroundColor := varCor1;
              AsVariant := FDQueryVSOP_ClienteFamiliaBySalesRepTSOP_ORDBILITEFAMPAI.AsString;

            end;

            with dxSpreadSheet.ActiveSheetAsTable.CreateCell(X,6) do
            begin

              Style.Brush.BackgroundColor := varCor1;
              AsVariant := FDQueryVSOP_ClienteFamiliaBySalesRepTSOP_ORDBILITEFAM.AsString;

            end;

            with dxSpreadSheet.ActiveSheetAsTable.CreateCell(X,7) do
            begin

              Style.Brush.BackgroundColor := varCor1;
              AsVariant := FDQueryVSOP_ClienteFamiliaBySalesRepTSOP_ORDBILREG.AsString;

            end;

            with dxSpreadSheet.ActiveSheetAsTable.CreateCell(X,8) do
            begin

              Style.Brush.BackgroundColor := varCor1;
              AsVariant := FDQueryVSOP_ClienteFamiliaBySalesRepTSOP_ORDBILREGEST.AsString;

            end;

            varData := System.DateUtils.StartOfTheMonth(IncMonth(Now,-12));
            for I := 9 to 32 do
            begin

              varData := System.DateUtils.StartOfTheMonth(System.DateUtils.EndOfTheMonth(varData)+1);

              if varLastGrupoCliente <> FDQueryVSOP_ClienteFamiliaBySalesRepTSOP_ORDBILGRUCLINOM.AsString then
                if varCor1 = RGB(255,255,204) then
                  varCor2 := RGB(255,255,225)
                else
                  varCor2 := RGB(216,234,204);

              with dxSpreadSheet.ActiveSheetAsTable.CreateCell(X,I) do
              begin

                Style.Brush.BackgroundColor := varCor2;
                Style.DataFormat.FormatCode := '#,##0.00';


                if I < 20 then
                begin

                  if FDQueryVSOP_ClienteFamiliaBySalesRepBilling.Locate( 'TSOP_ORDBILSITNOM;TSOP_ORDBILITEFAM;TSOP_ORDBILCLICOD;TSOP_BUDDAT', VarArrayOf([FDQueryVSOP_ClienteFamiliaBySalesRepTSOP_ORDBILSITNOM.AsString,FDQueryVSOP_ClienteFamiliaBySalesRepTSOP_ORDBILITEFAM.AsString,FDQueryVSOP_ClienteFamiliaBySalesRepTSOP_ORDBILCLICOD.AsString,varData]) ) then
                    AsVariant := FDQueryVSOP_ClienteFamiliaBySalesRepBillingTSOP_BUDVLF.AsFloat
                  else
                    AsVariant := 0.00;

                end
                else
                begin

                  if FDQueryVSOP_ClienteFamiliaBySalesRepBudget.Locate( 'TSOP_ORDBILSITNOM;TSOP_ORDBILITEFAM;TSOP_ORDBILCLICOD;TSOP_BUDDAT', VarArrayOf([FDQueryVSOP_ClienteFamiliaBySalesRepTSOP_ORDBILSITNOM.AsString,FDQueryVSOP_ClienteFamiliaBySalesRepTSOP_ORDBILITEFAM.AsString,FDQueryVSOP_ClienteFamiliaBySalesRepTSOP_ORDBILCLICOD.AsString,varData]) ) then
                    AsVariant := FDQueryVSOP_ClienteFamiliaBySalesRepBudgetTSOP_BUDVLF.AsFloat
                  else
                    AsVariant := 0.00;

                end;

              end;

            end;

            varLastGrupoCliente := FDQueryVSOP_ClienteFamiliaBySalesRepTSOP_ORDBILGRUCLINOM.AsString;

            FDQueryVSOP_ClienteFamiliaBySalesRep.Next;
            Inc(X);
            Application.ProcessMessages;

          end;

        finally

          FDQueryVSOP_ClienteFamiliaBySalesRepBudget.Close;
          FDQueryVSOP_ClienteFamiliaBySalesRep.Close;

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

procedure TFr_UploadForecast.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  Mensagem( 'Abrindo Conexão...' );
  FDConnection.Open;

  Mensagem( 'Gravando periodo...' );
  FDQueryTSOP_PeriodoImportacao.Close;
  FDQueryTSOP_PeriodoImportacao.Open;

  if (FDQueryTSOP_PeriodoImportacao.FieldByName('TSOP_PERIMPINI').AsInteger <> StrToIntDef(cxTextEditIni.Text,0)) or
  (FDQueryTSOP_PeriodoImportacao.FieldByName('TSOP_PERIMPFIN').AsInteger <> StrToIntdef(cxTextEditFim.Text,0)) then
  begin

    FDQueryTSOP_PeriodoImportacao.Edit;
    FDQueryTSOP_PeriodoImportacao.FieldByName('TSOP_PERIMPINI').AsString := cxTextEditIni.Text;
    FDQueryTSOP_PeriodoImportacao.FieldByName('TSOP_PERIMPFIN').AsString := cxTextEditFim.Text;
    FDQueryTSOP_PeriodoImportacao.FieldByName('TSOP_PERIMPDATCAD').AsDateTime := Now;
    FDQueryTSOP_PeriodoImportacao.FieldByName('TSOP_USUCOD').AsInteger := Fr_Brady.TSIS_USUCOD;
    FDQueryTSOP_PeriodoImportacao.Post;

  end;

  Mensagem( '' );

  Fr_UploadForecast := nil;
  Action := caFree;

end;

procedure TFr_UploadForecast.FormCreate(Sender: TObject);
begin

  if Fr_Brady.SalesRep then
  begin

    cxComboBoxTipo.Visible := False;
    cxLabelTipo.Visible := False;

    cxLabelIni.Visible := False;
    cxLabelAte.Visible := False;
    cxTextEditIni.Visible := False;
    cxTextEditFim.Visible := False;

  end;

  if Fr_Brady.TSIS_USUNOM.ToUpper.Equals('LUIZ FIGUEIREDO') or
    // Fr_Brady.TSIS_USUNOM.ToUpper.Equals('VANESSA MENDES') or
     Fr_Brady.TSIS_USUNOM.ToUpper.Equals('JEFFERSON FREITAS') or
    // Fr_Brady.TSIS_USUNOM.ToUpper.Equals('MARCEL ALBUQUERQUE') or
     Fr_Brady.TSIS_USUNOM.ToUpper.Equals('SAULO RAMOS') then
  begin

    cxRadioGroupOpcao.ItemIndex := 1;

  end;

  FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );

  Mensagem( 'Abrindo Conexão...' );
  FDConnection.Open;

  Mensagem( 'Verificando periodo...' );
  FDQueryTSOP_PeriodoImportacao.Close;
  FDQueryTSOP_PeriodoImportacao.Open;

  cxTextEditIni.Text := FDQueryTSOP_PeriodoImportacao.FieldByName('TSOP_PERIMPINI').AsString;
  cxTextEditFim.Text := FDQueryTSOP_PeriodoImportacao.FieldByName('TSOP_PERIMPFIN').AsString;

  FDConnection.Close;

  Mensagem( '' );

end;

function TFr_UploadForecast.getTSOP_BUDTIP: string;
begin

(*

Sales Forecast
Likely
Gross Margin

*)

  Result := 'SF';
  if cxComboBoxTipo.ItemIndex = 0 then
    Result := 'SF'
  else
  if cxComboBoxTipo.ItemIndex = 1 then
    Result := 'LK'
  else
  if cxComboBoxTipo.ItemIndex = 2 then
    Result := 'GM';

end;

procedure TFr_UploadForecast.ImportarForecast;
var
  I, X: Integer;
  dxSpreadSheet: TdxSpreadSheet;
  varData: TDateTime;
  varDataReferencia: TDateTime;
  varMesAno: String;
  varMes, varAno: Integer;
  varLocate: Boolean;
  varSite, varFamilia, varCliente: String;
  varForecast: Extended;
  varCurrentMonth: Integer;

begin

  Mensagem( 'Iniciando processo de importação...' );
  try

    dxSpreadSheet := TdxSpreadSheet.Create(nil);
    try

      Mensagem( 'Carregando planilha...' );
      dxSpreadSheet.LoadFromFile( cxButtonEditPath.Text );
      dxSpreadSheet.BeginUpdate;

      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );

      Mensagem( 'Abrindo Conexão...' );
      FDConnection.Open;
      try

        for varCurrentMonth := 1 to 12 do
        begin

          varDataReferencia := IncMonth(System.DateUtils.StartOfTheMonth(Now),varCurrentMonth-1);

          if Fr_Brady.SalesRep then
            FDQueryTSOP_Budget.MacroByName( 'WHERE1' ).AsRaw := ' AND A02.TSOP_ORDBILREPNOM = ' + QuotedStr(Fr_Brady.TSIS_USUNOM);

          FDQueryTSOP_Budget.ParamByName( 'TSOP_BUDDATREF' ).AsDateTime := varDataReferencia;
          FDQueryTSOP_Budget.ParamByName( 'TSOP_BUDTIP' ).AsString := getTSOP_BUDTIP;
          FDQueryTSOP_Budget.Open;
          try

            Mensagem( 'Lendo linhas da planilha...' );
            Application.ProcessMessages;
            Sleep(1000);
            Application.ProcessMessages;
            Mensagem( 'Total de linhas: ' + IntToStr(dxSpreadSheet.ActiveSheetAsTable.Rows.LastIndex) );
            Application.ProcessMessages;
            Sleep(5000);
            Application.ProcessMessages;

            for X := dxSpreadSheet.ActiveSheetAsTable.Rows.FirstIndex+1 to dxSpreadSheet.ActiveSheetAsTable.Rows.LastIndex do
            begin

              try
                Try
                   if  Assigned(dxSpreadSheet.ActiveSheetAsTable.Rows[X].Cells[0]) then
                   begin
                     if ((dxSpreadSheet.ActiveSheetAsTable.Rows[X].CellCount = 0) or
                         (Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[X].Cells[0].AsString) = EmptyStr)) then
                      Continue;
                   end
                   else Continue;

                except
                   on E: Exception do
                        begin
                          ShowMessage(E.Message + ' - Eliminar linhas em branco o final do Arquivo Excel.');
                        end;
                End;

                Mensagem( 'Mês ( ' + IntToStr(varCurrentMonth) + '/12 )' + 'Linha (" ' + IntToStr(X) + '/' + IntToStr(dxSpreadSheet.ActiveSheetAsTable.Rows.LastIndex) + '") "' + Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[X].Cells[2].AsString) + '" ...' );

                for I := 19 to 32 do
                begin

                  if (cxRadioGroupOpcao.ItemIndex = 0) and (I > 30) then
                    Continue;

                  if (cxRadioGroupOpcao.ItemIndex <> 0) and (I < 21) then
                    Continue;

                  varMes := -1;
                  varMesAno := dxSpreadSheet.ActiveSheetAsTable.Rows[0].Cells[I].AsString;
                  if varMesAno.Split(['-'])[0].Trim.ToUpper.Equals('JAN') or varMesAno.Split(['-'])[0].Trim.ToUpper.Equals('JAN') then
                    varMes := 01
                  else
                  if varMesAno.Split(['-'])[0].Trim.ToUpper.Equals('FEV') or varMesAno.Split(['-'])[0].Trim.ToUpper.Equals('FEB') then
                    varMes := 02
                  else
                  if varMesAno.Split(['-'])[0].Trim.ToUpper.Equals('MAR') or varMesAno.Split(['-'])[0].Trim.ToUpper.Equals('MAR') then
                    varMes := 03
                  else
                  if varMesAno.Split(['-'])[0].Trim.ToUpper.Equals('ABR') or varMesAno.Split(['-'])[0].Trim.ToUpper.Equals('APR') then
                    varMes := 04
                  else
                  if varMesAno.Split(['-'])[0].Trim.ToUpper.Equals('MAI') or varMesAno.Split(['-'])[0].Trim.ToUpper.Equals('MAY') then
                    varMes := 05
                  else
                  if varMesAno.Split(['-'])[0].Trim.ToUpper.Equals('JUN') or varMesAno.Split(['-'])[0].Trim.ToUpper.Equals('JUN') then
                    varMes := 06
                  else
                  if varMesAno.Split(['-'])[0].Trim.ToUpper.Equals('JUL') or varMesAno.Split(['-'])[0].Trim.ToUpper.Equals('JUL') then
                    varMes := 07
                  else
                  if varMesAno.Split(['-'])[0].Trim.ToUpper.Equals('AGO') or varMesAno.Split(['-'])[0].Trim.ToUpper.Equals('AUG') then
                    varMes := 08
                  else
                  if varMesAno.Split(['-'])[0].Trim.ToUpper.Equals('SET') or varMesAno.Split(['-'])[0].Trim.ToUpper.Equals('SEP') then
                    varMes := 09
                  else
                  if varMesAno.Split(['-'])[0].Trim.ToUpper.Equals('OUT') or varMesAno.Split(['-'])[0].Trim.ToUpper.Equals('OCT') then
                    varMes := 10
                  else
                  if varMesAno.Split(['-'])[0].Trim.ToUpper.Equals('NOV') or varMesAno.Split(['-'])[0].Trim.ToUpper.Equals('NOV') then
                    varMes := 11
                  else
                  if varMesAno.Split(['-'])[0].Trim.ToUpper.Equals('DEZ') or varMesAno.Split(['-'])[0].Trim.ToUpper.Equals('DEC') then
                    varMes := 12;

                  varAno := StrToInt(varMesAno.Split(['-'])[1].Trim);
                  varData := EncodeDate( varAno, varMes, 01 );
                  varForecast := dxSpreadSheet.ActiveSheetAsTable.Rows[X].Cells[I].AsFloat;
                  varCliente := dxSpreadSheet.ActiveSheetAsTable.Rows[X].Cells[3].AsString;
                  varSite := dxSpreadSheet.ActiveSheetAsTable.Rows[X].Cells[2].AsString;
                  varFamilia := EmptyStr;

                  varLocate := False;
                  if cxRadioGroupOpcao.ItemIndex = 0 then
                  begin

                    varLocate := FDQueryTSOP_Budget.Locate( 'TSOP_ORDBILSITNOM;TSOP_BUDCLICOD;TSOP_BUDDAT', VarArrayOf( [varSite,varCliente,varData] ) );

                  end
                  else
                  begin

                    varFamilia := dxSpreadSheet.ActiveSheetAsTable.Rows[X].Cells[6].AsString;
                    varLocate := FDQueryTSOP_Budget.Locate( 'TSOP_ORDBILSITNOM;TSOP_BUDCLICOD;TSOP_BUDFAM;TSOP_BUDDAT', VarArrayOf( [varSite,varCliente,varFamilia,varData] ) );

                  end;

                  if varForecast < 0.00 then
                    varForecast := 0.00;

                  if varLocate then
                  begin

                    FDQueryTSOP_Budget.Edit;
                    FDQueryTSOP_BudgetTSOP_BUDVLF.AsFloat := varForecast;
                    FDQueryTSOP_BudgetTSOP_USUCOD.AsInteger := Fr_Brady.TSIS_USUCOD;
                    FDQueryTSOP_BudgetTSOP_BUDDATCAD.AsDateTime := Now;

                    try
                      FDQueryTSOP_Budget.Post;
                    except
                      on E: Exception do
                      begin
                        FDQueryTSOP_Budget.Cancel;
                        ShowMessage(E.Message);
                      end;
                    end;

                  end
                  else
                  begin

                    if varForecast > 0.00 then
                    begin

                      FDQueryTSOP_Budget.Append;

                      FDQueryTSOP_BudgetTSOP_BUDTIP.AsString := getTSOP_BUDTIP;
                      FDQueryTSOP_BudgetTSOP_BUDDATREF.AsDateTime := varDataReferencia;
                      FDQueryTSOP_BudgetTSOP_BUDDAT.AsDateTime := varData;
                      FDQueryTSOP_BudgetTSOP_BUDCLICOD.AsString := varCliente;
                      FDQueryTSOP_BudgetTSOP_BUDVLF.AsFloat := varForecast;

                      if cxRadioGroupOpcao.ItemIndex = 0 then
                        FDQueryTSOP_BudgetTSOP_BUDFAM.Clear
                      else
                        FDQueryTSOP_BudgetTSOP_BUDFAM.AsString := varFamilia;

                      FDQueryTSOP_BudgetTSOP_ORDBILSITNOM.AsString := varSite;

                      FDQueryTSOP_BudgetTSOP_USUCOD.AsInteger := Fr_Brady.TSIS_USUCOD;
                      FDQueryTSOP_BudgetTSOP_BUDDATCAD.AsDateTime := Now;

                      try
                        FDQueryTSOP_Budget.Post;
                      except
                        on E: Exception do
                        begin
                          FDQueryTSOP_Budget.Cancel;
                          ShowMessage(E.Message);
                        end;
                      end;

                    end;

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

            FDQueryTSOP_Budget.Close;

          end;

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

procedure TFr_UploadForecast.Mensagem(pMensagem: String);
begin

  cxLabelMensagem.Caption := pMensagem;
  PanelSQLSplashScreen.Visible := not pMensagem.IsEmpty;
  Update;
  Application.ProcessMessages;

end;

end.
