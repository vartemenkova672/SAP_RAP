@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'OVP: Transacts'
@Metadata.allowExtensions: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZARV4_C_OVP_TRANSACT
  as select from ZARV4_I_OVP_TRANSACT
{
  key Record,
  
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZARV4_I_NOM',
                                                   element: 'NomenclatureIDUi'} }]
       @Consumption.semanticObject: 'ZARV4_I_NOM'
       @ObjectModel.text.element: ['NomenclatureName']  
       
      NomenclatureUuid,
      _NomnclatureT.nomenclature_name as NomenclatureName,

       @Consumption.valueHelpDefinition: [{ entity: { name: 'ZARV4_I_WORKER',
                                         element: 'EmployeeId'} }]
       @Consumption.semanticObject: 'ZARV4_I_WORKER'
       @ObjectModel.text.element: ['EmployeeName']

      ResponsiblePerson,
      concat_with_space(_EmployeeT.first_name, _EmployeeT.last_name, 1) as EmployeeName,

      TransactionDate,
      
      _NomnclatureType.indicator_name as TypeOfNomenclature,
      
      @Aggregation.default: #SUM
      TransactionQuantity,

      @Aggregation.default: #SUM
      TransactionAmount,
      
      @Aggregation.default: #AVG
      TransactionPrice,

      /* Associations */
      _EmployeeT,
      _NomnclatureT     
}
