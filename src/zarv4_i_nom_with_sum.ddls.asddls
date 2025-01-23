@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data model for nomenclature'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZARV4_I_NOM_WITH_SUM
  as select from zarv4_d_nome
    inner join   zarv4_d_transact on zarv4_d_transact.nomenclature_uuid = zarv4_d_nome.nomenclature_uuid

{
  key zarv4_d_nome.nomenclature_uuid               as NomenclatureID,
      sum( zarv4_d_transact.transaction_quantity ) as Quantity,
      sum( zarv4_d_transact.reserve_quantity )     as ReserveQuantity
}

group by
  zarv4_d_nome.nomenclature_uuid
