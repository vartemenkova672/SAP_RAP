@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data model for nomenclature'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZARV4_I_NOM_R
  as select from zarv4_d_nome

composition [0..*] of ZARV4_I_NOM_T  as _NomenclatureTxt

  association [1..1] to ZARV4_I_NOM_WITH_SUM as _NomSum   on $projection.NomenclatureIDUi = _NomSum.NomenclatureID
  association [1..1] to ZARV4_I_U_TYPES      as _UnitType on $projection.UnitTypeId = _UnitType.UnitTypeId
  association [1..1] to ZARV4_I_NOM_TYPE     as _NomTypes on $projection.IndicatorOfUse = _NomTypes.IndicatorOfUse

{

  key   nomenclature_uuid        as NomenclatureIDUi,
  //   $session.system_language as Language,
        nomenclature_id          as NomenclatureID,
        article                  as Article,
        unit_type_id             as UnitTypeId,
        _UnitType.UnitTypeName   as UnitTypeName,
        indicator_of_use         as IndicatorOfUse,
        _NomTypes.IndicatorName  as IdentificatorName,
        _NomSum.Quantity         as RemainingQuantity,
        _NomSum.ReserveQuantity  as ReserveQuantity,
        'sap-icon://background'  as ImageUrl,
        countexternal_use       as Counter,
        _NomSum,
        _UnitType,
        _NomenclatureTxt

}
