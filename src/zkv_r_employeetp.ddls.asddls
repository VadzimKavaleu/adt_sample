@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'employee transactional view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZKV_R_EMPLOYEETP as select from ZKV_I_EMPLOYEE1
association to parent ZKV_R_COMPANYTP as _Company on $projection.Companyuuid = _Company.Companyuuid
{
    key Employeeuuid,
    Companyuuid,
    Emloyeeid,
    Firstname,
    Secondname,
    @Semantics.amount.currencyCode: 'Currency'
    Salary,
    Currency,
    Age,
    Experience,
    created_at,
    created_by,
    last_changed_at,
    last_changed_by,
    /* Associations */
    _Company
}
