unit EAGetMailObjLib_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 6/3/2014 5:43:43 PM from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Program Files\EAGetMail\EAGetMailObj.dll (1)
// LIBID: {5FA52C10-18FC-4D81-8542-50F9A2DC60A3}
// LCID: 0
// Helpfile: 
// HelpString: EAGetMailObj ActiveX Object 1.0 Type Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\system32\stdole2.tlb)
// Errors:
//   Hint: Member 'To' of 'IMail' changed to 'To_'
//   Hint: Parameter 'Var' of ITools.VarToBSTR changed to 'Var_'
//   Error creating palette bitmap of (TMailClient) : Server C:\Program Files\EAGetMail\EAGetMailObj.dll contains no icons
//   Error creating palette bitmap of (TAttachment) : Server C:\Program Files\EAGetMail\EAGetMailObj.dll contains no icons
//   Error creating palette bitmap of (TCertificate) : Server C:\Program Files\EAGetMail\EAGetMailObj.dll contains no icons
//   Error creating palette bitmap of (THeaderCollection) : Server C:\Program Files\EAGetMail\EAGetMailObj.dll contains no icons
//   Error creating palette bitmap of (THeaderItem) : Server C:\Program Files\EAGetMail\EAGetMailObj.dll contains no icons
//   Error creating palette bitmap of (TImap4Folder) : Server C:\Program Files\EAGetMail\EAGetMailObj.dll contains no icons
//   Error creating palette bitmap of (TMail) : Server C:\Program Files\EAGetMail\EAGetMailObj.dll contains no icons
//   Error creating palette bitmap of (TMailAddress) : Server C:\Program Files\EAGetMail\EAGetMailObj.dll contains no icons
//   Error creating palette bitmap of (TMailInfo) : Server C:\Program Files\EAGetMail\EAGetMailObj.dll contains no icons
//   Error creating palette bitmap of (TMailServer) : Server C:\Program Files\EAGetMail\EAGetMailObj.dll contains no icons
//   Error creating palette bitmap of (TMailReport) : Server C:\Program Files\EAGetMail\EAGetMailObj.dll contains no icons
//   Error creating palette bitmap of (TTools) : Server C:\Program Files\EAGetMail\EAGetMailObj.dll contains no icons
//   Error creating palette bitmap of (TUIDLManager) : Server C:\Program Files\EAGetMail\EAGetMailObj.dll contains no icons
//   Error creating palette bitmap of (TUIDLItem) : Server C:\Program Files\EAGetMail\EAGetMailObj.dll contains no icons
//   Error creating palette bitmap of (TGetMailInfosParamType) : Server C:\Program Files\EAGetMail\EAGetMailObj.dll contains no icons
// ************************************************************************ //
// *************************************************************************//
// NOTE:                                                                      
// Items guarded by $IFDEF_LIVE_SERVER_AT_DESIGN_TIME are used by properties  
// which return objects that may need to be explicitly created via a function 
// call prior to any access via the property. These items have been disabled  
// in order to prevent accidental use from within the object inspector. You   
// may enable them by defining LIVE_SERVER_AT_DESIGN_TIME or by selectively   
// removing them from the $IFDEF blocks. However, such items must still be    
// programmatically created via a method of the appropriate CoClass before    
// they can be used.                                                          
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, OleServer, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  EAGetMailObjLibMajorVersion = 1;
  EAGetMailObjLibMinorVersion = 0;

  LIBID_EAGetMailObjLib: TGUID = '{5FA52C10-18FC-4D81-8542-50F9A2DC60A3}';

  IID_IMailClient: TGUID = '{F7463672-BDA9-428F-8A03-E30C0F1B7EA8}';
  IID_IImap4Folder: TGUID = '{860EA4DE-9B7D-4C1B-8DC0-67B74B981F41}';
  IID_IMailInfo: TGUID = '{CE217339-CBC8-4A35-B0F1-93E376462658}';
  IID_IMailServer: TGUID = '{33520F78-AF50-44E7-9730-00E4083AA765}';
  IID_IMail: TGUID = '{2F71E6CF-9417-46EB-B7C8-1760FDAC17C6}';
  IID_ICertificate: TGUID = '{98790582-CE44-47C9-8F70-90DCFEAF46AC}';
  IID_IMailReport: TGUID = '{372B933C-CB50-48C5-81E5-B1C3122379B1}';
  IID_IHeaderCollection: TGUID = '{00AC14C1-BCB6-48AF-BEBF-C1F41BA7CF07}';
  IID_IHeaderItem: TGUID = '{EF9B19FF-8766-4931-8A3A-405A91475645}';
  IID_IAttachment: TGUID = '{D531D50D-CDC6-400A-B938-46D36382173E}';
  IID_IMailAddress: TGUID = '{9E7048E1-3574-4EFA-AE7B-67A015BA470F}';
  IID_IGetMailInfosParamType: TGUID = '{E9777121-432A-41A1-A895-BE0BBBDD1969}';
  IID_ITools: TGUID = '{6AA9C7EE-BBD2-4941-A348-9E9C343366D2}';
  IID_IUIDLManager: TGUID = '{63D8237A-5DC3-4C82-BE6B-073B32A78759}';
  IID_IUIDLItem: TGUID = '{2BB66CC9-2E20-4567-97C0-494109F5B12B}';
  DIID__IMailClientEvents: TGUID = '{F9C5042F-13E4-42B7-8160-F511C74A9904}';
  CLASS_MailClient: TGUID = '{953EFD7C-8FCE-4D9C-9BD9-E6F19A1B7FC9}';
  CLASS_Attachment: TGUID = '{AD59203B-0C25-4192-98F2-C680D6A16738}';
  CLASS_Certificate: TGUID = '{76BB6AA2-49D5-4452-97A0-C5F7B8910D12}';
  CLASS_HeaderCollection: TGUID = '{3F46EBC3-9D7F-4F73-B779-F2FC6C0B6EE7}';
  CLASS_HeaderItem: TGUID = '{206AF1CC-DF89-4E4E-96EB-40D7641FACFD}';
  CLASS_Imap4Folder: TGUID = '{C06966A4-9F1D-497F-84B9-9204F31994A3}';
  CLASS_Mail: TGUID = '{AE30137E-07C8-403F-8772-07AF79C1DD2E}';
  CLASS_MailAddress: TGUID = '{D6DA04B9-6D72-424A-9582-9752409AAD9C}';
  CLASS_MailInfo: TGUID = '{CFED4866-F709-481F-89C1-4D1BF0F830D3}';
  CLASS_MailServer: TGUID = '{65ACB9B1-68E6-460B-9738-720E0E3A6DD3}';
  CLASS_MailReport: TGUID = '{029033B3-0CFF-452E-8832-8101FDE8D0B4}';
  CLASS_Tools: TGUID = '{8B092B61-AE66-4413-B4D0-6B97FBE6DA08}';
  CLASS_UIDLManager: TGUID = '{440B896B-8AAD-4FEE-8F39-066F79F73E5C}';
  CLASS_UIDLItem: TGUID = '{7096722C-E10D-42D9-A284-1E582D2B27B3}';
  IID_IAddressCollection: TGUID = '{F12A01A0-86FA-4357-BE98-B350C76A5DAB}';
  CLASS_GetMailInfosParamType: TGUID = '{B511D930-097E-4E90-9753-956A067D9E0E}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IMailClient = interface;
  IMailClientDisp = dispinterface;
  IImap4Folder = interface;
  IImap4FolderDisp = dispinterface;
  IMailInfo = interface;
  IMailInfoDisp = dispinterface;
  IMailServer = interface;
  IMailServerDisp = dispinterface;
  IMail = interface;
  IMailDisp = dispinterface;
  ICertificate = interface;
  ICertificateDisp = dispinterface;
  IMailReport = interface;
  IMailReportDisp = dispinterface;
  IHeaderCollection = interface;
  IHeaderCollectionDisp = dispinterface;
  IHeaderItem = interface;
  IHeaderItemDisp = dispinterface;
  IAttachment = interface;
  IAttachmentDisp = dispinterface;
  IMailAddress = interface;
  IMailAddressDisp = dispinterface;
  IGetMailInfosParamType = interface;
  IGetMailInfosParamTypeDisp = dispinterface;
  ITools = interface;
  IToolsDisp = dispinterface;
  IUIDLManager = interface;
  IUIDLManagerDisp = dispinterface;
  IUIDLItem = interface;
  IUIDLItemDisp = dispinterface;
  _IMailClientEvents = dispinterface;
  IAddressCollection = interface;
  IAddressCollectionDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  MailClient = IMailClient;
  Attachment = IAttachment;
  Certificate = ICertificate;
  HeaderCollection = IHeaderCollection;
  HeaderItem = IHeaderItem;
  Imap4Folder = IImap4Folder;
  Mail = IMail;
  MailAddress = IMailAddress;
  MailInfo = IMailInfo;
  MailServer = IMailServer;
  MailReport = IMailReport;
  Tools = ITools;
  UIDLManager = IUIDLManager;
  UIDLItem = IUIDLItem;
  GetMailInfosParamType = IGetMailInfosParamType;


// *********************************************************************//
// Interface: IMailClient
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {F7463672-BDA9-428F-8A03-E30C0F1B7EA8}
// *********************************************************************//
  IMailClient = interface(IDispatch)
    ['{F7463672-BDA9-428F-8A03-E30C0F1B7EA8}']
    procedure Append(const oFolder: IImap4Folder; data: OleVariant); safecall;
    procedure AppendEx(const oFolder: IImap4Folder; data: OleVariant; const Flags: WideString; 
                       MailDateTime: TDateTime); safecall;
    procedure ChangeMailFlags(const oInfo: IMailInfo; const Flags: WideString); safecall;
    procedure Close; safecall;
    procedure Connect(const oServer: IMailServer); safecall;
    procedure Copy(const oInfo: IMailInfo; const oFolder: IImap4Folder); safecall;
    function CreateFolder(const RootFolder: IImap4Folder; const FolderName: WideString): IImap4Folder; safecall;
    procedure Delete(const oInfo: IMailInfo); safecall;
    procedure DeleteFolder(const oFolder: IImap4Folder); safecall;
    procedure Expunge; safecall;
    function GetMail(const oInfo: IMailInfo): IMail; safecall;
    function GetMailHeader(const oInfo: IMailInfo): OleVariant; safecall;
    function GetMailInfos: OleVariant; safecall;
    procedure Logout; safecall;
    procedure Quit; safecall;
    procedure ReConnect; safecall;
    procedure Reset; safecall;
    function SearchMail(const Condition: WideString): OleVariant; safecall;
    procedure SelectFolder(const oFolder: IImap4Folder); safecall;
    procedure SubscribeFolder(const oFolder: IImap4Folder); safecall;
    procedure UnsubscribeFolder(const oFolder: IImap4Folder); safecall;
    procedure WriteLog(const v: WideString); safecall;
    function Get_Connected: WordBool; safecall;
    function Get_Conversation: WideString; safecall;
    function Get_CRLFAfterAppendCommand: WordBool; safecall;
    procedure Set_CRLFAfterAppendCommand(pVal: WordBool); safecall;
    function Get_CurrentMailServer: IMailServer; safecall;
    function Get_Imap4Folders: OleVariant; safecall;
    function Get_LogFileName: WideString; safecall;
    procedure Set_LogFileName(const pVal: WideString); safecall;
    function Get_PreviousCommand: WideString; safecall;
    function Get_SelectedFolder: WideString; safecall;
    function Get_Tag: OleVariant; safecall;
    procedure Set_Tag(pVal: OleVariant); safecall;
    function Get_Timeout: Integer; safecall;
    procedure Set_Timeout(pVal: Integer); safecall;
    function Get_LicenseCode: WideString; safecall;
    procedure Set_LicenseCode(const pVal: WideString); safecall;
    procedure GetMailsByQueue(const oServer: IMailServer; const DownloadFolder: WideString; 
                              LeaveCopy: WordBool); safecall;
    procedure RenameFolder(const oFolder: IImap4Folder; const NewName: WideString); safecall;
    function Get_RemoveDoubleDot: WordBool; safecall;
    procedure Set_RemoveDoubleDot(pVal: WordBool); safecall;
    procedure MarkAsRead(const oInfo: IMailInfo; Read: WordBool); safecall;
    procedure RefreshMailInfos; safecall;
    procedure RefreshFolders; safecall;
    procedure Move(const oInfo: IMailInfo; const oFolder: IImap4Folder); safecall;
    procedure Undelete(const oInfo: IMailInfo); safecall;
    function QueryEWSPublicFolders: OleVariant; safecall;
    function Get_LastErrorDescription: WideString; safecall;
    procedure Set_LastErrorDescription(const pVal: WideString); safecall;
    procedure NOOP; safecall;
    function WaitNewEmail(WaitTimeout: Integer): WordBool; safecall;
    procedure CancelWaitEmail; safecall;
    function Get_GetMailInfosParam: IGetMailInfosParamType; safecall;
    function GetMailCount: Integer; safecall;
    property Connected: WordBool read Get_Connected;
    property Conversation: WideString read Get_Conversation;
    property CRLFAfterAppendCommand: WordBool read Get_CRLFAfterAppendCommand write Set_CRLFAfterAppendCommand;
    property CurrentMailServer: IMailServer read Get_CurrentMailServer;
    property Imap4Folders: OleVariant read Get_Imap4Folders;
    property LogFileName: WideString read Get_LogFileName write Set_LogFileName;
    property PreviousCommand: WideString read Get_PreviousCommand;
    property SelectedFolder: WideString read Get_SelectedFolder;
    property Tag: OleVariant read Get_Tag write Set_Tag;
    property Timeout: Integer read Get_Timeout write Set_Timeout;
    property LicenseCode: WideString read Get_LicenseCode write Set_LicenseCode;
    property RemoveDoubleDot: WordBool read Get_RemoveDoubleDot write Set_RemoveDoubleDot;
    property LastErrorDescription: WideString read Get_LastErrorDescription write Set_LastErrorDescription;
    property GetMailInfosParam: IGetMailInfosParamType read Get_GetMailInfosParam;
  end;

// *********************************************************************//
// DispIntf:  IMailClientDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {F7463672-BDA9-428F-8A03-E30C0F1B7EA8}
// *********************************************************************//
  IMailClientDisp = dispinterface
    ['{F7463672-BDA9-428F-8A03-E30C0F1B7EA8}']
    procedure Append(const oFolder: IImap4Folder; data: OleVariant); dispid 1;
    procedure AppendEx(const oFolder: IImap4Folder; data: OleVariant; const Flags: WideString; 
                       MailDateTime: TDateTime); dispid 2;
    procedure ChangeMailFlags(const oInfo: IMailInfo; const Flags: WideString); dispid 3;
    procedure Close; dispid 4;
    procedure Connect(const oServer: IMailServer); dispid 5;
    procedure Copy(const oInfo: IMailInfo; const oFolder: IImap4Folder); dispid 6;
    function CreateFolder(const RootFolder: IImap4Folder; const FolderName: WideString): IImap4Folder; dispid 7;
    procedure Delete(const oInfo: IMailInfo); dispid 8;
    procedure DeleteFolder(const oFolder: IImap4Folder); dispid 9;
    procedure Expunge; dispid 10;
    function GetMail(const oInfo: IMailInfo): IMail; dispid 11;
    function GetMailHeader(const oInfo: IMailInfo): OleVariant; dispid 12;
    function GetMailInfos: OleVariant; dispid 13;
    procedure Logout; dispid 14;
    procedure Quit; dispid 15;
    procedure ReConnect; dispid 16;
    procedure Reset; dispid 17;
    function SearchMail(const Condition: WideString): OleVariant; dispid 18;
    procedure SelectFolder(const oFolder: IImap4Folder); dispid 19;
    procedure SubscribeFolder(const oFolder: IImap4Folder); dispid 20;
    procedure UnsubscribeFolder(const oFolder: IImap4Folder); dispid 21;
    procedure WriteLog(const v: WideString); dispid 22;
    property Connected: WordBool readonly dispid 23;
    property Conversation: WideString readonly dispid 24;
    property CRLFAfterAppendCommand: WordBool dispid 25;
    property CurrentMailServer: IMailServer readonly dispid 26;
    property Imap4Folders: OleVariant readonly dispid 27;
    property LogFileName: WideString dispid 28;
    property PreviousCommand: WideString readonly dispid 29;
    property SelectedFolder: WideString readonly dispid 30;
    property Tag: OleVariant dispid 31;
    property Timeout: Integer dispid 32;
    property LicenseCode: WideString dispid 33;
    procedure GetMailsByQueue(const oServer: IMailServer; const DownloadFolder: WideString; 
                              LeaveCopy: WordBool); dispid 34;
    procedure RenameFolder(const oFolder: IImap4Folder; const NewName: WideString); dispid 35;
    property RemoveDoubleDot: WordBool dispid 36;
    procedure MarkAsRead(const oInfo: IMailInfo; Read: WordBool); dispid 37;
    procedure RefreshMailInfos; dispid 38;
    procedure RefreshFolders; dispid 39;
    procedure Move(const oInfo: IMailInfo; const oFolder: IImap4Folder); dispid 40;
    procedure Undelete(const oInfo: IMailInfo); dispid 41;
    function QueryEWSPublicFolders: OleVariant; dispid 42;
    property LastErrorDescription: WideString dispid 43;
    procedure NOOP; dispid 44;
    function WaitNewEmail(WaitTimeout: Integer): WordBool; dispid 45;
    procedure CancelWaitEmail; dispid 46;
    property GetMailInfosParam: IGetMailInfosParamType readonly dispid 47;
    function GetMailCount: Integer; dispid 48;
  end;

// *********************************************************************//
// Interface: IImap4Folder
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {860EA4DE-9B7D-4C1B-8DC0-67B74B981F41}
// *********************************************************************//
  IImap4Folder = interface(IDispatch)
    ['{860EA4DE-9B7D-4C1B-8DC0-67B74B981F41}']
    function Get_FullPath: WideString; safecall;
    procedure Set_FullPath(const pVal: WideString); safecall;
    function Get_IMAP4FolderFlags: WideString; safecall;
    procedure Set_IMAP4FolderFlags(const pVal: WideString); safecall;
    function Get_LocalPath: WideString; safecall;
    procedure Set_LocalPath(const pVal: WideString); safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const pVal: WideString); safecall;
    function Get_Subscribed: WordBool; safecall;
    procedure Set_Subscribed(pVal: WordBool); safecall;
    function Get_ServerPath: WideString; safecall;
    procedure Set_ServerPath(const pVal: WideString); safecall;
    function Get_SubFolders: OleVariant; safecall;
    procedure Init(newVal: OleVariant); safecall;
    function Get_NoSelect: WordBool; safecall;
    procedure Set_NoSelect(pVal: WordBool); safecall;
    function Get_ChangeKey: WideString; safecall;
    procedure Set_ChangeKey(const pVal: WideString); safecall;
    function Get_UID: WideString; safecall;
    procedure Set_UID(const pVal: WideString); safecall;
    function FindChild(const Name: WideString): IImap4Folder; safecall;
    function Find(Folders: OleVariant; const Name: WideString): IImap4Folder; safecall;
    function Get_EWSPublicFolder: WordBool; safecall;
    procedure Set_EWSPublicFolder(pVal: WordBool); safecall;
    property FullPath: WideString read Get_FullPath write Set_FullPath;
    property IMAP4FolderFlags: WideString read Get_IMAP4FolderFlags write Set_IMAP4FolderFlags;
    property LocalPath: WideString read Get_LocalPath write Set_LocalPath;
    property Name: WideString read Get_Name write Set_Name;
    property Subscribed: WordBool read Get_Subscribed write Set_Subscribed;
    property ServerPath: WideString read Get_ServerPath write Set_ServerPath;
    property SubFolders: OleVariant read Get_SubFolders;
    property NoSelect: WordBool read Get_NoSelect write Set_NoSelect;
    property ChangeKey: WideString read Get_ChangeKey write Set_ChangeKey;
    property UID: WideString read Get_UID write Set_UID;
    property EWSPublicFolder: WordBool read Get_EWSPublicFolder write Set_EWSPublicFolder;
  end;

// *********************************************************************//
// DispIntf:  IImap4FolderDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {860EA4DE-9B7D-4C1B-8DC0-67B74B981F41}
// *********************************************************************//
  IImap4FolderDisp = dispinterface
    ['{860EA4DE-9B7D-4C1B-8DC0-67B74B981F41}']
    property FullPath: WideString dispid 1;
    property IMAP4FolderFlags: WideString dispid 2;
    property LocalPath: WideString dispid 3;
    property Name: WideString dispid 4;
    property Subscribed: WordBool dispid 5;
    property ServerPath: WideString dispid 6;
    property SubFolders: OleVariant readonly dispid 7;
    procedure Init(newVal: OleVariant); dispid 8;
    property NoSelect: WordBool dispid 9;
    property ChangeKey: WideString dispid 10;
    property UID: WideString dispid 11;
    function FindChild(const Name: WideString): IImap4Folder; dispid 12;
    function Find(Folders: OleVariant; const Name: WideString): IImap4Folder; dispid 13;
    property EWSPublicFolder: WordBool dispid 14;
  end;

// *********************************************************************//
// Interface: IMailInfo
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {CE217339-CBC8-4A35-B0F1-93E376462658}
// *********************************************************************//
  IMailInfo = interface(IDispatch)
    ['{CE217339-CBC8-4A35-B0F1-93E376462658}']
    function Get_Size: Integer; safecall;
    procedure Set_Size(pVal: Integer); safecall;
    function Get_UIDL: WideString; safecall;
    procedure Set_UIDL(const pVal: WideString); safecall;
    function Get_Index: Integer; safecall;
    procedure Set_Index(pVal: Integer); safecall;
    function Get_IMAP4Flags: WideString; safecall;
    procedure Set_IMAP4Flags(const pVal: WideString); safecall;
    function Get_ChangeKey: WideString; safecall;
    procedure Set_ChangeKey(const pVal: WideString); safecall;
    function Get_Read: WordBool; safecall;
    procedure Set_Read(pVal: WordBool); safecall;
    function Get_Deleted: WordBool; safecall;
    procedure Set_Deleted(pVal: WordBool); safecall;
    function Get_PR_ENTRYID: OleVariant; safecall;
    procedure Set_PR_ENTRYID(pVal: OleVariant); safecall;
    property Size: Integer read Get_Size write Set_Size;
    property UIDL: WideString read Get_UIDL write Set_UIDL;
    property Index: Integer read Get_Index write Set_Index;
    property IMAP4Flags: WideString read Get_IMAP4Flags write Set_IMAP4Flags;
    property ChangeKey: WideString read Get_ChangeKey write Set_ChangeKey;
    property Read: WordBool read Get_Read write Set_Read;
    property Deleted: WordBool read Get_Deleted write Set_Deleted;
    property PR_ENTRYID: OleVariant read Get_PR_ENTRYID write Set_PR_ENTRYID;
  end;

// *********************************************************************//
// DispIntf:  IMailInfoDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {CE217339-CBC8-4A35-B0F1-93E376462658}
// *********************************************************************//
  IMailInfoDisp = dispinterface
    ['{CE217339-CBC8-4A35-B0F1-93E376462658}']
    property Size: Integer dispid 1;
    property UIDL: WideString dispid 2;
    property Index: Integer dispid 3;
    property IMAP4Flags: WideString dispid 4;
    property ChangeKey: WideString dispid 5;
    property Read: WordBool dispid 6;
    property Deleted: WordBool dispid 7;
    property PR_ENTRYID: OleVariant dispid 8;
  end;

// *********************************************************************//
// Interface: IMailServer
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {33520F78-AF50-44E7-9730-00E4083AA765}
// *********************************************************************//
  IMailServer = interface(IDispatch)
    ['{33520F78-AF50-44E7-9730-00E4083AA765}']
    function Get_AuthType: Integer; safecall;
    procedure Set_AuthType(pVal: Integer); safecall;
    function Get_Password: WideString; safecall;
    procedure Set_Password(const pVal: WideString); safecall;
    function Get_Port: Integer; safecall;
    procedure Set_Port(pVal: Integer); safecall;
    function Get_Protocol: Integer; safecall;
    procedure Set_Protocol(pVal: Integer); safecall;
    function Get_ProxyProtocol: Integer; safecall;
    procedure Set_ProxyProtocol(pVal: Integer); safecall;
    function Get_Server: WideString; safecall;
    procedure Set_Server(const pVal: WideString); safecall;
    function Get_SocksProxyPassword: WideString; safecall;
    procedure Set_SocksProxyPassword(const pVal: WideString); safecall;
    function Get_SocksProxyPort: Integer; safecall;
    procedure Set_SocksProxyPort(pVal: Integer); safecall;
    function Get_SocksProxyServer: WideString; safecall;
    procedure Set_SocksProxyServer(const pVal: WideString); safecall;
    function Get_SocksProxyUser: WideString; safecall;
    procedure Set_SocksProxyUser(const pVal: WideString); safecall;
    function Get_SSLType: Integer; safecall;
    procedure Set_SSLType(pVal: Integer); safecall;
    function Get_User: WideString; safecall;
    procedure Set_User(const pVal: WideString); safecall;
    function Copy: IMailServer; safecall;
    function Get_SSLConnection: WordBool; safecall;
    procedure Set_SSLConnection(pVal: WordBool); safecall;
    function ToConversationString: WideString; safecall;
    function Get_Alias: WideString; safecall;
    procedure Set_Alias(const pVal: WideString); safecall;
    property AuthType: Integer read Get_AuthType write Set_AuthType;
    property Password: WideString read Get_Password write Set_Password;
    property Port: Integer read Get_Port write Set_Port;
    property Protocol: Integer read Get_Protocol write Set_Protocol;
    property ProxyProtocol: Integer read Get_ProxyProtocol write Set_ProxyProtocol;
    property Server: WideString read Get_Server write Set_Server;
    property SocksProxyPassword: WideString read Get_SocksProxyPassword write Set_SocksProxyPassword;
    property SocksProxyPort: Integer read Get_SocksProxyPort write Set_SocksProxyPort;
    property SocksProxyServer: WideString read Get_SocksProxyServer write Set_SocksProxyServer;
    property SocksProxyUser: WideString read Get_SocksProxyUser write Set_SocksProxyUser;
    property SSLType: Integer read Get_SSLType write Set_SSLType;
    property User: WideString read Get_User write Set_User;
    property SSLConnection: WordBool read Get_SSLConnection write Set_SSLConnection;
    property Alias: WideString read Get_Alias write Set_Alias;
  end;

// *********************************************************************//
// DispIntf:  IMailServerDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {33520F78-AF50-44E7-9730-00E4083AA765}
// *********************************************************************//
  IMailServerDisp = dispinterface
    ['{33520F78-AF50-44E7-9730-00E4083AA765}']
    property AuthType: Integer dispid 1;
    property Password: WideString dispid 2;
    property Port: Integer dispid 3;
    property Protocol: Integer dispid 4;
    property ProxyProtocol: Integer dispid 5;
    property Server: WideString dispid 6;
    property SocksProxyPassword: WideString dispid 7;
    property SocksProxyPort: Integer dispid 8;
    property SocksProxyServer: WideString dispid 9;
    property SocksProxyUser: WideString dispid 10;
    property SSLType: Integer dispid 11;
    property User: WideString dispid 12;
    function Copy: IMailServer; dispid 13;
    property SSLConnection: WordBool dispid 14;
    function ToConversationString: WideString; dispid 15;
    property Alias: WideString dispid 16;
  end;

// *********************************************************************//
// Interface: IMail
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2F71E6CF-9417-46EB-B7C8-1760FDAC17C6}
// *********************************************************************//
  IMail = interface(IDispatch)
    ['{2F71E6CF-9417-46EB-B7C8-1760FDAC17C6}']
    procedure Load(data: OleVariant); safecall;
    function Get_Content: OleVariant; safecall;
    procedure SaveAs(const FileName: WideString; Overwrite: WordBool); safecall;
    procedure Clear; safecall;
    function Decrypt(const Cert: ICertificate): IMail; safecall;
    function GetReport: IMailReport; safecall;
    procedure LoadFile(const FileName: WideString; LateLoadBody: WordBool); safecall;
    function ParseTNEF(data: OleVariant; IncludeRTFBody: WordBool): OleVariant; safecall;
    procedure RemoveAttachment(const Att: IAttachment); safecall;
    function VerifySignature: ICertificate; safecall;
    function Get_Attachments: OleVariant; safecall;
    function Get_BodyHeaders: IHeaderCollection; safecall;
    function Get_Cc: OleVariant; safecall;
    function Get_From: IMailAddress; safecall;
    function Get_Headers: IHeaderCollection; safecall;
    function Get_HtmlBody: WideString; safecall;
    function Get_IsEncrypted: WordBool; safecall;
    function Get_IsReport: WordBool; safecall;
    function Get_IsSigned: WordBool; safecall;
    function Get_OriginalBodyFormat: Integer; safecall;
    function Get_Priority: Integer; safecall;
    function Get_ReceivedDate: TDateTime; safecall;
    function Get_ReplyTo: IMailAddress; safecall;
    function Get_SentDate: TDateTime; safecall;
    function Get_Subject: WideString; safecall;
    function Get_Tag: OleVariant; safecall;
    procedure Set_Tag(pVal: OleVariant); safecall;
    function Get_TextBody: WideString; safecall;
    function Get_To_: OleVariant; safecall;
    function Get_Bcc: OleVariant; safecall;
    function Get_LicenseCode: WideString; safecall;
    procedure Set_LicenseCode(const pVal: WideString); safecall;
    procedure UpdateHeader; safecall;
    function Get_ToAddr: OleVariant; safecall;
    function Get_RemoveDoubleDot: WordBool; safecall;
    procedure Set_RemoveDoubleDot(pVal: WordBool); safecall;
    function Html2Text(const Html: WideString): WideString; safecall;
    function Get_Version: WideString; safecall;
    function RTFToHTML(RTFData: OleVariant): WideString; safecall;
    procedure DecodeTNEF; safecall;
    procedure LoadOMSG(MsgData: OleVariant); safecall;
    function TNEFToMail(TNEFData: OleVariant): IMail; safecall;
    procedure LoadOMSGFile(const FileName: WideString); safecall;
    procedure DecodeTNEFEx; safecall;
    function Get_HasAlternativeBody: WordBool; safecall;
    procedure SaveAsOMSG(const FileName: WideString; Overwrite: WordBool; Unsent: WordBool); safecall;
    property Content: OleVariant read Get_Content;
    property Attachments: OleVariant read Get_Attachments;
    property BodyHeaders: IHeaderCollection read Get_BodyHeaders;
    property Cc: OleVariant read Get_Cc;
    property From: IMailAddress read Get_From;
    property Headers: IHeaderCollection read Get_Headers;
    property HtmlBody: WideString read Get_HtmlBody;
    property IsEncrypted: WordBool read Get_IsEncrypted;
    property IsReport: WordBool read Get_IsReport;
    property IsSigned: WordBool read Get_IsSigned;
    property OriginalBodyFormat: Integer read Get_OriginalBodyFormat;
    property Priority: Integer read Get_Priority;
    property ReceivedDate: TDateTime read Get_ReceivedDate;
    property ReplyTo: IMailAddress read Get_ReplyTo;
    property SentDate: TDateTime read Get_SentDate;
    property Subject: WideString read Get_Subject;
    property Tag: OleVariant read Get_Tag write Set_Tag;
    property TextBody: WideString read Get_TextBody;
    property To_: OleVariant read Get_To_;
    property Bcc: OleVariant read Get_Bcc;
    property LicenseCode: WideString read Get_LicenseCode write Set_LicenseCode;
    property ToAddr: OleVariant read Get_ToAddr;
    property RemoveDoubleDot: WordBool read Get_RemoveDoubleDot write Set_RemoveDoubleDot;
    property Version: WideString read Get_Version;
    property HasAlternativeBody: WordBool read Get_HasAlternativeBody;
  end;

// *********************************************************************//
// DispIntf:  IMailDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2F71E6CF-9417-46EB-B7C8-1760FDAC17C6}
// *********************************************************************//
  IMailDisp = dispinterface
    ['{2F71E6CF-9417-46EB-B7C8-1760FDAC17C6}']
    procedure Load(data: OleVariant); dispid 1;
    property Content: OleVariant readonly dispid 2;
    procedure SaveAs(const FileName: WideString; Overwrite: WordBool); dispid 3;
    procedure Clear; dispid 4;
    function Decrypt(const Cert: ICertificate): IMail; dispid 5;
    function GetReport: IMailReport; dispid 6;
    procedure LoadFile(const FileName: WideString; LateLoadBody: WordBool); dispid 7;
    function ParseTNEF(data: OleVariant; IncludeRTFBody: WordBool): OleVariant; dispid 8;
    procedure RemoveAttachment(const Att: IAttachment); dispid 9;
    function VerifySignature: ICertificate; dispid 10;
    property Attachments: OleVariant readonly dispid 11;
    property BodyHeaders: IHeaderCollection readonly dispid 12;
    property Cc: OleVariant readonly dispid 13;
    property From: IMailAddress readonly dispid 14;
    property Headers: IHeaderCollection readonly dispid 15;
    property HtmlBody: WideString readonly dispid 16;
    property IsEncrypted: WordBool readonly dispid 17;
    property IsReport: WordBool readonly dispid 18;
    property IsSigned: WordBool readonly dispid 19;
    property OriginalBodyFormat: Integer readonly dispid 20;
    property Priority: Integer readonly dispid 21;
    property ReceivedDate: TDateTime readonly dispid 22;
    property ReplyTo: IMailAddress readonly dispid 23;
    property SentDate: TDateTime readonly dispid 24;
    property Subject: WideString readonly dispid 25;
    property Tag: OleVariant dispid 26;
    property TextBody: WideString readonly dispid 27;
    property To_: OleVariant readonly dispid 28;
    property Bcc: OleVariant readonly dispid 29;
    property LicenseCode: WideString dispid 30;
    procedure UpdateHeader; dispid 31;
    property ToAddr: OleVariant readonly dispid 32;
    property RemoveDoubleDot: WordBool dispid 33;
    function Html2Text(const Html: WideString): WideString; dispid 34;
    property Version: WideString readonly dispid 35;
    function RTFToHTML(RTFData: OleVariant): WideString; dispid 36;
    procedure DecodeTNEF; dispid 37;
    procedure LoadOMSG(MsgData: OleVariant); dispid 38;
    function TNEFToMail(TNEFData: OleVariant): IMail; dispid 39;
    procedure LoadOMSGFile(const FileName: WideString); dispid 40;
    procedure DecodeTNEFEx; dispid 41;
    property HasAlternativeBody: WordBool readonly dispid 42;
    procedure SaveAsOMSG(const FileName: WideString; Overwrite: WordBool; Unsent: WordBool); dispid 43;
  end;

// *********************************************************************//
// Interface: ICertificate
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {98790582-CE44-47C9-8F70-90DCFEAF46AC}
// *********************************************************************//
  ICertificate = interface(IDispatch)
    ['{98790582-CE44-47C9-8F70-90DCFEAF46AC}']
    procedure AddToStore(StoreLocation: Integer; const StoreName: WideString); safecall;
    procedure FindCertId(CertId: Largeuint); safecall;
    procedure FindCertIdInStore(CertId: Largeuint; StoreLocation: LongWord; 
                                const StoreName: WideString); safecall;
    procedure FindSubject(const FindKey: WideString; StoreLocation: Integer; 
                          const StoreName: WideString); safecall;
    procedure Load(PFXContent: OleVariant; const Password: WideString; KeyLocation: Integer); safecall;
    procedure LoadFromFile(const PFXFile: WideString; const Password: WideString; 
                           KeyLocation: Integer); safecall;
    procedure Unload; safecall;
    function Get_HasCertificate: WordBool; safecall;
    function Get_Store: Largeuint; safecall;
    function Get_Handle: Largeuint; safecall;
    procedure Set_Handle(pVal: Largeuint); safecall;
    property HasCertificate: WordBool read Get_HasCertificate;
    property Store: Largeuint read Get_Store;
    property Handle: Largeuint read Get_Handle write Set_Handle;
  end;

// *********************************************************************//
// DispIntf:  ICertificateDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {98790582-CE44-47C9-8F70-90DCFEAF46AC}
// *********************************************************************//
  ICertificateDisp = dispinterface
    ['{98790582-CE44-47C9-8F70-90DCFEAF46AC}']
    procedure AddToStore(StoreLocation: Integer; const StoreName: WideString); dispid 1;
    procedure FindCertId(CertId: {??Largeuint}OleVariant); dispid 2;
    procedure FindCertIdInStore(CertId: {??Largeuint}OleVariant; StoreLocation: LongWord; 
                                const StoreName: WideString); dispid 3;
    procedure FindSubject(const FindKey: WideString; StoreLocation: Integer; 
                          const StoreName: WideString); dispid 4;
    procedure Load(PFXContent: OleVariant; const Password: WideString; KeyLocation: Integer); dispid 5;
    procedure LoadFromFile(const PFXFile: WideString; const Password: WideString; 
                           KeyLocation: Integer); dispid 6;
    procedure Unload; dispid 7;
    property HasCertificate: WordBool readonly dispid 8;
    property Store: {??Largeuint}OleVariant readonly dispid 9;
    property Handle: {??Largeuint}OleVariant dispid 10;
  end;

// *********************************************************************//
// Interface: IMailReport
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {372B933C-CB50-48C5-81E5-B1C3122379B1}
// *********************************************************************//
  IMailReport = interface(IDispatch)
    ['{372B933C-CB50-48C5-81E5-B1C3122379B1}']
    function Get_ErrCode: WideString; safecall;
    procedure Set_ErrCode(const pVal: WideString); safecall;
    function Get_ErrDescription: WideString; safecall;
    procedure Set_ErrDescription(const pVal: WideString); safecall;
    function Get_OriginalHeaders: IHeaderCollection; safecall;
    procedure Set_OriginalHeaders(const pVal: IHeaderCollection); safecall;
    function Get_OriginalMessageID: WideString; safecall;
    procedure Set_OriginalMessageID(const pVal: WideString); safecall;
    function Get_OriginalRecipient: WideString; safecall;
    procedure Set_OriginalRecipient(const pVal: WideString); safecall;
    function Get_OriginalSender: WideString; safecall;
    procedure Set_OriginalSender(const pVal: WideString); safecall;
    function Get_OriginalSubject: WideString; safecall;
    procedure Set_OriginalSubject(const pVal: WideString); safecall;
    function Get_ReportMTA: WideString; safecall;
    procedure Set_ReportMTA(const pVal: WideString); safecall;
    function Get_ReportType: Integer; safecall;
    procedure Set_ReportType(pVal: Integer); safecall;
    property ErrCode: WideString read Get_ErrCode write Set_ErrCode;
    property ErrDescription: WideString read Get_ErrDescription write Set_ErrDescription;
    property OriginalHeaders: IHeaderCollection read Get_OriginalHeaders write Set_OriginalHeaders;
    property OriginalMessageID: WideString read Get_OriginalMessageID write Set_OriginalMessageID;
    property OriginalRecipient: WideString read Get_OriginalRecipient write Set_OriginalRecipient;
    property OriginalSender: WideString read Get_OriginalSender write Set_OriginalSender;
    property OriginalSubject: WideString read Get_OriginalSubject write Set_OriginalSubject;
    property ReportMTA: WideString read Get_ReportMTA write Set_ReportMTA;
    property ReportType: Integer read Get_ReportType write Set_ReportType;
  end;

// *********************************************************************//
// DispIntf:  IMailReportDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {372B933C-CB50-48C5-81E5-B1C3122379B1}
// *********************************************************************//
  IMailReportDisp = dispinterface
    ['{372B933C-CB50-48C5-81E5-B1C3122379B1}']
    property ErrCode: WideString dispid 1;
    property ErrDescription: WideString dispid 2;
    property OriginalHeaders: IHeaderCollection dispid 3;
    property OriginalMessageID: WideString dispid 4;
    property OriginalRecipient: WideString dispid 5;
    property OriginalSender: WideString dispid 6;
    property OriginalSubject: WideString dispid 7;
    property ReportMTA: WideString dispid 8;
    property ReportType: Integer dispid 9;
  end;

// *********************************************************************//
// Interface: IHeaderCollection
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00AC14C1-BCB6-48AF-BEBF-C1F41BA7CF07}
// *********************************************************************//
  IHeaderCollection = interface(IDispatch)
    ['{00AC14C1-BCB6-48AF-BEBF-C1F41BA7CF07}']
    function Get_Count: Integer; safecall;
    function Item(Index: Integer): IHeaderItem; safecall;
    function GetValueOfKey(const HeaderKey: WideString): WideString; safecall;
    procedure Add(const oHeader: IHeaderItem); safecall;
    procedure Insert(Index: Integer; const oHeader: IHeaderItem); safecall;
    function SearchKey(const HeaderKey: WideString): Integer; safecall;
    procedure Clear; safecall;
    procedure Remove(const HeaderKey: WideString); safecall;
    procedure RemoveAt(Index: Integer); safecall;
    property Count: Integer read Get_Count;
  end;

// *********************************************************************//
// DispIntf:  IHeaderCollectionDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00AC14C1-BCB6-48AF-BEBF-C1F41BA7CF07}
// *********************************************************************//
  IHeaderCollectionDisp = dispinterface
    ['{00AC14C1-BCB6-48AF-BEBF-C1F41BA7CF07}']
    property Count: Integer readonly dispid 1;
    function Item(Index: Integer): IHeaderItem; dispid 2;
    function GetValueOfKey(const HeaderKey: WideString): WideString; dispid 3;
    procedure Add(const oHeader: IHeaderItem); dispid 4;
    procedure Insert(Index: Integer; const oHeader: IHeaderItem); dispid 5;
    function SearchKey(const HeaderKey: WideString): Integer; dispid 6;
    procedure Clear; dispid 7;
    procedure Remove(const HeaderKey: WideString); dispid 8;
    procedure RemoveAt(Index: Integer); dispid 9;
  end;

// *********************************************************************//
// Interface: IHeaderItem
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {EF9B19FF-8766-4931-8A3A-405A91475645}
// *********************************************************************//
  IHeaderItem = interface(IDispatch)
    ['{EF9B19FF-8766-4931-8A3A-405A91475645}']
    function Get_HeaderKey: WideString; safecall;
    procedure Set_HeaderKey(const pVal: WideString); safecall;
    function Get_HeaderValue: WideString; safecall;
    procedure Set_HeaderValue(const pVal: WideString); safecall;
    function Get_DecodedValue: WideString; safecall;
    function SubValue(const SubKey: WideString): WideString; safecall;
    property HeaderKey: WideString read Get_HeaderKey write Set_HeaderKey;
    property HeaderValue: WideString read Get_HeaderValue write Set_HeaderValue;
    property DecodedValue: WideString read Get_DecodedValue;
  end;

// *********************************************************************//
// DispIntf:  IHeaderItemDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {EF9B19FF-8766-4931-8A3A-405A91475645}
// *********************************************************************//
  IHeaderItemDisp = dispinterface
    ['{EF9B19FF-8766-4931-8A3A-405A91475645}']
    property HeaderKey: WideString dispid 1;
    property HeaderValue: WideString dispid 2;
    property DecodedValue: WideString readonly dispid 3;
    function SubValue(const SubKey: WideString): WideString; dispid 4;
  end;

// *********************************************************************//
// Interface: IAttachment
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {D531D50D-CDC6-400A-B938-46D36382173E}
// *********************************************************************//
  IAttachment = interface(IDispatch)
    ['{D531D50D-CDC6-400A-B938-46D36382173E}']
    function Get_Headers: IHeaderCollection; safecall;
    procedure SaveAs(const FileName: WideString; Overwrite: WordBool); safecall;
    function Get_Charset: WideString; safecall;
    function Get_Content: OleVariant; safecall;
    function Get_ContentID: WideString; safecall;
    function Get_ContentType: WideString; safecall;
    function Get_EncodedContent: OleVariant; safecall;
    function Get_Name: WideString; safecall;
    procedure Init(vt: OleVariant; CodePage: Integer; Start: Integer; Index: Integer); safecall;
    function Get_StartIndex: Integer; safecall;
    function Get_EncodedContentLen: Integer; safecall;
    function Get_RemoveDoubleDot: WordBool; safecall;
    procedure Set_RemoveDoubleDot(pVal: WordBool); safecall;
    property Headers: IHeaderCollection read Get_Headers;
    property Charset: WideString read Get_Charset;
    property Content: OleVariant read Get_Content;
    property ContentID: WideString read Get_ContentID;
    property ContentType: WideString read Get_ContentType;
    property EncodedContent: OleVariant read Get_EncodedContent;
    property Name: WideString read Get_Name;
    property StartIndex: Integer read Get_StartIndex;
    property EncodedContentLen: Integer read Get_EncodedContentLen;
    property RemoveDoubleDot: WordBool read Get_RemoveDoubleDot write Set_RemoveDoubleDot;
  end;

// *********************************************************************//
// DispIntf:  IAttachmentDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {D531D50D-CDC6-400A-B938-46D36382173E}
// *********************************************************************//
  IAttachmentDisp = dispinterface
    ['{D531D50D-CDC6-400A-B938-46D36382173E}']
    property Headers: IHeaderCollection readonly dispid 1;
    procedure SaveAs(const FileName: WideString; Overwrite: WordBool); dispid 2;
    property Charset: WideString readonly dispid 3;
    property Content: OleVariant readonly dispid 4;
    property ContentID: WideString readonly dispid 5;
    property ContentType: WideString readonly dispid 6;
    property EncodedContent: OleVariant readonly dispid 7;
    property Name: WideString readonly dispid 8;
    procedure Init(vt: OleVariant; CodePage: Integer; Start: Integer; Index: Integer); dispid 9;
    property StartIndex: Integer readonly dispid 10;
    property EncodedContentLen: Integer readonly dispid 11;
    property RemoveDoubleDot: WordBool dispid 12;
  end;

// *********************************************************************//
// Interface: IMailAddress
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9E7048E1-3574-4EFA-AE7B-67A015BA470F}
// *********************************************************************//
  IMailAddress = interface(IDispatch)
    ['{9E7048E1-3574-4EFA-AE7B-67A015BA470F}']
    function Get_Name: WideString; safecall;
    procedure Set_Name(const pVal: WideString); safecall;
    function Get_Address: WideString; safecall;
    procedure Set_Address(const pVal: WideString); safecall;
    function EncodeAddr(const Charset: WideString): WideString; safecall;
    property Name: WideString read Get_Name write Set_Name;
    property Address: WideString read Get_Address write Set_Address;
  end;

// *********************************************************************//
// DispIntf:  IMailAddressDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9E7048E1-3574-4EFA-AE7B-67A015BA470F}
// *********************************************************************//
  IMailAddressDisp = dispinterface
    ['{9E7048E1-3574-4EFA-AE7B-67A015BA470F}']
    property Name: WideString dispid 1;
    property Address: WideString dispid 2;
    function EncodeAddr(const Charset: WideString): WideString; dispid 3;
  end;

// *********************************************************************//
// Interface: IGetMailInfosParamType
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {E9777121-432A-41A1-A895-BE0BBBDD1969}
// *********************************************************************//
  IGetMailInfosParamType = interface(IDispatch)
    ['{E9777121-432A-41A1-A895-BE0BBBDD1969}']
    function Get_GetMailInfosOptions: Integer; safecall;
    procedure Set_GetMailInfosOptions(pVal: Integer); safecall;
    function Get_SeqRange: WideString; safecall;
    procedure Set_SeqRange(const pVal: WideString); safecall;
    function Get_UIDRange: WideString; safecall;
    procedure Set_UIDRange(const pVal: WideString); safecall;
    function Get_SubjectContains: WideString; safecall;
    procedure Set_SubjectContains(const pVal: WideString); safecall;
    function Get_SenderContains: WideString; safecall;
    procedure Set_SenderContains(const pVal: WideString); safecall;
    function Get_ValueChanged: WordBool; safecall;
    procedure Set_ValueChanged(pVal: WordBool); safecall;
    function Get_DateRangeSINCE: TDateTime; safecall;
    procedure Set_DateRangeSINCE(pVal: TDateTime); safecall;
    function Get_DateRangeBEFORE: TDateTime; safecall;
    procedure Set_DateRangeBEFORE(pVal: TDateTime); safecall;
    property GetMailInfosOptions: Integer read Get_GetMailInfosOptions write Set_GetMailInfosOptions;
    property SeqRange: WideString read Get_SeqRange write Set_SeqRange;
    property UIDRange: WideString read Get_UIDRange write Set_UIDRange;
    property SubjectContains: WideString read Get_SubjectContains write Set_SubjectContains;
    property SenderContains: WideString read Get_SenderContains write Set_SenderContains;
    property ValueChanged: WordBool read Get_ValueChanged write Set_ValueChanged;
    property DateRangeSINCE: TDateTime read Get_DateRangeSINCE write Set_DateRangeSINCE;
    property DateRangeBEFORE: TDateTime read Get_DateRangeBEFORE write Set_DateRangeBEFORE;
  end;

// *********************************************************************//
// DispIntf:  IGetMailInfosParamTypeDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {E9777121-432A-41A1-A895-BE0BBBDD1969}
// *********************************************************************//
  IGetMailInfosParamTypeDisp = dispinterface
    ['{E9777121-432A-41A1-A895-BE0BBBDD1969}']
    property GetMailInfosOptions: Integer dispid 1;
    property SeqRange: WideString dispid 2;
    property UIDRange: WideString dispid 3;
    property SubjectContains: WideString dispid 4;
    property SenderContains: WideString dispid 5;
    property ValueChanged: WordBool dispid 6;
    property DateRangeSINCE: TDateTime dispid 7;
    property DateRangeBEFORE: TDateTime dispid 8;
  end;

// *********************************************************************//
// Interface: ITools
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {6AA9C7EE-BBD2-4941-A348-9E9C343366D2}
// *********************************************************************//
  ITools = interface(IDispatch)
    ['{6AA9C7EE-BBD2-4941-A348-9E9C343366D2}']
    function VarToBSTR(Var_: OleVariant; CodePage: Integer): WideString; safecall;
    procedure CreateFolder(const FolderName: WideString); safecall;
    function ExistFile(const FileOrFolderName: WideString): WordBool; safecall;
    procedure RemoveFile(const FileName: WideString); safecall;
    procedure RemoveFolder(const FolderName: WideString; Recursive: WordBool); safecall;
    function GetFiles(const FolderName: WideString): OleVariant; safecall;
    function ReadTextFile(const FileName: WideString; CodePage: Integer): WideString; safecall;
    procedure WriteTextFile(const FileName: WideString; const Content: WideString; CodePage: Integer); safecall;
    function GenFileName(Index: Integer): WideString; safecall;
    function BSTRToVar(const Src: WideString; CodePage: Integer): OleVariant; safecall;
    function ReadFileToBase64(const FileName: WideString): WideString; safecall;
    function ReadBinaryFile(const FileName: WideString): OleVariant; safecall;
  end;

// *********************************************************************//
// DispIntf:  IToolsDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {6AA9C7EE-BBD2-4941-A348-9E9C343366D2}
// *********************************************************************//
  IToolsDisp = dispinterface
    ['{6AA9C7EE-BBD2-4941-A348-9E9C343366D2}']
    function VarToBSTR(Var_: OleVariant; CodePage: Integer): WideString; dispid 1;
    procedure CreateFolder(const FolderName: WideString); dispid 2;
    function ExistFile(const FileOrFolderName: WideString): WordBool; dispid 3;
    procedure RemoveFile(const FileName: WideString); dispid 4;
    procedure RemoveFolder(const FolderName: WideString; Recursive: WordBool); dispid 5;
    function GetFiles(const FolderName: WideString): OleVariant; dispid 6;
    function ReadTextFile(const FileName: WideString; CodePage: Integer): WideString; dispid 7;
    procedure WriteTextFile(const FileName: WideString; const Content: WideString; CodePage: Integer); dispid 8;
    function GenFileName(Index: Integer): WideString; dispid 9;
    function BSTRToVar(const Src: WideString; CodePage: Integer): OleVariant; dispid 10;
    function ReadFileToBase64(const FileName: WideString): WideString; dispid 11;
    function ReadBinaryFile(const FileName: WideString): OleVariant; dispid 12;
  end;

// *********************************************************************//
// Interface: IUIDLManager
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {63D8237A-5DC3-4C82-BE6B-073B32A78759}
// *********************************************************************//
  IUIDLManager = interface(IDispatch)
    ['{63D8237A-5DC3-4C82-BE6B-073B32A78759}']
    procedure Load(const FileName: WideString); safecall;
    procedure Update; safecall;
    procedure SyncUIDL(const oServer: IMailServer; Infos: OleVariant); safecall;
    function AddUIDL(const oServer: IMailServer; const UIDL: WideString; 
                     const LocalFileName: WideString): IUIDLItem; safecall;
    procedure RemoveUIDL(const oServer: IMailServer; const UIDL: WideString); safecall;
    procedure RemoveUIDLEX(const oItem: IUIDLItem); safecall;
    procedure RemoveAt(Index: Integer); safecall;
    procedure Clear; safecall;
    function Get_Count: Integer; safecall;
    function Item(Index: Integer): IUIDLItem; safecall;
    function FindUIDL(const oServer: IMailServer; const UIDL: WideString): IUIDLItem; safecall;
    function FindLocalFile(const FileName: WideString): IUIDLItem; safecall;
    property Count: Integer read Get_Count;
  end;

// *********************************************************************//
// DispIntf:  IUIDLManagerDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {63D8237A-5DC3-4C82-BE6B-073B32A78759}
// *********************************************************************//
  IUIDLManagerDisp = dispinterface
    ['{63D8237A-5DC3-4C82-BE6B-073B32A78759}']
    procedure Load(const FileName: WideString); dispid 1;
    procedure Update; dispid 2;
    procedure SyncUIDL(const oServer: IMailServer; Infos: OleVariant); dispid 3;
    function AddUIDL(const oServer: IMailServer; const UIDL: WideString; 
                     const LocalFileName: WideString): IUIDLItem; dispid 4;
    procedure RemoveUIDL(const oServer: IMailServer; const UIDL: WideString); dispid 5;
    procedure RemoveUIDLEX(const oItem: IUIDLItem); dispid 6;
    procedure RemoveAt(Index: Integer); dispid 7;
    procedure Clear; dispid 8;
    property Count: Integer readonly dispid 9;
    function Item(Index: Integer): IUIDLItem; dispid 10;
    function FindUIDL(const oServer: IMailServer; const UIDL: WideString): IUIDLItem; dispid 11;
    function FindLocalFile(const FileName: WideString): IUIDLItem; dispid 12;
  end;

// *********************************************************************//
// Interface: IUIDLItem
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2BB66CC9-2E20-4567-97C0-494109F5B12B}
// *********************************************************************//
  IUIDLItem = interface(IDispatch)
    ['{2BB66CC9-2E20-4567-97C0-494109F5B12B}']
    function Get_UIDL: WideString; safecall;
    procedure Set_UIDL(const pVal: WideString); safecall;
    function Get_ServerUser: WideString; safecall;
    procedure Set_ServerUser(const pVal: WideString); safecall;
    function Get_FileName: WideString; safecall;
    procedure Set_FileName(const pVal: WideString); safecall;
    function Get_DownloadTime: TDateTime; safecall;
    procedure Set_DownloadTime(pVal: TDateTime); safecall;
    function Get_Flags: Integer; safecall;
    procedure Set_Flags(pVal: Integer); safecall;
    function Get_Index: Integer; safecall;
    procedure Set_Index(pVal: Integer); safecall;
    property UIDL: WideString read Get_UIDL write Set_UIDL;
    property ServerUser: WideString read Get_ServerUser write Set_ServerUser;
    property FileName: WideString read Get_FileName write Set_FileName;
    property DownloadTime: TDateTime read Get_DownloadTime write Set_DownloadTime;
    property Flags: Integer read Get_Flags write Set_Flags;
    property Index: Integer read Get_Index write Set_Index;
  end;

// *********************************************************************//
// DispIntf:  IUIDLItemDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {2BB66CC9-2E20-4567-97C0-494109F5B12B}
// *********************************************************************//
  IUIDLItemDisp = dispinterface
    ['{2BB66CC9-2E20-4567-97C0-494109F5B12B}']
    property UIDL: WideString dispid 1;
    property ServerUser: WideString dispid 2;
    property FileName: WideString dispid 3;
    property DownloadTime: TDateTime dispid 4;
    property Flags: Integer dispid 5;
    property Index: Integer dispid 6;
  end;

// *********************************************************************//
// DispIntf:  _IMailClientEvents
// Flags:     (4096) Dispatchable
// GUID:      {F9C5042F-13E4-42B7-8160-F511C74A9904}
// *********************************************************************//
  _IMailClientEvents = dispinterface
    ['{F9C5042F-13E4-42B7-8160-F511C74A9904}']
    procedure OnIdle(const oSender: IDispatch; var Cancel: WordBool); dispid 1;
    procedure OnConnected(const oSender: IDispatch; var Cancel: WordBool); dispid 2;
    procedure OnQuit(const oSender: IDispatch; var Cancel: WordBool); dispid 3;
    procedure OnSendCommand(const oSender: IDispatch; data: OleVariant; IsDataStream: WordBool; 
                            var Cancel: WordBool); dispid 4;
    procedure OnReceiveResponse(const oSender: IDispatch; data: OleVariant; IsDataStream: WordBool; 
                                var Cancel: WordBool); dispid 5;
    procedure OnSecuring(const oSender: IDispatch; var Cancel: WordBool); dispid 6;
    procedure OnAuthorized(const oSender: IDispatch; var Cancel: WordBool); dispid 7;
    procedure OnSendingDataStream(const oSender: IDispatch; Sent: Integer; Total: Integer; 
                                  var Cancel: WordBool); dispid 8;
    procedure OnReceivingDataStream(const oSender: IDispatch; const oInfo: IDispatch; 
                                    Received: Integer; Total: Integer; var Cancel: WordBool); dispid 9;
  end;

// *********************************************************************//
// Interface: IAddressCollection
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {F12A01A0-86FA-4357-BE98-B350C76A5DAB}
// *********************************************************************//
  IAddressCollection = interface(IDispatch)
    ['{F12A01A0-86FA-4357-BE98-B350C76A5DAB}']
    function Get_Count: Integer; safecall;
    function Item: IMailAddress; safecall;
    procedure Add(const oAddr: IMailAddress); safecall;
    procedure Clear; safecall;
    property Count: Integer read Get_Count;
  end;

// *********************************************************************//
// DispIntf:  IAddressCollectionDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {F12A01A0-86FA-4357-BE98-B350C76A5DAB}
// *********************************************************************//
  IAddressCollectionDisp = dispinterface
    ['{F12A01A0-86FA-4357-BE98-B350C76A5DAB}']
    property Count: Integer readonly dispid 1;
    function Item: IMailAddress; dispid 2;
    procedure Add(const oAddr: IMailAddress); dispid 3;
    procedure Clear; dispid 4;
  end;

// *********************************************************************//
// The Class CoMailClient provides a Create and CreateRemote method to          
// create instances of the default interface IMailClient exposed by              
// the CoClass MailClient. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoMailClient = class
    class function Create: IMailClient;
    class function CreateRemote(const MachineName: string): IMailClient;
  end;

  TMailClientOnIdle = procedure(ASender: TObject; const oSender: IDispatch; var Cancel: WordBool) of object;
  TMailClientOnConnected = procedure(ASender: TObject; const oSender: IDispatch; 
                                                       var Cancel: WordBool) of object;
  TMailClientOnQuit = procedure(ASender: TObject; const oSender: IDispatch; var Cancel: WordBool) of object;
  TMailClientOnSendCommand = procedure(ASender: TObject; const oSender: IDispatch; 
                                                         data: OleVariant; IsDataStream: WordBool; 
                                                         var Cancel: WordBool) of object;
  TMailClientOnReceiveResponse = procedure(ASender: TObject; const oSender: IDispatch; 
                                                             data: OleVariant; 
                                                             IsDataStream: WordBool; 
                                                             var Cancel: WordBool) of object;
  TMailClientOnSecuring = procedure(ASender: TObject; const oSender: IDispatch; var Cancel: WordBool) of object;
  TMailClientOnAuthorized = procedure(ASender: TObject; const oSender: IDispatch; 
                                                        var Cancel: WordBool) of object;
  TMailClientOnSendingDataStream = procedure(ASender: TObject; const oSender: IDispatch; 
                                                               Sent: Integer; Total: Integer; 
                                                               var Cancel: WordBool) of object;
  TMailClientOnReceivingDataStream = procedure(ASender: TObject; const oSender: IDispatch; 
                                                                 const oInfo: IDispatch; 
                                                                 Received: Integer; Total: Integer; 
                                                                 var Cancel: WordBool) of object;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TMailClient
// Help String      : MailClient Class
// Default Interface: IMailClient
// Def. Intf. DISP? : No
// Event   Interface: _IMailClientEvents
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TMailClientProperties= class;
{$ENDIF}
  TMailClient = class(TOleServer)
  private
    FOnIdle: TMailClientOnIdle;
    FOnConnected: TMailClientOnConnected;
    FOnQuit: TMailClientOnQuit;
    FOnSendCommand: TMailClientOnSendCommand;
    FOnReceiveResponse: TMailClientOnReceiveResponse;
    FOnSecuring: TMailClientOnSecuring;
    FOnAuthorized: TMailClientOnAuthorized;
    FOnSendingDataStream: TMailClientOnSendingDataStream;
    FOnReceivingDataStream: TMailClientOnReceivingDataStream;
    FAutoQuit:    Boolean;
    FIntf:        IMailClient;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TMailClientProperties;
    function      GetServerProperties: TMailClientProperties;
{$ENDIF}
    function      GetDefaultInterface: IMailClient;
  protected
    procedure InitServerData; override;
    procedure InvokeEvent(DispID: TDispID; var Params: TVariantArray); override;
    function Get_Connected: WordBool;
    function Get_Conversation: WideString;
    function Get_CRLFAfterAppendCommand: WordBool;
    procedure Set_CRLFAfterAppendCommand(pVal: WordBool);
    function Get_CurrentMailServer: IMailServer;
    function Get_Imap4Folders: OleVariant;
    function Get_LogFileName: WideString;
    procedure Set_LogFileName(const pVal: WideString);
    function Get_PreviousCommand: WideString;
    function Get_SelectedFolder: WideString;
    function Get_Tag: OleVariant;
    procedure Set_Tag(pVal: OleVariant);
    function Get_Timeout: Integer;
    procedure Set_Timeout(pVal: Integer);
    function Get_LicenseCode: WideString;
    procedure Set_LicenseCode(const pVal: WideString);
    function Get_RemoveDoubleDot: WordBool;
    procedure Set_RemoveDoubleDot(pVal: WordBool);
    function Get_LastErrorDescription: WideString;
    procedure Set_LastErrorDescription(const pVal: WideString);
    function Get_GetMailInfosParam: IGetMailInfosParamType;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IMailClient);
    procedure Disconnect; override;
    procedure Append(const oFolder: IImap4Folder; data: OleVariant);
    procedure AppendEx(const oFolder: IImap4Folder; data: OleVariant; const Flags: WideString; 
                       MailDateTime: TDateTime);
    procedure ChangeMailFlags(const oInfo: IMailInfo; const Flags: WideString);
    procedure Close;
    procedure Connect1(const oServer: IMailServer);
    procedure Copy(const oInfo: IMailInfo; const oFolder: IImap4Folder);
    function CreateFolder(const RootFolder: IImap4Folder; const FolderName: WideString): IImap4Folder;
    procedure Delete(const oInfo: IMailInfo);
    procedure DeleteFolder(const oFolder: IImap4Folder);
    procedure Expunge;
    function GetMail(const oInfo: IMailInfo): IMail;
    function GetMailHeader(const oInfo: IMailInfo): OleVariant;
    function GetMailInfos: OleVariant;
    procedure Logout;
    procedure Quit;
    procedure ReConnect;
    procedure Reset;
    function SearchMail(const Condition: WideString): OleVariant;
    procedure SelectFolder(const oFolder: IImap4Folder);
    procedure SubscribeFolder(const oFolder: IImap4Folder);
    procedure UnsubscribeFolder(const oFolder: IImap4Folder);
    procedure WriteLog(const v: WideString);
    procedure GetMailsByQueue(const oServer: IMailServer; const DownloadFolder: WideString; 
                              LeaveCopy: WordBool);
    procedure RenameFolder(const oFolder: IImap4Folder; const NewName: WideString);
    procedure MarkAsRead(const oInfo: IMailInfo; Read: WordBool);
    procedure RefreshMailInfos;
    procedure RefreshFolders;
    procedure Move(const oInfo: IMailInfo; const oFolder: IImap4Folder);
    procedure Undelete(const oInfo: IMailInfo);
    function QueryEWSPublicFolders: OleVariant;
    procedure NOOP;
    function WaitNewEmail(WaitTimeout: Integer): WordBool;
    procedure CancelWaitEmail;
    function GetMailCount: Integer;
    property DefaultInterface: IMailClient read GetDefaultInterface;
    property Connected: WordBool read Get_Connected;
    property Conversation: WideString read Get_Conversation;
    property CurrentMailServer: IMailServer read Get_CurrentMailServer;
    property Imap4Folders: OleVariant read Get_Imap4Folders;
    property PreviousCommand: WideString read Get_PreviousCommand;
    property SelectedFolder: WideString read Get_SelectedFolder;
    property Tag: OleVariant read Get_Tag write Set_Tag;
    property GetMailInfosParam: IGetMailInfosParamType read Get_GetMailInfosParam;
    property CRLFAfterAppendCommand: WordBool read Get_CRLFAfterAppendCommand write Set_CRLFAfterAppendCommand;
    property LogFileName: WideString read Get_LogFileName write Set_LogFileName;
    property Timeout: Integer read Get_Timeout write Set_Timeout;
    property LicenseCode: WideString read Get_LicenseCode write Set_LicenseCode;
    property RemoveDoubleDot: WordBool read Get_RemoveDoubleDot write Set_RemoveDoubleDot;
    property LastErrorDescription: WideString read Get_LastErrorDescription write Set_LastErrorDescription;
  published
    property AutoQuit: Boolean read FAutoQuit write FAutoQuit; 
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TMailClientProperties read GetServerProperties;
{$ENDIF}
    property OnIdle: TMailClientOnIdle read FOnIdle write FOnIdle;
    property OnConnected: TMailClientOnConnected read FOnConnected write FOnConnected;
    property OnQuit: TMailClientOnQuit read FOnQuit write FOnQuit;
    property OnSendCommand: TMailClientOnSendCommand read FOnSendCommand write FOnSendCommand;
    property OnReceiveResponse: TMailClientOnReceiveResponse read FOnReceiveResponse write FOnReceiveResponse;
    property OnSecuring: TMailClientOnSecuring read FOnSecuring write FOnSecuring;
    property OnAuthorized: TMailClientOnAuthorized read FOnAuthorized write FOnAuthorized;
    property OnSendingDataStream: TMailClientOnSendingDataStream read FOnSendingDataStream write FOnSendingDataStream;
    property OnReceivingDataStream: TMailClientOnReceivingDataStream read FOnReceivingDataStream write FOnReceivingDataStream;
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TMailClient
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TMailClientProperties = class(TPersistent)
  private
    FServer:    TMailClient;
    function    GetDefaultInterface: IMailClient;
    constructor Create(AServer: TMailClient);
  protected
    function Get_Connected: WordBool;
    function Get_Conversation: WideString;
    function Get_CRLFAfterAppendCommand: WordBool;
    procedure Set_CRLFAfterAppendCommand(pVal: WordBool);
    function Get_CurrentMailServer: IMailServer;
    function Get_Imap4Folders: OleVariant;
    function Get_LogFileName: WideString;
    procedure Set_LogFileName(const pVal: WideString);
    function Get_PreviousCommand: WideString;
    function Get_SelectedFolder: WideString;
    function Get_Tag: OleVariant;
    procedure Set_Tag(pVal: OleVariant);
    function Get_Timeout: Integer;
    procedure Set_Timeout(pVal: Integer);
    function Get_LicenseCode: WideString;
    procedure Set_LicenseCode(const pVal: WideString);
    function Get_RemoveDoubleDot: WordBool;
    procedure Set_RemoveDoubleDot(pVal: WordBool);
    function Get_LastErrorDescription: WideString;
    procedure Set_LastErrorDescription(const pVal: WideString);
    function Get_GetMailInfosParam: IGetMailInfosParamType;
  public
    property DefaultInterface: IMailClient read GetDefaultInterface;
  published
    property CRLFAfterAppendCommand: WordBool read Get_CRLFAfterAppendCommand write Set_CRLFAfterAppendCommand;
    property LogFileName: WideString read Get_LogFileName write Set_LogFileName;
    property Timeout: Integer read Get_Timeout write Set_Timeout;
    property LicenseCode: WideString read Get_LicenseCode write Set_LicenseCode;
    property RemoveDoubleDot: WordBool read Get_RemoveDoubleDot write Set_RemoveDoubleDot;
    property LastErrorDescription: WideString read Get_LastErrorDescription write Set_LastErrorDescription;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoAttachment provides a Create and CreateRemote method to          
// create instances of the default interface IAttachment exposed by              
// the CoClass Attachment. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAttachment = class
    class function Create: IAttachment;
    class function CreateRemote(const MachineName: string): IAttachment;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TAttachment
// Help String      : Attachment Class
// Default Interface: IAttachment
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TAttachmentProperties= class;
{$ENDIF}
  TAttachment = class(TOleServer)
  private
    FIntf:        IAttachment;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TAttachmentProperties;
    function      GetServerProperties: TAttachmentProperties;
{$ENDIF}
    function      GetDefaultInterface: IAttachment;
  protected
    procedure InitServerData; override;
    function Get_Headers: IHeaderCollection;
    function Get_Charset: WideString;
    function Get_Content: OleVariant;
    function Get_ContentID: WideString;
    function Get_ContentType: WideString;
    function Get_EncodedContent: OleVariant;
    function Get_Name: WideString;
    function Get_EncodedContentLen: Integer;
    function Get_RemoveDoubleDot: WordBool;
    procedure Set_RemoveDoubleDot(pVal: WordBool);
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IAttachment);
    procedure Disconnect; override;
    procedure SaveAs(const FileName: WideString; Overwrite: WordBool);
    property DefaultInterface: IAttachment read GetDefaultInterface;
    property Headers: IHeaderCollection read Get_Headers;
    property Charset: WideString read Get_Charset;
    property Content: OleVariant read Get_Content;
    property ContentID: WideString read Get_ContentID;
    property ContentType: WideString read Get_ContentType;
    property EncodedContent: OleVariant read Get_EncodedContent;
    property Name: WideString read Get_Name;
    property EncodedContentLen: Integer read Get_EncodedContentLen;
    property RemoveDoubleDot: WordBool read Get_RemoveDoubleDot write Set_RemoveDoubleDot;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TAttachmentProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TAttachment
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TAttachmentProperties = class(TPersistent)
  private
    FServer:    TAttachment;
    function    GetDefaultInterface: IAttachment;
    constructor Create(AServer: TAttachment);
  protected
    function Get_Headers: IHeaderCollection;
    function Get_Charset: WideString;
    function Get_Content: OleVariant;
    function Get_ContentID: WideString;
    function Get_ContentType: WideString;
    function Get_EncodedContent: OleVariant;
    function Get_Name: WideString;
    function Get_EncodedContentLen: Integer;
    function Get_RemoveDoubleDot: WordBool;
    procedure Set_RemoveDoubleDot(pVal: WordBool);
  public
    property DefaultInterface: IAttachment read GetDefaultInterface;
  published
    property RemoveDoubleDot: WordBool read Get_RemoveDoubleDot write Set_RemoveDoubleDot;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoCertificate provides a Create and CreateRemote method to          
// create instances of the default interface ICertificate exposed by              
// the CoClass Certificate. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoCertificate = class
    class function Create: ICertificate;
    class function CreateRemote(const MachineName: string): ICertificate;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TCertificate
// Help String      : Certificate Class
// Default Interface: ICertificate
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TCertificateProperties= class;
{$ENDIF}
  TCertificate = class(TOleServer)
  private
    FIntf:        ICertificate;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TCertificateProperties;
    function      GetServerProperties: TCertificateProperties;
{$ENDIF}
    function      GetDefaultInterface: ICertificate;
  protected
    procedure InitServerData; override;
    function Get_HasCertificate: WordBool;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ICertificate);
    procedure Disconnect; override;
    procedure AddToStore(StoreLocation: Integer; const StoreName: WideString);
    procedure FindSubject(const FindKey: WideString; StoreLocation: Integer; 
                          const StoreName: WideString);
    procedure Load(PFXContent: OleVariant; const Password: WideString; KeyLocation: Integer);
    procedure LoadFromFile(const PFXFile: WideString; const Password: WideString; 
                           KeyLocation: Integer);
    procedure Unload;
    property DefaultInterface: ICertificate read GetDefaultInterface;
    property HasCertificate: WordBool read Get_HasCertificate;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TCertificateProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TCertificate
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TCertificateProperties = class(TPersistent)
  private
    FServer:    TCertificate;
    function    GetDefaultInterface: ICertificate;
    constructor Create(AServer: TCertificate);
  protected
    function Get_HasCertificate: WordBool;
  public
    property DefaultInterface: ICertificate read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoHeaderCollection provides a Create and CreateRemote method to          
// create instances of the default interface IHeaderCollection exposed by              
// the CoClass HeaderCollection. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoHeaderCollection = class
    class function Create: IHeaderCollection;
    class function CreateRemote(const MachineName: string): IHeaderCollection;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : THeaderCollection
// Help String      : HeaderCollection Class
// Default Interface: IHeaderCollection
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  THeaderCollectionProperties= class;
{$ENDIF}
  THeaderCollection = class(TOleServer)
  private
    FIntf:        IHeaderCollection;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       THeaderCollectionProperties;
    function      GetServerProperties: THeaderCollectionProperties;
{$ENDIF}
    function      GetDefaultInterface: IHeaderCollection;
  protected
    procedure InitServerData; override;
    function Get_Count: Integer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IHeaderCollection);
    procedure Disconnect; override;
    function Item(Index: Integer): IHeaderItem;
    function GetValueOfKey(const HeaderKey: WideString): WideString;
    procedure Add(const oHeader: IHeaderItem);
    procedure Insert(Index: Integer; const oHeader: IHeaderItem);
    function SearchKey(const HeaderKey: WideString): Integer;
    procedure Clear;
    procedure Remove(const HeaderKey: WideString);
    procedure RemoveAt(Index: Integer);
    property DefaultInterface: IHeaderCollection read GetDefaultInterface;
    property Count: Integer read Get_Count;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: THeaderCollectionProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : THeaderCollection
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 THeaderCollectionProperties = class(TPersistent)
  private
    FServer:    THeaderCollection;
    function    GetDefaultInterface: IHeaderCollection;
    constructor Create(AServer: THeaderCollection);
  protected
    function Get_Count: Integer;
  public
    property DefaultInterface: IHeaderCollection read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoHeaderItem provides a Create and CreateRemote method to          
// create instances of the default interface IHeaderItem exposed by              
// the CoClass HeaderItem. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoHeaderItem = class
    class function Create: IHeaderItem;
    class function CreateRemote(const MachineName: string): IHeaderItem;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : THeaderItem
// Help String      : HeaderItem Class
// Default Interface: IHeaderItem
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  THeaderItemProperties= class;
{$ENDIF}
  THeaderItem = class(TOleServer)
  private
    FIntf:        IHeaderItem;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       THeaderItemProperties;
    function      GetServerProperties: THeaderItemProperties;
{$ENDIF}
    function      GetDefaultInterface: IHeaderItem;
  protected
    procedure InitServerData; override;
    function Get_HeaderKey: WideString;
    procedure Set_HeaderKey(const pVal: WideString);
    function Get_HeaderValue: WideString;
    procedure Set_HeaderValue(const pVal: WideString);
    function Get_DecodedValue: WideString;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IHeaderItem);
    procedure Disconnect; override;
    function SubValue(const SubKey: WideString): WideString;
    property DefaultInterface: IHeaderItem read GetDefaultInterface;
    property DecodedValue: WideString read Get_DecodedValue;
    property HeaderKey: WideString read Get_HeaderKey write Set_HeaderKey;
    property HeaderValue: WideString read Get_HeaderValue write Set_HeaderValue;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: THeaderItemProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : THeaderItem
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 THeaderItemProperties = class(TPersistent)
  private
    FServer:    THeaderItem;
    function    GetDefaultInterface: IHeaderItem;
    constructor Create(AServer: THeaderItem);
  protected
    function Get_HeaderKey: WideString;
    procedure Set_HeaderKey(const pVal: WideString);
    function Get_HeaderValue: WideString;
    procedure Set_HeaderValue(const pVal: WideString);
    function Get_DecodedValue: WideString;
  public
    property DefaultInterface: IHeaderItem read GetDefaultInterface;
  published
    property HeaderKey: WideString read Get_HeaderKey write Set_HeaderKey;
    property HeaderValue: WideString read Get_HeaderValue write Set_HeaderValue;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoImap4Folder provides a Create and CreateRemote method to          
// create instances of the default interface IImap4Folder exposed by              
// the CoClass Imap4Folder. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoImap4Folder = class
    class function Create: IImap4Folder;
    class function CreateRemote(const MachineName: string): IImap4Folder;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TImap4Folder
// Help String      : Imap4Folder Class
// Default Interface: IImap4Folder
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TImap4FolderProperties= class;
{$ENDIF}
  TImap4Folder = class(TOleServer)
  private
    FIntf:        IImap4Folder;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TImap4FolderProperties;
    function      GetServerProperties: TImap4FolderProperties;
{$ENDIF}
    function      GetDefaultInterface: IImap4Folder;
  protected
    procedure InitServerData; override;
    function Get_FullPath: WideString;
    procedure Set_FullPath(const pVal: WideString);
    function Get_IMAP4FolderFlags: WideString;
    procedure Set_IMAP4FolderFlags(const pVal: WideString);
    function Get_LocalPath: WideString;
    procedure Set_LocalPath(const pVal: WideString);
    function Get_Name: WideString;
    procedure Set_Name(const pVal: WideString);
    function Get_Subscribed: WordBool;
    procedure Set_Subscribed(pVal: WordBool);
    function Get_ServerPath: WideString;
    procedure Set_ServerPath(const pVal: WideString);
    function Get_SubFolders: OleVariant;
    function Get_NoSelect: WordBool;
    procedure Set_NoSelect(pVal: WordBool);
    function Get_ChangeKey: WideString;
    procedure Set_ChangeKey(const pVal: WideString);
    function Get_UID: WideString;
    procedure Set_UID(const pVal: WideString);
    function Get_EWSPublicFolder: WordBool;
    procedure Set_EWSPublicFolder(pVal: WordBool);
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IImap4Folder);
    procedure Disconnect; override;
    function FindChild(const Name: WideString): IImap4Folder;
    function Find(Folders: OleVariant; const Name: WideString): IImap4Folder;
    property DefaultInterface: IImap4Folder read GetDefaultInterface;
    property SubFolders: OleVariant read Get_SubFolders;
    property FullPath: WideString read Get_FullPath write Set_FullPath;
    property IMAP4FolderFlags: WideString read Get_IMAP4FolderFlags write Set_IMAP4FolderFlags;
    property LocalPath: WideString read Get_LocalPath write Set_LocalPath;
    property Name: WideString read Get_Name write Set_Name;
    property Subscribed: WordBool read Get_Subscribed write Set_Subscribed;
    property ServerPath: WideString read Get_ServerPath write Set_ServerPath;
    property NoSelect: WordBool read Get_NoSelect write Set_NoSelect;
    property ChangeKey: WideString read Get_ChangeKey write Set_ChangeKey;
    property UID: WideString read Get_UID write Set_UID;
    property EWSPublicFolder: WordBool read Get_EWSPublicFolder write Set_EWSPublicFolder;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TImap4FolderProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TImap4Folder
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TImap4FolderProperties = class(TPersistent)
  private
    FServer:    TImap4Folder;
    function    GetDefaultInterface: IImap4Folder;
    constructor Create(AServer: TImap4Folder);
  protected
    function Get_FullPath: WideString;
    procedure Set_FullPath(const pVal: WideString);
    function Get_IMAP4FolderFlags: WideString;
    procedure Set_IMAP4FolderFlags(const pVal: WideString);
    function Get_LocalPath: WideString;
    procedure Set_LocalPath(const pVal: WideString);
    function Get_Name: WideString;
    procedure Set_Name(const pVal: WideString);
    function Get_Subscribed: WordBool;
    procedure Set_Subscribed(pVal: WordBool);
    function Get_ServerPath: WideString;
    procedure Set_ServerPath(const pVal: WideString);
    function Get_SubFolders: OleVariant;
    function Get_NoSelect: WordBool;
    procedure Set_NoSelect(pVal: WordBool);
    function Get_ChangeKey: WideString;
    procedure Set_ChangeKey(const pVal: WideString);
    function Get_UID: WideString;
    procedure Set_UID(const pVal: WideString);
    function Get_EWSPublicFolder: WordBool;
    procedure Set_EWSPublicFolder(pVal: WordBool);
  public
    property DefaultInterface: IImap4Folder read GetDefaultInterface;
  published
    property FullPath: WideString read Get_FullPath write Set_FullPath;
    property IMAP4FolderFlags: WideString read Get_IMAP4FolderFlags write Set_IMAP4FolderFlags;
    property LocalPath: WideString read Get_LocalPath write Set_LocalPath;
    property Name: WideString read Get_Name write Set_Name;
    property Subscribed: WordBool read Get_Subscribed write Set_Subscribed;
    property ServerPath: WideString read Get_ServerPath write Set_ServerPath;
    property NoSelect: WordBool read Get_NoSelect write Set_NoSelect;
    property ChangeKey: WideString read Get_ChangeKey write Set_ChangeKey;
    property UID: WideString read Get_UID write Set_UID;
    property EWSPublicFolder: WordBool read Get_EWSPublicFolder write Set_EWSPublicFolder;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoMail provides a Create and CreateRemote method to          
// create instances of the default interface IMail exposed by              
// the CoClass Mail. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoMail = class
    class function Create: IMail;
    class function CreateRemote(const MachineName: string): IMail;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TMail
// Help String      : Mail Class
// Default Interface: IMail
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TMailProperties= class;
{$ENDIF}
  TMail = class(TOleServer)
  private
    FIntf:        IMail;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TMailProperties;
    function      GetServerProperties: TMailProperties;
{$ENDIF}
    function      GetDefaultInterface: IMail;
  protected
    procedure InitServerData; override;
    function Get_Content: OleVariant;
    function Get_Attachments: OleVariant;
    function Get_BodyHeaders: IHeaderCollection;
    function Get_Cc: OleVariant;
    function Get_From: IMailAddress;
    function Get_Headers: IHeaderCollection;
    function Get_HtmlBody: WideString;
    function Get_IsEncrypted: WordBool;
    function Get_IsReport: WordBool;
    function Get_IsSigned: WordBool;
    function Get_OriginalBodyFormat: Integer;
    function Get_Priority: Integer;
    function Get_ReceivedDate: TDateTime;
    function Get_ReplyTo: IMailAddress;
    function Get_SentDate: TDateTime;
    function Get_Subject: WideString;
    function Get_Tag: OleVariant;
    procedure Set_Tag(pVal: OleVariant);
    function Get_TextBody: WideString;
    function Get_To_: OleVariant;
    function Get_Bcc: OleVariant;
    function Get_LicenseCode: WideString;
    procedure Set_LicenseCode(const pVal: WideString);
    function Get_ToAddr: OleVariant;
    function Get_RemoveDoubleDot: WordBool;
    procedure Set_RemoveDoubleDot(pVal: WordBool);
    function Get_Version: WideString;
    function Get_HasAlternativeBody: WordBool;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IMail);
    procedure Disconnect; override;
    procedure Load(data: OleVariant);
    procedure SaveAs(const FileName: WideString; Overwrite: WordBool);
    procedure Clear;
    function Decrypt(const Cert: ICertificate): IMail;
    function GetReport: IMailReport;
    procedure LoadFile(const FileName: WideString; LateLoadBody: WordBool);
    function ParseTNEF(data: OleVariant; IncludeRTFBody: WordBool): OleVariant;
    procedure RemoveAttachment(const Att: IAttachment);
    function VerifySignature: ICertificate;
    procedure UpdateHeader;
    function Html2Text(const Html: WideString): WideString;
    function RTFToHTML(RTFData: OleVariant): WideString;
    procedure DecodeTNEF;
    procedure LoadOMSG(MsgData: OleVariant);
    function TNEFToMail(TNEFData: OleVariant): IMail;
    procedure LoadOMSGFile(const FileName: WideString);
    procedure DecodeTNEFEx;
    procedure SaveAsOMSG(const FileName: WideString; Overwrite: WordBool; Unsent: WordBool);
    property DefaultInterface: IMail read GetDefaultInterface;
    property Content: OleVariant read Get_Content;
    property Attachments: OleVariant read Get_Attachments;
    property BodyHeaders: IHeaderCollection read Get_BodyHeaders;
    property Cc: OleVariant read Get_Cc;
    property From: IMailAddress read Get_From;
    property Headers: IHeaderCollection read Get_Headers;
    property HtmlBody: WideString read Get_HtmlBody;
    property IsEncrypted: WordBool read Get_IsEncrypted;
    property IsReport: WordBool read Get_IsReport;
    property IsSigned: WordBool read Get_IsSigned;
    property OriginalBodyFormat: Integer read Get_OriginalBodyFormat;
    property Priority: Integer read Get_Priority;
    property ReceivedDate: TDateTime read Get_ReceivedDate;
    property ReplyTo: IMailAddress read Get_ReplyTo;
    property SentDate: TDateTime read Get_SentDate;
    property Subject: WideString read Get_Subject;
    property Tag: OleVariant read Get_Tag write Set_Tag;
    property TextBody: WideString read Get_TextBody;
    property To_: OleVariant read Get_To_;
    property Bcc: OleVariant read Get_Bcc;
    property ToAddr: OleVariant read Get_ToAddr;
    property Version: WideString read Get_Version;
    property HasAlternativeBody: WordBool read Get_HasAlternativeBody;
    property LicenseCode: WideString read Get_LicenseCode write Set_LicenseCode;
    property RemoveDoubleDot: WordBool read Get_RemoveDoubleDot write Set_RemoveDoubleDot;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TMailProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TMail
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TMailProperties = class(TPersistent)
  private
    FServer:    TMail;
    function    GetDefaultInterface: IMail;
    constructor Create(AServer: TMail);
  protected
    function Get_Content: OleVariant;
    function Get_Attachments: OleVariant;
    function Get_BodyHeaders: IHeaderCollection;
    function Get_Cc: OleVariant;
    function Get_From: IMailAddress;
    function Get_Headers: IHeaderCollection;
    function Get_HtmlBody: WideString;
    function Get_IsEncrypted: WordBool;
    function Get_IsReport: WordBool;
    function Get_IsSigned: WordBool;
    function Get_OriginalBodyFormat: Integer;
    function Get_Priority: Integer;
    function Get_ReceivedDate: TDateTime;
    function Get_ReplyTo: IMailAddress;
    function Get_SentDate: TDateTime;
    function Get_Subject: WideString;
    function Get_Tag: OleVariant;
    procedure Set_Tag(pVal: OleVariant);
    function Get_TextBody: WideString;
    function Get_To_: OleVariant;
    function Get_Bcc: OleVariant;
    function Get_LicenseCode: WideString;
    procedure Set_LicenseCode(const pVal: WideString);
    function Get_ToAddr: OleVariant;
    function Get_RemoveDoubleDot: WordBool;
    procedure Set_RemoveDoubleDot(pVal: WordBool);
    function Get_Version: WideString;
    function Get_HasAlternativeBody: WordBool;
  public
    property DefaultInterface: IMail read GetDefaultInterface;
  published
    property LicenseCode: WideString read Get_LicenseCode write Set_LicenseCode;
    property RemoveDoubleDot: WordBool read Get_RemoveDoubleDot write Set_RemoveDoubleDot;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoMailAddress provides a Create and CreateRemote method to          
// create instances of the default interface IMailAddress exposed by              
// the CoClass MailAddress. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoMailAddress = class
    class function Create: IMailAddress;
    class function CreateRemote(const MachineName: string): IMailAddress;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TMailAddress
// Help String      : MailAddress Class
// Default Interface: IMailAddress
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TMailAddressProperties= class;
{$ENDIF}
  TMailAddress = class(TOleServer)
  private
    FIntf:        IMailAddress;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TMailAddressProperties;
    function      GetServerProperties: TMailAddressProperties;
{$ENDIF}
    function      GetDefaultInterface: IMailAddress;
  protected
    procedure InitServerData; override;
    function Get_Name: WideString;
    procedure Set_Name(const pVal: WideString);
    function Get_Address: WideString;
    procedure Set_Address(const pVal: WideString);
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IMailAddress);
    procedure Disconnect; override;
    function EncodeAddr(const Charset: WideString): WideString;
    property DefaultInterface: IMailAddress read GetDefaultInterface;
    property Name: WideString read Get_Name write Set_Name;
    property Address: WideString read Get_Address write Set_Address;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TMailAddressProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TMailAddress
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TMailAddressProperties = class(TPersistent)
  private
    FServer:    TMailAddress;
    function    GetDefaultInterface: IMailAddress;
    constructor Create(AServer: TMailAddress);
  protected
    function Get_Name: WideString;
    procedure Set_Name(const pVal: WideString);
    function Get_Address: WideString;
    procedure Set_Address(const pVal: WideString);
  public
    property DefaultInterface: IMailAddress read GetDefaultInterface;
  published
    property Name: WideString read Get_Name write Set_Name;
    property Address: WideString read Get_Address write Set_Address;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoMailInfo provides a Create and CreateRemote method to          
// create instances of the default interface IMailInfo exposed by              
// the CoClass MailInfo. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoMailInfo = class
    class function Create: IMailInfo;
    class function CreateRemote(const MachineName: string): IMailInfo;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TMailInfo
// Help String      : MailInfo Class
// Default Interface: IMailInfo
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TMailInfoProperties= class;
{$ENDIF}
  TMailInfo = class(TOleServer)
  private
    FIntf:        IMailInfo;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TMailInfoProperties;
    function      GetServerProperties: TMailInfoProperties;
{$ENDIF}
    function      GetDefaultInterface: IMailInfo;
  protected
    procedure InitServerData; override;
    function Get_Size: Integer;
    procedure Set_Size(pVal: Integer);
    function Get_UIDL: WideString;
    procedure Set_UIDL(const pVal: WideString);
    function Get_Index: Integer;
    procedure Set_Index(pVal: Integer);
    function Get_IMAP4Flags: WideString;
    procedure Set_IMAP4Flags(const pVal: WideString);
    function Get_ChangeKey: WideString;
    procedure Set_ChangeKey(const pVal: WideString);
    function Get_Read: WordBool;
    procedure Set_Read(pVal: WordBool);
    function Get_Deleted: WordBool;
    procedure Set_Deleted(pVal: WordBool);
    function Get_PR_ENTRYID: OleVariant;
    procedure Set_PR_ENTRYID(pVal: OleVariant);
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IMailInfo);
    procedure Disconnect; override;
    property DefaultInterface: IMailInfo read GetDefaultInterface;
    property PR_ENTRYID: OleVariant read Get_PR_ENTRYID write Set_PR_ENTRYID;
    property Size: Integer read Get_Size write Set_Size;
    property UIDL: WideString read Get_UIDL write Set_UIDL;
    property Index: Integer read Get_Index write Set_Index;
    property IMAP4Flags: WideString read Get_IMAP4Flags write Set_IMAP4Flags;
    property ChangeKey: WideString read Get_ChangeKey write Set_ChangeKey;
    property Read: WordBool read Get_Read write Set_Read;
    property Deleted: WordBool read Get_Deleted write Set_Deleted;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TMailInfoProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TMailInfo
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TMailInfoProperties = class(TPersistent)
  private
    FServer:    TMailInfo;
    function    GetDefaultInterface: IMailInfo;
    constructor Create(AServer: TMailInfo);
  protected
    function Get_Size: Integer;
    procedure Set_Size(pVal: Integer);
    function Get_UIDL: WideString;
    procedure Set_UIDL(const pVal: WideString);
    function Get_Index: Integer;
    procedure Set_Index(pVal: Integer);
    function Get_IMAP4Flags: WideString;
    procedure Set_IMAP4Flags(const pVal: WideString);
    function Get_ChangeKey: WideString;
    procedure Set_ChangeKey(const pVal: WideString);
    function Get_Read: WordBool;
    procedure Set_Read(pVal: WordBool);
    function Get_Deleted: WordBool;
    procedure Set_Deleted(pVal: WordBool);
    function Get_PR_ENTRYID: OleVariant;
    procedure Set_PR_ENTRYID(pVal: OleVariant);
  public
    property DefaultInterface: IMailInfo read GetDefaultInterface;
  published
    property Size: Integer read Get_Size write Set_Size;
    property UIDL: WideString read Get_UIDL write Set_UIDL;
    property Index: Integer read Get_Index write Set_Index;
    property IMAP4Flags: WideString read Get_IMAP4Flags write Set_IMAP4Flags;
    property ChangeKey: WideString read Get_ChangeKey write Set_ChangeKey;
    property Read: WordBool read Get_Read write Set_Read;
    property Deleted: WordBool read Get_Deleted write Set_Deleted;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoMailServer provides a Create and CreateRemote method to          
// create instances of the default interface IMailServer exposed by              
// the CoClass MailServer. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoMailServer = class
    class function Create: IMailServer;
    class function CreateRemote(const MachineName: string): IMailServer;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TMailServer
// Help String      : MailServer Class
// Default Interface: IMailServer
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TMailServerProperties= class;
{$ENDIF}
  TMailServer = class(TOleServer)
  private
    FIntf:        IMailServer;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TMailServerProperties;
    function      GetServerProperties: TMailServerProperties;
{$ENDIF}
    function      GetDefaultInterface: IMailServer;
  protected
    procedure InitServerData; override;
    function Get_AuthType: Integer;
    procedure Set_AuthType(pVal: Integer);
    function Get_Password: WideString;
    procedure Set_Password(const pVal: WideString);
    function Get_Port: Integer;
    procedure Set_Port(pVal: Integer);
    function Get_Protocol: Integer;
    procedure Set_Protocol(pVal: Integer);
    function Get_ProxyProtocol: Integer;
    procedure Set_ProxyProtocol(pVal: Integer);
    function Get_Server: WideString;
    procedure Set_Server(const pVal: WideString);
    function Get_SocksProxyPassword: WideString;
    procedure Set_SocksProxyPassword(const pVal: WideString);
    function Get_SocksProxyPort: Integer;
    procedure Set_SocksProxyPort(pVal: Integer);
    function Get_SocksProxyServer: WideString;
    procedure Set_SocksProxyServer(const pVal: WideString);
    function Get_SocksProxyUser: WideString;
    procedure Set_SocksProxyUser(const pVal: WideString);
    function Get_SSLType: Integer;
    procedure Set_SSLType(pVal: Integer);
    function Get_User: WideString;
    procedure Set_User(const pVal: WideString);
    function Get_SSLConnection: WordBool;
    procedure Set_SSLConnection(pVal: WordBool);
    function Get_Alias: WideString;
    procedure Set_Alias(const pVal: WideString);
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IMailServer);
    procedure Disconnect; override;
    function Copy: IMailServer;
    function ToConversationString: WideString;
    property DefaultInterface: IMailServer read GetDefaultInterface;
    property AuthType: Integer read Get_AuthType write Set_AuthType;
    property Password: WideString read Get_Password write Set_Password;
    property Port: Integer read Get_Port write Set_Port;
    property Protocol: Integer read Get_Protocol write Set_Protocol;
    property ProxyProtocol: Integer read Get_ProxyProtocol write Set_ProxyProtocol;
    property Server: WideString read Get_Server write Set_Server;
    property SocksProxyPassword: WideString read Get_SocksProxyPassword write Set_SocksProxyPassword;
    property SocksProxyPort: Integer read Get_SocksProxyPort write Set_SocksProxyPort;
    property SocksProxyServer: WideString read Get_SocksProxyServer write Set_SocksProxyServer;
    property SocksProxyUser: WideString read Get_SocksProxyUser write Set_SocksProxyUser;
    property SSLType: Integer read Get_SSLType write Set_SSLType;
    property User: WideString read Get_User write Set_User;
    property SSLConnection: WordBool read Get_SSLConnection write Set_SSLConnection;
    property Alias: WideString read Get_Alias write Set_Alias;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TMailServerProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TMailServer
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TMailServerProperties = class(TPersistent)
  private
    FServer:    TMailServer;
    function    GetDefaultInterface: IMailServer;
    constructor Create(AServer: TMailServer);
  protected
    function Get_AuthType: Integer;
    procedure Set_AuthType(pVal: Integer);
    function Get_Password: WideString;
    procedure Set_Password(const pVal: WideString);
    function Get_Port: Integer;
    procedure Set_Port(pVal: Integer);
    function Get_Protocol: Integer;
    procedure Set_Protocol(pVal: Integer);
    function Get_ProxyProtocol: Integer;
    procedure Set_ProxyProtocol(pVal: Integer);
    function Get_Server: WideString;
    procedure Set_Server(const pVal: WideString);
    function Get_SocksProxyPassword: WideString;
    procedure Set_SocksProxyPassword(const pVal: WideString);
    function Get_SocksProxyPort: Integer;
    procedure Set_SocksProxyPort(pVal: Integer);
    function Get_SocksProxyServer: WideString;
    procedure Set_SocksProxyServer(const pVal: WideString);
    function Get_SocksProxyUser: WideString;
    procedure Set_SocksProxyUser(const pVal: WideString);
    function Get_SSLType: Integer;
    procedure Set_SSLType(pVal: Integer);
    function Get_User: WideString;
    procedure Set_User(const pVal: WideString);
    function Get_SSLConnection: WordBool;
    procedure Set_SSLConnection(pVal: WordBool);
    function Get_Alias: WideString;
    procedure Set_Alias(const pVal: WideString);
  public
    property DefaultInterface: IMailServer read GetDefaultInterface;
  published
    property AuthType: Integer read Get_AuthType write Set_AuthType;
    property Password: WideString read Get_Password write Set_Password;
    property Port: Integer read Get_Port write Set_Port;
    property Protocol: Integer read Get_Protocol write Set_Protocol;
    property ProxyProtocol: Integer read Get_ProxyProtocol write Set_ProxyProtocol;
    property Server: WideString read Get_Server write Set_Server;
    property SocksProxyPassword: WideString read Get_SocksProxyPassword write Set_SocksProxyPassword;
    property SocksProxyPort: Integer read Get_SocksProxyPort write Set_SocksProxyPort;
    property SocksProxyServer: WideString read Get_SocksProxyServer write Set_SocksProxyServer;
    property SocksProxyUser: WideString read Get_SocksProxyUser write Set_SocksProxyUser;
    property SSLType: Integer read Get_SSLType write Set_SSLType;
    property User: WideString read Get_User write Set_User;
    property SSLConnection: WordBool read Get_SSLConnection write Set_SSLConnection;
    property Alias: WideString read Get_Alias write Set_Alias;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoMailReport provides a Create and CreateRemote method to          
// create instances of the default interface IMailReport exposed by              
// the CoClass MailReport. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoMailReport = class
    class function Create: IMailReport;
    class function CreateRemote(const MachineName: string): IMailReport;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TMailReport
// Help String      : MailReport Class
// Default Interface: IMailReport
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TMailReportProperties= class;
{$ENDIF}
  TMailReport = class(TOleServer)
  private
    FIntf:        IMailReport;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TMailReportProperties;
    function      GetServerProperties: TMailReportProperties;
{$ENDIF}
    function      GetDefaultInterface: IMailReport;
  protected
    procedure InitServerData; override;
    function Get_ErrCode: WideString;
    procedure Set_ErrCode(const pVal: WideString);
    function Get_ErrDescription: WideString;
    procedure Set_ErrDescription(const pVal: WideString);
    function Get_OriginalHeaders: IHeaderCollection;
    procedure Set_OriginalHeaders(const pVal: IHeaderCollection);
    function Get_OriginalMessageID: WideString;
    procedure Set_OriginalMessageID(const pVal: WideString);
    function Get_OriginalRecipient: WideString;
    procedure Set_OriginalRecipient(const pVal: WideString);
    function Get_OriginalSender: WideString;
    procedure Set_OriginalSender(const pVal: WideString);
    function Get_OriginalSubject: WideString;
    procedure Set_OriginalSubject(const pVal: WideString);
    function Get_ReportMTA: WideString;
    procedure Set_ReportMTA(const pVal: WideString);
    function Get_ReportType: Integer;
    procedure Set_ReportType(pVal: Integer);
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IMailReport);
    procedure Disconnect; override;
    property DefaultInterface: IMailReport read GetDefaultInterface;
    property ErrCode: WideString read Get_ErrCode write Set_ErrCode;
    property ErrDescription: WideString read Get_ErrDescription write Set_ErrDescription;
    property OriginalHeaders: IHeaderCollection read Get_OriginalHeaders write Set_OriginalHeaders;
    property OriginalMessageID: WideString read Get_OriginalMessageID write Set_OriginalMessageID;
    property OriginalRecipient: WideString read Get_OriginalRecipient write Set_OriginalRecipient;
    property OriginalSender: WideString read Get_OriginalSender write Set_OriginalSender;
    property OriginalSubject: WideString read Get_OriginalSubject write Set_OriginalSubject;
    property ReportMTA: WideString read Get_ReportMTA write Set_ReportMTA;
    property ReportType: Integer read Get_ReportType write Set_ReportType;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TMailReportProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TMailReport
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TMailReportProperties = class(TPersistent)
  private
    FServer:    TMailReport;
    function    GetDefaultInterface: IMailReport;
    constructor Create(AServer: TMailReport);
  protected
    function Get_ErrCode: WideString;
    procedure Set_ErrCode(const pVal: WideString);
    function Get_ErrDescription: WideString;
    procedure Set_ErrDescription(const pVal: WideString);
    function Get_OriginalHeaders: IHeaderCollection;
    procedure Set_OriginalHeaders(const pVal: IHeaderCollection);
    function Get_OriginalMessageID: WideString;
    procedure Set_OriginalMessageID(const pVal: WideString);
    function Get_OriginalRecipient: WideString;
    procedure Set_OriginalRecipient(const pVal: WideString);
    function Get_OriginalSender: WideString;
    procedure Set_OriginalSender(const pVal: WideString);
    function Get_OriginalSubject: WideString;
    procedure Set_OriginalSubject(const pVal: WideString);
    function Get_ReportMTA: WideString;
    procedure Set_ReportMTA(const pVal: WideString);
    function Get_ReportType: Integer;
    procedure Set_ReportType(pVal: Integer);
  public
    property DefaultInterface: IMailReport read GetDefaultInterface;
  published
    property ErrCode: WideString read Get_ErrCode write Set_ErrCode;
    property ErrDescription: WideString read Get_ErrDescription write Set_ErrDescription;
    property OriginalHeaders: IHeaderCollection read Get_OriginalHeaders write Set_OriginalHeaders;
    property OriginalMessageID: WideString read Get_OriginalMessageID write Set_OriginalMessageID;
    property OriginalRecipient: WideString read Get_OriginalRecipient write Set_OriginalRecipient;
    property OriginalSender: WideString read Get_OriginalSender write Set_OriginalSender;
    property OriginalSubject: WideString read Get_OriginalSubject write Set_OriginalSubject;
    property ReportMTA: WideString read Get_ReportMTA write Set_ReportMTA;
    property ReportType: Integer read Get_ReportType write Set_ReportType;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoTools provides a Create and CreateRemote method to          
// create instances of the default interface ITools exposed by              
// the CoClass Tools. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoTools = class
    class function Create: ITools;
    class function CreateRemote(const MachineName: string): ITools;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TTools
// Help String      : Tools Class
// Default Interface: ITools
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TToolsProperties= class;
{$ENDIF}
  TTools = class(TOleServer)
  private
    FIntf:        ITools;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TToolsProperties;
    function      GetServerProperties: TToolsProperties;
{$ENDIF}
    function      GetDefaultInterface: ITools;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ITools);
    procedure Disconnect; override;
    function VarToBSTR(Var_: OleVariant; CodePage: Integer): WideString;
    procedure CreateFolder(const FolderName: WideString);
    function ExistFile(const FileOrFolderName: WideString): WordBool;
    procedure RemoveFile(const FileName: WideString);
    procedure RemoveFolder(const FolderName: WideString; Recursive: WordBool);
    function GetFiles(const FolderName: WideString): OleVariant;
    function ReadTextFile(const FileName: WideString; CodePage: Integer): WideString;
    procedure WriteTextFile(const FileName: WideString; const Content: WideString; CodePage: Integer);
    function GenFileName(Index: Integer): WideString;
    function BSTRToVar(const Src: WideString; CodePage: Integer): OleVariant;
    function ReadFileToBase64(const FileName: WideString): WideString;
    function ReadBinaryFile(const FileName: WideString): OleVariant;
    property DefaultInterface: ITools read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TToolsProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TTools
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TToolsProperties = class(TPersistent)
  private
    FServer:    TTools;
    function    GetDefaultInterface: ITools;
    constructor Create(AServer: TTools);
  protected
  public
    property DefaultInterface: ITools read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoUIDLManager provides a Create and CreateRemote method to          
// create instances of the default interface IUIDLManager exposed by              
// the CoClass UIDLManager. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoUIDLManager = class
    class function Create: IUIDLManager;
    class function CreateRemote(const MachineName: string): IUIDLManager;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TUIDLManager
// Help String      : UIDLManager Class
// Default Interface: IUIDLManager
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TUIDLManagerProperties= class;
{$ENDIF}
  TUIDLManager = class(TOleServer)
  private
    FIntf:        IUIDLManager;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TUIDLManagerProperties;
    function      GetServerProperties: TUIDLManagerProperties;
{$ENDIF}
    function      GetDefaultInterface: IUIDLManager;
  protected
    procedure InitServerData; override;
    function Get_Count: Integer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IUIDLManager);
    procedure Disconnect; override;
    procedure Load(const FileName: WideString);
    procedure Update;
    procedure SyncUIDL(const oServer: IMailServer; Infos: OleVariant);
    function AddUIDL(const oServer: IMailServer; const UIDL: WideString; 
                     const LocalFileName: WideString): IUIDLItem;
    procedure RemoveUIDL(const oServer: IMailServer; const UIDL: WideString);
    procedure RemoveUIDLEX(const oItem: IUIDLItem);
    procedure RemoveAt(Index: Integer);
    procedure Clear;
    function Item(Index: Integer): IUIDLItem;
    function FindUIDL(const oServer: IMailServer; const UIDL: WideString): IUIDLItem;
    function FindLocalFile(const FileName: WideString): IUIDLItem;
    property DefaultInterface: IUIDLManager read GetDefaultInterface;
    property Count: Integer read Get_Count;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TUIDLManagerProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TUIDLManager
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TUIDLManagerProperties = class(TPersistent)
  private
    FServer:    TUIDLManager;
    function    GetDefaultInterface: IUIDLManager;
    constructor Create(AServer: TUIDLManager);
  protected
    function Get_Count: Integer;
  public
    property DefaultInterface: IUIDLManager read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoUIDLItem provides a Create and CreateRemote method to          
// create instances of the default interface IUIDLItem exposed by              
// the CoClass UIDLItem. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoUIDLItem = class
    class function Create: IUIDLItem;
    class function CreateRemote(const MachineName: string): IUIDLItem;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TUIDLItem
// Help String      : UIDLItem Class
// Default Interface: IUIDLItem
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TUIDLItemProperties= class;
{$ENDIF}
  TUIDLItem = class(TOleServer)
  private
    FIntf:        IUIDLItem;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TUIDLItemProperties;
    function      GetServerProperties: TUIDLItemProperties;
{$ENDIF}
    function      GetDefaultInterface: IUIDLItem;
  protected
    procedure InitServerData; override;
    function Get_UIDL: WideString;
    procedure Set_UIDL(const pVal: WideString);
    function Get_ServerUser: WideString;
    procedure Set_ServerUser(const pVal: WideString);
    function Get_FileName: WideString;
    procedure Set_FileName(const pVal: WideString);
    function Get_DownloadTime: TDateTime;
    procedure Set_DownloadTime(pVal: TDateTime);
    function Get_Flags: Integer;
    procedure Set_Flags(pVal: Integer);
    function Get_Index: Integer;
    procedure Set_Index(pVal: Integer);
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IUIDLItem);
    procedure Disconnect; override;
    property DefaultInterface: IUIDLItem read GetDefaultInterface;
    property UIDL: WideString read Get_UIDL write Set_UIDL;
    property ServerUser: WideString read Get_ServerUser write Set_ServerUser;
    property FileName: WideString read Get_FileName write Set_FileName;
    property DownloadTime: TDateTime read Get_DownloadTime write Set_DownloadTime;
    property Flags: Integer read Get_Flags write Set_Flags;
    property Index: Integer read Get_Index write Set_Index;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TUIDLItemProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TUIDLItem
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TUIDLItemProperties = class(TPersistent)
  private
    FServer:    TUIDLItem;
    function    GetDefaultInterface: IUIDLItem;
    constructor Create(AServer: TUIDLItem);
  protected
    function Get_UIDL: WideString;
    procedure Set_UIDL(const pVal: WideString);
    function Get_ServerUser: WideString;
    procedure Set_ServerUser(const pVal: WideString);
    function Get_FileName: WideString;
    procedure Set_FileName(const pVal: WideString);
    function Get_DownloadTime: TDateTime;
    procedure Set_DownloadTime(pVal: TDateTime);
    function Get_Flags: Integer;
    procedure Set_Flags(pVal: Integer);
    function Get_Index: Integer;
    procedure Set_Index(pVal: Integer);
  public
    property DefaultInterface: IUIDLItem read GetDefaultInterface;
  published
    property UIDL: WideString read Get_UIDL write Set_UIDL;
    property ServerUser: WideString read Get_ServerUser write Set_ServerUser;
    property FileName: WideString read Get_FileName write Set_FileName;
    property DownloadTime: TDateTime read Get_DownloadTime write Set_DownloadTime;
    property Flags: Integer read Get_Flags write Set_Flags;
    property Index: Integer read Get_Index write Set_Index;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoGetMailInfosParamType provides a Create and CreateRemote method to          
// create instances of the default interface IGetMailInfosParamType exposed by              
// the CoClass GetMailInfosParamType. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoGetMailInfosParamType = class
    class function Create: IGetMailInfosParamType;
    class function CreateRemote(const MachineName: string): IGetMailInfosParamType;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TGetMailInfosParamType
// Help String      : GetMailInfosParamType Class
// Default Interface: IGetMailInfosParamType
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TGetMailInfosParamTypeProperties= class;
{$ENDIF}
  TGetMailInfosParamType = class(TOleServer)
  private
    FIntf:        IGetMailInfosParamType;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TGetMailInfosParamTypeProperties;
    function      GetServerProperties: TGetMailInfosParamTypeProperties;
{$ENDIF}
    function      GetDefaultInterface: IGetMailInfosParamType;
  protected
    procedure InitServerData; override;
    function Get_GetMailInfosOptions: Integer;
    procedure Set_GetMailInfosOptions(pVal: Integer);
    function Get_SeqRange: WideString;
    procedure Set_SeqRange(const pVal: WideString);
    function Get_UIDRange: WideString;
    procedure Set_UIDRange(const pVal: WideString);
    function Get_SubjectContains: WideString;
    procedure Set_SubjectContains(const pVal: WideString);
    function Get_SenderContains: WideString;
    procedure Set_SenderContains(const pVal: WideString);
    function Get_ValueChanged: WordBool;
    procedure Set_ValueChanged(pVal: WordBool);
    function Get_DateRangeSINCE: TDateTime;
    procedure Set_DateRangeSINCE(pVal: TDateTime);
    function Get_DateRangeBEFORE: TDateTime;
    procedure Set_DateRangeBEFORE(pVal: TDateTime);
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IGetMailInfosParamType);
    procedure Disconnect; override;
    property DefaultInterface: IGetMailInfosParamType read GetDefaultInterface;
    property GetMailInfosOptions: Integer read Get_GetMailInfosOptions write Set_GetMailInfosOptions;
    property SeqRange: WideString read Get_SeqRange write Set_SeqRange;
    property UIDRange: WideString read Get_UIDRange write Set_UIDRange;
    property SubjectContains: WideString read Get_SubjectContains write Set_SubjectContains;
    property SenderContains: WideString read Get_SenderContains write Set_SenderContains;
    property ValueChanged: WordBool read Get_ValueChanged write Set_ValueChanged;
    property DateRangeSINCE: TDateTime read Get_DateRangeSINCE write Set_DateRangeSINCE;
    property DateRangeBEFORE: TDateTime read Get_DateRangeBEFORE write Set_DateRangeBEFORE;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TGetMailInfosParamTypeProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TGetMailInfosParamType
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TGetMailInfosParamTypeProperties = class(TPersistent)
  private
    FServer:    TGetMailInfosParamType;
    function    GetDefaultInterface: IGetMailInfosParamType;
    constructor Create(AServer: TGetMailInfosParamType);
  protected
    function Get_GetMailInfosOptions: Integer;
    procedure Set_GetMailInfosOptions(pVal: Integer);
    function Get_SeqRange: WideString;
    procedure Set_SeqRange(const pVal: WideString);
    function Get_UIDRange: WideString;
    procedure Set_UIDRange(const pVal: WideString);
    function Get_SubjectContains: WideString;
    procedure Set_SubjectContains(const pVal: WideString);
    function Get_SenderContains: WideString;
    procedure Set_SenderContains(const pVal: WideString);
    function Get_ValueChanged: WordBool;
    procedure Set_ValueChanged(pVal: WordBool);
    function Get_DateRangeSINCE: TDateTime;
    procedure Set_DateRangeSINCE(pVal: TDateTime);
    function Get_DateRangeBEFORE: TDateTime;
    procedure Set_DateRangeBEFORE(pVal: TDateTime);
  public
    property DefaultInterface: IGetMailInfosParamType read GetDefaultInterface;
  published
    property GetMailInfosOptions: Integer read Get_GetMailInfosOptions write Set_GetMailInfosOptions;
    property SeqRange: WideString read Get_SeqRange write Set_SeqRange;
    property UIDRange: WideString read Get_UIDRange write Set_UIDRange;
    property SubjectContains: WideString read Get_SubjectContains write Set_SubjectContains;
    property SenderContains: WideString read Get_SenderContains write Set_SenderContains;
    property ValueChanged: WordBool read Get_ValueChanged write Set_ValueChanged;
    property DateRangeSINCE: TDateTime read Get_DateRangeSINCE write Set_DateRangeSINCE;
    property DateRangeBEFORE: TDateTime read Get_DateRangeBEFORE write Set_DateRangeBEFORE;
  end;
{$ENDIF}


procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

class function CoMailClient.Create: IMailClient;
begin
  Result := CreateComObject(CLASS_MailClient) as IMailClient;
end;

class function CoMailClient.CreateRemote(const MachineName: string): IMailClient;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_MailClient) as IMailClient;
end;

procedure TMailClient.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{953EFD7C-8FCE-4D9C-9BD9-E6F19A1B7FC9}';
    IntfIID:   '{F7463672-BDA9-428F-8A03-E30C0F1B7EA8}';
    EventIID:  '{F9C5042F-13E4-42B7-8160-F511C74A9904}';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TMailClient.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    ConnectEvents(punk);
    Fintf:= punk as IMailClient;
  end;
end;

procedure TMailClient.ConnectTo(svrIntf: IMailClient);
begin
  Disconnect;
  FIntf := svrIntf;
  ConnectEvents(FIntf);
end;

procedure TMailClient.DisConnect;
begin
  if Fintf <> nil then
  begin
    DisconnectEvents(FIntf);
    if FAutoQuit then
      Quit();
    FIntf := nil;
  end;
end;

function TMailClient.GetDefaultInterface: IMailClient;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TMailClient.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TMailClientProperties.Create(Self);
{$ENDIF}
end;

destructor TMailClient.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TMailClient.GetServerProperties: TMailClientProperties;
begin
  Result := FProps;
end;
{$ENDIF}

procedure TMailClient.InvokeEvent(DispID: TDispID; var Params: TVariantArray);
begin
  case DispID of
    -1: Exit;  // DISPID_UNKNOWN
    1: if Assigned(FOnIdle) then
         FOnIdle(Self,
                 Params[0] {const IDispatch},
                 WordBool((TVarData(Params[1]).VPointer)^) {var WordBool});
    2: if Assigned(FOnConnected) then
         FOnConnected(Self,
                      Params[0] {const IDispatch},
                      WordBool((TVarData(Params[1]).VPointer)^) {var WordBool});
    3: if Assigned(FOnQuit) then
         FOnQuit(Self,
                 Params[0] {const IDispatch},
                 WordBool((TVarData(Params[1]).VPointer)^) {var WordBool});
    4: if Assigned(FOnSendCommand) then
         FOnSendCommand(Self,
                        Params[0] {const IDispatch},
                        Params[1] {OleVariant},
                        Params[2] {WordBool},
                        WordBool((TVarData(Params[3]).VPointer)^) {var WordBool});
    5: if Assigned(FOnReceiveResponse) then
         FOnReceiveResponse(Self,
                            Params[0] {const IDispatch},
                            Params[1] {OleVariant},
                            Params[2] {WordBool},
                            WordBool((TVarData(Params[3]).VPointer)^) {var WordBool});
    6: if Assigned(FOnSecuring) then
         FOnSecuring(Self,
                     Params[0] {const IDispatch},
                     WordBool((TVarData(Params[1]).VPointer)^) {var WordBool});
    7: if Assigned(FOnAuthorized) then
         FOnAuthorized(Self,
                       Params[0] {const IDispatch},
                       WordBool((TVarData(Params[1]).VPointer)^) {var WordBool});
    8: if Assigned(FOnSendingDataStream) then
         FOnSendingDataStream(Self,
                              Params[0] {const IDispatch},
                              Params[1] {Integer},
                              Params[2] {Integer},
                              WordBool((TVarData(Params[3]).VPointer)^) {var WordBool});
    9: if Assigned(FOnReceivingDataStream) then
         FOnReceivingDataStream(Self,
                                Params[0] {const IDispatch},
                                Params[1] {const IDispatch},
                                Params[2] {Integer},
                                Params[3] {Integer},
                                WordBool((TVarData(Params[4]).VPointer)^) {var WordBool});
  end; {case DispID}
end;

function TMailClient.Get_Connected: WordBool;
begin
    Result := DefaultInterface.Connected;
end;

function TMailClient.Get_Conversation: WideString;
begin
    Result := DefaultInterface.Conversation;
end;

function TMailClient.Get_CRLFAfterAppendCommand: WordBool;
begin
    Result := DefaultInterface.CRLFAfterAppendCommand;
end;

procedure TMailClient.Set_CRLFAfterAppendCommand(pVal: WordBool);
begin
  DefaultInterface.Set_CRLFAfterAppendCommand(pVal);
end;

function TMailClient.Get_CurrentMailServer: IMailServer;
begin
    Result := DefaultInterface.CurrentMailServer;
end;

function TMailClient.Get_Imap4Folders: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Imap4Folders;
end;

function TMailClient.Get_LogFileName: WideString;
begin
    Result := DefaultInterface.LogFileName;
end;

procedure TMailClient.Set_LogFileName(const pVal: WideString);
  { Warning: The property LogFileName has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.LogFileName := pVal;
end;

function TMailClient.Get_PreviousCommand: WideString;
begin
    Result := DefaultInterface.PreviousCommand;
end;

function TMailClient.Get_SelectedFolder: WideString;
begin
    Result := DefaultInterface.SelectedFolder;
end;

function TMailClient.Get_Tag: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Tag;
end;

procedure TMailClient.Set_Tag(pVal: OleVariant);
begin
  DefaultInterface.Set_Tag(pVal);
end;

function TMailClient.Get_Timeout: Integer;
begin
    Result := DefaultInterface.Timeout;
end;

procedure TMailClient.Set_Timeout(pVal: Integer);
begin
  DefaultInterface.Set_Timeout(pVal);
end;

function TMailClient.Get_LicenseCode: WideString;
begin
    Result := DefaultInterface.LicenseCode;
end;

procedure TMailClient.Set_LicenseCode(const pVal: WideString);
  { Warning: The property LicenseCode has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.LicenseCode := pVal;
end;

function TMailClient.Get_RemoveDoubleDot: WordBool;
begin
    Result := DefaultInterface.RemoveDoubleDot;
end;

procedure TMailClient.Set_RemoveDoubleDot(pVal: WordBool);
begin
  DefaultInterface.Set_RemoveDoubleDot(pVal);
end;

function TMailClient.Get_LastErrorDescription: WideString;
begin
    Result := DefaultInterface.LastErrorDescription;
end;

procedure TMailClient.Set_LastErrorDescription(const pVal: WideString);
  { Warning: The property LastErrorDescription has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.LastErrorDescription := pVal;
end;

function TMailClient.Get_GetMailInfosParam: IGetMailInfosParamType;
begin
    Result := DefaultInterface.GetMailInfosParam;
end;

procedure TMailClient.Append(const oFolder: IImap4Folder; data: OleVariant);
begin
  DefaultInterface.Append(oFolder, data);
end;

procedure TMailClient.AppendEx(const oFolder: IImap4Folder; data: OleVariant; 
                               const Flags: WideString; MailDateTime: TDateTime);
begin
  DefaultInterface.AppendEx(oFolder, data, Flags, MailDateTime);
end;

procedure TMailClient.ChangeMailFlags(const oInfo: IMailInfo; const Flags: WideString);
begin
  DefaultInterface.ChangeMailFlags(oInfo, Flags);
end;

procedure TMailClient.Close;
begin
  DefaultInterface.Close;
end;

procedure TMailClient.Connect1(const oServer: IMailServer);
begin
  DefaultInterface.Connect(oServer);
end;

procedure TMailClient.Copy(const oInfo: IMailInfo; const oFolder: IImap4Folder);
begin
  DefaultInterface.Copy(oInfo, oFolder);
end;

function TMailClient.CreateFolder(const RootFolder: IImap4Folder; const FolderName: WideString): IImap4Folder;
begin
  Result := DefaultInterface.CreateFolder(RootFolder, FolderName);
end;

procedure TMailClient.Delete(const oInfo: IMailInfo);
begin
  DefaultInterface.Delete(oInfo);
end;

procedure TMailClient.DeleteFolder(const oFolder: IImap4Folder);
begin
  DefaultInterface.DeleteFolder(oFolder);
end;

procedure TMailClient.Expunge;
begin
  DefaultInterface.Expunge;
end;

function TMailClient.GetMail(const oInfo: IMailInfo): IMail;
begin
  Result := DefaultInterface.GetMail(oInfo);
end;

function TMailClient.GetMailHeader(const oInfo: IMailInfo): OleVariant;
begin
  Result := DefaultInterface.GetMailHeader(oInfo);
end;

function TMailClient.GetMailInfos: OleVariant;
begin
  Result := DefaultInterface.GetMailInfos;
end;

procedure TMailClient.Logout;
begin
  DefaultInterface.Logout;
end;

procedure TMailClient.Quit;
begin
  DefaultInterface.Quit;
end;

procedure TMailClient.ReConnect;
begin
  DefaultInterface.ReConnect;
end;

procedure TMailClient.Reset;
begin
  DefaultInterface.Reset;
end;

function TMailClient.SearchMail(const Condition: WideString): OleVariant;
begin
  Result := DefaultInterface.SearchMail(Condition);
end;

procedure TMailClient.SelectFolder(const oFolder: IImap4Folder);
begin
  DefaultInterface.SelectFolder(oFolder);
end;

procedure TMailClient.SubscribeFolder(const oFolder: IImap4Folder);
begin
  DefaultInterface.SubscribeFolder(oFolder);
end;

procedure TMailClient.UnsubscribeFolder(const oFolder: IImap4Folder);
begin
  DefaultInterface.UnsubscribeFolder(oFolder);
end;

procedure TMailClient.WriteLog(const v: WideString);
begin
  DefaultInterface.WriteLog(v);
end;

procedure TMailClient.GetMailsByQueue(const oServer: IMailServer; const DownloadFolder: WideString; 
                                      LeaveCopy: WordBool);
begin
  DefaultInterface.GetMailsByQueue(oServer, DownloadFolder, LeaveCopy);
end;

procedure TMailClient.RenameFolder(const oFolder: IImap4Folder; const NewName: WideString);
begin
  DefaultInterface.RenameFolder(oFolder, NewName);
end;

procedure TMailClient.MarkAsRead(const oInfo: IMailInfo; Read: WordBool);
begin
  DefaultInterface.MarkAsRead(oInfo, Read);
end;

procedure TMailClient.RefreshMailInfos;
begin
  DefaultInterface.RefreshMailInfos;
end;

procedure TMailClient.RefreshFolders;
begin
  DefaultInterface.RefreshFolders;
end;

procedure TMailClient.Move(const oInfo: IMailInfo; const oFolder: IImap4Folder);
begin
  DefaultInterface.Move(oInfo, oFolder);
end;

procedure TMailClient.Undelete(const oInfo: IMailInfo);
begin
  DefaultInterface.Undelete(oInfo);
end;

function TMailClient.QueryEWSPublicFolders: OleVariant;
begin
  Result := DefaultInterface.QueryEWSPublicFolders;
end;

procedure TMailClient.NOOP;
begin
  DefaultInterface.NOOP;
end;

function TMailClient.WaitNewEmail(WaitTimeout: Integer): WordBool;
begin
  Result := DefaultInterface.WaitNewEmail(WaitTimeout);
end;

procedure TMailClient.CancelWaitEmail;
begin
  DefaultInterface.CancelWaitEmail;
end;

function TMailClient.GetMailCount: Integer;
begin
  Result := DefaultInterface.GetMailCount;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TMailClientProperties.Create(AServer: TMailClient);
begin
  inherited Create;
  FServer := AServer;
end;

function TMailClientProperties.GetDefaultInterface: IMailClient;
begin
  Result := FServer.DefaultInterface;
end;

function TMailClientProperties.Get_Connected: WordBool;
begin
    Result := DefaultInterface.Connected;
end;

function TMailClientProperties.Get_Conversation: WideString;
begin
    Result := DefaultInterface.Conversation;
end;

function TMailClientProperties.Get_CRLFAfterAppendCommand: WordBool;
begin
    Result := DefaultInterface.CRLFAfterAppendCommand;
end;

procedure TMailClientProperties.Set_CRLFAfterAppendCommand(pVal: WordBool);
begin
  DefaultInterface.Set_CRLFAfterAppendCommand(pVal);
end;

function TMailClientProperties.Get_CurrentMailServer: IMailServer;
begin
    Result := DefaultInterface.CurrentMailServer;
end;

function TMailClientProperties.Get_Imap4Folders: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Imap4Folders;
end;

function TMailClientProperties.Get_LogFileName: WideString;
begin
    Result := DefaultInterface.LogFileName;
end;

procedure TMailClientProperties.Set_LogFileName(const pVal: WideString);
  { Warning: The property LogFileName has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.LogFileName := pVal;
end;

function TMailClientProperties.Get_PreviousCommand: WideString;
begin
    Result := DefaultInterface.PreviousCommand;
end;

function TMailClientProperties.Get_SelectedFolder: WideString;
begin
    Result := DefaultInterface.SelectedFolder;
end;

function TMailClientProperties.Get_Tag: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Tag;
end;

procedure TMailClientProperties.Set_Tag(pVal: OleVariant);
begin
  DefaultInterface.Set_Tag(pVal);
end;

function TMailClientProperties.Get_Timeout: Integer;
begin
    Result := DefaultInterface.Timeout;
end;

procedure TMailClientProperties.Set_Timeout(pVal: Integer);
begin
  DefaultInterface.Set_Timeout(pVal);
end;

function TMailClientProperties.Get_LicenseCode: WideString;
begin
    Result := DefaultInterface.LicenseCode;
end;

procedure TMailClientProperties.Set_LicenseCode(const pVal: WideString);
  { Warning: The property LicenseCode has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.LicenseCode := pVal;
end;

function TMailClientProperties.Get_RemoveDoubleDot: WordBool;
begin
    Result := DefaultInterface.RemoveDoubleDot;
end;

procedure TMailClientProperties.Set_RemoveDoubleDot(pVal: WordBool);
begin
  DefaultInterface.Set_RemoveDoubleDot(pVal);
end;

function TMailClientProperties.Get_LastErrorDescription: WideString;
begin
    Result := DefaultInterface.LastErrorDescription;
end;

procedure TMailClientProperties.Set_LastErrorDescription(const pVal: WideString);
  { Warning: The property LastErrorDescription has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.LastErrorDescription := pVal;
end;

function TMailClientProperties.Get_GetMailInfosParam: IGetMailInfosParamType;
begin
    Result := DefaultInterface.GetMailInfosParam;
end;

{$ENDIF}

class function CoAttachment.Create: IAttachment;
begin
  Result := CreateComObject(CLASS_Attachment) as IAttachment;
end;

class function CoAttachment.CreateRemote(const MachineName: string): IAttachment;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Attachment) as IAttachment;
end;

procedure TAttachment.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{AD59203B-0C25-4192-98F2-C680D6A16738}';
    IntfIID:   '{D531D50D-CDC6-400A-B938-46D36382173E}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TAttachment.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IAttachment;
  end;
end;

procedure TAttachment.ConnectTo(svrIntf: IAttachment);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TAttachment.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TAttachment.GetDefaultInterface: IAttachment;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TAttachment.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TAttachmentProperties.Create(Self);
{$ENDIF}
end;

destructor TAttachment.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TAttachment.GetServerProperties: TAttachmentProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TAttachment.Get_Headers: IHeaderCollection;
begin
    Result := DefaultInterface.Headers;
end;

function TAttachment.Get_Charset: WideString;
begin
    Result := DefaultInterface.Charset;
end;

function TAttachment.Get_Content: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Content;
end;

function TAttachment.Get_ContentID: WideString;
begin
    Result := DefaultInterface.ContentID;
end;

function TAttachment.Get_ContentType: WideString;
begin
    Result := DefaultInterface.ContentType;
end;

function TAttachment.Get_EncodedContent: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.EncodedContent;
end;

function TAttachment.Get_Name: WideString;
begin
    Result := DefaultInterface.Name;
end;

function TAttachment.Get_EncodedContentLen: Integer;
begin
    Result := DefaultInterface.EncodedContentLen;
end;

function TAttachment.Get_RemoveDoubleDot: WordBool;
begin
    Result := DefaultInterface.RemoveDoubleDot;
end;

procedure TAttachment.Set_RemoveDoubleDot(pVal: WordBool);
begin
  DefaultInterface.Set_RemoveDoubleDot(pVal);
end;

procedure TAttachment.SaveAs(const FileName: WideString; Overwrite: WordBool);
begin
  DefaultInterface.SaveAs(FileName, Overwrite);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TAttachmentProperties.Create(AServer: TAttachment);
begin
  inherited Create;
  FServer := AServer;
end;

function TAttachmentProperties.GetDefaultInterface: IAttachment;
begin
  Result := FServer.DefaultInterface;
end;

function TAttachmentProperties.Get_Headers: IHeaderCollection;
begin
    Result := DefaultInterface.Headers;
end;

function TAttachmentProperties.Get_Charset: WideString;
begin
    Result := DefaultInterface.Charset;
end;

function TAttachmentProperties.Get_Content: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Content;
end;

function TAttachmentProperties.Get_ContentID: WideString;
begin
    Result := DefaultInterface.ContentID;
end;

function TAttachmentProperties.Get_ContentType: WideString;
begin
    Result := DefaultInterface.ContentType;
end;

function TAttachmentProperties.Get_EncodedContent: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.EncodedContent;
end;

function TAttachmentProperties.Get_Name: WideString;
begin
    Result := DefaultInterface.Name;
end;

function TAttachmentProperties.Get_EncodedContentLen: Integer;
begin
    Result := DefaultInterface.EncodedContentLen;
end;

function TAttachmentProperties.Get_RemoveDoubleDot: WordBool;
begin
    Result := DefaultInterface.RemoveDoubleDot;
end;

procedure TAttachmentProperties.Set_RemoveDoubleDot(pVal: WordBool);
begin
  DefaultInterface.Set_RemoveDoubleDot(pVal);
end;

{$ENDIF}

class function CoCertificate.Create: ICertificate;
begin
  Result := CreateComObject(CLASS_Certificate) as ICertificate;
end;

class function CoCertificate.CreateRemote(const MachineName: string): ICertificate;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Certificate) as ICertificate;
end;

procedure TCertificate.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{76BB6AA2-49D5-4452-97A0-C5F7B8910D12}';
    IntfIID:   '{98790582-CE44-47C9-8F70-90DCFEAF46AC}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TCertificate.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as ICertificate;
  end;
end;

procedure TCertificate.ConnectTo(svrIntf: ICertificate);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TCertificate.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TCertificate.GetDefaultInterface: ICertificate;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TCertificate.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TCertificateProperties.Create(Self);
{$ENDIF}
end;

destructor TCertificate.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TCertificate.GetServerProperties: TCertificateProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TCertificate.Get_HasCertificate: WordBool;
begin
    Result := DefaultInterface.HasCertificate;
end;

procedure TCertificate.AddToStore(StoreLocation: Integer; const StoreName: WideString);
begin
  DefaultInterface.AddToStore(StoreLocation, StoreName);
end;

procedure TCertificate.FindSubject(const FindKey: WideString; StoreLocation: Integer; 
                                   const StoreName: WideString);
begin
  DefaultInterface.FindSubject(FindKey, StoreLocation, StoreName);
end;

procedure TCertificate.Load(PFXContent: OleVariant; const Password: WideString; KeyLocation: Integer);
begin
  DefaultInterface.Load(PFXContent, Password, KeyLocation);
end;

procedure TCertificate.LoadFromFile(const PFXFile: WideString; const Password: WideString; 
                                    KeyLocation: Integer);
begin
  DefaultInterface.LoadFromFile(PFXFile, Password, KeyLocation);
end;

procedure TCertificate.Unload;
begin
  DefaultInterface.Unload;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TCertificateProperties.Create(AServer: TCertificate);
begin
  inherited Create;
  FServer := AServer;
end;

function TCertificateProperties.GetDefaultInterface: ICertificate;
begin
  Result := FServer.DefaultInterface;
end;

function TCertificateProperties.Get_HasCertificate: WordBool;
begin
    Result := DefaultInterface.HasCertificate;
end;

{$ENDIF}

class function CoHeaderCollection.Create: IHeaderCollection;
begin
  Result := CreateComObject(CLASS_HeaderCollection) as IHeaderCollection;
end;

class function CoHeaderCollection.CreateRemote(const MachineName: string): IHeaderCollection;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_HeaderCollection) as IHeaderCollection;
end;

procedure THeaderCollection.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{3F46EBC3-9D7F-4F73-B779-F2FC6C0B6EE7}';
    IntfIID:   '{00AC14C1-BCB6-48AF-BEBF-C1F41BA7CF07}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure THeaderCollection.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IHeaderCollection;
  end;
end;

procedure THeaderCollection.ConnectTo(svrIntf: IHeaderCollection);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure THeaderCollection.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function THeaderCollection.GetDefaultInterface: IHeaderCollection;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor THeaderCollection.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := THeaderCollectionProperties.Create(Self);
{$ENDIF}
end;

destructor THeaderCollection.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function THeaderCollection.GetServerProperties: THeaderCollectionProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function THeaderCollection.Get_Count: Integer;
begin
    Result := DefaultInterface.Count;
end;

function THeaderCollection.Item(Index: Integer): IHeaderItem;
begin
  Result := DefaultInterface.Item(Index);
end;

function THeaderCollection.GetValueOfKey(const HeaderKey: WideString): WideString;
begin
  Result := DefaultInterface.GetValueOfKey(HeaderKey);
end;

procedure THeaderCollection.Add(const oHeader: IHeaderItem);
begin
  DefaultInterface.Add(oHeader);
end;

procedure THeaderCollection.Insert(Index: Integer; const oHeader: IHeaderItem);
begin
  DefaultInterface.Insert(Index, oHeader);
end;

function THeaderCollection.SearchKey(const HeaderKey: WideString): Integer;
begin
  Result := DefaultInterface.SearchKey(HeaderKey);
end;

procedure THeaderCollection.Clear;
begin
  DefaultInterface.Clear;
end;

procedure THeaderCollection.Remove(const HeaderKey: WideString);
begin
  DefaultInterface.Remove(HeaderKey);
end;

procedure THeaderCollection.RemoveAt(Index: Integer);
begin
  DefaultInterface.RemoveAt(Index);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor THeaderCollectionProperties.Create(AServer: THeaderCollection);
begin
  inherited Create;
  FServer := AServer;
end;

function THeaderCollectionProperties.GetDefaultInterface: IHeaderCollection;
begin
  Result := FServer.DefaultInterface;
end;

function THeaderCollectionProperties.Get_Count: Integer;
begin
    Result := DefaultInterface.Count;
end;

{$ENDIF}

class function CoHeaderItem.Create: IHeaderItem;
begin
  Result := CreateComObject(CLASS_HeaderItem) as IHeaderItem;
end;

class function CoHeaderItem.CreateRemote(const MachineName: string): IHeaderItem;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_HeaderItem) as IHeaderItem;
end;

procedure THeaderItem.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{206AF1CC-DF89-4E4E-96EB-40D7641FACFD}';
    IntfIID:   '{EF9B19FF-8766-4931-8A3A-405A91475645}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure THeaderItem.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IHeaderItem;
  end;
end;

procedure THeaderItem.ConnectTo(svrIntf: IHeaderItem);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure THeaderItem.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function THeaderItem.GetDefaultInterface: IHeaderItem;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor THeaderItem.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := THeaderItemProperties.Create(Self);
{$ENDIF}
end;

destructor THeaderItem.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function THeaderItem.GetServerProperties: THeaderItemProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function THeaderItem.Get_HeaderKey: WideString;
begin
    Result := DefaultInterface.HeaderKey;
end;

procedure THeaderItem.Set_HeaderKey(const pVal: WideString);
  { Warning: The property HeaderKey has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.HeaderKey := pVal;
end;

function THeaderItem.Get_HeaderValue: WideString;
begin
    Result := DefaultInterface.HeaderValue;
end;

procedure THeaderItem.Set_HeaderValue(const pVal: WideString);
  { Warning: The property HeaderValue has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.HeaderValue := pVal;
end;

function THeaderItem.Get_DecodedValue: WideString;
begin
    Result := DefaultInterface.DecodedValue;
end;

function THeaderItem.SubValue(const SubKey: WideString): WideString;
begin
  Result := DefaultInterface.SubValue(SubKey);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor THeaderItemProperties.Create(AServer: THeaderItem);
begin
  inherited Create;
  FServer := AServer;
end;

function THeaderItemProperties.GetDefaultInterface: IHeaderItem;
begin
  Result := FServer.DefaultInterface;
end;

function THeaderItemProperties.Get_HeaderKey: WideString;
begin
    Result := DefaultInterface.HeaderKey;
end;

procedure THeaderItemProperties.Set_HeaderKey(const pVal: WideString);
  { Warning: The property HeaderKey has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.HeaderKey := pVal;
end;

function THeaderItemProperties.Get_HeaderValue: WideString;
begin
    Result := DefaultInterface.HeaderValue;
end;

procedure THeaderItemProperties.Set_HeaderValue(const pVal: WideString);
  { Warning: The property HeaderValue has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.HeaderValue := pVal;
end;

function THeaderItemProperties.Get_DecodedValue: WideString;
begin
    Result := DefaultInterface.DecodedValue;
end;

{$ENDIF}

class function CoImap4Folder.Create: IImap4Folder;
begin
  Result := CreateComObject(CLASS_Imap4Folder) as IImap4Folder;
end;

class function CoImap4Folder.CreateRemote(const MachineName: string): IImap4Folder;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Imap4Folder) as IImap4Folder;
end;

procedure TImap4Folder.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{C06966A4-9F1D-497F-84B9-9204F31994A3}';
    IntfIID:   '{860EA4DE-9B7D-4C1B-8DC0-67B74B981F41}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TImap4Folder.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IImap4Folder;
  end;
end;

procedure TImap4Folder.ConnectTo(svrIntf: IImap4Folder);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TImap4Folder.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TImap4Folder.GetDefaultInterface: IImap4Folder;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TImap4Folder.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TImap4FolderProperties.Create(Self);
{$ENDIF}
end;

destructor TImap4Folder.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TImap4Folder.GetServerProperties: TImap4FolderProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TImap4Folder.Get_FullPath: WideString;
begin
    Result := DefaultInterface.FullPath;
end;

procedure TImap4Folder.Set_FullPath(const pVal: WideString);
  { Warning: The property FullPath has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.FullPath := pVal;
end;

function TImap4Folder.Get_IMAP4FolderFlags: WideString;
begin
    Result := DefaultInterface.IMAP4FolderFlags;
end;

procedure TImap4Folder.Set_IMAP4FolderFlags(const pVal: WideString);
  { Warning: The property IMAP4FolderFlags has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.IMAP4FolderFlags := pVal;
end;

function TImap4Folder.Get_LocalPath: WideString;
begin
    Result := DefaultInterface.LocalPath;
end;

procedure TImap4Folder.Set_LocalPath(const pVal: WideString);
  { Warning: The property LocalPath has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.LocalPath := pVal;
end;

function TImap4Folder.Get_Name: WideString;
begin
    Result := DefaultInterface.Name;
end;

procedure TImap4Folder.Set_Name(const pVal: WideString);
  { Warning: The property Name has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Name := pVal;
end;

function TImap4Folder.Get_Subscribed: WordBool;
begin
    Result := DefaultInterface.Subscribed;
end;

procedure TImap4Folder.Set_Subscribed(pVal: WordBool);
begin
  DefaultInterface.Set_Subscribed(pVal);
end;

function TImap4Folder.Get_ServerPath: WideString;
begin
    Result := DefaultInterface.ServerPath;
end;

procedure TImap4Folder.Set_ServerPath(const pVal: WideString);
  { Warning: The property ServerPath has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.ServerPath := pVal;
end;

function TImap4Folder.Get_SubFolders: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.SubFolders;
end;

function TImap4Folder.Get_NoSelect: WordBool;
begin
    Result := DefaultInterface.NoSelect;
end;

procedure TImap4Folder.Set_NoSelect(pVal: WordBool);
begin
  DefaultInterface.Set_NoSelect(pVal);
end;

function TImap4Folder.Get_ChangeKey: WideString;
begin
    Result := DefaultInterface.ChangeKey;
end;

procedure TImap4Folder.Set_ChangeKey(const pVal: WideString);
  { Warning: The property ChangeKey has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.ChangeKey := pVal;
end;

function TImap4Folder.Get_UID: WideString;
begin
    Result := DefaultInterface.UID;
end;

procedure TImap4Folder.Set_UID(const pVal: WideString);
  { Warning: The property UID has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.UID := pVal;
end;

function TImap4Folder.Get_EWSPublicFolder: WordBool;
begin
    Result := DefaultInterface.EWSPublicFolder;
end;

procedure TImap4Folder.Set_EWSPublicFolder(pVal: WordBool);
begin
  DefaultInterface.Set_EWSPublicFolder(pVal);
end;

function TImap4Folder.FindChild(const Name: WideString): IImap4Folder;
begin
  Result := DefaultInterface.FindChild(Name);
end;

function TImap4Folder.Find(Folders: OleVariant; const Name: WideString): IImap4Folder;
begin
  Result := DefaultInterface.Find(Folders, Name);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TImap4FolderProperties.Create(AServer: TImap4Folder);
begin
  inherited Create;
  FServer := AServer;
end;

function TImap4FolderProperties.GetDefaultInterface: IImap4Folder;
begin
  Result := FServer.DefaultInterface;
end;

function TImap4FolderProperties.Get_FullPath: WideString;
begin
    Result := DefaultInterface.FullPath;
end;

procedure TImap4FolderProperties.Set_FullPath(const pVal: WideString);
  { Warning: The property FullPath has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.FullPath := pVal;
end;

function TImap4FolderProperties.Get_IMAP4FolderFlags: WideString;
begin
    Result := DefaultInterface.IMAP4FolderFlags;
end;

procedure TImap4FolderProperties.Set_IMAP4FolderFlags(const pVal: WideString);
  { Warning: The property IMAP4FolderFlags has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.IMAP4FolderFlags := pVal;
end;

function TImap4FolderProperties.Get_LocalPath: WideString;
begin
    Result := DefaultInterface.LocalPath;
end;

procedure TImap4FolderProperties.Set_LocalPath(const pVal: WideString);
  { Warning: The property LocalPath has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.LocalPath := pVal;
end;

function TImap4FolderProperties.Get_Name: WideString;
begin
    Result := DefaultInterface.Name;
end;

procedure TImap4FolderProperties.Set_Name(const pVal: WideString);
  { Warning: The property Name has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Name := pVal;
end;

function TImap4FolderProperties.Get_Subscribed: WordBool;
begin
    Result := DefaultInterface.Subscribed;
end;

procedure TImap4FolderProperties.Set_Subscribed(pVal: WordBool);
begin
  DefaultInterface.Set_Subscribed(pVal);
end;

function TImap4FolderProperties.Get_ServerPath: WideString;
begin
    Result := DefaultInterface.ServerPath;
end;

procedure TImap4FolderProperties.Set_ServerPath(const pVal: WideString);
  { Warning: The property ServerPath has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.ServerPath := pVal;
end;

function TImap4FolderProperties.Get_SubFolders: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.SubFolders;
end;

function TImap4FolderProperties.Get_NoSelect: WordBool;
begin
    Result := DefaultInterface.NoSelect;
end;

procedure TImap4FolderProperties.Set_NoSelect(pVal: WordBool);
begin
  DefaultInterface.Set_NoSelect(pVal);
end;

function TImap4FolderProperties.Get_ChangeKey: WideString;
begin
    Result := DefaultInterface.ChangeKey;
end;

procedure TImap4FolderProperties.Set_ChangeKey(const pVal: WideString);
  { Warning: The property ChangeKey has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.ChangeKey := pVal;
end;

function TImap4FolderProperties.Get_UID: WideString;
begin
    Result := DefaultInterface.UID;
end;

procedure TImap4FolderProperties.Set_UID(const pVal: WideString);
  { Warning: The property UID has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.UID := pVal;
end;

function TImap4FolderProperties.Get_EWSPublicFolder: WordBool;
begin
    Result := DefaultInterface.EWSPublicFolder;
end;

procedure TImap4FolderProperties.Set_EWSPublicFolder(pVal: WordBool);
begin
  DefaultInterface.Set_EWSPublicFolder(pVal);
end;

{$ENDIF}

class function CoMail.Create: IMail;
begin
  Result := CreateComObject(CLASS_Mail) as IMail;
end;

class function CoMail.CreateRemote(const MachineName: string): IMail;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Mail) as IMail;
end;

procedure TMail.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{AE30137E-07C8-403F-8772-07AF79C1DD2E}';
    IntfIID:   '{2F71E6CF-9417-46EB-B7C8-1760FDAC17C6}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TMail.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IMail;
  end;
end;

procedure TMail.ConnectTo(svrIntf: IMail);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TMail.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TMail.GetDefaultInterface: IMail;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TMail.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TMailProperties.Create(Self);
{$ENDIF}
end;

destructor TMail.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TMail.GetServerProperties: TMailProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TMail.Get_Content: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Content;
end;

function TMail.Get_Attachments: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Attachments;
end;

function TMail.Get_BodyHeaders: IHeaderCollection;
begin
    Result := DefaultInterface.BodyHeaders;
end;

function TMail.Get_Cc: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Cc;
end;

function TMail.Get_From: IMailAddress;
begin
    Result := DefaultInterface.From;
end;

function TMail.Get_Headers: IHeaderCollection;
begin
    Result := DefaultInterface.Headers;
end;

function TMail.Get_HtmlBody: WideString;
begin
    Result := DefaultInterface.HtmlBody;
end;

function TMail.Get_IsEncrypted: WordBool;
begin
    Result := DefaultInterface.IsEncrypted;
end;

function TMail.Get_IsReport: WordBool;
begin
    Result := DefaultInterface.IsReport;
end;

function TMail.Get_IsSigned: WordBool;
begin
    Result := DefaultInterface.IsSigned;
end;

function TMail.Get_OriginalBodyFormat: Integer;
begin
    Result := DefaultInterface.OriginalBodyFormat;
end;

function TMail.Get_Priority: Integer;
begin
    Result := DefaultInterface.Priority;
end;

function TMail.Get_ReceivedDate: TDateTime;
begin
    Result := DefaultInterface.ReceivedDate;
end;

function TMail.Get_ReplyTo: IMailAddress;
begin
    Result := DefaultInterface.ReplyTo;
end;

function TMail.Get_SentDate: TDateTime;
begin
    Result := DefaultInterface.SentDate;
end;

function TMail.Get_Subject: WideString;
begin
    Result := DefaultInterface.Subject;
end;

function TMail.Get_Tag: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Tag;
end;

procedure TMail.Set_Tag(pVal: OleVariant);
begin
  DefaultInterface.Set_Tag(pVal);
end;

function TMail.Get_TextBody: WideString;
begin
    Result := DefaultInterface.TextBody;
end;

function TMail.Get_To_: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.To_;
end;

function TMail.Get_Bcc: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Bcc;
end;

function TMail.Get_LicenseCode: WideString;
begin
    Result := DefaultInterface.LicenseCode;
end;

procedure TMail.Set_LicenseCode(const pVal: WideString);
  { Warning: The property LicenseCode has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.LicenseCode := pVal;
end;

function TMail.Get_ToAddr: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.ToAddr;
end;

function TMail.Get_RemoveDoubleDot: WordBool;
begin
    Result := DefaultInterface.RemoveDoubleDot;
end;

procedure TMail.Set_RemoveDoubleDot(pVal: WordBool);
begin
  DefaultInterface.Set_RemoveDoubleDot(pVal);
end;

function TMail.Get_Version: WideString;
begin
    Result := DefaultInterface.Version;
end;

function TMail.Get_HasAlternativeBody: WordBool;
begin
    Result := DefaultInterface.HasAlternativeBody;
end;

procedure TMail.Load(data: OleVariant);
begin
  DefaultInterface.Load(data);
end;

procedure TMail.SaveAs(const FileName: WideString; Overwrite: WordBool);
begin
  DefaultInterface.SaveAs(FileName, Overwrite);
end;

procedure TMail.Clear;
begin
  DefaultInterface.Clear;
end;

function TMail.Decrypt(const Cert: ICertificate): IMail;
begin
  Result := DefaultInterface.Decrypt(Cert);
end;

function TMail.GetReport: IMailReport;
begin
  Result := DefaultInterface.GetReport;
end;

procedure TMail.LoadFile(const FileName: WideString; LateLoadBody: WordBool);
begin
  DefaultInterface.LoadFile(FileName, LateLoadBody);
end;

function TMail.ParseTNEF(data: OleVariant; IncludeRTFBody: WordBool): OleVariant;
begin
  Result := DefaultInterface.ParseTNEF(data, IncludeRTFBody);
end;

procedure TMail.RemoveAttachment(const Att: IAttachment);
begin
  DefaultInterface.RemoveAttachment(Att);
end;

function TMail.VerifySignature: ICertificate;
begin
  Result := DefaultInterface.VerifySignature;
end;

procedure TMail.UpdateHeader;
begin
  DefaultInterface.UpdateHeader;
end;

function TMail.Html2Text(const Html: WideString): WideString;
begin
  Result := DefaultInterface.Html2Text(Html);
end;

function TMail.RTFToHTML(RTFData: OleVariant): WideString;
begin
  Result := DefaultInterface.RTFToHTML(RTFData);
end;

procedure TMail.DecodeTNEF;
begin
  DefaultInterface.DecodeTNEF;
end;

procedure TMail.LoadOMSG(MsgData: OleVariant);
begin
  DefaultInterface.LoadOMSG(MsgData);
end;

function TMail.TNEFToMail(TNEFData: OleVariant): IMail;
begin
  Result := DefaultInterface.TNEFToMail(TNEFData);
end;

procedure TMail.LoadOMSGFile(const FileName: WideString);
begin
  DefaultInterface.LoadOMSGFile(FileName);
end;

procedure TMail.DecodeTNEFEx;
begin
  DefaultInterface.DecodeTNEFEx;
end;

procedure TMail.SaveAsOMSG(const FileName: WideString; Overwrite: WordBool; Unsent: WordBool);
begin
  DefaultInterface.SaveAsOMSG(FileName, Overwrite, Unsent);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TMailProperties.Create(AServer: TMail);
begin
  inherited Create;
  FServer := AServer;
end;

function TMailProperties.GetDefaultInterface: IMail;
begin
  Result := FServer.DefaultInterface;
end;

function TMailProperties.Get_Content: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Content;
end;

function TMailProperties.Get_Attachments: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Attachments;
end;

function TMailProperties.Get_BodyHeaders: IHeaderCollection;
begin
    Result := DefaultInterface.BodyHeaders;
end;

function TMailProperties.Get_Cc: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Cc;
end;

function TMailProperties.Get_From: IMailAddress;
begin
    Result := DefaultInterface.From;
end;

function TMailProperties.Get_Headers: IHeaderCollection;
begin
    Result := DefaultInterface.Headers;
end;

function TMailProperties.Get_HtmlBody: WideString;
begin
    Result := DefaultInterface.HtmlBody;
end;

function TMailProperties.Get_IsEncrypted: WordBool;
begin
    Result := DefaultInterface.IsEncrypted;
end;

function TMailProperties.Get_IsReport: WordBool;
begin
    Result := DefaultInterface.IsReport;
end;

function TMailProperties.Get_IsSigned: WordBool;
begin
    Result := DefaultInterface.IsSigned;
end;

function TMailProperties.Get_OriginalBodyFormat: Integer;
begin
    Result := DefaultInterface.OriginalBodyFormat;
end;

function TMailProperties.Get_Priority: Integer;
begin
    Result := DefaultInterface.Priority;
end;

function TMailProperties.Get_ReceivedDate: TDateTime;
begin
    Result := DefaultInterface.ReceivedDate;
end;

function TMailProperties.Get_ReplyTo: IMailAddress;
begin
    Result := DefaultInterface.ReplyTo;
end;

function TMailProperties.Get_SentDate: TDateTime;
begin
    Result := DefaultInterface.SentDate;
end;

function TMailProperties.Get_Subject: WideString;
begin
    Result := DefaultInterface.Subject;
end;

function TMailProperties.Get_Tag: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Tag;
end;

procedure TMailProperties.Set_Tag(pVal: OleVariant);
begin
  DefaultInterface.Set_Tag(pVal);
end;

function TMailProperties.Get_TextBody: WideString;
begin
    Result := DefaultInterface.TextBody;
end;

function TMailProperties.Get_To_: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.To_;
end;

function TMailProperties.Get_Bcc: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Bcc;
end;

function TMailProperties.Get_LicenseCode: WideString;
begin
    Result := DefaultInterface.LicenseCode;
end;

procedure TMailProperties.Set_LicenseCode(const pVal: WideString);
  { Warning: The property LicenseCode has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.LicenseCode := pVal;
end;

function TMailProperties.Get_ToAddr: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.ToAddr;
end;

function TMailProperties.Get_RemoveDoubleDot: WordBool;
begin
    Result := DefaultInterface.RemoveDoubleDot;
end;

procedure TMailProperties.Set_RemoveDoubleDot(pVal: WordBool);
begin
  DefaultInterface.Set_RemoveDoubleDot(pVal);
end;

function TMailProperties.Get_Version: WideString;
begin
    Result := DefaultInterface.Version;
end;

function TMailProperties.Get_HasAlternativeBody: WordBool;
begin
    Result := DefaultInterface.HasAlternativeBody;
end;

{$ENDIF}

class function CoMailAddress.Create: IMailAddress;
begin
  Result := CreateComObject(CLASS_MailAddress) as IMailAddress;
end;

class function CoMailAddress.CreateRemote(const MachineName: string): IMailAddress;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_MailAddress) as IMailAddress;
end;

procedure TMailAddress.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{D6DA04B9-6D72-424A-9582-9752409AAD9C}';
    IntfIID:   '{9E7048E1-3574-4EFA-AE7B-67A015BA470F}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TMailAddress.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IMailAddress;
  end;
end;

procedure TMailAddress.ConnectTo(svrIntf: IMailAddress);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TMailAddress.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TMailAddress.GetDefaultInterface: IMailAddress;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TMailAddress.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TMailAddressProperties.Create(Self);
{$ENDIF}
end;

destructor TMailAddress.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TMailAddress.GetServerProperties: TMailAddressProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TMailAddress.Get_Name: WideString;
begin
    Result := DefaultInterface.Name;
end;

procedure TMailAddress.Set_Name(const pVal: WideString);
  { Warning: The property Name has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Name := pVal;
end;

function TMailAddress.Get_Address: WideString;
begin
    Result := DefaultInterface.Address;
end;

procedure TMailAddress.Set_Address(const pVal: WideString);
  { Warning: The property Address has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Address := pVal;
end;

function TMailAddress.EncodeAddr(const Charset: WideString): WideString;
begin
  Result := DefaultInterface.EncodeAddr(Charset);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TMailAddressProperties.Create(AServer: TMailAddress);
begin
  inherited Create;
  FServer := AServer;
end;

function TMailAddressProperties.GetDefaultInterface: IMailAddress;
begin
  Result := FServer.DefaultInterface;
end;

function TMailAddressProperties.Get_Name: WideString;
begin
    Result := DefaultInterface.Name;
end;

procedure TMailAddressProperties.Set_Name(const pVal: WideString);
  { Warning: The property Name has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Name := pVal;
end;

function TMailAddressProperties.Get_Address: WideString;
begin
    Result := DefaultInterface.Address;
end;

procedure TMailAddressProperties.Set_Address(const pVal: WideString);
  { Warning: The property Address has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Address := pVal;
end;

{$ENDIF}

class function CoMailInfo.Create: IMailInfo;
begin
  Result := CreateComObject(CLASS_MailInfo) as IMailInfo;
end;

class function CoMailInfo.CreateRemote(const MachineName: string): IMailInfo;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_MailInfo) as IMailInfo;
end;

procedure TMailInfo.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{CFED4866-F709-481F-89C1-4D1BF0F830D3}';
    IntfIID:   '{CE217339-CBC8-4A35-B0F1-93E376462658}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TMailInfo.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IMailInfo;
  end;
end;

procedure TMailInfo.ConnectTo(svrIntf: IMailInfo);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TMailInfo.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TMailInfo.GetDefaultInterface: IMailInfo;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TMailInfo.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TMailInfoProperties.Create(Self);
{$ENDIF}
end;

destructor TMailInfo.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TMailInfo.GetServerProperties: TMailInfoProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TMailInfo.Get_Size: Integer;
begin
    Result := DefaultInterface.Size;
end;

procedure TMailInfo.Set_Size(pVal: Integer);
begin
  DefaultInterface.Set_Size(pVal);
end;

function TMailInfo.Get_UIDL: WideString;
begin
    Result := DefaultInterface.UIDL;
end;

procedure TMailInfo.Set_UIDL(const pVal: WideString);
  { Warning: The property UIDL has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.UIDL := pVal;
end;

function TMailInfo.Get_Index: Integer;
begin
    Result := DefaultInterface.Index;
end;

procedure TMailInfo.Set_Index(pVal: Integer);
begin
  DefaultInterface.Set_Index(pVal);
end;

function TMailInfo.Get_IMAP4Flags: WideString;
begin
    Result := DefaultInterface.IMAP4Flags;
end;

procedure TMailInfo.Set_IMAP4Flags(const pVal: WideString);
  { Warning: The property IMAP4Flags has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.IMAP4Flags := pVal;
end;

function TMailInfo.Get_ChangeKey: WideString;
begin
    Result := DefaultInterface.ChangeKey;
end;

procedure TMailInfo.Set_ChangeKey(const pVal: WideString);
  { Warning: The property ChangeKey has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.ChangeKey := pVal;
end;

function TMailInfo.Get_Read: WordBool;
begin
    Result := DefaultInterface.Read;
end;

procedure TMailInfo.Set_Read(pVal: WordBool);
begin
  DefaultInterface.Set_Read(pVal);
end;

function TMailInfo.Get_Deleted: WordBool;
begin
    Result := DefaultInterface.Deleted;
end;

procedure TMailInfo.Set_Deleted(pVal: WordBool);
begin
  DefaultInterface.Set_Deleted(pVal);
end;

function TMailInfo.Get_PR_ENTRYID: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.PR_ENTRYID;
end;

procedure TMailInfo.Set_PR_ENTRYID(pVal: OleVariant);
begin
  DefaultInterface.Set_PR_ENTRYID(pVal);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TMailInfoProperties.Create(AServer: TMailInfo);
begin
  inherited Create;
  FServer := AServer;
end;

function TMailInfoProperties.GetDefaultInterface: IMailInfo;
begin
  Result := FServer.DefaultInterface;
end;

function TMailInfoProperties.Get_Size: Integer;
begin
    Result := DefaultInterface.Size;
end;

procedure TMailInfoProperties.Set_Size(pVal: Integer);
begin
  DefaultInterface.Set_Size(pVal);
end;

function TMailInfoProperties.Get_UIDL: WideString;
begin
    Result := DefaultInterface.UIDL;
end;

procedure TMailInfoProperties.Set_UIDL(const pVal: WideString);
  { Warning: The property UIDL has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.UIDL := pVal;
end;

function TMailInfoProperties.Get_Index: Integer;
begin
    Result := DefaultInterface.Index;
end;

procedure TMailInfoProperties.Set_Index(pVal: Integer);
begin
  DefaultInterface.Set_Index(pVal);
end;

function TMailInfoProperties.Get_IMAP4Flags: WideString;
begin
    Result := DefaultInterface.IMAP4Flags;
end;

procedure TMailInfoProperties.Set_IMAP4Flags(const pVal: WideString);
  { Warning: The property IMAP4Flags has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.IMAP4Flags := pVal;
end;

function TMailInfoProperties.Get_ChangeKey: WideString;
begin
    Result := DefaultInterface.ChangeKey;
end;

procedure TMailInfoProperties.Set_ChangeKey(const pVal: WideString);
  { Warning: The property ChangeKey has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.ChangeKey := pVal;
end;

function TMailInfoProperties.Get_Read: WordBool;
begin
    Result := DefaultInterface.Read;
end;

procedure TMailInfoProperties.Set_Read(pVal: WordBool);
begin
  DefaultInterface.Set_Read(pVal);
end;

function TMailInfoProperties.Get_Deleted: WordBool;
begin
    Result := DefaultInterface.Deleted;
end;

procedure TMailInfoProperties.Set_Deleted(pVal: WordBool);
begin
  DefaultInterface.Set_Deleted(pVal);
end;

function TMailInfoProperties.Get_PR_ENTRYID: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.PR_ENTRYID;
end;

procedure TMailInfoProperties.Set_PR_ENTRYID(pVal: OleVariant);
begin
  DefaultInterface.Set_PR_ENTRYID(pVal);
end;

{$ENDIF}

class function CoMailServer.Create: IMailServer;
begin
  Result := CreateComObject(CLASS_MailServer) as IMailServer;
end;

class function CoMailServer.CreateRemote(const MachineName: string): IMailServer;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_MailServer) as IMailServer;
end;

procedure TMailServer.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{65ACB9B1-68E6-460B-9738-720E0E3A6DD3}';
    IntfIID:   '{33520F78-AF50-44E7-9730-00E4083AA765}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TMailServer.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IMailServer;
  end;
end;

procedure TMailServer.ConnectTo(svrIntf: IMailServer);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TMailServer.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TMailServer.GetDefaultInterface: IMailServer;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TMailServer.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TMailServerProperties.Create(Self);
{$ENDIF}
end;

destructor TMailServer.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TMailServer.GetServerProperties: TMailServerProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TMailServer.Get_AuthType: Integer;
begin
    Result := DefaultInterface.AuthType;
end;

procedure TMailServer.Set_AuthType(pVal: Integer);
begin
  DefaultInterface.Set_AuthType(pVal);
end;

function TMailServer.Get_Password: WideString;
begin
    Result := DefaultInterface.Password;
end;

procedure TMailServer.Set_Password(const pVal: WideString);
  { Warning: The property Password has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Password := pVal;
end;

function TMailServer.Get_Port: Integer;
begin
    Result := DefaultInterface.Port;
end;

procedure TMailServer.Set_Port(pVal: Integer);
begin
  DefaultInterface.Set_Port(pVal);
end;

function TMailServer.Get_Protocol: Integer;
begin
    Result := DefaultInterface.Protocol;
end;

procedure TMailServer.Set_Protocol(pVal: Integer);
begin
  DefaultInterface.Set_Protocol(pVal);
end;

function TMailServer.Get_ProxyProtocol: Integer;
begin
    Result := DefaultInterface.ProxyProtocol;
end;

procedure TMailServer.Set_ProxyProtocol(pVal: Integer);
begin
  DefaultInterface.Set_ProxyProtocol(pVal);
end;

function TMailServer.Get_Server: WideString;
begin
    Result := DefaultInterface.Server;
end;

procedure TMailServer.Set_Server(const pVal: WideString);
  { Warning: The property Server has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Server := pVal;
end;

function TMailServer.Get_SocksProxyPassword: WideString;
begin
    Result := DefaultInterface.SocksProxyPassword;
end;

procedure TMailServer.Set_SocksProxyPassword(const pVal: WideString);
  { Warning: The property SocksProxyPassword has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.SocksProxyPassword := pVal;
end;

function TMailServer.Get_SocksProxyPort: Integer;
begin
    Result := DefaultInterface.SocksProxyPort;
end;

procedure TMailServer.Set_SocksProxyPort(pVal: Integer);
begin
  DefaultInterface.Set_SocksProxyPort(pVal);
end;

function TMailServer.Get_SocksProxyServer: WideString;
begin
    Result := DefaultInterface.SocksProxyServer;
end;

procedure TMailServer.Set_SocksProxyServer(const pVal: WideString);
  { Warning: The property SocksProxyServer has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.SocksProxyServer := pVal;
end;

function TMailServer.Get_SocksProxyUser: WideString;
begin
    Result := DefaultInterface.SocksProxyUser;
end;

procedure TMailServer.Set_SocksProxyUser(const pVal: WideString);
  { Warning: The property SocksProxyUser has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.SocksProxyUser := pVal;
end;

function TMailServer.Get_SSLType: Integer;
begin
    Result := DefaultInterface.SSLType;
end;

procedure TMailServer.Set_SSLType(pVal: Integer);
begin
  DefaultInterface.Set_SSLType(pVal);
end;

function TMailServer.Get_User: WideString;
begin
    Result := DefaultInterface.User;
end;

procedure TMailServer.Set_User(const pVal: WideString);
  { Warning: The property User has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.User := pVal;
end;

function TMailServer.Get_SSLConnection: WordBool;
begin
    Result := DefaultInterface.SSLConnection;
end;

procedure TMailServer.Set_SSLConnection(pVal: WordBool);
begin
  DefaultInterface.Set_SSLConnection(pVal);
end;

function TMailServer.Get_Alias: WideString;
begin
    Result := DefaultInterface.Alias;
end;

procedure TMailServer.Set_Alias(const pVal: WideString);
  { Warning: The property Alias has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Alias := pVal;
end;

function TMailServer.Copy: IMailServer;
begin
  Result := DefaultInterface.Copy;
end;

function TMailServer.ToConversationString: WideString;
begin
  Result := DefaultInterface.ToConversationString;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TMailServerProperties.Create(AServer: TMailServer);
begin
  inherited Create;
  FServer := AServer;
end;

function TMailServerProperties.GetDefaultInterface: IMailServer;
begin
  Result := FServer.DefaultInterface;
end;

function TMailServerProperties.Get_AuthType: Integer;
begin
    Result := DefaultInterface.AuthType;
end;

procedure TMailServerProperties.Set_AuthType(pVal: Integer);
begin
  DefaultInterface.Set_AuthType(pVal);
end;

function TMailServerProperties.Get_Password: WideString;
begin
    Result := DefaultInterface.Password;
end;

procedure TMailServerProperties.Set_Password(const pVal: WideString);
  { Warning: The property Password has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Password := pVal;
end;

function TMailServerProperties.Get_Port: Integer;
begin
    Result := DefaultInterface.Port;
end;

procedure TMailServerProperties.Set_Port(pVal: Integer);
begin
  DefaultInterface.Set_Port(pVal);
end;

function TMailServerProperties.Get_Protocol: Integer;
begin
    Result := DefaultInterface.Protocol;
end;

procedure TMailServerProperties.Set_Protocol(pVal: Integer);
begin
  DefaultInterface.Set_Protocol(pVal);
end;

function TMailServerProperties.Get_ProxyProtocol: Integer;
begin
    Result := DefaultInterface.ProxyProtocol;
end;

procedure TMailServerProperties.Set_ProxyProtocol(pVal: Integer);
begin
  DefaultInterface.Set_ProxyProtocol(pVal);
end;

function TMailServerProperties.Get_Server: WideString;
begin
    Result := DefaultInterface.Server;
end;

procedure TMailServerProperties.Set_Server(const pVal: WideString);
  { Warning: The property Server has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Server := pVal;
end;

function TMailServerProperties.Get_SocksProxyPassword: WideString;
begin
    Result := DefaultInterface.SocksProxyPassword;
end;

procedure TMailServerProperties.Set_SocksProxyPassword(const pVal: WideString);
  { Warning: The property SocksProxyPassword has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.SocksProxyPassword := pVal;
end;

function TMailServerProperties.Get_SocksProxyPort: Integer;
begin
    Result := DefaultInterface.SocksProxyPort;
end;

procedure TMailServerProperties.Set_SocksProxyPort(pVal: Integer);
begin
  DefaultInterface.Set_SocksProxyPort(pVal);
end;

function TMailServerProperties.Get_SocksProxyServer: WideString;
begin
    Result := DefaultInterface.SocksProxyServer;
end;

procedure TMailServerProperties.Set_SocksProxyServer(const pVal: WideString);
  { Warning: The property SocksProxyServer has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.SocksProxyServer := pVal;
end;

function TMailServerProperties.Get_SocksProxyUser: WideString;
begin
    Result := DefaultInterface.SocksProxyUser;
end;

procedure TMailServerProperties.Set_SocksProxyUser(const pVal: WideString);
  { Warning: The property SocksProxyUser has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.SocksProxyUser := pVal;
end;

function TMailServerProperties.Get_SSLType: Integer;
begin
    Result := DefaultInterface.SSLType;
end;

procedure TMailServerProperties.Set_SSLType(pVal: Integer);
begin
  DefaultInterface.Set_SSLType(pVal);
end;

function TMailServerProperties.Get_User: WideString;
begin
    Result := DefaultInterface.User;
end;

procedure TMailServerProperties.Set_User(const pVal: WideString);
  { Warning: The property User has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.User := pVal;
end;

function TMailServerProperties.Get_SSLConnection: WordBool;
begin
    Result := DefaultInterface.SSLConnection;
end;

procedure TMailServerProperties.Set_SSLConnection(pVal: WordBool);
begin
  DefaultInterface.Set_SSLConnection(pVal);
end;

function TMailServerProperties.Get_Alias: WideString;
begin
    Result := DefaultInterface.Alias;
end;

procedure TMailServerProperties.Set_Alias(const pVal: WideString);
  { Warning: The property Alias has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Alias := pVal;
end;

{$ENDIF}

class function CoMailReport.Create: IMailReport;
begin
  Result := CreateComObject(CLASS_MailReport) as IMailReport;
end;

class function CoMailReport.CreateRemote(const MachineName: string): IMailReport;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_MailReport) as IMailReport;
end;

procedure TMailReport.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{029033B3-0CFF-452E-8832-8101FDE8D0B4}';
    IntfIID:   '{372B933C-CB50-48C5-81E5-B1C3122379B1}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TMailReport.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IMailReport;
  end;
end;

procedure TMailReport.ConnectTo(svrIntf: IMailReport);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TMailReport.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TMailReport.GetDefaultInterface: IMailReport;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TMailReport.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TMailReportProperties.Create(Self);
{$ENDIF}
end;

destructor TMailReport.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TMailReport.GetServerProperties: TMailReportProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TMailReport.Get_ErrCode: WideString;
begin
    Result := DefaultInterface.ErrCode;
end;

procedure TMailReport.Set_ErrCode(const pVal: WideString);
  { Warning: The property ErrCode has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.ErrCode := pVal;
end;

function TMailReport.Get_ErrDescription: WideString;
begin
    Result := DefaultInterface.ErrDescription;
end;

procedure TMailReport.Set_ErrDescription(const pVal: WideString);
  { Warning: The property ErrDescription has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.ErrDescription := pVal;
end;

function TMailReport.Get_OriginalHeaders: IHeaderCollection;
begin
    Result := DefaultInterface.OriginalHeaders;
end;

procedure TMailReport.Set_OriginalHeaders(const pVal: IHeaderCollection);
begin
  DefaultInterface.Set_OriginalHeaders(pVal);
end;

function TMailReport.Get_OriginalMessageID: WideString;
begin
    Result := DefaultInterface.OriginalMessageID;
end;

procedure TMailReport.Set_OriginalMessageID(const pVal: WideString);
  { Warning: The property OriginalMessageID has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OriginalMessageID := pVal;
end;

function TMailReport.Get_OriginalRecipient: WideString;
begin
    Result := DefaultInterface.OriginalRecipient;
end;

procedure TMailReport.Set_OriginalRecipient(const pVal: WideString);
  { Warning: The property OriginalRecipient has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OriginalRecipient := pVal;
end;

function TMailReport.Get_OriginalSender: WideString;
begin
    Result := DefaultInterface.OriginalSender;
end;

procedure TMailReport.Set_OriginalSender(const pVal: WideString);
  { Warning: The property OriginalSender has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OriginalSender := pVal;
end;

function TMailReport.Get_OriginalSubject: WideString;
begin
    Result := DefaultInterface.OriginalSubject;
end;

procedure TMailReport.Set_OriginalSubject(const pVal: WideString);
  { Warning: The property OriginalSubject has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OriginalSubject := pVal;
end;

function TMailReport.Get_ReportMTA: WideString;
begin
    Result := DefaultInterface.ReportMTA;
end;

procedure TMailReport.Set_ReportMTA(const pVal: WideString);
  { Warning: The property ReportMTA has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.ReportMTA := pVal;
end;

function TMailReport.Get_ReportType: Integer;
begin
    Result := DefaultInterface.ReportType;
end;

procedure TMailReport.Set_ReportType(pVal: Integer);
begin
  DefaultInterface.Set_ReportType(pVal);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TMailReportProperties.Create(AServer: TMailReport);
begin
  inherited Create;
  FServer := AServer;
end;

function TMailReportProperties.GetDefaultInterface: IMailReport;
begin
  Result := FServer.DefaultInterface;
end;

function TMailReportProperties.Get_ErrCode: WideString;
begin
    Result := DefaultInterface.ErrCode;
end;

procedure TMailReportProperties.Set_ErrCode(const pVal: WideString);
  { Warning: The property ErrCode has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.ErrCode := pVal;
end;

function TMailReportProperties.Get_ErrDescription: WideString;
begin
    Result := DefaultInterface.ErrDescription;
end;

procedure TMailReportProperties.Set_ErrDescription(const pVal: WideString);
  { Warning: The property ErrDescription has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.ErrDescription := pVal;
end;

function TMailReportProperties.Get_OriginalHeaders: IHeaderCollection;
begin
    Result := DefaultInterface.OriginalHeaders;
end;

procedure TMailReportProperties.Set_OriginalHeaders(const pVal: IHeaderCollection);
begin
  DefaultInterface.Set_OriginalHeaders(pVal);
end;

function TMailReportProperties.Get_OriginalMessageID: WideString;
begin
    Result := DefaultInterface.OriginalMessageID;
end;

procedure TMailReportProperties.Set_OriginalMessageID(const pVal: WideString);
  { Warning: The property OriginalMessageID has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OriginalMessageID := pVal;
end;

function TMailReportProperties.Get_OriginalRecipient: WideString;
begin
    Result := DefaultInterface.OriginalRecipient;
end;

procedure TMailReportProperties.Set_OriginalRecipient(const pVal: WideString);
  { Warning: The property OriginalRecipient has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OriginalRecipient := pVal;
end;

function TMailReportProperties.Get_OriginalSender: WideString;
begin
    Result := DefaultInterface.OriginalSender;
end;

procedure TMailReportProperties.Set_OriginalSender(const pVal: WideString);
  { Warning: The property OriginalSender has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OriginalSender := pVal;
end;

function TMailReportProperties.Get_OriginalSubject: WideString;
begin
    Result := DefaultInterface.OriginalSubject;
end;

procedure TMailReportProperties.Set_OriginalSubject(const pVal: WideString);
  { Warning: The property OriginalSubject has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.OriginalSubject := pVal;
end;

function TMailReportProperties.Get_ReportMTA: WideString;
begin
    Result := DefaultInterface.ReportMTA;
end;

procedure TMailReportProperties.Set_ReportMTA(const pVal: WideString);
  { Warning: The property ReportMTA has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.ReportMTA := pVal;
end;

function TMailReportProperties.Get_ReportType: Integer;
begin
    Result := DefaultInterface.ReportType;
end;

procedure TMailReportProperties.Set_ReportType(pVal: Integer);
begin
  DefaultInterface.Set_ReportType(pVal);
end;

{$ENDIF}

class function CoTools.Create: ITools;
begin
  Result := CreateComObject(CLASS_Tools) as ITools;
end;

class function CoTools.CreateRemote(const MachineName: string): ITools;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Tools) as ITools;
end;

procedure TTools.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{8B092B61-AE66-4413-B4D0-6B97FBE6DA08}';
    IntfIID:   '{6AA9C7EE-BBD2-4941-A348-9E9C343366D2}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TTools.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as ITools;
  end;
end;

procedure TTools.ConnectTo(svrIntf: ITools);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TTools.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TTools.GetDefaultInterface: ITools;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TTools.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TToolsProperties.Create(Self);
{$ENDIF}
end;

destructor TTools.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TTools.GetServerProperties: TToolsProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TTools.VarToBSTR(Var_: OleVariant; CodePage: Integer): WideString;
begin
  Result := DefaultInterface.VarToBSTR(Var_, CodePage);
end;

procedure TTools.CreateFolder(const FolderName: WideString);
begin
  DefaultInterface.CreateFolder(FolderName);
end;

function TTools.ExistFile(const FileOrFolderName: WideString): WordBool;
begin
  Result := DefaultInterface.ExistFile(FileOrFolderName);
end;

procedure TTools.RemoveFile(const FileName: WideString);
begin
  DefaultInterface.RemoveFile(FileName);
end;

procedure TTools.RemoveFolder(const FolderName: WideString; Recursive: WordBool);
begin
  DefaultInterface.RemoveFolder(FolderName, Recursive);
end;

function TTools.GetFiles(const FolderName: WideString): OleVariant;
begin
  Result := DefaultInterface.GetFiles(FolderName);
end;

function TTools.ReadTextFile(const FileName: WideString; CodePage: Integer): WideString;
begin
  Result := DefaultInterface.ReadTextFile(FileName, CodePage);
end;

procedure TTools.WriteTextFile(const FileName: WideString; const Content: WideString; 
                               CodePage: Integer);
begin
  DefaultInterface.WriteTextFile(FileName, Content, CodePage);
end;

function TTools.GenFileName(Index: Integer): WideString;
begin
  Result := DefaultInterface.GenFileName(Index);
end;

function TTools.BSTRToVar(const Src: WideString; CodePage: Integer): OleVariant;
begin
  Result := DefaultInterface.BSTRToVar(Src, CodePage);
end;

function TTools.ReadFileToBase64(const FileName: WideString): WideString;
begin
  Result := DefaultInterface.ReadFileToBase64(FileName);
end;

function TTools.ReadBinaryFile(const FileName: WideString): OleVariant;
begin
  Result := DefaultInterface.ReadBinaryFile(FileName);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TToolsProperties.Create(AServer: TTools);
begin
  inherited Create;
  FServer := AServer;
end;

function TToolsProperties.GetDefaultInterface: ITools;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoUIDLManager.Create: IUIDLManager;
begin
  Result := CreateComObject(CLASS_UIDLManager) as IUIDLManager;
end;

class function CoUIDLManager.CreateRemote(const MachineName: string): IUIDLManager;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_UIDLManager) as IUIDLManager;
end;

procedure TUIDLManager.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{440B896B-8AAD-4FEE-8F39-066F79F73E5C}';
    IntfIID:   '{63D8237A-5DC3-4C82-BE6B-073B32A78759}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TUIDLManager.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IUIDLManager;
  end;
end;

procedure TUIDLManager.ConnectTo(svrIntf: IUIDLManager);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TUIDLManager.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TUIDLManager.GetDefaultInterface: IUIDLManager;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TUIDLManager.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TUIDLManagerProperties.Create(Self);
{$ENDIF}
end;

destructor TUIDLManager.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TUIDLManager.GetServerProperties: TUIDLManagerProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TUIDLManager.Get_Count: Integer;
begin
    Result := DefaultInterface.Count;
end;

procedure TUIDLManager.Load(const FileName: WideString);
begin
  DefaultInterface.Load(FileName);
end;

procedure TUIDLManager.Update;
begin
  DefaultInterface.Update;
end;

procedure TUIDLManager.SyncUIDL(const oServer: IMailServer; Infos: OleVariant);
begin
  DefaultInterface.SyncUIDL(oServer, Infos);
end;

function TUIDLManager.AddUIDL(const oServer: IMailServer; const UIDL: WideString; 
                              const LocalFileName: WideString): IUIDLItem;
begin
  Result := DefaultInterface.AddUIDL(oServer, UIDL, LocalFileName);
end;

procedure TUIDLManager.RemoveUIDL(const oServer: IMailServer; const UIDL: WideString);
begin
  DefaultInterface.RemoveUIDL(oServer, UIDL);
end;

procedure TUIDLManager.RemoveUIDLEX(const oItem: IUIDLItem);
begin
  DefaultInterface.RemoveUIDLEX(oItem);
end;

procedure TUIDLManager.RemoveAt(Index: Integer);
begin
  DefaultInterface.RemoveAt(Index);
end;

procedure TUIDLManager.Clear;
begin
  DefaultInterface.Clear;
end;

function TUIDLManager.Item(Index: Integer): IUIDLItem;
begin
  Result := DefaultInterface.Item(Index);
end;

function TUIDLManager.FindUIDL(const oServer: IMailServer; const UIDL: WideString): IUIDLItem;
begin
  Result := DefaultInterface.FindUIDL(oServer, UIDL);
end;

function TUIDLManager.FindLocalFile(const FileName: WideString): IUIDLItem;
begin
  Result := DefaultInterface.FindLocalFile(FileName);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TUIDLManagerProperties.Create(AServer: TUIDLManager);
begin
  inherited Create;
  FServer := AServer;
end;

function TUIDLManagerProperties.GetDefaultInterface: IUIDLManager;
begin
  Result := FServer.DefaultInterface;
end;

function TUIDLManagerProperties.Get_Count: Integer;
begin
    Result := DefaultInterface.Count;
end;

{$ENDIF}

class function CoUIDLItem.Create: IUIDLItem;
begin
  Result := CreateComObject(CLASS_UIDLItem) as IUIDLItem;
end;

class function CoUIDLItem.CreateRemote(const MachineName: string): IUIDLItem;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_UIDLItem) as IUIDLItem;
end;

procedure TUIDLItem.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{7096722C-E10D-42D9-A284-1E582D2B27B3}';
    IntfIID:   '{2BB66CC9-2E20-4567-97C0-494109F5B12B}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TUIDLItem.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IUIDLItem;
  end;
end;

procedure TUIDLItem.ConnectTo(svrIntf: IUIDLItem);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TUIDLItem.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TUIDLItem.GetDefaultInterface: IUIDLItem;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TUIDLItem.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TUIDLItemProperties.Create(Self);
{$ENDIF}
end;

destructor TUIDLItem.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TUIDLItem.GetServerProperties: TUIDLItemProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TUIDLItem.Get_UIDL: WideString;
begin
    Result := DefaultInterface.UIDL;
end;

procedure TUIDLItem.Set_UIDL(const pVal: WideString);
  { Warning: The property UIDL has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.UIDL := pVal;
end;

function TUIDLItem.Get_ServerUser: WideString;
begin
    Result := DefaultInterface.ServerUser;
end;

procedure TUIDLItem.Set_ServerUser(const pVal: WideString);
  { Warning: The property ServerUser has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.ServerUser := pVal;
end;

function TUIDLItem.Get_FileName: WideString;
begin
    Result := DefaultInterface.FileName;
end;

procedure TUIDLItem.Set_FileName(const pVal: WideString);
  { Warning: The property FileName has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.FileName := pVal;
end;

function TUIDLItem.Get_DownloadTime: TDateTime;
begin
    Result := DefaultInterface.DownloadTime;
end;

procedure TUIDLItem.Set_DownloadTime(pVal: TDateTime);
begin
  DefaultInterface.Set_DownloadTime(pVal);
end;

function TUIDLItem.Get_Flags: Integer;
begin
    Result := DefaultInterface.Flags;
end;

procedure TUIDLItem.Set_Flags(pVal: Integer);
begin
  DefaultInterface.Set_Flags(pVal);
end;

function TUIDLItem.Get_Index: Integer;
begin
    Result := DefaultInterface.Index;
end;

procedure TUIDLItem.Set_Index(pVal: Integer);
begin
  DefaultInterface.Set_Index(pVal);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TUIDLItemProperties.Create(AServer: TUIDLItem);
begin
  inherited Create;
  FServer := AServer;
end;

function TUIDLItemProperties.GetDefaultInterface: IUIDLItem;
begin
  Result := FServer.DefaultInterface;
end;

function TUIDLItemProperties.Get_UIDL: WideString;
begin
    Result := DefaultInterface.UIDL;
end;

procedure TUIDLItemProperties.Set_UIDL(const pVal: WideString);
  { Warning: The property UIDL has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.UIDL := pVal;
end;

function TUIDLItemProperties.Get_ServerUser: WideString;
begin
    Result := DefaultInterface.ServerUser;
end;

procedure TUIDLItemProperties.Set_ServerUser(const pVal: WideString);
  { Warning: The property ServerUser has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.ServerUser := pVal;
end;

function TUIDLItemProperties.Get_FileName: WideString;
begin
    Result := DefaultInterface.FileName;
end;

procedure TUIDLItemProperties.Set_FileName(const pVal: WideString);
  { Warning: The property FileName has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.FileName := pVal;
end;

function TUIDLItemProperties.Get_DownloadTime: TDateTime;
begin
    Result := DefaultInterface.DownloadTime;
end;

procedure TUIDLItemProperties.Set_DownloadTime(pVal: TDateTime);
begin
  DefaultInterface.Set_DownloadTime(pVal);
end;

function TUIDLItemProperties.Get_Flags: Integer;
begin
    Result := DefaultInterface.Flags;
end;

procedure TUIDLItemProperties.Set_Flags(pVal: Integer);
begin
  DefaultInterface.Set_Flags(pVal);
end;

function TUIDLItemProperties.Get_Index: Integer;
begin
    Result := DefaultInterface.Index;
end;

procedure TUIDLItemProperties.Set_Index(pVal: Integer);
begin
  DefaultInterface.Set_Index(pVal);
end;

{$ENDIF}

class function CoGetMailInfosParamType.Create: IGetMailInfosParamType;
begin
  Result := CreateComObject(CLASS_GetMailInfosParamType) as IGetMailInfosParamType;
end;

class function CoGetMailInfosParamType.CreateRemote(const MachineName: string): IGetMailInfosParamType;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_GetMailInfosParamType) as IGetMailInfosParamType;
end;

procedure TGetMailInfosParamType.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{B511D930-097E-4E90-9753-956A067D9E0E}';
    IntfIID:   '{E9777121-432A-41A1-A895-BE0BBBDD1969}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TGetMailInfosParamType.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IGetMailInfosParamType;
  end;
end;

procedure TGetMailInfosParamType.ConnectTo(svrIntf: IGetMailInfosParamType);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TGetMailInfosParamType.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TGetMailInfosParamType.GetDefaultInterface: IGetMailInfosParamType;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TGetMailInfosParamType.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TGetMailInfosParamTypeProperties.Create(Self);
{$ENDIF}
end;

destructor TGetMailInfosParamType.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TGetMailInfosParamType.GetServerProperties: TGetMailInfosParamTypeProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TGetMailInfosParamType.Get_GetMailInfosOptions: Integer;
begin
    Result := DefaultInterface.GetMailInfosOptions;
end;

procedure TGetMailInfosParamType.Set_GetMailInfosOptions(pVal: Integer);
begin
  DefaultInterface.Set_GetMailInfosOptions(pVal);
end;

function TGetMailInfosParamType.Get_SeqRange: WideString;
begin
    Result := DefaultInterface.SeqRange;
end;

procedure TGetMailInfosParamType.Set_SeqRange(const pVal: WideString);
  { Warning: The property SeqRange has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.SeqRange := pVal;
end;

function TGetMailInfosParamType.Get_UIDRange: WideString;
begin
    Result := DefaultInterface.UIDRange;
end;

procedure TGetMailInfosParamType.Set_UIDRange(const pVal: WideString);
  { Warning: The property UIDRange has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.UIDRange := pVal;
end;

function TGetMailInfosParamType.Get_SubjectContains: WideString;
begin
    Result := DefaultInterface.SubjectContains;
end;

procedure TGetMailInfosParamType.Set_SubjectContains(const pVal: WideString);
  { Warning: The property SubjectContains has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.SubjectContains := pVal;
end;

function TGetMailInfosParamType.Get_SenderContains: WideString;
begin
    Result := DefaultInterface.SenderContains;
end;

procedure TGetMailInfosParamType.Set_SenderContains(const pVal: WideString);
  { Warning: The property SenderContains has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.SenderContains := pVal;
end;

function TGetMailInfosParamType.Get_ValueChanged: WordBool;
begin
    Result := DefaultInterface.ValueChanged;
end;

procedure TGetMailInfosParamType.Set_ValueChanged(pVal: WordBool);
begin
  DefaultInterface.Set_ValueChanged(pVal);
end;

function TGetMailInfosParamType.Get_DateRangeSINCE: TDateTime;
begin
    Result := DefaultInterface.DateRangeSINCE;
end;

procedure TGetMailInfosParamType.Set_DateRangeSINCE(pVal: TDateTime);
begin
  DefaultInterface.Set_DateRangeSINCE(pVal);
end;

function TGetMailInfosParamType.Get_DateRangeBEFORE: TDateTime;
begin
    Result := DefaultInterface.DateRangeBEFORE;
end;

procedure TGetMailInfosParamType.Set_DateRangeBEFORE(pVal: TDateTime);
begin
  DefaultInterface.Set_DateRangeBEFORE(pVal);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TGetMailInfosParamTypeProperties.Create(AServer: TGetMailInfosParamType);
begin
  inherited Create;
  FServer := AServer;
end;

function TGetMailInfosParamTypeProperties.GetDefaultInterface: IGetMailInfosParamType;
begin
  Result := FServer.DefaultInterface;
end;

function TGetMailInfosParamTypeProperties.Get_GetMailInfosOptions: Integer;
begin
    Result := DefaultInterface.GetMailInfosOptions;
end;

procedure TGetMailInfosParamTypeProperties.Set_GetMailInfosOptions(pVal: Integer);
begin
  DefaultInterface.Set_GetMailInfosOptions(pVal);
end;

function TGetMailInfosParamTypeProperties.Get_SeqRange: WideString;
begin
    Result := DefaultInterface.SeqRange;
end;

procedure TGetMailInfosParamTypeProperties.Set_SeqRange(const pVal: WideString);
  { Warning: The property SeqRange has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.SeqRange := pVal;
end;

function TGetMailInfosParamTypeProperties.Get_UIDRange: WideString;
begin
    Result := DefaultInterface.UIDRange;
end;

procedure TGetMailInfosParamTypeProperties.Set_UIDRange(const pVal: WideString);
  { Warning: The property UIDRange has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.UIDRange := pVal;
end;

function TGetMailInfosParamTypeProperties.Get_SubjectContains: WideString;
begin
    Result := DefaultInterface.SubjectContains;
end;

procedure TGetMailInfosParamTypeProperties.Set_SubjectContains(const pVal: WideString);
  { Warning: The property SubjectContains has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.SubjectContains := pVal;
end;

function TGetMailInfosParamTypeProperties.Get_SenderContains: WideString;
begin
    Result := DefaultInterface.SenderContains;
end;

procedure TGetMailInfosParamTypeProperties.Set_SenderContains(const pVal: WideString);
  { Warning: The property SenderContains has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.SenderContains := pVal;
end;

function TGetMailInfosParamTypeProperties.Get_ValueChanged: WordBool;
begin
    Result := DefaultInterface.ValueChanged;
end;

procedure TGetMailInfosParamTypeProperties.Set_ValueChanged(pVal: WordBool);
begin
  DefaultInterface.Set_ValueChanged(pVal);
end;

function TGetMailInfosParamTypeProperties.Get_DateRangeSINCE: TDateTime;
begin
    Result := DefaultInterface.DateRangeSINCE;
end;

procedure TGetMailInfosParamTypeProperties.Set_DateRangeSINCE(pVal: TDateTime);
begin
  DefaultInterface.Set_DateRangeSINCE(pVal);
end;

function TGetMailInfosParamTypeProperties.Get_DateRangeBEFORE: TDateTime;
begin
    Result := DefaultInterface.DateRangeBEFORE;
end;

procedure TGetMailInfosParamTypeProperties.Set_DateRangeBEFORE(pVal: TDateTime);
begin
  DefaultInterface.Set_DateRangeBEFORE(pVal);
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TMailClient, TAttachment, TCertificate, THeaderCollection, 
    THeaderItem, TImap4Folder, TMail, TMailAddress, TMailInfo, 
    TMailServer, TMailReport, TTools, TUIDLManager, TUIDLItem, 
    TGetMailInfosParamType]);
end;

end.
