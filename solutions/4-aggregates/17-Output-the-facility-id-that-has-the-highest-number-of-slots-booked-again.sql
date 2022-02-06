WITH ranked_slots AS (
  SELECT
    facid,
    SUM(slots) AS total,
    RANK() OVER (ORDER BY SUM(slots) DESC) AS cte_rank
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
  cte_rank = 1;
