SELECT DISTINCT recommender.firstname, recommender.surname
  FROM cd.members AS recommended
       JOIN cd.members AS recommender
       ON recommended.recommendedby = recommender.memid
 ORDER BY recommender.surname, recommender.firstname;
