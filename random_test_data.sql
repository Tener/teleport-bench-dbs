\timing

-- Step 1: Create the table
CREATE TABLE IF NOT EXISTS customers (
    id uuid PRIMARY KEY,
    name varchar(100),
    email varchar(100),
    phone varchar(20),
    address text
);

-- Step 2: Install pgcrypto extension if not already installed
-- You may need superuser privileges to run this command
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- Step 3: Fill the table with random customer data
INSERT INTO customers (id, name, email, phone, address)
SELECT
    gen_random_uuid (), -- Generate random UUID as the ID
    substr(md5(random()::text), 0, 10) || ' ' || -- Generate random name
    substr(md5(random()::text), 0, 10) AS name,
    substr(md5(random()::text), 0, 15) || -- Generate random email
    '@example.com' AS email,
    '+1-' || floor(random() * 10000000000) AS phone, -- Generate random phone number
    substr(md5(random()::text), 0, 20) || ' ' || -- Generate random address
    floor(random() * 1000) || ' Street' || ' ' || floor(random() * 100) || ' Avenue' AS address
FROM
    -- ~1.9 MB of db size per 10,000 rows.
    generate_series(1, 100 * 10000);

SELECT
    *
FROM
    customers
LIMIT 10;

SELECT
    count(*)
FROM
    customers;

SELECT pg_size_pretty(pg_database_size('postgres')) AS database_size;
