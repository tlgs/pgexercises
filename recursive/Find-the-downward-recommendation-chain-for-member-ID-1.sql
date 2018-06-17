WITH RECURSIVE rec(memid) AS (
		SELECT memid FROM cd.members WHERE recommendedby = 1
	UNION ALL
  		SELECT mem.memid
  			FROM rec
  				INNER JOIN cd.members AS mem
  					ON mem.recommendedby = rec.memid
)

SELECT rec.memid, firstname, surname
	FROM rec
		INNER JOIN cd.members AS mem
			ON rec.memid = mem.memid
ORDER BY memid