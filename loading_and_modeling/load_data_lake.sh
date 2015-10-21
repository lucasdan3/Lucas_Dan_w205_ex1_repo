#!/bin/sh

# unzip folder with data files

unzip /Users/lucasdan/Desktop/Lucas_Dan_w205_ex1_repo/Hospital_Revised_Flatfiles.zip

# rename the data files locally, using cleaner names to prepare for HDFS loading process

mv '/Users/lucasdan/Desktop/Lucas_Dan_w205_ex1_repo/Hospital_Revised_Flatfiles/Hospital General Information.csv' /Users/lucasdan/Desktop/Lucas_Dan_w205_ex1_repo/Hospital_Revised_Flatfiles/hospitals.csv

mv '/Users/lucasdan/Desktop/Lucas_Dan_w205_ex1_repo/Hospital_Revised_Flatfiles/Timely and Effective Care - Hospital.csv' /Users/lucasdan/Desktop/Lucas_Dan_w205_ex1_repo/Hospital_Revised_Flatfiles/effective_care.csv

mv '/Users/lucasdan/Desktop/Lucas_Dan_w205_ex1_repo/Hospital_Revised_Flatfiles/Readmissions and Deaths - Hospital.csv' /Users/lucasdan/Desktop/Lucas_Dan_w205_ex1_repo/Hospital_Revised_Flatfiles/readmissions.csv

mv '/Users/lucasdan/Desktop/Lucas_Dan_w205_ex1_repo/Hospital_Revised_Flatfiles/hvbp_hcahps_05_28_2015.csv' /Users/lucasdan/Desktop/Lucas_Dan_w205_ex1_repo/Hospital_Revised_Flatfiles/surveys_responses.csv

# remove headers from data files and rename them with '_noheaders'

cat /Users/lucasdan/Desktop/Lucas_Dan_w205_ex1_repo/Hospital_Revised_Flatfiles/hospitals.csv | sed "1 d" > /Users/lucasdan/Desktop/Lucas_Dan_w205_ex1_repo/Hospital_Revised_Flatfiles/hospitals_noheaders.csv

cat /Users/lucasdan/Desktop/Lucas_Dan_w205_ex1_repo/Hospital_Revised_Flatfiles/effective_care.csv | sed "1 d" > /Users/lucasdan/Desktop/Lucas_Dan_w205_ex1_repo/Hospital_Revised_Flatfiles/effective_care_noheaders.csv

cat /Users/lucasdan/Desktop/Lucas_Dan_w205_ex1_repo/Hospital_Revised_Flatfiles/readmissions.csv | sed "1 d" > /Users/lucasdan/Desktop/Lucas_Dan_w205_ex1_repo/Hospital_Revised_Flatfiles/readmissions_noheaders.csv

cat /Users/lucasdan/Desktop/Lucas_Dan_w205_ex1_repo/Hospital_Revised_Flatfiles/surveys_responses.csv | sed "1 d" > /Users/lucasdan/Desktop/Lucas_Dan_w205_ex1_repo/Hospital_Revised_Flatfiles/surveys_responses_noheaders.csv

# first make HDFS directory hospital_compare, then change permissions and load data files from local to HDFS filepath hospital_compare

hadoop dfs -mkdir -p /user/lucasdan/hospital_compare

hdfs dfs –copyFromLocal /Users/lucasdan/Desktop/Lucas_Dan_w205_ex1_repo/Hospital_Revised_Flatfiles/hospitals_noheaders.csv /user/lucasdan/hospital_compare/

hadoop dfs -chmod 777 /user/lucasdan/hospital_compare/hospitals_noheaders.csv

hdfs dfs –copyFromLocal /Users/lucasdan/Desktop/Lucas_Dan_w205_ex1_repo/Hospital_Revised_Flatfiles/effective_care_noheaders.csv /user/lucasdan/hospital_compare/

hadoop dfs -chmod 777 /user/lucasdan/hospital_compare/effective_care_noheaders.csv

hdfs dfs –copyFromLocal /Users/lucasdan/Desktop/Lucas_Dan_w205_ex1_repo/Hospital_Revised_Flatfiles/readmissions_noheaders.csv /user/lucasdan/hospital_compare/

hadoop dfs -chmod 777 /user/lucasdan/hospital_compare/readmissions_noheaders.csv

hdfs dfs –copyFromLocal /Users/lucasdan/Desktop/Lucas_Dan_w205_ex1_repo/Hospital_Revised_Flatfiles/surveys_responses_noheaders.csv /user/lucasdan/hospital_compare/

hadoop dfs -chmod 777 /user/lucasdan/hospital_compare/surveys_responses_noheaders.csv
