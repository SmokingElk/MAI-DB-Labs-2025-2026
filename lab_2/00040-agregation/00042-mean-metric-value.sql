SELECT 
    AVG(m.value) as mean_value,
	m.metrics_id
FROM measurement AS m
INNER JOIN workout AS w 
    ON w.id = m.workout_id
GROUP BY m.metrics_id
HAVING AVG(m.value) > $1
ORDER BY mean_value DESC
LIMIT $2;