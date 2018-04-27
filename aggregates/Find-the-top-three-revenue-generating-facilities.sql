SELECT name, rank
	FROM (SELECT name, RANK() OVER(ORDER BY SUM(cost) DESC) AS rank
			FROM (SELECT fac.name, 
							CASE
								WHEN book.memid  = 0 THEN fac.guestcost  * book.slots
								WHEN book.memid != 0 THEN fac.membercost * book.slots
							END AS "cost"
					FROM cd.bookings AS book
					JOIN cd.facilities AS fac
						ON book.facid = fac.facid) AS sub
			GROUP BY name
		ORDER BY rank) AS sub2
	WHERE rank <= 3;