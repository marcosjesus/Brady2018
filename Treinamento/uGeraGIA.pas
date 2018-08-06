unit uGeraGIA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, rsEdit, Buttons, ExtCtrls, DB, DBTables, Menus,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters, cxEdit,
  cxLabel, cxControls, cxContainer, cxCheckListBox, cxButtons, RxLookup,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  cxGroupBox, dxGDIPlusClasses, cxImage, cxLookAndFeels, dxSkinBlack,
  dxSkinBlue, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, DBClient, Provider, FMTBcd,
  SqlExpr, EditBusca, ComCtrls, SetParametro, IniFiles, SQLTimST;

type
  TfrmGeraGIA = class(TForm)
    PanVcto: TPanel;
    cxButton4: TcxButton;
    cxButton1: TcxButton;
    cxGroupBox: TcxGroupBox;
    editFilial: TEditBusca;
    Label2: TLabel;
    dataInicial: TDateTimePicker;
    dataFinal: TDateTimePicker;
    Label1: TLabel;
    Label3: TLabel;
    cmbRegime: TcxComboBox;
    Label4: TLabel;
    Label5: TLabel;
    cmbTipoGia: TcxComboBox;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeraGIA: TfrmGeraGIA;

implementation

{$R *.dfm}

uses MensFun, Funcoes , DBConect;

procedure TfrmGeraGIA.cxButton1Click(Sender: TObject);
var ArquivoTexto: TextFile;
    i           : integer;
    strConteudo : string;
    pArquivo    : String;

    xCNPJ, xRegime, xInscricao, xTipoGia : string;
    sqlAux, sqlCR05, sqlCR07, sqlCR10, sqlCR14, sqlCR18, sqlCR20, sqlCR25,
    sqlCR26, sqlCR27, sqlCR28, sqlCR30, sqlCR31 : TSQLQuery;

begin
  if editFilial.Text = EmptyStr then
  begin
     Mens_MensErro('Não foi informado nenhuma Filial');
      Exit;
  end;

  if cmbRegime.ItemIndex = 0 then
     xRegime := '01'
  else if cmbRegime.ItemIndex = 1 then
     xRegime := '02'
  else if cmbRegime.ItemIndex = 2 then
     xRegime := '03'
  else if cmbRegime.ItemIndex = 3 then
     xRegime := '04';

  if cmbTipoGia.ItemIndex = 0 then
    xTipoGia := '01'
  else if cmbTipoGia.ItemIndex = 1 then
    xTipoGia := '02'
  else if cmbTipoGia.ItemIndex = 2 then
    xTipoGia := '03';


  pArquivo := 'C:\CTE\' + editFilial.bs_KeyValue + '.txt';
  sqlCR05 := TSQLQuery.Create(Nil);
  Try
    sqlCR05.SQLConnection := DB_Conect.SQLConnection;
    sqlCR05.Close;
    sqlCR05.SQL.Clear;
    sqlCR05.SQL.Add('Select CNPJ, Inscricao From CTE_Filial');
    sqlCR05.SQL.Add(' Where CTE_FILIAL_ID = :CTE_FILIAL_ID');
    sqlCR05.ParamByName('CTE_FILIAL_ID').AsString := VarToStr(editFilial.bs_KeyValue);
    sqlCR05.Open;
    xCNPJ      := sqlCR05.FieldByName('CNPJ').AsString;
    xInscricao := Zero(sqlCR05.FieldByName('Inscricao').AsString,12);

  Finally
    FreeAndNil(sqlCR05);
  End;

  (* cria um novo arquivo *)
  AssignFile(ArquivoTexto, pArquivo);

  Rewrite(ArquivoTexto);

  try
    sqlAux := TSQLQuery.Create(Nil);
    Try
      sqlAux.SQLConnection := DB_Conect.SQLConnection;

        strConteudo := '0101';

        strConteudo := strConteudo + FormatDateTime('yyyymmddhhnnss', Now);

        strConteudo := strConteudo + '00000210';

        strConteudo := strConteudo + '0001'; // Colocar aqui a qtde de registro na CR=05

        strConteudo := strConteudo + #13#10;

        {*******************************************}
        strConteudo := strConteudo + '05';

        strConteudo := strConteudo + xInscricao;

        strConteudo := strConteudo + xCNPJ;

        strConteudo := strConteudo + Zero('0',7);

        strConteudo := strConteudo + xRegime;

        {AAAAMM (AAAA: Ano, MM: Mês)
         Ref >= 200007 e =< mês da data atual
         Se existir CR=30 (Dipam B), o campo Ref deve ser >=200101
         Se RegTrib = 02 (RES), o campo Ref deve dever ser <= 200012
         Se RegTrib = 04 (Simples-ST) , o campo Ref deve ser >= 200007 e =< 200512
         Não pode ocorrer duplicidade de Ref para a mesma IE. }
        strConteudo := strConteudo + FormatDateTime('yyyymm', Now); // data atual

        { AAAAMM (AAAA: Ano, MM: Mês)
        RefInicial >=200007
        Se RegTrib = 01 (RPA) , RefInicial = 000000 (ZEROS)
        Se RegTrib = 02 (RES), RefInicial =< Ref e deve pertencer ao mesmo semestre de Ref
        Se RegTrib = 03 (RPA-DISPENSADO), RefInicial = 000000 (ZEROS)
        Se RegTrib = 04 (Simples-ST), RefInicial = 000000 (ZEROS)}
        if ((xRegime = '01') or (xRegime = '03') or (xRegime = '04')) then
          strConteudo := strConteudo + '000000'
        else
          strConteudo := strConteudo + FormatDateTime('yyyymm', dataInicial.Date);  // data de inicio

        strConteudo := strConteudo + xTipoGia;

        strConteudo := strConteudo + '1'; // zero nao deve ter reg. filho / um deve haver reg. filho

        strConteudo := strConteudo + '0'; // doc ja transmitido = 0 não 1 sim

        {De 0,00 a 9.999.999.999.999,99 exceto pontos e vírgulas
        Este valor é utilizado na Apuração de Operações Próprias
        Alinhar à direita e preencher com ZEROS à esquerda}

        sqlAux.Close;
        sqlAux.SQL.Clear;
        sqlAux.SQL.Add('SELECT  SUM(I.VICMS) as ValorICMS ');
        sqlAux.SQL.Add('FROM CTE_CAPA CP ');
        sqlAux.SQL.Add('INNER JOIN CTE_IMPOSTOS I ON I.CCT = CP.CCT ');
        sqlAux.SQL.Add('WHERE CP.CTE_FILIAL_ID = :CTE_Filial_ID ');
        sqlAux.SQL.Add('  AND CP.DHEMI BETWEEN :Data1 and :Data2');
        sqlAux.ParamByName('CTE_FILIAL_ID').AsString := VarToStr(editFilial.bs_KeyValue);
        sqlAux.ParamByName('Data1').asString   := formatdatetime('dd/mm/yyyy  00:00:01', dataInicial.DateTime);
        sqlAux.ParamByName('Data2').asString   := formatdatetime('dd/mm/yyyy  23:59:59', dataFinal.DateTime);
        sqlAux.Open;
        strConteudo := strConteudo + Zero(StrTran(StrTran(sqlAux.FieldByName('ValorICMS').AsString,',',''),'.',''),15);



        {De 0,00 a 9.999.999.999.999,99 exceto pontos e vírgulas
        Este valor é utilizado na Apuração de Operações com ST
        Alinhar à direita e preencher com ZEROS à esquerda
        Preencher com zeros se RegTrib = 04}
        strConteudo := strConteudo + Zero('0',15);


        {CNPJ ou CPF do fabricante
        Validar CNPJ ou CPF
        Alinhar à direita com zeros à esquerda}
        strConteudo := strConteudo + Zero('13202601873',14);

        {Indica se o arquivo Pré-formatadoNG
        foi gerado por algum sistema de
        informação contábil
        0 – Pré-formatado-NG (gerado pelo sistema de informação contábil)
        1 – Digitado (quando gerado ou modificado pelo front-end)}
        strConteudo := strConteudo + '1';

        {De 0,00 a 9.999.999.999.999,99 exceto pontos e vírgulas
        Se RegTrib = 02 Conteúdo > ZEROS
        Se RegTrib = 01 ou 03 ou 04 , conteúdo = ZEROS
        Alinhar à direita com preenchimento de ZEROS à esquerda}
        strConteudo := strConteudo + Zero('0',15);

        {No caso em que o Pré-formatado-NG é gerado por algum
        sistema de informação contábil, deixar este campo com ZEROS.}
        strConteudo := strConteudo + Zero('0',32);

        {Verificar se Q07 = quantidade de registros-filhos 07 existente  no arquivo
        Valor máximo = 0010 (5 para operações próprias e 5 para operações de ST)
        Deve ser igual a ZEROS se Ref < 201201}
        strConteudo := strConteudo + Zero('0',4);

        {Verificar se Q10 = quantidade de registros-filhos 10 existente no arquivo
        Alinhar à direita e preencher com ZEROS à esquerda}

        sqlAux.Close;
        sqlAux.SQL.Clear;
        sqlAux.SQL.Add('WITH DADOS ');
        sqlAux.SQL.Add('AS ( ');
        sqlAux.SQL.Add('SELECT CP.CFOP  ');
        sqlAux.SQL.Add('FROM CTE_CAPA CP  ');
        sqlAux.SQL.Add('WHERE CP.CTE_FILIAL_ID = :CTE_Filial_ID ');
        sqlAux.SQL.Add('  AND CP.DHEMI BETWEEN :Data1 and :Data2');
        sqlAux.ParamByName('CTE_FILIAL_ID').AsString := VarToStr(editFilial.bs_KeyValue);
        sqlAux.ParamByName('Data1').asString   := formatdatetime('dd/mm/yyyy  00:00:01', dataInicial.DateTime);
        sqlAux.ParamByName('Data2').asString   := formatdatetime('dd/mm/yyyy  23:59:59', dataFinal.DateTime);
        sqlAux.SQL.Add('GROUP BY CP.CFOP  ');
        sqlAux.SQL.Add(' )');
        sqlAux.SQL.Add('SELECT COUNT(1) as TOTAL10 FROM DADOS ');
        //DB_Conect.GetComando(sqlAux);

        sqlAux.Open;
        strConteudo := strConteudo + Zero(StrTran(StrTran(sqlAux.FieldByName('TOTAL10').AsString,',',''),'.',''),4);

        {Verificar se Q20 = quantidade de registros-filhos 20 existente no arquivo
        Alinhar à direita e preencher com ZEROS à esquerda}
        strConteudo := strConteudo + Zero('0',4);

        {Verificar se Q30 = quantidade de registros-filhos 30 existente no arquivo
        Alinhar à direita e preencher com ZEROS à esquerda
        Deve ser igual a ZEROS se RegTrib = 04 (Simples -ST)
        Deve ser igual a ZEROS se Ref < 200101}
        strConteudo := strConteudo + Zero('0',4);

        {Verificar se Q31 = quantidade de registros-filhos CR 31 existente no arquivo
        Alinhar à direita e preencher com ZEROS à esquerda
        Deve ser igual a ZEROS se Ref < 200201}
        strConteudo := strConteudo + Zero('0',4);

        strConteudo := strConteudo + #13#10;
       {*******************************************}

        strConteudo := strConteudo + '07';

        {Indica se o pagamento está associado à Apuração do ICMS para Operações
        Próprias ou de Substituição Tributária
        0 – Própria
        1 – ST}
        strConteudo := strConteudo + '0';

        {Valor do imposto a recolher para a referente data de vencimento
        de 0,01 a 9.999.999.999.999,99 exceto pontos e vírgulas
        Alinhar à direita e preencher com ZEROS à esquerda}
        strConteudo := strConteudo + Zero('0',15);


        {Data de vencimento do valor do imposto de acordo com o CPR
        relacionado à atividade
        AAAAMMDD (AAAA: Ano, MM: Mês, DD: Dia)
        As datas devem estar contidas no intervalo entre o primeiro dia
        do mês de referência da GIA (dia 1 do mês de referência da
        GIA), e o último dia do segundo mês subsequente.}
        strConteudo := strConteudo + FormatDateTime('yyyymmdd', dataFinal.Date);

        strConteudo := strConteudo + #13#10;
       {*******************************************}


        sqlCR10 := TSQLQuery.Create(Nil);
        Try
           sqlCR10.SQLConnection := DB_Conect.SQLConnection;
           sqlCR10.Close;
           sqlCR10.SQL.Clear;
           sqlCR10.SQL.Add('SELECT  CP.CFOP, SUM(v.vrec) as ValorContabil, ');
           sqlCR10.SQL.Add('SUM(I.VBC) AS BaseCalculo,  SUM(i.VICMS) as Imposto ');
           sqlCR10.SQL.Add('FROM CTE_CAPA CP  ');
           sqlCR10.SQL.Add('INNER JOIN CTE_EMITENTE E     ON E.CCT = CP.CCT ');
           sqlCR10.SQL.Add('INNER JOIN CTE_DESTINATARIO D ON D.CCT = CP.CCT ');
           sqlCR10.SQL.Add('INNER JOIN CTE_VPREST V       ON V.CCT = CP.CCT ');
           sqlCR10.SQL.Add('INNER JOIN CTE_IMPOSTOS I     ON I.CCT = CP.CCT ');
           sqlCR10.SQL.Add('INNER JOIN CTE_PROTOCOLO P    ON P.CCT = CP.CCT ');
           sqlCR10.SQL.Add('WHERE CP.CTE_FILIAL_ID = :CTE_Filial_ID ');
           sqlCR10.SQL.Add('  AND CP.DHEMI BETWEEN :Data1 and :Data2');
           sqlCR10.ParamByName('CTE_FILIAL_ID').AsString := VarToStr(editFilial.bs_KeyValue);
           sqlCR10.ParamByName('Data1').AsSQLTimeStamp   := DateTimeToSqlTimeStamp(dataInicial.Date + StrToTime('00:00:01') );
           sqlCR10.ParamByName('Data2').AsSQLTimeStamp   := DateTimeToSqlTimeStamp(dataFinal.Date + StrToTime('23:59:59'));
           sqlCR10.SQL.Add('GROUP BY CP.CFOP  ');
           sqlCR10.SQL.Add('ORDER BY  CP.CFOP  ');

           sqlCR10.Open;
           sqlCR10.First;
           while not sqlCR10.Eof do
           begin
               strConteudo := strConteudo + '10';

               {Código Fiscal de Operação e Prestação}
               {Ver Tabela10F para valores válidos para referência > 200804 e <= 200906
               Ver Tabela10G para valores válidos para referência > 200906   e <= 201006
               Ver Tabela10H para valores válidos para referência > 201006   e <= 201012
               Ver Tabela10I para valores válidos para referência > 201012
               Se CFOP <> 2xxxxx e 6xxxxx, então não poderá existir
               registros-filhos CR=14 e o campo Q14=0000 (ZEROS)
               Se CFOP = 2xxxxx ou 6xxxxx, então deve existir registros filhos CR=14 e Q14>0000.
               O campo deve estar alinhado à esquerda e com ZEROS à
               direita. Por exemplo, para CFOP 1.101, o campo CFOP deve
               se apresentar como 110100
               Os CFOPs devem estar classificados em ordem ascendente
               Não poderá haver duplicidade de CFOPs
               CFOP´s do grupo X.99, com a Quarta posição = ZEROS
               devem ter a referência <= 200012, a partir da referência
               200101 , não serão aceitos tais CFOP´s. Por exemplo, CFOP 599000
               ** Para referências a partir de 2003, foram consideradas as faixas de
               CFOPs possíveis, apesar de nem todos os CFOPs compreendidos nestas faixas existirem}
               strConteudo := strConteudo + sqlCR10.FieldByName('CFOP').AsString + '00';

                {Valor Contábil}
               {de 0,00 a 9.999.999.999.999,99 exceto pontos e vírgulas
               Alinhar à direita e preencher com ZEROS à esquerda
               Quando CFOP = 2xxxxx, o valor deste campo deve ser igual à
               somatória do campo Valor_Contábil_1 dos registros-filhos CR=14
               Quando CFOP = 6xxxxx, o valor deste campo deve ser igual à
               somatória dos campos (Valor_Contábil_1+Valor_Contábil_2)
               dos registros-filhos CR=14}
               strConteudo := strConteudo + Zero(StrTran(StrTran(sqlCR10.FieldByName('ValorContabil').AsString,',',''),'.',''),15);

               {Base de Cálculo}
               {de 0,00 a 9.999.999.999.999,99 exceto pontos e vírgulas
               Alinhar à direita e preencher com ZEROS à esquerda
               Quando CFOP = 2xxxxx, o valor deste campo deve ser igual à
               somatória do campo BaseCálculo_1 dos registros-filhos
               CR=14
               Quando CFOP = 6xxxxx, o valor deste campo deve ser igual à
               somatória dos campos (BaseCálculo_1+BaseCálculo_2) dos
               registros-filhos CR=14}
               strConteudo := strConteudo + Zero(StrTran(StrTran(sqlCR10.FieldByName('BaseCalculo').AsString,',',''),'.',''),15);

               {Imposto Creditado ou Debitado}
               {de 0,00 a 9.999.999.999.999,99 exceto pontos e vírgulas
               Alinhar à direita e preencher com ZEROS à esquerda
               Se BaseCálculo > 0 então, obrigatoriamente,
               Imposto > 0 e <= 25% do valor referente à BaseCálculo
               Se BaseCálculo = 0 pode ocorrer Imposto > 0
               Se campo Ref (CR=05) >= 200201 e CFOP (CR=10) =
               2xxxxx ou 6xxxxx, o valor deste campo deve ser igual à
               somatória do campo Imposto dos registros-filhos CR=14}
               strConteudo := strConteudo + Zero(StrTran(StrTran(sqlCR10.FieldByName('Imposto').AsString,',',''),'.',''),15);

               {Isentas e Não Tributadas}
               {de 0,00 a 9.999.999.999.999,99 exceto pontos e vírgulas
               Alinhar à direita e preencher com ZEROS à esquerda}
               strConteudo := strConteudo + Zero('0',15);

               {Outros valores}
               {de 0,00 a 9.999.999.999.999,99 exceto pontos e vírgulas
               Quando CFOP = 2xxxxx ou CFOP=6xxxxx, o valor deste
               campo deve ser igual à somatória do campo Outras dos
               registros-filhos CR=14
               Alinhar à direita e preencher com ZEROS à esquerda}
               strConteudo := strConteudo + Zero('0',15);

               {Imposto Retido por Substituição Tributária}
               {Se Ref => 200201, então ImpostoRetidoST = ZEROS
                de 0,00 a 9.999.999.999.999,99 exceto pontos e vírgulas
                Quando CFOP = 2xxxxx, o valor deste campo deve ser igual à
                somatória dos campos PetróleoEnergia + OutrosProdutos dos
                registros–filhos CR=14.
                Quando CFOP = 6xxxxx, o valor deste campo deve ser igual à
                somatória do campo ICMSCobradoST dos registros–filhos CR=14.
                Alinhar à direita e preencher com ZEROS à esquerda}
                strConteudo := strConteudo + Zero('0',15);


               {Imposto lançado para contribuinte
                do tipo Substituto, responsável pelo
                recolhimento do imposto.
               de 0,00 a 9.999.999.999.999,99 exceto pontos e vírgulas
                Se Ref < 200201, então ImpRetSubstitutoST = ZEROS e
               ImpRetSubstituído = ZEROS, Senão, seguir as regras abaixo :
                Quando CFOP = 2xxxxx, então ImpRetSubstitutoST +
               ImpRetSubstituídoST deve ser igual à somatória dos campos
               PetróleoEnergia + OutrosProdutos dos registros-filhos CR=14.
                Quando CFOP = 6xxxxx, então ImpRetSubstituídoST +
               ImpRetSubstitutoST deve ser igual à somatória do campo
               ICMSCobradoST dos registros-filhos CR=14.
                Alinhar à direita e preencher com ZEROS à esquerda
                Para referência > 200804
                Se (CFOP <> 1.360 e (1.401 a 1.449) e (1.651 a 1.699) e
               1.9xx e (2.401 a 2.449) e (2.651 a 2.699) e 2.9xx e 5.360 e
               (5.401 a 5.449) e (5.651 a 5.699) e 5.9xx e 6.360 e (6.401 a
               6.449) e (6.651 a 6. 6.99) e 6.9xx então os campos
               ImpRetSubstitutoST e ImpRetSubstituído devem ser
               preenchidos com ZEROS
                Se BaseCálculo = 0 pode ocorrer (ImpRetSubstitutoST +
               ImpRetSubstituído) > 0.
               ** Para referências a partir de 2003, foram consideradas as faixas de
               CFOPs possíveis, apesar de nem todos os CFOPs compreendidos
               nestas faixas existirem.}
               strConteudo := strConteudo + Zero('0',15);

                {Imposto Retido por Substituição
                Tributária (Substituído)
               de 0,00 a 9.999.999.999.999,99 exceto pontos e vírgulas
                Se Ref < 200201, então ImpRetSubstitutoST = ZEROS e
               ImpRetSubstituído = ZEROS, Senão, seguir as regras abaixo :
                Quando CFOP = 2xxxxx, então ImpRetSubstitutoST +
               ImpRetSubstituídoST deve ser igual à somatória dos campos
               PetróleoEnergia + OutrosProdutos dos registros-filhos CR=14.
                Quando CFOP = 6xxxxx, então ImpRetSubstituídoST +
               ImpRetSubstitutoST deve ser igual à somatória do campo
               ICMSCobradoST dos registros-filhos CR=14.
                Alinhar à direita e preencher com ZEROS à esquerda
                Para referência > 200804
                Se (CFOP <> 1.360 e (1.401 a 1.449) e (1.651 a 1.699) e
               1.9xx e (2.401 a 2.449) e (2.651 a 2.699) e 2.9xx e 5.360 e
               (5.401 a 5.449) e (5.651 a 5.699) e 5.9xx e 6.360 e (6.401 a
               6.449) e (6.651 a 6. 6.99) e 6.9xx então os campos
               ImpRetSubstitutoST e ImpRetSubstituído devem ser
               preenchidos com ZEROS
                Se BaseCálculo = 0 pode ocorrer (ImpRetSubstitutoST +
               ImpRetSubstituído) > 0.
               ** Para referências a partir de 2003, foram consideradas as faixas de
               CFOPs possíveis, apesar de nem todos os CFOPs compreendidos
               nestas faixas existirem.}
               strConteudo := strConteudo + Zero('0',15);

               {Outros Impostos
                de 0,00 a 9.999.999.999.999,99 exceto pontos e vírgulas
                Alinhar à direita e preencher com ZEROS à esquerda}
               strConteudo := strConteudo + Zero('0',15);

               {Quantidade de registros CR=14}
               {Verificar se Q14 = quantidade de registros-filhos CR=14
               existentes no arquivo
               Alinhar à direita e preencher com ZEROS à esquerda
               Deve ser igual a ZEROS se RegTrib = 04 (Simples-ST)}
               if ((Copy(sqlCR10.FieldByName('CFOP').AsString,1,1) = '2') or
                   (Copy(sqlCR10.FieldByName('CFOP').AsString,1,1) = '6')) then
               begin
                  sqlAux.Close;
                  sqlAux.SQL.Clear;
                  sqlAux.SQL.Add(' With Dados as (');
                  sqlAux.SQL.Add(' SELECT  CP.CFOP, D.UF, ');
                  sqlAux.SQL.Add('        SUM(v.vrec) as ValorContabil, ');
                  sqlAux.SQL.Add('        SUM(I.VBC) AS BaseCalculo,');
                  sqlAux.SQL.Add('		    SUM(i.VICMS) as Imposto ');
                  sqlAux.SQL.Add(' FROM CTE_CAPA CP ');
                  sqlAux.SQL.Add('INNER JOIN CTE_EMITENTE E ON E.CCT = CP.CCT ');
                  sqlAux.SQL.Add('INNER JOIN CTE_DESTINATARIO D ON D.CCT = CP.CCT ');
                  sqlAux.SQL.Add('INNER JOIN CTE_VPREST V ON V.CCT = CP.CCT  ');
                  sqlAux.SQL.Add('INNER JOIN CTE_IMPOSTOS I ON I.CCT = CP.CCT ');
                  sqlAux.SQL.Add('  Where CP.CTE_FILIAL_ID = :CTE_Filial_ID ');
                  sqlAux.SQL.Add('  AND CP.DHEMI BETWEEN :Data1 and :Data2');
                  sqlAux.SQL.Add('  AND CP.CFOP = :CFOP');
                  sqlAux.ParamByName('CTE_FILIAL_ID').AsString := VarToStr(editFilial.bs_KeyValue);
                  sqlAux.ParamByName('Data1').AsSQLTimeStamp   := DateTimeToSqlTimeStamp(dataInicial.Date + StrToTime('00:00:01') );
                  sqlAux.ParamByName('Data2').AsSQLTimeStamp   := DateTimeToSqlTimeStamp(dataFinal.Date + StrToTime('23:59:59'));
                  sqlAux.ParamByName('CFOP').AsString          := sqlCR10.FieldByName('CFOP').AsString;

                  sqlAux.SQL.Add('GROUP BY CP.CFOP , D.UF ');
                  sqlAux.SQL.Add(') Select Count(1) as TOTAL14 From Dados');
                  sqlAux.Open;


                  strConteudo := strConteudo + Zero(sqlAux.FieldByName('TOTAL14').AsString ,4);
               end
               else
               begin
                  strConteudo := strConteudo + Zero('0',4);
               end;

               strConteudo := strConteudo + #13#10;


               if ((Copy(sqlCR10.FieldByName('CFOP').AsString,1,1) = '2') or
                   (Copy(sqlCR10.FieldByName('CFOP').AsString,1,1) = '6')) then
                  begin

                    sqlCR14 := TSQLQuery.Create(Nil);
                    Try
                      sqlCR14.SQLConnection := DB_Conect.SQLConnection;
                      sqlCR14.Close;
                      sqlCR14.SQL.Add(' SELECT  CP.CFOP, D.UF, ');
                      sqlCR14.SQL.Add('        SUM(v.vrec) as ValorContabil, ');
                      sqlCR14.SQL.Add('        SUM(I.VBC) AS BaseCalculo,');
                      sqlCR14.SQL.Add('		    SUM(i.VICMS) as Imposto ');
                      sqlCR14.SQL.Add(' FROM CTE_CAPA CP ');
                      sqlCR14.SQL.Add('INNER JOIN CTE_EMITENTE E ON E.CCT = CP.CCT ');
                      sqlCR14.SQL.Add('INNER JOIN CTE_DESTINATARIO D ON D.CCT = CP.CCT ');
                      sqlCR14.SQL.Add('INNER JOIN CTE_VPREST V ON V.CCT = CP.CCT  ');
                      sqlCR14.SQL.Add('INNER JOIN CTE_IMPOSTOS I ON I.CCT = CP.CCT ');
                      sqlCR14.SQL.Add('Where ((CP.CFOP like ''2%'') or (CP.CFOP like ''6%'')) ' );
                      sqlCR14.SQL.Add('  AND CP.CTE_FILIAL_ID = :CTE_Filial_ID ');
                      sqlCR14.SQL.Add('  AND CP.DHEMI BETWEEN :Data1 and :Data2');
                      sqlCR14.SQL.Add('  AND CP.CFOP = :CFOP');
                      sqlCR14.ParamByName('CFOP').AsString          := sqlCR10.FieldByName('CFOP').AsString;
                      sqlCR14.ParamByName('CTE_FILIAL_ID').AsString := VarToStr(editFilial.bs_KeyValue);
                      sqlCR14.ParamByName('Data1').AsSQLTimeStamp   := DateTimeToSqlTimeStamp(dataInicial.Date + StrToTime('00:00:01') );
                      sqlCR14.ParamByName('Data2').AsSQLTimeStamp   := DateTimeToSqlTimeStamp(dataFinal.Date + StrToTime('23:59:59'));
                      sqlCR14.SQL.Add('GROUP BY CP.CFOP , D.UF ');
                      sqlCR14.Open;
                      sqlCR14.First;
                      while not sqlCR14.Eof do
                      begin
                         strConteudo := strConteudo + '14';

                         {Unidade da Federação
                         Os valores válidos são de 01a 08, 10, 12 a 25, ou 27 a 29 descritos na Tabela 11
                         Classificação ascendente Não poderá haver duplicidade de UF}
                         strConteudo := strConteudo + Zero(DB_Conect.ExisteRegistroComValor('CTE_ESTADOS','CODIGO','UF = ' +  QuotedStr(sqlCR14.FieldByName('UF').AsString)),2);

                         {Valor Contábil de Contribuinte
                         de 0,00 a 9.999.999.999.999,99 exceto pontos e vírgulas
                         Alinhar à direita e preencher com ZEROS à esquerda  CFOPs dos grupos 2 e 6}
                         strConteudo := strConteudo + Zero(StrTran(StrTran(sqlCR14.FieldByName('ValorContabil').AsString,',',''),'.',''),15);

                         {Base de Cálculo de Contribuinte
                         de 0,00 a 9.999.999.999.999,99 exceto pontos e vírgulas
                         Alinhar à direita e preencher com ZEROS à esquerda
                         CFOPs dos grupos 2 e 6}
                         strConteudo := strConteudo + Zero(StrTran(StrTran(sqlCR14.FieldByName('BaseCalculo').AsString,',',''),'.',''),15);

                         {Valor Contábil de Não Contribuinte
                         de 0,00 a 9.999.999.999.999,99 exceto pontos e vírgulas
                         Alinhar à direita e preencher com ZEROS à esquerda
                         CFOPs do grupo 6}
                         strConteudo := strConteudo + Zero('0',15);


                         {Base de Cálculo de Não Contribuinte
                         de 0,00 a 9.999.999.999.999,99 exceto pontos e vírgulas
                         Alinhar à direita e preencher com ZEROS à esquerda
                         CFOPs do grupo 6 15}
                         strConteudo := strConteudo + Zero('0',15);


                         {Imposto  Imposto Creditado ou Debitado
                         de 0,00 a 9.999.999.999.999,99 exceto pontos e vírgulas
                         Alinhar à direita e preencher com ZEROS à esquerda
                         CFOPs dos grupos 2 e 6
                         Se Ref < 200201, então Imposto = ZEROS.15}
                         strConteudo := strConteudo + Zero('0',15);


                         {Outras  Outros valores
                         de 0,00 a 9.999.999.999.999,99 exceto pontos e vírgulas
                         Alinhar à direita e preencher com ZEROS à esquerda
                         CFOPs dos grupos 2 e 6 15}
                         strConteudo := strConteudo + Zero('0',15);

                         {ICMSCobradoST  ICMS Cobrado por Substituição Tributária
                         de 0,00 a 9.999.999.999.999,99 exceto pontos e vírgulas
                         Alinhar à direita e preencher com ZEROS à esquerda
                         CFOPs do grupo 6 15}
                         strConteudo := strConteudo + Zero('0',15);

                         {PetróleoEnergia  Petróleo e Energia quando ICMS cobrado por Substituição Tributária
                         de 0,00 a 9.999.999.999.999,99 exceto pontos e vírgulas
                         Alinhar à direita e preencher com ZEROS à esquerda CFOPs do grupo 2 15}
                         strConteudo := strConteudo + Zero('0',15);

                         {Outros Produtos  Outros Produtos quando ICMS cobrado por Substituição Tributária
                         de 0,00 a 9.999.999.999.999,99 exceto pontos e vírgulas
                         Alinhar à direita e preencher com ZEROS à esquerda CFOPs do grupo 2}
                         strConteudo := strConteudo + Zero('0',15);

                         {Indica se há alguma operação
                         Beneficiada por isenção de ICMS (ZFM/ALC)
                         0 – Não, neste caso não deve haver registros-filhos CR=18
                         ZFM/ALC e o campo Q18 deve ser = 0000 (ZEROS)
                         Se CFOP = 6.107 ou 6.108, Benef = 0
                         1 – Sim, (CFOP do grupo 6) neste caso deve haver registrosfilhos
                         CR=18 ZFM/ALC, o campo Q18 deve ser > 0000 e UF
                         deve ser = 01, 03, 04, 23 ou 24 (ver Tabela 12). Além disso, a
                         somatória do campo Valor dos registros-filhos CR=18 <=
                         (Valor_Contábil_1 + Valor_Contábil_2)
                         Na mesma UF poderão ser lançadas operações ISENTAS
                         juntamente com operações NÃO ISENTAS de ICMS , porém o
                         CR =18 irá representar somente as operações ISENTAS de ICMS.}
                         strConteudo := strConteudo + Zero('0',1);

                         {Quantidade de registros CR=18
                         Verificar se Q18 = quantidade de registros-filhos 18 existente
                         no arquivo
                         Alinhar à direita e preencher com ZEROS à esquerda}
                         strConteudo := strConteudo + Zero('0',4);

                         strConteudo := strConteudo + #13#10;

                         sqlCR14.Next;
                      end;
                    Finally
                       FreeAndNil(sqlCR14);
                    End;

                  end;

               sqlCR10.Next;
           end;
        Finally
           FreeAndNil(sqlCR10);
        End;


        {*******************************************}


        {*******************************************}

        strConteudo := strConteudo + '18';

        {Número da Nota Fiscal
        NF>000000000
        Informar apenas dígitos com alinhamento à direita. Por
        exemplo, se o número for 4321, então NF=000004321}
        strConteudo := strConteudo + Zero('0',9);

        {Data da emissão da nota fiscal
        AAAAMMDD (AAAA: Ano, MM: Mês, DD: Dia)
        O ano e mês devem ser iguais a referência indicada}
        strConteudo := strConteudo + FormatDateTime('yyyymmdd', dataFinal.Date);


        {Valor da nota fiscal
        de 0.000. 000. 000. 000,01a 9.999.999.999.999,99 exceto pontos e vírgulas
        Alinhar à direita e preencher com ZEROS à esquerda}
        strConteudo := strConteudo + Zero('0',15);

        {Cadastro Nacional de Pessoa Jurídica do Destinatário
        Informar apenas dígitos e validar CNPJ}
        strConteudo := strConteudo + Zero('0',14);

        {Código do município destinatário
        Informar apenas dígitos
        Ver Tabela 12 para valores válidos.
        A UF do município deverá ser a mesma do registro-pai
        (Detalhes Interestaduais CR=14), campo UF.}
        strConteudo := strConteudo + Zero('0',5);

        strConteudo := strConteudo + #13#10;
        {*******************************************}

        strConteudo := strConteudo + '20';

        { Código do Subitem
        Informar apenas dígitos
        Ver Tabela 13 para valores válidos,considerando o campo
        PrópriaOuST
         Se (CódSubItem >= 00704 e CódSubItem =< 00707) e campo
        PrópriaOuST = 0, então deve haver registro(s)-filho(s) CR=25
        e campo Q25 > 0000 (ZEROS) quando Ref (CR=05) < 201005.
        Caso contrário, não deve haver CR = 25 e campo Q25 = 0000
        (ZEROS) .
         Se (CódSubItem = 00201, 00203, 00204, 00702 OU 00703) e
        campo PrópriaOuST = 0, deve haver registro (s) somente
        quando Ref (CR=05) < 201005
         Se (CódSubItem = 00220, 00221, 00740 OU 00741) e campo
        PrópriaOuST = 0, e Ref (CR=05) >= 201004 então deve haver
        registro(s)-filho(s) CR=28 e campo Q28 > 0000 (ZEROS)
         Se (CódSubItem = 00205, 00701 ou 00715) e campo
        PrópriaOuST = 0, deve haver registro(s) somente quando Ref
        (CR=05) < 201201
         Se (CódSubItem = 00287) e campo PrópriaOuST = 0, deve
        haver registro somente quando Ref (CR=05) >= 201601
         Se (CódSubItem = 00770) deve haver registro somente quando
        Ref (CR=05) >= 201602
         Se (CódSubItem = 00223, 00744 ou 00745) e campo
        PrópriaOuST = 0, e Ref (CR=05) >= 201201 então deve haver
        registro(s)-filho(s) CR=28 e campo Q28 > 0000 (ZEROS)
         Se (CódSubItem = 00224 ou 00746) e campo PrópriaOuST = 0,
        deve haver registro(s) somente quando Ref (CR=05) >= 201201
        e o campo IE (CR=05) começar com 8.
         Se (CódSubItem = 00225 ou 00747) e campo PrópriaOuST = 0,
        então deve haver registro(s)-filho(s) CR=25 e campo Q25 >
        0000 (ZEROS) quando Ref (CR=05) >= 201201.
         Se (CódSubItem = 00226 ou 00748) e campo PrópriaOuST = 0,
        então deve haver registro(s)-filho(s) CR=25 e campo Q25 >
        0000 (ZEROS) quando Ref (CR=05) >= 201301.
         Se CodSuItem - Não pode ocorrer os CodSubItens
         = 00226 - 00748
         = 00748 - 00226
         Se (CódSubItem = 00739) e campo PrópriaOuST = 0, deve
        haver registro somente quando Ref (CR=05) >= 200611
         Se (CódSubItem = 00742) e campo PrópriaOuST = 0, deve
        haver registro somente quando Ref (CR=05) >= 201001
        As regras abaixo são válidas quando Ref (CR=05) > 200112
         Se (CódSubItem = 00218 ou 00729) e campo PrópriaOuST = 0
        então deve haver apenas um registro filho CR=25.
         Se (CódSubItem = 00219 ou 00730) e campo PrópriaOuST = 0
        então deve haver registro(s)-filho(s) CR=25.
         Se CodSuItem - Não pode ocorrer os CodSubItens
         = 00218 - 00219 00729 00730
         = 00729 - 00218 00219 00730
         = 00219 - 00218 00729
         = 00730 - 00218 00729
        Os CodSubitens 00219 e 00730 podem ocorrer em conjunto
         Se (CódSubItem = 00210 ou 00211) e campo PrópriaOuST = 0
        então deve haver registro(s)-filho(s) CR=26 e campos Q26 >
         zeros.
         Se (CódSubItem = 00701 ou 00702) e campo PrópriaOuST = 1
         então deve haver registro(s)-filho(s) CR=27 e campos Q27 >
         zeros.
         Somente poderá haver repetições se CódSubItem=xxx99,
        considerando o campo PrópriaOuST.
         Classificação ascendente: CódSubItem, PrópriaOuST
         PrópriaOuST=0 e RegTrib=04 não podem ocorrer em conjunto}
        strConteudo := strConteudo + Zero('0',5);

        {Valor   Valor associado ao subitem
          de 0.000. 000. 000. 000,01 a 9.999.999.999.999,99 exceto
          pontos e vírgulas.
          Alinhar à direita e preencher com ZEROS à esquerda.
          O valor deste campo deve ser =  (campo Valor dos CR= 25 ou
        CR=26 ou CR=27 ou CR=28), quando existirem estes registrosfilho.
        15}
          strConteudo := strConteudo + Zero('0',15);

        {PrópriaOuST
          Indica se a ocorrência está associada
        à Apuração do ICMS para Operações
        Próprias ou de Substituição
        Tributária
          0 – Própria
          1 – ST
          PrópriaOuST=0 e RegTrib=04 não podem ocorrer em conjunto
        01}
         strConteudo := strConteudo + Zero('0',1);

        {
        FLegal   Fundamentação Legal associada ao
        Subitem
          Texto sem caracteres de controle ou de formatação. Se
        CódSubItem=xxx99, preenchimento de texto obrigatório, caso
        contrário, preencher com caracteres de espaço.
        100}
         strConteudo := strConteudo + Zero('0',100);

        {Ocorrência   Descrição da ocorrência associada ao
        Subitem
          Texto sem caracteres de controle ou de formatação. Se
        CódSubItem=xxx99, preenchimento de texto obrigatório, caso
        contrário, preencher com caracteres ASCII 32.
        300}
         strConteudo := strConteudo + Zero('0',300);

        {Q25   Quantidade de registros CR = 25
          Verificar se Q25 = quantidade de registros-filhos 25
          Alinhar à direita e preencher com ZEROS à esquerda
          Deve ser igual a ZEROS se Ref < 200201
        04}
         strConteudo := strConteudo + Zero('0',4);

        {Q26   Quantidade de registros CR = 26
          Verificar se Q26 = quantidade de registros-filhos 26
          Alinhar à direita e preencher com ZEROS à esquerda
          Deve ser igual a ZEROS se Ref < 200201
        04}
         strConteudo := strConteudo + Zero('0',4);

        {Q27   Quantidade de registros CR = 27
          Verificar se Q27 = quantidade de registros-filhos 27
          Alinhar à direita e preencher com ZEROS à esquerda
          Deve ser igual a ZEROS se Ref < 200201
        04}
         strConteudo := strConteudo + Zero('0',4);

        {Q28   Quantidade de registros CR = 28
          Verificar se Q28 = quantidade de registros-filhos 28
          Alinhar à direita e preencher com ZEROS à esquerda
          Deve ser igual a ZEROS se Ref < 200801
        04}
         strConteudo := strConteudo + Zero('0',4);


        strConteudo := strConteudo + #13#10;
       {*******************************************}

        strConteudo := strConteudo + '25';

        {IE   Inscrição Estadual
        Informar apenas dígitos
        Não pode haver IE em duplicidade para um dado CódSubItem
        do Registro Ocorrências CR=20
        Não pode iniciar com 8 ( Se IE’s utilizados pela GIA-STNacional).
        Exemplo: 801.999.777.112
        Classificação Ascendente.
        12}
        strConteudo := strConteudo + Zero('0',12);

        {Valor   Valor associado à IE
        de 0.000. 000. 000. 000,01 a 9.999.999.999.999,99 exceto
        pontos e vírgulas
        Alinhar à direita e preencher com ZEROS à esquerda 15}
        strConteudo := strConteudo + Zero('0',15);

        strConteudo := strConteudo + #13#10;
       {*******************************************}

        strConteudo := strConteudo + '26';

        {IESubstituto   Inscrição Estadual do Substituto
        Informar apenas dígitos  12

                  Classificação
                  Ascendente de
                  IESubstituto +
                  NF
                    Não poderá
                  haver
                  duplicidade de
                  IESubstituto +
                  NF


        strConteudo := strConteudo + '12';}
        strConteudo := strConteudo + Zero('0',12);

        {NF   Número da Nota Fiscal
          Informar apenas dígitos com alinhamento à
        direita. Por exemplo, se o número for 4321,
        então NF=000004321
          Se CódSubItem =00211, então NF deve ser
        igual a ZEROS.
          Se CódSubItem = 00210, então NF >
        000000000
        09}
        strConteudo := strConteudo + Zero('0',9);


       {DataInicio   Data do início do período de
       apuração
         AAAAMM (AAAA: Ano, MM: Mês);
         Diferente de Zeros 06
       }
       strConteudo := strConteudo + FormatDateTime('yyyymm', dataFinal.Date);

       {DataFim   Data final do período de
       apuração
         AAAAMM (AAAA: Ano, MM: Mês);
         Diferente de Zeros
         DataFim >= DataInicio
         DataFim <= Ref (Campo do CR=05)
       06}
       strConteudo := strConteudo + FormatDateTime('yyyymm', dataFinal.Date);


       {Valor   Valor associado à IE do
       Substituto
         De 0.000. 000. 000. 000,01 a 9.999.999.999.999,99 exceto pontos e
       vírgulas
         Alinhar à direita e preencher com ZEROS à esquerda
         Se CódSubItem = 00210, este valor irá corresponder ao valor da
       NF.
         Se CódSubItem = 00211, este valor irá corresponder ao valor de
       Ressarcimento.
       15}
       strConteudo := strConteudo + Zero('0',15);

       strConteudo := strConteudo + #13#10;
        {*******************************************}

       strConteudo := strConteudo + '27';

       {IESubstituído   Inscrição Estadual do Substituído
         Informar apenas dígitos
         Não pode iniciar com 8 (São IE´s
       utilizadas pela GIA-ST-Nacional).
       Exemplo: 801.999.777.112 12 }
           {  Classificação
           ascendente de
           IESubstituído +
           NF.
             Não poderá haver
           duplicade de
           IESubstituído +
           NF.}
        strConteudo := strConteudo + Zero('0',12);

       {NF   Número da Nota Fiscal
          Informar apenas dígitos com alinhamento à direita. Por exemplo, se
        o número for 4321, então
        NF=000004321
          Se CódSubItem = 00702, então NF
        deve ser igual a ZEROS.
          Se CódSubItem = 00701, então NF >
        000000000.
        09}
        strConteudo := strConteudo + Zero('0',9);
        {
        Valor   Valor associado à IE do Substituído
          De 0.000. 000. 000. 000,01 a 9.999.999.999.999,99 exceto
        pontos e vírgulas
          Alinhar à direita e preencher com ZEROS à esquerda
          Se CódSubItem = 00701, este campo conterá o valor
        corresponde ao Valor da Nota Fiscal,.
          Se CódSubItem = 00702, este campo conterá o valor do
        Depósito Bancário.
        15}
        strConteudo := strConteudo + Zero('0',15);

        strConteudo := strConteudo + #13#10;
        {*******************************************}

        strConteudo := strConteudo + '28';

        {CodAutorizacao   Código de Autorização
          Informar apenas os 12 caracteres sem os pontos
          Não pode haver CodAutorizacao em duplicidade para um dado
        CódSubItem do Registro Ocorrências CR=28
          Classificação Ascendente.
        12
        }
        strConteudo := strConteudo + Zero('0',12);

        {Valor   Valor da Operação
          de 0.000. 000. 000. 000,01 a 9.999.999.999.999,99 exceto
        pontos e vírgulas
          Alinhar à direita e preencher com ZEROS à esquerda 15
        }
        strConteudo := strConteudo + Zero('0',15);

        strConteudo := strConteudo + #13#10;
        {*******************************************}

        strConteudo := strConteudo + '30';


        {Transportes
        Para referência <= 200212
        Se Existe CFOP 5.61, 5.62, 5.63, 6.61, 6.62 , 6.63 ou 7.61
        Então
        X= (BaseCálculo + IsentasNãoTrib + Outras) dos CFOP´s
        5.61 e 5.62 e 5.63 e 6.61 e 6.62 e 6.63 e 7.61
        Se X > zero, Então
        Y = dos valores lançados nos Municípios para os
        CódDIP) CR=30 (DIPAM-B), com CódDIP = 2.3
         Onde Y deve ser > zero e =< X
        Fim Se
        Fim Se
        Se houver lançamento no CódDIP 2.3 Então
        X = (BaseCálculo + IsentasNãoTrib + Outras) dos CFOP´s
         5.61 e 5.62 e 5.63 e 6.61 e 6.62 e 6.63 e 7.61
         Y = dos valores lançados nos Municípios para os
        CódDIP) CR=30 (DIPAM-B), com CódDIP = 2.3
         Onde (X e Y devem ser > zero) e (Y deve ser =< X)
        Fim Se
        Para referência > 200212
        Se Existe CFOP (5.351 a 5.399) OU (6.351 a 6.399) OU (7.351 a
        7.399)
        Então
        X= (BaseCálculo + IsentasNãoTrib + Outras) dos CFOP´s
        (5.351 a 5.399) e (6.351 a 6.399) E (7.351 a 7.399)
        Se X > zero, Então
        Y = dos valores lançados nos Municípios para os
        CódDIP) CR=30 (DIPAM-B), com CódDIP = 2.3
         Onde Y deve ser > zero e =< X
        Fim Se
        Fim Se
        Se houver lançamento no CódDIP 2.3 Então
        X = (BaseCálculo + IsentasNãoTrib + Outras) dos CFOP´s
        (5.351 a 5.399) e (6.351 a 6.399) E (7.351 a 7.399)
        Y = dos valores lançados nos Municípios para os
        CódDIP) CR=30 (DIPAM-B), com CódDIP = 2.3
         Onde (X e Y devem ser > zero) e (Y deve ser =< X)
        Fim Se}
        strConteudo := strConteudo + Zero('0',2);

        {Município   Código de um Município Paulista
          Ver Tabela 15 para valores válidos.
          Alinhar à direita com ZEROS à esquerda
          Não pode haver Município duplicado para o mesmo CódDIP
          Classificação ascendente
          Se CódDIP = 3.X, o Município deve ser = ZEROS 05}
        strConteudo := strConteudo + Zero('0',5);


        {Valor   Valor associado ao CódDIP
          de 0.000.000. 000.000,00 a 9.999.999.999.999,99 exceto
        pontos e vírgulas
          Alinhar à direita e preencher com ZEROS à esquerda 15}
        strConteudo := strConteudo + Zero('0',15);

        strConteudo := strConteudo + #13#10;
        {*******************************************}

        strConteudo := strConteudo + '31';

        {RE   Registro de Exportação
        As 10 posições à direita devem ser diferente de zeros
        Informar apenas dígitos.
        Classificação ascendente.
        Não pode haver duplicidade.
        Alinhamento à direita com ZEROS à esquerda. Por exemplo,
        se o número da RE fosse 12/3456789012, então, esse campo
        deve ser preenchido da seguinte forma: 000123456789012 15}
        strConteudo := strConteudo + Zero('0',15);

        strConteudo := strConteudo + #13#10;
        {*******************************************}

        Writeln(ArquivoTexto, strConteudo);

    Finally
      FreeAndNil(sqlAux);
    End;

  finally
    CloseFile(ArquivoTexto);
  end;





end;

procedure TfrmGeraGIA.cxButton4Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmGeraGIA.FormShow(Sender: TObject);
begin
  SetParametros(EditFilial, TipoFilial);
  dataInicial.Date := Date;
  dataFinal.Date := Date+30;
end;

end.
