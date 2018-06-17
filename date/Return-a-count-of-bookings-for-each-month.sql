SELECT DATE_TRUNC('MONTH', starttime) AS month, COUNT(*)
	FROM cd.bookings
	GROUP BY month
	ORDER BY month