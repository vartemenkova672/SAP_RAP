@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view for nomenclature text'
@Metadata.allowExtensions: true
define view entity ZARV4_C_NOM_T as projection on ZARV4_I_NOM_T
{
   
    key NomenclatureId,
    @Consumption.valueHelpDefinition: [{ entity: { name: 'ZARV4_I_LANGUAGE',
                                         element: 'Language'} }]
    key Language,
    NomenclatureName,
    /* Associations */
  _Nomenclature : redirected to parent ZARV4_C_NOM
}
