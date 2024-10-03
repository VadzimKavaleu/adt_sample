@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'employee view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
@Search.searchable: true
define view entity ZKV_I_EMPLOYEE as select from zkvemployee as _Employee
association [1..1] to ZKV_I_COMPANY as _Company on $projection.Companyuuid = _Company.Companyuuid
{
    key employeeuuid as Employeeuuid,
    companyuuid as Companyuuid,
    emloyeeid as Emloyeeid,
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.7
    firstname as Firstname,
    secondname as Secondname,
    age as Age,
    experience as Experience,
    _Company
}
