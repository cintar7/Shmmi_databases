USE dummy1;

---###6

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
