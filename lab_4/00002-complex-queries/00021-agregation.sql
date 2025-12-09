EXPLAIN ANALYZE
SELECT workout_id, SUM(value) 
FROM measurement 
GROUP BY workout_id
ORDER BY workout_id;

CREATE INDEX measurement_workout_id_idx ON measurement(workout_id) INCLUDE (value);

EXPLAIN ANALYZE
SELECT workout_id, SUM(value) 
FROM measurement 
GROUP BY workout_id
ORDER BY workout_id;