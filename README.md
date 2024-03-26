# pgexercises

Solutions to the [PostgreSQL Exercises](https://pgexercises.com/).
This project aims to be consistent with the
[Mozilla SQL Style Guide](https://docs.telemetry.mozilla.org/concepts/sql_style.html).

## Tests

A test environment and test set are available as a
[Docker Compose application stack](compose.yaml).

```console
$ docker compose up --attach runner
[+] Building 75.3s (18/18) FINISHED                                                    docker:default
 => ...
[+] Running 3/1
 ✔ Network pgexercises-default     Created                                                       0.1s
 ✔ Container pgexercises-database  Created                                                       0.0s
 ✔ Container pgexercises-runner    Created                                                       0.0s
Attaching to pgexercises-runner
pgexercises-runner  | ============================= test session starts ==============================
pgexercises-runner  | platform linux -- Python 3.11.8, pytest-8.0.2, pluggy-1.4.0
pgexercises-runner  | rootdir: /app
pgexercises-runner  | collected 62 items
pgexercises-runner  |
pgexercises-runner  | test_queries.py ........................................................ [ 90%]
pgexercises-runner  | ......                                                                   [100%]
pgexercises-runner  |
pgexercises-runner  | ============================== 62 passed in 0.30s ==============================
pgexercises-runner exited with code 0

$ docker compose ps --all --no-trunc
NAME                   STATUS                     PORTS
pgexercises-database   Up 5 minutes (healthy)     0.0.0.0:5432->5432/tcp, :::5432->5432/tcp
pgexercises-runner     Exited (0) 4 minutes ago

$ docker compose down
[+] Running 3/3
 ✔ Container pgexercises-runner    Removed                                                       0.0s
 ✔ Container pgexercises-database  Removed                                                       0.3s
 ✔ Network pgexercises-default     Removed                                                       0.3s
```
