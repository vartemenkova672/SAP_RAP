CLASS zcl_arv4_nomenclature_r DEFINITION
  PUBLIC
    INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_t100_dyn_msg .
    INTERFACES if_t100_message .
    INTERFACES if_abap_behv_message.

    CONSTANTS:
      BEGIN OF nomenclature_unavailable,
        msgid TYPE symsgid VALUE 'ZABC_MC_MESSAGES',
        msgno TYPE symsgno VALUE '001',
        attr1 TYPE scx_attrname VALUE 'NomenclatureID',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF nomenclature_unavailable,

      BEGIN OF nomenclature_deleted,
        msgid TYPE symsgid VALUE 'ZABC_MC_MESSAGES',
        msgno TYPE symsgno VALUE '002',
        attr1 TYPE scx_attrname VALUE 'NomenclatureID',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF nomenclature_deleted.

    DATA NomenclatureID TYPE zarv4_nomenclature_id READ-ONLY.

    METHODS constructor
      IMPORTING
        !textid        LIKE if_t100_message=>t100key     OPTIONAL
        !previous      TYPE REF TO cx_root               OPTIONAL
        severity       TYPE if_abap_behv_message=>t_severity DEFAULT if_abap_behv_message=>severity-error
        NomenclatureID TYPE zarv4_d_nome-Nomenclature_ID  OPTIONAL.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_arv4_nomenclature_r IMPLEMENTATION.

  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    CALL METHOD super->constructor
      EXPORTING
        previous = previous.
    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.

    me->if_abap_behv_message~m_severity = severity.
    me->NomenclatureID = NomenclatureID.
  ENDMETHOD.

ENDCLASS.
