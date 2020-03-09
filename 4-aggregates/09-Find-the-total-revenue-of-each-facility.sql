WITH booking_costs AS (
  SELECT
    facs.name,
    CASE memid
      WHEN 0 THEN slots * guestcost
  	  ELSE slots * membercost
    END AS "cost"
  FROM
    cd.bookings AS bks
  INNER JOIN
    cd.facilities AS facs
      USING (facid)
)

SELECT "name", SUM("cost") AS revenue
FROM booking_costs
GROUP BY "name"
ORDER BY "revenue";
