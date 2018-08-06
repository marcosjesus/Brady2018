unit uUtilsColuna;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.ValEdit, Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls;

type
  TFr_UtilColuna = class(TForm)
    ValueListEditorColumn: TValueListEditor;
    ImageListMenu: TImageList;
    PanelToolbar: TPanel;
    ToolBarMenu: TToolBar;
    ToolButton2: TToolButton;
    ToolButtonSalvar: TToolButton;
    ToolButton1: TToolButton;
    ToolButtonCancelar: TToolButton;
    procedure ToolButtonSalvarClick(Sender: TObject);
    procedure ToolButtonCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fr_UtilColuna: TFr_UtilColuna;

implementation

{$R *.dfm}

procedure TFr_UtilColuna.ToolButtonCancelarClick(Sender: TObject);
begin

  ModalResult := mrCancel;

end;

procedure TFr_UtilColuna.ToolButtonSalvarClick(Sender: TObject);
begin

  ModalResult := mrOk;

end;

end.
