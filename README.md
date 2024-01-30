# pgexercises

Solutions to the [PostgreSQL Exercises](https://pgexercises.com/).

## Tests

A test environment and test set are available under `tests/`.
Powered by Docker, and [pytest](https://pytest.org) + [psycopg](https://psycopg.org).

1. `pip install pytest psycopg[binary]`
2. `docker build -t pgexercises tests/`
3. `docker run --name pgexercises -p 5432:5432 -d pgexercises`
4. `pytest`

Afterwards, `docker start/stop pgexercises` should be enough to manage the container.

### Some notes on the Docker image

- The locale is set to `C`, as mentioned in
  [Getting Started](https://pgexercises.com/gettingstarted.html).
- The Postgres server version is 12.7 (`SELECT version();`),
  which differs from the `clubdata.sql` dump (9.2).

## Style

This project tries to be consistent with the
[Mozilla SQL Style Guide](https://docs.telemetry.mozilla.org/concepts/sql_style.html).
Additionally, [SQLFluff](https://www.sqlfluff.com/) is used as a linter.
