unit uKillTrialForm;

interface

uses
  System.Classes,
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants;

type
  TKillTrialForm = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  end;

implementation

{ TKillTrialForm }

function CloseTrialForm(hHwnd: HWND; lParam : integer): boolean; stdcall;
var
  Pid : DWORD;
  ClassName: String;

begin

  Result := False;
  if (hHwnd=Null) then
  begin

    Result := False;

  end
  else
  begin

    GetWindowThreadProcessId(hHwnd,Pid);

    SetLength( ClassName, 255 );
    SetLength( ClassName, GetClassName(hHwnd, PChar(ClassName), Length(ClassName)) );

    if ClassName = 'TfrmTrialNagScreen' then
    begin

      SendMessage(hHwnd, WM_CLOSE, 0, 0);
      Result := True;

    end;

  end;

end;

procedure TKillTrialForm.Execute;
begin

  while not Terminated do
    EnumWindows(@CloseTrialForm,0);

end;

end.
