CREATE INDEX search_WORKERS_lastname_name ON WORKERS(lastname, name);

CREATE INDEX search_WORKERS_birth ON WORKERS(birth);

CREATE INDEX search_SUPPLIERS ON SUPPLIERS(name_supplier);

CREATE UNIQUE INDEX search_WATERS ON WATERS(mark, note);