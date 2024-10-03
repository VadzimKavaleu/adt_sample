CLASS lhc_Company DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Company RESULT result.
    METHODS acceptcompany FOR MODIFY
      IMPORTING keys FOR ACTION company~acceptcompany RESULT result.

    METHODS adddescription FOR MODIFY
      IMPORTING keys FOR ACTION company~adddescription RESULT result.

    METHODS createcompanybytemplate FOR MODIFY
      IMPORTING keys FOR ACTION company~createcompanybytemplate RESULT result.

    METHODS rejectcompany FOR MODIFY
      IMPORTING keys FOR ACTION company~rejectcompany RESULT result.

    METHODS get_features FOR FEATURES IMPORTING keys REQUEST features FOR Company RESULT result.

ENDCLASS.

CLASS lhc_Company IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD AcceptCompany.

    MODIFY ENTITIES OF zkv_r_companytp in local mode
      ENTITY Company
      UPDATE FROM VALUE #( FOR ls_key IN keys ( %tky = ls_key-%tky
                                                          %data-Status = 'A'
                                                          %control-Status = if_abap_behv=>mk-on ) )
      MAPPED DATA(lt_mapped)
      FAILED DATA(lt_upd_failed)
      REPORTED DATA(lt_upd_reported).


    READ ENTITIES OF zkv_r_companytp in local mode
    ENTITY Company
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(lt_company_upd)
    FAILED DATA(lt_failed_upd)
    REPORTED DATA(lt_reported_upd).

    result = VALUE #( FOR ls_company IN lt_company_upd ( %tky = ls_company-%tky %param =  ls_company ) ).



  ENDMETHOD.

  METHOD AddDescription.
  ENDMETHOD.

  METHOD CreateCompanyByTemplate.
    DATA: lt_new_company TYPE TABLE FOR CREATE zkv_r_companytp\\Company.

    SELECT MAX( companyid ) FROM zkvcompany INTO @DATA(lv_companyid).

    READ ENTITIES OF zkv_r_companytp
    ENTITY Company
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(lt_company)
    FAILED DATA(lt_failed)
    REPORTED DATA(lt_reported).

    lt_new_company = VALUE #( FOR ls_company IN lt_company
                                      ( %cid = '10'
                                       %data = VALUE #( Companyid = lv_companyid + 1
                                                        Companyname = 'NEW COMPANY'
                                                        city = ls_company-City
                                                        phone = ls_company-Phone
                                                        status = 'O'
                                                        Capacity = ls_company-Capacity
                                                        Description = 'CREATED FROM TEMPLATE' )
                                       %control = VALUE #( Companyid = if_abap_behv=>mk-on
                                                        Companyname = if_abap_behv=>mk-on
                                                        city = if_abap_behv=>mk-on
                                                        phone = if_abap_behv=>mk-on
                                                        status = if_abap_behv=>mk-on
                                                        Capacity = if_abap_behv=>mk-on
                                                        Description = 'CREATED FROM TEMPLATE' ) ) ).

    MODIFY ENTITIES OF zkv_r_companytp IN LOCAL MODE
    ENTITY Company
    CREATE FROM lt_new_company
     MAPPED DATA(ls_data)
     REPORTED DATA(lt_rep)
     FAILED DATA(lt_failed1).

     read entities of zkv_r_companytp in local mode
     entity Company
     all fields WITH value #( (  %tky = ls_data-company[ 1 ]-%tky ) )
     result data(lt_result).

    result = VALUE #( FOR ls_data_res IN lt_result (  %tky = keys[ 1 ]-%tky
    %param =  ls_data_res  ) ).

  ENDMETHOD.

  METHOD RejectCompany.
    MODIFY ENTITIES OF zkv_r_companytp
        ENTITY Company
        UPDATE FROM VALUE #( FOR ls_key IN keys ( %tky-Companyuuid = ls_key-Companyuuid
                                                            %data-Status = 'R'
                                                            %control-Status = if_abap_behv=>mk-on ) )
        MAPPED DATA(lt_mapped)
        FAILED DATA(lt_upd_failed)
        REPORTED DATA(lt_upd_reported).


    READ ENTITIES OF zkv_r_companytp
    ENTITY Company
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(lt_company_upd)
    FAILED DATA(lt_failed_upd)
    REPORTED DATA(lt_reported_upd).

    result = VALUE #( FOR ls_company IN lt_company_upd ( %param = CORRESPONDING #( ls_company ) ) ).
  ENDMETHOD.

  METHOD get_features.

    READ ENTITIES OF zkv_r_companytp
    ENTITY Company
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(lt_result)
    FAILED DATA(lt_failed).

    result = VALUE #( FOR ls_result IN lt_result ( %tky = ls_result-%tky
                                                   %action-AcceptCompany = COND #( WHEN ls_result-Status = 'A' THEN if_abap_behv=>fc-o-disabled ELSE if_abap_behv=>fc-o-enabled  )
                                                   %action-RejectCompany = COND #( WHEN ls_result-Status = 'R' THEN if_abap_behv=>fc-o-disabled ELSE if_abap_behv=>fc-o-enabled ) ) ).

  ENDMETHOD.

ENDCLASS.
