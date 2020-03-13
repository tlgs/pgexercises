FROM postgres:9.2

RUN apt-get update && \
    apt-get install -y curl && \
    curl -o /docker-entrypoint-initdb.d/clubdata.sql https://pgexercises.com/dbfiles/clubdata.sql
