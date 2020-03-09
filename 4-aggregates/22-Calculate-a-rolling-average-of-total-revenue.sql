WITH daily_totals AS (
  SELECT
    CAST(bks.starttime AS DATE) AS "date",
    SUM(
      CASE bks.memid
        WHEN 0 THEN bks.slots * facs.guestcost
	   ELSE bks.slots * facs.membercost
      END
    ) AS revenue
  FROM
    cd.bookings AS bks
  INNER JOIN
    cd.facilities AS facs
      USING (facid)
  GROUP BY
    "date"
),

rolling AS (
  SELECT
    CAST("date" AS DATE),
    AVG(daily_totals.revenue) OVER (ORDER BY "date" ROWS 14 PRECEDING) AS revenue
  FROM
    generate_series(DATE '2012-07-18', DATE '2012-08-31', '1 day') AS "date"
  LEFT OUTER JOIN
    daily_totals
      USING("date")
)

SELECT *
FROM rolling
WHERE "date" >= '2012-08-01';
