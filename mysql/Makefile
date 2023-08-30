
# defaults
DBNAME ?= mysql
DBPORT ?= 33061
MYSQL_COMMAND ?= mysql
MYSQLDUMP_COMMAND ?= mysqldump
MYSQL_USER ?= tener
CONNPARAMS_EXTRA ?= 

env-mysql:
	@echo "export DBNAME=mysql"
	@echo "export DBPORT=33061"
	@echo "export MYSQL_COMMAND=mysql"
	@echo "export MYSQLDUMP_COMMAND=mysqldump"
	@echo "export MYSQL_USER=tener"
	@echo "export CONNPARAMS_EXTRA="

env-mariadb:
	@echo "export DBNAME=mariadb"
	@echo "export DBPORT=33060"
	@echo "export MYSQL_COMMAND=mariadb"
	@echo "export MYSQLDUMP_COMMAND=mariadb-dump"
	@echo "export MYSQL_USER=tener"
	@echo "export CONNPARAMS_EXTRA="

env-mysql-direct:
	@echo "export DBNAME=mysql"
	@echo "export DBPORT=13306"
	@echo "export MYSQL_COMMAND=mysql"
	@echo "export MYSQLDUMP_COMMAND=mysqldump"
	@echo "export MYSQL_USER=root"
	@echo "export CONNPARAMS_EXTRA=--password=MYSQL_SECRET_PASSWORD"

CONNPARAMS ?= --user $(MYSQL_USER) --port $(DBPORT) --host localhost --protocol TCP $(CONNPARAMS_EXTRA)
CONNPARAMS_DB ?= $(CONNPARAMS) --database mysql

login:
	tsh db login $(DBNAME) --db-user=tener

proxy: login
	tsh proxy db --tunnel $(DBNAME) --db-user tener --port $(DBPORT)

sql:
	$(MYSQL_COMMAND) $(CONNPARAMS_DB)

init-table:
	cat init-$(DBNAME).sql random_test_data.sql | $(MYSQL_COMMAND) $(CONNPARAMS_DB) 

drop-table:
	$(MYSQL_COMMAND) $(CONNPARAMS_DB) -e "DROP DATABASE IF EXISTS benchmark;"

create-backup:
	$(MYSQLDUMP_COMMAND) $(CONNPARAMS) benchmark > db_mysql.backup.sql
	du -h db_mysql.backup.sql

restore-backup:
	$(MYSQL_COMMAND) $(CONNPARAMS_DB) < db_mysql.backup.sql

read-benchmark:
	time $(MYSQL_COMMAND) $(CONNPARAMS_DB) --raw --batch -N -e "USE benchmark; SELECT * FROM customers;" > /dev/null
