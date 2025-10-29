CREATE VIEW most_active_users AS 
SELECT
    u.id,
    COUNT(w.id) AS workouts_count 
FROM app_user AS u
LEFT JOIN workout AS w
    ON w.user_id = u.id
GROUP BY u.id
ORDER BY workouts_count DESC
LIMIT 10;