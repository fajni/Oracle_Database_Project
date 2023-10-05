ALTER TABLE RECORDS_OF_WATER_BALANCE ADD(
    CONSTRAINT check_initial_state CHECK(end_state>=initial_state),
    total_consumption NUMBER(8, 2)
);

UPDATE RECORDS_OF_WATER_BALANCE r SET total_consumption = (
    SELECT end_state - initial_state
    FROM RECORDS_OF_WATER_BALANCE
    WHERE record_date = r.record_date
);

ALTER TABLE RECORDS_OF_WATER_BALANCE MODIFY total_consumption NOT NULL;

/* 1. TRIGGER */
CREATE OR REPLACE TRIGGER INSERT_UPDATE_RECORDS
BEFORE INSERT OR UPDATE OF initial_state, end_state ON RECORDS_OF_WATER_BALANCE
FOR EACH ROW
DECLARE PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
    :NEW.total_consumption := :NEW.end_state - :NEW.initial_state;
END;

--Test trigger:
INSERT INTO RECORDS_OF_WATER_BALANCE(record_date, registration_number, security_number, initial_state, end_state) VALUES(TO_DATE('03/05/2023','DD/MM/YYYY'), '4', '0906983775256', 3, 10);

UPDATE RECORDS_OF_WATER_BALANCE SET initial_state = 2
WHERE record_date = TO_DATE('03/05/2023','DD/MM/YYYY');

UPDATE RECORDS_OF_WATER_BALANCE SET end_state = 5
WHERE record_date = TO_DATE('03/05/2023','DD/MM/YYYY');

SELECT * FROM RECORDS_OF_WATER_BALANCE
ORDER BY record_date DESC;

/* 2. TRIGGER */
CREATE OR REPLACE TRIGGER UPDATE_RECORDS
BEFORE UPDATE OF total_consumption ON RECORDS_OF_WATER_BALANCE
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(
        NUM => -20002,
        MSG => 'Column total_consumption can not be directly modify/updated!'
    );
END;

--Test trigger:
UPDATE RECORDS_OF_WATER_BALANCE SET total_consumption = 9
WHERE record_date = TO_DATE('03/05/2023','DD/MM/YYYY');