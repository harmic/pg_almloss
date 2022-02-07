CREATE OR REPLACE FUNCTION pg_almloss(delay INT) RETURNS VOID AS '$libdir/pg_almloss.so' LANGUAGE C STRICT;

SET statement_timeout = 3000;

-- If timeouts are working properly, this should time out within 3 seconds
SELECT pg_sleep(10);