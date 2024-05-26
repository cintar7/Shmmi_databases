USE dummy1;

###1
SELECT c.FirstName, c.LastName, r.NationalCuisine, AVG(s.Score) AS AverageScore
FROM Score s
         JOIN Cook c ON s.CookID = c.CookID
         JOIN EpisodeParticipation ep ON s.EpisodeID = ep.EpisodeID AND s.CookID = ep.CookID
         JOIN Recipe r ON ep.RecipeID = r.RecipeID
GROUP BY c.CookID, r.NationalCuisine;




###2
SELECT DISTINCT c.FirstName, c.LastName
FROM Cook c
         JOIN EpisodeParticipation ep ON c.CookID = ep.CookID
         JOIN Recipe r ON ep.RecipeID = r.RecipeID
         JOIN Episode e ON ep.EpisodeID = e.EpisodeID
WHERE r.NationalCuisine = 'GivenCuisine' AND e.Year = 2023;  -- Replace 'GivenCuisine' and '2023' with actual values


###3
SELECT c.FirstName, c.LastName, COUNT(ep.RecipeID) AS RecipeCount
FROM Cook c
         JOIN EpisodeParticipation ep ON c.CookID = ep.CookID
WHERE c.Age < 30
GROUP BY c.CookID
ORDER BY RecipeCount DESC
    LIMIT 10;  -- Adjust the limit as needed



###4
SELECT c.FirstName, c.LastName
FROM Cook c
         LEFT JOIN Score s ON c.CookID = s.JudgeID
WHERE s.JudgeID IS NULL;


###5
SELECT s.JudgeID, COUNT(DISTINCT s.EpisodeID) AS EpisodeCount, e.Year
FROM Score s
         JOIN Episode e ON s.EpisodeID = e.EpisodeID
GROUP BY s.JudgeID, e.Year
HAVING EpisodeCount > 3;

###6

WITH RecipeTags AS (
    SELECT
        t1.RecipeID,
        t1.Tag AS Tag1,
        t2.Tag AS Tag2
    FROM
        Tags t1
    JOIN
        Tags t2 ON t1.RecipeID = t2.RecipeID AND t1.Tag < t2.Tag
),
EpisodeRecipes AS (
    SELECT
        ep.RecipeID
    FROM
        EpisodeParticipation ep
    GROUP BY
        ep.RecipeID
)
SELECT
    rt.Tag1,
    rt.Tag2,
    COUNT(*) AS PairCount
FROM
    RecipeTags rt
        JOIN
    EpisodeRecipes er ON rt.RecipeID = er.RecipeID
GROUP BY
    rt.Tag1,
    rt.Tag2
ORDER BY
    PairCount DESC
    LIMIT 3;


##7
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



####8


SELECT
    ep.EpisodeID,
    e.EpisodeNumber,
    COUNT(re.EquipmentID) AS EquipmentCount
FROM
    EpisodeParticipation ep
        JOIN
    RecipeEquipment re ON ep.RecipeID = re.RecipeID
        JOIN
    Episode e ON ep.EpisodeID = e.EpisodeID
GROUP BY
    ep.EpisodeID,
    e.EpisodeNumber
ORDER BY
    EquipmentCount DESC
    LIMIT 1;



####9

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

####10

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



#### 11

SELECT j.FirstName AS JudgeName, j.LastName AS JudgeLastName, c.FirstName AS ChefName, c.LastName AS ChefLastName, SUM(s.Score) AS TotalRating FROM Score s JOIN Cook j ON s.JudgeID
    = j.CookID JOIN Cook c ON s.CookID = c.CookID GROUP BY s.JudgeID, s.CookID ORDER BY TotalRating DESC LIMIT 5;


#### 12

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


####13

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

####15

SELECT
    fg.Name AS FoodGroup
FROM
    FoodGroup fg
WHERE
    fg.FoodGroupID NOT IN (
        SELECT
            DISTINCT i.FoodGroupID
        FROM
            RecipeIngredient ri
                JOIN
            Ingredient i ON ri.IngredientID = i.IngredientID
    );



