-- noqa: disable=L003

INSERT INTO
  cd.facilities
SELECT
  MAX(facid) + 1 AS facid,
  'Spa' AS "name",
  20 AS membercost,
  30 AS guestcost,
  100000 AS initialoutlay,
  800 AS monthlymaintenance
FROM
  cd.facilities;
