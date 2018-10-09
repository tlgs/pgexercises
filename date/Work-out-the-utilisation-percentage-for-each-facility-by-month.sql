SELECT name, month,
       ROUND(CAST(100 * sum / (12.5 * EXTRACT(DAY FROM month + INTERVAL '1 MONTH' - month)) AS NUMERIC), 1) AS utilisation
  FROM (SELECT name,
               DATE_TRUNC('MONTH', starttime) AS month,
               SUM(slots) * 0.5 as sum
          FROM cd.bookings as book
               INNER JOIN cd.facilities as fac
               ON book.facid = fac.facid
         GROUP BY name, month) AS sub
 ORDER BY name, month;
