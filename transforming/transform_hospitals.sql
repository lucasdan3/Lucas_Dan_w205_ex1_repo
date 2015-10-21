-- use default database

USE DEFAULT;

-- SQL code to drop table if it exists before we create it

DROP TABLE IF EXISTS hospitals_transformed;

-- SQL code to another table with transformed data for Hospitals entity

CREATE TABLE hospitals_transformed
AS (SELECT provider_id, hospital_name, state, hospital_type FROM hospitals);
