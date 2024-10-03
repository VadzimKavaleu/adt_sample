@EndUserText.label: 'projection view for employee'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZKV_C_EMPLOYEETP as projection on ZKV_R_EMPLOYEETP as Employee
{
    key Employeeuuid,
    Companyuuid,
    Emloyeeid,
    Firstname,
    Secondname,
    Salary,
    Currency,
    Age,
    Experience,
    created_at,
    created_by,
    last_changed_at,
    last_changed_by,
    /* Associations */
    _Company: redirected to parent ZKV_C_COMPANYTP
}
