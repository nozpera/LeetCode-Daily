# Write your MySQL query statement below
WITH filtered AS (SELECT
    s.seller_id,
    p.product_id,
    p.product_name,
    p.unit_price,
    s.sale_date,
    s.quantity,
    s.price
FROM sales AS s
INNER JOIN product AS p ON (p.product_id = s.product_id)),
include AS (SELECT *
FROM filtered
WHERE sale_date BETWEEN date('2019-01-01') AND date('2019-04-01')),
exclude AS (SELECT *
FROM filtered
WHERE sale_date NOT BETWEEN date('2019-01-01') AND date('2019-04-01'))
SELECT DISTINCT i.product_id, i.product_name
FROM include AS i
LEFT JOIN exclude AS e ON (e.product_id=i.product_id)
WHERE e.product_id IS NULL