# Postgres

See `Makefile` for suitable targets. 

The databases are hardcoded in `Makefile`; update as appropriate.

Example use:

```
> tsh login
> make login

> export MODE=teleport-m-n
> make init-table
> time make create-backup
> make drop-restore-db; make create-restore-db; make restore-backup
```

Cleanup:

```
> tsh login
> make login

> export MODE=teleport-m-n
> make drop-table
> make drop-restore-db
```
