CLASS zcl_arv4_generate_data_titles DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS:
      fill_titles.
ENDCLASS.

CLASS zcl_arv4_generate_data_titles IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    me->fill_titles(  ).
  ENDMETHOD.

  METHOD fill_titles.
    DATA: lt_data TYPE TABLE OF zarv4_d_titles.

    lt_data  = VALUE #(
    ( title_id = '1' active = 'X' )
    ( title_id = '2' active = 'X' )
    ( title_id = '3' active = ' ' )
    ( title_id = '4' active = 'X' )
    ).

    DELETE FROM zarv4_d_titles.
    INSERT zarv4_d_titles FROM TABLE @lt_data.
  ENDMETHOD.
ENDCLASS.
