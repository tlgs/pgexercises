SELECT facid, SUM(slots)
  FROM cd.bookings
 GROUP BY facid
HAVING SUM(slots) = (SELECT MAX(sub.total)
                       FROM (SELECT SUM(slots) as "total"
                               FROM cd.bookings
                              GROUP BY facid) AS sub);
