# pgexercises

Solutions to the problems over at [PostgreSQL Exercises](https://pgexercises.com/).

## Testing environment

1. `docker build -t pgexercises .`
2. `docker run --name pgexercises -p 5432:5432 -d pgexercises`
3. ...

Afterwards, `docker start/stop pgexercises` should be enough
to get the container rolling.

## Useful references

- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- [PostgreSQL/SQL Keywords](https://www.postgresql.org/docs/current/sql-keywords-appendix.html)
- [Firefox SQL Style Guide](https://docs.telemetry.mozilla.org/concepts/sql_style.html)
- [PostgreSQL Docker Image](https://hub.docker.com/_/postgres/)
