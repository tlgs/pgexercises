SELECT DISTINCT
  mems.firstname || ' ' || mems.surname AS "member",
  (SELECT
      recs.firstname || ' ' || recs.surname
    FROM
      cd.members AS recs
    WHERE
      mems.recommendedby = recs.memid
  ) AS recommender
FROM
  cd.members AS mems
ORDER BY
  "member";  -- noqa: L028
