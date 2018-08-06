{******************************************************}
{                 rsShortCutBar V1.0                   }
{        Copyright 1998 RealSoft Development           }
{           support:  www.realsoftdev.com              }
{******************************************************}

unit rsShort;

interface

{$I REALSOFT.INC}

uses
  WinTypes, WinProcs, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Menus, Buttons, rsFlyOvr, rsImgLst;

type
  TOnButtonChange = procedure(Sender: TObject; ButtonIndex: integer) of object;

  TrsShortCutBar = class(TCustomControl)
  private
    FHeader: string;
    FImages: TrsImageList;
    FCaptions: TStrings;
    FButtons: TList;
    FLabels: TList;
    FSpacing: integer;
    FHHeight: integer;
    FBtnUp,
    FBtnDown: TSpeedButton;
    FTopIndex: integer;
    FButtonChange: TOnButtonChange;
    procedure SetHeader(AValue: string);
    procedure SetImages(AValue: TrsImageList);
    procedure SetCaptions(AValue: TStrings);
    procedure SetSpacing(AValue: integer);
    procedure SetHHeight(AValue: integer);
    procedure UpClick(Sender: TObject);
    procedure DownClick(Sender: TObject);
    procedure ButtonClick(Sender: TObject);
    procedure SetButtonIndex(AValue: integer);
    function  GetButtonIndex: integer;
  protected
    procedure Paint; override;
    procedure Loaded; override;
    procedure Notification( AComponent : TComponent; Operation : TOperation); override;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Invalidate; override;
    procedure UpdateControls;
    procedure DestroyControls;
    procedure UpdateControlPos;
    property ButtonIndex: integer	read GetButtonIndex	write SetButtonIndex;
  published
    property HeaderText: string		read FHeader		write SetHeader;
    property Captions: TStrings		read FCaptions		write SetCaptions;
    property Images: TrsImageList	read FImages		write SetImages;
    property Spacing: integer		read FSpacing		write SetSpacing;
    property HeaderHeight: integer	read FHHeight		write SetHHeight;
    property OnButtonChange: TOnButtonChange
    					read FButtonChange	write FButtonChange;
    property Font;
    property PopUpMenu;
    property Color;
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
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('RSD', [TrsShortCutBar]);
end;

function TabsTo13(const S: string): string;
var x: integer;
begin
  Result:= '';
  for x:= 1 to length(S) do
    if S[x] = #9 then
      Result:= Result + #13
    else
      Result:= Result + S[x];
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

constructor TrsShortCutBar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle - [csAcceptsControls];
  Align := alLeft;
  Color := clBtnShadow;
  Width := 89;
  FHeader := 'Shortcuts';
  FImages := nil;
  FButtonChange:= nil;
  FCaptions := TStringList.Create;
  FButtons := TList.create;
  FLabels := TList.create;
  FSpacing := 64;
  FHHeight := 23;  
  FTopIndex:= 0;
  FBtnUp:= TSpeedButton.create(self);
  FBtnUp.parent:= self;
  FBtnUp.caption:= '';
  FBtnUp.width:= 15;
  FBtnUp.height:= 15;
  FBtnUp.Font.name:= 'Marlett';
  FBtnUp.Font.size:= 8;
  FBtnUp.Font.style:= [];
  FBtnUp.caption:= 't';
  FBtnUp.visible:= false;
  FBtnUp.OnClick:= UpClick;
  FBtnDown:= TSpeedButton.create(self);
  FBtnDown.parent:= self;
  FBtnDown.caption:= '';
  FBtnDown.width:= 15;
  FBtnDown.height:= 15;
  FBtnDown.Font.name:= 'Marlett';
  FBtnDown.Font.size:= 8;
  FBtnDown.Font.style:= [];
  FBtnDown.caption:= 'u';
  FBtnDown.visible:= false;
  FBtnDown.OnClick:= DownClick;
end;

destructor TrsShortCutBar.Destroy;
begin
  DestroyControls;
  FButtons.free;
  FLabels.free;
  FCaptions.free;
  inherited Destroy;
end;

procedure TrsShortCutBar.Loaded;
begin
  inherited Loaded;
  UpdateControls;
  if not (csDesigning in componentstate) then
    if FCaptions.count > 0 then
      TrsFlyOverButton(FButtons[0]).Down;
  {$IFDEF DEMO}
  if not DelphiRunning then  {for trial version only}
    showmessage('This program is using an unregistered copy of the TrsShortCutBar' + #13 +
                'component from RealSoft.  Please register at www.realsoftdev.com' + #13 +
                'or call (949) 831-7879.');
  {$ENDIF}
end;

procedure TrsShortCutBar.Notification( AComponent : TComponent; Operation : TOperation );
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FImages) then FImages := nil;
end;

procedure TrsShortCutBar.CMFontChanged(var Message: TMessage);
begin
  inherited;
  Invalidate;
end;

procedure TrsShortCutBar.WMSize(var Message: TWMSize);
begin
  inherited;
  Invalidate;
end;

procedure TrsShortCutBar.Invalidate;
begin
  inherited Invalidate;
  UpdateControlPos;
end;

procedure TrsShortCutBar.Paint;
var
  R: TRect;
  X,Y: integer;
begin
  inherited Paint;
  with Canvas do
  begin
    {header}
    if FHHeight > 0 then
    begin
      R:= Rect(0,0,width, FHHeight);
      Brush.Color:= clBtnFace;
      Brush.Style:= bsSolid;
      FillRect(R);
      R:= Rect(1,1,width, FHHeight);
      Brush.Color:= clBtnHighlight;
      FrameRect(R);
      R:= Rect(0,0,width-1, FHHeight);
      Brush.Color:= clBtnShadow;
      FrameRect(R);
      Brush.Style:= bsClear;
      Font.Assign(Self.Font);
      X:= (Width - TextWidth(FHeader)) div 2;
      Y:= (FHHeight - TextHeight('X')) div 2;
      TextOut(X,Y, FHeader);
    end;
    {main frame}
    R:= Rect(0,FHHeight,width, height);
    Brush.Color:= clBtnHighlight;
    Brush.Style:= bsSolid;
    FrameRect(R);
    R:= Rect(0,FHHeight,width-1, height-1);
    Brush.Color:= clBtnShadow;
    FrameRect(R);
    R:= Rect(1,FHHeight,width-2, height-2);
    Brush.Color:= clBlack;
    FrameRect(R);
    R:= Rect(2,FHHeight+1,width-2, height-2);
    Brush.Color:= Color;
    FrameRect(R);
  end;
end;

function  TrsShortCutBar.GetButtonIndex: integer;
var
  x: integer;
begin
  result:= -1;
  for x:= 0 to FButtons.count-1 do
    if TrsFlyOverButton(FButtons[x]).State = bsGroupDown then
      result:= x;
end;

procedure TrsShortCutBar.SetButtonIndex(AValue: integer);
begin
  if TrsFlyOverButton(FButtons[AValue]).State = bsGroupDown then Exit;
  TrsFlyOverButton(FButtons[AValue]).Down;
  if Assigned(FButtonChange) then FButtonChange(Self, AValue);
end;

procedure TrsShortCutBar.SetHeader(AValue: string);
begin
  FHeader:= AValue;
  Invalidate;
end;

procedure TrsShortCutBar.SetImages(AValue: TrsImageList);
begin
  FImages:= AValue;
  UpdateControls;
  Invalidate;
end;

procedure TrsShortCutBar.SetCaptions(AValue: TStrings);
begin
  FCaptions.Assign(AValue);
  UpdateControls;
  Invalidate;
end;

procedure TrsShortCutBar.SetSpacing(AValue: integer);
begin
  FSpacing:= AValue;
  Invalidate;
end;

procedure TrsShortCutBar.SetHHeight(AValue: integer);
begin
  FHHeight:= AValue;
  Invalidate;
end;

procedure TrsShortCutBar.UpdateControls;
var
  tmpbtn: TrsFlyOverButton;
  tmplab: TLabel;
  x: integer;
  tmpchr: array[0..255] of char;
  Rect: TRect;
begin
  DestroyControls;
  for x:= 0 to FCaptions.count-1 do
  begin
    {button}
    tmpbtn:= TrsFlyOverButton.create(self);
    tmpbtn.Parent:= self;
    tmpbtn.visible:= false;
    tmpbtn.width:= 36;
    tmpbtn.height:= 36;
    tmpbtn.caption:= '';
    tmpbtn.GroupID:= 32767;
    tmpbtn.Options:= tmpbtn.Options + [foBlackLine];
    if FImages <> nil then
      if FImages.Count-1 >= x then
        tmpbtn.GlyphActive.Assign(FImages[x+1]);
    tmpbtn.OnClick:= ButtonClick;
    FButtons.Add(tmpbtn);
    {label}
    tmplab:= TLabel.create(self);
    tmplab.Parent:= self;
    tmplab.visible:= false;
    tmplab.autosize:= false;
    tmplab.Alignment:= taCenter;
    tmplab.transparent:= true;
    tmplab.font.assign(Font);
    tmplab.font.color:= clWhite;
    Rect:= tmplab.clientrect;
    tmplab.caption:= TabsTo13(FCaptions[x]);
    strpcopy(tmpchr, tmplab.caption);
    DrawText(tmplab.Canvas.Handle, tmpchr, strlen(tmpchr), Rect, DT_CALCRECT);
    tmplab.Height:= Rect.Bottom;
    FLabels.Add(tmplab);
  end;
  UpdateControlPos;
end;

procedure TrsShortCutBar.DestroyControls;
var
  x: integer;
begin
  for x:= 0 to FButtons.count-1 do
    TControl(FButtons[x]).free;
  for x:= 0 to FLabels.count-1 do
    TControl(FLabels[x]).free;
  FButtons.clear;
  FLabels.clear;
end;

procedure TrsShortCutBar.UpdateControlPos;
var x: integer;
begin
  if FButtons = nil then Exit;
  if csLoading in ComponentState then Exit;
  if FButtons.count <> FCaptions.count then Exit;
  for x:= 0 to FCaptions.count-1 do
  begin
    if x >= FTopIndex then
    begin
      TControl(FButtons[x]).left:= (width - TControl(FButtons[x]).width) div 2;
      TControl(FButtons[x]).top:= FHHeight + 10 + ((x-FTopIndex) * FSpacing);
      TControl(FButtons[x]).visible:= true;
      TControl(FLabels[x]).left:= 0;
      TControl(FLabels[x]).width:= width;
      TControl(FLabels[x]).top:= TControl(FButtons[x]).top + 36;
      TControl(FLabels[x]).visible:= true;
    end
    else begin
      TControl(FButtons[x]).visible:= false;
      TControl(FLabels[x]).visible:= false;
    end;
  end;
  FBtnUp.Bringtofront;
  FBtnUp.Top:= (FHHeight + 10) - 4;
  FBtnUp.Left:= Width - (FBtnUp.Width + 4);
  FBtnDown.Bringtofront;
  FBtnDown.Top:= Height - (FBtnUp.Height + 4);
  FBtnDown.Left:= Width - (FBtnDown.Width + 4);
  if FTopIndex = 0 then
  begin
    FBtnUp.visible:= false;
    if (FCaptions.count * (FSpacing-1)) > (Height - (FHHeight + 10)) then
      FBtnDown.visible:= true
    else
      FBtnDown.visible:= false;
  end
  else begin
    FBtnUp.visible:= true;
    if FTopIndex+1 >= FCaptions.count - ((Height - (FHHeight + 10)) div FSpacing) then
      FBtnDown.visible:= false
    else
      FBtnDown.visible:= true;
  end;
end;

procedure TrsShortCutBar.UpClick(Sender: TObject);
begin
  dec(FTopIndex);
  UpdateControlPos;
end;

procedure TrsShortCutBar.DownClick(Sender: TObject);
begin
  inc(FTopIndex);
  UpdateControlPos;
end;

procedure TrsShortCutBar.ButtonClick(Sender: TObject);
var
  x: integer;
begin
  for x:= 0 to FButtons.count-1 do
    if FButtons[x] = Sender then
      if Assigned(FButtonChange) then FButtonChange(Self, x);
end;


end.
