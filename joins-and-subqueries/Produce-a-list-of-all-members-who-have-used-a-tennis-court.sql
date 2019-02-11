SELECT DISTINCT (mem.firstname || ' ' || mem.surname) AS member,
       fac.name AS facility
  FROM cd.members AS mem
       INNER JOIN cd.bookings AS book
       ON mem.memid = book.memid
       INNER JOIN cd.facilities AS fac
       ON book.facid = fac.facid
 WHERE fac.name LIKE 'Tennis Court%'
 ORDER BY member;
