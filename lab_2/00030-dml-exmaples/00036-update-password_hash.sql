UPDATE app_user 
SET password_hash = $2
WHERE id = $1;