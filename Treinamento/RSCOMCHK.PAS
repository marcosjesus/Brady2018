{******************************************************}
{                  rsComboCheck V1.0                   }
{        Copyright 1997 RealSoft Development           }
{           support:  www.realsoftdev.com              }
{******************************************************}

unit Rscomchk;

interface

{$I REALSOFT.INC}

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, Buttons, Menus, rsListbx, rsImglst,
  Dynarray, Realproc;

const
  POPHEIGHT = 80;

type
  TPopForm = class(TForm)
  protected
    procedure CreateParams( var Params: TCreateParams ); override;
  end;

  TrsCustomComboCheck = class(TCustomEdit)
  private
{$IFNDEF WIN32}
    HEditDS    : THandle;
{$ENDIF}
    FItems        : TStrings;
    FItemIndex    : smallint;
    FItemSet      : Boolean;
    FButton       : TSpeedButton;
    FPopForm      : TPopForm;
    FListBox      : TrsListBox;
    FPopped       : boolean;
    FTimer        : TTimer;
    FCheck3D      : boolean;
    FOptions      : TrsListBoxOptions;
    FCheckStyle   : TCheckStyle;
    FCheckMargin  : smallint;
    FMultiCheck   : boolean;
    FAutoCheck    : boolean;
    FGlyphID      : Char;
    FStyleID      : Char;
    FImages       : TrsImageList;
    FSorted       : Boolean;
    FSelItem      : boolean;
    FOnChange     : TNotifyEvent;
    FLocator   : boolean;
    FLocColor  : TColor;
    FOldColor  : TColor;
    procedure DropList;
    procedure FreeList;
    procedure ButtonClick(Sender : TObject);
    procedure ListDblClick(Sender: TObject);
    procedure ListKeyPress(Sender: TObject; var Key: Char);
    procedure ListDeAct(Sender : TObject);
    procedure TimerKill(Sender : TObject);
    procedure SetItems(Value : TStrings);
    procedure SetImages( Value: TrsImageList );
    procedure SetChecks(Index: smallint; Value: Boolean);
    procedure SetItemSet(Value: Boolean);
    function  GetChecks(Index: smallint): Boolean;
    function  GetCheckedCount: smallint;
    procedure ModifyText;
  protected
    procedure Notification( AComponent : TComponent; Operation : TOperation); override;
    procedure CreateParams( var Params: TCreateParams ); override;
    procedure CreateWindowHandle(const Params: TCreateParams); override;
    procedure WMNCDestroy(var Message: TWMNCDestroy); message WM_NCDESTROY;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure WMSetText(var Message: TWMSetText); message WM_SETTEXT;
    procedure WMSetFocus(var Message: TWMSetFocus); message WM_SETFOCUS;
    procedure KeyDown(var key: Word; Shift: TShiftState); override;
    procedure CreateWnd; override;
    procedure Loaded; override;
    procedure DoEnter; override;
    procedure DoExit; override;
    function  StripID(S: String): String;
    procedure SetPosition( Form : TForm );
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Checked[Index: smallint]: Boolean read GetChecks    write SetChecks;
    property CheckedCount: smallint read GetCheckedCount;
    property Images:        TrsImageList       read FImages        write SetImages;
    property Items:         TStrings           read FItems         write SetItems;
    property ItemIndex:     smallint           read FItemIndex     write FItemIndex;
    property ItemShowSet:   Boolean            read FItemSet       write SetItemSet     default true;
    property Options:       TrsListBoxOptions  read FOptions     write FOptions;
    property CheckStyle:    TCheckStyle        read FCheckStyle    write FCheckStyle    default csSquareX;
    property CheckMargin:   smallint           read FCheckMargin   write FCheckmargin   default 20;
    property GlyphIdent:    Char               read FGlyphID       write FGlyphID       default '^';
    property StyleIdent:    Char               read FStyleID       write FStyleID       default '~';
    property Sorted:        Boolean            read FSorted        write FSorted        default false;
    property Locator:       Boolean            read FLocator       write FLocator       default false;
    property LocColor:      TColor             read FLocColor      write FLocColor      default clAqua;
    property Text;
    property Color;
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
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
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
  published
  end;

  TrsComboCheck = class(TrsCustomComboCheck)
  private
  public
  published
    property Items;
    property ItemIndex;
    property ItemShowSet;
    property Options;
    property CheckStyle;
    property CheckMargin;
    property GlyphIdent;
    property StyleIdent;
    property Sorted;
    property Locator;
    property LocColor;
    property Text;
    property Color;
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
    property OnChange;
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
  RegisterComponents('RSD', [TrsComboCheck]);
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

procedure TPopForm.CreateParams( var Params: TCreateParams );
begin
  inherited CreateParams( Params );
end;

procedure TrsCustomComboCheck.CreateParams( var Params: TCreateParams );
begin
  inherited CreateParams( Params );
  Params.Style := Params.Style or WS_CLIPCHILDREN or WS_CLIPSIBLINGS or ES_MULTILINE;
end;

procedure TrsCustomComboCheck.CreateWindowHandle(const Params: TCreateParams);
begin
{$IFDEF WIN32}
  inherited CreateWindowHandle(Params);
{$ELSE}
  HEditDS := GlobalAlloc(GMEM_MOVEABLE or GMEM_ZEROINIT or GMEM_SHARE, 256);
  if HEditDS = 0 then HEditDS := HInstance;
  with Params do
  begin
    WindowHandle := CreateWindowEx(ExStyle, WinClassName, '', Style,
      X, Y, Width, Height, WndParent, 0, HEditDS, Param);
    SendMessage(WindowHandle, WM_SETTEXT, 0, Longint(Caption));
  end;
{$ENDIF}
end;

procedure TrsCustomComboCheck.WMNCDestroy(var Message: TWMNCDestroy);
begin
  inherited;
{$IFNDEF WIN32}
  if HEditDS <> HInstance then GlobalFree(HEditDS);
{$ENDIF}
end;

constructor TrsCustomComboCheck.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle:= ControlStyle + [csAcceptsControls];
  AutoSize:= true;
  Height:= 24;
  FPopped:= false;
  FButton:= TSpeedButton.Create(Self);
  FItems:= TStringList.Create;
  FItemIndex:= -1;
  FItemSet:= true;
  ReadOnly:= true;
  FCheck3D:= true;
  {FOptions:= [];
  FCheckStyle:= csSquareX;}
  FMultiCheck:= true;
  FAutoCheck:= true;
  FGlyphId:= '^';
  FStyleId:= '~';
  FCheckMargin:= 20;
  FSorted:= false;
  FSelItem:= false;
end;

destructor TrsCustomComboCheck.Destroy;
begin
  FItems.Free;
  if FTimer <> NIL then FTimer.Free;
  inherited Destroy;
end;

procedure TrsCustomComboCheck.Loaded;
{$IFDEF LOCTAG}
var F: TWinControl;
{$ENDIF}
begin
  inherited Loaded;
  {$IFDEF DEMO}
  if not DelphiRunning then  {for trial version only}
    showmessage('This program is using an unregistered copy of the TrsComboCheck' + #13 +
                'component from RealSoft.  Please register at www.realsoftdev.com' + #13 +
                'or call (949) 831-7879.');

  {$ENDIF}
  FOldColor:= Color;
  {$IFDEF LOCTAG}
  F := GetParentForm( Self );
  if F.Tag > 32767 then FLocator:= loFill;
  {$ENDIF}

end;

procedure TrsCustomComboCheck.CreateWnd;
begin
  inherited CreateWnd;
  FButton.Parent:= Self;
  SendMessage(Self.Handle, WM_SIZE, 0, 0);
end;

procedure TrsCustomComboCheck.DoEnter;
begin
  if FLocator then Color:= FLocColor;
  inherited DoEnter;
end;

procedure TrsCustomComboCheck.DoExit;
begin
  if FLocator then Color:= FOldColor;
  inherited DoExit;
end;

procedure TrsCustomComboCheck.WMSize (var Message: TWMSize);
var ABMP : TBitmap;
    R: TRect;
begin
  inherited;
  {$IFDEF WIN32}
  FButton.Height:= Height-4;
  FButton.Width:= trunc(FButton.Height * 0.80);
  FButton.Left:= Width - FButton.Width - 4;
  FButton.Top:= 0;
  {$ELSE}
  FButton.Height:= Height-2;
  FButton.Width:= trunc(FButton.Height * 0.80);
  FButton.Left:= Width - FButton.Width - 1;
  FButton.Top:= 1;
  {$ENDIF}
  FButton.Cursor:= crArrow;
  ABMP:= TBitmap.Create;
  with ABMP,Canvas do begin
    Width:=9;
    Height:=3;
    Brush.Style:= bsClear;
    Pen.Color:= clBlack;
    Pen.Style:= psSolid;
    Pen.Width:= 1;
    MoveTo(2,0); LineTo(7,0);
    MoveTo(3,1); LineTo(6,1);
    Pixels[4,2]:= Pen.Color;
    end;
  FButton.Glyph.Assign(ABMP);
  ABMP.Free;
  FButton.OnClick:= ButtonClick;
  R:= Rect(0, 0, FButton.Left-2, Height);
  SendMessage(Self.Handle, EM_SETRECT, 0, Longint(@R));
end;

procedure TrsCustomComboCheck.WMSetFocus(var Message: TWMSetFocus);
begin
  inherited;
  FButton.Invalidate;
end;

procedure TrsCustomComboCheck.WMSetText(var Message: TWMSetText);
begin
  inherited;
  if (csDesigning in ComponentState) then Text:= '';
end;

procedure TrsCustomComboCheck.SetItems(Value : TStrings);
begin
  FItems.Assign(Value);
end;

procedure TrsCustomComboCheck.SetChecks(Index: smallint; Value: Boolean);
begin
  if Index < Items.Count then
    Items.Objects[Index]:= TObject(Value);
  ModifyText;
  Invalidate;
end;

function TrsCustomComboCheck.StripID(S: String): String;
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

function TrsCustomComboCheck.GetCheckedCount: smallint;
begin
  result:= 0;
end;

function  TrsCustomComboCheck.GetChecks(Index: smallint): Boolean;
begin
  result:= false;
  if Index < Items.Count then result:= boolean(Items.Objects[Index]);
end;

procedure TrsCustomComboCheck.SetItemSet(Value: Boolean);
begin
  FItemSet:= Value;
  ModifyText;
end;

procedure TrsCustomComboCheck.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited KeyDown(Key,Shift);
  if (Key = VK_DOWN) and (Shift = [ssALT]) then FButton.Click;
end;

procedure TrsCustomComboCheck.ButtonClick(Sender : TObject);
begin
  if (not FPopped) and (FPopForm = NIL) and (FTimer = NIL) then DropList;
end;

procedure TrsCustomComboCheck.DropList;
var
  AForm: TForm;
  x: integer;
begin
  FPopped:= true;
  FPopForm:= TPopForm.CreateNew(Application);
  FPopForm.Width:= Width;
  FPopForm.Height:= POPHEIGHT;
  FPopForm.BorderStyle:= bsNone;
  FPopForm.FormStyle:= fsStayOnTop;
  FPopForm.Font.Assign(Font);
  FPopForm.OnDeactivate:= ListDeAct;

  SetPosition(FPopForm);
  {P:= Self.ClientToScreen(Point(Left,Top));
  FPopForm.Left:= P.X - Left;
  FPopForm.Top:= P.Y - Top + Height + 1;}


  FListBox := TrsListBox.Create(FPopForm);
  FListBox.Options:=       FOptions;
  FListBox.CheckStyle:=    FCheckStyle;
  FListBox.GlyphIdent:=    FGlyphId;
  FListBox.StyleIdent:=    FStyleId;
  FListBox.CheckMargin:=   FCheckMargin;
  FListBox.Sorted:=        FSorted;
  FListBox.Align:=         alClient;
  FListBox.Parent:=        FPopForm;
  FListBox.Items.Assign(FItems);
  for x:= 0 to FItems.Count-1 do
    Flistbox.Items.Objects[x]:= FItems.Objects[x];
  FListBox.Images:= Images;
  FListBox.OnDblClick:=    ListDblClick;
  FListBox.OnKeyPress:=    ListKeyPress;
  if FListBox.Items.Count < 8 then
    FPopForm.Height:= (FListBox.ItemHeight * FListBox.Items.Count) + 4
  else FPopForm.Height:= (FListBox.ItemHeight * 8) + 4;
  FPopForm.Show;
  if FListBox.Items.count > 0 then FListBox.Itemindex:= 0;
  {FListBox.SetFocus;}
  AForm:= (GetparentForm(Self) as TForm);
  if AForm <> nil then
    AForm.Perform(WM_NCACTIVATE, 1, 0);
end;

procedure TrsCustomComboCheck.FreeList;
var x: integer;
begin
  if FSelItem then begin
    if FListBox.ItemIndex > -1 then begin
      Text:= FListBox.NewItems[FListBox.ItemIndex];
      FItemIndex:= FListBox.ItemIndex;
      end;
    end;
  for x:= 0 to FListbox.Items.Count-1 do
    FItems.Objects[x]:= FListbox.Items.Objects[x];

  FPopForm.Release;
  FPopForm:= NIL;
  if CanFocus then SetFocus;
  FPopped:= false;
  ModifyText;
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TrsCustomComboCheck.ListDblClick(Sender: TObject);
begin
  FSelItem:= true;
  SetFocus;
end;

procedure TrsCustomComboCheck.ListKeyPress(Sender: TObject; var Key: Char);
begin
  if ord(Key) = VK_RETURN then begin
    FSelItem:= true;
    SetFocus;
    end;
  if ord(Key) = VK_ESCAPE then begin
    FSelItem:= false;
    SetFocus;
    end;
end;

procedure TrsCustomComboCheck.ListDeAct(Sender : TObject);
begin
  FreeList;
  FTimer:= TTimer.Create(Self);
  FTimer.Interval:= 100;
  FTimer.OnTimer:= TimerKill;
  FTimer.Enabled:= true;
end;

procedure TrsCustomComboCheck.TimerKill(Sender : TObject);
begin
  FTimer.Free;
  FTimer:= NIL;
end;

procedure TrsCustomComboCheck.ModifyText;
var x: smallint;
begin
  if not FItemSet then Exit;
  Text:= '';
  for x:= 0 to Items.Count-1 do begin
    if not boolean(Items.Objects[x]) then continue;
    if Text <> '' then Text:= Text + ',';
    Text:= Text + StripId(FItems[x]);
    end;
end;

procedure TrsCustomComboCheck.SetImages( Value: TrsImageList );
begin
  FImages:= Value;
end;

procedure TrsCustomComboCheck.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FImages) then FImages := nil;
end;

procedure TrsCustomComboCheck.SetPosition( Form : TForm );
var Pt : TPoint;
begin
    if form = nil then exit;
  {$IFDEF WIN32}
    PT:= Self.ClientToScreen( Point(Left, Top) );
    PT.X:= PT.X - Left;
    PT.Y:= PT.Y - Top;
    {vert}
    if (PT.Y + Height + POPHEIGHT+30) < Screen.Height then
      Form.Top:= (PT.Y + height) - 2          {drop downwards}
    else if (PT.Y - POPHEIGHT) < 0 then
      Form.Top:= 0                     {drop center}
    else
      Form.Top:= (PT.Y - POPHEIGHT) - 2;     {drop upwards}

    {horz}
    if (PT.X + Width) < Screen.Width then
      Form.Left:= PT.X - 2
    else
      Form.Left:= Screen.Width - Width;
  {$ELSE}
     PT:= Self.ClientToScreen( Point(Left, Top) );
     PT.X:= PT.X - Left;
     PT.Y:= PT.Y - Top;
     {vert}
     if (PT.Y + Height + POPHEIGHT+30) < Screen.Height then
       Form.Top:= PT.Y + Height                     {drop downwards}
     else if (PT.Y - POPHEIGHT) < 0 then
       Form.Top:= 0                                 {drop center}
       else Form.Top:= PT.Y - POPHEIGHT;     {drop upwards}
     {horz}
     if (PT.X + Width) < Screen.Width then
       Form.Left:= PT.X
     else Form.Left:= Screen.Width - Width;
  {$ENDIF}
end;

end.
