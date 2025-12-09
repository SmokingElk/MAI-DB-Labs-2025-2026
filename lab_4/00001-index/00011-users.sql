EXPLAIN ANALYZE
SELECT password_hash FROM app_user WHERE username = 'Вася';

EXPLAIN ANALYZE
SELECT username FROM app_user ORDER BY username DESC LIMIT 10;

CREATE INDEX app_user_name_idx ON app_user(username);

EXPLAIN ANALYZE
SELECT password_hash FROM app_user WHERE username = 'Вася';

EXPLAIN ANALYZE
SELECT username FROM app_user ORDER BY username DESC LIMIT 10;