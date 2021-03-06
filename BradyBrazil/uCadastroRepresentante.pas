unit uCadastroRepresentante;

interface

uses
  System.IOUtils,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxCheckBox,
  cxContainer, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxLabel, dxGDIPlusClasses, Vcl.ExtCtrls, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, dxSkinOffice2013White,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue;

type
  TFr_CadastroRepresentante = class(TForm)
    cxGridRepresentante: TcxGrid;
    cxGridLevelRepresentante: TcxGridLevel;
    cxTableViewRepresentante: TcxGridDBTableView;
    DataSourceTSOP_Representante: TDataSource;
    FDConnection: TFDConnection;
    FDQueryTSOP_Representante: TFDQuery;
    PanelSQLSplashScreen: TPanel;
    ImageSQLSplashScreen: TImage;
    cxLabelMensagem: TcxLabel;
    FDQueryTSOP_RepresentanteTSOP_REPCOD: TFDAutoIncField;
    FDQueryTSOP_RepresentanteTSOP_ORICOD: TIntegerField;
    FDQueryTSOP_RepresentanteTSOP_USUCODCAD: TIntegerField;
    FDQueryTSOP_RepresentanteTSOP_REPDATCAD: TSQLTimeStampField;
    FDQueryTSOP_RepresentanteTSOP_USUCODALT: TIntegerField;
    FDQueryTSOP_RepresentanteTSOP_REPDATALT: TSQLTimeStampField;
    cxTableViewRepresentanteTSOP_REPCOD: TcxGridDBColumn;
    FDQueryTSOP_RepresentanteTSOP_REPATUIMP: TStringField;
    FDQueryTSOP_RepresentanteTSOP_REPNOM: TStringField;
    cxTableViewRepresentanteTSOP_REPNOM: TcxGridDBColumn;
    cxTableViewRepresentanteTSOP_REPATUIMP: TcxGridDBColumn;
    FDQueryTSOP_RepresentanteTSOP_REPCLICOD: TStringField;
    FDQueryTSOP_RepresentanteTSOP_REPNOMINT: TStringField;
    FDQueryTSOP_RepresentanteTSOP_REPACCTYP: TStringField;
    cxTableViewRepresentanteTSOP_REPCLICOD: TcxGridDBColumn;
    cxTableViewRepresentanteTSOP_REPNOMINT: TcxGridDBColumn;
    cxTableViewRepresentanteTSOP_REPACCTYP: TcxGridDBColumn;
    FDQueryTSOP_RepresentanteTSOP_REPCSR: TStringField;
    cxTableViewRepresentanteTSOP_REPCSR: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FDQueryTSOP_RepresentanteNewRecord(DataSet: TDataSet);
    procedure FDQueryTSOP_RepresentanteAfterEdit(DataSet: TDataSet);
  private
    procedure Mensagem( pMensagem: String );
    { Private declarations }
  public
    procedure AbrirDataset;
    procedure LoadGridCustomization;
    { Public declarations }
  end;

var
  Fr_CadastroRepresentante: TFr_CadastroRepresentante;

implementation

{$R *.dfm}

uses uUtils, uBrady;

procedure TFr_CadastroRepresentante.AbrirDataset;
begin

  if not FDConnection.Connected then
  begin

    Mensagem( 'Abrindo conex�o...' );
    try

      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );
      FDConnection.Open;

      Mensagem( 'Obtendo dados (Representante)...' );
      FDQueryTSOP_Representante.Open;

    finally

      Mensagem( EmptyStr );

    end;

  end;

end;

procedure TFr_CadastroRepresentante.FDQueryTSOP_RepresentanteAfterEdit(DataSet: TDataSet);
begin

  FDQueryTSOP_RepresentanteTSOP_ORICOD.AsInteger := 1;
  FDQueryTSOP_RepresentanteTSOP_USUCODALT.AsInteger := 1;
  FDQueryTSOP_RepresentanteTSOP_REPDATALT.AsDateTime := Now;

end;

procedure TFr_CadastroRepresentante.FDQueryTSOP_RepresentanteNewRecord(DataSet: TDataSet);
begin

  FDQueryTSOP_RepresentanteTSOP_ORICOD.AsInteger := 1;
  FDQueryTSOP_RepresentanteTSOP_REPATUIMP.AsString := 'S';
  FDQueryTSOP_RepresentanteTSOP_USUCODCAD.AsInteger := 1;
  FDQueryTSOP_RepresentanteTSOP_USUCODALT.AsInteger := 1;
  FDQueryTSOP_RepresentanteTSOP_REPDATCAD.AsDateTime := Now;
  FDQueryTSOP_RepresentanteTSOP_REPDATALT.AsDateTime := Now;

end;

procedure TFr_CadastroRepresentante.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  FDQueryTSOP_Representante.Close;
  FDConnection.Close;

  Fr_CadastroRepresentante := nil;
  Action := caFree;

end;

procedure TFr_CadastroRepresentante.FormContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
begin

  Fr_Brady.PopupGridTools( cxGridRepresentante.ActiveView );

end;

procedure TFr_CadastroRepresentante.FormCreate(Sender: TObject);
begin

  LoadGridCustomization;

end;

procedure TFr_CadastroRepresentante.LoadGridCustomization;
begin

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxTableViewRepresentante.Name + '.ini' ) then
    cxTableViewRepresentante.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxTableViewRepresentante.Name + '.ini' );

end;

procedure TFr_CadastroRepresentante.Mensagem(pMensagem: String);
begin

  cxLabelMensagem.Caption := pMensagem;
  PanelSQLSplashScreen.Visible := not pMensagem.IsEmpty;
  Update;
  Application.ProcessMessages;

end;

end.
