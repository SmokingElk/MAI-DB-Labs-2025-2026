SELECT
    COUNT(m.id) as count
FROM measurement AS m
INNER JOIN workout AS w 
    ON w.id = m.workout_id
WHERE w.id = $1
GROUP BY m.workout_id;