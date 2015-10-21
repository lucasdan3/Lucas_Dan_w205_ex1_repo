-- SparkSQL query to select data that allows for easy correlation coefficient calculation for average scores of hospital quality vs. patient survey responses

SELECT
p.hospital_name
,avg(p.score_eff_care) as score_eff_care
,avg(s.hcahps_base_score) as hcahps_base_score
FROM
procedures_transformed AS p
LEFT JOIN survey_responses_transformed AS s ON p.provider_id=s.provider_id
GROUP BY
p.provider_id;
