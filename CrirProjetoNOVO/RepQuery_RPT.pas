unit RepQuery_Rpt ;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, Db, DBTables, jpeg, QRExport;

type
  TRepQuery = class(TForm)
    QuickRep: TQuickRep;
    Titulo: TQRBand;
    QRLabTitulo: TQRLabel;
    QRep: TQuery;
    Band_Fields: TQRSubDetail;
    Band_Total: TQRBand;
    QRLabEmp: TQRLabel;
    QRBandFooter: TQRBand;
    QRMemoFimLab: TQRMemo;
    QRMemoFimEdi: TQRMemo;
    qrlTot: TQRLabel;
    QRImage1: TQRImage;
    QRTextFilter1: TQRTextFilter;
    QRSysPage: TQRSysData;
    QRFolha: TQRLabel;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape1: TQRShape;
    QRMemoLab: TQRMemo;
    QRMemoEdi: TQRMemo;
    QRShape2: TQRShape;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure qrlTotPrint(sender: TObject; var Value: String);
    procedure QRLabEmpPrint(sender: TObject; var Value: String);
    procedure Band_FieldsAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
//    Function IsCondensed ( Fmt : String ) : Boolean ;
  public
    { Public declarations }
    nNumFields : Integer ;
    aCapFields : Array Of String ;
    aFmtFields : Array Of String ;
(*
                 1 = Field com formato currency (1 = Sim)
               2,3 = Tamanho do campo (00 = tamanho original)
                 4 = Totalizar no final
                 5 = Alinhamento: L, R, C
                 6 = Condensado: (C=Sim)
*)
  end;

Function OpenReport ( Titulo : String ; aTitles : Array of String ;
                      aFormats : Array of String ; Sql : String ) : Boolean ; Export ;

var
  RepQuery: TRepQuery;

implementation

{$R *.DFM}

Uses
   StrFun, Printers, Global, SqlTableFun ;

Var
   aLenLbl : Array Of Integer ;

(*
Function TRepQuery.IsCondensed ( Fmt : String ) : Boolean ;
Begin
   Result := False ;
   If ( Length(Fmt) >= 6 ) Then
      If ( Fmt[6] = 'C' ) Then
         Result := True ;
End ;
*)

Function OpenReport ( Titulo : String ; aTitles : Array of String ; aFormats : Array of String ; Sql : String ) : Boolean ;
Var
   i : Integer ;
Begin

   Result := False ;

   Try

      Screen.Cursor := crHourGlass ;

      RepQuery := TRepQuery.Create(Application);

      RepQuery.QRLabTitulo.Caption := Titulo ;
      RepQuery.QRLabEmp.Caption := GFilial ;

      RepQuery.nNumFields := Length(aTitles) ;
      SetLength(RepQuery.aCapFields,RepQuery.nNumFields) ;
      SetLength(RepQuery.aFmtFields,RepQuery.nNumFields) ;

      For i:=0 To RepQuery.nNumFields-1 Do
      Begin
         RepQuery.aCapFields[i] := aTitles[i] ;
         RepQuery.aFmtFields[i] := aFormats[i] ;
      End ;

      RepQuery.QRep.Close ;
      RepQuery.QRep.Sql.Clear ;
      RepQuery.QRep.Sql.Add(Sql) ;
      Try
         RepQuery.QRep.Open ;
      Except
         On E:Exception Do
         Begin
            Exit ;
         End ;
      End;

      Screen.Cursor := crDefault ;

      RepQuery.QuickRep.Preview ;
      RepQuery.Close ;
      RepQuery.Release ;

   Finally

      Screen.Cursor := crDefault ;
      RepQuery.Release;

   End;

End ;

procedure TRepQuery.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
Var
   i : Integer ;
   Lab : TQRLabel ;
   Tot : TQRExpr ;
   nLeft, nWidth, nTotWidth : Integer ;
   Edi : TQRDBText ;
   w : Integer ;
   Aux : String ;
begin

   If ( QRMemoLab.Lines.Count = 0 ) Then
      QRMemoLab.Height := 5
   Else
      QRMemoLab.Height := QRMemoLab.Lines.Count * 17 ;
   If ( QRMemoEdi.Lines.Count = 0 ) Then
      QRMemoEdi.Height := 5
   Else
      QRMemoEdi.Height := QRMemoEdi.Lines.Count * 17 ;
   If ( QRMemoFimLab.Lines.Count = 0 ) Then
   Begin
      QRMemoFimLab.Height := 5 ;
      QRMemoFimEdi.Height := 5 ;
      Band_Total.Height := 32 ;
      QRMemoFimLab.Visible := False ;
      QRMemoFimEdi.Visible := False ;
   End
   Else Begin
      QRMemoFimLab.Height := QRMemoFimLab.Lines.Count * 17 ;
      QRMemoFimEdi.Height := QRMemoFimEdi.Lines.Count * 17 ;
      Band_Total.Height := QRMemoFimLab.Height + 17 ;
      QRMemoFimLab.Visible := True ;
      QRMemoFimEdi.Visible := True ;
   End ;

   SetLength(aLenLbl,QRep.FieldCount) ;

   nLeft := 0 ;
   nTotWidth := 0 ;
   For i:=0 To QRep.FieldCount-1 Do
   Begin
      w := Str_StrToInt(Copy(aFmtFields[i],2,2)) ;
      If ( w = 0 ) Then
      Begin
         If ( QRep.Fields[i].DataSize > Length(aCapFields[i]) ) Then
            nWidth := (QRep.Fields[i].DataSize * 8) + 2
         Else
            nWidth := (Length(aCapFields[i]) * 8) + 2 ;
      End
      Else Begin
         nWidth := (w * 8) + 2 ;
      End ;
      aLenLbl[i] := nWidth ;
      nTotWidth := nTotWidth + nWidth ;
      nLeft := nLeft + nWidth + 7 ;
   End ;
   nLeft := nLeft - 7 ;
   nLeft := Trunc( (Titulo.Width - nLeft) / 2 ) ;

   If ( nTotWidth > 570 ) Then
      QuickRep.Page.Orientation := poLandscape ;

   If ( nTotWidth > 570 ) Then
   begin
    QRShape2.Left := -1 ;
    QRShape1.Left := -1 ;
    QRShape2.Width :=  1085 ;
    QRShape1.Width :=  1085 ;
   end
   else
   begin
    QRShape2.Left := -1 ;
    QRShape1.Left := -1 ;
    QRShape2.Width := 756;
    QRShape1.Width := 756;
   end ;


   For i:=0 To QRep.FieldCount-1 Do
   Begin

      Lab := TQRLabel.Create(Self) ;
      Lab.Parent := Titulo ;
      Lab.AutoSize := False ;
      Lab.Caption := aCapFields[i] ;
      Lab.Left := nLeft ;
      Lab.Transparent  := true ;
      Lab.Top  := 108 ;
      Lab.Height := 17 ;
      Lab.Width := aLenLbl[i] ;
      nLeft := nLeft + Lab.Width + 24;
      Lab.Alignment := taLeftJustify ;
      Lab.Font.Style := [fsBold] ;
//    Lab.Color := clSilver ;
(*
      Lab.Frame.DrawBottom := True ;
      Lab.Frame.DrawLeft   := True ;
      Lab.Frame.DrawRight  := True ;
      Lab.Frame.DrawTop    := True ;
*)

      Edi := TQRDBText.Create(Self) ;
      Edi.Parent := Band_Fields ;
      Edi.DataSet := QRep ;
      Edi.DataField := QRep.Fields[i].FieldName ;
      Edi.Transparent  := true ;
      Edi.Height := 17 ;
      Edi.Width  := Lab.Width - 1 ;
      Edi.Left   := Lab.Left + 1 ;
      Edi.Top    := 4 ;
      Aux := Copy(aFmtFields[i],5,1) ;
      If ( Aux = 'C' ) Then
         Edi.Alignment := taCenter
      Else If ( Aux = 'R' ) Then
         Edi.Alignment := taRightJustify
      Else
         Edi.Alignment := taLeftJustify ;
      If ( QRep.Fields[i].DataType = ftFloat ) Then
      Begin
         Edi.Alignment := taRightJustify ;
         If ( Copy(aFmtFields[i],1,1) = '1' ) Then
            Edi.Mask := '###,###,##0.00' ;
      End ;

      Aux := Copy(aFmtFields[i],4,1) ;
      {If ( Aux = 'S' ) Then     // Totalizar
      Begin
         Tot := TQRExpr.Create(Self) ;
         Tot.Parent := Band_Total ;
         Tot.Master := Band_Fields ;
         Tot.AutoSize := False ;
         Tot.Font.Style := [fsBold,fsItalic] ;
         Tot.Expression :='SUM(QRep.' + QRep.Fields[i].FieldName + ')' ;
         Tot.Mask := '#,###,###,##0.00' ;
         Tot.Alignment := taRightJustify ;
         Tot.Width  := Edi.Width + 20 ;
         Tot.Height := 17 ;
         Tot.Left   := Edi.Left - 20 ;
         Tot.Top    := 12 ;
         Tot.Frame.DrawTop := True ;
      End ;}

   End ;

end;

procedure TRepQuery.qrlTotPrint(sender: TObject; var Value: String);
begin
  if Value = 'qrlTot' then Value := '';
end;

procedure TRepQuery.QRLabEmpPrint(sender: TObject; var Value: String);
begin
   value := '' ;
end;

procedure TRepQuery.Band_FieldsAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  if Band_Fields.color = clWhite then
     Band_Fields.color := clSilver
  else
     Band_Fields.color := clWhite;
end;

end.

