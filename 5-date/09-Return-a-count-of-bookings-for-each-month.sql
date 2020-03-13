SELECT
  date_trunc('month', starttime) AS "month",
  COUNT(*)
FROM
  cd.bookings
GROUP BY
  "month"
ORDER BY
  "month";
