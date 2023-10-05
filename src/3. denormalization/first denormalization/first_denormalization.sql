ALTER TABLE DELIVERIES ADD(
    supplier_name VARCHAR2(30)
);

UPDATE DELIVERIES SET supplier_name = (
    SELECT name_supplier FROM SUPPLIERS
    WHERE DELIVERIES.supplier_code = SUPPLIERS.code_supplier
);

/*1. TRIGGER */
-- First need to be created 2. and 3. trigger then the 1.
CREATE OR REPLACE TRIGGER UPDATE_SUPPLIERS
AFTER UPDATE OF name_supplier ON SUPPLIERS
FOR EACH ROW
DECLARE PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
    EXECUTE IMMEDIATE 'ALTER TRIGGER INSERT_UPDATE_DELIVERIES DISABLE';
    EXECUTE IMMEDIATE 'ALTER TRIGGER UPDATE_DELIVERIES DISABLE';
    UPDATE DELIVERIES SET supplier_name =:NEW.name_supplier
    WHERE DELIVERIES.supplier_code =:NEW.code_supplier;
    EXECUTE IMMEDIATE 'ALTER TRIGGER INSERT_UPDATE_DELIVERIES ENABLE';
    EXECUTE IMMEDIATE 'ALTER TRIGGER UPDATE_DELIVERIES ENABLE';
END;

--Test trigger:
UPDATE SUPPLIERS SET name_supplier = 'Test'
WHERE code_supplier = '1001';

/* 2. TRIGGER */
CREATE OR REPLACE TRIGGER INSERT_UPDATE_DELIVERIES
BEFORE INSERT OR UPDATE ON DELIVERIES
FOR EACH ROW
DECLARE temp_name VARCHAR2(30);
BEGIN
    SELECT name_supplier INTO temp_name FROM SUPPLIERS
    WHERE code_supplier = :NEW.supplier_code;
    :NEW.supplier_name := temp_name;
END;

INSERT INTO DELIVERIES(deliver_date, supplier_code, registration_number, id_um, ammount) VALUES(TO_DATE('25/04/2023','DD/MM/YYYY'), '1001', '9', 'l', 20.45);

--Test Trigger: FROM "XYZ Electronics" TO "ABC Foods Inc"
UPDATE DELIVERIES SET supplier_code = '1002'
WHERE deliver_date = TO_DATE('25/04/2023','DD/MM/YYYY');

DELETE FROM DELIVERIES
WHERE deliver_date = TO_DATE('25/04/2023','DD/MM/YYYY')
    AND supplier_code = '1002';

/* 3. TRIGGER */
CREATE OR REPLACE TRIGGER UPDATE_DELIVERIES
BEFORE UPDATE OF supplier_name ON DELIVERIES
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(
        NUM => -20002,
        MSG => 'Supplier name can not be directly changed!'
    );
END;

--Test Trigger:
UPDATE DELIVERIES SET supplier_name = 'Test'
WHERE deliver_date = ('25/04/2023');