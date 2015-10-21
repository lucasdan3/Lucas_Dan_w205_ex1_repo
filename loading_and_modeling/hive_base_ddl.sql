-- use default database

USE DEFAULT;

-- DDL SQL statements to drop tables if they already exist because were about to create them

DROP TABLE IF EXISTS hospitals;

DROP TABLE IF EXISTS effectivecare;

DROP TABLE IF EXISTS readmissions;

DROP TABLE IF EXISTS surveyresponses;

-- DDL SQL statements to create a table for each of the data files we loaded to HDFS

CREATE EXTERNAL TABLE hospitals
(provider_id string, hospital_name string, address string, city string, state string, zip_code string, country_name string, phone_number string, hospital_type string, hospital_ownership string, emergency services string)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ‘,’
STORED AS TEXTFILE
LOCATION "/user/lucasdan/hospital_compare/hospitals_noheaders.csv";

CREATE EXTERNAL TABLE effectivecare
(provider_id string, hospital_name string, address string, city string, state string, zip_code string, country_name string, phone_number string, condition string, measure_id string, measure_name string, score string, sample string, footnote string, measure_start_date date, measure_end_date date)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ‘,’
STORED AS TEXTFILE
LOCATION "/user/lucasdan/hospital_compare/effective_care_noheaders.csv";

CREATE EXTERNAL TABLE readmissions
(provider_id string, hospital_name string, address string, city string, state string, zip_code string, country_name string, phone_number string, measure_name string, measure_id string, compared_to_national string, denominator string, score string, lower_estimate string, higher_estimate string, footnote string, measure_start_date date, measure_end_date date)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ‘,’
STORED AS TEXTFILE
LOCATION "/user/lucasdan/hospital_compare/readmissions_noheaders.csv";

CREATE EXTERNAL TABLE surveyresponses
(provider_id string, hospital_name string, address string, city string, state string, zip_code string, country_name string, comm_w_nurses_ach_pts string, comm_w_nurses_impr_pts string, comm_w_nurses_dim_score string, comm_w_docs_ach_pts string, comm_w_docs_impr_pts string, comm_w_docs_dim_score string, resp_hosp_stf_ach_pts string, resp_hosp_stf_impr_pts string, resp_hosp_stf_dim_score string, pain_mgmt_ach_pts string, pain_mgmt_impr_pts string, pain_mgmt_dim_score string, comm_meds_ach_pts string, comm_meds_impr_pts string, comm_meds_dim_score string, clean_quiet_ach_pts string, clean_quiet_impr_pts string, clean_quiet_dim_score string, disch_info_ach_pts string, disch_info_impr_pts string, disch_info_dim_score string, overall_ach_pts string, overall_impr_pts string, overall_dim_score string, hcahps_base_score string, hcahps_consistency_score string)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ‘,’
STORED AS TEXTFILE
LOCATION "/user/lucasdan/hospital_compare/survey_responses_noheaders.csv";
