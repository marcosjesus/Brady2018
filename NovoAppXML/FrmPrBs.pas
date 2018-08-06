unit FrmPrBs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  rsFlyovr, ToolWin, ComCtrls, Mask, rsEdit, RseditDB, StdCtrls, ExtCtrls,
  Buttons, Db, DBTables, DBCtrls, DBGrids, COMObj, Variants, Menus,
  cxLookAndFeelPainters, cxButtons, cxGraphics, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinsdxStatusBarPainter, cxControls,
  dxStatusBar, cxLookAndFeels, dxSkinBlack, dxSkinBlue, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinValentine, dxSkinXmas2008Blue;

type
  TParamBase = class(TForm)
    PanFundo: TPanel;
    PanTitulo: TPanel;
    ImaBarraSup: TImage;
    LabCadTit: TLabel;
    EdiDatabaseName: TEdit;
    EdiKeyValue: TrsDBSuperEdit;
    StatusBar: TdxStatusBar;
    Panel1: TPanel;
    spbPrint: TcxButton;
    ButSair: TcxButton;
    procedure ButSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure GerarExcel(Consulta : TQuery);
    Procedure GridExcel(Grid : TDBGrid; Consulta : TQuery);
    Procedure CentralizaPainel( Painel : TPanel; Status : boolean);
  end;

var
  ParamBase: TParamBase;

implementation

{$R *.DFM}

Uses Global;

procedure TParamBase.ButSairClick(Sender: TObject);
begin
  Close;
end;

procedure TParamBase.FormCreate(Sender: TObject);
begin
  Left   := 1;
  Top    := 1;
  Height := 512;
  Width  := 746;

  EdiDatabaseName.Text := GDatabase ;
end;

procedure TParamBase.CentralizaPainel(Painel: TPanel; Status: boolean);
begin
  Painel.top     := (self.Height div 2) - (Painel.height div 2);
  Painel.left    := (self.Width div 2) - (Painel.width div 2);
  Painel.Visible := Status;
end;

procedure TParamBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Self := NIL;
end;

// Gera excel com dados de uma Query
procedure TParamBase.GerarExcel(Consulta: TQuery);
var
coluna, linha: integer;
excel: variant;
valor: string;
begin
  try
    excel:=CreateOleObject('Excel.Application');
    excel.Workbooks.add(1);
  except
    Application.MessageBox ('Versão do Ms-Excel Incompatível','Erro',MB_OK+MB_ICONEXCLAMATION);
  end;

Consulta.First;
  try
    for linha:=0 to Consulta.RecordCount-1 do
    begin
      for coluna:=1 to Consulta.FieldCount do // eliminei a coluna 0 da relação do Excel
      begin
//        valor:= Consulta.Fields[coluna-1].AsString;    //  não leva float corretamente, leva como string
//        excel.cells [linha+2,coluna]:=valor;

        if (Consulta.Fields[Coluna-1].DataType = ftFloat) then
          excel.cells [linha+2,coluna]:=Consulta.Fields[Coluna-1].AsFloat
        else if (Consulta.Fields[Coluna-1].DataType = ftString) or (Consulta.Fields[Coluna-1].Value = null) then
          excel.cells [linha+2,coluna]:=Consulta.Fields[Coluna-1].AsString
        else
          excel.cells [linha+2,coluna]:=Consulta.Fields[Coluna-1].Value;

      end;
      Consulta.Next;
    end;

    for coluna:=1 to Consulta.FieldCount do // eliminei a coluna 0 da relação do Excel
    begin
      valor:= Consulta.Fields[coluna-1].DisplayLabel;
      excel.cells[1,coluna]:=valor;
    end;
    excel.columns.AutoFit; // esta linha é para fazer com que o Excel dimencione as células adequadamente.
    excel.visible:=true;
  except
    Application.MessageBox ('Aconteceu um erro desconhecido durante a conversão'+
    'da tabela para o Ms-Excel','Erro',MB_OK+MB_ICONEXCLAMATION);
  end;

end;

// Gera excel com dados de um Grid

procedure TParamBase.GridExcel(Grid: TDBGrid; Consulta: TQuery);
var
coluna, linha: integer;
excel: variant;
valor: string;
begin
  try
    excel:=CreateOleObject('Excel.Application');
    excel.Workbooks.add(1);
  except
    Application.MessageBox ('Versão do Ms-Excel Incompatível','Erro',MB_OK+MB_ICONEXCLAMATION);
  end;

Grid.Columns[Grid.Columns.Count-1];

Consulta.First;
  try
    for linha:=0 to  Consulta.RecordCount-1 do
    begin
      for coluna:=1 to (Grid.Columns.Count-1) + 1 do // eliminei a coluna 0 da relação do Excel
      begin
        if (Grid.Fields[Coluna-1].DataType = ftFloat) then
          excel.cells [linha+2,coluna] := Grid.Fields[Coluna-1].AsFloat
        else if (Grid.Fields[Coluna-1].DataType = ftString) or (Grid.Fields[Coluna-1].Value = null) then
          excel.cells [linha+2,coluna] := Grid.Fields[Coluna-1].AsString
        else
          excel.cells [linha+2,coluna] := Grid.Fields[Coluna-1].Value;
      end;
      Consulta.Next;
    end;

    for coluna:=1 to (Grid.Columns.Count-1) + 1 do // eliminei a coluna 0 da relação do Excel
    begin
      valor := Grid.Columns[Coluna-1].Title.Caption;
      excel.cells[1,coluna]:= UpperCase(valor);
    end;
    excel.columns.AutoFit; // esta linha é para fazer com que o Excel dimencione as células adequadamente.
    excel.visible:=true;
  except
    Application.MessageBox ('Aconteceu um erro desconhecido durante a conversão'+
    'da tabela para o Ms-Excel','Erro',MB_OK+MB_ICONEXCLAMATION);
  end;

End;

end.
