WITH RECURSIVE rec(recommender) AS (
    SELECT recommendedby AS recommender
      FROM cd.members
     WHERE memid = 27

     UNION ALL

    SELECT mem.recommendedby AS recommender
      FROM rec, cd.members AS mem
     WHERE mem.memid = rec.recommender
)

SELECT recommender, firstname, surname
  FROM rec
       INNER JOIN cd.members AS mem
       ON recommender = mem.memid;
