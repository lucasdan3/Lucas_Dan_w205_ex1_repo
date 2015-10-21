-- use default database

USE DEFAULT;

-- SQL code to drop table if it exists before we create it

DROP TABLE IF EXISTS procedures_transformed;

-- SQL code to another table with transformed data for Procedures entity

CREATE TABLE procedures_transformed
AS (SELECT e.provider_id AS provider_id, e.measure_id AS measure_id, e.measure_name AS measure_name, avg(e.score) AS score_eff_care, sum(e.sample) AS sample, avg(r.score) AS score_readmissions FROM effective_care AS e LEFT JOIN readmissions AS r ON e.provider_id=r.provider_id GROUP BY e.provider_id, e.measure_id);
