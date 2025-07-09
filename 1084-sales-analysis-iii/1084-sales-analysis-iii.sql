# Write your MySQL query statement below
WITH filtered AS (SELECT
    s.seller_id,
    p.product_id,
    p.product_name,
    p.unit_price,
    s.sale_date,
    s.quantity,
    s.price,
    COUNT(*) OVER (PARTITION BY p.product_id) AS rn
FROM sales AS s
INNER JOIN product AS p ON (p.product_id = s.product_id)),
double_filter AS (SELECT *
FROM filtered
WHERE rn = 1)
SELECT product_id, product_name
FROM double_filter
WHERE sale_date BETWEEN date('2019-01-01') AND date('2019-03-31')