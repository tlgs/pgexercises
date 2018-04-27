SELECT mem.surname, mem.firstname, mem.memid, MIN(book.starttime) AS "starttime"
	FROM cd.members as mem
	INNER JOIN cd.bookings as book
		ON mem.memid = book.memid
	WHERE book.starttime > '2012-09-01'
	GROUP BY mem.surname, mem.firstname, mem.memid
ORDER BY mem.memid