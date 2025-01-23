@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data model for transactions'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZARV4_I_TRANSACT_R
  as select from zarv4_d_transact

  association [1..1] to ZARV4_I_NOM    as _Nomenclature on $projection.NomenclatureIDUi = _Nomenclature.NomenclatureIDUi
  association [1..1] to ZARV4_I_WORKER as _Employees    on $projection.EmployeeId = _Employees.EmployeeId
 
{

  key    record                          as Record,
         nomenclature_uuid               as NomenclatureIDUi,
         record_id                       as RecordId,
         responsible_person              as EmployeeId,
         _Employees.EmployeeName         as EmployeeName,
         _Employees.TitleId              as TitleId,
         _Employees.TitleName            as TitleName,
         _Nomenclature.NomenclatureID    as NomenclatureID,
         _Nomenclature.Article           as Article,
         _Nomenclature.NomenclatureName  as NomenclatureName,
         _Nomenclature.UnitTypeName      as UnitTypeName,
         _Nomenclature.IdentificatorName as IdentificatorName,
         transaction_date                as TransactionDate,
         transaction_time                as TransactionTime,
         transaction_quantity            as TransactionQuantity,
         @Semantics.amount.currencyCode: 'TransactionCurrency'
         transaction_amount              as TransactionAmount,
         @Semantics.amount.currencyCode: 'TransactionCurrency'
         transaction_price               as TransactionPrice,
         transaction_price_currency      as TransactionCurrency,
         transaction_description         as TransactionDescription,
         reserve_quantity                as ReserveQuantity,
         _Employees,
         _Nomenclature

}
