# pgexercises

Solutions to the [PostgreSQL Exercises](https://pgexercises.com/).
This project aims to be consistent with the
[Mozilla SQL Style Guide](https://docs.telemetry.mozilla.org/concepts/sql_style.html).

## Tests

A test environment and test set are available as a [Docker Compose stack](compose.yaml).

Run tests with `docker compose up --attach runner`.
This will leave the database container running - available on `localhost:5432`.

Wrap it up with `docker compose down`.
