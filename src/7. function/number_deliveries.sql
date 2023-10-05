CREATE OR REPLACE FUNCTION number_deliveries
    (temp_date IN DATE)
RETURN VARCHAR2
IS
number_of_deliveries NUMBER;
BEGIN
    SELECT COUNT(deliver_date) INTO number_of_deliveries
    FROM DELIVERIES
    WHERE deliver_date = temp_date;

    IF number_of_deliveries > 0
        THEN RETURN 'Number of all deliveries for '||temp_date||' date is: '||number_of_deliveries;
    ELSE
        RETURN 'There are no deliveries for '||temp_date||' date';
    END IF;
    EXCEPTION WHEN OTHERS THEN RAISE_APPLICATION_ERROR(-20001, 'ERROR!');
END;

--Test function:
SELECT number_deliveries(TO_DATE('10/04/2022','DD/MM/YYYY')) AS "Number of deliveries" FROM DUAL;