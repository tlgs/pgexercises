SELECT firstname, surname, joindate
	FROM cd.members
	WHERE joindate = (SELECT MAX(joindate) FROM cd.members)