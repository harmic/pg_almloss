PGHOME=/usr/local/pgsql
# PGHOME=/usr/pgsql-14/

INCLUDES = 	-I$(PGHOME)/include/			\
			-I$(PGHOME)/include/server		\
			-I/opt/rh/devtoolset-7/root/usr/include \
			-I/opt/rh/devtoolset-7/root/usr/lib/gcc/x86_64-redhat-linux/7/include/

%.o: %.c
	$(CC) -Wall -g -fPIC $(INCLUDES) $< -c -o $@

pg_almloss.so: pg_almloss.o
	$(CC) $< -shared -o $@

install: pg_almloss.so
	sudo cp pg_almloss.so `$(PGHOME)/bin/pg_config --pkglibdir`
