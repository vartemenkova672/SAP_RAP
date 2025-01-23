CLASS zcl_arv4_generate_data_nom DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS:
      fill_nomenclature.
ENDCLASS.

CLASS zcl_arv4_generate_data_nom IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    me->fill_nomenclature(  ).
  ENDMETHOD.

  METHOD fill_nomenclature.
    DATA: lt_data TYPE TABLE OF zarv4_d_nome.

    lt_data  = VALUE #(
    ( nomenclature_id = '1'  nomenclature_uuid = 1  article = 'SP01' unit_type_id = '1' indicator_of_use = '1' countexternal_use = '1' )
    ( nomenclature_id = '2'  nomenclature_uuid = 2  article = 'SP02' unit_type_id = '5' indicator_of_use = '1' countexternal_use = '1' )
    ( nomenclature_id = '3'  nomenclature_uuid = 3  article = 'SP03' unit_type_id = '5' indicator_of_use = '1' countexternal_use = '1' )
    ( nomenclature_id = '4'  nomenclature_uuid = 4  article = 'SP04' unit_type_id = '1' indicator_of_use = '1' countexternal_use = '1' )
    ( nomenclature_id = '5'  nomenclature_uuid = 5  article = 'SP05' unit_type_id = '1' indicator_of_use = '1' countexternal_use = '1' )
    ( nomenclature_id = '6'  nomenclature_uuid = 6  article = 'SP06' unit_type_id = '1' indicator_of_use = '1' countexternal_use = '1' )
    ( nomenclature_id = '7'  nomenclature_uuid = 7  article = 'SP07' unit_type_id = '1' indicator_of_use = '1' countexternal_use = '1' )
    ( nomenclature_id = '8'  nomenclature_uuid = 8  article = 'SP08' unit_type_id = '1' indicator_of_use = '1' countexternal_use = '1' )
    ( nomenclature_id = '9'  nomenclature_uuid = 9  article = 'SP09' unit_type_id = '4' indicator_of_use = '1' countexternal_use = '1' )
    ( nomenclature_id = '10' nomenclature_uuid = 10 article = 'SP10' unit_type_id = '3' indicator_of_use = '1' countexternal_use = '1' )
    ( nomenclature_id = '11' nomenclature_uuid = 11 article = 'SP11' unit_type_id = '2' indicator_of_use = '1' countexternal_use = '1' )
    ( nomenclature_id = '12' nomenclature_uuid = 12 article = 'IN01' unit_type_id = '4' indicator_of_use = '2' countexternal_use = '1' )
    ( nomenclature_id = '13' nomenclature_uuid = 13 article = 'IN02' unit_type_id = '1' indicator_of_use = '2' countexternal_use = '1' )
    ( nomenclature_id = '14' nomenclature_uuid = 14 article = 'FG01' unit_type_id = '1' indicator_of_use = '3' countexternal_use = '1' )
    ( nomenclature_id = '15' nomenclature_uuid = 15 article = 'FG02' unit_type_id = '1' indicator_of_use = '3' countexternal_use = '1' )
    ( nomenclature_id = '16' nomenclature_uuid = 16 article = 'FG03' unit_type_id = '1' indicator_of_use = '3' countexternal_use = '1' )
    ( nomenclature_id = '17' nomenclature_uuid = 17 article = 'FG04' unit_type_id = '1' indicator_of_use = '3' countexternal_use = '0' )

    ).

    DELETE FROM zarv4_d_nome.
    INSERT zarv4_d_nome FROM TABLE @lt_data.
  ENDMETHOD.
ENDCLASS.
