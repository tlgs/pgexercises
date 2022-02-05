SELECT
  LEFT(surname, 1) AS letter,
  COUNT(*) AS count
FROM
  cd.members
GROUP BY
  letter
ORDER BY
  letter;
