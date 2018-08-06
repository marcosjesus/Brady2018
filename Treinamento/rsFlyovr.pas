{******************************************************}
{                rsFlyOverButton V1.3                  }
{        Copyright 1997 RealSoft Development           }
{           support:  www.realsoftdev.com              }
{******************************************************}

unit rsFlyovr;

interface

{$I REALSOFT.INC}

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Extctrls, Buttons, Menus, stdctrls ;

type
  TButtonState = (bsActive, bsInActive, bsDisabled, bsDown, bsGroupDown);
  TFOBOption = (foAutoPopMenu, foAutoClear, foAutoSize, foTransparent, foAlwaysActive,
                foGroupAllowUp, foCancel, foDefault, foDrawBorder, foDrawDown, foAutoHoldDown,
                foBlackLine);
  TFOBOptions = set of TFOBOption;

  {$IFDEF WIN32}
  {$WARNINGS OFF}
  {$ENDIF}
  TrsFlyOverButton = class(TGraphicControl)
  private
    FState        : TButtonState;
    FOptions	   : TFOBOptions;
    FGlyphA       : TBitmap;
    FGlyphI       : TBitmap;
    FGlyphD       : TBitmap;
    FLayout       : TButtonLayout;
    FSpacing      : smallint;
    FMargin       : smallint;
    FTimer        : TTimer;
    FGroupID      : smallint;
    FModalRes     : TModalResult;
    FPopped       : Boolean;
    FMouseIn      : boolean;
    FOnFlyOver    : TNotifyEvent;
    FOnPopup      : TNotifyEvent;
    FOnHoldDown   : TNotifyEvent;
    FButFocus     : TButton ;
    procedure SetGlyph(Index: integer; AValue : TBitmap);
    procedure SetLayout(AValue: TButtonLayout);
    procedure SetSpacing(AValue: smallint);
    procedure SetMargin(AValue: smallint);
    procedure SetGroupID   (AValue: smallint);
    procedure SetOptions   (AValue: TFOBOptions);
    procedure SetState     (AValue: TButtonState);
    function  ValidGlyph(C : char) : TBitmap;
    procedure CalcRect(var ImgRect : TRect; var TxtRect : TRect);
    procedure DrawButton(ACanvas: TCanvas);
    procedure DrawFrame(Down: Boolean);
    procedure ClearFrame;
    procedure TimerFlag(Sender: TObject);
  protected
    procedure Paint; override;
    procedure Loaded; override;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
    procedure WMLButtonUp(var Message: TWMLButtonUp); message WM_LBUTTONUP;
    procedure CMDialogKey(var Message: TCMDialogKey); message CM_DIALOGKEY;
    procedure CMDialogChar(var Message: TCMDialogChar); message CM_DIALOGCHAR;
    procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Invalidate; override;
    procedure Click; override;
    procedure Down;
    procedure Popup;
    property State         : TButtonState    read FState        write SetState;
  published
    property Options       : TFOBOptions     read FOptions      write SetOptions;
    property GlyphActive   : TBitmap index 1 read FGlyphA       write SetGlyph;
    property GlyphInActive : TBitmap index 2 read FGlyphI       write SetGlyph;
    property GlyphDisabled : TBitmap index 3 read FGlyphD       write SetGlyph;
    property Spacing       : smallint        read FSpacing      write SetSpacing    default 2;
    property Margin        : smallint        read FMargin       write SetMargin     default 2;
    property Layout        : TButtonLayout   read FLayout       write SetLayout     default blGlyphTop;
    property GroupID       : smallint        read FGroupID      write SetGroupID    default 0;
    property ModalResult   : TModalResult    read FModalRes     write FModalRes     default mrNone;
    property Caption;
    property PopUpMenu;
    property Color;
    property Font;
    property Enabled;
    property ParentFont;
    property ParentShowHint;
    property ShowHint;
    property Hint;
    property Visible;
    property OnClick;
    property OnDblClick;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnFlyOver   : TNotifyEvent  read FOnFlyOver write FOnFlyOver;
    property OnPopup     : TNotifyEvent  read FOnPopup write FOnPopup;
    property OnHoldDown  : TNotifyEvent  read FOnHoldDown write FOnHoldDown;
  end;
  {$IFDEF WIN32}
  {$WARNINGS ON}
  {$ENDIF}

procedure Register;

implementation

Uses
   RSEdit ;

procedure Register;
begin
  RegisterComponents('RSD', [TrsFlyOverButton]);
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

procedure DrawTrans(DestCanvas: TCanvas; X,Y: smallint; SrcBitmap: TBitmap; AColor: TColor);
var ANDBitmap, ORBitmap: TBitmap;
    CM: TCopyMode;
    Src: TRect;
begin
  ANDBitmap:= nil;
  ORBitmap:= nil;
  try
  ANDBitmap:= TBitmap.Create;
  ORBitmap:= TBitmap.Create;
  Src  := Bounds(0,0, SrcBitmap.Width, SrcBitmap.Height);
  with ORBitmap do begin
    Width:= SrcBitmap.Width;
    Height:= SrcBitmap.Height;
    Canvas.Brush.Color := clBlack;
    Canvas.CopyMode := cmSrcCopy;
    Canvas.BrushCopy(Src, SrcBitmap, Src, AColor);
    end;
  with ANDBitmap do begin
    Width:= SrcBitmap.Width;
    Height:= SrcBitmap.Height;
    Canvas.Brush.Color := clWhite;
    Canvas.CopyMode := cmSrcInvert;
    Canvas.BrushCopy(Src, SrcBitmap, Src, AColor);
    end;
  with DestCanvas do begin
    CM := CopyMode;
    CopyMode := cmSrcAnd;
    Draw(X,Y, ANDBitmap);
    CopyMode := cmSrcPaint;
    Draw(X,Y, ORBitmap);
    CopyMode := CM;
    end;
  finally
  ANDBitmap.Free;
  ORBitmap.Free;
  end;
end;

constructor TrsFlyOverButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := [csClickEvents, csCaptureMouse, csSetCaption];
  FGlyphA := TBitmap.Create;
  FGlyphI := TBitmap.Create;
  FGlyphD := TBitmap.Create;
  FState := bsInActive;
  Width  := 50;
  Height := 40;
  Color  := clBtnFace;
  FSpacing := 2;
  FMargin := 2;
  FLayout  := blGlyphTop;
  FOptions := [foAutoClear, foGroupAllowUp, foTransparent, foDrawBorder, foDrawDown, foAutoPopmenu];
  FGroupID:= 0;
  FTimer:= NIL;
  FModalRes:= mrNone;

  FButFocus := TButton.Create(Self) ;
  FButFocus.Parent  := TWinControl(AOwner) ;
  FButFocus.Left    := Left ;
  FButFocus.Top     := Top ;
  FButFocus.Width   := 1 ;
  FButFocus.Height  := 1 ;

end;

destructor TrsFlyOverButton.Destroy;
begin
  FGlyphA.Free;
  FGlyphI.Free;
  FGlyphD.Free;
  if FTimer <> NIL then begin FTimer.Free; FTimer:= NIL; end;
  inherited Destroy;
end;

procedure TrsFlyOverButton.Loaded;
begin
  inherited Loaded;
  {$IFDEF DEMO}
  if not DelphiRunning then  {for trial version only}
    showmessage('This program is using an unregistered copy of the TrsFlyOverButton' + #13 +
                'component from RealSoft.  Please register at www.realsoftdev.com' + #13 +
                'or call (949) 831-7879.');

  {$ENDIF}
end;

procedure TrsFlyOverButton.Invalidate;
begin
  if not FGlyphA.Empty then ControlStyle:= ControlStyle - [csOpaque];
  inherited Invalidate;
end;

procedure TrsFlyOverButton.Paint;
begin
  if (not Visible) and (not (csDesigning in Componentstate)) then begin
    inherited Paint;
    Exit;
    end;

  with inherited Canvas do begin
     if (csDesigning in ComponentState) then begin
       DrawFrame(false);
       end;
    {if not enabled, change state before painting}
    if (not Enabled) or (not Parent.Enabled) then FState:= bsDisabled
    else if FState = bsDisabled then FState:= bsInActive;
    {fix state}
    if (not FMousein) and (not FPopped) and (foAlwaysActive in FOptions)
      and (Enabled) and (Parent.Enabled) and (FState <> bsGroupDown) then FState:= bsInActive;
    DrawButton(Canvas);
    end;
end;

function TrsFlyOverButton.ValidGlyph(C : char) : TBitmap;
begin
  Result:= FGlyphA;
  if not (foAutoClear in FOptions) then Exit;
  case C of
    'I': if not FGlyphI.Empty then Result:= FGlyphI;
    'D': if not FGlyphD.Empty then Result:= FGlyphD;
    end;
end;

procedure TrsFlyOverButton.CalcRect(var ImgRect : TRect; var TxtRect : TRect);
var IH, IW, TH, TW : smallint;
begin
  IH:= ImgRect.Bottom - ImgRect.Top;
  IW:= ImgRect.Right - ImgRect.Left;
  TH:= TxtRect.Bottom - TxtRect.Top;
  TW:= TxtRect.Right - TxtRect.Left;
  case FLayout of
    blGlyphTop:
      begin
      ImgRect.Left:=   (Width - IW) div 2;
      ImgRect.Right:=  ImgRect.Left + IW;
      ImgRect.Top:=    FMargin;
      ImgRect.Bottom:= ImgRect.Top + IH;
      TxtRect.Left:=   (Width - TW) div 2;
      TxtRect.Right:=  TxtRect.Left + TW;
      if IH > 0 then   TxtRect.Top:= ImgRect.Bottom + FSpacing
      else             TxtRect.Top:= (Height - TH) div 2;
      TxtRect.Bottom:= TxtRect.Top + TH;
      end;
    blGlyphBottom:
      begin
      ImgRect.Left:=   (Width - IW) div 2;
      ImgRect.Right:=  ImgRect.Left + IW;
      ImgRect.Top:=    Height - (FMargin + IH);
      ImgRect.Bottom:= ImgRect.Top + IH;
      TxtRect.Left:=   (Width - TW) div 2;
      TxtRect.Right:=  TxtRect.Left + TW;
      if IH > 0 then   TxtRect.Top:= ImgRect.Top - (FSpacing + TH)
      else             TxtRect.Top:= (Height - TH) div 2;
      TxtRect.Bottom:= TxtRect.Top + TH;
      end;
    blGlyphLeft:
      begin
      ImgRect.Top:=    (Height - IH) div 2;
      ImgRect.Bottom:= ImgRect.Top + IH;
      ImgRect.Left:=   FMargin;
      ImgRect.Right:=  ImgRect.Left + IW;
      TxtRect.Top:=    (Height - TH) div 2;
      TxtRect.Bottom:= TxtRect.Top + TH;
      if IW > 0 then   TxtRect.Left:= ImgRect.Right + FSpacing
      else             TxtRect.Left:= (Width - TW) div 2;
      TxtRect.Right:=  TxtRect.Left + TW;
      end;
    blGlyphRight:
      begin
      ImgRect.Top:=    (Height - IH) div 2;
      ImgRect.Bottom:= ImgRect.Top + IH;
      ImgRect.Left:=   Width - (FMargin + IW);
      ImgRect.Right:=  ImgRect.Left + IW;
      TxtRect.Top:=    (Height - TH) div 2;
      TxtRect.Bottom:= TxtRect.Top + TH;
      if IW > 0 then   TxtRect.Left:=   ImgRect.Left - (FSpacing + TW)
      else             TxtRect.Left:= (Width - TW) div 2;
      TxtRect.Right:=  TxtRect.Left + TW;
      end;
    end;
end;

procedure TrsFlyOverButton.DrawButton(ACanvas: TCanvas);
var B,I,T    : TRect;
    TmpBMP   : TBitmap;
    TRColor  : TColor;
    TxtBuf   : array[0..255] of char;
    ACaption : String[255];
    tmpstate : TButtonState;
begin
  ACaption:= UnAccel(Caption);
  StrPCopy(TxtBuf, Caption);
  tmpstate:= FState;
  if (foAlwaysActive in FOptions) and (tmpstate = bsInActive) then tmpstate:= bsActive;

  ACanvas.Font.Assign(Font);
  with ACanvas do begin
    Brush.Style:= bsClear;
    case tmpstate of
      {** Draw Active **}
      bsActive:
        begin
        TmpBMP:= ValidGlyph('A');
        if foDrawBorder in FOptions then DrawFrame(false);
        B:= Rect(0,0,TmpBMP.Width,TmpBMP.Height);
        I:= B;
        T:= Rect(0,0,TextWidth(ACaption), TextHeight(ACaption));
        CalcRect(I,T);
        if (TmpBmp.Height < 1) or (TmpBmp.Width < 1) then TRColor:= clOlive
        else TRColor:= TmpBmp.Canvas.Pixels[0,TmpBmp.Height-1];
        if foTransparent in FOptions then
          DrawTrans(ACanvas, I.Left, I.Top, TmpBMP, TRColor)
        else
          Draw(I.Left, I.Top, Tmpbmp);
        DrawText(Canvas.Handle, TxtBuf, StrLen(TxtBuf), T, DT_SINGLELINE);
        end;
      {** Draw Down **}
      bsDown, bsGroupDown:
        begin
        TmpBMP:= ValidGlyph('A');
        if foDrawBorder in FOptions then DrawFrame(true);
        B:= Rect(0,0,TmpBMP.Width,TmpBMP.Height);
        I:= B;
        T:= Rect(0,0,TextWidth(ACaption), TextHeight(ACaption));
        CalcRect(I,T);
        if foDrawDown in FOptions then
        begin
          OffsetRect(I,1,1);
          OffsetRect(T,1,1);
        end;
        if (TmpBmp.Height < 1) or (TmpBmp.Width < 1) then TRColor:= clOlive
        else TRColor:= TmpBmp.Canvas.Pixels[0,TmpBmp.Height-1];
        if foTransparent in FOptions then
          DrawTrans(ACanvas, I.Left, I.Top, TmpBMP, TRColor)
        else
          Draw(I.Left, I.Top, Tmpbmp);
        DrawText(Canvas.Handle, TxtBuf, StrLen(TxtBuf), T, DT_SINGLELINE);
        end;
      {** Draw InActive **}
      bsInActive:
        begin
        TmpBMP:= ValidGlyph('I');
        if (foAutoSize in FOptions) and (TmpBMP.Width > 8) and (TmpBMP.Height > 8) then
        begin
          Width:= TmpBMP.Width + 4;
          Height:= TmpBMP.Height + 4;
        end;
        B:= Rect(0,0,TmpBMP.Width,TmpBMP.Height);
        I:= B;
        T:= Rect(0,0,TextWidth(ACaption), TextHeight(ACaption));
        CalcRect(I,T);
        if (TmpBmp.Height < 1) or (TmpBmp.Width < 1) then TRColor:= clOlive
        else TRColor:= TmpBmp.Canvas.Pixels[0,TmpBmp.Height-1];
        if foTransparent in FOptions then
          DrawTrans(ACanvas, I.Left, I.Top, TmpBMP, TRColor)
        else
          Draw(I.Left, I.Top, Tmpbmp);
        DrawText(Canvas.Handle, TxtBuf, StrLen(TxtBuf), T, DT_SINGLELINE);
        end;
      {** Draw Disabled **}
      bsDisabled:
        begin
        TmpBMP:= ValidGlyph('D');
        if (foAlwaysActive in FOptions) and (foDrawBorder in FOptions) then DrawFrame(false);
        B:= Rect(0,0,TmpBMP.Width,TmpBMP.Height);
        I:= B;
        T:= Rect(0,0,TextWidth(ACaption), TextHeight(ACaption));
        CalcRect(I,T);
        if (TmpBmp.Height < 1) or (TmpBmp.Width < 1) then TRColor:= clOlive
        else TRColor:= TmpBmp.Canvas.Pixels[0,TmpBmp.Height-1];
        if foTransparent in FOptions then
          DrawTrans(ACanvas, I.Left, I.Top, TmpBMP, TRColor)
        else
          Draw(I.Left, I.Top, Tmpbmp);
        Font.Color:= clbtnShadow;
        DrawText(Canvas.Handle, TxtBuf, StrLen(TxtBuf), T, DT_SINGLELINE);
        OffsetRect(T,1,1);
        Font.Color:= clbtnHighlight;
        DrawText(Canvas.Handle, TxtBuf, StrLen(TxtBuf), T, DT_SINGLELINE);
        end;
      end;
    end;
end;

procedure TrsFlyOverButton.DrawFrame(Down: Boolean);
begin
  with Canvas do
  begin
    if Down then
    begin
      if foBlackline in FOptions then
        Pen.Color:= clBlack
      else
        Pen.Color:= clBtnShadow;
      MoveTo(0,0); LineTo(ClientRect.Right-1,0);
      MoveTo(0,0); LineTo(0,ClientRect.Bottom-1);
      Pen.Color:= clBtnHighlight;
      MoveTo(ClientRect.Right-1,1); LineTo(ClientRect.Right-1,ClientRect.Bottom);
      MoveTo(1,ClientRect.Bottom-1); LineTo(ClientRect.Right-1,ClientRect.Bottom-1);
      end else
    begin
      Pen.Color:= clBtnHighlight;
      MoveTo(0,0); LineTo(ClientRect.Right-1,0);
      MoveTo(0,0); LineTo(0,ClientRect.Bottom-1);
      if foBlackline in FOptions then
        Pen.Color:= clBlack
      else
        Pen.Color:= clBtnShadow;
      MoveTo(ClientRect.Right-1,1); LineTo(ClientRect.Right-1,ClientRect.Bottom);
      MoveTo(1,ClientRect.Bottom-1); LineTo(ClientRect.Right-1,ClientRect.Bottom-1);
    end;
  end;
end;

procedure TrsFlyOverButton.ClearFrame;
begin
  with Canvas do begin
    Pen.Color:= clBtnFace;
    MoveTo(0,0); LineTo(ClientRect.Right-1,0);
    MoveTo(0,0); LineTo(0,ClientRect.Bottom-1);
    MoveTo(ClientRect.Right-1,1); LineTo(ClientRect.Right-1,ClientRect.Bottom);
    MoveTo(1,ClientRect.Bottom-1); LineTo(ClientRect.Right-1,ClientRect.Bottom-1);
    end;
end;

procedure TrsFlyOverButton.CMTextChanged(var Message: TMessage);
begin
  inherited;
  invalidate;
end;

procedure TrsFlyOverButton.CMFontChanged(var Message: TMessage);
begin
  inherited;
  invalidate;
end;

procedure TrsFlyOverButton.CMDialogChar(var Message: TCMDialogChar);
begin
  with Message do
    if IsAccel(CharCode, Caption) and Enabled and (Parent.Enabled) then begin
      if PopupMenu <> nil then
        Perform(WM_LBUTTONDOWN,0,0)
      else Click;
      Result := 1;
      end
  else inherited;
end;

procedure TrsFlyOverButton.CMMouseEnter(var Message: TMessage);
Var
   Comp : TComponent ;
begin
  inherited;
  Comp := Screen.ActiveControl ;
  If ( Comp Is TrsSuperEdit ) Then
    TrsSuperEdit(Comp).ValidateData ;
  FMouseIn:= true;
  if (FState = bsDisabled) or (not Enabled) or (not Parent.Enabled) then Exit;
  if Assigned(FOnFlyOver) then FOnFlyOver(Self);
  if (FState = bsGroupDown) then Exit;
  FState:= bsActive;
  if (foAlwaysActive in FOptions) then Exit;
  if foAutoClear in FOptions then Invalidate
  else Paint;
end;

procedure TrsFlyOverButton.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  FMouseIn:= false;
  if (FState = bsDisabled) or (not Enabled) or (not Parent.Enabled) then Exit;
  if (FState = bsGroupDown) then Exit;
  FState:= bsInActive;
  if foAutoClear in FOptions then Invalidate
  else ClearFrame;
end;

procedure TrsFlyOverButton.WMLButtonDown(var Message: TWMLButtonDown);
begin
  inherited;
  {Timer for HoldDown event}
  if Assigned(FOnHoldDown) or (foAutoHoldDown in FOptions) then
  begin
    if FTimer <> NIL then begin FTimer.Free; FTimer:= NIL; end;
    FTimer:= TTimer.Create(Self);
    FTimer.Interval:= 100;
    FTimer.OnTimer:= TimerFlag;
    FTimer.Enabled:= true;
  end;
  {draw button down}
  Down;
  Popup;
end;

procedure TrsFlyOverButton.WMLButtonUp(var Message: TWMLButtonUp);
Var
  Comp : TWinControl ;
begin
  inherited;
  Comp := Screen.ActiveControl ;
     FButFocus.SetFocus ;
  try
  Comp.SetFocus ;
  except
  end;
  if FTimer <> NIL then begin FTimer.Free; FTimer:= NIL; end;
  if (FState = bsGroupDown) then Exit;
  if FMouseIn then FState:= bsActive
  else FState:= bsInActive;
  with Canvas do begin
    Brush.Style:= bsSolid;
    Brush.Color:= Color;
    FillRect(ClientRect)
    end;
  Invalidate;
end;

procedure TrsFlyOverButton.SetGlyph(Index: integer; AValue : TBitmap);
begin
  case Index of
    1: FGlyphA.Assign(AValue);
    2: FGlyphI.Assign(AValue);
    3: FGlyphD.Assign(AValue);
    end;
  Invalidate;
end;

procedure TrsFlyOverButton.SetOptions  (AValue: TfobOptions);
begin
  FOptions:= AValue;
  Invalidate;
end;

procedure TrsFlyOverButton.SetLayout(AValue: TButtonLayout);
begin
  if AValue <> FLayout then begin
    FLayout := AValue;
    Invalidate;
    end;
end;

procedure TrsFlyOverButton.SetSpacing(AValue: Smallint);
begin
  if AValue <> FSpacing then begin
    FSpacing := AValue;
    Invalidate;
    end;
end;

procedure TrsFlyOverButton.SetMargin(AValue: Smallint);
begin
  if AValue <> FMargin then begin
    FMargin := AValue;
    Invalidate;
    end;
end;

procedure TrsFlyOverButton.SetGroupID   (AValue: smallint);
begin
  FGroupID:= AValue;
  Invalidate;
end;

procedure TrsFlyOverButton.SetState     (AValue: TButtonState);
begin
  FState:= AValue;
  Invalidate;
end;

procedure TrsFlyOverButton.Click;
var F: TWinControl;
begin
  inherited Click;
  {Modal result}
  F:= GetParentForm(Self);
  if F <> NIL then
    if FModalRes <> mrNone then begin
      (F as TForm).ModalResult:= FModalRes;
      end;
end;

procedure TrsFlyOverButton.CMDialogKey(var Message: TCMDialogKey);
begin
  with Message do
    if  (((CharCode = VK_RETURN) and (foDefault in FOptions)) or
      ((CharCode = VK_ESCAPE) and (foCancel in FOptions))) and
      (KeyDataToShiftState(Message.KeyData) = []) then begin
      Click;
      Popup;
      Result := 1;
    end else inherited;
end;

procedure TrsFlyOverButton.TimerFlag(Sender: TObject);
begin
  if foAutoHoldDown in FOptions then Click;
  if Assigned(FOnHoldDown) then FOnHoldDown(Self);
end;

procedure TrsFlyOverButton.Popup;
var pt: TPoint;
begin
  if (foAutoPopMenu in FOptions) and (FGroupID < 1) then {setup popup menu}
    if PopupMenu <> NIL then begin
      State:= bsDown;
      FPopped:= true;
      pt.X:= Left-1;
      pt.Y:= Top + Height;
      pt:= Parent.ClienttoScreen(pt);
      PopupMenu.PopupComponent:= Self;
      {call event handler}
      if Assigned(FOnPopup) then FOnPopup(Self);
      {do popping}
      PopupMenu.PopUp(Pt.X, pt.Y);
      FPopped:= false;
      {reset button}
      State:= bsInActive;
      end;
end;

procedure TrsFlyOverButton.Down;
var x: smallint;
begin
  {change state to down}
  if (FState <> bsDown) and (FState <> bsGroupDown) then State:= bsDown;
  {Group Mode}
  if FGroupID > 0 then
  begin
    if (FState = bsGroupDown) and (foGroupAllowUp in FOptions) then
    begin
      {reset button}
      State:= bsInActive;
    end
    else begin
      for x:= 0 to Parent.ControlCount-1 do
        if (Parent.Controls[x] is TrsFlyOverButton) and (not (Parent.Controls[x] = Self)) then
          if ((Parent.Controls[x] as TrsFlyOverButton).GroupID > 0) and
             ((Parent.Controls[x] as TrsFlyOverButton).GroupID = FGroupID) and
             ((Parent.Controls[x] as TrsFlyOverButton).State = bsGroupDown) then
            (Parent.Controls[x] as TrsFlyOverButton).State:= bsInActive;
        State:= bsGroupDown
    end;
  end;
end;


end.
