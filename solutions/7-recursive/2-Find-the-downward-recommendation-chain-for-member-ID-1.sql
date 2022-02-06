WITH RECURSIVE rec_chain(memid) AS (
  SELECT memid
  FROM cd.members
  WHERE recommendedby = 1

  UNION ALL

  SELECT mems.memid
  FROM rec_chain AS recs
  INNER JOIN cd.members AS mems ON recs.memid = mems.recommendedby
)

SELECT
  recs.memid,
  mems.firstname,
  mems.surname
FROM
  rec_chain AS recs
INNER JOIN
  cd.members AS mems
  ON mems.memid = recs.memid
ORDER BY
  recs.memid ASC;
