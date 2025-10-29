SELECT 
    m.id,
    m.name,
    u.name AS unit_name
FROM metrics AS m
INNER JOIN unit AS u
    ON u.id = m.unit_id
WHERE m.id = $1;