program BradyDataImport;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  ActiveX,
  ComObj,
  Variants,
  Classes,
  DateUtils,
  Winapi.Windows,
  System.SysUtils,
  ACBrNFe,
  ACBrCTe,
  ACBrMail,
  Math,
  System.IOUtils,
  dxSpreadSheet,
  dxSpreadSheetTypes,
  dxHashUtils,
  dxSpreadSheetCore,
  FireDAC.Stan.Param,
  FireDAC.Comp.DataSet,
  IdIOHandler,
  IdIOHandlerSocket,
  IdIOHandlerStack,
  IdSSL,
  IdSSLOpenSSL,
  IdIMAP4,
  IdMessage,
  IdBaseComponent,
  IdComponent,
  IdTCPConnection,
  IdTCPClient,
  IdExplicitTLSClientServerBase,
  IdMessageClient,
  IdSMTPBase,
  IdSMTP,
  IdAttachment,
  SQLTimST,
  pcteConversaoCTe,
  pcteCTe,
  pcnConversao,
  XML.XMLIntf,
  Xml.XMLDoc,
  Soap.SOAPHTTPClient,
  Forms,
  uDados in 'uDados.pas' {Fr_Dados: TDataModule},
  uUtils in 'uUtils.pas',
  Magento_Prod in 'Magento_Prod.pas';

var
  FSearchRecord: TSearchRec;
  FFormatoBR: TFormatSettings;

  // Pastas utilizadas para Leitura de XML (NFE e CTE)
  PastaINBOX               : String;
  PastaLIDO                : String;
  PastaOthers              : String;
  PastaPDF                 : String;

  PastaSERVIDORTEMP        : String;

  PastaSERVIDORNFE_ENTRADA : String;
  PastaSERVIDORCTE_ENTRADA : String;
  PastaXML                 : String;
  PastaXML_LIDO            : String;
  PastaSERVIDORNFE_LIDO    : String;
  PastaSERVIDORCTE_LIDO    : String;
  PastaLOG                 : String;

  //Integra��o Seton x Magento
  varMagento : Mage_Api_Model_Server_V2_HandlerPortType;
  HTTPRIO1   : THTTPRIO;
  varArqLogSetonMagento : String;
  varSessionIDMagento  : System.string;

procedure doSaveLog(lPath,  Msg: String);
Var
 loLista : TStringList;
 varDataHora : String;
 varArquivo  : String;
begin
 varDataHora           := FormatDateTime('ddmmyyyy',Now);
 varArquivo            := '\log_' +  varDataHora  + '.log';
 varArqLogSetonMagento := lPath + varArquivo;
 try
   loLista := TStringList.Create;
   try
   if FileExists(lPath + varArquivo) Then
     loLista.LoadFromFile(lPath + varArquivo);

     loLista.Add(timetostr(now) + ':' + Msg);
   except
    on e: exception do
      loLista.add(timetostr(now) + ': Erro ' + E.Message);
   end;
 Finally
    loLista.SaveToFile(lPath + varArquivo);
    loLista.Free;
 end;

end;


procedure CalcularGM;
begin

  if TFile.Exists( '\\GHOS2024\Brady\Files\GM\exec.txt' ) then
  begin

    try TFile.Delete( '\\GHOS2024\Brady\Files\GM\finish.txt' ); except end;
    try TFile.Delete( '\\GHOS2024\Brady\Files\GM\log.txt' ); except end;
    try TFile.Delete( '\\GHOS2024\Brady\Files\GM\exec.txt' ); except end;

    try TFile.Create( '\\GHOS2024\Brady\Files\GM\log.txt' ).Free; except end;

    try TFile.AppendAllText( '\\GHOS2024\Brady\Files\GM\log.txt', FormatDateTime( 'yyyy/mm/dd hh:nn', now ) + ': Iniciando processo.', TEncoding.ASCII ); except end;

    WinExec('\\GHOS2024\Brady\Exec-GM.bat', 1);

  end;

end;

procedure ImportSAP_FIRSTDATE;
var
  varFIRSTDATE_001: TStringList;
  varInicial, varFinal: Integer;
//  varCMD: AnsiString;
  I: Integer;

begin

  Writeln('Inicio: ','Import SAP First Date');

  Writeln('Apagando arquivo local. ', MyDocumentsPath+'\'+FSearchRecord.Name );
  DeleteFile(PWideChar(MyDocumentsPath+'\'+FSearchRecord.Name));

  Writeln('Copiando arquivo local. ', MyDocumentsPath+'\'+FSearchRecord.Name );
  CopyFile( PWideChar('C:\Brady\Files\SOP\Arquivos\'+FSearchRecord.Name), PWideChar(MyDocumentsPath+'\'+FSearchRecord.Name), True );

  Writeln( 'Criando DataModule' );
  Fr_Dados := TFr_Dados.Create(nil);

  Writeln( 'Criando StringList' );
  varFIRSTDATE_001 := TStringList.Create;
  try

    with Fr_Dados do
    begin

      Writeln('Config FDConnection');
      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );

      Writeln( 'Open FDConnection' );
      FDConnection.Open;
      try

        Writeln( 'Abrindo arquivo ', MyDocumentsPath+'\'+FSearchRecord.Name );
        varFIRSTDATE_001.LoadFromFile( MyDocumentsPath+'\'+FSearchRecord.Name );

        Writeln( 'Removendo linhas' );
        for I := varFIRSTDATE_001.Count-1 downto 0 do
          if not (varFIRSTDATE_001[I].CountChar('|') = 4) then
            varFIRSTDATE_001.Delete(I);

        Writeln( 'Linha Inicial' );
//        varInicial := StrToIntDef(ParamStr(2).Replace('-',''),0);

//        if varInicial = 0 then
//        begin
//
//          I := 1;
//          while I <= varFIRSTDATE_001.Count-1 do
//          begin
//
//            varCMD := AnsiString( ParamStr(0)+ ' ' + '-sap_firstdate -' + IntToStr(I) );
//
//            Writeln( varCMD );
//            WinExec( PAnsiChar(varCMD), 1 );
//            Inc(I,300000);
//
//          end;
//
//        end
//        else
//        begin

//          if ( varInicial + 299999 ) > (varFIRSTDATE_001.Count-1) then
//            varFinal := varFIRSTDATE_001.Count-1
//          else
//            varFinal := varInicial + 299999;

          varInicial := 1;
          varFinal := varFIRSTDATE_001.Count-1;

          Writeln( 'Abrindo Query' );
          FDQueryTSOP_OrderResquestDate.Open;
          try

            Writeln( 'Looping linhas' );
            for I := varInicial to varFinal do
            begin

              Writeln( 'FirstDate (',I,'/',varFinal,'): ', varFIRSTDATE_001[I].Split(['|'])[1].Trim );

              FDQueryTSOP_OrderResquestDate.Append;

              FDQueryTSOP_OrderResquestDate.FieldByName('TSOP_ORICOD').AsInteger := 1;
              FDQueryTSOP_OrderResquestDate.FieldByName('TSOP_ORDREQNRODOC').AsString := varFIRSTDATE_001[I].Split(['|'])[1].Trim;
              FDQueryTSOP_OrderResquestDate.FieldByName('TSOP_ORDREQSEQITE').AsInteger := StrToIntDef(varFIRSTDATE_001[I].Split(['|'])[2].Trim,10);
              FDQueryTSOP_OrderResquestDate.FieldByName('TSOP_ORDREQDATREQ').AsDateTime := EncodeDate( StrToInt(varFIRSTDATE_001[I].Split(['|'])[3].Trim.Split(['/'])[2]), StrToInt(varFIRSTDATE_001[I].Split(['|'])[3].Trim.Split(['/'])[0]), StrToInt(varFIRSTDATE_001[I].Split(['|'])[3].Trim.Split(['/'])[1]) );

              FDQueryTSOP_OrderResquestDate.FieldByName('TSOP_USUCODCAD').AsInteger := 1;
              FDQueryTSOP_OrderResquestDate.FieldByName('TSOP_ORDREQDATCAD').AsDateTime := Now;
              FDQueryTSOP_OrderResquestDate.FieldByName('TSOP_USUCODALT').AsInteger := 1;
              FDQueryTSOP_OrderResquestDate.FieldByName('TSOP_ORDREQDATALT').AsDateTime := Now;

              try

                FDQueryTSOP_OrderResquestDate.Post;

              except

                on E: Exception do
                begin

                  Writeln( 'Post: ', E.Message );
                  FDQueryTSOP_OrderResquestDate.Cancel;

                end;

              end;

              if Frac(I / 1000) = 0 then
              begin

                try

                  Writeln( 'ApplyUpdates' );
                  FDQueryTSOP_OrderResquestDate.ApplyUpdates;

                  Writeln( 'CommitUpdates' );
                  FDQueryTSOP_OrderResquestDate.CommitUpdates;

                except

                  on E: Exception do
                  begin

                    Writeln( 'CommitUpdates: ', E.Message );

                  end;

                end;

              end;

            end;

          finally

            try

              Writeln( 'ApplyUpdates' );
              FDQueryTSOP_OrderResquestDate.ApplyUpdates;

              Writeln( 'CommitUpdates' );
              FDQueryTSOP_OrderResquestDate.CommitUpdates;

            except

              on E: Exception do
              begin

                Writeln( 'CommitUpdates: ', E.Message );

              end;

            end;

            FDQueryTSOP_OrderResquestDate.Close;

          end;

//        end;

        Writeln( 'Apagando TSOP_OrderRequestDate' );
        FDScriptTSOP_OrderRequestDate.ExecuteAll;

      finally

        FDConnection.Close;

      end;

    end;

  finally

    FreeAndNil(varFIRSTDATE_001);
    FreeAndNil(Fr_Dados);

  end;

end;

procedure ImportarCustos(opcao: integer);
var
  X, I: Integer;
  varArquivo: TStringList;
  varMes, varAno: Integer;
  varData: TDateTime;
  varPlanta, varItem: String;
  varCustoStandard, varCustoMoving, varPriceUnit, varLote: Extended;
  varInicial, varFinal: Integer;
  varCMD: AnsiString;

begin

  Writeln( 'Criando DataModule' );
  Fr_Dados := TFr_Dados.Create(nil);

  with Fr_Dados do
  begin

    Writeln( 'Iniciando processo de importa��o...' );
    try

      varArquivo := TStringList.Create;
      try

        Writeln( 'Carregando arquivo...' );

        if opcao = 1 then
          varArquivo.LoadFromFile( 'C:\Brady\Files\ENG\BR-GM-001.TXT' )
        else
          varArquivo.LoadFromFile( 'C:\Brady\Files\ENG\BR-GM-002.TXT' );

        varArquivo.Insert(0,EmptyStr);

        Writeln('Config FDConnection');
        FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );

        Writeln( 'Linha Inicial' );
        varInicial := StrToIntDef(ParamStr(2).Replace('-',''),0);

        if varInicial = 0 then
        begin

          Writeln( 'Apagando TSOP_GMCustos' );
          FDScriptTSOP_GMCustos.ExecuteAll;

          I := 1;
          while I <= varArquivo.Count-1 do
          begin

            if opcao = 1 then
              varCMD := AnsiString( ParamStr(0)+ ' ' + '-gm_custos -' + IntToStr(I) )
            else
              varCMD := AnsiString( ParamStr(0)+ ' ' + '-gm_custos2 -' + IntToStr(I) );

            Writeln( varCMD );
            WinExec( PAnsiChar(varCMD), 1 );
            Inc(I,10000);

          end;

        end
        else
        begin

          if ( varInicial + 9999 ) > (varArquivo.Count-1) then
            varFinal := varArquivo.Count-1
          else
            varFinal := varInicial + 9999;

          Writeln( 'Abrindo Conex�o...' );
          FDConnection.Open;
          try

            FDQueryTSOP_GMCustos.Open;
            try

              Writeln( 'Lendo linhas da planilha...' );
              for X := varInicial to varFinal do
              begin

                try
                  if not (varArquivo[X].CountChar('|') = 11) then
                    Continue;

                  if Frac(X / 1000) = 0 then
                    Writeln( 'Linha (" ' + IntToStr(X) + '/' + IntToStr(varArquivo.Count-1) + '") "' + Trim(varArquivo[X].Split(['|'])[1]) + '" ...' );

                  varAno := StrToInt(varArquivo[X].Split(['|'])[5].Trim);
                  varMes := StrToInt(varArquivo[X].Split(['|'])[6].Trim);

                  if varMes <= 5 then
                    varAno := varAno -1;

                  if varMes <= 5 then
                    varMes := varMes +7
                  else
                    varMes := varMes -5;

                  varData := EncodeDate( varAno, varMes, 01 );
                  varPlanta := varArquivo[X].Split(['|'])[2].Trim;
                  varItem := varArquivo[X].Split(['|'])[1].Trim;
                  varCustoStandard := StrToFloat(varArquivo[X].Split(['|'])[07].Trim.Replace( ',', '', [rfReplaceAll] ).Replace( '.', FormatSettings.DecimalSeparator, [rfReplaceAll] ));
                  varCustoMoving := StrToFloat(varArquivo[X].Split(['|'])[09].Trim.Replace( ',', '', [rfReplaceAll] ).Replace( '.', FormatSettings.DecimalSeparator, [rfReplaceAll] ));
                  varLote := StrToFloat(varArquivo[X].Split(['|'])[03].Trim.Replace( ',', '', [rfReplaceAll] ).Replace( '.', FormatSettings.DecimalSeparator, [rfReplaceAll] ));
                  varPriceUnit := StrToFloat(varArquivo[X].Split(['|'])[11].Trim.Replace( ',', '', [rfReplaceAll] ).Replace( '.', FormatSettings.DecimalSeparator, [rfReplaceAll] ));

//                  if FDQueryTSOP_GMCustos.Locate( 'TSOP_GMCDAT;TSOP_GMCSIT;TSOP_GMCITE;TSOP_GMCBUD', VarArrayOf( [varData,varPlanta,varItem,'E'] ) ) then
//                  begin
//
//                    FDQueryTSOP_GMCustos.Edit;
//                    FDQueryTSOP_GMCustosTSOP_GMCCUSSTD.AsFloat := varCustoStandard;
//                    FDQueryTSOP_GMCustosTSOP_GMCCUSMOV.AsFloat := varCustoMoving;
//                    FDQueryTSOP_GMCustosTSOP_GMCLOT.AsFloat := varLote;
//                    FDQueryTSOP_GMCustosTSOP_GMCPRIUNI.AsFloat := varPriceUnit;
//                    FDQueryTSOP_GMCustos.Post;
//
//                  end
//                  else
//                  begin

                  FDQueryTSOP_GMCustos.Append;

                  FDQueryTSOP_GMCustosTSOP_GMCSIT.AsString := varPlanta;
                  FDQueryTSOP_GMCustosTSOP_GMCITE.AsString := varItem;
                  FDQueryTSOP_GMCustosTSOP_GMCDAT.AsDateTime := varData;
                  FDQueryTSOP_GMCustosTSOP_GMCBUD.AsString := 'E';

                  FDQueryTSOP_GMCustosTSOP_GMCCUSSTD.AsFloat := varCustoStandard;
                  FDQueryTSOP_GMCustosTSOP_GMCCUSMOV.AsFloat := varCustoMoving;
                  FDQueryTSOP_GMCustosTSOP_GMCLOT.AsFloat := varLote;
                  FDQueryTSOP_GMCustosTSOP_GMCPRIUNI.AsFloat := varPriceUnit;

                  try

                    FDQueryTSOP_GMCustos.Post;

                  except

                    on E: Exception do
                    begin

                      Writeln( 'Post: ', E.Message );
                      FDQueryTSOP_GMCustos.Cancel;

                    end;

                  end;


                  if Frac(I / 100) = 0 then
                  begin

                    try

                      Writeln( 'ApplyUpdates' );
                      FDQueryTSOP_GMCustos.ApplyUpdates;

                      Writeln( 'CommitUpdates' );
                      FDQueryTSOP_GMCustos.CommitUpdates;

                    except

                      on E: Exception do
                      begin

                        Writeln( 'CommitUpdates: ', E.Message );

                      end;

                    end;

                  end;

//                  end;

                except

                  on E: Exception do
                  begin

                    Writeln( 'Erro: ' + IntToStr( X ) + E.Message );

                  end;

                end;

              end;

            finally

              try

                Writeln( 'ApplyUpdates' );
                FDQueryTSOP_GMCustos.ApplyUpdates;

                Writeln( 'CommitUpdates' );
                FDQueryTSOP_GMCustos.CommitUpdates;

              except

                on E: Exception do
                begin

                  Writeln( 'CommitUpdates'#13#10 + E.Message );

                end;

              end;

              FDQueryTSOP_GMCustos.Close;

            end;

          finally

            FDConnection.Close;

          end;

        end;

      finally

        FreeAndNil(varArquivo);
        FreeAndNil(Fr_Dados);

      end;

    finally

      Writeln( EmptyStr );

    end;

  end;

end;

procedure ImportarUOM;
var
  X, I: Integer;
  varArquivo: TStringList;
  varPlanta, varItem, varUOM: String;
  varDenominador, varNumerador: Extended;
  varInicial, varFinal: Integer;
  varCMD: AnsiString;

begin

  Writeln( 'Criando DataModule' );
  Fr_Dados := TFr_Dados.Create(nil);

  with Fr_Dados do
  begin

    Writeln( 'Iniciando processo de importa��o...' );
    try

      varArquivo := TStringList.Create;
      try

        Writeln( 'Carregando arquivo...' );
        varArquivo.LoadFromFile( 'C:\Brady\Files\ENG\BR-UOM-001.TXT' );
        varArquivo.Insert(0,EmptyStr);

        Writeln('Config FDConnection');
        FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );

        Writeln( 'Linha Inicial' );
        varInicial := StrToIntDef(ParamStr(2).Replace('-',''),0);

        if varInicial = 0 then
        begin

          I := 1;
          while I <= varArquivo.Count-1 do
          begin

            varCMD := AnsiString( ParamStr(0)+ ' ' + '-uom -' + IntToStr(I) );

            Writeln( varCMD );
            WinExec( PAnsiChar(varCMD), 1 );
            Inc(I,10000);

          end;

        end
        else
        begin

          if ( varInicial + 9999 ) > (varArquivo.Count-1) then
            varFinal := varArquivo.Count-1
          else
            varFinal := varInicial + 9999;

          Writeln( 'Abrindo Conex�o...' );
          FDConnection.Open;
          try

            FDQueryTSOP_UOM.Open;
            try

              Writeln( 'Lendo linhas da planilha...' );
              for X := varInicial to varFinal do
              begin

                if not (varArquivo[X].CountChar('|') = 5) then
                  Continue;

                if Frac(X / 100) = 0 then
                  Writeln( 'Linha (" ' + IntToStr(X) + '/' + IntToStr(varArquivo.Count-1) + '") "' + Trim(varArquivo[X].Split(['|'])[1]) + '" ...' );

                varPlanta := varArquivo[X].Split(['|'])[2].Trim;
                varItem := varArquivo[X].Split(['|'])[1].Trim;
                varUOM := varArquivo[X].Split(['|'])[3].Trim;

                varNumerador := StrToFloat(varArquivo[X].Split(['|'])[04].Trim.Replace( ',', '', [rfReplaceAll] ).Replace( '.', FormatSettings.DecimalSeparator, [rfReplaceAll] ));
                varDenominador := StrToFloat(varArquivo[X].Split(['|'])[05].Trim.Replace( ',', '', [rfReplaceAll] ).Replace( '.', FormatSettings.DecimalSeparator, [rfReplaceAll] ));

                if FDQueryTSOP_UOM.Locate( 'TSOP_UOMITE;TSOP_UOMSIT;TSOP_UOMSIG', VarArrayOf( [varItem,varPlanta,varUOM] ) ) then
                begin

                  FDQueryTSOP_UOM.Edit;
                  FDQueryTSOP_UOMTSOP_UOMNUM.AsFloat := varNumerador;
                  FDQueryTSOP_UOMTSOP_UOMDEM.AsFloat := varDenominador;
                  FDQueryTSOP_UOM.Post;

                end
                else
                begin

                  FDQueryTSOP_UOM.Append;

                  FDQueryTSOP_UOMTSOP_UOMSIT.AsString := varPlanta;
                  FDQueryTSOP_UOMTSOP_UOMITE.AsString := varItem;
                  FDQueryTSOP_UOMTSOP_UOMSIG.AsString := varUOM;

                  FDQueryTSOP_UOMTSOP_UOMNUM.AsFloat := varNumerador;
                  FDQueryTSOP_UOMTSOP_UOMDEM.AsFloat := varDenominador;

                  FDQueryTSOP_UOM.Post;

                end;

              end;

            finally

              try

                Writeln( 'ApplyUpdates' );
                FDQueryTSOP_UOM.ApplyUpdates;

                Writeln( 'CommitUpdates' );
                FDQueryTSOP_UOM.CommitUpdates;

              except

                on E: Exception do
                begin

                  Writeln( 'CommitUpdates'#13#10 + E.Message );

                end;

              end;

              FDQueryTSOP_UOM.Close;

            end;

          finally

            FDConnection.Close;

          end;

        end;

      finally

        FreeAndNil(varArquivo);

      end;

    finally

      Writeln( EmptyStr );

    end;

  end;

end;

procedure UploadTXTDelivery;
var
  varSIOP_DELIVERY: TStringList;
  varInicial, varFinal: Integer;
  varCMD: AnsiString;
  I: Integer;

begin

  Writeln( 'Criando DataModule' );
  Fr_Dados := TFr_Dados.Create(nil);

  Writeln( 'Criando StringList' );
  varSIOP_DELIVERY := TStringList.Create;
  try

    with Fr_Dados do
    begin

      Writeln('Config FDConnection');
      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );

      Writeln( 'Open FDConnection' );
      FDConnection.Open;
      try

        Writeln( 'Abrindo arquivo C:\Brady\Files\SOP\Arquivos\BR-SIOP-DELIVERY.TXT' );
        varSIOP_DELIVERY.LoadFromFile( 'C:\Brady\Files\SOP\Arquivos\BR-SIOP-DELIVERY.TXT' );
        varSIOP_DELIVERY.Insert(0,StringOfChar('|',10));

        Writeln( 'Removendo linhas' );
        for I := varSIOP_DELIVERY.Count-1 downto 0 do
          if not (varSIOP_DELIVERY[I].CountChar('|') = 10) then
            varSIOP_DELIVERY.Delete(I);

        Writeln( 'Linha Inicial' );
        varInicial := StrToIntDef(ParamStr(2).Replace('-',''),0);

        if varInicial = 0 then
        begin

          I := 1;
          while I <= varSIOP_DELIVERY.Count-1 do
          begin

            varCMD := AnsiString( ParamStr(0)+ ' ' + '-sop_delivery -' + IntToStr(I) );

            Writeln( varCMD );
            WinExec( PAnsiChar(varCMD), 1 );
            Inc(I,300);

          end;

        end
        else
        begin

          if ( varInicial + 299 ) > (varSIOP_DELIVERY.Count-1) then
            varFinal := varSIOP_DELIVERY.Count-1
          else
            varFinal := varInicial + 299;


          Writeln( 'Abrindo Query' );
          FDQueryTSOP_OrderBilling.Open;
          try

            Writeln( 'Looping linhas' );
            for I := varInicial to varFinal do
            begin

              Writeln( 'Delivery (',I,'/',varFinal,'): ', varSIOP_DELIVERY[I].Split(['|'])[04].Trim );

              if StrToFloatDef(varSIOP_DELIVERY[I].Split(['|'])[8].Trim.Replace( '.', '', [rfReplaceAll] ).Replace( ',', FormatSettings.DecimalSeparator, [rfReplaceAll] ),0.00) = 0.00 then
                Continue;

              if StrToFloatDef(varSIOP_DELIVERY[I].Split(['|'])[10].Trim.Replace( '.', '', [rfReplaceAll] ).Replace( ',', FormatSettings.DecimalSeparator, [rfReplaceAll] ),0.00) = 0.00 then
                Continue;

              FDQueryTSOP_OrderBilling.Append;
              FDQueryTSOP_OrderBillingTSOP_ORDBILSITNOM.AsString      := varSIOP_DELIVERY[I].Split(['|'])[03].Trim;
              FDQueryTSOP_OrderBillingTSOP_ORDBILCANNOM.AsString      := varSIOP_DELIVERY[I].Split(['|'])[01].Trim;
              FDQueryTSOP_OrderBillingTSOP_ORDBILDATDOC.AsDateTime    := EncodeDate( StrToInt(varSIOP_DELIVERY[I].Split(['|'])[9].Trim.Substring(0,4)), StrToInt(varSIOP_DELIVERY[I].Split(['|'])[9].Trim.Substring(4,2)), StrToInt(varSIOP_DELIVERY[I].Split(['|'])[9].Trim.Substring(6,2)) );
              FDQueryTSOP_OrderBillingTSOP_ORDBILNRODOC.AsString      := IntToStr(StrToInt(varSIOP_DELIVERY[I].Split(['|'])[04].Trim));
              FDQueryTSOP_OrderBillingTSOP_ORDBILTIPDOC.AsString      := 'Order';
              FDQueryTSOP_OrderBillingTSOP_ORDBILNRODOCREF.AsString   := EmptyStr;
              FDQueryTSOP_OrderBillingTSOP_ORDBILITESEQ.AsInteger     := StrToIntDef(varSIOP_DELIVERY[I].Split(['|'])[05].Trim,0);
              FDQueryTSOP_OrderBillingTSOP_ORDBILDATDOCREQ.AsDateTime := EncodeDate( StrToInt(varSIOP_DELIVERY[I].Split(['|'])[9].Trim.Substring(0,4)), StrToInt(varSIOP_DELIVERY[I].Split(['|'])[9].Trim.Substring(4,2)), StrToInt(varSIOP_DELIVERY[I].Split(['|'])[9].Trim.Substring(6,2)) );
              FDQueryTSOP_OrderBillingTSOP_ORDBILCLICOD.AsString      := IntToStr(StrToInt(varSIOP_DELIVERY[I].Split(['|'])[02].Trim));
              FDQueryTSOP_OrderBillingTSOP_ORDBILCLINOM.AsString      := EmptyStr;
              FDQueryTSOP_OrderBillingTSOP_ORDBILGRUCLINOM.AsString   := EmptyStr;
              FDQueryTSOP_OrderBillingTSOP_ORDBILREPNOM.AsString      := EmptyStr;
              FDQueryTSOP_OrderBillingTSOP_ORDBILITECOD.AsString      := varSIOP_DELIVERY[I].Split(['|'])[06].Trim;
              FDQueryTSOP_OrderBillingTSOP_ORDBILITENOM.AsString      := EmptyStr;
              FDQueryTSOP_OrderBillingTSOP_ORDBILITEUNI.AsString      := varSIOP_DELIVERY[I].Split(['|'])[07].Trim;
              FDQueryTSOP_OrderBillingTSOP_ORDBILITEFAM001.AsString   := EmptyStr;
              FDQueryTSOP_OrderBillingTSOP_ORDBILITEFAM002.AsString   := EmptyStr;
              FDQueryTSOP_OrderBillingTSOP_ORDBILITEFAM003.AsString   := EmptyStr;
              FDQueryTSOP_OrderBillingTSOP_ORDBILITEFAM004.AsString   := EmptyStr;
              FDQueryTSOP_OrderBillingTSOP_ORDBILITEFAM005.AsString   := EmptyStr;
              FDQueryTSOP_OrderBillingTSOP_ORDBILVALLIQ.AsFloat       := StrToFloatDef(varSIOP_DELIVERY[I].Split(['|'])[10].Trim.Replace( '.', '', [rfReplaceAll] ).Replace( ',', FormatSettings.DecimalSeparator, [rfReplaceAll] ),0.00) * StrToFloatDef(varSIOP_DELIVERY[I].Split(['|'])[08].Trim.Replace( '.', '', [rfReplaceAll] ).Replace( ',', FormatSettings.DecimalSeparator, [rfReplaceAll] ),0.00);
              FDQueryTSOP_OrderBillingTSOP_ORDBILQTD.AsFloat          := StrToFloatDef(varSIOP_DELIVERY[I].Split(['|'])[08].Trim.Replace( '.', '', [rfReplaceAll] ).Replace( ',', FormatSettings.DecimalSeparator, [rfReplaceAll] ),0.00);

              try

                FDQueryTSOP_OrderBilling.Post;

              except

                on E: Exception do
                begin

                  Writeln( 'Post: ', E.Message );
                  FDQueryTSOP_OrderBilling.Cancel;

                end;

              end;

              if Frac(I / 100) = 0 then
              begin

                try

                  Writeln( 'ApplyUpdates' );
                  FDQueryTSOP_OrderBilling.ApplyUpdates;

                  Writeln( 'CommitUpdates' );
                  FDQueryTSOP_OrderBilling.CommitUpdates;

                except

                  on E: Exception do
                  begin

                    Writeln( 'CommitUpdates: ', E.Message );

                  end;

                end;

              end;

            end;

          finally

            try

              Writeln( 'ApplyUpdates' );
              FDQueryTSOP_OrderBilling.ApplyUpdates;

              Writeln( 'CommitUpdates' );
              FDQueryTSOP_OrderBilling.CommitUpdates;

            except

              on E: Exception do
              begin

                Writeln( 'CommitUpdates: ', E.Message );

              end;

            end;

            FDQueryTSOP_OrderBilling.Close;

          end;

        end;

      finally

        FDConnection.Close;

      end;

    end;

  finally

    FreeAndNil(varSIOP_DELIVERY);
    FreeAndNil(Fr_Dados);

  end;

end;

procedure ImportSAP_BACKLOG;
var
  I: Integer;

  dxSpreadSheet: TdxSpreadSheet;
  varStringList: TStringList;

  varDate: Integer;

  varColumnPlant: Integer;
  varColumnSOrg: Integer;
  varColumnCalendarDay: Integer;
  varColumnOrderNumber: Integer;
  varColumnOrderLineNumber: Integer;
  varColumnCustomerPODate: Integer;
  varColumnSoldtoPartySP: Integer;
  varColumnSoldtoName: Integer;
  varColumnSalesRep: Integer;
  varColumnYNumber: Integer;
  varColumnDescription: Integer;
  varColumnUoM: Integer;
  varColumnBilledQty: Integer;
  varColumnNetValue: Integer;
  varColumnHeaderDel : Integer;

  varPlant: String;
  varSalesOrg: String;
  varCalendarDay: TDateTime;
  varOrderNumber: String;
  varOrderLineNumber: Integer;
  varCustomerPODate: TDateTime;
  varSoldtoPartySP: String;
  varSoldtoName: String;
  varSalesRep: String;
  varYNumber: String;
  varDescription: String;
  varUoM: String;
  varBilledQty: Extended;
  varNetValue: Extended;
  varHeaderDel : String;

  varScript: TStringList;
  varUltimaColuna : Integer;

  procedure WritelnMail( varStr: String );
  var
    varACBrNFe: TACBrNFe;
    varACBrMail: TACBrMail;
    varMensagem: TStringList;
    varCC: TStringList;

  begin

    Writeln( varStr );

    varCC := TStringList.Create;
    varMensagem := TStringList.Create;
    varACBrNFe := TACBrNFe.Create(nil);
    varACBrMail := TACBrMail.Create(nil);
    varACBrNFe.MAIL := varACBrMail;
    try

      varMensagem.Add(MyDocumentsPath+'\'+FSearchRecord.Name);
      varMensagem.Add( varStr );

      varACBrMail.Clear;
      varACBrMail.Host := 'smtp.gmail.com';
      varACBrMail.Port := '465';
      varACBrMail.SetSSL := True;
      varACBrMail.SetTLS := False;

      varACBrMail.Username := 'suportebrasil@bradycorp.com';
      varACBrMail.Password := 'spUhurebRuF5';

      varACBrMail.From := 'suportebrasil@bradycorp.com';
      varACBrMail.FromName := 'SUPORTE BRASIL';

      varACBrMail.AddAddress('LEANDRO_LOPES@BRADYCORP.COM', 'LEANDRO LOPES');
      varACBrMail.AddAddress('LUCIANA_PONTIERI@BRADYCORP.COM', 'LUCIANA PONTIERI');

      varACBrMail.Subject := 'S&OP XLS BACKLOG ERRO ' + FormatDateTime( 'dd/mm/yyyy', Now );
      varACBrMail.IsHTML := True;
      varACBrMail.AltBody.Text := varMensagem.Text;

      try

        varACBrMail.Send;

      except

        on E: Exception do
        begin

          Writeln( E.Message );

        end;

      end;

    finally

      FreeAndNil(varACBrNFe);
      FreeAndNil(varACBrMail);
      FreeAndNil(varMensagem);
      FreeAndNil(varCC);

    end;

  end;

begin

  Writeln('Inicio: ','Import SAP Backlog');

  Writeln('Apagando arquivo local. ', MyDocumentsPath+'\'+FSearchRecord.Name );
  DeleteFile(PWideChar(MyDocumentsPath+'\'+FSearchRecord.Name));

  Writeln('Copiando arquivo local. ', MyDocumentsPath+'\'+FSearchRecord.Name );
  CopyFile( PWideChar('C:\Brady\Files\SOP\Arquivos\'+FSearchRecord.Name), PWideChar(MyDocumentsPath+'\'+FSearchRecord.Name), True );

  dxSpreadSheet := TdxSpreadSheet.Create(nil);
  try

    Writeln('Lendo Planilha ', MyDocumentsPath+'\'+FSearchRecord.Name);
    dxSpreadSheet.LoadFromFile( MyDocumentsPath+'\'+FSearchRecord.Name );

    varColumnPlant := -1;
    varColumnSOrg := -1;
    varColumnCalendarDay := -1;
    varColumnOrderNumber := -1;
    varColumnOrderLineNumber := -1;
    varColumnCustomerPODate := -1;
    varColumnSoldtoPartySP := -1;
    varColumnSoldtoName := -1;
    varColumnSalesRep := -1;
    varColumnYNumber := -1;
    varColumnDescription := -1;
    varColumnUoM := -1;
    varColumnBilledQty := -1;
    varColumnNetValue := -1;
    varColumnHeaderDel := -1;

    varUltimaColuna := dxSpreadSheet.ActiveSheetAsTable.Columns.LastIndex;
    Writeln('Descobrindo Colunas');
    for I := dxSpreadSheet.ActiveSheetAsTable.Columns.FirstIndex to varUltimaColuna do
    begin

      if not  Assigned(dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0]) then
         Continue;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Plant' then
        varColumnPlant := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'SOrg.' then
        varColumnSOrg := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Sales Organization' then
        varColumnSOrg := I;


      if UpperCase(dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString) = 'CREATED ON' then
        varColumnCalendarDay := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Sales doc.' then
        varColumnOrderNumber := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Item' then
        varColumnOrderLineNumber := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'First Date' then
        varColumnCustomerPODate := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Sold-to #' then
        varColumnSoldtoPartySP := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Sold-to Name' then
        varColumnSoldtoName := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Sales Rep Name' then
        varColumnSalesRep := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Material' then
        varColumnYNumber := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Description' then
        varColumnDescription := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'SU' then
        varColumnUoM := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Sales Unit' then
        varColumnUoM := I;


      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Open Quant' then
        varColumnBilledQty := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Open Quantity' then
        varColumnBilledQty := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Open Value' then
        varColumnNetValue := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Header Del' then
        varColumnHeaderDel := I;


    end;

    if varColumnPlant = -1 then
      WritelnMail( 'Coluna (Plant) n�o foi encontrada' );
    if varColumnSOrg = -1 then
      WritelnMail( 'Coluna (SOrg. / Sales Organization) n�o foi encontrada' );
    if varColumnCalendarDay = -1 then
      WritelnMail( 'Coluna (Created on) n�o foi encontrada' );
    if varColumnOrderNumber = -1 then
      WritelnMail( 'Coluna (Sales doc.) n�o foi encontrada' );
    if varColumnOrderLineNumber = -1 then
      WritelnMail( 'Coluna (Item) n�o foi encontrada' );
    if varColumnCustomerPODate = -1 then
      WritelnMail( 'Coluna (First Date) n�o foi encontrada' );
    if varColumnSoldtoPartySP = -1 then
      WritelnMail( 'Coluna (Sold-to #) n�o foi encontrada' );
    if varColumnSoldtoName = -1 then
      WritelnMail( 'Coluna (Sold-to Name) n�o foi encontrada' );
    if varColumnSalesRep = -1 then
      WritelnMail( 'Coluna (Sales Rep Name) n�o foi encontrada' );
    if varColumnYNumber = -1 then
      WritelnMail( 'Coluna (Material) n�o foi encontrada' );
    if varColumnDescription = -1 then
      WritelnMail( 'Coluna (Description) n�o foi encontrada' );
    if varColumnUoM = -1 then
      WritelnMail( 'Coluna (SU / Sales Unit) n�o foi encontrada' );
    if varColumnBilledQty = -1 then
      WritelnMail( 'Coluna (Open Quant /  Open Quantity) n�o foi encontrada' );
    if varColumnNetValue = -1 then
      WritelnMail( 'Coluna (Open Value) n�o foi encontrada' );
    if varColumnHeaderDel = -1 then
      WritelnMail( 'Coluna (Header Del) n�o foi encontrada' );


    Writeln( 'Criando DataModule' );
    Fr_Dados := TFr_Dados.Create(nil);
    try

      with Fr_Dados do
      begin

        Writeln('Config FDConnection');
        FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );

        Writeln('Open FDConnection');
        FDConnection.Open;
        try

          Writeln( 'Abrindo Query' );
          FDQueryTSOP_OrderBilling.Open;
          try

            Writeln('Looping pelas linhas');
            for I := dxSpreadSheet.ActiveSheetAsTable.Rows.FirstIndex+1 to dxSpreadSheet.ActiveSheetAsTable.Rows.LastIndex do
            begin

              Writeln( 'Order/Billing (',I-1,'/',dxSpreadSheet.ActiveSheetAsTable.Rows.LastIndex-1,')' );

              varPlant := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnPlant].AsString);

              varSalesOrg := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnSOrg].AsString);

              if dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnCalendarDay].DataType = cdtDateTime then
                varCalendarDay := dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnCalendarDay].AsDateTime
              else
              if TryStrToInt( dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnCalendarDay].AsString, varDate ) then
                varCalendarDay := varDate
              else
                varCalendarDay := StrToDate(String(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnCalendarDay].AsString).Replace( '.', '/' ));

              varOrderNumber := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnOrderNumber].AsString);

              varOrderLineNumber := StrToIntDef(Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnOrderLineNumber].AsString),0);

              if dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnCustomerPODate].DataType = cdtDateTime then
                varCustomerPODate := dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnCustomerPODate].AsDateTime
              else
              if TryStrToInt( dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnCustomerPODate].AsString, varDate ) then
                varCustomerPODate := varDate
              else
              if String(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnCustomerPODate].AsString).Equals('#') then
                varCustomerPODate := varCalendarDay
              else
                varCustomerPODate := StrToDate(String(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnCustomerPODate].AsString).Replace( '.', '/' ));

              varSoldtoPartySP := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnSoldtoPartySP].AsString);

              varSoldtoName := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnSoldtoName].AsString);

              varSalesRep := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnSalesRep].AsString);
              if varSalesRep.Equals('9999999999') then
                varSalesRep := EmptyStr;

              varYNumber := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnYNumber].AsString);

              varDescription := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnDescription].AsString);

              varUoM := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnUoM].AsString);

              varHeaderDel := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnHeaderDel].AsString);

              varBilledQty := dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnBilledQty].AsFloat ;

              if varBilledQty = 0.00 then
                Continue;

              varNetValue := dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnNetValue].AsFloat;

              if varNetValue = 0.00 then
                Continue;

              FDQueryTSOP_OrderBilling.Append;
              FDQueryTSOP_OrderBillingTSOP_ORDBILSITNOM.AsString      := varPlant;
              FDQueryTSOP_OrderBillingTSOP_ORDBILCANNOM.AsString      := varSalesOrg;
              FDQueryTSOP_OrderBillingTSOP_ORDBILDATDOC.AsDateTime    := varCalendarDay;
              FDQueryTSOP_OrderBillingTSOP_ORDBILNRODOC.AsString      := varOrderNumber;
              FDQueryTSOP_OrderBillingTSOP_ORDBILTIPDOC.AsString      := 'Order';
              FDQueryTSOP_OrderBillingTSOP_ORDBILNRODOCREF.AsString   := EmptyStr;
              FDQueryTSOP_OrderBillingTSOP_ORDBILITESEQ.AsInteger     := varOrderLineNumber;
              FDQueryTSOP_OrderBillingTSOP_ORDBILDATDOCREQ.AsDateTime := varCustomerPODate;
              FDQueryTSOP_OrderBillingTSOP_ORDBILCLICOD.AsString      := varSoldtoPartySP;
              FDQueryTSOP_OrderBillingTSOP_ORDBILCLINOM.AsString      := varSoldtoName;
              FDQueryTSOP_OrderBillingTSOP_ORDBILGRUCLINOM.AsString   := EmptyStr;
              FDQueryTSOP_OrderBillingTSOP_ORDBILREPNOM.AsString      := varSalesRep;
              FDQueryTSOP_OrderBillingTSOP_ORDBILITECOD.AsString      := varYNumber;
              FDQueryTSOP_OrderBillingTSOP_ORDBILITENOM.AsString      := varDescription;
              FDQueryTSOP_OrderBillingTSOP_ORDBILITEUNI.AsString      := varUoM;
              FDQueryTSOP_OrderBillingTSOP_ORDBILITEFAM001.AsString   := EmptyStr;
              FDQueryTSOP_OrderBillingTSOP_ORDBILITEFAM002.AsString   := EmptyStr;
              FDQueryTSOP_OrderBillingTSOP_ORDBILITEFAM003.AsString   := EmptyStr;
              FDQueryTSOP_OrderBillingTSOP_ORDBILITEFAM004.AsString   := EmptyStr;
              FDQueryTSOP_OrderBillingTSOP_ORDBILITEFAM005.AsString   := EmptyStr;
              FDQueryTSOP_OrderBillingTSOP_ORDBILVALLIQ.AsFloat       := varNetValue;
              FDQueryTSOP_OrderBillingTSOP_ORDBILQTD.AsFloat          := varBilledQty;
              FDQueryTSOP_OrderBillingTSOP_ORDBILBLOCK.AsString       := varHeaderDel;
              FDQueryTSOP_OrderBilling.Post;

            end;

          finally

            try

              if varPlant = '1063' then
              begin

                Writeln( 'Apagando TSOP_OrderBilling' );
                varScript := TStringList.Create;
                try
                  varScript.Add('DELETE FROM TSOP_OrderBilling WHERE TSOP_ORDBILTIPDOC = ''Order'' AND TSOP_ORICOD = 1 AND TSOP_ORDBILSITNOM = ''1063''');
                  FDScriptTSOP_OrderBilling.ExecuteScript(varScript);
                finally
                  FreeAndNil(varScript);
                end;

              end
              else
              begin

                Writeln( 'Apagando TSOP_OrderBilling' );
                varScript := TStringList.Create;
                try
                  varScript.Add('DELETE FROM TSOP_OrderBilling WHERE TSOP_ORDBILTIPDOC = ''Order'' AND TSOP_ORICOD = 1 AND TSOP_ORDBILSITNOM <> ''1063''');
                  FDScriptTSOP_OrderBilling.ExecuteScript(varScript);
                finally
                  FreeAndNil(varScript);
                end;

              end;

              Writeln( 'ApplyUpdates' );
              FDQueryTSOP_OrderBilling.ApplyUpdates;

              Writeln( 'CommitUpdates' );
              FDQueryTSOP_OrderBilling.CommitUpdates;

            except

              on E: Exception do
              begin

                WritelnMail( 'CommitUpdates: ' + E.Message );

              end;

            end;

            FDQueryTSOP_OrderBilling.Close;

          end;

        finally

          FDConnection.Close;

        end;

      end;

    finally

      FreeAndNil(Fr_Dados);

    end;

  finally

    FreeAndNil(dxSpreadSheet);

  end;

  Writeln('Copiando arquivo para backup. ', 'C:\Brady\Files\SOP\Arquivos\'+FSearchRecord.Name );
  CopyFile( PWideChar('C:\Brady\Files\SOP\Arquivos\'+FSearchRecord.Name), PWideChar('C:\Brady\Files\SOP\Arquivos\Backup\'+FSearchRecord.Name), True );

  Writeln('Apagando arquivo. ', MyDocumentsPath+'\'+FSearchRecord.Name );
  DeleteFile( PWideChar('C:\Brady\Files\SOP\Arquivos\'+FSearchRecord.Name) );

  Writeln('Apagando arquivo local. ', MyDocumentsPath+'\'+FSearchRecord.Name );
  DeleteFile(PWideChar(MyDocumentsPath+'\'+FSearchRecord.Name));

end;

function ConvertDate(DataValue :string) : TDateTime;
var
        AFormatSettings:TFormatSettings;
        ALocaleID: integer;
        DateTym :TdateTime;
        DataLocal : String;
begin
 DataValue:=StringReplace(DataValue, '/',{OldPattern} '-', {NewPattern}
                 [rfReplaceAll, rfIgnoreCase] {Flags:TreplaceFlags});
  //this StringReplace must be used because with Separator  / for date
   //occurs error
 GetLocaleFormatSettings(ALocaleID, AFormatSettings);

 AFormatSettings.ShortDateFormat:='DD-MM-YYYY';
 DataLocal := DataValue[4]+DataValue[5]+'/'+DataValue[1]+DataValue[2]+'/'+DataValue[7]+DataValue[8]+DataValue[9]+DataValue[10];
 DateTym:=StrToDate(DataLocal, AFormatSettings);
 AFormatSettings.ShortDateFormat:='dd/mm/yyyy';
 //AFormatSettings.ShortDateFormat:='MM-DD-YYYY'; //can be also used
 DataValue:=FormatDateTime(AFormatSettings.ShortDateFormat,DateTym);
 Result :=  StrToDate(DataValue);
end;

procedure ImportBW_INVOICE;
var
  I: Integer;

  dxSpreadSheet: TdxSpreadSheet;
  varStringList: TStringList;

  varDate: Integer;

  varColumnPlant: Integer;
  varColumnProfiteCenter: Integer;
  varColumnCalendarDay: Integer;
  varColumnNotaFiscal: Integer;
  varColumnInvoiceNumber: Integer;
  varColumnBillingType: Integer;
  varColumnOrderNumber: Integer;
  varColumnOrderLineNumber: Integer;
  varColumnCustomerPODate: Integer;
  varColumnSoldtoPartySP: Integer;
  varColumnSoldtoName: Integer;
  varColumnManagedGroup: Integer;
  varColumnManagedGroup2: Integer;
  varColumnSalesRep: Integer;
  varColumnYNumber: Integer;
  varColumnDescription: Integer;
  varColumnUoM: Integer;
  varColumnProdHierL1: Integer;
  varColumnProdHierL2: Integer;
  varColumnProdHierL3: Integer;
  varColumnProdHierL4: Integer;
  varColumnProdHierL5: Integer;
  varColumnBilledQty: Integer;
  varColumnBillqtyinSKU: Integer;
  varColumnNetValueSeton: Integer;
  varColumnNetValue: Integer;

  varPlant: String;
  varSalesOrg: String;
  varCalendarDay: TDateTime;
  varNotaFiscal: String;
  varBillingType: String;
  varOrderNumber: String;
  varOrderLineNumber: Integer;
  varCustomerPODate: TDateTime;
  varSoldtoPartySP: String;
  varSoldtoName: String;
  varManagedGroup: String;
  varManagedGroup2: String;
  varSalesRep: String;
  varYNumber: String;
  varDescription: String;
  varUoM: String;
  varProdHierL1: String;
  varProdHierL2: String;
  varProdHierL3: String;
  varProdHierL4: String;
  varProdHierL5: String;
  varBilledQty: Extended;
  varBillqtyinSKU: Extended;
  varNetValue: Extended;

  varScript: TStringList;
  varDataExcluir: TDateTime;

begin

  Writeln('Inicio: ','Import BW Invoice');

  Writeln('Apagando arquivo local. ', MyDocumentsPath+'\'+FSearchRecord.Name );
  DeleteFile(PWideChar(MyDocumentsPath+'\'+FSearchRecord.Name));

  Writeln('Copiando arquivo local. ', MyDocumentsPath+'\'+FSearchRecord.Name );
  CopyFile( PWideChar('C:\Brady\Files\SOP\Arquivos\'+FSearchRecord.Name), PWideChar(MyDocumentsPath+'\'+FSearchRecord.Name), True );

  dxSpreadSheet := TdxSpreadSheet.Create(nil);
  try

    Writeln('Lendo Planilha ', MyDocumentsPath+'\'+FSearchRecord.Name);
    dxSpreadSheet.LoadFromFile( MyDocumentsPath+'\'+FSearchRecord.Name );

    varColumnPlant := -1;
    varColumnProfiteCenter := -1;
    varColumnCalendarDay := -1;
    varColumnNotaFiscal := -1;
    varColumnInvoiceNumber := -1;
    varColumnBillingType := -1;
    varColumnOrderNumber := -1;
    varColumnOrderLineNumber := -1;
    varColumnCustomerPODate := -1;
    varColumnSoldtoPartySP := -1;
    varColumnSoldtoName := -1;
    varColumnManagedGroup := -1;
    varColumnManagedGroup2 := -1;
    varColumnSalesRep := -1;
    varColumnYNumber := -1;
    varColumnDescription := -1;
    varColumnUoM := -1;
    varColumnProdHierL1 := -1;
    varColumnProdHierL2 := -1;
    varColumnProdHierL3 := -1;
    varColumnProdHierL4 := -1;
    varColumnProdHierL5 := -1;
    varColumnBilledQty := -1;
    varColumnBillqtyinSKU := -1;
    varColumnNetValueSeton := -1;
    varColumnNetValue := -1;

    Writeln('Descobrindo Colunas');
    for I := dxSpreadSheet.ActiveSheetAsTable.Columns.FirstIndex to dxSpreadSheet.ActiveSheetAsTable.Columns.LastIndex do
    begin

      if not  Assigned(dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0]) then
          Continue;


      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Plant' then
        varColumnPlant := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Profit Center' then
        varColumnProfiteCenter := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Calendar Day' then
        varColumnCalendarDay := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Nota Fiscal' then
        varColumnNotaFiscal := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Invoice Number' then
        varColumnInvoiceNumber := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Billing Type' then
        varColumnBillingType := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Order Number' then
        varColumnOrderNumber := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Order Line Item' then
        varColumnOrderLineNumber := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Customer PO Date' then
        varColumnCustomerPODate := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Sold-to Party - SP' then
      begin

        varColumnSoldtoPartySP := I;
        varColumnSoldtoName := I+1;

      end;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Managed Group Number - SP' then
      begin
        varColumnManagedGroup := I+1;
        varColumnManagedGroup2 := I;
      end;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Sales Team (Out) - Doc' then
        varColumnSalesRep := I+1;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Material' then
      begin

        varColumnYNumber := I;
        varColumnDescription := I+1;

      end;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Base Unit' then
        varColumnUoM := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Prod Hier L1 - New' then
        varColumnProdHierL1 := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Prod Hier L2 - New' then
        varColumnProdHierL2 := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Prod Hier L3 - New' then
        varColumnProdHierL3 := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Prod Hier L4 - New' then
        varColumnProdHierL4 := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Prod Hier L5 - New' then
        varColumnProdHierL5 := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Billed Qty' then
        varColumnBilledQty := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Bill.qty in SKU' then
        varColumnBillqtyinSKU := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Net Value' then
        varColumnNetValue := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Net Value - Seton' then
        varColumnNetValueSeton := I;

    end;

    Writeln( 'Criando DataModule' );
    Fr_Dados := TFr_Dados.Create(nil);
    try

      with Fr_Dados do
      begin

        Writeln('Config FDConnection');
        FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );

        Writeln('Open FDConnection');
        FDConnection.Open;
        try

          Writeln( 'Abrindo Query' );
          FDQueryTSOP_OrderBilling.Open;
          try

            Writeln('Looping pelas linhas');
            for I := dxSpreadSheet.ActiveSheetAsTable.Rows.FirstIndex+1 to dxSpreadSheet.ActiveSheetAsTable.Rows.LastIndex do
            begin


              Writeln( 'Order/Billing (',I-1,'/',dxSpreadSheet.ActiveSheetAsTable.Rows.LastIndex-1,')' );

              if not  Assigned(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[0]) then
                Continue;


              if Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnProfiteCenter].AsString).Equals('OEM - Manaus Prod') then
                varPlant := '1061'
              else
              if Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnProfiteCenter].AsString).Equals('OEM - Manaus Com') then
                varPlant := '1062'
              else
              if Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnPlant].AsString).Equals('W.H.B. do Brasil Ltda - Manaus') then
                varPlant := '1061'
              else
                varPlant := '1063';

              varManagedGroup2 := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnManagedGroup2].AsString);

              if varManagedGroup2.StartsWith('4110') or varManagedGroup2.StartsWith('4150') or varManagedGroup2.StartsWith('4160') then
              begin

                varSalesOrg := Trim(Copy(varManagedGroup2,1,4));

              end
              else
              begin

                if not varPlant.Equals('1063') then
                  varSalesOrg := '4160'
                else
                if Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnProfiteCenter].AsString).Equals('Direct Marketing') then
                  varSalesOrg := '4110'
                else
                  varSalesOrg := '4150';

              end;

              if dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnCalendarDay].DataType = cdtDateTime then
                varCalendarDay := dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnCalendarDay].AsDateTime
              else
              if TryStrToInt( dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnCalendarDay].AsString, varDate ) then
                varCalendarDay := varDate
              else
                varCalendarDay := StrToDate(String(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnCalendarDay].AsString).Replace( '.', '/' ));

              varNotaFiscal := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnNotaFiscal].AsString);
              if varNotaFiscal.Equals('0000000000000000') then
                varNotaFiscal := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnInvoiceNumber].AsString);

              if Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnBillingType].AsString).Equals( 'ZBOR' ) then
                varBillingType := 'Billing'
              else
              if Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnBillingType].AsString).Equals( 'ZBSS' ) then
                varBillingType := 'Billing'
              else
              if Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnBillingType].AsString).Equals( 'ZBDR' ) then
                varBillingType := 'Billing'
              else
              if Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnBillingType].AsString).Equals( 'S1' ) then
                varBillingType := 'Return'
              else
              if Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnBillingType].AsString).Equals( 'S2' ) then
                varBillingType := 'Return'
              else
              if Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnBillingType].AsString).Equals( 'ZBRE' ) then
                varBillingType := 'Return';

              varOrderNumber := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnOrderNumber].AsString);

              varOrderLineNumber := StrToIntDef(Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnOrderLineNumber].AsString),0);

              if dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnCustomerPODate].DataType = cdtDateTime then
                varCustomerPODate := dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnCustomerPODate].AsDateTime
              else
              if TryStrToInt( dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnCustomerPODate].AsString, varDate ) then
                varCustomerPODate := varDate
              else
              if String(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnCustomerPODate].AsString).Equals('#') then
                varCustomerPODate := varCalendarDay
              else
              begin

                varCustomerPODate :=  ConvertDate(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnCustomerPODate].AsString);

                //varCustomerPODate := StrToDate(String(FormatDateTime('dd-mm-yyyy', )).Replace( '.', '/' ));

              end;
              varSoldtoPartySP := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnSoldtoPartySP].AsString);

              varSoldtoName := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnSoldtoName].AsString);

              varManagedGroup := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnManagedGroup].AsString);
              if varManagedGroup.Contains('Not assigned') then
                varManagedGroup := varSoldtoName;

              varSalesRep := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnSalesRep].AsString);
              if varSalesRep.Equals('9999999999') then
                varSalesRep := EmptyStr;

              varYNumber := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnYNumber].AsString);

              varDescription := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnDescription].AsString);

              varUoM := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnUoM].AsString);

              varProdHierL1 := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnProdHierL1].AsString);

              varProdHierL2 := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnProdHierL2].AsString);

              varProdHierL3 := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnProdHierL3].AsString);

              varProdHierL4 := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnProdHierL4].AsString);

              varProdHierL5 := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnProdHierL5].AsString);

              varBilledQty := dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnBilledQty].AsFloat;

              varBillqtyinSKU := dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnBillqtyinSKU].AsFloat;

              varNetValue := dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnNetValueSeton].AsFloat +
                             dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnNetValue].AsFloat;

              FDQueryTSOP_OrderBilling.Append;
              FDQueryTSOP_OrderBillingTSOP_ORDBILSITNOM.AsString      := varPlant;
              FDQueryTSOP_OrderBillingTSOP_ORDBILCANNOM.AsString      := varSalesOrg;
              FDQueryTSOP_OrderBillingTSOP_ORDBILDATDOC.AsDateTime    := varCalendarDay;
              FDQueryTSOP_OrderBillingTSOP_ORDBILNRODOC.AsString      := varNotaFiscal;
              FDQueryTSOP_OrderBillingTSOP_ORDBILTIPDOC.AsString      := varBillingType;
              FDQueryTSOP_OrderBillingTSOP_ORDBILNRODOCREF.AsString   := varOrderNumber;
              FDQueryTSOP_OrderBillingTSOP_ORDBILITESEQ.AsInteger     := varOrderLineNumber;
              FDQueryTSOP_OrderBillingTSOP_ORDBILDATDOCREQ.AsDateTime := varCustomerPODate;
              FDQueryTSOP_OrderBillingTSOP_ORDBILCLICOD.AsString      := varSoldtoPartySP;
              FDQueryTSOP_OrderBillingTSOP_ORDBILCLINOM.AsString      := varSoldtoName;
              FDQueryTSOP_OrderBillingTSOP_ORDBILGRUCLINOM.AsString   := varManagedGroup;
              FDQueryTSOP_OrderBillingTSOP_ORDBILREPNOM.AsString      := varSalesRep;
              FDQueryTSOP_OrderBillingTSOP_ORDBILITECOD.AsString      := varYNumber;
              FDQueryTSOP_OrderBillingTSOP_ORDBILITENOM.AsString      := varDescription;
              FDQueryTSOP_OrderBillingTSOP_ORDBILITEUNI.AsString      := varUoM;
              FDQueryTSOP_OrderBillingTSOP_ORDBILITEFAM001.AsString   := varProdHierL1;
              FDQueryTSOP_OrderBillingTSOP_ORDBILITEFAM002.AsString   := varProdHierL2;
              FDQueryTSOP_OrderBillingTSOP_ORDBILITEFAM003.AsString   := varProdHierL3;
              FDQueryTSOP_OrderBillingTSOP_ORDBILITEFAM004.AsString   := varProdHierL4;
              FDQueryTSOP_OrderBillingTSOP_ORDBILITEFAM005.AsString   := varProdHierL5;
              FDQueryTSOP_OrderBillingTSOP_ORDBILVALLIQ.AsFloat       := varNetValue;
              FDQueryTSOP_OrderBillingTSOP_ORDBILQTD.AsFloat          := varBilledQty;
              FDQueryTSOP_OrderBillingTSOP_ORDBILQTDSKU.AsFloat       := varBillqtyinSKU;
              FDQueryTSOP_OrderBilling.Post;

            end;

          finally

            try

               FDQueryTSOP_OrderBilling.First;
              while not FDQueryTSOP_OrderBilling.Eof do
              begin

                if varDataExcluir <> FDQueryTSOP_OrderBillingTSOP_ORDBILDATDOC.AsDateTime then
                begin

                  varDataExcluir := FDQueryTSOP_OrderBillingTSOP_ORDBILDATDOC.AsDateTime;

                  Writeln( 'Apagando TSOP_OrderBilling ', FormatDateTime( 'dd/mm/yyyy', FDQueryTSOP_OrderBillingTSOP_ORDBILDATDOC.AsDateTime) );
                  varScript := TStringList.Create;
                  try
                    varScript.Add('DELETE FROM TSOP_OrderBilling WHERE TSOP_ORDBILDATDOC = ' + QuotedStr( FormatDateTime( 'yyyymmdd', FDQueryTSOP_OrderBillingTSOP_ORDBILDATDOC.AsDateTime) ) + ' AND TSOP_ORDBILTIPDOC IN ( ''Billing'', ''Return'' ) AND TSOP_ORICOD = 1');
                    FDScriptTSOP_OrderBilling.ExecuteScript(varScript);
                  finally
                    FreeAndNil(varScript);
                  end;

                end;

                FDQueryTSOP_OrderBilling.Next;

              end;

              Writeln( 'ApplyUpdates' );
              FDQueryTSOP_OrderBilling.ApplyUpdates;

              Writeln( 'CommitUpdates' );
              FDQueryTSOP_OrderBilling.CommitUpdates;

            except

              on E: Exception do
              begin

                Writeln( 'CommitUpdates: ', E.Message );

              end;

            end;

            FDQueryTSOP_OrderBilling.Close;

          end;

        finally

          FDConnection.Close;

        end;

      end;

    finally

      FreeAndNil(Fr_Dados);

    end;

  finally

    FreeAndNil(dxSpreadSheet);

  end;

  Writeln('Copiando arquivo para backup. ', 'C:\Brady\Files\SOP\Arquivos\'+FSearchRecord.Name );
  CopyFile( PWideChar('C:\Brady\Files\SOP\Arquivos\'+FSearchRecord.Name), PWideChar('C:\Brady\Files\SOP\Arquivos\Backup\'+FSearchRecord.Name), True );

  Writeln('Apagando arquivo. ', MyDocumentsPath+'\'+FSearchRecord.Name );
  DeleteFile( PWideChar('C:\Brady\Files\SOP\Arquivos\'+FSearchRecord.Name) );

  Writeln('Apagando arquivo local. ', MyDocumentsPath+'\'+FSearchRecord.Name );
  DeleteFile(PWideChar(MyDocumentsPath+'\'+FSearchRecord.Name));

end;

procedure ImportQlik_INVOICE;
var
  I: Integer;

  dxSpreadSheet: TdxSpreadSheet;
  varStringList: TStringList;

  varDate: Integer;

  varColumnPlant: Integer;
  varColumnProfiteCenter: Integer;
  varColumnCalendarDay: Integer;
  varColumnNotaFiscal: Integer;
  varColumnInvoiceNumber: Integer;
  varColumnBillingType: Integer;
  varColumnOrderNumber: Integer;
  varColumnOrderLineNumber: Integer;
  varColumnCustomerPODate: Integer;
  varColumnSoldtoPartySP: Integer;
  varColumnSoldtoName: Integer;
  varColumnManagedGroup: Integer;
  varColumnManagedGroup2: Integer;
  varColumnSalesRep: Integer;
  varColumnYNumber: Integer;
  varColumnDescription: Integer;
  varColumnUoM: Integer;
  varColumnProdHierL1: Integer;
  varColumnProdHierL2: Integer;
  varColumnProdHierL3: Integer;
  varColumnProdHierL4: Integer;
  varColumnProdHierL5: Integer;
  varColumnBilledQty: Integer;
  varColumnBillqtyinSKU: Integer;
  varColumnNetValueSeton: Integer;
  varColumnNetValue: Integer;

  varPlant: String;
  varSalesOrg: String;
  varCalendarDay: TDateTime;
  varNotaFiscal: String;
  varBillingType: String;
  varOrderNumber: String;
  varOrderLineNumber: Integer;
  varCustomerPODate: TDateTime;
  varSoldtoPartySP: String;
  varSoldtoName: String;
  varManagedGroup: String;
  varManagedGroup2: String;
  varSalesRep: String;
  varYNumber: String;
  varDescription: String;
  varUoM: String;
  varProdHierL1: String;
  varProdHierL2: String;
  varProdHierL3: String;
  varProdHierL4: String;
  varProdHierL5: String;
  varBilledQty: Extended;
  varBillqtyinSKU: Extended;
  varNetValue: Extended;

  varScript: TStringList;
  varDataExcluir: TDateTime;

begin

  Writeln('Inicio: ','Import Qlik Invoice');

  Writeln('Apagando arquivo local. ', MyDocumentsPath+'\'+FSearchRecord.Name );
  DeleteFile(PWideChar(MyDocumentsPath+'\'+FSearchRecord.Name));

  Writeln('Copiando arquivo local. ', MyDocumentsPath+'\'+FSearchRecord.Name );
  CopyFile( PWideChar('C:\Brady\Files\SOP\Arquivos\'+FSearchRecord.Name), PWideChar(MyDocumentsPath+'\'+FSearchRecord.Name), True );

  dxSpreadSheet := TdxSpreadSheet.Create(nil);
  try

    Writeln('Lendo Planilha ', MyDocumentsPath+'\'+FSearchRecord.Name);
    dxSpreadSheet.LoadFromFile( MyDocumentsPath+'\'+FSearchRecord.Name );

    varColumnPlant := -1;
    varColumnProfiteCenter := -1;
    varColumnCalendarDay := -1;
    varColumnNotaFiscal := -1;
    varColumnInvoiceNumber := -1;
    varColumnBillingType := -1;
    varColumnOrderNumber := -1;
    varColumnOrderLineNumber := -1;
    varColumnCustomerPODate := -1;
    varColumnSoldtoPartySP := -1;
    varColumnSoldtoName := -1;
    varColumnManagedGroup := -1;
    varColumnManagedGroup2 := -1;
    varColumnSalesRep := -1;
    varColumnYNumber := -1;
    varColumnDescription := -1;
    varColumnUoM := -1;
    varColumnProdHierL1 := -1;
    varColumnProdHierL2 := -1;
    varColumnProdHierL3 := -1;
    varColumnProdHierL4 := -1;
    varColumnProdHierL5 := -1;
    varColumnBilledQty := -1;
    varColumnBillqtyinSKU := -1;
    varColumnNetValueSeton := -1;
    varColumnNetValue := -1;

    Writeln('Descobrindo Colunas');
    for I := dxSpreadSheet.ActiveSheetAsTable.Columns.FirstIndex to dxSpreadSheet.ActiveSheetAsTable.Columns.LastIndex do
    begin

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Shipping Plant' then
        varColumnPlant := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Profit Center' then
        varColumnProfiteCenter := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Date' then
        varColumnCalendarDay := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Nota Fiscal #' then
        varColumnNotaFiscal := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Invoice #' then
        varColumnInvoiceNumber := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Billing Type' then
        varColumnBillingType := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Sales Order #' then
        varColumnOrderNumber := I;

      // De acordo com Leandro e Luciana o Invoice line # � igual ao Order Line # mesmo para pedidos parciais.
      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Invoice Item #' then
        varColumnOrderLineNumber := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Customer PO Date' then
        varColumnCustomerPODate := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'SoldTo Customer #' then
      begin

        varColumnSoldtoPartySP := I;

      end;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'SoldTo Name' then
      begin

        varColumnSoldtoName := I;

      end;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'SoldTo Managed Group Number' then
      begin

        varColumnManagedGroup := I;

      end;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Sales Org' then
      begin

        varColumnManagedGroup2 := I;

      end;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Sales Team (Out)' then
      begin

        varColumnSalesRep := I;

      end;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Y#' then
      begin

        varColumnYNumber := I;

      end;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Product Line Desc' then
      begin

        varColumnDescription := I;

      end;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Base UOM' then
        varColumnUoM := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Prod Hier 1' then
        varColumnProdHierL1 := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Prod Hier 2' then
        varColumnProdHierL2 := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Prod Hier 3' then
        varColumnProdHierL3 := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Prod Hier 4' then
        varColumnProdHierL4 := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Prod Hier 5' then
        varColumnProdHierL5 := I;

      //varColumnBilledQty
      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2017 Q1 TD Qty' then
        varColumnBilledQty := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2017 Q2 TD Qty' then
        varColumnBilledQty := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2017 Q3 TD Qty' then
        varColumnBilledQty := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2017 Q4 TD Qty' then
        varColumnBilledQty := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2018 Q1 TD Qty' then
        varColumnBilledQty := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2018 Q2 TD Qty' then
        varColumnBilledQty := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2018 Q3 TD Qty' then
        varColumnBilledQty := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2018 Q4 TD Qty' then
        varColumnBilledQty := I;

      //Novo
      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2019 Q1 TD Qty' then
        varColumnBilledQty := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2019 Q2 TD Qty' then
        varColumnBilledQty := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2019 Q3 TD Qty' then
        varColumnBilledQty := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2019 Q4 TD Qty' then
        varColumnBilledQty := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2018 May Quantity' then
        varColumnBilledQty := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2018 Jun Quantity' then
        varColumnBilledQty := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2018 Jul Quantity' then
        varColumnBilledQty := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2018 Aug Quantity' then
        varColumnBilledQty := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2018 Sep Quantity' then
        varColumnBilledQty := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2018 Oct Quantity' then
        varColumnBilledQty := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2018 Nov Quantity' then
        varColumnBilledQty := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2018 Dec Quantity' then
        varColumnBilledQty := I;



      //Novo
      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2019 Jan Quantity' then
        varColumnBilledQty := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2019 Feb Quantity' then
        varColumnBilledQty := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2019 Mar Quantity' then
        varColumnBilledQty := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2019 Apr Quantity' then
        varColumnBilledQty := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2019 May Quantity' then
        varColumnBilledQty := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2019 Jun Quantity' then
        varColumnBilledQty := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2019 Jul Quantity' then
        varColumnBilledQty := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2019 Aug Quantity' then
        varColumnBilledQty := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2019 Sep Quantity' then
        varColumnBilledQty := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2019 Oct Quantity' then
        varColumnBilledQty := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2019 Nov Quantity' then
        varColumnBilledQty := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2019 Dec Quantity' then
        varColumnBilledQty := I;

      //varColumnBillqtyinSKU

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2017 Jan Quantity in SKU' then
        varColumnBillqtyinSKU := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2017 Feb Quantity in SKU' then
        varColumnBillqtyinSKU := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2017 Mar Quantity in SKU' then
        varColumnBillqtyinSKU := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2017 Apr Quantity in SKU' then
        varColumnBillqtyinSKU := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2017 May Quantity in SKU' then
        varColumnBillqtyinSKU := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2017 Jun Quantity in SKU' then
        varColumnBillqtyinSKU := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2017 Jul Quantity in SKU' then
        varColumnBillqtyinSKU := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2017 Aug Quantity in SKU' then
        varColumnBillqtyinSKU := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2017 Sep Quantity in SKU' then
        varColumnBillqtyinSKU := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2017 Oct Quantity in SKU' then
        varColumnBillqtyinSKU := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2017 Nov Quantity in SKU' then
        varColumnBillqtyinSKU := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2017 Dec Quantity in SKU' then
        varColumnBillqtyinSKU := I;



      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2018 Jan Quantity in SKU' then
        varColumnBillqtyinSKU := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2018 Feb Quantity in SKU' then
        varColumnBillqtyinSKU := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2018 Mar Quantity in SKU' then
        varColumnBillqtyinSKU := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2018 Apr Quantity in SKU' then
        varColumnBillqtyinSKU := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2018 May Quantity in SKU' then
        varColumnBillqtyinSKU := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2018 Jun Quantity in SKU' then
        varColumnBillqtyinSKU := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2018 Jul Quantity in SKU' then
        varColumnBillqtyinSKU := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2018 Aug Quantity in SKU' then
        varColumnBillqtyinSKU := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2018 Sep Quantity in SKU' then
        varColumnBillqtyinSKU := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2018 Oct Quantity in SKU' then
        varColumnBillqtyinSKU := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2018 Nov Quantity in SKU' then
        varColumnBillqtyinSKU := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2018 Dec Quantity in SKU' then
        varColumnBillqtyinSKU := I;



      //Novo

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2019 Jan Quantity in SKU' then
        varColumnBillqtyinSKU := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2019 Feb Quantity in SKU' then
        varColumnBillqtyinSKU := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2019 Mar Quantity in SKU' then
        varColumnBillqtyinSKU := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2019 Apr Quantity in SKU' then
        varColumnBillqtyinSKU := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2019 May Quantity in SKU' then
        varColumnBillqtyinSKU := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2019 Jun Quantity in SKU' then
        varColumnBillqtyinSKU := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2019 Jul Quantity in SKU' then
        varColumnBillqtyinSKU := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2019 Aug Quantity in SKU' then
        varColumnBillqtyinSKU := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2019 Sep Quantity in SKU' then
        varColumnBillqtyinSKU := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2019 Oct Quantity in SKU' then
        varColumnBillqtyinSKU := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2019 Nov Quantity in SKU' then
        varColumnBillqtyinSKU := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2019 Dec Quantity in SKU' then
        varColumnBillqtyinSKU := I;



      //varColumnNetValue
      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2017 Q1 TD Cust Sales' then
        varColumnNetValue := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2017 Q2 TD Cust Sales' then
        varColumnNetValue := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2017 Q3 TD Cust Sales' then
        varColumnNetValue := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2017 Q4 TD Cust Sales' then
        varColumnNetValue := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2018 Q1 TD Cust Sales' then
        varColumnNetValue := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2018 Q2 TD Cust Sales' then
        varColumnNetValue := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2018 Q3 TD Cust Sales' then
        varColumnNetValue := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2018 Q4 TD Cust Sales' then
        varColumnNetValue := I;

      //Novo
      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2019 Q1 TD Cust Sales' then
        varColumnNetValue := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2019 Q2 TD Cust Sales' then
        varColumnNetValue := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2019 Q3 TD Cust Sales' then
        varColumnNetValue := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2019 Q4 TD Cust Sales' then
        varColumnNetValue := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2018 May  Customer Sales' then
        varColumnNetValue := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2018 Jun  Customer Sales' then
        varColumnNetValue := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2018 Jul  Customer Sales' then
        varColumnNetValue := I;


      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2018 Aug  Customer Sales' then
        varColumnNetValue := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2018 Sep  Customer Sales' then
        varColumnNetValue := I;


      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2018 Oct  Customer Sales' then
        varColumnNetValue := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2018 Nov  Customer Sales' then
        varColumnNetValue := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2018 Dec  Customer Sales' then
        varColumnNetValue := I;

      //Novo
      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2019 Jan  Customer Sales' then
        varColumnNetValue := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2019 Feb  Customer Sales' then
        varColumnNetValue := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2019 Mar  Customer Sales' then
        varColumnNetValue := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2019 Apr  Customer Sales' then
        varColumnNetValue := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2019 May  Customer Sales' then
        varColumnNetValue := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2019 Jun  Customer Sales' then
        varColumnNetValue := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2019 Jul  Customer Sales' then
        varColumnNetValue := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2019 Aug  Customer Sales' then
        varColumnNetValue := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2019 Sep  Customer Sales' then
        varColumnNetValue := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2019 Oct  Customer Sales' then
        varColumnNetValue := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2019 Nov  Customer Sales' then
        varColumnNetValue := I;

      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = '2019 Dec  Customer Sales' then
        varColumnNetValue := I;

//      if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'Net Value - Seton' then
//        varColumnNetValueSeton := I;

    end;

    if varColumnPlant = -1 then
	    raise Exception.Create('Shipping Plant n�o encontrado.');

    if varColumnProfiteCenter = -1 then
	    raise Exception.Create('Profit Center n�o encontrado.');

    if varColumnCalendarDay = -1 then
	    raise Exception.Create('Date n�o encontrado.');

    if varColumnNotaFiscal = -1 then
	    raise Exception.Create('Nota Fiscal # n�o encontrado.');

    if varColumnInvoiceNumber = -1 then
	    raise Exception.Create('Invoice # n�o encontrado.');

    if varColumnBillingType = -1 then
	    raise Exception.Create('Billing Type n�o encontrado.');

    if varColumnOrderNumber = -1 then
	    raise Exception.Create('Sales Order # n�o encontrado.');

    if varColumnOrderLineNumber = -1 then
	    raise Exception.Create('Invoice Item # n�o encontrado.');

    if varColumnCustomerPODate = -1 then
	    raise Exception.Create('Customer PO Date n�o encontrado.');

    if varColumnSoldtoPartySP = -1 then
	    raise Exception.Create('SoldTo Customer # n�o encontrado.');

    if varColumnSoldtoName = -1 then
	    raise Exception.Create('SoldTo Name n�o encontrado.');

    if varColumnManagedGroup = -1 then
	    raise Exception.Create('SoldTo Managed Group Number n�o encontrado.');

    if varColumnManagedGroup2 = -1 then
	    raise Exception.Create('Sales Org n�o encontrado.');

    if varColumnSalesRep = -1 then
	    raise Exception.Create('Sales Team (Out) n�o encontrado.');

    if varColumnYNumber = -1 then
	    raise Exception.Create('Y# n�o encontrado.');

    if varColumnDescription = -1 then
	    raise Exception.Create('Product Line Desc n�o encontrado.');

    if varColumnUoM = -1 then
	    raise Exception.Create('Base UOM n�o encontrado.');

    if varColumnProdHierL1 = -1 then
	    raise Exception.Create('Prod Hier 1 n�o encontrado.');

    if varColumnProdHierL2 = -1 then
	    raise Exception.Create('Prod Hier 2 n�o encontrado.');

    if varColumnProdHierL3 = -1 then
	    raise Exception.Create('Prod Hier 3 n�o encontrado.');

    if varColumnProdHierL4 = -1 then
	    raise Exception.Create('Prod Hier 4 n�o encontrado.');

    if varColumnProdHierL5 = -1 then
	    raise Exception.Create('Prod Hier 5 n�o encontrado.');

    if varColumnBilledQty = -1 then
	    raise Exception.Create('2017 Q1/2/3/4 TD Qty n�o encontrado.');

    if varColumnBillqtyinSKU = -1 then
	    raise Exception.Create('Bill.qty in SKU n�o encontrado.');

    if varColumnNetValue = -1 then
	    raise Exception.Create('2017 Q1/2/3/4 TD Cust Sales n�o encontrado.');

//    if varColumnNetValueSeton = -1 then
//	    raise Exception.Create('Net Value - Seton n�o encontrado.');

    Writeln( 'Criando DataModule' );
    Fr_Dados := TFr_Dados.Create(nil);
    try

      with Fr_Dados do
      begin

        Writeln('Config FDConnection');
        FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );

        Writeln('Open FDConnection');
        FDConnection.Open;
        try

          Writeln( 'Abrindo Query' );
          FDQueryTSOP_OrderBilling.Open;
          try

            Writeln('Looping pelas linhas');
            for I := dxSpreadSheet.ActiveSheetAsTable.Rows.FirstIndex+1 to dxSpreadSheet.ActiveSheetAsTable.Rows.LastIndex do
            begin

              Writeln( 'Order/Billing (',I-1,'/',dxSpreadSheet.ActiveSheetAsTable.Rows.LastIndex-1,')' );

              if Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnPlant].AsString).Trim.Equals('1061') then
                varPlant := '1061'
              else
              if Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnPlant].AsString).Trim.Equals('1062') then
                varPlant := '1062'
              else
                varPlant := '1063';

              varManagedGroup2 := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnManagedGroup2].AsString);

              if varManagedGroup2.StartsWith('4110') or varManagedGroup2.StartsWith('4150') or varManagedGroup2.StartsWith('4160') then
              begin

                varSalesOrg := Trim(Copy(varManagedGroup2,1,4));

              end
              else
              begin

                if not varPlant.Equals('1063') then
                  varSalesOrg := '4160'
                else
                if Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnProfiteCenter].AsString).Equals('Direct Marketing') then
                  varSalesOrg := '4110'
                else
                  varSalesOrg := '4150';

              end;
              Try
                if dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnCalendarDay].DataType = cdtDateTime then
                  varCalendarDay := dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnCalendarDay].AsDateTime
                else
                if TryStrToInt( dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnCalendarDay].AsString, varDate ) then
                  varCalendarDay := varDate
                else
                  varCalendarDay := StrToDate(String(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnCalendarDay].AsString).Replace( '.', '/' ));

              Except

              End;
              varNotaFiscal := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnNotaFiscal].AsString);
              if varNotaFiscal.Equals('0000000000000000') then
                varNotaFiscal := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnInvoiceNumber].AsString);

              if Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnBillingType].AsString).StartsWith( 'ZBOR' ) then
                varBillingType := 'Billing'
              else
              if Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnBillingType].AsString).StartsWith( 'ZBSS' ) then
                varBillingType := 'Billing'
              else
              if Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnBillingType].AsString).StartsWith( 'ZBDR' ) then
                varBillingType := 'Billing'
              else
              if Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnBillingType].AsString).StartsWith( 'S1' ) then
                varBillingType := 'Return'
              else
              if Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnBillingType].AsString).StartsWith( 'S2' ) then
                varBillingType := 'Return'
              else
              if Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnBillingType].AsString).StartsWith( 'ZBRE' ) then
                varBillingType := 'Return';

              varOrderNumber := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnOrderNumber].AsString);

              varOrderLineNumber := StrToIntDef(Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnOrderLineNumber].AsString),0);
              Try
              if dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnCustomerPODate].DataType = cdtDateTime then
                varCustomerPODate := dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnCustomerPODate].AsDateTime
              else
              if TryStrToInt( dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnCustomerPODate].AsString, varDate ) then
                varCustomerPODate := varDate
              else
              if String(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnCustomerPODate].AsString).Equals('#') or
                 String(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnCustomerPODate].AsString).Equals('-') then
                varCustomerPODate := varCalendarDay
              else
                varCustomerPODate := StrToDate(String(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnCustomerPODate].AsString).Replace( '.', '/' ));
              except

              End;
              varSoldtoPartySP := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnSoldtoPartySP].AsString);

              if varSoldtoPartySP.Trim.Equals('-') then
                Continue;

              varSoldtoName := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnSoldtoName].AsString);

              varManagedGroup := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnManagedGroup].AsString);
              if varManagedGroup.Contains('Not assigned') then
                varManagedGroup := varSoldtoName;

              varSalesRep := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnSalesRep].AsString);
              if varSalesRep.Equals('9999999999') then
                varSalesRep := EmptyStr;

              varYNumber := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnYNumber].AsString);

              varDescription := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnDescription].AsString);

              varUoM := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnUoM].AsString);

              varProdHierL1 := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnProdHierL1].AsString);

              varProdHierL2 := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnProdHierL2].AsString);

              varProdHierL3 := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnProdHierL3].AsString);

              varProdHierL4 := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnProdHierL4].AsString);

              varProdHierL5 := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnProdHierL5].AsString);

              varBilledQty := dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnBilledQty].AsFloat;

              if varBilledQty < 0.00 then
                varBillingType := 'Return'
              else
                varBillingType := 'Billing';

              varBillqtyinSKU := dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnBillqtyinSKU].AsFloat;

              if varBillqtyinSKU = 0.00 then
                varBillqtyinSKU := varBilledQty;

              varNetValue := //dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnNetValueSeton].AsFloat +
                             dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnNetValue].AsFloat;

              FDQueryTSOP_OrderBilling.Append;
              FDQueryTSOP_OrderBillingTSOP_ORDBILSITNOM.AsString      := varPlant;
              FDQueryTSOP_OrderBillingTSOP_ORDBILCANNOM.AsString      := varSalesOrg;
              FDQueryTSOP_OrderBillingTSOP_ORDBILDATDOC.AsDateTime    := varCalendarDay;
              FDQueryTSOP_OrderBillingTSOP_ORDBILNRODOC.AsString      := varNotaFiscal;
              FDQueryTSOP_OrderBillingTSOP_ORDBILTIPDOC.AsString      := varBillingType;
              FDQueryTSOP_OrderBillingTSOP_ORDBILNRODOCREF.AsString   := varOrderNumber;
              FDQueryTSOP_OrderBillingTSOP_ORDBILITESEQ.AsInteger     := varOrderLineNumber;
              FDQueryTSOP_OrderBillingTSOP_ORDBILDATDOCREQ.AsDateTime := varCustomerPODate;
              FDQueryTSOP_OrderBillingTSOP_ORDBILCLICOD.AsString      := varSoldtoPartySP;
              FDQueryTSOP_OrderBillingTSOP_ORDBILCLINOM.AsString      := varSoldtoName;
              FDQueryTSOP_OrderBillingTSOP_ORDBILGRUCLINOM.AsString   := varManagedGroup;
              FDQueryTSOP_OrderBillingTSOP_ORDBILREPNOM.AsString      := varSalesRep;
              FDQueryTSOP_OrderBillingTSOP_ORDBILITECOD.AsString      := varYNumber;
              FDQueryTSOP_OrderBillingTSOP_ORDBILITENOM.AsString      := varDescription;
              FDQueryTSOP_OrderBillingTSOP_ORDBILITEUNI.AsString      := varUoM;
              FDQueryTSOP_OrderBillingTSOP_ORDBILITEFAM001.AsString   := varProdHierL1;
              FDQueryTSOP_OrderBillingTSOP_ORDBILITEFAM002.AsString   := varProdHierL2;
              FDQueryTSOP_OrderBillingTSOP_ORDBILITEFAM003.AsString   := varProdHierL3;
              FDQueryTSOP_OrderBillingTSOP_ORDBILITEFAM004.AsString   := varProdHierL4;
              FDQueryTSOP_OrderBillingTSOP_ORDBILITEFAM005.AsString   := varProdHierL5;
              FDQueryTSOP_OrderBillingTSOP_ORDBILVALLIQ.AsFloat       := varNetValue;
              FDQueryTSOP_OrderBillingTSOP_ORDBILQTD.AsFloat          := varBilledQty;
              FDQueryTSOP_OrderBillingTSOP_ORDBILQTDSKU.AsFloat       := varBillqtyinSKU;
              FDQueryTSOP_OrderBilling.Post;

            end;

          finally

            try

              FDQueryTSOP_OrderBilling.First;
              while not FDQueryTSOP_OrderBilling.Eof do
              begin

                if varDataExcluir <> FDQueryTSOP_OrderBillingTSOP_ORDBILDATDOC.AsDateTime then
                begin

                  varDataExcluir := FDQueryTSOP_OrderBillingTSOP_ORDBILDATDOC.AsDateTime;

                  Writeln( 'Apagando TSOP_OrderBilling ', FormatDateTime( 'dd/mm/yyyy', FDQueryTSOP_OrderBillingTSOP_ORDBILDATDOC.AsDateTime) );
                  varScript := TStringList.Create;
                  try
                    varScript.Add('DELETE FROM TSOP_OrderBilling WHERE TSOP_ORDBILDATDOC = ' + QuotedStr( FormatDateTime( 'yyyymmdd', FDQueryTSOP_OrderBillingTSOP_ORDBILDATDOC.AsDateTime) ) + ' AND TSOP_ORDBILTIPDOC IN ( ''Billing'', ''Return'' ) AND TSOP_ORICOD = 1');
                    FDScriptTSOP_OrderBilling.ExecuteScript(varScript);
                  finally
                    FreeAndNil(varScript);
                  end;

                end;

                FDQueryTSOP_OrderBilling.Next;

              end;

              Writeln( 'ApplyUpdates' );
              FDQueryTSOP_OrderBilling.ApplyUpdates;

              Writeln( 'CommitUpdates' );
              FDQueryTSOP_OrderBilling.CommitUpdates;

            except

              on E: Exception do
              begin

                Writeln( 'CommitUpdates: ', E.Message );

              end;

            end;

            FDQueryTSOP_OrderBilling.Close;

          end;

        finally

          FDConnection.Close;

        end;

      end;

    finally

      FreeAndNil(Fr_Dados);

    end;

  finally

    FreeAndNil(dxSpreadSheet);

  end;

  Writeln('Copiando arquivo para backup. ', 'C:\Brady\Files\SOP\Arquivos\'+FSearchRecord.Name );
  CopyFile( PWideChar('C:\Brady\Files\SOP\Arquivos\'+FSearchRecord.Name), PWideChar('C:\Brady\Files\SOP\Arquivos\Backup\'+FSearchRecord.Name), True );

  Writeln('Apagando arquivo. ', MyDocumentsPath+'\'+FSearchRecord.Name );
  DeleteFile( PWideChar('C:\Brady\Files\SOP\Arquivos\'+FSearchRecord.Name) );

  Writeln('Apagando arquivo local. ', MyDocumentsPath+'\'+FSearchRecord.Name );
  DeleteFile(PWideChar(MyDocumentsPath+'\'+FSearchRecord.Name));

end;

procedure ImportINOVAR;
var
  I: Integer;

  dxSpreadSheet: TdxSpreadSheet;

  varColumnDATANF: Integer;
  varColumnCODCLIFOR: Integer;
  varColumnNUMNF: Integer;
  varColumnCODPRODUTO: Integer;
  varColumnCFOP: Integer;
  varColumnVLRCONTABIL: Integer;

  varDATANF: TDateTime;
  varCODCLIFOR: String;
  varNUMNF: String;
  varCODPRODUTO: String;
  varCFOP: String;
  varVLRCONTABIL: Extended;

begin

  Writeln('Inicio: ','Import Inovar');

  Writeln('Apagando arquivo local. ', MyDocumentsPath+'\'+FSearchRecord.Name );
  DeleteFile(PWideChar(MyDocumentsPath+'\'+FSearchRecord.Name));

  Writeln('Copiando arquivo local. ', MyDocumentsPath+'\'+FSearchRecord.Name );
  CopyFile( PWideChar('C:\Brady\Files\FIS\'+FSearchRecord.Name), PWideChar(MyDocumentsPath+'\'+FSearchRecord.Name), True );

  dxSpreadSheet := TdxSpreadSheet.Create(nil);
  try

    Writeln('Lendo Planilha ', MyDocumentsPath+'\'+FSearchRecord.Name);
    dxSpreadSheet.LoadFromFile( MyDocumentsPath+'\'+FSearchRecord.Name );

    varColumnDATANF := -1;
    varColumnCODCLIFOR := -1;
    varColumnNUMNF := -1;
    varColumnCODPRODUTO := -1;
    varColumnCFOP := -1;
    varColumnVLRCONTABIL := -1;

    Writeln('Descobrindo Colunas');
    for I := dxSpreadSheet.ActiveSheetAsTable.Columns.FirstIndex to dxSpreadSheet.ActiveSheetAsTable.Columns.LastIndex do
    begin

      Writeln('Coluna: ' + IntToStr(I) );

      try

        if not Assigned(dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0]) then
            Continue;

        if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'DATA NF' then
          varColumnDATANF := I;

        if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'COD. CLIFOR' then
          varColumnCODCLIFOR := I;

        if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'NUM. NF' then
          varColumnNUMNF := I;

        if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'COD. PRODUTO' then
          varColumnCODPRODUTO := I;

        if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'CFOP' then
          varColumnCFOP := I;

        if dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString = 'VLR. CONTABIL' then
          varColumnVLRCONTABIL := I;

      except
      end;

    end;

    Writeln( 'Criando DataModule' );
    Fr_Dados := TFr_Dados.Create(nil);
    try

      with Fr_Dados do
      begin

        Writeln('Config FDConnection');
        FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );

        Writeln('Open FDConnection');
        FDConnection.Open;
        try

          FDScriptTFIS_NotaFiscal.Params[0].AsString := FormatDateTime( 'yyyymm', DateUtils.StartOfTheMonth(Now)-1 );

          Writeln( 'Apagando TFIS_NotaFiscal.' );
          FDScriptTFIS_NotaFiscal.ExecuteAll;

          Writeln( 'Abrindo Query' );
          FDQueryTFIS_NotaFiscal.Open;
          try

            Writeln('Looping pelas linhas');
            for I := dxSpreadSheet.ActiveSheetAsTable.Rows.FirstIndex+1 to dxSpreadSheet.ActiveSheetAsTable.Rows.LastIndex do
            begin

              if not Assigned(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[0]) then
                Continue;

              Writeln( 'Nota Fiscal (',I-1,'/',dxSpreadSheet.ActiveSheetAsTable.Rows.LastIndex-1,')' );

              varDATANF := dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnDATANF].AsDateTime;
              varCODCLIFOR := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnCODCLIFOR].AsString);
              varNUMNF := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnNUMNF].AsString);
              varCODPRODUTO := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnCODPRODUTO].AsString);
              varCFOP := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnCFOP].AsString);
              varVLRCONTABIL := dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnVLRCONTABIL].AsFloat;

              FDQueryTFIS_NotaFiscal.Append;
              FDQueryTFIS_NotaFiscalTFIS_NOTFISANOMES.AsString   := FormatDateTime( 'yyyymm', DateUtils.StartOfTheMonth(Now)-1 );
              FDQueryTFIS_NotaFiscalTFIS_NOTFISDATEMI.AsDateTime := varDATANF;
              FDQueryTFIS_NotaFiscalTFIS_NOTFISCLI.AsString      := varCODCLIFOR;
              FDQueryTFIS_NotaFiscalTFIS_NOTFISNUM.AsString      := varNUMNF;
              FDQueryTFIS_NotaFiscalTFIS_NOTFISITE.AsString      := varCODPRODUTO;
              FDQueryTFIS_NotaFiscalTFIS_NOTFISCFO.AsString      := varCFOP;
              FDQueryTFIS_NotaFiscalTFIS_NOTFISQTD.AsFloat       := 0.00;
              FDQueryTFIS_NotaFiscalTFIS_NOTFISVAL.AsFloat       := varVLRCONTABIL;
              FDQueryTFIS_NotaFiscal.Post;

            end;

          finally

            try

              Writeln( 'ApplyUpdates' );
              FDQueryTFIS_NotaFiscal.ApplyUpdates;

              Writeln( 'CommitUpdates' );
              FDQueryTFIS_NotaFiscal.CommitUpdates;

            except

              on E: Exception do
              begin

                Writeln( 'CommitUpdates: ', E.Message );

              end;

            end;

            FDQueryTFIS_NotaFiscal.Close;

          end;

        finally

          FDConnection.Close;

        end;

      end;

    finally

      FreeAndNil(Fr_Dados);

    end;

  finally

    FreeAndNil(dxSpreadSheet);

  end;

end;

procedure SplitExcelFileQV;
var
  XlApp, Sheet: Variant;
  MaxRow, MaxCol, HeaderRow, FooterRow, Y: integer;
  Str1, Str2: string;
  ArrData: Variant;
  ArNFEmissao: array of TDateTime;
  I: Integer;
  ExistsNFEmissao: Boolean;

begin

  Writeln('Inicio: ','SplitExcelFileQV');
  Try
      doSaveLog('C:\Brady\Files\SOP\Arquivos\Log\', 'Lendo Arquivo  ' +  FSearchRecord.Name );

      Str1 := StringReplace( 'C:\Brady\Files\SOP\Arquivos\Log\'+FSearchRecord.Name, '.xls', '_C.xls', [rfReplaceAll] );

      Writeln('Excel.Application');
      XLApp := CreateOleObject('Excel.Application');

      XLApp.DisplayAlerts := False;
      XLApp.Visible := False;

      Writeln('Abrindo planilha, ', Str1);
      XLApp.Workbooks.Open(Str1);

      Writeln('Abrindo Aba');
      Sheet := XLApp.WorkSheets[1];

      MaxRow := Sheet.Usedrange.EntireRow.Count;
      Writeln('Linhas: ',MaxRow);
      MaxCol := Sheet.Usedrange.EntireColumn.Count;
      Writeln('Colunas: ',MaxCol);

      Writeln('Lendo dados');
      ArrData := Sheet.UsedRange.Value;

      Writeln('Identificando linha header');
      HeaderRow := 0;
      for Y := 1 to MaxRow do
        if String(ArrData[Y, 1]).Trim.Equals('SoldTo Country') then
          HeaderRow := Y;
      Writeln('Linha header: ', HeaderRow);

      Writeln('Identificando linha footer');
      FooterRow := 0;
      for Y := 1 to MaxRow do
        if String(ArrData[Y, 1]).Trim.Equals('Selection Status:') then
          FooterRow := Y;
      Writeln('Linha footer: ', FooterRow);

      Writeln('Obtendo dias no arquivo');
      SetLength(ArNFEmissao,0);
      for Y := HeaderRow+1 to FooterRow-1 do
      begin

        ExistsNFEmissao := False;
        for I := Low(ArNFEmissao) to High(ArNFEmissao) do
        begin

          if ArrData[Y,32] = ArNFEmissao[I] then
            ExistsNFEmissao := True;

        end;

        if not ExistsNFEmissao then
        begin

          SetLength(ArNFEmissao, Length(ArNFEmissao)+1);
          ArNFEmissao[Length(ArNFEmissao)-1] := ArrData[Y,32];
          Writeln(FormatDateTime('dd/mm/yyyy', ArNFEmissao[Length(ArNFEmissao)-1]));

        end;

      end;

      Writeln('Apagando linhas');
      Sheet.Rows[IntToStr(FooterRow)+':'+IntToStr(FooterRow+10)].Delete;

      Writeln('Salvando planilha, ', Str1);
      XlApp.ActiveWorkBook.Save;

      Writeln('Fechando Workbook');
      XlApp.Workbooks.Close;

      Writeln('Fechando Excel');
      XlApp.Quit;

      Sheet := Unassigned;
      XlApp := Unassigned;

      for I := Low(ArNFEmissao) to High(ArNFEmissao) do
      begin

        Str2 := 'C:\Brady\Files\SOP\Dia\QV_INVOICE_' + FormatDateTime( 'yyyymmdd', ArNFEmissao[I] ) + '.xls';
        Writeln('Apagando planilha, ', Str2);
        DeleteFile(Str2);
        Writeln('Copiando planilha, ', Str1, ' : ', Str2);
        CopyFile( PWideChar(Str1), PWideChar(Str2), True );

        Writeln('Excel.Application');
        XLApp := CreateOleObject('Excel.Application');

        XLApp.DisplayAlerts := False;
        XLApp.Visible := False;

        Writeln('Abrindo planilha, ', Str2);
        XLApp.Workbooks.Open(Str2);

        Writeln('Abrindo Aba');
        Sheet := XLApp.WorkSheets[1];

        Writeln('Aplicando filtro');
        Sheet.Cells.AutoFilter(32, '<>'+FormatDateTime( 'dd/mm/yyyy', ArNFEmissao[I] ), $00000001 );
        //alterei de mm/dd/yyyy para dd/mm/yyyy para rodar o mes de outubro completo em 01/11/2017

        Writeln('Apagando linhas');
        Sheet.Rows['2:'+IntToStr(FooterRow-1)].Delete;

        Writeln('Salvando planilha, ', Str2);
        XlApp.ActiveWorkBook.Save;

        Writeln('Fechando Workbook');
        XlApp.Workbooks.Close;

        Writeln('Fechando Excel');
        XlApp.Quit;

        Sheet := Unassigned;
        XlApp := Unassigned;

      end;

      Str1 := StringReplace('C:\Brady\Files\SOP\Arquivos\'+FSearchRecord.Name, '.xls', '_C.xls', [rfReplaceAll] );
      Str2 := StringReplace('C:\Brady\Files\SOP\Original\'+FSearchRecord.Name, '.xls', '_C.xls', [rfReplaceAll] );

      Writeln('Apagando planilha, ', Str2);
      DeleteFile(Str2);
      Writeln('Copiando planilha convertida, ', Str1, ' : ', Str2);
      CopyFile( PWideChar(Str1), PWideChar(Str2), True );

      Writeln('Apagando Arquivo convertido, ', Str1);
      DeleteFile(Str1);

      Str1 := 'C:\Brady\Files\SOP\Arquivos\'+FSearchRecord.Name;
      Str2 := 'C:\Brady\Files\SOP\Original\'+FSearchRecord.Name;

      Writeln('Apagando planilha, ', Str2);
      DeleteFile(Str2);

      Writeln('Copiando planilha original, ', Str1, ' : ', Str2);
      CopyFile( PWideChar(Str1), PWideChar(Str2), True );

      Writeln('Apagando Arquivo original, ', Str1);
      DeleteFile(Str1);

      Writeln('Fim: ','SplitExcelFileQV');
      Writeln('');
  Except
    on E: Exception do
      begin

         doSaveLog('C:\Brady\Files\SOP\Arquivos\Log\', 'Erro ao Ler Arquivo ' +  e.Message );

      end;
  End;

end;

procedure SplitExcelFile;
var
  XlApp, Sheet: Variant;
  MaxRow, MaxCol, HeaderRow, FooterRow, Y: integer;
  Str1, Str2: string;
  ArrData: Variant;
  ArNFEmissao: array of TDateTime;
  I: Integer;
  ExistsNFEmissao: Boolean;

begin

  Writeln('Inicio: ','SplitExcelFile');

  Str1 := StringReplace( 'C:\Brady\Files\SOP\Arquivos\'+FSearchRecord.Name, '.xls', '_C.xls', [rfReplaceAll] );

  Writeln('Excel.Application');
  XLApp := CreateOleObject('Excel.Application');

  XLApp.DisplayAlerts := False;
  XLApp.Visible := False;

  Writeln('Abrindo planilha, ', Str1);
  XLApp.Workbooks.Open(Str1);

  Writeln('Abrindo Aba');
  Sheet := XLApp.WorkSheets[1];

  MaxRow := Sheet.Usedrange.EntireRow.Count;
  Writeln('Linhas: ',MaxRow);
  MaxCol := Sheet.Usedrange.EntireColumn.Count;
  Writeln('Colunas: ',MaxCol);

  Writeln('Lendo dados');
  ArrData := Sheet.UsedRange.Value;

  Writeln('Identificando linha header');
  HeaderRow := 0;
  for Y := 1 to MaxRow do
    if String(ArrData[Y, 1]).Trim.Equals('Calendar Day') then
      HeaderRow := Y;
  Writeln('Linha header: ', HeaderRow);

  Writeln('Identificando linha footer');
  FooterRow := 0;
  for Y := 1 to MaxRow do
    if String(ArrData[Y, 1]).Trim.Equals('Overall Result') then
      FooterRow := Y;
  Writeln('Linha footer: ', FooterRow);

  Writeln('Obtendo dias no arquivo');
  SetLength(ArNFEmissao,0);
  for Y := HeaderRow+1 to FooterRow-1 do
  begin

    ExistsNFEmissao := False;
    for I := Low(ArNFEmissao) to High(ArNFEmissao) do
    begin

      if ArrData[Y,1] = ArNFEmissao[I] then
        ExistsNFEmissao := True;

    end;

    if not ExistsNFEmissao then
    begin

      SetLength(ArNFEmissao, Length(ArNFEmissao)+1);
      ArNFEmissao[Length(ArNFEmissao)-1] := ArrData[Y,1];
      Writeln(FormatDateTime('dd/mm/yyyy', ArNFEmissao[Length(ArNFEmissao)-1]));

    end;

  end;

  Writeln('Apagando linhas');
  Sheet.Rows['1:'+IntToStr(HeaderRow-1)].Delete;

  Writeln('Salvando planilha, ', Str1);
  XlApp.ActiveWorkBook.Save;

  Writeln('Fechando Workbook');
  XlApp.Workbooks.Close;

  Writeln('Fechando Excel');
  XlApp.Quit;

  Sheet := Unassigned;
  XlApp := Unassigned;

  for I := Low(ArNFEmissao) to High(ArNFEmissao) do
  begin

    Str2 := 'C:\Brady\Files\SOP\Dia\BW_INVOICE_' + FormatDateTime( 'yyyymmdd', ArNFEmissao[I] ) + '.xls';
    Writeln('Apagando planilha, ', Str2);
    DeleteFile(Str2);
    Writeln('Copiando planilha, ', Str1, ' : ', Str2);
    CopyFile( PWideChar(Str1), PWideChar(Str2), True );

    Writeln('Excel.Application');
    XLApp := CreateOleObject('Excel.Application');

    XLApp.DisplayAlerts := False;
    XLApp.Visible := False;

    Writeln('Abrindo planilha, ', Str2);
    XLApp.Workbooks.Open(Str2);

    Writeln('Abrindo Aba');
    Sheet := XLApp.WorkSheets[1];

    Writeln('Aplicando filtro');
    Sheet.Cells.AutoFilter(1, '<>'+FormatDateTime( 'mm/dd/yyyy', ArNFEmissao[I] ), $00000001 );

    Writeln('Apagando linhas');
    Sheet.Rows['2:'+IntToStr(FooterRow-1)].Delete;

    Writeln('Salvando planilha, ', Str2);
    XlApp.ActiveWorkBook.Save;

    Writeln('Fechando Workbook');
    XlApp.Workbooks.Close;

    Writeln('Fechando Excel');
    XlApp.Quit;

    Sheet := Unassigned;
    XlApp := Unassigned;

  end;

  Str1 := StringReplace('C:\Brady\Files\SOP\Arquivos\'+FSearchRecord.Name, '.xls', '_C.xls', [rfReplaceAll] );
  Str2 := StringReplace('C:\Brady\Files\SOP\Original\'+FSearchRecord.Name, '.xls', '_C.xls', [rfReplaceAll] );

  Writeln('Apagando planilha, ', Str2);
  DeleteFile(Str2);
  Writeln('Copiando planilha convertida, ', Str1, ' : ', Str2);
  CopyFile( PWideChar(Str1), PWideChar(Str2), True );

  Writeln('Apagando Arquivo convertido, ', Str1);
  DeleteFile(Str1);

  Str1 := 'C:\Brady\Files\SOP\Arquivos\'+FSearchRecord.Name;
  Str2 := 'C:\Brady\Files\SOP\Original\'+FSearchRecord.Name;

  Writeln('Apagando planilha, ', Str2);
  DeleteFile(Str2);

  Writeln('Copiando planilha original, ', Str1, ' : ', Str2);
  CopyFile( PWideChar(Str1), PWideChar(Str2), True );

  Writeln('Apagando Arquivo original, ', Str1);
  DeleteFile(Str1);

  Writeln('Fim: ','SplitExcelFile');
  Writeln('');

end;

procedure ConvertExcelFile;
var
  XlApp: Variant;
  Str1, Str2: string;

begin

  Writeln('Inicio: ','ConvertExcelFile');
  Try
      doSaveLog('C:\Brady\Files\SOP\Arquivos\Log\', 'Convertendo Arquivo  ' +  FSearchRecord.Name );

      Str1 := 'C:\Brady\Files\SOP\Arquivos\'+FSearchRecord.Name;
      Str2 := StringReplace( 'C:\Brady\Files\SOP\Arquivos\Log\'+FSearchRecord.Name, '.xls', '_C.xls', [rfReplaceAll] );

      Writeln('Excel.Application');
      XLApp := CreateOleObject('Excel.Application');

      XLApp.DisplayAlerts := False;
      XLApp.Visible := False;

      Writeln('Abrindo planilha, ', Str1);
      XLApp.Workbooks.Open(Str1);

      Writeln('Apagando planilha, ', Str2);
      DeleteFile(Str2);

      Writeln('Salvando planilha, ', Str2);
      XlApp.ActiveWorkBook.SaveAs( Str2, 56 );

      Writeln('Fechando Workbook');
      XlApp.Workbooks.Close;

      Writeln('Fechando Excel');
      XlApp.Quit;

      XlApp := Unassigned;

      Writeln('Fim: ','ConvertExcelFile');
      Writeln('');
  Except
    on E: Exception do
      begin

         doSaveLog('C:\Brady\Files\SOP\Arquivos\Log\', 'Erro ao Converter Arquivo ' +  e.Message );

      end;
  End;

end;

procedure ProcessarArquivos;
var
  varFilesDia: TStringList;
  varFileVerificados: TStringList;
  varACBrNFe: TACBrNFe;
  varACBrMail: TACBrMail;
  varIndex: Integer;
  varCC: TStringList;

begin

  Writeln('Inicio: ','ProcessarArquivos');

  varFilesDia := TStringList.Create;
  varFileVerificados := TStringList.Create;
  varACBrNFe := TACBrNFe.Create(nil);
  varACBrMail := TACBrMail.Create(nil);
  varACBrNFe.MAIL := varACBrMail;
  varCC := TStringList.Create;
  try

    Writeln('Lendo arquivos verificados.');
    varFileVerificados.LoadFromFile( 'C:\Brady\Files\SOP\Verificados\Verificados.txt' );

    Writeln('Lista arquivos dia a dia.');
    if FindFirst('C:\Brady\Files\SOP\Dia\*.xls', faAnyFile-faDirectory, FSearchRecord) = 0 then
    begin

      repeat
        varFilesDia.Add( 'C:\Brady\Files\SOP\Dia\' + FSearchRecord.Name );
      until FindNext(FSearchRecord) <> 0;

    end;

    for varIndex := varFilesDia.Count-1 downto 0 do
    begin

      if varFileVerificados.IndexOf(ExtractFileName(varFilesDia[varIndex])) = -1 then
      begin

        Writeln('Apagando planilha, ', 'C:\Brady\Files\SOP\Arquivos\'+ExtractFileName(varFilesDia[varIndex]));
        DeleteFile('C:\Brady\Files\SOP\Arquivos\'+ExtractFileName(varFilesDia[varIndex]));

        Writeln('Copiando arquivo para processar. ', ExtractFileName(varFilesDia[varIndex]) );
        CopyFile( PWideChar(varFilesDia[varIndex]), PWideChar('C:\Brady\Files\SOP\Arquivos\'+ExtractFileName(varFilesDia[varIndex])), True );

      end
      else
      begin

        varFilesDia.Delete(varIndex);

      end;

    end;

    Writeln('Salvando Arquivo verificados');
    for varIndex := 0 to varFilesDia.Count-1 do
      varFileVerificados.Add(ExtractFileName(varFilesDia[varIndex]));

    varFileVerificados.SaveToFile( 'C:\Brady\Files\SOP\Verificados\Verificados.txt' );

    Writeln('Executando enable-AppSOP.bat');

    varFilesDia.Insert(0, 'Processado arquivo excel e encontrado os arquivos a seguir para importa��o:');

    varACBrMail.Clear;
    varACBrMail.Host := 'smtp.gmail.com';
    varACBrMail.Port := '465';
    varACBrMail.SetSSL := True;
    varACBrMail.SetTLS := false;

    varACBrMail.Username := 'suportebrasil@bradycorp.com';
    varACBrMail.Password := 'spUhurebRuF5';

    varACBrMail.From := 'suportebrasil@bradycorp.com';
    varACBrMail.FromName := 'Suporte Brasil';

    varACBrMail.AddAddress('LEANDRO_LOPES@BRADYCORP.COM', 'LEANDRO LOPES');
    varACBrMail.AddAddress('LUCIANA_PONTIERI@BRADYCORP.COM', 'LUCIANA PONTIERI');

    varACBrMail.Subject := 'S&OP XLS ' + FormatDateTime( 'dd/mm/yyyy', Now );
    varACBrMail.IsHTML := True;
    varACBrMail.AltBody.Text := varFilesDia.Text;

    try

      varACBrMail.Send;

    except

      on E: Exception do
      begin

        Writeln( E.Message );

      end;

    end;

  finally

    FreeAndNil(varFilesDia);
    FreeAndNil(varFileVerificados);
    FreeAndNil(varACBrNFe);
    FreeAndNil(varACBrMail);
    FreeAndNil(varCC);

  end;

  Writeln('Fim: ','ProcessarArquivos');

end;

procedure EnviarEmailValores;
var
  varBody: TStringList;
  varACBrNFe: TACBrNFe;
  varACBrMail: TACBrMail;
  I: TDateTime;
  X, Y: Integer;
  varTotal: array[0..2,1..12] of Extended;
  varQtd: array[0..2,1..12] of Integer;
  varDataInicial, varDataFinal: TDateTime;
  varCC: TStringList;

begin

  Writeln('Inicio: ','EnviarEmailValores');

  varBody := TStringList.Create;
  varACBrNFe := TACBrNFe.Create(nil);
  varACBrMail := TACBrMail.Create(nil);
  varACBrNFe.MAIL := varACBrMail;
  Writeln( 'Criando DataModule' );
  Fr_Dados := TFr_Dados.Create(nil);
  varCC := TStringList.Create;
  try

    with Fr_Dados do
    begin

      varDataInicial := StartOfTheMonth(EndOfTheMonth(EncodeDate( YearOf(Now)-2, MonthOf(Now), 1 ))+1);
      varDataFinal   := EndOfTheMonth(Now);

      Writeln('Config FDConnection');
      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );

      Writeln('Open FDConnection');
      FDConnection.Open;

      Writeln('Set FDQuery');
      FDQuery.SQL.Clear;
      FDQuery.SQL.Add(
        'SELECT TSOP_ORDBILDATDOC'#13#10+
        '      ,SUM(TSOP_ORDBILVALLIQ) AS TSOP_ORDBILVALLIQ'#13#10+
        '      ,SUM(CASE WHEN TSOP_ORDBILTIPDOC = ''Billing'' THEN 1 ELSE 0 END) AS TSOP_ORDBILQTDFAT'#13#10+
        'FROM VSOP_OrderBillingFull'#13#10+
        'WHERE TSOP_ORDBILTIPDOC IN (''Billing'',''Return'')'#13#10+
        '  AND TSOP_ORDBILDATDOC BETWEEN '''+FormatDateTime('yyyymmdd',varDataInicial)+''' AND '''+FormatDateTime('yyyymmdd',varDataFinal)+''''#13#10+
        'GROUP BY TSOP_ORDBILDATDOC'
      );

      Writeln('Open FDQuery');
      FDQuery.Open;

      varBody.Add( 'Segue abaixo valores processados para o mes corrente.' );

      varBody.Add( EmptyStr );
      varBody.Add( EmptyStr );

      I := varDataInicial;
      while I <= varDataFinal do
      begin

        Writeln('Mes: ', FormatDateTime('mmmmm yyyy', I));

        if FDQuery.Locate( 'TSOP_ORDBILDATDOC', I ) then
        begin

          varTotal[YearOf(Now)-YearOf(I)][MonthOf(I)] := varTotal[YearOf(Now)-YearOf(I)][MonthOf(I)] + FDQuery.FieldByName('TSOP_ORDBILVALLIQ').AsFloat;
          varQtd[YearOf(Now)-YearOf(I)][MonthOf(I)] := varQtd[YearOf(Now)-YearOf(I)][MonthOf(I)] + FDQuery.FieldByName('TSOP_ORDBILQTDFAT').AsInteger;

        end;

        I := I + 1;

      end;

      for X := 1 downto 0 do
      begin

        for Y := 1 to 12 do
        begin

          if varTotal[X][Y] > 0 then
            varBody.Add( FormatDateTime( 'mmmm yyyy', EncodeDate( YearOf(Now)-X, Y, 1 )) + ' : R$ ' + FormatFloat( '#,##0.00', varTotal[X][Y] ) + ' Qtd ( '+ IntToStr(varQtd[X][Y]) +' )' );

        end;

      end;

      varBody.Add( EmptyStr );
      varBody.Add( EmptyStr );

      I := StartOfTheMonth(StartOfTheMonth(Now)-1);
      while I <= EndOfTheMonth(Now) do
      begin

        Writeln('Dia: ', FormatDateTime('dd/mm/yyyy', I));

        if FDQuery.Locate( 'TSOP_ORDBILDATDOC', I ) then
        begin

          varBody.Add( FormatDateTime('dd/mm/yyyy', I) + ': R$ ' + FormatFloat( '#,##0.00', FDQuery.FieldByName('TSOP_ORDBILVALLIQ').AsFloat ) + ' Qtd ( '+ FDQuery.FieldByName('TSOP_ORDBILQTDFAT').AsString +' )' );

        end
        else
        begin

          varBody.Add( FormatDateTime('dd/mm/yyyy', I) + ': R$ N/D' );

        end;

        I := I + 1;

      end;

      varACBrMail.Clear;
      varACBrMail.Host := 'smtp.gmail.com';
      varACBrMail.Port := '465';
      varACBrMail.SetSSL := True;
      varACBrMail.SetTLS := False;

      varACBrMail.Username := 'suportebrasil@bradycorp.com';
      varACBrMail.Password := 'spUhurebRuF5';

      varACBrMail.From := 'suportebrasil@bradycorp.com';
      varACBrMail.FromName := 'Suporte Brasil';

      varACBrMail.AddAddress('LEANDRO_LOPES@BRADYCORP.COM', 'LEANDRO LOPES');
      varACBrMail.AddAddress('LUCIANA_PONTIERI@BRADYCORP.COM', 'LUCIANA PONTIERI');

      varACBrMail.Subject := 'S&OP R$ ' + FormatDateTime( 'dd/mm/yyyy', Now );
      varACBrMail.IsHTML := True;
      varACBrMail.AltBody.Text := varBody.Text;

      try

        varACBrMail.Send;

      except

        on E: Exception do
        begin

          Writeln( E.Message );

        end;

      end;

    end;

  finally

    FreeAndNil(Fr_Dados);
    FreeAndNil(varACBrNFe);
    FreeAndNil(varACBrMail);
    FreeAndNil(varBody);
    FreeAndNil(varCC);

  end;


  Writeln('Fim: ','EnviarEmailValores');

end;

procedure EnviarEmailQuantidade;
var
  varBody: TStringList;
  varACBrNFe: TACBrNFe;
  varACBrMail: TACBrMail;
  I: TDateTime;
  X, Y: Integer;
  varTotal: array[0..2,1..12] of Extended;
  varQtdTMB: array[0..2,1..12] of Integer;
  varQtdTMBDM: array[0..2,1..12] of Integer;
  varQtdMAN: array[0..2,1..12] of Integer;
  varDataInicial, varDataFinal: TDateTime;
  varCC: TStringList;
  varFound: Boolean;

begin

  Writeln('Inicio: ','EnviarEmailQuantidade');

  varBody := TStringList.Create;
  varACBrNFe := TACBrNFe.Create(nil);
  varACBrMail := TACBrMail.Create(nil);
  varACBrNFe.MAIL := varACBrMail;
  Writeln( 'Criando DataModule' );
  Fr_Dados := TFr_Dados.Create(nil);
  varCC := TStringList.Create;
  try

    with Fr_Dados do
    begin

      varDataInicial := StartOfTheMonth(EndOfTheMonth(EncodeDate( YearOf(Now)-2, MonthOf(Now), 1 ))+1);
      varDataFinal   := EndOfTheMonth(Now);

      Writeln('Config FDConnection');
      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );

      Writeln('Open FDConnection');
      FDConnection.Open;

      Writeln('Set FDQuery');
      FDQuery.SQL.Clear;
      FDQuery.SQL.Add(
        'SELECT TSOP_ORDBILDATDOC'#13#10+
        '      ,TSOP_ORDBILSITNOM'#13#10+
        '      ,CASE WHEN TSOP_ORDBILCANNOM = ''DM'' THEN ''DM'' ELSE ''OUTROS'' END AS TSOP_ORDBILCANNOM'#13#10+
        '      ,SUM(TSOP_ORDBILVALLIQ) AS TSOP_ORDBILVALLIQ'#13#10+
        '      ,SUM(CASE WHEN TSOP_ORDBILTIPDOC = ''Billing'' THEN 1 ELSE 0 END) AS TSOP_ORDBILQTDFAT'#13#10+
        'FROM VSOP_OrderBillingFull'#13#10+
        'WHERE TSOP_ORDBILTIPDOC IN (''Billing'',''Return'')'#13#10+
        '  AND TSOP_ORDBILDATDOC BETWEEN '''+FormatDateTime('yyyymmdd',varDataInicial)+''' AND '''+FormatDateTime('yyyymmdd',varDataFinal)+''''#13#10+
        'GROUP BY TSOP_ORDBILSITNOM,TSOP_ORDBILDATDOC'#13#10+
        '        ,CASE WHEN TSOP_ORDBILCANNOM = ''DM'' THEN ''DM'' ELSE ''OUTROS'' END'
      );

      Writeln('Open FDQuery');
      FDQuery.Open;

      varBody.Add( 'Segue abaixo valores processados para o mes corrente.' );

      varBody.Add( EmptyStr );
      varBody.Add( EmptyStr );

      I := varDataInicial;
      while I <= varDataFinal do
      begin

        Writeln('Mes: ', FormatDateTime('mmmmm yyyy', I));

        FDQuery.First;
        while FDQuery.LocateEx( 'TSOP_ORDBILDATDOC', I, [lxoFromCurrent] ) do
        begin

          varTotal[YearOf(Now)-YearOf(I)][MonthOf(I)] := varTotal[YearOf(Now)-YearOf(I)][MonthOf(I)] + FDQuery.FieldByName('TSOP_ORDBILVALLIQ').AsFloat;

          if FDQuery.FieldByName('TSOP_ORDBILSITNOM').AsString.ToUpper.Equals('MANAUS') then
            varQtdMAN[YearOf(Now)-YearOf(I)][MonthOf(I)] := varQtdMAN[YearOf(Now)-YearOf(I)][MonthOf(I)] + FDQuery.FieldByName('TSOP_ORDBILQTDFAT').AsInteger
          else
          if FDQuery.FieldByName('TSOP_ORDBILCANNOM').AsString.ToUpper.Equals('DM') then
            varQtdTMBDM[YearOf(Now)-YearOf(I)][MonthOf(I)] := varQtdTMBDM[YearOf(Now)-YearOf(I)][MonthOf(I)] + FDQuery.FieldByName('TSOP_ORDBILQTDFAT').AsInteger
          else
            varQtdTMB[YearOf(Now)-YearOf(I)][MonthOf(I)] := varQtdTMB[YearOf(Now)-YearOf(I)][MonthOf(I)] + FDQuery.FieldByName('TSOP_ORDBILQTDFAT').AsInteger;

        end;

        I := I + 1;

      end;

      for X := 1 downto 0 do
      begin

        for Y := 1 to 12 do
        begin

          if varTotal[X][Y] > 0 then
            varBody.Add( FormatDateTime( 'mmmm yyyy', EncodeDate( YearOf(Now)-X, Y, 1 )) + ' - Qtd MAN ( '+ IntToStr(varQtdMAN[X][Y]) +' )' + ' - Qtd TMB PID+DIST ( '+ IntToStr(varQtdTMB[X][Y]) +' )' + ' - Qtd TMB DM ( '+ IntToStr(varQtdTMBDM[X][Y]) +' )' );

        end;

      end;

      varBody.Add( EmptyStr );
      varBody.Add( EmptyStr );

      I := StartOfTheMonth(StartOfTheMonth(Now)-1);
      while I <= EndOfTheMonth(Now) do
      begin

        Writeln('Dia: ', FormatDateTime('dd/mm/yyyy', I));

        varFound := False;

        FDQuery.First;
        while FDQuery.LocateEx( 'TSOP_ORDBILDATDOC', I, [lxoFromCurrent] ) do
        begin

          if FDQuery.FieldByName('TSOP_ORDBILSITNOM').AsString.ToUpper.Equals('MANAUS') then
            varBody.Add( FormatDateTime('dd/mm/yyyy', I) + ': Qtd MAN ( '+ FDQuery.FieldByName('TSOP_ORDBILQTDFAT').AsString +' )' )
          else
          if FDQuery.FieldByName('TSOP_ORDBILCANNOM').AsString.ToUpper.Equals('DM') then
            varBody.Add( FormatDateTime('dd/mm/yyyy', I) + ': Qtd TMB DM ( '+ FDQuery.FieldByName('TSOP_ORDBILQTDFAT').AsString +' )' )
          else
            varBody.Add( FormatDateTime('dd/mm/yyyy', I) + ': Qtd TMB PID+DIST ( '+ FDQuery.FieldByName('TSOP_ORDBILQTDFAT').AsString +' )' );
          varFound := True;

        end;

        if not varFound then
        begin

          varBody.Add( FormatDateTime('dd/mm/yyyy', I) + ': R$ N/D' );

        end;

        I := I + 1;

      end;

      varACBrMail.Clear;
      varACBrMail.Host := 'smtp.gmail.com';
      varACBrMail.Port := '465';
      varACBrMail.SetSSL := True;
      varACBrMail.SetTLS := False;

      varACBrMail.Username := 'suportebrasil@bradycorp.com';
      varACBrMail.Password := 'spUhurebRuF5';

      varACBrMail.From := 'suportebrasil@bradycorp.com';
      varACBrMail.FromName := 'Suporte Brasil';


      FDQueryTSOP_EMAIL.Close;
      FDQueryTSOP_EMAIL.SQL.Clear;
      FDQueryTSOP_EMAIL.SQL.Add('Select TSOP_EMAIL From TSOP_EMAIL where TSOP_ATIVO = ''S'' AND');
      FDQueryTSOP_EMAIL.SQL.Add(' TSOP_PROGRAMA = ''SOP_EMAILQTDE''');
      FDQueryTSOP_EMAIL.Open;
      FDQueryTSOP_EMAIL.First;
      while not FDQueryTSOP_EMAIL.eof do
      begin
        varACBrMail.AddAddress(FDQueryTSOP_EMAIL.FieldByName('TSOP_EMAIL').AsString);
        FDQueryTSOP_EMAIL.Next;
      end;
      FDQueryTSOP_EMAIL.Close;

      {
      varACBrMail.AddAddress('MAYARA_RODRIGUES@BRADYCORP.COM', 'MAYARA RODRIGUES');
      varACBrMail.AddAddress('ALINE_MENDONCA@BRADYCORP.COM'  , 'ALINE MENDONCA');
      varACBrMail.AddAddress('ANA_SILVA@BRADYCORP.COM'       , 'ANA SILVA');
      varACBrMail.AddAddress('ALINE_HOFFMANN@BRADYCORP.COM'  , 'ALINE HOFFMANN');
      varACBrMail.AddAddress('CINTIA_SANTOS@BRADYCORP.COM'   , 'CINTIA SANTOS');
      varACBrMail.AddAddress('LEANDRO_LOPES@BRADYCORP.COM'   , 'LEANDRO LOPES');
      varACBrMail.AddAddress('LUCIANA_PONTIERI@BRADYCORP.COM', 'LUCIANA PONTIERI');
      varACBrMail.AddAddress('LEANDRO_LIMA@BRADYCORP.COM'    , 'LEANDRO LIMA');
      varACBrMail.AddAddress('GUSTAVO_COUTINHO@BRADYCORP.COM', 'GUSTAVO COUTINHO');
     // varACBrMail.AddAddress('EDUARDO_ANACLETO@BRADYCORP.COM', 'EDUARDO ANACLETO');
       }

      varACBrMail.Subject := 'S&OP R$ ' + FormatDateTime( 'dd/mm/yyyy', Now );
      varACBrMail.IsHTML := True;
      varACBrMail.AltBody.Text := varBody.Text;

      try

        varACBrMail.Send;

      except

        on E: Exception do
        begin

          Writeln( E.Message );

        end;

      end;

    end;

  finally

    FreeAndNil(Fr_Dados);
    FreeAndNil(varACBrNFe);
    FreeAndNil(varACBrMail);
    FreeAndNil(varBody);
    FreeAndNil(varCC);

  end;


  Writeln('Fim: ','EnviarEmailQuantidade');

end;

procedure UploadTXTPrecoCliente;
var
  varSIOP_002: TStringList;
  varInicial, varFinal: Integer;
  varCMD: AnsiString;
  I: Integer;

begin

  Writeln( 'Criando DataModule' );
  Fr_Dados := TFr_Dados.Create(nil);

  Writeln( 'Criando StringList' );
  varSIOP_002 := TStringList.Create;
  try

    with Fr_Dados do
    begin

      Writeln('Config FDConnection');
      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );

      Writeln( 'Open FDConnection' );
      FDConnection.Open;
      try

        Writeln( 'Abrindo arquivo C:\Brady\Files\SOP\Preco\BR-SIOP-002.txt' );
        varSIOP_002.LoadFromFile( 'C:\Brady\Files\SOP\Preco\BR-SIOP-002.txt' );

        Writeln( 'Removendo linhas' );
        for I := varSIOP_002.Count-1 downto 0 do
          if not (varSIOP_002[I].CountChar('|') = 5) then
            varSIOP_002.Delete(I);

        Writeln( 'Linha Inicial' );
        varInicial := StrToIntDef(ParamStr(2).Replace('-',''),0);

        if varInicial = 0 then
        begin

          Writeln( 'Apagando TSOP_ClienteSAP' );
          FDScriptTSOP_ClienteSAP.ExecuteAll;

          I := 1;
          while I <= varSIOP_002.Count-1 do
          begin

            varCMD := AnsiString( ParamStr(0)+ ' ' + '-preco_cliente -' + IntToStr(I) );

            Writeln( varCMD );
            WinExec( PAnsiChar(varCMD), 1 );
            Inc(I,2000);

          end;

        end
        else
        begin

          if ( varInicial + 1999 ) > (varSIOP_002.Count-1) then
            varFinal := varSIOP_002.Count-1
          else
            varFinal := varInicial + 1999;


          Writeln( 'Abrindo Query' );
          FDQueryTSOP_ClienteSAP.Open;
          try

            Writeln( 'Looping linhas' );
            for I := varInicial to varFinal do
            begin

              Writeln( 'Cliente (',I,'/',varFinal,'): ', varSIOP_002[I].Split(['|'])[2].Trim );

              FDQueryTSOP_ClienteSAP.Append;
              FDQueryTSOP_ClienteSAP.FieldByName('TSOP_CLISAPCLICOD').AsString := varSIOP_002[I].Split(['|'])[1].Trim;
              FDQueryTSOP_ClienteSAP.FieldByName('TSOP_USUCODCAD').AsInteger := 1;
              FDQueryTSOP_ClienteSAP.FieldByName('TSOP_CLISAPDATCAD').AsDateTime := Now;

              FDQueryTSOP_ClienteSAP.FieldByName('TSOP_USUCODALT').AsInteger := 1;
              FDQueryTSOP_ClienteSAP.FieldByName('TSOP_CLISAPDATALT').AsDateTime := Now;
              FDQueryTSOP_ClienteSAP.FieldByName('TSOP_CLISAPCLICGC').AsString := varSIOP_002[I].Split(['|'])[2].Trim;
              FDQueryTSOP_ClienteSAP.FieldByName('TSOP_CLISAPCLINOM').AsString := varSIOP_002[I].Split(['|'])[3].Trim;
              FDQueryTSOP_ClienteSAP.FieldByName('TSOP_CLISAPCLIPRE').AsString := varSIOP_002[I].Split(['|'])[4].Trim;
              FDQueryTSOP_ClienteSAP.FieldByName('TSOP_CLISAPCLIREG').AsString := varSIOP_002[I].Split(['|'])[5].Trim;

              try

                FDQueryTSOP_ClienteSAP.Post;

              except

                on E: Exception do
                begin

                  Writeln( 'Post: ', E.Message );
                  FDQueryTSOP_ClienteSAP.Cancel;

                end;

              end;

              if Frac(I / 100) = 0 then
              begin

                try

                  Writeln( 'ApplyUpdates' );
                  FDQueryTSOP_ClienteSAP.ApplyUpdates;

                  Writeln( 'CommitUpdates' );
                  FDQueryTSOP_ClienteSAP.CommitUpdates;

                except

                  on E: Exception do
                  begin

                    Writeln( 'CommitUpdates: ', E.Message );

                  end;

                end;

              end;

            end;

          finally

            try

              Writeln( 'ApplyUpdates' );
              FDQueryTSOP_ClienteSAP.ApplyUpdates;

              Writeln( 'CommitUpdates' );
              FDQueryTSOP_ClienteSAP.CommitUpdates;

            except

              on E: Exception do
              begin

                Writeln( 'CommitUpdates: ', E.Message );

              end;

            end;

            FDQueryTSOP_ClienteSAP.Close;

          end;

        end;

      finally

        FDConnection.Close;

      end;

    end;

  finally

    FreeAndNil(varSIOP_002);
    FreeAndNil(Fr_Dados);

  end;

end;

procedure UploadTXTPrecoClienteParceiro;
var
  varSIOP_007: TStringList;
  varInicial, varFinal: Integer;
  varCMD: AnsiString;
  I: Integer;

begin

  Writeln( 'Criando DataModule' );
  Fr_Dados := TFr_Dados.Create(nil);

  Writeln( 'Criando StringList' );
  varSIOP_007 := TStringList.Create;
  try

    with Fr_Dados do
    begin

      Writeln('Config FDConnection');
      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );

      Writeln( 'Open FDConnection' );
      FDConnection.Open;
      try

        Writeln( 'Abrindo arquivo C:\Brady\Files\SOP\Preco\BR-SIOP-007.txt' );
        varSIOP_007.LoadFromFile( 'C:\Brady\Files\SOP\Preco\BR-SIOP-007.txt' );

        Writeln( 'Removendo linhas' );
        for I := varSIOP_007.Count-1 downto 0 do
          if not (varSIOP_007[I].CountChar('|') = 2) then
            varSIOP_007.Delete(I);

        Writeln( 'Linha Inicial' );
        varInicial := StrToIntDef(ParamStr(2).Replace('-',''),0);

        if varInicial = 0 then
        begin

          Writeln( 'Apagando TSOP_ClienteParceiro' );
          FDScriptTSOP_ClienteParceiro.ExecuteAll;

          I := 1;
          while I <= varSIOP_007.Count-1 do
          begin

            varCMD := AnsiString( ParamStr(0)+ ' ' + '-preco_cliente_parceiro -' + IntToStr(I) );

            Writeln( varCMD );
            WinExec( PAnsiChar(varCMD), 1 );
            Inc(I,300);

          end;

        end
        else
        begin

          if ( varInicial + 299 ) > (varSIOP_007.Count-1) then
            varFinal := varSIOP_007.Count-1
          else
            varFinal := varInicial + 299;


          Writeln( 'Abrindo Query' );
          FDQueryTSOP_ClienteParceiro.Open;
          try

            Writeln( 'Looping linhas' );
            for I := varInicial to varFinal do
            begin

              Writeln( 'Cliente (',I,'/',varFinal,'): ', varSIOP_007[I].Split(['|'])[2].Trim );

              FDQueryTSOP_ClienteParceiro.Append;
              FDQueryTSOP_ClienteParceiro.FieldByName('TSOP_CLIPARCLICOD').AsString := varSIOP_007[I].Split(['|'])[1].Trim;
              FDQueryTSOP_ClienteParceiro.FieldByName('TSOP_CLIPARNUM').AsString := varSIOP_007[I].Split(['|'])[2].Trim;
              FDQueryTSOP_ClienteParceiro.FieldByName('TSOP_USUCODCAD').AsInteger := 1;
              FDQueryTSOP_ClienteParceiro.FieldByName('TSOP_CLIPARDATCAD').AsDateTime := Now;
              FDQueryTSOP_ClienteParceiro.FieldByName('TSOP_USUCODALT').AsInteger := 1;
              FDQueryTSOP_ClienteParceiro.FieldByName('TSOP_CLIPARDATALT').AsDateTime := Now;

              try

                FDQueryTSOP_ClienteParceiro.Post;

              except

                on E: Exception do
                begin

                  Writeln( 'Post: ', E.Message );
                  FDQueryTSOP_ClienteParceiro.Cancel;

                end;

              end;

              if Frac(I / 100) = 0 then
              begin

                try

                  Writeln( 'ApplyUpdates' );
                  FDQueryTSOP_ClienteParceiro.ApplyUpdates;

                  Writeln( 'CommitUpdates' );
                  FDQueryTSOP_ClienteParceiro.CommitUpdates;

                except

                  on E: Exception do
                  begin

                    Writeln( 'CommitUpdates: ', E.Message );

                  end;

                end;

              end;

            end;

          finally

            try

              Writeln( 'ApplyUpdates' );
              FDQueryTSOP_ClienteParceiro.ApplyUpdates;

              Writeln( 'CommitUpdates' );
              FDQueryTSOP_ClienteParceiro.CommitUpdates;

            except

              on E: Exception do
              begin

                Writeln( 'CommitUpdates: ', E.Message );

              end;

            end;

            FDQueryTSOP_ClienteParceiro.Close;

          end;

        end;

      finally

        FDConnection.Close;

      end;

    end;

  finally

    FreeAndNil(varSIOP_007);
    FreeAndNil(Fr_Dados);

  end;

end;

procedure UploadTXTPrecoItemCliente;
var
  varSIOP_001: TStringList;
  varInicial, varFinal: Integer;
  varCMD: AnsiString;
  I: Integer;

begin

  Writeln( 'Criando DataModule' );
  Fr_Dados := TFr_Dados.Create(nil);

  Writeln( 'Criando StringList' );
  varSIOP_001 := TStringList.Create;
  try

    with Fr_Dados do
    begin

      Writeln('Config FDConnection');
      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );

      Writeln( 'Open FDConnection' );
      FDConnection.Open;
      try

        Writeln( 'Abrindo arquivo C:\Brady\Files\SOP\Preco\BR-SIOP-001.txt' );
        varSIOP_001.LoadFromFile( 'C:\Brady\Files\SOP\Preco\BR-SIOP-001.txt' );

        Writeln( 'Removendo linhas' );
        for I := varSIOP_001.Count-1 downto 0 do
          if not (varSIOP_001[I].CountChar('|') = 4) then
            varSIOP_001.Delete(I);

        Writeln( 'Linha Inicial' );
        varInicial := StrToIntDef(ParamStr(2).Replace('-',''),0);

        if varInicial = 0 then
        begin

          Writeln( 'Apagando TSOP_ItemClienteSAP' );
          FDScriptTSOP_ItemClienteSAP.ExecuteAll;

          I := 1;
          while I <= varSIOP_001.Count-1 do
          begin

            varCMD := AnsiString( ParamStr(0)+ ' ' + '-preco_itemcliente -' + IntToStr(I) );

            Writeln( varCMD );
            WinExec( PAnsiChar(varCMD), 1 );
            Inc(I,300);

          end;

        end
        else
        begin

          if ( varInicial + 299 ) > (varSIOP_001.Count-1) then
            varFinal := varSIOP_001.Count-1
          else
            varFinal := varInicial + 299;


          Writeln( 'Abrindo Query' );
          FDQueryTSOP_ItemClienteSAP.Open;
          try

            Writeln( 'Looping linhas' );
            for I := varInicial to varFinal do
            begin

              Writeln( 'Item Cliente (',I,'/',varFinal,'): ', varSIOP_001[I].Split(['|'])[2].Trim );

              FDQueryTSOP_ItemClienteSAP.Append;
              FDQueryTSOP_ItemClienteSAP.FieldByName('TSOP_ORICOD').AsInteger := 1;
              FDQueryTSOP_ItemClienteSAP.FieldByName('TSOP_ITECLISAPCAN').AsString := varSIOP_001[I].Split(['|'])[1].Trim;
              FDQueryTSOP_ItemClienteSAP.FieldByName('TSOP_ITECLISAPCLICOD').AsString := varSIOP_001[I].Split(['|'])[2].Trim;
              FDQueryTSOP_ItemClienteSAP.FieldByName('TSOP_ITECLISAPITECOD').AsString := varSIOP_001[I].Split(['|'])[3].Trim;
              FDQueryTSOP_ItemClienteSAP.FieldByName('TSOP_USUCODCAD').AsInteger := 1;
              FDQueryTSOP_ItemClienteSAP.FieldByName('TSOP_ITECLISAPDATCAD').AsDateTime := Now;
              FDQueryTSOP_ItemClienteSAP.FieldByName('TSOP_USUCODALT').AsInteger := 1;
              FDQueryTSOP_ItemClienteSAP.FieldByName('TSOP_ITECLISAPDATALT').AsDateTime := Now;
              FDQueryTSOP_ItemClienteSAP.FieldByName('TSOP_ITECLISAPITECLICOD').AsString := varSIOP_001[I].Split(['|'])[4].Trim;

              try

                FDQueryTSOP_ItemClienteSAP.Post;

              except

                on E: Exception do
                begin

                  Writeln( 'Post: ', E.Message );
                  FDQueryTSOP_ItemClienteSAP.Cancel;

                end;

              end;

              if Frac(I / 100) = 0 then
              begin

                try

                  Writeln( 'ApplyUpdates' );
                  FDQueryTSOP_ItemClienteSAP.ApplyUpdates;

                  Writeln( 'CommitUpdates' );
                  FDQueryTSOP_ItemClienteSAP.CommitUpdates;

                except

                  on E: Exception do
                  begin

                    Writeln( 'CommitUpdates: ', E.Message );

                  end;

                end;

              end;

            end;

          finally

            try

              Writeln( 'ApplyUpdates' );
              FDQueryTSOP_ItemClienteSAP.ApplyUpdates;

              Writeln( 'CommitUpdates' );
              FDQueryTSOP_ItemClienteSAP.CommitUpdates;

            except

              on E: Exception do
              begin

                Writeln( 'CommitUpdates: ', E.Message );

              end;

            end;

            FDQueryTSOP_ItemClienteSAP.Close;

          end;

        end;

      finally

        FDConnection.Close;

      end;

    end;

  finally

    FreeAndNil(varSIOP_001);
    FreeAndNil(Fr_Dados);

  end;

end;

procedure UploadTXTPrecoZP00;
var
  varSIOP_003: TStringList;
  varInicial, varFinal: Integer;
  varCMD: AnsiString;
  I: Integer;

begin

  Writeln( 'Criando DataModule' );
  Fr_Dados := TFr_Dados.Create(nil);

  Writeln( 'Criando StringList' );
  varSIOP_003 := TStringList.Create;
  try

    with Fr_Dados do
    begin

      Writeln('Config FDConnection');
      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );

      Writeln( 'Open FDConnection' );
      FDConnection.Open;
      try

        Writeln( 'Abrindo arquivo C:\Brady\Files\SOP\Preco\BR-SIOP-003.txt' );
        varSIOP_003.LoadFromFile( 'C:\Brady\Files\SOP\Preco\BR-SIOP-003.txt' );

        Writeln( 'Removendo linhas' );
        for I := varSIOP_003.Count-1 downto 0 do
          if not (varSIOP_003[I].CountChar('|') = 11) then
            varSIOP_003.Delete(I);

        Writeln( 'Linha Inicial' );
        varInicial := StrToIntDef(ParamStr(2).Replace('-',''),0);

        if varInicial = 0 then
        begin

          Writeln( 'Apagando TSOP_ZP00' );
          FDScriptTSOP_ZP00.ExecuteAll;

          I := 1;
          while I <= varSIOP_003.Count-1 do
          begin

            varCMD := AnsiString( ParamStr(0)+ ' ' + '-preco_zp00 -' + IntToStr(I) );

            Writeln( varCMD );
            WinExec( PAnsiChar(varCMD), 1 );
            Inc(I,10000);

          end;

        end
        else
        begin

          if ( varInicial + 9999 ) > (varSIOP_003.Count-1) then
            varFinal := varSIOP_003.Count-1
          else
            varFinal := varInicial + 9999;


          Writeln( 'Abrindo Query' );
          FDQueryTSOP_ZP00.Open;
          try

            Writeln( 'Looping linhas' );
            for I := varInicial to varFinal do
            begin

              Writeln( 'ZP00 (',I,'/',varFinal,'): ', varSIOP_003[I].Split(['|'])[2].Trim );

              if (not varSIOP_003[I].Split(['|'])[2].Trim.IsEmpty) and (not varSIOP_003[I].Split(['|'])[3].Trim.Equals('per')) then
              begin

                FDQueryTSOP_ZP00.Append;
                FDQueryTSOP_ZP00.FieldByName('TSOP_ORICOD').AsInteger := 1;
                FDQueryTSOP_ZP00.FieldByName('TSOP_Z00CAN').AsString := varSIOP_003[I].Split(['|'])[1].Trim;
                FDQueryTSOP_ZP00.FieldByName('TSOP_Z00ITECOD').AsString := varSIOP_003[I].Split(['|'])[2].Trim;
                FDQueryTSOP_ZP00.FieldByName('TSOP_Z00PER').AsFloat := StrToFloat(varSIOP_003[I].Split(['|'])[3].Trim.Replace( ',', '', [rfReplaceAll] ).Replace( '.', FormatSettings.DecimalSeparator, [rfReplaceAll] ));

                FDQueryTSOP_ZP00.FieldByName('TSOP_Z00QTD').AsFloat := StrToFloatDef(varSIOP_003[I].Split(['|'])[4].Trim.Replace( ',', '', [rfReplaceAll] ).Replace( '.', FormatSettings.DecimalSeparator, [rfReplaceAll] ),0.00);
                if FDQueryTSOP_ZP00.FieldByName('TSOP_Z00QTD').AsFloat = 0 then
                  FDQueryTSOP_ZP00.FieldByName('TSOP_Z00QTD').AsFloat := 1;

                FDQueryTSOP_ZP00.FieldByName('TSOP_Z00VLF').AsFloat := StrToFloatDef(varSIOP_003[I].Split(['|'])[6].Trim.Replace( ',', '', [rfReplaceAll] ).Replace( '.', FormatSettings.DecimalSeparator, [rfReplaceAll] ),0.00);
                if FDQueryTSOP_ZP00.FieldByName('TSOP_Z00VLF').AsFloat = 0 then
                  FDQueryTSOP_ZP00.FieldByName('TSOP_Z00VLF').AsFloat := StrToFloatDef(varSIOP_003[I].Split(['|'])[10].Trim.Replace( ',', '', [rfReplaceAll] ).Replace( '.', FormatSettings.DecimalSeparator, [rfReplaceAll] ),0.00);

                FDQueryTSOP_ZP00.FieldByName('TSOP_Z00UOM').AsString := varSIOP_003[I].Split(['|'])[5].Trim;
                FDQueryTSOP_ZP00.FieldByName('TSOP_Z00DATINI').AsDateTime := EncodeDate( StrToInt(Copy(varSIOP_003[I].Split(['|'])[8],1,4)), StrToInt(Copy(varSIOP_003[I].Split(['|'])[8],5,2)), StrToInt(Copy(varSIOP_003[I].Split(['|'])[8],7,2)) );
                FDQueryTSOP_ZP00.FieldByName('TSOP_Z00DATFIM').AsDateTime := EncodeDate( StrToInt(Copy(varSIOP_003[I].Split(['|'])[9],1,4)), StrToInt(Copy(varSIOP_003[I].Split(['|'])[9],5,2)), StrToInt(Copy(varSIOP_003[I].Split(['|'])[9],7,2)) );
                FDQueryTSOP_ZP00.FieldByName('TSOP_USUCODCAD').AsInteger := 1;
                FDQueryTSOP_ZP00.FieldByName('TSOP_Z00DATCAD').AsDateTime := Now;
                FDQueryTSOP_ZP00.FieldByName('TSOP_USUCODALT').AsInteger := 1;
                FDQueryTSOP_ZP00.FieldByName('TSOP_Z00DATALT').AsDateTime := Now;

                try

                  FDQueryTSOP_ZP00.Post;

                except

                  on E: Exception do
                  begin

                    Writeln( 'Post: ', E.Message );
                    FDQueryTSOP_ZP00.Cancel;

                  end;

                end;

              end;

              if Frac(I / 5000) = 0 then
              begin

                try

                  Writeln( 'ApplyUpdates' );
                  FDQueryTSOP_ZP00.ApplyUpdates;

                  Writeln( 'CommitUpdates' );
                  FDQueryTSOP_ZP00.CommitUpdates;

                except

                  on E: Exception do
                  begin

                    Writeln( 'CommitUpdates: ', E.Message );

                  end;

                end;

              end;

            end;

          finally

            try

              Writeln( 'ApplyUpdates' );
              FDQueryTSOP_ZP00.ApplyUpdates;

              Writeln( 'CommitUpdates' );
              FDQueryTSOP_ZP00.CommitUpdates;

            except

              on E: Exception do
              begin

                Writeln( 'CommitUpdates: ', E.Message );

              end;

            end;

            FDQueryTSOP_ZP00.Close;

          end;

        end;

      finally

        FDConnection.Close;

      end;

    end;

  finally

    FreeAndNil(varSIOP_003);
    FreeAndNil(Fr_Dados);

  end;

end;

procedure UploadTXTPrecoA800;
var
  varSIOP_008: TStringList;
  varInicial, varFinal: Integer;
  varCMD: AnsiString;
  I: Integer;

begin

  Writeln( 'Criando DataModule' );
  Fr_Dados := TFr_Dados.Create(nil);

  Writeln( 'Criando StringList' );
  varSIOP_008 := TStringList.Create;
  try

    with Fr_Dados do
    begin

      Writeln('Config FDConnection');
      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );

      Writeln( 'Open FDConnection' );
      FDConnection.Open;
      try

        Writeln( 'Abrindo arquivo C:\Brady\Files\SOP\Preco\BR-SIOP-008.txt' );
        varSIOP_008.LoadFromFile( 'C:\Brady\Files\SOP\Preco\BR-SIOP-008.txt' );

        Writeln( 'Removendo linhas' );
        for I := varSIOP_008.Count-1 downto 0 do
          if not (varSIOP_008[I].CountChar('|') = 7) then
            varSIOP_008.Delete(I);

        Writeln( 'Linha Inicial' );
        varInicial := StrToIntDef(ParamStr(2).Replace('-',''),0);

        if varInicial = 0 then
        begin

          Writeln( 'Apagando TSOP_A800' );
          FDScriptTSOP_A800.ExecuteAll;

          I := 1;
          while I <= varSIOP_008.Count-1 do
          begin

            varCMD := AnsiString( ParamStr(0)+ ' ' + '-preco_a800 -' + IntToStr(I) );

            Writeln( varCMD );
            WinExec( PAnsiChar(varCMD), 1 );
            Inc(I,2000);

          end;

        end
        else
        begin

          if ( varInicial + 1999 ) > (varSIOP_008.Count-1) then
            varFinal := varSIOP_008.Count-1
          else
            varFinal := varInicial + 1999;


          Writeln( 'Abrindo Query' );
          FDQueryTSOP_A800.Open;
          try

            Writeln( 'Looping linhas' );
            for I := varInicial to varFinal do
            begin

              Writeln( 'A800 (',I,'/',varFinal,'): ', varSIOP_008[I].Split(['|'])[2].Trim );

              if not varSIOP_008[I].Split(['|'])[2].Trim.IsEmpty then
              begin

                FDQueryTSOP_A800.Append;
                FDQueryTSOP_A800.FieldByName('TSOP_ORICOD').AsInteger := 1;
                FDQueryTSOP_A800.FieldByName('TSOP_Z00CAN').AsString := varSIOP_008[I].Split(['|'])[1].Trim;
                FDQueryTSOP_A800.FieldByName('TSOP_Z00ITECOD').AsString := varSIOP_008[I].Split(['|'])[2].Trim;
                FDQueryTSOP_A800.FieldByName('TSOP_Z00PER').AsFloat := StrToFloat(varSIOP_008[I].Split(['|'])[3].Trim.Replace( ',', '', [rfReplaceAll] ).Replace( '.', FormatSettings.DecimalSeparator, [rfReplaceAll] ));
                FDQueryTSOP_A800.FieldByName('TSOP_Z00QTD').AsFloat := 1;
                FDQueryTSOP_A800.FieldByName('TSOP_Z00VLF').AsFloat := StrToFloat(varSIOP_008[I].Split(['|'])[4].Trim.Replace( ',', '', [rfReplaceAll] ).Replace( '.', FormatSettings.DecimalSeparator, [rfReplaceAll] ));

                FDQueryTSOP_A800.FieldByName('TSOP_Z00UOM').AsString := varSIOP_008[I].Split(['|'])[5].Trim;
                FDQueryTSOP_A800.FieldByName('TSOP_Z00DATINI').AsDateTime := EncodeDate( StrToInt(Copy(varSIOP_008[I].Split(['|'])[6],1,4)), StrToInt(Copy(varSIOP_008[I].Split(['|'])[6],5,2)), StrToInt(Copy(varSIOP_008[I].Split(['|'])[6],7,2)) );
                FDQueryTSOP_A800.FieldByName('TSOP_Z00DATFIM').AsDateTime := EncodeDate( StrToInt(Copy(varSIOP_008[I].Split(['|'])[7],1,4)), StrToInt(Copy(varSIOP_008[I].Split(['|'])[7],5,2)), StrToInt(Copy(varSIOP_008[I].Split(['|'])[7],7,2)) );
                FDQueryTSOP_A800.FieldByName('TSOP_USUCODCAD').AsInteger := 1;
                FDQueryTSOP_A800.FieldByName('TSOP_Z00DATCAD').AsDateTime := Now;
                FDQueryTSOP_A800.FieldByName('TSOP_USUCODALT').AsInteger := 1;
                FDQueryTSOP_A800.FieldByName('TSOP_Z00DATALT').AsDateTime := Now;

                try

                  FDQueryTSOP_A800.Post;

                except

                  on E: Exception do
                  begin

                    Writeln( 'Post: ', E.Message );
                    FDQueryTSOP_A800.Cancel;

                  end;

                end;

              end;

              if Frac(I / 500) = 0 then
              begin

                try

                  Writeln( 'ApplyUpdates' );
                  FDQueryTSOP_A800.ApplyUpdates;

                  Writeln( 'CommitUpdates' );
                  FDQueryTSOP_A800.CommitUpdates;

                except

                  on E: Exception do
                  begin

                    Writeln( 'CommitUpdates: ', E.Message );

                  end;

                end;

              end;

            end;

          finally

            try

              Writeln( 'ApplyUpdates' );
              FDQueryTSOP_A800.ApplyUpdates;

              Writeln( 'CommitUpdates' );
              FDQueryTSOP_A800.CommitUpdates;

            except

              on E: Exception do
              begin

                Writeln( 'CommitUpdates: ', E.Message );

              end;

            end;

            FDQueryTSOP_A800.Close;

          end;

        end;

      finally

        FDConnection.Close;

      end;

    end;

  finally

    FreeAndNil(varSIOP_008);
    FreeAndNil(Fr_Dados);

  end;

end;

procedure UploadTXTPrecoZD00;
var
  varSIOP_006: TStringList;
  varInicial, varFinal: Integer;
  varCMD: AnsiString;
  I: Integer;

begin

  Writeln( 'Criando DataModule' );
  Fr_Dados := TFr_Dados.Create(nil);

  Writeln( 'Criando StringList' );
  varSIOP_006 := TStringList.Create;
  try

    with Fr_Dados do
    begin

      Writeln('Config FDConnection');
      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );

      Writeln( 'Open FDConnection' );
      FDConnection.Open;
      try

        Writeln( 'Abrindo arquivo C:\Brady\Files\SOP\Preco\BR-SIOP-006.txt' );
        varSIOP_006.LoadFromFile( 'C:\Brady\Files\SOP\Preco\BR-SIOP-006.txt' );

        Writeln( 'Removendo linhas' );
        for I := varSIOP_006.Count-1 downto 0 do
          if not (varSIOP_006[I].CountChar('|') = 7) then
            varSIOP_006.Delete(I);

        Writeln( 'Linha Inicial' );
        varInicial := StrToIntDef(ParamStr(2).Replace('-',''),0);

        if varInicial = 0 then
        begin

          Writeln( 'Apagando TSOP_ZD00' );
          FDScriptTSOP_ZD00.ExecuteAll;

          I := 1;
          while I <= varSIOP_006.Count-1 do
          begin

            varCMD := AnsiString( ParamStr(0)+ ' ' + '-preco_zd00 -' + IntToStr(I) );

            Writeln( varCMD );
            WinExec( PAnsiChar(varCMD), 1 );
            Inc(I,300);

          end;

        end
        else
        begin

          if ( varInicial + 299 ) > (varSIOP_006.Count-1) then
            varFinal := varSIOP_006.Count-1
          else
            varFinal := varInicial + 299;


          Writeln( 'Abrindo Query' );
          FDQueryTSOP_ZD00.Open;
          try

            Writeln( 'Looping linhas' );
            for I := varInicial to varFinal do
            begin

              Writeln( 'ZD00 (',I,'/',varFinal,'): ', varSIOP_006[I].Split(['|'])[2].Trim );

              if not varSIOP_006[I].Split(['|'])[2].Trim.IsEmpty then
              begin

                FDQueryTSOP_ZD00.Append;
                FDQueryTSOP_ZD00.FieldByName('TSOP_ORICOD').AsInteger := 1;
                FDQueryTSOP_ZD00.FieldByName('TSOP_Z00CAN').AsString := varSIOP_006[I].Split(['|'])[1].Trim;
                FDQueryTSOP_ZD00.FieldByName('TSOP_Z000PARCOD').AsString := varSIOP_006[I].Split(['|'])[2].Trim;
                FDQueryTSOP_ZD00.FieldByName('TSOP_Z000GRUMER').AsString := varSIOP_006[I].Split(['|'])[3].Trim;
                FDQueryTSOP_ZD00.FieldByName('TSOP_Z00PER').AsFloat := StrToFloat(varSIOP_006[I].Split(['|'])[4].Trim.Replace( '-', '', [rfReplaceAll] ).Replace( ',', '', [rfReplaceAll] ).Replace( '.', FormatSettings.DecimalSeparator, [rfReplaceAll] )) / 10.00;
                FDQueryTSOP_ZD00.FieldByName('TSOP_Z00DATINI').AsDateTime := EncodeDate( StrToInt(Copy(varSIOP_006[I].Split(['|'])[6],1,4)), StrToInt(Copy(varSIOP_006[I].Split(['|'])[6],5,2)), StrToInt(Copy(varSIOP_006[I].Split(['|'])[6],7,2)) );
                FDQueryTSOP_ZD00.FieldByName('TSOP_Z00DATFIM').AsDateTime := EncodeDate( StrToInt(Copy(varSIOP_006[I].Split(['|'])[7],1,4)), StrToInt(Copy(varSIOP_006[I].Split(['|'])[7],5,2)), StrToInt(Copy(varSIOP_006[I].Split(['|'])[7],7,2)) );
                FDQueryTSOP_ZD00.FieldByName('TSOP_USUCODCAD').AsInteger := 1;
                FDQueryTSOP_ZD00.FieldByName('TSOP_Z00DATCAD').AsDateTime := Now;
                FDQueryTSOP_ZD00.FieldByName('TSOP_USUCODALT').AsInteger := 1;
                FDQueryTSOP_ZD00.FieldByName('TSOP_Z00DATALT').AsDateTime := Now;

                try

                  FDQueryTSOP_ZD00.Post;

                except

                  on E: Exception do
                  begin

                    Writeln( 'Post: ', E.Message );
                    FDQueryTSOP_ZD00.Cancel;

                  end;

                end;

              end;

              if Frac(I / 100) = 0 then
              begin

                try

                  Writeln( 'ApplyUpdates' );
                  FDQueryTSOP_ZD00.ApplyUpdates;

                  Writeln( 'CommitUpdates' );
                  FDQueryTSOP_ZD00.CommitUpdates;

                except

                  on E: Exception do
                  begin

                    Writeln( 'CommitUpdates: ', E.Message );

                  end;

                end;

              end;

            end;

          finally

            try

              Writeln( 'ApplyUpdates' );
              FDQueryTSOP_ZD00.ApplyUpdates;

              Writeln( 'CommitUpdates' );
              FDQueryTSOP_ZD00.CommitUpdates;

            except

              on E: Exception do
              begin

                Writeln( 'CommitUpdates: ', E.Message );

              end;

            end;

            FDQueryTSOP_ZD00.Close;

          end;

        end;

      finally

        FDConnection.Close;

      end;

    end;

  finally

    FreeAndNil(varSIOP_006);
    FreeAndNil(Fr_Dados);

  end;

end;

procedure UploadTXTPrecoZP05;
var
  varSIOP_004: TStringList;
  varInicial, varFinal: Integer;
  varCMD: AnsiString;
  I: Integer;

begin

  Writeln( 'Criando DataModule' );
  Fr_Dados := TFr_Dados.Create(nil);

  Writeln( 'Criando StringList' );
  varSIOP_004 := TStringList.Create;
  try

    with Fr_Dados do
    begin

      Writeln('Config FDConnection');
      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );

      Writeln( 'Open FDConnection' );
      FDConnection.Open;
      try

        Writeln( 'Abrindo arquivo C:\Brady\Files\SOP\Preco\BR-SIOP-004.txt' );
        varSIOP_004.LoadFromFile( 'C:\Brady\Files\SOP\Preco\BR-SIOP-004.txt' );

        Writeln( 'Removendo linhas' );
        for I := varSIOP_004.Count-1 downto 0 do
          if not (varSIOP_004[I].CountChar('|') = 10) then
            varSIOP_004.Delete(I);

        Writeln( 'Linha Inicial' );
        varInicial := StrToIntDef(ParamStr(2).Replace('-',''),0);

        if varInicial = 0 then
        begin

          Writeln( 'Apagando TSOP_ZP05' );
          FDScriptTSOP_ZP05.ExecuteAll;

          I := 1;
          while I <= varSIOP_004.Count-1 do
          begin

            varCMD := AnsiString( ParamStr(0)+ ' ' + '-preco_zp05 -' + IntToStr(I) );

            Writeln( varCMD );
            WinExec( PAnsiChar(varCMD), 1 );
            Inc(I,300);

          end;

        end
        else
        begin

          if ( varInicial + 299 ) > (varSIOP_004.Count-1) then
            varFinal := varSIOP_004.Count-1
          else
            varFinal := varInicial + 299;


          Writeln( 'Abrindo Query' );
          FDQueryTSOP_ZP05.Open;
          try

            Writeln( 'Looping linhas' );
            for I := varInicial to varFinal do
            begin

              Writeln( 'ZP05 (',I,'/',varFinal,'): ', varSIOP_004[I].Split(['|'])[2].Trim );
              Writeln( varSIOP_004[I][9] + '-' + varSIOP_004[I][10] );

              if not varSIOP_004[I].Split(['|'])[2].Trim.IsEmpty then
              begin

                FDQueryTSOP_ZP05.Append;
                FDQueryTSOP_ZP05.FieldByName('TSOP_ORICOD').AsInteger := 1;
                FDQueryTSOP_ZP05.FieldByName('TSOP_Z05CAN').AsString := varSIOP_004[I].Split(['|'])[1].Trim;
                FDQueryTSOP_ZP05.FieldByName('TSOP_Z05ITECOD').AsString := varSIOP_004[I].Split(['|'])[2].Trim;
                FDQueryTSOP_ZP05.FieldByName('TSOP_Z05CLICOD').AsString := varSIOP_004[I].Split(['|'])[3].Trim;
                FDQueryTSOP_ZP05.FieldByName('TSOP_Z05PER').AsFloat := StrToFloat(varSIOP_004[I].Split(['|'])[4].Trim.Replace( ',', '', [rfReplaceAll] ).Replace( '.', FormatSettings.DecimalSeparator, [rfReplaceAll] ));
                FDQueryTSOP_ZP05.FieldByName('TSOP_Z05QTD').AsFloat := StrToFloat(varSIOP_004[I].Split(['|'])[5].Trim.Replace( ',', '', [rfReplaceAll] ).Replace( '.', FormatSettings.DecimalSeparator, [rfReplaceAll] ));
                FDQueryTSOP_ZP05.FieldByName('TSOP_Z05VLF').AsFloat := StrToFloat(varSIOP_004[I].Split(['|'])[7].Trim.Replace( ',', '', [rfReplaceAll] ).Replace( '.', FormatSettings.DecimalSeparator, [rfReplaceAll] ));
                FDQueryTSOP_ZP05.FieldByName('TSOP_Z05UOM').AsString := varSIOP_004[I].Split(['|'])[6].Trim;
                FDQueryTSOP_ZP05.FieldByName('TSOP_Z05DATINI').AsDateTime := EncodeDate( StrToInt(Copy(varSIOP_004[I].Split(['|'])[9],1,4)), StrToInt(Copy(varSIOP_004[I].Split(['|'])[9],5,2)), StrToInt(Copy(varSIOP_004[I].Split(['|'])[9],7,2)) );
                FDQueryTSOP_ZP05.FieldByName('TSOP_Z05DATFIM').AsDateTime := EncodeDate( StrToInt(Copy(varSIOP_004[I].Split(['|'])[10],1,4)), StrToInt(Copy(varSIOP_004[I].Split(['|'])[10],5,2)), StrToInt(Copy(varSIOP_004[I].Split(['|'])[10],7,2)) );
                FDQueryTSOP_ZP05.FieldByName('TSOP_USUCODCAD').AsInteger := 1;
                FDQueryTSOP_ZP05.FieldByName('TSOP_Z05DATCAD').AsDateTime := Now;
                FDQueryTSOP_ZP05.FieldByName('TSOP_USUCODALT').AsInteger := 1;
                FDQueryTSOP_ZP05.FieldByName('TSOP_Z05DATALT').AsDateTime := Now;

                try

                  FDQueryTSOP_ZP05.Post;

                except

                  on E: Exception do
                  begin

                    Writeln( 'Post: ', E.Message );
                    FDQueryTSOP_ZP05.Cancel;

                  end;

                end;

              end;

              if Frac(I / 100) = 0 then
              begin

                try

                  Writeln( 'ApplyUpdates' );
                  FDQueryTSOP_ZP05.ApplyUpdates;

                  Writeln( 'CommitUpdates' );
                  FDQueryTSOP_ZP05.CommitUpdates;

                except

                  on E: Exception do
                  begin

                    Writeln( 'CommitUpdates: ', E.Message );

                  end;

                end;

              end;

            end;

          finally

            try

              Writeln( 'ApplyUpdates' );
              FDQueryTSOP_ZP05.ApplyUpdates;

              Writeln( 'CommitUpdates' );
              FDQueryTSOP_ZP05.CommitUpdates;

            except

              on E: Exception do
              begin

                Writeln( 'CommitUpdates: ', E.Message );

              end;

            end;

            FDQueryTSOP_ZP05.Close;

          end;

        end;

      finally

        FDConnection.Close;

      end;

    end;

  finally

    FreeAndNil(varSIOP_004);
    FreeAndNil(Fr_Dados);

  end;

end;

procedure UploadTXTItem;
var
  varSIOP_005: TStringList;
  varInicial, varFinal: Integer;
  varCMD: AnsiString;
  I: Integer;

begin

  Writeln( 'Criando DataModule' );
  Fr_Dados := TFr_Dados.Create(nil);

  Writeln( 'Criando StringList' );
  varSIOP_005 := TStringList.Create;
  try

    with Fr_Dados do
    begin

      Writeln('Config FDConnection');
      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );

      Writeln( 'Open FDConnection' );
      FDConnection.Open;
      try

        Writeln( 'Abrindo arquivo C:\Brady\Files\SOP\Preco\BR-SIOP-005.txt' );
        varSIOP_005.LoadFromFile( 'C:\Brady\Files\SOP\Preco\BR-SIOP-005.txt' );

        Writeln( 'Removendo linhas' );
        for I := varSIOP_005.Count-1 downto 0 do
          if not (varSIOP_005[I].CountChar('|') = 4) then
            varSIOP_005.Delete(I);

        Writeln( 'Linha Inicial' );
        varInicial := StrToIntDef(ParamStr(2).Replace('-',''),0);

        if varInicial = 0 then
        begin

          Writeln( 'Apagando TSOP_Item' );
          FDScriptTSOP_Item.ExecuteAll;

          I := 1;
          while I <= varSIOP_005.Count-1 do
          begin

            varCMD := AnsiString( ParamStr(0)+ ' ' + '-preco_item -' + IntToStr(I) );

            Writeln( varCMD );
            WinExec( PAnsiChar(varCMD), 1 );
            Inc(I,300);

          end;

        end
        else
        begin

          if ( varInicial + 299 ) > (varSIOP_005.Count-1) then
            varFinal := varSIOP_005.Count-1
          else
            varFinal := varInicial + 299;


          Writeln( 'Abrindo Query' );
          FDQueryTSOP_Item.Open;
          try

            Writeln( 'Looping linhas' );
            for I := varInicial to varFinal do
            begin

              Writeln( 'ZP00 (',I,'/',varFinal,'): ', varSIOP_005[I].Split(['|'])[2].Trim );

              if not varSIOP_005[I].Split(['|'])[2].Trim.IsEmpty then
              begin

                FDQueryTSOP_Item.Append;
                FDQueryTSOP_Item.FieldByName('TSOP_ORICOD').AsInteger := 1;
                FDQueryTSOP_Item.FieldByName('TSOP_ITECAN').AsString := varSIOP_005[I].Split(['|'])[2].Trim;
                FDQueryTSOP_Item.FieldByName('TSOP_ITEITECOD').AsString := varSIOP_005[I].Split(['|'])[1].Trim;
                FDQueryTSOP_Item.FieldByName('TSOP_ITEITENOM').AsString := varSIOP_005[I].Split(['|'])[3].Trim;
                FDQueryTSOP_Item.FieldByName('TSOP_ITEGRUMER').AsString := varSIOP_005[I].Split(['|'])[4].Trim;
                FDQueryTSOP_Item.FieldByName('TSOP_USUCODCAD').AsInteger := 1;
                FDQueryTSOP_Item.FieldByName('TSOP_ITEDATCAD').AsDateTime := Now;
                FDQueryTSOP_Item.FieldByName('TSOP_USUCODALT').AsInteger := 1;
                FDQueryTSOP_Item.FieldByName('TSOP_ITEDATALT').AsDateTime := Now;

                try

                  FDQueryTSOP_Item.Post;

                except

                  on E: Exception do
                  begin

                    Writeln( 'Post: ', E.Message );
                    FDQueryTSOP_Item.Cancel;

                  end;

                end;

              end;

              if Frac(I / 100) = 0 then
              begin

                try

                  Writeln( 'ApplyUpdates' );
                  FDQueryTSOP_Item.ApplyUpdates;

                  Writeln( 'CommitUpdates' );
                  FDQueryTSOP_Item.CommitUpdates;

                except

                  on E: Exception do
                  begin

                    Writeln( 'CommitUpdates: ', E.Message );

                  end;

                end;

              end;

            end;

          finally

            try

              Writeln( 'ApplyUpdates' );
              FDQueryTSOP_Item.ApplyUpdates;

              Writeln( 'CommitUpdates' );
              FDQueryTSOP_Item.CommitUpdates;

            except

              on E: Exception do
              begin

                Writeln( 'CommitUpdates: ', E.Message );

              end;

            end;

            FDQueryTSOP_Item.Close;

          end;

        end;

      finally

        FDConnection.Close;

      end;

    end;

  finally

    FreeAndNil(varSIOP_005);
    FreeAndNil(Fr_Dados);

  end;

end;

procedure Importar_NovosProdutos;
var
  I: Integer;

  dxSpreadSheet        : TdxSpreadSheet;
  varStringList        : TStringList;

  varColumnYNumber     : Integer;
  varColumnCatalogo    : Integer;
  varColumnUN          : Integer;
  varColumnQtde_Itens  : Integer;
  varColumnQtde_Minima : Integer;
  varColumnFamilia     : Integer;
  varColumnDescricao   : Integer;
  varColumnSug_Venda   : Integer;
  varColumnTabela_A    : Integer;
  varColumnTabela_B    : Integer;
  varColumnTabela_C    : Integer;
  varColumnTabela_D    : Integer;
  VarColumnImagem      : Integer;

  varTMKT_PROCOD       : Integer;
  varTMKT_PRECOD       : Integer;
  varYNumber           : String;
  varCatalogo          : String;
  varUN                : String;
  varQtde_Itens        : String;
  varQtde_Minima       : String;
  varFamilia           : String;
  varDescricao         : String;
  varSug_Venda         : Extended;
  varTabela_A          : Extended;
  varTabela_B          : Extended;
  varTabela_C          : Extended;
  varTabela_D          : Extended;
  varImagem            : String;

  varUltimaColuna      : Integer;

  procedure WritelnMail( varStr: String );
  var
    varACBrNFe: TACBrNFe;
    varACBrMail: TACBrMail;
    varMensagem: TStringList;
    varCC: TStringList;

  begin

    Writeln( varStr );

    varCC := TStringList.Create;
    varMensagem := TStringList.Create;
    varACBrNFe := TACBrNFe.Create(nil);
    varACBrMail := TACBrMail.Create(nil);
    varACBrNFe.MAIL := varACBrMail;
    try

      varMensagem.Add(MyDocumentsPath+'\'+FSearchRecord.Name);
      varMensagem.Add( varStr );

      varACBrMail.Clear;
      varACBrMail.Host := 'smtp.gmail.com';
      varACBrMail.Port := '465';
      varACBrMail.SetSSL := True;
      varACBrMail.SetTLS := False;

      varACBrMail.Username := 'suportebrasil@bradycorp.com';
      varACBrMail.Password := 'spUhurebRuF5';

      varACBrMail.From := 'suportebrasil@bradycorp.com';
      varACBrMail.FromName := 'SUPORTE BRASIL';
     // varACBrMail.AddAddress('crislaine_moniz@bradycorp.com','Crislaine Moniz');
     // varACBrMail.AddAddress('LEANDRO_LOPES@BRADYCORP.COM', 'LEANDRO LOPES');
      //varACBrMail.AddAddress('LUCIANA_PONTIERI@BRADYCORP.COM', 'LUCIANA PONTIERI');
      varACBrMail.AddAddress('marcos.jesus.external@k2partnering.com', 'Marcos');

      varACBrMail.Subject := '[PRODUTO J� CADASTRADO] IMPORT TABELA NOVOS PRODUTOS TMKT ' + FormatDateTime( 'dd/mm/yyyy', Now );
      varACBrMail.IsHTML := True;
      varACBrMail.AltBody.Text := varMensagem.Text;

      try

        varACBrMail.Send;

      except

        on E: Exception do
        begin

          Writeln( E.Message );

        end;

      end;

    finally

      FreeAndNil(varACBrNFe);
      FreeAndNil(varACBrMail);
      FreeAndNil(varMensagem);
      FreeAndNil(varCC);

    end;

  end;
begin
  Writeln('Inicio: ','Import Tabela Novos Produtos TMKT');

  Writeln('Apagando arquivo local. ', MyDocumentsPath+'\'+FSearchRecord.Name );
  DeleteFile(PWideChar(MyDocumentsPath+'\'+FSearchRecord.Name));

  Writeln('Copiando arquivo local. ', MyDocumentsPath+'\'+FSearchRecord.Name );
  CopyFile( PWideChar('C:\Brady\Files\SOP\TMKT\'+FSearchRecord.Name), PWideChar(MyDocumentsPath+'\'+FSearchRecord.Name), True );

  dxSpreadSheet := TdxSpreadSheet.Create(nil);
  try

    Writeln('Lendo Planilha ', MyDocumentsPath+'\'+FSearchRecord.Name);
    dxSpreadSheet.LoadFromFile( MyDocumentsPath+'\'+FSearchRecord.Name );

    varColumnYNumber     := -1;
    varColumnCatalogo    := -1;
    varColumnUN          := -1;
    varColumnQtde_Itens  := -1;
    varColumnQtde_Minima := -1;
    varColumnFamilia     := -1;
    varColumnDescricao   := -1;
    varColumnSug_Venda   := -1;
    varColumnTabela_A    := -1;
    varColumnTabela_B    := -1;
    varColumnTabela_C    := -1;
    varColumnTabela_D    := -1;
    VarColumnImagem      := -1;


    varUltimaColuna := 12;
    Writeln('Descobrindo Colunas');
    for I := dxSpreadSheet.ActiveSheetAsTable.Columns.FirstIndex to varUltimaColuna do
    begin

      if not  Assigned(dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0]) then
         Continue;

      if UpperCase(dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString) = 'YNUMBER' then
        varColumnYNumber := I;

      if UpperCase(dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString) = 'CATALOGO' then
        varColumnCatalogo := I;

      if UpperCase(dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString) = 'UN' then
        varColumnUN := I;

      if UpperCase(dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString) = 'QTDE_ITENS' then
        varColumnQtde_Itens := I;

      if UpperCase(dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString) = 'QTDE_MINIMA' then
        varColumnQtde_Minima := I;

      if UpperCase(dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString) = 'FAMILIA' then
        varColumnFamilia := I;

      if UpperCase(dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString) = 'DESCRICAO' then
        varColumnDescricao := I;

      if UpperCase(dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString) = 'SUG_VENDAS' then
        varColumnSug_Venda := I;

      if UpperCase(dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString) = 'TABELA_A' then
        varColumnTabela_A := I;

      if UpperCase(dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString) = 'TABELA_B' then
        varColumnTabela_B := I;

      if UpperCase(dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString) = 'TABELA_C' then
        varColumnTabela_C := I;

      if UpperCase(dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString) = 'TABELA_D' then
        varColumnTabela_D := I;

      if UpperCase(dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString) = 'IMAGEM' then
        VarColumnImagem := I;

    end;

    if varColumnYNumber = -1 then
      WritelnMail( 'Coluna (YNumber) n�o foi encontrada' );
    if varColumnCatalogo = -1 then
      WritelnMail( 'Coluna (Catalogo) n�o foi encontrada' );
    if varColumnUN = -1 then
      WritelnMail( 'Coluna (UN) n�o foi encontrada' );
    if varColumnQtde_Itens = -1 then
      WritelnMail( 'Coluna (Qtde_Itens) n�o foi encontrada' );
    if varColumnQtde_Minima = -1 then
      WritelnMail( 'Coluna (Qtde_Minima) n�o foi encontrada' );
    if varColumnFamilia = -1 then
      WritelnMail( 'Coluna (Familia) n�o foi encontrada' );
    if varColumnDescricao = -1 then
      WritelnMail( 'Coluna (Descricao) n�o foi encontrada' );
    if varColumnSug_Venda = -1 then
      WritelnMail( 'Coluna (Sug_Venda) n�o foi encontrada' );
    if varColumnTabela_A = -1 then
      WritelnMail( 'Coluna (Tabela_A) n�o foi encontrada' );
    if varColumnTabela_B = -1 then
      WritelnMail( 'Coluna (Tabela_B) n�o foi encontrada' );
    if varColumnTabela_C = -1 then
      WritelnMail( 'Coluna (Tabela_C) n�o foi encontrada' );
    if varColumnTabela_D = -1 then
      WritelnMail( 'Coluna (Tabela_D) n�o foi encontrada' );
    if VarColumnImagem = -1 then
      WritelnMail( 'Coluna (Imagem) n�o foi encontrada' );

    Writeln( 'Criando DataModule' );
    Fr_Dados := TFr_Dados.Create(nil);
    varStringList := TStringList.Create;
    try

      with Fr_Dados do
      begin

        Writeln('Config FDConnection');
        FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB-MySQL.ini' );

        Writeln('Open FDConnection');
        FDConnection.Open;
        try


            varStringList.Clear;
            Writeln('Looping pelas linhas');
            for I := dxSpreadSheet.ActiveSheetAsTable.Rows.FirstIndex+1 to dxSpreadSheet.ActiveSheetAsTable.Rows.LastIndex do
            begin

              if not  Assigned(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[0]) then
                Continue;


              Writeln( 'Linhas (',I-1,'/',dxSpreadSheet.ActiveSheetAsTable.Rows.LastIndex-1,')' );

              varYNumber     := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnYNumber].AsString);
              varCatalogo    := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnCatalogo].AsString);
              varUN          := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnUN].AsString);
              varQtde_Itens  := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnQtde_Itens].AsString);
              varQtde_Minima := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnQtde_Minima].AsString);
              varFamilia     := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnFamilia].AsString);
              varDescricao   := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnDescricao].AsString);

              varSug_Venda   := RoundTo(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnSug_Venda].AsFloat,-2);
              varTabela_A    := RoundTo(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnTabela_A].AsFloat,-2);
              varTabela_B    := RoundTo(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnTabela_B].AsFloat,-2);
              varTabela_C    := RoundTo(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnTabela_C].AsFloat,-2);
              varTabela_D    := RoundTo(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnTabela_D].AsFloat,-2);
              varImagem      := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[VarColumnImagem].AsString);

              varTMKT_PROCOD := -1;
              FDQueryConsultaPreco.Close;
              FDQueryConsultaPreco.SQL.Clear;
              FDQueryConsultaPreco.SQL.Add('Select  COALESCE(tmkt_procod ,0) as tmkt_procod From TMKT_PRODUTO where tmkt_procodsap = :tmkt_procodsap');
              FDQueryConsultaPreco.Params.ParamByName('tmkt_procodsap').AsString := varYNumber;
              FDQueryConsultaPreco.Open;
              varTMKT_PROCOD :=  FDQueryConsultaPreco.FieldByName('tmkt_procod').AsInteger;

              if varTMKT_PROCOD = 0 then
              begin

                 varTMKT_PROCOD := -1;
                 FDQueryConsultaPreco.Close;
                 FDQueryConsultaPreco.SQL.Clear;
                 FDQueryConsultaPreco.SQL.Add('SELECT MAX(TMKT_PROCOD)+1 AS TMKT_PROCOD  FROM TMKT_PRODUTO');
                 FDQueryConsultaPreco.Open;
                 varTMKT_PROCOD :=  FDQueryConsultaPreco.FieldByName('TMKT_PROCOD').AsInteger;

                 if varTMKT_PROCOD <> -1 then
                 begin

                     FDQueryGravaPreco.Close;
                     FDQueryGravaPreco.SQL.Clear;
                     FDQueryGravaPreco.SQL.Add('INSERT INTO TMKT_PRODUTO (TMKT_PROCOD,TMKT_PROCODSAP, TMKT_PROCODCAT, TMKT_PROCODAUX,');
                     FDQueryGravaPreco.SQL.Add('TMKT_PRODES, TMKT_PROIMG) VALUES (');
                     FDQueryGravaPreco.SQL.Add(':TMKT_PROCOD,:TMKT_PROCODSAP, :TMKT_PROCODCAT, :TMKT_PROCODAUX, :TMKT_PRODES, :TMKT_PROIMG) ');

                     FDQueryGravaPreco.Params.ParamByName('TMKT_PROCOD').AsInteger     := varTMKT_PROCOD;
                     FDQueryGravaPreco.Params.ParamByName('TMKT_PROCODSAP').AsString   := varYNumber;
                     FDQueryGravaPreco.Params.ParamByName('TMKT_PROCODCAT').AsString   := varCatalogo;
                     FDQueryGravaPreco.Params.ParamByName('TMKT_PROCODAUX').AsString   := varFamilia;
                     FDQueryGravaPreco.Params.ParamByName('TMKT_PRODES').AsString      := varDescricao;
                     FDQueryGravaPreco.Params.ParamByName('TMKT_PROIMG').AsString      := varImagem;
                     Try
                       FDQueryGravaPreco.ExecSQL;
                     except
                        on E: Exception do
                          begin

                            Writeln( 'Novo Produto: ', E.Message );

                          end;
                     End;


                     FDQueryConsultaPreco.Close;
                     FDQueryConsultaPreco.SQL.Clear;
                     FDQueryConsultaPreco.SQL.Add('SELECT MAX(TMKT_PRECOD)+1 AS TMKT_PRECOD  FROM TMKT_PRECO');
                     FDQueryConsultaPreco.Open;
                     varTMKT_PRECOD :=  FDQueryConsultaPreco.FieldByName('TMKT_PRECOD').AsInteger;


                     FDQueryGravaPreco.Close;
                     FDQueryGravaPreco.SQL.Clear;
                     FDQueryGravaPreco.SQL.Add('Insert Into TMKT_PRECO(TMKT_PRECOD,TMKT_PROCOD, TMKT_PRECAT, TMKT_PRELIQCOM, TMKT_PRESUGVEN, TMKT_PREQTDMIN) ');
                     FDQueryGravaPreco.SQL.Add('Values (:TMKT_PRECOD,:TMKT_PROCOD, :TMKT_PRECAT,  :TMKT_PRELIQCOM, :TMKT_PRESUGVEN, :TMKT_PREQTDMIN) ');
                     FDQueryGravaPreco.Params.ParamByName('TMKT_PRECOD').AsInteger    := varTMKT_PRECOD;
                     FDQueryGravaPreco.Params.ParamByName('TMKT_PROCOD').AsInteger    := varTMKT_PROCOD;
                     FDQueryGravaPreco.Params.ParamByName('TMKT_PRECAT').AsString     := 'A';
                     FDQueryGravaPreco.Params.ParamByName('TMKT_PRELIQCOM').AsFloat   := varTabela_A;
                     FDQueryGravaPreco.Params.ParamByName('TMKT_PRESUGVEN').AsFloat   := varSug_Venda;
                     FDQueryGravaPreco.Params.ParamByName('TMKT_PREQTDMIN').AsInteger := 1;

                     Try
                       FDQueryGravaPreco.ExecSQL;
                     except
                        on E: Exception do
                          begin

                            Writeln( 'Salvar Pre�o: ', E.Message );

                          end;
                     End;

                     FDQueryConsultaPreco.Close;
                     FDQueryConsultaPreco.SQL.Clear;
                     FDQueryConsultaPreco.SQL.Add('SELECT MAX(TMKT_PRECOD)+1 AS TMKT_PRECOD  FROM TMKT_PRECO');
                     FDQueryConsultaPreco.Open;
                     varTMKT_PRECOD :=  FDQueryConsultaPreco.FieldByName('TMKT_PRECOD').AsInteger;



                     FDQueryGravaPreco.Close;
                     FDQueryGravaPreco.SQL.Clear;
                     FDQueryGravaPreco.SQL.Add('Insert Into TMKT_PRECO(TMKT_PRECOD,TMKT_PROCOD, TMKT_PRECAT, TMKT_PRELIQCOM, TMKT_PRESUGVEN, TMKT_PREQTDMIN) ');
                     FDQueryGravaPreco.SQL.Add('Values (:TMKT_PRECOD,:TMKT_PROCOD, :TMKT_PRECAT,  :TMKT_PRELIQCOM, :TMKT_PRESUGVEN, :TMKT_PREQTDMIN) ');
                     FDQueryGravaPreco.Params.ParamByName('TMKT_PRECOD').AsInteger    := varTMKT_PRECOD;
                     FDQueryGravaPreco.Params.ParamByName('TMKT_PROCOD').AsInteger    := varTMKT_PROCOD;
                     FDQueryGravaPreco.Params.ParamByName('TMKT_PRECAT').AsString     := 'B';
                     FDQueryGravaPreco.Params.ParamByName('TMKT_PRELIQCOM').AsFloat   := varTabela_B;
                     FDQueryGravaPreco.Params.ParamByName('TMKT_PRESUGVEN').AsFloat   := varSug_Venda;
                     FDQueryGravaPreco.Params.ParamByName('TMKT_PREQTDMIN').AsInteger := 1;
                     Try
                       FDQueryGravaPreco.ExecSQL;
                     except
                        on E: Exception do
                          begin

                            Writeln( 'Salvar Pre�o: ', E.Message );

                          end;
                     End;

                     FDQueryConsultaPreco.Close;
                     FDQueryConsultaPreco.SQL.Clear;
                     FDQueryConsultaPreco.SQL.Add('SELECT MAX(TMKT_PRECOD)+1 AS TMKT_PRECOD  FROM TMKT_PRECO');
                     FDQueryConsultaPreco.Open;
                     varTMKT_PRECOD :=  FDQueryConsultaPreco.FieldByName('TMKT_PRECOD').AsInteger;



                     FDQueryGravaPreco.Close;
                     FDQueryGravaPreco.SQL.Clear;
                     FDQueryGravaPreco.SQL.Add('Insert Into TMKT_PRECO(TMKT_PRECOD,TMKT_PROCOD, TMKT_PRECAT, TMKT_PRELIQCOM, TMKT_PRESUGVEN, TMKT_PREQTDMIN) ');
                     FDQueryGravaPreco.SQL.Add('Values (:TMKT_PRECOD,:TMKT_PROCOD, :TMKT_PRECAT,  :TMKT_PRELIQCOM, :TMKT_PRESUGVEN, :TMKT_PREQTDMIN) ');
                     FDQueryGravaPreco.Params.ParamByName('TMKT_PRECOD').AsInteger  := varTMKT_PRECOD;
                     FDQueryGravaPreco.Params.ParamByName('TMKT_PROCOD').AsInteger  := varTMKT_PROCOD;
                     FDQueryGravaPreco.Params.ParamByName('TMKT_PRECAT').AsString   := 'C';
                     FDQueryGravaPreco.Params.ParamByName('TMKT_PRELIQCOM').AsFloat := varTabela_C;
                     FDQueryGravaPreco.Params.ParamByName('TMKT_PRESUGVEN').AsFloat := varSug_Venda;
                     FDQueryGravaPreco.Params.ParamByName('TMKT_PREQTDMIN').AsInteger := 1;
                     Try
                       FDQueryGravaPreco.ExecSQL;
                     except
                        on E: Exception do
                          begin

                            Writeln( 'Salvar Pre�o: ', E.Message );

                          end;
                     End;

                     FDQueryConsultaPreco.Close;
                     FDQueryConsultaPreco.SQL.Clear;
                     FDQueryConsultaPreco.SQL.Add('SELECT MAX(TMKT_PRECOD)+1 AS TMKT_PRECOD  FROM TMKT_PRECO');
                     FDQueryConsultaPreco.Open;
                     varTMKT_PRECOD :=  FDQueryConsultaPreco.FieldByName('TMKT_PRECOD').AsInteger;

                     FDQueryGravaPreco.Close;
                     FDQueryGravaPreco.SQL.Clear;
                     FDQueryGravaPreco.SQL.Add('Insert Into TMKT_PRECO(TMKT_PRECOD,TMKT_PROCOD, TMKT_PRECAT, TMKT_PRELIQCOM, TMKT_PRESUGVEN, TMKT_PREQTDMIN) ');
                     FDQueryGravaPreco.SQL.Add('Values (:TMKT_PRECOD,:TMKT_PROCOD, :TMKT_PRECAT,  :TMKT_PRELIQCOM, :TMKT_PRESUGVEN, :TMKT_PREQTDMIN) ');
                     FDQueryGravaPreco.Params.ParamByName('TMKT_PRECOD').AsInteger    := varTMKT_PRECOD;
                     FDQueryGravaPreco.Params.ParamByName('TMKT_PROCOD').AsInteger    := varTMKT_PROCOD;
                     FDQueryGravaPreco.Params.ParamByName('TMKT_PRECAT').AsString     := 'D';
                     FDQueryGravaPreco.Params.ParamByName('TMKT_PRELIQCOM').AsFloat   := varTabela_D;
                     FDQueryGravaPreco.Params.ParamByName('TMKT_PRESUGVEN').AsFloat   := varSug_Venda;
                     FDQueryGravaPreco.Params.ParamByName('TMKT_PREQTDMIN').AsInteger := 1;
                     Try
                       FDQueryGravaPreco.ExecSQL;
                     except
                        on E: Exception do
                          begin

                            Writeln( 'Salvar Pre�o: ', E.Message );

                          end;
                     End;
                 end;


              end
              else
              begin
                 varStringList.Add('YNumber: ' + varYNumber + ';Catalogo: ' + varCatalogo + ';Familia: ' + varFamilia + ';Descricao: ' + varDescricao);
              end;


            end;

            if varStringList.Count > 0 then
               WritelnMail(varStringList.Text);


        finally

          FDConnection.Close;

        end;

      end;

    finally

      FreeAndNil(Fr_Dados);

      FreeAndNil(varStringList);

    end;

  finally
    FreeAndNil(dxSpreadSheet);
  end;


end;


procedure Importar_TabelaPreco;
var
  I: Integer;

  dxSpreadSheet        : TdxSpreadSheet;
  varStringList        : TStringList;

  varColumnYNumber     : Integer;
  varColumnCatalogo    : Integer;
  varColumnUN          : Integer;
  varColumnQtde_Itens  : Integer;
  varColumnQtde_Minima : Integer;
  varColumnFamilia     : Integer;
  varColumnDescricao   : Integer;
  varColumnSug_Venda   : Integer;
  varColumnTabela_A    : Integer;
  varColumnTabela_B    : Integer;
  varColumnTabela_C    : Integer;
  varColumnTabela_D    : Integer;

  varTMKT_PROCOD       : Integer;
  varYNumber           : String;
  varCatalogo          : String;
  varUN                : String;
  varQtde_Itens        : String;
  varQtde_Minima       : String;
  varFamilia           : String;
  varDescricao         : String;
  varSug_Venda         : Extended;
  varTabela_A          : Extended;
  varTabela_B          : Extended;
  varTabela_C          : Extended;
  varTabela_D          : Extended;

  varUltimaColuna      : Integer;

  procedure WritelnMail( varStr: String );
  var
    varACBrNFe: TACBrNFe;
    varACBrMail: TACBrMail;
    varMensagem: TStringList;
    varCC: TStringList;

  begin

    Writeln( varStr );

    varCC := TStringList.Create;
    varMensagem := TStringList.Create;
    varACBrNFe := TACBrNFe.Create(nil);
    varACBrMail := TACBrMail.Create(nil);
    varACBrNFe.MAIL := varACBrMail;
    try

      varMensagem.Add(MyDocumentsPath+'\'+FSearchRecord.Name);
      varMensagem.Add( varStr );

      varACBrMail.Clear;
      varACBrMail.Host := 'smtp.gmail.com';
      varACBrMail.Port := '465';
      varACBrMail.SetSSL := True;
      varACBrMail.SetTLS := False;

      varACBrMail.Username := 'suportebrasil@bradycorp.com';
      varACBrMail.Password := 'spUhurebRuF5';

      varACBrMail.From := 'suportebrasil@bradycorp.com';
      varACBrMail.FromName := 'SUPORTE BRASIL';

     // varACBrMail.AddAddress('LEANDRO_LOPES@BRADYCORP.COM', 'LEANDRO LOPES');
      //varACBrMail.AddAddress('LUCIANA_PONTIERI@BRADYCORP.COM', 'LUCIANA PONTIERI');
      varACBrMail.AddAddress('marcos.jesus.external@k2partnering.com', 'Marcos');
      varACBrMail.Subject := '[PRODUTO N�O CADASTRADO] IMPORT TABELA PRECO TMKT ' + FormatDateTime( 'dd/mm/yyyy', Now );
      varACBrMail.IsHTML := True;
      varACBrMail.AltBody.Text := varMensagem.Text;

      try

        varACBrMail.Send;

      except

        on E: Exception do
        begin

          Writeln( E.Message );

        end;

      end;

    finally

      FreeAndNil(varACBrNFe);
      FreeAndNil(varACBrMail);
      FreeAndNil(varMensagem);
      FreeAndNil(varCC);

    end;

  end;


begin
  Writeln('Inicio: ','Import Tabela de Pre�o TMKT');

  Writeln('Apagando arquivo local. ', MyDocumentsPath+'\'+FSearchRecord.Name );
  DeleteFile(PWideChar(MyDocumentsPath+'\'+FSearchRecord.Name));

  Writeln('Copiando arquivo local. ', MyDocumentsPath+'\'+FSearchRecord.Name );
  CopyFile( PWideChar('C:\Brady\Files\SOP\TMKT\'+FSearchRecord.Name), PWideChar(MyDocumentsPath+'\'+FSearchRecord.Name), True );

  dxSpreadSheet := TdxSpreadSheet.Create(nil);
  try

    Writeln('Lendo Planilha ', MyDocumentsPath+'\'+FSearchRecord.Name);
    dxSpreadSheet.LoadFromFile( MyDocumentsPath+'\'+FSearchRecord.Name );

    varColumnYNumber     := -1;
    varColumnCatalogo    := -1;
    varColumnUN          := -1;
    varColumnQtde_Itens  := -1;
    varColumnQtde_Minima := -1;
    varColumnFamilia     := -1;
    varColumnDescricao   := -1;
    varColumnSug_Venda   := -1;
    varColumnTabela_A    := -1;
    varColumnTabela_B    := -1;
    varColumnTabela_C    := -1;
    varColumnTabela_D    := -1;


    varUltimaColuna := 11;
    Writeln('Descobrindo Colunas');
    for I := dxSpreadSheet.ActiveSheetAsTable.Columns.FirstIndex to varUltimaColuna do
    begin

      if not  Assigned(dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0]) then
         Continue;

      if UpperCase(dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString) = 'YNUMBER' then
        varColumnYNumber := I;

      if UpperCase(dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString) = 'CATALOGO' then
        varColumnCatalogo := I;

      if UpperCase(dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString) = 'UN' then
        varColumnUN := I;

      if UpperCase(dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString) = 'QTDE_ITENS' then
        varColumnQtde_Itens := I;

      if UpperCase(dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString) = 'QTDE_MINIMA' then
        varColumnQtde_Minima := I;

      if UpperCase(dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString) = 'FAMILIA' then
        varColumnFamilia := I;

      if UpperCase(dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString) = 'DESCRICAO' then
        varColumnDescricao := I;

      if UpperCase(dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString) = 'SUG_VENDAS' then
        varColumnSug_Venda := I;

      if UpperCase(dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString) = 'TABELA_A' then
        varColumnTabela_A := I;

      if UpperCase(dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString) = 'TABELA_B' then
        varColumnTabela_B := I;

      if UpperCase(dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString) = 'TABELA_C' then
        varColumnTabela_C := I;

      if UpperCase(dxSpreadSheet.ActiveSheetAsTable.Columns[I].Cells[0].AsString) = 'TABELA_D' then
        varColumnTabela_D := I;


    end;

    if varColumnYNumber = -1 then
      WritelnMail( 'Coluna (YNumber) n�o foi encontrada' );
    if varColumnCatalogo = -1 then
      WritelnMail( 'Coluna (Catalogo) n�o foi encontrada' );
    if varColumnUN = -1 then
      WritelnMail( 'Coluna (UN) n�o foi encontrada' );
    if varColumnQtde_Itens = -1 then
      WritelnMail( 'Coluna (Qtde_Itens) n�o foi encontrada' );
    if varColumnQtde_Minima = -1 then
      WritelnMail( 'Coluna (Qtde_Minima) n�o foi encontrada' );
    if varColumnFamilia = -1 then
      WritelnMail( 'Coluna (Familia) n�o foi encontrada' );
    if varColumnDescricao = -1 then
      WritelnMail( 'Coluna (Descricao) n�o foi encontrada' );
    if varColumnSug_Venda = -1 then
      WritelnMail( 'Coluna (Sug_Venda) n�o foi encontrada' );
    if varColumnTabela_A = -1 then
      WritelnMail( 'Coluna (Tabela_A) n�o foi encontrada' );
    if varColumnTabela_B = -1 then
      WritelnMail( 'Coluna (Tabela_B) n�o foi encontrada' );
    if varColumnTabela_C = -1 then
      WritelnMail( 'Coluna (Tabela_C) n�o foi encontrada' );
    if varColumnTabela_D = -1 then
      WritelnMail( 'Coluna (Tabela_D) n�o foi encontrada' );

    Writeln( 'Criando DataModule' );
    Fr_Dados := TFr_Dados.Create(nil);
    varStringList := TStringList.Create;
    try

      with Fr_Dados do
      begin

        Writeln('Config FDConnection');
        FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB-MySQL.ini' );

        Writeln('Open FDConnection');
        FDConnection.Open;
        try


            varStringList.Clear;
            Writeln('Looping pelas linhas');
            for I := dxSpreadSheet.ActiveSheetAsTable.Rows.FirstIndex+1 to dxSpreadSheet.ActiveSheetAsTable.Rows.LastIndex do
            begin

              Writeln( 'Linhas (',I-1,'/',dxSpreadSheet.ActiveSheetAsTable.Rows.LastIndex-1,')' );

              varYNumber     := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnYNumber].AsString);
              varCatalogo    := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnCatalogo].AsString);
              varUN          := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnUN].AsString);
              varQtde_Itens  := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnQtde_Itens].AsString);
              varQtde_Minima := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnQtde_Minima].AsString);
              varFamilia     := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnFamilia].AsString);
              varDescricao   := Trim(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnDescricao].AsString);

              varSug_Venda   := RoundTo(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnSug_Venda].AsFloat,-2);
              varTabela_A    := RoundTo(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnTabela_A].AsFloat,-2);
              varTabela_B    := RoundTo(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnTabela_B].AsFloat,-2);
              varTabela_C    := RoundTo(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnTabela_C].AsFloat,-2);
              varTabela_D    := RoundTo(dxSpreadSheet.ActiveSheetAsTable.Rows[I].Cells[varColumnTabela_D].AsFloat,-2);

              varTMKT_PROCOD := 0;
              FDQueryConsultaPreco.Close;
              FDQueryConsultaPreco.SQL.Clear;
              FDQueryConsultaPreco.SQL.Add('Select  tmkt_procod From TMKT_PRODUTO where tmkt_procodsap = :tmkt_procodsap');
              FDQueryConsultaPreco.Params.ParamByName('tmkt_procodsap').AsString := varYNumber;
              FDQueryConsultaPreco.Open;
              varTMKT_PROCOD :=  FDQueryConsultaPreco.FieldByName('tmkt_procod').AsInteger;

              if varTMKT_PROCOD <> 0 then
              begin
                 FDQueryGravaPreco.Close;
                 FDQueryGravaPreco.SQL.Clear;
                 FDQueryGravaPreco.SQL.Add('Update TMKT_PRECO');
                 FDQueryGravaPreco.SQL.Add('Set TMKT_PRELIQCOM = :TMKT_PRELIQCOM, TMKT_PRESUGVEN = :TMKT_PRESUGVEN');
                 FDQueryGravaPreco.SQL.Add('Where TMKT_PROCOD = :TMKT_PROCOD and TMKT_PRECAT = :TMKT_PRECAT');
                 FDQueryGravaPreco.Params.ParamByName('TMKT_PROCOD').AsInteger  := varTMKT_PROCOD;
                 FDQueryGravaPreco.Params.ParamByName('TMKT_PRECAT').AsString   := 'A';
                 FDQueryGravaPreco.Params.ParamByName('TMKT_PRELIQCOM').AsFloat := varTabela_A;
                 FDQueryGravaPreco.Params.ParamByName('TMKT_PRESUGVEN').AsFloat := varSug_Venda;

                 Try
                   FDQueryGravaPreco.ExecSQL;
                 except
                    on E: Exception do
                      begin

                        Writeln( 'Salvar Pre�o: ', E.Message );

                      end;
                 End;

                 FDQueryGravaPreco.Close;
                 FDQueryGravaPreco.SQL.Clear;
                 FDQueryGravaPreco.SQL.Add('Update TMKT_PRECO');
                 FDQueryGravaPreco.SQL.Add('Set TMKT_PRELIQCOM = :TMKT_PRELIQCOM, TMKT_PRESUGVEN = :TMKT_PRESUGVEN');
                 FDQueryGravaPreco.SQL.Add('Where TMKT_PROCOD = :TMKT_PROCOD and TMKT_PRECAT = :TMKT_PRECAT');
                 FDQueryGravaPreco.Params.ParamByName('TMKT_PROCOD').AsInteger  := varTMKT_PROCOD;
                 FDQueryGravaPreco.Params.ParamByName('TMKT_PRECAT').AsString   := 'B';
                 FDQueryGravaPreco.Params.ParamByName('TMKT_PRELIQCOM').AsFloat := varTabela_B;
                 FDQueryGravaPreco.Params.ParamByName('TMKT_PRESUGVEN').AsFloat := varSug_Venda;

                 Try
                   FDQueryGravaPreco.ExecSQL;
                 except
                    on E: Exception do
                      begin

                        Writeln( 'Salvar Pre�o: ', E.Message );

                      end;
                 End;

                 FDQueryGravaPreco.Close;
                 FDQueryGravaPreco.SQL.Clear;
                 FDQueryGravaPreco.SQL.Add('Update TMKT_PRECO');
                 FDQueryGravaPreco.SQL.Add('Set TMKT_PRELIQCOM = :TMKT_PRELIQCOM, TMKT_PRESUGVEN = :TMKT_PRESUGVEN');
                 FDQueryGravaPreco.SQL.Add('Where TMKT_PROCOD = :TMKT_PROCOD and TMKT_PRECAT = :TMKT_PRECAT');
                 FDQueryGravaPreco.Params.ParamByName('TMKT_PROCOD').AsInteger  := varTMKT_PROCOD;
                 FDQueryGravaPreco.Params.ParamByName('TMKT_PRECAT').AsString   := 'C';
                 FDQueryGravaPreco.Params.ParamByName('TMKT_PRELIQCOM').AsFloat := varTabela_C;
                 FDQueryGravaPreco.Params.ParamByName('TMKT_PRESUGVEN').AsFloat := varSug_Venda;

                 Try
                   FDQueryGravaPreco.ExecSQL;
                 except
                    on E: Exception do
                      begin

                        Writeln( 'Salvar Pre�o: ', E.Message );

                      end;
                 End;

                 FDQueryGravaPreco.Close;
                 FDQueryGravaPreco.SQL.Clear;
                 FDQueryGravaPreco.SQL.Add('Update TMKT_PRECO');
                 FDQueryGravaPreco.SQL.Add('Set TMKT_PRELIQCOM = :TMKT_PRELIQCOM, TMKT_PRESUGVEN = :TMKT_PRESUGVEN');
                 FDQueryGravaPreco.SQL.Add('Where TMKT_PROCOD = :TMKT_PROCOD and TMKT_PRECAT = :TMKT_PRECAT');
                 FDQueryGravaPreco.Params.ParamByName('TMKT_PROCOD').AsInteger  := varTMKT_PROCOD;
                 FDQueryGravaPreco.Params.ParamByName('TMKT_PRECAT').AsString   := 'D';
                 FDQueryGravaPreco.Params.ParamByName('TMKT_PRELIQCOM').AsFloat := varTabela_D;
                 FDQueryGravaPreco.Params.ParamByName('TMKT_PRESUGVEN').AsFloat := varSug_Venda;

                 Try
                   FDQueryGravaPreco.ExecSQL;
                 except
                    on E: Exception do
                      begin

                        Writeln( 'Salvar Pre�o: ', E.Message );

                      end;
                 End;


              end
              else
              begin
                 varStringList.Add('YNumber: ' + varYNumber + ';Catalogo: ' + varCatalogo + ';Familia: ' + varFamilia + ';Descricao: ' + varDescricao);
              end;


            end;

            if varStringList.Count > 0 then
               WritelnMail(varStringList.Text);


        finally

          FDConnection.Close;

        end;

      end;

    finally

      FreeAndNil(Fr_Dados);

      FreeAndNil(varStringList);

    end;

  finally
    FreeAndNil(dxSpreadSheet);
  end;
end;

procedure UploadTXTSaldoEstoque;
var
  varSIOP_009: TStringList;
  varSIOP_009B: TStringList;
  varSIOP_009C: TStringList;
  varInicial, varFinal: Integer;
  varCMD: AnsiString;
  I: Integer;

begin

  Writeln( 'Criando DataModule' );
  Fr_Dados := TFr_Dados.Create(nil);

  Writeln( 'Criando StringList' );
  varSIOP_009 := TStringList.Create;
  varSIOP_009B := TStringList.Create;
  varSIOP_009C := TStringList.Create;
  try

    with Fr_Dados do
    begin

      Writeln('Config FDConnection');
      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB-MySQL.ini' );

      Writeln( 'Open FDConnection' );
      FDConnection.Open;
      try

        Writeln( 'Abrindo arquivo C:\Brady\Files\SOP\Estoque\BR-SIOP-009.txt' );
        varSIOP_009.LoadFromFile( 'C:\Brady\Files\SOP\Estoque\BR-SIOP-009.txt' );

        Writeln( 'Abrindo arquivo C:\Brady\Files\SOP\Estoque\BR-SIOP-009B.txt' );
        varSIOP_009B.LoadFromFile( 'C:\Brady\Files\SOP\Estoque\BR-SIOP-009B.txt' );

        Writeln( 'Abrindo arquivo C:\Brady\Files\SOP\Estoque\BR-SIOP-009C.txt' );
        varSIOP_009C.LoadFromFile( 'C:\Brady\Files\SOP\Estoque\BR-SIOP-009C.txt' );

        Writeln( 'Removendo linhas' );
        for I := varSIOP_009.Count-1 downto 0 do
          if not (varSIOP_009[I].CountChar('|') = 9) then
            varSIOP_009.Delete(I);

        Writeln( 'Removendo linhas' );
        for I := varSIOP_009B.Count-1 downto 0 do
          if not (varSIOP_009B[I].CountChar('|') = 3) then
            varSIOP_009B.Delete(I);

        Writeln( 'Removendo linhas' );
        for I := varSIOP_009C.Count-1 downto 0 do
          if not (varSIOP_009C[I].CountChar('|') = 10) then
            varSIOP_009C.Delete(I);

        Writeln( 'Linha Inicial' );
        varInicial := StrToIntDef(ParamStr(2).Replace('-',''),0);

        if varInicial = 0 then
        begin

          Writeln( 'Apagando Saldo Estoque' );
          FDScriptSaldoEstoqueDelete.ExecuteAll;

          I := 1;
          while I <= varSIOP_009.Count-1 do
          begin

            varCMD := AnsiString( ParamStr(0)+ ' ' + '-saldo_estoque -' + IntToStr(I) );

            Writeln( varCMD );
            WinExec( PAnsiChar(varCMD), 1 );
            Inc(I,1000);

          end;

        end
        else
        begin

          if ( varInicial + 999 ) > (varSIOP_009.Count-1) then
            varFinal := varSIOP_009.Count-1
          else
            varFinal := varInicial + 999;

          Writeln( 'Abrindo Query (' + IntToStr(varInicial) + ')' );
          FDQuerySaldoEstoque.Open;
          try

            Writeln( 'Looping linhas (' + IntToStr(varInicial) + ')' );
            for I := varInicial to varFinal do
            begin

//              Writeln( 'Saldo Estoque (',I,'/',varFinal,'): ', varSIOP_009[I].Split(['|'])[2].Trim );

              if not varSIOP_009[I].Split(['|'])[2].Trim.IsEmpty then
              begin

                FDQuerySaldoEstoque.Append;
                FDQuerySaldoEstoque.FieldByName('catalogo').AsString    := varSIOP_009[I].Split(['|'])[2].Trim;
                FDQuerySaldoEstoque.FieldByName('ynumber').AsString     := varSIOP_009[I].Split(['|'])[1].Trim;
                FDQuerySaldoEstoque.FieldByName('descricao').AsString   := varSIOP_009[I].Split(['|'])[3].Trim;
                FDQuerySaldoEstoque.FieldByName('saldo').AsFloat        := StrToFloat('0'+varSIOP_009[I].Split(['|'])[4].Trim.Replace( ',', '', [rfReplaceAll] ).Replace( '.', FormatSettings.DecimalSeparator, [rfReplaceAll] ));
                FDQuerySaldoEstoque.FieldByName('validfrom').AsDateTime := EncodeDate( StrToInt(varSIOP_009[I].Split(['|'])[7].Trim.Substring(0,4)), StrToInt(varSIOP_009[I].Split(['|'])[7].Trim.Substring(4,2)), StrToInt(varSIOP_009[I].Split(['|'])[7].Trim.Substring(6,2)) );
                try

                  FDQuerySaldoEstoque.Post;

                except

                  on E: Exception do
                  begin

                    Writeln( 'Post: ', E.Message );
                    FDQuerySaldoEstoque.Cancel;

                  end;

                end;

              end;

              if (varSIOP_009B.Count-1 >= I) and (not varSIOP_009B[I].Split(['|'])[1].Trim.IsEmpty) then
              begin

                FDQuerySaldoEstoque.Append;
                FDQuerySaldoEstoque.FieldByName('catalogo').AsString := '';
                FDQuerySaldoEstoque.FieldByName('ynumber').AsString := varSIOP_009B[I].Split(['|'])[1].Trim;
                FDQuerySaldoEstoque.FieldByName('descricao').AsString := '';
                FDQuerySaldoEstoque.FieldByName('saldo').AsFloat := StrToFloat('-0'+varSIOP_009B[I].Split(['|'])[2].Trim.Replace( ',', '', [rfReplaceAll] ).Replace( '.', FormatSettings.DecimalSeparator, [rfReplaceAll] ));
                FDQuerySaldoEstoque.FieldByName('validfrom').AsDateTime  := EncodeDate (StrToInt ('2999'), StrToInt('12'), StrToInt('01'));

                try

                  FDQuerySaldoEstoque.Post;

                except

                  on E: Exception do
                  begin

                    Writeln( 'Post: ', E.Message );
                    FDQuerySaldoEstoque.Cancel;

                  end;

                end;

              end;

              if (varSIOP_009C.Count-1 >= I) and (not varSIOP_009C[I].Split(['|'])[6].Trim.IsEmpty) then
              begin

                FDQuerySaldoEstoque.Append;
                FDQuerySaldoEstoque.FieldByName('catalogo').AsString := '';
                FDQuerySaldoEstoque.FieldByName('ynumber').AsString := varSIOP_009C[I].Split(['|'])[6].Trim;
                FDQuerySaldoEstoque.FieldByName('descricao').AsString := '';
                FDQuerySaldoEstoque.FieldByName('saldo').AsFloat := StrToFloat('-0'+varSIOP_009C[I].Split(['|'])[8].Trim.Replace( ',', '', [rfReplaceAll] ).Replace( '.', FormatSettings.DecimalSeparator, [rfReplaceAll] ));
                FDQuerySaldoEstoque.FieldByName('validfrom').AsDateTime  := StrToDate('31/12/9999');
                try

                  FDQuerySaldoEstoque.Post;

                except

                  on E: Exception do
                  begin

                    Writeln( 'Post: ', E.Message );
                    FDQuerySaldoEstoque.Cancel;

                  end;

                end;

              end;

              if Frac(I / 100) = 0 then
              begin

                try

                  Writeln( 'ApplyUpdates 100 (' + IntToStr(varInicial) + ')' );
                  FDQuerySaldoEstoque.ApplyUpdates;

                  Writeln( 'CommitUpdates 100 (' + IntToStr(varInicial) + ')' );
                  FDQuerySaldoEstoque.CommitUpdates;

                except

                  on E: Exception do
                  begin

                    Writeln( 'CommitUpdates: ', E.Message );

                  end;

                end;

              end;

            end;

          finally

            try

              Writeln( 'ApplyUpdates Final (' + IntToStr(varInicial) + ')' );
              FDQuerySaldoEstoque.ApplyUpdates;

              Writeln( 'CommitUpdates Final (' + IntToStr(varInicial) + ')' );
              FDQuerySaldoEstoque.CommitUpdates;

//              Writeln( 'Update Saldo Estoque' );
//              FDScriptSaldoEstoqueUpdate.ExecuteAll;

            except

              on E: Exception do
              begin

                Writeln( 'CommitUpdates: ', E.Message );

              end;

            end;

            FDQuerySaldoEstoque.Close;

          end;

        end;

      finally

        FDConnection.Close;

      end;

    end;

  finally

    FreeAndNil(varSIOP_009);
    FreeAndNil(varSIOP_009B);
    FreeAndNil(varSIOP_009C);
    FreeAndNil(Fr_Dados);

  end;

end;

procedure UpdateSaldoEstoque;
var
  varSIOP_009: TStringList;
  varInicial, varFinal: Integer;
  varCMD: AnsiString;
  I: Integer;

begin

  Writeln( 'Criando DataModule' );
  Fr_Dados := TFr_Dados.Create(nil);
  try

    with Fr_Dados do
    begin

      Writeln('Config FDConnection');
      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB-MySQL.ini' );

      Writeln( 'Open FDConnection' );
      FDConnection.Open;
      try

        try

          Writeln( 'Update Saldo Estoque' );
          FDScriptSaldoEstoqueUpdate.ExecuteAll;

        except

          on E: Exception do
          begin

            Writeln( 'CommitUpdates: ', E.Message );

          end;

        end;

      finally

        FDConnection.Close;

      end;

    end;

  finally

    FreeAndNil(Fr_Dados);

  end;

end;

procedure UploadTXTEngBOM;
var
  varENG_001: TStringList;
  varInicial, varFinal: Integer;
  varCMD: AnsiString;
  I: Integer;

begin

  Writeln( 'Criando DataModule' );
  Fr_Dados := TFr_Dados.Create(nil);

  Writeln( 'Criando StringList' );
  varENG_001 := TStringList.Create;
  try

    with Fr_Dados do
    begin

      Writeln('Config FDConnection');
      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );

      Writeln( 'Open FDConnection' );
      FDConnection.Open;
      try

        Writeln( 'Abrindo arquivo C:\Brady\Files\ENG\BR-ENG-BOM.txt' );
        varENG_001.LoadFromFile( 'C:\Brady\Files\ENG\BR-ENG-BOM.txt' );
        varENG_001.Insert(0,StringOfChar('|',12));

        for I := varENG_001.Count-1 downto 0 do
        begin
          if not (varENG_001[I].CountChar('|') = 12) then
          begin
            Writeln( 'Linha Removida: ' + IntToStr(I) );
            varENG_001.Delete(I);
          end;
        end;

        Writeln( 'Linha Inicial' );
        varInicial := StrToIntDef(ParamStr(2).Replace('-',''),0);

        if varInicial = 0 then
        begin

          Writeln( 'Apagando TMAQ_ItemBOM' );
          FDScriptTMAQ_ItemBOM.ExecuteAll;

          I := 1;
          while I <= varENG_001.Count-1 do
          begin

            varCMD := AnsiString( ParamStr(0)+ ' ' + '-eng_bom -' + IntToStr(I) );

            Writeln( varCMD );
            WinExec( PAnsiChar(varCMD), 1 );
            Inc(I,1000);

          end;

        end
        else
        begin

          if ( varInicial + 999 ) > (varENG_001.Count-1) then
            varFinal := varENG_001.Count-1
          else
            varFinal := varInicial + 999;


          Writeln( 'Abrindo Query' );
          FDQueryTMAQ_ItemBOM.Open;
          try

            Writeln( 'Looping linhas' );
            for I := varInicial to varFinal do
            begin

              Writeln( 'BOM (',I,'/',varFinal,'): ', varENG_001[I].Split(['|'])[2].Trim );

              if varENG_001[I].Split(['|'])[1].Trim.Equals('1063') or varENG_001[I].Split(['|'])[1].Trim.Equals('1061') then
              begin

                FDQueryTMAQ_ItemBOM.Append;
                FDQueryTMAQ_ItemBOM.FieldByName('TMAQ_ITEBOMITECOD').AsString := varENG_001[I].Split(['|'])[2].Trim;
                FDQueryTMAQ_ItemBOM.FieldByName('TMAQ_ITEBOMSIT').AsString := varENG_001[I].Split(['|'])[1].Trim;
                FDQueryTMAQ_ItemBOM.FieldByName('TMAQ_ITEBOMITEMPRCOD').AsString := varENG_001[I].Split(['|'])[3].Trim;
                FDQueryTMAQ_ItemBOM.FieldByName('TMAQ_ITEBOMITEMTRTYP').AsString := varENG_001[I].Split(['|'])[4].Trim;

                FDQueryTMAQ_ItemBOM.FieldByName('TMAQ_ITEBOMITEMPRQTDBAS').AsFloat := StrToFloatDef(varENG_001[I].Split(['|'])[5].Trim.Replace( ',', '', [rfReplaceAll] ).Replace( '.', FormatSettings.DecimalSeparator, [rfReplaceAll] ),0);
                FDQueryTMAQ_ItemBOM.FieldByName('TMAQ_ITEBOMITEMPRQTD').AsFloat := StrToFloatDef(varENG_001[I].Split(['|'])[8].Trim.Replace( ',', '', [rfReplaceAll] ).Replace( '.', FormatSettings.DecimalSeparator, [rfReplaceAll] ).Replace( '-', '', [rfReplaceAll] ),0);
                if Pos( '-', varENG_001[I].Split(['|'])[8].Trim) > 0 then
                  FDQueryTMAQ_ItemBOM.FieldByName('TMAQ_ITEBOMITEMPRQTD').AsFloat := FDQueryTMAQ_ItemBOM.FieldByName('TMAQ_ITEBOMITEMPRQTD').AsFloat * -1;
                FDQueryTMAQ_ItemBOM.FieldByName('TMAQ_ITEBOMITEMPRQTD').AsFloat := FDQueryTMAQ_ItemBOM.FieldByName('TMAQ_ITEBOMITEMPRQTD').AsFloat + ( FDQueryTMAQ_ItemBOM.FieldByName('TMAQ_ITEBOMITEMPRQTD').AsFloat * StrToFloat(varENG_001[I].Split(['|'])[10].Trim.Replace( ',', '', [rfReplaceAll] ).Replace( '.', FormatSettings.DecimalSeparator, [rfReplaceAll] )) / 100.00 );
                FDQueryTMAQ_ItemBOM.FieldByName('TMAQ_ITEBOMITEMPRQTDREF').AsFloat := StrToFloatDef(varENG_001[I].Split(['|'])[10].Trim.Replace( ',', '', [rfReplaceAll] ).Replace( '.', FormatSettings.DecimalSeparator, [rfReplaceAll] ),0);

                FDQueryTMAQ_ItemBOM.FieldByName('TMAQ_ITEBOMITEMPRUOM').AsString := varENG_001[I].Split(['|'])[9].Trim;

                if varENG_001[I].Split(['|'])[7].Trim.ToUpper.Equals('X') then
                  FDQueryTMAQ_ItemBOM.FieldByName('TMAQ_ITEBOMITEMPRFIX').AsString := 'S'
                else
                  FDQueryTMAQ_ItemBOM.FieldByName('TMAQ_ITEBOMITEMPRFIX').AsString := 'N';

                if varENG_001[I].Split(['|'])[11].Trim.ToUpper.Equals('X') then
                  FDQueryTMAQ_ItemBOM.FieldByName('TMAQ_ITEBOMITEMPRCOSREL').AsString := 'S'
                else
                  FDQueryTMAQ_ItemBOM.FieldByName('TMAQ_ITEBOMITEMPRCOSREL').AsString := 'N';

                if (Length(varENG_001[I].Split(['|'])) >= 13) and varENG_001[I].Split(['|'])[12].Trim.ToUpper.Equals('X') then
                  FDQueryTMAQ_ItemBOM.FieldByName('TMAQ_ITEBOMITEMPRBUK').AsString := 'S'
                else
                  FDQueryTMAQ_ItemBOM.FieldByName('TMAQ_ITEBOMITEMPRBUK').AsString := 'N';

                FDQueryTMAQ_ItemBOM.FieldByName('TMAQ_ITEBOMDAT').AsDateTime := DateUtils.StartOfTheMonth(DateUtils.StartOfTheMonth(Now)-1);

                try

                  FDQueryTMAQ_ItemBOM.Post;

                except

                  on E: Exception do
                  begin

                    Writeln( 'Post: ', E.Message );
                    FDQueryTMAQ_ItemBOM.Cancel;

                  end;

                end;

              end;

              if Frac(I / 100) = 0 then
              begin

                try

                  Writeln( 'ApplyUpdates' );
                  FDQueryTMAQ_ItemBOM.ApplyUpdates;

                  Writeln( 'CommitUpdates' );
                  FDQueryTMAQ_ItemBOM.CommitUpdates;

                except

                  on E: Exception do
                  begin

                    Writeln( 'CommitUpdates: ', E.Message );

                  end;

                end;

              end;

            end;

          finally

            try

              Writeln( 'ApplyUpdates' );
              FDQueryTMAQ_ItemBOM.ApplyUpdates;

              Writeln( 'CommitUpdates' );
              FDQueryTMAQ_ItemBOM.CommitUpdates;

            except

              on E: Exception do
              begin

                Writeln( 'CommitUpdates: ', E.Message );

              end;

            end;

            FDQueryTMAQ_ItemBOM.Close;

          end;

        end;

      finally

        FDConnection.Close;

      end;

    end;

  finally

    FreeAndNil(varENG_001);
    FreeAndNil(Fr_Dados);

  end;

end;

procedure UploadTXTEngBOM2;
var
  varENG_001: TStringList;
  varInicial, varFinal: Integer;
  varCMD: AnsiString;
  I: Integer;

begin

  Writeln( 'Criando DataModule' );
  Fr_Dados := TFr_Dados.Create(nil);

  Writeln( 'Criando StringList' );
  varENG_001 := TStringList.Create;
  try

    with Fr_Dados do
    begin

      Writeln('Config FDConnection');
      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );

      Writeln( 'Open FDConnection' );
      FDConnection.Open;
      try

        Writeln( 'Abrindo arquivo C:\Brady\Files\ENG\BR-ENG-BOM2.txt' );
        varENG_001.LoadFromFile( 'C:\Brady\Files\ENG\BR-ENG-BOM2.txt' );
        varENG_001.Insert(0,StringOfChar('|',15));

        for I := varENG_001.Count-1 downto 0 do
        begin
          if not (varENG_001[I].CountChar('|') = 15) then
          begin
            Writeln( 'Linha Removida: ' + IntToStr(I) );
            varENG_001.Delete(I);
          end;
        end;

        Writeln( 'Linha Inicial' );
        varInicial := StrToIntDef(ParamStr(2).Replace('-',''),0);

        if varInicial = 0 then
        begin

          //Writeln( 'Apagando TMAQ_ItemBOM' );
          //FDScriptTMAQ_ItemBOM.ExecuteAll;

          I := 1;
          while I <= varENG_001.Count-1 do
          begin

            varCMD := AnsiString( ParamStr(0)+ ' ' + '-eng_bom2 -' + IntToStr(I) );

            Writeln( varCMD );
            WinExec( PAnsiChar(varCMD), 1 );
            Inc(I,1000);

          end;

        end
        else
        begin

          if ( varInicial + 999 ) > (varENG_001.Count-1) then
            varFinal := varENG_001.Count-1
          else
            varFinal := varInicial + 999;


          Writeln( 'Abrindo Query' );
          FDQueryTMAQ_ItemBOM.Open;
          try

            Writeln( 'Looping linhas' );
            for I := varInicial to varFinal do
            begin

              Writeln( 'BOM (',I,'/',varFinal,'): ', varENG_001[I].Split(['|'])[2].Trim );

              if varENG_001[I].Split(['|'])[1].Trim.Equals('1063') or varENG_001[I].Split(['|'])[1].Trim.Equals('1061') then
              begin

                FDQueryTMAQ_ItemBOM.Append;
                FDQueryTMAQ_ItemBOM.FieldByName('TMAQ_ITEBOMITECOD').AsString := varENG_001[I].Split(['|'])[2].Trim;
                FDQueryTMAQ_ItemBOM.FieldByName('TMAQ_ITEBOMSIT').AsString := varENG_001[I].Split(['|'])[1].Trim;
                FDQueryTMAQ_ItemBOM.FieldByName('TMAQ_ITEBOMITEMPRCOD').AsString := varENG_001[I].Split(['|'])[3].Trim;
                FDQueryTMAQ_ItemBOM.FieldByName('TMAQ_ITEBOMITEMTRTYP').AsString := varENG_001[I].Split(['|'])[4].Trim;

                FDQueryTMAQ_ItemBOM.FieldByName('TMAQ_ITEBOMORDPRO').AsString := varENG_001[I].Split(['|'])[13].Trim;
                FDQueryTMAQ_ItemBOM.FieldByName('TMAQ_ITEBOMSALORD').AsString := varENG_001[I].Split(['|'])[14].Trim;
                FDQueryTMAQ_ItemBOM.FieldByName('TMAQ_ITEBOMSALORDITE').AsInteger := StrToIntDef(varENG_001[I].Split(['|'])[15].Trim,0);


                FDQueryTMAQ_ItemBOM.FieldByName('TMAQ_ITEBOMITEMPRQTDBAS').AsFloat := StrToFloatDef(varENG_001[I].Split(['|'])[5].Trim.Replace( ',', '', [rfReplaceAll] ).Replace( '.', FormatSettings.DecimalSeparator, [rfReplaceAll] ),0);
                FDQueryTMAQ_ItemBOM.FieldByName('TMAQ_ITEBOMITEMPRQTD').AsFloat := StrToFloatDef(varENG_001[I].Split(['|'])[8].Trim.Replace( ',', '', [rfReplaceAll] ).Replace( '.', FormatSettings.DecimalSeparator, [rfReplaceAll] ),0);
                FDQueryTMAQ_ItemBOM.FieldByName('TMAQ_ITEBOMITEMPRQTD').AsFloat := FDQueryTMAQ_ItemBOM.FieldByName('TMAQ_ITEBOMITEMPRQTD').AsFloat + ( FDQueryTMAQ_ItemBOM.FieldByName('TMAQ_ITEBOMITEMPRQTD').AsFloat * StrToFloat(varENG_001[I].Split(['|'])[10].Trim.Replace( ',', '', [rfReplaceAll] ).Replace( '.', FormatSettings.DecimalSeparator, [rfReplaceAll] )) / 100.00 );
                FDQueryTMAQ_ItemBOM.FieldByName('TMAQ_ITEBOMITEMPRQTDREF').AsFloat := StrToFloatDef(varENG_001[I].Split(['|'])[10].Trim.Replace( ',', '', [rfReplaceAll] ).Replace( '.', FormatSettings.DecimalSeparator, [rfReplaceAll] ),0);

                FDQueryTMAQ_ItemBOM.FieldByName('TMAQ_ITEBOMITEMPRUOM').AsString := varENG_001[I].Split(['|'])[9].Trim;

                if varENG_001[I].Split(['|'])[7].Trim.ToUpper.Equals('X') then
                  FDQueryTMAQ_ItemBOM.FieldByName('TMAQ_ITEBOMITEMPRFIX').AsString := 'S'
                else
                  FDQueryTMAQ_ItemBOM.FieldByName('TMAQ_ITEBOMITEMPRFIX').AsString := 'N';

                if varENG_001[I].Split(['|'])[11].Trim.ToUpper.Equals('X') then
                  FDQueryTMAQ_ItemBOM.FieldByName('TMAQ_ITEBOMITEMPRCOSREL').AsString := 'S'
                else
                  FDQueryTMAQ_ItemBOM.FieldByName('TMAQ_ITEBOMITEMPRCOSREL').AsString := 'N';

                if (Length(varENG_001[I].Split(['|'])) >= 13) and varENG_001[I].Split(['|'])[12].Trim.ToUpper.Equals('X') then
                  FDQueryTMAQ_ItemBOM.FieldByName('TMAQ_ITEBOMITEMPRBUK').AsString := 'S'
                else
                  FDQueryTMAQ_ItemBOM.FieldByName('TMAQ_ITEBOMITEMPRBUK').AsString := 'N';

                FDQueryTMAQ_ItemBOM.FieldByName('TMAQ_ITEBOMDAT').AsDateTime := DateUtils.StartOfTheMonth(DateUtils.StartOfTheMonth(Now)-1);

                try

                  FDQueryTMAQ_ItemBOM.Post;

                except

                  on E: Exception do
                  begin

                    Writeln( 'Post: ', E.Message );
                    FDQueryTMAQ_ItemBOM.Cancel;

                  end;

                end;

              end;

              if Frac(I / 100) = 0 then
              begin

                try

                  Writeln( 'ApplyUpdates' );
                  FDQueryTMAQ_ItemBOM.ApplyUpdates;

                  Writeln( 'CommitUpdates' );
                  FDQueryTMAQ_ItemBOM.CommitUpdates;

                except

                  on E: Exception do
                  begin

                    Writeln( 'CommitUpdates: ', E.Message );

                  end;

                end;

              end;

            end;

          finally

            try

              Writeln( 'ApplyUpdates' );
              FDQueryTMAQ_ItemBOM.ApplyUpdates;

              Writeln( 'CommitUpdates' );
              FDQueryTMAQ_ItemBOM.CommitUpdates;

            except

              on E: Exception do
              begin

                Writeln( 'CommitUpdates: ', E.Message );

              end;

            end;

            FDQueryTMAQ_ItemBOM.Close;

          end;

        end;

      finally

        FDConnection.Close;

      end;

    end;

  finally

    FreeAndNil(varENG_001);
    FreeAndNil(Fr_Dados);

  end;

end;

procedure UploadTXTEngRouting;
var
  varENG_002: TStringList;
  varInicial, varFinal: Integer;
  varCMD: AnsiString;
  I: Integer;

  varMin01, varMin02, varMin03, varMin04, varMin05, varMin06: Extended;
  varMin01Str, varMin02Str, varMin03Str, varMin04Str, varMin05Str, varMin06Str: String;

begin

  Writeln( 'Criando DataModule' );
  Fr_Dados := TFr_Dados.Create(nil);

  Writeln( 'Criando StringList' );
  varENG_002 := TStringList.Create;
  try

    with Fr_Dados do
    begin

      Writeln('Config FDConnection');
      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );

      Writeln( 'Open FDConnection' );
      FDConnection.Open;
      try

        Writeln( 'Abrindo arquivo C:\Brady\Files\ENG\BR-ENG-ROUTING.txt' );
        varENG_002.LoadFromFile( 'C:\Brady\Files\ENG\BR-ENG-ROUTING.txt' );
        varENG_002.Insert(0,StringOfChar('|',37));

        Writeln( 'Removendo linhas' );
        for I := varENG_002.Count-1 downto 0 do
          if not (varENG_002[I].CountChar('|') = 37) then
            varENG_002.Delete(I);

        Writeln( 'Linha Inicial' );
        varInicial := StrToIntDef(ParamStr(2).Replace('-',''),0);

        if varInicial = 0 then
        begin

          Writeln( 'Apagando TMAQ_ItemRouting' );
          FDScriptTMAQ_ItemRouting.ExecuteAll;

          I := 1;
          while I <= varENG_002.Count-1 do
          begin

            varCMD := AnsiString( ParamStr(0)+ ' ' + '-eng_routing -' + IntToStr(I) );

            Writeln( varCMD );
            WinExec( PAnsiChar(varCMD), 1 );
            Inc(I,1000);

          end;

        end
        else
        begin

          if ( varInicial + 999 ) > (varENG_002.Count-1) then
            varFinal := varENG_002.Count-1
          else
            varFinal := varInicial + 999;


          Writeln( 'Abrindo Query' );
          FDQueryTMAQ_ItemRouting.Open;
          try

            Writeln( 'Looping linhas' );
            for I := varInicial to varFinal do
            begin

              Writeln( 'Routing (',I,'/',varFinal,'): ', varENG_002[I].Split(['|'])[1].Trim );

              if not varENG_002[I].Split(['|'])[1].Trim.IsEmpty then
              begin

                FDQueryTMAQ_ItemRouting.Append;

                FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUSIT').AsString := varENG_002[I].Split(['|'])[2].Trim;
                FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUITECOD').AsString := varENG_002[I].Split(['|'])[1].Trim;
                FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUDATINI').AsDateTime := EncodeDate( StrToInt(Copy(varENG_002[I].Split(['|'])[35].Trim,1,4)), StrToInt(Copy(varENG_002[I].Split(['|'])[35].Trim,5,2)), StrToInt(Copy(varENG_002[I].Split(['|'])[35].Trim,7,2)) );
                FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUWKCCOD').AsString := varENG_002[I].Split(['|'])[7].Trim;
                FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUCCU').AsString := varENG_002[I].Split(['|'])[34].Trim;
                FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUCTR').AsString := varENG_002[I].Split(['|'])[5].Trim;
                FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUOPE').AsInteger := StrToInt(varENG_002[I].Split(['|'])[4].Trim);
                FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUTXT').AsString := varENG_002[I].Split(['|'])[6].Trim;
                FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUQTDBAS').AsFloat := StrToFloat(varENG_002[I].Split(['|'])[11].Trim.Replace( ',', '', [rfReplaceAll] ).Replace( '.', FormatSettings.DecimalSeparator, [rfReplaceAll] ));

                varMin01Str := varENG_002[I].Split(['|'])[13].Trim;
                varMin02Str := varENG_002[I].Split(['|'])[16].Trim;
                varMin03Str := varENG_002[I].Split(['|'])[19].Trim;
                varMin04Str := varENG_002[I].Split(['|'])[22].Trim;
                varMin05Str := varENG_002[I].Split(['|'])[465].Trim;
                varMin06Str := varENG_002[I].Split(['|'])[28].Trim;

                varMin01 := StrToFloat(varENG_002[I].Split(['|'])[14].Trim.Replace( ',', '', [rfReplaceAll] ).Replace( '.', FormatSettings.DecimalSeparator, [rfReplaceAll] ));
                varMin02 := StrToFloat(varENG_002[I].Split(['|'])[17].Trim.Replace( ',', '', [rfReplaceAll] ).Replace( '.', FormatSettings.DecimalSeparator, [rfReplaceAll] ));
                varMin03 := StrToFloat(varENG_002[I].Split(['|'])[20].Trim.Replace( ',', '', [rfReplaceAll] ).Replace( '.', FormatSettings.DecimalSeparator, [rfReplaceAll] ));
                varMin04 := StrToFloat(varENG_002[I].Split(['|'])[23].Trim.Replace( ',', '', [rfReplaceAll] ).Replace( '.', FormatSettings.DecimalSeparator, [rfReplaceAll] ));
                varMin05 := StrToFloat(varENG_002[I].Split(['|'])[26].Trim.Replace( ',', '', [rfReplaceAll] ).Replace( '.', FormatSettings.DecimalSeparator, [rfReplaceAll] ));
                varMin06 := StrToFloat(varENG_002[I].Split(['|'])[29].Trim.Replace( ',', '', [rfReplaceAll] ).Replace( '.', FormatSettings.DecimalSeparator, [rfReplaceAll] ));

                FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINSEP').AsFloat := 0.00;
                if varMin01Str.Equals('SUP') then
                  FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINSEP').AsFloat := FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINSEP').AsFloat + varMin01;
                if varMin02Str.Equals('SUP') then
                  FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINSEP').AsFloat := FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINSEP').AsFloat + varMin02;
                if varMin03Str.Equals('SUP') then
                  FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINSEP').AsFloat := FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINSEP').AsFloat + varMin03;
                if varMin04Str.Equals('SUP') then
                  FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINSEP').AsFloat := FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINSEP').AsFloat + varMin04;
                if varMin05Str.Equals('SUP') then
                  FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINSEP').AsFloat := FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINSEP').AsFloat + varMin05;
                if varMin06Str.Equals('SUP') then
                  FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINSEP').AsFloat := FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINSEP').AsFloat + varMin06;

                FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINMAC').AsFloat := 0.00;
                if varMin01Str.Equals('MH') then
                  FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINMAC').AsFloat := FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINMAC').AsFloat + varMin01;
                if varMin02Str.Equals('MH') then
                  FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINMAC').AsFloat := FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINMAC').AsFloat + varMin02;
                if varMin03Str.Equals('MH') then
                  FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINMAC').AsFloat := FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINMAC').AsFloat + varMin03;
                if varMin04Str.Equals('MH') then
                  FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINMAC').AsFloat := FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINMAC').AsFloat + varMin04;
                if varMin05Str.Equals('MH') then
                  FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINMAC').AsFloat := FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINMAC').AsFloat + varMin05;
                if varMin06Str.Equals('MH') then
                  FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINMAC').AsFloat := FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINMAC').AsFloat + varMin06;

                FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINLAB').AsFloat := 0.00;
                if varMin01Str.Equals('LH') then
                  FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINLAB').AsFloat := FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINLAB').AsFloat + varMin01;
                if varMin02Str.Equals('LH') then
                  FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINLAB').AsFloat := FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINLAB').AsFloat + varMin02;
                if varMin03Str.Equals('LH') then
                  FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINLAB').AsFloat := FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINLAB').AsFloat + varMin03;
                if varMin04Str.Equals('LH') then
                  FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINLAB').AsFloat := FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINLAB').AsFloat + varMin04;
                if varMin05Str.Equals('LH') then
                  FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINLAB').AsFloat := FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINLAB').AsFloat + varMin05;
                if varMin06Str.Equals('LH') then
                  FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINLAB').AsFloat := FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINLAB').AsFloat + varMin06;

                FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINOVE').AsFloat := 0.00;
                if varMin01Str.Equals('LOH') then
                  FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINOVE').AsFloat := FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINOVE').AsFloat + varMin01;
                if varMin02Str.Equals('LOH') then
                  FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINOVE').AsFloat := FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINOVE').AsFloat + varMin02;
                if varMin03Str.Equals('LOH') then
                  FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINOVE').AsFloat := FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINOVE').AsFloat + varMin03;
                if varMin04Str.Equals('LOH') then
                  FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINOVE').AsFloat := FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINOVE').AsFloat + varMin04;
                if varMin05Str.Equals('LOH') then
                  FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINOVE').AsFloat := FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINOVE').AsFloat + varMin05;
                if varMin06Str.Equals('LOH') then
                  FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINOVE').AsFloat := FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUMINOVE').AsFloat + varMin06;

                FDQueryTMAQ_ItemRouting.FieldByName('TMAQ_ITEROUDAT').AsDateTime := DateUtils.StartOfTheMonth(DateUtils.StartOfTheMonth(Now)-1);

                try

                  FDQueryTMAQ_ItemRouting.Post;

                except

                  on E: Exception do
                  begin

                    Writeln( 'Post: ', E.Message );
                    FDQueryTMAQ_ItemRouting.Cancel;

                  end;

                end;

              end;

              if Frac(I / 100) = 0 then
              begin

                try

                  Writeln( 'ApplyUpdates' );
                  FDQueryTMAQ_ItemRouting.ApplyUpdates;

                  Writeln( 'CommitUpdates' );
                  FDQueryTMAQ_ItemRouting.CommitUpdates;

                except

                  on E: Exception do
                  begin

                    Writeln( 'CommitUpdates: ', E.Message );

                  end;

                end;

              end;

            end;

          finally

            try

              Writeln( 'ApplyUpdates' );
              FDQueryTMAQ_ItemRouting.ApplyUpdates;

              Writeln( 'CommitUpdates' );
              FDQueryTMAQ_ItemRouting.CommitUpdates;

            except

              on E: Exception do
              begin

                Writeln( 'CommitUpdates: ', E.Message );

              end;

            end;

            FDQueryTMAQ_ItemRouting.Close;

          end;

        end;

      finally

        FDConnection.Close;

      end;

    end;

  finally

    FreeAndNil(varENG_002);
    FreeAndNil(Fr_Dados);

  end;

end;

procedure UploadTXTEngItem;
var
  varENG_003: TStringList;
  varInicial, varFinal: Integer;
  varCMD: AnsiString;
  I: Integer;

begin

  Writeln( 'Criando DataModule' );
  Fr_Dados := TFr_Dados.Create(nil);

  Writeln( 'Criando StringList' );
  varENG_003 := TStringList.Create;
  try

    with Fr_Dados do
    begin

      Writeln('Config FDConnection');
      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );

      Writeln( 'Open FDConnection' );
      FDConnection.Open;
      try

        Writeln( 'Abrindo arquivo C:\Brady\Files\ENG\BR-ENG-ITEM.txt' );
        varENG_003.LoadFromFile( 'C:\Brady\Files\ENG\BR-ENG-ITEM.txt' );
        varENG_003.Insert(0,StringOfChar('|',12));

        Writeln( 'Removendo linhas' );
        for I := varENG_003.Count-1 downto 0 do
          if not (varENG_003[I].CountChar('|') = 12) then
            varENG_003.Delete(I);

        Writeln( 'Linha Inicial' );
        varInicial := StrToIntDef(ParamStr(2).Replace('-',''),0);

        if varInicial = 0 then
        begin

          Writeln( 'Apagando TMAQ_Item' );
          FDScriptTMAQ_Item.ExecuteAll;

          I := 1;
          while I <= varENG_003.Count-1 do
          begin

            varCMD := AnsiString( ParamStr(0)+ ' ' + '-eng_item -' + IntToStr(I) );

            Writeln( varCMD );
            WinExec( PAnsiChar(varCMD), 1 );
            Inc(I,10000);

          end;

        end
        else
        begin

          if ( varInicial + 9999 ) > (varENG_003.Count-1) then
            varFinal := varENG_003.Count-1
          else
            varFinal := varInicial + 9999;


          Writeln( 'Abrindo Query' );
          FDQueryTMAQ_Item.Open;
          try

            Writeln( 'Looping linhas' );
            for I := varInicial to varFinal do
            begin

              //Writeln( 'Item (',I,'/',varFinal,'): ', varENG_003[I].Split(['|'])[2].Trim );

              if not varENG_003[I].Split(['|'])[2].Trim.IsEmpty then
              begin

                FDQueryTMAQ_Item.Append;
                FDQueryTMAQ_Item.FieldByName('TMAQ_ITEITECOD').AsString := varENG_003[I].Split(['|'])[2].Trim;
                FDQueryTMAQ_Item.FieldByName('TMAQ_ITENOM').AsString := varENG_003[I].Split(['|'])[3].Trim;
                FDQueryTMAQ_Item.FieldByName('TMAQ_ITESIT').AsString := varENG_003[I].Split(['|'])[1].Trim;
                FDQueryTMAQ_Item.FieldByName('TMAQ_ITEMRP').AsString := varENG_003[I].Split(['|'])[5].Trim;
                FDQueryTMAQ_Item.FieldByName('TMAQ_ITEUNI').AsString := varENG_003[I].Split(['|'])[4].Trim;
                FDQueryTMAQ_Item.FieldByName('TMAQ_ITEMTRTYP').AsString := varENG_003[I].Split(['|'])[6].Trim;
                FDQueryTMAQ_Item.FieldByName('TMAQ_ITEPROTYP').AsString := varENG_003[I].Split(['|'])[9].Trim;
                FDQueryTMAQ_Item.FieldByName('TMAQ_ITECOSLOT').AsFloat := StrToFloat(varENG_003[I].Split(['|'])[7].Trim.Replace( ',', '', [rfReplaceAll] ).Replace( '.', FormatSettings.DecimalSeparator, [rfReplaceAll] ));

                try
                  FDQueryTMAQ_Item.FieldByName('TMAQ_ITECOP').AsString := varENG_003[I].Split(['|'])[10].Trim;
                except
                  FDQueryTMAQ_Item.FieldByName('TMAQ_ITECOP').AsString := '';
                end;

                try
                  FDQueryTMAQ_Item.FieldByName('TMAQ_ITEMRPCON').AsString := varENG_003[I].Split(['|'])[11].Trim;
                except
                  FDQueryTMAQ_Item.FieldByName('TMAQ_ITEMRPCON').AsString := '';
                end;

                try
                  FDQueryTMAQ_Item.FieldByName('TMAQ_ITEBASMAT').AsString := varENG_003[I].Split(['|'])[12].Trim;
                except
                  FDQueryTMAQ_Item.FieldByName('TMAQ_ITEBASMAT').AsString := '';
                end;

                try

                  FDQueryTMAQ_Item.Post;

                except

                  on E: Exception do
                  begin

                    Writeln( 'Post: ', E.Message );
                    FDQueryTMAQ_Item.Cancel;

                  end;

                end;

              end;

              if Frac(I / 1000) = 0 then
              begin

                try

                  Writeln( 'ApplyUpdates - ' + IntToStr(varInicial) );
                  FDQueryTMAQ_Item.ApplyUpdates;

                  Writeln( 'CommitUpdates - ' + IntToStr(varInicial) );
                  FDQueryTMAQ_Item.CommitUpdates;

                except

                  on E: Exception do
                  begin

                    Writeln( 'CommitUpdates - ' + IntToStr(varInicial) + ' : ', E.Message );

                  end;

                end;

              end;

            end;

          finally

            try

              Writeln( 'ApplyUpdates - ' + IntToStr(varInicial) );
              FDQueryTMAQ_Item.ApplyUpdates;

              Writeln( 'CommitUpdates - ' + IntToStr(varInicial) );
              FDQueryTMAQ_Item.CommitUpdates;

            except

              on E: Exception do
              begin

                Writeln( 'CommitUpdates - ' + IntToStr(varInicial) + ' : ', E.Message );

              end;

            end;

            FDQueryTMAQ_Item.Close;

          end;

        end;

      finally

        FDConnection.Close;

      end;

    end;

  finally

    FreeAndNil(varENG_003);
    FreeAndNil(Fr_Dados);

  end;

end;

procedure UploadTXTEngOrdemProducao;
var
  varENG_004: TStringList;
  varInicial, varFinal: Integer;
  varCMD: AnsiString;
  I: Integer;

begin

  Writeln( 'Criando DataModule' );
  Fr_Dados := TFr_Dados.Create(nil);

  Writeln( 'Criando StringList' );
  varENG_004 := TStringList.Create;
  try

    with Fr_Dados do
    begin

      Writeln('Config FDConnection');
      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );

      Writeln( 'Open FDConnection' );
      FDConnection.Open;
      try

        Writeln( 'Abrindo arquivo C:\Brady\Files\ENG\BR-ENG-004.txt' );
        varENG_004.LoadFromFile( 'C:\Brady\Files\ENG\BR-ENG-004.txt' );

        Writeln( 'Removendo linhas' );
        for I := varENG_004.Count-1 downto 0 do
          if not (varENG_004[I].CountChar('|') = 7) then
            varENG_004.Delete(I);

        Writeln( 'Linha Inicial' );
        varInicial := StrToIntDef(ParamStr(2).Replace('-',''),0);

        if varInicial = 0 then
        begin

          Writeln( 'Apagando TMAQ_OrdemProducao' );
          FDScriptTMAQ_OrdemProducao.ExecuteAll;

          I := 1;
          while I <= varENG_004.Count-1 do
          begin

            varCMD := AnsiString( ParamStr(0)+ ' ' + '-eng_op -' + IntToStr(I) );

            Writeln( varCMD );
            WinExec( PAnsiChar(varCMD), 1 );
            Inc(I,1000);

          end;

        end
        else
        begin

          if ( varInicial + 999 ) > (varENG_004.Count-1) then
            varFinal := varENG_004.Count-1
          else
            varFinal := varInicial + 999;


          Writeln( 'Abrindo Query' );
          FDQueryTMAQ_OrdemProducao.Open;
          try

            Writeln( 'Looping linhas' );
            for I := varInicial to varFinal do
            begin

              Writeln( 'Ordem de Producao (',I,'/',varFinal,'): ', varENG_004[I].Split(['|'])[2].Trim );

              if varENG_004[I].Split(['|'])[1].Trim.Equals('1063') or varENG_004[I].Split(['|'])[1].Trim.Equals('1061') then
              begin

                FDQueryTMAQ_OrdemProducao.Append;
                FDQueryTMAQ_OrdemProducao.FieldByName('TMAQ_ORDPRONUM').AsString := varENG_004[I].Split(['|'])[2].Trim;
                FDQueryTMAQ_OrdemProducao.FieldByName('TMAQ_ORDPROSIT').AsString := varENG_004[I].Split(['|'])[1].Trim;
                FDQueryTMAQ_OrdemProducao.FieldByName('TMAQ_ORDPROITECOD').AsString := varENG_004[I].Split(['|'])[3].Trim;
                FDQueryTMAQ_OrdemProducao.FieldByName('TMAQ_ORDPROQTDPLA').AsFloat := StrToFloat(varENG_004[I].Split(['|'])[4].Trim.Replace( '.', '', [rfReplaceAll] ).Replace( ',', FormatSettings.DecimalSeparator, [rfReplaceAll] ));
                FDQueryTMAQ_OrdemProducao.FieldByName('TMAQ_ORDPROQTDREP').AsFloat := StrToFloat(varENG_004[I].Split(['|'])[5].Trim.Replace( '.', '', [rfReplaceAll] ).Replace( ',', FormatSettings.DecimalSeparator, [rfReplaceAll] ));
                FDQueryTMAQ_OrdemProducao.FieldByName('TMAQ_ORDPRODATENC').AsDateTime := EncodeDate( StrToInt(varENG_004[I].Split(['|'])[6].Trim.Split(['.'])[2]), StrToInt(varENG_004[I].Split(['|'])[6].Trim.Split(['.'])[1]), StrToInt(varENG_004[I].Split(['|'])[6].Trim.Split(['.'])[0]) );

                try

                  FDQueryTMAQ_OrdemProducao.Post;

                except

                  on E: Exception do
                  begin

                    Writeln( 'Post: ', E.Message );
                    FDQueryTMAQ_OrdemProducao.Cancel;

                  end;

                end;

              end;

              if Frac(I / 100) = 0 then
              begin

                try

                  Writeln( 'ApplyUpdates' );
                  FDQueryTMAQ_OrdemProducao.ApplyUpdates;

                  Writeln( 'CommitUpdates' );
                  FDQueryTMAQ_OrdemProducao.CommitUpdates;

                except

                  on E: Exception do
                  begin

                    Writeln( 'CommitUpdates: ', E.Message );

                  end;

                end;

              end;

            end;

          finally

            try

              Writeln( 'ApplyUpdates' );
              FDQueryTMAQ_OrdemProducao.ApplyUpdates;

              Writeln( 'CommitUpdates' );
              FDQueryTMAQ_OrdemProducao.CommitUpdates;

            except

              on E: Exception do
              begin

                Writeln( 'CommitUpdates: ', E.Message );

              end;

            end;

            FDQueryTMAQ_OrdemProducao.Close;

          end;

        end;

      finally

        FDConnection.Close;

      end;

    end;

  finally

    FreeAndNil(varENG_004);
    FreeAndNil(Fr_Dados);

  end;

end;

procedure UploadTXTEngOrdemProducaoMPR;
var
  varENG_005: TStringList;
  varInicial, varFinal: Integer;
  varCMD: AnsiString;
  I: Integer;

begin

  Writeln( 'Criando DataModule' );
  Fr_Dados := TFr_Dados.Create(nil);

  Writeln( 'Criando StringList' );
  varENG_005 := TStringList.Create;
  try

    with Fr_Dados do
    begin

      Writeln('Config FDConnection');
      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );

      Writeln( 'Open FDConnection' );
      FDConnection.Open;
      try

        Writeln( 'Abrindo arquivo C:\Brady\Files\ENG\BR-ENG-005.txt' );
        varENG_005.LoadFromFile( 'C:\Brady\Files\ENG\BR-ENG-005.txt' );

        Writeln( 'Removendo linhas' );
        for I := varENG_005.Count-1 downto 0 do
          if not (varENG_005[I].CountChar('|') = 5) then
            varENG_005.Delete(I);

        Writeln( 'Linha Inicial' );
        varInicial := StrToIntDef(ParamStr(2).Replace('-',''),0);

        if varInicial = 0 then
        begin

          Writeln( 'Apagando TMAQ_OrdemProducaoMPR' );
          FDScriptTMAQ_OrdemProducaoMPR.ExecuteAll;

          I := 1;
          while I <= varENG_005.Count-1 do
          begin

            varCMD := AnsiString( ParamStr(0)+ ' ' + '-eng_opmpr -' + IntToStr(I) );

            Writeln( varCMD );
            WinExec( PAnsiChar(varCMD), 1 );
            Inc(I,1000);

          end;

        end
        else
        begin

          if ( varInicial + 999 ) > (varENG_005.Count-1) then
            varFinal := varENG_005.Count-1
          else
            varFinal := varInicial + 999;


          Writeln( 'Abrindo Query' );
          FDQueryTMAQ_OrdemProducaoMPR.Open;
          try

            Writeln( 'Looping linhas' );
            for I := varInicial to varFinal do
            begin

              Writeln( 'Ordem de ProducaoMPR (',I,'/',varFinal,'): ', varENG_005[I].Split(['|'])[2].Trim );

              if not varENG_005[I].Split(['|'])[1].Trim.IsEmpty then
              begin

                FDQueryTMAQ_OrdemProducaoMPR.Append;
                FDQueryTMAQ_OrdemProducaoMPR.FieldByName('TMAQ_ORDPROMPRNUM').AsString := varENG_005[I].Split(['|'])[1].Trim;
                FDQueryTMAQ_OrdemProducaoMPR.FieldByName('TMAQ_ORDPROMPRITECOD').AsString := varENG_005[I].Split(['|'])[2].Trim;
                FDQueryTMAQ_OrdemProducaoMPR.FieldByName('TMAQ_ORDPROMPRQTDTEO').AsFloat := StrToFloat(varENG_005[I].Split(['|'])[3].Trim.Replace( '.', '', [rfReplaceAll] ).Replace( ',', FormatSettings.DecimalSeparator, [rfReplaceAll] ));
                FDQueryTMAQ_OrdemProducaoMPR.FieldByName('TMAQ_ORDPROMPRQTDREA').AsFloat := StrToFloat(varENG_005[I].Split(['|'])[4].Trim.Replace( '.', '', [rfReplaceAll] ).Replace( ',', FormatSettings.DecimalSeparator, [rfReplaceAll] ));

                try

                  FDQueryTMAQ_OrdemProducaoMPR.Post;

                except

                  on E: Exception do
                  begin

                    Writeln( 'Post: ', E.Message );
                    FDQueryTMAQ_OrdemProducaoMPR.Cancel;

                  end;

                end;

              end;

              if Frac(I / 100) = 0 then
              begin

                try

                  Writeln( 'ApplyUpdates' );
                  FDQueryTMAQ_OrdemProducaoMPR.ApplyUpdates;

                  Writeln( 'CommitUpdates' );
                  FDQueryTMAQ_OrdemProducaoMPR.CommitUpdates;

                except

                  on E: Exception do
                  begin

                    Writeln( 'CommitUpdates: ', E.Message );

                  end;

                end;

              end;

            end;

          finally

            try

              Writeln( 'ApplyUpdates' );
              FDQueryTMAQ_OrdemProducaoMPR.ApplyUpdates;

              Writeln( 'CommitUpdates' );
              FDQueryTMAQ_OrdemProducaoMPR.CommitUpdates;

              if varFinal = varENG_005.Count-1 then
              begin

                Writeln( 'Aguardando 2 minutos...' );
                Sleep(120000);

                Writeln( 'Sequenciamento TMAQ_ItemRouting' );
                FDScriptTMAQ_OrdemProducaoMPR2.ExecuteAll;

              end;

            except

              on E: Exception do
              begin

                Writeln( 'CommitUpdates: ', E.Message );

              end;

            end;

            FDQueryTMAQ_OrdemProducaoMPR.Close;

          end;

        end;

      finally

        FDConnection.Close;

      end;

    end;

  finally

    FreeAndNil(varENG_005);
    FreeAndNil(Fr_Dados);

  end;

end;

procedure UploadTXTEngItemFolha;
var
  varENG_006: TStringList;
  varInicial, varFinal: Integer;
  varCMD: AnsiString;
  varQtdCores: Integer;
  I: Integer;
  Y: Integer;

begin

  Writeln( 'Criando DataModule' );
  Fr_Dados := TFr_Dados.Create(nil);

  Writeln( 'Criando StringList' );
  varENG_006 := TStringList.Create;
  try

    with Fr_Dados do
    begin

      Writeln('Config FDConnection');
      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );

      Writeln( 'Open FDConnection' );
      FDConnection.Open;
      try

        Writeln( 'Abrindo arquivo C:\Brady\Files\ENG\BR-ENG-006.txt' );
        varENG_006.LoadFromFile( 'C:\Brady\Files\ENG\BR-ENG-006.txt' );

        Writeln( 'Removendo linhas' );
        for I := varENG_006.Count-1 downto 0 do
          if not (varENG_006[I].CountChar('|') = 18) then
            varENG_006.Delete(I);

        Writeln( 'Linha Inicial' );
        varInicial := StrToIntDef(ParamStr(2).Replace('-',''),0);

        if varInicial = 0 then
        begin

          Writeln( 'Apagando TMAQ_ItemFolha' );
          FDScriptTMAQ_ItemFolha.ExecuteAll;

          I := 1;
          while I <= varENG_006.Count-1 do
          begin

            varCMD := AnsiString( ParamStr(0)+ ' ' + '-eng_itemfolha -' + IntToStr(I) );

            Writeln( varCMD );
            WinExec( PAnsiChar(varCMD), 1 );
            Inc(I,1000);

          end;

        end
        else
        begin

          if ( varInicial + 999 ) > (varENG_006.Count-1) then
            varFinal := varENG_006.Count-1
          else
            varFinal := varInicial + 999;


          Writeln( 'Abrindo Query' );
          FDQueryTMAQ_ItemFolha.Open;
          try

            Writeln( 'Looping linhas' );
            for I := varInicial to varFinal do
            begin

              Writeln( 'Item Folha (',I,'/',varFinal,'): ', varENG_006[I].Split(['|'])[1].Trim );

              if not varENG_006[I].Split(['|'])[1].Trim.IsEmpty then
              begin

                varQtdCores := 0;
                for Y := 2 to 15 do
                  if not varENG_006[I].Split(['|'])[Y].Replace('*','').Replace('-','').Replace('.','').Trim.IsEmpty then
                    varQtdCores := varQtdCores + 1;

                FDQueryTMAQ_ItemFolha.Append;
                FDQueryTMAQ_ItemFolha.FieldByName('TMAQ_ITEFOLITECOD').AsString := varENG_006[I].Split(['|'])[1].Trim.Split([' '])[0].Trim;
                FDQueryTMAQ_ItemFolha.FieldByName('TMAQ_ITEFOLQTDCOR').AsInteger := varQtdCores;
                FDQueryTMAQ_ItemFolha.FieldByName('TMAQ_ITEFOLETQBOB').AsInteger := StrToIntDef('0'+varENG_006[I].Split(['|'])[16].Replace('*','').Replace('.','').Replace(',','').Trim,0);

                try

                  FDQueryTMAQ_ItemFolha.Post;

                except

                  on E: Exception do
                  begin

                    Writeln( 'Post: ', E.Message );
                    FDQueryTMAQ_ItemFolha.Cancel;

                  end;

                end;

              end;

              if Frac(I / 100) = 0 then
              begin

                try

                  Writeln( 'ApplyUpdates' );
                  FDQueryTMAQ_ItemFolha.ApplyUpdates;

                  Writeln( 'CommitUpdates' );
                  FDQueryTMAQ_ItemFolha.CommitUpdates;

                except

                  on E: Exception do
                  begin

                    Writeln( 'CommitUpdates: ', E.Message );

                  end;

                end;

              end;

            end;

          finally

            try

              Writeln( 'ApplyUpdates' );
              FDQueryTMAQ_ItemFolha.ApplyUpdates;

              Writeln( 'CommitUpdates' );
              FDQueryTMAQ_ItemFolha.CommitUpdates;

            except

              on E: Exception do
              begin

                Writeln( 'CommitUpdates: ', E.Message );

              end;

            end;

            FDQueryTMAQ_ItemFolha.Close;

          end;

        end;

      finally

        FDConnection.Close;

      end;

    end;

  finally

    FreeAndNil(varENG_006);
    FreeAndNil(Fr_Dados);

  end;

end;

procedure UploadTXTEngItemFaca;
var
  varENG_007  : TStringList;
  varInicial, varFinal: Integer;
  varCMD: AnsiString;
  I: Integer;

begin

  Writeln( 'Criando DataModule' );
  Fr_Dados := TFr_Dados.Create(nil);

  Writeln( 'Criando StringList' );
  varENG_007 := TStringList.Create;
  try

    with Fr_Dados do
    begin

      Writeln('Config FDConnection');
      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );

      Writeln( 'Open FDConnection' );
      FDConnection.Open;
      try

        Writeln( 'Abrindo arquivo C:\Brady\Files\ENG\BR-ENG-007.txt' );
        varENG_007.LoadFromFile( 'C:\Brady\Files\ENG\BR-ENG-007.txt' );

        Writeln( 'Removendo linhas' );
        for I := varENG_007.Count-1 downto 0 do
          if not (varENG_007[I].CountChar('|') = 8) then
            varENG_007.Delete(I);

        Writeln( 'Linha Inicial' );
        varInicial := StrToIntDef(ParamStr(2).Replace('-',''),0);

        if varInicial = 0 then
        begin

          Writeln( 'Apagando TMAQ_ItemFaca' );
          FDScriptTMAQ_ItemFaca.ExecuteAll;

          I := 1;
          while I <= varENG_007.Count-1 do
          begin

            varCMD := AnsiString( ParamStr(0)+ ' ' + '-eng_itemfaca -' + IntToStr(I) );

            Writeln( varCMD );
            WinExec( PAnsiChar(varCMD), 1 );
            Inc(I,1000);

          end;

        end
        else
        begin

          if ( varInicial + 999 ) > (varENG_007.Count-1) then
            varFinal := varENG_007.Count-1
          else
            varFinal := varInicial + 999;


          Writeln( 'Abrindo Query' );
          FDQueryTMAQ_ItemFaca.Open;
          try

            Writeln( 'Looping linhas' );
            for I := varInicial to varFinal do
            begin

              Writeln( 'Item Faca (',I,'/',varFinal,'): ', varENG_007[I].Split(['|'])[1].Trim );

              if not varENG_007[I].Split(['|'])[1].Trim.IsEmpty then
              begin

                FDQueryTMAQ_ItemFaca.Append;
                FDQueryTMAQ_ItemFaca.FieldByName('TMAQ_ITEFACITECOD').AsString := varENG_007[I].Split(['|'])[1].Trim;
                FDQueryTMAQ_ItemFaca.FieldByName('TMAQ_ITEFACLARETQ').AsFloat := StrToFloat(varENG_007[I].Split(['|'])[2].Trim.Split([' '])[0].Trim.Replace( '.', '', [rfReplaceAll] ).Replace( ',', FormatSettings.DecimalSeparator, [rfReplaceAll] ));
                FDQueryTMAQ_ItemFaca.FieldByName('TMAQ_ITEFACALTETQ').AsFloat := StrToFloat(varENG_007[I].Split(['|'])[3].Trim.Split([' '])[0].Trim.Replace( '.', '', [rfReplaceAll] ).Replace( ',', FormatSettings.DecimalSeparator, [rfReplaceAll] ));
                FDQueryTMAQ_ItemFaca.FieldByName('TMAQ_ITEFACCAVHORETQ').AsFloat := StrToFloat(varENG_007[I].Split(['|'])[4].Trim.Split([' '])[0].Trim.Replace( '.', '', [rfReplaceAll] ).Replace( ',', FormatSettings.DecimalSeparator, [rfReplaceAll] ));
                FDQueryTMAQ_ItemFaca.FieldByName('TMAQ_ITEFACCAVVERETQ').AsFloat := StrToFloat(varENG_007[I].Split(['|'])[5].Trim.Split([' '])[0].Trim.Replace( '.', '', [rfReplaceAll] ).Replace( ',', FormatSettings.DecimalSeparator, [rfReplaceAll] ));
                FDQueryTMAQ_ItemFaca.FieldByName('TMAQ_ITEFACESPHORETQ').AsFloat := StrToFloat(varENG_007[I].Split(['|'])[6].Trim.Split([' '])[0].Trim.Replace( '.', '', [rfReplaceAll] ).Replace( ',', FormatSettings.DecimalSeparator, [rfReplaceAll] ));
                FDQueryTMAQ_ItemFaca.FieldByName('TMAQ_ITEFACESPVERETQ').AsFloat := StrToFloat(varENG_007[I].Split(['|'])[7].Trim.Split([' '])[0].Trim.Replace( '.', '', [rfReplaceAll] ).Replace( ',', FormatSettings.DecimalSeparator, [rfReplaceAll] ));

                try

                  FDQueryTMAQ_ItemFaca.Post;

                except

                  on E: Exception do
                  begin

                    Writeln( 'Post: ', E.Message );
                    FDQueryTMAQ_ItemFaca.Cancel;

                  end;

                end;

              end;

              if Frac(I / 100) = 0 then
              begin

                try

                  Writeln( 'ApplyUpdates' );
                  FDQueryTMAQ_ItemFaca.ApplyUpdates;

                  Writeln( 'CommitUpdates' );
                  FDQueryTMAQ_ItemFaca.CommitUpdates;

                except

                  on E: Exception do
                  begin

                    Writeln( 'CommitUpdates: ', E.Message );

                  end;

                end;

              end;

            end;

          finally

            try

              Writeln( 'ApplyUpdates' );
              FDQueryTMAQ_ItemFaca.ApplyUpdates;

              Writeln( 'CommitUpdates' );
              FDQueryTMAQ_ItemFaca.CommitUpdates;

            except

              on E: Exception do
              begin

                Writeln( 'CommitUpdates: ', E.Message );

              end;

            end;

            FDQueryTMAQ_ItemFaca.Close;

          end;

        end;

      finally

        FDConnection.Close;

      end;

    end;

  finally

    FreeAndNil(varENG_007);
    FreeAndNil(Fr_Dados);

  end;

end;

procedure SendDailySalesMail( Monthly: Boolean = False );
var
  varACBrNFe: TACBrNFe;
  varACBrMail: TACBrMail;
  varBodyAccOwner, varBodyGrupoCliente, varBodyTotal, varBodyTotal2, varBody, varBody01, varBody02, varBody03, varBody04, varBody05, varBody06, varBody07, varBody08, varBodyAux, varBody09: TStringList;
  varCC: TStringList;
  varAno: Integer;
  varSite: String;
  varCanal: String;
  varOrigem: String;
 // varBloqueado : String;
  varPercentual, varActual, varForecast, varBilling, varBacklog, varGrossMargin, varBlock, varLate, varMonth: Extended;

  varPercentualOrigem, varActualOrigem, varForecastOrigem, varBillingOrigem, varBacklogOrigem, varGrossMarginOrigem, varBlockOrigem,varLateOrigem, varMonthOrigem: Extended;
  varPercentualSite, varActualSite, varForecastSite, varBillingSite, varBacklogSite, varGrossMarginSite, varBlockSite,varLateSite, varMonthSite: Extended;
  varPercentualCanal, varActualCanal, varForecastCanal, varBillingCanal, varBacklogCanal, varGrossMarginCanal, varBlockCanal,varLateCanal, varMonthCanal: Extended;
  varPercentualSalesRep, varActualSalesRep, varForecastSalesRep, varBillingSalesRep, varBacklogSalesRep, varGrossMarginSalesRep, varBlockSalesRep,varLateSalesRep, varMonthSalesRep: Extended;

  varPercentualMANMRO, varActualMANMRO, varForecastMANMRO, varBillingMANMRO, varBacklogMANMRO, varGrossMarginMANMRO, varBlockMANMRO,varLateMANMRO, varMonthMANMRO: Extended;
  varPercentualTAMMRO, varActualTAMMRO, varForecastTAMMRO, varBillingTAMMRO, varBacklogTAMMRO, varGrossMarginTAMMRO, varBlockTAMMRO,varLateTAMMRO, varMonthTAMMRO: Extended;
  varPercentualMANPID, varActualMANPID, varForecastMANPID, varBillingMANPID, varBacklogMANPID, varGrossMarginMANPID, varBlockMANPID,varLateMANPID, varMonthMANPID: Extended;
  varPercentualTAMPID, varActualTAMPID, varForecastTAMPID, varBillingTAMPID, varBacklogTAMPID, varGrossMarginTAMPID, varBlockTAMPID,varLateTAMPID, varMonthTAMPID: Extended;
  varPercentualTOTPID, varActualTOTPID, varForecastTOTPID, varBillingTOTPID, varBacklogTOTPID, varGrossMarginTOTPID, varBlockTOTPID,varLateTOTPID, varMonthTOTPID: Extended;

  varPercentualMRO, varActualMRO, varForecastMRO, varBillingMRO, varBacklogMRO, varGrossMarginMRO, varBlockMRO,varLateMRO, varMonthMRO: Extended;

  varPercentualPID_KA, varActualPID_KA, varForecastPID_KA, varBillingPID_KA, varBacklogPID_KA, varGrossMarginPID_KA, varBlockPID_KA,varLatePID_KA, varMonthPID_KA: Extended;
  varPercentualPID_KAReg, varActualPID_KAReg, varForecastPID_KAReg, varBillingPID_KAReg, varBacklogPID_KAReg, varGrossMarginPID_KAReg, varBlockPID_KAReg,varLatePID_KAReg, varMonthPID_KAReg: Extended;
  varPercentualPID_Reg, varActualPID_Reg, varForecastPID_Reg, varBillingPID_Reg, varBacklogPID_Reg, varGrossMarginPID_Reg, varBlockPID_Reg,varLatePID_Reg, varMonthPID_Reg: Extended;

  varPercentualMROKA, varActualMROKA, varForecastMROKA, varBillingMROKA, varBacklogMROKA, varGrossMarginMROKA, varBlockMROKA,varLateMROKA, varMonthMROKA: Extended;
  varPercentualDM, varActualDM, varForecastDM, varBillingDM, varBacklogDM, varGrossMarginDM, varBlockDM, varLateDM, varMonthDM: Extended;


  I: Integer;
  varNow: TDateTime;
  varAssunto: String;
  iAtual : Integer;

begin

  if Monthly then
    Writeln('Inicio: ','Enviar Monthly Sales EMail')
  else
    Writeln('Inicio: ','Enviar Daily Sales EMail');

  varACBrNFe := TACBrNFe.Create(nil);
  varACBrMail := TACBrMail.Create(nil);
  varACBrNFe.MAIL := varACBrMail;
  varBody := TStringList.Create;
  varBodyTotal := TStringList.Create;
  varBodyTotal2 := TStringList.Create;
  varBodyAccOwner := TStringList.Create;
  varBodyGrupoCliente := TStringList.Create;
  varBody01 := TStringList.Create;
  varBody02 := TStringList.Create;
  varBody03 := TStringList.Create;
  varBody04 := TStringList.Create;
  varBody05 := TStringList.Create;
  varBody06 := TStringList.Create;
  varBody07 := TStringList.Create;
  varBody08 := TStringList.Create;
  varBodyAux := TStringList.Create;
  varBody09  := TStringList.Create;
  varCC := TStringList.Create;

  if Monthly then
  begin

    varBody01.LoadFromFile( 'C:\Brady\MonthlySalesMail-01.html' );
    varBody02.LoadFromFile( 'C:\Brady\MonthlySalesMail-02.html' );
    varBody03.LoadFromFile( 'C:\Brady\MonthlySalesMail-03.html' );
    varBody04.LoadFromFile( 'C:\Brady\MonthlySalesMail-04.html' );
    varBody05.LoadFromFile( 'C:\Brady\MonthlySalesMail-05.html' );
    varBody06.LoadFromFile( 'C:\Brady\MonthlySalesMail-06.html' );
    varBody07.LoadFromFile( 'C:\Brady\MonthlySalesMail-07.html' );
    varBody08.LoadFromFile( 'C:\Brady\MonthlySalesMail-08.html' );


  end
  else
  begin

    varBody01.LoadFromFile( 'C:\Brady\DailySalesMail-01.html' );
    varBody02.LoadFromFile( 'C:\Brady\DailySalesMail-02.html' );
    varBody03.LoadFromFile( 'C:\Brady\DailySalesMail-03.html' );
    varBody04.LoadFromFile( 'C:\Brady\DailySalesMail-04.html' );
    varBody05.LoadFromFile( 'C:\Brady\DailySalesMail-05.html' );
    varBody06.LoadFromFile( 'C:\Brady\DailySalesMail-06.html' );
    varBody07.LoadFromFile( 'C:\Brady\DailySalesMail-07.html' );
    varBody08.LoadFromFile( 'C:\Brady\DailySalesMail-08.html' );
    varBody09.LoadFromFile( 'C:\Brady\DailySalesMail-09.html' );

  end;

  Writeln( 'Criando DataModule' );
  Fr_Dados := TFr_Dados.Create(nil);
  try

    with Fr_Dados do
    begin


      varAno := YearOf(Now);
      if MonthOf(Now) >= 8 then
        varAno := varAno + 1;

      Writeln('Config FDConnection');
      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );

      Writeln('Open FDConnection');
      FDConnection.Open;
      try

        if Monthly then
        begin

          varNow := System.DateUtils.EndOfTheMonth(System.DateUtils.StartOfTheMonth(Now)-1);

        end
        else
        begin

          varNow := Now;

        end;

        if not ParamStr(2).IsEmpty then
        begin

          varNow := EncodeDate( StrToInt(ParamStr(2).Replace( '-', '' ).Split(['/'])[0]),
                                StrToInt(ParamStr(2).Replace( '-', '' ).Split(['/'])[1]),
                                StrToInt(ParamStr(2).Replace( '-', '' ).Split(['/'])[2]) );

        end;


        FDQueryTSOP_SETONFORECAST.Close;
        FDQueryTSOP_SETONFORECAST.Params.ParamByName('TSOP_PERIODO').AsDateTime    :=  System.DateUtils.StartOfTheMonth(varNow);
        FDQueryTSOP_SETONFORECAST.Params.ParamByName('TSOP_DPACANTXTDEP').AsString :=  'DM';
        FDQueryTSOP_SETONFORECAST.Open;

        FDQuerySalesRep.ParamByName( 'MES_INI' ).AsDateTime := System.DateUtils.StartOfTheMonth(varNow);
        FDQuerySalesRep.ParamByName( 'MES_FIM' ).AsDateTime := System.DateUtils.EndOfTheMonth(varNow);

        if System.DateUtils.MonthOf(varNow) >= 8 then
          FDQuerySalesRep.ParamByName( 'YEARDOC' ).AsInteger := System.DateUtils.YearOf(varNow) + 1
        else
          FDQuerySalesRep.ParamByName( 'YEARDOC' ).AsInteger := System.DateUtils.YearOf(varNow);

        if System.DateUtils.MonthOf(varNow) >= 8 then
          FDQuerySalesRep.ParamByName( 'MONTHDOC' ).AsInteger := System.DateUtils.MonthOf(varNow) - 7
        else
          FDQuerySalesRep.ParamByName( 'MONTHDOC' ).AsInteger := System.DateUtils.MonthOf(varNow) + 5;

        FDQuerySalesRep.Close;
        FDQuerySalesRep.Open;

        varBodyTotal.Clear;


        varActualMANMRO      := 0.00;
        varForecastMANMRO    := 0.00;
        varBillingMANMRO     := 0.00;
        varBacklogMANMRO     := 0.00;
        varGrossMarginMANMRO := 0.00;
        varBlockMANMRO       := 0.00;
        varLateMANMRO        := 0.00;
        varMonthMANMRO       := 0.00;

        varActualTAMMRO      := 0.00;
        varForecastTAMMRO    := 0.00;
        varBillingTAMMRO     := 0.00;
        varBacklogTAMMRO     := 0.00;
        varGrossMarginTAMMRO := 0.00;
        varBlockTAMMRO       := 0.00;
        varLateTAMMRO        := 0.00;
        varMonthTAMMRO       := 0.00;

        varActualMANPID      := 0.00;
        varForecastMANPID    := 0.00;
        varBillingMANPID     := 0.00;
        varBacklogMANPID     := 0.00;
        varGrossMarginMANPID := 0.00;
        varBlockMANPID       := 0.00;
        varLateMANPID        := 0.00;
        varMonthMANPID       := 0.00;

        varActualTAMPID      := 0.00;
        varForecastTAMPID    := 0.00;
        varBillingTAMPID     := 0.00;
        varBacklogTAMPID     := 0.00;
        varGrossMarginTAMPID := 0.00;
        varBlockTAMPID       := 0.00;
        varLateTAMPID        := 0.00;
        varMonthTAMPID       := 0.00;

        varActualMRO      := 0.00;
        varForecastMRO    := 0.00;
        varBillingMRO     := 0.00;
        varBacklogMRO     := 0.00;
        varGrossMarginMRO := 0.00;
        varBlockMRO       := 0.00;
        varLateMRO        := 0.00;
        varMonthMRO       := 0.00;

        varActualPID_KA      := 0.00;
        varForecastPID_KA    := 0.00;
        varBillingPID_KA     := 0.00;
        varBacklogPID_KA     := 0.00;
        varGrossMarginPID_KA := 0.00;
        varBlockPID_KA       := 0.00;
        varLatePID_KA        := 0.00;
        varMonthPID_KA       := 0.00;

        varActualPID_KAReg      := 0.00;
        varForecastPID_KAReg    := 0.00;
        varBillingPID_KAReg     := 0.00;
        varBacklogPID_KAReg     := 0.00;
        varGrossMarginPID_KAReg := 0.00;
        varBlockPID_KAReg       := 0.00;
        varLatePID_KAReg        := 0.00;
        varMonthPID_KAReg       := 0.00;

        varActualPID_Reg      := 0.00;
        varForecastPID_Reg    := 0.00;
        varBillingPID_Reg     := 0.00;
        varBacklogPID_Reg     := 0.00;
        varGrossMarginPID_Reg := 0.00;
        varBlockPID_Reg       := 0.00;
        varLatePID_Reg        := 0.00;
        varMonthPID_Reg       := 0.00;

        varPercentualMROKA  := 0.00;
        varActualMROKA      := 0.00;
        varForecastMROKA    := 0.00;
        varBillingMROKA     := 0.00;
        varBacklogMROKA     := 0.00;
        varGrossMarginMROKA := 0.00;
        varBlockMROKA       := 0.00;
        varLateMROKA        := 0.00;
        varMonthMROKA       := 0.00;

        varPercentualDM  := 0.00;
        varActualDM      := 0.00;
        varForecastDM    := 0.00;
        varBillingDM     := 0.00;
        varBacklogDM     := 0.00;
        varGrossMarginDM := 0.00;
        varBlockDM       := 0.00;
        varLateDM        := 0.00;
        varMonthDM       := 0.00;

        varPercentualTOTPID  := 0.00;
        varActualTOTPID      := 0.00;
        varForecastTOTPID    := 0.00;
        varBillingTOTPID     := 0.00;
        varBacklogTOTPID     := 0.00;
        varGrossMarginTOTPID := 0.00;
        varBlockTOTPID       := 0.00;
        varLateTOTPID        := 0.00;
        varMonthTOTPID       := 0.00;


        iAtual := 0;

        FDQueryTSOP_RepresentanteCanal.Close;
        FDQueryTSOP_RepresentanteCanal.Open;

        while not FDQuerySalesRep.Eof do
        begin


          Writeln('Set FDQuery');
          FDQueryVSOP_OrderBillingPedidos.ParamByName( 'MES_INI' ).AsDateTime := System.DateUtils.StartOfTheMonth(varNow);
          FDQueryVSOP_OrderBillingPedidos.ParamByName( 'MES_FIM' ).AsDateTime := System.DateUtils.EndOfTheMonth(varNow);
          FDQueryVSOP_OrderBillingPedidos.ParamByName( 'MES_ANT' ).AsDateTime := System.DateUtils.StartOfTheMonth(System.DateUtils.StartOfTheMonth(varNow)-1);
          FDQueryVSOP_OrderBillingPedidos.ParamByName( 'SALESREP' ).AsString := FDQuerySalesRepTSIS_USUNOM.AsString;

          if System.DateUtils.MonthOf(varNow) >= 8 then
            FDQueryVSOP_OrderBillingPedidos.ParamByName( 'YEARDOC' ).AsInteger := System.DateUtils.YearOf(varNow) + 1
          else
            FDQueryVSOP_OrderBillingPedidos.ParamByName( 'YEARDOC' ).AsInteger := System.DateUtils.YearOf(varNow);

          if System.DateUtils.MonthOf(varNow) >= 8 then
            FDQueryVSOP_OrderBillingPedidos.ParamByName( 'MONTHDOC' ).AsInteger := System.DateUtils.MonthOf(varNow) - 7
          else
            FDQueryVSOP_OrderBillingPedidos.ParamByName( 'MONTHDOC' ).AsInteger := System.DateUtils.MonthOf(varNow) + 5;

          if FDQuerySalesRepTSIS_USUNOM.AsString.Trim.IsEmpty or FDQuerySalesRepTSIS_USUNOM.AsString.Trim.Equals('N/A') or FDQuerySalesRepTSIS_USUNOM.AsString.Trim.Equals('INTERCOMPANY') then
            FDQueryVSOP_OrderBillingPedidos.MacroByName( 'WHERE1' ).AsRaw := 'AND (B01.TSOP_ORDBILREPNOM = ' + QuotedStr(FDQuerySalesRepTSIS_USUNOM.AsString) + ')'
          else
            FDQueryVSOP_OrderBillingPedidos.MacroByName( 'WHERE1' ).AsRaw := 'AND (B01.TSOP_ORDBILREPNOM = ' + QuotedStr(FDQuerySalesRepTSIS_USUNOM.AsString) + ' OR B01.TSOP_REPMKT = ' + QuotedStr(FDQuerySalesRepTSIS_USUNOM.AsString) + ' OR B01.TSOP_REPNOMINT = ' + QuotedStr(FDQuerySalesRepTSIS_USUNOM.AsString) + ')';

          Writeln('Open FDQuery');
          FDQueryVSOP_OrderBillingPedidos.Close;
          FDQueryVSOP_OrderBillingPedidos.Open;
          //FDQueryVSOP_OrderBillingPedidos.IndexFieldNames := 'TSOP_ORDBILSITNOM;TSOP_ORDBILCANNOM;TSOP_ORDBILORI;TSOP_ORDBILREPNOM;TSOP_ORDBILGRUCLINOM;TSOP_ORDBILDAT;TSOP_ORDBILTYP';


          while not FDQueryVSOP_OrderBillingPedidos.Eof do
          begin

            varBody.Clear;
            varActualSalesRep      := 0.00;
            varForecastSalesRep    := 0.00;
            varBillingSalesRep     := 0.00;
            varBacklogSalesRep     := 0.00;
            varGrossMarginSalesRep := 0.00;

            varBody.Add( varBody01.Text.Replace('%FY%', FDQueryVSOP_OrderBillingPedidosTSOP_ORDBILDAT.AsString ).Replace( '%SalesRep%', FDQuerySalesRepTSIS_USUNOM.AsString.ToUpper.Trim ) );

            while not FDQueryVSOP_OrderBillingPedidos.Eof do
            begin

              varSite      := FDQueryVSOP_OrderBillingPedidosTSOP_ORDBILSITNOM.AsString.ToUpper.Trim;
            //  varBloqueado := FDQueryVSOP_OrderBillingPedidosTSOP_ORDBILBLOCK.AsString.ToUpper.Trim;
                                                              varBlockSalesRep       := 0.00;
              varLateSalesRep        := 0.00;
              varMonthSalesRep       := 0.00;

              varActualSite      := 0.00;
              varForecastSite    := 0.00;
              varBillingSite     := 0.00;
              varBacklogSite     := 0.00;
              varGrossMarginSite := 0.00;
              varBlockSite       := 0.00;
              varLateSite        := 0.00;
              varMonthSite       := 0.00;

              // em desenvolvimento. 05/04/2018
              if FDQueryTSOP_RepresentanteCanal.Locate('TSOP_REPNOM;TSOP_PLANTA' ,
                                                VarArrayOf([FDQuerySalesRepTSIS_USUNOM.AsString.ToUpper.Trim ,
                                                            FDQueryVSOP_OrderBillingPedidosTSOP_ORDBILSITNOM.AsString.ToUpper.Trim]),[])  Then

              varBody.Add( varBody06.Text.Replace( '%Site%', FDQueryVSOP_OrderBillingPedidosTSOP_ORDBILSITNOM.AsString.ToUpper.Trim ) );

              while not FDQueryVSOP_OrderBillingPedidos.Eof do
              begin

                varCanal := FDQueryVSOP_OrderBillingPedidosTSOP_ORDBILCANNOM.AsString;

                varActualCanal      := 0.00;
                varForecastCanal    := 0.00;
                varBillingCanal     := 0.00;
                varBacklogCanal     := 0.00;
                varGrossMarginCanal := 0.00;
                varBlockCanal       := 0.00;
                varLateCanal        := 0.00;
                varMonthCanal       := 0.00;


               // em desenvolvimento. 05/04/2018
               if FDQueryTSOP_RepresentanteCanal.Locate('TSOP_REPNOM;TSOP_CANAL' ,
                                                 VarArrayOf([   FDQuerySalesRepTSIS_USUNOM.AsString.ToUpper.Trim ,
                                                                FDQueryVSOP_OrderBillingPedidosTSOP_ORDBILCANNOM.AsString.ToUpper.Trim]),[])  Then

                varBody.Add( varBody02.Text.Replace( '%Canal%', FDQueryVSOP_OrderBillingPedidosTSOP_ORDBILCANNOM.AsString ) );

                while not FDQueryVSOP_OrderBillingPedidos.Eof do
                begin

                  varOrigem := FDQueryVSOP_OrderBillingPedidosTSOP_ORDBILORI.AsString;

                  varActualOrigem      := 0.00;
                  varForecastOrigem    := 0.00;
                  varBillingOrigem     := 0.00;
                  varBacklogOrigem     := 0.00;
                  varGrossMarginOrigem := 0.00;
                  varBlockOrigem       := 0.00;
                  varLateOrigem        := 0.00;
                  varMonthOrigem       := 0.00;

                  varBody.Add( varBody05.Text.Replace( '%Origem%', FDQueryVSOP_OrderBillingPedidosTSOP_ORDBILORI.AsString ) );

                  while not FDQueryVSOP_OrderBillingPedidos.Eof do
                  begin

                    varActual       := 0.00;
                    varBacklog      := 0.00;
                    varBilling      := 0.00;
                    varGrossMargin  := 0.00;
                    varForecast     := 0.00;
                    varBlock        := 0.00;
                    varLate         := 0.00;
                    varMonth        := 0.00;

                    varActual := FDQueryVSOP_OrderBillingPedidosTSOP_ORDBILVALLIQ.AsFloat;

                    FDQueryVSOP_OrderBillingPedidos.Next;
                    varBacklog := FDQueryVSOP_OrderBillingPedidosTSOP_ORDBILVALLIQ.AsFloat;

                    FDQueryVSOP_OrderBillingPedidos.Next;
                    varBilling := FDQueryVSOP_OrderBillingPedidosTSOP_ORDBILVALLIQ.AsFloat;

                    FDQueryVSOP_OrderBillingPedidos.Next;
                    varGrossMargin := FDQueryVSOP_OrderBillingPedidosTSOP_ORDBILVALLIQ.AsFloat;

                  {  FDQueryVSOP_OrderBillingPedidos.Next;
                    varLate := FDQueryVSOP_OrderBillingPedidosTSOP_ORDBILVALLIQ.AsFloat;

                    FDQueryVSOP_OrderBillingPedidos.Next;
                    varMonth := FDQueryVSOP_OrderBillingPedidosTSOP_ORDBILVALLIQ.AsFloat;

                    FDQueryVSOP_OrderBillingPedidos.Next;
                    varBlock  := FDQueryVSOP_OrderBillingPedidosTSOP_ORDBILVALLIQ.AsFloat;
                   }
                    FDQueryVSOP_OrderBillingPedidos.Next;
                    varForecast := FDQueryVSOP_OrderBillingPedidosTSOP_ORDBILVALLIQ.AsFloat;

                    if varForecast = 0.00 then
                      varPercentual := 0.00
                    else
                      varPercentual := varActual/varForecast*100.00;


                    if (varActual <> 0.00) or
                       (varBacklog <> 0.00) or
                       (varGrossMargin <> 0.00) or
                       (varBilling <> 0.00) or
                       (varForecast <> 0.00)  Then
                    //   or
                    //   (varBlock <> 0.00) or
                     //  (varLate <> 0.00) or
                      // (varMonth <> 0.00) then
                    begin

                      varBodyAux.Add( '<!-- ' + FormatFloat( '0,000,000.00', (varActual-varForecast)+1000000 ) + ' -->' + varBody03.Text.Replace( '%GrupoCliente%', FDQueryVSOP_OrderBillingPedidosTSOP_ORDBILGRUCLINOM.AsString ).Replace( '%act-tot%', FormatFloat('#,##0', varActual) ).Replace( '%back-tot%', FormatFloat('#,##0', varLate) ).Replace( '%gm-tot%', FormatFloat('#,##0', varGrossMargin) ).Replace( '%bill-tot%', FormatFloat('#,##0', varBilling) ).Replace( '%fct-tot%', FormatFloat('#,##0', varForecast) ).Replace( '%act-fct%', FormatFloat('#,##0', varActual-varForecast) ).Replace( '%act/fct%', FormatFloat('#,##0', varPercentual)+'%' ).Replace('%act-ordb%', FormatFloat('#,##0', varBlock)).Replace('%mont-tot%', FormatFloat('#,##0', varMonth)) );


                      if varCanal.ToUpper.Trim.Equals('DISTRIBUTORS') then
                      begin

                          if (FDQueryVSOP_OrderBillingPedidosTSOP_REPACCTYP.AsString.ToUpper.Trim.Equals('KA'))  Then  // Marcos
                          begin
                            varActualMROKA      := varActualMROKA + varActual;
                            varBacklogMROKA     := varBacklogMROKA + varBacklog;
                            varGrossMarginMROKA := varGrossMarginMROKA + varGrossMargin;
                            varBillingMROKA     := varBillingMROKA + varBilling;
                            varForecastMROKA    := varForecastMROKA + varForecast;
                            varBlockMROKA       := varBlockMROKA + varBlock;
                            varLateMROKA        := varLateMROKA + varLate;
                            varMonthMROKA       := varMonthMROKA + varMonth;
                          end;

                          varActualMRO        := varActualMRO + varActual;
                          varBacklogMRO       := varBacklogMRO + varBacklog;
                          varGrossMarginMRO   := varGrossMarginMRO + varGrossMargin;
                          varBillingMRO       := varBillingMRO + varBilling;
                          varForecastMRO      := varForecastMRO + varForecast;
                          varBlockMRO         := varBlockMRO + varBlock;
                          varLateMRO          := varLateMRO + varLate;
                          varMonthMRO         := varMonthMRO + varMonth;

                          if varOrigem.ToUpper.Trim.Equals( 'ACC OWNER' ) then
                          begin

                            if varSite.ToUpper.Trim.Equals('MANAUS') then     // Marcos
                            begin

                              varActualMANMRO := varActualMANMRO + varActual;
                              varBacklogMANMRO := varBacklogMANMRO + varBacklog;
                              varGrossMarginMANMRO := varGrossMarginMANMRO + varGrossMargin;
                              varBillingMANMRO := varBillingMANMRO + varBilling;
                              varForecastMANMRO := varForecastMANMRO + varForecast;
                              varBlockMANMRO := varBlockMANMRO + varBlock;
                              varLateMANMRO := varLateMANMRO + varLate;
                              varMonthMANMRO := varMonthMANMRO + varMonth;

                            end
                            else
                            begin

                              varActualTAMMRO      := varActualTAMMRO + varActual;
                              varBacklogTAMMRO     := varBacklogTAMMRO + varBacklog;
                              varGrossMarginTAMMRO := varGrossMarginTAMMRO + varGrossMargin;
                              varBillingTAMMRO     := varBillingTAMMRO + varBilling;
                              varForecastTAMMRO    := varForecastTAMMRO + varForecast;
                              varBlockTAMMRO       := varBlockTAMMRO + varBlock;
                              varLateTAMMRO        := varLateTAMMRO + varLate;
                              varMonthTAMMRO       := varMonthTAMMRO + varMonth;

                            end;

                        end;

                      end;

                      if varCanal.ToUpper.Trim.Equals('DM') then  //Seton - Marcos
                      begin
                           varActualDM      := varActualDM  + varActual;
                           varBacklogDM     := varBacklogDM  + varBacklog;
                           varGrossMarginDM := varGrossMarginDM   + varGrossMargin;
                           varBillingDM     := varBillingDM  + varBilling;
                           varForecast      := FDQueryTSOP_SETONFORECASTTSOP_VALOR_FORECAST.asFloat;
                           varForecastDM    := varForecastDM + varForecast;
                           varBlockDM       := varBlockDM + varBlock;
                           varLateDM        := varLateDM + varLate;
                           varMonthDM       := varMonthDM + varMonth;
                      end;


                      if varCanal.ToUpper.Trim.Equals('PID') then
                      begin

                        if varOrigem.ToUpper.Trim.Equals( 'ACC OWNER' ) then
                        begin

                          if (FDQueryVSOP_OrderBillingPedidosTSOP_REPACCTYP.AsString.ToUpper.Trim.Equals('KA'))  Then
                         // if (FDQuerySalesRepTSIS_USUNOM.AsString.ToUpper.Trim.Equals( 'HERIVELTO FELIPPI' )) Then
                            //  FDQuerySalesRepTSIS_USUNOM.AsString.ToUpper.Trim.Equals( 'GUILHERME COUTO' ) or
                            //  FDQuerySalesRepTSIS_USUNOM.AsString.ToUpper.Trim.Equals( 'ERIC FURUYA' )) then
                          begin

                            varActualPID_KA      := varActualPID_KA + varActual;
                            varBacklogPID_KA     := varBacklogPID_KA + varBacklog;
                            varGrossMarginPID_KA := varGrossMarginPID_KA + varGrossMargin;
                            varBillingPID_KA     := varBillingPID_KA + varBilling;
                            varForecastPID_KA    := varForecastPID_KA + varForecast;
                            varBlockPID_KA       := varBlockPID_KA + varBlock;
                            varLatePID_KA        := varLatePID_KA + varLate;
                            varMonthPID_KA       := varMonthPID_KA + varMonth;

                          end
                          else
                          begin

                            varActualPID_Reg      := varActualPID_Reg + varActual;
                            varBacklogPID_Reg     := varBacklogPID_Reg + varBacklog;
                            varGrossMarginPID_Reg := varGrossMarginPID_Reg + varGrossMargin;
                            varBillingPID_Reg     := varBillingPID_Reg + varBilling;
                            varForecastPID_Reg    := varForecastPID_Reg + varForecast;
                            varBlockPID_Reg       := varBlockPID_Reg + varBlock;
                            varLatePID_Reg        := varLatePID_Reg + varLate;
                            varMonthPID_Reg       := varMonthPID_Reg + varMonth;
                          end;

                        end;
                       { else
                        if varOrigem.ToUpper.Trim.Equals( 'REGION OWNER' ) then
                        begin

                          varActualPID_KAReg := varActualPID_KAReg + varActual;
                          varBacklogPID_KAReg := varBacklogPID_KAReg + varBacklog;
                          varGrossMarginPID_KAReg := varGrossMarginPID_KAReg + varGrossMargin;
                          varBillingPID_KAReg := varBillingPID_KAReg + varBilling;
                          varForecastPID_KAReg := varForecastPID_KAReg + varForecast;

                        end;
                        }
                        if varOrigem.ToUpper.Trim.Equals( 'ACC OWNER' ) then
                        begin

                          if varSite.ToUpper.Trim.Equals('MANAUS') then
                          begin

                            varActualMANPID      := varActualMANPID + varActual;
                            varBacklogMANPID     := varBacklogMANPID + varBacklog;
                            varGrossMarginMANPID := varGrossMarginMANPID + varGrossMargin;
                            varBillingMANPID     := varBillingMANPID + varBilling;
                            varForecastMANPID    := varForecastMANPID + varForecast;
                            varBlockMANPID       := varBlockMANPID + varBlock;
                            varLateMANPID        := varLateMANPID + varLate;
                            varMonthMANPID       := varMonthMANPID + varMonth;
                          end
                          else
                          begin

                            varActualTAMPID      := varActualTAMPID + varActual;
                            varBacklogTAMPID     := varBacklogTAMPID + varBacklog;
                            varGrossMarginTAMPID := varGrossMarginTAMPID + varGrossMargin;
                            varBillingTAMPID     := varBillingTAMPID + varBilling;
                            varForecastTAMPID    := varForecastTAMPID + varForecast;
                            varBlockTAMPID       := varBlockTAMPID + varBlock;
                            varLateTAMPID        := varLateTAMPID + varLate;
                            varMonthTAMPID       := varMonthTAMPID + varMonth;

                          end;

                          varActualTOTPID      := varActualTOTPID      + varActual;
                          varForecastTOTPID    := varForecastTOTPID    + varForecast;
                          varBillingTOTPID     := varBillingTOTPID     + varBilling;
                          varBacklogTOTPID     := varBacklogTOTPID     + varBacklog;
                          varGrossMarginTOTPID := varGrossMarginTOTPID + varGrossMargin;
                          varBlockTOTPID       := varBlockTOTPID       + varBlock;
                          varLateTOTPID        := varLateTOTPID        + varLate;
                          varMonthTOTPID       := varMonthTOTPID       + varMonth;


                        end;

                      end;

                    end;


                    varActualOrigem      := varActualOrigem + varActual;
                    varBacklogOrigem     := varBacklogOrigem + varBacklog;
                    varGrossMarginOrigem := varGrossMarginOrigem + varGrossMargin;
                    varBillingOrigem     := varBillingOrigem + varBilling;
                    varForecastOrigem    := varForecastOrigem + varForecast;
                    varBlockOrigem       := varBlockOrigem + varBlock;
                    varLateOrigem        := varLateOrigem + varLate;
                    varMonthOrigem       := varMonthOrigem + varMonth;

                    varActualCanal := varActualCanal + varActual;
                    varBacklogCanal := varBacklogCanal + varBacklog;
                    varGrossMarginCanal := varGrossMarginCanal + varGrossMargin;
                    varBillingCanal := varBillingCanal + varBilling;
                    varForecastCanal := varForecastCanal + varForecast;
                    varBlockCanal :=  varBlockCanal + varBlock;
                    varLateCanal  := varLateCanal + varLate;
                    varMonthCanal := varMonthCanal + varMonth;

                    varActualSite := varActualSite + varActual;
                    varBacklogSite := varBacklogSite + varBacklog;
                    varGrossMarginSite := varGrossMarginSite + varGrossMargin;
                    varBillingSite := varBillingSite + varBilling;
                    varForecastSite := varForecastSite + varForecast;
                    varBlockSite := varBlockSite + varBlock;
                    varLateSite := varLateSite + varLate;
                    varMonthSite := varMonthSite + varMonth;

                    varActualSalesRep := varActualSalesRep + varActual;
                    varBacklogSalesRep := varBacklogSalesRep + varBacklog;
                    varGrossMarginSalesRep := varGrossMarginSalesRep + varGrossMargin;
                    varBillingSalesRep := varBillingSalesRep + varBilling;
                    varForecastSalesRep := varForecastSalesRep + varForecast;
                    varBlockSalesRep  :=  varBlockSalesRep + varBlock;
                    varLateSalesRep := varLateSalesRep + varLate;
                    varMonthSalesRep := varMonthSalesRep + varMonth;

                    FDQueryVSOP_OrderBillingPedidos.Next;

                    if varOrigem <> FDQueryVSOP_OrderBillingPedidosTSOP_ORDBILORI.AsString then
                      Break;

                    if varCanal <> FDQueryVSOP_OrderBillingPedidosTSOP_ORDBILCANNOM.AsString then
                      Break;

                    if varSite <> FDQueryVSOP_OrderBillingPedidosTSOP_ORDBILSITNOM.AsString.ToUpper.Trim then
                      Break;

                  end;

                  if varBodyAux.Count = 0 then
                      varBody.Delete(varBody.Count-1);

                  varBodyAux.Sort;
                  varBody.AddStrings(varBodyAux);
                  varBodyAux.Clear;

                 // varBody.SaveToFile('c:\temp\marcoshtml.html');

                  if varForecastOrigem = 0.00 then
                    varPercentualOrigem := 0.00
                  else
                    varPercentualOrigem := varActualOrigem/varForecastOrigem*100.00;

                  varBody.Text := varBody.Text.Replace( '%back-tot-origem%', FormatFloat('#,##0', varLateOrigem) ).Replace( '%gm-tot-origem%', FormatFloat('#,##0', varGrossMarginOrigem) ).Replace( '%bill-tot-origem%', FormatFloat('#,##0', varBillingOrigem) ).Replace( '%act-tot-origem%', FormatFloat('#,##0', varActualOrigem) ).Replace( '%fct-tot-origem%', FormatFloat('#,##0', varForecastOrigem) ).Replace( '%act-fct-origem%', FormatFloat('#,##0', varActualOrigem-varForecastOrigem) ).Replace( '%act/fct-origem%', FormatFloat('#,##0', varPercentualOrigem)+'%' ).Replace('%act-ordb-origem%', FormatFloat('#,##0', varBlockOrigem)).Replace('%mont-tot-origem%', FormatFloat('#,##0', varMonthOrigem))  ;


                  if varCanal <> FDQueryVSOP_OrderBillingPedidosTSOP_ORDBILCANNOM.AsString then
                    Break;

                  if varSite <> FDQueryVSOP_OrderBillingPedidosTSOP_ORDBILSITNOM.AsString.ToUpper.Trim then
                    Break;

                end;


                if varForecastCanal = 0.00 then
                  varPercentualCanal := 0.00
                else
                  varPercentualCanal := varActualCanal/varForecastCanal*100.00;

                if (varForecastCanal+varPercentualCanal+varActualCanal) = 0.00 then
                    varBody.Delete(varBody.Count-1);

                  // varBody.SaveToFile('c:\temp\marcoshtml2.html');

                varBody.Text := varBody.Text.Replace( '%back-tot-canal%', FormatFloat('#,##0', varLateCanal) ).Replace( '%gm-tot-canal%', FormatFloat('#,##0', varGrossMarginCanal) ).Replace( '%bill-tot-canal%', FormatFloat('#,##0', varBillingCanal) ).Replace( '%act-tot-canal%', FormatFloat('#,##0', varActualCanal) ).Replace( '%fct-tot-canal%', FormatFloat('#,##0', varForecastCanal) ).Replace( '%act-fct-canal%', FormatFloat('#,##0', varActualCanal-varForecastCanal) ).Replace( '%act/fct-canal%', FormatFloat('#,##0', varPercentualCanal)+'%' ).Replace('%act-ordb-canal%', FormatFloat('#,##0', varBlockCanal)).Replace('%mont-tot-canal%', FormatFloat('#,##0', varMonthCanal));


                if varSite <> FDQueryVSOP_OrderBillingPedidosTSOP_ORDBILSITNOM.AsString.ToUpper.Trim then
                  Break;

              end;


              if varForecastSite = 0.00 then
                varPercentualSite := 0.00
              else
                varPercentualSite := varActualSite/varForecastSite*100.00;

              if (varForecastSite+varPercentualSite+varActualSite) = 0.00 then
                  varBody.Delete(varBody.Count-1);

              varBody.Text := varBody.Text.Replace( '%back-tot-site%', FormatFloat('#,##0', varLateSite) ).Replace( '%gm-tot-site%', FormatFloat('#,##0', varGrossMarginSite) ).Replace( '%bill-tot-site%', FormatFloat('#,##0', varBillingSite) ).Replace( '%act-tot-site%', FormatFloat('#,##0', varActualSite) ).Replace( '%fct-tot-site%', FormatFloat('#,##0', varForecastSite) ).Replace( '%act-fct-site%', FormatFloat('#,##0', varActualSite-varForecastSite) ).Replace( '%act/fct-site%', FormatFloat('#,##0', varPercentualSite)+'%' ).Replace('%act-ordb-site%', FormatFloat('#,##0', varBlockSite)).Replace('%mont-tot-site%', FormatFloat('#,##0', varMonthSite));


            end;

            if varForecastSalesRep = 0.00 then
              varPercentualSalesRep := 0.00
            else
              varPercentualSalesRep := varActualSalesRep/varForecastSalesRep*100.00;

            varBody.Text := varBody.Text.Replace( '%back-tot-salesrep%', FormatFloat('#,##0', varLateSalesRep ) ).Replace( '%gm-tot-salesrep%', FormatFloat('#,##0', varGrossMarginSalesRep) ).Replace( '%bill-tot-salesrep%', FormatFloat('#,##0', varBillingSalesRep) ).Replace( '%act-tot-salesrep%', FormatFloat('#,##0', varActualSalesRep) ).Replace( '%fct-tot-salesrep%', FormatFloat('#,##0', varForecastSalesRep) ).Replace( '%act-fct-salesrep%', FormatFloat('#,##0', varActualSalesRep-varForecastSalesRep) ).Replace( '%act/fct-salesrep%', FormatFloat('#,##0', varPercentualSalesRep)+'%' ).Replace('%act-ordb-salesrep%', FormatFloat('#,##0', varBlockSalesRep)).Replace('%mont-tot-salesrep%', FormatFloat('#,##0', varMonthSalesRep));


            varBody.Add( varBody04.Text );

            varBodyTotal.Add( varBody.Text );

          //  varBody.SaveToFile('c:\temp\marcoshtml3.html');

            if Monthly then
              varAssunto := 'Monthly S&OP - ' + FormatDateTime('mmmm yyyy', varNow) + ' - ' + FDQuerySalesRepTSIS_USUNOM.AsString
            else
              varAssunto := 'Daily S&OP - ' + FDQuerySalesRepTSIS_USUNOM.AsString;

            Writeln('Enviando Email: ' + varAssunto);

            varACBrMail.Clear;

            varACBrMail.Clear;
            varACBrMail.Host := 'smtp.gmail.com';
            varACBrMail.Port := '465';
            varACBrMail.SetSSL := True;
            varACBrMail.SetTLS := false;
            varACBrMail.Username := 'suportebrasil@bradycorp.com';
            varACBrMail.Password := 'spUhurebRuF5';
            varACBrMail.From := 'suportebrasil@bradycorp.com';
            varACBrMail.FromName := 'Suporte Brasil';



            varACBrMail.AddAddress(FDQuerySalesRepTSIS_USUEML.AsString, FDQuerySalesRepTSIS_USUNOM.AsString);
          //  varACBrMail.AddAddress('marcos.jesus.external@k2partnering.com', 'Marcos');
          //  varACBrMail.AddAddress('LUCIANA_PONTIERI@BRADYCORP.com', 'Luciana');


            varACBrMail.Subject := varAssunto;
            varACBrMail.IsHTML := True;
            varACBrMail.Body.Assign(varBody);

            try

              varACBrMail.Send;

            except

              on E: Exception do
              begin

                Writeln( E.Message );

              end;

            end;

          end;

          FDQuerySalesRep.Next;

        end;

        varBodyTotal2.Clear;
        varBodyTotal2.AddStrings(varBodyTotal);
        varBodyTotal.Clear;

        varBodyTotal.Add( varBody08.Text.Replace('%FY%', FDQueryVSOP_OrderBillingPedidosTSOP_ORDBILDAT.AsString ) );

        {if varForecastMANMRO = 0.00 then
          varPercentualMANMRO := 0.00
        else
          varPercentualMANMRO := varActualMANMRO/varForecastMANMRO*100.00;

        varBodyTotal.Add( varBody07.Text.Replace( '%Geral%', 'MANAUS - MRO' ) );
        varBodyTotal.Text := varBodyTotal.Text.Replace( '%back-tot-geral%', FormatFloat('#,##0', varBacklogMANMRO) ).Replace( '%gm-tot-geral%', FormatFloat('#,##0', varGrossMarginMANMRO) ).Replace( '%bill-tot-geral%', FormatFloat('#,##0', varBillingMANMRO) ).Replace( '%act-tot-geral%', FormatFloat('#,##0', varActualMANMRO) ).Replace( '%fct-tot-geral%', FormatFloat('#,##0', varForecastMANMRO) ).Replace( '%act-fct-geral%', FormatFloat('#,##0', varActualMANMRO-varForecastMANMRO) ).Replace( '%act/fct-geral%', FormatFloat('#,##0', varPercentualMANMRO)+'%' );

        if varForecastTAMMRO = 0.00 then
          varPercentualTAMMRO := 0.00
        else
          varPercentualTAMMRO := varActualTAMMRO/varForecastTAMMRO*100.00;

        varBodyTotal.Add( varBody07.Text.Replace( '%Geral%', 'TAMBOR� - MRO' ) );
        varBodyTotal.Text := varBodyTotal.Text.Replace( '%back-tot-geral%', FormatFloat('#,##0', varBacklogTAMMRO) ).Replace( '%gm-tot-geral%', FormatFloat('#,##0', varGrossMarginTAMMRO) ).Replace( '%bill-tot-geral%', FormatFloat('#,##0', varBillingTAMMRO) ).Replace( '%act-tot-geral%', FormatFloat('#,##0', varActualTAMMRO) ).Replace( '%fct-tot-geral%', FormatFloat('#,##0', varForecastTAMMRO) ).Replace( '%act-fct-geral%', FormatFloat('#,##0', varActualTAMMRO-varForecastTAMMRO) ).Replace( '%act/fct-geral%', FormatFloat('#,##0', varPercentualTAMMRO)+'%' );
          }
       // if varForecastMANPID = 0.00 then
       //   varPercentualMANPID := 0.00
       // else
        //  varPercentualMANPID := varActualMANPID/varForecastMANPID*100.00;

      //  varBodyTotal.Add( varBody07.Text.Replace( '%Geral%', 'MANAUS - PID' ) );
      //  varBodyTotal.Text := varBodyTotal.Text.Replace( '%back-tot-geral%', FormatFloat('#,##0', varBacklogMANPID) ).Replace( '%gm-tot-geral%', FormatFloat('#,##0', varGrossMarginMANPID) ).Replace( '%bill-tot-geral%', FormatFloat('#,##0', varBillingMANPID) ).Replace( '%act-tot-geral%', FormatFloat('#,##0', varActualMANPID) ).Replace( '%fct-tot-geral%', FormatFloat('#,##0', varForecastMANPID) ).Replace( '%act-fct-geral%', FormatFloat('#,##0', varActualMANPID-varForecastMANPID) ).Replace( '%act/fct-geral%', FormatFloat('#,##0', varPercentualMANPID)+'%' );


        if varForecastTOTPID = 0.00 then
          varPercentualTOTPID := 0.00
        else
          varPercentualTOTPID := varActualTOTPID/varForecastTOTPID*100.00;

        varBodyTotal.Add( varBody09.Text.Replace( '%Geral%', 'PID' ) );
        varBodyTotal.Text := varBodyTotal.Text.Replace( '%back-tot-geral%', FormatFloat('#,##0', varLateTOTPID) ).Replace( '%gm-tot-geral%', FormatFloat('#,##0', varGrossMarginTOTPID) ).Replace( '%bill-tot-geral%', FormatFloat('#,##0', varBillingTOTPID) ).Replace( '%act-tot-geral%', FormatFloat('#,##0', varActualTOTPID) ).Replace( '%fct-tot-geral%', FormatFloat('#,##0', varForecastTOTPID) ).Replace( '%act-fct-geral%', FormatFloat('#,##0', varActualTOTPID-varForecastTOTPID) ).Replace( '%act/fct-geral%', FormatFloat('#,##0', varPercentualTOTPID)+'%' ).Replace('%act-ordb-geral%', FormatFloat('#,##0', varBlockTOTPID)).Replace('%mont-tot-geral%', FormatFloat('#,##0', varMonthTOTPID));

        if varForecastMRO = 0.00 then
          varPercentualMRO := 0.00
        else
          varPercentualMRO := varActualMRO/varForecastMRO*100.00;

        varBodyTotal.Add( varBody09.Text.Replace( '%Geral%', 'MRO' ) );
        varBodyTotal.Text := varBodyTotal.Text.Replace( '%back-tot-geral%', FormatFloat('#,##0', varLateMRO) ).Replace( '%gm-tot-geral%', FormatFloat('#,##0', varGrossMarginMRO) ).Replace( '%bill-tot-geral%', FormatFloat('#,##0', varBillingMRO) ).Replace( '%act-tot-geral%', FormatFloat('#,##0', varActualMRO) ).Replace( '%fct-tot-geral%', FormatFloat('#,##0', varForecastMRO) ).Replace( '%act-fct-geral%', FormatFloat('#,##0', varActualMRO-varForecastMRO) ).Replace( '%act/fct-geral%', FormatFloat('#,##0', varPercentualMRO)+'%' ).Replace('%act-ordb-geral%', FormatFloat('#,##0', varBlockMRO)).Replace('%mont-tot-geral%', FormatFloat('#,##0', varMonthMRO));




        if varForecastDM = 0.00 then
          varPercentualDM := 0.00
        else
          varPercentualDM := varActualDM/varForecastDM*100.00;

        varBodyTotal.Add( varBody09.Text.Replace( '%Geral%', 'SETON' ) );
        varBodyTotal.Text := varBodyTotal.Text.Replace( '%back-tot-geral%', FormatFloat('#,##0', varLateDM) ).Replace( '%gm-tot-geral%', FormatFloat('#,##0', varGrossMarginDM) ).Replace( '%bill-tot-geral%', FormatFloat('#,##0', varBillingDM) ).Replace( '%act-tot-geral%', FormatFloat('#,##0', varActualDM) ).Replace( '%fct-tot-geral%', FormatFloat('#,##0', varForecastDM) ).Replace( '%act-fct-geral%', FormatFloat('#,##0', varActualDM-varForecastDM) ).Replace( '%act/fct-geral%', FormatFloat('#,##0', varPercentualDM)+'%' ).Replace('%act-ordb-geral%', FormatFloat('#,##0', varBlockDM)).Replace('%mont-tot-geral%', FormatFloat('#,##0', varMonthDM));



        if varForecastMANPID = 0.00 then
          varPercentualMANPID := 0.00
        else
          varPercentualMANPID := varActualMANPID/varForecastMANPID*100.00;

        varBodyTotal.Add( varBody07.Text.Replace( '%Geral%', 'MANAUS - PID' ) );
        varBodyTotal.Text := varBodyTotal.Text.Replace( '%back-tot-geral%', FormatFloat('#,##0', varLateMANPID) ).Replace( '%gm-tot-geral%', FormatFloat('#,##0', varGrossMarginMANPID) ).Replace( '%bill-tot-geral%', FormatFloat('#,##0', varBillingMANPID) ).Replace( '%act-tot-geral%', FormatFloat('#,##0', varActualMANPID) ).Replace( '%fct-tot-geral%', FormatFloat('#,##0', varForecastMANPID) ).Replace( '%act-fct-geral%', FormatFloat('#,##0', varActualMANPID-varForecastMANPID) ).Replace( '%act/fct-geral%', FormatFloat('#,##0', varPercentualMANPID)+'%' ).Replace('%act-ordb-geral%', FormatFloat('#,##0', varBlockMANPID)).Replace('%mont-tot-geral%', FormatFloat('#,##0', varMonthMANPID));



        if varForecastTAMPID = 0.00 then
          varPercentualTAMPID := 0.00
        else
          varPercentualTAMPID := varActualTAMPID/varForecastTAMPID*100.00;

        varBodyTotal.Add( varBody07.Text.Replace( '%Geral%', 'TAMBOR� - PID' ) );
        varBodyTotal.Text := varBodyTotal.Text.Replace( '%back-tot-geral%', FormatFloat('#,##0', varLateTAMPID) ).Replace( '%gm-tot-geral%', FormatFloat('#,##0', varGrossMarginTAMPID) ).Replace( '%bill-tot-geral%', FormatFloat('#,##0', varBillingTAMPID) ).Replace( '%act-tot-geral%', FormatFloat('#,##0', varActualTAMPID) ).Replace( '%fct-tot-geral%', FormatFloat('#,##0', varForecastTAMPID) ).Replace( '%act-fct-geral%', FormatFloat('#,##0', varActualTAMPID-varForecastTAMPID) ).Replace( '%act/fct-geral%', FormatFloat('#,##0', varPercentualTAMPID)+'%' ).Replace('%act-ordb-geral%', FormatFloat('#,##0', varBlockTAMPID)).Replace('%mont-tot-geral%', FormatFloat('#,##0', varMonthTAMPID));



        if varForecastPID_KA = 0.00 then
          varPercentualPID_KA := 0.00
        else
          varPercentualPID_KA := varActualPID_KA/varForecastPID_KA*100.00;

        varBodyTotal.Add( varBody07.Text.Replace( '%Geral%', 'PID - KA' ) );
        varBodyTotal.Text := varBodyTotal.Text.Replace( '%back-tot-geral%', FormatFloat('#,##0', varLatePID_KA) ).Replace( '%gm-tot-geral%', FormatFloat('#,##0', varGrossMarginPID_KA) ).Replace( '%bill-tot-geral%', FormatFloat('#,##0', varBillingPID_KA) ).Replace( '%act-tot-geral%', FormatFloat('#,##0', varActualPID_KA) ).Replace( '%fct-tot-geral%', FormatFloat('#,##0', varForecastPID_KA) ).Replace( '%act-fct-geral%', FormatFloat('#,##0', varActualPID_KA-varForecastPID_KA) ).Replace( '%act/fct-geral%', FormatFloat('#,##0', varPercentualPID_KA)+'%' ).Replace('%act-ordb-geral%', FormatFloat('#,##0', varBlockPID_KA)).Replace('%mont-tot-geral%', FormatFloat('#,##0', varMonthPID_KA));


        if varForecastPID_Reg = 0.00 then
          varPercentualPID_Reg := 0.00
        else
          varPercentualPID_Reg := varActualPID_Reg/varForecastPID_Reg*100.00;

        varBodyTotal.Add( varBody07.Text.Replace( '%Geral%', 'PID - REG' ) );
        varBodyTotal.Text := varBodyTotal.Text.Replace( '%back-tot-geral%', FormatFloat('#,##0', varLatePID_Reg) ).Replace( '%gm-tot-geral%', FormatFloat('#,##0', varGrossMarginPID_Reg) ).Replace( '%bill-tot-geral%', FormatFloat('#,##0', varBillingPID_Reg) ).Replace( '%act-tot-geral%', FormatFloat('#,##0', varActualPID_Reg) ).Replace( '%fct-tot-geral%', FormatFloat('#,##0', varForecastPID_Reg) ).Replace( '%act-fct-geral%', FormatFloat('#,##0', varActualPID_Reg-varForecastPID_Reg) ).Replace( '%act/fct-geral%', FormatFloat('#,##0', varPercentualPID_Reg)+'%' ).Replace('%act-ordb-geral%', FormatFloat('#,##0', varBlockPID_Reg)).Replace('%mont-tot-geral%', FormatFloat('#,##0', varMonthPID_Reg));

        if varForecastMROKA = 0.00 then
          varPercentualMROKA := 0.00
        else
          varPercentualMROKA := varActualMROKA/varForecastMROKA*100.00;

        varBodyTotal.Add( varBody07.Text.Replace( '%Geral%', 'MRO - KA' ) );
        varBodyTotal.Text := varBodyTotal.Text.Replace( '%back-tot-geral%', FormatFloat('#,##0', varLateMROKA) ).Replace( '%gm-tot-geral%', FormatFloat('#,##0', varGrossMarginMROKA) ).Replace( '%bill-tot-geral%', FormatFloat('#,##0', varBillingMROKA) ).Replace( '%act-tot-geral%', FormatFloat('#,##0', varActualMROKA) ).Replace( '%fct-tot-geral%', FormatFloat('#,##0', varForecastMROKA) ).Replace( '%act-fct-geral%', FormatFloat('#,##0', varActualMROKA-varForecastMROKA) ).Replace( '%act/fct-geral%', FormatFloat('#,##0', varPercentualMROKA)+'%' ).Replace('%act-ordb-geral%', FormatFloat('#,##0', varBlockMROKA)).Replace('%mont-tot-geral%', FormatFloat('#,##0', varMonthMROKA));


        varBodyTotal.Add( varBody04.Text );

        varBodyTotal.AddStrings(varBodyTotal2);

        varCC.Clear;

        if Monthly then
          varAssunto := 'Monthly S&OP - ' + FormatDateTime( 'mmmm yyyy', varNow )
        else
          varAssunto := 'Daily S&OP';

        Writeln('Enviando Email: ' + varAssunto);

        varACBrMail.Clear;
        varACBrMail.Host := 'smtp.gmail.com';
        varACBrMail.Port := '465';
        varACBrMail.SetSSL := True;
        varACBrMail.SetTLS := False;

        varACBrMail.Username := 'suportebrasil@bradycorp.com';
        varACBrMail.Password := 'spUhurebRuF5';

        varACBrMail.From := 'suportebrasil@bradycorp.com';
        varACBrMail.FromName := 'Suporte Brasil';

      // varACBrMail.AddAddress('marcos.jesus.external@k2partnering.com', 'Marcos');
      // varACBrMail.AddAddress('LUCIANA_PONTIERI@BRADYCORP.com', 'Luciana');

 //       varACBrMail.AddAddress( 'suportebrasil@bradycorp.com', 'Suporte Brasil' );

         FDQueryTSOP_EMAIL.Close;
         FDQueryTSOP_EMAIL.SQL.Clear;
         FDQueryTSOP_EMAIL.SQL.Add('Select TSOP_EMAIL From TSOP_EMAIL where TSOP_ATIVO = ''S'' AND');
         FDQueryTSOP_EMAIL.SQL.Add(' TSOP_PROGRAMA = ''SOP_DAILYSALESMAIL''');
         FDQueryTSOP_EMAIL.Open;
         FDQueryTSOP_EMAIL.First;
         while not FDQueryTSOP_EMAIL.eof do
         begin
            varACBrMail.AddAddress(FDQueryTSOP_EMAIL.FieldByName('TSOP_EMAIL').AsString);
            FDQueryTSOP_EMAIL.Next;
         end;
         FDQueryTSOP_EMAIL.Close;

     {

        varACBrMail.AddAddress('EMERSON_ZAIDAN@BRADYCORP.COM');
        varACBrMail.AddAddress('CINTIA_SANTOS@BRADYCORP.COM');
        varACBrMail.AddAddress('MARCIO_TANADA@BRADYCORP.COM');
        varACBrMail.AddAddress('LILIAN_IWATA@BRADYCORP.COM');
        varACBrMail.AddAddress('GUSTAVO_COUTINHO@BRADYCORP.COM');
        varACBrMail.AddAddress('LUIZ_FOLONI@BRADYCORP.COM');
        varACBrMail.AddAddress('LEANDRO_LOPES@BRADYCORP.COM');
        varACBrMail.AddAddress('LUCIANA_PONTIERI@BRADYCORP.COM');
        varACBrMail.AddAddress('ROBERTA_KULCZAR@BRADYCORP.COM');

               }

        varACBrMail.Subject := varAssunto;
        varACBrMail.IsHTML := True;
        varACBrMail.Body.Assign(varBodyTotal);

        try

          varACBrMail.Send;

        except

          on E: Exception do
          begin

            Writeln( E.Message );

          end;

        end;

        // NAO ENVIAR NO TESTE
        varBody01.LoadFromFile( 'C:\Brady\AccOwner-01.html' );
        varBody02.LoadFromFile( 'C:\Brady\AccOwner-02.html' );
        varBody03.LoadFromFile( 'C:\Brady\AccOwner-03.html' );

        varBodyAccOwner.Clear;
        varBodyAccOwner.AddStrings( varBody01 );
        FDQueryAccOwner.Open;
        try

          while not FDQueryAccOwner.Eof do
          begin

            varBodyAccOwner.Add( varBody02.Text.Replace( '%codigo%', FDQueryAccOwnerTSOP_ORDBILCLICOD.AsString ).Replace( '%cliente%', FDQueryAccOwnerTSOP_ORDBILCLINOM.AsString ) );

            FDQueryAccOwner.Next;

          end;

          varBodyAccOwner.AddStrings( varBody03 );

          varCC.Clear;

          if DayOfTheWeek(Now) = DayFriday then
          begin

            varACBrMail.Clear;
            varACBrMail.Host := 'smtp.gmail.com';
            varACBrMail.Port := '465';
            varACBrMail.SetSSL := True;
            varACBrMail.SetTLS := False;

            varACBrMail.Username := 'suportebrasil@bradycorp.com';
            varACBrMail.Password := 'spUhurebRuF5'; // 'Rsp1984#$%asd';

            varACBrMail.From := 'suportebrasil@bradycorp.com';
            varACBrMail.FromName := 'Suporte Brasil';

            FDQueryTSOP_EMAIL.Close;
            FDQueryTSOP_EMAIL.SQL.Clear;
            FDQueryTSOP_EMAIL.SQL.Add('Select TSOP_EMAIL From TSOP_EMAIL where TSOP_ATIVO = ''S'' AND');
            FDQueryTSOP_EMAIL.SQL.Add(' TSOP_PROGRAMA = ''SOP_DAILYSALESMAIL_SEMREP''');
            FDQueryTSOP_EMAIL.Open;
            FDQueryTSOP_EMAIL.First;
            while not FDQueryTSOP_EMAIL.eof do
            begin
               varACBrMail.AddAddress(FDQueryTSOP_EMAIL.FieldByName('TSOP_EMAIL').AsString);
               FDQueryTSOP_EMAIL.Next;
            end;
            FDQueryTSOP_EMAIL.Close;

//            varACBrMail.AddAddress( 'suportebrasil@bradycorp.com', 'Suporte Brasil' );
          {  varACBrMail.AddAddress('EMERSON_ZAIDAN@BRADYCORP.COM');
            varACBrMail.AddAddress('MARCIO_TANADA@BRADYCORP.COM');
            varACBrMail.AddAddress('LILIAN_IWATA@BRADYCORP.COM');
            varACBrMail.AddAddress('LEANDRO_LOPES@BRADYCORP.COM');
            varACBrMail.AddAddress('LUCIANA_PONTIERI@BRADYCORP.COM');
               }
            varACBrMail.Subject := 'S&OP - SEM REPRESENTANTE';
            varACBrMail.IsHTML := True;
            varACBrMail.Body.Assign(varBodyAccOwner);

            Writeln('Enviando Email: S&OP - SEM REPRESENTANTE');
            try

              varACBrMail.Send;

            except

              on E: Exception do
              begin

                Writeln( E.Message );

              end;

            end;

          end;

        finally

          FDQueryAccOwner.Close;

        end;

        varBody01.LoadFromFile( 'C:\Brady\AccOwner-01.html' );
        varBody02.LoadFromFile( 'C:\Brady\AccOwner-02.html' );
        varBody03.LoadFromFile( 'C:\Brady\AccOwner-03.html' );

        varBodyGrupoCliente.Clear;
        varBodyGrupoCliente.AddStrings( varBody01 );
        FDQueryGrupoCliente.Open;
        try

          while not FDQueryGrupoCliente.Eof do
          begin

            varBodyGrupoCliente.Add( varBody02.Text.Replace( '%codigo%', FDQueryGrupoClienteTSOP_ORDBILCLICOD.AsString ).Replace( '%cliente%', FDQueryGrupoClienteTSOP_ORDBILCLINOM.AsString ) );

            FDQueryGrupoCliente.Next;

          end;

          varBodyGrupoCliente.AddStrings( varBody03 );

          varCC.Clear;

          Writeln('Enviando Email');
          if DayOfWeek(Now) = DayFriday then
          begin

            varACBrMail.Clear;
            varACBrMail.Host := 'smtp.gmail.com';
            varACBrMail.Port := '465';
            varACBrMail.SetSSL := True;
            varACBrMail.SetTLS := False;

            varACBrMail.Username := 'suportebrasil@bradycorp.com';
            varACBrMail.Password := 'spUhurebRuF5'; // 'Rsp1984#$%asd';

            varACBrMail.From := 'suportebrasil@bradycorp.com';
            varACBrMail.FromName := 'Suporte Brasil';

            FDQueryTSOP_EMAIL.Close;
            FDQueryTSOP_EMAIL.SQL.Clear;
            FDQueryTSOP_EMAIL.SQL.Add('Select TSOP_EMAIL From TSOP_EMAIL where TSOP_ATIVO = ''S'' AND');
            FDQueryTSOP_EMAIL.SQL.Add(' TSOP_PROGRAMA = ''SOP_DAILYSALESMAIL_SEMGRUCLI''');
            FDQueryTSOP_EMAIL.Open;
            FDQueryTSOP_EMAIL.First;
            while not FDQueryTSOP_EMAIL.eof do
            begin
               varACBrMail.AddAddress(FDQueryTSOP_EMAIL.FieldByName('TSOP_EMAIL').AsString);
               FDQueryTSOP_EMAIL.Next;
            end;
            FDQueryTSOP_EMAIL.Close;
            {

//            varACBrMail.AddAddress( 'suportebrasil@bradycorp.com', 'Suporte Brasil' );
            varACBrMail.AddAddress('EMERSON_ZAIDAN@BRADYCORP.COM');
            varACBrMail.AddAddress('MARCIO_TANADA@BRADYCORP.COM');
            varACBrMail.AddAddress('LILIAN_IWATA@BRADYCORP.COM');
            varACBrMail.AddAddress('LEANDRO_LOPES@BRADYCORP.COM');
            varACBrMail.AddAddress('LUCIANA_PONTIERI@BRADYCORP.COM');
                  }
            varACBrMail.Subject := 'S&OP - SEM GRUPO DE CLIENTE';
            varACBrMail.IsHTML := True;
            varACBrMail.Body.Assign(varBodyGrupoCliente);

            Writeln('Enviando Email: S&OP - SEM GRUPO DE CLIENTE');
            try

              varACBrMail.Send;

            except

              on E: Exception do
              begin

                Writeln( E.Message );

              end;

            end;

          end;

        finally

          FDQueryGrupoCliente.Close;

        end;

      finally

        FDQuerySalesRep.Close;
        FDConnection.Close;

      end;

    end;

  finally

    FreeAndNil(Fr_Dados);
    FreeAndNil(varACBrNFe);
    FreeAndNil(varACBrMail);
    FreeAndNil(varBodyTotal);
    FreeAndNil(varBodyAccOwner);
    FreeAndNil(varBodyGrupoCliente);
    FreeAndNil(varBody);
    FreeAndNil(varCC);
    FreeAndNil(varBody01);
    FreeAndNil(varBody02);
    FreeAndNil(varBody03);
    FreeAndNil(varBody04);
    FreeAndNil(varBody05);
    FreeAndNil(varBody06);
    FreeAndNil(varBody07);
    FreeAndNil(varBody08);
    FreeAndNil(varBody09);
    FreeAndNil(varBodyAux);

  end;


  Writeln('Fim: ','EnviarEmailValores');

end;

procedure SendForecastSalesMail;
var
  dxSpreadSheet: TdxSpreadSheet;

  varACBrNFe: TACBrNFe;
  varACBrMail: TACBrMail;
  varBody: TStringList;
  varAssunto: String;

begin

  varBody := TStringList.Create;
  varACBrNFe := TACBrNFe.Create(nil);
  varACBrMail := TACBrMail.Create(nil);
  varACBrNFe.MAIL := varACBrMail;

  Writeln( 'Criando DataModule' );
  Fr_Dados := TFr_Dados.Create(nil);
  try

    with Fr_Dados do
    begin

      Writeln('Config FDConnection');
      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );

      Writeln('Open FDConnection');
      FDConnection.Open;
      try

        FDQuerySalesRep.ParamByName( 'MES_INI' ).AsDateTime := System.DateUtils.StartOfTheMonth(Now);
        FDQuerySalesRep.ParamByName( 'MES_FIM' ).AsDateTime := System.DateUtils.EndOfTheMonth(Now);

        FDQuerySalesRep.Close;
        FDQuerySalesRep.Open;

        while not FDQuerySalesRep.Eof do
        begin

          Writeln('Set FDQuery');
          FDQueryForecast.ParamByName( 'DATAINI' ).AsDateTime := System.DateUtils.EndOfTheMonth(Now-365)+1;
          FDQueryForecast.ParamByName( 'DATAFIM' ).AsDateTime := System.DateUtils.EndOfTheMonth(Now+365)+1;
          FDQueryForecast.ParamByName( 'REPNOM' ).AsString := FDQuerySalesRepTSIS_USUNOM.AsString;

          Writeln('Open FDQuery');
          FDQueryForecast.Close;
          FDQueryForecast.Open;

          if not FDQueryForecast.Eof then
          begin

            varBody.Clear;
            varBody.Add( FDQuerySalesRepTSIS_USUNOM.AsString.ToUpper.Trim );

            dxSpreadSheet := TdxSpreadSheet.Create(nil);
            try

              Writeln('Lendo Planilha ', 'C:\Brady\Files\SOP\Arquivos\Forecast_Upload.xlsx');
              dxSpreadSheet.LoadFromFile( 'C:\Brady\Files\SOP\Arquivos\Forecast_Upload.xlsx' );
              dxSpreadSheet.ActiveSheetAsTable.InsertRows(2,Trunc(FDQueryForecast.RecordCount/12));

              while not FDQueryForecast.Eof do
              begin

                dxSpreadSheet.ActiveSheetAsTable.Rows[2].Cells[0].AsString := FDQueryForecastTSOP_ORDBILGRUCLINOM.AsString;
                dxSpreadSheet.ActiveSheetAsTable.Rows[2].Cells[1].AsString := FDQueryForecastTSOP_ORDBILCLICOD.AsString;
                dxSpreadSheet.ActiveSheetAsTable.Rows[2].Cells[2].AsString := FDQueryForecastTSOP_ORDBILCLINOM.AsString;

                FDQueryForecast.Next;

              end;

            finally

              FreeAndNil(dxSpreadSheet);

            end;

            varAssunto := 'Daily S&OP - ' + FDQuerySalesRepTSIS_USUNOM.AsString;

            Writeln('Enviando Email: ' + varAssunto);

            varACBrMail.Clear;
            varACBrMail.Host := 'smtp.gmail.com';
            varACBrMail.Port := '465';
            varACBrMail.SetSSL := True;
            varACBrMail.SetTLS := False;

            varACBrMail.Username := 'suportebrasil@bradycorp.com';
            varACBrMail.Password := 'spUhurebRuF5'; // 'Rsp1984#$%asd';

            varACBrMail.From := 'suportebrasil@bradycorp.com';
            varACBrMail.FromName := 'Suporte Brasil';

//            varACBrMail.AddAddress( 'suportebrasil@bradycorp.com', 'Suporte Brasil' );
            varACBrMail.AddAddress(FDQuerySalesRepTSIS_USUEML.AsString, FDQuerySalesRepTSIS_USUNOM.AsString);

            varACBrMail.Subject := varAssunto;
            varACBrMail.IsHTML := True;
            varACBrMail.Body.Assign(varBody);

            try

              varACBrMail.Send;

            except

              on E: Exception do
              begin

                Writeln( E.Message );

              end;

            end;

          end;

          FDQuerySalesRep.Next;

        end;

      finally

        FDQuerySalesRep.Close;
        FDConnection.Close;

      end;

    end;

  finally


  end;


  Writeln('Fim: ','SendForecastSalesMail');

end;

procedure UploadTXTParcelaDedutivel;
var
  varSIOP_011: TStringList;
  varInicial, varFinal: Integer;
  varCMD: AnsiString;
  I: Integer;

begin

  Writeln( 'Criando DataModule' );
  Fr_Dados := TFr_Dados.Create(nil);

  Writeln( 'Criando StringList' );
  varSIOP_011 := TStringList.Create;
  try

    with Fr_Dados do
    begin

      Writeln('Config FDConnection');
      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );

      Writeln( 'Open FDConnection' );
      FDConnection.Open;
      try

        Writeln( 'Abrindo arquivo C:\Brady\Files\FIS\BR-SIOP-011.txt' );
        varSIOP_011.LoadFromFile( 'C:\Brady\Files\FIS\BR-SIOP-011.txt' );

        Writeln( 'Removendo linhas' );
        for I := varSIOP_011.Count-1 downto 0 do
          if not (varSIOP_011[I].CountChar('|') = 12) then
            varSIOP_011.Delete(I);

        Writeln( 'Linha Inicial' );
        varInicial := StrToIntDef(ParamStr(2).Replace('-',''),0);

        if varInicial = 0 then
        begin

          Writeln( 'Apagando TFIS_ParcelaDedutivel' );
          FDScriptTFIS_ParcelaDedutivel.ExecuteAll;

          I := 1;
          while I <= varSIOP_011.Count-1 do
          begin

            varCMD := AnsiString( ParamStr(0)+ ' ' + '-parcela_dedutivel -' + IntToStr(I) );

            Writeln( varCMD );
            WinExec( PAnsiChar(varCMD), 1 );
            Inc(I,300);

          end;

        end
        else
        begin

          if ( varInicial + 299 ) > (varSIOP_011.Count-1) then
            varFinal := varSIOP_011.Count-1
          else
            varFinal := varInicial + 299;


          Writeln( 'Abrindo Query' );
          FDQueryTFIS_ParcelaDedutivel.Open;
          try

            Writeln( 'Looping linhas' );
            for I := varInicial to varFinal do
            begin

              Writeln( 'BOM (',I,'/',varFinal,'): ', varSIOP_011[I].Split(['|'])[2].Trim );

              FDQueryTFIS_ParcelaDedutivel.Append;
              FDQueryTFIS_ParcelaDedutivel.FieldByName('TFIS_ITECOD').AsString := varSIOP_011[I].Split(['|'])[1].Trim;

              FDQueryTFIS_ParcelaDedutivel.FieldByName('TFIS_ITEQTD').AsFloat := StrToFloat(varSIOP_011[I].Split(['|'])[2].Trim.Replace( ',', '', [rfReplaceAll] ).Replace( '.', FormatSettings.DecimalSeparator, [rfReplaceAll] ));
              FDQueryTFIS_ParcelaDedutivel.FieldByName('TFIS_ITEQTDMPR').AsFloat := StrToFloat(varSIOP_011[I].Split(['|'])[7].Trim.Replace( ',', '', [rfReplaceAll] ).Replace( '.', FormatSettings.DecimalSeparator, [rfReplaceAll] ));
              FDQueryTFIS_ParcelaDedutivel.FieldByName('TFIS_ITEORIMPR').AsInteger := StrToIntDef(varSIOP_011[I].Split(['|'])[9].Trim,0);
              FDQueryTFIS_ParcelaDedutivel.FieldByName('TFIS_ITEPREPORMPR').AsFloat := StrToFloat(varSIOP_011[I].Split(['|'])[10].Trim.Replace( ',', '', [rfReplaceAll] ).Replace( '.', FormatSettings.DecimalSeparator, [rfReplaceAll] ));
              FDQueryTFIS_ParcelaDedutivel.FieldByName('TFIS_ITEPREMPR').AsFloat := StrToFloat(varSIOP_011[I].Split(['|'])[11].Trim.Replace( ',', '', [rfReplaceAll] ).Replace( '.', FormatSettings.DecimalSeparator, [rfReplaceAll] ));
              FDQueryTFIS_ParcelaDedutivel.FieldByName('TFIS_PARDEDANOMES').AsString := FormatDateTime( 'yyyymm', StartOfTheMonth(Now)-1 );

              try

                FDQueryTFIS_ParcelaDedutivel.Post;

              except

                on E: Exception do
                begin

                  Writeln( 'Post: ', E.Message );
                  FDQueryTFIS_ParcelaDedutivel.Cancel;

                end;

              end;

              if Frac(I / 100) = 0 then
              begin

                try

                  Writeln( 'ApplyUpdates' );
                  FDQueryTFIS_ParcelaDedutivel.ApplyUpdates;

                  Writeln( 'CommitUpdates' );
                  FDQueryTFIS_ParcelaDedutivel.CommitUpdates;

                except

                  on E: Exception do
                  begin

                    Writeln( 'CommitUpdates: ', E.Message );

                  end;

                end;

              end;

            end;

          finally

            try

              Writeln( 'ApplyUpdates' );
              FDQueryTFIS_ParcelaDedutivel.ApplyUpdates;

              Writeln( 'CommitUpdates' );
              FDQueryTFIS_ParcelaDedutivel.CommitUpdates;

            except

              on E: Exception do
              begin

                Writeln( 'CommitUpdates: ', E.Message );

              end;

            end;

            FDQueryTFIS_ParcelaDedutivel.Close;

          end;

        end;

      finally

        FDConnection.Close;

      end;

    end;

  finally

    FreeAndNil(varSIOP_011);
    FreeAndNil(Fr_Dados);

  end;

end;

function SegundoDiaUtil: Boolean;
var
  iCurrentDay: Integer;
  iWorkDay: Integer;

begin

  iWorkDay := 0;
  for iCurrentDay := Trunc(DateUtils.StartOfTheMonth(Now)) to Trunc(Now) do
  begin

    if not (DateUtils.DayOfTheWeek(iCurrentDay) in [DaySaturday,DayMonday]) then
      Inc(iWorkDay);

  end;

  Result := iWorkDay = 2;

end;



function DirExists( const Directory: string ): boolean;
var
  Code: Integer;
begin
  Code := GetFileAttributes(PChar(Directory));
  Result := (Code <> -1) and (FILE_ATTRIBUTE_DIRECTORY and Code <> 0);
end;



procedure ReceberEmailNFE;
var
  varSSL       : TIdSSLIOHandlerSocketOpenSSL;
  varIdIMAP41  : TIdIMAP4;
  varMsgXml    : TIdMessage;
  varSMTP      : TStringList;
  varFolderSistema : String;

  TheFlags    : TIdMessageFlagsSet;
  varSearch   : array of TIdIMAP4SearchRec;
  TheUID      : string;
  i,j, nCount, x : integer;
  varXML, varTmp,  varToday, varDataEmail : string;
  ACBrCTe: TACBrCTe;
  ACBrNFe: TACBrNFe;
  bMoverNFE, bMoverCTE : Boolean;
  XMLDoc    : TXMLDocument;
  bOthers, bPDF        : Boolean;
  infEvento, retEvento : IXMLNode;
  NivelNo1, Nivelno2   : String;
begin

  varFolderSistema := ExtractFilePath(Application.ExeName);
  if not DirExists( IncludeTrailingPathDelimiter( varFolderSistema )  ) then
    varFolderSistema := 'T:\';

  Writeln('Pasta do BradyDataImport ->' + varFolderSistema);
  doSaveLog(ExtractFilePath(Application.ExeName) + 'Temp', 'Pasta do BradyDataImport ->' + varFolderSistema);
  varSMTP     := TStringList.Create;
  varSSL      := TIdSSLIOHandlerSocketOpenSSL.Create(Nil);
  varIdIMAP41 := TIdIMAP4.Create(Nil);
  varMsgXml   := TIdMessage.Create(Nil);
  Try

      if TFile.Exists( varFolderSistema + 'EntradaXML.ini' ) then
      begin
        Writeln('Pasta do EntradaXML.ini ->' + varFolderSistema + 'EntradaXML.ini');
        doSaveLog(ExtractFilePath(Application.ExeName) + 'Temp', 'Pasta do EntradaXML.ini ->' + varFolderSistema + 'EntradaXML.ini');

        varSMTP.LoadFromFile(varFolderSistema  + 'EntradaXML.ini');
        varIdIMAP41.Host         := varSMTP.Values['HOST'];
        varIdIMAP41.Username     := varSMTP.Values['USER'];
        varIdIMAP41.Password     := varSMTP.Values['PWD'];
        varIdIMAP41.Port         := StrToInt(varSMTP.Values['PORT']);

        PastaSERVIDORTEMP        := varSMTP.Values['PastaSERVIDORTEMP'];
        PastaSERVIDORNFE_ENTRADA := varSMTP.Values['PastaSERVIDORNFE_ENTRADA'];
        PastaSERVIDORCTE_ENTRADA := varSMTP.Values['PastaSERVIDORCTE_ENTRADA'];
        PastaSERVIDORNFE_LIDO    := varSMTP.Values['PastaSERVIDORNFE_LIDO'];
        PastaSERVIDORCTE_LIDO    := varSMTP.Values['PastaSERVIDORCTE_LIDO'];
        PastaLOG                 := varSMTP.Values['PastaLOG'];

        PastaSERVIDORNFE_ENTRADA := IncludeTrailingPathDelimiter( PastaSERVIDORNFE_ENTRADA );
        PastaSERVIDORCTE_ENTRADA := IncludeTrailingPathDelimiter( PastaSERVIDORCTE_ENTRADA );
        PastaSERVIDORNFE_LIDO    := IncludeTrailingPathDelimiter( PastaSERVIDORNFE_LIDO );
        PastaSERVIDORCTE_LIDO    := IncludeTrailingPathDelimiter( PastaSERVIDORCTE_LIDO );
        PastaLOG                 := IncludeTrailingPathDelimiter( PastaLOG );
        PastaSERVIDORTEMP        := IncludeTrailingPathDelimiter( PastaSERVIDORTEMP );

        PastaOthers              := varSMTP.Values['PastaOTHERS'];
        PastaPDF                 := varSMTP.Values['PastaPDF'];

      end
      else
      begin
         Writeln( varFolderSistema + 'EntradaXML.ini' + 'Arquivo de Configura��o de Conta de E-mail n�o encontrado.' );
         Exit;
      end;

      varSSL.Host              := varIdIMAP41.Host;
      varSSL.Port              := varIdIMAP41.Port;
      varSSL.Destination       := varSSL.Host + ':' + IntToStr(varSSL.Port);
      varSSL.MaxLineLength     := MaxInt;
      varSSL.SSLOptions.Method := sslvTLSv1;
      varIdIMAP41.IOHandler    := varSSL;
      varIdIMAP41.UseTLS       := utUseImplicitTLS;

      Try
        Writeln('Inicio: ','Conectando no Email Nf-e Brady.');
        varIdIMAP41.Connect ();

        Writeln('Inicio: ','Conectado com Sucesso!!!');
        for x := 0 to 1 do
        begin
            if x = 0 then
               PastaINBOX               := varSMTP.Values['PastaINBOXNFE']
            else
               PastaINBOX               := varSMTP.Values['PastaSPAM'];

            if varIdIMAP41.SelectMailBox(PastaINBOX) = False then begin
                Writeln( 'Erro ao selecionar Pasta '+PastaINBOX);
                Exit;
            end;

            nCount := varIdIMAP41.MailBox.TotalMsgs;

            Writeln( 'Total de Email na Caixa : ' + PastaINBOX + ' -> ' + IntToStr(nCount));

            if nCount = 0 then begin
                Writeln('N�o h� mensagens na pasta '+PastaINBOX);
            end else begin
                for i := 0 to nCount -1 do
                begin
                    varIdIMAP41.GetUID(i+1, TheUID);
                    varIdIMAP41.Retrieve(i+1,varMsgXml);
                    varIdIMAP41.UIDRetrieveFlags(TheUID, TheFlags);

                    PastaLIDO := '';
                    bMoverNFE := False;
                    bMoverCTE := False;
                    bOthers   := True;
                    bPDF      := False;
                    varTmp := '';
                    varXML := '';
                    for j := 0 to pred(varMsgXml.MessageParts.Count) do
                    begin
                      if (varMsgXml.MessageParts.Items[j] is TIdAttachment) then
                      begin

                        varXML := TIdAttachment(varMsgXml.MessageParts.Items[j]).FileName;
                        varTmp := PastaSERVIDORTEMP  + varXML;
                        bPDF := False;
                        if lowercase(ExtractFileExt(varTmp)) = '.pdf' then
                          bPDF := True
                        else
                        if lowercase(ExtractFileExt(varTmp)) = '.xml' then
                        begin
                            TIdAttachment(varMsgXml.MessageParts.Items[j]).SaveToFile(varTmp);
                            ACBrCTe := TACBrCTe.Create(Nil);
                            ACBrNFe := TACBrNFe.Create(Nil);
                            Try
                               TACBrCTe(ACBrCTe).Conhecimentos.Clear;
                               TACBrNFe(ACBrNFe).NotasFiscais.Clear;
                               Try
                                   if TACBrCTe(ACBrCTe).Conhecimentos.LoadFromFile(varTmp) then
                                   begin
                                       bOthers   := False;
                                       bMoverCTE := True;
                                       PastaLIDO := varSMTP.Values['PastaCTE_LIDO'];
                                   end
                                   else
                                   if  TACBrNFe(ACBrNFe).NotasFiscais.LoadFromFile(varTmp) Then
                                   begin
                                       bOthers   := False;
                                       bMoverNFE := True;
                                       PastaLIDO := varSMTP.Values['PastaNFE_LIDO'];
                                   end
                                   else
                                   if (Trim(varXML) <> '') then
                                   begin
                                       XMLDoc := TXMLDocument.Create(application);
                                       NivelNo1 := '';
                                       Nivelno2 := '';
                                       Try
                                         XMLDoc.XML.Clear;
                                         try
                                            XMLDoc.LoadFromFile(PChar(varTmp));
                                            XMLDoc.Active := True;
                                            Try
                                               retEvento := XMLDoc.DocumentElement.ChildNodes.FindNode('retEvento');
                                               infEvento := retEvento.ChildNodes.FindNode('infEvento');
                                               NivelNo1 := infEvento.ChildNodes['xMotivo'].Text;
                                               if NivelNo1 <> '' then
                                               begin
                                                 bOthers   := False;
                                                 bMoverNFE := True;
                                                 PastaLIDO := varSMTP.Values['PastaNFE_LIDO'];
                                                 Writeln(' XML-Outro Lido: ' +  PWideChar(PastaSERVIDORNFE_ENTRADA  + varXML));
                                               end;
                                            except
                                                 try
                                                    infEvento := retEvento.ChildNodes.FindNode('retEnvEvento');
                                                    Nivelno2 := infEvento.ChildNodes['xMotivo'].Text;
                                                    if Nivelno2 <> '' then
                                                    begin
                                                      bOthers   := False;
                                                      bMoverNFE := True;
                                                      PastaLIDO := varSMTP.Values['PastaNFE_LIDO'];
                                                      Writeln(' XML-Outro Lido: ' +  PWideChar(PastaSERVIDORNFE_ENTRADA  + varXML));
                                                    end;
                                                 except
                                                    doSaveLog(PastaLOG, 'Arquivo Inv�lido ' +  PWideChar(  PChar(varTmp) ));
                                                    DeleteFile(PChar(varTmp));
                                                    Continue;
                                                 end;

                                            End;

                                         except
                                           doSaveLog(PastaLOG, 'Arquivo Inv�lido ' +  PWideChar(  PChar(varTmp) ));
                                           DeleteFile(PChar(varTmp));
                                           Continue;
                                         end;
                                       Finally
                                          FreeAndNil(XMLDoc);
                                       End;
                                   end;

                               except

                                   on E: Exception do
                                       begin
                                         doSaveLog(PastaLOG, E.Message);
                                        Writeln( 'Erro: ', E.Message );
                                        Continue;
                                       end;
                               End;

                               TACBrCTe(ACBrCTe).Conhecimentos.Clear;
                               TACBrNFe(ACBrNFe).NotasFiscais.Clear;

                            Finally
                              FreeAndNil(ACBrCTe);
                              FreeAndNil(ACBrNFe);
                            End;

                        end;
                      end;

                      if bMoverCTE then
                      begin
                          CopyFile( PChar(varTmp) , PWideChar(PastaSERVIDORCTE_ENTRADA  + varXML) , False);
                          DeleteFile(varTmp);
                          Writeln(' XML Lido: ' + PWideChar(PastaSERVIDORCTE_ENTRADA  + varXML));
                      end
                      else if bMoverNFE then
                      begin
                         CopyFile( PChar(varTmp) , PWideChar(PastaSERVIDORNFE_ENTRADA  + varXML), False);
                         DeleteFile(varTmp);
                         Writeln(' XML Lido: ' +  PWideChar(PastaSERVIDORNFE_ENTRADA  + varXML));
                      end;


                      if (PastaLIDO <> '') then
                      begin
                         if  varIdIMAP41.UIDCopyMsg(TheUID, PastaLIDO )= True then
                          begin
                              if varIdIMAP41.UIDDeleteMsg(TheUID) = True then
                              begin
                                  if varIdIMAP41.ExpungeMailBox = False then
                                    Writeln(' Sucesso em marcar a Mensagem como Deletada mas ela n�o foi eliminada');
                              end else begin
                                    Writeln('Falha em Apagar Mensagem. Esta Past � Somente Leitura?');
                              end;
                          end;
                      end;

                    end;

                    if bPDF then
                    begin
                      if  varIdIMAP41.UIDCopyMsg(TheUID, PastaPDF )= True then
                      begin
                          if varIdIMAP41.UIDDeleteMsg(TheUID) = True then
                          begin
                              if varIdIMAP41.ExpungeMailBox = False then
                                Writeln(' Sucesso em marcar a Mensagem como Deletada mas ela n�o foi eliminada');
                          end else begin
                                Writeln('Falha em Apagar Mensagem. Esta Past � Somente Leitura?');
                          end;
                      end;
                    end
                    else
                    if bOthers then
                    begin
                      if  varIdIMAP41.UIDCopyMsg(TheUID, PastaOthers )= True then
                      begin
                          if varIdIMAP41.UIDDeleteMsg(TheUID) = True then
                          begin
                              if varIdIMAP41.ExpungeMailBox = False then
                                Writeln(' Sucesso em marcar a Mensagem como Deletada mas ela n�o foi eliminada');
                          end else begin
                                Writeln('Falha em Apagar Mensagem. Esta Past � Somente Leitura?');
                          end;
                      end;
                    end;
                    varMsgXml.Clear;
                end;
            end;
        end;

        varIdIMAP41.Disconnect;

      except
      on E: Exception do
         begin
            doSaveLog(PastaLOG, E.Message);
            Writeln( 'N�o foi possivel Conectar no Servidor de Email: ', E.Message );
            Exit;

          end;
      End;

  Finally
     FreeAndNil(varSMTP);
     FreeAndNil(varSSL);
     FreeAndNil(varIdIMAP41);
     FreeAndNil(varMsgXml);
  End;

end;




procedure SalvarXMLNFE_CTE;
var
  lContinua, bLog  : boolean;
  sr               : TSearchRec;
  varTipoNota      : smallint;
  i,x,n,y, IDENTITY_ID, cct, searchResult       : Integer;
  lPathSemProtocolo, lPathExistente, varFolderSistema, varSQL : String;
  ACBrCTe   : TACBrCTe;
  ACBrNFe   : TACBrNFe;
  varSMTP   : TStringList;
  XMLDoc    : TXMLDocument;
  infEvento, retEvento : IXMLNode;
begin
  bLog    := False;
  varSMTP := TStringList.Create;
  Try
      varFolderSistema := ExtractFilePath(Application.ExeName);
      if not DirExists( IncludeTrailingPathDelimiter( varFolderSistema )  ) then
        varFolderSistema := 'T:\';


      if TFile.Exists( varFolderSistema + 'EntradaXML.ini' ) then
      begin

           varSMTP.LoadFromFile(varFolderSistema  + 'EntradaXML.ini');
           PastaSERVIDORTEMP        := varSMTP.Values['PastaSERVIDORTEMP'];
           PastaSERVIDORNFE_ENTRADA := varSMTP.Values['PastaSERVIDORNFE_ENTRADA'];
           PastaSERVIDORCTE_ENTRADA := varSMTP.Values['PastaSERVIDORCTE_ENTRADA'];
           PastaSERVIDORNFE_LIDO    := varSMTP.Values['PastaSERVIDORNFE_LIDO'];
           PastaSERVIDORCTE_LIDO    := varSMTP.Values['PastaSERVIDORCTE_LIDO'];
           PastaLOG                 := varSMTP.Values['PastaLOG'];

           PastaSERVIDORNFE_ENTRADA := IncludeTrailingPathDelimiter( PastaSERVIDORNFE_ENTRADA );
           PastaSERVIDORCTE_ENTRADA := IncludeTrailingPathDelimiter( PastaSERVIDORCTE_ENTRADA );
           PastaSERVIDORNFE_LIDO    := IncludeTrailingPathDelimiter( PastaSERVIDORNFE_LIDO );
           PastaSERVIDORCTE_LIDO    := IncludeTrailingPathDelimiter( PastaSERVIDORCTE_LIDO );
           PastaLOG                 := IncludeTrailingPathDelimiter( PastaLOG );

      end
      else
      begin
         Writeln( varFolderSistema + 'EntradaXML.ini' + 'Arquivo de Configura��o de Conta de E-mail n�o encontrado.' );
         Exit;
      end;


      if Trim( varFolderSistema ) <> '' then
      begin
          if not DirExists( varFolderSistema ) then
          begin
            lContinua := False;
            Writeln( 'DB-CECS2002.ini - ' + pchar('Caminho ' + varFolderSistema + ' n�o encontrado!!!') );
          end
          else
          begin
            lContinua := True;
            if not DirExists(  varFolderSistema  ) then
            begin
               if not CreateDir(  varFolderSistema ) then
                 lContinua := False;
            end;

            if not lContinua  then
            begin
               Writeln( 'DB-CECS2002.ini - ' + pChar('Falha o verificar caminho ' + varFolderSistema) );
            end;
          end
      end;

      if lContinua then
      begin
          Try
          Writeln( 'Criando DataModule' );
          Fr_Dados := TFr_Dados.Create(nil);
          ACBrCTe := TACBrCTe.Create(Nil);
          ACBrNFe := TACBrNFe.Create(Nil);
          with Fr_Dados do
          begin

              Writeln('Config FDConnection');
              FDConnection.Params.LoadFromFile( varFolderSistema + 'DB-CECS2002.ini' );

              Writeln( 'Open FDConnection' );
              FDConnection.Open;



              I := 0;
              X := 0;
              for y := 0 to 1 do
              begin
                    if y = 0 then
                    begin
                      PastaXML      := PastaSERVIDORNFE_ENTRADA;
                      PastaXML_LIDO := PastaSERVIDORNFE_LIDO;
                    end
                    else
                    begin
                      PastaXML       := PastaSERVIDORCTE_ENTRADA;
                      PastaXML_LIDO := PastaSERVIDORCTE_LIDO;
                    end;

                    searchResult := FindFirst( PastaXML + '*.XML', faAnyFile, sr );
                    while searchResult = 0 do
                    begin
                        Writeln( 'Lendo pasta: ' + PastaXML +  sr.Name  );
                        TACBrCTe(ACBrCTe).Conhecimentos.Clear;
                        TACBrNFe(ACBrNFe).NotasFiscais.Clear;
                        varTipoNota := -1;

                        if TACBrCTe(ACBrCTe).Conhecimentos.LoadFromFile(  PastaXML +  sr.Name ) then
                           varTipoNota := 0;
                        if  TACBrNFe(ACBrNFe).NotasFiscais.LoadFromFile(  PastaXML  + sr.Name ) Then
                           varTipoNota := 1;

                        if (varTipoNota = 0) then
                        begin
                          try
                             with TACBrCTe(ACBrCTe).Conhecimentos.Items[n].CTe do
                             begin

                                if procCTe.nProt = '' then
                                begin
                                   Writeln( 'Sem Protocolo: ' + PastaXML +  sr.Name  );
                                   MoveFile( PWideChar(   PastaXML  +  sr.Name ) , PWideChar( PastaXML_LIDO +  sr.Name ) );
                                   bLog := True;
                                   doSaveLog(PastaLOG, 'Sem Protocolo ' +  PWideChar(  PastaXML_LIDO +  sr.Name ));
                                   searchResult := FindNext(sr);
                                   varTipoNota := -2;
                                   Inc(X);
                                   Continue;
                                end;

                                with FD_Consulta_EntregaXML do
                                begin
                                  Close;
                                  SQL.Clear;
                                  SQL.Add(' SELECT cCT FROM XML_IMPORTADA  ');
                                  SQL.Add(' WHERE cCT  = :cCT ');
                                  SQL.Add(' and DataEmissao  = :DataEmissao ');
                                  SQL.Add(' and Numero = :Numero ');
                                  SQL.Add(' and Chave = :Chave ');
                                  SQL.Add(' and TipoXML = :TipoXML ');
                                  ParamByName('cCT').asInteger               := ide.cCT;
                                  ParamByName('DataEmissao').AsSQLTimeStamp  := DateTimeToSQLTimeStamp(Ide.dhEmi);
                                  ParamByName('Numero').AsString             := IntToStr(Ide.nCT);
                                  ParamByName('Chave').AsString              := procCTe.chCTe;
                                  ParamByName('TipoXML').AsString            := 'CTE';
                                  Open;
                                end;


                                if not FD_Consulta_EntregaXML.IsEmpty then
                                begin
                                   Writeln( 'Existente: ' + PastaXML +  sr.Name  );
                                   MoveFile( PWideChar(  PastaXML +  sr.Name ) , PWideChar( PastaXML_LIDO +  sr.Name ) );
                                   bLog := True;
                                   doSaveLog(PastaLOG, 'Existente ' +  PWideChar(  PastaXML_LIDO +  sr.Name ));
                                   searchResult := FindNext(sr);
                                   varTipoNota := -2;
                                   Inc(X);
                                   Continue;
                                end;


                                if FD_Consulta_EntregaXML.IsEmpty then
                                begin
                                  Fr_Dados.FDConnection.StartTransaction;

                                  varSQL := ' INSERT INTO XML_PROTOCOLO (';
                                  varSQL := varSQL + ' ID,  ';
                                  varSQL := varSQL + ' tpAmb, ';
                                  varSQL := varSQL + ' verAplic, ';
                                  varSQL := varSQL + ' chCTe, ';
                                  varSQL := varSQL + ' dhRecbto, ';
                                  varSQL := varSQL + ' nProt,  ';
                                  varSQL := varSQL + ' digVal, ';
                                  varSQL := varSQL + ' cStat, ';
                                  varSQL := varSQL + ' xMotivo, ';
                                  varSQL := varSQL + ' Numero, ';
                                  varSQL := varSQL + ' cCT ';
                                  varSQL := varSQL + ' ) VALUES  ( ';
                                  varSQL := varSQL + ' :ID,  ';
                                  varSQL := varSQL + ' :tpAmb, ';
                                  varSQL := varSQL + ' :verAplic, ';
                                  varSQL := varSQL + ' :chCTe, ';
                                  varSQL := varSQL + ' :dhRecbto, ';
                                  varSQL := varSQL + ' :nProt,  ';
                                  varSQL := varSQL + ' :digVal, ';
                                  varSQL := varSQL + ' :cStat, ';
                                  varSQL := varSQL + ' :xMotivo, ';
                                  varSQL := varSQL + ' :Numero, ';
                                  varSQL := varSQL + ' :cCT) ';


                                  FD_Insert_EntregaXML.Close;
                                  FD_Insert_EntregaXML.SQL.Clear;
                                  FD_Insert_EntregaXML.SQL.Add( varSQL );


                                  FD_Insert_EntregaXML.ParamByName('ID').AsString                        := infCTe.ID;
                                  FD_Insert_EntregaXML.ParamByName('tpAmb').AsString                     := TpAmbToStr(procCTe.tpAmb);
                                  FD_Insert_EntregaXML.ParamByName('verAplic').AsString                  := procCTe.verAplic;
                                  FD_Insert_EntregaXML.ParamByName('chCTe').AsString                     := procCTe.chCTe;
                                  FD_Insert_EntregaXML.ParamByName('dhRecbto').AsSQLTimeStamp            := DateTimeToSQLTimeStamp(procCTe.dhRecbto);
                                  FD_Insert_EntregaXML.ParamByName('nProt').AsString                     := procCTe.nProt;
                                  FD_Insert_EntregaXML.ParamByName('digVal').AsString                    := procCTe.digVal;
                                  FD_Insert_EntregaXML.ParamByName('cStat').AsString                     := IntToStr(procCTe.cStat);
                                  FD_Insert_EntregaXML.ParamByName('xMotivo').AsString                   := procCTe.xMotivo;
                                  FD_Insert_EntregaXML.ParamByName('Numero').AsString                    := IntToStr(ide.nCT);
                                  FD_Insert_EntregaXML.ParamByName('cCT').AsInteger                      := ide.cCT;
                                  try
                                    FD_Insert_EntregaXML.ExecSQL;

                                  except
                                    On E:Exception do
                                      begin
                                        Fr_Dados.FDConnection.RollBack;
                                        bLog := True;
                                        doSaveLog(PastaLOG, GetComando(FD_Insert_EntregaXML)  + ' - Falha ao incluir XML_PROTOCOLO.' + E.Message);
                                        Continue;
                                      end;
                                  end;

                                  varSQL := ' INSERT INTO XML_CAPA (';
                                 //varSQL := varSQL + ' XML_FILIAL_ID ';
                                  varSQL := varSQL + '  cUF ';
                                  varSQL := varSQL + ' ,cCT';
                                  varSQL := varSQL + ' ,CFOP';
                                  varSQL := varSQL + ' ,natOp';
                                  varSQL := varSQL + ' ,forPag';
                                  varSQL := varSQL + ' ,mod_';
                                  varSQL := varSQL + ' ,serie';
                                  varSQL := varSQL + ' ,Numero';
                                  varSQL := varSQL + ' ,dhEmi';
                                  varSQL := varSQL + ' ,tpImp';
                                  varSQL := varSQL + ' ,tpEmis';
                                  varSQL := varSQL + ' ,cDV';
                                  varSQL := varSQL + ' ,tpAmb';
                                  varSQL := varSQL + ' ,tpCTe';
                                  varSQL := varSQL + ' ,procEmi';
                                  varSQL := varSQL + ' ,verProc';
                                  varSQL := varSQL + ' ,cMunEnv';
                                  varSQL := varSQL + ' ,xMunEnv';
                                  varSQL := varSQL + ' ,UFEnv';
                                  varSQL := varSQL + ' ,modal';
                                  varSQL := varSQL + ' ,tpServ';
                                  varSQL := varSQL + ' ,cMunIni';
                                  varSQL := varSQL + ' ,xMunIni';
                                  varSQL := varSQL + ' ,UFIni';
                                  varSQL := varSQL + ' ,cMunFim';
                                  varSQL := varSQL + ' ,xMunFim';
                                  varSQL := varSQL + ' ,UFFim';
                                  varSQL := varSQL + ' ,retira';
                                  varSQL := varSQL + ' ,toma03';
                                  varSQL := varSQL + ' ,xCaracAd';
                                  varSQL := varSQL + ' ,xCaracSer';
                                  varSQL := varSQL + ' ,xEmi';
                                  varSQL := varSQL + ' ,xOrig';
                                  varSQL := varSQL + ' ,xDest';
                                  varSQL := varSQL + ' ,tpPer';
                                  varSQL := varSQL + ' ,dProg';
                                  varSQL := varSQL + ' ,tpHor';
                                  varSQL := varSQL + ' ,hProg';
                                  varSQL := varSQL + ' ,xObs)';
                                  varSQL := varSQL + ' VALUES ';
                                 // varSQL := varSQL + ' ( :XML_FILIAL_ID,';
                                  varSQL := varSQL + '  (:cUF,';
                                  varSQL := varSQL + '  :cCT, ';
                                  varSQL := varSQL + '  :CFOP, ';
                                  varSQL := varSQL + '  :natOp, ';
                                  varSQL := varSQL + '  :forPag, ';
                                  varSQL := varSQL + '  :mod_, ';
                                  varSQL := varSQL + '  :serie, ';
                                  varSQL := varSQL + '  :Numero, ';
                                  varSQL := varSQL + '  :dhEmi, ';
                                  varSQL := varSQL + '  :tpImp, ';
                                  varSQL := varSQL + '  :tpEmis, ';
                                  varSQL := varSQL + '  :cDV, ';
                                  varSQL := varSQL + '  :tpAmb, ';
                                  varSQL := varSQL + '  :tpCTe, ';
                                  varSQL := varSQL + '  :procEmi, ';
                                  varSQL := varSQL + '  :verProc, ';
                                  varSQL := varSQL + '  :cMunEnv, ';
                                  varSQL := varSQL + '  :xMunEnv,';
                                  varSQL := varSQL + '  :UFEnv, ';
                                  varSQL := varSQL + '  :modal, ';
                                  varSQL := varSQL + '  :tpServ, ';
                                  varSQL := varSQL + '  :cMunIni, ';
                                  varSQL := varSQL + '  :xMunIni, ';
                                  varSQL := varSQL + '  :UFIni, ';
                                  varSQL := varSQL + '  :cMunFim, ';
                                  varSQL := varSQL + '  :xMunFim, ';
                                  varSQL := varSQL + '  :UFFim, ';
                                  varSQL := varSQL + '  :retira, ';
                                  varSQL := varSQL + '  :toma03, ';
                                  varSQL := varSQL + '  :xCaracAd, ';
                                  varSQL := varSQL + '  :xCaracSer, ';
                                  varSQL := varSQL + '  :xEmi, ';
                                  varSQL := varSQL + '  :xOrig, ';
                                  varSQL := varSQL + '  :xDest, ';
                                  varSQL := varSQL + '  :tpPer, ';
                                  varSQL := varSQL + '  :dProg, ';
                                  varSQL := varSQL + '  :tpHor, ';
                                  varSQL := varSQL + '  :hProg, ';
                                  varSQL := varSQL + '  :xObs) ';

                                  FD_Insert_EntregaXML.Close;
                                  FD_Insert_EntregaXML.SQL.Clear;
                                  FD_Insert_EntregaXML.SQL.Add( varSQL );

                                  //FD_Insert_EntregaXML.ParamByName('XML_FILIAL_ID').AsString           := VarToStr(EditFilial.bs_KeyValue);
                                  FD_Insert_EntregaXML.ParamByName('cUF').AsString                     := IntToStr(Ide.cUF);
                                  FD_Insert_EntregaXML.ParamByName('cCT').AsInteger                    := ide.cCT;
                                  FD_Insert_EntregaXML.ParamByName('CFOP').AsString                    := IntToStr(ide.CFOP);
                                  FD_Insert_EntregaXML.ParamByName('natOp').AsString                   := ide.natOp;
                                  FD_Insert_EntregaXML.ParamByName('forPag').AsString                  := tpforPagToStr(ide.forPag);
                                  FD_Insert_EntregaXML.ParamByName('mod_').AsString                    := IntToStr(ide.modelo);
                                  FD_Insert_EntregaXML.ParamByName('serie').AsString                   := IntToStr(ide.serie);
                                  FD_Insert_EntregaXML.ParamByName('Numero').AsString                  := IntToStr(ide.nCT);
                                  FD_Insert_EntregaXML.ParamByName('dhEmi').AsSQLTimeStamp             := DateTimeToSQLTimeStamp(ide.dhEmi);
                                  FD_Insert_EntregaXML.ParamByName('tpImp').AsString                   := TpImpToStr(ide.tpImp);
                                  FD_Insert_EntregaXML.ParamByName('tpEmis').AsString                  := TpEmisToStr(ide.tpEmis);
                                  FD_Insert_EntregaXML.ParamByName('cDV').AsString                     := IntToStr(ide.cDV);
                                  FD_Insert_EntregaXML.ParamByName('tpAmb').AsString                   := TpAmbToStr(ide.tpAmb);
                                  FD_Insert_EntregaXML.ParamByName('tpCTe').AsString                   := tpCTToStr(ide.tpCTe);
                                  FD_Insert_EntregaXML.ParamByName('procEmi').AsString                 := procEmiToStr(ide.procEmi);
                                  FD_Insert_EntregaXML.ParamByName('verProc').AsString                 := ide.verProc;
                                  FD_Insert_EntregaXML.ParamByName('cMunEnv').AsString                 := InTToStr(ide.cMunEnv);
                                  FD_Insert_EntregaXML.ParamByName('xMunEnv').AsString                 := ide.xMunEnv;
                                  FD_Insert_EntregaXML.ParamByName('UFEnv').AsString                   := ide.UFEnv;
                                  FD_Insert_EntregaXML.ParamByName('modal').AsString                   := TpModalToStr(ide.modal);
                                  FD_Insert_EntregaXML.ParamByName('tpServ').AsString                  := TpServPagToStr(ide.tpServ);
                                  FD_Insert_EntregaXML.ParamByName('cMunIni').AsInteger                := ide.cMunIni;
                                  FD_Insert_EntregaXML.ParamByName('xMunIni').AsString                 := ide.xMunIni;
                                  FD_Insert_EntregaXML.ParamByName('UFIni').AsString                   := ide.UFIni;
                                  FD_Insert_EntregaXML.ParamByName('cMunFim').AsInteger                := ide.cMunFim;
                                  FD_Insert_EntregaXML.ParamByName('xMunFim').AsString                 := ide.xMunFim;
                                  FD_Insert_EntregaXML.ParamByName('UFFim').AsString                   := ide.UFFim;
                                  FD_Insert_EntregaXML.ParamByName('retira').AsString                  := TpRetiraPagToStr(ide.retira);
                                  FD_Insert_EntregaXML.ParamByName('toma03').AsString                  := TpTomadorToStr(ide.toma03.Toma);
                                  FD_Insert_EntregaXML.ParamByName('xCaracAd').AsString                := compl.xCaracAd ;
                                  FD_Insert_EntregaXML.ParamByName('xCaracSer').AsString               := compl.xCaracSer;
                                  FD_Insert_EntregaXML.ParamByName('xEmi').AsString                    := compl.xEmi;
                                  FD_Insert_EntregaXML.ParamByName('xOrig').AsString                   := compl.fluxo.xOrig;
                                  FD_Insert_EntregaXML.ParamByName('xDest').AsString                   := compl.fluxo.xDest;
                                  FD_Insert_EntregaXML.ParamByName('tpPer').AsString                   := TpDataPeriodoToStr(compl.Entrega.comData.tpPer);
                                  FD_Insert_EntregaXML.ParamByName('dProg').AsSQLTimeStamp             := DateTimeToSQLTimeStamp(compl.Entrega.comData.dProg);
                                  FD_Insert_EntregaXML.ParamByName('tpHor').AsString                   := TpHorarioIntervaloToStr(compl.Entrega.comHora.tpHor);
                                  FD_Insert_EntregaXML.ParamByName('hProg').AsSQLTimeStamp             := DateTimeToSQLTimeStamp(compl.Entrega.comHora.hProg);
                                  FD_Insert_EntregaXML.ParamByName('xObs').AsString                    := compl.xObs;

                                  try
                                    FD_Insert_EntregaXML.ExecSQL;

                                  except
                                    On E:Exception do
                                      begin
                                        Fr_Dados.FDConnection.RollBack;
                                        bLog := True;
                                        Writeln( 'Falha ao Inserir XML_CAPA: ' + E.Message );
                                        doSaveLog(PastaLOG, GetComando(FD_Insert_EntregaXML) + #13#10 + 'Falha ao incluir XML_CAPA.' + E.Message);
                                        Continue;
                                      end;
                                  end;


                                  Try
                                    IDENTITY_ID := 0;
                                    varSQL  := 'SELECT @@IDENTITY as XML_CAPA_ID ';

                                    FD_Insert_EntregaXML.Close;
                                    FD_Insert_EntregaXML.SQL.Clear;
                                    FD_Insert_EntregaXML.SQL.Add( varSQL );
                                    FD_Insert_EntregaXML.Open;
                                    IDENTITY_ID := FD_Insert_EntregaXML.FieldByName('XML_CAPA_ID').AsInteger;

                                  except
                                    On E:Exception do
                                      begin
                                        Fr_Dados.FDConnection.RollBack;
                                        Writeln( 'Falha ao Inserir XML_CAPA: ' + E.Message );
                                        bLog := True;
                                        doSaveLog(PastaLOG, GetComando(FD_Insert_EntregaXML) + #13#10 + 'Falha ao incluir pegar chave da XML_CAPA.' + E.Message);
                                        Continue;
                                      end;
                                  end;


                                  varSQL := ' INSERT INTO [dbo].[XML_EMITENTE]( ';
                                  varSQL := varSQL + ' cCT ';
                                  varSQL := varSQL + ',XML_CAPA_ID ';
                                  varSQL := varSQL + ',CNPJCPF';
                                  varSQL := varSQL + ',IE';
                                  varSQL := varSQL + ',IEST';
                                  varSQL := varSQL + ',xNome';
                                  varSQL := varSQL + ',xFant';
                                  varSQL := varSQL + ',Fone';
                                  varSQL := varSQL + ',xCpl';
                                  varSQL := varSQL + ',xLgr';
                                  varSQL := varSQL + ',nro';
                                  varSQL := varSQL + ',xBairro';
                                  varSQL := varSQL + ',cMun';
                                  varSQL := varSQL + ',xMun';
                                  varSQL := varSQL + ',CEP';
                                  varSQL := varSQL + ',UF)';
                                  varSQL := varSQL + ' VALUES ( ' ;
                                  varSQL := varSQL + ':cCT ';
                                  varSQL := varSQL + ',:XML_CAPA_ID ';
                                  varSQL := varSQL +',:CNPJCPF ';
                                  varSQL := varSQL +',:IE ';
                                  varSQL := varSQL +',:IEST ';
                                  varSQL := varSQL +',:xNome ';
                                  varSQL := varSQL +',:xFant ';
                                  varSQL := varSQL +',:Fone ';
                                  varSQL := varSQL +',:xCpl ';
                                  varSQL := varSQL +',:xLgr ';
                                  varSQL := varSQL +',:nro ';
                                  varSQL := varSQL +',:xBairro ';
                                  varSQL := varSQL +',:cMun';
                                  varSQL := varSQL +',:xMun';
                                  varSQL := varSQL +',:CEP';
                                  varSQL := varSQL +',:UF)';

                                  FD_Insert_EntregaXML.Close;
                                  FD_Insert_EntregaXML.SQL.Clear;
                                  FD_Insert_EntregaXML.SQL.Add( varSQL );

                                  FD_Insert_EntregaXML.ParamByName('cCT').AsInteger                    := ide.cCT;
                                  FD_Insert_EntregaXML.ParamByName('XML_CAPA_ID').AsInteger            := IDENTITY_ID;
                                  FD_Insert_EntregaXML.ParamByName('CNPJCPF').AsString                 := Emit.CNPJ;
                                  FD_Insert_EntregaXML.ParamByName('IE').AsString                      := Emit.IE;
                                  FD_Insert_EntregaXML.ParamByName('IEST').AsString                    := Emit.IEST;
                                  FD_Insert_EntregaXML.ParamByName('xNome').AsString                   := Emit.xNome;
                                  FD_Insert_EntregaXML.ParamByName('xFant').AsString                   := Emit.xFant;
                                  FD_Insert_EntregaXML.ParamByName('Fone').AsString                    := Emit.EnderEmit.fone;
                                  FD_Insert_EntregaXML.ParamByName('xCpl').AsString                    := Emit.EnderEmit.xCpl;
                                  FD_Insert_EntregaXML.ParamByName('xLgr').AsString                    := Emit.EnderEmit.xLgr;
                                  FD_Insert_EntregaXML.ParamByName('nro').AsString                     := Emit.EnderEmit.nro;
                                  FD_Insert_EntregaXML.ParamByName('xBairro').AsString                 := Emit.EnderEmit.xBairro;
                                  FD_Insert_EntregaXML.ParamByName('cMun').AsString                    := IntToStr(Emit.EnderEmit.cMun);
                                  FD_Insert_EntregaXML.ParamByName('xMun').AsString                    := Emit.EnderEmit.xMun;

                                  FD_Insert_EntregaXML.ParamByName('CEP').AsString                     := IntToStr(Emit.EnderEmit.CEP);
                                  FD_Insert_EntregaXML.ParamByName('UF').AsString                      := Emit.EnderEmit.UF;

                                  try
                                    FD_Insert_EntregaXML.ExecSQL;
                                  except
                                    On E:Exception do
                                      begin
                                        Fr_Dados.FDConnection.RollBack;
                                        bLog := True;
                                        Writeln( 'Falha ao Inserir XML_EMITENTE: ' + E.Message );
                                        doSaveLog(PastaLOG, GetComando(FD_Insert_EntregaXML) + #13#10 + 'Falha ao incluir XML_EMITENTE.' + E.Message);
                                        Continue;
                                      end;
                                  end;

                                  varSQL := ' INSERT INTO [dbo].[XML_Destinatario]( ';
                                  varSQL := varSQL + ' cCT ';
                                  varSQL := varSQL + ',XML_CAPA_ID ';
                                  varSQL := varSQL + ',CNPJ';
                                  varSQL := varSQL + ',IE';
                               //   varSQL := varSQL + ',IEST';
                                  varSQL := varSQL + ',xNome';
                              //    varSQL := varSQL + ',xFant';
                               //   varSQL := varSQL + ',Fone';
                                  varSQL := varSQL + ',xCpl';
                                  varSQL := varSQL + ',xLgr';
                                  varSQL := varSQL + ',nro';
                                  varSQL := varSQL + ',xBairro';
                                  varSQL := varSQL + ',cMun';
                                  varSQL := varSQL + ',xMun';
                                  varSQL := varSQL + ',CEP';
                                  varSQL := varSQL + ',UF)';
                                  varSQL := varSQL + ' VALUES ( ' ;
                                  varSQL := varSQL + ':cCT ';
                                  varSQL := varSQL + ',:XML_CAPA_ID ';
                                  varSQL := varSQL +',:CNPJ ';
                                  varSQL := varSQL +',:IE ';
                             //     varSQL := varSQL +',:IEST ';
                                  varSQL := varSQL +',:xNome ';
                           //       varSQL := varSQL +',:xFant ';
                         //         varSQL := varSQL +',:Fone ';
                                  varSQL := varSQL +',:xCpl ';
                                  varSQL := varSQL +',:xLgr ';
                                  varSQL := varSQL +',:nro ';
                                  varSQL := varSQL +',:xBairro ';
                                  varSQL := varSQL +',:cMun';
                                  varSQL := varSQL +',:xMun';
                                  varSQL := varSQL +',:CEP';
                                  varSQL := varSQL +',:UF)';

                                  FD_Insert_EntregaXML.Close;
                                  FD_Insert_EntregaXML.SQL.Clear;
                                  FD_Insert_EntregaXML.SQL.Add( varSQL );

                                  FD_Insert_EntregaXML.ParamByName('cCT').AsInteger                    := ide.cCT;
                                  FD_Insert_EntregaXML.ParamByName('XML_CAPA_ID').AsInteger            := IDENTITY_ID;
                                  FD_Insert_EntregaXML.ParamByName('CNPJ').AsString                    := Dest.CNPJCPF;
                                  FD_Insert_EntregaXML.ParamByName('IE').AsString                      := Dest.IE;
                                 // FD_Insert_EntregaXML.ParamByName('IEST').AsString                    := Dest.IEST;
                                  FD_Insert_EntregaXML.ParamByName('xNome').AsString                   := Dest.xNome;
                       //           FD_Insert_EntregaXML.ParamByName('xFant').AsString                   := Dest.xFant;
                       //           FD_Insert_EntregaXML.ParamByName('Fone').AsString                    := Dest.enderDest.fone;
                                  FD_Insert_EntregaXML.ParamByName('xCpl').AsString                    := Dest.enderDest.xCpl;
                                  FD_Insert_EntregaXML.ParamByName('xLgr').AsString                    := Dest.enderDest.xLgr;
                                  FD_Insert_EntregaXML.ParamByName('nro').AsString                     := Dest.enderDest.nro;
                                  FD_Insert_EntregaXML.ParamByName('xBairro').AsString                 := Dest.enderDest.xBairro;
                                  FD_Insert_EntregaXML.ParamByName('cMun').AsString                    := IntToStr(Dest.enderDest.cMun);
                                  FD_Insert_EntregaXML.ParamByName('xMun').AsString                    := Dest.enderDest.xMun;

                                  FD_Insert_EntregaXML.ParamByName('CEP').AsString                     := IntToStr(Dest.enderDest.CEP);
                                  FD_Insert_EntregaXML.ParamByName('UF').AsString                      := Dest.enderDest.UF;

                                  try
                                    FD_Insert_EntregaXML.ExecSQL;
                                  except
                                    On E:Exception do
                                      begin
                                         Fr_Dados.FDConnection.RollBack;
                                         bLog := True;
                                         Writeln( 'Falha ao Inserir XML_Destinatario: ' + E.Message );
                                         doSaveLog(PastaLOG, GetComando(FD_Insert_EntregaXML) + #13#10 + 'Falha ao incluir XML_Destinatario.' + E.Message);
                                        Continue;
                                      end;
                                  end;



                                  varSQL := ' INSERT INTO [dbo].[XML_Remetente]( ';
                                  varSQL := varSQL + ' cCT ';
                                  varSQL := varSQL + ',XML_CAPA_ID ';
                                  varSQL := varSQL + ',CNPJ';
                                  varSQL := varSQL + ',IE';
                               //   varSQL := varSQL + ',IEST';
                                  varSQL := varSQL + ',xNome';
                              //    varSQL := varSQL + ',xFant';
                               //   varSQL := varSQL + ',Fone';
                                  varSQL := varSQL + ',xCpl';
                                  varSQL := varSQL + ',xLgr';
                                  varSQL := varSQL + ',nro';
                                  varSQL := varSQL + ',xBairro';
                                  varSQL := varSQL + ',cMun';
                                  varSQL := varSQL + ',xMun';
                                  varSQL := varSQL + ',CEP';
                                  varSQL := varSQL + ',UF';
                                  varSQL := varSQL + ',Email)';

                                  varSQL := varSQL + ' VALUES ( ' ;
                                  varSQL := varSQL + ':cCT ';
                                  varSQL := varSQL + ',:XML_CAPA_ID ';
                                  varSQL := varSQL +',:CNPJ ';
                                  varSQL := varSQL +',:IE ';
                             //     varSQL := varSQL +',:IEST ';
                                  varSQL := varSQL +',:xNome ';
                           //       varSQL := varSQL +',:xFant ';
                         //         varSQL := varSQL +',:Fone ';
                                  varSQL := varSQL +',:xCpl ';
                                  varSQL := varSQL +',:xLgr ';
                                  varSQL := varSQL +',:nro ';
                                  varSQL := varSQL +',:xBairro ';
                                  varSQL := varSQL +',:cMun';
                                  varSQL := varSQL +',:xMun';
                                  varSQL := varSQL +',:CEP';
                                  varSQL := varSQL +',:UF';
                                  varSQL := varSQL +',:Email)';


                                  FD_Insert_EntregaXML.Close;
                                  FD_Insert_EntregaXML.SQL.Clear;
                                  FD_Insert_EntregaXML.SQL.Add( varSQL );



                                  FD_Insert_EntregaXML.ParamByName('cCT').AsInteger                    := ide.cCT;
                                  FD_Insert_EntregaXML.ParamByName('XML_CAPA_ID').AsInteger            := IDENTITY_ID;
                                  FD_Insert_EntregaXML.ParamByName('CNPJ').AsString                    := rem.CNPJCPF;
                                  FD_Insert_EntregaXML.ParamByName('IE').AsString                      := rem.IE;
                                 // FD_Insert_EntregaXML.ParamByName('IEST').AsString                    := Dest.IEST;
                                  FD_Insert_EntregaXML.ParamByName('xNome').AsString                   := rem.xNome;
                       //           FD_Insert_EntregaXML.ParamByName('xFant').AsString                   := Dest.xFant;
                       //           FD_Insert_EntregaXML.ParamByName('Fone').AsString                    := Dest.enderDest.fone;
                                  FD_Insert_EntregaXML.ParamByName('xCpl').AsString                    := rem.enderReme.xCpl;
                                  FD_Insert_EntregaXML.ParamByName('xLgr').AsString                    := rem.enderReme.xLgr;
                                  FD_Insert_EntregaXML.ParamByName('nro').AsString                     := rem.enderReme.nro;
                                  FD_Insert_EntregaXML.ParamByName('xBairro').AsString                 := rem.enderReme.xBairro;
                                  FD_Insert_EntregaXML.ParamByName('cMun').AsString                    := IntToStr(rem.enderReme.cMun);
                                  FD_Insert_EntregaXML.ParamByName('xMun').AsString                    := rem.enderReme.xMun;

                                  FD_Insert_EntregaXML.ParamByName('CEP').AsString                     := IntToStr(rem.enderReme.CEP);
                                  FD_Insert_EntregaXML.ParamByName('UF').AsString                      := rem.enderReme.UF;
                                  FD_Insert_EntregaXML.ParamByName('Email').AsString                   := rem.email;


                                  try
                                    FD_Insert_EntregaXML.ExecSQL;
                                  except
                                    On E:Exception do
                                      begin
                                        Fr_Dados.FDConnection.RollBack;
                                        bLog := True;
                                        Writeln( 'Falha ao Inserir XML_Remetente: ' + E.Message );
                                        doSaveLog(PastaLOG, GetComando(FD_Insert_EntregaXML) + #13#10 + 'Falha ao incluir XML_Remetente.' + E.Message);
                                        Continue;
                                      end;
                                  end;

                                  varSQL := ' INSERT INTO [dbo].[XML_Tomador]( ';
                                  varSQL := varSQL + ' cCT ';
                                  varSQL := varSQL + ',XML_CAPA_ID ';
                                  varSQL := varSQL + ',CNPJ';
                                  varSQL := varSQL + ',IE';
                               //   varSQL := varSQL + ',IEST';
                                  varSQL := varSQL + ',xNome';
                              //    varSQL := varSQL + ',xFant';
                               //   varSQL := varSQL + ',Fone';
                                  varSQL := varSQL + ',xCpl';
                                  varSQL := varSQL + ',xLgr';
                                  varSQL := varSQL + ',nro';
                                  varSQL := varSQL + ',xBairro';
                                  varSQL := varSQL + ',cMun';
                                  varSQL := varSQL + ',xMun';
                                  varSQL := varSQL + ',CEP';
                                  varSQL := varSQL + ',UF';
                                  varSQL := varSQL + ',Email)';

                                  varSQL := varSQL + ' VALUES ( ' ;
                                  varSQL := varSQL + ':cCT ';
                                  varSQL := varSQL + ',:XML_CAPA_ID ';
                                  varSQL := varSQL +',:CNPJ ';
                                  varSQL := varSQL +',:IE ';
                             //     varSQL := varSQL +',:IEST ';
                                  varSQL := varSQL +',:xNome ';
                           //       varSQL := varSQL +',:xFant ';
                         //         varSQL := varSQL +',:Fone ';
                                  varSQL := varSQL +',:xCpl ';
                                  varSQL := varSQL +',:xLgr ';
                                  varSQL := varSQL +',:nro ';
                                  varSQL := varSQL +',:xBairro ';
                                  varSQL := varSQL +',:cMun';
                                  varSQL := varSQL +',:xMun';
                                  varSQL := varSQL +',:CEP';
                                  varSQL := varSQL +',:UF';
                                  varSQL := varSQL +',:Email)';


                                  FD_Insert_EntregaXML.Close;
                                  FD_Insert_EntregaXML.SQL.Clear;
                                  FD_Insert_EntregaXML.SQL.Add( varSQL );

                                  if (ide.toma03.Toma = tmRemetente) then
                                  begin

                                     FD_Insert_EntregaXML.ParamByName('cCT').AsInteger                    := ide.cCT;
                                     FD_Insert_EntregaXML.ParamByName('XML_CAPA_ID').AsInteger            := IDENTITY_ID;
                                     FD_Insert_EntregaXML.ParamByName('CNPJ').AsString                    := rem.CNPJCPF;
                                     FD_Insert_EntregaXML.ParamByName('IE').AsString                      := rem.IE;
                                    // FD_Insert_EntregaXML.ParamByName('IEST').AsString                    := Dest.IEST;
                                     FD_Insert_EntregaXML.ParamByName('xNome').AsString                   := rem.xNome;
                          //           FD_Insert_EntregaXML.ParamByName('xFant').AsString                   := Dest.xFant;
                          //           FD_Insert_EntregaXML.ParamByName('Fone').AsString                    := Dest.enderDest.fone;
                                     FD_Insert_EntregaXML.ParamByName('xCpl').AsString                    := rem.enderReme.xCpl;
                                     FD_Insert_EntregaXML.ParamByName('xLgr').AsString                    := rem.enderReme.xLgr;
                                     FD_Insert_EntregaXML.ParamByName('nro').AsString                     := rem.enderReme.nro;
                                     FD_Insert_EntregaXML.ParamByName('xBairro').AsString                 := rem.enderReme.xBairro;
                                     FD_Insert_EntregaXML.ParamByName('cMun').AsString                    := IntToStr(rem.enderReme.cMun);
                                     FD_Insert_EntregaXML.ParamByName('xMun').AsString                    := rem.enderReme.xMun;

                                     FD_Insert_EntregaXML.ParamByName('CEP').AsString                     := IntToStr(rem.enderReme.CEP);
                                     FD_Insert_EntregaXML.ParamByName('UF').AsString                      := rem.enderReme.UF;
                                     FD_Insert_EntregaXML.ParamByName('Email').AsString                   := rem.email;

                                  end
                                  else if (ide.toma03.Toma = tmExpedidor)  then
                                  begin
                                     FD_Insert_EntregaXML.ParamByName('cCT').AsInteger                    := ide.cCT;
                                     FD_Insert_EntregaXML.ParamByName('XML_CAPA_ID').AsInteger            := IDENTITY_ID;
                                     FD_Insert_EntregaXML.ParamByName('CNPJ').AsString                    := emit.CNPJ;
                                     FD_Insert_EntregaXML.ParamByName('IE').AsString                      := emit.IE;
                                    // FD_Insert_EntregaXML.ParamByName('IEST').AsString                    := Dest.IEST;
                                     FD_Insert_EntregaXML.ParamByName('xNome').AsString                   := emit.xNome;
                          //           FD_Insert_EntregaXML.ParamByName('xFant').AsString                   := Dest.xFant;
                          //           FD_Insert_EntregaXML.ParamByName('Fone').AsString                    := Dest.enderDest.fone;
                                     FD_Insert_EntregaXML.ParamByName('xCpl').AsString                    := emit.enderEmit.xCpl;
                                     FD_Insert_EntregaXML.ParamByName('xLgr').AsString                    := emit.enderEmit.xLgr;
                                     FD_Insert_EntregaXML.ParamByName('nro').AsString                     := emit.enderEmit.nro;
                                     FD_Insert_EntregaXML.ParamByName('xBairro').AsString                 := emit.enderEmit.xBairro;
                                     FD_Insert_EntregaXML.ParamByName('cMun').AsString                    := IntToStr(emit.enderEmit.cMun);
                                     FD_Insert_EntregaXML.ParamByName('xMun').AsString                    := emit.enderEmit.xMun;
                                     FD_Insert_EntregaXML.ParamByName('CEP').AsString                     := IntToStr(emit.enderEmit.CEP);
                                     FD_Insert_EntregaXML.ParamByName('UF').AsString                      := emit.enderEmit.UF;
                                     FD_Insert_EntregaXML.ParamByName('Email').AsString                   := '';

                                  end
                                  else if (ide.toma03.Toma = tmDestinatario)  then
                                  begin
                                     FD_Insert_EntregaXML.ParamByName('cCT').AsInteger                    := ide.cCT;
                                     FD_Insert_EntregaXML.ParamByName('XML_CAPA_ID').AsInteger            := IDENTITY_ID;
                                     FD_Insert_EntregaXML.ParamByName('CNPJ').AsString                    := Dest.CNPJCPF;
                                     FD_Insert_EntregaXML.ParamByName('IE').AsString                      := Dest.IE;
                                    // FD_Insert_EntregaXML.ParamByName('IEST').AsString                    := Dest.IEST;
                                     FD_Insert_EntregaXML.ParamByName('xNome').AsString                   := Dest.xNome;
                          //           FD_Insert_EntregaXML.ParamByName('xFant').AsString                   := Dest.xFant;
                          //           FD_Insert_EntregaXML.ParamByName('Fone').AsString                    := Dest.enderDest.fone;
                                     FD_Insert_EntregaXML.ParamByName('xCpl').AsString                    := Dest.enderDest.xCpl;
                                     FD_Insert_EntregaXML.ParamByName('xLgr').AsString                    := Dest.enderDest.xLgr;
                                     FD_Insert_EntregaXML.ParamByName('nro').AsString                     := Dest.enderDest.nro;
                                     FD_Insert_EntregaXML.ParamByName('xBairro').AsString                 := Dest.enderDest.xBairro;
                                     FD_Insert_EntregaXML.ParamByName('cMun').AsString                    := IntToStr(Dest.enderDest.cMun);
                                     FD_Insert_EntregaXML.ParamByName('xMun').AsString                    := Dest.enderDest.xMun;
                                     FD_Insert_EntregaXML.ParamByName('CEP').AsString                     := IntToStr(Dest.enderDest.CEP);
                                     FD_Insert_EntregaXML.ParamByName('UF').AsString                      := Dest.enderDest.UF;
                                     FD_Insert_EntregaXML.ParamByName('Email').AsString                   := Dest.email;

                                  end
                                  else if (ide.toma4.Toma = tmOutros) then
                                  begin
                                     FD_Insert_EntregaXML.ParamByName('cCT').AsInteger                    := ide.cCT;
                                     FD_Insert_EntregaXML.ParamByName('XML_CAPA_ID').AsInteger            := IDENTITY_ID;
                                     FD_Insert_EntregaXML.ParamByName('CNPJ').AsString                    := ide.toma4.CNPJCPF;
                                     FD_Insert_EntregaXML.ParamByName('IE').AsString                      := ide.toma4.IE;
                                    // FD_Insert_EntregaXML.ParamByName('IEST').AsString                    := Dest.IEST;
                                     FD_Insert_EntregaXML.ParamByName('xNome').AsString                   := ide.toma4.xNome;
                          //           FD_Insert_EntregaXML.ParamByName('xFant').AsString                   := Dest.xFant;
                          //           FD_Insert_EntregaXML.ParamByName('Fone').AsString                    := Dest.enderDest.fone;
                       //              FD_Insert_EntregaXML.ParamByName('xCpl').AsString                    := ide.toma4.enderToma.xCpl;
                                     FD_Insert_EntregaXML.ParamByName('xLgr').AsString                    := ide.toma4.enderToma.xLgr;
                                     FD_Insert_EntregaXML.ParamByName('nro').AsString                     := ide.toma4.enderToma.nro;
                                     FD_Insert_EntregaXML.ParamByName('xBairro').AsString                 := ide.toma4.enderToma.xBairro;
                                     FD_Insert_EntregaXML.ParamByName('cMun').AsString                    := IntToStr(ide.toma4.enderToma.cMun);
                                     FD_Insert_EntregaXML.ParamByName('xMun').AsString                    := ide.toma4.enderToma.xMun;
                                     FD_Insert_EntregaXML.ParamByName('CEP').AsString                     := IntToStr(ide.toma4.enderToma.CEP);
                                     FD_Insert_EntregaXML.ParamByName('UF').AsString                      := ide.toma4.enderToma.UF;
                                     FD_Insert_EntregaXML.ParamByName('Email').AsString                   := '';

                                  end;

                                  try
                                    FD_Insert_EntregaXML.ExecSQL;
                                  except
                                    On E:Exception do
                                      begin
                                        Fr_Dados.FDConnection.RollBack;
                                        bLog := True;
                                        Writeln( 'Falha ao Inserir XML_Tomador: ' + E.Message );
                                        doSaveLog(PastaLOG, GetComando(FD_Insert_EntregaXML) + #13#10 + 'Falha ao incluir XML_Tomador.' + E.Message);
                                        Continue;
                                      end;
                                  end;

                                  varSQL := ' INSERT INTO [dbo].[XML_VPrest]( ';
                                  varSQL := varSQL + ' cCT ';
                                  varSQL := varSQL + ',XML_CAPA_ID ';
                                  varSQL := varSQL + ' ,vTPrest ';
                                  varSQL := varSQL + ' ,vRec )';
                                  varSQL := varSQL + ' Values (';
                                  varSQL := varSQL + ' :cCT ';
                                  varSQL := varSQL + ',:XML_CAPA_ID ';
                                  varSQL := varSQL + ' ,:vTPrest ';
                                  varSQL := varSQL + ' ,:vRec )';

                                  FD_Insert_EntregaXML.Close;
                                  FD_Insert_EntregaXML.SQL.Clear;
                                  FD_Insert_EntregaXML.SQL.Add( varSQL );

                                  FD_Insert_EntregaXML.ParamByName('cCT').AsInteger                    := ide.cCT;
                                  FD_Insert_EntregaXML.ParamByName('XML_CAPA_ID').AsInteger            := IDENTITY_ID;
                                  FD_Insert_EntregaXML.ParamByName('vTPrest').asFloat                  := vPrest.vTPrest;
                                  FD_Insert_EntregaXML.ParamByName('vRec').asFloat                     := vPrest.vRec;

                                  try
                                    FD_Insert_EntregaXML.ExecSQL;
                                  except
                                    On E:Exception do
                                      begin
                                        Fr_Dados.FDConnection.RollBack;
                                        bLog := True;
                                        Writeln( 'Falha ao Inserir XML_VPrest: ' + E.Message );
                                        doSaveLog(PastaLOG, GetComando(FD_Insert_EntregaXML) + #13#10 + 'Falha ao incluir XML_VPrest.' + E.Message);
                                        Continue;
                                      end;
                                  end;

                                  // Guardar Arquivo XML
                                  try
                                    varSQL := 'Insert into XML_IMPORTADA(cCT, XML_CAPA_ID, DataEmissao,Numero,Chave,CodUsuario, TipoXML)';
                                    varSQL := varSQL + ' values( :cCT, :XML_CAPA_ID, :DataEmissao,:Numero,:Chave,:CodUsuario, :TipoXML)';

                                    FD_Insert_EntregaXML.Close;
                                    FD_Insert_EntregaXML.SQL.Clear;
                                    FD_Insert_EntregaXML.SQL.Add( varSQL );

                                    FD_Insert_EntregaXML.ParamByName('cCT').asInteger               := ide.cCT;
                                    FD_Insert_EntregaXML.ParamByName('XML_CAPA_ID').AsInteger       := IDENTITY_ID;
                                    FD_Insert_EntregaXML.ParamByName('DataEmissao').AsSQLTimeStamp  := DateTimeToSQLTimeStamp(Ide.dhEmi);
                                    FD_Insert_EntregaXML.ParamByName('Numero').AsString             := IntToStr(Ide.nCT);
                                    FD_Insert_EntregaXML.ParamByName('Chave').AsString              := procCTe.chCTe;
                                    FD_Insert_EntregaXML.ParamByName('CodUsuario').AsString         := '1';
                                    FD_Insert_EntregaXML.ParamByName('TipoXML').AsString            := 'CTE';

                                  finally

                                    try
                                      FD_Insert_EntregaXML.ExecSQL;
                                      MoveFile( PWideChar(   PastaXML  +  sr.Name ) , PWideChar( PastaXML_LIDO +  sr.Name ) );
                                    except
                                      On E:Exception do
                                        begin
                                          Fr_Dados.FDConnection.RollBack;
                                          bLog := True;
                                          Writeln( 'Falha ao Inserir XML_IMPORTADA: ' + E.Message );
                                          doSaveLog(PastaLOG, GetComando(FD_Insert_EntregaXML) + ' ' +  'Falha ao incluir XML.' + E.Message);
                                        end;
                                    end;

                                  end;
                                  // Fim Guarda Arquivo XML

                                end;

                              end;
                          except
                            bLog := True;
                            doSaveLog(PastaLOG, ' Arquivo ' + PWideChar(  PastaXML +  sr.Name ));
                            Continue;
                          end;

                        end
                        else if varTipoNota = 1 then
                        begin
                          try
                              with TACBrNFe(ACBrNFe).NotasFiscais.Items[0].NFe do
                              begin

                                if (procNFe.nProt = '') then
                                begin
                                   Writeln( 'Sem Protocolo: ' +  PWideChar(  PastaXML_LIDO +  sr.Name ) );
                                   MoveFile( PWideChar(  PastaXML + sr.Name ) , PWideChar( PastaXML_LIDO +  sr.Name ) );
                                   searchResult := FindNext(sr);
                                   Inc(X);
                                   bLog := True;
                                   varTipoNota := -2;
                                   doSaveLog(PastaLOG, 'Sem Protocolo ' +  PWideChar(  PastaXML_LIDO +  sr.Name ));
                                   Continue;
                                end;


                                with FD_Consulta_EntregaXML do
                                begin
                                  Close;
                                  SQL.Clear;
                                  SQL.Add(' SELECT cCT FROM XML_IMPORTADA  ');
                                  SQL.Add(' WHERE cCT  = :cCT ');
                                  SQL.Add(' and DataEmissao  = :DataEmissao ');
                                  SQL.Add(' and Numero = :Numero ');
                                  SQL.Add(' and Chave = :Chave ');
                                  SQL.Add(' and TipoXML = :TipoXML ');
                                  ParamByName('cCT').AsInteger               := Ide.nNF ;
                                  ParamByName('DataEmissao').AsSQLTimeStamp  := DateTimeToSQLTimeStamp(Ide.dEmi);
                                  ParamByName('Numero').AsString             := IntToStr( Ide.nNF );
                                  ParamByName('Chave').AsString              := procNFe.chNFe;
                                  ParamByName('TipoXML').AsString            := 'NFE';
                                  Open;
                                end;


                                if not FD_Consulta_EntregaXML.IsEmpty then
                                begin
                                   Writeln( 'Existente: ' +  PWideChar(  PastaXML_LIDO +  sr.Name ) );
                                   MoveFile( PWideChar(  PastaXML + sr.Name ) , PWideChar(  PastaXML_LIDO +  sr.Name ) );
                                   searchResult := FindNext(sr);
                                   Inc(X);
                                   bLog := True;
                                   varTipoNota := -2;
                                   doSaveLog(PastaLOG, 'Existente ' +  PWideChar(  PastaXML_LIDO +  sr.Name ));
                                   Continue;
                                end;


                                with TACBrNFe(ACBrNFe).NotasFiscais.Items[0].NFe do
                                begin
                                 varSQL := ' INSERT INTO XML_PROTOCOLO (';
                                 varSQL := varSQL + ' ID,  ';
                                 varSQL := varSQL + ' tpAmb, ';
                                 varSQL := varSQL + ' verAplic, ';
                                 varSQL := varSQL + ' chCTe, ';
                                 varSQL := varSQL + ' dhRecbto, ';
                                 varSQL := varSQL + ' nProt,  ';
                                 varSQL := varSQL + ' digVal, ';
                                 varSQL := varSQL + ' cStat, ';
                                 varSQL := varSQL + ' xMotivo, ';
                                 varSQL := varSQL + ' Numero, ';
                                 varSQL := varSQL + ' cCT ';
                                 varSQL := varSQL + ' ) VALUES  ( ';
                                 varSQL := varSQL + ' :ID,  ';
                                 varSQL := varSQL + ' :tpAmb, ';
                                 varSQL := varSQL + ' :verAplic, ';
                                 varSQL := varSQL + ' :chCTe, ';
                                 varSQL := varSQL + ' :dhRecbto, ';
                                 varSQL := varSQL + ' :nProt,  ';
                                 varSQL := varSQL + ' :digVal, ';
                                 varSQL := varSQL + ' :cStat, ';
                                 varSQL := varSQL + ' :xMotivo, ';
                                 varSQL := varSQL + ' :Numero, ';
                                 varSQL := varSQL + ' :cCT) ';

                                 FD_Insert_EntregaXML.Close;
                                 FD_Insert_EntregaXML.SQL.Clear;
                                 FD_Insert_EntregaXML.SQL.Add( varSQL );

                                 FD_Insert_EntregaXML.ParamByName('ID').AsString                        := infNFe.ID;
                                 FD_Insert_EntregaXML.ParamByName('tpAmb').AsString                     := TpAmbToStr(procNFe.tpAmb);
                                 FD_Insert_EntregaXML.ParamByName('verAplic').AsString                  := procNFe.verAplic;
                                 FD_Insert_EntregaXML.ParamByName('chCTe').AsString                     := procNFe.chNFe;
                                 FD_Insert_EntregaXML.ParamByName('dhRecbto').AsSQLTimeStamp            := DateTimeToSQLTimeStamp(procNFe.dhRecbto);
                                 FD_Insert_EntregaXML.ParamByName('nProt').AsString                     := procNFe.nProt;
                                 FD_Insert_EntregaXML.ParamByName('digVal').AsString                    := procNFe.digVal;
                                 FD_Insert_EntregaXML.ParamByName('cStat').AsString                     := IntToStr(procNFe.cStat);
                                 FD_Insert_EntregaXML.ParamByName('xMotivo').AsString                   := procNFe.xMotivo;
                                 FD_Insert_EntregaXML.ParamByName('Numero').AsString                    := IntToStr(ide.nNF);
                                 FD_Insert_EntregaXML.ParamByName('cCT').AsInteger                      := ide.nNF;
                                 try
                                   FD_Insert_EntregaXML.ExecSQL;
                                 except
                                   On E:Exception do
                                     begin
                                       Fr_Dados.FDConnection.RollBack;
                                       bLog := True;
                                       Writeln( 'Falha ao incluir XML_PROTOCOLO.: ' +  PWideChar(  PastaXML_LIDO +  sr.Name ) );
                                       doSaveLog(PastaLOG, GetComando(FD_Insert_EntregaXML)  + ' - Falha ao incluir XML_PROTOCOLO.' + E.Message);
                                       Continue;
                                     end;
                                 end;

                                 varSQL := ' INSERT INTO XML_CAPA (';
                                // varSQL := varSQL + ' XML_FILIAL_ID XXXX';
                                 varSQL := varSQL + ' cUF ';
                                 varSQL := varSQL + ' ,cCT';
                                 varSQL := varSQL + ' ,CFOP';
                                 varSQL := varSQL + ' ,natOp';
                                 varSQL := varSQL + ' ,forPag';
                                 varSQL := varSQL + ' ,mod_';
                                 varSQL := varSQL + ' ,serie';
                                 varSQL := varSQL + ' ,Numero';
                                 varSQL := varSQL + ' ,dhEmi';
                                 varSQL := varSQL + ' ,tpImp';
                                 varSQL := varSQL + ' ,tpEmis';
                                 varSQL := varSQL + ' ,cDV';
                                 varSQL := varSQL + ' ,tpAmb';
                                 varSQL := varSQL + ' ,tpCTe';
                                 varSQL := varSQL + ' ,procEmi';
                                 varSQL := varSQL + ' ,verProc';
                                 varSQL := varSQL + ' ,cMunEnv';
                                 varSQL := varSQL + ' ,xMunEnv';
                                 varSQL := varSQL + ' ,UFEnv';
                                 varSQL := varSQL + ' ,modal';
                                 varSQL := varSQL + ' ,tpServ';
                                 varSQL := varSQL + ' ,cMunIni';
                                 varSQL := varSQL + ' ,xMunIni';
                                 varSQL := varSQL + ' ,UFIni';
                                 varSQL := varSQL + ' ,cMunFim';
                                 varSQL := varSQL + ' ,xMunFim';
                                 varSQL := varSQL + ' ,UFFim';
                                 varSQL := varSQL + ' ,retira';
                                 varSQL := varSQL + ' ,toma03';
                                 varSQL := varSQL + ' ,xCaracAd';
                                 varSQL := varSQL + ' ,xCaracSer';
                                 varSQL := varSQL + ' ,xEmi';
                                 varSQL := varSQL + ' ,xOrig';
                                 varSQL := varSQL + ' ,xDest';
                                 varSQL := varSQL + ' ,tpPer';
                                 varSQL := varSQL + ' ,dProg';
                                 varSQL := varSQL + ' ,tpHor';
                                 varSQL := varSQL + ' ,hProg';
                                 varSQL := varSQL + ' ,xObs)';
                                 varSQL := varSQL + ' VALUES ';
                                 //varSQL := varSQL + ' ( :XML_FILIAL_ID,';
                                 varSQL := varSQL + '  (:cUF,';
                                 varSQL := varSQL + '  :cCT, ';
                                 varSQL := varSQL + '  :CFOP, ';
                                 varSQL := varSQL + '  :natOp, ';
                                 varSQL := varSQL + '  :forPag, ';
                                 varSQL := varSQL + '  :mod_, ';
                                 varSQL := varSQL + '  :serie, ';
                                 varSQL := varSQL + '  :Numero, ';
                                 varSQL := varSQL + '  :dhEmi, ';
                                 varSQL := varSQL + '  :tpImp, ';
                                 varSQL := varSQL + '  :tpEmis, ';
                                 varSQL := varSQL + '  :cDV, ';
                                 varSQL := varSQL + '  :tpAmb, ';
                                 varSQL := varSQL + '  :tpCTe, ';
                                 varSQL := varSQL + '  :procEmi, ';
                                 varSQL := varSQL + '  :verProc, ';
                                 varSQL := varSQL + '  :cMunEnv, ';
                                 varSQL := varSQL + '  :xMunEnv,';
                                 varSQL := varSQL + '  :UFEnv, ';
                                 varSQL := varSQL + '  :modal, ';
                                 varSQL := varSQL + '  :tpServ, ';
                                 varSQL := varSQL + '  :cMunIni, ';
                                 varSQL := varSQL + '  :xMunIni, ';
                                 varSQL := varSQL + '  :UFIni, ';
                                 varSQL := varSQL + '  :cMunFim, ';
                                 varSQL := varSQL + '  :xMunFim, ';
                                 varSQL := varSQL + '  :UFFim, ';
                                 varSQL := varSQL + '  :retira, ';
                                 varSQL := varSQL + '  :toma03, ';
                                 varSQL := varSQL + '  :xCaracAd, ';
                                 varSQL := varSQL + '  :xCaracSer, ';
                                 varSQL := varSQL + '  :xEmi, ';
                                 varSQL := varSQL + '  :xOrig, ';
                                 varSQL := varSQL + '  :xDest, ';
                                 varSQL := varSQL + '  :tpPer, ';
                                 varSQL := varSQL + '  :dProg, ';
                                 varSQL := varSQL + '  :tpHor, ';
                                 varSQL := varSQL + '  :hProg, ';
                                 varSQL := varSQL + '  :xObs) ';

                                 FD_Insert_EntregaXML.Close;
                                 FD_Insert_EntregaXML.SQL.Clear;
                                 FD_Insert_EntregaXML.SQL.Add( varSQL );

                               //  FD_Insert_EntregaXML.ParamByName('XML_FILIAL_ID').AsString           := VarToStr(EditFilial.bs_KeyValue);
                                 FD_Insert_EntregaXML.ParamByName('cUF').AsString                     := IntToStr(Ide.cUF);
                                 FD_Insert_EntregaXML.ParamByName('cCT').AsInteger                    := ide.nNF;
                                 FD_Insert_EntregaXML.ParamByName('CFOP').AsString                    := '';
                                 FD_Insert_EntregaXML.ParamByName('natOp').AsString                   := ide.natOp;
                                 FD_Insert_EntregaXML.ParamByName('forPag').AsString                  := '';
                                 FD_Insert_EntregaXML.ParamByName('mod_').AsString                    := IntToStr(ide.modelo);
                                 FD_Insert_EntregaXML.ParamByName('serie').AsString                   := IntToStr(ide.serie);
                                 FD_Insert_EntregaXML.ParamByName('Numero').AsString                  := IntToStr(ide.nNF);
                                 FD_Insert_EntregaXML.ParamByName('dhEmi').AsSQLTimeStamp             := DateTimeToSQLTimeStamp(ide.dEmi);
                                 FD_Insert_EntregaXML.ParamByName('tpImp').AsString                   := TpImpToStr(ide.tpImp);
                                 FD_Insert_EntregaXML.ParamByName('tpEmis').AsString                  := TpEmisToStr(ide.tpEmis);
                                 FD_Insert_EntregaXML.ParamByName('cDV').AsString                     := IntToStr(ide.cDV);
                                 FD_Insert_EntregaXML.ParamByName('tpAmb').AsString                   := TpAmbToStr(ide.tpAmb);
                                 FD_Insert_EntregaXML.ParamByName('tpCTe').AsString                   := '';
                                 FD_Insert_EntregaXML.ParamByName('procEmi').AsString                 := procEmiToStr(ide.procEmi);
                                 FD_Insert_EntregaXML.ParamByName('verProc').AsString                 := ide.verProc;
                                 FD_Insert_EntregaXML.ParamByName('cMunEnv').AsString                 := InTToStr(Dest.EnderDest.cMun);
                                 FD_Insert_EntregaXML.ParamByName('xMunEnv').AsString                 := Dest.EnderDest.xMun;
                                 FD_Insert_EntregaXML.ParamByName('UFEnv').AsString                   := Dest.EnderDest.UF;
                                 FD_Insert_EntregaXML.ParamByName('modal').AsString                   := '';
                                 FD_Insert_EntregaXML.ParamByName('tpServ').AsString                  := '';
                                 FD_Insert_EntregaXML.ParamByName('cMunIni').AsInteger                := Emit.EnderEmit.cMun;
                                 FD_Insert_EntregaXML.ParamByName('xMunIni').AsString                 := Emit.EnderEmit.xMun;
                                 FD_Insert_EntregaXML.ParamByName('UFIni').AsString                   := Emit.EnderEmit.UF;
                                 FD_Insert_EntregaXML.ParamByName('cMunFim').AsInteger                := Dest.EnderDest.cMun;
                                 FD_Insert_EntregaXML.ParamByName('xMunFim').AsString                 := Dest.EnderDest.xMun;
                                 FD_Insert_EntregaXML.ParamByName('UFFim').AsString                   := Dest.EnderDest.UF;
                                 FD_Insert_EntregaXML.ParamByName('retira').AsString                  := '';
                                 FD_Insert_EntregaXML.ParamByName('toma03').AsString                  := '';
                                 FD_Insert_EntregaXML.ParamByName('xCaracAd').AsString                := '' ;
                                 FD_Insert_EntregaXML.ParamByName('xCaracSer').AsString               := '';
                                 FD_Insert_EntregaXML.ParamByName('xEmi').AsString                    := '';
                                 FD_Insert_EntregaXML.ParamByName('xOrig').AsString                   := '';
                                 FD_Insert_EntregaXML.ParamByName('xDest').AsString                   := '';
                                 FD_Insert_EntregaXML.ParamByName('tpPer').AsString                   := '';
                                 FD_Insert_EntregaXML.ParamByName('dProg').AsSQLTimeStamp             := DateTimeToSQLTimeStamp(Date);
                                 FD_Insert_EntregaXML.ParamByName('tpHor').AsString                   := '';
                                 FD_Insert_EntregaXML.ParamByName('hProg').AsSQLTimeStamp             := DateTimeToSQLTimeStamp(Date);
                                 FD_Insert_EntregaXML.ParamByName('xObs').AsString                    := '';

                                 try
                                   FD_Insert_EntregaXML.ExecSQL;
                                 except
                                   On E:Exception do
                                     begin
                                       Fr_Dados.FDConnection.RollBack;
                                       Writeln( 'Falha ao incluir XML_CAPA.: ' +  PWideChar(  PastaXML_LIDO +  sr.Name ) );
                                       doSaveLog(PastaLOG, GetComando(FD_Insert_EntregaXML) + #13#10 + 'Falha ao incluir XML_CAPA.' + E.Message);
                                       Continue;
                                     end;
                                 end;


                                 Try
                                   IDENTITY_ID := 0;
                                   varSQL  := 'SELECT @@IDENTITY as XML_CAPA_ID ';

                                   FD_Insert_EntregaXML.Close;
                                   FD_Insert_EntregaXML.SQL.Clear;
                                   FD_Insert_EntregaXML.SQL.Add( varSQL );
                                   FD_Insert_EntregaXML.Open;
                                   IDENTITY_ID := FD_Insert_EntregaXML.FieldByName('XML_CAPA_ID').AsInteger;

                                 except
                                   On E:Exception do
                                     begin
                                        Fr_Dados.FDConnection.RollBack;
                                        bLog := True;
                                        Writeln( 'Falha ao pegar Chave XML_CAPA.: ' +  PWideChar(  PastaXML_LIDO +  sr.Name ) );
                                        doSaveLog(PastaLOG, GetComando(FD_Insert_EntregaXML) + #13#10 + 'Falha ao pegar chave da XML_CAPA.' + E.Message);
                                        Continue;
                                      end;
                                 end;

                                 varSQL := ' INSERT INTO [dbo].[XML_EMITENTE]( ';
                                 varSQL := varSQL + ' cCT ';
                                 varSQL := varSQL + ',XML_CAPA_ID ';
                                 varSQL := varSQL + ',CNPJCPF';
                                 varSQL := varSQL + ',IE';
                                 varSQL := varSQL + ',IEST';
                                 varSQL := varSQL + ',xNome';
                                 varSQL := varSQL + ',xFant';
                                 varSQL := varSQL + ',Fone';
                                 varSQL := varSQL + ',xCpl';
                                 varSQL := varSQL + ',xLgr';
                                 varSQL := varSQL + ',nro';
                                 varSQL := varSQL + ',xBairro';
                                 varSQL := varSQL + ',cMun';
                                 varSQL := varSQL + ',xMun';
                                 varSQL := varSQL + ',CEP';
                                 varSQL := varSQL + ',UF)';
                                 varSQL := varSQL + ' VALUES ( ' ;
                                 varSQL := varSQL + ':cCT ';
                                 varSQL := varSQL + ',:XML_CAPA_ID ';
                                 varSQL := varSQL +',:CNPJCPF ';
                                 varSQL := varSQL +',:IE ';
                                 varSQL := varSQL +',:IEST ';
                                 varSQL := varSQL +',:xNome ';
                                 varSQL := varSQL +',:xFant ';
                                 varSQL := varSQL +',:Fone ';
                                 varSQL := varSQL +',:xCpl ';
                                 varSQL := varSQL +',:xLgr ';
                                 varSQL := varSQL +',:nro ';
                                 varSQL := varSQL +',:xBairro ';
                                 varSQL := varSQL +',:cMun';
                                 varSQL := varSQL +',:xMun';
                                 varSQL := varSQL +',:CEP';
                                 varSQL := varSQL +',:UF)';

                                 FD_Insert_EntregaXML.Close;
                                 FD_Insert_EntregaXML.SQL.Clear;
                                 FD_Insert_EntregaXML.SQL.Add( varSQL );

                                 FD_Insert_EntregaXML.ParamByName('cCT').AsInteger                    := ide.nNF;
                                 FD_Insert_EntregaXML.ParamByName('XML_CAPA_ID').AsInteger            := IDENTITY_ID;
                                 FD_Insert_EntregaXML.ParamByName('CNPJCPF').AsString                 := Emit.CNPJCPF;
                                 FD_Insert_EntregaXML.ParamByName('IE').AsString                      := Emit.IE;
                                 FD_Insert_EntregaXML.ParamByName('IEST').AsString                    := Emit.IEST;
                                 FD_Insert_EntregaXML.ParamByName('xNome').AsString                   := Emit.xNome;
                                 FD_Insert_EntregaXML.ParamByName('xFant').AsString                   := Emit.xFant;
                                 FD_Insert_EntregaXML.ParamByName('Fone').AsString                    := Emit.EnderEmit.fone;
                                 FD_Insert_EntregaXML.ParamByName('xCpl').AsString                    := Emit.EnderEmit.xCpl;
                                 FD_Insert_EntregaXML.ParamByName('xLgr').AsString                    := Emit.EnderEmit.xLgr;
                                 FD_Insert_EntregaXML.ParamByName('nro').AsString                     := Emit.EnderEmit.nro;
                                 FD_Insert_EntregaXML.ParamByName('xBairro').AsString                 := Emit.EnderEmit.xBairro;
                                 FD_Insert_EntregaXML.ParamByName('cMun').AsString                    := IntToStr(Emit.EnderEmit.cMun);
                                 FD_Insert_EntregaXML.ParamByName('xMun').AsString                    := Emit.EnderEmit.xMun;

                                 FD_Insert_EntregaXML.ParamByName('CEP').AsString                     := IntToStr(Emit.EnderEmit.CEP);
                                 FD_Insert_EntregaXML.ParamByName('UF').AsString                      := Emit.EnderEmit.UF;

                                 try
                                   FD_Insert_EntregaXML.ExecSQL;
                                 except
                                   On E:Exception do
                                     begin
                                       Fr_Dados.FDConnection.RollBack;
                                       bLog := True;
                                       Writeln( 'Falha ao incluir XML_EMITENTE: ' +  PWideChar(  PastaXML_LIDO +  sr.Name ) );
                                       doSaveLog(PastaLOG, GetComando(FD_Insert_EntregaXML) + #13#10 + 'Falha ao incluir XML_EMITENTE.' + E.Message);
                                       Continue;
                                     end;
                                 end;


                                 varSQL := ' INSERT INTO [dbo].[XML_Destinatario]( ';
                                 varSQL := varSQL + ' cCT ';
                                 varSQL := varSQL + ',XML_CAPA_ID ';
                                 varSQL := varSQL + ',CNPJ';
                                 varSQL := varSQL + ',IE';
                              //   varSQL := varSQL + ',IEST';
                                 varSQL := varSQL + ',xNome';
                             //    varSQL := varSQL + ',xFant';
                              //   varSQL := varSQL + ',Fone';
                                 varSQL := varSQL + ',xCpl';
                                 varSQL := varSQL + ',xLgr';
                                 varSQL := varSQL + ',nro';
                                 varSQL := varSQL + ',xBairro';
                                 varSQL := varSQL + ',cMun';
                                 varSQL := varSQL + ',xMun';
                                 varSQL := varSQL + ',CEP';
                                 varSQL := varSQL + ',UF)';
                                 varSQL := varSQL + ' VALUES ( ' ;
                                 varSQL := varSQL + ':cCT ';
                                 varSQL := varSQL + ',:XML_CAPA_ID ';
                                 varSQL := varSQL +',:CNPJ ';
                                 varSQL := varSQL +',:IE ';
                            //     varSQL := varSQL +',:IEST ';
                                 varSQL := varSQL +',:xNome ';
                          //       varSQL := varSQL +',:xFant ';
                        //         varSQL := varSQL +',:Fone ';
                                 varSQL := varSQL +',:xCpl ';
                                 varSQL := varSQL +',:xLgr ';
                                 varSQL := varSQL +',:nro ';
                                 varSQL := varSQL +',:xBairro ';
                                 varSQL := varSQL +',:cMun';
                                 varSQL := varSQL +',:xMun';
                                 varSQL := varSQL +',:CEP';
                                 varSQL := varSQL +',:UF)';

                                 FD_Insert_EntregaXML.Close;
                                 FD_Insert_EntregaXML.SQL.Clear;
                                 FD_Insert_EntregaXML.SQL.Add( varSQL );

                                 FD_Insert_EntregaXML.ParamByName('cCT').AsInteger                    := ide.nNF;
                                 FD_Insert_EntregaXML.ParamByName('XML_CAPA_ID').AsInteger            := IDENTITY_ID;
                                 FD_Insert_EntregaXML.ParamByName('CNPJ').AsString                    := Dest.CNPJCPF;
                                 FD_Insert_EntregaXML.ParamByName('IE').AsString                      := Dest.IE;
                                // FD_Insert_EntregaXML.ParamByName('IEST').AsString                    := Dest.IEST;
                                 FD_Insert_EntregaXML.ParamByName('xNome').AsString                   := Dest.xNome;
                      //           FD_Insert_EntregaXML.ParamByName('xFant').AsString                   := Dest.xFant;
                      //           FD_Insert_EntregaXML.ParamByName('Fone').AsString                    := Dest.enderDest.fone;
                                 FD_Insert_EntregaXML.ParamByName('xCpl').AsString                    := Dest.enderDest.xCpl;
                                 FD_Insert_EntregaXML.ParamByName('xLgr').AsString                    := Dest.enderDest.xLgr;
                                 FD_Insert_EntregaXML.ParamByName('nro').AsString                     := Dest.enderDest.nro;
                                 FD_Insert_EntregaXML.ParamByName('xBairro').AsString                 := Dest.enderDest.xBairro;
                                 FD_Insert_EntregaXML.ParamByName('cMun').AsString                    := IntToStr(Dest.enderDest.cMun);
                                 FD_Insert_EntregaXML.ParamByName('xMun').AsString                    := Dest.enderDest.xMun;

                                 FD_Insert_EntregaXML.ParamByName('CEP').AsString                     := IntToStr(Dest.enderDest.CEP);
                                 FD_Insert_EntregaXML.ParamByName('UF').AsString                      := Dest.enderDest.UF;

                                 try
                                   FD_Insert_EntregaXML.ExecSQL;
                                 except
                                   On E:Exception do
                                     begin
                                       Fr_Dados.FDConnection.RollBack;
                                       bLog := True;
                                       Writeln( 'Falha ao incluir XML_Destinatario: ' +  PWideChar(  PastaXML_LIDO +  sr.Name ) );
                                       doSaveLog(PastaLOG, GetComando(FD_Insert_EntregaXML) + #13#10 + 'Falha ao incluir XML_Destinatario.' + E.Message);
                                       Continue;
                                     end;
                                 end;



                                 varSQL := ' INSERT INTO [dbo].[XML_Remetente]( ';
                                 varSQL := varSQL + ' cCT ';
                                 varSQL := varSQL + ',XML_CAPA_ID ';
                                 varSQL := varSQL + ',CNPJ';
                                 varSQL := varSQL + ',IE';
                              //   varSQL := varSQL + ',IEST';
                                 varSQL := varSQL + ',xNome';
                             //    varSQL := varSQL + ',xFant';
                              //   varSQL := varSQL + ',Fone';
                                 varSQL := varSQL + ',xCpl';
                                 varSQL := varSQL + ',xLgr';
                                 varSQL := varSQL + ',nro';
                                 varSQL := varSQL + ',xBairro';
                                 varSQL := varSQL + ',cMun';
                                 varSQL := varSQL + ',xMun';
                                 varSQL := varSQL + ',CEP';
                                 varSQL := varSQL + ',UF';
                                 varSQL := varSQL + ',Email)';

                                 varSQL := varSQL + ' VALUES ( ' ;
                                 varSQL := varSQL + ':cCT ';
                                 varSQL := varSQL + ',:XML_CAPA_ID ';
                                 varSQL := varSQL +',:CNPJ ';
                                 varSQL := varSQL +',:IE ';
                            //     varSQL := varSQL +',:IEST ';
                                 varSQL := varSQL +',:xNome ';
                          //       varSQL := varSQL +',:xFant ';
                        //         varSQL := varSQL +',:Fone ';
                                 varSQL := varSQL +',:xCpl ';
                                 varSQL := varSQL +',:xLgr ';
                                 varSQL := varSQL +',:nro ';
                                 varSQL := varSQL +',:xBairro ';
                                 varSQL := varSQL +',:cMun';
                                 varSQL := varSQL +',:xMun';
                                 varSQL := varSQL +',:CEP';
                                 varSQL := varSQL +',:UF';
                                 varSQL := varSQL +',:Email)';

                                 FD_Insert_EntregaXML.Close;
                                 FD_Insert_EntregaXML.SQL.Clear;
                                 FD_Insert_EntregaXML.SQL.Add( varSQL );

                                 FD_Insert_EntregaXML.ParamByName('cCT').AsInteger                    := ide.nNF;
                                 FD_Insert_EntregaXML.ParamByName('XML_CAPA_ID').AsInteger            := IDENTITY_ID;
                                 FD_Insert_EntregaXML.ParamByName('CNPJ').AsString                    := Emit.CNPJCPF;
                                 FD_Insert_EntregaXML.ParamByName('IE').AsString                      := Emit.IE;
                                // FD_Insert_EntregaXML.ParamByName('IEST').AsString                    := Dest.IEST;
                                 FD_Insert_EntregaXML.ParamByName('xNome').AsString                   := Emit.xNome;
                      //           FD_Insert_EntregaXML.ParamByName('xFant').AsString                   := Dest.xFant;
                      //           FD_Insert_EntregaXML.ParamByName('Fone').AsString                    := Dest.enderDest.fone;
                                 FD_Insert_EntregaXML.ParamByName('xCpl').AsString                    := Emit.EnderEmit.xCpl;
                                 FD_Insert_EntregaXML.ParamByName('xLgr').AsString                    := Emit.EnderEmit.xLgr;
                                 FD_Insert_EntregaXML.ParamByName('nro').AsString                     := Emit.EnderEmit.nro;
                                 FD_Insert_EntregaXML.ParamByName('xBairro').AsString                 := Emit.EnderEmit.xBairro;
                                 FD_Insert_EntregaXML.ParamByName('cMun').AsString                    := IntToStr(Emit.EnderEmit.cMun);
                                 FD_Insert_EntregaXML.ParamByName('xMun').AsString                    := Emit.EnderEmit.xMun;

                                 FD_Insert_EntregaXML.ParamByName('CEP').AsString                     := IntToStr(Emit.EnderEmit.CEP);
                                 FD_Insert_EntregaXML.ParamByName('UF').AsString                      := Emit.EnderEmit.UF;
                                 FD_Insert_EntregaXML.ParamByName('Email').AsString                   := '';


                                 try
                                   FD_Insert_EntregaXML.ExecSQL;
                                 except
                                   On E:Exception do
                                     begin
                                       Fr_Dados.FDConnection.RollBack;
                                       bLog := True;
                                       Writeln( 'Falha ao incluir XML_Remetente: ' +  PWideChar(  PastaXML_LIDO +  sr.Name ) );
                                       doSaveLog(PastaLOG, GetComando(FD_Insert_EntregaXML) + #13#10 + 'Falha ao incluir XML_Remetente.' + E.Message);
                                       Continue;
                                     end;
                                 end;

                                 varSQL := ' INSERT INTO [dbo].[XML_VPrest]( ';
                                 varSQL := varSQL + ' cCT ';
                                 varSQL := varSQL + ',XML_CAPA_ID ';
                                 varSQL := varSQL + ' ,vTPrest ';
                                 varSQL := varSQL + ' ,vRec )';
                                 varSQL := varSQL + ' Values (';
                                 varSQL := varSQL + ' :cCT ';
                                 varSQL := varSQL + ',:XML_CAPA_ID ';
                                 varSQL := varSQL + ' ,:vTPrest ';
                                 varSQL := varSQL + ' ,:vRec )';

                                 FD_Insert_EntregaXML.Close;
                                 FD_Insert_EntregaXML.SQL.Clear;
                                 FD_Insert_EntregaXML.SQL.Add( varSQL );

                                 FD_Insert_EntregaXML.ParamByName('cCT').AsInteger                    := ide.nNF;
                                 FD_Insert_EntregaXML.ParamByName('XML_CAPA_ID').AsInteger            := IDENTITY_ID;
                                 FD_Insert_EntregaXML.ParamByName('vTPrest').asFloat                  := Total.ICMSTot.vNF;
                                 FD_Insert_EntregaXML.ParamByName('vRec').asFloat                     := Total.ICMSTot.vNF;

                                 try
                                   FD_Insert_EntregaXML.ExecSQL;
                                 except
                                   On E:Exception do
                                     begin
                                       Fr_Dados.FDConnection.RollBack;
                                       bLog := True;
                                       Writeln( 'Falha ao incluir XML_VPrest: ' +  PWideChar(  PastaXML_LIDO +  sr.Name ) );
                                       doSaveLog(PastaLOG, GetComando(FD_Insert_EntregaXML) + #13#10 + 'Falha ao incluir XML_VPrest.' + E.Message);
                                       Continue;
                                     end;
                                 end;


                                 try
                                   varSQL := 'insert into XML_IMPORTADA(cCT,XML_CAPA_ID,DataEmissao,Numero,Chave,CodUsuario, TipoXML)';
                                   varSQL := varSQL + ' values( :cCT,:XML_CAPA_ID,:DataEmissao,:Numero,:Chave,:CodUsuario, :TipoXML)';


                                   FD_Insert_EntregaXML.Close;
                                   FD_Insert_EntregaXML.SQL.Clear;
                                   FD_Insert_EntregaXML.SQL.Add( varSQL );

                                   FD_Insert_EntregaXML.ParamByName('cCT').asInteger               := ide.nNF;
                                   FD_Insert_EntregaXML.ParamByName('XML_CAPA_ID').AsInteger       := IDENTITY_ID;
                                   FD_Insert_EntregaXML.ParamByName('DataEmissao').AsSQLTimeStamp  := DateTimeToSQLTimeStamp(Ide.dEmi);
                                   FD_Insert_EntregaXML.ParamByName('Numero').AsString             := IntToStr(Ide.nNF);
                                   FD_Insert_EntregaXML.ParamByName('Chave').AsString              := procNFe.chNFe;
                                   FD_Insert_EntregaXML.ParamByName('CodUsuario').AsString         := '1';
                                   FD_Insert_EntregaXML.ParamByName('TipoXML').AsString            := 'NFE';


                                 finally

                                   try
                                     FD_Insert_EntregaXML.ExecSQL;
                                     MoveFile( PWideChar(   PastaXML  +  sr.Name ) , PWideChar( PastaXML_LIDO +  sr.Name ) );
                                   except
                                     On E:Exception do
                                       begin
                                        Fr_Dados.FDConnection.RollBack;
                                        bLog := True;
                                        doSaveLog(PastaLOG, GetComando(FD_Insert_EntregaXML) + ' ' +  'Falha ao incluir XML_IMPORTADA.' + E.Message);
                                        Writeln( 'Falha ao incluir XML_IMPORTADA: ' +  PWideChar(  PastaXML_LIDO +  sr.Name ) );
                                       end;
                                   end;

                                 end;

                                    // Fim Guarda Arquivo XML
                                end;

                              end;
                                Fr_Dados.FDConnection.Commit;
                          except
                           // btnImportar.Enabled  := False;
                            bLog := True;
                          //  DB_Conect.doSaveLog(lPathLog, ' Arquivo ' + rgXML.Properties.Items[rgXML.ItemIndex].Caption  + ' Inv�lido ' + PWideChar(  lPath +  sr.Name ));
                            Continue;
                          end;
                        end;
                        varSQL := '';
                        if varTipoNota = -1 then
                        begin
                           XMLDoc := TXMLDocument.Create(application);
                           Try
                            XMLDoc.XML.Clear;
                            try
                              XMLDoc.LoadFromFile(PastaXML +  sr.Name);
                            except
                                doSaveLog(PastaLOG, 'Arquivo Inv�lido ' +  PWideChar(  PastaXML_LIDO +  sr.Name ));
                                Writeln( 'Arquivo Inv�lido: ' +  PWideChar(  PastaXML_LIDO +  sr.Name ) );
                               // MoveFile( PWideChar(   PastaXML  +  sr.Name ) , PWideChar( PastaXML_LIDO +  sr.Name ) );
                               DeleteFile(PastaXML  +  sr.Name);
                               searchResult := FindNext(sr);
                               Continue;
                            end;
                            XMLDoc.Active := True;
                            Try
                               retEvento := XMLDoc.DocumentElement.ChildNodes.FindNode('retEvento');
                               infEvento := retEvento.ChildNodes.FindNode('infEvento');
                            except
                                 doSaveLog(PastaLOG, 'N� Inv�lido ' +  PWideChar(  PastaXML_LIDO +  sr.Name ));
                                 Writeln( 'N� Invalido: ' +  PWideChar(  PastaXML_LIDO +  sr.Name ) );
                                 DeleteFile(PastaXML  +  sr.Name);
                                 searchResult := FindNext(sr);
                                 Continue;
                            End;

                            with FD_Consulta_EntregaXML do
                            begin
                              Close;
                              SQL.Clear;
                              SQL.Add(' SELECT cCT FROM XML_IMPORTADA  ');
                              SQL.Add(' WHERE cCT  = :cCT ');
                              SQL.Add(' and Numero = :Numero ');
                              SQL.Add(' and Chave = :Chave ');
                              SQL.Add(' and TipoXML = :TipoXML ');

                              ParamByName('cCT').asInteger               := StrToInt(infEvento.ChildNodes['tpEvento'].Text);
                              ParamByName('Numero').AsString             := infEvento.ChildNodes['tpEvento'].Text;
                              ParamByName('Chave').AsString              := infEvento.ChildNodes['chNFe'].Text;
                              ParamByName('TipoXML').AsString            := 'CCE';
                              Open;
                            end;

                            if not FD_Consulta_EntregaXML.IsEmpty then
                            begin
                                   Writeln( 'CCE Existente: ' +  PWideChar(  PastaXML_LIDO +  sr.Name ) );
                                   MoveFile( PWideChar(  PastaXML + sr.Name ) , PWideChar(  PastaXML_LIDO +  sr.Name ) );
                                   searchResult := FindNext(sr);
                                   Inc(X);
                                   bLog := True;

                                   doSaveLog(PastaLOG, 'Existente ' +  PWideChar(  PastaXML_LIDO +  sr.Name ));
                                   Continue;
                            end;


                            varSQL := ' Insert into XML_OUTRAS (xMotivo, chNFe, tpEvento, xEvento, dhRegEvento, nProt) ';
                            varSQL := varSQL +             ' Values ( :xMotivo, :chNFe, :tpEvento, :xEvento, :dhRegEvento, :nProt) ';

                            FD_Insert_EntregaXML.Close;
                            FD_Insert_EntregaXML.SQL.Clear;
                            FD_Insert_EntregaXML.SQL.Add( varSQL );
                            Try
                                FD_Insert_EntregaXML.ParamByName('xMotivo').asString     := infEvento.ChildNodes['xMotivo'].Text;
                                FD_Insert_EntregaXML.ParamByName('chNFe').asString       := infEvento.ChildNodes['chNFe'].Text;
                                FD_Insert_EntregaXML.ParamByName('tpEvento').asString    := infEvento.ChildNodes['tpEvento'].Text;
                                FD_Insert_EntregaXML.ParamByName('xEvento').asString     := infEvento.ChildNodes['xEvento'].Text;
                                FD_Insert_EntregaXML.ParamByName('dhRegEvento').asString := infEvento.ChildNodes['dhRegEvento'].Text;
                                FD_Insert_EntregaXML.ParamByName('nProt').asString       := infEvento.ChildNodes['nProt'].Text;
                            except
                                  Try
                                      infEvento := retEvento.ChildNodes.FindNode('retEnvEvento');
                                      FD_Insert_EntregaXML.ParamByName('xMotivo').asString     := infEvento.ChildNodes['xMotivo'].Text;
                                      FD_Insert_EntregaXML.ParamByName('chNFe').asString       := infEvento.ChildNodes['chNFe'].Text;
                                      FD_Insert_EntregaXML.ParamByName('tpEvento').asString    := infEvento.ChildNodes['tpEvento'].Text;
                                      FD_Insert_EntregaXML.ParamByName('xEvento').asString     := infEvento.ChildNodes['xEvento'].Text;
                                      FD_Insert_EntregaXML.ParamByName('dhRegEvento').asString := infEvento.ChildNodes['dhRegEvento'].Text;
                                      FD_Insert_EntregaXML.ParamByName('nProt').asString       := infEvento.ChildNodes['nProt'].Text;
                                  except
                                      doSaveLog(PastaLOG, 'Arquivo Inv�lido ' +  PWideChar(  PastaXML_LIDO +  sr.Name ));
                                       Writeln( 'Arquivo Invalido II: ' +  PWideChar(  PastaXML_LIDO +  sr.Name ) );
                                      DeleteFile(PastaXML  +  sr.Name);
                                      searchResult := FindNext(sr);
                                      Continue;
                                  End;
                            End;
                            try
                                   FD_Insert_EntregaXML.ExecSQL;
                                  // MoveFile( PWideChar(   PastaXML  +  sr.Name ) , PWideChar( PastaXML_LIDO +  sr.Name ) );


                                   Try
                                     IDENTITY_ID := 0;
                                     varSQL  := 'SELECT @@IDENTITY as XML_CAPA_ID ';

                                     FD_Insert_EntregaXML.Close;
                                     FD_Insert_EntregaXML.SQL.Clear;
                                     FD_Insert_EntregaXML.SQL.Add( varSQL );
                                     FD_Insert_EntregaXML.Open;
                                     IDENTITY_ID := FD_Insert_EntregaXML.FieldByName('XML_CAPA_ID').AsInteger;

                                   except
                                     On E:Exception do
                                       begin
                                          Fr_Dados.FDConnection.RollBack;
                                          bLog := True;
                                          Writeln( 'Falha ao pegar Chave XML_CAPA.: ' +  PWideChar(  PastaXML_LIDO +  sr.Name ) );
                                          doSaveLog(PastaLOG, GetComando(FD_Insert_EntregaXML) + #13#10 + 'Falha ao pegar chave da XML_OUTRAS.' + E.Message);
                                          Continue;
                                        end;
                                   end;

                                    // Guardar Arquivo XML
                                  try
                                    varSQL := 'Insert into XML_IMPORTADA(cCT, XML_CAPA_ID, Numero,Chave,CodUsuario, TipoXML)';
                                    varSQL := varSQL + ' values( :cCT, :XML_CAPA_ID, :Numero,:Chave,:CodUsuario, :TipoXML)';

                                    FD_Insert_EntregaXML.Close;
                                    FD_Insert_EntregaXML.SQL.Clear;
                                    FD_Insert_EntregaXML.SQL.Add( varSQL );

                                    FD_Insert_EntregaXML.ParamByName('cCT').asInteger               := StrToInt(infEvento.ChildNodes['tpEvento'].Text);
                                    FD_Insert_EntregaXML.ParamByName('XML_CAPA_ID').AsInteger       := IDENTITY_ID;
                                    FD_Insert_EntregaXML.ParamByName('Numero').AsString             := infEvento.ChildNodes['tpEvento'].Text;
                                    FD_Insert_EntregaXML.ParamByName('Chave').AsString              := infEvento.ChildNodes['chNFe'].Text;
                                    FD_Insert_EntregaXML.ParamByName('CodUsuario').AsString         := '2';
                                    FD_Insert_EntregaXML.ParamByName('TipoXML').AsString            := 'CCE';

                                  finally

                                    try
                                      FD_Insert_EntregaXML.ExecSQL;
                                      MoveFile( PWideChar(   PastaXML  +  sr.Name ) , PWideChar( PastaXML_LIDO +  sr.Name ) );
                                    except
                                      On E:Exception do
                                        begin
                                          Fr_Dados.FDConnection.RollBack;
                                          bLog := True;
                                          Writeln( 'Falha ao Inserir XML_IMPORTADA: ' + E.Message );
                                          doSaveLog(PastaLOG, GetComando(FD_Insert_EntregaXML) + ' ' +  'Falha ao incluir XML.' + E.Message);
                                        end;
                                    end;

                                  end;




                               except
                                 On E:Exception do
                                   begin
                                    Fr_Dados.FDConnection.RollBack;
                                    bLog := True;
                                    doSaveLog(PastaLOG, GetComando(FD_Insert_EntregaXML) + ' ' +  'Falha ao incluir Outro Tipo de Nota.' + E.Message);
                                    Writeln( 'Falha ao incluir Outro Tipo de Nota: ' +  PWideChar(  PastaXML_LIDO +  sr.Name ) );
                                   end;
                               end;

                           Finally
                              FreeAndNil(XMLDoc);
                           End;

                       //    doSaveLog(PastaLOG, 'Arquivo Inv�lido ' +  PWideChar(  PastaXML_LIDO +  sr.Name ));
                       //    MoveFile( PWideChar(   PastaXML  +  sr.Name ) , PWideChar( PastaXML_LIDO +  sr.Name ) );


                        end;

                        Inc(i);

                        searchResult := FindNext(sr);
                      end;
                      findClose(sr);
             end;

          end;

          finally
           FreeAndNil(Fr_Dados);
          end;

     end;

  Finally
     FreeAndNil(varSMTP);
  End;
end;

procedure FazerIntegracao;
var
  I,  Index, IndexD : Integer;
  varSETON_009: TStringList;
  varSETON_009B: TStringList;
  varMaterial: String;
  varMentered: String;
  varRetornoMagento : Integer;
  Produto, DataI, DataF : ArrayOfString;
  x , y : Integer;
  xProduto , nQtdeAntiga: String;
  ListaCatalogo  : catalogInventoryStockItemEntityArray;
  UpdateCatalogo :  catalogInventoryStockItemUpdateEntity;
  varACBrMail: TACBrMail;
  varMensagem: TStringList;
  varCC: TStringList;
  varNovoSaldo,varDescontar : Double;

  //VarNovoArq :   TStringList;
  //VarPiero : TStringList;

begin

  Writeln('Inicio: ','Integra��o Seton x Magento');

  varSETON_009 := TStringList.Create;
  varSETON_009B := TStringList.Create;
 // VarPiero      := TStringList.Create;
 // VarNovoArq      := TStringList.Create;
  try

     Writeln( 'Abrindo arquivo C:\Brady\Files\SOP\Estoque\BR_ESTOQUE_SETON_009B.txt' );
     varSETON_009B.LoadFromFile( 'C:\Brady\Files\SOP\Estoque\BR_ESTOQUE_SETON_009B.txt' );

     Writeln( 'Abrindo arquivo C:\Brady\Files\SOP\Estoque\BR_ESTOQUE_SETON.TXT' );
     varSETON_009.LoadFromFile( 'C:\Brady\Files\SOP\Estoque\BR_ESTOQUE_SETON.TXT' );

     for I := varSETON_009.Count-1 downto 0 do
       if not (varSETON_009[I].CountChar('|') = 9) then
         varSETON_009.Delete(I);

     Writeln( 'Eliminando Catalogos com Iniciais [789,04,05]' );
     for I := varSETON_009.Count-1 downto 0 do
        if ((varSETON_009[I].Split(['|'])[2].StartsWith('789')) or (varSETON_009[I].Split(['|'])[2].StartsWith('04')) or (varSETON_009[I].Split(['|'])[2].StartsWith('05')))  then
         varSETON_009.Delete(I);

   {
      VarPiero.Add('20072');
      VarPiero.Add('38044');
      VarPiero.Add('99049');
      VarPiero.Add('104342');
      VarPiero.Add('1809A');
      VarPiero.Add('49289A');
      VarPiero.Add('BMP41');
      VarPiero.Add('C0111D');
      VarPiero.Add('C0115D');
      VarPiero.Add('C0150D');
      VarPiero.Add('C0262A');
      VarPiero.Add('C0282A');
      VarPiero.Add('C1126B');
      VarPiero.Add('C1132D');
      VarPiero.Add('C1161D');
      VarPiero.Add('C1162B');
      VarPiero.Add('C1164D');
      VarPiero.Add('C1717');
      VarPiero.Add('C1720');
      VarPiero.Add('C1721B2');
      VarPiero.Add('C1763');
      VarPiero.Add('C1840A');
      VarPiero.Add('C1845D');
      VarPiero.Add('C2489');
      VarPiero.Add('C2641');
      VarPiero.Add('C2712B');
      VarPiero.Add('C2879');
      VarPiero.Add('C2881');
      VarPiero.Add('C2883');
      VarPiero.Add('C2884');
      VarPiero.Add('C3026');
      VarPiero.Add('C4325C');
      VarPiero.Add('C4802B');
      VarPiero.Add('C6106');
      VarPiero.Add('C6247B');
      VarPiero.Add('C6461');
      VarPiero.Add('C6965A');
      VarPiero.Add('C6973A');
      VarPiero.Add('C6975A');
      VarPiero.Add('C7189');
      VarPiero.Add('C7419H');
      VarPiero.Add('C7419I');
      VarPiero.Add('C7419J');
      VarPiero.Add('C7419K');
      VarPiero.Add('M-91-427');



      for I := varSETON_009.Count-1 downto 0 do
      begin
           IndexD := 1;
           SetLength(Produto, 1);
           Produto[0] := varSETON_009[I].Split(['|'])[2].Trim;
           for IndexD := VarPiero.Count- 1 downto 0 do
           begin

             if Pos(Produto[0],VarPiero[IndexD]) > 0 then
             begin
                VarNovoArq.add(varSETON_009[I]);
                VarPiero.Delete(IndexD);
             end;


           end;
      end;

     varSETON_009.Clear;
     varSETON_009 := VarNovoArq;
     }

     I := 0;

     UpdateCatalogo := catalogInventoryStockItemUpdateEntity.Create;
     Try
        while I <= varSETON_009.Count-1 do
        begin
          SetLength(Produto, 1);
          Produto[0] := varSETON_009[I].Split(['|'])[2].Trim;
          Try
             ListaCatalogo := varMagento.catalogInventoryStockItemList( varSessionIDMagento, Produto );

          except
              on e: exception do
                 doSaveLog('C:\Brady\Files\SOP\Estoque\Log\' , 'ERRO; CONSULTAR catalogInventoryStockItemList; CODSETON; ' +
                            varMentered +
                            '; ' + e.Message);

          End;



          Try
           if high(ListaCatalogo) > -1 then
           begin
              Writeln( 'Produto encontra-se cadastrado no Magento: ' + Produto[0] );


             for x := Low(ListaCatalogo)  to  high(ListaCatalogo) do
             begin

              varNovoSaldo := StrToFloat(varSETON_009[I].Split(['|'])[4].Trim.Replace( ',', '', [rfReplaceAll] ).Replace( '.', FormatSettings.DecimalSeparator, [rfReplaceAll] ));
              varDescontar := 0;
              Index        := 1;
              SetLength(Produto, 1);
              Produto[0] := varSETON_009[I].Split(['|'])[1].Trim;
              while Index <= varSETON_009B.Count- 1 do
              begin
                 if Pos(Produto[0],varSETON_009B[Index]) > 0 then
                    varDescontar := varDescontar + StrToFloat(varSETON_009B[Index].Split(['|'])[2].Trim.Replace( ',', '', [rfReplaceAll] ).Replace( '.', FormatSettings.DecimalSeparator, [rfReplaceAll] ));

                 Inc(Index);
              end;

              varNovoSaldo := (varNovoSaldo - varDescontar);

              if varNovoSaldo < 0  then
                 varNovoSaldo := 0.00;


              doSaveLog('C:\Brady\Files\SOP\Estoque\Log\' , ' OK; PRODUTO YNUMBER:  ' + varSETON_009[I].Split(['|'])[1].Trim +
                               ' ;ID: ' + ListaCatalogo[x].product_id +
                               ' ;COD. SETON:  ' + ListaCatalogo[x].sku +
                               ' ;QTDE ATUAL : ' + ListaCatalogo[x].qty +
                               ' ;QTDE ATUALIZADA PARA : ' + FloatToStr(varNovoSaldo));

             end;


             UpdateCatalogo.qty         := FloatToStr(varNovoSaldo); // varUnrestricted;
             UpdateCatalogo.is_in_stock := 1;  // Se passar 0 retira do estoque;

             Try
               varRetornoMagento :=   varMagento.catalogInventoryStockItemUpdate(varSessionIDMagento,
                                                                                 varSETON_009[I].Split(['|'])[2].Trim,
                                                                                 UpdateCatalogo);
               Writeln( 'Produto atualizado com Sucesso -> ' + Produto[0] );
             Except
                on e: exception do
                  doSaveLog('C:\Brady\Files\SOP\Estoque\Log\' ,  'ERRO; UPDATE catalogInventoryStockItemUpdate ; YNUMBER;  ' + varSETON_009[I].Split(['|'])[1].Trim +
                           ' ;ID: ' + ListaCatalogo[x].product_id +
                           ' ;COD. SETON:  ' + ListaCatalogo[x].sku +
                           ' ;ATUALIZADO PARA: ' + ListaCatalogo[x].qty +
                           ' ;' + e.Message);
             End;

           end
           else
                 doSaveLog('C:\Brady\Files\SOP\Estoque\Log\' , 'AVISO; PRODUTO YNUMBER N�O ENCONTRADO NO MAGENTO; ' + varSETON_009[I].Split(['|'])[1].Trim +
                                                      ';CODSETON: ' + varSETON_009[I].Split(['|'])[2].Trim +
                                                      ';QTDE: ' +  FloatToStr(varNovoSaldo));

           Application.ProcessMessages;
         except
           on e: exception do
            doSaveLog('C:\Brady\Files\SOP\Estoque\Log\' , e.Message +  ' Produto: ' + varSETON_009[I].Split(['|'])[2].Trim);
         end;
         Inc(I);

        end;

      Finally
        FreeAndNil(UpdateCatalogo);
      End;

      Writeln( 'Enviando e-mail com relatorio da Integra��o Seton x Magento...' );
      varCC := TStringList.Create;
      varMensagem := TStringList.Create;
      varACBrMail := TACBrMail.Create(nil);
      try

        //varMensagem.Add(MyDocumentsPath+'\'+FSearchRecord.Name);
        varMensagem.Add( 'Relat�tio de Integra��o Seton x Magento' );

        varACBrMail.Clear;
        varACBrMail.Host := 'smtp.gmail.com';
        varACBrMail.Port := '465';
        varACBrMail.SetSSL := True;
        varACBrMail.SetTLS := False;

        varACBrMail.Username := 'suportebrasil@bradycorp.com';
        varACBrMail.Password := 'spUhurebRuF5';

        varACBrMail.From := 'suportebrasil@bradycorp.com';
        varACBrMail.FromName := 'SUPORTE BRASIL';

        Writeln( 'Criando DataModule' );
        Fr_Dados := TFr_Dados.Create(nil);
        try
          with Fr_Dados do
          begin
             FDQueryTSOP_EMAIL.Close;
             FDQueryTSOP_EMAIL.SQL.Clear;
             FDQueryTSOP_EMAIL.SQL.Add('Select TSOP_EMAIL From TSOP_EMAIL where TSOP_ATIVO = ''S'' AND');
             FDQueryTSOP_EMAIL.SQL.Add(' TSOP_PROGRAMA = ''SOP_SETONXMAGENTO''');
             FDQueryTSOP_EMAIL.Open;
             FDQueryTSOP_EMAIL.First;
             while not FDQueryTSOP_EMAIL.eof do
             begin
                varACBrMail.AddAddress(FDQueryTSOP_EMAIL.FieldByName('TSOP_EMAIL').AsString);
                FDQueryTSOP_EMAIL.Next;
             end;
             FDQueryTSOP_EMAIL.Close;
          end;
        finally
           FreeAndNil(Fr_Dados);
        end;

        varACBrMail.Subject := 'RELATORIO INTEGRA��O SETON X MAGENTO ' + FormatDateTime( 'dd/mm/yyyy', Now );
        varACBrMail.IsHTML := True;
        varACBrMail.AltBody.Text := varMensagem.Text;

        varACBrMail.AddAttachment(varArqLogSetonMagento, varArqLogSetonMagento);
        try

          varACBrMail.Send;

        except

          on E: Exception do
          begin

            Writeln( E.Message );

          end;

        end;

      finally

        FreeAndNil(varACBrMail);
        FreeAndNil(varMensagem);
        FreeAndNil(varCC);

      end;

  finally
    FreeAndNil(varSETON_009);
    FreeAndNil(varSETON_009B);
   // FreeAndNil(VarPiero);

  end;

end;

procedure IntegraSetonMagento;
begin
  Writeln( 'Conectando no Web Service Magento...' );
  varMagento           := GetMage_Api_Model_Server_V2_HandlerPortType(False, '', HTTPRIO1);
  varSessionIDMagento  := varMagento.login('sap_user','!user_sap*@32');

  Try
    Writeln( 'Conectado com Sucesso!!!' );
    FazerIntegracao;
  except
    on e: exception do
    begin
      Writeln( 'Erro ao Conectar no Web Service Magento. Veja o arquivo LOG na pasta C:\Brady\Files\SOP\Estoque\' );
      doSaveLog('C:\Brady\Files\SOP\Estoque\Log\', e.Message);
    end;
  end;

end;






function WinExecAndWait32(FileName: String; WorkDir: String; Visibility: integer): integer;
var
   zAppName: array[0..512] of char;
   zCurDir: array[0..255] of char;
   StartupInfo: TStartupInfo;
   ProcessInfo: TProcessInformation;
begin
  StrPCopy(zAppName,FileName);
  StrPCopy(zCurDir,WorkDir);
  FillChar(StartupInfo,Sizeof(StartupInfo),#0);
  StartupInfo.cb:=Sizeof(StartupInfo);
  StartupInfo.dwFlags:=STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow:=Visibility;

  if not CreateProcess(nil,zAppName,nil,nil,False,CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS,nil,zCurDir,StartupInfo,ProcessInfo) then
	 Result:=-1
  else
  begin
	 WaitforSingleObject(ProcessInfo.hProcess,INFINITE);
	 GetExitCodeProcess(ProcessInfo.hProcess,DWORD(Result));
  end;

end;


function ExecutaBAT(comando: string; NomeBat: String): boolean;
var
   txt: TextFile;
   dir: string;
   ret: boolean;
begin
  ret:=False;
  try

	 dir:=ExtractFilePath(Application.ExeName);
	 AssignFile(txt, dir  + NomeBat);
	 Rewrite(txt);
   writeln(txt, '@ECHO OFF');
   writeln(txt, ' ECHO *** Inicializando Brady Data Import. Aguarde... ***');
	 Write(txt,comando);

	 CloseFile(txt);
   //   ShowMessage(dir);
	 if WinExecAndWait32(NomeBat,dir,SW_ShowNormal) = 0 then
		 ret:=True;
	   DeleteFile(dir + NomeBat);
  finally
	  ExecutaBAT := ret;
  end;
end;

procedure RodarGMAutomatico;
const
  VarArquivoBAT : array[1..14] of string = ('CielSapReadTable - BR-ENG-BOM',
                                            'CielSapReadTable - BR-ENG-BOM2',
                                            'CielSapReadTable - BR-ENG-ITEM',
                                            'CielSapReadTable - BR-ENG-ROUTING',
                                            'CielSapReadTable - BR-GM-CUSTO2',
                                            'CielSapReadTable - BR-UOM-001',
                                            'BradyDataImport - ENG - BOM',
                                            'BradyDataImport - ENG - BOM2',
                                            'BradyDataImport - ENG - Item',
                                            'BradyDataImport - ENG - Ordem Producao MPR',
                                            'BradyDataImport - ENG - Ordem Producao',
                                            'BradyDataImport - ENG - Routing',
                                            'BradyDataImport - GM - Import Custos',
                                            'BradyDataImport - GM - Import UOM');
var
//  varComando : string;
  i          : Integer;
  dir        : string;
begin

    dir:=ExtractFilePath(Application.ExeName);
    for i := 1 to High(VarArquivoBAT) do
    begin
        if WinExecAndWait32(VarArquivoBAT[i] + '.bat',dir,SW_ShowNormal) = 0 then
          Writeln ('Arquivo BAT executado  -> ' + VarArquivoBAT[i] + '.bat');
    end;

end;




procedure SendDailySalesMail_OLD( Monthly: Boolean = False );
var
  varACBrNFe: TACBrNFe;
  varACBrMail: TACBrMail;
  varBodyAccOwner, varBodyGrupoCliente, varBodyTotal, varBodyTotal2, varBody, varBody01, varBody02, varBody03, varBody04, varBody05, varBody06, varBody07, varBody08, varBodyAux: TStringList;
  varCC: TStringList;
  varAno: Integer;
  varSite: String;
  varCanal: String;
  varOrigem: String;
  varPercentual, varActual, varForecast, varBilling, varBacklog, varGrossMargin: Extended;
  varPercentualOrigem, varActualOrigem, varForecastOrigem, varBillingOrigem, varBacklogOrigem, varGrossMarginOrigem: Extended;
  varPercentualSite, varActualSite, varForecastSite, varBillingSite, varBacklogSite, varGrossMarginSite: Extended;
  varPercentualCanal, varActualCanal, varForecastCanal, varBillingCanal, varBacklogCanal, varGrossMarginCanal: Extended;
  varPercentualSalesRep, varActualSalesRep, varForecastSalesRep, varBillingSalesRep, varBacklogSalesRep, varGrossMarginSalesRep: Extended;
  varPercentualMANMRO, varActualMANMRO, varForecastMANMRO, varBillingMANMRO, varBacklogMANMRO, varGrossMarginMANMRO: Extended;
  varPercentualTAMMRO, varActualTAMMRO, varForecastTAMMRO, varBillingTAMMRO, varBacklogTAMMRO, varGrossMarginTAMMRO: Extended;
  varPercentualMANPID, varActualMANPID, varForecastMANPID, varBillingMANPID, varBacklogMANPID, varGrossMarginMANPID: Extended;
  varPercentualTAMPID, varActualTAMPID, varForecastTAMPID, varBillingTAMPID, varBacklogTAMPID, varGrossMarginTAMPID: Extended;
  varPercentualMRO, varActualMRO, varForecastMRO, varBillingMRO, varBacklogMRO, varGrossMarginMRO: Extended;
  varPercentualPID_KA, varActualPID_KA, varForecastPID_KA, varBillingPID_KA, varBacklogPID_KA, varGrossMarginPID_KA: Extended;
  varPercentualPID_KAReg, varActualPID_KAReg, varForecastPID_KAReg, varBillingPID_KAReg, varBacklogPID_KAReg, varGrossMarginPID_KAReg: Extended;
  varPercentualPID_Reg, varActualPID_Reg, varForecastPID_Reg, varBillingPID_Reg, varBacklogPID_Reg, varGrossMarginPID_Reg: Extended;
  I: Integer;
  varNow: TDateTime;
  varAssunto: String;

begin

  if Monthly then
    Writeln('Inicio: ','Enviar Monthly Sales EMail')
  else
    Writeln('Inicio: ','Enviar Daily Sales EMail');

  varACBrNFe := TACBrNFe.Create(nil);
  varACBrMail := TACBrMail.Create(nil);
  varACBrNFe.MAIL := varACBrMail;
  varBody := TStringList.Create;
  varBodyTotal := TStringList.Create;
  varBodyTotal2 := TStringList.Create;
  varBodyAccOwner := TStringList.Create;
  varBodyGrupoCliente := TStringList.Create;
  varBody01 := TStringList.Create;
  varBody02 := TStringList.Create;
  varBody03 := TStringList.Create;
  varBody04 := TStringList.Create;
  varBody05 := TStringList.Create;
  varBody06 := TStringList.Create;
  varBody07 := TStringList.Create;
  varBody08 := TStringList.Create;
  varBodyAux := TStringList.Create;
  varCC := TStringList.Create;

  if Monthly then
  begin

    varBody01.LoadFromFile( 'C:\Brady\MonthlySalesMail-01.html' );
    varBody02.LoadFromFile( 'C:\Brady\MonthlySalesMail-02.html' );
    varBody03.LoadFromFile( 'C:\Brady\MonthlySalesMail-03.html' );
    varBody04.LoadFromFile( 'C:\Brady\MonthlySalesMail-04.html' );
    varBody05.LoadFromFile( 'C:\Brady\MonthlySalesMail-05.html' );
    varBody06.LoadFromFile( 'C:\Brady\MonthlySalesMail-06.html' );
    varBody07.LoadFromFile( 'C:\Brady\MonthlySalesMail-07.html' );
    varBody08.LoadFromFile( 'C:\Brady\MonthlySalesMail-08.html' );

  end
  else
  begin

    varBody01.LoadFromFile( 'C:\Brady\DailySalesMail-01.html' );
    varBody02.LoadFromFile( 'C:\Brady\DailySalesMail-02.html' );
    varBody03.LoadFromFile( 'C:\Brady\DailySalesMail-03.html' );
    varBody04.LoadFromFile( 'C:\Brady\DailySalesMail-04.html' );
    varBody05.LoadFromFile( 'C:\Brady\DailySalesMail-05.html' );
    varBody06.LoadFromFile( 'C:\Brady\DailySalesMail-06.html' );
    varBody07.LoadFromFile( 'C:\Brady\DailySalesMail-07.html' );
    varBody08.LoadFromFile( 'C:\Brady\DailySalesMail-08.html' );

  end;

  Writeln( 'Criando DataModule' );
  Fr_Dados := TFr_Dados.Create(nil);
  try

    with Fr_Dados do
    begin


      varAno := YearOf(Now);
      if MonthOf(Now) >= 8 then
        varAno := varAno + 1;

      Writeln('Config FDConnection');
      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );

      Writeln('Open FDConnection');
      FDConnection.Open;
      try

        if Monthly then
        begin

          varNow := System.DateUtils.EndOfTheMonth(System.DateUtils.StartOfTheMonth(Now)-1);

        end
        else
        begin

          varNow := Now;

        end;

        if not ParamStr(2).IsEmpty then
        begin

          varNow := EncodeDate( StrToInt(ParamStr(2).Replace( '-', '' ).Split(['/'])[0]),
                                StrToInt(ParamStr(2).Replace( '-', '' ).Split(['/'])[1]),
                                StrToInt(ParamStr(2).Replace( '-', '' ).Split(['/'])[2]) );

        end;

        FDQuerySalesRep.ParamByName( 'MES_INI' ).AsDateTime := System.DateUtils.StartOfTheMonth(varNow);
        FDQuerySalesRep.ParamByName( 'MES_FIM' ).AsDateTime := System.DateUtils.EndOfTheMonth(varNow);

        if System.DateUtils.MonthOf(varNow) >= 8 then
          FDQuerySalesRep.ParamByName( 'YEARDOC' ).AsInteger := System.DateUtils.YearOf(varNow) + 1
        else
          FDQuerySalesRep.ParamByName( 'YEARDOC' ).AsInteger := System.DateUtils.YearOf(varNow);

        if System.DateUtils.MonthOf(varNow) >= 8 then
          FDQuerySalesRep.ParamByName( 'MONTHDOC' ).AsInteger := System.DateUtils.MonthOf(varNow) - 7
        else
          FDQuerySalesRep.ParamByName( 'MONTHDOC' ).AsInteger := System.DateUtils.MonthOf(varNow) + 5;

        FDQuerySalesRep.Close;
        FDQuerySalesRep.Open;

        varBodyTotal.Clear;

        varActualMANMRO := 0.00;
        varForecastMANMRO := 0.00;
        varBillingMANMRO := 0.00;
        varBacklogMANMRO := 0.00;
        varGrossMarginMANMRO := 0.00;
        varActualTAMMRO := 0.00;
        varForecastTAMMRO := 0.00;
        varBillingTAMMRO := 0.00;
        varBacklogTAMMRO := 0.00;
        varGrossMarginTAMMRO := 0.00;
        varActualMANPID := 0.00;
        varForecastMANPID := 0.00;
        varBillingMANPID := 0.00;
        varBacklogMANPID := 0.00;
        varGrossMarginMANPID := 0.00;
        varActualTAMPID := 0.00;
        varForecastTAMPID := 0.00;
        varBillingTAMPID := 0.00;
        varBacklogTAMPID := 0.00;
        varGrossMarginTAMPID := 0.00;
        varActualMRO := 0.00;
        varForecastMRO := 0.00;
        varBillingMRO := 0.00;
        varBacklogMRO := 0.00;
        varGrossMarginMRO := 0.00;
        varActualPID_KA := 0.00;
        varForecastPID_KA := 0.00;
        varBillingPID_KA := 0.00;
        varBacklogPID_KA := 0.00;
        varGrossMarginPID_KA := 0.00;
        varActualPID_KAReg := 0.00;
        varForecastPID_KAReg := 0.00;
        varBillingPID_KAReg := 0.00;
        varBacklogPID_KAReg := 0.00;
        varGrossMarginPID_KAReg := 0.00;
        varActualPID_Reg := 0.00;
        varForecastPID_Reg := 0.00;
        varBillingPID_Reg := 0.00;
        varBacklogPID_Reg := 0.00;
        varGrossMarginPID_Reg := 0.00;

        while not FDQuerySalesRep.Eof do
        begin

          Writeln('Set FDQuery');
          FDQueryVSOP_OrderBillingPedidos.ParamByName( 'MES_INI' ).AsDateTime := System.DateUtils.StartOfTheMonth(varNow);
          FDQueryVSOP_OrderBillingPedidos.ParamByName( 'MES_FIM' ).AsDateTime := System.DateUtils.EndOfTheMonth(varNow);
          FDQueryVSOP_OrderBillingPedidos.ParamByName( 'MES_ANT' ).AsDateTime := System.DateUtils.StartOfTheMonth(System.DateUtils.StartOfTheMonth(varNow)-1);
          FDQueryVSOP_OrderBillingPedidos.ParamByName( 'SALESREP' ).AsString := FDQuerySalesRepTSIS_USUNOM.AsString;

          if System.DateUtils.MonthOf(varNow) >= 8 then
            FDQueryVSOP_OrderBillingPedidos.ParamByName( 'YEARDOC' ).AsInteger := System.DateUtils.YearOf(varNow) + 1
          else
            FDQueryVSOP_OrderBillingPedidos.ParamByName( 'YEARDOC' ).AsInteger := System.DateUtils.YearOf(varNow);

          if System.DateUtils.MonthOf(varNow) >= 8 then
            FDQueryVSOP_OrderBillingPedidos.ParamByName( 'MONTHDOC' ).AsInteger := System.DateUtils.MonthOf(varNow) - 7
          else
            FDQueryVSOP_OrderBillingPedidos.ParamByName( 'MONTHDOC' ).AsInteger := System.DateUtils.MonthOf(varNow) + 5;

          if FDQuerySalesRepTSIS_USUNOM.AsString.Trim.IsEmpty or FDQuerySalesRepTSIS_USUNOM.AsString.Trim.Equals('N/A') or FDQuerySalesRepTSIS_USUNOM.AsString.Trim.Equals('INTERCOMPANY') then
            FDQueryVSOP_OrderBillingPedidos.MacroByName( 'WHERE1' ).AsRaw := 'AND (B01.TSOP_ORDBILREPNOM = ' + QuotedStr(FDQuerySalesRepTSIS_USUNOM.AsString) + ')'
          else
            FDQueryVSOP_OrderBillingPedidos.MacroByName( 'WHERE1' ).AsRaw := 'AND (B01.TSOP_ORDBILREPNOM = ' + QuotedStr(FDQuerySalesRepTSIS_USUNOM.AsString) + ' OR B01.TSOP_REPMKT = ' + QuotedStr(FDQuerySalesRepTSIS_USUNOM.AsString) + ' OR B01.TSOP_REPNOMINT = ' + QuotedStr(FDQuerySalesRepTSIS_USUNOM.AsString) + ')';

          Writeln('Open FDQuery');
          FDQueryVSOP_OrderBillingPedidos.Close;
          FDQueryVSOP_OrderBillingPedidos.Open;

          while not FDQueryVSOP_OrderBillingPedidos.Eof do
          begin

            varBody.Clear;

            varActualSalesRep := 0.00;
            varForecastSalesRep := 0.00;
            varBillingSalesRep := 0.00;
            varBacklogSalesRep := 0.00;
            varGrossMarginSalesRep := 0.00;

            varBody.Add( varBody01.Text.Replace('%FY%', FDQueryVSOP_OrderBillingPedidosTSOP_ORDBILDAT.AsString ).Replace( '%SalesRep%', FDQuerySalesRepTSIS_USUNOM.AsString.ToUpper.Trim ) );

            while not FDQueryVSOP_OrderBillingPedidos.Eof do
            begin

              varSite := FDQueryVSOP_OrderBillingPedidosTSOP_ORDBILSITNOM.AsString.ToUpper.Trim;

              varActualSite := 0.00;
              varForecastSite := 0.00;
              varBillingSite := 0.00;
              varBacklogSite := 0.00;
              varGrossMarginSite := 0.00;

              varBody.Add( varBody06.Text.Replace( '%Site%', FDQueryVSOP_OrderBillingPedidosTSOP_ORDBILSITNOM.AsString.ToUpper.Trim ) );

              while not FDQueryVSOP_OrderBillingPedidos.Eof do
              begin

                varCanal := FDQueryVSOP_OrderBillingPedidosTSOP_ORDBILCANNOM.AsString;

                varActualCanal := 0.00;
                varForecastCanal := 0.00;
                varBillingCanal := 0.00;
                varBacklogCanal := 0.00;
                varGrossMarginCanal := 0.00;

                varBody.Add( varBody02.Text.Replace( '%Canal%', FDQueryVSOP_OrderBillingPedidosTSOP_ORDBILCANNOM.AsString ) );

                while not FDQueryVSOP_OrderBillingPedidos.Eof do
                begin

                  varOrigem := FDQueryVSOP_OrderBillingPedidosTSOP_ORDBILORI.AsString;

                  varActualOrigem := 0.00;
                  varForecastOrigem := 0.00;
                  varBillingOrigem := 0.00;
                  varBacklogOrigem := 0.00;
                  varGrossMarginOrigem := 0.00;

                  varBody.Add( varBody05.Text.Replace( '%Origem%', FDQueryVSOP_OrderBillingPedidosTSOP_ORDBILORI.AsString ) );

                  while not FDQueryVSOP_OrderBillingPedidos.Eof do
                  begin

                    varActual := FDQueryVSOP_OrderBillingPedidosTSOP_ORDBILVALLIQ.AsFloat;
                    FDQueryVSOP_OrderBillingPedidos.Next;
                    varBacklog := FDQueryVSOP_OrderBillingPedidosTSOP_ORDBILVALLIQ.AsFloat;
                    FDQueryVSOP_OrderBillingPedidos.Next;
                    varBilling := FDQueryVSOP_OrderBillingPedidosTSOP_ORDBILVALLIQ.AsFloat;
                    FDQueryVSOP_OrderBillingPedidos.Next;
                    varGrossMargin := FDQueryVSOP_OrderBillingPedidosTSOP_ORDBILVALLIQ.AsFloat;
                    FDQueryVSOP_OrderBillingPedidos.Next;
                    varForecast := FDQueryVSOP_OrderBillingPedidosTSOP_ORDBILVALLIQ.AsFloat;
                    if varForecast = 0.00 then
                      varPercentual := 0.00
                    else
                      varPercentual := varActual/varForecast*100.00;

                    if (varActual <> 0.00) or (varBacklog <> 0.00) or (varGrossMargin <> 0.00) or (varBilling <> 0.00) or (varForecast <> 0.00) then
                    begin

                      varBodyAux.Add( '<!-- ' + FormatFloat( '0,000,000.00', (varActual-varForecast)+1000000 ) + ' -->' + varBody03.Text.Replace( '%GrupoCliente%', FDQueryVSOP_OrderBillingPedidosTSOP_ORDBILGRUCLINOM.AsString ).Replace( '%act-tot%', FormatFloat('#,##0', varActual) ).Replace( '%back-tot%', FormatFloat('#,##0', varBacklog) ).Replace( '%gm-tot%', FormatFloat('#,##0', varGrossMargin) ).Replace( '%bill-tot%', FormatFloat('#,##0', varBilling) ).Replace( '%fct-tot%', FormatFloat('#,##0', varForecast) ).Replace( '%act-fct%', FormatFloat('#,##0', varActual-varForecast) ).Replace( '%act/fct%', FormatFloat('#,##0', varPercentual)+'%' ) );

                      if varCanal.ToUpper.Trim.Equals('DISTRIBUTORS') then
                      begin

                        varActualMRO := varActualMRO + varActual;
                        varBacklogMRO := varBacklogMRO + varBacklog;
                        varGrossMarginMRO := varGrossMarginMRO + varGrossMargin;
                        varBillingMRO := varBillingMRO + varBilling;
                        varForecastMRO := varForecastMRO + varForecast;

                        if varOrigem.ToUpper.Trim.Equals( 'ACC OWNER' ) then
                        begin

                          if varSite.ToUpper.Trim.Equals('MANAUS') then
                          begin

                            varActualMANMRO := varActualMANMRO + varActual;
                            varBacklogMANMRO := varBacklogMANMRO + varBacklog;
                            varGrossMarginMANMRO := varGrossMarginMANMRO + varGrossMargin;
                            varBillingMANMRO := varBillingMANMRO + varBilling;
                            varForecastMANMRO := varForecastMANMRO + varForecast;

                          end
                          else
                          begin

                            varActualTAMMRO := varActualTAMMRO + varActual;
                            varBacklogTAMMRO := varBacklogTAMMRO + varBacklog;
                            varGrossMarginTAMMRO := varGrossMarginTAMMRO + varGrossMargin;
                            varBillingTAMMRO := varBillingTAMMRO + varBilling;
                            varForecastTAMMRO := varForecastTAMMRO + varForecast;

                          end;

                        end;

                      end
                      else
                      if varCanal.ToUpper.Trim.Equals('PID') then
                      begin

                        if varOrigem.ToUpper.Trim.Equals( 'ACC OWNER' ) then
                        begin

                          if (FDQuerySalesRepTSIS_USUNOM.AsString.ToUpper.Trim.Equals( 'HERIVELTO FELIPPI' ) or
                              FDQuerySalesRepTSIS_USUNOM.AsString.ToUpper.Trim.Equals( 'GUILHERME COUTO' ) or
                              FDQuerySalesRepTSIS_USUNOM.AsString.ToUpper.Trim.Equals( 'ERIC FURUYA' )) then
                          begin

                            varActualPID_KA := varActualPID_KA + varActual;
                            varBacklogPID_KA := varBacklogPID_KA + varBacklog;
                            varGrossMarginPID_KA := varGrossMarginPID_KA + varGrossMargin;
                            varBillingPID_KA := varBillingPID_KA + varBilling;
                            varForecastPID_KA := varForecastPID_KA + varForecast;

                          end
                          else
                          begin

                            varActualPID_Reg := varActualPID_Reg + varActual;
                            varBacklogPID_Reg := varBacklogPID_Reg + varBacklog;
                            varGrossMarginPID_Reg := varGrossMarginPID_Reg + varGrossMargin;
                            varBillingPID_Reg := varBillingPID_Reg + varBilling;
                            varForecastPID_Reg := varForecastPID_Reg + varForecast;

                          end;

                        end
                        else
                        if varOrigem.ToUpper.Trim.Equals( 'REGION OWNER' ) then
                        begin

                          varActualPID_KAReg := varActualPID_KAReg + varActual;
                          varBacklogPID_KAReg := varBacklogPID_KAReg + varBacklog;
                          varGrossMarginPID_KAReg := varGrossMarginPID_KAReg + varGrossMargin;
                          varBillingPID_KAReg := varBillingPID_KAReg + varBilling;
                          varForecastPID_KAReg := varForecastPID_KAReg + varForecast;

                        end;

                        if varOrigem.ToUpper.Trim.Equals( 'ACC OWNER' ) then
                        begin

                          if varSite.ToUpper.Trim.Equals('MANAUS') then
                          begin

                            varActualMANPID := varActualMANPID + varActual;
                            varBacklogMANPID := varBacklogMANPID + varBacklog;
                            varGrossMarginMANPID := varGrossMarginMANPID + varGrossMargin;
                            varBillingMANPID := varBillingMANPID + varBilling;
                            varForecastMANPID := varForecastMANPID + varForecast;

                          end
                          else
                          begin

                            varActualTAMPID := varActualTAMPID + varActual;
                            varBacklogTAMPID := varBacklogTAMPID + varBacklog;
                            varGrossMarginTAMPID := varGrossMarginTAMPID + varGrossMargin;
                            varBillingTAMPID := varBillingTAMPID + varBilling;
                            varForecastTAMPID := varForecastTAMPID + varForecast;

                          end;

                        end;

                      end;

                    end;

                    varActualOrigem := varActualOrigem + varActual;
                    varBacklogOrigem := varBacklogOrigem + varBacklog;
                    varGrossMarginOrigem := varGrossMarginOrigem + varGrossMargin;
                    varBillingOrigem := varBillingOrigem + varBilling;
                    varForecastOrigem := varForecastOrigem + varForecast;

                    varActualCanal := varActualCanal + varActual;
                    varBacklogCanal := varBacklogCanal + varBacklog;
                    varGrossMarginCanal := varGrossMarginCanal + varGrossMargin;
                    varBillingCanal := varBillingCanal + varBilling;
                    varForecastCanal := varForecastCanal + varForecast;

                    varActualSite := varActualSite + varActual;
                    varBacklogSite := varBacklogSite + varBacklog;
                    varGrossMarginSite := varGrossMarginSite + varGrossMargin;
                    varBillingSite := varBillingSite + varBilling;
                    varForecastSite := varForecastSite + varForecast;

                    varActualSalesRep := varActualSalesRep + varActual;
                    varBacklogSalesRep := varBacklogSalesRep + varBacklog;
                    varGrossMarginSalesRep := varGrossMarginSalesRep + varGrossMargin;
                    varBillingSalesRep := varBillingSalesRep + varBilling;
                    varForecastSalesRep := varForecastSalesRep + varForecast;

                    FDQueryVSOP_OrderBillingPedidos.Next;

                    if varOrigem <> FDQueryVSOP_OrderBillingPedidosTSOP_ORDBILORI.AsString then
                      Break;

                    if varCanal <> FDQueryVSOP_OrderBillingPedidosTSOP_ORDBILCANNOM.AsString then
                      Break;

                    if varSite <> FDQueryVSOP_OrderBillingPedidosTSOP_ORDBILSITNOM.AsString.ToUpper.Trim then
                      Break;

                  end;

                  if varBodyAux.Count = 0 then
                      varBody.Delete(varBody.Count-1);

                  varBodyAux.Sort;
                  varBody.AddStrings(varBodyAux);
                  varBodyAux.Clear;

                  if varForecastOrigem = 0.00 then
                    varPercentualOrigem := 0.00
                  else
                    varPercentualOrigem := varActualOrigem/varForecastOrigem*100.00;

                  varBody.Text := varBody.Text.Replace( '%back-tot-origem%', FormatFloat('#,##0', varBacklogOrigem) ).Replace( '%gm-tot-origem%', FormatFloat('#,##0', varGrossMarginOrigem) ).Replace( '%bill-tot-origem%', FormatFloat('#,##0', varBillingOrigem) ).Replace( '%act-tot-origem%', FormatFloat('#,##0', varActualOrigem) ).Replace( '%fct-tot-origem%', FormatFloat('#,##0', varForecastOrigem) ).Replace( '%act-fct-origem%', FormatFloat('#,##0', varActualOrigem-varForecastOrigem) ).Replace( '%act/fct-origem%', FormatFloat('#,##0', varPercentualOrigem)+'%' );

                  if varCanal <> FDQueryVSOP_OrderBillingPedidosTSOP_ORDBILCANNOM.AsString then
                    Break;

                  if varSite <> FDQueryVSOP_OrderBillingPedidosTSOP_ORDBILSITNOM.AsString.ToUpper.Trim then
                    Break;

                end;

                if varForecastCanal = 0.00 then
                  varPercentualCanal := 0.00
                else
                  varPercentualCanal := varActualCanal/varForecastCanal*100.00;

                if (varForecastCanal+varPercentualCanal+varActualCanal) = 0.00 then
                    varBody.Delete(varBody.Count-1);

                varBody.Text := varBody.Text.Replace( '%back-tot-canal%', FormatFloat('#,##0', varBacklogCanal) ).Replace( '%gm-tot-canal%', FormatFloat('#,##0', varGrossMarginCanal) ).Replace( '%bill-tot-canal%', FormatFloat('#,##0', varBillingCanal) ).Replace( '%act-tot-canal%', FormatFloat('#,##0', varActualCanal) ).Replace( '%fct-tot-canal%', FormatFloat('#,##0', varForecastCanal) ).Replace( '%act-fct-canal%', FormatFloat('#,##0', varActualCanal-varForecastCanal) ).Replace( '%act/fct-canal%', FormatFloat('#,##0', varPercentualCanal)+'%' );

                if varSite <> FDQueryVSOP_OrderBillingPedidosTSOP_ORDBILSITNOM.AsString.ToUpper.Trim then
                  Break;

              end;

              if varForecastSite = 0.00 then
                varPercentualSite := 0.00
              else
                varPercentualSite := varActualSite/varForecastSite*100.00;

              if (varForecastSite+varPercentualSite+varActualSite) = 0.00 then
                  varBody.Delete(varBody.Count-1);

              varBody.Text := varBody.Text.Replace( '%back-tot-site%', FormatFloat('#,##0', varBacklogSite) ).Replace( '%gm-tot-site%', FormatFloat('#,##0', varGrossMarginSite) ).Replace( '%bill-tot-site%', FormatFloat('#,##0', varBillingSite) ).Replace( '%act-tot-site%', FormatFloat('#,##0', varActualSite) ).Replace( '%fct-tot-site%', FormatFloat('#,##0', varForecastSite) ).Replace( '%act-fct-site%', FormatFloat('#,##0', varActualSite-varForecastSite) ).Replace( '%act/fct-site%', FormatFloat('#,##0', varPercentualSite)+'%' );

            end;

            if varForecastSalesRep = 0.00 then
              varPercentualSalesRep := 0.00
            else
              varPercentualSalesRep := varActualSalesRep/varForecastSalesRep*100.00;

            varBody.Text := varBody.Text.Replace( '%back-tot-salesrep%', FormatFloat('#,##0', varBacklogSalesRep) ).Replace( '%gm-tot-salesrep%', FormatFloat('#,##0', varGrossMarginSalesRep) ).Replace( '%bill-tot-salesrep%', FormatFloat('#,##0', varBillingSalesRep) ).Replace( '%act-tot-salesrep%', FormatFloat('#,##0', varActualSalesRep) ).Replace( '%fct-tot-salesrep%', FormatFloat('#,##0', varForecastSalesRep) ).Replace( '%act-fct-salesrep%', FormatFloat('#,##0', varActualSalesRep-varForecastSalesRep) ).Replace( '%act/fct-salesrep%', FormatFloat('#,##0', varPercentualSalesRep)+'%' );

            varBody.Add( varBody04.Text );

            varBodyTotal.Add( varBody.Text );

            if Monthly then
              varAssunto := 'Monthly S&OP - ' + FormatDateTime('mmmm yyyy', varNow) + ' - ' + FDQuerySalesRepTSIS_USUNOM.AsString
            else
              varAssunto := 'Daily S&OP - ' + FDQuerySalesRepTSIS_USUNOM.AsString;

            Writeln('Enviando Email: ' + varAssunto);

            varACBrMail.Clear;
            varACBrMail.Host := 'SMTP.GMAIL.COM';
            varACBrMail.Port := '465';
            varACBrMail.SetSSL := True;
            varACBrMail.SetTLS := False;

            varACBrMail.Username := 'suportebrasil@bradycorp.com';
            varACBrMail.Password := 'spUhurebRuF5';
            varACBrMail.From := 'suportebrasil@bradycorp.com';
            varACBrMail.FromName := 'Suporte Brasil';

           // varACBrMail.AddAddress(FDQuerySalesRepTSIS_USUEML.AsString, FDQuerySalesRepTSIS_USUNOM.AsString);
            varACBrMail.AddAddress('marcos.jesus.external@k2partnering.com', 'Marcos');
            varACBrMail.AddAddress('LUCIANA_PONTIERI@BRADYCORP.com', 'Luciana');

            varACBrMail.Subject := varAssunto;
            varACBrMail.IsHTML := True;
            varACBrMail.Body.Assign(varBody);

            try

              varACBrMail.Send;

            except

              on E: Exception do
              begin

                Writeln( E.Message );

              end;

            end;

          end;

          FDQuerySalesRep.Next;

        end;

        varBodyTotal2.Clear;
        varBodyTotal2.AddStrings(varBodyTotal);
        varBodyTotal.Clear;

        varBodyTotal.Add( varBody08.Text.Replace('%FY%', FDQueryVSOP_OrderBillingPedidosTSOP_ORDBILDAT.AsString ) );

        if varForecastMANMRO = 0.00 then
          varPercentualMANMRO := 0.00
        else
          varPercentualMANMRO := varActualMANMRO/varForecastMANMRO*100.00;

        varBodyTotal.Add( varBody07.Text.Replace( '%Geral%', 'MANAUS - MRO' ) );
        varBodyTotal.Text := varBodyTotal.Text.Replace( '%back-tot-geral%', FormatFloat('#,##0', varBacklogMANMRO) ).Replace( '%gm-tot-geral%', FormatFloat('#,##0', varGrossMarginMANMRO) ).Replace( '%bill-tot-geral%', FormatFloat('#,##0', varBillingMANMRO) ).Replace( '%act-tot-geral%', FormatFloat('#,##0', varActualMANMRO) ).Replace( '%fct-tot-geral%', FormatFloat('#,##0', varForecastMANMRO) ).Replace( '%act-fct-geral%', FormatFloat('#,##0', varActualMANMRO-varForecastMANMRO) ).Replace( '%act/fct-geral%', FormatFloat('#,##0', varPercentualMANMRO)+'%' );

        if varForecastTAMMRO = 0.00 then
          varPercentualTAMMRO := 0.00
        else
          varPercentualTAMMRO := varActualTAMMRO/varForecastTAMMRO*100.00;

        varBodyTotal.Add( varBody07.Text.Replace( '%Geral%', 'TAMBOR� - MRO' ) );
        varBodyTotal.Text := varBodyTotal.Text.Replace( '%back-tot-geral%', FormatFloat('#,##0', varBacklogTAMMRO) ).Replace( '%gm-tot-geral%', FormatFloat('#,##0', varGrossMarginTAMMRO) ).Replace( '%bill-tot-geral%', FormatFloat('#,##0', varBillingTAMMRO) ).Replace( '%act-tot-geral%', FormatFloat('#,##0', varActualTAMMRO) ).Replace( '%fct-tot-geral%', FormatFloat('#,##0', varForecastTAMMRO) ).Replace( '%act-fct-geral%', FormatFloat('#,##0', varActualTAMMRO-varForecastTAMMRO) ).Replace( '%act/fct-geral%', FormatFloat('#,##0', varPercentualTAMMRO)+'%' );

        if varForecastMANPID = 0.00 then
          varPercentualMANPID := 0.00
        else
          varPercentualMANPID := varActualMANPID/varForecastMANPID*100.00;

        varBodyTotal.Add( varBody07.Text.Replace( '%Geral%', 'MANAUS - PID' ) );
        varBodyTotal.Text := varBodyTotal.Text.Replace( '%back-tot-geral%', FormatFloat('#,##0', varBacklogMANPID) ).Replace( '%gm-tot-geral%', FormatFloat('#,##0', varGrossMarginMANPID) ).Replace( '%bill-tot-geral%', FormatFloat('#,##0', varBillingMANPID) ).Replace( '%act-tot-geral%', FormatFloat('#,##0', varActualMANPID) ).Replace( '%fct-tot-geral%', FormatFloat('#,##0', varForecastMANPID) ).Replace( '%act-fct-geral%', FormatFloat('#,##0', varActualMANPID-varForecastMANPID) ).Replace( '%act/fct-geral%', FormatFloat('#,##0', varPercentualMANPID)+'%' );

        if varForecastTAMPID = 0.00 then
          varPercentualTAMPID := 0.00
        else
          varPercentualTAMPID := varActualTAMPID/varForecastTAMPID*100.00;

        varBodyTotal.Add( varBody07.Text.Replace( '%Geral%', 'TAMBOR� - PID' ) );
        varBodyTotal.Text := varBodyTotal.Text.Replace( '%back-tot-geral%', FormatFloat('#,##0', varBacklogTAMPID) ).Replace( '%gm-tot-geral%', FormatFloat('#,##0', varGrossMarginTAMPID) ).Replace( '%bill-tot-geral%', FormatFloat('#,##0', varBillingTAMPID) ).Replace( '%act-tot-geral%', FormatFloat('#,##0', varActualTAMPID) ).Replace( '%fct-tot-geral%', FormatFloat('#,##0', varForecastTAMPID) ).Replace( '%act-fct-geral%', FormatFloat('#,##0', varActualTAMPID-varForecastTAMPID) ).Replace( '%act/fct-geral%', FormatFloat('#,##0', varPercentualTAMPID)+'%' );

        if varForecastMRO = 0.00 then
          varPercentualMRO := 0.00
        else
          varPercentualMRO := varActualMRO/varForecastMRO*100.00;

        varBodyTotal.Add( varBody07.Text.Replace( '%Geral%', 'MRO' ) );
        varBodyTotal.Text := varBodyTotal.Text.Replace( '%back-tot-geral%', FormatFloat('#,##0', varBacklogMRO) ).Replace( '%gm-tot-geral%', FormatFloat('#,##0', varGrossMarginMRO) ).Replace( '%bill-tot-geral%', FormatFloat('#,##0', varBillingMRO) ).Replace( '%act-tot-geral%', FormatFloat('#,##0', varActualMRO) ).Replace( '%fct-tot-geral%', FormatFloat('#,##0', varForecastMRO) ).Replace( '%act-fct-geral%', FormatFloat('#,##0', varActualMRO-varForecastMRO) ).Replace( '%act/fct-geral%', FormatFloat('#,##0', varPercentualMRO)+'%' );

        if varForecastPID_KA = 0.00 then
          varPercentualPID_KA := 0.00
        else
          varPercentualPID_KA := varActualPID_KA/varForecastPID_KA*100.00;

        varBodyTotal.Add( varBody07.Text.Replace( '%Geral%', 'PID - KA' ) );
        varBodyTotal.Text := varBodyTotal.Text.Replace( '%back-tot-geral%', FormatFloat('#,##0', varBacklogPID_KA) ).Replace( '%gm-tot-geral%', FormatFloat('#,##0', varGrossMarginPID_KA) ).Replace( '%bill-tot-geral%', FormatFloat('#,##0', varBillingPID_KA) ).Replace( '%act-tot-geral%', FormatFloat('#,##0', varActualPID_KA) ).Replace( '%fct-tot-geral%', FormatFloat('#,##0', varForecastPID_KA) ).Replace( '%act-fct-geral%', FormatFloat('#,##0', varActualPID_KA-varForecastPID_KA) ).Replace( '%act/fct-geral%', FormatFloat('#,##0', varPercentualPID_KA)+'%' );

        if varForecastPID_KAReg = 0.00 then
          varPercentualPID_KAReg := 0.00
        else
          varPercentualPID_KAReg := varActualPID_KAReg/varForecastPID_KAReg*100.00;

        varBodyTotal.Add( varBody07.Text.Replace( '%Geral%', 'PID - KA & Regions' ) );
        varBodyTotal.Text := varBodyTotal.Text.Replace( '%back-tot-geral%', FormatFloat('#,##0', varBacklogPID_KAReg) ).Replace( '%gm-tot-geral%', FormatFloat('#,##0', varGrossMarginPID_KAReg) ).Replace( '%bill-tot-geral%', FormatFloat('#,##0', varBillingPID_KAReg) ).Replace( '%act-tot-geral%', FormatFloat('#,##0', varActualPID_KAReg) ).Replace( '%fct-tot-geral%', FormatFloat('#,##0', varForecastPID_KAReg) ).Replace( '%act-fct-geral%', FormatFloat('#,##0', varActualPID_KAReg-varForecastPID_KAReg) ).Replace( '%act/fct-geral%', FormatFloat('#,##0', varPercentualPID_KAReg)+'%' );

        if varForecastPID_Reg = 0.00 then
          varPercentualPID_Reg := 0.00
        else
          varPercentualPID_Reg := varActualPID_Reg/varForecastPID_Reg*100.00;

        varBodyTotal.Add( varBody07.Text.Replace( '%Geral%', 'PID - Regions' ) );
        varBodyTotal.Text := varBodyTotal.Text.Replace( '%back-tot-geral%', FormatFloat('#,##0', varBacklogPID_Reg) ).Replace( '%gm-tot-geral%', FormatFloat('#,##0', varGrossMarginPID_Reg) ).Replace( '%bill-tot-geral%', FormatFloat('#,##0', varBillingPID_Reg) ).Replace( '%act-tot-geral%', FormatFloat('#,##0', varActualPID_Reg) ).Replace( '%fct-tot-geral%', FormatFloat('#,##0', varForecastPID_Reg) ).Replace( '%act-fct-geral%', FormatFloat('#,##0', varActualPID_Reg-varForecastPID_Reg) ).Replace( '%act/fct-geral%', FormatFloat('#,##0', varPercentualPID_Reg)+'%' );

        varBodyTotal.Add( varBody04.Text );

        varBodyTotal.AddStrings(varBodyTotal2);

        varCC.Clear;

        if Monthly then
          varAssunto := 'Monthly S&OP - ' + FormatDateTime( 'mmmm yyyy', varNow )
        else
          varAssunto := 'Daily S&OP';

        Writeln('Enviando Email: ' + varAssunto);

        varACBrMail.Clear;
        varACBrMail.Host := 'SMTP.GMAIL.COM';
        varACBrMail.Port := '465';
        varACBrMail.SetSSL := True;
        varACBrMail.SetTLS := False;

        varACBrMail.Username := 'suportebrasil@bradycorp.com';
        varACBrMail.Password := 'spUhurebRuF5';

        varACBrMail.From := 'suportebrasil@bradycorp.com';
        varACBrMail.FromName := 'Suporte Brasil';

//        varACBrMail.AddAddress( 'suportebrasil@bradycorp.com', 'Suporte Brasil' );
     //   varACBrMail.AddAddress('EMERSON_ZAIDAN@BRADYCORP.COM');
     //   varACBrMail.AddAddress('CINTIA_SANTOS@BRADYCORP.COM');
     //   varACBrMail.AddAddress('MARCIO_TANADA@BRADYCORP.COM');
      //  varACBrMail.AddAddress('LILIAN_IWATA@BRADYCORP.COM');
       // varACBrMail.AddAddress('GUSTAVO_COUTINHO@BRADYCORP.COM');
      //  varACBrMail.AddAddress('LUIZ_FOLONI@BRADYCORP.COM');
      //  varACBrMail.AddAddress('LEANDRO_LOPES@BRADYCORP.COM');

        varACBrMail.AddAddress('marcos.jesus.external@k2partnering.com', 'Marcos');
        varACBrMail.AddAddress('LUCIANA_PONTIERI@BRADYCORP.com', 'Luciana');

        varACBrMail.Subject := varAssunto;
        varACBrMail.IsHTML := True;
        varACBrMail.Body.Assign(varBodyTotal);

        try

          varACBrMail.Send;

        except

          on E: Exception do
          begin

            Writeln( E.Message );

          end;

        end;

        varBody01.LoadFromFile( 'C:\Brady\AccOwner-01.html' );
        varBody02.LoadFromFile( 'C:\Brady\AccOwner-02.html' );
        varBody03.LoadFromFile( 'C:\Brady\AccOwner-03.html' );

        varBodyAccOwner.Clear;
        varBodyAccOwner.AddStrings( varBody01 );
        FDQueryAccOwner.Open;
        try

          while not FDQueryAccOwner.Eof do
          begin

            varBodyAccOwner.Add( varBody02.Text.Replace( '%codigo%', FDQueryAccOwnerTSOP_ORDBILCLICOD.AsString ).Replace( '%cliente%', FDQueryAccOwnerTSOP_ORDBILCLINOM.AsString ) );

            FDQueryAccOwner.Next;

          end;

          varBodyAccOwner.AddStrings( varBody03 );

          varCC.Clear;

          if DayOfTheWeek(Now) = DayFriday then
          begin

            varACBrMail.Clear;
            varACBrMail.Host := 'SMTP.GMAIL.COM';
            varACBrMail.Port := '465';
            varACBrMail.SetSSL := True;
            varACBrMail.SetTLS := False;

            varACBrMail.Username := 'suportebrasil@bradycorp.com';
            varACBrMail.Password := 'Rsp1984#$%asd';

            varACBrMail.From := 'suportebrasil@bradycorp.com';
            varACBrMail.FromName := 'Suporte Brasil';

//            varACBrMail.AddAddress( 'suportebrasil@bradycorp.com', 'Suporte Brasil' );
            varACBrMail.AddAddress('EMERSON_ZAIDAN@BRADYCORP.COM');
            varACBrMail.AddAddress('MARCIO_TANADA@BRADYCORP.COM');
            varACBrMail.AddAddress('LILIAN_IWATA@BRADYCORP.COM');
            varACBrMail.AddAddress('LEANDRO_LOPES@BRADYCORP.COM');
            varACBrMail.AddAddress('LUCIANA_PONTIERI@BRADYCORP.COM');

            varACBrMail.Subject := 'S&OP - SEM REPRESENTANTE';
            varACBrMail.IsHTML := True;
            varACBrMail.Body.Assign(varBodyAccOwner);

            Writeln('Enviando Email: S&OP - SEM REPRESENTANTE');
            try

              varACBrMail.Send;

            except

              on E: Exception do
              begin

                Writeln( E.Message );

              end;

            end;

          end;

        finally

          FDQueryAccOwner.Close;

        end;

        varBody01.LoadFromFile( 'C:\Brady\AccOwner-01.html' );
        varBody02.LoadFromFile( 'C:\Brady\AccOwner-02.html' );
        varBody03.LoadFromFile( 'C:\Brady\AccOwner-03.html' );

        varBodyGrupoCliente.Clear;
        varBodyGrupoCliente.AddStrings( varBody01 );
        FDQueryGrupoCliente.Open;
        try

          while not FDQueryGrupoCliente.Eof do
          begin

            varBodyGrupoCliente.Add( varBody02.Text.Replace( '%codigo%', FDQueryGrupoClienteTSOP_ORDBILCLICOD.AsString ).Replace( '%cliente%', FDQueryGrupoClienteTSOP_ORDBILCLINOM.AsString ) );

            FDQueryGrupoCliente.Next;

          end;

          varBodyGrupoCliente.AddStrings( varBody03 );

          varCC.Clear;

          Writeln('Enviando Email');
          if DayOfWeek(Now) = DayFriday then
          begin

            varACBrMail.Clear;
            varACBrMail.Host := 'SMTP.GMAIL.COM';
            varACBrMail.Port := '465';
            varACBrMail.SetSSL := True;
            varACBrMail.SetTLS := False;

            varACBrMail.Username := 'suportebrasil@bradycorp.com';
            varACBrMail.Password := 'Rsp1984#$%asd';

            varACBrMail.From := 'suportebrasil@bradycorp.com';
            varACBrMail.FromName := 'Suporte Brasil';

//            varACBrMail.AddAddress( 'suportebrasil@bradycorp.com', 'Suporte Brasil' );
            varACBrMail.AddAddress('EMERSON_ZAIDAN@BRADYCORP.COM');
            varACBrMail.AddAddress('MARCIO_TANADA@BRADYCORP.COM');
            varACBrMail.AddAddress('LILIAN_IWATA@BRADYCORP.COM');
            varACBrMail.AddAddress('LEANDRO_LOPES@BRADYCORP.COM');
            varACBrMail.AddAddress('LUCIANA_PONTIERI@BRADYCORP.COM');

            varACBrMail.Subject := 'S&OP - SEM GRUPO DE CLIENTE';
            varACBrMail.IsHTML := True;
            varACBrMail.Body.Assign(varBodyGrupoCliente);

            Writeln('Enviando Email: S&OP - SEM GRUPO DE CLIENTE');
            try

              varACBrMail.Send;

            except

              on E: Exception do
              begin

                Writeln( E.Message );

              end;

            end;

          end;

        finally

          FDQueryGrupoCliente.Close;

        end;

      finally

        FDQuerySalesRep.Close;
        FDConnection.Close;

      end;

    end;

  finally

    FreeAndNil(Fr_Dados);
    FreeAndNil(varACBrNFe);
    FreeAndNil(varACBrMail);
    FreeAndNil(varBodyTotal);
    FreeAndNil(varBodyAccOwner);
    FreeAndNil(varBodyGrupoCliente);
    FreeAndNil(varBody);
    FreeAndNil(varCC);
    FreeAndNil(varBody01);
    FreeAndNil(varBody02);
    FreeAndNil(varBody03);
    FreeAndNil(varBody04);
    FreeAndNil(varBody05);
    FreeAndNil(varBody06);
    FreeAndNil(varBody07);
    FreeAndNil(varBody08);
    FreeAndNil(varBodyAux);

  end;


  Writeln('Fim: ','EnviarEmailValores');

end;





{
function ComparaData(DataFiltro, DataEmail : TDateTime) : Boolean;
var
    varDataFiltro, varDataEmail : TDate;
begin
    varDataFiltro := Trunc(DataFiltro);
    varDataEmail := Trunc(DataEmail);

    Result := varDataEmail >= varDataFiltro;

end;
}


begin

  FFormatoBR := TFormatSettings.Create;

  FFormatoBR.ThousandSeparator := '.';
  FFormatoBR.DecimalSeparator := ',';
  FFormatoBR.CurrencyDecimals := 2;
  FFormatoBR.DateSeparator := '/';
  FFormatoBR.ShortDateFormat := 'dd/mm/yyyy';
  FFormatoBR.LongDateFormat := 'dd/mm/yyyy';

  if not ParamStr(2).IsEmpty then
  begin

    FFormatoBR.ShortDateFormat := ParamStr(2);
    FFormatoBR.LongDateFormat := ParamStr(2);

  end;

  FFormatoBR.TimeSeparator := ':';
  FFormatoBR.TimeAMString := 'AM';
  FFormatoBR.TimePMString := 'PM';
  FFormatoBR.ShortTimeFormat := 'hh:mm';
  FFormatoBR.LongTimeFormat := 'hh:mm:ss';
  FFormatoBR.CurrencyString := 'R$ ';
  FormatSettings := FFormatoBR;

  if not System.IOUtils.TDirectory.Exists( MyDocumentsPath ) then
    System.IOUtils.TDirectory.CreateDirectory( MyDocumentsPath );

  if not System.IOUtils.TFile.Exists( MyDocumentsPath + '\DB.ini' ) then
    System.IOUtils.TFile.Copy( ExtractFileDir(ParamStr(0)) + '\DB.ini', MyDocumentsPath + '\DB.ini' );

  if not System.IOUtils.TFile.Exists( MyDocumentsPath + '\DB-MySQL.ini' ) then
    System.IOUtils.TFile.Copy( ExtractFileDir(ParamStr(0)) + '\DB-MySQL.ini', MyDocumentsPath + '\DB-MySQL.ini' );

  varArqLogSetonMagento := '';

  if ParamStr(1).IsEmpty then
  begin

    Writeln( 'Informe um parametro.' );
    Sleep(10000);

  end
  else
  if ParamStr(1).Equals('-email') then
  begin

    try

      EnviarEmailValores;
      EnviarEmailQuantidade;

    except

      on E: Exception do
      begin

        Writeln(E.ClassName, ' : ', E.Message);
        Sleep(60000);

      end;

    end;

  end
  else
  if ParamStr(1).Equals('-preco_cliente') then
  begin

    try

      UploadTXTPrecoCliente;

    except

      on E: Exception do
      begin

        Writeln(E.ClassName, ' : ', E.Message);
        Sleep(60000);

      end;

    end;

  end
  else
  if ParamStr(1).Equals('-preco_cliente_parceiro') then
  begin

    try

      UploadTXTPrecoClienteParceiro;

    except

      on E: Exception do
      begin

        Writeln(E.ClassName, ' : ', E.Message);
        Sleep(60000);

      end;

    end;

  end
  else
  if ParamStr(1).Equals('-preco_itemcliente') then
  begin

    try

      UploadTXTPrecoItemCliente;

    except

      on E: Exception do
      begin

        Writeln(E.ClassName, ' : ', E.Message);
        Sleep(60000);

      end;

    end;

  end
  else
  if ParamStr(1).Equals('-preco_zp00') then
  begin

    try

      UploadTXTPrecoZP00;

    except

      on E: Exception do
      begin

        Writeln(E.ClassName, ' : ', E.Message);
        Sleep(60000);

      end;

    end;

  end
  else
  if ParamStr(1).Equals('-parcela_dedutivel') then
  begin

    try

      UploadTXTParcelaDedutivel;

    except

      on E: Exception do
      begin

        Writeln(E.ClassName, ' : ', E.Message);
        Sleep(60000);

      end;

    end;

  end
  else
  if ParamStr(1).Equals('-preco_a800') then
  begin

    try

      UploadTXTPrecoA800;

    except

      on E: Exception do
      begin

        Writeln(E.ClassName, ' : ', E.Message);
        Sleep(60000);

      end;

    end;

  end
  else
  if ParamStr(1).Equals('-preco_zd00') then
  begin

    try

      UploadTXTPrecoZD00;

    except

      on E: Exception do
      begin

        Writeln(E.ClassName, ' : ', E.Message);
        Sleep(60000);

      end;

    end;

  end
  else
  if ParamStr(1).Equals('-preco_zp05') then
  begin

    try

      UploadTXTPrecoZP05;

    except

      on E: Exception do
      begin

        Writeln(E.ClassName, ' : ', E.Message);
        Sleep(60000);

      end;

    end;

  end
  else
  if ParamStr(1).Equals('-preco_item') then
  begin

    try

      UploadTXTItem;

    except

      on E: Exception do
      begin

        Writeln(E.ClassName, ' : ', E.Message);
        Sleep(60000);

      end;

    end;

  end
  else
  if ParamStr(1).Equals('-saldo_estoque') then
  begin

    try

      UploadTXTSaldoEstoque;

    except

      on E: Exception do
      begin

        Writeln(E.ClassName, ' : ', E.Message);
        Sleep(60000);

      end;

    end;

  end
  else
  if ParamStr(1).Equals('-update_estoque') then
  begin

    try

      UpdateSaldoEstoque;

    except

      on E: Exception do
      begin

        Writeln(E.ClassName, ' : ', E.Message);
        Sleep(60000);

      end;

    end;

  end
  else
  if ParamStr(1).Equals('-excel') then
  begin

    try

      while FindFirst('C:\Brady\Files\SOP\Arquivos\BW_INVOICE_*.xls', faAnyFile-faDirectory, FSearchRecord) = 0 do
      begin

        CoInitialize(nil);
        ConvertExcelFile;
        SplitExcelFile;
        CoUninitialize;

      end;

      while FindFirst('C:\Brady\Files\SOP\Arquivos\QV_INVOICE_*.xls', faAnyFile-faDirectory, FSearchRecord) = 0 do
      begin

        CoInitialize(nil);
        ConvertExcelFile;
        SplitExcelFileQV;
        CoUninitialize;

      end;

      ProcessarArquivos;

    except

      on E: Exception do
      begin

        Writeln(E.ClassName, ' : ', E.Message);
        Sleep(60000);

      end;

    end;

  end
  else
  if ParamStr(1).Equals('-bw_invoice') then
  begin

    try

      while FindFirst('C:\Brady\Files\SOP\Arquivos\BW_INVOICE*.xls', faAnyFile-faDirectory, FSearchRecord) = 0 do
      begin

        ImportBW_INVOICE;

      end;

    except

      on E: Exception do
      begin

        Writeln(E.ClassName, ' : ', E.Message);
        Sleep(60000);

      end;

    end;

  end
  else
  if ParamStr(1).Equals('-qv_invoice') then
  begin

    try

      while FindFirst('C:\Brady\Files\SOP\Arquivos\QV_INVOICE*.xls', faAnyFile-faDirectory, FSearchRecord) = 0 do
      begin

        ImportQlik_INVOICE;

      end;

    except

      on E: Exception do
      begin

        Writeln(E.ClassName, ' : ', E.Message);
        Sleep(60000);

      end;

    end;

  end
  else
  if ParamStr(1).Equals('-xls_inovar') then
  begin

    try

      if FindFirst('C:\Brady\Files\FIS\INOVAR_' + FormatDateTime( 'yyyymm', DateUtils.StartOfTheMonth(Now)-1 ) + '.xlsx', faAnyFile-faDirectory, FSearchRecord) = 0 then
      begin

        ImportINOVAR;

      end;

    except

      on E: Exception do
      begin

        Writeln(E.ClassName, ' : ', E.Message);
        Sleep(60000);

      end;

    end;

  end
  else
  if ParamStr(1).Equals('-sap_backlog') then
  begin

    try

      while FindFirst('C:\Brady\Files\SOP\Arquivos\SAP_BACKLOG*.xls', faAnyFile-faDirectory, FSearchRecord) = 0 do
      begin

        ImportSAP_BACKLOG;

      end;

    except

      on E: Exception do
      begin

        Writeln(E.ClassName, ' : ', E.Message);
        Sleep(60000);

      end;

    end;

  end
  else
  if ParamStr(1).Equals('-sap_firstdate') then
  begin

    try

      while FindFirst('C:\Brady\Files\SOP\Arquivos\firstdate*.txt', faAnyFile-faDirectory, FSearchRecord) = 0 do
      begin

        ImportSAP_FIRSTDATE;

        Writeln('Copiando arquivo para backup. ', 'C:\Brady\Files\SOP\Arquivos\'+FSearchRecord.Name );
        CopyFile( PWideChar('C:\Brady\Files\SOP\Arquivos\'+FSearchRecord.Name), PWideChar('C:\Brady\Files\SOP\Arquivos\Backup\'+FSearchRecord.Name), True );

        Writeln('Apagando arquivo. ', MyDocumentsPath+'\'+FSearchRecord.Name );
        DeleteFile( PWideChar('C:\Brady\Files\SOP\Arquivos\'+FSearchRecord.Name) );

        Writeln('Apagando arquivo local. ', MyDocumentsPath+'\'+FSearchRecord.Name );
        DeleteFile(PWideChar(MyDocumentsPath+'\'+FSearchRecord.Name));

        Sleep(15000);

      end;

    except

      on E: Exception do
      begin

        Writeln(E.ClassName, ' : ', E.Message);
        Sleep(60000);

      end;

    end;

  end
  else
  if ParamStr(1).Equals('-eng_bom') then
  begin

    try

      UploadTXTEngBom;

    except

      on E: Exception do
      begin

        Writeln(E.ClassName, ' : ', E.Message);
        Sleep(60000);

      end;

    end;

  end
  else
  if ParamStr(1).Equals('-eng_bom2') then
  begin

    try

      UploadTXTEngBom2;

    except

      on E: Exception do
      begin

        Writeln(E.ClassName, ' : ', E.Message);
        Sleep(60000);

      end;

    end;

  end
  else
  if ParamStr(1).Equals('-eng_routing') then
  begin

    try

      UploadTXTEngRouting;

    except

      on E: Exception do
      begin

        Writeln(E.ClassName, ' : ', E.Message);
        Sleep(60000);

      end;

    end;

  end
  else
  if ParamStr(1).Equals('-eng_op') then
  begin

    try

      UploadTXTEngOrdemProducao;

    except

      on E: Exception do
      begin

        Writeln(E.ClassName, ' : ', E.Message);
        Sleep(60000);

      end;

    end;

  end
  else
  if ParamStr(1).Equals('-eng_opmpr') then
  begin

    try

      UploadTXTEngOrdemProducaoMPR;

    except

      on E: Exception do
      begin

        Writeln(E.ClassName, ' : ', E.Message);
        Sleep(60000);

      end;

    end;

  end
  else
  if ParamStr(1).Equals('-eng_itemfolha') then
  begin

    try

      UploadTXTEngItemFolha;

    except

      on E: Exception do
      begin

        Writeln(E.ClassName, ' : ', E.Message);
        Sleep(60000);

      end;

    end;

  end
  else
  if ParamStr(1).Equals('-eng_itemfaca') then
  begin

    try

      UploadTXTEngItemFaca;

    except

      on E: Exception do
      begin

        Writeln(E.ClassName, ' : ', E.Message);
        Sleep(60000);

      end;

    end;

  end
  else
  if ParamStr(1).Equals('-eng_item') then
  begin

    try

      UploadTXTEngItem;

    except

      on E: Exception do
      begin

        Writeln(E.ClassName, ' : ', E.Message);
        Sleep(60000);

      end;

    end;

  end
  else
  if ParamStr(1).Equals('-sop_dailysalesmail') then
  begin

    try

      SendDailySalesMail;

      if SegundoDiaUtil then
        SendDailySalesMail(True);

    except

      on E: Exception do
      begin

        Writeln(E.ClassName, ' : ', E.Message);
        Sleep(60000);

      end;

    end;

  end
  else
  if ParamStr(1).Equals('-sop_monthsalesmail') then
  begin

    try

      SendDailySalesMail(True);

    except

      on E: Exception do
      begin

        Writeln(E.ClassName, ' : ', E.Message);
        Sleep(60000);

      end;

    end;

  end
  else
  if ParamStr(1).Equals('-sop_delivery') then
  begin

    try

      UploadTXTDelivery;

    except

      on E: Exception do
      begin

        Writeln(E.ClassName, ' : ', E.Message);
        Sleep(60000);

      end;

    end;

  end
  else
  if ParamStr(1).Equals('-gm_custos') then
  begin

    try

      ImportarCustos(1);

    except

      on E: Exception do
      begin

        Writeln(E.ClassName, ' : ', E.Message);
        Sleep(60000);

      end;

    end;

  end
  else
  if ParamStr(1).Equals('-gm_custos2') then
  begin

    try

      ImportarCustos(2);

    except

      on E: Exception do
      begin

        Writeln(E.ClassName, ' : ', E.Message);
        Sleep(60000);

      end;

    end;

  end
  else
  if ParamStr(1).Equals('-uom') then
  begin

    try

      ImportarUOM;

    except

      on E: Exception do
      begin

        Writeln(E.ClassName, ' : ', E.Message);
        Sleep(60000);

      end;

    end;

  end
  else
  if ParamStr(1).Equals('-calc_gm') then
  begin

    try

      CalcularGM;

    except

      on E: Exception do
      begin

        Writeln(E.ClassName, ' : ', E.Message);
        Sleep(60000);

      end;

    end;

  end
  else
  if ParamStr(1).Equals('-RecebeEmailNFE') then
  begin

    try
      doSaveLog(ExtractFilePath(Application.ExeName) + 'Temp', 'Parametro  RecebeEmailNFE ' +  PWideChar(  ParamStr(1) ));
      ReceberEmailNFE;

    except

      on E: Exception do
      begin

        Writeln(E.ClassName, ' : ', E.Message);
        Sleep(60000);

      end;

    end;
  end
  else
  if ParamStr(1).Equals('-SalvarXMLNFE') then
  begin

    try

      SalvarXMLNFE_CTE;
    except

      on E: Exception do
      begin

        Writeln(E.ClassName, ' : ', E.Message);
        Sleep(60000);

      end;

    end;

  end
  else
  if ParamStr(1).Equals('-IntegraSetonMagento') then
  begin

    try

      IntegraSetonMagento;
    except

      on E: Exception do
      begin

        Writeln(E.ClassName, ' : ', E.Message);
        Sleep(60000);

      end;

    end;

  end
  else if ParamStr(1).Equals('-RodarGMAutomatico') then
  begin

    try

      RodarGMAutomatico;
    except

      on E: Exception do
      begin

        Writeln(E.ClassName, ' : ', E.Message);
        Sleep(60000);

      end;

    end;

  end
  else
  if ParamStr(1).Equals('-imp_tabelapreco') then
  begin

    try

      while FindFirst('C:\Brady\Files\SOP\Tmkt\Tabela_Preco*.xlsx', faAnyFile-faDirectory, FSearchRecord) = 0 do
      begin

        Importar_TabelaPreco;

      end;

    except

      on E: Exception do
      begin

        Writeln(E.ClassName, ' : ', E.Message);
        Sleep(60000);

      end;

    end;

  end
  else
  if ParamStr(1).Equals('-imp_novosprodutos') then
  begin
       try

      while FindFirst('C:\Brady\Files\SOP\Tmkt\Tabela_NovosProdutos*.xlsx', faAnyFile-faDirectory, FSearchRecord) = 0 do
      begin

        Importar_NovosProdutos;

      end;

    except

      on E: Exception do
      begin

        Writeln(E.ClassName, ' : ', E.Message);
        Sleep(60000);

      end;

    end;
  end;




end.

