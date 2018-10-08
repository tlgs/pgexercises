SELECT recommended.firstname, recommended.surname,
       recommender.firstname, recommender.surname
  FROM cd.members AS recommended
       LEFT OUTER JOIN cd.members AS recommender
       ON recommended.recommendedby = recommender.memid
 ORDER BY recommended.surname, recommended.firstname;
