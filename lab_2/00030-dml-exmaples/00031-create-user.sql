INSERT INTO app_user (
    id, 
    username, 
    password_hash
) VALUES (
    $1, 
    $2, 
    $3
);