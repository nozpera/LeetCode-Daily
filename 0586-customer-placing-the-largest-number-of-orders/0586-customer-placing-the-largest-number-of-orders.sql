# Write your MySQL query statement below
SELECT customer_number FROM (
    SELECT customer_number, COUNT(*) AS count_orders
    FROM orders
    GROUP BY customer_number
) AS counter_order 
ORDER BY count_orders DESC 
LIMIT 1