--liquibase formatted sql

--changeset ben:trg-400 labels:schemaA splitStatements:false endDelimiter:/
CREATE OR REPLACE TRIGGER schema_a.trg_customer_ai
BEFORE INSERT ON schema_a.customer
FOR EACH ROW
BEGIN
  IF :NEW.customer_id IS NULL THEN
    SELECT schema_a.customer_seq.NEXTVAL INTO :NEW.customer_id FROM dual;
  END IF;
END;
/
--rollback DROP TRIGGER schema_a.trg_customer_ai;
