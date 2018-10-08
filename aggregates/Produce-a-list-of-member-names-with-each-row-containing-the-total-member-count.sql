SELECT (SELECT COUNT(*) FROM cd.members), firstname, surname
  FROM cd.members
 ORDER BY joindate;
