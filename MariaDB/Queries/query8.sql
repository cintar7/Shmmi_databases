USE dummy1;


---###8
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
