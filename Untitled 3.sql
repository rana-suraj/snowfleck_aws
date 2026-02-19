-- Step 1: Check what databases you have access to
SHOW DATABASES;

-- Step 2: Create the database (if it doesn't exist)
CREATE DATABASE IF NOT EXISTS aws_db;

-- Step 3: Create the schema
CREATE SCHEMA IF NOT EXISTS aws_db.aws;

-- Step 4: Now create your table
CREATE OR REPLACE TABLE aws_db.aws.aws_new ( 
    OrderID INT, 
    CustomerName VARCHAR, 
    Product VARCHAR, 
    Quantity INT, 
    Price FLOAT, 
    OrderDate DATE 
);

CREATE OR REPLACE STORAGE INTEGRATION Snow_OBJS 
TYPE = EXTERNAL_STAGE 
STORAGE_PROVIDER = S3 
ENABLED = TRUE 
STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::216482850949:role/snowflakerolenew' 
STORAGE_ALLOWED_LOCATIONS = ('s3://s3snowflakeshweta/'); 

desc integration snow_objs