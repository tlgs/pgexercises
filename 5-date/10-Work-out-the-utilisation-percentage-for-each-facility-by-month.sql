-- noqa: disable=L039

WITH monthly_bookings AS (
  SELECT
    facs.name,
    date_trunc('month', bks.starttime) AS "month",
    EXTRACT(
      DAY FROM (
        date_trunc('month', bks.starttime)
        + INTERVAL '1 month'
        - date_trunc('month', bks.starttime)
      )
    ) AS month_length,
    SUM(bks.slots) AS total_slots
  FROM
    cd.bookings AS bks
  INNER JOIN
    cd.facilities AS facs
    ON facs.facid = bks.facid
  GROUP BY
    facs.name,
    "month"
)

SELECT
  "name",
  "month",
  CAST(
    (total_slots / (25 * month_length) * 100) AS NUMERIC(3, 1)
  ) AS utilisation
FROM
  monthly_bookings
ORDER BY
  "name",
  "month";
