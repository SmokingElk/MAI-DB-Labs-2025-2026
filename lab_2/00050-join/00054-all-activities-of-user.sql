SELECT
    a.id,
    a.name
FROM target AS t
INNER JOIN activity AS a
    ON t.activity_id = a.id
WHERE t.user_id = $1
GROUP BY a.id;