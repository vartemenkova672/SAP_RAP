CLASS zcl_arv4_generate_data_transac DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS:
      fill_transactions.
ENDCLASS.

CLASS zcl_arv4_generate_data_transac IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    me->fill_transactions(  ).
  ENDMETHOD.

  METHOD fill_transactions.
    DATA: lt_data TYPE TABLE OF zarv4_d_transact.

    lt_data  = VALUE #(
    ( record_id            = '1'     record             = 1         nomenclature_uuid = 1       responsible_person         = '1'   transaction_date        = '20240825' transaction_time = '090000'
      transaction_quantity = '1500'  transaction_amount = '50000'   transaction_price = '33.33' transaction_price_currency = 'EUR' transaction_description = 'Entering initial balances' )
    ( record_id            = '2'     record             = 2         nomenclature_uuid = 2       responsible_person         = '1'   transaction_date        = '20240826' transaction_time = '090000'
      transaction_quantity = '5000'  transaction_amount = '10000'   transaction_price = 2       transaction_price_currency = 'EUR' transaction_description = 'Entering initial balances' )
    ( record_id            = '3'     record             = 3         nomenclature_uuid = 3       responsible_person         = '1'   transaction_date        = '20240827' transaction_time = '090000'
      transaction_quantity = '5000'  transaction_amount = '15000'   transaction_price = '3'     transaction_price_currency = 'EUR' transaction_description = 'Entering initial balances' )
    ( record_id            = '4'     record             = 4         nomenclature_uuid = 4       responsible_person         = '1'   transaction_date        = '20240828' transaction_time = '090000'
      transaction_quantity = '20000' transaction_amount = '800000'  transaction_price = '40'    transaction_price_currency = 'EUR' transaction_description = 'Entering initial balances' )
    ( record_id            = '5'     record             = 5         nomenclature_uuid = 5       responsible_person         = '1'   transaction_date        = '20240829' transaction_time = '090000'
      transaction_quantity = '9000'  transaction_amount = '270000'  transaction_price = '30'    transaction_price_currency = 'EUR' transaction_description = 'Entering initial balances' )
    ( record_id            = '6'     record             = 6         nomenclature_uuid = 6       responsible_person         = '1'   transaction_date        = '20240925' transaction_time = '090000'
      transaction_quantity = '8000'  transaction_amount = '16000'   transaction_price = '2'     transaction_price_currency = 'EUR' transaction_description = 'Entering initial balances' )
    ( record_id            = '7'     record             = 7         nomenclature_uuid = 7       responsible_person         = '1'   transaction_date        = '20240926' transaction_time = '090000'
      transaction_quantity = '80000' transaction_amount = '480000'  transaction_price = '6'     transaction_price_currency = 'EUR' transaction_description = 'Entering initial balances' )
    ( record_id            = '8'     record             = 8         nomenclature_uuid = 8       responsible_person         = '1'   transaction_date        = '20240927' transaction_time = '090000'
      transaction_quantity = '50000' transaction_amount = '4500000' transaction_price = '90'    transaction_price_currency = 'EUR' transaction_description = 'Entering initial balances' )
    ( record_id            = '9'     record             = 9         nomenclature_uuid = 9       responsible_person         = '1'   transaction_date        = '20240928' transaction_time = '090000'
      transaction_quantity = '90000' transaction_amount = '450000'  transaction_price = '5'     transaction_price_currency = 'EUR' transaction_description = 'Entering initial balances' )
    ( record_id            = '10'    record             = 10        nomenclature_uuid = 10      responsible_person         = '1'   transaction_date        = '20240930' transaction_time = '090000'
      transaction_quantity = '6000'  transaction_amount = '24000'   transaction_price = '4'     transaction_price_currency = 'EUR' transaction_description = 'Entering initial balances' )
    ( record_id            = '11'    record             = 11        nomenclature_uuid = 11      responsible_person         = '1'   transaction_date        = '20241025' transaction_time = '090000'
      transaction_quantity = '9000'  transaction_amount = '45000'   transaction_price = '5'     transaction_price_currency = 'EUR' transaction_description = 'Entering initial balances' )
    ( record_id            = '12'    record             = 12        nomenclature_uuid = 12      responsible_person         = '1'   transaction_date        = '20241125' transaction_time = '090000'
      transaction_quantity = '6000'  transaction_amount = '60000'   transaction_price = '10'    transaction_price_currency = 'EUR' transaction_description = 'Entering initial balances' )
    ( record_id            = '13'    record             = 13        nomenclature_uuid = 13      responsible_person         = '1'   transaction_date        = '20241225' transaction_time = '090000'
      transaction_quantity = '90000' transaction_amount = '45000'   transaction_price = '0.5'   transaction_price_currency = 'EUR' transaction_description = 'Entering initial balances' )
    ( record_id            = '14'    record             = 14        nomenclature_uuid = 14      responsible_person         = '1'   transaction_date        = '20241226' transaction_time = '090000'
      transaction_quantity = '1000'  transaction_amount = '300000'  transaction_price = '300'   transaction_price_currency = 'EUR' transaction_description = 'Entering initial balances' )
    ( record_id            = '15'    record             = 15        nomenclature_uuid = 15      responsible_person         = '1'   transaction_date        = '20241227' transaction_time = '090000'
      transaction_quantity = '1000'  transaction_amount = '590000'  transaction_price = '590'   transaction_price_currency = 'EUR' transaction_description = 'Entering initial balances' )
    ( record_id            = '16'    record             = 16        nomenclature_uuid = 16      responsible_person         = '1'   transaction_date        = '20241228' transaction_time = '090000'
      transaction_quantity = '2000'  transaction_amount = '800000'  transaction_price = '400'   transaction_price_currency = 'EUR' transaction_description = 'Entering initial balances' )

    ).

    DELETE FROM zarv4_d_transact.
    INSERT zarv4_d_transact FROM TABLE @lt_data.
  ENDMETHOD.
ENDCLASS.
