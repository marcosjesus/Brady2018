unit SQLTableFun;

interface

Uses
     SysUtils, Windows, DB, DBTables, Classes, Forms, extctrls, Variants,
     ComCtrls, StdCtrls, Controls, DBUnivers ;

Const

   DBTYPE_PARADOX      = 1 ;
   DBTYPE_SQLSERVER_65 = 2 ;
   DBTYPE_ACCESS       = 3 ;
   DBTYPE_SQLSERVER_70 = 4 ;

   MAX_FIELDS    = 60 ;
   MAX_KEYFIELDS = 10 ;

   TAG_FIELD    = -1 ;
   TAG_KEY      = -2 ;
   TAG_ESPCOMBO = -3 ;
   TAG_ALT_KEY  = -4 ;

   ERRO_OK           = 0 ;
   ERRO_KEYVIOLATION = 2601 ;
   ERRO_REC_MODIFIED = 2 ;
   ERRO_CONSTRAINT   = 547 ;
   ERRO_NULL_VALUES  = 515 ;
   ERRO_COMMIT       = -1 ;

Type

   TFieldDesc = Record
       FName : String[50] ;
       FPos : Integer ;
       FType : TFieldType ;
       FValue : Variant ;
       FUpdOk : Boolean ;
       FDecimals: Integer ;
       FAutoVal : Integer ;
   End ;

   Type TSQLTable = Class(TComponent)
   	   Private
           FDBType      : Integer ;                            // -> Tipo do banco de dados
           FQuery       : TQuery ;                             // -> Query genérica
           FQResult     : TQuery ;                             // -> Query auxiliar
           FQuerySelect : TQuery ;								// -> Query para pesquisa
           FSql         : String ;                             // -> Comando sql utilizado
           FVariantKey  : Variant ;                            // -> Chave para pesquisa com PARADOX
           FDBName      : String[20] ;                         // -> Nome do DataBase
           FTableName   : String[50] ;                         // -> Nome da tabela default
           FFieldDesc   : Array[0..MAX_FIELDS] Of TFieldDesc ; // -> Descrição dos campos
           FFieldCount  : Integer ;							// -> Número de campos da tabela
           FTable       : TTable ;                             // -> Tabela default
           FMensErro    : String ;								     // -> Mensagem de erro obtida
           FExceptErro  : String ;
           FErro        : Boolean ;  							     // -> Erro obtido em alguma função que falhou
           FNumErro     : Integer ;                            // -> Número do erro
           FFieldPos    : Integer ;							// -> Posição do campo atual de trabalho
           FFieldName   : String[30] ;	         				// -> Nome do campo atual de trabalho
           FKeyCount    : Integer ;                            // -> Número de campos da chave
           FKeyFields   : Array[1..MAX_KEYFIELDS] Of Integer ; // -> Campos que compõe a chave
           FNullValues  : Boolean ;                            // -> Indica se valores nulos serão convertidos
           FTimeStamp   : TDateTime ;
           Function GetFieldType ( FieldName : String ) : TFieldType ;
           Function GetFieldPos ( FieldName : String ) : Integer ;
           Function PrivGetFieldValue ( FieldPos : Integer ; AsText : Boolean = True ) : Variant ;
           Function GetSqlInsert : Boolean ;
           Function GetSqlSelect : Boolean ;
           Function GetSqlUpdate : Boolean ;
           Function GetSqlDelete : Boolean ;
           Function GetSqlNextOrPrior ( Opcao : String ) : Boolean ;
           Function GetVariantKey : Boolean ;
           Function GetRowModified : Integer ;
           Function GetDBError : Integer ;
       Public
           QResult : TQuery ;
           Constructor Create ; reintroduce ;
           Destructor Destroy ; reintroduce ;
           Function FillDescFieldValues : Boolean ;
           Procedure FormToFieldValues ( F : TForm = Nil ) ;
           Procedure FieldValuesToForm ( F : TForm = Nil ) ;
           Procedure SetError ( Message : String = '' ; ErrorNum : Integer = 0 ) ;
           Function GetMensErro : String ;
           Function GetError : Boolean ;
           Function GetNumErro : Integer ;
           Function OpenTable ( TableName : String ) : Boolean ;
           Procedure ResetAllUpdFields ( Value : Boolean = False ) ;
           Function GetNumFields : Integer ;
           Function SetUpdField ( FieldName : String ) : Boolean ;
           Function ResetUpdField ( FieldName : String ; Value : Boolean = False ) : Boolean ;
           Function SetFieldValue ( FieldName : String ; FieldValue : Variant ) : Boolean ;
           Function GetFieldValue ( FieldName : String ) : Variant ;
           Function GetTabFieldType ( FieldName : String ) : TFieldType ;
           Procedure ResetKey ;
           Function SetKeyValue ( FieldName : String ; FieldValue : Variant ; ParResetKey : Boolean = False ) : Boolean ;
           Function SetFieldKey ( FieldName : String ) : Boolean ;
           Function SetKey ( Values : Array of Variant ) : Boolean ;
           Function GetLastIdentity : LongInt ;
           Function GetNumRows : LongInt ;
           Function Insert ( ClearUpdFields : Boolean = True ) : Boolean ;
           Function Update ( ClearUpdFields : Boolean = True ; ExecFind : Boolean = True ) : Boolean ;
           Function Find ( FillDesc : Boolean = False ) : Boolean ;
           Function Next ( FillFields : Boolean = True ) : Boolean ;
           Function Prior ( FillFields : Boolean = True ) : Boolean ;
           Function Delete : Boolean ;
           Function ExecSqlSel ( Sql : String ) : TQuery ;
           Function ExecSql ( Sql : String ) : TQuery ;
           Function SetInsert ( TabName : String ; Value : String ) : Boolean ;
           Function GetExecSqlSel ( Sql : String ) : Boolean ;
           Function GetExecSql ( Sql : String ) : Boolean ;
           Function ExecQuerySel ( Q : TQuery = Nil ) : Boolean ;
           Function ExecQuery ( Q : TQuery = Nil ) : Boolean ;
           Function FormSetFieldValue ( F : TForm = Nil ; Tag : Integer = 0 ) : Boolean ;
           Function SetFormObjValue ( F : TForm = Nil ; Tag : Integer = 0 ) : Boolean ;
           Function SeekGet ( TableName : String ; Fields : String ;
                             aKey : Array of Variant ; RetField : String ;
                             Erro : Boolean = False ) : Variant ;
           Function Seek ( TableName : String ; Fields : String ;  aKey : Array of Variant ) : Boolean ;
           Procedure IndexName ( Value : String ) ;
           Function GetSqlServerTabFields ( pTabName : String ) : TQuery ;
           Function BeginTrans : Boolean ;
           Function ExecCommit : Boolean ;
           Function ExecRollBack : Boolean ;
           Procedure SetNullValues ( Value : Boolean ) ;
           Function GetLastID ( FieldName : String ) : Double ;
           Function GetTransCount : Integer ;
   End ;


Function SqlTable_Start ( DBName : String ; DBType : Integer = DBTYPE_PARADOX ) : Boolean ; Export ;
Function SqlTable_GetDBType : Integer ; Export ;
Function SqlTable_GetDBName : String ; Export ;

implementation

Uses
   rsFlyovr, rsEdit, StrFun, TestFun, ObjFun, DateFun ;

Var
   VarDBName : String ;
   VarDBType : Integer ;


(* ========================================================================= *)
(*                    FUNÇÕES DE UTILIZAÇÃO INTERNA                          *)

(* ------------------------------------------------------------------------- *
 * GetFieldType -> Retorno o tipo de um campo da tabela                      *
(* ------------------------------------------------------------------------- *)
Function TSqlTable.GetFieldType ( FieldName : String ) : TFieldType ;
Begin
   Result := ftString ;
	Case FDBType Of
   	DBTYPE_PARADOX : Begin
           Case FTable.FieldByName(FieldName).DataType Of
               ftString   : Result := ftString ;
               ftSmallInt ,
               ftAutoInc ,
               ftInteger  : Result := ftInteger ;
               ftFloat    : Result := ftFloat ;
               ftDate     ,
               ftTime     ,
               ftDateTime : Result := ftDateTime ;
           End ;
       End ;
       DBTYPE_ACCESS  : Begin
           Case FQuery.FieldByName(FieldName).DataType Of
               ftString   : Result := ftString ;
               ftSmallInt ,
               ftAutoInc ,
               ftInteger  : Result := ftInteger ;
               ftFloat    : Result := ftFloat ;
               ftDate     ,
               ftTime     ,
               ftDateTime : Result := ftDateTime ;
           End ;
       End ;
       DBTYPE_SQLSERVER_65 ,
       DBTYPE_SQLSERVER_70 : Begin
           If ( (FieldName = 'varchar') Or (FieldName = 'char') ) Then
               Result := ftString
           Else If ( FieldName = 'datetime' ) Then
               Result := ftDateTime
           Else If ( (FieldName = 'decimal') Or (FieldName = 'float') Or
                (FieldName = 'numeric') Or (FieldName = 'real') Or (FieldName = 'money') ) Then
               Result := ftFloat
           Else If ( (FieldName = 'int') Or (FieldName = 'smallint') ) Then
               Result := ftInteger
           Else
               Result := ftString ;
       End ;
   End ;
End ;

(* ------------------------------------------------------------------------- *
 * GetDBError -> Determina o número do erro ocorrido no DB                    *
(* ------------------------------------------------------------------------- *)
Function TSqlTable.GetDBError : Integer ;
Begin
    Result := -1 ;
    If ( (FDBType = DBTYPE_SQLSERVER_65) Or (FDBType = DBTYPE_SQLSERVER_70) ) Then
    Begin
       FQuerySelect.Close ;
       FQuerySelect.Sql.Clear ;
       FQuerySelect.Sql.Add('Select @@ERROR As ErrorNum') ;
       Try
          FQuerySelect.Open ;
       Except
          Exit ;
       End ;
       Result := FQuerySelect.FieldByName('ErrorNum').AsInteger ;
    End ;
End ;

(* ------------------------------------------------------------------------- *
 * SetError -> Seta um erro ocorrido                                         *
(* ------------------------------------------------------------------------- *)
Procedure TSqlTable.SetError ( Message : String = '' ; ErrorNum : Integer = 0 ) ;
Begin
	 If ( Message = '' ) Then
    Begin
     	 FErro := False ;
       FNumErro := ERRO_OK ;
       FMensErro := '' ;
    End
    Else If ( Message = '<>' ) Then
    Begin
       FNumErro := GetDBError() ;
       Case FNumErro Of
          ERRO_REC_MODIFIED : FMensErro := 'Estes registros provavelmente ' +
                                         'foram modificado(s) por outro processo. ' +
                                         'Por favor repita o processamento realizado.' ;
          ERRO_KEYVIOLATION : FMensErro := 'Registro já existente' ;
          ERRO_CONSTRAINT   : FMensErro := 'A integridade referencial do banco de dados não ' +
                                         'permite que esta operação seja realizada' ;
          ERRO_NULL_VALUES  : FMensErro := 'Alguns valores obrigatórios da tabela não foram informados' ;
       Else
          FMensErro := FExceptErro ;
       End ;
    End
    Else Begin
       FNumErro := ErrorNum ;
       FErro := True ;
       FMensErro := Message ;
   End ;
End ;

(* ------------------------------------------------------------------------- *
 * GetFieldPos -> Devolve a posição de um campo no vetor FFieldDesc          *
(* ------------------------------------------------------------------------- *)
Function TSqlTable.GetFieldPos ( FieldName : String ) : Integer ;
Var
	i : Integer ;
Begin
	Result := -1 ;
	For i:=0 To FFieldCount-1 Do
    Begin
       If ( LowerCase(FFieldDesc[i].FName) = LowerCase(FieldName) ) Then
       Begin
       	Result := i ;
			Break ;
       End ;
   End ;
End ;

(* ------------------------------------------------------------------------- *
 * PrivGetFieldValue -> Devolve o valor de um campo no vetor FFieldDesc      *
 *                      Uso interno ao módulo                                *
(* ------------------------------------------------------------------------- *)
Function TSqlTable.PrivGetFieldValue ( FieldPos : Integer ; AsText : Boolean = True ) : Variant ;
Var
   ValInt : Integer ;
   ValFlo : Double ;
   ValDat : TDateTime ;
   ValDatStr : String ;
Begin
   Case FFieldDesc[FieldPos].FType Of
       ftString   : Begin
           Result := FFieldDesc[FieldPos].FValue ;
           If ( (Result = Null) And (FNullValues) ) Then
              Result := '' ;
           If ( AsText ) Then
               If ( (FDBType = DBTYPE_SQLSERVER_65) Or (FDBType = DBTYPE_SQLSERVER_70) ) Then
                   Result := '''' + Result + ''''
               Else
                   Result := '"' + Result + '"' ;
		 End ;
       ftInteger  : Begin
           If ( (FFieldDesc[FieldPos].FValue = Null) And (FNullValues) ) Then
              ValInt := 0
           Else
              ValInt := FFieldDesc[FieldPos].FValue ;
           Result := ValInt ;
           If ( AsText ) Then
               Result := Str_IntToStr(Result) ;
       End ;
       ftFloat    : Begin
           Try
              If ( (FFieldDesc[FieldPos].FValue = Null) And (FNullValues) ) Then
                 ValFlo := 0
              Else
                 ValFlo := FFieldDesc[FieldPos].FValue ;
			  Except
				  ValFlo := 0 ;
           End ;
           Result := ValFlo ;
           If ( AsText ) Then
           Begin
               Result := Str_FloatToStr(Result,FFieldDesc[FieldPos].FDecimals) ;
               Result := Str_ChangeDecPoint(Result,',','.') ;
           End ;
       End ;
       ftDateTime : Begin
           Try
               If ( (FFieldDesc[FieldPos].FValue = Null) And (FNullValues) ) Then
                  ValDat := Str_StrToDate('01/01/1900')
               Else
                  ValDat := FFieldDesc[FieldPos].FValue ;
           Except
               ValDat := Str_StrToDate(FFieldDesc[FieldPos].FValue) ;
           End ;
           Result := ValDat ;
           If ( AsText ) Then
           Begin
    				  ValDatStr := Str_DateToStr(ValDat) ;
(*
               If ( Length(Result) <= 8 ) Then
                   Result := Copy(Result,4,2) + '/' + Copy(Result,1,2) + '/' + Copy(Result,7,2)
               Else
                   Result := Copy(Result,4,2) + '/' + Copy(Result,1,2) + '/' + Copy(Result,7,4) ;
*)
               If ( (FDBType = DBTYPE_SQLSERVER_65) Or (FDBType = DBTYPE_SQLSERVER_70) ) Then
               Begin
                   if ValDat = 0 then
                     Result := 'Null' else
                   begin
                     Result := Str_DDMMAA_To_MMDDAA(ValDatStr) ;
                     Result := '''' + Result + ''''
                   end;  

               End
				  Else
                   Result := '"' + ValDatStr + '"' ;
           End ;
       End ;
   End ;
End ;

(* ------------------------------------------------------------------------- *
 * GetSqlInsert -> Devolve o sql de de INSERT baseado nos campos de atualiz. *
(* ------------------------------------------------------------------------- *)
Function TSqlTable.GetSqlInsert : Boolean ;
Var
   i : Integer ;
   OkFields : Boolean ;
Begin
   FSql := 'Insert Into ' + FTableName + ' ( ' ;
   OkFields := False ;
   For i:=0 To FFieldCount-1 Do
   Begin
		If ( FFieldDesc[i].FUpdOk ) Then
		Begin
			  OkFields := True ;
           If ( ( (FDBType = DBTYPE_SQLSERVER_65) Or (FDBType = DBTYPE_SQLSERVER_70) ) And
                (FFieldDesc[i].FAutoVal <> 0) ) Then
             Continue ;
			 FSql := FSql + FFieldDesc[i].FName + ', ' ;
		End ;
   End ;
   If ( Not OkFields ) Then
   Begin
		SetError('SQLTable Error: Insert -> Update Fields not found') ;
		Result := False ;
		Exit ;
   End ;
   FSql := Copy(FSql,1,Length(FSql)-2) + ' ) Values ( ' ;
   For i:=0 To FFieldCount-1 Do
   Begin
		If ( FFieldDesc[i].FUpdOk ) Then
		Begin
         If ( ( (FDBType = DBTYPE_SQLSERVER_65) Or (FDBType = DBTYPE_SQLSERVER_70) )
              And (FFieldDesc[i].FAutoVal <> 0) ) Then
            Continue ;
         FSql := FSql + PrivGetFieldValue(i) + ', ' ;
		End ;
   End ;
   // -- Desliga valores nulos
   FNullValues := False ;
   FSql := Copy(FSql,1,Length(FSql)-2) + ' )' ;
   Result := True ;
End ;

(* ------------------------------------------------------------------------- *
 * GetSqlSelect -> Devolve o comando sql de SELECT * FROM ...                *
(* ------------------------------------------------------------------------- *)
Function TSqlTable.GetSqlSelect : Boolean ;
Var
   i, f : Integer ;
Begin
   Case FDBType Of
       DBTYPE_PARADOX : Begin
            FSql := '' ;
            For i:=1 To FKeyCount Do
            Begin
               f := FKeyFields[i] ;
               FSql := FSql + FFieldDesc[f].FName + ';' ;
            End ;
            FSql := Copy(FSql,1,Length(FSql)-1) ;
       End ;
       DBTYPE_SQLSERVER_65 : Begin
             FSql := 'Select * From ' + FTableName + ' Where ' ;
             For i:=1 To FKeyCount Do
             Begin
                f := FKeyFields[i] ;
                FSql := FSql + FFieldDesc[f].FName + ' = ' + PrivGetFieldValue(f) + ' And ' ;
             End ;
             // -- Desliga valores nulos
             FNullValues := False ;
             If ( FKeyCount > 0 ) Then
                FSql := Copy(FSql,1,Length(FSql)-4)
             Else
                FSql := Copy(FSql,1,Length(FSql)-6) ;
       End ;
       DBTYPE_SQLSERVER_70 : Begin
//             FSql := 'Select *, CONVERT(datetime,TS) TimeStamp From ' + FTableName + ' Where ' ;
             FSql := 'Select * From ' + FTableName + ' Where ' ;
             For i:=1 To FKeyCount Do
             Begin
                f := FKeyFields[i] ;
                FSql := FSql + FFieldDesc[f].FName + ' = ' + PrivGetFieldValue(f) + ' And ' ;
             End ;
             // -- Desliga valores nulos
             FNullValues := False ;
             If ( FKeyCount > 0 ) Then
                FSql := Copy(FSql,1,Length(FSql)-4)
             Else
                FSql := Copy(FSql,1,Length(FSql)-6) ;
       End ;
       DBTYPE_ACCESS : Begin
             FSql := 'Select * From ' + FTableName + ' Where ' ;
             For i:=1 To FKeyCount Do
             Begin
                f := FKeyFields[i] ;
                FSql := FSql + FFieldDesc[f].FName + ' = ' + PrivGetFieldValue(f) + ' And ' ;
             End ;
             // -- Desliga valores nulos
             FNullValues := False ;
             If ( FKeyCount > 0 ) Then
                FSql := Copy(FSql,1,Length(FSql)-4)
             Else
                FSql := Copy(FSql,1,Length(FSql)-6) ;
       End ;
   End ;
   Result := True ;
End ;

(* ------------------------------------------------------------------------- *
 * GetSqlNextOrPrior -> Devolve o comando sql de SELECT para o próximo ou    *
 *                      para o registro anterior                             *
(* ------------------------------------------------------------------------- *)
Function TSqlTable.GetSqlNextOrPrior ( Opcao : String ) : Boolean ;
Var
   f : Integer ;
   Op : String ;
Begin
   Result := False ;
   If ( Opcao = 'NEXT' ) Then
      Op := ' > '
   Else
      Op := ' < ' ;
   Case FDBType Of
       DBTYPE_SQLSERVER_65 : Begin
             If ( FKeyCount > 1 ) Then
                Exit ;
             FSql := 'Select * From ' + FTableName + ' Where ' ;
             f := FKeyFields[1] ;
             FSql := FSql + FFieldDesc[f].FName + Op + PrivGetFieldValue(f) ;
             FSql := FSql + ' Order By ' + FFieldDesc[f].FName ;
             If ( Opcao <> 'NEXT' ) Then
                FSql := FSql + ' DESC ' ;
             // -- Desliga valores nulos
             FNullValues := False ;
       End ;
       DBTYPE_SQLSERVER_70 : Begin
             If ( FKeyCount > 1 ) Then
                Exit ;
//             FSql := 'Select *, CONVERT(datetime,TS) TimeStamp From ' + FTableName + ' Where ' ;
             FSql := 'Select * From ' + FTableName + ' Where ' ;
             f := FKeyFields[1] ;
             FSql := FSql + FFieldDesc[f].FName + Op + PrivGetFieldValue(f) ;
             FSql := FSql + ' Order By ' + FFieldDesc[f].FName ;
             If ( Opcao <> 'NEXT' ) Then
                FSql := FSql + ' DESC ' ;
             // -- Desliga valores nulos
             FNullValues := False ;
       End ;
       DBTYPE_ACCESS : Begin
             FSql := 'Select * From ' + FTableName + ' Where ' ;
             f := FKeyFields[1] ;
             FSql := FSql + FFieldDesc[f].FName + Op + PrivGetFieldValue(f) ;
             FSql := FSql + ' Order By ' + FFieldDesc[f].FName ;
             If ( Opcao <> 'NEXT' ) Then
                FSql := FSql + ' DESC ' ;
             // -- Desliga valores nulos
             FNullValues := False ;
       End ;
   End ;
   Result := True ;
End ;

(* ------------------------------------------------------------------------- *
 * GetSqlUpdate -> Devolve o comando sql de UPDATE baseado nos campos de atu.*
(* ------------------------------------------------------------------------- *)
Function TSqlTable.GetSqlUpdate : Boolean ;
Var
   i,f  : Integer ;
   OkFields : Boolean ;
Begin
   FSql := 'Update ' + FTableName + ' Set ' ;
   OkFields := False ;
   For i:=0 To FFieldCount-1 Do
   Begin
       If ( FFieldDesc[i].FUpdOk ) Then
       Begin
           OkFields := True ;
           If ( ( (FDBType = DBTYPE_SQLSERVER_65) Or (FDBType = DBTYPE_SQLSERVER_70) )
                And (FFieldDesc[i].FAutoVal <> 0) ) Then
              Continue ;
           try
             FSql := FSql + FFieldDesc[i].FName + ' = ' + PrivGetFieldValue(i) + ', ' ;
           except
             SetError('Erro ao Gerar FSQL Campo '+FFieldDesc[i].FName) ;
             Result := False ;
             Exit ;
           end;
        End ;
   End ;
   // -- Desliga valores nulos
   FNullValues := False ;
   If ( Not OkFields ) Then
   Begin
		SetError('SQLTable Error: Update -> Update Fields not found') ;
       Result := False ;
       Exit ;
   End ;
   FSql := Copy(FSql,1,Length(FSql)-2) + ' Where ' ;
   If ( FKeyCount > 0 ) Then
   Begin
      For i:=1 To FKeyCount Do
      Begin
          f := FKeyFields[i] ;
          FSql := FSql + FFieldDesc[f].FName + ' = ' + PrivGetFieldValue(f) + ' And ' ;
      End ;
   End ;
   // -- Desliga valores nulos
   FNullValues := False ;
      If ( FKeyCount > 0 ) Then
         FSql := Copy(FSql,1,Length(FSql)-4)
      Else
         FSql := Copy(FSql,1,Length(FSql)-6) ;
(*
   If ( FDBType = DBTYPE_SQLSERVER_70 ) Then
      FSql := FSql + ' CONVERT(DateTime,TS) = :Par_TS'
   Else Begin
      If ( FKeyCount > 0 ) Then
         FSql := Copy(FSql,1,Length(FSql)-4)
      Else
         FSql := Copy(FSql,1,Length(FSql)-6) ;
   End ;
*)
   Result := True ;
End ;

(* ------------------------------------------------------------------------- *
 * GetSqlDelete -> Devolve os campos sql de DELETE baseado nos campos de atu.*
(* ------------------------------------------------------------------------- *)
Function TSqlTable.GetSqlDelete : Boolean ;
Var
   i, f : Integer ;
   v : String ;
Begin
   FSql := 'Delete From ' + FTableName + ' Where ' ;
   For i:=1 To FKeyCount Do
   Begin
       f := FKeyFields[i] ;
       v := PrivGetFieldValue(f) ;
       if v = '' then v := '0' ;
       FSql := FSql + FFieldDesc[f].FName + ' = ' + v + ' And ' ;
   End ;
   // -- Desliga valores nulos
   FNullValues := False ;
   // ----- Teste to TimeStamp
      If ( FKeyCount > 0 ) Then
         FSql := Copy(FSql,1,Length(FSql)-4)
      Else
         FSql := Copy(FSql,1,Length(FSql)-6) ;
(*
   If ( FDBType = DBTYPE_SQLSERVER_70 ) Then
      FSql := FSql + ' CONVERT(DateTime,TS) = :Par_TS'
   Else Begin
      If ( FKeyCount > 0 ) Then
         FSql := Copy(FSql,1,Length(FSql)-4)
      Else
         FSql := Copy(FSql,1,Length(FSql)-6) ;
   End ;
*)
   Result := True ;
End ;

(* ------------------------------------------------------------------------- *
 * FillDescFieldValues -> Preenche o vetor FFieldDesc com os valores da tab. *
(* ------------------------------------------------------------------------- *)
Function TSqlTable.FillDescFieldValues : Boolean ;
Var
   i, Pos : Integer ;
   FieldName : String ;
Begin
   Result := True ;
   Case FDBType Of
		DBTYPE_PARADOX : Begin
			 For i:=0 To FTable.FieldCount-1 Do
			 Begin
				  If ( FTable.Fields[i].AsVariant = Null ) Then
						FFieldDesc[i].FValue := ''
				  Else
						FFieldDesc[i].FValue := FTable.Fields[i].AsVariant ;
			 End ;
		End ;
		DBTYPE_SQLSERVER_65 ,
      DBTYPE_SQLSERVER_70 ,
		DBTYPE_ACCESS    : Begin
			 For i:=0 To FQuerySelect.FieldCount-1 Do
			 Begin
				  FieldName := FQuerySelect.Fields[i].FieldName ;
				  Pos := GetFieldPos(FieldName) ;
				  If ( Pos = -1 ) Then
				  Begin
						SetError('SQLTable Error: FillDescFieldValues -> Field not found') ;
                  Continue ;
				  End ;
              If ( FFieldDesc[Pos].FType = ftDateTime ) Then
//                 FFieldDesc[Pos].FValue := Date_ChangeDayMonth(FQuerySelect.Fields[i].AsVariant)
                 FFieldDesc[Pos].FValue := FQuerySelect.Fields[i].AsVariant
              Else
                 FFieldDesc[Pos].FValue := FQuerySelect.Fields[i].AsVariant ;
			 End ;
(*
           If ( FDBType = DBTYPE_SQLSERVER_70 ) Then
               FTimeStamp := FQuerySelect.FieldByName('TimeStamp').AsDateTime ;
*)               
		End ;
   End ;
   If ( Not Result ) Then
       Exit ;
End ;

(* ------------------------------------------------------------------------- *
 * GetVariantKey -> Preenche o vetor FVariantKey com o valor da chave da tab *
(* ------------------------------------------------------------------------- *)
Function TSqlTable.GetVariantKey : Boolean ;
Var
   i,f : Integer ;
   VarArray : Array Of Variant ;
Begin
   If ( FKeyCount = 0 ) Then
   Begin
       SetError('SQLTable Error: GetVariantKey -> Key Fields not found') ;
       Result := False ;
       Exit ;
   End ;
   If ( FKeyCount > 1 ) Then
   Begin
       SetLength(VarArray,FKeyCount) ;
       For i:=1 To FKeyCount Do
       Begin
           f := FKeyFields[i] ;
           VarArray[i-1] := PrivGetFieldValue(f,False) ;
       End ;
       FVariantKey := VarArrayOf(VarArray) ;
   End
   Else Begin
       f := FKeyFields[1] ;
       FVariantKey := PrivGetFieldValue(f,False) ;
       If ( Copy(FVariantKey,1,1) = '"' ) Then
           FVariantKey := Copy(FVariantKey,2,Length(FVariantKey)-2) ;
   End ;
   // -- Desliga valores nulos
   FNullValues := False ;
   Result := True ;
End ;

(* ------------------------------------------------------------------------- *
 * GetRowModified -> Devole o número de linhas modificadas no último comando *
(* ------------------------------------------------------------------------- *)
Function TSqlTable.GetRowModified : Integer ;
Var
    Q : TQuery ;
Begin
	Q := TQuery.Create(Self) ;
	Q.DatabaseName := FDBName ;
	Q.Sql.Add('Select @@ROWCOUNT RowModified') ;
	Try
		Q.Open ;
   Except
       on E: Exception do
       Begin
           SetError(E.Message);
           Q.Close ;
           Result := -1 ;
           Exit ;
       End ;
   End ;
   Result := Q.FieldByName('RowModified').AsInteger ;
End ;

(* ------------------------------------------------------------------------- *
 * GetSqlServerTabFields -> Devolve uma Query com os campos da tabela        *
(* ------------------------------------------------------------------------- *)
Function TSqlTable.GetSqlServerTabFields ( pTabName : String ) : TQuery ;
Var
    Q : TQuery ;
    Sql : String ;
Begin

	Q := TQuery.Create(Self) ;
	Q.DatabaseName := FDBName ;

	Sql := 'Select * From xTabDef Where ColTabName =  ''' + pTabName + ''' Order By ' +
          'ColTabName, ColID' ;
	Q.Sql.Clear ;
	Q.Sql.Add(Sql) ;
	Try
		Q.Open ;
   Except
       on E: Exception do
       Begin
           SetError(E.Message);
           Q.Close ;
           Exit ;
       End ;
   End ;
   If ( Not Q.Eof ) Then
   Begin
       Result := Q ;
		 Exit ;
   End ;

   If ( FDBType = DBTYPE_SQLSERVER_65 ) Then
      Sql := 'Insert Into xTabDef ( ColTabName, ColID, ColName, ColType, ColLen, ColScale, ColAutoVal ) ' +
           'Select  B.NAME, A.COLID, A.NAME , C.NAME , ' +
           'A.LENGTH * (1 - sign(isnull(A.PREC,0))) + isnull(A.PREC,0), A.SCALE,  ' +
           'CONVERT(Integer,A.AUTOVAL) ' +
           'From SYSCOLUMNS A , SYSOBJECTS B , SYSTYPES C ' +
           'Where B.NAME = ''' + pTabName + ''' And B.ID = A.ID And ' +
           'A.USERTYPE = C.USERTYPE Order by COLID'
    Else
      Sql := 'Insert Into xTabDef ( ColTabName, ColID, ColName, ColType, ColLen, ColScale ) ' +
           'Select  B.NAME, A.COLID, A.NAME , C.NAME , ' +
           'A.LENGTH * (1 - sign(isnull(A.PREC,0))) + isnull(A.PREC,0), A.SCALE ' +
           'From SYSCOLUMNS A , SYSOBJECTS B , SYSTYPES C ' +
           'Where B.NAME = ''' + pTabName + ''' And B.ID = A.ID And ' +
           'A.USERTYPE = C.USERTYPE Order by COLID' ;

	 Q.Sql.Clear ;
    Q.Sql.Add(Sql) ;
    Try
       Q.Open ;
    Except
       on E: Exception do
       Begin
           SetError(E.Message);
           Exit ;
       End ;
    End ;

	Sql := 'Select * From xTabDef Where ColTabName =  ''' + pTabName + ''' Order By ' +
          'ColTabName, ColID' ;
    Q.Sql.Clear ;
    Q.Sql.Add(Sql) ;
    Try
       Q.Open ;
       Result := Q ;
    Except
       Result := Nil ;
    End ;

End ;

(* ========================================================================= *)


(* ------------------------------------------------------------------------- *
 * Create -> Cria a variável                                                 *
(* ------------------------------------------------------------------------- *)
Constructor TSqlTable.Create ;
Begin
   FDBName := VarDBName ;
   FDBType := VarDBType ;
   FSql      := ''  ;
   FMensErro := '' ;
   FErro     := False ;
   FNumErro  := 0 ;
   FNullValues := False ;
   FQuery := TQuery.Create(Self) ;
   FQuery.DatabaseName := FDBName ;
   FQuerySelect := TQuery.Create(Self) ;
   FQuerySelect.DatabaseName := FDBName ;
   FQResult := TQuery.Create(Self) ;
   FQResult.DatabaseName := FDBName ;
   QResult := TQuery.Create(Self) ;
   QResult.DatabaseName := FDBName ;
End ;

(* ------------------------------------------------------------------------- *
 * Destroy -> Destroi a variável                                             *
(* ------------------------------------------------------------------------- *)
Destructor TSqlTable.Destroy ;
Begin
   Case FDBType Of
       DBTYPE_PARADOX : Begin
           FTable.Close ;
       End ;
   End ;
   FQuery.Close ;
   FQuerySelect.Close ;
   FQResult.Close ;
   If ( QResult <> Nil ) Then
      QResult.Close ;
End ;

(* ------------------------------------------------------------------------- *
 * SQLTable_GetMensErro -> Devolve a mensagem de erro obtida                 *
(* ------------------------------------------------------------------------- *)
Function TSqlTable.GetMensErro : String ;
Begin
	Result := FMensErro ;
End ;

(* ------------------------------------------------------------------------- *
 * TSqlTable.Error -> Devolve se um erro ocorreu                              *
(* ------------------------------------------------------------------------- *)
Function TSqlTable.GetError : Boolean ;
Begin
	Result := FErro ;
End ;

(* ------------------------------------------------------------------------- *
 * TSqlTable.GetNumErro -> Devolve se um erro ocorreu                        *
(* ------------------------------------------------------------------------- *)
Function TSqlTable.GetNumErro : Integer ;
Begin
	Result := FNumErro ;
End ;

(* ------------------------------------------------------------------------- *
 * SqlTable_Start = Inicia a comunicação com o banco de dados                *
 *                  Função externa para ser chamada uma única vez            *
 *                                                                           *
 * Parametros: DBName -> Nome do database para a comunicação                 *
 *             DBTyope -> Tipo do banco de dados                             *
(* ------------------------------------------------------------------------- *)
Function SqlTable_Start ( DBName : String ; DBType : Integer = DBTYPE_PARADOX ) : Boolean ;
Begin
   Result := False ;
   If ( Test_IsEmptyStr(DBName) ) Then
       Exit ;
   VarDBName := DBName ;
   VarDBType := DBType ;
End ;

(* ------------------------------------------------------------------------- *
 * SqlTable_GetDBType                                                        *
 *    Devolve o tipo de banco de dados utilizado                             *
(* ------------------------------------------------------------------------- *)
Function SqlTable_GetDBType : Integer ;
Begin
   Result := VarDBType ;
End ;

Function SqlTable_GetDBName : String ;
Begin
   Result := VarDBName ;
End ;

(* ------------------------------------------------------------------------- *
 * TSqlTable.OpenTable                                                       *
 *      Determina a tabela que será utilizada nas funções. Abre a tabela.    *
 *      Preenche o vetor com os dados dos campos                             *
 *                                                                           *
 * Parametros: TableName -> Nome da tabela                                   *
(* ------------------------------------------------------------------------- *)
Function TSqlTable.OpenTable ( TableName : String ) : Boolean ;
Var
   i : Integer ;
   sLastCol : String ;
Begin
   Result := False ;
   Case FDBType Of
       DBTYPE_PARADOX : Begin
           If ( Str_CasePos('.db',TableName) = 0 ) Then
               TableName := TableName + '.db' ;
           FTableName := TableName ;
           Try
               FTable := TTable.Create(Self) ;
               FTable.DatabaseName := FDBName ;
               FTable.TableName := FTableName ;
               FTable.Open ;
               FFieldCount := FTable.FieldCount ;
               For i:=0 To FTable.FieldCount-1 Do
               Begin
                   FFieldDesc[i].FName     := FTable.Fields[i].FieldName ;
                   FFieldDesc[i].FPos      := i ;
                   FFieldDesc[i].FType     := GetFieldType(FTable.Fields[i].FieldName) ;
               End ;
               SetError ;
               Result := True ;
           Except
               on E: Exception do
               Begin
               	SetError(E.Message) ;
						Result := False ;
               End ;
           End ;
       End ;
       DBTYPE_ACCESS : Begin
           FTableName := TableName ;
           Try
               FQuery.Sql.Clear ;
               FQuery.Sql.Add('Select * From ' + FTableName) ;
               FQuery.Close ;
               FQuery.Open ;
               FFieldCount := FQuery.FieldCount ;
               For i:=0 To FQuery.FieldCount-1 Do
               Begin
                   FFieldDesc[i].FName := FQuery.Fields[i].FieldName ;
                   FFieldDesc[i].FPos  := i ;
                   FFieldDesc[i].FType := GetFieldType(FQuery.Fields[i].FieldName) ;
               End ;
               SetError ;
               Result := True ;
           Except
               on E: Exception do
               Begin
					   SetError(E.Message) ;
                   Result := False ;
               End ;
           End ;
       End ;
       DBTYPE_SQLSERVER_65 ,
       DBTYPE_SQLSERVER_70 : Begin
           FTableName := TableName ;
           FQuery := GetSqlServerTabFields(FTableName) ;
           If ( FErro ) Then
           Begin
               Result := False ;
               Exit ;
           End ;
           sLastCol := '' ;
           i := 0 ;
           While ( Not FQuery.Eof ) Do
           Begin
               If ( sLastCol <> FQuery.FieldByName('ColName').AsString ) Then
               Begin
                  FFieldDesc[i].FName     := FQuery.FieldByName('ColName').AsString ;
                  FFieldDesc[i].FPos      := i ;
                  FFieldDesc[i].FType     := GetFieldType(FQuery.FieldByName('ColType').AsString) ;
                  FFieldDesc[i].FDecimals := FQuery.FieldByName('ColScale').AsInteger ;
                  FFieldDesc[i].FAutoVal  := FQuery.FieldByName('ColAutoVal').AsInteger ;
                  sLastCol := FQuery.FieldByName('ColName').AsString ;
                  i := i + 1 ;
               End ;
               FQuery.Next ;
           End ;
           FFieldCount := i ;
           SetError ;
           Result := True ;
       End ;
   End ;
   FKeyCount := 0 ;
   For i:=1 To MAX_KEYFIELDS Do
       FKeyFields[i] := -1 ;
End ;

(* ------------------------------------------------------------------------- *
 * TSqlTable.SetUpdField -> Determina se um campo vai participar de          *
 *                          atualizações                                     *
 *                                                                           *
 * Parametros: FieldName -> Determinador do campo                            *
(* ------------------------------------------------------------------------- *)
Function TSqlTable.SetUpdField ( FieldName : String ) : Boolean ;
Begin
	FFieldPos := GetFieldPos(FieldName) ;
   If ( FFieldPos <> -1 ) Then
   Begin
		FFieldName := FieldName ;
		FFieldDesc[FFieldPos].FUpdOk := True ;
		SetError ;
		Result := True ;
   End
   Else Begin
		FFieldName := '' ;
		SetError('SQLTable Error: Field not Found [' + FieldName + ']') ;
		Result := False ;
   End ;
End ;

(* ------------------------------------------------------------------------- *
 * ResetUpdField -> Set para nao atualizacao um determinado campo            *
 *                                                                           *
 * Parametros: FieldName -> Determinador do campo                            *
(* ------------------------------------------------------------------------- *)
Function TSqlTable.ResetUpdField ( FieldName : String ; Value : Boolean = False ) : Boolean ;
Begin
   FFieldPos := GetFieldPos(FieldName) ;
   If ( FFieldPos <> -1 ) Then
   Begin
		FFieldName := FieldName ;
		FFieldDesc[FFieldPos].FUpdOk := Value ;
		SetError ;
		Result := True ;
   End
   Else Begin
		FFieldName := '' ;
		SetError('SQLTable Error: Field not Found [' + FieldName + ']') ;
		Result := False ;
   End ;
End ;

(* ------------------------------------------------------------------------- *
 * ResetAllUpdFields -> Reseta os campos anteriormentes setados para atualizar  *
(* ------------------------------------------------------------------------- *)
Procedure TSqlTable.ResetAllUpdFields ( Value : Boolean = False ) ;
Var
   i : Integer ;
Begin
   For i:=0 To FFieldCount-1 Do
		FFieldDesc[i].FUpdOk := Value ;
End ;

(* ------------------------------------------------------------------------- *
 * GetNumFields -> Devolve o número de campos de uma tabela                  *
(* ------------------------------------------------------------------------- *)
Function TSqlTable.GetNumFields : Integer ;
Begin
   Result := FFieldCount ;
End ;

(* ------------------------------------------------------------------------- *
 * SetFieldValues -> Determina o valor de um campo                           *
 *                                                                           *
 * Parametros: FieldName -> Determinador do campo                            *
(* ------------------------------------------------------------------------- *)
Function TSqlTable.SetFieldValue ( FieldName : String ; FieldValue : Variant ) : Boolean ;
Begin
   FFieldPos := GetFieldPos(FieldName) ;
   If ( FFieldPos <> -1 ) Then
   Begin
		FFieldName := FieldName ;
		FFieldDesc[FFieldPos].FValue := FieldValue ;
		FFieldDesc[FFieldPos].FUpdOk := True ;
		SetError ;
		Result := True ;
   End
   Else Begin
		FFieldName := '' ;
		SetError('SQLTable Error: SetFieldValues -> Field not Found [' + FieldName + ']') ;
		Result := False ;
   End ;
End ;

(* ------------------------------------------------------------------------- *
 * FormToFieldValues -> Seta valores para os campos baseados nos objetos     *
 *                      do formulario com o mesmo nome dos campos da tabela  *
 *                      Os Nomes dos campos no formulario DEVEM ter as tres  *
 *                      primeiras letras determinando o tipo do campo; o nome*
 *                      do campo na tabela deve vir a partir da quarta pos.  *
 *                                                                           *
 * Parametros: F -> Formulario                                               *
(* ------------------------------------------------------------------------- *)
Procedure TSqlTable.FormToFieldValues ( F : TForm = Nil ) ;
Var
   i, p : Integer ;
   FormName : String ;
Begin
   If ( F = Nil ) Then
		F := Screen.ActiveForm ;
   For i:=0 To F.ComponentCount-1 Do
   Begin
		FormName := Obj_GetFormObjName(F,i) ;
		p := GetFieldPos(FormName) ;
		If ( p = -1 ) Then
			 Continue ;
		FFieldDesc[p].FValue := Obj_GetFormObjValue(F,i) ;
   End ;
End ;

(* ------------------------------------------------------------------------- *
 * FieldValuesToForm -> Preenche os objetos do formulario baseado nos valores*
 *                      dos campos da tabela.                                *
 *                      Os Nomes dos campos no formulario DEVEM ter as tres  *
 *                      primeiras letras determinando o tipo do campo; o nome*
 *                      do campo na tabela deve vir a partir da quarta pos.  *
 *                                                                           *
 * Parametros: F -> Formulario                                               *
(* ------------------------------------------------------------------------- *)
Procedure TSqlTable.FieldValuesToForm ( F : TForm = Nil ) ;
Var
   i, p : Integer ;
   FormName : String ;
Begin
   If ( F = Nil ) Then
		F := Screen.ActiveForm ;
   For i:=0 To F.ComponentCount-1 Do
   Begin
		FormName := Obj_GetFormObjName(F,i) ;
		p := GetFieldPos(FormName) ;
		If ( p = -1 ) Then
			 Continue ;
		Obj_SetFormObjValue(F,i,FFieldDesc[p].FValue) ;
   End ;
End ;

(* ------------------------------------------------------------------------- *
 * SetKeyValue -> Indica que um campo faz parte da chave da tabela com o seu *
 *                valor                                                      *
 *                                                                           *
 * Parametros: FieldName -> Determinador do campo                            *
 *             FieldValue -> Valor do campo                                  *
(* ------------------------------------------------------------------------- *)
Function TSqlTable.SetKeyValue ( FieldName : String ; FieldValue : Variant ; ParResetKey : Boolean = False ) : Boolean ;
Begin
   If ( ParResetKey ) Then
		ResetKey ;
   FFieldPos := GetFieldPos(FieldName) ;
   If ( FFieldPos <> -1 ) Then
   Begin
		FFieldName := FieldName ;
		Inc(FKeyCount) ;
		If ( FKeyCount > MAX_KEYFIELDS ) Then
		Begin
			 ResetKey ;
			 SetError('SQLTable Error: SetKey -> Number of key fields exceded') ;
			 Result := False ;
			 Exit ;
		End ;
		FKeyFields[FKeyCount] := FFieldPos ;
		FFieldDesc[FFieldPos].FValue := FieldValue ;
		FFieldDesc[FFieldPos].FUpdOk := True ;
		SetError ;
		Result := True ;
   End
   Else Begin
		ResetKey ;
		SetError('SQLTable Error: SetKey -> Field not Found [' + FieldName + ']') ;
	Result := False ;
   End ;
End ;

(* ------------------------------------------------------------------------- *
 * ResetKey -> Reseta a chave da tabela                                      *
(* ------------------------------------------------------------------------- *)
Procedure TSqlTable.ResetKey ;
Var
   i : Integer ;
Begin
   FKeyCount := 0 ;
   For i:=1 To MAX_KEYFIELDS Do
		FKeyFields[i] := -1 ;
End ;

(* ------------------------------------------------------------------------- *
 * SetFieldKey -> Indica que um campo faz parte da chave da tabela           *
 *                                                                           *
 * Parametros: FieldName -> Determinador do campo                            *
(* ------------------------------------------------------------------------- *)
Function TSqlTable.SetFieldKey ( FieldName : String ) : Boolean ;
Begin
   FFieldPos := GetFieldPos(FieldName) ;
   If ( FFieldPos <> -1 ) Then
   Begin
		FFieldName := FieldName ;
		Inc(FKeyCount) ;
		If ( FKeyCount > MAX_KEYFIELDS ) Then
		Begin
			 ResetKey ;
			 SetError('SQLTable Error: SetKey -> Number of key fields exceded') ;
			 Result := False ;
			 Exit ;
		End ;
		FKeyFields[FKeyCount] := FFieldPos ;
		FFieldDesc[FFieldPos].FUpdOk := True ;
		SetError ;
		Result := True ;
   End
   Else Begin
		ResetKey ;
		SetError('SQLTable Error: SetKey -> Field not Found [' + FieldName + ']') ;
		Result := False ;
   End ;
End ;

(* ------------------------------------------------------------------------- *
 * SetKey -> Determina o valor das chaves da tabela                          *
 *                                                                           *
 * Parametros: Values -> array com os valores da chave da tabela             *
(* ------------------------------------------------------------------------- *)
Function TSqlTable.SetKey ( Values : Array of Variant ) : Boolean ;
Var
   i : Integer;
Begin
   For i:=1 To FKeyCount Do
		FFieldDesc[FKeyFields[i]].FValue := Values[i-1] ;
   Result := True ;
End ;

(* ------------------------------------------------------------------------- *
 * GetFieldValue -> Pega o valor de um campo da tabela tabela                *
 *                                                                           *
 * Parametros: FieldName -> Determinador do campo                            *
(* ------------------------------------------------------------------------- *)
Function TSqlTable.GetFieldValue ( FieldName : String ) : Variant ;
Begin
   FFieldPos := GetFieldPos(FieldName) ;
   If ( FFieldPos <> -1 ) Then
   Begin
		FFieldName := FieldName ;
		Try
			 Result := FFieldDesc[FFieldPos].FValue ;
			 If ( Result = Null ) Then
			 Begin
					Case FFieldDesc[FFieldPos].FType Of
						ftString   : Result := '' ;
						ftInteger  ,
						ftFloat    : Result := 0 ;
						ftDateTime : Result := Str_StrToDate('') ;
					End ;
			 End ;
		Except
			 SetError('SQLTable Error: GetFieldValue -> Invalid Field Value [' + FieldName + ']') ;
		End ;
   End
   Else Begin
		SetError('SQLTable Error: GetFieldValue -> Field not Found [' + FieldName + ']') ;
   End ;
End ;

(* ------------------------------------------------------------------------- *
 * GetTabFieldType -> Devole o tipo de um campo da tabela                    *
 *                                                                           *
 * Parametros: FieldName -> Determinador do campo                            *
(* ------------------------------------------------------------------------- *)
Function TSqlTable.GetTabFieldType ( FieldName : String ) : TFieldType ;
Begin
   FFieldPos := GetFieldPos(FieldName) ;
   If ( FFieldPos <> -1 ) Then
   Begin
		FFieldName := FieldName ;
		Try
			 Result := FFieldDesc[FFieldPos].FType ;
		Except
			 SetError('SQLTable Error: GetFieldType -> Invalid Field Value [' + FieldName + ']') ;
		End ;
   End
   Else Begin
		SetError('SQLTable Error: GetFieldType -> Field not Found [' + FieldName + ']') ;
   End ;
End ;

(* ------------------------------------------------------------------------- *
 * Find -> Procura um registro baseado na chave setada em FKeyFields         *
(* ------------------------------------------------------------------------- *)
Function TSqlTable.Find ( FillDesc : Boolean = False ) : Boolean ;
Var
   ResultEof : Boolean ;
Begin
   ResultEof := False ;
   Result := False ;
   If ( Not GetSqlSelect ) Then
		Exit ;
	Case FDBType Of
   	   DBTYPE_PARADOX : Begin
           If ( Not GetVariantKey ) Then
               Exit ;
           ResultEof := FTable.Locate(FSql,FVariantKey,[]) ;
       End ;
       DBTYPE_SQLSERVER_65 ,
       DBTYPE_SQLSERVER_70 ,
       DBTYPE_ACCESS    : Begin
           FQuerySelect.Close ;
           FQuerySelect.Sql.Clear ;
           FQuerySelect.Sql.Add(FSql) ;
           Try
               FQuerySelect.Open ;
           Except
               on E: Exception do
               Begin
                   SetError(E.Message);
                   Result := False ;
                   Exit ;
               End ;
           End ;
           ResultEof := Not FQuerySelect.Eof ;
(*
           If ( FDBType = DBTYPE_SQLSERVER_70 ) Then
              FTimeStamp := FQuerySelect.FieldByName('TimeStamp').AsDateTime ;
*)              
		End ;
   End ;
   If ( ResultEof ) Then
   Begin
       If ( FillDesc ) Then
          If ( Not FillDescFieldValues ) Then
               Exit ;
       Result := True ;
   End
   Else
       Result := False ;
End ;

(* ------------------------------------------------------------------------- *
 * Next -> Pega o próximo registro baseado na posicao da tabela              *
(* ------------------------------------------------------------------------- *)
Function TSqlTable.Next ( FillFields : Boolean = True ) : Boolean ;
Var
   ResultEof : Boolean ;
Begin
	Result := False ;
	Case FDBType Of
	DBTYPE_PARADOX : Begin
			 FTable.Next ;
			 If ( FTable.Eof ) Then
				  Result := False
           Else Begin
               If ( FillFields ) Then
                   If ( Not FillDescFieldValues ) Then
                       Exit ;
               Result := True ;
           End ;
   End ;
   DBTYPE_SQLSERVER_65 ,
   DBTYPE_SQLSERVER_70 ,
   DBTYPE_ACCESS    : Begin
      If ( Not GetSqlNextOrPrior('NEXT') ) Then
         Exit ;
      If ( Not GetExecSql('SET ROWCOUNT 1') ) Then
         Exit ;
      FQuerySelect.Close ;
      FQuerySelect.Sql.Clear ;
      FQuerySelect.Sql.Add(FSql) ;
      Try
          FQuerySelect.Open ;
      Except
          on E: Exception do
          Begin
              GetExecSql('SET ROWCOUNT 0') ;
              SetError(E.Message);
              Result := False ;
              Exit ;
          End ;
      End ;
      GetExecSql('SET ROWCOUNT 0') ;
      ResultEof := FQuerySelect.Eof ;
(*
      If ( FDBType = DBTYPE_SQLSERVER_70 ) Then
         FTimeStamp := FQuerySelect.FieldByName('TimeStamp').AsDateTime ;
*)
      If ( Not ResultEof ) Then
      Begin
          If ( FillFields ) Then
             If ( Not FillDescFieldValues ) Then
                  Exit ;
          Result := True ;
      End
      Else
          Result := False ;
      GetExecSql('SET ROWCOUNT 0') ;
   End ;
   End ;
End ;

(* ------------------------------------------------------------------------- *
 * Prior -> Pega o registro anterior baseado na posicao da tabela            *
(* ------------------------------------------------------------------------- *)
Function TSqlTable.Prior ( FillFields : Boolean = True ) : Boolean ;
Var
   ResultBof : Boolean ;
Begin
   Result := False ;
	Case FDBType Of
   	DBTYPE_PARADOX : Begin
           FTable.Prior ;
           If ( FTable.Bof ) Then
               Result := False
           Else Begin
               If ( FillFields ) Then
                   If ( Not FillDescFieldValues ) Then
                       Exit ;
               Result := True ;
           End ;
       End ;
       DBTYPE_SQLSERVER_65 ,
       DBTYPE_SQLSERVER_70 ,
       DBTYPE_ACCESS    : Begin
          If ( Not GetSqlNextOrPrior('PRIOR') ) Then
             Exit ;
          If ( Not GetExecSql('SET ROWCOUNT 1') ) Then
             Exit ;
          FQuerySelect.Close ;
          FQuerySelect.Sql.Clear ;
          FQuerySelect.Sql.Add(FSql) ;
          Try
             FQuerySelect.Open ;
          Except
             on E: Exception do
             Begin
                 GetExecSql('SET ROWCOUNT 0') ;
                 SetError(E.Message);
                 Result := False ;
                 Exit ;
             End ;
          End ;

          GetExecSql('SET ROWCOUNT 0') ;
          FQuerySelect.Last;
          ResultBof := FQuerySelect.Bof ;

      If ( Not ResultBof ) Then
      Begin
          If ( FillFields ) Then
             If ( Not FillDescFieldValues ) Then
                  Exit ;
          Result := True ;
      End
      Else
          Result := False ;
      GetExecSql('SET ROWCOUNT 0') ;
   End ;
   End ;

End ;

(* ------------------------------------------------------------------------- *
 * GetLastIdentity : Devolve o ID do último registro                         *
(* ------------------------------------------------------------------------- *)
Function TSqlTable.GetLastIdentity : LongInt ;
Begin
   Result := -1 ;
   If ( Not GetExecSqlSel('Select @@IDENTITY As ''Identity''') ) Then
      Exit ;
   Result := FQResult.FieldByName('Identity').AsInteger ;
End ;

(* ------------------------------------------------------------------------- *
 * GetNumRows -> Devolve o número de linhas afetado pelo último statement    *
(* ------------------------------------------------------------------------- *)
Function TSqlTable.GetNumRows : LongInt ;
Begin
   Result := -1 ;
   FQuerySelect.Close ;
   FQuerySelect.Sql.Clear ;
   FQuerySelect.Sql.Add('Select @@ROWCOUNT As ''NumRows''') ;
   Try
      FQuerySelect.Open ;
   Except
      On E:Exception Do
      Begin
         SetError(E.Message) ;
         Exit ;
      End ;
   End;
   Result := FQuerySelect.FieldByName('NumRows').AsInteger ;
End ;

(* ------------------------------------------------------------------------- *
 * Insert  = Insere um registro numa tabela                                  *
(* ------------------------------------------------------------------------- *)
Function TSqlTable.Insert ( ClearUpdFields : Boolean = True ) : Boolean ;
Var
   i : Integer ;
Begin
   Result := False ;
   Case FDBType Of
		DBTYPE_PARADOX : Begin
			 Try
				  FTable.Append ;
				  For i:=0 To FFieldCount-1 Do
				  Begin
						If ( FFieldDesc[i].FUpdOk ) Then
							 Try
								  FTable.FieldValues[FFieldDesc[i].FName] := FFieldDesc[i].FValue ;
							 Except
							 End ;
				  End ;
					FTable.Post ;
           Except
               on E:Exception do
               Begin
                   FTable.Cancel ;
                   FExceptErro := E.Message ;
                   SetError('<>') ;
                   Exit ;
               End ;
           End ;
       End ;
       DBTYPE_SQLSERVER_65 ,
       DBTYPE_SQLSERVER_70 ,
       DBTYPE_ACCESS    : Begin
           If ( Not GetSqlInsert ) Then
               Exit ;
           FQuery.Close ;
           FQuery.Sql.Clear ;
           FQuery.Sql.Add(FSql) ;
           Try
               FQuery.ExecSql ;
           Except
               on E:Exception do
               Begin
                   FExceptErro := E.Message ;
                   SetError('<>') ;
                   Exit ;
               End ;
           End ;
       End ;
   End ;
   If ( ClearUpdFields ) Then
       ResetAllUpdFields ;
   Result := True ;
End ;

(* ------------------------------------------------------------------------- *
 * Update -> Altera um registro baseado nos campos determinados              *
(* ------------------------------------------------------------------------- *)
Function TSqlTable.Update ( ClearUpdFields : Boolean = True ;
                            ExecFind : Boolean = True ) : Boolean ;
Var
   i : Integer ;
Begin
   Result := False ;
   Case FDBType Of
       DBTYPE_PARADOX : Begin
           If ( ExecFind ) Then
           Begin
               If ( Not Find ) Then
               Begin
                   SetError('SQLTable Error: Update -> Record not Found') ;
                   Exit ;
               End ;
           End ;
           Try
               FTable.Edit ;
               For i:=0 To FFieldCount-1 Do
               Begin
                   If ( FFieldDesc[i].FUpdOk ) Then
                       Try
                           FTable.FieldValues[FFieldDesc[i].FName] := FFieldDesc[i].FValue ;
                       Except
                       End ;
               End ;
               FTable.Post ;
           Except
               on E: Exception do
               Begin
                   FTable.Cancel ;
                   FExceptErro := E.Message ;
                   SetError('<>') ;
                   Exit ;
               End ;
           End ;
       End ;
       DBTYPE_SQLSERVER_65 ,
       DBTYPE_SQLSERVER_70 ,
       DBTYPE_ACCESS    : Begin
           If ( Not GetSqlUpdate ) Then
               Exit ;
           FQuery.Close ;
           FQuery.Sql.Clear ;
           FQuery.Sql.Add(FSql) ;
(*
           If ( FDBType = DBTYPE_SQLSERVER_70 ) Then
               FQuery.ParamByName('Par_TS').AsDateTime := FTimeStamp ;
*)               
           Try
               FQuery.ExecSql ;
           Except
               on E: Exception do
               Begin
                   FExceptErro := E.Message ;
                   SetError('<>') ;
						Exit ;
               End ;
           End ;
           If ( FDBType = DBTYPE_SQLSERVER_70 ) Then
           Begin
              If ( GetRowModified() <= 0 ) Then
              Begin
                  SetError('Este(s) registro(s) provavelmente foram modificado(s) ' +
                           'anteriormente por outro processo. ' +
                           'Por favor repita o processamento realizado.') ;
                  FNumErro := ERRO_REC_MODIFIED ;
                  Exit ;
              End ;
           End ;
       End ;
   End ;
   If ( ClearUpdFields ) Then
       ResetAllUpdFields ;
   Result := True ;
End ;

(* ------------------------------------------------------------------------- *
 * Delete -> Exclui um registro baseado nos campos determinados              *
(* ------------------------------------------------------------------------- *)
Function TSqlTable.Delete : Boolean ;
Begin
   Result := False ;
	Case FDBType Of
   	DBTYPE_PARADOX : Begin
           If ( Not Find ) Then
           Begin
               SetError('SQLTable Error: Delete -> Record not Found') ;
               Exit ;
           End ;
			 Try
               FTable.Delete ;
               Result := True ;
           Except
               on E: Exception do
               Begin
                   FTable.Cancel ;
                   SetError('SQLTable Error: Delete (PARADOX) -> ' + E.Message);
                   Exit ;
               End ;
           End ;
       End ;
       DBTYPE_SQLSERVER_65 ,
       DBTYPE_SQLSERVER_70 ,
       DBTYPE_ACCESS    : Begin
           If ( Not GetSqlDelete ) Then
               Exit ;
           FQuery.Close ;
           FQuery.Sql.Clear ;
           FQuery.Sql.Add(FSql) ;
(*
           If ( FDBType = DBTYPE_SQLSERVER_70 ) Then
               FQuery.ParamByName('Par_TS').AsDateTime := FTimeStamp ;
*)               
           Try
               FQuery.ExecSql ;
           Except
               on E: Exception do
				  Begin
                   FExceptErro := E.Message ;
                   SetError('<>') ;
                   Result := False ;
                   Exit ;
               End ;
           End ;
{           If ( FDBType = DBTYPE_SQLSERVER_70 ) Then
           Begin
              If ( GetRowModified() <= 0 ) Then
              Begin
                  SetError('Este(s) registro(s) provavelmente foram modificado(s) ' +
                           'anteriormente por outro processo. ' +
                           'Por favor repita o processamento realizado.') ;
                  FNumErro := ERRO_REC_MODIFIED ;
                  Exit ;
              End ;
           End ; }
       End ;
   End ;
   ResetAllUpdFields ;
   Result := True ;
End ;

(* ------------------------------------------------------------------------- *
 * SetInsert => Executa o comando SET INDENTITY_INSERT (SQL 6.5)            *
(* ------------------------------------------------------------------------- *)
Function TSqlTable.SetInsert ( TabName : String ; Value : String ) : Boolean ;
Var
   Sql : String ;
Begin
   Result := False ;
   If ( FDBType <> DBTYPE_SQLSERVER_65 ) Then
      Exit ;
   Sql := 'SET IDENTITY_INSERT ' + TabName + ' ' + Value ;
   FQuery.Close ;
   FQuery.Sql.Clear ;
   FQuery.Sql.Add(Sql) ;
   Try
       FQuery.ExecSql ;
   Except
       on E: Exception do
       Begin
           SetError(E.Message) ;
           Exit ;
       End ;
   End ;
   Result := True ;
End ;

(* ------------------------------------------------------------------------- *
 * ExecSqlSel -> Executa um comando sql de select                            *
(* ------------------------------------------------------------------------- *)
Function TSqlTable.ExecSqlSel ( Sql : String ) : TQuery ;
Begin
   SetError() ;
   QResult := Nil ;
   FQResult.Close ;
   FQResult.Sql.Clear ;
   FQResult.Sql.Add(Sql) ;
   Try
       FQResult.Open ;
   Except
       on E: Exception do
       Begin
           Result := Nil ;
           SetError(E.Message);
           FNumErro := GetDBError() ;
           Exit ;
       End ;
   End ;
   QResult := FQresult ;
   Result := FQResult ;
End ;

(* ------------------------------------------------------------------------- *
 * ExecSql -> Executa um comando sql generico                                *
(* ------------------------------------------------------------------------- *)
Function TSqlTable.ExecSql ( Sql : String ) : TQuery ;
Begin
   SetError() ;
   QResult := Nil ;
   FQResult.Close ;
   FQResult.Sql.Clear ;
   FQResult.Sql.Add(Sql) ;
   Try
       FQResult.ExecSql ;
   Except
       on E: Exception do
       Begin
           Result := Nil ;
           SetError(E.Message);
           FNumErro := GetDBError() ;
           Exit ;
       End ;
   End ;
   QResult := FQresult ;
   Result := FQResult ;
End ;

(* ------------------------------------------------------------------------- *
 * GetExecSqlSel -> Devolve a execucao de uma query de select                *
(* ------------------------------------------------------------------------- *)
Function TSqlTable.GetExecSqlSel ( Sql : String ) : Boolean ;
Begin
   ExecSqlSel(Sql) ;
   If ( FErro ) Then
      Result := False
   Else
      Result := True ;
End ;

(* ------------------------------------------------------------------------- *
 * GetExecSql -> Executa um comando sql generico                             *
(* ------------------------------------------------------------------------- *)
Function TSqlTable.GetExecSql ( Sql : String ) : Boolean ;
Begin
   ExecSql(Sql) ;
   If ( FErro ) Then
      Result := False
   Else
      Result := True ;
End ;

(* ------------------------------------------------------------------------- *
 * ExecQuerySel -> Executa uma query de select                               *
(* ------------------------------------------------------------------------- *)
Function TSqlTable.ExecQuerySel ( Q : TQuery = Nil ) : Boolean ;
Begin
   If ( Q = Nil ) Then
      Q := QResult ;
   SetError() ;
   Result := True ;
   Try
       Q.Open ;
   Except
       on E: Exception do
       Begin
          SetError(E.Message);
          Result := False ;
       End ;
   End ;
End ;

(* ------------------------------------------------------------------------- *
 * ExecQuery -> Executa uma query                                            *
(* ------------------------------------------------------------------------- *)
Function TSqlTable.ExecQuery ( Q : TQuery = Nil ) : Boolean ;
Begin
   If ( Q = Nil ) Then
      Q := QResult ;
   SetError() ;
   Result := True ;
   Try
       Q.ExecSql ;
   Except
       on E: Exception do
       Begin
          SetError(E.Message);
          Result := False ;
       End ;
   End ;
End ;

(* ------------------------------------------------------------------------- *
 * BeginTrans -> Inicia uma transação                                        *
(* ------------------------------------------------------------------------- *)
Function TSqlTable.BeginTrans : Boolean ;
Begin
	Case FDBType Of
       DBTYPE_PARADOX ,
       DBTYPE_ACCESS : Begin
          Result := True ;
       End ;
       DBTYPE_SQLSERVER_65 ,
       DBTYPE_SQLSERVER_70 : Begin
       try
         Result := true ;
         if not DB_Univers.DataBaseUnivers.InTransaction then
           DB_Univers.DataBaseUnivers.StartTransaction;
       except
         Result := false ;
       end;  
         {  Comentado por Bruno em 25/04/2000
          If ( Not GetExecSql('IF @@TRANCOUNT = 0 BEGIN TRANSACTION') ) Then
          Begin
             Result := False ;
             GetExecSql('RollBack') ;
          End
          Else Begin
             Result := True ;
          End ;}
       End ;
   End ;
End ;

(* ------------------------------------------------------------------------- *
 * ExeecCommit -> Executa um commit no banco de dados                        *
(* ------------------------------------------------------------------------- *)
Function TSqlTable.ExecCommit : Boolean ;
Begin
	Case FDBType Of
       DBTYPE_PARADOX ,
       DBTYPE_ACCESS : Begin
          Result := True ;
       End ;
       DBTYPE_SQLSERVER_65 ,
       DBTYPE_SQLSERVER_70 : Begin
       try
         Result := true ;
         if DB_Univers.DataBaseUnivers.InTransaction then
           DB_Univers.DataBaseUnivers.Commit;
       except
         Result := false ;
       end;
{          If ( GetTransCount() > 0 ) Then
          Begin
             If ( Not GetExecSql('IF @@TRANCOUNT > 0 COMMIT') ) Then
             Begin
                Result := False ;
                GetExecSql('RollBack') ;
             End
             Else Begin
                Result := True ;
             End ;
          End ;}
       End ;
   End ;
End ;

(* ------------------------------------------------------------------------- *
 * RollBack -> Executa uma transacao de RollBack                             *
(* ------------------------------------------------------------------------- *)
Function TSqlTable.ExecRollBack : Boolean ;
Begin
	Case FDBType Of
       DBTYPE_PARADOX ,
       DBTYPE_ACCESS : Begin
          Result := True ;
       End ;
       DBTYPE_SQLSERVER_65 ,
       DBTYPE_SQLSERVER_70 : Begin
       try
         Result := true ;
         if DB_Univers.DataBaseUnivers.InTransaction then
           DB_Univers.DataBaseUnivers.RollBack;
       except
         Result := false ;
       end;

       {
          If ( Not GetExecSql('IF @@TRANCOUNT > 0 COMMIT RollBack') ) Then
          Begin
             Result := False ;
          End
          Else Begin
             Result := True ;
          End ;}
       End ;
   End ;
End ;

(* ------------------------------------------------------------------------- *
 * FormSetFieldValue ==> Recebe um formulário para determinar os valores     *
 *                       dos campos                                          *
(* ------------------------------------------------------------------------- *)
Function TSqlTable.FormSetFieldValue ( F : TForm = Nil ; Tag : Integer = 0 ) : Boolean ;
Var
   i : Integer ;
   FieldName : String ;
   Value : Variant ;
   Comp : TrsSuperEdit ;
Begin
   Result := True ;
   If ( F = Nil ) Then
       F := Screen.ActiveForm ;
   For i:=0 To F.ComponentCount-1 Do
   Begin
       If ( F.Components[i].Tag >= 0 ) Then
           Continue ;
       If ( (Tag <> 0)  And  (F.Components[i].Tag <> Tag) ) Then
			 Continue ;
		If ( F.Components[i] Is TPanel ) Then
			 Continue ;
		If ( F.Components[i] Is TrsSuperEdit ) Then
			 FieldName := TrsSuperEdit(F.Components[i]).TagName
//		Else If ( F.Components[i] Is TGNRadioGroup ) Then
//			 FieldName := TGNRadioGroup(F.Components[i]).FieldName
		Else
			 FieldName := Copy(F.Components[i].Name,4,Length(F.Components[i].Name)) ;
		If ( F.Components[i] Is TrsSuperEdit ) Then
		Begin
			 Comp := TRSSuperEdit(F.Components[i]) ;
			 If ( Comp.Format = foReal ) Then
				  Value := Str_StrToFloat(Comp.Text)
			 Else If ( Comp.Format = foInteger ) Then
				  Value := Str_StrToInt(Comp.Text)
			 Else If ( (Comp.Format = foDate) Or (Comp.Format = foFullDate) ) Then
				  Value := Str_StrToDate(Comp.Text)
			 Else If ( Comp.Format = foCurrency ) Then
				  Value := Str_MoneyToFloat(Comp.Text,Comp.Decimals)
			 Else
				  Value := Comp.Text ;
		End
//		Else If ( F.Components[i] Is TGNRadioGroup ) Then
//			 Value := TGNRadioGroup(F.Components[i]).ItemChoice
		Else If ( F.Components[i] Is TDateTimePicker ) Then
			 Value := TDateTimePicker(F.Components[i]).DateTime
		Else If ( F.Components[i] Is TComboBox ) Then
			 Value := TComboBox(F.Components[i]).Text
		Else Begin
			 Value := Obj_GetFormObjValue(F,i) ;
		End ;
		SetFieldValue(FieldName,Value) ;
   End ;
End ;

(* ------------------------------------------------------------------------- *
 * SetFormObjValue ==> Atribui ao objetos do formulario os valores da tabela *
(* ------------------------------------------------------------------------- *)
Function TSqlTable.SetFormObjValue ( F : TForm = Nil ; Tag : Integer = 0 ) : Boolean ;
Var
   i : Integer ;
   FieldName : String ;
   Value : Variant ;
Begin
   If ( F = Nil ) Then
		F := Screen.ActiveForm ;
   For i:=0 To F.ComponentCount-1 Do
   Begin
		If ( F.Components[i].Tag >= 0 ) Then
			 Continue ;
		If ( (Tag <> 0)  And  (F.Components[i].Tag <> Tag) ) Then
			 Continue ;
		If ( F.Components[i] Is TPanel ) Then
			 Continue ;
		If ( F.Components[i] Is TrsSuperEdit ) Then
			 FieldName := TRSSuperEdit(F.Components[i]).TagName
//		Else If ( F.Components[i] Is TGNRadioGroup ) Then
//			 FieldName := TGNRadioGroup(F.Components[i]).FieldName
		Else
			 FieldName := Copy(F.Components[i].Name,4,Length(F.Components[i].Name)) ;
		Value := GetFieldValue(FieldName) ;
		Obj_SetFormObjValue(F,i,Value) ;
   End ;
   Result := True ;
End ;

(* ------------------------------------------------------------------------- *
 * SeekGet ==> Pesquisa uma chave numa tabela e devolve um campo             *
(* ------------------------------------------------------------------------- *)
Function TSqlTable.SeekGet ( TableName : String ; Fields : String ;
									 aKey : Array of Variant ; RetField : String ;
									 Erro : Boolean = False ) : Variant ;
Var
   T : TTable ;
   bFind : Boolean ;
   k, i, j : Integer ;
   sTemp : String ;
   fldType : TFieldType ;
Begin
   Result := '' ;
	Case VarDBType Of
	    DBTYPE_PARADOX : Begin
			 T := TTable.Create(Self) ;
			 T.TableName := TableName ;
			 T.DatabaseName := VarDBName ;
			 T.Open ;
			 If ( Length(aKey) > 1 ) Then
				  bFind := T.Locate(Fields,VarArrayOf(aKey),[])
           Else
               Try
                   bFind := T.Locate(Fields,aKey[0],[]) ;
               Except
                   bFind := False ;
               End ;
           If ( Not bFind ) Then
           Begin
               If ( Erro ) Then
                   Result := ''
               Else
                   Result := '' ;
           End
           Else
               Result := T.FieldByName(RetField).AsVariant ;
               If ( Result = Null ) Then
                   Result := '' ;
           T.Close ;
       End ;
       DBTYPE_ACCESS    ,
       DBTYPE_SQLSERVER_65 ,
       DBTYPE_SQLSERVER_70 : Begin
           FSql := 'Select * From ' + TableName + ' Where ' ;
           k := Pos(';',Fields) ;
           i := 1 ;
           j := 0 ;
           If ( k <> 0 ) Then
           Begin
               While ( k <> 0 ) Do
               Begin
                   sTemp := Copy(Fields,i,k-1) ;
                   fldType := GetFieldType(sTemp) ;
                   Case fldType Of
                       ftString ,
                       ftDateTime,
                       ftDate     : FSql := FSql + sTemp + ' = ''' + aKey[j] + ''' And ' ;
                       ftInteger,
                       ftFloat    : FSql := FSql + sTemp + ' = ' + aKey[j] + ' And ' ;
                   End ;
                   j := j + 1 ;
                   i := k + 1 ;
                   Fields := Copy(Fields,k+1,Length(Fields)) ;
                   k := Pos(';',Fields) ;
               End ;
               fldType := GetFieldType(Fields) ;
               Case fldType Of
                   ftString ,
                   ftDateTime,
                   ftDate     : FSql := FSql + Fields + ' = ''' + aKey[j] + ''' And ' ;
                   ftInteger,
                   ftFloat    : FSql := FSql + Fields + ' = ' + aKey[j] + ' And ' ;
               End ;
               FSql := Copy(FSql,1,Length(FSql)-4) ;
           End
           Else Begin
				  If ( Length(Fields) > 0 ) Then
               Begin
                   fldType := GetFieldType(Fields) ;
                   Case fldType Of
                       ftString ,
                       ftDateTime : FSql := FSql + Fields + ' = ''' + aKey[0] + '''' ;
                       ftInteger,
                       ftFloat    : FSql := FSql + Fields + ' = ' + aKey[0] ;
                   End ;
               End
               Else Begin
                   Result := '' ;
                   Exit ;
               End ;
           End ;
           Try
               FQuerySelect.Close ;
               FQuerySelect.Sql.Clear ;
               FQuerySelect.Sql.Add(FSql) ;
               Try
                   FQuerySelect.Open ;
               Except
                   on E: Exception do
                   Begin
                       SetError(E.Message);
                   End ;
               End ;
               If ( FQuerySelect.Eof ) Then
               Begin
                   If ( Erro ) Then
							 Result := ''
                   Else
                      Result := '' ;
               End
               Else
                   Result := FQuerySelect.FieldByName(RetField).AsVariant ;
                   If ( Result = Null ) Then
                       Result := '' ;
           Except
               If ( Erro ) Then
                   Result := ''
               Else
                   Result := '' ;
           End ;
           FQuerySelect.Close ;
       End ;
   End ;
End ;

(* ------------------------------------------------------------------------- *
 * Seek ==> Pesquisa uma chave numa tabela                                   *
(* ------------------------------------------------------------------------- *)
Function TSqlTable.Seek ( TableName : String ; Fields : String ;  aKey : Array of Variant ) : Boolean ;
Var
   T : TTable ;
   k, i, j : Integer ;
   sTemp : String ;
Begin
   Result := False ;
	Case VarDBType Of
   	DBTYPE_PARADOX : Begin
           T := TTable.Create(Self) ;
           T.TableName := TableName ;
           T.DatabaseName := VarDBName ;
           T.Open ;
           If ( Length(aKey) > 1 ) Then
               Result := T.Locate(Fields,VarArrayOf(aKey),[])
           Else Begin
               Try
                   Result := T.Locate(Fields,aKey[0],[]) ;
               Except
                   Result := False ;
               End ;
           End ;
           T.Close ;
       End ;
       DBTYPE_SQLSERVER_65 ,
       DBTYPE_SQLSERVER_70 ,
       DBTYPE_ACCESS : Begin
           FSql := 'Select ' + Fields + ' From ' + TableName + ' Where ' ;
           k := Pos(';',Fields) ;
           i := 1 ;
           j := 0 ;
           While ( k <> 0 ) Do
           Begin
               sTemp := Copy(Fields,i,k-1) ;
               FSql := FSql + sTemp + ' = ' + aKey[j] + ' And ' ;
               j := j + 1 ;
               i := k + 1 ;
               Fields := Copy(Fields,k+1,Length(Fields)) ;
               k := Pos(';',Fields) ;
           End ;
           FSql := Copy(FSql,1,Length(FSql)-4) ;
           Try
               FQuerySelect.Close ;
               FQuerySelect.Sql.Clear ;
               FQuerySelect.Sql.Add(FSql) ;
               FQuerySelect.Open ;
               Result := FQuerySelect.Eof ;
           Except
				  Result := False ;
           End ;
       End ;
   End ;
End ;

Procedure TSqlTable.IndexName ( Value : String ) ;
Begin
	Case VarDBType Of
   	DBTYPE_PARADOX : Begin
           FTable.IndexName := Value ;
       End ;
   End ;
End ;

(* ------------------------------------------------------------------------- *
 * SetNullValues -> Determina o valor da variável para valores nulos         *
(* ------------------------------------------------------------------------- *)
Procedure TSqlTable.SetNullValues ( Value : Boolean ) ;
Begin
   FNullValues := Value ;
End ;

(* ------------------------------------------------------------------------- *
 * GetLastID ==> Devolve o último ID da tabela                               *
(* ------------------------------------------------------------------------- *)
Function TSqlTable.GetLastID ( FieldName : String ) : Double ;
Begin
   FQuery.Close ;
   FQuery.Sql.Clear ;
   FQuery.Sql.Add('Select Max(' + FieldName + ') From ' + FTableName) ;
   Try
      FQuery.Open ;
      Result := FQuery.Fields[0].AsFloat ;
   Except
      On E:Exception Do
      Begin
         SetError(E.Message) ;
         Result := -1 ;
      End ;
   End;
End ;

(* ------------------------------------------------------------------------- *
 * GetTransCount => Devolve o número de transações abertas                   *
(* ------------------------------------------------------------------------- *)
Function TSqlTable.GetTransCount : Integer ;
Begin
   FQuery.Close ;
   FQuery.Sql.Clear ;
   FQuery.Sql.Add('Select @@TRANCOUNT') ;
   Try
      FQuery.Open ;
      Result := FQuery.Fields[0].AsInteger ;
   Except
      On E:Exception Do
      Begin
         SetError(E.Message) ;
         Result := -1 ;
      End ;
   End;
End ;

end.

