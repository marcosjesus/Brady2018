unit uUploadRouting;

interface

uses
  System.IOUtils,
  System.DateUtils,

  dxSpreadSheet,
  dxSpreadSheetTypes,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinOffice2013White, dxSkinscxPCPainter,
  dxBarBuiltInMenu, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, cxPC, cxContainer, cxEdit, cxTextEdit, cxLabel,
  cxMaskEdit, cxButtonEdit, cxGroupBox, cxRadioGroup, Vcl.Menus, Vcl.StdCtrls,
  cxButtons, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxGDIPlusClasses, Vcl.ExtCtrls;

type
  TFr_UploadRouting = class(TForm)
    FDConnection: TFDConnection;
    FDQueryVSOP_ClienteBySalesRep: TFDQuery;
    cxPageControlPivot: TcxPageControl;
    cxTabSheetPivot00: TcxTabSheet;
    SaveDialog: TSaveDialog;
    OpenDialog: TOpenDialog;
    FDQueryVSOP_ClienteBySalesRepTSOP_ORDBILGRUCLINOM: TStringField;
    FDQueryVSOP_ClienteBySalesRepTSOP_ORDBILCLICOD: TStringField;
    FDQueryVSOP_ClienteBySalesRepTSOP_ORDBILCLINOM: TStringField;
    FDQueryVSOP_ClienteBySalesRepBudget: TFDQuery;
    FDQueryVSOP_ClienteBySalesRepBudgetTSOP_ORDBILGRUCLINOM: TStringField;
    FDQueryVSOP_ClienteBySalesRepBudgetTSOP_ORDBILCLICOD: TStringField;
    FDQueryVSOP_ClienteBySalesRepBudgetTSOP_ORDBILCLINOM: TStringField;
    FDQueryVSOP_ClienteBySalesRepBudgetTSOP_BUDDAT: TSQLTimeStampField;
    FDQueryVSOP_ClienteBySalesRepBudgetTSOP_BUDVLF: TBCDField;
    PanelSQLSplashScreen: TPanel;
    ImageSQLSplashScreen: TImage;
    cxLabelMensagem: TcxLabel;
    FDQueryTSOP_Budget: TFDQuery;
    FDQueryTSOP_BudgetTSOP_BUDCOD: TFDAutoIncField;
    FDQueryTSOP_BudgetTSOP_BUDTIP: TStringField;
    FDQueryTSOP_BudgetTSOP_BUDDATREF: TSQLTimeStampField;
    FDQueryTSOP_BudgetTSOP_BUDDAT: TSQLTimeStampField;
    FDQueryTSOP_BudgetTSOP_BUDCLICOD: TStringField;
    FDQueryTSOP_BudgetTSOP_BUDVLF: TBCDField;
    FDQueryVSOP_ClienteBySalesRepTSOP_ORDBILREPNOM: TStringField;
    FDQueryVSOP_ClienteBySalesRepTSOP_ORDBILREGEST: TStringField;
    FDQueryVSOP_ClienteBySalesRepTSOP_ORDBILREG: TStringField;
    FDQueryVSOP_ClienteFamiliaBySalesRep: TFDQuery;
    FDQueryVSOP_ClienteFamiliaBySalesRepTSOP_ORDBILGRUCLINOM: TStringField;
    FDQueryVSOP_ClienteFamiliaBySalesRepTSOP_ORDBILCLICOD: TStringField;
    FDQueryVSOP_ClienteFamiliaBySalesRepTSOP_ORDBILCLINOM: TStringField;
    FDQueryVSOP_ClienteFamiliaBySalesRepTSOP_ORDBILREPNOM: TStringField;
    FDQueryVSOP_ClienteFamiliaBySalesRepTSOP_ORDBILREGEST: TStringField;
    FDQueryVSOP_ClienteFamiliaBySalesRepTSOP_ORDBILREG: TStringField;
    FDQueryVSOP_ClienteFamiliaBySalesRepBudget: TFDQuery;
    FDQueryVSOP_ClienteFamiliaBySalesRepBudgetTSOP_ORDBILGRUCLINOM: TStringField;
    FDQueryVSOP_ClienteFamiliaBySalesRepBudgetTSOP_ORDBILCLICOD: TStringField;
    FDQueryVSOP_ClienteFamiliaBySalesRepBudgetTSOP_ORDBILCLINOM: TStringField;
    FDQueryVSOP_ClienteFamiliaBySalesRepBudgetTSOP_BUDDAT: TSQLTimeStampField;
    FDQueryVSOP_ClienteFamiliaBySalesRepBudgetTSOP_BUDVLF: TBCDField;
    FDQueryVSOP_ClienteFamiliaBySalesRepTSOP_ORDBILITEFAMPAI: TStringField;
    FDQueryVSOP_ClienteFamiliaBySalesRepTSOP_ORDBILITEFAM: TStringField;
    FDQueryVSOP_ClienteFamiliaBySalesRepBudgetTSOP_ORDBILITEFAMPAI: TStringField;
    FDQueryVSOP_ClienteFamiliaBySalesRepBudgetTSOP_ORDBILITEFAM: TStringField;
    FDQueryVSOP_ClienteFamiliaBySalesRepTSOP_ORDBILSITNOM: TStringField;
    FDQueryVSOP_ClienteBySalesRepTSOP_ORDBILSITNOM: TStringField;
    FDQueryVSOP_ClienteBySalesRepBudgetTSOP_ORDBILSITNOM: TStringField;
    FDQueryVSOP_ClienteBySalesRepBilling: TFDQuery;
    FDQueryVSOP_ClienteFamiliaBySalesRepBudgetTSOP_ORDBILSITNOM: TStringField;
    FDQueryVSOP_ClienteFamiliaBySalesRepBilling: TFDQuery;
    FDQueryTSOP_BudgetTSOP_BUDFAM: TStringField;
    FDQueryTSOP_BudgetTSOP_ORDBILSITNOM: TStringField;
    FDQueryVSOP_ClienteBySalesRepBillingTSOP_ORDBILGRUCLINOM: TStringField;
    FDQueryVSOP_ClienteBySalesRepBillingTSOP_ORDBILCLICOD: TStringField;
    FDQueryVSOP_ClienteBySalesRepBillingTSOP_ORDBILCLINOM: TStringField;
    FDQueryVSOP_ClienteBySalesRepBillingTSOP_ORDBILSITNOM: TStringField;
    FDQueryVSOP_ClienteBySalesRepBillingTSOP_BUDDAT: TSQLTimeStampField;
    FDQueryVSOP_ClienteBySalesRepBillingTSOP_BUDVLF: TFMTBCDField;
    FDQueryVSOP_ClienteFamiliaBySalesRepBillingTSOP_ORDBILGRUCLINOM: TStringField;
    FDQueryVSOP_ClienteFamiliaBySalesRepBillingTSOP_ORDBILSITNOM: TStringField;
    FDQueryVSOP_ClienteFamiliaBySalesRepBillingTSOP_ORDBILCLICOD: TStringField;
    FDQueryVSOP_ClienteFamiliaBySalesRepBillingTSOP_ORDBILCLINOM: TStringField;
    FDQueryVSOP_ClienteFamiliaBySalesRepBillingTSOP_ORDBILITEFAMPAI: TStringField;
    FDQueryVSOP_ClienteFamiliaBySalesRepBillingTSOP_ORDBILITEFAM: TStringField;
    FDQueryVSOP_ClienteFamiliaBySalesRepBillingTSOP_BUDDAT: TSQLTimeStampField;
    FDQueryVSOP_ClienteFamiliaBySalesRepBillingTSOP_BUDVLF: TFMTBCDField;
    cxLabel1: TcxLabel;
    cxButtonProcessar: TcxButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fr_UploadRouting: TFr_UploadRouting;

implementation

{$R *.dfm}

uses uBrady, uUtils;

end.
