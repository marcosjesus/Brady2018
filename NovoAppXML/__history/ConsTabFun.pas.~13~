unit ConsTabFun;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, Mask, DBCtrls, DB, DBTables,
  ComCtrls, cxStyles, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxContainer, cxLabel, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox,
  cxGroupBox, Menus, cxLookAndFeelPainters, cxButtons, jpeg, cxLookAndFeels,
  dxSkinBlack, dxSkinBlue, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2010Black, dxSkinOffice2010Blue, FMTBcd,
   Provider, DBClient, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, cxNavigator,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFormConsTab = class(TForm)
    PanFundo: TPanel;
    EdiCodigo: TEdit;
    TableView: TcxGridDBTableView;
    GridLevel1: TcxGridLevel;
    Grid: TcxGrid;
    ableViewColumn1: TcxGridDBColumn;
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    EdiPesq: TcxTextEdit;
    cmbCampo: TcxComboBox;
    cxbutPesquisar: TcxButton;
    ButOk: TcxButton;
    ButCancelar: TcxButton;
    Panel1: TPanel;
    LabTitulo: TcxLabel;
    PanLinha: TPanel;
    Image2: TImage;
    Ds: TDataSource;
    cdsCons: TClientDataSet;
    dspCons: TDataSetProvider;
    QCons: TFDQuery;
    procedure FormShow(Sender: TObject);
    procedure ButOkClick(Sender: TObject);
    procedure GridColEnter(Sender: TObject);
    procedure EdiPesqKeyPress(Sender: TObject; var Key: Char);
    procedure GridTitleClick(Column: TColumn);
    procedure GridKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ButCancelarClick(Sender: TObject);
    procedure cxbutPesquisarClick(Sender: TObject);
    procedure EdiPesqKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TableViewKeyPress(Sender: TObject; var Key: Char);
   private
    { Private declarations }
  public
    { Public declarations }
    Procedure SetGrid ;
    Function GetFieldName ( pField : String ) : String ;
  end;

Function ConsTab_Show ( F : TForm ;                   // -> Formulário original
                        Title : String ;               // -> Título da consulta
                        TableName : String ;           // -> Nome da tabela
                        aFields : Array Of String ;    // -> Array dos campos
                        aTitles : Array Of String ;    // -> Array dos títulos das colunas
                        RetField : Integer = 0 ;       // -> Campo para retorno
                        RetComp : TWinControl = Nil ;  // -> Controle a receber o retorno
                        RetField2 : Integer = 0 ;      // -> Segundo campo para retorno
                        RetComp2 : TWinControl = Nil ; // -> Segundo controle p/ retorno
                        Sql : String = '' ;            // -> Sql de pesquisa
                        DBName : String = ''           // -> DatabaseName
                      ) : Integer ; Export ;


Procedure ConsTab_SetDBName ( Value : String ) ; Export ;

Function GetSqlSelect : String  ; Export ;

Function ConsTab_GetQCons : TFDQuery ; Export ;

var
  FormConsTab: TFormConsTab;


implementation

{$R *.DFM}

Uses

   DBConect, rsFlyovr, rsEdit, MensFun ;


Const

   TYPE_EDIT   = 1 ;
   TYPE_LABEL  = 2 ;
   TYPE_COMBO  = 3 ;
   TYPE_MASK   = 4 ;
   TYPE_SEDIT  = 5 ;
   TYPE_GNEDIT = 6 ;

Var
   VarForm  : TForm ;
   VarComp  : TWinControl ;
   VarComp2 : TWinControl ;
   VarType  : Integer ;
   VarType2 : Integer ;
   VarTop, VarLeft, VarWidth, VarHeight : Integer ;
   VarSql   : String ;
   VarOrder : Integer ;

   VarDBName, VarTableName : String ;
   VarFields, VarTitles  : Array of String ;
   VarNumFields : Integer ;
   VarRetField  : Integer ;
   VarRetField2 : Integer ;
   VarColWid : Array Of Integer ;
   VarFind : String ;

Function ConsTab_Show ( F : TForm ;                    // -> Formulário original
                        Title : String ;               // -> Título da consulta
                        TableName : String ;           // -> Nome da tabela
                        aFields : Array Of String ;    // -> Array dos campos
                        aTitles : Array Of String ;    // -> Array dos títulos das colunas
                        RetField : Integer = 0 ;       // -> Campo para retorno
                        RetComp : TWinControl = Nil ;  // -> Controle a receber o retorno
                        RetField2 : Integer = 0 ;      // -> Segundo campo para retorno
                        RetComp2 : TWinControl = Nil ; // -> Segundo controle p/ retorno
                        Sql : String = '' ;            // -> Sql de pesquisa
                        DBName : String = ''           // -> DatabaseName
                      ) : Integer ;
Var
  i : Integer ;
Begin

   VarForm  := F ;
   VarSql   := Sql ;

   If ( RetComp = Nil ) Then
       VarComp := F.ActiveControl
   Else
       VarComp := RetComp ;

   If ( VarComp Is TEdit ) Then
       VarType := TYPE_EDIT
   Else If ( VarComp Is TMaskEdit ) Then
       VarType := TYPE_MASK
   Else If ( VarComp Is TrsSuperEdit ) Then
       VarType := TYPE_SEDIT ;

   VarComp2 := RetComp2 ;
   If ( VarComp2 Is TEdit ) Then
       VarType2 := TYPE_EDIT
   Else If ( VarComp2 Is TMaskEdit ) Then
       VarType2 := TYPE_MASK
   Else If ( VarComp2 Is TrsSuperEdit ) Then
       VarType2 := TYPE_SEDIT ;
   VarRetField2 := RetField2 ;

{
   Case VarType Of
       TYPE_EDIT : Begin
           T := (VarComp As TEdit).Top ;
           L := (VarComp As TEdit).Left ;
           H := (VarComp As TEdit).Height ;
       End ;
       TYPE_MASK : Begin
           T := (VarComp As TMaskEdit).Top ;
           L := (VarComp As TMaskEdit).Left ;
           H := (VarComp As TMaskEdit).Height ;
       End ;
       TYPE_SEDIT : Begin
           T := (VarComp As TrsSuperEdit).Top ;
           L := (VarComp As TrsSuperEdit).Left ;
           H := (VarComp As TrsSuperEdit).Height ;
       End ;
       Else
           T := 0 ;
           L := 0 ;
           H := 0 ;
   End ;

   VarTop    := F.Top + T + H + 25 ;
   VarLeft   := F.Left + L + 4 ;
}
   If ( DBName <> '' ) Then
       VarDBName := DBName ;
   VarTableName := TableName ;
   VarNumFields := Length(aFields) ;
   VarRetField := RetField ;

   SetLength(VarFields,VarNumFields) ;
   For i:=0 To VarNumFields-1 Do
       VarFields[i] := aFields[i] ;

   SetLength(VarTitles,VarNumFields) ;
   For i:=0 To VarNumFields-1 Do
       VarTitles[i] := aTitles[i] ;

   FormConsTab := TFormConsTab.Create(Application) ;
   FormConsTab.Grid.Visible := False ;
   FormConsTab.LabTitulo.Caption := Title ;

   If ( VarSql = '' ) Then
       VarSql := GetSqlSelect ;

   FormConsTab.QCons.Connection := DB_Conect.SQLConnection ;
   FormConsTab.QCons.Close ;
   FormConsTab.QCons.Sql.Clear ;
   FormConsTab.QCons.Sql.Add(VarSql) ;
//   FormConsTab.QCons.Open ;


 {
   For i:=0 To FormConsTab.QCons.FieldCount-1 Do
   Begin
      If ( (FormConsTab.QCons.Fields[i].DataType = ftFloat) Or (FormConsTab.QCons.Fields[i].DataType = ftCurrency) ) Then
         TNumericField(FormConsTab.QCons.Fields[i]).DisplayFormat := '##,###,###,##0.00' ;
   End ;

   VarWidth := 0 ;
   SetLength(VarColWid,VarNumFields) ;
{   For i:=0 To VarNumFields-1 Do
   Begin
       If ( VarFields[i] = '' ) Then
           Continue ;
       ColWidth := (FormConsTab.QCons.FieldByName(VarFields[i]).DisplayWidth * 8) + 2 ;
       If ( ColWidth < (Length(VarTitles[i]) * 8) ) Then
           ColWidth := (Length(VarTitles[i])*8) + 2 ;
       If ( ColWidth <= 16 ) Then
           ColWidth := 25 ;
       VarWidth := VarWidth + ColWidth ;
       VarColWid[i] := ColWidth ;
   End ;

   VarWidth  := VarWidth + 65 ;
   If ( VarWidth > F.Width ) Then
      VarWidth := F.Width - 10 ;
   If ( (VarWidth + L) > F.Width ) Then
      VarLeft := F.Width - VarWidth - 10 ;
   If ( VarLeft < F.Left ) Then
      VarLeft := F.Left + 10 ;

   VarHeight := F.Height - T - H - 75 ;
}
(*
   If ( (VarWidth + VarLeft) > F.Width ) Then
      VarLeft := F.Width - VarWidth ;
   If ( (VarHeight + VarTop) > F.Height ) Then
      VarTop := F.Height - VarHeight ;
*)

   Try
       VarOrder := 0 ;
       FormConsTab.SetGrid ;

       FormConsTab.ShowModal ;
   Finally
       FormConsTab.Release ;
   End ;


   Result := VarOrder ;

End ;

procedure TFormConsTab.FormShow(Sender: TObject);
begin

   If ( VarHeight <= 137 ) Then
   Begin
       VarTop    := VarTop - 100 ;
       VarHeight := 284 ;
   End ;
   If ( VarHeight <= 284 ) Then
       VarHeight := 284 ;

{
   FormConsTab.Width  := VarWidth ;
   FormConsTab.Height := VarHeight ;
   FormConsTab.Left   := VarLeft ;
   FormConsTab.Top    := VarTop ;
}
{
   LabTitulo.Width := FormConsTab.Width - 30 ;
   LabTitulo.Top  := 8 ;
   LabTitulo.Left := 12 ;

   PanLinha.Height := 3 ;
   PanLinha.Width := FormConsTab.Width - 22 ;
   PanLinha.Left := 8 ;
   PanLinha.Top  := LabTitulo.Height + 11 ;

   Grid.Height := PanFundo.Height - LabTitulo.Height - ButOk.Height - 70 ;
   Grid.Width := PanLinha.Width - 4 ;
   Grid.Left := 10 ;
   Grid.Top  := PanLinha.Top + 8 ;

   ButOk.Top  := Grid.Top + Grid.Height + 27 ;
   ButOk.Left := Trunc(Grid.Width/2) - 5 - ButOk.Width ;
   ButCancelar.Top := ButOk.Top ;
   ButCancelar.Left := ButOk.Left + 115 ;
}
   Grid.SetFocus ;

//   if (FormConsTab.EdiPesq.Enabled) and (FormConsTab.EdiPesq.Visible) then
//     EdiPesq.SetFocus;

end;

Procedure ConsTab_SetDBName ( Value : String ) ;
Begin
    VarDBName := Value ;
End ;

Procedure TFormConsTab.ButOkClick(Sender: TObject);
begin
   if FormConsTab.cdsCons.IsEmpty  then
   begin
     Close;
     Exit;
   end;

   With VarForm Do
   Begin
       Try
         Case VarType Of
               TYPE_EDIT   : (VarComp As TEdit).Text := FormConsTab.cdsCons.Fields[VarRetField].AsVariant ;
               TYPE_MASK   : (VarComp As TMaskEdit).Text := FormConsTab.cdsCons.Fields[VarRetField].AsVariant ;
               TYPE_SEDIT  : (VarComp As TRsSuperEdit).Text := FormConsTab.cdsCons.Fields[VarRetField].AsVariant ;
         End ;
       Except
       End ;
       If ( VarRetField2 <> 0 ) Then
       Begin
           Try
             Case VarType2 Of
                 TYPE_EDIT   : (VarComp2 As TEdit).Text := FormConsTab.cdsCons.Fields[VarRetField2].AsVariant ;
                 TYPE_MASK   : (VarComp2 As TMaskEdit).Text := FormConsTab.cdsCons.Fields[VarRetField2].AsVariant ;
                 TYPE_SEDIT  : (VarComp2 As TRsSuperEdit).Text := FormConsTab.cdsCons.Fields[VarRetField2].AsVariant ;
             End ;
           Except
           End ;
       End ;
   End ;
   Close ;
end;

Procedure TFormConsTab.SetGrid ;
Var
   i : Integer ;
Begin
   cmbCampo.Properties.Items.Clear;
   For i:=0 To VarNumFields-1 Do
   Begin
       If ( VarTitles[i] = '' ) Then
           Continue ;

       If ( i > 0 ) Then
          TableView.CreateColumn;
       TableView.Columns[i].DataBinding.FieldName := VarFields[i] ;
//       TableView.Columns[i].Width         := VarColWid[i] ;
       TableView.Columns[i].Caption       := VarTitles[i] ;

       cmbCampo.Properties.Items.Add(VarTitles[i]);
   End ;


   cmbCampo.ItemIndex := 0;
   VarFind := '' ;
   Grid.Visible := True ;
End ;

(* ------------------------------------------------------------------------- *
 * GetSqlSelect -> Devolve o comando sql de SELECT * FROM ...                *
(* ------------------------------------------------------------------------- *)
Function GetSqlSelect : String  ;
Var
   Sql : String ;
   i : Integer ;
Begin
   Result := '' ;
   If ( VarNumFields = 0 ) Then
       Exit ;
   Sql := 'Select ' ;
   For i:=0 To VarNumFields-1 Do
   Begin
       If ( VarFields[i] = '' ) Then
           Continue ;
       Sql := Sql + VarFields[i] + ', ' ;
   End ;
   Sql := Copy(Sql,1,Length(Sql)-2) ;
   Sql := Sql + ' From ' + VarTableName ;
   Sql := Sql + ' Order By ' + VarFields[0] ;
   Result := Sql ;
End ;

Function TFormConsTab.GetFieldName ( pField : String ) : String ;
Var
   p : Integer ;
Begin
   p := Pos(pField,VarSql) - 1 ;
   If ( Copy(VarSql,p,1) = '.' ) Then
      Result := Copy(VarSql,p-1,Length(pField)+2)
   Else
      Result := pField ;
End ;

procedure TFormConsTab.GridColEnter(Sender: TObject);
Var
   Sql : String ;
   p : Integer ;
begin
{   VarFind := '' ;
   Sql := VarSql ;
   p := Pos('Order By',Sql) ;
   If ( p <> 0 ) Then
      Sql := Copy(Sql,1,p-1) ;
   Col := . SelectedIndex ;
   Sql := Sql + ' Order By ' + GetFieldName(VarFields[Col]) ;
   VarOrder := Col ;
   FormConsTab.QCons.Close ;
   FormConsTab.QCons.Sql.Clear ;
   FormConsTab.QCons.Sql.Add(Sql) ;
   FormConsTab.QCons.Open ;
}
   For p:=0 To FormConsTab.QCons.FieldCount-1 Do
   Begin
      If ( (FormConsTab.QCons.Fields[p].DataType = ftFloat) Or (FormConsTab.QCons.Fields[p].DataType = ftCurrency) ) Then
         TNumericField(FormConsTab.QCons.Fields[p]).DisplayFormat := '##,###,###,##0.00' ;
   End ;
end;

procedure TFormConsTab.EdiPesqKeyPress(Sender: TObject; var Key: Char);

begin
   If ( Key = #8 ) Then
       VarFind := Copy(VarFind,1,Length(VarFind)-1)
   Else
       VarFind := VarFind + Key ;
   VarFind := UpperCase(VarFind) ;
   if FormConsTab.QCons.Active then
     try
       FormConsTab.QCons.Locate(VarFields[cmbCampo.ItemIndex],VarFind,[loPartialKey]) ;
     except
       Mens_MensInf('Tipo de dado inválido para este campo !');
     end;

  if Key = #13 then
    cxbutPesquisarClick(Self);
end;

procedure TFormConsTab.GridKeyPress(Sender: TObject; var Key: Char);
Var
   Col : Integer ;
begin
   If ( Key = #27 ) Then Exit;

   If ( Key = #8 ) Then
       VarFind := Copy(VarFind,1,Length(VarFind)-1)
   Else
       VarFind := VarFind + Key ;

   VarFind := UpperCase(VarFind) ;
//   Col := Grid.SelectedIndex ;
   if FormConsTab.QCons.Active then
     FormConsTab.QCons.Locate(VarFields[cmbCampo.ItemIndex],VarFind,[loPartialKey]) ;
end;

procedure TFormConsTab.GridTitleClick(Column: TColumn);

begin
{   Sql := VarSql ;
   p := Pos('Order By',Sql) ;
   If ( p <> 0 ) Then
      Sql := Copy(Sql,1,p-1) ;
   Sql := Sql + ' Order By ' + Column.FieldName ;
   FormConsTab.QCons.Close ;
   FormConsTab.QCons.Sql.Clear ;
   FormConsTab.QCons.Sql.Add(Sql) ;
   Try
     FormConsTab.QCons.Open ;
   Except
     Sql := VarSql ;
     p := Pos('Order By',Sql) ;
     If ( p <> 0 ) Then
        Sql := Copy(Sql,1,p-1) ;
     FormConsTab.QCons.Close ;
     FormConsTab.QCons.Sql.Clear ;
     FormConsTab.QCons.Sql.Add(Sql) ;
     FormConsTab.QCons.Open ;
   end;
   For p:=0 To FormConsTab.QCons.FieldCount-1 Do
   Begin
      If ( (FormConsTab.QCons.Fields[p].DataType = ftFloat) Or (FormConsTab.QCons.Fields[p].DataType = ftCurrency) ) Then
         TNumericField(FormConsTab.QCons.Fields[p]).DisplayFormat := '##,###,###,##0.00' ;
   End ;
}
end;

Function ConsTab_GetQCons : TFDQuery ;
Begin
   Result := FormConsTab.QCons ;
End ;

procedure TFormConsTab.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   If ( Key = 27 ) Then
   Begin
      Key := 9 ;
      Close ;
   End ;
end;

procedure TFormConsTab.ButCancelarClick(Sender: TObject);
begin
   Close ;

end;

procedure TFormConsTab.cxbutPesquisarClick(Sender: TObject);
Var
   Sql : String ;
   p, Ponto : Integer ;
begin
   Sql := VarSql ;

{   if EdiPesq.Text = '' then
   begin
     if Mens_MensConf('Conteúdo para pesquisa não informado, deseja continuar assim mesmo ?') <> mrOk Then
     begin
       EdiPesq.SetFocus;
       Exit;
     end;

   end;

}
   p := Pos('ORDER BY', UpperCase(Sql)) ;
   If ( p <> 0 ) Then
      Sql := Copy(Sql,1,p-1) ;

   p := Pos('WHERE', UpperCase(Sql) ) ;
   If ( p <> 0 ) Then
   begin
      Sql := Copy(Sql,1,p-1) ;
      Ponto := Pos(UpperCase(VarFields[cmbCampo.ItemIndex]), (UpperCase(Sql))) ;
      if (Ponto > 0) and (Copy(Sql, ponto-1,1) = '.') then
        Sql := Sql + ' WHERE ' + (Copy(Sql, ponto-2, 2))  + VarFields[cmbCampo.ItemIndex] + ' like ''%' + EdiPesq.Text + '%'' and '
      else
        Sql := Sql + ' WHERE ' + VarFields[cmbCampo.ItemIndex] + ' like ''%' + EdiPesq.Text + '%'' and ' ;
      Sql := Sql + Copy(VarSql,p + 5, length(VarSql)) ;
   end
   else
      Sql := Sql + ' WHERE ' + VarFields[cmbCampo.ItemIndex] + ' like ''%' + EdiPesq.Text + '%''' ;

   FormConsTab.cdsCons.Close;
   FormConsTab.QCons.Sql.Clear ;
   FormConsTab.QCons.Sql.Add(Sql) ;
   Try
     FormConsTab.cdsCons.Open ;
   Except
      On E:Exception do
        Mens_MensInf('Erro Executando Filtro ! ' + E.Message );
   end;

end;

procedure TFormConsTab.EdiPesqKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  if Key = 13 then
//    cxbutPesquisarClick(Self);
end;

procedure TFormConsTab.TableViewKeyPress(Sender: TObject; var Key: Char);
begin
 if (Key = #13) and (FormConsTab.cdsCons.Active) then
    ButOkClick(Nil)
 else if (Key = #13) and (Not FormConsTab.cdsCons.Active) then
    cxbutPesquisarClick(Nil);
end;

end.

