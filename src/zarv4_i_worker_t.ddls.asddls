@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data model for workers text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZARV4_I_WORKER_T
  as select from zarv4_d_worker_t
{
      @Semantics.language: true
  key spras       as Language,
  key employee_id as EmployeeId,
      @Semantics.text: true
      first_name  as FirstName,
      @Semantics.text: true
      last_name   as LastName
}
