@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data model for workers'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZARV4_I_WORKER
  as select from zarv4_d_worker
  association [1..1] to ZARV4_I_TITLES   as _Titels     on  $projection.TitleId = _Titels.TitleId
  association [0..1] to ZARV4_I_WORKER_T as _WorkersTxt on  _WorkersTxt.Language   = $session.system_language
                                                        and _WorkersTxt.EmployeeId = $projection.EmployeeId

{
  key employee_id                                                        as EmployeeId,
      concat_with_space(_WorkersTxt.FirstName, _WorkersTxt.LastName, 1 ) as EmployeeName,
      @UI.hidden: true
      title_id                                                           as TitleId,
      _Titels.TitleName                                                  as TitleName,
      active                                                             as Active,
      phone_number                                                       as PhoneNumber,
      address                                                            as Address
}
