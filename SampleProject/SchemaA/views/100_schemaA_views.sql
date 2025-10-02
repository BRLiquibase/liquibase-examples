--liquibase formatted sql

--changeset ben:view-100 labels:schemaA
CREATE OR REPLACE VIEW schema_a.v_customer_orders AS
SELECT c.customer_id,
       c.name,
       COUNT(o.order_id)    AS order_count,
       COALESCE(SUM(o.total_amount), 0) AS total_spend
FROM schema_a.customer c
LEFT JOIN schema_b.order_header o
  ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.name;
--rollback DROP VIEW schema_a.v_customer_orders;
