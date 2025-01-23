@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view for nomenclature'
@Metadata.allowExtensions: true
@Search.searchable: true
@UI.headerInfo: { typeName: 'Nomenclature',
                  title.value: 'NomenclatureID'
                }

define root view entity ZARV4_C_NOM
  provider contract transactional_query
  as projection on ZARV4_I_NOM_R

{
      @Search: { defaultSearchElement: true }
  key NomenclatureIDUi,
      Article,
      NomenclatureID,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZARV4_I_U_TYPES',
                                         element: 'UnitTypeId'} }]
      UnitTypeId,

      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZARV4_I_U_TYPES',
                                         element: 'UnitTypeName'} }]
      UnitTypeName,

      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZARV4_I_NOM_TYPE',
                                   element: 'IndicatorOfUse'} }]
      @ObjectModel.text.element: [ 'IdentificatorName' ]
      IndicatorOfUse,
      IdentificatorName,
      RemainingQuantity,
      ReserveQuantity,
      ImageUrl,
      /* Associations */
      _NomenclatureTxt : redirected to composition child ZARV4_C_NOM_T,
      _NomSum,
      _UnitType
}
