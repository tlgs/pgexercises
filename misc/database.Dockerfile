# syntax=docker/dockerfile:1

FROM postgres:14.7

ENV LANG C
ENV POSTGRES_HOST_AUTH_METHOD trust

ADD --chown=postgres:postgres https://pgexercises.com/dbfiles/clubdata.sql /docker-entrypoint-initdb.d/clubdata.sql

HEALTHCHECK CMD pg_isready -d exercises -U postgres
