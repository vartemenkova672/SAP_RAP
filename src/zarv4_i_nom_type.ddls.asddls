@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data model for nomenclature types'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZARV4_I_NOM_TYPE as select from zarv4_d_nom_type
{
    key indicator_of_use as IndicatorOfUse,
    indicator_name as IndicatorName
}
