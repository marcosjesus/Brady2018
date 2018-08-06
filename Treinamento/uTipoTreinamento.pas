unit uTipoTreinamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FCadastro, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinsdxStatusBarPainter, Vcl.Menus, Vcl.ExtCtrls, Vcl.StdCtrls, cxButtons,
  dxStatusBar, Vcl.Mask, rsEdit, RseditDB, MensFun,TestFun,Constantes,
  Data.FMTBcd, Data.DB, Data.SqlExpr, SetParametro, EditBusca,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmCadTipoTreinamento = class(TFrmCadastro)
    Panel1: TPanel;
    EdiCodigo: TrsSuperEdit;
    Panel2: TPanel;
    EdiNome: TrsSuperEdit;
    EditBuscaTpTreinamento: TEditBusca;
    qryAux: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButSalvarClick(Sender: TObject);
    procedure ButNovoClick(Sender: TObject);
    procedure ButCancelarClick(Sender: TObject);
    procedure EditBuscaTpTreinamentoClick(Sender: TObject);
    procedure ButExcluirClick(Sender: TObject);
  private
    { Private declarations }
    Function Check : Boolean ; Override ;
  public
    { Public declarations }
  end;

var
  FrmCadTipoTreinamento: TFrmCadTipoTreinamento;

implementation

{$R *.dfm}

procedure TFrmCadTipoTreinamento.ButCancelarClick(Sender: TObject);
begin
  inherited;
  EditBuscaTpTreinamento.Text := '';
  EditBuscaTpTreinamento.bs_KeyValues.Clear;
end;

procedure TFrmCadTipoTreinamento.ButExcluirClick(Sender: TObject);
begin
  inherited;
  EditBuscaTpTreinamento.Text := '';
  EditBuscaTpTreinamento.bs_KeyValues.Clear;
end;

procedure TFrmCadTipoTreinamento.ButNovoClick(Sender: TObject);
begin
  inherited;
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add('Select CodigoTipoTreinamento From Parametros ') ;
  qryAux.Open;
  EdiCodigo.AsInteger := qryAux.FieldByName('CodigoTipoTreinamento').AsInteger + 1 ;
  qryAux.close;

  EditBuscaTpTreinamento.Text := EdiCodigo.AsString;
  EdiNome.SetFocus;

end;

procedure TFrmCadTipoTreinamento.ButSalvarClick(Sender: TObject);
var
  Inclui : Boolean;
begin

  Inclui := (VarOperacao = OPE_INCLUSAO);
  inherited;

   if (not FormOpeErro) and (Inclui) then
  begin
    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add('update Parametros set CodigoTipoTreinamento = CodigoTipoTreinamento + 1 ') ;
    qryAux.ExecSQL;
  end;
  EditBuscaTpTreinamento.Text := '';
  EditBuscaTpTreinamento.bs_KeyValues.Clear;

end;

function TFrmCadTipoTreinamento.Check: Boolean;
begin
   Result := False ;

   If ( Test_IsEmptyStr(EdiNome.Text) ) Then
   Begin
       Mens_MensInf('É necessário informar o nome do tipo de treinamento') ;
       EdiNome.SetFocus ;
       Exit ;
   End ;

   Result := True ;
end;

procedure TFrmCadTipoTreinamento.EditBuscaTpTreinamentoClick(Sender: TObject);
begin
  inherited;
  if ((EditBuscaTpTreinamento.Text <> '') and (EditBuscaTpTreinamento.bs_KeyValues.Count > 0)) then
  begin
    EdiCodigo.AsInteger :=  StrToInt(VarToStr(EditBuscaTpTreinamento.bs_KeyValue));
    if VarOperacao <> OPE_INCLUSAO then
       ButPesquisarClick(self);
  end;
end;

procedure TFrmCadTipoTreinamento.FormCreate(Sender: TObject);
begin

  LabCadTit.Caption := 'Cadastro de Tipo de Treinamento ' ;
  FormOperacao := 'CAD_TIPOTREINAMENTO';
  FormTabela := 'TRE_TIPOTREINAMENTO' ;
  FormChaves := 'TRE_TIPOTREINAMENTO_ID' ;
  FormCtrlFocus := 'EditBuscaTpTreinamento' ;
  FormDataFocus := 'EdiNome' ;

  SetParametros(EditBuscaTpTreinamento, TipoTpTreinamentoID);
  inherited;

end;

procedure TFrmCadTipoTreinamento.FormShow(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;
end;

end.
