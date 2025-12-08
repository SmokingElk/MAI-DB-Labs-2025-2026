CREATE OR REPLACE FUNCTION update_users_audit()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO users_audit(op, user_id, user_name) 
        VALUES ('CRT', NEW.id, NEW.username);
    ELSEIF TG_OP = 'UPDATE' THEN
        INSERT INTO users_audit(op, user_id, user_name) 
        VALUES ('UPD', NEW.id, NEW.username);
    ELSEIF TG_OP = 'DELETE' THEN
        INSERT INTO users_audit(op, user_id, user_name) 
        VALUES ('DEL', OLD.id, OLD.username);
    END IF;
    
    IF TG_OP = 'DELETE' THEN
        RETURN OLD;
    END IF;
    
    RETURN NEW;
END;
$$;

CREATE TRIGGER users_changes
    AFTER INSERT OR UPDATE OR DELETE ON app_user
    FOR EACH ROW
    EXECUTE FUNCTION update_users_audit();