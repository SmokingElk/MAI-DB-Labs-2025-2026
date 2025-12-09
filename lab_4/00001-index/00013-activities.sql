EXPLAIN ANALYZE
SELECT id, name FROM activity WHERE name LIKE '%swimming%';

CREATE INDEX idx_name_gin ON activity USING gin (name gin_trgm_ops);

EXPLAIN ANALYZE
SELECT id, name FROM activity WHERE name LIKE '%swimming%';