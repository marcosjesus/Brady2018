unit uUtilsOwner;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.ValEdit, Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinOffice2013White,
  cxLabel, Vcl.StdCtrls, dxSkinsDefaultPainters;

type
  TFr_UtilOwner = class(TForm)
    ValueListEditorColumn: TValueListEditor;
    ImageListMenu: TImageList;
    PanelToolbar: TPanel;
    ToolBarMenu: TToolBar;
    ToolButton2: TToolButton;
    ToolButtonSalvar: TToolButton;
    ToolButton1: TToolButton;
    ToolButtonCancelar: TToolButton;
    cxLabelCliente: TcxLabel;
    PanelDistribuidor: TPanel;
    CheckBoxDistribuidor: TCheckBox;
    procedure ToolButtonSalvarClick(Sender: TObject);
    procedure ToolButtonCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fr_UtilOwner: TFr_UtilOwner;

implementation

{$R *.dfm}

uses uBrady;

procedure TFr_UtilOwner.FormShow(Sender: TObject);
begin

  if not Fr_Brady.TSIS_USUNOM.Equals('Marcio Tanada') then
  begin
    ShowMessage('Acesso não permitido.');
    FreeAndNil(Fr_UtilOwner);
  end;

end;

procedure TFr_UtilOwner.ToolButtonCancelarClick(Sender: TObject);
begin

  ModalResult := mrCancel;

end;

procedure TFr_UtilOwner.ToolButtonSalvarClick(Sender: TObject);
begin

  ModalResult := mrOk;

end;

end.
