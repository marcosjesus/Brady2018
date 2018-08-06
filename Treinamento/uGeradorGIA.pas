unit uGeradorGIA;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, IniFiles,
  Dialogs, StdCtrls, ExtCtrls, DB, DateUtils;

  procedure GerarGIA(pCR : String; pArquivo: string; pDataSet: TDataSet);

implementation


procedure GerarGIA(pCR : String; pArquivo: string; pDataSet: TDataSet);
var ArquivoTexto: TextFile;
    i           : integer;
    strConteudo : string;
begin
  pDataSet.DisableControls;
  pDataSet.First;

  (* cria um novo arquivo *)
  AssignFile(ArquivoTexto, pArquivo);

  Rewrite(ArquivoTexto);

  strConteudo := pCR;

  try
    (* coleta os nomes dos campos (cabeçalho das colunas) *)
    for i := 0 to pDataSet.FieldCount - 1 do
    begin
      strConteudo := strConteudo + Format('%s', [pDataSet.Fields[i].FieldName]);

      if i < (pDataSet.FieldCount - 1) then
         strConteudo := strConteudo;
    end;

    Writeln(ArquivoTexto, strConteudo);

    (* grava os valores dos campos *)
    while not pDataSet.Eof do
    begin
      strConteudo := '';

      for i := 0 to pDataSet.FieldCount - 1 do
      begin
        strConteudo := strConteudo + Format('%s', [pDataSet.Fields[i].AsString]);

        if i < (pDataSet.FieldCount - 1) then
           strConteudo := strConteudo;
      end;

      Writeln(ArquivoTexto, strConteudo);

      pDataSet.Next;
    end;
  finally
    CloseFile(ArquivoTexto);
  end;

  pDataSet.First;
  pDataSet.EnableControls;

end;

{
procedure TfrmPrincipal.Carregar1Click(Sender: TObject);
var Arquivo : TStringList;
begin
  if opdlgScript.Execute then
  begin
     mmoSQL.Lines.Clear;

     Arquivo := TStringList.Create;
     Arquivo.LoadFromFile(opdlgScript.FileName);

     mmoSQL.Text := Arquivo.Text;

     FreeAndNil(Arquivo);
  end;
end;
}
{
procedure TfrmPrincipal.mmiExportTextoClick(Sender: TObject);
begin

  if svdlgSalvarResultado.Execute then
  begin
     if FileExists(svdlgSalvarResultado.FileName) then
     begin
        if (MessageBox(0, PChar(svdlgSalvarResultado.FileName + ' já existe.' + #13 +
                          'Deseja substituí-lo?'), 'Salvar', MB_ICONWARNING or MB_YESNO or MB_TASKMODAL) = idYes) then
           DeleteFile(svdlgSalvarResultado.FileName)
        else
           exit;
     end;

     SaveResultDataSet(svdlgSalvarResultado.FileName,dmExportSQL.dsExportSql.DataSet);
  end;
end;
 }
end.
