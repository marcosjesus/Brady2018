unit uAddObservacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFr_AddObservacao = class(TForm)
    MemoObservacao: TMemo;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fr_AddObservacao: TFr_AddObservacao;

implementation

{$R *.dfm}

procedure TFr_AddObservacao.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  if Key = 13 then
  begin
    Close;
  end;

end;

end.
