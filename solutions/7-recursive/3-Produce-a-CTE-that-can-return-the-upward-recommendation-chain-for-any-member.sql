WITH RECURSIVE rec_chain(member, recommender) AS (
  SELECT
    memid AS member,
    recommendedby AS recommender
  FROM
    cd.members

  UNION

  SELECT
    recs.member,
    mems.recommendedby AS recommender
  FROM
    rec_chain AS recs
  INNER JOIN
    cd.members AS mems
    ON recs.recommender = mems.memid
)

SELECT
  recs.member,
  recs.recommender,
  mems.firstname,
  mems.surname
FROM
  rec_chain AS recs
INNER JOIN
  cd.members AS mems
  ON recs.recommender = mems.memid
WHERE
  recs.member IN (12, 22)
ORDER BY
  recs.member ASC,
  recs.recommender DESC;
