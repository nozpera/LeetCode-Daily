# Write your MySQL query statement below

SELECT 
    score
    CASE
        WHEN COUNT(*) > 1 THEN 'Duplicated'
        ELSE 'NOPE'
    END AS 'RANK'
FROM scores 
ORDER BY score DESC;