CREATE TABLE UNIT_MEASURES(
    id_um VARCHAR2(15) primary key,
    title_um VARCHAR2(20) not null
);

CREATE TABLE WATER_TYPES(
    id_type VARCHAR2(10) primary key,
    title VARCHAR2(30) not null,
    description VARCHAR2(40)
);

CREATE TABLE WATERS(
    registration_number VARCHAR2(15) primary key,
    mark VARCHAR2(5) not null,
    note VARCHAR2(35),

    id_type VARCHAR2(10) not null,
    CONSTRAINT fk_WATER FOREIGN KEY(id_type) REFERENCES WATER_TYPES(id_type)

);

CREATE TABLE SUPPLIERS(
    code_supplier VARCHAR2(15) primary key,
    name_supplier VARCHAR2(30) not null,
    address_supplier VARCHAR2(40) not null,
    phone_supplier VARCHAR2(25),
    email_supplier VARCHAR2(35)
);

CREATE TABLE DELIVERIES(
    deliver_date DATE not null,

    supplier_code VARCHAR2(15) not null,
    registration_number VARCHAR2(15) not null,
    ammount NUMBER(5, 2) not null,
    
    note VARCHAR2(30),
    id_um VARCHAR2(15) not null,

    CONSTRAINT fk1_DELIVERIES FOREIGN KEY(supplier_code) REFERENCES SUPPLIERS(code_supplier),
    CONSTRAINT fk2_DELIVERIES FOREIGN KEY(registration_number) REFERENCES WATERS(registration_number),
    CONSTRAINT fk3_DELIVERIES FOREIGN KEY(id_um) REFERENCES UNIT_MEASURES(id_um),

    CONSTRAINT pk_DELIVERIES PRIMARY KEY(deliver_date, supplier_code, registration_number)
);

CREATE TABLE JOBS(
    serial_number NUMBER(3) primary key,
    job_title VARCHAR2(40) not null,
    expected_number_of_workers NUMBER(5) not null
);

CREATE TABLE DEPARTMENTS(
    code VARCHAR2(10) primary key,
    title VARCHAR2(40) not null,
    expected_number_of_workers NUMBER(5) not null
);

CREATE TABLE WORKERS(
    security_number VARCHAR2(13) primary key,
    name VARCHAR2(15) not null,
    lastname VARCHAR2(20) not null,
    shift NUMBER(1) not null,
    birth DATE not null,
    address VARCHAR2(40) not null,
    phone VARCHAR2(15) DEFAULT '/',
    suspended VARCHAR2(5) DEFAULT 'NO',
    injury VARCHAR2(5) DEFAULT 'OK',

    departments_code VARCHAR2(10) not null,
    serial_number_job NUMBER(3) not null,
    CONSTRAINT fk1_WORKERS FOREIGN KEY(departments_code) REFERENCES DEPARTMENTS(code),
    CONSTRAINT fk2_WORKERS FOREIGN KEY(serial_number_job) REFERENCES JOBS(serial_number),

    CONSTRAINT check_SHIFT CHECK (shift IN(1, 2, 3))
);

CREATE TABLE RECORDS_OF_WATER_BALANCE(
    record_date DATE not null,

    registration_number VARCHAR2(15) not null,
    security_number VARCHAR2(13) not null,

    initial_state NUMBER(8) not null,
    end_state NUMBER(8) not null,
    note VARCHAR2(20),

    CONSTRAINT fk1_RECORDS_OF_WATER_BALANCE FOREIGN KEY(registration_number) REFERENCES WATERS(registration_number),
    CONSTRAINT fk2_RECORDS_OF_WATER_BALANCE FOREIGN KEY(security_number) REFERENCES WORKERS(security_number),

    CONSTRAINT pk_RECORDS_OF_WATER_BALANCE PRIMARY KEY(record_date, registration_number, security_number)
);