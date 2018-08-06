{******************************************************}
{                rsSuperCheckBox V1.0                  }
{        Copyright 1997 RealSoft Development           }
{           support:  www.realsoftdev.com              }
{******************************************************}

unit Rscheck;

interface

{$I REALSOFT.INC}

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls;

const
  MARGIN = 4;

type
  TCheckStyle = ( csSquareX, csSquareCheck, csThinX, csRound, csDefault );

  TrsSuperCheckBox = class(TCustomControl)
  private
    FLocator    : boolean;
    FLocColor   : TColor;
    FOldColor   : TColor;
    FAutoText   : boolean;
    FAutoBox    : boolean;
    FAutoChk    : boolean;
    FChecked    : boolean;
    FCheckStyle : TCheckStyle;
    FGroupID    : smallint;
    FGroupUn    : boolean;
    FAlignment  : TLeftRight;
    FBGColor    : TColor;
    FCkColor    : TColor;
    FOnChange   : TNotifyEvent;
    FOnReturn: TNotifyEvent;
    FEnterToTab : boolean;
    procedure SetCheckStyle(AValue: TCheckStyle);
    procedure SetGroupID   (AValue: smallint);
    procedure SetGroupUn   (AValue: boolean);
    procedure SetChecked   (AValue: boolean);
    procedure SetAutoText  (AValue: boolean);
    procedure SetAutoBox   (AValue: boolean);
    procedure SetAutoChk   (AValue: boolean);
    procedure SetAlignment (AValue: TLeftRight);
    procedure SetBGColor   (AValue: TColor);
    procedure SetCKColor   (AValue: TColor);
    procedure DrawSquare;
    procedure DrawRound;
    procedure DrawCaption;
  protected
    procedure Paint; 			override;
    procedure KeyPress(var Key: Char); 	override;
    procedure Click; 			override;
    procedure Loaded; 			override;
    procedure DoEnter; 			override;
    procedure DoExit; 			override;
    procedure CMSetEnabled(var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure CMDialogChar(var Message: TCMDialogChar); message CM_DIALOGCHAR;
    procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
  public
   constructor Create(AOwner: TComponent); override;
   procedure Invalidate; 		override;
  published
    property Alignment: TLeftRight    read FAlignment   write SetAlignment   default taRightJustify;
    property ColorFace: TColor        read FBGColor     write SetBGColor     default clWhite;
    property ColorCheck: TColor       read FCkColor     write SetCkColor     default clBlack;
    property CheckStyle: TCheckStyle  read FCheckStyle  write SetCheckStyle  default csSquareX;
    property GroupID: smallint        read FGroupID     write SetGroupID     default 0;
    property GroupCanUnChk: boolean   read FGroupUn     write SetGroupUn     default true;
    property Checked: boolean         read FChecked     write SetChecked     default false;
    property AutoSizeText: boolean    read FAutoText    write SetAutoText    default true;
    property AutoSizeBox: boolean     read FAutoBox     write SetAutoBox     default false;
    property AutoCheck: boolean       read FAutoChk     write SetAutoChk     default false;
    property Locator: boolean         read FLocator     write FLocator       default false;
    property LocColor: TColor         read FLocColor    write FLocColor      default clAqua;
    property EnterToTab : boolean     read FEnterToTab  write FEnterToTab    default true;
    property Align;
    property Caption;
    property Width;
    property ParentFont;
    property Font;
    property TabStop;
    property TabOrder;
    property Color;
    property Visible;
    property Enabled;
    property OnReturn: TNotifyEvent   read FOnReturn    write FOnReturn;
    property OnChange: TNotifyEvent   read FOnChange    write FOnChange;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('RSD', [TrsSuperCheckBox]);
end;

{$IFDEF DEMO}
function DelphiRunning : boolean;
begin
 if((FindWindow('TApplication','Delphi') = 0) and (FindWindow('TApplication','Delphi 2.0') = 0) and
    (FindWindow('TApplication','Delphi 3') = 0) and (FindWindow('TApplication','Delphi 4') = 0)) or
    (FindWindow('TPropertyInspector',nil) = 0) or (FindWindow('TAppBuilder',nil) = 0) then result:= false
 else result:= true;
end;
{$ENDIF}

function UnAccel(S: String) : String;
var S2: string;
    x: smallint;
begin
  S2:= '';
  for x:= 1 to Length(S) do
    if (x<Length(S)) and ((S[x]='&') and (S[x+1]='&')) or (S[x]<>'&') then S2:= S2 + S[x];
  result:= S2;
end;

constructor TrsSuperCheckBox.Create( AOwner: TComponent );
begin
  inherited Create( AOwner );
  ControlStyle := [csClickEvents, csCaptureMouse, csSetCaption];
  Width         := 97;
  Height        := 15;
  TabStop       := true;
  FCheckStyle   := csSquareX;
  FGroupID      := 0;
  FGroupUn      := true;
  FChecked      := false;
  FAutoText     := true;
  FAutoBox      := false;
  FAutoChk      := false;
  FLocator      := false;
  FLocColor     := clAqua;
  FAlignment    := taRightJustify;
  FBGColor      := clWhite;
  FCkColor      := clBlack;
  FOldColor     := FBGColor;
  FOnChange     := Nil;
  FOnReturn	:= nil;
  FEntertoTab	:= true;
end;

procedure TrsSuperCheckBox.Loaded;
{$IFDEF LOCATOR}
var F: TWinControl;
{$ENDIF}
begin
  inherited Loaded;
  FOldColor:= FBGColor;
  {$IFDEF LOCATOR}
  F := GetParentForm( Self );
  if F.Tag > 32767 then FLocator:= true;
  {$ENDIF}
  {$IFDEF DEMO}
  if not DelphiRunning then  {for trial version only}
    showmessage('This program is using an unregistered copy of the TrsSuperCheckBox' + #13 +
                'component from RealSoft.  Please register at www.realsoftdev.com' + #13 +
                'or call (949) 831-7879.');
  {$ENDIF}
end;

procedure TrsSuperCheckBox.KeyPress(var Key: Char);
var F: TWinControl;
begin
  {Handle enter like TAB}
  if (Key = #13) then
  begin
     if FEnterToTab then
     begin
       F := GetParentForm( Self );
       SendMessage(F.Handle, WM_NEXTDLGCTL, 0, 0);
     end;
     Key := #0;
     if assigned(FOnReturn) then FOnReturn(Self);
  end;
  if (Key = #32) then Click;  
  inherited KeyPress(Key);
end;

procedure TrsSuperCheckBox.Click;
begin
  if not Focused then SetFocus;
  if FChecked then begin
    if FGroupUn then Checked:= false
    end
  else Checked:= true;
  inherited Click;
end;

procedure TrsSuperCheckBox.DoEnter;
begin
  if FAutoChk then Checked:= true;
  if FLocator = true then ColorFace:= FLocColor;
  invalidate;  
  inherited DoEnter;
end;

procedure TrsSuperCheckBox.DoExit;
begin
  if FLocator = true then ColorFace:= FOldColor;
  invalidate;
  inherited DoExit;
end;

procedure TrsSuperCheckBox.CMDialogChar(var Message: TCMDialogChar);
begin
  with Message do
    if IsAccel(Message.CharCode, Caption) and CanFocus then begin
      SetFocus;
      Result := 1;
    end
    else inherited;
end;

procedure TrsSuperCheckBox.CMTextChanged(var Message: TMessage);
begin
  inherited;
  invalidate;
end;

procedure TrsSuperCheckBox.CMSetEnabled(var Message: TMessage);
begin
  inherited;
  Invalidate;
end;

procedure TrsSuperCheckBox.CMFontChanged(var Message: TMessage);
begin
  inherited;
  invalidate;
end;

procedure TrsSuperCheckBox.Paint;
begin
  inherited Paint;
  with Canvas do
  begin
    Brush.color:= Color;
    Brush.style:= bsSolid;
    FillRect(ClientRect);
    if Focused then DrawFocusRect(ClientRect);
  end;
  DrawCaption;
  if (FCheckStyle = csRound) then
    DrawRound
  else
    DrawSquare;
end;

procedure TrsSuperCheckBox.Invalidate;
begin
  ControlStyle:= ControlStyle - [csOpaque];
  inherited Invalidate;
end;

procedure TrsSuperCheckBox.DrawSquare;
var R: TRect;
    SizeBox,y: smallint;
begin
  if (FAutoBox) and (FCheckStyle <> csDefault) then
  begin
    SizeBox:= Height;
    y:= 0;
  end else begin
    SizeBox:= 13;
    y:= (Height - Sizebox) div 2;
  end;

  if FAlignment = taRightJustify then
    R:= Rect(0,y,SizeBox, SizeBox+y)
  else
    R:= Rect(Width-SizeBox,y,Width, SizeBox+y);

  with Canvas do
  begin
    {background}
    Brush.Color:= FBGColor;
    FillRect(R);
    {outer bevel}
    Pen.Width:= 1;
    Pen.Color:= clBtnShadow;
    MoveTo(R.Left,  R.Bottom-1  );
    LineTo(R.Left,  R.Top       );
    MoveTo(R.Left,  R.Top       );
    LineTo(R.Right-1, R.Top     );
    Pen.Color:= clBtnHighlight;
    MoveTo(R.Right-1, R.Top     );
    LineTo(R.Right-1, R.Bottom-1);
    MoveTo(R.Right-1, R.Bottom-1);
    LineTo(R.Left,  R.Bottom-1  );
    {inner bevel}
    InflateRect(R,-1,-1);
    Pen.Color:= clBlack;
    MoveTo(R.Left,  R.Bottom-1  );
    LineTo(R.Left,  R.Top       );
    MoveTo(R.Left,  R.Top       );
    LineTo(R.Right-1, R.Top     );
    Pen.Color:= clBtnFace;
    MoveTo(R.Right-1, R.Top     );
    LineTo(R.Right-1, R.Bottom-1);
    MoveTo(R.Right-1, R.Bottom-1);
    LineTo(R.Left,  R.Bottom-1 );
    {draw checkmark}
    if FChecked then
    begin
      if FAlignment = taRightJustify then
        R:= Rect(0,y,SizeBox, SizeBox+y)
      else
        R:= Rect(Width-SizeBox,y,Width, SizeBox+y);
      InflateRect(R,-4,-4);
      Pen.Color:= FCkColor;
      Pen.Width:= 2;
      if (FCheckStyle = csSquareX) then
      begin
        {default X (d.palette)}
        InflateRect(R,1,1);
        Pen.Width:= 1;
        MoveTo( R.left , R.Top );
        LineTo( R.right , R.bottom );
        MoveTo( R.left , R.bottom-1 );
        LineTo( R.right , R.top-1 );

        MoveTo( R.left+1 , R.Top );
        LineTo( R.right , R.bottom-1 );
        MoveTo( R.left , R.Top+1 );
        LineTo( R.right-1 , R.bottom );

        MoveTo( R.left , R.bottom-2 );
        LineTo( R.right-1 , R.top-1 );
        MoveTo( R.left+1 , R.bottom-1 );
        LineTo( R.right , R.top );
      end
      else if (FCheckStyle = csSquareCheck) then
      begin
        {dans ugly check}
        MoveTo(R.left, ((R.Bottom + R.Top) div 2));
        LineTo(R.left, R.bottom);
        MoveTo(R.left, R.bottom);
        LineTo(R.right, R.top);
      end
      else if (FCheckStyle = csDefault) then
      begin
        {default check mark}
        Pen.Width:= 1;
        InflateRect(R,1,1);
        MoveTo( R.left , R.Top+2 );
        LineTo( R.left+3 , R.bottom-2 );
        MoveTo( R.left , R.Top+3 );
        LineTo( R.left+3 , R.bottom-1 );
        MoveTo( R.left , R.Top+4 );
        LineTo( R.left+3 , R.bottom );

        MoveTo( R.left+3 , R.Top+3 );
        LineTo( R.right , R.top-1 );
        MoveTo( R.left+3 , R.Top+4 );
        LineTo( R.right , R.top );
        MoveTo( R.left+3 , R.Top+5 );
        LineTo( R.right , R.top+1 );
      end
      else if (FCheckStyle = csThinX) then
      begin
        InflateRect(R,1,1);
        Pen.Width:= 1;
        MoveTo( R.left , R.Top );
        LineTo( R.right , R.bottom );
        MoveTo( R.left , R.bottom-1 );
        LineTo( R.right , R.top-1 );
      end;
    Pen.Width:= 1;
    end;
  end;
end;

procedure TrsSuperCheckBox.DrawRound;
var R1, S1, S2: array [1..4] of TPoint;
    R: TRect;
    SizeBox,y: smallint;

  procedure CalcPoints;
  begin
  R1[1].X:= (R.Right + R.Left) div 2;
  R1[1].Y:= R.Top;
  R1[2].X:= R.Right;
  R1[2].Y:= (R.Bottom + R.Top) div 2;
  R1[3].X:= (R.Right + R.Left) div 2;
  R1[3].Y:= R.Bottom;
  R1[4].X:= R.Left;
  R1[4].Y:= (R.Bottom + R.Top) div 2;

  S1[1].X:= R1[1].X;
  S1[1].Y:= R1[1].Y;
  S1[2].X:= (R1[1].X + R1[2].X) div 2;
  S1[2].Y:= (R1[1].Y + R1[2].Y) div 2;
  S1[3].X:= (R1[4].X + R1[3].X) div 2;
  S1[3].Y:= (R1[4].Y + R1[3].Y) div 2;
  S1[4].X:= R1[4].X;
  S1[4].Y:= R1[4].Y;

  S2[1].X:= S1[2].X;
  S2[1].Y:= S1[2].Y;
  S2[2].X:= R1[2].X;
  S2[2].Y:= R1[2].Y;
  S2[3].X:= R1[3].X;
  S2[3].Y:= R1[3].Y;
  S2[4].X:= S1[3].X;
  S2[4].Y:= S1[3].Y;
  end;

begin
  if FAutoBox then begin SizeBox:= Height; y:= 1; end
  else begin SizeBox:= 13; y:= (Height - Sizebox) div 2; end;

  if FAlignment = taRightJustify then R:= Rect(0,y,SizeBox, SizeBox+y)
  else R:= Rect(Width-SizeBox,y,Width, SizeBox+y);

  with Canvas do begin
    {** background **}
    Brush.Color:= FBGColor;
    Pen.Color:= FBGColor;
    if FAlignment = taRightJustify then Ellipse(0,y,SizeBox,SizeBox+y)
    else Ellipse(Width-SizeBox,y,Width,SizeBox+y);
    {** Outer **}
    CalcPoints;
    {gray}
    Pen.Width:= 1;
    Pen.Color:= clBtnShadow;
    Arc(R.Left, R.Top, R.Right, R.Bottom, S1[2].X, S1[2].Y, S1[3].X, S1[3].Y);
    {white}
    Pen.Color:= clBtnHighlight;
    Arc(R.Left, R.Top, R.Right, R.Bottom, S2[4].X, S2[4].Y, S2[1].X, S2[1].Y);

    {** Inner **}
    InflateRect(R, -1, -1);
    CalcPoints;
    {black}
    Pen.Color:= clBlack;
    Arc(R.Left, R.Top, R.Right, R.Bottom, S1[2].X, S1[2].Y, S1[3].X, S1[3].Y);
    {gray}
    Pen.Color:= clBtnFace;
    Arc(R.Left, R.Top, R.Right, R.Bottom, S2[4].X, S2[4].Y, S2[1].X, S2[1].Y);

    {** draw checkmark **}
    if FChecked then begin
      if FAlignment = taRightJustify then R:= Rect(0,y,SizeBox, SizeBox+y)
      else R:= Rect(Width-SizeBox,y,Width, SizeBox+y);
      InflateRect(R, -(SizeBox div 3) , -(SizeBox div 3));
      Brush.Color:= FCkColor;
      Pen.Color:= FCkColor;
      Ellipse(R.Left, R.Top, R.Right, R.Bottom);
      end;
    end;
end;

procedure TrsSuperCheckBox.DrawCaption;
var R: TRect;
    TH, TW: smallint;
    SizeBox, y: smallint;
    Text: array[0..255] of char;
    Flag: word;
begin
  Canvas.Font.Assign(Font);
  TW:= Canvas.TextWidth(UnAccel(Caption));
  TH:= Canvas.TextHeight(UnAccel(Caption));

  if FAutoText and (Length(Caption) > 0) then begin
      Height:= TH+2;
      Width:= TW+TH+MARGIN+2;
      end;

  if FAutoBox then begin SizeBox:= Height-2; y:= 1; end
  else begin SizeBox:= 13; y:= 1; end;

  if FAutoText and (Length(Caption) = 0) then begin
      Width:= SizeBox;
      Height:= SizeBox;
      end;

  if FAlignment = taRightJustify then R:= Rect(SizeBox+MARGIN, y,Width, y+TH)
  else R:= Rect(0,y,Width-SizeBox-MARGIN, y+TH);

  if not Enabled then Canvas.Font.Color:= clGrayText
  else Canvas.Font.Color:= Font.Color;
  with Canvas do begin
    Brush.Style:= bsClear;
    Brush.Color:= Color;
    if FAlignment = taRightJustify then Flag:= DT_LEFT or DT_VCENTER or DT_SINGLELINE
    else Flag:= DT_RIGHT or DT_VCENTER or DT_SINGLELINE;
    end;
  StrPCopy(Text, Caption);
  DrawText(Canvas.Handle, Text, StrLen(Text), R, Flag)
end;

procedure TrsSuperCheckBox.SetCheckStyle(AValue: TCheckStyle);
begin
  FCheckStyle:= AValue;
  Invalidate;
end;

procedure TrsSuperCheckBox.SetGroupID   (AValue: smallint);
begin
  FGroupID:= AValue;
  if FChecked then SetChecked(true);
  Invalidate;
end;

procedure TrsSuperCheckBox.SetGroupUn   (AValue: boolean);
begin
  FGroupUn:= AValue;
  Invalidate;
end;

procedure TrsSuperCheckBox.SetChecked   (AValue: boolean);
var x: smallint;
begin
  if FChecked = AValue then Exit;
  if AValue then
    for x:= 0 to Parent.ControlCount-1 do
      if (Parent.Controls[x] is TrsSuperCheckBox) and (not (Parent.Controls[x] = Self)) then
        if ((Parent.Controls[x] as TrsSuperCheckBox).GroupID > 0) and
           ((Parent.Controls[x] as TrsSuperCheckBox).GroupID = FGroupID) and
           ((Parent.Controls[x] as TrsSuperCheckBox).checked) then begin
          (Parent.Controls[x] as TrsSuperCheckBox).Checked:= false;
          (Parent.Controls[x] as TrsSuperCheckBox).Invalidate;
          end;

  FChecked:= AValue;
  Invalidate;
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TrsSuperCheckBox.SetAutotext  (AValue: boolean);
begin
  FAutoText:= AValue;
  Invalidate;
end;

procedure TrsSuperCheckBox.SetAutoBox  (AValue: boolean);
begin
  FAutoBox:= AValue;
  Invalidate;
end;

procedure TrsSuperCheckBox.SetAutoChk  (AValue: boolean);
begin
  FAutoChk:= AValue;
  Invalidate;
end;

procedure TrsSuperCheckBox.SetAlignment (AValue: TLeftRight);
begin
  FAlignment:= AValue;
  Invalidate;
end;

procedure TrsSuperCheckBox.SetBGColor     (AValue: TColor);
begin
  FBGColor:= AValue;
  Invalidate;
end;

procedure TrsSuperCheckBox.SetCkColor     (AValue: TColor);
begin
  FCkColor:= AValue;
  Invalidate;
end;

end.

