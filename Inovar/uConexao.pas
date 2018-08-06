unit uConexao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.Imaging.jpeg, System.Actions, Vcl.ActnList,
  Vcl.Styles, Vcl.Themes, Vcl.Touch.GestureMgr, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Data.Bind.Components, Vcl.Buttons;

type
  TConfiguracaoForm = class(TForm)
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
    Label1: TLabel;
    EditServidor: TEdit;
    Label2: TLabel;
    EditArquivo: TEdit;
    EditUsuario: TEdit;
    Label3: TLabel;
    EditSenha: TEdit;
    Label4: TLabel;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    SpeedButtonConexao: TSpeedButton;
    procedure BackToMainForm(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormGesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
    procedure SpeedButtonConexaoClick(Sender: TObject);
  private
    { Private declarations }
    procedure AppBarResize;
    procedure AppBarShow(mode: integer);
  public
    { Public declarations }
  end;

var
  ConfiguracaoForm: TConfiguracaoForm = nil;

implementation

{$R *.dfm}

uses uInovarAuto, uDataModule;

procedure TConfiguracaoForm.Action1Execute(Sender: TObject);
begin
  AppBarShow(-1);
end;

const
  AppBarHeight = 75;

procedure TConfiguracaoForm.AppBarResize;
begin
  AppBar.SetBounds(0, AppBar.Parent.Height - AppBarHeight,
    AppBar.Parent.Width, AppBarHeight);
end;

procedure TConfiguracaoForm.AppBarShow(mode: integer);
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

procedure TConfiguracaoForm.FormCreate(Sender: TObject);
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

procedure TConfiguracaoForm.FormGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin

  AppBarShow(0);

end;

procedure TConfiguracaoForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if Key = VK_ESCAPE then
    AppBarShow(-1)
  else
    AppBarShow(0);

end;

procedure TConfiguracaoForm.FormResize(Sender: TObject);
begin

  AppBarResize;

end;

procedure TConfiguracaoForm.FormShow(Sender: TObject);
begin

  AppBarShow(0);

end;

procedure TConfiguracaoForm.SpeedButtonConexaoClick(Sender: TObject);
begin

  dInovarAuto.FDConnectionFirebird.LoginPrompt := False;
  dInovarAuto.FDConnectionFirebird.Params.Clear;
  dInovarAuto.FDConnectionFirebird.Params.Add(Format('DriverID=%s',     ['FB']));
  dInovarAuto.FDConnectionFirebird.Params.Add(Format('Server=%s',       [dInovarAuto.FDMemTableParametrosConexaoservidor.AsString]));
  dInovarAuto.FDConnectionFirebird.Params.Add(Format('Database=%s',     [dInovarAuto.FDMemTableParametrosConexaoarquivo.AsString]));
  dInovarAuto.FDConnectionFirebird.Params.Add(Format('user_name=%s',    [dInovarAuto.FDMemTableParametrosConexaousuario.AsString]));
  dInovarAuto.FDConnectionFirebird.Params.Add(Format('password=%s',     [dInovarAuto.FDMemTableParametrosConexaosenha.AsString]));

  dInovarAuto.FDConnectionFirebird.Close;
  try

    dInovarAuto.FDConnectionFirebird.Open;
    Application.MessageBox('Conexão efetuada com sucesso!!!', PChar(Application.Title), MB_ICONINFORMATION);

  except

    on E: Exception do
    begin

      Application.MessageBox(PChar('Erro ao efetuado conexão!!!'#13#10 + E.Message), PChar(Application.Title), MB_ICONERROR);

    end;

  end;

end;

procedure TConfiguracaoForm.BackToMainForm(Sender: TObject);
begin

  Hide;
  GridForm.BringToFront;

end;

end.
