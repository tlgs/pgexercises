SELECT DISTINCT mem.firstname || ' ' || mem.surname AS member,
	   		    (SELECT rec.firstname || ' ' || rec.surname AS recommended
	    			FROM cd.members AS rec
	   				WHERE rec.memid = mem.recommendedby
				)
	FROM cd.members AS mem
ORDER by member;