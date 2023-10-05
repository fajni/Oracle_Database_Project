CREATE OR REPLACE PROCEDURE add_supplier
    (temp_code VARCHAR2,
    temp_name VARCHAR2,
    temp_address VARCHAR2)
IS
supplier NUMBER := 0;
BEGIN
    SELECT COUNT(*) INTO supplier FROM SUPPLIERS
    WHERE code_supplier = temp_code;

    IF supplier > 0
        THEN DBMS_OUTPUT.PUT_LINE('Supplier with code '||temp_code||' already exist!');
    ELSE
        INSERT INTO SUPPLIERS(code_supplier, name_supplier, address_supplier) VALUES(temp_code, temp_name, temp_address);
        DBMS_OUTPUT.PUT_LINE('Added supplier with '||temp_code||' code!');
    END IF;
    EXCEPTION WHEN OTHERS
        THEN RAISE_APPLICATION_ERROR(-20001, 'ERROR!');
END add_supplier;

--Test procedure:
DECLARE
    temp_code VARCHAR2(15);
    temp_name VARCHAR2(30);
    temp_address VARCHAR2(40);
BEGIN
    temp_code := '1';
    temp_name := 'Test';
    temp_address := 'Address Test';
    add_supplier(temp_code, temp_name, temp_address);
END;

DELETE FROM SUPPLIERS WHERE code_supplier = '1'