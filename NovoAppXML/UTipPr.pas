unit UTipPr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, dxSkinsCore, dxSkinsDefaultPainters, Menus,
  cxLookAndFeelPainters, cxButtons, cxControls, cxContainer, cxEdit,
  cxGroupBox, cxRadioGroup, cxCheckBox, cxGraphics, cxLookAndFeels, dxSkinBlack,
  dxSkinBlue, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2010Black, dxSkinOffice2010Blue;

type
  TFTipPr = class(TForm)
    cxRadioGroup1: TcxRadioGroup;
    Panel1: TPanel;
    ButSair: TcxButton;
    cxButton1: TcxButton;
    Panel2: TPanel;
    chkImp: TcxCheckBox;
    procedure cxButton1Click(Sender: TObject);
    procedure ButSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vTipoImpressora : String;
    vTela : Boolean;
  end;

var
  FTipPr: TFTipPr;

implementation


{$R *.DFM}

procedure TFTipPr.cxButton1Click(Sender: TObject);
begin
  vTipoImpressora := IntToStr(cxRadioGroup1.ItemIndex+1);
  vTela           := not chkImp.Checked;

  ModalResult := mrOk;

end;

procedure TFTipPr.ButSairClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
