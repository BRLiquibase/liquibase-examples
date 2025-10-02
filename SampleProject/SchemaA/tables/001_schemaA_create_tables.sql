--liquibase formatted sql

--changeset ben:tbl-001 labels:schemaA
CREATE TABLE schema_a.customer (
  customer_id NUMBER(18)    PRIMARY KEY,
  name        VARCHAR2(200) NOT NULL,
  created_ts  TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL
);
--rollback DROP TABLE schema_a.customer PURGE;

--changeset ben:tbl-002 labels:schemaA
CREATE SEQUENCE schema_a.customer_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
--rollback DROP SEQUENCE schema_a.customer_seq;

--changeset ben:tbl-003 labels:schemaA
CREATE INDEX schema_a.ix_customer_name ON schema_a.customer(name);
--rollback DROP INDEX schema_a.ix_customer_name;
