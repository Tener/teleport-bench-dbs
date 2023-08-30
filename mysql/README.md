# MySQL, MariaDB

See `Makefile` for suitable targets. 

The databases are hardcoded in `Makefile`; update as appropriate. Currently supported:
- `make env-mysql`
- `make env-mariadb`

Example use:

```
> tsh login
> make login

# in shell one
> `make env-mysql`
> make proxy

# in shell two
> `make env-mysql`
> make init-table
> time make create-backup
> time make restore-backup
```

Cleanup:

```
# in shell two
> `make env-mysql`
> make drop-table
```
