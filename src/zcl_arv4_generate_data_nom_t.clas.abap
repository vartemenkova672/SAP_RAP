CLASS zcl_arv4_generate_data_nom_t DEFINITION
   PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS:
      fill_nomenclature_text.
ENDCLASS.

CLASS zcl_arv4_generate_data_nom_t IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    me->fill_nomenclature_text(  ).

  ENDMETHOD.

  METHOD fill_nomenclature_text.

    DATA: it_data TYPE TABLE OF zarv4_d_nom_t.

    it_data = VALUE #(
    ( spras = 'E' nomenclature_uuid = 1  nomenclature_name = 'Bicycle frame' )
    ( spras = 'E' nomenclature_uuid = 2  nomenclature_name = 'Bolt' )
    ( spras = 'E' nomenclature_uuid = 3  nomenclature_name = 'Screw' )
    ( spras = 'E' nomenclature_uuid = 4  nomenclature_name = 'Wheel' )
    ( spras = 'E' nomenclature_uuid = 5  nomenclature_name = 'Handlebars' )
    ( spras = 'E' nomenclature_uuid = 6  nomenclature_name = 'Seat' )
    ( spras = 'E' nomenclature_uuid = 7  nomenclature_name = 'Bicycle brake' )
    ( spras = 'E' nomenclature_uuid = 8  nomenclature_name = 'Chain' )
    ( spras = 'E' nomenclature_uuid = 9  nomenclature_name = 'Transmission star' )
    ( spras = 'E' nomenclature_uuid = 10 nomenclature_name = 'Paint' )
    ( spras = 'E' nomenclature_uuid = 11 nomenclature_name = 'Oil' )
    ( spras = 'E' nomenclature_uuid = 12 nomenclature_name = 'Rags' )
    ( spras = 'E' nomenclature_uuid = 13 nomenclature_name = 'Brush' )
    ( spras = 'E' nomenclature_uuid = 14 nomenclature_name = 'City bike' )
    ( spras = 'E' nomenclature_uuid = 15 nomenclature_name = 'Mountain bike' )
    ( spras = 'E' nomenclature_uuid = 16 nomenclature_name = 'Sports bike' )
    ( spras = 'E' nomenclature_uuid = 17 nomenclature_name = 'Children tricycle' )

    ( spras = 'R' nomenclature_uuid = 1  nomenclature_name = 'Рама велосипеда' )
    ( spras = 'R' nomenclature_uuid = 2  nomenclature_name = 'Болт' )
    ( spras = 'R' nomenclature_uuid = 3  nomenclature_name = 'Винт' )
    ( spras = 'R' nomenclature_uuid = 4  nomenclature_name = 'Винт' )
    ( spras = 'R' nomenclature_uuid = 5  nomenclature_name = 'Руль' )
    ( spras = 'R' nomenclature_uuid = 6  nomenclature_name = 'Сиденье' )
    ( spras = 'R' nomenclature_uuid = 7  nomenclature_name = 'Велосипедный тормоз' )
    ( spras = 'R' nomenclature_uuid = 8  nomenclature_name = 'Цепь' )
    ( spras = 'R' nomenclature_uuid = 9  nomenclature_name = 'Звезда передачи' )
    ( spras = 'R' nomenclature_uuid = 10 nomenclature_name = 'Краска' )
    ( spras = 'R' nomenclature_uuid = 11 nomenclature_name = 'Масло' )
    ( spras = 'R' nomenclature_uuid = 12 nomenclature_name = 'Тряпки' )
    ( spras = 'R' nomenclature_uuid = 13 nomenclature_name = 'Щетка' )
    ( spras = 'R' nomenclature_uuid = 14 nomenclature_name = 'Городской велосипед' )
    ( spras = 'R' nomenclature_uuid = 15 nomenclature_name = 'Горный велосипед' )
    ( spras = 'R' nomenclature_uuid = 16 nomenclature_name = 'Спортивный велосипед' )
    ( spras = 'R' nomenclature_uuid = 17 nomenclature_name = 'Детский трехколесный велосипед' )

    ).
    DELETE FROM zarv4_d_nom_t.
    INSERT zarv4_d_nom_t FROM TABLE @it_data.

  ENDMETHOD.
ENDCLASS.
