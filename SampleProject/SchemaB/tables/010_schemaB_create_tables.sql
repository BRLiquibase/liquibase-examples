--liquibase formatted sql

--changeset ben:tbl-010 labels:schemaB
CREATE TABLE schema_b.order_header (
  order_id     NUMBER(18)   PRIMARY KEY,
  customer_id  NUMBER(18)   NOT NULL,
  order_ts     TIMESTAMP    DEFAULT SYSTIMESTAMP NOT NULL,
  total_amount NUMBER(12,2) NOT NULL
);
--rollback DROP TABLE schema_b.order_header PURGE;

--changeset ben:tbl-011 labels:schemaB
ALTER TABLE schema_b.order_header
  ADD CONSTRAINT fk_order_customer
  FOREIGN KEY (customer_id) REFERENCES schema_a.customer(customer_id);
--rollback ALTER TABLE schema_b.order_header DROP CONSTRAINT fk_order_customer;
