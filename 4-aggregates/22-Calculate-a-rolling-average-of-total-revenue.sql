WITH daily_totals AS (
  SELECT
    CAST(bks.starttime AS DATE) AS dt,
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
    ON bks.facid = facs.facid
  GROUP BY
    dt
),

rolling AS (
  SELECT
    CAST(series.date AS DATE) AS dt,
    (
      AVG(daily_totals.revenue)
      OVER (ORDER BY daily_totals.dt ROWS 14 PRECEDING)
    ) AS revenue
  FROM
    generate_series(  -- noqa: L030
      DATE '2012-07-18',  -- noqa: L014,PRS
      DATE '2012-08-31',
      '1 day'
    ) AS series
  LEFT OUTER JOIN
    daily_totals
    ON series.date = daily_totals.dt
)

SELECT
  dt AS date,
  revenue
FROM
  rolling
WHERE
  dt >= '2012-08-01';
