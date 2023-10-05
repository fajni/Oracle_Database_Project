ALTER TABLE WORKERS ADD(
    job_title VARCHAR2(40)
);

UPDATE WORKERS SET job_title = (
    SELECT job_title FROM JOBS
    WHERE WORKERS.serial_number_job = JOBS.serial_number
);

ALTER TABLE WORKERS MODIFY job_title VARCHAR2(40) not null;

/* 1. TRIGGER */
CREATE OR REPLACE TRIGGER UPDATE_JOBS
AFTER UPDATE OF job_title ON JOBS
FOR EACH ROw
DECLARE PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
    EXECUTE IMMEDIATE 'ALTER TRIGGER INSERT_UPDATE_WORKERS DISABLE';
    EXECUTE IMMEDIATE 'ALTER TRIGGER UPDATE_WORKERS DISABLE';
    UPDATE WORKERS SET job_title =:NEW.job_title
    WHERE WORKERS.serial_number_job =:NEW.serial_number;
    EXECUTE IMMEDIATE 'ALTER TRIGGER INSERT_UPDATE_WORKERS ENABLE';
    EXECUTE IMMEDIATE 'ALTER TRIGGER UPDATE_WORKERS ENABLE';
END;

--Test trigger:
UPDATE JOBS SET job_title = 'Test'
WHERE serial_number='1001';

/* 2. TRIGGER */
CREATE OR REPLACE TRIGGER INSERT_UPDATE_WORKERS
BEFORE INSERT OR UPDATE ON WORKERS
FOR EACH ROw
DECLARE temp_title VARCHAR2(40);
BEGIN
    SELECT job_title INTO temp_title FROM JOBS
    WHERE serial_number =:NEW.serial_number_job;
    :NEW.job_title := temp_title;
END;

INSERT INTO WORKERS(security_number, name, lastname, shift, birth, address, departments_code, serial_number_job) VALUES('0906984775256', 'John', 'Whick', 1, TO_DATE('09/06/1984','DD/MM/YYYY'), '789 Oak Lane, Smallville, USA', '1A', 5);

--Test trigger:
UPDATE WORKERS SET serial_number_job = 23
WHERE security_number LIKE ('0906984775256');

/* 3. TRIGGER */
CREATE OR REPLACE TRIGGER UPDATE_WORKERS
BEFORE UPDATE OF job_title ON WORKERS
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(
        NUM => -20002,
        MSG => 'Job title column can not be directly changed!'
    );
END;

--Test trigger:
UPDATE WORKERS SET job_title = 'Test'
WHERE security_number LIKE ('0906984775256');