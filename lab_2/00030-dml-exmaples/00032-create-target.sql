INSERT INTO target(
    id, 
    activity_id, 
    metrics_id, 
    agregation_id, 
    user_id, 
    period,
    target_value
) VALUES (
    $1,
    $2,
    $3,
    $4,
    $5,
    $6,
    $7
);