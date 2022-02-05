-- noqa: disable=L039

SELECT
  "name",
  CASE
    WHEN monthlymaintenance > 100 THEN 'expensive'
    ELSE 'cheap'
  END AS "cost"
FROM
  cd.facilities;
