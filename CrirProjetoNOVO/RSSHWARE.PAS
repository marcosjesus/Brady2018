{******************************************************}
{                  rsShareware V3.0                    }
{        Copyright 1997 RealSoft Development           }
{           support:  www.realsoftdev.com              }
{******************************************************}

unit rsShware;

interface

{$I REALSOFT.INC}

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, Buttons, StdCtrls, DsgnIntf, Realproc
  {$IFDEF WIN32},registry{$ENDIF};

const
  CRYPT_KEY = 123; {change this value to alter the encryption}

type
  TShareType     =   (stNagWare, stTimerWare, stCounterWare, stDelphiIDE);
  TShareStatus   =   (ssUnRegistered, ssRegistered, ssExpired, ssTampered);
  TShareOptions  =   (soPassword, soShowStatus, soSilentMode, soDiskFile,
                      soFileHide, soCustomDialog, soRegistryKey, soAutoExecute,
                      soSpecialBtn, soEnabled);
  TShareSet      =   set of TShareOptions;

  TOnActivate = procedure (Sender: TObject; ShareStatus: TShareStatus;
                           var Display, CloseAPP: boolean) of object;


  RDiskFile      =  packed record
    Count    : LongInt;
    SDate    : LongInt;
    MDate    : LongInt;
    Reg      : TShareStatus;
    end;

  TrsShareware = class(TComponent)
  private
    FShareType      :  TShareType;
    FShareStatus    :  TShareStatus;
    FMaxCount       :  LongInt;
    FMaxDays        :  LongInt;
    Fremaindays     :  LongInt;
    Fremaincount    :  LongInt;
    FFileName       :  String;
    FFileSize       :  Word;
    FFileDate       :  TDateTime;
    FPassword       :  String;
    FCaption        :  String;
    FSpecCaption    :  String;
    FCtl3D          :  boolean;
    FBorderStyle    :  TBorderStyle;
    FAlignment      :  TAlignment;
    FFont           :  TFont;
    FColor          :  TColor;
    FLines          :  TStrings;
    FDiskFile       :  RDiskFile;
    FPassEntry      :  String;
    FStatusString   :  String;
    FOptions        :  TShareSet;
    FRegMain        :  String;
    FRegSub         :  String;
    FOnActivate     :  TOnActivate;
    FOnRegister     :  TNotifyEvent;
    FOnSpecialClick :  TNotifyEvent;
    FOnCustomDialog :  TNotifyEvent;
    {** Custom Shareware Dialog Form **}
    frmShare        :  TForm;
    btnOK           :  TButton;
    btnPass         :  TButton;
    btnSpec         :  TButton;
    Memo            :  TMemo;
    labStatus       :  TLabel;
    procedure SetLines       (Value : TStrings);
    procedure SetFont        (Value : TFont);
    procedure SetFileDate    (Value : String);
    procedure SetFileSize    (Value : word);
    procedure SetMaxCount    (Value : LongInt);
    procedure SetFileName    (Value : String);
    procedure SetPassword    (Value : String);
    procedure SetRegMain     (Value : String);
    procedure SetRegSub      (Value : String);
    function  GetFileDate: String;
    function  GetDays(StartDate: Longint) : Integer;
    function  GetFileName : String;
    function  GetPassword : String;
    function  GetRegMain  : String;
    function  GetRegSub   : String;
    procedure UpdateFile(reg: boolean);
    procedure UpdateReg(reg: boolean);
    procedure ResetFile;
    procedure ResetReg;
    function  Crypt(S: String): string;
    procedure CreateDialog;
    procedure btnPassClick(Sender: TObject);
    procedure btnSpecClick(Sender: TObject);
  protected
    procedure Loaded; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    function  DelphiRunning : boolean;
    procedure SetShare;
    procedure Preview;
    procedure Reset;
    procedure Execute;
    property StatusStr      : String        read FStatusString;
  published
    property Options        : TShareSet     read FOptions         write FOptions;
    property ShareType      : TShareType    read FShareType       write FShareType;
    property ShareStatus    : TShareStatus  read FShareStatus     write FShareStatus;
    property MaxCount       : LongInt       read FMaxCount        write SetMaxCount;
    property MaxDays        : LongInt       read FMaxDays         write FMaxDays;
    property RemainCount    : LongInt       read Fremaincount;    {read only}
    property RemainDays     : LongInt       read Fremaindays;     {read only}
    property FileDate       : String        read GetFileDate      write SetFileDate;
    property FileSize       : word          read FFileSize        write SetFileSize;
    property FileName       : String        read GetFileName      write SetFileName;
    property Password       : String        read GetPassword      write SetPassword;
    property RegistryMain   : String        read GetRegMain       write SetRegMain;
    property RegistrySub    : String        read GetRegSub        write SetRegSub;
    property Caption        : String        read FCaption         write FCaption;
    property SpecialCaption : String        read FSpecCaption     write FSpecCaption;
    property Font           : TFont         read FFont            write SetFont;
    property Color          : TColor        read FColor           write FColor;
    property Ctl3D          : boolean       read FCtl3D           write FCtl3D;
    property Alignment      : TAlignment    read FAlignment       write FAlignment;
    property BorderStyle    : TBorderStyle  read FBorderStyle     write FBorderStyle;
    property Lines          : TStrings      read FLines           write SetLines;
    property OnActivate     : TOnActivate   read FOnActivate      write FOnActivate;
    property OnRegister     : TNotifyEvent  read FOnRegister      write FOnRegister;
    property OnSpecialClick : TNotifyEvent  read FOnSpecialClick  write FOnSpecialClick;
    property OnCustomDialog : TNotifyEvent  read FOnCustomDialog  write FOnCustomDialog;
  end;

  TrsSharewareEditor = class(TComponentEditor)
    function GetVerbCount : Integer; override;
    function GetVerb( Index : Integer ) : string; override;
    procedure ExecuteVerb( Index : Integer ); override;
    procedure Edit; override;
    end;

procedure Register;

implementation

procedure Register;
begin
 RegisterComponents('RSD', [TrsShareware]);
 RegisterComponentEditor( TrsShareware, TrsSharewareEditor );
end;

{*************************************************************}
{                  Component Editor Section                   }
{*************************************************************}
function TrsSharewareEditor.GetVerbCount : Integer;
begin
  Result := 1;
end;

function TrsSharewareEditor.GetVerb( Index : Integer ) : string;
begin
  case Index of
    0: Result := '&Preview Dialog';
  end;
end;

procedure TrsSharewareEditor.ExecuteVerb( Index : Integer );
begin
  case index of
    0: Edit;
    end;
end;

procedure TrsSharewareEditor.Edit;
begin
  (Component as TrsShareware).Preview;
end;

constructor TrsShareware.Create( AOwner: TComponent );
begin
 inherited Create( AOwner );
 FFont         :=  TFont.Create;
 FLines        :=  TStringList.Create;
 {set defaults}
 FOptions:= [soShowStatus, soAutoExecute, soEnabled];

 FMaxDays:= 30;
 FMaxCount:= 5;
 Fremaindays:= 30;
 Fremaincount:= 5;
 FPassEntry:= '';
 FPassWord:= Crypt('secret');
 FShareStatus:= ssUnRegistered;
 FShareType:= stNagware;
 FFileSize:= 100;
 FFileDate:= StrToDateDef('07/11/95',0);
 FFileName:= Crypt('share.dat');

 FDiskFile.Count:=  5;
 FDiskFile.Reg:= ssUnRegistered;
 FDiskFile.SDate:= DateTimeToFileDate(Date);
 FDiskFile.MDate:= DateTimeToFileDate(Date);

 Fcolor:= clSilver;
 FAlignment:= taLeftJustify;
 FCaption:= 'Shareware Notice';
 FSpecCaption:= '&Special';
 FCtl3d:= true;
 {$IFDEF WIN32}
 FBorderStyle:= bsSingle;
 {$ELSE}
 FBorderStyle:= bsNone;
 {$ENDIF}
 FFont.Name:= 'MS Sans Serif';
 FFont.Color:= clBlack;
 FFont.Size:= 8;
 FFont.Style:= [];
 FLines.Clear;
 FLines.Add('* Your Citation Goes Here *');
 FStatusString:= '';
 FRegMain:= Crypt('Realsoft');
 FRegSub := Crypt('Code');
end;

procedure TrsShareware.Loaded;
begin
 inherited Loaded;
 {set default values}
 Fremaindays:= FMaxDays;
 Fremaincount:= FMaxCount;
 {$IFDEF DEMO}
 if not DelphiRunning then
   showmessage('This program is using an unregistered version of the TrsShareware' + #13 +
               'component from RealSoft.  Please register at www.realsoftdev.com' + #13 +
               'or call (949) 831-7879.');
 {$ENDIF}
 if not (csDesigning in ComponentState) then begin
   UpdateFile(false);
   UpdateReg(false);
   if (soAutoExecute in FOptions) and (soEnabled in FOptions) then Execute;
   end;
end;

destructor TrsShareware.Destroy;
begin
 FFont.Free;
 FLines.Free;
 inherited Destroy;
end;

procedure TrsShareware.Execute;
var Display, CloseAPP: boolean;
begin
 if not (soEnabled in FOptions) then Exit;
 if (FShareType = stDelphiIDE) and DelphiRunning then Exit;

 Display:= true;
 CloseAPP:= false;
 if Assigned(FOnActivate) then OnActivate(Self, FShareStatus, Display, CloseAPP);

 if CloseAPP then begin
   Application.Terminate;
   Exit;
   end;

 try CreateDialog;
 SetShare;
 btnPASS.enabled:= true;

 if (not Display) or (soSilentMode in FOptions) then begin
   if (soCustomDialog in FOptions) then
     if Assigned(FOnCustomDialog) then OnCustomDialog(Self);
   end
 else frmShare.ShowModal;

 finally frmShare.Free; end;

 {password registration}
 if FPassEntry <> '' then begin
   if FPassEntry = Crypt(FPassWord) then begin
     FShareStatus:= ssRegistered;
     UpdateFile(true); {register with file}
     UpdateReg(true);  {register with system registry}
     FPassEntry:= '';
     MessageDlg('Password accepted -- Your software is registered.',mtConfirmation,[mbOk],0);
     if Assigned(FOnRegister) then OnRegister(Self); {event}
     end
   else MessageDlg('Password denied.',mtConfirmation,[mbOk],0);
   end;
end;

procedure TrsShareware.Preview;
begin
 CreateDialog;
 SetShare;
 btnPASS.enabled:= false;
 frmShare.ShowModal;
 frmShare.Free;
end;

procedure TrsShareware.SetFont (Value : TFont);
begin
 FFont.Assign(Value);
end;

function TrsShareware.GetFileDate: String;
begin
  Result:= DatetoStr(FFileDate);
end;

procedure TrsShareware.SetFileDate (Value : String);
begin
  FFileDate:= StrtodateDef(Value,0);
end;

procedure TrsShareware.SetFileSize (Value : word);
begin
 if FFileSize <> Value then begin
   if (Value < 32) or (Value > 32000) then begin
     MessageDlg('File Size must be between 32 and 32000',mtWarning,[mbok],0);
     FFilesize:= 0;
     end
   else FFileSize:= Value;
   end;
end;

procedure TrsShareware.SetMaxCount (Value : LongInt);
begin
 if FMaxCount <> Value then begin
   FMaxCount:= Value;
   FDiskFile.Count:= Value;
   end;
end;

function  TrsShareware.GetDays(StartDate: Longint) : Integer;
begin
  {return days left since installation}
  result:= trunc(FMaxDays - (Date - FileDateToDateTime(StartDate)));
  if result < 0 then result:= 0;
end;

procedure TrsShareware.UpdateFile(reg: boolean);
var handle    : integer;
    filename  : string;
    filemode  : word;
    tmpstr    : String;
    tmpchr    : array[0..255] of char;
    dt        : TDateTime;
    dl        : LongInt;
    buffer    : Pointer;
begin
  buffer:= nil;
  {create disk status file or read existing}
  if not (soDiskFile in FOptions) then Exit;
  Filename:= Crypt(FFilename);
  if (Filename = '') or (FFilesize < 32) or (ShareType = stNagWare) then Exit;
  try GetMem(buffer, FFileSize);
  {create path}
  GetWindowsDirectory(tmpchr, 255);
  tmpstr:= StrPas(tmpchr) + '\' + FileName;
  { unhide to see if file exists}
  {$I-}
  FileSetAttr(tmpstr,0);
  {$I+}
  if not FileExists(tmpstr) then begin
    FDiskFile.Count:= FMaxCount;
    FDiskFile.SDate:= DateTimeToFileDate(Date);     {put in start date}
    FDiskFile.MDate:= DateTimeToFileDate(Date);     {put in master date}
    FDiskFile.Reg:= ssUnRegistered;
    move(FDiskFile, buffer^, sizeof(FDiskFile));
    {create file}
    handle:= FileCreate(tmpstr);
    if handle > 0 then begin
      {write to file}
      FileWrite(handle, buffer^, FFileSize);
      {change date}
      dt:= FFileDate + time;
      dl:= DateTimetoFileDate(dt);
      FileSetDate(handle,dl);
      FileClose(handle);
      {assign attribute}
      if (soFileHide in FOptions) then FileSetAttr(tmpstr,faHidden)
      else FileSetAttr(tmpstr, 0);
      end;
    end
  else begin     {file exists -- check status         }
    {re-hide if necessary}
    if (soFileHide in FOptions) then FileSetAttr(tmpstr,faHidden);
    {open file}
    filemode:= fmOpenReadWrite;
    handle:= FileOpen(tmpstr, filemode);
    if handle > 0 then begin
      {read from file}
      FileRead(handle, buffer^, FFileSize);
      move(buffer^, FDiskFile, sizeof(FDiskFile));
      {update read-only properties}
      tmpstr:= floattostrf(GetDays(FDiskFile.SDate),ffGeneral,0,0);
      Fremaindays:= strtointdef(tmpstr,FMaxDays);
      Fremaincount:= FDiskFile.Count;
      {register?}
      if reg then FDiskFile.Reg:= ssRegistered
      else FShareStatus := FDiskFile.Reg;
      {counterware}
      if (FShareType = stCounterware) and (FShareStatus = ssUnRegistered) then begin
        dec(FDiskFile.Count);
        if FDiskFile.Count < 1 then begin
          FShareStatus:= ssExpired;
          FDiskFile.Count:= 0;
          end;
        end;
      {Timerware}
      if (FShareType = stTimerWare) and (FShareStatus = ssUnRegistered) then begin
        {check master date for tampering}
        if DateTimeToFileDate(Date) < FDiskFile.MDate then FShareStatus:= ssTampered
        else begin
          FDiskFile.MDate:= DateTimeToFileDate(Date);
          FShareStatus:= ssUnRegistered;
          {check if expired}
          if GetDays(FDiskFile.SDate) < 1 then FShareStatus:= ssExpired;
          end;
        end;
      {write changes to file}
      move(FDiskFile, buffer^, sizeof(FDiskFile));
      FileSeek(handle,0,0);
      FileWrite(handle, buffer^, FFileSize);
      {change date}
      dt:= FFileDate + time;
      dl:= DateTimetoFileDate(dt);
      FileSetDate(handle,dl);
      FileClose(handle);
      end;
    end;
  finally FreeMem(buffer, FFileSize); end; {try}
end;

procedure TrsShareware.Reset;
begin
  ResetFile;
  ResetReg;
end;

procedure TrsShareware.ResetFile;
var filename  : string;
    tmpstr    : String;
    tmpchr    : array[0..255] of char;
begin
  Filename:= Crypt(FFilename);
  if (Filename = '') then Exit;
  {create path}
  GetWindowsDirectory(tmpchr, 255);
  tmpstr:= StrPas(tmpchr) + '\' + FileName;
  { unhide to see if file exists}
  {$I-}
  FileSetAttr(tmpstr,0);
  {$I+}
  {delete the secret file to reset timers}
  if FileExists(tmpstr) then sysutils.Deletefile(tmpstr);
  {**we need to delete the registry keys here**}
end;

{$IFNDEF WIN32}
procedure TrsShareware.UpdateReg(reg: boolean);
begin
end;

procedure TrsShareware.ResetReg;
begin
end;

{$ELSE}
procedure TrsShareware.UpdateReg(reg: boolean);
var Registry1: TRegistry;
    tmpstr, regmain, regsub: String;
begin
  if not (soRegistryKey in FOptions) then Exit;
  regmain:= crypt(FRegMain);
  regsub:=  crypt(FRegSub);
  if (RegMain = '') or (RegSub = '') or (ShareType = stNagWare) then Exit;

  Registry1:= nil;
  try Registry1:= TRegistry.Create;
  Registry1.RootKey:= HKEY_CLASSES_ROOT;
  Registry1.OpenKey(RegMain, true);
  if not Registry1.ValueExists(RegSub) then begin
    {add new registry key}
    FDiskFile.Count:= FMaxCount;
    FDiskFile.SDate:= DateTimeToFileDate(Date);     {put in start date}
    FDiskFile.MDate:= DateTimeToFileDate(Date);     {put in master date}
    FDiskFile.Reg:= ssUnRegistered;
    Registry1.WriteBinaryData(RegSub, FDiskFile, sizeof(FDiskFile));
    Registry1.CloseKey;
    end
  else begin
    {read existing key to check status}
    if Registry1.ReadBinaryData(RegSub, FDiskFile, sizeof(FDiskFile)) <> sizeof(FDiskFile) then Exit;
    {update read-only properties}
    tmpstr:= floattostrf(GetDays(FDiskFile.SDate),ffGeneral,0,0);
    Fremaindays:= strtointdef(tmpstr,FMaxDays);
    Fremaincount:= FDiskFile.Count;
    {register?}
    if reg then FDiskFile.Reg:= ssRegistered
    else FShareStatus := FDiskFile.Reg;
    {counterware}
    if (FShareType = stCounterware) and (FShareStatus = ssUnRegistered) then begin
      dec(FDiskFile.Count);
      if FDiskFile.Count < 1 then begin
        FShareStatus:= ssExpired;
        FDiskFile.Count:= 0;
        end;
      end;
    {Timerware}
    if (FShareType = stTimerWare) and (FShareStatus = ssUnRegistered) then begin
      {check master date for tampering}
      if DateTimeToFileDate(Date) < FDiskFile.MDate then FShareStatus:= ssTampered
      else begin
        FDiskFile.MDate:= DateTimeToFileDate(Date);     {put in master date}
        FShareStatus:= ssUnRegistered;
        {check if expired}
        if GetDays(FDiskFile.SDate) < 1 then FShareStatus:= ssExpired;
        end;
      end;
    {write changes to file}
    Registry1.WriteBinaryData(RegSub, FDiskFile, sizeof(FDiskFile));
    Registry1.CloseKey;
    end;
  finally Registry1.Free; end;
end;

procedure TrsShareware.ResetReg;
var Registry1: TRegistry;
    regmain, regsub: String;
begin
  if not (soRegistryKey in FOptions) then Exit;
  regmain:= crypt(FRegMain);
  regsub:=  crypt(FRegSub);
  if (RegMain = '') or (RegSub = '') or (ShareType = stNagWare) then Exit;

  Registry1:= nil;
  try Registry1:= TRegistry.Create;
  Registry1.RootKey:= HKEY_CLASSES_ROOT;
  Registry1.OpenKey(RegMain, true);
  if Registry1.ValueExists(RegSub) then Registry1.DeleteValue(RegSub);
  finally Registry1.Free; end;
end;
{$ENDIF}

procedure TrsShareware.SetShare;
var days : real;
begin
 {setup popup dialog memo}
 Memo.Lines.Assign(FLines);
 Memo.Font.Assign(FFont);
 Memo.Color:= FColor;
 Memo.Ctl3D:= FCtl3D;
 Memo.BorderStyle:= FBorderStyle;
 Memo.Alignment:= FAlignment;
 {setup popup dialog form}
 frmShare.Font.Name:= 'MS Sans Serif';
 frmShare.Font.size:= 8;
 frmShare.Caption:= FCaption;
 {password button}
 if (soPassword in FOptions) and (FShareStatus <> ssRegistered) then btnPASS.visible:= true
 else btnPASS.visible:= false;
 {special button}
 if (soSpecialBtn in FOptions) then btnSpec.visible:= true
 else btnSpec.visible:= false;

 if btnSpec.visible and (not btnPASS.visible) then btnSpec.left:= btnPASS.left;

 {Status label}
 if (soShowStatus in FOptions) then begin
   {Registered}
   if FShareStatus = ssRegistered then labStatus.caption:= 'This software has been registered.';
   {expired}
   if FShareStatus = ssExpired then labStatus.caption:= 'Your trial period has expired.  Please register!';
   {tampered system date}
   if FShareStatus = ssTampered then labStatus.caption:= 'System Date has been modified.  Please register!';
   {unregistered}
   if FShareStatus = ssUnRegistered then begin
     {nagware}
     if FShareType = stNagware then labStatus.caption:= 'This software has not been registered.';
     {timerware}
     if FShareType = stTimerware then begin
        days:= GetDays(FDiskFile.SDate);
        if days > 1 then labStatus.caption:= 'Your trial period for this software will end in '
                         + floattostrf(days,ffGeneral,0,0) +' days.';
        if days = 1 then labStatus.caption:= 'Your trial period for this software will end in 1 day.';
        if days < 1 then labStatus.caption:= 'Your trial time has expired.  Please register.';
        end;
     {counterware}
     if FShareType = stCounterWare then begin
        if FDiskFile.Count > 1 then labStatus.caption:= 'You can use this trial software '
                                    + inttostr(FDiskFile.Count) +' more times.';
        if FDiskFile.Count = 1 then labStatus.caption:= 'You can use this trial software 1 more time.';
        if FDiskFile.Count < 1 then labStatus.caption:= 'Your trial use has expired.  Please register!';
        end;
     {Runs in Delphi IDE Only}
     if FShareType = stDelphiIDE then begin
       if not DelphiRunning then
         labStatus.caption:= 'This software will only run in the Delphi IDE until registered.';
       end;
     end;
   end
 else labStatus.caption:= '';

 FStatusString:= labStatus.caption;
end;

function TrsShareware.DelphiRunning : boolean;
begin
 if((FindWindow('TApplication','Delphi') = 0) and (FindWindow('TApplication','Delphi 2.0') = 0) and
    (FindWindow('TApplication','Delphi 3') = 0) and (FindWindow('TApplication','Delphi 4') = 0)) or
    (FindWindow('TPropertyInspector',nil) = 0) or (FindWindow('TAppBuilder',nil) = 0) then result:= false
 else result:= true;
end;

{** Special Dialog Form **}

procedure TrsShareware.CreateDialog;
begin
  {Create Form *on the fly* }
  frmShare        := TForm.CreateNew(Application);
  {Create Components}
  btnOK           := TButton.Create(frmShare);
  btnPass         := TButton.Create(frmShare);
  btnSpec         := TButton.Create(frmShare);
  memo            := TMemo.Create(frmShare);
  labStatus       := TLabel.Create(frmShare);
  {Set properties since we have no .DFM file}
  frmShare.Left := 275;
  frmShare.Top := 104;
  frmShare.HorzScrollBar.Visible:= False;
  frmShare.VertScrollBar.Visible:= False;
  frmShare.BorderIcons:= [biSystemMenu];
  frmShare.BorderStyle:= bsDialog;
  frmShare.Caption:= 'ShareWare';
  frmShare.ClientHeight:= 398;
  frmShare.ClientWidth:= 372;
  frmShare.Font.Color:= clBlack;
  frmShare.Font.Name:= 'MS Sans Serif';
  frmShare.Font.Size:= 8;
  frmShare.Font.Style:= [];
  frmShare.PixelsPerInch:= 96;
  frmShare.Position:= poScreenCenter;
  frmShare.Visible:= false;

  labStatus.Parent:= frmShare;
  labStatus.Left:= 8;
  labStatus.Top:= 350;
  labStatus.Width:= 365;
  labStatus.Height:= 16;

  btnOk.Parent:= frmShare;
  btnOK.Left:= 287;
  btnOK.Top:= 368;
  btnOK.Width:= 77;
  btnOK.Height:= 24;
  btnOK.Caption:= '&OK';
  btnOK.ModalResult:= mrOk;
  btnOK.TabOrder:= 0;

  btnPass.Parent:= frmShare;
  btnPass.Left:= 202;
  btnPass.Top:= 368;
  btnPass.Width:= 77;
  btnPass.Height:= 24;
  btnPass.Caption:= '&Register';
  btnPass.ModalResult:= mrOk;
  btnPass.TabOrder:= 1;
  btnPass.OnClick:= btnPassClick; {event}

  btnSpec.Parent:= frmShare;
  btnSpec.Left:= 117;
  btnSpec.Top:= 368;
  btnSpec.Width:= 77;
  btnSpec.Height:= 24;
  btnSpec.Caption:= FSpecCaption;
  btnSpec.ModalResult:= mrOk;
  btnSpec.TabOrder:= 2;
  btnSpec.OnClick:= btnSpecClick; {event}

  memo.Parent:= frmShare;
  memo.Left:= 8;
  memo.Top:= 6;
  memo.Width:= 356;
  memo.Height:= 340;
  memo.Alignment:= taCenter;
  memo.BorderStyle:= bsNone;
  memo.Color:= clBtnFace;
  memo.Ctl3D:= True;
  memo.ParentCtl3D:= False;
  memo.ReadOnly:= True;
  memo.TabOrder:= 2;
end;

procedure TrsShareware.btnPassClick(Sender: TObject);
var
  NewString: String;
  ClickedOK: Boolean;
begin
  NewString := '';
  ClickedOK := InputQuery('Shareware Registration', 'Enter Password:', NewString);
  if ClickedOK then FPassEntry:= NewString
  else FPassEntry:= '';
end;

procedure TrsShareware.btnSpecClick(Sender: TObject);
begin
  if assigned(FOnSpecialClick) then FOnSpecialClick(Self);
end;

function TrsShareware.Crypt(S: String): string;
var tmpstr: string;
    x: integer;
    b: byte;
begin
  tmpstr:= '';
  for x:= 1 to length(S) do begin
    b:= byte(S[x]) xor CRYPT_KEY;
    tmpstr:= tmpstr + char(b);
    end;
  result:= tmpstr;
end;

procedure TrsShareware.SetFileName (Value : String);
begin
  if csReading in ComponentState then FFilename:= Value
  else FFilename:= Crypt(Value);
end;

procedure TrsShareware.SetPassword (Value : String);
begin
  if csReading in ComponentState then FPassword:= Value
  else FPassword:= Crypt(Value);
end;

function  TrsShareware.GetFileName : String;
begin
  if csWriting in ComponentState then result:= FFileName
  else result:= Crypt(FFileName);
end;

function  TrsShareware.GetPassword : String;
begin
  if csWriting in ComponentState then result:= FPassword
  else result:= Crypt(FPassword);
end;

procedure TrsShareware.SetRegMain (Value : String);
begin
  if csReading in ComponentState then FRegMain:= Value
  else FRegMain:= Crypt(Value);
end;

function  TrsShareware.GetRegMain : String;
begin
  if csWriting in ComponentState then result:= FRegMain
  else result:= Crypt(FRegMain);
end;

procedure TrsShareware.SetRegSub (Value : String);
begin
  if csReading in ComponentState then FRegSub:= Value
  else FRegSub:= Crypt(Value);
end;

function  TrsShareware.GetRegSub : String;
begin
  if csWriting in ComponentState then result:= FRegSub
  else result:= Crypt(FRegSub);
end;

procedure TrsShareware.SetLines(Value : TStrings);
begin
  FLines.Assign(Value);
end;


end.
