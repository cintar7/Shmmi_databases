-- Create the dummy database
CREATE DATABASE IF NOT EXISTS dummy;

-- Use the dummy database
USE dummy;

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
                                                      `Role` varchar(255) DEFAULT '255',
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



