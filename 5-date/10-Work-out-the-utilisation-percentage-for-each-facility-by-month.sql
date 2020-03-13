WITH monthly_bookings AS (
  SELECT
    facs.name,
    date_trunc('month', bks.starttime) AS "month",
    EXTRACT(
      DAYS FROM
      date_trunc('month', bks.starttime)
        + INTERVAL '1 month'
        - date_trunc('month', bks.starttime)
    ) AS month_length,
    SUM(slots) AS total_slots
  FROM
    cd.bookings AS bks
  JOIN
    cd.facilities AS facs
      USING(facid)
  GROUP BY
    "name",
    "month"
)

SELECT
  "name",
  "month",
  CAST((total_slots / (25 * month_length) * 100) AS NUMERIC(3, 1)) AS utilisation
FROM
  monthly_bookings
ORDER BY
  "name",
  "month";
