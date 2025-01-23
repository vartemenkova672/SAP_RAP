CLASS zcl_arv4_generate_data_worke_t DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS:
      fill_workers_text.
ENDCLASS.

CLASS zcl_arv4_generate_data_worke_t IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    me->fill_workers_text(  ).

  ENDMETHOD.

  METHOD fill_workers_text.

    DATA: it_data TYPE TABLE OF zarv4_d_worker_t.

    it_data = VALUE #(
    ( spras = 'E' employee_id = '1' first_name = 'Ivan'    last_name = 'Sviridov' )
    ( spras = 'E' employee_id = '2' first_name = 'Peter'   last_name = 'Vavilov'  )
    ( spras = 'E' employee_id = '3' first_name = 'Paul'    last_name = 'Ivanov'   )
    ( spras = 'E' employee_id = '4' first_name = 'Nikolay' last_name = 'Zhirnov'  )
    ( spras = 'E' employee_id = '5' first_name = 'Vasily'  last_name = 'Zharov'   )
    ( spras = 'R' employee_id = '1' first_name = 'Иван'    last_name = 'Свиридов' )
    ( spras = 'R' employee_id = '2' first_name = 'Петр'   last_name = 'Вавилов'   )
    ( spras = 'R' employee_id = '3' first_name = 'Павел'    last_name = 'Иванов'  )
    ( spras = 'R' employee_id = '4' first_name = 'Николай' last_name = 'Жирнов'   )
    ( spras = 'R' employee_id = '5' first_name = 'Василий'  last_name = 'Жаров'   )

    ).
    DELETE FROM zarv4_d_worker_t.
    INSERT zarv4_d_worker_t FROM TABLE @it_data.

  ENDMETHOD.
ENDCLASS.
