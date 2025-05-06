# Write your MySQL query statement below
WITH cond AS (
    SELECT *,
    ROW_NUMBER() OVER (ORDER BY id) AS rn,
    id - ROW_NUMBER() OVER (ORDER BY id) AS diff
    FROM stadium
    WHERE people >= 100
)
SELECT
    id,
    visit_date,
    people
FROM (SELECT 
    *,
    COUNT(*) OVER (PARTITION BY diff) AS total_count
FROM cond) AS def_total_count
WHERE total_count >= 3
ORDER BY id