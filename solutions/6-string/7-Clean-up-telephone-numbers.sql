SELECT
  memid,
  TRANSLATE(telephone, '-() ', '') AS telephone
FROM
  cd.members
ORDER BY
  memid;
