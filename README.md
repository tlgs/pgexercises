# pgexercises

Solutions to the [PostgreSQL Exercises](https://pgexercises.com/).

## Tests

A test environment and test set are available as a [Docker Compose stack](compose.yaml).

Run tests with `docker compose up --attach runner`.
Once done this will leave the database container running -
avaiable on `localhost:5432`.

Run `docker compose down` when done.

## Style

This project tries to be consistent with the
[Mozilla SQL Style Guide](https://docs.telemetry.mozilla.org/concepts/sql_style.html).
Additionally, [SQLFluff](https://www.sqlfluff.com/) is used as a linter.
