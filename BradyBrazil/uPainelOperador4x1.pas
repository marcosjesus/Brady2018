unit uPainelOperador4x1;

interface

uses
  System.IniFiles,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TFr_PainelOperador4x1 = class(TForm)
    ShapeHora: TShape;
    ShapeHora09: TShape;
    ShapeHora08: TShape;
    ShapeHora07: TShape;
    ShapeHora06: TShape;
    ShapeHora05: TShape;
    ShapeHora04: TShape;
    ShapeHora03: TShape;
    ShapeHora02: TShape;
    ShapeHora01: TShape;
    ShapeHeader: TShape;
    ShapeHora1: TShape;
    ShapeHora2: TShape;
    ShapeHora3: TShape;
    ShapeHora4: TShape;
    ShapeHora5: TShape;
    ShapeHora6: TShape;
    ShapeHora7: TShape;
    ShapeHora8: TShape;
    ShapeHora9: TShape;
    LabelHora1: TLabel;
    LabelHora2: TLabel;
    LabelHora3: TLabel;
    LabelHora4: TLabel;
    LabelHora5: TLabel;
    LabelHora6: TLabel;
    LabelHora7: TLabel;
    LabelHora8: TLabel;
    LabelHora9: TLabel;
    ShapeTurno1: TShape;
    ShapeTurno2: TShape;
    LabeledEditCelula: TLabeledEdit;
    LabeledEditMaquina: TLabeledEdit;
    LabeledEditOperador: TLabeledEdit;
    LabeledEditData: TLabeledEdit;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape1: TShape;
    Shape2: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    Shape10: TShape;
    Shape11: TShape;
    Shape12: TShape;
    Shape13: TShape;
    Shape14: TShape;
    Shape15: TShape;
    Shape16: TShape;
    Shape17: TShape;
    Shape18: TShape;
    Shape19: TShape;
    Shape20: TShape;
    Shape21: TShape;
    Shape22: TShape;
    Shape23: TShape;
    Shape24: TShape;
    Shape25: TShape;
    Shape26: TShape;
    Shape27: TShape;
    Shape28: TShape;
    Shape29: TShape;
    Shape30: TShape;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LabeledEditEnter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);

  private
    FCharRead: string;
    FDBMaquina: TStringList;
    procedure setMaquina(const Value: String);

    { Private declarations }
  protected

    { Protected declarations }
  public
    function db_getMaquinaNome( pMaquina: string ): string;
    function db_getMaquinaHoraFinal(pMaquina: string): integer;
    function db_getMaquinaHoraInicial(pMaquina: string): integer;
    procedure db_loadMaquinas;

    procedure OnReadChar;
    procedure OnReadMaquina;

    procedure ShowOwnerForm;

    property CharRead: string read FCharRead write FCharRead;
    property Maquina: String write setMaquina;
    property DBMaquina: TStringList read FDBMaquina;

    { Public declarations }
  end;

var
  Fr_PainelOperador4x1: array[1..4] of TFr_PainelOperador4x1;

implementation

{$R *.dfm}

uses uUtils;

function TFr_PainelOperador4x1.db_getMaquinaNome(pMaquina: string): string;
var
  I: Integer;

begin

  Result := EmptyStr;
  for I := 0 to DBMaquina.Count-1 do
  begin

    if DBMaquina[I].Split([';'])[0].Equals(pMaquina) then
      Result := DBMaquina[I].Split([';'])[2];

  end;

end;

function TFr_PainelOperador4x1.db_getMaquinaHoraInicial(pMaquina: string): integer;
var
  I: Integer;

begin

  Result := -1;
  for I := 0 to DBMaquina.Count-1 do
  begin

    if DBMaquina[I].Split([';'])[0].Equals(pMaquina) then
      Result := StrToIntDef(DBMaquina[I].Split([';'])[3],-1);

  end;

end;

function TFr_PainelOperador4x1.db_getMaquinaHoraFinal(pMaquina: string): integer;
var
  I: Integer;

begin

  Result := -1;
  for I := 0 to DBMaquina.Count-1 do
  begin

    if DBMaquina[I].Split([';'])[0].Equals(pMaquina) then
      Result := StrToIntDef(DBMaquina[I].Split([';'])[4],-1);

  end;

end;

procedure TFr_PainelOperador4x1.db_loadMaquinas;
begin

  FDBMaquina.LoadFromFile( MyDocumentsPath + '\DB'+IntToStr(Tag)+'\Maquina.db' );

end;

procedure TFr_PainelOperador4x1.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  FDBMaquina.Free;

  Action := caFree;
  Fr_PainelOperador4x1[Tag] := nil;

end;

procedure TFr_PainelOperador4x1.FormCreate(Sender: TObject);
begin

  FDBMaquina := TStringList.Create;

end;

procedure TFr_PainelOperador4x1.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  if Key = 13 then
  begin

    OnReadChar;
    CharRead := EmptyStr;

  end
  else
  begin

    if Key > 31 then
      CharRead := CharRead + Char(Key);

  end;

end;

procedure TFr_PainelOperador4x1.LabeledEditEnter(Sender: TObject);
begin

  ActiveControl := nil;

end;

procedure TFr_PainelOperador4x1.OnReadChar;
begin

  if (Copy( CharRead, 1, 3 ) = '100') and (Length(CharRead) = 7) then
  begin

    OnReadMaquina;

  end;

end;

procedure TFr_PainelOperador4x1.OnReadMaquina;
begin

  Maquina := CharRead;

end;

procedure TFr_PainelOperador4x1.setMaquina(const Value: String);
var
  I: Integer;
begin

  if not db_getMaquinaNome( Value ).IsEmpty then
  begin

    for I := 1 to 4 do
    begin

      Fr_PainelOperador4x1[I].Visible := False;

    end;

    for I := 1 to 4 do
    begin

      if db_getMaquinaNome(Value).Equals(Fr_PainelOperador4x1[I].LabeledEditMaquina.Text) then
        Fr_PainelOperador4x1[I].ShowOwnerForm;

    end;

  end;

end;

procedure TFr_PainelOperador4x1.ShowOwnerForm;
begin

  (Owner as TForm).Visible := True;
  (Owner as TForm).BringToFront;
  (Owner as TForm).Update;

end;

end.
