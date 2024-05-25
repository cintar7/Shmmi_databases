-- Create the dummy database
CREATE DATABASE IF NOT EXISTS dummy1;

-- Use the dummy database
USE dummy1;

CREATE TABLE IF NOT EXISTS `User` (
                                      `UserID` int NOT NULL DEFAULT '0',
                                      `Username` varchar(255) NOT NULL DEFAULT '255',
                                      `Password` varchar(255) NOT NULL DEFAULT '255',
                                      `UserType` varchar(255) NOT NULL DEFAULT '255',
                                      PRIMARY KEY (`UserID`)
);

CREATE TABLE IF NOT EXISTS `Recipe` (
                                        `RecipeID` int NOT NULL DEFAULT '0',
                                        `Name` varchar(255) NOT NULL DEFAULT '255',
                                        `Description` text,
                                        `NationalCuisine` varchar(255) DEFAULT '255',
                                        `DifficultyLevel` int,
                                        `MealTypes` varchar(255) DEFAULT '255',
                                        `Tags` text,
                                        `Tips` text,
                                        `PreparationTime` int,
                                        `CookingTime` int,
                                        `MainIngredientID` int,
                                        `NutritionalInfoID` int,
                                        PRIMARY KEY (`RecipeID`)
);

CREATE TABLE IF NOT EXISTS `Step` (
                                      `StepID` int NOT NULL DEFAULT '0',
                                      `RecipeID` int,
                                      `StepNumber` int,
                                      `Description` text,
                                      PRIMARY KEY (`StepID`)
);

CREATE TABLE IF NOT EXISTS `Ingredient` (
                                            `IngredientID` int NOT NULL DEFAULT '0',
                                            `Name` varchar(255) NOT NULL DEFAULT '255',
                                            `FoodGroupID` int,
                                            PRIMARY KEY (`IngredientID`)
);

CREATE TABLE IF NOT EXISTS `FoodGroup` (
                                           `FoodGroupID` int NOT NULL DEFAULT '0',
                                           `Name` varchar(255) NOT NULL DEFAULT '255',
                                           `Description` text,
                                           PRIMARY KEY (`FoodGroupID`)
);

CREATE TABLE IF NOT EXISTS `RecipeIngredient` (
                                                  `RecipeID` int NOT NULL,
                                                  `IngredientID` int,
                                                  `Quantity` varchar(255) DEFAULT '255',
                                                  `Unit` varchar(255) DEFAULT '255',
                                                  PRIMARY KEY (`RecipeID`)
);

CREATE TABLE IF NOT EXISTS `Equipment` (
                                           `EquipmentID` int NOT NULL DEFAULT '0',
                                           `Name` varchar(255) NOT NULL DEFAULT '255',
                                           `UsageInstructions` text,
                                           PRIMARY KEY (`EquipmentID`)
);

CREATE TABLE IF NOT EXISTS `RecipeEquipment` (
                                                 `RecipeID` int NOT NULL,
                                                 `EquipmentID` int,
                                                 PRIMARY KEY (`RecipeID`)
);

CREATE TABLE IF NOT EXISTS `NutritionalInfo` (
                                                 `NutritionalInfoID` int NOT NULL DEFAULT '0',
                                                 `FatPerServing` float,
                                                 `ProteinPerServing` float,
                                                 `CarbsPerServing` float,
                                                 `CaloriesPerServing` float,
                                                 PRIMARY KEY (`NutritionalInfoID`)
);

CREATE TABLE IF NOT EXISTS `ThematicUnit` (
                                              `ThematicUnitID` int NOT NULL DEFAULT '0',
                                              `Name` varchar(255) NOT NULL DEFAULT '255',
                                              `Description` text,
                                              PRIMARY KEY (`ThematicUnitID`)
);

CREATE TABLE IF NOT EXISTS `RecipeThematicUnit` (
                                                    `RecipeID` int NOT NULL,
                                                    `ThematicUnitID` int,
                                                    PRIMARY KEY (`RecipeID`)
);

CREATE TABLE IF NOT EXISTS `Cook` (
                                      `CookID` int NOT NULL DEFAULT '0',
                                      `FirstName` varchar(255) NOT NULL DEFAULT '255',
                                      `LastName` varchar(255) NOT NULL DEFAULT '255',
                                      `PhoneNumber` varchar(255) DEFAULT '255',
                                      `DateOfBirth` date,
                                      `Age` int,
                                      `YearsOfExperience` int,
                                      `Specialization` varchar(255) DEFAULT '255',
                                      `Qualification` varchar(255) DEFAULT '255',
                                      PRIMARY KEY (`CookID`)
);

CREATE TABLE IF NOT EXISTS `Episode` (
                                         `EpisodeID` int NOT NULL DEFAULT '0',
                                         `EpisodeNumber` int,
                                         `Year` int,
                                         PRIMARY KEY (`EpisodeID`)
);

CREATE TABLE IF NOT EXISTS `EpisodeParticipation` (
                                                      `EpisodeID` int NOT NULL,
                                                      `CookID` int,
                                                      `RecipeID` int,
                                                      `Role` varchar(255) DEFAULT 'Assistant',
                                                      PRIMARY KEY (`EpisodeID`)
);

CREATE TABLE IF NOT EXISTS `Score` (
                                       `EpisodeID` int NOT NULL,
                                       `CookID` int,
                                       `JudgeID` int,
                                       `Score` int,
                                       PRIMARY KEY (`EpisodeID`)
);

CREATE TABLE IF NOT EXISTS `Image` (
                                       `ImageID` int NOT NULL DEFAULT '0',
                                       `EntityType` varchar(255) DEFAULT '255',
                                       `EntityID` int,
                                       `ImagePath` varchar(255) DEFAULT '255'
);


ALTER TABLE `Recipe` ADD CONSTRAINT `Recipe_fk10` FOREIGN KEY (`MainIngredientID`) REFERENCES `Ingredient`(`IngredientID`);

ALTER TABLE `Recipe` ADD CONSTRAINT `Recipe_fk11` FOREIGN KEY (`NutritionalInfoID`) REFERENCES `NutritionalInfo`(`NutritionalInfoID`);
ALTER TABLE `Step` ADD CONSTRAINT `Step_fk1` FOREIGN KEY (`RecipeID`) REFERENCES `Recipe`(`RecipeID`);
ALTER TABLE `Ingredient` ADD CONSTRAINT `Ingredient_fk2` FOREIGN KEY (`FoodGroupID`) REFERENCES `FoodGroup`(`FoodGroupID`);

ALTER TABLE `RecipeIngredient` ADD CONSTRAINT `RecipeIngredient_fk0` FOREIGN KEY (`RecipeID`) REFERENCES `Recipe`(`RecipeID`);

ALTER TABLE `RecipeIngredient` ADD CONSTRAINT `RecipeIngredient_fk1` FOREIGN KEY (`IngredientID`) REFERENCES `Ingredient`(`IngredientID`);

ALTER TABLE `RecipeEquipment` ADD CONSTRAINT `RecipeEquipment_fk0` FOREIGN KEY (`RecipeID`) REFERENCES `Recipe`(`RecipeID`);

ALTER TABLE `RecipeEquipment` ADD CONSTRAINT `RecipeEquipment_fk1` FOREIGN KEY (`EquipmentID`) REFERENCES `Equipment`(`EquipmentID`);


ALTER TABLE `RecipeThematicUnit` ADD CONSTRAINT `RecipeThematicUnit_fk0` FOREIGN KEY (`RecipeID`) REFERENCES `Recipe`(`RecipeID`);

ALTER TABLE `RecipeThematicUnit` ADD CONSTRAINT `RecipeThematicUnit_fk1` FOREIGN KEY (`ThematicUnitID`) REFERENCES `ThematicUnit`(`ThematicUnitID`);


ALTER TABLE `EpisodeParticipation` ADD CONSTRAINT `EpisodeParticipation_fk0` FOREIGN KEY (`EpisodeID`) REFERENCES `Episode`(`EpisodeID`);

ALTER TABLE `EpisodeParticipation` ADD CONSTRAINT `EpisodeParticipation_fk1` FOREIGN KEY (`CookID`) REFERENCES `Cook`(`CookID`);

ALTER TABLE `EpisodeParticipation` ADD CONSTRAINT `EpisodeParticipation_fk2` FOREIGN KEY (`RecipeID`) REFERENCES `Recipe`(`RecipeID`);
ALTER TABLE `Score` ADD CONSTRAINT `Score_fk0` FOREIGN KEY (`EpisodeID`) REFERENCES `Episode`(`EpisodeID`);

ALTER TABLE `Score` ADD CONSTRAINT `Score_fk1` FOREIGN KEY (`CookID`) REFERENCES `Cook`(`CookID`);

ALTER TABLE `Score` ADD CONSTRAINT `Score_fk2` FOREIGN KEY (`JudgeID`) REFERENCES `Cook`(`CookID`);


CREATE INDEX idx_username ON User (Username);
CREATE INDEX idx_recipe_name ON Recipe (Name);
CREATE INDEX idx_recipe_national_cuisine ON Recipe (NationalCuisine);
CREATE INDEX idx_recipe_difficulty_level ON Recipe (DifficultyLevel);
CREATE INDEX idx_recipe_main_ingredient_id ON Recipe (MainIngredientID);
CREATE INDEX idx_recipe_nutritional_info_id ON Recipe (NutritionalInfoID);
CREATE INDEX idx_step_recipe_id ON Step (RecipeID);
CREATE INDEX idx_step_step_number ON Step (StepNumber);
CREATE INDEX idx_ingredient_name ON Ingredient (Name);
CREATE INDEX idx_ingredient_food_group_id ON Ingredient (FoodGroupID);
CREATE INDEX idx_food_group_name ON FoodGroup (Name);
CREATE INDEX idx_recipe_ingredient_recipe_id ON RecipeIngredient (RecipeID);
CREATE INDEX idx_recipe_ingredient_ingredient_id ON RecipeIngredient (IngredientID);
CREATE INDEX idx_equipment_name ON Equipment (Name);
CREATE INDEX idx_recipe_equipment_recipe_id ON RecipeEquipment (RecipeID);
CREATE INDEX idx_recipe_equipment_equipment_id ON RecipeEquipment (EquipmentID);
CREATE INDEX idx_nutritional_info_fat ON NutritionalInfo (FatPerServing);
CREATE INDEX idx_nutritional_info_protein ON NutritionalInfo (ProteinPerServing);
CREATE INDEX idx_nutritional_info_carbs ON NutritionalInfo (CarbsPerServing);
CREATE INDEX idx_nutritional_info_calories ON NutritionalInfo (CaloriesPerServing);
CREATE INDEX idx_thematic_unit_name ON ThematicUnit (Name);
CREATE INDEX idx_recipe_thematic_unit_recipe_id ON RecipeThematicUnit (RecipeID);
CREATE INDEX idx_recipe_thematic_unit_thematic_unit_id ON RecipeThematicUnit (ThematicUnitID);
CREATE INDEX idx_cook_first_name ON Cook (FirstName);
CREATE INDEX idx_cook_last_name ON Cook (LastName);
CREATE INDEX idx_cook_specialization ON Cook (Specialization);
CREATE INDEX idx_cook_qualification ON Cook (Qualification);
CREATE INDEX idx_episode_number ON Episode (EpisodeNumber);
CREATE INDEX idx_episode_year ON Episode (Year);
CREATE INDEX idx_episode_participation_episode_id ON EpisodeParticipation (EpisodeID);
CREATE INDEX idx_episode_participation_cook_id ON EpisodeParticipation (CookID);
CREATE INDEX idx_episode_participation_recipe_id ON EpisodeParticipation (RecipeID);
CREATE INDEX idx_score_episode_id ON Score (EpisodeID);
CREATE INDEX idx_score_cook_id ON Score (CookID);
CREATE INDEX idx_score_judge_id ON Score (JudgeID);
CREATE INDEX idx_image_entity_type ON Image (EntityType);
CREATE INDEX idx_image_entity_id ON Image (EntityID);



