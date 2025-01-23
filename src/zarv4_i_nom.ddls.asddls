@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data model for nomenclature'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZARV4_I_NOM
  as select from zarv4_d_nome

  association [1..1] to zarv4_d_u_types      as _UnitType        on  $projection.UnitTypeId = _UnitType.unit_type_id
  association [1..1] to zarv4_d_nom_type     as _NomTypes        on  $projection.IndicatorOfUse = _NomTypes.indicator_of_use
  association [0..1] to ZARV4_I_NOM_T        as _NomenclatureTxt on  _NomenclatureTxt.Language       = $session.system_language
                                                                 and _NomenclatureTxt.NomenclatureId = $projection.NomenclatureIDUi

{
        @UI.hidden: true
  key   nomenclature_uuid                 as NomenclatureIDUi,
        nomenclature_id                   as NomenclatureID,
        _NomenclatureTxt.NomenclatureName as NomenclatureName,
        article                           as Article,
        @UI.hidden: true
        unit_type_id                      as UnitTypeId,
        _UnitType.unit_type_name          as UnitTypeName,
        @UI.hidden: true
        indicator_of_use                  as IndicatorOfUse,
        _NomTypes.indicator_name          as IdentificatorName,
        'sap-icon://background'           as ImageUrl,
        _UnitType,
        _NomenclatureTxt

}
