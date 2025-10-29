SELECT 
    SUM(m.value) AS sum_value
FROM measurement AS m
WHERE m.metrics_id = $1
GROUP BY m.metrics_id;