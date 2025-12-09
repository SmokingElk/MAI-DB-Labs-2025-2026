EXPLAIN ANALYZE
SELECT w.id, m.id 
FROM workout AS w
JOIN measurement AS m
ON w.id = m.workout_id;

CREATE INDEX measurement_workout_id_idx ON measurement(workout_id);

EXPLAIN ANALYZE
SELECT w.id, m.id 
FROM workout AS w
JOIN measurement AS m
ON w.id = m.workout_id;