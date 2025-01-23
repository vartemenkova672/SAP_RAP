@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data model for nomenclature text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZARV4_I_NOM_T
 // with parameters p_lang:spras 
  as select from zarv4_d_nom_t

  association to parent ZARV4_I_NOM_R as _Nomenclature on $projection.NomenclatureId = _Nomenclature.NomenclatureIDUi
  //          and $projection.Language       = _Nomenclature.Language
{

  key     nomenclature_uuid as NomenclatureId,
  key     spras             as Language,
          @Semantics.text: true
          nomenclature_name as NomenclatureName,

          @Semantics.language: true

          _Nomenclature
}

