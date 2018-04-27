SELECT fac.facid, fac.name, TO_CHAR(SUM(book.slots)*0.5, 'FM999D00') AS "Total Hours"
	FROM cd.facilities AS fac
	INNER JOIN cd.bookings AS book
		ON book.facid = fac.facid
	GROUP BY fac.facid, fac.name
ORDER BY facid;