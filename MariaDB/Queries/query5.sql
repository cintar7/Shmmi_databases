USE dummy1;


---###5
SELECT s.JudgeID, COUNT(DISTINCT s.EpisodeID) AS EpisodeCount, e.Year
FROM Score s
         JOIN Episode e ON s.EpisodeID = e.EpisodeID
GROUP BY s.JudgeID, e.Year
HAVING EpisodeCount > 3;

