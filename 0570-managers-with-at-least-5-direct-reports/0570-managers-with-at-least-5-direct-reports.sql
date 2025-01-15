-- Write your PostgreSQL query statement below
SELECT name FROM Employee
WHERE id IN (SELECT e.id FROM Employee AS e
JOIN Employee AS m ON (m.managerId = e.id)
GROUP BY e.id
HAVING COUNT(*) >= 5);