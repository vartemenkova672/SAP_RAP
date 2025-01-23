CLASS lhc_TransactR DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR TransactR RESULT result.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR TransactR RESULT result.

    METHODS Reserve FOR MODIFY
      IMPORTING keys FOR ACTION TransactR~Reserve RESULT result.

    METHODS addEntry FOR DETERMINE ON SAVE
      IMPORTING keys FOR TransactR~addEntry.

    METHODS validateNomAvailability FOR VALIDATE ON SAVE
      IMPORTING keys FOR TransactR~validateNomAvailability.

ENDCLASS.


CLASS lhc_TransactR IMPLEMENTATION.

  METHOD get_instance_features.

    READ ENTITIES OF zarv4_i_transact_r IN LOCAL MODE
    ENTITY TransactR
       FIELDS ( RecordId TransactionQuantity TransactionAmount )
       WITH CORRESPONDING #( keys )
     RESULT DATA(lt_transacts).

    result = VALUE #( FOR ls_transact IN lt_transacts
                       ( %tky                             = ls_transact-%tky
                         %features-%action-Reserve = COND #( WHEN ls_transact-TransactionQuantity > 0
                                                                     AND ls_transact-TransactionAmount > 0
                                                                   THEN if_abap_behv=>fc-o-enabled ELSE if_abap_behv=>fc-o-disabled  )
                      ) ).

  ENDMETHOD.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD Reserve.

    DATA lv_record_id TYPE zarv4_record_id.

    READ ENTITIES OF zarv4_i_transact_r IN LOCAL MODE
      ENTITY TransactR
      FIELDS ( RecordId TransactionQuantity ReserveQuantity )
      WITH CORRESPONDING #( keys )
      RESULT DATA(lt_transacts).

    LOOP AT lt_transacts ASSIGNING FIELD-SYMBOL(<ls_transact>).

      IF <ls_transact>-ReserveQuantity = 0.
        MODIFY ENTITIES OF zarv4_i_transact_r IN LOCAL MODE
             ENTITY TransactR
             UPDATE FROM VALUE #( FOR ls_key IN keys ( %tky                     = ls_key-%tky
                                                       ReserveQuantity          = <ls_transact>-TransactionQuantity
                                                       %control-ReserveQuantity = if_abap_behv=>mk-on ) )
               FAILED   failed
             REPORTED reported.
      ELSE.

        MODIFY ENTITIES OF zarv4_i_transact_r IN LOCAL MODE
                   ENTITY TransactR
                   UPDATE FROM VALUE #( FOR ls_key IN keys ( %tky                     = ls_key-%tky
                                                             ReserveQuantity          = 0
                                                             %control-ReserveQuantity = if_abap_behv=>mk-on ) )
                     FAILED   failed
                   REPORTED reported.

      ENDIF.

      READ ENTITIES OF zarv4_i_transact_r IN LOCAL MODE
          ENTITY TransactR
            ALL FIELDS
              WITH VALUE #( FOR ls_key IN keys ( %tky = ls_key-%tky ) )
          RESULT DATA(lt_transact).

      result = VALUE #( FOR ls_transact IN lt_transact ( %tky   = ls_transact-%tky
                                                         %param = ls_transact ) ).

    ENDLOOP.

  ENDMETHOD.

  METHOD addEntry.

    DATA lv_record_id TYPE zarv4_record_id.

    READ ENTITIES OF zarv4_i_transact_r IN LOCAL MODE
    ENTITY TransactR
    FIELDS ( RecordId TransactionQuantity TransactionAmount TransactionDate TransactionTime TransactionPrice )
    WITH CORRESPONDING #( keys )
    RESULT DATA(lt_transacts).

    SELECT RecordId
      FROM zarv4_i_transact_r
      ORDER BY RecordId DESCENDING
      INTO @lv_record_id
       UP TO 1 ROWS.
    ENDSELECT.

    IF sy-subrc <> 0.
      lv_record_id = 1.
    ELSE.
      lv_record_id = lv_record_id + 1.
    ENDIF.

    LOOP AT lt_transacts ASSIGNING FIELD-SYMBOL(<ls_transact>).

      IF <ls_transact>-TransactionPrice < 0.
        <ls_transact>-TransactionPrice = - <ls_transact>-TransactionPrice.
      ENDIF.

      SELECT SINGLE nomenclature_uuid
      FROM zarv4_d_nome
      WHERE zarv4_d_nome~nomenclature_id = @<ls_transact>-NomenclatureID
      INTO @DATA(lv_nonemclature_id).

      MODIFY ENTITIES OF zarv4_i_transact_r IN LOCAL MODE
    ENTITY TransactR

    UPDATE FROM VALUE #( FOR ls_key IN keys ( %tky                       = ls_key-%tky
                                              TransactionDate            = cl_abap_context_info=>get_system_date( )
                                              TransactionTime            = cl_abap_context_info=>get_system_time( )
                                              TransactionAmount          = <ls_transact>-TransactionQuantity * <ls_transact>-TransactionPrice
                                              TransactionPrice           = <ls_transact>-TransactionPrice
                                              RecordId                   = lv_record_id
                                              NomenclatureIDUi           = lv_nonemclature_id
                                              %control-RecordId          = if_abap_behv=>mk-on
                                              %control-TransactionDate   = if_abap_behv=>mk-on
                                              %control-TransactionTime   = if_abap_behv=>mk-on
                                              %control-TransactionAmount = if_abap_behv=>mk-on
                                              %control-TransactionPrice  = if_abap_behv=>mk-on
                                              %control-NomenclatureIDUi  = if_abap_behv=>mk-on ) )

           FAILED   DATA(ls_failed)
           REPORTED DATA(ls_reported).

      reported = CORRESPONDING #( DEEP ls_reported ).

    ENDLOOP.

  ENDMETHOD.

  METHOD validateNomAvailability.

    READ ENTITIES OF zarv4_i_transact_r IN LOCAL MODE
     ENTITY TransactR
     FIELDS ( RecordId TransactionPrice )
     WITH CORRESPONDING #( keys )
     RESULT DATA(lt_transacts).

    LOOP AT lt_transacts ASSIGNING FIELD-SYMBOL(<ls_transact>).

      SELECT NomenclatureName, SUM( TransactionQuantity ) AS stock_balance
       FROM zarv4_i_transact_r
       WHERE NomenclatureID = @<ls_transact>-nomenclatureid
       GROUP BY NomenclatureName
       INTO TABLE @DATA(lt_stock_balance).

      IF <ls_transact>-TransactionQuantity < 0
      AND lt_stock_balance[ 1 ]-stock_balance  < - <ls_transact>-TransactionQuantity.

        APPEND VALUE #( %tky = <ls_transact>-%tky ) TO failed-transactr.

        APPEND VALUE #( %tky = <ls_transact>-%tky
                        %msg = NEW zcl_arv4_transact_r(
                        NomenclatureName = lt_stock_balance[ 1 ]-NomenclatureName
                        textid           = zcl_arv4_transact_r=>nomenclature_unavailable
                        severity         = if_abap_behv_message=>severity-error ) )
        TO reported-transactr.

      ENDIF.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.

CLASS lcl_event_handler DEFINITION INHERITING FROM cl_abap_behavior_saver.

  PROTECTED SECTION.
    METHODS save_modified REDEFINITION.


ENDCLASS.

CLASS lcl_event_handler IMPLEMENTATION.

  METHOD save_modified.


    IF delete-transactr IS NOT INITIAL.

      LOOP AT delete-transactr ASSIGNING FIELD-SYMBOL(<ls_line_del>).

        SELECT SINGLE NomenclatureIDUi
     FROM zarv4_i_transact_r
     WHERE Record = @<ls_line_del>-Record
     INTO @DATA(lv_nomenclature_id).

        RAISE ENTITY EVENT zarv4_i_transact_r~DelCount
        FROM VALUE #( FOR <ls_transactr_del> IN delete-transactr
                      ( %key   = VALUE #( Record            = <ls_transactr_del>-Record )
                        %param = VALUE #( nomenclature_uuid = lv_nomenclature_id ) ) ).
      ENDLOOP.

    ELSEIF create-transactr IS NOT INITIAL.

      LOOP AT create-transactr ASSIGNING FIELD-SYMBOL(<ls_line_create>).

        RAISE ENTITY EVENT zarv4_i_transact_r~AddCount
        FROM VALUE #( FOR <ls_transactr_create> IN create-transactr
                      ( %key   = VALUE #( Record            = <ls_transactr_create>-Record )
                        %param = VALUE #( nomenclature_uuid = <ls_transactr_create>-NomenclatureIDUi ) ) ).
      ENDLOOP.

    ENDIF.

  ENDMETHOD.

ENDCLASS.
