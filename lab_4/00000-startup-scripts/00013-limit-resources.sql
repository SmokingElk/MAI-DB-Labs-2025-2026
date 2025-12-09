ALTER SYSTEM SET shared_buffers = '64MB';
ALTER SYSTEM SET work_mem = '1MB';
ALTER SYSTEM SET maintenance_work_mem = '32MB';
SELECT pg_reload_conf();