@AbapCatalog.sqlViewName: 'ZKVIEMPLOYEE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'employee view'
define view ZKV_I_EMPLOYEE1
  as select from zkvemployee
  association [1..1] to ZKV_I_COMPANY1 as _Company on $projection.Companyuuid = _Company.Companyuuid
{
  key employeeuuid as Employeeuuid,
      companyuuid  as Companyuuid,
      emloyeeid    as Emloyeeid,
      firstname    as Firstname,
      secondname   as Secondname,
      @Semantics.amount.currencyCode: 'Currency'
      salary       as Salary,
      @Semantics.currencyCode: true
      currency     as Currency,
      age          as Age,
      experience   as Experience,
      @Semantics.user.createdBy: true
      created_by,
      @Semantics.systemDateTime.createdAt: true
      created_at,
      @Semantics.user.lastChangedBy: true
      last_changed_by,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      last_changed_at,
      _Company
}
