SELECT
  mems.firstname || ' ' || mems.surname AS "member",
  facs.name AS facility,
  CASE mems.memid
    WHEN 0 THEN bks.slots * facs.guestcost
    ELSE bks.slots * membercost
  END AS "cost"
FROM
  cd.members AS mems
INNER JOIN
  cd.bookings AS bks
    USING (memid)
INNER JOIN
  cd.facilities AS facs
    USING (facid)
WHERE
  bks.starttime BETWEEN '2012-09-14' AND '2012-09-15'
  AND (
    CASE mems.memid
      WHEN 0 THEN bks.slots * facs.guestcost > 30
      ELSE bks.slots * facs.membercost > 30
    END
  )
ORDER BY
  "cost" DESC;
