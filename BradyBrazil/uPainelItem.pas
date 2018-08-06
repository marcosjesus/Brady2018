unit uPainelItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinOffice2013White, cxLabel, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, dxSkinsDefaultPainters;

type
  TFr_PainelItem = class(TForm)
    PanelOperacao01: TPanel;
    FDConnection: TFDConnection;
    FDQueryOrdemProducao: TFDQuery;
    TimerRefresh: TTimer;
    cxLabelColuna00: TcxLabel;
    PanelLeft: TPanel;
    PanelTop: TPanel;
    PanelRight: TPanel;
    PanelBottom: TPanel;
    cxLabelOperacao01Linha00: TcxLabel;
    PanelItem: TPanel;
    cxLabelItemLinha00: TcxLabel;
    cxLabelItem06Linha: TcxLabel;
    PanelItem06: TPanel;
    cxLabelItem06TempoPlanejado: TcxLabel;
    cxLabelItem06TempoProjetado: TcxLabel;
    cxLabelItem06Item: TcxLabel;
    cxLabelItem06Cliente: TcxLabel;
    cxLabelItem06OP: TcxLabel;
    cxLabelItem06QtdPlanejada: TcxLabel;
    cxLabelItem06TempoApontado: TcxLabel;
    cxLabelItem06ItemCliente: TcxLabel;
    cxLabelItem06TempoProjetadoRestante: TcxLabel;
    cxLabelItem06QtdFinalizada: TcxLabel;
    cxLabelItem06QtdPendente: TcxLabel;
    cxLabelItem06Percentual: TcxLabel;
    PanelItem05: TPanel;
    cxLabelItem05TempoPlanejado: TcxLabel;
    cxLabelItem05TempoProjetado: TcxLabel;
    cxLabelItem05Item: TcxLabel;
    cxLabelItem05Cliente: TcxLabel;
    cxLabelItem05OP: TcxLabel;
    cxLabelItem05QtdPlanejada: TcxLabel;
    cxLabelItem05TempoApontado: TcxLabel;
    cxLabelItem05ItemCliente: TcxLabel;
    cxLabelItem05TempoProjetadoRestante: TcxLabel;
    cxLabelItem05QtdFinalizada: TcxLabel;
    cxLabelItem05QtdPendente: TcxLabel;
    cxLabelItem05Percentual: TcxLabel;
    cxLabelItem05Linha: TcxLabel;
    PanelItem04: TPanel;
    cxLabelItem04TempoPlanejado: TcxLabel;
    cxLabelItem04TempoProjetado: TcxLabel;
    cxLabelItem04Item: TcxLabel;
    cxLabelItem04Cliente: TcxLabel;
    cxLabelItem04OP: TcxLabel;
    cxLabelItem04QtdPlanejada: TcxLabel;
    cxLabelItem04TempoApontado: TcxLabel;
    cxLabelItem04ItemCliente: TcxLabel;
    cxLabelItem04TempoProjetadoRestante: TcxLabel;
    cxLabelItem04QtdFinalizada: TcxLabel;
    cxLabelItem04QtdPendente: TcxLabel;
    cxLabelItem04Percentual: TcxLabel;
    cxLabelItem04Linha: TcxLabel;
    PanelItem03: TPanel;
    cxLabelItem03TempoPlanejado: TcxLabel;
    cxLabelItem03TempoProjetado: TcxLabel;
    cxLabelItem03Item: TcxLabel;
    cxLabelItem03Cliente: TcxLabel;
    cxLabelItem03OP: TcxLabel;
    cxLabelItem03QtdPlanejada: TcxLabel;
    cxLabelItem03TempoApontado: TcxLabel;
    cxLabelItem03ItemCliente: TcxLabel;
    cxLabelItem03TempoProjetadoRestante: TcxLabel;
    cxLabelItem03QtdFinalizada: TcxLabel;
    cxLabelItem03QtdPendente: TcxLabel;
    cxLabelItem03Percentual: TcxLabel;
    cxLabelItem03Linha: TcxLabel;
    PanelItem02: TPanel;
    cxLabelItem02TempoPlanejado: TcxLabel;
    cxLabelItem02TempoProjetado: TcxLabel;
    cxLabelItem02Item: TcxLabel;
    cxLabelItem02Cliente: TcxLabel;
    cxLabelItem02OP: TcxLabel;
    cxLabelItem02QtdPlanejada: TcxLabel;
    cxLabelItem02TempoApontado: TcxLabel;
    cxLabelItem02ItemCliente: TcxLabel;
    cxLabelItem02TempoProjetadoRestante: TcxLabel;
    cxLabelItem02QtdFinalizada: TcxLabel;
    cxLabelItem02QtdPendente: TcxLabel;
    cxLabelItem02Percentual: TcxLabel;
    cxLabelItem02Linha: TcxLabel;
    PanelItem01: TPanel;
    cxLabelItem01TempoPlanejado: TcxLabel;
    cxLabelItem01TempoProjetado: TcxLabel;
    cxLabelItem01Item: TcxLabel;
    cxLabelItem01Cliente: TcxLabel;
    cxLabelItem01OP: TcxLabel;
    cxLabelItem01QtdPlanejada: TcxLabel;
    cxLabelItem01TempoApontado: TcxLabel;
    cxLabelItem01ItemCliente: TcxLabel;
    cxLabelItem01TempoProjetadoRestante: TcxLabel;
    cxLabelItem01QtdFinalizada: TcxLabel;
    cxLabelItem01QtdPendente: TcxLabel;
    cxLabelItem01Percentual: TcxLabel;
    cxLabelItem01Linha: TcxLabel;
    cxLabelOperacao01Item06Linha: TcxLabel;
    PanelOperacao01Item06: TPanel;
    ShapeOperacao01Item06Sinal: TShape;
    cxLabelOperacao01Item06QtdFinalizada: TcxLabel;
    cxLabelOperacao01Item06QtdPendente: TcxLabel;
    cxLabelOperacao01Item06TempoPlanejado: TcxLabel;
    cxLabelOperacao01Item06TempoApontado: TcxLabel;
    cxLabelOperacao01Item06TempoProjetado: TcxLabel;
    cxLabelOperacao01Item06TempoProjetadoRestante: TcxLabel;
    cxLabelOperacao01Item06Operacao: TcxLabel;
    cxLabelOperacao01Item06Percentual: TcxLabel;
    cxLabelOperacao01Item05Linha: TcxLabel;
    PanelOperacao01Item05: TPanel;
    ShapeOperacao01Item05Sinal: TShape;
    cxLabelOperacao01Item05QtdFinalizada: TcxLabel;
    cxLabelOperacao01Item05QtdPendente: TcxLabel;
    cxLabelOperacao01Item05TempoPlanejado: TcxLabel;
    cxLabelOperacao01Item05TempoApontado: TcxLabel;
    cxLabelOperacao01Item05TempoProjetado: TcxLabel;
    cxLabelOperacao01Item05TempoProjetadoRestante: TcxLabel;
    cxLabelOperacao01Item05Operacao: TcxLabel;
    cxLabelOperacao01Item05Percentual: TcxLabel;
    PanelOperacao01Item04: TPanel;
    ShapeOperacao01Item04Sinal: TShape;
    cxLabelOperacao01Item04QtdFinalizada: TcxLabel;
    cxLabelOperacao01Item04QtdPendente: TcxLabel;
    cxLabelOperacao01Item04TempoPlanejado: TcxLabel;
    cxLabelOperacao01Item04TempoApontado: TcxLabel;
    cxLabelOperacao01Item04TempoProjetado: TcxLabel;
    cxLabelOperacao01Item04TempoProjetadoRestante: TcxLabel;
    cxLabelOperacao01Item04Operacao: TcxLabel;
    cxLabelOperacao01Item04Percentual: TcxLabel;
    cxLabelOperacao01Item04Linha: TcxLabel;
    PanelOperacao01Item03: TPanel;
    ShapeOperacao01Item03Sinal: TShape;
    cxLabelOperacao01Item03QtdFinalizada: TcxLabel;
    cxLabelOperacao01Item03QtdPendente: TcxLabel;
    cxLabelOperacao01Item03TempoPlanejado: TcxLabel;
    cxLabelOperacao01Item03TempoApontado: TcxLabel;
    cxLabelOperacao01Item03TempoProjetado: TcxLabel;
    cxLabelOperacao01Item03TempoProjetadoRestante: TcxLabel;
    cxLabelOperacao01Item03Operacao: TcxLabel;
    cxLabelOperacao01Item03Percentual: TcxLabel;
    cxLabelOperacao01Item03Linha: TcxLabel;
    PanelOperacao01Item02: TPanel;
    ShapeOperacao01Item02Sinal: TShape;
    cxLabelOperacao01Item02QtdFinalizada: TcxLabel;
    cxLabelOperacao01Item02QtdPendente: TcxLabel;
    cxLabelOperacao01Item02TempoPlanejado: TcxLabel;
    cxLabelOperacao01Item02TempoApontado: TcxLabel;
    cxLabelOperacao01Item02TempoProjetado: TcxLabel;
    cxLabelOperacao01Item02TempoProjetadoRestante: TcxLabel;
    cxLabelOperacao01Item02Operacao: TcxLabel;
    cxLabelOperacao01Item02Percentual: TcxLabel;
    cxLabelOperacao01Item02Linha: TcxLabel;
    PanelOperacao01Item01: TPanel;
    ShapeOperacao01Item01Sinal: TShape;
    cxLabelOperacao01Item01QtdFinalizada: TcxLabel;
    cxLabelOperacao01Item01QtdPendente: TcxLabel;
    cxLabelOperacao01Item01TempoPlanejado: TcxLabel;
    cxLabelOperacao01Item01TempoApontado: TcxLabel;
    cxLabelOperacao01Item01TempoProjetado: TcxLabel;
    cxLabelOperacao01Item01TempoProjetadoRestante: TcxLabel;
    cxLabelOperacao01Item01Operacao: TcxLabel;
    cxLabelOperacao01Item01Percentual: TcxLabel;
    cxLabelOperacao01Item01Linha: TcxLabel;
    cxLabelColuna01: TcxLabel;
    cxLabelColuna02: TcxLabel;
    PanelOperacao02: TPanel;
    cxLabelOperacao02Linha00: TcxLabel;
    cxLabelOperacao02Item06Linha: TcxLabel;
    PanelOperacao02Item06: TPanel;
    ShapeOperacao02Item06Sinal: TShape;
    cxLabelOperacao02Item06QtdFinalizada: TcxLabel;
    cxLabelOperacao02Item06QtdPendente: TcxLabel;
    cxLabelOperacao02Item06TempoPlanejado: TcxLabel;
    cxLabelOperacao02Item06TempoApontado: TcxLabel;
    cxLabelOperacao02Item06TempoProjetado: TcxLabel;
    cxLabelOperacao02Item06TempoProjetadoRestante: TcxLabel;
    cxLabelOperacao02Item06Operacao: TcxLabel;
    cxLabelOperacao02Item06Percentual: TcxLabel;
    cxLabelOperacao02Item05Linha: TcxLabel;
    PanelOperacao02Item05: TPanel;
    ShapeOperacao02Item05Sinal: TShape;
    cxLabelOperacao02Item05QtdFinalizada: TcxLabel;
    cxLabelOperacao02Item05QtdPendente: TcxLabel;
    cxLabelOperacao02Item05TempoPlanejado: TcxLabel;
    cxLabelOperacao02Item05TempoApontado: TcxLabel;
    cxLabelOperacao02Item05TempoProjetado: TcxLabel;
    cxLabelOperacao02Item05TempoProjetadoRestante: TcxLabel;
    cxLabelOperacao02Item05Operacao: TcxLabel;
    cxLabelOperacao02Item05Percentual: TcxLabel;
    PanelOperacao02Item04: TPanel;
    ShapeOperacao02Item04Sinal: TShape;
    cxLabelOperacao02Item04QtdFinalizada: TcxLabel;
    cxLabelOperacao02Item04QtdPendente: TcxLabel;
    cxLabelOperacao02Item04TempoPlanejado: TcxLabel;
    cxLabelOperacao02Item04TempoApontado: TcxLabel;
    cxLabelOperacao02Item04TempoProjetado: TcxLabel;
    cxLabelOperacao02Item04TempoProjetadoRestante: TcxLabel;
    cxLabelOperacao02Item04Operacao: TcxLabel;
    cxLabelOperacao02Item04Percentual: TcxLabel;
    cxLabelOperacao02Item04Linha: TcxLabel;
    PanelOperacao02Item03: TPanel;
    ShapeOperacao02Item03Sinal: TShape;
    cxLabelOperacao02Item03QtdFinalizada: TcxLabel;
    cxLabelOperacao02Item03QtdPendente: TcxLabel;
    cxLabelOperacao02Item03TempoPlanejado: TcxLabel;
    cxLabelOperacao02Item03TempoApontado: TcxLabel;
    cxLabelOperacao02Item03TempoProjetado: TcxLabel;
    cxLabelOperacao02Item03TempoProjetadoRestante: TcxLabel;
    cxLabelOperacao02Item03Operacao: TcxLabel;
    cxLabelOperacao02Item03Percentual: TcxLabel;
    cxLabelOperacao02Item03Linha: TcxLabel;
    PanelOperacao02Item02: TPanel;
    ShapeOperacao02Item02Sinal: TShape;
    cxLabelOperacao02Item02QtdFinalizada: TcxLabel;
    cxLabelOperacao02Item02QtdPendente: TcxLabel;
    cxLabelOperacao02Item02TempoPlanejado: TcxLabel;
    cxLabelOperacao02Item02TempoApontado: TcxLabel;
    cxLabelOperacao02Item02TempoProjetado: TcxLabel;
    cxLabelOperacao02Item02TempoProjetadoRestante: TcxLabel;
    cxLabelOperacao02Item02Operacao: TcxLabel;
    cxLabelOperacao02Item02Percentual: TcxLabel;
    cxLabelOperacao02Item02Linha: TcxLabel;
    PanelOperacao02Item01: TPanel;
    ShapeOperacao02Item01Sinal: TShape;
    cxLabelOperacao02Item01QtdFinalizada: TcxLabel;
    cxLabelOperacao02Item01QtdPendente: TcxLabel;
    cxLabelOperacao02Item01TempoPlanejado: TcxLabel;
    cxLabelOperacao02Item01TempoApontado: TcxLabel;
    cxLabelOperacao02Item01TempoProjetado: TcxLabel;
    cxLabelOperacao02Item01TempoProjetadoRestante: TcxLabel;
    cxLabelOperacao02Item01Operacao: TcxLabel;
    cxLabelOperacao02Item01Percentual: TcxLabel;
    cxLabelOperacao02Item01Linha: TcxLabel;
    cxLabelColuna03: TcxLabel;
    PanelOperacao03: TPanel;
    cxLabelOperacao03Linha00: TcxLabel;
    cxLabelOperacao03Item06Linha: TcxLabel;
    PanelOperacao03Item06: TPanel;
    ShapeOperacao03Item06Sinal: TShape;
    cxLabelOperacao03Item06QtdFinalizada: TcxLabel;
    cxLabelOperacao03Item06QtdPendente: TcxLabel;
    cxLabelOperacao03Item06TempoPlanejado: TcxLabel;
    cxLabelOperacao03Item06TempoApontado: TcxLabel;
    cxLabelOperacao03Item06TempoProjetado: TcxLabel;
    cxLabelOperacao03Item06TempoProjetadoRestante: TcxLabel;
    cxLabelOperacao03Item06Operacao: TcxLabel;
    cxLabelOperacao03Item06Percentual: TcxLabel;
    cxLabelOperacao03Item05Linha: TcxLabel;
    PanelOperacao03Item05: TPanel;
    ShapeOperacao03Item05Sinal: TShape;
    cxLabelOperacao03Item05QtdFinalizada: TcxLabel;
    cxLabelOperacao03Item05QtdPendente: TcxLabel;
    cxLabelOperacao03Item05TempoPlanejado: TcxLabel;
    cxLabelOperacao03Item05TempoApontado: TcxLabel;
    cxLabelOperacao03Item05TempoProjetado: TcxLabel;
    cxLabelOperacao03Item05TempoProjetadoRestante: TcxLabel;
    cxLabelOperacao03Item05Operacao: TcxLabel;
    cxLabelOperacao03Item05Percentual: TcxLabel;
    PanelOperacao03Item04: TPanel;
    ShapeOperacao03Item04Sinal: TShape;
    cxLabelOperacao03Item04QtdFinalizada: TcxLabel;
    cxLabelOperacao03Item04QtdPendente: TcxLabel;
    cxLabelOperacao03Item04TempoPlanejado: TcxLabel;
    cxLabelOperacao03Item04TempoApontado: TcxLabel;
    cxLabelOperacao03Item04TempoProjetado: TcxLabel;
    cxLabelOperacao03Item04TempoProjetadoRestante: TcxLabel;
    cxLabelOperacao03Item04Operacao: TcxLabel;
    cxLabelOperacao03Item04Percentual: TcxLabel;
    cxLabelOperacao03Item04Linha: TcxLabel;
    PanelOperacao03Item03: TPanel;
    ShapeOperacao03Item03Sinal: TShape;
    cxLabelOperacao03Item03QtdFinalizada: TcxLabel;
    cxLabelOperacao03Item03QtdPendente: TcxLabel;
    cxLabelOperacao03Item03TempoPlanejado: TcxLabel;
    cxLabelOperacao03Item03TempoApontado: TcxLabel;
    cxLabelOperacao03Item03TempoProjetado: TcxLabel;
    cxLabelOperacao03Item03TempoProjetadoRestante: TcxLabel;
    cxLabelOperacao03Item03Operacao: TcxLabel;
    cxLabelOperacao03Item03Percentual: TcxLabel;
    cxLabelOperacao03Item03Linha: TcxLabel;
    PanelOperacao03Item02: TPanel;
    ShapeOperacao03Item02Sinal: TShape;
    cxLabelOperacao03Item02QtdFinalizada: TcxLabel;
    cxLabelOperacao03Item02QtdPendente: TcxLabel;
    cxLabelOperacao03Item02TempoPlanejado: TcxLabel;
    cxLabelOperacao03Item02TempoApontado: TcxLabel;
    cxLabelOperacao03Item02TempoProjetado: TcxLabel;
    cxLabelOperacao03Item02TempoProjetadoRestante: TcxLabel;
    cxLabelOperacao03Item02Operacao: TcxLabel;
    cxLabelOperacao03Item02Percentual: TcxLabel;
    cxLabelOperacao03Item02Linha: TcxLabel;
    PanelOperacao03Item01: TPanel;
    ShapeOperacao03Item01Sinal: TShape;
    cxLabelOperacao03Item01QtdFinalizada: TcxLabel;
    cxLabelOperacao03Item01QtdPendente: TcxLabel;
    cxLabelOperacao03Item01TempoPlanejado: TcxLabel;
    cxLabelOperacao03Item01TempoApontado: TcxLabel;
    cxLabelOperacao03Item01TempoProjetado: TcxLabel;
    cxLabelOperacao03Item01TempoProjetadoRestante: TcxLabel;
    cxLabelOperacao03Item01Operacao: TcxLabel;
    cxLabelOperacao03Item01Percentual: TcxLabel;
    cxLabelOperacao03Item01Linha: TcxLabel;
    cxLabelColuna04: TcxLabel;
    PanelOperacao04: TPanel;
    cxLabelOperacao04Linha00: TcxLabel;
    cxLabelOperacao04Item06Linha: TcxLabel;
    PanelOperacao04Item06: TPanel;
    ShapeOperacao04Item06Sinal: TShape;
    cxLabelOperacao04Item06QtdFinalizada: TcxLabel;
    cxLabelOperacao04Item06QtdPendente: TcxLabel;
    cxLabelOperacao04Item06TempoPlanejado: TcxLabel;
    cxLabelOperacao04Item06TempoApontado: TcxLabel;
    cxLabelOperacao04Item06TempoProjetado: TcxLabel;
    cxLabelOperacao04Item06TempoProjetadoRestante: TcxLabel;
    cxLabelOperacao04Item06Operacao: TcxLabel;
    cxLabelOperacao04Item06Percentual: TcxLabel;
    cxLabelOperacao04Item05Linha: TcxLabel;
    PanelOperacao04Item05: TPanel;
    ShapeOperacao04Item05Sinal: TShape;
    cxLabelOperacao04Item05QtdFinalizada: TcxLabel;
    cxLabelOperacao04Item05QtdPendente: TcxLabel;
    cxLabelOperacao04Item05TempoPlanejado: TcxLabel;
    cxLabelOperacao04Item05TempoApontado: TcxLabel;
    cxLabelOperacao04Item05TempoProjetado: TcxLabel;
    cxLabelOperacao04Item05TempoProjetadoRestante: TcxLabel;
    cxLabelOperacao04Item05Operacao: TcxLabel;
    cxLabelOperacao04Item05Percentual: TcxLabel;
    PanelOperacao04Item04: TPanel;
    ShapeOperacao04Item04Sinal: TShape;
    cxLabelOperacao04Item04QtdFinalizada: TcxLabel;
    cxLabelOperacao04Item04QtdPendente: TcxLabel;
    cxLabelOperacao04Item04TempoPlanejado: TcxLabel;
    cxLabelOperacao04Item04TempoApontado: TcxLabel;
    cxLabelOperacao04Item04TempoProjetado: TcxLabel;
    cxLabelOperacao04Item04TempoProjetadoRestante: TcxLabel;
    cxLabelOperacao04Item04Operacao: TcxLabel;
    cxLabelOperacao04Item04Percentual: TcxLabel;
    cxLabelOperacao04Item04Linha: TcxLabel;
    PanelOperacao04Item03: TPanel;
    ShapeOperacao04Item03Sinal: TShape;
    cxLabelOperacao04Item03QtdFinalizada: TcxLabel;
    cxLabelOperacao04Item03QtdPendente: TcxLabel;
    cxLabelOperacao04Item03TempoPlanejado: TcxLabel;
    cxLabelOperacao04Item03TempoApontado: TcxLabel;
    cxLabelOperacao04Item03TempoProjetado: TcxLabel;
    cxLabelOperacao04Item03TempoProjetadoRestante: TcxLabel;
    cxLabelOperacao04Item03Operacao: TcxLabel;
    cxLabelOperacao04Item03Percentual: TcxLabel;
    cxLabelOperacao04Item03Linha: TcxLabel;
    PanelOperacao04Item02: TPanel;
    ShapeOperacao04Item02Sinal: TShape;
    cxLabelOperacao04Item02QtdFinalizada: TcxLabel;
    cxLabelOperacao04Item02QtdPendente: TcxLabel;
    cxLabelOperacao04Item02TempoPlanejado: TcxLabel;
    cxLabelOperacao04Item02TempoApontado: TcxLabel;
    cxLabelOperacao04Item02TempoProjetado: TcxLabel;
    cxLabelOperacao04Item02TempoProjetadoRestante: TcxLabel;
    cxLabelOperacao04Item02Operacao: TcxLabel;
    cxLabelOperacao04Item02Percentual: TcxLabel;
    cxLabelOperacao04Item02Linha: TcxLabel;
    PanelOperacao04Item01: TPanel;
    ShapeOperacao04Item01Sinal: TShape;
    cxLabelOperacao04Item01QtdFinalizada: TcxLabel;
    cxLabelOperacao04Item01QtdPendente: TcxLabel;
    cxLabelOperacao04Item01TempoPlanejado: TcxLabel;
    cxLabelOperacao04Item01TempoApontado: TcxLabel;
    cxLabelOperacao04Item01TempoProjetado: TcxLabel;
    cxLabelOperacao04Item01TempoProjetadoRestante: TcxLabel;
    cxLabelOperacao04Item01Operacao: TcxLabel;
    cxLabelOperacao04Item01Percentual: TcxLabel;
    cxLabelOperacao04Item01Linha: TcxLabel;
    cxLabelColuna05: TcxLabel;
    procedure FormShow(Sender: TObject);
    procedure TimerRefreshTimer(Sender: TObject);
  private
    procedure RefreshScreen;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fr_PainelItem: TFr_PainelItem;

implementation

{$R *.dfm}

uses uBrady, uUtils;


{ TFr_PainelItem }

procedure TFr_PainelItem.FormShow(Sender: TObject);
begin

  RefreshScreen;

end;

procedure TFr_PainelItem.RefreshScreen;
var
  X, Y: Integer;

begin

  TimerRefresh.Enabled := False;
  try

    if not FDConnection.Connected then
    begin

      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );
      FDConnection.Open;

    end;

    if not FDQueryOrdemProducao.Active then
      FDQueryOrdemProducao.Open;

    try

      for X := 1 to 6 do
      begin

        (FindComponent( 'cxLabelItem' + Format( '%.*d', [2,X] ) + 'Cliente' ) as TcxLabel).Caption := EmptyStr;
        (FindComponent( 'cxLabelItem' + Format( '%.*d', [2,X] ) + 'ItemCliente' ) as TcxLabel).Caption := EmptyStr;

        (FindComponent( 'cxLabelItem' + Format( '%.*d', [2,X] ) + 'Item' ) as TcxLabel).Caption := EmptyStr;
        (FindComponent( 'cxLabelItem' + Format( '%.*d', [2,X] ) + 'Percentual' ) as TcxLabel).Caption := EmptyStr;
        (FindComponent( 'cxLabelItem' + Format( '%.*d', [2,X] ) + 'OP' ) as TcxLabel).Caption := EmptyStr;

        (FindComponent( 'cxLabelItem' + Format( '%.*d', [2,X] ) + 'QtdPlanejada' ) as TcxLabel).Caption := EmptyStr;
        (FindComponent( 'cxLabelItem' + Format( '%.*d', [2,X] ) + 'QtdFinalizada' ) as TcxLabel).Caption := EmptyStr;
        (FindComponent( 'cxLabelItem' + Format( '%.*d', [2,X] ) + 'QtdPendente' ) as TcxLabel).Caption := EmptyStr;

        (FindComponent( 'cxLabelItem' + Format( '%.*d', [2,X] ) + 'TempoApontado' ) as TcxLabel).Caption := EmptyStr;
        (FindComponent( 'cxLabelItem' + Format( '%.*d', [2,X] ) + 'TempoPlanejado' ) as TcxLabel).Caption := EmptyStr;

        (FindComponent( 'cxLabelItem' + Format( '%.*d', [2,X] ) + 'TempoProjetado' ) as TcxLabel).Caption := EmptyStr;
        (FindComponent( 'cxLabelItem' + Format( '%.*d', [2,X] ) + 'TempoProjetadoRestante' ) as TcxLabel).Caption := EmptyStr;

        for Y := 1 to 4 do
        begin

          (FindComponent( 'cxLabelOperacao' + Format( '%.*d', [2,Y] ) + 'Item' + Format( '%.*d', [2,X] ) + 'Percentual' ) as TcxLabel).Caption := EmptyStr;

          (FindComponent( 'cxLabelOperacao' + Format( '%.*d', [2,Y] ) + 'Item' + Format( '%.*d', [2,X] ) + 'Operacao' ) as TcxLabel).Caption := EmptyStr;
          (FindComponent( 'cxLabelOperacao' + Format( '%.*d', [2,Y] ) + 'Item' + Format( '%.*d', [2,X] ) + 'QtdFinalizada' ) as TcxLabel).Caption := EmptyStr;
          (FindComponent( 'cxLabelOperacao' + Format( '%.*d', [2,Y] ) + 'Item' + Format( '%.*d', [2,X] ) + 'QtdPendente' ) as TcxLabel).Caption := EmptyStr;

          (FindComponent( 'cxLabelOperacao' + Format( '%.*d', [2,Y] ) + 'Item' + Format( '%.*d', [2,X] ) + 'TempoApontado' ) as TcxLabel).Caption := EmptyStr;
          (FindComponent( 'cxLabelOperacao' + Format( '%.*d', [2,Y] ) + 'Item' + Format( '%.*d', [2,X] ) + 'TempoPlanejado' ) as TcxLabel).Caption := EmptyStr;

          (FindComponent( 'cxLabelOperacao' + Format( '%.*d', [2,Y] ) + 'Item' + Format( '%.*d', [2,X] ) + 'TempoProjetado' ) as TcxLabel).Caption := EmptyStr;
          (FindComponent( 'cxLabelOperacao' + Format( '%.*d', [2,Y] ) + 'Item' + Format( '%.*d', [2,X] ) + 'TempoProjetadoRestante' ) as TcxLabel).Caption := EmptyStr;

          (FindComponent( 'ShapeOperacao' + Format( '%.*d', [2,Y] ) + 'Item' + Format( '%.*d', [2,X] ) + 'Sinal' ) as TShape).Brush.Color := clBlack;

        end;

      end;

      for X := 1 to 6 do
      begin

        (FindComponent( 'cxLabelItem' + Format( '%.*d', [2,X] ) + 'Percentual' ) as TcxLabel).Caption := FormatFloat( '##0', 0 ) + '%';

//        (FindComponent( 'cxLabelItem' + Format( '%.*d', [2,X] ) + 'Item' ) as TcxLabel).Caption := FDQueryOrdemProducaoTMAQ_ORDPROITECOD.AsString;
//        (FindComponent( 'cxLabelItem' + Format( '%.*d', [2,X] ) + 'OP' ) as TcxLabel).Caption := FDQueryOrdemProducaoTMAQ_ORDPRONUM.AsString;
//
//        (FindComponent( 'cxLabelItem' + Format( '%.*d', [2,X] ) + 'QtdPlanejada' ) as TcxLabel).Caption := FormatFloat('#,##0', FDQueryOrdemProducaoTMAQ_ORDPROQTDPLA.AsFloat ) + FDQueryOrdemProducaoTMAQ_ITEUNI.AsString;
//        (FindComponent( 'cxLabelItem' + Format( '%.*d', [2,X] ) + 'QtdFinalizada' ) as TcxLabel).Caption := FormatFloat('#,##0', 0.00 ) + FDQueryOrdemProducaoTMAQ_ITEUNI.AsString;
//        (FindComponent( 'cxLabelItem' + Format( '%.*d', [2,X] ) + 'QtdPendente' ) as TcxLabel).Caption := FormatFloat('#,##0', 0.00 ) + FDQueryOrdemProducaoTMAQ_ITEUNI.AsString;
//
//        (FindComponent( 'cxLabelItem' + Format( '%.*d', [2,X] ) + 'TempoApontado' ) as TcxLabel).Caption := FormatFloat('#,##0', FDQueryOrdemProducaoTMAQ_APOMIN.AsFloat ) + '"';
//        (FindComponent( 'cxLabelItem' + Format( '%.*d', [2,X] ) + 'TempoPlanejado' ) as TcxLabel).Caption := FormatFloat('#,##0', FDQueryOrdemProducaoTMAQ_ITEROUMIN.AsFloat ) + '"';

        (FindComponent( 'cxLabelItem' + Format( '%.*d', [2,X] ) + 'TempoProjetado' ) as TcxLabel).Caption := FormatFloat('#,##0', 0.00 ) + '"';
        (FindComponent( 'cxLabelItem' + Format( '%.*d', [2,X] ) + 'TempoProjetadoRestante' ) as TcxLabel).Caption := FormatFloat('#,##0', 0.00 ) + '"';

        for Y := 1 to 4 do
        begin

          (FindComponent( 'cxLabelOperacao' + Format( '%.*d', [2,Y] ) + 'Item' + Format( '%.*d', [2,X] ) + 'Percentual' ) as TcxLabel).Caption := EmptyStr;

          (FindComponent( 'cxLabelOperacao' + Format( '%.*d', [2,Y] ) + 'Item' + Format( '%.*d', [2,X] ) + 'Operacao' ) as TcxLabel).Caption := EmptyStr;
          (FindComponent( 'cxLabelOperacao' + Format( '%.*d', [2,Y] ) + 'Item' + Format( '%.*d', [2,X] ) + 'QtdFinalizada' ) as TcxLabel).Caption := EmptyStr;
          (FindComponent( 'cxLabelOperacao' + Format( '%.*d', [2,Y] ) + 'Item' + Format( '%.*d', [2,X] ) + 'QtdPendente' ) as TcxLabel).Caption := EmptyStr;

          (FindComponent( 'cxLabelOperacao' + Format( '%.*d', [2,Y] ) + 'Item' + Format( '%.*d', [2,X] ) + 'TempoApontado' ) as TcxLabel).Caption := EmptyStr;
          (FindComponent( 'cxLabelOperacao' + Format( '%.*d', [2,Y] ) + 'Item' + Format( '%.*d', [2,X] ) + 'TempoPlanejado' ) as TcxLabel).Caption := EmptyStr;

          (FindComponent( 'cxLabelOperacao' + Format( '%.*d', [2,Y] ) + 'Item' + Format( '%.*d', [2,X] ) + 'TempoProjetado' ) as TcxLabel).Caption := EmptyStr;
          (FindComponent( 'cxLabelOperacao' + Format( '%.*d', [2,Y] ) + 'Item' + Format( '%.*d', [2,X] ) + 'TempoProjetadoRestante' ) as TcxLabel).Caption := EmptyStr;

          (FindComponent( 'ShapeOperacao' + Format( '%.*d', [2,Y] ) + 'Item' + Format( '%.*d', [2,X] ) + 'Sinal' ) as TShape).Brush.Color := clBlack;

        end;

        if FDQueryOrdemProducao.Eof then
          Break;

        FDQueryOrdemProducao.Next;

      end;

    finally

      if FDQueryOrdemProducao.Eof then
      begin

        FDQueryOrdemProducao.Close;
        FDConnection.Close;

      end;

    end;

  finally

    TimerRefresh.Enabled := True;

  end;

end;

procedure TFr_PainelItem.TimerRefreshTimer(Sender: TObject);
begin

  RefreshScreen;

end;

end.
