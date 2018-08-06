unit uPainelLider;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  Vcl.ExtCtrls, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxLabel, dxSkinOffice2013White, dxSkinsDefaultPainters;

type
  TFr_PainelLider = class(TForm)

    PanelTop: TPanel;
    PanelLeft: TPanel;
    PanelClient: TPanel;

    PanelProdutivo: TPanel;
    PanelSetup: TPanel;
    PanelParada: TPanel;

    PanelHora01: TPanel;
    PanelHora02: TPanel;
    PanelHora03: TPanel;
    PanelHora04: TPanel;
    PanelHora05: TPanel;
    PanelHora06: TPanel;
    PanelHora07: TPanel;
    PanelHora08: TPanel;
    PanelHora09: TPanel;
    cxLabelMonitor: TcxLabel;

    cxLabelLinha01: TcxLabel;
    cxLabelLinha02: TcxLabel;
    cxLabelLinha03: TcxLabel;
    cxLabelLinha04: TcxLabel;
    cxLabelLinha05: TcxLabel;
    cxLabelLinha06: TcxLabel;
    cxLabelLinha07: TcxLabel;
    cxLabelLinha08: TcxLabel;

    cxLabelParada: TcxLabel;
    cxLabelSetup: TcxLabel;
    cxLabelProdutivo: TcxLabel;

    cxLabelHora01: TcxLabel;
    cxLabelHora02: TcxLabel;
    cxLabelHora03: TcxLabel;
    cxLabelHora04: TcxLabel;
    cxLabelHora05: TcxLabel;
    cxLabelHora06: TcxLabel;
    cxLabelHora07: TcxLabel;
    cxLabelHora08: TcxLabel;
    cxLabelHora09: TcxLabel;

    cxLabelMaquina01: TcxLabel;
    cxLabelMaquina02: TcxLabel;
    cxLabelMaquina03: TcxLabel;
    cxLabelMaquina04: TcxLabel;
    cxLabelMaquina05: TcxLabel;
    cxLabelMaquina06: TcxLabel;
    cxLabelMaquina07: TcxLabel;
    cxLabelMaquina08: TcxLabel;
    cxLabelMaquina09: TcxLabel;
    cxLabelMaquina10: TcxLabel;
    cxLabelMaquina11: TcxLabel;
    cxLabelMaquina12: TcxLabel;

    cxLabelParada01: TcxLabel;
    cxLabelParada02: TcxLabel;
    cxLabelParada03: TcxLabel;
    cxLabelParada04: TcxLabel;
    cxLabelParada05: TcxLabel;
    cxLabelParada06: TcxLabel;
    cxLabelParada07: TcxLabel;
    cxLabelParada08: TcxLabel;
    cxLabelParada09: TcxLabel;
    cxLabelParada10: TcxLabel;
    cxLabelParada11: TcxLabel;
    cxLabelParada12: TcxLabel;

    cxLabelSetup01: TcxLabel;
    cxLabelSetup02: TcxLabel;
    cxLabelSetup03: TcxLabel;
    cxLabelSetup04: TcxLabel;
    cxLabelSetup05: TcxLabel;
    cxLabelSetup06: TcxLabel;
    cxLabelSetup07: TcxLabel;
    cxLabelSetup08: TcxLabel;
    cxLabelSetup09: TcxLabel;
    cxLabelSetup10: TcxLabel;
    cxLabelSetup11: TcxLabel;
    cxLabelSetup12: TcxLabel;

    cxLabelProdutivo01: TcxLabel;
    cxLabelProdutivo02: TcxLabel;
    cxLabelProdutivo03: TcxLabel;
    cxLabelProdutivo04: TcxLabel;
    cxLabelProdutivo05: TcxLabel;
    cxLabelProdutivo06: TcxLabel;
    cxLabelProdutivo07: TcxLabel;
    cxLabelProdutivo08: TcxLabel;
    cxLabelProdutivo09: TcxLabel;
    cxLabelProdutivo10: TcxLabel;
    cxLabelProdutivo11: TcxLabel;
    cxLabelProdutivo12: TcxLabel;

    cxLabelHora0101: TcxLabel;
    cxLabelHora0102: TcxLabel;
    cxLabelHora0103: TcxLabel;
    cxLabelHora0104: TcxLabel;
    cxLabelHora0105: TcxLabel;
    cxLabelHora0106: TcxLabel;
    cxLabelHora0107: TcxLabel;
    cxLabelHora0108: TcxLabel;
    cxLabelHora0109: TcxLabel;
    cxLabelHora0110: TcxLabel;
    cxLabelHora0111: TcxLabel;
    cxLabelHora0112: TcxLabel;

    cxLabelHora0201: TcxLabel;
    cxLabelHora0202: TcxLabel;
    cxLabelHora0203: TcxLabel;
    cxLabelHora0204: TcxLabel;
    cxLabelHora0205: TcxLabel;
    cxLabelHora0206: TcxLabel;
    cxLabelHora0207: TcxLabel;
    cxLabelHora0208: TcxLabel;
    cxLabelHora0209: TcxLabel;
    cxLabelHora0210: TcxLabel;
    cxLabelHora0211: TcxLabel;
    cxLabelHora0212: TcxLabel;

    cxLabelHora0301: TcxLabel;
    cxLabelHora0302: TcxLabel;
    cxLabelHora0303: TcxLabel;
    cxLabelHora0304: TcxLabel;
    cxLabelHora0305: TcxLabel;
    cxLabelHora0306: TcxLabel;
    cxLabelHora0307: TcxLabel;
    cxLabelHora0308: TcxLabel;
    cxLabelHora0309: TcxLabel;
    cxLabelHora0310: TcxLabel;
    cxLabelHora0311: TcxLabel;
    cxLabelHora0312: TcxLabel;

    cxLabelHora0401: TcxLabel;
    cxLabelHora0402: TcxLabel;
    cxLabelHora0403: TcxLabel;
    cxLabelHora0404: TcxLabel;
    cxLabelHora0405: TcxLabel;
    cxLabelHora0406: TcxLabel;
    cxLabelHora0407: TcxLabel;
    cxLabelHora0408: TcxLabel;
    cxLabelHora0409: TcxLabel;
    cxLabelHora0410: TcxLabel;
    cxLabelHora0411: TcxLabel;
    cxLabelHora0412: TcxLabel;

    cxLabelHora0501: TcxLabel;
    cxLabelHora0502: TcxLabel;
    cxLabelHora0503: TcxLabel;
    cxLabelHora0504: TcxLabel;
    cxLabelHora0505: TcxLabel;
    cxLabelHora0506: TcxLabel;
    cxLabelHora0507: TcxLabel;
    cxLabelHora0508: TcxLabel;
    cxLabelHora0509: TcxLabel;
    cxLabelHora0510: TcxLabel;
    cxLabelHora0511: TcxLabel;
    cxLabelHora0512: TcxLabel;

    cxLabelHora0601: TcxLabel;
    cxLabelHora0602: TcxLabel;
    cxLabelHora0603: TcxLabel;
    cxLabelHora0604: TcxLabel;
    cxLabelHora0605: TcxLabel;
    cxLabelHora0606: TcxLabel;
    cxLabelHora0607: TcxLabel;
    cxLabelHora0608: TcxLabel;
    cxLabelHora0609: TcxLabel;
    cxLabelHora0610: TcxLabel;
    cxLabelHora0611: TcxLabel;
    cxLabelHora0612: TcxLabel;

    cxLabelHora0701: TcxLabel;
    cxLabelHora0702: TcxLabel;
    cxLabelHora0703: TcxLabel;
    cxLabelHora0704: TcxLabel;
    cxLabelHora0705: TcxLabel;
    cxLabelHora0706: TcxLabel;
    cxLabelHora0707: TcxLabel;
    cxLabelHora0708: TcxLabel;
    cxLabelHora0709: TcxLabel;
    cxLabelHora0710: TcxLabel;
    cxLabelHora0711: TcxLabel;
    cxLabelHora0712: TcxLabel;

    cxLabelHora0801: TcxLabel;
    cxLabelHora0802: TcxLabel;
    cxLabelHora0803: TcxLabel;
    cxLabelHora0804: TcxLabel;
    cxLabelHora0805: TcxLabel;
    cxLabelHora0806: TcxLabel;
    cxLabelHora0807: TcxLabel;
    cxLabelHora0808: TcxLabel;
    cxLabelHora0809: TcxLabel;
    cxLabelHora0810: TcxLabel;
    cxLabelHora0811: TcxLabel;
    cxLabelHora0812: TcxLabel;

    cxLabelHora0901: TcxLabel;
    cxLabelHora0902: TcxLabel;
    cxLabelHora0903: TcxLabel;
    cxLabelHora0904: TcxLabel;
    cxLabelHora0905: TcxLabel;
    cxLabelHora0906: TcxLabel;
    cxLabelHora0907: TcxLabel;
    cxLabelHora0908: TcxLabel;
    cxLabelHora0909: TcxLabel;
    cxLabelHora0910: TcxLabel;
    cxLabelHora0911: TcxLabel;
    cxLabelHora0912: TcxLabel;
    FDConnection: TFDConnection;
    FDQueryHoras: TFDQuery;
    FDQueryHorasTMAQ_APODATINI: TIntegerField;
    FDQueryHorasTMAQ_APODATFIM: TIntegerField;
    FDQueryHeader: TFDQuery;
    FDQueryHeaderTMAQ_MAQCOD: TFDAutoIncField;
    FDQueryHeaderTMAQ_MAQNOMRED: TStringField;
    FDQueryHeaderTMAQ_ATITIP: TIntegerField;
    FDQueryHeaderTMAQ_APOPER: TFMTBCDField;
    FDQueryHeaderTMAQ_APOCOR: TStringField;
    TimerRefresh: TTimer;
    FDQueryHeaderTMAQ_MAQCOR: TStringField;
    FDQueryHora: TFDQuery;
    FDQueryHoraTMAQ_MAQCOD: TFDAutoIncField;
    FDQueryHoraTMAQ_MAQNOMRED: TStringField;
    FDQueryHoraTMAQ_APODATINI: TIntegerField;
    FDQueryHoraTMAQ_APOPER: TFMTBCDField;
    FDQueryHoraTMAQ_APOCOR: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TimerRefreshTimer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    FTotalMonitor: Integer;
    FMonitorAtual: Integer;
    FTotalMaquinas: Integer;
    FAskMonitor: Integer;
    FTambore: Boolean;
    procedure SetTotalMaquinas(const Value: Integer);
    procedure SetMonitorAtual(const Value: Integer);
    procedure SetAskMonitor(const Value: Integer);
    { Private declarations }
  public
    procedure ClearScreen;
    procedure RefreshScreen;
    procedure RefreshMonitor;
    property AskMonitor: Integer read FAskMonitor write SetAskMonitor;
    property TotalMaquinas: Integer read FTotalMaquinas write SetTotalMaquinas;
    property TotalMonitor: Integer read FTotalMonitor write FTotalMonitor;
    property MonitorAtual: Integer read FMonitorAtual write SetMonitorAtual;
    property Tambore: Boolean read FTambore write FTambore;
    { Public declarations }
  end;

var
  Fr_PainelLider: TFr_PainelLider;

implementation

{$R *.dfm}

uses uBrady, uUtils;

procedure TFr_PainelLider.ClearScreen;
var
  X, I: Integer;
  strCabNom: String;

begin

  for I := 1 to 12 do
  begin

    (FindComponent( 'cxLabelMaquina' + Format( '%.*d', [2,I] ) ) as TcxLabel).Caption := EmptyStr;
    (FindComponent( 'cxLabelMaquina' + Format( '%.*d', [2,I] ) ) as TcxLabel).Style.Color := clBlack;
    (FindComponent( 'cxLabelMaquina' + Format( '%.*d', [2,I] ) ) as TcxLabel).Style.BorderStyle := ebsNone;

    for X := 1 to 3 do
    begin

      case X of
        1: strCabNom := 'Parada';
        2: strCabNom := 'Setup';
        3: strCabNom := 'Produtivo';
      end;

      (FindComponent( 'cxLabel' + strCabNom + Format( '%.*d', [2,I] ) ) as TcxLabel).Caption := EmptyStr;
      (FindComponent( 'cxLabel' + strCabNom + Format( '%.*d', [2,I] ) ) as TcxLabel).Style.Color := clBlack

    end;

    for X := 1 to 9 do
    begin

      (FindComponent( 'cxLabelHora' + Format( '%.*d', [2,X] ) + Format( '%.*d', [2,I] ) ) as TcxLabel).Caption := EmptyStr;
      (FindComponent( 'cxLabelHora' + Format( '%.*d', [2,X] ) + Format( '%.*d', [2,I] ) ) as TcxLabel).Style.Color := clBlack

    end;

  end;

end;

procedure TFr_PainelLider.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  Action := caFree;
  Fr_PainelLider := nil;
  Fr_Brady.dxSkinController.UseSkins := True;

end;

procedure TFr_PainelLider.FormCreate(Sender: TObject);
begin

  if Fr_Brady.PainelLider then
  begin

    TimerRefresh.Enabled := True;

  end
  else
  begin

    TimerRefresh.Enabled := False;

  end;

end;

procedure TFr_PainelLider.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  if Key in [VK_DOWN,VK_LEFT,VK_UP,VK_RIGHT] then
  begin

    if MonitorAtual = 0 then
      RefreshScreen;

    RefreshMonitor;

    MonitorAtual := MonitorAtual +1;

  end;

end;

procedure TFr_PainelLider.FormShow(Sender: TObject);
var
  varKey: Word;
begin

  if not Fr_Brady.PainelLider then
  begin

    varKey := VK_DOWN;
    OnKeyDown( Self, varKey, [] );

  end;

end;

procedure TFr_PainelLider.RefreshMonitor;
var
  X, I: Integer;
  strCabNom: String;

begin

  if MonitorAtual = 0 then
    Exit;

  if Tag = 0 then
    Exit;

  cxLabelMonitor.Caption := IntToStr(MonitorAtual) + '/' + IntToStr(TotalMonitor);

  ClearScreen;
  for I := 1 to 12 do
  begin

    (FindComponent( 'cxLabelMaquina' + Format( '%.*d', [2,I] ) ) as TcxLabel).Caption := FDQueryHeaderTMAQ_MAQNOMRED.AsString;
    if FDQueryHeaderTMAQ_MAQCOR.AsString = 'R' then
      (FindComponent( 'cxLabelMaquina' + Format( '%.*d', [2,I] ) ) as TcxLabel).Style.Color := clRed
    else
      (FindComponent( 'cxLabelMaquina' + Format( '%.*d', [2,I] ) ) as TcxLabel).Style.Color := clBlack;
    (FindComponent( 'cxLabelMaquina' + Format( '%.*d', [2,I] ) ) as TcxLabel).Style.BorderStyle := ebsOffice11;

    for X := 1 to 3 do
    begin

      case X of
        3: strCabNom := 'Parada';
        2: strCabNom := 'Setup';
        1: strCabNom := 'Produtivo';
      end;

      (FindComponent( 'cxLabel' + strCabNom + Format( '%.*d', [2,I] ) ) as TcxLabel).Caption := FormatFloat('#0', FDQueryHeaderTMAQ_APOPER.AsFloat );
      if FDQueryHeaderTMAQ_APOCOR.AsString = 'R' then
        (FindComponent( 'cxLabel' + strCabNom + Format( '%.*d', [2,I] ) ) as TcxLabel).Style.Color := clRed
      else
        (FindComponent( 'cxLabel' + strCabNom + Format( '%.*d', [2,I] ) ) as TcxLabel).Style.Color := clGreen;

      FDQueryHeader.Next;

      if FDQueryHeader.Eof then
        Break;

    end;

    for X := 1 to 9 do
    begin

      (FindComponent( 'cxLabelHora' + Format( '%.*d', [2,X] ) + Format( '%.*d', [2,I] ) ) as TcxLabel).Caption := FormatFloat('#0', FDQueryHoraTMAQ_APOPER.AsFloat );

      if FDQueryHoraTMAQ_APOCOR.AsString = 'Y' then
      begin

        (FindComponent( 'cxLabelHora' + Format( '%.*d', [2,X] ) + Format( '%.*d', [2,I] ) ) as TcxLabel).Style.Color := clYellow;
        (FindComponent( 'cxLabelHora' + Format( '%.*d', [2,X] ) + Format( '%.*d', [2,I] ) ) as TcxLabel).Style.Font.Color := clBlack;

      end
      else
      if FDQueryHoraTMAQ_APOCOR.AsString = 'G' then
      begin

        (FindComponent( 'cxLabelHora' + Format( '%.*d', [2,X] ) + Format( '%.*d', [2,I] ) ) as TcxLabel).Style.Color := clBlue;
        (FindComponent( 'cxLabelHora' + Format( '%.*d', [2,X] ) + Format( '%.*d', [2,I] ) ) as TcxLabel).Style.Font.Color := clWhite;

      end
      else
      if FDQueryHoraTMAQ_APOCOR.AsString = 'C' then
      begin

        (FindComponent( 'cxLabelHora' + Format( '%.*d', [2,X] ) + Format( '%.*d', [2,I] ) ) as TcxLabel).Caption := EmptyStr;
        (FindComponent( 'cxLabelHora' + Format( '%.*d', [2,X] ) + Format( '%.*d', [2,I] ) ) as TcxLabel).Style.Color := clGray;

      end
      else
      if FDQueryHoraTMAQ_APOCOR.AsString = 'R' then
      begin

        (FindComponent( 'cxLabelHora' + Format( '%.*d', [2,X] ) + Format( '%.*d', [2,I] ) ) as TcxLabel).Caption := EmptyStr;
        (FindComponent( 'cxLabelHora' + Format( '%.*d', [2,X] ) + Format( '%.*d', [2,I] ) ) as TcxLabel).Style.Color := clWhite;

      end;

      FDQueryHora.Next;

      if FDQueryHora.Eof then
        Break;

    end;

    if FDQueryHeader.Eof then
      Break;

  end;


end;

procedure TFr_PainelLider.RefreshScreen;
var
  X, I: Integer;

begin

  if Tag = 0 then
  begin

    FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );
    FDConnection.Open;

  end;

  try

    if Tag = 0 then
    begin

      FDQueryHoras.Open;

    end;

    try

      X := 1;
      for I := FDQueryHorasTMAQ_APODATINI.AsInteger to FDQueryHorasTMAQ_APODATFIM.AsInteger do
      begin

        (FindComponent( 'cxLabelHora' + Format( '%.*d', [2,X] ) ) as TcxLabel).Caption := Format( '%.*d', [2,I] ) + ':00 - ' + Format( '%.*d', [2,I+1] ) + ':00';
        X := X + 1;

      end;

    finally

      if Tag = 9 then
      begin

        FDQueryHoras.Close;

      end;

    end;

    if Tag = 0 then
    begin

      if Tambore then
      begin

        FDQueryHeader.ParamByName('TMAQ_SITCOD').AsInteger := 2;
        FDQueryHora.ParamByName('TMAQ_SITCOD').AsInteger := 2;

      end
      else
      begin

        FDQueryHeader.ParamByName('TMAQ_SITCOD').AsInteger := 3;
        FDQueryHora.ParamByName('TMAQ_SITCOD').AsInteger := 3;

      end;

      FDQueryHeader.Open;
      FDQueryHora.Open;

    end;

    try

      X := 0;
      FDQueryHeader.First;
      while not FDQueryHeader.Eof do
      begin

        Inc(X,1);
        FDQueryHeader.Next;

      end;

      TotalMaquinas := Trunc(X / 3.00);
      TotalMonitor := Trunc(X / 12.00 / 3.00);
      if Frac(X / 12.00 / 3.00) > 0 then
        TotalMonitor := TotalMonitor + 1;

      FDQueryHeader.First;
      FDQueryHora.First;
      MonitorAtual := 1;

      if Fr_Brady.PainelLider then
      begin

        while MonitorAtual > 0 do
        begin

          BringToFront;
          Update;

          if MonitorAtual <> 1 then
            Sleep(10000);

          BringToFront;
          Update;

          RefreshMonitor;

          MonitorAtual := MonitorAtual + 1;

        end;

      end;

    finally

      if Tag = 9 then
      begin

        FDQueryHeader.Close;
        FDQueryHora.Close;

      end;

    end;

  finally

    if Tag = 9 then
    begin

      FDConnection.Close;

    end;

  end;

  if Tag = 9 then
  begin

    Tag := 0;

  end
  else
  begin

    Tag := Tag + 1;

  end;

end;

procedure TFr_PainelLider.SetAskMonitor(const Value: Integer);
begin

  FAskMonitor := Value;
  if FAskMonitor > TotalMonitor then
  begin

    FAskMonitor := 1;

  end;

end;

procedure TFr_PainelLider.SetMonitorAtual(const Value: Integer);
begin

  FMonitorAtual := Value;
  if Value > TotalMonitor then
  begin

    FMonitorAtual := 0;

  end;

end;

procedure TFr_PainelLider.SetTotalMaquinas(const Value: Integer);
begin

  if FTotalMaquinas <> Value then
  begin

    FMonitorAtual := 0;
    FTotalMaquinas := Value;

  end;

end;

procedure TFr_PainelLider.TimerRefreshTimer(Sender: TObject);
begin

  TimerRefresh.Enabled := False;
  try

    try

      RefreshScreen;

    except
    end;

  finally

    TimerRefresh.Enabled := True;

  end;

end;

end.
