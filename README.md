# CIS4400_HW1 (Private GitHub project as of now)
This project involves extracting source data from NYC OpenData, and storing it first in Google Cloud. The source data is the results for New York State Math exams from 2013-2023. After data is stored in Google Cloud, data will be cleaned, transformed and finally loaded into MongoDB data warehouse.

So step 1: Source data to Google Cloud (GC)
We need an adaptor, a bucket and a connection string. 

1. Created a new project on GC named "CIS4400 HW1".
2. Created a new bucket in GC named "cis4400_hw1_kyt". For now, the bucket is made private.
3. Created a service account in GC and created a new key with the owner permission granted. A JSON file was downloaded which was then linked with Mage. 
