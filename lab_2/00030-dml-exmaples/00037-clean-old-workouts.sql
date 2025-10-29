DELETE FROM workout
WHERE created_at < $1;