SELECT LEFT(surname, 1) AS letter, COUNT(*)
  FROM cd.members
 GROUP BY letter
 ORDER BY letter;
