SELECT book.starttime
	FROM cd.bookings AS book
		INNER JOIN cd.members AS mem
			ON book.memid = mem.memid
	WHERE mem.firstname = 'David' AND
		  mem.surname   = 'Farrell';