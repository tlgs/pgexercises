# pgexercises

Solutions to the problems over at [PostgreSQL Exercises](https://pgexercises.com/).
The [PostgreSQL Official Documentation](https://www.postgresql.org/docs/)
is your best friend while solving these.

## Style

Style is important when it comes to writing SQL;
Unfortunately, the solutions proposed by the author don't set the best standard.

This project tries to be consistent with the
[Mozilla SQL Style Guide](https://docs.telemetry.mozilla.org/concepts/sql_style.html).
Additionally, [SQLFluff](https://www.sqlfluff.com/) is used as a linter.

## Tests

A test environment and test set are available under `tests/` --
this makes use of [Docker](https://www.docker.com/),
and a couple of Python libraries
([pytest](https://docs.pytest.org/en/7.0.x/), [psycopg](https://www.psycopg.org/psycopg3/docs/)).

1. `python -m venv .venv && .\.venv\Scripts\activate` (or platform equivalent)
2. `pip install pytest psycopg[binary]`
3. `docker build -t pgexercises tests/`
4. `docker run --name pgexercises -p 5432:5432 -d pgexercises`
5. `pytest`

Afterwards, `docker start/stop pgexercises` should be enough to manage the container.

### Some notes on the Docker image

- The locale is set to `C`, as mentioned in the
  [Getting Started](https://pgexercises.com/gettingstarted.html) section.
- The Postgres server version is 12.7 (`SELECT version();`),
  which differs from the `clubdata.sql` dump (9.2).
