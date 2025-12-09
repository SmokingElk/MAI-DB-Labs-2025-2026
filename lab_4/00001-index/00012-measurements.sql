EXPLAIN ANALYZE 
SELECT id FROM measurement WHERE value > 100 AND value < 1000; 

CREATE INDEX measurement_value_idx ON measurement(value);

EXPLAIN ANALYZE 
SELECT id FROM measurement WHERE value > 100 AND value < 1000; 
