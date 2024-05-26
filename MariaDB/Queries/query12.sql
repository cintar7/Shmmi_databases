USE dummy1;

---#### 12

WITH AvgDifficultyPerEpisode AS (
    SELECT
        ep.Year,
        ep.EpisodeID,
        ep.EpisodeNumber,
        AVG(r.DifficultyLevel) AS AvgDifficulty
    FROM
        Episode ep
            JOIN
        EpisodeParticipation epc ON ep.EpisodeID = epc.EpisodeID
            JOIN
        Recipe r ON epc.RecipeID = r.RecipeID
    GROUP BY
        ep.Year, ep.EpisodeID, ep.EpisodeNumber
)
SELECT
    Year,
    EpisodeID,
    EpisodeNumber,
    AvgDifficulty
FROM
    AvgDifficultyPerEpisode
WHERE
    (Year, AvgDifficulty) IN (
    SELECT
    Year,
    MAX(AvgDifficulty) AS MaxAvgDifficulty
    FROM
    AvgDifficultyPerEpisode
    GROUP BY
    Year
    )
ORDER BY
    Year;

