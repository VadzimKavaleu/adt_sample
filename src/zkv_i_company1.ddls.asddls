@AbapCatalog.sqlViewName: 'ZKVICOMPANY'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'company view'
define view ZKV_I_COMPANY1
  as select from zkvcompany
  association [0..*] to ZKV_I_EMPLOYEE1 as _Employee on $projection.Companyuuid = _Employee.Companyuuid
{
  key companyuuid as Companyuuid,
      companyid   as Companyid,
      companyname as Companyname,
      city        as City,
      phone       as Phone,
      status      as Status,
      capacity    as Capacity,
      description as Description,
      @Semantics.user.createdBy: true
      created_by,
      @Semantics.systemDateTime.createdAt: true
      created_at,
      @Semantics.user.lastChangedBy: true
      last_changed_by,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      last_changed_at,

      _Employee
}
