SELECT
  bks.starttime
FROM
  cd.bookings AS bks
INNER JOIN
  cd.members AS mems
  ON mems.memid = bks.memid
WHERE
  mems.firstname = 'David'
  AND mems.surname = 'Farrell';
