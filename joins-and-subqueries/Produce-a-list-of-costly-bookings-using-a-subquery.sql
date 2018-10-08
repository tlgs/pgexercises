SELECT member, facility, cost
  FROM (SELECT mem.firstname || ' ' || mem.surname AS member,
               fac.name AS facility,
               CASE
               WHEN mem.memid = 0 THEN fac.guestcost * book.slots
               WHEN mem.memid != 0 THEN fac.membercost * book.slots
               END AS cost
          FROM cd.members AS mem
               INNER JOIN cd.bookings AS book
               ON book.memid = mem.memid
               INNER JOIN cd.facilities AS fac
               ON fac.facid = book.facid
               WHERE book.starttime BETWEEN '2012-09-14' AND '2012-09-15') AS sub
 WHERE cost > 30
 ORDER BY cost DESC;
