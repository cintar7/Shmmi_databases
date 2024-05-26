USE dummy1;

---####10

WITH AnnualParticipation AS (
    SELECT
        e.Year,
        r.NationalCuisine,
        COUNT(*) AS ParticipationCount
    FROM
        EpisodeParticipation ep
            JOIN
        Recipe r ON ep.RecipeID = r.RecipeID
            JOIN
        Episode e ON ep.EpisodeID = e.EpisodeID
    GROUP BY
        e.Year,
        r.NationalCuisine
    HAVING
        COUNT(*) >= 3
),
     ConsecutiveYears AS (
         SELECT
             ap1.NationalCuisine,
             ap1.Year AS Year1,
             ap1.ParticipationCount AS ParticipationCount1,
             ap2.Year AS Year2,
             ap2.ParticipationCount AS ParticipationCount2
         FROM
             AnnualParticipation ap1
                 JOIN
             AnnualParticipation ap2 ON ap1.NationalCuisine = ap2.NationalCuisine AND ap1.Year + 1 = ap2.Year
         WHERE
             ap1.ParticipationCount = ap2.ParticipationCount
     )
SELECT
    NationalCuisine,
    Year1,
    Year2,
    ParticipationCount1 AS ParticipationCount
FROM
    ConsecutiveYears;

