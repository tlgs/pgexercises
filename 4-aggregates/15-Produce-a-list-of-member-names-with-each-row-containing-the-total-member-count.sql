-- noqa: disable=all
SELECT
  COUNT(*) OVER(),
  firstname,
  surname
FROM
  cd.members
ORDER BY
  joindate;
