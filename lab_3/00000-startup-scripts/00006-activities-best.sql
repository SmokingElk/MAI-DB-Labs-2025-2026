CREATE VIEW activities_best AS
SELECT 
    u.id AS user_id,
    a.id AS activity_id,
    mt.id AS metrics_id,
    MAX(m.value) AS best_value
FROM app_user AS u
LEFT JOIN target AS t
    ON u.id = t.user_id
INNER JOIN activity AS a
    ON a.id = t.activity_id
INNER JOIN metrics AS mt
    ON mt.id = t.metrics_id
LEFT JOIN measurement AS m
    ON m.metrics_id = mt.id
INNER JOIN workout AS w
    ON w.id = m.workout_id
WHERE w.activity_id = t.activity_id
GROUP BY u.id, a.id, mt.id;