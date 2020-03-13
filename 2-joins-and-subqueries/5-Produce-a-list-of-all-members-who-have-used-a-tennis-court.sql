SELECT DISTINCT
  (mems.firstname || ' ' || mems.surname) AS "member",
  facs.name AS facility
FROM
  cd.members AS mems
INNER JOIN
  cd.bookings AS bks
    USING (memid)
INNER JOIN
  cd.facilities AS facs
    USING (facid)
WHERE
  facs.name LIKE 'Tennis Court %'
ORDER BY
  member;
