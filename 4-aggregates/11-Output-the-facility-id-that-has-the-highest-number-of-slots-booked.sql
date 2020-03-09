WITH total_slots AS (
  SELECT facid, SUM(slots) AS total
  FROM cd.bookings
  GROUP BY facid
)

SELECT facid, total AS "Total Slots"
FROM total_slots
WHERE total = (SELECT MAX(total) FROM total_slots);
