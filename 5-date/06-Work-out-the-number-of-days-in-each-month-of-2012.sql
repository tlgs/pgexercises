-- noqa: disable=L025

SELECT
  EXTRACT(MONTH FROM gen) AS month,
  ((gen + INTERVAL '1 month') - gen) AS length
FROM
  generate_series(
    DATE '2012-01-01',
    DATE '2012-12-31',
    INTERVAL '1 month'
  ) AS gen;
