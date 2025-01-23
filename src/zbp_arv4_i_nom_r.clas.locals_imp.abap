CLASS lhc__Nomenclature DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.
    CONSTANTS _001 TYPE i VALUE 001.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR _Nomenclature RESULT result.

    METHODS DelWithCheck FOR MODIFY
      IMPORTING keys FOR ACTION _Nomenclature~DelWithCheck.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR _Nomenclature RESULT result.

ENDCLASS.

CLASS lhc__Nomenclature IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD DelWithCheck.

    READ ENTITIES OF zarv4_i_nom_r IN LOCAL MODE
       ENTITY _Nomenclature
       ALL FIELDS
       WITH CORRESPONDING #( keys )
       RESULT DATA(lt_counter).

    LOOP AT lt_counter ASSIGNING FIELD-SYMBOL(<ls_counter>).

      IF <ls_counter>-Counter = 0.

        MODIFY ENTITIES OF zarv4_i_nom_r  IN LOCAL MODE
                   ENTITY _Nomenclature
                  DELETE FROM VALUE #( FOR ls_key IN keys ( %tky = ls_key-%tky ) ).

                   APPEND VALUE #( %tky = <ls_counter>-%tky
                        %msg = NEW zcl_arv4_nomenclature_r(
                        NomenclatureId = <ls_counter>-NomenclatureID
                        textid         = zcl_arv4_nomenclature_r=>nomenclature_deleted
                        severity       = if_abap_behv_message=>severity-information ) )
        TO reported-_nomenclature.

      ELSE.

        APPEND VALUE #( %tky = <ls_counter>-%tky ) TO failed-_nomenclature.

        APPEND VALUE #( %tky = <ls_counter>-%tky
                        %msg = NEW zcl_arv4_nomenclature_r(
                        NomenclatureId = <ls_counter>-NomenclatureID
                        textid         = zcl_arv4_nomenclature_r=>nomenclature_unavailable
                        severity       = if_abap_behv_message=>severity-error ) )
        TO reported-_nomenclature.

      ENDIF.

    ENDLOOP.

  ENDMETHOD.

  METHOD get_instance_features.
  ENDMETHOD.

ENDCLASS.
