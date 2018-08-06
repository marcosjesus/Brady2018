unit FGrid ;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Variants,
  ToolWin, ComCtrls, StdCtrls, ExtCtrls, Mask, rsEdit, RseditDB, ComOBJ,
  Buttons, SqlTableFun, rsFlyovr, Db, DBTables, Grids, DBGrids, jpeg,
  Menus, FMTBcd, SqlExpr, DBClient, Provider, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, cxControls, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinsdxStatusBarPainter,
  dxStatusBar, cxButtons, CxGrid, cxGridDBTableView, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint,
  cxSplitter, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client ;

type
  TFrmGrid = class(TForm)
    PanFundo: TPanel;
    PanTitulo: TPanel;
    LabCadTit: TLabel;
    ImaBarraSup: TImage;
    DSGrid: TDataSource;
    ToolBar: TToolBar;
    TimerCad: TTimer;
    ButEscape: TcxButton;
    ButImprimir: TcxButton;
    ButSair: TcxButton;
    StatusBar: TdxStatusBar;
    dspGrid: TDataSetProvider;
    cdsGrid: TClientDataSet;
    ToolButton1: TToolButton;
    ButPesquisar: TcxButton;
    QGrid: TFDQuery;
    procedure ButSairClick(Sender: TObject);
    procedure ButEscapeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TimerCadTimer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
    procedure GridColEnter(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    NumFields : Integer ;
  public
    { Public declarations }
    Tab : TSQLTableClass ;
    FormTabela : String ;
    FormVarFind : String ;
    FormValueKey : String ;
    FormOperacao : String ;
    function DataSql(Data: String) :String;
    Procedure cxGridExcel(Grid : TcxGridDBTableView; Consulta : TClientDataSet);
    procedure ShowHints(Sender: TObject);
    Procedure CentralizaPainel( Painel : TPanel; Status : boolean);
  end;

var
  FrmGrid: TFrmGrid;

implementation

{$R *.DFM}

Uses
   Global, StrFun, ObjFun, MensFun, TestFun, ConsTabFun, Constantes,
   DBConect ;

Const

   TAG_FIELD    = -1 ;
   TAG_KEY      = -2 ;
   TAG_ESPCOMBO = -3 ;
   TAG_ALT_KEY  = -4 ;

procedure TFrmGrid.ButSairClick(Sender: TObject);
begin
   QGrid.Close ;
   Close ;
end;

procedure TFrmGrid.ButEscapeClick(Sender: TObject);
begin
   QGrid.Close ;
end;

procedure TFrmGrid.FormCreate(Sender: TObject);
begin
   Top  := 0;
   Left := 0;

   Tab := TSQLTableClass.Create ;
   FormValueKey := '' ;
   NumFields := 1 ;

   Application.OnHint:=ShowHints;

end;

procedure TFrmGrid.FormActivate(Sender: TObject);
begin
   If ( Not Glob_GetAccess(FormOperacao,'') ) Then
   Begin
       Mens_MensInf('Opera��o n�o liberada para o usu�rio') ;
       Tag := -1 ;
       TimerCad.Enabled := True ;
   End ;
end;

procedure TFrmGrid.FormShow(Sender: TObject);
begin
   If ( Not Tab.OpenTable(FormTabela) ) Then
   Begin
       Mens_MensErro(Tab.GetMensErro) ;
       Tag := -1 ;
       TimerCad.Enabled := True ;
   End ;
   FormVarFind := '' ;
end;

procedure TFrmGrid.TimerCadTimer(Sender: TObject);
begin
   If ( Tag = -1 ) Then
       Close ;
end;

procedure TFrmGrid.FormDestroy(Sender: TObject);
begin
   Application.OnHint := Nil;
   Tab.Destroy ;
end;

procedure TFrmGrid.GridCellClick(Column: TColumn);
begin
   FormVarFind := '' ;
end;

procedure TFrmGrid.GridColEnter(Sender: TObject);
begin
   FormVarFind := '' ;
end;

procedure TFrmGrid.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Self := NIL;
end;

function TFrmGrid.DataSql(Data: String): String;
begin
  if Copy(Data, 1, 1) = ' ' then
     Result := 'NULL'
  else
     Result := '''' + Copy(Data, 7, 4) + '-' + Copy(Data, 4, 2) + '-' + Copy(Data, 1, 2) + '''';
end;

procedure TFrmGrid.cxGridExcel(Grid: TcxGridDBTableView; Consulta: TClientDataSet);
var
Invisivel, coluna, linha: integer;
excel: variant;
valor: string;
begin
  try
    excel:=CreateOleObject('Excel.Application');
    excel.Workbooks.add(1);
  except
    Application.MessageBox ('Vers�o do Ms-Excel Incompat�vel','Erro',MB_OK+MB_ICONEXCLAMATION);
  end;

Grid.Columns[Grid.ColumnCount-1];

Consulta.First;
  try
    for linha:=0 to  Consulta.RecordCount-1 do
    begin
      Invisivel := 0;
      for coluna:=1 to (Grid.ColumnCount-1) + 1 do // eliminei a coluna 0 da rela��o do Excel
      begin
        if Grid.Columns[Coluna-1].Visible then
        begin
          if (Copy(Grid.DataController.DataSet.FieldByName(Grid.Columns[Coluna-1].DataBinding.FieldName).Origin,1,1) = '#') or
             (Copy(Grid.DataController.DataSet.FieldByName(Grid.Columns[Coluna-1].DataBinding.FieldName).Origin,1,1) = '##') or
             (Copy(Grid.DataController.DataSet.FieldByName(Grid.Columns[Coluna-1].DataBinding.FieldName).Origin,1,1) = '0') or
             (Copy(Grid.DataController.DataSet.FieldByName(Grid.Columns[Coluna-1].DataBinding.FieldName).Origin,1,1) = 'd') then
            excel.cells [linha+2,coluna-Invisivel].NumberFormat := Grid.DataController.DataSet.FieldByName(Grid.Columns[Coluna-1].DataBinding.FieldName).Origin;


          if (Grid.DataController.DataSet.FieldByName(Grid.Columns[Coluna-1].DataBinding.FieldName).DataType = ftFloat) then
            excel.cells [linha+2,coluna-Invisivel] := Grid.DataController.DataSet.FieldByName(Grid.Columns[Coluna-1].DataBinding.FieldName).Value
          else if (Copy(Grid.DataController.DataSet.FieldByName(Grid.Columns[Coluna-1].DataBinding.FieldName).Origin,1,1) = 'd') then
            excel.cells [linha+2,coluna-Invisivel] := (Grid.DataController.DataSet.FieldByName(Grid.Columns[Coluna-1].DataBinding.FieldName).Value)
          else if ((Grid.DataController.DataSet.Fields[Coluna-1].DataType = ftString) or (Grid.DataController.DataSet.FieldByName(Grid.Columns[Coluna-1].DataBinding.FieldName).Value = null)) then
            excel.cells [linha+2,coluna-Invisivel] := Grid.DataController.DataSet.FieldByName(Grid.Columns[Coluna-1].DataBinding.FieldName).AsString
          else
            excel.cells [linha+2,coluna-Invisivel] := Grid.DataController.DataSet.FieldByName(Grid.Columns[Coluna-1].DataBinding.FieldName).Value;
        end
        else
          Inc(Invisivel);
      end;
      Consulta.Next;
    end;

    Invisivel := 0;
    for coluna:=1 to (Grid.ColumnCount-1) + 1 do // eliminei a coluna 0 da rela��o do Excel
    begin
      if Grid.Columns[Coluna-1].Visible then
      begin
        valor := Grid.Columns[Coluna-1].Caption;
        excel.cells[1,coluna-Invisivel]:= UpperCase(valor);
      end
      else
        inc(Invisivel);
    end;
    excel.columns.AutoFit; // esta linha � para fazer com que o Excel dimencione as c�lulas adequadamente.
    excel.visible:=true;
  except
    Application.MessageBox ('Aconteceu um erro desconhecido durante a convers�o'+
    'da tabela para o Ms-Excel','Erro',MB_OK+MB_ICONEXCLAMATION);
  end;

end;

procedure TFrmGrid.ShowHints(Sender: TObject);
begin
    StatusBar.Panels[0].Text := Application.Hint;
end;

procedure TFrmGrid.CentralizaPainel(Painel: TPanel; Status: boolean);
begin
  Painel.top     := (self.Height div 2) - (Painel.height div 2);
  Painel.left    := (self.Width div 2) - (Painel.width div 2);
  Painel.Visible := Status;
end;

end.


