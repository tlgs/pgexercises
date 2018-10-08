SELECT facid, SUM(slots) as "Total Slots"
  FROM cd.bookings
 GROUP BY facid
HAVING SUM(slots) > 1000
 ORDER BY facid;
