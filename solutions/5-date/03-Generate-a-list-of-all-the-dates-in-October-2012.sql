SELECT
  generate_series(
    TIMESTAMP '2012-10-01',
    TIMESTAMP '2012-10-31',
    INTERVAL '1 day'
  ) AS ts;
