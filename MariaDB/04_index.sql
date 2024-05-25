USE dummy1;

    LOAD DATA LOCAL INFILE '/tmp/users.csv'
    INTO TABLE User
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;

    LOAD DATA LOCAL INFILE '/tmp/foodgroups.csv'
    INTO TABLE FoodGroup
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;

    LOAD DATA LOCAL INFILE '/tmp/ingredients.csv'
    INTO TABLE Ingredient
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;

    LOAD DATA LOCAL INFILE '/tmp/nutritionalinfo.csv'
    INTO TABLE NutritionalInfo
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;

    LOAD DATA LOCAL INFILE '/tmp/recipes.csv'
    INTO TABLE Recipe
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;


    LOAD DATA LOCAL INFILE '/tmp/cooks.csv'
    INTO TABLE Cook
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;


    LOAD DATA LOCAL INFILE '/tmp/episodes.csv'
    INTO TABLE Episode
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;

    LOAD DATA LOCAL INFILE '/tmp/equipment.csv'
    INTO TABLE Equipment
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;

    LOAD DATA LOCAL INFILE '/tmp/thematicunits.csv'
    INTO TABLE ThematicUnit
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;

    LOAD DATA LOCAL INFILE '/tmp/steps.csv'
    INTO TABLE Step
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;

    LOAD DATA LOCAL INFILE '/tmp/recipeingredients.csv'
    INTO TABLE RecipeIngredient
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;

    LOAD DATA LOCAL INFILE '/tmp/recipeequipment.csv'
    INTO TABLE RecipeEquipment
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;

    LOAD DATA LOCAL INFILE '/tmp/recipethematicunits.csv'
    INTO TABLE RecipeThematicUnit
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;

    LOAD DATA LOCAL INFILE '/tmp/episodeparticipations.csv'
    INTO TABLE EpisodeParticipation
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;

    LOAD DATA LOCAL INFILE '/tmp/scores.csv'
    INTO TABLE Score
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;

    LOAD DATA LOCAL INFILE '/tmp/images.csv'
    INTO TABLE Image
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;




