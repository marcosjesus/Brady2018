unit UCapImagem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, VideoCap, ExtCtrls,inifiles, StdCtrls, Clipbrd, shellapi, Variants,
  ComCtrls, Buttons,vfw,mmsystem, Jpeg, rsFlyovr, DB, DBTables, Grids,
  DBGrids, ADODB, DBCtrls, QuickRpt, QRCtrls, FileCtrl, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdFTP, Gauges, IdMessage,
  IdMessageClient, IdSMTP, DSPack, DSUtil, DirectShow9, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, cxPC, cxControls,
  cxLookAndFeelPainters, cxButtons, DelphiTwain, cxContainer, cxEdit,
  cxProgressBar, cxLabel, cxGroupBox, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses,
  cxGridCustomView, cxGrid;


type
  TFCapImagem = class(TForm)
    Panel5: TPanel;
    Label1: TLabel;
    qryVisualiza: TQuery;
    dtsVisualiza: TDataSource;
    DBNavigator1: TDBNavigator;
    qryAux: TQuery;
    qryInsere: TQuery;
    qryAux2: TQuery;
    IdFTP: TIdFTP;
    pnlEmail: TPanel;
    rsFlyOverButton1: TrsFlyOverButton;
    rsFlyOverButton2: TrsFlyOverButton;
    rsFlyOverButton3: TrsFlyOverButton;
    SpeedButton2: TSpeedButton;
    DBGrid2: TDBGrid;
    Panel35: TPanel;
    Panel31: TPanel;
    EdiContato: TEdit;
    EdiInsEmail: TEdit;
    qryEmail: TQuery;
    dtsEmail: TDataSource;
    SMTP: TIdSMTP;
    FilterGraph: TFilterGraph;
    Filter: TFilter;
    SampleGrabber: TSampleGrabber;
    qryVisualizaID: TIntegerField;
    qryVisualizacnpj_cic: TStringField;
    qryVisualizanumdoc: TIntegerField;
    qryVisualizadocumento: TBlobField;
    qryVisualizaCodCliente: TStringField;
    qryVisualizaNomeArquivo: TStringField;
    qryVisualizaFTPArquivo: TStringField;
    qryVisualizaOpe_Id: TIntegerField;
    qryVisualizaOrigem: TStringField;
    qryVisualizaDataInclusao: TDateTimeField;
    qryVisualizaImp: TStringField;
    qryVisualizaBloco: TIntegerField;
    qryVisualizaPasta: TStringField;
    qryVisualizaExtensao: TStringField;
    qryInsereID: TIntegerField;
    qryInserecnpj_cic: TStringField;
    qryInserenumdoc: TIntegerField;
    qryInseredocumento: TBlobField;
    qryInsereCodCliente: TStringField;
    qryInsereNomeArquivo: TStringField;
    qryInsereFTPArquivo: TStringField;
    qryInsereOpe_Id: TIntegerField;
    qryInsereOrigem: TStringField;
    qryInsereDataInclusao: TDateTimeField;
    qryInsereImp: TStringField;
    qryInsereBloco: TIntegerField;
    qryInserePasta: TStringField;
    qryInsereExtensao: TStringField;
    qryEmailCodCliente: TStringField;
    qryEmailEmail: TStringField;
    qryEmailContato: TStringField;
    Page: TcxPageControl;
    tabCamera: TcxTabSheet;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    cmbCamera: TComboBox;
    CheckPrev: TCheckBox;
    tabArquivos: TcxTabSheet;
    tabScanner: TcxTabSheet;
    Panel2: TPanel;
    VideoWindow: TVideoWindow;
    Panel17: TPanel;
    Diretorio: TDirectoryListBox;
    Splitter1: TSplitter;
    Panel18: TPanel;
    Arquivos: TFileListBox;
    Panel19: TPanel;
    Panel6: TPanel;
    ContainImage: TScrollBox;
    imgDocumento: TImage;
    Panel7: TPanel;
    EditSPict: TEdit;
    Label2: TLabel;
    ScrollBox1: TScrollBox;
    Image: TImage;
    cxButton1: TcxButton;
    butSalvar: TcxButton;
    Panel1: TPanel;
    Driver: TDriveComboBox;
    cxButton2: TcxButton;
    tabVisualizacao: TcxTabSheet;
    ContainerPreview: TScrollBox;
    imgVisualiza: TImage;
    Twain: TDelphiTwain;
    butDigitaliza: TcxButton;
    ButSalvaDigitalizacao: TcxButton;
    grpProcesso: TcxGroupBox;
    cxLabel1: TcxLabel;
    ProgessArquivo: TcxProgressBar;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    spbEmail: TcxButton;
    cxButton5: TcxButton;
    qrySocios: TQuery;
    qrySociosIdSocio: TIntegerField;
    qrySociosCodCliente: TStringField;
    qrySociosNome: TStringField;
    qrySociosCpf: TStringField;
    qrySociosRG: TStringField;
    dtsSocios: TDataSource;
    qryVisualizaSocios: TQuery;
    IntegerField5: TIntegerField;
    StringField9: TStringField;
    IntegerField6: TIntegerField;
    BlobField2: TBlobField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    IntegerField7: TIntegerField;
    StringField13: TStringField;
    DateTimeField2: TDateTimeField;
    StringField14: TStringField;
    IntegerField8: TIntegerField;
    StringField15: TStringField;
    StringField16: TStringField;
    dtsVisualizaSocios: TDataSource;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1numdoc: TcxGridDBColumn;
    cxGrid1DBTableView1cnpj_cic: TcxGridDBColumn;
    cxGrid1DBTableView1FTPArquivo: TcxGridDBColumn;
    cxGrid1DBTableView1CodCliente: TcxGridDBColumn;
    cxGrid1DBTableView1DataInclusao: TcxGridDBColumn;
    cxGrid1DBTableView1Pasta: TcxGridDBColumn;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    cxGrid1DBTableView2: TcxGridDBTableView;
    cxGrid1DBTableView3: TcxGridDBTableView;
    cxGrid1DBTableView3CodCliente: TcxGridDBColumn;
    cxGrid1DBTableView3Email: TcxGridDBColumn;
    cxGrid1DBTableView3Contato: TcxGridDBColumn;
    cxGrid1DBTableView4: TcxGridDBTableView;
    cxGrid1DBTableView4Nome: TcxGridDBColumn;
    cxGrid1DBTableView4Cpf: TcxGridDBColumn;
    cxGrid1DBTableView4RG: TcxGridDBColumn;
    cxGrid1DBTableView5: TcxGridDBTableView;
    cxGrid1DBTableView5numdoc: TcxGridDBColumn;
    cxGrid1DBTableView5DataInclusao: TcxGridDBColumn;
    cxGrid1DBTableView5FTPArquivo: TcxGridDBColumn;
    cxGrid1DBTableView5Pasta: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1Level2: TcxGridLevel;
    cxGrid1Level3: TcxGridLevel;
    qryVisualizaDataDocto: TDateTimeField;
    qryVisualizaDataVencto: TDateTimeField;
    qryVisualizaID_Socio: TIntegerField;
    qryVisualizaDescricao: TStringField;
    cxButton6: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure ButSalvarClick(Sender: TObject);
    procedure ButSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qryVisualizaAfterScroll(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpeedButton2Click(Sender: TObject);
    procedure rsFlyOverButton2Click(Sender: TObject);
    procedure rsFlyOverButton1Click(Sender: TObject);
    procedure rsFlyOverButton3Click(Sender: TObject);
    procedure spbEmailClick(Sender: TObject);
    procedure butSubirArquivosClick(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmbCameraClick(Sender: TObject);
    procedure ImageMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImageMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ScrollBox1Resize(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure imgVisualizaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgVisualizaMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ContainerPreviewResize(Sender: TObject);
    procedure butDigitalizaClick(Sender: TObject);
    procedure TwainSourceFileTransfer(Sender: TObject;
      const Index: Integer; Filename: TW_STR255; Format: TTwainFormat;
      var Cancel: Boolean);
    procedure TwainSourceSetupFileXfer(Sender: TObject;
      const Index: Integer);
    procedure TwainTwainAcquire(Sender: TObject; const Index: Integer;
      Image: TBitmap; var Cancel: Boolean);
    procedure ButSalvaDigitalizacaoClick(Sender: TObject);
    procedure IdFTPWork(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure IdFTPWorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure IdFTPWorkEnd(Sender: TObject; AWorkMode: TWorkMode);
    procedure PageChange(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    procedure cxGrid1ActiveTabChanged(Sender: TcxCustomGrid;
      ALevel: TcxGridLevel);
    procedure cxButton6Click(Sender: TObject);
  private
    { Private-Deklarationen}
    Srv : String;
    Dia, Mes, Ano : Word;
    ClickPos, ClickPosPreview: TPoint;

    ImageList: TList;
    TransferMode: TTwainTransferMode;
    CurrentSource: Integer;
    CurrentImage : Integer;
    LoadedSource : Integer;
    JPG : TJpegImage;
    MemoryStream : TMemoryStream;
    CodTipoDoc : String;
    DataDocto, DataVecto : TDateTime;

    Function  LastCodigo(Chave, Tab, Condicao : String ) : String;
    Function UPLoad(NomeArquivo : String; Arquivo : String) : Boolean;
    Procedure ExcluirArquivosTemp ;
    procedure DownLoad(NomeArquivo : String; Pasta : String);
    Procedure Le_Imagem_JPEG(Campo:TBlobField; Foto:TImage);
    procedure OnSelectDevice(sender: TObject);
    Function EspacoBranco(Nome : String) : String ;
    procedure ClearImageList;
    procedure SelectFirst;
    Function TipoPessoa(Cliente: String) : string;
  public
    { Public-Deklarationen}
    CNPJ, CodCliente, Origem : String;
  end;

var
  FCapImagem: TFCapImagem;
  SysDev    : TSysDevEnum;


implementation

uses MensFun, UImpImagem, Global, TransacPassWord, ConcCambio, RelCliCompliance , Math, Cliente, TipoImagem ;


{$R *.DFM}

procedure TFCapImagem.FormCreate(Sender: TObject);
var
  i : integer;
begin

  SysDev:= TSysDevEnum.Create(CLSID_VideoInputDeviceCategory);
  if SysDev.CountFilters > 0 then
  begin
    for i := 0 to SysDev.CountFilters - 1 do
      cmbCamera.Items.Add(SysDev.Filters[i].FriendlyName);

    cmbCamera.ItemIndex := 0;
  end
  else
    Mens_MensInf('Não Foi Encontrado Nenhum Disposito de Imagem !');

  FilterGraph.Active := false;


  Srv := 'C:\Windows\Temp';

  DecodeDate(GParFin.DtTrab, Ano, Mes, Dia );

//  DBGrid1.Columns[0].Visible := not Assigned(FrmConcCambio);
  spbEmail.Visible    := Assigned(FrmConcCambio);
  tabArquivos.Visible := Assigned(FrmConcCambio) or Assigned(FrmCliente);

//  EditSPict.Text := ExtractFilePath(Application.ExeName) + 'Foto.jpg';
  EditSPict.Text  :=  '';
  Page.ActivePage := tabCamera;

  ImageList := TList.Create;
  {Avoid flickering by using double-buffering}
  ContainImage.DoubleBuffered := TRUE;
  TransferMode := ttmMemory;
  CurrentSource := -1;
  LoadedSource  := CurrentSource;


end;

procedure TFCapImagem.ButSalvarClick(Sender: TObject);
Var BMP : TBitMap;
    JPG : TJpegImage;
    BS  : TBlobStream;
    MemoryStream : TMemoryStream;
    Fl, Compl, NDAnterior, NomeArquivo : String;
    i: Integer;
begin

  FrmTipoImagem := TFrmTipoImagem.Create(Self);
  FrmTipoImagem.lblOrigemImg.Caption := 'Captura de Imagem da Câmera.' ;
  if cxGrid1Level2.Active then
    FrmTipoImagem.TipoPessoa := 'F'
  else
    FrmTipoImagem.TipoPessoa := TipoPessoa(qryVisualizaCodCliente.AsString);
  FrmTipoImagem.ShowModal;

  if FrmTipoImagem.Tag = 0 then
  begin
    Mens_MensInf('Tipo Não Informado !');
    Exit;
  end
  else
  begin
    CodTipoDoc := FrmTipoImagem.qryTipoDoctoCodTipoDoc.AsString;
    DataDocto  := 0;
    DataVecto  := 0;
    if FrmTipoImagem.qryTipoDocto.FieldByName('Data').AsString = 'S' then
      DataDocto := FrmTipoImagem.EdiData.Date;
    if FrmTipoImagem.qryTipoDocto.FieldByName('Vencimento').AsString = 'S' then
      DataVecto := FrmTipoImagem.EdiVecto.Date;
  end;
  FrmTipoImagem.Release;

//  VideoCap1.SaveToClipboard;
  BMP := TBitMap.Create;
  try
   // BMP.LoadFromClipboardFormat(cf_BitMap,ClipBoard.GetAsHandle(cf_Bitmap),0);
  Except
    Mens_MensInf('Não é Possivel Capturar Imagem !');
    Exit;
  End;
   SampleGrabber.GetBitmap(BMP);

  JPG := TJpegImage.Create;
  JPG.Assign(BMP);

//  JPG.SaveToFile('c:\temp.jpg');

  MemoryStream := TMemoryStream.Create;
  JPG.SaveToStream(MemoryStream);

  if Assigned(FrmConcCambio) then
  begin
    Compl := ''; Fl := ''; NomeArquivo := '';
    for i := 1 to 25 do begin
      if not FileExists(Srv + FrmConcCambio.QGridOpe_ID.AsString + Compl + '.jpg') then
         begin
           Fl := Srv + FrmConcCambio.QGridOpe_ID.AsString + Compl + '.jpg';
           NomeArquivo := FrmConcCambio.QGridOpe_ID.AsString + Compl + '.jpg';
           Break;
         end
       else
         Compl := '_' + IntToStr(i); // Complemento(i);
    end;

    Try
      JPG.SaveToFile( Fl );
    Except
      Mens_MensErro('Erro Salvando Arquivo: ' + Fl + '!');
    End;


    Try
      if not UPLoad(NomeArquivo, Fl) then
        Exit;
    Except
      Mens_MensErro('Erro Salvando Arquivo:  ' + Fl + ' no FTP !');
    End;

    qryAux2.Close;
    qryAux2.SQL.Clear;
    qryAux2.SQL.Add('INSERT INTO ClienteImagem (numdoc, CodCliente, NomeArquivo, FTPArquivo, Ope_ID, Origem, Pasta, ID_Socio, CodTipoDocumento  ');
    if DataDocto <> 0 then
      qryAux2.SQL.Add(', DataDocto ');
    if DataVecto <> 0 then
      qryAux2.SQL.Add(', DataVencto ');

    qryAux2.SQL.Add(' ) ');
    qryAux2.SQL.Add('VALUES (:numdoc, :CodCliente, :NomeArquivo, :FTPArquivo, :Ope_ID, :Origem, :Pasta, :ID_Socio, :CodTipoDocumento ');
    if DataDocto <> 0 then
      qryAux2.SQL.Add(', :DataDocto ');
    if DataVecto <> 0 then
      qryAux2.SQL.Add(', :DataVencto ');
    qryAux2.SQL.Add(' ) ');
    qryAux2.ParamByName('numdoc').AsInteger      := StrToInt(LastCodigo('numdoc', 'clienteimagem', 'where codcliente = ''' + FrmConcCambio.QGridCodCliente.AsString + '''' ));
    qryAux2.ParamByName('CodCliente').AsString   := FrmConcCambio.QGridCodCliente.AsString;
    qryAux2.ParamByName('NomeArquivo').AsString  := EditSPict.Text;
    qryAux2.ParamByName('FTPArquivo').AsString   := FrmConcCambio.QGridOpe_ID.AsString + Compl + '.jpg';
    qryAux2.ParamByName('Ope_Id').AsString       := FrmConcCambio.QGridOpe_ID.AsString;
    qryAux2.ParamByName('Pasta').AsString        := FormatFloat('00', Mes) + '-' + FormatFloat('00', Ano);
    qryAux2.ParamByName('Origem').AsString       := Copy(FrmConcCambio.QGridTabela.AsString,1,1);
    if cxGrid1Level2.Active then
      qryAux2.ParamByName('ID_Socio').AsInteger       := qrySociosIdSocio.AsInteger
    else
      qryAux2.ParamByName('ID_Socio').AsInteger       := 0;
    qryAux2.ParamByName('CodTipoDocumento').AsString  := CodTipoDoc;
    if DataDocto <> 0 then
      qryAux2.ParamByName('DataDocto').AsDateTime  := DataDocto;
    if DataVecto <> 0 then
      qryAux2.ParamByName('DataVencto').AsDateTime := DataVecto;
    qryAux2.ExecSQL;

    qryVisualiza.Close;
    qryVisualiza.Sql.Clear;
    qryVisualiza.Sql.Add('select * from ClienteImagem  Left Join TipoDoc on CodTipoDocumento = CodTipoDoc ');
    qryVisualiza.Sql.Add('where ((Ope_Id = :Ope_Id) or (cnpj_cic = :cnpj_cic)) and Origem = :Origem ');
    if cxGrid1Level2.Active then
      qryVisualiza.Sql.Add('and ((ID_Socio is not null) and (ID_Socio <> 0)) and Origem = :Origem ')
    else
      qryVisualiza.Sql.Add('and ((ID_Socio is null) or (ID_Socio = 0)) and Origem = :Origem ');
    qryVisualiza.Sql.Add('order by numdoc ');
    qryVisualiza.ParamByName('Ope_Id').AsString   := FrmConcCambio.QGridOpe_ID.AsString;
    qryVisualiza.ParamByName('cnpj_cic').AsString := CNPJ;
    qryVisualiza.ParamByName('Origem').AsString   := Copy(FrmConcCambio.QGridTabela.AsString,1,1);
    qryVisualiza.Open;
  end
  else
  begin
    with qryInsere do
    begin
      {Close;
  //    Sql.Clear;
  //    Sql.Add('insert into ClienteImagem (Cnpj_Cic, Documento, CodCliente, NomeArquivo) values (:Cnpj_Cic, :Documento, :CodCliente, :NomeArquivo) ');
      ParamByName('cnpj_cic').AsString    := CNPJ;
      open;
      }
  {
      Insert;
      FieldByName('cnpj_cic').AsString     := CNPJ;
      FieldByName('numdoc').AsInteger      := StrToInt(LastCodigo('numdoc', 'clienteimagem', 'where cnpj_cic = ''' + CNPJ + '''' ));
      FieldByName('CodCliente').AsString   := CodCliente;
      FieldByName('NomeArquivo').AsString  := EditSPict.Text;
  }

      qryAux2.Close;
      qryAux2.SQL.Clear;
      qryAux2.SQL.Add('INSERT INTO ClienteImagem (cnpj_cic, numdoc, CodCliente, NomeArquivo, Documento, Origem, ID_Socio, CodTipoDocumento ');
      if DataDocto <> 0 then
        qryAux2.SQL.Add(', DataDocto ');
      if DataVecto <> 0 then
        qryAux2.SQL.Add(', DataVencto ');

      qryAux2.SQL.Add(' ) ');
      qryAux2.SQL.Add('VALUES (:cnpj_cic, :numdoc, :CodCliente, :NomeArquivo, :Documento, :Origem, :ID_Socio, :CodTipoDocumento ');
      if DataDocto <> 0 then
        qryAux2.SQL.Add(', :DataDocto ');
      if DataVecto <> 0 then
        qryAux2.SQL.Add(', :DataVencto ');
      qryAux2.SQL.Add(' ) ');
      qryAux2.ParamByName('cnpj_cic').AsString     := CNPJ;
      qryAux2.ParamByName('numdoc').AsInteger      := StrToInt(LastCodigo('numdoc', 'clienteimagem', 'where cnpj_cic = ''' + CNPJ + '''' ));
      qryAux2.ParamByName('CodCliente').AsString   := CodCliente;
      qryAux2.ParamByName('NomeArquivo').AsString  := EditSPict.Text;
      qryAux2.ParamByName('Origem').AsString       := Origem;
      if cxGrid1Level2.Active then
        qryAux2.ParamByName('ID_Socio').AsInteger := qrySociosIdSocio.AsInteger
      else
        qryAux2.ParamByName('ID_Socio').AsInteger := 0;

      // Copia o conteúdo do memo e armazena no objeto Texto

      qryAux2.ParamByName('Documento').LoadFromStream(MemoryStream, ftBlob);
      qryAux2.ParamByName('CodTipoDocumento').AsString  := CodTipoDoc;
      if DataDocto <> 0 then
        qryAux2.ParamByName('DataDocto').AsDateTime  := DataDocto;
      if DataVecto <> 0 then
        qryAux2.ParamByName('DataVencto').AsDateTime := DataVecto;
      qryAux2.ExecSQL;

  //    BS := TBlobStream.Create((qryInseredocumento as TBlobField), BMWRITE);
  //    JPG.SaveToStream(BS);

  //    Post;

  //    try
  //      ExecSQL;
  {    Except
        Mens_MensErro('Erro Salvando Imagem !');
      End;
     }
    end;

    qryVisualiza.Close;
    qryVisualiza.Sql.Clear;
    qryVisualiza.Sql.Add('select * from clienteimagem Left Join TipoDoc on CodTipoDocumento = CodTipoDoc ');
    qryVisualiza.Sql.Add('where ((cnpj_cic = :cnpj_cic) or (codcliente = :codcliente)) '); //and Origem = :Origem
    if cxGrid1Level2.Active then
      qryVisualiza.Sql.Add('and ((ID_Socio is not null) and (ID_Socio <> 0))  ')
    else
      qryVisualiza.Sql.Add('and ((ID_Socio is null) or (ID_Socio = 0))  ');
    qryVisualiza.Sql.Add('order by cnpj_cic, numdoc ');
    qryVisualiza.ParamByName('cnpj_cic').AsString    := CNPJ ;
    qryVisualiza.ParamByName('codcliente').AsString  := CodCliente;
    qryVisualiza.Open;

    qrySocios.Close;
    qrySocios.Sql.Clear;
    qrySocios.Sql.Add('select * from Socios ');
    qrySocios.Sql.Add('where CodCliente = :CodCliente  ');
    qrySocios.ParamByName('CodCliente').AsString := CodCliente;
    qrySocios.Open;

  end;

//  BMP.SaveToFile(EditSPict.Text+'.bmp');
  JPG.Free;
//  BMP.Free;
end;

procedure TFCapImagem.ButSairClick(Sender: TObject);
begin
  FilterGraph.Active := False;

  if Assigned(FrmRelCliComplience) then
  begin
    qryVisualiza.Close;
    qryVisualiza.Sql.Clear;
    qryVisualiza.Sql.Add('select * from clienteimagem Left Join TipoDoc on CodTipoDocumento = CodTipoDoc  ');
    if (CNPJ <> '   .   .   -  ') and (CNPJ <> '  .   .   /    -  ') then
      qryVisualiza.Sql.Add('where cnpj_cic = :cnpj_cic ')
    else if CodCliente <> '' then
      qryVisualiza.Sql.Add('where CodCliente = :CodCliente ');

    qryVisualiza.Sql.Add('and ((ID_Socio is null) or (ID_Socio = 0))  ');
    qryVisualiza.Sql.Add('order by cnpj_cic, numdoc ');
    if (CNPJ <> '   .   .   -  ') and (CNPJ <> '  .   .   /    -  ') then
      qryVisualiza.ParamByName('cnpj_cic').AsString := CNPJ
    else if CodCliente <> '' then
      qryVisualiza.ParamByName('CodCliente').AsString := CodCliente;
    qryVisualiza.Open;

    if (qryVisualiza.RecordCount < 2) and (qryVisualiza.RecordCount > -1) then
    begin
     if  ( Not Glob_GetAccess('PLANILHA-IMG','') ) Then
      If ( Not GetTransacPermission('PLANILHA-IMG') ) Then
      begin
        Mens_MensInf('Mínimo 2 Imagens Para Este Cliente !');
        Exit;
      end;
    end;
  end
  else
  if not Assigned(FrmConcCambio) then
  begin
    qryVisualiza.Close;
    qryVisualiza.Sql.Clear;
    qryVisualiza.Sql.Add('select * from clienteimagem Left Join TipoDoc on CodTipoDocumento = CodTipoDoc ');
    qryVisualiza.Sql.Add('where ((cnpj_cic = :cnpj_cic) or (CodCliente = :CodCliente))  '); //and Origem = :Origem
    qryVisualiza.Sql.Add('and ((ID_Socio is null) or (ID_Socio = 0)) ');
    qryVisualiza.Sql.Add('order by cnpj_cic, numdoc ');
    qryVisualiza.ParamByName('cnpj_cic').AsString := CNPJ ;
    qryVisualiza.ParamByName('CodCliente').AsString := CodCliente ;
//    qryVisualiza.ParamByName('Origem').AsString   := Origem;
    qryVisualiza.Open;

    if (qryVisualiza.RecordCount = 0) then
     if  ( Not Glob_GetAccess('PLANILHA-IMG','') ) Then
      If ( Not GetTransacPermission('PLANILHA-IMG') ) Then
      begin
        Mens_MensInf('Não Existe Imagem Para Este Cliente !');
        Exit;
      end;
  end;
{  else
  begin
    if (FrmConcCambio.nSwift <> '') and (DBGrid1.SelectedRows.Count = 0) then
    begin
      if Mens_MensConf('Nenhuma Imagem Selecionada Para Envio do Link! Deseja Continuar ?') <> mrOk then
        Exit;
    end;
  end;
}
{  try
    VideoCap1.DriverOpen:= false;
    VideoCap1.VideoPreview:= false;
  except
  end;
}
  Close;
end;

procedure TFCapImagem.Le_Imagem_JPEG(Campo: TBlobField; Foto: TImage);
var
  BS:TBlobStream;
  MinhaImagem:TJPEGImage;
Begin
  if Campo.AsString <> '' Then
  Begin
    try
      BS := TBlobStream.Create((Campo as TBlobField), BMREAD);
      MinhaImagem := TJPEGImage.Create;
      MinhaImagem.LoadFromStream(BS);
      Foto.Picture.Assign(MinhaImagem);
      BS.Free;
      MinhaImagem.Free;
    Except
      Mens_MensErro('Erro Gerando Visualização da Imagem, O Arquivo Pode Estar Corrompido !');
    End;
  End;
End;

procedure TFCapImagem.FormShow(Sender: TObject);
begin
{ try
   VideoCap1.Driverindex := 0;
   VideoCap1.DriverOpen:=True;
//   VideoCap1.VideoPreview := CheckPrev.Checked;
 except
 begin
   try
     VideoCap1.Driverindex := 1;
     VideoCap1.DriverOpen:=True;
//     VideoCap1.VideoPreview := CheckPrev.Checked;
   except
   end;
 end;
 end;
}
// editsPict.text:= VideoCap1.SingleImageFile;
//  Le_Imagem_JPEG(qryVisualizadocumento, Image);

  if (CNPJ = '') and (CodCliente <> '')  then
  begin
    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.SQL.Add('Select CNPJ_CIC from cliente where CodCliente = :CodCliente ');
    qryAux.ParamByName('CodCliente').AsString := CodCliente;
    qryAux.Open;

    CNPJ := qryAux.FieldByName('CNPJ_CIC').AsString;
    qryAux.Close;
  end;


  if (not FilterGraph.Active) and (cmbCamera.ItemIndex <> -1) then
    OnSelectDevice(cmbCamera);

end;

function TFCapImagem.LastCodigo(Chave, Tab, Condicao: String): String;
begin
 Result := '';

  With qryAux do begin
    close;
    Sql.Clear;
    Sql.Add('select Max(' + Chave  +') from ' + Tab + ' '+ Condicao );    // condição usado pra gerar subcodigo
    Open;

    if not (Eof) and (Fields[0].AsString <> '') then
      Result :=  IntToStr( StrToInt(Fields[0].AsString) + 1 )
    else if Condicao <> '' then       // é um subcodigo
      Result := '000001'
    else
      Result := '001';                // não é subcodigo
  end;
  qryAux.Close;
end;

procedure TFCapImagem.qryVisualizaAfterScroll(DataSet: TDataSet);
begin
{
  if (qryVisualizaFTPArquivo.AsString <> '') and (qryVisualizaOpe_Id.AsString <> '') then
    DownLoad(qryVisualizaFTPArquivo.AsString, qryVisualizaPasta.AsString)
  else if (qryVisualizaFTPArquivo.AsString <> '') and (qryVisualizaCodCliente.AsString <> '') then
    DownLoad(qryVisualizaFTPArquivo.AsString, 'Cliente')
  else
    Le_Imagem_JPEG(qryVisualizadocumento, Image);
}
end;

procedure TFCapImagem.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if Assigned(FrmRelCliComplience) then
  begin
    qryVisualiza.Close;
    qryVisualiza.Sql.Clear;
    qryVisualiza.Sql.Add('select * from clienteimagem Left Join TipoDoc on CodTipoDocumento = CodTipoDoc ');
    if (CNPJ <> '   .   .   -  ') and (CNPJ <> '  .   .   /    -  ') then
      qryVisualiza.Sql.Add('where cnpj_cic = :cnpj_cic ')
    else if CodCliente <> '' then
      qryVisualiza.Sql.Add('where CodCliente = :CodCliente ');
    qryVisualiza.Sql.Add('and ((ID_Socio is null) or (ID_Socio = 0)) ');
    qryVisualiza.Sql.Add('order by cnpj_cic, numdoc ');
    if (CNPJ <> '   .   .   -  ') and (CNPJ <> '  .   .   /    -  ') then
      qryVisualiza.ParamByName('cnpj_cic').AsString := CNPJ
    else if CodCliente <> '' then
      qryVisualiza.ParamByName('CodCliente').AsString := CodCliente;
    qryVisualiza.Open;

    if (qryVisualiza.RecordCount < 2) and (qryVisualiza.RecordCount > -1) then
    begin
     if  ( Not Glob_GetAccess('PLANILHA-IMG','') ) Then
      If ( Not GetTransacPermission('PLANILHA-IMG') ) Then
      begin
        Mens_MensInf('Mínimo 2 Imagens Para Este Cliente !');
        CanClose := False;
        Exit;
      end;
    end;
  end
  else
  if not Assigned(FrmConcCambio) then
  begin
    qryVisualiza.Close;
    qryVisualiza.Sql.Clear;
    qryVisualiza.Sql.Add('select * from clienteimagem Left Join TipoDoc on CodTipoDocumento = CodTipoDoc ');
    qryVisualiza.Sql.Add('where ((cnpj_cic = :cnpj_cic) or (CodCliente = :CodCliente)) '); //and Origem = :Origem
    qryVisualiza.Sql.Add('and ((ID_Socio is null) or (ID_Socio = 0)) ');
    qryVisualiza.Sql.Add('order by cnpj_cic, numdoc ');
    qryVisualiza.ParamByName('cnpj_cic').AsString := CNPJ ;
    qryVisualiza.ParamByName('CodCliente').AsString := CodCliente ;
//    qryVisualiza.ParamByName('Origem').AsString   := Origem;
    qryVisualiza.Open;

    if (qryVisualiza.RecordCount = 0) then
     if  ( Not Glob_GetAccess('PLANILHA-IMG','') ) Then
      If ( Not GetTransacPermission('PLANILHA-IMG') ) Then
      begin
        Mens_MensInf('Não Existe Imagem Para Este Cliente !');
        CanClose := False;
        Exit;
      end;
  end;

  SysDev.Free;
//  FilterGraph.ClearGraph;
  FilterGraph.Active := false;
end;



procedure TFCapImagem.DownLoad(NomeArquivo : String; Pasta : String);
function TamArquivo(Arquivo: string): Integer;
begin
  with TFileStream.Create(Arquivo, fmOpenRead or fmShareExclusive) do
    try
      Result := Size;
    finally
       Free;
  end;
end;

Var
  DownDestino : String;
  dirDestino  : String;
  Tamanho_Arquivo : Integer;
begin
  DownDestino := 'C:\Windows\Temp\' + NomeArquivo ;

  Page.ActivePage := tabVisualizacao;

  if (FileExists(DownDestino)) and (TamArquivo(DownDestino) = 0) then
  begin
    Mens_MensInf('Arquivo JPG Com Tamanho (0), Pode Ter Ocorrido Erro Durante UPLoad ou Download. Se o Problema Continuar Excute UPLoad da Imagem Novamente !');
    DeleteFile(DownDestino);
    Exit;
  end;

  if (FileExists(DownDestino)) then
  begin
    if Pos('JPG', UpperCase(DownDestino)) > 0 then
    begin
      try
        imgVisualiza.Picture.LoadFromFile(DownDestino);
      except
        Mens_MensErro('Erro Carregando Imagem!');
      end;
    end
    else
      shellExecute(Handle, 'Open', PChar(DownDestino), nil, nil, sw_shownormal);

    Exit;
  end;

  if pasta = 'Cliente' then
    DirDestino := 'Web/update/imagens/Clientes/'
  else
    DirDestino := 'Web/update/imagens/' + Pasta;

  try
    IdFTP.Username := 'travelcash';
    IdFTP.Password := 'qawsed105';
    IdFTP.Host     := '201.76.48.45';
    IdFTP.Connect;
    IdFTP.ChangeDir(dirDestino);
  except
    IdFTP.Disconnect;
    Exit;
  end;

  Tamanho_Arquivo := IdFTP.Size(NomeArquivo);

  if (Tamanho_Arquivo = 0) then
  begin
    Mens_MensInf('Arquivo JPG Com Tamanho (0), Pode Ter Ocorrido Erro Durante UPLoad da Imagem !');
    try
      IdFTP.Delete(NomeArquivo);
    Except
    end;
    Exit;
  end;

    try
      Screen.Cursor:=crSQLWait;
      // DOWNLOAD.
      IdFTP.GET(PChar(NomeArquivo),PChar(DownDestino), True);

      Screen.Cursor:=crDefault;
    except
      DownDestino := '';
      Screen.Cursor:=crDefault;
      Mens_MensErro('Erro Carregando Imagem!');
      Exit;
    end;

  Screen.Cursor:=crDefault;
  IdFTP.Disconnect;

  if FileExists(DownDestino) then
  begin
    if Pos('JPG', UpperCase(DownDestino)) > 0 then
    begin
      try
        imgVisualiza.Picture.LoadFromFile(DownDestino);
        Exit;
      except
        Mens_MensErro('Erro Carregando Imagem!');
        Exit;
      end;

//      Mens_MensInf('Download concluído!');
    end
    else
      shellExecute(Handle, 'Open', PChar(DownDestino), nil, nil, sw_shownormal);
  end;
end;

Function TFCapImagem.UPLoad(NomeArquivo : String; Arquivo : String) : Boolean;
function TamArquivo(Arquivo: string): Integer;
begin
  with TFileStream.Create(Arquivo, fmOpenRead or fmShareExclusive) do
    try
      Result := Size;
    finally
       Free;
  end;
end;

Var
  dirDestino,  PastaLocal,  DiretorioDoArqOrigem : String;
  Tamanho_Arquivo : Integer;
begin
  Result := False;

  DirDestino := 'web/update/imagens/' + FormatFloat('00', Mes) + '-' + FormatFloat('00', Ano) + '/';

  try
    IdFTP.Username := 'travelcash';
    IdFTP.Password := 'qawsed105';
    IdFTP.Host     := '201.76.48.45';
    IdFTP.Connect;
    IdFTP.ChangeDir(dirDestino);
  except
    IdFTP.Disconnect;
    Mens_MensErro('Erro Conectando FTP. ');
    Exit;
  end;

  ProgessArquivo.Position := 0;
  grpProcesso.Visible     := True;

  try
    // UPLOAD.
    IdFTP.Put(Arquivo, NomeArquivo);
    // DeleteFile( ArquivoZipado );
  except
    Mens_MensInf('Erro na transmissão do arquivo.');
    IdFTP.Disconnect;
    Exit;
  end;

  IdFTP.Disconnect;

  {
  Tamanho_Arquivo := IdFTP.Size(NomeArquivo);

  if Tamanho_Arquivo = 0 then
  begin
    Mens_MensInf('Arquivo JPG Com Tamanho (0), Pode Ter Ocorrido Erro Durante UPLoad da Imagem. Excute UPLoad da Imagem Novamente !');
    IdFTP.Delete(NomeArquivo);
    Exit;
  end;
}
  Result := True;
  grpProcesso.Visible := False;

  Mens_MensInf('Arquivo ' +  Arquivo + ' Salvo Com Sucesso !');
end;

procedure TFCapImagem.SpeedButton2Click(Sender: TObject);
Var
  Msg : TIdMessage;
  x   : Integer;
  EmailAtual : String;
  i: integer;
  ARowIndex: integer;
  ARowInfo: TcxRowInfo;

begin
  inherited;
  qryEmail.First;

  if (DBGrid2.SelectedRows.Count = 0) or (qryEmail.RecordCount = 0) then
  begin
    Mens_MensInf('Nenhum E-mail Selecionado!');
    cxGrid1.SetFocus;
    Exit;
  end;
{
  if (cxGrid1DBTableView1.SelectedRows.Count = 0) or (qryVisualiza.RecordCount = 0) then
  begin
    Mens_MensInf('Nenhuma Imagem Selecionada!');
    Exit;
  end;
}
  if (Mens_MensConf('Confirma Envio de E-mail Para o(s) Cliente(s) Selecionado(s) ?') <> mrOk) then
    Exit;

   try
     SMTP.Host := 'mail.turismo10.com';
     SMTP.Username := 'sistema@turismo10.com';
     SMTP.Password := 'sis123r@';

     try
       SMTP.Connect(-1);
     except
       Raise;
     end;

     SMTP.AuthenticationType := atLogin;
     SMTP.Authenticate;
     Msg := TIdMessage.Create(Application);
     Msg.Clear;
     Msg.Subject := 'Comprovante de remessa - Banco Paulista - Swift';

     Msg.Body.Add('');
     Msg.Body.Add('');
     Msg.Body.Add('Segue abaixo o link para download e impressão do comprovante de remessa (SWIFT) do Banco Paulista SA.');
     Msg.Body.Add('Referente ao contrato No ' + FrmConcCambio.nSwift );

     Msg.Body.Add('(obs: salvar o comprovante pois o link estará disponível por 15 dias) ');
     Msg.Body.Add('');

     with cxGrid1DBTableView1.DataController do
     begin
       for i := 0 to Pred(GetSelectedCount) do
       begin
         ARowIndex := GetSelectedRowIndex(i); // retorna o índice da linha selecionada
         ARowInfo  := GetRowInfo(ARowIndex); // retorna informação da linha selecionada
         if VarToStr(Values[ARowInfo.RecordIndex, cxGrid1DBTableView1Pasta.index]) <> '' then
           Msg.Body.Add('http://www.travelcash.com.br/update/imagens/' + VarToStr(Values[ARowInfo.RecordIndex, cxGrid1DBTableView1Pasta.index]) + '/' + VarToStr(Values[ARowInfo.RecordIndex, cxGrid1DBTableView1FTPArquivo.index]) )
         else
           Msg.Body.Add('http://www.travelcash.com.br/update/imagens/' + VarToStr(Values[ARowInfo.RecordIndex, cxGrid1DBTableView1FTPArquivo.index]) );
       end;
     end;

{     for x := 1 to qryVisualiza.RecordCount do
     begin

       if DBGrid1.SelectedRows.CurrentRowSelected then
       begin
         if qryVisualizaPasta.AsString <> '' then
           Msg.Body.Add('http://www.travelcash.com.br/update/imagens/' + qryVisualizaPasta.AsString + '/' + qryVisualizaFTPArquivo.AsString )
         else
           Msg.Body.Add('http://www.travelcash.com.br/update/imagens/' + qryVisualizaFTPArquivo.AsString );
       end;

       qryVisualiza.Next;
     end;
}
     Msg.From.Text := 'finance@travelcash.com.br';

     Msg.BccList.Add.Address       := 'finance@travelcash.com.br';

     if DBGrid2.SelectedRows.Count > 1 then
     begin
       EmailAtual := qryEmailemail.AsString;
       Msg.Recipients.EMailAddresses := EmailAtual;

       qryEmail.first;
       For x := 1 to qryEmail.RecordCount do
       begin
         if (DBGrid2.SelectedRows.CurrentRowSelected) and (EmailAtual <> qryEmailemail.AsString) then
           Msg.BccList.Add.Address       := qryEmailemail.AsString;

         qryEmail.Next;
       end;
     end
     else
     begin

       qryEmail.first;
       For x := 1 to qryEmail.RecordCount do
       begin
         if (DBGrid2.SelectedRows.CurrentRowSelected) then
           Msg.Recipients.EMailAddresses := qryEmailemail.AsString;
         qryEmail.Next;
       end;

     end;


     Msg.Body.Add('');
     Msg.Body.Add('Atenciosamente, ');
     Msg.Body.Add('');
     Msg.Body.Add('TravelCash by Banco Paulista ');
     Msg.Body.Add('www.travelcash.com.br ');
     Msg.Body.Add('55 11 3085.3555 ');

     SMTP.Send(Msg);
     SMTP.Disconnect;
     Msg.Free;
   except;
     Mens_MensInf('Problemas no envio do email para o Cliente!') ;
     SMTP.Disconnect;
     pnlEmail.Visible := False;
     exit ;
   end;

   Mens_MensInf('E-mail Enviado com Sucesso!') ;
   pnlEmail.Visible := False;

end;

procedure TFCapImagem.rsFlyOverButton2Click(Sender: TObject);
begin
  pnlEmail.Visible := False;

end;

procedure TFCapImagem.rsFlyOverButton1Click(Sender: TObject);
begin
  if (Pos('@', EdiInsEmail.Text) = 0) then
  begin
    Mens_MensInf('E-mail inválido !');
    EdiInsEmail.SetFocus;
    Exit;
  end;

  if (Trim(EdiContato.Text) = '') then
  begin
    Mens_MensInf('Contato não Informado !');
    EdiContato.SetFocus;
    Exit;
  end;

  if (Trim(EdiInsEmail.Text) <> '') and (Trim(EdiContato.Text) <> '') then
  begin
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('Insert into email (codcliente, email,Contato) values (:codcliente, :email, :Contato) ');
    qryAux.ParamByName('CodCliente').AsString := qryVisualizaCodCliente.AsString ;
    qryAux.ParamByName('email').AsString      := EdiInsEmail.Text ;
    qryAux.ParamByName('Contato').AsString    := EdiContato.Text ;
    try
      qryAux.ExecSQL;
    except
      Mens_MensErro('Erro Incluindo E-mail !');
    End;
  end;

  qryEmail.Close;
  qryEmail.ParamByName('codcliente').AsString := qryVisualizaCodCliente.AsString ;
  qryEmail.Open;
end;

procedure TFCapImagem.rsFlyOverButton3Click(Sender: TObject);
begin
  if (Trim(qryEmailcodcliente.AsString) <> '') and (Trim(qryEmailContato.AsString) <> '') then
  begin
    if Mens_MensConf('Confirma Exclusão do E-mail ?') <> mrOk then
      Exit;

    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('delete from email where codcliente = :codcliente and Contato = :Contato ');
    qryAux.ParamByName('codcliente').AsString := qryEmailcodcliente.AsString;
    qryAux.ParamByName('contato').AsString    := qryEmailContato.AsString;
    try
      qryAux.ExecSQL;
    except
      Mens_MensErro('Erro Excluindo E-mail !');
    End;

    qryEmail.Close;
    qryEmail.ParamByName('codcliente').AsString := qryVisualizaCodCliente.AsString ;
    qryEmail.Open;
  end;
end;

procedure TFCapImagem.spbEmailClick(Sender: TObject);
begin
  pnlEmail.Left := 170;
  pnlEmail.top  := 110;
  pnlEmail.Visible := True;

  qryEmail.Close;
  qryEmail.ParamByName('codcliente').AsString := qryVisualizaCodCliente.AsString ;
  qryEmail.Open;
end;

procedure TFCapImagem.butSubirArquivosClick(Sender: TObject);
var
 i, m, Ope_ID : Integer;

begin

  if Arquivos.SelCount = 0 then
  begin
    Mens_MensInf('Nenhuma Arquivo Selecionado ! ');
    Exit;
  end;

  if Assigned(FrmConcCambio) then
  begin
    if FrmConcCambio.GridRx.SelectedRows.Count > 1 then
    begin
      FrmConcCambio.QGrid.First;
      while not FrmConcCambio.QGrid.Eof do
      begin
        if FrmConcCambio.GridRx.SelectedRows.CurrentRowSelected then
          Break
        else
          FrmConcCambio.QGrid.Next;
      end;
    end;

    Ope_Id := FrmConcCambio.QGridOpe_ID.AsInteger;

    for i := 0 to Arquivos.Items.Count - 1 do
    begin
      if Arquivos.Selected[i] then
      begin

        if Not UPLoad(EspacoBranco(Arquivos.Items.Strings[i]), Arquivos.Directory + '\' +  Arquivos.Items.Strings[i] ) then
          Continue;

        FrmTipoImagem := TFrmTipoImagem.Create(Self);
        FrmTipoImagem.lblOrigemImg.Caption := Arquivos.Directory + '\' +  Arquivos.Items.Strings[i] ;
        if cxGrid1Level2.Active then
          FrmTipoImagem.TipoPessoa := 'F'
        else
          FrmTipoImagem.TipoPessoa := TipoPessoa(qryVisualizaCodCliente.AsString);
        FrmTipoImagem.ShowModal;

        if FrmTipoImagem.Tag = 0 then
        begin
          Mens_MensInf('Tipo Não Informado !');
          Break;
          Exit;
        end
        else
        begin
          CodTipoDoc := FrmTipoImagem.qryTipoDoctoCodTipoDoc.AsString;
          DataDocto  := 0;
          DataVecto  := 0;
          if FrmTipoImagem.qryTipoDocto.FieldByName('Data').AsString = 'S' then
            DataDocto := FrmTipoImagem.EdiData.Date;
          if FrmTipoImagem.qryTipoDocto.FieldByName('Vencimento').AsString = 'S' then
            DataVecto := FrmTipoImagem.EdiVecto.Date;
        end;
        FrmTipoImagem.Release;


        For m := 1 to FrmConcCambio.GridRx.SelectedRows.Count do
        begin
          qryAux2.Close;
          qryAux2.SQL.Clear;
          qryAux2.SQL.Add('INSERT INTO ClienteImagem (numdoc, CodCliente, NomeArquivo, FTPArquivo, Ope_ID, Origem, Extensao, Pasta, ID_Socio, CodTipoDocumento ');
          if DataDocto <> 0 then
            qryAux2.SQL.Add(', DataDocto ');
          if DataVecto <> 0 then
            qryAux2.SQL.Add(', DataVencto ');

          qryAux2.SQL.Add(' ) ');
          qryAux2.SQL.Add('VALUES (:numdoc, :CodCliente, :NomeArquivo, :FTPArquivo, :Ope_ID, :Origem, :Extensao, :Pasta, :ID_Socio, :CodTipoDocumento ');
          if DataDocto <> 0 then
            qryAux2.SQL.Add(', :DataDocto ');
          if DataVecto <> 0 then
            qryAux2.SQL.Add(', :DataVencto ');
          qryAux2.SQL.Add(' ) ');
          qryAux2.ParamByName('numdoc').AsInteger      := StrToInt(LastCodigo('numdoc', 'clienteimagem', 'where codcliente = ''' + FrmConcCambio.QGridCodCliente.AsString + '''' ));
          qryAux2.ParamByName('CodCliente').AsString   := FrmConcCambio.QGridCodCliente.AsString;
          qryAux2.ParamByName('NomeArquivo').AsString  := EditSPict.Text;
          qryAux2.ParamByName('FTPArquivo').AsString   := EspacoBranco(Arquivos.Items.Strings[i]);
          qryAux2.ParamByName('Extensao').AsString     := Copy(Arquivos.Items.Strings[i], Length(Arquivos.Items.Strings[i])-3, 4) ;
          qryAux2.ParamByName('Ope_Id').AsString       := FrmConcCambio.QGridOpe_ID.AsString;
          qryAux2.ParamByName('Origem').AsString       := Copy(FrmConcCambio.QGridTabela.AsString,1,1);
          qryAux2.ParamByName('Pasta').AsString        := FormatFloat('00', Mes) + '-' + FormatFloat('00', Ano);
          if cxGrid1Level2.Active then
            qryAux2.ParamByName('ID_Socio').AsInteger       := qrySociosIdSocio.AsInteger
          else
            qryAux2.ParamByName('ID_Socio').AsInteger       := 0;
          qryAux2.ParamByName('CodTipoDocumento').AsString  := CodTipoDoc;
          if DataDocto <> 0 then
            qryAux2.ParamByName('DataDocto').AsDateTime  := DataDocto;
          if DataVecto <> 0 then
            qryAux2.ParamByName('DataVencto').AsDateTime := DataVecto;
          qryAux2.ExecSQL;

          FrmConcCambio.QGrid.Next;
        end;

        FrmConcCambio.QGrid.Locate('Ope_ID', Ope_Id, []);
      end;
    end;

    qryVisualiza.Close;
    qryVisualiza.Sql.Clear;
    qryVisualiza.Sql.Add('select * from clienteimagem Left Join TipoDoc on CodTipoDocumento = CodTipoDoc ');
    qryVisualiza.Sql.Add('where ((Ope_Id = :Ope_Id) or (cnpj_cic = :cnpj_cic)) and Origem = :Origem ');
    if cxGrid1Level2.Active then
      qryVisualiza.Sql.Add('and ((ID_Socio is not null) and (ID_Socio <> 0))   ')
    else
      qryVisualiza.Sql.Add('and ((ID_Socio is null) or (ID_Socio = 0)) and Origem = :Origem ');
    qryVisualiza.Sql.Add('order by numdoc ');
    qryVisualiza.ParamByName('Ope_Id').AsString   := FrmConcCambio.QGridOpe_ID.AsString;
    qryVisualiza.ParamByName('cnpj_cic').AsString := CNPJ;
    qryVisualiza.ParamByName('Origem').AsString   := Copy(FrmConcCambio.QGridTabela.AsString,1,1);
    qryVisualiza.Open;
  end
  else if Assigned(FrmCliente) then
  begin
    // Imagem tela cliente
    for i := 0 to Arquivos.Items.Count - 1 do
    begin
      if Arquivos.Selected[i] then
      begin

        if Not UPLoad(EspacoBranco(Arquivos.Items.Strings[i]), Arquivos.Directory + '\' +  Arquivos.Items.Strings[i] ) then
          Continue;

        qryAux2.Close;
        qryAux2.SQL.Clear;
        qryAux2.SQL.Add('INSERT INTO ClienteImagem (numdoc, CodCliente, NomeArquivo, FTPArquivo, Ope_ID, Origem, Extensao, Pasta, ID_Socio, CodTipoDocumento ');
        if DataDocto <> 0 then
          qryAux2.SQL.Add(', DataDocto ');
        if DataVecto <> 0 then
          qryAux2.SQL.Add(', DataVencto ');

        qryAux2.SQL.Add(' ) ');
        qryAux2.SQL.Add('VALUES (:numdoc, :CodCliente, :NomeArquivo, :FTPArquivo, :Ope_ID, :Origem, :Extensao, :Pasta, :ID_Socio, :CodTipoDocumento ');
        if DataDocto <> 0 then
          qryAux2.SQL.Add(', :DataDocto ');
        if DataVecto <> 0 then
          qryAux2.SQL.Add(', :DataVencto ');
        qryAux2.SQL.Add(' ) ');
        qryAux2.ParamByName('numdoc').AsInteger      := StrToInt(LastCodigo('numdoc', 'clienteimagem', 'where codcliente = ''' + CodCliente + '''' ));
        qryAux2.ParamByName('CodCliente').AsString   := CodCliente ;
        qryAux2.ParamByName('NomeArquivo').AsString  := EditSPict.Text;
        qryAux2.ParamByName('FTPArquivo').AsString   := EspacoBranco(Arquivos.Items.Strings[i]);
        qryAux2.ParamByName('Extensao').AsString     := Copy(Arquivos.Items.Strings[i], Length(Arquivos.Items.Strings[i])-3, 4) ;
        qryAux2.ParamByName('Ope_Id').AsInteger      := 0;
        qryAux2.ParamByName('Origem').AsString       := 'I';
        qryAux2.ParamByName('Pasta').AsString        := FormatFloat('00', Mes) + '-' + FormatFloat('00', Ano);
        if cxGrid1Level2.Active then
          qryAux2.ParamByName('ID_Socio').AsInteger       := qrySociosIdSocio.AsInteger
        else
          qryAux2.ParamByName('ID_Socio').AsInteger       := 0;
        qryAux2.ParamByName('CodTipoDocumento').AsString  := CodTipoDoc;
        if DataDocto <> 0 then
          qryAux2.ParamByName('DataDocto').AsDateTime  := DataDocto;
        if DataVecto <> 0 then
          qryAux2.ParamByName('DataVencto').AsDateTime := DataVecto;
        qryAux2.ExecSQL;
      end;
    end;


    qryVisualiza.Close;
    qryVisualiza.Sql.Clear;
    qryVisualiza.Sql.Add('select * from clienteimagem Left Join TipoDoc on CodTipoDocumento = CodTipoDoc ');
    qryVisualiza.Sql.Add('where ((cnpj_cic = :cnpj_cic) or ((CodCliente = :CodCliente) and (Origem = ''I''))) ');
    if cxGrid1Level2.Active then
      qryVisualiza.Sql.Add('and ((ID_Socio is not null) and (ID_Socio <> 0))   ')
    else
      qryVisualiza.Sql.Add('and ((ID_Socio is null) or (ID_Socio = 0))  ');
    qryVisualiza.Sql.Add('order by cnpj_cic, numdoc ');
    qryVisualiza.ParamByName('cnpj_cic').AsString   := CNPJ ;
    qryVisualiza.ParamByName('CodCliente').AsString := CodCliente ;
    qryVisualiza.Open;

  end;
end;

procedure TFCapImagem.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbDelete then
  begin
    if Mens_MensConf('Confirma Exclusão  ?') <> mrOk then
    begin
      Abort;
      Exit;
    end;
    if qryVisualizaPasta.AsString <> '' then
    begin
      try
        IdFTP.Disconnect;
        IdFTP.Username := 'travelcash';
        IdFTP.Password := 'qawsed105';
        IdFTP.Host     := '201.76.48.45';
        IdFTP.Connect;
        IdFTP.ChangeDir('Web/update/imagens/' + qryVisualizaPasta.AsString);
      except
        IdFTP.Disconnect;
        Exit;
      end;

      try
         IdFTP.Delete(qryVisualizaFTPArquivo.AsString);
      Except
      end;
      IdFTP.Disconnect;

      imgVisualiza.Picture  := nil;
      Image.Picture         := nil;
      imgDocumento.Picture  := nil;
    end;
  end;
end;

procedure TFCapImagem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FilterGraph.Active := false;
  ExcluirArquivosTemp;
end;

procedure TFCapImagem.ExcluirArquivosTemp;
var
  SR: TSearchRec;
  I: integer;
begin
  I := FindFirst('c:\Windows\Temp\*.jpg', faAnyFile, SR);
  while I = 0 do begin
    if (SR.Attr and faDirectory) <> faDirectory then
      if not DeleteFile('c:\Windows\Temp\' + SR.Name) then
        ShowMessage('Erro Excluindo Arquivos Temporários !' + SR.Name);
    I := FindNext(SR);
  end;

  I := FindFirst('c:\Windows\Temp\*.pdf', faAnyFile, SR);
  while I = 0 do begin
    if (SR.Attr and faDirectory) <> faDirectory then
      if not DeleteFile('c:\Windows\Temp\' + SR.Name) then
        ShowMessage('Erro Excluindo Arquivos Temporários !' + SR.Name);
    I := FindNext(SR);
  end;
end;

procedure TFCapImagem.OnSelectDevice(sender: TObject);
begin
  FilterGraph.ClearGraph;
  FilterGraph.Active := false;
  Filter.BaseFilter.Moniker := SysDev.GetMoniker(cmbCamera.ItemIndex);
  FilterGraph.Active := true;
  with FilterGraph as ICaptureGraphBuilder2 do
    RenderStream(@PIN_CATEGORY_PREVIEW, nil, Filter as IBaseFilter, SampleGrabber as IBaseFilter, VideoWindow as IbaseFilter);
  FilterGraph.Play;
end;

procedure TFCapImagem.cmbCameraClick(Sender: TObject);
begin
  if (not FilterGraph.Active) and (cmbCamera.ItemIndex <> -1) then
    OnSelectDevice(cmbCamera);
end;

Function TFCapImagem.EspacoBranco(Nome: String) : String ;
var
  x : integer;
  retorno : String;
begin
  retorno := '';

  if (trim(Nome) <> '') then
  begin
    for x := 1 to length(Nome) do
    begin
      if (copy(Nome,x,1) = ' ') then
        retorno := retorno + '_'
      else
        retorno := retorno + copy(Nome,x,1);
    end;
  end
  else
    Retorno := '';

  Result := retorno;
end;

procedure TFCapImagem.ImageMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ClickPos.x := X;
  ClickPos.y := Y;
end;

procedure TFCapImagem.ImageMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  NewPos: TPoint;
begin
  {The left button was pressed}
  if ssLeft in Shift then
  begin
    {Calculate new position}
    NewPos.X := Image.Left + x - ClickPos.x;
    NewPos.Y := Image.Top + y - ClickPos.y;
    if NewPos.x + Image.Width < ContainImage.Width then
      NewPos.x := ContainImage.Width - Image.Width;
    if NewPos.y + Image.Height < ContainImage.Height then
      NewPos.y := ContainImage.Height - Image.Height;
    if NewPos.X > 0 then NewPos.X := 0;
    if NewPos.Y > 0 then NewPos.Y := 0;

    Image.Top := NewPos.Y;
    Image.Left := NewPos.X;
  end {if ssLeft in Shift}
end;

procedure TFCapImagem.ScrollBox1Resize(Sender: TObject);
begin
  ClickPos.X := 0; ClickPos.Y := 0;
  ImageMouseMove(Self, [ssLeft], 0, 0);
end;

procedure TFCapImagem.cxButton1Click(Sender: TObject);
begin
  if (not FilterGraph.Active) and (cmbCamera.ItemIndex <> -1) then
    OnSelectDevice(cmbCamera);
end;

procedure TFCapImagem.imgVisualizaMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ClickPosPreview.x := X;
  ClickPosPreview.y := Y;
end;

procedure TFCapImagem.imgVisualizaMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  NewPos: TPoint;
begin
  {The left button was pressed}
  if ssLeft in Shift then
  begin
    {Calculate new position}
    NewPos.X := imgVisualiza.Left + x - ClickPosPreview.x;
    NewPos.Y := imgVisualiza.Top + y - ClickPosPreview.y;
    if NewPos.x + imgVisualiza.Width < ContainerPreview.Width then
      NewPos.x := ContainerPreview.Width - imgVisualiza.Width;
    if NewPos.y + imgVisualiza.Height < ContainerPreview.Height then
      NewPos.y := ContainerPreview.Height - imgVisualiza.Height;
    if NewPos.X > 0 then NewPos.X := 0;
    if NewPos.Y > 0 then NewPos.Y := 0;

    imgVisualiza.Top := NewPos.Y;
    imgVisualiza.Left := NewPos.X;
  end {if ssLeft in Shift}
end;

procedure TFCapImagem.ContainerPreviewResize(Sender: TObject);
begin
  ClickPosPreview.X := 0; ClickPosPreview.Y := 0;
  imgVisualizaMouseMove(Self, [ssLeft], 0, 0);
end;

procedure TFCapImagem.butDigitalizaClick(Sender: TObject);
begin
  if not Twain.SourceManagerLoaded then
  begin
    Mens_MensInf('Verifique se o Scanner está Ativo !') ;
    Exit;
  end;


  if JPG <> Nil then
  begin
    if Mens_MensConf('Digitalização Ainda Não Foi Salva. Deseja Abandonar ? ') <> mrOk then
      Exit;

    FreeAndNil(JPG);
    FreeAndNil(MemoryStream);
  end;


  {If user is already using Status menu}
  if Twain.LibraryLoaded then
  begin
    //Source must be loaded
//      Twain.Source[LoadedSource].TransferMode := Self.TransferMode;
      ClearImageList; {Clear list of images}
    try
      Twain.Source[LoadedSource].EnableSource(True, TRUE);
    Except
      Mens_MensInf('Não Foi Possivel Localizar o Scanner ! ');
      Exit;
    End;
  end
  else
  begin
    {Load library, source manager and source}
    try
      Twain.LoadLibrary;
      Twain.LoadSourceManager;
//      CurrentSource := Twain.SelectSource();
      Twain.Source[CurrentSource].Loaded := TRUE;
    Except
      Mens_MensInf('Não Foi Possivel Localizar o Scanner ! ');
      Exit;
    End;
    {Enable source}
    Twain.Source[CurrentSource].TransferMode := Self.TransferMode;
    ClearImageList; {Clear list of images}
    Twain.Source[CurrentSource].EnableSource(True, FALSE);
    while Twain.Source[CurrentSource].Enabled do Application.ProcessMessages;
    {Unload library}
    Twain.UnloadLibrary;
  end {if Twain.SourceLoaded}
end;

procedure TFCapImagem.TwainSourceFileTransfer(Sender: TObject;
  const Index: Integer; Filename: TW_STR255; Format: TTwainFormat;
  var Cancel: Boolean);
var
  LoadFileName: String;
begin
  {Set file}
  LoadFileName := includetrailingbackslash(getcurrentdir) + 'picture.bmp';
  {Load and add to list}
  ImageList.Add(TBitmap.Create);
  TBitmap(ImageList[ImageList.Count - 1]).LoadFromFile(LoadFilename);
  DeleteFile(LoadFileName);
  {In case it's the first image, display}
  if ImageList.Count >= 1 then SelectFirst;
end;

procedure TFCapImagem.TwainSourceSetupFileXfer(Sender: TObject;
  const Index: Integer);
begin
  Twain.Source[Index].SetupFileTransfer(
    includetrailingbackslash(getcurrentdir) + 'picture.bmp', tfBmp);
end;

procedure TFCapImagem.TwainTwainAcquire(Sender: TObject;
  const Index: Integer; Image: TBitmap; var Cancel: Boolean);
begin
  {An image has being acquired, add to list}
  ImageList.Add(TBitmap.Create);
  TBitmap(ImageList[ImageList.Count - 1]).Assign(Image);
  {In case it's the first image, display}
  if ImageList.Count = 1 then SelectFirst;

  JPG := TJpegImage.Create;
  JPG.Assign(Image);

  MemoryStream := TMemoryStream.Create;
  JPG.SaveToStream(MemoryStream);
end;

procedure TFCapImagem.ButSalvaDigitalizacaoClick(Sender: TObject);
Var
    Fl, Compl, NDAnterior, NomeArquivo, Destino : String;
    i: Integer;
begin
  if JPG = nil then
  begin
    Mens_MensInf('Não Existe Digitalização Para Salvar! ');
    Exit;
  end;

   Destino := (ExtractFilePath(Application.ExeName)) ;

    Compl := ''; Fl := ''; NomeArquivo := '';
    for i := 1 to 25 do begin
      if not FileExists( Destino + EspacoBranco(CodCliente) + Compl + '.jpg') then
         begin
           Fl := Destino + EspacoBranco(CodCliente) + Compl + '.jpg';
           NomeArquivo := EspacoBranco(CodCliente) + Compl + '.jpg';
           Break;
         end
       else
         Compl := '_' + IntToStr(i); // Complemento(i);
    end;

    Try
      JPG.SaveToFile( Fl );
    Except
      Mens_MensErro('Erro Salvando Arquivo: ' + Fl + '!');
      Exit;
    End;


    if Not UPLoad(NomeArquivo, Fl ) then
      Exit;
{
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('INSERT INTO ClienteImage (CodCliente, Descricao, FTPArquivo, Pasta, tipoimagem ) ');
    qryAux.SQL.Add('VALUES (:CodCliente, :Descricao, :FTPArquivo, :Pasta, :tipoimagem )');
    qryAux.ParamByName('CodCliente').AsString   := (EdiCodigo.Text);
    qryAux.ParamByName('tipoimagem').AsString   := 'F';
    qryAux.ParamByName('Descricao').AsString    := dbcbDocumento.Text;
    qryAux.ParamByName('FTPArquivo').AsString   := NomeArquivo;
    qryAux.ParamByName('Pasta').AsString        := FormatFloat('00', Mes) + '-' + FormatFloat('00', Ano);
    qryAux.ExecSQL;
    qryAux.Close;
}

    Mens_MensInf('Arquivo Salvo Com Sucesso: ' + Fl + '!');
{
    //mostra no grid os documentos
    qryImagem.Close;
    qryImagem.Sql.Clear;
    qryImagem.Sql.Add('select * from ClienteImage ');
    qryImagem.Sql.Add('where CodCliente = :CodCliente ');
    qryImagem.Sql.Add('order by Descricao ');
    qryImagem.ParamByName('CodCliente').AsString   := EdiCodigo.Text;
    qryImagem.Open;
    qryImagem.First;
}
    FreeAndNil(JPG);
    FreeAndNil(MemoryStream);
end;

procedure TFCapImagem.ClearImageList;
var
  I: integer;
begin
  {Free each bitmap and then clear list}
  FOR i := 0 TO ImageList.Count - 1 DO
    TBitmap(ImageList[i]).Free;
  ImageList.Clear;
end;

procedure TFCapImagem.SelectFirst;
begin
  imgDocumento.Picture.Assign(TBitmap(ImageList[0]));
  Inc(CurrentImage);
  imgDocumento.SetBounds(0, 0, 0, 0);
end;

procedure TFCapImagem.IdFTPWork(Sender: TObject; AWorkMode: TWorkMode;
  const AWorkCount: Integer);
begin
  ProgessArquivo.Position := AWorkCount;
  Application.ProcessMessages;
end;

procedure TFCapImagem.IdFTPWorkBegin(Sender: TObject; AWorkMode: TWorkMode;
  const AWorkCountMax: Integer);
begin
  ProgessArquivo.Properties.Max := AWorkCountMax;
  ProgessArquivo.Position := 0;
//  ProgessArquivo.Visible := True;
  Application.ProcessMessages;
end;

procedure TFCapImagem.IdFTPWorkEnd(Sender: TObject; AWorkMode: TWorkMode);
begin
  Application.ProcessMessages;
//  ProgessArquivo.Visible := False;
end;

procedure TFCapImagem.PageChange(Sender: TObject);
begin
  ProgessArquivo.Position := 0;

  if Page.ActivePage = tabCamera then
  begin
    if (Not FilterGraph.Active) and (cmbCamera.ItemIndex <> -1) then
       OnSelectDevice(cmbCamera);
  end;
end;

procedure TFCapImagem.cxButton3Click(Sender: TObject);
begin
  if IdFTP.Connected then
  begin
    grpProcesso.Visible := False;

    IdFTP.Abort;
    IdFTP.Disconnect;

  end;

end;

procedure TFCapImagem.cxGrid1DBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if cxGrid1DBTableView1.DataController.GetSelectedCount > 1 then
    Exit;

  if (qryVisualiza.RecordCount = 0) or (Not qryVisualiza.Active) then Exit;

  ClickPosPreview.X := 0; ClickPosPreview.Y := 0;
  imgVisualizaMouseMove(Self, [ssLeft], 0, 0);

  if (UpperCase(qryVisualizaExtensao.AsString) <> '.JPG') and (qryVisualizaExtensao.AsString <> '') and (qryVisualizaExtensao.AsString <> Null) then
    DownLoad(qryVisualizaFTPArquivo.AsString, qryVisualizaPasta.AsString)
  else if (qryVisualizaFTPArquivo.AsString <> '') and (qryVisualizaOpe_Id.AsString <> '') then
    DownLoad(qryVisualizaFTPArquivo.AsString, qryVisualizaPasta.AsString)
  else
  begin
    if Page.ActivePage = tabCamera then
      Le_Imagem_JPEG(qryVisualizadocumento, Image)
    else
      Le_Imagem_JPEG(qryVisualizadocumento, imgVisualiza);
  end;

end;

procedure TFCapImagem.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
  if (UpperCase(qryVisualizaExtensao.AsString) = '.JPG') and (qryVisualizaFTPArquivo.AsString <> '') then
    shellExecute(Handle, 'Open', PChar('C:\Windows\Temp\' + qryVisualizaFTPArquivo.AsString), nil, nil, sw_shownormal)
  else
  if (((UpperCase(qryVisualizaExtensao.AsString) <> '.PDF') and (UpperCase(qryVisualizaExtensao.AsString) <> '.JPG')) or (qryVisualizadocumento.AsString <> null))  then
  begin
    frmImpImagem := TfrmImpImagem.Create(Self);
    frmImpImagem.QRImage1.Picture.Assign(imgVisualiza.Picture);
    frmImpImagem.QuickRep1.PreviewModal;
    frmImpImagem.Release;
  end;
end;

procedure TFCapImagem.cxButton5Click(Sender: TObject);
begin
  if CodCliente = '' then
  begin
    Mens_MensErro('Erro Localizando Código do Cliente !');
    Exit;
  end;


    qryVisualiza.Close;
    qryVisualiza.Sql.Clear;
    qryVisualiza.Sql.Add('select * from ClienteImagem  Left Join TipoDoc on CodTipoDocumento = CodTipoDoc ');
    qryVisualiza.Sql.Add('where (CodCliente = :CodCliente) ');
    if cxGrid1Level2.Active then
      qryVisualiza.Sql.Add('and ((ID_Socio is not null) and (ID_Socio <> 0)) ') //and Origem = :Origem ')
    else
      qryVisualiza.Sql.Add('and ((ID_Socio is null) or (ID_Socio = 0)) ') ; //and Origem = :Origem ');
    qryVisualiza.Sql.Add('order by cnpj_cic, numdoc  ');
//    qryVisualiza.ParamByName('Origem').AsString     := Copy(FrmConcCambio.QGridTabela.AsString,1,1);
    qryVisualiza.ParamByName('CodCliente').AsString := CodCliente ;
    qryVisualiza.Open;

end;

procedure TFCapImagem.cxGrid1ActiveTabChanged(Sender: TcxCustomGrid;
  ALevel: TcxGridLevel);
begin

    qrySocios.Close;
    qrySocios.Sql.Clear;
    qrySocios.Sql.Add('select * from Socios ');
    qrySocios.Sql.Add('where CodCliente = :CodCliente  ');
    qrySocios.ParamByName('CodCliente').AsString := CodCliente;
    qrySocios.Open;

    qryVisualiza.Close;
    qryVisualiza.Sql.Clear;
    qryVisualiza.Sql.Add('select * from clienteimagem Left Join TipoDoc on CodTipoDocumento = CodTipoDoc ');
    qryVisualiza.Sql.Add('where cnpj_cic = :cnpj_cic '); //and Origem = :Origem
    if cxGrid1Level2.Active then
      qryVisualiza.Sql.Add('and ((ID_Socio is not null) and (ID_Socio <> 0))   ')
    else
      qryVisualiza.Sql.Add('and ((ID_Socio is null) or (ID_Socio = 0))  ');
    qryVisualiza.Sql.Add('order by cnpj_cic, numdoc ');
    qryVisualiza.ParamByName('cnpj_cic').AsString := CNPJ ;
    qryVisualiza.Open;


end;

function TFCapImagem.TipoPessoa(Cliente: String): string;
begin
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('Select FisJur From Cliente Where CodCliente = ''' + Cliente + '''' );
  qryAux.Open;
  Result := qryAux.FieldByName('FisJur').AsString;
  qryAux.Close;
end;

procedure TFCapImagem.cxButton6Click(Sender: TObject);
begin
  if Mens_MensConf('Confirma Exclusão  ?') <> mrOk then
    Exit;

  if qryVisualizaCodCliente.AsString = '' then
    Exit;

  if qryVisualizaPasta.AsString <> '' then
  begin
    try
      IdFTP.Disconnect;
      IdFTP.Username := 'travelcash';
      IdFTP.Password := 'qawsed105';
      IdFTP.Host     := '201.76.48.45';
      IdFTP.Connect;
      IdFTP.ChangeDir('Web/update/imagens/' + qryVisualizaPasta.AsString);
    except
      IdFTP.Disconnect;
      Exit;
    end;

    try
       IdFTP.Delete(qryVisualizaFTPArquivo.AsString);
    Except
    end;
    IdFTP.Disconnect;

    imgVisualiza.Picture  := nil;
    Image.Picture         := nil;
    imgDocumento.Picture  := nil;
  end;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('Delete From ClienteImagem ');
  qryAux.SQL.Add('Where CodCliente = ''' + qryVisualizaCodCliente.AsString + ''' and Numdoc = ''' + qryVisualizanumdoc.AsString + ''''  );
  qryAux.SQL.Add(' and DataInclusao = :DtInc ');
  qryAux.ParamByName('DtInc').AsDateTime := qryVisualizaDataInclusao.AsDateTime;
  try
    qryAux.ExecSQL;
  except
    Mens_MensErro('Erro Excluindo Imagem !');
  end;

  qryVisualiza.Close;
  qryVisualiza.Sql.Clear;
  qryVisualiza.Sql.Add('select * from clienteimagem Left Join TipoDoc on CodTipoDocumento = CodTipoDoc ');
  qryVisualiza.Sql.Add('where ((cnpj_cic = :cnpj_cic) or (codcliente = :codcliente)) '); //and Origem = :Origem
  if cxGrid1Level2.Active then
    qryVisualiza.Sql.Add('and ((ID_Socio is not null) and (ID_Socio <> 0))  ')
  else
    qryVisualiza.Sql.Add('and ((ID_Socio is null) or (ID_Socio = 0))  ');
  qryVisualiza.Sql.Add('order by cnpj_cic, numdoc ');
  qryVisualiza.ParamByName('cnpj_cic').AsString    := CNPJ ;
  qryVisualiza.ParamByName('codcliente').AsString  := CodCliente;
  qryVisualiza.Open;

  qrySocios.Close;
  qrySocios.Sql.Clear;
  qrySocios.Sql.Add('select * from Socios ');
  qrySocios.Sql.Add('where CodCliente = :CodCliente  ');
  qrySocios.ParamByName('CodCliente').AsString := CodCliente;
  qrySocios.Open;

end;

end.




