# Write your MySQL query statement below
SELECT class
FROM (
    SELECT class, COUNT(*) AS num_students
    FROM courses
    GROUP BY class
) AS courses_class
WHERE num_students >= 5