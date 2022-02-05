-- noqa: disable=L003

UPDATE
  cd.facilities
SET
  membercost = 6,
  guestcost = 30
WHERE
  name LIKE 'Tennis Court %';
