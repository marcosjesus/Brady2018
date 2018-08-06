program EntradaXML;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {FR_Principal},
  DBConect in 'DBConect.pas' {DB_Conect: TDataModule},
  Login in 'Login.pas' {FrmLogin},
  uConsultaDocumento in 'uConsultaDocumento.pas' {frmConsultaDocumento},
  uUsuario in 'uUsuario.pas' {frmCadUsuario},
  FCadastro in 'FCadastro.pas' {FrmCadastro},
  FGrid in 'FGrid.pas' {FrmGrid},
  FrmPrBs in 'FrmPrBs.pas' {ParamBase};

{$R *.res}
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDB_Conect, DB_Conect);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;

end.
