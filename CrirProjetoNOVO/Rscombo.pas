{******************************************************}
{              rsSuperComboBox Component               }
{        Copyright 1997 RealSoft Development           }
{           support:  www.realsoftdev.com              }
{******************************************************}

unit rscombo;

interface

{$I REALSOFT.INC}

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, Menus, dsgnintf, Grids, printers,
  rsimglst;

type
  TCodeStringList = class(TStringList);

  TrsCustomComboBox = class(TComboBox)
  private
    FOnReturn: TNotifyEvent;
    FLocator   : boolean;
    FLocColor  : TColor;
    FOldColor  : TColor;
    FShowGray  : boolean;
    FEnterToTab : boolean;
    procedure SetShowGray(AValue : Boolean);
    procedure SetItem(AValue : string);
    function  GetItem: string;
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
    property Item: string	       read GetItem	 write SetItem;
  published
    property Locator    : boolean      read FLocator     write FLocator       default false;
    property LocColor   : TColor       read FLocColor    write FLocColor      default clAqua;
    property ShowGray   : boolean      read FShowGray    write SetShowGray    default true;
    property EnterToTab : boolean      read FEnterToTab  write FEnterToTab    default true;
    property OnReturn   : TNotifyEvent read FOnReturn    write FOnReturn;
  end;

  TrsComboStyle = (rcsStandard, rcsItemList, rcsCodeList, rcsMultiCode);

  TrsSuperComboBox = class(TrsCustomComboBox)
  private
    FCodeLen: byte;
    FCodes: TCodeStringList;
    FStyle: TrsComboStyle;
    FMaxMult: integer;
    FImages: TrsImageList;
    FGlyphs: boolean;
    FTagName: String ;
    FTagFieldType : Integer ;
    procedure SetCodes(AValue: TCodeStringlist);
    function GetCode: string;
    procedure SetCode(AValue: string);
    function GetMCode: string;
    procedure SetMCode(AValue: string);
    function GetCCode: char;
    procedure SetCCode(AValue: char);
    procedure SetCStyle(AValue: TrsComboStyle);
    function StoreItems: boolean;
    function StoreText: boolean;
    procedure SortCodes;
    procedure QuickSort(fnum, L1, R1: Integer);
    procedure DrawCheckBox(ARect: TRect; Checked: boolean);
    procedure DrawCtl3D(R : TRect; ACanvas : TCanvas);
    procedure DrawMultiText;
    function GetMText: string;
    function CheckMax: boolean;
    Function  GetFieldName : String ;
    procedure SetFieldName(AValue : String);
  protected
    procedure Loaded;								override;
    procedure DropDown;								override;
    procedure Change;								override;
    procedure DrawItem(Index: integer; ARect: TRect; State: TOwnerdrawState);	override;
    procedure KeyUp(var Key: Word; Shift: TShiftState);				override;
    procedure Notification(AComponent: TComponent; Operation: TOperation);	override;
  public
    constructor Create(AOwner: TComponent); 					override;
    destructor Destroy;								override;
    procedure DefaultHandler(var Message);					override;
    procedure InitCodes;
    procedure SelectAllCodes;
    property Code: String		read GetCode	write SetCode;
    property CharCode: char		read GetCCode	write SetCCode;
    property MultiCode: String		read GetMCode	write SetMCode;
    property MultiText: String		read GetMText;
  published
    property Images: TrsImageList       read FImages    write FImages;
    property Glyphs: boolean            read FGlyphs    write FGlyphs	default false;
    property Codes: TCodeStringlist	read FCodes  	write SetCodes;
    property ComboStyle: TrsComboStyle	read FStyle  	write SetCStyle	default rcsStandard;
    property CodeLength: byte		read FCodeLen	write FCodeLen	default 3;
    property MaxMulti: integer		read FMaxMult	write FMaxMult	default 0;
    property Items 			stored StoreItems;
    property Text			stored StoreText;
    property TagName: String            read GetFieldName    write SetFieldName ;
    property TagFieldType : Integer read FTagFieldType Write FTagFieldType ;
  end;

  TdlgCodeClass = class
  private
  public
    dlgCode : TForm;
    Grid : TStringGrid;
    btnOk : TButton;
    btnCancel : TButton;
    btnPrint : TButton;
    btnIns : TSpeedButton;
    btnRem : TSpeedButton;
    constructor Create;
    destructor Destroy; override;
  end;

  TCodeEditor = class(TDefaultEditor)
  public
    function GetVerbCount : Integer; 			override;
    function GetVerb( Index : Integer ) : string; 	override;
    procedure ExecuteVerb( Index : Integer ); 		override;
    procedure Edit; 					override;
    procedure EditProperty(PropertyEditor: TPropertyEditor;
              var Continue, FreeEditor: Boolean); 	override;
  end;

  TCodesProperty = class(TPropertyEditor)
  private
    CodeForm: TdlgCodeClass;
    tmplist: TStrings;
    parentCC: TComponent;
    procedure GridKeyPress( Sender: TObject; var Key: Char );
    procedure ButtonClick( Sender: TObject );
    procedure FillGrid( L: TStrings );
    procedure GetGrid( L: TStrings );
    procedure Print;
    constructor Create;
  public
    destructor Destroy; override;
    procedure Edit; 					override;
    function GetAttributes : TPropertyAttributes;	override;
    function GetValue : string; 			override;
  end;


procedure Register;

implementation

Const
   FIELDTYPE_TEXT = 1 ;
   FIELDTYPE_ITEM = 2 ;
   FIELDTYPE_CODE = 3 ;

procedure Register;
begin
  RegisterComponents('RSD', [TrsSuperComboBox]);
  RegisterPropertyEditor(typeinfo(TCodeStringList), nil, 'Codes', TCodesProperty);
  RegisterComponentEditor(TrsSuperComboBox, TCodeEditor);
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

function GetSCode(S: string): string;
var x: integer;
begin
  result:= '';
  x:= pos(#9, S);
  if x <= 0 then Exit;
  result:= copy(S,1,x-1);
end;

function GetSDesc(S: string): string;
var x: integer;
begin
  result:= '';
  x:= pos(#9, S);
  if x <= 0 then Exit;
  result:= copy(S,x+1,(length(S)-x)+1);
end;

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

{***************************}
{     rsCustomComboBox      }
{***************************}
constructor TrsCustomComboBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FLocator:= false;
  FLocColor:= clAqua;
  FShowGray:= true;
  FOnReturn:= nil;
  FEntertoTab:= true;
  ControlStyle := ControlStyle - [csSetCaption];
end;

procedure TrsCustomComboBox.Loaded;
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
  {$IFDEF DEMO}
  if not DelphiRunning then  {for trial version only}
    showmessage('This program is using an unregistered copy of the TrsSuperComboBox' + #13 +
                'component from RealSoft.  Please register at www.realsoftdev.com' + #13 +
                'or call (949) 831-7879.');
  {$ENDIF}
end;

procedure TrsCustomComboBox.KeyPress(var Key: Char);
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
  inherited KeyPress(Key);
end;

procedure TrsCustomComboBox.DoEnter;
begin
  if FLocator = true then Color:= FLocColor;
  inherited DoEnter;
end;

procedure TrsCustomComboBox.DoExit;
begin
  if FLocator = true then Color:= FOldColor;
  inherited DoExit;
end;

procedure TrsCustomComboBox.SetItem(AValue : string);
var i: smallint;
begin
  Itemindex:= -1;
  if Items.Count = 0 then Exit;
  Itemindex:= 0;
  for i:= 0 to Items.Count-1 do
    if Items[i] = AValue then begin
      ItemIndex:= i;
      Exit;
      end;
end;

function  TrsCustomComboBox.GetItem: string;
begin
  if Itemindex >= 0 then
    result:= Items[ItemIndex]
  else result:= '';
end;

procedure TrsCustomComboBox.CMSetEnabled(var Message: TMessage);
begin
  inherited;
  Invalidate;
end;

procedure TrsCustomComboBox.WMSetColor(var Message: TMessage);
begin
  inherited;
  if (Color <> clBtnFace) and (Color <> LocColor) then FOldColor:= Color;
end;

procedure TrsCustomComboBox.WMPaint(var Message: TWMPaint);
var Gray: boolean;
begin
  Gray:= ((not Enabled) or (not parent.Enabled)) and (ShowGray) and (not Focused);
  if Gray then Color:= clbtnFace;
  if (not Gray) and (not (Color = LocColor)) then Color:= clWindow;
  inherited;
end;

procedure TrsCustomComboBox.SetShowGray(AValue : Boolean);
begin
  FShowGray:= AValue;
  Invalidate;
end;

{***************************}
{        rsComboBox         }
{***************************}
constructor TrsSuperComboBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCodes:= TCodeStringlist.create;
  FStyle:= rcsStandard;
  FCodeLen:= 3;
  FMaxMult:= 0;
  FGlyphs:= false;
  FTagName := '' ;
  FTagFieldType := FIELDTYPE_TEXT ;
end;

destructor TrsSuperComboBox.Destroy;
begin
  FCodes.Free;
  inherited Destroy;
end;

procedure TrsSuperComboBox.Loaded;
begin
  inherited Loaded;
  InitCodes;
end;

procedure TrsSuperComboBox.InitCodes;
var x: integer;
begin
  {init codes}
  if (FStyle = rcsCodeList) or (FStyle = rcsMultiCode) then
  begin
    if Sorted then SortCodes;
    Items.Clear;
    if (csDesigning in ComponentState) then
    begin
      for x:= 0 to FCodes.count-1 do
        Items.Add(FCodes[x]);
    end
    else begin
      for x:= 0 to FCodes.count-1 do
      begin
        Items.Add(GetSDesc(FCodes[x]));
        Items.Objects[x]:= nil;
      end;
    end;
  end;
  {default item}
  if csDesigning in ComponentState then Exit;
  if (FStyle = rcsItemList) or (FStyle = rcsMultiCode) then
    if Items.count > 0 then Itemindex:= 0;
  if (FStyle = rcsCodeList) then
    Code:= '';
end;

procedure TrsSuperComboBox.DefaultHandler(var Message);
var Key: TWMKey;
begin
  Key.CharCode:= 32;
  if TMessage(Message).msg = 305 then DoKeyUp(key); {makes click checkbox work}
  inherited DefaultHandler(Message);
end;

procedure TrsSuperComboBox.DrawItem(Index: integer; ARect: TRect; State: TOwnerdrawState);
var
  G,y: integer;
  R,S: TRect;
  TC: TColor;
begin
  {checkboxes}
  if (FStyle = rcsMultiCode) then
  begin
    with Canvas do
    begin
      FillRect(ARect);
      Canvas.Font.Assign(Self.Font);
      if odSelected in State then
        Font.Color:= clHighlightText;
      if DroppedDown and (ARect.Left = 0) then
      begin
        Textout(ARect.Left+20, ARect.Top+1, Items[Index]);
        DrawCheckBox(ARect, Items.Objects[Index] = TObject(true));
      end
      else DrawMultiText;
    end;
  end;

  {glyphs}
  if FGlyphs and (FImages <> nil) then
  begin
    G:= longint(Items.Objects[Index]);
    if (G <= FImages.count) and (G > 0) then
      if FImages[G] <> nil then
        if not FImages[G].Empty then
        begin
          if (FImages[G].Height < 1) or (FImages[G].Width < 1) then
            TC:= clOlive
          else
            TC:= FImages[G].Canvas.Pixels[0,FImages[G].Height-1];
          S:= Rect(0,0,FImages[G].Width,FImages[G].Height);
          y:= ARect.Top;
          if FImages[G].Height < (ARect.Bottom-ARect.Top) then
            y:= y + ((ARect.Bottom-ARect.Top) - FImages[G].Height) div 2;
          R:= Rect(4,y,FImages[G].Width+4,FImages[G].Height+y);
          with Canvas do
          begin
            FillRect(ARect);
            Canvas.Font.Assign(Self.Font);
            if odSelected in State then
              Font.Color:= clHighlightText;
            Textout(ARect.Left+24, ARect.Top+1, Items[Index]);
            BrushCopy(R, FImages[G], S, TC);
          end;
        end;
  end;
end;

procedure TrsSuperComboBox.KeyUp(var Key: Word; Shift: TShiftState);
var
  R: TRect;
begin
  if (FStyle = rcsMultiCode) then
  begin
    if (key = VK_SPACE) and (ItemIndex > -1) and DroppedDown then
    begin
      if longint(Items.Objects[ItemIndex]) = 1 then
        Items.Objects[ItemIndex] := TObject(0)
      else
        if CheckMax then Items.Objects[ItemIndex] := TObject(1);
      if DroppedDown then
      begin
        SendMessage(GetTopWindow(0), LB_GETITEMRECT, ItemIndex, Longint(@R));
        InvalidateRect(GetTopWindow(0), @R, False);
        Refresh;
      end;
    end;
  end;
  inherited KeyUp(Key, Shift);
end;

procedure TrsSuperComboBox.SetCStyle(AValue: TrsComboStyle);
begin
  FStyle:= AValue;
  if FStyle <> rcsStandard then Style:= csDropDownList;
  if FStyle = rcsMultiCode then Style:= csOwnerDrawFixed;
end;

procedure TrsSuperComboBox.SetCodes(AValue: TCodeStringList);
begin
  FCodes.Assign(AValue);
end;

function TrsSuperComboBox.GetCode: string;
begin
  if Itemindex >= 0 then
    result:= GetSCode(FCodes[ItemIndex])
  else result:= '';
end;

procedure TrsSuperComboBox.SetCode(AValue: string);
var x: integer;
begin
  itemindex:= -1;
  if Items.Count = 0 then Exit;
  Itemindex:= 0;
  for x:= 0 to items.count-1 do
    if GetSCode(FCodes[x]) = AValue then
    begin
      Itemindex:= x;
      break;
    end;
end;

function TrsSuperComboBox.GetMCode: string;
var x: integer;
begin
  result:= '';
  for x:= 0 to items.count-1 do
  begin
    if items.objects[x] = TObject(0) then continue;
    if result <> '' then result:= result + ',';
    result:= result + GetSCode(FCodes[x]);
  end;
end;

function TrsSuperComboBox.GetMText: string;
var x: integer;
begin
  result:= '';
  for x:= 0 to items.count-1 do
  begin
    if items.objects[x] = TObject(0) then continue;
    if result <> '' then result:= result + ',';
    result:= result + GetSDesc(FCodes[x]);
  end;
end;

procedure TrsSuperComboBox.SetMCode(AValue: string);
var
  x,y: integer;
  tmpstr: string;
begin
  {clear checks}
  itemindex:= -1;
  for x:= 0 to items.count-1 do
    items.objects[x]:= TObject(0);
  {match up codes and check}
  tmpstr:= '';
  for x:= 1 to length(AValue) do
  begin
    if (AValue[x] = ',') or (x = length(AValue)) then
    begin
      if x = length(AValue) then
        tmpstr:= tmpstr + AValue[x];
      if tmpstr <> '' then
        for y:= 0 to items.count-1 do
          if GetSCode(FCodes[y]) = tmpstr then
            if CheckMax then items.objects[y]:= TObject(1);
      tmpstr:= '';
    end
    else tmpstr:= tmpstr + AValue[x]
  end;
  {refresh}
  if items.count > 0 then
    itemindex:= 0;
end;

procedure TrsSuperComboBox.SelectAllCodes;
var
  x: integer;
begin
  {check all}
  itemindex:= -1;
  for x:= 0 to items.count-1 do
    items.objects[x]:= TObject(1);
  invalidate;  
end;

function TrsSuperComboBox.GetCCode: char;
var tmpstr: string;
begin
  tmpstr:= GetSCode(FCodes[ItemIndex]);
  if length(tmpstr) > 0 then result:= tmpstr[1]
  else result:= #0;
end;

procedure TrsSuperComboBox.SetCCode(AValue: char);
begin
  SetCode(AValue);
end;

function TrsSuperComboBox.StoreItems: boolean;
begin
  result:= (FStyle <> rcsCodeList) and (FStyle <> rcsMultiCode);
end;

function TrsSuperComboBox.StoreText: boolean;
begin
  result:= (FStyle <> rcsCodeList) and (FStyle <> rcsMultiCode);
end;

procedure TrsSuperComboBox.SortCodes;
begin
  if FCodes.Count = 0 then Exit;
  QuickSort(1, 0, FCodes.Count - 1);
end;

procedure TrsSuperComboBox.QuickSort(fnum, L1, R1: Integer);
var
  I, J: Integer;
  P: string;
begin
  FCodes.beginupdate;
  repeat
    I := L1;
    J := R1;
    P := GetField( FCodes[(L1 + R1) shr 1], fnum );
    repeat
      while AnsiCompareText(GetField( FCodes[I], fnum), P) < 0 do Inc(I);
      while AnsiCompareText(GetField( FCodes[J], fnum), P) > 0 do Dec(J);
      if I <= J then
      begin
        FCodes.Exchange(I, J);
        Inc(I);
        Dec(J);
      end;
    until I > J;
    if L1 < J then QuickSort(fnum, L1, J);
    L1 := I;
  until I >= R1;
  FCodes.endupdate;
end;

procedure TrsSuperComboBox.DrawCheckBox(ARect: TRect; Checked: boolean);
var R: TRect;
begin
  with Canvas do
  begin
    {draw checkbox}
    Brush.Color := clwindow;
    ARect.Top:= ARect.Top + ((ARect.Bottom - ARect.Top) - 15);
    R:= Rect(ARect.Left, ARect.Top, ARect.Left + 15, ARect.Top + 15);
    FillRect(R);
    InflateRect(R,-1,-1);
    DrawCtl3D(R, Canvas);
    {draw checkmark}
    if checked then
    begin
      Pen.Color:= clBlack;
      Pen.Width:= 1;
      InflateRect(R,-4,-4);
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
    end;
  Pen.Width:= 1;
  end; {canvas}
end;

procedure TrsSuperComboBox.DrawCtl3D(R: TRect; ACanvas: TCanvas);
begin
  with ACanvas do
  begin
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

procedure TrsSuperComboBox.DrawMultiText;
var tmpstr: string;
begin
  if (FStyle <> rcsMultiCode) then Exit;
  tmpstr:= MultiText;
  if tmpstr = '' then
    if FMaxMult = 0 then
      tmpstr:= '(select)'
    else
      if Items.count < FMaxMult then
        tmpstr:= '(select up to '+inttostr(Items.count)+')'
      else
        tmpstr:= '(select up to '+inttostr(FMaxMult)+')';
  with Canvas do
  begin
    Textout(4, (Height-TextHeight('X')) div 2 , tmpstr);
  end;
end;

procedure TrsSuperComboBox.DropDown;
begin
  inherited DropDown;
  if (FStyle <> rcsMultiCode) then Exit;
  if Items.count > 0 then
    Itemindex:= 0;
end;

procedure TrsSuperComboBox.Change;
begin
  inherited Change;
  if (FStyle <> rcsMultiCode) then Exit;
  if not Droppeddown then
    if Items.count > 0 then
      Itemindex:= 0;
end;

function TrsSuperComboBox.CheckMax: boolean;
var x,c: integer;
begin
  Result:= true;
  if FMaxMult = 0 then Exit;
  c:= 0;
  for x:= 0 to items.count-1 do
    if items.objects[x] = TObject(1) then inc(c);
  if c >= FMaxMult then result:= false;
end;

procedure TrsSuperComboBox.SetFieldName(AValue : String);
begin
  FTagName := AValue;
end;

Function TrsSuperComboBox.GetFieldName : String ;
Begin
   Result := FTagName ;
End ;

procedure TrsSuperComboBox.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FImages) then FImages := nil;
end;


{************************}
{    Component Editor    }
{************************}
function TCodeEditor.GetVerbCount : Integer;
begin
  Result := 1;
end;


function TCodeEditor.GetVerb( Index : Integer ) : string;
begin
  case Index of
    0: Result := 'Edit Codes';
    end;
end;

procedure TCodeEditor.ExecuteVerb( Index : Integer );
begin
  case Index of
    0: Edit;
  end;
end;

procedure TCodeEditor.Edit;
var myindexprop: TCodesProperty;
begin
  myindexprop:= nil;
  try myindexprop:= TCodesProperty.create;
  myindexprop.parentcc:= (Component as TrsSuperComboBox);
  myindexprop.Edit;
  finally myindexprop.free; end;
  Designer.Modified;
end;

procedure TCodeEditor.EditProperty(PropertyEditor: TPropertyEditor; var Continue, FreeEditor: Boolean);
var PropName: string;
begin
  PropName := PropertyEditor.GetName;
  if CompareText(PropName, 'Codes') <> 0 then Exit;
  PropertyEditor.Edit;
  Continue := False;
end;


{**************************}
{   Codes Property Editor  }
{**************************}
constructor TCodesProperty.Create;
begin
  {$IFDEF VER120}
  inherited Create(Designer,1);
  {$ELSE}
  inherited Create;
  {$ENDIF}
  parentcc:= nil;
end;

destructor TCodesProperty.Destroy;
begin
  inherited Destroy;
end;

function TCodesProperty.GetAttributes : TPropertyAttributes;
begin
  Result := [ paDialog ];
end;

function TCodesProperty.GetValue : string;
begin
  Result := '(Codes)';
end;

procedure TCodesProperty.Edit;
var internal: boolean;
begin
  {get parent component}
  if parentCC = nil then
  begin
    parentCC:= (GetComponent(0) as TrsSuperComboBox);
    internal:= true;  {editing in object inspector}
  end
  else internal:= false;  {called by component editor}
  if parentCC = nil then Exit;
  {create dynamic form & temp list}
  CodeForm:= nil;
  try
    tmplist:= TStringlist.create;
    CodeForm:= TdlgCodeClass.create;
    tmplist.assign((parentcc as TrsSuperComboBox).codes);
    {assign events}
    CodeForm.grid.OnKeyPress:= GridKeyPress;
    CodeForm.btnPrint.OnClick:= ButtonClick;
    CodeForm.btnIns.OnClick:= ButtonClick;
    CodeForm.btnRem.OnClick:= ButtonClick;
    {fill grid}
    FillGrid(tmplist);
    {show dialog}
    CodeForm.dlgCode.ActiveControl:= CodeForm.Grid;
    if CodeForm.dlgCode.Showmodal = mrOk then
    begin
      {get changes}
      GetGrid(tmplist);
      (parentcc as TrsSuperComboBox).codes.assign(tmplist);
    end;
  finally
    {free stuff}
    CodeForm.free;
    tmplist.free;
  end;
  if internal then Designer.Modified;
end;

procedure TCodesProperty.GridKeyPress( Sender: TObject; var Key: Char );
var G: TStringGrid;
begin
  G:= (Sender as TStringGrid);
  if Key = #13 then
  begin
    if G.Row = G.RowCount-1 then
    begin
      G.RowCount:= G.RowCount + 1;
      G.Cells[0,G.RowCount-1]:= inttostr(G.RowCount-2);
      G.Cells[1,G.RowCount-1]:= '';
      G.Cells[2,G.RowCount-1]:= '';
    end;
    G.Row:= G.Row + 1;
    key:= #0;
  end;
end;

procedure TCodesProperty.ButtonClick( Sender: TObject );
var G: TStringGrid;
    idx: integer;
begin
  G:= CodeForm.Grid;
  idx:= G.Row;
  if sender = CodeForm.btnIns then
  begin
    GetGrid(tmplist);
    if (idx > tmplist.count) or (idx < 0) then Exit;
    tmplist.insert(idx-1, '');
    FillGrid(tmplist);
    if (idx < G.rowcount) and (idx >= 0) then G.row:= idx;
  end;

  if sender = CodeForm.btnRem then
  begin
    GetGrid(tmplist);
    if (idx > tmplist.count) or (idx < 0) then Exit;
    tmplist.delete(idx-1);
    tmplist.add('');
    FillGrid(tmplist);
    if (idx < G.rowcount) and (idx >= 0) then G.row:= idx;
  end;
  if sender = CodeForm.btnPrint then
  begin
    Print;
  end;
end;

procedure TCodesProperty.FillGrid(L: TStrings);
var G: TStringGrid;
    y: integer;
begin
  G:= CodeForm.grid;
  G.RowCount  := 2;
  G.Cells[0,1]:= '0';
  for y:= 0 to L.count-1 do
  begin
    if G.RowCount < y+2 then G.RowCount:= G.RowCount + 1;
    G.Cells[0,y+1]:= inttostr(y);
    G.Cells[1,y+1]:= GetSCode(L[y]);
    G.Cells[2,y+1]:= GetSDesc(L[y]);
  end;
end;

procedure TCodesProperty.GetGrid(L: TStrings);
var G: TStringGrid;
    y,lastrow: integer;
begin
  G:= CodeForm.grid;
  L.clear;
  lastrow:= 0;
  for y:= 1 to G.RowCount do
  begin
    if (G.Cells[1,y] <> '') then lastrow:= y;
  end;
  if lastrow = 0 then exit;
  for y:= 1 to lastrow do
  begin
    L.Add(G.Cells[1,y]+#9+G.Cells[2,y]);
  end;
end;

procedure TCodesProperty.Print;
var
  i : smallint;
  ListText : TextFile;
begin
  GetGrid(tmplist);
  AssignPrn(ListText);
  try
    Rewrite(ListText);
    {Printer.Canvas.Font.Assign(Font);}
    for i:= 0 to tmplist.Count - 1 do begin
      writeln(ListText, tmplist[i]);
      end;
  finally
    CloseFile(ListText);
  end;
end;

{**************************}
{   Create Code Dlg Form   }
{**************************}
constructor TdlgCodeClass.Create;
begin
  inherited Create;
  dlgCode := TForm.CreateNew(Application);
  Grid := TStringGrid.create(dlgCode);
  btnPrint := TButton.create(dlgCode);
  btnOk := TButton.create(dlgCode);
  btnCancel := TButton.create(dlgCode);
  btnIns := TSpeedButton.create(dlgCode);
  btnRem := TSpeedButton.create(dlgCode);
  with dlgCode do begin
    BorderStyle := bsDialog;
    Caption := 'Combo Code Editor';
    ClientHeight := 244;
    ClientWidth := 345;
    Font.Color := clWindowText;
    Font.Height := -11;
    Font.Name := 'MS Sans Serif';
    Font.Style := [];
    PixelsPerInch := 96;
    Position:= poScreenCenter;
    end;
  with Grid do begin
    Parent:= dlgCode;
    Name:= 'ccGrid';
    Left := 8;
    Top := 8;
    Width := 329;
    Height := 193;
    DefaultRowHeight := 16;
    ColCount  := 3;
    RowCount  := 2;
    FixedCols := 1;
    FixedRows := 1;
    Options := [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine,
                goEditing, goTabs, goAlwaysShowEditor, goThumbTracking];
    ScrollBars := ssVertical;
    ColWidths[0]:= 40;
    ColWidths[1]:= 50;
    ColWidths[2]:= 200;
    Cells[0,0]:= 'Index';
    Cells[0,1]:= '0';
    Cells[1,0]:= 'Code';
    Cells[2,0]:= 'Description';
    end;
  with btnIns do begin
    Parent:= dlgCode;
    Caption:= '+';
    left:= 8;
    top:= 212;
    height:= 25;
    width:= 30;
    Name:= 'ccbtnIns';
    end;
  with btnRem do begin
    Parent:= dlgCode;
    Caption:= '-';
    left:= 43;
    top:= 212;
    height:= 25;
    width:= 30;
    Name:= 'ccbtnDel';
    end;
  with btnPrint do begin
    Parent:= dlgCode;
    Caption:= '&Print';
    left:= 96;
    top:= 212;
    height:= 25;
    width:= 75;
    Name:= 'ccbtnPr';
    end;
  with btnOk do begin
    Parent:= dlgCode;
    Caption:= '&OK';
    left:= 176;
    top:= 212;
    height:= 25;
    width:= 75;
    Name:= 'ccbtnOk';
    Modalresult:= mrOK;
    end;
  with btnCancel do begin
    Parent:= dlgCode;
    Caption:= 'Cancel';
    Cancel:= true;
    left:= 256;
    top:= 212;
    height:= 25;
    width:= 75;
    Name:= 'ccbtnCancel';
    Modalresult:= mrCancel;
    end;

end;

destructor TdlgCodeClass.Destroy;
begin
  dlgCode.free;
  inherited Destroy;
end;


end.
