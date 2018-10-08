SELECT date, revenue
  FROM (SELECT date,
               AVG(daily_revenue) OVER(ORDER BY date ROWS 14 PRECEDING) AS revenue
          FROM (SELECT book.starttime::date AS date,
                       SUM(CASE
                           WHEN book.memid = 0 THEN fac.guestcost * book.slots
                           WHEN book.memid != 0 THEN fac.membercost * book.slots
                           END) AS daily_revenue
                  FROM cd.bookings AS book
                       JOIN cd.facilities AS fac
                       ON book.facid = fac.facid
                 GROUP BY book.starttime::date) AS sub) AS sub2
 WHERE EXTRACT(MONTH FROM date) = 8;
