program IntegraMagento;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  ActiveX,
  Soap.InvokeRegistry,
  Soap.Rio,
  Soap.SOAPHTTPClient,
  WSMagento in 'WSMagento.pas';

var
  HTTPRIOX: THTTPRIO;
 // varLoginResposta : loginResponseParam;
  varMagento       : Mage_Api_Model_Server_HandlerPortType;
 // varStartSession  : startSessionResponseParam;

procedure Login(User, PassWord : String);
var
 //varParametro    : loginParam;
 varRetorno : String;
begin

   Try

     CoInitialize(nil);
     HTTPRIOX              := THTTPRIO.Create(nil);
     varMagento            := GetMage_Api_Model_Server_HandlerPortType(False, '', HTTPRIOX);
   //  varParametro          := loginParam.Create;;
   //  varParametro.username := User;
   //  varParametro.apiKey   := PassWord;

     //varLoginResposta      := varMagento.login(varParametro);

     varRetorno := varMagento.login('sap_user','!user_sap*@32');

     //varStartSession       := varMagento.startSession;
   Finally
   //  FreeAndNil(varParametro);
     CoUninitialize;
   End;
end;

begin
  try
     Login('sap_user','!user_sap*@32');

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
