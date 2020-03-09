WITH booking_costs AS (
  SELECT
    facs.name,
    facs.monthlymaintenance,
    facs.initialoutlay,
    CASE bks.memid
      WHEN 0 THEN bks.slots * facs.guestcost
  	  ELSE bks.slots * facs.membercost
    END AS "cost"
  FROM
    cd.bookings AS bks
  INNER JOIN
    cd.facilities AS facs
      USING (facid)
)

SELECT
  "name",
  initialoutlay / (SUM("cost") / 3.0 - monthlymaintenance) AS months
FROM
  booking_costs
GROUP BY
  "name",
  initialoutlay,
  monthlymaintenance
ORDER BY
  "name";
