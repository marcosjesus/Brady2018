{******************************************************}
{                   rsListBox V2.0                     }
{        Copyright 1998 Realsoft Development           }
{           support:  www.realsoftdev.com              }
{******************************************************}

unit rsListbx;

interface

{$I REALSOFT.INC}

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, StdCtrls, ExtCtrls, Dialogs, DsgnIntf, Buttons, realproc,
  printers, menus, rsimglst;

const
  MAXTABS = 50;

type
  TCheckStyle = 	(csSquareX, csSquareCheck, csThinX, csRound, cs2D, csDefault);
  TrsListboxOption = 	(lboHeader, lboHeaderSort, lboSortIndicator, lboCheckBoxes,
  			lboAutoCheck, lboAutoClip, lboAutosizeTabs,  lboVertLines,
                        lboHorzLines, lboAutoHeight);
  TrsListboxOptions = 	set of TrsListboxOption;
  TOnClickHeader = 	procedure (Sender: TObject; X: Integer) of object;
  TOnPaintEvent =	procedure(Sender: TObject; ACanvas: TCanvas; ARect: TRect) of object;

  TrsCustomListbox = class(TListBox)
  private
  protected
  public
  published
  end;

  TrsCustomHeader = class(TPanel)
  private
    FOnPaint: 		TOnPaintEvent;
    FOnClickHdr: 	TOnClickHeader;
  protected
    procedure Paint; override;
    procedure WMLButtondown(var Message : TWMLButtonDown); message WM_LBUTTONDOWN;
    procedure WMLButtonup(var Message : TWMLButtonup);     message WM_LBUTTONUP;
  public
  published
    property OnPaint: TOnPaintEvent		read FOnPaint		write FOnPaint;
    property OnClickHeader: TOnClickHeader	read FOnClickHdr	write FOnClickHdr;
  end;

  TrsListbox = class(TCustomPanel)
  private
    L:			TrsCustomListbox;
    H:			TrsCustomHeader;
    FParent:		TForm;
    FCreated:		boolean;
    FTabArray: 		array[0..MAXTABS-1] of Integer;
    FTabArrayCount:	integer;
    FTabList: 		TStrings;
    FImages: 		TrsImageList;
    FHeaderText:	string;
    FOptions:		TrsListBoxOptions;
    FCheckMargin: 	integer;
    FItemMargin: 	integer;
    FItemWidth: 	longint;
    FCheckStyle: 	TCheckStyle;
    FGlyphID: 		char;
    FStyleID: 		char;
    FDownSection,
    FLastSection:	integer;
    FPrevWidth:		integer;
    {FGlyphs:            tGlyphlist;}
    procedure SetOptions      ( AValue: TrsListBoxOptions );
    procedure SetCheckmargin  ( AValue: integer );
    procedure SetItemMargin   ( AValue: integer );
    procedure SetItemWidth   ( AValue: longint );
    procedure SetHeaderText   ( AValue: string );
    procedure SetTabList      ( AValue: TStrings );
    procedure SetCheckStyle   ( AValue: TCheckStyle );
    procedure SetItems        ( AValue: TStrings );
    procedure SetItemIndex    ( AValue: integer );
    procedure SetItemHeight   ( AValue: integer );
    procedure SetSorted       ( AValue: boolean );
    function  GetNewItems     ( index: integer ): string;
    function  GetChecks       ( index: integer ): boolean;
    procedure SetChecks       ( index: integer; AValue: boolean );
    procedure SetImages( Value: TrsImageList );
    function  GetCheckedCount: integer;
    function  GetItems: TStrings;
    function  GetItemIndex: integer;
    function  GetSorted: boolean;
    function  GetTopIndex: integer;
    function  GetItemHeight: integer;
    function  GetLB: TCustomListbox;
    procedure UpdateSize;
    procedure UpdateControls;
    procedure PaintHeader(Sender: TObject; ACanvas: TCanvas; ARect: TRect);
    procedure ClickHeader(Sender: TObject; X: Integer);
    procedure DrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
    procedure DrawItemText(Index: integer; ARect: TRect; State: TOwnerDrawState; Margin: smallint);
    procedure DrawGlyphs(Index: integer; ARect: TRect; State: TOwnerDrawState; Margin: smallint);
    procedure DrawGridLines(Index: integer; ARect: TRect; State: TOwnerDrawState; Margin: smallint);
    procedure DrawCheckBox(Index: integer; ARect: TRect; State: TOwnerDrawState);
    procedure DrawCtl3D(R: TRect; ACanvas : TCanvas);
    procedure DrawHeaderText(ARect: TRect; ACanvas: TCanvas);
    procedure DrawHeaderGlyphs(ARect: TRect; ACanvas: TCanvas);
    procedure DrawHeaderSection(ARect: TRect; ACanvas: TCanvas; Num: smallint);
    procedure DrawHeaderArrow(ARect: TRect; ACanvas: TCanvas; Num: smallint);
    procedure DrawHeader3D(ARect: TRect; ACanvas: TCanvas);
    function  StripID(S: string): string;
    function  ClipTabs(const S: string): string;
    function  GetLineWidth(S: string): longint;
    procedure QuickSort(fnum, L1, R1: integer);
    procedure GetSeparators(const S: string; var Vertical, Horizontal: boolean);
    procedure LBClick(Sender: TObject);
    procedure LBDblClick(Sender: TObject);
    procedure LBDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure LBDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure LBEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure LBEnter(Sender: TObject);
    procedure LBExit(Sender: TObject);
    procedure LBKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure LBKeyPress(Sender: TObject; var Key: Char);
    procedure LBKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure LBMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure LBMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure LBMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
{$IFDEF WIN32}
    procedure LBStartDrag(Sender: TObject; var DragObject: TDragObject);
{$ENDIF}
  protected
    procedure CMFontChanged(var Msg: TMessage);  		message CM_FONTCHANGED;
    procedure CMColorChanged(var Msg: TMessage);  		message CM_COLORCHANGED;
    procedure WMSize(var Message : TWMSize); 			message WM_SIZE;
    procedure WMSetFocus(var Message : TWMSetFocus);		message WM_SETFOCUS;
    procedure Loaded; 						override;
    procedure Notification( AComponent : TComponent; Operation : TOperation); override;
  public
    LastSortTab: integer;
    constructor Create (AOwner: TComponent); 			override;
    destructor Destroy;						override;
    {** new methods **}
    procedure GetLineFont(const S: string; F: TFont);
    function  GetNextID(ID: Char; const S: string; var Index: smallint): char;
    procedure Print(Title: String);
    procedure CheckAll;
    procedure UnCheckAll;
    function  GetTabStopText(const Line: String; TabNum: integer): string;
    procedure SortByTabStop(TabNum: integer);
    procedure UpdateTabStops;
    procedure UpdateItemWidth;
    {** standard methods **}
    procedure Clear;
    function ItemAtPos(Pos: TPoint; Existing: Boolean): Integer;
    function ItemRect(Item: Integer): TRect;
    {** new properties **}
    property Checked[index: integer]: boolean 	read GetChecks	write SetChecks;
    property CheckedCount: integer 		read GetCheckedCount;
    property NewItems[index: integer]: string	read GetNewItems;
    property Listbox: TCustomListbox		read GetLB;
  published
    {** new properties **}
    property Options: TrsListboxOptions	read FOptions		write SetOptions;
    property HeaderText: string		read FHeaderText	write SetHeaderText;
    property TabList: TStrings		read FTabList		write SetTabList;
    property CheckStyle: TCheckStyle	read FCheckStyle	write SetCheckStyle	default csSquareX;
    property CheckMargin: integer	read FCheckMargin	write SetCheckmargin	default 20;
    property ItemMargin: integer	read FItemMargin	write SetItemMargin	default 2;
    property ItemWidth: longint		read FItemWidth		write SetItemWidth	default -1;
    property GlyphIdent: char		read FGlyphID		write FGlyphID		default '^';
    property StyleIdent: char		read FStyleID		write FStyleID		default '~';
    {** standard properties **}
    {property Glyphs:        TGlyphList       read FGlyphs       ;}
    property Items: TStrings 		read GetItems		write SetItems;
    property ItemIndex: integer 	read GetItemIndex 	write SetItemIndex	default -1;
    property Sorted: boolean 		read GetSorted 		write SetSorted		default false;
    property ItemHeight: integer 	read GetItemHeight 	write SetItemHeight;
    property TopIndex: integer 		read GetTopIndex;
    property Images: TrsImageList       read FImages            write SetImages;
    property BorderStyle		default bsSingle;
    property Color			default clWindow;
    property Ctl3D			default true;
    property Align;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
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
{$IFDEF WIN32}
    property OnStartDrag;
{$ENDIF}
  end;


procedure Register;

implementation

procedure Register;
begin
  RegisterComponents( 'RSD' , [TrsListbox] );
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

function GetFieldPos(rec: string; fnum: integer): integer;
var x,c: integer;
begin
  result:= -1;
  c:= 0;
  for x:= 1 to length(rec) do
  begin
    if c = fnum then
    begin
      result:= x;
      break;
    end;
    if (rec[x] = #9) then inc(c);
  end;
end;

function GetFieldSize(rec: string; fpos: integer): integer;
var x: integer;
begin
  result:= 0;
  if (fpos < 1) then Exit;
  for x:= fpos to length(rec) do
  begin
    if rec[x] = #9 then break
    else result:= result + 1;
  end;
end;

function GetField(rec: string; fnum: integer): string;
var p,s: integer;
begin
  p:= GetFieldPos(rec,fnum);
  s:= GetFieldSize(rec, p);
  if (p = -1) or (s = 0) then
    result:= ''
  else result:= copy(rec, p, s);
end;

constructor TrsListbox.Create (AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCreated:= false;
  FParent:= (AOwner as TForm);
  BevelInner:= bvNone;
  BevelOuter:= bvNone;
  BorderStyle:= bsSingle;
  Width:= 121;
  Height:= 97;
  Color:= clWindow;
  TabStop:= true;
  {header}
  H:= TrsCustomHeader.create(self);
  H.Parent:= Self;
  H.Name:= 'H_'+Name;
  H.Visible:= true;
  H.Font.Assign(Font);
  H.Tabstop:= false;
  H.Caption:= '';
  H.BevelInner:= bvNone;
  H.BevelOuter:= bvNone;
  H.Font.Color:= H.Color;
  H.OnPaint:= PaintHeader;
  H.OnClickHeader:= ClickHeader;
  {listbox}
  L:= TrsCustomListBox.create(self);
  L.Name:= 'L_'+Name;
  L.Parent:= Self;
  L.Visible:= true;
  L.Font.Assign(Font);
  L.Tabstop:= false;
  L.BorderStyle:= bsNone;
  L.Style:= lbOwnerDrawFixed;
  L.OnDrawItem:=   DrawItem;
  L.OnClick:=      LBClick;
  L.OnDblClick:=   LBDblClick;
  L.OnDragDrop:=   LBDragDrop;
  L.OnDragOver:=   LBDragOver;
  L.OnEndDrag:=    LBEndDrag;
  L.OnEnter:=      LBEnter;
  L.OnExit:=       LBExit;
  L.OnKeyDown:=    LBKeyDown;
  L.OnKeyPress:=   LBKeyPress;
  L.OnKeyUp:=      LBKeyUp;
  L.OnMouseDown:=  LBMouseDown;
  L.OnMouseMove:=  LBMouseMove;
  L.OnMouseUp:=    LBMouseUp;
{$IFDEF WIN32}
  L.OnStartDrag:=  LBStartDrag;
{$ENDIF}
  {property defaults}
  {FGlyphs:= TGlyphList.Create;}
  FTabList:= TStringList.Create;
  FCheckStyle:= csSquareX;
  FCheckMargin:= 20;
  FItemMargin:= 2;
  FGlyphID:= '^';
  FStyleID:= '~';
  FHeaderText:= 'Header';
  FTabArrayCount:= 0;
  FOptions := [lboHeader, lboHeaderSort, lboSortIndicator, lboAutoHeight];
  FDownSection:= -1;
  FLastSection:= -1;
  FCreated:= true;
  FPrevWidth:= Width;
  FItemWidth:= -1;
end;

destructor TrsListbox.Destroy;
begin
  {FGlyphs.free;}
  FTabList.free;
  inherited Destroy;
end;

procedure TrsListbox.Loaded;
begin
  inherited Loaded;
  H.Font.Assign(Font);
  L.Font.Assign(Font);
  L.Color:= Color;
  UpdateTabStops;
  UpdateSize;
  UpdateControls;
  {$IFDEF DEMO}
  if not DelphiRunning then  {for trial version only}
    showmessage('This program is using an unregistered copy of the TrsListbox' + #13 +
                'component from RealSoft.  Please register at www.realsoftdev.com' + #13 +
                'or call (949) 831-7879.');
  {$ENDIF}
end;

procedure TrsListbox.WMSize(var Message : TWMSize);
var R: real;
    X: smallint;
begin
  inherited;
  UpdateSize;
  if (FPrevWidth < 1) or (Width < 1) or (FPrevWidth = Width) or
     (not (lboAutosizeTabs in FOptions)) or (csDesigning in componentstate) then Exit;
  R:= Width / FPrevWidth;
  for x:= 0 to FTabArrayCount-1 do
    FTablist[x]:= inttostr(round(strtointdef(FTabList[x],0)*R));
  FPrevWidth:= Width;
  UpdateTabStops;
end;

procedure TrsListbox.WMSetFocus(var Message : TWMSetFocus);
begin
  inherited;
  if not FCreated then Exit;
  if (Message.FocusedWnd) = L.handle then
    SendMessage(Parent.Handle, WM_NEXTDLGCTL, 1, 0)
  else if L.Canfocus then L.Setfocus;
end;

procedure TrsListbox.CMFontChanged(var Msg: TMessage);
begin
  Inherited;
  if csLoading in ComponentState then Exit;
  if not FCreated then Exit;
  H.Font.Assign(Font);
  L.Font.Assign(Font);
  H.Canvas.Font.Assign(Font);
  L.Canvas.Font.Assign(Font);
  UpdateSize;
end;

procedure TrsListbox.CMColorChanged(var Msg: TMessage);
begin
  Inherited;
  if csLoading in ComponentState then Exit;
  if not FCreated then Exit;
  L.Color:= Color;
end;

procedure TrsListbox.UpdateSize;
var Margin: integer;
begin
  if not FCreated then Exit;
  if BorderStyle = bsSingle then Margin:= 4
  else Margin:= 0;
  if lboAutoHeight in FOptions then
    L.ItemHeight:= L.Canvas.TextHeight('X') + FItemMargin;
  H.Left:= 0;
  H.Top:= 0;
  H.Height:= L.ItemHeight+1;
  H.Width:= Width-Margin;
  L.Left:= 0;
  L.Width:= Width-Margin;
  if lboHeader in FOptions then
  begin
    L.Top:= H.Height;
    L.Height:= Height - (H.Height+Margin);
  end
  else begin
    L.Top:= 0;
    L.Height:= Height - Margin;
  end;
end;

procedure TrsListbox.UpdateControls;
begin
  if not FCreated then Exit;
  H.Refresh;
  L.Refresh;
end;

procedure TrsListbox.UpdateTabStops;
var x: integer;
begin
  if not FCreated then Exit;
  FTabArrayCount := FTabList.Count;
  if FTabArrayCount > MAXTABS then FTabArrayCount := MAXTABS;
  for x:= 0 to FTabArrayCount-1 do FTabArray[x] := strtointdef(FTabList[x],0) * 4;
  L.Perform( LB_SETTABSTOPS, FTabArrayCount, longint(@FTabArray) );
  L.Invalidate;
end;

procedure TrsListbox.UpdateItemWidth;
var x, max: integer;
begin
  if not FCreated then Exit;
  max:= 0;
  for x:= 0 to L.Items.Count-1 do
  begin
    if L.Canvas.Textwidth(NewItems[x]) > max then max:= L.Canvas.Textwidth(NewItems[x]);
  end;
  if max > width then ItemWidth:= max + 5;
end;

procedure TrsListbox.SetOptions  ( AValue: TrsListBoxOptions );
begin
  FOptions:= AValue;
  UpdateSize;
  UpdateControls;
end;

procedure TrsListbox.SetHeaderText  ( AValue: string );
begin
  if AValue = FHeaderText then Exit;
  FHeaderText:= AValue;
  H.Caption:= AValue;
  UpdateSize;
  UpdateControls;
end;

procedure TrsListbox.SetCheckmargin ( AValue: integer );
begin
  if AValue = FCheckMargin then Exit;
  FCheckMargin:= AValue;
  UpdateControls;
end;

procedure TrsListbox.SetItemMargin  ( AValue: integer );
begin
  if AValue = FItemMargin then Exit;
  FItemMargin:= AValue;
  UpdateSize;
  UpdateControls;
end;

procedure TrsListbox.SetItemWidth  ( AValue: longint );
begin
  if AValue = FItemWidth then Exit;
  FItemWidth:= AValue;
  if FItemWidth <= width then
  begin
    ShowScrollBar( L.Handle, SB_HORZ, false );
  end
  else begin
    ShowScrollBar( L.Handle, SB_HORZ, true );
    L.Perform( LB_SETHORIZONTALEXTENT, FItemWidth , 0 );
  end;
end;

procedure TrsListbox.SetTabList     ( AValue: TStrings );
begin
  FTabList.Assign(AValue);
  UpdateTabStops;
  UpdateControls;
end;

procedure TrsListbox.SetCheckStyle  ( AValue: TCheckStyle );
begin
  if AValue = FCheckStyle then Exit;
  FCheckStyle:= AValue;
  UpdateControls;
end;

procedure TrsListbox.SetItemIndex   ( AValue: integer );
begin
  if not FCreated then Exit;
  L.Itemindex:= AValue;
end;

procedure TrsListbox.SetItemHeight  ( AValue: integer );
begin
  if not FCreated then Exit;
  L.ItemHeight:= AValue;
  UpdateSize;
  UpdateControls;
end;

procedure TrsListbox.SetSorted      ( AValue: boolean );
begin
  if not FCreated then Exit;
  L.Sorted:= AValue;
end;

procedure TrsListbox.SetItems     ( AValue: TStrings );
begin
  if not FCreated then Exit;
  L.Items.Assign(AValue);
end;

function TrsListbox.GetItems: TStrings;
begin
  result:= L.Items;
end;

function TrsListbox.GetItemIndex: integer;
begin
  result:= L.Itemindex;
end;

function TrsListbox.GetSorted: boolean;
begin
  result:= L.Sorted;
end;

function TrsListbox.GetLB: TCustomListbox;
begin
  result:= L;
end;

function TrsListbox.GetTopIndex: integer;
begin
  result:= L.TopIndex;
end;

function TrsListbox.GetItemHeight: integer;
begin
  result:= L.ItemHeight;
end;

function  TrsListbox.GetNewItems     ( index: integer ): string;
begin
  if Index < L.Items.Count then Result:= StripID(L.Items[Index])
  else Result:= '';
end;

function  TrsListbox.GetChecks       ( index: integer ): boolean;
begin
  result:= boolean(L.Items.Objects[index]);
end;

procedure TrsListbox.SetChecks       ( index: integer; AValue: boolean );
begin
  if not FCreated then Exit;
  L.Items.Objects[index]:= TObject(AValue);
  L.DrawItem(index, L.ItemRect(index), []);
end;

function  TrsListbox.GetCheckedCount: integer;
var x: integer;
begin
  result:= 0;
  for x:= 0 to L.items.count-1 do
    if boolean(L.Items.Objects[x]) then result:= result + 1;
end;

procedure TrsListbox.CheckAll;
var x: integer;
begin
  for x:= 0 to L.items.count-1 do
    L.Items.Objects[x]:= TObject(true);
  L.Refresh;
end;

procedure TrsListbox.UnCheckAll;
var x: integer;
begin
  for x:= 0 to L.items.count-1 do
    L.Items.Objects[x]:= TObject(false);
  L.Refresh;
end;

procedure TrsListbox.Clear;
begin
  L.Clear;
end;

function TrsListbox.ItemAtPos(Pos: TPoint; Existing: Boolean): Integer;
begin
  result:= L.ItemAtPos(Pos,Existing);
end;

function TrsListbox.ItemRect(Item: Integer): TRect;
begin
  result:= L.ItemRect(Item);
end;

procedure TrsListbox.Print(Title: String);
var
  i : smallint;
  ListText : TextFile;
  tmpstr: String;
begin
  AssignPrn(ListText);
  try
    Rewrite(ListText);
    Printer.Canvas.Font.Assign(Font);
    if Title <> '' then begin
      writeln(ListText, Title);
      tmpstr:= '';
      while length(tmpstr) < length(Title) do tmpstr:= tmpstr + '-';
      writeln(ListText, tmpstr);
      end;
    for i:= 0 to L.Items.Count - 1 do begin
{      if lboAutoClip in FOptions then tmpstr:= ClipTabs(NewItems[i],true)
      else }tmpstr:= NewItems[i];
      writeln(ListText, tmpstr);
      end;
  finally
    CloseFile(ListText);
  end;
end;

procedure TrsListbox.DrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  if not FCreated then Exit;
  if (lboCheckboxes in FOptions) then
  begin
    DrawItemText(Index, Rect, State, FCheckMargin);
    DrawCheckbox(Index, Rect, State);
    DrawGlyphs(Index, Rect, State, 0);
    DrawGridLines(Index, Rect, State, FCheckMargin);
  end
  else
  begin
    DrawItemText(Index, Rect, State, 0);
    DrawGlyphs(Index, Rect, State, 0);
    DrawGridLines(Index, Rect, State, 0);
  end;
end;


procedure TrsListbox.DrawItemText(Index: integer; ARect: TRect; State: TOwnerDrawState; Margin: smallint);
var P: array[0..255] of char;
    S: String;
    AColor : Char;
    X: smallint;
begin
  if not FCreated then Exit;
  L.Canvas.Font.Assign(Font);
  with L.Canvas do
  begin
    {clear item}
    {Setup Brush.Color... with id (for line shading}
    X:= 1;
    AColor:= GetNextId(FStyleID, Items[Index], X);
    Brush.Color := L.Color;
    if (AColor = 's') then Brush.Color:= clSilver;
    if (AColor = 'Y') then Brush.Color:= $0080FFFF;
    FillRect(ARect);
    {draw text}
    if (odSelected in State) then
    begin
      Pen.Color:= L.Color;
      Brush.Color := clHighlight;
      FillRect(ARect);
      Brush.Style:= bsClear;
      if Focused then DrawFocusRect(ARect);
    end;
    {Style}
    S:= Items[Index];
    GetLineFont(S, Font);
    if (odSelected in State) then Font.Color:= clHighlightText; {fix}
    S:= StripID(S);
    if (lboAutoClip in FOptions) then S:= ClipTabs(S);
    StrPCopy(P, S);

    TabbedTextOut(L.Canvas.Handle, ARect.Left + Margin + 2, ARect.Top, P,
                  StrLen(P), FTabArrayCount, FTabArray, 0);
  end;
end;

procedure TrsListbox.DrawGlyphs(Index: integer; ARect: TRect; State: TOwnerDrawState; Margin: smallint);
var X,G,t: smallint;
    tmpstr: String;
    CL,TC: TColor;
    R,B: TRect;
    HSpc: smallint;
begin
  if not FCreated then Exit;
  if Fimages = nil then exit;
  L.Canvas.Font.Assign(Font);
  if (odSelected in State) then
    CL:= clHighlight
  else
    CL:= L.Color;
  with L.Canvas do
  begin
    {Draw Glyphs}
    X:= 1;
    repeat
      {G:= strtointdef(GetNextID(FGlyphID, Items[Index], X), -1);}
      G:= ord(GetNextID(FGlyphID, Items[Index], X));
      if (G <= FImages.count) and (G > 0)  then
        if FImages[G] <> nil then
          if not FImages[G].Empty then
          begin {draw glyph}
            tmpstr:= Copy(Items[Index], 1, X-2);
            tmpstr:= StripID(tmpstr);
            {t:= L.Canvas.Textwidth(tmpstr) + Margin;}
            t:= GetLineWidth(tmpstr) + Margin;
            HSpc:= ((ARect.Bottom - ARect.Top) - FImages[G].Height) div 2;
            R:= Rect(ARect.Left + t, ARect.Top + HSpc,
                     ARect.Left + t + FImages[G].Width,
                     ARect.Top + FImages[G].Height + HSpc);
            B:= Rect(0,0, FImages[G].Width, FImages[G].Height);
            Brush.Color:= CL;
            if (FImages[G].Height < 1) or (FImages[G].Width < 1) then
              TC:= clOlive
            else
              TC:= FImages[G].Canvas.Pixels[0,FImages[G].Height-1];
            BrushCopy(R, FImages[G], B, TC);
          end;
    until G = 0;
    end;
end;

procedure TrsListbox.DrawGridLines(Index: integer; ARect: TRect; State: TOwnerDrawState; Margin: smallint);
var i,x: smallint;
    v,h: boolean;
    s: string;
begin
  if not FCreated then Exit;
  if (not (lboHorzLines in FOptions)) and (not (lboVertLines in FOptions)) then Exit;
  if (lboVertLines in FOptions) then v:= true else v:= false;
  if (lboHorzLines in FOptions) then h:= true else h:= false;
  S:= Items[Index];
  GetSeparators(s,v,h);
  {draw vertical based on tabstop}
  for i:= 0 to FTabList.Count-1 do
  begin
    x:= strtointdef(FTabList[i],0) * 4;
    with L.Canvas do
    begin
      Pen.Color:= clSilver;
      if (lboVertLines in FOptions) and v then
      begin
        MoveTo(x-3,   ARect.Top);
        LineTo(x-3,   ARect.Bottom);
      end;
    end;
  end;
  {draw horizontal same every time}
  with L.Canvas do
  begin
    Pen.Color:= clSilver;
    if (lboHorzLines in FOptions) and h then
    begin
      MoveTo(ARect.Left,  ARect.Bottom-1);
      LineTo(ARect.Right, ARect.Bottom-1);
    end;
  end;
end;

procedure TrsListbox.DrawCheckBox(Index: integer; ARect: TRect; State: TOwnerDrawState);
var R: TRect;
begin
  if not FCreated then Exit;
  L.Canvas.Font.Assign(Font);
  with L.Canvas do
  begin
    {draw checkbox}
    if not (FCheckStyle = cs2D) then Brush.Color := clwhite;
    R:= Rect(ARect.Left, ARect.Top, ARect.Left + ItemHeight, ARect.Top + ItemHeight);
    if not (lboAutoHeight in FOptions) then
    begin
      R.Right:=  R.Left + 15;
      R.Bottom:= R.Top + 15;
    end;
    FillRect(R);
    FrameRect(R);
    InflateRect(R,-1,-1);
    Brush.Color := clWhite{clbtnHighlight};
    FillRect(R);
    if not (FCheckStyle = cs2D) then
      DrawCtl3D(R, L.Canvas)
    else begin
      Brush.Color := clBlack;
      FrameRect(R);
    end;
    {draw checkmark}
    if boolean(L.items.objects[Index]) then
    begin
      Pen.Color:= clBlack;
      Pen.Width:= 1;
      InflateRect(R,-4,-4);
      if (FCheckStyle = csThinX) then
      begin
        InflateRect(R,1,1);
        Pen.Width:= 1;
        MoveTo( R.left , R.Top );
        LineTo( R.right , R.bottom );
        MoveTo( R.left , R.bottom-1 );
        LineTo( R.right , R.top-1 );
      end
      else if (FCheckStyle = csSquareX) then
      begin
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
        Pen.Width:= 2;
        MoveTo(R.left, ((R.Bottom + R.Top) div 2));
        LineTo(R.left, R.bottom);
        MoveTo(R.left, R.bottom);
        LineTo(R.right, R.top);
      end
      else if (FCheckStyle = csDefault) or (FCheckStyle = csRound) then
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
      end;
    end; {checkmark}
  Pen.Width:= 1;
  end; {canvas}
end;

procedure TrsListbox.DrawCtl3D( R : TRect; ACanvas : TCanvas );
begin
  with ACanvas do begin
    {outer bevel}
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
    LineTo(R.Left,  R.Bottom-1  );
    end;
end;

procedure TrsListbox.GetLineFont(const S: String; F: TFont);
var C: char;
    X: smallint;

  function CharToColor (CH : char) : TColor;
  begin
    case CH of
      '0' : result:= clBlack;
      '1' : result:= clMaroon;
      '2' : result:= clGreen;
      '3' : result:= clOlive;
      '4' : result:= clNavy;
      '5' : result:= clPurple;
      '6' : result:= clTeal;
      '7' : result:= clGray;
      '8' : result:= clSilver;
      '9' : result:= clRed;
      'a' : result:= clLime;
      'b' : result:= clYellow;
      'c' : result:= clBlue;
      'd' : result:= clFuchsia;
      'e' : result:= clAqua;
      'f' : result:= clWhite;
     else result:= clBlack;
     end;
  end;

begin
  X:= 1;
  repeat
    C:= GetNextID(FStyleID, S, X);
    case C of
      'B': F.Style:= F.Style + [fsBold];
      'I': F.Style:= F.Style + [fsItalic];
      'U': F.Style:= F.Style + [fsUnderline];
      'S': F.Style:= F.Style + [fsStrikeOut];
      '0'..'9','a'..'f': F.Color:= ChartoColor(C);
      else C:= #0;
      end;
  until C = #0;
end;

function TrsListbox.StripID(S: String): String;
var x: smallint;
begin
  x:= 1;
  while x < length(S) do begin
    if (length(FGlyphID) > 0) and (S[x] = FGlyphID) then
      if x < length(S) then begin Delete(S,x,2); dec(x); end;
    if (length(FStyleID) > 0) and (S[x] = FStyleID) then
      if x < length(S) then begin Delete(S,x,2); dec(x); end;
    inc(x);
    end;
  result:= S;
end;

function TrsListbox.ClipTabs(const S: String): String;
var i,j,c,M,tabw: smallint;
    tmpstr: String;

    function ClipTab(sub: String; tabnum: smallint): string;
    begin
      if (lboCheckboxes in FOptions) and (tabnum = 0) then
        M:= FCheckMargin
      else
        M:= 0;
      if tabnum > 0 then tabw:= FTabArray[tabnum] - FTabArray[tabnum-1]
      else tabw:= FTabArray[tabnum];
      inc(M,6); {arbitrary value that works}
      while (L.Canvas.TextWidth(sub) + M > tabw) and (length(sub) > 0) do
        Delete(Sub,length(Sub),1);
      Result:= Sub;
    end;

begin
  if Pos(#9, S) = 0 then
  begin
    Result:= S;
    Exit;
  end;

  Result:= '';
  c:= 0;
  i:= 1;
  j:= Posfrompos(#9,S,i);
  while (J > 0) do
  begin
    tmpstr:= Copy(S, i, j-i);
    tmpstr:= ClipTab(tmpstr, c);
    Result:= Result+tmpstr+#9;
    i:= j+1;
    j:= Posfrompos(#9,S,i);
    inc(c);
  end;
  if i <= length(S) then Result:= Result + Copy(S,i,(length(s)-i)+1);
end;

function TrsListbox.GetNextID(ID: Char; const S: String; var Index: smallint): char;
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

function TrsListbox.GetLineWidth(S: String): longint;
var P: array[0..255] of char;
begin
  GetLineFont(S, L.Canvas.Font);
  S:= StripID(S);
  if (lboAutoClip in FOptions) then S:= ClipTabs(S);
  StrPCopy(P, S);
  {$IFDEF WIN32}
  result:= dword(GetTabbedTextExtent(L.Canvas.Handle, P, StrLen(P), FTabArrayCount, FTabArray));
  {$ELSE}
  result:= word(GetTabbedTextExtent(L.Canvas.Handle, P, StrLen(P), FTabArrayCount, FTabArray));
  {$ENDIF}
end;

procedure TrsListbox.GetSeparators(const S: string; var Vertical, Horizontal: boolean);
var C: char;
    X: smallint;
begin
  X:= 1;
  repeat
    C:= GetNextID(FStyleID, S, X);
    case C of
      'H': Vertical := true;
      'h': Vertical := false;
      'V': Horizontal := true;
      'v': Horizontal := false;
      end;
  until C = #0;
end;

procedure TrsCustomHeader.Paint;
begin
  if Assigned(FOnPaint) then FOnPaint(Self, Canvas, ClientRect)
  else inherited Paint
end;

procedure TrsListbox.ClickHeader(Sender: TObject; X: Integer);
var i,j: smallint;
begin
  FDownSection:= -1;
  if X = -1 then
  begin
    H.Refresh;
    Exit;
  end
  else begin
    for i:= 0 to FTabArrayCount-1 do
    begin
      j:= strtointdef(FTabList[i],0) * 4;
      if j = 0 then continue;
      if X < j then
      begin
        FDownSection:= i+1;
        break;
      end;
    end;
    if FDownSection = -1 then FDownSection:= FTabArrayCount+1;
    FLastSection:= FDownSection;
    H.Refresh;
    if lboHeaderSort in FOptions then SortByTabStop(FDownSection-1);
  end;  
end;

procedure TrsListbox.PaintHeader(Sender: TObject; ACanvas: TCanvas; ARect: TRect);
var x,y: integer;
begin
  ACanvas.Brush.Color:= H.Color;
  ACanvas.FillRect(ARect);

  if FTabArrayCount < 1 then
  begin
    DrawHeader3D(ARect, ACanvas);
    ACanvas.Font.Assign(Font);
    Brush.Style:= bsClear;
    y:= (((H.Height-1) - ACanvas.TextHeight(FHeaderText)) div 2);
    ACanvas.TextOut(2,y,FHeaderText);
    ACanvas.Pen.Color:= clBlack;
    ACanvas.MoveTo(ARect.Left,  ARect.Bottom-1  );
    ACanvas.LineTo(ARect.Right, ARect.Bottom-1  );
  end
  else begin
    DrawHeaderText(ARect, ACanvas);
    DrawHeaderGlyphs(ARect, ACanvas);
    for x:= 1 to FTabArrayCount+1 do
    begin
      DrawHeaderSection(ARect, ACanvas, x);
      if x = FLastSection then DrawHeaderArrow(ARect, ACanvas, x);
    end;
  end;
end;

procedure TrsListbox.DrawHeader3D(ARect: TRect; ACanvas: TCanvas);
begin
  with ACanvas do
  begin
    Pen.Style:= psSolid;
    Pen.Color:= clBtnHighlight;
    MoveTo(ARect.Left,  ARect.Bottom-2  );
    LineTo(ARect.Left,  ARect.Top       );
    MoveTo(ARect.Left,  ARect.Top       );
    LineTo(ARect.Right-1, ARect.Top     );
    Pen.Color:= clBtnShadow;
    MoveTo(ARect.Right-1, ARect.Top     );
    LineTo(ARect.Right-1, ARect.Bottom-2);
    MoveTo(ARect.Right-1, ARect.Bottom-2);
    LineTo(ARect.Left,  ARect.Bottom-2  );
  end;
end;

procedure TrsListbox.DrawHeaderText(ARect: TRect; ACanvas: TCanvas);
var P: array[0..255] of char;
    M,y: smallint;
    S: String;
begin
  if not (lboCheckboxes in FOptions) then M:= 0
  else M:= FCheckMargin;
  ACanvas.Font.Assign(Font);
  with ACanvas do begin
    {clear item}
    Brush.Color := H.Color;
    FillRect(ARect);
    {draw text}
    Brush.Color := H.Color;
    Brush.Style:= bsClear;
    {Style}
    S:= FHeaderText;
    GetLineFont(S, Font);
    S:= StripID(S);
    if lboAutoClip in FOptions then S:= ClipTabs(S);
    y:= (((H.Height-1) - TextHeight(S)) div 2)-1;
    StrPCopy(P, S);
    TabbedTextOut(ACanvas.Handle, ARect.Left+M+2, ARect.Top+y, P,
                  StrLen(P), FTabArrayCount, FTabArray, 0);
    end;
end;

procedure TrsListbox.DrawHeaderGlyphs(ARect: TRect; ACanvas: TCanvas);
var X,G,t: smallint;
    tmpstr: String;
    R,B: TRect;
    M: smallint;
    TC: TColor;
begin
  if Fimages = nil then exit;
  if not (lboCheckboxes in FOptions) then M:= 0
  else M:= FCheckMargin;
  ACanvas.Font.Assign(Font);
  with ACanvas do begin
    {Draw Glyphs}
    X:= 1;
    repeat
      {G:= strtointdef(GetNextID(FGlyphID, Caption, X),-1);}
      G:= ord(GetNextID(FGlyphID, Caption, X));
      if (G <= FImages.count) and (G > 0) then
        if FImages[G] <> nil then
          if not FImages[G].Empty then begin {draw glyph}
            tmpstr:= Copy(Caption, 1, X-2);
            tmpstr:= StripID(tmpstr);
            {t:= Canvas.Textwidth(tmpstr)+M;}
            t:= GetLineWidth(tmpstr) + M;
            R:= Rect(ARect.Left + t, ARect.Top,
                     ARect.Left + t + FImages[G].Width,
                     ARect.Top + FImages[G].Height);
            B:= Rect(0,0, FImages[G].Width, FImages[G].Height);
            Brush.Color:= H.Color;
            if (FImages[G].Height < 1) or (FImages[G].Width < 1) then TC:= clOlive
            else TC:= FImages[G].Canvas.Pixels[0,FImages[G].Height-1];
            BrushCopy(R, FImages[G], B, TC);
            end;
    until G = 0;
    end;
end;

procedure TrsListbox.DrawHeaderSection (ARect: TRect; ACanvas: TCanvas; Num: smallint);
var C,R: TRect;
begin
  {find the section rect}
  C:= ARect;
  R.Top:=    C.Top;
  R.Bottom:= C.Bottom - 1;
{  if (Num <= FTabArrayCount) then
    if strtointdef(FTabList[Num-1],0) = 0 then Exit
  else Exit;}
  if Num = 1 then
  begin
    R.Left:= 0;
    R.Right:= (strtointdef(FTabList[Num-1],0) * 4) - 3;
  end;
  if (Num > 1) and (Num < TabList.Count+1) then
  begin
    R.Left:=  (strtointdef(FTabList[Num-2],0) * 4) - 2;
    R.Right:= (strtointdef(FTabList[Num-1],0) * 4) - 3;
  end;
  if Num = TabList.Count+1 then
  begin
    R.Left:= (strtointdef(FTabList[Num-2],0) * 4) - 2;
    R.Right:= C.Right;
  end;
  {draw the section, either up or down}
  with ACanvas do
  begin
    Pen.Style:= psSolid;
    if FDownSection <> Num then Pen.Color:= clBtnHighlight
    else Pen.Color:= clBtnShadow;
    {horz}
    MoveTo(R.Left+1,  R.Top     );
    LineTo(R.Right-1, R.Top     );
    {vert}
    MoveTo(R.Left,  R.Bottom-1  );
    LineTo(R.Left,  R.Top-1     );
    if FDownSection <> Num then Pen.Color:= clBtnShadow
    else Pen.Color:= clBtnHighlight;
    {horz}
    MoveTo(R.Left+1,  R.Bottom-1);
    LineTo(R.Right-1, R.Bottom-1);
    {vert}
    MoveTo(R.Right-1, R.Top     );
    LineTo(R.Right-1, R.Bottom  );
    {draw black vert line after}
    if Num < FTabList.Count+1 then
    begin
      Pen.Color:= clBlack;
      MoveTo(R.Right, R.Top-1   );
      LineTo(R.Right, R.Bottom+1);
    end;
    {draw black horz line}
    Pen.Color:= clBlack;
    MoveTo(R.Left,  R.Bottom);
    LineTo(R.Right, R.Bottom);
  end;  {with}
end;

procedure TrsListbox.DrawHeaderArrow (ARect: TRect; ACanvas: TCanvas; Num: smallint);
var C,R: TRect;
    x,y: integer;
begin
  if not (lboSortIndicator in FOptions) then Exit;
  {find the section rect}
  C:= ARect;
  R.Top:=    C.Top;
  R.Bottom:= C.Bottom - 1;
  if Num = 1 then begin
    R.Left:= 0;
    R.Right:= (strtointdef(FTabList[Num-1],0) * 4) - 3;
    end;
  if (Num > 1) and (Num < TabList.Count+1) then begin
    R.Left:=  (strtointdef(FTabList[Num-2],0) * 4) - 2;
    R.Right:= (strtointdef(FTabList[Num-1],0) * 4) - 3;
    end;
  if Num = TabList.Count+1 then begin
    R.Left:= (strtointdef(FTabList[Num-2],0) * 4) - 2;
    R.Right:= C.Right;
    end;
  {draw the section, either up or down}
  x:= R.right - 12;
  y:= (H.Height - 4) div 2;
  with ACanvas do begin
    Pen.Style:= psSolid;
    Pen.Color:= clBlack;
    MoveTo(x,y);
    LineTo(x+5,y);
    MoveTo(x+1,y+1);
    LineTo(x+4,y+1);
    Pixels[x+2,y+2]:= Pen.Color;
    end;  {with}
end;

procedure TrsCustomHeader.WMLButtondown(var Message : TWMLButtonDown);
begin
  inherited;
  if Assigned(FOnClickHdr) then FOnClickHdr(Self, Message.XPos);
end;

procedure TrsCustomHeader.WMLButtonup(var Message : TWMLButtonup);
begin
  inherited;
  if Assigned(FOnClickHdr) then FOnClickHdr(Self, -1);
end;

function TrsListbox.GetTabStopText(const Line: String; TabNum: integer): string;
begin
  result:= GetField(Line, TabNum);
end;

procedure TrsListbox.SortByTabStop(TabNum: integer);
begin
  if L.Items.Count = 0 then Exit;
  QuickSort(TabNum, 0, L.Items.Count - 1);
  LastSortTab:= TabNum;
end;

procedure TrsListbox.QuickSort(fnum, L1, R1: Integer);
var
  I, J: Integer;
  P: string;
begin
  L.items.beginupdate;
  repeat
    I := L1;
    J := R1;
    P := GetField( L.items[(L1 + R1) shr 1], fnum );
    repeat
      while AnsiCompareText(GetField( L.items[I], fnum), P) < 0 do Inc(I);
      while AnsiCompareText(GetField( L.items[J], fnum), P) > 0 do Dec(J);
      if I <= J then
      begin
        L.items.Exchange(I, J);
        Inc(I);
        Dec(J);
      end;
    until I > J;
    if L1 < J then QuickSort(fnum, L1, J);
    L1 := I;
  until I >= R1;
  L.items.endupdate;
end;

procedure TrsListbox.LBClick(Sender: TObject);
var N: TNotifyEvent;
begin
  N:= OnClick;
  if Assigned(N) then OnClick(Self);
end;

procedure TrsListbox.LBDblClick(Sender: TObject);
var N: TNotifyEvent;
begin
  N:= OnDblClick;
  if Assigned(N) then OnDblClick(Self);
end;

{$IFDEF WIN32}
procedure TrsListbox.LBStartDrag(Sender: TObject; var DragObject: TDragObject);
var N: TStartDragEvent;
begin
  N:= OnStartDrag;
  if Assigned(N) then OnStartDrag(Self, DragObject);
end;
{$ENDIF}

procedure TrsListbox.LBDragDrop(Sender, Source: TObject; X, Y: Integer);
var N: TDragDropEvent;
begin
  N:= OnDragDrop;
  if Assigned(N) then OnDragDrop(Self, Source, X, Y);
end;

procedure TrsListbox.LBDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
var N: TDragOverEvent;
begin
  N:= OnDragOver;
  if Assigned(N) then OnDragOver(Self, Source, X, Y, State, Accept);
end;

procedure TrsListbox.LBEndDrag(Sender, Target: TObject; X, Y: Integer);
var N: TDragDropEvent;
begin
  N:= OnEndDrag;
  if Assigned(N) then OnEndDrag(Self, Target, X, Y);
end;

procedure TrsListbox.LBEnter(Sender: TObject);
var N: TNotifyEvent;
begin
  N:= OnEnter;
  if Assigned(N) then OnEnter(Self);
end;

procedure TrsListbox.LBExit(Sender: TObject);
var N: TNotifyEvent;
begin
  N:= OnExit;
  if Assigned(N) then OnExit(Self);
end;

procedure TrsListbox.LBKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var N: TKeyEvent;
begin
  N:= OnKeyDown;
  if Assigned(N) then OnKeyDown(Self, Key, Shift);
end;

procedure TrsListbox.LBKeyPress(Sender: TObject; var Key: Char);
var N: TKeyPressEvent;
begin
  N:= OnKeyPress;
  if Assigned(N) then OnKeyPress(Self, Key);
  if Key <> #32 then Exit;
  if not (lbocheckboxes in options) then exit;
  if L.Itemindex < 0 then Exit;
  if boolean(L.Items.Objects[L.Itemindex]) then
    L.Items.Objects[L.Itemindex]:= TObject(false)
  else L.Items.Objects[L.Itemindex]:= TObject(true);
  L.DrawItem(L.Itemindex, L.ItemRect(L.Itemindex), [odSelected]);
{  L.Invalidate;}
end;

procedure TrsListbox.LBKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var N: TKeyEvent;
begin
  N:= OnKeyUp;
  if Assigned(N) then OnKeyUp(Self, Key, Shift);
end;

procedure TrsListbox.LBMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var N: TMouseMoveEvent;
begin
  N:= OnMouseMove;
  if Assigned(N) then OnMouseMove(Self, Shift,X,Y);
end;

procedure TrsListbox.LBMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var N: TMouseEvent;
begin
  N:= OnMouseUp;
  if Assigned(N) then OnMouseUp(Self, Button, Shift,X,Y);
end;

procedure TrsListbox.LBMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var N: TMouseEvent;
begin
  N:= OnMouseDown;
  if Assigned(N) then OnMouseDown(Self, Button, Shift, X,Y);
  if L.Itemindex < 0 then Exit;
  if (Y > L.ItemRect(L.Itemindex).Bottom) then Exit;
  if not (lbocheckboxes in options) then exit;
  if (lboAutoCheck in FOptions) or (X < L.ItemHeight+4) then
  begin
    if boolean(L.Items.Objects[L.Itemindex]) then
      L.Items.Objects[L.Itemindex]:= TObject(false)
    else L.Items.Objects[L.Itemindex]:= TObject(true);
  L.DrawItem(L.Itemindex, L.ItemRect(L.Itemindex), [odSelected]);
  {L.Invalidate;}
  end;
end;

{********************************}
{      RealListBox Special       }
{********************************}
procedure TrsListBox.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FImages) then FImages := nil;
end;

procedure TrsListBox.SetImages( Value: TrsImageList );
begin
  FImages:= Value;
  UpdateControls;
end;

end.
