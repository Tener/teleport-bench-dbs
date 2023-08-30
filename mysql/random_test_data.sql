CREATE DATABASE IF NOT EXISTS benchmark;

USE benchmark;

-- Step 1: Create the table
CREATE TABLE IF NOT EXISTS customers (
    id CHAR(36) PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    address TEXT
);

SET profiling = 1;

INSERT INTO customers (id, name, email, phone, address)
SELECT
    UUID(), -- Generate random UUID as the ID
    CONCAT(SUBSTRING(MD5(RAND()), 1, 10), ' ', SUBSTRING(MD5(RAND()), 1, 10)) AS name,
    CONCAT(SUBSTRING(MD5(RAND()), 1, 15), '@example.com') AS email,
    CONCAT('+1-', FLOOR(RAND() * 10000000000)) AS phone, -- Generate random phone number
    CONCAT(SUBSTRING(MD5(RAND()), 1, 20), ' ', FLOOR(RAND() * 1000), ' Street ', FLOOR(RAND() * 100), ' Avenue') AS address
FROM
    (WITH RECURSIVE num_series(n) AS (     SELECT 1     UNION ALL     SELECT n + 1 FROM num_series WHERE n < 1000000)
    SELECT n FROM num_series LIMIT 1000000) as temp_table;

SHOW PROFILES;

SET profiling = 0;

-- Step 3: View data
SELECT
    *
FROM
    customers
LIMIT 10;

SELECT
    COUNT(*)
FROM
    customers;

SELECT 
    CONCAT(ROUND(SUM(data_length + index_length) / 1024 / 1024, 2), ' MB') AS database_size 
FROM 
    information_schema.TABLES 
WHERE 
    table_schema = DATABASE();
