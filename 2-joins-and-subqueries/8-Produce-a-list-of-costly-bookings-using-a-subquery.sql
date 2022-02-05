WITH booking_costs_2012_09_14 AS (
  SELECT
    (mems.firstname || ' ' || mems.surname) AS member,
    facs.name AS facility,
    CASE mems.memid
      WHEN 0 THEN bks.slots * facs.guestcost
      ELSE bks.slots * facs.membercost
    END AS cost
  FROM
    cd.members AS mems
  INNER JOIN
    cd.bookings AS bks
    ON mems.memid = bks.memid
  INNER JOIN
    cd.facilities AS facs
    ON bks.facid = facs.facid
  WHERE
    bks.starttime BETWEEN '2012-09-14' AND '2012-09-15'
)

SELECT *
FROM booking_costs_2012_09_14
WHERE cost > 30
ORDER BY cost DESC;
