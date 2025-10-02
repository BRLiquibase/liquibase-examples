--liquibase formatted sql

--changeset ben:view-100 labels:schemaB
CREATE OR REPLACE VIEW schema_b.v_customer_orders AS
SELECT c.customer_id,
       c.name,
       COALESCE(SUM(o.total_amount), 0) AS total_spend
FROM schema_a.customer c
LEFT JOIN schema_b.order_header o
  ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.name;
--rollback DROP VIEW schema_b.v_customer_orders;
