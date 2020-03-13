WITH RECURSIVE rec_chain(recommender) AS (
  SELECT
    recommendedby AS recommender
  FROM
    cd.members
  WHERE
    memid = 27

  UNION
  
  SELECT
    mems.recommendedby AS recommender
  FROM
    rec_chain AS recs
  INNER JOIN
    cd.members AS mems
      ON recs.recommender = mems.memid
)

SELECT
  recs.recommender,
  mems.firstname,
  mems.surname
FROM
  rec_chain AS recs
INNER JOIN
  cd.members AS mems
    ON recs.recommender = mems.memid
ORDER BY
  recs.recommender DESC;
