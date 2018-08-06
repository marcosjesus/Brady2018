unit DBConect;

interface

uses
  System.SysUtils, System.Classes, Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.ODBCBase,
  FireDAC.Phys.MSSQL, FireDAC.Comp.Client, Data.DB, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,System.IOUtils,
  Vcl.Forms;



type
  TCredenciais = record
    Host      : string;
    DataBase  : string;
    UserName  : string;
    Password  : string;
  end;

type
  TDB_Conect = class(TDataModule)
    FDConnection: TFDConnection;
    sqlAuxiliar: TFDQuery;
    sqlAux: TFDQuery;
    sqlAux180: TFDQuery;
    sqlAux180Itens: TFDQuery;
    sql155: TFDQuery;
    sql250: TFDQuery;
    sqlGeral: TFDQuery;
    sqlGeralSPCT_GERAL_ID: TFDAutoIncField;
    sqlGeralLINHA: TStringField;
    sql200: TFDQuery;
    sql155REGISTRO: TStringField;
    sql155CONTA: TStringField;
    sql155CCUSTO: TStringField;
    sql155VALOR1: TStringField;
    sql155TIPO1: TStringField;
    sql155VALOR2: TStringField;
    sql155VALOR3: TStringField;
    sql155VALOR4: TStringField;
    sql155TIPO2: TStringField;
    sql200SPCT_200_ID: TFDAutoIncField;
    sql200REGISTRO: TStringField;
    sql200NUMERO: TStringField;
    sql200DATA: TStringField;
    sql200VALOR: TStringField;
    sql200LETRA: TStringField;
    sql250REGISTRO: TStringField;
    sql250CONTA: TStringField;
    sql250CCUSTO: TStringField;
    sql250VALOR1: TStringField;
    sql250TIPO1: TStringField;
    sql250CODIGO: TStringField;
    sql250BRANCO1: TStringField;
    sql250DESCRICAO: TStringField;
    sql250BRANCO2: TStringField;
    sql355: TFDQuery;
    sql355REGISTRO: TStringField;
    sql355CONTA: TStringField;
    sql355CCUSTO: TStringField;
    sql355VALOR: TStringField;
    sql355TIPO: TStringField;
  private

    { Private declarations }
  public
    { Public declarations }
    GUsuario : String;
    procedure LerCredenciais;

    function GetComando(ObjetoQuery: TFDQuery; bMostra: Boolean = false): String;
  end;

var
  DB_Conect: TDB_Conect;
  Credencias               : TCredenciais;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}


function StrTran(sOrigem: string; sLoc: string; sSub: string): string;
var
  Aux: string;
  Calc: integer;
  Posicao: integer;
begin
//Localiza um conjunto de strings e subtitui por outro
  Aux := sOrigem;
  Calc := 0;
  Posicao := Pos(sLoc, Aux);
  while Posicao > 0 do
  begin

    Delete(Aux, Posicao, Length(sLoc));
    Posicao := Posicao + Calc;
    sOrigem := Copy(sOrigem, 1, Posicao - 1) + sSub +
      Copy(sOrigem, Posicao + Length(sLoc), Length(sOrigem));
    Calc := Calc + Length(sSub);
    Posicao := Pos(sLoc, Aux);
  end;
  Result := sOrigem;
end;

Function TDB_Conect.GetComando(ObjetoQuery: TFDQuery; bMostra : Boolean = false) : String;
var
 i        : Integer;
 strQuery : String;
 sGetComando : String;
begin

  strQuery := UpperCase(ObjetoQuery.SQL.Text);

  For  i := 0 to ObjetoQuery.Params.Count - 1 do
    strQuery := StrTran(strQuery,':' + UpperCase(ObjetoQuery.Params[i].Name), QuotedStr(ObjetoQuery.Params[i].Value) );

   strQuery :=  StrTran(StrTran(strQuery, ''#$D#$A'', ' '), ''#$D#$A'', '');

  {
  sGetComando := ExisteRegistroComValor('PARAMETROS', 'VL_PARAM', 'NM_PARAM = ''GETCOMANDONATELA'' ');

  if (sGetComando = 'S') or (sGetComando = '') Then
     MostrarScriptnaTela := True;

  if not MostrarScriptnaTela Then
     LogWriter(GUsuario, strQuery, Tela)
  else
  }
  if bMostra  then
     ShowMessage(strQuery);

  result := strQuery;

end;

procedure TDB_Conect.LerCredenciais;
var
   varParam : TStringList;
begin
  if TFile.Exists( ExtractFilePath(Application.ExeName) + 'DB-CECS2002.ini' ) then
  begin
     varParam := TStringList.Create;
     Try
       varParam.LoadFromFile(ExtractFilePath(Application.ExeName)  + 'DB-CECS2002.ini');
       Credencias.Host         := varParam.Values['SERVER'];
       Credencias.Username     := varParam.Values['User_Name'];
       Credencias.Password     := varParam.Values['Password'];
       Credencias.DataBase     := varParam.Values['DATABASE'];


     Finally
       FreeAndNil(varParam);
     End;
  end;
end;

end.
