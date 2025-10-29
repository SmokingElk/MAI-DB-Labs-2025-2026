SELECT
    m.id,
    m.value,
    w.created_at AS measurement_time
FROM target AS t
INNER JOIN metrics AS mt
    ON mt.id = t.metrics_id
LEFT JOIN measurement AS m
    ON m.metrics_id = mt.id
INNER JOIN workout AS w
    ON w.id = m.workout_id
WHERE t.id = $1 AND t.activity_id = w.activity_id;
