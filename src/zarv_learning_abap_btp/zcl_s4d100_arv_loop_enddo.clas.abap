CLASS zcl_s4d100_arv_loop_enddo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
   INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_s4d100_arv_loop_enddo IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    CONSTANTS: c_number0 TYPE i VALUE 3.
    DATA: lv_number0 TYPE i.

    lv_number0 = c_number0 * c_number0.

* Count backwards from lv_number0 to c_number0
    DO.
      out->write( |{ sy-index }: Value of lv_number0: { lv_number0 }| ).
      lv_number0 = lv_number0 - 1.

* Abort condition
      IF lv_number0 <= c_number0. "If 3 = 3
        EXIT.
      ENDIF.
    ENDDO.

  ENDMETHOD.

ENDCLASS.
