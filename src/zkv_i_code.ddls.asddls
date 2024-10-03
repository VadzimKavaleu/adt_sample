@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'code view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Search.searchable: true
define view entity ZKV_I_CODE as select from zkvcode
{
    key phone as Phone,
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.7
    @Semantics.text: true    
    code as Code
}
