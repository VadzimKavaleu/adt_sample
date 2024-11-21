CLASS zcl_test_check DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_TEST_CHECK IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
*    DATA: lo_obj1 TYPE REF TO lcl_test,
*          lo_obj2 TYPE REF TO lcl_test,
*          lo_tab  TYPE TABLE OF REF TO lcl_test.
*
*    TRY.
*        lo_obj1 = NEW #( carrier_id = 'SQ' connection_id = '0001' ).
*        lo_obj2 = NEW #( carrier_id = 'S1' connection_id = '0001' ).
*      CATCH cx_abap_invalid_value INTO DATA(lx_data).
*        out->write( lx_data->get_text(  ) ).
*    ENDTRY.
*
*    lo_obj1->get_data( IMPORTING ev_airport_from_id = DATA(lv_from)
*                                 ev_airport_to_id = DATA(lv_to)
*                                 ev_carrier_name = DATA(carrier_name) ).
*
*    out->write( data = lv_from name = 'from' ).
*    out->write( data = lv_to name = 'to' ).
*    out->write( data = carrier_name name = 'name' ).


* select Countrycode from /DMO/I_Airport INTO table @DATA(LS_TAB).
    SELECT countrycode
          FROM /DMO/I_Airport WHERE CountryCode = 'US'
          INTO TABLE @DATA(lt_tab).



  ENDMETHOD.
ENDCLASS.
