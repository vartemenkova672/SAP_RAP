CLASS zcl_s4d100_arv_loop DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
   INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_s4d100_arv_loop IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    CONSTANTS: c_number0 TYPE i VALUE 3.

    out->write( '---------------------------------' ).
    out->write( 'Example 1: DO...ENDDO with TIMES' ).
    out->write( '---------------------------------' ).

    DO c_number0 TIMES.
      out->write( 'Hello World' ).
    ENDDO.

  ENDMETHOD.

ENDCLASS.
