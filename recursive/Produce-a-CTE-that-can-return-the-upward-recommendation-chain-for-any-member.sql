WITH RECURSIVE recommenders(recommender, member) AS (
    SELECT recommendedby, memid
      FROM cd.members

     UNION ALL

    SELECT recommendedby, recommenders.member
      FROM recommenders
           INNER JOIN cd.members AS mem
           ON recommenders.recommender = mem.memid
)

SELECT member, recommender, firstname, surname
  FROM recommenders
       INNER JOIN cd.members
       ON recommender = memid
 WHERE member = 12
    OR member = 22
 ORDER BY member ASC, recommender DESC;
