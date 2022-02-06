FROM postgres:12.7

ENV LANG C
ENV POSTGRES_HOST_AUTH_METHOD trust

RUN apt-get update && apt-get install --no-install-recommends -y \
      ca-certificates=20200601~deb10u2 \
      curl=7.64.0-4+deb10u2 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && curl -o /docker-entrypoint-initdb.d/clubdata.sql https://pgexercises.com/dbfiles/clubdata.sql
