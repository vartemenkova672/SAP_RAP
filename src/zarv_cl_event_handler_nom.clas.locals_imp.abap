*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

CLASS lcl_local_event_consumption DEFINITION INHERITING FROM cl_abap_behavior_event_handler.

  PRIVATE SECTION.

    METHODS AddCount FOR ENTITY EVENT IMPORTING params FOR TransactR~AddCount.

    METHODS DelCount FOR ENTITY EVENT IMPORTING params FOR TransactR~DelCount.

ENDCLASS.


CLASS lcl_local_event_consumption IMPLEMENTATION.

  METHOD AddCount.
    CHECK params IS NOT INITIAL.

    DATA: ls_nomenclature TYPE zarv4_d_nome.

    READ ENTITIES OF zarv4_i_nom_r
             ENTITY _Nomenclature
     ALL FIELDS
     WITH VALUE #( FOR ls_params IN params ( %key-NomenclatureIDUi = ls_params-nomenclature_uuid ) )
     RESULT DATA(Nomenclature).

    MODIFY ENTITIES OF zarv4_i_nom_r
           ENTITY _Nomenclature UPDATE FIELDS ( Counter )
           WITH VALUE #( FOR key IN Nomenclature
                         ( %key-NomenclatureIDUi = key-NomenclatureIDUi
                           Counter               = key-Counter + 1 ) )
                             MAPPED DATA(mapped)
                             REPORTED DATA(reported)
                             FAILED DATA(failed).

  ENDMETHOD.

  METHOD DelCount.
    CHECK params IS NOT INITIAL.

    DATA: ls_nomenclature TYPE zarv4_d_nome.

    READ ENTITIES OF zarv4_i_nom_r
             ENTITY _Nomenclature
     ALL FIELDS
     WITH VALUE #( FOR ls_params IN params ( %key-NomenclatureIDUi = ls_params-nomenclature_uuid ) )
     RESULT DATA(Nomenclature).

    IF Nomenclature[ 1 ]-Counter > 0.
      MODIFY ENTITIES OF zarv4_i_nom_r
             ENTITY _Nomenclature UPDATE FIELDS ( Counter )
             WITH VALUE #( FOR key IN Nomenclature
                           ( %key-NomenclatureIDUi = key-%key-NomenclatureIDUi
                             Counter               = key-Counter - 1 ) )
                               MAPPED DATA(mapped)
                               REPORTED DATA(reported)
                               FAILED DATA(failed).
    ENDIF.

  ENDMETHOD.

ENDCLASS.
