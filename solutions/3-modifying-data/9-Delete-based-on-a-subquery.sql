DELETE
FROM cd.members AS mems
WHERE memid NOT IN (SELECT memid FROM cd.bookings);
