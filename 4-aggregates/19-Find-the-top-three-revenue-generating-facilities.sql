WITH booking_costs AS (
  SELECT
    facs.name,
    CASE bks.memid
      WHEN 0 THEN bks.slots * facs.guestcost
  	  ELSE bks.slots * facs.membercost
    END AS "cost"
  FROM
    cd.bookings AS "bks"
  INNER JOIN
    cd.facilities AS "facs"
       USING (facid)
)

SELECT "name", RANK() OVER (ORDER BY SUM("cost") DESC) AS "rank"
FROM booking_costs
GROUP BY "name"
ORDER BY "rank"
LIMIT 3;
