SELECT 
    MAX(m.value) AS high_score
FROM measurement AS m
WHERE m.metrics_id = $1
GROUP BY m.metrics_id;