unit uMainSplashScreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, dxGDIPlusClasses, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinOffice2013White, cxLabel, dxSkinsDefaultPainters;

type
  TFr_MainSplashScreen = class(TForm)
    PanelMainSplashScreen: TPanel;
    ImageMainSplashScreen: TImage;
    ImageLogo: TImage;
    cxLabelVersao: TcxLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fr_MainSplashScreen: TFr_MainSplashScreen;

implementation

{$R *.dfm}

uses uUtils;

procedure TFr_MainSplashScreen.FormCreate(Sender: TObject);
begin

  cxLabelVersao.Caption := 'Usuário: ' + uUtils.WUserName.Trim + '    - Máquina: ' + uUtils.ComputerName.Trim + '    - Versão: ' + uUtils.FileVersion.Trim + ' ';

end;

end.
