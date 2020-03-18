FROM postgres:10.7

ENV LANG C

RUN apt-get update && \
    apt-get install -y curl && \
    curl -o /docker-entrypoint-initdb.d/clubdata.sql https://pgexercises.com/dbfiles/clubdata.sql
