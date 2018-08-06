{******************************************************}
{                  rsFormGrow V2.0                     }
{        Copyright 1997 RealSoft Development           }
{           support:  www.realsoftdev.com              }
{******************************************************}

unit rsFormg;

interface

{$I REALSOFT.INC}

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Grids, Forms, Dialogs, StdCtrls, Extctrls, Dynarray;

type
  TNewGrid = class(TCustomGrid);

  TGrowType = ( gtHorz, gtVert, gtBoth );

  RCompDat = packed record
    Index   : smallint;
    Left    : smallint;
    Top     : smallint;
    Height  : smallint;
    Width   : smallint;
    GFlag   : boolean;
    DynCol  : TrsDynarray; {of real}
    DynRow  : TrsDynarray; {of real}
    end;

  TCompArray = Array[0..3000] of RCompDat;

  TrsFormGrow = class(TComponent)
  private
    ParentForm   : TForm;
    ParentRec    : RCompDat;
    FInit        : boolean;
    FGrowType    : TGrowType;
    FExcludeSize : smallint;
    FExcludeMove : smallint;
    FExcludeBoth : smallint;
    FArray       : ^TCompArray;
    FDynarray    : TrsDynarray;
    FTempEvent   : TNotifyEvent;
    FAutoInit    : boolean;
    FAutoGrow    : boolean;
    FAutoGrid    : boolean;
    procedure ClearArrays;
    procedure FormResize(Sender: TObject);
  protected
    procedure Loaded; override;
  public
    constructor Create (AOwner : TComponent); override;
    destructor Destroy; override;
    procedure Init;
    procedure Grow;
  published
    property AutoInit      : boolean   read FAutoInit      write FAutoInit     default true;
    property AutoGrow      : boolean   read FAutoGrow      write FAutoGrow     default true;
    property AutoGrid      : boolean   read FAutoGrid      write FAutoGrid     default true;
    property GrowType      : TGrowType read FGrowType      write FGrowType     default gtHorz;
    property TagExclSize   : smallint  read FExcludeSize   write FExcludeSize  default -1;
    property TagExclMove   : smallint  read FExcludeMove   write FExcludeMove  default -1;
    property TagExclBoth   : smallint  read FExcludeBoth   write FExcludeBoth  default -1;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('RSD', [TrsFormGrow]);
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

constructor TrsFormGrow.Create (AOwner : TComponent);
begin
  inherited Create( AOwner );
  ParentForm:= nil;
  if (AOwner is TForm) then
    ParentForm:= (AOwner as TForm);
  if ParentForm <> nil then ParentForm.Scaled:= false;
  FGrowType:= gtHorz;
  FExcludeSize := -1;
  FExcludeMove := -1;
  FExcludeBoth := -1;
  FAutoInit:= true;
  FAutoGrow:= true;
  FAutoGrid:= true;
  FInit:= false;
  FArray:= NIL;
  FTempEvent:= NIL;
  FDynarray:= TrsDynarray.Create(Sizeof(RCompDat));
end;

procedure TrsFormGrow.Loaded;
begin
  inherited Loaded;
  if FAutoInit then init;
  if FAutoGrow then
  begin
    if ParentForm <> nil then
    begin
      FTempEvent:= ParentForm.OnResize;
      ParentForm.OnResize:= FormResize;
    end;
  end;
  {$IFDEF DEMO}
  if not DelphiRunning then  {for trial version only}
    showmessage('This program is using an unregistered copy of the TrsFormGrow' + #13 +
                'component from RealSoft.  Please register at www.realsoftdev.com' + #13 +
                'or call (949) 831-7879.');
  {$ENDIF}

end;

destructor TrsFormGrow.Destroy;
begin
  ClearArrays;
  FDynarray.Free;
  inherited Destroy;
end;

procedure TrsFormGrow.FormResize(Sender: TObject);
begin
  Grow;
  if ParentForm <> nil then
    if Assigned(FTempEvent) then FTempEvent(ParentForm);
end;

procedure TrsFormGrow.Init;
var
  i,j : smallint;
  tmprec : RCompDat;
  mycontrol : TControl;
  tmpreal: Real;
begin
  if (csDesigning in ComponentState) then Exit;
  {Parent Form Data}
  ClearArrays;
  if ParentForm <> nil then begin
    ParentRec.Index  := -1;
    ParentRec.Left   := ParentForm.Left;
    ParentRec.Top    := ParentForm.Top;
    ParentRec.Height := ParentForm.Height;
    ParentRec.Width  := ParentForm.Width;
    for i:= 0 to ParentForm.ComponentCount-1 do begin
      if ParentForm.Components[i] is TControl then begin
        mycontrol:= ParentForm.Components[i] as TControl;
        tmprec.index   := i;
        tmprec.Left    := myControl.Left;
        tmprec.Top     := myControl.Top;
        tmprec.Height  := myControl.Height;
        tmprec.Width   := myControl.Width;
        tmprec.GFlag   := false;
        tmprec.DynCol  := NIL;
        tmprec.DynRow  := NIL;
        if (myControl is TCustomGrid) and FAutoGrid then begin
          tmprec.GFlag  := true;
          tmprec.DynCol := TrsDynarray.Create(sizeof(Real));
          tmprec.DynRow := TrsDynarray.Create(sizeof(Real));
          for j:= 0 to TNewGrid(myControl).ColCount-1 do begin
            tmpreal:= TNewGrid(myControl).ColWidths[j] / mycontrol.Width;
            tmprec.DynCol.Add(tmpreal);
            end;
          for j:= 0 to TNewGrid(myControl).RowCount-1 do begin
            tmpreal:= TNewGrid(myControl).RowHeights[j] / mycontrol.Height;
            tmprec.DynRow.Add(tmpreal);
            end;
          end;
        FArray:= FDynarray.Add(tmprec);
        end;
      end;
    FInit:= true;
    end;
end;

procedure TrsFormGrow.ClearArrays;
var i : smallint;
begin
  {free internal grid arrays, and clear main array}
  for i:= 0 to FDynarray.Count-1 do
    if FArray^[i].GFlag then begin
      if FArray^[i].DynCol <> NIL then FArray^[i].DynCol.Free;
      if FArray^[i].DynRow <> NIL then FArray^[i].DynRow.Free;
      end;
  FDynarray.Clear;
end;

procedure TrsFormGrow.Grow;
var
  i,j           : smallint;
  mycontrol     : TControl;
  Wratio        : Real;
  Hratio        : Real;
begin
  if not FInit then Exit;
  if ParentForm = nil then Exit;
  if (csDestroying in ComponentState) then Exit;
  LockWindowUpdate(ParentForm.handle);
  {calculate ratios}
  if ParentRec.Width > 0 then Wratio:=  ParentForm.Width / ParentRec.Width
  else Wratio:= 1;
  if ParentRec.Height > 0 then Hratio:=  ParentForm.Height / ParentRec.Height
  else Hratio:= 1;
  {go through components}
  for i:= 0 to FDynarray.Count - 1 do begin
    mycontrol:= (ParentForm.Components[ FArray^[i].Index ] as TControl);
    if mycontrol = nil then continue;
    {** Vert **}
    if (FGrowType = gtVert) or (FGrowType = gtBoth) then begin
      {Top}
      if (mycontrol.Tag <> FExcludeMove) and (myControl.Tag <> FExcludeBoth) then
        mycontrol.Top:=  round( FArray^[i].Top    * hratio );
      {Height}
      if (myControl.Tag <> FExcludeSize) and (myControl.Tag <> FExcludeBoth) then begin
        myControl.Height:=  round( FArray^[i].Height * hratio );
        {Grid Rows}
        if (FArray^[i].GFlag) and (FAutoGrid) then begin
          for j:= 0 to FArray^[i].DynRow.Count-1 do begin
            TNewGrid(myControl).RowHeights[j]:=
              round(real(FArray^[i].DynRow[j]^) * myControl.Height);
            end;
          end;
        end;
      end; {if}
    {** Horz **}
    if (FGrowType = gtHorz) or (FGrowType = gtBoth) then begin
      {Left}
      if (myControl.Tag <> FExcludeMove) and (myControl.Tag <> FExcludeBoth) then
        myControl.Left:= round( FArray^[i].Left   * wratio );
      {Width}
      if (myControl.Tag <> FExcludeSize) and (myControl.Tag <> FExcludeBoth) then begin
        myControl.Width:=   round( FArray^[i].Width  * wratio );
        {Grid Cols}
        if (FArray^[i].GFlag) and (FAutoGrid) then begin
          for j:= 0 to FArray^[i].DynCol.Count-1 do begin
            TNewGrid(myControl).ColWidths[j]:=
              round(real(FArray^[i].DynCol[j]^) * myControl.Width);
            end;
          end;
        end;
      end; {if}
    end; {for}
  LockWindowUpdate(0);
end;


end.
