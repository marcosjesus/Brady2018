{******************************************************}
{                   rsTabSet V1.0                      }
{        Copyright 1997 RealSoft Development           }
{           support:  www.realsoftdev.com              }
{******************************************************}

unit rsTabset;

interface

{$I REALSOFT.INC}

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Menus, Buttons, ExtCtrls, DsgnIntf, rsPage, Realproc, rsImgLst;

const
  MARGIN = 2;

type
  EIndexError = class(Exception);

  TTabOrient = ( toBottom, toTop );
  TTabChangedEvent = procedure(Sender: TObject; NewTab: Integer;
                               var AllowChange: Boolean) of object;

  TrsTabset = class(TCustomControl)
  private
    FOrient: TTabOrient;
    FBackColor: TColor;
    FTabColor: TColor;
    FTabHeight: Integer;
    FTabWidth: Integer;
    FTabs: TStrings;
    FTabIndex: Integer;
    FMultiLine: boolean;
    FTextAlign: TAlignment;
    FLButton: TSpeedButton;
    FRButton: TSpeedButton;
    FScrollX: Longint;
    FAutoSize: boolean;
    FNotebook: TNotebook;
    FPageBox: TrsPageBox;
    FGlyphID: char;
    FOnChange: TTabChangedEvent;
    FTransp: boolean;
    FBGTile: TBitmap;
    FMATile: TBitmap;
    FImages: TrsImageList;
    FAutoNB: boolean;
    procedure SetOrient     ( Value: TTabOrient );
    procedure SetBackColor  ( Value: TColor     );
    procedure SetTabColor   ( Value: TColor     );
    procedure SetTabHeight  ( Value: Integer    );
    procedure SetTabWidth   ( Value: Integer    );
    procedure SetTabs       ( Value: TStrings   );
    procedure SetTabIndex   ( Value: Integer    );
    procedure SetMultiLine  ( Value: Boolean    );
    procedure SetAutoSize   ( Value: Boolean    );
    procedure SetTransp     ( Value: Boolean    );
    procedure SetAutoNB     ( Value: Boolean    );
    procedure SetTextAlign  ( Value: TAlignment );
    procedure SetNotebook   ( Value: TNotebook  );
    procedure SetPageBox    ( Value: TrsPageBox );
    procedure SetBGTile     ( Value: TBitmap    );
    procedure SetMATile     ( Value: TBitmap    );
    procedure SetImages     ( Value: TrsImageList);
    procedure HideBtns;
    procedure ShowBtns;
    procedure SizeNB;
    procedure ChangeTab(NewTab: smallint);
    procedure LClick(Sender: TObject);
    procedure RClick(Sender: TObject);
    function  FindSTab(XPos: smallint): smallint;
    function  FindMTab(XPos, YPos: smallint): smallint;
    function  GetTabHeight(ACanvas: TCanvas; Idx: smallint): smallint;
    function  GetTabWidth(ACanvas: TCanvas; Idx: smallint): smallint;
    function  GetTabLeft(ACanvas: TCanvas; Idx: smallint): smallint;
    procedure GetRowCount(var count, selrow, tabsperrow: smallint);
    procedure GetRow(rownum: smallint; var tstart, tcount, twidth: smallint);
    procedure DrawSTab(ACanvas: TCanvas; Sel: Boolean; Index: Integer);
    procedure DrawMTab(ACanvas: TCanvas; Sel: Boolean; Index: Integer; row,tnum,twidth,taby: smallint);
    procedure DrawGlyphs(Text: String; ACanvas: TCanvas; ARect: TRect);
    function  StripID(S: String): String;
    function  GetNextID(ID: Char; S: String; var Index: smallint): char;
  protected
    procedure Loaded; override;
    procedure Paint; override;
    procedure DrawTab(ACanvas: TCanvas; Sel: Boolean; Text: String; X,Y,H,W: smallint); virtual;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure WMMouseDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
    procedure CMDialogChar(var Message: TCMDialogChar); message CM_DIALOGCHAR;
    procedure Notification( AComponent : TComponent; Operation : TOperation); override;
    procedure CreateParams(var Params: TCreateParams); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Invalidate; override;
  published
    property GlyphIdent:  Char            read FGlyphID     write FGlyphID	default '^';
    property TabOrient:   TTabOrient      read FOrient      write SetOrient	default toTop;
    property BackColor:   TColor          read FBackColor   write SetBackColor	default clBtnFace;
    property TabColor:    TColor          read FTabColor    write SetTabColor	default clBtnFace;
    property TabHeight:   Integer         read FTabHeight   write SetTabHeight	default 18;
    property TabWidth:    Integer         read FTabWidth    write SetTabWidth	default 80;
    property MultiLine:   boolean         read FMultiLine   write SetMultiLine	default False;
    property TextAlign:   TAlignment      read FTextAlign   write SetTextAlign	default taCenter;
    property AutoSize:    boolean         read FAutoSize    write SetAutoSize	default true;
    property Transparent: boolean         read FTransp      write SetTransp	default false;
    property AutoAlignNB: boolean         read FAutoNB      write SetAutoNB	default true;
    property TabIndex:    Integer         read FTabIndex    write SetTabIndex;
    property Notebook:    TNotebook       read FNotebook    write SetNotebook;
    property Pagebox:     TrsPageBox      read FPageBox     write SetPageBox;
    property BackTile:	  TBitmap	  read FBGTile      write SetBGTile;
    property MainTile:	  TBitmap	  read FMATile      write SetMATile;
    property Images:	  TrsImageList	  read FImages      write SetImages;
    property Tabs:        TStrings        read FTabs        write SetTabs;
    property Align;
    property Font;
    property Enabled;
    property PopUpMenu;
    property ParentFont;
    property ParentShowHint;
    property ShowHint;
    property Hint;
    property Visible;
    property OnChange: TTabChangedEvent   read FOnChange    write FOnChange;
    property OnClick;
    property OnEnter;
    property OnExit;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
  end;

  TrsTabsetEditor = class(TComponentEditor)
    function GetVerbCount : Integer; override;
    function GetVerb( Index : Integer ) : string; override;
    procedure ExecuteVerb( Index : Integer ); override;
    end;


procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('RSD', [TrsTabset]);
  RegisterComponentEditor( TrsTabset, TrsTabsetEditor );
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


{********************************}
{    Component Editor Section    }
{********************************}
function TrsTabsetEditor.GetVerbCount : Integer;
begin
  Result := 2;
end;

function TrsTabsetEditor.GetVerb( Index : Integer ) : string;
begin
  case Index of
    0: Result := '&Next Tab';
    1: Result := '&Prev Tab';
  end;
end;

procedure TrsTabsetEditor.ExecuteVerb( Index : Integer );
var rsTabSet: TrsTabSet;
begin
  rsTabSet:= (Component as TrsTabSet);
  case index of
    0: begin
       if rsTabSet.TabIndex < rsTabSet.Tabs.Count-1 then rsTabSet.TabIndex:= rsTabSet.TabIndex + 1
       else if rsTabSet.Tabs.Count > 0 then rsTabSet.TabIndex:= 0;
       end;
    1: begin
       if rsTabSet.TabIndex > 0 then rsTabSet.TabIndex:= rsTabSet.TabIndex - 1
       else rsTabSet.TabIndex:= rsTabSet.Tabs.Count-1;
       end;
    end;
end;

{********************************}
{       Component Source         }
{********************************}
constructor TrsTabset.Create(AOwner: TComponent);
var Bitmap     : TBitmap;
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csClickEvents, csCaptureMouse, csAcceptsControls];
  Width        := 145;
  Height       := 177;
  FOrient      := toTop;
  FMultiLine   := false;
  FBackColor   := clbtnFace;
  Color        := clbtnFace;
  FTabColor    := clbtnFace;
  FTabHeight   := 18;
  FTabWidth    := 80;
  FTabIndex    := 0;
  FScrollX     := 0;
  FTextAlign   := taCenter;
  FAutoSize    := true;
  FGlyphId     := '^';
  FTabs        := TStringList.Create;
  FBGTile      := TBitmap.create;
  FMATile      := TBitmap.create;
  FTransp      := false;
  FAutoNB      := true;
  FTabs.Add('rsTabset');
  FLButton     := TSpeedButton.Create(self);
  FLButton.Caption:= '';
  FLButton.Width:= 16;
  FLButton.Height:= 16;
  FLButton.Parent:= Self;
  FLButton.OnClick:= LClick;
  FRButton     := TSpeedButton.Create(Self);
  FRButton.Caption:= '';
  FRButton.Width:= 16;
  FRButton.Height:= 16;
  FRButton.Parent:= Self;
  FRButton.OnClick:= RClick;
  {left arrow}
  Bitmap:= nil;
  try Bitmap:= TBitmap.Create;
  Bitmap.Width:= 8;
  Bitmap.Height:= 8;
  Bitmap.Canvas.Brush.Style:= bsSolid;
  Bitmap.Canvas.Brush.Color:= clBlack;
  Bitmap.Canvas.Pen.Color:= clBlack;
  Bitmap.Canvas.Pen.Style:= psSolid;
  Bitmap.Canvas.Pen.Width:= 1;
  Bitmap.Canvas.Polygon([Point(1, 3), Point(6, 1), Point(6, 6)]);
  FLButton.NumGlyphs:= 1;
  FLButton.Glyph.Assign(Bitmap);
  finally Bitmap.Free; end;
  {right arrow}
  try Bitmap:= TBitmap.Create;
  Bitmap.Width:= 8;
  Bitmap.Height:= 8;
  Bitmap.Canvas.Brush.Style:= bsSolid;
  Bitmap.Canvas.Brush.Color:= clBlack;
  Bitmap.Canvas.Pen.Color:= clBlack;
  Bitmap.Canvas.Pen.Style:= psSolid;
  Bitmap.Canvas.Pen.Width:= 1;
  Bitmap.Canvas.Polygon([Point(1, 1), Point(6, 3), Point(1, 6)]);
  FRButton.NumGlyphs:= 1;
  FRButton.Glyph.Assign(Bitmap);
  finally Bitmap.Free; end;
  HideBtns;
end;


procedure TrsTabset.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
  begin
{    ExStyle := ExStyle or WS_EX_TRANSPARENT;}
  end;
end;

destructor TrsTabset.Destroy;
begin
  FTabs.Free;
  FMATile.free;
  FBGTile.free;
  inherited Destroy;
end;

procedure TrsTabset.Loaded;
begin
  inherited Loaded;
  if FAutoNB then SizeNB;
  {$IFDEF DEMO}
  if not DelphiRunning then  {for trial version only}
    showmessage('This program is using an unregistered copy of the TrsTabset' + #13 +
                'component from RealSoft.  Please register at www.realsoftdev.com' + #13 +
                'or call (949) 831-7879.');
  {$ENDIF}
end;

procedure TrsTabset.WMSize(var Message: TWMSize);
begin
  inherited;
  FLButton.Left:= Width-(FLButton.Width*2);
  FLButton.Top:= 0;
  FRButton.Left:= Width-FRButton.Width;
  FRButton.Top:= 0;
  if FAutoNB then SizeNB;
end;

procedure TrsTabset.SetTransp( Value: Boolean    );
begin
  FTransp:= Value;
  if Value then
    ControlStyle := ControlStyle - [csOpaque]
  else
    ControlStyle := ControlStyle + [csOpaque];
  Invalidate;
end;

procedure TrsTabset.SetAutoNB( Value: Boolean    );
begin
  FAutoNB:= Value;
  SizeNB;
end;

function TrsTabset.GetTabHeight(ACanvas: TCanvas; Idx: smallint): smallint;
begin
  Result:= ACanvas.TextHeight(FTabs[Idx]);
  if Result < FTabHeight then Result:= FTabHeight;
  if (not FAutoSize) or MultiLine then Result:= FTabHeight;
  if Idx = FTabIndex then Result:= Result + 3;
end;

function TrsTabset.GetTabWidth(ACanvas: TCanvas; Idx: smallint): smallint;
begin
  Result:= ACanvas.TextWidth(UnAccel(FTabs[Idx]))+MARGIN*2;
  if Result < TabWidth then Result:= FTabWidth;
  if (not FAutoSize) or MultiLine then Result:= FTabWidth;
  if Idx = FTabIndex then Result:= Result + 2;
end;

function TrsTabset.GetTabLeft(ACanvas: TCanvas; Idx: smallint): smallint;
var i: smallint;
begin
  result:= 0;
  for i:= 0 to idx-1 do begin
    Result:= result + GetTabWidth(ACanvas, i)+1;
    if i = FTabIndex then Result:= Result - 2;
    end;
  if Idx = FTabIndex then Result:= Result - 1;
end;

procedure TrsTabset.GetRowCount(var count, selrow, tabsperrow: smallint);
begin
  TabsPerRow:= Width div FTabWidth;
  if TabsPerRow < 1 then TabsPerRow:= 1;
  count:= (Tabs.Count div TabsPerRow);
  if (Tabs.Count mod TabsPerRow) > 0 then inc(count);
  if FTabIndex < 0 then selrow:= count {default}
  else selrow:= ((FTabIndex) div TabsPerRow)+1;
end;

procedure TrsTabset.GetRow(rownum: smallint; var tstart, tcount, twidth: smallint);
var rowcount, selrow, tabsperrow: smallint;
begin
  GetRowCount(rowcount, selrow, tabsperrow);
  {virtual row may be different}
  if selrow < rowcount then begin
    if (rownum >= selrow) and (rownum < rowcount) then inc(rownum)
    else if rownum = rowcount then rownum:= selrow;
    end;
  {calculate based on virtual row}
  tstart:= (rownum-1) * tabsperrow;
  if rownum = rowcount then tcount:= FTabs.Count - tstart
  else tcount:= tabsperrow;
  if tcount < tabsperrow then twidth:= width div tcount
  else twidth:= width div tabsperrow;
  Dec(twidth);
end;

procedure TrsTabset.Invalidate;
begin
  inherited Invalidate;
  if FNotebook <> NIL then FTabs.Assign(FNotebook.Pages);
  if FPagebox <> NIL then FTabs.Assign(FPageBox.Pages);
end;

procedure TrsTabset.Paint;
var i,j,x,max: smallint;
    count, selrow, tabsperrow, tstart, tcount, twidth, taby: smallint;
    R: TRect;
    tmpbmp: TBitmap;
begin
  Canvas.Font.Assign(Font);

  {buttons}
  if FTabs.Count > 0 then begin
    max:= GetTabLeft(Canvas, FTabs.Count-1) + GetTabWidth(Canvas, FTabs.Count-1);
    if (max > Width) and (not FMultiLine) then ShowBtns
    else HideBtns;
    end;

  inherited Paint;
  {behind tabs}
  case FOrient of
    toBottom : R:= Rect(0,Height-(FTabHeight+1),Width, Height);
    toTop : R:= Rect(0,0,Width, FTabHeight+1);
  end;
  if not FTransp then
  begin
    tmpbmp:= nil;
    try
      tmpbmp:= TBitmap.create;
      tmpbmp.assign(FBGTile);
      tmpbmp.Height:= FTabHeight+1;
      with Canvas do
      begin
        Brush.Style:= bsSolid;
        Brush.Color:= BackColor;
        if tmpbmp.empty then
          FillRect(R)
        else begin
          for x:= 0 to Width div tmpbmp.Width do Draw(x*tmpbmp.Width, R.Top, tmpbmp);
        end;
      end;
      finally
        tmpbmp.free;
      end;
  end;
  {inside area}
  case FOrient of
    toBottom : R:= Rect(0,0,Width, Height-(FTabHeight+2));
    toTop : R:= Rect(0,FTabHeight+1,Width, Height);
  end;
  with Canvas do begin
    Brush.Style:= bsSolid;
    Brush.Color:= BackColor;
    FillRect(R);
    Pen.Width:= 1;
    case FOrient of
      toBottom : begin
        Pen.Color:= clbtnShadow;
        MoveTo(0,Height-(FTabHeight+4)); LineTo(Width, Height-(FTabHeight+4));
        Pen.Color:= clbtnHighlight;
        MoveTo(0,0); LineTo(Width, 0);
        Pen.Color:= clbtnHighlight;
        MoveTo(0,0); LineTo(0, Height-(FTabHeight+3));
        Pen.Color:= clbtnShadow;
        MoveTo(Width-1,0); LineTo(Width-1, Height-(FTabHeight+3));
        end;
      toTop : begin
        Pen.Color:= clbtnHighlight;
        MoveTo(0,FTabHeight+1); LineTo(Width, FTabHeight+1);
        Pen.Color:= clbtnShadow;
        MoveTo(0,Height-1); LineTo(Width, Height-1);
        Pen.Color:= clbtnHighlight;
        MoveTo(0,FTabHeight+1); LineTo(0, Height-1);
        Pen.Color:= clbtnShadow;
        MoveTo(Width-1,FTabHeight+1); LineTo(Width-1, Height-1);
        end;
       end;

    if FTabs.Count = 0 then Exit;

    {straight}
    if not FMultiline then begin
      for i:= 0 to FTabs.Count - 1 do
          if i <> FTabIndex then DrawSTab(Canvas, false, i);
      if FTabIndex > -1 then DrawSTab(Canvas, true, FTabIndex);
      end
    {multiline}
    else begin
      GetRowCount(count, selrow, tabsperrow);
{      taby:= Height - (count*FTabHeight) - 1;}
      taby:= 0;
      for i:= 1 to count do begin
        GetRow(i, tstart, tcount, twidth);
        for j:= tstart to tstart+tcount-1 do
          if j <> FTabIndex then DrawMTab(Canvas, false, j, i, j-tstart+1, twidth, taby)
          else DrawMTab(Canvas, true, j, i, j-tstart+1, twidth, taby);
        end;
      end;
    end;
end;

procedure TrsTabset.DrawSTab(ACanvas: TCanvas; Sel: Boolean; Index: Integer);
var X,Y,H,W: smallint;
begin
  H:= GetTabHeight(ACanvas, Index);
  W:= GetTabWidth(ACanvas, Index);
  X:= GetTabLeft(ACanvas, Index) - FScrollX;
  Y:= 0;
  if x < 0 then x:= 0; {fix left edge jack}
  case FOrient of
    toBottom : begin
               {Y:= 1} Y:= Height-(H+3);
               if Sel then
                 begin
                 inc(y);
                 inc(H);
                 end;
               end;
    toTop:     begin
               {Y:= Height-H-1} Y:= 1;
               if Sel then
                 begin
                 dec(y);
                 dec(H);
                 end;
               end;
    end;

  DrawTab(ACanvas, Sel, FTabs[Index], X,Y,H,W);
end;

procedure TrsTabset.DrawMTab(ACanvas: TCanvas; Sel: Boolean; Index: Integer; row,tnum,twidth,taby: smallint);
var X,Y,H: smallint;
begin
  H:= FTabHeight;
  X:= (tnum-1) * (twidth+1);
  {if Border = tbLine then Y:= Taby+((Row-1) * H)
  else Y:= Taby+((Row-1) * H)-1;}
  Y:= 0;
  if Sel then begin
    Dec(Y);
    Inc(H,2);
    end;
  DrawTab(ACanvas, Sel, FTabs[Index], X,Y,H,twidth);
end;

procedure TrsTabset.DrawTab(ACanvas: TCanvas; Sel: Boolean; Text: String; X,Y,H,W: smallint);
var R,G,T: TRect;
    TW,TH: smallint;
    TxtBuf: array[0..255] of char;
begin
  TW:= ACanvas.TextWidth(UnAccel(Text));
  TH:= ACanvas.TextHeight(UnAccel(Text));
  StrPCopy(TxtBuf, StripID(Text));
  {Paint it}
  with ACanvas do begin
    case FOrient of
    toBottom : begin
      R:= Rect( X, Y, X+W, Y+H );
      Brush.Color:= TabColor;
      FillRect(R);
      case FTextAlign of
        taRightJustify: begin
          T:= Rect(X+W-TW-MARGIN, Y+((H-TH) div 2), R.Right, R.Bottom);
          DrawText(ACanvas.Handle, TxtBuf, StrLen(TxtBuf), T, DT_SINGLELINE);
          G:= R; G.Left:= T.Left; G.Right:= T.Right;
          DrawGlyphs(Text, ACanvas, G);
          end;
        taCenter: begin
          T:= Rect(X+((W-TW) div 2), Y+((H-TH) div 2), R.Right, R.Bottom);
          DrawText(ACanvas.Handle, TxtBuf, StrLen(TxtBuf), T, DT_SINGLELINE);
          G:= R; G.Left:= T.Left; G.Right:= T.Right;
          DrawGlyphs(Text, ACanvas, G);
          end;
        else begin
          T:= Rect(X+MARGIN, Y+((H-TH) div 2), R.Right, R.Bottom);
          DrawText(ACanvas.Handle, TxtBuf, StrLen(TxtBuf), T, DT_SINGLELINE);
          G:= R; G.Left:= T.Left; G.Right:= T.Right;
          DrawGlyphs(Text, ACanvas, G);
          end;
        {taRightJustify: TextRect( R, X+W-TW-MARGIN, Y+((H-TH) div 2), Text );
        taCenter: TextRect( R, X+((W-TW) div 2), Y+((H-TH) div 2), Text );
        else TextRect( R, X+MARGIN, Y+((H-TH) div 2), Text );}
        end;
      Pen.Color:= FBackColor;
      Pixels[X,Y+H-1]:= Pen.Color;
      Pen.Color:= clbtnHighlight;
      MoveTo(X,Y);      LineTo(X, Y+H-1);
      Pixels[X+1, Y+H-1]:= Pen.Color;
      MoveTo(X+2, Y+H); LineTo(X+W-1, Y+H);
      Pen.Color:= clbtnShadow;
      MoveTo(X+W-1,Y);  LineTo(X+W-1, Y+H);
      Pen.Color:= clBlack;
      MoveTo(X+W, Y);   LineTo(X+W, Y+H-1);
      Pixels[X+W-1, Y+H-1]:= Pen.Color;
      DrawGlyphs(Text, ACanvas, R);
      end;
    toTop : begin
      R:= Rect( X, Y, X+W, Y+H );
      Brush.Color:= TabColor;
      FillRect(R);
      case FTextAlign of
        taRightJustify: begin
          T:= Rect(X+W-TW-MARGIN, Y+((H-TH) div 2), R.Right, R.Bottom);
          DrawText(ACanvas.Handle, TxtBuf, StrLen(TxtBuf), T, DT_SINGLELINE);
          G:= R; G.Left:= T.Left; G.Right:= T.Right;
          DrawGlyphs(Text, ACanvas, G);
          end;
        taCenter: begin
          T:= Rect(X+((W-TW) div 2), Y+((H-TH) div 2), R.Right, R.Bottom);
          DrawText(ACanvas.Handle, TxtBuf, StrLen(TxtBuf), T, DT_SINGLELINE);
          G:= R; G.Left:= T.Left; G.Right:= T.Right;
          DrawGlyphs(Text, ACanvas, G);
          end;
        else begin
          T:= Rect(X+MARGIN, Y+((H-TH) div 2), R.Right, R.Bottom);
          DrawText(ACanvas.Handle, TxtBuf, StrLen(TxtBuf), T, DT_SINGLELINE);
          G:= R; G.Left:= T.Left; G.Right:= T.Right;
          DrawGlyphs(Text, ACanvas, G);
          end;
        {taRightJustify: TextRect( R, X+W-TW-MARGIN, Y+((H-TH) div 2), Text );
        taCenter: TextRect( R, X+((W-TW) div 2), Y+((H-TH) div 2), Text );
        else TextRect( R, X+MARGIN, Y+((H-TH) div 2), Text );}
        end;
      Pen.Color:= FBackColor;
      Pixels[X,Y]:= Pen.Color;
      Pixels[X+1,Y]:= Pen.Color;
      Pixels[X,Y+1]:= Pen.Color;
      Pen.Color:= clbtnHighlight;
      MoveTo(X,Y+H);    LineTo(X, Y+1);
      Pixels[X+1, Y+1]:= Pen.Color;
      MoveTo(X+2, Y); LineTo(X+W-1, Y);
      Pen.Color:= clbtnShadow;
      MoveTo(X+W-1,Y+2);  LineTo(X+W-1, Y+H);
      Pen.Color:= clBlack;
      MoveTo(X+W, Y+1);   LineTo(X+W, Y+H);
      Pixels[X+W-1, Y]:= Pen.Color;
      end;
    end; {case}
  end; {with}
end;

procedure TrsTabset.SetOrient( Value: TTabOrient );
begin
  if FOrient = Value then Exit;
  FOrient := Value;
  if FMultiline then Exit;
  Invalidate;
end;

procedure TrsTabset.SetBackColor  ( Value: TColor   );
begin
  if FBackColor = Value then Exit;
  FBackColor := Value;
  Color:= Value;
  Invalidate;
end;

procedure TrsTabset.SetTabColor  ( Value: TColor   );
begin
  if FTabColor = Value then Exit;
  FTabColor := Value;
  Invalidate;
end;

procedure TrsTabset.SetAutosize  ( Value: Boolean   );
begin
  if FAutosize = Value then Exit;
  if FMultiline then Exit;
  FAutosize := Value;
  Invalidate;
end;

procedure TrsTabset.SetTabHeight  ( Value: Integer  );
begin
  if FTabHeight = Value then Exit;
  FTabHeight := Value;
  if FTabHeight < 1 then FTabHeight:= 1;
  Invalidate;
end;

procedure TrsTabset.SetTabWidth   ( Value: Integer  );
begin
  if FTabWidth = Value then Exit;
  FTabWidth := Value;
  if FTabWidth < 1 then FTabWidth:= 1;
  Invalidate;
end;

procedure TrsTabset.SetTabIndex   ( Value: Integer  );
begin
  if FTabIndex = Value then Exit;
  if (Value < -1) or (Value > Tabs.Count-1) then begin
    raise EIndexError.Create('Tabs: Index out of bounds.');
    Exit;
    end;
  ChangeTab(Value);
  Invalidate;
end;

procedure TrsTabset.SetMultiLine( Value: Boolean );
begin
  if FMultiLine = Value then Exit;
  FMultiLine := Value;
  if FMultiLine then begin
    if FAutoSize then FAutoSize:= false;
    if FOrient = toBottom then FOrient:= toTop;
    if FTabWidth < 20 then FTabWidth:= 20;
    if FTabHeight < 70 then FTabWidth:= 70;
    FTextAlign:= taCenter;
    end;
  Invalidate;
end;

procedure TrsTabset.SetTextAlign  ( Value: TAlignment );
begin
  if FTextAlign = Value then Exit;
  FTextAlign := Value;
  Invalidate;
end;

procedure TrsTabset.SetTabs       ( Value: TStrings );
begin
  FTabs.Assign(Value);
  Invalidate;
end;

procedure TrsTabset.SetBGTile     ( Value: TBitmap    );
begin
  FBGTile.Assign(Value);
end;

procedure TrsTabset.SetMATile     ( Value: TBitmap    );
begin
  FMATile.Assign(Value);
end;

procedure TrsTabset.SetImages     ( Value: TrsImageList);
begin
  FImages:= Value;
  Invalidate;
end;

procedure TrsTabset.HideBtns;
begin
  FLButton.Visible:= false;
  FRButton.Visible:= false;
  FLButton.Top:= -20;
  FRButton.Top:= -20;
end;

procedure TrsTabset.ShowBtns;
begin
  FLButton.Top:= 0;
  FRButton.Top:= 0;
  FLButton.Visible:= true;
  FRButton.Visible:= true;
end;

procedure TrsTabset.SizeNB;
begin
  if FNotebook <> nil then
  begin
    FNotebook.left:=1;
    FNotebook.width:= clientwidth-2;
    FNotebook.top:= FTabHeight+2;
    FNotebook.height:= clientheight - (FTabHeight+3);
  end;
  if FPageBox <> nil then
  begin
    FPagebox.left:=1;
    FPagebox.width:= clientwidth-2;
    FPagebox.top:= FTabHeight+2;
    FPagebox.height:= clientheight - (FTabHeight+3);
  end;
end;

procedure TrsTabset.LClick(Sender: TObject);
var tab: smallint;
begin
  Canvas.Font.Assign(Font);
  tab:= FindSTab(FScrollX+1);
  if Tab > 0 then begin
    FScrollX:= GetTabLeft(Canvas, Tab-1);
    Invalidate;
    end;
end;

procedure TrsTabset.RClick(Sender: TObject);
var tab: smallint;
begin
  Canvas.Font.Assign(Font);
  tab:= FindSTab(FScrollX+1);
  if Tab < FTabs.Count-1 then begin
    FScrollX:= GetTabLeft(Canvas, Tab+1);
    Invalidate;
    end;
end;

procedure TrsTabset.CMDialogChar(var Message: TCMDialogChar);
var x:smallint;
begin
  for x:= 0 to FTabs.count-1 do begin
    if IsAccel(Message.CharCode, FTabs[x]) and Enabled then begin
      Message.Result := 1;
      ChangeTab(X);
      Invalidate;
      break;
      end;
    end;
  if Message.Result <> 1 then inherited;
end;

procedure TrsTabset.WMMouseDown(var Message: TWMLButtonDown);
var NewTab: smallint;
begin
  inherited;
  if not MultiLine then NewTab:= FindSTab(Message.XPos + FScrollX)
  else NewTab:= FindMTab(Message.XPos, Message.YPos);
  if NewTab = -1 then Exit;
  ChangeTab(NewTab);
  Invalidate;
end;

function TrsTabset.FindSTab(XPos: smallint): smallint;
var i, total: smallint;
begin
  result:= -1;
  total:= 0;
  for i:= 0 to Tabs.Count-1 do begin
    total:= total + GetTabWidth(Canvas, i);
    if XPos < total then begin
      Result:= i;
      Break;
      end;
    end;
end;

function TrsTabset.FindMTab(XPos, YPos: smallint): smallint;
var count, selrow, tabsperrow, taby, tstart, tcount, twidth: smallint;
    i,j, X,Y: smallint;
begin
  result:= -1;
  GetRowCount(count, selrow, tabsperrow);
  taby:= Height - (count*FTabHeight) - 1;
  if YPos < taby then Exit;
  for i:= 1 to count do begin
    GetRow(i, tstart, tcount, twidth);
    for j:= tstart to tstart+tcount-1 do begin
      X:= (j-tstart)*(twidth+1);
      Y:= Taby+((i-1) * FTabHeight);
      if (YPos < Y+FTabHeight) and (XPos < X+twidth) then begin
        Result:= j;
        Exit;
        end;
      end;
    end;
end;

procedure TrsTabset.Notification( AComponent : TComponent; Operation : TOperation );
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FNotebook) then FNotebook := nil;
  if (Operation = opRemove) and (AComponent = FPageBox) then FPageBox := nil;
  if (Operation = opRemove) and (AComponent = FImages) then FImages := nil;  
end;

procedure TrsTabset.SetNotebook( Value: TNotebook );
begin
  if FNotebook = Value then Exit;
  FNotebook := Value;
  Invalidate;
end;

procedure TrsTabset.SetPageBox( Value: TrsPageBox );
begin
  if FPageBox = Value then Exit;
  FPageBox := Value;
  Invalidate;
end;

procedure TrsTabset.ChangeTab(NewTab: smallint);
var Allow: boolean;
begin
  if csLoading in ComponentState then begin
    FTabIndex:= NewTab;
    Exit;
    end;
  Allow:= true;
  if Assigned(FOnChange) then FOnChange(Self, NewTab, Allow);
  if Allow then begin
    FTabIndex:= NewTab;
    if FNotebook <> nil then
      if FNotebook.Pages.Count > FTabIndex then
        FNotebook.PageIndex:= FTabIndex;
    if FPageBox <> nil then
      if FPageBox.Pages.Count > FTabIndex then
        FPageBox.PageIndex:= FTabIndex;
    end;
end;

function TrsTabSet.StripID(S: String): String;
var x: smallint;
begin
  x:= 1;
  while x < length(S) do begin
    if (length(FGlyphID) > 0) and (S[x] = FGlyphID) then
      if x < length(S) then begin Delete(S,x,2); dec(x); dec(x); end;
    inc(x);
    end;
  result:= S;
end;

function TrsTabSet.GetNextID(ID: Char; S: String; var Index: smallint): char;
var tmpstr: string;
begin
  result:= #0;
  if length(ID) = 0 then Exit;
  while Index < length(S) do begin
    if (S[Index] = ID) then
      if Index < length(S) then begin
        tmpstr:= Copy(S,Index+1,1);
        result:= tmpstr[1];
        inc(Index);
        break;
        end;
    inc(Index);
    end;
end;

procedure TrsTabSet.DrawGlyphs(Text: String; ACanvas: TCanvas; ARect: TRect);
var X,G,t: smallint;
    tmpstr: String;
    CL,TC: TColor;
    R,B: TRect;
    HSpc: smallint;
begin
  if FImages = nil then Exit;
  ACanvas.Font.Assign(Font);
  CL:= FTabColor;
  with ACanvas do begin
    {Draw Glyphs}
    X:= 1;
    repeat
      G:= ord(GetNextID(FGlyphID, Text, X));
      if (G <= FImages.count) and (G > 0 )then
        if FImages[G] <> nil then
          if not FImages[G].Empty then begin {draw glyph}
            tmpstr:= Copy(Text, 1, X-2);
            tmpstr:= StripID(tmpstr);
            t:= ACanvas.Textwidth(tmpstr);
            HSpc:= ((ARect.Bottom - ARect.Top) - FImages[G].Height) div 2;
            R:= Rect(ARect.Left + t, ARect.Top + HSpc,
                     ARect.Left + t + FImages[G].Width,
                     ARect.Top + FImages[G].Height + HSpc);
            B:= Rect(0,0, FImages[G].Width, FImages[G].Height);
            Brush.Color:= CL;
            if (FImages[G].Height < 1) or (FImages[G].Width < 1) then TC:= clOlive
            else TC:= FImages[G].Canvas.Pixels[0,FImages[G].Height-1];
            BrushCopy(R, FImages[G], B, TC);
            end;
    until G = 0;
    end;
end;


end.
