SELECT mem.firstname || ' ' || mem.surname AS member, fac.name AS facility,
	CASE
		WHEN mem.memid  = 0 THEN fac.guestcost  * book.slots
		WHEN mem.memid != 0 THEN fac.membercost * book.slots
	END AS "cost"
	FROM cd.members AS mem
		INNER JOIN cd.bookings AS book
			ON book.memid = mem.memid
		INNER JOIN cd.facilities AS fac
			ON fac.facid = book.facid
	WHERE book.starttime >= '2012-09-14' AND
		  book.starttime <  '2012-09-15' AND
		  ((mem.memid  = 0 AND fac.guestcost  * book.slots > 30) OR
		   (mem.memid != 0 AND fac.membercost * book.slots > 30))
ORDER BY cost DESC;
		  