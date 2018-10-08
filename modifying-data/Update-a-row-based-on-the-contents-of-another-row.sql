UPDATE cd.facilities
   SET membercost = (SELECT membercost FROM cd.facilities WHERE name = 'Tennis Court 1') * 1.1,
       guestcost  = (SELECT guestcost FROM cd.facilities WHERE name = 'Tennis Court 1') * 1.1
 WHERE name = 'Tennis Court 2';
