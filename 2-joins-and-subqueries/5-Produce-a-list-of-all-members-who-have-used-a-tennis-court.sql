SELECT DISTINCT
  mems.firstname || ' ' || mems.surname AS member,
  facs.name AS facility
FROM
  cd.members AS mems
INNER JOIN
  cd.bookings AS bks
  ON mems.memid = bks.memid
INNER JOIN
  cd.facilities AS facs
  ON bks.facid = facs.facid
WHERE
  facs.name LIKE 'Tennis Court %'
ORDER BY
  member,
  facility;
