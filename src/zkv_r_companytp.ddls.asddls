@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'company transactional view'
define root view entity ZKV_R_COMPANYTP as select from ZKV_I_COMPANY1
composition [0..*] of ZKV_R_EMPLOYEETP as _Employee 

association [0..1] to ZKV_I_CODE as _Code on $projection.Phone = _Code.Phone

{
    key Companyuuid,
    Companyid,
    Companyname,
    City,
    Phone,
    Status,
    Capacity,
    Description,
    created_at,
    created_by,
    last_changed_at,
    last_changed_by,
    /* Associations */
    _Employee,
    _Code
    
}
