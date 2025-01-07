# Write your MySQL query statement below
SELECT id
FROM (
    SELECT id, recordDate, temperature,
    LAG(recordDate) OVER (ORDER BY recordDate) AS prev_date,
    LAG(temperature) OVER (ORDER BY recordDate) AS prev_temperature
    FROM Weather
) AS sub
WHERE DATEDIFF(recordDate,prev_date) = 1
    AND temperature > prev_temperature;