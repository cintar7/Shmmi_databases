USE dummy1;

---#### 14

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

