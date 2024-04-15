-- Create the dummy database
CREATE DATABASE IF NOT EXISTS dummydatabase;

-- Use the dummy database
USE dummydatabase;

-- Create the dummy table
CREATE TABLE IF NOT EXISTS dummytable (
                                          id INT AUTO_INCREMENT PRIMARY KEY,
                                          name VARCHAR(50),
                                          age INT
);

-- Insert some sample data into the dummy table
INSERT INTO dummytable (name, age) VALUES
                                       ('John', 25),
                                       ('Alice', 30),
                                       ('Bob', 28);
