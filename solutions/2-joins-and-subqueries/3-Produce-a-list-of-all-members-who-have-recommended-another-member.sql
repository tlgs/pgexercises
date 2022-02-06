SELECT DISTINCT
  firstname,
  surname
FROM
  cd.members
WHERE
  memid IN (SELECT DISTINCT recommendedby FROM cd.members)
ORDER BY
  surname,
  firstname;
