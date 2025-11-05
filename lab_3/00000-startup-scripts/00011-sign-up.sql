CREATE OR REPLACE FUNCTION sign_up(
    IN user_name VARCHAR(32),
    IN user_password VARCHAR(256)
)
RETURNS UUID
LANGUAGE plpgsql
AS $$
DECLARE
    user_id UUID;
BEGIN
    INSERT INTO app_user(
        id,
        username,
        password_hash
    ) VALUES (
        gen_random_uuid(),
        user_name,
        crypt(user_password, gen_salt('bf', 12))
    ) RETURNING id INTO user_id;

    RETURN user_id; 

EXCEPTION
    WHEN unique_violation THEN
        RAISE EXCEPTION 'User % already exists', user_name;
    WHEN others THEN 
        RAISE EXCEPTION 'Failed to create user with name %, reason: %', user_name, SQLERRM; 

END;
$$;