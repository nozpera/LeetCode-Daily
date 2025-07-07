# Write your MySQL query statement below
WITH merged AS (SELECT p.project_id, e.employee_id, e.name, e.experience_years
FROM project AS p
INNER JOIN employee AS e ON (e.employee_id = p.employee_id))
SELECT project_id, ROUND(AVG(experience_years), 2) AS average_years
FROM merged GROUP BY 1