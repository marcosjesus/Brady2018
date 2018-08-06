Unit StrFun ;

interface

Uses
     SysUtils, Windows, Math ;

type
     PFuCurrency = ^TFuCurrency;
     TFuCurrency = record
                      sDateSeparator      : Char;
                      sTimeSeparator      : Char;
                      sThousandSeparator  : Char;
                      sDecimalSeparator   : Char;
                      CurrencyDecimals    : Byte;
                      sShortDateFormat    : String[15];
                      sShortTimeFormat    : String[15];
                      sCurrencyString     : String[7];
                      sLongDateFormat     : String[10] ;
                   end;

(******************************* Ajustes de Strings **************************)
(*****************************************************************************)
function Str_RightAlignCh( S: String; n : Integer; Ch: Char ): String ; Export;
function Str_LeftAlignCh( S: String; n : Integer; Ch: Char ): String ; Export;
function Str_LTrim( S: String ): String; Export;
function Str_RTrim( S: String ): String; Export;
function Str_LRTrim( S: String ): String; Export;
function Str_NoMoneySeparator( S: String ): String; Export;
function Str_NoDateSeparator( S: String ): String; Export;
function Str_NoSymbols( S: String ): String; Export;
function Str_NoSymbolBlanks( S: String ): String; Export;
function Str_NoSetChar( S: String ; Arr: array of Char ): String; Export;
function Str_NoChar( S: String ; Ch: Char ): String ; Export;
function Str_OnlyNumbers( S: String ): String; Export;
function Str_AscToBCD ( S: String ): String; Export;
procedure Str_ScanBlanks(const S: string; var Pos: Integer); Export;
function Str_ScanNumber(const S: string; var Pos: Integer; var Number: Word): Boolean; Export;
function Str_ScanString(const S: string; var Pos: Integer; const Symbol: string): Boolean; Export;
function Str_ScanChar(const S: string; var Pos: Integer; Ch: Char): Boolean; Export;
function Str_Clip(S: string; I: smallint): string; Export ;
Function Str_ChangeDecPoint ( Value : String ; OldDec, NewDec : String ) : String ; Export ;
Function Str_GetToken ( Const S : String ; Const Sep : String ; Ocorr : Integer = 1 ) : String ; Export ;
Function Str_GetPosStrInStr ( Const S : String ; Const Sep : String ; Ocorr : Integer ) : Integer ; Export ;
Function Str_GetNumOccur ( Const S : String ; Const Search : String ) : Integer ; Export ;
(*****************************************************************************)
(*****************************************************************************)

(**************************** Conversões de Strings **************************)
(*****************************************************************************)
function Str_Error: Boolean; Export;
procedure Str_SetFmtChar( AuxFuFmt: TFuCurrency ); Export;
function Str_GetFmtChar: TFuCurrency ; Export;
function Str_StrToInt( S: String ): LongInt; Export;
function Str_IntToStr( I: LongInt ): String ; Export;
function Str_StrToFloat( S: String ): Double ; Export;
function Str_FloatToStr( V: Double ; Dec : Integer = 2 ): String ; Export;
Function Str_FloatToDBStr( V: Double ; Dec : Integer = 2 ) : String ; Export;
function Str_FloatToMoney( V: Double ; Dec : Integer = 2 ): String ; Export;
function Str_FloatToStrDP( V: Double; CasasDecimais: Byte ): String ; Export;
Function Str_StrFloat2Dec ( S : String ) : String ; Export ;
function Str_StrToDate( Dta: String ): Real; Export;
function Str_DateToStr( Dta: Real ): String; Export;
function Str_DateToStrDDMMAA( Dta: Real ): String; Export;
function Str_StrToTime( Hr: String ): Real; Export;
function Str_TimeToStr( Hr: Real ): String; Export;
function Str_MoneyToFloat( S: String ; Dec : Integer = 2 ): Double ; Export;
function Str_AddrToLongInt( Segment, OffSet: Word ): LongInt; Export;
function str_DataExtenso(Data : TDateTime; Parte : String) : String;
(*****************************************************************************)
(*****************************************************************************)

(************************* Formatação de Strings *****************************)
(*****************************************************************************)
function Str_StrToMoney( S: String ; Dec : Integer = 2 ): String; Export;
function Str_FormatDate( Data: Real; Formato: String ): String; Export;
function Str_FormatTime( Time: Real; Formato: String ): String; Export;
function Str_FormatStrDate( Data, DoFmt, ParaFmt: String ): String; Export;
function Str_FormatStrTime( Time, DoFmt, ParaFmt: String ): String; Export;
Function Str_ChangeFormatDate ( Data, NewFormat : String ) : String ; Export ;
Function Str_DDMMAA_To_MMDDAA ( Data : String ) : String ; Overload ; Export ;
Function Str_DDMMAA_To_MMDDAA ( Data : TDateTime ) : String ; Overload ; Export ;
function Str_ValidDirName( S : String ) : String ; Export;
Function Str_Space ( Len : Integer ) : String ; Export ;
function Str_Pad(S: string; I: smallint): string; Export ;
function Str_CPad(S: string; I: smallint): string; Export ;
function Str_CPadR(S: string; I: smallint): string; Export ;
Function Str_Zero ( N : Integer ; L : Integer ) : String ; Export ; overload ;
Function Str_Zero ( N : string ; L : Integer ) : String ; Export ; overload ;
function Str_PadZ(S: string; I: smallint): string; Export ;
function Str_ReplaceAll( Old, New, S : String; caseSen : boolean ) : string; Export ;
Function Str_Replace ( S, Old, New : String ) : String ; Export ;
function Str_CasePos(Sub, S : string): smallint; Export ;
function Str_PosFromPos(Sub, S : string; Index : smallint): smallint; Export ;
function Str_CasePosFromPos(Sub, S : string; Index : smallint): smallint; Export ;
function Str_MakeUniqueString: String; Export ;
(*****************************************************************************)
(*****************************************************************************)

(******************** Alinhamento em Pixel's *********************************)
(*****************************************************************************)
Function Str_LenByFont( S : String ): LongInt ; Export;
Function Str_ValRightAlignByCarac( S : String; Carac : Word ) : String; Overload ; Export;
Function Str_ValRightAlignByCarac( V : Double ;  Carac : Word ) : String; Overload ; Export;
function Str_StrLeftAlignByCarac( S : String; Carac : Word ) : String; Export;
function Str_StrRightAlignByCarac( S : String; Carac : Word ) : String; Export ;
Function Str_ValRightAlignByPixels( S : String ; LenAlign : Word ) : String ; Export;
Function Str_CenterAlign( S : String ; Carac : Word; CToAlin : Char ) : String ; Export;
Function Str_RValMinus( S : String; Carac : Word ) : String; Export;
Procedure Str_SetObjHandle( Hnd : Word ) ; Export;
Function Str_GetObjHandle: Word ; Export;
(*****************************************************************************)
(*****************************************************************************)

implementation

Uses
     WinProcs, NumFun ;


const
     MONEY_SET             = [ 'R', 'r', '$', ',', '.', '+', '-', ' ' ] ;
     MONEY_SET_MINUS       = [ 'R', 'r', '$', ',', '.', '+', ' ' ] ;
     DATETIME_SET          = [ '/', '-', ' ', ':' ] ;
     SYMBOLS_SET           = [ '/', '\', '.', ',', '-', '+', '''' ] ;
     SYMBOLS_SET_WITH_BLK  = [ '/', '\', '.', ',', '-', '+', '''', ' ' ] ;
     SYMBOLS_DIR_SET       = [ '/', '.', '>', '<', '"', '?', '*', ':', ' ' ] ;

var
     StrError      : Boolean;
     globObjHandle : Word ;
     FuFmt         : TFuCurrency;


function Str_Error: Boolean;
begin
  Result := StrError;
end;

function Str_LTrim( S: String ): String;
var
    Size : Byte;
    i    : Integer;
begin
  StrError := False;
  i := 1;
  Size := Length ( S );
  if (size <= 0) then begin
      result := '';
      exit;
  end;
  while ( i <= Size ) and ( S[i] = #32 ) do
     Inc( i );
  Result := Copy( S, i, Size )
end;

function Str_RTrim( S: String ): String;
var
    Size: Byte;
begin
  StrError := False;
  Size := Length ( S );
  if (size <= 0) then begin
      result := '';
      exit;
  end;
  while ( S[Size] = #32 ) do
  Begin
      Dec( Size );
      If ( Size = 0 ) Then
         Break ;
  End ;
  Result := Copy ( S, 1, Size );
end;

function Str_LRTrim( S: String ): String;
begin
  StrError := False;
  Result := Str_LTrim( Str_RTrim( S ) );
end;

function Str_RightAlignCh ( S : String; n : Integer; Ch: Char ) : String ;
var
	i, tam : integer ;
begin
  StrError := False;
  tam := Length(s) ;
  if (tam > n) then
     n := tam;
  Result := '' ;
  For i:=1 To n Do Result := Result + Ch ;
//  FillChar ( Result [1], n, Ch );
//  SetLength(Result,n) ;  (* Result[0] := char ( n ); *)
  for i:=1 to tam do
      begin
        if ( s[i] <> ' ' ) then Result[i+n-tam] := s[i] ;
      end;
end ;

function Str_LeftAlignCh ( S : String; n : Integer; Ch: Char ) : String ;
var i,tam: Integer;
begin
  StrError := False;
  tam := Length(s) ;
  if (tam > n) then
     n := tam;
  FillChar ( Result[1], n, Ch );
  SetLength(Result,n) ;  (* Result[0] := char ( n ); *)
  for i := 1 to tam do
      begin
        if ( s[i] <> ' ' ) then  Result[i] := s[i];
      end;
end;

function Str_NoMoneySeparator( S: String ): String;
var
  i : Integer;
begin
  StrError := False;
  Result := '';
  for i := 1 to Length( S ) do
     begin
       if ( not( S[i] in MONEY_SET ) ) then
          Result := Result + S[i];
     end;
end;

function Str_NoDateSeparator( S: String ): String;
var
  i : Integer;
begin
  StrError := False;
  Result := '';
  for i := 1 to Length( S ) do
     begin
       if ( not( S[i] in DATETIME_SET ) ) then
          Result := Result + S[i];
     end;
end;

function Str_NoSymbols( S: String ) : String;
var
  i : Integer;
begin
  StrError := False;
  Result := '';
  for i := 1 to Length( S ) do
     begin
       if ( not( S[i] in SYMBOLS_SET ) ) then
          Result := Result + S[i];
     end;
end;

function Str_NoSymbolBlanks( S: String ): String;
var
  i : Integer;
begin
  StrError := False;
  Result := '';
  for i := 1 to Length( S ) do
     begin
       if ( not( S[i] in SYMBOLS_SET_WITH_BLK ) ) then
          Result := Result + S[i];
     end;
end;

function Str_NoSetChar( S: String ; Arr: array of Char ): String;
var
  Achei        : Boolean;
  i, j         : Integer;
begin
  StrError := False;
  Result := '';
  for i := 1 to Length( S ) do
     begin
       Achei := false;
       for j := 0 to High( Arr ) do
          if ( S[i] = Arr[j] ) then
             begin
               Achei := true;
               Break;
             end;

       if ( not Achei ) then
          Result := Result + S[i];
     end;
end;

Function Str_NoChar( S : String ; Ch : Char ) : String ;
var
  i : Integer;
begin
  StrError := False;
  Result := '';
  for i := 1 to Length( S ) do
     begin
       if ( S[i] <> Ch ) then
          Result := Result + S[i];
     end;
End ;

function Str_OnlyNumbers( S: String ): String;
var
  i : Integer;
begin
  StrError := False;
  Result := '';
  for i := 1 to Length( S ) do
     begin
       if ( S[i] in ['0'..'9'] ) then
          Result := Result + S[i];
     end;
end;

Function Str_ChangeDecPoint ( Value : String ; OldDec, NewDec : String ) : String ;
Var
   p : Integer ;
Begin
   p := Pos(OldDec,Value) ;
   If ( p = 0 ) Then
   Begin
       Result := Value ;
       Exit ;
   End ;
   Result := Copy(Value,1,p-1) + NewDec + Copy(Value,p+1,Length(Value)) ;
End ;

function Str_AscToBCD( s: String ): String;
var
     i: Integer;
     Ch: Char;
     s1 : String ;
begin
  StrError := False;
  s1 := s ;
  if ( Length( s1 ) > 0 ) then
      begin
        for i := 1 to Length ( s1 ) do
            begin
              Ch := s1[i];
              case Ch of
                 'Ç'      : s1[i] := 'C';

                 'ç'      : s1[i] := 'c';

                 'Á','À',
                 'Ã','Ä'  : s1[i] := 'A';

                 'á','à',
                 'ã','ä'  : s1[i] := 'a';

                 'É',
                 'È','Ë'  : s1[i] := 'E';

                 'é',
                 'è','ë'  : s1[i] := 'e';

                 'Í',
                 'Ì','Ï'  : s1[i] := 'I';

                 'í',
                 'ì','ï' : s1[i] := 'i';

                 'Ó','Ò',
                 'Õ','Ö' : s1[i] := 'O';

                 'ó','ò',
                 'õ','ö' : s1[i] := 'o';

                 'Ú',
                 'Ù','Ü' : s1[i] := 'U';

                 'ú',
                 'ù','ü' : s1[i] := 'u';
              end;
            end;
      end;
  Result := s1;
end;

procedure Str_SetFmtChar( AuxFuFmt: TFuCurrency );
Begin
  StrError := False;
  FuFmt := AuxFuFmt;
End ;

function Str_GetFmtChar: TFuCurrency ;
Begin
  StrError := False;
  Result := FuFmt;
End ;

function Str_StrToInt( S: String ) : LongInt;
var
    s1: String;
begin
  ThousandSeparator := FuFmt.sThousandSeparator;
  DecimalSeparator := FuFmt.sDecimalSeparator;
  StrError := false;
  s1 := Str_LRTrim ( S );
  if ( s1 <> '' ) then
     begin
       try
         StrError := False ;
         Result := StrToInt(s1) ;
       except
         StrError := true;
         Result := 0 ;
       end ;
     end
  else begin
//     StrError := True ;
     Result := 0;
  End ;
end ;

function Str_IntToStr( I: LongInt ) : String ;
begin
  ThousandSeparator := FuFmt.sThousandSeparator;
  DecimalSeparator := FuFmt.sDecimalSeparator;
  StrError := false;
  try
    StrError := False ;
    Result := IntToStr(I) ;
  except
    StrError := true;
    Result := '0' ;
  end ;
end ;

function Str_StrToFloat( S: String ) : double ;
var
    Valor: String;
begin
  ThousandSeparator := FuFmt.sThousandSeparator;
  DecimalSeparator := FuFmt.sDecimalSeparator;
  StrError := false;
  Valor := Str_LRTrim ( S );
  if ( Valor <> '' ) then
     begin
       try
         StrError := False ;
         Result := StrToFloat( Valor );
       except
         StrError := true;
         Result := 0;
       end ;
     end
  else
     Result := 0;
end ;

function Str_FloatToStr( V: Double ; Dec : Integer = 2 ) : String ;
begin
  StrError := False;
  Result := Str_FloatToStrDP( V, Dec );
end;

Function Str_FloatToDBStr( V: Double ; Dec : Integer = 2 ) : String ;
Var
  ts, ds : Char ;
begin
  ts := FuFmt.sThousandSeparator ;
  ds := FuFmt.sDecimalSeparator ;
  FuFmt.sThousandSeparator := ',' ;
  FuFmt.sDecimalSeparator  := '.' ;
  StrError := False;
  Result := Str_FloatToStrDP( V, Dec );
  FuFmt.sThousandSeparator := ts ;
  FuFmt.sDecimalSeparator  := ds ;
end;

function Str_FloatToMoney( V: Double ; Dec : Integer = 2 ): String ;
Var
   fmt : String ;
Begin
  ThousandSeparator := FuFmt.sThousandSeparator;
  DecimalSeparator := FuFmt.sDecimalSeparator;
  StrError := false;
  CurrencyString := '';
  CurrencyFormat := 0;
  NegCurrFormat  := 2;
  fmt := '%.' + Str_IntToStr(Dec) + 'm' ;
  FmtStr ( Result,fmt,[V] );
  If ( Copy(Result,Length(Result),1) = '-' ) Then
     Result := '-' + Copy(Result,1,Length(Result)-1) ;
End ;

function Str_FloatToStrDP( V: Double; CasasDecimais: Byte ) : String ;
begin
  StrError := False;
  ThousandSeparator := FuFmt.sThousandSeparator;
  DecimalSeparator  := FuFmt.sDecimalSeparator;
  FmtStr( Result,'%.' + Str_IntToStr( CasasDecimais ) + 'f',[V] );
end;

Function Str_StrFloat2Dec ( S : String ) : String ;
Var
   dS : Double ;
Begin
   S := Str_NoMoneySeparator(s) ;
   dS := Str_StrToFloat(S) / 100.0 ;
   Result := Str_FloatToStr(dS) ;
End ;

function Str_StrToDate( Dta: String ): Real;
var
    s1: String;
begin
  DateSeparator := FuFmt.sDateSeparator;
  TimeSeparator := FuFmt.sTimeSeparator;
  ThousandSeparator := FuFmt.sThousandSeparator;
  DecimalSeparator := FuFmt.sDecimalSeparator;
  ShortDateFormat := FuFmt.sShortDateFormat;
  LongDateFormat := FuFmt.sLongDateFormat ;
  ShortTimeFormat := FuFmt.sShortTimeFormat;
  StrError := false;
  s1 := Str_LRTrim ( Dta );
  if ( s1 <> '' ) then
     begin
       try
         StrError := False ;
         Result := StrToDate ( s1 );
       except
         StrError := true;
         Result := 0;
       end;
     end
  else
     Result := 0;
end;

function Str_DateToStr( Dta: Real ): String;
begin
  DateSeparator := FuFmt.sDateSeparator;
  TimeSeparator := FuFmt.sTimeSeparator;
  ThousandSeparator := FuFmt.sThousandSeparator;
  DecimalSeparator := FuFmt.sDecimalSeparator;
  ShortDateFormat := FuFmt.sShortDateFormat;
  ShortTimeFormat := FuFmt.sShortTimeFormat;
  StrError := false;
  try
    StrError := False ;
    Result := DateToStr ( Dta );
  except
    StrError := true;
    Result := '  ' + DateSeparator + '  ' + DateSeparator + '  ';
  end;
end;

function Str_DateToStrDDMMAA( Dta: Real ): String;
Begin
   Result := Str_DDMMAA_To_MMDDAA( Str_DateToStr(Dta) ) ;
End ;

function Str_StrToTime( Hr: String ): Real;
var
    s1: String;
begin
  DateSeparator := FuFmt.sDateSeparator;
  TimeSeparator := FuFmt.sTimeSeparator;
  ThousandSeparator := FuFmt.sThousandSeparator;
  DecimalSeparator := FuFmt.sDecimalSeparator;
  ShortDateFormat := FuFmt.sShortDateFormat;
  ShortTimeFormat := FuFmt.sShortTimeFormat;
  StrError := false;
  s1 := Str_LRTrim ( Hr );
  if ( s1 <> '' ) then
     begin
       try
         StrError := False ;
         Result := StrToTime ( s1 );
       except
         StrError := true;
         Result := 0;
       end;
     end
  else
     Result := 0;
end;

function Str_TimeToStr( Hr: Real ): String;
begin
  DateSeparator := FuFmt.sDateSeparator;
  TimeSeparator := FuFmt.sTimeSeparator;
  ThousandSeparator := FuFmt.sThousandSeparator;
  DecimalSeparator := FuFmt.sDecimalSeparator;
  ShortDateFormat := FuFmt.sShortDateFormat;
  ShortTimeFormat := FuFmt.sShortTimeFormat;
  StrError := false;
  try
    StrError := False ;
    Result := TimeToStr ( Hr );
  except
    StrError := true;
    Result := '00' + TimeSeparator + '00' + TimeSeparator + '00';
  end;
end;

Function Str_MoneyToFloat( S : String ; Dec : Integer = 2 ): Double ;
var
   iSinal : Integer ;
   d : Double ;
begin
   StrError := False;
   S := Str_LRTrim(S) ;
   If ( Length(S) = 0 ) Then
   Begin
       Result := 0 ;
       Exit ;
   End ;
   if ( ( S[1] = '-' ) Or ( S[1] = '(' ) Or ( S[Length(S)] = '-' ) Or ( S[Length(S)] = ')' ) ) Then
       iSinal := -1
   Else
       iSinal := 1 ;
   S := Str_NoMoneySeparator( S ) ;
   d := Power(10,Dec) ;
   Result := ( Str_StrToFloat( S ) / d ) * iSinal ;
end ;

function Str_AddrToLongInt( Segment, OffSet: Word ): LongInt;
var
    AuxLong: LongInt;
begin
  StrError := False;
  AuxLong := Segment;
  AuxLong := AuxLong shl 16;
  Result := AuxLong + OffSet;
end;

Function Str_DataExtenso(Data : TDateTime; Parte : String) : String;
var
  nrdia: Integer;
  diasemana: array[1..7] of String;
  meses: array[1..12] of String;
  dia, mes, ano: Word;
begin
  diasemana[1]:= 'Domingo';
  diasemana[2]:= 'Segunda-feira';
  diasemana[3]:= 'Terça-feira';
  diasemana[4]:= 'Quarta-feira';
  diasemana[5]:= 'Quinta-feira';
  diasemana[6]:= 'Sexta-feira';
  diasemana[7]:= 'Sábado';
  meses[1]:= 'Janeiro';
  meses[2]:= 'Fevereiro';
  meses[3]:= 'Março';
  meses[4]:= 'Abril';
  meses[5]:= 'Maio';
  meses[6]:= 'Junho';
  meses[7]:= 'Julho';
  meses[8]:= 'Agosto';
  meses[9]:= 'Setembro';
  meses[10]:= 'Outubro';
  meses[11]:= 'Novembro';
  meses[12]:= 'Dezembro';
  DecodeDate(Data,ano,mes,dia);
  nrdia:= DayOfWeek(Data);
  //diasemana[nrdia]+', '
  if Parte = 'D' then
    Result := IntToStr(dia)
  else if Parte = 'M' then
    Result := Meses[mes]
  else if Parte = 'Y' then
  begin
    if Length(IntToStr(ano)) = 4 then
      Result := Copy(IntToStr(ano),3,2)
    else
      Result := IntToStr(ano);
  end
  else if Parte = 'YY' then
    Result := IntToStr(ano)
  else
    Result := IntToStr(dia)+ ' de ' + Meses[mes] + ' de ' + IntToStr(ano);
end;

function Str_StrToMoney( S: String ; Dec : Integer ): String;
var
  Vlr, d : Double;
  fmt : String ;
begin
  ThousandSeparator := FuFmt.sThousandSeparator;
  DecimalSeparator := FuFmt.sDecimalSeparator;
  StrError := false;
  CurrencyString := '';
  CurrencyFormat := 0;
  NegCurrFormat  := 2;
  CurrencyDecimals := 2;
  d := Power(10,Dec) ;
  S := Str_NoMoneySeparator( S ) ;
  try
      StrError := False ;
      Vlr := StrToFloat( S )/d;     (*  00100000 --> 1.000,00 *)
  except
     StrError := true;
     Vlr := 0;
  end;
  fmt := '%.' + Str_IntToStr(Dec) + 'm' ;
  FmtStr ( Result,fmt,[Vlr] );
end;

Function Str_ChangeFormatDate ( Data, NewFormat : String ) : String ;
Var
   nData : TDateTime ;
Begin
   Result := '' ;
   nData := Str_StrToDate(Data) ;
   If ( StrError ) Then
       Exit ;
   ShortDateFormat := NewFormat ;
   try
       StrError := False ;
       Result := DateToStr ( nData );
   except
       StrError := True ;
       ShortDateFormat := FuFmt.sShortDateFormat;
       Result := '' ;
       Exit ;
   end;
   ShortDateFormat := FuFmt.sShortDateFormat;
End ;

Function Str_DDMMAA_To_MMDDAA ( Data : String ) : String ;
Begin
   Result := Copy(Data,4,2) + '/' + Copy(Data,1,2) + '/' + Copy(Data,7,Length(Data)) ;
end ;

Function Str_DDMMAA_To_MMDDAA ( Data : TDateTime ) : String ;
Begin
   Result := Str_DDMMAA_To_MMDDAA( Str_DateToStr(Data) ) ;
End ;

function Str_FormatDate( Data: Real; Formato: String ): String;
var
     i                                 : Integer;
     Fmt                               : String[15];
     Dia, Mes, Ano                     : Word;
     sDia, sMes, sXMes, sAno, sXAno    : String[4];
     AuxStr, Ret                       : String[15];

begin
  StrError := True ;
  Result := '' ;
  Result := '  ' + FuFmt.sDateSeparator + '  ' + FuFmt.sDateSeparator + '  ';
  if ( Data = 0 ) then
     Exit;
  StrError := False;
  Fmt := Str_LRTrim( UpperCase( Formato ) ) ;
  try
    ThousandSeparator := FuFmt.sThousandSeparator;
    DecimalSeparator := FuFmt.sDecimalSeparator;
    ShortDateFormat := FuFmt.sShortDateFormat;
    DecodeDate( Data, Ano, Mes, Dia );
    sAno := IntToStr( Ano );
    sDia := Str_RightAlignCh( IntToStr( Dia ), 2, '0' );
    sMes := Str_RightAlignCh( IntToStr( Mes ), 2, '0' );
    sXAno := IntToStr( Ano );
    if ( sXAno <> '' ) then
       sAno := Copy( sAno,3,2 );
  except
    Exit;
  end;

  case Mes of
     1: sXMes := 'Jan';
     2: sXMes := 'Fev';
     3: sXMes := 'Mar';
     4: sXMes := 'Abr';
     5: sXMes := 'Mai';
     6: sXMes := 'Jun';
     7: sXMes := 'Jul';
     8: sXMes := 'Ago';
     9: sXMes := 'Set';
    10: sXMes := 'Out';
    11: sXMes := 'Nov';
    12: sXMes := 'Dez';
  end;

  Ret := '';
  i := 1 ;
  While ( I <= Length(Fmt) ) Do
     Begin
       AuxStr := Copy( Fmt, i, 4 );
       if ( AuxStr = 'AAAA' ) then
          begin
            Ret := Ret + sXAno;
            i := i + 3 ;
            Continue;
          end;

       AuxStr := Copy( Fmt, i, 3 );
       if ( AuxStr = 'MMM' ) then
          begin
            Ret := Ret + sXMes;
            Inc( i, 2 );
            Continue;
          end;

       AuxStr := Copy( Fmt, i, 2 );
       if ( AuxStr = 'AA' ) then
          begin
            Ret := Ret + sAno;
            Inc( i, 1 );
          end
       else if ( AuxStr = 'MMM' ) then
          begin
            Ret := Ret + sXMes;
            Inc( i, 2 );
          end
       else if ( AuxStr = 'MM' ) then
          begin
            Ret := Ret + sMes;
            Inc( i, 1 );
          end
       else if ( AuxStr = 'DD' ) then
          begin
            Ret := Ret + sDia;
            Inc( i, 1 );
          end
       else if ( AuxStr[1] = '/' ) then
          begin
            Ret := Ret + FuFmt.sDateSeparator;
            Inc( i, 1 );
          end;
     end;

  Result := Ret;
End ;

function Str_FormatTime( Time: Real; Formato: String ): String;
var
     Fmt                               : String[15];
     Hora, Min, Seg, MSeg              : Word;
     sHora, sMin, sSeg                 : String[4];

begin
  StrError := True ;
  Result := '' ;
  Result := '  ' + FuFmt.sTimeSeparator + '  ' + FuFmt.sTimeSeparator + '  ';
  if ( Time = 0 ) then
     Exit;
  StrError := False ;
  Fmt := Str_LRTrim( UpperCase( Formato ) ) ;
  try
    ThousandSeparator := FuFmt.sThousandSeparator;
    DecimalSeparator := FuFmt.sDecimalSeparator;
    ShortTimeFormat := FuFmt.sShortTimeFormat;
    DecodeTime( Time, Hora, Min, Seg, MSeg );
    sHora := Str_RightAlignCh( IntToStr( Hora ), 2, '0' );
    sMin := Str_RightAlignCh( IntToStr( Min ), 2, '0' );
    sSeg := Str_RightAlignCh( IntToStr( Seg ), 2, '0' );
  except
    Exit;
  end;

  if ( Fmt = 'HH:MM' ) then
     Result := sHora + FuFmt.sTimeSeparator + sMin
  else if ( Fmt = 'HH:MM:SS' ) then
     Result := sHora + FuFmt.sTimeSeparator + sMin + FuFmt.sTimeSeparator + sSeg;
end;

function Str_FormatStrDate( Data, DoFmt, ParaFmt: String ): String;
var
    i              : Integer;
    De, Para, D    : String[25];
    Ano, Mes, Dia  : String[25];
    AuxDate        : TDateTime;
begin
  StrError := False ;
  Result := Data;
  Ano := ''; Mes := ''; Dia := '';
  De := UpperCase( DoFmt ); Para := UpperCase( ParaFmt );

  for i := 1 to Length( De ) do
     begin
       if ( De[i] = 'A' ) then
          Ano := Ano + Data[i] ;
       if ( De[i] = 'M' ) then
          Mes := Mes + Data[i] ;
       if ( De[i] = 'D' ) then
          Dia := Dia + Data[i] ;
     end;

  D := Dia + FuFmt.sDateSeparator + Mes + FuFmt.sDateSeparator + Ano;
  AuxDate := Str_StrToDate( D );
  if ( not StrERROR ) then
     Result := Str_FormatDate( AuxDate, Para );
end;

function Str_FormatStrTime( Time, DoFmt, ParaFmt: String ): String;
var
    i              : Integer;
    De, Para, D    : String[25];
    Hora, Min, Seg  : String[25];
    AuxTime        : TDateTime;
begin
  StrError := False ;
  Result := Time;
  Hora := ''; Min := ''; Seg := '';
  De := UpperCase( DoFmt ); Para := UpperCase( ParaFmt );

  for i := 1 to Length( De ) do
     begin
       if ( De[i] = 'H' ) then
          Hora := Hora + Time[i] ;
       if ( De[i] = 'M' ) then
          Min := Min + Time[i] ;
       if ( De[i] = 'S' ) then
          Seg := Seg + Time[i] ;
     end;

  D := Hora + FuFmt.sTimeSeparator + Min + FuFmt.sTimeSeparator + Seg;
  AuxTime := Str_StrToTime( D );
  if ( not StrERROR ) then
     Result := Str_FormatTime( AuxTime, Para );
end;

Function Str_LenByFont ( S : String ) : LongInt ;
Var
    hDC : Word ;
    TagSize : TSize ;
Begin
    StrError := True ;
    Result := -1 ;
    hDC := GetDC( Str_GetObjHandle ) ;
    If ( hDC = 0 ) Then
       Exit ;
    StrError := False ;
    S := Str_LRTrim(S) ;
    If ( Not GetTextExtentPoint32(hDC,PChar(S),Length(S),TagSize) ) Then
    Begin
       StrError := True ;
       Exit ;
    End ;
    ReleaseDC(Str_GetObjHandle,hDC) ;
    Result := TagSize.cx ;
End ;

Function Str_RValMinus (S : String; Carac : Word ) : String;
var
   hDC : Word ;
   Count, LenAlign, Len : Word ;
   Buf : Array[0..30] Of Char ;
   M : String;
   IsMinus : Boolean ;
   TagSize : TSize ;
begin
   StrError := True ;
   Result := '' ;
   S := Str_LRTrim(S) ;
   If ( S[Length(S)] = '-' ) Then
   Begin
       IsMinus := True ;
       S := Copy(S,1,Length(S)-1) ;
   End
   Else
       IsMinus := False ;
   M := '';
   for Count := 1 to (Carac - 1) do M := M + '9';
   LenAlign := Str_LenByFont(M);
   hDC := GetDC(Str_GetObjHandle) ;
   If ( hDC = 0 ) Then
      Exit ;
   StrError := False ;
   Len := 0 ;
   While ( Len <= LenAlign ) Do
   Begin
       S := ' ' + S ;
       StrPCopy(Buf,S) ;
       (* Win32
       If ( Not GetTextExtentPoint32(hDC,Buf,StrLen(Buf),TagSize) ) Then
       Begin
          StrError := True ;
          Exit ;
       End ;
       *)
       Len := TagSize.cy ;
   End ;
   If ( IsMinus ) Then
       S := S + '-'
   Else
       S := S + ' ' ;
   ReleaseDC(Str_GetObjHandle,hDC) ;
   Result := S ;
end;

Function Str_ValRightAlignByCarac (S : String; Carac : Word) : String;
var
   hDC : Word ;
   Count, LenAlign, Len : Word ;
   M : String;
   TextSize : TSize ;
begin
   StrError := True ;
   Result := '' ;
   M := '';
   for Count := 1 to (Carac - 1) do M := M + '9';
   LenAlign := Str_LenByFont(M);
   hDC := GetDC(Str_GetObjHandle) ;
   If ( hDC = 0 ) Then
      Exit ;
   StrError := False ;
   S := Str_LRTrim(S) ;
   Len := 0 ;
   While ( Len <= LenAlign ) Do
   Begin
       S := ' ' + S ;
       (* Win32 *)
       If ( Not GetTextExtentPoint32(hDC,PChar(S),Length(S),TextSize) ) Then
       Begin
          StrError := True ;
          Exit ;
       End ;
       Len := TextSize.cx ;
   End ;
   ReleaseDC(Str_GetObjHandle,hDC) ;
   Result := S ;
end;

Function Str_ValRightAlignByCarac (V : Double ; Carac : Word) : String;
var
   hDC : Word ;
   Count, LenAlign, Len : Word ;
   S, M : String;
   TextSize : TSize ;
begin
   StrError := True ;
   Result := '' ;
   M := '';
   for Count := 1 to (Carac - 1) do M := M + '9';
   LenAlign := Str_LenByFont(M);
   hDC := GetDC(Str_GetObjHandle) ;
   If ( hDC = 0 ) Then
      Exit ;
   StrError := False ;
   S := Str_FloatToMoney(V) ;
   S := Str_LRTrim(S) ;
   Len := 0 ;
   While ( Len <= LenAlign ) Do
   Begin
       S := ' ' + S ;
       (* Win32 *)
       If ( Not GetTextExtentPoint32(hDC,PChar(S),Length(S),TextSize) ) Then
       Begin
          StrError := True ;
          Exit ;
       End ;
       Len := TextSize.cx ;
   End ;
   ReleaseDC(Str_GetObjHandle,hDC) ;
   Result := S ;
end;

function Str_StrLeftAlignByCarac( S : String; Carac : Word ) : String;
var
   hDC : Word ;
   Len : Word ;
   TextSize : TSize ;
begin
   StrError := True ;
	Result := '';
   hDC := GetDC(Str_GetObjHandle) ;
   If ( hDC = 0 ) Then
      Exit ;
   StrError := False ;
   S := Str_LRTrim(S) ;
   Len := Str_LenByFont(S) ;
   While ( Len <= Carac ) Do
   Begin
       S := S + ' ' ;
       (* Win32 *)
       If ( Not GetTextExtentPoint32(hDC,PChar(S),Length(S),TextSize) ) Then
       Begin
          StrError := True ;
          Exit ;
       End ;
       Len := TextSize.cx ;
   End ;
   ReleaseDC(Str_GetObjHandle,hDC) ;
   Result := S ;
end;

function Str_StrRightAlignByCarac( S : String; Carac : Word ) : String;
var
   hDC : Word ;
   Count, LenAlign, Len : Word ;
   M : String;
   TextSize : TSize ;
begin
   StrError := True ;
   Result := '' ;
   M := '';
   for Count := 1 to (Carac - 1) do M := M + ' ';
   LenAlign := Str_LenByFont(M);
   hDC := GetDC(Str_GetObjHandle) ;
   If ( hDC = 0 ) Then
      Exit ;
   StrError := False ;
   S := Str_LRTrim(S) ;
   Len := 0 ;
   While ( Len <= LenAlign ) Do
   Begin
       S := ' ' + S ;
       (* Win32 *)
       If ( Not GetTextExtentPoint32(hDC,PChar(S),Length(S),TextSize) ) Then
       Begin
          StrError := True ;
          Exit ;
       End ;
       Len := TextSize.cx ;
   End ;
   ReleaseDC(Str_GetObjHandle,hDC) ;
   Result := S ;
end;

Function Str_ValRightAlignByPixels ( S : String ; LenAlign : Word ) : String ;
Var
   hDC : Word ;
   Len : Word ;
   Buf : Array[0..30] Of Char ;
   TagSize : TSize ;
Begin
   StrError := True ;
   Result := '' ;
   hDC := GetDC(Str_GetObjHandle) ;
   If ( hDC = 0 ) Then
      Exit ;
   StrError := False ;
   S := Str_LRTrim(S) ;
   Len := 0 ;
   While ( Len < LenAlign ) Do
   Begin
       S := ' ' + S ;
       StrPCopy(Buf,S) ;
       (* Win32
       If ( Not GetTextExtentPoint32(hDC,Buf,StrLen(Buf),TagSize) ) Then
       Begin
          StrError := True ;
          Exit ;
       End ;
       *)
       Len := TagSize.cy ;
   End ;
   ReleaseDC(Str_GetObjHandle,hDC) ;
   Result := S ;
End ;

Function Str_CenterAlign ( S : String ; Carac : Word; CToAlin : char) : String ;
Var
   hDC : Word ;
   LenAlign : Word;
   Aux, M : String ;
   Len : LongInt ;
   k : Integer ;
   TextSize : TSize ;
Begin
   StrError := True ;
   Result := '' ;
   M := '';
   for k := 1 to (Carac - 1) do M := M + CToAlin ;
   LenAlign := Str_LenByFont(M);
   hDC := GetDC(Str_GetObjHandle) ;
   If ( hDC = 0 ) Then
      Exit ;
   StrError := False ;
   S := Str_LRTrim(S) ;
   Len := 0 ;
   k := 1 ;
   While ( Len <= LenAlign ) Do
   Begin
       Aux := Str_Space(k) + S + Str_Space(k) ;
       (* Win32 *)
       If ( Not GetTextExtentPoint32(hDC,PChar(Aux),Length(Aux),TextSize) ) Then
       Begin
          StrError := True ;
          Exit ;
       End ;
       Len := TextSize.cx ;
       k := k + 1 ;
   End ;
   ReleaseDC(Str_GetObjHandle,hDC) ;
   Result := Aux ;
End ;

Procedure Str_SetObjHandle ( Hnd : Word ) ;
Begin
   StrError := False ;
   globObjHandle := Hnd ;
End ;
Function Str_GetObjHandle : Word ;
Begin
   StrError := False ;
   Result := globObjHandle ;
End ;

Function Str_ValidDirName ( S : String ) : String ;
Var
   i, k : Integer ;
   OkCharDir, NoCharDir : String[9] ;
Begin
   StrError := False ;
   OkCharDir := '!@~%=($_)' ;
   NoCharDir := '/.><"?*: ' ;
   For i:=1 To Length(S) Do
   Begin
       k := Pos(S[i],NoCharDir) ;
       If ( k <> 0 ) Then
           S[i] := OkCharDir[k] ;
   End ;
   Result := S ;
End ;

Function Str_Space ( Len : Integer ) : String ;
Var
   i : Integer ;
Begin
     Result := '' ;
     For i:=1 To Len Do
         Result := Result + ' ' ;
End ;

function Str_Pad(S: string; I: smallint): string;
begin
  while(Length(S) < I) do S:= ' '+S;
  result:= S;
end;

function Str_Clip(S: string; I: smallint): string;
begin
  {$IFDEF WIN32}
  if length(S) > I then SetLength(S, I);
  {$ELSE}
  if length(S) > I then S[0]:= char(I);
  {$ENDIF}
  result:= S;
end;

function Str_CPad(S: string; I: smallint): string;
begin
  while(Length(S) < I) do S:= ' '+S;
  result:= Str_Clip(S,I);
end;

function Str_CPadR(S: string; I: smallint): string;
begin
  while(Length(S) < I) do S:= S+' ';
  result:= Str_Clip(S,I);
end;

function Str_PadZ(S: string; I: smallint): string;
begin
  while(Length(S) < I) do S:= '0'+S;
  result:= S;
end;

Function Str_Zero ( N : Integer ; L : Integer ) : String ;
Begin
   Result := Str_PadZ(Str_IntToStr(N),L) ;
End ;

Function Str_Zero ( N : String ; L : Integer ) : String ;
Begin
   Result := Str_PadZ(N,L) ;
End ;

Function Str_Replace ( S, Old, New : String ) : String ;
Var
   p : Integer ;
Begin
   Result := S ;
   p := Pos(Old,S) ;
   If ( p = 0 ) Then
       Exit ;
   Delete(S,p,Length(Old)) ;
   Insert(New,S,p) ;
   Result := S ;
End ;

function Str_ReplaceAll( Old, New, S : String; caseSen : boolean ) : string;
var
  P,x : smallint;
  tmpstr : String;
begin
  P:= 1;
  if not caseSen then Old:= AnsiLowerCase(Old);
  while P <= length(S) do begin
    tmpstr:= Copy(S, P, length(S)-P+1);
    if not caseSen then tmpstr:= AnsiLowerCase(tmpstr);
    x:= Pos(Old, tmpstr);
    if x > 0 then begin
      Delete(S, P+x-1, length(Old));
      Insert(New, S, P+x-1);
      P:= P + x - 1 + length(new);
      end
    else inc(P);
    end;
  Result:= S;
end;

function Str_CasePos(Sub, S : string): smallint;
begin
  Sub:= Lowercase(Sub);
  S:= Lowercase(S);
  Result:= Pos(Sub,S);
end;

function Str_PosFromPos(Sub, S : string; Index : smallint): smallint;
var
  x      : smallint;
  tmpstr : string;
begin
  if index < length(S) - length(sub) + 1 then begin
    tmpstr:= copy(S, Index, (length(s) - Index) + 1);
    if length(Sub) < length(tmpstr) then begin
      x:= Pos(Sub, tmpstr);
      if x > 0 then result:= (Index + x) - 1
      else result:= -1;
      end
    else result:= -1;
    end
  else result:= -1;
end;

function Str_CasePosFromPos(Sub, S : string; Index : smallint): smallint;
var
  x      : smallint;
  tmpstr : string;
begin
  Sub:= Lowercase(Sub);
  S:= Lowercase(S);
  if index < length(S) - length(sub) + 1 then begin
    tmpstr:= copy(S, Index, (length(s) - Index) + 1);
    if length(Sub) < length(tmpstr) then begin
      x:= Str_CasePos(Sub, tmpstr);
      if x > 0 then result:= (Index + x) - 1
      else result:= 0;
      end
    else result:= 0;
    end
  else result:= 0;
end;

function Str_MakeUniqueString: String;
var
  datestr: string[5];
  timestr: string[10];
  ti_hour,ti_min,ti_sec,ti_hund: word;
  l_hour,l_min,l_sec,l_hund: longint;
  da_year,da_mon,da_day: word;
  time_code: longint;
begin
  Result:= '';
  DecodeTime(Time,ti_hour,ti_min,ti_sec,ti_hund);
  DecodeDate(Date,da_year,da_mon,da_day);

  l_hour := ti_hour;
  l_min  := ti_min;
  l_sec  := ti_sec;
  l_hund := ti_hund;

  time_code := (l_hour * 360000) +
               (l_min  * 6000) +
               (l_sec  * 100) +
                l_hund;
  datestr:= Num_inttobase(da_year-1980,36);
  datestr:= datestr + Num_inttobase(da_mon,36);
  datestr:= datestr + Num_inttobase(da_day,36);
  timestr:= Str_padZ(Num_inttobase(time_code,36), 5);
  Result:= Uppercase(datestr + timestr);
end;

procedure Str_ScanBlanks(const S: string; var Pos: Integer);
var
  I: Integer;
begin
  I := Pos;
  while (I <= Length(S)) and (S[I] = ' ') do Inc(I);
  Pos := I;
end;

function Str_ScanNumber(const S: string; var Pos: Integer;
  var Number: Word): Boolean;
var
  I: Integer;
  N: Word;
begin
  Result := False;
  Str_ScanBlanks(S, Pos);
  I := Pos;
  N := 0;
  while (I <= Length(S)) and (S[I] in ['0'..'9']) and (N < 1000) do
  begin
    N := N * 10 + (Ord(S[I]) - Ord('0'));
    Inc(I);
  end;
  if I > Pos then
  begin
    Pos := I;
    Number := N;
    Result := True;
  end;
end;

function Str_ScanString(const S: string; var Pos: Integer;
  const Symbol: string): Boolean;
begin
  Result := False;
  if Symbol <> '' then
  begin
    Str_ScanBlanks(S, Pos);
    if AnsiCompareText(Symbol, Copy(S, Pos, Length(Symbol))) = 0 then
    begin
      Inc(Pos, Length(Symbol));
      Result := True;
    end;
  end;
end;

function Str_ScanChar(const S: string; var Pos: Integer; Ch: Char): Boolean;
begin
  Result := False;
  Str_ScanBlanks(S, Pos);
  if (Pos <= Length(S)) and (S[Pos] = Ch) then
  begin
    Inc(Pos);
    Result := True;
  end;
end;

Function Str_GetPosStrInStr ( Const S : String ; Const Sep : String ; Ocorr : Integer ) : Integer ;
Var
   P, i, NumOcorr, Salto : Integer ;
   SubStr : String ;
Begin
   Result := 0 ;
   SubStr := S ;
   NumOcorr := 0 ;
   Salto  := Length(Sep) - 1 ;
   For i:=1 To Ocorr Do
   Begin
       P := Pos(Sep,SubStr) ;
       If ( P = 0 ) Then
           Break ;
       NumOcorr := NumOcorr + 1 ;
       If ( Result = 0 ) Then
           Result := Result + P
       Else
           Result := Result + P + Salto ;
       SubStr := Copy(SubStr,P+Length(Sep),Length(SubStr)) ;
   End ;
   If ( NumOcorr <> Ocorr ) Then
       Result := 0 ;
End ;

Function Str_GetNumOccur ( Const S : String ; Const Search : String ) : Integer ;
Var
   P : Integer ;
   SubStr : String ;
Begin
   Result := 0 ;
   SubStr := S ;
   P := Pos(Search,SubStr) ;
   If ( P = 0 ) Then
      Exit ;
   SubStr := S ;
   While ( P <> 0 ) Do
   Begin
      Result := Result + 1 ;
      SubStr := Copy(SubStr,P+1,Length(SubStr)) ;
      P := Pos(Search,SubStr) ;
   End ;
End ;

Function Str_GetToken ( Const S : String ; Const Sep : String ; Ocorr : Integer = 1 ) : String ;
Var
   Ini, Fim, Len : Integer ;
Begin
   Result := '' ;
   If ( Ocorr < 1 ) Then
       Exit ;
   Ini := Str_GetPosStrInStr(S,Sep,Ocorr - 1) ;
   If ( Ini = 0 ) Then
       Ini := 1
   Else
       Ini := Ini + Length(Sep) ;
   Fim := Str_GetPosStrInStr(S,Sep,Ocorr) ;
   If ( Fim = 0 ) Then
   Begin
       Fim := Length(S) ;
       Len := Fim ;
   End
   Else Begin
       Fim := Fim - 1 ;
       Len := Fim - Ini + 1 ;
   End ;
   Result := Copy(S,Ini,Len) ;
End ;

initialization

 StrError := false;

 CurrencyString := '';
 CurrencyFormat := 0;
 NegCurrFormat  := 2;
 CurrencyDecimals := 2 ;

 FuFmt.sDateSeparator := '/' ;
 FuFmt.sTimeSeparator := ':' ;
 FuFmt.sThousandSeparator := '.' ;
 FuFmt.sDecimalSeparator := ',' ;
 FuFmt.CurrencyDecimals := 2 ;
 FuFmt.sCurrencyString := 'R$' ;
 FuFmt.sShortDateFormat := 'dd/mm/yyyy';
 FuFmt.sLongDateFormat  := 'dd/mm/yyyy';
 FuFmt.sShortTimeFormat := 'hh:mm:ss';

end.

