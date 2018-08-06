unit ufrmDialogDir;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, FileCtrl;

type
  TfrmDialogDir = class(TForm)
    DirectoryListBox: TDirectoryListBox;
    OK: TBitBtn;
    Cancelar: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function DialogDir(Title : string = 'Escolha o diretório';InitialDir : string = 'c:'):string;

var
  frmDialogDir: TfrmDialogDir;

implementation

{$R *.dfm}

function DialogDir(Title : string = 'Escolha o diretório';InitialDir : string = 'c:'):string;
begin
  Result := '';
  with TfrmDialogDir.Create(nil) do
  try
    DirectoryListBox.Directory := InitialDir;
    Caption := Title;
    ShowModal;
    if ModalResult = mrOk then
      Result := DirectoryListBox.Directory;
  finally
    Free;
  end;
end;


end.
