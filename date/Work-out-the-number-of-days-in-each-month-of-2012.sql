SELECT month,
       COUNT(*) * INTERVAL '1 DAY' AS length
  FROM (SELECT EXTRACT(MONTH FROM GENERATE_SERIES(TIMESTAMP '2012-01-01',
                                                  TIMESTAMP '2012-12-31',
                                                  INTERVAL '1 DAY')) AS month) AS sub
 GROUP BY month
 ORDER BY month;
