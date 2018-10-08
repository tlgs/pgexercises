SELECT book.starttime, fac.name
  FROM cd.bookings AS book
	   INNER JOIN cd.facilities AS fac
	   ON book.facid = fac.facid
 WHERE book.starttime BETWEEN '2012-09-21' AND '2012-09-22'
   AND fac.name LIKE 'Tennis Court%'
 ORDER BY book.starttime;
