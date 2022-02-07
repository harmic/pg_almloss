/*
 * Postgres custom function that will simulate the condition of losing an ALRM signal
 */

#include "postgres.h"
#include "fmgr.h"
#include <sys/time.h>
#include <errno.h>
#include <unistd.h>

PG_MODULE_MAGIC;

/*
 * CREATE OR REPLACE FUNCTION pg_almloss_c() RETURNS VOID AS '$libdir/pg_almloss.so' LANGUAGE C STRICT;
 */

Datum pg_almloss( PG_FUNCTION_ARGS );
PG_FUNCTION_INFO_V1(pg_almloss);

Datum pg_almloss(PG_FUNCTION_ARGS) {
	
	if (PG_ARGISNULL(0))
		PG_RETURN_NULL();

	int timedelay = PG_GETARG_INT32(0);

	struct itimerval timer = {
		.it_value.tv_sec = 0,
		.it_value.tv_usec = 0,
		.it_interval.tv_sec = 0,
		.it_interval.tv_usec = 0
	};

	if (setitimer(ITIMER_REAL, &timer, NULL) != 0) {
		int e = errno;
		ereport( ERROR, ( errmsg( "setitimer: %s", strerror(e) ) ) );
	}

	sleep(timedelay);

	PG_RETURN_NULL();
}
