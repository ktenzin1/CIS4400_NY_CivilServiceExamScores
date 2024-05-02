# CIS4400_HW1 
Overview: 
This project involves extracting source data from Data.gov, and storing it first in Google Cloud. The source data consists of all candidates in NY who passed a Civil Service exam, ranked in the order of their scores. After data is stored in Google Cloud, dimensional modeling will be prepared using DbSchema to create the schema for the datawarehouse in Google BigQuery. This project will pave way to the next project where data will be cleaned, transformed and finally loaded into the BigQuery data warehouse.

Tools Used: Google Cloud, BigQuery, DbScehma, Google Colab, Visual Studio Code

Requirements: Through this project, I want to know which civil service job had candidates receiving the highest and lowest civil service exam scores (Adjusted Final Average). For that I will need to group the candidates in groups based on the civil service job for which they are candidates for and find the average scores in each group. Then I would compare the group scores. 

I also want to know if candidates from "open competition" had higher or lower average scores compared to those not from "open competition" but those entering directly through appointing agencies. For that I will need to find the average scores of the two groups by first grouping candidates in the two groups.

For each candidate, the Adjusted Final Average (AFA) consists of the individual test scores and any additional credits granted for example credits for parents/siblings (FDNY, NYPD, or a First Responder) lost during or as a result of 911, credits for meeting certain years of NY residency, etc. So, for the third requirement, I also want to find out which additional credit category, had candidates receiving the highest and lowest credits from. For this, I will need to group candidates by the additional credits category and then count the number of candidates receiving credits from each category. 

Data Source Link: https://catalog.data.gov/dataset/civil-service-list-active
CSV Download Link: https://data.cityofnewyork.us/api/views/vx8i-nprf/rows.csv?accessType=DOWNLOAD

Explanation of data source or where the data comes from (Business Process): The data in Data.gov comes from the Department of Citywide Administrative Services (DCAS). DCAS would be maintaining a database for all of the candidate who takes an exam for a civil service job in NY. The grain of the data is each candidate who takes a civil service exam. Every time a candidate appears for an exam, this database would be updated with the information which will later be published and be available for public use on data.gov. 

Some of this information includes a candidate's name, exam number, list number, adjusted final average which includes a candidate's score and any credits given, credits given for meeting NY residency, credits for a lost parent/sibling (FDNY, NYPD, or a First Responder) during or as a result of 911, date the list was published for review for public and appointing agencies (published date), the date the list was submitted to agencies so they can consider eligible candidates for appointments (established date), etc. 

It can be understood that the data for each candidate is added to the data.gov dataset on the "Published Date". On this date, a candidate's record will be available on public databases including data.gov after which candidates could check and review their scores and information pubished and inform DCAS if they find any discrepancies. However, not all candidates have a "published date" and it is unclear if it didn't have one at all or if a candidate requested that the date not be made public. 

Link for the data dictionary: 
(https://www.bing.com/ck/a?!&&p=2ebc02bb5110134cJmltdHM9MTcxMjQ0ODAwMCZpZ3VpZD0wNmZhMjI0Mi1hYTJiLTY3OTQtM2ZiZS0zNjFiYWIwMjY2ZGQmaW5zaWQ9NTI0Mw&ptn=3&ver=2&hsh=3&fclid=06fa2242-aa2b-6794-3fbe-361bab0266dd&psq=Civil+Service+List_Active_Definitions.xlsx&u=a1aHR0cHM6Ly9kYXRhLmNpdHlvZm5ld3lvcmsudXMvYXBpL3ZpZXdzLzhpY3ItNTlxYi9maWxlcy8wYmJjMjRhZC1iMzgwLTQ1NTItYjY3OC04N2JiNDk0NDE4MGQ_ZG93bmxvYWQ9dHJ1ZSZmaWxlbmFtZT1DaXZpbCUyMFNlcnZpY2UlMjBMaXN0X0FjdGl2ZV9EZWZpbml0aW9ucy54bHN4&ntb=1)

So step 1: Source data to Google Cloud (GC)
Firstly, created a github repository called CIS4400_HW1, signed into my github account in Visual Studio Code (VS Code) and opened the github repository in VS Code, and wrote this README file.
1. Created a new project on GC named "CIS4400 HW1".
2. Created a new bucket in GC named "cis4400_hw1_kyt". The bucket is made public.
3. Created a service account in GC and created a new key with the owner permission granted. Downloaded the configuration file with the service account key in JSON format and established connection link to the python script to first extract source data and then store it in GC.
4. Used Google Colab to write python script to gather data from the source and then updated the script to store the data to the Google Cloud bucket.
5. Downloaded the scipt as sourceextraction.ipynb and uploaded it to Visual Studio Code.
6. Executed the code in VS Code to ensure it works and that the source parquet file is stored successfully in the bucket in GC.
7. Wrote a commit message and committed and pushed the README and the python script into github from VS Code.
8. Confirmed github repository in github updated.
9. Data sourcing and storage completed.

Step 2: Dimensional Modeling
1. Analyzed the business process and the requirements again. Since the project is to analyze the performance of the candidates in the NY civil service exam, the grain of dimensional modeling is each candidate. I will be looking at the scores of each candidate in different civil service job titles.
2. Determined the dimensions and the dimension tables. There are 10 dimension tables: Date, Exam, List, List_Title, List_Agency, Candidate_Info, Veteran_Credit_Info, Parent_Lgy_Info, Sibling_Lgy_Info, and Residency_Info.
3. Determined the facts and the fact table. The fact table is the Fact_Candidate table.
4. MS Excel was used to brainsorm and plan the dimensions and the facts before actually building the schema.
5. To build the schema, DbSchema was used.
6. First, the role of "BigQuery Data Owner, BigQuery User, BigQuery Data Editor, and BigQuery Admin" was granted to my service account "cis4400-hw1-kyt@avian-silicon-418821.iam.gserviceaccount.com" so that I can use BigQuery and later connect with DbSchema.
7. Enabled BigQuery API in GC.
8. Created a BigQuery dataset named cis4400_hw1.
9. As dimension tables and fact table were created with attributes and relationships (primary key, foreign key) in DbSchema, tables were created in BigQuery thus creating a datawarehouse in which data could now be loaded.
10. The SQL script for the dimensional modeling was saved from DbSchema.
11. All documents were committed and pushed to GitHub.

Google Cloud BigQuery Project ID: avian-silicon-418821 (Access given to professor)
Google Cloud Bucket Name: cis4400_hw1_kyt (Public)
Google Cloud Service Account: service-910989056595@gs-project-accounts.iam.gserviceaccount.com




