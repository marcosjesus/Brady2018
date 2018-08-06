unit uUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxSkinsdxStatusBarPainter, Vcl.Menus, dxSkinscxPCPainter, dxBarBuiltInMenu,
  Data.FMTBcd, Data.DB, Data.SqlExpr, Vcl.ExtCtrls, Vcl.StdCtrls, cxPC,
  cxButtons, dxStatusBar, Vcl.Imaging.jpeg, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid;

type
  TfrmCadUsuario = class(TForm)
    PanFundo: TPanel;
    PanTitulo: TPanel;
    ImaBarraSup: TImage;
    LabCadTit: TLabel;
    EdiDatabaseName: TEdit;
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
    PageControl1: TcxPageControl;
    TabConsulta: TcxTabSheet;
    TimerPerfil: TTimer;
    TabManut: TcxTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    chkAltSenha: TCheckBox;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    sqlConsulta: TFDQuery;
    dsConsulta: TDataSource;
    sqlConsultaNome: TStringField;
    cxGrid1DBTableView1Nome: TcxGridDBColumn;
    edtNome: TEdit;
    EdtSenha: TEdit;
    edtCodigo: TEdit;
    sqlConsultaID_Usuarios: TFDAutoIncField;
    sqlConsultaSenha: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButSalvarClick(Sender: TObject);
    procedure ButNovoClick(Sender: TObject);
    procedure ButExcluirClick(Sender: TObject);
    procedure ButAlterarClick(Sender: TObject);
    procedure ButSairClick(Sender: TObject);
  private

    procedure BotoesOnOff(Bt: String);
    procedure Inclui;
    procedure Altera;
    function Check: Boolean;
    procedure Scape;
    function ProximoRegistro: Integer;
    { Private declarations }
  public
      VarOperacao : Byte ;
    { Public declarations }
  end;

var
  frmCadUsuario: TfrmCadUsuario;

Const

   OPE_ESCAPE    = 0 ;
   OPE_INCLUSAO  = 1 ;
   OPE_ALTERACAO = 2 ;
   OPE_EXCLUSAO  = 3 ;
   OPE_CONSULTA  = 4 ;

implementation

{$R *.dfm}

uses DBConect;

procedure TfrmCadUsuario.ButAlterarClick(Sender: TObject);
begin
   PageControl1.ActivePage := TabManut;
   VarOperacao := OPE_ALTERACAO;
   edtCodigo.Text := sqlConsulta.FieldByName('ID_Usuarios').AsString;
   edtNome.Text   := sqlConsulta.FieldByName('Nome').AsString;
   EdtSenha.Text  := sqlConsulta.FieldByName('Senha').AsString;
   BotoesOnOff('FFFFFFTT');
end;

procedure TfrmCadUsuario.ButCancelarClick(Sender: TObject);
begin
   sqlConsulta.Close;
   sqlConsulta.Open;
   edtCodigo.Clear;
   edtNome.Clear;
   EdtSenha.Clear;
   PageControl1.ActivePage := TabConsulta;
   Scape;
end;

procedure TfrmCadUsuario.ButExcluirClick(Sender: TObject);
var
 sqlAux : TFDQuery;
 iRegistro : Integer;
begin

  if Application.MessageBox( pChar('Deseja excluir o usuário?' + sqlConsulta.FieldByName('Nome').AsString) , 'Salvar', mb_iconquestion + mb_yesno) = idYes then
  begin
     sqlAux := TFDQuery.Create(Nil);
     Try
       sqlAux.Connection := DB_Conect.FDConnection;
       sqlAux.Close;
       sqlAux.SQL.Clear;
       sqlAux.SQL.Add('Delete From Usuarios where Id_Usuarios = :Id_Usuarios');
       sqlAux.Params.ParamByName('Id_Usuarios').AsString := sqlConsulta.FieldByName('Id_Usuarios').AsString;
       sqlAux.ExecSQL;
       sqlConsulta.Close;
       sqlConsulta.Open;
       PageControl1.ActivePage := TabConsulta;
     Finally
       FreeAndNil(sqlAux);
     End;
  end;
   VarOperacao := OPE_ESCAPE;
end;

procedure TfrmCadUsuario.ButNovoClick(Sender: TObject);
begin
   VarOperacao := OPE_INCLUSAO ;
   PageControl1.ActivePage := TabManut;
   edtCodigo.Text := IntToStr(ProximoRegistro);
   BotoesOnOff('FFFFFFTT');
end;

function TfrmCadUsuario.ProximoRegistro : Integer;
var
 sqlAux : TFDQuery;
 iRegistro : Integer;
begin
   sqlAux := TFDQuery.Create(Nil);
   Try
     sqlAux.Connection := DB_Conect.FDConnection;
     sqlAux.Close;
     sqlAux.SQL.Clear;
     sqlAux.SQL.Add('Select Max(Id_Usuarios) + 1 as Registro From Usuarios');
     sqlAux.Open;
     Result :=  sqlAux.FieldByName('Registro').AsInteger;
   Finally
     FreeAndNil(sqlAux);
   End;
end;

procedure TfrmCadUsuario.ButSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadUsuario.ButSalvarClick(Sender: TObject);
begin

   if Check then
   begin

       If ( VarOperacao = OPE_INCLUSAO ) Then
           Inclui ;

       If ( VarOperacao = OPE_ALTERACAO ) Then
           Altera ;

       edtCodigo.Clear;
       edtNome.Clear;
       EdtSenha.Clear;
       PageControl1.ActivePage := TabConsulta;
       sqlConsulta.Close;
       sqlConsulta.Open;

   end;
end;

Procedure TfrmCadUsuario.Inclui ;
Var
   sqlAux : TFDQuery;
Begin

   sqlAux := TFDQuery.Create(Nil);
   Try
     sqlAux.Connection := DB_Conect.FDConnection;
     sqlAux.Close;
     sqlAux.SQL.Clear;
     sqlAux.SQL.Add('Insert Into Usuarios (Nome, Senha) Values (:Nome, :Senha)');
     sqlAux.ParamByName('Nome').AsString := edtNome.Text;
     sqlAux.ParamByName('Senha').AsString := EdtSenha.Text;

     Try
        sqlAux.ExecSQL;
     Except
       on E: Exception do
        begin
         Application.MessageBox( PWideChar(E.Message), 'Salvar Usuario', mb_iconinformation + mb_ok );
         Exit;
        end;
     End;
   Finally
     FreeAndNil(sqlAux);
   End;

   BotoesOnOff('TTFTTTFF');
   VarOperacao := OPE_ESCAPE ;

end;

Procedure TfrmCadUsuario.Altera ;
Var
   sqlAux : TFDQuery;
Begin

   sqlAux := TFDQuery.Create(Nil);
   Try
     sqlAux.Connection := DB_Conect.FDConnection;
     sqlAux.Close;
     sqlAux.SQL.Clear;
     sqlAux.SQL.Add('Update Usuarios Set Nome = :Nome, Senha = :Senha Where ID_Usuarios = :ID_Usuarios');

     sqlAux.ParamByName('Nome').AsString         := edtNome.Text;
     sqlAux.ParamByName('Senha').AsString        := EdtSenha.Text;
     sqlAux.ParamByName('ID_Usuarios').AsString  := edtCodigo.Text;

     Try
        sqlAux.ExecSQL;
     Except
       on E: Exception do
        begin
         Application.MessageBox( PWideChar(E.Message), 'Alterar Usuario', mb_iconinformation + mb_ok );
         Exit;
        end;
     End;
   Finally
     FreeAndNil(sqlAux);
   End;

   BotoesOnOff('TTFTTTFF');
   VarOperacao := OPE_ESCAPE ;

   
end;

Function TfrmCadUsuario.Check : Boolean ;
Begin
    Result := False ;

    if edtNome.Text = '' then
    begin
      Application.MessageBox( 'Informe o campo Nome', 'Campo Nome', mb_iconinformation + mb_ok );
      edtNome.SetFocus;
      Exit;
    end;

    if EdtSenha.Text = '' then
    begin
      Application.MessageBox( 'Informe o campo Senha', 'Campo Senha', mb_iconinformation + mb_ok );
      EdtSenha.SetFocus;
      Exit;
    end;

    Result := True ;
// ----- Check
End ;


Procedure TfrmCadUsuario.Scape ;
Var
   i : Integer ;
Begin
{
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
 }
   BotoesOnOff('TTFTTTFF');
   VarOperacao := OPE_ESCAPE ;

End ;

procedure TfrmCadUsuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Self := NIL;
end;

procedure TfrmCadUsuario.FormShow(Sender: TObject);
begin
   PageControl1.ActivePage := TabConsulta;
   sqlConsulta.Close;
   sqlConsulta.Open;

   BotoesOnOff('TTFTTTFF');
end;

procedure TfrmCadUsuario.BotoesOnOff(Bt:String);
begin
{  if FrmCadastro.Permissao > 2 then
     ButNovo.Enabled    := Copy(Bt,1,1) = 'T' ;

  if FrmCadastro.Permissao > 3 then
     ButExcluir.Enabled := Copy(Bt,3,1) = 'T' ;
}
  ButNovo.Enabled      := Copy(Bt,1,1) = 'T' ;
  ButExcluir.Enabled   := not sqlConsulta.IsEmpty;
  ButAlterar.Enabled   := Copy(Bt,2,1) = 'T' ;
  ButPesquisar.Enabled := Copy(Bt,4,1) = 'T' ;
  ButImprimir.Enabled  := Copy(Bt,5,1) = 'T' ;
  ButSair.Enabled      := Copy(Bt,6,1) = 'T' ;
  ButCancelar.Visible  := Copy(Bt,7,1) = 'T' ;
  ButSalvar.Visible    := Copy(Bt,8,1) = 'T' ;
end;


end.
