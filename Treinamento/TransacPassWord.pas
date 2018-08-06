unit TransacPassWord;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  rsFlyovr, Mask, StdCtrls, rsEdit, ExtCtrls, Db, DBTables, Menus,
  cxLookAndFeelPainters, cxButtons, cxGraphics, cxLookAndFeels, FMTBcd,
  cxControls, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, cxGroupBox, SqlExpr;

type
  TFrmTransacPassWord = class(TForm)
    Panel1: TPanel;
    QUsu: TSqlQuery;
    ButEnter: TButton;
    cxGroupBox1: TcxGroupBox;
    Panel2: TPanel;
    EdiUsuario: TrsSuperEdit;
    Panel3: TPanel;
    EdiSenha: TMaskEdit;
    ButOK: TcxButton;
    ButCancelar: TcxButton;
    procedure ButCancelarClick(Sender: TObject);
    procedure ButOkClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdiSenhaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    FormOk : Boolean ;
    FormTransac : String ;
    FormOldUsuario : String ;
    FormKeyEnterAMais : Boolean ;
  end;

Function GetTransacPermission ( pTransac : String ) : Boolean ; Export ;

var
  FrmTransacPassWord: TFrmTransacPassWord;

implementation

{$R *.DFM}

Uses
   StrFun, MensFun, Global, ConstKey ;

Function GetTransacPermission ( pTransac : String ) : Boolean ;
Begin
   Result := False ;
   FrmTransacPassWord := TFrmTransacPassWord.Create ( Application );
   FrmTransacPassWord.FormOk := False ;
   FrmTransacPassWord.FormTransac := pTransac ;
   FrmTransacPassWord.FormOldUsuario := GUsuario ;
   FrmTransacPassWord.FormKeyEnterAMais := False ;
   FrmTransacPassWord.ShowModal ;
   If ( FrmTransacPassWord.FormOk ) Then
      Result := True else Result := False ;
   FrmTransacPassWord.Close ;
   FrmTransacPassWord.Free ;
End ;

procedure TFrmTransacPassWord.ButCancelarClick(Sender: TObject);
begin
   Glob_FillPerfil(FormOldUsuario) ;
   Close ;
end;

procedure TFrmTransacPassWord.ButOkClick(Sender: TObject);
begin

   With QUsu Do
   Begin

      Close ;
      Sql.Clear ;
      Sql.Add('Select CodUsuario, Senha, Nome From usuario Where CodUsuario = ''' + EdiUsuario.Text + '''') ;
      Try
         QUsu.Open ;
      Except
         On E:Exception Do
         Begin
            Mens_MensErro(E.Message) ;
            Exit ;
         End ;
      End;

      If ( QUsu.Eof ) Then
      Begin
         Mens_MensInf('Usuário não cadastrado') ;
         EdiUsuario.SetFocus ;
         Exit ;
      End ;

        If ( EdiSenha.Text ) <> QUsu.FieldByName('Senha').AsString  Then
        Begin
            Mens_MensInf('Senha do usuário inválida') ;
            EdiSenha.Text := '' ;
            EdiSenha.SetFocus ;
            Exit ;
        End ;

      If ( Not Glob_FillPerfil(QUsu.FieldByName('CodUsuario').AsString) ) Then
      Begin
         Mens_MensInf('Não foi possível obter-se o perfil do usuário') ;
         Exit ;
      End ;

      If ( Not Glob_GetAccess(FormTransac) ) Then
      Begin
         Mens_MensInf('Transação não liberada para este usuário') ;
         EdiUsuario.SetFocus ;
         Exit ;
      End ;

      FormOk := True ;
      Glob_FillPerfil(FormOldUsuario) ;

   End;

   Close ;

end;

procedure TFrmTransacPassWord.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   Case Key Of
       KEY_ENTER : Begin
         If ( Shift = ([ssAlt]) ) Then     // Alt + Enter
            ButOkClick(Self) ;
       End ;
       KEY_ESC : Begin
         ButCancelarClick(Self) ;
       End ;
   End ;
end;

procedure TFrmTransacPassWord.EdiSenhaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   If ( Not FormKeyEnterAMais ) Then
   Begin
      FormKeyEnterAMais := True ;
      Exit ;
   End ;
   If ( (Key = KEY_ENTER) And (Screen.ActiveControl.Name = 'EdiSenha') ) Then
      ButOkClick(Self) ;
   FormKeyEnterAMais := False ;
end;

end.
