CLASS zcl_s4d100_arv_if DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
   INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_s4d100_arv_if IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    CONSTANTS: c_number0 TYPE i VALUE 0.

    out->write( '-----------------------------' ).
    out->write( 'Example 1: IF...ELSE...ENDIF' ).
    out->write( '-----------------------------' ).

    IF c_number0 = 0.
      out->write( 'The value of c_number0 equels zero' ).
    ELSE.
      out->write( 'The value of c_number0 equels some numer other than zero' ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.
