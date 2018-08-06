{******************************************************}
{                  rsPage Components                   }
{        Copyright 1997 RealSoft Development           }
{           support:  www.realsoftdev.com              }
{******************************************************}
unit Rspage;

interface

{$I REALSOFT.INC}

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls;

type
  TOnCreatePage = procedure (Sender: TObject; PageIndex: integer; PageName: String;
                             var NewForm: TForm; var Scroll: TScrollStyle) of object;
  TOnPageAction = procedure (Sender: TObject; PageIndex: integer; PageName: String) of object;

  TrsPageBox = class(TScrollBox)
  private
    FPages: TStrings;
    FIndex: smallint;
    FStartindex: smallint;
    FCenterHorz: boolean;
    FCenterVert: boolean;
    FAutoSize: boolean;
    FCurrPage: TForm;
    FLastResult: TModalResult;
    FAutoFocus: boolean;
    FScroll: TScrollStyle;
    FOnScroll: TNotifyEvent;
    FOnCreatePage: TOnCreatePage;
    FOnShowPage: TOnPageAction;
    FOnFreePage: TOnPageAction;
    procedure SetPages(Value: TStrings);
    procedure SetIndex(Value: smallint);
    procedure SetStartIndex(Value: smallint);
    procedure SetActivePage(const Value: string);
    function  GetActivePage: string;
  protected
    procedure WMVSCROLL(var Message: TWMVScroll); message WM_VSCROLL;
    procedure WMHSCROLL(var Message: TWMHScroll); message WM_HSCROLL;
    procedure WMPAINT(var Message: TWMPAINT); message WM_PAINT;
    procedure WMSIZE(var Message: TWMSIZE); message WM_SIZE;    
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    procedure Loaded; override;
    property ActivePage: string           read GetActivePage   write SetActivePage stored False;
    property PageIndex: smallint          read FIndex          write SetIndex;
    property Page: TForm                  read FCurrPage;
    property LastResult: TModalResult     read FLastResult;
  published
    property CenterHorz: boolean          read FCenterHorz     write FCenterHorz;
    property CenterVert: boolean          read FCenterVert     write FCenterVert;
    property Pages: TStrings              read FPages          write SetPages;
    property StartIndex: smallint         read FStartIndex     write SetStartIndex;
    property AutoFocus: boolean           read FAutoFocus      write FAutoFocus;
    property AutoSize: boolean            read FAutoSize       write FAutoSize;
    property OnScroll: TNotifyEvent       read FOnScroll       write FOnScroll;
    property OnCreatePage: TOnCreatePage  read FOnCreatePage   write FOnCreatePage;
    property OnShowPage: TOnPageAction    read FOnShowPage     write FOnShowPage;
    property OnFreePage: TOnPageAction    read FOnFreePage     write FOnFreePage;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('RSD', [TrsPageBox]);
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

{***********************}
{  rsPageBox Component  }
{***********************}
procedure TrsPageBox.WMHSCROLL(var Message: TWMHScroll);
begin
  if Assigned(FOnScroll) then OnScroll(Self);
  if Message.ScrollCode = SB_THUMBTRACK then
    HorzScrollBar.Position:= Message.Pos;
  inherited;
end;

procedure TrsPageBox.WMVSCROLL(var Message: TWMVScroll);
begin
  if Assigned(FOnScroll) then OnScroll(Self);
  if Message.ScrollCode = SB_THUMBTRACK then
    VertScrollBar.Position:= Message.Pos;
  inherited;
end;

constructor TrsPageBox.Create( AOwner : TComponent );
begin
  inherited Create(AOwner);
  FPages:= TStringList.Create;
  FCurrPage:= nil;
  FIndex:= -1;
  FStartindex:= -1;
  Width:= 105;
  Height:= 105;
  BorderStyle:= bsNone;
  FCenterHorz:= false;
  FCenterVert:= false;
  FAutoFocus:= true;
  FAutoSize:= false;  
  {$IFDEF DEMO}
  if not DelphiRunning then
     showmessage('This program is using an unregistered version of the TrsPageBox' + #13 +
                 'component from RealSoft.  Please register at www.realsoftdev.com' + #13 +
                 'or call (949) 831-7879.');
  {$ENDIF}
end;

destructor TrsPageBox.Destroy;
begin
  FPages.Free;
  inherited Destroy;
end;

procedure TrsPageBox.Loaded;
begin
  inherited Loaded;
  if FStartIndex > -1 then PageIndex:= FStartIndex;
end;

procedure TrsPageBox.WMPAINT(var Message: TWMPaint);
begin
  inherited;
  if csDesigning in ComponentState then
    with TControlCanvas.Create do begin
      Control:= Self;
      Pen.Color:= clBlack;
      Pen.Style:= psDash;
      Brush.Style:= bsSolid;
      Brush.Color:= clBtnFace;
      Rectangle(0, 0, Width, Height);
      Free;
      end;
end;

procedure TrsPageBox.WMSIZE(var Message: TWMSize);
begin
  inherited;
  if not FAutoSize then exit;
  if FCurrPage = nil then Exit;
  if csDestroying in Componentstate then Exit;
  if not (FScroll = ssNone) then Exit;
  FCurrPage.left:= 0;
  FCurrPage.top:= 0;
  FCurrPage.width:= width;
  FCurrPage.height:= height;  
end;

procedure TrsPageBox.SetPages(Value: TStrings);
begin
  FPages.Assign(Value);
end;

procedure TrsPageBox.SetActivePage(const Value: string);
begin
  PageIndex:= FPages.IndexOf(Value);
end;

function TrsPageBox.GetActivePage: string;
begin
  if FIndex > -1 then Result := FPages[FIndex]
  else Result:= '';
end;

procedure TrsPageBox.SetStartIndex(Value: smallint);
begin
  if (Value > -2) and (Value < FPages.Count) then FStartIndex:= Value;
end;

procedure TrsPageBox.SetIndex(Value: smallint);
begin
  if csDesigning in componentstate then Exit;
  if Value = FIndex then Exit;
  {free current page}
  if FCurrPage <> nil then begin
    FLastResult:= FCurrPage.ModalResult;
    FCurrPage.Hide;
    if Assigned(FOnFreePage) then
      OnFreePage(Self, FIndex, FPages[FIndex]);
    FCurrPage.Release;
    end;
  FCurrPage:= NIL;
  FIndex:= -1;
  {Exit if index out of bounds}
  if (Value > FPages.Count-1) or (Value < 0) then Exit;
  FIndex:= Value;
  {create new page}
  FScroll:= ssBoth;
  if Assigned(FOnCreatePage) then
    OnCreatePage(Self, FIndex, FPages[FIndex], FCurrPage, FScroll);
  if FCurrPage = nil then Exit;
  FCurrPage.Visible:= false;
  {setup new page}
  VertScrollBar.Position:= 0;
  HorzScrollBar.Position:= 0;
  FCurrPage.BorderStyle:= bsNone;
  FCurrPage.Top:= 0;
  FCurrPage.Left:= 0;
  {Assign Parent}
  FCurrPage.Parent:= Self;
  {Calculate Scroll Height/Width}
  FCurrPage.AutoScroll:= true;
  {Hide/Show Scrollbox ScrollBars}
  case FScroll of
    ssNone:
      begin
      VertScrollBar.Visible:= false;
      HorzScrollBar.Visible:= false;
      FCurrPage.Width:= Width;
      FCurrPage.Height:= Height;
      end;
    ssVertical:
      begin
      VertScrollBar.Visible:= true;
      HorzScrollBar.Visible:= false;
      FCurrPage.Width:= Width;
      FCurrPage.Height:= FCurrPage.VertScrollBar.Range;
      end;
    ssHorizontal:
      begin
      HorzScrollBar.Visible:= true;
      VertScrollBar.Visible:= false;
      FCurrPage.Height:= Height;
      FCurrPage.Width:= FCurrPage.HorzScrollBar.Range;
      end;
    ssBoth:
      begin
      VertScrollBar.Visible:= true;
      HorzScrollBar.Visible:= true;
      FCurrPage.Width:= FCurrPage.HorzScrollBar.Range;
      FCurrPage.Height:= FCurrPage.VertScrollBar.Range;
      end;
    end;
  {Hide form's scrollbars}
  FCurrPage.AutoScroll:= false;
  FCurrPage.VertScrollBar.Position:= 0;
  FCurrPage.HorzScrollBar.Position:= 0;
  FCurrPage.VertScrollBar.Visible:= false;
  FCurrPage.HorzScrollBar.Visible:= false;
  FCurrPage.Position:= poDesigned;
  {Center}
  if FCenterHorz and (FCurrPage.Width < Width) then
    FCurrPage.Left:= (Width - FCurrPage.Width) div 2;
  if FCenterVert and (FCurrPage.Height < Height) then begin
    FCurrPage.Top:=  (Height - FCurrPage.Height) div 2;
    end;
  {Show form}
  if Assigned(FOnShowPage) then
    OnShowPage(Self, FIndex, FPages[FIndex]);
  FCurrPage.visible:= true;
  if FAutoFocus then
    PostMessage(FCurrPage.Handle, WM_SETFOCUS, 0 ,0);
end;

(*
procedure TrsPageBox.SetIndex(Value: smallint);
var Scroll: TScrollStyle;
begin
  if csDesigning in componentstate then Exit;
  if Value = FIndex then Exit;
  {free current page}
  if FCurrPage <> nil then begin
    FLastResult:= FCurrPage.ModalResult;
    FCurrPage.Hide;
    if Assigned(FOnFreePage) then
      OnFreePage(Self, FIndex, FPages[FIndex]);
    FCurrPage.Release;
    end;
  FCurrPage:= NIL;
  FIndex:= -1;
  {Exit if index out of bounds}
  if (Value > FPages.Count-1) or (Value < 0) then Exit;
  FIndex:= Value;
  {create new page}
  Scroll:= ssBoth;
  if Assigned(FOnCreatePage) then
    OnCreatePage(Self, FIndex, FPages[FIndex], FCurrPage, Scroll);
  if FCurrPage = nil then Exit;
  FCurrPage.Visible:= false;
  {setup new page}
  VertScrollBar.Position:= 0;
  HorzScrollBar.Position:= 0;
  FCurrPage.BorderStyle:= bsNone;
  FCurrPage.Top:= 0;
  FCurrPage.Left:= 0;
  {Hide/Show Scrollbox ScrollBars}
  case Scroll of
    ssNone:
      begin
      VertScrollBar.Visible:= false;
      HorzScrollBar.Visible:= false;
      FCurrPage.Width:= Width;
      FCurrPage.Height:= Height;
      end;
    ssVertical:
      begin
      VertScrollBar.Visible:= true;
      HorzScrollBar.Visible:= false;
      FCurrPage.Width:= Width;
      end;
    ssHorizontal:
      begin
      HorzScrollBar.Visible:= true;
      VertScrollBar.Visible:= false;
      FCurrPage.Height:= Height;
      end;
    ssBoth:
      begin
      VertScrollBar.Visible:= true;
      HorzScrollBar.Visible:= true;
      end;
    end;
  {Assign Parent}
  FCurrPage.Parent:= Self;
  {Calculate Scroll Height/Width}
  FCurrPage.AutoScroll:= true;
  FCurrPage.Width:= FCurrPage.HorzScrollBar.Range;
  FCurrPage.Height:= FCurrPage.VertScrollBar.Range;
  {Hide form's scrollbars}
  FCurrPage.AutoScroll:= false;
  FCurrPage.VertScrollBar.Position:= 0;
  FCurrPage.HorzScrollBar.Position:= 0;
  FCurrPage.VertScrollBar.Visible:= false;
  FCurrPage.HorzScrollBar.Visible:= false;
  FCurrPage.Position:= poDesigned;
  {Center}
  if FCenterHorz and (FCurrPage.Width < Width) then
    FCurrPage.Left:= (Width - FCurrPage.Width) div 2;
  if FCenterVert and (FCurrPage.Height < Height) then begin
    FCurrPage.Top:=  (Height - FCurrPage.Height) div 2;
    end;
  {Show form}
  if Assigned(FOnShowPage) then
    OnShowPage(Self, FIndex, FPages[FIndex]);
  FCurrPage.visible:= true;
  if FAutoFocus then
    PostMessage(FCurrPage.Handle, WM_SETFOCUS, 0 ,0);
end;
*)


end.
