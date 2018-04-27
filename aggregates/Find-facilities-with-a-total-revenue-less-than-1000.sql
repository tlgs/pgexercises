SELECT name, SUM(cost) AS revenue
	FROM (SELECT fac.name, 
		  			CASE
	   					WHEN book.memid  = 0 THEN fac.guestcost  * book.slots
						WHEN book.memid != 0 THEN fac.membercost * book.slots
	   				END AS "cost"
			FROM cd.bookings AS book
	  		JOIN cd.facilities AS fac
	  			ON book.facid = fac.facid) AS sub
	GROUP BY name
	HAVING SUM(cost) < 1000
ORDER BY revenue;
	