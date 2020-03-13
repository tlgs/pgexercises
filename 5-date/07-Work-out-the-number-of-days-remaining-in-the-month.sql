SELECT
  (date_trunc('month', ts + INTERVAL '1 month')) - DATE(ts) AS remaining
FROM
  (SELECT TIMESTAMP '2012-02-11 01:00:00' AS ts) AS _;
