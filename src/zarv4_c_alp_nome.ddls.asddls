@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ALP: Nomenclature'
@Metadata.allowExtensions: true
@Search.searchable: true

define view entity ZARV4_C_ALP_NOME
  as select from ZARV4_I_ALP_NOME
{
      @Search: {
          defaultSearchElement: true,
          ranking: #HIGH,
          fuzzinessThreshold: 0.8
      }
  key NomenclatureId,
      Article,

      @Search: {
          defaultSearchElement: true,
          ranking: #HIGH,
          fuzzinessThreshold: 0.8
      }
      _NomenclatureT.nomenclature_name           as Name,
      _UnitType.UnitTypeName                     as UnitTypeName,
      _NomTypes.IndicatorName                    as IndicatorName,


      @Aggregation.default: #SUM
      _NomSum.Quantity                           as Quantity,

      @Aggregation.default: #SUM
      _NomSum.ReserveQuantity                    as ReserveQuantity,

      @Aggregation.default: #SUM
      _NomSum.Quantity - _NomSum.ReserveQuantity as AvailableQuantity

}
