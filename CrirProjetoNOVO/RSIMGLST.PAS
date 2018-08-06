{******************************************************}
{             rsAnimImage Component V1.0               }
{        Copyright 1997 RealSoft Development           }
{           support:  www.realsoftdev.com              }
{******************************************************}

unit Rsimglst;

interface

{$DEFINE ONEBASED}

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, StdCtrls, ExtCtrls, Dialogs, DsgnIntf, Buttons, realproc,
  printers, menus;

type
  EIndexError = class(Exception);
  EFindError = class(Exception);
  TNewBitmap = class(TBitmap);

  TrsImageList = class(TComponent)
  private
    FList: TStringList;
    function GetCount: integer;
    function GetBitmap(index: integer): TBitmap;
    procedure LoadImageData(Stream: TStream);
    procedure SaveImageData(Stream: TStream);
  protected
    procedure DefineProperties(Filer : TFiler); override;
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    function FindImage(AName: string): TBitmap;
    property Images[index: integer]: TBitmap	read GetBitmap; default;
    property Count: integer			read GetCount;
  published
  end;

  TrsImageListEditor = class(TDefaultEditor)
  private
    parent: TrsImageList;
    fmImgLst : TForm;
    Opendlg: TOpenDialog;
    Panel1 : TPanel;
    IMG : TImage;
    LB : TListBox;
    Add : TButton;
    Del : TButton;
    Clr : TButton;
    OK : TButton;
    procedure EditImages;
    procedure ButtonClick(Sender: TObject);
  public
    function GetVerbCount : Integer; 			override;
    function GetVerb( Index : Integer ) : string; 	override;
    procedure ExecuteVerb( Index : Integer ); 		override;
    procedure Edit; 					override;
  end;

  procedure Register;

implementation

procedure Register;
begin
  RegisterComponents( 'RSD' , [TrsImageList] );
  RegisterComponentEditor(TrsImageList, TrsImageListEditor);
end;

constructor TrsImageList.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
  FList:= TStringList.create;
end;

destructor TrsImageList.Destroy;
var x: integer;
begin
  for x:= 0 to FList.count-1 do
    FList.Objects[x].free;
  FList.free;
  inherited Destroy;
end;

function TrsImageList.GetCount: integer;
begin
  result:= FList.count;
end;

function TrsImageList.GetBitmap(index: integer): TBitmap;
begin
  if index{$IFDEF ONEBASED}-1{$ENDIF} >= FList.count then
    raise EIndexError.create('Image index out of bounds');
  result:= TBitmap(FList.Objects[index{$IFDEF ONEBASED}-1{$ENDIF}]);
end;

function TrsImageList.FindImage(AName: string): TBitmap;
var x: integer;
begin
  result:= nil;
  for x:= 0 to FList.count-1 do
    if comparetext(AName, FList[x]) = 0 then
      result:= TBitmap(FList.Objects[x]);
  if result = nil then
    raise EFindError.create('Image not found');
end;

procedure TrsImageList.DefineProperties(Filer : TFiler);
begin
  inherited DefineProperties(Filer);
  Filer.DefineBinaryProperty('ImageNames', FList.Loadfromstream, FList.Savetostream, FList.count > 0);
  Filer.DefineBinaryProperty('ImageData', LoadImageData, SaveImageData, FList.count > 0);
end;

procedure TrsImageList.LoadImageData(Stream: TStream);
var
  x: integer;
  tmpint: word;
  tmpbyte: byte;
  size: longint;
  L: TList;
  M: TMemoryStream;
begin
  M:= nil;
  L:= nil;
  try
    L:= TList.create;
    Stream.seek(0,0);
    while Stream.read(tmpint, sizeof(tmpint)) = sizeof(tmpint) do
    begin
      if (tmpint = $4D42) then
        L.Add(pointer( longint(Stream.Position-sizeof(tmpint)) ));
    end;

    for x:= 0 to FList.count-1 do
    begin
      FList.Objects[x]:= TBitmap.create;
      Stream.seek( longint(L[x]), 0 );
      if x < FList.count-1 then
        Size:= longint(L[x+1]) - longint(L[x])
      else
        Size:= stream.size - longint(L[x]);
      try
        M:= TMemoryStream.create;
        while Stream.Read(tmpbyte, sizeof(tmpbyte)) = sizeof(tmpbyte) do
        begin
          M.write(tmpbyte, sizeof(tmpbyte));
          dec(Size);
          if Size = 0 then break;
        end;
        M.seek(0,0);
        TBitmap(FList.Objects[x]).loadfromstream(M);
      finally
        M.free;
      end;
    end;
  finally
    L.free;
  end;
end;

(*Delphi 3/4 only---
procedure TrsImageList.LoadImageData(Stream: TStream);
var
  x: integer;
begin
  for x:= 0 to FList.count-1 do
  begin
    FList.Objects[x]:= TBitmap.create;
    TBitmap(FList.Objects[x]).loadfromstream(stream);
  end;
end;
--- *)

procedure TrsImageList.SaveImageData(Stream: TStream);
var x: integer;
begin
  for x:= 0 to FList.count-1 do
    TBitmap(FList.Objects[x]).savetostream(stream);
end;

{************************}
{    Component Editor    }
{************************}
function TrsImageListEditor.GetVerbCount : Integer;
begin
  Result := 1;
end;

function TrsImageListEditor.GetVerb( Index : Integer ) : string;
begin
  case Index of
    0: Result := 'Edit Images';
    end;
end;

procedure TrsImageListEditor.ExecuteVerb( Index : Integer );
begin
  case Index of
    0: Edit;
  end;
end;

procedure TrsImageListEditor.Edit;
begin
  EditImages;
end;

procedure TrsImageListEditor.EditImages;
var
  x: integer;
begin
  parent:= (Component as TrsImageList);
  fmImgLst := TForm.CreateNew(Application);
  Opendlg:= TOpenDialog.create(fmImgLst);
  Panel1 := TPanel.create(fmImgLst);
  IMG := TImage.create(fmImgLst);
  LB := TListBox.create(fmImgLst);
  Add := TButton.create(fmImgLst);
  Del := TButton.create(fmImgLst);
  Clr := TButton.create(fmImgLst);
  OK := TButton.create(fmImgLst);
  with fmImgLst do
  begin
    BorderStyle := bsDialog;
    Caption := 'Realsoft Image List';
    ClientHeight := 234;
    ClientWidth := 225;
    Font.Color := clWindowText;
    Font.Height := -11;
    Font.Name := 'MS Sans Serif';
    Font.Style := [];
    Position := poScreenCenter;
    PixelsPerInch := 96;
  end;
  with OpenDlg do
  begin
    Name:= 'OpenDlg';
    DefaultExt := 'bmp';
    Filter := 'Bitmaps|*.bmp';
    Title := 'Open Bitmap';
  end;
  with Panel1 do
  begin
    Parent:= fmImgLst;
    Name:= 'Panel1';
    Left := 16;
    Top := 8;
    Width := 97;
    Height := 97;
    BevelOuter := bvLowered;
    Caption := ' ';
    Color := clWindow;
  end;
  with IMG do
  begin
    Parent:= Panel1;
    Name:= 'IMG';
    Left := 1;
    Top := 1;
    Width := 95;
    Height := 95;
    Align := alClient;
    Center := True;
    Stretch := True;
  end;
  with LB do
  begin
    Parent:= fmImgLst;
    Name:= 'LB';
    Left := 8;
    Top := 112;
    Width := 209;
    Height := 85;
    ItemHeight := 13;
  end;
  with Add do
  begin
    Parent:= fmImgLst;
    Name:= 'Add';
    Left := 132;
    Top := 12;
    Width := 75;
    Height := 25;
    Caption := '&Add';
  end;
  with Del do
  begin
    Parent:= fmImgLst;
    Name:= 'Del';
    Left := 132;
    Top := 44;
    Width := 75;
    Height := 25;
    Caption := '&Delete';
  end;
  with Clr do
  begin
    Parent:= fmImgLst;
    Name:= 'Clr';
    Left := 132;
    Top := 76;
    Width := 75;
    Height := 25;
    Caption := '&Clear';
  end;
  with OK do
  begin
    Parent:= fmImgLst;
    Name:= 'OK';
    Left := 76;
    Top := 204;
    Width := 75;
    Height := 25;
    Caption := '&OK';
    Modalresult:= mrOK;
  end;

  Panel1.taborder:= 0;
  Add.taborder:= 1;
  Del.taborder:= 2;
  Clr.taborder:= 3;
  LB.taborder:= 4;
  OK.taborder:= 5;

  Add.OnClick:= ButtonClick;
  Del.OnClick:= ButtonClick;
  Clr.OnClick:= ButtonClick;
  LB.OnClick:= ButtonClick;

  {fill names}
  if Parent.FList.count > 0 then
  begin
    for x:= 0 to Parent.FList.count-1 do
      LB.items.Add(Parent.FList[x]);
    LB.itemindex:= 0;
    ButtonClick(nil);
  end;
  {show dialog}
  fmImgLst.showmodal;
  {notify changes}
  Designer.Modified;
end;

procedure TrsImageListEditor.ButtonClick(Sender: TObject);
var
  idx,x: integer;
  tmpstr: string;
begin
  idx:= LB.itemindex;
  {add}
  if Sender = Add then
  begin
    if not OpenDlg.Execute then Exit;
    if not fileexists(OpenDlg.Filename) then Exit;
    tmpstr:= Extractfilename(OpenDlg.Filename);
    Parent.FList.Add(tmpstr);
    Parent.FList.Objects[Parent.FList.count-1]:= TBitmap.create;
    TBitmap(Parent.FList.Objects[Parent.FList.count-1]).loadfromfile(OpenDlg.Filename);
    LB.items.Add(tmpstr);
    idx:= LB.items.count-1;
  end;
  {delete}
  if Sender = Del then
  begin
    if idx < 0 then exit;
    Parent.FList.Objects[idx].free;
    Parent.FList.Delete(idx);
    LB.items.delete(idx);
    if LB.items.count > 0 then
      idx:= 0
    else
      idx:= -1;
  end;
  {clear}
  if Sender = Clr then
  begin
    if messagedlg('Are you sure?',mtConfirmation,[mbyes,mbno],0) = mrno then Exit;
    LB.items.clear;
    for x:= 0 to Parent.FList.count-1 do
      if Parent.FList.Objects[x] <> nil then
        TBitmap(Parent.FList.Objects[x]).free;
    Parent.FList.clear;
    Exit;
  end;
  {update image}
  if idx > -1 then
  begin
    Img.picture.bitmap.assign(TBitmap(Parent.FList.Objects[idx]));
    LB.itemindex:= idx;
  end;
{  else begin
    Img.picture.bitmap.height:= 0;
    Img.picture.bitmap.width:= 0;
  end;}
end;



end.

