{******************************************************}
{               rsSuperMemo Component                  }
{        Copyright 1998 RealSoft Development           }
{           support:  www.realsoftdev.com              }
{******************************************************}

unit Rsmemo;

interface

{$I REALSOFT.INC}

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, Menus;

type
  TrsSuperMemo = class(TMemo)
  private
    FOnReturn: TNotifyEvent;
    FLocator   : boolean;
    FLocColor  : TColor;
    FOldColor  : TColor;
    FShowGray  : boolean;
    FEnterToTab : boolean;
    procedure SetShowGray(AValue : Boolean);
  protected
    procedure DoEnter; 					override;
    procedure DoExit; 					override;
    procedure Loaded; 					override;
    procedure KeyPress(var Key: Char); 			override;
    procedure CMSetEnabled(var Message: TMessage); 	message CM_ENABLEDCHANGED;
    procedure WMSetColor(var Message: TMessage); 	message CM_COLORCHANGED;
    procedure WMPaint(var Message: TWMPaint); 		message WM_PAINT;
  public
    constructor Create(AOwner: TComponent); 		override;
  published
    property Locator    : boolean      read FLocator     write FLocator       default false;
    property LocColor   : TColor       read FLocColor    write FLocColor      default clAqua;
    property ShowGray   : boolean      read FShowGray    write SetShowGray    default true;
    property EnterToTab : boolean      read FEnterToTab  write FEnterToTab    default false;
    property OnReturn   : TNotifyEvent read FOnReturn    write FOnReturn;
  end;

procedure Register;

implementation


procedure Register;
begin
  RegisterComponents('RSD', [TrsSuperMemo]);
end;

{***************************}
{     rsCustomComboBox      }
{***************************}
constructor TrsSuperMemo.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FLocator:= false;
  FLocColor:= clAqua;
  FShowGray:= true;
  FOnReturn:= nil;
  FEntertoTab:= false;
  ControlStyle := ControlStyle - [csSetCaption];
end;

procedure TrsSuperMemo.Loaded;
{$IFDEF LOCATOR}
var F: TWinControl;
{$ENDIF}
begin
  inherited Loaded;
  FOldColor:= Color;
  {$IFDEF LOCATOR}
  F := GetParentForm( Self );
  if F.Tag > 32767 then FLocator:= true;
  {$ENDIF}
end;

procedure TrsSuperMemo.KeyPress(var Key: Char);
var F: TWinControl;
begin
  {Handle enter like TAB}
  if not WantReturns then
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
  inherited KeyPress(Key);
end;

procedure TrsSuperMemo.DoEnter;
begin
  if FLocator = true then Color:= FLocColor;
  inherited DoEnter;
end;

procedure TrsSuperMemo.DoExit;
begin
  if FLocator = true then Color:= FOldColor;
  inherited DoExit;
end;

procedure TrsSuperMemo.CMSetEnabled(var Message: TMessage);
begin
  inherited;
  Invalidate;
end;

procedure TrsSuperMemo.WMSetColor(var Message: TMessage);
begin
  inherited;
  if (Color <> clBtnFace) and (Color <> LocColor) then FOldColor:= Color;
end;

procedure TrsSuperMemo.WMPaint(var Message: TWMPaint);
var Gray: boolean;
begin
  Gray:= (not Enabled) and (ShowGray) and (not Focused);
  if Gray then Color:= clbtnFace;
  if (not Gray) and (not (Color = LocColor)) then Color:= clWindow;
  inherited;
end;

procedure TrsSuperMemo.SetShowGray(AValue : Boolean);
begin
  FShowGray:= AValue;
  Invalidate;
end;



end.
