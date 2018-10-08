SELECT mem.firstname, mem.surname,
       (SUM(slots) + 10) / 20 * 10 AS hours,
       RANK() OVER(ORDER BY (SUM(slots) + 10) / 20 * 10 DESC) AS rank
  FROM cd.members AS mem
       INNER JOIN cd.bookings AS book
       ON mem.memid = book.memid
 GROUP BY mem.firstname, mem.surname
 ORDER BY rank, mem.surname, mem.firstname;
