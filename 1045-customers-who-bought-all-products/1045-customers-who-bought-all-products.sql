# Write your MySQL query statement below
WITH nodupl AS (SELECT *,
ROW_NUMBER() OVER (PARTITION BY customer_id, product_key) AS rn
FROM customer)
SELECT DISTINCT customer_id
FROM (
    SELECT *,
    COUNT(*) OVER (PARTITION BY customer_id) AS cn FROM nodupl WHERE rn = 1
) AS subq
WHERE cn = (SELECT COUNT(*) FROM product)