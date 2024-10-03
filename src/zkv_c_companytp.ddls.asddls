@EndUserText.label: 'projection view for company'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity ZKV_C_COMPANYTP as projection on ZKV_R_COMPANYTP as Company
//association [0..1] to ZKV_I_INFO as _Info on $projection.Companyname = _Info.Companyname

{
    key Companyuuid,
    Companyid,
    @Consumption.valueHelpDefinition: [{ entity:{ name: 'ZKV_I_INFO', element: 'Companyname' } }]
    Companyname,
    City,
    @ObjectModel.text.element: [ 'Code' ]
    Phone,
    Status,
    Capacity,
    @Semantics.text: true
    _Code.Code,
    Description,
    created_at,
    created_by,
    last_changed_at,
    last_changed_by,
    /* Associations */
    _Code,   
    _Employee: redirected to composition child ZKV_C_EMPLOYEETP
}
