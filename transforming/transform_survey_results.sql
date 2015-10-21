-- use default database

USE DEFAULT;

-- SQL code to drop table if it exists before we create it

DROP TABLE IF EXISTS survey_results_transformed;

-- SQL code to another table with transformed data for Survey Results entity

CREATE TABLE survey_results_transformed
AS (SELECT provider_id, avg(hcahps_base_score) as hcahps_base_score, avg(hcahps_consistency_score) as hcahps_consistency_score FROM survey_responses GROUP BY provider_id);
