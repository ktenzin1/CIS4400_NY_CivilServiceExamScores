# CIS4400_HW1 (Private GitHub project as of now)
Overview: 
This project involves extracting source data from Data.gov, and storing it first in Google Cloud. The source data consists of all candidates in NY who passed a Civil Service exam, ranked in the order of their scores. After data is stored in Google Cloud, data will be cleaned, transformed and finally loaded into Storage S3 data warehouse.

Data Source Link: https://catalog.data.gov/dataset/civil-service-list-active
CSV Download Link: [https://data.ny.gov/api/views/8wbx-tsch/rows.csv?accessType=DOWNLOAD&sorting=true](https://data.cityofnewyork.us/api/views/vx8i-nprf/rows.csv?accessType=DOWNLOAD)

Explanation of data source or where the data comes from: The data in Data.gov comes from the Department of Citywide Administrative Services (DCAS). DCAS would be maintaining a database for the all of the candidates who takes an exam for a civil service job in NY. The grain of the data is each candidate who took an exam. Every time a candidate appears for an exam, this database would be updated with the information that is now available for public use on data.gov. 

Some of this information includes a candidate's name, exam number, list number, adjusted final average which includes a candidate's score and any credits given, credits given for meeting NY residency, credits for a lost parent/sibling (FDNY, NYPD, or a First Responder) during or as a result of 911, date the list was published for review for public and appointing agencies (published date), the date the list was submitted to agencies so they can consider eligible candidates for appointments (established date), etc. 

It can be understood that the data for each candidate is added to the data.gov dataset on the "Published Date". On this date, a candidate's record will be available on public databases including data.gov after which candidates could check and review their scores and information pubished and inform DCAS if they find any discrepancies. However, not all candidates have a "published date" and it is unclear if it didn't have one at all or if a candidate requested that the date not be made public. 

Link for the data dictionary: Civil Service List_Active_Definitions.xlsx

So step 1: Source data to Google Cloud (GC)
We need an adaptor, a bucket and a connection string. 

1. Created a new project on GC named "CIS4400 HW1".
2. Created a new bucket in GC named "cis4400_hw1_kyt". For now, the bucket is made private.
3. Created a service account in GC and created a new key with the owner permission granted.
4. Used Google Colab to write python script to ingest the data from the source to the Google Cloud bucket.
5. Data sourcing completed.




