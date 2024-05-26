USE dummy1;


--- ###2
SELECT DISTINCT c.FirstName, c.LastName
FROM Cook c
         JOIN EpisodeParticipation ep ON c.CookID = ep.CookID
         JOIN Recipe r ON ep.RecipeID = r.RecipeID
         JOIN Episode e ON ep.EpisodeID = e.EpisodeID
WHERE r.NationalCuisine = 'Mexican' AND e.Year = 2003;