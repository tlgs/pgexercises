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
  RANK() OVER (ORDER BY SUM(cte_cost) DESC) AS "rank"
FROM
  booking_costs
GROUP BY
  "name"
ORDER BY
  "rank"
LIMIT
  3;
