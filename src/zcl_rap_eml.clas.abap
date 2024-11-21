CLASS zcl_rap_eml DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_RAP_EML IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
*    DATA: lt_employee TYPE STANDARD TABLE OF zkvemployee,
*          lt_company  TYPE STANDARD TABLE OF zkvcompany.
*
*    TRY.
*        DATA(lv_guid) = cl_system_uuid=>create_uuid_x16_static( ).
*        DATA(lv_guid1) = cl_system_uuid=>create_uuid_x16_static( ).
*        DATA(lv_guid3) = cl_system_uuid=>create_uuid_x16_static( ).
*        DATA(lv_guid4) = cl_system_uuid=>create_uuid_x16_static( ).
*      CATCH cx_uuid_error.
*    ENDTRY.
*
*    lt_employee = VALUE #( ( employeeuuid = lv_guid  companyuuid = lv_guid3 firstname = 'Marya' secondname = 'Solr' age = 26 emloyeeid = 1 experience = 4 )
*                           ( employeeuuid = lv_guid1  companyuuid = lv_guid4 firstname = 'Andy' secondname = 'Drey' age = 33 emloyeeid = 2 experience = 5 ) ).
*
*    DELETE FROM zkvemployee.
*    INSERT zkvemployee FROM TABLE @lt_employee.
*    IF sy-subrc = 0.
*      out->write( 'Done 1' ).
*    ENDIF.
*
*    lt_company = VALUE #(  ( companyid = 1 companyuuid = lv_guid3 city = 'Boston' phone = '14453434' companyname = 'Motors' capacity = 33 )
*                           ( companyid = 1 companyuuid = lv_guid4 city = 'Berlin' phone = '98654467' companyname = 'Travel' capacity = 40 ) ).
*
*    INSERT zkvcompany FROM TABLE @lt_company.
*    IF sy-subrc = 0.
*      out->write(  'Done 2' ).
*    ENDIF.

*    DATA: lt_code TYPE STANDARD TABLE OF zkvcode.
*
*    lt_code = VALUE #( ( phone = '14453434' code = '+11') ( phone = '98654467' code = '+889') ).
*    INSERT zkvcode FROM TABLE @lt_code.
*    IF sy-subrc = 0.
*      out->write( 'DOne' ).
*    ENDIF.

    DATA: lt_info TYPE STANDARD TABLE OF zkvinfo.

    lt_info = VALUE #( ( companyname = 'Motors' country = 'US' language = 'EN' ) ( companyname = 'Travel' country = 'GE' language = 'DE' ) ( companyname = 'CarSelect' country = 'US' language = 'EN' ) ).

    INSERT zkvinfo FROM TABLE @lt_info.
    IF sy-subrc = 0.
      out->write( 'Done' ).
    ENDIF.


  ENDMETHOD.
ENDCLASS.
