unit uUploadCustosEstoque;

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
  dxGDIPlusClasses, Vcl.ExtCtrls;

type
  TFr_UploadCustosEstoque = class(TForm)
    cxPageControlPivot: TcxPageControl;
    cxTabSheetPivot00: TcxTabSheet;
    PanelSQLSplashScreen: TPanel;
    ImageSQLSplashScreen: TImage;
    cxLabelMensagem: TcxLabel;
    cxButtonProcessar: TcxButton;
    cxLabel1: TcxLabel;
    FDConnection: TFDConnection;
    FDQueryTSOP_GMCustos: TFDQuery;
    FDQueryTSOP_GMCustosTSOP_GMCCOD: TFDAutoIncField;
    FDQueryTSOP_GMCustosTSOP_GMCITE: TStringField;
    FDQueryTSOP_GMCustosTSOP_GMCSIT: TStringField;
    FDQueryTSOP_GMCustosTSOP_GMCLOT: TBCDField;
    FDQueryTSOP_GMCustosTSOP_GMCDAT: TSQLTimeStampField;
    FDQueryTSOP_GMCustosTSOP_GMCCUS: TBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButtonProcessarClick(Sender: TObject);
  private
    procedure ImportarCustos;
    procedure Mensagem(pMensagem: String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fr_UploadCustosEstoque: TFr_UploadCustosEstoque;

implementation

{$R *.dfm}

uses uBrady, uUtils;


procedure TFr_UploadCustosEstoque.cxButtonProcessarClick(Sender: TObject);
begin

  ImportarCustos;

end;

procedure TFr_UploadCustosEstoque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  Fr_UploadCustosEstoque := nil;
  Action := caFree;

end;


procedure TFr_UploadCustosEstoque.ImportarCustos;
var
  X, I: Integer;
  varArquivo: TStringList;
  varMes, varAno: Integer;
  varData: TDateTime;
  varPlanta, varItem: String;
  varCusto, varLote: Extended;

begin

  Mensagem( 'Iniciando processo de importação...' );
  try

    varArquivo := TStringList.Create;
    try

      Mensagem( 'Carregando planilha...' );
      varArquivo.LoadFromFile( '\\GHOS2024\Brady\Files\ENG\BR-GM-001.TXT' );

      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );

      Mensagem( 'Abrindo Conexão...' );
      FDConnection.Open;
      try

        FDQueryTSOP_GMCustos.Open;
        try

          I := 0;

          Mensagem( 'Lendo linhas da planilha...' );
          for X := 0 to varArquivo.Count-1 do
          begin

            if not (varArquivo[X].CountChar('|') = 8) then
              Continue;

            if Frac(X / 100) = 0 then
              Mensagem( 'Linha (" ' + IntToStr(X) + '/' + IntToStr(varArquivo.Count-1) + '") "' + Trim(varArquivo[X].Split(['|'])[1]) + '" ...' );

            varAno := StrToInt(varArquivo[X].Split(['|'])[5].Trim);
            varMes := StrToInt(varArquivo[X].Split(['|'])[6].Trim);
            varData := EncodeDate( varAno, varMes, 01 );
            varPlanta := varArquivo[X].Split(['|'])[2].Trim;
            varItem := varArquivo[X].Split(['|'])[1].Trim;
            varCusto := StrToFloat(varArquivo[X].Split(['|'])[07].Trim.Replace( ',', '', [rfReplaceAll] ).Replace( '.', FormatSettings.DecimalSeparator, [rfReplaceAll] ));
            varLote := StrToFloat(varArquivo[X].Split(['|'])[03].Trim.Replace( ',', '', [rfReplaceAll] ).Replace( '.', FormatSettings.DecimalSeparator, [rfReplaceAll] ));

            if FDQueryTSOP_GMCustos.Locate( 'TSOP_GMCDAT;TSOP_GMCSIT;TSOP_GMCITE', VarArrayOf( [varData,varPlanta,varItem] ) ) then
            begin

              FDQueryTSOP_GMCustos.Edit;
              FDQueryTSOP_GMCustosTSOP_GMCCUS.AsFloat := varCusto;
              FDQueryTSOP_GMCustosTSOP_GMCLOT.AsFloat := varLote;
              FDQueryTSOP_GMCustos.Post;

            end
            else
            begin

              FDQueryTSOP_GMCustos.Append;

              FDQueryTSOP_GMCustosTSOP_GMCSIT.AsString := varPlanta;
              FDQueryTSOP_GMCustosTSOP_GMCITE.AsString := varItem;
              FDQueryTSOP_GMCustosTSOP_GMCDAT.AsDateTime := varData;

              FDQueryTSOP_GMCustosTSOP_GMCCUS.AsFloat := varCusto;
              FDQueryTSOP_GMCustosTSOP_GMCLOT.AsFloat := varLote;

              FDQueryTSOP_GMCustos.Post;

            end;

          end;

        finally

          try

            Mensagem( 'ApplyUpdates' );
            FDQueryTSOP_GMCustos.ApplyUpdates;

            Mensagem( 'CommitUpdates' );
            FDQueryTSOP_GMCustos.CommitUpdates;

          except

            on E: Exception do
            begin

              Mensagem( 'CommitUpdates'#13#10 + E.Message );
              raise;

            end;

          end;

          FDQueryTSOP_GMCustos.Close;

        end;

      finally

        FDConnection.Close;

      end;

    finally

      FreeAndNil(varArquivo);

    end;

  finally

    Mensagem( EmptyStr );

  end;

end;

procedure TFr_UploadCustosEstoque.Mensagem(pMensagem: String);
begin

  cxLabelMensagem.Caption := pMensagem;
  PanelSQLSplashScreen.Visible := not pMensagem.IsEmpty;
  Update;
  Application.ProcessMessages;

end;

end.
