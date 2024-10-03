@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'company view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
@Search.searchable: true
define view entity ZKV_I_COMPANY as select from zkvcompany as _Company
association [0..*] to ZKV_I_EMPLOYEE as _Employee on $projection.Companyuuid = _Employee.Companyuuid
association [0..1] to ZKV_I_CODE as _Code on $projection.Phone = _Code.Phone
{
    key companyuuid as Companyuuid,
    companyid as Companyid,
    @Consumption.valueHelpDefinition: [{ entity:{ name: 'ZKV_I_INFO', element: 'Companyname' } }]
    companyname as Companyname,
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.7
    city as City,
    @ObjectModel.text.association: '_Code'      
    phone as Phone,
    capacity as Capacity,
    @Search.defaultSearchElement: true
    _Employee,
    @Search.defaultSearchElement: true
    _Code
}
