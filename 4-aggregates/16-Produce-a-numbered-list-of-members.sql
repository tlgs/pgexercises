SELECT
  ROW_NUMBER() OVER(ORDER BY joindate) AS "row_number",
  firstname,
  surname
FROM
  cd.members
ORDER BY
  joindate;
