@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view for transactions root'
@Metadata.allowExtensions: true
@Search.searchable: true

define root view entity ZARV4_C_TRANSACT_R
  provider contract transactional_query
  as projection on ZARV4_I_TRANSACT_R

{
  key  Record,

       NomenclatureIDUi,

       @Consumption.valueHelpDefinition: [{ entity: { name: 'ZARV4_I_NOM',
                                                   element: 'NomenclatureID'} }]
       @Consumption.semanticObject: 'ZARV4_I_NOM'
       @ObjectModel.text.element: ['NomenclatureName']

       NomenclatureID,
       NomenclatureName,
       Article,

       @Search: { defaultSearchElement: true }
       RecordId,

       @Consumption.valueHelpDefinition: [{ entity: { name: 'ZARV4_I_WORKER',
                                         element: 'EmployeeId'} }]
       @Consumption.semanticObject: 'ZARV4_I_WORKER'
       @ObjectModel.text.element: ['EmployeeName']
       EmployeeId,
       EmployeeName,
       TitleName,
       TransactionDate,
       TransactionQuantity,
       TransactionTime,
       @Semantics.amount.currencyCode: 'TransactionCurrency'
       TransactionAmount,
       @Semantics.amount.currencyCode: 'TransactionCurrency'
       TransactionPrice,

       @Consumption.valueHelpDefinition: [{ entity: { name: 'I_CURRENCY',
                                         element: 'Currency'} }]
       TransactionCurrency,
       TransactionDescription,
       IdentificatorName,
       ReserveQuantity,
       /* Associations */
       _Employees,
       _Nomenclature

}
