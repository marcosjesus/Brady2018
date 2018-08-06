unit uUtils;

interface

uses
  Forms,
  System.IOUtils,
  Windows, SysUtils;

function ComputerName : String;
function WUserName: String;
function MyDocumentsPath: String;
function FileVersion: String;
function StrTran(sOrigem: string; sLoc: string; sSub: string): string;

implementation

uses uPainelOperador;

function MyDocumentsPath: String;
begin

  Result := IOUtils.TPath.GetDocumentsPath + '\' + 'MLSistemas';


  if not IOUtils.TDirectory.Exists(Result) then
    IOUtils.TDirectory.CreateDirectory(Result);

end;

function ComputerName : String;
var
  buffer: array[0..255] of char;
  size: dword;

begin

  size := 256;
  if GetComputerName(buffer, size) then
    Result := buffer
  else
    Result := ''

end;

function WUserName: String;
var
  nSize: DWord;

begin

  nSize := 1024;
  SetLength(Result, nSize);
  if GetUserName(PChar(Result), nSize) then
    SetLength(Result, nSize-1)
  else
    RaiseLastOSError;

  if Result.Equals('rafae') then
    Result := 'petrelra';
//    Result := 'gocaloal';

end;

function FileVersion: String;
var
  VerInfoSize: Cardinal;
  VerValueSize: Cardinal;
  Dummy: Cardinal;
  PVerInfo: Pointer;
  PVerValue: PVSFixedFileInfo;
  FileName: TFileName;

begin

  FileName := Application.ExeName;

  Result := '';
  VerInfoSize := GetFileVersionInfoSize(PChar(FileName), Dummy);
  GetMem(PVerInfo, VerInfoSize);
  try
    if GetFileVersionInfo(PChar(FileName), 0, VerInfoSize, PVerInfo) then
      if VerQueryValue(PVerInfo, '\', Pointer(PVerValue), VerValueSize) then
        with PVerValue^ do
          Result := Format('v%d.%d.%d build %d', [
            HiWord(dwFileVersionMS), //Major
            LoWord(dwFileVersionMS), //Minor
            HiWord(dwFileVersionLS), //Release
            LoWord(dwFileVersionLS)]); //Build
  finally
    FreeMem(PVerInfo, VerInfoSize);
  end;

end;

function StrTran(sOrigem: string; sLoc: string; sSub: string): string;
var
  Aux: string;
  Calc: integer;
  Posicao: integer;
begin
//Localiza um conjunto de strings e subtitui por outro
  Aux := sOrigem;
  Calc := 0;
  Posicao := Pos(sLoc, Aux);
  while Posicao > 0 do
  begin

    Delete(Aux, Posicao, Length(sLoc));
    Posicao := Posicao + Calc;
    sOrigem := Copy(sOrigem, 1, Posicao - 1) + sSub +
      Copy(sOrigem, Posicao + Length(sLoc), Length(sOrigem));
    Calc := Calc + Length(sSub);
    Posicao := Pos(sLoc, Aux);
  end;
  Result := sOrigem;
end;

end.
