WITH hours_booked AS (
  SELECT
    mems.firstname,
    mems.surname,
    (((SUM(bks.slots) / 2) + 5) / 10) * 10 AS hours
  FROM
    cd.members AS mems
  INNER JOIN
    cd.bookings AS bks
    ON mems.memid = bks.memid
  GROUP BY
    mems.memid
)

SELECT
  *,
  RANK() OVER (ORDER BY hours DESC) AS rank
FROM
  hours_booked
ORDER BY
  rank,
  surname,
  firstname;
