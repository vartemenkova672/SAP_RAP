CLASS zcl_arv4_generate_data_workers DEFINITION
 PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS:
      fill_workers.
ENDCLASS.

CLASS zcl_arv4_generate_data_workers IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    me->fill_workers(  ).
  ENDMETHOD.

  METHOD fill_workers.
    DATA: lt_data TYPE TABLE OF zarv4_d_worker.

    lt_data  = VALUE #(
    ( employee_id = '1' title_id = '1' active = 'X' phone_number = '+ 374 99 155695' address = 'Yerevan, 0095 Marshal Baghramyan 19' )
    ( employee_id = '2' title_id = '1' active = 'X' phone_number = '+ 374 99 155689' address = 'Yerevan, M. Baghramyan Ave. 10' )
    ( employee_id = '3' title_id = '1' active = 'X' phone_number = '+ 374 99 155660' address = 'Yerevan, Davtashen 4th k., A. Mikoyan 109/8' )
    ( employee_id = '4' title_id = '2' active = 'X' phone_number = '+ 374 99 157089' address = 'Yerevan, st. Nalbandyan 28' )
    ( employee_id = '5' title_id = '4' active = 'X' phone_number = '+ 374 99 345689' address = 'Gyumri, Nikolay Rizhkov Street, 5' )

    ).

    DELETE FROM zarv4_d_worker.
    INSERT zarv4_d_worker FROM TABLE @lt_data.
  ENDMETHOD.
ENDCLASS.
