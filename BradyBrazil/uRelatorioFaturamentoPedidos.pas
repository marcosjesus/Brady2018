unit uRelatorioFaturamentoPedidos;

interface

uses
  System.IOUtils,
  System.DateUtils,


  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, cxClasses, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxCustomPivotGrid, cxDBPivotGrid, cxLabel,
  dxGDIPlusClasses, Vcl.ExtCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView,
  cxGrid, cxPC, dxSkinsDefaultPainters, dxSkinOffice2013White, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus, Vcl.StdCtrls,
  cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxCheckBox, cxCheckComboBox, FireDAC.Comp.ScriptCommands,
  FireDAC.Comp.Script, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue;

type
  TFr_RelatorioFaturamentoPedidos = class(TForm)
    cxGridFaturamentoPedidos: TcxGrid;
    cxGridLevelFaturamentoPedidos00: TcxGridLevel;
    cxGridLevelFaturamentoPedidos01: TcxGridLevel;
    cxGridLevelFaturamentoPedidos02: TcxGridLevel;
    cxGridLevelFaturamentoPedidos03: TcxGridLevel;
    cxGridLevelFaturamentoPedidos04: TcxGridLevel;
    cxGridLevelFaturamentoPedidos05: TcxGridLevel;
    cxGridLevelFaturamentoPedidos06: TcxGridLevel;
    cxGridLevelFaturamentoPedidos07: TcxGridLevel;
    cxGridLevelFaturamentoPedidos08: TcxGridLevel;
    cxGridLevelFaturamentoPedidos09: TcxGridLevel;
    cxGridLevelFaturamentoPedidos10: TcxGridLevel;
    cxGridLevelFaturamentoPedidos11: TcxGridLevel;
    cxTableViewFaturamentoPedidos01: TcxGridDBTableView;
    cxTableViewFaturamentoPedidos00: TcxGridDBTableView;
    cxTableViewFaturamentoPedidos02: TcxGridDBTableView;
    cxTableViewFaturamentoPedidos03: TcxGridDBTableView;
    cxTableViewFaturamentoPedidos04: TcxGridDBTableView;
    cxTableViewFaturamentoPedidos05: TcxGridDBTableView;
    cxTableViewFaturamentoPedidos06: TcxGridDBTableView;
    cxTableViewFaturamentoPedidos07: TcxGridDBTableView;
    cxTableViewFaturamentoPedidos08: TcxGridDBTableView;
    cxTableViewFaturamentoPedidos09: TcxGridDBTableView;
    cxTableViewFaturamentoPedidos10: TcxGridDBTableView;
    cxTableViewFaturamentoPedidos11: TcxGridDBTableView;
    DataSourceVSOP_OrderBilling01: TDataSource;
    FDConnection: TFDConnection;
    FDQueryVSOP_OrderBilling01: TFDQuery;
    PanelSQLSplashScreen: TPanel;
    ImageSQLSplashScreen: TImage;
    cxLabelMensagem: TcxLabel;
    FDQueryVSOP_OrderBilling00: TFDQuery;
    FDQueryVSOP_OrderBilling00TSOP_ORDBILCOD: TIntegerField;
    FDQueryVSOP_OrderBilling00TSOP_ORINOM: TStringField;
    FDQueryVSOP_OrderBilling00TSOP_ORDBILSITNOM: TStringField;
    FDQueryVSOP_OrderBilling00TSOP_ORDBILCANNOM: TStringField;
    FDQueryVSOP_OrderBilling00TSOP_ORDBILYEADOCCAL: TIntegerField;
    FDQueryVSOP_OrderBilling00TSOP_ORDBILMONDOCCAL: TIntegerField;
    FDQueryVSOP_OrderBilling00TSOP_ORDBILYEADOC: TIntegerField;
    FDQueryVSOP_OrderBilling00TSOP_ORDBILMONDOC: TIntegerField;
    FDQueryVSOP_OrderBilling00TSOP_ORDBILDATDOC: TSQLTimeStampField;
    FDQueryVSOP_OrderBilling00TSOP_ORDBILNRODOC: TStringField;
    FDQueryVSOP_OrderBilling00TSOP_ORDBILTIPDOC: TStringField;
    FDQueryVSOP_OrderBilling00TSOP_ORDBILNRODOCREF: TStringField;
    FDQueryVSOP_OrderBilling00TSOP_ORDBILYEADOCREQCAL: TIntegerField;
    FDQueryVSOP_OrderBilling00TSOP_ORDBILMONDOCREQCAL: TIntegerField;
    FDQueryVSOP_OrderBilling00TSOP_ORDBILYEADOCREQ: TIntegerField;
    FDQueryVSOP_OrderBilling00TSOP_ORDBILMONDOCREQ: TIntegerField;
    FDQueryVSOP_OrderBilling00TSOP_ORDBILDATDOCREQ: TSQLTimeStampField;
    FDQueryVSOP_OrderBilling00TSOP_ORDBILCLICOD: TStringField;
    FDQueryVSOP_OrderBilling00TSOP_ORDBILCLINOM: TStringField;
    FDQueryVSOP_OrderBilling00TSOP_ORDBILGRUCLINOM: TStringField;
    FDQueryVSOP_OrderBilling00TSOP_GRUCLIMER: TStringField;
    FDQueryVSOP_OrderBilling00TSOP_ORDBILREPNOM: TStringField;
    FDQueryVSOP_OrderBilling00TSOP_REPNOMINT: TStringField;
    FDQueryVSOP_OrderBilling00TSOP_REPCSR: TStringField;
    FDQueryVSOP_OrderBilling00TSOP_ORDBILITECOD: TStringField;
    FDQueryVSOP_OrderBilling00TSOP_ORDBILITENOM: TStringField;
    FDQueryVSOP_OrderBilling00TSOP_ORDBILITEUNI: TStringField;
    FDQueryVSOP_OrderBilling00TSOP_ORDBILITEFAM: TStringField;
    FDQueryVSOP_OrderBilling00TSOP_ORDBILITEFAM001: TStringField;
    FDQueryVSOP_OrderBilling00TSOP_ORDBILITEFAM002: TStringField;
    FDQueryVSOP_OrderBilling00TSOP_ORDBILITEFAM003: TStringField;
    FDQueryVSOP_OrderBilling00TSOP_ORDBILITEFAM004: TStringField;
    FDQueryVSOP_OrderBilling00TSOP_ORDBILITEFAM005: TStringField;
    FDQueryVSOP_OrderBilling00TSOP_ORDBILVALLIQ: TBCDField;
    FDQueryVSOP_OrderBilling00TSOP_ORDBILQTD: TBCDField;
    FDQueryVSOP_OrderBilling00TSOP_REPACCTYP: TStringField;
    DataSourceVSOP_OrderBilling00: TDataSource;
    cxTableViewFaturamentoPedidos00TSOP_ORDBILCOD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos00TSOP_ORINOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos00TSOP_ORDBILSITNOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos00TSOP_ORDBILCANNOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos00TSOP_ORDBILYEADOCCAL: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos00TSOP_ORDBILMONDOCCAL: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos00TSOP_ORDBILYEADOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos00TSOP_ORDBILMONDOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos00TSOP_ORDBILDATDOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos00TSOP_ORDBILNRODOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos00TSOP_ORDBILTIPDOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos00TSOP_ORDBILNRODOCREF: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos00TSOP_ORDBILYEADOCREQCAL: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos00TSOP_ORDBILMONDOCREQCAL: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos00TSOP_ORDBILYEADOCREQ: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos00TSOP_ORDBILMONDOCREQ: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos00TSOP_ORDBILDATDOCREQ: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos00TSOP_ORDBILCLICOD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos00TSOP_ORDBILCLINOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos00TSOP_ORDBILGRUCLINOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos00TSOP_GRUCLIMER: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos00TSOP_ORDBILREPNOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos00TSOP_REPNOMINT: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos00TSOP_REPCSR: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos00TSOP_ORDBILITECOD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos00TSOP_ORDBILITENOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos00TSOP_ORDBILITEUNI: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos00TSOP_ORDBILITEFAM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos00TSOP_ORDBILITEFAM001: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos00TSOP_ORDBILITEFAM002: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos00TSOP_ORDBILITEFAM003: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos00TSOP_ORDBILITEFAM004: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos00TSOP_ORDBILITEFAM005: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos00TSOP_ORDBILVALLIQ: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos00TSOP_ORDBILQTD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos00TSOP_REPACCTYP: TcxGridDBColumn;
    FDQueryVSOP_OrderBilling01TSOP_ORDBILCOD: TIntegerField;
    FDQueryVSOP_OrderBilling01TSOP_ORINOM: TStringField;
    FDQueryVSOP_OrderBilling01TSOP_ORDBILSITNOM: TStringField;
    FDQueryVSOP_OrderBilling01TSOP_ORDBILCANNOM: TStringField;
    FDQueryVSOP_OrderBilling01TSOP_ORDBILYEADOCCAL: TIntegerField;
    FDQueryVSOP_OrderBilling01TSOP_ORDBILMONDOCCAL: TIntegerField;
    FDQueryVSOP_OrderBilling01TSOP_ORDBILYEADOC: TIntegerField;
    FDQueryVSOP_OrderBilling01TSOP_ORDBILMONDOC: TIntegerField;
    FDQueryVSOP_OrderBilling01TSOP_ORDBILDATDOC: TSQLTimeStampField;
    FDQueryVSOP_OrderBilling01TSOP_ORDBILNRODOC: TStringField;
    FDQueryVSOP_OrderBilling01TSOP_ORDBILTIPDOC: TStringField;
    FDQueryVSOP_OrderBilling01TSOP_ORDBILNRODOCREF: TStringField;
    FDQueryVSOP_OrderBilling01TSOP_ORDBILYEADOCREQCAL: TIntegerField;
    FDQueryVSOP_OrderBilling01TSOP_ORDBILMONDOCREQCAL: TIntegerField;
    FDQueryVSOP_OrderBilling01TSOP_ORDBILYEADOCREQ: TIntegerField;
    FDQueryVSOP_OrderBilling01TSOP_ORDBILMONDOCREQ: TIntegerField;
    FDQueryVSOP_OrderBilling01TSOP_ORDBILDATDOCREQ: TSQLTimeStampField;
    FDQueryVSOP_OrderBilling01TSOP_ORDBILCLICOD: TStringField;
    FDQueryVSOP_OrderBilling01TSOP_ORDBILCLINOM: TStringField;
    FDQueryVSOP_OrderBilling01TSOP_ORDBILGRUCLINOM: TStringField;
    FDQueryVSOP_OrderBilling01TSOP_GRUCLIMER: TStringField;
    FDQueryVSOP_OrderBilling01TSOP_ORDBILREPNOM: TStringField;
    FDQueryVSOP_OrderBilling01TSOP_REPNOMINT: TStringField;
    FDQueryVSOP_OrderBilling01TSOP_REPCSR: TStringField;
    FDQueryVSOP_OrderBilling01TSOP_ORDBILITECOD: TStringField;
    FDQueryVSOP_OrderBilling01TSOP_ORDBILITENOM: TStringField;
    FDQueryVSOP_OrderBilling01TSOP_ORDBILITEUNI: TStringField;
    FDQueryVSOP_OrderBilling01TSOP_ORDBILITEFAM: TStringField;
    FDQueryVSOP_OrderBilling01TSOP_ORDBILITEFAM001: TStringField;
    FDQueryVSOP_OrderBilling01TSOP_ORDBILITEFAM002: TStringField;
    FDQueryVSOP_OrderBilling01TSOP_ORDBILITEFAM003: TStringField;
    FDQueryVSOP_OrderBilling01TSOP_ORDBILITEFAM004: TStringField;
    FDQueryVSOP_OrderBilling01TSOP_ORDBILITEFAM005: TStringField;
    FDQueryVSOP_OrderBilling01TSOP_ORDBILVALLIQ: TBCDField;
    FDQueryVSOP_OrderBilling01TSOP_ORDBILQTD: TBCDField;
    FDQueryVSOP_OrderBilling01TSOP_REPACCTYP: TStringField;
    cxTableViewFaturamentoPedidos01TSOP_ORDBILCOD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos01TSOP_ORINOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos01TSOP_ORDBILSITNOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos01TSOP_ORDBILCANNOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos01TSOP_ORDBILYEADOCCAL: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos01TSOP_ORDBILMONDOCCAL: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos01TSOP_ORDBILYEADOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos01TSOP_ORDBILMONDOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos01TSOP_ORDBILDATDOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos01TSOP_ORDBILNRODOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos01TSOP_ORDBILTIPDOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos01TSOP_ORDBILNRODOCREF: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos01TSOP_ORDBILYEADOCREQCAL: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos01TSOP_ORDBILMONDOCREQCAL: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos01TSOP_ORDBILYEADOCREQ: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos01TSOP_ORDBILMONDOCREQ: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos01TSOP_ORDBILDATDOCREQ: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos01TSOP_ORDBILCLICOD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos01TSOP_ORDBILCLINOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos01TSOP_ORDBILGRUCLINOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos01TSOP_GRUCLIMER: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos01TSOP_ORDBILREPNOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos01TSOP_REPNOMINT: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos01TSOP_REPCSR: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos01TSOP_ORDBILITECOD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos01TSOP_ORDBILITENOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos01TSOP_ORDBILITEUNI: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos01TSOP_ORDBILITEFAM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos01TSOP_ORDBILITEFAM001: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos01TSOP_ORDBILITEFAM002: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos01TSOP_ORDBILITEFAM003: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos01TSOP_ORDBILITEFAM004: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos01TSOP_ORDBILITEFAM005: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos01TSOP_ORDBILVALLIQ: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos01TSOP_ORDBILQTD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos01TSOP_REPACCTYP: TcxGridDBColumn;
    FDQueryVSOP_OrderBilling02: TFDQuery;
    FDQueryVSOP_OrderBilling02TSOP_ORDBILCOD: TIntegerField;
    FDQueryVSOP_OrderBilling02TSOP_ORINOM: TStringField;
    FDQueryVSOP_OrderBilling02TSOP_ORDBILSITNOM: TStringField;
    FDQueryVSOP_OrderBilling02TSOP_ORDBILCANNOM: TStringField;
    FDQueryVSOP_OrderBilling02TSOP_ORDBILYEADOCCAL: TIntegerField;
    FDQueryVSOP_OrderBilling02TSOP_ORDBILMONDOCCAL: TIntegerField;
    FDQueryVSOP_OrderBilling02TSOP_ORDBILYEADOC: TIntegerField;
    FDQueryVSOP_OrderBilling02TSOP_ORDBILMONDOC: TIntegerField;
    FDQueryVSOP_OrderBilling02TSOP_ORDBILDATDOC: TSQLTimeStampField;
    FDQueryVSOP_OrderBilling02TSOP_ORDBILNRODOC: TStringField;
    FDQueryVSOP_OrderBilling02TSOP_ORDBILTIPDOC: TStringField;
    FDQueryVSOP_OrderBilling02TSOP_ORDBILNRODOCREF: TStringField;
    FDQueryVSOP_OrderBilling02TSOP_ORDBILYEADOCREQCAL: TIntegerField;
    FDQueryVSOP_OrderBilling02TSOP_ORDBILMONDOCREQCAL: TIntegerField;
    FDQueryVSOP_OrderBilling02TSOP_ORDBILYEADOCREQ: TIntegerField;
    FDQueryVSOP_OrderBilling02TSOP_ORDBILMONDOCREQ: TIntegerField;
    FDQueryVSOP_OrderBilling02TSOP_ORDBILDATDOCREQ: TSQLTimeStampField;
    FDQueryVSOP_OrderBilling02TSOP_ORDBILCLICOD: TStringField;
    FDQueryVSOP_OrderBilling02TSOP_ORDBILCLINOM: TStringField;
    FDQueryVSOP_OrderBilling02TSOP_ORDBILGRUCLINOM: TStringField;
    FDQueryVSOP_OrderBilling02TSOP_GRUCLIMER: TStringField;
    FDQueryVSOP_OrderBilling02TSOP_ORDBILREPNOM: TStringField;
    FDQueryVSOP_OrderBilling02TSOP_REPNOMINT: TStringField;
    FDQueryVSOP_OrderBilling02TSOP_REPCSR: TStringField;
    FDQueryVSOP_OrderBilling02TSOP_ORDBILITECOD: TStringField;
    FDQueryVSOP_OrderBilling02TSOP_ORDBILITENOM: TStringField;
    FDQueryVSOP_OrderBilling02TSOP_ORDBILITEUNI: TStringField;
    FDQueryVSOP_OrderBilling02TSOP_ORDBILITEFAM: TStringField;
    FDQueryVSOP_OrderBilling02TSOP_ORDBILITEFAM001: TStringField;
    FDQueryVSOP_OrderBilling02TSOP_ORDBILITEFAM002: TStringField;
    FDQueryVSOP_OrderBilling02TSOP_ORDBILITEFAM003: TStringField;
    FDQueryVSOP_OrderBilling02TSOP_ORDBILITEFAM004: TStringField;
    FDQueryVSOP_OrderBilling02TSOP_ORDBILITEFAM005: TStringField;
    FDQueryVSOP_OrderBilling02TSOP_ORDBILVALLIQ: TBCDField;
    FDQueryVSOP_OrderBilling02TSOP_ORDBILQTD: TBCDField;
    FDQueryVSOP_OrderBilling02TSOP_REPACCTYP: TStringField;
    DataSourceVSOP_OrderBilling02: TDataSource;
    FDQueryVSOP_OrderBilling03: TFDQuery;
    FDQueryVSOP_OrderBilling03TSOP_ORDBILCOD: TIntegerField;
    FDQueryVSOP_OrderBilling03TSOP_ORINOM: TStringField;
    FDQueryVSOP_OrderBilling03TSOP_ORDBILSITNOM: TStringField;
    FDQueryVSOP_OrderBilling03TSOP_ORDBILCANNOM: TStringField;
    FDQueryVSOP_OrderBilling03TSOP_ORDBILYEADOCCAL: TIntegerField;
    FDQueryVSOP_OrderBilling03TSOP_ORDBILMONDOCCAL: TIntegerField;
    FDQueryVSOP_OrderBilling03TSOP_ORDBILYEADOC: TIntegerField;
    FDQueryVSOP_OrderBilling03TSOP_ORDBILMONDOC: TIntegerField;
    FDQueryVSOP_OrderBilling03TSOP_ORDBILDATDOC: TSQLTimeStampField;
    FDQueryVSOP_OrderBilling03TSOP_ORDBILNRODOC: TStringField;
    FDQueryVSOP_OrderBilling03TSOP_ORDBILTIPDOC: TStringField;
    FDQueryVSOP_OrderBilling03TSOP_ORDBILNRODOCREF: TStringField;
    FDQueryVSOP_OrderBilling03TSOP_ORDBILYEADOCREQCAL: TIntegerField;
    FDQueryVSOP_OrderBilling03TSOP_ORDBILMONDOCREQCAL: TIntegerField;
    FDQueryVSOP_OrderBilling03TSOP_ORDBILYEADOCREQ: TIntegerField;
    FDQueryVSOP_OrderBilling03TSOP_ORDBILMONDOCREQ: TIntegerField;
    FDQueryVSOP_OrderBilling03TSOP_ORDBILDATDOCREQ: TSQLTimeStampField;
    FDQueryVSOP_OrderBilling03TSOP_ORDBILCLICOD: TStringField;
    FDQueryVSOP_OrderBilling03TSOP_ORDBILCLINOM: TStringField;
    FDQueryVSOP_OrderBilling03TSOP_ORDBILGRUCLINOM: TStringField;
    FDQueryVSOP_OrderBilling03TSOP_GRUCLIMER: TStringField;
    FDQueryVSOP_OrderBilling03TSOP_ORDBILREPNOM: TStringField;
    FDQueryVSOP_OrderBilling03TSOP_REPNOMINT: TStringField;
    FDQueryVSOP_OrderBilling03TSOP_REPCSR: TStringField;
    FDQueryVSOP_OrderBilling03TSOP_ORDBILITECOD: TStringField;
    FDQueryVSOP_OrderBilling03TSOP_ORDBILITENOM: TStringField;
    FDQueryVSOP_OrderBilling03TSOP_ORDBILITEUNI: TStringField;
    FDQueryVSOP_OrderBilling03TSOP_ORDBILITEFAM: TStringField;
    FDQueryVSOP_OrderBilling03TSOP_ORDBILITEFAM001: TStringField;
    FDQueryVSOP_OrderBilling03TSOP_ORDBILITEFAM002: TStringField;
    FDQueryVSOP_OrderBilling03TSOP_ORDBILITEFAM003: TStringField;
    FDQueryVSOP_OrderBilling03TSOP_ORDBILITEFAM004: TStringField;
    FDQueryVSOP_OrderBilling03TSOP_ORDBILITEFAM005: TStringField;
    FDQueryVSOP_OrderBilling03TSOP_ORDBILVALLIQ: TBCDField;
    FDQueryVSOP_OrderBilling03TSOP_ORDBILQTD: TBCDField;
    FDQueryVSOP_OrderBilling03TSOP_REPACCTYP: TStringField;
    DataSourceVSOP_OrderBilling03: TDataSource;
    FDQueryVSOP_OrderBilling04: TFDQuery;
    FDQueryVSOP_OrderBilling04TSOP_ORDBILCOD: TIntegerField;
    FDQueryVSOP_OrderBilling04TSOP_ORINOM: TStringField;
    FDQueryVSOP_OrderBilling04TSOP_ORDBILSITNOM: TStringField;
    FDQueryVSOP_OrderBilling04TSOP_ORDBILCANNOM: TStringField;
    FDQueryVSOP_OrderBilling04TSOP_ORDBILYEADOCCAL: TIntegerField;
    FDQueryVSOP_OrderBilling04TSOP_ORDBILMONDOCCAL: TIntegerField;
    FDQueryVSOP_OrderBilling04TSOP_ORDBILYEADOC: TIntegerField;
    FDQueryVSOP_OrderBilling04TSOP_ORDBILMONDOC: TIntegerField;
    FDQueryVSOP_OrderBilling04TSOP_ORDBILDATDOC: TSQLTimeStampField;
    FDQueryVSOP_OrderBilling04TSOP_ORDBILNRODOC: TStringField;
    FDQueryVSOP_OrderBilling04TSOP_ORDBILTIPDOC: TStringField;
    FDQueryVSOP_OrderBilling04TSOP_ORDBILNRODOCREF: TStringField;
    FDQueryVSOP_OrderBilling04TSOP_ORDBILYEADOCREQCAL: TIntegerField;
    FDQueryVSOP_OrderBilling04TSOP_ORDBILMONDOCREQCAL: TIntegerField;
    FDQueryVSOP_OrderBilling04TSOP_ORDBILYEADOCREQ: TIntegerField;
    FDQueryVSOP_OrderBilling04TSOP_ORDBILMONDOCREQ: TIntegerField;
    FDQueryVSOP_OrderBilling04TSOP_ORDBILDATDOCREQ: TSQLTimeStampField;
    FDQueryVSOP_OrderBilling04TSOP_ORDBILCLICOD: TStringField;
    FDQueryVSOP_OrderBilling04TSOP_ORDBILCLINOM: TStringField;
    FDQueryVSOP_OrderBilling04TSOP_ORDBILGRUCLINOM: TStringField;
    FDQueryVSOP_OrderBilling04TSOP_GRUCLIMER: TStringField;
    FDQueryVSOP_OrderBilling04TSOP_ORDBILREPNOM: TStringField;
    FDQueryVSOP_OrderBilling04TSOP_REPNOMINT: TStringField;
    FDQueryVSOP_OrderBilling04TSOP_REPCSR: TStringField;
    FDQueryVSOP_OrderBilling04TSOP_ORDBILITECOD: TStringField;
    FDQueryVSOP_OrderBilling04TSOP_ORDBILITENOM: TStringField;
    FDQueryVSOP_OrderBilling04TSOP_ORDBILITEUNI: TStringField;
    FDQueryVSOP_OrderBilling04TSOP_ORDBILITEFAM: TStringField;
    FDQueryVSOP_OrderBilling04TSOP_ORDBILITEFAM001: TStringField;
    FDQueryVSOP_OrderBilling04TSOP_ORDBILITEFAM002: TStringField;
    FDQueryVSOP_OrderBilling04TSOP_ORDBILITEFAM003: TStringField;
    FDQueryVSOP_OrderBilling04TSOP_ORDBILITEFAM004: TStringField;
    FDQueryVSOP_OrderBilling04TSOP_ORDBILITEFAM005: TStringField;
    FDQueryVSOP_OrderBilling04TSOP_ORDBILVALLIQ: TBCDField;
    FDQueryVSOP_OrderBilling04TSOP_ORDBILQTD: TBCDField;
    FDQueryVSOP_OrderBilling04TSOP_REPACCTYP: TStringField;
    DataSourceVSOP_OrderBilling04: TDataSource;
    FDQueryVSOP_OrderBilling05: TFDQuery;
    FDQueryVSOP_OrderBilling05TSOP_ORDBILCOD: TIntegerField;
    FDQueryVSOP_OrderBilling05TSOP_ORINOM: TStringField;
    FDQueryVSOP_OrderBilling05TSOP_ORDBILSITNOM: TStringField;
    FDQueryVSOP_OrderBilling05TSOP_ORDBILCANNOM: TStringField;
    FDQueryVSOP_OrderBilling05TSOP_ORDBILYEADOCCAL: TIntegerField;
    FDQueryVSOP_OrderBilling05TSOP_ORDBILMONDOCCAL: TIntegerField;
    FDQueryVSOP_OrderBilling05TSOP_ORDBILYEADOC: TIntegerField;
    FDQueryVSOP_OrderBilling05TSOP_ORDBILMONDOC: TIntegerField;
    FDQueryVSOP_OrderBilling05TSOP_ORDBILDATDOC: TSQLTimeStampField;
    FDQueryVSOP_OrderBilling05TSOP_ORDBILNRODOC: TStringField;
    FDQueryVSOP_OrderBilling05TSOP_ORDBILTIPDOC: TStringField;
    FDQueryVSOP_OrderBilling05TSOP_ORDBILNRODOCREF: TStringField;
    FDQueryVSOP_OrderBilling05TSOP_ORDBILYEADOCREQCAL: TIntegerField;
    FDQueryVSOP_OrderBilling05TSOP_ORDBILMONDOCREQCAL: TIntegerField;
    FDQueryVSOP_OrderBilling05TSOP_ORDBILYEADOCREQ: TIntegerField;
    FDQueryVSOP_OrderBilling05TSOP_ORDBILMONDOCREQ: TIntegerField;
    FDQueryVSOP_OrderBilling05TSOP_ORDBILDATDOCREQ: TSQLTimeStampField;
    FDQueryVSOP_OrderBilling05TSOP_ORDBILCLICOD: TStringField;
    FDQueryVSOP_OrderBilling05TSOP_ORDBILCLINOM: TStringField;
    FDQueryVSOP_OrderBilling05TSOP_ORDBILGRUCLINOM: TStringField;
    FDQueryVSOP_OrderBilling05TSOP_GRUCLIMER: TStringField;
    FDQueryVSOP_OrderBilling05TSOP_ORDBILREPNOM: TStringField;
    FDQueryVSOP_OrderBilling05TSOP_REPNOMINT: TStringField;
    FDQueryVSOP_OrderBilling05TSOP_REPCSR: TStringField;
    FDQueryVSOP_OrderBilling05TSOP_ORDBILITECOD: TStringField;
    FDQueryVSOP_OrderBilling05TSOP_ORDBILITENOM: TStringField;
    FDQueryVSOP_OrderBilling05TSOP_ORDBILITEUNI: TStringField;
    FDQueryVSOP_OrderBilling05TSOP_ORDBILITEFAM: TStringField;
    FDQueryVSOP_OrderBilling05TSOP_ORDBILITEFAM001: TStringField;
    FDQueryVSOP_OrderBilling05TSOP_ORDBILITEFAM002: TStringField;
    FDQueryVSOP_OrderBilling05TSOP_ORDBILITEFAM003: TStringField;
    FDQueryVSOP_OrderBilling05TSOP_ORDBILITEFAM004: TStringField;
    FDQueryVSOP_OrderBilling05TSOP_ORDBILITEFAM005: TStringField;
    FDQueryVSOP_OrderBilling05TSOP_ORDBILVALLIQ: TBCDField;
    FDQueryVSOP_OrderBilling05TSOP_ORDBILQTD: TBCDField;
    FDQueryVSOP_OrderBilling05TSOP_REPACCTYP: TStringField;
    DataSourceVSOP_OrderBilling05: TDataSource;
    FDQueryVSOP_OrderBilling10: TFDQuery;
    FDQueryVSOP_OrderBilling10TSOP_ORDBILCOD: TIntegerField;
    FDQueryVSOP_OrderBilling10TSOP_ORINOM: TStringField;
    FDQueryVSOP_OrderBilling10TSOP_ORDBILSITNOM: TStringField;
    FDQueryVSOP_OrderBilling10TSOP_ORDBILCANNOM: TStringField;
    FDQueryVSOP_OrderBilling10TSOP_ORDBILYEADOCCAL: TIntegerField;
    FDQueryVSOP_OrderBilling10TSOP_ORDBILMONDOCCAL: TIntegerField;
    FDQueryVSOP_OrderBilling10TSOP_ORDBILYEADOC: TIntegerField;
    FDQueryVSOP_OrderBilling10TSOP_ORDBILMONDOC: TIntegerField;
    FDQueryVSOP_OrderBilling10TSOP_ORDBILDATDOC: TSQLTimeStampField;
    FDQueryVSOP_OrderBilling10TSOP_ORDBILNRODOC: TStringField;
    FDQueryVSOP_OrderBilling10TSOP_ORDBILTIPDOC: TStringField;
    FDQueryVSOP_OrderBilling10TSOP_ORDBILNRODOCREF: TStringField;
    FDQueryVSOP_OrderBilling10TSOP_ORDBILYEADOCREQCAL: TIntegerField;
    FDQueryVSOP_OrderBilling10TSOP_ORDBILMONDOCREQCAL: TIntegerField;
    FDQueryVSOP_OrderBilling10TSOP_ORDBILYEADOCREQ: TIntegerField;
    FDQueryVSOP_OrderBilling10TSOP_ORDBILMONDOCREQ: TIntegerField;
    FDQueryVSOP_OrderBilling10TSOP_ORDBILDATDOCREQ: TSQLTimeStampField;
    FDQueryVSOP_OrderBilling10TSOP_ORDBILCLICOD: TStringField;
    FDQueryVSOP_OrderBilling10TSOP_ORDBILCLINOM: TStringField;
    FDQueryVSOP_OrderBilling10TSOP_ORDBILGRUCLINOM: TStringField;
    FDQueryVSOP_OrderBilling10TSOP_GRUCLIMER: TStringField;
    FDQueryVSOP_OrderBilling10TSOP_ORDBILREPNOM: TStringField;
    FDQueryVSOP_OrderBilling10TSOP_REPNOMINT: TStringField;
    FDQueryVSOP_OrderBilling10TSOP_REPCSR: TStringField;
    FDQueryVSOP_OrderBilling10TSOP_ORDBILITECOD: TStringField;
    FDQueryVSOP_OrderBilling10TSOP_ORDBILITENOM: TStringField;
    FDQueryVSOP_OrderBilling10TSOP_ORDBILITEUNI: TStringField;
    FDQueryVSOP_OrderBilling10TSOP_ORDBILITEFAM: TStringField;
    FDQueryVSOP_OrderBilling10TSOP_ORDBILITEFAM001: TStringField;
    FDQueryVSOP_OrderBilling10TSOP_ORDBILITEFAM002: TStringField;
    FDQueryVSOP_OrderBilling10TSOP_ORDBILITEFAM003: TStringField;
    FDQueryVSOP_OrderBilling10TSOP_ORDBILITEFAM004: TStringField;
    FDQueryVSOP_OrderBilling10TSOP_ORDBILITEFAM005: TStringField;
    FDQueryVSOP_OrderBilling10TSOP_ORDBILVALLIQ: TBCDField;
    FDQueryVSOP_OrderBilling10TSOP_ORDBILQTD: TBCDField;
    FDQueryVSOP_OrderBilling10TSOP_REPACCTYP: TStringField;
    DataSourceVSOP_OrderBilling10: TDataSource;
    FDQueryVSOP_OrderBilling09: TFDQuery;
    FDQueryVSOP_OrderBilling09TSOP_ORDBILCOD: TIntegerField;
    FDQueryVSOP_OrderBilling09TSOP_ORINOM: TStringField;
    FDQueryVSOP_OrderBilling09TSOP_ORDBILSITNOM: TStringField;
    FDQueryVSOP_OrderBilling09TSOP_ORDBILCANNOM: TStringField;
    FDQueryVSOP_OrderBilling09TSOP_ORDBILYEADOCCAL: TIntegerField;
    FDQueryVSOP_OrderBilling09TSOP_ORDBILMONDOCCAL: TIntegerField;
    FDQueryVSOP_OrderBilling09TSOP_ORDBILYEADOC: TIntegerField;
    FDQueryVSOP_OrderBilling09TSOP_ORDBILMONDOC: TIntegerField;
    FDQueryVSOP_OrderBilling09TSOP_ORDBILDATDOC: TSQLTimeStampField;
    FDQueryVSOP_OrderBilling09TSOP_ORDBILNRODOC: TStringField;
    FDQueryVSOP_OrderBilling09TSOP_ORDBILTIPDOC: TStringField;
    FDQueryVSOP_OrderBilling09TSOP_ORDBILNRODOCREF: TStringField;
    FDQueryVSOP_OrderBilling09TSOP_ORDBILYEADOCREQCAL: TIntegerField;
    FDQueryVSOP_OrderBilling09TSOP_ORDBILMONDOCREQCAL: TIntegerField;
    FDQueryVSOP_OrderBilling09TSOP_ORDBILYEADOCREQ: TIntegerField;
    FDQueryVSOP_OrderBilling09TSOP_ORDBILMONDOCREQ: TIntegerField;
    FDQueryVSOP_OrderBilling09TSOP_ORDBILDATDOCREQ: TSQLTimeStampField;
    FDQueryVSOP_OrderBilling09TSOP_ORDBILCLICOD: TStringField;
    FDQueryVSOP_OrderBilling09TSOP_ORDBILCLINOM: TStringField;
    FDQueryVSOP_OrderBilling09TSOP_ORDBILGRUCLINOM: TStringField;
    FDQueryVSOP_OrderBilling09TSOP_GRUCLIMER: TStringField;
    FDQueryVSOP_OrderBilling09TSOP_ORDBILREPNOM: TStringField;
    FDQueryVSOP_OrderBilling09TSOP_REPNOMINT: TStringField;
    FDQueryVSOP_OrderBilling09TSOP_REPCSR: TStringField;
    FDQueryVSOP_OrderBilling09TSOP_ORDBILITECOD: TStringField;
    FDQueryVSOP_OrderBilling09TSOP_ORDBILITENOM: TStringField;
    FDQueryVSOP_OrderBilling09TSOP_ORDBILITEUNI: TStringField;
    FDQueryVSOP_OrderBilling09TSOP_ORDBILITEFAM: TStringField;
    FDQueryVSOP_OrderBilling09TSOP_ORDBILITEFAM001: TStringField;
    FDQueryVSOP_OrderBilling09TSOP_ORDBILITEFAM002: TStringField;
    FDQueryVSOP_OrderBilling09TSOP_ORDBILITEFAM003: TStringField;
    FDQueryVSOP_OrderBilling09TSOP_ORDBILITEFAM004: TStringField;
    FDQueryVSOP_OrderBilling09TSOP_ORDBILITEFAM005: TStringField;
    FDQueryVSOP_OrderBilling09TSOP_ORDBILVALLIQ: TBCDField;
    FDQueryVSOP_OrderBilling09TSOP_ORDBILQTD: TBCDField;
    FDQueryVSOP_OrderBilling09TSOP_REPACCTYP: TStringField;
    FDQueryVSOP_OrderBilling08: TFDQuery;
    FDQueryVSOP_OrderBilling08TSOP_ORDBILCOD: TIntegerField;
    FDQueryVSOP_OrderBilling08TSOP_ORINOM: TStringField;
    FDQueryVSOP_OrderBilling08TSOP_ORDBILSITNOM: TStringField;
    FDQueryVSOP_OrderBilling08TSOP_ORDBILCANNOM: TStringField;
    FDQueryVSOP_OrderBilling08TSOP_ORDBILYEADOCCAL: TIntegerField;
    FDQueryVSOP_OrderBilling08TSOP_ORDBILMONDOCCAL: TIntegerField;
    FDQueryVSOP_OrderBilling08TSOP_ORDBILYEADOC: TIntegerField;
    FDQueryVSOP_OrderBilling08TSOP_ORDBILMONDOC: TIntegerField;
    FDQueryVSOP_OrderBilling08TSOP_ORDBILDATDOC: TSQLTimeStampField;
    FDQueryVSOP_OrderBilling08TSOP_ORDBILNRODOC: TStringField;
    FDQueryVSOP_OrderBilling08TSOP_ORDBILTIPDOC: TStringField;
    FDQueryVSOP_OrderBilling08TSOP_ORDBILNRODOCREF: TStringField;
    FDQueryVSOP_OrderBilling08TSOP_ORDBILYEADOCREQCAL: TIntegerField;
    FDQueryVSOP_OrderBilling08TSOP_ORDBILMONDOCREQCAL: TIntegerField;
    FDQueryVSOP_OrderBilling08TSOP_ORDBILYEADOCREQ: TIntegerField;
    FDQueryVSOP_OrderBilling08TSOP_ORDBILMONDOCREQ: TIntegerField;
    FDQueryVSOP_OrderBilling08TSOP_ORDBILDATDOCREQ: TSQLTimeStampField;
    FDQueryVSOP_OrderBilling08TSOP_ORDBILCLICOD: TStringField;
    FDQueryVSOP_OrderBilling08TSOP_ORDBILCLINOM: TStringField;
    FDQueryVSOP_OrderBilling08TSOP_ORDBILGRUCLINOM: TStringField;
    FDQueryVSOP_OrderBilling08TSOP_GRUCLIMER: TStringField;
    FDQueryVSOP_OrderBilling08TSOP_ORDBILREPNOM: TStringField;
    FDQueryVSOP_OrderBilling08TSOP_REPNOMINT: TStringField;
    FDQueryVSOP_OrderBilling08TSOP_REPCSR: TStringField;
    FDQueryVSOP_OrderBilling08TSOP_ORDBILITECOD: TStringField;
    FDQueryVSOP_OrderBilling08TSOP_ORDBILITENOM: TStringField;
    FDQueryVSOP_OrderBilling08TSOP_ORDBILITEUNI: TStringField;
    FDQueryVSOP_OrderBilling08TSOP_ORDBILITEFAM: TStringField;
    FDQueryVSOP_OrderBilling08TSOP_ORDBILITEFAM001: TStringField;
    FDQueryVSOP_OrderBilling08TSOP_ORDBILITEFAM002: TStringField;
    FDQueryVSOP_OrderBilling08TSOP_ORDBILITEFAM003: TStringField;
    FDQueryVSOP_OrderBilling08TSOP_ORDBILITEFAM004: TStringField;
    FDQueryVSOP_OrderBilling08TSOP_ORDBILITEFAM005: TStringField;
    FDQueryVSOP_OrderBilling08TSOP_ORDBILVALLIQ: TBCDField;
    FDQueryVSOP_OrderBilling08TSOP_ORDBILQTD: TBCDField;
    FDQueryVSOP_OrderBilling08TSOP_REPACCTYP: TStringField;
    FDQueryVSOP_OrderBilling07: TFDQuery;
    FDQueryVSOP_OrderBilling07TSOP_ORDBILCOD: TIntegerField;
    FDQueryVSOP_OrderBilling07TSOP_ORINOM: TStringField;
    FDQueryVSOP_OrderBilling07TSOP_ORDBILSITNOM: TStringField;
    FDQueryVSOP_OrderBilling07TSOP_ORDBILCANNOM: TStringField;
    FDQueryVSOP_OrderBilling07TSOP_ORDBILYEADOCCAL: TIntegerField;
    FDQueryVSOP_OrderBilling07TSOP_ORDBILMONDOCCAL: TIntegerField;
    FDQueryVSOP_OrderBilling07TSOP_ORDBILYEADOC: TIntegerField;
    FDQueryVSOP_OrderBilling07TSOP_ORDBILMONDOC: TIntegerField;
    FDQueryVSOP_OrderBilling07TSOP_ORDBILDATDOC: TSQLTimeStampField;
    FDQueryVSOP_OrderBilling07TSOP_ORDBILNRODOC: TStringField;
    FDQueryVSOP_OrderBilling07TSOP_ORDBILTIPDOC: TStringField;
    FDQueryVSOP_OrderBilling07TSOP_ORDBILNRODOCREF: TStringField;
    FDQueryVSOP_OrderBilling07TSOP_ORDBILYEADOCREQCAL: TIntegerField;
    FDQueryVSOP_OrderBilling07TSOP_ORDBILMONDOCREQCAL: TIntegerField;
    FDQueryVSOP_OrderBilling07TSOP_ORDBILYEADOCREQ: TIntegerField;
    FDQueryVSOP_OrderBilling07TSOP_ORDBILMONDOCREQ: TIntegerField;
    FDQueryVSOP_OrderBilling07TSOP_ORDBILDATDOCREQ: TSQLTimeStampField;
    FDQueryVSOP_OrderBilling07TSOP_ORDBILCLICOD: TStringField;
    FDQueryVSOP_OrderBilling07TSOP_ORDBILCLINOM: TStringField;
    FDQueryVSOP_OrderBilling07TSOP_ORDBILGRUCLINOM: TStringField;
    FDQueryVSOP_OrderBilling07TSOP_GRUCLIMER: TStringField;
    FDQueryVSOP_OrderBilling07TSOP_ORDBILREPNOM: TStringField;
    FDQueryVSOP_OrderBilling07TSOP_REPNOMINT: TStringField;
    FDQueryVSOP_OrderBilling07TSOP_REPCSR: TStringField;
    FDQueryVSOP_OrderBilling07TSOP_ORDBILITECOD: TStringField;
    FDQueryVSOP_OrderBilling07TSOP_ORDBILITENOM: TStringField;
    FDQueryVSOP_OrderBilling07TSOP_ORDBILITEUNI: TStringField;
    FDQueryVSOP_OrderBilling07TSOP_ORDBILITEFAM: TStringField;
    FDQueryVSOP_OrderBilling07TSOP_ORDBILITEFAM001: TStringField;
    FDQueryVSOP_OrderBilling07TSOP_ORDBILITEFAM002: TStringField;
    FDQueryVSOP_OrderBilling07TSOP_ORDBILITEFAM003: TStringField;
    FDQueryVSOP_OrderBilling07TSOP_ORDBILITEFAM004: TStringField;
    FDQueryVSOP_OrderBilling07TSOP_ORDBILITEFAM005: TStringField;
    FDQueryVSOP_OrderBilling07TSOP_ORDBILVALLIQ: TBCDField;
    FDQueryVSOP_OrderBilling07TSOP_ORDBILQTD: TBCDField;
    FDQueryVSOP_OrderBilling07TSOP_REPACCTYP: TStringField;
    FDQueryVSOP_OrderBilling06: TFDQuery;
    FDQueryVSOP_OrderBilling06TSOP_ORDBILCOD: TIntegerField;
    FDQueryVSOP_OrderBilling06TSOP_ORINOM: TStringField;
    FDQueryVSOP_OrderBilling06TSOP_ORDBILSITNOM: TStringField;
    FDQueryVSOP_OrderBilling06TSOP_ORDBILCANNOM: TStringField;
    FDQueryVSOP_OrderBilling06TSOP_ORDBILYEADOCCAL: TIntegerField;
    FDQueryVSOP_OrderBilling06TSOP_ORDBILMONDOCCAL: TIntegerField;
    FDQueryVSOP_OrderBilling06TSOP_ORDBILYEADOC: TIntegerField;
    FDQueryVSOP_OrderBilling06TSOP_ORDBILMONDOC: TIntegerField;
    FDQueryVSOP_OrderBilling06TSOP_ORDBILDATDOC: TSQLTimeStampField;
    FDQueryVSOP_OrderBilling06TSOP_ORDBILNRODOC: TStringField;
    FDQueryVSOP_OrderBilling06TSOP_ORDBILTIPDOC: TStringField;
    FDQueryVSOP_OrderBilling06TSOP_ORDBILNRODOCREF: TStringField;
    FDQueryVSOP_OrderBilling06TSOP_ORDBILYEADOCREQCAL: TIntegerField;
    FDQueryVSOP_OrderBilling06TSOP_ORDBILMONDOCREQCAL: TIntegerField;
    FDQueryVSOP_OrderBilling06TSOP_ORDBILYEADOCREQ: TIntegerField;
    FDQueryVSOP_OrderBilling06TSOP_ORDBILMONDOCREQ: TIntegerField;
    FDQueryVSOP_OrderBilling06TSOP_ORDBILDATDOCREQ: TSQLTimeStampField;
    FDQueryVSOP_OrderBilling06TSOP_ORDBILCLICOD: TStringField;
    FDQueryVSOP_OrderBilling06TSOP_ORDBILCLINOM: TStringField;
    FDQueryVSOP_OrderBilling06TSOP_ORDBILGRUCLINOM: TStringField;
    FDQueryVSOP_OrderBilling06TSOP_GRUCLIMER: TStringField;
    FDQueryVSOP_OrderBilling06TSOP_ORDBILREPNOM: TStringField;
    FDQueryVSOP_OrderBilling06TSOP_REPNOMINT: TStringField;
    FDQueryVSOP_OrderBilling06TSOP_REPCSR: TStringField;
    FDQueryVSOP_OrderBilling06TSOP_ORDBILITECOD: TStringField;
    FDQueryVSOP_OrderBilling06TSOP_ORDBILITENOM: TStringField;
    FDQueryVSOP_OrderBilling06TSOP_ORDBILITEUNI: TStringField;
    FDQueryVSOP_OrderBilling06TSOP_ORDBILITEFAM: TStringField;
    FDQueryVSOP_OrderBilling06TSOP_ORDBILITEFAM001: TStringField;
    FDQueryVSOP_OrderBilling06TSOP_ORDBILITEFAM002: TStringField;
    FDQueryVSOP_OrderBilling06TSOP_ORDBILITEFAM003: TStringField;
    FDQueryVSOP_OrderBilling06TSOP_ORDBILITEFAM004: TStringField;
    FDQueryVSOP_OrderBilling06TSOP_ORDBILITEFAM005: TStringField;
    FDQueryVSOP_OrderBilling06TSOP_ORDBILVALLIQ: TBCDField;
    FDQueryVSOP_OrderBilling06TSOP_ORDBILQTD: TBCDField;
    FDQueryVSOP_OrderBilling06TSOP_REPACCTYP: TStringField;
    DataSourceVSOP_OrderBilling06: TDataSource;
    DataSourceVSOP_OrderBilling07: TDataSource;
    DataSourceVSOP_OrderBilling08: TDataSource;
    DataSourceVSOP_OrderBilling09: TDataSource;
    cxTableViewFaturamentoPedidos05TSOP_ORDBILCOD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos05TSOP_ORINOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos05TSOP_ORDBILSITNOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos05TSOP_ORDBILCANNOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos05TSOP_ORDBILYEADOCCAL: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos05TSOP_ORDBILMONDOCCAL: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos05TSOP_ORDBILYEADOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos05TSOP_ORDBILMONDOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos05TSOP_ORDBILDATDOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos05TSOP_ORDBILNRODOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos05TSOP_ORDBILTIPDOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos05TSOP_ORDBILNRODOCREF: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos05TSOP_ORDBILYEADOCREQCAL: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos05TSOP_ORDBILMONDOCREQCAL: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos05TSOP_ORDBILYEADOCREQ: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos05TSOP_ORDBILMONDOCREQ: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos05TSOP_ORDBILDATDOCREQ: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos05TSOP_ORDBILCLICOD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos05TSOP_ORDBILCLINOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos05TSOP_ORDBILGRUCLINOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos05TSOP_GRUCLIMER: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos05TSOP_ORDBILREPNOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos05TSOP_REPNOMINT: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos05TSOP_REPCSR: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos05TSOP_ORDBILITECOD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos05TSOP_ORDBILITENOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos05TSOP_ORDBILITEUNI: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos05TSOP_ORDBILITEFAM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos05TSOP_ORDBILITEFAM001: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos05TSOP_ORDBILITEFAM002: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos05TSOP_ORDBILITEFAM003: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos05TSOP_ORDBILITEFAM004: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos05TSOP_ORDBILITEFAM005: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos05TSOP_ORDBILVALLIQ: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos05TSOP_ORDBILQTD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos05TSOP_REPACCTYP: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos04TSOP_ORDBILCOD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos04TSOP_ORINOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos04TSOP_ORDBILSITNOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos04TSOP_ORDBILCANNOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos04TSOP_ORDBILYEADOCCAL: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos04TSOP_ORDBILMONDOCCAL: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos04TSOP_ORDBILYEADOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos04TSOP_ORDBILMONDOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos04TSOP_ORDBILDATDOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos04TSOP_ORDBILNRODOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos04TSOP_ORDBILTIPDOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos04TSOP_ORDBILNRODOCREF: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos04TSOP_ORDBILYEADOCREQCAL: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos04TSOP_ORDBILMONDOCREQCAL: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos04TSOP_ORDBILYEADOCREQ: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos04TSOP_ORDBILMONDOCREQ: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos04TSOP_ORDBILDATDOCREQ: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos04TSOP_ORDBILCLICOD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos04TSOP_ORDBILCLINOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos04TSOP_ORDBILGRUCLINOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos04TSOP_GRUCLIMER: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos04TSOP_ORDBILREPNOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos04TSOP_REPNOMINT: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos04TSOP_REPCSR: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos04TSOP_ORDBILITECOD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos04TSOP_ORDBILITENOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos04TSOP_ORDBILITEUNI: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos04TSOP_ORDBILITEFAM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos04TSOP_ORDBILITEFAM001: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos04TSOP_ORDBILITEFAM002: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos04TSOP_ORDBILITEFAM003: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos04TSOP_ORDBILITEFAM004: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos04TSOP_ORDBILITEFAM005: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos04TSOP_ORDBILVALLIQ: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos04TSOP_ORDBILQTD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos04TSOP_REPACCTYP: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos03TSOP_ORDBILCOD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos03TSOP_ORINOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos03TSOP_ORDBILSITNOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos03TSOP_ORDBILCANNOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos03TSOP_ORDBILYEADOCCAL: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos03TSOP_ORDBILMONDOCCAL: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos03TSOP_ORDBILYEADOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos03TSOP_ORDBILMONDOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos03TSOP_ORDBILDATDOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos03TSOP_ORDBILNRODOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos03TSOP_ORDBILTIPDOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos03TSOP_ORDBILNRODOCREF: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos03TSOP_ORDBILYEADOCREQCAL: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos03TSOP_ORDBILMONDOCREQCAL: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos03TSOP_ORDBILYEADOCREQ: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos03TSOP_ORDBILMONDOCREQ: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos03TSOP_ORDBILDATDOCREQ: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos03TSOP_ORDBILCLICOD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos03TSOP_ORDBILCLINOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos03TSOP_ORDBILGRUCLINOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos03TSOP_GRUCLIMER: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos03TSOP_ORDBILREPNOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos03TSOP_REPNOMINT: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos03TSOP_REPCSR: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos03TSOP_ORDBILITECOD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos03TSOP_ORDBILITENOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos03TSOP_ORDBILITEUNI: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos03TSOP_ORDBILITEFAM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos03TSOP_ORDBILITEFAM001: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos03TSOP_ORDBILITEFAM002: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos03TSOP_ORDBILITEFAM003: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos03TSOP_ORDBILITEFAM004: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos03TSOP_ORDBILITEFAM005: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos03TSOP_ORDBILVALLIQ: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos03TSOP_ORDBILQTD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos03TSOP_REPACCTYP: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos02TSOP_ORDBILCOD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos02TSOP_ORINOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos02TSOP_ORDBILSITNOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos02TSOP_ORDBILCANNOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos02TSOP_ORDBILYEADOCCAL: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos02TSOP_ORDBILMONDOCCAL: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos02TSOP_ORDBILYEADOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos02TSOP_ORDBILMONDOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos02TSOP_ORDBILDATDOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos02TSOP_ORDBILNRODOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos02TSOP_ORDBILTIPDOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos02TSOP_ORDBILNRODOCREF: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos02TSOP_ORDBILYEADOCREQCAL: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos02TSOP_ORDBILMONDOCREQCAL: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos02TSOP_ORDBILYEADOCREQ: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos02TSOP_ORDBILMONDOCREQ: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos02TSOP_ORDBILDATDOCREQ: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos02TSOP_ORDBILCLICOD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos02TSOP_ORDBILCLINOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos02TSOP_ORDBILGRUCLINOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos02TSOP_GRUCLIMER: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos02TSOP_ORDBILREPNOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos02TSOP_REPNOMINT: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos02TSOP_REPCSR: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos02TSOP_ORDBILITECOD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos02TSOP_ORDBILITENOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos02TSOP_ORDBILITEUNI: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos02TSOP_ORDBILITEFAM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos02TSOP_ORDBILITEFAM001: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos02TSOP_ORDBILITEFAM002: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos02TSOP_ORDBILITEFAM003: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos02TSOP_ORDBILITEFAM004: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos02TSOP_ORDBILITEFAM005: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos02TSOP_ORDBILVALLIQ: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos02TSOP_ORDBILQTD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos02TSOP_REPACCTYP: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos10TSOP_ORDBILCOD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos10TSOP_ORINOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos10TSOP_ORDBILSITNOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos10TSOP_ORDBILCANNOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos10TSOP_ORDBILYEADOCCAL: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos10TSOP_ORDBILMONDOCCAL: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos10TSOP_ORDBILYEADOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos10TSOP_ORDBILMONDOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos10TSOP_ORDBILDATDOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos10TSOP_ORDBILNRODOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos10TSOP_ORDBILTIPDOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos10TSOP_ORDBILNRODOCREF: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos10TSOP_ORDBILYEADOCREQCAL: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos10TSOP_ORDBILMONDOCREQCAL: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos10TSOP_ORDBILYEADOCREQ: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos10TSOP_ORDBILMONDOCREQ: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos10TSOP_ORDBILDATDOCREQ: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos10TSOP_ORDBILCLICOD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos10TSOP_ORDBILCLINOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos10TSOP_ORDBILGRUCLINOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos10TSOP_GRUCLIMER: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos10TSOP_ORDBILREPNOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos10TSOP_REPNOMINT: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos10TSOP_REPCSR: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos10TSOP_ORDBILITECOD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos10TSOP_ORDBILITENOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos10TSOP_ORDBILITEUNI: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos10TSOP_ORDBILITEFAM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos10TSOP_ORDBILITEFAM001: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos10TSOP_ORDBILITEFAM002: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos10TSOP_ORDBILITEFAM003: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos10TSOP_ORDBILITEFAM004: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos10TSOP_ORDBILITEFAM005: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos10TSOP_ORDBILVALLIQ: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos10TSOP_ORDBILQTD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos10TSOP_REPACCTYP: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos09TSOP_ORDBILCOD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos09TSOP_ORINOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos09TSOP_ORDBILSITNOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos09TSOP_ORDBILCANNOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos09TSOP_ORDBILYEADOCCAL: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos09TSOP_ORDBILMONDOCCAL: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos09TSOP_ORDBILYEADOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos09TSOP_ORDBILMONDOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos09TSOP_ORDBILDATDOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos09TSOP_ORDBILNRODOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos09TSOP_ORDBILTIPDOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos09TSOP_ORDBILNRODOCREF: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos09TSOP_ORDBILYEADOCREQCAL: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos09TSOP_ORDBILMONDOCREQCAL: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos09TSOP_ORDBILYEADOCREQ: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos09TSOP_ORDBILMONDOCREQ: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos09TSOP_ORDBILDATDOCREQ: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos09TSOP_ORDBILCLICOD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos09TSOP_ORDBILCLINOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos09TSOP_ORDBILGRUCLINOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos09TSOP_GRUCLIMER: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos09TSOP_ORDBILREPNOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos09TSOP_REPNOMINT: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos09TSOP_REPCSR: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos09TSOP_ORDBILITECOD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos09TSOP_ORDBILITENOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos09TSOP_ORDBILITEUNI: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos09TSOP_ORDBILITEFAM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos09TSOP_ORDBILITEFAM001: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos09TSOP_ORDBILITEFAM002: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos09TSOP_ORDBILITEFAM003: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos09TSOP_ORDBILITEFAM004: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos09TSOP_ORDBILITEFAM005: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos09TSOP_ORDBILVALLIQ: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos09TSOP_ORDBILQTD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos09TSOP_REPACCTYP: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos08TSOP_ORDBILCOD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos08TSOP_ORINOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos08TSOP_ORDBILSITNOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos08TSOP_ORDBILCANNOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos08TSOP_ORDBILYEADOCCAL: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos08TSOP_ORDBILMONDOCCAL: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos08TSOP_ORDBILYEADOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos08TSOP_ORDBILMONDOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos08TSOP_ORDBILDATDOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos08TSOP_ORDBILNRODOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos08TSOP_ORDBILTIPDOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos08TSOP_ORDBILNRODOCREF: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos08TSOP_ORDBILYEADOCREQCAL: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos08TSOP_ORDBILMONDOCREQCAL: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos08TSOP_ORDBILYEADOCREQ: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos08TSOP_ORDBILMONDOCREQ: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos08TSOP_ORDBILDATDOCREQ: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos08TSOP_ORDBILCLICOD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos08TSOP_ORDBILCLINOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos08TSOP_ORDBILGRUCLINOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos08TSOP_GRUCLIMER: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos08TSOP_ORDBILREPNOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos08TSOP_REPNOMINT: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos08TSOP_REPCSR: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos08TSOP_ORDBILITECOD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos08TSOP_ORDBILITENOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos08TSOP_ORDBILITEUNI: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos08TSOP_ORDBILITEFAM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos08TSOP_ORDBILITEFAM001: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos08TSOP_ORDBILITEFAM002: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos08TSOP_ORDBILITEFAM003: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos08TSOP_ORDBILITEFAM004: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos08TSOP_ORDBILITEFAM005: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos08TSOP_ORDBILVALLIQ: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos08TSOP_ORDBILQTD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos08TSOP_REPACCTYP: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos07TSOP_ORDBILCOD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos07TSOP_ORINOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos07TSOP_ORDBILSITNOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos07TSOP_ORDBILCANNOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos07TSOP_ORDBILYEADOCCAL: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos07TSOP_ORDBILMONDOCCAL: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos07TSOP_ORDBILYEADOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos07TSOP_ORDBILMONDOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos07TSOP_ORDBILDATDOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos07TSOP_ORDBILNRODOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos07TSOP_ORDBILTIPDOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos07TSOP_ORDBILNRODOCREF: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos07TSOP_ORDBILYEADOCREQCAL: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos07TSOP_ORDBILMONDOCREQCAL: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos07TSOP_ORDBILYEADOCREQ: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos07TSOP_ORDBILMONDOCREQ: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos07TSOP_ORDBILDATDOCREQ: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos07TSOP_ORDBILCLICOD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos07TSOP_ORDBILCLINOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos07TSOP_ORDBILGRUCLINOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos07TSOP_GRUCLIMER: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos07TSOP_ORDBILREPNOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos07TSOP_REPNOMINT: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos07TSOP_REPCSR: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos07TSOP_ORDBILITECOD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos07TSOP_ORDBILITENOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos07TSOP_ORDBILITEUNI: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos07TSOP_ORDBILITEFAM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos07TSOP_ORDBILITEFAM001: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos07TSOP_ORDBILITEFAM002: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos07TSOP_ORDBILITEFAM003: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos07TSOP_ORDBILITEFAM004: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos07TSOP_ORDBILITEFAM005: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos07TSOP_ORDBILVALLIQ: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos07TSOP_ORDBILQTD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos07TSOP_REPACCTYP: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos06TSOP_ORDBILCOD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos06TSOP_ORINOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos06TSOP_ORDBILSITNOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos06TSOP_ORDBILCANNOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos06TSOP_ORDBILYEADOCCAL: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos06TSOP_ORDBILMONDOCCAL: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos06TSOP_ORDBILYEADOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos06TSOP_ORDBILMONDOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos06TSOP_ORDBILDATDOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos06TSOP_ORDBILNRODOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos06TSOP_ORDBILTIPDOC: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos06TSOP_ORDBILNRODOCREF: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos06TSOP_ORDBILYEADOCREQCAL: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos06TSOP_ORDBILMONDOCREQCAL: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos06TSOP_ORDBILYEADOCREQ: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos06TSOP_ORDBILMONDOCREQ: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos06TSOP_ORDBILDATDOCREQ: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos06TSOP_ORDBILCLICOD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos06TSOP_ORDBILCLINOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos06TSOP_ORDBILGRUCLINOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos06TSOP_GRUCLIMER: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos06TSOP_ORDBILREPNOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos06TSOP_REPNOMINT: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos06TSOP_REPCSR: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos06TSOP_ORDBILITECOD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos06TSOP_ORDBILITENOM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos06TSOP_ORDBILITEUNI: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos06TSOP_ORDBILITEFAM: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos06TSOP_ORDBILITEFAM001: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos06TSOP_ORDBILITEFAM002: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos06TSOP_ORDBILITEFAM003: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos06TSOP_ORDBILITEFAM004: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos06TSOP_ORDBILITEFAM005: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos06TSOP_ORDBILVALLIQ: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos06TSOP_ORDBILQTD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos06TSOP_REPACCTYP: TcxGridDBColumn;
    cxPageControl: TcxPageControl;
    cxTabSheetGrid: TcxTabSheet;
    cxTabSheetPivot: TcxTabSheet;
    cxPageControlPivot: TcxPageControl;
    cxTabSheetPivot00: TcxTabSheet;
    cxTabSheetPivot01: TcxTabSheet;
    cxTabSheetPivot02: TcxTabSheet;
    cxTabSheetPivot03: TcxTabSheet;
    cxTabSheetPivot04: TcxTabSheet;
    cxTabSheetPivot05: TcxTabSheet;
    cxTabSheetPivot06: TcxTabSheet;
    cxTabSheetPivot07: TcxTabSheet;
    cxTabSheetPivot08: TcxTabSheet;
    cxTabSheetPivot09: TcxTabSheet;
    cxTabSheetPivot10: TcxTabSheet;
    cxTabSheetPivot11: TcxTabSheet;
    cxDBPivotGrid00: TcxDBPivotGrid;
    cxDBPivotGrid00FieldTSOP_ORDBILSITNOM: TcxDBPivotGridField;
    cxDBPivotGrid00FieldTSOP_ORDBILCANNOM: TcxDBPivotGridField;
    cxDBPivotGrid00FieldTSOP_GRUCLIMER: TcxDBPivotGridField;
    cxDBPivotGrid00FieldTSOP_ORDBILITEFAM: TcxDBPivotGridField;
    cxDBPivotGrid00FieldTSOP_ORDBILITEFAMPAI: TcxDBPivotGridField;
    cxDBPivotGrid00FieldTSOP_ORDBILGRUCLINOM: TcxDBPivotGridField;
    cxDBPivotGrid00FieldTSOP_ORDBILCLINOM: TcxDBPivotGridField;
    cxDBPivotGrid00FieldTSOP_ORDBILQTD: TcxDBPivotGridField;
    cxDBPivotGrid00FieldTSOP_ORDBILVALLIQ: TcxDBPivotGridField;
    cxDBPivotGrid00FieldTSOP_ORDBILREPNOM: TcxDBPivotGridField;
    cxDBPivotGrid01: TcxDBPivotGrid;
    cxDBPivotGrid01FieldTSOP_ORDBILSITNOM: TcxDBPivotGridField;
    cxDBPivotGrid01FieldTSOP_ORDBILCANNOM: TcxDBPivotGridField;
    cxDBPivotGrid01FieldTSOP_GRUCLIMER: TcxDBPivotGridField;
    cxDBPivotGrid01FieldTSOP_ORDBILITEFAM: TcxDBPivotGridField;
    cxDBPivotGrid01FieldTSOP_ORDBILITEFAMPAI: TcxDBPivotGridField;
    cxDBPivotGrid01FieldTSOP_ORDBILGRUCLINOM: TcxDBPivotGridField;
    cxDBPivotGrid01FieldTSOP_ORDBILCLINOM: TcxDBPivotGridField;
    cxDBPivotGrid01FieldTSOP_ORDBILQTD: TcxDBPivotGridField;
    cxDBPivotGrid01FieldTSOP_ORDBILVALLIQ: TcxDBPivotGridField;
    cxDBPivotGrid01FieldTSOP_ORDBILREPNOM: TcxDBPivotGridField;
    cxDBPivotGrid02: TcxDBPivotGrid;
    cxDBPivotGrid02FieldTSOP_ORDBILSITNOM: TcxDBPivotGridField;
    cxDBPivotGrid02FieldTSOP_ORDBILCANNOM: TcxDBPivotGridField;
    cxDBPivotGrid02FieldTSOP_GRUCLIMER: TcxDBPivotGridField;
    cxDBPivotGrid02FieldTSOP_ORDBILITEFAM: TcxDBPivotGridField;
    cxDBPivotGrid02FieldTSOP_ORDBILITEFAMPAI: TcxDBPivotGridField;
    cxDBPivotGrid02FieldTSOP_ORDBILGRUCLINOM: TcxDBPivotGridField;
    cxDBPivotGrid02FieldTSOP_ORDBILCLINOM: TcxDBPivotGridField;
    cxDBPivotGrid02FieldTSOP_ORDBILQTD: TcxDBPivotGridField;
    cxDBPivotGrid02FieldTSOP_ORDBILVALLIQ: TcxDBPivotGridField;
    cxDBPivotGrid02FieldTSOP_ORDBILREPNOM: TcxDBPivotGridField;
    cxDBPivotGrid03: TcxDBPivotGrid;
    cxDBPivotGrid03FieldTSOP_ORDBILSITNOM: TcxDBPivotGridField;
    cxDBPivotGrid03FieldTSOP_ORDBILCANNOM: TcxDBPivotGridField;
    cxDBPivotGrid03FieldTSOP_GRUCLIMER: TcxDBPivotGridField;
    cxDBPivotGrid03FieldTSOP_ORDBILITEFAM: TcxDBPivotGridField;
    cxDBPivotGrid03FieldTSOP_ORDBILITEFAMPAI: TcxDBPivotGridField;
    cxDBPivotGrid03FieldTSOP_ORDBILGRUCLINOM: TcxDBPivotGridField;
    cxDBPivotGrid03FieldTSOP_ORDBILCLINOM: TcxDBPivotGridField;
    cxDBPivotGrid03FieldTSOP_ORDBILQTD: TcxDBPivotGridField;
    cxDBPivotGrid03FieldTSOP_ORDBILVALLIQ: TcxDBPivotGridField;
    cxDBPivotGrid03FieldTSOP_ORDBILREPNOM: TcxDBPivotGridField;
    cxDBPivotGrid04: TcxDBPivotGrid;
    cxDBPivotGrid04FieldTSOP_ORDBILSITNOM: TcxDBPivotGridField;
    cxDBPivotGrid04FieldTSOP_ORDBILCANNOM: TcxDBPivotGridField;
    cxDBPivotGrid04FieldTSOP_GRUCLIMER: TcxDBPivotGridField;
    cxDBPivotGrid04FieldTSOP_ORDBILITEFAM: TcxDBPivotGridField;
    cxDBPivotGrid04FieldTSOP_ORDBILITEFAMPAI: TcxDBPivotGridField;
    cxDBPivotGrid04FieldTSOP_ORDBILGRUCLINOM: TcxDBPivotGridField;
    cxDBPivotGrid04FieldTSOP_ORDBILCLINOM: TcxDBPivotGridField;
    cxDBPivotGrid04FieldTSOP_ORDBILQTD: TcxDBPivotGridField;
    cxDBPivotGrid04FieldTSOP_ORDBILVALLIQ: TcxDBPivotGridField;
    cxDBPivotGrid04FieldTSOP_ORDBILREPNOM: TcxDBPivotGridField;
    cxDBPivotGrid05: TcxDBPivotGrid;
    cxDBPivotGrid05FieldTSOP_ORDBILSITNOM: TcxDBPivotGridField;
    cxDBPivotGrid05FieldTSOP_ORDBILCANNOM: TcxDBPivotGridField;
    cxDBPivotGrid05FieldTSOP_GRUCLIMER: TcxDBPivotGridField;
    cxDBPivotGrid05FieldTSOP_ORDBILITEFAM: TcxDBPivotGridField;
    cxDBPivotGrid05FieldTSOP_ORDBILITEFAMPAI: TcxDBPivotGridField;
    cxDBPivotGrid05FieldTSOP_ORDBILGRUCLINOM: TcxDBPivotGridField;
    cxDBPivotGrid05FieldTSOP_ORDBILCLINOM: TcxDBPivotGridField;
    cxDBPivotGrid05FieldTSOP_ORDBILQTD: TcxDBPivotGridField;
    cxDBPivotGrid05FieldTSOP_ORDBILVALLIQ: TcxDBPivotGridField;
    cxDBPivotGrid05FieldTSOP_ORDBILREPNOM: TcxDBPivotGridField;
    cxDBPivotGrid06: TcxDBPivotGrid;
    cxDBPivotGrid06FieldTSOP_ORDBILSITNOM: TcxDBPivotGridField;
    cxDBPivotGrid06FieldTSOP_ORDBILCANNOM: TcxDBPivotGridField;
    cxDBPivotGrid06FieldTSOP_GRUCLIMER: TcxDBPivotGridField;
    cxDBPivotGrid06FieldTSOP_ORDBILITEFAM: TcxDBPivotGridField;
    cxDBPivotGrid06FieldTSOP_ORDBILITEFAMPAI: TcxDBPivotGridField;
    cxDBPivotGrid06FieldTSOP_ORDBILGRUCLINOM: TcxDBPivotGridField;
    cxDBPivotGrid06FieldTSOP_ORDBILCLINOM: TcxDBPivotGridField;
    cxDBPivotGrid06FieldTSOP_ORDBILQTD: TcxDBPivotGridField;
    cxDBPivotGrid06FieldTSOP_ORDBILVALLIQ: TcxDBPivotGridField;
    cxDBPivotGrid06FieldTSOP_ORDBILREPNOM: TcxDBPivotGridField;
    cxDBPivotGrid07: TcxDBPivotGrid;
    cxDBPivotGrid07FieldTSOP_ORDBILSITNOM: TcxDBPivotGridField;
    cxDBPivotGrid07FieldTSOP_ORDBILCANNOM: TcxDBPivotGridField;
    cxDBPivotGrid07FieldTSOP_GRUCLIMER: TcxDBPivotGridField;
    cxDBPivotGrid07FieldTSOP_ORDBILITEFAM: TcxDBPivotGridField;
    cxDBPivotGrid07FieldTSOP_ORDBILITEFAMPAI: TcxDBPivotGridField;
    cxDBPivotGrid07FieldTSOP_ORDBILGRUCLINOM: TcxDBPivotGridField;
    cxDBPivotGrid07FieldTSOP_ORDBILCLINOM: TcxDBPivotGridField;
    cxDBPivotGrid07FieldTSOP_ORDBILQTD: TcxDBPivotGridField;
    cxDBPivotGrid07FieldTSOP_ORDBILVALLIQ: TcxDBPivotGridField;
    cxDBPivotGrid07FieldTSOP_ORDBILREPNOM: TcxDBPivotGridField;
    cxDBPivotGrid08: TcxDBPivotGrid;
    cxDBPivotGrid08FieldTSOP_ORDBILSITNOM: TcxDBPivotGridField;
    cxDBPivotGrid08FieldTSOP_ORDBILCANNOM: TcxDBPivotGridField;
    cxDBPivotGrid08FieldTSOP_GRUCLIMER: TcxDBPivotGridField;
    cxDBPivotGrid08FieldTSOP_ORDBILITEFAM: TcxDBPivotGridField;
    cxDBPivotGrid08FieldTSOP_ORDBILITEFAMPAI: TcxDBPivotGridField;
    cxDBPivotGrid08FieldTSOP_ORDBILGRUCLINOM: TcxDBPivotGridField;
    cxDBPivotGrid08FieldTSOP_ORDBILCLINOM: TcxDBPivotGridField;
    cxDBPivotGrid08FieldTSOP_ORDBILQTD: TcxDBPivotGridField;
    cxDBPivotGrid08FieldTSOP_ORDBILVALLIQ: TcxDBPivotGridField;
    cxDBPivotGrid08FieldTSOP_ORDBILREPNOM: TcxDBPivotGridField;
    cxDBPivotGrid09: TcxDBPivotGrid;
    cxDBPivotGrid09FieldTSOP_ORDBILSITNOM: TcxDBPivotGridField;
    cxDBPivotGrid09FieldTSOP_ORDBILCANNOM: TcxDBPivotGridField;
    cxDBPivotGrid09FieldTSOP_GRUCLIMER: TcxDBPivotGridField;
    cxDBPivotGrid09FieldTSOP_ORDBILITEFAM: TcxDBPivotGridField;
    cxDBPivotGrid09FieldTSOP_ORDBILITEFAMPAI: TcxDBPivotGridField;
    cxDBPivotGrid09FieldTSOP_ORDBILGRUCLINOM: TcxDBPivotGridField;
    cxDBPivotGrid09FieldTSOP_ORDBILCLINOM: TcxDBPivotGridField;
    cxDBPivotGrid09FieldTSOP_ORDBILQTD: TcxDBPivotGridField;
    cxDBPivotGrid09FieldTSOP_ORDBILVALLIQ: TcxDBPivotGridField;
    cxDBPivotGrid09FieldTSOP_ORDBILREPNOM: TcxDBPivotGridField;
    cxDBPivotGrid10: TcxDBPivotGrid;
    cxDBPivotGrid10FieldTSOP_ORDBILSITNOM: TcxDBPivotGridField;
    cxDBPivotGrid10FieldTSOP_ORDBILCANNOM: TcxDBPivotGridField;
    cxDBPivotGrid10FieldTSOP_GRUCLIMER: TcxDBPivotGridField;
    cxDBPivotGrid10FieldTSOP_ORDBILITEFAM: TcxDBPivotGridField;
    cxDBPivotGrid10FieldTSOP_ORDBILITEFAMPAI: TcxDBPivotGridField;
    cxDBPivotGrid10FieldTSOP_ORDBILGRUCLINOM: TcxDBPivotGridField;
    cxDBPivotGrid10FieldTSOP_ORDBILCLINOM: TcxDBPivotGridField;
    cxDBPivotGrid10FieldTSOP_ORDBILQTD: TcxDBPivotGridField;
    cxDBPivotGrid10FieldTSOP_ORDBILVALLIQ: TcxDBPivotGridField;
    cxDBPivotGrid10FieldTSOP_ORDBILREPNOM: TcxDBPivotGridField;
    cxDBPivotGrid11: TcxDBPivotGrid;
    cxDBPivotGrid11FieldTSOP_ORDBILSITNOM: TcxDBPivotGridField;
    cxDBPivotGrid11FieldTSOP_ORDBILCANNOM: TcxDBPivotGridField;
    cxDBPivotGrid11FieldTSOP_GRUCLIMER: TcxDBPivotGridField;
    cxDBPivotGrid11FieldTSOP_ORDBILITEFAM: TcxDBPivotGridField;
    cxDBPivotGrid11FieldTSOP_ORDBILITEFAMPAI: TcxDBPivotGridField;
    cxDBPivotGrid11FieldTSOP_ORDBILGRUCLINOM: TcxDBPivotGridField;
    cxDBPivotGrid11FieldTSOP_ORDBILCLINOM: TcxDBPivotGridField;
    cxDBPivotGrid11FieldTSOP_ORDBILQTD: TcxDBPivotGridField;
    cxDBPivotGrid11FieldTSOP_ORDBILVALLIQ: TcxDBPivotGridField;
    cxDBPivotGrid11FieldTSOP_ORDBILREPNOM: TcxDBPivotGridField;
    FDQueryVSOP_OrderBilling11: TFDQuery;
    FDQueryVSOP_OrderBilling11TSOP_ORDBILCOD: TIntegerField;
    FDQueryVSOP_OrderBilling11TSOP_ORINOM: TStringField;
    FDQueryVSOP_OrderBilling11TSOP_ORDBILSITNOM: TStringField;
    FDQueryVSOP_OrderBilling11TSOP_ORDBILCANNOM: TStringField;
    FDQueryVSOP_OrderBilling11TSOP_ORDBILYEADOCCAL: TIntegerField;
    FDQueryVSOP_OrderBilling11TSOP_ORDBILMONDOCCAL: TIntegerField;
    FDQueryVSOP_OrderBilling11TSOP_ORDBILYEADOC: TIntegerField;
    FDQueryVSOP_OrderBilling11TSOP_ORDBILMONDOC: TIntegerField;
    FDQueryVSOP_OrderBilling11TSOP_ORDBILDATDOC: TSQLTimeStampField;
    FDQueryVSOP_OrderBilling11TSOP_ORDBILNRODOC: TStringField;
    FDQueryVSOP_OrderBilling11TSOP_ORDBILTIPDOC: TStringField;
    FDQueryVSOP_OrderBilling11TSOP_ORDBILNRODOCREF: TStringField;
    FDQueryVSOP_OrderBilling11TSOP_ORDBILYEADOCREQCAL: TIntegerField;
    FDQueryVSOP_OrderBilling11TSOP_ORDBILMONDOCREQCAL: TIntegerField;
    FDQueryVSOP_OrderBilling11TSOP_ORDBILYEADOCREQ: TIntegerField;
    FDQueryVSOP_OrderBilling11TSOP_ORDBILMONDOCREQ: TIntegerField;
    FDQueryVSOP_OrderBilling11TSOP_ORDBILDATDOCREQ: TSQLTimeStampField;
    FDQueryVSOP_OrderBilling11TSOP_ORDBILCLICOD: TStringField;
    FDQueryVSOP_OrderBilling11TSOP_ORDBILCLINOM: TStringField;
    FDQueryVSOP_OrderBilling11TSOP_ORDBILGRUCLINOM: TStringField;
    FDQueryVSOP_OrderBilling11TSOP_GRUCLIMER: TStringField;
    FDQueryVSOP_OrderBilling11TSOP_ORDBILREPNOM: TStringField;
    FDQueryVSOP_OrderBilling11TSOP_REPNOMINT: TStringField;
    FDQueryVSOP_OrderBilling11TSOP_REPCSR: TStringField;
    FDQueryVSOP_OrderBilling11TSOP_ORDBILITECOD: TStringField;
    FDQueryVSOP_OrderBilling11TSOP_ORDBILITENOM: TStringField;
    FDQueryVSOP_OrderBilling11TSOP_ORDBILITEUNI: TStringField;
    FDQueryVSOP_OrderBilling11TSOP_ORDBILITEFAM: TStringField;
    FDQueryVSOP_OrderBilling11TSOP_ORDBILITEFAMPAI: TStringField;
    FDQueryVSOP_OrderBilling11TSOP_ORDBILITEFAM001: TStringField;
    FDQueryVSOP_OrderBilling11TSOP_ORDBILITEFAM002: TStringField;
    FDQueryVSOP_OrderBilling11TSOP_ORDBILITEFAM003: TStringField;
    FDQueryVSOP_OrderBilling11TSOP_ORDBILITEFAM004: TStringField;
    FDQueryVSOP_OrderBilling11TSOP_ORDBILITEFAM005: TStringField;
    FDQueryVSOP_OrderBilling11TSOP_ORDBILVALLIQ: TBCDField;
    FDQueryVSOP_OrderBilling11TSOP_ORDBILQTD: TBCDField;
    FDQueryVSOP_OrderBilling11TSOP_REPACCTYP: TStringField;
    DataSourceVSOP_OrderBilling11: TDataSource;
    cxDBPivotGrid11FieldTSOP_ORDBILYEADOC: TcxDBPivotGridField;
    cxDBPivotGrid11FieldTSOP_ORDBILMONDOC: TcxDBPivotGridField;
    cxDBPivotGrid11FieldTSOP_ORDBILITENOM: TcxDBPivotGridField;
    FDQueryVSOP_OrderBilling11TSOP_ORDBILMONDOCSTR: TStringField;
    cxPageControlFiltro: TcxPageControl;
    cxTabSheetFiltro: TcxTabSheet;
    cxLabelDataInicial: TcxLabel;
    cxDateEditTSOP_ORDBILDATDOCREQINI: TcxDateEdit;
    cxLabelDataFinal: TcxLabel;
    cxDateEditTSOP_ORDBILDATDOCREQFIM: TcxDateEdit;
    cxButtonRefresh: TcxButton;
    cxLabel1: TcxLabel;
    cxDateEditTSOP_ORDBILDATDOCINI: TcxDateEdit;
    cxLabel2: TcxLabel;
    cxDateEditTSOP_ORDBILDATDOCFIM: TcxDateEdit;
    cxCheckComboBoxTSOP_ORDBILTIPDOC: TcxCheckComboBox;
    cxLabel3: TcxLabel;
    FDQueryVSOP_OrderBilling00TSOP_REPMKT: TStringField;
    FDQueryVSOP_OrderBilling01TSOP_REPMKT: TStringField;
    FDQueryVSOP_OrderBilling02TSOP_REPMKT: TStringField;
    FDQueryVSOP_OrderBilling03TSOP_REPMKT: TStringField;
    FDQueryVSOP_OrderBilling04TSOP_REPMKT: TStringField;
    FDQueryVSOP_OrderBilling05TSOP_REPMKT: TStringField;
    FDQueryVSOP_OrderBilling06TSOP_REPMKT: TStringField;
    FDQueryVSOP_OrderBilling07TSOP_REPMKT: TStringField;
    FDQueryVSOP_OrderBilling08TSOP_REPMKT: TStringField;
    FDQueryVSOP_OrderBilling09TSOP_REPMKT: TStringField;
    FDQueryVSOP_OrderBilling10TSOP_REPMKT: TStringField;
    FDQueryVSOP_OrderBilling11TSOP_REPMKT: TStringField;
    cxTableViewFaturamentoPedidos00TSOP_REPMKT: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos01TSOP_REPMKT: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos02TSOP_REPMKT: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos03TSOP_REPMKT: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos04TSOP_REPMKT: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos05TSOP_REPMKT: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos06TSOP_REPMKT: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos07TSOP_REPMKT: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos08TSOP_REPMKT: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos09TSOP_REPMKT: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos10TSOP_REPMKT: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos11TSOP_REPMKT: TcxGridDBColumn;
    FDQueryVSOP_OrderBilling00TSOP_ORDBILTYP: TStringField;
    FDQueryVSOP_OrderBilling01TSOP_ORDBILTYP: TStringField;
    FDQueryVSOP_OrderBilling02TSOP_ORDBILTYP: TStringField;
    FDQueryVSOP_OrderBilling03TSOP_ORDBILTYP: TStringField;
    FDQueryVSOP_OrderBilling04TSOP_ORDBILTYP: TStringField;
    FDQueryVSOP_OrderBilling05TSOP_ORDBILTYP: TStringField;
    FDQueryVSOP_OrderBilling06TSOP_ORDBILTYP: TStringField;
    FDQueryVSOP_OrderBilling07TSOP_ORDBILTYP: TStringField;
    FDQueryVSOP_OrderBilling08TSOP_ORDBILTYP: TStringField;
    FDQueryVSOP_OrderBilling09TSOP_ORDBILTYP: TStringField;
    FDQueryVSOP_OrderBilling10TSOP_ORDBILTYP: TStringField;
    FDQueryVSOP_OrderBilling11TSOP_ORDBILTYP: TStringField;
    cxTableViewFaturamentoPedidos00TSOP_ORDBILTYP: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos01TSOP_ORDBILTYP: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos02TSOP_ORDBILTYP: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos04TSOP_ORDBILTYP: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos05TSOP_ORDBILTYP: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos06TSOP_ORDBILTYP: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos07TSOP_ORDBILTYP: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos09TSOP_ORDBILTYP: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos10TSOP_ORDBILTYP: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos11TSOP_ORDBILTYP: TcxGridDBColumn;
    cxDBPivotGrid00FieldTSOP_ORDBILTYP: TcxDBPivotGridField;
    cxDBPivotGrid01FieldTSOP_ORDBILTYP: TcxDBPivotGridField;
    cxDBPivotGrid02FieldTSOP_ORDBILTYP: TcxDBPivotGridField;
    cxDBPivotGrid03FieldTSOP_ORDBILTYP: TcxDBPivotGridField;
    cxDBPivotGrid04FieldTSOP_ORDBILTYP: TcxDBPivotGridField;
    cxDBPivotGrid05FieldTSOP_ORDBILTYP: TcxDBPivotGridField;
    cxDBPivotGrid06FieldTSOP_ORDBILTYP: TcxDBPivotGridField;
    cxDBPivotGrid07FieldTSOP_ORDBILTYP: TcxDBPivotGridField;
    cxDBPivotGrid08FieldTSOP_ORDBILTYP: TcxDBPivotGridField;
    cxDBPivotGrid09FieldTSOP_ORDBILTYP: TcxDBPivotGridField;
    cxDBPivotGrid10FieldTSOP_ORDBILTYP: TcxDBPivotGridField;
    cxDBPivotGrid11FieldTSOP_ORDBILTYP: TcxDBPivotGridField;
    cxDBPivotGrid11FieldTSOP_ORDBILREPNOMINT: TcxDBPivotGridField;
    FDScriptAlterarAccOwner: TFDScript;
    FDQueryVSOP_OrderBilling00TSOP_ORDBILREGEST: TStringField;
    FDQueryVSOP_OrderBilling00TSOP_ORDBILREG: TStringField;
    cxTableViewFaturamentoPedidos00TSOP_ORDBILREGEST: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos00TSOP_ORDBILREG: TcxGridDBColumn;
    FDQueryVSOP_OrderBilling00TSOP_ORDBILITEFAMPAI: TStringField;
    FDQueryVSOP_OrderBilling01TSOP_ORDBILITEFAMPAI: TStringField;
    FDQueryVSOP_OrderBilling02TSOP_ORDBILITEFAMPAI: TStringField;
    FDQueryVSOP_OrderBilling03TSOP_ORDBILITEFAMPAI: TStringField;
    FDQueryVSOP_OrderBilling04TSOP_ORDBILITEFAMPAI: TStringField;
    FDQueryVSOP_OrderBilling05TSOP_ORDBILITEFAMPAI: TStringField;
    FDQueryVSOP_OrderBilling07TSOP_ORDBILITEFAMPAI: TStringField;
    FDQueryVSOP_OrderBilling08TSOP_ORDBILITEFAMPAI: TStringField;
    FDQueryVSOP_OrderBilling09TSOP_ORDBILITEFAMPAI: TStringField;
    FDQueryVSOP_OrderBilling10TSOP_ORDBILITEFAMPAI: TStringField;
    FDQueryVSOP_OrderBilling06TSOP_ORDBILITEFAMPAI: TStringField;
    cxTableViewFaturamentoPedidos00TSOP_ORDBILITEFAMPAI: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos01TSOP_ORDBILITEFAMPAI: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos02TSOP_ORDBILITEFAMPAI: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos03TSOP_ORDBILTYP: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos03TSOP_ORDBILITEFAMPAI: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos04TSOP_ORDBILITEFAMPAI: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos05TSOP_ORDBILITEFAMPAI: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos06TSOP_ORDBILITEFAMPAI: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos07TSOP_ORDBILITEFAMPAI: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos08TSOP_ORDBILTYP: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos08TSOP_ORDBILITEFAMPAI: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos09TSOP_ORDBILITEFAMPAI: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos10TSOP_ORDBILITEFAMPAI: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos11TSOP_ORDBILITEFAMPAI: TcxGridDBColumn;
    FDQueryVSOP_OrderBilling00TSOP_ITECLISAPITECLICOD: TStringField;
    cxTableViewFaturamentoPedidos00TSOP_ITECLISAPITECLICOD: TcxGridDBColumn;
    FDQueryVSOP_OrderBilling01TSOP_ITECLISAPITECLICOD: TStringField;
    FDQueryVSOP_OrderBilling02TSOP_ITECLISAPITECLICOD: TStringField;
    FDQueryVSOP_OrderBilling03TSOP_ITECLISAPITECLICOD: TStringField;
    FDQueryVSOP_OrderBilling04TSOP_ITECLISAPITECLICOD: TStringField;
    FDQueryVSOP_OrderBilling05TSOP_ITECLISAPITECLICOD: TStringField;
    FDQueryVSOP_OrderBilling06TSOP_ITECLISAPITECLICOD: TStringField;
    FDQueryVSOP_OrderBilling07TSOP_ITECLISAPITECLICOD: TStringField;
    FDQueryVSOP_OrderBilling08TSOP_ITECLISAPITECLICOD: TStringField;
    FDQueryVSOP_OrderBilling09TSOP_ITECLISAPITECLICOD: TStringField;
    FDQueryVSOP_OrderBilling10TSOP_ITECLISAPITECLICOD: TStringField;
    FDQueryVSOP_OrderBilling11TSOP_ITECLISAPITECLICOD: TStringField;
    cxTableViewFaturamentoPedidos01TSOP_ITECLISAPITECLICOD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos02TSOP_ITECLISAPITECLICOD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos03TSOP_ITECLISAPITECLICOD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos04TSOP_ITECLISAPITECLICOD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos05TSOP_ITECLISAPITECLICOD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos06TSOP_ITECLISAPITECLICOD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos07TSOP_ITECLISAPITECLICOD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos08TSOP_ITECLISAPITECLICOD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos09TSOP_ITECLISAPITECLICOD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos10TSOP_ITECLISAPITECLICOD: TcxGridDBColumn;
    cxTableViewFaturamentoPedidos11TSOP_ITECLISAPITECLICOD: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FDQueryVSOP_OrderBilling11CalcFields(DataSet: TDataSet);
    procedure cxButtonRefreshClick(Sender: TObject);
    procedure FDQueryVSOP_OrderBillingCalcFields(DataSet: TDataSet);
    procedure cxPageControlPivotPageChanging(Sender: TObject; NewPage: TcxTabSheet; var AllowChange: Boolean);
    procedure cxGridFaturamentoPedidosFocusedViewChanged(Sender: TcxCustomGrid; APrevFocusedView,
      AFocusedView: TcxCustomGridView);
    procedure cxTableViewFaturamentoPedidosDblClick(Sender: TObject);
  private
    procedure Mensagem( pMensagem: String );
    function GetComando(ObjetoQuery: TFDQuery): String;
    { Private declarations }
  public
    procedure AbrirDataset;
    procedure LoadGridCustomization;
    { Public declarations }
  end;

var
  Fr_RelatorioFaturamentoPedidos: TFr_RelatorioFaturamentoPedidos;

implementation

{$R *.dfm}

uses uBrady, uUtils, uUtilsOwner, uDados;



Function TFr_RelatorioFaturamentoPedidos.GetComando(ObjetoQuery: TFDQuery) : String;
var
 i        : Integer;
 strQuery : String;
 sGetComando : String;
begin

  strQuery := UpperCase(ObjetoQuery.SQL.Text);

  For  i := 0 to ObjetoQuery.Params.Count - 1 do
    strQuery := StrTran(strQuery,':' + UpperCase(ObjetoQuery.Params[i].Name), QuotedStr(ObjetoQuery.Params[i].Value) );

   strQuery :=  StrTran(StrTran(strQuery, ''#$D#$A'', ' '), ''#$D#$A'', '');


  result := strQuery;

end;

procedure TFr_RelatorioFaturamentoPedidos.AbrirDataset;
var
  varTSOP_ORDBILTIPDOC: String;

begin

  Mensagem( 'Abrindo conex�o...' );
  try

    if not FDConnection.Connected then
    begin

      FDConnection.Params.LoadFromFile( MyDocumentsPath + '\DB.ini' );
      FDConnection.Open;

    end;
    Mensagem( 'Obtendo dados (00 - Customizado)...' );
    FDQueryVSOP_OrderBilling00.ParamByName( 'MES_INI' ).AsDateTime := cxDateEditTSOP_ORDBILDATDOCREQINI.Date;
    FDQueryVSOP_OrderBilling00.ParamByName( 'MES_FIM' ).AsDateTime := cxDateEditTSOP_ORDBILDATDOCREQFIM.Date;
    FDQueryVSOP_OrderBilling00.ParamByName( 'MES_INI2' ).AsDateTime := cxDateEditTSOP_ORDBILDATDOCINI.Date;
    FDQueryVSOP_OrderBilling00.ParamByName( 'MES_FIM2' ).AsDateTime := cxDateEditTSOP_ORDBILDATDOCFIM.Date;

    varTSOP_ORDBILTIPDOC := EmptyStr;
    if cxCheckComboBoxTSOP_ORDBILTIPDOC.States[0] = cbsChecked then
    begin

      if varTSOP_ORDBILTIPDOC = EmptyStr then
        varTSOP_ORDBILTIPDOC := ' AND A01.TSOP_ORDBILTIPDOC IN ('
      else
        varTSOP_ORDBILTIPDOC := varTSOP_ORDBILTIPDOC + ',';

      varTSOP_ORDBILTIPDOC := varTSOP_ORDBILTIPDOC + QuotedStr('Order');

    end;

    if cxCheckComboBoxTSOP_ORDBILTIPDOC.States[1] = cbsChecked then
    begin

      if varTSOP_ORDBILTIPDOC = EmptyStr then
        varTSOP_ORDBILTIPDOC := ' AND A01.TSOP_ORDBILTIPDOC IN ('
      else
        varTSOP_ORDBILTIPDOC := varTSOP_ORDBILTIPDOC + ',';

      varTSOP_ORDBILTIPDOC := varTSOP_ORDBILTIPDOC + QuotedStr('Billing');

    end;

    if cxCheckComboBoxTSOP_ORDBILTIPDOC.States[2] = cbsChecked then
    begin

      if varTSOP_ORDBILTIPDOC = EmptyStr then
        varTSOP_ORDBILTIPDOC := ' AND A01.TSOP_ORDBILTIPDOC IN ('
      else
        varTSOP_ORDBILTIPDOC := varTSOP_ORDBILTIPDOC + ',';

      varTSOP_ORDBILTIPDOC := varTSOP_ORDBILTIPDOC + QuotedStr('Return');

    end;

    if not (varTSOP_ORDBILTIPDOC = EmptyStr) then
    begin

      varTSOP_ORDBILTIPDOC := varTSOP_ORDBILTIPDOC + ')';

    end;

    if Fr_Brady.SalesRep then
      FDQueryVSOP_OrderBilling00.MacroByName( 'WHERE' ).AsRaw := 'AND (A01.TSOP_ORDBILREPNOM = ' + QuotedStr(Fr_Brady.TSIS_USUNOM) + ' OR A01.TSOP_REPMKT = ' + QuotedStr(Fr_Brady.TSIS_USUNOM) + ' OR A01.TSOP_REPNOMINT = ' + QuotedStr(Fr_Brady.TSIS_USUNOM) + ')';
    if Fr_Brady.CustomerService then
      FDQueryVSOP_OrderBilling00.MacroByName( 'WHERE' ).AsRaw := 'AND A01.TSOP_REPCSR = ' + QuotedStr(Fr_Brady.TSIS_USUNOM);

    FDQueryVSOP_OrderBilling00.MacroByName( 'WHERE1' ).AsRaw := varTSOP_ORDBILTIPDOC;

    if Fr_Brady.SalesRep then
      FDQueryVSOP_OrderBilling00.SQL.Text := FDQueryVSOP_OrderBilling00.SQL.Text.Replace( 'VSOP_OrderBillingFull', 'VSOP_OrderBilling' );

   
    FDQueryVSOP_OrderBilling00.Open;

    if FDQueryVSOP_OrderBilling01.Active then
      Exit;

    Try
        Mensagem( 'Obtendo dados (01 - Captado para o m�s corrente)...' );
        FDQueryVSOP_OrderBilling01.ParamByName( 'MES_INI' ).AsDateTime := System.DateUtils.StartOfTheMonth(Now);
        FDQueryVSOP_OrderBilling01.ParamByName( 'MES_FIM' ).AsDateTime := System.DateUtils.EndOfTheMonth(Now);

        if Fr_Brady.SalesRep then
          FDQueryVSOP_OrderBilling01.MacroByName( 'WHERE' ).AsRaw := 'AND (A01.TSOP_ORDBILREPNOM = ' + QuotedStr(Fr_Brady.TSIS_USUNOM) + ' OR A01.TSOP_REPMKT = ' + QuotedStr(Fr_Brady.TSIS_USUNOM) + ' OR A01.TSOP_REPNOMINT = ' + QuotedStr(Fr_Brady.TSIS_USUNOM) + ')';
        if Fr_Brady.CustomerService then
          FDQueryVSOP_OrderBilling01.MacroByName( 'WHERE' ).AsRaw := 'AND A01.TSOP_REPCSR = ' + QuotedStr(Fr_Brady.TSIS_USUNOM);

        if Fr_Brady.SalesRep then
          FDQueryVSOP_OrderBilling01.SQL.Text := FDQueryVSOP_OrderBilling01.SQL.Text.Replace( 'VSOP_OrderBillingFull', 'VSOP_OrderBilling' );


        FDQueryVSOP_OrderBilling01.Open;

        Mensagem( 'Obtendo dados (02 - Carteira de pedidos em aberto)...' );
        if Fr_Brady.SalesRep then
          FDQueryVSOP_OrderBilling02.MacroByName( 'WHERE' ).AsRaw := 'AND (A01.TSOP_ORDBILREPNOM = ' + QuotedStr(Fr_Brady.TSIS_USUNOM) + ' OR A01.TSOP_REPMKT = ' + QuotedStr(Fr_Brady.TSIS_USUNOM) + ' OR A01.TSOP_REPNOMINT = ' + QuotedStr(Fr_Brady.TSIS_USUNOM) + ')';
        if Fr_Brady.CustomerService then
          FDQueryVSOP_OrderBilling02.MacroByName( 'WHERE' ).AsRaw := 'AND A01.TSOP_REPCSR = ' + QuotedStr(Fr_Brady.TSIS_USUNOM);

        if Fr_Brady.SalesRep then
          FDQueryVSOP_OrderBilling02.SQL.Text := FDQueryVSOP_OrderBilling02.SQL.Text.Replace( 'VSOP_OrderBillingFull', 'VSOP_OrderBilling' );
        FDQueryVSOP_OrderBilling02.Open;

        Mensagem( 'Obtendo dados (03 - Late Backolog)...' );
        FDQueryVSOP_OrderBilling03.ParamByName( 'MES_ANT_FIM' ).AsDateTime := System.DateUtils.EndOfTheMonth(System.DateUtils.StartOfTheMonth(Now)-1);

        if Fr_Brady.SalesRep then
          FDQueryVSOP_OrderBilling03.MacroByName( 'WHERE' ).AsRaw := 'AND (A01.TSOP_ORDBILREPNOM = ' + QuotedStr(Fr_Brady.TSIS_USUNOM) + ' OR A01.TSOP_REPMKT = ' + QuotedStr(Fr_Brady.TSIS_USUNOM) + ' OR A01.TSOP_REPNOMINT = ' + QuotedStr(Fr_Brady.TSIS_USUNOM) + ')';
        if Fr_Brady.CustomerService then
          FDQueryVSOP_OrderBilling03.MacroByName( 'WHERE' ).AsRaw := 'AND A01.TSOP_REPCSR = ' + QuotedStr(Fr_Brady.TSIS_USUNOM);

        if Fr_Brady.SalesRep then
          FDQueryVSOP_OrderBilling03.SQL.Text := FDQueryVSOP_OrderBilling03.SQL.Text.Replace( 'VSOP_OrderBillingFull', 'VSOP_OrderBilling' );
        FDQueryVSOP_OrderBilling03.Open;

        Mensagem( 'Obtendo dados (04 - Backlog)...' );
        FDQueryVSOP_OrderBilling04.ParamByName( 'MES_INI' ).AsDateTime := System.DateUtils.StartOfTheMonth(Now);
        FDQueryVSOP_OrderBilling04.ParamByName( 'MES_FIM' ).AsDateTime := System.DateUtils.EndOfTheMonth(Now);

        if Fr_Brady.SalesRep then
          FDQueryVSOP_OrderBilling04.MacroByName( 'WHERE' ).AsRaw := 'AND (A01.TSOP_ORDBILREPNOM = ' + QuotedStr(Fr_Brady.TSIS_USUNOM) + ' OR A01.TSOP_REPMKT = ' + QuotedStr(Fr_Brady.TSIS_USUNOM) + ' OR A01.TSOP_REPNOMINT = ' + QuotedStr(Fr_Brady.TSIS_USUNOM) + ')';
        if Fr_Brady.CustomerService then
          FDQueryVSOP_OrderBilling04.MacroByName( 'WHERE' ).AsRaw := 'AND A01.TSOP_REPCSR = ' + QuotedStr(Fr_Brady.TSIS_USUNOM);

        if Fr_Brady.SalesRep then
          FDQueryVSOP_OrderBilling04.SQL.Text := FDQueryVSOP_OrderBilling04.SQL.Text.Replace( 'VSOP_OrderBillingFull', 'VSOP_OrderBilling' );
        FDQueryVSOP_OrderBilling04.Open;

        Mensagem( 'Obtendo dados (05 - Backlog (futuro))...' );
        FDQueryVSOP_OrderBilling05.ParamByName( 'MES_PROX_INI' ).AsDateTime := System.DateUtils.StartOfTheMonth(System.DateUtils.EndOfTheMonth(Now)+1);

        if Fr_Brady.SalesRep then
          FDQueryVSOP_OrderBilling05.MacroByName( 'WHERE' ).AsRaw := 'AND (A01.TSOP_ORDBILREPNOM = ' + QuotedStr(Fr_Brady.TSIS_USUNOM) + ' OR A01.TSOP_REPMKT = ' + QuotedStr(Fr_Brady.TSIS_USUNOM) + ' OR A01.TSOP_REPNOMINT = ' + QuotedStr(Fr_Brady.TSIS_USUNOM) + ')';
        if Fr_Brady.CustomerService then
          FDQueryVSOP_OrderBilling05.MacroByName( 'WHERE' ).AsRaw := 'AND A01.TSOP_REPCSR = ' + QuotedStr(Fr_Brady.TSIS_USUNOM);

        if Fr_Brady.SalesRep then
          FDQueryVSOP_OrderBilling05.SQL.Text := FDQueryVSOP_OrderBilling05.SQL.Text.Replace( 'VSOP_OrderBillingFull', 'VSOP_OrderBilling' );
        FDQueryVSOP_OrderBilling05.Open;

        Mensagem( 'Obtendo dados (06 - Faturamento do m�s)...' );
        FDQueryVSOP_OrderBilling06.ParamByName( 'MES_INI' ).AsDateTime := System.DateUtils.StartOfTheMonth(Now);
        FDQueryVSOP_OrderBilling06.ParamByName( 'MES_FIM' ).AsDateTime := System.DateUtils.EndOfTheMonth(Now);

        if Fr_Brady.SalesRep then
          FDQueryVSOP_OrderBilling06.MacroByName( 'WHERE' ).AsRaw := 'AND (A01.TSOP_ORDBILREPNOM = ' + QuotedStr(Fr_Brady.TSIS_USUNOM) + ' OR A01.TSOP_REPMKT = ' + QuotedStr(Fr_Brady.TSIS_USUNOM) + ' OR A01.TSOP_REPNOMINT = ' + QuotedStr(Fr_Brady.TSIS_USUNOM) + ')';
        if Fr_Brady.CustomerService then
          FDQueryVSOP_OrderBilling06.MacroByName( 'WHERE' ).AsRaw := 'AND A01.TSOP_REPCSR = ' + QuotedStr(Fr_Brady.TSIS_USUNOM);

        if Fr_Brady.SalesRep then
          FDQueryVSOP_OrderBilling06.SQL.Text := FDQueryVSOP_OrderBilling06.SQL.Text.Replace( 'VSOP_OrderBillingFull', 'VSOP_OrderBilling' );
        FDQueryVSOP_OrderBilling06.Open;

        Mensagem( 'Obtendo dados (07 - Faturamento (late backlog))...' );
        FDQueryVSOP_OrderBilling07.ParamByName( 'MES_ANT_FIM' ).AsDateTime := System.DateUtils.EndOfTheMonth(System.DateUtils.StartOfTheMonth(Now)-1);
        FDQueryVSOP_OrderBilling07.ParamByName( 'MES_INI' ).AsDateTime := System.DateUtils.StartOfTheMonth(Now);
        FDQueryVSOP_OrderBilling07.ParamByName( 'MES_FIM' ).AsDateTime := System.DateUtils.EndOfTheMonth(Now);

        if Fr_Brady.SalesRep then
          FDQueryVSOP_OrderBilling07.MacroByName( 'WHERE' ).AsRaw := 'AND (A01.TSOP_ORDBILREPNOM = ' + QuotedStr(Fr_Brady.TSIS_USUNOM) + ' OR A01.TSOP_REPMKT = ' + QuotedStr(Fr_Brady.TSIS_USUNOM) + ' OR A01.TSOP_REPNOMINT = ' + QuotedStr(Fr_Brady.TSIS_USUNOM) + ')';
        if Fr_Brady.CustomerService then
          FDQueryVSOP_OrderBilling07.MacroByName( 'WHERE' ).AsRaw := 'AND A01.TSOP_REPCSR = ' + QuotedStr(Fr_Brady.TSIS_USUNOM);

        if Fr_Brady.SalesRep then
          FDQueryVSOP_OrderBilling07.SQL.Text := FDQueryVSOP_OrderBilling07.SQL.Text.Replace( 'VSOP_OrderBillingFull', 'VSOP_OrderBilling' );
        FDQueryVSOP_OrderBilling07.Open;

        Mensagem( 'Obtendo dados (08 - Faturamento (backlog))...' );
        FDQueryVSOP_OrderBilling08.ParamByName( 'MES_INI' ).AsDateTime := System.DateUtils.StartOfTheMonth(Now);
        FDQueryVSOP_OrderBilling08.ParamByName( 'MES_FIM' ).AsDateTime := System.DateUtils.EndOfTheMonth(Now);

        if Fr_Brady.SalesRep then
          FDQueryVSOP_OrderBilling08.MacroByName( 'WHERE' ).AsRaw := 'AND (A01.TSOP_ORDBILREPNOM = ' + QuotedStr(Fr_Brady.TSIS_USUNOM) + ' OR A01.TSOP_REPMKT = ' + QuotedStr(Fr_Brady.TSIS_USUNOM) + ' OR A01.TSOP_REPNOMINT = ' + QuotedStr(Fr_Brady.TSIS_USUNOM) + ')';
        if Fr_Brady.CustomerService then
          FDQueryVSOP_OrderBilling08.MacroByName( 'WHERE' ).AsRaw := 'AND A01.TSOP_REPCSR = ' + QuotedStr(Fr_Brady.TSIS_USUNOM);

        if Fr_Brady.SalesRep then
          FDQueryVSOP_OrderBilling08.SQL.Text := FDQueryVSOP_OrderBilling08.SQL.Text.Replace( 'VSOP_OrderBillingFull', 'VSOP_OrderBilling' );
        FDQueryVSOP_OrderBilling08.Open;

        Mensagem( 'Obtendo dados (09 - Faturamento (backlog futuro) * antecipa��o)...' );
        FDQueryVSOP_OrderBilling09.ParamByName( 'MES_PROX_INI' ).AsDateTime := System.DateUtils.StartOfTheMonth(System.DateUtils.EndOfTheMonth(Now)+1);
        FDQueryVSOP_OrderBilling09.ParamByName( 'MES_INI' ).AsDateTime := System.DateUtils.StartOfTheMonth(Now);
        FDQueryVSOP_OrderBilling09.ParamByName( 'MES_FIM' ).AsDateTime := System.DateUtils.EndOfTheMonth(Now);

        if Fr_Brady.SalesRep then
          FDQueryVSOP_OrderBilling09.MacroByName( 'WHERE' ).AsRaw := 'AND (A01.TSOP_ORDBILREPNOM = ' + QuotedStr(Fr_Brady.TSIS_USUNOM) + ' OR A01.TSOP_REPMKT = ' + QuotedStr(Fr_Brady.TSIS_USUNOM) + ' OR A01.TSOP_REPNOMINT = ' + QuotedStr(Fr_Brady.TSIS_USUNOM) + ')';
        if Fr_Brady.CustomerService then
          FDQueryVSOP_OrderBilling09.MacroByName( 'WHERE' ).AsRaw := 'AND A01.TSOP_REPCSR = ' + QuotedStr(Fr_Brady.TSIS_USUNOM);

        if Fr_Brady.SalesRep then
          FDQueryVSOP_OrderBilling09.SQL.Text := FDQueryVSOP_OrderBilling09.SQL.Text.Replace( 'VSOP_OrderBillingFull', 'VSOP_OrderBilling' );
        FDQueryVSOP_OrderBilling09.Open;

        Mensagem( 'Obtendo dados (10 - Faturamento (antecipado em meses anteriores))...' );
        FDQueryVSOP_OrderBilling10.ParamByName( 'MES_ANT_FIM' ).AsDateTime := System.DateUtils.EndOfTheMonth(System.DateUtils.StartOfTheMonth(Now)-1);
        FDQueryVSOP_OrderBilling10.ParamByName( 'MES_INI' ).AsDateTime := System.DateUtils.StartOfTheMonth(Now);
        FDQueryVSOP_OrderBilling10.ParamByName( 'MES_FIM' ).AsDateTime := System.DateUtils.EndOfTheMonth(Now);

        if Fr_Brady.SalesRep then
          FDQueryVSOP_OrderBilling10.MacroByName( 'WHERE' ).AsRaw := 'AND (A01.TSOP_ORDBILREPNOM = ' + QuotedStr(Fr_Brady.TSIS_USUNOM) + ' OR A01.TSOP_REPMKT = ' + QuotedStr(Fr_Brady.TSIS_USUNOM) + ' OR A01.TSOP_REPNOMINT = ' + QuotedStr(Fr_Brady.TSIS_USUNOM) + ')';
        if Fr_Brady.CustomerService then
          FDQueryVSOP_OrderBilling10.MacroByName( 'WHERE' ).AsRaw := 'AND A01.TSOP_REPCSR = ' + QuotedStr(Fr_Brady.TSIS_USUNOM);

        if Fr_Brady.SalesRep then
          FDQueryVSOP_OrderBilling10.SQL.Text := FDQueryVSOP_OrderBilling10.SQL.Text.Replace( 'VSOP_OrderBillingFull', 'VSOP_OrderBilling' );
        FDQueryVSOP_OrderBilling10.Open;

        Mensagem( 'Obtendo dados (11 - Faturamento (Ano x Ano))...' );
        if Fr_Brady.SalesRep then
          FDQueryVSOP_OrderBilling11.MacroByName( 'WHERE' ).AsRaw := 'AND (A01.TSOP_ORDBILREPNOM = ' + QuotedStr(Fr_Brady.TSIS_USUNOM) + ' OR A01.TSOP_REPMKT = ' + QuotedStr(Fr_Brady.TSIS_USUNOM) + ' OR A01.TSOP_REPNOMINT = ' + QuotedStr(Fr_Brady.TSIS_USUNOM) + ')';
        if Fr_Brady.CustomerService then
          FDQueryVSOP_OrderBilling11.MacroByName( 'WHERE' ).AsRaw := 'AND A01.TSOP_REPCSR = ' + QuotedStr(Fr_Brady.TSIS_USUNOM);

        if Fr_Brady.SalesRep then
          FDQueryVSOP_OrderBilling11.SQL.Text := FDQueryVSOP_OrderBilling11.SQL.Text.Replace( 'VSOP_OrderBillingFull', 'VSOP_OrderBilling' );
        FDQueryVSOP_OrderBilling11.Open;
   except
        on e: exception do
           ShowMessage(e.Message);
    End;
  finally

    Mensagem( EmptyStr );

  end;

end;

procedure TFr_RelatorioFaturamentoPedidos.cxButtonRefreshClick(Sender: TObject);
begin

  FDQueryVSOP_OrderBilling00.Close;
  AbrirDataset;

end;

procedure TFr_RelatorioFaturamentoPedidos.cxGridFaturamentoPedidosFocusedViewChanged(Sender: TcxCustomGrid; APrevFocusedView,
  AFocusedView: TcxCustomGridView);
begin

  try
    cxPageControlFiltro.Visible := AFocusedView = cxTableViewFaturamentoPedidos00;
  except
  end;

end;

procedure TFr_RelatorioFaturamentoPedidos.cxPageControlPivotPageChanging(Sender: TObject; NewPage: TcxTabSheet;
  var AllowChange: Boolean);
begin

  try
    cxPageControlFiltro.Visible := NewPage = cxTabSheetPivot00;
  except
  end;

end;

procedure TFr_RelatorioFaturamentoPedidos.cxTableViewFaturamentoPedidosDblClick(Sender: TObject);
var
  varScript: TStringList;
  varDataSet: TDataSet;
  AHitTest: TcxCustomGridHitTest;
  APoint: TPoint;

begin

  APoint := Mouse.CursorPos;
  APoint := TcxGridSite(Sender).ScreenToClient(APoint);
  AHitTest := TcxGridSite(Sender).ViewInfo.GetHitTest(APoint.X, APoint.Y);
  if not (AHitTest is TcxGridRecordCellHitTest) then Exit;

  if not Fr_Brady.SalesRep then
  begin

    Fr_UtilOwner := TFr_UtilOwner.Create(Self);
    try

      if cxGridFaturamentoPedidos.ActiveView is TcxGridDBTableView then
      begin

        varDataSet := (cxGridFaturamentoPedidos.ActiveView as TcxGridDBTableView).DataController.DataSet;

        Fr_UtilOwner.cxLabelCliente.Caption := varDataSet.FieldByName('TSOP_ORDBILCLICOD').AsString + ' - ' + varDataSet.FieldByName('TSOP_ORDBILCLINOM').AsString;

        Fr_UtilOwner.ValueListEditorColumn.Values['Grupo de Cliente'] := varDataSet.FieldByName('TSOP_ORDBILGRUCLINOM').AsString;
        Fr_UtilOwner.ValueListEditorColumn.Values['Mercado do Cliente'] := varDataSet.FieldByName('TSOP_GRUCLIMER').AsString;
        Fr_UtilOwner.ValueListEditorColumn.Values['Acc Type'] := varDataSet.FieldByName('TSOP_REPACCTYP').AsString;
        Fr_UtilOwner.ValueListEditorColumn.Values['-'] := '';
        Fr_UtilOwner.ValueListEditorColumn.Values['Acc Owner'] := varDataSet.FieldByName('TSOP_ORDBILREPNOM').AsString;
        Fr_UtilOwner.ValueListEditorColumn.Values['Region Owner'] := varDataSet.FieldByName('TSOP_REPNOMINT').AsString;
        Fr_UtilOwner.ValueListEditorColumn.Values['Market Mng'] := varDataSet.FieldByName('TSOP_REPMKT').AsString;
        Fr_UtilOwner.ValueListEditorColumn.Values['CSR'] := varDataSet.FieldByName('TSOP_REPCSR').AsString;

        Fr_UtilOwner.CheckBoxDistribuidor.Checked := varDataSet.FieldByName('TSOP_ORDBILCANNOM').AsString.Equals('DISTRIBUTORS');

        if Fr_UtilOwner.ShowModal = mrOk then
        begin

          varScript := TStringList.Create;
          try

            varScript.Add('UPDATE A01 SET A01.TSOP_GRUCLIATUIMP = ' + QuotedStr('N') + ', A01.TSOP_GRUCLINOM = ' + QuotedStr(Fr_UtilOwner.ValueListEditorColumn.Values['Grupo de Cliente']) + ', A01.TSOP_GRUCLIMER = ' + QuotedStr(Fr_UtilOwner.ValueListEditorColumn.Values['Mercado do Cliente']) + ' FROM TSOP_GrupoCliente A01 WHERE A01.TSOP_GRUCLICLICOD = ' + QuotedStr(varDataSet.FieldByName('TSOP_ORDBILCLICOD').AsString) );
            FDScriptAlterarAccOwner.ExecuteScript(varScript);

          finally

            FreeAndNil(varScript);

          end;

          varScript := TStringList.Create;
          try

            varScript.Add('UPDATE A01 SET A01.TSOP_REPATUIMP = ' + QuotedStr('N') + ', A01.TSOP_REPNOM = ' + QuotedStr( Fr_UtilOwner.ValueListEditorColumn.Values['Acc Owner'] ) + ', A01.TSOP_REPNOMINT = ' + QuotedStr( Fr_UtilOwner.ValueListEditorColumn.Values['Region Owner'] ) + ', A01.TSOP_REPMKT = ' + QuotedStr(Fr_UtilOwner.ValueListEditorColumn.Values['Market Mng']) + ', A01.TSOP_REPCSR = ' + QuotedStr(Fr_UtilOwner.ValueListEditorColumn.Values['CSR']) + ', A01.TSOP_REPACCTYP = ' + QuotedStr(Fr_UtilOwner.ValueListEditorColumn.Values['Acc Type']) + ' FROM TSOP_Representante A01 WHERE A01.TSOP_REPCLICOD = ' + QuotedStr(varDataSet.FieldByName('TSOP_ORDBILCLICOD').AsString));
            FDScriptAlterarAccOwner.ExecuteScript(varScript);

          finally

            FreeAndNil(varScript);

          end;

          varScript := TStringList.Create;
          try

            varScript.Add( 'DELETE FROM TSOP_DeParaCanal WHERE TSOP_DPACANTIPTXT = ''C'' AND TSOP_DPACANTXTANT = ' + QuotedStr( varDataSet.FieldByName('TSOP_ORDBILCLICOD').AsString ) );
            FDScriptAlterarAccOwner.ExecuteScript(varScript);

          finally

            FreeAndNil(varScript);

          end;

          varScript := TStringList.Create;
          try

            if Fr_UtilOwner.CheckBoxDistribuidor.Checked then
            begin

              varScript.Add( 'INSERT INTO TSOP_DeParaCanal ( TSOP_ORICOD, TSOP_DPACANTIPTXT, TSOP_DPACANTXTANT, TSOP_DPACANTXTDEP, TSOP_USUCODCAD, TSOP_DPACANDATCAD, TSOP_USUCODALT, TSOP_DPACANDATALT ) VALUES ( 1, ''C'', ' + QuotedStr(varDataSet.FieldByName('TSOP_ORDBILCLICOD').AsString) + ', ''DISTRIBUTORS'', 1, GETDATE(), 1, GETDATE() )' );
              FDScriptAlterarAccOwner.ExecuteScript(varScript);

            end;

          finally

            FreeAndNil(varScript);

          end;

        end;

      end;

    finally

      FreeAndNil(Fr_UtilOwner);

    end;

  end;

end;

procedure TFr_RelatorioFaturamentoPedidos.FDQueryVSOP_OrderBillingCalcFields(DataSet: TDataSet);
begin

  try

    if Fr_Brady.SalesRep then
    begin

      if Fr_Brady.TSIS_USUNOM.ToUpper.Trim.Equals(DataSet.FieldByName('TSOP_ORDBILREPNOM').AsString.ToUpper.Trim) then
        DataSet.FieldByName('TSOP_ORDBILTYP').AsString := 'Acc Owner'
      else
      if Fr_Brady.TSIS_USUNOM.ToUpper.Trim.Equals(DataSet.FieldByName('TSOP_REPNOMINT').AsString.ToUpper.Trim) then
        DataSet.FieldByName('TSOP_ORDBILTYP').AsString := 'Region Owner'
      else
      if Fr_Brady.TSIS_USUNOM.ToUpper.Trim.Equals(DataSet.FieldByName('TSOP_REPMKT').AsString.ToUpper.Trim) then
        DataSet.FieldByName('TSOP_ORDBILTYP').AsString := 'Market Mng'
      else
        DataSet.FieldByName('TSOP_ORDBILTYP').AsString := 'N/A';

    end
    else
    begin

      DataSet.FieldByName('TSOP_ORDBILTYP').AsString := 'N/A';

    end;

  except
  end;

end;

procedure TFr_RelatorioFaturamentoPedidos.FDQueryVSOP_OrderBilling11CalcFields(DataSet: TDataSet);
const
  cArrayOfMonth: array[1..12] of String = ('Agosto','Setembro','Outubro','Novembro','Dezembro','Janeiro','Fevereiro','Mar�o','Abril','Maio','Junho','Julho');
begin

  try
    FDQueryVSOP_OrderBilling11TSOP_ORDBILMONDOCSTR.AsString := Format( '%.*d', [2,FDQueryVSOP_OrderBilling11TSOP_ORDBILMONDOC.AsInteger] ) + ' - ' + cArrayOfMonth[FDQueryVSOP_OrderBilling11TSOP_ORDBILMONDOC.AsInteger];
  except
  end;

  FDQueryVSOP_OrderBillingCalcFields(DataSet);

end;

procedure TFr_RelatorioFaturamentoPedidos.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  FDQueryVSOP_OrderBilling00.Close;
  FDQueryVSOP_OrderBilling01.Close;
  FDQueryVSOP_OrderBilling02.Close;
  FDQueryVSOP_OrderBilling03.Close;
  FDQueryVSOP_OrderBilling04.Close;
  FDQueryVSOP_OrderBilling05.Close;
  FDQueryVSOP_OrderBilling06.Close;
  FDQueryVSOP_OrderBilling07.Close;
  FDQueryVSOP_OrderBilling08.Close;
  FDQueryVSOP_OrderBilling09.Close;
  FDQueryVSOP_OrderBilling10.Close;
  FDQueryVSOP_OrderBilling11.Close;
  FDConnection.Close;

  Fr_RelatorioFaturamentoPedidos := nil;
  Action := caFree;

end;

procedure TFr_RelatorioFaturamentoPedidos.FormContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
begin

  if cxPageControl.ActivePage = cxTabSheetGrid then
    Fr_Brady.PopupGridTools( cxGridFaturamentoPedidos.ActiveView )
  else
  if cxPageControlPivot.ActivePage = cxTabSheetPivot00 then
    Fr_Brady.PopupPivotTools( cxDBPivotGrid00 )
  else
  if cxPageControlPivot.ActivePage = cxTabSheetPivot01 then
    Fr_Brady.PopupPivotTools( cxDBPivotGrid01 )
  else
  if cxPageControlPivot.ActivePage = cxTabSheetPivot02 then
    Fr_Brady.PopupPivotTools( cxDBPivotGrid02 )
  else
  if cxPageControlPivot.ActivePage = cxTabSheetPivot03 then
    Fr_Brady.PopupPivotTools( cxDBPivotGrid03 )
  else
  if cxPageControlPivot.ActivePage = cxTabSheetPivot04 then
    Fr_Brady.PopupPivotTools( cxDBPivotGrid04 )
  else
  if cxPageControlPivot.ActivePage = cxTabSheetPivot05 then
    Fr_Brady.PopupPivotTools( cxDBPivotGrid05 )
  else
  if cxPageControlPivot.ActivePage = cxTabSheetPivot06 then
    Fr_Brady.PopupPivotTools( cxDBPivotGrid06 )
  else
  if cxPageControlPivot.ActivePage = cxTabSheetPivot07 then
    Fr_Brady.PopupPivotTools( cxDBPivotGrid07 )
  else
  if cxPageControlPivot.ActivePage = cxTabSheetPivot08 then
    Fr_Brady.PopupPivotTools( cxDBPivotGrid08 )
  else
  if cxPageControlPivot.ActivePage = cxTabSheetPivot09 then
    Fr_Brady.PopupPivotTools( cxDBPivotGrid09 )
  else
  if cxPageControlPivot.ActivePage = cxTabSheetPivot10 then
    Fr_Brady.PopupPivotTools( cxDBPivotGrid10 )
  else
  if cxPageControlPivot.ActivePage = cxTabSheetPivot11 then
    Fr_Brady.PopupPivotTools( cxDBPivotGrid11 );

end;

procedure TFr_RelatorioFaturamentoPedidos.FormCreate(Sender: TObject);
begin

  LoadGridCustomization;

  cxDateEditTSOP_ORDBILDATDOCINI.Date := System.DateUtils.StartOfAYear(1900);
  cxDateEditTSOP_ORDBILDATDOCFIM.Date := System.DateUtils.EndOfAYear(9999);

  cxDateEditTSOP_ORDBILDATDOCREQINI.Date := System.DateUtils.StartOfTheMonth(Now);
  cxDateEditTSOP_ORDBILDATDOCREQFIM.Date := System.DateUtils.EndOfTheMonth(Now);

  cxCheckComboBoxTSOP_ORDBILTIPDOC.States[0] := cbsChecked;
  cxCheckComboBoxTSOP_ORDBILTIPDOC.States[1] := cbsChecked;
  cxCheckComboBoxTSOP_ORDBILTIPDOC.States[2] := cbsChecked;

  cxPageControl.ActivePage := cxTabSheetGrid;

end;

procedure TFr_RelatorioFaturamentoPedidos.LoadGridCustomization;
begin

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxTableViewFaturamentoPedidos00.Name + '.ini' ) then
    cxTableViewFaturamentoPedidos00.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxTableViewFaturamentoPedidos00.Name + '.ini' );

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxTableViewFaturamentoPedidos01.Name + '.ini' ) then
    cxTableViewFaturamentoPedidos01.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxTableViewFaturamentoPedidos01.Name + '.ini' );

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxTableViewFaturamentoPedidos02.Name + '.ini' ) then
    cxTableViewFaturamentoPedidos02.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxTableViewFaturamentoPedidos02.Name + '.ini' );

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxTableViewFaturamentoPedidos03.Name + '.ini' ) then
    cxTableViewFaturamentoPedidos03.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxTableViewFaturamentoPedidos03.Name + '.ini' );

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxTableViewFaturamentoPedidos04.Name + '.ini' ) then
    cxTableViewFaturamentoPedidos04.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxTableViewFaturamentoPedidos04.Name + '.ini' );

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxTableViewFaturamentoPedidos05.Name + '.ini' ) then
    cxTableViewFaturamentoPedidos05.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxTableViewFaturamentoPedidos05.Name + '.ini' );

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxTableViewFaturamentoPedidos06.Name + '.ini' ) then
    cxTableViewFaturamentoPedidos06.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxTableViewFaturamentoPedidos06.Name + '.ini' );

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxTableViewFaturamentoPedidos07.Name + '.ini' ) then
    cxTableViewFaturamentoPedidos07.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxTableViewFaturamentoPedidos07.Name + '.ini' );

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxTableViewFaturamentoPedidos08.Name + '.ini' ) then
    cxTableViewFaturamentoPedidos08.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxTableViewFaturamentoPedidos08.Name + '.ini' );

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxTableViewFaturamentoPedidos09.Name + '.ini' ) then
    cxTableViewFaturamentoPedidos09.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxTableViewFaturamentoPedidos09.Name + '.ini' );

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxTableViewFaturamentoPedidos10.Name + '.ini' ) then
    cxTableViewFaturamentoPedidos10.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxTableViewFaturamentoPedidos10.Name + '.ini' );

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxTableViewFaturamentoPedidos11.Name + '.ini' ) then
    cxTableViewFaturamentoPedidos11.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxTableViewFaturamentoPedidos11.Name + '.ini' );

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxDBPivotGrid00.Name + '.ini' ) then
    cxDBPivotGrid00.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxDBPivotGrid00.Name + '.ini' );

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxDBPivotGrid01.Name + '.ini' ) then
    cxDBPivotGrid01.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxDBPivotGrid01.Name + '.ini' );

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxDBPivotGrid02.Name + '.ini' ) then
    cxDBPivotGrid02.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxDBPivotGrid02.Name + '.ini' );

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxDBPivotGrid03.Name + '.ini' ) then
    cxDBPivotGrid03.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxDBPivotGrid03.Name + '.ini' );

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxDBPivotGrid04.Name + '.ini' ) then
    cxDBPivotGrid04.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxDBPivotGrid04.Name + '.ini' );

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxDBPivotGrid05.Name + '.ini' ) then
    cxDBPivotGrid05.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxDBPivotGrid05.Name + '.ini' );

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxDBPivotGrid06.Name + '.ini' ) then
    cxDBPivotGrid06.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxDBPivotGrid06.Name + '.ini' );

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxDBPivotGrid07.Name + '.ini' ) then
    cxDBPivotGrid07.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxDBPivotGrid07.Name + '.ini' );

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxDBPivotGrid08.Name + '.ini' ) then
    cxDBPivotGrid08.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxDBPivotGrid08.Name + '.ini' );

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxDBPivotGrid09.Name + '.ini' ) then
    cxDBPivotGrid09.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxDBPivotGrid09.Name + '.ini' );

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxDBPivotGrid10.Name + '.ini' ) then
    cxDBPivotGrid10.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxDBPivotGrid10.Name + '.ini' );

  if System.IOUtils.TFile.Exists( MyDocumentsPath + '\' + Name + '_' + cxDBPivotGrid11.Name + '.ini' ) then
    cxDBPivotGrid11.RestoreFromIniFile( MyDocumentsPath + '\' + Name + '_' + cxDBPivotGrid11.Name + '.ini' );

end;

procedure TFr_RelatorioFaturamentoPedidos.Mensagem(pMensagem: String);
begin

  cxLabelMensagem.Caption := pMensagem;
  PanelSQLSplashScreen.Visible := not pMensagem.IsEmpty;
  Update;
  Application.ProcessMessages;

end;

end.