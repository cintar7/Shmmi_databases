CREATE DATABASE IF NOT EXISTS dummy1;

-- Use the dummy database
USE dummy1;

-- Table for storing users and their permissions
-- Procedure for database backup
DELIMITER //

CREATE PROCEDURE `AdminBackupDatabase` ()
BEGIN
    -- Execute backup commands here
    -- Example: CALL sys.mysqldump('dummy1');
    -- Make sure to replace 'sys.mysqldump' with the appropriate backup command
END //

-- Procedure for database restore
CREATE PROCEDURE `AdminRestoreDatabase` ()
BEGIN
    -- Execute restore commands here
    -- Example: CALL sys.mysql('dummy1', 'path_to_backup_file.sql');
    -- Make sure to replace 'sys.mysql' with the appropriate restore command
END //

DELIMITER ;

-- Create users and grant permissions dynamically
DELIMITER //

CREATE PROCEDURE `SetupDatabasePermissions` ()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE uid INT;
    DECLARE uname VARCHAR(255);
    DECLARE upass VARCHAR(255);
    DECLARE utype VARCHAR(255);
    DECLARE cur CURSOR FOR SELECT `UserID`, `Username`, `Password`, `UserType` FROM `User`;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

OPEN cur;

read_loop: LOOP
        FETCH cur INTO uid, uname, upass, utype;
        IF done THEN
            LEAVE read_loop;
END IF;

        IF utype = 'Administrator' THEN
            SET @grant_sql = CONCAT('GRANT ALL PRIVILEGES ON dummy1.* TO \'', uname, '\'@\'%\' IDENTIFIED BY \'', upass, '\'');
PREPARE stmt FROM @grant_sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
ELSE
            SET @grant_sql = CONCAT('GRANT SELECT, INSERT, UPDATE ON dummy1.Recipe TO \'', uname, '\'@\'%\' IDENTIFIED BY \'', upass, '\'');
PREPARE stmt FROM @grant_sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
END IF;
END LOOP;

CLOSE cur;
END //

DELIMITER ;

-- Call the procedure to set up permissions
CALL SetupDatabasePermissions();
