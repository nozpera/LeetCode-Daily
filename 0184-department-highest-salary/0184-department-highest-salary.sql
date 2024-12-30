# Write your MySQL query statement below
SELECT d.name AS Department, e.name AS Employee, e.salary AS Salary FROM Employee AS e
JOIN Department AS d ON (d.id = e.departmentId)
WHERE (e.departmentId, Salary) IN 
(SELECT e.departmentId AS departmentId, MAX(e.salary) AS Salary 
FROM Employee AS e
GROUP BY e.departmentId);
