unit uRelTreinamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FGrid, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, cxControls,
  dxSkinsdxStatusBarPainter, Data.FMTBcd, Datasnap.DBClient, Datasnap.Provider,
  Vcl.ExtCtrls, Data.DB, Data.SqlExpr, dxStatusBar, Vcl.StdCtrls, cxButtons,
  Vcl.ToolWin, Vcl.ComCtrls, Vcl.Imaging.jpeg, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxGroupBox, cxRadioGroup, Vcl.Mask, rsEdit, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxPSGlbl, dxPSUtl, dxPSEngn,
  dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxSkinsdxBarPainter, dxSkinsdxRibbonPainter,
  dxPSCore, dxPScxCommon, MensFun, cxGridExportLink, EditBusca, SetParametro,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmRelTreinamento = class(TFrmGrid)
    cxFiltro: TcxGroupBox;
    Panel1: TPanel;
    spbLimpaTreinamento: TcxButton;
    Panel11: TPanel;
    rgObrigacao: TcxRadioGroup;
    Panel10: TPanel;
    editxtPeriodicidade: TrsSuperEdit;
    spbLimpaPeriodicidade: TcxButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dxComponentPrinter: TdxComponentPrinter;
    SaveDialog: TSaveDialog;
    ButExcel: TcxButton;
    cdsGridCUR_NOMCURSO: TStringField;
    cdsGridTRE_DTREALIZACAO: TSQLTimeStampField;
    cdsGridTRE_DTTERMINO: TSQLTimeStampField;
    cdsGridDESCRICAO: TStringField;
    cdsGridTRE_OBRIGATORIO: TStringField;
    cxGrid1DBTableView1CUR_NOMCURSO: TcxGridDBColumn;
    cxGrid1DBTableView1TRE_DTREALIZACAO: TcxGridDBColumn;
    cxGrid1DBTableView1TRE_DTTERMINO: TcxGridDBColumn;
    cxGrid1DBTableView1DESCRICAO: TcxGridDBColumn;
    cxGrid1DBTableView1TRE_OBRIGATORIO: TcxGridDBColumn;
    dxPrinterGrid: TdxGridReportLink;
    EditBuscaTreinamento: TEditBusca;
    EditBuscaPeriodo: TEditBusca;
    QGridCUR_NOMCURSO: TStringField;
    QGridTRE_DTREALIZACAO: TSQLTimeStampField;
    QGridTRE_DTTERMINO: TSQLTimeStampField;
    QGridDESCRICAO: TStringField;
    QGridTRE_OBRIGATORIO: TStringField;
    QGridINS_NOMINSTRUTOR: TStringField;
    cxGrid1DBTableView1INS_NOMINSTRUTOR: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbLimpaPeriodicidadeClick(Sender: TObject);
    procedure spbLimpaTreinamentoClick(Sender: TObject);
    procedure ButPesquisarClick(Sender: TObject);
    procedure ButImprimirClick(Sender: TObject);
    procedure ButExcelClick(Sender: TObject);
    procedure ButEscapeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelTreinamento: TFrmRelTreinamento;

implementation

{$R *.dfm}

uses DBConect;

procedure TFrmRelTreinamento.ButEscapeClick(Sender: TObject);
begin
  inherited;
  spbLimpaTreinamentoClick(Self);
  spbLimpaPeriodicidadeClick(Self);
  cdsGrid.Close;
end;

procedure TFrmRelTreinamento.ButExcelClick(Sender: TObject);
begin
  inherited;
  if QGrid.IsEmpty then
  begin
      Mens_MensInf('N�o h� dados para serem exportados ao Excel.') ;
      Exit;
  end;


  SaveDialog.InitialDir := GetCurrentDir;

  if SaveDialog.Execute then
     ExportGridToExcel(SaveDialog.FileName, cxGrid1, True, True);

end;

procedure TFrmRelTreinamento.ButImprimirClick(Sender: TObject);
begin
  inherited;
  if QGrid.IsEmpty then
  begin
      Mens_MensInf('N�o h� dados para serem visualizados.') ;
      Exit;
  end;

  dxPrinterGrid.Preview;
end;

procedure TFrmRelTreinamento.ButPesquisarClick(Sender: TObject);
Var
 Parametros : String;
begin
  inherited;


    Parametros := EmptyStr;

    QGrid.Close ;

    QGrid.Sql.Clear;

    QGrid.Sql.Add(' Select  T.CUR_NOMCURSO, T.TRE_DTREALIZACAO, ');
    QGrid.Sql.Add(' T.TRE_DTTERMINO, PR.DESCRICAO, T.TRE_OBRIGATORIO, I.INS_NOMINSTRUTOR ');
    QGrid.Sql.Add(' from TRE_TREINAMENTO  T   ');
    QGrid.Sql.Add(' left outer join TRE_PERIODICIDADE PR on PR.PERIODICIDADE_ID = T.TRE_PERIODICIDADE ');
    QGrid.Sql.Add(' left outer join TRE_INSTRUTOR I ON I.INS_ID = T.INS_ID ');
    QGrid.Sql.Add(' Where 1 = 1 ');

    if ((EditBuscaTreinamento.Text <> '') and (EditBuscaTreinamento.bs_KeyValues.Count > 0)) then
        Parametros := Parametros + ' and T.CUR_ID = ' + QuotedStr(VarToStr(EditBuscaTreinamento.bs_KeyValue));

   if ((EditBuscaPeriodo.Text <> '') and (EditBuscaPeriodo.bs_KeyValues.Count > 0)) then
        Parametros := Parametros + ' and T.TRE_PERIODICIDADE = ' + QuotedStr(VarToStr(EditBuscaPeriodo.bs_KeyValue));

    if rgObrigacao.ItemIndex = 0 then
        Parametros := Parametros + '  and T.TRE_OBRIGATORIO = ''S'''
    else if  rgObrigacao.ItemIndex = 1 then
        Parametros := Parametros + '  and T.TRE_OBRIGATORIO = ''N''';

    QGrid.Sql.Add(Parametros);

    QGrid.Open ;
end;

procedure TFrmRelTreinamento.FormCreate(Sender: TObject);
begin

  FormOperacao :=  'REL-TREINAMENTO';
  inherited;
  QGrid.Connection := DB_Conect.SQLConnection;
  SetParametros(EditBuscaTreinamento, TipoCurso);
  SetParametros(EditBuscaPeriodo, TipoPeriodicidade);
end;

procedure TFrmRelTreinamento.FormShow(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;
end;

procedure TFrmRelTreinamento.spbLimpaPeriodicidadeClick(Sender: TObject);
begin
  inherited;
  EditBuscaPeriodo.Text := '';
  EditBuscaPeriodo.bs_KeyValues.Clear;
  EditBuscaPeriodo.SetFocus;
end;

procedure TFrmRelTreinamento.spbLimpaTreinamentoClick(Sender: TObject);
begin
  inherited;
  EditBuscaTreinamento.Text := '';
  EditBuscaTreinamento.bs_KeyValues.Clear;
  EditBuscaTreinamento.SetFocus;
end;

end.
