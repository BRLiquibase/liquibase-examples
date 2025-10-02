--liquibase formatted sql

--changeset ben:proc-200 labels:schemaA runOnChange:true splitStatements:false endDelimiter:/
CREATE OR REPLACE PROCEDURE schema_a.upsert_customer (
  p_customer_id IN NUMBER,
  p_name        IN VARCHAR2
) AUTHID DEFINER
AS
BEGIN
  MERGE INTO schema_a.customer c
  USING (SELECT p_customer_id AS id, p_name AS name FROM dual) src
  ON (c.customer_id = src.id)
  WHEN MATCHED THEN
    UPDATE SET c.name = src.name
  WHEN NOT MATCHED THEN
    INSERT (customer_id, name) VALUES (src.id, src.name);
END;
/
--rollback DROP PROCEDURE schema_a.upsert_customer;
