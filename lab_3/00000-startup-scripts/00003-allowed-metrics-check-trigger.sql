CREATE OR REPLACE FUNCTION check_for_allowed_metrics()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
    constraint_id INTEGER;
    metrics_name VARCHAR(64);
    activity_name VARCHAR(64);
BEGIN
    SELECT id 
    INTO constraint_id 
    FROM allowed_metrics_for_activity AS am
    WHERE am.metrics_id = NEW.metrics_id AND am.activity_id = NEW.activity_id;

    IF constraint_id IS NULL THEN
        SELECT name
        INTO metrics_name
        FROM metrics
        WHERE id = NEW.metrics_id;

        SELECT name
        INTO activity_name
        FROM activity
        WHERE id = NEW.activity_id;

        RAISE EXCEPTION 'Metrics % is not allowed for activity %', metrics_name, activity_name;
    END IF;

    RETURN NEW;
END;
$$;

CREATE TRIGGER allowed_metrics_check
    AFTER INSERT OR UPDATE ON target
    FOR EACH ROW
    EXECUTE FUNCTION check_for_allowed_metrics();