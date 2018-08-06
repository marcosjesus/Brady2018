unit uCalcGM;

interface

uses
  System.IOUtils,
  System.DateUtils,

  dxSpreadSheet,
  dxSpreadSheetTypes,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinOffice2013White, dxSkinscxPCPainter,
  dxBarBuiltInMenu, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, cxPC, cxContainer, cxEdit, cxTextEdit, cxLabel,
  cxMaskEdit, cxButtonEdit, cxGroupBox, cxRadioGroup, Vcl.Menus, Vcl.StdCtrls,
  cxButtons, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxGDIPlusClasses, Vcl.ExtCtrls, cxMemo;

type
  TFr_CalcGM = class(TForm)
    cxPageControlPivot: TcxPageControl;
    cxTabSheetPivot00: TcxTabSheet;
    cxButtonProcessar: TcxButton;
    cxLabel1: TcxLabel;
    cxMemoLog: TcxMemo;
    Timer: TTimer;
    procedure TimerTimer(Sender: TObject);
    procedure cxButtonProcessarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fr_CalcGM: TFr_CalcGM;

implementation

{$R *.dfm}

uses uBrady, uUtils;



procedure TFr_CalcGM.cxButtonProcessarClick(Sender: TObject);
begin

  if Application.MessageBox( 'Deseja executar calculo Gross Margin?', 'Responda', MB_YESNO ) = ID_YES then
  begin

    try
      TFile.Delete( '\\GHOS2024\Brady\Files\GM\log.txt' );
    except
    end;

    try
      TFile.Create( '\\GHOS2024\Brady\Files\GM\log.txt' ).Free;
    except
    end;

    try
      TFile.AppendAllText( '\\GHOS2024\Brady\Files\GM\log.txt', 'Executando processamento...' );
    except
    end;

    TFile.Create( '\\GHOS2024\Brady\Files\GM\exec.txt' ).Free;

    Timer.Enabled := True;

  end;

end;

procedure TFr_CalcGM.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  Fr_CalcGM := nil;
  Action := caFree;

end;

procedure TFr_CalcGM.TimerTimer(Sender: TObject);
begin

  try

    cxMemoLog.Lines.Clear;
    cxMemoLog.Lines.LoadFromFile( '\\GHOS2024\Brady\Files\GM\log.txt' );

  except
  end;

  if TFile.Exists( '\\GHOS2024\Brady\Files\GM\finish.txt' ) then
  begin

    Timer.Enabled := False;
    ShowMessage( 'Processo concluido.' );

  end;

end;

end.
