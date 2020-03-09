SELECT
  mems.surname,
  mems.firstname,
  mems.memid,
  MIN(bks.starttime) AS starttime
FROM
  cd.members AS mems
INNER JOIN
  cd.bookings AS bks
    USING (memid)
WHERE
  bks.starttime >= '2012-09-01'
GROUP BY
  mems.surname,
  mems.firstname,
  mems.memid
ORDER BY
  mems.memid;
