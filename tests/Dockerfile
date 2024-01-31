# syntax=docker/dockerfile:1

FROM postgres:14.7

ENV LANG C
ENV POSTGRES_HOST_AUTH_METHOD trust

RUN apt-get update && apt-get install --no-install-recommends -y \
      ca-certificates \
      curl \
    && rm -rf /var/lib/apt/lists/* \
    && curl -o /docker-entrypoint-initdb.d/clubdata.sql https://pgexercises.com/dbfiles/clubdata.sql
