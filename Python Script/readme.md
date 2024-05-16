#Python Script
Step 1: Source data to Google Cloud (GC)
Firstly, created a github repository called CIS4400_HW1, signed into my github account in Visual Studio Code (VS Code) and opened the github repository in VS Code, and wrote this README file.
1. Created a new project on GC named "CIS4400 HW1".
2. Created a new bucket in GC named "cis4400_hw1_kyt". The bucket is made public.
3. Created a service account in GC and created a new key with the owner permission granted. Downloaded the configuration file with the service account key in JSON format and established connection link to the python script to first extract source data and then store it in GC.
4. Used Google Colab to write python script to gather data from the source and then updated the script to store the data to the Google Cloud bucket.
5. Downloaded the scipt as sourceextraction.ipynb and uploaded it to Visual Studio Code.
6. Executed the code in VS Code to ensure it works and that the source parquet file is stored successfully in the bucket in GC.
7. Wrote a commit message and comitted and pushed the README and the python script into github from VS Code.
8. Confirmed github repository in github updated.
9. Data sourcing and storage completed.

# Dimensional modeling was created. Empty tables were created in BigQuery. 

10. Used python script to do ETL. Extracted data from Google Cloud bucket and made a copy of the dataframe in df_copy. 
11. Performed data cleaning, reformatting and transformation on the copy of the dataframe.

# Dimensional modeling was updated for Redshift.

12. The transformed data was loaded into the tables in Redshift.