USE dummy1;

---###1
SELECT c.FirstName, c.LastName, r.NationalCuisine, AVG(s.Score) AS AverageScore
FROM Score s
         JOIN Cook c ON s.CookID = c.CookID
         JOIN EpisodeParticipation ep ON s.EpisodeID = ep.EpisodeID AND s.CookID = ep.CookID
         JOIN Recipe r ON ep.RecipeID = r.RecipeID
GROUP BY c.CookID, r.NationalCuisine;