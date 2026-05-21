WITH customer_summary AS (
    SELECT c.customer_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.order_amount) AS total_spent ,
    AVG(o.order_amount) AS avg_order_value
    FROM orders o
    JOIN customers c ON c.customer_id = o.customer_id
    GROUP BY c.customer_name
)
SELECT customer_name , total_orders, total_spent, avg_order_value
  FROM customer_summary
  WHERE total_spent > (
  SELECT AVG(total_spent) FROM customer_summary)
  AND total_orders >= 2;