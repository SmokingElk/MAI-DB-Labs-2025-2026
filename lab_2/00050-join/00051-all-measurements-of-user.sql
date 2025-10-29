SELECT 
    m.id,
    m.value,
	m.metrics_id,
    w.created_at AS measurement_time
FROM measurement AS m
LEFT JOIN workout AS w
    ON w.id = m.workout_id
WHERE w.user_id = $1;