USE dummy1;

---####15

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

