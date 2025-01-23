CLASS zcl_arv4_generate_data_n_type DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS:
      fill_nomenclature_type.
ENDCLASS.



CLASS zcl_arv4_generate_data_n_type IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    me->fill_nomenclature_type(  ).
  ENDMETHOD.

  METHOD fill_nomenclature_type.
    DATA: lt_data TYPE TABLE OF zarv4_d_nom_type.

    lt_data  = VALUE #(
    ( indicator_of_use = '1' indicator_name = 'Raw-material' )
    ( indicator_of_use = '2' indicator_name = 'Inventory' )
    ( indicator_of_use = '3' indicator_name = 'Finished goods' )

    ).

    DELETE FROM zarv4_d_nom_type.
    INSERT zarv4_d_nom_type FROM TABLE @lt_data.
  ENDMETHOD.
ENDCLASS.
