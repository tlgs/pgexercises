UPDATE
  cd.facilities  -- noqa: L003
SET
  membercost = 6,
  guestcost = 30
WHERE
  "name" LIKE 'Tennis Court %';
