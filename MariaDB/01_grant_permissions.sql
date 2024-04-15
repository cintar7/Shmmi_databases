-- Create a new user
CREATE USER 'admin'@'%' IDENTIFIED BY 'root';

-- Grant necessary privileges
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION;

GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION;
-- Flush privileges to apply changes
FLUSH PRIVILEGES;



