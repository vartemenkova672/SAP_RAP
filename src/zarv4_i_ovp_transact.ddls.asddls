@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data model for transact OVP'

@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZARV4_I_OVP_TRANSACT
  as select from zarv4_d_transact

  association [1..1] to zarv4_d_worker_t as _EmployeeT       on  $projection.ResponsiblePerson = _EmployeeT.employee_id
                                                             and _EmployeeT.spras              = $session.system_language
  association [1..1] to zarv4_d_nom_t    as _NomnclatureT    on  $projection.NomenclatureUuid = _NomnclatureT.nomenclature_uuid
                                                             and _NomnclatureT.spras          = $session.system_language
  association [1..1] to zarv4_d_nome     as _Nomnclature     on  $projection.NomenclatureUuid = _Nomnclature.nomenclature_uuid
  association [1..1] to zarv4_d_nom_type as _NomnclatureType on  $projection.TypeId = _NomnclatureType.indicator_of_use
{
  key record                        as Record,
      nomenclature_uuid             as NomenclatureUuid,
      responsible_person            as ResponsiblePerson,
      transaction_date              as TransactionDate,
      transaction_quantity          as TransactionQuantity,
      transaction_amount            as TransactionAmount,
      transaction_price             as TransactionPrice,
      _Nomnclature.indicator_of_use as TypeId,
      _EmployeeT,
      _NomnclatureT,
      _Nomnclature,
      _NomnclatureType

}
