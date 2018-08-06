unit uConsultaDocumento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
   dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
    dxSkinFoggy,
  dxSkinGlassOceans,  dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
   dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver,  dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp,  dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008,  dxSkinsDefaultPainters,
  dxSkinValentine,   dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  ComCtrls, StdCtrls, ExtCtrls, Menus, cxButtons, ShellApi,
  cxGridExportLink, Clipbrd,       FMTBcd, SqlExpr, Provider, DBClient, Mask,
  rsEdit ;

type
  TfrmConsultaDocumento = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    EditDocumento: TLabeledEdit;
    Page: TPageControl;
    TabNFES: TTabSheet;
    TabNFEE: TTabSheet;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    GroupBox1: TGroupBox;
    DataIni: TDateTimePicker;
    DataFim: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    dsConsultaNFES: TDataSource;
    cxGrid1DBTableView1Numero: TcxGridDBColumn;
    cxGrid1DBTableView1Serie: TcxGridDBColumn;
    cxGrid1DBTableView1NatOp: TcxGridDBColumn;
    cxGrid1DBTableView1dhEmi: TcxGridDBColumn;
    cxGrid1DBTableView1CNPJEmitente: TcxGridDBColumn;
    cxGrid1DBTableView1Emitente: TcxGridDBColumn;
    cxGrid1DBTableView1CNPJDEstinatario: TcxGridDBColumn;
    cxGrid1DBTableView1Destinatario: TcxGridDBColumn;
    cxGrid1DBTableView1CHAVE: TcxGridDBColumn;
    cxGrid1DBTableView1Valor: TcxGridDBColumn;
    cxGrid1DBTableView1DESC_PLANTA: TcxGridDBColumn;
    SaveDialog: TSaveDialog;
    Panel3: TPanel;
    ButPesquisar: TcxButton;
    cxButton3: TcxButton;
    btnLimpar: TcxButton;
    ButSair: TcxButton;
    cxGrid1DBTableView1Observacao: TcxGridDBColumn;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    CopiarChaveNFe1: TMenuItem;
    CopiarChaveCTe1: TMenuItem;
    cxButton1: TcxButton;
    pnlDica: TPanel;
    Memo1: TMemo;
    Panel4: TPanel;
    sqlConsultaNFES: TSQLQuery;
    cdsConsultaNFES: TClientDataSet;
    dspConsultaNFES: TDataSetProvider;
    cdsConsultaNFESTipoXML: TStringField;
    cdsConsultaNFEScCT: TStringField;
    cdsConsultaNFESSerie: TStringField;
    cdsConsultaNFESNatOp: TStringField;
    cdsConsultaNFESdhEmi: TSQLTimeStampField;
    cdsConsultaNFESCNPJEmitente: TStringField;
    cdsConsultaNFESEmitente: TStringField;
    cdsConsultaNFESFILIAL: TStringField;
    cdsConsultaNFESCNPJDestinatario: TStringField;
    cdsConsultaNFESDestinatario: TStringField;
    cdsConsultaNFESCHCTE: TStringField;
    cdsConsultaNFESValor: TFMTBCDField;
    cdsConsultaNFESObservacao: TStringField;
    sqlConsultaNFESTipoXML: TStringField;
    sqlConsultaNFEScCT: TStringField;
    sqlConsultaNFESSerie: TStringField;
    sqlConsultaNFESNatOp: TStringField;
    sqlConsultaNFESdhEmi: TSQLTimeStampField;
    sqlConsultaNFESCNPJEmitente: TStringField;
    sqlConsultaNFESEmitente: TStringField;
    sqlConsultaNFESFILIAL: TStringField;
    sqlConsultaNFESCNPJDestinatario: TStringField;
    sqlConsultaNFESDestinatario: TStringField;
    sqlConsultaNFESCHCTE: TStringField;
    sqlConsultaNFESValor: TFMTBCDField;
    sqlConsultaNFESObservacao: TStringField;
    cxGrid1Level2: TcxGridLevel;
    dspItens: TDataSetProvider;
    cdsItens: TClientDataSet;
    sqlItens: TSQLQuery;
    dsItens: TDataSource;
    cxGrid1DBTableView2: TcxGridDBTableView;
    sqlItensChaveseq: TIntegerField;
    sqlItensCodFilial: TStringField;
    sqlItensCodFornecedor: TIntegerField;
    sqlItensNumNF: TStringField;
    sqlItensCodNatureza: TStringField;
    sqlItensCodProduto: TStringField;
    sqlItensDescProduto: TStringField;
    sqlItensUnidadeItem: TStringField;
    sqlItensQtde: TFMTBCDField;
    sqlItensValorUnitario: TFMTBCDField;
    sqlItensValorTotal: TFMTBCDField;
    sqlItensValorICMS: TFMTBCDField;
    sqlItensValorIPI: TFMTBCDField;
    sqlItensValorCofins: TFMTBCDField;
    sqlItensValorPIS: TFMTBCDField;
    sqlItensValorICMS_ST: TFMTBCDField;
    sqlItensPorcICMS: TFMTBCDField;
    sqlItensPorcIPI: TFMTBCDField;
    sqlItensPorcCOFINS: TFMTBCDField;
    sqlItensPorcPIS: TFMTBCDField;
    sqlItensValorFrete: TFMTBCDField;
    sqlItensValorDesconto: TFMTBCDField;
    cdsItensChaveseq: TIntegerField;
    cdsItensCodFilial: TStringField;
    cdsItensCodFornecedor: TIntegerField;
    cdsItensNumNF: TStringField;
    cdsItensCodNatureza: TStringField;
    cdsItensCodProduto: TStringField;
    cdsItensDescProduto: TStringField;
    cdsItensUnidadeItem: TStringField;
    cdsItensQtde: TFMTBCDField;
    cdsItensValorUnitario: TFMTBCDField;
    cdsItensValorTotal: TFMTBCDField;
    cdsItensValorICMS: TFMTBCDField;
    cdsItensValorIPI: TFMTBCDField;
    cdsItensValorCofins: TFMTBCDField;
    cdsItensValorPIS: TFMTBCDField;
    cdsItensValorICMS_ST: TFMTBCDField;
    cdsItensPorcICMS: TFMTBCDField;
    cdsItensPorcIPI: TFMTBCDField;
    cdsItensPorcCOFINS: TFMTBCDField;
    cdsItensPorcPIS: TFMTBCDField;
    cdsItensValorFrete: TFMTBCDField;
    cdsItensValorDesconto: TFMTBCDField;
    cxGrid1DBTableView2Chaveseq: TcxGridDBColumn;
    cxGrid1DBTableView2CodFilial: TcxGridDBColumn;
    cxGrid1DBTableView2CodFornecedor: TcxGridDBColumn;
    cxGrid1DBTableView2NumNF: TcxGridDBColumn;
    cxGrid1DBTableView2CodNatureza: TcxGridDBColumn;
    cxGrid1DBTableView2CodProduto: TcxGridDBColumn;
    cxGrid1DBTableView2DescProduto: TcxGridDBColumn;
    cxGrid1DBTableView2UnidadeItem: TcxGridDBColumn;
    cxGrid1DBTableView2Qtde: TcxGridDBColumn;
    cxGrid1DBTableView2ValorUnitario: TcxGridDBColumn;
    cxGrid1DBTableView2ValorTotal: TcxGridDBColumn;
    cxGrid1DBTableView2ValorICMS: TcxGridDBColumn;
    cxGrid1DBTableView2ValorIPI: TcxGridDBColumn;
    cxGrid1DBTableView2ValorCofins: TcxGridDBColumn;
    cxGrid1DBTableView2ValorPIS: TcxGridDBColumn;
    cxGrid1DBTableView2ValorICMS_ST: TcxGridDBColumn;
    cxGrid1DBTableView2PorcICMS: TcxGridDBColumn;
    cxGrid1DBTableView2PorcIPI: TcxGridDBColumn;
    cxGrid1DBTableView2PorcCOFINS: TcxGridDBColumn;
    cxGrid1DBTableView2PorcPIS: TcxGridDBColumn;
    cxGrid1DBTableView2ValorFrete: TcxGridDBColumn;
    cxGrid1DBTableView2ValorDesconto: TcxGridDBColumn;
    EditCNPJ: TrsSuperEdit;
    Label3: TLabel;
    sqlConsultaNFESUF: TStringField;
    cdsConsultaNFESUF: TStringField;
    cxGrid1DBTableView1UF: TcxGridDBColumn;
    sqlConsultaNFESTipoNF: TStringField;
    cdsConsultaNFESTipoNF: TStringField;
    cxGrid1DBTableView1TipoNF: TcxGridDBColumn;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridDBColumn10: TcxGridDBColumn;
    cxGridDBColumn11: TcxGridDBColumn;
    cxGridDBColumn12: TcxGridDBColumn;
    cxGridDBColumn13: TcxGridDBColumn;
    cxGridDBColumn14: TcxGridDBColumn;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn15: TcxGridDBColumn;
    cxGridDBColumn16: TcxGridDBColumn;
    cxGridDBColumn17: TcxGridDBColumn;
    cxGridDBColumn18: TcxGridDBColumn;
    cxGridDBColumn19: TcxGridDBColumn;
    cxGridDBColumn20: TcxGridDBColumn;
    cxGridDBColumn21: TcxGridDBColumn;
    cxGridDBColumn22: TcxGridDBColumn;
    cxGridDBColumn23: TcxGridDBColumn;
    cxGridDBColumn24: TcxGridDBColumn;
    cxGridDBColumn25: TcxGridDBColumn;
    cxGridDBColumn26: TcxGridDBColumn;
    cxGridDBColumn27: TcxGridDBColumn;
    cxGridDBColumn28: TcxGridDBColumn;
    cxGridDBColumn29: TcxGridDBColumn;
    cxGridDBColumn30: TcxGridDBColumn;
    cxGridDBColumn31: TcxGridDBColumn;
    cxGridDBColumn32: TcxGridDBColumn;
    cxGridDBColumn33: TcxGridDBColumn;
    cxGridDBColumn34: TcxGridDBColumn;
    cxGridDBColumn35: TcxGridDBColumn;
    cxGridDBColumn36: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxGridLevel2: TcxGridLevel;
    sqlConsultaNFEE: TSQLQuery;
    cdsConsultaNFEE: TClientDataSet;
    dsConsultaNFEE: TDataSource;
    dspConsultaNFEE: TDataSetProvider;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxGrid2DBTableView1DblClick(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure ButSairClick(Sender: TObject);
    procedure CopiarChaveNFe1Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaDocumento: TfrmConsultaDocumento;

implementation

{$R *.dfm}

uses DBConect;

procedure TfrmConsultaDocumento.btnLimparClick(Sender: TObject);
begin
  Page.ActivePage := TabNFES;
  editCNPJ.Text := '';
  EditDocumento.Text := '';
  DataIni.Date := Now-7;
  DataFim.Date := Now;
  sqlConsultaNFEE.Close;
  cdsConsultaNFES.Close;
end;

procedure TfrmConsultaDocumento.ButPesquisarClick(Sender: TObject);
Var
 Filtro : String;
begin

  if ((editCNPJ.Text = '') and (EditDocumento.Text = '' )) then
    Filtro := ' and dhEmi between :DataINI and :DataFIM'
  else
  begin

     if editCNPJ.Text <> '' then
     begin
         Filtro := Filtro + ' and CNPJEmitente = :CNPJEmitente ';
     end;

     if ((EditDocumento.Text <> '') and   (editCNPJ.Text = '')) then
     begin
        Filtro := Filtro + ' and CCT = :Numero ';
     end
     else  if ((editCNPJ.Text <> '') and (EditDocumento.Text <> '')) then
     begin
        Filtro := Filtro + ' And CCT = :Numero ';
     end;

  end;

  Screen.Cursor := crHourGlass;


  if Page.ActivePage = TabNFES then
  begin
    cdsConsultaNFES.Close;
    sqlConsultaNFES.Close;
    sqlConsultaNFES.SQL.Clear;
    sqlConsultaNFES.SQL.Add('Select * From VW_NFE Where TipoNF = ''S'' ');
    sqlConsultaNFES.SQL.Add(Filtro);

    if ((editCNPJ.Text = '') and (EditDocumento.Text = '' )) then
    begin
      sqlConsultaNFES.Params.ParamByName('DataINI').AsDateTime :=  DataIni.DateTime;
      sqlConsultaNFES.Params.ParamByName('DataFIM').AsDateTime :=  DataFim.DateTime;
    end
    else
    begin

       if editCNPJ.Text <> '' then
       begin
         sqlConsultaNFES.Params.ParamByName('CNPJEmitente').AsString :=  editCNPJ.Text;
       end;

       if ((EditDocumento.Text <> '') and   (editCNPJ.Text = '')) then
       begin
          sqlConsultaNFES.Params.ParamByName('Numero').AsString :=  EditDocumento.Text;
       end
       else if ((editCNPJ.Text <> '') and (EditDocumento.Text <> '')) then
       begin
         sqlConsultaNFES.Params.ParamByName('Numero').AsString :=  EditDocumento.Text;
       end;

    end;

    cdsConsultaNFES.Open;


    if cdsConsultaNFES.IsEmpty then
      Application.MessageBox('Dados de NF-e n�o encontrados.', 'Consultar - NF-e', mb_iconinformation +  MB_OK);

    cdsItens.Close;
    cdsItens.Open;


  end
  else if Page.ActivePage = TabNFEE then
        begin
            cdsConsultaNFEE.Close;
            sqlConsultaNFEE.Close;
            sqlConsultaNFEE.SQL.Clear;
            sqlConsultaNFEE.SQL.Add('Select * From VW_NFE Where TipoNF = ''E''  ');
            sqlConsultaNFEE.SQL.Add(Filtro);

            if ((editCNPJ.Text = '') and (EditDocumento.Text = '' )) then
            begin
              sqlConsultaNFEE.Params.ParamByName('DataINI').AsDateTime :=  DataIni.DateTime;
              sqlConsultaNFEE.Params.ParamByName('DataFIM').AsDateTime :=  DataFim.DateTime;
            end
            else
            begin

               if editCNPJ.Text <> '' then
               begin
                 sqlConsultaNFEE.Params.ParamByName('CNPJEmitente').AsString :=  editCNPJ.Text;
               end;

               if ((EditDocumento.Text <> '') and   (editCNPJ.Text = '')) then
               begin
                  sqlConsultaNFEE.Params.ParamByName('Numero').AsString :=  EditDocumento.Text;
               end
               else if ((editCNPJ.Text <> '') and (EditDocumento.Text <> '')) then
               begin
                 sqlConsultaNFEE.Params.ParamByName('Numero').AsString :=  EditDocumento.Text;
               end;

            end;

            cdsConsultaNFEE.Open;


            if cdsConsultaNFEE.IsEmpty then
              Application.MessageBox('Dados de NF-e n�o encontrados.', 'Consultar - NF-e', mb_iconinformation +  MB_OK);

            cdsItens.Close;
            cdsItens.Open;
       end;
  Screen.Cursor := crDefault;
end;

procedure TfrmConsultaDocumento.ButSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConsultaDocumento.CopiarChaveNFe1Click(Sender: TObject);
begin
  Clipboard.AsText :=  cdsConsultaNFESCHCTE.AsString;
end;

procedure TfrmConsultaDocumento.cxButton1Click(Sender: TObject);
begin
   pnlDica.Visible := not pnlDica.Visible;
end;

procedure TfrmConsultaDocumento.cxButton3Click(Sender: TObject);
begin

  SaveDialog.InitialDir := GetCurrentDir;
  if Page.ActivePage = TabNFES Then
  begin
    if cdsConsultaNFES.IsEmpty then
    begin
        Application.MessageBox('N�o h� dados de NF-e para serem exportados.', 'Exportar para Excel - NFe', mb_iconinformation +  MB_OK);
        Exit;
    end;

    if SaveDialog.Execute then
       ExportGridToExcel(SaveDialog.FileName, cxGrid1, True, True);
  end
  else
  begin

    if cdsConsultaNFEE.IsEmpty then
    begin
        Application.MessageBox('N�o h� dados de NF-e para serem exportados.', 'Exportar para Excel - NFe', mb_iconinformation +  MB_OK);
        Exit;
    end;

    if SaveDialog.Execute then
       ExportGridToExcel(SaveDialog.FileName, cxGrid2, True, True);
  end;
end;

procedure TfrmConsultaDocumento.cxGrid1DBTableView1DblClick(Sender: TObject);
Var
 sURL : String;
 sChave : String;
begin
  //sURL := 'http://www.nfe.fazenda.gov.br/portal/consulta.aspx?tipoConsulta=completa&tipoConteudo=XbSeqxE8pl8=&nfe=' + sqlConsultaNFECHAVE.AsString;
  sChave := '';
  if Clipboard.HasFormat(CF_TEXT) then
    sChave := Clipboard.AsText;

  if Length(sChave) <> 44 then
     MessageDlg('Tamanho da Chave NF-e Incompativel', mtInformation, [mbOK], 0)
  else
  begin
    sURL := 'https://www.danfeonline.com.br/';
    ShellExecute(Handle,'open',pChar(sURL),nil,nil,SW_SHOW)
  end
end;

procedure TfrmConsultaDocumento.cxGrid2DBTableView1DblClick(Sender: TObject);
Var
 sURL : String;
 sChave : String;
begin

  sChave := '';
  if Clipboard.HasFormat(CF_TEXT) then
    sChave := Clipboard.AsText;

  if Length(sChave) <> 44 then
     MessageDlg('Tamanho da Chave CT-e Incompativel', mtInformation, [mbOK], 0)
  else
  begin
    sURL := 'https://www.danfeonline.com.br/';
    ShellExecute(Handle,'open',pChar(sURL),nil,nil,SW_SHOW)
  end

end;

procedure TfrmConsultaDocumento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  Self := NIL;
end;

procedure TfrmConsultaDocumento.FormCreate(Sender: TObject);
begin

  Page.ActivePage := TabNFES;
  DataIni.Date := Now-7;
  DataFim.Date := Now;
  editCNPJ.Text := '';

  EditCNPJ.CT_Sql.Clear;
  EditCNPJ.CT_Sql.Add('Select distinct CNPJCPF, xNome, xFant from CTE_EMITENTE Order by xNome');

end;

procedure TfrmConsultaDocumento.FormShow(Sender: TObject);
begin
  EditCNPJ.SetFocus;
end;

end.
