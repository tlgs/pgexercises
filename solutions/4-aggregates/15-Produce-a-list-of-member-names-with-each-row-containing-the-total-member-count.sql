SELECT
  COUNT(*) OVER() AS "count",
  firstname,
  surname
FROM
  cd.members
ORDER BY
  joindate;
