SELECT
  starttime
FROM
  cd.bookings AS bks
INNER JOIN
  cd.members AS mems
    USING (memid)
WHERE
  mems.firstname = 'David'
  AND mems.surname = 'Farrell';
