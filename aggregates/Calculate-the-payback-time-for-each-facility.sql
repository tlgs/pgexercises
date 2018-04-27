SELECT name, initialoutlay/(revenue/3.0 - monthlymaintenance) AS months
	FROM (
		SELECT fac.name, 
	  		   SUM(	CASE
						WHEN book.memid  = 0 THEN fac.guestcost  * book.slots
						WHEN book.memid != 0 THEN fac.membercost * book.slots
	   		   	   	END) AS revenue,
	   		   fac.initialoutlay,
	   	       fac.monthlymaintenance
			FROM cd.bookings AS book
			JOIN cd.facilities AS fac
				ON book.facid = fac.facid
	 		GROUP BY fac.facid) AS sub
ORDER by name;