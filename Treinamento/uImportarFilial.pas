unit uImportarFilial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FGrid, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  cxControls, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinsdxStatusBarPainter, FMTBcd, DBClient, Provider,
  ExtCtrls, DB, SqlExpr, dxStatusBar, StdCtrls, cxButtons, ToolWin, ComCtrls,
  jpeg, cxContainer, cxEdit, cxGroupBox, Buttons,COMObj, Grids, Global;

type
  TFrmImportarFilial = class(TFrmGrid)
    cxGroupBox1: TcxGroupBox;
    lblNome: TLabeledEdit;
    lblCNPJ: TLabeledEdit;
    lblIE: TLabeledEdit;
    lblMunicipio: TLabeledEdit;
    lblUF: TLabeledEdit;
    OpenDialog: TOpenDialog;
    Bevel1: TBevel;
    Bevel2: TBevel;
    e: TcxGroupBox;
    edtArquivo: TEdit;
    btnCaminho: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure btnCaminhoClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    stg  : TStringGrid;
    function FormataCampo(campo: string; delimitador: char; coluna,
      linhaLista: integer; lista: TStringList; var temAspasInicial,
      achouAspasFinal: boolean): string;
    procedure ImportaArquivoCSV(arquivo: string; delimitador: char;
      numColunas: integer);
    procedure RemoveLinhaStringGrid(linha: integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmImportarFilial: TFrmImportarFilial;

implementation

uses DBConect, StrFun, MensFun, Funcoes;

{$R *.dfm}

procedure TFrmImportarFilial.BitBtn1Click(Sender: TObject);
begin
  inherited;
  edtArquivo.Clear;
  edtArquivo.SetFocus;
end;

procedure TFrmImportarFilial.BitBtn2Click(Sender: TObject);
begin
  inherited;
   stg := TStringGrid.Create(Nil);
   Try
     if edtArquivo.Text <> '' then
     begin
       if FileExists(edtArquivo.Text) then
         ImportaArquivoCSV(edtArquivo.Text ,';',5)
       else
         Mens_MensErro('Arquivo informado inv�lido ou n�o existe');
     end
     else
        Mens_MensInf('Informe o Nome do Arquivo, com a extens�o CSV');
   Finally
      FreeAndNil(stg);
   End;
end;

procedure TFrmImportarFilial.btnCaminhoClick(Sender: TObject);
begin
  inherited;

  OpenDialog.DefaultEXT := 'CSV';
  OpenDialog.Filter := 'Arquivos Separado por Ponto;Virgula (*.CSV)|*.CSV';

   if OpenDialog.Execute then
     edtArquivo.Text := OpenDialog.FileName;

end;



procedure TFrmImportarFilial.RemoveLinhaStringGrid(linha: integer);
var
	x, y: integer;
begin
  for x:=linha to stg.RowCount - 2 do
	  for y:=0 to stg.ColCount - 1 do
	   	stg.Cells[y,x]:=stg.Cells[y,x + 1];
       stg.RowCount:=stg.RowCount - 1;
end;

function TFrmImportarFilial.FormataCampo(campo: string; delimitador: char; coluna, linhaLista: integer; lista: TStringList; var temAspasInicial, achouAspasFinal: boolean): string;
var
	x, aux: integer;
	str: string;
	delimitadorOK, encontrou: Boolean;
begin
if (not achouAspasFinal) then
	begin
	encontrou:=False;
	for x:=1 to Length(campo) do
		begin
		if (campo[x] = '"') then
			begin
			if (campo[x + 1] = ',') then
				begin
				encontrou:=True;
				Break;
				end;
			end;
		end;
	if (encontrou) then
		begin
		str:=copy(campo,1,x);
		achouAspasFinal:=True;
		lista[linhaLista]:=copy(lista[linhaLista],Length(str) + 2,Length(lista[linhaLista]) - Length(str));
		end
	else
		str:=campo;
	end
else
	begin
	x:=1;
	aux:=0;
	str:='';
	delimitadorOK:=False;
	while (x < Length(campo) + 1) and (aux < coluna) do
		begin
		if (campo[x] = '"') then
			delimitadorOK:=not delimitadorOK;
		if (campo[x] = delimitador) and (not delimitadorOK) then
			Inc(aux);
		Inc(x);
		end;
	delimitadorOK:=False;
	while (x < Length(campo) + 1) and ((campo[x] <> delimitador) or delimitadorOK) do
		begin
		if (campo[x] = '"') then
			begin
			temAspasInicial:=not temAspasInicial;
			achouAspasFinal:=not achouAspasFinal;
			delimitadorOK:=not delimitadorOK;
			end;
		str:=str + campo[x];
		Inc(x);
		end;
	end;
   FormataCampo:=Trim(str);
end;

procedure TFrmImportarFilial.ImportaArquivoCSV(arquivo: string; delimitador: char; numColunas: integer);
var
	listaCSV                       : TStringList;
	x, xAux, numLinha, numLinhaAux : integer;
	aspasIni, aspasFim             : boolean;
	strTemp                        : string;

  varColumnNome         : Integer;
  varColumnCNPJ         : Integer;
  varColumnIE           : Integer;
  varColumnMunicipio    : Integer;
  varColumnUF           : Integer;

  varStrColumnNome      : String;
  varStrColumnCNPJ      : String;
  varStrColumnIE        : String;
  varStrColumnMunicipio : String;
  varStrColumnUF        : String;

  varProximaFilial      : Integer;
  varErroCNPJ           : Boolean;
  varErroTamanho        : Boolean;
  qryAux : TSQLQuery;
  Transacao : TTransactionDesc;

begin
  listaCSV:=TStringList.Create;
  try
    stg.ColCount:=numColunas;
    listaCSV.LoadFromFile(arquivo);
    varColumnNome      := -1;
    varColumnCNPJ      := -1;
    varColumnIE        := -1;
    varColumnMunicipio := -1;
    varColumnUF        := -1;


    varStrColumnNome := '';
    varStrColumnCNPJ := '';
    varStrColumnIE   := '';
    varStrColumnMunicipio := '';
    varStrColumnUF := '';

    numLinha:=0;
    Screen.Cursor := crHourGlass;
    qryAux := TSQLQuery.Create(Nil);
    Try
     qryAux.SQLConnection := DB_Conect.SQLConnection;
      varErroCNPJ    := False;
      varErroTamanho := False;
      while (numLinha <= listaCSV.Count - 1) do
      begin

         stg.RowCount:=numLinha + 1;
         x:=0;
         xAux:=0;
         numLinhaAux:=numLinha;
         while (x <= stg.ColCount - 1) do
         begin

            strTemp:=FormataCampo(listaCSV[numLinha],delimitador,xAux,numLinha,listaCSV,aspasIni,aspasFim);

            if (stg.Cells[x,numLinhaAux] <> '') then
              strTemp:=stg.Cells[x,numLinhaAux] + #13#10 + strTemp;

            if (strTemp <> '') and (strTemp[1] = '"') and (strTemp[Length(strTemp)] = '"') then
              strTemp:=copy(strTemp,2,Length(strTemp) - 2);

            if numLinhaAux = 0 then
            begin
             if UpperCase(Str_Pal(listaCSV[numLinha],x+1,';'))  = 'NOME' Then
                varColumnNome := x;

             if UpperCase(Str_Pal(listaCSV[numLinha],x+1,';'))= 'CNPJ' Then
                varColumnCNPJ := x;

             if UpperCase(Str_Pal(listaCSV[numLinha],x+1,';'))  = 'IE' Then
                varColumnIE := x;

             if UpperCase(Str_Pal(listaCSV[numLinha],x+1,';')) = 'MUNICIPIO' Then
                varColumnMunicipio := x;

             if UpperCase(Str_Pal(listaCSV[numLinha],x+1,';'))  = 'UF' Then
                varColumnUF := x;

            end;

            if numLinhaAux = 1 then
            begin
               if varColumnNome = -1 Then
               begin
                  Screen.Cursor := crDefault;
                  Mens_MensErro('Coluna Nome n�o Encontrada');
                  exit;
               end;

               if varColumnCNPJ = -1 Then
               begin
                  Screen.Cursor := crDefault;
                  Mens_MensErro('Coluna CNPJ n�o Encontrada');
                  exit;
               end;


               if varColumnIE = -1 Then
               begin
                  Screen.Cursor := crDefault;
                  Mens_MensErro('Coluna IE n�o Encontrada');
                  exit;
               end;

               if varColumnMunicipio = -1 Then
               begin
                  Screen.Cursor := crDefault;
                  Mens_MensErro('Coluna Municipio n�o Encontrada');
                  exit;
               end;

               if varColumnUF = -1 Then
               begin
                  Screen.Cursor := crDefault;
                  Mens_MensErro('Coluna UF n�o Encontrada');
                  exit;
               end;
            end;


            if numLinhaAux >= 1 then
            begin

              if x = varColumnNome then
              begin
                varStrColumnNome      :=strTemp;
                if Length(varStrColumnNome) > 40 then
                begin

                   Mens_MensErro( varStrColumnNome + ' Tamanho maximo permitido: 40 posi��es');
                   x:= numColunas;
                   varErroTamanho := True;
                   Continue;
                end;

              end;

              if x = varColumnCNPJ then
              begin
                varStrColumnCNPJ      :=strTemp;

                if varStrColumnCNPJ = '' Then
                begin

                  Mens_MensErro('N�o informado CNPJ para a Filial ' + varStrColumnNome);
                  x:= numColunas;
                  varErroCNPJ := True;
                  Continue;
                end;

                if Length(varStrColumnCNPJ) > 14 then
                begin

                   Mens_MensErro( varStrColumnCNPJ + ' Tamanho maximo permitido: 14 posi��es');
                   x:= numColunas;
                   varErroTamanho := True;
                   Continue;
                end;


                if not TestaCNPJ(varStrColumnCNPJ) Then
                begin

                  Mens_MensErro('CNPJ Inv�lido.' + ' Filial ' + varStrColumnNome + ' n�o ser� importada');
                  x:= numColunas;
                  varErroCNPJ := True;
                  Continue;
                end;

                qryAux.close;
                qryAux.Sql.Clear;
                qryAux.Sql.Add('select CNPJ from CTE_FILIAL Where CNPJ = :CNPJ' );
                qryAux.ParamByName('CNPJ').AsString := varStrColumnCNPJ;
                qryAux.Open;
                if not qryAux.IsEmpty then
                begin
                  Mens_MensErro('CNPJ ' + varStrColumnCNPJ + ', j� cadastrado!');
                  x:= numColunas;
                  Continue;
                end;
              end;

              if x = varColumnIE then
              begin
                varStrColumnIE        :=strTemp;
                if Length(varStrColumnIE) > 12 then
                begin

                   Mens_MensErro( varStrColumnIE + ' Tamanho maximo permitido: 12 posi��es');
                   x:= numColunas;
                   varErroTamanho := True;
                   Continue;
                end;
              end;

              if x = varColumnMunicipio then
              begin
                varStrColumnMunicipio := strTemp;
                if Length(varStrColumnMunicipio) > 50 then
                begin

                   Mens_MensErro( varStrColumnMunicipio + ' Tamanho maximo permitido: 50 posi��es');
                   x:= numColunas;
                   varErroTamanho := True;
                   Continue;
                end;
              end;

              if x = varColumnUF then
              begin
                varStrColumnUF        :=strTemp;
                if Length(varStrColumnUF) <> 2 then
                begin

                   Mens_MensErro( varStrColumnUF + ' Tamanho permitido: 2 posi��es');
                   x:= numColunas;
                   varErroTamanho := True;
                   Continue;
                end;
              end;

            end;

            if ((varStrColumnNome <> '') and
                (varStrColumnCNPJ <> '') and
                (varStrColumnIE <> '') and
                (varStrColumnMunicipio <> '') and
                (varStrColumnUF <> '')) then
               begin
                  Transacao.TransactionID := 1;
                  Transacao.IsolationLevel := xilREPEATABLEREAD;
                  DB_Conect.SQLConnection.StartTransaction(Transacao);

                  qryAux.close;
                  qryAux.Sql.Clear;
                  qryAux.Sql.Add('select Max(CONVERT(INT,CTE_FILIAL_ID))  as Proximo from  CTE_FILIAL' );    // condi��o usado pra gerar subcodigo
                  qryAux.Open;
                  varProximaFilial :=   qryAux.FieldByName('Proximo').AsInteger + 1;

                  qryAux.Close;
                  qryAux.Sql.Clear;
                  qryAux.SQL.Add(' Insert Into CTE_FILIAL (CTE_FILIAL_ID,Nome,CNPJ,INSCRICAO,XMUNICIPIO,UF) Values ( ');
                  qryAux.SQL.Add(' :CTE_FILIAL_ID, :Nome,:CNPJ,:INSCRICAO,:MUNICIPIO,:UF) ');

                  qryAux.ParamByName('CTE_FILIAL_ID').AsInteger := varProximaFilial;
                  qryAux.ParamByName('Nome').AsString           := varStrColumnNome;
                  qryAux.ParamByName('CNPJ').AsString           := varStrColumnCNPJ;
                  qryAux.ParamByName('INSCRICAO').AsString      := varStrColumnIE;
                  qryAux.ParamByName('MUNICIPIO').AsString      := varStrColumnMunicipio;
                  qryAux.ParamByName('UF').AsString             := varStrColumnUF;

                  try

                     qryAux.ExecSql;
                     DB_Conect.SQLConnection.Commit(Transacao);
                     varStrColumnNome      := '';
                     varStrColumnCNPJ      := '';
                     varStrColumnIE        := '';
                     varStrColumnMunicipio := '';
                     varStrColumnUF        := '';

                  except
                    On E:Exception do
                      begin
                       Screen.Cursor := crDefault;
                       DB_Conect.SQLConnection.Rollback(Transacao);
                       Mens_MensErro('Erro Importando Arquivo de Filial (.csv) !' + E.Message);
                       Exit;
                      end;

                  end;
               end;

               stg.Cells[x,numLinhaAux]:=strTemp;

               if ((aspasIni) and (not aspasFim)) then
               begin
                  xAux:=-1;
                  Inc(numLinha);
               end
               else
               begin
                  Inc(x);
                  Inc(xAux);
                  aspasIni:=False;
                  aspasFim:=True;
               end;
         end;
              Inc(numLinha);
      end;

      numLinha:=0;
      while (numLinha <= stg.RowCount - 1) do
      begin
        if (stg.Cells[0,numLinha] = '') then
          RemoveLinhaStringGrid(numLinha)
        else
          Inc(numLinha);
      end;

   finally
     listaCSV.Free;
   end;

   if varErroCNPJ = False then
      Mens_MensInf('Arquivo Importado com Sucesso')
   else if varErroTamanho then
       Mens_MensInf('Arquivo Importado Incompleto. Tamanho Inv�lido.')
   else    Mens_MensInf('Arquivo Importado Incompleto. H� CNPJ inv�lido.');

   Screen.Cursor := crDefault;
   edtArquivo.Clear
 finally
   FreeAndNil(qryAux);
 end;
end;



end.
