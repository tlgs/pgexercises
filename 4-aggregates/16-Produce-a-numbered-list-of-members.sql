SELECT
  ROW_NUMBER() OVER(ORDER BY joindate),
  firstname,
  surname
FROM
  cd.members
ORDER BY
  joindate;
