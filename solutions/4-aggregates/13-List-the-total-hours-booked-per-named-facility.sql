SELECT
  facs.facid,
  facs.name,
  to_char(SUM(bks.slots) / 2.0, 'FM999D00') AS "Total Hours"
FROM
  cd.bookings AS bks
INNER JOIN
  cd.facilities AS facs
  ON bks.facid = facs.facid
GROUP BY
  facs.facid,
  facs.name
ORDER BY
  facs.facid;
