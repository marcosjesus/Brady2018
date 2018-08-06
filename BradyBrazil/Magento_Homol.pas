// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://homologacao.seton.com.br/api/v2_soap?wsdl=1
//  >Import : http://homologacao.seton.com.br/api/v2_soap?wsdl=1>0
//  >Import : http://schemas.xmlsoap.org/soap/encoding/
// Encoding : UTF-8
// Version  : 1.0
// (18/12/2017 08:45:39 - - $Rev: 56641 $)
// ************************************************************************ //

unit Magento_Homol;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

const
  IS_OPTN = $0001;
  IS_ATTR = $0010;


type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:ID              - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:anyURI          - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:int             - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:boolean         - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:double          - "http://www.w3.org/2001/XMLSchema"[Gbl]

  giftMessageAssociativeProductsEntity = class;   { "urn:Magento"[GblCplx] }
  catalogProductDownloadableLinkInfoEntity = class;   { "urn:Magento"[GblCplx] }
  ID2                  = class;                 { "http://schemas.xmlsoap.org/soap/encoding/"[GblCplx] }
  directoryRegionEntity = class;                { "urn:Magento"[GblCplx] }
  complexFilter        = class;                 { "urn:Magento"[GblCplx] }
  existsFaltureEntity  = class;                 { "urn:Magento"[GblCplx] }
  magentoInfoEntity    = class;                 { "urn:Magento"[GblCplx] }
  directoryCountryEntity = class;               { "urn:Magento"[GblCplx] }
  catalogProductCustomOptionAdditionalFieldsEntity = class;   { "urn:Magento"[GblCplx] }
  shoppingCartPaymentMethodEntity = class;      { "urn:Magento"[GblCplx] }
  catalogInventoryStockItemEntity = class;      { "urn:Magento"[GblCplx] }
  shoppingCartPaymentEntity = class;            { "urn:Magento"[GblCplx] }
  catalogProductDownloadableLinkAddSampleEntity = class;   { "urn:Magento"[GblCplx] }
  catalogProductDownloadableLinkSampleEntity = class;   { "urn:Magento"[GblCplx] }
  catalogProductDownloadableLinkFileEntity = class;   { "urn:Magento"[GblCplx] }
  catalogProductTagAddEntity = class;           { "urn:Magento"[GblCplx] }
  catalogProductTagUpdateEntity = class;        { "urn:Magento"[GblCplx] }
  catalogProductTagListEntity = class;          { "urn:Magento"[GblCplx] }
  giftMessageEntity    = class;                 { "urn:Magento"[GblCplx] }
  catalogProductCustomOptionTypesEntity = class;   { "urn:Magento"[GblCplx] }
  salesOrderPaymentEntity = class;              { "urn:Magento"[GblCplx] }
  salesOrderItemEntity = class;                 { "urn:Magento"[GblCplx] }
  salesOrderListEntity = class;                 { "urn:Magento"[GblCplx] }
  catalogProductCustomOptionValueUpdateEntity = class;   { "urn:Magento"[GblCplx] }
  catalogProductCustomOptionValueListEntity = class;   { "urn:Magento"[GblCplx] }
  catalogProductSpecialPriceReturnEntity = class;   { "urn:Magento"[GblCplx] }
  salesOrderAddressEntity = class;              { "urn:Magento"[GblCplx] }
  salesOrderEntity     = class;                 { "urn:Magento"[GblCplx] }
  catalogProductCustomOptionValueInfoEntity = class;   { "urn:Magento"[GblCplx] }
  catalogProductCustomOptionValueAddEntity = class;   { "urn:Magento"[GblCplx] }
  salesOrderInvoiceItemEntity = class;          { "urn:Magento"[GblCplx] }
  salesOrderInvoiceCommentEntity = class;       { "urn:Magento"[GblCplx] }
  salesOrderInvoiceEntity = class;              { "urn:Magento"[GblCplx] }
  salesOrderCreditmemoItemEntity = class;       { "urn:Magento"[GblCplx] }
  salesOrderCreditmemoCommentEntity = class;    { "urn:Magento"[GblCplx] }
  salesOrderCreditmemoEntity = class;           { "urn:Magento"[GblCplx] }
  salesOrderShipmentEntity = class;             { "urn:Magento"[GblCplx] }
  salesOrderStatusHistoryEntity = class;        { "urn:Magento"[GblCplx] }
  salesOrderShipmentCommentEntity = class;      { "urn:Magento"[GblCplx] }
  salesOrderShipmentTrackEntity = class;        { "urn:Magento"[GblCplx] }
  salesOrderShipmentItemEntity = class;         { "urn:Magento"[GblCplx] }
  int2                 = class;                 { "http://schemas.xmlsoap.org/soap/encoding/"[GblCplx] }
  customerCustomerEntityToCreate = class;       { "urn:Magento"[GblCplx] }
  customerGroupEntity  = class;                 { "urn:Magento"[GblCplx] }
  storeEntity          = class;                 { "urn:Magento"[GblCplx] }
  shoppingCartCustomerEntity = class;           { "urn:Magento"[GblCplx] }
  shoppingCartCustomerAddressEntity = class;    { "urn:Magento"[GblCplx] }
  shoppingCartLicenseEntity = class;            { "urn:Magento"[GblCplx] }
  catalogProductDownloadableLinkEntity = class;   { "urn:Magento"[GblCplx] }
  catalogProductDownloadableLinkFileInfoEntity = class;   { "urn:Magento"[GblCplx] }
  catalogProductDownloadableLinkAddEntity = class;   { "urn:Magento"[GblCplx] }
  catalogProductCustomOptionToAdd = class;      { "urn:Magento"[GblCplx] }
  catalogProductCustomOptionInfoEntity = class;   { "urn:Magento"[GblCplx] }
  catalogProductCustomOptionToUpdate = class;   { "urn:Magento"[GblCplx] }
  catalogProductCustomOptionListEntity = class;   { "urn:Magento"[GblCplx] }
  string_2             = class;                 { "http://schemas.xmlsoap.org/soap/encoding/"[GblCplx] }
  customerCustomerEntity = class;               { "urn:Magento"[GblCplx] }
  customerAddressEntityItem = class;            { "urn:Magento"[GblCplx] }
  giftMessageResponse  = class;                 { "urn:Magento"[GblCplx] }
  boolean_2            = class;                 { "http://schemas.xmlsoap.org/soap/encoding/"[GblCplx] }
  boolean_             = class;                 { "http://schemas.xmlsoap.org/soap/encoding/"[GblElm] }
  anyURI2              = class;                 { "http://schemas.xmlsoap.org/soap/encoding/"[GblCplx] }
  double_2             = class;                 { "http://schemas.xmlsoap.org/soap/encoding/"[GblCplx] }
  shoppingCartShippingMethodEntity = class;     { "urn:Magento"[GblCplx] }
  shoppingCartAddressEntity = class;            { "urn:Magento"[GblCplx] }
  salesOrderCreditmemoData = class;             { "urn:Magento"[GblCplx] }
  shoppingCartItemEntity = class;               { "urn:Magento"[GblCplx] }
  shoppingCartTotalsEntity = class;             { "urn:Magento"[GblCplx] }
  shoppingCartInfoEntity = class;               { "urn:Magento"[GblCplx] }
  orderItemIdQty       = class;                 { "urn:Magento"[GblCplx] }
  shoppingCartPaymentMethodResponseEntity = class;   { "urn:Magento"[GblCplx] }
  catalogProductTagInfoEntity = class;          { "urn:Magento"[GblCplx] }
  associativeMultiEntity = class;               { "urn:Magento"[GblCplx] }
  customerAddressEntityCreate = class;          { "urn:Magento"[GblCplx] }
  apiEntity            = class;                 { "urn:Magento"[GblCplx] }
  apiMethodEntity      = class;                 { "urn:Magento"[GblCplx] }
  shoppingCartProductEntity = class;            { "urn:Magento"[GblCplx] }
  filters              = class;                 { "urn:Magento"[GblCplx] }
  associativeEntity    = class;                 { "urn:Magento"[GblCplx] }
  anyURI               = class;                 { "http://schemas.xmlsoap.org/soap/encoding/"[GblElm] }
  double_              = class;                 { "http://schemas.xmlsoap.org/soap/encoding/"[GblElm] }
  string_              = class;                 { "http://schemas.xmlsoap.org/soap/encoding/"[GblElm] }
  int                  = class;                 { "http://schemas.xmlsoap.org/soap/encoding/"[GblElm] }
  ID                   = class;                 { "http://schemas.xmlsoap.org/soap/encoding/"[GblElm] }
  catalogProductAttributeMediaTypeEntity = class;   { "urn:Magento"[GblCplx] }
  catalogProductImageFileEntity = class;        { "urn:Magento"[GblCplx] }
  catalogProductLinkEntity = class;             { "urn:Magento"[GblCplx] }
  catalogProductAttributeMediaCreateEntity = class;   { "urn:Magento"[GblCplx] }
  catalogAttributeEntity = class;               { "urn:Magento"[GblCplx] }
  catalogAttributeOptionEntity = class;         { "urn:Magento"[GblCplx] }
  catalogProductImageEntity = class;            { "urn:Magento"[GblCplx] }
  catalogProductAttributeOptionLabelEntity = class;   { "urn:Magento"[GblCplx] }
  catalogProductAttributeOptionEntityToAdd = class;   { "urn:Magento"[GblCplx] }
  catalogProductLinkAttributeEntity = class;    { "urn:Magento"[GblCplx] }
  catalogProductAttributeEntityToCreate = class;   { "urn:Magento"[GblCplx] }
  catalogProductAttributeEntityToUpdate = class;   { "urn:Magento"[GblCplx] }
  catalogProductAttributeEntity = class;        { "urn:Magento"[GblCplx] }
  catalogProductAttributeFrontendLabelEntity = class;   { "urn:Magento"[GblCplx] }
  catalogInventoryStockItemUpdateEntity = class;   { "urn:Magento"[GblCplx] }
  catalogProductAttributeSetEntity = class;     { "urn:Magento"[GblCplx] }
  catalogProductCreateEntity = class;           { "urn:Magento"[GblCplx] }
  catalogProductEntity = class;                 { "urn:Magento"[GblCplx] }
  catalogProductAdditionalAttributesEntity = class;   { "urn:Magento"[GblCplx] }
  catalogProductReturnEntity = class;           { "urn:Magento"[GblCplx] }
  catalogProductRequestAttributes = class;      { "urn:Magento"[GblCplx] }
  catalogCategoryEntityCreate = class;          { "urn:Magento"[GblCplx] }
  catalogAssignedProduct = class;               { "urn:Magento"[GblCplx] }
  catalogCategoryInfo  = class;                 { "urn:Magento"[GblCplx] }
  catalogCategoryEntityNoChildren = class;      { "urn:Magento"[GblCplx] }
  catalogProductTypeEntity = class;             { "urn:Magento"[GblCplx] }
  catalogProductTierPriceEntity = class;        { "urn:Magento"[GblCplx] }
  catalogCategoryEntity = class;                { "urn:Magento"[GblCplx] }
  catalogCategoryTree  = class;                 { "urn:Magento"[GblCplx] }

  salesOrderShipmentEntityArray = array of salesOrderShipmentEntity;   { "urn:Magento"[GblCplx] }
  salesOrderShipmentCommentEntityArray = array of salesOrderShipmentCommentEntity;   { "urn:Magento"[GblCplx] }
  orderItemIdQtyArray = array of orderItemIdQty;   { "urn:Magento"[GblCplx] }
  salesOrderShipmentTrackEntityArray = array of salesOrderShipmentTrackEntity;   { "urn:Magento"[GblCplx] }
  salesOrderShipmentItemEntityArray = array of salesOrderShipmentItemEntity;   { "urn:Magento"[GblCplx] }
  salesOrderCreditmemoCommentEntityArray = array of salesOrderCreditmemoCommentEntity;   { "urn:Magento"[GblCplx] }
  salesOrderCreditmemoItemEntityArray = array of salesOrderCreditmemoItemEntity;   { "urn:Magento"[GblCplx] }
  salesOrderCreditmemoEntityArray = array of salesOrderCreditmemoEntity;   { "urn:Magento"[GblCplx] }
  salesOrderInvoiceCommentEntityArray = array of salesOrderInvoiceCommentEntity;   { "urn:Magento"[GblCplx] }
  salesOrderInvoiceItemEntityArray = array of salesOrderInvoiceItemEntity;   { "urn:Magento"[GblCplx] }
  salesOrderInvoiceEntityArray = array of salesOrderInvoiceEntity;   { "urn:Magento"[GblCplx] }
  salesOrderItemEntityArray = array of salesOrderItemEntity;   { "urn:Magento"[GblCplx] }
  catalogProductCustomOptionValueListArray = array of catalogProductCustomOptionValueListEntity;   { "urn:Magento"[GblCplx] }
  catalogProductCustomOptionValueAddArray = array of catalogProductCustomOptionValueAddEntity;   { "urn:Magento"[GblCplx] }
  salesOrderStatusHistoryEntityArray = array of salesOrderStatusHistoryEntity;   { "urn:Magento"[GblCplx] }
  salesOrderListEntityArray = array of salesOrderListEntity;   { "urn:Magento"[GblCplx] }
  catalogProductCustomOptionTypesArray = array of catalogProductCustomOptionTypesEntity;   { "urn:Magento"[GblCplx] }
  catalogProductCustomOptionListArray = array of catalogProductCustomOptionListEntity;   { "urn:Magento"[GblCplx] }
  catalogProductCustomOptionAdditionalFieldsArray = array of catalogProductCustomOptionAdditionalFieldsEntity;   { "urn:Magento"[GblCplx] }
  giftMessageResponseArray = array of giftMessageResponse;   { "urn:Magento"[GblCplx] }
  giftMessageAssociativeProductsEntityArray = array of giftMessageAssociativeProductsEntity;   { "urn:Magento"[GblCplx] }


  // ************************************************************************ //
  // XML       : giftMessageAssociativeProductsEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  giftMessageAssociativeProductsEntity = class(TRemotable)
  private
    Fproduct: shoppingCartProductEntity;
    Fmessage_: giftMessageEntity;
  public
    destructor Destroy; override;
  published
    property product:  shoppingCartProductEntity  read Fproduct write Fproduct;
    property message_: giftMessageEntity          read Fmessage_ write Fmessage_;
  end;

  shoppingCartPaymentMethodResponseEntityArray = array of shoppingCartPaymentMethodResponseEntity;   { "urn:Magento"[GblCplx] }
  catalogProductTagListEntityArray = array of catalogProductTagListEntity;   { "urn:Magento"[GblCplx] }
  catalogProductDownloadableLinkSampleEntityArray = array of catalogProductDownloadableLinkSampleEntity;   { "urn:Magento"[GblCplx] }
  catalogProductDownloadableLinkEntityArray = array of catalogProductDownloadableLinkEntity;   { "urn:Magento"[GblCplx] }


  // ************************************************************************ //
  // XML       : catalogProductDownloadableLinkInfoEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogProductDownloadableLinkInfoEntity = class(TRemotable)
  private
    Flinks: catalogProductDownloadableLinkEntityArray;
    Fsamples: catalogProductDownloadableLinkSampleEntityArray;
  public
    destructor Destroy; override;
  published
    property links:   catalogProductDownloadableLinkEntityArray        read Flinks write Flinks;
    property samples: catalogProductDownloadableLinkSampleEntityArray  read Fsamples write Fsamples;
  end;

  catalogProductDownloadableLinkFileInfoEntityArray = array of catalogProductDownloadableLinkFileInfoEntity;   { "urn:Magento"[GblCplx] }
  shoppingCartItemEntityArray = array of shoppingCartItemEntity;   { "urn:Magento"[GblCplx] }
  shoppingCartTotalsEntityArray = array of shoppingCartTotalsEntity;   { "urn:Magento"[GblCplx] }
  catalogInventoryStockItemEntityArray = array of catalogInventoryStockItemEntity;   { "urn:Magento"[GblCplx] }
  catalogInventoryStockItemUpdateEntityArray = array of catalogInventoryStockItemUpdateEntity;   { "urn:Magento"[GblCplx] }
  shoppingCartCustomerAddressEntityArray = array of shoppingCartCustomerAddressEntity;   { "urn:Magento"[GblCplx] }
  shoppingCartShippingMethodEntityArray = array of shoppingCartShippingMethodEntity;   { "urn:Magento"[GblCplx] }
  shoppingCartLicenseEntityArray = array of shoppingCartLicenseEntity;   { "urn:Magento"[GblCplx] }
  shoppingCartProductEntityArray = array of shoppingCartProductEntity;   { "urn:Magento"[GblCplx] }
  shoppingCartProductResponseEntityArray = array of catalogProductEntity;   { "urn:Magento"[GblCplx] }
  ArrayOfExistsFaltures = array of existsFaltureEntity;   { "urn:Magento"[GblCplx] }
  storeEntityArray = array of storeEntity;      { "urn:Magento"[GblCplx] }
  ArrayOfApiMethods = array of apiMethodEntity;   { "urn:Magento"[GblCplx] }
  ArrayOfApis = array of apiEntity;             { "urn:Magento"[GblCplx] }
  customerGroupEntityArray = array of customerGroupEntity;   { "urn:Magento"[GblCplx] }
  customerAddressEntityArray = array of customerAddressEntityItem;   { "urn:Magento"[GblCplx] }
  customerCustomerEntityArray = array of customerCustomerEntity;   { "urn:Magento"[GblCplx] }
  directoryCountryEntityArray = array of directoryCountryEntity;   { "urn:Magento"[GblCplx] }
  directoryRegionEntityArray = array of directoryRegionEntity;   { "urn:Magento"[GblCplx] }
  complexFilterArray = array of complexFilter;   { "urn:Magento"[GblCplx] }


  // ************************************************************************ //
  // XML       : ID, global, <complexType>
  // Namespace : http://schemas.xmlsoap.org/soap/encoding/
  // ************************************************************************ //
  ID2 = class(TRemotable)
  private
    FText: string;
    Fid: string;
    Fid_Specified: boolean;
    Fhref: string;
    Fhref_Specified: boolean;
    procedure Setid(Index: Integer; const Astring: string);
    function  id_Specified(Index: Integer): boolean;
    procedure Sethref(Index: Integer; const Astring: string);
    function  href_Specified(Index: Integer): boolean;
  published
    property Text: string  read FText write FText;
    property id:   string  Index (IS_ATTR or IS_OPTN) read Fid write Setid stored id_Specified;
    property href: string  Index (IS_ATTR or IS_OPTN) read Fhref write Sethref stored href_Specified;
  end;



  // ************************************************************************ //
  // XML       : directoryRegionEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  directoryRegionEntity = class(TRemotable)
  private
    Fregion_id: string;
    Fcode: string;
    Fname_: string;
  published
    property region_id: string  read Fregion_id write Fregion_id;
    property code:      string  read Fcode write Fcode;
    property name_:     string  read Fname_ write Fname_;
  end;



  // ************************************************************************ //
  // XML       : complexFilter, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  complexFilter = class(TRemotable)
  private
    Fkey: string;
    Fvalue: associativeEntity;
  public
    destructor Destroy; override;
  published
    property key:   string             read Fkey write Fkey;
    property value: associativeEntity  read Fvalue write Fvalue;
  end;



  // ************************************************************************ //
  // XML       : existsFaltureEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  existsFaltureEntity = class(TRemotable)
  private
    Fcode: string;
    Fmessage_: string;
  published
    property code:     string  read Fcode write Fcode;
    property message_: string  read Fmessage_ write Fmessage_;
  end;



  // ************************************************************************ //
  // XML       : magentoInfoEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  magentoInfoEntity = class(TRemotable)
  private
    Fmagento_version: string;
    Fmagento_edition: string;
  published
    property magento_version: string  read Fmagento_version write Fmagento_version;
    property magento_edition: string  read Fmagento_edition write Fmagento_edition;
  end;



  // ************************************************************************ //
  // XML       : directoryCountryEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  directoryCountryEntity = class(TRemotable)
  private
    Fcountry_id: string;
    Fiso2_code: string;
    Fiso3_code: string;
    Fname_: string;
  published
    property country_id: string  read Fcountry_id write Fcountry_id;
    property iso2_code:  string  read Fiso2_code write Fiso2_code;
    property iso3_code:  string  read Fiso3_code write Fiso3_code;
    property name_:      string  read Fname_ write Fname_;
  end;



  // ************************************************************************ //
  // XML       : catalogProductCustomOptionAdditionalFieldsEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogProductCustomOptionAdditionalFieldsEntity = class(TRemotable)
  private
    Ftitle: string;
    Ftitle_Specified: boolean;
    Fprice: string;
    Fprice_Specified: boolean;
    Fprice_type: string;
    Fprice_type_Specified: boolean;
    Fsku: string;
    Fsku_Specified: boolean;
    Fmax_characters: string;
    Fmax_characters_Specified: boolean;
    Fsort_order: string;
    Fsort_order_Specified: boolean;
    Ffile_extension: string;
    Ffile_extension_Specified: boolean;
    Fimage_size_x: string;
    Fimage_size_x_Specified: boolean;
    Fimage_size_y: string;
    Fimage_size_y_Specified: boolean;
    Fvalue_id: string;
    Fvalue_id_Specified: boolean;
    procedure Settitle(Index: Integer; const Astring: string);
    function  title_Specified(Index: Integer): boolean;
    procedure Setprice(Index: Integer; const Astring: string);
    function  price_Specified(Index: Integer): boolean;
    procedure Setprice_type(Index: Integer; const Astring: string);
    function  price_type_Specified(Index: Integer): boolean;
    procedure Setsku(Index: Integer; const Astring: string);
    function  sku_Specified(Index: Integer): boolean;
    procedure Setmax_characters(Index: Integer; const Astring: string);
    function  max_characters_Specified(Index: Integer): boolean;
    procedure Setsort_order(Index: Integer; const Astring: string);
    function  sort_order_Specified(Index: Integer): boolean;
    procedure Setfile_extension(Index: Integer; const Astring: string);
    function  file_extension_Specified(Index: Integer): boolean;
    procedure Setimage_size_x(Index: Integer; const Astring: string);
    function  image_size_x_Specified(Index: Integer): boolean;
    procedure Setimage_size_y(Index: Integer; const Astring: string);
    function  image_size_y_Specified(Index: Integer): boolean;
    procedure Setvalue_id(Index: Integer; const Astring: string);
    function  value_id_Specified(Index: Integer): boolean;
  published
    property title:          string  Index (IS_OPTN) read Ftitle write Settitle stored title_Specified;
    property price:          string  Index (IS_OPTN) read Fprice write Setprice stored price_Specified;
    property price_type:     string  Index (IS_OPTN) read Fprice_type write Setprice_type stored price_type_Specified;
    property sku:            string  Index (IS_OPTN) read Fsku write Setsku stored sku_Specified;
    property max_characters: string  Index (IS_OPTN) read Fmax_characters write Setmax_characters stored max_characters_Specified;
    property sort_order:     string  Index (IS_OPTN) read Fsort_order write Setsort_order stored sort_order_Specified;
    property file_extension: string  Index (IS_OPTN) read Ffile_extension write Setfile_extension stored file_extension_Specified;
    property image_size_x:   string  Index (IS_OPTN) read Fimage_size_x write Setimage_size_x stored image_size_x_Specified;
    property image_size_y:   string  Index (IS_OPTN) read Fimage_size_y write Setimage_size_y stored image_size_y_Specified;
    property value_id:       string  Index (IS_OPTN) read Fvalue_id write Setvalue_id stored value_id_Specified;
  end;



  // ************************************************************************ //
  // XML       : shoppingCartPaymentMethodEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  shoppingCartPaymentMethodEntity = class(TRemotable)
  private
    Fpo_number: string;
    Fpo_number_Specified: boolean;
    Fmethod: string;
    Fmethod_Specified: boolean;
    Fcc_cid: string;
    Fcc_cid_Specified: boolean;
    Fcc_owner: string;
    Fcc_owner_Specified: boolean;
    Fcc_number: string;
    Fcc_number_Specified: boolean;
    Fcc_type: string;
    Fcc_type_Specified: boolean;
    Fcc_exp_year: string;
    Fcc_exp_year_Specified: boolean;
    Fcc_exp_month: string;
    Fcc_exp_month_Specified: boolean;
    procedure Setpo_number(Index: Integer; const Astring: string);
    function  po_number_Specified(Index: Integer): boolean;
    procedure Setmethod(Index: Integer; const Astring: string);
    function  method_Specified(Index: Integer): boolean;
    procedure Setcc_cid(Index: Integer; const Astring: string);
    function  cc_cid_Specified(Index: Integer): boolean;
    procedure Setcc_owner(Index: Integer; const Astring: string);
    function  cc_owner_Specified(Index: Integer): boolean;
    procedure Setcc_number(Index: Integer; const Astring: string);
    function  cc_number_Specified(Index: Integer): boolean;
    procedure Setcc_type(Index: Integer; const Astring: string);
    function  cc_type_Specified(Index: Integer): boolean;
    procedure Setcc_exp_year(Index: Integer; const Astring: string);
    function  cc_exp_year_Specified(Index: Integer): boolean;
    procedure Setcc_exp_month(Index: Integer; const Astring: string);
    function  cc_exp_month_Specified(Index: Integer): boolean;
  published
    property po_number:    string  Index (IS_OPTN) read Fpo_number write Setpo_number stored po_number_Specified;
    property method:       string  Index (IS_OPTN) read Fmethod write Setmethod stored method_Specified;
    property cc_cid:       string  Index (IS_OPTN) read Fcc_cid write Setcc_cid stored cc_cid_Specified;
    property cc_owner:     string  Index (IS_OPTN) read Fcc_owner write Setcc_owner stored cc_owner_Specified;
    property cc_number:    string  Index (IS_OPTN) read Fcc_number write Setcc_number stored cc_number_Specified;
    property cc_type:      string  Index (IS_OPTN) read Fcc_type write Setcc_type stored cc_type_Specified;
    property cc_exp_year:  string  Index (IS_OPTN) read Fcc_exp_year write Setcc_exp_year stored cc_exp_year_Specified;
    property cc_exp_month: string  Index (IS_OPTN) read Fcc_exp_month write Setcc_exp_month stored cc_exp_month_Specified;
  end;



  // ************************************************************************ //
  // XML       : catalogInventoryStockItemEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogInventoryStockItemEntity = class(TRemotable)
  private
    Fproduct_id: string;
    Fproduct_id_Specified: boolean;
    Fsku: string;
    Fsku_Specified: boolean;
    Fqty: string;
    Fqty_Specified: boolean;
    Fis_in_stock: string;
    Fis_in_stock_Specified: boolean;
    procedure Setproduct_id(Index: Integer; const Astring: string);
    function  product_id_Specified(Index: Integer): boolean;
    procedure Setsku(Index: Integer; const Astring: string);
    function  sku_Specified(Index: Integer): boolean;
    procedure Setqty(Index: Integer; const Astring: string);
    function  qty_Specified(Index: Integer): boolean;
    procedure Setis_in_stock(Index: Integer; const Astring: string);
    function  is_in_stock_Specified(Index: Integer): boolean;
  published
    property product_id:  string  Index (IS_OPTN) read Fproduct_id write Setproduct_id stored product_id_Specified;
    property sku:         string  Index (IS_OPTN) read Fsku write Setsku stored sku_Specified;
    property qty:         string  Index (IS_OPTN) read Fqty write Setqty stored qty_Specified;
    property is_in_stock: string  Index (IS_OPTN) read Fis_in_stock write Setis_in_stock stored is_in_stock_Specified;
  end;



  // ************************************************************************ //
  // XML       : shoppingCartPaymentEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  shoppingCartPaymentEntity = class(TRemotable)
  private
    Fpayment_id: string;
    Fpayment_id_Specified: boolean;
    Fcreated_at: string;
    Fcreated_at_Specified: boolean;
    Fupdated_at: string;
    Fupdated_at_Specified: boolean;
    Fmethod: string;
    Fmethod_Specified: boolean;
    Fcc_type: string;
    Fcc_type_Specified: boolean;
    Fcc_number_enc: string;
    Fcc_number_enc_Specified: boolean;
    Fcc_last4: string;
    Fcc_last4_Specified: boolean;
    Fcc_cid_enc: string;
    Fcc_cid_enc_Specified: boolean;
    Fcc_owner: string;
    Fcc_owner_Specified: boolean;
    Fcc_exp_month: string;
    Fcc_exp_month_Specified: boolean;
    Fcc_exp_year: string;
    Fcc_exp_year_Specified: boolean;
    Fcc_ss_owner: string;
    Fcc_ss_owner_Specified: boolean;
    Fcc_ss_start_month: string;
    Fcc_ss_start_month_Specified: boolean;
    Fcc_ss_start_year: string;
    Fcc_ss_start_year_Specified: boolean;
    Fcc_ss_issue: string;
    Fcc_ss_issue_Specified: boolean;
    Fpo_number: string;
    Fpo_number_Specified: boolean;
    Fadditional_data: string;
    Fadditional_data_Specified: boolean;
    Fadditional_information: string;
    Fadditional_information_Specified: boolean;
    procedure Setpayment_id(Index: Integer; const Astring: string);
    function  payment_id_Specified(Index: Integer): boolean;
    procedure Setcreated_at(Index: Integer; const Astring: string);
    function  created_at_Specified(Index: Integer): boolean;
    procedure Setupdated_at(Index: Integer; const Astring: string);
    function  updated_at_Specified(Index: Integer): boolean;
    procedure Setmethod(Index: Integer; const Astring: string);
    function  method_Specified(Index: Integer): boolean;
    procedure Setcc_type(Index: Integer; const Astring: string);
    function  cc_type_Specified(Index: Integer): boolean;
    procedure Setcc_number_enc(Index: Integer; const Astring: string);
    function  cc_number_enc_Specified(Index: Integer): boolean;
    procedure Setcc_last4(Index: Integer; const Astring: string);
    function  cc_last4_Specified(Index: Integer): boolean;
    procedure Setcc_cid_enc(Index: Integer; const Astring: string);
    function  cc_cid_enc_Specified(Index: Integer): boolean;
    procedure Setcc_owner(Index: Integer; const Astring: string);
    function  cc_owner_Specified(Index: Integer): boolean;
    procedure Setcc_exp_month(Index: Integer; const Astring: string);
    function  cc_exp_month_Specified(Index: Integer): boolean;
    procedure Setcc_exp_year(Index: Integer; const Astring: string);
    function  cc_exp_year_Specified(Index: Integer): boolean;
    procedure Setcc_ss_owner(Index: Integer; const Astring: string);
    function  cc_ss_owner_Specified(Index: Integer): boolean;
    procedure Setcc_ss_start_month(Index: Integer; const Astring: string);
    function  cc_ss_start_month_Specified(Index: Integer): boolean;
    procedure Setcc_ss_start_year(Index: Integer; const Astring: string);
    function  cc_ss_start_year_Specified(Index: Integer): boolean;
    procedure Setcc_ss_issue(Index: Integer; const Astring: string);
    function  cc_ss_issue_Specified(Index: Integer): boolean;
    procedure Setpo_number(Index: Integer; const Astring: string);
    function  po_number_Specified(Index: Integer): boolean;
    procedure Setadditional_data(Index: Integer; const Astring: string);
    function  additional_data_Specified(Index: Integer): boolean;
    procedure Setadditional_information(Index: Integer; const Astring: string);
    function  additional_information_Specified(Index: Integer): boolean;
  published
    property payment_id:             string  Index (IS_OPTN) read Fpayment_id write Setpayment_id stored payment_id_Specified;
    property created_at:             string  Index (IS_OPTN) read Fcreated_at write Setcreated_at stored created_at_Specified;
    property updated_at:             string  Index (IS_OPTN) read Fupdated_at write Setupdated_at stored updated_at_Specified;
    property method:                 string  Index (IS_OPTN) read Fmethod write Setmethod stored method_Specified;
    property cc_type:                string  Index (IS_OPTN) read Fcc_type write Setcc_type stored cc_type_Specified;
    property cc_number_enc:          string  Index (IS_OPTN) read Fcc_number_enc write Setcc_number_enc stored cc_number_enc_Specified;
    property cc_last4:               string  Index (IS_OPTN) read Fcc_last4 write Setcc_last4 stored cc_last4_Specified;
    property cc_cid_enc:             string  Index (IS_OPTN) read Fcc_cid_enc write Setcc_cid_enc stored cc_cid_enc_Specified;
    property cc_owner:               string  Index (IS_OPTN) read Fcc_owner write Setcc_owner stored cc_owner_Specified;
    property cc_exp_month:           string  Index (IS_OPTN) read Fcc_exp_month write Setcc_exp_month stored cc_exp_month_Specified;
    property cc_exp_year:            string  Index (IS_OPTN) read Fcc_exp_year write Setcc_exp_year stored cc_exp_year_Specified;
    property cc_ss_owner:            string  Index (IS_OPTN) read Fcc_ss_owner write Setcc_ss_owner stored cc_ss_owner_Specified;
    property cc_ss_start_month:      string  Index (IS_OPTN) read Fcc_ss_start_month write Setcc_ss_start_month stored cc_ss_start_month_Specified;
    property cc_ss_start_year:       string  Index (IS_OPTN) read Fcc_ss_start_year write Setcc_ss_start_year stored cc_ss_start_year_Specified;
    property cc_ss_issue:            string  Index (IS_OPTN) read Fcc_ss_issue write Setcc_ss_issue stored cc_ss_issue_Specified;
    property po_number:              string  Index (IS_OPTN) read Fpo_number write Setpo_number stored po_number_Specified;
    property additional_data:        string  Index (IS_OPTN) read Fadditional_data write Setadditional_data stored additional_data_Specified;
    property additional_information: string  Index (IS_OPTN) read Fadditional_information write Setadditional_information stored additional_information_Specified;
  end;



  // ************************************************************************ //
  // XML       : catalogProductDownloadableLinkAddSampleEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogProductDownloadableLinkAddSampleEntity = class(TRemotable)
  private
    Ftype_: string;
    Ftype__Specified: boolean;
    Ffile_: catalogProductDownloadableLinkFileEntity;
    Ffile__Specified: boolean;
    Furl: string;
    Furl_Specified: boolean;
    procedure Settype_(Index: Integer; const Astring: string);
    function  type__Specified(Index: Integer): boolean;
    procedure Setfile_(Index: Integer; const AcatalogProductDownloadableLinkFileEntity: catalogProductDownloadableLinkFileEntity);
    function  file__Specified(Index: Integer): boolean;
    procedure Seturl(Index: Integer; const Astring: string);
    function  url_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property type_: string                                    Index (IS_OPTN) read Ftype_ write Settype_ stored type__Specified;
    property file_: catalogProductDownloadableLinkFileEntity  Index (IS_OPTN) read Ffile_ write Setfile_ stored file__Specified;
    property url:   string                                    Index (IS_OPTN) read Furl write Seturl stored url_Specified;
  end;



  // ************************************************************************ //
  // XML       : catalogProductDownloadableLinkSampleEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogProductDownloadableLinkSampleEntity = class(TRemotable)
  private
    Fsample_id: string;
    Fproduct_id: string;
    Fsample_file: string;
    Fsample_file_Specified: boolean;
    Fsample_url: string;
    Fsample_url_Specified: boolean;
    Fsample_type: string;
    Fsort_order: string;
    Fdefault_title: string;
    Fstore_title: string;
    Ftitle: string;
    procedure Setsample_file(Index: Integer; const Astring: string);
    function  sample_file_Specified(Index: Integer): boolean;
    procedure Setsample_url(Index: Integer; const Astring: string);
    function  sample_url_Specified(Index: Integer): boolean;
  published
    property sample_id:     string  read Fsample_id write Fsample_id;
    property product_id:    string  read Fproduct_id write Fproduct_id;
    property sample_file:   string  Index (IS_OPTN) read Fsample_file write Setsample_file stored sample_file_Specified;
    property sample_url:    string  Index (IS_OPTN) read Fsample_url write Setsample_url stored sample_url_Specified;
    property sample_type:   string  read Fsample_type write Fsample_type;
    property sort_order:    string  read Fsort_order write Fsort_order;
    property default_title: string  read Fdefault_title write Fdefault_title;
    property store_title:   string  read Fstore_title write Fstore_title;
    property title:         string  read Ftitle write Ftitle;
  end;



  // ************************************************************************ //
  // XML       : catalogProductDownloadableLinkFileEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogProductDownloadableLinkFileEntity = class(TRemotable)
  private
    Fname_: string;
    Fname__Specified: boolean;
    Fbase64_content: string;
    Fbase64_content_Specified: boolean;
    procedure Setname_(Index: Integer; const Astring: string);
    function  name__Specified(Index: Integer): boolean;
    procedure Setbase64_content(Index: Integer; const Astring: string);
    function  base64_content_Specified(Index: Integer): boolean;
  published
    property name_:          string  Index (IS_OPTN) read Fname_ write Setname_ stored name__Specified;
    property base64_content: string  Index (IS_OPTN) read Fbase64_content write Setbase64_content stored base64_content_Specified;
  end;



  // ************************************************************************ //
  // XML       : catalogProductTagAddEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogProductTagAddEntity = class(TRemotable)
  private
    Ftag: string;
    Fproduct_id: string;
    Fcustomer_id: string;
    Fstore: string;
  published
    property tag:         string  read Ftag write Ftag;
    property product_id:  string  read Fproduct_id write Fproduct_id;
    property customer_id: string  read Fcustomer_id write Fcustomer_id;
    property store:       string  read Fstore write Fstore;
  end;



  // ************************************************************************ //
  // XML       : catalogProductTagUpdateEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogProductTagUpdateEntity = class(TRemotable)
  private
    Fname_: string;
    Fname__Specified: boolean;
    Fstatus: string;
    Fstatus_Specified: boolean;
    Fbase_popularity: string;
    Fbase_popularity_Specified: boolean;
    procedure Setname_(Index: Integer; const Astring: string);
    function  name__Specified(Index: Integer): boolean;
    procedure Setstatus(Index: Integer; const Astring: string);
    function  status_Specified(Index: Integer): boolean;
    procedure Setbase_popularity(Index: Integer; const Astring: string);
    function  base_popularity_Specified(Index: Integer): boolean;
  published
    property name_:           string  Index (IS_OPTN) read Fname_ write Setname_ stored name__Specified;
    property status:          string  Index (IS_OPTN) read Fstatus write Setstatus stored status_Specified;
    property base_popularity: string  Index (IS_OPTN) read Fbase_popularity write Setbase_popularity stored base_popularity_Specified;
  end;



  // ************************************************************************ //
  // XML       : catalogProductTagListEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogProductTagListEntity = class(TRemotable)
  private
    Ftag_id: string;
    Fname_: string;
  published
    property tag_id: string  read Ftag_id write Ftag_id;
    property name_:  string  read Fname_ write Fname_;
  end;



  // ************************************************************************ //
  // XML       : giftMessageEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  giftMessageEntity = class(TRemotable)
  private
    Ffrom: string;
    Ffrom_Specified: boolean;
    Fto_: string;
    Fto__Specified: boolean;
    Fmessage_: string;
    Fmessage__Specified: boolean;
    procedure Setfrom(Index: Integer; const Astring: string);
    function  from_Specified(Index: Integer): boolean;
    procedure Setto_(Index: Integer; const Astring: string);
    function  to__Specified(Index: Integer): boolean;
    procedure Setmessage_(Index: Integer; const Astring: string);
    function  message__Specified(Index: Integer): boolean;
  published
    property from:     string  Index (IS_OPTN) read Ffrom write Setfrom stored from_Specified;
    property to_:      string  Index (IS_OPTN) read Fto_ write Setto_ stored to__Specified;
    property message_: string  Index (IS_OPTN) read Fmessage_ write Setmessage_ stored message__Specified;
  end;



  // ************************************************************************ //
  // XML       : catalogProductCustomOptionTypesEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogProductCustomOptionTypesEntity = class(TRemotable)
  private
    Flabel_: string;
    Fvalue: string;
  published
    property label_: string  read Flabel_ write Flabel_;
    property value:  string  read Fvalue write Fvalue;
  end;



  // ************************************************************************ //
  // XML       : salesOrderPaymentEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  salesOrderPaymentEntity = class(TRemotable)
  private
    Fincrement_id: string;
    Fincrement_id_Specified: boolean;
    Fparent_id: string;
    Fparent_id_Specified: boolean;
    Fcreated_at: string;
    Fcreated_at_Specified: boolean;
    Fupdated_at: string;
    Fupdated_at_Specified: boolean;
    Fis_active: string;
    Fis_active_Specified: boolean;
    Famount_ordered: string;
    Famount_ordered_Specified: boolean;
    Fshipping_amount: string;
    Fshipping_amount_Specified: boolean;
    Fbase_amount_ordered: string;
    Fbase_amount_ordered_Specified: boolean;
    Fbase_shipping_amount: string;
    Fbase_shipping_amount_Specified: boolean;
    Fmethod: string;
    Fmethod_Specified: boolean;
    Fpo_number: string;
    Fpo_number_Specified: boolean;
    Fcc_type: string;
    Fcc_type_Specified: boolean;
    Fcc_number_enc: string;
    Fcc_number_enc_Specified: boolean;
    Fcc_last4: string;
    Fcc_last4_Specified: boolean;
    Fcc_owner: string;
    Fcc_owner_Specified: boolean;
    Fcc_exp_month: string;
    Fcc_exp_month_Specified: boolean;
    Fcc_exp_year: string;
    Fcc_exp_year_Specified: boolean;
    Fcc_ss_start_month: string;
    Fcc_ss_start_month_Specified: boolean;
    Fcc_ss_start_year: string;
    Fcc_ss_start_year_Specified: boolean;
    Fpayment_id: string;
    Fpayment_id_Specified: boolean;
    procedure Setincrement_id(Index: Integer; const Astring: string);
    function  increment_id_Specified(Index: Integer): boolean;
    procedure Setparent_id(Index: Integer; const Astring: string);
    function  parent_id_Specified(Index: Integer): boolean;
    procedure Setcreated_at(Index: Integer; const Astring: string);
    function  created_at_Specified(Index: Integer): boolean;
    procedure Setupdated_at(Index: Integer; const Astring: string);
    function  updated_at_Specified(Index: Integer): boolean;
    procedure Setis_active(Index: Integer; const Astring: string);
    function  is_active_Specified(Index: Integer): boolean;
    procedure Setamount_ordered(Index: Integer; const Astring: string);
    function  amount_ordered_Specified(Index: Integer): boolean;
    procedure Setshipping_amount(Index: Integer; const Astring: string);
    function  shipping_amount_Specified(Index: Integer): boolean;
    procedure Setbase_amount_ordered(Index: Integer; const Astring: string);
    function  base_amount_ordered_Specified(Index: Integer): boolean;
    procedure Setbase_shipping_amount(Index: Integer; const Astring: string);
    function  base_shipping_amount_Specified(Index: Integer): boolean;
    procedure Setmethod(Index: Integer; const Astring: string);
    function  method_Specified(Index: Integer): boolean;
    procedure Setpo_number(Index: Integer; const Astring: string);
    function  po_number_Specified(Index: Integer): boolean;
    procedure Setcc_type(Index: Integer; const Astring: string);
    function  cc_type_Specified(Index: Integer): boolean;
    procedure Setcc_number_enc(Index: Integer; const Astring: string);
    function  cc_number_enc_Specified(Index: Integer): boolean;
    procedure Setcc_last4(Index: Integer; const Astring: string);
    function  cc_last4_Specified(Index: Integer): boolean;
    procedure Setcc_owner(Index: Integer; const Astring: string);
    function  cc_owner_Specified(Index: Integer): boolean;
    procedure Setcc_exp_month(Index: Integer; const Astring: string);
    function  cc_exp_month_Specified(Index: Integer): boolean;
    procedure Setcc_exp_year(Index: Integer; const Astring: string);
    function  cc_exp_year_Specified(Index: Integer): boolean;
    procedure Setcc_ss_start_month(Index: Integer; const Astring: string);
    function  cc_ss_start_month_Specified(Index: Integer): boolean;
    procedure Setcc_ss_start_year(Index: Integer; const Astring: string);
    function  cc_ss_start_year_Specified(Index: Integer): boolean;
    procedure Setpayment_id(Index: Integer; const Astring: string);
    function  payment_id_Specified(Index: Integer): boolean;
  published
    property increment_id:         string  Index (IS_OPTN) read Fincrement_id write Setincrement_id stored increment_id_Specified;
    property parent_id:            string  Index (IS_OPTN) read Fparent_id write Setparent_id stored parent_id_Specified;
    property created_at:           string  Index (IS_OPTN) read Fcreated_at write Setcreated_at stored created_at_Specified;
    property updated_at:           string  Index (IS_OPTN) read Fupdated_at write Setupdated_at stored updated_at_Specified;
    property is_active:            string  Index (IS_OPTN) read Fis_active write Setis_active stored is_active_Specified;
    property amount_ordered:       string  Index (IS_OPTN) read Famount_ordered write Setamount_ordered stored amount_ordered_Specified;
    property shipping_amount:      string  Index (IS_OPTN) read Fshipping_amount write Setshipping_amount stored shipping_amount_Specified;
    property base_amount_ordered:  string  Index (IS_OPTN) read Fbase_amount_ordered write Setbase_amount_ordered stored base_amount_ordered_Specified;
    property base_shipping_amount: string  Index (IS_OPTN) read Fbase_shipping_amount write Setbase_shipping_amount stored base_shipping_amount_Specified;
    property method:               string  Index (IS_OPTN) read Fmethod write Setmethod stored method_Specified;
    property po_number:            string  Index (IS_OPTN) read Fpo_number write Setpo_number stored po_number_Specified;
    property cc_type:              string  Index (IS_OPTN) read Fcc_type write Setcc_type stored cc_type_Specified;
    property cc_number_enc:        string  Index (IS_OPTN) read Fcc_number_enc write Setcc_number_enc stored cc_number_enc_Specified;
    property cc_last4:             string  Index (IS_OPTN) read Fcc_last4 write Setcc_last4 stored cc_last4_Specified;
    property cc_owner:             string  Index (IS_OPTN) read Fcc_owner write Setcc_owner stored cc_owner_Specified;
    property cc_exp_month:         string  Index (IS_OPTN) read Fcc_exp_month write Setcc_exp_month stored cc_exp_month_Specified;
    property cc_exp_year:          string  Index (IS_OPTN) read Fcc_exp_year write Setcc_exp_year stored cc_exp_year_Specified;
    property cc_ss_start_month:    string  Index (IS_OPTN) read Fcc_ss_start_month write Setcc_ss_start_month stored cc_ss_start_month_Specified;
    property cc_ss_start_year:     string  Index (IS_OPTN) read Fcc_ss_start_year write Setcc_ss_start_year stored cc_ss_start_year_Specified;
    property payment_id:           string  Index (IS_OPTN) read Fpayment_id write Setpayment_id stored payment_id_Specified;
  end;



  // ************************************************************************ //
  // XML       : salesOrderItemEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  salesOrderItemEntity = class(TRemotable)
  private
    Fitem_id: string;
    Fitem_id_Specified: boolean;
    Forder_id: string;
    Forder_id_Specified: boolean;
    Fquote_item_id: string;
    Fquote_item_id_Specified: boolean;
    Fcreated_at: string;
    Fcreated_at_Specified: boolean;
    Fupdated_at: string;
    Fupdated_at_Specified: boolean;
    Fproduct_id: string;
    Fproduct_id_Specified: boolean;
    Fproduct_type: string;
    Fproduct_type_Specified: boolean;
    Fproduct_options: string;
    Fproduct_options_Specified: boolean;
    Fweight: string;
    Fweight_Specified: boolean;
    Fis_virtual: string;
    Fis_virtual_Specified: boolean;
    Fsku: string;
    Fsku_Specified: boolean;
    Fname_: string;
    Fname__Specified: boolean;
    Fapplied_rule_ids: string;
    Fapplied_rule_ids_Specified: boolean;
    Ffree_shipping: string;
    Ffree_shipping_Specified: boolean;
    Fis_qty_decimal: string;
    Fis_qty_decimal_Specified: boolean;
    Fno_discount: string;
    Fno_discount_Specified: boolean;
    Fqty_canceled: string;
    Fqty_canceled_Specified: boolean;
    Fqty_invoiced: string;
    Fqty_invoiced_Specified: boolean;
    Fqty_ordered: string;
    Fqty_ordered_Specified: boolean;
    Fqty_refunded: string;
    Fqty_refunded_Specified: boolean;
    Fqty_shipped: string;
    Fqty_shipped_Specified: boolean;
    Fcost: string;
    Fcost_Specified: boolean;
    Fprice: string;
    Fprice_Specified: boolean;
    Fbase_price: string;
    Fbase_price_Specified: boolean;
    Foriginal_price: string;
    Foriginal_price_Specified: boolean;
    Fbase_original_price: string;
    Fbase_original_price_Specified: boolean;
    Ftax_percent: string;
    Ftax_percent_Specified: boolean;
    Ftax_amount: string;
    Ftax_amount_Specified: boolean;
    Fbase_tax_amount: string;
    Fbase_tax_amount_Specified: boolean;
    Ftax_invoiced: string;
    Ftax_invoiced_Specified: boolean;
    Fbase_tax_invoiced: string;
    Fbase_tax_invoiced_Specified: boolean;
    Fdiscount_percent: string;
    Fdiscount_percent_Specified: boolean;
    Fdiscount_amount: string;
    Fdiscount_amount_Specified: boolean;
    Fbase_discount_amount: string;
    Fbase_discount_amount_Specified: boolean;
    Fdiscount_invoiced: string;
    Fdiscount_invoiced_Specified: boolean;
    Fbase_discount_invoiced: string;
    Fbase_discount_invoiced_Specified: boolean;
    Famount_refunded: string;
    Famount_refunded_Specified: boolean;
    Fbase_amount_refunded: string;
    Fbase_amount_refunded_Specified: boolean;
    Frow_total: string;
    Frow_total_Specified: boolean;
    Fbase_row_total: string;
    Fbase_row_total_Specified: boolean;
    Frow_invoiced: string;
    Frow_invoiced_Specified: boolean;
    Fbase_row_invoiced: string;
    Fbase_row_invoiced_Specified: boolean;
    Frow_weight: string;
    Frow_weight_Specified: boolean;
    Fgift_message_id: string;
    Fgift_message_id_Specified: boolean;
    Fgift_message: string;
    Fgift_message_Specified: boolean;
    Fgift_message_available: string;
    Fgift_message_available_Specified: boolean;
    Fbase_tax_before_discount: string;
    Fbase_tax_before_discount_Specified: boolean;
    Ftax_before_discount: string;
    Ftax_before_discount_Specified: boolean;
    Fweee_tax_applied: string;
    Fweee_tax_applied_Specified: boolean;
    Fweee_tax_applied_amount: string;
    Fweee_tax_applied_amount_Specified: boolean;
    Fweee_tax_applied_row_amount: string;
    Fweee_tax_applied_row_amount_Specified: boolean;
    Fbase_weee_tax_applied_amount: string;
    Fbase_weee_tax_applied_amount_Specified: boolean;
    Fbase_weee_tax_applied_row_amount: string;
    Fbase_weee_tax_applied_row_amount_Specified: boolean;
    Fweee_tax_disposition: string;
    Fweee_tax_disposition_Specified: boolean;
    Fweee_tax_row_disposition: string;
    Fweee_tax_row_disposition_Specified: boolean;
    Fbase_weee_tax_disposition: string;
    Fbase_weee_tax_disposition_Specified: boolean;
    Fbase_weee_tax_row_disposition: string;
    Fbase_weee_tax_row_disposition_Specified: boolean;
    procedure Setitem_id(Index: Integer; const Astring: string);
    function  item_id_Specified(Index: Integer): boolean;
    procedure Setorder_id(Index: Integer; const Astring: string);
    function  order_id_Specified(Index: Integer): boolean;
    procedure Setquote_item_id(Index: Integer; const Astring: string);
    function  quote_item_id_Specified(Index: Integer): boolean;
    procedure Setcreated_at(Index: Integer; const Astring: string);
    function  created_at_Specified(Index: Integer): boolean;
    procedure Setupdated_at(Index: Integer; const Astring: string);
    function  updated_at_Specified(Index: Integer): boolean;
    procedure Setproduct_id(Index: Integer; const Astring: string);
    function  product_id_Specified(Index: Integer): boolean;
    procedure Setproduct_type(Index: Integer; const Astring: string);
    function  product_type_Specified(Index: Integer): boolean;
    procedure Setproduct_options(Index: Integer; const Astring: string);
    function  product_options_Specified(Index: Integer): boolean;
    procedure Setweight(Index: Integer; const Astring: string);
    function  weight_Specified(Index: Integer): boolean;
    procedure Setis_virtual(Index: Integer; const Astring: string);
    function  is_virtual_Specified(Index: Integer): boolean;
    procedure Setsku(Index: Integer; const Astring: string);
    function  sku_Specified(Index: Integer): boolean;
    procedure Setname_(Index: Integer; const Astring: string);
    function  name__Specified(Index: Integer): boolean;
    procedure Setapplied_rule_ids(Index: Integer; const Astring: string);
    function  applied_rule_ids_Specified(Index: Integer): boolean;
    procedure Setfree_shipping(Index: Integer; const Astring: string);
    function  free_shipping_Specified(Index: Integer): boolean;
    procedure Setis_qty_decimal(Index: Integer; const Astring: string);
    function  is_qty_decimal_Specified(Index: Integer): boolean;
    procedure Setno_discount(Index: Integer; const Astring: string);
    function  no_discount_Specified(Index: Integer): boolean;
    procedure Setqty_canceled(Index: Integer; const Astring: string);
    function  qty_canceled_Specified(Index: Integer): boolean;
    procedure Setqty_invoiced(Index: Integer; const Astring: string);
    function  qty_invoiced_Specified(Index: Integer): boolean;
    procedure Setqty_ordered(Index: Integer; const Astring: string);
    function  qty_ordered_Specified(Index: Integer): boolean;
    procedure Setqty_refunded(Index: Integer; const Astring: string);
    function  qty_refunded_Specified(Index: Integer): boolean;
    procedure Setqty_shipped(Index: Integer; const Astring: string);
    function  qty_shipped_Specified(Index: Integer): boolean;
    procedure Setcost(Index: Integer; const Astring: string);
    function  cost_Specified(Index: Integer): boolean;
    procedure Setprice(Index: Integer; const Astring: string);
    function  price_Specified(Index: Integer): boolean;
    procedure Setbase_price(Index: Integer; const Astring: string);
    function  base_price_Specified(Index: Integer): boolean;
    procedure Setoriginal_price(Index: Integer; const Astring: string);
    function  original_price_Specified(Index: Integer): boolean;
    procedure Setbase_original_price(Index: Integer; const Astring: string);
    function  base_original_price_Specified(Index: Integer): boolean;
    procedure Settax_percent(Index: Integer; const Astring: string);
    function  tax_percent_Specified(Index: Integer): boolean;
    procedure Settax_amount(Index: Integer; const Astring: string);
    function  tax_amount_Specified(Index: Integer): boolean;
    procedure Setbase_tax_amount(Index: Integer; const Astring: string);
    function  base_tax_amount_Specified(Index: Integer): boolean;
    procedure Settax_invoiced(Index: Integer; const Astring: string);
    function  tax_invoiced_Specified(Index: Integer): boolean;
    procedure Setbase_tax_invoiced(Index: Integer; const Astring: string);
    function  base_tax_invoiced_Specified(Index: Integer): boolean;
    procedure Setdiscount_percent(Index: Integer; const Astring: string);
    function  discount_percent_Specified(Index: Integer): boolean;
    procedure Setdiscount_amount(Index: Integer; const Astring: string);
    function  discount_amount_Specified(Index: Integer): boolean;
    procedure Setbase_discount_amount(Index: Integer; const Astring: string);
    function  base_discount_amount_Specified(Index: Integer): boolean;
    procedure Setdiscount_invoiced(Index: Integer; const Astring: string);
    function  discount_invoiced_Specified(Index: Integer): boolean;
    procedure Setbase_discount_invoiced(Index: Integer; const Astring: string);
    function  base_discount_invoiced_Specified(Index: Integer): boolean;
    procedure Setamount_refunded(Index: Integer; const Astring: string);
    function  amount_refunded_Specified(Index: Integer): boolean;
    procedure Setbase_amount_refunded(Index: Integer; const Astring: string);
    function  base_amount_refunded_Specified(Index: Integer): boolean;
    procedure Setrow_total(Index: Integer; const Astring: string);
    function  row_total_Specified(Index: Integer): boolean;
    procedure Setbase_row_total(Index: Integer; const Astring: string);
    function  base_row_total_Specified(Index: Integer): boolean;
    procedure Setrow_invoiced(Index: Integer; const Astring: string);
    function  row_invoiced_Specified(Index: Integer): boolean;
    procedure Setbase_row_invoiced(Index: Integer; const Astring: string);
    function  base_row_invoiced_Specified(Index: Integer): boolean;
    procedure Setrow_weight(Index: Integer; const Astring: string);
    function  row_weight_Specified(Index: Integer): boolean;
    procedure Setgift_message_id(Index: Integer; const Astring: string);
    function  gift_message_id_Specified(Index: Integer): boolean;
    procedure Setgift_message(Index: Integer; const Astring: string);
    function  gift_message_Specified(Index: Integer): boolean;
    procedure Setgift_message_available(Index: Integer; const Astring: string);
    function  gift_message_available_Specified(Index: Integer): boolean;
    procedure Setbase_tax_before_discount(Index: Integer; const Astring: string);
    function  base_tax_before_discount_Specified(Index: Integer): boolean;
    procedure Settax_before_discount(Index: Integer; const Astring: string);
    function  tax_before_discount_Specified(Index: Integer): boolean;
    procedure Setweee_tax_applied(Index: Integer; const Astring: string);
    function  weee_tax_applied_Specified(Index: Integer): boolean;
    procedure Setweee_tax_applied_amount(Index: Integer; const Astring: string);
    function  weee_tax_applied_amount_Specified(Index: Integer): boolean;
    procedure Setweee_tax_applied_row_amount(Index: Integer; const Astring: string);
    function  weee_tax_applied_row_amount_Specified(Index: Integer): boolean;
    procedure Setbase_weee_tax_applied_amount(Index: Integer; const Astring: string);
    function  base_weee_tax_applied_amount_Specified(Index: Integer): boolean;
    procedure Setbase_weee_tax_applied_row_amount(Index: Integer; const Astring: string);
    function  base_weee_tax_applied_row_amount_Specified(Index: Integer): boolean;
    procedure Setweee_tax_disposition(Index: Integer; const Astring: string);
    function  weee_tax_disposition_Specified(Index: Integer): boolean;
    procedure Setweee_tax_row_disposition(Index: Integer; const Astring: string);
    function  weee_tax_row_disposition_Specified(Index: Integer): boolean;
    procedure Setbase_weee_tax_disposition(Index: Integer; const Astring: string);
    function  base_weee_tax_disposition_Specified(Index: Integer): boolean;
    procedure Setbase_weee_tax_row_disposition(Index: Integer; const Astring: string);
    function  base_weee_tax_row_disposition_Specified(Index: Integer): boolean;
  published
    property item_id:                          string  Index (IS_OPTN) read Fitem_id write Setitem_id stored item_id_Specified;
    property order_id:                         string  Index (IS_OPTN) read Forder_id write Setorder_id stored order_id_Specified;
    property quote_item_id:                    string  Index (IS_OPTN) read Fquote_item_id write Setquote_item_id stored quote_item_id_Specified;
    property created_at:                       string  Index (IS_OPTN) read Fcreated_at write Setcreated_at stored created_at_Specified;
    property updated_at:                       string  Index (IS_OPTN) read Fupdated_at write Setupdated_at stored updated_at_Specified;
    property product_id:                       string  Index (IS_OPTN) read Fproduct_id write Setproduct_id stored product_id_Specified;
    property product_type:                     string  Index (IS_OPTN) read Fproduct_type write Setproduct_type stored product_type_Specified;
    property product_options:                  string  Index (IS_OPTN) read Fproduct_options write Setproduct_options stored product_options_Specified;
    property weight:                           string  Index (IS_OPTN) read Fweight write Setweight stored weight_Specified;
    property is_virtual:                       string  Index (IS_OPTN) read Fis_virtual write Setis_virtual stored is_virtual_Specified;
    property sku:                              string  Index (IS_OPTN) read Fsku write Setsku stored sku_Specified;
    property name_:                            string  Index (IS_OPTN) read Fname_ write Setname_ stored name__Specified;
    property applied_rule_ids:                 string  Index (IS_OPTN) read Fapplied_rule_ids write Setapplied_rule_ids stored applied_rule_ids_Specified;
    property free_shipping:                    string  Index (IS_OPTN) read Ffree_shipping write Setfree_shipping stored free_shipping_Specified;
    property is_qty_decimal:                   string  Index (IS_OPTN) read Fis_qty_decimal write Setis_qty_decimal stored is_qty_decimal_Specified;
    property no_discount:                      string  Index (IS_OPTN) read Fno_discount write Setno_discount stored no_discount_Specified;
    property qty_canceled:                     string  Index (IS_OPTN) read Fqty_canceled write Setqty_canceled stored qty_canceled_Specified;
    property qty_invoiced:                     string  Index (IS_OPTN) read Fqty_invoiced write Setqty_invoiced stored qty_invoiced_Specified;
    property qty_ordered:                      string  Index (IS_OPTN) read Fqty_ordered write Setqty_ordered stored qty_ordered_Specified;
    property qty_refunded:                     string  Index (IS_OPTN) read Fqty_refunded write Setqty_refunded stored qty_refunded_Specified;
    property qty_shipped:                      string  Index (IS_OPTN) read Fqty_shipped write Setqty_shipped stored qty_shipped_Specified;
    property cost:                             string  Index (IS_OPTN) read Fcost write Setcost stored cost_Specified;
    property price:                            string  Index (IS_OPTN) read Fprice write Setprice stored price_Specified;
    property base_price:                       string  Index (IS_OPTN) read Fbase_price write Setbase_price stored base_price_Specified;
    property original_price:                   string  Index (IS_OPTN) read Foriginal_price write Setoriginal_price stored original_price_Specified;
    property base_original_price:              string  Index (IS_OPTN) read Fbase_original_price write Setbase_original_price stored base_original_price_Specified;
    property tax_percent:                      string  Index (IS_OPTN) read Ftax_percent write Settax_percent stored tax_percent_Specified;
    property tax_amount:                       string  Index (IS_OPTN) read Ftax_amount write Settax_amount stored tax_amount_Specified;
    property base_tax_amount:                  string  Index (IS_OPTN) read Fbase_tax_amount write Setbase_tax_amount stored base_tax_amount_Specified;
    property tax_invoiced:                     string  Index (IS_OPTN) read Ftax_invoiced write Settax_invoiced stored tax_invoiced_Specified;
    property base_tax_invoiced:                string  Index (IS_OPTN) read Fbase_tax_invoiced write Setbase_tax_invoiced stored base_tax_invoiced_Specified;
    property discount_percent:                 string  Index (IS_OPTN) read Fdiscount_percent write Setdiscount_percent stored discount_percent_Specified;
    property discount_amount:                  string  Index (IS_OPTN) read Fdiscount_amount write Setdiscount_amount stored discount_amount_Specified;
    property base_discount_amount:             string  Index (IS_OPTN) read Fbase_discount_amount write Setbase_discount_amount stored base_discount_amount_Specified;
    property discount_invoiced:                string  Index (IS_OPTN) read Fdiscount_invoiced write Setdiscount_invoiced stored discount_invoiced_Specified;
    property base_discount_invoiced:           string  Index (IS_OPTN) read Fbase_discount_invoiced write Setbase_discount_invoiced stored base_discount_invoiced_Specified;
    property amount_refunded:                  string  Index (IS_OPTN) read Famount_refunded write Setamount_refunded stored amount_refunded_Specified;
    property base_amount_refunded:             string  Index (IS_OPTN) read Fbase_amount_refunded write Setbase_amount_refunded stored base_amount_refunded_Specified;
    property row_total:                        string  Index (IS_OPTN) read Frow_total write Setrow_total stored row_total_Specified;
    property base_row_total:                   string  Index (IS_OPTN) read Fbase_row_total write Setbase_row_total stored base_row_total_Specified;
    property row_invoiced:                     string  Index (IS_OPTN) read Frow_invoiced write Setrow_invoiced stored row_invoiced_Specified;
    property base_row_invoiced:                string  Index (IS_OPTN) read Fbase_row_invoiced write Setbase_row_invoiced stored base_row_invoiced_Specified;
    property row_weight:                       string  Index (IS_OPTN) read Frow_weight write Setrow_weight stored row_weight_Specified;
    property gift_message_id:                  string  Index (IS_OPTN) read Fgift_message_id write Setgift_message_id stored gift_message_id_Specified;
    property gift_message:                     string  Index (IS_OPTN) read Fgift_message write Setgift_message stored gift_message_Specified;
    property gift_message_available:           string  Index (IS_OPTN) read Fgift_message_available write Setgift_message_available stored gift_message_available_Specified;
    property base_tax_before_discount:         string  Index (IS_OPTN) read Fbase_tax_before_discount write Setbase_tax_before_discount stored base_tax_before_discount_Specified;
    property tax_before_discount:              string  Index (IS_OPTN) read Ftax_before_discount write Settax_before_discount stored tax_before_discount_Specified;
    property weee_tax_applied:                 string  Index (IS_OPTN) read Fweee_tax_applied write Setweee_tax_applied stored weee_tax_applied_Specified;
    property weee_tax_applied_amount:          string  Index (IS_OPTN) read Fweee_tax_applied_amount write Setweee_tax_applied_amount stored weee_tax_applied_amount_Specified;
    property weee_tax_applied_row_amount:      string  Index (IS_OPTN) read Fweee_tax_applied_row_amount write Setweee_tax_applied_row_amount stored weee_tax_applied_row_amount_Specified;
    property base_weee_tax_applied_amount:     string  Index (IS_OPTN) read Fbase_weee_tax_applied_amount write Setbase_weee_tax_applied_amount stored base_weee_tax_applied_amount_Specified;
    property base_weee_tax_applied_row_amount: string  Index (IS_OPTN) read Fbase_weee_tax_applied_row_amount write Setbase_weee_tax_applied_row_amount stored base_weee_tax_applied_row_amount_Specified;
    property weee_tax_disposition:             string  Index (IS_OPTN) read Fweee_tax_disposition write Setweee_tax_disposition stored weee_tax_disposition_Specified;
    property weee_tax_row_disposition:         string  Index (IS_OPTN) read Fweee_tax_row_disposition write Setweee_tax_row_disposition stored weee_tax_row_disposition_Specified;
    property base_weee_tax_disposition:        string  Index (IS_OPTN) read Fbase_weee_tax_disposition write Setbase_weee_tax_disposition stored base_weee_tax_disposition_Specified;
    property base_weee_tax_row_disposition:    string  Index (IS_OPTN) read Fbase_weee_tax_row_disposition write Setbase_weee_tax_row_disposition stored base_weee_tax_row_disposition_Specified;
  end;



  // ************************************************************************ //
  // XML       : salesOrderListEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  salesOrderListEntity = class(TRemotable)
  private
    Fincrement_id: string;
    Fincrement_id_Specified: boolean;
    Fstore_id: string;
    Fstore_id_Specified: boolean;
    Fcreated_at: string;
    Fcreated_at_Specified: boolean;
    Fupdated_at: string;
    Fupdated_at_Specified: boolean;
    Fcustomer_id: string;
    Fcustomer_id_Specified: boolean;
    Ftax_amount: string;
    Ftax_amount_Specified: boolean;
    Fshipping_amount: string;
    Fshipping_amount_Specified: boolean;
    Fdiscount_amount: string;
    Fdiscount_amount_Specified: boolean;
    Fsubtotal: string;
    Fsubtotal_Specified: boolean;
    Fgrand_total: string;
    Fgrand_total_Specified: boolean;
    Ftotal_paid: string;
    Ftotal_paid_Specified: boolean;
    Ftotal_refunded: string;
    Ftotal_refunded_Specified: boolean;
    Ftotal_qty_ordered: string;
    Ftotal_qty_ordered_Specified: boolean;
    Ftotal_canceled: string;
    Ftotal_canceled_Specified: boolean;
    Ftotal_invoiced: string;
    Ftotal_invoiced_Specified: boolean;
    Ftotal_online_refunded: string;
    Ftotal_online_refunded_Specified: boolean;
    Ftotal_offline_refunded: string;
    Ftotal_offline_refunded_Specified: boolean;
    Fbase_tax_amount: string;
    Fbase_tax_amount_Specified: boolean;
    Fbase_shipping_amount: string;
    Fbase_shipping_amount_Specified: boolean;
    Fbase_discount_amount: string;
    Fbase_discount_amount_Specified: boolean;
    Fbase_subtotal: string;
    Fbase_subtotal_Specified: boolean;
    Fbase_grand_total: string;
    Fbase_grand_total_Specified: boolean;
    Fbase_total_paid: string;
    Fbase_total_paid_Specified: boolean;
    Fbase_total_refunded: string;
    Fbase_total_refunded_Specified: boolean;
    Fbase_total_qty_ordered: string;
    Fbase_total_qty_ordered_Specified: boolean;
    Fbase_total_canceled: string;
    Fbase_total_canceled_Specified: boolean;
    Fbase_total_invoiced: string;
    Fbase_total_invoiced_Specified: boolean;
    Fbase_total_online_refunded: string;
    Fbase_total_online_refunded_Specified: boolean;
    Fbase_total_offline_refunded: string;
    Fbase_total_offline_refunded_Specified: boolean;
    Fbilling_address_id: string;
    Fbilling_address_id_Specified: boolean;
    Fbilling_firstname: string;
    Fbilling_firstname_Specified: boolean;
    Fbilling_lastname: string;
    Fbilling_lastname_Specified: boolean;
    Fshipping_address_id: string;
    Fshipping_address_id_Specified: boolean;
    Fshipping_firstname: string;
    Fshipping_firstname_Specified: boolean;
    Fshipping_lastname: string;
    Fshipping_lastname_Specified: boolean;
    Fbilling_name: string;
    Fbilling_name_Specified: boolean;
    Fshipping_name: string;
    Fshipping_name_Specified: boolean;
    Fstore_to_base_rate: string;
    Fstore_to_base_rate_Specified: boolean;
    Fstore_to_order_rate: string;
    Fstore_to_order_rate_Specified: boolean;
    Fbase_to_global_rate: string;
    Fbase_to_global_rate_Specified: boolean;
    Fbase_to_order_rate: string;
    Fbase_to_order_rate_Specified: boolean;
    Fweight: string;
    Fweight_Specified: boolean;
    Fstore_name: string;
    Fstore_name_Specified: boolean;
    Fremote_ip: string;
    Fremote_ip_Specified: boolean;
    Fstatus: string;
    Fstatus_Specified: boolean;
    Fstate: string;
    Fstate_Specified: boolean;
    Fapplied_rule_ids: string;
    Fapplied_rule_ids_Specified: boolean;
    Fglobal_currency_code: string;
    Fglobal_currency_code_Specified: boolean;
    Fbase_currency_code: string;
    Fbase_currency_code_Specified: boolean;
    Fstore_currency_code: string;
    Fstore_currency_code_Specified: boolean;
    Forder_currency_code: string;
    Forder_currency_code_Specified: boolean;
    Fshipping_method: string;
    Fshipping_method_Specified: boolean;
    Fshipping_description: string;
    Fshipping_description_Specified: boolean;
    Fcustomer_email: string;
    Fcustomer_email_Specified: boolean;
    Fcustomer_firstname: string;
    Fcustomer_firstname_Specified: boolean;
    Fcustomer_lastname: string;
    Fcustomer_lastname_Specified: boolean;
    Fquote_id: string;
    Fquote_id_Specified: boolean;
    Fis_virtual: string;
    Fis_virtual_Specified: boolean;
    Fcustomer_group_id: string;
    Fcustomer_group_id_Specified: boolean;
    Fcustomer_note_notify: string;
    Fcustomer_note_notify_Specified: boolean;
    Fcustomer_is_guest: string;
    Fcustomer_is_guest_Specified: boolean;
    Femail_sent: string;
    Femail_sent_Specified: boolean;
    Forder_id: string;
    Forder_id_Specified: boolean;
    Fgift_message_id: string;
    Fgift_message_id_Specified: boolean;
    Fcoupon_code: string;
    Fcoupon_code_Specified: boolean;
    Fprotect_code: string;
    Fprotect_code_Specified: boolean;
    Fbase_discount_canceled: string;
    Fbase_discount_canceled_Specified: boolean;
    Fbase_discount_invoiced: string;
    Fbase_discount_invoiced_Specified: boolean;
    Fbase_discount_refunded: string;
    Fbase_discount_refunded_Specified: boolean;
    Fbase_shipping_canceled: string;
    Fbase_shipping_canceled_Specified: boolean;
    Fbase_shipping_invoiced: string;
    Fbase_shipping_invoiced_Specified: boolean;
    Fbase_shipping_refunded: string;
    Fbase_shipping_refunded_Specified: boolean;
    Fbase_shipping_tax_amount: string;
    Fbase_shipping_tax_amount_Specified: boolean;
    Fbase_shipping_tax_refunded: string;
    Fbase_shipping_tax_refunded_Specified: boolean;
    Fbase_subtotal_canceled: string;
    Fbase_subtotal_canceled_Specified: boolean;
    Fbase_subtotal_invoiced: string;
    Fbase_subtotal_invoiced_Specified: boolean;
    Fbase_subtotal_refunded: string;
    Fbase_subtotal_refunded_Specified: boolean;
    Fbase_tax_canceled: string;
    Fbase_tax_canceled_Specified: boolean;
    Fbase_tax_invoiced: string;
    Fbase_tax_invoiced_Specified: boolean;
    Fbase_tax_refunded: string;
    Fbase_tax_refunded_Specified: boolean;
    Fbase_total_invoiced_cost: string;
    Fbase_total_invoiced_cost_Specified: boolean;
    Fdiscount_canceled: string;
    Fdiscount_canceled_Specified: boolean;
    Fdiscount_invoiced: string;
    Fdiscount_invoiced_Specified: boolean;
    Fdiscount_refunded: string;
    Fdiscount_refunded_Specified: boolean;
    Fshipping_canceled: string;
    Fshipping_canceled_Specified: boolean;
    Fshipping_invoiced: string;
    Fshipping_invoiced_Specified: boolean;
    Fshipping_refunded: string;
    Fshipping_refunded_Specified: boolean;
    Fshipping_tax_amount: string;
    Fshipping_tax_amount_Specified: boolean;
    Fshipping_tax_refunded: string;
    Fshipping_tax_refunded_Specified: boolean;
    Fsubtotal_canceled: string;
    Fsubtotal_canceled_Specified: boolean;
    Fsubtotal_invoiced: string;
    Fsubtotal_invoiced_Specified: boolean;
    Fsubtotal_refunded: string;
    Fsubtotal_refunded_Specified: boolean;
    Ftax_canceled: string;
    Ftax_canceled_Specified: boolean;
    Ftax_invoiced: string;
    Ftax_invoiced_Specified: boolean;
    Ftax_refunded: string;
    Ftax_refunded_Specified: boolean;
    Fcan_ship_partially: string;
    Fcan_ship_partially_Specified: boolean;
    Fcan_ship_partially_item: string;
    Fcan_ship_partially_item_Specified: boolean;
    Fedit_increment: string;
    Fedit_increment_Specified: boolean;
    Fforced_do_shipment_with_invoice: string;
    Fforced_do_shipment_with_invoice_Specified: boolean;
    Fpayment_authorization_expiration: string;
    Fpayment_authorization_expiration_Specified: boolean;
    Fpaypal_ipn_customer_notified: string;
    Fpaypal_ipn_customer_notified_Specified: boolean;
    Fquote_address_id: string;
    Fquote_address_id_Specified: boolean;
    Fadjustment_negative: string;
    Fadjustment_negative_Specified: boolean;
    Fadjustment_positive: string;
    Fadjustment_positive_Specified: boolean;
    Fbase_adjustment_negative: string;
    Fbase_adjustment_negative_Specified: boolean;
    Fbase_adjustment_positive: string;
    Fbase_adjustment_positive_Specified: boolean;
    Fbase_shipping_discount_amount: string;
    Fbase_shipping_discount_amount_Specified: boolean;
    Fbase_subtotal_incl_tax: string;
    Fbase_subtotal_incl_tax_Specified: boolean;
    Fbase_total_due: string;
    Fbase_total_due_Specified: boolean;
    Fpayment_authorization_amount: string;
    Fpayment_authorization_amount_Specified: boolean;
    Fshipping_discount_amount: string;
    Fshipping_discount_amount_Specified: boolean;
    Fsubtotal_incl_tax: string;
    Fsubtotal_incl_tax_Specified: boolean;
    Ftotal_due: string;
    Ftotal_due_Specified: boolean;
    Fcustomer_dob: string;
    Fcustomer_dob_Specified: boolean;
    Fcustomer_middlename: string;
    Fcustomer_middlename_Specified: boolean;
    Fcustomer_prefix: string;
    Fcustomer_prefix_Specified: boolean;
    Fcustomer_suffix: string;
    Fcustomer_suffix_Specified: boolean;
    Fcustomer_taxvat: string;
    Fcustomer_taxvat_Specified: boolean;
    Fdiscount_description: string;
    Fdiscount_description_Specified: boolean;
    Fext_customer_id: string;
    Fext_customer_id_Specified: boolean;
    Fext_order_id: string;
    Fext_order_id_Specified: boolean;
    Fhold_before_state: string;
    Fhold_before_state_Specified: boolean;
    Fhold_before_status: string;
    Fhold_before_status_Specified: boolean;
    Foriginal_increment_id: string;
    Foriginal_increment_id_Specified: boolean;
    Frelation_child_id: string;
    Frelation_child_id_Specified: boolean;
    Frelation_child_real_id: string;
    Frelation_child_real_id_Specified: boolean;
    Frelation_parent_id: string;
    Frelation_parent_id_Specified: boolean;
    Frelation_parent_real_id: string;
    Frelation_parent_real_id_Specified: boolean;
    Fx_forwarded_for: string;
    Fx_forwarded_for_Specified: boolean;
    Fcustomer_note: string;
    Fcustomer_note_Specified: boolean;
    Ftotal_item_count: string;
    Ftotal_item_count_Specified: boolean;
    Fcustomer_gender: string;
    Fcustomer_gender_Specified: boolean;
    Fhidden_tax_amount: string;
    Fhidden_tax_amount_Specified: boolean;
    Fbase_hidden_tax_amount: string;
    Fbase_hidden_tax_amount_Specified: boolean;
    Fshipping_hidden_tax_amount: string;
    Fshipping_hidden_tax_amount_Specified: boolean;
    Fbase_shipping_hidden_tax_amount: string;
    Fbase_shipping_hidden_tax_amount_Specified: boolean;
    Fhidden_tax_invoiced: string;
    Fhidden_tax_invoiced_Specified: boolean;
    Fbase_hidden_tax_invoiced: string;
    Fbase_hidden_tax_invoiced_Specified: boolean;
    Fhidden_tax_refunded: string;
    Fhidden_tax_refunded_Specified: boolean;
    Fbase_hidden_tax_refunded: string;
    Fbase_hidden_tax_refunded_Specified: boolean;
    Fshipping_incl_tax: string;
    Fshipping_incl_tax_Specified: boolean;
    Fbase_shipping_incl_tax: string;
    Fbase_shipping_incl_tax_Specified: boolean;
    Fbase_customer_balance_amount: string;
    Fbase_customer_balance_amount_Specified: boolean;
    Fcustomer_balance_amount: string;
    Fcustomer_balance_amount_Specified: boolean;
    Fbase_customer_balance_invoiced: string;
    Fbase_customer_balance_invoiced_Specified: boolean;
    Fcustomer_balance_invoiced: string;
    Fcustomer_balance_invoiced_Specified: boolean;
    Fbase_customer_balance_refunded: string;
    Fbase_customer_balance_refunded_Specified: boolean;
    Fcustomer_balance_refunded: string;
    Fcustomer_balance_refunded_Specified: boolean;
    Fbase_customer_balance_total_refunded: string;
    Fbase_customer_balance_total_refunded_Specified: boolean;
    Fcustomer_balance_total_refunded: string;
    Fcustomer_balance_total_refunded_Specified: boolean;
    Fgift_cards: string;
    Fgift_cards_Specified: boolean;
    Fbase_gift_cards_amount: string;
    Fbase_gift_cards_amount_Specified: boolean;
    Fgift_cards_amount: string;
    Fgift_cards_amount_Specified: boolean;
    Fbase_gift_cards_invoiced: string;
    Fbase_gift_cards_invoiced_Specified: boolean;
    Fgift_cards_invoiced: string;
    Fgift_cards_invoiced_Specified: boolean;
    Fbase_gift_cards_refunded: string;
    Fbase_gift_cards_refunded_Specified: boolean;
    Fgift_cards_refunded: string;
    Fgift_cards_refunded_Specified: boolean;
    Freward_points_balance: string;
    Freward_points_balance_Specified: boolean;
    Fbase_reward_currency_amount: string;
    Fbase_reward_currency_amount_Specified: boolean;
    Freward_currency_amount: string;
    Freward_currency_amount_Specified: boolean;
    Fbase_reward_currency_amount_invoiced: string;
    Fbase_reward_currency_amount_invoiced_Specified: boolean;
    Freward_currency_amount_invoiced: string;
    Freward_currency_amount_invoiced_Specified: boolean;
    Fbase_reward_currency_amount_refunded: string;
    Fbase_reward_currency_amount_refunded_Specified: boolean;
    Freward_currency_amount_refunded: string;
    Freward_currency_amount_refunded_Specified: boolean;
    Freward_points_balance_refunded: string;
    Freward_points_balance_refunded_Specified: boolean;
    Freward_points_balance_to_refund: string;
    Freward_points_balance_to_refund_Specified: boolean;
    Freward_salesrule_points: string;
    Freward_salesrule_points_Specified: boolean;
    Ffirstname: string;
    Ffirstname_Specified: boolean;
    Flastname: string;
    Flastname_Specified: boolean;
    Ftelephone: string;
    Ftelephone_Specified: boolean;
    Fpostcode: string;
    Fpostcode_Specified: boolean;
    procedure Setincrement_id(Index: Integer; const Astring: string);
    function  increment_id_Specified(Index: Integer): boolean;
    procedure Setstore_id(Index: Integer; const Astring: string);
    function  store_id_Specified(Index: Integer): boolean;
    procedure Setcreated_at(Index: Integer; const Astring: string);
    function  created_at_Specified(Index: Integer): boolean;
    procedure Setupdated_at(Index: Integer; const Astring: string);
    function  updated_at_Specified(Index: Integer): boolean;
    procedure Setcustomer_id(Index: Integer; const Astring: string);
    function  customer_id_Specified(Index: Integer): boolean;
    procedure Settax_amount(Index: Integer; const Astring: string);
    function  tax_amount_Specified(Index: Integer): boolean;
    procedure Setshipping_amount(Index: Integer; const Astring: string);
    function  shipping_amount_Specified(Index: Integer): boolean;
    procedure Setdiscount_amount(Index: Integer; const Astring: string);
    function  discount_amount_Specified(Index: Integer): boolean;
    procedure Setsubtotal(Index: Integer; const Astring: string);
    function  subtotal_Specified(Index: Integer): boolean;
    procedure Setgrand_total(Index: Integer; const Astring: string);
    function  grand_total_Specified(Index: Integer): boolean;
    procedure Settotal_paid(Index: Integer; const Astring: string);
    function  total_paid_Specified(Index: Integer): boolean;
    procedure Settotal_refunded(Index: Integer; const Astring: string);
    function  total_refunded_Specified(Index: Integer): boolean;
    procedure Settotal_qty_ordered(Index: Integer; const Astring: string);
    function  total_qty_ordered_Specified(Index: Integer): boolean;
    procedure Settotal_canceled(Index: Integer; const Astring: string);
    function  total_canceled_Specified(Index: Integer): boolean;
    procedure Settotal_invoiced(Index: Integer; const Astring: string);
    function  total_invoiced_Specified(Index: Integer): boolean;
    procedure Settotal_online_refunded(Index: Integer; const Astring: string);
    function  total_online_refunded_Specified(Index: Integer): boolean;
    procedure Settotal_offline_refunded(Index: Integer; const Astring: string);
    function  total_offline_refunded_Specified(Index: Integer): boolean;
    procedure Setbase_tax_amount(Index: Integer; const Astring: string);
    function  base_tax_amount_Specified(Index: Integer): boolean;
    procedure Setbase_shipping_amount(Index: Integer; const Astring: string);
    function  base_shipping_amount_Specified(Index: Integer): boolean;
    procedure Setbase_discount_amount(Index: Integer; const Astring: string);
    function  base_discount_amount_Specified(Index: Integer): boolean;
    procedure Setbase_subtotal(Index: Integer; const Astring: string);
    function  base_subtotal_Specified(Index: Integer): boolean;
    procedure Setbase_grand_total(Index: Integer; const Astring: string);
    function  base_grand_total_Specified(Index: Integer): boolean;
    procedure Setbase_total_paid(Index: Integer; const Astring: string);
    function  base_total_paid_Specified(Index: Integer): boolean;
    procedure Setbase_total_refunded(Index: Integer; const Astring: string);
    function  base_total_refunded_Specified(Index: Integer): boolean;
    procedure Setbase_total_qty_ordered(Index: Integer; const Astring: string);
    function  base_total_qty_ordered_Specified(Index: Integer): boolean;
    procedure Setbase_total_canceled(Index: Integer; const Astring: string);
    function  base_total_canceled_Specified(Index: Integer): boolean;
    procedure Setbase_total_invoiced(Index: Integer; const Astring: string);
    function  base_total_invoiced_Specified(Index: Integer): boolean;
    procedure Setbase_total_online_refunded(Index: Integer; const Astring: string);
    function  base_total_online_refunded_Specified(Index: Integer): boolean;
    procedure Setbase_total_offline_refunded(Index: Integer; const Astring: string);
    function  base_total_offline_refunded_Specified(Index: Integer): boolean;
    procedure Setbilling_address_id(Index: Integer; const Astring: string);
    function  billing_address_id_Specified(Index: Integer): boolean;
    procedure Setbilling_firstname(Index: Integer; const Astring: string);
    function  billing_firstname_Specified(Index: Integer): boolean;
    procedure Setbilling_lastname(Index: Integer; const Astring: string);
    function  billing_lastname_Specified(Index: Integer): boolean;
    procedure Setshipping_address_id(Index: Integer; const Astring: string);
    function  shipping_address_id_Specified(Index: Integer): boolean;
    procedure Setshipping_firstname(Index: Integer; const Astring: string);
    function  shipping_firstname_Specified(Index: Integer): boolean;
    procedure Setshipping_lastname(Index: Integer; const Astring: string);
    function  shipping_lastname_Specified(Index: Integer): boolean;
    procedure Setbilling_name(Index: Integer; const Astring: string);
    function  billing_name_Specified(Index: Integer): boolean;
    procedure Setshipping_name(Index: Integer; const Astring: string);
    function  shipping_name_Specified(Index: Integer): boolean;
    procedure Setstore_to_base_rate(Index: Integer; const Astring: string);
    function  store_to_base_rate_Specified(Index: Integer): boolean;
    procedure Setstore_to_order_rate(Index: Integer; const Astring: string);
    function  store_to_order_rate_Specified(Index: Integer): boolean;
    procedure Setbase_to_global_rate(Index: Integer; const Astring: string);
    function  base_to_global_rate_Specified(Index: Integer): boolean;
    procedure Setbase_to_order_rate(Index: Integer; const Astring: string);
    function  base_to_order_rate_Specified(Index: Integer): boolean;
    procedure Setweight(Index: Integer; const Astring: string);
    function  weight_Specified(Index: Integer): boolean;
    procedure Setstore_name(Index: Integer; const Astring: string);
    function  store_name_Specified(Index: Integer): boolean;
    procedure Setremote_ip(Index: Integer; const Astring: string);
    function  remote_ip_Specified(Index: Integer): boolean;
    procedure Setstatus(Index: Integer; const Astring: string);
    function  status_Specified(Index: Integer): boolean;
    procedure Setstate(Index: Integer; const Astring: string);
    function  state_Specified(Index: Integer): boolean;
    procedure Setapplied_rule_ids(Index: Integer; const Astring: string);
    function  applied_rule_ids_Specified(Index: Integer): boolean;
    procedure Setglobal_currency_code(Index: Integer; const Astring: string);
    function  global_currency_code_Specified(Index: Integer): boolean;
    procedure Setbase_currency_code(Index: Integer; const Astring: string);
    function  base_currency_code_Specified(Index: Integer): boolean;
    procedure Setstore_currency_code(Index: Integer; const Astring: string);
    function  store_currency_code_Specified(Index: Integer): boolean;
    procedure Setorder_currency_code(Index: Integer; const Astring: string);
    function  order_currency_code_Specified(Index: Integer): boolean;
    procedure Setshipping_method(Index: Integer; const Astring: string);
    function  shipping_method_Specified(Index: Integer): boolean;
    procedure Setshipping_description(Index: Integer; const Astring: string);
    function  shipping_description_Specified(Index: Integer): boolean;
    procedure Setcustomer_email(Index: Integer; const Astring: string);
    function  customer_email_Specified(Index: Integer): boolean;
    procedure Setcustomer_firstname(Index: Integer; const Astring: string);
    function  customer_firstname_Specified(Index: Integer): boolean;
    procedure Setcustomer_lastname(Index: Integer; const Astring: string);
    function  customer_lastname_Specified(Index: Integer): boolean;
    procedure Setquote_id(Index: Integer; const Astring: string);
    function  quote_id_Specified(Index: Integer): boolean;
    procedure Setis_virtual(Index: Integer; const Astring: string);
    function  is_virtual_Specified(Index: Integer): boolean;
    procedure Setcustomer_group_id(Index: Integer; const Astring: string);
    function  customer_group_id_Specified(Index: Integer): boolean;
    procedure Setcustomer_note_notify(Index: Integer; const Astring: string);
    function  customer_note_notify_Specified(Index: Integer): boolean;
    procedure Setcustomer_is_guest(Index: Integer; const Astring: string);
    function  customer_is_guest_Specified(Index: Integer): boolean;
    procedure Setemail_sent(Index: Integer; const Astring: string);
    function  email_sent_Specified(Index: Integer): boolean;
    procedure Setorder_id(Index: Integer; const Astring: string);
    function  order_id_Specified(Index: Integer): boolean;
    procedure Setgift_message_id(Index: Integer; const Astring: string);
    function  gift_message_id_Specified(Index: Integer): boolean;
    procedure Setcoupon_code(Index: Integer; const Astring: string);
    function  coupon_code_Specified(Index: Integer): boolean;
    procedure Setprotect_code(Index: Integer; const Astring: string);
    function  protect_code_Specified(Index: Integer): boolean;
    procedure Setbase_discount_canceled(Index: Integer; const Astring: string);
    function  base_discount_canceled_Specified(Index: Integer): boolean;
    procedure Setbase_discount_invoiced(Index: Integer; const Astring: string);
    function  base_discount_invoiced_Specified(Index: Integer): boolean;
    procedure Setbase_discount_refunded(Index: Integer; const Astring: string);
    function  base_discount_refunded_Specified(Index: Integer): boolean;
    procedure Setbase_shipping_canceled(Index: Integer; const Astring: string);
    function  base_shipping_canceled_Specified(Index: Integer): boolean;
    procedure Setbase_shipping_invoiced(Index: Integer; const Astring: string);
    function  base_shipping_invoiced_Specified(Index: Integer): boolean;
    procedure Setbase_shipping_refunded(Index: Integer; const Astring: string);
    function  base_shipping_refunded_Specified(Index: Integer): boolean;
    procedure Setbase_shipping_tax_amount(Index: Integer; const Astring: string);
    function  base_shipping_tax_amount_Specified(Index: Integer): boolean;
    procedure Setbase_shipping_tax_refunded(Index: Integer; const Astring: string);
    function  base_shipping_tax_refunded_Specified(Index: Integer): boolean;
    procedure Setbase_subtotal_canceled(Index: Integer; const Astring: string);
    function  base_subtotal_canceled_Specified(Index: Integer): boolean;
    procedure Setbase_subtotal_invoiced(Index: Integer; const Astring: string);
    function  base_subtotal_invoiced_Specified(Index: Integer): boolean;
    procedure Setbase_subtotal_refunded(Index: Integer; const Astring: string);
    function  base_subtotal_refunded_Specified(Index: Integer): boolean;
    procedure Setbase_tax_canceled(Index: Integer; const Astring: string);
    function  base_tax_canceled_Specified(Index: Integer): boolean;
    procedure Setbase_tax_invoiced(Index: Integer; const Astring: string);
    function  base_tax_invoiced_Specified(Index: Integer): boolean;
    procedure Setbase_tax_refunded(Index: Integer; const Astring: string);
    function  base_tax_refunded_Specified(Index: Integer): boolean;
    procedure Setbase_total_invoiced_cost(Index: Integer; const Astring: string);
    function  base_total_invoiced_cost_Specified(Index: Integer): boolean;
    procedure Setdiscount_canceled(Index: Integer; const Astring: string);
    function  discount_canceled_Specified(Index: Integer): boolean;
    procedure Setdiscount_invoiced(Index: Integer; const Astring: string);
    function  discount_invoiced_Specified(Index: Integer): boolean;
    procedure Setdiscount_refunded(Index: Integer; const Astring: string);
    function  discount_refunded_Specified(Index: Integer): boolean;
    procedure Setshipping_canceled(Index: Integer; const Astring: string);
    function  shipping_canceled_Specified(Index: Integer): boolean;
    procedure Setshipping_invoiced(Index: Integer; const Astring: string);
    function  shipping_invoiced_Specified(Index: Integer): boolean;
    procedure Setshipping_refunded(Index: Integer; const Astring: string);
    function  shipping_refunded_Specified(Index: Integer): boolean;
    procedure Setshipping_tax_amount(Index: Integer; const Astring: string);
    function  shipping_tax_amount_Specified(Index: Integer): boolean;
    procedure Setshipping_tax_refunded(Index: Integer; const Astring: string);
    function  shipping_tax_refunded_Specified(Index: Integer): boolean;
    procedure Setsubtotal_canceled(Index: Integer; const Astring: string);
    function  subtotal_canceled_Specified(Index: Integer): boolean;
    procedure Setsubtotal_invoiced(Index: Integer; const Astring: string);
    function  subtotal_invoiced_Specified(Index: Integer): boolean;
    procedure Setsubtotal_refunded(Index: Integer; const Astring: string);
    function  subtotal_refunded_Specified(Index: Integer): boolean;
    procedure Settax_canceled(Index: Integer; const Astring: string);
    function  tax_canceled_Specified(Index: Integer): boolean;
    procedure Settax_invoiced(Index: Integer; const Astring: string);
    function  tax_invoiced_Specified(Index: Integer): boolean;
    procedure Settax_refunded(Index: Integer; const Astring: string);
    function  tax_refunded_Specified(Index: Integer): boolean;
    procedure Setcan_ship_partially(Index: Integer; const Astring: string);
    function  can_ship_partially_Specified(Index: Integer): boolean;
    procedure Setcan_ship_partially_item(Index: Integer; const Astring: string);
    function  can_ship_partially_item_Specified(Index: Integer): boolean;
    procedure Setedit_increment(Index: Integer; const Astring: string);
    function  edit_increment_Specified(Index: Integer): boolean;
    procedure Setforced_do_shipment_with_invoice(Index: Integer; const Astring: string);
    function  forced_do_shipment_with_invoice_Specified(Index: Integer): boolean;
    procedure Setpayment_authorization_expiration(Index: Integer; const Astring: string);
    function  payment_authorization_expiration_Specified(Index: Integer): boolean;
    procedure Setpaypal_ipn_customer_notified(Index: Integer; const Astring: string);
    function  paypal_ipn_customer_notified_Specified(Index: Integer): boolean;
    procedure Setquote_address_id(Index: Integer; const Astring: string);
    function  quote_address_id_Specified(Index: Integer): boolean;
    procedure Setadjustment_negative(Index: Integer; const Astring: string);
    function  adjustment_negative_Specified(Index: Integer): boolean;
    procedure Setadjustment_positive(Index: Integer; const Astring: string);
    function  adjustment_positive_Specified(Index: Integer): boolean;
    procedure Setbase_adjustment_negative(Index: Integer; const Astring: string);
    function  base_adjustment_negative_Specified(Index: Integer): boolean;
    procedure Setbase_adjustment_positive(Index: Integer; const Astring: string);
    function  base_adjustment_positive_Specified(Index: Integer): boolean;
    procedure Setbase_shipping_discount_amount(Index: Integer; const Astring: string);
    function  base_shipping_discount_amount_Specified(Index: Integer): boolean;
    procedure Setbase_subtotal_incl_tax(Index: Integer; const Astring: string);
    function  base_subtotal_incl_tax_Specified(Index: Integer): boolean;
    procedure Setbase_total_due(Index: Integer; const Astring: string);
    function  base_total_due_Specified(Index: Integer): boolean;
    procedure Setpayment_authorization_amount(Index: Integer; const Astring: string);
    function  payment_authorization_amount_Specified(Index: Integer): boolean;
    procedure Setshipping_discount_amount(Index: Integer; const Astring: string);
    function  shipping_discount_amount_Specified(Index: Integer): boolean;
    procedure Setsubtotal_incl_tax(Index: Integer; const Astring: string);
    function  subtotal_incl_tax_Specified(Index: Integer): boolean;
    procedure Settotal_due(Index: Integer; const Astring: string);
    function  total_due_Specified(Index: Integer): boolean;
    procedure Setcustomer_dob(Index: Integer; const Astring: string);
    function  customer_dob_Specified(Index: Integer): boolean;
    procedure Setcustomer_middlename(Index: Integer; const Astring: string);
    function  customer_middlename_Specified(Index: Integer): boolean;
    procedure Setcustomer_prefix(Index: Integer; const Astring: string);
    function  customer_prefix_Specified(Index: Integer): boolean;
    procedure Setcustomer_suffix(Index: Integer; const Astring: string);
    function  customer_suffix_Specified(Index: Integer): boolean;
    procedure Setcustomer_taxvat(Index: Integer; const Astring: string);
    function  customer_taxvat_Specified(Index: Integer): boolean;
    procedure Setdiscount_description(Index: Integer; const Astring: string);
    function  discount_description_Specified(Index: Integer): boolean;
    procedure Setext_customer_id(Index: Integer; const Astring: string);
    function  ext_customer_id_Specified(Index: Integer): boolean;
    procedure Setext_order_id(Index: Integer; const Astring: string);
    function  ext_order_id_Specified(Index: Integer): boolean;
    procedure Sethold_before_state(Index: Integer; const Astring: string);
    function  hold_before_state_Specified(Index: Integer): boolean;
    procedure Sethold_before_status(Index: Integer; const Astring: string);
    function  hold_before_status_Specified(Index: Integer): boolean;
    procedure Setoriginal_increment_id(Index: Integer; const Astring: string);
    function  original_increment_id_Specified(Index: Integer): boolean;
    procedure Setrelation_child_id(Index: Integer; const Astring: string);
    function  relation_child_id_Specified(Index: Integer): boolean;
    procedure Setrelation_child_real_id(Index: Integer; const Astring: string);
    function  relation_child_real_id_Specified(Index: Integer): boolean;
    procedure Setrelation_parent_id(Index: Integer; const Astring: string);
    function  relation_parent_id_Specified(Index: Integer): boolean;
    procedure Setrelation_parent_real_id(Index: Integer; const Astring: string);
    function  relation_parent_real_id_Specified(Index: Integer): boolean;
    procedure Setx_forwarded_for(Index: Integer; const Astring: string);
    function  x_forwarded_for_Specified(Index: Integer): boolean;
    procedure Setcustomer_note(Index: Integer; const Astring: string);
    function  customer_note_Specified(Index: Integer): boolean;
    procedure Settotal_item_count(Index: Integer; const Astring: string);
    function  total_item_count_Specified(Index: Integer): boolean;
    procedure Setcustomer_gender(Index: Integer; const Astring: string);
    function  customer_gender_Specified(Index: Integer): boolean;
    procedure Sethidden_tax_amount(Index: Integer; const Astring: string);
    function  hidden_tax_amount_Specified(Index: Integer): boolean;
    procedure Setbase_hidden_tax_amount(Index: Integer; const Astring: string);
    function  base_hidden_tax_amount_Specified(Index: Integer): boolean;
    procedure Setshipping_hidden_tax_amount(Index: Integer; const Astring: string);
    function  shipping_hidden_tax_amount_Specified(Index: Integer): boolean;
    procedure Setbase_shipping_hidden_tax_amount(Index: Integer; const Astring: string);
    function  base_shipping_hidden_tax_amount_Specified(Index: Integer): boolean;
    procedure Sethidden_tax_invoiced(Index: Integer; const Astring: string);
    function  hidden_tax_invoiced_Specified(Index: Integer): boolean;
    procedure Setbase_hidden_tax_invoiced(Index: Integer; const Astring: string);
    function  base_hidden_tax_invoiced_Specified(Index: Integer): boolean;
    procedure Sethidden_tax_refunded(Index: Integer; const Astring: string);
    function  hidden_tax_refunded_Specified(Index: Integer): boolean;
    procedure Setbase_hidden_tax_refunded(Index: Integer; const Astring: string);
    function  base_hidden_tax_refunded_Specified(Index: Integer): boolean;
    procedure Setshipping_incl_tax(Index: Integer; const Astring: string);
    function  shipping_incl_tax_Specified(Index: Integer): boolean;
    procedure Setbase_shipping_incl_tax(Index: Integer; const Astring: string);
    function  base_shipping_incl_tax_Specified(Index: Integer): boolean;
    procedure Setbase_customer_balance_amount(Index: Integer; const Astring: string);
    function  base_customer_balance_amount_Specified(Index: Integer): boolean;
    procedure Setcustomer_balance_amount(Index: Integer; const Astring: string);
    function  customer_balance_amount_Specified(Index: Integer): boolean;
    procedure Setbase_customer_balance_invoiced(Index: Integer; const Astring: string);
    function  base_customer_balance_invoiced_Specified(Index: Integer): boolean;
    procedure Setcustomer_balance_invoiced(Index: Integer; const Astring: string);
    function  customer_balance_invoiced_Specified(Index: Integer): boolean;
    procedure Setbase_customer_balance_refunded(Index: Integer; const Astring: string);
    function  base_customer_balance_refunded_Specified(Index: Integer): boolean;
    procedure Setcustomer_balance_refunded(Index: Integer; const Astring: string);
    function  customer_balance_refunded_Specified(Index: Integer): boolean;
    procedure Setbase_customer_balance_total_refunded(Index: Integer; const Astring: string);
    function  base_customer_balance_total_refunded_Specified(Index: Integer): boolean;
    procedure Setcustomer_balance_total_refunded(Index: Integer; const Astring: string);
    function  customer_balance_total_refunded_Specified(Index: Integer): boolean;
    procedure Setgift_cards(Index: Integer; const Astring: string);
    function  gift_cards_Specified(Index: Integer): boolean;
    procedure Setbase_gift_cards_amount(Index: Integer; const Astring: string);
    function  base_gift_cards_amount_Specified(Index: Integer): boolean;
    procedure Setgift_cards_amount(Index: Integer; const Astring: string);
    function  gift_cards_amount_Specified(Index: Integer): boolean;
    procedure Setbase_gift_cards_invoiced(Index: Integer; const Astring: string);
    function  base_gift_cards_invoiced_Specified(Index: Integer): boolean;
    procedure Setgift_cards_invoiced(Index: Integer; const Astring: string);
    function  gift_cards_invoiced_Specified(Index: Integer): boolean;
    procedure Setbase_gift_cards_refunded(Index: Integer; const Astring: string);
    function  base_gift_cards_refunded_Specified(Index: Integer): boolean;
    procedure Setgift_cards_refunded(Index: Integer; const Astring: string);
    function  gift_cards_refunded_Specified(Index: Integer): boolean;
    procedure Setreward_points_balance(Index: Integer; const Astring: string);
    function  reward_points_balance_Specified(Index: Integer): boolean;
    procedure Setbase_reward_currency_amount(Index: Integer; const Astring: string);
    function  base_reward_currency_amount_Specified(Index: Integer): boolean;
    procedure Setreward_currency_amount(Index: Integer; const Astring: string);
    function  reward_currency_amount_Specified(Index: Integer): boolean;
    procedure Setbase_reward_currency_amount_invoiced(Index: Integer; const Astring: string);
    function  base_reward_currency_amount_invoiced_Specified(Index: Integer): boolean;
    procedure Setreward_currency_amount_invoiced(Index: Integer; const Astring: string);
    function  reward_currency_amount_invoiced_Specified(Index: Integer): boolean;
    procedure Setbase_reward_currency_amount_refunded(Index: Integer; const Astring: string);
    function  base_reward_currency_amount_refunded_Specified(Index: Integer): boolean;
    procedure Setreward_currency_amount_refunded(Index: Integer; const Astring: string);
    function  reward_currency_amount_refunded_Specified(Index: Integer): boolean;
    procedure Setreward_points_balance_refunded(Index: Integer; const Astring: string);
    function  reward_points_balance_refunded_Specified(Index: Integer): boolean;
    procedure Setreward_points_balance_to_refund(Index: Integer; const Astring: string);
    function  reward_points_balance_to_refund_Specified(Index: Integer): boolean;
    procedure Setreward_salesrule_points(Index: Integer; const Astring: string);
    function  reward_salesrule_points_Specified(Index: Integer): boolean;
    procedure Setfirstname(Index: Integer; const Astring: string);
    function  firstname_Specified(Index: Integer): boolean;
    procedure Setlastname(Index: Integer; const Astring: string);
    function  lastname_Specified(Index: Integer): boolean;
    procedure Settelephone(Index: Integer; const Astring: string);
    function  telephone_Specified(Index: Integer): boolean;
    procedure Setpostcode(Index: Integer; const Astring: string);
    function  postcode_Specified(Index: Integer): boolean;
  published
    property increment_id:                         string  Index (IS_OPTN) read Fincrement_id write Setincrement_id stored increment_id_Specified;
    property store_id:                             string  Index (IS_OPTN) read Fstore_id write Setstore_id stored store_id_Specified;
    property created_at:                           string  Index (IS_OPTN) read Fcreated_at write Setcreated_at stored created_at_Specified;
    property updated_at:                           string  Index (IS_OPTN) read Fupdated_at write Setupdated_at stored updated_at_Specified;
    property customer_id:                          string  Index (IS_OPTN) read Fcustomer_id write Setcustomer_id stored customer_id_Specified;
    property tax_amount:                           string  Index (IS_OPTN) read Ftax_amount write Settax_amount stored tax_amount_Specified;
    property shipping_amount:                      string  Index (IS_OPTN) read Fshipping_amount write Setshipping_amount stored shipping_amount_Specified;
    property discount_amount:                      string  Index (IS_OPTN) read Fdiscount_amount write Setdiscount_amount stored discount_amount_Specified;
    property subtotal:                             string  Index (IS_OPTN) read Fsubtotal write Setsubtotal stored subtotal_Specified;
    property grand_total:                          string  Index (IS_OPTN) read Fgrand_total write Setgrand_total stored grand_total_Specified;
    property total_paid:                           string  Index (IS_OPTN) read Ftotal_paid write Settotal_paid stored total_paid_Specified;
    property total_refunded:                       string  Index (IS_OPTN) read Ftotal_refunded write Settotal_refunded stored total_refunded_Specified;
    property total_qty_ordered:                    string  Index (IS_OPTN) read Ftotal_qty_ordered write Settotal_qty_ordered stored total_qty_ordered_Specified;
    property total_canceled:                       string  Index (IS_OPTN) read Ftotal_canceled write Settotal_canceled stored total_canceled_Specified;
    property total_invoiced:                       string  Index (IS_OPTN) read Ftotal_invoiced write Settotal_invoiced stored total_invoiced_Specified;
    property total_online_refunded:                string  Index (IS_OPTN) read Ftotal_online_refunded write Settotal_online_refunded stored total_online_refunded_Specified;
    property total_offline_refunded:               string  Index (IS_OPTN) read Ftotal_offline_refunded write Settotal_offline_refunded stored total_offline_refunded_Specified;
    property base_tax_amount:                      string  Index (IS_OPTN) read Fbase_tax_amount write Setbase_tax_amount stored base_tax_amount_Specified;
    property base_shipping_amount:                 string  Index (IS_OPTN) read Fbase_shipping_amount write Setbase_shipping_amount stored base_shipping_amount_Specified;
    property base_discount_amount:                 string  Index (IS_OPTN) read Fbase_discount_amount write Setbase_discount_amount stored base_discount_amount_Specified;
    property base_subtotal:                        string  Index (IS_OPTN) read Fbase_subtotal write Setbase_subtotal stored base_subtotal_Specified;
    property base_grand_total:                     string  Index (IS_OPTN) read Fbase_grand_total write Setbase_grand_total stored base_grand_total_Specified;
    property base_total_paid:                      string  Index (IS_OPTN) read Fbase_total_paid write Setbase_total_paid stored base_total_paid_Specified;
    property base_total_refunded:                  string  Index (IS_OPTN) read Fbase_total_refunded write Setbase_total_refunded stored base_total_refunded_Specified;
    property base_total_qty_ordered:               string  Index (IS_OPTN) read Fbase_total_qty_ordered write Setbase_total_qty_ordered stored base_total_qty_ordered_Specified;
    property base_total_canceled:                  string  Index (IS_OPTN) read Fbase_total_canceled write Setbase_total_canceled stored base_total_canceled_Specified;
    property base_total_invoiced:                  string  Index (IS_OPTN) read Fbase_total_invoiced write Setbase_total_invoiced stored base_total_invoiced_Specified;
    property base_total_online_refunded:           string  Index (IS_OPTN) read Fbase_total_online_refunded write Setbase_total_online_refunded stored base_total_online_refunded_Specified;
    property base_total_offline_refunded:          string  Index (IS_OPTN) read Fbase_total_offline_refunded write Setbase_total_offline_refunded stored base_total_offline_refunded_Specified;
    property billing_address_id:                   string  Index (IS_OPTN) read Fbilling_address_id write Setbilling_address_id stored billing_address_id_Specified;
    property billing_firstname:                    string  Index (IS_OPTN) read Fbilling_firstname write Setbilling_firstname stored billing_firstname_Specified;
    property billing_lastname:                     string  Index (IS_OPTN) read Fbilling_lastname write Setbilling_lastname stored billing_lastname_Specified;
    property shipping_address_id:                  string  Index (IS_OPTN) read Fshipping_address_id write Setshipping_address_id stored shipping_address_id_Specified;
    property shipping_firstname:                   string  Index (IS_OPTN) read Fshipping_firstname write Setshipping_firstname stored shipping_firstname_Specified;
    property shipping_lastname:                    string  Index (IS_OPTN) read Fshipping_lastname write Setshipping_lastname stored shipping_lastname_Specified;
    property billing_name:                         string  Index (IS_OPTN) read Fbilling_name write Setbilling_name stored billing_name_Specified;
    property shipping_name:                        string  Index (IS_OPTN) read Fshipping_name write Setshipping_name stored shipping_name_Specified;
    property store_to_base_rate:                   string  Index (IS_OPTN) read Fstore_to_base_rate write Setstore_to_base_rate stored store_to_base_rate_Specified;
    property store_to_order_rate:                  string  Index (IS_OPTN) read Fstore_to_order_rate write Setstore_to_order_rate stored store_to_order_rate_Specified;
    property base_to_global_rate:                  string  Index (IS_OPTN) read Fbase_to_global_rate write Setbase_to_global_rate stored base_to_global_rate_Specified;
    property base_to_order_rate:                   string  Index (IS_OPTN) read Fbase_to_order_rate write Setbase_to_order_rate stored base_to_order_rate_Specified;
    property weight:                               string  Index (IS_OPTN) read Fweight write Setweight stored weight_Specified;
    property store_name:                           string  Index (IS_OPTN) read Fstore_name write Setstore_name stored store_name_Specified;
    property remote_ip:                            string  Index (IS_OPTN) read Fremote_ip write Setremote_ip stored remote_ip_Specified;
    property status:                               string  Index (IS_OPTN) read Fstatus write Setstatus stored status_Specified;
    property state:                                string  Index (IS_OPTN) read Fstate write Setstate stored state_Specified;
    property applied_rule_ids:                     string  Index (IS_OPTN) read Fapplied_rule_ids write Setapplied_rule_ids stored applied_rule_ids_Specified;
    property global_currency_code:                 string  Index (IS_OPTN) read Fglobal_currency_code write Setglobal_currency_code stored global_currency_code_Specified;
    property base_currency_code:                   string  Index (IS_OPTN) read Fbase_currency_code write Setbase_currency_code stored base_currency_code_Specified;
    property store_currency_code:                  string  Index (IS_OPTN) read Fstore_currency_code write Setstore_currency_code stored store_currency_code_Specified;
    property order_currency_code:                  string  Index (IS_OPTN) read Forder_currency_code write Setorder_currency_code stored order_currency_code_Specified;
    property shipping_method:                      string  Index (IS_OPTN) read Fshipping_method write Setshipping_method stored shipping_method_Specified;
    property shipping_description:                 string  Index (IS_OPTN) read Fshipping_description write Setshipping_description stored shipping_description_Specified;
    property customer_email:                       string  Index (IS_OPTN) read Fcustomer_email write Setcustomer_email stored customer_email_Specified;
    property customer_firstname:                   string  Index (IS_OPTN) read Fcustomer_firstname write Setcustomer_firstname stored customer_firstname_Specified;
    property customer_lastname:                    string  Index (IS_OPTN) read Fcustomer_lastname write Setcustomer_lastname stored customer_lastname_Specified;
    property quote_id:                             string  Index (IS_OPTN) read Fquote_id write Setquote_id stored quote_id_Specified;
    property is_virtual:                           string  Index (IS_OPTN) read Fis_virtual write Setis_virtual stored is_virtual_Specified;
    property customer_group_id:                    string  Index (IS_OPTN) read Fcustomer_group_id write Setcustomer_group_id stored customer_group_id_Specified;
    property customer_note_notify:                 string  Index (IS_OPTN) read Fcustomer_note_notify write Setcustomer_note_notify stored customer_note_notify_Specified;
    property customer_is_guest:                    string  Index (IS_OPTN) read Fcustomer_is_guest write Setcustomer_is_guest stored customer_is_guest_Specified;
    property email_sent:                           string  Index (IS_OPTN) read Femail_sent write Setemail_sent stored email_sent_Specified;
    property order_id:                             string  Index (IS_OPTN) read Forder_id write Setorder_id stored order_id_Specified;
    property gift_message_id:                      string  Index (IS_OPTN) read Fgift_message_id write Setgift_message_id stored gift_message_id_Specified;
    property coupon_code:                          string  Index (IS_OPTN) read Fcoupon_code write Setcoupon_code stored coupon_code_Specified;
    property protect_code:                         string  Index (IS_OPTN) read Fprotect_code write Setprotect_code stored protect_code_Specified;
    property base_discount_canceled:               string  Index (IS_OPTN) read Fbase_discount_canceled write Setbase_discount_canceled stored base_discount_canceled_Specified;
    property base_discount_invoiced:               string  Index (IS_OPTN) read Fbase_discount_invoiced write Setbase_discount_invoiced stored base_discount_invoiced_Specified;
    property base_discount_refunded:               string  Index (IS_OPTN) read Fbase_discount_refunded write Setbase_discount_refunded stored base_discount_refunded_Specified;
    property base_shipping_canceled:               string  Index (IS_OPTN) read Fbase_shipping_canceled write Setbase_shipping_canceled stored base_shipping_canceled_Specified;
    property base_shipping_invoiced:               string  Index (IS_OPTN) read Fbase_shipping_invoiced write Setbase_shipping_invoiced stored base_shipping_invoiced_Specified;
    property base_shipping_refunded:               string  Index (IS_OPTN) read Fbase_shipping_refunded write Setbase_shipping_refunded stored base_shipping_refunded_Specified;
    property base_shipping_tax_amount:             string  Index (IS_OPTN) read Fbase_shipping_tax_amount write Setbase_shipping_tax_amount stored base_shipping_tax_amount_Specified;
    property base_shipping_tax_refunded:           string  Index (IS_OPTN) read Fbase_shipping_tax_refunded write Setbase_shipping_tax_refunded stored base_shipping_tax_refunded_Specified;
    property base_subtotal_canceled:               string  Index (IS_OPTN) read Fbase_subtotal_canceled write Setbase_subtotal_canceled stored base_subtotal_canceled_Specified;
    property base_subtotal_invoiced:               string  Index (IS_OPTN) read Fbase_subtotal_invoiced write Setbase_subtotal_invoiced stored base_subtotal_invoiced_Specified;
    property base_subtotal_refunded:               string  Index (IS_OPTN) read Fbase_subtotal_refunded write Setbase_subtotal_refunded stored base_subtotal_refunded_Specified;
    property base_tax_canceled:                    string  Index (IS_OPTN) read Fbase_tax_canceled write Setbase_tax_canceled stored base_tax_canceled_Specified;
    property base_tax_invoiced:                    string  Index (IS_OPTN) read Fbase_tax_invoiced write Setbase_tax_invoiced stored base_tax_invoiced_Specified;
    property base_tax_refunded:                    string  Index (IS_OPTN) read Fbase_tax_refunded write Setbase_tax_refunded stored base_tax_refunded_Specified;
    property base_total_invoiced_cost:             string  Index (IS_OPTN) read Fbase_total_invoiced_cost write Setbase_total_invoiced_cost stored base_total_invoiced_cost_Specified;
    property discount_canceled:                    string  Index (IS_OPTN) read Fdiscount_canceled write Setdiscount_canceled stored discount_canceled_Specified;
    property discount_invoiced:                    string  Index (IS_OPTN) read Fdiscount_invoiced write Setdiscount_invoiced stored discount_invoiced_Specified;
    property discount_refunded:                    string  Index (IS_OPTN) read Fdiscount_refunded write Setdiscount_refunded stored discount_refunded_Specified;
    property shipping_canceled:                    string  Index (IS_OPTN) read Fshipping_canceled write Setshipping_canceled stored shipping_canceled_Specified;
    property shipping_invoiced:                    string  Index (IS_OPTN) read Fshipping_invoiced write Setshipping_invoiced stored shipping_invoiced_Specified;
    property shipping_refunded:                    string  Index (IS_OPTN) read Fshipping_refunded write Setshipping_refunded stored shipping_refunded_Specified;
    property shipping_tax_amount:                  string  Index (IS_OPTN) read Fshipping_tax_amount write Setshipping_tax_amount stored shipping_tax_amount_Specified;
    property shipping_tax_refunded:                string  Index (IS_OPTN) read Fshipping_tax_refunded write Setshipping_tax_refunded stored shipping_tax_refunded_Specified;
    property subtotal_canceled:                    string  Index (IS_OPTN) read Fsubtotal_canceled write Setsubtotal_canceled stored subtotal_canceled_Specified;
    property subtotal_invoiced:                    string  Index (IS_OPTN) read Fsubtotal_invoiced write Setsubtotal_invoiced stored subtotal_invoiced_Specified;
    property subtotal_refunded:                    string  Index (IS_OPTN) read Fsubtotal_refunded write Setsubtotal_refunded stored subtotal_refunded_Specified;
    property tax_canceled:                         string  Index (IS_OPTN) read Ftax_canceled write Settax_canceled stored tax_canceled_Specified;
    property tax_invoiced:                         string  Index (IS_OPTN) read Ftax_invoiced write Settax_invoiced stored tax_invoiced_Specified;
    property tax_refunded:                         string  Index (IS_OPTN) read Ftax_refunded write Settax_refunded stored tax_refunded_Specified;
    property can_ship_partially:                   string  Index (IS_OPTN) read Fcan_ship_partially write Setcan_ship_partially stored can_ship_partially_Specified;
    property can_ship_partially_item:              string  Index (IS_OPTN) read Fcan_ship_partially_item write Setcan_ship_partially_item stored can_ship_partially_item_Specified;
    property edit_increment:                       string  Index (IS_OPTN) read Fedit_increment write Setedit_increment stored edit_increment_Specified;
    property forced_do_shipment_with_invoice:      string  Index (IS_OPTN) read Fforced_do_shipment_with_invoice write Setforced_do_shipment_with_invoice stored forced_do_shipment_with_invoice_Specified;
    property payment_authorization_expiration:     string  Index (IS_OPTN) read Fpayment_authorization_expiration write Setpayment_authorization_expiration stored payment_authorization_expiration_Specified;
    property paypal_ipn_customer_notified:         string  Index (IS_OPTN) read Fpaypal_ipn_customer_notified write Setpaypal_ipn_customer_notified stored paypal_ipn_customer_notified_Specified;
    property quote_address_id:                     string  Index (IS_OPTN) read Fquote_address_id write Setquote_address_id stored quote_address_id_Specified;
    property adjustment_negative:                  string  Index (IS_OPTN) read Fadjustment_negative write Setadjustment_negative stored adjustment_negative_Specified;
    property adjustment_positive:                  string  Index (IS_OPTN) read Fadjustment_positive write Setadjustment_positive stored adjustment_positive_Specified;
    property base_adjustment_negative:             string  Index (IS_OPTN) read Fbase_adjustment_negative write Setbase_adjustment_negative stored base_adjustment_negative_Specified;
    property base_adjustment_positive:             string  Index (IS_OPTN) read Fbase_adjustment_positive write Setbase_adjustment_positive stored base_adjustment_positive_Specified;
    property base_shipping_discount_amount:        string  Index (IS_OPTN) read Fbase_shipping_discount_amount write Setbase_shipping_discount_amount stored base_shipping_discount_amount_Specified;
    property base_subtotal_incl_tax:               string  Index (IS_OPTN) read Fbase_subtotal_incl_tax write Setbase_subtotal_incl_tax stored base_subtotal_incl_tax_Specified;
    property base_total_due:                       string  Index (IS_OPTN) read Fbase_total_due write Setbase_total_due stored base_total_due_Specified;
    property payment_authorization_amount:         string  Index (IS_OPTN) read Fpayment_authorization_amount write Setpayment_authorization_amount stored payment_authorization_amount_Specified;
    property shipping_discount_amount:             string  Index (IS_OPTN) read Fshipping_discount_amount write Setshipping_discount_amount stored shipping_discount_amount_Specified;
    property subtotal_incl_tax:                    string  Index (IS_OPTN) read Fsubtotal_incl_tax write Setsubtotal_incl_tax stored subtotal_incl_tax_Specified;
    property total_due:                            string  Index (IS_OPTN) read Ftotal_due write Settotal_due stored total_due_Specified;
    property customer_dob:                         string  Index (IS_OPTN) read Fcustomer_dob write Setcustomer_dob stored customer_dob_Specified;
    property customer_middlename:                  string  Index (IS_OPTN) read Fcustomer_middlename write Setcustomer_middlename stored customer_middlename_Specified;
    property customer_prefix:                      string  Index (IS_OPTN) read Fcustomer_prefix write Setcustomer_prefix stored customer_prefix_Specified;
    property customer_suffix:                      string  Index (IS_OPTN) read Fcustomer_suffix write Setcustomer_suffix stored customer_suffix_Specified;
    property customer_taxvat:                      string  Index (IS_OPTN) read Fcustomer_taxvat write Setcustomer_taxvat stored customer_taxvat_Specified;
    property discount_description:                 string  Index (IS_OPTN) read Fdiscount_description write Setdiscount_description stored discount_description_Specified;
    property ext_customer_id:                      string  Index (IS_OPTN) read Fext_customer_id write Setext_customer_id stored ext_customer_id_Specified;
    property ext_order_id:                         string  Index (IS_OPTN) read Fext_order_id write Setext_order_id stored ext_order_id_Specified;
    property hold_before_state:                    string  Index (IS_OPTN) read Fhold_before_state write Sethold_before_state stored hold_before_state_Specified;
    property hold_before_status:                   string  Index (IS_OPTN) read Fhold_before_status write Sethold_before_status stored hold_before_status_Specified;
    property original_increment_id:                string  Index (IS_OPTN) read Foriginal_increment_id write Setoriginal_increment_id stored original_increment_id_Specified;
    property relation_child_id:                    string  Index (IS_OPTN) read Frelation_child_id write Setrelation_child_id stored relation_child_id_Specified;
    property relation_child_real_id:               string  Index (IS_OPTN) read Frelation_child_real_id write Setrelation_child_real_id stored relation_child_real_id_Specified;
    property relation_parent_id:                   string  Index (IS_OPTN) read Frelation_parent_id write Setrelation_parent_id stored relation_parent_id_Specified;
    property relation_parent_real_id:              string  Index (IS_OPTN) read Frelation_parent_real_id write Setrelation_parent_real_id stored relation_parent_real_id_Specified;
    property x_forwarded_for:                      string  Index (IS_OPTN) read Fx_forwarded_for write Setx_forwarded_for stored x_forwarded_for_Specified;
    property customer_note:                        string  Index (IS_OPTN) read Fcustomer_note write Setcustomer_note stored customer_note_Specified;
    property total_item_count:                     string  Index (IS_OPTN) read Ftotal_item_count write Settotal_item_count stored total_item_count_Specified;
    property customer_gender:                      string  Index (IS_OPTN) read Fcustomer_gender write Setcustomer_gender stored customer_gender_Specified;
    property hidden_tax_amount:                    string  Index (IS_OPTN) read Fhidden_tax_amount write Sethidden_tax_amount stored hidden_tax_amount_Specified;
    property base_hidden_tax_amount:               string  Index (IS_OPTN) read Fbase_hidden_tax_amount write Setbase_hidden_tax_amount stored base_hidden_tax_amount_Specified;
    property shipping_hidden_tax_amount:           string  Index (IS_OPTN) read Fshipping_hidden_tax_amount write Setshipping_hidden_tax_amount stored shipping_hidden_tax_amount_Specified;
    property base_shipping_hidden_tax_amount:      string  Index (IS_OPTN) read Fbase_shipping_hidden_tax_amount write Setbase_shipping_hidden_tax_amount stored base_shipping_hidden_tax_amount_Specified;
    property hidden_tax_invoiced:                  string  Index (IS_OPTN) read Fhidden_tax_invoiced write Sethidden_tax_invoiced stored hidden_tax_invoiced_Specified;
    property base_hidden_tax_invoiced:             string  Index (IS_OPTN) read Fbase_hidden_tax_invoiced write Setbase_hidden_tax_invoiced stored base_hidden_tax_invoiced_Specified;
    property hidden_tax_refunded:                  string  Index (IS_OPTN) read Fhidden_tax_refunded write Sethidden_tax_refunded stored hidden_tax_refunded_Specified;
    property base_hidden_tax_refunded:             string  Index (IS_OPTN) read Fbase_hidden_tax_refunded write Setbase_hidden_tax_refunded stored base_hidden_tax_refunded_Specified;
    property shipping_incl_tax:                    string  Index (IS_OPTN) read Fshipping_incl_tax write Setshipping_incl_tax stored shipping_incl_tax_Specified;
    property base_shipping_incl_tax:               string  Index (IS_OPTN) read Fbase_shipping_incl_tax write Setbase_shipping_incl_tax stored base_shipping_incl_tax_Specified;
    property base_customer_balance_amount:         string  Index (IS_OPTN) read Fbase_customer_balance_amount write Setbase_customer_balance_amount stored base_customer_balance_amount_Specified;
    property customer_balance_amount:              string  Index (IS_OPTN) read Fcustomer_balance_amount write Setcustomer_balance_amount stored customer_balance_amount_Specified;
    property base_customer_balance_invoiced:       string  Index (IS_OPTN) read Fbase_customer_balance_invoiced write Setbase_customer_balance_invoiced stored base_customer_balance_invoiced_Specified;
    property customer_balance_invoiced:            string  Index (IS_OPTN) read Fcustomer_balance_invoiced write Setcustomer_balance_invoiced stored customer_balance_invoiced_Specified;
    property base_customer_balance_refunded:       string  Index (IS_OPTN) read Fbase_customer_balance_refunded write Setbase_customer_balance_refunded stored base_customer_balance_refunded_Specified;
    property customer_balance_refunded:            string  Index (IS_OPTN) read Fcustomer_balance_refunded write Setcustomer_balance_refunded stored customer_balance_refunded_Specified;
    property base_customer_balance_total_refunded: string  Index (IS_OPTN) read Fbase_customer_balance_total_refunded write Setbase_customer_balance_total_refunded stored base_customer_balance_total_refunded_Specified;
    property customer_balance_total_refunded:      string  Index (IS_OPTN) read Fcustomer_balance_total_refunded write Setcustomer_balance_total_refunded stored customer_balance_total_refunded_Specified;
    property gift_cards:                           string  Index (IS_OPTN) read Fgift_cards write Setgift_cards stored gift_cards_Specified;
    property base_gift_cards_amount:               string  Index (IS_OPTN) read Fbase_gift_cards_amount write Setbase_gift_cards_amount stored base_gift_cards_amount_Specified;
    property gift_cards_amount:                    string  Index (IS_OPTN) read Fgift_cards_amount write Setgift_cards_amount stored gift_cards_amount_Specified;
    property base_gift_cards_invoiced:             string  Index (IS_OPTN) read Fbase_gift_cards_invoiced write Setbase_gift_cards_invoiced stored base_gift_cards_invoiced_Specified;
    property gift_cards_invoiced:                  string  Index (IS_OPTN) read Fgift_cards_invoiced write Setgift_cards_invoiced stored gift_cards_invoiced_Specified;
    property base_gift_cards_refunded:             string  Index (IS_OPTN) read Fbase_gift_cards_refunded write Setbase_gift_cards_refunded stored base_gift_cards_refunded_Specified;
    property gift_cards_refunded:                  string  Index (IS_OPTN) read Fgift_cards_refunded write Setgift_cards_refunded stored gift_cards_refunded_Specified;
    property reward_points_balance:                string  Index (IS_OPTN) read Freward_points_balance write Setreward_points_balance stored reward_points_balance_Specified;
    property base_reward_currency_amount:          string  Index (IS_OPTN) read Fbase_reward_currency_amount write Setbase_reward_currency_amount stored base_reward_currency_amount_Specified;
    property reward_currency_amount:               string  Index (IS_OPTN) read Freward_currency_amount write Setreward_currency_amount stored reward_currency_amount_Specified;
    property base_reward_currency_amount_invoiced: string  Index (IS_OPTN) read Fbase_reward_currency_amount_invoiced write Setbase_reward_currency_amount_invoiced stored base_reward_currency_amount_invoiced_Specified;
    property reward_currency_amount_invoiced:      string  Index (IS_OPTN) read Freward_currency_amount_invoiced write Setreward_currency_amount_invoiced stored reward_currency_amount_invoiced_Specified;
    property base_reward_currency_amount_refunded: string  Index (IS_OPTN) read Fbase_reward_currency_amount_refunded write Setbase_reward_currency_amount_refunded stored base_reward_currency_amount_refunded_Specified;
    property reward_currency_amount_refunded:      string  Index (IS_OPTN) read Freward_currency_amount_refunded write Setreward_currency_amount_refunded stored reward_currency_amount_refunded_Specified;
    property reward_points_balance_refunded:       string  Index (IS_OPTN) read Freward_points_balance_refunded write Setreward_points_balance_refunded stored reward_points_balance_refunded_Specified;
    property reward_points_balance_to_refund:      string  Index (IS_OPTN) read Freward_points_balance_to_refund write Setreward_points_balance_to_refund stored reward_points_balance_to_refund_Specified;
    property reward_salesrule_points:              string  Index (IS_OPTN) read Freward_salesrule_points write Setreward_salesrule_points stored reward_salesrule_points_Specified;
    property firstname:                            string  Index (IS_OPTN) read Ffirstname write Setfirstname stored firstname_Specified;
    property lastname:                             string  Index (IS_OPTN) read Flastname write Setlastname stored lastname_Specified;
    property telephone:                            string  Index (IS_OPTN) read Ftelephone write Settelephone stored telephone_Specified;
    property postcode:                             string  Index (IS_OPTN) read Fpostcode write Setpostcode stored postcode_Specified;
  end;



  // ************************************************************************ //
  // XML       : catalogProductCustomOptionValueUpdateEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogProductCustomOptionValueUpdateEntity = class(TRemotable)
  private
    Ftitle: string;
    Fprice: string;
    Fprice_type: string;
    Fsku: string;
    Fsort_order: string;
    Fsort_order_Specified: boolean;
    procedure Setsort_order(Index: Integer; const Astring: string);
    function  sort_order_Specified(Index: Integer): boolean;
  published
    property title:      string  read Ftitle write Ftitle;
    property price:      string  read Fprice write Fprice;
    property price_type: string  read Fprice_type write Fprice_type;
    property sku:        string  read Fsku write Fsku;
    property sort_order: string  Index (IS_OPTN) read Fsort_order write Setsort_order stored sort_order_Specified;
  end;



  // ************************************************************************ //
  // XML       : catalogProductCustomOptionValueListEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogProductCustomOptionValueListEntity = class(TRemotable)
  private
    Fvalue_id: string;
    Ftitle: string;
    Fprice: string;
    Fprice_type: string;
    Fsku: string;
    Fsort_order: string;
  published
    property value_id:   string  read Fvalue_id write Fvalue_id;
    property title:      string  read Ftitle write Ftitle;
    property price:      string  read Fprice write Fprice;
    property price_type: string  read Fprice_type write Fprice_type;
    property sku:        string  read Fsku write Fsku;
    property sort_order: string  read Fsort_order write Fsort_order;
  end;



  // ************************************************************************ //
  // XML       : catalogProductSpecialPriceReturnEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogProductSpecialPriceReturnEntity = class(TRemotable)
  private
    Fspecial_price: string;
    Fspecial_from_date: string;
    Fspecial_to_date: string;
  published
    property special_price:     string  read Fspecial_price write Fspecial_price;
    property special_from_date: string  read Fspecial_from_date write Fspecial_from_date;
    property special_to_date:   string  read Fspecial_to_date write Fspecial_to_date;
  end;



  // ************************************************************************ //
  // XML       : salesOrderAddressEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  salesOrderAddressEntity = class(TRemotable)
  private
    Fincrement_id: string;
    Fincrement_id_Specified: boolean;
    Fparent_id: string;
    Fparent_id_Specified: boolean;
    Fcreated_at: string;
    Fcreated_at_Specified: boolean;
    Fupdated_at: string;
    Fupdated_at_Specified: boolean;
    Fis_active: string;
    Fis_active_Specified: boolean;
    Faddress_type: string;
    Faddress_type_Specified: boolean;
    Ffirstname: string;
    Ffirstname_Specified: boolean;
    Flastname: string;
    Flastname_Specified: boolean;
    Fcompany: string;
    Fcompany_Specified: boolean;
    Fstreet: string;
    Fstreet_Specified: boolean;
    Fcity: string;
    Fcity_Specified: boolean;
    Fregion: string;
    Fregion_Specified: boolean;
    Fpostcode: string;
    Fpostcode_Specified: boolean;
    Fcountry_id: string;
    Fcountry_id_Specified: boolean;
    Ftelephone: string;
    Ftelephone_Specified: boolean;
    Ffax: string;
    Ffax_Specified: boolean;
    Fregion_id: string;
    Fregion_id_Specified: boolean;
    Faddress_id: string;
    Faddress_id_Specified: boolean;
    procedure Setincrement_id(Index: Integer; const Astring: string);
    function  increment_id_Specified(Index: Integer): boolean;
    procedure Setparent_id(Index: Integer; const Astring: string);
    function  parent_id_Specified(Index: Integer): boolean;
    procedure Setcreated_at(Index: Integer; const Astring: string);
    function  created_at_Specified(Index: Integer): boolean;
    procedure Setupdated_at(Index: Integer; const Astring: string);
    function  updated_at_Specified(Index: Integer): boolean;
    procedure Setis_active(Index: Integer; const Astring: string);
    function  is_active_Specified(Index: Integer): boolean;
    procedure Setaddress_type(Index: Integer; const Astring: string);
    function  address_type_Specified(Index: Integer): boolean;
    procedure Setfirstname(Index: Integer; const Astring: string);
    function  firstname_Specified(Index: Integer): boolean;
    procedure Setlastname(Index: Integer; const Astring: string);
    function  lastname_Specified(Index: Integer): boolean;
    procedure Setcompany(Index: Integer; const Astring: string);
    function  company_Specified(Index: Integer): boolean;
    procedure Setstreet(Index: Integer; const Astring: string);
    function  street_Specified(Index: Integer): boolean;
    procedure Setcity(Index: Integer; const Astring: string);
    function  city_Specified(Index: Integer): boolean;
    procedure Setregion(Index: Integer; const Astring: string);
    function  region_Specified(Index: Integer): boolean;
    procedure Setpostcode(Index: Integer; const Astring: string);
    function  postcode_Specified(Index: Integer): boolean;
    procedure Setcountry_id(Index: Integer; const Astring: string);
    function  country_id_Specified(Index: Integer): boolean;
    procedure Settelephone(Index: Integer; const Astring: string);
    function  telephone_Specified(Index: Integer): boolean;
    procedure Setfax(Index: Integer; const Astring: string);
    function  fax_Specified(Index: Integer): boolean;
    procedure Setregion_id(Index: Integer; const Astring: string);
    function  region_id_Specified(Index: Integer): boolean;
    procedure Setaddress_id(Index: Integer; const Astring: string);
    function  address_id_Specified(Index: Integer): boolean;
  published
    property increment_id: string  Index (IS_OPTN) read Fincrement_id write Setincrement_id stored increment_id_Specified;
    property parent_id:    string  Index (IS_OPTN) read Fparent_id write Setparent_id stored parent_id_Specified;
    property created_at:   string  Index (IS_OPTN) read Fcreated_at write Setcreated_at stored created_at_Specified;
    property updated_at:   string  Index (IS_OPTN) read Fupdated_at write Setupdated_at stored updated_at_Specified;
    property is_active:    string  Index (IS_OPTN) read Fis_active write Setis_active stored is_active_Specified;
    property address_type: string  Index (IS_OPTN) read Faddress_type write Setaddress_type stored address_type_Specified;
    property firstname:    string  Index (IS_OPTN) read Ffirstname write Setfirstname stored firstname_Specified;
    property lastname:     string  Index (IS_OPTN) read Flastname write Setlastname stored lastname_Specified;
    property company:      string  Index (IS_OPTN) read Fcompany write Setcompany stored company_Specified;
    property street:       string  Index (IS_OPTN) read Fstreet write Setstreet stored street_Specified;
    property city:         string  Index (IS_OPTN) read Fcity write Setcity stored city_Specified;
    property region:       string  Index (IS_OPTN) read Fregion write Setregion stored region_Specified;
    property postcode:     string  Index (IS_OPTN) read Fpostcode write Setpostcode stored postcode_Specified;
    property country_id:   string  Index (IS_OPTN) read Fcountry_id write Setcountry_id stored country_id_Specified;
    property telephone:    string  Index (IS_OPTN) read Ftelephone write Settelephone stored telephone_Specified;
    property fax:          string  Index (IS_OPTN) read Ffax write Setfax stored fax_Specified;
    property region_id:    string  Index (IS_OPTN) read Fregion_id write Setregion_id stored region_id_Specified;
    property address_id:   string  Index (IS_OPTN) read Faddress_id write Setaddress_id stored address_id_Specified;
  end;



  // ************************************************************************ //
  // XML       : salesOrderEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  salesOrderEntity = class(TRemotable)
  private
    Fincrement_id: string;
    Fincrement_id_Specified: boolean;
    Fparent_id: string;
    Fparent_id_Specified: boolean;
    Fstore_id: string;
    Fstore_id_Specified: boolean;
    Fcreated_at: string;
    Fcreated_at_Specified: boolean;
    Fupdated_at: string;
    Fupdated_at_Specified: boolean;
    Fis_active: string;
    Fis_active_Specified: boolean;
    Fcustomer_id: string;
    Fcustomer_id_Specified: boolean;
    Ftax_amount: string;
    Ftax_amount_Specified: boolean;
    Fshipping_amount: string;
    Fshipping_amount_Specified: boolean;
    Fdiscount_amount: string;
    Fdiscount_amount_Specified: boolean;
    Fsubtotal: string;
    Fsubtotal_Specified: boolean;
    Fgrand_total: string;
    Fgrand_total_Specified: boolean;
    Ftotal_paid: string;
    Ftotal_paid_Specified: boolean;
    Ftotal_refunded: string;
    Ftotal_refunded_Specified: boolean;
    Ftotal_qty_ordered: string;
    Ftotal_qty_ordered_Specified: boolean;
    Ftotal_canceled: string;
    Ftotal_canceled_Specified: boolean;
    Ftotal_invoiced: string;
    Ftotal_invoiced_Specified: boolean;
    Ftotal_online_refunded: string;
    Ftotal_online_refunded_Specified: boolean;
    Ftotal_offline_refunded: string;
    Ftotal_offline_refunded_Specified: boolean;
    Fbase_tax_amount: string;
    Fbase_tax_amount_Specified: boolean;
    Fbase_shipping_amount: string;
    Fbase_shipping_amount_Specified: boolean;
    Fbase_discount_amount: string;
    Fbase_discount_amount_Specified: boolean;
    Fbase_subtotal: string;
    Fbase_subtotal_Specified: boolean;
    Fbase_grand_total: string;
    Fbase_grand_total_Specified: boolean;
    Fbase_total_paid: string;
    Fbase_total_paid_Specified: boolean;
    Fbase_total_refunded: string;
    Fbase_total_refunded_Specified: boolean;
    Fbase_total_qty_ordered: string;
    Fbase_total_qty_ordered_Specified: boolean;
    Fbase_total_canceled: string;
    Fbase_total_canceled_Specified: boolean;
    Fbase_total_invoiced: string;
    Fbase_total_invoiced_Specified: boolean;
    Fbase_total_online_refunded: string;
    Fbase_total_online_refunded_Specified: boolean;
    Fbase_total_offline_refunded: string;
    Fbase_total_offline_refunded_Specified: boolean;
    Fbilling_address_id: string;
    Fbilling_address_id_Specified: boolean;
    Fbilling_firstname: string;
    Fbilling_firstname_Specified: boolean;
    Fbilling_lastname: string;
    Fbilling_lastname_Specified: boolean;
    Fshipping_address_id: string;
    Fshipping_address_id_Specified: boolean;
    Fshipping_firstname: string;
    Fshipping_firstname_Specified: boolean;
    Fshipping_lastname: string;
    Fshipping_lastname_Specified: boolean;
    Fbilling_name: string;
    Fbilling_name_Specified: boolean;
    Fshipping_name: string;
    Fshipping_name_Specified: boolean;
    Fstore_to_base_rate: string;
    Fstore_to_base_rate_Specified: boolean;
    Fstore_to_order_rate: string;
    Fstore_to_order_rate_Specified: boolean;
    Fbase_to_global_rate: string;
    Fbase_to_global_rate_Specified: boolean;
    Fbase_to_order_rate: string;
    Fbase_to_order_rate_Specified: boolean;
    Fweight: string;
    Fweight_Specified: boolean;
    Fstore_name: string;
    Fstore_name_Specified: boolean;
    Fremote_ip: string;
    Fremote_ip_Specified: boolean;
    Fstatus: string;
    Fstatus_Specified: boolean;
    Fstate: string;
    Fstate_Specified: boolean;
    Fapplied_rule_ids: string;
    Fapplied_rule_ids_Specified: boolean;
    Fglobal_currency_code: string;
    Fglobal_currency_code_Specified: boolean;
    Fbase_currency_code: string;
    Fbase_currency_code_Specified: boolean;
    Fstore_currency_code: string;
    Fstore_currency_code_Specified: boolean;
    Forder_currency_code: string;
    Forder_currency_code_Specified: boolean;
    Fshipping_method: string;
    Fshipping_method_Specified: boolean;
    Fshipping_description: string;
    Fshipping_description_Specified: boolean;
    Fcustomer_email: string;
    Fcustomer_email_Specified: boolean;
    Fcustomer_firstname: string;
    Fcustomer_firstname_Specified: boolean;
    Fcustomer_lastname: string;
    Fcustomer_lastname_Specified: boolean;
    Fquote_id: string;
    Fquote_id_Specified: boolean;
    Fis_virtual: string;
    Fis_virtual_Specified: boolean;
    Fcustomer_group_id: string;
    Fcustomer_group_id_Specified: boolean;
    Fcustomer_note_notify: string;
    Fcustomer_note_notify_Specified: boolean;
    Fcustomer_is_guest: string;
    Fcustomer_is_guest_Specified: boolean;
    Femail_sent: string;
    Femail_sent_Specified: boolean;
    Forder_id: string;
    Forder_id_Specified: boolean;
    Fgift_message_id: string;
    Fgift_message_id_Specified: boolean;
    Fgift_message: string;
    Fgift_message_Specified: boolean;
    Fshipping_address: salesOrderAddressEntity;
    Fshipping_address_Specified: boolean;
    Fbilling_address: salesOrderAddressEntity;
    Fbilling_address_Specified: boolean;
    Fitems: salesOrderItemEntityArray;
    Fitems_Specified: boolean;
    Fpayment: salesOrderPaymentEntity;
    Fpayment_Specified: boolean;
    Fstatus_history: salesOrderStatusHistoryEntityArray;
    Fstatus_history_Specified: boolean;
    procedure Setincrement_id(Index: Integer; const Astring: string);
    function  increment_id_Specified(Index: Integer): boolean;
    procedure Setparent_id(Index: Integer; const Astring: string);
    function  parent_id_Specified(Index: Integer): boolean;
    procedure Setstore_id(Index: Integer; const Astring: string);
    function  store_id_Specified(Index: Integer): boolean;
    procedure Setcreated_at(Index: Integer; const Astring: string);
    function  created_at_Specified(Index: Integer): boolean;
    procedure Setupdated_at(Index: Integer; const Astring: string);
    function  updated_at_Specified(Index: Integer): boolean;
    procedure Setis_active(Index: Integer; const Astring: string);
    function  is_active_Specified(Index: Integer): boolean;
    procedure Setcustomer_id(Index: Integer; const Astring: string);
    function  customer_id_Specified(Index: Integer): boolean;
    procedure Settax_amount(Index: Integer; const Astring: string);
    function  tax_amount_Specified(Index: Integer): boolean;
    procedure Setshipping_amount(Index: Integer; const Astring: string);
    function  shipping_amount_Specified(Index: Integer): boolean;
    procedure Setdiscount_amount(Index: Integer; const Astring: string);
    function  discount_amount_Specified(Index: Integer): boolean;
    procedure Setsubtotal(Index: Integer; const Astring: string);
    function  subtotal_Specified(Index: Integer): boolean;
    procedure Setgrand_total(Index: Integer; const Astring: string);
    function  grand_total_Specified(Index: Integer): boolean;
    procedure Settotal_paid(Index: Integer; const Astring: string);
    function  total_paid_Specified(Index: Integer): boolean;
    procedure Settotal_refunded(Index: Integer; const Astring: string);
    function  total_refunded_Specified(Index: Integer): boolean;
    procedure Settotal_qty_ordered(Index: Integer; const Astring: string);
    function  total_qty_ordered_Specified(Index: Integer): boolean;
    procedure Settotal_canceled(Index: Integer; const Astring: string);
    function  total_canceled_Specified(Index: Integer): boolean;
    procedure Settotal_invoiced(Index: Integer; const Astring: string);
    function  total_invoiced_Specified(Index: Integer): boolean;
    procedure Settotal_online_refunded(Index: Integer; const Astring: string);
    function  total_online_refunded_Specified(Index: Integer): boolean;
    procedure Settotal_offline_refunded(Index: Integer; const Astring: string);
    function  total_offline_refunded_Specified(Index: Integer): boolean;
    procedure Setbase_tax_amount(Index: Integer; const Astring: string);
    function  base_tax_amount_Specified(Index: Integer): boolean;
    procedure Setbase_shipping_amount(Index: Integer; const Astring: string);
    function  base_shipping_amount_Specified(Index: Integer): boolean;
    procedure Setbase_discount_amount(Index: Integer; const Astring: string);
    function  base_discount_amount_Specified(Index: Integer): boolean;
    procedure Setbase_subtotal(Index: Integer; const Astring: string);
    function  base_subtotal_Specified(Index: Integer): boolean;
    procedure Setbase_grand_total(Index: Integer; const Astring: string);
    function  base_grand_total_Specified(Index: Integer): boolean;
    procedure Setbase_total_paid(Index: Integer; const Astring: string);
    function  base_total_paid_Specified(Index: Integer): boolean;
    procedure Setbase_total_refunded(Index: Integer; const Astring: string);
    function  base_total_refunded_Specified(Index: Integer): boolean;
    procedure Setbase_total_qty_ordered(Index: Integer; const Astring: string);
    function  base_total_qty_ordered_Specified(Index: Integer): boolean;
    procedure Setbase_total_canceled(Index: Integer; const Astring: string);
    function  base_total_canceled_Specified(Index: Integer): boolean;
    procedure Setbase_total_invoiced(Index: Integer; const Astring: string);
    function  base_total_invoiced_Specified(Index: Integer): boolean;
    procedure Setbase_total_online_refunded(Index: Integer; const Astring: string);
    function  base_total_online_refunded_Specified(Index: Integer): boolean;
    procedure Setbase_total_offline_refunded(Index: Integer; const Astring: string);
    function  base_total_offline_refunded_Specified(Index: Integer): boolean;
    procedure Setbilling_address_id(Index: Integer; const Astring: string);
    function  billing_address_id_Specified(Index: Integer): boolean;
    procedure Setbilling_firstname(Index: Integer; const Astring: string);
    function  billing_firstname_Specified(Index: Integer): boolean;
    procedure Setbilling_lastname(Index: Integer; const Astring: string);
    function  billing_lastname_Specified(Index: Integer): boolean;
    procedure Setshipping_address_id(Index: Integer; const Astring: string);
    function  shipping_address_id_Specified(Index: Integer): boolean;
    procedure Setshipping_firstname(Index: Integer; const Astring: string);
    function  shipping_firstname_Specified(Index: Integer): boolean;
    procedure Setshipping_lastname(Index: Integer; const Astring: string);
    function  shipping_lastname_Specified(Index: Integer): boolean;
    procedure Setbilling_name(Index: Integer; const Astring: string);
    function  billing_name_Specified(Index: Integer): boolean;
    procedure Setshipping_name(Index: Integer; const Astring: string);
    function  shipping_name_Specified(Index: Integer): boolean;
    procedure Setstore_to_base_rate(Index: Integer; const Astring: string);
    function  store_to_base_rate_Specified(Index: Integer): boolean;
    procedure Setstore_to_order_rate(Index: Integer; const Astring: string);
    function  store_to_order_rate_Specified(Index: Integer): boolean;
    procedure Setbase_to_global_rate(Index: Integer; const Astring: string);
    function  base_to_global_rate_Specified(Index: Integer): boolean;
    procedure Setbase_to_order_rate(Index: Integer; const Astring: string);
    function  base_to_order_rate_Specified(Index: Integer): boolean;
    procedure Setweight(Index: Integer; const Astring: string);
    function  weight_Specified(Index: Integer): boolean;
    procedure Setstore_name(Index: Integer; const Astring: string);
    function  store_name_Specified(Index: Integer): boolean;
    procedure Setremote_ip(Index: Integer; const Astring: string);
    function  remote_ip_Specified(Index: Integer): boolean;
    procedure Setstatus(Index: Integer; const Astring: string);
    function  status_Specified(Index: Integer): boolean;
    procedure Setstate(Index: Integer; const Astring: string);
    function  state_Specified(Index: Integer): boolean;
    procedure Setapplied_rule_ids(Index: Integer; const Astring: string);
    function  applied_rule_ids_Specified(Index: Integer): boolean;
    procedure Setglobal_currency_code(Index: Integer; const Astring: string);
    function  global_currency_code_Specified(Index: Integer): boolean;
    procedure Setbase_currency_code(Index: Integer; const Astring: string);
    function  base_currency_code_Specified(Index: Integer): boolean;
    procedure Setstore_currency_code(Index: Integer; const Astring: string);
    function  store_currency_code_Specified(Index: Integer): boolean;
    procedure Setorder_currency_code(Index: Integer; const Astring: string);
    function  order_currency_code_Specified(Index: Integer): boolean;
    procedure Setshipping_method(Index: Integer; const Astring: string);
    function  shipping_method_Specified(Index: Integer): boolean;
    procedure Setshipping_description(Index: Integer; const Astring: string);
    function  shipping_description_Specified(Index: Integer): boolean;
    procedure Setcustomer_email(Index: Integer; const Astring: string);
    function  customer_email_Specified(Index: Integer): boolean;
    procedure Setcustomer_firstname(Index: Integer; const Astring: string);
    function  customer_firstname_Specified(Index: Integer): boolean;
    procedure Setcustomer_lastname(Index: Integer; const Astring: string);
    function  customer_lastname_Specified(Index: Integer): boolean;
    procedure Setquote_id(Index: Integer; const Astring: string);
    function  quote_id_Specified(Index: Integer): boolean;
    procedure Setis_virtual(Index: Integer; const Astring: string);
    function  is_virtual_Specified(Index: Integer): boolean;
    procedure Setcustomer_group_id(Index: Integer; const Astring: string);
    function  customer_group_id_Specified(Index: Integer): boolean;
    procedure Setcustomer_note_notify(Index: Integer; const Astring: string);
    function  customer_note_notify_Specified(Index: Integer): boolean;
    procedure Setcustomer_is_guest(Index: Integer; const Astring: string);
    function  customer_is_guest_Specified(Index: Integer): boolean;
    procedure Setemail_sent(Index: Integer; const Astring: string);
    function  email_sent_Specified(Index: Integer): boolean;
    procedure Setorder_id(Index: Integer; const Astring: string);
    function  order_id_Specified(Index: Integer): boolean;
    procedure Setgift_message_id(Index: Integer; const Astring: string);
    function  gift_message_id_Specified(Index: Integer): boolean;
    procedure Setgift_message(Index: Integer; const Astring: string);
    function  gift_message_Specified(Index: Integer): boolean;
    procedure Setshipping_address(Index: Integer; const AsalesOrderAddressEntity: salesOrderAddressEntity);
    function  shipping_address_Specified(Index: Integer): boolean;
    procedure Setbilling_address(Index: Integer; const AsalesOrderAddressEntity: salesOrderAddressEntity);
    function  billing_address_Specified(Index: Integer): boolean;
    procedure Setitems(Index: Integer; const AsalesOrderItemEntityArray: salesOrderItemEntityArray);
    function  items_Specified(Index: Integer): boolean;
    procedure Setpayment(Index: Integer; const AsalesOrderPaymentEntity: salesOrderPaymentEntity);
    function  payment_Specified(Index: Integer): boolean;
    procedure Setstatus_history(Index: Integer; const AsalesOrderStatusHistoryEntityArray: salesOrderStatusHistoryEntityArray);
    function  status_history_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property increment_id:                string                              Index (IS_OPTN) read Fincrement_id write Setincrement_id stored increment_id_Specified;
    property parent_id:                   string                              Index (IS_OPTN) read Fparent_id write Setparent_id stored parent_id_Specified;
    property store_id:                    string                              Index (IS_OPTN) read Fstore_id write Setstore_id stored store_id_Specified;
    property created_at:                  string                              Index (IS_OPTN) read Fcreated_at write Setcreated_at stored created_at_Specified;
    property updated_at:                  string                              Index (IS_OPTN) read Fupdated_at write Setupdated_at stored updated_at_Specified;
    property is_active:                   string                              Index (IS_OPTN) read Fis_active write Setis_active stored is_active_Specified;
    property customer_id:                 string                              Index (IS_OPTN) read Fcustomer_id write Setcustomer_id stored customer_id_Specified;
    property tax_amount:                  string                              Index (IS_OPTN) read Ftax_amount write Settax_amount stored tax_amount_Specified;
    property shipping_amount:             string                              Index (IS_OPTN) read Fshipping_amount write Setshipping_amount stored shipping_amount_Specified;
    property discount_amount:             string                              Index (IS_OPTN) read Fdiscount_amount write Setdiscount_amount stored discount_amount_Specified;
    property subtotal:                    string                              Index (IS_OPTN) read Fsubtotal write Setsubtotal stored subtotal_Specified;
    property grand_total:                 string                              Index (IS_OPTN) read Fgrand_total write Setgrand_total stored grand_total_Specified;
    property total_paid:                  string                              Index (IS_OPTN) read Ftotal_paid write Settotal_paid stored total_paid_Specified;
    property total_refunded:              string                              Index (IS_OPTN) read Ftotal_refunded write Settotal_refunded stored total_refunded_Specified;
    property total_qty_ordered:           string                              Index (IS_OPTN) read Ftotal_qty_ordered write Settotal_qty_ordered stored total_qty_ordered_Specified;
    property total_canceled:              string                              Index (IS_OPTN) read Ftotal_canceled write Settotal_canceled stored total_canceled_Specified;
    property total_invoiced:              string                              Index (IS_OPTN) read Ftotal_invoiced write Settotal_invoiced stored total_invoiced_Specified;
    property total_online_refunded:       string                              Index (IS_OPTN) read Ftotal_online_refunded write Settotal_online_refunded stored total_online_refunded_Specified;
    property total_offline_refunded:      string                              Index (IS_OPTN) read Ftotal_offline_refunded write Settotal_offline_refunded stored total_offline_refunded_Specified;
    property base_tax_amount:             string                              Index (IS_OPTN) read Fbase_tax_amount write Setbase_tax_amount stored base_tax_amount_Specified;
    property base_shipping_amount:        string                              Index (IS_OPTN) read Fbase_shipping_amount write Setbase_shipping_amount stored base_shipping_amount_Specified;
    property base_discount_amount:        string                              Index (IS_OPTN) read Fbase_discount_amount write Setbase_discount_amount stored base_discount_amount_Specified;
    property base_subtotal:               string                              Index (IS_OPTN) read Fbase_subtotal write Setbase_subtotal stored base_subtotal_Specified;
    property base_grand_total:            string                              Index (IS_OPTN) read Fbase_grand_total write Setbase_grand_total stored base_grand_total_Specified;
    property base_total_paid:             string                              Index (IS_OPTN) read Fbase_total_paid write Setbase_total_paid stored base_total_paid_Specified;
    property base_total_refunded:         string                              Index (IS_OPTN) read Fbase_total_refunded write Setbase_total_refunded stored base_total_refunded_Specified;
    property base_total_qty_ordered:      string                              Index (IS_OPTN) read Fbase_total_qty_ordered write Setbase_total_qty_ordered stored base_total_qty_ordered_Specified;
    property base_total_canceled:         string                              Index (IS_OPTN) read Fbase_total_canceled write Setbase_total_canceled stored base_total_canceled_Specified;
    property base_total_invoiced:         string                              Index (IS_OPTN) read Fbase_total_invoiced write Setbase_total_invoiced stored base_total_invoiced_Specified;
    property base_total_online_refunded:  string                              Index (IS_OPTN) read Fbase_total_online_refunded write Setbase_total_online_refunded stored base_total_online_refunded_Specified;
    property base_total_offline_refunded: string                              Index (IS_OPTN) read Fbase_total_offline_refunded write Setbase_total_offline_refunded stored base_total_offline_refunded_Specified;
    property billing_address_id:          string                              Index (IS_OPTN) read Fbilling_address_id write Setbilling_address_id stored billing_address_id_Specified;
    property billing_firstname:           string                              Index (IS_OPTN) read Fbilling_firstname write Setbilling_firstname stored billing_firstname_Specified;
    property billing_lastname:            string                              Index (IS_OPTN) read Fbilling_lastname write Setbilling_lastname stored billing_lastname_Specified;
    property shipping_address_id:         string                              Index (IS_OPTN) read Fshipping_address_id write Setshipping_address_id stored shipping_address_id_Specified;
    property shipping_firstname:          string                              Index (IS_OPTN) read Fshipping_firstname write Setshipping_firstname stored shipping_firstname_Specified;
    property shipping_lastname:           string                              Index (IS_OPTN) read Fshipping_lastname write Setshipping_lastname stored shipping_lastname_Specified;
    property billing_name:                string                              Index (IS_OPTN) read Fbilling_name write Setbilling_name stored billing_name_Specified;
    property shipping_name:               string                              Index (IS_OPTN) read Fshipping_name write Setshipping_name stored shipping_name_Specified;
    property store_to_base_rate:          string                              Index (IS_OPTN) read Fstore_to_base_rate write Setstore_to_base_rate stored store_to_base_rate_Specified;
    property store_to_order_rate:         string                              Index (IS_OPTN) read Fstore_to_order_rate write Setstore_to_order_rate stored store_to_order_rate_Specified;
    property base_to_global_rate:         string                              Index (IS_OPTN) read Fbase_to_global_rate write Setbase_to_global_rate stored base_to_global_rate_Specified;
    property base_to_order_rate:          string                              Index (IS_OPTN) read Fbase_to_order_rate write Setbase_to_order_rate stored base_to_order_rate_Specified;
    property weight:                      string                              Index (IS_OPTN) read Fweight write Setweight stored weight_Specified;
    property store_name:                  string                              Index (IS_OPTN) read Fstore_name write Setstore_name stored store_name_Specified;
    property remote_ip:                   string                              Index (IS_OPTN) read Fremote_ip write Setremote_ip stored remote_ip_Specified;
    property status:                      string                              Index (IS_OPTN) read Fstatus write Setstatus stored status_Specified;
    property state:                       string                              Index (IS_OPTN) read Fstate write Setstate stored state_Specified;
    property applied_rule_ids:            string                              Index (IS_OPTN) read Fapplied_rule_ids write Setapplied_rule_ids stored applied_rule_ids_Specified;
    property global_currency_code:        string                              Index (IS_OPTN) read Fglobal_currency_code write Setglobal_currency_code stored global_currency_code_Specified;
    property base_currency_code:          string                              Index (IS_OPTN) read Fbase_currency_code write Setbase_currency_code stored base_currency_code_Specified;
    property store_currency_code:         string                              Index (IS_OPTN) read Fstore_currency_code write Setstore_currency_code stored store_currency_code_Specified;
    property order_currency_code:         string                              Index (IS_OPTN) read Forder_currency_code write Setorder_currency_code stored order_currency_code_Specified;
    property shipping_method:             string                              Index (IS_OPTN) read Fshipping_method write Setshipping_method stored shipping_method_Specified;
    property shipping_description:        string                              Index (IS_OPTN) read Fshipping_description write Setshipping_description stored shipping_description_Specified;
    property customer_email:              string                              Index (IS_OPTN) read Fcustomer_email write Setcustomer_email stored customer_email_Specified;
    property customer_firstname:          string                              Index (IS_OPTN) read Fcustomer_firstname write Setcustomer_firstname stored customer_firstname_Specified;
    property customer_lastname:           string                              Index (IS_OPTN) read Fcustomer_lastname write Setcustomer_lastname stored customer_lastname_Specified;
    property quote_id:                    string                              Index (IS_OPTN) read Fquote_id write Setquote_id stored quote_id_Specified;
    property is_virtual:                  string                              Index (IS_OPTN) read Fis_virtual write Setis_virtual stored is_virtual_Specified;
    property customer_group_id:           string                              Index (IS_OPTN) read Fcustomer_group_id write Setcustomer_group_id stored customer_group_id_Specified;
    property customer_note_notify:        string                              Index (IS_OPTN) read Fcustomer_note_notify write Setcustomer_note_notify stored customer_note_notify_Specified;
    property customer_is_guest:           string                              Index (IS_OPTN) read Fcustomer_is_guest write Setcustomer_is_guest stored customer_is_guest_Specified;
    property email_sent:                  string                              Index (IS_OPTN) read Femail_sent write Setemail_sent stored email_sent_Specified;
    property order_id:                    string                              Index (IS_OPTN) read Forder_id write Setorder_id stored order_id_Specified;
    property gift_message_id:             string                              Index (IS_OPTN) read Fgift_message_id write Setgift_message_id stored gift_message_id_Specified;
    property gift_message:                string                              Index (IS_OPTN) read Fgift_message write Setgift_message stored gift_message_Specified;
    property shipping_address:            salesOrderAddressEntity             Index (IS_OPTN) read Fshipping_address write Setshipping_address stored shipping_address_Specified;
    property billing_address:             salesOrderAddressEntity             Index (IS_OPTN) read Fbilling_address write Setbilling_address stored billing_address_Specified;
    property items:                       salesOrderItemEntityArray           Index (IS_OPTN) read Fitems write Setitems stored items_Specified;
    property payment:                     salesOrderPaymentEntity             Index (IS_OPTN) read Fpayment write Setpayment stored payment_Specified;
    property status_history:              salesOrderStatusHistoryEntityArray  Index (IS_OPTN) read Fstatus_history write Setstatus_history stored status_history_Specified;
  end;



  // ************************************************************************ //
  // XML       : catalogProductCustomOptionValueInfoEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogProductCustomOptionValueInfoEntity = class(TRemotable)
  private
    Fvalue_id: string;
    Foption_id: string;
    Fsku: string;
    Fsort_order: string;
    Fdefault_price: string;
    Fdefault_price_type: string;
    Fstore_price: string;
    Fstore_price_type: string;
    Fprice: string;
    Fprice_type: string;
    Fdefault_title: string;
    Fstore_title: string;
    Ftitle: string;
  published
    property value_id:           string  read Fvalue_id write Fvalue_id;
    property option_id:          string  read Foption_id write Foption_id;
    property sku:                string  read Fsku write Fsku;
    property sort_order:         string  read Fsort_order write Fsort_order;
    property default_price:      string  read Fdefault_price write Fdefault_price;
    property default_price_type: string  read Fdefault_price_type write Fdefault_price_type;
    property store_price:        string  read Fstore_price write Fstore_price;
    property store_price_type:   string  read Fstore_price_type write Fstore_price_type;
    property price:              string  read Fprice write Fprice;
    property price_type:         string  read Fprice_type write Fprice_type;
    property default_title:      string  read Fdefault_title write Fdefault_title;
    property store_title:        string  read Fstore_title write Fstore_title;
    property title:              string  read Ftitle write Ftitle;
  end;



  // ************************************************************************ //
  // XML       : catalogProductCustomOptionValueAddEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogProductCustomOptionValueAddEntity = class(TRemotable)
  private
    Ftitle: string;
    Fprice: string;
    Fprice_type: string;
    Fsku: string;
    Fsort_order: string;
    Fsort_order_Specified: boolean;
    procedure Setsort_order(Index: Integer; const Astring: string);
    function  sort_order_Specified(Index: Integer): boolean;
  published
    property title:      string  read Ftitle write Ftitle;
    property price:      string  read Fprice write Fprice;
    property price_type: string  read Fprice_type write Fprice_type;
    property sku:        string  read Fsku write Fsku;
    property sort_order: string  Index (IS_OPTN) read Fsort_order write Setsort_order stored sort_order_Specified;
  end;



  // ************************************************************************ //
  // XML       : salesOrderInvoiceItemEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  salesOrderInvoiceItemEntity = class(TRemotable)
  private
    Fincrement_id: string;
    Fincrement_id_Specified: boolean;
    Fparent_id: string;
    Fparent_id_Specified: boolean;
    Fcreated_at: string;
    Fcreated_at_Specified: boolean;
    Fupdated_at: string;
    Fupdated_at_Specified: boolean;
    Fis_active: string;
    Fis_active_Specified: boolean;
    Fweee_tax_applied: string;
    Fweee_tax_applied_Specified: boolean;
    Fqty: string;
    Fqty_Specified: boolean;
    Fcost: string;
    Fcost_Specified: boolean;
    Fprice: string;
    Fprice_Specified: boolean;
    Ftax_amount: string;
    Ftax_amount_Specified: boolean;
    Frow_total: string;
    Frow_total_Specified: boolean;
    Fbase_price: string;
    Fbase_price_Specified: boolean;
    Fbase_tax_amount: string;
    Fbase_tax_amount_Specified: boolean;
    Fbase_row_total: string;
    Fbase_row_total_Specified: boolean;
    Fbase_weee_tax_applied_amount: string;
    Fbase_weee_tax_applied_amount_Specified: boolean;
    Fbase_weee_tax_applied_row_amount: string;
    Fbase_weee_tax_applied_row_amount_Specified: boolean;
    Fweee_tax_applied_amount: string;
    Fweee_tax_applied_amount_Specified: boolean;
    Fweee_tax_applied_row_amount: string;
    Fweee_tax_applied_row_amount_Specified: boolean;
    Fweee_tax_disposition: string;
    Fweee_tax_disposition_Specified: boolean;
    Fweee_tax_row_disposition: string;
    Fweee_tax_row_disposition_Specified: boolean;
    Fbase_weee_tax_disposition: string;
    Fbase_weee_tax_disposition_Specified: boolean;
    Fbase_weee_tax_row_disposition: string;
    Fbase_weee_tax_row_disposition_Specified: boolean;
    Fsku: string;
    Fsku_Specified: boolean;
    Fname_: string;
    Fname__Specified: boolean;
    Forder_item_id: string;
    Forder_item_id_Specified: boolean;
    Fproduct_id: string;
    Fproduct_id_Specified: boolean;
    Fitem_id: string;
    Fitem_id_Specified: boolean;
    procedure Setincrement_id(Index: Integer; const Astring: string);
    function  increment_id_Specified(Index: Integer): boolean;
    procedure Setparent_id(Index: Integer; const Astring: string);
    function  parent_id_Specified(Index: Integer): boolean;
    procedure Setcreated_at(Index: Integer; const Astring: string);
    function  created_at_Specified(Index: Integer): boolean;
    procedure Setupdated_at(Index: Integer; const Astring: string);
    function  updated_at_Specified(Index: Integer): boolean;
    procedure Setis_active(Index: Integer; const Astring: string);
    function  is_active_Specified(Index: Integer): boolean;
    procedure Setweee_tax_applied(Index: Integer; const Astring: string);
    function  weee_tax_applied_Specified(Index: Integer): boolean;
    procedure Setqty(Index: Integer; const Astring: string);
    function  qty_Specified(Index: Integer): boolean;
    procedure Setcost(Index: Integer; const Astring: string);
    function  cost_Specified(Index: Integer): boolean;
    procedure Setprice(Index: Integer; const Astring: string);
    function  price_Specified(Index: Integer): boolean;
    procedure Settax_amount(Index: Integer; const Astring: string);
    function  tax_amount_Specified(Index: Integer): boolean;
    procedure Setrow_total(Index: Integer; const Astring: string);
    function  row_total_Specified(Index: Integer): boolean;
    procedure Setbase_price(Index: Integer; const Astring: string);
    function  base_price_Specified(Index: Integer): boolean;
    procedure Setbase_tax_amount(Index: Integer; const Astring: string);
    function  base_tax_amount_Specified(Index: Integer): boolean;
    procedure Setbase_row_total(Index: Integer; const Astring: string);
    function  base_row_total_Specified(Index: Integer): boolean;
    procedure Setbase_weee_tax_applied_amount(Index: Integer; const Astring: string);
    function  base_weee_tax_applied_amount_Specified(Index: Integer): boolean;
    procedure Setbase_weee_tax_applied_row_amount(Index: Integer; const Astring: string);
    function  base_weee_tax_applied_row_amount_Specified(Index: Integer): boolean;
    procedure Setweee_tax_applied_amount(Index: Integer; const Astring: string);
    function  weee_tax_applied_amount_Specified(Index: Integer): boolean;
    procedure Setweee_tax_applied_row_amount(Index: Integer; const Astring: string);
    function  weee_tax_applied_row_amount_Specified(Index: Integer): boolean;
    procedure Setweee_tax_disposition(Index: Integer; const Astring: string);
    function  weee_tax_disposition_Specified(Index: Integer): boolean;
    procedure Setweee_tax_row_disposition(Index: Integer; const Astring: string);
    function  weee_tax_row_disposition_Specified(Index: Integer): boolean;
    procedure Setbase_weee_tax_disposition(Index: Integer; const Astring: string);
    function  base_weee_tax_disposition_Specified(Index: Integer): boolean;
    procedure Setbase_weee_tax_row_disposition(Index: Integer; const Astring: string);
    function  base_weee_tax_row_disposition_Specified(Index: Integer): boolean;
    procedure Setsku(Index: Integer; const Astring: string);
    function  sku_Specified(Index: Integer): boolean;
    procedure Setname_(Index: Integer; const Astring: string);
    function  name__Specified(Index: Integer): boolean;
    procedure Setorder_item_id(Index: Integer; const Astring: string);
    function  order_item_id_Specified(Index: Integer): boolean;
    procedure Setproduct_id(Index: Integer; const Astring: string);
    function  product_id_Specified(Index: Integer): boolean;
    procedure Setitem_id(Index: Integer; const Astring: string);
    function  item_id_Specified(Index: Integer): boolean;
  published
    property increment_id:                     string  Index (IS_OPTN) read Fincrement_id write Setincrement_id stored increment_id_Specified;
    property parent_id:                        string  Index (IS_OPTN) read Fparent_id write Setparent_id stored parent_id_Specified;
    property created_at:                       string  Index (IS_OPTN) read Fcreated_at write Setcreated_at stored created_at_Specified;
    property updated_at:                       string  Index (IS_OPTN) read Fupdated_at write Setupdated_at stored updated_at_Specified;
    property is_active:                        string  Index (IS_OPTN) read Fis_active write Setis_active stored is_active_Specified;
    property weee_tax_applied:                 string  Index (IS_OPTN) read Fweee_tax_applied write Setweee_tax_applied stored weee_tax_applied_Specified;
    property qty:                              string  Index (IS_OPTN) read Fqty write Setqty stored qty_Specified;
    property cost:                             string  Index (IS_OPTN) read Fcost write Setcost stored cost_Specified;
    property price:                            string  Index (IS_OPTN) read Fprice write Setprice stored price_Specified;
    property tax_amount:                       string  Index (IS_OPTN) read Ftax_amount write Settax_amount stored tax_amount_Specified;
    property row_total:                        string  Index (IS_OPTN) read Frow_total write Setrow_total stored row_total_Specified;
    property base_price:                       string  Index (IS_OPTN) read Fbase_price write Setbase_price stored base_price_Specified;
    property base_tax_amount:                  string  Index (IS_OPTN) read Fbase_tax_amount write Setbase_tax_amount stored base_tax_amount_Specified;
    property base_row_total:                   string  Index (IS_OPTN) read Fbase_row_total write Setbase_row_total stored base_row_total_Specified;
    property base_weee_tax_applied_amount:     string  Index (IS_OPTN) read Fbase_weee_tax_applied_amount write Setbase_weee_tax_applied_amount stored base_weee_tax_applied_amount_Specified;
    property base_weee_tax_applied_row_amount: string  Index (IS_OPTN) read Fbase_weee_tax_applied_row_amount write Setbase_weee_tax_applied_row_amount stored base_weee_tax_applied_row_amount_Specified;
    property weee_tax_applied_amount:          string  Index (IS_OPTN) read Fweee_tax_applied_amount write Setweee_tax_applied_amount stored weee_tax_applied_amount_Specified;
    property weee_tax_applied_row_amount:      string  Index (IS_OPTN) read Fweee_tax_applied_row_amount write Setweee_tax_applied_row_amount stored weee_tax_applied_row_amount_Specified;
    property weee_tax_disposition:             string  Index (IS_OPTN) read Fweee_tax_disposition write Setweee_tax_disposition stored weee_tax_disposition_Specified;
    property weee_tax_row_disposition:         string  Index (IS_OPTN) read Fweee_tax_row_disposition write Setweee_tax_row_disposition stored weee_tax_row_disposition_Specified;
    property base_weee_tax_disposition:        string  Index (IS_OPTN) read Fbase_weee_tax_disposition write Setbase_weee_tax_disposition stored base_weee_tax_disposition_Specified;
    property base_weee_tax_row_disposition:    string  Index (IS_OPTN) read Fbase_weee_tax_row_disposition write Setbase_weee_tax_row_disposition stored base_weee_tax_row_disposition_Specified;
    property sku:                              string  Index (IS_OPTN) read Fsku write Setsku stored sku_Specified;
    property name_:                            string  Index (IS_OPTN) read Fname_ write Setname_ stored name__Specified;
    property order_item_id:                    string  Index (IS_OPTN) read Forder_item_id write Setorder_item_id stored order_item_id_Specified;
    property product_id:                       string  Index (IS_OPTN) read Fproduct_id write Setproduct_id stored product_id_Specified;
    property item_id:                          string  Index (IS_OPTN) read Fitem_id write Setitem_id stored item_id_Specified;
  end;



  // ************************************************************************ //
  // XML       : salesOrderInvoiceCommentEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  salesOrderInvoiceCommentEntity = class(TRemotable)
  private
    Fincrement_id: string;
    Fincrement_id_Specified: boolean;
    Fparent_id: string;
    Fparent_id_Specified: boolean;
    Fcreated_at: string;
    Fcreated_at_Specified: boolean;
    Fupdated_at: string;
    Fupdated_at_Specified: boolean;
    Fis_active: string;
    Fis_active_Specified: boolean;
    Fcomment: string;
    Fcomment_Specified: boolean;
    Fis_customer_notified: string;
    Fis_customer_notified_Specified: boolean;
    Fcomment_id: string;
    Fcomment_id_Specified: boolean;
    procedure Setincrement_id(Index: Integer; const Astring: string);
    function  increment_id_Specified(Index: Integer): boolean;
    procedure Setparent_id(Index: Integer; const Astring: string);
    function  parent_id_Specified(Index: Integer): boolean;
    procedure Setcreated_at(Index: Integer; const Astring: string);
    function  created_at_Specified(Index: Integer): boolean;
    procedure Setupdated_at(Index: Integer; const Astring: string);
    function  updated_at_Specified(Index: Integer): boolean;
    procedure Setis_active(Index: Integer; const Astring: string);
    function  is_active_Specified(Index: Integer): boolean;
    procedure Setcomment(Index: Integer; const Astring: string);
    function  comment_Specified(Index: Integer): boolean;
    procedure Setis_customer_notified(Index: Integer; const Astring: string);
    function  is_customer_notified_Specified(Index: Integer): boolean;
    procedure Setcomment_id(Index: Integer; const Astring: string);
    function  comment_id_Specified(Index: Integer): boolean;
  published
    property increment_id:         string  Index (IS_OPTN) read Fincrement_id write Setincrement_id stored increment_id_Specified;
    property parent_id:            string  Index (IS_OPTN) read Fparent_id write Setparent_id stored parent_id_Specified;
    property created_at:           string  Index (IS_OPTN) read Fcreated_at write Setcreated_at stored created_at_Specified;
    property updated_at:           string  Index (IS_OPTN) read Fupdated_at write Setupdated_at stored updated_at_Specified;
    property is_active:            string  Index (IS_OPTN) read Fis_active write Setis_active stored is_active_Specified;
    property comment:              string  Index (IS_OPTN) read Fcomment write Setcomment stored comment_Specified;
    property is_customer_notified: string  Index (IS_OPTN) read Fis_customer_notified write Setis_customer_notified stored is_customer_notified_Specified;
    property comment_id:           string  Index (IS_OPTN) read Fcomment_id write Setcomment_id stored comment_id_Specified;
  end;



  // ************************************************************************ //
  // XML       : salesOrderInvoiceEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  salesOrderInvoiceEntity = class(TRemotable)
  private
    Fincrement_id: string;
    Fincrement_id_Specified: boolean;
    Fparent_id: string;
    Fparent_id_Specified: boolean;
    Fstore_id: string;
    Fstore_id_Specified: boolean;
    Fcreated_at: string;
    Fcreated_at_Specified: boolean;
    Fupdated_at: string;
    Fupdated_at_Specified: boolean;
    Fis_active: string;
    Fis_active_Specified: boolean;
    Fglobal_currency_code: string;
    Fglobal_currency_code_Specified: boolean;
    Fbase_currency_code: string;
    Fbase_currency_code_Specified: boolean;
    Fstore_currency_code: string;
    Fstore_currency_code_Specified: boolean;
    Forder_currency_code: string;
    Forder_currency_code_Specified: boolean;
    Fstore_to_base_rate: string;
    Fstore_to_base_rate_Specified: boolean;
    Fstore_to_order_rate: string;
    Fstore_to_order_rate_Specified: boolean;
    Fbase_to_global_rate: string;
    Fbase_to_global_rate_Specified: boolean;
    Fbase_to_order_rate: string;
    Fbase_to_order_rate_Specified: boolean;
    Fsubtotal: string;
    Fsubtotal_Specified: boolean;
    Fbase_subtotal: string;
    Fbase_subtotal_Specified: boolean;
    Fbase_grand_total: string;
    Fbase_grand_total_Specified: boolean;
    Fdiscount_amount: string;
    Fdiscount_amount_Specified: boolean;
    Fbase_discount_amount: string;
    Fbase_discount_amount_Specified: boolean;
    Fshipping_amount: string;
    Fshipping_amount_Specified: boolean;
    Fbase_shipping_amount: string;
    Fbase_shipping_amount_Specified: boolean;
    Ftax_amount: string;
    Ftax_amount_Specified: boolean;
    Fbase_tax_amount: string;
    Fbase_tax_amount_Specified: boolean;
    Fbilling_address_id: string;
    Fbilling_address_id_Specified: boolean;
    Fbilling_firstname: string;
    Fbilling_firstname_Specified: boolean;
    Fbilling_lastname: string;
    Fbilling_lastname_Specified: boolean;
    Forder_id: string;
    Forder_id_Specified: boolean;
    Forder_increment_id: string;
    Forder_increment_id_Specified: boolean;
    Forder_created_at: string;
    Forder_created_at_Specified: boolean;
    Fstate: string;
    Fstate_Specified: boolean;
    Fgrand_total: string;
    Fgrand_total_Specified: boolean;
    Finvoice_id: string;
    Finvoice_id_Specified: boolean;
    Fitems: salesOrderInvoiceItemEntityArray;
    Fitems_Specified: boolean;
    Fcomments: salesOrderInvoiceCommentEntityArray;
    Fcomments_Specified: boolean;
    procedure Setincrement_id(Index: Integer; const Astring: string);
    function  increment_id_Specified(Index: Integer): boolean;
    procedure Setparent_id(Index: Integer; const Astring: string);
    function  parent_id_Specified(Index: Integer): boolean;
    procedure Setstore_id(Index: Integer; const Astring: string);
    function  store_id_Specified(Index: Integer): boolean;
    procedure Setcreated_at(Index: Integer; const Astring: string);
    function  created_at_Specified(Index: Integer): boolean;
    procedure Setupdated_at(Index: Integer; const Astring: string);
    function  updated_at_Specified(Index: Integer): boolean;
    procedure Setis_active(Index: Integer; const Astring: string);
    function  is_active_Specified(Index: Integer): boolean;
    procedure Setglobal_currency_code(Index: Integer; const Astring: string);
    function  global_currency_code_Specified(Index: Integer): boolean;
    procedure Setbase_currency_code(Index: Integer; const Astring: string);
    function  base_currency_code_Specified(Index: Integer): boolean;
    procedure Setstore_currency_code(Index: Integer; const Astring: string);
    function  store_currency_code_Specified(Index: Integer): boolean;
    procedure Setorder_currency_code(Index: Integer; const Astring: string);
    function  order_currency_code_Specified(Index: Integer): boolean;
    procedure Setstore_to_base_rate(Index: Integer; const Astring: string);
    function  store_to_base_rate_Specified(Index: Integer): boolean;
    procedure Setstore_to_order_rate(Index: Integer; const Astring: string);
    function  store_to_order_rate_Specified(Index: Integer): boolean;
    procedure Setbase_to_global_rate(Index: Integer; const Astring: string);
    function  base_to_global_rate_Specified(Index: Integer): boolean;
    procedure Setbase_to_order_rate(Index: Integer; const Astring: string);
    function  base_to_order_rate_Specified(Index: Integer): boolean;
    procedure Setsubtotal(Index: Integer; const Astring: string);
    function  subtotal_Specified(Index: Integer): boolean;
    procedure Setbase_subtotal(Index: Integer; const Astring: string);
    function  base_subtotal_Specified(Index: Integer): boolean;
    procedure Setbase_grand_total(Index: Integer; const Astring: string);
    function  base_grand_total_Specified(Index: Integer): boolean;
    procedure Setdiscount_amount(Index: Integer; const Astring: string);
    function  discount_amount_Specified(Index: Integer): boolean;
    procedure Setbase_discount_amount(Index: Integer; const Astring: string);
    function  base_discount_amount_Specified(Index: Integer): boolean;
    procedure Setshipping_amount(Index: Integer; const Astring: string);
    function  shipping_amount_Specified(Index: Integer): boolean;
    procedure Setbase_shipping_amount(Index: Integer; const Astring: string);
    function  base_shipping_amount_Specified(Index: Integer): boolean;
    procedure Settax_amount(Index: Integer; const Astring: string);
    function  tax_amount_Specified(Index: Integer): boolean;
    procedure Setbase_tax_amount(Index: Integer; const Astring: string);
    function  base_tax_amount_Specified(Index: Integer): boolean;
    procedure Setbilling_address_id(Index: Integer; const Astring: string);
    function  billing_address_id_Specified(Index: Integer): boolean;
    procedure Setbilling_firstname(Index: Integer; const Astring: string);
    function  billing_firstname_Specified(Index: Integer): boolean;
    procedure Setbilling_lastname(Index: Integer; const Astring: string);
    function  billing_lastname_Specified(Index: Integer): boolean;
    procedure Setorder_id(Index: Integer; const Astring: string);
    function  order_id_Specified(Index: Integer): boolean;
    procedure Setorder_increment_id(Index: Integer; const Astring: string);
    function  order_increment_id_Specified(Index: Integer): boolean;
    procedure Setorder_created_at(Index: Integer; const Astring: string);
    function  order_created_at_Specified(Index: Integer): boolean;
    procedure Setstate(Index: Integer; const Astring: string);
    function  state_Specified(Index: Integer): boolean;
    procedure Setgrand_total(Index: Integer; const Astring: string);
    function  grand_total_Specified(Index: Integer): boolean;
    procedure Setinvoice_id(Index: Integer; const Astring: string);
    function  invoice_id_Specified(Index: Integer): boolean;
    procedure Setitems(Index: Integer; const AsalesOrderInvoiceItemEntityArray: salesOrderInvoiceItemEntityArray);
    function  items_Specified(Index: Integer): boolean;
    procedure Setcomments(Index: Integer; const AsalesOrderInvoiceCommentEntityArray: salesOrderInvoiceCommentEntityArray);
    function  comments_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property increment_id:         string                               Index (IS_OPTN) read Fincrement_id write Setincrement_id stored increment_id_Specified;
    property parent_id:            string                               Index (IS_OPTN) read Fparent_id write Setparent_id stored parent_id_Specified;
    property store_id:             string                               Index (IS_OPTN) read Fstore_id write Setstore_id stored store_id_Specified;
    property created_at:           string                               Index (IS_OPTN) read Fcreated_at write Setcreated_at stored created_at_Specified;
    property updated_at:           string                               Index (IS_OPTN) read Fupdated_at write Setupdated_at stored updated_at_Specified;
    property is_active:            string                               Index (IS_OPTN) read Fis_active write Setis_active stored is_active_Specified;
    property global_currency_code: string                               Index (IS_OPTN) read Fglobal_currency_code write Setglobal_currency_code stored global_currency_code_Specified;
    property base_currency_code:   string                               Index (IS_OPTN) read Fbase_currency_code write Setbase_currency_code stored base_currency_code_Specified;
    property store_currency_code:  string                               Index (IS_OPTN) read Fstore_currency_code write Setstore_currency_code stored store_currency_code_Specified;
    property order_currency_code:  string                               Index (IS_OPTN) read Forder_currency_code write Setorder_currency_code stored order_currency_code_Specified;
    property store_to_base_rate:   string                               Index (IS_OPTN) read Fstore_to_base_rate write Setstore_to_base_rate stored store_to_base_rate_Specified;
    property store_to_order_rate:  string                               Index (IS_OPTN) read Fstore_to_order_rate write Setstore_to_order_rate stored store_to_order_rate_Specified;
    property base_to_global_rate:  string                               Index (IS_OPTN) read Fbase_to_global_rate write Setbase_to_global_rate stored base_to_global_rate_Specified;
    property base_to_order_rate:   string                               Index (IS_OPTN) read Fbase_to_order_rate write Setbase_to_order_rate stored base_to_order_rate_Specified;
    property subtotal:             string                               Index (IS_OPTN) read Fsubtotal write Setsubtotal stored subtotal_Specified;
    property base_subtotal:        string                               Index (IS_OPTN) read Fbase_subtotal write Setbase_subtotal stored base_subtotal_Specified;
    property base_grand_total:     string                               Index (IS_OPTN) read Fbase_grand_total write Setbase_grand_total stored base_grand_total_Specified;
    property discount_amount:      string                               Index (IS_OPTN) read Fdiscount_amount write Setdiscount_amount stored discount_amount_Specified;
    property base_discount_amount: string                               Index (IS_OPTN) read Fbase_discount_amount write Setbase_discount_amount stored base_discount_amount_Specified;
    property shipping_amount:      string                               Index (IS_OPTN) read Fshipping_amount write Setshipping_amount stored shipping_amount_Specified;
    property base_shipping_amount: string                               Index (IS_OPTN) read Fbase_shipping_amount write Setbase_shipping_amount stored base_shipping_amount_Specified;
    property tax_amount:           string                               Index (IS_OPTN) read Ftax_amount write Settax_amount stored tax_amount_Specified;
    property base_tax_amount:      string                               Index (IS_OPTN) read Fbase_tax_amount write Setbase_tax_amount stored base_tax_amount_Specified;
    property billing_address_id:   string                               Index (IS_OPTN) read Fbilling_address_id write Setbilling_address_id stored billing_address_id_Specified;
    property billing_firstname:    string                               Index (IS_OPTN) read Fbilling_firstname write Setbilling_firstname stored billing_firstname_Specified;
    property billing_lastname:     string                               Index (IS_OPTN) read Fbilling_lastname write Setbilling_lastname stored billing_lastname_Specified;
    property order_id:             string                               Index (IS_OPTN) read Forder_id write Setorder_id stored order_id_Specified;
    property order_increment_id:   string                               Index (IS_OPTN) read Forder_increment_id write Setorder_increment_id stored order_increment_id_Specified;
    property order_created_at:     string                               Index (IS_OPTN) read Forder_created_at write Setorder_created_at stored order_created_at_Specified;
    property state:                string                               Index (IS_OPTN) read Fstate write Setstate stored state_Specified;
    property grand_total:          string                               Index (IS_OPTN) read Fgrand_total write Setgrand_total stored grand_total_Specified;
    property invoice_id:           string                               Index (IS_OPTN) read Finvoice_id write Setinvoice_id stored invoice_id_Specified;
    property items:                salesOrderInvoiceItemEntityArray     Index (IS_OPTN) read Fitems write Setitems stored items_Specified;
    property comments:             salesOrderInvoiceCommentEntityArray  Index (IS_OPTN) read Fcomments write Setcomments stored comments_Specified;
  end;



  // ************************************************************************ //
  // XML       : salesOrderCreditmemoItemEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  salesOrderCreditmemoItemEntity = class(TRemotable)
  private
    Fitem_id: string;
    Fitem_id_Specified: boolean;
    Fparent_id: string;
    Fparent_id_Specified: boolean;
    Fweee_tax_applied_row_amount: string;
    Fweee_tax_applied_row_amount_Specified: boolean;
    Fbase_price: string;
    Fbase_price_Specified: boolean;
    Fbase_weee_tax_row_disposition: string;
    Fbase_weee_tax_row_disposition_Specified: boolean;
    Ftax_amount: string;
    Ftax_amount_Specified: boolean;
    Fbase_weee_tax_applied_amount: string;
    Fbase_weee_tax_applied_amount_Specified: boolean;
    Fweee_tax_row_disposition: string;
    Fweee_tax_row_disposition_Specified: boolean;
    Fbase_row_total: string;
    Fbase_row_total_Specified: boolean;
    Fdiscount_amount: string;
    Fdiscount_amount_Specified: boolean;
    Frow_total: string;
    Frow_total_Specified: boolean;
    Fweee_tax_applied_amount: string;
    Fweee_tax_applied_amount_Specified: boolean;
    Fbase_discount_amount: string;
    Fbase_discount_amount_Specified: boolean;
    Fbase_weee_tax_disposition: string;
    Fbase_weee_tax_disposition_Specified: boolean;
    Fprice_incl_tax: string;
    Fprice_incl_tax_Specified: boolean;
    Fbase_tax_amount: string;
    Fbase_tax_amount_Specified: boolean;
    Fweee_tax_disposition: string;
    Fweee_tax_disposition_Specified: boolean;
    Fbase_price_incl_tax: string;
    Fbase_price_incl_tax_Specified: boolean;
    Fqty: string;
    Fqty_Specified: boolean;
    Fbase_cost: string;
    Fbase_cost_Specified: boolean;
    Fbase_weee_tax_applied_row_amount: string;
    Fbase_weee_tax_applied_row_amount_Specified: boolean;
    Fprice: string;
    Fprice_Specified: boolean;
    Fbase_row_total_incl_tax: string;
    Fbase_row_total_incl_tax_Specified: boolean;
    Frow_total_incl_tax: string;
    Frow_total_incl_tax_Specified: boolean;
    Fproduct_id: string;
    Fproduct_id_Specified: boolean;
    Forder_item_id: string;
    Forder_item_id_Specified: boolean;
    Fadditional_data: string;
    Fadditional_data_Specified: boolean;
    Fdescription: string;
    Fdescription_Specified: boolean;
    Fweee_tax_applied: string;
    Fweee_tax_applied_Specified: boolean;
    Fsku: string;
    Fsku_Specified: boolean;
    Fname_: string;
    Fname__Specified: boolean;
    Fhidden_tax_amount: string;
    Fhidden_tax_amount_Specified: boolean;
    Fbase_hidden_tax_amount: string;
    Fbase_hidden_tax_amount_Specified: boolean;
    procedure Setitem_id(Index: Integer; const Astring: string);
    function  item_id_Specified(Index: Integer): boolean;
    procedure Setparent_id(Index: Integer; const Astring: string);
    function  parent_id_Specified(Index: Integer): boolean;
    procedure Setweee_tax_applied_row_amount(Index: Integer; const Astring: string);
    function  weee_tax_applied_row_amount_Specified(Index: Integer): boolean;
    procedure Setbase_price(Index: Integer; const Astring: string);
    function  base_price_Specified(Index: Integer): boolean;
    procedure Setbase_weee_tax_row_disposition(Index: Integer; const Astring: string);
    function  base_weee_tax_row_disposition_Specified(Index: Integer): boolean;
    procedure Settax_amount(Index: Integer; const Astring: string);
    function  tax_amount_Specified(Index: Integer): boolean;
    procedure Setbase_weee_tax_applied_amount(Index: Integer; const Astring: string);
    function  base_weee_tax_applied_amount_Specified(Index: Integer): boolean;
    procedure Setweee_tax_row_disposition(Index: Integer; const Astring: string);
    function  weee_tax_row_disposition_Specified(Index: Integer): boolean;
    procedure Setbase_row_total(Index: Integer; const Astring: string);
    function  base_row_total_Specified(Index: Integer): boolean;
    procedure Setdiscount_amount(Index: Integer; const Astring: string);
    function  discount_amount_Specified(Index: Integer): boolean;
    procedure Setrow_total(Index: Integer; const Astring: string);
    function  row_total_Specified(Index: Integer): boolean;
    procedure Setweee_tax_applied_amount(Index: Integer; const Astring: string);
    function  weee_tax_applied_amount_Specified(Index: Integer): boolean;
    procedure Setbase_discount_amount(Index: Integer; const Astring: string);
    function  base_discount_amount_Specified(Index: Integer): boolean;
    procedure Setbase_weee_tax_disposition(Index: Integer; const Astring: string);
    function  base_weee_tax_disposition_Specified(Index: Integer): boolean;
    procedure Setprice_incl_tax(Index: Integer; const Astring: string);
    function  price_incl_tax_Specified(Index: Integer): boolean;
    procedure Setbase_tax_amount(Index: Integer; const Astring: string);
    function  base_tax_amount_Specified(Index: Integer): boolean;
    procedure Setweee_tax_disposition(Index: Integer; const Astring: string);
    function  weee_tax_disposition_Specified(Index: Integer): boolean;
    procedure Setbase_price_incl_tax(Index: Integer; const Astring: string);
    function  base_price_incl_tax_Specified(Index: Integer): boolean;
    procedure Setqty(Index: Integer; const Astring: string);
    function  qty_Specified(Index: Integer): boolean;
    procedure Setbase_cost(Index: Integer; const Astring: string);
    function  base_cost_Specified(Index: Integer): boolean;
    procedure Setbase_weee_tax_applied_row_amount(Index: Integer; const Astring: string);
    function  base_weee_tax_applied_row_amount_Specified(Index: Integer): boolean;
    procedure Setprice(Index: Integer; const Astring: string);
    function  price_Specified(Index: Integer): boolean;
    procedure Setbase_row_total_incl_tax(Index: Integer; const Astring: string);
    function  base_row_total_incl_tax_Specified(Index: Integer): boolean;
    procedure Setrow_total_incl_tax(Index: Integer; const Astring: string);
    function  row_total_incl_tax_Specified(Index: Integer): boolean;
    procedure Setproduct_id(Index: Integer; const Astring: string);
    function  product_id_Specified(Index: Integer): boolean;
    procedure Setorder_item_id(Index: Integer; const Astring: string);
    function  order_item_id_Specified(Index: Integer): boolean;
    procedure Setadditional_data(Index: Integer; const Astring: string);
    function  additional_data_Specified(Index: Integer): boolean;
    procedure Setdescription(Index: Integer; const Astring: string);
    function  description_Specified(Index: Integer): boolean;
    procedure Setweee_tax_applied(Index: Integer; const Astring: string);
    function  weee_tax_applied_Specified(Index: Integer): boolean;
    procedure Setsku(Index: Integer; const Astring: string);
    function  sku_Specified(Index: Integer): boolean;
    procedure Setname_(Index: Integer; const Astring: string);
    function  name__Specified(Index: Integer): boolean;
    procedure Sethidden_tax_amount(Index: Integer; const Astring: string);
    function  hidden_tax_amount_Specified(Index: Integer): boolean;
    procedure Setbase_hidden_tax_amount(Index: Integer; const Astring: string);
    function  base_hidden_tax_amount_Specified(Index: Integer): boolean;
  published
    property item_id:                          string  Index (IS_OPTN) read Fitem_id write Setitem_id stored item_id_Specified;
    property parent_id:                        string  Index (IS_OPTN) read Fparent_id write Setparent_id stored parent_id_Specified;
    property weee_tax_applied_row_amount:      string  Index (IS_OPTN) read Fweee_tax_applied_row_amount write Setweee_tax_applied_row_amount stored weee_tax_applied_row_amount_Specified;
    property base_price:                       string  Index (IS_OPTN) read Fbase_price write Setbase_price stored base_price_Specified;
    property base_weee_tax_row_disposition:    string  Index (IS_OPTN) read Fbase_weee_tax_row_disposition write Setbase_weee_tax_row_disposition stored base_weee_tax_row_disposition_Specified;
    property tax_amount:                       string  Index (IS_OPTN) read Ftax_amount write Settax_amount stored tax_amount_Specified;
    property base_weee_tax_applied_amount:     string  Index (IS_OPTN) read Fbase_weee_tax_applied_amount write Setbase_weee_tax_applied_amount stored base_weee_tax_applied_amount_Specified;
    property weee_tax_row_disposition:         string  Index (IS_OPTN) read Fweee_tax_row_disposition write Setweee_tax_row_disposition stored weee_tax_row_disposition_Specified;
    property base_row_total:                   string  Index (IS_OPTN) read Fbase_row_total write Setbase_row_total stored base_row_total_Specified;
    property discount_amount:                  string  Index (IS_OPTN) read Fdiscount_amount write Setdiscount_amount stored discount_amount_Specified;
    property row_total:                        string  Index (IS_OPTN) read Frow_total write Setrow_total stored row_total_Specified;
    property weee_tax_applied_amount:          string  Index (IS_OPTN) read Fweee_tax_applied_amount write Setweee_tax_applied_amount stored weee_tax_applied_amount_Specified;
    property base_discount_amount:             string  Index (IS_OPTN) read Fbase_discount_amount write Setbase_discount_amount stored base_discount_amount_Specified;
    property base_weee_tax_disposition:        string  Index (IS_OPTN) read Fbase_weee_tax_disposition write Setbase_weee_tax_disposition stored base_weee_tax_disposition_Specified;
    property price_incl_tax:                   string  Index (IS_OPTN) read Fprice_incl_tax write Setprice_incl_tax stored price_incl_tax_Specified;
    property base_tax_amount:                  string  Index (IS_OPTN) read Fbase_tax_amount write Setbase_tax_amount stored base_tax_amount_Specified;
    property weee_tax_disposition:             string  Index (IS_OPTN) read Fweee_tax_disposition write Setweee_tax_disposition stored weee_tax_disposition_Specified;
    property base_price_incl_tax:              string  Index (IS_OPTN) read Fbase_price_incl_tax write Setbase_price_incl_tax stored base_price_incl_tax_Specified;
    property qty:                              string  Index (IS_OPTN) read Fqty write Setqty stored qty_Specified;
    property base_cost:                        string  Index (IS_OPTN) read Fbase_cost write Setbase_cost stored base_cost_Specified;
    property base_weee_tax_applied_row_amount: string  Index (IS_OPTN) read Fbase_weee_tax_applied_row_amount write Setbase_weee_tax_applied_row_amount stored base_weee_tax_applied_row_amount_Specified;
    property price:                            string  Index (IS_OPTN) read Fprice write Setprice stored price_Specified;
    property base_row_total_incl_tax:          string  Index (IS_OPTN) read Fbase_row_total_incl_tax write Setbase_row_total_incl_tax stored base_row_total_incl_tax_Specified;
    property row_total_incl_tax:               string  Index (IS_OPTN) read Frow_total_incl_tax write Setrow_total_incl_tax stored row_total_incl_tax_Specified;
    property product_id:                       string  Index (IS_OPTN) read Fproduct_id write Setproduct_id stored product_id_Specified;
    property order_item_id:                    string  Index (IS_OPTN) read Forder_item_id write Setorder_item_id stored order_item_id_Specified;
    property additional_data:                  string  Index (IS_OPTN) read Fadditional_data write Setadditional_data stored additional_data_Specified;
    property description:                      string  Index (IS_OPTN) read Fdescription write Setdescription stored description_Specified;
    property weee_tax_applied:                 string  Index (IS_OPTN) read Fweee_tax_applied write Setweee_tax_applied stored weee_tax_applied_Specified;
    property sku:                              string  Index (IS_OPTN) read Fsku write Setsku stored sku_Specified;
    property name_:                            string  Index (IS_OPTN) read Fname_ write Setname_ stored name__Specified;
    property hidden_tax_amount:                string  Index (IS_OPTN) read Fhidden_tax_amount write Sethidden_tax_amount stored hidden_tax_amount_Specified;
    property base_hidden_tax_amount:           string  Index (IS_OPTN) read Fbase_hidden_tax_amount write Setbase_hidden_tax_amount stored base_hidden_tax_amount_Specified;
  end;



  // ************************************************************************ //
  // XML       : salesOrderCreditmemoCommentEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  salesOrderCreditmemoCommentEntity = class(TRemotable)
  private
    Fparent_id: string;
    Fparent_id_Specified: boolean;
    Fcreated_at: string;
    Fcreated_at_Specified: boolean;
    Fcomment: string;
    Fcomment_Specified: boolean;
    Fis_customer_notified: string;
    Fis_customer_notified_Specified: boolean;
    Fcomment_id: string;
    Fcomment_id_Specified: boolean;
    Fis_visible_on_front: string;
    Fis_visible_on_front_Specified: boolean;
    procedure Setparent_id(Index: Integer; const Astring: string);
    function  parent_id_Specified(Index: Integer): boolean;
    procedure Setcreated_at(Index: Integer; const Astring: string);
    function  created_at_Specified(Index: Integer): boolean;
    procedure Setcomment(Index: Integer; const Astring: string);
    function  comment_Specified(Index: Integer): boolean;
    procedure Setis_customer_notified(Index: Integer; const Astring: string);
    function  is_customer_notified_Specified(Index: Integer): boolean;
    procedure Setcomment_id(Index: Integer; const Astring: string);
    function  comment_id_Specified(Index: Integer): boolean;
    procedure Setis_visible_on_front(Index: Integer; const Astring: string);
    function  is_visible_on_front_Specified(Index: Integer): boolean;
  published
    property parent_id:            string  Index (IS_OPTN) read Fparent_id write Setparent_id stored parent_id_Specified;
    property created_at:           string  Index (IS_OPTN) read Fcreated_at write Setcreated_at stored created_at_Specified;
    property comment:              string  Index (IS_OPTN) read Fcomment write Setcomment stored comment_Specified;
    property is_customer_notified: string  Index (IS_OPTN) read Fis_customer_notified write Setis_customer_notified stored is_customer_notified_Specified;
    property comment_id:           string  Index (IS_OPTN) read Fcomment_id write Setcomment_id stored comment_id_Specified;
    property is_visible_on_front:  string  Index (IS_OPTN) read Fis_visible_on_front write Setis_visible_on_front stored is_visible_on_front_Specified;
  end;



  // ************************************************************************ //
  // XML       : salesOrderCreditmemoEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  salesOrderCreditmemoEntity = class(TRemotable)
  private
    Fupdated_at: string;
    Fupdated_at_Specified: boolean;
    Fcreated_at: string;
    Fcreated_at_Specified: boolean;
    Fincrement_id: string;
    Fincrement_id_Specified: boolean;
    Ftransaction_id: string;
    Ftransaction_id_Specified: boolean;
    Fglobal_currency_code: string;
    Fglobal_currency_code_Specified: boolean;
    Fbase_currency_code: string;
    Fbase_currency_code_Specified: boolean;
    Forder_currency_code: string;
    Forder_currency_code_Specified: boolean;
    Fstore_currency_code: string;
    Fstore_currency_code_Specified: boolean;
    Fcybersource_token: string;
    Fcybersource_token_Specified: boolean;
    Finvoice_id: string;
    Finvoice_id_Specified: boolean;
    Fbilling_address_id: string;
    Fbilling_address_id_Specified: boolean;
    Fshipping_address_id: string;
    Fshipping_address_id_Specified: boolean;
    Fstate: string;
    Fstate_Specified: boolean;
    Fcreditmemo_status: string;
    Fcreditmemo_status_Specified: boolean;
    Femail_sent: string;
    Femail_sent_Specified: boolean;
    Forder_id: string;
    Forder_id_Specified: boolean;
    Ftax_amount: string;
    Ftax_amount_Specified: boolean;
    Fshipping_tax_amount: string;
    Fshipping_tax_amount_Specified: boolean;
    Fbase_tax_amount: string;
    Fbase_tax_amount_Specified: boolean;
    Fbase_adjustment_positive: string;
    Fbase_adjustment_positive_Specified: boolean;
    Fbase_grand_total: string;
    Fbase_grand_total_Specified: boolean;
    Fadjustment: string;
    Fadjustment_Specified: boolean;
    Fsubtotal: string;
    Fsubtotal_Specified: boolean;
    Fdiscount_amount: string;
    Fdiscount_amount_Specified: boolean;
    Fbase_subtotal: string;
    Fbase_subtotal_Specified: boolean;
    Fbase_adjustment: string;
    Fbase_adjustment_Specified: boolean;
    Fbase_to_global_rate: string;
    Fbase_to_global_rate_Specified: boolean;
    Fstore_to_base_rate: string;
    Fstore_to_base_rate_Specified: boolean;
    Fbase_shipping_amount: string;
    Fbase_shipping_amount_Specified: boolean;
    Fadjustment_negative: string;
    Fadjustment_negative_Specified: boolean;
    Fsubtotal_incl_tax: string;
    Fsubtotal_incl_tax_Specified: boolean;
    Fshipping_amount: string;
    Fshipping_amount_Specified: boolean;
    Fbase_subtotal_incl_tax: string;
    Fbase_subtotal_incl_tax_Specified: boolean;
    Fbase_adjustment_negative: string;
    Fbase_adjustment_negative_Specified: boolean;
    Fgrand_total: string;
    Fgrand_total_Specified: boolean;
    Fbase_discount_amount: string;
    Fbase_discount_amount_Specified: boolean;
    Fbase_to_order_rate: string;
    Fbase_to_order_rate_Specified: boolean;
    Fstore_to_order_rate: string;
    Fstore_to_order_rate_Specified: boolean;
    Fbase_shipping_tax_amount: string;
    Fbase_shipping_tax_amount_Specified: boolean;
    Fadjustment_positive: string;
    Fadjustment_positive_Specified: boolean;
    Fstore_id: string;
    Fstore_id_Specified: boolean;
    Fhidden_tax_amount: string;
    Fhidden_tax_amount_Specified: boolean;
    Fbase_hidden_tax_amount: string;
    Fbase_hidden_tax_amount_Specified: boolean;
    Fshipping_hidden_tax_amount: string;
    Fshipping_hidden_tax_amount_Specified: boolean;
    Fbase_shipping_hidden_tax_amnt: string;
    Fbase_shipping_hidden_tax_amnt_Specified: boolean;
    Fshipping_incl_tax: string;
    Fshipping_incl_tax_Specified: boolean;
    Fbase_shipping_incl_tax: string;
    Fbase_shipping_incl_tax_Specified: boolean;
    Fbase_customer_balance_amount: string;
    Fbase_customer_balance_amount_Specified: boolean;
    Fcustomer_balance_amount: string;
    Fcustomer_balance_amount_Specified: boolean;
    Fbs_customer_bal_total_refunded: string;
    Fbs_customer_bal_total_refunded_Specified: boolean;
    Fcustomer_bal_total_refunded: string;
    Fcustomer_bal_total_refunded_Specified: boolean;
    Fbase_gift_cards_amount: string;
    Fbase_gift_cards_amount_Specified: boolean;
    Fgift_cards_amount: string;
    Fgift_cards_amount_Specified: boolean;
    Fgw_base_price: string;
    Fgw_base_price_Specified: boolean;
    Fgw_price: string;
    Fgw_price_Specified: boolean;
    Fgw_items_base_price: string;
    Fgw_items_base_price_Specified: boolean;
    Fgw_items_price: string;
    Fgw_items_price_Specified: boolean;
    Fgw_card_base_price: string;
    Fgw_card_base_price_Specified: boolean;
    Fgw_card_price: string;
    Fgw_card_price_Specified: boolean;
    Fgw_base_tax_amount: string;
    Fgw_base_tax_amount_Specified: boolean;
    Fgw_tax_amount: string;
    Fgw_tax_amount_Specified: boolean;
    Fgw_items_base_tax_amount: string;
    Fgw_items_base_tax_amount_Specified: boolean;
    Fgw_items_tax_amount: string;
    Fgw_items_tax_amount_Specified: boolean;
    Fgw_card_base_tax_amount: string;
    Fgw_card_base_tax_amount_Specified: boolean;
    Fgw_card_tax_amount: string;
    Fgw_card_tax_amount_Specified: boolean;
    Fbase_reward_currency_amount: string;
    Fbase_reward_currency_amount_Specified: boolean;
    Freward_currency_amount: string;
    Freward_currency_amount_Specified: boolean;
    Freward_points_balance: string;
    Freward_points_balance_Specified: boolean;
    Freward_points_balance_refund: string;
    Freward_points_balance_refund_Specified: boolean;
    Fcreditmemo_id: string;
    Fcreditmemo_id_Specified: boolean;
    Fitems: salesOrderCreditmemoItemEntityArray;
    Fitems_Specified: boolean;
    Fcomments: salesOrderCreditmemoCommentEntityArray;
    Fcomments_Specified: boolean;
    procedure Setupdated_at(Index: Integer; const Astring: string);
    function  updated_at_Specified(Index: Integer): boolean;
    procedure Setcreated_at(Index: Integer; const Astring: string);
    function  created_at_Specified(Index: Integer): boolean;
    procedure Setincrement_id(Index: Integer; const Astring: string);
    function  increment_id_Specified(Index: Integer): boolean;
    procedure Settransaction_id(Index: Integer; const Astring: string);
    function  transaction_id_Specified(Index: Integer): boolean;
    procedure Setglobal_currency_code(Index: Integer; const Astring: string);
    function  global_currency_code_Specified(Index: Integer): boolean;
    procedure Setbase_currency_code(Index: Integer; const Astring: string);
    function  base_currency_code_Specified(Index: Integer): boolean;
    procedure Setorder_currency_code(Index: Integer; const Astring: string);
    function  order_currency_code_Specified(Index: Integer): boolean;
    procedure Setstore_currency_code(Index: Integer; const Astring: string);
    function  store_currency_code_Specified(Index: Integer): boolean;
    procedure Setcybersource_token(Index: Integer; const Astring: string);
    function  cybersource_token_Specified(Index: Integer): boolean;
    procedure Setinvoice_id(Index: Integer; const Astring: string);
    function  invoice_id_Specified(Index: Integer): boolean;
    procedure Setbilling_address_id(Index: Integer; const Astring: string);
    function  billing_address_id_Specified(Index: Integer): boolean;
    procedure Setshipping_address_id(Index: Integer; const Astring: string);
    function  shipping_address_id_Specified(Index: Integer): boolean;
    procedure Setstate(Index: Integer; const Astring: string);
    function  state_Specified(Index: Integer): boolean;
    procedure Setcreditmemo_status(Index: Integer; const Astring: string);
    function  creditmemo_status_Specified(Index: Integer): boolean;
    procedure Setemail_sent(Index: Integer; const Astring: string);
    function  email_sent_Specified(Index: Integer): boolean;
    procedure Setorder_id(Index: Integer; const Astring: string);
    function  order_id_Specified(Index: Integer): boolean;
    procedure Settax_amount(Index: Integer; const Astring: string);
    function  tax_amount_Specified(Index: Integer): boolean;
    procedure Setshipping_tax_amount(Index: Integer; const Astring: string);
    function  shipping_tax_amount_Specified(Index: Integer): boolean;
    procedure Setbase_tax_amount(Index: Integer; const Astring: string);
    function  base_tax_amount_Specified(Index: Integer): boolean;
    procedure Setbase_adjustment_positive(Index: Integer; const Astring: string);
    function  base_adjustment_positive_Specified(Index: Integer): boolean;
    procedure Setbase_grand_total(Index: Integer; const Astring: string);
    function  base_grand_total_Specified(Index: Integer): boolean;
    procedure Setadjustment(Index: Integer; const Astring: string);
    function  adjustment_Specified(Index: Integer): boolean;
    procedure Setsubtotal(Index: Integer; const Astring: string);
    function  subtotal_Specified(Index: Integer): boolean;
    procedure Setdiscount_amount(Index: Integer; const Astring: string);
    function  discount_amount_Specified(Index: Integer): boolean;
    procedure Setbase_subtotal(Index: Integer; const Astring: string);
    function  base_subtotal_Specified(Index: Integer): boolean;
    procedure Setbase_adjustment(Index: Integer; const Astring: string);
    function  base_adjustment_Specified(Index: Integer): boolean;
    procedure Setbase_to_global_rate(Index: Integer; const Astring: string);
    function  base_to_global_rate_Specified(Index: Integer): boolean;
    procedure Setstore_to_base_rate(Index: Integer; const Astring: string);
    function  store_to_base_rate_Specified(Index: Integer): boolean;
    procedure Setbase_shipping_amount(Index: Integer; const Astring: string);
    function  base_shipping_amount_Specified(Index: Integer): boolean;
    procedure Setadjustment_negative(Index: Integer; const Astring: string);
    function  adjustment_negative_Specified(Index: Integer): boolean;
    procedure Setsubtotal_incl_tax(Index: Integer; const Astring: string);
    function  subtotal_incl_tax_Specified(Index: Integer): boolean;
    procedure Setshipping_amount(Index: Integer; const Astring: string);
    function  shipping_amount_Specified(Index: Integer): boolean;
    procedure Setbase_subtotal_incl_tax(Index: Integer; const Astring: string);
    function  base_subtotal_incl_tax_Specified(Index: Integer): boolean;
    procedure Setbase_adjustment_negative(Index: Integer; const Astring: string);
    function  base_adjustment_negative_Specified(Index: Integer): boolean;
    procedure Setgrand_total(Index: Integer; const Astring: string);
    function  grand_total_Specified(Index: Integer): boolean;
    procedure Setbase_discount_amount(Index: Integer; const Astring: string);
    function  base_discount_amount_Specified(Index: Integer): boolean;
    procedure Setbase_to_order_rate(Index: Integer; const Astring: string);
    function  base_to_order_rate_Specified(Index: Integer): boolean;
    procedure Setstore_to_order_rate(Index: Integer; const Astring: string);
    function  store_to_order_rate_Specified(Index: Integer): boolean;
    procedure Setbase_shipping_tax_amount(Index: Integer; const Astring: string);
    function  base_shipping_tax_amount_Specified(Index: Integer): boolean;
    procedure Setadjustment_positive(Index: Integer; const Astring: string);
    function  adjustment_positive_Specified(Index: Integer): boolean;
    procedure Setstore_id(Index: Integer; const Astring: string);
    function  store_id_Specified(Index: Integer): boolean;
    procedure Sethidden_tax_amount(Index: Integer; const Astring: string);
    function  hidden_tax_amount_Specified(Index: Integer): boolean;
    procedure Setbase_hidden_tax_amount(Index: Integer; const Astring: string);
    function  base_hidden_tax_amount_Specified(Index: Integer): boolean;
    procedure Setshipping_hidden_tax_amount(Index: Integer; const Astring: string);
    function  shipping_hidden_tax_amount_Specified(Index: Integer): boolean;
    procedure Setbase_shipping_hidden_tax_amnt(Index: Integer; const Astring: string);
    function  base_shipping_hidden_tax_amnt_Specified(Index: Integer): boolean;
    procedure Setshipping_incl_tax(Index: Integer; const Astring: string);
    function  shipping_incl_tax_Specified(Index: Integer): boolean;
    procedure Setbase_shipping_incl_tax(Index: Integer; const Astring: string);
    function  base_shipping_incl_tax_Specified(Index: Integer): boolean;
    procedure Setbase_customer_balance_amount(Index: Integer; const Astring: string);
    function  base_customer_balance_amount_Specified(Index: Integer): boolean;
    procedure Setcustomer_balance_amount(Index: Integer; const Astring: string);
    function  customer_balance_amount_Specified(Index: Integer): boolean;
    procedure Setbs_customer_bal_total_refunded(Index: Integer; const Astring: string);
    function  bs_customer_bal_total_refunded_Specified(Index: Integer): boolean;
    procedure Setcustomer_bal_total_refunded(Index: Integer; const Astring: string);
    function  customer_bal_total_refunded_Specified(Index: Integer): boolean;
    procedure Setbase_gift_cards_amount(Index: Integer; const Astring: string);
    function  base_gift_cards_amount_Specified(Index: Integer): boolean;
    procedure Setgift_cards_amount(Index: Integer; const Astring: string);
    function  gift_cards_amount_Specified(Index: Integer): boolean;
    procedure Setgw_base_price(Index: Integer; const Astring: string);
    function  gw_base_price_Specified(Index: Integer): boolean;
    procedure Setgw_price(Index: Integer; const Astring: string);
    function  gw_price_Specified(Index: Integer): boolean;
    procedure Setgw_items_base_price(Index: Integer; const Astring: string);
    function  gw_items_base_price_Specified(Index: Integer): boolean;
    procedure Setgw_items_price(Index: Integer; const Astring: string);
    function  gw_items_price_Specified(Index: Integer): boolean;
    procedure Setgw_card_base_price(Index: Integer; const Astring: string);
    function  gw_card_base_price_Specified(Index: Integer): boolean;
    procedure Setgw_card_price(Index: Integer; const Astring: string);
    function  gw_card_price_Specified(Index: Integer): boolean;
    procedure Setgw_base_tax_amount(Index: Integer; const Astring: string);
    function  gw_base_tax_amount_Specified(Index: Integer): boolean;
    procedure Setgw_tax_amount(Index: Integer; const Astring: string);
    function  gw_tax_amount_Specified(Index: Integer): boolean;
    procedure Setgw_items_base_tax_amount(Index: Integer; const Astring: string);
    function  gw_items_base_tax_amount_Specified(Index: Integer): boolean;
    procedure Setgw_items_tax_amount(Index: Integer; const Astring: string);
    function  gw_items_tax_amount_Specified(Index: Integer): boolean;
    procedure Setgw_card_base_tax_amount(Index: Integer; const Astring: string);
    function  gw_card_base_tax_amount_Specified(Index: Integer): boolean;
    procedure Setgw_card_tax_amount(Index: Integer; const Astring: string);
    function  gw_card_tax_amount_Specified(Index: Integer): boolean;
    procedure Setbase_reward_currency_amount(Index: Integer; const Astring: string);
    function  base_reward_currency_amount_Specified(Index: Integer): boolean;
    procedure Setreward_currency_amount(Index: Integer; const Astring: string);
    function  reward_currency_amount_Specified(Index: Integer): boolean;
    procedure Setreward_points_balance(Index: Integer; const Astring: string);
    function  reward_points_balance_Specified(Index: Integer): boolean;
    procedure Setreward_points_balance_refund(Index: Integer; const Astring: string);
    function  reward_points_balance_refund_Specified(Index: Integer): boolean;
    procedure Setcreditmemo_id(Index: Integer; const Astring: string);
    function  creditmemo_id_Specified(Index: Integer): boolean;
    procedure Setitems(Index: Integer; const AsalesOrderCreditmemoItemEntityArray: salesOrderCreditmemoItemEntityArray);
    function  items_Specified(Index: Integer): boolean;
    procedure Setcomments(Index: Integer; const AsalesOrderCreditmemoCommentEntityArray: salesOrderCreditmemoCommentEntityArray);
    function  comments_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property updated_at:                     string                                  Index (IS_OPTN) read Fupdated_at write Setupdated_at stored updated_at_Specified;
    property created_at:                     string                                  Index (IS_OPTN) read Fcreated_at write Setcreated_at stored created_at_Specified;
    property increment_id:                   string                                  Index (IS_OPTN) read Fincrement_id write Setincrement_id stored increment_id_Specified;
    property transaction_id:                 string                                  Index (IS_OPTN) read Ftransaction_id write Settransaction_id stored transaction_id_Specified;
    property global_currency_code:           string                                  Index (IS_OPTN) read Fglobal_currency_code write Setglobal_currency_code stored global_currency_code_Specified;
    property base_currency_code:             string                                  Index (IS_OPTN) read Fbase_currency_code write Setbase_currency_code stored base_currency_code_Specified;
    property order_currency_code:            string                                  Index (IS_OPTN) read Forder_currency_code write Setorder_currency_code stored order_currency_code_Specified;
    property store_currency_code:            string                                  Index (IS_OPTN) read Fstore_currency_code write Setstore_currency_code stored store_currency_code_Specified;
    property cybersource_token:              string                                  Index (IS_OPTN) read Fcybersource_token write Setcybersource_token stored cybersource_token_Specified;
    property invoice_id:                     string                                  Index (IS_OPTN) read Finvoice_id write Setinvoice_id stored invoice_id_Specified;
    property billing_address_id:             string                                  Index (IS_OPTN) read Fbilling_address_id write Setbilling_address_id stored billing_address_id_Specified;
    property shipping_address_id:            string                                  Index (IS_OPTN) read Fshipping_address_id write Setshipping_address_id stored shipping_address_id_Specified;
    property state:                          string                                  Index (IS_OPTN) read Fstate write Setstate stored state_Specified;
    property creditmemo_status:              string                                  Index (IS_OPTN) read Fcreditmemo_status write Setcreditmemo_status stored creditmemo_status_Specified;
    property email_sent:                     string                                  Index (IS_OPTN) read Femail_sent write Setemail_sent stored email_sent_Specified;
    property order_id:                       string                                  Index (IS_OPTN) read Forder_id write Setorder_id stored order_id_Specified;
    property tax_amount:                     string                                  Index (IS_OPTN) read Ftax_amount write Settax_amount stored tax_amount_Specified;
    property shipping_tax_amount:            string                                  Index (IS_OPTN) read Fshipping_tax_amount write Setshipping_tax_amount stored shipping_tax_amount_Specified;
    property base_tax_amount:                string                                  Index (IS_OPTN) read Fbase_tax_amount write Setbase_tax_amount stored base_tax_amount_Specified;
    property base_adjustment_positive:       string                                  Index (IS_OPTN) read Fbase_adjustment_positive write Setbase_adjustment_positive stored base_adjustment_positive_Specified;
    property base_grand_total:               string                                  Index (IS_OPTN) read Fbase_grand_total write Setbase_grand_total stored base_grand_total_Specified;
    property adjustment:                     string                                  Index (IS_OPTN) read Fadjustment write Setadjustment stored adjustment_Specified;
    property subtotal:                       string                                  Index (IS_OPTN) read Fsubtotal write Setsubtotal stored subtotal_Specified;
    property discount_amount:                string                                  Index (IS_OPTN) read Fdiscount_amount write Setdiscount_amount stored discount_amount_Specified;
    property base_subtotal:                  string                                  Index (IS_OPTN) read Fbase_subtotal write Setbase_subtotal stored base_subtotal_Specified;
    property base_adjustment:                string                                  Index (IS_OPTN) read Fbase_adjustment write Setbase_adjustment stored base_adjustment_Specified;
    property base_to_global_rate:            string                                  Index (IS_OPTN) read Fbase_to_global_rate write Setbase_to_global_rate stored base_to_global_rate_Specified;
    property store_to_base_rate:             string                                  Index (IS_OPTN) read Fstore_to_base_rate write Setstore_to_base_rate stored store_to_base_rate_Specified;
    property base_shipping_amount:           string                                  Index (IS_OPTN) read Fbase_shipping_amount write Setbase_shipping_amount stored base_shipping_amount_Specified;
    property adjustment_negative:            string                                  Index (IS_OPTN) read Fadjustment_negative write Setadjustment_negative stored adjustment_negative_Specified;
    property subtotal_incl_tax:              string                                  Index (IS_OPTN) read Fsubtotal_incl_tax write Setsubtotal_incl_tax stored subtotal_incl_tax_Specified;
    property shipping_amount:                string                                  Index (IS_OPTN) read Fshipping_amount write Setshipping_amount stored shipping_amount_Specified;
    property base_subtotal_incl_tax:         string                                  Index (IS_OPTN) read Fbase_subtotal_incl_tax write Setbase_subtotal_incl_tax stored base_subtotal_incl_tax_Specified;
    property base_adjustment_negative:       string                                  Index (IS_OPTN) read Fbase_adjustment_negative write Setbase_adjustment_negative stored base_adjustment_negative_Specified;
    property grand_total:                    string                                  Index (IS_OPTN) read Fgrand_total write Setgrand_total stored grand_total_Specified;
    property base_discount_amount:           string                                  Index (IS_OPTN) read Fbase_discount_amount write Setbase_discount_amount stored base_discount_amount_Specified;
    property base_to_order_rate:             string                                  Index (IS_OPTN) read Fbase_to_order_rate write Setbase_to_order_rate stored base_to_order_rate_Specified;
    property store_to_order_rate:            string                                  Index (IS_OPTN) read Fstore_to_order_rate write Setstore_to_order_rate stored store_to_order_rate_Specified;
    property base_shipping_tax_amount:       string                                  Index (IS_OPTN) read Fbase_shipping_tax_amount write Setbase_shipping_tax_amount stored base_shipping_tax_amount_Specified;
    property adjustment_positive:            string                                  Index (IS_OPTN) read Fadjustment_positive write Setadjustment_positive stored adjustment_positive_Specified;
    property store_id:                       string                                  Index (IS_OPTN) read Fstore_id write Setstore_id stored store_id_Specified;
    property hidden_tax_amount:              string                                  Index (IS_OPTN) read Fhidden_tax_amount write Sethidden_tax_amount stored hidden_tax_amount_Specified;
    property base_hidden_tax_amount:         string                                  Index (IS_OPTN) read Fbase_hidden_tax_amount write Setbase_hidden_tax_amount stored base_hidden_tax_amount_Specified;
    property shipping_hidden_tax_amount:     string                                  Index (IS_OPTN) read Fshipping_hidden_tax_amount write Setshipping_hidden_tax_amount stored shipping_hidden_tax_amount_Specified;
    property base_shipping_hidden_tax_amnt:  string                                  Index (IS_OPTN) read Fbase_shipping_hidden_tax_amnt write Setbase_shipping_hidden_tax_amnt stored base_shipping_hidden_tax_amnt_Specified;
    property shipping_incl_tax:              string                                  Index (IS_OPTN) read Fshipping_incl_tax write Setshipping_incl_tax stored shipping_incl_tax_Specified;
    property base_shipping_incl_tax:         string                                  Index (IS_OPTN) read Fbase_shipping_incl_tax write Setbase_shipping_incl_tax stored base_shipping_incl_tax_Specified;
    property base_customer_balance_amount:   string                                  Index (IS_OPTN) read Fbase_customer_balance_amount write Setbase_customer_balance_amount stored base_customer_balance_amount_Specified;
    property customer_balance_amount:        string                                  Index (IS_OPTN) read Fcustomer_balance_amount write Setcustomer_balance_amount stored customer_balance_amount_Specified;
    property bs_customer_bal_total_refunded: string                                  Index (IS_OPTN) read Fbs_customer_bal_total_refunded write Setbs_customer_bal_total_refunded stored bs_customer_bal_total_refunded_Specified;
    property customer_bal_total_refunded:    string                                  Index (IS_OPTN) read Fcustomer_bal_total_refunded write Setcustomer_bal_total_refunded stored customer_bal_total_refunded_Specified;
    property base_gift_cards_amount:         string                                  Index (IS_OPTN) read Fbase_gift_cards_amount write Setbase_gift_cards_amount stored base_gift_cards_amount_Specified;
    property gift_cards_amount:              string                                  Index (IS_OPTN) read Fgift_cards_amount write Setgift_cards_amount stored gift_cards_amount_Specified;
    property gw_base_price:                  string                                  Index (IS_OPTN) read Fgw_base_price write Setgw_base_price stored gw_base_price_Specified;
    property gw_price:                       string                                  Index (IS_OPTN) read Fgw_price write Setgw_price stored gw_price_Specified;
    property gw_items_base_price:            string                                  Index (IS_OPTN) read Fgw_items_base_price write Setgw_items_base_price stored gw_items_base_price_Specified;
    property gw_items_price:                 string                                  Index (IS_OPTN) read Fgw_items_price write Setgw_items_price stored gw_items_price_Specified;
    property gw_card_base_price:             string                                  Index (IS_OPTN) read Fgw_card_base_price write Setgw_card_base_price stored gw_card_base_price_Specified;
    property gw_card_price:                  string                                  Index (IS_OPTN) read Fgw_card_price write Setgw_card_price stored gw_card_price_Specified;
    property gw_base_tax_amount:             string                                  Index (IS_OPTN) read Fgw_base_tax_amount write Setgw_base_tax_amount stored gw_base_tax_amount_Specified;
    property gw_tax_amount:                  string                                  Index (IS_OPTN) read Fgw_tax_amount write Setgw_tax_amount stored gw_tax_amount_Specified;
    property gw_items_base_tax_amount:       string                                  Index (IS_OPTN) read Fgw_items_base_tax_amount write Setgw_items_base_tax_amount stored gw_items_base_tax_amount_Specified;
    property gw_items_tax_amount:            string                                  Index (IS_OPTN) read Fgw_items_tax_amount write Setgw_items_tax_amount stored gw_items_tax_amount_Specified;
    property gw_card_base_tax_amount:        string                                  Index (IS_OPTN) read Fgw_card_base_tax_amount write Setgw_card_base_tax_amount stored gw_card_base_tax_amount_Specified;
    property gw_card_tax_amount:             string                                  Index (IS_OPTN) read Fgw_card_tax_amount write Setgw_card_tax_amount stored gw_card_tax_amount_Specified;
    property base_reward_currency_amount:    string                                  Index (IS_OPTN) read Fbase_reward_currency_amount write Setbase_reward_currency_amount stored base_reward_currency_amount_Specified;
    property reward_currency_amount:         string                                  Index (IS_OPTN) read Freward_currency_amount write Setreward_currency_amount stored reward_currency_amount_Specified;
    property reward_points_balance:          string                                  Index (IS_OPTN) read Freward_points_balance write Setreward_points_balance stored reward_points_balance_Specified;
    property reward_points_balance_refund:   string                                  Index (IS_OPTN) read Freward_points_balance_refund write Setreward_points_balance_refund stored reward_points_balance_refund_Specified;
    property creditmemo_id:                  string                                  Index (IS_OPTN) read Fcreditmemo_id write Setcreditmemo_id stored creditmemo_id_Specified;
    property items:                          salesOrderCreditmemoItemEntityArray     Index (IS_OPTN) read Fitems write Setitems stored items_Specified;
    property comments:                       salesOrderCreditmemoCommentEntityArray  Index (IS_OPTN) read Fcomments write Setcomments stored comments_Specified;
  end;



  // ************************************************************************ //
  // XML       : salesOrderShipmentEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  salesOrderShipmentEntity = class(TRemotable)
  private
    Fincrement_id: string;
    Fincrement_id_Specified: boolean;
    Fparent_id: string;
    Fparent_id_Specified: boolean;
    Fstore_id: string;
    Fstore_id_Specified: boolean;
    Fcreated_at: string;
    Fcreated_at_Specified: boolean;
    Fupdated_at: string;
    Fupdated_at_Specified: boolean;
    Fis_active: string;
    Fis_active_Specified: boolean;
    Fshipping_address_id: string;
    Fshipping_address_id_Specified: boolean;
    Fshipping_firstname: string;
    Fshipping_firstname_Specified: boolean;
    Fshipping_lastname: string;
    Fshipping_lastname_Specified: boolean;
    Forder_id: string;
    Forder_id_Specified: boolean;
    Forder_increment_id: string;
    Forder_increment_id_Specified: boolean;
    Forder_created_at: string;
    Forder_created_at_Specified: boolean;
    Ftotal_qty: string;
    Ftotal_qty_Specified: boolean;
    Fshipment_id: string;
    Fshipment_id_Specified: boolean;
    Fitems: salesOrderShipmentItemEntityArray;
    Fitems_Specified: boolean;
    Ftracks: salesOrderShipmentTrackEntityArray;
    Ftracks_Specified: boolean;
    Fcomments: salesOrderShipmentCommentEntityArray;
    Fcomments_Specified: boolean;
    procedure Setincrement_id(Index: Integer; const Astring: string);
    function  increment_id_Specified(Index: Integer): boolean;
    procedure Setparent_id(Index: Integer; const Astring: string);
    function  parent_id_Specified(Index: Integer): boolean;
    procedure Setstore_id(Index: Integer; const Astring: string);
    function  store_id_Specified(Index: Integer): boolean;
    procedure Setcreated_at(Index: Integer; const Astring: string);
    function  created_at_Specified(Index: Integer): boolean;
    procedure Setupdated_at(Index: Integer; const Astring: string);
    function  updated_at_Specified(Index: Integer): boolean;
    procedure Setis_active(Index: Integer; const Astring: string);
    function  is_active_Specified(Index: Integer): boolean;
    procedure Setshipping_address_id(Index: Integer; const Astring: string);
    function  shipping_address_id_Specified(Index: Integer): boolean;
    procedure Setshipping_firstname(Index: Integer; const Astring: string);
    function  shipping_firstname_Specified(Index: Integer): boolean;
    procedure Setshipping_lastname(Index: Integer; const Astring: string);
    function  shipping_lastname_Specified(Index: Integer): boolean;
    procedure Setorder_id(Index: Integer; const Astring: string);
    function  order_id_Specified(Index: Integer): boolean;
    procedure Setorder_increment_id(Index: Integer; const Astring: string);
    function  order_increment_id_Specified(Index: Integer): boolean;
    procedure Setorder_created_at(Index: Integer; const Astring: string);
    function  order_created_at_Specified(Index: Integer): boolean;
    procedure Settotal_qty(Index: Integer; const Astring: string);
    function  total_qty_Specified(Index: Integer): boolean;
    procedure Setshipment_id(Index: Integer; const Astring: string);
    function  shipment_id_Specified(Index: Integer): boolean;
    procedure Setitems(Index: Integer; const AsalesOrderShipmentItemEntityArray: salesOrderShipmentItemEntityArray);
    function  items_Specified(Index: Integer): boolean;
    procedure Settracks(Index: Integer; const AsalesOrderShipmentTrackEntityArray: salesOrderShipmentTrackEntityArray);
    function  tracks_Specified(Index: Integer): boolean;
    procedure Setcomments(Index: Integer; const AsalesOrderShipmentCommentEntityArray: salesOrderShipmentCommentEntityArray);
    function  comments_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property increment_id:        string                                Index (IS_OPTN) read Fincrement_id write Setincrement_id stored increment_id_Specified;
    property parent_id:           string                                Index (IS_OPTN) read Fparent_id write Setparent_id stored parent_id_Specified;
    property store_id:            string                                Index (IS_OPTN) read Fstore_id write Setstore_id stored store_id_Specified;
    property created_at:          string                                Index (IS_OPTN) read Fcreated_at write Setcreated_at stored created_at_Specified;
    property updated_at:          string                                Index (IS_OPTN) read Fupdated_at write Setupdated_at stored updated_at_Specified;
    property is_active:           string                                Index (IS_OPTN) read Fis_active write Setis_active stored is_active_Specified;
    property shipping_address_id: string                                Index (IS_OPTN) read Fshipping_address_id write Setshipping_address_id stored shipping_address_id_Specified;
    property shipping_firstname:  string                                Index (IS_OPTN) read Fshipping_firstname write Setshipping_firstname stored shipping_firstname_Specified;
    property shipping_lastname:   string                                Index (IS_OPTN) read Fshipping_lastname write Setshipping_lastname stored shipping_lastname_Specified;
    property order_id:            string                                Index (IS_OPTN) read Forder_id write Setorder_id stored order_id_Specified;
    property order_increment_id:  string                                Index (IS_OPTN) read Forder_increment_id write Setorder_increment_id stored order_increment_id_Specified;
    property order_created_at:    string                                Index (IS_OPTN) read Forder_created_at write Setorder_created_at stored order_created_at_Specified;
    property total_qty:           string                                Index (IS_OPTN) read Ftotal_qty write Settotal_qty stored total_qty_Specified;
    property shipment_id:         string                                Index (IS_OPTN) read Fshipment_id write Setshipment_id stored shipment_id_Specified;
    property items:               salesOrderShipmentItemEntityArray     Index (IS_OPTN) read Fitems write Setitems stored items_Specified;
    property tracks:              salesOrderShipmentTrackEntityArray    Index (IS_OPTN) read Ftracks write Settracks stored tracks_Specified;
    property comments:            salesOrderShipmentCommentEntityArray  Index (IS_OPTN) read Fcomments write Setcomments stored comments_Specified;
  end;



  // ************************************************************************ //
  // XML       : salesOrderStatusHistoryEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  salesOrderStatusHistoryEntity = class(TRemotable)
  private
    Fincrement_id: string;
    Fincrement_id_Specified: boolean;
    Fparent_id: string;
    Fparent_id_Specified: boolean;
    Fcreated_at: string;
    Fcreated_at_Specified: boolean;
    Fupdated_at: string;
    Fupdated_at_Specified: boolean;
    Fis_active: string;
    Fis_active_Specified: boolean;
    Fis_customer_notified: string;
    Fis_customer_notified_Specified: boolean;
    Fstatus: string;
    Fstatus_Specified: boolean;
    Fcomment: string;
    Fcomment_Specified: boolean;
    procedure Setincrement_id(Index: Integer; const Astring: string);
    function  increment_id_Specified(Index: Integer): boolean;
    procedure Setparent_id(Index: Integer; const Astring: string);
    function  parent_id_Specified(Index: Integer): boolean;
    procedure Setcreated_at(Index: Integer; const Astring: string);
    function  created_at_Specified(Index: Integer): boolean;
    procedure Setupdated_at(Index: Integer; const Astring: string);
    function  updated_at_Specified(Index: Integer): boolean;
    procedure Setis_active(Index: Integer; const Astring: string);
    function  is_active_Specified(Index: Integer): boolean;
    procedure Setis_customer_notified(Index: Integer; const Astring: string);
    function  is_customer_notified_Specified(Index: Integer): boolean;
    procedure Setstatus(Index: Integer; const Astring: string);
    function  status_Specified(Index: Integer): boolean;
    procedure Setcomment(Index: Integer; const Astring: string);
    function  comment_Specified(Index: Integer): boolean;
  published
    property increment_id:         string  Index (IS_OPTN) read Fincrement_id write Setincrement_id stored increment_id_Specified;
    property parent_id:            string  Index (IS_OPTN) read Fparent_id write Setparent_id stored parent_id_Specified;
    property created_at:           string  Index (IS_OPTN) read Fcreated_at write Setcreated_at stored created_at_Specified;
    property updated_at:           string  Index (IS_OPTN) read Fupdated_at write Setupdated_at stored updated_at_Specified;
    property is_active:            string  Index (IS_OPTN) read Fis_active write Setis_active stored is_active_Specified;
    property is_customer_notified: string  Index (IS_OPTN) read Fis_customer_notified write Setis_customer_notified stored is_customer_notified_Specified;
    property status:               string  Index (IS_OPTN) read Fstatus write Setstatus stored status_Specified;
    property comment:              string  Index (IS_OPTN) read Fcomment write Setcomment stored comment_Specified;
  end;



  // ************************************************************************ //
  // XML       : salesOrderShipmentCommentEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  salesOrderShipmentCommentEntity = class(TRemotable)
  private
    Fincrement_id: string;
    Fincrement_id_Specified: boolean;
    Fparent_id: string;
    Fparent_id_Specified: boolean;
    Fcreated_at: string;
    Fcreated_at_Specified: boolean;
    Fupdated_at: string;
    Fupdated_at_Specified: boolean;
    Fis_active: string;
    Fis_active_Specified: boolean;
    Fcomment: string;
    Fcomment_Specified: boolean;
    Fis_customer_notified: string;
    Fis_customer_notified_Specified: boolean;
    Fcomment_id: string;
    Fcomment_id_Specified: boolean;
    procedure Setincrement_id(Index: Integer; const Astring: string);
    function  increment_id_Specified(Index: Integer): boolean;
    procedure Setparent_id(Index: Integer; const Astring: string);
    function  parent_id_Specified(Index: Integer): boolean;
    procedure Setcreated_at(Index: Integer; const Astring: string);
    function  created_at_Specified(Index: Integer): boolean;
    procedure Setupdated_at(Index: Integer; const Astring: string);
    function  updated_at_Specified(Index: Integer): boolean;
    procedure Setis_active(Index: Integer; const Astring: string);
    function  is_active_Specified(Index: Integer): boolean;
    procedure Setcomment(Index: Integer; const Astring: string);
    function  comment_Specified(Index: Integer): boolean;
    procedure Setis_customer_notified(Index: Integer; const Astring: string);
    function  is_customer_notified_Specified(Index: Integer): boolean;
    procedure Setcomment_id(Index: Integer; const Astring: string);
    function  comment_id_Specified(Index: Integer): boolean;
  published
    property increment_id:         string  Index (IS_OPTN) read Fincrement_id write Setincrement_id stored increment_id_Specified;
    property parent_id:            string  Index (IS_OPTN) read Fparent_id write Setparent_id stored parent_id_Specified;
    property created_at:           string  Index (IS_OPTN) read Fcreated_at write Setcreated_at stored created_at_Specified;
    property updated_at:           string  Index (IS_OPTN) read Fupdated_at write Setupdated_at stored updated_at_Specified;
    property is_active:            string  Index (IS_OPTN) read Fis_active write Setis_active stored is_active_Specified;
    property comment:              string  Index (IS_OPTN) read Fcomment write Setcomment stored comment_Specified;
    property is_customer_notified: string  Index (IS_OPTN) read Fis_customer_notified write Setis_customer_notified stored is_customer_notified_Specified;
    property comment_id:           string  Index (IS_OPTN) read Fcomment_id write Setcomment_id stored comment_id_Specified;
  end;



  // ************************************************************************ //
  // XML       : salesOrderShipmentTrackEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  salesOrderShipmentTrackEntity = class(TRemotable)
  private
    Fincrement_id: string;
    Fincrement_id_Specified: boolean;
    Fparent_id: string;
    Fparent_id_Specified: boolean;
    Fcreated_at: string;
    Fcreated_at_Specified: boolean;
    Fupdated_at: string;
    Fupdated_at_Specified: boolean;
    Fis_active: string;
    Fis_active_Specified: boolean;
    Fcarrier_code: string;
    Fcarrier_code_Specified: boolean;
    Ftitle: string;
    Ftitle_Specified: boolean;
    Fnumber: string;
    Fnumber_Specified: boolean;
    Forder_id: string;
    Forder_id_Specified: boolean;
    Ftrack_id: string;
    Ftrack_id_Specified: boolean;
    procedure Setincrement_id(Index: Integer; const Astring: string);
    function  increment_id_Specified(Index: Integer): boolean;
    procedure Setparent_id(Index: Integer; const Astring: string);
    function  parent_id_Specified(Index: Integer): boolean;
    procedure Setcreated_at(Index: Integer; const Astring: string);
    function  created_at_Specified(Index: Integer): boolean;
    procedure Setupdated_at(Index: Integer; const Astring: string);
    function  updated_at_Specified(Index: Integer): boolean;
    procedure Setis_active(Index: Integer; const Astring: string);
    function  is_active_Specified(Index: Integer): boolean;
    procedure Setcarrier_code(Index: Integer; const Astring: string);
    function  carrier_code_Specified(Index: Integer): boolean;
    procedure Settitle(Index: Integer; const Astring: string);
    function  title_Specified(Index: Integer): boolean;
    procedure Setnumber(Index: Integer; const Astring: string);
    function  number_Specified(Index: Integer): boolean;
    procedure Setorder_id(Index: Integer; const Astring: string);
    function  order_id_Specified(Index: Integer): boolean;
    procedure Settrack_id(Index: Integer; const Astring: string);
    function  track_id_Specified(Index: Integer): boolean;
  published
    property increment_id: string  Index (IS_OPTN) read Fincrement_id write Setincrement_id stored increment_id_Specified;
    property parent_id:    string  Index (IS_OPTN) read Fparent_id write Setparent_id stored parent_id_Specified;
    property created_at:   string  Index (IS_OPTN) read Fcreated_at write Setcreated_at stored created_at_Specified;
    property updated_at:   string  Index (IS_OPTN) read Fupdated_at write Setupdated_at stored updated_at_Specified;
    property is_active:    string  Index (IS_OPTN) read Fis_active write Setis_active stored is_active_Specified;
    property carrier_code: string  Index (IS_OPTN) read Fcarrier_code write Setcarrier_code stored carrier_code_Specified;
    property title:        string  Index (IS_OPTN) read Ftitle write Settitle stored title_Specified;
    property number:       string  Index (IS_OPTN) read Fnumber write Setnumber stored number_Specified;
    property order_id:     string  Index (IS_OPTN) read Forder_id write Setorder_id stored order_id_Specified;
    property track_id:     string  Index (IS_OPTN) read Ftrack_id write Settrack_id stored track_id_Specified;
  end;



  // ************************************************************************ //
  // XML       : salesOrderShipmentItemEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  salesOrderShipmentItemEntity = class(TRemotable)
  private
    Fincrement_id: string;
    Fincrement_id_Specified: boolean;
    Fparent_id: string;
    Fparent_id_Specified: boolean;
    Fcreated_at: string;
    Fcreated_at_Specified: boolean;
    Fupdated_at: string;
    Fupdated_at_Specified: boolean;
    Fis_active: string;
    Fis_active_Specified: boolean;
    Fsku: string;
    Fsku_Specified: boolean;
    Fname_: string;
    Fname__Specified: boolean;
    Forder_item_id: string;
    Forder_item_id_Specified: boolean;
    Fproduct_id: string;
    Fproduct_id_Specified: boolean;
    Fweight: string;
    Fweight_Specified: boolean;
    Fprice: string;
    Fprice_Specified: boolean;
    Fqty: string;
    Fqty_Specified: boolean;
    Fitem_id: string;
    Fitem_id_Specified: boolean;
    procedure Setincrement_id(Index: Integer; const Astring: string);
    function  increment_id_Specified(Index: Integer): boolean;
    procedure Setparent_id(Index: Integer; const Astring: string);
    function  parent_id_Specified(Index: Integer): boolean;
    procedure Setcreated_at(Index: Integer; const Astring: string);
    function  created_at_Specified(Index: Integer): boolean;
    procedure Setupdated_at(Index: Integer; const Astring: string);
    function  updated_at_Specified(Index: Integer): boolean;
    procedure Setis_active(Index: Integer; const Astring: string);
    function  is_active_Specified(Index: Integer): boolean;
    procedure Setsku(Index: Integer; const Astring: string);
    function  sku_Specified(Index: Integer): boolean;
    procedure Setname_(Index: Integer; const Astring: string);
    function  name__Specified(Index: Integer): boolean;
    procedure Setorder_item_id(Index: Integer; const Astring: string);
    function  order_item_id_Specified(Index: Integer): boolean;
    procedure Setproduct_id(Index: Integer; const Astring: string);
    function  product_id_Specified(Index: Integer): boolean;
    procedure Setweight(Index: Integer; const Astring: string);
    function  weight_Specified(Index: Integer): boolean;
    procedure Setprice(Index: Integer; const Astring: string);
    function  price_Specified(Index: Integer): boolean;
    procedure Setqty(Index: Integer; const Astring: string);
    function  qty_Specified(Index: Integer): boolean;
    procedure Setitem_id(Index: Integer; const Astring: string);
    function  item_id_Specified(Index: Integer): boolean;
  published
    property increment_id:  string  Index (IS_OPTN) read Fincrement_id write Setincrement_id stored increment_id_Specified;
    property parent_id:     string  Index (IS_OPTN) read Fparent_id write Setparent_id stored parent_id_Specified;
    property created_at:    string  Index (IS_OPTN) read Fcreated_at write Setcreated_at stored created_at_Specified;
    property updated_at:    string  Index (IS_OPTN) read Fupdated_at write Setupdated_at stored updated_at_Specified;
    property is_active:     string  Index (IS_OPTN) read Fis_active write Setis_active stored is_active_Specified;
    property sku:           string  Index (IS_OPTN) read Fsku write Setsku stored sku_Specified;
    property name_:         string  Index (IS_OPTN) read Fname_ write Setname_ stored name__Specified;
    property order_item_id: string  Index (IS_OPTN) read Forder_item_id write Setorder_item_id stored order_item_id_Specified;
    property product_id:    string  Index (IS_OPTN) read Fproduct_id write Setproduct_id stored product_id_Specified;
    property weight:        string  Index (IS_OPTN) read Fweight write Setweight stored weight_Specified;
    property price:         string  Index (IS_OPTN) read Fprice write Setprice stored price_Specified;
    property qty:           string  Index (IS_OPTN) read Fqty write Setqty stored qty_Specified;
    property item_id:       string  Index (IS_OPTN) read Fitem_id write Setitem_id stored item_id_Specified;
  end;



  // ************************************************************************ //
  // XML       : int, global, <complexType>
  // Namespace : http://schemas.xmlsoap.org/soap/encoding/
  // ************************************************************************ //
  int2 = class(TRemotable)
  private
    FText: Integer;
    Fid: string;
    Fid_Specified: boolean;
    Fhref: string;
    Fhref_Specified: boolean;
    procedure Setid(Index: Integer; const Astring: string);
    function  id_Specified(Index: Integer): boolean;
    procedure Sethref(Index: Integer; const Astring: string);
    function  href_Specified(Index: Integer): boolean;
  published
    property Text: Integer  read FText write FText;
    property id:   string   Index (IS_ATTR or IS_OPTN) read Fid write Setid stored id_Specified;
    property href: string   Index (IS_ATTR or IS_OPTN) read Fhref write Sethref stored href_Specified;
  end;



  // ************************************************************************ //
  // XML       : customerCustomerEntityToCreate, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  customerCustomerEntityToCreate = class(TRemotable)
  private
    Fcustomer_id: Integer;
    Fcustomer_id_Specified: boolean;
    Femail: string;
    Femail_Specified: boolean;
    Ffirstname: string;
    Ffirstname_Specified: boolean;
    Flastname: string;
    Flastname_Specified: boolean;
    Fmiddlename: string;
    Fmiddlename_Specified: boolean;
    Fpassword: string;
    Fpassword_Specified: boolean;
    Fwebsite_id: Integer;
    Fwebsite_id_Specified: boolean;
    Fstore_id: Integer;
    Fstore_id_Specified: boolean;
    Fgroup_id: Integer;
    Fgroup_id_Specified: boolean;
    Fprefix: string;
    Fprefix_Specified: boolean;
    Fsuffix: string;
    Fsuffix_Specified: boolean;
    Fdob: string;
    Fdob_Specified: boolean;
    Ftaxvat: string;
    Ftaxvat_Specified: boolean;
    Fgender: Integer;
    Fgender_Specified: boolean;
    procedure Setcustomer_id(Index: Integer; const AInteger: Integer);
    function  customer_id_Specified(Index: Integer): boolean;
    procedure Setemail(Index: Integer; const Astring: string);
    function  email_Specified(Index: Integer): boolean;
    procedure Setfirstname(Index: Integer; const Astring: string);
    function  firstname_Specified(Index: Integer): boolean;
    procedure Setlastname(Index: Integer; const Astring: string);
    function  lastname_Specified(Index: Integer): boolean;
    procedure Setmiddlename(Index: Integer; const Astring: string);
    function  middlename_Specified(Index: Integer): boolean;
    procedure Setpassword(Index: Integer; const Astring: string);
    function  password_Specified(Index: Integer): boolean;
    procedure Setwebsite_id(Index: Integer; const AInteger: Integer);
    function  website_id_Specified(Index: Integer): boolean;
    procedure Setstore_id(Index: Integer; const AInteger: Integer);
    function  store_id_Specified(Index: Integer): boolean;
    procedure Setgroup_id(Index: Integer; const AInteger: Integer);
    function  group_id_Specified(Index: Integer): boolean;
    procedure Setprefix(Index: Integer; const Astring: string);
    function  prefix_Specified(Index: Integer): boolean;
    procedure Setsuffix(Index: Integer; const Astring: string);
    function  suffix_Specified(Index: Integer): boolean;
    procedure Setdob(Index: Integer; const Astring: string);
    function  dob_Specified(Index: Integer): boolean;
    procedure Settaxvat(Index: Integer; const Astring: string);
    function  taxvat_Specified(Index: Integer): boolean;
    procedure Setgender(Index: Integer; const AInteger: Integer);
    function  gender_Specified(Index: Integer): boolean;
  published
    property customer_id: Integer  Index (IS_OPTN) read Fcustomer_id write Setcustomer_id stored customer_id_Specified;
    property email:       string   Index (IS_OPTN) read Femail write Setemail stored email_Specified;
    property firstname:   string   Index (IS_OPTN) read Ffirstname write Setfirstname stored firstname_Specified;
    property lastname:    string   Index (IS_OPTN) read Flastname write Setlastname stored lastname_Specified;
    property middlename:  string   Index (IS_OPTN) read Fmiddlename write Setmiddlename stored middlename_Specified;
    property password:    string   Index (IS_OPTN) read Fpassword write Setpassword stored password_Specified;
    property website_id:  Integer  Index (IS_OPTN) read Fwebsite_id write Setwebsite_id stored website_id_Specified;
    property store_id:    Integer  Index (IS_OPTN) read Fstore_id write Setstore_id stored store_id_Specified;
    property group_id:    Integer  Index (IS_OPTN) read Fgroup_id write Setgroup_id stored group_id_Specified;
    property prefix:      string   Index (IS_OPTN) read Fprefix write Setprefix stored prefix_Specified;
    property suffix:      string   Index (IS_OPTN) read Fsuffix write Setsuffix stored suffix_Specified;
    property dob:         string   Index (IS_OPTN) read Fdob write Setdob stored dob_Specified;
    property taxvat:      string   Index (IS_OPTN) read Ftaxvat write Settaxvat stored taxvat_Specified;
    property gender:      Integer  Index (IS_OPTN) read Fgender write Setgender stored gender_Specified;
  end;



  // ************************************************************************ //
  // XML       : customerGroupEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  customerGroupEntity = class(TRemotable)
  private
    Fcustomer_group_id: Integer;
    Fcustomer_group_code: string;
  published
    property customer_group_id:   Integer  read Fcustomer_group_id write Fcustomer_group_id;
    property customer_group_code: string   read Fcustomer_group_code write Fcustomer_group_code;
  end;



  // ************************************************************************ //
  // XML       : storeEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  storeEntity = class(TRemotable)
  private
    Fstore_id: Integer;
    Fcode: string;
    Fwebsite_id: Integer;
    Fgroup_id: Integer;
    Fname_: string;
    Fsort_order: Integer;
    Fis_active: Integer;
  published
    property store_id:   Integer  read Fstore_id write Fstore_id;
    property code:       string   read Fcode write Fcode;
    property website_id: Integer  read Fwebsite_id write Fwebsite_id;
    property group_id:   Integer  read Fgroup_id write Fgroup_id;
    property name_:      string   read Fname_ write Fname_;
    property sort_order: Integer  read Fsort_order write Fsort_order;
    property is_active:  Integer  read Fis_active write Fis_active;
  end;



  // ************************************************************************ //
  // XML       : shoppingCartCustomerEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  shoppingCartCustomerEntity = class(TRemotable)
  private
    Fmode: string;
    Fmode_Specified: boolean;
    Fcustomer_id: Integer;
    Fcustomer_id_Specified: boolean;
    Femail: string;
    Femail_Specified: boolean;
    Ffirstname: string;
    Ffirstname_Specified: boolean;
    Flastname: string;
    Flastname_Specified: boolean;
    Fpassword: string;
    Fpassword_Specified: boolean;
    Fconfirmation: string;
    Fconfirmation_Specified: boolean;
    Fwebsite_id: Integer;
    Fwebsite_id_Specified: boolean;
    Fstore_id: Integer;
    Fstore_id_Specified: boolean;
    Fgroup_id: Integer;
    Fgroup_id_Specified: boolean;
    procedure Setmode(Index: Integer; const Astring: string);
    function  mode_Specified(Index: Integer): boolean;
    procedure Setcustomer_id(Index: Integer; const AInteger: Integer);
    function  customer_id_Specified(Index: Integer): boolean;
    procedure Setemail(Index: Integer; const Astring: string);
    function  email_Specified(Index: Integer): boolean;
    procedure Setfirstname(Index: Integer; const Astring: string);
    function  firstname_Specified(Index: Integer): boolean;
    procedure Setlastname(Index: Integer; const Astring: string);
    function  lastname_Specified(Index: Integer): boolean;
    procedure Setpassword(Index: Integer; const Astring: string);
    function  password_Specified(Index: Integer): boolean;
    procedure Setconfirmation(Index: Integer; const Astring: string);
    function  confirmation_Specified(Index: Integer): boolean;
    procedure Setwebsite_id(Index: Integer; const AInteger: Integer);
    function  website_id_Specified(Index: Integer): boolean;
    procedure Setstore_id(Index: Integer; const AInteger: Integer);
    function  store_id_Specified(Index: Integer): boolean;
    procedure Setgroup_id(Index: Integer; const AInteger: Integer);
    function  group_id_Specified(Index: Integer): boolean;
  published
    property mode:         string   Index (IS_OPTN) read Fmode write Setmode stored mode_Specified;
    property customer_id:  Integer  Index (IS_OPTN) read Fcustomer_id write Setcustomer_id stored customer_id_Specified;
    property email:        string   Index (IS_OPTN) read Femail write Setemail stored email_Specified;
    property firstname:    string   Index (IS_OPTN) read Ffirstname write Setfirstname stored firstname_Specified;
    property lastname:     string   Index (IS_OPTN) read Flastname write Setlastname stored lastname_Specified;
    property password:     string   Index (IS_OPTN) read Fpassword write Setpassword stored password_Specified;
    property confirmation: string   Index (IS_OPTN) read Fconfirmation write Setconfirmation stored confirmation_Specified;
    property website_id:   Integer  Index (IS_OPTN) read Fwebsite_id write Setwebsite_id stored website_id_Specified;
    property store_id:     Integer  Index (IS_OPTN) read Fstore_id write Setstore_id stored store_id_Specified;
    property group_id:     Integer  Index (IS_OPTN) read Fgroup_id write Setgroup_id stored group_id_Specified;
  end;



  // ************************************************************************ //
  // XML       : shoppingCartCustomerAddressEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  shoppingCartCustomerAddressEntity = class(TRemotable)
  private
    Fmode: string;
    Fmode_Specified: boolean;
    Faddress_id: string;
    Faddress_id_Specified: boolean;
    Ffirstname: string;
    Ffirstname_Specified: boolean;
    Flastname: string;
    Flastname_Specified: boolean;
    Fcompany: string;
    Fcompany_Specified: boolean;
    Fstreet: string;
    Fstreet_Specified: boolean;
    Fcity: string;
    Fcity_Specified: boolean;
    Fregion: string;
    Fregion_Specified: boolean;
    Fregion_id: string;
    Fregion_id_Specified: boolean;
    Fpostcode: string;
    Fpostcode_Specified: boolean;
    Fcountry_id: string;
    Fcountry_id_Specified: boolean;
    Ftelephone: string;
    Ftelephone_Specified: boolean;
    Ffax: string;
    Ffax_Specified: boolean;
    Fis_default_billing: Integer;
    Fis_default_billing_Specified: boolean;
    Fis_default_shipping: Integer;
    Fis_default_shipping_Specified: boolean;
    procedure Setmode(Index: Integer; const Astring: string);
    function  mode_Specified(Index: Integer): boolean;
    procedure Setaddress_id(Index: Integer; const Astring: string);
    function  address_id_Specified(Index: Integer): boolean;
    procedure Setfirstname(Index: Integer; const Astring: string);
    function  firstname_Specified(Index: Integer): boolean;
    procedure Setlastname(Index: Integer; const Astring: string);
    function  lastname_Specified(Index: Integer): boolean;
    procedure Setcompany(Index: Integer; const Astring: string);
    function  company_Specified(Index: Integer): boolean;
    procedure Setstreet(Index: Integer; const Astring: string);
    function  street_Specified(Index: Integer): boolean;
    procedure Setcity(Index: Integer; const Astring: string);
    function  city_Specified(Index: Integer): boolean;
    procedure Setregion(Index: Integer; const Astring: string);
    function  region_Specified(Index: Integer): boolean;
    procedure Setregion_id(Index: Integer; const Astring: string);
    function  region_id_Specified(Index: Integer): boolean;
    procedure Setpostcode(Index: Integer; const Astring: string);
    function  postcode_Specified(Index: Integer): boolean;
    procedure Setcountry_id(Index: Integer; const Astring: string);
    function  country_id_Specified(Index: Integer): boolean;
    procedure Settelephone(Index: Integer; const Astring: string);
    function  telephone_Specified(Index: Integer): boolean;
    procedure Setfax(Index: Integer; const Astring: string);
    function  fax_Specified(Index: Integer): boolean;
    procedure Setis_default_billing(Index: Integer; const AInteger: Integer);
    function  is_default_billing_Specified(Index: Integer): boolean;
    procedure Setis_default_shipping(Index: Integer; const AInteger: Integer);
    function  is_default_shipping_Specified(Index: Integer): boolean;
  published
    property mode:                string   Index (IS_OPTN) read Fmode write Setmode stored mode_Specified;
    property address_id:          string   Index (IS_OPTN) read Faddress_id write Setaddress_id stored address_id_Specified;
    property firstname:           string   Index (IS_OPTN) read Ffirstname write Setfirstname stored firstname_Specified;
    property lastname:            string   Index (IS_OPTN) read Flastname write Setlastname stored lastname_Specified;
    property company:             string   Index (IS_OPTN) read Fcompany write Setcompany stored company_Specified;
    property street:              string   Index (IS_OPTN) read Fstreet write Setstreet stored street_Specified;
    property city:                string   Index (IS_OPTN) read Fcity write Setcity stored city_Specified;
    property region:              string   Index (IS_OPTN) read Fregion write Setregion stored region_Specified;
    property region_id:           string   Index (IS_OPTN) read Fregion_id write Setregion_id stored region_id_Specified;
    property postcode:            string   Index (IS_OPTN) read Fpostcode write Setpostcode stored postcode_Specified;
    property country_id:          string   Index (IS_OPTN) read Fcountry_id write Setcountry_id stored country_id_Specified;
    property telephone:           string   Index (IS_OPTN) read Ftelephone write Settelephone stored telephone_Specified;
    property fax:                 string   Index (IS_OPTN) read Ffax write Setfax stored fax_Specified;
    property is_default_billing:  Integer  Index (IS_OPTN) read Fis_default_billing write Setis_default_billing stored is_default_billing_Specified;
    property is_default_shipping: Integer  Index (IS_OPTN) read Fis_default_shipping write Setis_default_shipping stored is_default_shipping_Specified;
  end;



  // ************************************************************************ //
  // XML       : shoppingCartLicenseEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  shoppingCartLicenseEntity = class(TRemotable)
  private
    Fagreement_id: string;
    Fagreement_id_Specified: boolean;
    Fname_: string;
    Fname__Specified: boolean;
    Fcontent: string;
    Fcontent_Specified: boolean;
    Fis_active: Integer;
    Fis_active_Specified: boolean;
    Fis_html: Integer;
    Fis_html_Specified: boolean;
    procedure Setagreement_id(Index: Integer; const Astring: string);
    function  agreement_id_Specified(Index: Integer): boolean;
    procedure Setname_(Index: Integer; const Astring: string);
    function  name__Specified(Index: Integer): boolean;
    procedure Setcontent(Index: Integer; const Astring: string);
    function  content_Specified(Index: Integer): boolean;
    procedure Setis_active(Index: Integer; const AInteger: Integer);
    function  is_active_Specified(Index: Integer): boolean;
    procedure Setis_html(Index: Integer; const AInteger: Integer);
    function  is_html_Specified(Index: Integer): boolean;
  published
    property agreement_id: string   Index (IS_OPTN) read Fagreement_id write Setagreement_id stored agreement_id_Specified;
    property name_:        string   Index (IS_OPTN) read Fname_ write Setname_ stored name__Specified;
    property content:      string   Index (IS_OPTN) read Fcontent write Setcontent stored content_Specified;
    property is_active:    Integer  Index (IS_OPTN) read Fis_active write Setis_active stored is_active_Specified;
    property is_html:      Integer  Index (IS_OPTN) read Fis_html write Setis_html stored is_html_Specified;
  end;



  // ************************************************************************ //
  // XML       : catalogProductDownloadableLinkEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogProductDownloadableLinkEntity = class(TRemotable)
  private
    Flink_id: string;
    Ftitle: string;
    Fprice: string;
    Fnumber_of_downloads: Integer;
    Fnumber_of_downloads_Specified: boolean;
    Fis_unlimited: Integer;
    Fis_unlimited_Specified: boolean;
    Fis_shareable: Integer;
    Flink_url: string;
    Flink_type: string;
    Fsample_file: string;
    Fsample_file_Specified: boolean;
    Fsample_url: string;
    Fsample_url_Specified: boolean;
    Fsample_type: string;
    Fsort_order: Integer;
    Ffile_save: catalogProductDownloadableLinkFileInfoEntityArray;
    Ffile_save_Specified: boolean;
    Fsample_file_save: catalogProductDownloadableLinkFileInfoEntityArray;
    Fsample_file_save_Specified: boolean;
    procedure Setnumber_of_downloads(Index: Integer; const AInteger: Integer);
    function  number_of_downloads_Specified(Index: Integer): boolean;
    procedure Setis_unlimited(Index: Integer; const AInteger: Integer);
    function  is_unlimited_Specified(Index: Integer): boolean;
    procedure Setsample_file(Index: Integer; const Astring: string);
    function  sample_file_Specified(Index: Integer): boolean;
    procedure Setsample_url(Index: Integer; const Astring: string);
    function  sample_url_Specified(Index: Integer): boolean;
    procedure Setfile_save(Index: Integer; const AcatalogProductDownloadableLinkFileInfoEntityArray: catalogProductDownloadableLinkFileInfoEntityArray);
    function  file_save_Specified(Index: Integer): boolean;
    procedure Setsample_file_save(Index: Integer; const AcatalogProductDownloadableLinkFileInfoEntityArray: catalogProductDownloadableLinkFileInfoEntityArray);
    function  sample_file_save_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property link_id:             string                                             read Flink_id write Flink_id;
    property title:               string                                             read Ftitle write Ftitle;
    property price:               string                                             read Fprice write Fprice;
    property number_of_downloads: Integer                                            Index (IS_OPTN) read Fnumber_of_downloads write Setnumber_of_downloads stored number_of_downloads_Specified;
    property is_unlimited:        Integer                                            Index (IS_OPTN) read Fis_unlimited write Setis_unlimited stored is_unlimited_Specified;
    property is_shareable:        Integer                                            read Fis_shareable write Fis_shareable;
    property link_url:            string                                             read Flink_url write Flink_url;
    property link_type:           string                                             read Flink_type write Flink_type;
    property sample_file:         string                                             Index (IS_OPTN) read Fsample_file write Setsample_file stored sample_file_Specified;
    property sample_url:          string                                             Index (IS_OPTN) read Fsample_url write Setsample_url stored sample_url_Specified;
    property sample_type:         string                                             read Fsample_type write Fsample_type;
    property sort_order:          Integer                                            read Fsort_order write Fsort_order;
    property file_save:           catalogProductDownloadableLinkFileInfoEntityArray  Index (IS_OPTN) read Ffile_save write Setfile_save stored file_save_Specified;
    property sample_file_save:    catalogProductDownloadableLinkFileInfoEntityArray  Index (IS_OPTN) read Fsample_file_save write Setsample_file_save stored sample_file_save_Specified;
  end;



  // ************************************************************************ //
  // XML       : catalogProductDownloadableLinkFileInfoEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogProductDownloadableLinkFileInfoEntity = class(TRemotable)
  private
    Ffile_: string;
    Fname_: string;
    Fsize: Integer;
    Fstatus: string;
  published
    property file_:  string   read Ffile_ write Ffile_;
    property name_:  string   read Fname_ write Fname_;
    property size:   Integer  read Fsize write Fsize;
    property status: string   read Fstatus write Fstatus;
  end;



  // ************************************************************************ //
  // XML       : catalogProductDownloadableLinkAddEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogProductDownloadableLinkAddEntity = class(TRemotable)
  private
    Ftitle: string;
    Fprice: string;
    Fprice_Specified: boolean;
    Fis_unlimited: Integer;
    Fis_unlimited_Specified: boolean;
    Fnumber_of_downloads: Integer;
    Fnumber_of_downloads_Specified: boolean;
    Fis_shareable: Integer;
    Fis_shareable_Specified: boolean;
    Fsample: catalogProductDownloadableLinkAddSampleEntity;
    Fsample_Specified: boolean;
    Ftype_: string;
    Ftype__Specified: boolean;
    Ffile_: catalogProductDownloadableLinkFileEntity;
    Ffile__Specified: boolean;
    Flink_url: string;
    Flink_url_Specified: boolean;
    Fsample_url: string;
    Fsample_url_Specified: boolean;
    Fsort_order: Integer;
    Fsort_order_Specified: boolean;
    procedure Setprice(Index: Integer; const Astring: string);
    function  price_Specified(Index: Integer): boolean;
    procedure Setis_unlimited(Index: Integer; const AInteger: Integer);
    function  is_unlimited_Specified(Index: Integer): boolean;
    procedure Setnumber_of_downloads(Index: Integer; const AInteger: Integer);
    function  number_of_downloads_Specified(Index: Integer): boolean;
    procedure Setis_shareable(Index: Integer; const AInteger: Integer);
    function  is_shareable_Specified(Index: Integer): boolean;
    procedure Setsample(Index: Integer; const AcatalogProductDownloadableLinkAddSampleEntity: catalogProductDownloadableLinkAddSampleEntity);
    function  sample_Specified(Index: Integer): boolean;
    procedure Settype_(Index: Integer; const Astring: string);
    function  type__Specified(Index: Integer): boolean;
    procedure Setfile_(Index: Integer; const AcatalogProductDownloadableLinkFileEntity: catalogProductDownloadableLinkFileEntity);
    function  file__Specified(Index: Integer): boolean;
    procedure Setlink_url(Index: Integer; const Astring: string);
    function  link_url_Specified(Index: Integer): boolean;
    procedure Setsample_url(Index: Integer; const Astring: string);
    function  sample_url_Specified(Index: Integer): boolean;
    procedure Setsort_order(Index: Integer; const AInteger: Integer);
    function  sort_order_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property title:               string                                         read Ftitle write Ftitle;
    property price:               string                                         Index (IS_OPTN) read Fprice write Setprice stored price_Specified;
    property is_unlimited:        Integer                                        Index (IS_OPTN) read Fis_unlimited write Setis_unlimited stored is_unlimited_Specified;
    property number_of_downloads: Integer                                        Index (IS_OPTN) read Fnumber_of_downloads write Setnumber_of_downloads stored number_of_downloads_Specified;
    property is_shareable:        Integer                                        Index (IS_OPTN) read Fis_shareable write Setis_shareable stored is_shareable_Specified;
    property sample:              catalogProductDownloadableLinkAddSampleEntity  Index (IS_OPTN) read Fsample write Setsample stored sample_Specified;
    property type_:               string                                         Index (IS_OPTN) read Ftype_ write Settype_ stored type__Specified;
    property file_:               catalogProductDownloadableLinkFileEntity       Index (IS_OPTN) read Ffile_ write Setfile_ stored file__Specified;
    property link_url:            string                                         Index (IS_OPTN) read Flink_url write Setlink_url stored link_url_Specified;
    property sample_url:          string                                         Index (IS_OPTN) read Fsample_url write Setsample_url stored sample_url_Specified;
    property sort_order:          Integer                                        Index (IS_OPTN) read Fsort_order write Setsort_order stored sort_order_Specified;
  end;



  // ************************************************************************ //
  // XML       : catalogProductCustomOptionToAdd, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogProductCustomOptionToAdd = class(TRemotable)
  private
    Ftitle: string;
    Ftype_: string;
    Fsort_order: string;
    Fsort_order_Specified: boolean;
    Fis_require: Integer;
    Fis_require_Specified: boolean;
    Fadditional_fields: catalogProductCustomOptionAdditionalFieldsArray;
    procedure Setsort_order(Index: Integer; const Astring: string);
    function  sort_order_Specified(Index: Integer): boolean;
    procedure Setis_require(Index: Integer; const AInteger: Integer);
    function  is_require_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property title:             string                                           read Ftitle write Ftitle;
    property type_:             string                                           read Ftype_ write Ftype_;
    property sort_order:        string                                           Index (IS_OPTN) read Fsort_order write Setsort_order stored sort_order_Specified;
    property is_require:        Integer                                          Index (IS_OPTN) read Fis_require write Setis_require stored is_require_Specified;
    property additional_fields: catalogProductCustomOptionAdditionalFieldsArray  read Fadditional_fields write Fadditional_fields;
  end;



  // ************************************************************************ //
  // XML       : catalogProductCustomOptionInfoEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogProductCustomOptionInfoEntity = class(TRemotable)
  private
    Ftitle: string;
    Ftype_: string;
    Fsort_order: string;
    Fis_require: Integer;
    Fadditional_fields: catalogProductCustomOptionAdditionalFieldsArray;
  public
    destructor Destroy; override;
  published
    property title:             string                                           read Ftitle write Ftitle;
    property type_:             string                                           read Ftype_ write Ftype_;
    property sort_order:        string                                           read Fsort_order write Fsort_order;
    property is_require:        Integer                                          read Fis_require write Fis_require;
    property additional_fields: catalogProductCustomOptionAdditionalFieldsArray  read Fadditional_fields write Fadditional_fields;
  end;



  // ************************************************************************ //
  // XML       : catalogProductCustomOptionToUpdate, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogProductCustomOptionToUpdate = class(TRemotable)
  private
    Ftitle: string;
    Ftitle_Specified: boolean;
    Ftype_: string;
    Ftype__Specified: boolean;
    Fsort_order: string;
    Fsort_order_Specified: boolean;
    Fis_require: Integer;
    Fis_require_Specified: boolean;
    Fadditional_fields: catalogProductCustomOptionAdditionalFieldsArray;
    Fadditional_fields_Specified: boolean;
    procedure Settitle(Index: Integer; const Astring: string);
    function  title_Specified(Index: Integer): boolean;
    procedure Settype_(Index: Integer; const Astring: string);
    function  type__Specified(Index: Integer): boolean;
    procedure Setsort_order(Index: Integer; const Astring: string);
    function  sort_order_Specified(Index: Integer): boolean;
    procedure Setis_require(Index: Integer; const AInteger: Integer);
    function  is_require_Specified(Index: Integer): boolean;
    procedure Setadditional_fields(Index: Integer; const AcatalogProductCustomOptionAdditionalFieldsArray: catalogProductCustomOptionAdditionalFieldsArray);
    function  additional_fields_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property title:             string                                           Index (IS_OPTN) read Ftitle write Settitle stored title_Specified;
    property type_:             string                                           Index (IS_OPTN) read Ftype_ write Settype_ stored type__Specified;
    property sort_order:        string                                           Index (IS_OPTN) read Fsort_order write Setsort_order stored sort_order_Specified;
    property is_require:        Integer                                          Index (IS_OPTN) read Fis_require write Setis_require stored is_require_Specified;
    property additional_fields: catalogProductCustomOptionAdditionalFieldsArray  Index (IS_OPTN) read Fadditional_fields write Setadditional_fields stored additional_fields_Specified;
  end;



  // ************************************************************************ //
  // XML       : catalogProductCustomOptionListEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogProductCustomOptionListEntity = class(TRemotable)
  private
    Foption_id: string;
    Ftitle: string;
    Ftype_: string;
    Fsort_order: string;
    Fis_require: Integer;
  published
    property option_id:  string   read Foption_id write Foption_id;
    property title:      string   read Ftitle write Ftitle;
    property type_:      string   read Ftype_ write Ftype_;
    property sort_order: string   read Fsort_order write Fsort_order;
    property is_require: Integer  read Fis_require write Fis_require;
  end;



  // ************************************************************************ //
  // XML       : string, global, <complexType>
  // Namespace : http://schemas.xmlsoap.org/soap/encoding/
  // ************************************************************************ //
  string_2 = class(TRemotable)
  private
    FText: string;
    Fid: string;
    Fid_Specified: boolean;
    Fhref: string;
    Fhref_Specified: boolean;
    procedure Setid(Index: Integer; const Astring: string);
    function  id_Specified(Index: Integer): boolean;
    procedure Sethref(Index: Integer; const Astring: string);
    function  href_Specified(Index: Integer): boolean;
  published
    property Text: string  read FText write FText;
    property id:   string  Index (IS_ATTR or IS_OPTN) read Fid write Setid stored id_Specified;
    property href: string  Index (IS_ATTR or IS_OPTN) read Fhref write Sethref stored href_Specified;
  end;



  // ************************************************************************ //
  // XML       : customerCustomerEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  customerCustomerEntity = class(TRemotable)
  private
    Fcustomer_id: Integer;
    Fcustomer_id_Specified: boolean;
    Fcreated_at: string;
    Fcreated_at_Specified: boolean;
    Fupdated_at: string;
    Fupdated_at_Specified: boolean;
    Fincrement_id: string;
    Fincrement_id_Specified: boolean;
    Fstore_id: Integer;
    Fstore_id_Specified: boolean;
    Fwebsite_id: Integer;
    Fwebsite_id_Specified: boolean;
    Fcreated_in: string;
    Fcreated_in_Specified: boolean;
    Femail: string;
    Femail_Specified: boolean;
    Ffirstname: string;
    Ffirstname_Specified: boolean;
    Fmiddlename: string;
    Fmiddlename_Specified: boolean;
    Flastname: string;
    Flastname_Specified: boolean;
    Fgroup_id: Integer;
    Fgroup_id_Specified: boolean;
    Fprefix: string;
    Fprefix_Specified: boolean;
    Fsuffix: string;
    Fsuffix_Specified: boolean;
    Fdob: string;
    Fdob_Specified: boolean;
    Ftaxvat: string;
    Ftaxvat_Specified: boolean;
    Fconfirmation: Boolean;
    Fconfirmation_Specified: boolean;
    Fpassword_hash: string;
    Fpassword_hash_Specified: boolean;
    procedure Setcustomer_id(Index: Integer; const AInteger: Integer);
    function  customer_id_Specified(Index: Integer): boolean;
    procedure Setcreated_at(Index: Integer; const Astring: string);
    function  created_at_Specified(Index: Integer): boolean;
    procedure Setupdated_at(Index: Integer; const Astring: string);
    function  updated_at_Specified(Index: Integer): boolean;
    procedure Setincrement_id(Index: Integer; const Astring: string);
    function  increment_id_Specified(Index: Integer): boolean;
    procedure Setstore_id(Index: Integer; const AInteger: Integer);
    function  store_id_Specified(Index: Integer): boolean;
    procedure Setwebsite_id(Index: Integer; const AInteger: Integer);
    function  website_id_Specified(Index: Integer): boolean;
    procedure Setcreated_in(Index: Integer; const Astring: string);
    function  created_in_Specified(Index: Integer): boolean;
    procedure Setemail(Index: Integer; const Astring: string);
    function  email_Specified(Index: Integer): boolean;
    procedure Setfirstname(Index: Integer; const Astring: string);
    function  firstname_Specified(Index: Integer): boolean;
    procedure Setmiddlename(Index: Integer; const Astring: string);
    function  middlename_Specified(Index: Integer): boolean;
    procedure Setlastname(Index: Integer; const Astring: string);
    function  lastname_Specified(Index: Integer): boolean;
    procedure Setgroup_id(Index: Integer; const AInteger: Integer);
    function  group_id_Specified(Index: Integer): boolean;
    procedure Setprefix(Index: Integer; const Astring: string);
    function  prefix_Specified(Index: Integer): boolean;
    procedure Setsuffix(Index: Integer; const Astring: string);
    function  suffix_Specified(Index: Integer): boolean;
    procedure Setdob(Index: Integer; const Astring: string);
    function  dob_Specified(Index: Integer): boolean;
    procedure Settaxvat(Index: Integer; const Astring: string);
    function  taxvat_Specified(Index: Integer): boolean;
    procedure Setconfirmation(Index: Integer; const ABoolean: Boolean);
    function  confirmation_Specified(Index: Integer): boolean;
    procedure Setpassword_hash(Index: Integer; const Astring: string);
    function  password_hash_Specified(Index: Integer): boolean;
  published
    property customer_id:   Integer  Index (IS_OPTN) read Fcustomer_id write Setcustomer_id stored customer_id_Specified;
    property created_at:    string   Index (IS_OPTN) read Fcreated_at write Setcreated_at stored created_at_Specified;
    property updated_at:    string   Index (IS_OPTN) read Fupdated_at write Setupdated_at stored updated_at_Specified;
    property increment_id:  string   Index (IS_OPTN) read Fincrement_id write Setincrement_id stored increment_id_Specified;
    property store_id:      Integer  Index (IS_OPTN) read Fstore_id write Setstore_id stored store_id_Specified;
    property website_id:    Integer  Index (IS_OPTN) read Fwebsite_id write Setwebsite_id stored website_id_Specified;
    property created_in:    string   Index (IS_OPTN) read Fcreated_in write Setcreated_in stored created_in_Specified;
    property email:         string   Index (IS_OPTN) read Femail write Setemail stored email_Specified;
    property firstname:     string   Index (IS_OPTN) read Ffirstname write Setfirstname stored firstname_Specified;
    property middlename:    string   Index (IS_OPTN) read Fmiddlename write Setmiddlename stored middlename_Specified;
    property lastname:      string   Index (IS_OPTN) read Flastname write Setlastname stored lastname_Specified;
    property group_id:      Integer  Index (IS_OPTN) read Fgroup_id write Setgroup_id stored group_id_Specified;
    property prefix:        string   Index (IS_OPTN) read Fprefix write Setprefix stored prefix_Specified;
    property suffix:        string   Index (IS_OPTN) read Fsuffix write Setsuffix stored suffix_Specified;
    property dob:           string   Index (IS_OPTN) read Fdob write Setdob stored dob_Specified;
    property taxvat:        string   Index (IS_OPTN) read Ftaxvat write Settaxvat stored taxvat_Specified;
    property confirmation:  Boolean  Index (IS_OPTN) read Fconfirmation write Setconfirmation stored confirmation_Specified;
    property password_hash: string   Index (IS_OPTN) read Fpassword_hash write Setpassword_hash stored password_hash_Specified;
  end;



  // ************************************************************************ //
  // XML       : customerAddressEntityItem, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  customerAddressEntityItem = class(TRemotable)
  private
    Fcustomer_address_id: Integer;
    Fcustomer_address_id_Specified: boolean;
    Fcreated_at: string;
    Fcreated_at_Specified: boolean;
    Fupdated_at: string;
    Fupdated_at_Specified: boolean;
    Fincrement_id: string;
    Fincrement_id_Specified: boolean;
    Fcity: string;
    Fcity_Specified: boolean;
    Fcompany: string;
    Fcompany_Specified: boolean;
    Fcountry_id: string;
    Fcountry_id_Specified: boolean;
    Ffax: string;
    Ffax_Specified: boolean;
    Ffirstname: string;
    Ffirstname_Specified: boolean;
    Flastname: string;
    Flastname_Specified: boolean;
    Fmiddlename: string;
    Fmiddlename_Specified: boolean;
    Fpostcode: string;
    Fpostcode_Specified: boolean;
    Fprefix: string;
    Fprefix_Specified: boolean;
    Fregion: string;
    Fregion_Specified: boolean;
    Fregion_id: Integer;
    Fregion_id_Specified: boolean;
    Fstreet: string;
    Fstreet_Specified: boolean;
    Fsuffix: string;
    Fsuffix_Specified: boolean;
    Ftelephone: string;
    Ftelephone_Specified: boolean;
    Fis_default_billing: Boolean;
    Fis_default_billing_Specified: boolean;
    Fis_default_shipping: Boolean;
    Fis_default_shipping_Specified: boolean;
    procedure Setcustomer_address_id(Index: Integer; const AInteger: Integer);
    function  customer_address_id_Specified(Index: Integer): boolean;
    procedure Setcreated_at(Index: Integer; const Astring: string);
    function  created_at_Specified(Index: Integer): boolean;
    procedure Setupdated_at(Index: Integer; const Astring: string);
    function  updated_at_Specified(Index: Integer): boolean;
    procedure Setincrement_id(Index: Integer; const Astring: string);
    function  increment_id_Specified(Index: Integer): boolean;
    procedure Setcity(Index: Integer; const Astring: string);
    function  city_Specified(Index: Integer): boolean;
    procedure Setcompany(Index: Integer; const Astring: string);
    function  company_Specified(Index: Integer): boolean;
    procedure Setcountry_id(Index: Integer; const Astring: string);
    function  country_id_Specified(Index: Integer): boolean;
    procedure Setfax(Index: Integer; const Astring: string);
    function  fax_Specified(Index: Integer): boolean;
    procedure Setfirstname(Index: Integer; const Astring: string);
    function  firstname_Specified(Index: Integer): boolean;
    procedure Setlastname(Index: Integer; const Astring: string);
    function  lastname_Specified(Index: Integer): boolean;
    procedure Setmiddlename(Index: Integer; const Astring: string);
    function  middlename_Specified(Index: Integer): boolean;
    procedure Setpostcode(Index: Integer; const Astring: string);
    function  postcode_Specified(Index: Integer): boolean;
    procedure Setprefix(Index: Integer; const Astring: string);
    function  prefix_Specified(Index: Integer): boolean;
    procedure Setregion(Index: Integer; const Astring: string);
    function  region_Specified(Index: Integer): boolean;
    procedure Setregion_id(Index: Integer; const AInteger: Integer);
    function  region_id_Specified(Index: Integer): boolean;
    procedure Setstreet(Index: Integer; const Astring: string);
    function  street_Specified(Index: Integer): boolean;
    procedure Setsuffix(Index: Integer; const Astring: string);
    function  suffix_Specified(Index: Integer): boolean;
    procedure Settelephone(Index: Integer; const Astring: string);
    function  telephone_Specified(Index: Integer): boolean;
    procedure Setis_default_billing(Index: Integer; const ABoolean: Boolean);
    function  is_default_billing_Specified(Index: Integer): boolean;
    procedure Setis_default_shipping(Index: Integer; const ABoolean: Boolean);
    function  is_default_shipping_Specified(Index: Integer): boolean;
  published
    property customer_address_id: Integer  Index (IS_OPTN) read Fcustomer_address_id write Setcustomer_address_id stored customer_address_id_Specified;
    property created_at:          string   Index (IS_OPTN) read Fcreated_at write Setcreated_at stored created_at_Specified;
    property updated_at:          string   Index (IS_OPTN) read Fupdated_at write Setupdated_at stored updated_at_Specified;
    property increment_id:        string   Index (IS_OPTN) read Fincrement_id write Setincrement_id stored increment_id_Specified;
    property city:                string   Index (IS_OPTN) read Fcity write Setcity stored city_Specified;
    property company:             string   Index (IS_OPTN) read Fcompany write Setcompany stored company_Specified;
    property country_id:          string   Index (IS_OPTN) read Fcountry_id write Setcountry_id stored country_id_Specified;
    property fax:                 string   Index (IS_OPTN) read Ffax write Setfax stored fax_Specified;
    property firstname:           string   Index (IS_OPTN) read Ffirstname write Setfirstname stored firstname_Specified;
    property lastname:            string   Index (IS_OPTN) read Flastname write Setlastname stored lastname_Specified;
    property middlename:          string   Index (IS_OPTN) read Fmiddlename write Setmiddlename stored middlename_Specified;
    property postcode:            string   Index (IS_OPTN) read Fpostcode write Setpostcode stored postcode_Specified;
    property prefix:              string   Index (IS_OPTN) read Fprefix write Setprefix stored prefix_Specified;
    property region:              string   Index (IS_OPTN) read Fregion write Setregion stored region_Specified;
    property region_id:           Integer  Index (IS_OPTN) read Fregion_id write Setregion_id stored region_id_Specified;
    property street:              string   Index (IS_OPTN) read Fstreet write Setstreet stored street_Specified;
    property suffix:              string   Index (IS_OPTN) read Fsuffix write Setsuffix stored suffix_Specified;
    property telephone:           string   Index (IS_OPTN) read Ftelephone write Settelephone stored telephone_Specified;
    property is_default_billing:  Boolean  Index (IS_OPTN) read Fis_default_billing write Setis_default_billing stored is_default_billing_Specified;
    property is_default_shipping: Boolean  Index (IS_OPTN) read Fis_default_shipping write Setis_default_shipping stored is_default_shipping_Specified;
  end;



  // ************************************************************************ //
  // XML       : giftMessageResponse, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  giftMessageResponse = class(TRemotable)
  private
    FentityId: string;
    FentityId_Specified: boolean;
    Fresult: Boolean;
    Fresult_Specified: boolean;
    Ferror: string;
    Ferror_Specified: boolean;
    procedure SetentityId(Index: Integer; const Astring: string);
    function  entityId_Specified(Index: Integer): boolean;
    procedure Setresult(Index: Integer; const ABoolean: Boolean);
    function  result_Specified(Index: Integer): boolean;
    procedure Seterror(Index: Integer; const Astring: string);
    function  error_Specified(Index: Integer): boolean;
  published
    property entityId: string   Index (IS_OPTN) read FentityId write SetentityId stored entityId_Specified;
    property result:   Boolean  Index (IS_OPTN) read Fresult write Setresult stored result_Specified;
    property error:    string   Index (IS_OPTN) read Ferror write Seterror stored error_Specified;
  end;



  // ************************************************************************ //
  // XML       : boolean, global, <complexType>
  // Namespace : http://schemas.xmlsoap.org/soap/encoding/
  // ************************************************************************ //
  boolean_2 = class(TRemotable)
  private
    FText: Boolean;
    Fid: string;
    Fid_Specified: boolean;
    Fhref: string;
    Fhref_Specified: boolean;
    procedure Setid(Index: Integer; const Astring: string);
    function  id_Specified(Index: Integer): boolean;
    procedure Sethref(Index: Integer; const Astring: string);
    function  href_Specified(Index: Integer): boolean;
  published
    property Text: Boolean  read FText write FText;
    property id:   string   Index (IS_ATTR or IS_OPTN) read Fid write Setid stored id_Specified;
    property href: string   Index (IS_ATTR or IS_OPTN) read Fhref write Sethref stored href_Specified;
  end;



  // ************************************************************************ //
  // XML       : boolean, global, <element>
  // Namespace : http://schemas.xmlsoap.org/soap/encoding/
  // ************************************************************************ //
  boolean_ = class(boolean_2)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : anyURI, global, <complexType>
  // Namespace : http://schemas.xmlsoap.org/soap/encoding/
  // ************************************************************************ //
  anyURI2 = class(TRemotable)
  private
    FText: string;
    Fid: string;
    Fid_Specified: boolean;
    Fhref: string;
    Fhref_Specified: boolean;
    procedure Setid(Index: Integer; const Astring: string);
    function  id_Specified(Index: Integer): boolean;
    procedure Sethref(Index: Integer; const Astring: string);
    function  href_Specified(Index: Integer): boolean;
  published
    property Text: string  read FText write FText;
    property id:   string  Index (IS_ATTR or IS_OPTN) read Fid write Setid stored id_Specified;
    property href: string  Index (IS_ATTR or IS_OPTN) read Fhref write Sethref stored href_Specified;
  end;



  // ************************************************************************ //
  // XML       : double, global, <complexType>
  // Namespace : http://schemas.xmlsoap.org/soap/encoding/
  // ************************************************************************ //
  double_2 = class(TRemotable)
  private
    FText: Double;
    Fid: string;
    Fid_Specified: boolean;
    Fhref: string;
    Fhref_Specified: boolean;
    procedure Setid(Index: Integer; const Astring: string);
    function  id_Specified(Index: Integer): boolean;
    procedure Sethref(Index: Integer; const Astring: string);
    function  href_Specified(Index: Integer): boolean;
  published
    property Text: Double  read FText write FText;
    property id:   string  Index (IS_ATTR or IS_OPTN) read Fid write Setid stored id_Specified;
    property href: string  Index (IS_ATTR or IS_OPTN) read Fhref write Sethref stored href_Specified;
  end;



  // ************************************************************************ //
  // XML       : shoppingCartShippingMethodEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  shoppingCartShippingMethodEntity = class(TRemotable)
  private
    Fcode: string;
    Fcode_Specified: boolean;
    Fcarrier: string;
    Fcarrier_Specified: boolean;
    Fcarrier_title: string;
    Fcarrier_title_Specified: boolean;
    Fmethod: string;
    Fmethod_Specified: boolean;
    Fmethod_title: string;
    Fmethod_title_Specified: boolean;
    Fmethod_description: string;
    Fmethod_description_Specified: boolean;
    Fprice: Double;
    Fprice_Specified: boolean;
    procedure Setcode(Index: Integer; const Astring: string);
    function  code_Specified(Index: Integer): boolean;
    procedure Setcarrier(Index: Integer; const Astring: string);
    function  carrier_Specified(Index: Integer): boolean;
    procedure Setcarrier_title(Index: Integer; const Astring: string);
    function  carrier_title_Specified(Index: Integer): boolean;
    procedure Setmethod(Index: Integer; const Astring: string);
    function  method_Specified(Index: Integer): boolean;
    procedure Setmethod_title(Index: Integer; const Astring: string);
    function  method_title_Specified(Index: Integer): boolean;
    procedure Setmethod_description(Index: Integer; const Astring: string);
    function  method_description_Specified(Index: Integer): boolean;
    procedure Setprice(Index: Integer; const ADouble: Double);
    function  price_Specified(Index: Integer): boolean;
  published
    property code:               string  Index (IS_OPTN) read Fcode write Setcode stored code_Specified;
    property carrier:            string  Index (IS_OPTN) read Fcarrier write Setcarrier stored carrier_Specified;
    property carrier_title:      string  Index (IS_OPTN) read Fcarrier_title write Setcarrier_title stored carrier_title_Specified;
    property method:             string  Index (IS_OPTN) read Fmethod write Setmethod stored method_Specified;
    property method_title:       string  Index (IS_OPTN) read Fmethod_title write Setmethod_title stored method_title_Specified;
    property method_description: string  Index (IS_OPTN) read Fmethod_description write Setmethod_description stored method_description_Specified;
    property price:              Double  Index (IS_OPTN) read Fprice write Setprice stored price_Specified;
  end;



  // ************************************************************************ //
  // XML       : shoppingCartAddressEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  shoppingCartAddressEntity = class(TRemotable)
  private
    Faddress_id: string;
    Faddress_id_Specified: boolean;
    Fcreated_at: string;
    Fcreated_at_Specified: boolean;
    Fupdated_at: string;
    Fupdated_at_Specified: boolean;
    Fcustomer_id: string;
    Fcustomer_id_Specified: boolean;
    Fsave_in_address_book: Integer;
    Fsave_in_address_book_Specified: boolean;
    Fcustomer_address_id: string;
    Fcustomer_address_id_Specified: boolean;
    Faddress_type: string;
    Faddress_type_Specified: boolean;
    Femail: string;
    Femail_Specified: boolean;
    Fprefix: string;
    Fprefix_Specified: boolean;
    Ffirstname: string;
    Ffirstname_Specified: boolean;
    Fmiddlename: string;
    Fmiddlename_Specified: boolean;
    Flastname: string;
    Flastname_Specified: boolean;
    Fsuffix: string;
    Fsuffix_Specified: boolean;
    Fcompany: string;
    Fcompany_Specified: boolean;
    Fstreet: string;
    Fstreet_Specified: boolean;
    Fcity: string;
    Fcity_Specified: boolean;
    Fregion: string;
    Fregion_Specified: boolean;
    Fregion_id: string;
    Fregion_id_Specified: boolean;
    Fpostcode: string;
    Fpostcode_Specified: boolean;
    Fcountry_id: string;
    Fcountry_id_Specified: boolean;
    Ftelephone: string;
    Ftelephone_Specified: boolean;
    Ffax: string;
    Ffax_Specified: boolean;
    Fsame_as_billing: Integer;
    Fsame_as_billing_Specified: boolean;
    Ffree_shipping: Integer;
    Ffree_shipping_Specified: boolean;
    Fshipping_method: string;
    Fshipping_method_Specified: boolean;
    Fshipping_description: string;
    Fshipping_description_Specified: boolean;
    Fweight: Double;
    Fweight_Specified: boolean;
    procedure Setaddress_id(Index: Integer; const Astring: string);
    function  address_id_Specified(Index: Integer): boolean;
    procedure Setcreated_at(Index: Integer; const Astring: string);
    function  created_at_Specified(Index: Integer): boolean;
    procedure Setupdated_at(Index: Integer; const Astring: string);
    function  updated_at_Specified(Index: Integer): boolean;
    procedure Setcustomer_id(Index: Integer; const Astring: string);
    function  customer_id_Specified(Index: Integer): boolean;
    procedure Setsave_in_address_book(Index: Integer; const AInteger: Integer);
    function  save_in_address_book_Specified(Index: Integer): boolean;
    procedure Setcustomer_address_id(Index: Integer; const Astring: string);
    function  customer_address_id_Specified(Index: Integer): boolean;
    procedure Setaddress_type(Index: Integer; const Astring: string);
    function  address_type_Specified(Index: Integer): boolean;
    procedure Setemail(Index: Integer; const Astring: string);
    function  email_Specified(Index: Integer): boolean;
    procedure Setprefix(Index: Integer; const Astring: string);
    function  prefix_Specified(Index: Integer): boolean;
    procedure Setfirstname(Index: Integer; const Astring: string);
    function  firstname_Specified(Index: Integer): boolean;
    procedure Setmiddlename(Index: Integer; const Astring: string);
    function  middlename_Specified(Index: Integer): boolean;
    procedure Setlastname(Index: Integer; const Astring: string);
    function  lastname_Specified(Index: Integer): boolean;
    procedure Setsuffix(Index: Integer; const Astring: string);
    function  suffix_Specified(Index: Integer): boolean;
    procedure Setcompany(Index: Integer; const Astring: string);
    function  company_Specified(Index: Integer): boolean;
    procedure Setstreet(Index: Integer; const Astring: string);
    function  street_Specified(Index: Integer): boolean;
    procedure Setcity(Index: Integer; const Astring: string);
    function  city_Specified(Index: Integer): boolean;
    procedure Setregion(Index: Integer; const Astring: string);
    function  region_Specified(Index: Integer): boolean;
    procedure Setregion_id(Index: Integer; const Astring: string);
    function  region_id_Specified(Index: Integer): boolean;
    procedure Setpostcode(Index: Integer; const Astring: string);
    function  postcode_Specified(Index: Integer): boolean;
    procedure Setcountry_id(Index: Integer; const Astring: string);
    function  country_id_Specified(Index: Integer): boolean;
    procedure Settelephone(Index: Integer; const Astring: string);
    function  telephone_Specified(Index: Integer): boolean;
    procedure Setfax(Index: Integer; const Astring: string);
    function  fax_Specified(Index: Integer): boolean;
    procedure Setsame_as_billing(Index: Integer; const AInteger: Integer);
    function  same_as_billing_Specified(Index: Integer): boolean;
    procedure Setfree_shipping(Index: Integer; const AInteger: Integer);
    function  free_shipping_Specified(Index: Integer): boolean;
    procedure Setshipping_method(Index: Integer; const Astring: string);
    function  shipping_method_Specified(Index: Integer): boolean;
    procedure Setshipping_description(Index: Integer; const Astring: string);
    function  shipping_description_Specified(Index: Integer): boolean;
    procedure Setweight(Index: Integer; const ADouble: Double);
    function  weight_Specified(Index: Integer): boolean;
  published
    property address_id:           string   Index (IS_OPTN) read Faddress_id write Setaddress_id stored address_id_Specified;
    property created_at:           string   Index (IS_OPTN) read Fcreated_at write Setcreated_at stored created_at_Specified;
    property updated_at:           string   Index (IS_OPTN) read Fupdated_at write Setupdated_at stored updated_at_Specified;
    property customer_id:          string   Index (IS_OPTN) read Fcustomer_id write Setcustomer_id stored customer_id_Specified;
    property save_in_address_book: Integer  Index (IS_OPTN) read Fsave_in_address_book write Setsave_in_address_book stored save_in_address_book_Specified;
    property customer_address_id:  string   Index (IS_OPTN) read Fcustomer_address_id write Setcustomer_address_id stored customer_address_id_Specified;
    property address_type:         string   Index (IS_OPTN) read Faddress_type write Setaddress_type stored address_type_Specified;
    property email:                string   Index (IS_OPTN) read Femail write Setemail stored email_Specified;
    property prefix:               string   Index (IS_OPTN) read Fprefix write Setprefix stored prefix_Specified;
    property firstname:            string   Index (IS_OPTN) read Ffirstname write Setfirstname stored firstname_Specified;
    property middlename:           string   Index (IS_OPTN) read Fmiddlename write Setmiddlename stored middlename_Specified;
    property lastname:             string   Index (IS_OPTN) read Flastname write Setlastname stored lastname_Specified;
    property suffix:               string   Index (IS_OPTN) read Fsuffix write Setsuffix stored suffix_Specified;
    property company:              string   Index (IS_OPTN) read Fcompany write Setcompany stored company_Specified;
    property street:               string   Index (IS_OPTN) read Fstreet write Setstreet stored street_Specified;
    property city:                 string   Index (IS_OPTN) read Fcity write Setcity stored city_Specified;
    property region:               string   Index (IS_OPTN) read Fregion write Setregion stored region_Specified;
    property region_id:            string   Index (IS_OPTN) read Fregion_id write Setregion_id stored region_id_Specified;
    property postcode:             string   Index (IS_OPTN) read Fpostcode write Setpostcode stored postcode_Specified;
    property country_id:           string   Index (IS_OPTN) read Fcountry_id write Setcountry_id stored country_id_Specified;
    property telephone:            string   Index (IS_OPTN) read Ftelephone write Settelephone stored telephone_Specified;
    property fax:                  string   Index (IS_OPTN) read Ffax write Setfax stored fax_Specified;
    property same_as_billing:      Integer  Index (IS_OPTN) read Fsame_as_billing write Setsame_as_billing stored same_as_billing_Specified;
    property free_shipping:        Integer  Index (IS_OPTN) read Ffree_shipping write Setfree_shipping stored free_shipping_Specified;
    property shipping_method:      string   Index (IS_OPTN) read Fshipping_method write Setshipping_method stored shipping_method_Specified;
    property shipping_description: string   Index (IS_OPTN) read Fshipping_description write Setshipping_description stored shipping_description_Specified;
    property weight:               Double   Index (IS_OPTN) read Fweight write Setweight stored weight_Specified;
  end;



  // ************************************************************************ //
  // XML       : salesOrderCreditmemoData, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  salesOrderCreditmemoData = class(TRemotable)
  private
    Fqtys: orderItemIdQtyArray;
    Fqtys_Specified: boolean;
    Fshipping_amount: Double;
    Fshipping_amount_Specified: boolean;
    Fadjustment_positive: Double;
    Fadjustment_positive_Specified: boolean;
    Fadjustment_negative: Double;
    Fadjustment_negative_Specified: boolean;
    procedure Setqtys(Index: Integer; const AorderItemIdQtyArray: orderItemIdQtyArray);
    function  qtys_Specified(Index: Integer): boolean;
    procedure Setshipping_amount(Index: Integer; const ADouble: Double);
    function  shipping_amount_Specified(Index: Integer): boolean;
    procedure Setadjustment_positive(Index: Integer; const ADouble: Double);
    function  adjustment_positive_Specified(Index: Integer): boolean;
    procedure Setadjustment_negative(Index: Integer; const ADouble: Double);
    function  adjustment_negative_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property qtys:                orderItemIdQtyArray  Index (IS_OPTN) read Fqtys write Setqtys stored qtys_Specified;
    property shipping_amount:     Double               Index (IS_OPTN) read Fshipping_amount write Setshipping_amount stored shipping_amount_Specified;
    property adjustment_positive: Double               Index (IS_OPTN) read Fadjustment_positive write Setadjustment_positive stored adjustment_positive_Specified;
    property adjustment_negative: Double               Index (IS_OPTN) read Fadjustment_negative write Setadjustment_negative stored adjustment_negative_Specified;
  end;



  // ************************************************************************ //
  // XML       : shoppingCartItemEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  shoppingCartItemEntity = class(TRemotable)
  private
    Fitem_id: string;
    Fitem_id_Specified: boolean;
    Fcreated_at: string;
    Fcreated_at_Specified: boolean;
    Fupdated_at: string;
    Fupdated_at_Specified: boolean;
    Fproduct_id: string;
    Fproduct_id_Specified: boolean;
    Fstore_id: string;
    Fstore_id_Specified: boolean;
    Fparent_item_id: string;
    Fparent_item_id_Specified: boolean;
    Fis_virtual: Integer;
    Fis_virtual_Specified: boolean;
    Fsku: string;
    Fsku_Specified: boolean;
    Fname_: string;
    Fname__Specified: boolean;
    Fdescription: string;
    Fdescription_Specified: boolean;
    Fapplied_rule_ids: string;
    Fapplied_rule_ids_Specified: boolean;
    Fadditional_data: string;
    Fadditional_data_Specified: boolean;
    Ffree_shipping: string;
    Ffree_shipping_Specified: boolean;
    Fis_qty_decimal: string;
    Fis_qty_decimal_Specified: boolean;
    Fno_discount: string;
    Fno_discount_Specified: boolean;
    Fweight: Double;
    Fweight_Specified: boolean;
    Fqty: Double;
    Fqty_Specified: boolean;
    Fprice: Double;
    Fprice_Specified: boolean;
    Fbase_price: Double;
    Fbase_price_Specified: boolean;
    Fcustom_price: Double;
    Fcustom_price_Specified: boolean;
    Fdiscount_percent: Double;
    Fdiscount_percent_Specified: boolean;
    Fdiscount_amount: Double;
    Fdiscount_amount_Specified: boolean;
    Fbase_discount_amount: Double;
    Fbase_discount_amount_Specified: boolean;
    Ftax_percent: Double;
    Ftax_percent_Specified: boolean;
    Ftax_amount: Double;
    Ftax_amount_Specified: boolean;
    Fbase_tax_amount: Double;
    Fbase_tax_amount_Specified: boolean;
    Frow_total: Double;
    Frow_total_Specified: boolean;
    Fbase_row_total: Double;
    Fbase_row_total_Specified: boolean;
    Frow_total_with_discount: Double;
    Frow_total_with_discount_Specified: boolean;
    Frow_weight: Double;
    Frow_weight_Specified: boolean;
    Fproduct_type: string;
    Fproduct_type_Specified: boolean;
    Fbase_tax_before_discount: Double;
    Fbase_tax_before_discount_Specified: boolean;
    Ftax_before_discount: Double;
    Ftax_before_discount_Specified: boolean;
    Foriginal_custom_price: Double;
    Foriginal_custom_price_Specified: boolean;
    Fbase_cost: Double;
    Fbase_cost_Specified: boolean;
    Fprice_incl_tax: Double;
    Fprice_incl_tax_Specified: boolean;
    Fbase_price_incl_tax: Double;
    Fbase_price_incl_tax_Specified: boolean;
    Frow_total_incl_tax: Double;
    Frow_total_incl_tax_Specified: boolean;
    Fbase_row_total_incl_tax: Double;
    Fbase_row_total_incl_tax_Specified: boolean;
    Fgift_message_id: string;
    Fgift_message_id_Specified: boolean;
    Fgift_message: string;
    Fgift_message_Specified: boolean;
    Fgift_message_available: string;
    Fgift_message_available_Specified: boolean;
    Fweee_tax_applied: Double;
    Fweee_tax_applied_Specified: boolean;
    Fweee_tax_applied_amount: Double;
    Fweee_tax_applied_amount_Specified: boolean;
    Fweee_tax_applied_row_amount: Double;
    Fweee_tax_applied_row_amount_Specified: boolean;
    Fbase_weee_tax_applied_amount: Double;
    Fbase_weee_tax_applied_amount_Specified: boolean;
    Fbase_weee_tax_applied_row_amount: Double;
    Fbase_weee_tax_applied_row_amount_Specified: boolean;
    Fweee_tax_disposition: Double;
    Fweee_tax_disposition_Specified: boolean;
    Fweee_tax_row_disposition: Double;
    Fweee_tax_row_disposition_Specified: boolean;
    Fbase_weee_tax_disposition: Double;
    Fbase_weee_tax_disposition_Specified: boolean;
    Fbase_weee_tax_row_disposition: Double;
    Fbase_weee_tax_row_disposition_Specified: boolean;
    Ftax_class_id: string;
    Ftax_class_id_Specified: boolean;
    procedure Setitem_id(Index: Integer; const Astring: string);
    function  item_id_Specified(Index: Integer): boolean;
    procedure Setcreated_at(Index: Integer; const Astring: string);
    function  created_at_Specified(Index: Integer): boolean;
    procedure Setupdated_at(Index: Integer; const Astring: string);
    function  updated_at_Specified(Index: Integer): boolean;
    procedure Setproduct_id(Index: Integer; const Astring: string);
    function  product_id_Specified(Index: Integer): boolean;
    procedure Setstore_id(Index: Integer; const Astring: string);
    function  store_id_Specified(Index: Integer): boolean;
    procedure Setparent_item_id(Index: Integer; const Astring: string);
    function  parent_item_id_Specified(Index: Integer): boolean;
    procedure Setis_virtual(Index: Integer; const AInteger: Integer);
    function  is_virtual_Specified(Index: Integer): boolean;
    procedure Setsku(Index: Integer; const Astring: string);
    function  sku_Specified(Index: Integer): boolean;
    procedure Setname_(Index: Integer; const Astring: string);
    function  name__Specified(Index: Integer): boolean;
    procedure Setdescription(Index: Integer; const Astring: string);
    function  description_Specified(Index: Integer): boolean;
    procedure Setapplied_rule_ids(Index: Integer; const Astring: string);
    function  applied_rule_ids_Specified(Index: Integer): boolean;
    procedure Setadditional_data(Index: Integer; const Astring: string);
    function  additional_data_Specified(Index: Integer): boolean;
    procedure Setfree_shipping(Index: Integer; const Astring: string);
    function  free_shipping_Specified(Index: Integer): boolean;
    procedure Setis_qty_decimal(Index: Integer; const Astring: string);
    function  is_qty_decimal_Specified(Index: Integer): boolean;
    procedure Setno_discount(Index: Integer; const Astring: string);
    function  no_discount_Specified(Index: Integer): boolean;
    procedure Setweight(Index: Integer; const ADouble: Double);
    function  weight_Specified(Index: Integer): boolean;
    procedure Setqty(Index: Integer; const ADouble: Double);
    function  qty_Specified(Index: Integer): boolean;
    procedure Setprice(Index: Integer; const ADouble: Double);
    function  price_Specified(Index: Integer): boolean;
    procedure Setbase_price(Index: Integer; const ADouble: Double);
    function  base_price_Specified(Index: Integer): boolean;
    procedure Setcustom_price(Index: Integer; const ADouble: Double);
    function  custom_price_Specified(Index: Integer): boolean;
    procedure Setdiscount_percent(Index: Integer; const ADouble: Double);
    function  discount_percent_Specified(Index: Integer): boolean;
    procedure Setdiscount_amount(Index: Integer; const ADouble: Double);
    function  discount_amount_Specified(Index: Integer): boolean;
    procedure Setbase_discount_amount(Index: Integer; const ADouble: Double);
    function  base_discount_amount_Specified(Index: Integer): boolean;
    procedure Settax_percent(Index: Integer; const ADouble: Double);
    function  tax_percent_Specified(Index: Integer): boolean;
    procedure Settax_amount(Index: Integer; const ADouble: Double);
    function  tax_amount_Specified(Index: Integer): boolean;
    procedure Setbase_tax_amount(Index: Integer; const ADouble: Double);
    function  base_tax_amount_Specified(Index: Integer): boolean;
    procedure Setrow_total(Index: Integer; const ADouble: Double);
    function  row_total_Specified(Index: Integer): boolean;
    procedure Setbase_row_total(Index: Integer; const ADouble: Double);
    function  base_row_total_Specified(Index: Integer): boolean;
    procedure Setrow_total_with_discount(Index: Integer; const ADouble: Double);
    function  row_total_with_discount_Specified(Index: Integer): boolean;
    procedure Setrow_weight(Index: Integer; const ADouble: Double);
    function  row_weight_Specified(Index: Integer): boolean;
    procedure Setproduct_type(Index: Integer; const Astring: string);
    function  product_type_Specified(Index: Integer): boolean;
    procedure Setbase_tax_before_discount(Index: Integer; const ADouble: Double);
    function  base_tax_before_discount_Specified(Index: Integer): boolean;
    procedure Settax_before_discount(Index: Integer; const ADouble: Double);
    function  tax_before_discount_Specified(Index: Integer): boolean;
    procedure Setoriginal_custom_price(Index: Integer; const ADouble: Double);
    function  original_custom_price_Specified(Index: Integer): boolean;
    procedure Setbase_cost(Index: Integer; const ADouble: Double);
    function  base_cost_Specified(Index: Integer): boolean;
    procedure Setprice_incl_tax(Index: Integer; const ADouble: Double);
    function  price_incl_tax_Specified(Index: Integer): boolean;
    procedure Setbase_price_incl_tax(Index: Integer; const ADouble: Double);
    function  base_price_incl_tax_Specified(Index: Integer): boolean;
    procedure Setrow_total_incl_tax(Index: Integer; const ADouble: Double);
    function  row_total_incl_tax_Specified(Index: Integer): boolean;
    procedure Setbase_row_total_incl_tax(Index: Integer; const ADouble: Double);
    function  base_row_total_incl_tax_Specified(Index: Integer): boolean;
    procedure Setgift_message_id(Index: Integer; const Astring: string);
    function  gift_message_id_Specified(Index: Integer): boolean;
    procedure Setgift_message(Index: Integer; const Astring: string);
    function  gift_message_Specified(Index: Integer): boolean;
    procedure Setgift_message_available(Index: Integer; const Astring: string);
    function  gift_message_available_Specified(Index: Integer): boolean;
    procedure Setweee_tax_applied(Index: Integer; const ADouble: Double);
    function  weee_tax_applied_Specified(Index: Integer): boolean;
    procedure Setweee_tax_applied_amount(Index: Integer; const ADouble: Double);
    function  weee_tax_applied_amount_Specified(Index: Integer): boolean;
    procedure Setweee_tax_applied_row_amount(Index: Integer; const ADouble: Double);
    function  weee_tax_applied_row_amount_Specified(Index: Integer): boolean;
    procedure Setbase_weee_tax_applied_amount(Index: Integer; const ADouble: Double);
    function  base_weee_tax_applied_amount_Specified(Index: Integer): boolean;
    procedure Setbase_weee_tax_applied_row_amount(Index: Integer; const ADouble: Double);
    function  base_weee_tax_applied_row_amount_Specified(Index: Integer): boolean;
    procedure Setweee_tax_disposition(Index: Integer; const ADouble: Double);
    function  weee_tax_disposition_Specified(Index: Integer): boolean;
    procedure Setweee_tax_row_disposition(Index: Integer; const ADouble: Double);
    function  weee_tax_row_disposition_Specified(Index: Integer): boolean;
    procedure Setbase_weee_tax_disposition(Index: Integer; const ADouble: Double);
    function  base_weee_tax_disposition_Specified(Index: Integer): boolean;
    procedure Setbase_weee_tax_row_disposition(Index: Integer; const ADouble: Double);
    function  base_weee_tax_row_disposition_Specified(Index: Integer): boolean;
    procedure Settax_class_id(Index: Integer; const Astring: string);
    function  tax_class_id_Specified(Index: Integer): boolean;
  published
    property item_id:                          string   Index (IS_OPTN) read Fitem_id write Setitem_id stored item_id_Specified;
    property created_at:                       string   Index (IS_OPTN) read Fcreated_at write Setcreated_at stored created_at_Specified;
    property updated_at:                       string   Index (IS_OPTN) read Fupdated_at write Setupdated_at stored updated_at_Specified;
    property product_id:                       string   Index (IS_OPTN) read Fproduct_id write Setproduct_id stored product_id_Specified;
    property store_id:                         string   Index (IS_OPTN) read Fstore_id write Setstore_id stored store_id_Specified;
    property parent_item_id:                   string   Index (IS_OPTN) read Fparent_item_id write Setparent_item_id stored parent_item_id_Specified;
    property is_virtual:                       Integer  Index (IS_OPTN) read Fis_virtual write Setis_virtual stored is_virtual_Specified;
    property sku:                              string   Index (IS_OPTN) read Fsku write Setsku stored sku_Specified;
    property name_:                            string   Index (IS_OPTN) read Fname_ write Setname_ stored name__Specified;
    property description:                      string   Index (IS_OPTN) read Fdescription write Setdescription stored description_Specified;
    property applied_rule_ids:                 string   Index (IS_OPTN) read Fapplied_rule_ids write Setapplied_rule_ids stored applied_rule_ids_Specified;
    property additional_data:                  string   Index (IS_OPTN) read Fadditional_data write Setadditional_data stored additional_data_Specified;
    property free_shipping:                    string   Index (IS_OPTN) read Ffree_shipping write Setfree_shipping stored free_shipping_Specified;
    property is_qty_decimal:                   string   Index (IS_OPTN) read Fis_qty_decimal write Setis_qty_decimal stored is_qty_decimal_Specified;
    property no_discount:                      string   Index (IS_OPTN) read Fno_discount write Setno_discount stored no_discount_Specified;
    property weight:                           Double   Index (IS_OPTN) read Fweight write Setweight stored weight_Specified;
    property qty:                              Double   Index (IS_OPTN) read Fqty write Setqty stored qty_Specified;
    property price:                            Double   Index (IS_OPTN) read Fprice write Setprice stored price_Specified;
    property base_price:                       Double   Index (IS_OPTN) read Fbase_price write Setbase_price stored base_price_Specified;
    property custom_price:                     Double   Index (IS_OPTN) read Fcustom_price write Setcustom_price stored custom_price_Specified;
    property discount_percent:                 Double   Index (IS_OPTN) read Fdiscount_percent write Setdiscount_percent stored discount_percent_Specified;
    property discount_amount:                  Double   Index (IS_OPTN) read Fdiscount_amount write Setdiscount_amount stored discount_amount_Specified;
    property base_discount_amount:             Double   Index (IS_OPTN) read Fbase_discount_amount write Setbase_discount_amount stored base_discount_amount_Specified;
    property tax_percent:                      Double   Index (IS_OPTN) read Ftax_percent write Settax_percent stored tax_percent_Specified;
    property tax_amount:                       Double   Index (IS_OPTN) read Ftax_amount write Settax_amount stored tax_amount_Specified;
    property base_tax_amount:                  Double   Index (IS_OPTN) read Fbase_tax_amount write Setbase_tax_amount stored base_tax_amount_Specified;
    property row_total:                        Double   Index (IS_OPTN) read Frow_total write Setrow_total stored row_total_Specified;
    property base_row_total:                   Double   Index (IS_OPTN) read Fbase_row_total write Setbase_row_total stored base_row_total_Specified;
    property row_total_with_discount:          Double   Index (IS_OPTN) read Frow_total_with_discount write Setrow_total_with_discount stored row_total_with_discount_Specified;
    property row_weight:                       Double   Index (IS_OPTN) read Frow_weight write Setrow_weight stored row_weight_Specified;
    property product_type:                     string   Index (IS_OPTN) read Fproduct_type write Setproduct_type stored product_type_Specified;
    property base_tax_before_discount:         Double   Index (IS_OPTN) read Fbase_tax_before_discount write Setbase_tax_before_discount stored base_tax_before_discount_Specified;
    property tax_before_discount:              Double   Index (IS_OPTN) read Ftax_before_discount write Settax_before_discount stored tax_before_discount_Specified;
    property original_custom_price:            Double   Index (IS_OPTN) read Foriginal_custom_price write Setoriginal_custom_price stored original_custom_price_Specified;
    property base_cost:                        Double   Index (IS_OPTN) read Fbase_cost write Setbase_cost stored base_cost_Specified;
    property price_incl_tax:                   Double   Index (IS_OPTN) read Fprice_incl_tax write Setprice_incl_tax stored price_incl_tax_Specified;
    property base_price_incl_tax:              Double   Index (IS_OPTN) read Fbase_price_incl_tax write Setbase_price_incl_tax stored base_price_incl_tax_Specified;
    property row_total_incl_tax:               Double   Index (IS_OPTN) read Frow_total_incl_tax write Setrow_total_incl_tax stored row_total_incl_tax_Specified;
    property base_row_total_incl_tax:          Double   Index (IS_OPTN) read Fbase_row_total_incl_tax write Setbase_row_total_incl_tax stored base_row_total_incl_tax_Specified;
    property gift_message_id:                  string   Index (IS_OPTN) read Fgift_message_id write Setgift_message_id stored gift_message_id_Specified;
    property gift_message:                     string   Index (IS_OPTN) read Fgift_message write Setgift_message stored gift_message_Specified;
    property gift_message_available:           string   Index (IS_OPTN) read Fgift_message_available write Setgift_message_available stored gift_message_available_Specified;
    property weee_tax_applied:                 Double   Index (IS_OPTN) read Fweee_tax_applied write Setweee_tax_applied stored weee_tax_applied_Specified;
    property weee_tax_applied_amount:          Double   Index (IS_OPTN) read Fweee_tax_applied_amount write Setweee_tax_applied_amount stored weee_tax_applied_amount_Specified;
    property weee_tax_applied_row_amount:      Double   Index (IS_OPTN) read Fweee_tax_applied_row_amount write Setweee_tax_applied_row_amount stored weee_tax_applied_row_amount_Specified;
    property base_weee_tax_applied_amount:     Double   Index (IS_OPTN) read Fbase_weee_tax_applied_amount write Setbase_weee_tax_applied_amount stored base_weee_tax_applied_amount_Specified;
    property base_weee_tax_applied_row_amount: Double   Index (IS_OPTN) read Fbase_weee_tax_applied_row_amount write Setbase_weee_tax_applied_row_amount stored base_weee_tax_applied_row_amount_Specified;
    property weee_tax_disposition:             Double   Index (IS_OPTN) read Fweee_tax_disposition write Setweee_tax_disposition stored weee_tax_disposition_Specified;
    property weee_tax_row_disposition:         Double   Index (IS_OPTN) read Fweee_tax_row_disposition write Setweee_tax_row_disposition stored weee_tax_row_disposition_Specified;
    property base_weee_tax_disposition:        Double   Index (IS_OPTN) read Fbase_weee_tax_disposition write Setbase_weee_tax_disposition stored base_weee_tax_disposition_Specified;
    property base_weee_tax_row_disposition:    Double   Index (IS_OPTN) read Fbase_weee_tax_row_disposition write Setbase_weee_tax_row_disposition stored base_weee_tax_row_disposition_Specified;
    property tax_class_id:                     string   Index (IS_OPTN) read Ftax_class_id write Settax_class_id stored tax_class_id_Specified;
  end;



  // ************************************************************************ //
  // XML       : shoppingCartTotalsEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  shoppingCartTotalsEntity = class(TRemotable)
  private
    Ftitle: string;
    Ftitle_Specified: boolean;
    Famount: Double;
    Famount_Specified: boolean;
    procedure Settitle(Index: Integer; const Astring: string);
    function  title_Specified(Index: Integer): boolean;
    procedure Setamount(Index: Integer; const ADouble: Double);
    function  amount_Specified(Index: Integer): boolean;
  published
    property title:  string  Index (IS_OPTN) read Ftitle write Settitle stored title_Specified;
    property amount: Double  Index (IS_OPTN) read Famount write Setamount stored amount_Specified;
  end;



  // ************************************************************************ //
  // XML       : shoppingCartInfoEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  shoppingCartInfoEntity = class(TRemotable)
  private
    Fstore_id: string;
    Fstore_id_Specified: boolean;
    Fcreated_at: string;
    Fcreated_at_Specified: boolean;
    Fupdated_at: string;
    Fupdated_at_Specified: boolean;
    Fconverted_at: string;
    Fconverted_at_Specified: boolean;
    Fquote_id: Integer;
    Fquote_id_Specified: boolean;
    Fis_active: Integer;
    Fis_active_Specified: boolean;
    Fis_virtual: Integer;
    Fis_virtual_Specified: boolean;
    Fis_multi_shipping: Integer;
    Fis_multi_shipping_Specified: boolean;
    Fitems_count: Double;
    Fitems_count_Specified: boolean;
    Fitems_qty: Double;
    Fitems_qty_Specified: boolean;
    Forig_order_id: string;
    Forig_order_id_Specified: boolean;
    Fstore_to_base_rate: string;
    Fstore_to_base_rate_Specified: boolean;
    Fstore_to_quote_rate: string;
    Fstore_to_quote_rate_Specified: boolean;
    Fbase_currency_code: string;
    Fbase_currency_code_Specified: boolean;
    Fstore_currency_code: string;
    Fstore_currency_code_Specified: boolean;
    Fquote_currency_code: string;
    Fquote_currency_code_Specified: boolean;
    Fgrand_total: string;
    Fgrand_total_Specified: boolean;
    Fbase_grand_total: string;
    Fbase_grand_total_Specified: boolean;
    Fcheckout_method: string;
    Fcheckout_method_Specified: boolean;
    Fcustomer_id: string;
    Fcustomer_id_Specified: boolean;
    Fcustomer_tax_class_id: string;
    Fcustomer_tax_class_id_Specified: boolean;
    Fcustomer_group_id: Integer;
    Fcustomer_group_id_Specified: boolean;
    Fcustomer_email: string;
    Fcustomer_email_Specified: boolean;
    Fcustomer_prefix: string;
    Fcustomer_prefix_Specified: boolean;
    Fcustomer_firstname: string;
    Fcustomer_firstname_Specified: boolean;
    Fcustomer_middlename: string;
    Fcustomer_middlename_Specified: boolean;
    Fcustomer_lastname: string;
    Fcustomer_lastname_Specified: boolean;
    Fcustomer_suffix: string;
    Fcustomer_suffix_Specified: boolean;
    Fcustomer_note: string;
    Fcustomer_note_Specified: boolean;
    Fcustomer_note_notify: string;
    Fcustomer_note_notify_Specified: boolean;
    Fcustomer_is_guest: string;
    Fcustomer_is_guest_Specified: boolean;
    Fapplied_rule_ids: string;
    Fapplied_rule_ids_Specified: boolean;
    Freserved_order_id: string;
    Freserved_order_id_Specified: boolean;
    Fpassword_hash: string;
    Fpassword_hash_Specified: boolean;
    Fcoupon_code: string;
    Fcoupon_code_Specified: boolean;
    Fglobal_currency_code: string;
    Fglobal_currency_code_Specified: boolean;
    Fbase_to_global_rate: Double;
    Fbase_to_global_rate_Specified: boolean;
    Fbase_to_quote_rate: Double;
    Fbase_to_quote_rate_Specified: boolean;
    Fcustomer_taxvat: string;
    Fcustomer_taxvat_Specified: boolean;
    Fcustomer_gender: string;
    Fcustomer_gender_Specified: boolean;
    Fsubtotal: Double;
    Fsubtotal_Specified: boolean;
    Fbase_subtotal: Double;
    Fbase_subtotal_Specified: boolean;
    Fsubtotal_with_discount: Double;
    Fsubtotal_with_discount_Specified: boolean;
    Fbase_subtotal_with_discount: Double;
    Fbase_subtotal_with_discount_Specified: boolean;
    Fext_shipping_info: string;
    Fext_shipping_info_Specified: boolean;
    Fgift_message_id: string;
    Fgift_message_id_Specified: boolean;
    Fgift_message: string;
    Fgift_message_Specified: boolean;
    Fcustomer_balance_amount_used: Double;
    Fcustomer_balance_amount_used_Specified: boolean;
    Fbase_customer_balance_amount_used: Double;
    Fbase_customer_balance_amount_used_Specified: boolean;
    Fuse_customer_balance: string;
    Fuse_customer_balance_Specified: boolean;
    Fgift_cards_amount: string;
    Fgift_cards_amount_Specified: boolean;
    Fbase_gift_cards_amount: string;
    Fbase_gift_cards_amount_Specified: boolean;
    Fgift_cards_amount_used: string;
    Fgift_cards_amount_used_Specified: boolean;
    Fuse_reward_points: string;
    Fuse_reward_points_Specified: boolean;
    Freward_points_balance: string;
    Freward_points_balance_Specified: boolean;
    Fbase_reward_currency_amount: string;
    Fbase_reward_currency_amount_Specified: boolean;
    Freward_currency_amount: string;
    Freward_currency_amount_Specified: boolean;
    Fshipping_address: shoppingCartAddressEntity;
    Fshipping_address_Specified: boolean;
    Fbilling_address: shoppingCartAddressEntity;
    Fbilling_address_Specified: boolean;
    Fitems: shoppingCartItemEntityArray;
    Fitems_Specified: boolean;
    Fpayment: shoppingCartPaymentEntity;
    Fpayment_Specified: boolean;
    procedure Setstore_id(Index: Integer; const Astring: string);
    function  store_id_Specified(Index: Integer): boolean;
    procedure Setcreated_at(Index: Integer; const Astring: string);
    function  created_at_Specified(Index: Integer): boolean;
    procedure Setupdated_at(Index: Integer; const Astring: string);
    function  updated_at_Specified(Index: Integer): boolean;
    procedure Setconverted_at(Index: Integer; const Astring: string);
    function  converted_at_Specified(Index: Integer): boolean;
    procedure Setquote_id(Index: Integer; const AInteger: Integer);
    function  quote_id_Specified(Index: Integer): boolean;
    procedure Setis_active(Index: Integer; const AInteger: Integer);
    function  is_active_Specified(Index: Integer): boolean;
    procedure Setis_virtual(Index: Integer; const AInteger: Integer);
    function  is_virtual_Specified(Index: Integer): boolean;
    procedure Setis_multi_shipping(Index: Integer; const AInteger: Integer);
    function  is_multi_shipping_Specified(Index: Integer): boolean;
    procedure Setitems_count(Index: Integer; const ADouble: Double);
    function  items_count_Specified(Index: Integer): boolean;
    procedure Setitems_qty(Index: Integer; const ADouble: Double);
    function  items_qty_Specified(Index: Integer): boolean;
    procedure Setorig_order_id(Index: Integer; const Astring: string);
    function  orig_order_id_Specified(Index: Integer): boolean;
    procedure Setstore_to_base_rate(Index: Integer; const Astring: string);
    function  store_to_base_rate_Specified(Index: Integer): boolean;
    procedure Setstore_to_quote_rate(Index: Integer; const Astring: string);
    function  store_to_quote_rate_Specified(Index: Integer): boolean;
    procedure Setbase_currency_code(Index: Integer; const Astring: string);
    function  base_currency_code_Specified(Index: Integer): boolean;
    procedure Setstore_currency_code(Index: Integer; const Astring: string);
    function  store_currency_code_Specified(Index: Integer): boolean;
    procedure Setquote_currency_code(Index: Integer; const Astring: string);
    function  quote_currency_code_Specified(Index: Integer): boolean;
    procedure Setgrand_total(Index: Integer; const Astring: string);
    function  grand_total_Specified(Index: Integer): boolean;
    procedure Setbase_grand_total(Index: Integer; const Astring: string);
    function  base_grand_total_Specified(Index: Integer): boolean;
    procedure Setcheckout_method(Index: Integer; const Astring: string);
    function  checkout_method_Specified(Index: Integer): boolean;
    procedure Setcustomer_id(Index: Integer; const Astring: string);
    function  customer_id_Specified(Index: Integer): boolean;
    procedure Setcustomer_tax_class_id(Index: Integer; const Astring: string);
    function  customer_tax_class_id_Specified(Index: Integer): boolean;
    procedure Setcustomer_group_id(Index: Integer; const AInteger: Integer);
    function  customer_group_id_Specified(Index: Integer): boolean;
    procedure Setcustomer_email(Index: Integer; const Astring: string);
    function  customer_email_Specified(Index: Integer): boolean;
    procedure Setcustomer_prefix(Index: Integer; const Astring: string);
    function  customer_prefix_Specified(Index: Integer): boolean;
    procedure Setcustomer_firstname(Index: Integer; const Astring: string);
    function  customer_firstname_Specified(Index: Integer): boolean;
    procedure Setcustomer_middlename(Index: Integer; const Astring: string);
    function  customer_middlename_Specified(Index: Integer): boolean;
    procedure Setcustomer_lastname(Index: Integer; const Astring: string);
    function  customer_lastname_Specified(Index: Integer): boolean;
    procedure Setcustomer_suffix(Index: Integer; const Astring: string);
    function  customer_suffix_Specified(Index: Integer): boolean;
    procedure Setcustomer_note(Index: Integer; const Astring: string);
    function  customer_note_Specified(Index: Integer): boolean;
    procedure Setcustomer_note_notify(Index: Integer; const Astring: string);
    function  customer_note_notify_Specified(Index: Integer): boolean;
    procedure Setcustomer_is_guest(Index: Integer; const Astring: string);
    function  customer_is_guest_Specified(Index: Integer): boolean;
    procedure Setapplied_rule_ids(Index: Integer; const Astring: string);
    function  applied_rule_ids_Specified(Index: Integer): boolean;
    procedure Setreserved_order_id(Index: Integer; const Astring: string);
    function  reserved_order_id_Specified(Index: Integer): boolean;
    procedure Setpassword_hash(Index: Integer; const Astring: string);
    function  password_hash_Specified(Index: Integer): boolean;
    procedure Setcoupon_code(Index: Integer; const Astring: string);
    function  coupon_code_Specified(Index: Integer): boolean;
    procedure Setglobal_currency_code(Index: Integer; const Astring: string);
    function  global_currency_code_Specified(Index: Integer): boolean;
    procedure Setbase_to_global_rate(Index: Integer; const ADouble: Double);
    function  base_to_global_rate_Specified(Index: Integer): boolean;
    procedure Setbase_to_quote_rate(Index: Integer; const ADouble: Double);
    function  base_to_quote_rate_Specified(Index: Integer): boolean;
    procedure Setcustomer_taxvat(Index: Integer; const Astring: string);
    function  customer_taxvat_Specified(Index: Integer): boolean;
    procedure Setcustomer_gender(Index: Integer; const Astring: string);
    function  customer_gender_Specified(Index: Integer): boolean;
    procedure Setsubtotal(Index: Integer; const ADouble: Double);
    function  subtotal_Specified(Index: Integer): boolean;
    procedure Setbase_subtotal(Index: Integer; const ADouble: Double);
    function  base_subtotal_Specified(Index: Integer): boolean;
    procedure Setsubtotal_with_discount(Index: Integer; const ADouble: Double);
    function  subtotal_with_discount_Specified(Index: Integer): boolean;
    procedure Setbase_subtotal_with_discount(Index: Integer; const ADouble: Double);
    function  base_subtotal_with_discount_Specified(Index: Integer): boolean;
    procedure Setext_shipping_info(Index: Integer; const Astring: string);
    function  ext_shipping_info_Specified(Index: Integer): boolean;
    procedure Setgift_message_id(Index: Integer; const Astring: string);
    function  gift_message_id_Specified(Index: Integer): boolean;
    procedure Setgift_message(Index: Integer; const Astring: string);
    function  gift_message_Specified(Index: Integer): boolean;
    procedure Setcustomer_balance_amount_used(Index: Integer; const ADouble: Double);
    function  customer_balance_amount_used_Specified(Index: Integer): boolean;
    procedure Setbase_customer_balance_amount_used(Index: Integer; const ADouble: Double);
    function  base_customer_balance_amount_used_Specified(Index: Integer): boolean;
    procedure Setuse_customer_balance(Index: Integer; const Astring: string);
    function  use_customer_balance_Specified(Index: Integer): boolean;
    procedure Setgift_cards_amount(Index: Integer; const Astring: string);
    function  gift_cards_amount_Specified(Index: Integer): boolean;
    procedure Setbase_gift_cards_amount(Index: Integer; const Astring: string);
    function  base_gift_cards_amount_Specified(Index: Integer): boolean;
    procedure Setgift_cards_amount_used(Index: Integer; const Astring: string);
    function  gift_cards_amount_used_Specified(Index: Integer): boolean;
    procedure Setuse_reward_points(Index: Integer; const Astring: string);
    function  use_reward_points_Specified(Index: Integer): boolean;
    procedure Setreward_points_balance(Index: Integer; const Astring: string);
    function  reward_points_balance_Specified(Index: Integer): boolean;
    procedure Setbase_reward_currency_amount(Index: Integer; const Astring: string);
    function  base_reward_currency_amount_Specified(Index: Integer): boolean;
    procedure Setreward_currency_amount(Index: Integer; const Astring: string);
    function  reward_currency_amount_Specified(Index: Integer): boolean;
    procedure Setshipping_address(Index: Integer; const AshoppingCartAddressEntity: shoppingCartAddressEntity);
    function  shipping_address_Specified(Index: Integer): boolean;
    procedure Setbilling_address(Index: Integer; const AshoppingCartAddressEntity: shoppingCartAddressEntity);
    function  billing_address_Specified(Index: Integer): boolean;
    procedure Setitems(Index: Integer; const AshoppingCartItemEntityArray: shoppingCartItemEntityArray);
    function  items_Specified(Index: Integer): boolean;
    procedure Setpayment(Index: Integer; const AshoppingCartPaymentEntity: shoppingCartPaymentEntity);
    function  payment_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property store_id:                          string                       Index (IS_OPTN) read Fstore_id write Setstore_id stored store_id_Specified;
    property created_at:                        string                       Index (IS_OPTN) read Fcreated_at write Setcreated_at stored created_at_Specified;
    property updated_at:                        string                       Index (IS_OPTN) read Fupdated_at write Setupdated_at stored updated_at_Specified;
    property converted_at:                      string                       Index (IS_OPTN) read Fconverted_at write Setconverted_at stored converted_at_Specified;
    property quote_id:                          Integer                      Index (IS_OPTN) read Fquote_id write Setquote_id stored quote_id_Specified;
    property is_active:                         Integer                      Index (IS_OPTN) read Fis_active write Setis_active stored is_active_Specified;
    property is_virtual:                        Integer                      Index (IS_OPTN) read Fis_virtual write Setis_virtual stored is_virtual_Specified;
    property is_multi_shipping:                 Integer                      Index (IS_OPTN) read Fis_multi_shipping write Setis_multi_shipping stored is_multi_shipping_Specified;
    property items_count:                       Double                       Index (IS_OPTN) read Fitems_count write Setitems_count stored items_count_Specified;
    property items_qty:                         Double                       Index (IS_OPTN) read Fitems_qty write Setitems_qty stored items_qty_Specified;
    property orig_order_id:                     string                       Index (IS_OPTN) read Forig_order_id write Setorig_order_id stored orig_order_id_Specified;
    property store_to_base_rate:                string                       Index (IS_OPTN) read Fstore_to_base_rate write Setstore_to_base_rate stored store_to_base_rate_Specified;
    property store_to_quote_rate:               string                       Index (IS_OPTN) read Fstore_to_quote_rate write Setstore_to_quote_rate stored store_to_quote_rate_Specified;
    property base_currency_code:                string                       Index (IS_OPTN) read Fbase_currency_code write Setbase_currency_code stored base_currency_code_Specified;
    property store_currency_code:               string                       Index (IS_OPTN) read Fstore_currency_code write Setstore_currency_code stored store_currency_code_Specified;
    property quote_currency_code:               string                       Index (IS_OPTN) read Fquote_currency_code write Setquote_currency_code stored quote_currency_code_Specified;
    property grand_total:                       string                       Index (IS_OPTN) read Fgrand_total write Setgrand_total stored grand_total_Specified;
    property base_grand_total:                  string                       Index (IS_OPTN) read Fbase_grand_total write Setbase_grand_total stored base_grand_total_Specified;
    property checkout_method:                   string                       Index (IS_OPTN) read Fcheckout_method write Setcheckout_method stored checkout_method_Specified;
    property customer_id:                       string                       Index (IS_OPTN) read Fcustomer_id write Setcustomer_id stored customer_id_Specified;
    property customer_tax_class_id:             string                       Index (IS_OPTN) read Fcustomer_tax_class_id write Setcustomer_tax_class_id stored customer_tax_class_id_Specified;
    property customer_group_id:                 Integer                      Index (IS_OPTN) read Fcustomer_group_id write Setcustomer_group_id stored customer_group_id_Specified;
    property customer_email:                    string                       Index (IS_OPTN) read Fcustomer_email write Setcustomer_email stored customer_email_Specified;
    property customer_prefix:                   string                       Index (IS_OPTN) read Fcustomer_prefix write Setcustomer_prefix stored customer_prefix_Specified;
    property customer_firstname:                string                       Index (IS_OPTN) read Fcustomer_firstname write Setcustomer_firstname stored customer_firstname_Specified;
    property customer_middlename:               string                       Index (IS_OPTN) read Fcustomer_middlename write Setcustomer_middlename stored customer_middlename_Specified;
    property customer_lastname:                 string                       Index (IS_OPTN) read Fcustomer_lastname write Setcustomer_lastname stored customer_lastname_Specified;
    property customer_suffix:                   string                       Index (IS_OPTN) read Fcustomer_suffix write Setcustomer_suffix stored customer_suffix_Specified;
    property customer_note:                     string                       Index (IS_OPTN) read Fcustomer_note write Setcustomer_note stored customer_note_Specified;
    property customer_note_notify:              string                       Index (IS_OPTN) read Fcustomer_note_notify write Setcustomer_note_notify stored customer_note_notify_Specified;
    property customer_is_guest:                 string                       Index (IS_OPTN) read Fcustomer_is_guest write Setcustomer_is_guest stored customer_is_guest_Specified;
    property applied_rule_ids:                  string                       Index (IS_OPTN) read Fapplied_rule_ids write Setapplied_rule_ids stored applied_rule_ids_Specified;
    property reserved_order_id:                 string                       Index (IS_OPTN) read Freserved_order_id write Setreserved_order_id stored reserved_order_id_Specified;
    property password_hash:                     string                       Index (IS_OPTN) read Fpassword_hash write Setpassword_hash stored password_hash_Specified;
    property coupon_code:                       string                       Index (IS_OPTN) read Fcoupon_code write Setcoupon_code stored coupon_code_Specified;
    property global_currency_code:              string                       Index (IS_OPTN) read Fglobal_currency_code write Setglobal_currency_code stored global_currency_code_Specified;
    property base_to_global_rate:               Double                       Index (IS_OPTN) read Fbase_to_global_rate write Setbase_to_global_rate stored base_to_global_rate_Specified;
    property base_to_quote_rate:                Double                       Index (IS_OPTN) read Fbase_to_quote_rate write Setbase_to_quote_rate stored base_to_quote_rate_Specified;
    property customer_taxvat:                   string                       Index (IS_OPTN) read Fcustomer_taxvat write Setcustomer_taxvat stored customer_taxvat_Specified;
    property customer_gender:                   string                       Index (IS_OPTN) read Fcustomer_gender write Setcustomer_gender stored customer_gender_Specified;
    property subtotal:                          Double                       Index (IS_OPTN) read Fsubtotal write Setsubtotal stored subtotal_Specified;
    property base_subtotal:                     Double                       Index (IS_OPTN) read Fbase_subtotal write Setbase_subtotal stored base_subtotal_Specified;
    property subtotal_with_discount:            Double                       Index (IS_OPTN) read Fsubtotal_with_discount write Setsubtotal_with_discount stored subtotal_with_discount_Specified;
    property base_subtotal_with_discount:       Double                       Index (IS_OPTN) read Fbase_subtotal_with_discount write Setbase_subtotal_with_discount stored base_subtotal_with_discount_Specified;
    property ext_shipping_info:                 string                       Index (IS_OPTN) read Fext_shipping_info write Setext_shipping_info stored ext_shipping_info_Specified;
    property gift_message_id:                   string                       Index (IS_OPTN) read Fgift_message_id write Setgift_message_id stored gift_message_id_Specified;
    property gift_message:                      string                       Index (IS_OPTN) read Fgift_message write Setgift_message stored gift_message_Specified;
    property customer_balance_amount_used:      Double                       Index (IS_OPTN) read Fcustomer_balance_amount_used write Setcustomer_balance_amount_used stored customer_balance_amount_used_Specified;
    property base_customer_balance_amount_used: Double                       Index (IS_OPTN) read Fbase_customer_balance_amount_used write Setbase_customer_balance_amount_used stored base_customer_balance_amount_used_Specified;
    property use_customer_balance:              string                       Index (IS_OPTN) read Fuse_customer_balance write Setuse_customer_balance stored use_customer_balance_Specified;
    property gift_cards_amount:                 string                       Index (IS_OPTN) read Fgift_cards_amount write Setgift_cards_amount stored gift_cards_amount_Specified;
    property base_gift_cards_amount:            string                       Index (IS_OPTN) read Fbase_gift_cards_amount write Setbase_gift_cards_amount stored base_gift_cards_amount_Specified;
    property gift_cards_amount_used:            string                       Index (IS_OPTN) read Fgift_cards_amount_used write Setgift_cards_amount_used stored gift_cards_amount_used_Specified;
    property use_reward_points:                 string                       Index (IS_OPTN) read Fuse_reward_points write Setuse_reward_points stored use_reward_points_Specified;
    property reward_points_balance:             string                       Index (IS_OPTN) read Freward_points_balance write Setreward_points_balance stored reward_points_balance_Specified;
    property base_reward_currency_amount:       string                       Index (IS_OPTN) read Fbase_reward_currency_amount write Setbase_reward_currency_amount stored base_reward_currency_amount_Specified;
    property reward_currency_amount:            string                       Index (IS_OPTN) read Freward_currency_amount write Setreward_currency_amount stored reward_currency_amount_Specified;
    property shipping_address:                  shoppingCartAddressEntity    Index (IS_OPTN) read Fshipping_address write Setshipping_address stored shipping_address_Specified;
    property billing_address:                   shoppingCartAddressEntity    Index (IS_OPTN) read Fbilling_address write Setbilling_address stored billing_address_Specified;
    property items:                             shoppingCartItemEntityArray  Index (IS_OPTN) read Fitems write Setitems stored items_Specified;
    property payment:                           shoppingCartPaymentEntity    Index (IS_OPTN) read Fpayment write Setpayment stored payment_Specified;
  end;



  // ************************************************************************ //
  // XML       : orderItemIdQty, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  orderItemIdQty = class(TRemotable)
  private
    Forder_item_id: Integer;
    Fqty: Double;
  published
    property order_item_id: Integer  read Forder_item_id write Forder_item_id;
    property qty:           Double   read Fqty write Fqty;
  end;

  associativeArray = array of associativeEntity;   { "urn:Magento"[GblCplx] }


  // ************************************************************************ //
  // XML       : shoppingCartPaymentMethodResponseEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  shoppingCartPaymentMethodResponseEntity = class(TRemotable)
  private
    Fcode: string;
    Ftitle: string;
    Fcc_types: associativeArray;
  public
    destructor Destroy; override;
  published
    property code:     string            read Fcode write Fcode;
    property title:    string            read Ftitle write Ftitle;
    property cc_types: associativeArray  read Fcc_types write Fcc_types;
  end;



  // ************************************************************************ //
  // XML       : catalogProductTagInfoEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogProductTagInfoEntity = class(TRemotable)
  private
    Fname_: string;
    Fstatus: string;
    Fbase_popularity: string;
    Fproducts: associativeArray;
  public
    destructor Destroy; override;
  published
    property name_:           string            read Fname_ write Fname_;
    property status:          string            read Fstatus write Fstatus;
    property base_popularity: string            read Fbase_popularity write Fbase_popularity;
    property products:        associativeArray  read Fproducts write Fproducts;
  end;

  ArrayOfString = array of string;              { "urn:Magento"[GblCplx] }


  // ************************************************************************ //
  // XML       : associativeMultiEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  associativeMultiEntity = class(TRemotable)
  private
    Fkey: string;
    Fvalue: ArrayOfString;
  published
    property key:   string         read Fkey write Fkey;
    property value: ArrayOfString  read Fvalue write Fvalue;
  end;



  // ************************************************************************ //
  // XML       : customerAddressEntityCreate, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  customerAddressEntityCreate = class(TRemotable)
  private
    Fcity: string;
    Fcity_Specified: boolean;
    Fcompany: string;
    Fcompany_Specified: boolean;
    Fcountry_id: string;
    Fcountry_id_Specified: boolean;
    Ffax: string;
    Ffax_Specified: boolean;
    Ffirstname: string;
    Ffirstname_Specified: boolean;
    Flastname: string;
    Flastname_Specified: boolean;
    Fmiddlename: string;
    Fmiddlename_Specified: boolean;
    Fpostcode: string;
    Fpostcode_Specified: boolean;
    Fprefix: string;
    Fprefix_Specified: boolean;
    Fregion_id: Integer;
    Fregion_id_Specified: boolean;
    Fregion: string;
    Fregion_Specified: boolean;
    Fstreet: ArrayOfString;
    Fstreet_Specified: boolean;
    Fsuffix: string;
    Fsuffix_Specified: boolean;
    Ftelephone: string;
    Ftelephone_Specified: boolean;
    Fis_default_billing: Boolean;
    Fis_default_billing_Specified: boolean;
    Fis_default_shipping: Boolean;
    Fis_default_shipping_Specified: boolean;
    procedure Setcity(Index: Integer; const Astring: string);
    function  city_Specified(Index: Integer): boolean;
    procedure Setcompany(Index: Integer; const Astring: string);
    function  company_Specified(Index: Integer): boolean;
    procedure Setcountry_id(Index: Integer; const Astring: string);
    function  country_id_Specified(Index: Integer): boolean;
    procedure Setfax(Index: Integer; const Astring: string);
    function  fax_Specified(Index: Integer): boolean;
    procedure Setfirstname(Index: Integer; const Astring: string);
    function  firstname_Specified(Index: Integer): boolean;
    procedure Setlastname(Index: Integer; const Astring: string);
    function  lastname_Specified(Index: Integer): boolean;
    procedure Setmiddlename(Index: Integer; const Astring: string);
    function  middlename_Specified(Index: Integer): boolean;
    procedure Setpostcode(Index: Integer; const Astring: string);
    function  postcode_Specified(Index: Integer): boolean;
    procedure Setprefix(Index: Integer; const Astring: string);
    function  prefix_Specified(Index: Integer): boolean;
    procedure Setregion_id(Index: Integer; const AInteger: Integer);
    function  region_id_Specified(Index: Integer): boolean;
    procedure Setregion(Index: Integer; const Astring: string);
    function  region_Specified(Index: Integer): boolean;
    procedure Setstreet(Index: Integer; const AArrayOfString: ArrayOfString);
    function  street_Specified(Index: Integer): boolean;
    procedure Setsuffix(Index: Integer; const Astring: string);
    function  suffix_Specified(Index: Integer): boolean;
    procedure Settelephone(Index: Integer; const Astring: string);
    function  telephone_Specified(Index: Integer): boolean;
    procedure Setis_default_billing(Index: Integer; const ABoolean: Boolean);
    function  is_default_billing_Specified(Index: Integer): boolean;
    procedure Setis_default_shipping(Index: Integer; const ABoolean: Boolean);
    function  is_default_shipping_Specified(Index: Integer): boolean;
  published
    property city:                string         Index (IS_OPTN) read Fcity write Setcity stored city_Specified;
    property company:             string         Index (IS_OPTN) read Fcompany write Setcompany stored company_Specified;
    property country_id:          string         Index (IS_OPTN) read Fcountry_id write Setcountry_id stored country_id_Specified;
    property fax:                 string         Index (IS_OPTN) read Ffax write Setfax stored fax_Specified;
    property firstname:           string         Index (IS_OPTN) read Ffirstname write Setfirstname stored firstname_Specified;
    property lastname:            string         Index (IS_OPTN) read Flastname write Setlastname stored lastname_Specified;
    property middlename:          string         Index (IS_OPTN) read Fmiddlename write Setmiddlename stored middlename_Specified;
    property postcode:            string         Index (IS_OPTN) read Fpostcode write Setpostcode stored postcode_Specified;
    property prefix:              string         Index (IS_OPTN) read Fprefix write Setprefix stored prefix_Specified;
    property region_id:           Integer        Index (IS_OPTN) read Fregion_id write Setregion_id stored region_id_Specified;
    property region:              string         Index (IS_OPTN) read Fregion write Setregion stored region_Specified;
    property street:              ArrayOfString  Index (IS_OPTN) read Fstreet write Setstreet stored street_Specified;
    property suffix:              string         Index (IS_OPTN) read Fsuffix write Setsuffix stored suffix_Specified;
    property telephone:           string         Index (IS_OPTN) read Ftelephone write Settelephone stored telephone_Specified;
    property is_default_billing:  Boolean        Index (IS_OPTN) read Fis_default_billing write Setis_default_billing stored is_default_billing_Specified;
    property is_default_shipping: Boolean        Index (IS_OPTN) read Fis_default_shipping write Setis_default_shipping stored is_default_shipping_Specified;
  end;



  // ************************************************************************ //
  // XML       : apiEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  apiEntity = class(TRemotable)
  private
    Ftitle: string;
    Fname_: string;
    Faliases: ArrayOfString;
    Fmethods: ArrayOfApiMethods;
  public
    destructor Destroy; override;
  published
    property title:   string             read Ftitle write Ftitle;
    property name_:   string             read Fname_ write Fname_;
    property aliases: ArrayOfString      read Faliases write Faliases;
    property methods: ArrayOfApiMethods  read Fmethods write Fmethods;
  end;



  // ************************************************************************ //
  // XML       : apiMethodEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  apiMethodEntity = class(TRemotable)
  private
    Ftitle: string;
    Fpath: string;
    Fname_: string;
    Faliases: ArrayOfString;
  published
    property title:   string         read Ftitle write Ftitle;
    property path:    string         read Fpath write Fpath;
    property name_:   string         read Fname_ write Fname_;
    property aliases: ArrayOfString  read Faliases write Faliases;
  end;



  // ************************************************************************ //
  // XML       : shoppingCartProductEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  shoppingCartProductEntity = class(TRemotable)
  private
    Fproduct_id: string;
    Fproduct_id_Specified: boolean;
    Fsku: string;
    Fsku_Specified: boolean;
    Fqty: Double;
    Fqty_Specified: boolean;
    Foptions: associativeArray;
    Foptions_Specified: boolean;
    Fbundle_option: associativeArray;
    Fbundle_option_Specified: boolean;
    Fbundle_option_qty: associativeArray;
    Fbundle_option_qty_Specified: boolean;
    Flinks: ArrayOfString;
    Flinks_Specified: boolean;
    procedure Setproduct_id(Index: Integer; const Astring: string);
    function  product_id_Specified(Index: Integer): boolean;
    procedure Setsku(Index: Integer; const Astring: string);
    function  sku_Specified(Index: Integer): boolean;
    procedure Setqty(Index: Integer; const ADouble: Double);
    function  qty_Specified(Index: Integer): boolean;
    procedure Setoptions(Index: Integer; const AassociativeArray: associativeArray);
    function  options_Specified(Index: Integer): boolean;
    procedure Setbundle_option(Index: Integer; const AassociativeArray: associativeArray);
    function  bundle_option_Specified(Index: Integer): boolean;
    procedure Setbundle_option_qty(Index: Integer; const AassociativeArray: associativeArray);
    function  bundle_option_qty_Specified(Index: Integer): boolean;
    procedure Setlinks(Index: Integer; const AArrayOfString: ArrayOfString);
    function  links_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property product_id:        string            Index (IS_OPTN) read Fproduct_id write Setproduct_id stored product_id_Specified;
    property sku:               string            Index (IS_OPTN) read Fsku write Setsku stored sku_Specified;
    property qty:               Double            Index (IS_OPTN) read Fqty write Setqty stored qty_Specified;
    property options:           associativeArray  Index (IS_OPTN) read Foptions write Setoptions stored options_Specified;
    property bundle_option:     associativeArray  Index (IS_OPTN) read Fbundle_option write Setbundle_option stored bundle_option_Specified;
    property bundle_option_qty: associativeArray  Index (IS_OPTN) read Fbundle_option_qty write Setbundle_option_qty stored bundle_option_qty_Specified;
    property links:             ArrayOfString     Index (IS_OPTN) read Flinks write Setlinks stored links_Specified;
  end;



  // ************************************************************************ //
  // XML       : filters, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  filters = class(TRemotable)
  private
    Ffilter: associativeArray;
    Ffilter_Specified: boolean;
    Fcomplex_filter: complexFilterArray;
    Fcomplex_filter_Specified: boolean;
    procedure Setfilter(Index: Integer; const AassociativeArray: associativeArray);
    function  filter_Specified(Index: Integer): boolean;
    procedure Setcomplex_filter(Index: Integer; const AcomplexFilterArray: complexFilterArray);
    function  complex_filter_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property filter:         associativeArray    Index (IS_OPTN) read Ffilter write Setfilter stored filter_Specified;
    property complex_filter: complexFilterArray  Index (IS_OPTN) read Fcomplex_filter write Setcomplex_filter stored complex_filter_Specified;
  end;

  associativeMultiArray = array of associativeMultiEntity;   { "urn:Magento"[GblCplx] }


  // ************************************************************************ //
  // XML       : associativeEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  associativeEntity = class(TRemotable)
  private
    Fkey: string;
    Fvalue: string;
  published
    property key:   string  read Fkey write Fkey;
    property value: string  read Fvalue write Fvalue;
  end;



  // ************************************************************************ //
  // XML       : anyURI, global, <element>
  // Namespace : http://schemas.xmlsoap.org/soap/encoding/
  // ************************************************************************ //
  anyURI = class(anyURI2)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : double, global, <element>
  // Namespace : http://schemas.xmlsoap.org/soap/encoding/
  // ************************************************************************ //
  double_ = class(double_2)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : string, global, <element>
  // Namespace : http://schemas.xmlsoap.org/soap/encoding/
  // ************************************************************************ //
  string_ = class(string_2)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : int, global, <element>
  // Namespace : http://schemas.xmlsoap.org/soap/encoding/
  // ************************************************************************ //
  int = class(int2)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : ID, global, <element>
  // Namespace : http://schemas.xmlsoap.org/soap/encoding/
  // ************************************************************************ //
  ID = class(ID2)
  private
  published
  end;

  catalogProductAttributeMediaTypeEntityArray = array of catalogProductAttributeMediaTypeEntity;   { "urn:Magento"[GblCplx] }


  // ************************************************************************ //
  // XML       : catalogProductAttributeMediaTypeEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogProductAttributeMediaTypeEntity = class(TRemotable)
  private
    Fcode: string;
    Fscope: string;
  published
    property code:  string  read Fcode write Fcode;
    property scope: string  read Fscope write Fscope;
  end;



  // ************************************************************************ //
  // XML       : catalogProductImageFileEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogProductImageFileEntity = class(TRemotable)
  private
    Fcontent: string;
    Fmime: string;
    Fname_: string;
    Fname__Specified: boolean;
    procedure Setname_(Index: Integer; const Astring: string);
    function  name__Specified(Index: Integer): boolean;
  published
    property content: string  read Fcontent write Fcontent;
    property mime:    string  read Fmime write Fmime;
    property name_:   string  Index (IS_OPTN) read Fname_ write Setname_ stored name__Specified;
  end;



  // ************************************************************************ //
  // XML       : catalogProductLinkEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogProductLinkEntity = class(TRemotable)
  private
    Fproduct_id: string;
    Fproduct_id_Specified: boolean;
    Ftype_: string;
    Ftype__Specified: boolean;
    Fset_: string;
    Fset__Specified: boolean;
    Fsku: string;
    Fsku_Specified: boolean;
    Fposition: string;
    Fposition_Specified: boolean;
    Fqty: string;
    Fqty_Specified: boolean;
    procedure Setproduct_id(Index: Integer; const Astring: string);
    function  product_id_Specified(Index: Integer): boolean;
    procedure Settype_(Index: Integer; const Astring: string);
    function  type__Specified(Index: Integer): boolean;
    procedure Setset_(Index: Integer; const Astring: string);
    function  set__Specified(Index: Integer): boolean;
    procedure Setsku(Index: Integer; const Astring: string);
    function  sku_Specified(Index: Integer): boolean;
    procedure Setposition(Index: Integer; const Astring: string);
    function  position_Specified(Index: Integer): boolean;
    procedure Setqty(Index: Integer; const Astring: string);
    function  qty_Specified(Index: Integer): boolean;
  published
    property product_id: string  Index (IS_OPTN) read Fproduct_id write Setproduct_id stored product_id_Specified;
    property type_:      string  Index (IS_OPTN) read Ftype_ write Settype_ stored type__Specified;
    property set_:       string  Index (IS_OPTN) read Fset_ write Setset_ stored set__Specified;
    property sku:        string  Index (IS_OPTN) read Fsku write Setsku stored sku_Specified;
    property position:   string  Index (IS_OPTN) read Fposition write Setposition stored position_Specified;
    property qty:        string  Index (IS_OPTN) read Fqty write Setqty stored qty_Specified;
  end;



  // ************************************************************************ //
  // XML       : catalogProductAttributeMediaCreateEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogProductAttributeMediaCreateEntity = class(TRemotable)
  private
    Ffile_: catalogProductImageFileEntity;
    Ffile__Specified: boolean;
    Flabel_: string;
    Flabel__Specified: boolean;
    Fposition: string;
    Fposition_Specified: boolean;
    Ftypes: ArrayOfString;
    Ftypes_Specified: boolean;
    Fexclude: string;
    Fexclude_Specified: boolean;
    Fremove: string;
    Fremove_Specified: boolean;
    procedure Setfile_(Index: Integer; const AcatalogProductImageFileEntity: catalogProductImageFileEntity);
    function  file__Specified(Index: Integer): boolean;
    procedure Setlabel_(Index: Integer; const Astring: string);
    function  label__Specified(Index: Integer): boolean;
    procedure Setposition(Index: Integer; const Astring: string);
    function  position_Specified(Index: Integer): boolean;
    procedure Settypes(Index: Integer; const AArrayOfString: ArrayOfString);
    function  types_Specified(Index: Integer): boolean;
    procedure Setexclude(Index: Integer; const Astring: string);
    function  exclude_Specified(Index: Integer): boolean;
    procedure Setremove(Index: Integer; const Astring: string);
    function  remove_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property file_:    catalogProductImageFileEntity  Index (IS_OPTN) read Ffile_ write Setfile_ stored file__Specified;
    property label_:   string                         Index (IS_OPTN) read Flabel_ write Setlabel_ stored label__Specified;
    property position: string                         Index (IS_OPTN) read Fposition write Setposition stored position_Specified;
    property types:    ArrayOfString                  Index (IS_OPTN) read Ftypes write Settypes stored types_Specified;
    property exclude:  string                         Index (IS_OPTN) read Fexclude write Setexclude stored exclude_Specified;
    property remove:   string                         Index (IS_OPTN) read Fremove write Setremove stored remove_Specified;
  end;

  catalogProductImageEntityArray = array of catalogProductImageEntity;   { "urn:Magento"[GblCplx] }
  catalogAttributeEntityArray = array of catalogAttributeEntity;   { "urn:Magento"[GblCplx] }


  // ************************************************************************ //
  // XML       : catalogAttributeEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogAttributeEntity = class(TRemotable)
  private
    Fattribute_id: Integer;
    Fattribute_id_Specified: boolean;
    Fcode: string;
    Fcode_Specified: boolean;
    Ftype_: string;
    Ftype__Specified: boolean;
    Frequired: string;
    Frequired_Specified: boolean;
    Fscope: string;
    Fscope_Specified: boolean;
    procedure Setattribute_id(Index: Integer; const AInteger: Integer);
    function  attribute_id_Specified(Index: Integer): boolean;
    procedure Setcode(Index: Integer; const Astring: string);
    function  code_Specified(Index: Integer): boolean;
    procedure Settype_(Index: Integer; const Astring: string);
    function  type__Specified(Index: Integer): boolean;
    procedure Setrequired(Index: Integer; const Astring: string);
    function  required_Specified(Index: Integer): boolean;
    procedure Setscope(Index: Integer; const Astring: string);
    function  scope_Specified(Index: Integer): boolean;
  published
    property attribute_id: Integer  Index (IS_OPTN) read Fattribute_id write Setattribute_id stored attribute_id_Specified;
    property code:         string   Index (IS_OPTN) read Fcode write Setcode stored code_Specified;
    property type_:        string   Index (IS_OPTN) read Ftype_ write Settype_ stored type__Specified;
    property required:     string   Index (IS_OPTN) read Frequired write Setrequired stored required_Specified;
    property scope:        string   Index (IS_OPTN) read Fscope write Setscope stored scope_Specified;
  end;



  // ************************************************************************ //
  // XML       : catalogAttributeOptionEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogAttributeOptionEntity = class(TRemotable)
  private
    Flabel_: string;
    Fvalue: string;
  published
    property label_: string  read Flabel_ write Flabel_;
    property value:  string  read Fvalue write Fvalue;
  end;



  // ************************************************************************ //
  // XML       : catalogProductImageEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogProductImageEntity = class(TRemotable)
  private
    Ffile_: string;
    Flabel_: string;
    Fposition: string;
    Fexclude: string;
    Furl: string;
    Ftypes: ArrayOfString;
  published
    property file_:    string         read Ffile_ write Ffile_;
    property label_:   string         read Flabel_ write Flabel_;
    property position: string         read Fposition write Fposition;
    property exclude:  string         read Fexclude write Fexclude;
    property url:      string         read Furl write Furl;
    property types:    ArrayOfString  read Ftypes write Ftypes;
  end;

  catalogAttributeOptionEntityArray = array of catalogAttributeOptionEntity;   { "urn:Magento"[GblCplx] }


  // ************************************************************************ //
  // XML       : catalogProductAttributeOptionLabelEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogProductAttributeOptionLabelEntity = class(TRemotable)
  private
    Fstore_id: ArrayOfString;
    Fvalue: string;
  published
    property store_id: ArrayOfString  read Fstore_id write Fstore_id;
    property value:    string         read Fvalue write Fvalue;
  end;

  catalogProductAttributeOptionLabelArray = array of catalogProductAttributeOptionLabelEntity;   { "urn:Magento"[GblCplx] }


  // ************************************************************************ //
  // XML       : catalogProductAttributeOptionEntityToAdd, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogProductAttributeOptionEntityToAdd = class(TRemotable)
  private
    Flabel_: catalogProductAttributeOptionLabelArray;
    Forder: Integer;
    Fis_default: Integer;
  public
    destructor Destroy; override;
  published
    property label_:     catalogProductAttributeOptionLabelArray  read Flabel_ write Flabel_;
    property order:      Integer                                  read Forder write Forder;
    property is_default: Integer                                  read Fis_default write Fis_default;
  end;



  // ************************************************************************ //
  // XML       : catalogProductLinkAttributeEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogProductLinkAttributeEntity = class(TRemotable)
  private
    Fcode: string;
    Fcode_Specified: boolean;
    Ftype_: string;
    Ftype__Specified: boolean;
    procedure Setcode(Index: Integer; const Astring: string);
    function  code_Specified(Index: Integer): boolean;
    procedure Settype_(Index: Integer; const Astring: string);
    function  type__Specified(Index: Integer): boolean;
  published
    property code:  string  Index (IS_OPTN) read Fcode write Setcode stored code_Specified;
    property type_: string  Index (IS_OPTN) read Ftype_ write Settype_ stored type__Specified;
  end;

  catalogProductLinkEntityArray = array of catalogProductLinkEntity;   { "urn:Magento"[GblCplx] }
  catalogProductLinkAttributeEntityArray = array of catalogProductLinkAttributeEntity;   { "urn:Magento"[GblCplx] }
  catalogProductAttributeFrontendLabelArray = array of catalogProductAttributeFrontendLabelEntity;   { "urn:Magento"[GblCplx] }


  // ************************************************************************ //
  // XML       : catalogProductAttributeEntityToCreate, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogProductAttributeEntityToCreate = class(TRemotable)
  private
    Fattribute_code: string;
    Ffrontend_input: string;
    Fscope: string;
    Fscope_Specified: boolean;
    Fdefault_value: string;
    Fdefault_value_Specified: boolean;
    Fis_unique: Integer;
    Fis_unique_Specified: boolean;
    Fis_required: Integer;
    Fis_required_Specified: boolean;
    Fapply_to: ArrayOfString;
    Fapply_to_Specified: boolean;
    Fis_configurable: Integer;
    Fis_configurable_Specified: boolean;
    Fis_searchable: Integer;
    Fis_searchable_Specified: boolean;
    Fis_visible_in_advanced_search: Integer;
    Fis_visible_in_advanced_search_Specified: boolean;
    Fis_comparable: Integer;
    Fis_comparable_Specified: boolean;
    Fis_used_for_promo_rules: Integer;
    Fis_used_for_promo_rules_Specified: boolean;
    Fis_visible_on_front: Integer;
    Fis_visible_on_front_Specified: boolean;
    Fused_in_product_listing: Integer;
    Fused_in_product_listing_Specified: boolean;
    Fadditional_fields: associativeArray;
    Fadditional_fields_Specified: boolean;
    Ffrontend_label: catalogProductAttributeFrontendLabelArray;
    procedure Setscope(Index: Integer; const Astring: string);
    function  scope_Specified(Index: Integer): boolean;
    procedure Setdefault_value(Index: Integer; const Astring: string);
    function  default_value_Specified(Index: Integer): boolean;
    procedure Setis_unique(Index: Integer; const AInteger: Integer);
    function  is_unique_Specified(Index: Integer): boolean;
    procedure Setis_required(Index: Integer; const AInteger: Integer);
    function  is_required_Specified(Index: Integer): boolean;
    procedure Setapply_to(Index: Integer; const AArrayOfString: ArrayOfString);
    function  apply_to_Specified(Index: Integer): boolean;
    procedure Setis_configurable(Index: Integer; const AInteger: Integer);
    function  is_configurable_Specified(Index: Integer): boolean;
    procedure Setis_searchable(Index: Integer; const AInteger: Integer);
    function  is_searchable_Specified(Index: Integer): boolean;
    procedure Setis_visible_in_advanced_search(Index: Integer; const AInteger: Integer);
    function  is_visible_in_advanced_search_Specified(Index: Integer): boolean;
    procedure Setis_comparable(Index: Integer; const AInteger: Integer);
    function  is_comparable_Specified(Index: Integer): boolean;
    procedure Setis_used_for_promo_rules(Index: Integer; const AInteger: Integer);
    function  is_used_for_promo_rules_Specified(Index: Integer): boolean;
    procedure Setis_visible_on_front(Index: Integer; const AInteger: Integer);
    function  is_visible_on_front_Specified(Index: Integer): boolean;
    procedure Setused_in_product_listing(Index: Integer; const AInteger: Integer);
    function  used_in_product_listing_Specified(Index: Integer): boolean;
    procedure Setadditional_fields(Index: Integer; const AassociativeArray: associativeArray);
    function  additional_fields_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property attribute_code:                string                                     read Fattribute_code write Fattribute_code;
    property frontend_input:                string                                     read Ffrontend_input write Ffrontend_input;
    property scope:                         string                                     Index (IS_OPTN) read Fscope write Setscope stored scope_Specified;
    property default_value:                 string                                     Index (IS_OPTN) read Fdefault_value write Setdefault_value stored default_value_Specified;
    property is_unique:                     Integer                                    Index (IS_OPTN) read Fis_unique write Setis_unique stored is_unique_Specified;
    property is_required:                   Integer                                    Index (IS_OPTN) read Fis_required write Setis_required stored is_required_Specified;
    property apply_to:                      ArrayOfString                              Index (IS_OPTN) read Fapply_to write Setapply_to stored apply_to_Specified;
    property is_configurable:               Integer                                    Index (IS_OPTN) read Fis_configurable write Setis_configurable stored is_configurable_Specified;
    property is_searchable:                 Integer                                    Index (IS_OPTN) read Fis_searchable write Setis_searchable stored is_searchable_Specified;
    property is_visible_in_advanced_search: Integer                                    Index (IS_OPTN) read Fis_visible_in_advanced_search write Setis_visible_in_advanced_search stored is_visible_in_advanced_search_Specified;
    property is_comparable:                 Integer                                    Index (IS_OPTN) read Fis_comparable write Setis_comparable stored is_comparable_Specified;
    property is_used_for_promo_rules:       Integer                                    Index (IS_OPTN) read Fis_used_for_promo_rules write Setis_used_for_promo_rules stored is_used_for_promo_rules_Specified;
    property is_visible_on_front:           Integer                                    Index (IS_OPTN) read Fis_visible_on_front write Setis_visible_on_front stored is_visible_on_front_Specified;
    property used_in_product_listing:       Integer                                    Index (IS_OPTN) read Fused_in_product_listing write Setused_in_product_listing stored used_in_product_listing_Specified;
    property additional_fields:             associativeArray                           Index (IS_OPTN) read Fadditional_fields write Setadditional_fields stored additional_fields_Specified;
    property frontend_label:                catalogProductAttributeFrontendLabelArray  read Ffrontend_label write Ffrontend_label;
  end;



  // ************************************************************************ //
  // XML       : catalogProductAttributeEntityToUpdate, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogProductAttributeEntityToUpdate = class(TRemotable)
  private
    Fscope: string;
    Fscope_Specified: boolean;
    Fdefault_value: string;
    Fdefault_value_Specified: boolean;
    Fis_unique: Integer;
    Fis_unique_Specified: boolean;
    Fis_required: Integer;
    Fis_required_Specified: boolean;
    Fapply_to: ArrayOfString;
    Fapply_to_Specified: boolean;
    Fis_configurable: Integer;
    Fis_configurable_Specified: boolean;
    Fis_searchable: Integer;
    Fis_searchable_Specified: boolean;
    Fis_visible_in_advanced_search: Integer;
    Fis_visible_in_advanced_search_Specified: boolean;
    Fis_comparable: Integer;
    Fis_comparable_Specified: boolean;
    Fis_used_for_promo_rules: Integer;
    Fis_used_for_promo_rules_Specified: boolean;
    Fis_visible_on_front: Integer;
    Fis_visible_on_front_Specified: boolean;
    Fused_in_product_listing: Integer;
    Fused_in_product_listing_Specified: boolean;
    Fadditional_fields: associativeArray;
    Fadditional_fields_Specified: boolean;
    Ffrontend_label: catalogProductAttributeFrontendLabelArray;
    procedure Setscope(Index: Integer; const Astring: string);
    function  scope_Specified(Index: Integer): boolean;
    procedure Setdefault_value(Index: Integer; const Astring: string);
    function  default_value_Specified(Index: Integer): boolean;
    procedure Setis_unique(Index: Integer; const AInteger: Integer);
    function  is_unique_Specified(Index: Integer): boolean;
    procedure Setis_required(Index: Integer; const AInteger: Integer);
    function  is_required_Specified(Index: Integer): boolean;
    procedure Setapply_to(Index: Integer; const AArrayOfString: ArrayOfString);
    function  apply_to_Specified(Index: Integer): boolean;
    procedure Setis_configurable(Index: Integer; const AInteger: Integer);
    function  is_configurable_Specified(Index: Integer): boolean;
    procedure Setis_searchable(Index: Integer; const AInteger: Integer);
    function  is_searchable_Specified(Index: Integer): boolean;
    procedure Setis_visible_in_advanced_search(Index: Integer; const AInteger: Integer);
    function  is_visible_in_advanced_search_Specified(Index: Integer): boolean;
    procedure Setis_comparable(Index: Integer; const AInteger: Integer);
    function  is_comparable_Specified(Index: Integer): boolean;
    procedure Setis_used_for_promo_rules(Index: Integer; const AInteger: Integer);
    function  is_used_for_promo_rules_Specified(Index: Integer): boolean;
    procedure Setis_visible_on_front(Index: Integer; const AInteger: Integer);
    function  is_visible_on_front_Specified(Index: Integer): boolean;
    procedure Setused_in_product_listing(Index: Integer; const AInteger: Integer);
    function  used_in_product_listing_Specified(Index: Integer): boolean;
    procedure Setadditional_fields(Index: Integer; const AassociativeArray: associativeArray);
    function  additional_fields_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property scope:                         string                                     Index (IS_OPTN) read Fscope write Setscope stored scope_Specified;
    property default_value:                 string                                     Index (IS_OPTN) read Fdefault_value write Setdefault_value stored default_value_Specified;
    property is_unique:                     Integer                                    Index (IS_OPTN) read Fis_unique write Setis_unique stored is_unique_Specified;
    property is_required:                   Integer                                    Index (IS_OPTN) read Fis_required write Setis_required stored is_required_Specified;
    property apply_to:                      ArrayOfString                              Index (IS_OPTN) read Fapply_to write Setapply_to stored apply_to_Specified;
    property is_configurable:               Integer                                    Index (IS_OPTN) read Fis_configurable write Setis_configurable stored is_configurable_Specified;
    property is_searchable:                 Integer                                    Index (IS_OPTN) read Fis_searchable write Setis_searchable stored is_searchable_Specified;
    property is_visible_in_advanced_search: Integer                                    Index (IS_OPTN) read Fis_visible_in_advanced_search write Setis_visible_in_advanced_search stored is_visible_in_advanced_search_Specified;
    property is_comparable:                 Integer                                    Index (IS_OPTN) read Fis_comparable write Setis_comparable stored is_comparable_Specified;
    property is_used_for_promo_rules:       Integer                                    Index (IS_OPTN) read Fis_used_for_promo_rules write Setis_used_for_promo_rules stored is_used_for_promo_rules_Specified;
    property is_visible_on_front:           Integer                                    Index (IS_OPTN) read Fis_visible_on_front write Setis_visible_on_front stored is_visible_on_front_Specified;
    property used_in_product_listing:       Integer                                    Index (IS_OPTN) read Fused_in_product_listing write Setused_in_product_listing stored used_in_product_listing_Specified;
    property additional_fields:             associativeArray                           Index (IS_OPTN) read Fadditional_fields write Setadditional_fields stored additional_fields_Specified;
    property frontend_label:                catalogProductAttributeFrontendLabelArray  read Ffrontend_label write Ffrontend_label;
  end;



  // ************************************************************************ //
  // XML       : catalogProductAttributeEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogProductAttributeEntity = class(TRemotable)
  private
    Fattribute_id: string;
    Fattribute_code: string;
    Ffrontend_input: string;
    Fscope: string;
    Fscope_Specified: boolean;
    Fdefault_value: string;
    Fdefault_value_Specified: boolean;
    Fis_unique: Integer;
    Fis_unique_Specified: boolean;
    Fis_required: Integer;
    Fis_required_Specified: boolean;
    Fapply_to: ArrayOfString;
    Fapply_to_Specified: boolean;
    Fis_configurable: Integer;
    Fis_configurable_Specified: boolean;
    Fis_searchable: Integer;
    Fis_searchable_Specified: boolean;
    Fis_visible_in_advanced_search: Integer;
    Fis_visible_in_advanced_search_Specified: boolean;
    Fis_comparable: Integer;
    Fis_comparable_Specified: boolean;
    Fis_used_for_promo_rules: Integer;
    Fis_used_for_promo_rules_Specified: boolean;
    Fis_visible_on_front: Integer;
    Fis_visible_on_front_Specified: boolean;
    Fused_in_product_listing: Integer;
    Fused_in_product_listing_Specified: boolean;
    Fadditional_fields: associativeArray;
    Fadditional_fields_Specified: boolean;
    Foptions: catalogAttributeOptionEntityArray;
    Foptions_Specified: boolean;
    Ffrontend_label: catalogProductAttributeFrontendLabelArray;
    procedure Setscope(Index: Integer; const Astring: string);
    function  scope_Specified(Index: Integer): boolean;
    procedure Setdefault_value(Index: Integer; const Astring: string);
    function  default_value_Specified(Index: Integer): boolean;
    procedure Setis_unique(Index: Integer; const AInteger: Integer);
    function  is_unique_Specified(Index: Integer): boolean;
    procedure Setis_required(Index: Integer; const AInteger: Integer);
    function  is_required_Specified(Index: Integer): boolean;
    procedure Setapply_to(Index: Integer; const AArrayOfString: ArrayOfString);
    function  apply_to_Specified(Index: Integer): boolean;
    procedure Setis_configurable(Index: Integer; const AInteger: Integer);
    function  is_configurable_Specified(Index: Integer): boolean;
    procedure Setis_searchable(Index: Integer; const AInteger: Integer);
    function  is_searchable_Specified(Index: Integer): boolean;
    procedure Setis_visible_in_advanced_search(Index: Integer; const AInteger: Integer);
    function  is_visible_in_advanced_search_Specified(Index: Integer): boolean;
    procedure Setis_comparable(Index: Integer; const AInteger: Integer);
    function  is_comparable_Specified(Index: Integer): boolean;
    procedure Setis_used_for_promo_rules(Index: Integer; const AInteger: Integer);
    function  is_used_for_promo_rules_Specified(Index: Integer): boolean;
    procedure Setis_visible_on_front(Index: Integer; const AInteger: Integer);
    function  is_visible_on_front_Specified(Index: Integer): boolean;
    procedure Setused_in_product_listing(Index: Integer; const AInteger: Integer);
    function  used_in_product_listing_Specified(Index: Integer): boolean;
    procedure Setadditional_fields(Index: Integer; const AassociativeArray: associativeArray);
    function  additional_fields_Specified(Index: Integer): boolean;
    procedure Setoptions(Index: Integer; const AcatalogAttributeOptionEntityArray: catalogAttributeOptionEntityArray);
    function  options_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property attribute_id:                  string                                     read Fattribute_id write Fattribute_id;
    property attribute_code:                string                                     read Fattribute_code write Fattribute_code;
    property frontend_input:                string                                     read Ffrontend_input write Ffrontend_input;
    property scope:                         string                                     Index (IS_OPTN) read Fscope write Setscope stored scope_Specified;
    property default_value:                 string                                     Index (IS_OPTN) read Fdefault_value write Setdefault_value stored default_value_Specified;
    property is_unique:                     Integer                                    Index (IS_OPTN) read Fis_unique write Setis_unique stored is_unique_Specified;
    property is_required:                   Integer                                    Index (IS_OPTN) read Fis_required write Setis_required stored is_required_Specified;
    property apply_to:                      ArrayOfString                              Index (IS_OPTN) read Fapply_to write Setapply_to stored apply_to_Specified;
    property is_configurable:               Integer                                    Index (IS_OPTN) read Fis_configurable write Setis_configurable stored is_configurable_Specified;
    property is_searchable:                 Integer                                    Index (IS_OPTN) read Fis_searchable write Setis_searchable stored is_searchable_Specified;
    property is_visible_in_advanced_search: Integer                                    Index (IS_OPTN) read Fis_visible_in_advanced_search write Setis_visible_in_advanced_search stored is_visible_in_advanced_search_Specified;
    property is_comparable:                 Integer                                    Index (IS_OPTN) read Fis_comparable write Setis_comparable stored is_comparable_Specified;
    property is_used_for_promo_rules:       Integer                                    Index (IS_OPTN) read Fis_used_for_promo_rules write Setis_used_for_promo_rules stored is_used_for_promo_rules_Specified;
    property is_visible_on_front:           Integer                                    Index (IS_OPTN) read Fis_visible_on_front write Setis_visible_on_front stored is_visible_on_front_Specified;
    property used_in_product_listing:       Integer                                    Index (IS_OPTN) read Fused_in_product_listing write Setused_in_product_listing stored used_in_product_listing_Specified;
    property additional_fields:             associativeArray                           Index (IS_OPTN) read Fadditional_fields write Setadditional_fields stored additional_fields_Specified;
    property options:                       catalogAttributeOptionEntityArray          Index (IS_OPTN) read Foptions write Setoptions stored options_Specified;
    property frontend_label:                catalogProductAttributeFrontendLabelArray  read Ffrontend_label write Ffrontend_label;
  end;



  // ************************************************************************ //
  // XML       : catalogProductAttributeFrontendLabelEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogProductAttributeFrontendLabelEntity = class(TRemotable)
  private
    Fstore_id: string;
    Flabel_: string;
  published
    property store_id: string  read Fstore_id write Fstore_id;
    property label_:   string  read Flabel_ write Flabel_;
  end;

  catalogAssignedProductArray = array of catalogAssignedProduct;   { "urn:Magento"[GblCplx] }


  // ************************************************************************ //
  // XML       : catalogInventoryStockItemUpdateEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogInventoryStockItemUpdateEntity = class(TRemotable)
  private
    Fqty: string;
    Fqty_Specified: boolean;
    Fis_in_stock: Integer;
    Fis_in_stock_Specified: boolean;
    Fmanage_stock: Integer;
    Fmanage_stock_Specified: boolean;
    Fuse_config_manage_stock: Integer;
    Fuse_config_manage_stock_Specified: boolean;
    Fmin_qty: Integer;
    Fmin_qty_Specified: boolean;
    Fuse_config_min_qty: Integer;
    Fuse_config_min_qty_Specified: boolean;
    Fmin_sale_qty: Integer;
    Fmin_sale_qty_Specified: boolean;
    Fuse_config_min_sale_qty: Integer;
    Fuse_config_min_sale_qty_Specified: boolean;
    Fmax_sale_qty: Integer;
    Fmax_sale_qty_Specified: boolean;
    Fuse_config_max_sale_qty: Integer;
    Fuse_config_max_sale_qty_Specified: boolean;
    Fis_qty_decimal: Integer;
    Fis_qty_decimal_Specified: boolean;
    Fbackorders: Integer;
    Fbackorders_Specified: boolean;
    Fuse_config_backorders: Integer;
    Fuse_config_backorders_Specified: boolean;
    Fnotify_stock_qty: Integer;
    Fnotify_stock_qty_Specified: boolean;
    Fuse_config_notify_stock_qty: Integer;
    Fuse_config_notify_stock_qty_Specified: boolean;
    procedure Setqty(Index: Integer; const Astring: string);
    function  qty_Specified(Index: Integer): boolean;
    procedure Setis_in_stock(Index: Integer; const AInteger: Integer);
    function  is_in_stock_Specified(Index: Integer): boolean;
    procedure Setmanage_stock(Index: Integer; const AInteger: Integer);
    function  manage_stock_Specified(Index: Integer): boolean;
    procedure Setuse_config_manage_stock(Index: Integer; const AInteger: Integer);
    function  use_config_manage_stock_Specified(Index: Integer): boolean;
    procedure Setmin_qty(Index: Integer; const AInteger: Integer);
    function  min_qty_Specified(Index: Integer): boolean;
    procedure Setuse_config_min_qty(Index: Integer; const AInteger: Integer);
    function  use_config_min_qty_Specified(Index: Integer): boolean;
    procedure Setmin_sale_qty(Index: Integer; const AInteger: Integer);
    function  min_sale_qty_Specified(Index: Integer): boolean;
    procedure Setuse_config_min_sale_qty(Index: Integer; const AInteger: Integer);
    function  use_config_min_sale_qty_Specified(Index: Integer): boolean;
    procedure Setmax_sale_qty(Index: Integer; const AInteger: Integer);
    function  max_sale_qty_Specified(Index: Integer): boolean;
    procedure Setuse_config_max_sale_qty(Index: Integer; const AInteger: Integer);
    function  use_config_max_sale_qty_Specified(Index: Integer): boolean;
    procedure Setis_qty_decimal(Index: Integer; const AInteger: Integer);
    function  is_qty_decimal_Specified(Index: Integer): boolean;
    procedure Setbackorders(Index: Integer; const AInteger: Integer);
    function  backorders_Specified(Index: Integer): boolean;
    procedure Setuse_config_backorders(Index: Integer; const AInteger: Integer);
    function  use_config_backorders_Specified(Index: Integer): boolean;
    procedure Setnotify_stock_qty(Index: Integer; const AInteger: Integer);
    function  notify_stock_qty_Specified(Index: Integer): boolean;
    procedure Setuse_config_notify_stock_qty(Index: Integer; const AInteger: Integer);
    function  use_config_notify_stock_qty_Specified(Index: Integer): boolean;
  published
    property qty:                         string   Index (IS_OPTN) read Fqty write Setqty stored qty_Specified;
    property is_in_stock:                 Integer  Index (IS_OPTN) read Fis_in_stock write Setis_in_stock stored is_in_stock_Specified;
    property manage_stock:                Integer  Index (IS_OPTN) read Fmanage_stock write Setmanage_stock stored manage_stock_Specified;
    property use_config_manage_stock:     Integer  Index (IS_OPTN) read Fuse_config_manage_stock write Setuse_config_manage_stock stored use_config_manage_stock_Specified;
    property min_qty:                     Integer  Index (IS_OPTN) read Fmin_qty write Setmin_qty stored min_qty_Specified;
    property use_config_min_qty:          Integer  Index (IS_OPTN) read Fuse_config_min_qty write Setuse_config_min_qty stored use_config_min_qty_Specified;
    property min_sale_qty:                Integer  Index (IS_OPTN) read Fmin_sale_qty write Setmin_sale_qty stored min_sale_qty_Specified;
    property use_config_min_sale_qty:     Integer  Index (IS_OPTN) read Fuse_config_min_sale_qty write Setuse_config_min_sale_qty stored use_config_min_sale_qty_Specified;
    property max_sale_qty:                Integer  Index (IS_OPTN) read Fmax_sale_qty write Setmax_sale_qty stored max_sale_qty_Specified;
    property use_config_max_sale_qty:     Integer  Index (IS_OPTN) read Fuse_config_max_sale_qty write Setuse_config_max_sale_qty stored use_config_max_sale_qty_Specified;
    property is_qty_decimal:              Integer  Index (IS_OPTN) read Fis_qty_decimal write Setis_qty_decimal stored is_qty_decimal_Specified;
    property backorders:                  Integer  Index (IS_OPTN) read Fbackorders write Setbackorders stored backorders_Specified;
    property use_config_backorders:       Integer  Index (IS_OPTN) read Fuse_config_backorders write Setuse_config_backorders stored use_config_backorders_Specified;
    property notify_stock_qty:            Integer  Index (IS_OPTN) read Fnotify_stock_qty write Setnotify_stock_qty stored notify_stock_qty_Specified;
    property use_config_notify_stock_qty: Integer  Index (IS_OPTN) read Fuse_config_notify_stock_qty write Setuse_config_notify_stock_qty stored use_config_notify_stock_qty_Specified;
  end;

  catalogProductCreateEntityArray = array of catalogProductCreateEntity;   { "urn:Magento"[GblCplx] }
  catalogProductAttributeSetEntityArray = array of catalogProductAttributeSetEntity;   { "urn:Magento"[GblCplx] }


  // ************************************************************************ //
  // XML       : catalogProductAttributeSetEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogProductAttributeSetEntity = class(TRemotable)
  private
    Fset_id: Integer;
    Fset_id_Specified: boolean;
    Fname_: string;
    Fname__Specified: boolean;
    procedure Setset_id(Index: Integer; const AInteger: Integer);
    function  set_id_Specified(Index: Integer): boolean;
    procedure Setname_(Index: Integer; const Astring: string);
    function  name__Specified(Index: Integer): boolean;
  published
    property set_id: Integer  Index (IS_OPTN) read Fset_id write Setset_id stored set_id_Specified;
    property name_:  string   Index (IS_OPTN) read Fname_ write Setname_ stored name__Specified;
  end;

  catalogProductTierPriceEntityArray = array of catalogProductTierPriceEntity;   { "urn:Magento"[GblCplx] }


  // ************************************************************************ //
  // XML       : catalogProductCreateEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogProductCreateEntity = class(TRemotable)
  private
    Fcategories: ArrayOfString;
    Fcategories_Specified: boolean;
    Fwebsites: ArrayOfString;
    Fwebsites_Specified: boolean;
    Fname_: string;
    Fname__Specified: boolean;
    Fdescription: string;
    Fdescription_Specified: boolean;
    Fshort_description: string;
    Fshort_description_Specified: boolean;
    Fweight: string;
    Fweight_Specified: boolean;
    Fstatus: string;
    Fstatus_Specified: boolean;
    Furl_key: string;
    Furl_key_Specified: boolean;
    Furl_path: string;
    Furl_path_Specified: boolean;
    Fvisibility: string;
    Fvisibility_Specified: boolean;
    Fcategory_ids: ArrayOfString;
    Fcategory_ids_Specified: boolean;
    Fwebsite_ids: ArrayOfString;
    Fwebsite_ids_Specified: boolean;
    Fhas_options: string;
    Fhas_options_Specified: boolean;
    Fgift_message_available: string;
    Fgift_message_available_Specified: boolean;
    Fprice: string;
    Fprice_Specified: boolean;
    Fspecial_price: string;
    Fspecial_price_Specified: boolean;
    Fspecial_from_date: string;
    Fspecial_from_date_Specified: boolean;
    Fspecial_to_date: string;
    Fspecial_to_date_Specified: boolean;
    Ftax_class_id: string;
    Ftax_class_id_Specified: boolean;
    Ftier_price: catalogProductTierPriceEntityArray;
    Ftier_price_Specified: boolean;
    Fmeta_title: string;
    Fmeta_title_Specified: boolean;
    Fmeta_keyword: string;
    Fmeta_keyword_Specified: boolean;
    Fmeta_description: string;
    Fmeta_description_Specified: boolean;
    Fcustom_design: string;
    Fcustom_design_Specified: boolean;
    Fcustom_layout_update: string;
    Fcustom_layout_update_Specified: boolean;
    Foptions_container: string;
    Foptions_container_Specified: boolean;
    Fadditional_attributes: catalogProductAdditionalAttributesEntity;
    Fadditional_attributes_Specified: boolean;
    Fstock_data: catalogInventoryStockItemUpdateEntity;
    Fstock_data_Specified: boolean;
    procedure Setcategories(Index: Integer; const AArrayOfString: ArrayOfString);
    function  categories_Specified(Index: Integer): boolean;
    procedure Setwebsites(Index: Integer; const AArrayOfString: ArrayOfString);
    function  websites_Specified(Index: Integer): boolean;
    procedure Setname_(Index: Integer; const Astring: string);
    function  name__Specified(Index: Integer): boolean;
    procedure Setdescription(Index: Integer; const Astring: string);
    function  description_Specified(Index: Integer): boolean;
    procedure Setshort_description(Index: Integer; const Astring: string);
    function  short_description_Specified(Index: Integer): boolean;
    procedure Setweight(Index: Integer; const Astring: string);
    function  weight_Specified(Index: Integer): boolean;
    procedure Setstatus(Index: Integer; const Astring: string);
    function  status_Specified(Index: Integer): boolean;
    procedure Seturl_key(Index: Integer; const Astring: string);
    function  url_key_Specified(Index: Integer): boolean;
    procedure Seturl_path(Index: Integer; const Astring: string);
    function  url_path_Specified(Index: Integer): boolean;
    procedure Setvisibility(Index: Integer; const Astring: string);
    function  visibility_Specified(Index: Integer): boolean;
    procedure Setcategory_ids(Index: Integer; const AArrayOfString: ArrayOfString);
    function  category_ids_Specified(Index: Integer): boolean;
    procedure Setwebsite_ids(Index: Integer; const AArrayOfString: ArrayOfString);
    function  website_ids_Specified(Index: Integer): boolean;
    procedure Sethas_options(Index: Integer; const Astring: string);
    function  has_options_Specified(Index: Integer): boolean;
    procedure Setgift_message_available(Index: Integer; const Astring: string);
    function  gift_message_available_Specified(Index: Integer): boolean;
    procedure Setprice(Index: Integer; const Astring: string);
    function  price_Specified(Index: Integer): boolean;
    procedure Setspecial_price(Index: Integer; const Astring: string);
    function  special_price_Specified(Index: Integer): boolean;
    procedure Setspecial_from_date(Index: Integer; const Astring: string);
    function  special_from_date_Specified(Index: Integer): boolean;
    procedure Setspecial_to_date(Index: Integer; const Astring: string);
    function  special_to_date_Specified(Index: Integer): boolean;
    procedure Settax_class_id(Index: Integer; const Astring: string);
    function  tax_class_id_Specified(Index: Integer): boolean;
    procedure Settier_price(Index: Integer; const AcatalogProductTierPriceEntityArray: catalogProductTierPriceEntityArray);
    function  tier_price_Specified(Index: Integer): boolean;
    procedure Setmeta_title(Index: Integer; const Astring: string);
    function  meta_title_Specified(Index: Integer): boolean;
    procedure Setmeta_keyword(Index: Integer; const Astring: string);
    function  meta_keyword_Specified(Index: Integer): boolean;
    procedure Setmeta_description(Index: Integer; const Astring: string);
    function  meta_description_Specified(Index: Integer): boolean;
    procedure Setcustom_design(Index: Integer; const Astring: string);
    function  custom_design_Specified(Index: Integer): boolean;
    procedure Setcustom_layout_update(Index: Integer; const Astring: string);
    function  custom_layout_update_Specified(Index: Integer): boolean;
    procedure Setoptions_container(Index: Integer; const Astring: string);
    function  options_container_Specified(Index: Integer): boolean;
    procedure Setadditional_attributes(Index: Integer; const AcatalogProductAdditionalAttributesEntity: catalogProductAdditionalAttributesEntity);
    function  additional_attributes_Specified(Index: Integer): boolean;
    procedure Setstock_data(Index: Integer; const AcatalogInventoryStockItemUpdateEntity: catalogInventoryStockItemUpdateEntity);
    function  stock_data_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property categories:             ArrayOfString                             Index (IS_OPTN) read Fcategories write Setcategories stored categories_Specified;
    property websites:               ArrayOfString                             Index (IS_OPTN) read Fwebsites write Setwebsites stored websites_Specified;
    property name_:                  string                                    Index (IS_OPTN) read Fname_ write Setname_ stored name__Specified;
    property description:            string                                    Index (IS_OPTN) read Fdescription write Setdescription stored description_Specified;
    property short_description:      string                                    Index (IS_OPTN) read Fshort_description write Setshort_description stored short_description_Specified;
    property weight:                 string                                    Index (IS_OPTN) read Fweight write Setweight stored weight_Specified;
    property status:                 string                                    Index (IS_OPTN) read Fstatus write Setstatus stored status_Specified;
    property url_key:                string                                    Index (IS_OPTN) read Furl_key write Seturl_key stored url_key_Specified;
    property url_path:               string                                    Index (IS_OPTN) read Furl_path write Seturl_path stored url_path_Specified;
    property visibility:             string                                    Index (IS_OPTN) read Fvisibility write Setvisibility stored visibility_Specified;
    property category_ids:           ArrayOfString                             Index (IS_OPTN) read Fcategory_ids write Setcategory_ids stored category_ids_Specified;
    property website_ids:            ArrayOfString                             Index (IS_OPTN) read Fwebsite_ids write Setwebsite_ids stored website_ids_Specified;
    property has_options:            string                                    Index (IS_OPTN) read Fhas_options write Sethas_options stored has_options_Specified;
    property gift_message_available: string                                    Index (IS_OPTN) read Fgift_message_available write Setgift_message_available stored gift_message_available_Specified;
    property price:                  string                                    Index (IS_OPTN) read Fprice write Setprice stored price_Specified;
    property special_price:          string                                    Index (IS_OPTN) read Fspecial_price write Setspecial_price stored special_price_Specified;
    property special_from_date:      string                                    Index (IS_OPTN) read Fspecial_from_date write Setspecial_from_date stored special_from_date_Specified;
    property special_to_date:        string                                    Index (IS_OPTN) read Fspecial_to_date write Setspecial_to_date stored special_to_date_Specified;
    property tax_class_id:           string                                    Index (IS_OPTN) read Ftax_class_id write Settax_class_id stored tax_class_id_Specified;
    property tier_price:             catalogProductTierPriceEntityArray        Index (IS_OPTN) read Ftier_price write Settier_price stored tier_price_Specified;
    property meta_title:             string                                    Index (IS_OPTN) read Fmeta_title write Setmeta_title stored meta_title_Specified;
    property meta_keyword:           string                                    Index (IS_OPTN) read Fmeta_keyword write Setmeta_keyword stored meta_keyword_Specified;
    property meta_description:       string                                    Index (IS_OPTN) read Fmeta_description write Setmeta_description stored meta_description_Specified;
    property custom_design:          string                                    Index (IS_OPTN) read Fcustom_design write Setcustom_design stored custom_design_Specified;
    property custom_layout_update:   string                                    Index (IS_OPTN) read Fcustom_layout_update write Setcustom_layout_update stored custom_layout_update_Specified;
    property options_container:      string                                    Index (IS_OPTN) read Foptions_container write Setoptions_container stored options_container_Specified;
    property additional_attributes:  catalogProductAdditionalAttributesEntity  Index (IS_OPTN) read Fadditional_attributes write Setadditional_attributes stored additional_attributes_Specified;
    property stock_data:             catalogInventoryStockItemUpdateEntity     Index (IS_OPTN) read Fstock_data write Setstock_data stored stock_data_Specified;
  end;



  // ************************************************************************ //
  // XML       : catalogProductEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogProductEntity = class(TRemotable)
  private
    Fproduct_id: string;
    Fsku: string;
    Fname_: string;
    Fset_: string;
    Ftype_: string;
    Fcategory_ids: ArrayOfString;
    Fwebsite_ids: ArrayOfString;
  published
    property product_id:   string         read Fproduct_id write Fproduct_id;
    property sku:          string         read Fsku write Fsku;
    property name_:        string         read Fname_ write Fname_;
    property set_:         string         read Fset_ write Fset_;
    property type_:        string         read Ftype_ write Ftype_;
    property category_ids: ArrayOfString  read Fcategory_ids write Fcategory_ids;
    property website_ids:  ArrayOfString  read Fwebsite_ids write Fwebsite_ids;
  end;

  catalogProductEntityArray = array of catalogProductEntity;   { "urn:Magento"[GblCplx] }


  // ************************************************************************ //
  // XML       : catalogProductAdditionalAttributesEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogProductAdditionalAttributesEntity = class(TRemotable)
  private
    Fmulti_data: associativeMultiArray;
    Fmulti_data_Specified: boolean;
    Fsingle_data: associativeArray;
    Fsingle_data_Specified: boolean;
    procedure Setmulti_data(Index: Integer; const AassociativeMultiArray: associativeMultiArray);
    function  multi_data_Specified(Index: Integer): boolean;
    procedure Setsingle_data(Index: Integer; const AassociativeArray: associativeArray);
    function  single_data_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property multi_data:  associativeMultiArray  Index (IS_OPTN) read Fmulti_data write Setmulti_data stored multi_data_Specified;
    property single_data: associativeArray       Index (IS_OPTN) read Fsingle_data write Setsingle_data stored single_data_Specified;
  end;



  // ************************************************************************ //
  // XML       : catalogProductReturnEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogProductReturnEntity = class(TRemotable)
  private
    Fproduct_id: string;
    Fproduct_id_Specified: boolean;
    Fsku: string;
    Fsku_Specified: boolean;
    Fset_: string;
    Fset__Specified: boolean;
    Ftype_: string;
    Ftype__Specified: boolean;
    Fcategories: ArrayOfString;
    Fcategories_Specified: boolean;
    Fwebsites: ArrayOfString;
    Fwebsites_Specified: boolean;
    Fcreated_at: string;
    Fcreated_at_Specified: boolean;
    Fupdated_at: string;
    Fupdated_at_Specified: boolean;
    Ftype_id: string;
    Ftype_id_Specified: boolean;
    Fname_: string;
    Fname__Specified: boolean;
    Fdescription: string;
    Fdescription_Specified: boolean;
    Fshort_description: string;
    Fshort_description_Specified: boolean;
    Fweight: string;
    Fweight_Specified: boolean;
    Fstatus: string;
    Fstatus_Specified: boolean;
    Furl_key: string;
    Furl_key_Specified: boolean;
    Furl_path: string;
    Furl_path_Specified: boolean;
    Fvisibility: string;
    Fvisibility_Specified: boolean;
    Fcategory_ids: ArrayOfString;
    Fcategory_ids_Specified: boolean;
    Fwebsite_ids: ArrayOfString;
    Fwebsite_ids_Specified: boolean;
    Fhas_options: string;
    Fhas_options_Specified: boolean;
    Fgift_message_available: string;
    Fgift_message_available_Specified: boolean;
    Fprice: string;
    Fprice_Specified: boolean;
    Fspecial_price: string;
    Fspecial_price_Specified: boolean;
    Fspecial_from_date: string;
    Fspecial_from_date_Specified: boolean;
    Fspecial_to_date: string;
    Fspecial_to_date_Specified: boolean;
    Ftax_class_id: string;
    Ftax_class_id_Specified: boolean;
    Ftier_price: catalogProductTierPriceEntityArray;
    Ftier_price_Specified: boolean;
    Fmeta_title: string;
    Fmeta_title_Specified: boolean;
    Fmeta_keyword: string;
    Fmeta_keyword_Specified: boolean;
    Fmeta_description: string;
    Fmeta_description_Specified: boolean;
    Fcustom_design: string;
    Fcustom_design_Specified: boolean;
    Fcustom_layout_update: string;
    Fcustom_layout_update_Specified: boolean;
    Foptions_container: string;
    Foptions_container_Specified: boolean;
    Fadditional_attributes: associativeArray;
    Fadditional_attributes_Specified: boolean;
    procedure Setproduct_id(Index: Integer; const Astring: string);
    function  product_id_Specified(Index: Integer): boolean;
    procedure Setsku(Index: Integer; const Astring: string);
    function  sku_Specified(Index: Integer): boolean;
    procedure Setset_(Index: Integer; const Astring: string);
    function  set__Specified(Index: Integer): boolean;
    procedure Settype_(Index: Integer; const Astring: string);
    function  type__Specified(Index: Integer): boolean;
    procedure Setcategories(Index: Integer; const AArrayOfString: ArrayOfString);
    function  categories_Specified(Index: Integer): boolean;
    procedure Setwebsites(Index: Integer; const AArrayOfString: ArrayOfString);
    function  websites_Specified(Index: Integer): boolean;
    procedure Setcreated_at(Index: Integer; const Astring: string);
    function  created_at_Specified(Index: Integer): boolean;
    procedure Setupdated_at(Index: Integer; const Astring: string);
    function  updated_at_Specified(Index: Integer): boolean;
    procedure Settype_id(Index: Integer; const Astring: string);
    function  type_id_Specified(Index: Integer): boolean;
    procedure Setname_(Index: Integer; const Astring: string);
    function  name__Specified(Index: Integer): boolean;
    procedure Setdescription(Index: Integer; const Astring: string);
    function  description_Specified(Index: Integer): boolean;
    procedure Setshort_description(Index: Integer; const Astring: string);
    function  short_description_Specified(Index: Integer): boolean;
    procedure Setweight(Index: Integer; const Astring: string);
    function  weight_Specified(Index: Integer): boolean;
    procedure Setstatus(Index: Integer; const Astring: string);
    function  status_Specified(Index: Integer): boolean;
    procedure Seturl_key(Index: Integer; const Astring: string);
    function  url_key_Specified(Index: Integer): boolean;
    procedure Seturl_path(Index: Integer; const Astring: string);
    function  url_path_Specified(Index: Integer): boolean;
    procedure Setvisibility(Index: Integer; const Astring: string);
    function  visibility_Specified(Index: Integer): boolean;
    procedure Setcategory_ids(Index: Integer; const AArrayOfString: ArrayOfString);
    function  category_ids_Specified(Index: Integer): boolean;
    procedure Setwebsite_ids(Index: Integer; const AArrayOfString: ArrayOfString);
    function  website_ids_Specified(Index: Integer): boolean;
    procedure Sethas_options(Index: Integer; const Astring: string);
    function  has_options_Specified(Index: Integer): boolean;
    procedure Setgift_message_available(Index: Integer; const Astring: string);
    function  gift_message_available_Specified(Index: Integer): boolean;
    procedure Setprice(Index: Integer; const Astring: string);
    function  price_Specified(Index: Integer): boolean;
    procedure Setspecial_price(Index: Integer; const Astring: string);
    function  special_price_Specified(Index: Integer): boolean;
    procedure Setspecial_from_date(Index: Integer; const Astring: string);
    function  special_from_date_Specified(Index: Integer): boolean;
    procedure Setspecial_to_date(Index: Integer; const Astring: string);
    function  special_to_date_Specified(Index: Integer): boolean;
    procedure Settax_class_id(Index: Integer; const Astring: string);
    function  tax_class_id_Specified(Index: Integer): boolean;
    procedure Settier_price(Index: Integer; const AcatalogProductTierPriceEntityArray: catalogProductTierPriceEntityArray);
    function  tier_price_Specified(Index: Integer): boolean;
    procedure Setmeta_title(Index: Integer; const Astring: string);
    function  meta_title_Specified(Index: Integer): boolean;
    procedure Setmeta_keyword(Index: Integer; const Astring: string);
    function  meta_keyword_Specified(Index: Integer): boolean;
    procedure Setmeta_description(Index: Integer; const Astring: string);
    function  meta_description_Specified(Index: Integer): boolean;
    procedure Setcustom_design(Index: Integer; const Astring: string);
    function  custom_design_Specified(Index: Integer): boolean;
    procedure Setcustom_layout_update(Index: Integer; const Astring: string);
    function  custom_layout_update_Specified(Index: Integer): boolean;
    procedure Setoptions_container(Index: Integer; const Astring: string);
    function  options_container_Specified(Index: Integer): boolean;
    procedure Setadditional_attributes(Index: Integer; const AassociativeArray: associativeArray);
    function  additional_attributes_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property product_id:             string                              Index (IS_OPTN) read Fproduct_id write Setproduct_id stored product_id_Specified;
    property sku:                    string                              Index (IS_OPTN) read Fsku write Setsku stored sku_Specified;
    property set_:                   string                              Index (IS_OPTN) read Fset_ write Setset_ stored set__Specified;
    property type_:                  string                              Index (IS_OPTN) read Ftype_ write Settype_ stored type__Specified;
    property categories:             ArrayOfString                       Index (IS_OPTN) read Fcategories write Setcategories stored categories_Specified;
    property websites:               ArrayOfString                       Index (IS_OPTN) read Fwebsites write Setwebsites stored websites_Specified;
    property created_at:             string                              Index (IS_OPTN) read Fcreated_at write Setcreated_at stored created_at_Specified;
    property updated_at:             string                              Index (IS_OPTN) read Fupdated_at write Setupdated_at stored updated_at_Specified;
    property type_id:                string                              Index (IS_OPTN) read Ftype_id write Settype_id stored type_id_Specified;
    property name_:                  string                              Index (IS_OPTN) read Fname_ write Setname_ stored name__Specified;
    property description:            string                              Index (IS_OPTN) read Fdescription write Setdescription stored description_Specified;
    property short_description:      string                              Index (IS_OPTN) read Fshort_description write Setshort_description stored short_description_Specified;
    property weight:                 string                              Index (IS_OPTN) read Fweight write Setweight stored weight_Specified;
    property status:                 string                              Index (IS_OPTN) read Fstatus write Setstatus stored status_Specified;
    property url_key:                string                              Index (IS_OPTN) read Furl_key write Seturl_key stored url_key_Specified;
    property url_path:               string                              Index (IS_OPTN) read Furl_path write Seturl_path stored url_path_Specified;
    property visibility:             string                              Index (IS_OPTN) read Fvisibility write Setvisibility stored visibility_Specified;
    property category_ids:           ArrayOfString                       Index (IS_OPTN) read Fcategory_ids write Setcategory_ids stored category_ids_Specified;
    property website_ids:            ArrayOfString                       Index (IS_OPTN) read Fwebsite_ids write Setwebsite_ids stored website_ids_Specified;
    property has_options:            string                              Index (IS_OPTN) read Fhas_options write Sethas_options stored has_options_Specified;
    property gift_message_available: string                              Index (IS_OPTN) read Fgift_message_available write Setgift_message_available stored gift_message_available_Specified;
    property price:                  string                              Index (IS_OPTN) read Fprice write Setprice stored price_Specified;
    property special_price:          string                              Index (IS_OPTN) read Fspecial_price write Setspecial_price stored special_price_Specified;
    property special_from_date:      string                              Index (IS_OPTN) read Fspecial_from_date write Setspecial_from_date stored special_from_date_Specified;
    property special_to_date:        string                              Index (IS_OPTN) read Fspecial_to_date write Setspecial_to_date stored special_to_date_Specified;
    property tax_class_id:           string                              Index (IS_OPTN) read Ftax_class_id write Settax_class_id stored tax_class_id_Specified;
    property tier_price:             catalogProductTierPriceEntityArray  Index (IS_OPTN) read Ftier_price write Settier_price stored tier_price_Specified;
    property meta_title:             string                              Index (IS_OPTN) read Fmeta_title write Setmeta_title stored meta_title_Specified;
    property meta_keyword:           string                              Index (IS_OPTN) read Fmeta_keyword write Setmeta_keyword stored meta_keyword_Specified;
    property meta_description:       string                              Index (IS_OPTN) read Fmeta_description write Setmeta_description stored meta_description_Specified;
    property custom_design:          string                              Index (IS_OPTN) read Fcustom_design write Setcustom_design stored custom_design_Specified;
    property custom_layout_update:   string                              Index (IS_OPTN) read Fcustom_layout_update write Setcustom_layout_update stored custom_layout_update_Specified;
    property options_container:      string                              Index (IS_OPTN) read Foptions_container write Setoptions_container stored options_container_Specified;
    property additional_attributes:  associativeArray                    Index (IS_OPTN) read Fadditional_attributes write Setadditional_attributes stored additional_attributes_Specified;
  end;



  // ************************************************************************ //
  // XML       : catalogProductRequestAttributes, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogProductRequestAttributes = class(TRemotable)
  private
    Fattributes: ArrayOfString;
    Fattributes_Specified: boolean;
    Fadditional_attributes: ArrayOfString;
    Fadditional_attributes_Specified: boolean;
    procedure Setattributes(Index: Integer; const AArrayOfString: ArrayOfString);
    function  attributes_Specified(Index: Integer): boolean;
    procedure Setadditional_attributes(Index: Integer; const AArrayOfString: ArrayOfString);
    function  additional_attributes_Specified(Index: Integer): boolean;
  published
    property attributes:            ArrayOfString  Index (IS_OPTN) read Fattributes write Setattributes stored attributes_Specified;
    property additional_attributes: ArrayOfString  Index (IS_OPTN) read Fadditional_attributes write Setadditional_attributes stored additional_attributes_Specified;
  end;

  ArrayOfCatalogCategoryEntitiesNoChildren = array of catalogCategoryEntityNoChildren;   { "urn:Magento"[GblCplx] }


  // ************************************************************************ //
  // XML       : catalogCategoryEntityCreate, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogCategoryEntityCreate = class(TRemotable)
  private
    Fname_: string;
    Fname__Specified: boolean;
    Fis_active: Integer;
    Fis_active_Specified: boolean;
    Fposition: Integer;
    Fposition_Specified: boolean;
    Favailable_sort_by: ArrayOfString;
    Favailable_sort_by_Specified: boolean;
    Fcustom_design: string;
    Fcustom_design_Specified: boolean;
    Fcustom_design_apply: Integer;
    Fcustom_design_apply_Specified: boolean;
    Fcustom_design_from: string;
    Fcustom_design_from_Specified: boolean;
    Fcustom_design_to: string;
    Fcustom_design_to_Specified: boolean;
    Fcustom_layout_update: string;
    Fcustom_layout_update_Specified: boolean;
    Fdefault_sort_by: string;
    Fdefault_sort_by_Specified: boolean;
    Fdescription: string;
    Fdescription_Specified: boolean;
    Fdisplay_mode: string;
    Fdisplay_mode_Specified: boolean;
    Fis_anchor: Integer;
    Fis_anchor_Specified: boolean;
    Flanding_page: Integer;
    Flanding_page_Specified: boolean;
    Fmeta_description: string;
    Fmeta_description_Specified: boolean;
    Fmeta_keywords: string;
    Fmeta_keywords_Specified: boolean;
    Fmeta_title: string;
    Fmeta_title_Specified: boolean;
    Fpage_layout: string;
    Fpage_layout_Specified: boolean;
    Furl_key: string;
    Furl_key_Specified: boolean;
    Finclude_in_menu: Integer;
    Finclude_in_menu_Specified: boolean;
    procedure Setname_(Index: Integer; const Astring: string);
    function  name__Specified(Index: Integer): boolean;
    procedure Setis_active(Index: Integer; const AInteger: Integer);
    function  is_active_Specified(Index: Integer): boolean;
    procedure Setposition(Index: Integer; const AInteger: Integer);
    function  position_Specified(Index: Integer): boolean;
    procedure Setavailable_sort_by(Index: Integer; const AArrayOfString: ArrayOfString);
    function  available_sort_by_Specified(Index: Integer): boolean;
    procedure Setcustom_design(Index: Integer; const Astring: string);
    function  custom_design_Specified(Index: Integer): boolean;
    procedure Setcustom_design_apply(Index: Integer; const AInteger: Integer);
    function  custom_design_apply_Specified(Index: Integer): boolean;
    procedure Setcustom_design_from(Index: Integer; const Astring: string);
    function  custom_design_from_Specified(Index: Integer): boolean;
    procedure Setcustom_design_to(Index: Integer; const Astring: string);
    function  custom_design_to_Specified(Index: Integer): boolean;
    procedure Setcustom_layout_update(Index: Integer; const Astring: string);
    function  custom_layout_update_Specified(Index: Integer): boolean;
    procedure Setdefault_sort_by(Index: Integer; const Astring: string);
    function  default_sort_by_Specified(Index: Integer): boolean;
    procedure Setdescription(Index: Integer; const Astring: string);
    function  description_Specified(Index: Integer): boolean;
    procedure Setdisplay_mode(Index: Integer; const Astring: string);
    function  display_mode_Specified(Index: Integer): boolean;
    procedure Setis_anchor(Index: Integer; const AInteger: Integer);
    function  is_anchor_Specified(Index: Integer): boolean;
    procedure Setlanding_page(Index: Integer; const AInteger: Integer);
    function  landing_page_Specified(Index: Integer): boolean;
    procedure Setmeta_description(Index: Integer; const Astring: string);
    function  meta_description_Specified(Index: Integer): boolean;
    procedure Setmeta_keywords(Index: Integer; const Astring: string);
    function  meta_keywords_Specified(Index: Integer): boolean;
    procedure Setmeta_title(Index: Integer; const Astring: string);
    function  meta_title_Specified(Index: Integer): boolean;
    procedure Setpage_layout(Index: Integer; const Astring: string);
    function  page_layout_Specified(Index: Integer): boolean;
    procedure Seturl_key(Index: Integer; const Astring: string);
    function  url_key_Specified(Index: Integer): boolean;
    procedure Setinclude_in_menu(Index: Integer; const AInteger: Integer);
    function  include_in_menu_Specified(Index: Integer): boolean;
  published
    property name_:                string         Index (IS_OPTN) read Fname_ write Setname_ stored name__Specified;
    property is_active:            Integer        Index (IS_OPTN) read Fis_active write Setis_active stored is_active_Specified;
    property position:             Integer        Index (IS_OPTN) read Fposition write Setposition stored position_Specified;
    property available_sort_by:    ArrayOfString  Index (IS_OPTN) read Favailable_sort_by write Setavailable_sort_by stored available_sort_by_Specified;
    property custom_design:        string         Index (IS_OPTN) read Fcustom_design write Setcustom_design stored custom_design_Specified;
    property custom_design_apply:  Integer        Index (IS_OPTN) read Fcustom_design_apply write Setcustom_design_apply stored custom_design_apply_Specified;
    property custom_design_from:   string         Index (IS_OPTN) read Fcustom_design_from write Setcustom_design_from stored custom_design_from_Specified;
    property custom_design_to:     string         Index (IS_OPTN) read Fcustom_design_to write Setcustom_design_to stored custom_design_to_Specified;
    property custom_layout_update: string         Index (IS_OPTN) read Fcustom_layout_update write Setcustom_layout_update stored custom_layout_update_Specified;
    property default_sort_by:      string         Index (IS_OPTN) read Fdefault_sort_by write Setdefault_sort_by stored default_sort_by_Specified;
    property description:          string         Index (IS_OPTN) read Fdescription write Setdescription stored description_Specified;
    property display_mode:         string         Index (IS_OPTN) read Fdisplay_mode write Setdisplay_mode stored display_mode_Specified;
    property is_anchor:            Integer        Index (IS_OPTN) read Fis_anchor write Setis_anchor stored is_anchor_Specified;
    property landing_page:         Integer        Index (IS_OPTN) read Flanding_page write Setlanding_page stored landing_page_Specified;
    property meta_description:     string         Index (IS_OPTN) read Fmeta_description write Setmeta_description stored meta_description_Specified;
    property meta_keywords:        string         Index (IS_OPTN) read Fmeta_keywords write Setmeta_keywords stored meta_keywords_Specified;
    property meta_title:           string         Index (IS_OPTN) read Fmeta_title write Setmeta_title stored meta_title_Specified;
    property page_layout:          string         Index (IS_OPTN) read Fpage_layout write Setpage_layout stored page_layout_Specified;
    property url_key:              string         Index (IS_OPTN) read Furl_key write Seturl_key stored url_key_Specified;
    property include_in_menu:      Integer        Index (IS_OPTN) read Finclude_in_menu write Setinclude_in_menu stored include_in_menu_Specified;
  end;



  // ************************************************************************ //
  // XML       : catalogAssignedProduct, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogAssignedProduct = class(TRemotable)
  private
    Fproduct_id: Integer;
    Ftype_: string;
    Fset_: Integer;
    Fsku: string;
    Fposition: Integer;
  published
    property product_id: Integer  read Fproduct_id write Fproduct_id;
    property type_:      string   read Ftype_ write Ftype_;
    property set_:       Integer  read Fset_ write Fset_;
    property sku:        string   read Fsku write Fsku;
    property position:   Integer  read Fposition write Fposition;
  end;



  // ************************************************************************ //
  // XML       : catalogCategoryInfo, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogCategoryInfo = class(TRemotable)
  private
    Fcategory_id: string;
    Fis_active: Integer;
    Fposition: string;
    Flevel: string;
    Fparent_id: string;
    Fall_children: string;
    Fchildren: string;
    Fcreated_at: string;
    Fcreated_at_Specified: boolean;
    Fupdated_at: string;
    Fupdated_at_Specified: boolean;
    Fname_: string;
    Fname__Specified: boolean;
    Furl_key: string;
    Furl_key_Specified: boolean;
    Fdescription: string;
    Fdescription_Specified: boolean;
    Fmeta_title: string;
    Fmeta_title_Specified: boolean;
    Fmeta_keywords: string;
    Fmeta_keywords_Specified: boolean;
    Fmeta_description: string;
    Fmeta_description_Specified: boolean;
    Fpath: string;
    Fpath_Specified: boolean;
    Furl_path: string;
    Furl_path_Specified: boolean;
    Fchildren_count: Integer;
    Fchildren_count_Specified: boolean;
    Fdisplay_mode: string;
    Fdisplay_mode_Specified: boolean;
    Fis_anchor: Integer;
    Fis_anchor_Specified: boolean;
    Favailable_sort_by: ArrayOfString;
    Favailable_sort_by_Specified: boolean;
    Fcustom_design: string;
    Fcustom_design_Specified: boolean;
    Fcustom_design_apply: string;
    Fcustom_design_apply_Specified: boolean;
    Fcustom_design_from: string;
    Fcustom_design_from_Specified: boolean;
    Fcustom_design_to: string;
    Fcustom_design_to_Specified: boolean;
    Fpage_layout: string;
    Fpage_layout_Specified: boolean;
    Fcustom_layout_update: string;
    Fcustom_layout_update_Specified: boolean;
    Fdefault_sort_by: string;
    Fdefault_sort_by_Specified: boolean;
    Flanding_page: Integer;
    Flanding_page_Specified: boolean;
    procedure Setcreated_at(Index: Integer; const Astring: string);
    function  created_at_Specified(Index: Integer): boolean;
    procedure Setupdated_at(Index: Integer; const Astring: string);
    function  updated_at_Specified(Index: Integer): boolean;
    procedure Setname_(Index: Integer; const Astring: string);
    function  name__Specified(Index: Integer): boolean;
    procedure Seturl_key(Index: Integer; const Astring: string);
    function  url_key_Specified(Index: Integer): boolean;
    procedure Setdescription(Index: Integer; const Astring: string);
    function  description_Specified(Index: Integer): boolean;
    procedure Setmeta_title(Index: Integer; const Astring: string);
    function  meta_title_Specified(Index: Integer): boolean;
    procedure Setmeta_keywords(Index: Integer; const Astring: string);
    function  meta_keywords_Specified(Index: Integer): boolean;
    procedure Setmeta_description(Index: Integer; const Astring: string);
    function  meta_description_Specified(Index: Integer): boolean;
    procedure Setpath(Index: Integer; const Astring: string);
    function  path_Specified(Index: Integer): boolean;
    procedure Seturl_path(Index: Integer; const Astring: string);
    function  url_path_Specified(Index: Integer): boolean;
    procedure Setchildren_count(Index: Integer; const AInteger: Integer);
    function  children_count_Specified(Index: Integer): boolean;
    procedure Setdisplay_mode(Index: Integer; const Astring: string);
    function  display_mode_Specified(Index: Integer): boolean;
    procedure Setis_anchor(Index: Integer; const AInteger: Integer);
    function  is_anchor_Specified(Index: Integer): boolean;
    procedure Setavailable_sort_by(Index: Integer; const AArrayOfString: ArrayOfString);
    function  available_sort_by_Specified(Index: Integer): boolean;
    procedure Setcustom_design(Index: Integer; const Astring: string);
    function  custom_design_Specified(Index: Integer): boolean;
    procedure Setcustom_design_apply(Index: Integer; const Astring: string);
    function  custom_design_apply_Specified(Index: Integer): boolean;
    procedure Setcustom_design_from(Index: Integer; const Astring: string);
    function  custom_design_from_Specified(Index: Integer): boolean;
    procedure Setcustom_design_to(Index: Integer; const Astring: string);
    function  custom_design_to_Specified(Index: Integer): boolean;
    procedure Setpage_layout(Index: Integer; const Astring: string);
    function  page_layout_Specified(Index: Integer): boolean;
    procedure Setcustom_layout_update(Index: Integer; const Astring: string);
    function  custom_layout_update_Specified(Index: Integer): boolean;
    procedure Setdefault_sort_by(Index: Integer; const Astring: string);
    function  default_sort_by_Specified(Index: Integer): boolean;
    procedure Setlanding_page(Index: Integer; const AInteger: Integer);
    function  landing_page_Specified(Index: Integer): boolean;
  published
    property category_id:          string         read Fcategory_id write Fcategory_id;
    property is_active:            Integer        read Fis_active write Fis_active;
    property position:             string         read Fposition write Fposition;
    property level:                string         read Flevel write Flevel;
    property parent_id:            string         read Fparent_id write Fparent_id;
    property all_children:         string         read Fall_children write Fall_children;
    property children:             string         read Fchildren write Fchildren;
    property created_at:           string         Index (IS_OPTN) read Fcreated_at write Setcreated_at stored created_at_Specified;
    property updated_at:           string         Index (IS_OPTN) read Fupdated_at write Setupdated_at stored updated_at_Specified;
    property name_:                string         Index (IS_OPTN) read Fname_ write Setname_ stored name__Specified;
    property url_key:              string         Index (IS_OPTN) read Furl_key write Seturl_key stored url_key_Specified;
    property description:          string         Index (IS_OPTN) read Fdescription write Setdescription stored description_Specified;
    property meta_title:           string         Index (IS_OPTN) read Fmeta_title write Setmeta_title stored meta_title_Specified;
    property meta_keywords:        string         Index (IS_OPTN) read Fmeta_keywords write Setmeta_keywords stored meta_keywords_Specified;
    property meta_description:     string         Index (IS_OPTN) read Fmeta_description write Setmeta_description stored meta_description_Specified;
    property path:                 string         Index (IS_OPTN) read Fpath write Setpath stored path_Specified;
    property url_path:             string         Index (IS_OPTN) read Furl_path write Seturl_path stored url_path_Specified;
    property children_count:       Integer        Index (IS_OPTN) read Fchildren_count write Setchildren_count stored children_count_Specified;
    property display_mode:         string         Index (IS_OPTN) read Fdisplay_mode write Setdisplay_mode stored display_mode_Specified;
    property is_anchor:            Integer        Index (IS_OPTN) read Fis_anchor write Setis_anchor stored is_anchor_Specified;
    property available_sort_by:    ArrayOfString  Index (IS_OPTN) read Favailable_sort_by write Setavailable_sort_by stored available_sort_by_Specified;
    property custom_design:        string         Index (IS_OPTN) read Fcustom_design write Setcustom_design stored custom_design_Specified;
    property custom_design_apply:  string         Index (IS_OPTN) read Fcustom_design_apply write Setcustom_design_apply stored custom_design_apply_Specified;
    property custom_design_from:   string         Index (IS_OPTN) read Fcustom_design_from write Setcustom_design_from stored custom_design_from_Specified;
    property custom_design_to:     string         Index (IS_OPTN) read Fcustom_design_to write Setcustom_design_to stored custom_design_to_Specified;
    property page_layout:          string         Index (IS_OPTN) read Fpage_layout write Setpage_layout stored page_layout_Specified;
    property custom_layout_update: string         Index (IS_OPTN) read Fcustom_layout_update write Setcustom_layout_update stored custom_layout_update_Specified;
    property default_sort_by:      string         Index (IS_OPTN) read Fdefault_sort_by write Setdefault_sort_by stored default_sort_by_Specified;
    property landing_page:         Integer        Index (IS_OPTN) read Flanding_page write Setlanding_page stored landing_page_Specified;
  end;



  // ************************************************************************ //
  // XML       : catalogCategoryEntityNoChildren, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogCategoryEntityNoChildren = class(TRemotable)
  private
    Fcategory_id: Integer;
    Fparent_id: Integer;
    Fname_: string;
    Fis_active: Integer;
    Fposition: Integer;
    Flevel: Integer;
  published
    property category_id: Integer  read Fcategory_id write Fcategory_id;
    property parent_id:   Integer  read Fparent_id write Fparent_id;
    property name_:       string   read Fname_ write Fname_;
    property is_active:   Integer  read Fis_active write Fis_active;
    property position:    Integer  read Fposition write Fposition;
    property level:       Integer  read Flevel write Flevel;
  end;

  catalogProductTypeEntityArray = array of catalogProductTypeEntity;   { "urn:Magento"[GblCplx] }


  // ************************************************************************ //
  // XML       : catalogProductTypeEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogProductTypeEntity = class(TRemotable)
  private
    Ftype_: string;
    Ftype__Specified: boolean;
    Flabel_: string;
    Flabel__Specified: boolean;
    procedure Settype_(Index: Integer; const Astring: string);
    function  type__Specified(Index: Integer): boolean;
    procedure Setlabel_(Index: Integer; const Astring: string);
    function  label__Specified(Index: Integer): boolean;
  published
    property type_:  string  Index (IS_OPTN) read Ftype_ write Settype_ stored type__Specified;
    property label_: string  Index (IS_OPTN) read Flabel_ write Setlabel_ stored label__Specified;
  end;



  // ************************************************************************ //
  // XML       : catalogProductTierPriceEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogProductTierPriceEntity = class(TRemotable)
  private
    Fcustomer_group_id: string;
    Fcustomer_group_id_Specified: boolean;
    Fwebsite: string;
    Fwebsite_Specified: boolean;
    Fqty: Integer;
    Fqty_Specified: boolean;
    Fprice: Double;
    Fprice_Specified: boolean;
    procedure Setcustomer_group_id(Index: Integer; const Astring: string);
    function  customer_group_id_Specified(Index: Integer): boolean;
    procedure Setwebsite(Index: Integer; const Astring: string);
    function  website_Specified(Index: Integer): boolean;
    procedure Setqty(Index: Integer; const AInteger: Integer);
    function  qty_Specified(Index: Integer): boolean;
    procedure Setprice(Index: Integer; const ADouble: Double);
    function  price_Specified(Index: Integer): boolean;
  published
    property customer_group_id: string   Index (IS_OPTN) read Fcustomer_group_id write Setcustomer_group_id stored customer_group_id_Specified;
    property website:           string   Index (IS_OPTN) read Fwebsite write Setwebsite stored website_Specified;
    property qty:               Integer  Index (IS_OPTN) read Fqty write Setqty stored qty_Specified;
    property price:             Double   Index (IS_OPTN) read Fprice write Setprice stored price_Specified;
  end;

  ArrayOfCatalogCategoryEntities = array of catalogCategoryEntity;   { "urn:Magento"[GblCplx] }


  // ************************************************************************ //
  // XML       : catalogCategoryEntity, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogCategoryEntity = class(TRemotable)
  private
    Fcategory_id: Integer;
    Fparent_id: Integer;
    Fname_: string;
    Fis_active: Integer;
    Fposition: Integer;
    Flevel: Integer;
    Fchildren: ArrayOfCatalogCategoryEntities;
  public
    destructor Destroy; override;
  published
    property category_id: Integer                         read Fcategory_id write Fcategory_id;
    property parent_id:   Integer                         read Fparent_id write Fparent_id;
    property name_:       string                          read Fname_ write Fname_;
    property is_active:   Integer                         read Fis_active write Fis_active;
    property position:    Integer                         read Fposition write Fposition;
    property level:       Integer                         read Flevel write Flevel;
    property children:    ArrayOfCatalogCategoryEntities  read Fchildren write Fchildren;
  end;



  // ************************************************************************ //
  // XML       : catalogCategoryTree, global, <complexType>
  // Namespace : urn:Magento
  // ************************************************************************ //
  catalogCategoryTree = class(TRemotable)
  private
    Fcategory_id: Integer;
    Fparent_id: Integer;
    Fname_: string;
    Fposition: Integer;
    Flevel: Integer;
    Fchildren: ArrayOfCatalogCategoryEntities;
  public
    destructor Destroy; override;
  published
    property category_id: Integer                         read Fcategory_id write Fcategory_id;
    property parent_id:   Integer                         read Fparent_id write Fparent_id;
    property name_:       string                          read Fname_ write Fname_;
    property position:    Integer                         read Fposition write Fposition;
    property level:       Integer                         read Flevel write Flevel;
    property children:    ArrayOfCatalogCategoryEntities  read Fchildren write Fchildren;
  end;


  // ************************************************************************ //
  // Namespace : urn:Magento
  // soapAction: urn:Mage_Api_Model_Server_V2_HandlerAction
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // use       : encoded
  // binding   : Mage_Api_Model_Server_V2_HandlerBinding
  // service   : MagentoService
  // port      : Mage_Api_Model_Server_V2_HandlerPort
  // URL       : http://homologacao.seton.com.br/index.php/api/v2_soap/index/
  // ************************************************************************ //
  Mage_Api_Model_Server_V2_HandlerPortType = interface(IInvokable)
  ['{C4BB7B25-69BA-B78A-B4D7-30A05EEC29CD}']
    function  endSession(const sessionId: string): Boolean; stdcall;
    function  login(const username: string; const apiKey: string): string; stdcall;
    function  startSession: string; stdcall;
    function  resources(const sessionId: string): ArrayOfApis; stdcall;
    function  globalFaults(const sessionId: string): ArrayOfExistsFaltures; stdcall;
    function  resourceFaults(const resourceName: string; const sessionId: string): ArrayOfExistsFaltures; stdcall;
    function  storeList(const sessionId: string): storeEntityArray; stdcall;
    function  storeInfo(const sessionId: string; const storeId: string): storeEntity; stdcall;
    function  magentoInfo(const sessionId: string): magentoInfoEntity; stdcall;
    function  directoryCountryList(const sessionId: string): directoryCountryEntityArray; stdcall;
    function  directoryRegionList(const sessionId: string; const country: string): directoryRegionEntityArray; stdcall;
    function  customerCustomerList(const sessionId: string; const filters: filters): customerCustomerEntityArray; stdcall;
    function  customerCustomerCreate(const sessionId: string; const customerData: customerCustomerEntityToCreate): Integer; stdcall;
    function  customerCustomerInfo(const sessionId: string; const customerId: Integer; const attributes: ArrayOfString): customerCustomerEntity; stdcall;
    function  customerCustomerUpdate(const sessionId: string; const customerId: Integer; const customerData: customerCustomerEntityToCreate): Boolean; stdcall;
    function  customerCustomerDelete(const sessionId: string; const customerId: Integer): Boolean; stdcall;
    function  customerGroupList(const sessionId: string): customerGroupEntityArray; stdcall;
    function  customerAddressList(const sessionId: string; const customerId: Integer): customerAddressEntityArray; stdcall;
    function  customerAddressCreate(const sessionId: string; const customerId: Integer; const addressData: customerAddressEntityCreate): Integer; stdcall;
    function  customerAddressInfo(const sessionId: string; const addressId: Integer): customerAddressEntityItem; stdcall;
    function  customerAddressUpdate(const sessionId: string; const addressId: Integer; const addressData: customerAddressEntityCreate): Boolean; stdcall;
    function  customerAddressDelete(const sessionId: string; const addressId: Integer): Boolean; stdcall;
    function  catalogCategoryCurrentStore(const sessionId: string; const storeView: string): Integer; stdcall;
    function  catalogCategoryTree(const sessionId: string; const parentId: string; const storeView: string): catalogCategoryTree; stdcall;
    function  catalogCategoryLevel(const sessionId: string; const website: string; const storeView: string; const parentCategory: string): ArrayOfCatalogCategoryEntitiesNoChildren; stdcall;
    function  catalogCategoryInfo(const sessionId: string; const categoryId: Integer; const storeView: string; const attributes: ArrayOfString): catalogCategoryInfo; stdcall;
    function  catalogCategoryCreate(const sessionId: string; const parentId: Integer; const categoryData: catalogCategoryEntityCreate; const storeView: string): Integer; stdcall;
    function  catalogCategoryUpdate(const sessionId: string; const categoryId: Integer; const categoryData: catalogCategoryEntityCreate; const storeView: string): Boolean; stdcall;
    function  catalogCategoryMove(const sessionId: string; const categoryId: Integer; const parentId: Integer; const afterId: string): Boolean; stdcall;
    function  catalogCategoryDelete(const sessionId: string; const categoryId: Integer): Boolean; stdcall;
    function  catalogCategoryAssignedProducts(const sessionId: string; const categoryId: Integer): catalogAssignedProductArray; stdcall;
    function  catalogCategoryAssignProduct(const sessionId: string; const categoryId: Integer; const product: string; const position: string; const identifierType: string): Boolean; stdcall;
    function  catalogCategoryUpdateProduct(const sessionId: string; const categoryId: Integer; const product: string; const position: string; const identifierType: string): Boolean; stdcall;
    function  catalogCategoryRemoveProduct(const sessionId: string; const categoryId: Integer; const product: string; const identifierType: string): Boolean; stdcall;
    function  catalogCategoryAttributeCurrentStore(const sessionId: string; const storeView: string): Integer; stdcall;
    function  catalogCategoryAttributeList(const sessionId: string): catalogAttributeEntityArray; stdcall;
    function  catalogCategoryAttributeOptions(const sessionId: string; const attributeId: string; const storeView: string): catalogAttributeOptionEntityArray; stdcall;
    function  catalogProductCurrentStore(const sessionId: string; const storeView: string): Integer; stdcall;
    function  catalogProductList(const sessionId: string; const filters: filters; const storeView: string): catalogProductEntityArray; stdcall;
    function  catalogProductInfo(const sessionId: string; const productId: string; const storeView: string; const attributes: catalogProductRequestAttributes; const identifierType: string): catalogProductReturnEntity; stdcall;
    function  catalogProductCreate(const sessionId: string; const type_: string; const set_: string; const sku: string; const productData: catalogProductCreateEntity; const storeView: string
                                   ): Integer; stdcall;
    function  catalogProductUpdate(const sessionId: string; const product: string; const productData: catalogProductCreateEntity; const storeView: string; const identifierType: string): Boolean; stdcall;
    function  catalogProductMultiUpdate(const sessionId: string; const productIds: ArrayOfString; const productData: catalogProductCreateEntityArray; const store: string; const identifierType: string): Boolean; stdcall;
    function  catalogProductSetSpecialPrice(const sessionId: string; const product: string; const specialPrice: string; const fromDate: string; const toDate: string; const storeView: string; 
                                            const identifierType: string): Integer; stdcall;
    function  catalogProductGetSpecialPrice(const sessionId: string; const product: string; const storeView: string; const identifierType: string): catalogProductSpecialPriceReturnEntity; stdcall;
    function  catalogProductDelete(const sessionId: string; const product: string; const identifierType: string): Integer; stdcall;
    function  catalogProductAttributeCurrentStore(const sessionId: string; const storeView: string): Integer; stdcall;
    function  catalogProductListOfAdditionalAttributes(const sessionId: string; const productType: string; const attributeSetId: string): catalogAttributeEntityArray; stdcall;
    function  catalogProductAttributeList(const sessionId: string; const setId: Integer): catalogAttributeEntityArray; stdcall;
    function  catalogProductAttributeOptions(const sessionId: string; const attributeId: string; const storeView: string): catalogAttributeOptionEntityArray; stdcall;
    function  catalogProductAttributeSetCreate(const sessionId: string; const attributeSetName: string; const skeletonSetId: string): Integer; stdcall;
    function  catalogProductAttributeSetRemove(const sessionId: string; const attributeSetId: string; const forceProductsRemove: string): Boolean; stdcall;
    function  catalogProductAttributeSetList(const sessionId: string): catalogProductAttributeSetEntityArray; stdcall;
    function  catalogProductAttributeSetAttributeAdd(const sessionId: string; const attributeId: string; const attributeSetId: string; const attributeGroupId: string; const sortOrder: string): Boolean; stdcall;
    function  catalogProductAttributeSetAttributeRemove(const sessionId: string; const attributeId: string; const attributeSetId: string): Boolean; stdcall;
    function  catalogProductAttributeSetGroupAdd(const sessionId: string; const attributeSetId: string; const groupName: string): Integer; stdcall;
    function  catalogProductAttributeSetGroupRename(const sessionId: string; const groupId: string; const groupName: string): Boolean; stdcall;
    function  catalogProductAttributeSetGroupRemove(const sessionId: string; const attributeGroupId: string): Boolean; stdcall;
    function  catalogProductAttributeTypes(const sessionId: string): catalogAttributeOptionEntityArray; stdcall;
    function  catalogProductAttributeCreate(const sessionId: string; const data: catalogProductAttributeEntityToCreate): Integer; stdcall;
    function  catalogProductAttributeRemove(const sessionId: string; const attribute: string): Boolean; stdcall;
    function  catalogProductAttributeInfo(const sessionId: string; const attribute: string): catalogProductAttributeEntity; stdcall;
    function  catalogProductAttributeUpdate(const sessionId: string; const attribute: string; const data: catalogProductAttributeEntityToUpdate): Boolean; stdcall;
    function  catalogProductAttributeAddOption(const sessionId: string; const attribute: string; const data: catalogProductAttributeOptionEntityToAdd): Boolean; stdcall;
    function  catalogProductAttributeRemoveOption(const sessionId: string; const attribute: string; const optionId: string): Boolean; stdcall;
    function  catalogProductTypeList(const sessionId: string): catalogProductTypeEntityArray; stdcall;
    function  catalogProductAttributeTierPriceInfo(const sessionId: string; const product: string; const identifierType: string): catalogProductTierPriceEntityArray; stdcall;
    function  catalogProductAttributeTierPriceUpdate(const sessionId: string; const product: string; const tier_price: catalogProductTierPriceEntityArray; const identifierType: string): Integer; stdcall;
    function  catalogProductAttributeMediaCurrentStore(const sessionId: string; const storeView: string): Integer; stdcall;
    function  catalogProductAttributeMediaList(const sessionId: string; const product: string; const storeView: string; const identifierType: string): catalogProductImageEntityArray; stdcall;
    function  catalogProductAttributeMediaInfo(const sessionId: string; const product: string; const file_: string; const storeView: string; const identifierType: string): catalogProductImageEntity; stdcall;
    function  catalogProductAttributeMediaTypes(const sessionId: string; const setId: string): catalogProductAttributeMediaTypeEntityArray; stdcall;
    function  catalogProductAttributeMediaCreate(const sessionId: string; const product: string; const data: catalogProductAttributeMediaCreateEntity; const storeView: string; const identifierType: string): string; stdcall;
    function  catalogProductAttributeMediaUpdate(const sessionId: string; const product: string; const file_: string; const data: catalogProductAttributeMediaCreateEntity; const storeView: string; const identifierType: string
                                                 ): Boolean; stdcall;
    function  catalogProductAttributeMediaRemove(const sessionId: string; const product: string; const file_: string; const identifierType: string): Boolean; stdcall;
    function  catalogProductLinkList(const sessionId: string; const type_: string; const product: string; const identifierType: string): catalogProductLinkEntityArray; stdcall;
    function  catalogProductLinkAssign(const sessionId: string; const type_: string; const product: string; const linkedProduct: string; const data: catalogProductLinkEntity; const identifierType: string
                                       ): Boolean; stdcall;
    function  catalogProductLinkUpdate(const sessionId: string; const type_: string; const product: string; const linkedProduct: string; const data: catalogProductLinkEntity; const identifierType: string
                                       ): Boolean; stdcall;
    function  catalogProductLinkRemove(const sessionId: string; const type_: string; const product: string; const linkedProduct: string; const identifierType: string): Boolean; stdcall;
    function  catalogProductLinkTypes(const sessionId: string): ArrayOfString; stdcall;
    function  catalogProductLinkAttributes(const sessionId: string; const type_: string): catalogProductLinkAttributeEntityArray; stdcall;
    function  catalogProductCustomOptionAdd(const sessionId: string; const productId: string; const data: catalogProductCustomOptionToAdd; const store: string): Boolean; stdcall;
    function  catalogProductCustomOptionUpdate(const sessionId: string; const optionId: string; const data: catalogProductCustomOptionToUpdate; const store: string): Boolean; stdcall;
    function  catalogProductCustomOptionTypes(const sessionId: string): catalogProductCustomOptionTypesArray; stdcall;
    function  catalogProductCustomOptionInfo(const sessionId: string; const optionId: string; const store: string): catalogProductCustomOptionInfoEntity; stdcall;
    function  catalogProductCustomOptionList(const sessionId: string; const productId: string; const store: string): catalogProductCustomOptionListArray; stdcall;
    function  catalogProductCustomOptionRemove(const sessionId: string; const optionId: string): Boolean; stdcall;
    function  catalogProductCustomOptionValueInfo(const sessionId: string; const valueId: string; const store: string): catalogProductCustomOptionValueInfoEntity; stdcall;
    function  catalogProductCustomOptionValueList(const sessionId: string; const optionId: string; const store: string): catalogProductCustomOptionValueListArray; stdcall;
    function  catalogProductCustomOptionValueAdd(const sessionId: string; const optionId: string; const data: catalogProductCustomOptionValueAddArray; const store: string): Boolean; stdcall;
    function  catalogProductCustomOptionValueUpdate(const sessionId: string; const valueId: string; const data: catalogProductCustomOptionValueUpdateEntity; const storeId: string): Boolean; stdcall;
    function  catalogProductCustomOptionValueRemove(const sessionId: string; const valueId: string): Boolean; stdcall;
    function  salesOrderList(const sessionId: string; const filters: filters): salesOrderListEntityArray; stdcall;
    function  salesOrderInfo(const sessionId: string; const orderIncrementId: string): salesOrderEntity; stdcall;
    function  salesOrderAddComment(const sessionId: string; const orderIncrementId: string; const status: string; const comment: string; const notify: string): Boolean; stdcall;
    function  salesOrderHold(const sessionId: string; const orderIncrementId: string): Boolean; stdcall;
    function  salesOrderUnhold(const sessionId: string; const orderIncrementId: string): Boolean; stdcall;
    function  salesOrderCancel(const sessionId: string; const orderIncrementId: string): Boolean; stdcall;
    function  salesOrderShipmentList(const sessionId: string; const filters: filters): salesOrderShipmentEntityArray; stdcall;
    function  salesOrderShipmentInfo(const sessionId: string; const shipmentIncrementId: string): salesOrderShipmentEntity; stdcall;
    function  salesOrderShipmentCreate(const sessionId: string; const orderIncrementId: string; const itemsQty: orderItemIdQtyArray; const comment: string; const email: Integer; const includeComment: Integer
                                       ): string; stdcall;
    function  salesOrderShipmentAddComment(const sessionId: string; const shipmentIncrementId: string; const comment: string; const email: string; const includeInEmail: string): Boolean; stdcall;
    function  salesOrderShipmentAddTrack(const sessionId: string; const shipmentIncrementId: string; const carrier: string; const title: string; const trackNumber: string): Integer; stdcall;
    function  salesOrderShipmentSendInfo(const sessionId: string; const shipmentIncrementId: string; const comment: string): Boolean; stdcall;
    function  salesOrderShipmentRemoveTrack(const sessionId: string; const shipmentIncrementId: string; const trackId: string): Boolean; stdcall;
    function  salesOrderShipmentGetCarriers(const sessionId: string; const orderIncrementId: string): associativeArray; stdcall;
    function  salesOrderInvoiceList(const sessionId: string; const filters: filters): salesOrderInvoiceEntityArray; stdcall;
    function  salesOrderInvoiceInfo(const sessionId: string; const invoiceIncrementId: string): salesOrderInvoiceEntity; stdcall;
    function  salesOrderInvoiceCreate(const sessionId: string; const invoiceIncrementId: string; const itemsQty: orderItemIdQtyArray; const comment: string; const email: string; const includeComment: string
                                      ): string; stdcall;
    function  salesOrderInvoiceAddComment(const sessionId: string; const invoiceIncrementId: string; const comment: string; const email: string; const includeComment: string): Boolean; stdcall;
    function  salesOrderInvoiceCapture(const sessionId: string; const invoiceIncrementId: string): Boolean; stdcall;
    function  salesOrderInvoiceVoid(const sessionId: string; const invoiceIncrementId: string): Boolean; stdcall;
    function  salesOrderInvoiceCancel(const sessionId: string; const invoiceIncrementId: string): Boolean; stdcall;
    function  salesOrderCreditmemoList(const sessionId: string; const filters: filters): salesOrderCreditmemoEntityArray; stdcall;
    function  salesOrderCreditmemoInfo(const sessionId: string; const creditmemoIncrementId: string): salesOrderCreditmemoEntity; stdcall;
    function  salesOrderCreditmemoCreate(const sessionId: string; const orderIncrementId: string; const creditmemoData: salesOrderCreditmemoData; const comment: string; const notifyCustomer: Integer; const includeComment: Integer; 
                                         const refundToStoreCreditAmount: string): string; stdcall;
    function  salesOrderCreditmemoAddComment(const sessionId: string; const creditmemoIncrementId: string; const comment: string; const notifyCustomer: Integer; const includeComment: Integer): Boolean; stdcall;
    function  salesOrderCreditmemoCancel(const sessionId: string; const creditmemoIncrementId: string): Boolean; stdcall;
    function  catalogInventoryStockItemList(const sessionId: string; const products: ArrayOfString): catalogInventoryStockItemEntityArray; stdcall;
    function  catalogInventoryStockItemUpdate(const sessionId: string; const product: string; const data: catalogInventoryStockItemUpdateEntity): Integer; stdcall;
    function  catalogInventoryStockItemMultiUpdate(const sessionId: string; const productIds: ArrayOfString; const productData: catalogInventoryStockItemUpdateEntityArray): Boolean; stdcall;
    function  shoppingCartCreate(const sessionId: string; const storeId: string): Integer; stdcall;
    function  shoppingCartInfo(const sessionId: string; const quoteId: Integer; const storeId: string): shoppingCartInfoEntity; stdcall;
    function  shoppingCartOrder(const sessionId: string; const quoteId: Integer; const storeId: string; const licenses: ArrayOfString): string; stdcall;
    function  shoppingCartTotals(const sessionId: string; const quoteId: Integer; const storeId: string): shoppingCartTotalsEntityArray; stdcall;
    function  shoppingCartLicense(const sessionId: string; const quoteId: Integer; const storeId: string): shoppingCartLicenseEntityArray; stdcall;
    function  shoppingCartProductAdd(const sessionId: string; const quoteId: Integer; const products: shoppingCartProductEntityArray; const storeId: string): Boolean; stdcall;
    function  shoppingCartProductUpdate(const sessionId: string; const quoteId: Integer; const products: shoppingCartProductEntityArray; const storeId: string): Boolean; stdcall;
    function  shoppingCartProductRemove(const sessionId: string; const quoteId: Integer; const products: shoppingCartProductEntityArray; const storeId: string): Boolean; stdcall;
    function  shoppingCartProductList(const sessionId: string; const quoteId: Integer; const storeId: string): shoppingCartProductResponseEntityArray; stdcall;
    function  shoppingCartProductMoveToCustomerQuote(const sessionId: string; const quoteId: Integer; const products: shoppingCartProductEntityArray; const storeId: string): Boolean; stdcall;
    function  shoppingCartCustomerSet(const sessionId: string; const quoteId: Integer; const customer: shoppingCartCustomerEntity; const storeId: string): Boolean; stdcall;
    function  shoppingCartCustomerAddresses(const sessionId: string; const quoteId: Integer; const customer: shoppingCartCustomerAddressEntityArray; const storeId: string): Boolean; stdcall;
    function  shoppingCartShippingMethod(const sessionId: string; const quoteId: Integer; const method: string; const storeId: string): Boolean; stdcall;
    function  shoppingCartShippingList(const sessionId: string; const quoteId: Integer; const storeId: string): shoppingCartShippingMethodEntityArray; stdcall;
    function  shoppingCartPaymentMethod(const sessionId: string; const quoteId: Integer; const method: shoppingCartPaymentMethodEntity; const storeId: string): Boolean; stdcall;
    function  shoppingCartPaymentList(const sessionId: string; const quoteId: Integer; const store: string): shoppingCartPaymentMethodResponseEntityArray; stdcall;
    function  shoppingCartCouponAdd(const sessionId: string; const quoteId: Integer; const couponCode: string; const storeId: string): Boolean; stdcall;
    function  shoppingCartCouponRemove(const sessionId: string; const quoteId: Integer; const storeId: string): Boolean; stdcall;
    function  catalogProductTagList(const sessionId: string; const productId: string; const store: string): catalogProductTagListEntityArray; stdcall;
    function  catalogProductTagInfo(const sessionId: string; const tagId: string; const store: string): catalogProductTagInfoEntity; stdcall;
    function  catalogProductTagAdd(const sessionId: string; const data: catalogProductTagAddEntity): associativeArray; stdcall;
    function  catalogProductTagUpdate(const sessionId: string; const tagId: string; const data: catalogProductTagUpdateEntity; const store: string): Boolean; stdcall;
    function  catalogProductTagRemove(const sessionId: string; const tagId: string): Boolean; stdcall;
    function  giftMessageSetForQuote(const sessionId: string; const quoteId: string; const giftMessage: giftMessageEntity; const storeId: string): giftMessageResponse; stdcall;
    function  giftMessageSetForQuoteItem(const sessionId: string; const quoteItemId: string; const giftMessage: giftMessageEntity; const storeId: string): giftMessageResponse; stdcall;
    function  giftMessageSetForQuoteProduct(const sessionId: string; const quoteId: string; const productsAndMessages: giftMessageAssociativeProductsEntityArray; const storeId: string): giftMessageResponseArray; stdcall;
    function  catalogProductDownloadableLinkAdd(const sessionId: string; const productId: string; const resource: catalogProductDownloadableLinkAddEntity; const resourceType: string; const store: string; const identifierType: string
                                                ): Integer; stdcall;
    function  catalogProductDownloadableLinkList(const sessionId: string; const productId: string; const store: string; const identifierType: string): catalogProductDownloadableLinkInfoEntity; stdcall;
    function  catalogProductDownloadableLinkRemove(const sessionId: string; const linkId: string; const resourceType: string): Boolean; stdcall;
  end;

function GetMage_Api_Model_Server_V2_HandlerPortType(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): Mage_Api_Model_Server_V2_HandlerPortType;


implementation
  uses SysUtils;

function GetMage_Api_Model_Server_V2_HandlerPortType(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): Mage_Api_Model_Server_V2_HandlerPortType;
const
  defWSDL = 'http://homologacao.seton.com.br/api/v2_soap?wsdl=1';
  defURL  = 'http://homologacao.seton.com.br/index.php/api/v2_soap/index/';
  defSvc  = 'MagentoService';
  defPrt  = 'Mage_Api_Model_Server_V2_HandlerPort';
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
    Result := (RIO as Mage_Api_Model_Server_V2_HandlerPortType);
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


destructor giftMessageAssociativeProductsEntity.Destroy;
begin
  SysUtils.FreeAndNil(Fproduct);
  SysUtils.FreeAndNil(Fmessage_);
  inherited Destroy;
end;

destructor catalogProductDownloadableLinkInfoEntity.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Flinks)-1 do
    SysUtils.FreeAndNil(Flinks[I]);
  System.SetLength(Flinks, 0);
  for I := 0 to System.Length(Fsamples)-1 do
    SysUtils.FreeAndNil(Fsamples[I]);
  System.SetLength(Fsamples, 0);
  inherited Destroy;
end;

procedure ID2.Setid(Index: Integer; const Astring: string);
begin
  Fid := Astring;
  Fid_Specified := True;
end;

function ID2.id_Specified(Index: Integer): boolean;
begin
  Result := Fid_Specified;
end;

procedure ID2.Sethref(Index: Integer; const Astring: string);
begin
  Fhref := Astring;
  Fhref_Specified := True;
end;

function ID2.href_Specified(Index: Integer): boolean;
begin
  Result := Fhref_Specified;
end;

destructor complexFilter.Destroy;
begin
  SysUtils.FreeAndNil(Fvalue);
  inherited Destroy;
end;

procedure catalogProductCustomOptionAdditionalFieldsEntity.Settitle(Index: Integer; const Astring: string);
begin
  Ftitle := Astring;
  Ftitle_Specified := True;
end;

function catalogProductCustomOptionAdditionalFieldsEntity.title_Specified(Index: Integer): boolean;
begin
  Result := Ftitle_Specified;
end;

procedure catalogProductCustomOptionAdditionalFieldsEntity.Setprice(Index: Integer; const Astring: string);
begin
  Fprice := Astring;
  Fprice_Specified := True;
end;

function catalogProductCustomOptionAdditionalFieldsEntity.price_Specified(Index: Integer): boolean;
begin
  Result := Fprice_Specified;
end;

procedure catalogProductCustomOptionAdditionalFieldsEntity.Setprice_type(Index: Integer; const Astring: string);
begin
  Fprice_type := Astring;
  Fprice_type_Specified := True;
end;

function catalogProductCustomOptionAdditionalFieldsEntity.price_type_Specified(Index: Integer): boolean;
begin
  Result := Fprice_type_Specified;
end;

procedure catalogProductCustomOptionAdditionalFieldsEntity.Setsku(Index: Integer; const Astring: string);
begin
  Fsku := Astring;
  Fsku_Specified := True;
end;

function catalogProductCustomOptionAdditionalFieldsEntity.sku_Specified(Index: Integer): boolean;
begin
  Result := Fsku_Specified;
end;

procedure catalogProductCustomOptionAdditionalFieldsEntity.Setmax_characters(Index: Integer; const Astring: string);
begin
  Fmax_characters := Astring;
  Fmax_characters_Specified := True;
end;

function catalogProductCustomOptionAdditionalFieldsEntity.max_characters_Specified(Index: Integer): boolean;
begin
  Result := Fmax_characters_Specified;
end;

procedure catalogProductCustomOptionAdditionalFieldsEntity.Setsort_order(Index: Integer; const Astring: string);
begin
  Fsort_order := Astring;
  Fsort_order_Specified := True;
end;

function catalogProductCustomOptionAdditionalFieldsEntity.sort_order_Specified(Index: Integer): boolean;
begin
  Result := Fsort_order_Specified;
end;

procedure catalogProductCustomOptionAdditionalFieldsEntity.Setfile_extension(Index: Integer; const Astring: string);
begin
  Ffile_extension := Astring;
  Ffile_extension_Specified := True;
end;

function catalogProductCustomOptionAdditionalFieldsEntity.file_extension_Specified(Index: Integer): boolean;
begin
  Result := Ffile_extension_Specified;
end;

procedure catalogProductCustomOptionAdditionalFieldsEntity.Setimage_size_x(Index: Integer; const Astring: string);
begin
  Fimage_size_x := Astring;
  Fimage_size_x_Specified := True;
end;

function catalogProductCustomOptionAdditionalFieldsEntity.image_size_x_Specified(Index: Integer): boolean;
begin
  Result := Fimage_size_x_Specified;
end;

procedure catalogProductCustomOptionAdditionalFieldsEntity.Setimage_size_y(Index: Integer; const Astring: string);
begin
  Fimage_size_y := Astring;
  Fimage_size_y_Specified := True;
end;

function catalogProductCustomOptionAdditionalFieldsEntity.image_size_y_Specified(Index: Integer): boolean;
begin
  Result := Fimage_size_y_Specified;
end;

procedure catalogProductCustomOptionAdditionalFieldsEntity.Setvalue_id(Index: Integer; const Astring: string);
begin
  Fvalue_id := Astring;
  Fvalue_id_Specified := True;
end;

function catalogProductCustomOptionAdditionalFieldsEntity.value_id_Specified(Index: Integer): boolean;
begin
  Result := Fvalue_id_Specified;
end;

procedure shoppingCartPaymentMethodEntity.Setpo_number(Index: Integer; const Astring: string);
begin
  Fpo_number := Astring;
  Fpo_number_Specified := True;
end;

function shoppingCartPaymentMethodEntity.po_number_Specified(Index: Integer): boolean;
begin
  Result := Fpo_number_Specified;
end;

procedure shoppingCartPaymentMethodEntity.Setmethod(Index: Integer; const Astring: string);
begin
  Fmethod := Astring;
  Fmethod_Specified := True;
end;

function shoppingCartPaymentMethodEntity.method_Specified(Index: Integer): boolean;
begin
  Result := Fmethod_Specified;
end;

procedure shoppingCartPaymentMethodEntity.Setcc_cid(Index: Integer; const Astring: string);
begin
  Fcc_cid := Astring;
  Fcc_cid_Specified := True;
end;

function shoppingCartPaymentMethodEntity.cc_cid_Specified(Index: Integer): boolean;
begin
  Result := Fcc_cid_Specified;
end;

procedure shoppingCartPaymentMethodEntity.Setcc_owner(Index: Integer; const Astring: string);
begin
  Fcc_owner := Astring;
  Fcc_owner_Specified := True;
end;

function shoppingCartPaymentMethodEntity.cc_owner_Specified(Index: Integer): boolean;
begin
  Result := Fcc_owner_Specified;
end;

procedure shoppingCartPaymentMethodEntity.Setcc_number(Index: Integer; const Astring: string);
begin
  Fcc_number := Astring;
  Fcc_number_Specified := True;
end;

function shoppingCartPaymentMethodEntity.cc_number_Specified(Index: Integer): boolean;
begin
  Result := Fcc_number_Specified;
end;

procedure shoppingCartPaymentMethodEntity.Setcc_type(Index: Integer; const Astring: string);
begin
  Fcc_type := Astring;
  Fcc_type_Specified := True;
end;

function shoppingCartPaymentMethodEntity.cc_type_Specified(Index: Integer): boolean;
begin
  Result := Fcc_type_Specified;
end;

procedure shoppingCartPaymentMethodEntity.Setcc_exp_year(Index: Integer; const Astring: string);
begin
  Fcc_exp_year := Astring;
  Fcc_exp_year_Specified := True;
end;

function shoppingCartPaymentMethodEntity.cc_exp_year_Specified(Index: Integer): boolean;
begin
  Result := Fcc_exp_year_Specified;
end;

procedure shoppingCartPaymentMethodEntity.Setcc_exp_month(Index: Integer; const Astring: string);
begin
  Fcc_exp_month := Astring;
  Fcc_exp_month_Specified := True;
end;

function shoppingCartPaymentMethodEntity.cc_exp_month_Specified(Index: Integer): boolean;
begin
  Result := Fcc_exp_month_Specified;
end;

procedure catalogInventoryStockItemEntity.Setproduct_id(Index: Integer; const Astring: string);
begin
  Fproduct_id := Astring;
  Fproduct_id_Specified := True;
end;

function catalogInventoryStockItemEntity.product_id_Specified(Index: Integer): boolean;
begin
  Result := Fproduct_id_Specified;
end;

procedure catalogInventoryStockItemEntity.Setsku(Index: Integer; const Astring: string);
begin
  Fsku := Astring;
  Fsku_Specified := True;
end;

function catalogInventoryStockItemEntity.sku_Specified(Index: Integer): boolean;
begin
  Result := Fsku_Specified;
end;

procedure catalogInventoryStockItemEntity.Setqty(Index: Integer; const Astring: string);
begin
  Fqty := Astring;
  Fqty_Specified := True;
end;

function catalogInventoryStockItemEntity.qty_Specified(Index: Integer): boolean;
begin
  Result := Fqty_Specified;
end;

procedure catalogInventoryStockItemEntity.Setis_in_stock(Index: Integer; const Astring: string);
begin
  Fis_in_stock := Astring;
  Fis_in_stock_Specified := True;
end;

function catalogInventoryStockItemEntity.is_in_stock_Specified(Index: Integer): boolean;
begin
  Result := Fis_in_stock_Specified;
end;

procedure shoppingCartPaymentEntity.Setpayment_id(Index: Integer; const Astring: string);
begin
  Fpayment_id := Astring;
  Fpayment_id_Specified := True;
end;

function shoppingCartPaymentEntity.payment_id_Specified(Index: Integer): boolean;
begin
  Result := Fpayment_id_Specified;
end;

procedure shoppingCartPaymentEntity.Setcreated_at(Index: Integer; const Astring: string);
begin
  Fcreated_at := Astring;
  Fcreated_at_Specified := True;
end;

function shoppingCartPaymentEntity.created_at_Specified(Index: Integer): boolean;
begin
  Result := Fcreated_at_Specified;
end;

procedure shoppingCartPaymentEntity.Setupdated_at(Index: Integer; const Astring: string);
begin
  Fupdated_at := Astring;
  Fupdated_at_Specified := True;
end;

function shoppingCartPaymentEntity.updated_at_Specified(Index: Integer): boolean;
begin
  Result := Fupdated_at_Specified;
end;

procedure shoppingCartPaymentEntity.Setmethod(Index: Integer; const Astring: string);
begin
  Fmethod := Astring;
  Fmethod_Specified := True;
end;

function shoppingCartPaymentEntity.method_Specified(Index: Integer): boolean;
begin
  Result := Fmethod_Specified;
end;

procedure shoppingCartPaymentEntity.Setcc_type(Index: Integer; const Astring: string);
begin
  Fcc_type := Astring;
  Fcc_type_Specified := True;
end;

function shoppingCartPaymentEntity.cc_type_Specified(Index: Integer): boolean;
begin
  Result := Fcc_type_Specified;
end;

procedure shoppingCartPaymentEntity.Setcc_number_enc(Index: Integer; const Astring: string);
begin
  Fcc_number_enc := Astring;
  Fcc_number_enc_Specified := True;
end;

function shoppingCartPaymentEntity.cc_number_enc_Specified(Index: Integer): boolean;
begin
  Result := Fcc_number_enc_Specified;
end;

procedure shoppingCartPaymentEntity.Setcc_last4(Index: Integer; const Astring: string);
begin
  Fcc_last4 := Astring;
  Fcc_last4_Specified := True;
end;

function shoppingCartPaymentEntity.cc_last4_Specified(Index: Integer): boolean;
begin
  Result := Fcc_last4_Specified;
end;

procedure shoppingCartPaymentEntity.Setcc_cid_enc(Index: Integer; const Astring: string);
begin
  Fcc_cid_enc := Astring;
  Fcc_cid_enc_Specified := True;
end;

function shoppingCartPaymentEntity.cc_cid_enc_Specified(Index: Integer): boolean;
begin
  Result := Fcc_cid_enc_Specified;
end;

procedure shoppingCartPaymentEntity.Setcc_owner(Index: Integer; const Astring: string);
begin
  Fcc_owner := Astring;
  Fcc_owner_Specified := True;
end;

function shoppingCartPaymentEntity.cc_owner_Specified(Index: Integer): boolean;
begin
  Result := Fcc_owner_Specified;
end;

procedure shoppingCartPaymentEntity.Setcc_exp_month(Index: Integer; const Astring: string);
begin
  Fcc_exp_month := Astring;
  Fcc_exp_month_Specified := True;
end;

function shoppingCartPaymentEntity.cc_exp_month_Specified(Index: Integer): boolean;
begin
  Result := Fcc_exp_month_Specified;
end;

procedure shoppingCartPaymentEntity.Setcc_exp_year(Index: Integer; const Astring: string);
begin
  Fcc_exp_year := Astring;
  Fcc_exp_year_Specified := True;
end;

function shoppingCartPaymentEntity.cc_exp_year_Specified(Index: Integer): boolean;
begin
  Result := Fcc_exp_year_Specified;
end;

procedure shoppingCartPaymentEntity.Setcc_ss_owner(Index: Integer; const Astring: string);
begin
  Fcc_ss_owner := Astring;
  Fcc_ss_owner_Specified := True;
end;

function shoppingCartPaymentEntity.cc_ss_owner_Specified(Index: Integer): boolean;
begin
  Result := Fcc_ss_owner_Specified;
end;

procedure shoppingCartPaymentEntity.Setcc_ss_start_month(Index: Integer; const Astring: string);
begin
  Fcc_ss_start_month := Astring;
  Fcc_ss_start_month_Specified := True;
end;

function shoppingCartPaymentEntity.cc_ss_start_month_Specified(Index: Integer): boolean;
begin
  Result := Fcc_ss_start_month_Specified;
end;

procedure shoppingCartPaymentEntity.Setcc_ss_start_year(Index: Integer; const Astring: string);
begin
  Fcc_ss_start_year := Astring;
  Fcc_ss_start_year_Specified := True;
end;

function shoppingCartPaymentEntity.cc_ss_start_year_Specified(Index: Integer): boolean;
begin
  Result := Fcc_ss_start_year_Specified;
end;

procedure shoppingCartPaymentEntity.Setcc_ss_issue(Index: Integer; const Astring: string);
begin
  Fcc_ss_issue := Astring;
  Fcc_ss_issue_Specified := True;
end;

function shoppingCartPaymentEntity.cc_ss_issue_Specified(Index: Integer): boolean;
begin
  Result := Fcc_ss_issue_Specified;
end;

procedure shoppingCartPaymentEntity.Setpo_number(Index: Integer; const Astring: string);
begin
  Fpo_number := Astring;
  Fpo_number_Specified := True;
end;

function shoppingCartPaymentEntity.po_number_Specified(Index: Integer): boolean;
begin
  Result := Fpo_number_Specified;
end;

procedure shoppingCartPaymentEntity.Setadditional_data(Index: Integer; const Astring: string);
begin
  Fadditional_data := Astring;
  Fadditional_data_Specified := True;
end;

function shoppingCartPaymentEntity.additional_data_Specified(Index: Integer): boolean;
begin
  Result := Fadditional_data_Specified;
end;

procedure shoppingCartPaymentEntity.Setadditional_information(Index: Integer; const Astring: string);
begin
  Fadditional_information := Astring;
  Fadditional_information_Specified := True;
end;

function shoppingCartPaymentEntity.additional_information_Specified(Index: Integer): boolean;
begin
  Result := Fadditional_information_Specified;
end;

destructor catalogProductDownloadableLinkAddSampleEntity.Destroy;
begin
  SysUtils.FreeAndNil(Ffile_);
  inherited Destroy;
end;

procedure catalogProductDownloadableLinkAddSampleEntity.Settype_(Index: Integer; const Astring: string);
begin
  Ftype_ := Astring;
  Ftype__Specified := True;
end;

function catalogProductDownloadableLinkAddSampleEntity.type__Specified(Index: Integer): boolean;
begin
  Result := Ftype__Specified;
end;

procedure catalogProductDownloadableLinkAddSampleEntity.Setfile_(Index: Integer; const AcatalogProductDownloadableLinkFileEntity: catalogProductDownloadableLinkFileEntity);
begin
  Ffile_ := AcatalogProductDownloadableLinkFileEntity;
  Ffile__Specified := True;
end;

function catalogProductDownloadableLinkAddSampleEntity.file__Specified(Index: Integer): boolean;
begin
  Result := Ffile__Specified;
end;

procedure catalogProductDownloadableLinkAddSampleEntity.Seturl(Index: Integer; const Astring: string);
begin
  Furl := Astring;
  Furl_Specified := True;
end;

function catalogProductDownloadableLinkAddSampleEntity.url_Specified(Index: Integer): boolean;
begin
  Result := Furl_Specified;
end;

procedure catalogProductDownloadableLinkSampleEntity.Setsample_file(Index: Integer; const Astring: string);
begin
  Fsample_file := Astring;
  Fsample_file_Specified := True;
end;

function catalogProductDownloadableLinkSampleEntity.sample_file_Specified(Index: Integer): boolean;
begin
  Result := Fsample_file_Specified;
end;

procedure catalogProductDownloadableLinkSampleEntity.Setsample_url(Index: Integer; const Astring: string);
begin
  Fsample_url := Astring;
  Fsample_url_Specified := True;
end;

function catalogProductDownloadableLinkSampleEntity.sample_url_Specified(Index: Integer): boolean;
begin
  Result := Fsample_url_Specified;
end;

procedure catalogProductDownloadableLinkFileEntity.Setname_(Index: Integer; const Astring: string);
begin
  Fname_ := Astring;
  Fname__Specified := True;
end;

function catalogProductDownloadableLinkFileEntity.name__Specified(Index: Integer): boolean;
begin
  Result := Fname__Specified;
end;

procedure catalogProductDownloadableLinkFileEntity.Setbase64_content(Index: Integer; const Astring: string);
begin
  Fbase64_content := Astring;
  Fbase64_content_Specified := True;
end;

function catalogProductDownloadableLinkFileEntity.base64_content_Specified(Index: Integer): boolean;
begin
  Result := Fbase64_content_Specified;
end;

procedure catalogProductTagUpdateEntity.Setname_(Index: Integer; const Astring: string);
begin
  Fname_ := Astring;
  Fname__Specified := True;
end;

function catalogProductTagUpdateEntity.name__Specified(Index: Integer): boolean;
begin
  Result := Fname__Specified;
end;

procedure catalogProductTagUpdateEntity.Setstatus(Index: Integer; const Astring: string);
begin
  Fstatus := Astring;
  Fstatus_Specified := True;
end;

function catalogProductTagUpdateEntity.status_Specified(Index: Integer): boolean;
begin
  Result := Fstatus_Specified;
end;

procedure catalogProductTagUpdateEntity.Setbase_popularity(Index: Integer; const Astring: string);
begin
  Fbase_popularity := Astring;
  Fbase_popularity_Specified := True;
end;

function catalogProductTagUpdateEntity.base_popularity_Specified(Index: Integer): boolean;
begin
  Result := Fbase_popularity_Specified;
end;

procedure giftMessageEntity.Setfrom(Index: Integer; const Astring: string);
begin
  Ffrom := Astring;
  Ffrom_Specified := True;
end;

function giftMessageEntity.from_Specified(Index: Integer): boolean;
begin
  Result := Ffrom_Specified;
end;

procedure giftMessageEntity.Setto_(Index: Integer; const Astring: string);
begin
  Fto_ := Astring;
  Fto__Specified := True;
end;

function giftMessageEntity.to__Specified(Index: Integer): boolean;
begin
  Result := Fto__Specified;
end;

procedure giftMessageEntity.Setmessage_(Index: Integer; const Astring: string);
begin
  Fmessage_ := Astring;
  Fmessage__Specified := True;
end;

function giftMessageEntity.message__Specified(Index: Integer): boolean;
begin
  Result := Fmessage__Specified;
end;

procedure salesOrderPaymentEntity.Setincrement_id(Index: Integer; const Astring: string);
begin
  Fincrement_id := Astring;
  Fincrement_id_Specified := True;
end;

function salesOrderPaymentEntity.increment_id_Specified(Index: Integer): boolean;
begin
  Result := Fincrement_id_Specified;
end;

procedure salesOrderPaymentEntity.Setparent_id(Index: Integer; const Astring: string);
begin
  Fparent_id := Astring;
  Fparent_id_Specified := True;
end;

function salesOrderPaymentEntity.parent_id_Specified(Index: Integer): boolean;
begin
  Result := Fparent_id_Specified;
end;

procedure salesOrderPaymentEntity.Setcreated_at(Index: Integer; const Astring: string);
begin
  Fcreated_at := Astring;
  Fcreated_at_Specified := True;
end;

function salesOrderPaymentEntity.created_at_Specified(Index: Integer): boolean;
begin
  Result := Fcreated_at_Specified;
end;

procedure salesOrderPaymentEntity.Setupdated_at(Index: Integer; const Astring: string);
begin
  Fupdated_at := Astring;
  Fupdated_at_Specified := True;
end;

function salesOrderPaymentEntity.updated_at_Specified(Index: Integer): boolean;
begin
  Result := Fupdated_at_Specified;
end;

procedure salesOrderPaymentEntity.Setis_active(Index: Integer; const Astring: string);
begin
  Fis_active := Astring;
  Fis_active_Specified := True;
end;

function salesOrderPaymentEntity.is_active_Specified(Index: Integer): boolean;
begin
  Result := Fis_active_Specified;
end;

procedure salesOrderPaymentEntity.Setamount_ordered(Index: Integer; const Astring: string);
begin
  Famount_ordered := Astring;
  Famount_ordered_Specified := True;
end;

function salesOrderPaymentEntity.amount_ordered_Specified(Index: Integer): boolean;
begin
  Result := Famount_ordered_Specified;
end;

procedure salesOrderPaymentEntity.Setshipping_amount(Index: Integer; const Astring: string);
begin
  Fshipping_amount := Astring;
  Fshipping_amount_Specified := True;
end;

function salesOrderPaymentEntity.shipping_amount_Specified(Index: Integer): boolean;
begin
  Result := Fshipping_amount_Specified;
end;

procedure salesOrderPaymentEntity.Setbase_amount_ordered(Index: Integer; const Astring: string);
begin
  Fbase_amount_ordered := Astring;
  Fbase_amount_ordered_Specified := True;
end;

function salesOrderPaymentEntity.base_amount_ordered_Specified(Index: Integer): boolean;
begin
  Result := Fbase_amount_ordered_Specified;
end;

procedure salesOrderPaymentEntity.Setbase_shipping_amount(Index: Integer; const Astring: string);
begin
  Fbase_shipping_amount := Astring;
  Fbase_shipping_amount_Specified := True;
end;

function salesOrderPaymentEntity.base_shipping_amount_Specified(Index: Integer): boolean;
begin
  Result := Fbase_shipping_amount_Specified;
end;

procedure salesOrderPaymentEntity.Setmethod(Index: Integer; const Astring: string);
begin
  Fmethod := Astring;
  Fmethod_Specified := True;
end;

function salesOrderPaymentEntity.method_Specified(Index: Integer): boolean;
begin
  Result := Fmethod_Specified;
end;

procedure salesOrderPaymentEntity.Setpo_number(Index: Integer; const Astring: string);
begin
  Fpo_number := Astring;
  Fpo_number_Specified := True;
end;

function salesOrderPaymentEntity.po_number_Specified(Index: Integer): boolean;
begin
  Result := Fpo_number_Specified;
end;

procedure salesOrderPaymentEntity.Setcc_type(Index: Integer; const Astring: string);
begin
  Fcc_type := Astring;
  Fcc_type_Specified := True;
end;

function salesOrderPaymentEntity.cc_type_Specified(Index: Integer): boolean;
begin
  Result := Fcc_type_Specified;
end;

procedure salesOrderPaymentEntity.Setcc_number_enc(Index: Integer; const Astring: string);
begin
  Fcc_number_enc := Astring;
  Fcc_number_enc_Specified := True;
end;

function salesOrderPaymentEntity.cc_number_enc_Specified(Index: Integer): boolean;
begin
  Result := Fcc_number_enc_Specified;
end;

procedure salesOrderPaymentEntity.Setcc_last4(Index: Integer; const Astring: string);
begin
  Fcc_last4 := Astring;
  Fcc_last4_Specified := True;
end;

function salesOrderPaymentEntity.cc_last4_Specified(Index: Integer): boolean;
begin
  Result := Fcc_last4_Specified;
end;

procedure salesOrderPaymentEntity.Setcc_owner(Index: Integer; const Astring: string);
begin
  Fcc_owner := Astring;
  Fcc_owner_Specified := True;
end;

function salesOrderPaymentEntity.cc_owner_Specified(Index: Integer): boolean;
begin
  Result := Fcc_owner_Specified;
end;

procedure salesOrderPaymentEntity.Setcc_exp_month(Index: Integer; const Astring: string);
begin
  Fcc_exp_month := Astring;
  Fcc_exp_month_Specified := True;
end;

function salesOrderPaymentEntity.cc_exp_month_Specified(Index: Integer): boolean;
begin
  Result := Fcc_exp_month_Specified;
end;

procedure salesOrderPaymentEntity.Setcc_exp_year(Index: Integer; const Astring: string);
begin
  Fcc_exp_year := Astring;
  Fcc_exp_year_Specified := True;
end;

function salesOrderPaymentEntity.cc_exp_year_Specified(Index: Integer): boolean;
begin
  Result := Fcc_exp_year_Specified;
end;

procedure salesOrderPaymentEntity.Setcc_ss_start_month(Index: Integer; const Astring: string);
begin
  Fcc_ss_start_month := Astring;
  Fcc_ss_start_month_Specified := True;
end;

function salesOrderPaymentEntity.cc_ss_start_month_Specified(Index: Integer): boolean;
begin
  Result := Fcc_ss_start_month_Specified;
end;

procedure salesOrderPaymentEntity.Setcc_ss_start_year(Index: Integer; const Astring: string);
begin
  Fcc_ss_start_year := Astring;
  Fcc_ss_start_year_Specified := True;
end;

function salesOrderPaymentEntity.cc_ss_start_year_Specified(Index: Integer): boolean;
begin
  Result := Fcc_ss_start_year_Specified;
end;

procedure salesOrderPaymentEntity.Setpayment_id(Index: Integer; const Astring: string);
begin
  Fpayment_id := Astring;
  Fpayment_id_Specified := True;
end;

function salesOrderPaymentEntity.payment_id_Specified(Index: Integer): boolean;
begin
  Result := Fpayment_id_Specified;
end;

procedure salesOrderItemEntity.Setitem_id(Index: Integer; const Astring: string);
begin
  Fitem_id := Astring;
  Fitem_id_Specified := True;
end;

function salesOrderItemEntity.item_id_Specified(Index: Integer): boolean;
begin
  Result := Fitem_id_Specified;
end;

procedure salesOrderItemEntity.Setorder_id(Index: Integer; const Astring: string);
begin
  Forder_id := Astring;
  Forder_id_Specified := True;
end;

function salesOrderItemEntity.order_id_Specified(Index: Integer): boolean;
begin
  Result := Forder_id_Specified;
end;

procedure salesOrderItemEntity.Setquote_item_id(Index: Integer; const Astring: string);
begin
  Fquote_item_id := Astring;
  Fquote_item_id_Specified := True;
end;

function salesOrderItemEntity.quote_item_id_Specified(Index: Integer): boolean;
begin
  Result := Fquote_item_id_Specified;
end;

procedure salesOrderItemEntity.Setcreated_at(Index: Integer; const Astring: string);
begin
  Fcreated_at := Astring;
  Fcreated_at_Specified := True;
end;

function salesOrderItemEntity.created_at_Specified(Index: Integer): boolean;
begin
  Result := Fcreated_at_Specified;
end;

procedure salesOrderItemEntity.Setupdated_at(Index: Integer; const Astring: string);
begin
  Fupdated_at := Astring;
  Fupdated_at_Specified := True;
end;

function salesOrderItemEntity.updated_at_Specified(Index: Integer): boolean;
begin
  Result := Fupdated_at_Specified;
end;

procedure salesOrderItemEntity.Setproduct_id(Index: Integer; const Astring: string);
begin
  Fproduct_id := Astring;
  Fproduct_id_Specified := True;
end;

function salesOrderItemEntity.product_id_Specified(Index: Integer): boolean;
begin
  Result := Fproduct_id_Specified;
end;

procedure salesOrderItemEntity.Setproduct_type(Index: Integer; const Astring: string);
begin
  Fproduct_type := Astring;
  Fproduct_type_Specified := True;
end;

function salesOrderItemEntity.product_type_Specified(Index: Integer): boolean;
begin
  Result := Fproduct_type_Specified;
end;

procedure salesOrderItemEntity.Setproduct_options(Index: Integer; const Astring: string);
begin
  Fproduct_options := Astring;
  Fproduct_options_Specified := True;
end;

function salesOrderItemEntity.product_options_Specified(Index: Integer): boolean;
begin
  Result := Fproduct_options_Specified;
end;

procedure salesOrderItemEntity.Setweight(Index: Integer; const Astring: string);
begin
  Fweight := Astring;
  Fweight_Specified := True;
end;

function salesOrderItemEntity.weight_Specified(Index: Integer): boolean;
begin
  Result := Fweight_Specified;
end;

procedure salesOrderItemEntity.Setis_virtual(Index: Integer; const Astring: string);
begin
  Fis_virtual := Astring;
  Fis_virtual_Specified := True;
end;

function salesOrderItemEntity.is_virtual_Specified(Index: Integer): boolean;
begin
  Result := Fis_virtual_Specified;
end;

procedure salesOrderItemEntity.Setsku(Index: Integer; const Astring: string);
begin
  Fsku := Astring;
  Fsku_Specified := True;
end;

function salesOrderItemEntity.sku_Specified(Index: Integer): boolean;
begin
  Result := Fsku_Specified;
end;

procedure salesOrderItemEntity.Setname_(Index: Integer; const Astring: string);
begin
  Fname_ := Astring;
  Fname__Specified := True;
end;

function salesOrderItemEntity.name__Specified(Index: Integer): boolean;
begin
  Result := Fname__Specified;
end;

procedure salesOrderItemEntity.Setapplied_rule_ids(Index: Integer; const Astring: string);
begin
  Fapplied_rule_ids := Astring;
  Fapplied_rule_ids_Specified := True;
end;

function salesOrderItemEntity.applied_rule_ids_Specified(Index: Integer): boolean;
begin
  Result := Fapplied_rule_ids_Specified;
end;

procedure salesOrderItemEntity.Setfree_shipping(Index: Integer; const Astring: string);
begin
  Ffree_shipping := Astring;
  Ffree_shipping_Specified := True;
end;

function salesOrderItemEntity.free_shipping_Specified(Index: Integer): boolean;
begin
  Result := Ffree_shipping_Specified;
end;

procedure salesOrderItemEntity.Setis_qty_decimal(Index: Integer; const Astring: string);
begin
  Fis_qty_decimal := Astring;
  Fis_qty_decimal_Specified := True;
end;

function salesOrderItemEntity.is_qty_decimal_Specified(Index: Integer): boolean;
begin
  Result := Fis_qty_decimal_Specified;
end;

procedure salesOrderItemEntity.Setno_discount(Index: Integer; const Astring: string);
begin
  Fno_discount := Astring;
  Fno_discount_Specified := True;
end;

function salesOrderItemEntity.no_discount_Specified(Index: Integer): boolean;
begin
  Result := Fno_discount_Specified;
end;

procedure salesOrderItemEntity.Setqty_canceled(Index: Integer; const Astring: string);
begin
  Fqty_canceled := Astring;
  Fqty_canceled_Specified := True;
end;

function salesOrderItemEntity.qty_canceled_Specified(Index: Integer): boolean;
begin
  Result := Fqty_canceled_Specified;
end;

procedure salesOrderItemEntity.Setqty_invoiced(Index: Integer; const Astring: string);
begin
  Fqty_invoiced := Astring;
  Fqty_invoiced_Specified := True;
end;

function salesOrderItemEntity.qty_invoiced_Specified(Index: Integer): boolean;
begin
  Result := Fqty_invoiced_Specified;
end;

procedure salesOrderItemEntity.Setqty_ordered(Index: Integer; const Astring: string);
begin
  Fqty_ordered := Astring;
  Fqty_ordered_Specified := True;
end;

function salesOrderItemEntity.qty_ordered_Specified(Index: Integer): boolean;
begin
  Result := Fqty_ordered_Specified;
end;

procedure salesOrderItemEntity.Setqty_refunded(Index: Integer; const Astring: string);
begin
  Fqty_refunded := Astring;
  Fqty_refunded_Specified := True;
end;

function salesOrderItemEntity.qty_refunded_Specified(Index: Integer): boolean;
begin
  Result := Fqty_refunded_Specified;
end;

procedure salesOrderItemEntity.Setqty_shipped(Index: Integer; const Astring: string);
begin
  Fqty_shipped := Astring;
  Fqty_shipped_Specified := True;
end;

function salesOrderItemEntity.qty_shipped_Specified(Index: Integer): boolean;
begin
  Result := Fqty_shipped_Specified;
end;

procedure salesOrderItemEntity.Setcost(Index: Integer; const Astring: string);
begin
  Fcost := Astring;
  Fcost_Specified := True;
end;

function salesOrderItemEntity.cost_Specified(Index: Integer): boolean;
begin
  Result := Fcost_Specified;
end;

procedure salesOrderItemEntity.Setprice(Index: Integer; const Astring: string);
begin
  Fprice := Astring;
  Fprice_Specified := True;
end;

function salesOrderItemEntity.price_Specified(Index: Integer): boolean;
begin
  Result := Fprice_Specified;
end;

procedure salesOrderItemEntity.Setbase_price(Index: Integer; const Astring: string);
begin
  Fbase_price := Astring;
  Fbase_price_Specified := True;
end;

function salesOrderItemEntity.base_price_Specified(Index: Integer): boolean;
begin
  Result := Fbase_price_Specified;
end;

procedure salesOrderItemEntity.Setoriginal_price(Index: Integer; const Astring: string);
begin
  Foriginal_price := Astring;
  Foriginal_price_Specified := True;
end;

function salesOrderItemEntity.original_price_Specified(Index: Integer): boolean;
begin
  Result := Foriginal_price_Specified;
end;

procedure salesOrderItemEntity.Setbase_original_price(Index: Integer; const Astring: string);
begin
  Fbase_original_price := Astring;
  Fbase_original_price_Specified := True;
end;

function salesOrderItemEntity.base_original_price_Specified(Index: Integer): boolean;
begin
  Result := Fbase_original_price_Specified;
end;

procedure salesOrderItemEntity.Settax_percent(Index: Integer; const Astring: string);
begin
  Ftax_percent := Astring;
  Ftax_percent_Specified := True;
end;

function salesOrderItemEntity.tax_percent_Specified(Index: Integer): boolean;
begin
  Result := Ftax_percent_Specified;
end;

procedure salesOrderItemEntity.Settax_amount(Index: Integer; const Astring: string);
begin
  Ftax_amount := Astring;
  Ftax_amount_Specified := True;
end;

function salesOrderItemEntity.tax_amount_Specified(Index: Integer): boolean;
begin
  Result := Ftax_amount_Specified;
end;

procedure salesOrderItemEntity.Setbase_tax_amount(Index: Integer; const Astring: string);
begin
  Fbase_tax_amount := Astring;
  Fbase_tax_amount_Specified := True;
end;

function salesOrderItemEntity.base_tax_amount_Specified(Index: Integer): boolean;
begin
  Result := Fbase_tax_amount_Specified;
end;

procedure salesOrderItemEntity.Settax_invoiced(Index: Integer; const Astring: string);
begin
  Ftax_invoiced := Astring;
  Ftax_invoiced_Specified := True;
end;

function salesOrderItemEntity.tax_invoiced_Specified(Index: Integer): boolean;
begin
  Result := Ftax_invoiced_Specified;
end;

procedure salesOrderItemEntity.Setbase_tax_invoiced(Index: Integer; const Astring: string);
begin
  Fbase_tax_invoiced := Astring;
  Fbase_tax_invoiced_Specified := True;
end;

function salesOrderItemEntity.base_tax_invoiced_Specified(Index: Integer): boolean;
begin
  Result := Fbase_tax_invoiced_Specified;
end;

procedure salesOrderItemEntity.Setdiscount_percent(Index: Integer; const Astring: string);
begin
  Fdiscount_percent := Astring;
  Fdiscount_percent_Specified := True;
end;

function salesOrderItemEntity.discount_percent_Specified(Index: Integer): boolean;
begin
  Result := Fdiscount_percent_Specified;
end;

procedure salesOrderItemEntity.Setdiscount_amount(Index: Integer; const Astring: string);
begin
  Fdiscount_amount := Astring;
  Fdiscount_amount_Specified := True;
end;

function salesOrderItemEntity.discount_amount_Specified(Index: Integer): boolean;
begin
  Result := Fdiscount_amount_Specified;
end;

procedure salesOrderItemEntity.Setbase_discount_amount(Index: Integer; const Astring: string);
begin
  Fbase_discount_amount := Astring;
  Fbase_discount_amount_Specified := True;
end;

function salesOrderItemEntity.base_discount_amount_Specified(Index: Integer): boolean;
begin
  Result := Fbase_discount_amount_Specified;
end;

procedure salesOrderItemEntity.Setdiscount_invoiced(Index: Integer; const Astring: string);
begin
  Fdiscount_invoiced := Astring;
  Fdiscount_invoiced_Specified := True;
end;

function salesOrderItemEntity.discount_invoiced_Specified(Index: Integer): boolean;
begin
  Result := Fdiscount_invoiced_Specified;
end;

procedure salesOrderItemEntity.Setbase_discount_invoiced(Index: Integer; const Astring: string);
begin
  Fbase_discount_invoiced := Astring;
  Fbase_discount_invoiced_Specified := True;
end;

function salesOrderItemEntity.base_discount_invoiced_Specified(Index: Integer): boolean;
begin
  Result := Fbase_discount_invoiced_Specified;
end;

procedure salesOrderItemEntity.Setamount_refunded(Index: Integer; const Astring: string);
begin
  Famount_refunded := Astring;
  Famount_refunded_Specified := True;
end;

function salesOrderItemEntity.amount_refunded_Specified(Index: Integer): boolean;
begin
  Result := Famount_refunded_Specified;
end;

procedure salesOrderItemEntity.Setbase_amount_refunded(Index: Integer; const Astring: string);
begin
  Fbase_amount_refunded := Astring;
  Fbase_amount_refunded_Specified := True;
end;

function salesOrderItemEntity.base_amount_refunded_Specified(Index: Integer): boolean;
begin
  Result := Fbase_amount_refunded_Specified;
end;

procedure salesOrderItemEntity.Setrow_total(Index: Integer; const Astring: string);
begin
  Frow_total := Astring;
  Frow_total_Specified := True;
end;

function salesOrderItemEntity.row_total_Specified(Index: Integer): boolean;
begin
  Result := Frow_total_Specified;
end;

procedure salesOrderItemEntity.Setbase_row_total(Index: Integer; const Astring: string);
begin
  Fbase_row_total := Astring;
  Fbase_row_total_Specified := True;
end;

function salesOrderItemEntity.base_row_total_Specified(Index: Integer): boolean;
begin
  Result := Fbase_row_total_Specified;
end;

procedure salesOrderItemEntity.Setrow_invoiced(Index: Integer; const Astring: string);
begin
  Frow_invoiced := Astring;
  Frow_invoiced_Specified := True;
end;

function salesOrderItemEntity.row_invoiced_Specified(Index: Integer): boolean;
begin
  Result := Frow_invoiced_Specified;
end;

procedure salesOrderItemEntity.Setbase_row_invoiced(Index: Integer; const Astring: string);
begin
  Fbase_row_invoiced := Astring;
  Fbase_row_invoiced_Specified := True;
end;

function salesOrderItemEntity.base_row_invoiced_Specified(Index: Integer): boolean;
begin
  Result := Fbase_row_invoiced_Specified;
end;

procedure salesOrderItemEntity.Setrow_weight(Index: Integer; const Astring: string);
begin
  Frow_weight := Astring;
  Frow_weight_Specified := True;
end;

function salesOrderItemEntity.row_weight_Specified(Index: Integer): boolean;
begin
  Result := Frow_weight_Specified;
end;

procedure salesOrderItemEntity.Setgift_message_id(Index: Integer; const Astring: string);
begin
  Fgift_message_id := Astring;
  Fgift_message_id_Specified := True;
end;

function salesOrderItemEntity.gift_message_id_Specified(Index: Integer): boolean;
begin
  Result := Fgift_message_id_Specified;
end;

procedure salesOrderItemEntity.Setgift_message(Index: Integer; const Astring: string);
begin
  Fgift_message := Astring;
  Fgift_message_Specified := True;
end;

function salesOrderItemEntity.gift_message_Specified(Index: Integer): boolean;
begin
  Result := Fgift_message_Specified;
end;

procedure salesOrderItemEntity.Setgift_message_available(Index: Integer; const Astring: string);
begin
  Fgift_message_available := Astring;
  Fgift_message_available_Specified := True;
end;

function salesOrderItemEntity.gift_message_available_Specified(Index: Integer): boolean;
begin
  Result := Fgift_message_available_Specified;
end;

procedure salesOrderItemEntity.Setbase_tax_before_discount(Index: Integer; const Astring: string);
begin
  Fbase_tax_before_discount := Astring;
  Fbase_tax_before_discount_Specified := True;
end;

function salesOrderItemEntity.base_tax_before_discount_Specified(Index: Integer): boolean;
begin
  Result := Fbase_tax_before_discount_Specified;
end;

procedure salesOrderItemEntity.Settax_before_discount(Index: Integer; const Astring: string);
begin
  Ftax_before_discount := Astring;
  Ftax_before_discount_Specified := True;
end;

function salesOrderItemEntity.tax_before_discount_Specified(Index: Integer): boolean;
begin
  Result := Ftax_before_discount_Specified;
end;

procedure salesOrderItemEntity.Setweee_tax_applied(Index: Integer; const Astring: string);
begin
  Fweee_tax_applied := Astring;
  Fweee_tax_applied_Specified := True;
end;

function salesOrderItemEntity.weee_tax_applied_Specified(Index: Integer): boolean;
begin
  Result := Fweee_tax_applied_Specified;
end;

procedure salesOrderItemEntity.Setweee_tax_applied_amount(Index: Integer; const Astring: string);
begin
  Fweee_tax_applied_amount := Astring;
  Fweee_tax_applied_amount_Specified := True;
end;

function salesOrderItemEntity.weee_tax_applied_amount_Specified(Index: Integer): boolean;
begin
  Result := Fweee_tax_applied_amount_Specified;
end;

procedure salesOrderItemEntity.Setweee_tax_applied_row_amount(Index: Integer; const Astring: string);
begin
  Fweee_tax_applied_row_amount := Astring;
  Fweee_tax_applied_row_amount_Specified := True;
end;

function salesOrderItemEntity.weee_tax_applied_row_amount_Specified(Index: Integer): boolean;
begin
  Result := Fweee_tax_applied_row_amount_Specified;
end;

procedure salesOrderItemEntity.Setbase_weee_tax_applied_amount(Index: Integer; const Astring: string);
begin
  Fbase_weee_tax_applied_amount := Astring;
  Fbase_weee_tax_applied_amount_Specified := True;
end;

function salesOrderItemEntity.base_weee_tax_applied_amount_Specified(Index: Integer): boolean;
begin
  Result := Fbase_weee_tax_applied_amount_Specified;
end;

procedure salesOrderItemEntity.Setbase_weee_tax_applied_row_amount(Index: Integer; const Astring: string);
begin
  Fbase_weee_tax_applied_row_amount := Astring;
  Fbase_weee_tax_applied_row_amount_Specified := True;
end;

function salesOrderItemEntity.base_weee_tax_applied_row_amount_Specified(Index: Integer): boolean;
begin
  Result := Fbase_weee_tax_applied_row_amount_Specified;
end;

procedure salesOrderItemEntity.Setweee_tax_disposition(Index: Integer; const Astring: string);
begin
  Fweee_tax_disposition := Astring;
  Fweee_tax_disposition_Specified := True;
end;

function salesOrderItemEntity.weee_tax_disposition_Specified(Index: Integer): boolean;
begin
  Result := Fweee_tax_disposition_Specified;
end;

procedure salesOrderItemEntity.Setweee_tax_row_disposition(Index: Integer; const Astring: string);
begin
  Fweee_tax_row_disposition := Astring;
  Fweee_tax_row_disposition_Specified := True;
end;

function salesOrderItemEntity.weee_tax_row_disposition_Specified(Index: Integer): boolean;
begin
  Result := Fweee_tax_row_disposition_Specified;
end;

procedure salesOrderItemEntity.Setbase_weee_tax_disposition(Index: Integer; const Astring: string);
begin
  Fbase_weee_tax_disposition := Astring;
  Fbase_weee_tax_disposition_Specified := True;
end;

function salesOrderItemEntity.base_weee_tax_disposition_Specified(Index: Integer): boolean;
begin
  Result := Fbase_weee_tax_disposition_Specified;
end;

procedure salesOrderItemEntity.Setbase_weee_tax_row_disposition(Index: Integer; const Astring: string);
begin
  Fbase_weee_tax_row_disposition := Astring;
  Fbase_weee_tax_row_disposition_Specified := True;
end;

function salesOrderItemEntity.base_weee_tax_row_disposition_Specified(Index: Integer): boolean;
begin
  Result := Fbase_weee_tax_row_disposition_Specified;
end;

procedure salesOrderListEntity.Setincrement_id(Index: Integer; const Astring: string);
begin
  Fincrement_id := Astring;
  Fincrement_id_Specified := True;
end;

function salesOrderListEntity.increment_id_Specified(Index: Integer): boolean;
begin
  Result := Fincrement_id_Specified;
end;

procedure salesOrderListEntity.Setstore_id(Index: Integer; const Astring: string);
begin
  Fstore_id := Astring;
  Fstore_id_Specified := True;
end;

function salesOrderListEntity.store_id_Specified(Index: Integer): boolean;
begin
  Result := Fstore_id_Specified;
end;

procedure salesOrderListEntity.Setcreated_at(Index: Integer; const Astring: string);
begin
  Fcreated_at := Astring;
  Fcreated_at_Specified := True;
end;

function salesOrderListEntity.created_at_Specified(Index: Integer): boolean;
begin
  Result := Fcreated_at_Specified;
end;

procedure salesOrderListEntity.Setupdated_at(Index: Integer; const Astring: string);
begin
  Fupdated_at := Astring;
  Fupdated_at_Specified := True;
end;

function salesOrderListEntity.updated_at_Specified(Index: Integer): boolean;
begin
  Result := Fupdated_at_Specified;
end;

procedure salesOrderListEntity.Setcustomer_id(Index: Integer; const Astring: string);
begin
  Fcustomer_id := Astring;
  Fcustomer_id_Specified := True;
end;

function salesOrderListEntity.customer_id_Specified(Index: Integer): boolean;
begin
  Result := Fcustomer_id_Specified;
end;

procedure salesOrderListEntity.Settax_amount(Index: Integer; const Astring: string);
begin
  Ftax_amount := Astring;
  Ftax_amount_Specified := True;
end;

function salesOrderListEntity.tax_amount_Specified(Index: Integer): boolean;
begin
  Result := Ftax_amount_Specified;
end;

procedure salesOrderListEntity.Setshipping_amount(Index: Integer; const Astring: string);
begin
  Fshipping_amount := Astring;
  Fshipping_amount_Specified := True;
end;

function salesOrderListEntity.shipping_amount_Specified(Index: Integer): boolean;
begin
  Result := Fshipping_amount_Specified;
end;

procedure salesOrderListEntity.Setdiscount_amount(Index: Integer; const Astring: string);
begin
  Fdiscount_amount := Astring;
  Fdiscount_amount_Specified := True;
end;

function salesOrderListEntity.discount_amount_Specified(Index: Integer): boolean;
begin
  Result := Fdiscount_amount_Specified;
end;

procedure salesOrderListEntity.Setsubtotal(Index: Integer; const Astring: string);
begin
  Fsubtotal := Astring;
  Fsubtotal_Specified := True;
end;

function salesOrderListEntity.subtotal_Specified(Index: Integer): boolean;
begin
  Result := Fsubtotal_Specified;
end;

procedure salesOrderListEntity.Setgrand_total(Index: Integer; const Astring: string);
begin
  Fgrand_total := Astring;
  Fgrand_total_Specified := True;
end;

function salesOrderListEntity.grand_total_Specified(Index: Integer): boolean;
begin
  Result := Fgrand_total_Specified;
end;

procedure salesOrderListEntity.Settotal_paid(Index: Integer; const Astring: string);
begin
  Ftotal_paid := Astring;
  Ftotal_paid_Specified := True;
end;

function salesOrderListEntity.total_paid_Specified(Index: Integer): boolean;
begin
  Result := Ftotal_paid_Specified;
end;

procedure salesOrderListEntity.Settotal_refunded(Index: Integer; const Astring: string);
begin
  Ftotal_refunded := Astring;
  Ftotal_refunded_Specified := True;
end;

function salesOrderListEntity.total_refunded_Specified(Index: Integer): boolean;
begin
  Result := Ftotal_refunded_Specified;
end;

procedure salesOrderListEntity.Settotal_qty_ordered(Index: Integer; const Astring: string);
begin
  Ftotal_qty_ordered := Astring;
  Ftotal_qty_ordered_Specified := True;
end;

function salesOrderListEntity.total_qty_ordered_Specified(Index: Integer): boolean;
begin
  Result := Ftotal_qty_ordered_Specified;
end;

procedure salesOrderListEntity.Settotal_canceled(Index: Integer; const Astring: string);
begin
  Ftotal_canceled := Astring;
  Ftotal_canceled_Specified := True;
end;

function salesOrderListEntity.total_canceled_Specified(Index: Integer): boolean;
begin
  Result := Ftotal_canceled_Specified;
end;

procedure salesOrderListEntity.Settotal_invoiced(Index: Integer; const Astring: string);
begin
  Ftotal_invoiced := Astring;
  Ftotal_invoiced_Specified := True;
end;

function salesOrderListEntity.total_invoiced_Specified(Index: Integer): boolean;
begin
  Result := Ftotal_invoiced_Specified;
end;

procedure salesOrderListEntity.Settotal_online_refunded(Index: Integer; const Astring: string);
begin
  Ftotal_online_refunded := Astring;
  Ftotal_online_refunded_Specified := True;
end;

function salesOrderListEntity.total_online_refunded_Specified(Index: Integer): boolean;
begin
  Result := Ftotal_online_refunded_Specified;
end;

procedure salesOrderListEntity.Settotal_offline_refunded(Index: Integer; const Astring: string);
begin
  Ftotal_offline_refunded := Astring;
  Ftotal_offline_refunded_Specified := True;
end;

function salesOrderListEntity.total_offline_refunded_Specified(Index: Integer): boolean;
begin
  Result := Ftotal_offline_refunded_Specified;
end;

procedure salesOrderListEntity.Setbase_tax_amount(Index: Integer; const Astring: string);
begin
  Fbase_tax_amount := Astring;
  Fbase_tax_amount_Specified := True;
end;

function salesOrderListEntity.base_tax_amount_Specified(Index: Integer): boolean;
begin
  Result := Fbase_tax_amount_Specified;
end;

procedure salesOrderListEntity.Setbase_shipping_amount(Index: Integer; const Astring: string);
begin
  Fbase_shipping_amount := Astring;
  Fbase_shipping_amount_Specified := True;
end;

function salesOrderListEntity.base_shipping_amount_Specified(Index: Integer): boolean;
begin
  Result := Fbase_shipping_amount_Specified;
end;

procedure salesOrderListEntity.Setbase_discount_amount(Index: Integer; const Astring: string);
begin
  Fbase_discount_amount := Astring;
  Fbase_discount_amount_Specified := True;
end;

function salesOrderListEntity.base_discount_amount_Specified(Index: Integer): boolean;
begin
  Result := Fbase_discount_amount_Specified;
end;

procedure salesOrderListEntity.Setbase_subtotal(Index: Integer; const Astring: string);
begin
  Fbase_subtotal := Astring;
  Fbase_subtotal_Specified := True;
end;

function salesOrderListEntity.base_subtotal_Specified(Index: Integer): boolean;
begin
  Result := Fbase_subtotal_Specified;
end;

procedure salesOrderListEntity.Setbase_grand_total(Index: Integer; const Astring: string);
begin
  Fbase_grand_total := Astring;
  Fbase_grand_total_Specified := True;
end;

function salesOrderListEntity.base_grand_total_Specified(Index: Integer): boolean;
begin
  Result := Fbase_grand_total_Specified;
end;

procedure salesOrderListEntity.Setbase_total_paid(Index: Integer; const Astring: string);
begin
  Fbase_total_paid := Astring;
  Fbase_total_paid_Specified := True;
end;

function salesOrderListEntity.base_total_paid_Specified(Index: Integer): boolean;
begin
  Result := Fbase_total_paid_Specified;
end;

procedure salesOrderListEntity.Setbase_total_refunded(Index: Integer; const Astring: string);
begin
  Fbase_total_refunded := Astring;
  Fbase_total_refunded_Specified := True;
end;

function salesOrderListEntity.base_total_refunded_Specified(Index: Integer): boolean;
begin
  Result := Fbase_total_refunded_Specified;
end;

procedure salesOrderListEntity.Setbase_total_qty_ordered(Index: Integer; const Astring: string);
begin
  Fbase_total_qty_ordered := Astring;
  Fbase_total_qty_ordered_Specified := True;
end;

function salesOrderListEntity.base_total_qty_ordered_Specified(Index: Integer): boolean;
begin
  Result := Fbase_total_qty_ordered_Specified;
end;

procedure salesOrderListEntity.Setbase_total_canceled(Index: Integer; const Astring: string);
begin
  Fbase_total_canceled := Astring;
  Fbase_total_canceled_Specified := True;
end;

function salesOrderListEntity.base_total_canceled_Specified(Index: Integer): boolean;
begin
  Result := Fbase_total_canceled_Specified;
end;

procedure salesOrderListEntity.Setbase_total_invoiced(Index: Integer; const Astring: string);
begin
  Fbase_total_invoiced := Astring;
  Fbase_total_invoiced_Specified := True;
end;

function salesOrderListEntity.base_total_invoiced_Specified(Index: Integer): boolean;
begin
  Result := Fbase_total_invoiced_Specified;
end;

procedure salesOrderListEntity.Setbase_total_online_refunded(Index: Integer; const Astring: string);
begin
  Fbase_total_online_refunded := Astring;
  Fbase_total_online_refunded_Specified := True;
end;

function salesOrderListEntity.base_total_online_refunded_Specified(Index: Integer): boolean;
begin
  Result := Fbase_total_online_refunded_Specified;
end;

procedure salesOrderListEntity.Setbase_total_offline_refunded(Index: Integer; const Astring: string);
begin
  Fbase_total_offline_refunded := Astring;
  Fbase_total_offline_refunded_Specified := True;
end;

function salesOrderListEntity.base_total_offline_refunded_Specified(Index: Integer): boolean;
begin
  Result := Fbase_total_offline_refunded_Specified;
end;

procedure salesOrderListEntity.Setbilling_address_id(Index: Integer; const Astring: string);
begin
  Fbilling_address_id := Astring;
  Fbilling_address_id_Specified := True;
end;

function salesOrderListEntity.billing_address_id_Specified(Index: Integer): boolean;
begin
  Result := Fbilling_address_id_Specified;
end;

procedure salesOrderListEntity.Setbilling_firstname(Index: Integer; const Astring: string);
begin
  Fbilling_firstname := Astring;
  Fbilling_firstname_Specified := True;
end;

function salesOrderListEntity.billing_firstname_Specified(Index: Integer): boolean;
begin
  Result := Fbilling_firstname_Specified;
end;

procedure salesOrderListEntity.Setbilling_lastname(Index: Integer; const Astring: string);
begin
  Fbilling_lastname := Astring;
  Fbilling_lastname_Specified := True;
end;

function salesOrderListEntity.billing_lastname_Specified(Index: Integer): boolean;
begin
  Result := Fbilling_lastname_Specified;
end;

procedure salesOrderListEntity.Setshipping_address_id(Index: Integer; const Astring: string);
begin
  Fshipping_address_id := Astring;
  Fshipping_address_id_Specified := True;
end;

function salesOrderListEntity.shipping_address_id_Specified(Index: Integer): boolean;
begin
  Result := Fshipping_address_id_Specified;
end;

procedure salesOrderListEntity.Setshipping_firstname(Index: Integer; const Astring: string);
begin
  Fshipping_firstname := Astring;
  Fshipping_firstname_Specified := True;
end;

function salesOrderListEntity.shipping_firstname_Specified(Index: Integer): boolean;
begin
  Result := Fshipping_firstname_Specified;
end;

procedure salesOrderListEntity.Setshipping_lastname(Index: Integer; const Astring: string);
begin
  Fshipping_lastname := Astring;
  Fshipping_lastname_Specified := True;
end;

function salesOrderListEntity.shipping_lastname_Specified(Index: Integer): boolean;
begin
  Result := Fshipping_lastname_Specified;
end;

procedure salesOrderListEntity.Setbilling_name(Index: Integer; const Astring: string);
begin
  Fbilling_name := Astring;
  Fbilling_name_Specified := True;
end;

function salesOrderListEntity.billing_name_Specified(Index: Integer): boolean;
begin
  Result := Fbilling_name_Specified;
end;

procedure salesOrderListEntity.Setshipping_name(Index: Integer; const Astring: string);
begin
  Fshipping_name := Astring;
  Fshipping_name_Specified := True;
end;

function salesOrderListEntity.shipping_name_Specified(Index: Integer): boolean;
begin
  Result := Fshipping_name_Specified;
end;

procedure salesOrderListEntity.Setstore_to_base_rate(Index: Integer; const Astring: string);
begin
  Fstore_to_base_rate := Astring;
  Fstore_to_base_rate_Specified := True;
end;

function salesOrderListEntity.store_to_base_rate_Specified(Index: Integer): boolean;
begin
  Result := Fstore_to_base_rate_Specified;
end;

procedure salesOrderListEntity.Setstore_to_order_rate(Index: Integer; const Astring: string);
begin
  Fstore_to_order_rate := Astring;
  Fstore_to_order_rate_Specified := True;
end;

function salesOrderListEntity.store_to_order_rate_Specified(Index: Integer): boolean;
begin
  Result := Fstore_to_order_rate_Specified;
end;

procedure salesOrderListEntity.Setbase_to_global_rate(Index: Integer; const Astring: string);
begin
  Fbase_to_global_rate := Astring;
  Fbase_to_global_rate_Specified := True;
end;

function salesOrderListEntity.base_to_global_rate_Specified(Index: Integer): boolean;
begin
  Result := Fbase_to_global_rate_Specified;
end;

procedure salesOrderListEntity.Setbase_to_order_rate(Index: Integer; const Astring: string);
begin
  Fbase_to_order_rate := Astring;
  Fbase_to_order_rate_Specified := True;
end;

function salesOrderListEntity.base_to_order_rate_Specified(Index: Integer): boolean;
begin
  Result := Fbase_to_order_rate_Specified;
end;

procedure salesOrderListEntity.Setweight(Index: Integer; const Astring: string);
begin
  Fweight := Astring;
  Fweight_Specified := True;
end;

function salesOrderListEntity.weight_Specified(Index: Integer): boolean;
begin
  Result := Fweight_Specified;
end;

procedure salesOrderListEntity.Setstore_name(Index: Integer; const Astring: string);
begin
  Fstore_name := Astring;
  Fstore_name_Specified := True;
end;

function salesOrderListEntity.store_name_Specified(Index: Integer): boolean;
begin
  Result := Fstore_name_Specified;
end;

procedure salesOrderListEntity.Setremote_ip(Index: Integer; const Astring: string);
begin
  Fremote_ip := Astring;
  Fremote_ip_Specified := True;
end;

function salesOrderListEntity.remote_ip_Specified(Index: Integer): boolean;
begin
  Result := Fremote_ip_Specified;
end;

procedure salesOrderListEntity.Setstatus(Index: Integer; const Astring: string);
begin
  Fstatus := Astring;
  Fstatus_Specified := True;
end;

function salesOrderListEntity.status_Specified(Index: Integer): boolean;
begin
  Result := Fstatus_Specified;
end;

procedure salesOrderListEntity.Setstate(Index: Integer; const Astring: string);
begin
  Fstate := Astring;
  Fstate_Specified := True;
end;

function salesOrderListEntity.state_Specified(Index: Integer): boolean;
begin
  Result := Fstate_Specified;
end;

procedure salesOrderListEntity.Setapplied_rule_ids(Index: Integer; const Astring: string);
begin
  Fapplied_rule_ids := Astring;
  Fapplied_rule_ids_Specified := True;
end;

function salesOrderListEntity.applied_rule_ids_Specified(Index: Integer): boolean;
begin
  Result := Fapplied_rule_ids_Specified;
end;

procedure salesOrderListEntity.Setglobal_currency_code(Index: Integer; const Astring: string);
begin
  Fglobal_currency_code := Astring;
  Fglobal_currency_code_Specified := True;
end;

function salesOrderListEntity.global_currency_code_Specified(Index: Integer): boolean;
begin
  Result := Fglobal_currency_code_Specified;
end;

procedure salesOrderListEntity.Setbase_currency_code(Index: Integer; const Astring: string);
begin
  Fbase_currency_code := Astring;
  Fbase_currency_code_Specified := True;
end;

function salesOrderListEntity.base_currency_code_Specified(Index: Integer): boolean;
begin
  Result := Fbase_currency_code_Specified;
end;

procedure salesOrderListEntity.Setstore_currency_code(Index: Integer; const Astring: string);
begin
  Fstore_currency_code := Astring;
  Fstore_currency_code_Specified := True;
end;

function salesOrderListEntity.store_currency_code_Specified(Index: Integer): boolean;
begin
  Result := Fstore_currency_code_Specified;
end;

procedure salesOrderListEntity.Setorder_currency_code(Index: Integer; const Astring: string);
begin
  Forder_currency_code := Astring;
  Forder_currency_code_Specified := True;
end;

function salesOrderListEntity.order_currency_code_Specified(Index: Integer): boolean;
begin
  Result := Forder_currency_code_Specified;
end;

procedure salesOrderListEntity.Setshipping_method(Index: Integer; const Astring: string);
begin
  Fshipping_method := Astring;
  Fshipping_method_Specified := True;
end;

function salesOrderListEntity.shipping_method_Specified(Index: Integer): boolean;
begin
  Result := Fshipping_method_Specified;
end;

procedure salesOrderListEntity.Setshipping_description(Index: Integer; const Astring: string);
begin
  Fshipping_description := Astring;
  Fshipping_description_Specified := True;
end;

function salesOrderListEntity.shipping_description_Specified(Index: Integer): boolean;
begin
  Result := Fshipping_description_Specified;
end;

procedure salesOrderListEntity.Setcustomer_email(Index: Integer; const Astring: string);
begin
  Fcustomer_email := Astring;
  Fcustomer_email_Specified := True;
end;

function salesOrderListEntity.customer_email_Specified(Index: Integer): boolean;
begin
  Result := Fcustomer_email_Specified;
end;

procedure salesOrderListEntity.Setcustomer_firstname(Index: Integer; const Astring: string);
begin
  Fcustomer_firstname := Astring;
  Fcustomer_firstname_Specified := True;
end;

function salesOrderListEntity.customer_firstname_Specified(Index: Integer): boolean;
begin
  Result := Fcustomer_firstname_Specified;
end;

procedure salesOrderListEntity.Setcustomer_lastname(Index: Integer; const Astring: string);
begin
  Fcustomer_lastname := Astring;
  Fcustomer_lastname_Specified := True;
end;

function salesOrderListEntity.customer_lastname_Specified(Index: Integer): boolean;
begin
  Result := Fcustomer_lastname_Specified;
end;

procedure salesOrderListEntity.Setquote_id(Index: Integer; const Astring: string);
begin
  Fquote_id := Astring;
  Fquote_id_Specified := True;
end;

function salesOrderListEntity.quote_id_Specified(Index: Integer): boolean;
begin
  Result := Fquote_id_Specified;
end;

procedure salesOrderListEntity.Setis_virtual(Index: Integer; const Astring: string);
begin
  Fis_virtual := Astring;
  Fis_virtual_Specified := True;
end;

function salesOrderListEntity.is_virtual_Specified(Index: Integer): boolean;
begin
  Result := Fis_virtual_Specified;
end;

procedure salesOrderListEntity.Setcustomer_group_id(Index: Integer; const Astring: string);
begin
  Fcustomer_group_id := Astring;
  Fcustomer_group_id_Specified := True;
end;

function salesOrderListEntity.customer_group_id_Specified(Index: Integer): boolean;
begin
  Result := Fcustomer_group_id_Specified;
end;

procedure salesOrderListEntity.Setcustomer_note_notify(Index: Integer; const Astring: string);
begin
  Fcustomer_note_notify := Astring;
  Fcustomer_note_notify_Specified := True;
end;

function salesOrderListEntity.customer_note_notify_Specified(Index: Integer): boolean;
begin
  Result := Fcustomer_note_notify_Specified;
end;

procedure salesOrderListEntity.Setcustomer_is_guest(Index: Integer; const Astring: string);
begin
  Fcustomer_is_guest := Astring;
  Fcustomer_is_guest_Specified := True;
end;

function salesOrderListEntity.customer_is_guest_Specified(Index: Integer): boolean;
begin
  Result := Fcustomer_is_guest_Specified;
end;

procedure salesOrderListEntity.Setemail_sent(Index: Integer; const Astring: string);
begin
  Femail_sent := Astring;
  Femail_sent_Specified := True;
end;

function salesOrderListEntity.email_sent_Specified(Index: Integer): boolean;
begin
  Result := Femail_sent_Specified;
end;

procedure salesOrderListEntity.Setorder_id(Index: Integer; const Astring: string);
begin
  Forder_id := Astring;
  Forder_id_Specified := True;
end;

function salesOrderListEntity.order_id_Specified(Index: Integer): boolean;
begin
  Result := Forder_id_Specified;
end;

procedure salesOrderListEntity.Setgift_message_id(Index: Integer; const Astring: string);
begin
  Fgift_message_id := Astring;
  Fgift_message_id_Specified := True;
end;

function salesOrderListEntity.gift_message_id_Specified(Index: Integer): boolean;
begin
  Result := Fgift_message_id_Specified;
end;

procedure salesOrderListEntity.Setcoupon_code(Index: Integer; const Astring: string);
begin
  Fcoupon_code := Astring;
  Fcoupon_code_Specified := True;
end;

function salesOrderListEntity.coupon_code_Specified(Index: Integer): boolean;
begin
  Result := Fcoupon_code_Specified;
end;

procedure salesOrderListEntity.Setprotect_code(Index: Integer; const Astring: string);
begin
  Fprotect_code := Astring;
  Fprotect_code_Specified := True;
end;

function salesOrderListEntity.protect_code_Specified(Index: Integer): boolean;
begin
  Result := Fprotect_code_Specified;
end;

procedure salesOrderListEntity.Setbase_discount_canceled(Index: Integer; const Astring: string);
begin
  Fbase_discount_canceled := Astring;
  Fbase_discount_canceled_Specified := True;
end;

function salesOrderListEntity.base_discount_canceled_Specified(Index: Integer): boolean;
begin
  Result := Fbase_discount_canceled_Specified;
end;

procedure salesOrderListEntity.Setbase_discount_invoiced(Index: Integer; const Astring: string);
begin
  Fbase_discount_invoiced := Astring;
  Fbase_discount_invoiced_Specified := True;
end;

function salesOrderListEntity.base_discount_invoiced_Specified(Index: Integer): boolean;
begin
  Result := Fbase_discount_invoiced_Specified;
end;

procedure salesOrderListEntity.Setbase_discount_refunded(Index: Integer; const Astring: string);
begin
  Fbase_discount_refunded := Astring;
  Fbase_discount_refunded_Specified := True;
end;

function salesOrderListEntity.base_discount_refunded_Specified(Index: Integer): boolean;
begin
  Result := Fbase_discount_refunded_Specified;
end;

procedure salesOrderListEntity.Setbase_shipping_canceled(Index: Integer; const Astring: string);
begin
  Fbase_shipping_canceled := Astring;
  Fbase_shipping_canceled_Specified := True;
end;

function salesOrderListEntity.base_shipping_canceled_Specified(Index: Integer): boolean;
begin
  Result := Fbase_shipping_canceled_Specified;
end;

procedure salesOrderListEntity.Setbase_shipping_invoiced(Index: Integer; const Astring: string);
begin
  Fbase_shipping_invoiced := Astring;
  Fbase_shipping_invoiced_Specified := True;
end;

function salesOrderListEntity.base_shipping_invoiced_Specified(Index: Integer): boolean;
begin
  Result := Fbase_shipping_invoiced_Specified;
end;

procedure salesOrderListEntity.Setbase_shipping_refunded(Index: Integer; const Astring: string);
begin
  Fbase_shipping_refunded := Astring;
  Fbase_shipping_refunded_Specified := True;
end;

function salesOrderListEntity.base_shipping_refunded_Specified(Index: Integer): boolean;
begin
  Result := Fbase_shipping_refunded_Specified;
end;

procedure salesOrderListEntity.Setbase_shipping_tax_amount(Index: Integer; const Astring: string);
begin
  Fbase_shipping_tax_amount := Astring;
  Fbase_shipping_tax_amount_Specified := True;
end;

function salesOrderListEntity.base_shipping_tax_amount_Specified(Index: Integer): boolean;
begin
  Result := Fbase_shipping_tax_amount_Specified;
end;

procedure salesOrderListEntity.Setbase_shipping_tax_refunded(Index: Integer; const Astring: string);
begin
  Fbase_shipping_tax_refunded := Astring;
  Fbase_shipping_tax_refunded_Specified := True;
end;

function salesOrderListEntity.base_shipping_tax_refunded_Specified(Index: Integer): boolean;
begin
  Result := Fbase_shipping_tax_refunded_Specified;
end;

procedure salesOrderListEntity.Setbase_subtotal_canceled(Index: Integer; const Astring: string);
begin
  Fbase_subtotal_canceled := Astring;
  Fbase_subtotal_canceled_Specified := True;
end;

function salesOrderListEntity.base_subtotal_canceled_Specified(Index: Integer): boolean;
begin
  Result := Fbase_subtotal_canceled_Specified;
end;

procedure salesOrderListEntity.Setbase_subtotal_invoiced(Index: Integer; const Astring: string);
begin
  Fbase_subtotal_invoiced := Astring;
  Fbase_subtotal_invoiced_Specified := True;
end;

function salesOrderListEntity.base_subtotal_invoiced_Specified(Index: Integer): boolean;
begin
  Result := Fbase_subtotal_invoiced_Specified;
end;

procedure salesOrderListEntity.Setbase_subtotal_refunded(Index: Integer; const Astring: string);
begin
  Fbase_subtotal_refunded := Astring;
  Fbase_subtotal_refunded_Specified := True;
end;

function salesOrderListEntity.base_subtotal_refunded_Specified(Index: Integer): boolean;
begin
  Result := Fbase_subtotal_refunded_Specified;
end;

procedure salesOrderListEntity.Setbase_tax_canceled(Index: Integer; const Astring: string);
begin
  Fbase_tax_canceled := Astring;
  Fbase_tax_canceled_Specified := True;
end;

function salesOrderListEntity.base_tax_canceled_Specified(Index: Integer): boolean;
begin
  Result := Fbase_tax_canceled_Specified;
end;

procedure salesOrderListEntity.Setbase_tax_invoiced(Index: Integer; const Astring: string);
begin
  Fbase_tax_invoiced := Astring;
  Fbase_tax_invoiced_Specified := True;
end;

function salesOrderListEntity.base_tax_invoiced_Specified(Index: Integer): boolean;
begin
  Result := Fbase_tax_invoiced_Specified;
end;

procedure salesOrderListEntity.Setbase_tax_refunded(Index: Integer; const Astring: string);
begin
  Fbase_tax_refunded := Astring;
  Fbase_tax_refunded_Specified := True;
end;

function salesOrderListEntity.base_tax_refunded_Specified(Index: Integer): boolean;
begin
  Result := Fbase_tax_refunded_Specified;
end;

procedure salesOrderListEntity.Setbase_total_invoiced_cost(Index: Integer; const Astring: string);
begin
  Fbase_total_invoiced_cost := Astring;
  Fbase_total_invoiced_cost_Specified := True;
end;

function salesOrderListEntity.base_total_invoiced_cost_Specified(Index: Integer): boolean;
begin
  Result := Fbase_total_invoiced_cost_Specified;
end;

procedure salesOrderListEntity.Setdiscount_canceled(Index: Integer; const Astring: string);
begin
  Fdiscount_canceled := Astring;
  Fdiscount_canceled_Specified := True;
end;

function salesOrderListEntity.discount_canceled_Specified(Index: Integer): boolean;
begin
  Result := Fdiscount_canceled_Specified;
end;

procedure salesOrderListEntity.Setdiscount_invoiced(Index: Integer; const Astring: string);
begin
  Fdiscount_invoiced := Astring;
  Fdiscount_invoiced_Specified := True;
end;

function salesOrderListEntity.discount_invoiced_Specified(Index: Integer): boolean;
begin
  Result := Fdiscount_invoiced_Specified;
end;

procedure salesOrderListEntity.Setdiscount_refunded(Index: Integer; const Astring: string);
begin
  Fdiscount_refunded := Astring;
  Fdiscount_refunded_Specified := True;
end;

function salesOrderListEntity.discount_refunded_Specified(Index: Integer): boolean;
begin
  Result := Fdiscount_refunded_Specified;
end;

procedure salesOrderListEntity.Setshipping_canceled(Index: Integer; const Astring: string);
begin
  Fshipping_canceled := Astring;
  Fshipping_canceled_Specified := True;
end;

function salesOrderListEntity.shipping_canceled_Specified(Index: Integer): boolean;
begin
  Result := Fshipping_canceled_Specified;
end;

procedure salesOrderListEntity.Setshipping_invoiced(Index: Integer; const Astring: string);
begin
  Fshipping_invoiced := Astring;
  Fshipping_invoiced_Specified := True;
end;

function salesOrderListEntity.shipping_invoiced_Specified(Index: Integer): boolean;
begin
  Result := Fshipping_invoiced_Specified;
end;

procedure salesOrderListEntity.Setshipping_refunded(Index: Integer; const Astring: string);
begin
  Fshipping_refunded := Astring;
  Fshipping_refunded_Specified := True;
end;

function salesOrderListEntity.shipping_refunded_Specified(Index: Integer): boolean;
begin
  Result := Fshipping_refunded_Specified;
end;

procedure salesOrderListEntity.Setshipping_tax_amount(Index: Integer; const Astring: string);
begin
  Fshipping_tax_amount := Astring;
  Fshipping_tax_amount_Specified := True;
end;

function salesOrderListEntity.shipping_tax_amount_Specified(Index: Integer): boolean;
begin
  Result := Fshipping_tax_amount_Specified;
end;

procedure salesOrderListEntity.Setshipping_tax_refunded(Index: Integer; const Astring: string);
begin
  Fshipping_tax_refunded := Astring;
  Fshipping_tax_refunded_Specified := True;
end;

function salesOrderListEntity.shipping_tax_refunded_Specified(Index: Integer): boolean;
begin
  Result := Fshipping_tax_refunded_Specified;
end;

procedure salesOrderListEntity.Setsubtotal_canceled(Index: Integer; const Astring: string);
begin
  Fsubtotal_canceled := Astring;
  Fsubtotal_canceled_Specified := True;
end;

function salesOrderListEntity.subtotal_canceled_Specified(Index: Integer): boolean;
begin
  Result := Fsubtotal_canceled_Specified;
end;

procedure salesOrderListEntity.Setsubtotal_invoiced(Index: Integer; const Astring: string);
begin
  Fsubtotal_invoiced := Astring;
  Fsubtotal_invoiced_Specified := True;
end;

function salesOrderListEntity.subtotal_invoiced_Specified(Index: Integer): boolean;
begin
  Result := Fsubtotal_invoiced_Specified;
end;

procedure salesOrderListEntity.Setsubtotal_refunded(Index: Integer; const Astring: string);
begin
  Fsubtotal_refunded := Astring;
  Fsubtotal_refunded_Specified := True;
end;

function salesOrderListEntity.subtotal_refunded_Specified(Index: Integer): boolean;
begin
  Result := Fsubtotal_refunded_Specified;
end;

procedure salesOrderListEntity.Settax_canceled(Index: Integer; const Astring: string);
begin
  Ftax_canceled := Astring;
  Ftax_canceled_Specified := True;
end;

function salesOrderListEntity.tax_canceled_Specified(Index: Integer): boolean;
begin
  Result := Ftax_canceled_Specified;
end;

procedure salesOrderListEntity.Settax_invoiced(Index: Integer; const Astring: string);
begin
  Ftax_invoiced := Astring;
  Ftax_invoiced_Specified := True;
end;

function salesOrderListEntity.tax_invoiced_Specified(Index: Integer): boolean;
begin
  Result := Ftax_invoiced_Specified;
end;

procedure salesOrderListEntity.Settax_refunded(Index: Integer; const Astring: string);
begin
  Ftax_refunded := Astring;
  Ftax_refunded_Specified := True;
end;

function salesOrderListEntity.tax_refunded_Specified(Index: Integer): boolean;
begin
  Result := Ftax_refunded_Specified;
end;

procedure salesOrderListEntity.Setcan_ship_partially(Index: Integer; const Astring: string);
begin
  Fcan_ship_partially := Astring;
  Fcan_ship_partially_Specified := True;
end;

function salesOrderListEntity.can_ship_partially_Specified(Index: Integer): boolean;
begin
  Result := Fcan_ship_partially_Specified;
end;

procedure salesOrderListEntity.Setcan_ship_partially_item(Index: Integer; const Astring: string);
begin
  Fcan_ship_partially_item := Astring;
  Fcan_ship_partially_item_Specified := True;
end;

function salesOrderListEntity.can_ship_partially_item_Specified(Index: Integer): boolean;
begin
  Result := Fcan_ship_partially_item_Specified;
end;

procedure salesOrderListEntity.Setedit_increment(Index: Integer; const Astring: string);
begin
  Fedit_increment := Astring;
  Fedit_increment_Specified := True;
end;

function salesOrderListEntity.edit_increment_Specified(Index: Integer): boolean;
begin
  Result := Fedit_increment_Specified;
end;

procedure salesOrderListEntity.Setforced_do_shipment_with_invoice(Index: Integer; const Astring: string);
begin
  Fforced_do_shipment_with_invoice := Astring;
  Fforced_do_shipment_with_invoice_Specified := True;
end;

function salesOrderListEntity.forced_do_shipment_with_invoice_Specified(Index: Integer): boolean;
begin
  Result := Fforced_do_shipment_with_invoice_Specified;
end;

procedure salesOrderListEntity.Setpayment_authorization_expiration(Index: Integer; const Astring: string);
begin
  Fpayment_authorization_expiration := Astring;
  Fpayment_authorization_expiration_Specified := True;
end;

function salesOrderListEntity.payment_authorization_expiration_Specified(Index: Integer): boolean;
begin
  Result := Fpayment_authorization_expiration_Specified;
end;

procedure salesOrderListEntity.Setpaypal_ipn_customer_notified(Index: Integer; const Astring: string);
begin
  Fpaypal_ipn_customer_notified := Astring;
  Fpaypal_ipn_customer_notified_Specified := True;
end;

function salesOrderListEntity.paypal_ipn_customer_notified_Specified(Index: Integer): boolean;
begin
  Result := Fpaypal_ipn_customer_notified_Specified;
end;

procedure salesOrderListEntity.Setquote_address_id(Index: Integer; const Astring: string);
begin
  Fquote_address_id := Astring;
  Fquote_address_id_Specified := True;
end;

function salesOrderListEntity.quote_address_id_Specified(Index: Integer): boolean;
begin
  Result := Fquote_address_id_Specified;
end;

procedure salesOrderListEntity.Setadjustment_negative(Index: Integer; const Astring: string);
begin
  Fadjustment_negative := Astring;
  Fadjustment_negative_Specified := True;
end;

function salesOrderListEntity.adjustment_negative_Specified(Index: Integer): boolean;
begin
  Result := Fadjustment_negative_Specified;
end;

procedure salesOrderListEntity.Setadjustment_positive(Index: Integer; const Astring: string);
begin
  Fadjustment_positive := Astring;
  Fadjustment_positive_Specified := True;
end;

function salesOrderListEntity.adjustment_positive_Specified(Index: Integer): boolean;
begin
  Result := Fadjustment_positive_Specified;
end;

procedure salesOrderListEntity.Setbase_adjustment_negative(Index: Integer; const Astring: string);
begin
  Fbase_adjustment_negative := Astring;
  Fbase_adjustment_negative_Specified := True;
end;

function salesOrderListEntity.base_adjustment_negative_Specified(Index: Integer): boolean;
begin
  Result := Fbase_adjustment_negative_Specified;
end;

procedure salesOrderListEntity.Setbase_adjustment_positive(Index: Integer; const Astring: string);
begin
  Fbase_adjustment_positive := Astring;
  Fbase_adjustment_positive_Specified := True;
end;

function salesOrderListEntity.base_adjustment_positive_Specified(Index: Integer): boolean;
begin
  Result := Fbase_adjustment_positive_Specified;
end;

procedure salesOrderListEntity.Setbase_shipping_discount_amount(Index: Integer; const Astring: string);
begin
  Fbase_shipping_discount_amount := Astring;
  Fbase_shipping_discount_amount_Specified := True;
end;

function salesOrderListEntity.base_shipping_discount_amount_Specified(Index: Integer): boolean;
begin
  Result := Fbase_shipping_discount_amount_Specified;
end;

procedure salesOrderListEntity.Setbase_subtotal_incl_tax(Index: Integer; const Astring: string);
begin
  Fbase_subtotal_incl_tax := Astring;
  Fbase_subtotal_incl_tax_Specified := True;
end;

function salesOrderListEntity.base_subtotal_incl_tax_Specified(Index: Integer): boolean;
begin
  Result := Fbase_subtotal_incl_tax_Specified;
end;

procedure salesOrderListEntity.Setbase_total_due(Index: Integer; const Astring: string);
begin
  Fbase_total_due := Astring;
  Fbase_total_due_Specified := True;
end;

function salesOrderListEntity.base_total_due_Specified(Index: Integer): boolean;
begin
  Result := Fbase_total_due_Specified;
end;

procedure salesOrderListEntity.Setpayment_authorization_amount(Index: Integer; const Astring: string);
begin
  Fpayment_authorization_amount := Astring;
  Fpayment_authorization_amount_Specified := True;
end;

function salesOrderListEntity.payment_authorization_amount_Specified(Index: Integer): boolean;
begin
  Result := Fpayment_authorization_amount_Specified;
end;

procedure salesOrderListEntity.Setshipping_discount_amount(Index: Integer; const Astring: string);
begin
  Fshipping_discount_amount := Astring;
  Fshipping_discount_amount_Specified := True;
end;

function salesOrderListEntity.shipping_discount_amount_Specified(Index: Integer): boolean;
begin
  Result := Fshipping_discount_amount_Specified;
end;

procedure salesOrderListEntity.Setsubtotal_incl_tax(Index: Integer; const Astring: string);
begin
  Fsubtotal_incl_tax := Astring;
  Fsubtotal_incl_tax_Specified := True;
end;

function salesOrderListEntity.subtotal_incl_tax_Specified(Index: Integer): boolean;
begin
  Result := Fsubtotal_incl_tax_Specified;
end;

procedure salesOrderListEntity.Settotal_due(Index: Integer; const Astring: string);
begin
  Ftotal_due := Astring;
  Ftotal_due_Specified := True;
end;

function salesOrderListEntity.total_due_Specified(Index: Integer): boolean;
begin
  Result := Ftotal_due_Specified;
end;

procedure salesOrderListEntity.Setcustomer_dob(Index: Integer; const Astring: string);
begin
  Fcustomer_dob := Astring;
  Fcustomer_dob_Specified := True;
end;

function salesOrderListEntity.customer_dob_Specified(Index: Integer): boolean;
begin
  Result := Fcustomer_dob_Specified;
end;

procedure salesOrderListEntity.Setcustomer_middlename(Index: Integer; const Astring: string);
begin
  Fcustomer_middlename := Astring;
  Fcustomer_middlename_Specified := True;
end;

function salesOrderListEntity.customer_middlename_Specified(Index: Integer): boolean;
begin
  Result := Fcustomer_middlename_Specified;
end;

procedure salesOrderListEntity.Setcustomer_prefix(Index: Integer; const Astring: string);
begin
  Fcustomer_prefix := Astring;
  Fcustomer_prefix_Specified := True;
end;

function salesOrderListEntity.customer_prefix_Specified(Index: Integer): boolean;
begin
  Result := Fcustomer_prefix_Specified;
end;

procedure salesOrderListEntity.Setcustomer_suffix(Index: Integer; const Astring: string);
begin
  Fcustomer_suffix := Astring;
  Fcustomer_suffix_Specified := True;
end;

function salesOrderListEntity.customer_suffix_Specified(Index: Integer): boolean;
begin
  Result := Fcustomer_suffix_Specified;
end;

procedure salesOrderListEntity.Setcustomer_taxvat(Index: Integer; const Astring: string);
begin
  Fcustomer_taxvat := Astring;
  Fcustomer_taxvat_Specified := True;
end;

function salesOrderListEntity.customer_taxvat_Specified(Index: Integer): boolean;
begin
  Result := Fcustomer_taxvat_Specified;
end;

procedure salesOrderListEntity.Setdiscount_description(Index: Integer; const Astring: string);
begin
  Fdiscount_description := Astring;
  Fdiscount_description_Specified := True;
end;

function salesOrderListEntity.discount_description_Specified(Index: Integer): boolean;
begin
  Result := Fdiscount_description_Specified;
end;

procedure salesOrderListEntity.Setext_customer_id(Index: Integer; const Astring: string);
begin
  Fext_customer_id := Astring;
  Fext_customer_id_Specified := True;
end;

function salesOrderListEntity.ext_customer_id_Specified(Index: Integer): boolean;
begin
  Result := Fext_customer_id_Specified;
end;

procedure salesOrderListEntity.Setext_order_id(Index: Integer; const Astring: string);
begin
  Fext_order_id := Astring;
  Fext_order_id_Specified := True;
end;

function salesOrderListEntity.ext_order_id_Specified(Index: Integer): boolean;
begin
  Result := Fext_order_id_Specified;
end;

procedure salesOrderListEntity.Sethold_before_state(Index: Integer; const Astring: string);
begin
  Fhold_before_state := Astring;
  Fhold_before_state_Specified := True;
end;

function salesOrderListEntity.hold_before_state_Specified(Index: Integer): boolean;
begin
  Result := Fhold_before_state_Specified;
end;

procedure salesOrderListEntity.Sethold_before_status(Index: Integer; const Astring: string);
begin
  Fhold_before_status := Astring;
  Fhold_before_status_Specified := True;
end;

function salesOrderListEntity.hold_before_status_Specified(Index: Integer): boolean;
begin
  Result := Fhold_before_status_Specified;
end;

procedure salesOrderListEntity.Setoriginal_increment_id(Index: Integer; const Astring: string);
begin
  Foriginal_increment_id := Astring;
  Foriginal_increment_id_Specified := True;
end;

function salesOrderListEntity.original_increment_id_Specified(Index: Integer): boolean;
begin
  Result := Foriginal_increment_id_Specified;
end;

procedure salesOrderListEntity.Setrelation_child_id(Index: Integer; const Astring: string);
begin
  Frelation_child_id := Astring;
  Frelation_child_id_Specified := True;
end;

function salesOrderListEntity.relation_child_id_Specified(Index: Integer): boolean;
begin
  Result := Frelation_child_id_Specified;
end;

procedure salesOrderListEntity.Setrelation_child_real_id(Index: Integer; const Astring: string);
begin
  Frelation_child_real_id := Astring;
  Frelation_child_real_id_Specified := True;
end;

function salesOrderListEntity.relation_child_real_id_Specified(Index: Integer): boolean;
begin
  Result := Frelation_child_real_id_Specified;
end;

procedure salesOrderListEntity.Setrelation_parent_id(Index: Integer; const Astring: string);
begin
  Frelation_parent_id := Astring;
  Frelation_parent_id_Specified := True;
end;

function salesOrderListEntity.relation_parent_id_Specified(Index: Integer): boolean;
begin
  Result := Frelation_parent_id_Specified;
end;

procedure salesOrderListEntity.Setrelation_parent_real_id(Index: Integer; const Astring: string);
begin
  Frelation_parent_real_id := Astring;
  Frelation_parent_real_id_Specified := True;
end;

function salesOrderListEntity.relation_parent_real_id_Specified(Index: Integer): boolean;
begin
  Result := Frelation_parent_real_id_Specified;
end;

procedure salesOrderListEntity.Setx_forwarded_for(Index: Integer; const Astring: string);
begin
  Fx_forwarded_for := Astring;
  Fx_forwarded_for_Specified := True;
end;

function salesOrderListEntity.x_forwarded_for_Specified(Index: Integer): boolean;
begin
  Result := Fx_forwarded_for_Specified;
end;

procedure salesOrderListEntity.Setcustomer_note(Index: Integer; const Astring: string);
begin
  Fcustomer_note := Astring;
  Fcustomer_note_Specified := True;
end;

function salesOrderListEntity.customer_note_Specified(Index: Integer): boolean;
begin
  Result := Fcustomer_note_Specified;
end;

procedure salesOrderListEntity.Settotal_item_count(Index: Integer; const Astring: string);
begin
  Ftotal_item_count := Astring;
  Ftotal_item_count_Specified := True;
end;

function salesOrderListEntity.total_item_count_Specified(Index: Integer): boolean;
begin
  Result := Ftotal_item_count_Specified;
end;

procedure salesOrderListEntity.Setcustomer_gender(Index: Integer; const Astring: string);
begin
  Fcustomer_gender := Astring;
  Fcustomer_gender_Specified := True;
end;

function salesOrderListEntity.customer_gender_Specified(Index: Integer): boolean;
begin
  Result := Fcustomer_gender_Specified;
end;

procedure salesOrderListEntity.Sethidden_tax_amount(Index: Integer; const Astring: string);
begin
  Fhidden_tax_amount := Astring;
  Fhidden_tax_amount_Specified := True;
end;

function salesOrderListEntity.hidden_tax_amount_Specified(Index: Integer): boolean;
begin
  Result := Fhidden_tax_amount_Specified;
end;

procedure salesOrderListEntity.Setbase_hidden_tax_amount(Index: Integer; const Astring: string);
begin
  Fbase_hidden_tax_amount := Astring;
  Fbase_hidden_tax_amount_Specified := True;
end;

function salesOrderListEntity.base_hidden_tax_amount_Specified(Index: Integer): boolean;
begin
  Result := Fbase_hidden_tax_amount_Specified;
end;

procedure salesOrderListEntity.Setshipping_hidden_tax_amount(Index: Integer; const Astring: string);
begin
  Fshipping_hidden_tax_amount := Astring;
  Fshipping_hidden_tax_amount_Specified := True;
end;

function salesOrderListEntity.shipping_hidden_tax_amount_Specified(Index: Integer): boolean;
begin
  Result := Fshipping_hidden_tax_amount_Specified;
end;

procedure salesOrderListEntity.Setbase_shipping_hidden_tax_amount(Index: Integer; const Astring: string);
begin
  Fbase_shipping_hidden_tax_amount := Astring;
  Fbase_shipping_hidden_tax_amount_Specified := True;
end;

function salesOrderListEntity.base_shipping_hidden_tax_amount_Specified(Index: Integer): boolean;
begin
  Result := Fbase_shipping_hidden_tax_amount_Specified;
end;

procedure salesOrderListEntity.Sethidden_tax_invoiced(Index: Integer; const Astring: string);
begin
  Fhidden_tax_invoiced := Astring;
  Fhidden_tax_invoiced_Specified := True;
end;

function salesOrderListEntity.hidden_tax_invoiced_Specified(Index: Integer): boolean;
begin
  Result := Fhidden_tax_invoiced_Specified;
end;

procedure salesOrderListEntity.Setbase_hidden_tax_invoiced(Index: Integer; const Astring: string);
begin
  Fbase_hidden_tax_invoiced := Astring;
  Fbase_hidden_tax_invoiced_Specified := True;
end;

function salesOrderListEntity.base_hidden_tax_invoiced_Specified(Index: Integer): boolean;
begin
  Result := Fbase_hidden_tax_invoiced_Specified;
end;

procedure salesOrderListEntity.Sethidden_tax_refunded(Index: Integer; const Astring: string);
begin
  Fhidden_tax_refunded := Astring;
  Fhidden_tax_refunded_Specified := True;
end;

function salesOrderListEntity.hidden_tax_refunded_Specified(Index: Integer): boolean;
begin
  Result := Fhidden_tax_refunded_Specified;
end;

procedure salesOrderListEntity.Setbase_hidden_tax_refunded(Index: Integer; const Astring: string);
begin
  Fbase_hidden_tax_refunded := Astring;
  Fbase_hidden_tax_refunded_Specified := True;
end;

function salesOrderListEntity.base_hidden_tax_refunded_Specified(Index: Integer): boolean;
begin
  Result := Fbase_hidden_tax_refunded_Specified;
end;

procedure salesOrderListEntity.Setshipping_incl_tax(Index: Integer; const Astring: string);
begin
  Fshipping_incl_tax := Astring;
  Fshipping_incl_tax_Specified := True;
end;

function salesOrderListEntity.shipping_incl_tax_Specified(Index: Integer): boolean;
begin
  Result := Fshipping_incl_tax_Specified;
end;

procedure salesOrderListEntity.Setbase_shipping_incl_tax(Index: Integer; const Astring: string);
begin
  Fbase_shipping_incl_tax := Astring;
  Fbase_shipping_incl_tax_Specified := True;
end;

function salesOrderListEntity.base_shipping_incl_tax_Specified(Index: Integer): boolean;
begin
  Result := Fbase_shipping_incl_tax_Specified;
end;

procedure salesOrderListEntity.Setbase_customer_balance_amount(Index: Integer; const Astring: string);
begin
  Fbase_customer_balance_amount := Astring;
  Fbase_customer_balance_amount_Specified := True;
end;

function salesOrderListEntity.base_customer_balance_amount_Specified(Index: Integer): boolean;
begin
  Result := Fbase_customer_balance_amount_Specified;
end;

procedure salesOrderListEntity.Setcustomer_balance_amount(Index: Integer; const Astring: string);
begin
  Fcustomer_balance_amount := Astring;
  Fcustomer_balance_amount_Specified := True;
end;

function salesOrderListEntity.customer_balance_amount_Specified(Index: Integer): boolean;
begin
  Result := Fcustomer_balance_amount_Specified;
end;

procedure salesOrderListEntity.Setbase_customer_balance_invoiced(Index: Integer; const Astring: string);
begin
  Fbase_customer_balance_invoiced := Astring;
  Fbase_customer_balance_invoiced_Specified := True;
end;

function salesOrderListEntity.base_customer_balance_invoiced_Specified(Index: Integer): boolean;
begin
  Result := Fbase_customer_balance_invoiced_Specified;
end;

procedure salesOrderListEntity.Setcustomer_balance_invoiced(Index: Integer; const Astring: string);
begin
  Fcustomer_balance_invoiced := Astring;
  Fcustomer_balance_invoiced_Specified := True;
end;

function salesOrderListEntity.customer_balance_invoiced_Specified(Index: Integer): boolean;
begin
  Result := Fcustomer_balance_invoiced_Specified;
end;

procedure salesOrderListEntity.Setbase_customer_balance_refunded(Index: Integer; const Astring: string);
begin
  Fbase_customer_balance_refunded := Astring;
  Fbase_customer_balance_refunded_Specified := True;
end;

function salesOrderListEntity.base_customer_balance_refunded_Specified(Index: Integer): boolean;
begin
  Result := Fbase_customer_balance_refunded_Specified;
end;

procedure salesOrderListEntity.Setcustomer_balance_refunded(Index: Integer; const Astring: string);
begin
  Fcustomer_balance_refunded := Astring;
  Fcustomer_balance_refunded_Specified := True;
end;

function salesOrderListEntity.customer_balance_refunded_Specified(Index: Integer): boolean;
begin
  Result := Fcustomer_balance_refunded_Specified;
end;

procedure salesOrderListEntity.Setbase_customer_balance_total_refunded(Index: Integer; const Astring: string);
begin
  Fbase_customer_balance_total_refunded := Astring;
  Fbase_customer_balance_total_refunded_Specified := True;
end;

function salesOrderListEntity.base_customer_balance_total_refunded_Specified(Index: Integer): boolean;
begin
  Result := Fbase_customer_balance_total_refunded_Specified;
end;

procedure salesOrderListEntity.Setcustomer_balance_total_refunded(Index: Integer; const Astring: string);
begin
  Fcustomer_balance_total_refunded := Astring;
  Fcustomer_balance_total_refunded_Specified := True;
end;

function salesOrderListEntity.customer_balance_total_refunded_Specified(Index: Integer): boolean;
begin
  Result := Fcustomer_balance_total_refunded_Specified;
end;

procedure salesOrderListEntity.Setgift_cards(Index: Integer; const Astring: string);
begin
  Fgift_cards := Astring;
  Fgift_cards_Specified := True;
end;

function salesOrderListEntity.gift_cards_Specified(Index: Integer): boolean;
begin
  Result := Fgift_cards_Specified;
end;

procedure salesOrderListEntity.Setbase_gift_cards_amount(Index: Integer; const Astring: string);
begin
  Fbase_gift_cards_amount := Astring;
  Fbase_gift_cards_amount_Specified := True;
end;

function salesOrderListEntity.base_gift_cards_amount_Specified(Index: Integer): boolean;
begin
  Result := Fbase_gift_cards_amount_Specified;
end;

procedure salesOrderListEntity.Setgift_cards_amount(Index: Integer; const Astring: string);
begin
  Fgift_cards_amount := Astring;
  Fgift_cards_amount_Specified := True;
end;

function salesOrderListEntity.gift_cards_amount_Specified(Index: Integer): boolean;
begin
  Result := Fgift_cards_amount_Specified;
end;

procedure salesOrderListEntity.Setbase_gift_cards_invoiced(Index: Integer; const Astring: string);
begin
  Fbase_gift_cards_invoiced := Astring;
  Fbase_gift_cards_invoiced_Specified := True;
end;

function salesOrderListEntity.base_gift_cards_invoiced_Specified(Index: Integer): boolean;
begin
  Result := Fbase_gift_cards_invoiced_Specified;
end;

procedure salesOrderListEntity.Setgift_cards_invoiced(Index: Integer; const Astring: string);
begin
  Fgift_cards_invoiced := Astring;
  Fgift_cards_invoiced_Specified := True;
end;

function salesOrderListEntity.gift_cards_invoiced_Specified(Index: Integer): boolean;
begin
  Result := Fgift_cards_invoiced_Specified;
end;

procedure salesOrderListEntity.Setbase_gift_cards_refunded(Index: Integer; const Astring: string);
begin
  Fbase_gift_cards_refunded := Astring;
  Fbase_gift_cards_refunded_Specified := True;
end;

function salesOrderListEntity.base_gift_cards_refunded_Specified(Index: Integer): boolean;
begin
  Result := Fbase_gift_cards_refunded_Specified;
end;

procedure salesOrderListEntity.Setgift_cards_refunded(Index: Integer; const Astring: string);
begin
  Fgift_cards_refunded := Astring;
  Fgift_cards_refunded_Specified := True;
end;

function salesOrderListEntity.gift_cards_refunded_Specified(Index: Integer): boolean;
begin
  Result := Fgift_cards_refunded_Specified;
end;

procedure salesOrderListEntity.Setreward_points_balance(Index: Integer; const Astring: string);
begin
  Freward_points_balance := Astring;
  Freward_points_balance_Specified := True;
end;

function salesOrderListEntity.reward_points_balance_Specified(Index: Integer): boolean;
begin
  Result := Freward_points_balance_Specified;
end;

procedure salesOrderListEntity.Setbase_reward_currency_amount(Index: Integer; const Astring: string);
begin
  Fbase_reward_currency_amount := Astring;
  Fbase_reward_currency_amount_Specified := True;
end;

function salesOrderListEntity.base_reward_currency_amount_Specified(Index: Integer): boolean;
begin
  Result := Fbase_reward_currency_amount_Specified;
end;

procedure salesOrderListEntity.Setreward_currency_amount(Index: Integer; const Astring: string);
begin
  Freward_currency_amount := Astring;
  Freward_currency_amount_Specified := True;
end;

function salesOrderListEntity.reward_currency_amount_Specified(Index: Integer): boolean;
begin
  Result := Freward_currency_amount_Specified;
end;

procedure salesOrderListEntity.Setbase_reward_currency_amount_invoiced(Index: Integer; const Astring: string);
begin
  Fbase_reward_currency_amount_invoiced := Astring;
  Fbase_reward_currency_amount_invoiced_Specified := True;
end;

function salesOrderListEntity.base_reward_currency_amount_invoiced_Specified(Index: Integer): boolean;
begin
  Result := Fbase_reward_currency_amount_invoiced_Specified;
end;

procedure salesOrderListEntity.Setreward_currency_amount_invoiced(Index: Integer; const Astring: string);
begin
  Freward_currency_amount_invoiced := Astring;
  Freward_currency_amount_invoiced_Specified := True;
end;

function salesOrderListEntity.reward_currency_amount_invoiced_Specified(Index: Integer): boolean;
begin
  Result := Freward_currency_amount_invoiced_Specified;
end;

procedure salesOrderListEntity.Setbase_reward_currency_amount_refunded(Index: Integer; const Astring: string);
begin
  Fbase_reward_currency_amount_refunded := Astring;
  Fbase_reward_currency_amount_refunded_Specified := True;
end;

function salesOrderListEntity.base_reward_currency_amount_refunded_Specified(Index: Integer): boolean;
begin
  Result := Fbase_reward_currency_amount_refunded_Specified;
end;

procedure salesOrderListEntity.Setreward_currency_amount_refunded(Index: Integer; const Astring: string);
begin
  Freward_currency_amount_refunded := Astring;
  Freward_currency_amount_refunded_Specified := True;
end;

function salesOrderListEntity.reward_currency_amount_refunded_Specified(Index: Integer): boolean;
begin
  Result := Freward_currency_amount_refunded_Specified;
end;

procedure salesOrderListEntity.Setreward_points_balance_refunded(Index: Integer; const Astring: string);
begin
  Freward_points_balance_refunded := Astring;
  Freward_points_balance_refunded_Specified := True;
end;

function salesOrderListEntity.reward_points_balance_refunded_Specified(Index: Integer): boolean;
begin
  Result := Freward_points_balance_refunded_Specified;
end;

procedure salesOrderListEntity.Setreward_points_balance_to_refund(Index: Integer; const Astring: string);
begin
  Freward_points_balance_to_refund := Astring;
  Freward_points_balance_to_refund_Specified := True;
end;

function salesOrderListEntity.reward_points_balance_to_refund_Specified(Index: Integer): boolean;
begin
  Result := Freward_points_balance_to_refund_Specified;
end;

procedure salesOrderListEntity.Setreward_salesrule_points(Index: Integer; const Astring: string);
begin
  Freward_salesrule_points := Astring;
  Freward_salesrule_points_Specified := True;
end;

function salesOrderListEntity.reward_salesrule_points_Specified(Index: Integer): boolean;
begin
  Result := Freward_salesrule_points_Specified;
end;

procedure salesOrderListEntity.Setfirstname(Index: Integer; const Astring: string);
begin
  Ffirstname := Astring;
  Ffirstname_Specified := True;
end;

function salesOrderListEntity.firstname_Specified(Index: Integer): boolean;
begin
  Result := Ffirstname_Specified;
end;

procedure salesOrderListEntity.Setlastname(Index: Integer; const Astring: string);
begin
  Flastname := Astring;
  Flastname_Specified := True;
end;

function salesOrderListEntity.lastname_Specified(Index: Integer): boolean;
begin
  Result := Flastname_Specified;
end;

procedure salesOrderListEntity.Settelephone(Index: Integer; const Astring: string);
begin
  Ftelephone := Astring;
  Ftelephone_Specified := True;
end;

function salesOrderListEntity.telephone_Specified(Index: Integer): boolean;
begin
  Result := Ftelephone_Specified;
end;

procedure salesOrderListEntity.Setpostcode(Index: Integer; const Astring: string);
begin
  Fpostcode := Astring;
  Fpostcode_Specified := True;
end;

function salesOrderListEntity.postcode_Specified(Index: Integer): boolean;
begin
  Result := Fpostcode_Specified;
end;

procedure catalogProductCustomOptionValueUpdateEntity.Setsort_order(Index: Integer; const Astring: string);
begin
  Fsort_order := Astring;
  Fsort_order_Specified := True;
end;

function catalogProductCustomOptionValueUpdateEntity.sort_order_Specified(Index: Integer): boolean;
begin
  Result := Fsort_order_Specified;
end;

procedure salesOrderAddressEntity.Setincrement_id(Index: Integer; const Astring: string);
begin
  Fincrement_id := Astring;
  Fincrement_id_Specified := True;
end;

function salesOrderAddressEntity.increment_id_Specified(Index: Integer): boolean;
begin
  Result := Fincrement_id_Specified;
end;

procedure salesOrderAddressEntity.Setparent_id(Index: Integer; const Astring: string);
begin
  Fparent_id := Astring;
  Fparent_id_Specified := True;
end;

function salesOrderAddressEntity.parent_id_Specified(Index: Integer): boolean;
begin
  Result := Fparent_id_Specified;
end;

procedure salesOrderAddressEntity.Setcreated_at(Index: Integer; const Astring: string);
begin
  Fcreated_at := Astring;
  Fcreated_at_Specified := True;
end;

function salesOrderAddressEntity.created_at_Specified(Index: Integer): boolean;
begin
  Result := Fcreated_at_Specified;
end;

procedure salesOrderAddressEntity.Setupdated_at(Index: Integer; const Astring: string);
begin
  Fupdated_at := Astring;
  Fupdated_at_Specified := True;
end;

function salesOrderAddressEntity.updated_at_Specified(Index: Integer): boolean;
begin
  Result := Fupdated_at_Specified;
end;

procedure salesOrderAddressEntity.Setis_active(Index: Integer; const Astring: string);
begin
  Fis_active := Astring;
  Fis_active_Specified := True;
end;

function salesOrderAddressEntity.is_active_Specified(Index: Integer): boolean;
begin
  Result := Fis_active_Specified;
end;

procedure salesOrderAddressEntity.Setaddress_type(Index: Integer; const Astring: string);
begin
  Faddress_type := Astring;
  Faddress_type_Specified := True;
end;

function salesOrderAddressEntity.address_type_Specified(Index: Integer): boolean;
begin
  Result := Faddress_type_Specified;
end;

procedure salesOrderAddressEntity.Setfirstname(Index: Integer; const Astring: string);
begin
  Ffirstname := Astring;
  Ffirstname_Specified := True;
end;

function salesOrderAddressEntity.firstname_Specified(Index: Integer): boolean;
begin
  Result := Ffirstname_Specified;
end;

procedure salesOrderAddressEntity.Setlastname(Index: Integer; const Astring: string);
begin
  Flastname := Astring;
  Flastname_Specified := True;
end;

function salesOrderAddressEntity.lastname_Specified(Index: Integer): boolean;
begin
  Result := Flastname_Specified;
end;

procedure salesOrderAddressEntity.Setcompany(Index: Integer; const Astring: string);
begin
  Fcompany := Astring;
  Fcompany_Specified := True;
end;

function salesOrderAddressEntity.company_Specified(Index: Integer): boolean;
begin
  Result := Fcompany_Specified;
end;

procedure salesOrderAddressEntity.Setstreet(Index: Integer; const Astring: string);
begin
  Fstreet := Astring;
  Fstreet_Specified := True;
end;

function salesOrderAddressEntity.street_Specified(Index: Integer): boolean;
begin
  Result := Fstreet_Specified;
end;

procedure salesOrderAddressEntity.Setcity(Index: Integer; const Astring: string);
begin
  Fcity := Astring;
  Fcity_Specified := True;
end;

function salesOrderAddressEntity.city_Specified(Index: Integer): boolean;
begin
  Result := Fcity_Specified;
end;

procedure salesOrderAddressEntity.Setregion(Index: Integer; const Astring: string);
begin
  Fregion := Astring;
  Fregion_Specified := True;
end;

function salesOrderAddressEntity.region_Specified(Index: Integer): boolean;
begin
  Result := Fregion_Specified;
end;

procedure salesOrderAddressEntity.Setpostcode(Index: Integer; const Astring: string);
begin
  Fpostcode := Astring;
  Fpostcode_Specified := True;
end;

function salesOrderAddressEntity.postcode_Specified(Index: Integer): boolean;
begin
  Result := Fpostcode_Specified;
end;

procedure salesOrderAddressEntity.Setcountry_id(Index: Integer; const Astring: string);
begin
  Fcountry_id := Astring;
  Fcountry_id_Specified := True;
end;

function salesOrderAddressEntity.country_id_Specified(Index: Integer): boolean;
begin
  Result := Fcountry_id_Specified;
end;

procedure salesOrderAddressEntity.Settelephone(Index: Integer; const Astring: string);
begin
  Ftelephone := Astring;
  Ftelephone_Specified := True;
end;

function salesOrderAddressEntity.telephone_Specified(Index: Integer): boolean;
begin
  Result := Ftelephone_Specified;
end;

procedure salesOrderAddressEntity.Setfax(Index: Integer; const Astring: string);
begin
  Ffax := Astring;
  Ffax_Specified := True;
end;

function salesOrderAddressEntity.fax_Specified(Index: Integer): boolean;
begin
  Result := Ffax_Specified;
end;

procedure salesOrderAddressEntity.Setregion_id(Index: Integer; const Astring: string);
begin
  Fregion_id := Astring;
  Fregion_id_Specified := True;
end;

function salesOrderAddressEntity.region_id_Specified(Index: Integer): boolean;
begin
  Result := Fregion_id_Specified;
end;

procedure salesOrderAddressEntity.Setaddress_id(Index: Integer; const Astring: string);
begin
  Faddress_id := Astring;
  Faddress_id_Specified := True;
end;

function salesOrderAddressEntity.address_id_Specified(Index: Integer): boolean;
begin
  Result := Faddress_id_Specified;
end;

destructor salesOrderEntity.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Fitems)-1 do
    SysUtils.FreeAndNil(Fitems[I]);
  System.SetLength(Fitems, 0);
  for I := 0 to System.Length(Fstatus_history)-1 do
    SysUtils.FreeAndNil(Fstatus_history[I]);
  System.SetLength(Fstatus_history, 0);
  SysUtils.FreeAndNil(Fshipping_address);
  SysUtils.FreeAndNil(Fbilling_address);
  SysUtils.FreeAndNil(Fpayment);
  inherited Destroy;
end;

procedure salesOrderEntity.Setincrement_id(Index: Integer; const Astring: string);
begin
  Fincrement_id := Astring;
  Fincrement_id_Specified := True;
end;

function salesOrderEntity.increment_id_Specified(Index: Integer): boolean;
begin
  Result := Fincrement_id_Specified;
end;

procedure salesOrderEntity.Setparent_id(Index: Integer; const Astring: string);
begin
  Fparent_id := Astring;
  Fparent_id_Specified := True;
end;

function salesOrderEntity.parent_id_Specified(Index: Integer): boolean;
begin
  Result := Fparent_id_Specified;
end;

procedure salesOrderEntity.Setstore_id(Index: Integer; const Astring: string);
begin
  Fstore_id := Astring;
  Fstore_id_Specified := True;
end;

function salesOrderEntity.store_id_Specified(Index: Integer): boolean;
begin
  Result := Fstore_id_Specified;
end;

procedure salesOrderEntity.Setcreated_at(Index: Integer; const Astring: string);
begin
  Fcreated_at := Astring;
  Fcreated_at_Specified := True;
end;

function salesOrderEntity.created_at_Specified(Index: Integer): boolean;
begin
  Result := Fcreated_at_Specified;
end;

procedure salesOrderEntity.Setupdated_at(Index: Integer; const Astring: string);
begin
  Fupdated_at := Astring;
  Fupdated_at_Specified := True;
end;

function salesOrderEntity.updated_at_Specified(Index: Integer): boolean;
begin
  Result := Fupdated_at_Specified;
end;

procedure salesOrderEntity.Setis_active(Index: Integer; const Astring: string);
begin
  Fis_active := Astring;
  Fis_active_Specified := True;
end;

function salesOrderEntity.is_active_Specified(Index: Integer): boolean;
begin
  Result := Fis_active_Specified;
end;

procedure salesOrderEntity.Setcustomer_id(Index: Integer; const Astring: string);
begin
  Fcustomer_id := Astring;
  Fcustomer_id_Specified := True;
end;

function salesOrderEntity.customer_id_Specified(Index: Integer): boolean;
begin
  Result := Fcustomer_id_Specified;
end;

procedure salesOrderEntity.Settax_amount(Index: Integer; const Astring: string);
begin
  Ftax_amount := Astring;
  Ftax_amount_Specified := True;
end;

function salesOrderEntity.tax_amount_Specified(Index: Integer): boolean;
begin
  Result := Ftax_amount_Specified;
end;

procedure salesOrderEntity.Setshipping_amount(Index: Integer; const Astring: string);
begin
  Fshipping_amount := Astring;
  Fshipping_amount_Specified := True;
end;

function salesOrderEntity.shipping_amount_Specified(Index: Integer): boolean;
begin
  Result := Fshipping_amount_Specified;
end;

procedure salesOrderEntity.Setdiscount_amount(Index: Integer; const Astring: string);
begin
  Fdiscount_amount := Astring;
  Fdiscount_amount_Specified := True;
end;

function salesOrderEntity.discount_amount_Specified(Index: Integer): boolean;
begin
  Result := Fdiscount_amount_Specified;
end;

procedure salesOrderEntity.Setsubtotal(Index: Integer; const Astring: string);
begin
  Fsubtotal := Astring;
  Fsubtotal_Specified := True;
end;

function salesOrderEntity.subtotal_Specified(Index: Integer): boolean;
begin
  Result := Fsubtotal_Specified;
end;

procedure salesOrderEntity.Setgrand_total(Index: Integer; const Astring: string);
begin
  Fgrand_total := Astring;
  Fgrand_total_Specified := True;
end;

function salesOrderEntity.grand_total_Specified(Index: Integer): boolean;
begin
  Result := Fgrand_total_Specified;
end;

procedure salesOrderEntity.Settotal_paid(Index: Integer; const Astring: string);
begin
  Ftotal_paid := Astring;
  Ftotal_paid_Specified := True;
end;

function salesOrderEntity.total_paid_Specified(Index: Integer): boolean;
begin
  Result := Ftotal_paid_Specified;
end;

procedure salesOrderEntity.Settotal_refunded(Index: Integer; const Astring: string);
begin
  Ftotal_refunded := Astring;
  Ftotal_refunded_Specified := True;
end;

function salesOrderEntity.total_refunded_Specified(Index: Integer): boolean;
begin
  Result := Ftotal_refunded_Specified;
end;

procedure salesOrderEntity.Settotal_qty_ordered(Index: Integer; const Astring: string);
begin
  Ftotal_qty_ordered := Astring;
  Ftotal_qty_ordered_Specified := True;
end;

function salesOrderEntity.total_qty_ordered_Specified(Index: Integer): boolean;
begin
  Result := Ftotal_qty_ordered_Specified;
end;

procedure salesOrderEntity.Settotal_canceled(Index: Integer; const Astring: string);
begin
  Ftotal_canceled := Astring;
  Ftotal_canceled_Specified := True;
end;

function salesOrderEntity.total_canceled_Specified(Index: Integer): boolean;
begin
  Result := Ftotal_canceled_Specified;
end;

procedure salesOrderEntity.Settotal_invoiced(Index: Integer; const Astring: string);
begin
  Ftotal_invoiced := Astring;
  Ftotal_invoiced_Specified := True;
end;

function salesOrderEntity.total_invoiced_Specified(Index: Integer): boolean;
begin
  Result := Ftotal_invoiced_Specified;
end;

procedure salesOrderEntity.Settotal_online_refunded(Index: Integer; const Astring: string);
begin
  Ftotal_online_refunded := Astring;
  Ftotal_online_refunded_Specified := True;
end;

function salesOrderEntity.total_online_refunded_Specified(Index: Integer): boolean;
begin
  Result := Ftotal_online_refunded_Specified;
end;

procedure salesOrderEntity.Settotal_offline_refunded(Index: Integer; const Astring: string);
begin
  Ftotal_offline_refunded := Astring;
  Ftotal_offline_refunded_Specified := True;
end;

function salesOrderEntity.total_offline_refunded_Specified(Index: Integer): boolean;
begin
  Result := Ftotal_offline_refunded_Specified;
end;

procedure salesOrderEntity.Setbase_tax_amount(Index: Integer; const Astring: string);
begin
  Fbase_tax_amount := Astring;
  Fbase_tax_amount_Specified := True;
end;

function salesOrderEntity.base_tax_amount_Specified(Index: Integer): boolean;
begin
  Result := Fbase_tax_amount_Specified;
end;

procedure salesOrderEntity.Setbase_shipping_amount(Index: Integer; const Astring: string);
begin
  Fbase_shipping_amount := Astring;
  Fbase_shipping_amount_Specified := True;
end;

function salesOrderEntity.base_shipping_amount_Specified(Index: Integer): boolean;
begin
  Result := Fbase_shipping_amount_Specified;
end;

procedure salesOrderEntity.Setbase_discount_amount(Index: Integer; const Astring: string);
begin
  Fbase_discount_amount := Astring;
  Fbase_discount_amount_Specified := True;
end;

function salesOrderEntity.base_discount_amount_Specified(Index: Integer): boolean;
begin
  Result := Fbase_discount_amount_Specified;
end;

procedure salesOrderEntity.Setbase_subtotal(Index: Integer; const Astring: string);
begin
  Fbase_subtotal := Astring;
  Fbase_subtotal_Specified := True;
end;

function salesOrderEntity.base_subtotal_Specified(Index: Integer): boolean;
begin
  Result := Fbase_subtotal_Specified;
end;

procedure salesOrderEntity.Setbase_grand_total(Index: Integer; const Astring: string);
begin
  Fbase_grand_total := Astring;
  Fbase_grand_total_Specified := True;
end;

function salesOrderEntity.base_grand_total_Specified(Index: Integer): boolean;
begin
  Result := Fbase_grand_total_Specified;
end;

procedure salesOrderEntity.Setbase_total_paid(Index: Integer; const Astring: string);
begin
  Fbase_total_paid := Astring;
  Fbase_total_paid_Specified := True;
end;

function salesOrderEntity.base_total_paid_Specified(Index: Integer): boolean;
begin
  Result := Fbase_total_paid_Specified;
end;

procedure salesOrderEntity.Setbase_total_refunded(Index: Integer; const Astring: string);
begin
  Fbase_total_refunded := Astring;
  Fbase_total_refunded_Specified := True;
end;

function salesOrderEntity.base_total_refunded_Specified(Index: Integer): boolean;
begin
  Result := Fbase_total_refunded_Specified;
end;

procedure salesOrderEntity.Setbase_total_qty_ordered(Index: Integer; const Astring: string);
begin
  Fbase_total_qty_ordered := Astring;
  Fbase_total_qty_ordered_Specified := True;
end;

function salesOrderEntity.base_total_qty_ordered_Specified(Index: Integer): boolean;
begin
  Result := Fbase_total_qty_ordered_Specified;
end;

procedure salesOrderEntity.Setbase_total_canceled(Index: Integer; const Astring: string);
begin
  Fbase_total_canceled := Astring;
  Fbase_total_canceled_Specified := True;
end;

function salesOrderEntity.base_total_canceled_Specified(Index: Integer): boolean;
begin
  Result := Fbase_total_canceled_Specified;
end;

procedure salesOrderEntity.Setbase_total_invoiced(Index: Integer; const Astring: string);
begin
  Fbase_total_invoiced := Astring;
  Fbase_total_invoiced_Specified := True;
end;

function salesOrderEntity.base_total_invoiced_Specified(Index: Integer): boolean;
begin
  Result := Fbase_total_invoiced_Specified;
end;

procedure salesOrderEntity.Setbase_total_online_refunded(Index: Integer; const Astring: string);
begin
  Fbase_total_online_refunded := Astring;
  Fbase_total_online_refunded_Specified := True;
end;

function salesOrderEntity.base_total_online_refunded_Specified(Index: Integer): boolean;
begin
  Result := Fbase_total_online_refunded_Specified;
end;

procedure salesOrderEntity.Setbase_total_offline_refunded(Index: Integer; const Astring: string);
begin
  Fbase_total_offline_refunded := Astring;
  Fbase_total_offline_refunded_Specified := True;
end;

function salesOrderEntity.base_total_offline_refunded_Specified(Index: Integer): boolean;
begin
  Result := Fbase_total_offline_refunded_Specified;
end;

procedure salesOrderEntity.Setbilling_address_id(Index: Integer; const Astring: string);
begin
  Fbilling_address_id := Astring;
  Fbilling_address_id_Specified := True;
end;

function salesOrderEntity.billing_address_id_Specified(Index: Integer): boolean;
begin
  Result := Fbilling_address_id_Specified;
end;

procedure salesOrderEntity.Setbilling_firstname(Index: Integer; const Astring: string);
begin
  Fbilling_firstname := Astring;
  Fbilling_firstname_Specified := True;
end;

function salesOrderEntity.billing_firstname_Specified(Index: Integer): boolean;
begin
  Result := Fbilling_firstname_Specified;
end;

procedure salesOrderEntity.Setbilling_lastname(Index: Integer; const Astring: string);
begin
  Fbilling_lastname := Astring;
  Fbilling_lastname_Specified := True;
end;

function salesOrderEntity.billing_lastname_Specified(Index: Integer): boolean;
begin
  Result := Fbilling_lastname_Specified;
end;

procedure salesOrderEntity.Setshipping_address_id(Index: Integer; const Astring: string);
begin
  Fshipping_address_id := Astring;
  Fshipping_address_id_Specified := True;
end;

function salesOrderEntity.shipping_address_id_Specified(Index: Integer): boolean;
begin
  Result := Fshipping_address_id_Specified;
end;

procedure salesOrderEntity.Setshipping_firstname(Index: Integer; const Astring: string);
begin
  Fshipping_firstname := Astring;
  Fshipping_firstname_Specified := True;
end;

function salesOrderEntity.shipping_firstname_Specified(Index: Integer): boolean;
begin
  Result := Fshipping_firstname_Specified;
end;

procedure salesOrderEntity.Setshipping_lastname(Index: Integer; const Astring: string);
begin
  Fshipping_lastname := Astring;
  Fshipping_lastname_Specified := True;
end;

function salesOrderEntity.shipping_lastname_Specified(Index: Integer): boolean;
begin
  Result := Fshipping_lastname_Specified;
end;

procedure salesOrderEntity.Setbilling_name(Index: Integer; const Astring: string);
begin
  Fbilling_name := Astring;
  Fbilling_name_Specified := True;
end;

function salesOrderEntity.billing_name_Specified(Index: Integer): boolean;
begin
  Result := Fbilling_name_Specified;
end;

procedure salesOrderEntity.Setshipping_name(Index: Integer; const Astring: string);
begin
  Fshipping_name := Astring;
  Fshipping_name_Specified := True;
end;

function salesOrderEntity.shipping_name_Specified(Index: Integer): boolean;
begin
  Result := Fshipping_name_Specified;
end;

procedure salesOrderEntity.Setstore_to_base_rate(Index: Integer; const Astring: string);
begin
  Fstore_to_base_rate := Astring;
  Fstore_to_base_rate_Specified := True;
end;

function salesOrderEntity.store_to_base_rate_Specified(Index: Integer): boolean;
begin
  Result := Fstore_to_base_rate_Specified;
end;

procedure salesOrderEntity.Setstore_to_order_rate(Index: Integer; const Astring: string);
begin
  Fstore_to_order_rate := Astring;
  Fstore_to_order_rate_Specified := True;
end;

function salesOrderEntity.store_to_order_rate_Specified(Index: Integer): boolean;
begin
  Result := Fstore_to_order_rate_Specified;
end;

procedure salesOrderEntity.Setbase_to_global_rate(Index: Integer; const Astring: string);
begin
  Fbase_to_global_rate := Astring;
  Fbase_to_global_rate_Specified := True;
end;

function salesOrderEntity.base_to_global_rate_Specified(Index: Integer): boolean;
begin
  Result := Fbase_to_global_rate_Specified;
end;

procedure salesOrderEntity.Setbase_to_order_rate(Index: Integer; const Astring: string);
begin
  Fbase_to_order_rate := Astring;
  Fbase_to_order_rate_Specified := True;
end;

function salesOrderEntity.base_to_order_rate_Specified(Index: Integer): boolean;
begin
  Result := Fbase_to_order_rate_Specified;
end;

procedure salesOrderEntity.Setweight(Index: Integer; const Astring: string);
begin
  Fweight := Astring;
  Fweight_Specified := True;
end;

function salesOrderEntity.weight_Specified(Index: Integer): boolean;
begin
  Result := Fweight_Specified;
end;

procedure salesOrderEntity.Setstore_name(Index: Integer; const Astring: string);
begin
  Fstore_name := Astring;
  Fstore_name_Specified := True;
end;

function salesOrderEntity.store_name_Specified(Index: Integer): boolean;
begin
  Result := Fstore_name_Specified;
end;

procedure salesOrderEntity.Setremote_ip(Index: Integer; const Astring: string);
begin
  Fremote_ip := Astring;
  Fremote_ip_Specified := True;
end;

function salesOrderEntity.remote_ip_Specified(Index: Integer): boolean;
begin
  Result := Fremote_ip_Specified;
end;

procedure salesOrderEntity.Setstatus(Index: Integer; const Astring: string);
begin
  Fstatus := Astring;
  Fstatus_Specified := True;
end;

function salesOrderEntity.status_Specified(Index: Integer): boolean;
begin
  Result := Fstatus_Specified;
end;

procedure salesOrderEntity.Setstate(Index: Integer; const Astring: string);
begin
  Fstate := Astring;
  Fstate_Specified := True;
end;

function salesOrderEntity.state_Specified(Index: Integer): boolean;
begin
  Result := Fstate_Specified;
end;

procedure salesOrderEntity.Setapplied_rule_ids(Index: Integer; const Astring: string);
begin
  Fapplied_rule_ids := Astring;
  Fapplied_rule_ids_Specified := True;
end;

function salesOrderEntity.applied_rule_ids_Specified(Index: Integer): boolean;
begin
  Result := Fapplied_rule_ids_Specified;
end;

procedure salesOrderEntity.Setglobal_currency_code(Index: Integer; const Astring: string);
begin
  Fglobal_currency_code := Astring;
  Fglobal_currency_code_Specified := True;
end;

function salesOrderEntity.global_currency_code_Specified(Index: Integer): boolean;
begin
  Result := Fglobal_currency_code_Specified;
end;

procedure salesOrderEntity.Setbase_currency_code(Index: Integer; const Astring: string);
begin
  Fbase_currency_code := Astring;
  Fbase_currency_code_Specified := True;
end;

function salesOrderEntity.base_currency_code_Specified(Index: Integer): boolean;
begin
  Result := Fbase_currency_code_Specified;
end;

procedure salesOrderEntity.Setstore_currency_code(Index: Integer; const Astring: string);
begin
  Fstore_currency_code := Astring;
  Fstore_currency_code_Specified := True;
end;

function salesOrderEntity.store_currency_code_Specified(Index: Integer): boolean;
begin
  Result := Fstore_currency_code_Specified;
end;

procedure salesOrderEntity.Setorder_currency_code(Index: Integer; const Astring: string);
begin
  Forder_currency_code := Astring;
  Forder_currency_code_Specified := True;
end;

function salesOrderEntity.order_currency_code_Specified(Index: Integer): boolean;
begin
  Result := Forder_currency_code_Specified;
end;

procedure salesOrderEntity.Setshipping_method(Index: Integer; const Astring: string);
begin
  Fshipping_method := Astring;
  Fshipping_method_Specified := True;
end;

function salesOrderEntity.shipping_method_Specified(Index: Integer): boolean;
begin
  Result := Fshipping_method_Specified;
end;

procedure salesOrderEntity.Setshipping_description(Index: Integer; const Astring: string);
begin
  Fshipping_description := Astring;
  Fshipping_description_Specified := True;
end;

function salesOrderEntity.shipping_description_Specified(Index: Integer): boolean;
begin
  Result := Fshipping_description_Specified;
end;

procedure salesOrderEntity.Setcustomer_email(Index: Integer; const Astring: string);
begin
  Fcustomer_email := Astring;
  Fcustomer_email_Specified := True;
end;

function salesOrderEntity.customer_email_Specified(Index: Integer): boolean;
begin
  Result := Fcustomer_email_Specified;
end;

procedure salesOrderEntity.Setcustomer_firstname(Index: Integer; const Astring: string);
begin
  Fcustomer_firstname := Astring;
  Fcustomer_firstname_Specified := True;
end;

function salesOrderEntity.customer_firstname_Specified(Index: Integer): boolean;
begin
  Result := Fcustomer_firstname_Specified;
end;

procedure salesOrderEntity.Setcustomer_lastname(Index: Integer; const Astring: string);
begin
  Fcustomer_lastname := Astring;
  Fcustomer_lastname_Specified := True;
end;

function salesOrderEntity.customer_lastname_Specified(Index: Integer): boolean;
begin
  Result := Fcustomer_lastname_Specified;
end;

procedure salesOrderEntity.Setquote_id(Index: Integer; const Astring: string);
begin
  Fquote_id := Astring;
  Fquote_id_Specified := True;
end;

function salesOrderEntity.quote_id_Specified(Index: Integer): boolean;
begin
  Result := Fquote_id_Specified;
end;

procedure salesOrderEntity.Setis_virtual(Index: Integer; const Astring: string);
begin
  Fis_virtual := Astring;
  Fis_virtual_Specified := True;
end;

function salesOrderEntity.is_virtual_Specified(Index: Integer): boolean;
begin
  Result := Fis_virtual_Specified;
end;

procedure salesOrderEntity.Setcustomer_group_id(Index: Integer; const Astring: string);
begin
  Fcustomer_group_id := Astring;
  Fcustomer_group_id_Specified := True;
end;

function salesOrderEntity.customer_group_id_Specified(Index: Integer): boolean;
begin
  Result := Fcustomer_group_id_Specified;
end;

procedure salesOrderEntity.Setcustomer_note_notify(Index: Integer; const Astring: string);
begin
  Fcustomer_note_notify := Astring;
  Fcustomer_note_notify_Specified := True;
end;

function salesOrderEntity.customer_note_notify_Specified(Index: Integer): boolean;
begin
  Result := Fcustomer_note_notify_Specified;
end;

procedure salesOrderEntity.Setcustomer_is_guest(Index: Integer; const Astring: string);
begin
  Fcustomer_is_guest := Astring;
  Fcustomer_is_guest_Specified := True;
end;

function salesOrderEntity.customer_is_guest_Specified(Index: Integer): boolean;
begin
  Result := Fcustomer_is_guest_Specified;
end;

procedure salesOrderEntity.Setemail_sent(Index: Integer; const Astring: string);
begin
  Femail_sent := Astring;
  Femail_sent_Specified := True;
end;

function salesOrderEntity.email_sent_Specified(Index: Integer): boolean;
begin
  Result := Femail_sent_Specified;
end;

procedure salesOrderEntity.Setorder_id(Index: Integer; const Astring: string);
begin
  Forder_id := Astring;
  Forder_id_Specified := True;
end;

function salesOrderEntity.order_id_Specified(Index: Integer): boolean;
begin
  Result := Forder_id_Specified;
end;

procedure salesOrderEntity.Setgift_message_id(Index: Integer; const Astring: string);
begin
  Fgift_message_id := Astring;
  Fgift_message_id_Specified := True;
end;

function salesOrderEntity.gift_message_id_Specified(Index: Integer): boolean;
begin
  Result := Fgift_message_id_Specified;
end;

procedure salesOrderEntity.Setgift_message(Index: Integer; const Astring: string);
begin
  Fgift_message := Astring;
  Fgift_message_Specified := True;
end;

function salesOrderEntity.gift_message_Specified(Index: Integer): boolean;
begin
  Result := Fgift_message_Specified;
end;

procedure salesOrderEntity.Setshipping_address(Index: Integer; const AsalesOrderAddressEntity: salesOrderAddressEntity);
begin
  Fshipping_address := AsalesOrderAddressEntity;
  Fshipping_address_Specified := True;
end;

function salesOrderEntity.shipping_address_Specified(Index: Integer): boolean;
begin
  Result := Fshipping_address_Specified;
end;

procedure salesOrderEntity.Setbilling_address(Index: Integer; const AsalesOrderAddressEntity: salesOrderAddressEntity);
begin
  Fbilling_address := AsalesOrderAddressEntity;
  Fbilling_address_Specified := True;
end;

function salesOrderEntity.billing_address_Specified(Index: Integer): boolean;
begin
  Result := Fbilling_address_Specified;
end;

procedure salesOrderEntity.Setitems(Index: Integer; const AsalesOrderItemEntityArray: salesOrderItemEntityArray);
begin
  Fitems := AsalesOrderItemEntityArray;
  Fitems_Specified := True;
end;

function salesOrderEntity.items_Specified(Index: Integer): boolean;
begin
  Result := Fitems_Specified;
end;

procedure salesOrderEntity.Setpayment(Index: Integer; const AsalesOrderPaymentEntity: salesOrderPaymentEntity);
begin
  Fpayment := AsalesOrderPaymentEntity;
  Fpayment_Specified := True;
end;

function salesOrderEntity.payment_Specified(Index: Integer): boolean;
begin
  Result := Fpayment_Specified;
end;

procedure salesOrderEntity.Setstatus_history(Index: Integer; const AsalesOrderStatusHistoryEntityArray: salesOrderStatusHistoryEntityArray);
begin
  Fstatus_history := AsalesOrderStatusHistoryEntityArray;
  Fstatus_history_Specified := True;
end;

function salesOrderEntity.status_history_Specified(Index: Integer): boolean;
begin
  Result := Fstatus_history_Specified;
end;

procedure catalogProductCustomOptionValueAddEntity.Setsort_order(Index: Integer; const Astring: string);
begin
  Fsort_order := Astring;
  Fsort_order_Specified := True;
end;

function catalogProductCustomOptionValueAddEntity.sort_order_Specified(Index: Integer): boolean;
begin
  Result := Fsort_order_Specified;
end;

procedure salesOrderInvoiceItemEntity.Setincrement_id(Index: Integer; const Astring: string);
begin
  Fincrement_id := Astring;
  Fincrement_id_Specified := True;
end;

function salesOrderInvoiceItemEntity.increment_id_Specified(Index: Integer): boolean;
begin
  Result := Fincrement_id_Specified;
end;

procedure salesOrderInvoiceItemEntity.Setparent_id(Index: Integer; const Astring: string);
begin
  Fparent_id := Astring;
  Fparent_id_Specified := True;
end;

function salesOrderInvoiceItemEntity.parent_id_Specified(Index: Integer): boolean;
begin
  Result := Fparent_id_Specified;
end;

procedure salesOrderInvoiceItemEntity.Setcreated_at(Index: Integer; const Astring: string);
begin
  Fcreated_at := Astring;
  Fcreated_at_Specified := True;
end;

function salesOrderInvoiceItemEntity.created_at_Specified(Index: Integer): boolean;
begin
  Result := Fcreated_at_Specified;
end;

procedure salesOrderInvoiceItemEntity.Setupdated_at(Index: Integer; const Astring: string);
begin
  Fupdated_at := Astring;
  Fupdated_at_Specified := True;
end;

function salesOrderInvoiceItemEntity.updated_at_Specified(Index: Integer): boolean;
begin
  Result := Fupdated_at_Specified;
end;

procedure salesOrderInvoiceItemEntity.Setis_active(Index: Integer; const Astring: string);
begin
  Fis_active := Astring;
  Fis_active_Specified := True;
end;

function salesOrderInvoiceItemEntity.is_active_Specified(Index: Integer): boolean;
begin
  Result := Fis_active_Specified;
end;

procedure salesOrderInvoiceItemEntity.Setweee_tax_applied(Index: Integer; const Astring: string);
begin
  Fweee_tax_applied := Astring;
  Fweee_tax_applied_Specified := True;
end;

function salesOrderInvoiceItemEntity.weee_tax_applied_Specified(Index: Integer): boolean;
begin
  Result := Fweee_tax_applied_Specified;
end;

procedure salesOrderInvoiceItemEntity.Setqty(Index: Integer; const Astring: string);
begin
  Fqty := Astring;
  Fqty_Specified := True;
end;

function salesOrderInvoiceItemEntity.qty_Specified(Index: Integer): boolean;
begin
  Result := Fqty_Specified;
end;

procedure salesOrderInvoiceItemEntity.Setcost(Index: Integer; const Astring: string);
begin
  Fcost := Astring;
  Fcost_Specified := True;
end;

function salesOrderInvoiceItemEntity.cost_Specified(Index: Integer): boolean;
begin
  Result := Fcost_Specified;
end;

procedure salesOrderInvoiceItemEntity.Setprice(Index: Integer; const Astring: string);
begin
  Fprice := Astring;
  Fprice_Specified := True;
end;

function salesOrderInvoiceItemEntity.price_Specified(Index: Integer): boolean;
begin
  Result := Fprice_Specified;
end;

procedure salesOrderInvoiceItemEntity.Settax_amount(Index: Integer; const Astring: string);
begin
  Ftax_amount := Astring;
  Ftax_amount_Specified := True;
end;

function salesOrderInvoiceItemEntity.tax_amount_Specified(Index: Integer): boolean;
begin
  Result := Ftax_amount_Specified;
end;

procedure salesOrderInvoiceItemEntity.Setrow_total(Index: Integer; const Astring: string);
begin
  Frow_total := Astring;
  Frow_total_Specified := True;
end;

function salesOrderInvoiceItemEntity.row_total_Specified(Index: Integer): boolean;
begin
  Result := Frow_total_Specified;
end;

procedure salesOrderInvoiceItemEntity.Setbase_price(Index: Integer; const Astring: string);
begin
  Fbase_price := Astring;
  Fbase_price_Specified := True;
end;

function salesOrderInvoiceItemEntity.base_price_Specified(Index: Integer): boolean;
begin
  Result := Fbase_price_Specified;
end;

procedure salesOrderInvoiceItemEntity.Setbase_tax_amount(Index: Integer; const Astring: string);
begin
  Fbase_tax_amount := Astring;
  Fbase_tax_amount_Specified := True;
end;

function salesOrderInvoiceItemEntity.base_tax_amount_Specified(Index: Integer): boolean;
begin
  Result := Fbase_tax_amount_Specified;
end;

procedure salesOrderInvoiceItemEntity.Setbase_row_total(Index: Integer; const Astring: string);
begin
  Fbase_row_total := Astring;
  Fbase_row_total_Specified := True;
end;

function salesOrderInvoiceItemEntity.base_row_total_Specified(Index: Integer): boolean;
begin
  Result := Fbase_row_total_Specified;
end;

procedure salesOrderInvoiceItemEntity.Setbase_weee_tax_applied_amount(Index: Integer; const Astring: string);
begin
  Fbase_weee_tax_applied_amount := Astring;
  Fbase_weee_tax_applied_amount_Specified := True;
end;

function salesOrderInvoiceItemEntity.base_weee_tax_applied_amount_Specified(Index: Integer): boolean;
begin
  Result := Fbase_weee_tax_applied_amount_Specified;
end;

procedure salesOrderInvoiceItemEntity.Setbase_weee_tax_applied_row_amount(Index: Integer; const Astring: string);
begin
  Fbase_weee_tax_applied_row_amount := Astring;
  Fbase_weee_tax_applied_row_amount_Specified := True;
end;

function salesOrderInvoiceItemEntity.base_weee_tax_applied_row_amount_Specified(Index: Integer): boolean;
begin
  Result := Fbase_weee_tax_applied_row_amount_Specified;
end;

procedure salesOrderInvoiceItemEntity.Setweee_tax_applied_amount(Index: Integer; const Astring: string);
begin
  Fweee_tax_applied_amount := Astring;
  Fweee_tax_applied_amount_Specified := True;
end;

function salesOrderInvoiceItemEntity.weee_tax_applied_amount_Specified(Index: Integer): boolean;
begin
  Result := Fweee_tax_applied_amount_Specified;
end;

procedure salesOrderInvoiceItemEntity.Setweee_tax_applied_row_amount(Index: Integer; const Astring: string);
begin
  Fweee_tax_applied_row_amount := Astring;
  Fweee_tax_applied_row_amount_Specified := True;
end;

function salesOrderInvoiceItemEntity.weee_tax_applied_row_amount_Specified(Index: Integer): boolean;
begin
  Result := Fweee_tax_applied_row_amount_Specified;
end;

procedure salesOrderInvoiceItemEntity.Setweee_tax_disposition(Index: Integer; const Astring: string);
begin
  Fweee_tax_disposition := Astring;
  Fweee_tax_disposition_Specified := True;
end;

function salesOrderInvoiceItemEntity.weee_tax_disposition_Specified(Index: Integer): boolean;
begin
  Result := Fweee_tax_disposition_Specified;
end;

procedure salesOrderInvoiceItemEntity.Setweee_tax_row_disposition(Index: Integer; const Astring: string);
begin
  Fweee_tax_row_disposition := Astring;
  Fweee_tax_row_disposition_Specified := True;
end;

function salesOrderInvoiceItemEntity.weee_tax_row_disposition_Specified(Index: Integer): boolean;
begin
  Result := Fweee_tax_row_disposition_Specified;
end;

procedure salesOrderInvoiceItemEntity.Setbase_weee_tax_disposition(Index: Integer; const Astring: string);
begin
  Fbase_weee_tax_disposition := Astring;
  Fbase_weee_tax_disposition_Specified := True;
end;

function salesOrderInvoiceItemEntity.base_weee_tax_disposition_Specified(Index: Integer): boolean;
begin
  Result := Fbase_weee_tax_disposition_Specified;
end;

procedure salesOrderInvoiceItemEntity.Setbase_weee_tax_row_disposition(Index: Integer; const Astring: string);
begin
  Fbase_weee_tax_row_disposition := Astring;
  Fbase_weee_tax_row_disposition_Specified := True;
end;

function salesOrderInvoiceItemEntity.base_weee_tax_row_disposition_Specified(Index: Integer): boolean;
begin
  Result := Fbase_weee_tax_row_disposition_Specified;
end;

procedure salesOrderInvoiceItemEntity.Setsku(Index: Integer; const Astring: string);
begin
  Fsku := Astring;
  Fsku_Specified := True;
end;

function salesOrderInvoiceItemEntity.sku_Specified(Index: Integer): boolean;
begin
  Result := Fsku_Specified;
end;

procedure salesOrderInvoiceItemEntity.Setname_(Index: Integer; const Astring: string);
begin
  Fname_ := Astring;
  Fname__Specified := True;
end;

function salesOrderInvoiceItemEntity.name__Specified(Index: Integer): boolean;
begin
  Result := Fname__Specified;
end;

procedure salesOrderInvoiceItemEntity.Setorder_item_id(Index: Integer; const Astring: string);
begin
  Forder_item_id := Astring;
  Forder_item_id_Specified := True;
end;

function salesOrderInvoiceItemEntity.order_item_id_Specified(Index: Integer): boolean;
begin
  Result := Forder_item_id_Specified;
end;

procedure salesOrderInvoiceItemEntity.Setproduct_id(Index: Integer; const Astring: string);
begin
  Fproduct_id := Astring;
  Fproduct_id_Specified := True;
end;

function salesOrderInvoiceItemEntity.product_id_Specified(Index: Integer): boolean;
begin
  Result := Fproduct_id_Specified;
end;

procedure salesOrderInvoiceItemEntity.Setitem_id(Index: Integer; const Astring: string);
begin
  Fitem_id := Astring;
  Fitem_id_Specified := True;
end;

function salesOrderInvoiceItemEntity.item_id_Specified(Index: Integer): boolean;
begin
  Result := Fitem_id_Specified;
end;

procedure salesOrderInvoiceCommentEntity.Setincrement_id(Index: Integer; const Astring: string);
begin
  Fincrement_id := Astring;
  Fincrement_id_Specified := True;
end;

function salesOrderInvoiceCommentEntity.increment_id_Specified(Index: Integer): boolean;
begin
  Result := Fincrement_id_Specified;
end;

procedure salesOrderInvoiceCommentEntity.Setparent_id(Index: Integer; const Astring: string);
begin
  Fparent_id := Astring;
  Fparent_id_Specified := True;
end;

function salesOrderInvoiceCommentEntity.parent_id_Specified(Index: Integer): boolean;
begin
  Result := Fparent_id_Specified;
end;

procedure salesOrderInvoiceCommentEntity.Setcreated_at(Index: Integer; const Astring: string);
begin
  Fcreated_at := Astring;
  Fcreated_at_Specified := True;
end;

function salesOrderInvoiceCommentEntity.created_at_Specified(Index: Integer): boolean;
begin
  Result := Fcreated_at_Specified;
end;

procedure salesOrderInvoiceCommentEntity.Setupdated_at(Index: Integer; const Astring: string);
begin
  Fupdated_at := Astring;
  Fupdated_at_Specified := True;
end;

function salesOrderInvoiceCommentEntity.updated_at_Specified(Index: Integer): boolean;
begin
  Result := Fupdated_at_Specified;
end;

procedure salesOrderInvoiceCommentEntity.Setis_active(Index: Integer; const Astring: string);
begin
  Fis_active := Astring;
  Fis_active_Specified := True;
end;

function salesOrderInvoiceCommentEntity.is_active_Specified(Index: Integer): boolean;
begin
  Result := Fis_active_Specified;
end;

procedure salesOrderInvoiceCommentEntity.Setcomment(Index: Integer; const Astring: string);
begin
  Fcomment := Astring;
  Fcomment_Specified := True;
end;

function salesOrderInvoiceCommentEntity.comment_Specified(Index: Integer): boolean;
begin
  Result := Fcomment_Specified;
end;

procedure salesOrderInvoiceCommentEntity.Setis_customer_notified(Index: Integer; const Astring: string);
begin
  Fis_customer_notified := Astring;
  Fis_customer_notified_Specified := True;
end;

function salesOrderInvoiceCommentEntity.is_customer_notified_Specified(Index: Integer): boolean;
begin
  Result := Fis_customer_notified_Specified;
end;

procedure salesOrderInvoiceCommentEntity.Setcomment_id(Index: Integer; const Astring: string);
begin
  Fcomment_id := Astring;
  Fcomment_id_Specified := True;
end;

function salesOrderInvoiceCommentEntity.comment_id_Specified(Index: Integer): boolean;
begin
  Result := Fcomment_id_Specified;
end;

destructor salesOrderInvoiceEntity.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Fitems)-1 do
    SysUtils.FreeAndNil(Fitems[I]);
  System.SetLength(Fitems, 0);
  for I := 0 to System.Length(Fcomments)-1 do
    SysUtils.FreeAndNil(Fcomments[I]);
  System.SetLength(Fcomments, 0);
  inherited Destroy;
end;

procedure salesOrderInvoiceEntity.Setincrement_id(Index: Integer; const Astring: string);
begin
  Fincrement_id := Astring;
  Fincrement_id_Specified := True;
end;

function salesOrderInvoiceEntity.increment_id_Specified(Index: Integer): boolean;
begin
  Result := Fincrement_id_Specified;
end;

procedure salesOrderInvoiceEntity.Setparent_id(Index: Integer; const Astring: string);
begin
  Fparent_id := Astring;
  Fparent_id_Specified := True;
end;

function salesOrderInvoiceEntity.parent_id_Specified(Index: Integer): boolean;
begin
  Result := Fparent_id_Specified;
end;

procedure salesOrderInvoiceEntity.Setstore_id(Index: Integer; const Astring: string);
begin
  Fstore_id := Astring;
  Fstore_id_Specified := True;
end;

function salesOrderInvoiceEntity.store_id_Specified(Index: Integer): boolean;
begin
  Result := Fstore_id_Specified;
end;

procedure salesOrderInvoiceEntity.Setcreated_at(Index: Integer; const Astring: string);
begin
  Fcreated_at := Astring;
  Fcreated_at_Specified := True;
end;

function salesOrderInvoiceEntity.created_at_Specified(Index: Integer): boolean;
begin
  Result := Fcreated_at_Specified;
end;

procedure salesOrderInvoiceEntity.Setupdated_at(Index: Integer; const Astring: string);
begin
  Fupdated_at := Astring;
  Fupdated_at_Specified := True;
end;

function salesOrderInvoiceEntity.updated_at_Specified(Index: Integer): boolean;
begin
  Result := Fupdated_at_Specified;
end;

procedure salesOrderInvoiceEntity.Setis_active(Index: Integer; const Astring: string);
begin
  Fis_active := Astring;
  Fis_active_Specified := True;
end;

function salesOrderInvoiceEntity.is_active_Specified(Index: Integer): boolean;
begin
  Result := Fis_active_Specified;
end;

procedure salesOrderInvoiceEntity.Setglobal_currency_code(Index: Integer; const Astring: string);
begin
  Fglobal_currency_code := Astring;
  Fglobal_currency_code_Specified := True;
end;

function salesOrderInvoiceEntity.global_currency_code_Specified(Index: Integer): boolean;
begin
  Result := Fglobal_currency_code_Specified;
end;

procedure salesOrderInvoiceEntity.Setbase_currency_code(Index: Integer; const Astring: string);
begin
  Fbase_currency_code := Astring;
  Fbase_currency_code_Specified := True;
end;

function salesOrderInvoiceEntity.base_currency_code_Specified(Index: Integer): boolean;
begin
  Result := Fbase_currency_code_Specified;
end;

procedure salesOrderInvoiceEntity.Setstore_currency_code(Index: Integer; const Astring: string);
begin
  Fstore_currency_code := Astring;
  Fstore_currency_code_Specified := True;
end;

function salesOrderInvoiceEntity.store_currency_code_Specified(Index: Integer): boolean;
begin
  Result := Fstore_currency_code_Specified;
end;

procedure salesOrderInvoiceEntity.Setorder_currency_code(Index: Integer; const Astring: string);
begin
  Forder_currency_code := Astring;
  Forder_currency_code_Specified := True;
end;

function salesOrderInvoiceEntity.order_currency_code_Specified(Index: Integer): boolean;
begin
  Result := Forder_currency_code_Specified;
end;

procedure salesOrderInvoiceEntity.Setstore_to_base_rate(Index: Integer; const Astring: string);
begin
  Fstore_to_base_rate := Astring;
  Fstore_to_base_rate_Specified := True;
end;

function salesOrderInvoiceEntity.store_to_base_rate_Specified(Index: Integer): boolean;
begin
  Result := Fstore_to_base_rate_Specified;
end;

procedure salesOrderInvoiceEntity.Setstore_to_order_rate(Index: Integer; const Astring: string);
begin
  Fstore_to_order_rate := Astring;
  Fstore_to_order_rate_Specified := True;
end;

function salesOrderInvoiceEntity.store_to_order_rate_Specified(Index: Integer): boolean;
begin
  Result := Fstore_to_order_rate_Specified;
end;

procedure salesOrderInvoiceEntity.Setbase_to_global_rate(Index: Integer; const Astring: string);
begin
  Fbase_to_global_rate := Astring;
  Fbase_to_global_rate_Specified := True;
end;

function salesOrderInvoiceEntity.base_to_global_rate_Specified(Index: Integer): boolean;
begin
  Result := Fbase_to_global_rate_Specified;
end;

procedure salesOrderInvoiceEntity.Setbase_to_order_rate(Index: Integer; const Astring: string);
begin
  Fbase_to_order_rate := Astring;
  Fbase_to_order_rate_Specified := True;
end;

function salesOrderInvoiceEntity.base_to_order_rate_Specified(Index: Integer): boolean;
begin
  Result := Fbase_to_order_rate_Specified;
end;

procedure salesOrderInvoiceEntity.Setsubtotal(Index: Integer; const Astring: string);
begin
  Fsubtotal := Astring;
  Fsubtotal_Specified := True;
end;

function salesOrderInvoiceEntity.subtotal_Specified(Index: Integer): boolean;
begin
  Result := Fsubtotal_Specified;
end;

procedure salesOrderInvoiceEntity.Setbase_subtotal(Index: Integer; const Astring: string);
begin
  Fbase_subtotal := Astring;
  Fbase_subtotal_Specified := True;
end;

function salesOrderInvoiceEntity.base_subtotal_Specified(Index: Integer): boolean;
begin
  Result := Fbase_subtotal_Specified;
end;

procedure salesOrderInvoiceEntity.Setbase_grand_total(Index: Integer; const Astring: string);
begin
  Fbase_grand_total := Astring;
  Fbase_grand_total_Specified := True;
end;

function salesOrderInvoiceEntity.base_grand_total_Specified(Index: Integer): boolean;
begin
  Result := Fbase_grand_total_Specified;
end;

procedure salesOrderInvoiceEntity.Setdiscount_amount(Index: Integer; const Astring: string);
begin
  Fdiscount_amount := Astring;
  Fdiscount_amount_Specified := True;
end;

function salesOrderInvoiceEntity.discount_amount_Specified(Index: Integer): boolean;
begin
  Result := Fdiscount_amount_Specified;
end;

procedure salesOrderInvoiceEntity.Setbase_discount_amount(Index: Integer; const Astring: string);
begin
  Fbase_discount_amount := Astring;
  Fbase_discount_amount_Specified := True;
end;

function salesOrderInvoiceEntity.base_discount_amount_Specified(Index: Integer): boolean;
begin
  Result := Fbase_discount_amount_Specified;
end;

procedure salesOrderInvoiceEntity.Setshipping_amount(Index: Integer; const Astring: string);
begin
  Fshipping_amount := Astring;
  Fshipping_amount_Specified := True;
end;

function salesOrderInvoiceEntity.shipping_amount_Specified(Index: Integer): boolean;
begin
  Result := Fshipping_amount_Specified;
end;

procedure salesOrderInvoiceEntity.Setbase_shipping_amount(Index: Integer; const Astring: string);
begin
  Fbase_shipping_amount := Astring;
  Fbase_shipping_amount_Specified := True;
end;

function salesOrderInvoiceEntity.base_shipping_amount_Specified(Index: Integer): boolean;
begin
  Result := Fbase_shipping_amount_Specified;
end;

procedure salesOrderInvoiceEntity.Settax_amount(Index: Integer; const Astring: string);
begin
  Ftax_amount := Astring;
  Ftax_amount_Specified := True;
end;

function salesOrderInvoiceEntity.tax_amount_Specified(Index: Integer): boolean;
begin
  Result := Ftax_amount_Specified;
end;

procedure salesOrderInvoiceEntity.Setbase_tax_amount(Index: Integer; const Astring: string);
begin
  Fbase_tax_amount := Astring;
  Fbase_tax_amount_Specified := True;
end;

function salesOrderInvoiceEntity.base_tax_amount_Specified(Index: Integer): boolean;
begin
  Result := Fbase_tax_amount_Specified;
end;

procedure salesOrderInvoiceEntity.Setbilling_address_id(Index: Integer; const Astring: string);
begin
  Fbilling_address_id := Astring;
  Fbilling_address_id_Specified := True;
end;

function salesOrderInvoiceEntity.billing_address_id_Specified(Index: Integer): boolean;
begin
  Result := Fbilling_address_id_Specified;
end;

procedure salesOrderInvoiceEntity.Setbilling_firstname(Index: Integer; const Astring: string);
begin
  Fbilling_firstname := Astring;
  Fbilling_firstname_Specified := True;
end;

function salesOrderInvoiceEntity.billing_firstname_Specified(Index: Integer): boolean;
begin
  Result := Fbilling_firstname_Specified;
end;

procedure salesOrderInvoiceEntity.Setbilling_lastname(Index: Integer; const Astring: string);
begin
  Fbilling_lastname := Astring;
  Fbilling_lastname_Specified := True;
end;

function salesOrderInvoiceEntity.billing_lastname_Specified(Index: Integer): boolean;
begin
  Result := Fbilling_lastname_Specified;
end;

procedure salesOrderInvoiceEntity.Setorder_id(Index: Integer; const Astring: string);
begin
  Forder_id := Astring;
  Forder_id_Specified := True;
end;

function salesOrderInvoiceEntity.order_id_Specified(Index: Integer): boolean;
begin
  Result := Forder_id_Specified;
end;

procedure salesOrderInvoiceEntity.Setorder_increment_id(Index: Integer; const Astring: string);
begin
  Forder_increment_id := Astring;
  Forder_increment_id_Specified := True;
end;

function salesOrderInvoiceEntity.order_increment_id_Specified(Index: Integer): boolean;
begin
  Result := Forder_increment_id_Specified;
end;

procedure salesOrderInvoiceEntity.Setorder_created_at(Index: Integer; const Astring: string);
begin
  Forder_created_at := Astring;
  Forder_created_at_Specified := True;
end;

function salesOrderInvoiceEntity.order_created_at_Specified(Index: Integer): boolean;
begin
  Result := Forder_created_at_Specified;
end;

procedure salesOrderInvoiceEntity.Setstate(Index: Integer; const Astring: string);
begin
  Fstate := Astring;
  Fstate_Specified := True;
end;

function salesOrderInvoiceEntity.state_Specified(Index: Integer): boolean;
begin
  Result := Fstate_Specified;
end;

procedure salesOrderInvoiceEntity.Setgrand_total(Index: Integer; const Astring: string);
begin
  Fgrand_total := Astring;
  Fgrand_total_Specified := True;
end;

function salesOrderInvoiceEntity.grand_total_Specified(Index: Integer): boolean;
begin
  Result := Fgrand_total_Specified;
end;

procedure salesOrderInvoiceEntity.Setinvoice_id(Index: Integer; const Astring: string);
begin
  Finvoice_id := Astring;
  Finvoice_id_Specified := True;
end;

function salesOrderInvoiceEntity.invoice_id_Specified(Index: Integer): boolean;
begin
  Result := Finvoice_id_Specified;
end;

procedure salesOrderInvoiceEntity.Setitems(Index: Integer; const AsalesOrderInvoiceItemEntityArray: salesOrderInvoiceItemEntityArray);
begin
  Fitems := AsalesOrderInvoiceItemEntityArray;
  Fitems_Specified := True;
end;

function salesOrderInvoiceEntity.items_Specified(Index: Integer): boolean;
begin
  Result := Fitems_Specified;
end;

procedure salesOrderInvoiceEntity.Setcomments(Index: Integer; const AsalesOrderInvoiceCommentEntityArray: salesOrderInvoiceCommentEntityArray);
begin
  Fcomments := AsalesOrderInvoiceCommentEntityArray;
  Fcomments_Specified := True;
end;

function salesOrderInvoiceEntity.comments_Specified(Index: Integer): boolean;
begin
  Result := Fcomments_Specified;
end;

procedure salesOrderCreditmemoItemEntity.Setitem_id(Index: Integer; const Astring: string);
begin
  Fitem_id := Astring;
  Fitem_id_Specified := True;
end;

function salesOrderCreditmemoItemEntity.item_id_Specified(Index: Integer): boolean;
begin
  Result := Fitem_id_Specified;
end;

procedure salesOrderCreditmemoItemEntity.Setparent_id(Index: Integer; const Astring: string);
begin
  Fparent_id := Astring;
  Fparent_id_Specified := True;
end;

function salesOrderCreditmemoItemEntity.parent_id_Specified(Index: Integer): boolean;
begin
  Result := Fparent_id_Specified;
end;

procedure salesOrderCreditmemoItemEntity.Setweee_tax_applied_row_amount(Index: Integer; const Astring: string);
begin
  Fweee_tax_applied_row_amount := Astring;
  Fweee_tax_applied_row_amount_Specified := True;
end;

function salesOrderCreditmemoItemEntity.weee_tax_applied_row_amount_Specified(Index: Integer): boolean;
begin
  Result := Fweee_tax_applied_row_amount_Specified;
end;

procedure salesOrderCreditmemoItemEntity.Setbase_price(Index: Integer; const Astring: string);
begin
  Fbase_price := Astring;
  Fbase_price_Specified := True;
end;

function salesOrderCreditmemoItemEntity.base_price_Specified(Index: Integer): boolean;
begin
  Result := Fbase_price_Specified;
end;

procedure salesOrderCreditmemoItemEntity.Setbase_weee_tax_row_disposition(Index: Integer; const Astring: string);
begin
  Fbase_weee_tax_row_disposition := Astring;
  Fbase_weee_tax_row_disposition_Specified := True;
end;

function salesOrderCreditmemoItemEntity.base_weee_tax_row_disposition_Specified(Index: Integer): boolean;
begin
  Result := Fbase_weee_tax_row_disposition_Specified;
end;

procedure salesOrderCreditmemoItemEntity.Settax_amount(Index: Integer; const Astring: string);
begin
  Ftax_amount := Astring;
  Ftax_amount_Specified := True;
end;

function salesOrderCreditmemoItemEntity.tax_amount_Specified(Index: Integer): boolean;
begin
  Result := Ftax_amount_Specified;
end;

procedure salesOrderCreditmemoItemEntity.Setbase_weee_tax_applied_amount(Index: Integer; const Astring: string);
begin
  Fbase_weee_tax_applied_amount := Astring;
  Fbase_weee_tax_applied_amount_Specified := True;
end;

function salesOrderCreditmemoItemEntity.base_weee_tax_applied_amount_Specified(Index: Integer): boolean;
begin
  Result := Fbase_weee_tax_applied_amount_Specified;
end;

procedure salesOrderCreditmemoItemEntity.Setweee_tax_row_disposition(Index: Integer; const Astring: string);
begin
  Fweee_tax_row_disposition := Astring;
  Fweee_tax_row_disposition_Specified := True;
end;

function salesOrderCreditmemoItemEntity.weee_tax_row_disposition_Specified(Index: Integer): boolean;
begin
  Result := Fweee_tax_row_disposition_Specified;
end;

procedure salesOrderCreditmemoItemEntity.Setbase_row_total(Index: Integer; const Astring: string);
begin
  Fbase_row_total := Astring;
  Fbase_row_total_Specified := True;
end;

function salesOrderCreditmemoItemEntity.base_row_total_Specified(Index: Integer): boolean;
begin
  Result := Fbase_row_total_Specified;
end;

procedure salesOrderCreditmemoItemEntity.Setdiscount_amount(Index: Integer; const Astring: string);
begin
  Fdiscount_amount := Astring;
  Fdiscount_amount_Specified := True;
end;

function salesOrderCreditmemoItemEntity.discount_amount_Specified(Index: Integer): boolean;
begin
  Result := Fdiscount_amount_Specified;
end;

procedure salesOrderCreditmemoItemEntity.Setrow_total(Index: Integer; const Astring: string);
begin
  Frow_total := Astring;
  Frow_total_Specified := True;
end;

function salesOrderCreditmemoItemEntity.row_total_Specified(Index: Integer): boolean;
begin
  Result := Frow_total_Specified;
end;

procedure salesOrderCreditmemoItemEntity.Setweee_tax_applied_amount(Index: Integer; const Astring: string);
begin
  Fweee_tax_applied_amount := Astring;
  Fweee_tax_applied_amount_Specified := True;
end;

function salesOrderCreditmemoItemEntity.weee_tax_applied_amount_Specified(Index: Integer): boolean;
begin
  Result := Fweee_tax_applied_amount_Specified;
end;

procedure salesOrderCreditmemoItemEntity.Setbase_discount_amount(Index: Integer; const Astring: string);
begin
  Fbase_discount_amount := Astring;
  Fbase_discount_amount_Specified := True;
end;

function salesOrderCreditmemoItemEntity.base_discount_amount_Specified(Index: Integer): boolean;
begin
  Result := Fbase_discount_amount_Specified;
end;

procedure salesOrderCreditmemoItemEntity.Setbase_weee_tax_disposition(Index: Integer; const Astring: string);
begin
  Fbase_weee_tax_disposition := Astring;
  Fbase_weee_tax_disposition_Specified := True;
end;

function salesOrderCreditmemoItemEntity.base_weee_tax_disposition_Specified(Index: Integer): boolean;
begin
  Result := Fbase_weee_tax_disposition_Specified;
end;

procedure salesOrderCreditmemoItemEntity.Setprice_incl_tax(Index: Integer; const Astring: string);
begin
  Fprice_incl_tax := Astring;
  Fprice_incl_tax_Specified := True;
end;

function salesOrderCreditmemoItemEntity.price_incl_tax_Specified(Index: Integer): boolean;
begin
  Result := Fprice_incl_tax_Specified;
end;

procedure salesOrderCreditmemoItemEntity.Setbase_tax_amount(Index: Integer; const Astring: string);
begin
  Fbase_tax_amount := Astring;
  Fbase_tax_amount_Specified := True;
end;

function salesOrderCreditmemoItemEntity.base_tax_amount_Specified(Index: Integer): boolean;
begin
  Result := Fbase_tax_amount_Specified;
end;

procedure salesOrderCreditmemoItemEntity.Setweee_tax_disposition(Index: Integer; const Astring: string);
begin
  Fweee_tax_disposition := Astring;
  Fweee_tax_disposition_Specified := True;
end;

function salesOrderCreditmemoItemEntity.weee_tax_disposition_Specified(Index: Integer): boolean;
begin
  Result := Fweee_tax_disposition_Specified;
end;

procedure salesOrderCreditmemoItemEntity.Setbase_price_incl_tax(Index: Integer; const Astring: string);
begin
  Fbase_price_incl_tax := Astring;
  Fbase_price_incl_tax_Specified := True;
end;

function salesOrderCreditmemoItemEntity.base_price_incl_tax_Specified(Index: Integer): boolean;
begin
  Result := Fbase_price_incl_tax_Specified;
end;

procedure salesOrderCreditmemoItemEntity.Setqty(Index: Integer; const Astring: string);
begin
  Fqty := Astring;
  Fqty_Specified := True;
end;

function salesOrderCreditmemoItemEntity.qty_Specified(Index: Integer): boolean;
begin
  Result := Fqty_Specified;
end;

procedure salesOrderCreditmemoItemEntity.Setbase_cost(Index: Integer; const Astring: string);
begin
  Fbase_cost := Astring;
  Fbase_cost_Specified := True;
end;

function salesOrderCreditmemoItemEntity.base_cost_Specified(Index: Integer): boolean;
begin
  Result := Fbase_cost_Specified;
end;

procedure salesOrderCreditmemoItemEntity.Setbase_weee_tax_applied_row_amount(Index: Integer; const Astring: string);
begin
  Fbase_weee_tax_applied_row_amount := Astring;
  Fbase_weee_tax_applied_row_amount_Specified := True;
end;

function salesOrderCreditmemoItemEntity.base_weee_tax_applied_row_amount_Specified(Index: Integer): boolean;
begin
  Result := Fbase_weee_tax_applied_row_amount_Specified;
end;

procedure salesOrderCreditmemoItemEntity.Setprice(Index: Integer; const Astring: string);
begin
  Fprice := Astring;
  Fprice_Specified := True;
end;

function salesOrderCreditmemoItemEntity.price_Specified(Index: Integer): boolean;
begin
  Result := Fprice_Specified;
end;

procedure salesOrderCreditmemoItemEntity.Setbase_row_total_incl_tax(Index: Integer; const Astring: string);
begin
  Fbase_row_total_incl_tax := Astring;
  Fbase_row_total_incl_tax_Specified := True;
end;

function salesOrderCreditmemoItemEntity.base_row_total_incl_tax_Specified(Index: Integer): boolean;
begin
  Result := Fbase_row_total_incl_tax_Specified;
end;

procedure salesOrderCreditmemoItemEntity.Setrow_total_incl_tax(Index: Integer; const Astring: string);
begin
  Frow_total_incl_tax := Astring;
  Frow_total_incl_tax_Specified := True;
end;

function salesOrderCreditmemoItemEntity.row_total_incl_tax_Specified(Index: Integer): boolean;
begin
  Result := Frow_total_incl_tax_Specified;
end;

procedure salesOrderCreditmemoItemEntity.Setproduct_id(Index: Integer; const Astring: string);
begin
  Fproduct_id := Astring;
  Fproduct_id_Specified := True;
end;

function salesOrderCreditmemoItemEntity.product_id_Specified(Index: Integer): boolean;
begin
  Result := Fproduct_id_Specified;
end;

procedure salesOrderCreditmemoItemEntity.Setorder_item_id(Index: Integer; const Astring: string);
begin
  Forder_item_id := Astring;
  Forder_item_id_Specified := True;
end;

function salesOrderCreditmemoItemEntity.order_item_id_Specified(Index: Integer): boolean;
begin
  Result := Forder_item_id_Specified;
end;

procedure salesOrderCreditmemoItemEntity.Setadditional_data(Index: Integer; const Astring: string);
begin
  Fadditional_data := Astring;
  Fadditional_data_Specified := True;
end;

function salesOrderCreditmemoItemEntity.additional_data_Specified(Index: Integer): boolean;
begin
  Result := Fadditional_data_Specified;
end;

procedure salesOrderCreditmemoItemEntity.Setdescription(Index: Integer; const Astring: string);
begin
  Fdescription := Astring;
  Fdescription_Specified := True;
end;

function salesOrderCreditmemoItemEntity.description_Specified(Index: Integer): boolean;
begin
  Result := Fdescription_Specified;
end;

procedure salesOrderCreditmemoItemEntity.Setweee_tax_applied(Index: Integer; const Astring: string);
begin
  Fweee_tax_applied := Astring;
  Fweee_tax_applied_Specified := True;
end;

function salesOrderCreditmemoItemEntity.weee_tax_applied_Specified(Index: Integer): boolean;
begin
  Result := Fweee_tax_applied_Specified;
end;

procedure salesOrderCreditmemoItemEntity.Setsku(Index: Integer; const Astring: string);
begin
  Fsku := Astring;
  Fsku_Specified := True;
end;

function salesOrderCreditmemoItemEntity.sku_Specified(Index: Integer): boolean;
begin
  Result := Fsku_Specified;
end;

procedure salesOrderCreditmemoItemEntity.Setname_(Index: Integer; const Astring: string);
begin
  Fname_ := Astring;
  Fname__Specified := True;
end;

function salesOrderCreditmemoItemEntity.name__Specified(Index: Integer): boolean;
begin
  Result := Fname__Specified;
end;

procedure salesOrderCreditmemoItemEntity.Sethidden_tax_amount(Index: Integer; const Astring: string);
begin
  Fhidden_tax_amount := Astring;
  Fhidden_tax_amount_Specified := True;
end;

function salesOrderCreditmemoItemEntity.hidden_tax_amount_Specified(Index: Integer): boolean;
begin
  Result := Fhidden_tax_amount_Specified;
end;

procedure salesOrderCreditmemoItemEntity.Setbase_hidden_tax_amount(Index: Integer; const Astring: string);
begin
  Fbase_hidden_tax_amount := Astring;
  Fbase_hidden_tax_amount_Specified := True;
end;

function salesOrderCreditmemoItemEntity.base_hidden_tax_amount_Specified(Index: Integer): boolean;
begin
  Result := Fbase_hidden_tax_amount_Specified;
end;

procedure salesOrderCreditmemoCommentEntity.Setparent_id(Index: Integer; const Astring: string);
begin
  Fparent_id := Astring;
  Fparent_id_Specified := True;
end;

function salesOrderCreditmemoCommentEntity.parent_id_Specified(Index: Integer): boolean;
begin
  Result := Fparent_id_Specified;
end;

procedure salesOrderCreditmemoCommentEntity.Setcreated_at(Index: Integer; const Astring: string);
begin
  Fcreated_at := Astring;
  Fcreated_at_Specified := True;
end;

function salesOrderCreditmemoCommentEntity.created_at_Specified(Index: Integer): boolean;
begin
  Result := Fcreated_at_Specified;
end;

procedure salesOrderCreditmemoCommentEntity.Setcomment(Index: Integer; const Astring: string);
begin
  Fcomment := Astring;
  Fcomment_Specified := True;
end;

function salesOrderCreditmemoCommentEntity.comment_Specified(Index: Integer): boolean;
begin
  Result := Fcomment_Specified;
end;

procedure salesOrderCreditmemoCommentEntity.Setis_customer_notified(Index: Integer; const Astring: string);
begin
  Fis_customer_notified := Astring;
  Fis_customer_notified_Specified := True;
end;

function salesOrderCreditmemoCommentEntity.is_customer_notified_Specified(Index: Integer): boolean;
begin
  Result := Fis_customer_notified_Specified;
end;

procedure salesOrderCreditmemoCommentEntity.Setcomment_id(Index: Integer; const Astring: string);
begin
  Fcomment_id := Astring;
  Fcomment_id_Specified := True;
end;

function salesOrderCreditmemoCommentEntity.comment_id_Specified(Index: Integer): boolean;
begin
  Result := Fcomment_id_Specified;
end;

procedure salesOrderCreditmemoCommentEntity.Setis_visible_on_front(Index: Integer; const Astring: string);
begin
  Fis_visible_on_front := Astring;
  Fis_visible_on_front_Specified := True;
end;

function salesOrderCreditmemoCommentEntity.is_visible_on_front_Specified(Index: Integer): boolean;
begin
  Result := Fis_visible_on_front_Specified;
end;

destructor salesOrderCreditmemoEntity.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Fitems)-1 do
    SysUtils.FreeAndNil(Fitems[I]);
  System.SetLength(Fitems, 0);
  for I := 0 to System.Length(Fcomments)-1 do
    SysUtils.FreeAndNil(Fcomments[I]);
  System.SetLength(Fcomments, 0);
  inherited Destroy;
end;

procedure salesOrderCreditmemoEntity.Setupdated_at(Index: Integer; const Astring: string);
begin
  Fupdated_at := Astring;
  Fupdated_at_Specified := True;
end;

function salesOrderCreditmemoEntity.updated_at_Specified(Index: Integer): boolean;
begin
  Result := Fupdated_at_Specified;
end;

procedure salesOrderCreditmemoEntity.Setcreated_at(Index: Integer; const Astring: string);
begin
  Fcreated_at := Astring;
  Fcreated_at_Specified := True;
end;

function salesOrderCreditmemoEntity.created_at_Specified(Index: Integer): boolean;
begin
  Result := Fcreated_at_Specified;
end;

procedure salesOrderCreditmemoEntity.Setincrement_id(Index: Integer; const Astring: string);
begin
  Fincrement_id := Astring;
  Fincrement_id_Specified := True;
end;

function salesOrderCreditmemoEntity.increment_id_Specified(Index: Integer): boolean;
begin
  Result := Fincrement_id_Specified;
end;

procedure salesOrderCreditmemoEntity.Settransaction_id(Index: Integer; const Astring: string);
begin
  Ftransaction_id := Astring;
  Ftransaction_id_Specified := True;
end;

function salesOrderCreditmemoEntity.transaction_id_Specified(Index: Integer): boolean;
begin
  Result := Ftransaction_id_Specified;
end;

procedure salesOrderCreditmemoEntity.Setglobal_currency_code(Index: Integer; const Astring: string);
begin
  Fglobal_currency_code := Astring;
  Fglobal_currency_code_Specified := True;
end;

function salesOrderCreditmemoEntity.global_currency_code_Specified(Index: Integer): boolean;
begin
  Result := Fglobal_currency_code_Specified;
end;

procedure salesOrderCreditmemoEntity.Setbase_currency_code(Index: Integer; const Astring: string);
begin
  Fbase_currency_code := Astring;
  Fbase_currency_code_Specified := True;
end;

function salesOrderCreditmemoEntity.base_currency_code_Specified(Index: Integer): boolean;
begin
  Result := Fbase_currency_code_Specified;
end;

procedure salesOrderCreditmemoEntity.Setorder_currency_code(Index: Integer; const Astring: string);
begin
  Forder_currency_code := Astring;
  Forder_currency_code_Specified := True;
end;

function salesOrderCreditmemoEntity.order_currency_code_Specified(Index: Integer): boolean;
begin
  Result := Forder_currency_code_Specified;
end;

procedure salesOrderCreditmemoEntity.Setstore_currency_code(Index: Integer; const Astring: string);
begin
  Fstore_currency_code := Astring;
  Fstore_currency_code_Specified := True;
end;

function salesOrderCreditmemoEntity.store_currency_code_Specified(Index: Integer): boolean;
begin
  Result := Fstore_currency_code_Specified;
end;

procedure salesOrderCreditmemoEntity.Setcybersource_token(Index: Integer; const Astring: string);
begin
  Fcybersource_token := Astring;
  Fcybersource_token_Specified := True;
end;

function salesOrderCreditmemoEntity.cybersource_token_Specified(Index: Integer): boolean;
begin
  Result := Fcybersource_token_Specified;
end;

procedure salesOrderCreditmemoEntity.Setinvoice_id(Index: Integer; const Astring: string);
begin
  Finvoice_id := Astring;
  Finvoice_id_Specified := True;
end;

function salesOrderCreditmemoEntity.invoice_id_Specified(Index: Integer): boolean;
begin
  Result := Finvoice_id_Specified;
end;

procedure salesOrderCreditmemoEntity.Setbilling_address_id(Index: Integer; const Astring: string);
begin
  Fbilling_address_id := Astring;
  Fbilling_address_id_Specified := True;
end;

function salesOrderCreditmemoEntity.billing_address_id_Specified(Index: Integer): boolean;
begin
  Result := Fbilling_address_id_Specified;
end;

procedure salesOrderCreditmemoEntity.Setshipping_address_id(Index: Integer; const Astring: string);
begin
  Fshipping_address_id := Astring;
  Fshipping_address_id_Specified := True;
end;

function salesOrderCreditmemoEntity.shipping_address_id_Specified(Index: Integer): boolean;
begin
  Result := Fshipping_address_id_Specified;
end;

procedure salesOrderCreditmemoEntity.Setstate(Index: Integer; const Astring: string);
begin
  Fstate := Astring;
  Fstate_Specified := True;
end;

function salesOrderCreditmemoEntity.state_Specified(Index: Integer): boolean;
begin
  Result := Fstate_Specified;
end;

procedure salesOrderCreditmemoEntity.Setcreditmemo_status(Index: Integer; const Astring: string);
begin
  Fcreditmemo_status := Astring;
  Fcreditmemo_status_Specified := True;
end;

function salesOrderCreditmemoEntity.creditmemo_status_Specified(Index: Integer): boolean;
begin
  Result := Fcreditmemo_status_Specified;
end;

procedure salesOrderCreditmemoEntity.Setemail_sent(Index: Integer; const Astring: string);
begin
  Femail_sent := Astring;
  Femail_sent_Specified := True;
end;

function salesOrderCreditmemoEntity.email_sent_Specified(Index: Integer): boolean;
begin
  Result := Femail_sent_Specified;
end;

procedure salesOrderCreditmemoEntity.Setorder_id(Index: Integer; const Astring: string);
begin
  Forder_id := Astring;
  Forder_id_Specified := True;
end;

function salesOrderCreditmemoEntity.order_id_Specified(Index: Integer): boolean;
begin
  Result := Forder_id_Specified;
end;

procedure salesOrderCreditmemoEntity.Settax_amount(Index: Integer; const Astring: string);
begin
  Ftax_amount := Astring;
  Ftax_amount_Specified := True;
end;

function salesOrderCreditmemoEntity.tax_amount_Specified(Index: Integer): boolean;
begin
  Result := Ftax_amount_Specified;
end;

procedure salesOrderCreditmemoEntity.Setshipping_tax_amount(Index: Integer; const Astring: string);
begin
  Fshipping_tax_amount := Astring;
  Fshipping_tax_amount_Specified := True;
end;

function salesOrderCreditmemoEntity.shipping_tax_amount_Specified(Index: Integer): boolean;
begin
  Result := Fshipping_tax_amount_Specified;
end;

procedure salesOrderCreditmemoEntity.Setbase_tax_amount(Index: Integer; const Astring: string);
begin
  Fbase_tax_amount := Astring;
  Fbase_tax_amount_Specified := True;
end;

function salesOrderCreditmemoEntity.base_tax_amount_Specified(Index: Integer): boolean;
begin
  Result := Fbase_tax_amount_Specified;
end;

procedure salesOrderCreditmemoEntity.Setbase_adjustment_positive(Index: Integer; const Astring: string);
begin
  Fbase_adjustment_positive := Astring;
  Fbase_adjustment_positive_Specified := True;
end;

function salesOrderCreditmemoEntity.base_adjustment_positive_Specified(Index: Integer): boolean;
begin
  Result := Fbase_adjustment_positive_Specified;
end;

procedure salesOrderCreditmemoEntity.Setbase_grand_total(Index: Integer; const Astring: string);
begin
  Fbase_grand_total := Astring;
  Fbase_grand_total_Specified := True;
end;

function salesOrderCreditmemoEntity.base_grand_total_Specified(Index: Integer): boolean;
begin
  Result := Fbase_grand_total_Specified;
end;

procedure salesOrderCreditmemoEntity.Setadjustment(Index: Integer; const Astring: string);
begin
  Fadjustment := Astring;
  Fadjustment_Specified := True;
end;

function salesOrderCreditmemoEntity.adjustment_Specified(Index: Integer): boolean;
begin
  Result := Fadjustment_Specified;
end;

procedure salesOrderCreditmemoEntity.Setsubtotal(Index: Integer; const Astring: string);
begin
  Fsubtotal := Astring;
  Fsubtotal_Specified := True;
end;

function salesOrderCreditmemoEntity.subtotal_Specified(Index: Integer): boolean;
begin
  Result := Fsubtotal_Specified;
end;

procedure salesOrderCreditmemoEntity.Setdiscount_amount(Index: Integer; const Astring: string);
begin
  Fdiscount_amount := Astring;
  Fdiscount_amount_Specified := True;
end;

function salesOrderCreditmemoEntity.discount_amount_Specified(Index: Integer): boolean;
begin
  Result := Fdiscount_amount_Specified;
end;

procedure salesOrderCreditmemoEntity.Setbase_subtotal(Index: Integer; const Astring: string);
begin
  Fbase_subtotal := Astring;
  Fbase_subtotal_Specified := True;
end;

function salesOrderCreditmemoEntity.base_subtotal_Specified(Index: Integer): boolean;
begin
  Result := Fbase_subtotal_Specified;
end;

procedure salesOrderCreditmemoEntity.Setbase_adjustment(Index: Integer; const Astring: string);
begin
  Fbase_adjustment := Astring;
  Fbase_adjustment_Specified := True;
end;

function salesOrderCreditmemoEntity.base_adjustment_Specified(Index: Integer): boolean;
begin
  Result := Fbase_adjustment_Specified;
end;

procedure salesOrderCreditmemoEntity.Setbase_to_global_rate(Index: Integer; const Astring: string);
begin
  Fbase_to_global_rate := Astring;
  Fbase_to_global_rate_Specified := True;
end;

function salesOrderCreditmemoEntity.base_to_global_rate_Specified(Index: Integer): boolean;
begin
  Result := Fbase_to_global_rate_Specified;
end;

procedure salesOrderCreditmemoEntity.Setstore_to_base_rate(Index: Integer; const Astring: string);
begin
  Fstore_to_base_rate := Astring;
  Fstore_to_base_rate_Specified := True;
end;

function salesOrderCreditmemoEntity.store_to_base_rate_Specified(Index: Integer): boolean;
begin
  Result := Fstore_to_base_rate_Specified;
end;

procedure salesOrderCreditmemoEntity.Setbase_shipping_amount(Index: Integer; const Astring: string);
begin
  Fbase_shipping_amount := Astring;
  Fbase_shipping_amount_Specified := True;
end;

function salesOrderCreditmemoEntity.base_shipping_amount_Specified(Index: Integer): boolean;
begin
  Result := Fbase_shipping_amount_Specified;
end;

procedure salesOrderCreditmemoEntity.Setadjustment_negative(Index: Integer; const Astring: string);
begin
  Fadjustment_negative := Astring;
  Fadjustment_negative_Specified := True;
end;

function salesOrderCreditmemoEntity.adjustment_negative_Specified(Index: Integer): boolean;
begin
  Result := Fadjustment_negative_Specified;
end;

procedure salesOrderCreditmemoEntity.Setsubtotal_incl_tax(Index: Integer; const Astring: string);
begin
  Fsubtotal_incl_tax := Astring;
  Fsubtotal_incl_tax_Specified := True;
end;

function salesOrderCreditmemoEntity.subtotal_incl_tax_Specified(Index: Integer): boolean;
begin
  Result := Fsubtotal_incl_tax_Specified;
end;

procedure salesOrderCreditmemoEntity.Setshipping_amount(Index: Integer; const Astring: string);
begin
  Fshipping_amount := Astring;
  Fshipping_amount_Specified := True;
end;

function salesOrderCreditmemoEntity.shipping_amount_Specified(Index: Integer): boolean;
begin
  Result := Fshipping_amount_Specified;
end;

procedure salesOrderCreditmemoEntity.Setbase_subtotal_incl_tax(Index: Integer; const Astring: string);
begin
  Fbase_subtotal_incl_tax := Astring;
  Fbase_subtotal_incl_tax_Specified := True;
end;

function salesOrderCreditmemoEntity.base_subtotal_incl_tax_Specified(Index: Integer): boolean;
begin
  Result := Fbase_subtotal_incl_tax_Specified;
end;

procedure salesOrderCreditmemoEntity.Setbase_adjustment_negative(Index: Integer; const Astring: string);
begin
  Fbase_adjustment_negative := Astring;
  Fbase_adjustment_negative_Specified := True;
end;

function salesOrderCreditmemoEntity.base_adjustment_negative_Specified(Index: Integer): boolean;
begin
  Result := Fbase_adjustment_negative_Specified;
end;

procedure salesOrderCreditmemoEntity.Setgrand_total(Index: Integer; const Astring: string);
begin
  Fgrand_total := Astring;
  Fgrand_total_Specified := True;
end;

function salesOrderCreditmemoEntity.grand_total_Specified(Index: Integer): boolean;
begin
  Result := Fgrand_total_Specified;
end;

procedure salesOrderCreditmemoEntity.Setbase_discount_amount(Index: Integer; const Astring: string);
begin
  Fbase_discount_amount := Astring;
  Fbase_discount_amount_Specified := True;
end;

function salesOrderCreditmemoEntity.base_discount_amount_Specified(Index: Integer): boolean;
begin
  Result := Fbase_discount_amount_Specified;
end;

procedure salesOrderCreditmemoEntity.Setbase_to_order_rate(Index: Integer; const Astring: string);
begin
  Fbase_to_order_rate := Astring;
  Fbase_to_order_rate_Specified := True;
end;

function salesOrderCreditmemoEntity.base_to_order_rate_Specified(Index: Integer): boolean;
begin
  Result := Fbase_to_order_rate_Specified;
end;

procedure salesOrderCreditmemoEntity.Setstore_to_order_rate(Index: Integer; const Astring: string);
begin
  Fstore_to_order_rate := Astring;
  Fstore_to_order_rate_Specified := True;
end;

function salesOrderCreditmemoEntity.store_to_order_rate_Specified(Index: Integer): boolean;
begin
  Result := Fstore_to_order_rate_Specified;
end;

procedure salesOrderCreditmemoEntity.Setbase_shipping_tax_amount(Index: Integer; const Astring: string);
begin
  Fbase_shipping_tax_amount := Astring;
  Fbase_shipping_tax_amount_Specified := True;
end;

function salesOrderCreditmemoEntity.base_shipping_tax_amount_Specified(Index: Integer): boolean;
begin
  Result := Fbase_shipping_tax_amount_Specified;
end;

procedure salesOrderCreditmemoEntity.Setadjustment_positive(Index: Integer; const Astring: string);
begin
  Fadjustment_positive := Astring;
  Fadjustment_positive_Specified := True;
end;

function salesOrderCreditmemoEntity.adjustment_positive_Specified(Index: Integer): boolean;
begin
  Result := Fadjustment_positive_Specified;
end;

procedure salesOrderCreditmemoEntity.Setstore_id(Index: Integer; const Astring: string);
begin
  Fstore_id := Astring;
  Fstore_id_Specified := True;
end;

function salesOrderCreditmemoEntity.store_id_Specified(Index: Integer): boolean;
begin
  Result := Fstore_id_Specified;
end;

procedure salesOrderCreditmemoEntity.Sethidden_tax_amount(Index: Integer; const Astring: string);
begin
  Fhidden_tax_amount := Astring;
  Fhidden_tax_amount_Specified := True;
end;

function salesOrderCreditmemoEntity.hidden_tax_amount_Specified(Index: Integer): boolean;
begin
  Result := Fhidden_tax_amount_Specified;
end;

procedure salesOrderCreditmemoEntity.Setbase_hidden_tax_amount(Index: Integer; const Astring: string);
begin
  Fbase_hidden_tax_amount := Astring;
  Fbase_hidden_tax_amount_Specified := True;
end;

function salesOrderCreditmemoEntity.base_hidden_tax_amount_Specified(Index: Integer): boolean;
begin
  Result := Fbase_hidden_tax_amount_Specified;
end;

procedure salesOrderCreditmemoEntity.Setshipping_hidden_tax_amount(Index: Integer; const Astring: string);
begin
  Fshipping_hidden_tax_amount := Astring;
  Fshipping_hidden_tax_amount_Specified := True;
end;

function salesOrderCreditmemoEntity.shipping_hidden_tax_amount_Specified(Index: Integer): boolean;
begin
  Result := Fshipping_hidden_tax_amount_Specified;
end;

procedure salesOrderCreditmemoEntity.Setbase_shipping_hidden_tax_amnt(Index: Integer; const Astring: string);
begin
  Fbase_shipping_hidden_tax_amnt := Astring;
  Fbase_shipping_hidden_tax_amnt_Specified := True;
end;

function salesOrderCreditmemoEntity.base_shipping_hidden_tax_amnt_Specified(Index: Integer): boolean;
begin
  Result := Fbase_shipping_hidden_tax_amnt_Specified;
end;

procedure salesOrderCreditmemoEntity.Setshipping_incl_tax(Index: Integer; const Astring: string);
begin
  Fshipping_incl_tax := Astring;
  Fshipping_incl_tax_Specified := True;
end;

function salesOrderCreditmemoEntity.shipping_incl_tax_Specified(Index: Integer): boolean;
begin
  Result := Fshipping_incl_tax_Specified;
end;

procedure salesOrderCreditmemoEntity.Setbase_shipping_incl_tax(Index: Integer; const Astring: string);
begin
  Fbase_shipping_incl_tax := Astring;
  Fbase_shipping_incl_tax_Specified := True;
end;

function salesOrderCreditmemoEntity.base_shipping_incl_tax_Specified(Index: Integer): boolean;
begin
  Result := Fbase_shipping_incl_tax_Specified;
end;

procedure salesOrderCreditmemoEntity.Setbase_customer_balance_amount(Index: Integer; const Astring: string);
begin
  Fbase_customer_balance_amount := Astring;
  Fbase_customer_balance_amount_Specified := True;
end;

function salesOrderCreditmemoEntity.base_customer_balance_amount_Specified(Index: Integer): boolean;
begin
  Result := Fbase_customer_balance_amount_Specified;
end;

procedure salesOrderCreditmemoEntity.Setcustomer_balance_amount(Index: Integer; const Astring: string);
begin
  Fcustomer_balance_amount := Astring;
  Fcustomer_balance_amount_Specified := True;
end;

function salesOrderCreditmemoEntity.customer_balance_amount_Specified(Index: Integer): boolean;
begin
  Result := Fcustomer_balance_amount_Specified;
end;

procedure salesOrderCreditmemoEntity.Setbs_customer_bal_total_refunded(Index: Integer; const Astring: string);
begin
  Fbs_customer_bal_total_refunded := Astring;
  Fbs_customer_bal_total_refunded_Specified := True;
end;

function salesOrderCreditmemoEntity.bs_customer_bal_total_refunded_Specified(Index: Integer): boolean;
begin
  Result := Fbs_customer_bal_total_refunded_Specified;
end;

procedure salesOrderCreditmemoEntity.Setcustomer_bal_total_refunded(Index: Integer; const Astring: string);
begin
  Fcustomer_bal_total_refunded := Astring;
  Fcustomer_bal_total_refunded_Specified := True;
end;

function salesOrderCreditmemoEntity.customer_bal_total_refunded_Specified(Index: Integer): boolean;
begin
  Result := Fcustomer_bal_total_refunded_Specified;
end;

procedure salesOrderCreditmemoEntity.Setbase_gift_cards_amount(Index: Integer; const Astring: string);
begin
  Fbase_gift_cards_amount := Astring;
  Fbase_gift_cards_amount_Specified := True;
end;

function salesOrderCreditmemoEntity.base_gift_cards_amount_Specified(Index: Integer): boolean;
begin
  Result := Fbase_gift_cards_amount_Specified;
end;

procedure salesOrderCreditmemoEntity.Setgift_cards_amount(Index: Integer; const Astring: string);
begin
  Fgift_cards_amount := Astring;
  Fgift_cards_amount_Specified := True;
end;

function salesOrderCreditmemoEntity.gift_cards_amount_Specified(Index: Integer): boolean;
begin
  Result := Fgift_cards_amount_Specified;
end;

procedure salesOrderCreditmemoEntity.Setgw_base_price(Index: Integer; const Astring: string);
begin
  Fgw_base_price := Astring;
  Fgw_base_price_Specified := True;
end;

function salesOrderCreditmemoEntity.gw_base_price_Specified(Index: Integer): boolean;
begin
  Result := Fgw_base_price_Specified;
end;

procedure salesOrderCreditmemoEntity.Setgw_price(Index: Integer; const Astring: string);
begin
  Fgw_price := Astring;
  Fgw_price_Specified := True;
end;

function salesOrderCreditmemoEntity.gw_price_Specified(Index: Integer): boolean;
begin
  Result := Fgw_price_Specified;
end;

procedure salesOrderCreditmemoEntity.Setgw_items_base_price(Index: Integer; const Astring: string);
begin
  Fgw_items_base_price := Astring;
  Fgw_items_base_price_Specified := True;
end;

function salesOrderCreditmemoEntity.gw_items_base_price_Specified(Index: Integer): boolean;
begin
  Result := Fgw_items_base_price_Specified;
end;

procedure salesOrderCreditmemoEntity.Setgw_items_price(Index: Integer; const Astring: string);
begin
  Fgw_items_price := Astring;
  Fgw_items_price_Specified := True;
end;

function salesOrderCreditmemoEntity.gw_items_price_Specified(Index: Integer): boolean;
begin
  Result := Fgw_items_price_Specified;
end;

procedure salesOrderCreditmemoEntity.Setgw_card_base_price(Index: Integer; const Astring: string);
begin
  Fgw_card_base_price := Astring;
  Fgw_card_base_price_Specified := True;
end;

function salesOrderCreditmemoEntity.gw_card_base_price_Specified(Index: Integer): boolean;
begin
  Result := Fgw_card_base_price_Specified;
end;

procedure salesOrderCreditmemoEntity.Setgw_card_price(Index: Integer; const Astring: string);
begin
  Fgw_card_price := Astring;
  Fgw_card_price_Specified := True;
end;

function salesOrderCreditmemoEntity.gw_card_price_Specified(Index: Integer): boolean;
begin
  Result := Fgw_card_price_Specified;
end;

procedure salesOrderCreditmemoEntity.Setgw_base_tax_amount(Index: Integer; const Astring: string);
begin
  Fgw_base_tax_amount := Astring;
  Fgw_base_tax_amount_Specified := True;
end;

function salesOrderCreditmemoEntity.gw_base_tax_amount_Specified(Index: Integer): boolean;
begin
  Result := Fgw_base_tax_amount_Specified;
end;

procedure salesOrderCreditmemoEntity.Setgw_tax_amount(Index: Integer; const Astring: string);
begin
  Fgw_tax_amount := Astring;
  Fgw_tax_amount_Specified := True;
end;

function salesOrderCreditmemoEntity.gw_tax_amount_Specified(Index: Integer): boolean;
begin
  Result := Fgw_tax_amount_Specified;
end;

procedure salesOrderCreditmemoEntity.Setgw_items_base_tax_amount(Index: Integer; const Astring: string);
begin
  Fgw_items_base_tax_amount := Astring;
  Fgw_items_base_tax_amount_Specified := True;
end;

function salesOrderCreditmemoEntity.gw_items_base_tax_amount_Specified(Index: Integer): boolean;
begin
  Result := Fgw_items_base_tax_amount_Specified;
end;

procedure salesOrderCreditmemoEntity.Setgw_items_tax_amount(Index: Integer; const Astring: string);
begin
  Fgw_items_tax_amount := Astring;
  Fgw_items_tax_amount_Specified := True;
end;

function salesOrderCreditmemoEntity.gw_items_tax_amount_Specified(Index: Integer): boolean;
begin
  Result := Fgw_items_tax_amount_Specified;
end;

procedure salesOrderCreditmemoEntity.Setgw_card_base_tax_amount(Index: Integer; const Astring: string);
begin
  Fgw_card_base_tax_amount := Astring;
  Fgw_card_base_tax_amount_Specified := True;
end;

function salesOrderCreditmemoEntity.gw_card_base_tax_amount_Specified(Index: Integer): boolean;
begin
  Result := Fgw_card_base_tax_amount_Specified;
end;

procedure salesOrderCreditmemoEntity.Setgw_card_tax_amount(Index: Integer; const Astring: string);
begin
  Fgw_card_tax_amount := Astring;
  Fgw_card_tax_amount_Specified := True;
end;

function salesOrderCreditmemoEntity.gw_card_tax_amount_Specified(Index: Integer): boolean;
begin
  Result := Fgw_card_tax_amount_Specified;
end;

procedure salesOrderCreditmemoEntity.Setbase_reward_currency_amount(Index: Integer; const Astring: string);
begin
  Fbase_reward_currency_amount := Astring;
  Fbase_reward_currency_amount_Specified := True;
end;

function salesOrderCreditmemoEntity.base_reward_currency_amount_Specified(Index: Integer): boolean;
begin
  Result := Fbase_reward_currency_amount_Specified;
end;

procedure salesOrderCreditmemoEntity.Setreward_currency_amount(Index: Integer; const Astring: string);
begin
  Freward_currency_amount := Astring;
  Freward_currency_amount_Specified := True;
end;

function salesOrderCreditmemoEntity.reward_currency_amount_Specified(Index: Integer): boolean;
begin
  Result := Freward_currency_amount_Specified;
end;

procedure salesOrderCreditmemoEntity.Setreward_points_balance(Index: Integer; const Astring: string);
begin
  Freward_points_balance := Astring;
  Freward_points_balance_Specified := True;
end;

function salesOrderCreditmemoEntity.reward_points_balance_Specified(Index: Integer): boolean;
begin
  Result := Freward_points_balance_Specified;
end;

procedure salesOrderCreditmemoEntity.Setreward_points_balance_refund(Index: Integer; const Astring: string);
begin
  Freward_points_balance_refund := Astring;
  Freward_points_balance_refund_Specified := True;
end;

function salesOrderCreditmemoEntity.reward_points_balance_refund_Specified(Index: Integer): boolean;
begin
  Result := Freward_points_balance_refund_Specified;
end;

procedure salesOrderCreditmemoEntity.Setcreditmemo_id(Index: Integer; const Astring: string);
begin
  Fcreditmemo_id := Astring;
  Fcreditmemo_id_Specified := True;
end;

function salesOrderCreditmemoEntity.creditmemo_id_Specified(Index: Integer): boolean;
begin
  Result := Fcreditmemo_id_Specified;
end;

procedure salesOrderCreditmemoEntity.Setitems(Index: Integer; const AsalesOrderCreditmemoItemEntityArray: salesOrderCreditmemoItemEntityArray);
begin
  Fitems := AsalesOrderCreditmemoItemEntityArray;
  Fitems_Specified := True;
end;

function salesOrderCreditmemoEntity.items_Specified(Index: Integer): boolean;
begin
  Result := Fitems_Specified;
end;

procedure salesOrderCreditmemoEntity.Setcomments(Index: Integer; const AsalesOrderCreditmemoCommentEntityArray: salesOrderCreditmemoCommentEntityArray);
begin
  Fcomments := AsalesOrderCreditmemoCommentEntityArray;
  Fcomments_Specified := True;
end;

function salesOrderCreditmemoEntity.comments_Specified(Index: Integer): boolean;
begin
  Result := Fcomments_Specified;
end;

destructor salesOrderShipmentEntity.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Fitems)-1 do
    SysUtils.FreeAndNil(Fitems[I]);
  System.SetLength(Fitems, 0);
  for I := 0 to System.Length(Ftracks)-1 do
    SysUtils.FreeAndNil(Ftracks[I]);
  System.SetLength(Ftracks, 0);
  for I := 0 to System.Length(Fcomments)-1 do
    SysUtils.FreeAndNil(Fcomments[I]);
  System.SetLength(Fcomments, 0);
  inherited Destroy;
end;

procedure salesOrderShipmentEntity.Setincrement_id(Index: Integer; const Astring: string);
begin
  Fincrement_id := Astring;
  Fincrement_id_Specified := True;
end;

function salesOrderShipmentEntity.increment_id_Specified(Index: Integer): boolean;
begin
  Result := Fincrement_id_Specified;
end;

procedure salesOrderShipmentEntity.Setparent_id(Index: Integer; const Astring: string);
begin
  Fparent_id := Astring;
  Fparent_id_Specified := True;
end;

function salesOrderShipmentEntity.parent_id_Specified(Index: Integer): boolean;
begin
  Result := Fparent_id_Specified;
end;

procedure salesOrderShipmentEntity.Setstore_id(Index: Integer; const Astring: string);
begin
  Fstore_id := Astring;
  Fstore_id_Specified := True;
end;

function salesOrderShipmentEntity.store_id_Specified(Index: Integer): boolean;
begin
  Result := Fstore_id_Specified;
end;

procedure salesOrderShipmentEntity.Setcreated_at(Index: Integer; const Astring: string);
begin
  Fcreated_at := Astring;
  Fcreated_at_Specified := True;
end;

function salesOrderShipmentEntity.created_at_Specified(Index: Integer): boolean;
begin
  Result := Fcreated_at_Specified;
end;

procedure salesOrderShipmentEntity.Setupdated_at(Index: Integer; const Astring: string);
begin
  Fupdated_at := Astring;
  Fupdated_at_Specified := True;
end;

function salesOrderShipmentEntity.updated_at_Specified(Index: Integer): boolean;
begin
  Result := Fupdated_at_Specified;
end;

procedure salesOrderShipmentEntity.Setis_active(Index: Integer; const Astring: string);
begin
  Fis_active := Astring;
  Fis_active_Specified := True;
end;

function salesOrderShipmentEntity.is_active_Specified(Index: Integer): boolean;
begin
  Result := Fis_active_Specified;
end;

procedure salesOrderShipmentEntity.Setshipping_address_id(Index: Integer; const Astring: string);
begin
  Fshipping_address_id := Astring;
  Fshipping_address_id_Specified := True;
end;

function salesOrderShipmentEntity.shipping_address_id_Specified(Index: Integer): boolean;
begin
  Result := Fshipping_address_id_Specified;
end;

procedure salesOrderShipmentEntity.Setshipping_firstname(Index: Integer; const Astring: string);
begin
  Fshipping_firstname := Astring;
  Fshipping_firstname_Specified := True;
end;

function salesOrderShipmentEntity.shipping_firstname_Specified(Index: Integer): boolean;
begin
  Result := Fshipping_firstname_Specified;
end;

procedure salesOrderShipmentEntity.Setshipping_lastname(Index: Integer; const Astring: string);
begin
  Fshipping_lastname := Astring;
  Fshipping_lastname_Specified := True;
end;

function salesOrderShipmentEntity.shipping_lastname_Specified(Index: Integer): boolean;
begin
  Result := Fshipping_lastname_Specified;
end;

procedure salesOrderShipmentEntity.Setorder_id(Index: Integer; const Astring: string);
begin
  Forder_id := Astring;
  Forder_id_Specified := True;
end;

function salesOrderShipmentEntity.order_id_Specified(Index: Integer): boolean;
begin
  Result := Forder_id_Specified;
end;

procedure salesOrderShipmentEntity.Setorder_increment_id(Index: Integer; const Astring: string);
begin
  Forder_increment_id := Astring;
  Forder_increment_id_Specified := True;
end;

function salesOrderShipmentEntity.order_increment_id_Specified(Index: Integer): boolean;
begin
  Result := Forder_increment_id_Specified;
end;

procedure salesOrderShipmentEntity.Setorder_created_at(Index: Integer; const Astring: string);
begin
  Forder_created_at := Astring;
  Forder_created_at_Specified := True;
end;

function salesOrderShipmentEntity.order_created_at_Specified(Index: Integer): boolean;
begin
  Result := Forder_created_at_Specified;
end;

procedure salesOrderShipmentEntity.Settotal_qty(Index: Integer; const Astring: string);
begin
  Ftotal_qty := Astring;
  Ftotal_qty_Specified := True;
end;

function salesOrderShipmentEntity.total_qty_Specified(Index: Integer): boolean;
begin
  Result := Ftotal_qty_Specified;
end;

procedure salesOrderShipmentEntity.Setshipment_id(Index: Integer; const Astring: string);
begin
  Fshipment_id := Astring;
  Fshipment_id_Specified := True;
end;

function salesOrderShipmentEntity.shipment_id_Specified(Index: Integer): boolean;
begin
  Result := Fshipment_id_Specified;
end;

procedure salesOrderShipmentEntity.Setitems(Index: Integer; const AsalesOrderShipmentItemEntityArray: salesOrderShipmentItemEntityArray);
begin
  Fitems := AsalesOrderShipmentItemEntityArray;
  Fitems_Specified := True;
end;

function salesOrderShipmentEntity.items_Specified(Index: Integer): boolean;
begin
  Result := Fitems_Specified;
end;

procedure salesOrderShipmentEntity.Settracks(Index: Integer; const AsalesOrderShipmentTrackEntityArray: salesOrderShipmentTrackEntityArray);
begin
  Ftracks := AsalesOrderShipmentTrackEntityArray;
  Ftracks_Specified := True;
end;

function salesOrderShipmentEntity.tracks_Specified(Index: Integer): boolean;
begin
  Result := Ftracks_Specified;
end;

procedure salesOrderShipmentEntity.Setcomments(Index: Integer; const AsalesOrderShipmentCommentEntityArray: salesOrderShipmentCommentEntityArray);
begin
  Fcomments := AsalesOrderShipmentCommentEntityArray;
  Fcomments_Specified := True;
end;

function salesOrderShipmentEntity.comments_Specified(Index: Integer): boolean;
begin
  Result := Fcomments_Specified;
end;

procedure salesOrderStatusHistoryEntity.Setincrement_id(Index: Integer; const Astring: string);
begin
  Fincrement_id := Astring;
  Fincrement_id_Specified := True;
end;

function salesOrderStatusHistoryEntity.increment_id_Specified(Index: Integer): boolean;
begin
  Result := Fincrement_id_Specified;
end;

procedure salesOrderStatusHistoryEntity.Setparent_id(Index: Integer; const Astring: string);
begin
  Fparent_id := Astring;
  Fparent_id_Specified := True;
end;

function salesOrderStatusHistoryEntity.parent_id_Specified(Index: Integer): boolean;
begin
  Result := Fparent_id_Specified;
end;

procedure salesOrderStatusHistoryEntity.Setcreated_at(Index: Integer; const Astring: string);
begin
  Fcreated_at := Astring;
  Fcreated_at_Specified := True;
end;

function salesOrderStatusHistoryEntity.created_at_Specified(Index: Integer): boolean;
begin
  Result := Fcreated_at_Specified;
end;

procedure salesOrderStatusHistoryEntity.Setupdated_at(Index: Integer; const Astring: string);
begin
  Fupdated_at := Astring;
  Fupdated_at_Specified := True;
end;

function salesOrderStatusHistoryEntity.updated_at_Specified(Index: Integer): boolean;
begin
  Result := Fupdated_at_Specified;
end;

procedure salesOrderStatusHistoryEntity.Setis_active(Index: Integer; const Astring: string);
begin
  Fis_active := Astring;
  Fis_active_Specified := True;
end;

function salesOrderStatusHistoryEntity.is_active_Specified(Index: Integer): boolean;
begin
  Result := Fis_active_Specified;
end;

procedure salesOrderStatusHistoryEntity.Setis_customer_notified(Index: Integer; const Astring: string);
begin
  Fis_customer_notified := Astring;
  Fis_customer_notified_Specified := True;
end;

function salesOrderStatusHistoryEntity.is_customer_notified_Specified(Index: Integer): boolean;
begin
  Result := Fis_customer_notified_Specified;
end;

procedure salesOrderStatusHistoryEntity.Setstatus(Index: Integer; const Astring: string);
begin
  Fstatus := Astring;
  Fstatus_Specified := True;
end;

function salesOrderStatusHistoryEntity.status_Specified(Index: Integer): boolean;
begin
  Result := Fstatus_Specified;
end;

procedure salesOrderStatusHistoryEntity.Setcomment(Index: Integer; const Astring: string);
begin
  Fcomment := Astring;
  Fcomment_Specified := True;
end;

function salesOrderStatusHistoryEntity.comment_Specified(Index: Integer): boolean;
begin
  Result := Fcomment_Specified;
end;

procedure salesOrderShipmentCommentEntity.Setincrement_id(Index: Integer; const Astring: string);
begin
  Fincrement_id := Astring;
  Fincrement_id_Specified := True;
end;

function salesOrderShipmentCommentEntity.increment_id_Specified(Index: Integer): boolean;
begin
  Result := Fincrement_id_Specified;
end;

procedure salesOrderShipmentCommentEntity.Setparent_id(Index: Integer; const Astring: string);
begin
  Fparent_id := Astring;
  Fparent_id_Specified := True;
end;

function salesOrderShipmentCommentEntity.parent_id_Specified(Index: Integer): boolean;
begin
  Result := Fparent_id_Specified;
end;

procedure salesOrderShipmentCommentEntity.Setcreated_at(Index: Integer; const Astring: string);
begin
  Fcreated_at := Astring;
  Fcreated_at_Specified := True;
end;

function salesOrderShipmentCommentEntity.created_at_Specified(Index: Integer): boolean;
begin
  Result := Fcreated_at_Specified;
end;

procedure salesOrderShipmentCommentEntity.Setupdated_at(Index: Integer; const Astring: string);
begin
  Fupdated_at := Astring;
  Fupdated_at_Specified := True;
end;

function salesOrderShipmentCommentEntity.updated_at_Specified(Index: Integer): boolean;
begin
  Result := Fupdated_at_Specified;
end;

procedure salesOrderShipmentCommentEntity.Setis_active(Index: Integer; const Astring: string);
begin
  Fis_active := Astring;
  Fis_active_Specified := True;
end;

function salesOrderShipmentCommentEntity.is_active_Specified(Index: Integer): boolean;
begin
  Result := Fis_active_Specified;
end;

procedure salesOrderShipmentCommentEntity.Setcomment(Index: Integer; const Astring: string);
begin
  Fcomment := Astring;
  Fcomment_Specified := True;
end;

function salesOrderShipmentCommentEntity.comment_Specified(Index: Integer): boolean;
begin
  Result := Fcomment_Specified;
end;

procedure salesOrderShipmentCommentEntity.Setis_customer_notified(Index: Integer; const Astring: string);
begin
  Fis_customer_notified := Astring;
  Fis_customer_notified_Specified := True;
end;

function salesOrderShipmentCommentEntity.is_customer_notified_Specified(Index: Integer): boolean;
begin
  Result := Fis_customer_notified_Specified;
end;

procedure salesOrderShipmentCommentEntity.Setcomment_id(Index: Integer; const Astring: string);
begin
  Fcomment_id := Astring;
  Fcomment_id_Specified := True;
end;

function salesOrderShipmentCommentEntity.comment_id_Specified(Index: Integer): boolean;
begin
  Result := Fcomment_id_Specified;
end;

procedure salesOrderShipmentTrackEntity.Setincrement_id(Index: Integer; const Astring: string);
begin
  Fincrement_id := Astring;
  Fincrement_id_Specified := True;
end;

function salesOrderShipmentTrackEntity.increment_id_Specified(Index: Integer): boolean;
begin
  Result := Fincrement_id_Specified;
end;

procedure salesOrderShipmentTrackEntity.Setparent_id(Index: Integer; const Astring: string);
begin
  Fparent_id := Astring;
  Fparent_id_Specified := True;
end;

function salesOrderShipmentTrackEntity.parent_id_Specified(Index: Integer): boolean;
begin
  Result := Fparent_id_Specified;
end;

procedure salesOrderShipmentTrackEntity.Setcreated_at(Index: Integer; const Astring: string);
begin
  Fcreated_at := Astring;
  Fcreated_at_Specified := True;
end;

function salesOrderShipmentTrackEntity.created_at_Specified(Index: Integer): boolean;
begin
  Result := Fcreated_at_Specified;
end;

procedure salesOrderShipmentTrackEntity.Setupdated_at(Index: Integer; const Astring: string);
begin
  Fupdated_at := Astring;
  Fupdated_at_Specified := True;
end;

function salesOrderShipmentTrackEntity.updated_at_Specified(Index: Integer): boolean;
begin
  Result := Fupdated_at_Specified;
end;

procedure salesOrderShipmentTrackEntity.Setis_active(Index: Integer; const Astring: string);
begin
  Fis_active := Astring;
  Fis_active_Specified := True;
end;

function salesOrderShipmentTrackEntity.is_active_Specified(Index: Integer): boolean;
begin
  Result := Fis_active_Specified;
end;

procedure salesOrderShipmentTrackEntity.Setcarrier_code(Index: Integer; const Astring: string);
begin
  Fcarrier_code := Astring;
  Fcarrier_code_Specified := True;
end;

function salesOrderShipmentTrackEntity.carrier_code_Specified(Index: Integer): boolean;
begin
  Result := Fcarrier_code_Specified;
end;

procedure salesOrderShipmentTrackEntity.Settitle(Index: Integer; const Astring: string);
begin
  Ftitle := Astring;
  Ftitle_Specified := True;
end;

function salesOrderShipmentTrackEntity.title_Specified(Index: Integer): boolean;
begin
  Result := Ftitle_Specified;
end;

procedure salesOrderShipmentTrackEntity.Setnumber(Index: Integer; const Astring: string);
begin
  Fnumber := Astring;
  Fnumber_Specified := True;
end;

function salesOrderShipmentTrackEntity.number_Specified(Index: Integer): boolean;
begin
  Result := Fnumber_Specified;
end;

procedure salesOrderShipmentTrackEntity.Setorder_id(Index: Integer; const Astring: string);
begin
  Forder_id := Astring;
  Forder_id_Specified := True;
end;

function salesOrderShipmentTrackEntity.order_id_Specified(Index: Integer): boolean;
begin
  Result := Forder_id_Specified;
end;

procedure salesOrderShipmentTrackEntity.Settrack_id(Index: Integer; const Astring: string);
begin
  Ftrack_id := Astring;
  Ftrack_id_Specified := True;
end;

function salesOrderShipmentTrackEntity.track_id_Specified(Index: Integer): boolean;
begin
  Result := Ftrack_id_Specified;
end;

procedure salesOrderShipmentItemEntity.Setincrement_id(Index: Integer; const Astring: string);
begin
  Fincrement_id := Astring;
  Fincrement_id_Specified := True;
end;

function salesOrderShipmentItemEntity.increment_id_Specified(Index: Integer): boolean;
begin
  Result := Fincrement_id_Specified;
end;

procedure salesOrderShipmentItemEntity.Setparent_id(Index: Integer; const Astring: string);
begin
  Fparent_id := Astring;
  Fparent_id_Specified := True;
end;

function salesOrderShipmentItemEntity.parent_id_Specified(Index: Integer): boolean;
begin
  Result := Fparent_id_Specified;
end;

procedure salesOrderShipmentItemEntity.Setcreated_at(Index: Integer; const Astring: string);
begin
  Fcreated_at := Astring;
  Fcreated_at_Specified := True;
end;

function salesOrderShipmentItemEntity.created_at_Specified(Index: Integer): boolean;
begin
  Result := Fcreated_at_Specified;
end;

procedure salesOrderShipmentItemEntity.Setupdated_at(Index: Integer; const Astring: string);
begin
  Fupdated_at := Astring;
  Fupdated_at_Specified := True;
end;

function salesOrderShipmentItemEntity.updated_at_Specified(Index: Integer): boolean;
begin
  Result := Fupdated_at_Specified;
end;

procedure salesOrderShipmentItemEntity.Setis_active(Index: Integer; const Astring: string);
begin
  Fis_active := Astring;
  Fis_active_Specified := True;
end;

function salesOrderShipmentItemEntity.is_active_Specified(Index: Integer): boolean;
begin
  Result := Fis_active_Specified;
end;

procedure salesOrderShipmentItemEntity.Setsku(Index: Integer; const Astring: string);
begin
  Fsku := Astring;
  Fsku_Specified := True;
end;

function salesOrderShipmentItemEntity.sku_Specified(Index: Integer): boolean;
begin
  Result := Fsku_Specified;
end;

procedure salesOrderShipmentItemEntity.Setname_(Index: Integer; const Astring: string);
begin
  Fname_ := Astring;
  Fname__Specified := True;
end;

function salesOrderShipmentItemEntity.name__Specified(Index: Integer): boolean;
begin
  Result := Fname__Specified;
end;

procedure salesOrderShipmentItemEntity.Setorder_item_id(Index: Integer; const Astring: string);
begin
  Forder_item_id := Astring;
  Forder_item_id_Specified := True;
end;

function salesOrderShipmentItemEntity.order_item_id_Specified(Index: Integer): boolean;
begin
  Result := Forder_item_id_Specified;
end;

procedure salesOrderShipmentItemEntity.Setproduct_id(Index: Integer; const Astring: string);
begin
  Fproduct_id := Astring;
  Fproduct_id_Specified := True;
end;

function salesOrderShipmentItemEntity.product_id_Specified(Index: Integer): boolean;
begin
  Result := Fproduct_id_Specified;
end;

procedure salesOrderShipmentItemEntity.Setweight(Index: Integer; const Astring: string);
begin
  Fweight := Astring;
  Fweight_Specified := True;
end;

function salesOrderShipmentItemEntity.weight_Specified(Index: Integer): boolean;
begin
  Result := Fweight_Specified;
end;

procedure salesOrderShipmentItemEntity.Setprice(Index: Integer; const Astring: string);
begin
  Fprice := Astring;
  Fprice_Specified := True;
end;

function salesOrderShipmentItemEntity.price_Specified(Index: Integer): boolean;
begin
  Result := Fprice_Specified;
end;

procedure salesOrderShipmentItemEntity.Setqty(Index: Integer; const Astring: string);
begin
  Fqty := Astring;
  Fqty_Specified := True;
end;

function salesOrderShipmentItemEntity.qty_Specified(Index: Integer): boolean;
begin
  Result := Fqty_Specified;
end;

procedure salesOrderShipmentItemEntity.Setitem_id(Index: Integer; const Astring: string);
begin
  Fitem_id := Astring;
  Fitem_id_Specified := True;
end;

function salesOrderShipmentItemEntity.item_id_Specified(Index: Integer): boolean;
begin
  Result := Fitem_id_Specified;
end;

procedure int2.Setid(Index: Integer; const Astring: string);
begin
  Fid := Astring;
  Fid_Specified := True;
end;

function int2.id_Specified(Index: Integer): boolean;
begin
  Result := Fid_Specified;
end;

procedure int2.Sethref(Index: Integer; const Astring: string);
begin
  Fhref := Astring;
  Fhref_Specified := True;
end;

function int2.href_Specified(Index: Integer): boolean;
begin
  Result := Fhref_Specified;
end;

procedure customerCustomerEntityToCreate.Setcustomer_id(Index: Integer; const AInteger: Integer);
begin
  Fcustomer_id := AInteger;
  Fcustomer_id_Specified := True;
end;

function customerCustomerEntityToCreate.customer_id_Specified(Index: Integer): boolean;
begin
  Result := Fcustomer_id_Specified;
end;

procedure customerCustomerEntityToCreate.Setemail(Index: Integer; const Astring: string);
begin
  Femail := Astring;
  Femail_Specified := True;
end;

function customerCustomerEntityToCreate.email_Specified(Index: Integer): boolean;
begin
  Result := Femail_Specified;
end;

procedure customerCustomerEntityToCreate.Setfirstname(Index: Integer; const Astring: string);
begin
  Ffirstname := Astring;
  Ffirstname_Specified := True;
end;

function customerCustomerEntityToCreate.firstname_Specified(Index: Integer): boolean;
begin
  Result := Ffirstname_Specified;
end;

procedure customerCustomerEntityToCreate.Setlastname(Index: Integer; const Astring: string);
begin
  Flastname := Astring;
  Flastname_Specified := True;
end;

function customerCustomerEntityToCreate.lastname_Specified(Index: Integer): boolean;
begin
  Result := Flastname_Specified;
end;

procedure customerCustomerEntityToCreate.Setmiddlename(Index: Integer; const Astring: string);
begin
  Fmiddlename := Astring;
  Fmiddlename_Specified := True;
end;

function customerCustomerEntityToCreate.middlename_Specified(Index: Integer): boolean;
begin
  Result := Fmiddlename_Specified;
end;

procedure customerCustomerEntityToCreate.Setpassword(Index: Integer; const Astring: string);
begin
  Fpassword := Astring;
  Fpassword_Specified := True;
end;

function customerCustomerEntityToCreate.password_Specified(Index: Integer): boolean;
begin
  Result := Fpassword_Specified;
end;

procedure customerCustomerEntityToCreate.Setwebsite_id(Index: Integer; const AInteger: Integer);
begin
  Fwebsite_id := AInteger;
  Fwebsite_id_Specified := True;
end;

function customerCustomerEntityToCreate.website_id_Specified(Index: Integer): boolean;
begin
  Result := Fwebsite_id_Specified;
end;

procedure customerCustomerEntityToCreate.Setstore_id(Index: Integer; const AInteger: Integer);
begin
  Fstore_id := AInteger;
  Fstore_id_Specified := True;
end;

function customerCustomerEntityToCreate.store_id_Specified(Index: Integer): boolean;
begin
  Result := Fstore_id_Specified;
end;

procedure customerCustomerEntityToCreate.Setgroup_id(Index: Integer; const AInteger: Integer);
begin
  Fgroup_id := AInteger;
  Fgroup_id_Specified := True;
end;

function customerCustomerEntityToCreate.group_id_Specified(Index: Integer): boolean;
begin
  Result := Fgroup_id_Specified;
end;

procedure customerCustomerEntityToCreate.Setprefix(Index: Integer; const Astring: string);
begin
  Fprefix := Astring;
  Fprefix_Specified := True;
end;

function customerCustomerEntityToCreate.prefix_Specified(Index: Integer): boolean;
begin
  Result := Fprefix_Specified;
end;

procedure customerCustomerEntityToCreate.Setsuffix(Index: Integer; const Astring: string);
begin
  Fsuffix := Astring;
  Fsuffix_Specified := True;
end;

function customerCustomerEntityToCreate.suffix_Specified(Index: Integer): boolean;
begin
  Result := Fsuffix_Specified;
end;

procedure customerCustomerEntityToCreate.Setdob(Index: Integer; const Astring: string);
begin
  Fdob := Astring;
  Fdob_Specified := True;
end;

function customerCustomerEntityToCreate.dob_Specified(Index: Integer): boolean;
begin
  Result := Fdob_Specified;
end;

procedure customerCustomerEntityToCreate.Settaxvat(Index: Integer; const Astring: string);
begin
  Ftaxvat := Astring;
  Ftaxvat_Specified := True;
end;

function customerCustomerEntityToCreate.taxvat_Specified(Index: Integer): boolean;
begin
  Result := Ftaxvat_Specified;
end;

procedure customerCustomerEntityToCreate.Setgender(Index: Integer; const AInteger: Integer);
begin
  Fgender := AInteger;
  Fgender_Specified := True;
end;

function customerCustomerEntityToCreate.gender_Specified(Index: Integer): boolean;
begin
  Result := Fgender_Specified;
end;

procedure shoppingCartCustomerEntity.Setmode(Index: Integer; const Astring: string);
begin
  Fmode := Astring;
  Fmode_Specified := True;
end;

function shoppingCartCustomerEntity.mode_Specified(Index: Integer): boolean;
begin
  Result := Fmode_Specified;
end;

procedure shoppingCartCustomerEntity.Setcustomer_id(Index: Integer; const AInteger: Integer);
begin
  Fcustomer_id := AInteger;
  Fcustomer_id_Specified := True;
end;

function shoppingCartCustomerEntity.customer_id_Specified(Index: Integer): boolean;
begin
  Result := Fcustomer_id_Specified;
end;

procedure shoppingCartCustomerEntity.Setemail(Index: Integer; const Astring: string);
begin
  Femail := Astring;
  Femail_Specified := True;
end;

function shoppingCartCustomerEntity.email_Specified(Index: Integer): boolean;
begin
  Result := Femail_Specified;
end;

procedure shoppingCartCustomerEntity.Setfirstname(Index: Integer; const Astring: string);
begin
  Ffirstname := Astring;
  Ffirstname_Specified := True;
end;

function shoppingCartCustomerEntity.firstname_Specified(Index: Integer): boolean;
begin
  Result := Ffirstname_Specified;
end;

procedure shoppingCartCustomerEntity.Setlastname(Index: Integer; const Astring: string);
begin
  Flastname := Astring;
  Flastname_Specified := True;
end;

function shoppingCartCustomerEntity.lastname_Specified(Index: Integer): boolean;
begin
  Result := Flastname_Specified;
end;

procedure shoppingCartCustomerEntity.Setpassword(Index: Integer; const Astring: string);
begin
  Fpassword := Astring;
  Fpassword_Specified := True;
end;

function shoppingCartCustomerEntity.password_Specified(Index: Integer): boolean;
begin
  Result := Fpassword_Specified;
end;

procedure shoppingCartCustomerEntity.Setconfirmation(Index: Integer; const Astring: string);
begin
  Fconfirmation := Astring;
  Fconfirmation_Specified := True;
end;

function shoppingCartCustomerEntity.confirmation_Specified(Index: Integer): boolean;
begin
  Result := Fconfirmation_Specified;
end;

procedure shoppingCartCustomerEntity.Setwebsite_id(Index: Integer; const AInteger: Integer);
begin
  Fwebsite_id := AInteger;
  Fwebsite_id_Specified := True;
end;

function shoppingCartCustomerEntity.website_id_Specified(Index: Integer): boolean;
begin
  Result := Fwebsite_id_Specified;
end;

procedure shoppingCartCustomerEntity.Setstore_id(Index: Integer; const AInteger: Integer);
begin
  Fstore_id := AInteger;
  Fstore_id_Specified := True;
end;

function shoppingCartCustomerEntity.store_id_Specified(Index: Integer): boolean;
begin
  Result := Fstore_id_Specified;
end;

procedure shoppingCartCustomerEntity.Setgroup_id(Index: Integer; const AInteger: Integer);
begin
  Fgroup_id := AInteger;
  Fgroup_id_Specified := True;
end;

function shoppingCartCustomerEntity.group_id_Specified(Index: Integer): boolean;
begin
  Result := Fgroup_id_Specified;
end;

procedure shoppingCartCustomerAddressEntity.Setmode(Index: Integer; const Astring: string);
begin
  Fmode := Astring;
  Fmode_Specified := True;
end;

function shoppingCartCustomerAddressEntity.mode_Specified(Index: Integer): boolean;
begin
  Result := Fmode_Specified;
end;

procedure shoppingCartCustomerAddressEntity.Setaddress_id(Index: Integer; const Astring: string);
begin
  Faddress_id := Astring;
  Faddress_id_Specified := True;
end;

function shoppingCartCustomerAddressEntity.address_id_Specified(Index: Integer): boolean;
begin
  Result := Faddress_id_Specified;
end;

procedure shoppingCartCustomerAddressEntity.Setfirstname(Index: Integer; const Astring: string);
begin
  Ffirstname := Astring;
  Ffirstname_Specified := True;
end;

function shoppingCartCustomerAddressEntity.firstname_Specified(Index: Integer): boolean;
begin
  Result := Ffirstname_Specified;
end;

procedure shoppingCartCustomerAddressEntity.Setlastname(Index: Integer; const Astring: string);
begin
  Flastname := Astring;
  Flastname_Specified := True;
end;

function shoppingCartCustomerAddressEntity.lastname_Specified(Index: Integer): boolean;
begin
  Result := Flastname_Specified;
end;

procedure shoppingCartCustomerAddressEntity.Setcompany(Index: Integer; const Astring: string);
begin
  Fcompany := Astring;
  Fcompany_Specified := True;
end;

function shoppingCartCustomerAddressEntity.company_Specified(Index: Integer): boolean;
begin
  Result := Fcompany_Specified;
end;

procedure shoppingCartCustomerAddressEntity.Setstreet(Index: Integer; const Astring: string);
begin
  Fstreet := Astring;
  Fstreet_Specified := True;
end;

function shoppingCartCustomerAddressEntity.street_Specified(Index: Integer): boolean;
begin
  Result := Fstreet_Specified;
end;

procedure shoppingCartCustomerAddressEntity.Setcity(Index: Integer; const Astring: string);
begin
  Fcity := Astring;
  Fcity_Specified := True;
end;

function shoppingCartCustomerAddressEntity.city_Specified(Index: Integer): boolean;
begin
  Result := Fcity_Specified;
end;

procedure shoppingCartCustomerAddressEntity.Setregion(Index: Integer; const Astring: string);
begin
  Fregion := Astring;
  Fregion_Specified := True;
end;

function shoppingCartCustomerAddressEntity.region_Specified(Index: Integer): boolean;
begin
  Result := Fregion_Specified;
end;

procedure shoppingCartCustomerAddressEntity.Setregion_id(Index: Integer; const Astring: string);
begin
  Fregion_id := Astring;
  Fregion_id_Specified := True;
end;

function shoppingCartCustomerAddressEntity.region_id_Specified(Index: Integer): boolean;
begin
  Result := Fregion_id_Specified;
end;

procedure shoppingCartCustomerAddressEntity.Setpostcode(Index: Integer; const Astring: string);
begin
  Fpostcode := Astring;
  Fpostcode_Specified := True;
end;

function shoppingCartCustomerAddressEntity.postcode_Specified(Index: Integer): boolean;
begin
  Result := Fpostcode_Specified;
end;

procedure shoppingCartCustomerAddressEntity.Setcountry_id(Index: Integer; const Astring: string);
begin
  Fcountry_id := Astring;
  Fcountry_id_Specified := True;
end;

function shoppingCartCustomerAddressEntity.country_id_Specified(Index: Integer): boolean;
begin
  Result := Fcountry_id_Specified;
end;

procedure shoppingCartCustomerAddressEntity.Settelephone(Index: Integer; const Astring: string);
begin
  Ftelephone := Astring;
  Ftelephone_Specified := True;
end;

function shoppingCartCustomerAddressEntity.telephone_Specified(Index: Integer): boolean;
begin
  Result := Ftelephone_Specified;
end;

procedure shoppingCartCustomerAddressEntity.Setfax(Index: Integer; const Astring: string);
begin
  Ffax := Astring;
  Ffax_Specified := True;
end;

function shoppingCartCustomerAddressEntity.fax_Specified(Index: Integer): boolean;
begin
  Result := Ffax_Specified;
end;

procedure shoppingCartCustomerAddressEntity.Setis_default_billing(Index: Integer; const AInteger: Integer);
begin
  Fis_default_billing := AInteger;
  Fis_default_billing_Specified := True;
end;

function shoppingCartCustomerAddressEntity.is_default_billing_Specified(Index: Integer): boolean;
begin
  Result := Fis_default_billing_Specified;
end;

procedure shoppingCartCustomerAddressEntity.Setis_default_shipping(Index: Integer; const AInteger: Integer);
begin
  Fis_default_shipping := AInteger;
  Fis_default_shipping_Specified := True;
end;

function shoppingCartCustomerAddressEntity.is_default_shipping_Specified(Index: Integer): boolean;
begin
  Result := Fis_default_shipping_Specified;
end;

procedure shoppingCartLicenseEntity.Setagreement_id(Index: Integer; const Astring: string);
begin
  Fagreement_id := Astring;
  Fagreement_id_Specified := True;
end;

function shoppingCartLicenseEntity.agreement_id_Specified(Index: Integer): boolean;
begin
  Result := Fagreement_id_Specified;
end;

procedure shoppingCartLicenseEntity.Setname_(Index: Integer; const Astring: string);
begin
  Fname_ := Astring;
  Fname__Specified := True;
end;

function shoppingCartLicenseEntity.name__Specified(Index: Integer): boolean;
begin
  Result := Fname__Specified;
end;

procedure shoppingCartLicenseEntity.Setcontent(Index: Integer; const Astring: string);
begin
  Fcontent := Astring;
  Fcontent_Specified := True;
end;

function shoppingCartLicenseEntity.content_Specified(Index: Integer): boolean;
begin
  Result := Fcontent_Specified;
end;

procedure shoppingCartLicenseEntity.Setis_active(Index: Integer; const AInteger: Integer);
begin
  Fis_active := AInteger;
  Fis_active_Specified := True;
end;

function shoppingCartLicenseEntity.is_active_Specified(Index: Integer): boolean;
begin
  Result := Fis_active_Specified;
end;

procedure shoppingCartLicenseEntity.Setis_html(Index: Integer; const AInteger: Integer);
begin
  Fis_html := AInteger;
  Fis_html_Specified := True;
end;

function shoppingCartLicenseEntity.is_html_Specified(Index: Integer): boolean;
begin
  Result := Fis_html_Specified;
end;

destructor catalogProductDownloadableLinkEntity.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Ffile_save)-1 do
    SysUtils.FreeAndNil(Ffile_save[I]);
  System.SetLength(Ffile_save, 0);
  for I := 0 to System.Length(Fsample_file_save)-1 do
    SysUtils.FreeAndNil(Fsample_file_save[I]);
  System.SetLength(Fsample_file_save, 0);
  inherited Destroy;
end;

procedure catalogProductDownloadableLinkEntity.Setnumber_of_downloads(Index: Integer; const AInteger: Integer);
begin
  Fnumber_of_downloads := AInteger;
  Fnumber_of_downloads_Specified := True;
end;

function catalogProductDownloadableLinkEntity.number_of_downloads_Specified(Index: Integer): boolean;
begin
  Result := Fnumber_of_downloads_Specified;
end;

procedure catalogProductDownloadableLinkEntity.Setis_unlimited(Index: Integer; const AInteger: Integer);
begin
  Fis_unlimited := AInteger;
  Fis_unlimited_Specified := True;
end;

function catalogProductDownloadableLinkEntity.is_unlimited_Specified(Index: Integer): boolean;
begin
  Result := Fis_unlimited_Specified;
end;

procedure catalogProductDownloadableLinkEntity.Setsample_file(Index: Integer; const Astring: string);
begin
  Fsample_file := Astring;
  Fsample_file_Specified := True;
end;

function catalogProductDownloadableLinkEntity.sample_file_Specified(Index: Integer): boolean;
begin
  Result := Fsample_file_Specified;
end;

procedure catalogProductDownloadableLinkEntity.Setsample_url(Index: Integer; const Astring: string);
begin
  Fsample_url := Astring;
  Fsample_url_Specified := True;
end;

function catalogProductDownloadableLinkEntity.sample_url_Specified(Index: Integer): boolean;
begin
  Result := Fsample_url_Specified;
end;

procedure catalogProductDownloadableLinkEntity.Setfile_save(Index: Integer; const AcatalogProductDownloadableLinkFileInfoEntityArray: catalogProductDownloadableLinkFileInfoEntityArray);
begin
  Ffile_save := AcatalogProductDownloadableLinkFileInfoEntityArray;
  Ffile_save_Specified := True;
end;

function catalogProductDownloadableLinkEntity.file_save_Specified(Index: Integer): boolean;
begin
  Result := Ffile_save_Specified;
end;

procedure catalogProductDownloadableLinkEntity.Setsample_file_save(Index: Integer; const AcatalogProductDownloadableLinkFileInfoEntityArray: catalogProductDownloadableLinkFileInfoEntityArray);
begin
  Fsample_file_save := AcatalogProductDownloadableLinkFileInfoEntityArray;
  Fsample_file_save_Specified := True;
end;

function catalogProductDownloadableLinkEntity.sample_file_save_Specified(Index: Integer): boolean;
begin
  Result := Fsample_file_save_Specified;
end;

destructor catalogProductDownloadableLinkAddEntity.Destroy;
begin
  SysUtils.FreeAndNil(Fsample);
  SysUtils.FreeAndNil(Ffile_);
  inherited Destroy;
end;

procedure catalogProductDownloadableLinkAddEntity.Setprice(Index: Integer; const Astring: string);
begin
  Fprice := Astring;
  Fprice_Specified := True;
end;

function catalogProductDownloadableLinkAddEntity.price_Specified(Index: Integer): boolean;
begin
  Result := Fprice_Specified;
end;

procedure catalogProductDownloadableLinkAddEntity.Setis_unlimited(Index: Integer; const AInteger: Integer);
begin
  Fis_unlimited := AInteger;
  Fis_unlimited_Specified := True;
end;

function catalogProductDownloadableLinkAddEntity.is_unlimited_Specified(Index: Integer): boolean;
begin
  Result := Fis_unlimited_Specified;
end;

procedure catalogProductDownloadableLinkAddEntity.Setnumber_of_downloads(Index: Integer; const AInteger: Integer);
begin
  Fnumber_of_downloads := AInteger;
  Fnumber_of_downloads_Specified := True;
end;

function catalogProductDownloadableLinkAddEntity.number_of_downloads_Specified(Index: Integer): boolean;
begin
  Result := Fnumber_of_downloads_Specified;
end;

procedure catalogProductDownloadableLinkAddEntity.Setis_shareable(Index: Integer; const AInteger: Integer);
begin
  Fis_shareable := AInteger;
  Fis_shareable_Specified := True;
end;

function catalogProductDownloadableLinkAddEntity.is_shareable_Specified(Index: Integer): boolean;
begin
  Result := Fis_shareable_Specified;
end;

procedure catalogProductDownloadableLinkAddEntity.Setsample(Index: Integer; const AcatalogProductDownloadableLinkAddSampleEntity: catalogProductDownloadableLinkAddSampleEntity);
begin
  Fsample := AcatalogProductDownloadableLinkAddSampleEntity;
  Fsample_Specified := True;
end;

function catalogProductDownloadableLinkAddEntity.sample_Specified(Index: Integer): boolean;
begin
  Result := Fsample_Specified;
end;

procedure catalogProductDownloadableLinkAddEntity.Settype_(Index: Integer; const Astring: string);
begin
  Ftype_ := Astring;
  Ftype__Specified := True;
end;

function catalogProductDownloadableLinkAddEntity.type__Specified(Index: Integer): boolean;
begin
  Result := Ftype__Specified;
end;

procedure catalogProductDownloadableLinkAddEntity.Setfile_(Index: Integer; const AcatalogProductDownloadableLinkFileEntity: catalogProductDownloadableLinkFileEntity);
begin
  Ffile_ := AcatalogProductDownloadableLinkFileEntity;
  Ffile__Specified := True;
end;

function catalogProductDownloadableLinkAddEntity.file__Specified(Index: Integer): boolean;
begin
  Result := Ffile__Specified;
end;

procedure catalogProductDownloadableLinkAddEntity.Setlink_url(Index: Integer; const Astring: string);
begin
  Flink_url := Astring;
  Flink_url_Specified := True;
end;

function catalogProductDownloadableLinkAddEntity.link_url_Specified(Index: Integer): boolean;
begin
  Result := Flink_url_Specified;
end;

procedure catalogProductDownloadableLinkAddEntity.Setsample_url(Index: Integer; const Astring: string);
begin
  Fsample_url := Astring;
  Fsample_url_Specified := True;
end;

function catalogProductDownloadableLinkAddEntity.sample_url_Specified(Index: Integer): boolean;
begin
  Result := Fsample_url_Specified;
end;

procedure catalogProductDownloadableLinkAddEntity.Setsort_order(Index: Integer; const AInteger: Integer);
begin
  Fsort_order := AInteger;
  Fsort_order_Specified := True;
end;

function catalogProductDownloadableLinkAddEntity.sort_order_Specified(Index: Integer): boolean;
begin
  Result := Fsort_order_Specified;
end;

destructor catalogProductCustomOptionToAdd.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Fadditional_fields)-1 do
    SysUtils.FreeAndNil(Fadditional_fields[I]);
  System.SetLength(Fadditional_fields, 0);
  inherited Destroy;
end;

procedure catalogProductCustomOptionToAdd.Setsort_order(Index: Integer; const Astring: string);
begin
  Fsort_order := Astring;
  Fsort_order_Specified := True;
end;

function catalogProductCustomOptionToAdd.sort_order_Specified(Index: Integer): boolean;
begin
  Result := Fsort_order_Specified;
end;

procedure catalogProductCustomOptionToAdd.Setis_require(Index: Integer; const AInteger: Integer);
begin
  Fis_require := AInteger;
  Fis_require_Specified := True;
end;

function catalogProductCustomOptionToAdd.is_require_Specified(Index: Integer): boolean;
begin
  Result := Fis_require_Specified;
end;

destructor catalogProductCustomOptionInfoEntity.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Fadditional_fields)-1 do
    SysUtils.FreeAndNil(Fadditional_fields[I]);
  System.SetLength(Fadditional_fields, 0);
  inherited Destroy;
end;

destructor catalogProductCustomOptionToUpdate.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Fadditional_fields)-1 do
    SysUtils.FreeAndNil(Fadditional_fields[I]);
  System.SetLength(Fadditional_fields, 0);
  inherited Destroy;
end;

procedure catalogProductCustomOptionToUpdate.Settitle(Index: Integer; const Astring: string);
begin
  Ftitle := Astring;
  Ftitle_Specified := True;
end;

function catalogProductCustomOptionToUpdate.title_Specified(Index: Integer): boolean;
begin
  Result := Ftitle_Specified;
end;

procedure catalogProductCustomOptionToUpdate.Settype_(Index: Integer; const Astring: string);
begin
  Ftype_ := Astring;
  Ftype__Specified := True;
end;

function catalogProductCustomOptionToUpdate.type__Specified(Index: Integer): boolean;
begin
  Result := Ftype__Specified;
end;

procedure catalogProductCustomOptionToUpdate.Setsort_order(Index: Integer; const Astring: string);
begin
  Fsort_order := Astring;
  Fsort_order_Specified := True;
end;

function catalogProductCustomOptionToUpdate.sort_order_Specified(Index: Integer): boolean;
begin
  Result := Fsort_order_Specified;
end;

procedure catalogProductCustomOptionToUpdate.Setis_require(Index: Integer; const AInteger: Integer);
begin
  Fis_require := AInteger;
  Fis_require_Specified := True;
end;

function catalogProductCustomOptionToUpdate.is_require_Specified(Index: Integer): boolean;
begin
  Result := Fis_require_Specified;
end;

procedure catalogProductCustomOptionToUpdate.Setadditional_fields(Index: Integer; const AcatalogProductCustomOptionAdditionalFieldsArray: catalogProductCustomOptionAdditionalFieldsArray);
begin
  Fadditional_fields := AcatalogProductCustomOptionAdditionalFieldsArray;
  Fadditional_fields_Specified := True;
end;

function catalogProductCustomOptionToUpdate.additional_fields_Specified(Index: Integer): boolean;
begin
  Result := Fadditional_fields_Specified;
end;

procedure string_2.Setid(Index: Integer; const Astring: string);
begin
  Fid := Astring;
  Fid_Specified := True;
end;

function string_2.id_Specified(Index: Integer): boolean;
begin
  Result := Fid_Specified;
end;

procedure string_2.Sethref(Index: Integer; const Astring: string);
begin
  Fhref := Astring;
  Fhref_Specified := True;
end;

function string_2.href_Specified(Index: Integer): boolean;
begin
  Result := Fhref_Specified;
end;

procedure customerCustomerEntity.Setcustomer_id(Index: Integer; const AInteger: Integer);
begin
  Fcustomer_id := AInteger;
  Fcustomer_id_Specified := True;
end;

function customerCustomerEntity.customer_id_Specified(Index: Integer): boolean;
begin
  Result := Fcustomer_id_Specified;
end;

procedure customerCustomerEntity.Setcreated_at(Index: Integer; const Astring: string);
begin
  Fcreated_at := Astring;
  Fcreated_at_Specified := True;
end;

function customerCustomerEntity.created_at_Specified(Index: Integer): boolean;
begin
  Result := Fcreated_at_Specified;
end;

procedure customerCustomerEntity.Setupdated_at(Index: Integer; const Astring: string);
begin
  Fupdated_at := Astring;
  Fupdated_at_Specified := True;
end;

function customerCustomerEntity.updated_at_Specified(Index: Integer): boolean;
begin
  Result := Fupdated_at_Specified;
end;

procedure customerCustomerEntity.Setincrement_id(Index: Integer; const Astring: string);
begin
  Fincrement_id := Astring;
  Fincrement_id_Specified := True;
end;

function customerCustomerEntity.increment_id_Specified(Index: Integer): boolean;
begin
  Result := Fincrement_id_Specified;
end;

procedure customerCustomerEntity.Setstore_id(Index: Integer; const AInteger: Integer);
begin
  Fstore_id := AInteger;
  Fstore_id_Specified := True;
end;

function customerCustomerEntity.store_id_Specified(Index: Integer): boolean;
begin
  Result := Fstore_id_Specified;
end;

procedure customerCustomerEntity.Setwebsite_id(Index: Integer; const AInteger: Integer);
begin
  Fwebsite_id := AInteger;
  Fwebsite_id_Specified := True;
end;

function customerCustomerEntity.website_id_Specified(Index: Integer): boolean;
begin
  Result := Fwebsite_id_Specified;
end;

procedure customerCustomerEntity.Setcreated_in(Index: Integer; const Astring: string);
begin
  Fcreated_in := Astring;
  Fcreated_in_Specified := True;
end;

function customerCustomerEntity.created_in_Specified(Index: Integer): boolean;
begin
  Result := Fcreated_in_Specified;
end;

procedure customerCustomerEntity.Setemail(Index: Integer; const Astring: string);
begin
  Femail := Astring;
  Femail_Specified := True;
end;

function customerCustomerEntity.email_Specified(Index: Integer): boolean;
begin
  Result := Femail_Specified;
end;

procedure customerCustomerEntity.Setfirstname(Index: Integer; const Astring: string);
begin
  Ffirstname := Astring;
  Ffirstname_Specified := True;
end;

function customerCustomerEntity.firstname_Specified(Index: Integer): boolean;
begin
  Result := Ffirstname_Specified;
end;

procedure customerCustomerEntity.Setmiddlename(Index: Integer; const Astring: string);
begin
  Fmiddlename := Astring;
  Fmiddlename_Specified := True;
end;

function customerCustomerEntity.middlename_Specified(Index: Integer): boolean;
begin
  Result := Fmiddlename_Specified;
end;

procedure customerCustomerEntity.Setlastname(Index: Integer; const Astring: string);
begin
  Flastname := Astring;
  Flastname_Specified := True;
end;

function customerCustomerEntity.lastname_Specified(Index: Integer): boolean;
begin
  Result := Flastname_Specified;
end;

procedure customerCustomerEntity.Setgroup_id(Index: Integer; const AInteger: Integer);
begin
  Fgroup_id := AInteger;
  Fgroup_id_Specified := True;
end;

function customerCustomerEntity.group_id_Specified(Index: Integer): boolean;
begin
  Result := Fgroup_id_Specified;
end;

procedure customerCustomerEntity.Setprefix(Index: Integer; const Astring: string);
begin
  Fprefix := Astring;
  Fprefix_Specified := True;
end;

function customerCustomerEntity.prefix_Specified(Index: Integer): boolean;
begin
  Result := Fprefix_Specified;
end;

procedure customerCustomerEntity.Setsuffix(Index: Integer; const Astring: string);
begin
  Fsuffix := Astring;
  Fsuffix_Specified := True;
end;

function customerCustomerEntity.suffix_Specified(Index: Integer): boolean;
begin
  Result := Fsuffix_Specified;
end;

procedure customerCustomerEntity.Setdob(Index: Integer; const Astring: string);
begin
  Fdob := Astring;
  Fdob_Specified := True;
end;

function customerCustomerEntity.dob_Specified(Index: Integer): boolean;
begin
  Result := Fdob_Specified;
end;

procedure customerCustomerEntity.Settaxvat(Index: Integer; const Astring: string);
begin
  Ftaxvat := Astring;
  Ftaxvat_Specified := True;
end;

function customerCustomerEntity.taxvat_Specified(Index: Integer): boolean;
begin
  Result := Ftaxvat_Specified;
end;

procedure customerCustomerEntity.Setconfirmation(Index: Integer; const ABoolean: Boolean);
begin
  Fconfirmation := ABoolean;
  Fconfirmation_Specified := True;
end;

function customerCustomerEntity.confirmation_Specified(Index: Integer): boolean;
begin
  Result := Fconfirmation_Specified;
end;

procedure customerCustomerEntity.Setpassword_hash(Index: Integer; const Astring: string);
begin
  Fpassword_hash := Astring;
  Fpassword_hash_Specified := True;
end;

function customerCustomerEntity.password_hash_Specified(Index: Integer): boolean;
begin
  Result := Fpassword_hash_Specified;
end;

procedure customerAddressEntityItem.Setcustomer_address_id(Index: Integer; const AInteger: Integer);
begin
  Fcustomer_address_id := AInteger;
  Fcustomer_address_id_Specified := True;
end;

function customerAddressEntityItem.customer_address_id_Specified(Index: Integer): boolean;
begin
  Result := Fcustomer_address_id_Specified;
end;

procedure customerAddressEntityItem.Setcreated_at(Index: Integer; const Astring: string);
begin
  Fcreated_at := Astring;
  Fcreated_at_Specified := True;
end;

function customerAddressEntityItem.created_at_Specified(Index: Integer): boolean;
begin
  Result := Fcreated_at_Specified;
end;

procedure customerAddressEntityItem.Setupdated_at(Index: Integer; const Astring: string);
begin
  Fupdated_at := Astring;
  Fupdated_at_Specified := True;
end;

function customerAddressEntityItem.updated_at_Specified(Index: Integer): boolean;
begin
  Result := Fupdated_at_Specified;
end;

procedure customerAddressEntityItem.Setincrement_id(Index: Integer; const Astring: string);
begin
  Fincrement_id := Astring;
  Fincrement_id_Specified := True;
end;

function customerAddressEntityItem.increment_id_Specified(Index: Integer): boolean;
begin
  Result := Fincrement_id_Specified;
end;

procedure customerAddressEntityItem.Setcity(Index: Integer; const Astring: string);
begin
  Fcity := Astring;
  Fcity_Specified := True;
end;

function customerAddressEntityItem.city_Specified(Index: Integer): boolean;
begin
  Result := Fcity_Specified;
end;

procedure customerAddressEntityItem.Setcompany(Index: Integer; const Astring: string);
begin
  Fcompany := Astring;
  Fcompany_Specified := True;
end;

function customerAddressEntityItem.company_Specified(Index: Integer): boolean;
begin
  Result := Fcompany_Specified;
end;

procedure customerAddressEntityItem.Setcountry_id(Index: Integer; const Astring: string);
begin
  Fcountry_id := Astring;
  Fcountry_id_Specified := True;
end;

function customerAddressEntityItem.country_id_Specified(Index: Integer): boolean;
begin
  Result := Fcountry_id_Specified;
end;

procedure customerAddressEntityItem.Setfax(Index: Integer; const Astring: string);
begin
  Ffax := Astring;
  Ffax_Specified := True;
end;

function customerAddressEntityItem.fax_Specified(Index: Integer): boolean;
begin
  Result := Ffax_Specified;
end;

procedure customerAddressEntityItem.Setfirstname(Index: Integer; const Astring: string);
begin
  Ffirstname := Astring;
  Ffirstname_Specified := True;
end;

function customerAddressEntityItem.firstname_Specified(Index: Integer): boolean;
begin
  Result := Ffirstname_Specified;
end;

procedure customerAddressEntityItem.Setlastname(Index: Integer; const Astring: string);
begin
  Flastname := Astring;
  Flastname_Specified := True;
end;

function customerAddressEntityItem.lastname_Specified(Index: Integer): boolean;
begin
  Result := Flastname_Specified;
end;

procedure customerAddressEntityItem.Setmiddlename(Index: Integer; const Astring: string);
begin
  Fmiddlename := Astring;
  Fmiddlename_Specified := True;
end;

function customerAddressEntityItem.middlename_Specified(Index: Integer): boolean;
begin
  Result := Fmiddlename_Specified;
end;

procedure customerAddressEntityItem.Setpostcode(Index: Integer; const Astring: string);
begin
  Fpostcode := Astring;
  Fpostcode_Specified := True;
end;

function customerAddressEntityItem.postcode_Specified(Index: Integer): boolean;
begin
  Result := Fpostcode_Specified;
end;

procedure customerAddressEntityItem.Setprefix(Index: Integer; const Astring: string);
begin
  Fprefix := Astring;
  Fprefix_Specified := True;
end;

function customerAddressEntityItem.prefix_Specified(Index: Integer): boolean;
begin
  Result := Fprefix_Specified;
end;

procedure customerAddressEntityItem.Setregion(Index: Integer; const Astring: string);
begin
  Fregion := Astring;
  Fregion_Specified := True;
end;

function customerAddressEntityItem.region_Specified(Index: Integer): boolean;
begin
  Result := Fregion_Specified;
end;

procedure customerAddressEntityItem.Setregion_id(Index: Integer; const AInteger: Integer);
begin
  Fregion_id := AInteger;
  Fregion_id_Specified := True;
end;

function customerAddressEntityItem.region_id_Specified(Index: Integer): boolean;
begin
  Result := Fregion_id_Specified;
end;

procedure customerAddressEntityItem.Setstreet(Index: Integer; const Astring: string);
begin
  Fstreet := Astring;
  Fstreet_Specified := True;
end;

function customerAddressEntityItem.street_Specified(Index: Integer): boolean;
begin
  Result := Fstreet_Specified;
end;

procedure customerAddressEntityItem.Setsuffix(Index: Integer; const Astring: string);
begin
  Fsuffix := Astring;
  Fsuffix_Specified := True;
end;

function customerAddressEntityItem.suffix_Specified(Index: Integer): boolean;
begin
  Result := Fsuffix_Specified;
end;

procedure customerAddressEntityItem.Settelephone(Index: Integer; const Astring: string);
begin
  Ftelephone := Astring;
  Ftelephone_Specified := True;
end;

function customerAddressEntityItem.telephone_Specified(Index: Integer): boolean;
begin
  Result := Ftelephone_Specified;
end;

procedure customerAddressEntityItem.Setis_default_billing(Index: Integer; const ABoolean: Boolean);
begin
  Fis_default_billing := ABoolean;
  Fis_default_billing_Specified := True;
end;

function customerAddressEntityItem.is_default_billing_Specified(Index: Integer): boolean;
begin
  Result := Fis_default_billing_Specified;
end;

procedure customerAddressEntityItem.Setis_default_shipping(Index: Integer; const ABoolean: Boolean);
begin
  Fis_default_shipping := ABoolean;
  Fis_default_shipping_Specified := True;
end;

function customerAddressEntityItem.is_default_shipping_Specified(Index: Integer): boolean;
begin
  Result := Fis_default_shipping_Specified;
end;

procedure giftMessageResponse.SetentityId(Index: Integer; const Astring: string);
begin
  FentityId := Astring;
  FentityId_Specified := True;
end;

function giftMessageResponse.entityId_Specified(Index: Integer): boolean;
begin
  Result := FentityId_Specified;
end;

procedure giftMessageResponse.Setresult(Index: Integer; const ABoolean: Boolean);
begin
  Fresult := ABoolean;
  Fresult_Specified := True;
end;

function giftMessageResponse.result_Specified(Index: Integer): boolean;
begin
  Result := Fresult_Specified;
end;

procedure giftMessageResponse.Seterror(Index: Integer; const Astring: string);
begin
  Ferror := Astring;
  Ferror_Specified := True;
end;

function giftMessageResponse.error_Specified(Index: Integer): boolean;
begin
  Result := Ferror_Specified;
end;

procedure boolean_2.Setid(Index: Integer; const Astring: string);
begin
  Fid := Astring;
  Fid_Specified := True;
end;

function boolean_2.id_Specified(Index: Integer): boolean;
begin
  Result := Fid_Specified;
end;

procedure boolean_2.Sethref(Index: Integer; const Astring: string);
begin
  Fhref := Astring;
  Fhref_Specified := True;
end;

function boolean_2.href_Specified(Index: Integer): boolean;
begin
  Result := Fhref_Specified;
end;

procedure anyURI2.Setid(Index: Integer; const Astring: string);
begin
  Fid := Astring;
  Fid_Specified := True;
end;

function anyURI2.id_Specified(Index: Integer): boolean;
begin
  Result := Fid_Specified;
end;

procedure anyURI2.Sethref(Index: Integer; const Astring: string);
begin
  Fhref := Astring;
  Fhref_Specified := True;
end;

function anyURI2.href_Specified(Index: Integer): boolean;
begin
  Result := Fhref_Specified;
end;

procedure double_2.Setid(Index: Integer; const Astring: string);
begin
  Fid := Astring;
  Fid_Specified := True;
end;

function double_2.id_Specified(Index: Integer): boolean;
begin
  Result := Fid_Specified;
end;

procedure double_2.Sethref(Index: Integer; const Astring: string);
begin
  Fhref := Astring;
  Fhref_Specified := True;
end;

function double_2.href_Specified(Index: Integer): boolean;
begin
  Result := Fhref_Specified;
end;

procedure shoppingCartShippingMethodEntity.Setcode(Index: Integer; const Astring: string);
begin
  Fcode := Astring;
  Fcode_Specified := True;
end;

function shoppingCartShippingMethodEntity.code_Specified(Index: Integer): boolean;
begin
  Result := Fcode_Specified;
end;

procedure shoppingCartShippingMethodEntity.Setcarrier(Index: Integer; const Astring: string);
begin
  Fcarrier := Astring;
  Fcarrier_Specified := True;
end;

function shoppingCartShippingMethodEntity.carrier_Specified(Index: Integer): boolean;
begin
  Result := Fcarrier_Specified;
end;

procedure shoppingCartShippingMethodEntity.Setcarrier_title(Index: Integer; const Astring: string);
begin
  Fcarrier_title := Astring;
  Fcarrier_title_Specified := True;
end;

function shoppingCartShippingMethodEntity.carrier_title_Specified(Index: Integer): boolean;
begin
  Result := Fcarrier_title_Specified;
end;

procedure shoppingCartShippingMethodEntity.Setmethod(Index: Integer; const Astring: string);
begin
  Fmethod := Astring;
  Fmethod_Specified := True;
end;

function shoppingCartShippingMethodEntity.method_Specified(Index: Integer): boolean;
begin
  Result := Fmethod_Specified;
end;

procedure shoppingCartShippingMethodEntity.Setmethod_title(Index: Integer; const Astring: string);
begin
  Fmethod_title := Astring;
  Fmethod_title_Specified := True;
end;

function shoppingCartShippingMethodEntity.method_title_Specified(Index: Integer): boolean;
begin
  Result := Fmethod_title_Specified;
end;

procedure shoppingCartShippingMethodEntity.Setmethod_description(Index: Integer; const Astring: string);
begin
  Fmethod_description := Astring;
  Fmethod_description_Specified := True;
end;

function shoppingCartShippingMethodEntity.method_description_Specified(Index: Integer): boolean;
begin
  Result := Fmethod_description_Specified;
end;

procedure shoppingCartShippingMethodEntity.Setprice(Index: Integer; const ADouble: Double);
begin
  Fprice := ADouble;
  Fprice_Specified := True;
end;

function shoppingCartShippingMethodEntity.price_Specified(Index: Integer): boolean;
begin
  Result := Fprice_Specified;
end;

procedure shoppingCartAddressEntity.Setaddress_id(Index: Integer; const Astring: string);
begin
  Faddress_id := Astring;
  Faddress_id_Specified := True;
end;

function shoppingCartAddressEntity.address_id_Specified(Index: Integer): boolean;
begin
  Result := Faddress_id_Specified;
end;

procedure shoppingCartAddressEntity.Setcreated_at(Index: Integer; const Astring: string);
begin
  Fcreated_at := Astring;
  Fcreated_at_Specified := True;
end;

function shoppingCartAddressEntity.created_at_Specified(Index: Integer): boolean;
begin
  Result := Fcreated_at_Specified;
end;

procedure shoppingCartAddressEntity.Setupdated_at(Index: Integer; const Astring: string);
begin
  Fupdated_at := Astring;
  Fupdated_at_Specified := True;
end;

function shoppingCartAddressEntity.updated_at_Specified(Index: Integer): boolean;
begin
  Result := Fupdated_at_Specified;
end;

procedure shoppingCartAddressEntity.Setcustomer_id(Index: Integer; const Astring: string);
begin
  Fcustomer_id := Astring;
  Fcustomer_id_Specified := True;
end;

function shoppingCartAddressEntity.customer_id_Specified(Index: Integer): boolean;
begin
  Result := Fcustomer_id_Specified;
end;

procedure shoppingCartAddressEntity.Setsave_in_address_book(Index: Integer; const AInteger: Integer);
begin
  Fsave_in_address_book := AInteger;
  Fsave_in_address_book_Specified := True;
end;

function shoppingCartAddressEntity.save_in_address_book_Specified(Index: Integer): boolean;
begin
  Result := Fsave_in_address_book_Specified;
end;

procedure shoppingCartAddressEntity.Setcustomer_address_id(Index: Integer; const Astring: string);
begin
  Fcustomer_address_id := Astring;
  Fcustomer_address_id_Specified := True;
end;

function shoppingCartAddressEntity.customer_address_id_Specified(Index: Integer): boolean;
begin
  Result := Fcustomer_address_id_Specified;
end;

procedure shoppingCartAddressEntity.Setaddress_type(Index: Integer; const Astring: string);
begin
  Faddress_type := Astring;
  Faddress_type_Specified := True;
end;

function shoppingCartAddressEntity.address_type_Specified(Index: Integer): boolean;
begin
  Result := Faddress_type_Specified;
end;

procedure shoppingCartAddressEntity.Setemail(Index: Integer; const Astring: string);
begin
  Femail := Astring;
  Femail_Specified := True;
end;

function shoppingCartAddressEntity.email_Specified(Index: Integer): boolean;
begin
  Result := Femail_Specified;
end;

procedure shoppingCartAddressEntity.Setprefix(Index: Integer; const Astring: string);
begin
  Fprefix := Astring;
  Fprefix_Specified := True;
end;

function shoppingCartAddressEntity.prefix_Specified(Index: Integer): boolean;
begin
  Result := Fprefix_Specified;
end;

procedure shoppingCartAddressEntity.Setfirstname(Index: Integer; const Astring: string);
begin
  Ffirstname := Astring;
  Ffirstname_Specified := True;
end;

function shoppingCartAddressEntity.firstname_Specified(Index: Integer): boolean;
begin
  Result := Ffirstname_Specified;
end;

procedure shoppingCartAddressEntity.Setmiddlename(Index: Integer; const Astring: string);
begin
  Fmiddlename := Astring;
  Fmiddlename_Specified := True;
end;

function shoppingCartAddressEntity.middlename_Specified(Index: Integer): boolean;
begin
  Result := Fmiddlename_Specified;
end;

procedure shoppingCartAddressEntity.Setlastname(Index: Integer; const Astring: string);
begin
  Flastname := Astring;
  Flastname_Specified := True;
end;

function shoppingCartAddressEntity.lastname_Specified(Index: Integer): boolean;
begin
  Result := Flastname_Specified;
end;

procedure shoppingCartAddressEntity.Setsuffix(Index: Integer; const Astring: string);
begin
  Fsuffix := Astring;
  Fsuffix_Specified := True;
end;

function shoppingCartAddressEntity.suffix_Specified(Index: Integer): boolean;
begin
  Result := Fsuffix_Specified;
end;

procedure shoppingCartAddressEntity.Setcompany(Index: Integer; const Astring: string);
begin
  Fcompany := Astring;
  Fcompany_Specified := True;
end;

function shoppingCartAddressEntity.company_Specified(Index: Integer): boolean;
begin
  Result := Fcompany_Specified;
end;

procedure shoppingCartAddressEntity.Setstreet(Index: Integer; const Astring: string);
begin
  Fstreet := Astring;
  Fstreet_Specified := True;
end;

function shoppingCartAddressEntity.street_Specified(Index: Integer): boolean;
begin
  Result := Fstreet_Specified;
end;

procedure shoppingCartAddressEntity.Setcity(Index: Integer; const Astring: string);
begin
  Fcity := Astring;
  Fcity_Specified := True;
end;

function shoppingCartAddressEntity.city_Specified(Index: Integer): boolean;
begin
  Result := Fcity_Specified;
end;

procedure shoppingCartAddressEntity.Setregion(Index: Integer; const Astring: string);
begin
  Fregion := Astring;
  Fregion_Specified := True;
end;

function shoppingCartAddressEntity.region_Specified(Index: Integer): boolean;
begin
  Result := Fregion_Specified;
end;

procedure shoppingCartAddressEntity.Setregion_id(Index: Integer; const Astring: string);
begin
  Fregion_id := Astring;
  Fregion_id_Specified := True;
end;

function shoppingCartAddressEntity.region_id_Specified(Index: Integer): boolean;
begin
  Result := Fregion_id_Specified;
end;

procedure shoppingCartAddressEntity.Setpostcode(Index: Integer; const Astring: string);
begin
  Fpostcode := Astring;
  Fpostcode_Specified := True;
end;

function shoppingCartAddressEntity.postcode_Specified(Index: Integer): boolean;
begin
  Result := Fpostcode_Specified;
end;

procedure shoppingCartAddressEntity.Setcountry_id(Index: Integer; const Astring: string);
begin
  Fcountry_id := Astring;
  Fcountry_id_Specified := True;
end;

function shoppingCartAddressEntity.country_id_Specified(Index: Integer): boolean;
begin
  Result := Fcountry_id_Specified;
end;

procedure shoppingCartAddressEntity.Settelephone(Index: Integer; const Astring: string);
begin
  Ftelephone := Astring;
  Ftelephone_Specified := True;
end;

function shoppingCartAddressEntity.telephone_Specified(Index: Integer): boolean;
begin
  Result := Ftelephone_Specified;
end;

procedure shoppingCartAddressEntity.Setfax(Index: Integer; const Astring: string);
begin
  Ffax := Astring;
  Ffax_Specified := True;
end;

function shoppingCartAddressEntity.fax_Specified(Index: Integer): boolean;
begin
  Result := Ffax_Specified;
end;

procedure shoppingCartAddressEntity.Setsame_as_billing(Index: Integer; const AInteger: Integer);
begin
  Fsame_as_billing := AInteger;
  Fsame_as_billing_Specified := True;
end;

function shoppingCartAddressEntity.same_as_billing_Specified(Index: Integer): boolean;
begin
  Result := Fsame_as_billing_Specified;
end;

procedure shoppingCartAddressEntity.Setfree_shipping(Index: Integer; const AInteger: Integer);
begin
  Ffree_shipping := AInteger;
  Ffree_shipping_Specified := True;
end;

function shoppingCartAddressEntity.free_shipping_Specified(Index: Integer): boolean;
begin
  Result := Ffree_shipping_Specified;
end;

procedure shoppingCartAddressEntity.Setshipping_method(Index: Integer; const Astring: string);
begin
  Fshipping_method := Astring;
  Fshipping_method_Specified := True;
end;

function shoppingCartAddressEntity.shipping_method_Specified(Index: Integer): boolean;
begin
  Result := Fshipping_method_Specified;
end;

procedure shoppingCartAddressEntity.Setshipping_description(Index: Integer; const Astring: string);
begin
  Fshipping_description := Astring;
  Fshipping_description_Specified := True;
end;

function shoppingCartAddressEntity.shipping_description_Specified(Index: Integer): boolean;
begin
  Result := Fshipping_description_Specified;
end;

procedure shoppingCartAddressEntity.Setweight(Index: Integer; const ADouble: Double);
begin
  Fweight := ADouble;
  Fweight_Specified := True;
end;

function shoppingCartAddressEntity.weight_Specified(Index: Integer): boolean;
begin
  Result := Fweight_Specified;
end;

destructor salesOrderCreditmemoData.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Fqtys)-1 do
    SysUtils.FreeAndNil(Fqtys[I]);
  System.SetLength(Fqtys, 0);
  inherited Destroy;
end;

procedure salesOrderCreditmemoData.Setqtys(Index: Integer; const AorderItemIdQtyArray: orderItemIdQtyArray);
begin
  Fqtys := AorderItemIdQtyArray;
  Fqtys_Specified := True;
end;

function salesOrderCreditmemoData.qtys_Specified(Index: Integer): boolean;
begin
  Result := Fqtys_Specified;
end;

procedure salesOrderCreditmemoData.Setshipping_amount(Index: Integer; const ADouble: Double);
begin
  Fshipping_amount := ADouble;
  Fshipping_amount_Specified := True;
end;

function salesOrderCreditmemoData.shipping_amount_Specified(Index: Integer): boolean;
begin
  Result := Fshipping_amount_Specified;
end;

procedure salesOrderCreditmemoData.Setadjustment_positive(Index: Integer; const ADouble: Double);
begin
  Fadjustment_positive := ADouble;
  Fadjustment_positive_Specified := True;
end;

function salesOrderCreditmemoData.adjustment_positive_Specified(Index: Integer): boolean;
begin
  Result := Fadjustment_positive_Specified;
end;

procedure salesOrderCreditmemoData.Setadjustment_negative(Index: Integer; const ADouble: Double);
begin
  Fadjustment_negative := ADouble;
  Fadjustment_negative_Specified := True;
end;

function salesOrderCreditmemoData.adjustment_negative_Specified(Index: Integer): boolean;
begin
  Result := Fadjustment_negative_Specified;
end;

procedure shoppingCartItemEntity.Setitem_id(Index: Integer; const Astring: string);
begin
  Fitem_id := Astring;
  Fitem_id_Specified := True;
end;

function shoppingCartItemEntity.item_id_Specified(Index: Integer): boolean;
begin
  Result := Fitem_id_Specified;
end;

procedure shoppingCartItemEntity.Setcreated_at(Index: Integer; const Astring: string);
begin
  Fcreated_at := Astring;
  Fcreated_at_Specified := True;
end;

function shoppingCartItemEntity.created_at_Specified(Index: Integer): boolean;
begin
  Result := Fcreated_at_Specified;
end;

procedure shoppingCartItemEntity.Setupdated_at(Index: Integer; const Astring: string);
begin
  Fupdated_at := Astring;
  Fupdated_at_Specified := True;
end;

function shoppingCartItemEntity.updated_at_Specified(Index: Integer): boolean;
begin
  Result := Fupdated_at_Specified;
end;

procedure shoppingCartItemEntity.Setproduct_id(Index: Integer; const Astring: string);
begin
  Fproduct_id := Astring;
  Fproduct_id_Specified := True;
end;

function shoppingCartItemEntity.product_id_Specified(Index: Integer): boolean;
begin
  Result := Fproduct_id_Specified;
end;

procedure shoppingCartItemEntity.Setstore_id(Index: Integer; const Astring: string);
begin
  Fstore_id := Astring;
  Fstore_id_Specified := True;
end;

function shoppingCartItemEntity.store_id_Specified(Index: Integer): boolean;
begin
  Result := Fstore_id_Specified;
end;

procedure shoppingCartItemEntity.Setparent_item_id(Index: Integer; const Astring: string);
begin
  Fparent_item_id := Astring;
  Fparent_item_id_Specified := True;
end;

function shoppingCartItemEntity.parent_item_id_Specified(Index: Integer): boolean;
begin
  Result := Fparent_item_id_Specified;
end;

procedure shoppingCartItemEntity.Setis_virtual(Index: Integer; const AInteger: Integer);
begin
  Fis_virtual := AInteger;
  Fis_virtual_Specified := True;
end;

function shoppingCartItemEntity.is_virtual_Specified(Index: Integer): boolean;
begin
  Result := Fis_virtual_Specified;
end;

procedure shoppingCartItemEntity.Setsku(Index: Integer; const Astring: string);
begin
  Fsku := Astring;
  Fsku_Specified := True;
end;

function shoppingCartItemEntity.sku_Specified(Index: Integer): boolean;
begin
  Result := Fsku_Specified;
end;

procedure shoppingCartItemEntity.Setname_(Index: Integer; const Astring: string);
begin
  Fname_ := Astring;
  Fname__Specified := True;
end;

function shoppingCartItemEntity.name__Specified(Index: Integer): boolean;
begin
  Result := Fname__Specified;
end;

procedure shoppingCartItemEntity.Setdescription(Index: Integer; const Astring: string);
begin
  Fdescription := Astring;
  Fdescription_Specified := True;
end;

function shoppingCartItemEntity.description_Specified(Index: Integer): boolean;
begin
  Result := Fdescription_Specified;
end;

procedure shoppingCartItemEntity.Setapplied_rule_ids(Index: Integer; const Astring: string);
begin
  Fapplied_rule_ids := Astring;
  Fapplied_rule_ids_Specified := True;
end;

function shoppingCartItemEntity.applied_rule_ids_Specified(Index: Integer): boolean;
begin
  Result := Fapplied_rule_ids_Specified;
end;

procedure shoppingCartItemEntity.Setadditional_data(Index: Integer; const Astring: string);
begin
  Fadditional_data := Astring;
  Fadditional_data_Specified := True;
end;

function shoppingCartItemEntity.additional_data_Specified(Index: Integer): boolean;
begin
  Result := Fadditional_data_Specified;
end;

procedure shoppingCartItemEntity.Setfree_shipping(Index: Integer; const Astring: string);
begin
  Ffree_shipping := Astring;
  Ffree_shipping_Specified := True;
end;

function shoppingCartItemEntity.free_shipping_Specified(Index: Integer): boolean;
begin
  Result := Ffree_shipping_Specified;
end;

procedure shoppingCartItemEntity.Setis_qty_decimal(Index: Integer; const Astring: string);
begin
  Fis_qty_decimal := Astring;
  Fis_qty_decimal_Specified := True;
end;

function shoppingCartItemEntity.is_qty_decimal_Specified(Index: Integer): boolean;
begin
  Result := Fis_qty_decimal_Specified;
end;

procedure shoppingCartItemEntity.Setno_discount(Index: Integer; const Astring: string);
begin
  Fno_discount := Astring;
  Fno_discount_Specified := True;
end;

function shoppingCartItemEntity.no_discount_Specified(Index: Integer): boolean;
begin
  Result := Fno_discount_Specified;
end;

procedure shoppingCartItemEntity.Setweight(Index: Integer; const ADouble: Double);
begin
  Fweight := ADouble;
  Fweight_Specified := True;
end;

function shoppingCartItemEntity.weight_Specified(Index: Integer): boolean;
begin
  Result := Fweight_Specified;
end;

procedure shoppingCartItemEntity.Setqty(Index: Integer; const ADouble: Double);
begin
  Fqty := ADouble;
  Fqty_Specified := True;
end;

function shoppingCartItemEntity.qty_Specified(Index: Integer): boolean;
begin
  Result := Fqty_Specified;
end;

procedure shoppingCartItemEntity.Setprice(Index: Integer; const ADouble: Double);
begin
  Fprice := ADouble;
  Fprice_Specified := True;
end;

function shoppingCartItemEntity.price_Specified(Index: Integer): boolean;
begin
  Result := Fprice_Specified;
end;

procedure shoppingCartItemEntity.Setbase_price(Index: Integer; const ADouble: Double);
begin
  Fbase_price := ADouble;
  Fbase_price_Specified := True;
end;

function shoppingCartItemEntity.base_price_Specified(Index: Integer): boolean;
begin
  Result := Fbase_price_Specified;
end;

procedure shoppingCartItemEntity.Setcustom_price(Index: Integer; const ADouble: Double);
begin
  Fcustom_price := ADouble;
  Fcustom_price_Specified := True;
end;

function shoppingCartItemEntity.custom_price_Specified(Index: Integer): boolean;
begin
  Result := Fcustom_price_Specified;
end;

procedure shoppingCartItemEntity.Setdiscount_percent(Index: Integer; const ADouble: Double);
begin
  Fdiscount_percent := ADouble;
  Fdiscount_percent_Specified := True;
end;

function shoppingCartItemEntity.discount_percent_Specified(Index: Integer): boolean;
begin
  Result := Fdiscount_percent_Specified;
end;

procedure shoppingCartItemEntity.Setdiscount_amount(Index: Integer; const ADouble: Double);
begin
  Fdiscount_amount := ADouble;
  Fdiscount_amount_Specified := True;
end;

function shoppingCartItemEntity.discount_amount_Specified(Index: Integer): boolean;
begin
  Result := Fdiscount_amount_Specified;
end;

procedure shoppingCartItemEntity.Setbase_discount_amount(Index: Integer; const ADouble: Double);
begin
  Fbase_discount_amount := ADouble;
  Fbase_discount_amount_Specified := True;
end;

function shoppingCartItemEntity.base_discount_amount_Specified(Index: Integer): boolean;
begin
  Result := Fbase_discount_amount_Specified;
end;

procedure shoppingCartItemEntity.Settax_percent(Index: Integer; const ADouble: Double);
begin
  Ftax_percent := ADouble;
  Ftax_percent_Specified := True;
end;

function shoppingCartItemEntity.tax_percent_Specified(Index: Integer): boolean;
begin
  Result := Ftax_percent_Specified;
end;

procedure shoppingCartItemEntity.Settax_amount(Index: Integer; const ADouble: Double);
begin
  Ftax_amount := ADouble;
  Ftax_amount_Specified := True;
end;

function shoppingCartItemEntity.tax_amount_Specified(Index: Integer): boolean;
begin
  Result := Ftax_amount_Specified;
end;

procedure shoppingCartItemEntity.Setbase_tax_amount(Index: Integer; const ADouble: Double);
begin
  Fbase_tax_amount := ADouble;
  Fbase_tax_amount_Specified := True;
end;

function shoppingCartItemEntity.base_tax_amount_Specified(Index: Integer): boolean;
begin
  Result := Fbase_tax_amount_Specified;
end;

procedure shoppingCartItemEntity.Setrow_total(Index: Integer; const ADouble: Double);
begin
  Frow_total := ADouble;
  Frow_total_Specified := True;
end;

function shoppingCartItemEntity.row_total_Specified(Index: Integer): boolean;
begin
  Result := Frow_total_Specified;
end;

procedure shoppingCartItemEntity.Setbase_row_total(Index: Integer; const ADouble: Double);
begin
  Fbase_row_total := ADouble;
  Fbase_row_total_Specified := True;
end;

function shoppingCartItemEntity.base_row_total_Specified(Index: Integer): boolean;
begin
  Result := Fbase_row_total_Specified;
end;

procedure shoppingCartItemEntity.Setrow_total_with_discount(Index: Integer; const ADouble: Double);
begin
  Frow_total_with_discount := ADouble;
  Frow_total_with_discount_Specified := True;
end;

function shoppingCartItemEntity.row_total_with_discount_Specified(Index: Integer): boolean;
begin
  Result := Frow_total_with_discount_Specified;
end;

procedure shoppingCartItemEntity.Setrow_weight(Index: Integer; const ADouble: Double);
begin
  Frow_weight := ADouble;
  Frow_weight_Specified := True;
end;

function shoppingCartItemEntity.row_weight_Specified(Index: Integer): boolean;
begin
  Result := Frow_weight_Specified;
end;

procedure shoppingCartItemEntity.Setproduct_type(Index: Integer; const Astring: string);
begin
  Fproduct_type := Astring;
  Fproduct_type_Specified := True;
end;

function shoppingCartItemEntity.product_type_Specified(Index: Integer): boolean;
begin
  Result := Fproduct_type_Specified;
end;

procedure shoppingCartItemEntity.Setbase_tax_before_discount(Index: Integer; const ADouble: Double);
begin
  Fbase_tax_before_discount := ADouble;
  Fbase_tax_before_discount_Specified := True;
end;

function shoppingCartItemEntity.base_tax_before_discount_Specified(Index: Integer): boolean;
begin
  Result := Fbase_tax_before_discount_Specified;
end;

procedure shoppingCartItemEntity.Settax_before_discount(Index: Integer; const ADouble: Double);
begin
  Ftax_before_discount := ADouble;
  Ftax_before_discount_Specified := True;
end;

function shoppingCartItemEntity.tax_before_discount_Specified(Index: Integer): boolean;
begin
  Result := Ftax_before_discount_Specified;
end;

procedure shoppingCartItemEntity.Setoriginal_custom_price(Index: Integer; const ADouble: Double);
begin
  Foriginal_custom_price := ADouble;
  Foriginal_custom_price_Specified := True;
end;

function shoppingCartItemEntity.original_custom_price_Specified(Index: Integer): boolean;
begin
  Result := Foriginal_custom_price_Specified;
end;

procedure shoppingCartItemEntity.Setbase_cost(Index: Integer; const ADouble: Double);
begin
  Fbase_cost := ADouble;
  Fbase_cost_Specified := True;
end;

function shoppingCartItemEntity.base_cost_Specified(Index: Integer): boolean;
begin
  Result := Fbase_cost_Specified;
end;

procedure shoppingCartItemEntity.Setprice_incl_tax(Index: Integer; const ADouble: Double);
begin
  Fprice_incl_tax := ADouble;
  Fprice_incl_tax_Specified := True;
end;

function shoppingCartItemEntity.price_incl_tax_Specified(Index: Integer): boolean;
begin
  Result := Fprice_incl_tax_Specified;
end;

procedure shoppingCartItemEntity.Setbase_price_incl_tax(Index: Integer; const ADouble: Double);
begin
  Fbase_price_incl_tax := ADouble;
  Fbase_price_incl_tax_Specified := True;
end;

function shoppingCartItemEntity.base_price_incl_tax_Specified(Index: Integer): boolean;
begin
  Result := Fbase_price_incl_tax_Specified;
end;

procedure shoppingCartItemEntity.Setrow_total_incl_tax(Index: Integer; const ADouble: Double);
begin
  Frow_total_incl_tax := ADouble;
  Frow_total_incl_tax_Specified := True;
end;

function shoppingCartItemEntity.row_total_incl_tax_Specified(Index: Integer): boolean;
begin
  Result := Frow_total_incl_tax_Specified;
end;

procedure shoppingCartItemEntity.Setbase_row_total_incl_tax(Index: Integer; const ADouble: Double);
begin
  Fbase_row_total_incl_tax := ADouble;
  Fbase_row_total_incl_tax_Specified := True;
end;

function shoppingCartItemEntity.base_row_total_incl_tax_Specified(Index: Integer): boolean;
begin
  Result := Fbase_row_total_incl_tax_Specified;
end;

procedure shoppingCartItemEntity.Setgift_message_id(Index: Integer; const Astring: string);
begin
  Fgift_message_id := Astring;
  Fgift_message_id_Specified := True;
end;

function shoppingCartItemEntity.gift_message_id_Specified(Index: Integer): boolean;
begin
  Result := Fgift_message_id_Specified;
end;

procedure shoppingCartItemEntity.Setgift_message(Index: Integer; const Astring: string);
begin
  Fgift_message := Astring;
  Fgift_message_Specified := True;
end;

function shoppingCartItemEntity.gift_message_Specified(Index: Integer): boolean;
begin
  Result := Fgift_message_Specified;
end;

procedure shoppingCartItemEntity.Setgift_message_available(Index: Integer; const Astring: string);
begin
  Fgift_message_available := Astring;
  Fgift_message_available_Specified := True;
end;

function shoppingCartItemEntity.gift_message_available_Specified(Index: Integer): boolean;
begin
  Result := Fgift_message_available_Specified;
end;

procedure shoppingCartItemEntity.Setweee_tax_applied(Index: Integer; const ADouble: Double);
begin
  Fweee_tax_applied := ADouble;
  Fweee_tax_applied_Specified := True;
end;

function shoppingCartItemEntity.weee_tax_applied_Specified(Index: Integer): boolean;
begin
  Result := Fweee_tax_applied_Specified;
end;

procedure shoppingCartItemEntity.Setweee_tax_applied_amount(Index: Integer; const ADouble: Double);
begin
  Fweee_tax_applied_amount := ADouble;
  Fweee_tax_applied_amount_Specified := True;
end;

function shoppingCartItemEntity.weee_tax_applied_amount_Specified(Index: Integer): boolean;
begin
  Result := Fweee_tax_applied_amount_Specified;
end;

procedure shoppingCartItemEntity.Setweee_tax_applied_row_amount(Index: Integer; const ADouble: Double);
begin
  Fweee_tax_applied_row_amount := ADouble;
  Fweee_tax_applied_row_amount_Specified := True;
end;

function shoppingCartItemEntity.weee_tax_applied_row_amount_Specified(Index: Integer): boolean;
begin
  Result := Fweee_tax_applied_row_amount_Specified;
end;

procedure shoppingCartItemEntity.Setbase_weee_tax_applied_amount(Index: Integer; const ADouble: Double);
begin
  Fbase_weee_tax_applied_amount := ADouble;
  Fbase_weee_tax_applied_amount_Specified := True;
end;

function shoppingCartItemEntity.base_weee_tax_applied_amount_Specified(Index: Integer): boolean;
begin
  Result := Fbase_weee_tax_applied_amount_Specified;
end;

procedure shoppingCartItemEntity.Setbase_weee_tax_applied_row_amount(Index: Integer; const ADouble: Double);
begin
  Fbase_weee_tax_applied_row_amount := ADouble;
  Fbase_weee_tax_applied_row_amount_Specified := True;
end;

function shoppingCartItemEntity.base_weee_tax_applied_row_amount_Specified(Index: Integer): boolean;
begin
  Result := Fbase_weee_tax_applied_row_amount_Specified;
end;

procedure shoppingCartItemEntity.Setweee_tax_disposition(Index: Integer; const ADouble: Double);
begin
  Fweee_tax_disposition := ADouble;
  Fweee_tax_disposition_Specified := True;
end;

function shoppingCartItemEntity.weee_tax_disposition_Specified(Index: Integer): boolean;
begin
  Result := Fweee_tax_disposition_Specified;
end;

procedure shoppingCartItemEntity.Setweee_tax_row_disposition(Index: Integer; const ADouble: Double);
begin
  Fweee_tax_row_disposition := ADouble;
  Fweee_tax_row_disposition_Specified := True;
end;

function shoppingCartItemEntity.weee_tax_row_disposition_Specified(Index: Integer): boolean;
begin
  Result := Fweee_tax_row_disposition_Specified;
end;

procedure shoppingCartItemEntity.Setbase_weee_tax_disposition(Index: Integer; const ADouble: Double);
begin
  Fbase_weee_tax_disposition := ADouble;
  Fbase_weee_tax_disposition_Specified := True;
end;

function shoppingCartItemEntity.base_weee_tax_disposition_Specified(Index: Integer): boolean;
begin
  Result := Fbase_weee_tax_disposition_Specified;
end;

procedure shoppingCartItemEntity.Setbase_weee_tax_row_disposition(Index: Integer; const ADouble: Double);
begin
  Fbase_weee_tax_row_disposition := ADouble;
  Fbase_weee_tax_row_disposition_Specified := True;
end;

function shoppingCartItemEntity.base_weee_tax_row_disposition_Specified(Index: Integer): boolean;
begin
  Result := Fbase_weee_tax_row_disposition_Specified;
end;

procedure shoppingCartItemEntity.Settax_class_id(Index: Integer; const Astring: string);
begin
  Ftax_class_id := Astring;
  Ftax_class_id_Specified := True;
end;

function shoppingCartItemEntity.tax_class_id_Specified(Index: Integer): boolean;
begin
  Result := Ftax_class_id_Specified;
end;

procedure shoppingCartTotalsEntity.Settitle(Index: Integer; const Astring: string);
begin
  Ftitle := Astring;
  Ftitle_Specified := True;
end;

function shoppingCartTotalsEntity.title_Specified(Index: Integer): boolean;
begin
  Result := Ftitle_Specified;
end;

procedure shoppingCartTotalsEntity.Setamount(Index: Integer; const ADouble: Double);
begin
  Famount := ADouble;
  Famount_Specified := True;
end;

function shoppingCartTotalsEntity.amount_Specified(Index: Integer): boolean;
begin
  Result := Famount_Specified;
end;

destructor shoppingCartInfoEntity.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Fitems)-1 do
    SysUtils.FreeAndNil(Fitems[I]);
  System.SetLength(Fitems, 0);
  SysUtils.FreeAndNil(Fshipping_address);
  SysUtils.FreeAndNil(Fbilling_address);
  SysUtils.FreeAndNil(Fpayment);
  inherited Destroy;
end;

procedure shoppingCartInfoEntity.Setstore_id(Index: Integer; const Astring: string);
begin
  Fstore_id := Astring;
  Fstore_id_Specified := True;
end;

function shoppingCartInfoEntity.store_id_Specified(Index: Integer): boolean;
begin
  Result := Fstore_id_Specified;
end;

procedure shoppingCartInfoEntity.Setcreated_at(Index: Integer; const Astring: string);
begin
  Fcreated_at := Astring;
  Fcreated_at_Specified := True;
end;

function shoppingCartInfoEntity.created_at_Specified(Index: Integer): boolean;
begin
  Result := Fcreated_at_Specified;
end;

procedure shoppingCartInfoEntity.Setupdated_at(Index: Integer; const Astring: string);
begin
  Fupdated_at := Astring;
  Fupdated_at_Specified := True;
end;

function shoppingCartInfoEntity.updated_at_Specified(Index: Integer): boolean;
begin
  Result := Fupdated_at_Specified;
end;

procedure shoppingCartInfoEntity.Setconverted_at(Index: Integer; const Astring: string);
begin
  Fconverted_at := Astring;
  Fconverted_at_Specified := True;
end;

function shoppingCartInfoEntity.converted_at_Specified(Index: Integer): boolean;
begin
  Result := Fconverted_at_Specified;
end;

procedure shoppingCartInfoEntity.Setquote_id(Index: Integer; const AInteger: Integer);
begin
  Fquote_id := AInteger;
  Fquote_id_Specified := True;
end;

function shoppingCartInfoEntity.quote_id_Specified(Index: Integer): boolean;
begin
  Result := Fquote_id_Specified;
end;

procedure shoppingCartInfoEntity.Setis_active(Index: Integer; const AInteger: Integer);
begin
  Fis_active := AInteger;
  Fis_active_Specified := True;
end;

function shoppingCartInfoEntity.is_active_Specified(Index: Integer): boolean;
begin
  Result := Fis_active_Specified;
end;

procedure shoppingCartInfoEntity.Setis_virtual(Index: Integer; const AInteger: Integer);
begin
  Fis_virtual := AInteger;
  Fis_virtual_Specified := True;
end;

function shoppingCartInfoEntity.is_virtual_Specified(Index: Integer): boolean;
begin
  Result := Fis_virtual_Specified;
end;

procedure shoppingCartInfoEntity.Setis_multi_shipping(Index: Integer; const AInteger: Integer);
begin
  Fis_multi_shipping := AInteger;
  Fis_multi_shipping_Specified := True;
end;

function shoppingCartInfoEntity.is_multi_shipping_Specified(Index: Integer): boolean;
begin
  Result := Fis_multi_shipping_Specified;
end;

procedure shoppingCartInfoEntity.Setitems_count(Index: Integer; const ADouble: Double);
begin
  Fitems_count := ADouble;
  Fitems_count_Specified := True;
end;

function shoppingCartInfoEntity.items_count_Specified(Index: Integer): boolean;
begin
  Result := Fitems_count_Specified;
end;

procedure shoppingCartInfoEntity.Setitems_qty(Index: Integer; const ADouble: Double);
begin
  Fitems_qty := ADouble;
  Fitems_qty_Specified := True;
end;

function shoppingCartInfoEntity.items_qty_Specified(Index: Integer): boolean;
begin
  Result := Fitems_qty_Specified;
end;

procedure shoppingCartInfoEntity.Setorig_order_id(Index: Integer; const Astring: string);
begin
  Forig_order_id := Astring;
  Forig_order_id_Specified := True;
end;

function shoppingCartInfoEntity.orig_order_id_Specified(Index: Integer): boolean;
begin
  Result := Forig_order_id_Specified;
end;

procedure shoppingCartInfoEntity.Setstore_to_base_rate(Index: Integer; const Astring: string);
begin
  Fstore_to_base_rate := Astring;
  Fstore_to_base_rate_Specified := True;
end;

function shoppingCartInfoEntity.store_to_base_rate_Specified(Index: Integer): boolean;
begin
  Result := Fstore_to_base_rate_Specified;
end;

procedure shoppingCartInfoEntity.Setstore_to_quote_rate(Index: Integer; const Astring: string);
begin
  Fstore_to_quote_rate := Astring;
  Fstore_to_quote_rate_Specified := True;
end;

function shoppingCartInfoEntity.store_to_quote_rate_Specified(Index: Integer): boolean;
begin
  Result := Fstore_to_quote_rate_Specified;
end;

procedure shoppingCartInfoEntity.Setbase_currency_code(Index: Integer; const Astring: string);
begin
  Fbase_currency_code := Astring;
  Fbase_currency_code_Specified := True;
end;

function shoppingCartInfoEntity.base_currency_code_Specified(Index: Integer): boolean;
begin
  Result := Fbase_currency_code_Specified;
end;

procedure shoppingCartInfoEntity.Setstore_currency_code(Index: Integer; const Astring: string);
begin
  Fstore_currency_code := Astring;
  Fstore_currency_code_Specified := True;
end;

function shoppingCartInfoEntity.store_currency_code_Specified(Index: Integer): boolean;
begin
  Result := Fstore_currency_code_Specified;
end;

procedure shoppingCartInfoEntity.Setquote_currency_code(Index: Integer; const Astring: string);
begin
  Fquote_currency_code := Astring;
  Fquote_currency_code_Specified := True;
end;

function shoppingCartInfoEntity.quote_currency_code_Specified(Index: Integer): boolean;
begin
  Result := Fquote_currency_code_Specified;
end;

procedure shoppingCartInfoEntity.Setgrand_total(Index: Integer; const Astring: string);
begin
  Fgrand_total := Astring;
  Fgrand_total_Specified := True;
end;

function shoppingCartInfoEntity.grand_total_Specified(Index: Integer): boolean;
begin
  Result := Fgrand_total_Specified;
end;

procedure shoppingCartInfoEntity.Setbase_grand_total(Index: Integer; const Astring: string);
begin
  Fbase_grand_total := Astring;
  Fbase_grand_total_Specified := True;
end;

function shoppingCartInfoEntity.base_grand_total_Specified(Index: Integer): boolean;
begin
  Result := Fbase_grand_total_Specified;
end;

procedure shoppingCartInfoEntity.Setcheckout_method(Index: Integer; const Astring: string);
begin
  Fcheckout_method := Astring;
  Fcheckout_method_Specified := True;
end;

function shoppingCartInfoEntity.checkout_method_Specified(Index: Integer): boolean;
begin
  Result := Fcheckout_method_Specified;
end;

procedure shoppingCartInfoEntity.Setcustomer_id(Index: Integer; const Astring: string);
begin
  Fcustomer_id := Astring;
  Fcustomer_id_Specified := True;
end;

function shoppingCartInfoEntity.customer_id_Specified(Index: Integer): boolean;
begin
  Result := Fcustomer_id_Specified;
end;

procedure shoppingCartInfoEntity.Setcustomer_tax_class_id(Index: Integer; const Astring: string);
begin
  Fcustomer_tax_class_id := Astring;
  Fcustomer_tax_class_id_Specified := True;
end;

function shoppingCartInfoEntity.customer_tax_class_id_Specified(Index: Integer): boolean;
begin
  Result := Fcustomer_tax_class_id_Specified;
end;

procedure shoppingCartInfoEntity.Setcustomer_group_id(Index: Integer; const AInteger: Integer);
begin
  Fcustomer_group_id := AInteger;
  Fcustomer_group_id_Specified := True;
end;

function shoppingCartInfoEntity.customer_group_id_Specified(Index: Integer): boolean;
begin
  Result := Fcustomer_group_id_Specified;
end;

procedure shoppingCartInfoEntity.Setcustomer_email(Index: Integer; const Astring: string);
begin
  Fcustomer_email := Astring;
  Fcustomer_email_Specified := True;
end;

function shoppingCartInfoEntity.customer_email_Specified(Index: Integer): boolean;
begin
  Result := Fcustomer_email_Specified;
end;

procedure shoppingCartInfoEntity.Setcustomer_prefix(Index: Integer; const Astring: string);
begin
  Fcustomer_prefix := Astring;
  Fcustomer_prefix_Specified := True;
end;

function shoppingCartInfoEntity.customer_prefix_Specified(Index: Integer): boolean;
begin
  Result := Fcustomer_prefix_Specified;
end;

procedure shoppingCartInfoEntity.Setcustomer_firstname(Index: Integer; const Astring: string);
begin
  Fcustomer_firstname := Astring;
  Fcustomer_firstname_Specified := True;
end;

function shoppingCartInfoEntity.customer_firstname_Specified(Index: Integer): boolean;
begin
  Result := Fcustomer_firstname_Specified;
end;

procedure shoppingCartInfoEntity.Setcustomer_middlename(Index: Integer; const Astring: string);
begin
  Fcustomer_middlename := Astring;
  Fcustomer_middlename_Specified := True;
end;

function shoppingCartInfoEntity.customer_middlename_Specified(Index: Integer): boolean;
begin
  Result := Fcustomer_middlename_Specified;
end;

procedure shoppingCartInfoEntity.Setcustomer_lastname(Index: Integer; const Astring: string);
begin
  Fcustomer_lastname := Astring;
  Fcustomer_lastname_Specified := True;
end;

function shoppingCartInfoEntity.customer_lastname_Specified(Index: Integer): boolean;
begin
  Result := Fcustomer_lastname_Specified;
end;

procedure shoppingCartInfoEntity.Setcustomer_suffix(Index: Integer; const Astring: string);
begin
  Fcustomer_suffix := Astring;
  Fcustomer_suffix_Specified := True;
end;

function shoppingCartInfoEntity.customer_suffix_Specified(Index: Integer): boolean;
begin
  Result := Fcustomer_suffix_Specified;
end;

procedure shoppingCartInfoEntity.Setcustomer_note(Index: Integer; const Astring: string);
begin
  Fcustomer_note := Astring;
  Fcustomer_note_Specified := True;
end;

function shoppingCartInfoEntity.customer_note_Specified(Index: Integer): boolean;
begin
  Result := Fcustomer_note_Specified;
end;

procedure shoppingCartInfoEntity.Setcustomer_note_notify(Index: Integer; const Astring: string);
begin
  Fcustomer_note_notify := Astring;
  Fcustomer_note_notify_Specified := True;
end;

function shoppingCartInfoEntity.customer_note_notify_Specified(Index: Integer): boolean;
begin
  Result := Fcustomer_note_notify_Specified;
end;

procedure shoppingCartInfoEntity.Setcustomer_is_guest(Index: Integer; const Astring: string);
begin
  Fcustomer_is_guest := Astring;
  Fcustomer_is_guest_Specified := True;
end;

function shoppingCartInfoEntity.customer_is_guest_Specified(Index: Integer): boolean;
begin
  Result := Fcustomer_is_guest_Specified;
end;

procedure shoppingCartInfoEntity.Setapplied_rule_ids(Index: Integer; const Astring: string);
begin
  Fapplied_rule_ids := Astring;
  Fapplied_rule_ids_Specified := True;
end;

function shoppingCartInfoEntity.applied_rule_ids_Specified(Index: Integer): boolean;
begin
  Result := Fapplied_rule_ids_Specified;
end;

procedure shoppingCartInfoEntity.Setreserved_order_id(Index: Integer; const Astring: string);
begin
  Freserved_order_id := Astring;
  Freserved_order_id_Specified := True;
end;

function shoppingCartInfoEntity.reserved_order_id_Specified(Index: Integer): boolean;
begin
  Result := Freserved_order_id_Specified;
end;

procedure shoppingCartInfoEntity.Setpassword_hash(Index: Integer; const Astring: string);
begin
  Fpassword_hash := Astring;
  Fpassword_hash_Specified := True;
end;

function shoppingCartInfoEntity.password_hash_Specified(Index: Integer): boolean;
begin
  Result := Fpassword_hash_Specified;
end;

procedure shoppingCartInfoEntity.Setcoupon_code(Index: Integer; const Astring: string);
begin
  Fcoupon_code := Astring;
  Fcoupon_code_Specified := True;
end;

function shoppingCartInfoEntity.coupon_code_Specified(Index: Integer): boolean;
begin
  Result := Fcoupon_code_Specified;
end;

procedure shoppingCartInfoEntity.Setglobal_currency_code(Index: Integer; const Astring: string);
begin
  Fglobal_currency_code := Astring;
  Fglobal_currency_code_Specified := True;
end;

function shoppingCartInfoEntity.global_currency_code_Specified(Index: Integer): boolean;
begin
  Result := Fglobal_currency_code_Specified;
end;

procedure shoppingCartInfoEntity.Setbase_to_global_rate(Index: Integer; const ADouble: Double);
begin
  Fbase_to_global_rate := ADouble;
  Fbase_to_global_rate_Specified := True;
end;

function shoppingCartInfoEntity.base_to_global_rate_Specified(Index: Integer): boolean;
begin
  Result := Fbase_to_global_rate_Specified;
end;

procedure shoppingCartInfoEntity.Setbase_to_quote_rate(Index: Integer; const ADouble: Double);
begin
  Fbase_to_quote_rate := ADouble;
  Fbase_to_quote_rate_Specified := True;
end;

function shoppingCartInfoEntity.base_to_quote_rate_Specified(Index: Integer): boolean;
begin
  Result := Fbase_to_quote_rate_Specified;
end;

procedure shoppingCartInfoEntity.Setcustomer_taxvat(Index: Integer; const Astring: string);
begin
  Fcustomer_taxvat := Astring;
  Fcustomer_taxvat_Specified := True;
end;

function shoppingCartInfoEntity.customer_taxvat_Specified(Index: Integer): boolean;
begin
  Result := Fcustomer_taxvat_Specified;
end;

procedure shoppingCartInfoEntity.Setcustomer_gender(Index: Integer; const Astring: string);
begin
  Fcustomer_gender := Astring;
  Fcustomer_gender_Specified := True;
end;

function shoppingCartInfoEntity.customer_gender_Specified(Index: Integer): boolean;
begin
  Result := Fcustomer_gender_Specified;
end;

procedure shoppingCartInfoEntity.Setsubtotal(Index: Integer; const ADouble: Double);
begin
  Fsubtotal := ADouble;
  Fsubtotal_Specified := True;
end;

function shoppingCartInfoEntity.subtotal_Specified(Index: Integer): boolean;
begin
  Result := Fsubtotal_Specified;
end;

procedure shoppingCartInfoEntity.Setbase_subtotal(Index: Integer; const ADouble: Double);
begin
  Fbase_subtotal := ADouble;
  Fbase_subtotal_Specified := True;
end;

function shoppingCartInfoEntity.base_subtotal_Specified(Index: Integer): boolean;
begin
  Result := Fbase_subtotal_Specified;
end;

procedure shoppingCartInfoEntity.Setsubtotal_with_discount(Index: Integer; const ADouble: Double);
begin
  Fsubtotal_with_discount := ADouble;
  Fsubtotal_with_discount_Specified := True;
end;

function shoppingCartInfoEntity.subtotal_with_discount_Specified(Index: Integer): boolean;
begin
  Result := Fsubtotal_with_discount_Specified;
end;

procedure shoppingCartInfoEntity.Setbase_subtotal_with_discount(Index: Integer; const ADouble: Double);
begin
  Fbase_subtotal_with_discount := ADouble;
  Fbase_subtotal_with_discount_Specified := True;
end;

function shoppingCartInfoEntity.base_subtotal_with_discount_Specified(Index: Integer): boolean;
begin
  Result := Fbase_subtotal_with_discount_Specified;
end;

procedure shoppingCartInfoEntity.Setext_shipping_info(Index: Integer; const Astring: string);
begin
  Fext_shipping_info := Astring;
  Fext_shipping_info_Specified := True;
end;

function shoppingCartInfoEntity.ext_shipping_info_Specified(Index: Integer): boolean;
begin
  Result := Fext_shipping_info_Specified;
end;

procedure shoppingCartInfoEntity.Setgift_message_id(Index: Integer; const Astring: string);
begin
  Fgift_message_id := Astring;
  Fgift_message_id_Specified := True;
end;

function shoppingCartInfoEntity.gift_message_id_Specified(Index: Integer): boolean;
begin
  Result := Fgift_message_id_Specified;
end;

procedure shoppingCartInfoEntity.Setgift_message(Index: Integer; const Astring: string);
begin
  Fgift_message := Astring;
  Fgift_message_Specified := True;
end;

function shoppingCartInfoEntity.gift_message_Specified(Index: Integer): boolean;
begin
  Result := Fgift_message_Specified;
end;

procedure shoppingCartInfoEntity.Setcustomer_balance_amount_used(Index: Integer; const ADouble: Double);
begin
  Fcustomer_balance_amount_used := ADouble;
  Fcustomer_balance_amount_used_Specified := True;
end;

function shoppingCartInfoEntity.customer_balance_amount_used_Specified(Index: Integer): boolean;
begin
  Result := Fcustomer_balance_amount_used_Specified;
end;

procedure shoppingCartInfoEntity.Setbase_customer_balance_amount_used(Index: Integer; const ADouble: Double);
begin
  Fbase_customer_balance_amount_used := ADouble;
  Fbase_customer_balance_amount_used_Specified := True;
end;

function shoppingCartInfoEntity.base_customer_balance_amount_used_Specified(Index: Integer): boolean;
begin
  Result := Fbase_customer_balance_amount_used_Specified;
end;

procedure shoppingCartInfoEntity.Setuse_customer_balance(Index: Integer; const Astring: string);
begin
  Fuse_customer_balance := Astring;
  Fuse_customer_balance_Specified := True;
end;

function shoppingCartInfoEntity.use_customer_balance_Specified(Index: Integer): boolean;
begin
  Result := Fuse_customer_balance_Specified;
end;

procedure shoppingCartInfoEntity.Setgift_cards_amount(Index: Integer; const Astring: string);
begin
  Fgift_cards_amount := Astring;
  Fgift_cards_amount_Specified := True;
end;

function shoppingCartInfoEntity.gift_cards_amount_Specified(Index: Integer): boolean;
begin
  Result := Fgift_cards_amount_Specified;
end;

procedure shoppingCartInfoEntity.Setbase_gift_cards_amount(Index: Integer; const Astring: string);
begin
  Fbase_gift_cards_amount := Astring;
  Fbase_gift_cards_amount_Specified := True;
end;

function shoppingCartInfoEntity.base_gift_cards_amount_Specified(Index: Integer): boolean;
begin
  Result := Fbase_gift_cards_amount_Specified;
end;

procedure shoppingCartInfoEntity.Setgift_cards_amount_used(Index: Integer; const Astring: string);
begin
  Fgift_cards_amount_used := Astring;
  Fgift_cards_amount_used_Specified := True;
end;

function shoppingCartInfoEntity.gift_cards_amount_used_Specified(Index: Integer): boolean;
begin
  Result := Fgift_cards_amount_used_Specified;
end;

procedure shoppingCartInfoEntity.Setuse_reward_points(Index: Integer; const Astring: string);
begin
  Fuse_reward_points := Astring;
  Fuse_reward_points_Specified := True;
end;

function shoppingCartInfoEntity.use_reward_points_Specified(Index: Integer): boolean;
begin
  Result := Fuse_reward_points_Specified;
end;

procedure shoppingCartInfoEntity.Setreward_points_balance(Index: Integer; const Astring: string);
begin
  Freward_points_balance := Astring;
  Freward_points_balance_Specified := True;
end;

function shoppingCartInfoEntity.reward_points_balance_Specified(Index: Integer): boolean;
begin
  Result := Freward_points_balance_Specified;
end;

procedure shoppingCartInfoEntity.Setbase_reward_currency_amount(Index: Integer; const Astring: string);
begin
  Fbase_reward_currency_amount := Astring;
  Fbase_reward_currency_amount_Specified := True;
end;

function shoppingCartInfoEntity.base_reward_currency_amount_Specified(Index: Integer): boolean;
begin
  Result := Fbase_reward_currency_amount_Specified;
end;

procedure shoppingCartInfoEntity.Setreward_currency_amount(Index: Integer; const Astring: string);
begin
  Freward_currency_amount := Astring;
  Freward_currency_amount_Specified := True;
end;

function shoppingCartInfoEntity.reward_currency_amount_Specified(Index: Integer): boolean;
begin
  Result := Freward_currency_amount_Specified;
end;

procedure shoppingCartInfoEntity.Setshipping_address(Index: Integer; const AshoppingCartAddressEntity: shoppingCartAddressEntity);
begin
  Fshipping_address := AshoppingCartAddressEntity;
  Fshipping_address_Specified := True;
end;

function shoppingCartInfoEntity.shipping_address_Specified(Index: Integer): boolean;
begin
  Result := Fshipping_address_Specified;
end;

procedure shoppingCartInfoEntity.Setbilling_address(Index: Integer; const AshoppingCartAddressEntity: shoppingCartAddressEntity);
begin
  Fbilling_address := AshoppingCartAddressEntity;
  Fbilling_address_Specified := True;
end;

function shoppingCartInfoEntity.billing_address_Specified(Index: Integer): boolean;
begin
  Result := Fbilling_address_Specified;
end;

procedure shoppingCartInfoEntity.Setitems(Index: Integer; const AshoppingCartItemEntityArray: shoppingCartItemEntityArray);
begin
  Fitems := AshoppingCartItemEntityArray;
  Fitems_Specified := True;
end;

function shoppingCartInfoEntity.items_Specified(Index: Integer): boolean;
begin
  Result := Fitems_Specified;
end;

procedure shoppingCartInfoEntity.Setpayment(Index: Integer; const AshoppingCartPaymentEntity: shoppingCartPaymentEntity);
begin
  Fpayment := AshoppingCartPaymentEntity;
  Fpayment_Specified := True;
end;

function shoppingCartInfoEntity.payment_Specified(Index: Integer): boolean;
begin
  Result := Fpayment_Specified;
end;

destructor shoppingCartPaymentMethodResponseEntity.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Fcc_types)-1 do
    SysUtils.FreeAndNil(Fcc_types[I]);
  System.SetLength(Fcc_types, 0);
  inherited Destroy;
end;

destructor catalogProductTagInfoEntity.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Fproducts)-1 do
    SysUtils.FreeAndNil(Fproducts[I]);
  System.SetLength(Fproducts, 0);
  inherited Destroy;
end;

procedure customerAddressEntityCreate.Setcity(Index: Integer; const Astring: string);
begin
  Fcity := Astring;
  Fcity_Specified := True;
end;

function customerAddressEntityCreate.city_Specified(Index: Integer): boolean;
begin
  Result := Fcity_Specified;
end;

procedure customerAddressEntityCreate.Setcompany(Index: Integer; const Astring: string);
begin
  Fcompany := Astring;
  Fcompany_Specified := True;
end;

function customerAddressEntityCreate.company_Specified(Index: Integer): boolean;
begin
  Result := Fcompany_Specified;
end;

procedure customerAddressEntityCreate.Setcountry_id(Index: Integer; const Astring: string);
begin
  Fcountry_id := Astring;
  Fcountry_id_Specified := True;
end;

function customerAddressEntityCreate.country_id_Specified(Index: Integer): boolean;
begin
  Result := Fcountry_id_Specified;
end;

procedure customerAddressEntityCreate.Setfax(Index: Integer; const Astring: string);
begin
  Ffax := Astring;
  Ffax_Specified := True;
end;

function customerAddressEntityCreate.fax_Specified(Index: Integer): boolean;
begin
  Result := Ffax_Specified;
end;

procedure customerAddressEntityCreate.Setfirstname(Index: Integer; const Astring: string);
begin
  Ffirstname := Astring;
  Ffirstname_Specified := True;
end;

function customerAddressEntityCreate.firstname_Specified(Index: Integer): boolean;
begin
  Result := Ffirstname_Specified;
end;

procedure customerAddressEntityCreate.Setlastname(Index: Integer; const Astring: string);
begin
  Flastname := Astring;
  Flastname_Specified := True;
end;

function customerAddressEntityCreate.lastname_Specified(Index: Integer): boolean;
begin
  Result := Flastname_Specified;
end;

procedure customerAddressEntityCreate.Setmiddlename(Index: Integer; const Astring: string);
begin
  Fmiddlename := Astring;
  Fmiddlename_Specified := True;
end;

function customerAddressEntityCreate.middlename_Specified(Index: Integer): boolean;
begin
  Result := Fmiddlename_Specified;
end;

procedure customerAddressEntityCreate.Setpostcode(Index: Integer; const Astring: string);
begin
  Fpostcode := Astring;
  Fpostcode_Specified := True;
end;

function customerAddressEntityCreate.postcode_Specified(Index: Integer): boolean;
begin
  Result := Fpostcode_Specified;
end;

procedure customerAddressEntityCreate.Setprefix(Index: Integer; const Astring: string);
begin
  Fprefix := Astring;
  Fprefix_Specified := True;
end;

function customerAddressEntityCreate.prefix_Specified(Index: Integer): boolean;
begin
  Result := Fprefix_Specified;
end;

procedure customerAddressEntityCreate.Setregion_id(Index: Integer; const AInteger: Integer);
begin
  Fregion_id := AInteger;
  Fregion_id_Specified := True;
end;

function customerAddressEntityCreate.region_id_Specified(Index: Integer): boolean;
begin
  Result := Fregion_id_Specified;
end;

procedure customerAddressEntityCreate.Setregion(Index: Integer; const Astring: string);
begin
  Fregion := Astring;
  Fregion_Specified := True;
end;

function customerAddressEntityCreate.region_Specified(Index: Integer): boolean;
begin
  Result := Fregion_Specified;
end;

procedure customerAddressEntityCreate.Setstreet(Index: Integer; const AArrayOfString: ArrayOfString);
begin
  Fstreet := AArrayOfString;
  Fstreet_Specified := True;
end;

function customerAddressEntityCreate.street_Specified(Index: Integer): boolean;
begin
  Result := Fstreet_Specified;
end;

procedure customerAddressEntityCreate.Setsuffix(Index: Integer; const Astring: string);
begin
  Fsuffix := Astring;
  Fsuffix_Specified := True;
end;

function customerAddressEntityCreate.suffix_Specified(Index: Integer): boolean;
begin
  Result := Fsuffix_Specified;
end;

procedure customerAddressEntityCreate.Settelephone(Index: Integer; const Astring: string);
begin
  Ftelephone := Astring;
  Ftelephone_Specified := True;
end;

function customerAddressEntityCreate.telephone_Specified(Index: Integer): boolean;
begin
  Result := Ftelephone_Specified;
end;

procedure customerAddressEntityCreate.Setis_default_billing(Index: Integer; const ABoolean: Boolean);
begin
  Fis_default_billing := ABoolean;
  Fis_default_billing_Specified := True;
end;

function customerAddressEntityCreate.is_default_billing_Specified(Index: Integer): boolean;
begin
  Result := Fis_default_billing_Specified;
end;

procedure customerAddressEntityCreate.Setis_default_shipping(Index: Integer; const ABoolean: Boolean);
begin
  Fis_default_shipping := ABoolean;
  Fis_default_shipping_Specified := True;
end;

function customerAddressEntityCreate.is_default_shipping_Specified(Index: Integer): boolean;
begin
  Result := Fis_default_shipping_Specified;
end;

destructor apiEntity.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Fmethods)-1 do
    SysUtils.FreeAndNil(Fmethods[I]);
  System.SetLength(Fmethods, 0);
  inherited Destroy;
end;

destructor shoppingCartProductEntity.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Foptions)-1 do
    SysUtils.FreeAndNil(Foptions[I]);
  System.SetLength(Foptions, 0);
  for I := 0 to System.Length(Fbundle_option)-1 do
    SysUtils.FreeAndNil(Fbundle_option[I]);
  System.SetLength(Fbundle_option, 0);
  for I := 0 to System.Length(Fbundle_option_qty)-1 do
    SysUtils.FreeAndNil(Fbundle_option_qty[I]);
  System.SetLength(Fbundle_option_qty, 0);
  inherited Destroy;
end;

procedure shoppingCartProductEntity.Setproduct_id(Index: Integer; const Astring: string);
begin
  Fproduct_id := Astring;
  Fproduct_id_Specified := True;
end;

function shoppingCartProductEntity.product_id_Specified(Index: Integer): boolean;
begin
  Result := Fproduct_id_Specified;
end;

procedure shoppingCartProductEntity.Setsku(Index: Integer; const Astring: string);
begin
  Fsku := Astring;
  Fsku_Specified := True;
end;

function shoppingCartProductEntity.sku_Specified(Index: Integer): boolean;
begin
  Result := Fsku_Specified;
end;

procedure shoppingCartProductEntity.Setqty(Index: Integer; const ADouble: Double);
begin
  Fqty := ADouble;
  Fqty_Specified := True;
end;

function shoppingCartProductEntity.qty_Specified(Index: Integer): boolean;
begin
  Result := Fqty_Specified;
end;

procedure shoppingCartProductEntity.Setoptions(Index: Integer; const AassociativeArray: associativeArray);
begin
  Foptions := AassociativeArray;
  Foptions_Specified := True;
end;

function shoppingCartProductEntity.options_Specified(Index: Integer): boolean;
begin
  Result := Foptions_Specified;
end;

procedure shoppingCartProductEntity.Setbundle_option(Index: Integer; const AassociativeArray: associativeArray);
begin
  Fbundle_option := AassociativeArray;
  Fbundle_option_Specified := True;
end;

function shoppingCartProductEntity.bundle_option_Specified(Index: Integer): boolean;
begin
  Result := Fbundle_option_Specified;
end;

procedure shoppingCartProductEntity.Setbundle_option_qty(Index: Integer; const AassociativeArray: associativeArray);
begin
  Fbundle_option_qty := AassociativeArray;
  Fbundle_option_qty_Specified := True;
end;

function shoppingCartProductEntity.bundle_option_qty_Specified(Index: Integer): boolean;
begin
  Result := Fbundle_option_qty_Specified;
end;

procedure shoppingCartProductEntity.Setlinks(Index: Integer; const AArrayOfString: ArrayOfString);
begin
  Flinks := AArrayOfString;
  Flinks_Specified := True;
end;

function shoppingCartProductEntity.links_Specified(Index: Integer): boolean;
begin
  Result := Flinks_Specified;
end;

destructor filters.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Ffilter)-1 do
    SysUtils.FreeAndNil(Ffilter[I]);
  System.SetLength(Ffilter, 0);
  for I := 0 to System.Length(Fcomplex_filter)-1 do
    SysUtils.FreeAndNil(Fcomplex_filter[I]);
  System.SetLength(Fcomplex_filter, 0);
  inherited Destroy;
end;

procedure filters.Setfilter(Index: Integer; const AassociativeArray: associativeArray);
begin
  Ffilter := AassociativeArray;
  Ffilter_Specified := True;
end;

function filters.filter_Specified(Index: Integer): boolean;
begin
  Result := Ffilter_Specified;
end;

procedure filters.Setcomplex_filter(Index: Integer; const AcomplexFilterArray: complexFilterArray);
begin
  Fcomplex_filter := AcomplexFilterArray;
  Fcomplex_filter_Specified := True;
end;

function filters.complex_filter_Specified(Index: Integer): boolean;
begin
  Result := Fcomplex_filter_Specified;
end;

procedure catalogProductImageFileEntity.Setname_(Index: Integer; const Astring: string);
begin
  Fname_ := Astring;
  Fname__Specified := True;
end;

function catalogProductImageFileEntity.name__Specified(Index: Integer): boolean;
begin
  Result := Fname__Specified;
end;

procedure catalogProductLinkEntity.Setproduct_id(Index: Integer; const Astring: string);
begin
  Fproduct_id := Astring;
  Fproduct_id_Specified := True;
end;

function catalogProductLinkEntity.product_id_Specified(Index: Integer): boolean;
begin
  Result := Fproduct_id_Specified;
end;

procedure catalogProductLinkEntity.Settype_(Index: Integer; const Astring: string);
begin
  Ftype_ := Astring;
  Ftype__Specified := True;
end;

function catalogProductLinkEntity.type__Specified(Index: Integer): boolean;
begin
  Result := Ftype__Specified;
end;

procedure catalogProductLinkEntity.Setset_(Index: Integer; const Astring: string);
begin
  Fset_ := Astring;
  Fset__Specified := True;
end;

function catalogProductLinkEntity.set__Specified(Index: Integer): boolean;
begin
  Result := Fset__Specified;
end;

procedure catalogProductLinkEntity.Setsku(Index: Integer; const Astring: string);
begin
  Fsku := Astring;
  Fsku_Specified := True;
end;

function catalogProductLinkEntity.sku_Specified(Index: Integer): boolean;
begin
  Result := Fsku_Specified;
end;

procedure catalogProductLinkEntity.Setposition(Index: Integer; const Astring: string);
begin
  Fposition := Astring;
  Fposition_Specified := True;
end;

function catalogProductLinkEntity.position_Specified(Index: Integer): boolean;
begin
  Result := Fposition_Specified;
end;

procedure catalogProductLinkEntity.Setqty(Index: Integer; const Astring: string);
begin
  Fqty := Astring;
  Fqty_Specified := True;
end;

function catalogProductLinkEntity.qty_Specified(Index: Integer): boolean;
begin
  Result := Fqty_Specified;
end;

destructor catalogProductAttributeMediaCreateEntity.Destroy;
begin
  SysUtils.FreeAndNil(Ffile_);
  inherited Destroy;
end;

procedure catalogProductAttributeMediaCreateEntity.Setfile_(Index: Integer; const AcatalogProductImageFileEntity: catalogProductImageFileEntity);
begin
  Ffile_ := AcatalogProductImageFileEntity;
  Ffile__Specified := True;
end;

function catalogProductAttributeMediaCreateEntity.file__Specified(Index: Integer): boolean;
begin
  Result := Ffile__Specified;
end;

procedure catalogProductAttributeMediaCreateEntity.Setlabel_(Index: Integer; const Astring: string);
begin
  Flabel_ := Astring;
  Flabel__Specified := True;
end;

function catalogProductAttributeMediaCreateEntity.label__Specified(Index: Integer): boolean;
begin
  Result := Flabel__Specified;
end;

procedure catalogProductAttributeMediaCreateEntity.Setposition(Index: Integer; const Astring: string);
begin
  Fposition := Astring;
  Fposition_Specified := True;
end;

function catalogProductAttributeMediaCreateEntity.position_Specified(Index: Integer): boolean;
begin
  Result := Fposition_Specified;
end;

procedure catalogProductAttributeMediaCreateEntity.Settypes(Index: Integer; const AArrayOfString: ArrayOfString);
begin
  Ftypes := AArrayOfString;
  Ftypes_Specified := True;
end;

function catalogProductAttributeMediaCreateEntity.types_Specified(Index: Integer): boolean;
begin
  Result := Ftypes_Specified;
end;

procedure catalogProductAttributeMediaCreateEntity.Setexclude(Index: Integer; const Astring: string);
begin
  Fexclude := Astring;
  Fexclude_Specified := True;
end;

function catalogProductAttributeMediaCreateEntity.exclude_Specified(Index: Integer): boolean;
begin
  Result := Fexclude_Specified;
end;

procedure catalogProductAttributeMediaCreateEntity.Setremove(Index: Integer; const Astring: string);
begin
  Fremove := Astring;
  Fremove_Specified := True;
end;

function catalogProductAttributeMediaCreateEntity.remove_Specified(Index: Integer): boolean;
begin
  Result := Fremove_Specified;
end;

procedure catalogAttributeEntity.Setattribute_id(Index: Integer; const AInteger: Integer);
begin
  Fattribute_id := AInteger;
  Fattribute_id_Specified := True;
end;

function catalogAttributeEntity.attribute_id_Specified(Index: Integer): boolean;
begin
  Result := Fattribute_id_Specified;
end;

procedure catalogAttributeEntity.Setcode(Index: Integer; const Astring: string);
begin
  Fcode := Astring;
  Fcode_Specified := True;
end;

function catalogAttributeEntity.code_Specified(Index: Integer): boolean;
begin
  Result := Fcode_Specified;
end;

procedure catalogAttributeEntity.Settype_(Index: Integer; const Astring: string);
begin
  Ftype_ := Astring;
  Ftype__Specified := True;
end;

function catalogAttributeEntity.type__Specified(Index: Integer): boolean;
begin
  Result := Ftype__Specified;
end;

procedure catalogAttributeEntity.Setrequired(Index: Integer; const Astring: string);
begin
  Frequired := Astring;
  Frequired_Specified := True;
end;

function catalogAttributeEntity.required_Specified(Index: Integer): boolean;
begin
  Result := Frequired_Specified;
end;

procedure catalogAttributeEntity.Setscope(Index: Integer; const Astring: string);
begin
  Fscope := Astring;
  Fscope_Specified := True;
end;

function catalogAttributeEntity.scope_Specified(Index: Integer): boolean;
begin
  Result := Fscope_Specified;
end;

destructor catalogProductAttributeOptionEntityToAdd.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Flabel_)-1 do
    SysUtils.FreeAndNil(Flabel_[I]);
  System.SetLength(Flabel_, 0);
  inherited Destroy;
end;

procedure catalogProductLinkAttributeEntity.Setcode(Index: Integer; const Astring: string);
begin
  Fcode := Astring;
  Fcode_Specified := True;
end;

function catalogProductLinkAttributeEntity.code_Specified(Index: Integer): boolean;
begin
  Result := Fcode_Specified;
end;

procedure catalogProductLinkAttributeEntity.Settype_(Index: Integer; const Astring: string);
begin
  Ftype_ := Astring;
  Ftype__Specified := True;
end;

function catalogProductLinkAttributeEntity.type__Specified(Index: Integer): boolean;
begin
  Result := Ftype__Specified;
end;

destructor catalogProductAttributeEntityToCreate.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Fadditional_fields)-1 do
    SysUtils.FreeAndNil(Fadditional_fields[I]);
  System.SetLength(Fadditional_fields, 0);
  for I := 0 to System.Length(Ffrontend_label)-1 do
    SysUtils.FreeAndNil(Ffrontend_label[I]);
  System.SetLength(Ffrontend_label, 0);
  inherited Destroy;
end;

procedure catalogProductAttributeEntityToCreate.Setscope(Index: Integer; const Astring: string);
begin
  Fscope := Astring;
  Fscope_Specified := True;
end;

function catalogProductAttributeEntityToCreate.scope_Specified(Index: Integer): boolean;
begin
  Result := Fscope_Specified;
end;

procedure catalogProductAttributeEntityToCreate.Setdefault_value(Index: Integer; const Astring: string);
begin
  Fdefault_value := Astring;
  Fdefault_value_Specified := True;
end;

function catalogProductAttributeEntityToCreate.default_value_Specified(Index: Integer): boolean;
begin
  Result := Fdefault_value_Specified;
end;

procedure catalogProductAttributeEntityToCreate.Setis_unique(Index: Integer; const AInteger: Integer);
begin
  Fis_unique := AInteger;
  Fis_unique_Specified := True;
end;

function catalogProductAttributeEntityToCreate.is_unique_Specified(Index: Integer): boolean;
begin
  Result := Fis_unique_Specified;
end;

procedure catalogProductAttributeEntityToCreate.Setis_required(Index: Integer; const AInteger: Integer);
begin
  Fis_required := AInteger;
  Fis_required_Specified := True;
end;

function catalogProductAttributeEntityToCreate.is_required_Specified(Index: Integer): boolean;
begin
  Result := Fis_required_Specified;
end;

procedure catalogProductAttributeEntityToCreate.Setapply_to(Index: Integer; const AArrayOfString: ArrayOfString);
begin
  Fapply_to := AArrayOfString;
  Fapply_to_Specified := True;
end;

function catalogProductAttributeEntityToCreate.apply_to_Specified(Index: Integer): boolean;
begin
  Result := Fapply_to_Specified;
end;

procedure catalogProductAttributeEntityToCreate.Setis_configurable(Index: Integer; const AInteger: Integer);
begin
  Fis_configurable := AInteger;
  Fis_configurable_Specified := True;
end;

function catalogProductAttributeEntityToCreate.is_configurable_Specified(Index: Integer): boolean;
begin
  Result := Fis_configurable_Specified;
end;

procedure catalogProductAttributeEntityToCreate.Setis_searchable(Index: Integer; const AInteger: Integer);
begin
  Fis_searchable := AInteger;
  Fis_searchable_Specified := True;
end;

function catalogProductAttributeEntityToCreate.is_searchable_Specified(Index: Integer): boolean;
begin
  Result := Fis_searchable_Specified;
end;

procedure catalogProductAttributeEntityToCreate.Setis_visible_in_advanced_search(Index: Integer; const AInteger: Integer);
begin
  Fis_visible_in_advanced_search := AInteger;
  Fis_visible_in_advanced_search_Specified := True;
end;

function catalogProductAttributeEntityToCreate.is_visible_in_advanced_search_Specified(Index: Integer): boolean;
begin
  Result := Fis_visible_in_advanced_search_Specified;
end;

procedure catalogProductAttributeEntityToCreate.Setis_comparable(Index: Integer; const AInteger: Integer);
begin
  Fis_comparable := AInteger;
  Fis_comparable_Specified := True;
end;

function catalogProductAttributeEntityToCreate.is_comparable_Specified(Index: Integer): boolean;
begin
  Result := Fis_comparable_Specified;
end;

procedure catalogProductAttributeEntityToCreate.Setis_used_for_promo_rules(Index: Integer; const AInteger: Integer);
begin
  Fis_used_for_promo_rules := AInteger;
  Fis_used_for_promo_rules_Specified := True;
end;

function catalogProductAttributeEntityToCreate.is_used_for_promo_rules_Specified(Index: Integer): boolean;
begin
  Result := Fis_used_for_promo_rules_Specified;
end;

procedure catalogProductAttributeEntityToCreate.Setis_visible_on_front(Index: Integer; const AInteger: Integer);
begin
  Fis_visible_on_front := AInteger;
  Fis_visible_on_front_Specified := True;
end;

function catalogProductAttributeEntityToCreate.is_visible_on_front_Specified(Index: Integer): boolean;
begin
  Result := Fis_visible_on_front_Specified;
end;

procedure catalogProductAttributeEntityToCreate.Setused_in_product_listing(Index: Integer; const AInteger: Integer);
begin
  Fused_in_product_listing := AInteger;
  Fused_in_product_listing_Specified := True;
end;

function catalogProductAttributeEntityToCreate.used_in_product_listing_Specified(Index: Integer): boolean;
begin
  Result := Fused_in_product_listing_Specified;
end;

procedure catalogProductAttributeEntityToCreate.Setadditional_fields(Index: Integer; const AassociativeArray: associativeArray);
begin
  Fadditional_fields := AassociativeArray;
  Fadditional_fields_Specified := True;
end;

function catalogProductAttributeEntityToCreate.additional_fields_Specified(Index: Integer): boolean;
begin
  Result := Fadditional_fields_Specified;
end;

destructor catalogProductAttributeEntityToUpdate.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Fadditional_fields)-1 do
    SysUtils.FreeAndNil(Fadditional_fields[I]);
  System.SetLength(Fadditional_fields, 0);
  for I := 0 to System.Length(Ffrontend_label)-1 do
    SysUtils.FreeAndNil(Ffrontend_label[I]);
  System.SetLength(Ffrontend_label, 0);
  inherited Destroy;
end;

procedure catalogProductAttributeEntityToUpdate.Setscope(Index: Integer; const Astring: string);
begin
  Fscope := Astring;
  Fscope_Specified := True;
end;

function catalogProductAttributeEntityToUpdate.scope_Specified(Index: Integer): boolean;
begin
  Result := Fscope_Specified;
end;

procedure catalogProductAttributeEntityToUpdate.Setdefault_value(Index: Integer; const Astring: string);
begin
  Fdefault_value := Astring;
  Fdefault_value_Specified := True;
end;

function catalogProductAttributeEntityToUpdate.default_value_Specified(Index: Integer): boolean;
begin
  Result := Fdefault_value_Specified;
end;

procedure catalogProductAttributeEntityToUpdate.Setis_unique(Index: Integer; const AInteger: Integer);
begin
  Fis_unique := AInteger;
  Fis_unique_Specified := True;
end;

function catalogProductAttributeEntityToUpdate.is_unique_Specified(Index: Integer): boolean;
begin
  Result := Fis_unique_Specified;
end;

procedure catalogProductAttributeEntityToUpdate.Setis_required(Index: Integer; const AInteger: Integer);
begin
  Fis_required := AInteger;
  Fis_required_Specified := True;
end;

function catalogProductAttributeEntityToUpdate.is_required_Specified(Index: Integer): boolean;
begin
  Result := Fis_required_Specified;
end;

procedure catalogProductAttributeEntityToUpdate.Setapply_to(Index: Integer; const AArrayOfString: ArrayOfString);
begin
  Fapply_to := AArrayOfString;
  Fapply_to_Specified := True;
end;

function catalogProductAttributeEntityToUpdate.apply_to_Specified(Index: Integer): boolean;
begin
  Result := Fapply_to_Specified;
end;

procedure catalogProductAttributeEntityToUpdate.Setis_configurable(Index: Integer; const AInteger: Integer);
begin
  Fis_configurable := AInteger;
  Fis_configurable_Specified := True;
end;

function catalogProductAttributeEntityToUpdate.is_configurable_Specified(Index: Integer): boolean;
begin
  Result := Fis_configurable_Specified;
end;

procedure catalogProductAttributeEntityToUpdate.Setis_searchable(Index: Integer; const AInteger: Integer);
begin
  Fis_searchable := AInteger;
  Fis_searchable_Specified := True;
end;

function catalogProductAttributeEntityToUpdate.is_searchable_Specified(Index: Integer): boolean;
begin
  Result := Fis_searchable_Specified;
end;

procedure catalogProductAttributeEntityToUpdate.Setis_visible_in_advanced_search(Index: Integer; const AInteger: Integer);
begin
  Fis_visible_in_advanced_search := AInteger;
  Fis_visible_in_advanced_search_Specified := True;
end;

function catalogProductAttributeEntityToUpdate.is_visible_in_advanced_search_Specified(Index: Integer): boolean;
begin
  Result := Fis_visible_in_advanced_search_Specified;
end;

procedure catalogProductAttributeEntityToUpdate.Setis_comparable(Index: Integer; const AInteger: Integer);
begin
  Fis_comparable := AInteger;
  Fis_comparable_Specified := True;
end;

function catalogProductAttributeEntityToUpdate.is_comparable_Specified(Index: Integer): boolean;
begin
  Result := Fis_comparable_Specified;
end;

procedure catalogProductAttributeEntityToUpdate.Setis_used_for_promo_rules(Index: Integer; const AInteger: Integer);
begin
  Fis_used_for_promo_rules := AInteger;
  Fis_used_for_promo_rules_Specified := True;
end;

function catalogProductAttributeEntityToUpdate.is_used_for_promo_rules_Specified(Index: Integer): boolean;
begin
  Result := Fis_used_for_promo_rules_Specified;
end;

procedure catalogProductAttributeEntityToUpdate.Setis_visible_on_front(Index: Integer; const AInteger: Integer);
begin
  Fis_visible_on_front := AInteger;
  Fis_visible_on_front_Specified := True;
end;

function catalogProductAttributeEntityToUpdate.is_visible_on_front_Specified(Index: Integer): boolean;
begin
  Result := Fis_visible_on_front_Specified;
end;

procedure catalogProductAttributeEntityToUpdate.Setused_in_product_listing(Index: Integer; const AInteger: Integer);
begin
  Fused_in_product_listing := AInteger;
  Fused_in_product_listing_Specified := True;
end;

function catalogProductAttributeEntityToUpdate.used_in_product_listing_Specified(Index: Integer): boolean;
begin
  Result := Fused_in_product_listing_Specified;
end;

procedure catalogProductAttributeEntityToUpdate.Setadditional_fields(Index: Integer; const AassociativeArray: associativeArray);
begin
  Fadditional_fields := AassociativeArray;
  Fadditional_fields_Specified := True;
end;

function catalogProductAttributeEntityToUpdate.additional_fields_Specified(Index: Integer): boolean;
begin
  Result := Fadditional_fields_Specified;
end;

destructor catalogProductAttributeEntity.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Fadditional_fields)-1 do
    SysUtils.FreeAndNil(Fadditional_fields[I]);
  System.SetLength(Fadditional_fields, 0);
  for I := 0 to System.Length(Foptions)-1 do
    SysUtils.FreeAndNil(Foptions[I]);
  System.SetLength(Foptions, 0);
  for I := 0 to System.Length(Ffrontend_label)-1 do
    SysUtils.FreeAndNil(Ffrontend_label[I]);
  System.SetLength(Ffrontend_label, 0);
  inherited Destroy;
end;

procedure catalogProductAttributeEntity.Setscope(Index: Integer; const Astring: string);
begin
  Fscope := Astring;
  Fscope_Specified := True;
end;

function catalogProductAttributeEntity.scope_Specified(Index: Integer): boolean;
begin
  Result := Fscope_Specified;
end;

procedure catalogProductAttributeEntity.Setdefault_value(Index: Integer; const Astring: string);
begin
  Fdefault_value := Astring;
  Fdefault_value_Specified := True;
end;

function catalogProductAttributeEntity.default_value_Specified(Index: Integer): boolean;
begin
  Result := Fdefault_value_Specified;
end;

procedure catalogProductAttributeEntity.Setis_unique(Index: Integer; const AInteger: Integer);
begin
  Fis_unique := AInteger;
  Fis_unique_Specified := True;
end;

function catalogProductAttributeEntity.is_unique_Specified(Index: Integer): boolean;
begin
  Result := Fis_unique_Specified;
end;

procedure catalogProductAttributeEntity.Setis_required(Index: Integer; const AInteger: Integer);
begin
  Fis_required := AInteger;
  Fis_required_Specified := True;
end;

function catalogProductAttributeEntity.is_required_Specified(Index: Integer): boolean;
begin
  Result := Fis_required_Specified;
end;

procedure catalogProductAttributeEntity.Setapply_to(Index: Integer; const AArrayOfString: ArrayOfString);
begin
  Fapply_to := AArrayOfString;
  Fapply_to_Specified := True;
end;

function catalogProductAttributeEntity.apply_to_Specified(Index: Integer): boolean;
begin
  Result := Fapply_to_Specified;
end;

procedure catalogProductAttributeEntity.Setis_configurable(Index: Integer; const AInteger: Integer);
begin
  Fis_configurable := AInteger;
  Fis_configurable_Specified := True;
end;

function catalogProductAttributeEntity.is_configurable_Specified(Index: Integer): boolean;
begin
  Result := Fis_configurable_Specified;
end;

procedure catalogProductAttributeEntity.Setis_searchable(Index: Integer; const AInteger: Integer);
begin
  Fis_searchable := AInteger;
  Fis_searchable_Specified := True;
end;

function catalogProductAttributeEntity.is_searchable_Specified(Index: Integer): boolean;
begin
  Result := Fis_searchable_Specified;
end;

procedure catalogProductAttributeEntity.Setis_visible_in_advanced_search(Index: Integer; const AInteger: Integer);
begin
  Fis_visible_in_advanced_search := AInteger;
  Fis_visible_in_advanced_search_Specified := True;
end;

function catalogProductAttributeEntity.is_visible_in_advanced_search_Specified(Index: Integer): boolean;
begin
  Result := Fis_visible_in_advanced_search_Specified;
end;

procedure catalogProductAttributeEntity.Setis_comparable(Index: Integer; const AInteger: Integer);
begin
  Fis_comparable := AInteger;
  Fis_comparable_Specified := True;
end;

function catalogProductAttributeEntity.is_comparable_Specified(Index: Integer): boolean;
begin
  Result := Fis_comparable_Specified;
end;

procedure catalogProductAttributeEntity.Setis_used_for_promo_rules(Index: Integer; const AInteger: Integer);
begin
  Fis_used_for_promo_rules := AInteger;
  Fis_used_for_promo_rules_Specified := True;
end;

function catalogProductAttributeEntity.is_used_for_promo_rules_Specified(Index: Integer): boolean;
begin
  Result := Fis_used_for_promo_rules_Specified;
end;

procedure catalogProductAttributeEntity.Setis_visible_on_front(Index: Integer; const AInteger: Integer);
begin
  Fis_visible_on_front := AInteger;
  Fis_visible_on_front_Specified := True;
end;

function catalogProductAttributeEntity.is_visible_on_front_Specified(Index: Integer): boolean;
begin
  Result := Fis_visible_on_front_Specified;
end;

procedure catalogProductAttributeEntity.Setused_in_product_listing(Index: Integer; const AInteger: Integer);
begin
  Fused_in_product_listing := AInteger;
  Fused_in_product_listing_Specified := True;
end;

function catalogProductAttributeEntity.used_in_product_listing_Specified(Index: Integer): boolean;
begin
  Result := Fused_in_product_listing_Specified;
end;

procedure catalogProductAttributeEntity.Setadditional_fields(Index: Integer; const AassociativeArray: associativeArray);
begin
  Fadditional_fields := AassociativeArray;
  Fadditional_fields_Specified := True;
end;

function catalogProductAttributeEntity.additional_fields_Specified(Index: Integer): boolean;
begin
  Result := Fadditional_fields_Specified;
end;

procedure catalogProductAttributeEntity.Setoptions(Index: Integer; const AcatalogAttributeOptionEntityArray: catalogAttributeOptionEntityArray);
begin
  Foptions := AcatalogAttributeOptionEntityArray;
  Foptions_Specified := True;
end;

function catalogProductAttributeEntity.options_Specified(Index: Integer): boolean;
begin
  Result := Foptions_Specified;
end;

procedure catalogInventoryStockItemUpdateEntity.Setqty(Index: Integer; const Astring: string);
begin
  Fqty := Astring;
  Fqty_Specified := True;
end;

function catalogInventoryStockItemUpdateEntity.qty_Specified(Index: Integer): boolean;
begin
  Result := Fqty_Specified;
end;

procedure catalogInventoryStockItemUpdateEntity.Setis_in_stock(Index: Integer; const AInteger: Integer);
begin
  Fis_in_stock := AInteger;
  Fis_in_stock_Specified := True;
end;

function catalogInventoryStockItemUpdateEntity.is_in_stock_Specified(Index: Integer): boolean;
begin
  Result := Fis_in_stock_Specified;
end;

procedure catalogInventoryStockItemUpdateEntity.Setmanage_stock(Index: Integer; const AInteger: Integer);
begin
  Fmanage_stock := AInteger;
  Fmanage_stock_Specified := True;
end;

function catalogInventoryStockItemUpdateEntity.manage_stock_Specified(Index: Integer): boolean;
begin
  Result := Fmanage_stock_Specified;
end;

procedure catalogInventoryStockItemUpdateEntity.Setuse_config_manage_stock(Index: Integer; const AInteger: Integer);
begin
  Fuse_config_manage_stock := AInteger;
  Fuse_config_manage_stock_Specified := True;
end;

function catalogInventoryStockItemUpdateEntity.use_config_manage_stock_Specified(Index: Integer): boolean;
begin
  Result := Fuse_config_manage_stock_Specified;
end;

procedure catalogInventoryStockItemUpdateEntity.Setmin_qty(Index: Integer; const AInteger: Integer);
begin
  Fmin_qty := AInteger;
  Fmin_qty_Specified := True;
end;

function catalogInventoryStockItemUpdateEntity.min_qty_Specified(Index: Integer): boolean;
begin
  Result := Fmin_qty_Specified;
end;

procedure catalogInventoryStockItemUpdateEntity.Setuse_config_min_qty(Index: Integer; const AInteger: Integer);
begin
  Fuse_config_min_qty := AInteger;
  Fuse_config_min_qty_Specified := True;
end;

function catalogInventoryStockItemUpdateEntity.use_config_min_qty_Specified(Index: Integer): boolean;
begin
  Result := Fuse_config_min_qty_Specified;
end;

procedure catalogInventoryStockItemUpdateEntity.Setmin_sale_qty(Index: Integer; const AInteger: Integer);
begin
  Fmin_sale_qty := AInteger;
  Fmin_sale_qty_Specified := True;
end;

function catalogInventoryStockItemUpdateEntity.min_sale_qty_Specified(Index: Integer): boolean;
begin
  Result := Fmin_sale_qty_Specified;
end;

procedure catalogInventoryStockItemUpdateEntity.Setuse_config_min_sale_qty(Index: Integer; const AInteger: Integer);
begin
  Fuse_config_min_sale_qty := AInteger;
  Fuse_config_min_sale_qty_Specified := True;
end;

function catalogInventoryStockItemUpdateEntity.use_config_min_sale_qty_Specified(Index: Integer): boolean;
begin
  Result := Fuse_config_min_sale_qty_Specified;
end;

procedure catalogInventoryStockItemUpdateEntity.Setmax_sale_qty(Index: Integer; const AInteger: Integer);
begin
  Fmax_sale_qty := AInteger;
  Fmax_sale_qty_Specified := True;
end;

function catalogInventoryStockItemUpdateEntity.max_sale_qty_Specified(Index: Integer): boolean;
begin
  Result := Fmax_sale_qty_Specified;
end;

procedure catalogInventoryStockItemUpdateEntity.Setuse_config_max_sale_qty(Index: Integer; const AInteger: Integer);
begin
  Fuse_config_max_sale_qty := AInteger;
  Fuse_config_max_sale_qty_Specified := True;
end;

function catalogInventoryStockItemUpdateEntity.use_config_max_sale_qty_Specified(Index: Integer): boolean;
begin
  Result := Fuse_config_max_sale_qty_Specified;
end;

procedure catalogInventoryStockItemUpdateEntity.Setis_qty_decimal(Index: Integer; const AInteger: Integer);
begin
  Fis_qty_decimal := AInteger;
  Fis_qty_decimal_Specified := True;
end;

function catalogInventoryStockItemUpdateEntity.is_qty_decimal_Specified(Index: Integer): boolean;
begin
  Result := Fis_qty_decimal_Specified;
end;

procedure catalogInventoryStockItemUpdateEntity.Setbackorders(Index: Integer; const AInteger: Integer);
begin
  Fbackorders := AInteger;
  Fbackorders_Specified := True;
end;

function catalogInventoryStockItemUpdateEntity.backorders_Specified(Index: Integer): boolean;
begin
  Result := Fbackorders_Specified;
end;

procedure catalogInventoryStockItemUpdateEntity.Setuse_config_backorders(Index: Integer; const AInteger: Integer);
begin
  Fuse_config_backorders := AInteger;
  Fuse_config_backorders_Specified := True;
end;

function catalogInventoryStockItemUpdateEntity.use_config_backorders_Specified(Index: Integer): boolean;
begin
  Result := Fuse_config_backorders_Specified;
end;

procedure catalogInventoryStockItemUpdateEntity.Setnotify_stock_qty(Index: Integer; const AInteger: Integer);
begin
  Fnotify_stock_qty := AInteger;
  Fnotify_stock_qty_Specified := True;
end;

function catalogInventoryStockItemUpdateEntity.notify_stock_qty_Specified(Index: Integer): boolean;
begin
  Result := Fnotify_stock_qty_Specified;
end;

procedure catalogInventoryStockItemUpdateEntity.Setuse_config_notify_stock_qty(Index: Integer; const AInteger: Integer);
begin
  Fuse_config_notify_stock_qty := AInteger;
  Fuse_config_notify_stock_qty_Specified := True;
end;

function catalogInventoryStockItemUpdateEntity.use_config_notify_stock_qty_Specified(Index: Integer): boolean;
begin
  Result := Fuse_config_notify_stock_qty_Specified;
end;

procedure catalogProductAttributeSetEntity.Setset_id(Index: Integer; const AInteger: Integer);
begin
  Fset_id := AInteger;
  Fset_id_Specified := True;
end;

function catalogProductAttributeSetEntity.set_id_Specified(Index: Integer): boolean;
begin
  Result := Fset_id_Specified;
end;

procedure catalogProductAttributeSetEntity.Setname_(Index: Integer; const Astring: string);
begin
  Fname_ := Astring;
  Fname__Specified := True;
end;

function catalogProductAttributeSetEntity.name__Specified(Index: Integer): boolean;
begin
  Result := Fname__Specified;
end;

destructor catalogProductCreateEntity.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Ftier_price)-1 do
    SysUtils.FreeAndNil(Ftier_price[I]);
  System.SetLength(Ftier_price, 0);
  SysUtils.FreeAndNil(Fadditional_attributes);
  SysUtils.FreeAndNil(Fstock_data);
  inherited Destroy;
end;

procedure catalogProductCreateEntity.Setcategories(Index: Integer; const AArrayOfString: ArrayOfString);
begin
  Fcategories := AArrayOfString;
  Fcategories_Specified := True;
end;

function catalogProductCreateEntity.categories_Specified(Index: Integer): boolean;
begin
  Result := Fcategories_Specified;
end;

procedure catalogProductCreateEntity.Setwebsites(Index: Integer; const AArrayOfString: ArrayOfString);
begin
  Fwebsites := AArrayOfString;
  Fwebsites_Specified := True;
end;

function catalogProductCreateEntity.websites_Specified(Index: Integer): boolean;
begin
  Result := Fwebsites_Specified;
end;

procedure catalogProductCreateEntity.Setname_(Index: Integer; const Astring: string);
begin
  Fname_ := Astring;
  Fname__Specified := True;
end;

function catalogProductCreateEntity.name__Specified(Index: Integer): boolean;
begin
  Result := Fname__Specified;
end;

procedure catalogProductCreateEntity.Setdescription(Index: Integer; const Astring: string);
begin
  Fdescription := Astring;
  Fdescription_Specified := True;
end;

function catalogProductCreateEntity.description_Specified(Index: Integer): boolean;
begin
  Result := Fdescription_Specified;
end;

procedure catalogProductCreateEntity.Setshort_description(Index: Integer; const Astring: string);
begin
  Fshort_description := Astring;
  Fshort_description_Specified := True;
end;

function catalogProductCreateEntity.short_description_Specified(Index: Integer): boolean;
begin
  Result := Fshort_description_Specified;
end;

procedure catalogProductCreateEntity.Setweight(Index: Integer; const Astring: string);
begin
  Fweight := Astring;
  Fweight_Specified := True;
end;

function catalogProductCreateEntity.weight_Specified(Index: Integer): boolean;
begin
  Result := Fweight_Specified;
end;

procedure catalogProductCreateEntity.Setstatus(Index: Integer; const Astring: string);
begin
  Fstatus := Astring;
  Fstatus_Specified := True;
end;

function catalogProductCreateEntity.status_Specified(Index: Integer): boolean;
begin
  Result := Fstatus_Specified;
end;

procedure catalogProductCreateEntity.Seturl_key(Index: Integer; const Astring: string);
begin
  Furl_key := Astring;
  Furl_key_Specified := True;
end;

function catalogProductCreateEntity.url_key_Specified(Index: Integer): boolean;
begin
  Result := Furl_key_Specified;
end;

procedure catalogProductCreateEntity.Seturl_path(Index: Integer; const Astring: string);
begin
  Furl_path := Astring;
  Furl_path_Specified := True;
end;

function catalogProductCreateEntity.url_path_Specified(Index: Integer): boolean;
begin
  Result := Furl_path_Specified;
end;

procedure catalogProductCreateEntity.Setvisibility(Index: Integer; const Astring: string);
begin
  Fvisibility := Astring;
  Fvisibility_Specified := True;
end;

function catalogProductCreateEntity.visibility_Specified(Index: Integer): boolean;
begin
  Result := Fvisibility_Specified;
end;

procedure catalogProductCreateEntity.Setcategory_ids(Index: Integer; const AArrayOfString: ArrayOfString);
begin
  Fcategory_ids := AArrayOfString;
  Fcategory_ids_Specified := True;
end;

function catalogProductCreateEntity.category_ids_Specified(Index: Integer): boolean;
begin
  Result := Fcategory_ids_Specified;
end;

procedure catalogProductCreateEntity.Setwebsite_ids(Index: Integer; const AArrayOfString: ArrayOfString);
begin
  Fwebsite_ids := AArrayOfString;
  Fwebsite_ids_Specified := True;
end;

function catalogProductCreateEntity.website_ids_Specified(Index: Integer): boolean;
begin
  Result := Fwebsite_ids_Specified;
end;

procedure catalogProductCreateEntity.Sethas_options(Index: Integer; const Astring: string);
begin
  Fhas_options := Astring;
  Fhas_options_Specified := True;
end;

function catalogProductCreateEntity.has_options_Specified(Index: Integer): boolean;
begin
  Result := Fhas_options_Specified;
end;

procedure catalogProductCreateEntity.Setgift_message_available(Index: Integer; const Astring: string);
begin
  Fgift_message_available := Astring;
  Fgift_message_available_Specified := True;
end;

function catalogProductCreateEntity.gift_message_available_Specified(Index: Integer): boolean;
begin
  Result := Fgift_message_available_Specified;
end;

procedure catalogProductCreateEntity.Setprice(Index: Integer; const Astring: string);
begin
  Fprice := Astring;
  Fprice_Specified := True;
end;

function catalogProductCreateEntity.price_Specified(Index: Integer): boolean;
begin
  Result := Fprice_Specified;
end;

procedure catalogProductCreateEntity.Setspecial_price(Index: Integer; const Astring: string);
begin
  Fspecial_price := Astring;
  Fspecial_price_Specified := True;
end;

function catalogProductCreateEntity.special_price_Specified(Index: Integer): boolean;
begin
  Result := Fspecial_price_Specified;
end;

procedure catalogProductCreateEntity.Setspecial_from_date(Index: Integer; const Astring: string);
begin
  Fspecial_from_date := Astring;
  Fspecial_from_date_Specified := True;
end;

function catalogProductCreateEntity.special_from_date_Specified(Index: Integer): boolean;
begin
  Result := Fspecial_from_date_Specified;
end;

procedure catalogProductCreateEntity.Setspecial_to_date(Index: Integer; const Astring: string);
begin
  Fspecial_to_date := Astring;
  Fspecial_to_date_Specified := True;
end;

function catalogProductCreateEntity.special_to_date_Specified(Index: Integer): boolean;
begin
  Result := Fspecial_to_date_Specified;
end;

procedure catalogProductCreateEntity.Settax_class_id(Index: Integer; const Astring: string);
begin
  Ftax_class_id := Astring;
  Ftax_class_id_Specified := True;
end;

function catalogProductCreateEntity.tax_class_id_Specified(Index: Integer): boolean;
begin
  Result := Ftax_class_id_Specified;
end;

procedure catalogProductCreateEntity.Settier_price(Index: Integer; const AcatalogProductTierPriceEntityArray: catalogProductTierPriceEntityArray);
begin
  Ftier_price := AcatalogProductTierPriceEntityArray;
  Ftier_price_Specified := True;
end;

function catalogProductCreateEntity.tier_price_Specified(Index: Integer): boolean;
begin
  Result := Ftier_price_Specified;
end;

procedure catalogProductCreateEntity.Setmeta_title(Index: Integer; const Astring: string);
begin
  Fmeta_title := Astring;
  Fmeta_title_Specified := True;
end;

function catalogProductCreateEntity.meta_title_Specified(Index: Integer): boolean;
begin
  Result := Fmeta_title_Specified;
end;

procedure catalogProductCreateEntity.Setmeta_keyword(Index: Integer; const Astring: string);
begin
  Fmeta_keyword := Astring;
  Fmeta_keyword_Specified := True;
end;

function catalogProductCreateEntity.meta_keyword_Specified(Index: Integer): boolean;
begin
  Result := Fmeta_keyword_Specified;
end;

procedure catalogProductCreateEntity.Setmeta_description(Index: Integer; const Astring: string);
begin
  Fmeta_description := Astring;
  Fmeta_description_Specified := True;
end;

function catalogProductCreateEntity.meta_description_Specified(Index: Integer): boolean;
begin
  Result := Fmeta_description_Specified;
end;

procedure catalogProductCreateEntity.Setcustom_design(Index: Integer; const Astring: string);
begin
  Fcustom_design := Astring;
  Fcustom_design_Specified := True;
end;

function catalogProductCreateEntity.custom_design_Specified(Index: Integer): boolean;
begin
  Result := Fcustom_design_Specified;
end;

procedure catalogProductCreateEntity.Setcustom_layout_update(Index: Integer; const Astring: string);
begin
  Fcustom_layout_update := Astring;
  Fcustom_layout_update_Specified := True;
end;

function catalogProductCreateEntity.custom_layout_update_Specified(Index: Integer): boolean;
begin
  Result := Fcustom_layout_update_Specified;
end;

procedure catalogProductCreateEntity.Setoptions_container(Index: Integer; const Astring: string);
begin
  Foptions_container := Astring;
  Foptions_container_Specified := True;
end;

function catalogProductCreateEntity.options_container_Specified(Index: Integer): boolean;
begin
  Result := Foptions_container_Specified;
end;

procedure catalogProductCreateEntity.Setadditional_attributes(Index: Integer; const AcatalogProductAdditionalAttributesEntity: catalogProductAdditionalAttributesEntity);
begin
  Fadditional_attributes := AcatalogProductAdditionalAttributesEntity;
  Fadditional_attributes_Specified := True;
end;

function catalogProductCreateEntity.additional_attributes_Specified(Index: Integer): boolean;
begin
  Result := Fadditional_attributes_Specified;
end;

procedure catalogProductCreateEntity.Setstock_data(Index: Integer; const AcatalogInventoryStockItemUpdateEntity: catalogInventoryStockItemUpdateEntity);
begin
  Fstock_data := AcatalogInventoryStockItemUpdateEntity;
  Fstock_data_Specified := True;
end;

function catalogProductCreateEntity.stock_data_Specified(Index: Integer): boolean;
begin
  Result := Fstock_data_Specified;
end;

destructor catalogProductAdditionalAttributesEntity.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Fmulti_data)-1 do
    SysUtils.FreeAndNil(Fmulti_data[I]);
  System.SetLength(Fmulti_data, 0);
  for I := 0 to System.Length(Fsingle_data)-1 do
    SysUtils.FreeAndNil(Fsingle_data[I]);
  System.SetLength(Fsingle_data, 0);
  inherited Destroy;
end;

procedure catalogProductAdditionalAttributesEntity.Setmulti_data(Index: Integer; const AassociativeMultiArray: associativeMultiArray);
begin
  Fmulti_data := AassociativeMultiArray;
  Fmulti_data_Specified := True;
end;

function catalogProductAdditionalAttributesEntity.multi_data_Specified(Index: Integer): boolean;
begin
  Result := Fmulti_data_Specified;
end;

procedure catalogProductAdditionalAttributesEntity.Setsingle_data(Index: Integer; const AassociativeArray: associativeArray);
begin
  Fsingle_data := AassociativeArray;
  Fsingle_data_Specified := True;
end;

function catalogProductAdditionalAttributesEntity.single_data_Specified(Index: Integer): boolean;
begin
  Result := Fsingle_data_Specified;
end;

destructor catalogProductReturnEntity.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Ftier_price)-1 do
    SysUtils.FreeAndNil(Ftier_price[I]);
  System.SetLength(Ftier_price, 0);
  for I := 0 to System.Length(Fadditional_attributes)-1 do
    SysUtils.FreeAndNil(Fadditional_attributes[I]);
  System.SetLength(Fadditional_attributes, 0);
  inherited Destroy;
end;

procedure catalogProductReturnEntity.Setproduct_id(Index: Integer; const Astring: string);
begin
  Fproduct_id := Astring;
  Fproduct_id_Specified := True;
end;

function catalogProductReturnEntity.product_id_Specified(Index: Integer): boolean;
begin
  Result := Fproduct_id_Specified;
end;

procedure catalogProductReturnEntity.Setsku(Index: Integer; const Astring: string);
begin
  Fsku := Astring;
  Fsku_Specified := True;
end;

function catalogProductReturnEntity.sku_Specified(Index: Integer): boolean;
begin
  Result := Fsku_Specified;
end;

procedure catalogProductReturnEntity.Setset_(Index: Integer; const Astring: string);
begin
  Fset_ := Astring;
  Fset__Specified := True;
end;

function catalogProductReturnEntity.set__Specified(Index: Integer): boolean;
begin
  Result := Fset__Specified;
end;

procedure catalogProductReturnEntity.Settype_(Index: Integer; const Astring: string);
begin
  Ftype_ := Astring;
  Ftype__Specified := True;
end;

function catalogProductReturnEntity.type__Specified(Index: Integer): boolean;
begin
  Result := Ftype__Specified;
end;

procedure catalogProductReturnEntity.Setcategories(Index: Integer; const AArrayOfString: ArrayOfString);
begin
  Fcategories := AArrayOfString;
  Fcategories_Specified := True;
end;

function catalogProductReturnEntity.categories_Specified(Index: Integer): boolean;
begin
  Result := Fcategories_Specified;
end;

procedure catalogProductReturnEntity.Setwebsites(Index: Integer; const AArrayOfString: ArrayOfString);
begin
  Fwebsites := AArrayOfString;
  Fwebsites_Specified := True;
end;

function catalogProductReturnEntity.websites_Specified(Index: Integer): boolean;
begin
  Result := Fwebsites_Specified;
end;

procedure catalogProductReturnEntity.Setcreated_at(Index: Integer; const Astring: string);
begin
  Fcreated_at := Astring;
  Fcreated_at_Specified := True;
end;

function catalogProductReturnEntity.created_at_Specified(Index: Integer): boolean;
begin
  Result := Fcreated_at_Specified;
end;

procedure catalogProductReturnEntity.Setupdated_at(Index: Integer; const Astring: string);
begin
  Fupdated_at := Astring;
  Fupdated_at_Specified := True;
end;

function catalogProductReturnEntity.updated_at_Specified(Index: Integer): boolean;
begin
  Result := Fupdated_at_Specified;
end;

procedure catalogProductReturnEntity.Settype_id(Index: Integer; const Astring: string);
begin
  Ftype_id := Astring;
  Ftype_id_Specified := True;
end;

function catalogProductReturnEntity.type_id_Specified(Index: Integer): boolean;
begin
  Result := Ftype_id_Specified;
end;

procedure catalogProductReturnEntity.Setname_(Index: Integer; const Astring: string);
begin
  Fname_ := Astring;
  Fname__Specified := True;
end;

function catalogProductReturnEntity.name__Specified(Index: Integer): boolean;
begin
  Result := Fname__Specified;
end;

procedure catalogProductReturnEntity.Setdescription(Index: Integer; const Astring: string);
begin
  Fdescription := Astring;
  Fdescription_Specified := True;
end;

function catalogProductReturnEntity.description_Specified(Index: Integer): boolean;
begin
  Result := Fdescription_Specified;
end;

procedure catalogProductReturnEntity.Setshort_description(Index: Integer; const Astring: string);
begin
  Fshort_description := Astring;
  Fshort_description_Specified := True;
end;

function catalogProductReturnEntity.short_description_Specified(Index: Integer): boolean;
begin
  Result := Fshort_description_Specified;
end;

procedure catalogProductReturnEntity.Setweight(Index: Integer; const Astring: string);
begin
  Fweight := Astring;
  Fweight_Specified := True;
end;

function catalogProductReturnEntity.weight_Specified(Index: Integer): boolean;
begin
  Result := Fweight_Specified;
end;

procedure catalogProductReturnEntity.Setstatus(Index: Integer; const Astring: string);
begin
  Fstatus := Astring;
  Fstatus_Specified := True;
end;

function catalogProductReturnEntity.status_Specified(Index: Integer): boolean;
begin
  Result := Fstatus_Specified;
end;

procedure catalogProductReturnEntity.Seturl_key(Index: Integer; const Astring: string);
begin
  Furl_key := Astring;
  Furl_key_Specified := True;
end;

function catalogProductReturnEntity.url_key_Specified(Index: Integer): boolean;
begin
  Result := Furl_key_Specified;
end;

procedure catalogProductReturnEntity.Seturl_path(Index: Integer; const Astring: string);
begin
  Furl_path := Astring;
  Furl_path_Specified := True;
end;

function catalogProductReturnEntity.url_path_Specified(Index: Integer): boolean;
begin
  Result := Furl_path_Specified;
end;

procedure catalogProductReturnEntity.Setvisibility(Index: Integer; const Astring: string);
begin
  Fvisibility := Astring;
  Fvisibility_Specified := True;
end;

function catalogProductReturnEntity.visibility_Specified(Index: Integer): boolean;
begin
  Result := Fvisibility_Specified;
end;

procedure catalogProductReturnEntity.Setcategory_ids(Index: Integer; const AArrayOfString: ArrayOfString);
begin
  Fcategory_ids := AArrayOfString;
  Fcategory_ids_Specified := True;
end;

function catalogProductReturnEntity.category_ids_Specified(Index: Integer): boolean;
begin
  Result := Fcategory_ids_Specified;
end;

procedure catalogProductReturnEntity.Setwebsite_ids(Index: Integer; const AArrayOfString: ArrayOfString);
begin
  Fwebsite_ids := AArrayOfString;
  Fwebsite_ids_Specified := True;
end;

function catalogProductReturnEntity.website_ids_Specified(Index: Integer): boolean;
begin
  Result := Fwebsite_ids_Specified;
end;

procedure catalogProductReturnEntity.Sethas_options(Index: Integer; const Astring: string);
begin
  Fhas_options := Astring;
  Fhas_options_Specified := True;
end;

function catalogProductReturnEntity.has_options_Specified(Index: Integer): boolean;
begin
  Result := Fhas_options_Specified;
end;

procedure catalogProductReturnEntity.Setgift_message_available(Index: Integer; const Astring: string);
begin
  Fgift_message_available := Astring;
  Fgift_message_available_Specified := True;
end;

function catalogProductReturnEntity.gift_message_available_Specified(Index: Integer): boolean;
begin
  Result := Fgift_message_available_Specified;
end;

procedure catalogProductReturnEntity.Setprice(Index: Integer; const Astring: string);
begin
  Fprice := Astring;
  Fprice_Specified := True;
end;

function catalogProductReturnEntity.price_Specified(Index: Integer): boolean;
begin
  Result := Fprice_Specified;
end;

procedure catalogProductReturnEntity.Setspecial_price(Index: Integer; const Astring: string);
begin
  Fspecial_price := Astring;
  Fspecial_price_Specified := True;
end;

function catalogProductReturnEntity.special_price_Specified(Index: Integer): boolean;
begin
  Result := Fspecial_price_Specified;
end;

procedure catalogProductReturnEntity.Setspecial_from_date(Index: Integer; const Astring: string);
begin
  Fspecial_from_date := Astring;
  Fspecial_from_date_Specified := True;
end;

function catalogProductReturnEntity.special_from_date_Specified(Index: Integer): boolean;
begin
  Result := Fspecial_from_date_Specified;
end;

procedure catalogProductReturnEntity.Setspecial_to_date(Index: Integer; const Astring: string);
begin
  Fspecial_to_date := Astring;
  Fspecial_to_date_Specified := True;
end;

function catalogProductReturnEntity.special_to_date_Specified(Index: Integer): boolean;
begin
  Result := Fspecial_to_date_Specified;
end;

procedure catalogProductReturnEntity.Settax_class_id(Index: Integer; const Astring: string);
begin
  Ftax_class_id := Astring;
  Ftax_class_id_Specified := True;
end;

function catalogProductReturnEntity.tax_class_id_Specified(Index: Integer): boolean;
begin
  Result := Ftax_class_id_Specified;
end;

procedure catalogProductReturnEntity.Settier_price(Index: Integer; const AcatalogProductTierPriceEntityArray: catalogProductTierPriceEntityArray);
begin
  Ftier_price := AcatalogProductTierPriceEntityArray;
  Ftier_price_Specified := True;
end;

function catalogProductReturnEntity.tier_price_Specified(Index: Integer): boolean;
begin
  Result := Ftier_price_Specified;
end;

procedure catalogProductReturnEntity.Setmeta_title(Index: Integer; const Astring: string);
begin
  Fmeta_title := Astring;
  Fmeta_title_Specified := True;
end;

function catalogProductReturnEntity.meta_title_Specified(Index: Integer): boolean;
begin
  Result := Fmeta_title_Specified;
end;

procedure catalogProductReturnEntity.Setmeta_keyword(Index: Integer; const Astring: string);
begin
  Fmeta_keyword := Astring;
  Fmeta_keyword_Specified := True;
end;

function catalogProductReturnEntity.meta_keyword_Specified(Index: Integer): boolean;
begin
  Result := Fmeta_keyword_Specified;
end;

procedure catalogProductReturnEntity.Setmeta_description(Index: Integer; const Astring: string);
begin
  Fmeta_description := Astring;
  Fmeta_description_Specified := True;
end;

function catalogProductReturnEntity.meta_description_Specified(Index: Integer): boolean;
begin
  Result := Fmeta_description_Specified;
end;

procedure catalogProductReturnEntity.Setcustom_design(Index: Integer; const Astring: string);
begin
  Fcustom_design := Astring;
  Fcustom_design_Specified := True;
end;

function catalogProductReturnEntity.custom_design_Specified(Index: Integer): boolean;
begin
  Result := Fcustom_design_Specified;
end;

procedure catalogProductReturnEntity.Setcustom_layout_update(Index: Integer; const Astring: string);
begin
  Fcustom_layout_update := Astring;
  Fcustom_layout_update_Specified := True;
end;

function catalogProductReturnEntity.custom_layout_update_Specified(Index: Integer): boolean;
begin
  Result := Fcustom_layout_update_Specified;
end;

procedure catalogProductReturnEntity.Setoptions_container(Index: Integer; const Astring: string);
begin
  Foptions_container := Astring;
  Foptions_container_Specified := True;
end;

function catalogProductReturnEntity.options_container_Specified(Index: Integer): boolean;
begin
  Result := Foptions_container_Specified;
end;

procedure catalogProductReturnEntity.Setadditional_attributes(Index: Integer; const AassociativeArray: associativeArray);
begin
  Fadditional_attributes := AassociativeArray;
  Fadditional_attributes_Specified := True;
end;

function catalogProductReturnEntity.additional_attributes_Specified(Index: Integer): boolean;
begin
  Result := Fadditional_attributes_Specified;
end;

procedure catalogProductRequestAttributes.Setattributes(Index: Integer; const AArrayOfString: ArrayOfString);
begin
  Fattributes := AArrayOfString;
  Fattributes_Specified := True;
end;

function catalogProductRequestAttributes.attributes_Specified(Index: Integer): boolean;
begin
  Result := Fattributes_Specified;
end;

procedure catalogProductRequestAttributes.Setadditional_attributes(Index: Integer; const AArrayOfString: ArrayOfString);
begin
  Fadditional_attributes := AArrayOfString;
  Fadditional_attributes_Specified := True;
end;

function catalogProductRequestAttributes.additional_attributes_Specified(Index: Integer): boolean;
begin
  Result := Fadditional_attributes_Specified;
end;

procedure catalogCategoryEntityCreate.Setname_(Index: Integer; const Astring: string);
begin
  Fname_ := Astring;
  Fname__Specified := True;
end;

function catalogCategoryEntityCreate.name__Specified(Index: Integer): boolean;
begin
  Result := Fname__Specified;
end;

procedure catalogCategoryEntityCreate.Setis_active(Index: Integer; const AInteger: Integer);
begin
  Fis_active := AInteger;
  Fis_active_Specified := True;
end;

function catalogCategoryEntityCreate.is_active_Specified(Index: Integer): boolean;
begin
  Result := Fis_active_Specified;
end;

procedure catalogCategoryEntityCreate.Setposition(Index: Integer; const AInteger: Integer);
begin
  Fposition := AInteger;
  Fposition_Specified := True;
end;

function catalogCategoryEntityCreate.position_Specified(Index: Integer): boolean;
begin
  Result := Fposition_Specified;
end;

procedure catalogCategoryEntityCreate.Setavailable_sort_by(Index: Integer; const AArrayOfString: ArrayOfString);
begin
  Favailable_sort_by := AArrayOfString;
  Favailable_sort_by_Specified := True;
end;

function catalogCategoryEntityCreate.available_sort_by_Specified(Index: Integer): boolean;
begin
  Result := Favailable_sort_by_Specified;
end;

procedure catalogCategoryEntityCreate.Setcustom_design(Index: Integer; const Astring: string);
begin
  Fcustom_design := Astring;
  Fcustom_design_Specified := True;
end;

function catalogCategoryEntityCreate.custom_design_Specified(Index: Integer): boolean;
begin
  Result := Fcustom_design_Specified;
end;

procedure catalogCategoryEntityCreate.Setcustom_design_apply(Index: Integer; const AInteger: Integer);
begin
  Fcustom_design_apply := AInteger;
  Fcustom_design_apply_Specified := True;
end;

function catalogCategoryEntityCreate.custom_design_apply_Specified(Index: Integer): boolean;
begin
  Result := Fcustom_design_apply_Specified;
end;

procedure catalogCategoryEntityCreate.Setcustom_design_from(Index: Integer; const Astring: string);
begin
  Fcustom_design_from := Astring;
  Fcustom_design_from_Specified := True;
end;

function catalogCategoryEntityCreate.custom_design_from_Specified(Index: Integer): boolean;
begin
  Result := Fcustom_design_from_Specified;
end;

procedure catalogCategoryEntityCreate.Setcustom_design_to(Index: Integer; const Astring: string);
begin
  Fcustom_design_to := Astring;
  Fcustom_design_to_Specified := True;
end;

function catalogCategoryEntityCreate.custom_design_to_Specified(Index: Integer): boolean;
begin
  Result := Fcustom_design_to_Specified;
end;

procedure catalogCategoryEntityCreate.Setcustom_layout_update(Index: Integer; const Astring: string);
begin
  Fcustom_layout_update := Astring;
  Fcustom_layout_update_Specified := True;
end;

function catalogCategoryEntityCreate.custom_layout_update_Specified(Index: Integer): boolean;
begin
  Result := Fcustom_layout_update_Specified;
end;

procedure catalogCategoryEntityCreate.Setdefault_sort_by(Index: Integer; const Astring: string);
begin
  Fdefault_sort_by := Astring;
  Fdefault_sort_by_Specified := True;
end;

function catalogCategoryEntityCreate.default_sort_by_Specified(Index: Integer): boolean;
begin
  Result := Fdefault_sort_by_Specified;
end;

procedure catalogCategoryEntityCreate.Setdescription(Index: Integer; const Astring: string);
begin
  Fdescription := Astring;
  Fdescription_Specified := True;
end;

function catalogCategoryEntityCreate.description_Specified(Index: Integer): boolean;
begin
  Result := Fdescription_Specified;
end;

procedure catalogCategoryEntityCreate.Setdisplay_mode(Index: Integer; const Astring: string);
begin
  Fdisplay_mode := Astring;
  Fdisplay_mode_Specified := True;
end;

function catalogCategoryEntityCreate.display_mode_Specified(Index: Integer): boolean;
begin
  Result := Fdisplay_mode_Specified;
end;

procedure catalogCategoryEntityCreate.Setis_anchor(Index: Integer; const AInteger: Integer);
begin
  Fis_anchor := AInteger;
  Fis_anchor_Specified := True;
end;

function catalogCategoryEntityCreate.is_anchor_Specified(Index: Integer): boolean;
begin
  Result := Fis_anchor_Specified;
end;

procedure catalogCategoryEntityCreate.Setlanding_page(Index: Integer; const AInteger: Integer);
begin
  Flanding_page := AInteger;
  Flanding_page_Specified := True;
end;

function catalogCategoryEntityCreate.landing_page_Specified(Index: Integer): boolean;
begin
  Result := Flanding_page_Specified;
end;

procedure catalogCategoryEntityCreate.Setmeta_description(Index: Integer; const Astring: string);
begin
  Fmeta_description := Astring;
  Fmeta_description_Specified := True;
end;

function catalogCategoryEntityCreate.meta_description_Specified(Index: Integer): boolean;
begin
  Result := Fmeta_description_Specified;
end;

procedure catalogCategoryEntityCreate.Setmeta_keywords(Index: Integer; const Astring: string);
begin
  Fmeta_keywords := Astring;
  Fmeta_keywords_Specified := True;
end;

function catalogCategoryEntityCreate.meta_keywords_Specified(Index: Integer): boolean;
begin
  Result := Fmeta_keywords_Specified;
end;

procedure catalogCategoryEntityCreate.Setmeta_title(Index: Integer; const Astring: string);
begin
  Fmeta_title := Astring;
  Fmeta_title_Specified := True;
end;

function catalogCategoryEntityCreate.meta_title_Specified(Index: Integer): boolean;
begin
  Result := Fmeta_title_Specified;
end;

procedure catalogCategoryEntityCreate.Setpage_layout(Index: Integer; const Astring: string);
begin
  Fpage_layout := Astring;
  Fpage_layout_Specified := True;
end;

function catalogCategoryEntityCreate.page_layout_Specified(Index: Integer): boolean;
begin
  Result := Fpage_layout_Specified;
end;

procedure catalogCategoryEntityCreate.Seturl_key(Index: Integer; const Astring: string);
begin
  Furl_key := Astring;
  Furl_key_Specified := True;
end;

function catalogCategoryEntityCreate.url_key_Specified(Index: Integer): boolean;
begin
  Result := Furl_key_Specified;
end;

procedure catalogCategoryEntityCreate.Setinclude_in_menu(Index: Integer; const AInteger: Integer);
begin
  Finclude_in_menu := AInteger;
  Finclude_in_menu_Specified := True;
end;

function catalogCategoryEntityCreate.include_in_menu_Specified(Index: Integer): boolean;
begin
  Result := Finclude_in_menu_Specified;
end;

procedure catalogCategoryInfo.Setcreated_at(Index: Integer; const Astring: string);
begin
  Fcreated_at := Astring;
  Fcreated_at_Specified := True;
end;

function catalogCategoryInfo.created_at_Specified(Index: Integer): boolean;
begin
  Result := Fcreated_at_Specified;
end;

procedure catalogCategoryInfo.Setupdated_at(Index: Integer; const Astring: string);
begin
  Fupdated_at := Astring;
  Fupdated_at_Specified := True;
end;

function catalogCategoryInfo.updated_at_Specified(Index: Integer): boolean;
begin
  Result := Fupdated_at_Specified;
end;

procedure catalogCategoryInfo.Setname_(Index: Integer; const Astring: string);
begin
  Fname_ := Astring;
  Fname__Specified := True;
end;

function catalogCategoryInfo.name__Specified(Index: Integer): boolean;
begin
  Result := Fname__Specified;
end;

procedure catalogCategoryInfo.Seturl_key(Index: Integer; const Astring: string);
begin
  Furl_key := Astring;
  Furl_key_Specified := True;
end;

function catalogCategoryInfo.url_key_Specified(Index: Integer): boolean;
begin
  Result := Furl_key_Specified;
end;

procedure catalogCategoryInfo.Setdescription(Index: Integer; const Astring: string);
begin
  Fdescription := Astring;
  Fdescription_Specified := True;
end;

function catalogCategoryInfo.description_Specified(Index: Integer): boolean;
begin
  Result := Fdescription_Specified;
end;

procedure catalogCategoryInfo.Setmeta_title(Index: Integer; const Astring: string);
begin
  Fmeta_title := Astring;
  Fmeta_title_Specified := True;
end;

function catalogCategoryInfo.meta_title_Specified(Index: Integer): boolean;
begin
  Result := Fmeta_title_Specified;
end;

procedure catalogCategoryInfo.Setmeta_keywords(Index: Integer; const Astring: string);
begin
  Fmeta_keywords := Astring;
  Fmeta_keywords_Specified := True;
end;

function catalogCategoryInfo.meta_keywords_Specified(Index: Integer): boolean;
begin
  Result := Fmeta_keywords_Specified;
end;

procedure catalogCategoryInfo.Setmeta_description(Index: Integer; const Astring: string);
begin
  Fmeta_description := Astring;
  Fmeta_description_Specified := True;
end;

function catalogCategoryInfo.meta_description_Specified(Index: Integer): boolean;
begin
  Result := Fmeta_description_Specified;
end;

procedure catalogCategoryInfo.Setpath(Index: Integer; const Astring: string);
begin
  Fpath := Astring;
  Fpath_Specified := True;
end;

function catalogCategoryInfo.path_Specified(Index: Integer): boolean;
begin
  Result := Fpath_Specified;
end;

procedure catalogCategoryInfo.Seturl_path(Index: Integer; const Astring: string);
begin
  Furl_path := Astring;
  Furl_path_Specified := True;
end;

function catalogCategoryInfo.url_path_Specified(Index: Integer): boolean;
begin
  Result := Furl_path_Specified;
end;

procedure catalogCategoryInfo.Setchildren_count(Index: Integer; const AInteger: Integer);
begin
  Fchildren_count := AInteger;
  Fchildren_count_Specified := True;
end;

function catalogCategoryInfo.children_count_Specified(Index: Integer): boolean;
begin
  Result := Fchildren_count_Specified;
end;

procedure catalogCategoryInfo.Setdisplay_mode(Index: Integer; const Astring: string);
begin
  Fdisplay_mode := Astring;
  Fdisplay_mode_Specified := True;
end;

function catalogCategoryInfo.display_mode_Specified(Index: Integer): boolean;
begin
  Result := Fdisplay_mode_Specified;
end;

procedure catalogCategoryInfo.Setis_anchor(Index: Integer; const AInteger: Integer);
begin
  Fis_anchor := AInteger;
  Fis_anchor_Specified := True;
end;

function catalogCategoryInfo.is_anchor_Specified(Index: Integer): boolean;
begin
  Result := Fis_anchor_Specified;
end;

procedure catalogCategoryInfo.Setavailable_sort_by(Index: Integer; const AArrayOfString: ArrayOfString);
begin
  Favailable_sort_by := AArrayOfString;
  Favailable_sort_by_Specified := True;
end;

function catalogCategoryInfo.available_sort_by_Specified(Index: Integer): boolean;
begin
  Result := Favailable_sort_by_Specified;
end;

procedure catalogCategoryInfo.Setcustom_design(Index: Integer; const Astring: string);
begin
  Fcustom_design := Astring;
  Fcustom_design_Specified := True;
end;

function catalogCategoryInfo.custom_design_Specified(Index: Integer): boolean;
begin
  Result := Fcustom_design_Specified;
end;

procedure catalogCategoryInfo.Setcustom_design_apply(Index: Integer; const Astring: string);
begin
  Fcustom_design_apply := Astring;
  Fcustom_design_apply_Specified := True;
end;

function catalogCategoryInfo.custom_design_apply_Specified(Index: Integer): boolean;
begin
  Result := Fcustom_design_apply_Specified;
end;

procedure catalogCategoryInfo.Setcustom_design_from(Index: Integer; const Astring: string);
begin
  Fcustom_design_from := Astring;
  Fcustom_design_from_Specified := True;
end;

function catalogCategoryInfo.custom_design_from_Specified(Index: Integer): boolean;
begin
  Result := Fcustom_design_from_Specified;
end;

procedure catalogCategoryInfo.Setcustom_design_to(Index: Integer; const Astring: string);
begin
  Fcustom_design_to := Astring;
  Fcustom_design_to_Specified := True;
end;

function catalogCategoryInfo.custom_design_to_Specified(Index: Integer): boolean;
begin
  Result := Fcustom_design_to_Specified;
end;

procedure catalogCategoryInfo.Setpage_layout(Index: Integer; const Astring: string);
begin
  Fpage_layout := Astring;
  Fpage_layout_Specified := True;
end;

function catalogCategoryInfo.page_layout_Specified(Index: Integer): boolean;
begin
  Result := Fpage_layout_Specified;
end;

procedure catalogCategoryInfo.Setcustom_layout_update(Index: Integer; const Astring: string);
begin
  Fcustom_layout_update := Astring;
  Fcustom_layout_update_Specified := True;
end;

function catalogCategoryInfo.custom_layout_update_Specified(Index: Integer): boolean;
begin
  Result := Fcustom_layout_update_Specified;
end;

procedure catalogCategoryInfo.Setdefault_sort_by(Index: Integer; const Astring: string);
begin
  Fdefault_sort_by := Astring;
  Fdefault_sort_by_Specified := True;
end;

function catalogCategoryInfo.default_sort_by_Specified(Index: Integer): boolean;
begin
  Result := Fdefault_sort_by_Specified;
end;

procedure catalogCategoryInfo.Setlanding_page(Index: Integer; const AInteger: Integer);
begin
  Flanding_page := AInteger;
  Flanding_page_Specified := True;
end;

function catalogCategoryInfo.landing_page_Specified(Index: Integer): boolean;
begin
  Result := Flanding_page_Specified;
end;

procedure catalogProductTypeEntity.Settype_(Index: Integer; const Astring: string);
begin
  Ftype_ := Astring;
  Ftype__Specified := True;
end;

function catalogProductTypeEntity.type__Specified(Index: Integer): boolean;
begin
  Result := Ftype__Specified;
end;

procedure catalogProductTypeEntity.Setlabel_(Index: Integer; const Astring: string);
begin
  Flabel_ := Astring;
  Flabel__Specified := True;
end;

function catalogProductTypeEntity.label__Specified(Index: Integer): boolean;
begin
  Result := Flabel__Specified;
end;

procedure catalogProductTierPriceEntity.Setcustomer_group_id(Index: Integer; const Astring: string);
begin
  Fcustomer_group_id := Astring;
  Fcustomer_group_id_Specified := True;
end;

function catalogProductTierPriceEntity.customer_group_id_Specified(Index: Integer): boolean;
begin
  Result := Fcustomer_group_id_Specified;
end;

procedure catalogProductTierPriceEntity.Setwebsite(Index: Integer; const Astring: string);
begin
  Fwebsite := Astring;
  Fwebsite_Specified := True;
end;

function catalogProductTierPriceEntity.website_Specified(Index: Integer): boolean;
begin
  Result := Fwebsite_Specified;
end;

procedure catalogProductTierPriceEntity.Setqty(Index: Integer; const AInteger: Integer);
begin
  Fqty := AInteger;
  Fqty_Specified := True;
end;

function catalogProductTierPriceEntity.qty_Specified(Index: Integer): boolean;
begin
  Result := Fqty_Specified;
end;

procedure catalogProductTierPriceEntity.Setprice(Index: Integer; const ADouble: Double);
begin
  Fprice := ADouble;
  Fprice_Specified := True;
end;

function catalogProductTierPriceEntity.price_Specified(Index: Integer): boolean;
begin
  Result := Fprice_Specified;
end;

destructor catalogCategoryEntity.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Fchildren)-1 do
    SysUtils.FreeAndNil(Fchildren[I]);
  System.SetLength(Fchildren, 0);
  inherited Destroy;
end;

destructor catalogCategoryTree.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Fchildren)-1 do
    SysUtils.FreeAndNil(Fchildren[I]);
  System.SetLength(Fchildren, 0);
  inherited Destroy;
end;

initialization
  { Mage_Api_Model_Server_V2_HandlerPortType }
  InvRegistry.RegisterInterface(TypeInfo(Mage_Api_Model_Server_V2_HandlerPortType), 'urn:Magento', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(Mage_Api_Model_Server_V2_HandlerPortType), 'urn:Mage_Api_Model_Server_V2_HandlerAction');
  { Mage_Api_Model_Server_V2_HandlerPortType.catalogProductCreate }
  InvRegistry.RegisterParamInfo(TypeInfo(Mage_Api_Model_Server_V2_HandlerPortType), 'catalogProductCreate', 'type_', 'type', '');
  InvRegistry.RegisterParamInfo(TypeInfo(Mage_Api_Model_Server_V2_HandlerPortType), 'catalogProductCreate', 'set_', 'set', '');
  { Mage_Api_Model_Server_V2_HandlerPortType.catalogProductAttributeMediaInfo }
  InvRegistry.RegisterParamInfo(TypeInfo(Mage_Api_Model_Server_V2_HandlerPortType), 'catalogProductAttributeMediaInfo', 'file_', 'file', '');
  { Mage_Api_Model_Server_V2_HandlerPortType.catalogProductAttributeMediaUpdate }
  InvRegistry.RegisterParamInfo(TypeInfo(Mage_Api_Model_Server_V2_HandlerPortType), 'catalogProductAttributeMediaUpdate', 'file_', 'file', '');
  { Mage_Api_Model_Server_V2_HandlerPortType.catalogProductAttributeMediaRemove }
  InvRegistry.RegisterParamInfo(TypeInfo(Mage_Api_Model_Server_V2_HandlerPortType), 'catalogProductAttributeMediaRemove', 'file_', 'file', '');
  { Mage_Api_Model_Server_V2_HandlerPortType.catalogProductLinkList }
  InvRegistry.RegisterParamInfo(TypeInfo(Mage_Api_Model_Server_V2_HandlerPortType), 'catalogProductLinkList', 'type_', 'type', '');
  { Mage_Api_Model_Server_V2_HandlerPortType.catalogProductLinkAssign }
  InvRegistry.RegisterParamInfo(TypeInfo(Mage_Api_Model_Server_V2_HandlerPortType), 'catalogProductLinkAssign', 'type_', 'type', '');
  { Mage_Api_Model_Server_V2_HandlerPortType.catalogProductLinkUpdate }
  InvRegistry.RegisterParamInfo(TypeInfo(Mage_Api_Model_Server_V2_HandlerPortType), 'catalogProductLinkUpdate', 'type_', 'type', '');
  { Mage_Api_Model_Server_V2_HandlerPortType.catalogProductLinkRemove }
  InvRegistry.RegisterParamInfo(TypeInfo(Mage_Api_Model_Server_V2_HandlerPortType), 'catalogProductLinkRemove', 'type_', 'type', '');
  { Mage_Api_Model_Server_V2_HandlerPortType.catalogProductLinkAttributes }
  InvRegistry.RegisterParamInfo(TypeInfo(Mage_Api_Model_Server_V2_HandlerPortType), 'catalogProductLinkAttributes', 'type_', 'type', '');
  RemClassRegistry.RegisterXSInfo(TypeInfo(salesOrderShipmentEntityArray), 'urn:Magento', 'salesOrderShipmentEntityArray');
  RemClassRegistry.RegisterXSInfo(TypeInfo(salesOrderShipmentCommentEntityArray), 'urn:Magento', 'salesOrderShipmentCommentEntityArray');
  RemClassRegistry.RegisterXSInfo(TypeInfo(orderItemIdQtyArray), 'urn:Magento', 'orderItemIdQtyArray');
  RemClassRegistry.RegisterXSInfo(TypeInfo(salesOrderShipmentTrackEntityArray), 'urn:Magento', 'salesOrderShipmentTrackEntityArray');
  RemClassRegistry.RegisterXSInfo(TypeInfo(salesOrderShipmentItemEntityArray), 'urn:Magento', 'salesOrderShipmentItemEntityArray');
  RemClassRegistry.RegisterXSInfo(TypeInfo(salesOrderCreditmemoCommentEntityArray), 'urn:Magento', 'salesOrderCreditmemoCommentEntityArray');
  RemClassRegistry.RegisterXSInfo(TypeInfo(salesOrderCreditmemoItemEntityArray), 'urn:Magento', 'salesOrderCreditmemoItemEntityArray');
  RemClassRegistry.RegisterXSInfo(TypeInfo(salesOrderCreditmemoEntityArray), 'urn:Magento', 'salesOrderCreditmemoEntityArray');
  RemClassRegistry.RegisterXSInfo(TypeInfo(salesOrderInvoiceCommentEntityArray), 'urn:Magento', 'salesOrderInvoiceCommentEntityArray');
  RemClassRegistry.RegisterXSInfo(TypeInfo(salesOrderInvoiceItemEntityArray), 'urn:Magento', 'salesOrderInvoiceItemEntityArray');
  RemClassRegistry.RegisterXSInfo(TypeInfo(salesOrderInvoiceEntityArray), 'urn:Magento', 'salesOrderInvoiceEntityArray');
  RemClassRegistry.RegisterXSInfo(TypeInfo(salesOrderItemEntityArray), 'urn:Magento', 'salesOrderItemEntityArray');
  RemClassRegistry.RegisterXSInfo(TypeInfo(catalogProductCustomOptionValueListArray), 'urn:Magento', 'catalogProductCustomOptionValueListArray');
  RemClassRegistry.RegisterXSInfo(TypeInfo(catalogProductCustomOptionValueAddArray), 'urn:Magento', 'catalogProductCustomOptionValueAddArray');
  RemClassRegistry.RegisterXSInfo(TypeInfo(salesOrderStatusHistoryEntityArray), 'urn:Magento', 'salesOrderStatusHistoryEntityArray');
  RemClassRegistry.RegisterXSInfo(TypeInfo(salesOrderListEntityArray), 'urn:Magento', 'salesOrderListEntityArray');
  RemClassRegistry.RegisterXSInfo(TypeInfo(catalogProductCustomOptionTypesArray), 'urn:Magento', 'catalogProductCustomOptionTypesArray');
  RemClassRegistry.RegisterXSInfo(TypeInfo(catalogProductCustomOptionListArray), 'urn:Magento', 'catalogProductCustomOptionListArray');
  RemClassRegistry.RegisterXSInfo(TypeInfo(catalogProductCustomOptionAdditionalFieldsArray), 'urn:Magento', 'catalogProductCustomOptionAdditionalFieldsArray');
  RemClassRegistry.RegisterXSInfo(TypeInfo(giftMessageResponseArray), 'urn:Magento', 'giftMessageResponseArray');
  RemClassRegistry.RegisterXSInfo(TypeInfo(giftMessageAssociativeProductsEntityArray), 'urn:Magento', 'giftMessageAssociativeProductsEntityArray');
  RemClassRegistry.RegisterXSClass(giftMessageAssociativeProductsEntity, 'urn:Magento', 'giftMessageAssociativeProductsEntity');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(giftMessageAssociativeProductsEntity), 'message_', '[ExtName="message"]');
  RemClassRegistry.RegisterXSInfo(TypeInfo(shoppingCartPaymentMethodResponseEntityArray), 'urn:Magento', 'shoppingCartPaymentMethodResponseEntityArray');
  RemClassRegistry.RegisterXSInfo(TypeInfo(catalogProductTagListEntityArray), 'urn:Magento', 'catalogProductTagListEntityArray');
  RemClassRegistry.RegisterXSInfo(TypeInfo(catalogProductDownloadableLinkSampleEntityArray), 'urn:Magento', 'catalogProductDownloadableLinkSampleEntityArray');
  RemClassRegistry.RegisterXSInfo(TypeInfo(catalogProductDownloadableLinkEntityArray), 'urn:Magento', 'catalogProductDownloadableLinkEntityArray');
  RemClassRegistry.RegisterXSClass(catalogProductDownloadableLinkInfoEntity, 'urn:Magento', 'catalogProductDownloadableLinkInfoEntity');
  RemClassRegistry.RegisterXSInfo(TypeInfo(catalogProductDownloadableLinkFileInfoEntityArray), 'urn:Magento', 'catalogProductDownloadableLinkFileInfoEntityArray');
  RemClassRegistry.RegisterXSInfo(TypeInfo(shoppingCartItemEntityArray), 'urn:Magento', 'shoppingCartItemEntityArray');
  RemClassRegistry.RegisterXSInfo(TypeInfo(shoppingCartTotalsEntityArray), 'urn:Magento', 'shoppingCartTotalsEntityArray');
  RemClassRegistry.RegisterXSInfo(TypeInfo(catalogInventoryStockItemEntityArray), 'urn:Magento', 'catalogInventoryStockItemEntityArray');
  RemClassRegistry.RegisterXSInfo(TypeInfo(catalogInventoryStockItemUpdateEntityArray), 'urn:Magento', 'catalogInventoryStockItemUpdateEntityArray');
  RemClassRegistry.RegisterXSInfo(TypeInfo(shoppingCartCustomerAddressEntityArray), 'urn:Magento', 'shoppingCartCustomerAddressEntityArray');
  RemClassRegistry.RegisterXSInfo(TypeInfo(shoppingCartShippingMethodEntityArray), 'urn:Magento', 'shoppingCartShippingMethodEntityArray');
  RemClassRegistry.RegisterXSInfo(TypeInfo(shoppingCartLicenseEntityArray), 'urn:Magento', 'shoppingCartLicenseEntityArray');
  RemClassRegistry.RegisterXSInfo(TypeInfo(shoppingCartProductEntityArray), 'urn:Magento', 'shoppingCartProductEntityArray');
  RemClassRegistry.RegisterXSInfo(TypeInfo(shoppingCartProductResponseEntityArray), 'urn:Magento', 'shoppingCartProductResponseEntityArray');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfExistsFaltures), 'urn:Magento', 'ArrayOfExistsFaltures');
  RemClassRegistry.RegisterXSInfo(TypeInfo(storeEntityArray), 'urn:Magento', 'storeEntityArray');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfApiMethods), 'urn:Magento', 'ArrayOfApiMethods');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfApis), 'urn:Magento', 'ArrayOfApis');
  RemClassRegistry.RegisterXSInfo(TypeInfo(customerGroupEntityArray), 'urn:Magento', 'customerGroupEntityArray');
  RemClassRegistry.RegisterXSInfo(TypeInfo(customerAddressEntityArray), 'urn:Magento', 'customerAddressEntityArray');
  RemClassRegistry.RegisterXSInfo(TypeInfo(customerCustomerEntityArray), 'urn:Magento', 'customerCustomerEntityArray');
  RemClassRegistry.RegisterXSInfo(TypeInfo(directoryCountryEntityArray), 'urn:Magento', 'directoryCountryEntityArray');
  RemClassRegistry.RegisterXSInfo(TypeInfo(directoryRegionEntityArray), 'urn:Magento', 'directoryRegionEntityArray');
  RemClassRegistry.RegisterXSInfo(TypeInfo(complexFilterArray), 'urn:Magento', 'complexFilterArray');
  RemClassRegistry.RegisterXSClass(ID2, 'http://schemas.xmlsoap.org/soap/encoding/', 'ID2', 'ID');
  RemClassRegistry.RegisterXSClass(directoryRegionEntity, 'urn:Magento', 'directoryRegionEntity');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(directoryRegionEntity), 'name_', '[ExtName="name"]');
  RemClassRegistry.RegisterXSClass(complexFilter, 'urn:Magento', 'complexFilter');
  RemClassRegistry.RegisterXSClass(existsFaltureEntity, 'urn:Magento', 'existsFaltureEntity');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(existsFaltureEntity), 'message_', '[ExtName="message"]');
  RemClassRegistry.RegisterXSClass(magentoInfoEntity, 'urn:Magento', 'magentoInfoEntity');
  RemClassRegistry.RegisterXSClass(directoryCountryEntity, 'urn:Magento', 'directoryCountryEntity');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(directoryCountryEntity), 'name_', '[ExtName="name"]');
  RemClassRegistry.RegisterXSClass(catalogProductCustomOptionAdditionalFieldsEntity, 'urn:Magento', 'catalogProductCustomOptionAdditionalFieldsEntity');
  RemClassRegistry.RegisterXSClass(shoppingCartPaymentMethodEntity, 'urn:Magento', 'shoppingCartPaymentMethodEntity');
  RemClassRegistry.RegisterXSClass(catalogInventoryStockItemEntity, 'urn:Magento', 'catalogInventoryStockItemEntity');
  RemClassRegistry.RegisterXSClass(shoppingCartPaymentEntity, 'urn:Magento', 'shoppingCartPaymentEntity');
  RemClassRegistry.RegisterXSClass(catalogProductDownloadableLinkAddSampleEntity, 'urn:Magento', 'catalogProductDownloadableLinkAddSampleEntity');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(catalogProductDownloadableLinkAddSampleEntity), 'type_', '[ExtName="type"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(catalogProductDownloadableLinkAddSampleEntity), 'file_', '[ExtName="file"]');
  RemClassRegistry.RegisterXSClass(catalogProductDownloadableLinkSampleEntity, 'urn:Magento', 'catalogProductDownloadableLinkSampleEntity');
  RemClassRegistry.RegisterXSClass(catalogProductDownloadableLinkFileEntity, 'urn:Magento', 'catalogProductDownloadableLinkFileEntity');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(catalogProductDownloadableLinkFileEntity), 'name_', '[ExtName="name"]');
  RemClassRegistry.RegisterXSClass(catalogProductTagAddEntity, 'urn:Magento', 'catalogProductTagAddEntity');
  RemClassRegistry.RegisterXSClass(catalogProductTagUpdateEntity, 'urn:Magento', 'catalogProductTagUpdateEntity');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(catalogProductTagUpdateEntity), 'name_', '[ExtName="name"]');
  RemClassRegistry.RegisterXSClass(catalogProductTagListEntity, 'urn:Magento', 'catalogProductTagListEntity');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(catalogProductTagListEntity), 'name_', '[ExtName="name"]');
  RemClassRegistry.RegisterXSClass(giftMessageEntity, 'urn:Magento', 'giftMessageEntity');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(giftMessageEntity), 'to_', '[ExtName="to"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(giftMessageEntity), 'message_', '[ExtName="message"]');
  RemClassRegistry.RegisterXSClass(catalogProductCustomOptionTypesEntity, 'urn:Magento', 'catalogProductCustomOptionTypesEntity');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(catalogProductCustomOptionTypesEntity), 'label_', '[ExtName="label"]');
  RemClassRegistry.RegisterXSClass(salesOrderPaymentEntity, 'urn:Magento', 'salesOrderPaymentEntity');
  RemClassRegistry.RegisterXSClass(salesOrderItemEntity, 'urn:Magento', 'salesOrderItemEntity');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(salesOrderItemEntity), 'name_', '[ExtName="name"]');
  RemClassRegistry.RegisterXSClass(salesOrderListEntity, 'urn:Magento', 'salesOrderListEntity');
  RemClassRegistry.RegisterXSClass(catalogProductCustomOptionValueUpdateEntity, 'urn:Magento', 'catalogProductCustomOptionValueUpdateEntity');
  RemClassRegistry.RegisterXSClass(catalogProductCustomOptionValueListEntity, 'urn:Magento', 'catalogProductCustomOptionValueListEntity');
  RemClassRegistry.RegisterXSClass(catalogProductSpecialPriceReturnEntity, 'urn:Magento', 'catalogProductSpecialPriceReturnEntity');
  RemClassRegistry.RegisterXSClass(salesOrderAddressEntity, 'urn:Magento', 'salesOrderAddressEntity');
  RemClassRegistry.RegisterXSClass(salesOrderEntity, 'urn:Magento', 'salesOrderEntity');
  RemClassRegistry.RegisterXSClass(catalogProductCustomOptionValueInfoEntity, 'urn:Magento', 'catalogProductCustomOptionValueInfoEntity');
  RemClassRegistry.RegisterXSClass(catalogProductCustomOptionValueAddEntity, 'urn:Magento', 'catalogProductCustomOptionValueAddEntity');
  RemClassRegistry.RegisterXSClass(salesOrderInvoiceItemEntity, 'urn:Magento', 'salesOrderInvoiceItemEntity');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(salesOrderInvoiceItemEntity), 'name_', '[ExtName="name"]');
  RemClassRegistry.RegisterXSClass(salesOrderInvoiceCommentEntity, 'urn:Magento', 'salesOrderInvoiceCommentEntity');
  RemClassRegistry.RegisterXSClass(salesOrderInvoiceEntity, 'urn:Magento', 'salesOrderInvoiceEntity');
  RemClassRegistry.RegisterXSClass(salesOrderCreditmemoItemEntity, 'urn:Magento', 'salesOrderCreditmemoItemEntity');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(salesOrderCreditmemoItemEntity), 'name_', '[ExtName="name"]');
  RemClassRegistry.RegisterXSClass(salesOrderCreditmemoCommentEntity, 'urn:Magento', 'salesOrderCreditmemoCommentEntity');
  RemClassRegistry.RegisterXSClass(salesOrderCreditmemoEntity, 'urn:Magento', 'salesOrderCreditmemoEntity');
  RemClassRegistry.RegisterXSClass(salesOrderShipmentEntity, 'urn:Magento', 'salesOrderShipmentEntity');
  RemClassRegistry.RegisterXSClass(salesOrderStatusHistoryEntity, 'urn:Magento', 'salesOrderStatusHistoryEntity');
  RemClassRegistry.RegisterXSClass(salesOrderShipmentCommentEntity, 'urn:Magento', 'salesOrderShipmentCommentEntity');
  RemClassRegistry.RegisterXSClass(salesOrderShipmentTrackEntity, 'urn:Magento', 'salesOrderShipmentTrackEntity');
  RemClassRegistry.RegisterXSClass(salesOrderShipmentItemEntity, 'urn:Magento', 'salesOrderShipmentItemEntity');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(salesOrderShipmentItemEntity), 'name_', '[ExtName="name"]');
  RemClassRegistry.RegisterXSClass(int2, 'http://schemas.xmlsoap.org/soap/encoding/', 'int2', 'int');
  RemClassRegistry.RegisterXSClass(customerCustomerEntityToCreate, 'urn:Magento', 'customerCustomerEntityToCreate');
  RemClassRegistry.RegisterXSClass(customerGroupEntity, 'urn:Magento', 'customerGroupEntity');
  RemClassRegistry.RegisterXSClass(storeEntity, 'urn:Magento', 'storeEntity');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(storeEntity), 'name_', '[ExtName="name"]');
  RemClassRegistry.RegisterXSClass(shoppingCartCustomerEntity, 'urn:Magento', 'shoppingCartCustomerEntity');
  RemClassRegistry.RegisterXSClass(shoppingCartCustomerAddressEntity, 'urn:Magento', 'shoppingCartCustomerAddressEntity');
  RemClassRegistry.RegisterXSClass(shoppingCartLicenseEntity, 'urn:Magento', 'shoppingCartLicenseEntity');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(shoppingCartLicenseEntity), 'name_', '[ExtName="name"]');
  RemClassRegistry.RegisterXSClass(catalogProductDownloadableLinkEntity, 'urn:Magento', 'catalogProductDownloadableLinkEntity');
  RemClassRegistry.RegisterXSClass(catalogProductDownloadableLinkFileInfoEntity, 'urn:Magento', 'catalogProductDownloadableLinkFileInfoEntity');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(catalogProductDownloadableLinkFileInfoEntity), 'file_', '[ExtName="file"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(catalogProductDownloadableLinkFileInfoEntity), 'name_', '[ExtName="name"]');
  RemClassRegistry.RegisterXSClass(catalogProductDownloadableLinkAddEntity, 'urn:Magento', 'catalogProductDownloadableLinkAddEntity');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(catalogProductDownloadableLinkAddEntity), 'type_', '[ExtName="type"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(catalogProductDownloadableLinkAddEntity), 'file_', '[ExtName="file"]');
  RemClassRegistry.RegisterXSClass(catalogProductCustomOptionToAdd, 'urn:Magento', 'catalogProductCustomOptionToAdd');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(catalogProductCustomOptionToAdd), 'type_', '[ExtName="type"]');
  RemClassRegistry.RegisterXSClass(catalogProductCustomOptionInfoEntity, 'urn:Magento', 'catalogProductCustomOptionInfoEntity');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(catalogProductCustomOptionInfoEntity), 'type_', '[ExtName="type"]');
  RemClassRegistry.RegisterXSClass(catalogProductCustomOptionToUpdate, 'urn:Magento', 'catalogProductCustomOptionToUpdate');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(catalogProductCustomOptionToUpdate), 'type_', '[ExtName="type"]');
  RemClassRegistry.RegisterXSClass(catalogProductCustomOptionListEntity, 'urn:Magento', 'catalogProductCustomOptionListEntity');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(catalogProductCustomOptionListEntity), 'type_', '[ExtName="type"]');
  RemClassRegistry.RegisterXSClass(string_2, 'http://schemas.xmlsoap.org/soap/encoding/', 'string_2', 'string');
  RemClassRegistry.RegisterXSClass(customerCustomerEntity, 'urn:Magento', 'customerCustomerEntity');
  RemClassRegistry.RegisterXSClass(customerAddressEntityItem, 'urn:Magento', 'customerAddressEntityItem');
  RemClassRegistry.RegisterXSClass(giftMessageResponse, 'urn:Magento', 'giftMessageResponse');
  RemClassRegistry.RegisterXSClass(boolean_2, 'http://schemas.xmlsoap.org/soap/encoding/', 'boolean_2', 'boolean');
  RemClassRegistry.RegisterXSClass(boolean_, 'http://schemas.xmlsoap.org/soap/encoding/', 'boolean_', 'boolean');
  RemClassRegistry.RegisterXSClass(anyURI2, 'http://schemas.xmlsoap.org/soap/encoding/', 'anyURI2', 'anyURI');
  RemClassRegistry.RegisterXSClass(double_2, 'http://schemas.xmlsoap.org/soap/encoding/', 'double_2', 'double');
  RemClassRegistry.RegisterXSClass(shoppingCartShippingMethodEntity, 'urn:Magento', 'shoppingCartShippingMethodEntity');
  RemClassRegistry.RegisterXSClass(shoppingCartAddressEntity, 'urn:Magento', 'shoppingCartAddressEntity');
  RemClassRegistry.RegisterXSClass(salesOrderCreditmemoData, 'urn:Magento', 'salesOrderCreditmemoData');
  RemClassRegistry.RegisterXSClass(shoppingCartItemEntity, 'urn:Magento', 'shoppingCartItemEntity');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(shoppingCartItemEntity), 'name_', '[ExtName="name"]');
  RemClassRegistry.RegisterXSClass(shoppingCartTotalsEntity, 'urn:Magento', 'shoppingCartTotalsEntity');
  RemClassRegistry.RegisterXSClass(shoppingCartInfoEntity, 'urn:Magento', 'shoppingCartInfoEntity');
  RemClassRegistry.RegisterXSClass(orderItemIdQty, 'urn:Magento', 'orderItemIdQty');
  RemClassRegistry.RegisterXSInfo(TypeInfo(associativeArray), 'urn:Magento', 'associativeArray');
  RemClassRegistry.RegisterXSClass(shoppingCartPaymentMethodResponseEntity, 'urn:Magento', 'shoppingCartPaymentMethodResponseEntity');
  RemClassRegistry.RegisterXSClass(catalogProductTagInfoEntity, 'urn:Magento', 'catalogProductTagInfoEntity');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(catalogProductTagInfoEntity), 'name_', '[ExtName="name"]');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfString), 'urn:Magento', 'ArrayOfString');
  RemClassRegistry.RegisterXSClass(associativeMultiEntity, 'urn:Magento', 'associativeMultiEntity');
  RemClassRegistry.RegisterXSClass(customerAddressEntityCreate, 'urn:Magento', 'customerAddressEntityCreate');
  RemClassRegistry.RegisterXSClass(apiEntity, 'urn:Magento', 'apiEntity');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(apiEntity), 'name_', '[ExtName="name"]');
  RemClassRegistry.RegisterXSClass(apiMethodEntity, 'urn:Magento', 'apiMethodEntity');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(apiMethodEntity), 'name_', '[ExtName="name"]');
  RemClassRegistry.RegisterXSClass(shoppingCartProductEntity, 'urn:Magento', 'shoppingCartProductEntity');
  RemClassRegistry.RegisterXSClass(filters, 'urn:Magento', 'filters');
  RemClassRegistry.RegisterXSInfo(TypeInfo(associativeMultiArray), 'urn:Magento', 'associativeMultiArray');
  RemClassRegistry.RegisterXSClass(associativeEntity, 'urn:Magento', 'associativeEntity');
  RemClassRegistry.RegisterXSClass(anyURI, 'http://schemas.xmlsoap.org/soap/encoding/', 'anyURI');
  RemClassRegistry.RegisterXSClass(double_, 'http://schemas.xmlsoap.org/soap/encoding/', 'double_', 'double');
  RemClassRegistry.RegisterXSClass(string_, 'http://schemas.xmlsoap.org/soap/encoding/', 'string_', 'string');
  RemClassRegistry.RegisterXSClass(int, 'http://schemas.xmlsoap.org/soap/encoding/', 'int');
  RemClassRegistry.RegisterXSClass(ID, 'http://schemas.xmlsoap.org/soap/encoding/', 'ID');
  RemClassRegistry.RegisterXSInfo(TypeInfo(catalogProductAttributeMediaTypeEntityArray), 'urn:Magento', 'catalogProductAttributeMediaTypeEntityArray');
  RemClassRegistry.RegisterXSClass(catalogProductAttributeMediaTypeEntity, 'urn:Magento', 'catalogProductAttributeMediaTypeEntity');
  RemClassRegistry.RegisterXSClass(catalogProductImageFileEntity, 'urn:Magento', 'catalogProductImageFileEntity');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(catalogProductImageFileEntity), 'name_', '[ExtName="name"]');
  RemClassRegistry.RegisterXSClass(catalogProductLinkEntity, 'urn:Magento', 'catalogProductLinkEntity');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(catalogProductLinkEntity), 'type_', '[ExtName="type"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(catalogProductLinkEntity), 'set_', '[ExtName="set"]');
  RemClassRegistry.RegisterXSClass(catalogProductAttributeMediaCreateEntity, 'urn:Magento', 'catalogProductAttributeMediaCreateEntity');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(catalogProductAttributeMediaCreateEntity), 'file_', '[ExtName="file"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(catalogProductAttributeMediaCreateEntity), 'label_', '[ExtName="label"]');
  RemClassRegistry.RegisterXSInfo(TypeInfo(catalogProductImageEntityArray), 'urn:Magento', 'catalogProductImageEntityArray');
  RemClassRegistry.RegisterXSInfo(TypeInfo(catalogAttributeEntityArray), 'urn:Magento', 'catalogAttributeEntityArray');
  RemClassRegistry.RegisterXSClass(catalogAttributeEntity, 'urn:Magento', 'catalogAttributeEntity');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(catalogAttributeEntity), 'type_', '[ExtName="type"]');
  RemClassRegistry.RegisterXSClass(catalogAttributeOptionEntity, 'urn:Magento', 'catalogAttributeOptionEntity');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(catalogAttributeOptionEntity), 'label_', '[ExtName="label"]');
  RemClassRegistry.RegisterXSClass(catalogProductImageEntity, 'urn:Magento', 'catalogProductImageEntity');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(catalogProductImageEntity), 'file_', '[ExtName="file"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(catalogProductImageEntity), 'label_', '[ExtName="label"]');
  RemClassRegistry.RegisterXSInfo(TypeInfo(catalogAttributeOptionEntityArray), 'urn:Magento', 'catalogAttributeOptionEntityArray');
  RemClassRegistry.RegisterXSClass(catalogProductAttributeOptionLabelEntity, 'urn:Magento', 'catalogProductAttributeOptionLabelEntity');
  RemClassRegistry.RegisterXSInfo(TypeInfo(catalogProductAttributeOptionLabelArray), 'urn:Magento', 'catalogProductAttributeOptionLabelArray');
  RemClassRegistry.RegisterXSClass(catalogProductAttributeOptionEntityToAdd, 'urn:Magento', 'catalogProductAttributeOptionEntityToAdd');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(catalogProductAttributeOptionEntityToAdd), 'label_', '[ExtName="label"]');
  RemClassRegistry.RegisterXSClass(catalogProductLinkAttributeEntity, 'urn:Magento', 'catalogProductLinkAttributeEntity');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(catalogProductLinkAttributeEntity), 'type_', '[ExtName="type"]');
  RemClassRegistry.RegisterXSInfo(TypeInfo(catalogProductLinkEntityArray), 'urn:Magento', 'catalogProductLinkEntityArray');
  RemClassRegistry.RegisterXSInfo(TypeInfo(catalogProductLinkAttributeEntityArray), 'urn:Magento', 'catalogProductLinkAttributeEntityArray');
  RemClassRegistry.RegisterXSInfo(TypeInfo(catalogProductAttributeFrontendLabelArray), 'urn:Magento', 'catalogProductAttributeFrontendLabelArray');
  RemClassRegistry.RegisterXSClass(catalogProductAttributeEntityToCreate, 'urn:Magento', 'catalogProductAttributeEntityToCreate');
  RemClassRegistry.RegisterXSClass(catalogProductAttributeEntityToUpdate, 'urn:Magento', 'catalogProductAttributeEntityToUpdate');
  RemClassRegistry.RegisterXSClass(catalogProductAttributeEntity, 'urn:Magento', 'catalogProductAttributeEntity');
  RemClassRegistry.RegisterXSClass(catalogProductAttributeFrontendLabelEntity, 'urn:Magento', 'catalogProductAttributeFrontendLabelEntity');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(catalogProductAttributeFrontendLabelEntity), 'label_', '[ExtName="label"]');
  RemClassRegistry.RegisterXSInfo(TypeInfo(catalogAssignedProductArray), 'urn:Magento', 'catalogAssignedProductArray');
  RemClassRegistry.RegisterXSClass(catalogInventoryStockItemUpdateEntity, 'urn:Magento', 'catalogInventoryStockItemUpdateEntity');
  RemClassRegistry.RegisterXSInfo(TypeInfo(catalogProductCreateEntityArray), 'urn:Magento', 'catalogProductCreateEntityArray');
  RemClassRegistry.RegisterXSInfo(TypeInfo(catalogProductAttributeSetEntityArray), 'urn:Magento', 'catalogProductAttributeSetEntityArray');
  RemClassRegistry.RegisterXSClass(catalogProductAttributeSetEntity, 'urn:Magento', 'catalogProductAttributeSetEntity');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(catalogProductAttributeSetEntity), 'name_', '[ExtName="name"]');
  RemClassRegistry.RegisterXSInfo(TypeInfo(catalogProductTierPriceEntityArray), 'urn:Magento', 'catalogProductTierPriceEntityArray');
  RemClassRegistry.RegisterXSClass(catalogProductCreateEntity, 'urn:Magento', 'catalogProductCreateEntity');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(catalogProductCreateEntity), 'name_', '[ExtName="name"]');
  RemClassRegistry.RegisterXSClass(catalogProductEntity, 'urn:Magento', 'catalogProductEntity');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(catalogProductEntity), 'name_', '[ExtName="name"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(catalogProductEntity), 'set_', '[ExtName="set"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(catalogProductEntity), 'type_', '[ExtName="type"]');
  RemClassRegistry.RegisterXSInfo(TypeInfo(catalogProductEntityArray), 'urn:Magento', 'catalogProductEntityArray');
  RemClassRegistry.RegisterXSClass(catalogProductAdditionalAttributesEntity, 'urn:Magento', 'catalogProductAdditionalAttributesEntity');
  RemClassRegistry.RegisterXSClass(catalogProductReturnEntity, 'urn:Magento', 'catalogProductReturnEntity');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(catalogProductReturnEntity), 'set_', '[ExtName="set"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(catalogProductReturnEntity), 'type_', '[ExtName="type"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(catalogProductReturnEntity), 'name_', '[ExtName="name"]');
  RemClassRegistry.RegisterXSClass(catalogProductRequestAttributes, 'urn:Magento', 'catalogProductRequestAttributes');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfCatalogCategoryEntitiesNoChildren), 'urn:Magento', 'ArrayOfCatalogCategoryEntitiesNoChildren');
  RemClassRegistry.RegisterXSClass(catalogCategoryEntityCreate, 'urn:Magento', 'catalogCategoryEntityCreate');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(catalogCategoryEntityCreate), 'name_', '[ExtName="name"]');
  RemClassRegistry.RegisterXSClass(catalogAssignedProduct, 'urn:Magento', 'catalogAssignedProduct');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(catalogAssignedProduct), 'type_', '[ExtName="type"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(catalogAssignedProduct), 'set_', '[ExtName="set"]');
  RemClassRegistry.RegisterXSClass(catalogCategoryInfo, 'urn:Magento', 'catalogCategoryInfo');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(catalogCategoryInfo), 'name_', '[ExtName="name"]');
  RemClassRegistry.RegisterXSClass(catalogCategoryEntityNoChildren, 'urn:Magento', 'catalogCategoryEntityNoChildren');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(catalogCategoryEntityNoChildren), 'name_', '[ExtName="name"]');
  RemClassRegistry.RegisterXSInfo(TypeInfo(catalogProductTypeEntityArray), 'urn:Magento', 'catalogProductTypeEntityArray');
  RemClassRegistry.RegisterXSClass(catalogProductTypeEntity, 'urn:Magento', 'catalogProductTypeEntity');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(catalogProductTypeEntity), 'type_', '[ExtName="type"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(catalogProductTypeEntity), 'label_', '[ExtName="label"]');
  RemClassRegistry.RegisterXSClass(catalogProductTierPriceEntity, 'urn:Magento', 'catalogProductTierPriceEntity');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfCatalogCategoryEntities), 'urn:Magento', 'ArrayOfCatalogCategoryEntities');
  RemClassRegistry.RegisterXSClass(catalogCategoryEntity, 'urn:Magento', 'catalogCategoryEntity');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(catalogCategoryEntity), 'name_', '[ExtName="name"]');
  RemClassRegistry.RegisterXSClass(catalogCategoryTree, 'urn:Magento', 'catalogCategoryTree');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(catalogCategoryTree), 'name_', '[ExtName="name"]');

end.