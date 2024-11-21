CLASS zkv_fill_table DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZKV_FILL_TABLE IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    MODIFY zkvflight FROM  @( VALUE #( client = '100' carrid =  '5' uuid = 1 connid = '534'
                                                airport_from = 'A1' city_from = 'Berlin'
                                                country_from = 'DE' airport_to = 'A2'
                                                city_to = 'Madrid'  ) ).
    IF sy-subrc = 0.
      out->write( 'Done' ).
    ENDIF.


  ENDMETHOD.
ENDCLASS.
