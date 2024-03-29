WITH booking_costs AS (
  SELECT
    facs.name,
    facs.monthlymaintenance,
    facs.initialoutlay,
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
  initialoutlay / (SUM(cte_cost) / 3.0 - monthlymaintenance) AS months
FROM
  booking_costs
GROUP BY
  "name",
  initialoutlay,
  monthlymaintenance
ORDER BY
  "name";
