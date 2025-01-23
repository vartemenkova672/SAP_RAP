@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ALP: Nomenclature'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZARV4_I_ALP_NOME
  as select from zarv4_d_nome
  association [1..1] to zarv4_d_nom_t        as _NomenclatureT on  _NomenclatureT.nomenclature_uuid = $projection.NomenclatureUuid
                                                               and _NomenclatureT.spras             = $session.system_language
  association [1..1] to ZARV4_I_NOM_WITH_SUM as _NomSum        on  $projection.NomenclatureUuid = _NomSum.NomenclatureID
  association [1..1] to ZARV4_I_U_TYPES      as _UnitType      on  $projection.UnitTypeID = _UnitType.UnitTypeId
  association [1..1] to ZARV4_I_NOM_TYPE     as _NomTypes      on  $projection.IndicatorOfUse = _NomTypes.IndicatorOfUse

{
  key nomenclature_uuid as NomenclatureUuid,
      nomenclature_id   as NomenclatureId,
      unit_type_id      as UnitTypeID,
      indicator_of_use  as IndicatorOfUse,
      article           as Article,
      _NomenclatureT,
      _NomSum,
      _UnitType,
      _NomTypes
}
