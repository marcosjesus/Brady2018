unit uImportaNF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.Imaging.jpeg, System.Actions, Vcl.ActnList,
  Vcl.Styles, Vcl.Themes, Vcl.Touch.GestureMgr, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Data.Bind.Components, Vcl.Buttons, Vcl.Imaging.GIFImg,
  Vcl.Grids, Vcl.DBGrids, Data.DB, Vcl.DBCtrls, System.DateUtils,
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Stan.Intf, FireDAC.Comp.UI;

type
  TImportaNF = class(TForm)
    Panel1: TPanel;
    TitleLabel: TLabel;
    Image1: TImage;
    ScrollBox1: TScrollBox;
    TextPanel: TPanel;
    ItemTitle: TLabel;
    ItemSubtitle: TLabel;
    Image2: TImage;
    AppBar: TPanel;
    GestureManager1: TGestureManager;
    ActionList1: TActionList;
    Action1: TAction;
    CloseButton: TImage;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    ListBox1: TListBox;
    SpeedButtonConexao: TSpeedButton;
    BindingsList1: TBindingsList;
    LinkFillControlToPropertyFilter: TLinkFillControlToProperty;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    SpeedButton1: TSpeedButton;
    procedure BackToMainForm(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormGesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
    procedure SpeedButtonConexaoClick(Sender: TObject);
    procedure LinkFillControlToPropertyFilterAssigningValue(Sender: TObject;
      AssignValueRec: TBindingAssignValueRec; var Value: TValue;
      var Handled: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    procedure AppBarResize;
    procedure AppBarShow(mode: integer);
  public
    { Public declarations }
  end;

var
  ImportaNF: TImportaNF = nil;

implementation

{$R *.dfm}

uses uInovarAuto, uDataModule;

procedure TImportaNF.Action1Execute(Sender: TObject);
begin
  AppBarShow(-1);
end;

const
  AppBarHeight = 75;

procedure TImportaNF.AppBarResize;
begin
  AppBar.SetBounds(0, AppBar.Parent.Height - AppBarHeight,
    AppBar.Parent.Width, AppBarHeight);
end;

procedure TImportaNF.AppBarShow(mode: integer);
begin
  if mode = -1 then // Toggle
    mode := integer(not AppBar.Visible );

  if mode = 0 then
    AppBar.Visible := False
  else
  begin
    AppBar.Visible := True;
    AppBar.BringToFront;
  end;
end;

procedure TImportaNF.FormCreate(Sender: TObject);
var
  LStyle: TCustomStyleServices;
  MemoColor, MemoFontColor: TColor;

begin

  //Set background color for memos to the color of the form, from the active style.
  LStyle := TStyleManager.ActiveStyle;
  MemoColor := LStyle.GetStyleColor(scGenericBackground);
  MemoFontColor := LStyle.GetStyleFontColor(sfButtonTextNormal);

  //Fill image
  GridForm.PickImageColor(Image2, clBtnShadow);

end;

procedure TImportaNF.FormGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin

  AppBarShow(0);

end;

procedure TImportaNF.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if Key = VK_ESCAPE then
    AppBarShow(-1)
  else
    AppBarShow(0);

end;

procedure TImportaNF.FormResize(Sender: TObject);
begin

  AppBarResize;

end;

procedure TImportaNF.FormShow(Sender: TObject);
var
  iAno, iMes: Integer;

begin

  AppBarShow(0);

  ListBox1.Items.Clear;
  for iAno := YearOf(Now)-5 to YearOf(Now) do
    for iMes := 1 to 12 do
      if EncodeDate(iAno, iMes, 1) <= Now then
        ListBox1.Items.Add(FormatDateTime('yyyy-mmm',EncodeDate(iAno, iMes, 1)));

  ListBox1.Selected[ListBox1.Count-1] := True;

end;

procedure TImportaNF.LinkFillControlToPropertyFilterAssigningValue(
  Sender: TObject; AssignValueRec: TBindingAssignValueRec; var Value: TValue;
  var Handled: Boolean);
var
  DataInicial: TDateTime;

  function getMes(str: string): Integer;
  begin

    str := copy( str, 6, 3 );

    if str = 'jan' then result := 01 else
    if str = 'fev' then result := 02 else
    if str = 'mar' then result := 03 else
    if str = 'abr' then result := 04 else
    if str = 'mai' then result := 05 else
    if str = 'jun' then result := 06 else
    if str = 'jul' then result := 07 else
    if str = 'ago' then result := 08 else
    if str = 'set' then result := 09 else
    if str = 'out' then result := 10 else
    if str = 'nov' then result := 11 else
    if str = 'dez' then result := 12;

  end;

begin

  DataInicial := EncodeDate( StrToInt(Copy(Value.AsString, 1, 4)), getMes(Value.AsString), 01 );
  Value := 'mes = ' + IntToStr( MonthOf(DataInicial) ) + ' AND ano = ' + IntToStr( YearOf(DataInicial) );

end;

procedure TImportaNF.SpeedButton1Click(Sender: TObject);
var
  Indice: Integer;
  DataInicial, DataFinal: TDateTime;
  StrFileName: TStringList;
  I: Integer;
  TotNotaFiscal: Extended;
  TotParcela: Extended;

  function getMes(str: string): Integer;
  begin

    str := copy( str, 6, 3 );

    if str = 'jan' then result := 01 else
    if str = 'fev' then result := 02 else
    if str = 'mar' then result := 03 else
    if str = 'abr' then result := 04 else
    if str = 'mai' then result := 05 else
    if str = 'jun' then result := 06 else
    if str = 'jul' then result := 07 else
    if str = 'ago' then result := 08 else
    if str = 'set' then result := 09 else
    if str = 'out' then result := 10 else
    if str = 'nov' then result := 11 else
    if str = 'dez' then result := 12;

  end;

begin

  StrFileName := TStringList.Create;
  try

    for Indice := 0 to ListBox1.Count-1 do
    begin

      if ListBox1.Selected[Indice] then
      begin

        DataInicial := EncodeDate( StrToInt(Copy(ListBox1.Items[Indice], 1, 4)), getMes(ListBox1.Items[Indice]), 01 );
        DataFinal := IncMonth(DataInicial)-1;

        dInovarAuto.FDMemTableClientes.First;
        while not dInovarAuto.FDMemTableClientes.Eof do
        begin

          TotNotaFiscal := 0;
          TotParcela := 0;

          dInovarAuto.FDMemTableNotaFiscal.Filter := 'CNPJ = ' + QuotedStr( dInovarAuto.FDMemTableClientesCNPJ.AsString ) + ' AND mes = ' + IntToStr( MonthOf(DataInicial) ) + ' AND ano = ' + IntToStr( YearOf(DataInicial) );
          while not dInovarAuto.FDMemTableNotaFiscal.Eof do
            dInovarAuto.FDMemTableNotaFiscal.Delete;

          StrFileName.LoadFromFile(StringReplace(Application.ExeName, '.exe', '.txt', [rfReplaceAll]));
          for I := 1 to StrFileName.Count-1 do
          begin

            if (StrToDate(StrFileName[I].Split([';'])[0]) >= DataInicial) and (StrToDate(StrFileName[I].Split([';'])[0]) <= DataFinal) then
            begin

              if StrFileName[I].Split([';'])[1] = StringReplace(StringReplace(StringReplace(dInovarAuto.FDMemTableClientesCNPJ.AsString,'.','',[rfReplaceAll]),'/','',[rfReplaceAll]),'-','',[rfReplaceAll]) then
              begin

                TotNotaFiscal := TotNotaFiscal + StrToFloat(StrFileName[I].Split([';'])[2]);
                TotParcela := TotParcela + StrToFloat(StrFileName[I].Split([';'])[3]);

              end;

            end;

          end;

          dInovarAuto.FDMemTableNotaFiscal.Append;
          dInovarAuto.FDMemTableNotaFiscalCNPJ.AsString := dInovarAuto.FDMemTableClientesCNPJ.AsString;
          dInovarAuto.FDMemTableNotaFiscalRazaoSocial.AsString := dInovarAuto.FDMemTableClientesRazaoSocial.AsString;
          dInovarAuto.FDMemTableNotaFiscalmes.AsInteger := MonthOf(DataInicial);
          dInovarAuto.FDMemTableNotaFiscalano.AsInteger := YearOf(DataInicial);
          dInovarAuto.FDMemTableNotaFiscaltot_nota.AsFloat := TotNotaFiscal;
          dInovarAuto.FDMemTableNotaFiscalparc_dedutivel.AsFloat := TotParcela;

          dInovarAuto.FDMemTableClientes.Next;

        end;

        dInovarAuto.FDMemTableNotaFiscal.Filter := 'mes = ' + IntToStr( MonthOf(DataInicial) ) + ' AND ano = ' + IntToStr( YearOf(DataInicial) );

      end;

    end;

  finally

    FreeAndNil(StrFileName);

  end;

end;

procedure TImportaNF.SpeedButtonConexaoClick(Sender: TObject);
var
  Indice: Integer;
  DataInicial, DataFinal: TDateTime;

  function getMes(str: string): Integer;
  begin

    str := copy( str, 6, 3 );

    if str = 'jan' then result := 01 else
    if str = 'fev' then result := 02 else
    if str = 'mar' then result := 03 else
    if str = 'abr' then result := 04 else
    if str = 'mai' then result := 05 else
    if str = 'jun' then result := 06 else
    if str = 'jul' then result := 07 else
    if str = 'ago' then result := 08 else
    if str = 'set' then result := 09 else
    if str = 'out' then result := 10 else
    if str = 'nov' then result := 11 else
    if str = 'dez' then result := 12;

  end;

begin

  for Indice := 0 to ListBox1.Count-1 do
  begin

    if ListBox1.Selected[Indice] then
    begin

      DataInicial := EncodeDate( StrToInt(Copy(ListBox1.Items[Indice], 1, 4)), getMes(ListBox1.Items[Indice]), 01 );
      DataFinal := IncMonth(DataInicial)-1;


      dInovarAuto.FDMemTableClientes.First;
      while not dInovarAuto.FDMemTableClientes.Eof do
      begin

        dInovarAuto.FDQueryNotaFiscal.ParamByName('SAIDA_INI').AsDateTime := DataInicial;
        dInovarAuto.FDQueryNotaFiscal.ParamByName('SAIDA_FIM').AsDateTime := DataFinal;
        dInovarAuto.FDQueryNotaFiscal.ParamByName('CGCCLIE').AsString := dInovarAuto.FDMemTableClientesCNPJ.AsString;
        dInovarAuto.FDQueryNotaFiscal.Close;
        dInovarAuto.FDQueryNotaFiscal.Open;

        dInovarAuto.FDMemTableNotaFiscal.Filter := 'CNPJ = ' + QuotedStr( dInovarAuto.FDMemTableClientesCNPJ.AsString ) + ' AND mes = ' + IntToStr( MonthOf(DataInicial) ) + ' AND ano = ' + IntToStr( YearOf(DataInicial) );

        while not dInovarAuto.FDMemTableNotaFiscal.Eof do
          dInovarAuto.FDMemTableNotaFiscal.Delete;

        dInovarAuto.FDMemTableNotaFiscal.Append;

        dInovarAuto.FDMemTableNotaFiscalCNPJ.AsString := dInovarAuto.FDMemTableClientesCNPJ.AsString;
        dInovarAuto.FDMemTableNotaFiscalRazaoSocial.AsString := dInovarAuto.FDMemTableClientesRazaoSocial.AsString;
        dInovarAuto.FDMemTableNotaFiscalmes.AsInteger := MonthOf(DataInicial);
        dInovarAuto.FDMemTableNotaFiscalano.AsInteger := YearOf(DataInicial);
        dInovarAuto.FDMemTableNotaFiscaltot_nota.AsFloat := dInovarAuto.FDQueryNotaFiscalTOTAL_NF.AsFloat;
        dInovarAuto.FDMemTableNotaFiscalparc_dedutivel.AsFloat := 0.00;

        dInovarAuto.FDMemTableNotaFiscal.Post;

        dInovarAuto.FDMemTableClientes.Next;

      end;

      dInovarAuto.FDMemTableNotaFiscal.Filter := 'mes = ' + IntToStr( MonthOf(DataInicial) ) + ' AND ano = ' + IntToStr( YearOf(DataInicial) );

    end;

  end;

end;

procedure TImportaNF.BackToMainForm(Sender: TObject);
begin

  Hide;
  GridForm.BringToFront;

end;

end.
