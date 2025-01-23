@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data model for titles'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZARV4_I_TITLES
  as select from zarv4_d_titles
  association [0..1] to ZARV4_I_TITLES_T as _TitelsTxt on  _TitelsTxt.Language = $session.system_language
                                                       and _TitelsTxt.TitleId  = $projection.TitleId
{
  key title_id             as TitleId,
      _TitelsTxt.TitleName as TitleName
}
