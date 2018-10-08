SELECT facid, total
  FROM (SELECT fac.facid, SUM(slots) AS total,
               RANK() OVER(ORDER BY SUM(slots) DESC)
          FROM cd.facilities AS fac
               INNER JOIN cd.bookings AS book
               ON fac.facid = book.facid
         GROUP BY fac.facid) AS sub
 WHERE rank = 1;
