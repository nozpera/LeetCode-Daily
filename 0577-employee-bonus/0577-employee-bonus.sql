-- Write your PostgreSQL query statement below
SELECT
    e.name,
    b.bonus
FROM employee AS e
LEFT JOIN bonus AS b ON (b.empid = e.empid)
WHERE b.bonus < 1000 OR b.bonus IS NULL;