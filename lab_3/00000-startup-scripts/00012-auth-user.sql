CREATE OR REPLACE FUNCTION auth_user(
    IN user_name VARCHAR(32),
    IN user_password VARCHAR(256)
) 
RETURNS BOOLEAN
LANGUAGE plpgsql
AS $$
DECLARE
    is_valid BOOLEAN;
BEGIN 
    SELECT (password_hash = crypt(user_password, password_hash))
    INTO is_valid
    FROM app_user
    WHERE username = user_name;

    IF is_valid IS NULL THEN
        RAISE EXCEPTION 'User % not found', user_name;
    END IF;
    
    RETURN is_valid;
END;
$$;
