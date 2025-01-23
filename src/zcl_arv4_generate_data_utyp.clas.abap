CLASS zcl_arv4_generate_data_utyp DEFINITION
PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS:
      fill_unit_type.
ENDCLASS.

CLASS zcl_arv4_generate_data_utyp IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    me->fill_unit_type(  ).
  ENDMETHOD.

  METHOD fill_unit_type.
    DATA: lt_data TYPE TABLE OF zarv4_d_u_types.

    lt_data  = VALUE #(
    ( unit_type_id = '1' unit_type_name = 'Pieces' )
    ( unit_type_id = '2' unit_type_name = 'Kilogram' )
    ( unit_type_id = '3' unit_type_name = 'Liter' )
    ( unit_type_id = '4' unit_type_name = 'Package' )
    ( unit_type_id = '5' unit_type_name = 'Dozen' )

    ).

    DELETE FROM zarv4_d_u_types.
    INSERT zarv4_d_u_types FROM TABLE @lt_data.
  ENDMETHOD.
ENDCLASS.
