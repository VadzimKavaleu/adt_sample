*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lcl_test DEFINITION.

  PUBLIC SECTION.
    TYPES: ty_name TYPE c LENGTH 20.
    METHODS constructor
      IMPORTING
                carrier_id    TYPE /dmo/carrier_id
                connection_id TYPE /dmo/connection_id
      RAISING   cx_abap_invalid_value.

    METHODS get_data
      EXPORTING
        ev_airport_from_id TYPE /dmo/airport_from_id
        ev_airport_to_id   TYPE /dmo/airport_to_id
        ev_carrier_name    TYPE /dmo/carrier_name.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA: airport_from_id TYPE /dmo/airport_from_id,
          airport_to_id   TYPE /dmo/airport_to_id,
          carrier_name    TYPE /dmo/carrier_name.

ENDCLASS.

CLASS lcl_test IMPLEMENTATION.

  METHOD constructor.

    IF connection_id IS INITIAL AND carrier_id IS INITIAL.
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.

    SELECT SINGLE DepartureAirport, DestinationAirport, \_Airline-name  FROM /DMO/I_Connection
    WHERE AirlineID = @carrier_id AND ConnectionID = @connection_id
    INTO ( @airport_from_id, @airport_to_id, @carrier_name ).

    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.

  ENDMETHOD.

  METHOD get_data.
    ev_airport_from_id = me->airport_from_id.
    ev_airport_to_id = me->airport_to_id.
    ev_carrier_name = me->carrier_name.
  ENDMETHOD.





ENDCLASS.
