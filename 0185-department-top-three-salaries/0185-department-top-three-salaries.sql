# Write your MySQL query statement below
SELECT Department, Employee, Salary 
FROM (
    SELECT 
    d.name AS Department, 
    e.name AS Employee, 
    e.departmentId, 
    e.salary AS Salary, 
    DENSE_RANK() OVER (PARTITION BY e.departmentId ORDER BY Salary DESC) AS urutan 
FROM Employee AS e
JOIN Department AS d ON (d.id = e.departmentId) 
) AS sub_queries
WHERE urutan <= 3;
