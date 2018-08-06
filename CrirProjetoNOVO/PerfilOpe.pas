unit PerfilOpe ;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, ToolWin, ExtCtrls, rsEdit, Mask, CheckLst,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint, cxButtons, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmPerfilOpe = class(TForm)
    PanFundo: TPanel;
    ComPerfilCod: TComboBox;
    ListOpePer: TListBox;
    ListPerOpe: TCheckListBox;
    ListCodOpe: TListBox;
    GroManut: TGroupBox;
    cheInclusao: TCheckBox;
    cheAlteracao: TCheckBox;
    cheExclusao: TCheckBox;
    cheConsulta: TCheckBox;
    cheTodos: TCheckBox;
    ListOpeManut: TListBox;
    TimerPerfil: TTimer;
    ToolBar: TToolBar;
    Panel2: TPanel;
    Panel1: TPanel;
    ComPerfilDes: TComboBox;
    ButOK: TcxButton;
    ButCancelar: TcxButton;
    procedure ButCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComPerfilDesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ListPerOpeClickCheck(Sender: TObject);
    procedure ButOkClick(Sender: TObject);
    procedure ListPerOpeClick(Sender: TObject);
    procedure cheInclusaoClick(Sender: TObject);
    procedure TimerPerfilTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure Scape ;
  end;

var
  FrmPerfilOpe: TFrmPerfilOpe;

implementation

{$R *.DFM}

Uses
   Global, ObjFun, MensFun, TestFun, ConsTabFun, SqlTableFun, StrFun ;

Var
    Tab : TSQLTableClass ;
    FormMudou : Boolean ;
    FormManut : String ;
    FormOpePer : Integer ;

Procedure TFrmPerfilOpe.Scape ;
Begin
   Close ;
End ;

procedure TFrmPerfilOpe.ButCancelClick(Sender: TObject);
begin
   Close ;
end;

procedure TFrmPerfilOpe.FormShow(Sender: TObject);
begin
   If ( Not Tab.OpenTable('Perfil_Operacao') ) Then
       Mens_MensErro(Tab.GetMensErro) ;
   If ( Not Tab.SetFieldKey('CodPerfil') ) Then
   Begin
       Mens_MensErro(Tab.GetMensErro) ;
   End ;

   Obj_FillCombo(ComPerfilDes,'Select CodPerfil, Descricao  From Perfil order by CodPerfil') ;
   Obj_FillCombo(ComPerfilCod,'Select CodPerfil From Perfil order by CodPerfil') ;

   TimerPerfil.Enabled := True ;

   WindowState := wsMaximized;
end;

procedure TFrmPerfilOpe.FormCreate(Sender: TObject);
begin
   Tab    := TSQLTableClass.Create ;
   Top  := 0;
   Left := 0;
end;

procedure TFrmPerfilOpe.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Self := NIL;
end;

procedure TFrmPerfilOpe.ComPerfilDesChange(Sender: TObject);
Var
   CodPer, Operacao : String ;
   i, k : Integer ;
   bAchou : Boolean ;
   QManut : TFDQuery ;
begin

   ComPerfilCod.ItemIndex := ComPerfilDes.ItemIndex ;
   CodPer := Str_LRTrim(ComPerfilCod.Text) ;
   Obj_FillList(ListOpePer,'Select CodOperacao From Perfil_Operacao ' +
                           'Where CodPerfil =  ''' + CodPer + ''' Order by CodOperacao') ;
   Obj_FillList(TListBox(ListPerOpe),'Select Descricao From Operacao order by Grupo, ItemGrupo') ;
   Obj_FillList(ListCodOpe,'Select CodOperacao, Descricao From Operacao order by Grupo, ItemGrupo') ;

   For i:=0 To ListPerOpe.Items.Count-1 Do
   Begin
       Operacao := ListCodOpe.Items[i] ;
       bAchou := False ;
       For k:=0 To ListOpePer.Items.Count-1 Do
           If ( Operacao = ListOpePer.Items[k] ) Then
           Begin
               bAchou := True ;
               Break ;
           End ;
       If ( bAchou ) Then
           ListPerOpe.Checked[i] := True ;
   End ;

   ListOpeManut.Clear ;
   For i:=0 To ListPerOpe.Items.Count-1 Do
   Begin
       QManut := Tab.ExecSqlSel('Select Manut From Perfil_Operacao Where ' +
                               'CodPerfil = ''' + CodPer + ''' And CodOperacao = ''' + ListCodOpe.Items[i] + '''') ;
       If ( QManut.Eof ) Then
           ListOpeManut.Items.Add('T') 
       Else
           ListOpeManut.Items.Add(QManut.Fields[0].AsString) ;
   End ;

   FormMudou := False ;
   FormManut := '' ;
   FormOpePer := -1 ;

   GroManut.Visible := False ;
end;

procedure TFrmPerfilOpe.ListPerOpeClickCheck(Sender: TObject);
begin
   FormMudou := True ;
   ListPerOpeClick(Self);
end;

procedure TFrmPerfilOpe.ListPerOpeClick(Sender: TObject);
Var
   Manut : String ;
begin
   FormOpePer := ListPerOpe.ItemIndex ;
   If ( Not ListPerOpe.Checked[FormOpePer] ) Then
   Begin
       GroManut.Visible := False ;
       cheInclusao.Checked := False ;
       cheAlteracao.Checked := False ;
       cheExclusao.Checked := False ;
       cheConsulta.Checked := False ;
       cheTodos.Checked := False ;
       Exit ;
   End
   Else
       GroManut.Visible := True ;
   If ( FormOpePer > ListOpeManut.Items.Count-1 ) Then
       Manut := 'T'
   Else
       Manut := ListOpeManut.Items[FormOpePer] ;
   FormManut := '' ;
   cheInclusao.Checked := False ;
   cheAlteracao.Checked := False ;
   cheExclusao.Checked := False ;
   cheConsulta.Checked := False ;
   cheTodos.Checked := False ;
   If ( Pos('I',Manut) <> 0 ) Then
       cheInclusao.Checked := True ;
   If ( Pos('A',Manut) <> 0 ) Then
       chealteracao.Checked := True ;
   If ( Pos('E',Manut) <> 0 ) Then
       cheExclusao.Checked := True ;
   If ( Pos('C',Manut) <> 0 ) Then
       cheConsulta.Checked := True ;
   If ( Pos('T',Manut) <> 0 ) Then
       cheTodos.Checked := True ;
end;

procedure TFrmPerfilOpe.cheInclusaoClick(Sender: TObject);
Var
   bChecked : Boolean ;
   k : Integer ;
begin
   FormMudou := True ;
   bChecked := TCheckBox(Sender).Checked ;
   If ( bChecked ) Then
   Begin
       Case TCheckBox(Sender).Tag Of
           1 : If ( Pos('I',FormManut) = 0 ) Then
                  FormManut := FormManut + 'I' ;
           2 : If ( Pos('A',FormManut) = 0 ) Then
                  FormManut := FormManut + 'A' ;
           3 : If ( Pos('E',FormManut) = 0 ) Then
                  FormManut := FormManut + 'E' ;
           4 : If ( Pos('C',FormManut) = 0 ) Then
                  FormManut := FormManut + 'C' ;
           5 : If ( Pos('1',FormManut) = 0 ) Then
                  FormManut := FormManut + '1' ;
           6 : If ( Pos('2',FormManut) = 0 ) Then
                  FormManut := FormManut + '2' ;
           7 : If ( Pos('3',FormManut) = 0 ) Then
                  FormManut := FormManut + '3' ;
           8 : If ( Pos('T',FormManut) = 0 ) Then
                  FormManut := FormManut + 'T' ;
       End ;
   End
   Else Begin
       k := -1 ;
       Case TCheckBox(Sender).Tag Of
           1 : k := Pos('I',FormManut) ;
           2 : k := Pos('A',FormManut) ;
           3 : k := Pos('E',FormManut) ;
           4 : k := Pos('C',FormManut) ;
           5 : k := Pos('1',FormManut) ;
           6 : k := Pos('2',FormManut) ;
           7 : k := Pos('3',FormManut) ;
           8 : k := Pos('T',FormManut) ;
       End ;
       If ( k <> 0 ) Then
           FormManut[k] := ' ' ;
   End ;
   If ( FormOpePer <> -1 ) Then
       ListOpeManut.Items[FormOpePer] := FormManut ;
   If ( (TCheckBox(Sender).Tag = 8) And (TCheckBox(Sender).Checked) ) Then
   Begin
       cheInclusao.Checked := False ;
       chealteracao.Checked := False ;
       cheExclusao.Checked := False ;
       cheConsulta.Checked := False ;
   End ;
   If ( (TCheckBox(Sender).Tag <> 8) And (TCheckBox(Sender).Checked) ) Then
       cheTodos.Checked := False ;
end;

procedure TFrmPerfilOpe.ButOkClick(Sender: TObject);
Var
   i : Integer ;
   Sql : String ;
   bOk : Boolean ;
begin
   If ( Not FormMudou ) Then
       Exit ;
   Sql := 'Delete From Perfil_Operacao Where CodPerfil = ''' + Str_LRTrim(ComPerfilCod.Text) + '''' ;
   Tab.ExecSql(Sql) ;
   If ( Tab.GetError ) Then
   Begin
       Mens_MensErro(Tab.GetMensErro) ;
       Exit ;
   End ;
   bOk := True ;
   For i:=0 To ListPerOpe.Items.Count-1 Do
   Begin
       If ( ListPerOpe.Checked[i] ) Then
       Begin
           Tab.SetFieldValue('CodPerfil',ComPerfilCod.Text) ;
           Tab.SetFieldValue('CodOperacao',ListCodOpe.Items[i]) ;
           Tab.SetFieldValue('Manut',Str_LRTrim(ListOpeManut.Items[i])) ;
           If ( Not Tab.Insert ) Then
           Begin
               bOk := False ;
               Break ;
           End ;
       End ;
   End ;
   If ( Not bOk ) Then
       Mens_MensErro(Tab.GetMensErro)
   Else Begin
       Obj_FillList(ListOpePer,'Select CodOperacao From Perfil_Operacao ' +
                               'Where CodPerfil = ''' + ComPerfilCod.Text + ''' Order by CodOperacao') ;
       Mens_MensInf('Operações do perfil alteradas com sucesso') ;
   End ;
end;



procedure TFrmPerfilOpe.TimerPerfilTimer(Sender: TObject);
begin
   If ( Tag = -1 ) Then
       Close ;
end;

procedure TFrmPerfilOpe.FormActivate(Sender: TObject);
begin
   If ( Not Glob_GetAccess('SIS_PERFIL_OPER','') ) Then
   Begin
       Mens_MensInf('Operação não liberada para o usuário') ;
       Tag := -1 ;
       TimerPerfil.Enabled := True ;
   End

end;

procedure TFrmPerfilOpe.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then Close;
end;

end.

