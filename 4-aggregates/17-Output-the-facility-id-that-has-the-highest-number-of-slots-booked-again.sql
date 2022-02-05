WITH ranked_slots AS (
  SELECT
    facid,
    SUM(slots) AS total,
    RANK() OVER (ORDER BY SUM(slots) DESC) AS rank
  FROM
    cd.bookings
  GROUP BY
    facid
)

SELECT
  facid,
  total
FROM
  ranked_slots
WHERE
  rank = 1;
