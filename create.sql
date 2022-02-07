CREATE OR REPLACE FUNCTION pg_almloss(delay INT) RETURNS VOID AS '$libdir/pg_almloss.so' LANGUAGE C STRICT;

SET statement_timeout = 3000;

-- This will put this backend into the wrong state with a missed signal
SELECT pg_almloss(0);

-- If timeouts are working properly, this should time out within 3 seconds with the error "ERROR:  canceling statement due to statement timeout"
-- If timeouts are not working, it should complete normally at 10 seconds.
SELECT pg_sleep(10);