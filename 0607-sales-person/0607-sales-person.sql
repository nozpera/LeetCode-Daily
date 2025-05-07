# Write your MySQL query statement below
SELECT name
FROM salesperson
WHERE sales_id NOT IN (
    SELECT DISTINCT sales_id
    FROM orders AS o
    INNER JOIN company AS c
    ON (c.com_id = o.com_id)
    WHERE c.name = 'RED'
)