MODE ?= teleport-m-m

# db service: mbp, db: mbp
ifeq ($(MODE),teleport-m-m)

SSLROOTCERT ?= /Users/tener/.tsh/keys/boson.tener.io/cas/boson.tener.io.pem
SSLCERT ?= /Users/tener/.tsh/keys/boson.tener.io/tener-db/boson.tener.io/pg-docker-mbp-mbp-x509.pem
SSLKEY ?= /Users/tener/.tsh/keys/boson.tener.io/tener
HOST ?= boson.tener.io:3080
DBUSER ?= postgres
DBPARAMS ?= ?sslrootcert=$(SSLROOTCERT)&sslcert=$(SSLCERT)&sslkey=$(SSLKEY)&sslmode=verify-full

else

# db service: mbp, db: mbp (native)
ifeq ($(MODE),teleport-m-n)

SSLROOTCERT ?= /Users/tener/.tsh/keys/boson.tener.io/cas/boson.tener.io.pem
SSLCERT ?= /Users/tener/.tsh/keys/boson.tener.io/tener-db/boson.tener.io/pg-native-mbp-mbp-x509.pem
SSLKEY ?= /Users/tener/.tsh/keys/boson.tener.io/tener
HOST ?= boson.tener.io:3080
DBUSER ?= postgres
DBPARAMS ?= ?sslrootcert=$(SSLROOTCERT)&sslcert=$(SSLCERT)&sslkey=$(SSLKEY)&sslmode=verify-full

else

# db service: mbp, db: raptor
ifeq ($(MODE),teleport-m-r)

SSLROOTCERT ?= /Users/tener/.tsh/keys/boson.tener.io/cas/boson.tener.io.pem
SSLCERT ?= /Users/tener/.tsh/keys/boson.tener.io/tener-db/boson.tener.io/pg-docker-mbp-raptor-x509.pem
SSLKEY ?= /Users/tener/.tsh/keys/boson.tener.io/tener
HOST ?= boson.tener.io:3080
DBUSER ?= postgres
DBPARAMS ?= ?sslrootcert=$(SSLROOTCERT)&sslcert=$(SSLCERT)&sslkey=$(SSLKEY)&sslmode=verify-full

else

# db service: raptor, db: raptor
ifeq ($(MODE),teleport-r-r)

SSLROOTCERT ?= /Users/tener/.tsh/keys/boson.tener.io/cas/boson.tener.io.pem
SSLCERT ?= /Users/tener/.tsh/keys/boson.tener.io/tener-db/boson.tener.io/pg-docker-raptor-raptor-x509.pem
SSLKEY ?= /Users/tener/.tsh/keys/boson.tener.io/tener
HOST ?= boson.tener.io:3080
DBUSER ?= postgres
DBPARAMS ?= ?sslrootcert=$(SSLROOTCERT)&sslcert=$(SSLCERT)&sslkey=$(SSLKEY)&sslmode=verify-full

else

# db service: raptor, db: mbp
ifeq ($(MODE),teleport-r-m)

SSLROOTCERT ?= /Users/tener/.tsh/keys/boson.tener.io/cas/boson.tener.io.pem
SSLCERT ?= /Users/tener/.tsh/keys/boson.tener.io/tener-db/boson.tener.io/pg-docker-raptor-mbp-x509.pem
SSLKEY ?= /Users/tener/.tsh/keys/boson.tener.io/tener
HOST ?= boson.tener.io:3080
DBUSER ?= postgres
DBPARAMS ?= ?sslrootcert=$(SSLROOTCERT)&sslcert=$(SSLCERT)&sslkey=$(SSLKEY)&sslmode=verify-full

else

# direct call, mbp

ifeq ($(MODE),direct-m)

SSLROOTCERT ?= /Users/tener/code/teleport-dbs/db/certs/postgres/server.cas
SSLCERT ?= /Users/tener/code/teleport-dbs/db/certs/postgres/server.crt
SSLKEY ?= /Users/tener/code/teleport-dbs/db/certs/postgres/server.key
HOST ?= localhost:25432
DBUSER ?= postgres
DBPARAMS ?= ?sslrootcert=$(SSLROOTCERT)&sslcert=$(SSLCERT)&sslkey=$(SSLKEY)&sslmode=verify-full

else 

# direct call, mbp native

ifeq ($(MODE),direct-n)

SSLROOTCERT ?= /Users/tener/code/teleport-dbs/db/certs/postgres/server.cas
SSLCERT ?= /Users/tener/code/teleport-dbs/db/certs/postgres/server.crt
SSLKEY ?= /Users/tener/code/teleport-dbs/db/certs/postgres/server.key
HOST ?= 127.0.0.1:5432
DBUSER ?= postgres
# DBPARAMS ?= 
DBPARAMS ?= ?sslrootcert=$(SSLROOTCERT)&sslcert=$(SSLCERT)&sslkey=$(SSLKEY)&sslmode=verify-full

else 

# direct call, raptor

ifeq ($(MODE),direct-r)

SSLROOTCERT ?= /Users/tener/code/teleport-dbs/db/certs/postgres/server.cas
SSLCERT ?= /Users/tener/code/teleport-dbs/db/certs/postgres/server.crt
SSLKEY ?= /Users/tener/code/teleport-dbs/db/certs/postgres/server.key
HOST ?= 192.168.7.183:25432
DBUSER ?= postgres
DBPARAMS ?= ?sslrootcert=$(SSLROOTCERT)&sslcert=$(SSLCERT)&sslkey=$(SSLKEY)&sslmode=verify-full

else 

# Teleport Cloud tenant, pg in AWS Frankfurt

ifeq ($(MODE),grysik)

SSLROOTCERT ?= /Users/tener/.tsh/keys/tener-db.cloud.gravitational.io/cas/tener-db.cloud.gravitational.io.pem
SSLCERT ?= /Users/tener/.tsh/keys/tener-db.cloud.gravitational.io/krzysztof.skrzetnicki@goteleport.com-db/tener-db.cloud.gravitational.io/grysik-x509.pem
SSLKEY ?= /Users/tener/.tsh/keys/tener-db.cloud.gravitational.io/krzysztof.skrzetnicki@goteleport.com
HOST ?= localhost:35432 # tener-db.cloud.gravitational.io:443
DBUSER ?= postgres
DBPARAMS ?= ?sslrootcert=$(SSLROOTCERT)&sslcert=$(SSLCERT)&sslkey=$(SSLKEY)&sslmode=verify-full

else 

$(error MODE must be one of: teleport-m-m, teleport-m-n, teleport-m-r, teleport-r-r, teleport-r-m, direct-m, direct-r, direct-n. Was: $(MODE))

endif
endif
endif
endif
endif
endif
endif
endif
endif

login:
	tsh db login pg-docker-mbp-raptor --db-user=postgres --db-name=postgres
	tsh db login pg-docker-raptor-raptor --db-user=postgres --db-name=postgres
	tsh db login pg-docker-mbp-mbp --db-user=postgres --db-name=postgres
	tsh db login pg-docker-raptor-mbp --db-user=postgres --db-name=postgres
	tsh db login pg-native-mbp-mbp --db-user=postgres --db-name=postgres

psql:
	psql "postgres://$(DBUSER)@$(HOST)/postgres$(DBPARAMS)"

read-benchmark:
	time psql "postgres://$(DBUSER)@$(HOST)/postgres$(DBPARAMS)" -c "\COPY (SELECT * FROM customers) TO '/dev/null' WITH CSV HEADER"

psql-restored:
	psql "postgres://$(DBUSER)@$(HOST)/restored$(DBPARAMS)"

# initialize db

init-table:
	psql "postgres://$(DBUSER)@$(HOST)/postgres$(DBPARAMS)" -f random_test_data.sql
drop-table:
	psql "postgres://$(DBUSER)@$(HOST)/postgres$(DBPARAMS)" -c 'DROP TABLE customers;'

# create backup

create-backup:
	pg_dump "postgres://$(DBUSER)@$(HOST)/postgres$(DBPARAMS)" > db_postgres.backup.sql
	du -h db_postgres.backup.sql

# restore backup

create-restore-db:
	psql "postgres://$(DBUSER)@$(HOST)/postgres$(DBPARAMS)" -c 'CREATE DATABASE restored;'

restore-backup:
	psql "postgres://$(DBUSER)@$(HOST)/restored$(DBPARAMS)" -c "\timing" -f db_postgres.backup.sql
	psql "postgres://$(DBUSER)@$(HOST)/restored$(DBPARAMS)" -c "SELECT COUNT(*) FROM customers; SELECT pg_size_pretty(pg_database_size('restored')) AS database_size;"

# cleanup

drop-restore-db:
	psql "postgres://$(DBUSER)@$(HOST)/postgres$(DBPARAMS)" -c 'DROP DATABASE restored;'

## helpers

pretty-sql:
	pg_format random_test_data.sql > temp.sql
	mv temp.sql random_test_data.sql
