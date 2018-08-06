{******************************************************}
{                rsDBSuperEdit V1.0                    }
{        Copyright 1997 RealSoft Development           }
{           support:  www.realsoftdev.com              }
{******************************************************}

unit RseditDB;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Menus, Mask, DB, DBCtrls, DBTables, rsEdit;

type
  TrsDBSuperEdit = class(TrsSuperEdit)
  private
    FDataLink: TFieldDataLink;
    FCanvas: TControlCanvas;
    FAlignment: TAlignment;
    FFocused: Boolean;
    procedure DataChange(Sender: TObject);
    function GetDataField: string;
    function GetDataSource: TDataSource;
    function GetField: TField;
    function GetReadOnly: Boolean;
    procedure SetDataField(const Value: string);
    procedure SetDataSource(Value: TDataSource);
    procedure SetFocused(Value: Boolean);
    procedure SetReadOnly(Value: Boolean);
    procedure UpdateData(Sender: TObject);
    procedure WMCut(var Message: TMessage); message WM_CUT;
    procedure WMPaste(var Message: TMessage); message WM_PASTE;
    procedure CMEnter(var Message: TCMEnter); message CM_ENTER;
    procedure CMExit(var Message: TCMExit); message CM_EXIT;
  protected
    procedure Change; override;
    function  EditCanModify: Boolean; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure Reset; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Field: TField read GetField;
  published
    property AutoSelect;
    property AutoSize;
    property BorderStyle;
    property CharCase;
    property Color;
    property Ctl3D;
    property DataField: string        read GetDataField   write SetDataField;
    property DataSource: TDataSource  read GetDataSource  write SetDataSource;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property MaxLength;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PasswordChar;
    property PopupMenu;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly default False;
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
  RegisterComponents('RSD', [TrsDBSuperEdit]);
end;

constructor TrsDBSuperEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  inherited ReadOnly := False;
  FDataLink := TFieldDataLink.Create;
  FDataLink.Control := Self;
  FDataLink.OnDataChange := DataChange;
  FDataLink.OnUpdateData := UpdateData;
end;

destructor TrsDBSuperEdit.Destroy;
begin
  FDataLink.Free;
  FDataLink := nil;
  FCanvas.Free;
  inherited Destroy;
end;

procedure TrsDBSuperEdit.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (FDataLink <> nil) and (AComponent = DataSource) then
    DataSource := nil;
end;

procedure TrsDBSuperEdit.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited KeyDown(Key, Shift);
  if (Key = VK_DELETE) or ((Key = VK_INSERT) and (ssShift in Shift)) then FDataLink.Edit;
end;

procedure TrsDBSuperEdit.KeyPress(var Key: Char);
begin
  inherited KeyPress(Key);
  if (Key in [#32..#255]) and (FDataLink.Field <> nil) and
    not FDataLink.Field.IsValidChar(Key) then begin
    MessageBeep(0);
    Key := #0;
    end;
  case Key of
    ^H, ^V, ^X, #32..#255:
      FDataLink.Edit;
    #27: begin
        FDataLink.Reset;
        SelectAll;
        Key := #0;
        end;
    end;
end;

function TrsDBSuperEdit.EditCanModify: Boolean;
begin
  Result := FDataLink.Edit;
end;

procedure TrsDBSuperEdit.Reset;
begin
  FDataLink.Reset;
  SelectAll;
end;

procedure TrsDBSuperEdit.SetFocused(Value: Boolean);
begin
  if FFocused <> Value then begin
    FFocused := Value;
    if (FAlignment <> taLeftJustify) and not IsMasked then Invalidate;
    FDataLink.Reset;
    end;
end;

procedure TrsDBSuperEdit.Change;
begin
  FDataLink.Modified;
  inherited Change;
end;

function TrsDBSuperEdit.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

procedure TrsDBSuperEdit.SetDataSource(Value: TDataSource);
begin
  FDataLink.DataSource := Value;
end;

function TrsDBSuperEdit.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

procedure TrsDBSuperEdit.SetDataField(const Value: string);
begin
  FDataLink.FieldName := Value;
end;

function TrsDBSuperEdit.GetReadOnly: Boolean;
begin
  Result := FDataLink.ReadOnly;
end;

procedure TrsDBSuperEdit.SetReadOnly(Value: Boolean);
begin
  FDataLink.ReadOnly := Value;
end;

function TrsDBSuperEdit.GetField: TField;
begin
  Result := FDataLink.Field;
end;

procedure TrsDBSuperEdit.DataChange(Sender: TObject);
var M: String;
begin
  M:= EditMask;
  if FDataLink.Field <> nil then begin
    EditMask := '';
    if FDataLink.Field.DataType = ftString then MaxLength := FDataLink.Field.Size
    else MaxLength := 0;
    if FFocused and FDataLink.CanModify then Text := FDataLink.Field.Text
    else EditText := FDataLink.Field.DisplayText;
    EditMask := M;
    end
  else begin
    EditMask := M;
    MaxLength := 0;
    if csDesigning in ComponentState then EditText := Name
    else EditText := '';
    end;
end;

procedure TrsDBSuperEdit.UpdateData(Sender: TObject);
var M: String;
begin
  M:= EditMask;
  {ValidateEdit;}
  EditMask:= '';
  FDataLink.Field.Text := Text;
  EditMask:= M;
end;

procedure TrsDBSuperEdit.WMPaste(var Message: TMessage);
begin
  FDataLink.Edit;
  inherited;
end;

procedure TrsDBSuperEdit.WMCut(var Message: TMessage);
begin
  FDataLink.Edit;
  inherited;
end;

procedure TrsDBSuperEdit.CMEnter(var Message: TCMEnter);
begin
  SetFocused(True);
  inherited;
end;

procedure TrsDBSuperEdit.CMExit(var Message: TCMExit);
begin
  try
    FDataLink.UpdateRecord;
  except
    SelectAll;
    SetFocus;
    raise;
  end;
  SetFocused(False);
  SetCursor(0);
  DoExit;
end;


end.
