WITH booking_costs AS (
  SELECT
    facs.name,
    CASE bks.memid
      WHEN 0 THEN bks.slots * facs.guestcost
      ELSE bks.slots * facs.membercost
    END AS cte_cost
  FROM
    cd.bookings AS bks
  INNER JOIN
    cd.facilities AS facs
    ON bks.facid = facs.facid
)

SELECT
  "name",
  SUM(cte_cost) AS revenue
FROM
  booking_costs
GROUP BY
  "name"
ORDER BY
  revenue;
