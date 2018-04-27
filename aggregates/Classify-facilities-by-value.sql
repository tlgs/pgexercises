SELECT name, CASE
				WHEN ntile = 1 THEN 'high'
				WHEN ntile = 2 THEN 'average'
				WHEN ntile = 3 THEN 'low'
			 END AS revenue
	FROM (
		SELECT name, NTILE(3) OVER(ORDER BY SUM(cost) DESC)
			FROM (
				SELECT fac.name, 
					   CASE
						WHEN book.memid  = 0 THEN fac.guestcost  * book.slots
						WHEN book.memid != 0 THEN fac.membercost * book.slots
					   END AS cost
					FROM cd.bookings AS book
					JOIN cd.facilities AS fac
						ON book.facid = fac.facid) AS sub
			GROUP BY name) AS sub2
ORDER BY ntile, name;