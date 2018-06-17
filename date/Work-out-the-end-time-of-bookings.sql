SELECT starttime, starttime + slots * INTERVAL '30 MINUTES' AS endtime
	FROM cd.bookings
	ORDER BY endtime DESC, starttime DESC
	LIMIT 10