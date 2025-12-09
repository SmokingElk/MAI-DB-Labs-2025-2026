EXPLAIN ANALYZE
SELECT m.id, mt.name FROM measurement AS m
JOIN metrics AS mt
ON mt.id = m.metrics_id
WHERE m.metrics_id = '40000000-0000-0000-0000-000000000003';

CREATE INDEX measurement_metrics_hash ON measurement USING hash(metrics_id);

EXPLAIN ANALYZE
SELECT m.id, mt.name FROM measurement AS m
JOIN metrics AS mt
ON mt.id = m.metrics_id
WHERE m.metrics_id = '40000000-0000-0000-0000-000000000003';