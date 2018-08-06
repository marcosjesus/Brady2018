Unit TestFun ;

interface

Function Test_CheckCGCCPF ( Value : String ) : String ; Export ;
function Test_CheckCPF( CPF: String ): Boolean; Export;
function Test_CheckCGC( CGC: String ): Boolean; Export;
function Test_CheckAndFmtCPF( CPF: String; var CPFFmted: String ): Boolean; Export;
function Test_CheckAndFmtCGC( CGC: String; var CGCFmted: String ): Boolean; Export;

Function Test_IsEmptyStr ( Const S : String ) : Boolean ; Export ;
Function Test_StrIsZero ( Const S : String ) : Boolean ; Export ;
Function Test_DateOk ( Const S : String ) : Boolean ; Export ; Overload ;
Function Test_StrInSet ( Const S : String ; Const StrSet : String ; IsCaseSen : Boolean = False ) : Boolean ; Export ;
Function Test_LimOfValue ( Value, Inf, Sup : Double ) : Boolean ; Export ;
Function Test_DateEmpty ( Dt : String ) : Boolean ; Export ;

Function Test_IsHolliday ( Const D : TDateTime ) : Boolean ; Export ;
Function Test_WorkDate ( D : TDateTime ) : TDateTime ; Export ;

implementation

Uses
    SysUtils, StrFun, SqlTableFun ;

function Test_CheckCPF( CPF: String ): Boolean;
var
  AuxCPF           : String[20];
  s1               : String[20];
  dv               : Char;
  i, Peso, Soma    : Integer;

  function GetDig( Sum: Integer ): Char;
  var
      Md: Integer;
  begin
    Md := 11 - ( Sum mod 11 ) ;
    if ( Md = 10 ) or ( Md = 11 ) then
      Result := '0'
    else
      Result := Char( 48 + Md );
  end;

begin
  AuxCPF := Str_OnlyNumbers( CPF );
  AuxCPF := Str_RightAlignCh( CPF, 11, '0' );
  if ( AuxCPF = '00000000000' ) then
     begin
       Result := false;
       Exit;
     end;

  s1 := Copy( AuxCPF, 1, 9 );

  (******************************** Primeiro Digito *****************************)
  Soma := 0; Peso := 10;
  for i := 1 to 9 do
     begin
       Soma := Soma + ( Peso * ( Ord( s1[i] ) - 48 ) );
       Dec( Peso );
     end;
  dv := GetDig( Soma );
  (******************************************************************************)

  (********************************* Segundo Digito *****************************)
  s1 := s1 + dv;
  Soma := 0; Peso := 11;
  for i := 1 to 10 do
     begin
       Soma := Soma + ( Peso * ( Ord( s1[i] ) - 48 ) );
       Dec( Peso );
     end;
  dv := GetDig( Soma );
  (******************************************************************************)

  Result := ( s1 + dv = AuxCPF );
end ;

function Test_CheckAndFmtCPF( CPF: String; var CPFFmted: String ): Boolean;
var
  AuxCPF           : String[20];
begin
  AuxCPF := Str_OnlyNumbers( CPF );
  AuxCPF := Str_RightAlignCh( CPF, 11, '0' );
  if ( AuxCPF = '00000000000' ) then
     begin
       Result := false;
       Exit;
     end;
  Result := Test_CheckCPF(CPF) ;
  if ( Result ) then
     CPFFmted := Copy( AuxCPF, 1, 3 ) + '.' + Copy( AuxCPF, 4, 3 ) + '.' +
                 Copy( AuxCPF, 7, 3 ) + '-' + Copy( AuxCPF, 10, 2 )
  else
     CPFFmted := '';
end ;

function Test_CheckCGC( CGC: String ): Boolean;
var
   AuxCGC      : String;
   dv1, dv2    : Char;
   i, Soma     : Integer;

   function GetDig( Sum: Integer ): Char;
   var
       Md: Integer;
   begin
     Md := 11 - ( Sum mod 11 );
     if ( Md > 9 ) then
        Result := '0'
     else
        Result := Char( 48 + Md );
   end;

begin
  AuxCGC := Str_OnlyNumbers( CGC );
  AuxCGC := Str_RightAlignCh( AuxCGC, 14, '0' );
  if ( AuxCGC = '00000000000000' ) then
     begin
       Result := false;
       Exit;
     end;

  (**************************** Primeiro Digito *********************************)
  Soma := 0;
  for i := 1 to 12 do
    begin
      if i < 5 then
        Inc( Soma, ( Ord( AuxCGC[i] ) - 48 ) * (6-i) )
      else
        Inc( Soma, ( Ord( AuxCGC[i] ) - 48 ) * (14-i) );
    end;
  dv1 := GetDig( Soma );
  (******************************************************************************)

  (**************************** Segundo Digito **********************************)
  Soma := 0;
  for i := 1 to 13 do
     begin
       if i < 6 then
         Inc(Soma, ( Ord( AuxCGC[i] ) - 48 ) * (7-i) )
       else
         Inc(Soma, ( Ord( AuxCGC[i] ) - 48 ) * (15-i) );
     end;
   dv2 := GetDig( Soma );
  (******************************************************************************)

  Result := ( dv1 + dv2 = Copy( AuxCGC, 13, 2 ) );
end;

function Test_CheckAndFmtCGC( CGC: String; var CGCFmted: String ): Boolean;
var
   AuxCGC      : String;
begin
  AuxCGC := Str_OnlyNumbers( CGC );
  AuxCGC := Str_RightAlignCh( AuxCGC, 14, '0' );
  if ( AuxCGC = '00000000000000' ) then
     begin
       Result := false;
       Exit;
     end;
  Result := Test_CheckCGC(CGC) ;
  if ( Result ) then
     CGCFmted := Copy( AuxCGC, 1, 2 ) + '.' + Copy( AuxCGC, 3, 3 ) + '.' + Copy( AuxCGC, 6, 3 ) + '/' +
                 Copy( AuxCGC, 9, 4 ) + '-' + Copy( AuxCGC, 13, 2 )
  else
     CGCFmted := '';
end;

Function Test_CheckCGCCPF ( Value : String ) : String ;
Begin
   If ( Test_CheckCGC(Value) ) Then
       Result := 'CGC'
   Else Begin
       Value := Copy(Value,1,11) ;
       If ( Test_CheckCPF(Value) ) Then
          Result := 'CPF'
       Else
           Result := '' ;
   End ;
End ;

Function Test_IsEmptyStr ( Const S : String ) : Boolean ;
Begin
   Result := Length(Str_LRTrim(S)) <= 0 ;
End ;

Function Test_StrIsZero ( Const S : String ) : Boolean ;
Var
   Aux : String ;
   Val : Double ;
Begin
   Result := True ;
   Aux := Str_NoMoneySeparator(S) ;
   Val := Str_StrToFloat(Aux) ;
   If ( Val <> 0 ) Then
       Result := False ;
End ;

Function Test_DateOk ( Const S : String ) : Boolean ;
Begin
   Str_StrToDate(S) ;
   Result := Not Str_Error ;
End ;

Function Test_StrInSet ( Const S : String ; Const StrSet : String ; IsCaseSen : Boolean = False ) : Boolean ;
Var
   vS, vStrSet : String ;
Begin
   Result := False ;
   vS := S ;
   vStrSet := StrSet ;
   If ( Not IsCaseSen ) Then
   Begin
       vS := LowerCase(vS) ;
       vStrSet := LowerCase(vStrSet) ;
   End ;
   If ( Pos(vS,vStrSet) <> 0 ) Then
       Result := True ;
End ;

Function Test_IsHolliday ( Const D : TDateTime ) : Boolean ;
Var
   T : TSQLTableClass ;
Begin
   Result := False ;
   T := TSQLTableClass.Create ;
   If ( Not T.OpenTable('FERIADO') ) Then
       Exit ;
   If ( Not T.SetFieldKey('DATA') ) Then
       Exit ;
   T.SetKey([D]) ;
   If ( T.Find(False) ) Then
       Result := True ;
   T.Destroy ;
End ;

Function Test_WorkDate ( D : TDateTime ) : TDateTime ;
Begin
   If ( Test_IsHolliday(D) ) Then
       D := D + 1 ;
   If ( DayOfWeek(D) = 7 ) Then
       D := D + 1 ;
   If ( DayOfWeek(D) = 1 ) Then
       D := D + 1 ;
   Result := D ;
End ;

Function Test_LimOfValue ( Value, Inf, Sup : Double ) : Boolean ;
Begin
    Result := True ;
    If ( (Value < Inf) Or (Value > Sup) ) Then
       Result := False ;
End ;

Function Test_DateEmpty ( Dt : String ) : Boolean ;
Begin
   Result := False ;
   If ( (Dt = '  /  /  ') Or (Dt = '  /  /    ') Or (Dt = '') ) Then
      Result := True ;
End ;

end.
