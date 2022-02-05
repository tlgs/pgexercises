SELECT
  bks.starttime AS start,
  facs.name
FROM
  cd.bookings AS bks
INNER JOIN
  cd.facilities AS facs
  ON bks.facid = facs.facid
WHERE
  facs.name LIKE 'Tennis Court %'
  AND bks.starttime BETWEEN '2012-09-21' AND '2012-09-22'
ORDER BY
  bks.starttime;
