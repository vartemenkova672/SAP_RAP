@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data model for titles text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZARV4_I_TITLES_T
  as select from zarv4_d_titles_t
{
      @Semantics.language: true
  key spras      as Language,
  key title_id   as TitleId,
      @Semantics.text: true
      title_name as TitleName
}
