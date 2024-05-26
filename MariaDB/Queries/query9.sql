USE dummy1;

---####9

SELECT
    e.Year,
    AVG(ni.CarbsPerServing) AS AvgCarbsPerServing
FROM
    EpisodeParticipation ep
        JOIN
    Episode e ON ep.EpisodeID = e.EpisodeID
        JOIN
    Recipe r ON ep.RecipeID = r.RecipeID
        JOIN
    NutritionalInfo ni ON r.NutritionalInfoID = ni.NutritionalInfoID
GROUP BY
    e.Year
ORDER BY
    e.Year;

