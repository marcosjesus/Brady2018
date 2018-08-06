unit uUploadTaxasHoras;

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
  TFr_UploadTaxasHoras = class(TForm)
    FDConnection: TFDConnection;
    cxPageControlPivot: TcxPageControl;
    cxTabSheetPivot00: TcxTabSheet;
    OpenDialog: TOpenDialog;
    cxLabel1: TcxLabel;
    cxButtonEditPath: TcxButtonEdit;
    cxButtonProcessar: TcxButton;
    PanelSQLSplashScreen: TPanel;
    ImageSQLSplashScreen: TImage;
    cxLabelMensagem: TcxLabel;
    FDQueryTSOP_GMHoras: TFDQuery;
    cxLabel2: TcxLabel;
    FDQueryTSOP_GMHorasTSOP_GMHCOD: TFDAutoIncField;
    FDQueryTSOP_GMHorasTSOP_GMHSIT: TStringField;
    FDQueryTSOP_GMHorasTSOP_GMHCCU: TStringField;
    FDQueryTSOP_GMHorasTSOP_GMHSUP: TBCDField;
    FDQueryTSOP_GMHorasTSOP_GMHMAQ: TBCDField;
    FDQueryTSOP_GMHorasTSOP_GMHLAB: TBCDField;
    FDQueryTSOP_GMHorasTSOP_GMHOVE: TBCDField;
    FDQueryTSOP_GMHorasTSOP_GMHDAT: TSQLTimeStampField;
    FDQueryTSOP_GMHorasTSOP_GMHBUD: TStringField;
    procedure cxButtonProcessarClick(Sender: TObject);
    procedure cxButtonEditPathClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure ImportarHoras;
    procedure Mensagem(pMensagem: String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fr_UploadTaxasHoras: TFr_UploadTaxasHoras;

implementation

{$R *.dfm}

uses uBrady, uUtils;



procedure TFr_UploadTaxasHoras.cxButtonEditPathClick(Sender: TObject);
begin

  if OpenDialog.Execute(Handle) then
  begin
    cxButtonEditPath.Text := OpenDialog.FileName;
  end;

end;

procedure TFr_UploadTaxasHoras.cxButtonProcessarClick(Sender: TObject);
begin

  if cxButtonEditPath.Text = EmptyStr then
    raise Exception.Create('Informe o arquivo primeiro.');

  ImportarHoras;

end;

procedure TFr_UploadTaxasHoras.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  Fr_UploadTaxasHoras := nil;
  Action := caFree;

end;

procedure TFr_UploadTaxasHoras.ImportarHoras;
var
  I, X: Integer;
  dxSpreadSheet: TdxSpreadSheet;
  varMes, varAno: Integer;
  varData: TDateTime;
  varPlanta, varBudget, varCentro: String;
  varSetup, varMachine, varLabor, varOverhead: Extended;

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

        FDQueryTSOP_GMHoras.Open;
        try

          Mensagem( 'Lendo linhas da planilha...' );
          for X := dxSpreadSheet.ActiveSheetAsTable.Rows.FirstIndex+1 to dxSpreadSheet.ActiveSheetAsTable.Rows.LastIndex do
          begin

            try

              if dxSpreadSheet.ActiveSheetAsTable.Rows[X].CellCount = 0 then
                Continue;

              if dxSpreadSheet.ActiveSheetAsTable.Rows[X].CellCount < 9 then
                Continue;

              Mensagem( 'Linha (" ' + IntToStr(X) + '/' + IntToStr(dxSpreadSheet.ActiveSheetAsTable.Rows.LastIndex) + '") "' + Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[X].Cells[2].AsString) + '" ...' );

              if Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[X].Cells[0].AsString) = EmptyStr then
                Continue;

            except

              Continue;

            end;

            varAno := dxSpreadSheet.ActiveSheetAsTable.Rows[X].Cells[0].AsInteger;
            varMes := dxSpreadSheet.ActiveSheetAsTable.Rows[X].Cells[1].AsInteger;
            varData := EncodeDate( varAno, varMes, 01 );
            varBudget := dxSpreadSheet.ActiveSheetAsTable.Rows[X].Cells[2].AsString;
            varPlanta := dxSpreadSheet.ActiveSheetAsTable.Rows[X].Cells[3].AsString;
            varCentro := dxSpreadSheet.ActiveSheetAsTable.Rows[X].Cells[4].AsString;
            varSetup := dxSpreadSheet.ActiveSheetAsTable.Rows[X].Cells[5].AsFloat;
            varMachine := dxSpreadSheet.ActiveSheetAsTable.Rows[X].Cells[6].AsFloat;
            varLabor := dxSpreadSheet.ActiveSheetAsTable.Rows[X].Cells[7].AsFloat;
            varOverhead := dxSpreadSheet.ActiveSheetAsTable.Rows[X].Cells[8].AsFloat;

            if FDQueryTSOP_GMHoras.Locate( 'TSOP_GMHDAT;TSOP_GMHBUD;TSOP_GMHSIT;TSOP_GMHCCU', VarArrayOf( [varData,varBudget,varPlanta,varCentro] ) ) then
            begin

              if (varSetup+varMachine+varLabor+varOverhead) > 0.00 then
              begin

                FDQueryTSOP_GMHoras.Edit;
                FDQueryTSOP_GMHorasTSOP_GMHSUP.AsFloat := varSetup;
                FDQueryTSOP_GMHorasTSOP_GMHMAQ.AsFloat := varMachine;
                FDQueryTSOP_GMHorasTSOP_GMHLAB.AsFloat := varLabor;
                FDQueryTSOP_GMHorasTSOP_GMHOVE.AsFloat := varOverhead;

                try
                  FDQueryTSOP_GMHoras.Post;
                except
                  FDQueryTSOP_GMHoras.Cancel;
                end;

              end
              else
              begin

                try
                  FDQueryTSOP_GMHoras.Delete;
                except
                end;

              end;

            end
            else
            begin

              if (varSetup+varMachine+varLabor+varOverhead) > 0.00 then
              begin

                FDQueryTSOP_GMHoras.Append;

                FDQueryTSOP_GMHorasTSOP_GMHSIT.AsString := varPlanta;
                FDQueryTSOP_GMHorasTSOP_GMHBUD.AsString := varBudget;
                FDQueryTSOP_GMHorasTSOP_GMHCCU.AsString := varCentro;
                FDQueryTSOP_GMHorasTSOP_GMHDAT.AsDateTime := varData;

                FDQueryTSOP_GMHorasTSOP_GMHSUP.AsFloat := varSetup;
                FDQueryTSOP_GMHorasTSOP_GMHMAQ.AsFloat := varMachine;
                FDQueryTSOP_GMHorasTSOP_GMHLAB.AsFloat := varLabor;
                FDQueryTSOP_GMHorasTSOP_GMHOVE.AsFloat := varOverhead;

                try
                  FDQueryTSOP_GMHoras.Post;
                except
                  FDQueryTSOP_GMHoras.Cancel;
                end;

              end;

            end;

            Application.ProcessMessages;

          end;

        finally

          FDQueryTSOP_GMHoras.Close;

        end;

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

procedure TFr_UploadTaxasHoras.Mensagem(pMensagem: String);
begin

  cxLabelMensagem.Caption := pMensagem;
  PanelSQLSplashScreen.Visible := not pMensagem.IsEmpty;
  Update;
  Application.ProcessMessages;

end;

end.
