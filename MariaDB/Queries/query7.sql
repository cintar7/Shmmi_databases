USE dummy1;

---##7
WITH ChefParticipation AS (
    SELECT CookID, COUNT(*) AS ParticipationCount
    FROM EpisodeParticipation
    GROUP BY CookID
),
     MaxParticipation AS (
         SELECT MAX(ParticipationCount) AS MaxCount
         FROM ChefParticipation
     )
SELECT c.FirstName, c.LastName
FROM ChefParticipation cp
         JOIN Cook c ON cp.CookID = c.CookID
         JOIN MaxParticipation mp ON cp.ParticipationCount <= mp.MaxCount - 5;

