# Write your MySQL query statement below
SELECT DISTINCT customer_id
FROM (SELECT customer_id,
COUNT(*) OVER (PARTITION BY customer_id) AS cn
FROM customer) AS sq
WHERE cn = (SELECT COUNT(*) FROM product)