-- noqa: disable=PRS
WITH tennis1 AS (
  SELECT *
  FROM cd.facilities
  WHERE "name" = 'Tennis Court 1'
)

UPDATE
  cd.facilities AS facs
SET
  membercost = 1.1 * tennis1.membercost,
  guestcost = 1.1 * tennis1.guestcost
FROM
  tennis1
WHERE
  facs.name = 'Tennis Court 2';
