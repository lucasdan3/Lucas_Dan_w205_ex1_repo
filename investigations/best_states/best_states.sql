-- SparkSQL query to select 10 states with highest quality of care in terms of hospitals

SELECT
h.state as state
,avg(p.score_eff_care) as score_eff_care
,avg(p.score_readmissions) as score_readmissions
,avg(s.hcahps_base_score) as hcahps_base_score
,avg(s.hcahps_consistency_score) as hcahps_consistency_score
,((SUM(p.score_eff_care) + SUM(p.score_readmissions) + SUM(s.hcahps_base_score) + SUM(s.hcahps_consistency_score))/(4.0)) as total_score
FROM
hospitals_transformed AS h
LEFT JOIN procedures_transformed AS p ON h.provider_id=p.provider_id
LEFT JOIN survey_responses_transformed AS s ON h.provider_id=s.provider_id
GROUP BY
h.state
ORDER BY
total_score
DESC
LIMIT 10;
