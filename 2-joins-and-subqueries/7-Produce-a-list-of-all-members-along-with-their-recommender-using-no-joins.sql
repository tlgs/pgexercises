SELECT DISTINCT
  (mems.firstname || ' ' || mems.surname) AS "member",
  (SELECT
     recs.firstname || ' ' || recs.surname AS recommender
   FROM
     cd.members AS recs
   WHERE
     mems.recommendedby = recs.memid
  )
FROM
  cd.members AS mems
ORDER BY
  "member";
