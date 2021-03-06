unit uSped;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, Vcl.Menus, cxButtons, cxTextEdit, cxMaskEdit,
  cxButtonEdit, cxLabel, dxGDIPlusClasses,dxSpreadSheet,dxSpreadSheetTypes,
  cxGroupBox, Vcl.Mask, rsEdit, Vcl.ImgList, Vcl.FileCtrl, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmSped = class(TForm)
    OpenDialog: TOpenDialog;
    cxButtonProcessar: TcxButton;
    PanelSQLSplashScreen: TPanel;
    ImageSQLSplashScreen: TImage;
    cxLabelMensagem: TcxLabel;
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxButtonEditPath: TcxButtonEdit;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxButtonEditPathExcel: TcxButtonEdit;
    cxGroupBox2: TcxGroupBox;
    editInicio: TLabeledEdit;
    editFim: TLabeledEdit;
    cxGroupBox3: TcxGroupBox;
    Label1: TLabel;
    ImageList1: TImageList;
    editSalvarSped: TrsSuperEdit;
    btnSelecionaPath: TcxButton;
    sqlPath: TFDQuery;
    procedure cxButtonProcessarClick(Sender: TObject);
    procedure cxButtonEditPathClick(Sender: TObject);
    procedure cxButtonEditPathExcelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSelecionaPathClick(Sender: TObject);
  private
   varPeriodo : String;
    procedure Mensagem(pMensagem: String);
    procedure ImportarSPED;
    procedure Import_Excel;
    procedure GerarNovoSPED;
    function StrTran(sOrigem, sLoc, sSub: string): string;
    procedure SalvarPath;
    function RecuperarPath : String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSped: TfrmSped;

implementation

{$R *.dfm}

uses udmDados;


procedure TfrmSped.Mensagem(pMensagem: String);
begin

  cxLabelMensagem.Caption := pMensagem;
  PanelSQLSplashScreen.Visible := not pMensagem.IsEmpty;
  Update;
  Application.ProcessMessages;

end;

function TfrmSped.RecuperarPath: String;
begin
  sqlPath.Connection := Dados.FDConnection;



end;

procedure TfrmSped.btnSelecionaPathClick(Sender: TObject);
var
  FDir : String;
begin
  inherited;
  if Win32MajorVersion >= 6 then
    with TFileOpenDialog.Create(nil) do
    try
      Title := 'Selecionar Diret�rio';
      Options := [fdoPickFolders, fdoPathMustExist, fdoForceFileSystem]; // YMMV
      OkButtonLabel := 'Selecionar';
      DefaultFolder := FDir;
      FileName := FDir;
      if Execute then
        editSalvarSped.Text := FileName;
    finally
      Free;
    end
  else
    if SelectDirectory('Selecionar Diret�rio', ExtractFileDrive(FDir), FDir,
             [sdNewUI, sdNewFolder]) then
      editSalvarSped.Text := FDir;

end;

procedure TfrmSped.cxButtonEditPathClick(Sender: TObject);
begin
  OpenDialog.Filter := '*.txt';
  if OpenDialog.Execute(Handle) then
  begin
    cxButtonEditPath.Text := OpenDialog.FileName;
  end;

end;

procedure TfrmSped.cxButtonEditPathExcelClick(Sender: TObject);
begin
  OpenDialog.Filter := '*.xlsx';
  if OpenDialog.Execute(Handle) then
  begin
    cxButtonEditPathExcel.Text := OpenDialog.FileName;
  end;

end;

procedure TfrmSped.cxButtonProcessarClick(Sender: TObject);
begin

 if cxButtonEditPath.Text = EmptyStr then
    raise Exception.Create('Informe o arquivo SPED primeiro.');

  if cxButtonEditPathExcel.Text = EmptyStr then
    raise Exception.Create('Informe o arquivo EXCEL primeiro.');

  Try
    ImportarSPED;
  except
    on E: Exception do
    begin
      varPeriodo := '';
      Mensagem( E.Message );
    end;
  end;


  //varPeriodo:= '01072017_31072017';


  if varPeriodo <> '' then
     Import_Excel;

  if varPeriodo <> '' then
     GerarNovoSPED;

end;

procedure  TfrmSped.GerarNovoSPED;
var
  varSPED              : TStringList;
  varLinha, varCodItem, varCodCNPJ, varCodCNPJTMP, varCodConta, varLinha180 : String;
  I, T, varUltimaLinha : Integer;
  bApagaUltima : Boolean;
begin
  Dados   := TDados.Create(nil);
  Mensagem( 'Criando Novo Arquivo do SPED' );
  varSPED := TStringList.Create;
  Try
    varSPED.Clear;
    with Dados do
    begin
       sqlAuxiliar.Close;
       sqlAuxiliar.SQL.Clear;
       sqlAuxiliar.SQL.Add('Select Count(1) as Total From Arq_Geral');
       sqlAuxiliar.SQL.Add('Where Periodo = :Periodo ');
       sqlAuxiliar.Params.ParamByName('Periodo').AsString := varPeriodo;
       sqlAuxiliar.Open;
       T := sqlAuxiliar.FieldByName('Total').AsInteger;

       sqlAuxiliar.Close;
       sqlAuxiliar.SQL.Clear;
       sqlAuxiliar.SQL.Add('Select * From Arq_Geral');
       sqlAuxiliar.SQL.Add('Where Periodo = :Periodo Order BY Arq_Geral_ID ');
       sqlAuxiliar.Params.ParamByName('Periodo').AsString := varPeriodo;
       sqlAuxiliar.Open;
       sqlAuxiliar.First;

       I := 1;
       varCodCNPJTMP := '';
       varCodConta   := '';
       varCodCNPJTMP := '';
       varCodCNPJ    := '';

       while not sqlAuxiliar.Eof do
       begin
           Mensagem( 'Gerando Novo Arquivo SPED  (' +  IntToStr(I) + '/' + IntToStr(T)+ ')' );
           Inc(I);

              varLinha := sqlAuxiliar.FieldByName('Linha').AsString;

              if ((varLinha.Split(['|'])[1].Trim  = 'C181') or (varLinha.Split(['|'])[1].Trim  = 'C185')) then
              begin

                varCodConta := varLinha.Split(['|'])[11].Trim;

                if ((varCodConta = '0000414008') or (varCodConta = '0000451000')) then
                begin
                   varSPED.Add(varLinha);
                   varCodConta := '';
                   sqlAuxiliar.Next;
                   Continue;
                end;
              end;

              if (varLinha.Split(['|'])[1].Trim  = 'C181') then
              begin
                  if varLinha.Split(['|'])[10].Trim  = '0' then
                  begin
                     varSPED.Add(varLinha);
                  end;

                  sqlAuxiliar.Next;
                  Continue;
              end;


              if (varLinha.Split(['|'])[1].Trim  = 'C185') then
              begin
                  if varLinha.Split(['|'])[10].Trim  = '0' then
                  begin
                     varSPED.Add(varLinha);
                  end;
                  sqlAuxiliar.Next;
                  Continue;
              end;


              if (varLinha.Split(['|'])[1].Trim  = 'C180') then
              begin
                varLinha180 :=  varLinha;
                varCodItem := varLinha.Split(['|'])[5].Trim;

              end
              else varCodItem := '0';

              //|C010|01111039000149|1|

              if ((varLinha.Split(['|'])[1].Trim  = 'C010') and (varLinha.Split(['|'])[2].Trim <> varCodCNPJTMP)) then
              begin
                 varCodCNPJ      := varLinha.Split(['|'])[2].Trim;
                 varCodCNPJTMP   := varLinha.Split(['|'])[2].Trim;
              end
              else varCodCNPJ := varCodCNPJTMP;

              sqlAux.Close;
              sqlAux.SQL.Clear;
              sqlAux.SQL.Add('Select * From VW_RECALCULO ');
              sqlAux.SQL.Add('Where COD_ITEM = :COD_ITEM and FILIAL = :FILIAL');
              sqlAux.Params.ParamByName('COD_ITEM').AsString := varCodItem;
              sqlAux.Params.ParamByName('FILIAL').AsString   := varCodCNPJ;

              sqlAux.Open;

              if (not sqlAux.IsEmpty)  then
              begin
                 if varCodItem = 'Y209473' then
                   ShowMessage('pare');

                sqlAux180.Close;
                sqlAux180.SQL.Clear;

                sqlAux180.SQL.Add('SELECT ''|'' + P.REG AS REG, ''|'' +  ');
                sqlAux180.SQL.Add('P.COD_MOD AS COD_MOD, ''|'' +  ');
                sqlAux180.SQL.Add('P.DT_DOC_INI AS DT_DOC_INI, ''|'' + ');
                sqlAux180.SQL.Add('P.DT_DOC_FIN AS DT_DOC_FIN, ''|'' +  ');
                sqlAux180.SQL.Add('P.COD_ITEM AS COD_ITEM, ''|'' + ');
                sqlAux180.SQL.Add('P.COD_NCM AS COD_NCM,''||'' +  ');
                sqlAux180.SQL.Add('CONVERT(VARCHAR, SUM(C.NOVABASE)) + ''|'' AS NOVABASE  ');
                sqlAux180.SQL.Add('FROM ARQ_C180 P   ');
                sqlAux180.SQL.Add('INNER JOIN VW_RECALCULO C ON C.COD_ITEM = P.COD_ITEM  ');
                sqlAux180.SQL.Add('WHERE P.COD_ITEM = :COD_ITEM ');
                sqlAux180.SQL.Add('AND   C.FILIAL   = :FILIAL ');
                sqlAux180.SQL.Add('AND   P.PERIODO  = :PERIODO ');

                sqlAux180.SQL.Add(' group by P.REG, P.COD_MOD, P.DT_DOC_INI, P.DT_DOC_FIN, P.COD_ITEM, P.COD_NCM   ');
                sqlAux180.Params.ParamByName('COD_ITEM').AsString := varCodItem;
                sqlAux180.Params.ParamByName('FILIAL').AsString   := varCodCNPJ;
                sqlAux180.Params.ParamByName('PERIODO').AsString  := varPeriodo;
                GetComando( sqlAux180 );
                sqlAux180.Open;

                varLinha :=  sqlAux180.FieldByName('REG').AsString +
                             sqlAux180.FieldByName('COD_MOD').AsString +
                             sqlAux180.FieldByName('DT_DOC_INI').AsString +
                             sqlAux180.FieldByName('DT_DOC_FIN').AsString +
                             sqlAux180.FieldByName('DT_DOC_FIN').AsString +
                             sqlAux180.FieldByName('COD_ITEM').AsString +
                             sqlAux180.FieldByName('COD_NCM').AsString +
                             sqlAux180.FieldByName('NOVABASE').AsString;

                varSPED.Add(varLinha);

                sqlAux180Itens.Close;
                sqlAux180Itens.SQL.Clear;

                sqlAux180Itens.SQL.Add('SELECT ''|'' +F.REG as REG, ''|'' + ');
                sqlAux180Itens.SQL.Add('F.CST AS CST, ''|'' + ');
                sqlAux180Itens.SQL.Add('F.CFOP AS CFOP, ''|'' +  ');
                sqlAux180Itens.SQL.Add('Convert(varchar,C.NOVABASE) as NovaBase, ''|0|'' + ');
                sqlAux180Itens.SQL.Add('Convert(varchar,C.NOVABASE) as NovaBase2, ''|'' +  ');
                sqlAux180Itens.SQL.Add('Convert(varchar,F.ALIQ) as ALIQ, ''||'' + ');
                sqlAux180Itens.SQL.Add('Convert(varchar,C.NOVOPIS) as NOVOVALOR, ''|'' + ');
                sqlAux180Itens.SQL.Add('Convert(varchar,   (SELECT CONTA FROM ARQ_CFOP WHERE CFOP = C.CFOP)  ) + ''|''  as COD_CT ');
                sqlAux180Itens.SQL.Add('FROM ARQ_C180 P  ');
                sqlAux180Itens.SQL.Add('INNER JOIN ARQ_C180_ITENS F ON  P.ARQ_C180 = F.ARQ_C180  ');
                sqlAux180Itens.SQL.Add('INNER JOIN VW_RECALCULO C ON C.COD_ITEM = P.COD_ITEM ');
                sqlAux180Itens.SQL.Add('                         AND C.CFOP     = F.CFOP ');
                sqlAux180Itens.SQL.Add('WHERE P.COD_ITEM = :COD_ITEM1 ');
                sqlAux180Itens.SQL.Add('AND C.FILIAL = :FILIAL1 ');
                sqlAux180Itens.SQL.Add('AND P.PERIODO = :PERIODO1 ');
                sqlAux180Itens.SQL.Add('AND F.REG = ''C181'' ');
                sqlAux180Itens.SQL.Add(' GROUP BY  F.CFOP , F.ALIQ, C.NOVABASE, C.NOVOPIS, C.CFOP,  F.REG, F.CST  ');

                sqlAux180Itens.Params.ParamByName('COD_ITEM1').AsString := varCodItem;
                sqlAux180Itens.Params.ParamByName('FILIAL1').AsString   := varCodCNPJ;
                sqlAux180Itens.Params.ParamByName('PERIODO1').AsString  := varPeriodo;

                sqlAux180Itens.Open;
                while not sqlAux180Itens.Eof do
                begin
                    varLinha :=  sqlAux180Itens.FieldByName('REG').AsString +
                                 sqlAux180Itens.FieldByName('CST').AsString +
                                 sqlAux180Itens.FieldByName('CFOP').AsString +
                                 sqlAux180Itens.FieldByName('NovaBase').AsString +
                                 sqlAux180Itens.FieldByName('NovaBase2').AsString +
                                 sqlAux180Itens.FieldByName('ALIQ').AsString +
                                 sqlAux180Itens.FieldByName('NOVOVALOR').AsString +
                                 sqlAux180Itens.FieldByName('COD_CT').AsString;

                    varSPED.Add(varLinha);
                    sqlAux180Itens.Next;
                end;


                sqlAux180Itens.Close;
                sqlAux180Itens.SQL.Clear;

                sqlAux180Itens.SQL.Add('SELECT ''|'' +F.REG AS REG, ''|'' + ');
                sqlAux180Itens.SQL.Add('            F.CST AS CST, ''|'' +  ');
                sqlAux180Itens.SQL.Add('            F.CFOP AS CFOP, ''|'' +  ');
                sqlAux180Itens.SQL.Add('            Convert(varchar,C.NOVABASE) as NovaBase, ''|0|'' +  ');
                sqlAux180Itens.SQL.Add('            Convert(varchar,C.NOVABASE) as NovaBase2, ''|'' +  ');
                sqlAux180Itens.SQL.Add('            Convert(varchar,F.ALIQ) as ALIQ, ''||'' +   ');
                sqlAux180Itens.SQL.Add('            Convert(varchar,C.NOVOCOFINS) as NOVOVALOR, ''|'' +  ');
                sqlAux180Itens.SQL.Add('            Convert(varchar,   (SELECT CONTA FROM ARQ_CFOP WHERE CFOP = C.CFOP)) + ''|''  as COD_CT  ');
                sqlAux180Itens.SQL.Add('FROM ARQ_C180 P  ');
                sqlAux180Itens.SQL.Add('INNER JOIN ARQ_C180_ITENS F ON  P.ARQ_C180 = F.ARQ_C180 ');
                sqlAux180Itens.SQL.Add('INNER JOIN VW_RECALCULO C ON C.COD_ITEM = P.COD_ITEM ');
                sqlAux180Itens.SQL.Add('                         AND C.CFOP     = F.CFOP ');
                sqlAux180Itens.SQL.Add(' WHERE P.COD_ITEM = :COD_ITEM2');
                sqlAux180Itens.SQL.Add('AND C.FILIAL = :FILIAL2  ');
                sqlAux180Itens.SQL.Add('AND P.PERIODO = :PERIODO2 ');
                sqlAux180Itens.SQL.Add('AND F.REG = ''C185'' ');
                sqlAux180Itens.SQL.Add(' GROUP BY  F.CFOP , F.ALIQ, C.NOVABASE, C.NOVOCOFINS, C.CFOP,  F.REG, F.CST  ');
                sqlAux180Itens.SQL.Add('   ORDER BY 1, 3  ');


                sqlAux180Itens.Params.ParamByName('COD_ITEM2').AsString := varCodItem;
                sqlAux180Itens.Params.ParamByName('FILIAL2').AsString   := varCodCNPJ;
                sqlAux180Itens.Params.ParamByName('PERIODO2').AsString  := varPeriodo;

                GetComando( sqlAux180Itens );

                sqlAux180Itens.Open;
                while not sqlAux180Itens.Eof do
                begin
                    varLinha :=  sqlAux180Itens.FieldByName('REG').AsString +
                                 sqlAux180Itens.FieldByName('CST').AsString +
                                 sqlAux180Itens.FieldByName('CFOP').AsString +
                                 sqlAux180Itens.FieldByName('NovaBase').AsString +
                                 sqlAux180Itens.FieldByName('NovaBase2').AsString +
                                 sqlAux180Itens.FieldByName('ALIQ').AsString +
                                 sqlAux180Itens.FieldByName('NOVOVALOR').AsString +
                                 sqlAux180Itens.FieldByName('COD_CT').AsString;

                    varSPED.Add(varLinha);
                    sqlAux180Itens.Next;
                end;

               // sqlAuxiliar.Next; //Pula p/ linha C181
               // Inc(I);
               // sqlAuxiliar.Next; //Pula p/ linha C185
              //  Inc(I);

              end
              else
              begin
                 varSPED.Add(varLinha);
              end;
           {end
           else
           begin

              varSPED.Add(varLinha);

           end;}

          sqlAuxiliar.Next;
       end;

       varSPED.SaveToFile(ExtractFilePath(Application.ExeName) + '\' + 'SPED_' + varPeriodo + '.txt');

       editFim.Text := TimeToStr(Now);

       ShowMessage('Fim do Processo. Arquivo do SPED gerado com Sucesso.');

    end;

  Finally
    FreeAndNil(varSPED);
    FreeAndNil(Dados);
  End;
end;

procedure TfrmSped.SalvarPath;
begin

end;

function TfrmSped.StrTran(sOrigem: string; sLoc: string; sSub: string): string;
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



procedure TfrmSped.FormCreate(Sender: TObject);
begin
  editInicio.Text := TimeToStr(Now);
end;

procedure   TfrmSped.ImportarSPED;
var
  varSPED: TStringList;
  varInicial, varFinal: Integer;
  I, X: Integer;
  varSQL  : String;
  varIdentity : Integer;
  varLinha : Array [0..13] of String;
  varValorItem : Double;

begin

  Mensagem('Inicio: Import SEPD');

  Mensagem( 'Criando DataModule' );
  Dados := TDados.Create(nil);

  Mensagem( 'Criando StringList' );
  varSPED := TStringList.Create;
  try

    with Dados do
    begin

      FDConnection.Open;
      try

        varSPED.LoadFromFile( cxButtonEditPath.Text );

        //for I := varSPED.Count-1 downto 0 do
         // if not (varSPED[I].CountChar('|') = 4) then
         //   varSPED.Delete(I);



            varInicial := 0;
            varFinal := varSPED.Count;

            varPeriodo := varSPED[I].Split(['|'])[6].Trim + '_' + varSPED[I].Split(['|'])[7].Trim;

            for I := varInicial to varSPED.Count-1 do
            begin

              Mensagem( 'Arquivo SPED  (' +  IntToStr(I) + '/' + IntToStr(varFinal)+ ')' );

              if varSPED[I].Split(['|'])[1].Trim = '0000' then
              begin

                varLinha[0]  :=   varSPED[I].Split(['|'])[1].Trim;
                varLinha[1]  :=   varSPED[I].Split(['|'])[2].Trim;
                varLinha[2]  :=   varSPED[I].Split(['|'])[3].Replace('0','1');
                varLinha[3]  :=   varSPED[I].Split(['|'])[4].Trim;
                varLinha[4]  :=   varSPED[I].Split(['|'])[5].Trim;
                varLinha[5]  :=   varSPED[I].Split(['|'])[6].Trim;
                varLinha[6]  :=   varSPED[I].Split(['|'])[7].Trim;
                varLinha[7]  :=   varSPED[I].Split(['|'])[8].Trim;
                varLinha[8]  :=   varSPED[I].Split(['|'])[9].Trim;
                varLinha[9]  :=   varSPED[I].Split(['|'])[10].Trim;
                varLinha[10] :=   varSPED[I].Split(['|'])[11].Trim;
                varLinha[11] :=   varSPED[I].Split(['|'])[12].Trim;
                varLinha[12] :=   varSPED[I].Split(['|'])[13].Trim;
                varLinha[13] :=   varSPED[I].Split(['|'])[14].Trim;

                varSPED[I] := '|';

                for X := Low(varLinha) to High(varLinha) do
                  begin
                    varSPED[I] := varSPED[I] + varLinha[X] + '|';
                  end;
              end;


              if varSPED[I].Split(['|'])[1].Trim = 'C180' Then
              begin
                 sqlAuxiliar.Close;
                 sqlAuxiliar.SQL.Clear;
                 sqlAuxiliar.SQL.Add('Insert into ARQ_C180 ( ');
                 sqlAuxiliar.SQL.Add('PERIODO,');
                 sqlAuxiliar.SQL.Add('REG,');
                 sqlAuxiliar.SQL.Add('COD_MOD,');
                 sqlAuxiliar.SQL.Add('DT_DOC_INI,');
                 sqlAuxiliar.SQL.Add('DT_DOC_FIN,');
                 sqlAuxiliar.SQL.Add('COD_ITEM,');
                 sqlAuxiliar.SQL.Add('COD_NCM,');
                 sqlAuxiliar.SQL.Add('EX_IPI,');
                 sqlAuxiliar.SQL.Add('VL_TOT_ITEM)');
                 sqlAuxiliar.SQL.Add(' VALUES ( ');
                 sqlAuxiliar.SQL.Add(':PERIODO,');
                 sqlAuxiliar.SQL.Add(':REG,');
                 sqlAuxiliar.SQL.Add(':COD_MOD,');
                 sqlAuxiliar.SQL.Add(':DT_DOC_INI,');
                 sqlAuxiliar.SQL.Add(':DT_DOC_FIN,');
                 sqlAuxiliar.SQL.Add(':COD_ITEM,');
                 sqlAuxiliar.SQL.Add(':COD_NCM,');
                 sqlAuxiliar.SQL.Add(':EX_IPI,');
                 sqlAuxiliar.SQL.Add(':VL_TOT_ITEM)');
                 sqlAuxiliar.Params.ParamByName('PERIODO').AsString     :=  varPeriodo;
                 sqlAuxiliar.Params.ParamByName('REG').AsString         :=  varSPED[I].Split(['|'])[1].Trim;
                 sqlAuxiliar.Params.ParamByName('COD_MOD').AsString     :=  varSPED[I].Split(['|'])[2].Trim;
                 sqlAuxiliar.Params.ParamByName('DT_DOC_INI').AsString  :=  varSPED[I].Split(['|'])[3].Trim;
                 sqlAuxiliar.Params.ParamByName('DT_DOC_FIN').AsString  :=  varSPED[I].Split(['|'])[4].Trim;
                 sqlAuxiliar.Params.ParamByName('COD_ITEM').AsString    :=  varSPED[I].Split(['|'])[5].Trim;
                 sqlAuxiliar.Params.ParamByName('COD_NCM').AsString     :=  varSPED[I].Split(['|'])[6].Trim;
                 sqlAuxiliar.Params.ParamByName('EX_IPI').AsString      :=  varSPED[I].Split(['|'])[7].Trim;
                 sqlAuxiliar.Params.ParamByName('VL_TOT_ITEM').AsFloat  :=  StrToFloat(varSPED[I].Split(['|'])[8].Trim);
                 varValorItem                                           :=  StrToFloat(varSPED[I].Split(['|'])[8].Trim);
                 Try

                     sqlAuxiliar.ExecSQL;

                     Try
                      varIdentity := 0;
                      varSQL  := 'SELECT @@IDENTITY as ARQ_C180_ID ';

                      sqlAuxiliar.Close;
                      sqlAuxiliar.SQL.Clear;
                      sqlAuxiliar.SQL.Add( varSQL );
                      sqlAuxiliar.Open;
                      varIdentity := sqlAuxiliar.FieldByName('ARQ_C180_ID').AsInteger;

                    except
                      On E:Exception do
                        begin
                          varPeriodo := '';
                          Showmessage( 'Falha ao pegar chave da tabela ARQ_C180: ' + E.Message );
                        end;
                    end;

                except

                  on E: Exception do
                  begin

                    Mensagem( E.Message );

                  end;

                end;

              end;

              if ((varSPED[I].Split(['|'])[1].Trim = 'C181') or (varSPED[I].Split(['|'])[1].Trim = 'C185')) Then
              begin
                 Try
                     sqlAuxiliar.Close;
                     sqlAuxiliar.SQL.Clear;
                     sqlAuxiliar.SQL.Add('Insert into ARQ_C180_ITENS ( ');
                     sqlAuxiliar.SQL.Add(' ARQ_C180');
                     sqlAuxiliar.SQL.Add(',REG');
                     sqlAuxiliar.SQL.Add(',CST');
                     sqlAuxiliar.SQL.Add(',CFOP');
                     sqlAuxiliar.SQL.Add(',VL_ITEM');
                     sqlAuxiliar.SQL.Add(',VL_DESC');
                     sqlAuxiliar.SQL.Add(',VL_BC');
                     sqlAuxiliar.SQL.Add(',ALIQ');
                     sqlAuxiliar.SQL.Add(',QUANT_BC');
                     sqlAuxiliar.SQL.Add(',ALIQ_QUANT');
                     sqlAuxiliar.SQL.Add(',VL');
                     sqlAuxiliar.SQL.Add(',COD_CT');
                     sqlAuxiliar.SQL.Add(',PERCENTUAL)');

                     sqlAuxiliar.SQL.Add(' Values (');
                     sqlAuxiliar.SQL.Add(' :ARQ_C180');
                     sqlAuxiliar.SQL.Add(',:REG');
                     sqlAuxiliar.SQL.Add(',:CST');
                     sqlAuxiliar.SQL.Add(',:CFOP');
                     sqlAuxiliar.SQL.Add(',:VL_ITEM');
                     sqlAuxiliar.SQL.Add(',:VL_DESC');
                     sqlAuxiliar.SQL.Add(',:VL_BC');
                     sqlAuxiliar.SQL.Add(',:ALIQ');
                     sqlAuxiliar.SQL.Add(',:QUANT_BC');
                     sqlAuxiliar.SQL.Add(',:ALIQ_QUANT');
                     sqlAuxiliar.SQL.Add(',:VL');
                     sqlAuxiliar.SQL.Add(',:COD_CT');
                     sqlAuxiliar.SQL.Add(',:PERCENTUAL)');

                     sqlAuxiliar.Params.ParamByName('ARQ_C180').AsInteger   :=  varIdentity;
                     sqlAuxiliar.Params.ParamByName('REG').AsString         :=  varSPED[I].Split(['|'])[1].Trim;
                     sqlAuxiliar.Params.ParamByName('CST').AsString         :=  varSPED[I].Split(['|'])[2].Trim;
                     sqlAuxiliar.Params.ParamByName('CFOP').AsString        :=  varSPED[I].Split(['|'])[3].Trim;

                     if varSPED[I].Split(['|'])[4].Trim <> '' then
                           sqlAuxiliar.Params.ParamByName('VL_ITEM').AsFloat     :=  StrToFloat(varSPED[I].Split(['|'])[4].Trim)
                     else  sqlAuxiliar.Params.ParamByName('VL_ITEM').AsFloat     :=0;

                     if varSPED[I].Split(['|'])[5].Trim <> '' then
                          sqlAuxiliar.Params.ParamByName('VL_DESC').AsFloat      :=  StrToFloat(varSPED[I].Split(['|'])[5].Trim)
                     else sqlAuxiliar.Params.ParamByName('VL_DESC').AsFloat      := 0;

                     if varSPED[I].Split(['|'])[6].Trim <> '' then
                           sqlAuxiliar.Params.ParamByName('VL_BC').AsFloat       :=  StrToFloat(varSPED[I].Split(['|'])[6].Trim)
                     else  sqlAuxiliar.Params.ParamByName('VL_BC').AsFloat       := 0;

                     if varSPED[I].Split(['|'])[7].Trim <> '' then
                          sqlAuxiliar.Params.ParamByName('ALIQ').AsFloat         :=  StrToFloat(varSPED[I].Split(['|'])[7].Trim)
                     else sqlAuxiliar.Params.ParamByName('ALIQ').AsFloat         :=0;

                     if varSPED[I].Split(['|'])[8].Trim <> '' then
                           sqlAuxiliar.Params.ParamByName('QUANT_BC').AsFloat    :=  StrToFloat(varSPED[I].Split(['|'])[8].Trim)
                     else  sqlAuxiliar.Params.ParamByName('QUANT_BC').AsFloat    :=0;

                     if varSPED[I].Split(['|'])[9].Trim <> '' then
                          sqlAuxiliar.Params.ParamByName('ALIQ_QUANT').AsFloat   :=  StrToFloat(varSPED[I].Split(['|'])[9].Trim)
                     else sqlAuxiliar.Params.ParamByName('ALIQ_QUANT').AsFloat   :=0;

                     if varSPED[I].Split(['|'])[10].Trim <> '' then
                           sqlAuxiliar.Params.ParamByName('VL').AsFloat          :=  StrToFloat(varSPED[I].Split(['|'])[10].Trim)
                     else  sqlAuxiliar.Params.ParamByName('VL').AsFloat          := 0;

                     sqlAuxiliar.Params.ParamByName('COD_CT').AsString           :=  varSPED[I].Split(['|'])[11].Trim;

                     sqlAuxiliar.Params.ParamByName('PERCENTUAL').AsFloat        := (StrToFloat(varSPED[I].Split(['|'])[4].Trim)/varValorItem)*100;


                 except

                    on E: Exception do
                    begin
                      varPeriodo := '';
                      ShowMessage( E.Message + varSPED[I] );

                    end;

                 end;

                 try
                    sqlAuxiliar.ExecSQL;

                  except

                    on E: Exception do
                    begin
                      varPeriodo := '';
                      ShowMessage( E.Message + varSPED[I] );

                    end;

                 end;

              end;


              sqlAuxiliar.Close;
              sqlAuxiliar.SQL.Clear;
              sqlAuxiliar.SQL.Add('Insert into ARQ_GERAL (PERIODO, LINHA) Values (:PERIODO, :LINHA)');
              sqlAuxiliar.Params.ParamByName('PERIODO').AsString :=  varPeriodo;
              sqlAuxiliar.Params.ParamByName('LINHA').AsString   :=  varSPED[I];

              try

                sqlAuxiliar.ExecSQL;

              except

                on E: Exception do
                begin
                  varPeriodo := '';
                  ShowMessage( E.Message );

                end;

              end;

              if varSPED[I].Split(['|'])[1].Trim = '9999' Then
                 Exit;

            end;

            sqlAuxiliar.Close;
      finally

        FDConnection.Close;

      end;

    end;

  finally

    FreeAndNil(varSPED);
    FreeAndNil(Dados);

  end;

end;


procedure TfrmSped.Import_Excel;
var
  I: Integer;

  dxSpreadSheet: TdxSpreadSheet;
  varStringList: TStringList;

  varDate: Integer;

  varColumnFilial: Integer;
  varColumnNF: Integer;
  varColumnDataNF: Integer;
  varColumnCFOP: Integer;
  varColumnCST : Integer;
  varColumnUF: Integer;
  varColumnValorContabil: Integer;
  varColumnValorICMS: Integer;
  varColumnAliq_PIS: Integer;
  varColumnAliq_COFINS: Integer;
  varColumnCodProduto: Integer;
  varColumnNovaBase: Integer;
  varColumnNovoValorPIS: Integer;
  varColumnNovoValorCOFINS: Integer;


  varFilial: String;
  varNF: String;
  varDataNF: TDateTime;
  varCFOP: String;
  varUF: String;
  varValorContabil: Extended;
  varValorICMS: Extended;
  varAliq_PIS: Extended;
  varAliq_COFINS: Extended;
  varCodProduto: String;
  varNovaBase: Extended;
  varNovoValorPIS: Extended;
  varNovoValorCOFINS: Extended;


  varScript: TStringList;
  varUltimaColuna : Integer;

begin

  Dados := TDados.Create(nil);
  dxSpreadSheet := TdxSpreadSheet.Create(nil);
  try

    Mensagem('Lendo Planilha: '+ cxButtonEditPathExcel.Text);
    dxSpreadSheet.LoadFromFile( cxButtonEditPathExcel.Text);

    varColumnFilial := -1;
    varColumnNF := -1;
    varColumnDataNF := -1;
    varColumnCFOP := -1;
    varColumnUF := -1;
    varColumnValorContabil := -1;
    varColumnValorICMS := -1;
    varColumnAliq_PIS := -1;
    varColumnAliq_COFINS := -1;
    varColumnCodProduto := -1;
    varColumnNovaBase := -1;
    varColumnNovoValorPIS := -1;
    varColumnNovoValorCOFINS := -1;


    varUltimaColuna := dxSpreadSheet.ActiveSheetAsTable.Columns.LastIndex;
    Mensagem('Descobrindo Colunas');
    for I := dxSpreadSheet.ActiveSheetAsTable.Columns.FirstIndex to varUltimaColuna do
    begin

      if not  Assigned(dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0]) then
         Break;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'FILIAL' then
        varColumnFilial := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'NUM. NF' then
        varColumnNF := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'DATA NF' then
        varColumnDataNF := I;


      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'CFOP' then
        varColumnCFOP := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'UF' then
        varColumnUF := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'BASE PIS' then
        varColumnValorContabil := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'VLR. ICMS' then
        varColumnValorICMS := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'ALIQ PIS' then
        varColumnAliq_PIS := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'ALIQ COFINS' then
        varColumnAliq_COFINS := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'COD. PRODUTO' then
        varColumnCodProduto := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'NOVA BASE PIS/COFINS' then
        varColumnNovaBase := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'NOVO PIS' then
        varColumnNovoValorPIS := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'NOVO COFINS' then
        varColumnNovoValorCOFINS := I;

      if varColumnNovoValorCOFINS <> -1 then
         Break;

    end;


    if varColumnFilial = -1 then
      ShowMessage( 'Coluna (FILIAL) n�o foi encontrada' );
    if varColumnNF = -1 then
      ShowMessage( 'Coluna (NUM. NF) n�o foi encontrada' );
    if varColumnDataNF = -1 then
      ShowMessage( 'Coluna (DATA NF) n�o foi encontrada' );
    if varColumnCFOP = -1 then
      ShowMessage( 'Coluna (CFOP) n�o foi encontrada' );
    if varColumnUF = -1 then
      ShowMessage( 'Coluna (UF) n�o foi encontrada' );
    if varColumnValorContabil = -1 then
      ShowMessage( 'Coluna (VLR. CONTABIL) n�o foi encontrada' );
    if varColumnValorICMS = -1 then
      ShowMessage( 'Coluna (VLR. ICMS) n�o foi encontrada' );
    if varColumnAliq_PIS = -1 then
      ShowMessage( 'Coluna (ALIQ PIS) n�o foi encontrada' );
    if varColumnAliq_COFINS = -1 then
      ShowMessage( 'Coluna (ALIQ COFINS) n�o foi encontrada' );
    if varColumnCodProduto = -1 then
      ShowMessage( 'Coluna (COD. PRODUTO) n�o foi encontrada' );
    if varColumnNovaBase = -1 then
      ShowMessage( 'Coluna (NOVA BASE PIS/COFINS) n�o foi encontrada' );
    if varColumnNovoValorPIS = -1 then
      ShowMessage( 'Coluna (NOVO PIS) n�o foi encontrada' );
    if varColumnNovoValorCOFINS = -1 then
      ShowMessage( 'Coluna (NOVO COFINS) n�o foi encontrada' );

   // Writeln( 'Criando DataModule' );


      with Dados do
      begin

        FDConnection.Open;
        try


            Mensagem('Looping pelas linhas');
            for I := dxSpreadSheet.ActiveSheetAsTable.Rows.FirstIndex+1 to dxSpreadSheet.ActiveSheetAsTable.Rows.LastIndex do
            begin

              Mensagem( 'Arquivo Excel  (' +  IntToStr(I) + '/' + IntToStr(dxSpreadSheet.ActiveSheetAsTable.Rows.LastIndex-1)+ ')' );

              varFilial := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnFilial].AsString);

              varNF := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnNF].AsString);

              if dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnDataNF].DataType = cdtDateTime then
                varDataNF := dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnDataNF].AsDateTime
              else
              if TryStrToInt( dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnDataNF].AsString, varDate ) then
                varDataNF := varDate
              else
                varDataNF := StrToDate(String(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnDataNF].AsString).Replace( '.', '/' ));

              varCFOP := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnCFOP].AsString);

              varUF := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnUF].AsString);

             varValorContabil := dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnValorContabil].AsFloat ;

              varValorICMS := dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnValorICMS].AsFloat ;

              varAliq_PIS := dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnAliq_PIS].AsFloat ;

              varAliq_COFINS := dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnAliq_COFINS].AsFloat ;

              varCodProduto := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnCodProduto].AsString);

              varNovaBase := varValorContabil - varValorICMS; // dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnNovaBase].AsFloat ;

              varNovoValorPIS := (varValorContabil - varValorICMS) * varAliq_PIS; // dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnNovoValorPIS].AsFloat ;

              varNovoValorCOFINS :=  (varValorContabil - varValorICMS) * varAliq_COFINS; // dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnNovoValorCOFINS].AsFloat ;


              sqlAuxiliar.Close;
              sqlAuxiliar.SQL.Clear;
              sqlAuxiliar.SQL.Add('INSERT INTO ARQ_NF ');
              sqlAuxiliar.SQL.Add('(PERIODO ');
              sqlAuxiliar.SQL.Add(',FILIAL');
              sqlAuxiliar.SQL.Add(',NF');
              sqlAuxiliar.SQL.Add(',DATANF ');
              sqlAuxiliar.SQL.Add(',CFOP ');
              //sqlAuxiliar.SQL.Add(',CST');
              sqlAuxiliar.SQL.Add(',COD_ITEM ');
              sqlAuxiliar.SQL.Add(',VALORCONTABIL ');
              sqlAuxiliar.SQL.Add(',VALOR_ICMS ');
              sqlAuxiliar.SQL.Add(',ALIQ_PIS ');
              sqlAuxiliar.SQL.Add(',ALIQ_COFINS ');
              sqlAuxiliar.SQL.Add(',NOVA_BASE ');
              sqlAuxiliar.SQL.Add(',NOVO_VALOR_PIS ');
              sqlAuxiliar.SQL.Add(',NOVO_VALOR_COFINS)');
              sqlAuxiliar.SQL.Add('VALUES (  ');
              sqlAuxiliar.SQL.Add(' :PERIODO ');
              sqlAuxiliar.SQL.Add(',:FILIAL ');
              sqlAuxiliar.SQL.Add(',:NF ');
              sqlAuxiliar.SQL.Add(',:DATANF ');
              sqlAuxiliar.SQL.Add(',:CFOP ');
           //   sqlAuxiliar.SQL.Add(',:CST ');
              sqlAuxiliar.SQL.Add(',:COD_ITEM ');
              sqlAuxiliar.SQL.Add(',:VALORCONTABIL ');
              sqlAuxiliar.SQL.Add(',:VALOR_ICMS ');
              sqlAuxiliar.SQL.Add(',:ALIQ_PIS  ');
              sqlAuxiliar.SQL.Add(',:ALIQ_COFINS ');
              sqlAuxiliar.SQL.Add(',:NOVA_BASE ');
              sqlAuxiliar.SQL.Add(',:NOVO_VALOR_PIS  ');
              sqlAuxiliar.SQL.Add(',:NOVO_VALOR_COFINS)');

              sqlAuxiliar.Params.ParamByName('PERIODO').AsString           :=  varPeriodo;
              sqlAuxiliar.Params.ParamByName('FILIAL').AsString            :=  varFilial;
              sqlAuxiliar.Params.ParamByName('NF').AsString                :=  varNF;
              sqlAuxiliar.Params.ParamByName('DATANF').AsDateTime          :=  varDataNF;
              sqlAuxiliar.Params.ParamByName('CFOP').AsString              :=  varCFOP;
            //  sqlAuxiliar.Params.ParamByName('CST').AsString               :=  varPeriodo;
              sqlAuxiliar.Params.ParamByName('COD_ITEM').AsString          :=  varCodProduto;
              sqlAuxiliar.Params.ParamByName('VALORCONTABIL').asFloat     :=  varValorContabil;
              sqlAuxiliar.Params.ParamByName('VALOR_ICMS').asFloat        :=  varValorICMS;
              sqlAuxiliar.Params.ParamByName('ALIQ_PIS').asFloat          :=  varAliq_PIS;
              sqlAuxiliar.Params.ParamByName('ALIQ_COFINS').asFloat       :=  varAliq_COFINS;
              sqlAuxiliar.Params.ParamByName('NOVA_BASE').asFloat         :=  varNovaBase;
              sqlAuxiliar.Params.ParamByName('NOVO_VALOR_PIS').asFloat    :=  varNovoValorPIS;
              sqlAuxiliar.Params.ParamByName('NOVO_VALOR_COFINS').asFloat :=  varNovoValorCOFINS;

              try
                 sqlAuxiliar.ExecSQL;

              except

                on E: Exception do
                begin
                  varPeriodo := '';
                  ShowMessage( 'Erro ao Salvar Registro: ' + E.Message );

                end;

              end;

            end;

        finally

          FDConnection.Close;

        end;

      end;


  finally

    FreeAndNil(dxSpreadSheet);
    FreeAndNil(Dados);
  end;

  Mensagem('');

{
  Writeln('Copiando arquivo para backup. ', 'C:\Brady\Files\SOP\Arquivos\'+FSearchRecord.Name );
  CopyFile( PWideChar('C:\Brady\Files\SOP\Arquivos\'+FSearchRecord.Name), PWideChar('C:\Brady\Files\SOP\Arquivos\Backup\'+FSearchRecord.Name), True );

  Writeln('Apagando arquivo. ', MyDocumentsPath+'\'+FSearchRecord.Name );
  DeleteFile( PWideChar('C:\Brady\Files\SOP\Arquivos\'+FSearchRecord.Name) );

  Writeln('Apagando arquivo local. ', MyDocumentsPath+'\'+FSearchRecord.Name );
  DeleteFile(PWideChar(MyDocumentsPath+'\'+FSearchRecord.Name));
 }

end;



end.


