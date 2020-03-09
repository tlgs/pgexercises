SELECT recommendedby, COUNT(DISTINCT memid)
FROM cd.members AS recs
WHERE recommendedby IS NOT NULL
GROUP BY recommendedby
ORDER BY recommendedby;
