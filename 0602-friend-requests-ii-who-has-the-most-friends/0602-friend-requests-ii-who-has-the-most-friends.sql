# Write your MySQL query statement below
WITH req_id AS (SELECT
    requester_id,
    COUNT(*) AS total_req
FROM requestaccepted
GROUP BY requester_id),
acc_id AS (SELECT
    accepter_id,
    COUNT(*) AS total_acc
FROM requestaccepted
GROUP BY accepter_id),
id AS (SELECT requester_id FROM req_id
UNION
SELECT accepter_id FROM acc_id),
final_agg AS (SELECT
    id.requester_id AS id,
    COALESCE(r.total_req, 0) + COALESCE(a.total_acc, 0) AS num
FROM id AS id
LEFT JOIN req_id AS r ON (r.requester_id = id.requester_id)
LEFT JOIN acc_id AS a ON (a.accepter_id = id.requester_id))
SELECT
    *
FROM final_agg
WHERE num = (SELECT MAX(num) FROM final_agg)