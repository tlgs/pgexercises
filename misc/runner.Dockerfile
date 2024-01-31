# syntax=docker/dockerfile:1

FROM python:3.11-alpine

WORKDIR /app

RUN pip install --no-cache-dir pytest~=8.0.0 psycopg[binary]~=3.1.17

COPY solutions misc/test_queries.py ./

CMD ["pytest", "test_queries.py"]
