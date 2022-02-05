-- noqa: disable=L039

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
  CASE NTILE(3) OVER (ORDER BY SUM(cte_cost) DESC)
    WHEN 1 THEN 'high'
    WHEN 2 THEN 'average'
    WHEN 3 THEN 'low'
  END AS revenue
FROM
  booking_costs
GROUP BY
  "name"
ORDER BY
  NTILE(3) OVER (ORDER BY SUM(cte_cost) DESC),
  "name";
