# pgexercises

Solutions to the problems over at [PostgreSQL Exercises](https://pgexercises.com/).

## Testing environment

This project includes a local testing environment enabled by
[Docker](https://www.docker.com/)
and a shell script that makes use of
[psql](https://www.postgresql.org/docs/current/app-psql.html).

1. `docker build -t pgexercises .`
2. `docker run --name pgexercises -p 5432:5432 -d pgexercises`
3. `./tests/test_all`

Afterwards, `docker start/stop pgexercises` should be enough
to get the container rolling.

### Notes on the Docker image

- The locale is set to `C`, as mentioned in the
  [Getting Started](https://pgexercises.com/gettingstarted.html) section.
- The Postgres server version is **12.5** (`SELECT version();`),
  which differs from the `clubdata.sql` dump (9.2).

## Useful references

- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- [PostgreSQL/SQL Keywords](https://www.postgresql.org/docs/current/sql-keywords-appendix.html)
- [Firefox SQL Style Guide](https://docs.telemetry.mozilla.org/concepts/sql_style.html)
- [PostgreSQL Docker Image](https://hub.docker.com/_/postgres/)
