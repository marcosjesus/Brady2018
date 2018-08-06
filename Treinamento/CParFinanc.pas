unit CParFinanc ;

interface

Uses
     SysUtils, Windows, DB, DBTables, Classes, SqlTableFun, DBConect, FMTBcd, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

Const

   DBTYPE_PARADOX   = 1 ;
   DBTYPE_SQLSERVER = 2 ;

Type TParFinanc = Class(TComponent)
       Private
           FTable : TSQLTableClass ;
           FQuery : TFDQuery ;
           FError : Integer ;
           FMensErro : String ;
           Procedure SetError ( Num : Integer ; Mens : String = '' ) ;
       Public
           DtTrab : TDateTime ;
           ConRec_IR : Double ;
           ContaUS, ContaBR, ContaCB : String[15] ;
           ContaEmp, ContaCus, ContaImp : String[20] ;
           ContaFactor  : String[15] ;
           ContaReceber, ContaPagar : String[20];
           Validade : Integer;
           DiasEntrega : Integer;
           ContaDocLiq : String[15] ;
           Versao : String[4] ;
           FatorComInvoice, FatorVenInvoice, FatorVen, FatorCom, PercBoaTaxa : Double ;
           CodMoedaUS, CodMoedaBR, CodMoedaCB, CodMoedaVT : String[10] ;
           TaxaMes : Double ;
           Constructor Create ( DBType : Integer = -1 ; DBName : String = '' ) ; reintroduce ;
           Destructor Destroy ; reintroduce ;
           Function ErrorNumber : Integer ;
           Function Error : Boolean ;
           Function GetMensErro : String ;
           Function Update : Boolean ;
           Function Select : Boolean ;
           Function SelEmp : Boolean ;
           Function UpdDtTrab ( Dt : TDateTime ) : Boolean ;
           function FilialBanco(Banco: String): String;
           Function GetCentroEstoque(Filial : String) : String;
           Function GetDataServer : TDateTime;

End ;

implementation

Uses
   Global, TestFun, StrFun, NumFun, MensFun, DateFun, Constantes ;

Const
   ERROR_OK        = 0 ;
   ERROR_QUERY     = 1 ;
   ERROR_EOF       = 2 ;
   ERROR_CHECK     = 4 ;

(* ------------------------------------------------------------------------- *
 * Create -> Cria a variável                                                 *
(* ------------------------------------------------------------------------- *)
Constructor TParFinanc.Create ( DBType : Integer = -1 ; DBName : String = '' ) ;
Begin
   FTable := TSQLTableClass.Create ;
   FTable.OpenTable('Parametros') ;
   FQuery := TFDQuery.Create(Self) ;
   FQuery.Connection := DB_Conect.SQLConnection ;
//   FQuery.DatabaseName := SqlTable_GetDBName() ;
End ;

(* ------------------------------------------------------------------------- *
 * Destroy -> Destroi a variável                                             *
(* ------------------------------------------------------------------------- *)
Destructor TParFinanc.Destroy ;
Begin
   FQuery.Close ;
   FTable.Destroy ;
End ;

(* ------------------------------------------------------------------------- *
 * ErrorNumber -> Devolve o numero do erro                                      *
(* ------------------------------------------------------------------------- *)
Function TParFinanc.ErrorNumber : Integer ;
Begin
   Result := FError ;
End ;

(* ------------------------------------------------------------------------- *
 * Error -> Devolve se ocorreu um erro                                          *
(* ------------------------------------------------------------------------- *)
Function TParFinanc.Error : Boolean ;
Begin
   Result := (FError = ERROR_OK) ;
End ;

(* ------------------------------------------------------------------------- *
 * GetMensErro --> Devolve a menagem de erro                                 *
(* ------------------------------------------------------------------------- *)
function TParFinanc.GetCentroEstoque(Filial: String): String;
var
  Sql : String;
begin
  Result := '';

   Sql := 'Select Top 1 CodCenEstoque  From CentroEstoque Where CodFilial = ' + QuotedStr(Filial);

   If ( Not FTable.GetExecSqlSel(Sql) ) Then
      Exit ;

   Result  :=  FTable.QResult.FieldByName('CodCenEstoque').AsString ;
end;

function TParFinanc.GetDataServer: TDateTime;
var
  Sql : String;
begin
  Result := 0;

   Sql := 'Select  getdate() as DataServer ';

   If ( Not FTable.GetExecSqlSel(Sql) ) Then
      Exit ;

   Result  :=  FTable.QResult.FieldByName('DataServer').AsDateTime ;
end;

Function TParFinanc.GetMensErro : String ;
Begin
   Result := FMensErro ;
End ;

(* ------------------------------------------------------------------------- *
 * SetError -> Indica a ocorrencia de um erro                                 *
(* ------------------------------------------------------------------------- *)
Procedure TParFinanc.SetError ( Num : Integer ; Mens : String = '' ) ;
Begin
   FError := Num ;
   If ( Num = ERROR_OK ) Then
      FMensErro := ''
   Else
      FMensErro := Mens ;
End ;

(* ------------------------------------------------------------------------- *
 * Update --> Atualiza os dados                                              *
(* ------------------------------------------------------------------------- *)
Function TParFinanc.Update : Boolean ;
Begin
    SetError(ERROR_OK) ;
    FTable.SetFieldKey('') ;
    FTable.SetFieldValue('DtTrab',DtTrab) ;
    FTable.SetFieldValue('ContaUS',ContaUS) ;
    FTable.SetFieldValue('ContaBR',ContaBR) ;
    FTable.SetFieldValue('CodMoedaUS',CodMoedaUS) ;
    FTable.SetFieldValue('CodMoedaBR',CodMoedaBR) ;
    FTable.SetFieldValue('Versao',Versao) ;
    Result := FTable.Update() ;
End ;

(* ------------------------------------------------------------------------- *
 * Select -> Seleciona o registro                                            *
(* ------------------------------------------------------------------------- *)
Function TParFinanc.Select : Boolean ;
Begin
   Result := False ;
   If ( Not FTable.Find(True) ) Then
      Exit ;

   DtTrab       := FTable.GetFieldValue('DtTrab') ;
   ContaUS      := FTable.GetFieldValue('ContaUS') ;
   ContaBR      := FTable.GetFieldValue('ContaBR') ;
   CodMoedaUS   := FTable.GetFieldValue('CodMoedaUS') ;
   CodMoedaBR   := FTable.GetFieldValue('CodMoedaBR') ;
   Versao       := FTable.GetFieldValue('Versao') ;
   ContaReceber := FTable.GetFieldValue('CodContabilRec') ;
   ContaPagar   := FTable.GetFieldValue('CodContabilPag') ;
   Validade     := FTable.GetFieldValue('ValidadeOrcamento') ;
   DiasEntrega  := FTable.GetFieldValue('PrazoEntrega') ;
   GImagemFTP   := FTable.GetFieldValue('ImagemFTP') = 'S' ;
   GPathIMG     := FTable.GetFieldValue('PathIMG')  ;

   if Copy(GPathIMG, Length(GPathIMG), 1) <> '\' then
      GPathIMG     :=  Trim(GPathIMG) + '\';

   Result := True ;
End ;

(* ------------------------------------------------------------------------- *
 * UpdDtTrab -> Atualiza a data de trabalho                                  *
(* ------------------------------------------------------------------------- *)
Function TParFinanc.UpdDtTrab ( Dt : TDateTime ) : Boolean ;
Begin
   DtTrab := Dt ;
   Result := Update() ;
End ;

(* ------------------------------------------------------------------------- *
 * SelEmp -> Seleciona a empresa                                             *
(* ------------------------------------------------------------------------- *)
Function TParFinanc.SelEmp : Boolean ;
Var
   Sql : String ;
Begin
   Result := False ;
   Sql := 'Select Razao, Numero1 as Telefone, CGC From Filial Where CodFilial = ''' + GFilial + '''' ;
   If ( Not FTable.GetExecSqlSel(Sql) ) Then
      Exit ;
   GEmpRazao := FTable.QResult.FieldByName('Razao').AsString ;
   GFone     := FTable.QResult.FieldByName('Telefone').AsString ;
   GCGC      := FTable.QResult.FieldByName('CGC').AsString ;
   Result := True ;
End ;

function TParFinanc.FilialBanco(Banco: String): String;
var
  Sql : String;
begin
  Result := '';

   if Trim(Banco) <> '' then
     Sql := 'select CodFilial from ContaCor Where CodConta = ''' + Banco + ''' '
   else
     Exit;

   If ( Not FTable.GetExecSqlSel(Sql) ) Then
      Exit ;
   Result  :=  FTable.QResult.FieldByName('CodFilial').AsString ;
end;

end.


