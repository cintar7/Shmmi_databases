USE dummy1;

---####13

WITH AvgExperiencePerEpisode AS (
    SELECT
        ep.EpisodeID,
        ep.EpisodeNumber,
        ep.Year,
        AVG(c.YearsOfExperience) AS AvgYearsOfExperience
    FROM
        Episode ep
            JOIN
        EpisodeParticipation epc ON ep.EpisodeID = epc.EpisodeID
            JOIN
        Cook c ON epc.CookID = c.CookID
    GROUP BY
        ep.EpisodeID, ep.EpisodeNumber, ep.Year
)
SELECT
    Year,
    EpisodeID,
    EpisodeNumber,
    AvgYearsOfExperience
FROM
    AvgExperiencePerEpisode
ORDER BY
    AvgYearsOfExperience ASC
    LIMIT 1;

#### 14

SELECT
    tu.Name AS ThematicUnit,
    COUNT(rtu.RecipeID) AS AppearanceCount
FROM
    ThematicUnit tu
        JOIN
    RecipeThematicUnit rtu ON tu.ThematicUnitID = rtu.ThematicUnitID
GROUP BY
    tu.Name
ORDER BY
    AppearanceCount DESC
    LIMIT 1;



