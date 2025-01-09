# Write your MySQL query statement below
WITH CancelOrders AS(
    SELECT request_at AS Day, 
    COUNT(*) AS Cancel_orders
    FROM
        (SELECT id, t.client_id, t.driver_id, t.city_id, t.status, t.request_at, uc.banned AS banned_client, uc.role AS role_client, ud.banned AS banned_driver, ud.role AS role_driver FROM Trips AS t
        JOIN Users AS uc ON (uc.users_id = t.client_id)
        JOIN Users AS ud ON (ud.users_id = t.driver_id)
        WHERE uc.banned = 'No' AND ud.banned = 'No'
        ORDER BY t.request_at) AS sub_cancel
    WHERE 
        status != 'completed'
    GROUP BY 
    request_at
    ORDER BY 
    request_at
),
TotalOrders AS(
    SELECT request_at AS Day, 
    COUNT(*) AS Total_orders
    FROM
        (SELECT id, t.client_id, t.driver_id, t.city_id, t.status, t.request_at, uc.banned AS banned_client, uc.role AS role_client, ud.banned AS banned_driver, ud.role AS role_driver FROM Trips AS t
        JOIN Users AS uc ON (uc.users_id = t.client_id)
        JOIN Users AS ud ON (ud.users_id = t.driver_id)
        WHERE uc.banned = 'No' AND ud.banned = 'No'
        ORDER BY t.request_at) AS sub_total
    GROUP BY 
    request_at
)
SELECT tot.Day, 
CASE
    WHEN co.Cancel_orders / tot.Total_orders IS NULL THEN 0
    ELSE ROUND(co.Cancel_orders / tot.Total_orders, 2)
    END AS 'Cancellation Rate'
FROM CancelOrders AS co
RIGHT JOIN TotalOrders AS tot ON (tot.Day = co.Day)
WHERE tot.Day BETWEEN '2013-10-01' AND '2013-10-03';