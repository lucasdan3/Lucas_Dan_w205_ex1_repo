-- SparkSQL query to select 10 procedures with highest variability in terms of hospitals

SELECT DISTINCT
p.measure_name
,COUNT(*) as variability
FROM
procedures_transformed AS p
GROUP BY
p.measure_id
,p.provider_id
ORDER BY
variability
DESC
LIMIT 10;
