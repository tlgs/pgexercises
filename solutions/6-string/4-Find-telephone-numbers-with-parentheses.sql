SELECT
  memid,
  telephone
FROM
  cd.members
WHERE
  telephone ~ '[()]'
ORDER BY
  memid;
