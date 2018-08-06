unit ObjFun ;

interface

Uses
     Forms, SysUtils, Controls, Windows, StdCtrls, Grids, DBTables, Classes,
	 rsFlyovr, rsEdit, ComCtrls, Mask, extctrls, FMTBcd,   FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

Function FindInList ( L : TListBox ; S : String ) : Integer ; Export ;
Function FindInListCase ( L : TListBox ; S : String ) : Integer ; Export ;
Procedure ClearStrGrid ( G : TStringGrid ) ; Export ;
Procedure ClearStrGridWitTitle ( G : TStringGrid ) ; Export ;
Procedure GridDelRow ( G : TStringGrid ; Row : Integer ) ; Export ;
Procedure FillListByQyery ( L : TStringList ; Q : TFDQuery ; F : String ) ; Export ;
Function FindInCombo ( C : TComboBox ; Const S : String ) : Integer ; Export ;
Function FindInGrid ( G : TStringGrid ; Col : Integer ; Value : String ) : Integer ; Export ;
Procedure SetCompsEnable ( F : TForm ; Value : Boolean ) ; Export ;

Function Obj_GetFormObjValue ( F : TForm ; Ind : Integer ) : Variant ; Export ;
Procedure Obj_SetFormObjValue ( F : TForm ; Ind : Integer ; Value : Variant ) ; Export ;
Procedure Obj_SetNullInFormObj ( F : TForm = Nil ; Tag : Integer = 0 ) ; Export ;
Function Obj_GetFormObjName ( F : TForm ; Ind : Integer ) : Variant ; Export ;
Procedure Obj_SetCompsEnable ( F : TForm ; Tag : Integer ; Value : Boolean ) ; Export ;
Procedure Obj_SetCompsVisible ( F : TForm ; Tag : Integer ; Value : Boolean ) ; Export ;
Procedure Obj_SetCompsEmpty ( F : TForm ; Tag : Integer = 0 ) ; Export ;
Function Obj_GetCompByName ( F : TForm ; Value : String ) : TComponent ; Export ;
Function Obj_FindControlByTagName ( F : TForm ; Value : String ) : TComponent ; Export ;
Function Obj_FindControlByName ( F : TForm ; Value : String ) : TComponent ; Export ;
Function Obj_FillList  ( List : TListBox ; Sql : String ) : Boolean ; Export ;
Function Obj_FillCombo ( Combo : TComboBox ; Sql : String ; Sep : String = ' | ' ) : Boolean ; Export ;
Function Obj_FillGrid ( Grid : TStringGrid ; Sql : String ; NumFields : Integer ; LinTit : Boolean = False ) : Boolean ; Export ;

implementation

Uses
   StrFun, SqlTableFun ;

Const

   TAGFORMAT_MONEY = -101 ;
   TAGFORMAT_DATE  = -102 ;


Function FindInList ( L : TListBox ; S : String ) : Integer ;
Var
   i : Integer ;
Begin
   Result := -1 ;
   For i:=0 To L.Items.Count-1 Do
   Begin
       If ( L.Items[i] = S ) Then
       Begin
			 Result := i ;
           Break ;
       End ;
   End ;
   L.ItemIndex := Result ;
End ;

Function FindInListCase ( L : TListBox ; S : String ) : Integer ;
Var
   i : Integer ;
Begin
   Result := -1 ;
   S := LowerCase(S) ;
   For i:=0 To L.Items.Count-1 Do
   Begin
       If ( LowerCase(L.Items[i]) = S ) Then
       Begin
			 Result := i ;
           Break ;
       End ;
   End ;
   L.ItemIndex := Result ;
End ;

Procedure ClearStrGrid ( G : TStringGrid ) ;
Var
   i, j : Integer ;
Begin
   For i:=0 to G.RowCount-1 Do
       For j:=0 To G.ColCount-1 Do
           G.Cells[j,i] := '' ;
End ;

Procedure ClearStrGridWitTitle ( G : TStringGrid ) ;
Var
   i, j : Integer ;
Begin
   For i:=1 to G.RowCount-1 Do
       For j:=0 To G.ColCount-1 Do
           G.Cells[j,i] := '' ;
   G.RowCount := 2 ;
End ;

Procedure GridCopyRow ( G : TStringGrid ; RowSource, RowDest : Integer ) ;
Var
   c : Integer ;
Begin
   For c:=0 To G.ColCount-1 Do
       G.Cells[c,RowDest] := G.Cells[c,RowSource] ;
End ;

Procedure GridDelRow ( G : TStringGrid ; Row : Integer ) ;
Var
   k : Integer ;
Begin
   If ( (Row < 0) Or (Row > G.RowCount-1) ) Then
       Exit ;
   For k:=Row To G.RowCount-2 Do
       GridCopyRow(G,k+1,k) ;
   For k:=0 To G.ColCount-1 Do
       G.Cells[k,G.RowCount-1] := '' ;
   If ( G.RowCount > 2 ) Then
		G.RowCount := G.RowCount-1 ;
End ;

Procedure FillListByQyery ( L : TStringList ; Q : TFDQuery ; F : String ) ;
Begin
   Q.First ;
   L.Clear ;
   While ( Not Q.Eof ) Do
   Begin
       L.Add ( Q.FieldByName(F).AsString ) ;
       Q.Next ;
   End ;
End ;

Function FindInCombo ( C : TComboBox ; Const S : String ) : Integer ;
Var
   i : Integer ;
   ls : String ;
Begin
   Result := -1 ;
   ls := LowerCase(S) ;
   For i:=0 To C.Items.Count-1 Do
   Begin
		If ( LowerCase(C.Items[i]) = ls ) Then
       Begin
           Result := i ;
           Break ;
       End ;
   End ;
   C.ItemIndex := Result ;
End ;

Function FindInGrid ( G : TStringGrid ; Col : Integer ; Value : String ) : Integer ; Export ;
Var
   i : Integer ;
Begin               
   Result := -1 ;
   For i:=1 To G.RowCount-1 Do
       If ( G.Cells[Col,i] = Value ) Then
       Begin
           Result := i ;
           Break ;
       End ;
End ;

Procedure SetCompsEnable ( F : TForm ; Value : Boolean ) ;
Var
   i : Integer ;
Begin
   For i:=0 To F.ComponentCount-1 Do
		If ( F.Components[i].Tag < 0 ) Then
			 TControl(F.Components[i]).Enabled := Value ;
End ;

Function Obj_GetFormObjName ( F : TForm ; Ind : Integer ) : Variant ;
Var
   Comp : TComponent ;
Begin
   If ( F = Nil ) Then
		F := Screen.ActiveForm ;
   Comp := F.Components[Ind] ;
   If ( Comp Is TEdit ) Then
		Result := Copy(TEdit(Comp).Name,4,Length(TEdit(Comp).Name))
   Else If ( Comp Is TrsSuperEdit ) Then
		Result := Copy(TrsSuperEdit(Comp).Name,4,Length(TrsSuperEdit(Comp).Name))
//   Else If ( Comp Is TGNRadioGroup ) Then
//		Result := Copy(TGNRadioGroup(Comp).Name,4,Length(TGNRadioGroup(Comp).Name))
   Else If ( Comp Is TMaskEdit ) Then
		Result := Copy(TMaskEdit(Comp).Name,4,Length(TMaskEdit(Comp).Name))
   Else If ( Comp Is TLabel ) Then
		Result := Copy(TLabel(Comp).Name,4,Length(TLabel(Comp).Name))
   Else If ( Comp Is TComboBox ) Then
		Result := Copy(TComboBox(Comp).Name,4,Length(TComboBox(Comp).Name))
   Else
		Result := TEdit(Comp).Name ;
End ;

Function Obj_GetFormObjValue ( F : TForm ; Ind : Integer ) : Variant ;
Var
   Comp : TComponent ;
   T : Integer ;
Begin
   If ( F = Nil ) Then
		F := Screen.ActiveForm ;
   T := 0 ;
   Comp := F.Components[Ind] ;
   If ( Comp Is TEdit ) Then
   Begin
		T := TEdit(Comp).Tag ;
		Result := TEdit(Comp).Text ;
   End
   Else If ( Comp Is TrsSuperEdit ) Then
   Begin
		T := TrsSuperEdit(Comp).Tag ;
		Result := TrsSuperEdit(Comp).Text ;
   End
//   Else If ( Comp Is TGNRadioGroup ) Then
//   Begin
//		T := TGNRadioGroup(Comp).Tag ;
//		Result := TGNRadioGroup(Comp).ItemChoice ;
//   End
   Else If ( Comp Is TMaskEdit ) Then
   Begin
		T := TMaskEdit(Comp).Tag ;
		Result := TMaskEdit(Comp).Text ;
   End
   Else If ( Comp Is TLabel ) Then
   Begin
		T := TLabel(Comp).Tag ;
		Result := TLabel(Comp).Caption ;
   End
   Else If ( Comp Is TComboBox ) Then
   Begin
		T := TComboBox(Comp).Tag ;
		Result := TComboBox(Comp).Text ;
   End
   Else If ( Comp Is TDateTimePicker ) Then
   Begin
		T := TDateTimePicker(Comp).Tag ;
		Result := TDateTimePicker(Comp).DateTime ;
   End
   Else If ( Comp Is TMemo ) Then
   Begin
		T := TMemo(Comp).Tag ;
		Result := TMemo(Comp).Text ;
   End ;

   Case T Of
		TAGFORMAT_MONEY : Result := Str_StrToMoney(Result) ;
   End ;
End ;

Procedure Obj_SetFormObjValue ( F : TForm ; Ind : Integer ; Value : Variant ) ;
Var
   Comp : TComponent ;
Begin
   If ( F = Nil ) Then
       F := Screen.ActiveForm ;
   Comp := F.Components[Ind] ;
   If ( Comp Is TEdit ) Then
       TEdit(Comp).Text := Value
   Else If ( Comp Is TrsSuperEdit ) Then
   Begin
       Try
           Case TrsSuperEdit(Comp).Format Of
				  foCurrency : TrsSuperEdit(Comp).AsDouble := Value ;
               foInteger  : TrsSuperEdit(Comp).AsInteger := Value ;
				  foDate     : TrsSuperEdit(Comp).Text := Str_DateToStr(Value) ;
//              foFullDate : TrsSuperEdit(Comp).AsDateTime := Str_DateToStr(Value) ;
				  foFullDate : TrsSuperEdit(Comp).Text := Str_DateToStr(Value) ;
				  foReal     : TrsSuperEdit(Comp).AsDouble := Value ;
				  foText     : TrsSuperEdit(Comp).Text := Value ;
			 End ;
		Except
			 TrsSuperEdit(Comp).Text := Value ;
		End
   End
//   Else If ( Comp  Is TGNRadioGroup ) Then
//		TGNRadioGroup(Comp).ItemChoice := Value
   Else If ( Comp Is TMaskEdit ) Then
		TMaskEdit(Comp).Text := Value
   Else If ( Comp Is TLabel ) Then
		TLabel(Comp).Caption := Value
   Else If ( Comp Is TComboBox ) Then
		TComboBox(Comp).Text := Value
   Else If ( Comp Is TDateTimePicker ) Then
		TDateTimePicker(Comp).Date := Value ;
End ;

Procedure Obj_SetNullInFormObj ( F : TForm = Nil ; Tag : Integer = 0 ) ;
Var
   i : Integer ;
Begin
   If ( F = Nil ) Then
		F := Screen.ActiveForm ;
   For i:=0 To F.ComponentCount-1 Do
   Begin
		If ( Tag = 0 ) Then
		Begin
			 If ( F.Components[i].Tag < 0 ) Then
				  Obj_SetFormObjValue(F,i,'') ;
		End
		Else Begin
			 If ( F.Components[i].Tag = Tag ) Then
				  Obj_SetFormObjValue(F,i,'') ;
		End ;
   End ;
End ;

Procedure Obj_SetCompsVisible ( F : TForm ; Tag : Integer ; Value : Boolean ) ;
Var
   i : Integer ;
Begin
   If ( F = Nil ) Then
		F := Screen.ActiveForm ;
   For i:=0 To F.ComponentCount-1 Do
		If ( F.Components[i].Tag = Tag ) Then
			 TControl(F.Components[i]).Visible := Value ;
End ;

Procedure Obj_SetCompsEnable ( F : TForm ; Tag : Integer ; Value : Boolean ) ;
Var
   i : Integer ;
Begin
   If ( F = Nil ) Then
		F := Screen.ActiveForm ;
   For i:=0 To F.ComponentCount-1 Do
		If ( F.Components[i].Tag = Tag ) Then
			 TControl(F.Components[i]).Enabled := Value ;
End ;

Procedure Obj_SetCompsEmpty ( F : TForm ; Tag : Integer = 0 ) ; Export ;
Var
   i : Integer ;
   Comp : TComponent ;
Begin
   If ( F = Nil ) Then
		F := Screen.ActiveForm ;
   For i:=0 To F.ComponentCount-1 Do
		If ( ((F.Components[i].Tag = Tag) Or (Tag = 0)) And (F.Components[i].Tag < 0) ) Then
		Begin
			 Comp := F.Components[i] ;
			 If ( Comp Is TEdit ) Then
				  TEdit(Comp).Text := ''
			 Else If ( Comp Is TrsSuperEdit ) Then
			 Begin
				  If ( (TrsSuperEdit(Comp).Format = foInteger)  Or
						 (TrsSuperEdit(Comp).Format = foCurrency)  Or
						 (TrsSuperEdit(Comp).Format = foReal) ) Then
						TrsSuperEdit(Comp).AsInteger := 0
				  Else
						TrsSuperEdit(Comp).Text := '' ;
			 End
//			 Else If ( Comp  Is TGNRadioGroup ) Then
//				  TGNRadioGroup(Comp).ItemChoice := ''
			 Else If ( Comp Is TMaskEdit ) Then
				  TMaskEdit(Comp).Text := ''
			 Else If ( Comp Is TLabel ) Then
				  TLabel(Comp).Caption := ''
			 Else If ( Comp Is TComboBox ) Then
				  TComboBox(Comp).Text := ''
           Else If ( Comp Is TDateTimePicker ) Then
               TDateTimePicker(Comp).DateTime := Date()
           Else If ( Comp Is TCheckBox ) Then
               TCheckBox(Comp).Checked := False
           Else If ( Comp Is TRadioGroup ) Then
               TRadioGroup(Comp).ItemIndex := -1
           Else If ( Comp Is TMemo ) Then
               TMemo(Comp).Lines.Clear
           Else If ( Comp Is TStringGrid ) Then
               ClearStrGridWitTitle(TStringGrid(Comp)) ;
       End ;
End ;

Function Obj_GetCompByName ( F : TForm ; Value : String ) : TComponent ;
Var
    i : Integer ;
Begin
   Result := Nil ;
   If ( F = Nil ) Then
       F := Screen.ActiveForm ;
   For i:=0 To F.ComponentCount-1 Do
   Begin
       If ( LowerCase(F.Components[i].Name) = LowerCase(Value) ) Then
       Begin
			 Result := F.Components[i] ;
			 Break ;
		End ;
   End ;
End ;

Function Obj_FindControlByTagName ( F : TForm ; Value : String ) : TComponent ;
Var
   i : Integer ;
Begin
   Result := Nil ;
   If ( F = Nil ) Then
       F := Screen.ActiveForm ;
   For i:=0 To F.ComponentCount-1 Do
   Begin
       If ( F.Components[i] Is TrsSuperEdit ) Then
       Begin
           If ( LowerCase(TrsSuperEdit(F.Components[i]).TagName) = LowerCase(Value) ) Then
           Begin
               Result := F.Components[i] ;
               Break ;
           End ;
       End ;
   End ;
End ;

Function Obj_FindControlByName ( F : TForm ; Value : String ) : TComponent ;
Var
   i : Integer ;
Begin
   Result := Nil ;
   If ( F = Nil ) Then
       F := Screen.ActiveForm ;
   For i:=0 To F.ComponentCount-1 Do
   Begin
       If ( LowerCase(TEdit(F.Components[i]).Name) = LowerCase(Value) ) Then
       Begin
           Result := F.Components[i] ;
           Break ;
       End ;
   End ;
End ;

Function Obj_FillList ( List : TListBox ; Sql : String ) : Boolean ;
Var
   Q : TFDQuery ;
   Tab : TSQLTableClass ;
   TableName, SqlAux : String ;
   p, i : Integer ;
Begin
   SqlAux := LowerCase(Sql) ;
   p := Pos('from',SqlAux) + 5 ;
   i := p ;
   While ( i <= Length(SqlAux) ) Do
   Begin
       If ( SqlAux[i] = ' ' ) Then
           Break ;
       Inc(i) ;
   End ;
   TableName := Copy(SqlAux,p,i-p) ;
   Tab := TSQLTableClass.Create ;
   If ( Not Tab.OpenTable(TableName) ) Then
   Begin
      Result := False ;
      Exit ;
   End ;
   Result := True ;
   List.Items.Clear ;
   Q := Tab.ExecSqlSel(Sql) ;
   While ( Not Q.Eof ) Do
   Begin
       List.Items.Add(Q.Fields[0].AsString) ;
       Q.Next ;
   End ;
   Tab.Destroy ;
End ;

Function Obj_FillCombo ( Combo : TComboBox ; Sql : String ; Sep : String = ' | ' ) : Boolean ;
Var
   Q : TFDQuery ;
   Tab : TSQLTableClass ;
   TableName, SqlAux, Aux : String ;
   p, i, NumFields : Integer ;
   MaxLen, Len : Longint ;
   KeyField, OtherFields : TStringList ;
Begin
   SqlAux := LowerCase(Sql) ;
   p := Pos('from',SqlAux) + 5 ;
   i := p ;
   While ( i <= Length(SqlAux) ) Do
   Begin
       If ( SqlAux[i] = ' ' ) Then
           Break ;
       Inc(i) ;
   End ;
   TableName := Copy(SqlAux,p,i-p) ;
   Tab := TSQLTableClass.Create ;
   If ( Not Tab.OpenTable(TableName) ) Then
   Begin
      Result := False ;
      Exit ;
   End ;
   Result := True ;
   Combo.Clear ;
   KeyField    := TStringList.Create ;
   OtherFields := TStringList.Create ;
   MaxLen := 0 ;
   Q := Tab.ExecSqlSel(Sql) ;
   NumFields := Q.FieldCount ;
   While ( Not Q.Eof ) Do
   Begin
       KeyField.Add(Q.Fields[0].AsString) ;
       Aux := '' ;
       For i:=1 To NumFields-1 Do
       Begin
           Aux := Aux + Q.Fields[i].AsString + Sep ;
       End ;
       Aux := Copy(Aux,1,Length(Aux)-3) ;
       OtherFields.Add(Aux) ;
       Len := Str_LenByFont(Q.Fields[0].AsString) ;
		If ( Len > MaxLen ) Then
           MaxLen := Len ;
       Q.Next ;
   End ;
   For i:=0 To KeyField.Count-1 Do
   Begin
       Aux := Str_StrLeftAlignByCarac(KeyField[i],MaxLen) ;
       If ( NumFields > 1 ) Then
           Aux := Aux + Sep + OtherFields[i] ;
       Combo.Items.Add(Aux) ;
   End ;
   Q.Close ;
   Tab.Destroy ;
End ;

Function Obj_FillGrid ( Grid : TStringGrid ; Sql : String ;
                        NumFields : Integer ; LinTit : Boolean = False ) : Boolean ;
Var
   Q : TFDQuery ;
   Tab : TSQLTableClass;
   TableName, SqlAux : String ;
   p, i : Integer ;
Begin
   SqlAux := LowerCase(Sql) ;
   p := Pos('from',SqlAux) + 5 ;
   i := p ;
   While ( i <= Length(SqlAux) ) Do
   Begin
       If ( SqlAux[i] = ' ' ) Then
           Break ;
       Inc(i) ;
   End ;
   TableName := Copy(SqlAux,p,i-p) ;
   Tab := TSQLTableClass.Create ;
   If ( Not Tab.OpenTable(TableName) ) Then
   Begin
      Result := False ;
      Exit ;
   End ;
   Result := True ;
   If ( LinTit ) Then
       ClearStrGridWitTitle(Grid)
   Else
       ClearStrGrid(Grid) ;
   Q := Tab.ExecSqlSel(Sql) ;
   While ( Not Q.Eof ) Do
   Begin
       If ( LinTit ) Then
           p := 1
       Else
           p := 0 ;
       For i:=0 To NumFields-1 Do
           Grid.Cells[i,p] := Q.Fields[i].AsString ;
       Q.Next ;
   End ;
   Tab.Destroy ;
End ;

end.

