// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://homologacao.seton.com.br/api/soap/?wsdl
//  >Import : http://homologacao.seton.com.br/api/soap/?wsdl>0
// Encoding : UTF-8
// Version  : 1.0
// (12/12/2017 11:44:51 - - $Rev: 56641 $)
// ************************************************************************ //

unit WSMagento;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"[]
  // !:boolean         - "http://www.w3.org/2001/XMLSchema"[]
  // !:anyType         - "http://www.w3.org/2001/XMLSchema"[Gbl]

  FixedArray = array of Variant;                { "urn:Magento"[GblCplx] }

  // ************************************************************************ //
  // Namespace : urn:Magento
  // soapAction: urn:Mage_Api_Model_Server_HandlerAction
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // use       : encoded
  // binding   : Mage_Api_Model_Server_HandlerBinding
  // service   : MagentoService
  // port      : Mage_Api_Model_Server_HandlerPort
  // URL       : http://homologacao.seton.com.br/index.php/api/soap/index/
  // ************************************************************************ //
  Mage_Api_Model_Server_HandlerPortType = interface(IInvokable)
  ['{AF38FA94-C498-1AB9-1803-748994E04B2A}']
    function  call(const sessionId: string; const resourcePath: string; const args: Variant): Variant; stdcall;
    function  multiCall(const sessionId: string; const calls: FixedArray; const options: Variant): FixedArray; stdcall;
    function  endSession(const sessionId: string): Boolean; stdcall;
    function  login(const username: string; const apiKey: string): string; stdcall;
    function  startSession: string; stdcall;
    function  resources(const sessionId: string): FixedArray; stdcall;
    function  globalFaults(const sessionId: string): FixedArray; stdcall;
    function  resourceFaults(const resourceName: string; const sessionId: string): FixedArray; stdcall;
  end;

function GetMage_Api_Model_Server_HandlerPortType(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): Mage_Api_Model_Server_HandlerPortType;


implementation
  uses SysUtils;

function GetMage_Api_Model_Server_HandlerPortType(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): Mage_Api_Model_Server_HandlerPortType;
const
  defWSDL = 'http://homologacao.seton.com.br/api/soap/?wsdl';
  defURL  = 'http://homologacao.seton.com.br/index.php/api/soap/index/';
  defSvc  = 'MagentoService';
  defPrt  = 'Mage_Api_Model_Server_HandlerPort';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as Mage_Api_Model_Server_HandlerPortType);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  { Mage_Api_Model_Server_HandlerPortType }
  InvRegistry.RegisterInterface(TypeInfo(Mage_Api_Model_Server_HandlerPortType), 'urn:Magento', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(Mage_Api_Model_Server_HandlerPortType), 'urn:Mage_Api_Model_Server_HandlerAction');
  RemClassRegistry.RegisterXSInfo(TypeInfo(FixedArray), 'urn:Magento', 'FixedArray');

end.