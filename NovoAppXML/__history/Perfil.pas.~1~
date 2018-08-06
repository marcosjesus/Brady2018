unit Perfil ;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fcadastro, ComCtrls, StdCtrls, Buttons, ToolWin, ExtCtrls, rsEdit, Mask,
  dbTables, rsFlyovr, RseditDB, jpeg, Menus, cxLookAndFeelPainters,
  cxButtons, cxGraphics, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinsdxStatusBarPainter, cxControls, dxStatusBar, cxLookAndFeels,
  dxSkinBlack, dxSkinBlue, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2010Black, dxSkinOffice2010Blue ;

type
  TFrmPerfil = class(TFrmCadastro)
    Panel1: TPanel;
    Panel2: TPanel;
    EdiNome: TrsSuperEdit;
    EdiCodigo: TrsSuperEdit;
    procedure FormCreate(Sender: TObject);
    procedure ButNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Function Check : Boolean ; Override ;
  end;

var
  FrmPerfil: TFrmPerfil;

implementation

{$R *.DFM}

Uses
   Global, ObjFun, MensFun, TestFun ;

procedure TFrmPerfil.FormCreate(Sender: TObject);
begin
    LabCadTit.Caption := 'Cadastro dos Perfis' ;
    FormOperacao := 'PER-OPE' ;
    FormTabela := 'Perfil' ;
    FormChaves := 'CodPerfil' ;
    FormCtrlFocus := 'EdiCodigo' ;
    FormDataFocus := 'EdiNome' ;
    inherited;
end;

Function TFrmPerfil.Check : Boolean ;
Begin
    Result := inherited Check() ;
    If ( Not Result ) Then
       Exit ;
    Result := False ;
    If ( Test_IsEmptyStr(EdiNome.Text) ) Then
    Begin
        Mens_MensInf('Informe a descrição do perfil') ;
        EdiNome.SetFocus ;
        Exit ;
    End ;
    Result := True ;
End ;

procedure TFrmPerfil.ButNovoClick(Sender: TObject);
begin
  inherited;
  EdiCodigo.AsString := LastCodigo('CodPerfil', 'Perfil', '');
end;

end.

