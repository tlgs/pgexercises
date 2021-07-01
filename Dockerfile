FROM postgres:12.5

ENV LANG C
ENV POSTGRES_HOST_AUTH_METHOD trust

RUN apt-get update && \
    apt-get install -y curl && \
    curl -o /docker-entrypoint-initdb.d/clubdata.sql https://pgexercises.com/dbfiles/clubdata.sql
