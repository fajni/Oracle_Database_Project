--INSERT DATA

--JOBS:
BEGIN
INSERT INTO JOBS(serial_number, job_title, expected_number_of_workers) VALUES(5, 'Shift process coordinator', 14);
INSERT INTO JOBS(serial_number, job_title, expected_number_of_workers) VALUES(8, 'Head of technical preparation', 6);
INSERT INTO JOBS(serial_number, job_title, expected_number_of_workers) VALUES(15, 'Head of department', 5);
INSERT INTO JOBS(serial_number, job_title, expected_number_of_workers) VALUES(10, 'Technical preparation engineer', 9);
INSERT INTO JOBS(serial_number, job_title, expected_number_of_workers) VALUES(23, 'Operator', 20);
INSERT INTO JOBS(serial_number, job_title, expected_number_of_workers) VALUES(17, 'Freelance engineer for tech applications', 8);
INSERT INTO JOBS(serial_number, job_title, expected_number_of_workers) VALUES(66, 'Bathroom manager', 5);
INSERT INTO JOBS(serial_number, job_title, expected_number_of_workers) VALUES(68, 'Foreman', 11);
INSERT INTO JOBS(serial_number, job_title, expected_number_of_workers) VALUES(86, 'Shift foreman', 10);
INSERT INTO JOBS(serial_number, job_title, expected_number_of_workers) VALUES(116, 'Reactor operator', 21);
INSERT INTO JOBS(serial_number, job_title, expected_number_of_workers) VALUES(212, 'Smelter - foundry', 64);
INSERT INTO JOBS(serial_number, job_title, expected_number_of_workers) VALUES(429, 'Maintenance organizer', 11);
INSERT INTO JOBS(serial_number, job_title, expected_number_of_workers) VALUES(118, 'Reactor loader', 71);
INSERT INTO JOBS(serial_number, job_title, expected_number_of_workers) VALUES(531, 'Fire bricklayer', 7);
END;

--DEPARTMENTS:
BEGIN
INSERT INTO DEPARTMENTS(code, title, expected_number_of_workers) VALUES('1A','ADMINISTRATION', 90);
INSERT INTO DEPARTMENTS(code, title, expected_number_of_workers) VALUES('2P','PRODUCTION', 230);
INSERT INTO DEPARTMENTS(code, title, expected_number_of_workers) VALUES('31MM','MECHANICAL MAINTENANCE', 60);
INSERT INTO DEPARTMENTS(code, title, expected_number_of_workers) VALUES('4EM', 'ELECTRICAL MAINTENANCE', 20);
INSERT INTO DEPARTMENTS(code, title, expected_number_of_workers) VALUES('32MM','MRT MAINTENANCE', 15);
INSERT INTO DEPARTMENTS(code, title, expected_number_of_workers) VALUES('5FM', 'FIREPROOF MAINTENANCE', 47);
INSERT INTO DEPARTMENTS(code, title, expected_number_of_workers) VALUES('6PPS', 'PREPARATION AND PROCESSING OF SLAG', 17);
END;

--WORKERS:
BEGIN
INSERT INTO WORKERS(security_number, name, lastname, shift, birth, address, departments_code, serial_number_job) VALUES('0906983775256', 'Emily', 'Smith', 1, TO_DATE('09/06/1983','DD/MM/YYYY'), 'Kralja Petra 1, Srbija', '1A', 5);
INSERT INTO WORKERS(security_number, name, lastname, shift, birth, address, departments_code, serial_number_job) VALUES('2902968000000', 'Ethan', 'Johnson', 1, TO_DATE('19/02/1968','DD/MM/YYYY'), 'Isaka Njutna 6', '1A', 8);
INSERT INTO WORKERS(security_number, name, lastname, shift, birth, address, departments_code, serial_number_job) VALUES('2208962860041', 'Olivia','Williams', 3, TO_DATE('22/08/1962','DD/MM/YYYY'), 'Hajduk Veljka 12/6', '2P', 15);
INSERT INTO WORKERS(security_number, name, lastname, shift, birth, address, departments_code, serial_number_job) VALUES('0111995175102', 'Mason', 'Brown', 2, TO_DATE('01/11/1995','DD/MM/YYYY'), 'Doktora Milovanovića 64/11', '2P', 10);
INSERT INTO WORKERS(security_number, name, lastname, shift, birth, address, departments_code, serial_number_job) VALUES('0108987234606', 'Ava','Davis', 3, TO_DATE('01/08/1987','DD/MM/YYYY'), 'Đure Salaja 12', '31MM', 23);
INSERT INTO WORKERS(security_number, name, lastname, shift, birth, address, departments_code, serial_number_job) VALUES('0509981539923', 'William', 'Jones', 1, TO_DATE('05/09/1998','DD/MM/YYYY'),'Cerska 76/21','4EM', 17);
INSERT INTO WORKERS(security_number, name, lastname, shift, birth, address, departments_code, serial_number_job) VALUES('0101990360007', 'Joel','Miller', 1, TO_DATE('01/01/1990','DD/MM/YYYY'), 'Ive Andrića 23/11', '32MM',66);
INSERT INTO WORKERS(security_number, name, lastname, shift, birth, address, departments_code, serial_number_job) VALUES('0101001890123', 'James', 'Taylor', 3, TO_DATE('01/01/2001','DD/MM/YYYY'), 'Barska 22', '5FM',68);
INSERT INTO WORKERS(security_number, name, lastname, shift, birth, address, departments_code, serial_number_job) VALUES('0101001250028', 'Isabella','Anderson', 1, TO_DATE('16/07/2000','DD/MM/YYYY'), 'Međed Usenović 3', '1A', 86);
INSERT INTO WORKERS(security_number, name, lastname, shift, birth, address, departments_code, serial_number_job) VALUES('0101987330012', 'Benjamin','Wilson', 2, TO_DATE('23/04/1987','DD/MM/YYYY'), 'Tome Milanovića 52/17', '6PPS', 116);
INSERT INTO WORKERS(security_number, name, lastname, shift, birth, address, departments_code, serial_number_job) VALUES('1503998455135', 'Mia','Martinez', 1, TO_DATE('15/03/1998','DD/MM/YYYY'), 'Omladinskih Brigada 11/2', '2P', 531);
END;

--SUPPLIERS:
BEGIN
INSERT INTO SUPPLIERS(code_supplier, name_supplier, address_supplier, phone_supplier) VALUES('1001','XYZ Electronics','123 Main Street, Ayntown, USA','(555) 123-4567');
INSERT INTO SUPPLIERS(code_supplier, name_supplier, address_supplier, phone_supplier) VALUES('1002', 'ABC Foods Inc.', '456 Elm Avenue, Another City, USA', '(555) 987-6543');
INSERT INTO SUPPLIERS(code_supplier, name_supplier, address_supplier, phone_supplier, email_supplier) VALUES('1003', 'KEFO', '789 Oak Lane, Smallville, USA', '(555) 789-0123', 'info@kefo.rs');
INSERT INTO SUPPLIERS(code_supplier, name_supplier, address_supplier, phone_supplier, email_supplier) VALUES('1004','SUPERLAB', '101 Pine Road, Adventure Town, USA', '(555) 321-4567', 'superlab@super-lab.com');
INSERT INTO SUPPLIERS(code_supplier, name_supplier, address_supplier, phone_supplier, email_supplier) VALUES('1005', 'INOX d.o.o.', '321 Cedar Street, Car City, USA', '(555) 234-5678', 'info@inox.rs');
INSERT INTO SUPPLIERS(code_supplier, name_supplier, address_supplier, phone_supplier, email_supplier) VALUES('1006','PITURA','555 Beach Drive, Coastal Village, USA', '(555) 876-5432', 'info@pitura.co.rs');
INSERT INTO SUPPLIERS(code_supplier, name_supplier, address_supplier, phone_supplier, email_supplier) VALUES('1007','ARMEX d.o.o.','222 Garden Avenue, Bloomington, USA', '(555) 456-7890', 'info@armex.rs');
INSERT INTO SUPPLIERS(code_supplier, name_supplier, address_supplier, phone_supplier, email_supplier) VALUES('1008','Dipar d.o.o.','777 Fashion Boulevard, Styleville, USA','(555) 210-9876', 'office@dipar.rs');
INSERT INTO SUPPLIERS(code_supplier, name_supplier, address_supplier, phone_supplier, email_supplier) VALUES('1009','AIGO','888 Hardware Road, Toolsville, USA', '(555) 678-9012', 'office@aigo.rs');
END;

--UNIT_MEASURES:
BEGIN
INSERT INTO UNIT_MEASURES VALUES('kl', 'kiloliter');
INSERT INTO UNIT_MEASURES VALUES('hl', 'hectoliter');
INSERT INTO UNIT_MEASURES VALUES('l', 'liter');
INSERT INTO UNIT_MEASURES VALUES('dl', 'deciliter');
INSERT INTO UNIT_MEASURES VALUES('kg', 'kilogram');
INSERT INTO UNIT_MEASURES VALUES('pie', 'piece');
INSERT INTO UNIT_MEASURES VALUES('pac', 'packet');
END;

--WATER_TYPES:
BEGIN
INSERT INTO WATER_TYPES(id_type, title, description) VALUES('R','REFRIGERATED', 'keep cold');
INSERT INTO WATER_TYPES(id_type, title) VALUES('P','PROCESS');
INSERT INTO WATER_TYPES(id_type, title) VALUES('D','DEMI');
END;

--WATERS:
BEGIN
INSERT INTO WATERS(registration_number, mark, note, id_type) VALUES('1', 'Rl', 'Raw - lake', 'R');
INSERT INTO WATERS(registration_number, mark, note, id_type) VALUES('2', 'Ed', 'Energetic - demi', 'D');
INSERT INTO WATERS(registration_number, mark, note, id_type) VALUES('3', 'Ffd','Flash furnace - demi', 'D');
INSERT INTO WATERS(registration_number, mark, note, id_type) VALUES('4', 'Cd' ,'Cooling desalination','P');
INSERT INTO WATERS(registration_number, mark, note, id_type) VALUES('5', 'Rd', 'Coolant refill', 'R');
INSERT INTO WATERS(registration_number, mark, note, id_type) VALUES('6', 'A','Ammoniacal', 'P');
INSERT INTO WATERS(registration_number, mark, note, id_type) VALUES('7', 'N','Normal', 'R');
INSERT INTO WATERS(registration_number, mark, note, id_type) VALUES('8', 'Pd','Process decarbonized', 'P');
INSERT INTO WATERS(registration_number, mark, note, id_type) VALUES('9', 'B','For boilers', 'R');
INSERT INTO WATERS(registration_number, mark, note, id_type) VALUES('10', 'Ps','Process scrubber', 'P');
INSERT INTO WATERS(registration_number, mark, note, id_type) VALUES('11', 'Re','River', 'R');
INSERT INTO WATERS(registration_number, mark, note, id_type) VALUES('12', 'M','Mountainous', 'R');
END;

--DELIVERIES:
BEGIN
INSERT INTO DELIVERIES(deliver_date, supplier_code, registration_number, id_um, ammount) VALUES(TO_DATE('10/04/2022','DD/MM/YYYY'), '1001', '2', 'l', 60.45);
INSERT INTO DELIVERIES(deliver_date, supplier_code, registration_number, id_um, ammount) VALUES(TO_DATE('02/04/1999','DD/MM/YYYY'), '1002', '5', 'l', 5.50);
INSERT INTO DELIVERIES(deliver_date, supplier_code, registration_number, id_um, ammount) VALUES(TO_DATE('25/10/2012','DD/MM/YYYY'), '1003', '3', 'hl', 2.11);
INSERT INTO DELIVERIES(deliver_date, supplier_code, registration_number, id_um, ammount) VALUES(TO_DATE('12/02/2012','DD/MM/YYYY'), '1004', '4', 'hl', 0.07);
INSERT INTO DELIVERIES(deliver_date, supplier_code, registration_number, id_um, ammount) VALUES(TO_DATE('09/05/1997','DD/MM/YYYY'), '1005', '1','l', 5.49);
INSERT INTO DELIVERIES(deliver_date, supplier_code, registration_number, id_um, ammount) VALUES(TO_DATE('01/07/2017','DD/MM/YYYY'), '1006', '6','pac', 2);
INSERT INTO DELIVERIES(deliver_date, supplier_code, registration_number, id_um, ammount) VALUES(TO_DATE('06/08/1998','DD/MM/YYYY'), '1007', '10','pie', 4);
INSERT INTO DELIVERIES(deliver_date, supplier_code, registration_number, id_um, ammount) VALUES(TO_DATE('03/05/2001','DD/MM/YYYY'), '1008', '8','dl', 300);
INSERT INTO DELIVERIES(deliver_date, supplier_code, registration_number, id_um, ammount) VALUES(TO_DATE('22/01/2020','DD/MM/YYYY'), '1001', '7','pac', 3);
INSERT INTO DELIVERIES(deliver_date, supplier_code, registration_number, id_um, ammount) VALUES(TO_DATE('18/05/2019','DD/MM/YYYY'), '1002', '9','kl', 0.1);
END;

--RECORDS_OF_WATER_BALANCE
BEGIN
INSERT INTO RECORDS_OF_WATER_BALANCE(record_date, registration_number, security_number, initial_state, end_state) VALUES(TO_DATE('01/04/2001','DD/MM/YYYY'), '1', '0906983775256', 1736461, 1737379);
INSERT INTO RECORDS_OF_WATER_BALANCE(record_date, registration_number, security_number, initial_state, end_state) VALUES(TO_DATE('05/02/1998','DD/MM/YYYY'), '3', '2208962860041', 1757677, 1758330);
INSERT INTO RECORDS_OF_WATER_BALANCE(record_date, registration_number, security_number, initial_state, end_state) VALUES(TO_DATE('02/03/2002','DD/MM/YYYY'), '2', '2902968000000', 496382, 496604);
INSERT INTO RECORDS_OF_WATER_BALANCE(record_date, registration_number, security_number, initial_state, end_state) VALUES(TO_DATE('09/02/1998','DD/MM/YYYY'), '3', '1503998455135', 493833, 494002);
INSERT INTO RECORDS_OF_WATER_BALANCE(record_date, registration_number, security_number, initial_state, end_state) VALUES(TO_DATE('12/02/2003','DD/MM/YYYY'), '5', '0101001250028', 30349, 30358);
INSERT INTO RECORDS_OF_WATER_BALANCE(record_date, registration_number, security_number, initial_state, end_state) VALUES(TO_DATE('21/09/2012','DD/MM/YYYY'), '7', '0509981539923', 89872, 89929);
INSERT INTO RECORDS_OF_WATER_BALANCE(record_date, registration_number, security_number, initial_state, end_state) VALUES(TO_DATE('10/12/2002','DD/MM/YYYY'), '10', '0906983775256', 1740515, 1741323);
INSERT INTO RECORDS_OF_WATER_BALANCE(record_date, registration_number, security_number, initial_state, end_state) VALUES(TO_DATE('29/11/2009','DD/MM/YYYY'), '12', '0906983775256', 1759414, 1760140);
INSERT INTO RECORDS_OF_WATER_BALANCE(record_date, registration_number, security_number, initial_state, end_state) VALUES(TO_DATE('17/03/2020','DD/MM/YYYY'), '9', '0111995175102', 215855, 215943);
INSERT INTO RECORDS_OF_WATER_BALANCE(record_date, registration_number, security_number, initial_state, end_state) VALUES(TO_DATE('09/04/2001','DD/MM/YYYY'), '8', '0101990360007', 499366, 499542);
END;