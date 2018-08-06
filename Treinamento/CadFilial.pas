unit CadFilial ;

interface

uses
  Windows, Messages, SysUtils, System.Variants, Classes, Graphics, Controls, Forms, Dialogs,
  fcadastro, ComCtrls, StdCtrls, Buttons, ToolWin, ExtCtrls, rsEdit, Mask,
  rsFlyovr, RseditDB, Menus, cxLookAndFeelPainters, cxButtons, cxGraphics,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxStatusBarPainter,
  cxControls, dxStatusBar, jpeg, DB, DBTables, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookAndFeels, dxSkinBlack,
  dxSkinBlue, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, SqlExpr, DateUtils,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint, SetParametro, EditBusca;

type
  TFrmCadFilial = class(TFrmCadastro)
    Panel1: TPanel;
    EdiCodigo: TrsSuperEdit;
    Panel3: TPanel;
    EdiNome: TrsSuperEdit;
    Panel11: TPanel;
    EdiCGC: TrsSuperEdit;
    MEdiCGC: TMaskEdit;
    Panel2: TPanel;
    rsSuperEdit1: TrsSuperEdit;
    EditBuscaFilial: TEditBusca;
    Panel4: TPanel;
    EdiEnd: TrsSuperEdit;
    EdiCEP: TrsSuperEdit;
    mskCEP: TMaskEdit;
    Panel7: TPanel;
    EdiCidade: TrsSuperEdit;
    cbxUF: TComboBox;
    EdiBairro: TrsSuperEdit;
    EdiDescCidade: TEdit;
    Panel5: TPanel;
    EdiNum: TrsSuperEdit;
    EdiComplemento: TrsSuperEdit;
    EdiUF: TrsSuperEdit;
    procedure FormCreate(Sender: TObject);
    procedure EdiCodigoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Tipo4Enter(Sender: TObject);
    procedure ButNovoClick(Sender: TObject);
    procedure CbxUFClick(Sender: TObject);
    procedure EdiUFChange(Sender: TObject);
    procedure EdiCGCChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButSalvarClick(Sender: TObject);
    procedure ButCancelarClick(Sender: TObject);
    procedure EditBuscaFilialExit(Sender: TObject);
    procedure EditBuscaFilialClick(Sender: TObject);
    procedure ButExcluirClick(Sender: TObject);
    procedure mskCEPExit(Sender: TObject);
    procedure EdiCEPChange(Sender: TObject);
  private
    varSalvarCEP : Boolean;
    function ExisteSaldo: Boolean;
    procedure LimpaTela;
    { Private declarations }
  public
    { Public declarations }
    Function Check : Boolean ; Override ;
    Procedure Search ; Override ;
  end;

function DirExists( const Directory: string ): boolean;

var
  FrmCadFilial: TFrmCadFilial;

implementation


{$R *.DFM}

Uses
   Global, ObjFun, MensFun, TestFun, ConsTabFun, Constantes, StrFun , DBConect;

procedure TFrmCadFilial.FormCreate(Sender: TObject);
begin
		LabCadTit.Caption := 'Cadastro de Empresa ' ;
		FormOperacao := 'CAD_EMPRESA';
		FormTabela := 'FILIAL' ;
		FormChaves := 'CodFilial' ;
		FormCtrlFocus := 'EditBuscaFilial' ;
		FormDataFocus := 'EdiNome' ;

    SetParametros(EditBuscaFilial, TipoFilialID);
		inherited;
end;

procedure TFrmCadFilial.FormShow(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;
end;

procedure TFrmCadFilial.mskCEPExit(Sender: TObject);
begin
  varSalvarCEP := False;

  EdiEnd.Enabled    := True;
  EdiCidade.Enabled := True;
  EdiBairro.Enabled := True;
  EdiUF.Enabled     := True;

  BuscaCEP(mskCEP.Text, EdiEnd, EdiCidade, EdiBairro, EdiUF, EdiCEP);

  if ((EdiEnd.Text = '') and (EdiCidade.Text = '') and (EdiBairro.Text = '') and (EdiUF.Text = '')) then
  begin
    EdiEnd.SetFocus;
    varSalvarCEP := True;
  end
  else EdiNum.SetFocus;

  EdiEnd.Enabled    := EdiEnd.Text = '';
  EdiCidade.Enabled := EdiCidade.Text = '';
  EdiBairro.Enabled := EdiBairro.Text = '';
  EdiUF.Enabled     := EdiUF.Text = '';

  cbxUF.Enabled   := EdiUF.Enabled;
  CbxUF.ItemIndex := CbxUF.Items.IndexOf(EdiUF.Text);

  if (EdiEnd.Text <> '') and (EdiNum.Enabled) then
    EdiNum.SetFocus;

end;

function DirExists( const Directory: string ): boolean;
var
  Code: Integer;
begin
  Code := GetFileAttributes(PChar(Directory));
  Result := (Code <> -1) and (FILE_ATTRIBUTE_DIRECTORY and Code <> 0);
end;


procedure TFrmCadFilial.ButCancelarClick(Sender: TObject);
begin
  inherited;
  CbxUF.ItemIndex := -1;
  EditBuscaFilial.Text := '';
  EditBuscaFilial.bs_KeyValues.Clear;
end;

procedure TFrmCadFilial.ButExcluirClick(Sender: TObject);
begin

  DB_Conect.sqlAux.Close;
  DB_Conect.sqlAux.Sql.Clear;
  DB_Conect.sqlAux.Sql.Add(' Select top 1 * from TRE_FUNCIONARIO  ');
  DB_Conect.sqlAux.Sql.Add(' where CODFILIAL = :CODFILIAL ') ;
  DB_Conect.sqlAux.Params.ParamByName('CODFILIAL').AsString := EdiCodigo.AsString;
  DB_Conect.sqlAux.Open;
  if not DB_Conect.sqlAux.IsEmpty then
  begin
    Mens_MensInf('Empresa possui funcionario relacionado. N�o � possivel excluir empresa.');
    Exit;
  end;

  inherited;
  CbxUF.ItemIndex := -1;
  EditBuscaFilial.Text := '';
  EditBuscaFilial.bs_KeyValues.Clear;
end;

procedure TFrmCadFilial.LimpaTela;
begin
  mskCEP.Clear;
  mskCEP.EditMask := '00000\-000;0;_';
  EdiEnd.Clear;
  EdiBairro.Clear;
  EdiCidade.Clear;
  cbxUF.ItemIndex := -1;
end;

procedure TFrmCadFilial.ButNovoClick(Sender: TObject);
begin
  inherited;
  EdiCodigo.AsString := LastCodigo('CODFILIAL', 'FILIAL', '');
  LimpaTela;

  EditBuscaFilial.Text := EdiCodigo.AsString;
  EdiNome.SetFocus; // foco no campo de Codigo.
end;

Function TFrmCadFilial.Check : Boolean ;
Begin
	 Result := False ;
   // Alias Obrigatorio
   If ( Test_IsEmptyStr(EdiNome.Text) ) Then
	 Begin
			 Mens_MensInf('� necess�rio informar o Nome da Empresa !') ;        //EdiApelido
			 EdiNome.SetFocus ;
			 Exit ;
	 End ;


    // verifica CGC = CNPJ
   if Trim(Copy(MEdiCGC.Text, 1, 1)) <> '' then
      begin
        If ( Test_IsEmptyStr(MEdiCGC.Text) = FALSE ) Then
        Begin
         EdiCGC.Text := MEdiCGC.Text;
         If (Test_CheckCGC(MEdiCGC.Text) = FALSE) Then // cgc nao bate
         Begin
            Mens_MensInf('N�mero do CNPJ n�o confere.') ;
            MEdiCGC.SetFocus ;
            Exit ;
         End ;
        End;
      end
   else
      EdiCGC.Text := '';

   EdiUF.Text := CbxUF.Text;

   //EdiCEP.Text := mskCEP.Text;


   // todos os campos obrigatorios preenchidos retorna TRUE
   Result := True ;
End ;

function   TFrmCadFilial.ExisteSaldo : Boolean;
begin
end;

procedure TFrmCadFilial.EdiCodigoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  ButPesquisarClick(Self) ;
end;

procedure TFrmCadFilial.EditBuscaFilialClick(Sender: TObject);
begin
  inherited;
  if ((EditBuscaFilial.Text <> '') and (EditBuscaFilial.bs_KeyValues.Count > 0)) then
  begin
   EdiCodigo.AsString := VarToStr(EditBuscaFilial.bs_KeyValue);
   if VarOperacao <> OPE_INCLUSAO then
     ButPesquisarClick(Self);
  end;
end;

procedure TFrmCadFilial.EditBuscaFilialExit(Sender: TObject);
begin
  inherited;


end;

// ***** 1 - Se Telefone em branco tipo tambem sera
procedure TFrmCadFilial.Tipo4Enter(Sender: TObject);
begin
  inherited;
end;
// ***** FINAL 1 *****

procedure TFrmCadFilial.ButSalvarClick(Sender: TObject);
begin

  if varSalvarCEP then
  begin
      edicep.AsInteger := SalvarCEP(mskCEP.Text,EdiEnd.Text, EdiBairro.Text, EdiCidade.Text, cbxUF.Text);
  end;

  inherited;
  CbxUF.ItemIndex := -1;
  EditBuscaFilial.Text := '';
  EditBuscaFilial.bs_KeyValues.Clear;
end;

procedure TFrmCadFilial.CbxUFClick(Sender: TObject);
begin
  inherited;
  EdiUF.Text := CbxUF.Text;
end;

procedure TFrmCadFilial.EdiUFChange(Sender: TObject);
begin
  inherited;
  CbxUF.ItemIndex := CbxUF.Items.IndexOf(EdiUF.Text);
end;

procedure TFrmCadFilial.EdiCEPChange(Sender: TObject);
begin
  inherited;
  //mskCEP.Clear;
  //mskCEP.EditMask := '00000\-000;0;_';
  //mskCEP.Text := EdiCEP.AsString;
end;

procedure TFrmCadFilial.EdiCGCChange(Sender: TObject);
begin
  inherited;
  MEdiCGC.EditMask := '##\.###\.###\/####\-##;0;_';
  MEdiCGC.Text := EdiCGC.AsString;
end;

procedure TFrmCadFilial.Search;
begin
  inherited;


  if not FormOpeErro then
  begin
    LimpaTela;

    mskCEP.Text := EditBuscaFilial.bs_KeyValues[4];
    BuscaCEP(mskCEP.Text, EdiEnd, EdiCidade, EdiBairro, EdiUF, EdiCEP);
    EdiEnd.Enabled    := EdiEnd.Text = '';
    EdiCidade.Enabled := EdiCidade.Text = '';
    EdiBairro.Enabled := EdiBairro.Text = '';
    EdiUF.Enabled     := EdiUF.Text = '';

    cbxUF.Enabled   := EdiUF.Enabled;
    CbxUF.ItemIndex := CbxUF.Items.IndexOf(EdiUF.Text);
   // mskCEP.Text     := EdiCEP.Text;
  end;

end;

end.

