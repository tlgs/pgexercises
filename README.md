# pgexercises

Solutions to the problems over at [PostgreSQL Exercises](https://pgexercises.com/).

## Testing environment

1. `docker build -t pgexercises .`
2. `docker run --name pgexercises -p 5432:5432 -d pgexercises`
3. ...

Afterwards, `docker start/stop pgexercises` should be enough
to get the container rolling.

### Notes

- The locale is set to `C`, as mentioned in the
  [Getting Started](https://pgexercises.com/gettingstarted.html) section.
- The Postgres server version is **10.7** (gotten by running `SELECT version()`),
  which differs from the `clubdata.sql` dump version (9.2).

## Useful references

- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- [PostgreSQL/SQL Keywords](https://www.postgresql.org/docs/current/sql-keywords-appendix.html)
- [Firefox SQL Style Guide](https://docs.telemetry.mozilla.org/concepts/sql_style.html)
- [PostgreSQL Docker Image](https://hub.docker.com/_/postgres/)
