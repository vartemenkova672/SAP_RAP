CLASS zcl_arv4_generate_data_title_t DEFINITION
 PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS:
      fill_titles_text.
ENDCLASS.

CLASS zcl_arv4_generate_data_title_t IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.

    me->fill_titles_text(  ).

  ENDMETHOD.

  METHOD fill_titles_text.

    DATA: it_data TYPE TABLE OF ZARV4_D_TITLES_T.

    it_data = VALUE #(
    ( spras = 'E' title_id = '1'  title_name = 'Assembler' )
    ( spras = 'E' title_id = '2'  title_name = 'Storekeeper' )
    ( spras = 'E' title_id = '3'  title_name = 'Production Manager' )
    ( spras = 'E' title_id = '4'  title_name = 'Director' )
    ( spras = 'R' title_id = '1'  title_name = 'Сборщик' )
    ( spras = 'R' title_id = '2'  title_name = 'Кладовщик' )
    ( spras = 'R' title_id = '3'  title_name = 'Менеджер по производству' )
    ( spras = 'R' title_id = '4'  title_name = 'Директор' )

     ).
    DELETE FROM ZARV4_D_TITLES_T.
    INSERT ZARV4_D_TITLES_T FROM TABLE @it_data.

  ENDMETHOD.
ENDCLASS.
