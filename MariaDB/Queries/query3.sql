USE dummy1;


---###3
SELECT c.FirstName, c.LastName, COUNT(ep.RecipeID) AS RecipeCount
FROM Cook c
         JOIN EpisodeParticipation ep ON c.CookID = ep.CookID
WHERE c.Age < 30
GROUP BY c.CookID
ORDER BY RecipeCount DESC
    LIMIT 10;  -- Adjust the limit as needed