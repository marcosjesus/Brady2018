unit FCadastro ;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolWin, ComCtrls, StdCtrls, ExtCtrls, Mask, rsEdit, RseditDB, DBGrids, COMObj, Variants,
  Buttons, SqlTableFun, rsFlyovr, DBTables, DBCtrls, DB, Menus, RxLookup,
  cxLookAndFeelPainters, cxButtons, cxGraphics, dxSkinsCore, SqlTimSt, Provider, DBClient,
  dxSkinsDefaultPainters, dxSkinsdxStatusBarPainter, cxControls,
  dxStatusBar, cxLookAndFeels, dxSkinBlack, dxSkinBlue, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint , FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;


type
  TFrmCadastro = class(TForm)
    PanFundo: TPanel;
    PanTitulo: TPanel;
    TimerPerfil: TTimer;
    EdiDatabaseName: TEdit;
    EdiKeyValue: TrsDBSuperEdit;
    ImaBarraSup: TImage;
		LabCadTit: TLabel;
    StatusBar: TdxStatusBar;
    Panel27: TPanel;
    ButNovo: TcxButton;
    ButAlterar: TcxButton;
    ButExcluir: TcxButton;
    ButPesquisar: TcxButton;
    ButImprimir: TcxButton;
    ButSair: TcxButton;
    ButSalvar: TcxButton;
    ButCancelar: TcxButton;
		procedure ButVoltarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ButNovoClick(Sender: TObject);
    procedure ButAlterarClick(Sender: TObject);
    procedure ButExcluirClick(Sender: TObject);
    procedure ButPesquisarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure TimerPerfilTimer(Sender: TObject);
    procedure ButImpClick(Sender: TObject);
    procedure ButSairClick(Sender: TObject);
    Procedure ControlSetFocus ( C : TWinControl ) ;
    procedure ButCancelarClick(Sender: TObject);
    procedure ButSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    Procedure OnOffConf ( Value : Boolean ) ;

  private
    { Private declarations }
    FormNumAltKey : Integer ;
    FormVetAltKey : Array of TComponent ;
    Procedure FillAltKey ;
    procedure FrmIncCode;


  public
    { Public declarations }
    Permissao: Byte; // 2 - Apenas Leitura 3 - Inclusão e alteração
    Tab : TSQLTableClass ;
    TmpTab : Array[1..9] of TFDQuery;
    TmpDts : Array[1..9] of TDataSource;
    VarOperacao : Byte ;
		FormCheck : Boolean ;
    aFields : Array Of String ;
		aControlFld : Array Of TWinControl ;
    WinFocus : TWinControl ;
    DataFocus : TWinControl ;
    NumFields : Integer ;
    FormOrder : Integer ;
    FormOperacao : String ;
    FormTabela : String ;
    FormChaves : String ;
    FormCtrlFocus : String ;
    FormDataFocus : String ;
    FormAlterou : Boolean ;
    FormAutoInc : Boolean ;
    FormOpeErro : Boolean ;
    Silencioso  : Boolean ;
    Salvo : Boolean;  // ***** Genival 15/04/2000 *****
    FormOBS : String ;
    FormOBS2: String ;
    function IncCode(C:String) : Integer ; Virtual ;
    Procedure LimpaCombos ; Virtual ;
    Procedure SalvaCombos ; Virtual ;
    Procedure MostrarCombos ; Virtual ;
    Function CriarCamposLookup(L : TDBLookupComboBox;TL,LF,LK : String):Boolean; overload ;
    Function CriarCamposLookup(L : TRxDBLookupCombo;TL,LF,LK : String):Boolean; overload ;
    Function LimpaTodosCamposLookup:Boolean; Virtual;
    Function MemFind:Boolean; Virtual ;
    Function GeraUpdate(C : Array of String; V : Array of Variant):Boolean; Virtual ;
    Procedure ValidateAllData ; Virtual ;
    Procedure Search ; Virtual ;
    Procedure Scape ;  Virtual ;
    Procedure Delete ; Virtual ;
    Procedure Altera ; Virtual ;
    Procedure Inclui ; Virtual ;
    Procedure Novo ; Virtual ;
    Procedure Imprime ; Virtual ;
		Procedure FillForm ( bValues : Boolean ) ; Virtual ;
		Function  Check : Boolean ; Virtual ;
		Procedure GetDesc ; Virtual ;
		Procedure ShowFormByControl ( TypeForm : String ; C : TObject ) ;
		Function  VerChave(wC, wT, wV : String;wTp:Integer):Boolean ;
    procedure BotoesOnOff(Bt:String); Virtual ;
    procedure ShowHints(Sender: TObject);
    Function  LastCodigo(Chave, Tab, Condicao : String ) : String;
    function dDataSql(Data: TDateTime) :String ;
    Procedure GridExcel(Grid : TDBGrid; Consulta : TFDQuery);
    Procedure BuscaCEP(CEP : String; Var Logradouro : TrsSuperEdit; Var Cidade : TrsSuperEdit; Var Bairro : TrsSuperEdit; Var UF : TrsSuperEdit; var IDCEP :TrsSuperEdit );
    Function SalvarCEP(CEP, Logradouro, Bairro, Cidade, UF : String): Integer;

    Procedure EmailOutlook(CodCliente, Assunto, Arquivo : String; var Gerado : Boolean) ;
    Function Tabela_Preco(Produto : TrsSuperEdit) : Double;
    Procedure CentralizaPainel( Painel : TPanel; Status : boolean);
    Function UF_Empresa(Empresa : String) : String;

	end;

var
	FrmCadastro: TFrmCadastro;

implementation

{$R *.DFM}

Uses
	 DBConect, Global, StrFun, ObjFun, MensFun, TestFun, ConsTabFun, UPrincipal, Constantes,
	 Perfil , Login;

Const
// TAG = 0 NADA, TAG = -1 GRAVA, TAG = -2 GRAVA CHAVE
   TAG_FIELD    = -1 ;
   TAG_KEY      = -2 ;
   TAG_ESPCOMBO = -3 ;
   TAG_ALT_KEY  = -4 ;
   olMailItem   = 0;

Procedure TFrmCadastro.ValidateAllData ;
Var
   i : Integer ;
Begin
   For i:=0 To Self.ComponentCount-1 Do
      If ( Self.Components[i] Is TrsSuperEdit ) Then
        TrsSuperEdit(Self.Components[i]).ValidateData;
End ;

procedure TFrmCadastro.FrmIncCode;
var
  i : Integer ;
begin
  if FormAutoInc then
  begin
   For i:=0 To Self.ComponentCount-1 Do
		If ( Self.Components[i].Tag = -2 ) Then
      If ( Self.Components[i] Is TrsSuperEdit ) Then begin
        TrsSuperEdit(Self.Components[i]).AsInteger := IncCode(TrsSuperEdit(Self.Components[i]).TagName);
        TrsSuperEdit(Self.Components[i]).Enabled     := FALSE;
      end;
  end;
end;

function TFrmCadastro.IncCode(C:String) : Integer ;
var
  Cod : Integer;
begin
if VarOperacao = 1 then
begin
  Tab.ExecSqlSel('Select '+C+' from Parametros');
  Cod := Tab.QResult.Fields[0].AsInteger+1;
  Tab.ExecSql('Update Parametros set '+C+' = '+IntToStr(Cod));
  SelectNext(ActiveControl,True,True);
  Result := Cod;
end
else
  Result := 0 ;
end;

{function TFrmCadastro.RetCode(C:String) : Ineteger ;
var
  Cod : Integer;
begin
  Tab.ExecSqlSel('Select '+C+' from Parametros');
  Cod := Tab.QResult.Fields[0].AsInteger+1;
  Tab.ExecSql('Update Parametros set '+C+' = '+IntToStr(Cod));
  Result := Cod;
end;}

Function TFrmCadastro.GeraUpdate(C : Array of String; V : Array of Variant):Boolean;
begin
  Result:=true;
  try

  except
    Result:=false;
  end;
end;

procedure TFrmCadastro.BotoesOnOff(Bt:String);
begin
{  if FrmCadastro.Permissao > 2 then
     ButNovo.Enabled    := Copy(Bt,1,1) = 'T' ;

  if FrmCadastro.Permissao > 3 then
     ButExcluir.Enabled := Copy(Bt,3,1) = 'T' ;
}
  ButNovo.Enabled      := Copy(Bt,1,1) = 'T' ;
  ButExcluir.Enabled   := Copy(Bt,3,1) = 'T' ;
  ButAlterar.Enabled   := Copy(Bt,2,1) = 'T' ;
  ButPesquisar.Enabled := Copy(Bt,4,1) = 'T' ;
  ButImprimir.Enabled  := Copy(Bt,5,1) = 'T' ;
  ButSair.Enabled      := Copy(Bt,6,1) = 'T' ;
  ButCancelar.Visible  := Copy(Bt,7,1) = 'T' ;
  ButSalvar.Visible    := Copy(Bt,8,1) = 'T' ;
end;

Procedure TFrmCadastro.MostrarCombos ;
Var
   i,n,k : Integer ;
   M,V : Array[1..20] of String;
Begin
    n:=1;
   For i:=0 To Self.ComponentCount-1 Do
		If ( Self.Components[i].Tag = -4 ) Then
    begin
      If ( Self.Components[i] Is TComboBox ) Then
      begin
        M[n]:=TComboBox(Self.Components[i]).Name;
        n:=n+1;
      end;
      If ( Self.Components[i] Is TDBLookupComboBox ) Then
      begin
        M[n]:=TComboBox(Self.Components[i]).Name;
        n:=n+1;
      end;
    end;
   For K := 1 to N do
   For i:=0 To Self.ComponentCount-1 Do
		If ( Self.Components[i].Tag < 0 ) Then
    begin
      If ( Self.Components[i] Is TrsSuperEdit ) Then
      begin
        if TrsSuperEdit(Self.Components[i]).TagName = M[k] then
          V[k]:=TrsSuperEdit(Self.Components[i]).Text;
      end;
    end;
    n:=1;
   For i:=0 To Self.ComponentCount-1 Do
		If ( Self.Components[i].Tag = -4 ) Then
    begin
      If ( Self.Components[i] Is TComboBox ) Then
      begin
        TComboBox(Self.Components[i]).Name:=M[n];
        try
          TComboBox(Self.Components[i]).ItemIndex:=StrToInt(V[n]);
        except
          TComboBox(Self.Components[i]).ItemIndex:=-1;
        end;
      end;
      If ( Self.Components[i] Is TDBLookupComboBox ) Then
      begin
        TDBLookupComboBox(Self.Components[i]).Name:=M[n];
        try
          TDBLookupComboBox(Self.Components[i]).KeyValue:=StrToInt(V[n]);
        except
          try
            TDBLookupComboBox(Self.Components[i]).KeyValue:=V[n];
          except
            TDBLookupComboBox(Self.Components[i]).KeyValue:=-1;
          end;
        end;
      end;
    n:=n+1;
    end;
End ;

Procedure TFrmCadastro.SalvaCombos ;
Var
   i,n : Integer ;
   M,V : Array[1..30] of String;
//   V : Array[1..20] of Variant;
Begin
   n:=1;
   For i:=0 To Self.ComponentCount-1 Do
		If ( Self.Components[i].Tag = -4 ) Then
    begin
      If ( Self.Components[i] Is TComboBox ) Then
      begin
        M[n]:=TComboBox(Self.Components[i]).Name;
        V[n]:=IntToStr(TComboBox(Self.Components[i]).ItemIndex);
        n:=n+1;
      end;
      If ( Self.Components[i] Is TDBLookupComboBox ) Then
      begin
        M[n]:=TDBLookupComboBox(Self.Components[i]).Name;
        try
          V[n]:=IntToStr(TDBLookupComboBox(Self.Components[i]).KeyValue);
        except
          try
            V[n]:=TDBLookupComboBox(Self.Components[i]).KeyValue;
          except ; end;
        end;
        n:=n+1;
      end;
    end;
    n:=1;
   For i:=0 To Self.ComponentCount-1 Do
		If ( Self.Components[i].Tag < 0 ) Then
    begin
      If ( Self.Components[i] Is TrsSuperEdit ) Then
      begin
        if TrsSuperEdit(Self.Components[i]).TagName = M[n] then
        begin
          TrsSuperEdit(Self.Components[i]).Text:= V[n];
          n:=n+1;
        end;
      end;
    end;
End ;

Procedure TFrmCadastro.LimpaCombos ;
Var
   i : Integer ;
Begin
   For i:=0 To Self.ComponentCount-1 Do
		If ( Self.Components[i].Tag = -4 ) Then
    begin
      If ( Self.Components[i] Is TComboBox ) Then
        TComboBox(Self.Components[i]).ItemIndex := -1 ;
      If ( Self.Components[i] Is TDBLookupComboBox ) Then
      try
        TDBLookupComboBox(Self.Components[i]).KeyValue := '';
      except
        TDBLookupComboBox(Self.Components[i]).KeyValue := 0 ;
      end;
    end;
End ;

Function TFrmCadastro.CriarCamposLookup(L : TDBLookupComboBox;TL,LF,LK : String):Boolean;
var
  TmpDts : TDataSource;
  TmpTab : TFDQuery;
  Campos : String;
begin
  Result:=true;
  try
    TmpTab :=  TFDQuery.Create(self);
    TmpDts :=  TDataSource.Create(self);
    with TmpTab do
    begin
      TmpDts.DataSet := TmpTab;               // Origem dos dados
      Connection := DB_Conect.SQLConnection ;              // Nome do database corrente
      SQL.Clear;                              // Inicia comandos SQL !!!
      Campos := LF;
      if POS(';', LF) > 0 then
      begin
        LF := Copy(LF,1, POS(';', LF)-1) + ',' + Copy(LF, POS(';', LF)+1, Length(LF));
        L.ListFieldIndex := 2 ;
      end;
      SQL.Add('Select '+LK+', '+LF+' from '+TL);    // PASSA COMANDO SQL PARA QUERY
      Open;                                   // Executa Query
// aumentar tamanho da 1º coluna so lookup      
//      Fields[0].DisplayWidth := Fields[0].DisplayWidth + 8;
      L.ListSource := TmpDts     ;            // Adiciona Resultado da query ao COMBO
      L.ListField  := Campos;                     // Indica campos a ser mostrado
      L.KeyField   := LK;                     // indica campo chave
      Exit;
    end;   // final => with...
  except
    Result:=false;
  end;        // final => try...except
end;

Function TFrmCadastro.LimpaTodosCamposLookup:Boolean;
var
  n:integer;
begin
Result:=true;
try
  For n := 1 to 9 do
  begin
    if tmpTab[n] <> nil then
    begin
      with tmpTab[n] do
      begin
        Close;
        Free;
        tmpDts[n].Free;
      end;
    end;
  end;
except
  Result :=false ;
end;
end;



procedure TFrmCadastro.FormCreate(Sender: TObject);
Var
    i : Integer ;
begin

//   Left   := GFormLeft ;
//   Top    := GFormTop + 2;
//   Height := GFormHeight ;
//   Width  := GFormWidth ;
   Top  := 0;
   Left := 0;

   Tab := TSQLTableClass.Create ;
   EdiDatabaseName.Text := GDatabase ;

   NumFields := Str_GetNumOccur(FormChaves,';') + 1 ;
   SetLength(aFields,NumFields) ;
	 SetLength(aControlFld,NumFields) ;
   For i:=0 To NumFields-1 Do
       aFields[i] := Str_GetToken(FormChaves,';',i+1) ;

//   ImaBarraSup.Picture.LoadFromFile('BarraSup.bmp');

   Self.Caption := LabCadTit.Caption;

   Application.OnHint:=ShowHints;

end;

procedure TFrmCadastro.FormShow(Sender: TObject);
Var
    i : Integer ;
begin

   If ( Not Tab.OpenTable(FormTabela) ) Then
   Begin
       Mens_MensErro(Tab.GetMensErro) ;
       Tag := -1 ;
       TimerPerfil.Enabled := True ;
   End ;

   For i:=0 To NumFields-1 Do
       Tab.SetFieldKey(aFields[i]) ;

   FormCheck := False ;

	 For i:=0 To NumFields-1 Do
	 Begin
			 WinFocus := TWinControl(Obj_FindControlByTagName(Self,aFields[i])) ;
			 aControlFld[i] := WinFocus ;
	 End ;
	 WinFocus := TWinControl(Obj_FindControlByName(Self,FormCtrlFocus)) ;
   If ( WinFocus <> Nil ) Then
       ControlSetFocus(WinFocus) ;
   DataFocus := TWinControl(Obj_FindControlByName(Self,FormDataFocus)) ;

   Obj_SetCompsVisible(Self,-1,False) ;

   // Identificar o DatabaseName para as consultas
   ConsTab_SetDBName(GDatabase) ;

   FormAlterou := False ;

   BotoesOnOff('TTFTTTFF');
{
   if FrmCadastro.Permissao = 2 then // Apenas Leitura
      begin
        ButNovo.Enabled    := false;
        ButExcluir.Enabled := false;
        ButSalvar.Enabled  := false;
      end
   else
      if FrmCadastro.Permissao = 3 then // Inclusao e Alteracao
         begin
           ButNovo.Enabled    := true;
           ButSalvar.Enabled  := true;
           ButExcluir.Enabled := false;
         end
      else
         if FrmCadastro.Permissao = 4 then // Acesso total
            begin
              ButNovo.Enabled    := true;
              ButExcluir.Enabled := false;
              ButSalvar.Enabled  := true;
            end;
}            
end;

procedure TFrmCadastro.FormActivate(Sender: TObject);
begin
   If ( Not Glob_GetAccess(FormOperacao,'') ) Then
   Begin
       Mens_MensInf('Operação não liberada para o usuário') ;
       Tag := -1 ;
       TimerPerfil.Enabled := True ;
   End ;
end;

procedure TFrmCadastro.FormDestroy(Sender: TObject);
begin
   Application.OnHint := Nil;
   Tab.Destroy ;
end;

procedure TFrmCadastro.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
(* Univers
   Case Key Of
{       33 : Begin
               Tab.Prior ;
               FillForm(True) ;
       End ;
       34 : Begin
               Tab.Next ;
               FillForm(True) ;
       End ;}
       27 : Scape ;
       46 : Begin
               If ( Shift = ([ssCtrl]) ) Then
                  Delete ;
       End ;
       77, 90 : Begin
               If ( Shift = ([ssCtrl]) ) Then
                  Application.Minimize ;
       End ;
   End ;
   if (VarOperacao = 1) or (VarOperacao = 2) then
     FormAlterou := True ;
*)
   Case Key Of
{       33 : Begin
               // -- Determinando a ordem de pesquisa escolhida
               If ( FormOrder <> 0 ) Then
               Begin
                  Tab.ResetKey ;
                  sOrder := Str_GetToken(TrsSuperEdit(WinFocus).CT_ColField,';',FormOrder+1) ;
                  Tab.SetFieldKey(sOrder) ;
               End ;
               If ( Tab.Prior(True) ) Then
               Begin
                  Tab.SetFormObjValue(Nil,TAG_KEY) ;
                  FillForm(True) ;
               End ;
               Tab.ResetKey ;
               For i:=0 To NumFields-1 Do
                   Tab.SetFieldKey(aFields[i]) ;
       End ;
}
{
       34 : Begin
               // -- Determinando a ordem de pesquisa escolhida
               If ( FormOrder <> 0 ) Then
               Begin
                  Tab.ResetKey ;
                  sOrder := Str_GetToken(TrsSuperEdit(WinFocus).CT_ColField,';',FormOrder+1) ;
                  Tab.SetFieldKey(sOrder) ;
               End ;
               If ( Tab.Next(True) ) Then
               Begin
                  Tab.SetFormObjValue(Nil,TAG_KEY) ;
                  FillForm(True) ;
               End ;
               Tab.ResetKey ;
               For i:=0 To NumFields-1 Do
                   Tab.SetFieldKey(aFields[i]) ;
       End ;
}
       27 : Begin
            If ( ButCancelar.Visible ) Then     // Alt + Esc
            Begin
               ButCancelarClick(Self) ;
            End
            Else Begin
               Scape ;
            End ;
       End ;
// Elias - Devido inclusão de Contato no follow-up
//       45 : Begin
//          ButNovoClick(Self) ;
//       End ;
       46 : Begin
               If ( Shift = ([ssCtrl]) ) Then
                  Delete ;

       End ;
       // -- Alt + F12 = Novo login
       123 : Begin
            If ( Shift = ([ssAlt]) ) Then
            Begin
               FrmLogin := TFrmLogin.Create(Self) ;
               FrmLogin.Showmodal ;
               FrmLogin.Close ;
            End ;
       End ;
       13 : Begin
(*
            If ( (Screen.ActiveControl.Tag = -1) And
                 ( Not ( (Key = 80) And (Shift = ([ssAlt])) ) ) // Alt+P
               ) Then
               FormAlterou := True
            Else
               FormAlterou := False ;
*)
            If ( (ButSalvar.Visible) And (Shift = ([ssAlt])) ) Then     // Alt + Enter
            Begin
               ButSalvarClick(Self) ;
            End
            Else
            BEGIN
             If ( (Screen.ActiveControl.Tag = -1) And ( Not ( (Key = 80) And (Shift = ([ssAlt])) ) ) // Alt+P
                  ) Then
                  FormAlterou := True
               Else
                  FormAlterou := False ;
            End;
       End ;
   End ;

End ;

Procedure TFrmCadastro.ControlSetFocus ( C : TWinControl ) ;
Var
    CompParent : TComponent ;
Begin
    CompParent := TPanel( TEdit(TEdit(C)).Parent ).Parent ;
    If ( CompParent Is TTabSheet ) Then
      TPageControl( TTabSheet(CompParent).Parent ).ActivePage := TTabSheet(CompParent) ;
    TEdit(C).SetFocus ;
End ;

Procedure TFrmCadastro.FillAltKey ;
Var
    i : Integer ;
Begin
    FormNumAltKey := 0 ;
    For i:=0 To Self.ComponentCount-1 Do
  		If ( Self.Components[i].Tag = TAG_ALT_KEY ) Then
       Begin
          FormNumAltKey := FormNumAltKey + 1 ;
          SetLength(FormVetAltKey,FormNumAltKey) ;
          FormVetAltKey[FormNumAltKey] := Self.Components[i] ;
       End ;
End ;

Procedure TFrmCadastro.Scape ;
Var
   i : Integer ;
Begin

    If ( FormAlterou ) Then
    Begin
        If ( Mens_MensConf('Confirma sair sem Salvar ?') <> mrOk ) Then
           Exit ;
    End ;

   FormAlterou:=false;
//	 ButNovo.Enabled:=true;
//   ButAlterar.Enabled:=true;
//   ButPesquisar.Enabled:=true;
//   ButImprimir.Enabled:=true;
   BotoesOnOff('TTFTTTFF');
   VarOperacao := OPE_ESCAPE ;
   For i:=0 To NumFields-1 Do
   Begin
      If ( Test_IsEmptyStr(TEdit(aControlFld[i]).Text) ) Then
      Begin
          Close ;
          Exit ;
      End ;
   End ;

   FormCheck := False ;
   Obj_SetCompsEmpty(Self,0) ;
   Obj_SetCompsEnable(Self,-2,True) ;
   Obj_SetCompsVisible(Self,-1,False) ;
   Obj_SetNullInFormObj(Self,-3) ;

   ControlSetFocus(WinFocus) ;

End ;

Procedure TFrmCadastro.Delete ;
Var
   aKey : Array Of VAriant ;
   i : Integer ;
Begin
// ----- Exclusão
  FormOpeErro := True ;
   If ( Mens_MensConf('Confirma Exclusão ?') = mrOk ) Then
   Begin
       SetLength(aKey,NumFields) ;
       For i:=0 To NumFields-1 Do
          aKey[i] := TEdit(aControlFld[i]).Text ;
       Tab.SetKey(aKey) ;
       If ( Not Tab.Delete ) Then
           Mens_MensErro(Tab.GetMensErro)
       Else Begin
           Mens_MensInf('Registro excluido com sucesso ! ') ;
           VAROPERACAO := OPE_ESCAPE;
           FormOpeErro := False ;
           FormAlterou:=false;
           Scape ;
       End ;
   End ;
   FormAlterou := False ;
end;

Procedure TFrmCadastro.Inclui ;
Begin
// ----- Inclusão
  FormOpeErro := True ;
  Salvo := False;  // ***** Genival 15/04/2000 *****
   If ( Not Check() ) Then
       Exit ;
   If (Silencioso) or ( Mens_MensConf('Inclui Registro ?') = mrOk ) Then
   Begin
       SalvaCombos;
       Tab.FormSetFieldValue(Self,0) ;
       If ( Not Tab.Insert ) Then
       Begin
           Mens_MensErro(Tab.GetMensErro) ;
           VarOperacao := OPE_ALTERACAO ;
           If ( Tab.GetNumErro() = ERRO_KEYVIOLATION ) Then
               Search ;
       End
       Else Begin
           if not (Silencioso) then
             Mens_MensInf('Registro incluido com sucesso !') ;
           BotoesOnOff('TTFTTTFF');
           VarOperacao := OPE_ESCAPE ;
           FormOpeErro := False ;
           FormAlterou:=false;
           Salvo := True;  // ***** Genival 15/04/2000 *****
           Scape ;
			 End ;
   End ;
   FormAlterou := False ;
End ;

Procedure TFrmCadastro.Altera ;
Begin
// ----- Alteração
//  Silencioso  := False;
  FormOpeErro := True ;
  Salvo := False;  // ***** Genival 15/04/2000 *****
   If ( Not Check() ) Then
       Exit ;
   If (Silencioso) or ( Mens_MensConf('Salvar Alterações ?') = mrOk ) Then
   Begin
       SalvaCombos ;
       Tab.FormSetFieldValue(Self,-1) ;
       If ( Not Tab.Update ) Then
           Mens_MensErro(Tab.GetMensErro)
       Else Begin
           Mens_MensInf('Alterações Salvas com sucesso !') ;
           BotoesOnOff('FFFFFFTT');
           VarOperacao := OPE_ESCAPE;
           FormOpeErro := False ;
           FormAlterou:=false;
           Salvo := True;       // ***** Genival 15/04/2000 *****
           Scape ;
			 End ;
   End ;
   FormAlterou := False ;
End ;

Procedure TFrmCadastro.Novo ;
Begin
   If ( Not Glob_GetAccess(FormOperacao,'I') ) Then
   Begin
       Mens_MensInf('Operação não liberada para o usuário') ;
       Exit ;
   End ;
   VarOperacao := OPE_INCLUSAO ;
   LimpaCombos ;
   Obj_SetCompsEmpty(Nil,0) ;
   Obj_SetNullInFormObj(Self,-3) ;
   Obj_SetCompsVisible(Self,-1,True) ;
   Obj_SetCompsEnable(Self,-2,True) ;
   TEdit(WinFocus).Enabled := True ;
   ControlSetFocus(WinFocus) ;
   BotoesOnOff('FFFFFFTT');
   FormCheck := True ;
   FormAlterou := False ;
   Silencioso  := False;
   FrmIncCode ;
End ;

Function TFrmCadastro.MemFind:Boolean;
var
  i : Integer ;
  Tab : TFDQuery ;
begin
  Result:=true;
  if FormOBS = '' then
    Exit;

  try
     Tab:=TFDQuery.Create(Self);
     with Tab do
     begin
      Connection := DB_Conect.SQLConnection ;
      SQL.Clear;
      SQL.Add('Select '+FormOBS+' from '+FormTabela+' where '+FormChaves+' = :P0');
      For i:=0 To Self.ComponentCount-1 Do
      If ( Self.Components[i] Is TrsSuperEdit ) Then
       if (TrsSuperEdit(Self.Components[i]).TagName = FormChaves) then
       begin
         TrsSuperEdit(Self.Components[i]).ValidateData;
         case TrsSuperEdit(Self.Components[i]).Format of
           foInteger : Params[0].AsInteger := TrsSuperEdit(Self.Components[i]).AsInteger ;
           foReal : Params[0].AsFloat := TrsSuperEdit(Self.Components[i]).AsDouble ;
           foText : Params[0].AsString := TrsSuperEdit(Self.Components[i]).AsString ;
           foFullDate : Params[0].AsDateTime := TrsSuperEdit(Self.Components[i]).AsDateTime ;
         end;
       end;
      Open;
      For i:=0 To Self.ComponentCount-1 Do
      If ( Self.Components[i] Is TMemo ) Then
       if Copy(TMemo(Self.Components[i]).Name,4,200) = FormObs then
         TMemo(Self.Components[i]).Text:=Fields[0].AsString;
      Close;
      Free;
     end;
  except
    Result:=false;
  end;


  if FormOBS2 = '' then
    Exit;

  try
     Tab:=TFDQuery.Create(Self);
     with Tab do
     begin
      Connection := DB_Conect.SQLConnection ;
      SQL.Clear;
      SQL.Add('Select '+FormOBS2+' from '+FormTabela+' where '+FormChaves+' = :P0');
      For i:=0 To Self.ComponentCount-1 Do
      If ( Self.Components[i] Is TrsSuperEdit ) Then
       if (TrsSuperEdit(Self.Components[i]).TagName = FormChaves) then
       begin
         TrsSuperEdit(Self.Components[i]).ValidateData;
         case TrsSuperEdit(Self.Components[i]).Format of
           foInteger : Params[0].AsInteger := TrsSuperEdit(Self.Components[i]).AsInteger ;
           foReal : Params[0].AsFloat := TrsSuperEdit(Self.Components[i]).AsDouble ;
           foText : Params[0].AsString := TrsSuperEdit(Self.Components[i]).AsString ;
           foFullDate : Params[0].AsDateTime := TrsSuperEdit(Self.Components[i]).AsDateTime ;
         end;
       end;
      Open;
      For i:=0 To Self.ComponentCount-1 Do
      If ( Self.Components[i] Is TMemo ) Then
       if Copy(TMemo(Self.Components[i]).Name,4,200) = FormObs2 then
         TMemo(Self.Components[i]).Text:=Fields[0].AsString;
      Close;
      Free;
     end;
  except
    Result:=false;
  end;

end;

Procedure TFrmCadastro.Search ;
Var
   aKey : Array Of Variant ;
   i : Integer ;
Begin
// ----- Pesquisa
   If VarOperacao = 1 then
     Exit;

   FormOpeErro := True ;
   Silencioso  := False;

   If ( Not Test_IsEmptyStr(TEdit(WinFocus).Text) ) Then
   Begin
     SetLength(aKey,NumFields) ;
     For i:=0 To NumFields-1 Do
        aKey[i] := TEdit(aControlFld[i]).Text ;
     If ( NumFields > 0 ) Then
        Tab.SetKey(aKey) ;
     If ( Tab.Find(True) ) Then
     Begin
         Obj_SetCompsVisible(Self,-1,True) ;
         VarOperacao := OPE_ALTERACAO ;
         Obj_SetCompsEnable(Self,-2,False) ;
         // -- Não processar porque esta tudo desabilitado
         ControlSetFocus(DataFocus) ;
         MostrarCombos ;
         MemFind;
         FillForm(True) ;
         BotoesOnOff('FFTFFFTT');
         FormCheck := True ;
         FormOpeErro := False ;
     End
     Else
     Begin
         // ???? Mens_MensInf(Tab.GetMensErro()) ;
         Mens_MensInf('Registro não encontrado') ;
         VarOperacao := OPE_ESCAPE ;
         TEdit(WinFocus).Enabled := True ;
         ControlSetFocus(WinFocus) ;
         FormOpeErro := True ;
     End ;
     Exit ;
   End ;

//   FillAltKey() ;     // Da erro quando pressiona <Enter> no campo chave de pesquisa  - Elias

   If ( FormNumAltKey <> 0 ) Then
   Begin
     SetLength(aKey,FormNumAltKey) ;
     For i:=0 To FormNumAltKey-1 Do
        aKey[i] := TEdit(FormVetAltKey[i]).Text ;
     Tab.SetKey(aKey) ;
     If ( Tab.Find(True) ) Then
     Begin
         Obj_SetCompsVisible(Self,-1,True) ;
         FillForm(True) ;
         VarOperacao := OPE_ALTERACAO ;
         Obj_SetCompsEnable(Self,-2,False) ;
         ControlSetFocus(DataFocus) ;
         FormCheck := True ;
     End
     Else Begin
         Mens_MensInf('Registro não encontrado') ;
         VarOperacao := OPE_ESCAPE ;
         TEdit(WinFocus).Enabled := True ;
         ControlSetFocus(WinFocus) ;
         FormCheck := False ;
         FormOpeErro := True ;
     End ;
     Exit ;
   End ;

(* Univers
// ----- Pesquisa
   If VarOperacao = 1 then
     Exit;
   If ( Not Test_IsEmptyStr(TEdit(WinFocus).Text) ) Then
   Begin
     SetLength(aKey,NumFields) ;
     For i:=0 To NumFields-1 Do
        aKey[i] := TEdit(aControlFld[i]).Text ;
     Tab.SetKey(aKey) ;
     If ( Tab.Find(True) ) Then
     Begin
         Obj_SetCompsVisible(Self,-1,True) ;
         FillForm(True) ;
         VarOperacao := OPE_ALTERACAO ;
         Obj_SetCompsEnable(Self,-2,False) ;
         ControlSetFocus(DataFocus) ;
         MostrarCombos ;
         MemFind;
         BotoesOnOff('FFTFFFTT');
         FormCheck := True ;
     End
     Else Begin
         Mens_MensInf('Registro não encontrado !') ;
         VarOperacao := OPE_ESCAPE ;
         TEdit(WinFocus).Enabled := True ;
         ControlSetFocus(WinFocus) ;
         FormCheck := False ;
     End ;
     Exit ;
   End ;

//   FillAltKey() ;

   If ( FormNumAltKey <> 0 ) Then
   Begin
     SetLength(aKey,FormNumAltKey) ;
     For i:=0 To FormNumAltKey-1 Do
        aKey[i] := TEdit(FormVetAltKey[i]).Text ;
     Tab.SetKey(aKey) ;
     If ( Tab.Find(True) ) Then
     Begin
         Obj_SetCompsVisible(Self,-1,True) ;
				 FillForm(True) ;
         VarOperacao := OPE_ALTERACAO ;
         Obj_SetCompsEnable(Self,-2,False) ;
         ControlSetFocus(DataFocus) ;
         FormCheck := True ;
     End
     Else Begin
         Mens_MensInf('Record not found') ;
         VarOperacao := OPE_ESCAPE ;
         TEdit(WinFocus).Enabled := True ;
         ControlSetFocus(WinFocus) ;
         FormCheck := False ;
     End ;
     Exit ;
   End ;
*)
End ;

Procedure TFrmCadastro.Imprime ;
Begin
// ----- Imprimir
End ;

Function TFrmCadastro.Check : Boolean ;
Var
    i : Integer ;
    Comp, CompParent : TComponent ;
Begin
    Result := False ;
    FormOpeErro := True ;

    For i:=0 To Self.ComponentCount-1 Do
    Begin
       Comp := Self.Components[i] ;
       If ( Not (Comp Is TrsSuperEdit) ) Then
          Continue ;
       If ( Not TrsSuperEdit(Comp).CT_Test ) Then
          Continue ;
       CompParent := TPanel( TrsSuperEdit(Comp).Parent ).Parent ;
       Case TrsSuperEdit(Comp).Format Of
          foCurrency ,
          foReal     : Begin
             If ( (TrsSuperEdit(Comp).AsDouble < TrsSuperEdit(Comp).MinValue) Or
                  (TrsSuperEdit(Comp).AsDouble > TrsSuperEdit(Comp).MaxValue) ) Then
             Begin
                Mens_MensInf('Valor fora dos limites permitidos') ;
                TrsSuperEdit(Comp).SetFocus ;
                Exit ;
             End ;
          End ;
					foInteger  : Begin
             If ( (TrsSuperEdit(Comp).AsInteger < TrsSuperEdit(Comp).MinValue) Or
                  (TrsSuperEdit(Comp).AsInteger > TrsSuperEdit(Comp).MaxValue) ) Then
             Begin
                Mens_MensInf('Valor fora dos limites permitidos') ;
                TrsSuperEdit(Comp).SetFocus ;
                Exit ;
             End ;
          End ;
          foText     : Begin
             If ( TrsSuperEdit(Comp).CT_Search ) Then
             Begin
                If ( Not TrsSuperEdit(Comp).SeekGet() ) Then
                Begin
                    If ( CompParent Is TTabSheet ) Then
                       TPageControl( TTabSheet(CompParent).Parent ).ActivePage := TTabSheet(CompParent) ;
                    TrsSuperEdit(Comp).SetFocus ;
                    Mens_MensInf(TrsSuperEdit(Comp).CT_MensErro) ;
                    Exit ;
                End ;
             End ;
             If ( (TrsSuperEdit(Comp).MinValue = -1) And (TrsSuperEdit(Comp).MaxValue = -1) And
                  (Test_IsEmptyStr(TrsSuperEdit(Comp).Text)) ) Then
             Begin
								If ( CompParent Is TTabSheet ) Then
                   TPageControl( TTabSheet(CompParent).Parent ).ActivePage := TTabSheet(CompParent) ;
                TrsSuperEdit(Comp).SetFocus ;
                Mens_MensInf('Valor não pode ser nulo') ;
                Exit ;
             End ;
          End ;
       End ;
    End ;

    FormOpeErro := False ;

    Result := True ;
// ----- Check
End ;

procedure TFrmCadastro.ButNovoClick(Sender: TObject);
begin
   If ( Not Glob_GetAccess(FormOperacao,'I') ) Then
   Begin
       Mens_MensInf('Operação não liberada para o usuário') ;
       Exit ;
   End ;
   If ( VarOperacao <> OPE_INCLUSAO ) Then
       Novo
   Else
       Inclui ;
end;                        

procedure TFrmCadastro.ButAlterarClick(Sender: TObject);
begin
   If ( Not Glob_GetAccess(FormOperacao,'A') ) Then
   Begin
       Mens_MensInf('Operação não liberada para o usuário') ;
       Exit ;
   End ;
   If ( VarOperacao <> OPE_ALTERACAO ) Then
       Search
   Else
       Altera ;
end;

procedure TFrmCadastro.ButExcluirClick(Sender: TObject);
begin
   If ( Not Glob_GetAccess(FormOperacao,'E') ) Then
   Begin
       Mens_MensInf('Operação não liberada para o usuário') ;
       Exit ;
   End ;
   Delete ;
end;

procedure TFrmCadastro.ButImpClick(Sender: TObject);
begin
   If ( Not Glob_GetAccess(FormOperacao,'I') ) Then
   Begin
       Mens_MensInf('Operação não liberada para o usuário') ;
       Exit ;
   End ;
   Imprime ;
end;

procedure TFrmCadastro.ButPesquisarClick(Sender: TObject);
begin
   If ( Not Glob_GetAccess(FormOperacao,'C') ) Then
   Begin
       Mens_MensInf('Operação não liberada para o usuário') ;
       Exit ;
   End ;

   Search ;
{   If ( Not Test_IsEmptyStr(TEdit(WinFocus).Text) ) Then
   Begin
     SetLength(aKey,NumFields) ;
     For i:=0 To NumFields-1 Do
        aKey[i] := TEdit(aControlFld[i]).Text ;
     Tab.SetKey(aKey) ;
     If ( Tab.Find(True) ) Then
     Begin
         Obj_SetCompsVisible(Self,-1,True) ;
				 FillForm(True) ;
         VarOperacao := OPE_ALTERACAO ;
         Obj_SetCompsEnable(Self,-2,False) ;
         ControlSetFocus(DataFocus) ;
         ButNovo.Enabled:=false;
         //ButExcluir.Enabled:=false;
         ButPesquisar.Enabled:=false;
         ButImprimir.Enabled:=false;
         FormCheck := True ;
     End
     Else Begin
         Mens_MensInf('Record not found') ;
         VarOperacao := OPE_ESCAPE ;
         TEdit(WinFocus).Enabled := True ;
         ControlSetFocus(WinFocus) ;
         FormCheck := False ;
     End ;
     Exit ;
   End ;

   FillAltKey() ;
   If ( FormNumAltKey <> 0 ) Then
   Begin
     SetLength(aKey,FormNumAltKey) ;
		 For i:=0 To FormNumAltKey-1 Do
        aKey[i] := TEdit(FormVetAltKey[i]).Text ;
     Tab.SetKey(aKey) ;
     If ( Tab.Find(True) ) Then
     Begin
         Obj_SetCompsVisible(Self,-1,True) ;
         FillForm(True) ;
         VarOperacao := OPE_ALTERACAO ;
         Obj_SetCompsEnable(Self,-2,False) ;
         ControlSetFocus(DataFocus) ;
         FormCheck := True ;
     End
     Else Begin
         Mens_MensInf('Record not found') ;
         VarOperacao := OPE_ESCAPE ;
         TEdit(WinFocus).Enabled := True ;
         ControlSetFocus(WinFocus) ;
         FormCheck := False ;
     End ;
     Exit ;
   End ;

   Obj_SetCompsEnable(Self,-1,True) ;}
end;

procedure TFrmCadastro.ButVoltarClick(Sender: TObject);
begin
   Close ;
end;

Procedure TFrmCadastro.GetDesc ;
Var
   i : Integer ;
Begin
   // ----- GetDesc
   For i:=0 To Self.ComponentCount-1 Do
   Begin
       If ( Self.Components[i] Is TrsSuperEdit ) Then
       Begin
           If ( TrsSuperEdit(Self.Components[i]).CT_Search ) Then
           Begin
               TrsSuperEdit(Self.Components[i]).SeekGet() ;
           End ;
       End ;
   End ;
End ;

Procedure TFrmCadastro.FillForm ( bValues : Boolean ) ;
Begin
// ----- FillForm
   If ( bValues ) Then
   Begin
       Tab.SetFormObjValue(Nil,TAG_FIELD) ;
       Tab.SetFormObjValue(Nil,TAG_ALT_KEY) ;
       GetDesc ;
   End
   Else Begin
       Obj_SetCompsEmpty(Nil,0)
   End ;
End ;

procedure TFrmCadastro.TimerPerfilTimer(Sender: TObject);
begin
   If ( Tag = -1 ) Then
       Close ;
end;

procedure TFrmCadastro.ButSairClick(Sender: TObject);
begin
    If ( FormAlterou ) Then
    Begin
				If ( Mens_MensConf('Confirma sair sem Salvar ?') <> mrOk ) Then
           Exit ;
    End ;
   // EdiKeyValue.Text := TrsSuperEdit(WinFocus).Text ;
		Close ;
end;

Procedure TFrmCadastro.ShowFormByControl ( TypeForm : String ; C : TObject ) ;
Var
		F : TForm ;
Begin
(*
		F := Nil ;

		If ( TrsSuperEdit(C).CT_RetControl2 <> Nil ) Then
			 TEdit( TrsSuperEdit(C).CT_RetControl2 ).Text := '' ;

    If ( TypeForm = 'Categoria' ) Then
		Begin
			 F := TFrmCadCategoriaProduto.Create(Self) ;
			 F.Show;
			 TrsSuperEdit(C).Text := TFrmCadCategoriaProduto(F).EdiKeyValue.Text ;
		End;

    If ( TypeForm = 'Cliente' ) Then
		Begin
			 F := TFrmCadClientes.Create(Self) ;
			 F.Show ;
			 TrsSuperEdit(C).Text := TFrmCadClientes(F).EdiKeyValue.Text ;
		End;

    If ( TypeForm = 'ClienteContato' ) Then
		Begin
			 F := TFrmCadClientes.Create(Self) ;
       TFrmCadClientes(F).PgCPrincipal.ActivePage :=  TFrmCadClientes(F).TbSContatos;
       TFrmCadClientes(F).PgCPrincipal.OnChange(Self);
			 F.Show ;
			 TrsSuperEdit(C).Text := TFrmCadClientes(F).EdiKeyValue.Text ;
		End;

    If ( TypeForm = 'Telemarketing' ) Then
		Begin
			 F := TFrmCadTelemarketing.Create(Self) ;
			 F.Show ;
			 TrsSuperEdit(C).Text := TFrmCadTelemarketing(F).EdiKeyValue.Text ;
		End;

    If ( TypeForm = 'Revista' ) Then
		Begin
			 F := TFrmCadRevista.Create(Self) ;
			 F.Show ;
			 TrsSuperEdit(C).Text := TFrmCadRevista(F).EdiKeyValue.Text ;
		End;

    If ( TypeForm = 'Vendedor' ) Then
		Begin
			 F := TFrmCadVendedor.Create(Self) ;
			 F.Show ;
			 TrsSuperEdit(C).Text := TFrmCadVendedor(F).EdiKeyValue.Text ;
		End;

    If ( TypeForm = 'CondPgto' ) Then
		Begin
			 F := TFrmCadCond_Pagto.Create(Self) ;
			 F.Show ;
			 TrsSuperEdit(C).Text := TFrmCadCond_Pagto(F).EdiKeyValue.Text ;
		End;

    If ( TypeForm = 'Produto' ) Then
		Begin
			 F := TFrmCadProduto.Create(Self) ;
			 F.Show ;
			 TrsSuperEdit(C).Text := TFrmCadProduto(F).EdiKeyValue.Text ;
		End;

    If ( TypeForm = 'TipoAnuncio' ) Then
		Begin
			 F := TFrmCadTipo.Create(Self) ;
			 F.Show ;
			 TrsSuperEdit(C).Text := TFrmCadTipo(F).EdiKeyValue.Text ;
		End;

    If ( TypeForm = 'Espaco' ) Then
		Begin
			 F := TFrmCadEspaco.Create(Self) ;
			 F.Show ;
			 TrsSuperEdit(C).Text := TFrmCadEspaco(F).EdiKeyValue.Text ;
		End;

    If ( TypeForm = 'Concorrente' ) Then
		Begin
			 F := TFrmCadConcorrente.Create(Self) ;
			 F.Show ;
			 TrsSuperEdit(C).Text := TFrmCadConcorrente(F).EdiKeyValue.Text ;
		End;

    If ( TypeForm = 'Ocorrencia' ) Then
		Begin
			 F := TFrmCadOcorrencia.Create(Self) ;
			 F.Show ;
			 TrsSuperEdit(C).Text := TFrmCadOcorrencia(F).EdiKeyValue.Text ;
		End;

    If ( TypeForm = 'Assinante' ) Then
		Begin
			 F := TFrmCadAssinantes.Create(Self) ;
			 F.Show ;
			 TrsSuperEdit(C).Text := TFrmCadAssinantes(F).EdiKeyValue.Text ;
		End;

    If ( TypeForm = 'Atividade' ) Then
		Begin
			 F := TFrmCadAtividadeEmpresa.Create(Self) ;
			 F.Show ;
			 TrsSuperEdit(C).Text := TFrmCadAtividadeEmpresa(F).EdiKeyValue.Text ;
		End;

		If ( F = Nil ) Then
			 Exit ;

//		F.Close ;
//		F.Release ;
  *)
End ;

{
Retorna true se existe o registro na tabela
wTp  1 = Integer
		 2 = String
}
Function TFrmCadastro.VerChave(wC, wT, wV : String;wTp:Integer):Boolean;
var
	Tab:TFDQuery;
begin
	if VarOperacao <> 1 then
	begin
		Result:=false;
		Exit;
	end;
	Result:=true;
	try
		with Tab do
		begin
			Tab:=TFDQuery.Create(Self);
			Connection := DB_Conect.SQLConnection ;
			SQL.Clear;
			SQL.Add('Select '+wC+' from '+wT+' where '+wC+' = :P0 ');
			if wTP = 1 then
				Params[0].AsInteger:=StrToInt(wV);
			if wTP = 2 then
				Params[0].AsString:=wV;
			OPen;
			if RecordCount < 1 then
				Result:=False
			else
				ButAlterar.Enabled:=true;
			Close;
			Free;
		end;
	except
		Result:=false;
	end;
end;


procedure TFrmCadastro.ButCancelarClick(Sender: TObject);
begin
  Scape;
end;

procedure TFrmCadastro.ButSalvarClick(Sender: TObject);
begin
  If ( Not Glob_GetAccess(FormOperacao,'I') ) and ( Not Glob_GetAccess(FormOperacao,'A') ) Then
   Begin
       Mens_MensInf('Operação não liberada para o usuário') ;
       Exit ;
   End ;

   If ( VarOperacao = OPE_INCLUSAO ) Then
       Inclui ;
   If ( VarOperacao = OPE_ALTERACAO ) Then
       Altera ;
end;

procedure TFrmCadastro.ShowHints(Sender: TObject);
begin
    StatusBar.Panels[0].Text := Application.Hint;
end;



procedure TFrmCadastro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  LimpaTodosCamposLookup;
  Action := caFree;
  Self := NIL;
end;

procedure TFrmCadastro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = '''' then Key := '"' ;
end;

function TFrmCadastro.LastCodigo(Chave, Tab, Condicao: String): String;
var
  QryAux : TFDQuery;
begin
 Result := '';

 QryAux := TFDQuery.Create(Self);
 QryAux.Connection := DB_Conect.SQLConnection ;

  With qryAux do begin

    close;
    Sql.Clear;
    Sql.Add('select Max(' + Chave  +') from ' + Tab + ' '+ Condicao );    // condição usado pra gerar subcodigo
    Open;

    if not (Eof) and (Fields[0].AsString <> '') then
      Result :=  IntToStr( StrToInt(Fields[0].AsString) + 1 )
    else if Condicao <> '' then       // é um subcodigo
      Result := '000001'
    else
      Result := '001';                // não é subcodigo
  end;
  qryAux.Close;
 QryAux.Destroy;
end;

procedure TFrmCadastro.OnOffConf(Value: Boolean);
begin
   If ( Value ) Then
   Begin
      ButSalvar.Visible    := True ;
      ButCancelar.Visible  := True ;
      ButNovo.Visible      := False ;
      ButAlterar.Visible   := False ;
      ButExcluir.Visible   := False ;
      ButPesquisar.Visible := False ;
      ButImprimir.Visible  := False ;
      ButSair.Visible      := False ;
      ButNovo.Enabled      := False ;
      ButAlterar.Enabled   := False ;
      ButExcluir.Enabled   := False ;
      ButPesquisar.Enabled := False ;
      ButImprimir.Enabled  := False ;
      ButSair.Enabled      := False ;
   End
   Else Begin
      ButSalvar.Visible    := False ;
      ButCancelar.Visible  := False ;
      ButNovo.Visible      := True ;
      ButAlterar.Visible   := True ;
      ButExcluir.Visible   := True ;
      ButPesquisar.Visible := True ;
      ButImprimir.Visible  := True ;
      ButSair.Visible      := True ;
      ButNovo.Enabled      := True ;
      ButAlterar.Enabled   := True ;
      ButExcluir.Enabled   := True ;
      ButPesquisar.Enabled := True ;
      ButImprimir.Enabled  := True ;
      ButSair.Enabled      := True ;
      VarOperacao          := OPE_ESCAPE ;
   End ;
end;

function TFrmCadastro.dDataSql(Data: TDateTime): String;
var
  sData : String;
begin
  sData := DateToStr(Data);
  if Copy(sData, 1, 1) = ' ' then
     Result := '''NULL'''
  else
     Result := '''' + Copy(sData, 7, 4) + '-' + Copy(sData, 4, 2) + '-' + Copy(sData, 1, 2) + '''';
end;

procedure TFrmCadastro.GridExcel(Grid: TDBGrid; Consulta: TFDQuery);
var
coluna, linha: integer;
excel: variant;
valor: string;
begin
  try
    excel:=CreateOleObject('Excel.Application');
    excel.Workbooks.add(1);
  except
    Application.MessageBox ('Versão do Ms-Excel Incompatível','Erro',MB_OK+MB_ICONEXCLAMATION);
  end;

Grid.Columns[Grid.Columns.Count-1];

Consulta.First;
  try
    for linha:=0 to  Consulta.RecordCount-1 do
    begin
      for coluna:=1 to (Grid.Columns.Count-1) + 1 do // eliminei a coluna 0 da relação do Excel
      begin
        if (Grid.Fields[Coluna-1].DataType = ftFloat) then
          excel.cells [linha+2,coluna] := Grid.Fields[Coluna-1].AsFloat
        else if (Grid.Fields[Coluna-1].DataType = ftString) or (Grid.Fields[Coluna-1].Value = null) then
          excel.cells [linha+2,coluna] := Grid.Fields[Coluna-1].AsString
        else
          excel.cells [linha+2,coluna] := Grid.Fields[Coluna-1].Value;
      end;
      Consulta.Next;
    end;

    for coluna:=1 to (Grid.Columns.Count-1) + 1 do // eliminei a coluna 0 da relação do Excel
    begin
      valor := Grid.Columns[Coluna-1].Title.Caption;
      excel.cells[1,coluna]:= UpperCase(valor);
    end;
    excel.columns.AutoFit; // esta linha é para fazer com que o Excel dimencione as células adequadamente.
    excel.visible:=true;
  except
    Application.MessageBox ('Aconteceu um erro desconhecido durante a conversão'+
    'da tabela para o Ms-Excel','Erro',MB_OK+MB_ICONEXCLAMATION);
  end;

End;

Function  TFrmCadastro.SalvarCEP(CEP, Logradouro, Bairro, Cidade, UF: String) : Integer;
var
  QryAux : TFDQuery;
  varSQL : String;
  varRetorno : Integer;
begin

  varRetorno := 0;

  QryAux := TFDQuery.Create(Self);
  QryAux.Connection := DB_Conect.SQLConnection ;
  Try
    QryAux.close;
    QryAux.sql.clear;
    QryAux.sql.add('INSERT INTO CEP  ');
    QryAux.sql.add('       (Logradouro');
    QryAux.sql.add('       ,CEP ');
    QryAux.sql.add('       ,Bairro');
    QryAux.sql.add('       ,UF ');
    QryAux.sql.add('       ,Localidade) ');
    QryAux.sql.add(' VALUES  ');
    QryAux.sql.add('        (:Logradouro,  ');
    QryAux.sql.add('       :CEP,');
    QryAux.sql.add('       :Bairro, ');
    QryAux.sql.add('       :UF, ');
    QryAux.sql.add('       :Localidade)  ');
    QryAux.params.parambyname('Logradouro').AsString  := Logradouro;
    QryAux.params.parambyname('CEP').AsString         := CEP;
    QryAux.params.parambyname('Bairro').AsString      := Bairro;
    QryAux.params.parambyname('UF').AsString          := UF;
    QryAux.params.parambyname('Localidade').AsString  := Cidade;

    Try
       QryAux.ExecSQL;

         Try
         varSQL  := 'SELECT @@IDENTITY as IDCEP ';

         QryAux.Close;
         QryAux.SQL.Clear;
         QryAux.SQL.Add( varSQL );
         QryAux.Open;
         varRetorno := QryAux.FieldByName('IDCEP').AsInteger;

       except
         On E:Exception do
           begin
               raise Exception.Create('(' + E.Message + ') Erro ao Recuperar CEP ID : ');
            end;
       end;

    except
        on E: Exception do
      raise Exception.Create('(' + E.Message + ') Erro ao Salvar CEP: ');
    End;

    result :=  varRetorno;

  Finally
    FreeAndNil(QryAux);
  End;

end;

procedure TFrmCadastro.BuscaCEP(CEP: String; var Logradouro, Cidade,
  Bairro, UF, IDCEP : TrsSuperEdit);
var
  QryAux : TFDQuery;
begin

 // Cep := TiraChars(Trim(CEP));

  Logradouro.AsString := '';
  Cidade.AsString     := '';
  Bairro.AsString     := '';
  UF.AsString         := '';

  if Cep = '' then
    Exit;


  QryAux := TFDQuery.Create(Self);
  QryAux.Connection := DB_Conect.SQLConnection ;
  try
    With qryAux do
    begin
      Close;
      Sql.Clear;
      Sql.Add('select * from CEP where cep = ''' + Cep  + '''' );
      Open;

//      Logradouro.Enabled := ((IsEmpty) or  (Copy(Trim(Cep),6,3) = '000'));
//      Cidade.Enabled     := ((IsEmpty) or (Copy(Trim(Cep),6,3) = '000'));
//      Bairro.Enabled     := ((IsEmpty) or (Copy(Trim(Cep),6,3) = '000'));
//      CodCidade.Enabled  := ((IsEmpty) or (Copy(Trim(Cep),6,3) = '000'));

      if Not IsEmpty then
      begin
        Logradouro.AsString := Copy(FieldByName('Tipo').AsString + ' ' + FieldByName('Logradouro').AsString,1,50);
        Cidade.AsString     := Copy(FieldByName('Localidade').AsString,1,Cidade.MaxLength);
        Bairro.AsString     := Copy(FieldByName('Bairro').AsString,1,Bairro.MaxLength);
        UF.AsString         := Copy(FieldByName('UF').AsString,1,2);
        IDCEP.AsString      := Copy(FieldByName('IDCEP').AsString,1,25);
      end
      else
      begin
 {
        if Mens_MensConf('Cep Não Localizado ! Deseja pesquisar por parte do logradouro ? ') <> mrOk then
          Exit;
        SpeedButton4Click(Self);
  }
      end;
    end;
  Finally
    QryAux.Close;
    QryAux.Destroy;
  end;

end;

procedure TFrmCadastro.EmailOutlook(CodCliente, Assunto, Arquivo: String; var Gerado : Boolean);
var
  Outlook: OleVariant;
  vMailItem: variant;
  EmailPara, ComCopia : String;
  QryAux : TFDQuery;
begin

 Gerado := True;

 QryAux := TFDQuery.Create(Self);
 QryAux.Connection := DB_Conect.SQLConnection ;

 EmailPara := ''; ComCopia := '';

 try
   with qryAux do
   begin
     Close;
     Sql.Clear;
     Sql.Add('Select Email from Clientes ');
     Sql.Add('where CodCliente = ''' + CodCliente + '''' );
     Open;

     if (FieldbyName('Email').AsString = '')  then
     begin
       Gerado := False;
       Mens_MensInf('Cliente Sem E-mail Cadastrado !');
       Exit;
     end;

     EmailPara := Trim(FieldbyName('Email').AsString) ;

     ComCopia := '' ;
     Close;
   end;

   if (EmailPara = '') then
   begin
     Mens_MensInf('Cliente Sem E-mail Cadastrado !');
     Exit;
   end;

  try
    Outlook := GetActiveOleObject('Outlook.Application');
  except
    Outlook := CreateOleObject('Outlook.Application');
  end;


  vMailItem := Outlook.CreateItem(olMailItem);
  vMailItem.Recipients.Add(EmailPara);
  if ComCopia <> '' then
    vMailItem.Recipients.Add(ComCopia);
  vMailItem.Subject := Assunto;
  vMailItem.Body := ''; // corpo
  vMailItem.Attachments.Add(Arquivo); // arq anexo
  try
    vMailItem.Display;
  Except
  end;
//  vMailItem.Send;

  VarClear(Outlook) ;

  Finally
    QryAux.Close;
    QryAux.Destroy;
  end;
end;

function TFrmCadastro.CriarCamposLookup(L: TRxDBLookupCombo; TL, LF,
  LK: String): Boolean;
var
  TmpDts : TDataSource;
  TmpTab : TFDQuery;
  dspTab : TDataSetProvider;
  cdsTab : TClientDataSet;
  Campos : String;
begin
  Result:=true;
//  try
    try
      TmpTab :=  TFDQuery.Create(self);
      dspTab :=  TDataSetProvider.Create(Self);
      cdsTab :=  TClientDataSet.Create(Self);

      TmpTab.Connection := DB_Conect.SQLConnection ;              // Nome do database corrente
      dspTab.DataSet      := TmpTab;
      dspTab.Name         := 'dspTab';
      cdsTab.ProviderName := dspTab.Name;

      TmpDts :=  TDataSource.Create(self);
      TmpDts.DataSet := cdsTab;               // Origem dos dados

      with TmpTab do
      begin
        cdsTab.Close;
        SQL.Clear;                              // Inicia comandos SQL !!!
        Campos := LF;
        if POS(';', LF) > 0 then
        begin
          LF := Copy(LF,1, POS(';', LF)-1) + ',' + Copy(LF, POS(';', LF)+1, Length(LF));
          L.LookupDisplayIndex := 2 ;
        end;
        SQL.Add('Select '+LK+', '+LF+' from '+TL);    // PASSA COMANDO SQL PARA QUERY
        cdsTab.Open;                                   // Executa Query
  // aumentar tamanho da 1º coluna so lookup
  //      Fields[0].DisplayWidth := Fields[0].DisplayWidth + 8;
        L.LookupSource  := TmpDts     ;            // Adiciona Resultado da query ao COMBO
        L.LookupDisplay := Campos;                     // Indica campos a ser mostrado
        L.LookupField   := LK;                     // indica campo chave
        Exit;
      end;   // final => with...
    except
      Result:=false;
    end;        // final => try...except
{  Finally
    TmpTab.Free;
    dspTab.Free;
    cdsTab.Free;
    TmpDts.Free;
  end;
}
end;

function TFrmCadastro.Tabela_Preco(Produto: TrsSuperEdit): Double;
var
  QryAux : TFDQuery;
begin
 Result := 0;

 if Produto.AsString = '' then
   Exit;

 Try
   QryAux := TFDQuery.Create(Self);
   QryAux.Connection := DB_Conect.SQLConnection ;

    With qryAux do
    begin
      close;
      Sql.Clear;
      Sql.Add('select IsNull(VlrUnitario,0) as VlrUnitario  ');
      Sql.Add('From Produtos p, Grupo g, Tabela_Preco t ');
      Sql.Add('Where 	p.CodGrupo = g.CodGrupo and ');
      Sql.Add('p.CodProduto = t.CodProduto ');
      Sql.Add('and p.CodProdInterno = ' + QuotedStr(Produto.AsString) );
      Open;

      Result :=  Fields[0].AsFloat;
    end;
 Finally
   qryAux.Close;
   QryAux.Destroy;
 End;

end;

procedure TFrmCadastro.CentralizaPainel(Painel: TPanel; Status: boolean);
begin
  Painel.top     := (self.Height div 2) - (Painel.height div 2);
  Painel.left    := (self.Width div 2) - (Painel.width div 2);
  Painel.Visible := Status;
end;

function TFrmCadastro.UF_Empresa(Empresa: String): String;
var
  QryAux : TFDQuery;
begin
 Result := '';

 if Empresa = '' then
   Exit;

 Try
   QryAux := TFDQuery.Create(Self);
   QryAux.Connection := DB_Conect.SQLConnection ;

    With qryAux do
    begin
      close;
      Sql.Clear;
      Sql.Add('select Estado ');
      Sql.Add('From Filial ');
      Sql.Add('Where 	CodFilial =  ' + QuotedStr(Empresa) );
      Open;

      Result :=  Fields[0].AsString;
    end;
 Finally
   qryAux.Close;
   QryAux.Destroy;
 End;

end;

end.


